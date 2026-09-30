#!/usr/bin/env bash
# Fails if AI-assistant AUTHORSHIP ATTRIBUTION appears in tracked content or commit
# messages.
#
# Naming an assistant as an integration TARGET is allowed and intentional: "Claude Code"
# / "Claude Desktop" as an MCP host, or the "claude mcp add" command in docs/integrations.md,
# are product documentation — exactly like naming Cursor, VS Code or JetBrains — not a claim
# that an assistant authored this work. This guard blocks only the authorship markers:
#   * the vendor name (anthro..pic),
#   * the co-author trailer (co-auth..ored-by), which names the assistant as an author,
#   * the "Generated with/by <assistant>" footer emitted by such tools (optionally
#     bracketed, e.g. "Generated with [Claude Code]"), and
#   * the robot emoji that leads that footer.
# Bare product mentions of the assistant are deliberately NOT matched.
#
# Search terms are built from fragments so this guard file stays token-clean, and the file
# excludes itself from the content scan.
set -euo pipefail
t_anth='anthro''pic'
t_coauth='co-auth''ored-by'
t_cla='cla''ude'
# Authorship markers only. The "Generated with/by" clause is anchored to the assistant name
# (optionally preceded by "[") so it cannot match ordinary prose, and the leading footer
# emoji is caught directly.
pattern="${t_coauth}|${t_anth}|generated (with|by) \[?${t_cla}|🤖"
self='scripts/check-no-attribution.sh'
# Refuse to grade what cannot be read. Both scans below end in `|| true` (a clean tree is
# "no match"), which used to swallow git's own failure as well: outside a readable
# repository (a copied tree, a worktree whose .git pointer names a path that does not
# exist inside a container) both `git grep` and `git log` print "not a git repository",
# produce no output, and the guard reported "OK: clean" without scanning one byte. A
# shallow clone is refused for the same reason: `git log` then sees only the tip, which
# is the blindness every caller's `fetch-depth: 0` exists to prevent.
if ! git rev-parse --git-dir >/dev/null 2>&1; then
  echo "FAIL: not inside a readable git repository; cannot scan content or history" >&2
  exit 1
fi
if [ "$(git rev-parse --is-shallow-repository)" = "true" ]; then
  echo "FAIL: shallow clone; the history scan would see only the fetched commits (use full history)" >&2
  exit 1
fi
# git grep exits 0 on a match, 1 on none, and >1 on an error: only the error is fatal here.
set +e
hits=$(git grep -i -n -E "$pattern" -- . ":!${self}")
rc=$?
set -e
if [ "$rc" -gt 1 ]; then
  echo "FAIL: git grep exited $rc; the content scan did not run" >&2
  exit 1
fi
log=$(git log --format='%H %an <%ae>%n%B')
msgs=$(printf '%s\n' "$log" | grep -i -E "$pattern" || true)
if [ -n "$hits" ] || [ -n "$msgs" ]; then
  echo "FAIL: AI-authorship-attribution markers found:"
  [ -n "$hits" ] && echo "$hits"
  [ -n "$msgs" ] && echo "(in history) $msgs"
  exit 1
fi
echo "OK: clean - no AI-authorship-attribution markers in content or history"
