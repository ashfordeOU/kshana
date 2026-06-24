#!/usr/bin/env bash
# Assemble a self-contained arXiv source package for the Kshana paper.
#
# The working tree splits the bibliography across ../paper.bib and ./refs-extra.bib
# and keeps the crossover figures in ../crossover/. arXiv needs everything in one
# tree, so this script flattens those references, precompiles the bibliography to a
# .bbl (arXiv does not have to run BibTeX when the .bbl ships), verifies the package
# builds standalone, and tars it with kshana.tex at the archive root.
#
# Usage:  bash make-arxiv-tarball.sh
# Output: dist/kshana-arxiv-src.tar.gz  (+ a verified build under build/)
set -euo pipefail

here="$(cd "$(dirname "$0")" && pwd)"
cd "$here"

build="$here/build"
dist="$here/dist"
pkg="$build/pkg"
rm -rf "$build" "$dist"
mkdir -p "$pkg/sections" "$dist"

# 1. Sources, with cross-host references made local.
sed -e 's#\\bibliography{\.\./paper,refs-extra}#\\bibliography{paper,refs-extra}#' \
    -e 's#\\graphicspath{{\./}{\.\./}{\.\./crossover/}}#\\graphicspath{{./}}#' \
    kshana.tex > "$pkg/kshana.tex"
cp sections/*.tex      "$pkg/sections/"
cp refs-extra.bib      "$pkg/"
cp ../paper.bib        "$pkg/"
cp ../crossover/inertial.pdf "$pkg/"
cp ../crossover/clock.pdf    "$pkg/"

# 2. Precompile the bibliography to a .bbl from the flattened sources.
( cd "$pkg" && tectonic --keep-intermediates kshana.tex >/dev/null 2>&1 )
test -s "$pkg/kshana.bbl" || { echo "FAIL: no kshana.bbl produced"; exit 1; }
# Drop intermediates that must not ship (keep .bbl, .tex, .bib, .pdf).
( cd "$pkg" && rm -f kshana.aux kshana.log kshana.out kshana.pdf )

# 3. Verify the package builds standalone from a pristine copy.
verify="$build/verify"
cp -R "$pkg" "$verify"
( cd "$verify" && tectonic kshana.tex >/dev/null 2>&1 ) || { echo "FAIL: standalone build"; exit 1; }
pages="$(command -v pdfinfo >/dev/null && pdfinfo "$verify/kshana.pdf" | awk '/Pages/{print $2}' || echo '?')"
rm -f "$verify"/kshana.pdf "$verify"/kshana.bbl  # verify dir is throwaway

# 4. Tar with kshana.tex at the archive root (arXiv detects the main file by \documentclass).
#    COPYFILE_DISABLE=1 stops macOS bsdtar from bundling ._* AppleDouble metadata files,
#    which arXiv would otherwise have to strip on upload.
( cd "$pkg" && COPYFILE_DISABLE=1 tar czf "$dist/kshana-arxiv-src.tar.gz" \
    kshana.tex kshana.bbl paper.bib refs-extra.bib inertial.pdf clock.pdf sections )

echo "OK: dist/kshana-arxiv-src.tar.gz  (standalone build: ${pages} pp)"
echo "Contents:"
tar tzf "$dist/kshana-arxiv-src.tar.gz" | sed 's/^/  /'
