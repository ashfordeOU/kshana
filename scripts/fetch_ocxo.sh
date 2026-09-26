#!/usr/bin/env sh
# Fetch the real OCXO-versus-hydrogen-maser frequency record used by the
# tests/slot_timing_ocxo_holdout.rs check.
#
# The record (19 982 one-second frequency readings of the 10 MHz oven-controlled
# crystal oscillator in an HP impedance analyser, measured with a Keysight 53230A
# counter against a hydrogen maser; A. Wallin, 2015) is distributed with the
# open-source allantools package without an explicit data licence, so it is
# git-ignored and not vendored. This script reproduces it into the git-ignored cache.
#
# Usage: scripts/fetch_ocxo.sh [dest-dir]   (default: ./realdata-cache/ocxo)
set -eu

DEST="${1:-realdata-cache/ocxo}"
# Pinned to the same allantools commit as scripts/fetch_cs5071a.sh, and the bytes
# checked, so an upstream edit cannot silently change what the test compares against.
ALLANTOOLS_COMMIT="ddc5bb5a46cbdc245a347ebe4f1f3c872a7371f7"
EXPECT_SHA256="2c507ce0fee6a2010116c6cfe78724d8f87b527f55cdbfe901afbdc9b214d3ac"

sha256_of() {
    if command -v sha256sum >/dev/null 2>&1; then sha256sum "$1" | cut -d' ' -f1
    else shasum -a 256 "$1" | cut -d' ' -f1; fi
}
URL="https://raw.githubusercontent.com/aewallin/allantools/$ALLANTOOLS_COMMIT/tests/ocxo/ocxo_frequency.txt"

mkdir -p "$DEST"
if [ -f "$DEST/ocxo_frequency.txt" ]; then
    echo "OCXO data already present: $DEST/ocxo_frequency.txt"
    exit 0
fi
curl -fsSL "$URL" -o "$DEST/ocxo_frequency.txt.part"
GOT="$(sha256_of "$DEST/ocxo_frequency.txt.part")"
if [ "$GOT" != "$EXPECT_SHA256" ]; then
    rm -f "$DEST/ocxo_frequency.txt.part"
    echo "SHA-256 mismatch for the OCXO record: got $GOT, expected $EXPECT_SHA256" >&2
    exit 1
fi
mv "$DEST/ocxo_frequency.txt.part" "$DEST/ocxo_frequency.txt"
echo "OCXO data fetched: $DEST/ocxo_frequency.txt"
