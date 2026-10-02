#!/bin/sh
# Build the RTKLIB snapshot RAIM harness (a separate program; RTKLIB v2.4.2-p13, BSD-2-Clause).
# Usage: RTKLIB=<RTKLIB clone> sh build.sh <output binary>
set -e
SRC="$RTKLIB/src"
OUT="${1:-raim_harness}"
FILES=""
for f in rtkcmn rinex ephemeris preceph sbas ionex qzslex rtkpos ppp ppp_ar lambda geoid \
         options solution rtcm rtcm2 rtcm3 rtcm3e; do
    FILES="$FILES $SRC/$f.c"
done
gcc -O2 -w -DENAGLO -DENAQZS -DENAGAL -DNFREQ=3 -I"$SRC" "$(dirname "$0")/raim_harness.c" $FILES -lm -lrt -o "$OUT"
