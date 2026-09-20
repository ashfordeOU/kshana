#!/usr/bin/env bash
# Run the LIBRARY test suite N times and fail if the set of passing tests differs.
#
# WHY
#   Thread-interleaving nondeterminism does not surface in one run. Finding F22 was a race
#   between three library tests over a shared temp file: the same source passed on one
#   commit and failed on the next, and the green was a coin toss. `tests/source_guards.rs`
#   stops that defect being written; this script is the behavioural check that the suite
#   actually is repeatable, whatever the cause.
#
# WHAT IT CATCHES
#   A test that passes in one run and fails, panics or vanishes in another, when the only
#   thing that changed is the thread interleaving. Cargo runs the library tests as parallel
#   threads of ONE process, so this is exactly the regime F22 lived in.
#
# WHAT IT DOES NOT CATCH
#   * Rare races. N=3 samples an interleaving three times; a 1-in-500 race will look clean.
#     It raises the cost of a flake reaching the gate, it does not prove there is none.
#   * Integration tests (`tests/*.rs`). Each is its own process, so they are a different
#     (and much cheaper to get right) concurrency regime, and running them N times would
#     cost far more than the gate can afford. `--all` covers correctness; this covers
#     repeatability of the one binary where threads share a process.
#   * Nondeterminism that is stable within a machine — a fixed dependence on wall-clock
#     date, locale, hostname or CPU count reproduces identically across these N runs.
#   * A test that is nondeterministic but always passes (e.g. it asserts nothing).
#
# USAGE
#   scripts/check-repeatability.sh [N]        # default N=3
#   REPEAT=5 scripts/check-repeatability.sh
#
# Exit 0 when every run produced the identical set of passing tests; 1 otherwise.

set -uo pipefail

N="${1:-${REPEAT:-3}}"
# An empty parse is not a green. If the harness output format ever changes, the `test ...
# ok` sed below silently yields nothing and every run "agrees" on the empty set. The
# library suite is ~2000 tests; anything near zero means the parse broke, not that the
# suite shrank.
MIN_PASSING="${MIN_PASSING:-100}"
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
WORK="$(mktemp -d "${TMPDIR:-/tmp}/kshana-repeat.XXXXXX")"
trap 'rm -rf "$WORK"' EXIT

cd "$ROOT" || exit 1

echo "repeatability: building the library test binary once"
cargo test --lib --no-run --quiet
BUILD_EXIT=$?
if [ "$BUILD_EXIT" -ne 0 ]; then
  echo "repeatability: FAILED — the library tests do not build (exit $BUILD_EXIT)" >&2
  exit 1
fi

case "$N" in
  ''|*[!0-9]*) echo "repeatability: N must be a positive integer, got '$N'" >&2; exit 1 ;;
esac
[ "$N" -ge 1 ] || { echo "repeatability: N must be >= 1, got $N" >&2; exit 1; }

FAILED_RUNS=""
i=1
while [ "$i" -le "$N" ]; do
  OUT="$WORK/run-$i.txt"
  START=$(date +%s)
  # No pipe on this command: a pipeline would report the exit status of the LAST stage and
  # a non-zero cargo exit would be invisible. Capture it from cargo itself.
  cargo test --lib > "$OUT" 2>&1
  EXIT=$?
  END=$(date +%s)
  # `test <name> ... ok` -> <name>, sorted. This is the run's passing set.
  sed -n 's/^test \(.*\) \.\.\. ok$/\1/p' "$OUT" | sort > "$WORK/pass-$i.txt"
  COUNT=$(wc -l < "$WORK/pass-$i.txt" | tr -d ' ')
  echo "repeatability: run $i/$N — exit $EXIT, $COUNT passing, $((END - START))s"
  if [ "$EXIT" -ne 0 ]; then
    FAILED_RUNS="$FAILED_RUNS $i"
  fi
  i=$((i + 1))
done

if [ -n "$FAILED_RUNS" ]; then
  echo "repeatability: FAILED — cargo exited non-zero on run(s):$FAILED_RUNS" >&2
  for i in $FAILED_RUNS; do
    echo "--- run $i failures ---" >&2
    grep -E '^(test .* FAILED|---- .* stdout ----)' "$WORK/run-$i.txt" | head -40 >&2
  done
  exit 1
fi

BASE_COUNT=$(wc -l < "$WORK/pass-1.txt" | tr -d ' ')
if [ "$BASE_COUNT" -lt "$MIN_PASSING" ]; then
  echo "repeatability: FAILED — parsed only $BASE_COUNT passing tests (expected >= $MIN_PASSING)." >&2
  echo "  The suite did not shrink; the output parse broke. An empty set agrees with itself" >&2
  echo "  on every run, so this would otherwise report a green that checked nothing." >&2
  exit 1
fi

DRIFT=0
# `seq 2 1` counts DOWN on BSD/macOS and would compare run 1 against a run that never
# happened, so N=1 must skip this loop explicitly rather than rely on an empty range.
i=2
while [ "$i" -le "$N" ]; do
  if ! diff -u "$WORK/pass-1.txt" "$WORK/pass-$i.txt" > "$WORK/diff-$i.txt"; then
    DRIFT=1
    echo "repeatability: run $i disagrees with run 1 about which tests pass:" >&2
    sed -n '3,40p' "$WORK/diff-$i.txt" >&2
  fi
  i=$((i + 1))
done

if [ "$DRIFT" -ne 0 ]; then
  cat >&2 <<'EOT'
repeatability: FAILED — the same source produced a different set of passing tests across
runs. That is a race, not a flake to be retried. The library tests are parallel threads of
ONE process: look for state they share — a temp path, a static, an env var, a fixed port.
EOT
  exit 1
fi

echo "repeatability: OK — $N runs, identical passing set ($BASE_COUNT tests)"
exit 0
