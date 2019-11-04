#!/bin/sh

cd $BUILD
wget http://ftp.gnu.org/gnu/sed/sed-${SED_VER}.tar.xz
tar xf sed-${SED_VER}.tar.xz
cd sed-${SED_VER}
mingw64-configure --disable-i18n --disable-nls
make sed/sed.exe
zip -j9 ${TARGET}/sed-${SED_VER}.zip */*.exe
