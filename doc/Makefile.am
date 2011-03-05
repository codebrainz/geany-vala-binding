if ENABLE_VALADOC

AM_VALADOCFLAGS =	--basedir=$(top_builddir) 				\
					--vapidir=$(top_builddir) 				\
					--package-name=$(PACKAGE_NAME) 			\
					--package-version=$(PACKAGE_VERSION)	\
					--verbose \
					--force \
					$(VALADOCFLAGS)

htmldocdir = $(docdir)/html
# where does DevHelp look for books?
devhelpdir = $(docdir)/devhelp


all: stamp-htmldoc stamp-devhelpdoc

stamp-htmldoc: $(top_builddir)/geany.vapi
	$(AM_V_GEN) $(VALADOC) $(AM_VALADOCFLAGS) -o htmldoc --doclet=html $^ && \
	touch $@

stamp-devhelpdoc: $(top_builddir)/geany.vapi
	$(AM_V_GEN) $(VALADOC) $(AM_VALADOCFLAGS) -o devhelpdoc --doclet=devhelp $^ && \
	touch $@

clean-local:
	rm -rf htmldoc devhelpdoc stamp-htmldoc stamp-devhelpdoc

uninstall-local:
	rm -rf "$(DESTDIR)$(htmldocdir)"
	rm -rf "$(DESTDIR)$(devhelpdir)"

install-htmldoc: stamp-htmldoc
	find htmldoc -type f | while read f; do \
		inst_dir="$(DESTDIR)$(htmldocdir)/$$(dirname "$$f" | sed 's%^htmldoc%%')"; \
		(test -d "$$inst_dir" || $(MKDIR_P) "$$inst_dir") || exit 1; \
		$(INSTALL_DATA) "$$f" "$$inst_dir" || exit 1; \
	done

install-devhelpdoc: stamp-devhelpdoc
	find devhelpdoc -type f | while read f; do \
		inst_dir="$(DESTDIR)$(devhelpdir)/$$(dirname "$$f" | sed 's%^devhelpdoc%%')"; \
		(test -d "$$inst_dir" || $(MKDIR_P) "$$inst_dir") || exit 1; \
		$(INSTALL_DATA) "$$f" "$$inst_dir" || exit 1; \
	done

install-data-local: install-htmldoc install-devhelpdoc

endif #ENABLE_VALADOC
