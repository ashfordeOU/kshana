#!/usr/bin/env bash
# Run LANS-AFS-SIM for the pre-registered waveform comparison (W0-W3).
#   xval/lunar-afs/run_lans.sh [ORACLE_ROOT]
# Writes, under ORACLE_ROOT/run-lans/: lans_codes.txt (W1), one_node_almanac.txt, the
# noise-free 16-bit IQ file of the S-band build (iq16.bin) and the trace of the patched build
# (trace.txt), after checking that the patched build's IQ is byte-identical (W0).
set -euo pipefail
O="${1:-$HOME/Code/kshana-oracles/lunar-afs}"
R="$O/run-lans"
mkdir -p "$R"
(cd "$O/lans-sband" && ./lans_codes > "$R/lans_codes.txt")
# One node: the first entry of the simulator's own default almanac that is above the horizon
# at its default start and site (PRN-02). The pre-registered "first entry" (PRN-01) is below
# the horizon there, so that run has no channel and an all-zero file (disclosed deviation).
awk '/almanac for PRN-02/{f=1} f&&/^$/{exit} f' "$O/lans-sband/default_almanac.txt" > "$R/one_node_almanac.txt"
grep -q 'ID: *02' "$R/one_node_almanac.txt"
export OMP_NUM_THREADS=1
(cd "$O/lans-sband" && ./afs_sim -t 24 -e "$R/one_node_almanac.txt" "$R/iq16.bin") 2> "$R/sband.log"
(cd "$O/lans-trace" && AFS_TRACE="$R/trace.txt" ./afs_sim -t 24 -e "$R/one_node_almanac.txt" "$R/iq16_trace.bin") 2> "$R/trace.log"
if cmp -s "$R/iq16.bin" "$R/iq16_trace.bin"; then
  echo "W0: patched and unpatched IQ files are byte-identical"
  rm -f "$R/iq16_trace.bin"
else
  echo "W0 FAILED: the print-only patch changed the IQ output" >&2
  exit 1
fi
sha256sum "$R/iq16.bin" "$R/one_node_almanac.txt" "$R/lans_codes.txt" "$R/trace.txt"
tr '\r' '\n' < "$R/sband.log" | grep -v '^Time' | head -20
