#!/usr/bin/env bash
# Assemble a self-contained arXiv source package for the Kshana paper.
#
# The working tree splits the bibliography across ../paper.bib and ./refs-extra.bib
# and keeps the crossover figures in ../crossover/. arXiv needs everything in one
# tree, so this script flattens those references, precompiles the bibliography to a
# .bbl (arXiv does not have to run BibTeX when the .bbl ships), verifies the package
# builds standalone, and tars it with main.tex at the archive root.
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
    main.tex > "$pkg/main.tex"
cp sections/*.tex      "$pkg/sections/"
cp refs-extra.bib      "$pkg/"
cp ../paper.bib        "$pkg/"
cp ../crossover/inertial.pdf "$pkg/"
cp ../crossover/clock.pdf    "$pkg/"

# 2. Precompile the bibliography to a .bbl from the flattened sources.
( cd "$pkg" && tectonic --keep-intermediates main.tex >/dev/null 2>&1 )
test -s "$pkg/main.bbl" || { echo "FAIL: no main.bbl produced"; exit 1; }
# Drop intermediates that must not ship (keep .bbl, .tex, .bib, .pdf).
( cd "$pkg" && rm -f main.aux main.log main.out main.pdf )

# 3. Verify the package builds standalone from a pristine copy.
verify="$build/verify"
cp -R "$pkg" "$verify"
( cd "$verify" && tectonic main.tex >/dev/null 2>&1 ) || { echo "FAIL: standalone build"; exit 1; }
pages="$(command -v pdfinfo >/dev/null && pdfinfo "$verify/main.pdf" | awk '/Pages/{print $2}' || echo '?')"
rm -f "$verify"/main.pdf "$verify"/main.bbl  # verify dir is throwaway

# 4. Tar with main.tex at the archive root (arXiv convention).
( cd "$pkg" && tar czf "$dist/kshana-arxiv-src.tar.gz" \
    main.tex main.bbl paper.bib refs-extra.bib inertial.pdf clock.pdf sections )

echo "OK: dist/kshana-arxiv-src.tar.gz  (standalone build: ${pages} pp)"
echo "Contents:"
tar tzf "$dist/kshana-arxiv-src.tar.gz" | sed 's/^/  /'
