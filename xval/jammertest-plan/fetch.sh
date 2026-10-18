#!/bin/sh
# Fetch the NPRA Jammertest test catalogue and the 2025 transmission plan into a directory
# OUTSIDE the repository, and check each file against MANIFEST.tsv (SHA-256). Nothing is vendored.
# Source: https://github.com/NPRA/jammertest-plan at commit 75c0b2ceea10e470c3799d14a8ef18842d8375a7 (MIT licence, see README.md).
#
#   xval/jammertest-plan/fetch.sh <dest-dir>
#   KSHANA_JAMMERTEST_PLAN_DIR=<dest-dir> cargo test --test jammertest_plan_roundtrip
set -eu
COMMIT=75c0b2ceea10e470c3799d14a8ef18842d8375a7
DEST=${1:?usage: fetch.sh <dest-dir> (outside the repository)}
HERE=$(cd "$(dirname "$0")" && pwd)
mkdir -p "$DEST"
grep -v '^#' "$HERE/MANIFEST.tsv" | while IFS="$(printf '\t')" read -r sum file; do
  [ -s "$DEST/$file" ] || curl -fsSL -o "$DEST/$file" \
    "https://raw.githubusercontent.com/NPRA/jammertest-plan/$COMMIT/$file"
  got=$(sha256sum "$DEST/$file" | cut -d' ' -f1)
  [ "$got" = "$sum" ] || { echo "SHA-256 mismatch for $file: $got (expected $sum)" >&2; exit 1; }
  echo "ok  $file"
done
