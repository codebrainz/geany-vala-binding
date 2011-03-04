#!/usr/bin/make -f
# This is a GNU Makefile
#
# Distributed under GNU GPL v2+, see COPYING and AUTHORS for details
#

include build/silent.mk


# Variables

SUBDIRS = example

PACKAGE = geany
VERSION = 0.1

MKDIR_P ?= mkdir -p
INSTALL ?= install
VALADOC ?= valadoc
VALADOCFLAGS = --basedir=./ \
               --vapidir=./ \
               --package-name=$(PACKAGE) \
               --package-version=$(VERSION) \
               --force \
               --verbose
VALADOC_GEN_DEPS ?= no
ifeq ($(VALADOC_GEN_DEPS),yes)
VALADOCFLAGS += --deps
endif

DESTDIR ?= 
PREFIX  ?= /usr/local

VAPIDIR = $(PREFIX)/share/vala/vapi


# Functions

mkdir_p = (test -d "$(1)" || $(MKDIR_P) "$(1)")


# Targets & rules

all:
install: install-vapi
distclean: distclean-doc-html distclean-doc-devhelp

.PHONY: all clean distclean

all clean distclean install:
	@ \
	for d in $(SUBDIRS); do \
		$(MAKE) -C $$d $@; \
	done

# documentation generation
doc: doc/html doc/devhelp

doc/html: geany.vapi
	$(AM_V_GEN) \
	$(call mkdir_p,$@) && \
	$(VALADOC) $(VALADOCFLAGS) -o "$@" --doclet=html $< && \
	touch "$@"
distclean-doc-html:
	$(AM_V_TARGET) rm -f -r doc/html

doc/devhelp: geany.vapi
	$(AM_V_GEN) \
	$(call mkdir_p,$@) && \
	$(VALADOC) $(VALADOCFLAGS) -o "$@" --doclet=devhelp $< && \
	touch "$@"
distclean-doc-devhelp:
	$(AM_V_TARGET) rm -f -r doc/devhelp

# VAPI installaion
install-vapi: geany.vapi geany.deps
	$(AM_V_TARGET) \
	$(call mkdir_p,$(DESTDIR)$(VAPIDIR)) && \
	$(INSTALL) -m 644 $^ "$(DESTDIR)$(VAPIDIR)"
