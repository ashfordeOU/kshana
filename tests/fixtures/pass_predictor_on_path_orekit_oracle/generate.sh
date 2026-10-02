#!/usr/bin/env bash
# Regenerates the pass-predictor leg-3 fixture (tests/pass_predictor_on_path_orekit_oracle.rs).
# Run from the repository root after `bash xval/d8-orekit13/setup.sh && source ~/Code/kshana-oracles/env13.sh`.
set -euo pipefail
DIR=tests/fixtures/pass_predictor_on_path_orekit_oracle
ROUND1=tests/fixtures/pass_predictor_apparent_orekit_oracle
: "${OREKIT13_CP:?source env13.sh first}" "${OREKIT13_DATA_NO_EOP:?}"
BUILD=$(mktemp -d)
javac -nowarn -cp "$OREKIT13_CP" -d "$BUILD" "$DIR/PassesOnPathDriver.java"
java -cp "$OREKIT13_CP:$BUILD" PassesOnPathDriver "$DIR" "$ROUND1"
rm -rf "$BUILD"
sha256sum "$DIR"/orekit.txt
