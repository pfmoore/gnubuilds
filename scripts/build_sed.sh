#!/bin/sh

wget http://ftp.gnu.org/gnu/sed/sed-4.7.tar.xz
tar xf sed-4.7.tar.xz
cd sed-4.z
mingw64-configure --disable-i18n --disable-nls
make sed/sed.exe
ls sed/sed.exe
