#!/usr/bin/env bash
# Documentation-coverage ratchet.
#
# `#![warn(missing_docs)]` is deliberately NOT a crate attribute: with CI's `-D warnings`
# it would turn ~1000 currently-undocumented public items (overwhelmingly struct fields)
# into a hard build failure overnight. Instead this guard compiles the library with the
# lint enabled, counts the warnings, and fails only if the count *rises* above a pinned
# ceiling. So documentation coverage can never silently erode — a new undocumented public
# item fails the build — while the existing backlog is paid down deliberately, not in one
# unreviewable sweep. The ceiling is a one-way ratchet: lower it when you document items,
# never raise it.
#
# Run from anywhere: `./scripts/check-doc-coverage.sh`.
set -euo pipefail

# The current number of `missing_docs` warnings. Lower this (never raise it) whenever you
# document public items; keep it exactly in step with the real count so the ratchet stays
# tight.
CEILING=985

cd "$(dirname "$0")/.."

echo "Compiling the library with -W missing_docs to count documentation gaps…"
# `--features wasm` matches the widest public surface (the wasm bindings add public items),
# so the ratchet covers every item any binding exposes.
#
# NO PIPE INTO grep. This used to be `cargo rustc ... | grep -c ... || true`, which reports
# the exit status of grep, not of cargo. A failed compile emits no `missing documentation
# for` lines at all, so grep matched nothing, returned 1, `|| true` swallowed it, the count
# became 0, and 0 is not greater than the ceiling — the step exited 0 and printed "Coverage
# improved (0 < 985)" on a build that never compiled. That is the same shape scripts/gate.sh
# warns about in its own header. Capture the output to a file, read cargo's own status, and
# only then count.
log="$(mktemp)"
trap 'rm -f "$log"' EXIT
set +e
cargo rustc --lib --features wasm -- -W missing_docs > "$log" 2>&1
rc=$?
set -e
if [ "$rc" -ne 0 ]; then
  echo "FAIL: the library did not compile under -W missing_docs (cargo exited ${rc})." >&2
  echo "The documentation count below would have been 0 for the wrong reason, so this is a" >&2
  echo "build failure, not a coverage pass. Last 40 lines:" >&2
  tail -40 "$log" >&2
  exit 1
fi

warnings="$(grep -c 'missing documentation for' "$log" || true)"

# A zero count while the ceiling is still high is far more likely to be a broken lint or a
# changed rustc message than a completed documentation sweep, and it is the one reading
# that always passes the ratchet. Refuse it and name both remedies rather than guess.
if [ "${warnings}" -eq 0 ] && [ "${CEILING}" -ne 0 ]; then
  echo "FAIL: counted 0 missing_docs warnings while CEILING is ${CEILING}." >&2
  echo "Either the sweep is real — in which case set CEILING=0 in this script — or the lint" >&2
  echo "did not run and the count is meaningless. Do not let this read as a pass." >&2
  exit 1
fi

echo "missing_docs warnings: ${warnings} (ceiling: ${CEILING})"

if [ "${warnings}" -gt "${CEILING}" ]; then
  echo "FAIL: documentation coverage regressed — ${warnings} undocumented public items, ceiling is ${CEILING}." >&2
  echo "Document the new public item(s), or list them with:" >&2
  echo "  cargo rustc --lib --features wasm -- -W missing_docs 2>&1 | grep -A1 'missing documentation for'" >&2
  exit 1
fi

if [ "${warnings}" -lt "${CEILING}" ]; then
  echo "Coverage improved (${warnings} < ${CEILING}). Lower CEILING in this script to ${warnings} to lock the gain in."
fi

echo "OK: documentation coverage did not regress."
