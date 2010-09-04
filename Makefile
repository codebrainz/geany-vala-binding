#!/usr/bin/make -f

SUBDIRS = example

all:

%:
	@ \
	for d in $(SUBDIRS); do \
		$(MAKE) -C $$d $@; \
	done
