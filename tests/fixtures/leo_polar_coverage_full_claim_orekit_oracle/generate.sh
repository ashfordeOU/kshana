#!/usr/bin/env bash
# Regenerates the M131 full-claim oracle fixture (tests/leo_polar_coverage_full_claim_orekit_oracle.rs).
# Run from the repository root with the package D8 oracle toolchain sourced:
#   source ~/Code/kshana-oracles/env13.sh && tests/fixtures/leo_polar_coverage_full_claim_orekit_oracle/generate.sh
set -euo pipefail
DIR=tests/fixtures/leo_polar_coverage_full_claim_orekit_oracle
: "${OREKIT13_CP:?source env13.sh first}" "${OREKIT13_DATA_NO_EOP:?}" "${ORACLE13_PY:?}"
# 1. Inputs: the grid and the element sets the engine builds from the scenarios.
cargo test --quiet --test leo_polar_coverage_full_claim_orekit_oracle -- --ignored write_the_fixture_inputs
# 2. Orekit 13.1.8, as a separate program.
BUILD=$(mktemp -d)
javac -nowarn -cp "$OREKIT13_CP" -d "$BUILD" "$DIR/LeoPolarFullClaimDriver.java"
for c in A B; do
  java -cp "$OREKIT13_CP:$BUILD" LeoPolarFullClaimDriver "$DIR" "$c"
  # 3. NumPy for the groups with several clock unknowns, and the aggregation.
  "$ORACLE13_PY" "$DIR/oracle_numpy.py" "$DIR" "$c"
done
rm -rf "$BUILD"
# The raw Orekit text output is large and is not committed; oracle_<c>.json keeps every number the test reads.
rm -f "$DIR"/orekit_A.txt "$DIR"/orekit_B.txt
sha256sum "$DIR"/inputs_*.json "$DIR"/elements_*.csv "$DIR"/oracle_*.json
