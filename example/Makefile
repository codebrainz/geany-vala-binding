#!/usr/bin/make -f
#
# Distributed under GNU GPL v2+, see COPYING and AUTHORS for details
#

PACKAGE		= gplugin
LIBRARY		= $(PACKAGE)
PACKAGES	= glib-2.0 gtk+-2.0 geany
SOURCES		= gplugin.vala

CC			?= gcc
VALAC		?= valac
CFLAGS		?= -W -Wall
VALAFLAGS	 = --vapidir=..
LDFLAGS		 =

################################################################################

# Replicate Automake's AM_V_*
V ?= 0
AM_V_CC = $(am_v_cc_$(V))
am_v_cc_0 = @echo "  CC $@";
am_v_cc_1 = 
AM_V_LD = $(am_v_ld_$(V))
am_v_ld_0 = @echo "  LD $@";
am_v_ld_1 = 
AM_V_TARGET = $(am_v_target_$(V))
am_v_target_0 = @echo "  $@" | tr '[:lower:]' '[:upper:]';
am_v_target_1 = 
AM_V_GEN = $(am_v_gen_$(V))
am_v_gen_0 = @echo " GEN $@";
am_v_gen_1 = 

###

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

