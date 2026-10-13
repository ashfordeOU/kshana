#!/usr/bin/env bash
# SPDX-License-Identifier: AGPL-3.0-only
# B6 of tests/ionex_code_gim_oracle.rs: RTKLIB v2.4.2-p13 iontec() on the crop fetch.sh wrote.
#   RTKLIB=<clone at 71db0ffa> bash run_rtklib.sh <dir written by fetch.sh>
# Writes <dir>/rtklib_iontec_rotated.csv (opt 1) and <dir>/rtklib_iontec_consecutive.csv (opt 0)
# at the eq. 2/3 query points of <dir>/reference_vtec.csv.gz ("T" rows). Then:
#   KSHANA_IONEX_CODE_GIM_DIR=<dir> KSHANA_IONEX_RTKLIB_CSV=<dir>/rtklib_iontec_rotated.csv \
#     cargo test --release --test ionex_code_gim_oracle b6
set -euo pipefail
HERE="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DIR="${1:?usage: run_rtklib.sh <dir>}"
[ "$(git -C "$RTKLIB" rev-parse HEAD)" = 71db0ffa0d9735697c6adfd06fdf766d0e5ce807 ] || { echo "RTKLIB is not v2.4.2-p13"; exit 1; }
BIN="$DIR/rtklib_iontec"
gcc -O2 -w -DTRACE=0 -I"$RTKLIB/src" "$HERE/rtklib_iontec_driver.c" "$RTKLIB/src/rtkcmn.c" "$RTKLIB/src/ionex.c" -lm -o "$BIN"
gzip -dc "$DIR/reference_vtec.csv.gz" | awk -F, '$1=="T" { print $2","$3","$4 }' > "$DIR/queries.csv"
# RTKLIB reads the FULL map: its getindex() tests the sign of the grid's end latitude rather than
# of the step, so a 30.0 -> 5.0 deg grid (both ends positive, descending) reads as empty. The crop
# keeps the CODE bands verbatim, so at query points inside 5-30 deg N RTKLIB interpolates the
# same nodes from the full file.
"$BIN" "$DIR/CODG1330.18I" 1 < "$DIR/queries.csv" > "$DIR/rtklib_iontec_rotated.csv"
"$BIN" "$DIR/CODG1330.18I" 0 < "$DIR/queries.csv" > "$DIR/rtklib_iontec_consecutive.csv"
sha256sum "$DIR"/rtklib_iontec_*.csv
