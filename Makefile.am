srcdir = @srcdir@
VPATH = @srcdir@

ACLOCAL_AMFLAGS=-I m4
# Variable declarations to be reused and appended with targets
bin_PROGRAMS=
check_PROGRAMS=
noinst_LIBRARIES=

noinst_LTLIBRARIES=
pkglib_LTLIBRARIES=
include_HEADERS=

EXTRA_LIBRARIES=

phony_targets=
warning_flags=
disabled_warnings=

#qt5_extra_cxxflags=-fPIC -DPIC

warning_flags+=-Werror -Wall

#example:
#if HAVE_BUILD_SERVER
#disabled_warnings+=-Wno-c++20-extensions
#else
#warning_flags+=-pedantic
#endif

warning_flags+=-pedantic

project_include_flags=
project_include_flags+=-I ${srcdir}/src

#example third party lib
#project_include_flags+=$(NLOHMANN_JSON_CFLAGS)


AM_CFLAGS=
AM_CXXFLAGS=
AM_CPPFLAGS=

AM_CFLAGS+=${warning_flags}
AM_CXXFLAGS+= ${warning_flags} ${disabled_warnings}
AM_CPPFLAGS+=$(project_include_flags)

# example third-party libs
#AM_LDFLAGS=$(NLOHMANN_JSON_LIBS)

#rebuild-qtforms:
#	$(abs_top_srcdir)/rebuild-qtforms.sh

#run: ${bin_PROGRAMS}
#	@./quartz-warriors

# Always make sure the resources/ folder is linked to the build directory
all-am: @top_builddir@/resources

include src/Makefile.am
include editorconfig/vim-completion.am
.PHONY:  $(phony_targets)
# vim: set ts=4 sts=4 noet foldmethod=marker foldmarker=#region,#endregion :
