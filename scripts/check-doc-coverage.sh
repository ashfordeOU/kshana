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
CEILING=986

cd "$(dirname "$0")/.."

echo "Compiling the library with -W missing_docs to count documentation gaps…"
# `--features wasm` matches the widest public surface (the wasm bindings add public items),
# so the ratchet covers every item any binding exposes.
warnings="$(cargo rustc --lib --features wasm -- -W missing_docs 2>&1 \
  | grep -c 'missing documentation for' || true)"

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
