#!/usr/bin/env bash
# Fails if AI-assistant attribution markers appear in tracked content or commit messages.
# Search terms are built from fragments so this guard file itself stays token-clean.
set -euo pipefail
t1='cla''ude'
t2='anthro''pic'
t3='co-auth''ored-by'
# Match the assistant by name and the co-author trailer. The standard footer and
# trailer both name the assistant, so the name terms catch them. A broad
# phrase-based term was deliberately dropped: it matched ordinary English prose
# and any commit or doc that merely describes this guard, which is not
# attribution to anyone — a false-positive source, not added protection.
pattern="${t1}|${t2}|${t3}"
self='scripts/check-no-attribution.sh'
hits=$(git grep -i -n -E "$pattern" -- . ":!${self}" || true)
msgs=$(git log --format='%H %an <%ae>%n%B' | grep -i -E "$pattern" || true)
if [ -n "$hits" ] || [ -n "$msgs" ]; then
  echo "FAIL: AI-attribution markers found:"
  [ -n "$hits" ] && echo "$hits"
  [ -n "$msgs" ] && echo "(in history) $msgs"
  exit 1
fi
echo "OK: clean - no AI-attribution markers in content or history"
