#!/usr/bin/env bash
# SPDX-License-Identifier: AGPL-3.0-only
# Refuse to publish a commit that the release verification has not passed.
#
#   scripts/check-release-verdict.sh <commit-sha>
#
# Needs GH_TOKEN (read access to Actions) and GITHUB_REPOSITORY (owner/name), both of
# which every GitHub Actions job has. By hand: GH_TOKEN="$(gh auth token)"
# GITHUB_REPOSITORY=ashfordeOU/kshana scripts/check-release-verdict.sh <sha>
#
# WHAT COUNTS AS A VERDICT
#   The `verify` job of the Release workflow (.github/workflows/release.yml), run on a
#   TAG PUSH whose commit is exactly <commit-sha>. That job is the one authoritative
#   verdict on a tagged commit: fmt, clippy, the full `cargo test --all` suite (golden
#   pins and verification-matrix guards included), the reproducibility guard and the
#   script guards. ci.yml does not run on tags, so it cannot give that verdict.
#
#   A Release run started by hand (workflow_dispatch) does not count: its head commit is
#   the branch it was started from, not the tag it rebuilds. When a run has several
#   attempts ("re-run jobs"), only the most recent attempt of `verify` is read, so a
#   later red attempt is not outvoted by an earlier green one.
#
# WHY IT FAILS CLOSED
#   Every publish downstream of this is irreversible: crates.io yanks rather than deletes
#   and PyPI refuses a second upload of a filename. So anything short of a positive
#   "success" — no run, a run still in progress, a red or cancelled run, an API error —
#   stops the publish. An unreachable API is a reason to re-run, not to ship.
#
# WHERE IT RUNS
#   First step of every job that holds a registry credential or pushes an image: the
#   `gates` job of publish.yml, the `image` job of mcp-publish.yml and the `publish` job
#   of jetbrains-plugin.yml. On the normal path those workflows are called by release.yml
#   AFTER its `verify` job, so this check restates a guarantee the `needs:` edge already
#   gives. It is what holds the manual-retry path (workflow_dispatch on a tag), where no
#   `needs:` edge exists.
set -euo pipefail

sha="${1:-}"
repo="${GITHUB_REPOSITORY:-}"
workflow="release.yml"
job="verify"

if ! printf '%s' "$sha" | grep -qE '^[0-9a-f]{40}$'; then
  echo "FAIL: expected a full 40-character commit SHA, got '${sha}'" >&2
  exit 1
fi
if [ -z "$repo" ]; then
  echo "FAIL: GITHUB_REPOSITORY is not set (owner/name)" >&2
  exit 1
fi

# `gh api` exits non-zero on any HTTP or network error, and `set -e` turns that into a
# failure here: an API we cannot read is not a green verdict.
runs="$(gh api --paginate \
  "repos/${repo}/actions/workflows/${workflow}/runs?head_sha=${sha}&event=push&per_page=100" \
  --jq '.workflow_runs[] | "\(.id) \(.head_branch)"')"

if [ -z "$runs" ]; then
  echo "FAIL: no ${workflow} run was started by a tag push of ${sha}." >&2
  echo "  Push the release tag and let ${workflow} run; publishing waits for its '${job}' job." >&2
  exit 1
fi

green=""
while read -r id ref; do
  [ -n "$id" ] || continue
  # Latest attempt of the `verify` job in this run: "<attempt> <conclusion>".
  latest="$(gh api --paginate \
    "repos/${repo}/actions/runs/${id}/jobs?filter=all&per_page=100" \
    --jq ".jobs[] | select(.name == \"${job}\") | \"\(.run_attempt) \(.conclusion // \"pending\")\"" \
    | sort -n | tail -n 1)"
  conclusion="${latest#* }"
  [ -n "$latest" ] || conclusion="absent"
  echo "  run ${id} (${ref}): ${job} = ${conclusion}"
  if [ "$conclusion" = "success" ]; then
    green="${id}"
  fi
done <<EOF
${runs}
EOF

if [ -z "$green" ]; then
  echo "FAIL: no green '${job}' verdict from ${workflow} for ${sha}; refusing to publish." >&2
  exit 1
fi
echo "OK: ${workflow} '${job}' passed for ${sha} (run ${green}); publishing may proceed."
