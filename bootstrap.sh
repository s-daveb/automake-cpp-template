#!/bin/sh

die()
{
	rc=${2:-255}
	echo "Error: ${1}"

	exit ${rc}
}

cmdecho()
{
	need_to_die=1

	if [ "${1}" == "--optional" ] || [ "${1}" == "-o" ]; then
		echo "optional"
		need_to_die=0
		shift;
	fi


	echo "$ ${@}"
	if [ ${need_to_die} -ne 0 ]; then
		${@} || die "${1} returned error code ${?}"
	else
		${@}
	fi

	#return ${?}
}

cmdecho git config -f .gitmodules submodule.third_party/FakeIt.shallow true
cmdecho -o git submodule update --init --recursive


if [ ${?} -ne 0 ]; then
	cmdecho rm -rf third_party/FakeIt

	cmdecho git submodule update --init --recursive
fi

if [ "x$1" == "x-f" ] || [ ! -x ./configure ]; then
	cmdecho autoreconf -iv
fi
if [ ! -x ./configure ]; then
	die "./configure does not exist. Check configure.ac and the autotools!"
fi

#cmdecho ./rebuild-qtforms.sh
