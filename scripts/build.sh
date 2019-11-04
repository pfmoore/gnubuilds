#!/bin/sh

SCRIPTLOC=$(dirname "$0")

export BUILD=/tmp
export TARGET=/host

# TODO: libarchive, file, coreutils, (gawk?)

export BC_VER=1.07
export SED_VER=4.7
export DIFF_VER=3.7
export GREP_VER=3.3

sh $SCRIPTLOC/build_bc.sh
sh $SCRIPTLOC/build_sed.sh
sh $SCRIPTLOC/build_diff.sh
sh $SCRIPTLOC/build_grep.sh
