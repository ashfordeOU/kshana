#!/usr/bin/env bash
# SPDX-License-Identifier: AGPL-3.0-only
#
# Generator for the lunar_differential_pnt external-oracle reference fixture.
#
# ORACLE: RTKLIB 2.4.3 relative/DGPS positioning kernel, compiled from C source.
#   - Repository : github.com/tomojitakasu/RTKLIB
#   - Version    : library string "2.4.2", git tag v2.4.2-p13, commit 71db0ff
#                  (2018-01-30); the 2.4.3 branch shares this rtkcmn.c lsq()/matinv()
#                  kernel verbatim.
#   - Author     : T. Takasu
#   - License    : BSD 2-Clause (+ two non-exclusivity clauses); see RTKLIB/readme.txt.
#   - Files used : src/rtkcmn.c  -> dot(), norm(), lsq() (x=(A A^T)^-1 A y normal-
#                  equations WLS solve), matmul()/matinv()/ludcmp()/lubksb() (the
#                  pure-C linear-algebra path, selected with -ULAPACK so no BLAS/
#                  LAPACK is linked). lsq() is the same kernel pntpos.c::estpos()
#                  drives for the standalone/relative position solve.
#
# WHAT THIS VALIDATES:
#   For the IDENTICAL injected common-mode orbit+clock errors and MCMF geometry that
#   kshana's deterministic LunarDpntScenario produces (8-sat LCNS-class constellation,
#   ref at -89 deg lat, user offset by baseline along the surface), RTKLIB's primitives
#   independently compute:
#     (1) the per-satellite single-difference corrected pseudorange residual
#           sd_i = raw_i - corr_i = -e_i . (u_user - u_ref)   [m]   (clock cancels), and
#     (2) the resulting 3-D user position-error magnitude from a 4-parameter
#           (x,y,z,clk) WLS snapshot solve via RTKLIB lsq().
#
# HONEST SCOPE / INDEPENDENCE (the moat):
#   The GEOMETRY (Keplerian sat positions, selenographic->MCMF, injected errors) is
#   kshana's own and is passed to the oracle as given numeric inputs (it is not
#   re-derived in C -- doing so would just re-implement kshana). What is independent is
#   the COMPUTATION on that geometry: RTKLIB's compiled-C dot/norm for the LOS-difference
#   residual and, crucially, RTKLIB's lsq()/matinv() LU-decomposition (ludcmp/lubksb) for
#   the position solve, versus kshana's hand-rolled invert4() 4x4 inverse. Both sides
#   implement the SAME first-order LOS-difference + (G^T G)^-1 G^T WLS algebra, so this is
#   an INTERNAL-CONSISTENCY / shared-algorithm cross-check executed by two independent
#   code bases and two independent matrix inverters -- NOT a check against an independent
#   physical model of lunar differential PNT. It catches algebra/indexing/conditioning
#   bugs on either side; it does not validate the modelling assumptions.
#
# REPRODUCE:
#   1. Dump kshana's exact scenario geometry (throwaway test, captured to a raw file):
#        cargo test --test _dump_lunar_dpnt_geom -- --nocapture \
#          | grep -E '^(CASE|REF|USER|SAT) ' > geom.raw
#      (the dumper mirrors LunarDpntScenario over baselines {0,1,10,50,100,250,500} km
#       x seeds {42,7}.)
#   2. Compile the oracle against RTKLIB rtkcmn.c (pure-C path):
#        cc -O2 -D_DARWIN_C_SOURCE -ULAPACK -I$RTKLIB/src \
#           oracle.c $RTKLIB/src/rtkcmn.c -lm -o oracle
#   3. Run:  ./oracle < geom.raw   -> the ORACLE lines below.
#   The fixture interleaves the geometry (CASE/REF/USER/SAT) with the matching ORACLE
#   line so the Rust test can both reconstruct the inputs and compare the outputs.
#
# This script regenerates lunar_differential_pnt_reference.txt end-to-end.
set -euo pipefail
HERE="$(cd "$(dirname "$0")" && pwd)"
KSHANA="$(cd "$HERE/../../.." && pwd)"
RTKLIB="${RTKLIB:-/tmp/kshana-oracles/RTKLIB}"
BUILD="$(mktemp -d)"

# 1. dump kshana geometry
( cd "$KSHANA" && cargo test --test _dump_lunar_dpnt_geom -- --nocapture ) \
  | grep -E '^(CASE|REF|USER|SAT) ' > "$BUILD/geom.raw"

# 2. compile oracle
cp "$HERE/oracle.c" "$BUILD/oracle.c"
cc -O2 -D_DARWIN_C_SOURCE -ULAPACK -I"$RTKLIB/src" \
   "$BUILD/oracle.c" "$RTKLIB/src/rtkcmn.c" -lm -o "$BUILD/oracle"

# 3. run oracle
"$BUILD/oracle" < "$BUILD/geom.raw" > "$BUILD/oracle.out"

# 4. interleave geometry + matching oracle line into the fixture body
python3 - "$BUILD/geom.raw" "$BUILD/oracle.out" <<'PY'
import sys
geom = open(sys.argv[1]).read().splitlines()
orc  = {}
for ln in open(sys.argv[2]):
    p = ln.split()
    orc[(p[0], p[1])] = ln.rstrip("\n")  # (seed, baseline) -> full oracle line
out = []
i = 0
while i < len(geom):
    g = geom[i].split()
    if g[0] == "CASE":
        seed, base = g[1], g[2]
        out.append(geom[i])                       # CASE seed baseline n
        key = (seed, base)
        out.append("ORACLE " + orc[key])          # ORACLE seed baseline n poserr maxsd sd...
    else:
        out.append(geom[i])
    i += 1
print("\n".join(out))
PY

rm -rf "$BUILD"
