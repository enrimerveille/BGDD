#!/usr/bin/perl
# Independent installation recipe for user-rebuilt FFmpeg/ffprobe only.
# Copyright (c) 2026 Angry Thread.
# SPDX-License-Identifier: GPL-2.0-or-later
# This is codec corresponding-source material, not the proprietary BGDD app.
use strict;
use warnings;
use Cwd qw(abs_path);
use Fcntl qw(:DEFAULT :flock O_NOFOLLOW);
use File::Basename qw(dirname);
use File::Copy qw(copy);
use Digest::SHA qw(sha256_hex);
use JSON::PP;

@ARGV == 2 or die "Usage: install-codecs.pl BUILT_BIN_DIRECTORY INSTALLED_BGDD_DIRECTORY\n";
my $built = abs_path($ARGV[0]) // die "Codec build directory missing\n";
my $root = abs_path($ARGV[1]) // die "Installed BGDD directory missing\n";
$root =~ m{/Library/Application Support/BGDD$} or die "Explicit BGDD user-installation directory required\n";
my $uid = $<;
my $json = JSON::PP->new->utf8->canonical->pretty;
sub regular {
    my ($p) = @_;
    my @s = lstat($p);
    @s && !-l _ && -f _ && $s[4] == $uid or die "Unowned, linked or non-regular file refused: $p\n";
}
sub bytes {
    my ($p) = @_;
    regular($p);
    sysopen(my $f, $p, O_RDONLY | O_NOFOLLOW) or die "Cannot read $p: $!\n";
    binmode($f); local $/; my $b = <$f>; close($f) or die "Cannot close $p: $!\n";
    return defined($b) ? $b : '';
}
sub decoded {
    my ($p) = @_;
    my $x = $json->decode(bytes($p));
    ref($x) eq 'HASH' or die "JSON object required: $p\n";
    return $x;
}
for my $d ($root, "$root/bin", "$root/state", dirname($root)) {
    my @s = lstat($d);
    @s && !-l _ && -d _ && $s[4] == $uid or die "Unowned or linked directory refused: $d\n";
}
my $owner = decoded("$root/.bgdd-distribution-owner.json");
$owner->{product} eq 'fr.bgdd.distribution' && $owner->{extensionID} eq 'ipjganpibkpndaibhejdcnbdclekogbl'
    or die "This installation is not identified as an owned BGDD distribution\n";
my $lockpath = dirname($root) . '/.bgdd-distribution.lock';
if (-e $lockpath || -l $lockpath) { regular($lockpath) }
sysopen(my $maintenance, $lockpath, O_RDWR | O_CREAT | O_NOFOLLOW, 0600) or die "Cannot acquire maintenance file: $!\n";
flock($maintenance, LOCK_EX | LOCK_NB) or die "Another BGDD maintenance operation is active\n";
regular("$root/state/host.lock");
sysopen(my $host, "$root/state/host.lock", O_RDWR | O_NOFOLLOW) or die "Cannot open host lock: $!\n";
flock($host, LOCK_EX | LOCK_NB) or die "A BGDD native operation is active; finish it before replacement\n";
my $ledger = decoded("$root/distribution-manifest.json");
$ledger->{extensionID} eq $owner->{extensionID} && ref($ledger->{files}) eq 'HASH' or die "Installed ledger incompatible\n";
my $deps = decoded("$root/dependencies.json");
ref($deps->{binaries}) eq 'HASH' or die "Dependency inventory incompatible\n";
my $integrity = decoded("$root/integrity.json");
my %changes;
for my $codec (qw(ffmpeg ffprobe)) {
    $changes{"bin/$codec"} = bytes("$built/$codec");
    -x "$built/$codec" or die "Built codec is not executable: $codec\n";
    $ledger->{files}{"native/bin/$codec"} && $integrity->{"bin/$codec"} or die "Codec missing from installed ledgers\n";
    my $hash = sha256_hex($changes{"bin/$codec"});
    $ledger->{files}{"native/bin/$codec"} = $hash;
    $integrity->{"bin/$codec"} = $hash;
    $deps->{binaries}{$codec} = $hash;
}
$deps->{ffmpeg}{build} = 'User-rebuilt standalone codecs; not an unchanged official BGDD payload';
$changes{'dependencies.json'} = $json->encode($deps);
$integrity->{'dependencies.json'} = sha256_hex($changes{'dependencies.json'});
$changes{'integrity.json'} = $json->encode($integrity);
for my $name (qw(dependencies.json integrity.json)) {
    $ledger->{files}{"native/$name"} or die "Metadata absent from installed ledger\n";
    $ledger->{files}{"native/$name"} = sha256_hex($changes{$name});
}
$changes{'distribution-manifest.json'} = $json->encode($ledger);
my $backup = dirname($root) . '/BGDD-codec-backup-' . time . '-' . $$;
mkdir($backup, 0700) or die "Cannot create new codec backup: $!\n";
my %modes;
for my $relative (sort keys %changes) {
    my $dest = "$root/$relative"; regular($dest);
    my @s = stat($dest); $modes{$relative} = $s[2] & 0777;
    (my $flat = $relative) =~ s{/}{--}g;
    copy($dest, "$backup/$flat") or die "Cannot back up $relative: $!\n";
    chmod(0600, "$backup/$flat") or die "Cannot protect backup: $!\n";
}
my @written;
my $ok = eval {
    for my $relative (sort keys %changes) {
        my $dest = "$root/$relative";
        my $temp = "$dest.codec-rebuild-$$";
        sysopen(my $f, $temp, O_WRONLY | O_CREAT | O_EXCL | O_NOFOLLOW, $modes{$relative}) or die "Cannot stage $relative: $!\n";
        binmode($f); print {$f} $changes{$relative} or die "Cannot write $relative: $!\n";
        close($f) or die "Cannot finish $relative: $!\n";
        chmod($modes{$relative}, $temp) or die "Cannot preserve permissions: $!\n";
        rename($temp, $dest) or die "Cannot replace $relative: $!\n";
        push(@written, $relative);
    }
    1;
};
if (!$ok) {
    my $error = $@;
    for my $relative (reverse @written) {
        (my $flat = $relative) =~ s{/}{--}g;
        copy("$backup/$flat", "$root/$relative") or die "Restore required from $backup after $error\n";
        chmod($modes{$relative}, "$root/$relative");
    }
    die "Replacement failed and written files were restored: $error Backup: $backup\n";
}
print "User-rebuilt codecs installed; local hashes updated without changing original BGDD code.\n";
print "Original codec/metadata backup retained at: $backup\n";
print "Official BGDD repair/update may restore official codecs. No private key, security-policy or quarantine changes were performed.\n";
