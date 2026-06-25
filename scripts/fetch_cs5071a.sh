#!/usr/bin/env sh
# Fetch the real Cs5071A caesium-vs-hydrogen-maser phase dataset used by the
# tests/cs5071a_reference.rs validation island.
#
# The raw 556 990-point phase file is third-party data (allantools, Anders
# Wallin) with no explicit redistribution licence, so it is git-ignored and not
# vendored. This script reproduces it locally into the git-ignored cache so the
# data-gated test can run against the real measurement.
#
# Usage: scripts/fetch_cs5071a.sh [dest-dir]   (default: ./realdata-cache/cs5071a)
set -eu

DEST="${1:-realdata-cache/cs5071a}"
URL="https://raw.githubusercontent.com/aewallin/allantools/master/tests/Cs5071A/5071A_phase.txt.gz"

mkdir -p "$DEST"
if [ -f "$DEST/5071A_phase.txt" ]; then
    echo "Cs5071A data already present: $DEST/5071A_phase.txt"
    exit 0
fi

echo "Fetching Cs5071A phase data -> $DEST/5071A_phase.txt.gz"
curl -fSL --retry 3 --max-time 180 -o "$DEST/5071A_phase.txt.gz" "$URL"
gunzip -kf "$DEST/5071A_phase.txt.gz"

echo "Cs5071A data ready: $DEST/5071A_phase.txt"
echo "Now run: cargo test --test cs5071a_reference -- --nocapture"
