#!/bin/sh

if [ "$1" = "--with-deps" ]
then 
	WITH_DEPS="--deps"
	echo "Going to generate documentation for dependencies."
else 
	WITH_DEPS=""
fi

# create dirs since valadoc has trouble with this
mkdir -vp doc/html doc/devhelp

echo "Generating HTML documentation..."
valadoc -o doc/html \
	--basedir=./ \
	--vapidir=./ \
	--package-name=geany \
	--package-version='0.1' \
	--force \
	--verbose $WITH_DEPS \
	--doclet=html \
	geany.vapi

echo
echo "Generating DevHelp documentation..."
valadoc -o doc/devhelp \
	--basedir=./ \
	--vapidir=./ \
	--package-name=geany \
	--package-version='0.1' \
	--force \
	--verbose $WITH_DEPS \
	--doclet=devhelp \
	geany.vapi

exit $?

# for if this ever does what I hope
mkdir -vp doc/gtkdoc

echo
echo "Generating GTK-DOC documentation..."
valadoc -o doc/gtkdoc \
	--pkg gtk+-2.0 \
	--basedir=./ \
	--vapidir=./ \
	--package-name=geany \
	--package-version='0.1' \
	--force \
	--verbose $WITH_DEPS \
	--doclet=gtkdoc \
	geany.vapi
