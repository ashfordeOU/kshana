#!/usr/bin/env bash
# SPDX-License-Identifier: AGPL-3.0-only
#
# Regenerate the RINEX broadcast-ephemeris -> ECEF position external-oracle
# fixture (rinex_ecef_reference.txt) from RTKLIB compiled from C source.
#
# ORACLE: RTKLIB (T. Takasu), github.com/tomojitakasu/RTKLIB
#   - Version : library "2.4.2", patch level p13, git tag v2.4.2-p13
#   - Commit  : 71db0ffa0d9735697c6adfd06fdf766d0e5ce807 (2018-01-30)
#   - License : BSD-2-Clause + two non-commercial/non-exclusivity clauses (NOTICE)
#   - Funcs   : readrnx() (src/rinex.c), eph2pos() (src/ephemeris.c),
#               gpst2time/timeadd/timediff/satsys (src/rtkcmn.c).
#
# WHAT THIS VALIDATES:
#   RTKLIB parses the vendored multi-GNSS RINEX 3 nav slice with its own decoder
#   and evaluates each broadcast ephemeris at a set of tk offsets with its own
#   IS-GPS-200 user algorithm. kshana reads the SAME bytes and evaluates with
#   kshana::rinex::RinexEphemeris::sv_position_ecef. The Rust test
#   tests/rinex_sp3_interop_reference.rs asserts per-axis agreement <= 1e-2 m.
#
# REPRODUCE:
#   1. Clone + checkout RTKLIB:
#        git clone https://github.com/tomojitakasu/RTKLIB /tmp/kshana-oracles/RTKLIB
#        git -C /tmp/kshana-oracles/RTKLIB checkout v2.4.2-p13   # commit 71db0ff
#   2. Run this script (it compiles the driver and rewrites the fixture).
set -euo pipefail
HERE="$(cd "$(dirname "$0")" && pwd)"
KSHANA="$(cd "$HERE/../../.." && pwd)"
RTKLIB="${RTKLIB:-/tmp/kshana-oracles/RTKLIB}"
SLICE="$HERE/brdc_multignss_slice.rnx"
BUILD="$(mktemp -d)"

# 1. compile the driver against RTKLIB's pure-C readrnx + eph2pos path.
cc -O2 -D_DARWIN_C_SOURCE -DENAGLO -DENAGAL -DENACMP -DENAQZS -DENAIRN -DNFREQ=3 -ULAPACK \
   -Wno-unused -Wno-empty-body -Wno-format -Wno-deprecated-declarations \
   -I"$RTKLIB/src" \
   "$HERE/rtklib_driver.c" \
   "$RTKLIB/src/rinex.c" "$RTKLIB/src/ephemeris.c" "$RTKLIB/src/rtkcmn.c" \
   "$RTKLIB/src/preceph.c" "$RTKLIB/src/qzslex.c" "$RTKLIB/src/sbas.c" \
   "$RTKLIB/src/rtcm.c" "$RTKLIB/src/rtcm2.c" "$RTKLIB/src/rtcm3.c" \
   "$RTKLIB/src/rtcm3e.c" "$RTKLIB/src/ionex.c" "$RTKLIB/src/tle.c" \
   -lm -o "$BUILD/driver"

# 2. run it on the vendored slice.
"$BUILD/driver" "$SLICE" > "$BUILD/out.txt"

SLICE_SHA="$(shasum -a 256 "$SLICE" | cut -d' ' -f1)"

# 3. rewrite the fixture with provenance header + the RTKLIB output table.
{
  cat <<HDR
# kshana RINEX broadcast-ephemeris -> satellite ECEF position reference vectors.
# External oracle: RTKLIB eph2pos (independent IS-GPS-200 / Galileo OS SIS ICD /
# BeiDou OS SIS ICD implementation). DO NOT EDIT BY HAND -- regenerate with
# generate_rinex_sp3_interop_reference.sh.
#
# ORACLE
#   Tool     : RTKLIB (T. Takasu), github.com/tomojitakasu/RTKLIB
#   Version  : library "2.4.2", patch level p13 (git tag v2.4.2-p13)
#   Commit   : 71db0ffa0d9735697c6adfd06fdf766d0e5ce807 (2018-01-30)
#   License  : BSD-2-Clause + two non-commercial/non-exclusivity clauses (NOTICE)
#   Funcs    : readrnx() [src/rinex.c]  -> RINEX 3 nav decode into eph_t records;
#              eph2pos() [src/ephemeris.c] -> broadcast Keplerian ECEF position
#              (per-system mu/Earth-rate: MU_GPS=3.9860050E14,
#              MU_GAL=MU_CMP=3.986004418E14, OMGE_GAL=7.2921151467E-5,
#              OMGE_CMP=7.292115E-5). Compiled pure-C (-ULAPACK).
#
# ALGORITHM
#   Solve Kepler's equation for the eccentric anomaly E from the broadcast mean
#   anomaly; form the corrected argument of latitude / radius / inclination with
#   the second-harmonic Cuc/Cus, Crc/Crs, Cic/Cis terms; rotate the orbital-plane
#   position into the Earth-fixed (ECEF) frame through the corrected node
#   accounting for Earth rotation since toe. IS-GPS-200 §20.3.3.4.3.
#
# INPUT (identical bytes read by BOTH oracle and kshana)
#   File   : tests/fixtures/rinex_sp3_interop/brdc_multignss_slice.rnx
#   SHA-256: $SLICE_SHA
#   A self-contained multi-GNSS RINEX 3.05 navigation slice: the verbatim header
#   plus one healthy broadcast record each for 4 GPS, 4 Galileo, and 4 BeiDou-MEO
#   satellites, carved from the open BKG/IGS real-time product
#   BRDC00WRD_S_20242540000_01D_MN.rnx (DOY 254 2024, GPS week 2331). QZSS records
#   in the source file are all flagged unhealthy (svh!=0) and are not included.
#
# SAMPLING / TIME BASE
#   Each ephemeris is evaluated at tk in {-3600,-1800,-600,0,600,1800,3600} s,
#   where tk = t - toe is the time from that ephemeris's reference epoch. The
#   oracle is driven by RTKLIB timeadd(eph->toe, tk); the Rust side evaluates
#   kshana at eph.toe + tk. Driving by tk makes both sides compute the identical
#   tk and isolates the POSITION algorithm from time-system bookkeeping (notably
#   RTKLIB's BeiDou BDT->GPST conversion of toe, which kshana keeps in BDT).
#
# COLUMNS (whitespace-separated)
#   sys  prn  toes        iode  tk          X[m]                    Y[m]                    Z[m]
#   sys  = RINEX system letter (G GPS, E Galileo, C BeiDou)
#   prn  = PRN within system
#   toes = ephemeris toe seconds-in-week (the (sys,prn,toes) match key)
#   iode = RTKLIB-reported issue-of-data (informational; not used for matching --
#          RTKLIB and kshana encode Galileo IODnav / BeiDou IODE differently)
#   X,Y,Z = RTKLIB eph2pos ECEF position to 17 significant digits
HDR
  cat "$BUILD/out.txt"
} > "$HERE/rinex_ecef_reference.txt"

rm -rf "$BUILD"
echo "wrote $HERE/rinex_ecef_reference.txt ($(grep -cv '^#' "$HERE/rinex_ecef_reference.txt") data rows)"
