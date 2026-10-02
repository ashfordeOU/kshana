#!/usr/bin/env bash
# Regenerates the M131 oracle fixture (tests/leo_polar_coverage_orekit_oracle.rs).
# Run from the repository root with the oracle toolchain sourced:
#   source ~/Code/kshana-oracles/env.sh && tests/fixtures/leo_polar_coverage_orekit_oracle/generate.sh
set -euo pipefail
DIR=tests/fixtures/leo_polar_coverage_orekit_oracle
: "${OREKIT_CP:?source the oracle env.sh first}" "${OREKIT_DATA:?}" "${ORACLE_PY:?}"
# 1. Inputs: the grid and the engine's tabulated Earth-fixed satellite states.
cargo run --quiet --example gen_leo_polar_coverage_oracle_inputs
# 2. Orekit 12.2, as a separate program.
BUILD=$(mktemp -d)
javac -nowarn -cp "$OREKIT_CP" -d "$BUILD" "$DIR/LeoPolarOrekitDriver.java"
for c in A B; do
  java -cp "$OREKIT_CP:$BUILD" LeoPolarOrekitDriver "$DIR" "$c"
  # 3. NumPy for the groups with several clock unknowns, and the aggregation.
  "$ORACLE_PY" "$DIR/oracle_numpy.py" "$DIR" "$c"
done
rm -rf "$BUILD"
# The raw Orekit text output is large and is not committed; oracle_<c>.json keeps every number the test reads.
rm -f "$DIR"/orekit_A.txt "$DIR"/orekit_B.txt
sha256sum "$DIR"/inputs_*.json "$DIR"/states_*.csv "$DIR"/oracle_*.json
