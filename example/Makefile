#!/usr/bin/make -f
# This is a GNU Makefile
#
# Distributed under GNU GPL v2+, see COPYING and AUTHORS for details
#

include ../build/silent.mk

PACKAGE		= gplugin
LIBRARY		= $(PACKAGE)
PACKAGES	= glib-2.0 gtk+-2.0 geany
SOURCES		= gplugin.vala

CC			?= gcc
VALAC		?= valac
CFLAGS		?= -W -Wall
VALAFLAGS	 = --vapidir=..
LDFLAGS		 =


VALAFLAGS	+= $(PACKAGES:%=--pkg=%)
CFLAGS		+= $(shell pkg-config --cflags $(PACKAGES))
LDFLAGS		+= $(shell pkg-config --libs $(PACKAGES))
CSOURCES	 = $(SOURCES:.vala=.c)
OBJS		 = $(CSOURCES:.c=.o)

.PHONY : all clean distclean
.SECONDARY : $(CSOURCES)

all : $(LIBRARY).so

$(LIBRARY).so : $(OBJS)
	$(AM_V_LD) $(CC) $^ -o $@ -shared $(LDFLAGS)

%.o : %.c
	$(AM_V_CC) $(CC) $^ -c -o $@ -fPIC $(CFLAGS)

%.c : %.vala
	$(AM_V_GEN) $(VALAC) $^ -C -o $@ $(VALAFLAGS)

clean :
	$(AM_V_TARGET) rm -f $(LIBRARY).so $(OBJS)
distclean : clean
	$(AM_V_TARGET) rm -f $(CSOURCES)
install:
