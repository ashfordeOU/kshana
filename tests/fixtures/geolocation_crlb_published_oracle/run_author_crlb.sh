#!/bin/sh
# SPDX-License-Identifier: AGPL-3.0-only
# Fetch K. C. Ho's published Cramer-Rao lower bound code for Ho and Xu (2004) (BSD-style licence,
# https://cisp.ece.missouri.edu/code.html), check its SHA-256, and run it under GNU Octave as a
# separate program on the cases of row M058. Writes ho_xu_author_crlb.json next to this script.
set -eu
here=$(cd "$(dirname "$0")" && pwd)
work=$(mktemp -d)
trap 'rm -rf "$work"' EXIT
curl -sS -L -o "$work/code.zip" \
  https://cisp.ece.missouri.edu/code/TDOAFDOALocMvgSrcSen/TDOAFDOALocMvgSrcSen.zip
echo "08bae09ed86806dd022d56a7b76c9125b3f841dd4929517807bb3c19ce633a51  $work/code.zip" | sha256sum -c -
(cd "$work" && unzip -q code.zip)
cp "$here/ho_xu_author_crlb_driver.m" "$work/"
(cd "$work" && octave --no-gui --quiet --eval "ho_xu_author_crlb_driver('$here/ho_xu_author_crlb.json')")
