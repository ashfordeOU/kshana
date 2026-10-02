#!/usr/bin/env bash
# SPDX-License-Identifier: AGPL-3.0-only
# Decode kshana_words.txt with RTKLIB v2.4.2-p13 (a separate program) into rtklib_decoded.json.
# kshana_words.txt is written by:
#   cargo test --test gps_lnav_rtklib_decode_oracle write_kshana_words -- --ignored
# Usage: RTKLIB=<RTKLIB clone at v2.4.2-p13> bash generate.sh
set -euo pipefail
HERE="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SRC="$RTKLIB/src"
[ "$(git -C "$RTKLIB" rev-parse HEAD)" = 71db0ffa0d9735697c6adfd06fdf766d0e5ce807 ] || { echo "RTKLIB is not v2.4.2-p13"; exit 1; }
BIN="$(mktemp -d)/lnav_decode"
gcc -O0 -w -I"$SRC" "$HERE/harness.c" "$SRC/rtkcmn.c" "$SRC/rcvraw.c" "$SRC"/rcv/*.c \
    "$SRC/preceph.c" "$SRC/ephemeris.c" "$SRC/sbas.c" "$SRC/rinex.c" "$SRC/rtcm.c" "$SRC/rtcm2.c" \
    "$SRC/rtcm3.c" "$SRC/rtcm3e.c" "$SRC/ionex.c" "$SRC/qzslex.c" -lm -lrt -o "$BIN"
"$BIN" < "$HERE/kshana_words.txt" > "$HERE/rtklib_decoded.json"
sha256sum "$HERE/kshana_words.txt" "$HERE/rtklib_decoded.json"
