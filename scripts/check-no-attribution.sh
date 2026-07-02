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
hits=$(git grep -i -n -E "$pattern" -- . ":!${self}" || true)
msgs=$(git log --format='%H %an <%ae>%n%B' | grep -i -E "$pattern" || true)
if [ -n "$hits" ] || [ -n "$msgs" ]; then
  echo "FAIL: AI-authorship-attribution markers found:"
  [ -n "$hits" ] && echo "$hits"
  [ -n "$msgs" ] && echo "(in history) $msgs"
  exit 1
fi
echo "OK: clean - no AI-authorship-attribution markers in content or history"
