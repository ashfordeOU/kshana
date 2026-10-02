#!/usr/bin/env bash
# SPDX-License-Identifier: AGPL-3.0-only
# Regenerate gpssdrsim_output.json: clone gps-sdr-sim at the pinned commit, build harness.c
# against it as a separate program, and run it on gps-sdr-sim's bundled brdc0010.22n.
set -euo pipefail
HERE="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
COMMIT=28ca29a6719475195e3aabd5930c4ed02d67190f
WORK="${WORK:-$(mktemp -d)}"
[ -d "$WORK/gps-sdr-sim" ] || git clone -q https://github.com/osqzss/gps-sdr-sim "$WORK/gps-sdr-sim"
git -C "$WORK/gps-sdr-sim" checkout -q "$COMMIT"
cd "$WORK/gps-sdr-sim"
# gpssim.c carries its own main(); rename it so the harness's main is the program's.
cc -O0 -std=gnu99 -Dmain=gpssim_main -c gpssim.c -o gpssim.o
cc -O0 -std=gnu99 -I. -c "$HERE/harness.c" -o harness.o
cc -o harness harness.o gpssim.o -lm
sha256sum brdc0010.22n
./harness brdc0010.22n > "$HERE/gpssdrsim_output.json"
sha256sum "$HERE/gpssdrsim_output.json"
