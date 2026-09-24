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
# Pinned to one allantools commit, and the bytes checked, because this input backs a
# VALIDATED ledger row: fetching `master` would let an upstream edit silently change
# what the row was validated against. To move the pin, change both lines together.
ALLANTOOLS_COMMIT="ddc5bb5a46cbdc245a347ebe4f1f3c872a7371f7"
EXPECT_SHA256="ce9b432432850d9072ae106696528fa3377db7fe3686521171b429b6cb5afbaa"

sha256_of() {
    if command -v sha256sum >/dev/null 2>&1; then sha256sum "$1" | cut -d' ' -f1
    else shasum -a 256 "$1" | cut -d' ' -f1; fi
}
URL="https://raw.githubusercontent.com/aewallin/allantools/$ALLANTOOLS_COMMIT/tests/phasedat/PHASE.DAT"

mkdir -p "$DEST"
if [ -f "$DEST/PHASE.DAT" ]; then
    echo "PHASE.DAT already present: $DEST/PHASE.DAT"
    exit 0
fi

echo "Fetching PHASE.DAT -> $DEST/PHASE.DAT"
curl -fSL --retry 3 --max-time 60 -o "$DEST/PHASE.DAT" "$URL"
got="$(sha256_of "$DEST/PHASE.DAT")"
if [ "$got" != "$EXPECT_SHA256" ]; then
    echo "sha256 mismatch for $DEST/PHASE.DAT: got $got, expected $EXPECT_SHA256" >&2
    rm -f "$DEST/PHASE.DAT"
    exit 1
fi

echo "PHASE.DAT ready: $DEST/PHASE.DAT"
echo "Now run: cargo test --test phasedat_reference -- --nocapture"
