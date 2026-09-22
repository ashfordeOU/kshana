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
# MEMORY
#   cargo runs a binary's tests on one thread per CPU. On a 14-core machine that is 14
#   heavy numerical tests resident at once, and a run of this suite was killed by the OS
#   for low memory partway through — not a failure, but no verdict either. TEST_THREADS
#   caps that concurrency. It is RECORDED IN THE RECEIPT, because a run at reduced
#   concurrency is a slightly weaker run: a thread-interleaving race has fewer threads to
#   interleave. The repeatability loop is deliberately left at full concurrency, since
#   catching exactly that class of race is its whole job.
#
# USAGE
#   scripts/gate.sh
#   REPEAT=0 scripts/gate.sh           # canonical suite only, no repeatability loop
#   TEST_THREADS=6 scripts/gate.sh     # cap per-binary test concurrency (default: all cores)
#
# Exit 0 and a fresh receipt on success; the true cargo exit code on failure, and no
# receipt is written or left behind.

set -uo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT" || exit 1

RECEIPT="$ROOT/.gate-receipt.json"
REPEAT="${REPEAT:-3}"
TEST_THREADS="${TEST_THREADS:-}"

mkdir -p "$ROOT/target"

# SINGLE WRITER, and a per-run log.
#
# Two gates on one checkout share target/, and before this they also shared ONE log path.
# That is not a tidiness problem: the counts in the receipt below — integration_binaries,
# tests_passed, tests_ignored — are read back OUT of that log. A gate that was killed but
# whose test binary was still alive kept writing into the file the next run had just
# truncated, so one run's numbers could land in the other run's receipt, and the pre-push
# hook trusts the receipt. That is how a push gets authorised by a suite that never ran on
# the tree being pushed.
#
# So: refuse to start alongside a live gate, and give each run its own log. Exit 75 marks
# the refusal as "not run", distinct from a red suite.
LOCK="$ROOT/target/.gate.lock"
if [ -e "$LOCK" ]; then
  OTHER="$(cat "$LOCK" 2>/dev/null || true)"
  if [ -n "${OTHER:-}" ] && kill -0 "$OTHER" 2>/dev/null; then
    echo "gate: REFUSED — another gate (pid $OTHER) is already running on this checkout." >&2
    echo "gate:   Two gates race for target/, and the receipt reads its counts back out of" >&2
    echo "gate:   the run log, so a second writer can put one run's numbers into the" >&2
    echo "gate:   other's receipt. Wait for it to finish, or kill pid $OTHER." >&2
    exit 75
  fi
  echo "gate: clearing a stale lock left by pid ${OTHER:-unknown} (no such process)"
  rm -f "$LOCK"
fi
echo $$ > "$LOCK"

LOG="$ROOT/target/gate-run.$$.log"
# Keep target/gate-run.log as the name a human looks for, refreshed from THIS run's log on
# the way out, whichever way out that is.
trap 'cp -f "$LOG" "$ROOT/target/gate-run.log" 2>/dev/null || true; rm -f "$LOCK"' EXIT
find "$ROOT/target" -maxdepth 1 -name 'gate-run.*.log' -mtime +1 -delete 2>/dev/null || true

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
if [ -n "$TEST_THREADS" ]; then
  echo "gate: per-binary test concurrency capped at $TEST_THREADS (recorded in the receipt)"
  cargo test --all -- --test-threads="$TEST_THREADS" > "$LOG" 2>&1
else
  cargo test --all > "$LOG" 2>&1
fi
EXIT=$?
END=$(date +%s)
DURATION=$((END - START))

tail -40 "$LOG"
echo "gate: cargo test --all exited $EXIT after ${DURATION}s (full log: $LOG)"

if [ "$EXIT" -ne 0 ]; then
  # A process killed by a signal exits 128+N. That is NOT a test failure and must not be
  # read as one: an OS out-of-memory kill leaves a log with zero failing tests, and the
  # failure grep below would then print nothing at all, which reads like a mystery red.
  # Say plainly which of the two happened.
  if [ "$EXIT" -gt 128 ]; then
    SIG=$((EXIT - 128))
    echo "gate: KILLED by signal $SIG after ${DURATION}s — this is NOT a test failure." >&2
    echo "gate: $(grep -c '^test result: ok' "$LOG") test binaries had completed, with \
$(grep -c '^test result: FAILED' "$LOG") failing. No verdict was reached and no receipt \
is written. Signal 9 during a long run is usually the OS reclaiming memory; re-run, and \
if it recurs cap concurrency with TEST_THREADS." >&2
    exit "$EXIT"
  fi
  echo "gate: FAILED — no receipt written" >&2
  grep -E '^(test .* FAILED|error(\[|:)|failures:)' "$LOG" | head -40 >&2
  exit "$EXIT"
fi

# The receipt names a commit and a tree state, and both were read BEFORE the suite ran.
# A run takes over an hour, which is ample time for someone — including whoever launched
# it — to edit the tree underneath it. That happened: files were changed mid-run, and the
# receipt would have certified a "clean" tree at a commit whose working copy no longer
# matched what was compiled. A receipt that describes what the gate INTENDED to test
# rather than what it tested is worse than no receipt, because the pre-push hook trusts
# it. Re-read both and refuse if either moved.
COMMIT_AFTER="$(git rev-parse HEAD 2>/dev/null || echo unknown)"
if [ -z "$(git status --porcelain 2>/dev/null)" ]; then
  TREE_AFTER="clean"
else
  TREE_AFTER="dirty"
fi
if [ "$COMMIT_AFTER" != "$COMMIT" ] || [ "$TREE_AFTER" != "$TREE" ]; then
  echo "gate: FAILED — the working tree moved while the suite was running." >&2
  echo "gate:   at start: $COMMIT (tree $TREE)" >&2
  echo "gate:   at end:   $COMMIT_AFTER (tree $TREE_AFTER)" >&2
  echo "gate: The suite is green, but it is green for a mixture of states, so no receipt \
is written. Commit or stash, then re-run on a tree that stays still." >&2
  exit 1
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
  "test_threads": "${TEST_THREADS:-default (one per core)}",
  "duration_s": $DURATION,
  "finished_utc": "$(date -u +%Y-%m-%dT%H:%M:%SZ)",
  "host": "$(hostname -s 2>/dev/null || echo unknown)",
  "rustc": "$(rustc --version 2>/dev/null || echo unknown)"
}
EOF

echo "gate: PASSED — receipt written to $RECEIPT"
cat "$RECEIPT"
exit 0
