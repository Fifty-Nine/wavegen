#!/bin/sh

srcdir=$1
bindir=$2

rev=`cd $srcdir; git describe --always`

cd $bindir

sed -re "s/%GIT_REVISION%/$rev/g" $srcdir/version.cpp.in >version-new.cpp

if ! diff -q $bindir/version-new.cpp $bindir/version.cpp; then
  mv $bindir/version-new.cpp $bindir/version.cpp
fi
rm -f $bindir/version-new.cpp
