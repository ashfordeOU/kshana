#!/usr/bin/env bash
# Wire the full-gate receipt check into this machine's pre-push hook. Idempotent, and
# append-only: it never rewrites or removes a line that is already there.
#
# WHICH FILE, AND WHY NOT THE HOOK ITSELF
#   `.git/hooks/pre-push` in this repository is installed and OVERWRITTEN by the machine's
#   `ci-install-hooks` (its own first line says "edit the template, not the copy"). It is
#   also shared by every worktree, and it is not tracked by git, so an edit to it would be
#   invisible to review and would vanish on the next hook install. There is no tracked hook
#   source in this repository.
#
#   What that hook actually runs for this repo is `.ci-native`: one shell command per line,
#   each eval'd from the repo root, any non-zero exit blocking the push. That is the
#   repository's own pre-push contract and the correct extension point. The reproduction
#   gate already in it (`ci-local-audit`, `cargo fmt --all -- --check`, and the
#   PNT_Research `repro/ci-gate.sh`) is left EXACTLY as it is; this only appends one line.
#
# USAGE
#   scripts/install-gate-hook.sh              # install into <repo>/.ci-native
#   CI_NATIVE=/path/to/.ci-native scripts/install-gate-hook.sh
#   scripts/install-gate-hook.sh --check      # report whether it is installed; install nothing
#
# Exit 0 when the check is present (or was just added); 1 on error, or under --check when
# it is absent.

set -uo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
TARGET="${CI_NATIVE:-$ROOT/.ci-native}"
MARKER='scripts/check-gate-receipt.sh'
CHECK_ONLY=0
[ "${1:-}" = "--check" ] && CHECK_ONLY=1

if [ -f "$TARGET" ] && grep -qF "$MARKER" "$TARGET"; then
  echo "gate hook: already installed in $TARGET"
  exit 0
fi

if [ "$CHECK_ONLY" -eq 1 ]; then
  echo "gate hook: NOT installed in $TARGET — run scripts/install-gate-hook.sh" >&2
  exit 1
fi

if [ ! -f "$TARGET" ]; then
  echo "gate hook: $TARGET does not exist; creating it" >&2
  printf '# Kshana local pre-push gate. Each line is eval'"'"'d from the repo root; any\n# non-zero exit BLOCKS the push. Emergency bypass: git push --no-verify\n' > "$TARGET"
fi

# Append only. Everything already in the file keeps running, in the order it is written.
cat >> "$TARGET" <<'EOT'

# A green is claimable only from the FULL gate. scripts/gate.sh runs `cargo test --all`,
# captures the true exit code, and writes .gate-receipt.json naming the commit it ran on.
# This refuses the push unless that receipt names the commit being pushed, on a clean tree.
# Bypass out loud with KSHANA_SKIP_RECEIPT=1.
scripts/check-gate-receipt.sh
EOT

echo "gate hook: appended the receipt check to $TARGET"
echo "gate hook: the existing contract in that file is untouched — verify with: cat $TARGET"
exit 0
