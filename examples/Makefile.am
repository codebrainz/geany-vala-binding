
noinst_LTLIBRARIES	= gplugin.la	\
					  signaltest.la

AM_LDFLAGS		= -module -avoid-version -shared
AM_CFLAGS		= @GTK_CFLAGS@ @GEANY_CFLAGS@
AM_VALAFLAGS	= --vapidir $(top_builddir)	\
				  --pkg gtk+-2.0			\
				  --pkg geany

gplugin_la_SOURCES			= gplugin.vala
gplugin_la_LIBADD			= @GTK_LIBS@ @GEANY_LIBS@

signaltest_la_SOURCES		= signaltest.vala
signaltest_la_LIBADD		= @GTK_LIBS@ @GEANY_LIBS@
