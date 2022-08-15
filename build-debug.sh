#!/bin/sh

BASE_DIR="$(cd "$(dirname "$0")"; pwd)";

die() {
	echo "An error has occured. Stopping"
	return 1
}

mkdir -pv $BASE_DIR/debug
cd  $BASE_DIR/debug

. $BASE_DIR/debug.env

if [ ! -f ${PWD}/config.status ]; then
	${BASE_DIR}/configure $@ || die
fi

# build with NICE=15 so as to not hog the processor
nice -n 15 make -j 1 V=1 check all
