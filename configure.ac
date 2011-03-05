AC_PREREQ([2.64])
AC_INIT([geany-vala-binding],
		[0.1],
		[lists.ban@herbesfolles.org])
AC_CONFIG_SRCDIR([geany.vapi])
AC_CONFIG_MACRO_DIR([build/m4])
AC_CONFIG_AUX_DIR([build/m4])
AM_INIT_AUTOMAKE([-Wall -Werror foreign])
AC_CONFIG_HEADERS([config.h])

m4_ifdef([AM_SILENT_RULES], [AM_SILENT_RULES([yes])])

LT_PREREQ([2.2.0])
LT_INIT
AC_PROG_CC
AM_PROG_VALAC([0.7.0])
AC_PROG_INSTALL
AC_PROG_MKDIR_P

# Check for dependencies
PKG_CHECK_MODULES([GTK], [gtk+-2.0])
PKG_CHECK_MODULES([GEANY], [geany])

# check for ValaDoc
AC_ARG_ENABLE(valadoc,
			  AS_HELP_STRING([--enable-valadoc],
							 [enable valadoc support @<:@default=auto@:>@]),
			  [enable_valadoc="$enableval"],
			  [enable_valadoc="auto"])

found_valadoc=no
AS_IF([test "x$enable_valadoc" != "xno"],
	  [AC_PATH_PROG(VALADOC, valadoc, :)
	   AS_IF([test -x "$VALADOC"],
			 [found_valadoc=yes
			  AC_SUBST(VALADOC)],
			 [AS_IF([test "x$enable_valadoc" == "xyes"],
					AC_MSG_ERROR([Unable to find valadoc]))])])
AM_CONDITIONAL(ENABLE_VALADOC, test x$found_valadoc = xyes)

# Output
AC_CONFIG_FILES([Makefile
				 examples/Makefile
				 doc/Makefile])
AC_OUTPUT
