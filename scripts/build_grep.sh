#!/bin/sh

# TODO: Needs PCRE support, and maybe other dependencies?

cd $BUILD
wget http://ftp.gnu.org/gnu/grep/grep-${GREP_VER}.tar.xz
tar xf grep-${GREP_VER}.tar.xz
cd grep-${GREP_VER}
# Static to avoid depending on libpcre.dll at runtime
mingw64-configure LDFLAGS="-static" --disable-nls
make
zip -j9 ${TARGET}/grep-${GREP_VER}.zip */*.exe

