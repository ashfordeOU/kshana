#!/bin/sh
# Build and run the wx-free $PKSHT core test. Needs only a C++11 compiler.
set -eu
cd "$(dirname "$0")"
out="${TMPDIR:-/tmp}/kshana_pksht_test.$$"
${CXX:-c++} -std=c++11 -Wall -Wextra -o "$out" test/pksht_test.cpp
"$out" ../../signalk/test/fixtures/pksht-excerpt.nmea
rm -f "$out"
