#!/usr/bin/env bash
# SPDX-License-Identifier: Apache-2.0
# Fail if the README status badge does not match the Cargo.toml package version,
# so the documented version can never silently drift from the released one.
set -euo pipefail

ver="$(grep -m1 '^version' Cargo.toml | sed -E 's/.*"([^"]+)".*/\1/')"
if [ -z "$ver" ]; then
  echo "FAIL: could not read [package] version from Cargo.toml" >&2
  exit 1
fi

if ! grep -q "Status: v${ver}" README.md; then
  echo "FAIL: README status badge does not match Cargo.toml version v${ver}." >&2
  echo "Found instead:" >&2
  grep -n "\*\*Status:" README.md >&2 || echo "  (no status badge found)" >&2
  exit 1
fi

echo "OK: README status badge matches Cargo.toml v${ver}"
