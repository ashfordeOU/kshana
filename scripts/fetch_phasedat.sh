#!/usr/bin/env sh
# Fetch the canonical Stable32 PHASE.DAT reference dataset used by the
# tests/phasedat_reference.rs validation island.
#
# PHASE.DAT ships with the commercial Stable32 tool; it is third-party data we do
# not redistribute, so it is git-ignored and not vendored. This script reproduces
# it locally (via the allantools mirror) into the git-ignored cache so the
# data-gated test can run against the real reference series.
#
# Usage: scripts/fetch_phasedat.sh [dest-dir]   (default: ./realdata-cache/phasedat)
set -eu

DEST="${1:-realdata-cache/phasedat}"
URL="https://raw.githubusercontent.com/aewallin/allantools/master/tests/phasedat/PHASE.DAT"

mkdir -p "$DEST"
if [ -f "$DEST/PHASE.DAT" ]; then
    echo "PHASE.DAT already present: $DEST/PHASE.DAT"
    exit 0
fi

echo "Fetching PHASE.DAT -> $DEST/PHASE.DAT"
curl -fSL --retry 3 --max-time 60 -o "$DEST/PHASE.DAT" "$URL"

echo "PHASE.DAT ready: $DEST/PHASE.DAT"
echo "Now run: cargo test --test phasedat_reference -- --nocapture"
