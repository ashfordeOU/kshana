#!/usr/bin/env bash
# SPDX-License-Identifier: Apache-2.0
# Lints the JOSS paper without a full Whedon/openjournals compile:
#   1. paper/paper.md has the JOSS-required YAML frontmatter keys.
#   2. every [@key] / @key citation in the body resolves to a paper/paper.bib entry.
# Oracle for required fields: https://joss.readthedocs.io/en/latest/paper.html
set -euo pipefail
here="$(cd "$(dirname "$0")/.." && pwd)"
paper="$here/paper/paper.md"
bib="$here/paper/paper.bib"
[ -f "$paper" ] || { echo "FAIL: $paper missing"; exit 1; }
[ -f "$bib" ]   || { echo "FAIL: $bib missing"; exit 1; }

# 1. Required frontmatter keys (line-anchored within the leading --- block).
fm="$(awk 'NR==1&&/^---/{f=1;next} /^---/{exit} f' "$paper")"
fail=0
for key in 'title:' 'authors:' 'name:' 'affiliation:' 'affiliations:' 'index:' 'date:' 'bibliography:'; do
  if ! printf '%s\n' "$fm" | grep -q -- "$key"; then
    echo "FAIL: frontmatter missing '$key'"; fail=1
  fi
done

# 2. Citation keys in the body resolve to bib entries.
body="$(awk 'BEGIN{c=0} /^---/{c++; next} c>=2' "$paper")"
keys="$(printf '%s\n' "$body" | grep -oE '@[A-Za-z0-9_:-]+' | sed 's/^@//' | sort -u || true)"
for k in $keys; do
  if ! grep -qE "\{$k," "$bib"; then
    echo "FAIL: citation @$k not found in paper.bib"; fail=1
  fi
done

if [ "$fail" -ne 0 ]; then exit 1; fi
echo "OK: paper.md frontmatter complete and all citations resolve in paper.bib"
