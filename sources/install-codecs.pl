#!/usr/bin/perl
# Independent codec installation recipe, Copyright (c) 2026 Angry Thread.
# SPDX-License-Identifier: GPL-2.0-or-later
use strict;
use warnings;
use Cwd qw(abs_path);
use Fcntl qw(:DEFAULT :flock O_NOFOLLOW);
use File::Basename qw(dirname);
use File::Temp qw(tempdir);
use Digest::SHA qw(sha256_hex);
use JSON::PP;
@ARGV == 2 or die "Usage: install-codecs.pl BUILT_BIN_DIRECTORY INSTALLED_BGDD_DIRECTORY\n";
my $built = abs_path($ARGV[0]) // die "Build directory missing\n";
my $root = abs_path($ARGV[1]) // die "Installation missing\n";
$root eq $ARGV[1] && $root =~ m{/Library/Application Support/BGDD$} or die "Canonical BGDD user installation required\n";
my $json = JSON::PP->new->utf8->canonical->pretty;
sub plain {
    my ($p,$dir) = @_; my @s = lstat($p);
    @s && !-l _ && ($dir ? -d _ : -f _) && $s[4] == $< && ($dir || $s[3] == 1) or die "Unowned, linked or unexpected file: $p\n";
}
sub bytes {
    my ($p)=@_; plain($p,0); sysopen(my $f,$p,O_RDONLY|O_NOFOLLOW) or die "Cannot read $p\n";
    binmode($f); local $/; my $v=<$f>; close($f) or die "Cannot close $p\n"; return $v // '';
}
sub decoded { my $v=$json->decode(bytes($_[0])); ref($v) eq 'HASH' or die "JSON object required\n"; return $v }
sub command { system {$_[0]} @_; $? == 0 or die "System operation failed: $_[0] ($?)\n" }
sub output { open(my $f,'-|',@_) or die "Cannot inspect component\n"; local $/; my $v=<$f>; close($f) or die "Inspection failed\n"; return $v // '' }
sub quarantine {
    my ($p)=@_; my $names=output('/usr/bin/xattr',$p);
    return undef unless grep {$_ eq 'com.apple.quarantine'} split(/\n/,$names);
    my $v=output('/usr/bin/xattr','-px','com.apple.quarantine',$p); $v =~ s/\s//g;
    $v =~ /^[a-fA-F0-9]+$/ or die "Invalid quarantine bytes\n"; return lc($v);
}
sub fresh {
    my ($p,$data)=@_; sysopen(my $f,$p,O_WRONLY|O_CREAT|O_EXCL|O_NOFOLLOW,0600) or die "Cannot stage $p\n";
    binmode($f); print {$f} $data or die "Cannot write $p\n"; close($f) or die "Cannot finish $p\n";
}
sub move_absent { my ($a,$b)=@_; !-e $b && !-l $b or die "Destination exists\n"; rename($a,$b) or die "Move failed: $!\n" }
for my $d ($root,"$root/state",dirname($root),$built) { plain($d,1) }
my $owner=decoded("$root/.bgdd-distribution-owner.json");
$owner->{product} eq 'fr.bgdd.distribution' && $owner->{extensionID} eq 'ipjganpibkpndaibhejdcnbdclekogbl' or die "Owned BGDD distribution required\n";
my $lockpath=dirname($root).'/.bgdd-distribution.lock'; plain($lockpath,0) if -e $lockpath || -l $lockpath;
sysopen(my $maintenance,$lockpath,O_RDWR|O_CREAT|O_NOFOLLOW,0600) or die "Cannot open maintenance lock\n";
flock($maintenance,LOCK_EX|LOCK_NB) or die "BGDD maintenance active\n";
plain("$root/state/host.lock",0); sysopen(my $host,"$root/state/host.lock",O_RDWR|O_NOFOLLOW) or die "Cannot open host lock\n";
flock($host,LOCK_EX|LOCK_NB) or die "A BGDD operation is active; finish it first\n";
my $ledger=decoded("$root/distribution-manifest.json");
($ledger->{engineLayout}//'') eq 'engine-app-v2' && $ledger->{extensionID} eq $owner->{extensionID} && ref($ledger->{files}) eq 'HASH' or die "engine-app-v2 required\n";
my $appname='BGDD Engine.app'; my $app="$root/$appname";
for my $d ($app,"$app/Contents","$app/Contents/MacOS","$app/Contents/_CodeSignature") { plain($d,1) }
command('/usr/bin/codesign','--verify','--deep','--strict',$app);
my (%original,%q);
for my $name (sort keys %{$ledger->{files}}) {
    $name !~ m{[\\\x00-\x1f\x7f]} && $name !~ m{^/} && !grep {$_ eq '' || $_ eq '.' || $_ eq '..'} split(m{/},$name,-1) or die "Unsafe ledger path\n";
    next unless $name =~ m{^native/\Q$appname\E/(.+)$}; my $rel=$1; my $p="$app/$rel";
    abs_path($p) eq $p && sha256_hex(bytes($p)) eq $ledger->{files}{$name} or die "Existing component differs from ledger\n";
    $original{$rel}=$ledger->{files}{$name}; $q{$rel}=quarantine($p);
}
my $appq=quarantine($app); my $deps=decoded("$root/dependencies.json"); my $integrity=decoded("$root/integrity.json");
my @metadata=qw(dependencies.json integrity.json distribution-manifest.json);
for my $name (@metadata) { plain("$root/$name",0) }
my $backup=tempdir('BGDD-codec-backup-XXXXXXXX',DIR=>dirname($root),CLEANUP=>0); my $stage="$backup/replacement.app";
mkdir($stage,0700) or die "Cannot create new app envelope\n";
command('/usr/bin/ditto','--rsrc','--extattr','--acl',"$app/Contents","$stage/Contents");
my $freshq=sprintf('0083;%x;BGDD-codec-rebuild;',time);
command('/usr/bin/xattr','-w','com.apple.quarantine',$freshq,$stage);
for my $rel (sort keys %original) {
    sha256_hex(bytes("$stage/$rel")) eq $original{$rel} && (quarantine("$stage/$rel")//'') eq ($q{$rel}//'') or die "Copy changed bytes/quarantine; original untouched\n";
}
# The new envelope is unapproved; the original envelope remains untouched.
my $staged_appq=quarantine($stage);
for my $codec (qw(ffmpeg ffprobe)) {
    my $src="$built/$codec"; plain($src,0); -x $src or die "Codec must be executable\n";
    my $archs=output('/usr/bin/lipo','-archs',$src); grep {$_ eq $ledger->{architecture}} split(/\s+/,$archs) or die "Incompatible codec architecture\n";
    my $rel="Contents/MacOS/$codec"; exists($original{$rel}) && exists($integrity->{"$appname/$rel"}) or die "Missing codec ledger entry\n";
    my $new="$stage/$rel.new"; command('/usr/bin/ditto','--rsrc','--extattr','--acl',$src,$new);
    if (!defined(quarantine($src))) {
        # New local code gets ordinary unapproved quarantine, never approval
        # copied from the old codec. The user decides any macOS opening prompt.
        command('/usr/bin/xattr','-w','com.apple.quarantine',sprintf('0083;%x;BGDD-codec-rebuild;',time),$new);
    } else { (quarantine($new)//'') eq quarantine($src) or die "Source quarantine changed\n" }
    my $newq=quarantine($new); chmod(0700,$new) or die "Cannot protect codec\n";
    system('/usr/bin/codesign','--verify','--strict',$new);
    command('/usr/bin/codesign','--force','--sign','-','--timestamp=none','--identifier',$codec,$new) if $? != 0;
    command('/usr/bin/codesign','--verify','--strict',$new);
    (quarantine($new)//'') eq ($newq//'') or die "Codec signing changed quarantine\n";
    rename($new,"$stage/$rel") or die "Cannot stage codec\n";
}
# The entry's signature will change. Give this new file its own ordinary
# quarantine, never a copied approval belonging to the old signed entry.
my $entry="$stage/Contents/MacOS/bgdd-engine";
fresh("$entry.new",bytes($entry)); chmod(0700,"$entry.new") or die "Cannot protect entry\n";
command('/usr/bin/xattr','-w','com.apple.quarantine',$freshq,"$entry.new");
rename("$entry.new",$entry) or die "Cannot stage entry\n";
my $entryq=quarantine($entry);
# Only renew the outer ad hoc resource seal, retaining nested code identities.
command('/usr/bin/codesign','--force','--sign','-','--timestamp=none','--identifier','fr.bgdd.engine',$stage);
command('/usr/bin/codesign','--verify','--deep','--strict',$stage);
my %allowed=map {$_=>1} ('Contents/MacOS/ffmpeg','Contents/MacOS/ffprobe','Contents/MacOS/bgdd-engine','Contents/_CodeSignature/CodeResources');
for my $rel (sort keys %original) {
    my $hash=sha256_hex(bytes("$stage/$rel")); !$allowed{$rel} && $hash ne $original{$rel} and die "Unexpected original code change\n";
    if (!$allowed{$rel}) { (quarantine("$stage/$rel")//'') eq ($q{$rel}//'') or die "Existing quarantine changed\n" }
    $ledger->{files}{"native/$appname/$rel"}=$hash; $integrity->{"$appname/$rel"}=$hash;
}
(quarantine($stage)//'') eq ($staged_appq//'') && (quarantine($entry)//'') eq ($entryq//'') or die "New code quarantine changed during signing\n";
for my $codec (qw(ffmpeg ffprobe)) { $deps->{binaries}{$codec}=$integrity->{"$appname/Contents/MacOS/$codec"} }
$deps->{ffmpeg}{build}='User-rebuilt codecs; not an unchanged official BGDD payload';
my %data; $data{'dependencies.json'}=$json->encode($deps); $integrity->{'dependencies.json'}=sha256_hex($data{'dependencies.json'});
$data{'integrity.json'}=$json->encode($integrity);
for my $name (qw(dependencies.json integrity.json)) { $ledger->{files}{"native/$name"}=sha256_hex($data{$name}) }
$data{'distribution-manifest.json'}=$json->encode($ledger);
for my $name (@metadata) { fresh("$backup/new-$name",$data{$name}) }
my (@saved,@written); my ($saved_app,$new_app)=(0,0);
my $ok=eval {
    move_absent($app,"$backup/original.app"); $saved_app=1; move_absent($stage,$app); $new_app=1;
    for my $name (@metadata) { move_absent("$root/$name","$backup/original-$name"); push(@saved,$name); move_absent("$backup/new-$name","$root/$name"); push(@written,$name) }
    command('/usr/bin/codesign','--verify','--deep','--strict',$app); 1;
};
if (!$ok) {
    my $error=$@;
    for my $name (reverse @written) { move_absent("$root/$name","$backup/failed-$name") }
    for my $name (reverse @saved) { move_absent("$backup/original-$name","$root/$name") }
    move_absent($app,"$backup/failed.app") if $new_app; move_absent("$backup/original.app",$app) if $saved_app;
    die "Replacement failed; original files restored: $error Backup: $backup\n";
}
print "User-rebuilt codecs installed; bundle seal and local ledgers updated.\n";
print "Original app and metadata retained at: $backup\n";
print "No existing quarantine or security policy was removed. New code may require human macOS approval.\n";
