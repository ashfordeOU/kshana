#!/usr/bin/env bash
# Fails if AI-assistant attribution markers appear in tracked content or commit messages.
# Search terms are built from fragments so this guard file itself stays token-clean.
set -euo pipefail
t1='cla''ude'
t2='anthro''pic'
t3='co-auth''ored-by'
# Word-boundary anchored so the AI-footer phrase "Generated with <tool>" is caught
# but the ordinary English word "regenerated with" / "auto-generated with" is not.
t4='\bgenera''ted with'
pattern="${t1}|${t2}|${t3}|${t4}"
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
