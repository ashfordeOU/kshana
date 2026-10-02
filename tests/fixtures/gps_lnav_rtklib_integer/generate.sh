#!/usr/bin/env bash
# SPDX-License-Identifier: AGPL-3.0-only
# Stage "parse": fetch the IGS daily broadcast file of 2025-03-02 (day 061) and write the GPS
# ephemerides RTKLIB parses to rtklib_ephemerides.json. Then write Kshana's words:
#   cargo test --test gps_lnav_rtklib_integer_oracle write_kshana_words -- --ignored
# Stage "decode": decode kshana_words.txt with RTKLIB into rtklib_decoded.json.
# Usage: RTKLIB=<clone at v2.4.2-p13> bash generate.sh parse|decode
set -euo pipefail
HERE="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SRC="$RTKLIB/src"
[ "$(git -C "$RTKLIB" rev-parse HEAD)" = 71db0ffa0d9735697c6adfd06fdf766d0e5ce807 ] || { echo "RTKLIB is not v2.4.2-p13"; exit 1; }
WORK="${WORK:-$(mktemp -d)}"
BIN="$WORK/lnav_harness"
gcc -O0 -w -I"$SRC" "$HERE/harness.c" "$SRC/rtkcmn.c" "$SRC/rcvraw.c" "$SRC"/rcv/*.c \
    "$SRC/preceph.c" "$SRC/ephemeris.c" "$SRC/sbas.c" "$SRC/rinex.c" "$SRC/rtcm.c" "$SRC/rtcm2.c" \
    "$SRC/rtcm3.c" "$SRC/rtcm3e.c" "$SRC/ionex.c" "$SRC/qzslex.c" -lm -lrt -o "$BIN"
case "$1" in
  parse)
    NAME=BRDC00IGS_R_20250610000_01D_MN.rnx
    [ -s "$WORK/$NAME" ] || { curl -fsSL -o "$WORK/$NAME.gz" "https://igs.bkg.bund.de/root_ftp/IGS/BRDC/2025/061/$NAME.gz" && gunzip -f "$WORK/$NAME.gz"; }
    sha256sum "$WORK/$NAME"
    "$BIN" parse "$WORK/$NAME" > "$HERE/rtklib_ephemerides.json"
    sha256sum "$HERE/rtklib_ephemerides.json" ;;
  decode)
    "$BIN" decode < "$HERE/kshana_words.txt" > "$HERE/rtklib_decoded.json"
    sha256sum "$HERE/kshana_words.txt" "$HERE/rtklib_decoded.json" ;;
  *) echo "parse or decode"; exit 2 ;;
esac
