#!/bin/sh

wget https://ftp.gnu.org/gnu/diffutils/diffutils-3.7.tar.xz
tar xf diffutils-3.7.tar.xz
cd diffutils-3.7
mingw64-configure --disable-nls LDFLAGS="-static" CFLAGS="-DSIGSTOP=SIGINT -DSIGTSTP=SIGINT -DSIGALRM=SIGINT -DSIGHUP=SIGINT -DSIGQUIT=SIGINT -DSIGPIPE=SIGINT"
make
ls src/*.exe

# LDFLAGS="-static" avoids
# diff needs /usr/x86_64-w64-mingw32/sys-root/mingw/bin/libwinpthread-1.dll
# dnf install mingw64-winpthreads-static
