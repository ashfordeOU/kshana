#!/usr/bin/env bash
# Refuse a push that is not backed by a full-gate receipt for EXACTLY this commit.
#
# WHY
#   A green from a subset of the suite is not a green. Both defects that reached the
#   canonical gate this campaign would have reached main under a partial gate. This check
#   makes the claim "the gate passed" checkable rather than remembered: `scripts/gate.sh`
#   runs `cargo test --all` and writes .gate-receipt.json naming the commit it ran on; this
#   refuses the push unless that receipt names the commit now at HEAD, on a clean tree.
#
# WHAT IT CHECKS
#   * a receipt exists and parses;
#   * its `commit` equals HEAD exactly — not an ancestor, not "close enough";
#   * its `exit_code` is 0 and its `command` is the canonical `cargo test --all`;
#   * it was taken on a clean tree, and the tree is still clean now (so the bytes being
#     pushed are the bytes that were tested);
#   * it names a plausible number of integration binaries, so a receipt from a stubbed or
#     short-circuited run cannot pass for a real one.
#
# WHAT IT DOES NOT CHECK
#   The receipt is a local claim, not a proof. Anyone who can write the file can forge it;
#   it is a guard against forgetting, not against lying. Only remote CI can be authoritative
#   about a run nobody on this machine can edit.
#
# USAGE
#   scripts/check-gate-receipt.sh          # run from anywhere in the repo
#   KSHANA_SKIP_RECEIPT=1 git push         # documented, loud bypass
#
# Exit 0 when a valid receipt backs HEAD; 1 otherwise.

set -uo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
RECEIPT="$ROOT/.gate-receipt.json"

# The smallest number of integration test binaries a real `cargo test --all` runs here. A
# receipt claiming fewer came from something that was not the whole suite.
MIN_INTEGRATION_BINARIES="${KSHANA_MIN_INTEGRATION_BINARIES:-100}"

if [ "${KSHANA_SKIP_RECEIPT:-0}" = "1" ]; then
  echo "gate receipt: SKIPPED by KSHANA_SKIP_RECEIPT=1 — this push is not gate-backed" >&2
  exit 0
fi

fail() {
  echo "gate receipt: REFUSING THE PUSH — $1" >&2
  echo "  run the full gate first:  scripts/gate.sh" >&2
  echo "  (expect 62-79 min; it writes .gate-receipt.json on success)" >&2
  echo "  deliberate bypass:        KSHANA_SKIP_RECEIPT=1 git push" >&2
  exit 1
}

# One field out of the flat receipt JSON, without a JSON dependency.
field() {
  sed -n "s/.*\"$1\"[[:space:]]*:[[:space:]]*\"\{0,1\}\([^\",}]*\)\"\{0,1\}.*/\1/p" "$RECEIPT" \
    | head -1
}

[ -f "$RECEIPT" ] || fail "no receipt at .gate-receipt.json"

HEAD_SHA="$(git -C "$ROOT" rev-parse HEAD)"
R_COMMIT="$(field commit)"
R_EXIT="$(field exit_code)"
R_TREE="$(field tree)"
R_CMD="$(field command)"
R_BINS="$(field integration_binaries)"
R_WHEN="$(field finished_utc)"

[ -n "$R_COMMIT" ] || fail "the receipt names no commit"
[ "$R_COMMIT" = "$HEAD_SHA" ] || fail "the receipt is for $R_COMMIT, HEAD is $HEAD_SHA"
[ "$R_EXIT" = "0" ] || fail "the receipt records exit code $R_EXIT, not 0"
[ "$R_CMD" = "cargo test --all" ] || fail "the receipt records '$R_CMD', not 'cargo test --all'"
[ "$R_TREE" = "clean" ] || fail "the receipt was taken on a $R_TREE tree"

case "$R_BINS" in
  ''|*[!0-9]*) fail "the receipt's integration_binaries field is not a number" ;;
esac
[ "$R_BINS" -ge "$MIN_INTEGRATION_BINARIES" ] \
  || fail "the receipt ran only $R_BINS integration binaries (expected >= $MIN_INTEGRATION_BINARIES) — that was not the whole suite"

if [ -n "$(git -C "$ROOT" status --porcelain)" ]; then
  fail "the working tree is dirty — what would be pushed is not what was tested"
fi

echo "gate receipt: OK — $R_COMMIT, $R_BINS integration binaries, $(field tests_passed) tests passed, $(field repeat_runs) repeat run(s), taken $R_WHEN"
exit 0
