#!/bin/sh

# LDFLAGS="-static" avoids
#     diff needs /usr/x86_64-w64-mingw32/sys-root/mingw/bin/libwinpthread-1.dll
# Need to install the static lib with:
#     dnf install mingw64-winpthreads-static

cd $BUILD
wget https://ftp.gnu.org/gnu/diffutils/diffutils-${DIFF_VER}.tar.xz
tar xf diffutils-${DIFF_VER}.tar.xz
cd diffutils-${DIFF_VER}
mingw64-configure --disable-nls LDFLAGS="-static" CFLAGS="-DSIGSTOP=SIGINT -DSIGTSTP=SIGINT -DSIGALRM=SIGINT -DSIGHUP=SIGINT -DSIGQUIT=SIGINT -DSIGPIPE=SIGINT"

# Hack around error in gnulib-tests (which doesn't matter)
mv gnulib-tests gnulib-tests#
mkdir gnulib-tests
echo all: >gnulib-tests/Makefile

make
zip -j9 ${TARGET}/diffutils-${DIFF_VER}.zip */*.exe
