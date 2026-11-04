#!/usr/bin/env sh
# Fetch one public BIPM CGGTTS file used by tests/cggtts_bipm_reference.rs.
#
# BIPM time-transfer data is published on the BIPM server without an explicit
# redistribution licence, so it is not vendored; this script downloads it into the
# git-ignored cache and checks its bytes.
#
# Usage: scripts/fetch_cggtts.sh [dest-dir]   (default: ./realdata-cache/cggtts)
set -eu
DEST="${1:-realdata-cache/cggtts}"
FILE="aggo2501.p3"
URL="https://webtai.bipm.org/ftp/pub/tai/data/2025/time_transfer/raw_gps_data/$FILE"
EXPECT_SHA256="60290767832d5e10c57a2307b698b88130a6d2cdca01bb2806b858cfbf7d5eaa"
sha256_of() {
    if command -v sha256sum >/dev/null 2>&1; then sha256sum "$1" | cut -d' ' -f1
    else shasum -a 256 "$1" | cut -d' ' -f1; fi
}
mkdir -p "$DEST"
if [ ! -f "$DEST/$FILE" ]; then
    echo "Fetching $URL -> $DEST/$FILE"
    curl -fSL --retry 3 --max-time 300 -o "$DEST/$FILE" "$URL"
fi
got="$(sha256_of "$DEST/$FILE")"
if [ "$got" != "$EXPECT_SHA256" ]; then
    echo "sha256 mismatch for $DEST/$FILE: got $got, expected $EXPECT_SHA256" >&2
    rm -f "$DEST/$FILE"
    exit 1
fi
echo "CGGTTS data ready: $DEST/$FILE"
