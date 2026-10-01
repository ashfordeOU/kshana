#!/bin/sh
# Regenerate tests/fixtures/integrity_snapshot_raim_rtklib_oracle/ (run from the repository root
# after `source ~/Code/kshana-oracles/env.sh`, which sets $RTKLIB and $ORACLE_PY).
set -e
HERE="$(dirname "$0")"
OUT=tests/fixtures/integrity_snapshot_raim_rtklib_oracle
IN=tests/fixtures/joint_pvt_itrf_rtklib_oracle
BIN="${TMPDIR:-/tmp}/raim_harness"
sh "$HERE/build.sh" "$BIN"
mkdir -p "$OUT"
"$BIN" "$IN/abmf_2018133_300s_GE_C1C.rnx" "$IN/brdc_2018133_G_Einav.rnx" "$OUT"
"$ORACLE_PY" "$HERE/slope_pl.py" "$OUT"
