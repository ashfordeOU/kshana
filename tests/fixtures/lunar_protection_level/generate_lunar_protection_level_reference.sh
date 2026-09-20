#!/usr/bin/env bash
# SPDX-License-Identifier: AGPL-3.0-only
#
# Regenerate lunar_protection_level_reference.txt end to end.
#
# ORACLE (two established third-party implementations, composed):
#   1. RTKLIB, T. Takasu. Library version string "2.4.2", patch level "p13"
#      (git tag v2.4.2-p13), commit 71db0ffa0d9735697c6adfd06fdf766d0e5ce807.
#      Licence: BSD 2-Clause + two non-exclusivity clauses. NOT vendored here --
#      this script fetches src/rtklib.h and src/rtkcmn.c and compiles them.
#      Used for: lsq() -> matinv() -> ludcmp()/lubksb(), the Crout-LU inverse of the
#      normal matrix, giving (GtG)^-1 for the all-in-view geometry and for each
#      single-satellite-excluded sub-geometry. kshana inverts the same matrix with a
#      hand-written Gauss-Jordan invert4().
#   2. SciPy / NumPy. norm.isf for the Bonferroni detector multiplier, norm.sf
#      (Cephes ndtr) for every integrity-risk tail term, optimize.brentq for the
#      protection-level root, and linalg.inv as a third independent matrix inverse
#      whose disagreement with RTKLIB is measured into the fixture header.
#      The committed fixture was produced with Python 3.14.2, NumPy 2.4.1,
#      SciPy 1.17.0 on macOS/arm64.
#
# WHAT IS VALIDATED, AND WHAT IS NOT:
#   Validated externally -- the geometry-to-covariance step ((GtG)^-1 and its
#   vertical/horizontal projection) and the statistical kernel (normal quantile,
#   normal upper tail, and the root solve mapping an integrity-risk budget to a
#   protection level).
#   NOT validated -- the sigma_URE budget, the per-satellite fault prior and the
#   illustrative Moonlight/LCNS-class constellation, all of which are MODELLED inputs
#   handed to the oracle as given; and the FORM of the single-fault MHSS integrity
#   equation, which the Python generator transcribes from the same published bound
#   kshana implements. A shared closed form is a shared assumption.
#
# Usage:  ./generate_lunar_protection_level_reference.sh
# Env:    RTKLIB  -- an existing RTKLIB checkout to use instead of fetching.
set -euo pipefail

HERE="$(cd "$(dirname "$0")" && pwd)"
KSHANA="$(cd "$HERE/../../.." && pwd)"
RTKLIB="${RTKLIB:-/tmp/kshana-oracles/RTKLIB}"
COMMIT=71db0ffa0d9735697c6adfd06fdf766d0e5ce807
RAW="https://raw.githubusercontent.com/tomojitakasu/RTKLIB/${COMMIT}/src"
BUILD="$(mktemp -d)"
trap 'rm -rf "$BUILD"' EXIT

# 0. RTKLIB source (two translation units are enough for the linear-algebra kernel).
mkdir -p "$RTKLIB/src"
for f in rtklib.h rtkcmn.c; do
  [ -f "$RTKLIB/src/$f" ] || curl -sSL -o "$RTKLIB/src/$f" "$RAW/$f"
done
echo "RTKLIB source SHA-256:"
shasum -a 256 "$RTKLIB/src/rtklib.h" "$RTKLIB/src/rtkcmn.c"

# 1. Dump the modelled geometry from kshana (the shared input half of the fixture).
(cd "$KSHANA" && cargo test --test lunar_protection_level_reference --jobs 2 -- \
  --ignored --nocapture dump_lunar_protection_level_geometry) \
  | grep -E '^(CASE|USER|SAT) ' > "$BUILD/geom.raw"

# 2. Compile the RTKLIB driver (pure-C path: -ULAPACK selects ludcmp/lubksb).
cc -O2 -D_DARWIN_C_SOURCE -ULAPACK -I"$RTKLIB/src" \
   "$HERE/oracle.c" "$RTKLIB/src/rtkcmn.c" -lm -o "$BUILD/oracle"

# 3. RTKLIB computes every hypothesis covariance.
"$BUILD/oracle" < "$BUILD/geom.raw" > "$BUILD/q.out"

# 4. SciPy/NumPy turn those covariances into protection levels and write the fixture.
python3 "$HERE/generate_lunar_protection_level_reference.py" \
  "$BUILD/geom.raw" "$BUILD/q.out" > "$HERE/lunar_protection_level_reference.txt"

echo "wrote $HERE/lunar_protection_level_reference.txt"
