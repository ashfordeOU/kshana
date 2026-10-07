#!/usr/bin/env bash
# SPDX-License-Identifier: AGPL-3.0-only
# Regenerate tests/fixtures/iq_gpssdrsim_cross_generator/: the reference output of the GNSS
# IQ layer's cross-check against gps-sdr-sim (tests/iq_gpssdrsim_cross_generator.rs).
#
# Needs network (git clone), a C compiler, make and coreutils. Nothing here runs at test
# time: the test reads only the committed outputs.
#
#   1. Clone gps-sdr-sim at the pinned commit and build the program with its own Makefile.
#   2. Run the program in static mode at the location its usage text gives as the example
#      (-l 35.681298,139.766247,10.0), on its bundled brdc0010.22n, no start time (so the
#      scenario starts at the first time of clock in the file), ionosphere off (-i),
#      8-bit I/Q (-b 8) at the default 2.6 MHz, 0.2 s (one 0.1 s block is written).
#      Keep the first 20 ms of samples and the channel listing it prints.
#   3. Build tests/fixtures/iq_gpssdrsim_cross_generator/harness.c against the same source,
#      compiled with the same flags, as a separate program, and run it: it repeats the
#      program's channel set-up and prints the per-channel state behind the first block.
set -euo pipefail
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
OUT="$ROOT/tests/fixtures/iq_gpssdrsim_cross_generator"
COMMIT=28ca29a6719475195e3aabd5930c4ed02d67190f
LOC=35.681298,139.766247,10.0
FS=2600000
KEEP_SAMPLES=52000 # 20 ms at 2.6 MHz
WORK="${WORK:-$(mktemp -d)}"
[ -d "$WORK/gps-sdr-sim" ] || git clone -q https://github.com/osqzss/gps-sdr-sim "$WORK/gps-sdr-sim"
git -C "$WORK/gps-sdr-sim" checkout -q "$COMMIT"
cd "$WORK/gps-sdr-sim"
make -s clean >/dev/null
make -s gps-sdr-sim
# The harness links gpssim.c compiled with the Makefile's flags, its main() renamed.
CFLAGS="-O3 -Wall -D_FILE_OFFSET_BITS=64"
cc $CFLAGS -Dmain=gpssim_main -c gpssim.c -o gpssim_lib.o
cc $CFLAGS -I. -c "$OUT/harness.c" -o harness.o
cc -o harness harness.o gpssim_lib.o -lm

sha256sum brdc0010.22n
./gps-sdr-sim -e brdc0010.22n -l "$LOC" -d 0.2 -b 8 -s "$FS" -i -o gpssim.bin 2> gpssim.stderr
# The channel listing and start lines are deterministic; the progress and timing lines are not.
tr '\r' '\n' < gpssim.stderr | grep -v -e '^Time into run' -e '^Process time' -e '^Done' -e '^$' \
  > "$OUT/gpssdrsim_stderr.txt"
head -c $((KEEP_SAMPLES * 2)) gpssim.bin > "$OUT/gpssdrsim_first20ms.ci8"
IFS=, read -r LAT LON HGT <<< "$LOC"
./harness brdc0010.22n "$LAT" "$LON" "$HGT" > "$OUT/harness_output.json"
cd "$OUT"
sha256sum gpssdrsim_first20ms.ci8 gpssdrsim_stderr.txt harness_output.json
