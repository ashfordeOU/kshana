#!/usr/bin/env bash
# SPDX-License-Identifier: AGPL-3.0-only
#
# Regenerate the SP3 precise-ephemeris interpolation external-oracle fixture
# (sp3_ecef_reference.txt) from RTKLIB compiled from C source.
#
# ORACLE: RTKLIB (T. Takasu), github.com/tomojitakasu/RTKLIB
#   - Version : library "2.4.2", patch level p13, git tag v2.4.2-p13
#   - Commit  : 71db0ffa0d9735697c6adfd06fdf766d0e5ce807 (2018-01-30)
#   - License : BSD-2-Clause + two non-commercial/non-exclusivity clauses (NOTICE)
#   - Funcs   : readsp3() + peph2pos() (src/preceph.c), gpst2time()/satid2no()
#               (src/rtkcmn.c).
#
# WHAT THIS VALIDATES:
#   RTKLIB parses the vendored SP3-c precise-ephemeris file with its own SP3
#   reader and interpolates each satellite at a set of OFF-NODE epochs with
#   peph2pos(). peph2pos()/pephpos() rotates each tabulated node about +Z by
#   OMGE*(t_node - t_eval) ("correction for earth rotation ver.2.4.0",
#   preceph.c) BEFORE fitting an 11-point Neville polynomial -- the IGS-standard
#   precise-ephemeris interpolation. kshana reads the SAME bytes and interpolates
#   with kshana::sp3::Sp3Interpolator::position_ecef. The Rust test
#   tests/sp3_interp_reference.rs asserts per-axis agreement <= 1e-3 m.
#
# REPRODUCE:
#   1. Clone + checkout RTKLIB:
#        git clone https://github.com/tomojitakasu/RTKLIB /tmp/kshana-oracles/RTKLIB
#        git -C /tmp/kshana-oracles/RTKLIB checkout v2.4.2-p13   # commit 71db0ff
#   2. Run this script (it compiles the driver and rewrites the fixture).
set -euo pipefail
HERE="$(cd "$(dirname "$0")" && pwd)"
RTKLIB="${RTKLIB:-/tmp/kshana-oracles/RTKLIB}"
SP3="$HERE/igs16296.sp3"
BUILD="$(mktemp -d)"

# 1. compile the driver against RTKLIB's pure-C readsp3 + peph2pos path.
cc -O2 -D_DARWIN_C_SOURCE -DENAGLO -DENAGAL -DENACMP -DENAQZS -DENAIRN -DNFREQ=3 -ULAPACK \
   -Wno-unused -Wno-empty-body -Wno-format -Wno-deprecated-declarations \
   -I"$RTKLIB/src" \
   "$HERE/rtklib_sp3_driver.c" \
   "$RTKLIB/src/preceph.c" "$RTKLIB/src/rtkcmn.c" "$RTKLIB/src/ephemeris.c" \
   "$RTKLIB/src/rinex.c" "$RTKLIB/src/qzslex.c" "$RTKLIB/src/sbas.c" \
   "$RTKLIB/src/rtcm.c" "$RTKLIB/src/rtcm2.c" "$RTKLIB/src/rtcm3.c" \
   "$RTKLIB/src/rtcm3e.c" "$RTKLIB/src/ionex.c" "$RTKLIB/src/tle.c" \
   -lm -o "$BUILD/driver"

# 2. run it on the vendored SP3 file.
"$BUILD/driver" "$SP3" > "$BUILD/out.txt"

SP3_SHA="$(shasum -a 256 "$SP3" | cut -d' ' -f1)"

# 3. rewrite the fixture with provenance header + the RTKLIB output table.
{
  cat <<HDR
# kshana SP3 precise-ephemeris interpolation -> satellite ECEF position reference
# vectors. External oracle: RTKLIB peph2pos (the de-facto IGS precise-ephemeris
# interpolator). DO NOT EDIT BY HAND -- regenerate with
# generate_sp3_interp_reference.sh.
#
# ORACLE
#   Tool     : RTKLIB (T. Takasu), github.com/tomojitakasu/RTKLIB
#   Version  : library "2.4.2", patch level p13 (git tag v2.4.2-p13)
#   Commit   : 71db0ffa0d9735697c6adfd06fdf766d0e5ce807 (2018-01-30)
#   License  : BSD-2-Clause + two non-commercial/non-exclusivity clauses (NOTICE)
#   Funcs    : readsp3() [src/preceph.c] -> parse SP3-c into peph_t node table;
#              peph2pos() [src/preceph.c] -> precise-ephemeris interpolation.
#
# ALGORITHM (peph2pos -> pephpos, src/preceph.c)
#   For each query time the 11 tabulated epochs (NMAX=10) bracketing it are
#   selected. Each node's ECEF position is rotated about +Z by OMGE*(t_node -
#   t_eval) -- "correction for earh rotation ver.2.4.0" -- so all nodes are
#   expressed in the Earth-fixed frame at the SAME evaluation instant; THEN an
#   11-point polynomial is fit by Neville's algorithm and evaluated. OMGE =
#   7.2921151467E-5 rad/s (IS-GPS). It is this Earth-rotation node correction
#   that kshana's Sp3Interpolator is validated against.
#
# INPUT (identical bytes read by BOTH oracle and kshana)
#   File   : tests/fixtures/sp3_interp/igs16296.sp3
#   SHA-256: $SP3_SHA
#   The verbatim IGS final combined precise-orbit product igs16296.sp3 (RTKLIB's
#   own committed test datum, util/data/igs16296.sp3): GPS week 1629,
#   2011-04-02 00:00:00 GPST, 96 epochs on a 15-minute (900 s) grid, 32 GPS
#   satellites, ECEF positions in km + clock in microseconds. Bit-for-bit
#   identical to RTKLIB's util/data/igs16296.sp3.
#
# SAMPLING / TIME BASE
#   The SP3 file is on the GPS time scale (its %c header line says GPS) and its
#   first epoch is t_s = 0 (= GPS week 1629 second-of-week 518400.0). Each
#   satellite is sampled at OFF-NODE instants t_s = 900*k + frac for grid indices
#   k in {20,40,60,80} (interior, full 11-point window) and fractional offsets
#   frac in {112.5, 450.0, 675.0} s strictly inside the 900 s step, so the
#   polynomial interpolation -- not a node lookup -- is exercised. The oracle is
#   driven by gpst2time(1629, 518400 + 900*k + frac); the Rust side queries
#   kshana at position_ecef(900*k + frac). Both evaluate the identical instant
#   against the identical tabulated grid.
#
# COLUMNS (whitespace-separated)
#   sat  k   frac        t_s          X[m]                    Y[m]                    Z[m]
#   sat  = SP3 satellite id (e.g. G05)
#   k    = grid index of the node preceding the query
#   frac = fractional offset (s) past that node
#   t_s  = seconds from the SP3 file start (= 900*k + frac); the value kshana is
#          queried at via Sp3Interpolator::position_ecef(t_s)
#   X,Y,Z = RTKLIB peph2pos ECEF position to 17 significant digits
HDR
  cat "$BUILD/out.txt"
} > "$HERE/sp3_ecef_reference.txt"

rm -rf "$BUILD"
echo "wrote $HERE/sp3_ecef_reference.txt ($(grep -cv '^#' "$HERE/sp3_ecef_reference.txt") data rows)"
