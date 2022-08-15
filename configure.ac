dnl                                               -*- Autoconf -*-
dnl Process this file with autoconf to produce a configure script.

AC_PREREQ([2.69])
AC_INIT([cpp-project], [0.0.1], [bugs@cpp-project.com])

AC_CONFIG_MACRO_DIR([m4])
AC_CONFIG_SRCDIR([src])
AC_CONFIG_HEADERS([config.h])
AC_CONFIG_FILES([Makefile])

AC_CANONICAL_HOST

dnl Helps with detection of specific OSes when this is built in a CI server
AC_ARG_VAR([BUILD_SERVER], [Use this to alter compile flags or disable features on CI/CD build servers])
AM_CONDITIONAL([HAVE_BUILD_SERVER], [ test -n "${BUILD_SERVER}" && test "x${BUILD_SERVER}" != "xno" ])

AM_COND_IF([HAVE_BUILD_SERVER],
	  AC_MSG_NOTICE([Buildserver detected. Some features might be disabled.]),
)

dnl Predefine some shell variables for error messages
err_inplace_build="In-place builds are forbidden

Try:
$ mkdir build && cd build ;
$ ../configure
"

AC_MSG_CHECKING([that this is an out-of-source build])
case $srcdir in
	.)  dnl We are building in place
		dnl Forbid users from building outside a build directory. No in-place builds!!
		AC_MSG_RESULT([no])
		AC_MSG_ERROR([$err_inplace_build])
		AS_EXIT(255)
		;;
	*)
		AC_MSG_RESULT([yes])
		;;
esac

dnl link the project resources/ directory to the build directory
AC_CONFIG_LINKS([${builddir}resources:${top_srcdir}resources])
AM_INIT_AUTOMAKE([1.15] [foreign subdir-objects dist-xz])
AM_SILENT_RULES([yes])

dnl libtool support
LT_INIT

dnl pkg-config support
PKG_PROG_PKG_CONFIG dnl enable pkg-config support

dnl Checks for programs.
dnl AC_PROG_RANLIB
AC_PROG_CXX
AX_CXX_COMPILE_STDCXX(17, [noext], [mandatory])

dnl check for compiledb. Useful to generate .clang_completion information for
dnl vim autocomplete
AC_CHECK_PROG([_ac_compiledb_detected], [compiledb], [true], [false])
AM_CONDITIONAL([HAVE_COMPILEDB], [test x$_ac_compiledb_detected = xtrue ])

AM_COND_IF([HAVE_COMPILEDB],
	  AC_MSG_NOTICE([compiledb found!  vim-completion make target enabled]),
	  AC_MSG_WARN([compiledb not found. vim-completion make target disabled])
)

dnl Checks for libraries.
dnl PKG_CHECK_MODULES([SDL2], [sdl2 >= 2 SDL2_image >= 0.29.0 SDL2_gfx >= 1.0.2])

dnl AC_REQUIRE_HEADER([stdint.h])

dnl Switch to C++ mode
AC_LANG_PUSH([C++])

BOOST_REQUIRE([1.7.2])
dnl BOOST_SYSTEM([mt-sdg])
dnl BOOST_FILESYSTEM([mt-sdg])

PKG_CHECK_MODULES([CATCH2], [catch2-with-main >= 2.13.7])

dnl Example Qt5 integration
dnl PKG_CHECK_MODULES([QT], [Qt5Core >= 5.15 Qt5Widgets Qt5Gui], [
dnl 	QT_PATH="$(eval $PKG_CONFIG --variable=exec_prefix Qt5Core)"
dnl 	QT_HOST_PATH="$(eval $PKG_CONFIG --variable=host_bins Qt5Core)"
dnl 	QT_VERSION="$(eval $PKG_CONFIG --modversion Qt5Gui)"
dnl 	AC_PATH_PROGS(MOC, [moc-qt5 moc], moc, ["${QT_HOST_PATH}" "${QT_PATH}/bin"])
dnl     AC_PATH_PROGS(RCC, [rcc-qt5 rcc], rcc, ["${QT_HOST_PATH}" "${QT_PATH}/bin"])
dnl     AC_PATH_PROGS(UIC, [uic-qt5 uic], uic, ["${QT_HOST_PATH}" "${QT_PATH}/bin"])
dnl     AC_PATH_PROGS(QMLCACHE, [qmlcachegen-qt5 qmlcachegen], no, ["${QT_HOST_PATH}" "${QT_PATH}/bin"])
dnl ])
AC_LANG_POP

dnl Check if we have a libexecinfo.
dnl On non-glibc systems, using backtrace requires linking to libexecinfo.o
dnl AC_CHECK_HEADERS([execinfo.h])
dnl AC_CHECK_LIB([execinfo], [backtrace],
dnl      [LIBS="${LIBS} -lexecinfo"; BOOST_FIND_HEADER([boost/stacktrace.hpp])])
dnl
dnl AC_CHECK_FUNCS([backtrace backtrace_symbols])
dnl
dnl AC_CHECK_LIB([pthread], [pthread_create])

AC_OUTPUT
