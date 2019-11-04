#!/bin/sh

dnf install -y mingw64-gcc mingw64-winpthreads-static mingw64-pcre wget zip xz make
wget http://ftp.gnu.org/gnu/sed/sed-4.7.tar.xz
tar xf sed-4.7.tar.xz
cd sed-4.7
mingw64-configure --disable-i18n --disable-nls
make sed/sed.exe
zip -j9 ../sed-4.7.zip */*.exe
