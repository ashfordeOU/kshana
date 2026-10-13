#!/usr/bin/env bash
# SPDX-License-Identifier: AGPL-3.0-only
# Exports the registered scenarios with `kshana bench-export`, passes each export to
# gps-sdr-sim's readers through driver.c, and writes the comparison summary to
# tests/fixtures/testbench/gpssdrsim.json. Dev-only; CI reads the committed summary.
# Usage: run.sh <gps-sdr-sim checkout from fetch.sh> [kshana binary]
set -euo pipefail
HERE="$(cd "$(dirname "$0")" && pwd)"
ROOT="$(cd "$HERE/../.." && pwd)"
SRC="${1:?gps-sdr-sim checkout}"
KSHANA="${2:-$ROOT/target/release/kshana}"
COMMIT=28ca29a6719475195e3aabd5930c4ed02d67190f
test "$(git -C "$SRC" rev-parse HEAD)" = "$COMMIT"
WORK="$(mktemp -d)"
trap 'rm -rf "$WORK"' EXIT
cc -O2 -std=gnu99 -w -I"$SRC" -Dmain=gpssim_main -c "$SRC/gpssim.c" -o "$WORK/gpssim.o"
cc -O2 -std=gnu99 -I"$SRC" "$HERE/driver.c" "$WORK/gpssim.o" -lm -o "$WORK/driver"
SCENARIOS="automotive-urban-canyon gnss-ins small-uas-jammed-nav gnss-ins-maritime gnss-ins-rail gnss-ins-aviation jamming-demo gnss-sim-raim"
for s in $SCENARIOS; do
  "$KSHANA" bench-export "$ROOT/scenarios/$s.toml" --out "$WORK/$s" >/dev/null 2>"$WORK/$s.stderr"
  tail -n +2 "$WORK/$s.motion.csv" > "$WORK/$s.ecef.csv"
  tail -n +2 "$WORK/$s.motion.csv" | cut -d, -f1-4 > "$WORK/$s.ecef4.csv"
  tail -n +2 "$WORK/$s.motion.csv" | cut -d, -f1,8,9,10 > "$WORK/$s.llh.csv"
  "$WORK/driver" nmea "$WORK/$s.nmea" > "$WORK/$s.out.nmea"
  "$WORK/driver" ecef "$WORK/$s.ecef.csv" > "$WORK/$s.out.ecef"
  "$WORK/driver" ecef "$WORK/$s.ecef4.csv" > "$WORK/$s.out.ecef4"
  "$WORK/driver" llh "$WORK/$s.llh.csv" > "$WORK/$s.out.llh"
  "$WORK/driver" ecef "$WORK/$s.motion.csv" > "$WORK/$s.out.asis"
done
python3 -I "$HERE/summarise.py" "$WORK" "$COMMIT" $SCENARIOS > "$ROOT/tests/fixtures/testbench/gpssdrsim.json"
echo "wrote tests/fixtures/testbench/gpssdrsim.json"
