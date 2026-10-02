#!/usr/bin/env bash
# Run PocketSDR-AFS on Kshana's AFS recording for the pre-registered decodability comparison.
#   xval/lunar-afs/run_pocketsdr.sh [ORACLE_ROOT] [RUN_SUBDIR] [PRNS]
# Defaults: ~/Code/kshana-oracles/lunar-afs, run-psdr, 2-8 (the first pre-registration);
# the second uses run-psdr-4bit and 2-12. Expects RUN_SUBDIR/afs.sigmf-data (written by the
# ignored generator test of the matching tests/lunar_afs_decodability_pocketsdr*_oracle.rs) and the
# S-band build of build_oracles.sh. Builds the print-only copy, runs both builds, checks guard
# G0 and writes run-psdr/log_l3.txt (unpatched) and run-psdr/log_l4.txt (print-only build).
set -euo pipefail
HERE="$(cd "$(dirname "$0")" && pwd)"
O="${1:-$HOME/Code/kshana-oracles/lunar-afs}"
R="$O/${2:-run-psdr}"
PRNS="${3:-2-8}"
P="$O/PocketSDR-AFS"
T="$O/psdr-trace"
python3 "$HERE/apply_psdr_trace.py" "$P" "$T"
(cd "$P" && git diff --stat) > "$R/psdr_sband.diffstat"
diff -ru "$P/src" "$T/src" > "$R/psdr_trace.patch" || true
diff -ru "$P/app/pocket_trk/pocket_trk.c" "$T/app/pocket_trk/pocket_trk.c" >> "$R/psdr_trace.patch" || true
(cd "$T/lib/build" && make -s >/dev/null 2>&1 && make -s install >/dev/null 2>&1)
(cd "$T/app/pocket_trk" && make -s >/dev/null 2>&1)
ARGS=(-sig AFSD -prn "$PRNS" -sig AFSP -prn "$PRNS" -fmt INT8X2 -f 12 -IQ 2)
(cd "$P/app/pocket_trk" && ./pocket_trk "${ARGS[@]}" -log "$R/log_l3.txt" "$R/afs.sigmf-data" > "$R/stdout_l3.txt" 2>&1)
(cd "$T/app/pocket_trk" && ./pocket_trk "${ARGS[@]}" -log "$R/log_l4.txt" "$R/afs.sigmf-data" > "$R/stdout_l4.txt" 2>&1)
# G0: every level-3 record of the unpatched build appears, identically, in the print-only build.
tr -d '\r' < "$R/log_l3.txt" | grep -v '^\$TIME' | grep -v ',START NCH=' | sort > "$R/l3.sorted"
tr -d '\r' < "$R/log_l4.txt" | grep -v '^\$TIME' | grep -v ',START NCH=' | sort > "$R/l4.sorted"
missing=$(comm -23 "$R/l3.sorted" "$R/l4.sorted" | wc -l)
echo "G0: level-3 records of the unpatched build missing from the print-only build: $missing"
[ "$missing" -eq 0 ]
sha256sum "$R/afs.sigmf-data" "$R/afs.sigmf-meta" "$R/log_l3.txt" "$R/log_l4.txt"
