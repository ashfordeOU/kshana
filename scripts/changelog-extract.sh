#!/usr/bin/env bash
# SPDX-License-Identifier: Apache-2.0
# Print the release-notes body for a version: the curated CHANGELOG.md section
# for that version (its `### Added` / `### Changed` / ... blocks), followed by a
# link to the full changelog. Used to populate GitHub release notes so a release
# highlights what changed rather than dumping a raw commit list.
#
#   scripts/changelog-extract.sh 0.3.0 > RELEASE_NOTES.md
set -euo pipefail

version="${1:?usage: changelog-extract.sh <version>   (e.g. 0.3.0)}"
root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
changelog="$root/CHANGELOG.md"
repo_url="https://github.com/AshfordeOU/kshana"

# The section between this version's `## [x.y.z]` heading and the next `## [`.
section="$(awk -v ver="$version" '
  $0 ~ ("^## \\[" ver "\\]") { grab = 1; next }
  grab && /^## \[/           { exit }
  grab                       { print }
' "$changelog")"

# Trim leading and trailing blank lines (portable: GNU and BSD awk).
section="$(printf '%s\n' "$section" | awk '
  { line[NR] = $0 }
  END {
    start = 1; while (start <= NR && line[start] ~ /^[ \t]*$/) start++
    end = NR;  while (end >= start && line[end] ~ /^[ \t]*$/) end--
    for (i = start; i <= end; i++) print line[i]
  }')"

if [ -z "$section" ]; then
  echo "No CHANGELOG entry found for version $version" >&2
  exit 1
fi

printf '%s\n\n' "$section"
printf -- '---\n\n'
printf '**Full changelog:** [`CHANGELOG.md`](%s/blob/v%s/CHANGELOG.md) · ' "$repo_url" "$version"
printf '**Docs:** [`README`](%s/blob/v%s/README.md)\n' "$repo_url" "$version"
