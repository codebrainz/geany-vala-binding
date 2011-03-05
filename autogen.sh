#!/bin/sh

mkdir -p build/m4	|| exit 1
mkdir -p build/aux	|| exit 1
autoreconf -vfi		|| exit 1

echo 'Build system setup OK.'
echo 'Now type `./configure` to configure the package.'
