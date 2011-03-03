#!/bin/sh

VALA='vala-0.10'
VAPIDIR=`pkg-config --variable=vapidir $VALA`

if test -d "$VAPIDIR"
then
	install -m 0644 geany.vapi "$VAPIDIR" && \
	install -m 0644 geany.deps "$VAPIDIR" && \
	echo "Installed geany-vala-binding to '$VAPIDIR'." || \
	echo "Unable to install geany-vala-binding to '$VAPIDIR'."
else
	echo "Unable to find vapidir for '$VALA'"
fi
