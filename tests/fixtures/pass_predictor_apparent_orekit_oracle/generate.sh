#!/usr/bin/env bash
# Regenerates the apparent pass-predictor oracle fixture (tests/pass_predictor_apparent_orekit_oracle.rs).
# Run from the repository root with the package D8 oracle toolchain sourced:
#   source ~/Code/kshana-oracles/env13.sh && tests/fixtures/pass_predictor_apparent_orekit_oracle/generate.sh
set -euo pipefail
DIR=tests/fixtures/pass_predictor_apparent_orekit_oracle
: "${OREKIT13_CP:?source env13.sh first}" "${OREKIT13_DATA_NO_EOP:?}"
# 1. Inputs: the pre-registered cases.
cargo test --quiet --test pass_predictor_apparent_orekit_oracle -- --ignored write_the_fixture_inputs
# 2. Orekit 13.1.8, as a separate program.
BUILD=$(mktemp -d)
javac -nowarn -cp "$OREKIT13_CP" -d "$BUILD" "$DIR/PassesApparentDriver.java"
java -cp "$OREKIT13_CP:$BUILD" PassesApparentDriver "$DIR"
rm -rf "$BUILD"
sha256sum "$DIR"/cases.json "$DIR"/cases.csv "$DIR"/orekit.txt
# 3. Disclosure table: Orekit's P.834 refraction at heights above sea level.
BUILD=$(mktemp -d)
javac -nowarn -cp "$OREKIT13_CP" -d "$BUILD" "$DIR/RefractionTableDriver.java"
java -cp "$OREKIT13_CP:$BUILD" RefractionTableDriver "$DIR"
rm -rf "$BUILD"
sha256sum "$DIR"/orekit_refraction.txt
