#!/usr/bin/env bash
# Regenerates tests/fixtures/earth_orbit_path_sgp4_erfa_oracle (legs 1 and 2 of package D8).
# Run from the repository root after `bash xval/d8-orekit13/setup.sh && source ~/Code/kshana-oracles/env13.sh`.
set -euo pipefail
DIR=tests/fixtures/earth_orbit_path_sgp4_erfa_oracle
: "${ORACLE13_PY:?source env13.sh first}"
cargo test --quiet --test earth_orbit_path_sgp4_erfa_oracle -- --ignored write_the_fixture_inputs
"$ORACLE13_PY" "$DIR/oracle.py"
sha256sum "$DIR"/*.csv
