#!/usr/bin/env bash
# The canonical gate, and the only thing that may produce a green receipt.
#
# WHY
#   Two real defects reached the canonical gate this campaign, and both "would have reached
#   main under a partial gate" — a subset run, green, mistaken for the whole. A green is
#   only meaningful if it came from the WHOLE suite on the EXACT commit being pushed. This
#   script runs that suite and, only on success, writes a receipt saying so. The pre-push
#   hook refuses to push without one (see scripts/check-gate-receipt.sh).
#
# WHAT IT RUNS
#   1. `cargo test --all` — the canonical suite, unabridged.
#   2. `scripts/check-repeatability.sh` — the library suite N more times, to catch a
#      thread-interleaving race that one run cannot see. Set REPEAT=0 to skip it (the
#      receipt records how many repeat runs were actually done, so a skip is visible).
#
# TIMING
#   The repo's own ci.yml puts the healthy steady state at 62-79 minutes, with agency_lro
#   alone around 24. There is DELIBERATELY no timeout here: a timeout short enough to be
#   useful would kill a healthy run, and a gate that kills healthy runs is a gate people
#   learn to bypass. If it hangs, you will notice.
#
# THE RECEIPT
#   .gate-receipt.json at the repo root. Untracked and gitignored: it is machine state
#   about one run on one machine, not content. It is written ONLY when cargo exits 0.
#
# USAGE
#   scripts/gate.sh
#   REPEAT=0 scripts/gate.sh          # canonical suite only, no repeatability loop
#
# Exit 0 and a fresh receipt on success; the true cargo exit code on failure, and no
# receipt is written or left behind.

set -uo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT" || exit 1

RECEIPT="$ROOT/.gate-receipt.json"
LOG="$ROOT/target/gate-run.log"
REPEAT="${REPEAT:-3}"

mkdir -p "$ROOT/target"

COMMIT="$(git rev-parse HEAD 2>/dev/null || echo unknown)"
if [ -z "$(git status --porcelain 2>/dev/null)" ]; then
  TREE="clean"
else
  TREE="dirty"
fi

echo "gate: commit $COMMIT (tree $TREE)"
echo "gate: running the canonical suite — cargo test --all"
echo "gate: expect 62-79 minutes on a healthy tree; there is no timeout, by design"

# A stale receipt must never survive a failed run.
rm -f "$RECEIPT"

START=$(date +%s)
# NO PIPE. A pipeline reports the exit status of its LAST stage, so `cargo test | tee` would
# report tee's success while cargo exited 101. Redirect to a file and read $? from cargo.
cargo test --all > "$LOG" 2>&1
EXIT=$?
END=$(date +%s)
DURATION=$((END - START))

tail -40 "$LOG"
echo "gate: cargo test --all exited $EXIT after ${DURATION}s (full log: $LOG)"

if [ "$EXIT" -ne 0 ]; then
  echo "gate: FAILED — no receipt written" >&2
  grep -E '^(test .* FAILED|error(\[|:)|failures:)' "$LOG" | head -40 >&2
  exit "$EXIT"
fi

# Counts, read out of the run that just happened rather than asserted.
INTEGRATION_BINS=$(grep -cE '^[[:space:]]+Running tests/' "$LOG")
TOTAL_PASSED=$(sed -n 's/^test result: ok\. \([0-9]*\) passed.*/\1/p' "$LOG" \
  | awk '{s += $1} END {print s + 0}')
TOTAL_IGNORED=$(sed -n 's/^test result: ok\..*; \([0-9]*\) ignored.*/\1/p' "$LOG" \
  | awk '{s += $1} END {print s + 0}')

REPEAT_RUNS=0
if [ "$REPEAT" -gt 0 ]; then
  echo "gate: repeatability — $REPEAT runs of the library suite"
  "$ROOT/scripts/check-repeatability.sh" "$REPEAT"
  R_EXIT=$?
  if [ "$R_EXIT" -ne 0 ]; then
    echo "gate: FAILED — the library suite is not repeatable (exit $R_EXIT). No receipt." >&2
    exit "$R_EXIT"
  fi
  REPEAT_RUNS="$REPEAT"
else
  echo "gate: repeatability loop SKIPPED (REPEAT=0) — the receipt records repeat_runs 0"
fi

cat > "$RECEIPT" <<EOF
{
  "schema": "kshana-gate-receipt/1",
  "commit": "$COMMIT",
  "tree": "$TREE",
  "command": "cargo test --all",
  "exit_code": $EXIT,
  "integration_binaries": $INTEGRATION_BINS,
  "tests_passed": $TOTAL_PASSED,
  "tests_ignored": $TOTAL_IGNORED,
  "repeat_runs": $REPEAT_RUNS,
  "duration_s": $DURATION,
  "finished_utc": "$(date -u +%Y-%m-%dT%H:%M:%SZ)",
  "host": "$(hostname -s 2>/dev/null || echo unknown)",
  "rustc": "$(rustc --version 2>/dev/null || echo unknown)"
}
EOF

echo "gate: PASSED — receipt written to $RECEIPT"
cat "$RECEIPT"
exit 0
