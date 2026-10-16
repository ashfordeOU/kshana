#!/bin/sh
# Regenerate tests/fixtures/glonass_broadcast_rtklib_oracle/rtklib.csv.
# Usage: RTKLIB=<clone of github.com/tomojitakasu/RTKLIB at v2.4.2-p13> sh generate.sh
set -e
HERE="$(cd "$(dirname "$0")" && pwd)"
ROOT="$HERE/../.."
BIN="$(mktemp -d)/glonass_harness"
sh "$HERE/build.sh" "$BIN"
OUT="$ROOT/tests/fixtures/glonass_broadcast_rtklib_oracle"
mkdir -p "$OUT"
"$BIN" "$ROOT/tests/fixtures/igs/BRDM00DLR_R_20130010000_01D_MN.rnx" > "$OUT/rtklib.csv"
