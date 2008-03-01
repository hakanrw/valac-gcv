#!/bin/bash
# testrunner.sh
#
# Copyright (C) 2006-2007  Jürg Billeter
#
# This library is free software; you can redistribute it and/or
# modify it under the terms of the GNU Lesser General Public
# License as published by the Free Software Foundation; either
# version 2.1 of the License, or (at your option) any later version.
#
# This library is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
# Lesser General Public License for more details.
#
# You should have received a copy of the GNU Lesser General Public
# License along with this library; if not, write to the Free Software
# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301  USA
#
# Author:
# 	Jürg Billeter <j@bitron.ch>

builddir=$PWD
topbuilddir=$builddir/..
srcdir=`dirname $0`
topsrcdir=$srcdir/..
vapidir=$topsrcdir/vapi
exe=$EXEEXT

export G_DEBUG=fatal_warnings

VALAC=$topbuilddir/compiler/valac
CC="gcc -std=c99"
CFLAGS="-O0 -g3 -I$topsrcdir -I$topbuilddir"
LDLIBS="-lm ../gee/.libs/libgee.a"

CODE=0

for testcasesource in "$@"
do
	testsrc=${testcasesource/.vala/}
	testbuild=`basename "$testsrc"`
	if ! $VALAC --vapidir "$vapidir" --pkg gee-1.0 --basedir $topsrcdir -d $topbuilddir $testsrc.vala > $testbuild.err 2>&1
	then
		CODE=1
		continue
	fi
	if ! $CC $CFLAGS $testbuild.c $(pkg-config --cflags --libs gobject-2.0) -o $testbuild $LDLIBS > $testbuild.err 2>&1
	then
		CODE=1
		continue
	fi
	if ./$testbuild 2>&1 | tee $testbuild.err | cmp -s $testsrc.exp
	then
		rm $testbuild.c $testbuild.h $testbuild$exe $testbuild.err
	else
		CODE=1
	fi
done

exit $CODE
