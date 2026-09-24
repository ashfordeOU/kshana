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
# Pinned to one allantools commit, and the bytes checked, because this input backs a
# VALIDATED ledger row: fetching `master` would let an upstream edit silently change
# what the row was validated against. To move the pin, change both lines together.
ALLANTOOLS_COMMIT="ddc5bb5a46cbdc245a347ebe4f1f3c872a7371f7"
EXPECT_SHA256="aff036af22b8f9bea68bf5a0ad3fb6cd7bef31cbdf32cfbdf171b8b76b66d415"

sha256_of() {
    if command -v sha256sum >/dev/null 2>&1; then sha256sum "$1" | cut -d' ' -f1
    else shasum -a 256 "$1" | cut -d' ' -f1; fi
}
URL="https://raw.githubusercontent.com/aewallin/allantools/$ALLANTOOLS_COMMIT/tests/Cs5071A/5071A_phase.txt.gz"

mkdir -p "$DEST"
if [ -f "$DEST/5071A_phase.txt" ]; then
    echo "Cs5071A data already present: $DEST/5071A_phase.txt"
    exit 0
fi

echo "Fetching Cs5071A phase data -> $DEST/5071A_phase.txt.gz"
curl -fSL --retry 3 --max-time 180 -o "$DEST/5071A_phase.txt.gz" "$URL"
got="$(sha256_of "$DEST/5071A_phase.txt.gz")"
if [ "$got" != "$EXPECT_SHA256" ]; then
    echo "sha256 mismatch for $DEST/5071A_phase.txt.gz: got $got, expected $EXPECT_SHA256" >&2
    rm -f "$DEST/5071A_phase.txt.gz"
    exit 1
fi
gunzip -kf "$DEST/5071A_phase.txt.gz"

echo "Cs5071A data ready: $DEST/5071A_phase.txt"
echo "Now run: cargo test --test cs5071a_reference -- --nocapture"
