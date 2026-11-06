#!/usr/bin/env sh
# Fetch the OASIS CAP 1.2 XML schema used by tests/telemetry_cap.rs. It is OASIS copyright, so it is
# not vendored; the bytes are checked.
# Usage: scripts/fetch_cap_xsd.sh [dest-dir]   (default: ./realdata-cache/cap)
set -eu
DEST="${1:-realdata-cache/cap}"
URL="https://docs.oasis-open.org/emergency/cap/v1.2/CAP-v1.2.xsd"
EXPECT_SHA256="b7798ef25868b068c97b268bda02d067c7d4ba9373adc5638bf37105804ee723"
mkdir -p "$DEST"
curl -fSL --retry 3 --max-time 120 -o "$DEST/CAP-v1.2.xsd" "$URL"
if command -v sha256sum >/dev/null 2>&1; then got="$(sha256sum "$DEST/CAP-v1.2.xsd" | cut -d' ' -f1)"
else got="$(shasum -a 256 "$DEST/CAP-v1.2.xsd" | cut -d' ' -f1)"; fi
if [ "$got" != "$EXPECT_SHA256" ]; then
    echo "sha256 mismatch: got $got, expected $EXPECT_SHA256" >&2
    rm -f "$DEST/CAP-v1.2.xsd"
    exit 1
fi
echo "CAP 1.2 schema ready: $DEST/CAP-v1.2.xsd"
