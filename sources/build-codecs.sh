#!/bin/sh
# Independent corresponding-source recipe for FFmpeg/x264/LAME/dav1d only.
# Copyright (c) 2026 Angry Thread.
# SPDX-License-Identifier: GPL-2.0-or-later
# This recipe is separate from the proprietary BGDD application. It contains
# no BGDD host, extension, installer, runtime protocol or private build module.
set -eu

CODEC_SOURCE_DIR=$(CDPATH= cd -- "$(dirname -- "$0")" && /bin/pwd -P)
CODEC_ARCHIVE_DIR=${1:-$CODEC_SOURCE_DIR}
CODEC_OUTPUT_DIR=${2:-$CODEC_SOURCE_DIR/build-output}
case "$CODEC_ARCHIVE_DIR" in /*) ;; *) CODEC_ARCHIVE_DIR="$PWD/$CODEC_ARCHIVE_DIR" ;; esac
case "$CODEC_OUTPUT_DIR" in /*) ;; *) CODEC_OUTPUT_DIR="$PWD/$CODEC_OUTPUT_DIR" ;; esac
CODEC_ARCH=${3:-$(/usr/bin/uname -m)}
if [ "$#" -gt 3 ]; then
    echo 'Usage: build-codecs.sh [directory-containing-source-archives] [empty-output-directory] [arm64|x86_64]' >&2
    exit 64
fi
case "$CODEC_ARCH" in arm64|x86_64) ;; *) echo 'Unsupported architecture' >&2; exit 65 ;; esac
# Cross-compilation is a build artifact, never native runtime qualification.
CODEC_CROSS_FLAGS=''
CODEC_X264_HOST=''
CODEC_LAME_HOST=''
if [ "$(/usr/bin/uname -m)" != "$CODEC_ARCH" ]; then
    CODEC_CROSS_FLAGS='--enable-cross-compile --target-os=darwin'
    CODEC_X264_HOST='--host=x86_64-apple-darwin'
    CODEC_LAME_HOST='--host=x86_64-apple-darwin'
fi
if [ -L "$CODEC_OUTPUT_DIR" ]; then
    echo 'A symbolic-link output directory is refused.' >&2
    exit 65
fi
/bin/mkdir -p "$CODEC_OUTPUT_DIR"
if [ -n "$(/bin/ls -A "$CODEC_OUTPUT_DIR")" ]; then
    echo 'The output directory must be empty; no existing files are removed.' >&2
    exit 65
fi
CODEC_OUTPUT_DIR=$(CDPATH= cd -- "$CODEC_OUTPUT_DIR" && /bin/pwd -P)
CODEC_ARCHIVE_DIR=$(CDPATH= cd -- "$CODEC_ARCHIVE_DIR" && /bin/pwd -P)

verify_source() {
    actual=$(/usr/bin/shasum -a 256 "$CODEC_ARCHIVE_DIR/$1")
    actual=${actual%% *}
    if [ "$actual" != "$2" ]; then
        echo "Source archive integrity failed: $1" >&2
        exit 65
    fi
}
verify_source ffmpeg-9.0.2.tar.xz 8c3850283eb25fa026482078a04051e0be17347b09ef81a0849bec15a96e002e
verify_source x264-0480cb05.tar.gz be32b1e787ca8e905c10b956d2a5be0b99847deea2ff53be0cd93e488cd90323
verify_source lame-4.0.tar.gz 3df5124d5ad3a98312ffd7ba6a9b36230e4f8a3e66d3ce0f425e336c32d216eb

verify_source dav1d-1.5.4.tar.xz 686616b7c69eb88d44459391ab25cac13b6647a3b288835c5784e71c1514a5c5

# Only the active Xcode toolchain and macOS system build tools are used.
CODEC_MESON=$(command -v meson)
CODEC_NINJA=$(command -v ninja)
CODEC_NASM_DIR='' 
CODEC_CPU_FLAGS=''
CODEC_CPU=generic
CODEC_ASM_FLAGS=''
if [ "$CODEC_ARCH" = x86_64 ]; then
    CODEC_NASM=$(command -v nasm)
    CODEC_NASM_DIR=$(dirname "$CODEC_NASM")
    CODEC_CPU_FLAGS='-march=x86-64 -mtune=generic'
    CODEC_CPU=x86-64
fi
PATH=$(dirname "$CODEC_MESON"):$(dirname "$CODEC_NINJA"):${CODEC_NASM_DIR:+$CODEC_NASM_DIR:}/usr/bin:/bin:/usr/sbin:/sbin
CC=/usr/bin/clang
CXX=/usr/bin/clang++
AR=/usr/bin/ar
RANLIB=/usr/bin/ranlib
NM=/usr/bin/nm
MACOSX_DEPLOYMENT_TARGET=26.0
CFLAGS="-O3 -arch $CODEC_ARCH -mmacosx-version-min=26.0 $CODEC_CPU_FLAGS"
CXXFLAGS="$CFLAGS"
LDFLAGS="-arch $CODEC_ARCH -mmacosx-version-min=26.0"
export PATH CC CXX AR RANLIB NM MACOSX_DEPLOYMENT_TARGET CFLAGS CXXFLAGS LDFLAGS

/bin/mkdir "$CODEC_OUTPUT_DIR/x264" "$CODEC_OUTPUT_DIR/bin" "$CODEC_OUTPUT_DIR/licenses" "$CODEC_OUTPUT_DIR/stage"
/usr/bin/tar -xf "$CODEC_ARCHIVE_DIR/ffmpeg-9.0.2.tar.xz" -C "$CODEC_OUTPUT_DIR"
/usr/bin/tar -xf "$CODEC_ARCHIVE_DIR/lame-4.0.tar.gz" -C "$CODEC_OUTPUT_DIR"
/usr/bin/tar -xf "$CODEC_ARCHIVE_DIR/x264-0480cb05.tar.gz" -C "$CODEC_OUTPUT_DIR/x264"

# LAME 4 requires pkg-config even when its optional decoder is disabled.
# This restricted adapter reports no external package; mpg123 is never linked.
cat > "$CODEC_OUTPUT_DIR/lame-pkg-config" <<'LAME_PKG'
#!/bin/sh
case "$*" in
    --atleast-pkgconfig-version*) exit 0 ;;
    --version) echo 1.0 ;;
    *) exit 1 ;;
esac
LAME_PKG
/bin/chmod 755 "$CODEC_OUTPUT_DIR/lame-pkg-config"

(
    cd "$CODEC_OUTPUT_DIR/lame-4.0"
    PKG_CONFIG="$CODEC_OUTPUT_DIR/lame-pkg-config" ./configure $CODEC_LAME_HOST --disable-decoder --prefix=/bgdd-build --disable-shared --enable-static --disable-frontend --disable-dependency-tracking
    /usr/bin/make -j6
    /usr/bin/make install "DESTDIR=$CODEC_OUTPUT_DIR/stage"
)
(
    cd "$CODEC_OUTPUT_DIR/x264"
    ./configure --prefix=/bgdd-build --enable-static --disable-cli --disable-opencl $CODEC_X264_HOST
    /usr/bin/make -j6
    /usr/bin/make install "DESTDIR=$CODEC_OUTPUT_DIR/stage"
)

/usr/bin/tar -xf "$CODEC_ARCHIVE_DIR/dav1d-1.5.4.tar.xz" -C "$CODEC_OUTPUT_DIR"
CODEC_FAMILY=$CODEC_ARCH
if [ "$CODEC_ARCH" = arm64 ]; then CODEC_FAMILY=aarch64; fi
cat > "$CODEC_OUTPUT_DIR/dav1d-cross.ini" <<CROSS
[binaries]
c = ['/usr/bin/clang', '-arch', '$CODEC_ARCH', '-mmacosx-version-min=26.0']
ar = '/usr/bin/ar'
strip = '/usr/bin/strip'
[host_machine]
system = 'darwin'
cpu_family = '$CODEC_FAMILY'
cpu = '$CODEC_FAMILY'
endian = 'little'
CROSS
"$CODEC_MESON" setup "$CODEC_OUTPUT_DIR/dav1d-build" "$CODEC_OUTPUT_DIR/dav1d-1.5.4" --cross-file "$CODEC_OUTPUT_DIR/dav1d-cross.ini" --prefix=/bgdd-build --libdir=lib --buildtype=release --default-library=static -Denable_tools=false -Denable_tests=false
"$CODEC_NINJA" -C "$CODEC_OUTPUT_DIR/dav1d-build" -j6
DESTDIR="$CODEC_OUTPUT_DIR/stage" "$CODEC_NINJA" -C "$CODEC_OUTPUT_DIR/dav1d-build" install

cat > "$CODEC_OUTPUT_DIR/pkg-config" <<'PKG_CONFIG'
#!/bin/sh
case "$*" in
    *--version*) echo 1.0 ;;
    *--exists*|*--atleast-version*) exit 0 ;;
    *--modversion*dav1d*) echo 1.5.4 ;;
    *--modversion*) echo 0.165 ;;
    *--cflags*) echo '-I../stage/bgdd-build/include' ;;
    *--libs*dav1d*) echo '-L../stage/bgdd-build/lib -ldav1d -lpthread -lm' ;;
    *--libs*) echo '-L../stage/bgdd-build/lib -lx264 -lpthread -lm' ;;
    *) exit 1 ;;
esac
PKG_CONFIG
/bin/chmod 755 "$CODEC_OUTPUT_DIR/pkg-config"

(
    cd "$CODEC_OUTPUT_DIR/ffmpeg-9.0.2"
    ./configure \
        --prefix=/bgdd-build $CODEC_CROSS_FLAGS $CODEC_ASM_FLAGS --arch="$CODEC_ARCH" --cpu="${CODEC_CPU:-generic}" \
        --cc=/usr/bin/clang --cxx=/usr/bin/clang++ \
        --ar=/usr/bin/ar --nm=/usr/bin/nm --ranlib=/usr/bin/ranlib \
        --disable-autodetect --disable-shared --enable-static \
        --disable-doc --disable-debug --disable-ffplay --disable-avdevice \
        --disable-network --disable-encoders \
        --enable-encoder=libx264,libmp3lame,pcm_s24le,pcm_s16le,aac,png,wrapped_avframe,hevc_videotoolbox \
        --disable-filters \
        --enable-filter=scale,pad,format,setsar,fps,aresample,anull,null,rotate,transpose,hflip,vflip \
        --disable-hwaccels --enable-hwaccel=av1_videotoolbox,h264_videotoolbox,hevc_videotoolbox,vp9_videotoolbox --enable-videotoolbox --disable-audiotoolbox --disable-securetransport \
        --enable-zlib --enable-gpl --enable-libx264 --enable-libmp3lame --enable-libdav1d \
        --pkg-config=../pkg-config \
        "--extra-cflags=-I../stage/bgdd-build/include $CFLAGS" \
        "--extra-ldflags=-L../stage/bgdd-build/lib $LDFLAGS"
    /usr/bin/make -j6
)

/bin/cp "$CODEC_OUTPUT_DIR/dav1d-1.5.4/COPYING" "$CODEC_OUTPUT_DIR/licenses/dav1d-BSD-2-Clause.txt"
for codec in ffmpeg ffprobe; do
    /bin/cp "$CODEC_OUTPUT_DIR/ffmpeg-9.0.2/$codec" "$CODEC_OUTPUT_DIR/bin/$codec"
    /bin/chmod 755 "$CODEC_OUTPUT_DIR/bin/$codec"
done
/bin/cp "$CODEC_SOURCE_DIR/build-codecs.sh" "$CODEC_OUTPUT_DIR/licenses/build-codecs.sh"
/bin/cp "$CODEC_OUTPUT_DIR/ffmpeg-9.0.2/COPYING.GPLv2" "$CODEC_OUTPUT_DIR/licenses/FFmpeg-GPL-2.txt"
/bin/cp "$CODEC_OUTPUT_DIR/ffmpeg-9.0.2/COPYING.LGPLv2.1" "$CODEC_OUTPUT_DIR/licenses/FFmpeg-LGPL-2.1.txt"
/bin/cp "$CODEC_OUTPUT_DIR/lame-4.0/COPYING" "$CODEC_OUTPUT_DIR/licenses/LAME-LGPL-2.txt"
/bin/cp "$CODEC_OUTPUT_DIR/x264/COPYING" "$CODEC_OUTPUT_DIR/licenses/x264-GPL-2.txt"
{
    echo "Corresponding-source build recipe: build-codecs.sh; target macOS 26.0, $CODEC_ARCH."
    echo 'dav1d 1.5.4, BSD-2-Clause; SIMD enabled; Intel cross-build is not native qualification.'
    echo 'FFmpeg 9.0.2: GPL-2.0-or-later; static x264 GPL and LAME LGPL components.'
    echo 'No original source patches. Logical /bgdd-build prefix is build-only.'
    echo 'All exact source archives, upstream licences and actual recipe accompany the binaries.'
    /usr/bin/clang --version | /usr/bin/head -1
    if [ "$(/usr/bin/uname -m)" = "$CODEC_ARCH" ]; then "$CODEC_OUTPUT_DIR/bin/ffmpeg" -hide_banner -buildconf 2>&1; fi
} > "$CODEC_OUTPUT_DIR/licenses/FFmpeg-build.txt"
(
    cd "$CODEC_OUTPUT_DIR"
    /usr/bin/shasum -a 256 bin/ffmpeg bin/ffprobe licenses/build-codecs.sh > SHA256SUMS
)
echo "FFmpeg and ffprobe built into: $CODEC_OUTPUT_DIR/bin"
