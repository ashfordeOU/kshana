#!/usr/bin/env bash
# Regenerates the M131 leg-3 fixture (tests/leo_polar_coverage_on_path_orekit_oracle.rs).
# Run from the repository root after `bash xval/d8-orekit13/setup.sh && source ~/Code/kshana-oracles/env13.sh`.
set -euo pipefail
DIR=tests/fixtures/leo_polar_coverage_on_path_orekit_oracle
ROUND1=tests/fixtures/leo_polar_coverage_full_claim_orekit_oracle
: "${OREKIT13_CP:?source env13.sh first}" "${OREKIT13_DATA_NO_EOP:?}" "${ORACLE13_PY:?}"
cargo test --quiet --test leo_polar_coverage_on_path_orekit_oracle -- --ignored write_the_fixture_inputs
BUILD=$(mktemp -d)
javac -nowarn -cp "$OREKIT13_CP" -d "$BUILD" "$DIR/LeoPolarOnPathDriver.java"
for c in A B; do
  java -cp "$OREKIT13_CP:$BUILD" LeoPolarOnPathDriver "$DIR" "$c" "$ROUND1"
  "$ORACLE13_PY" "$DIR/oracle_numpy.py" "$DIR" "$c" "$ROUND1"
done
rm -rf "$BUILD"
rm -f "$DIR"/orekit_A.txt "$DIR"/orekit_B.txt
sha256sum "$DIR"/states_gcrs_*.csv "$DIR"/oracle_*.json
