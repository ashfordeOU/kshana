#!/usr/bin/env bash
# SPDX-License-Identifier: AGPL-3.0-only
# Fail if the active rustc version does not match the pinned channel in
# rust-toolchain.toml, so the build toolchain is reproducible (not a floating
# "stable" that drifts between machines and CI runs).
set -euo pipefail

pinned="$(grep -E '^channel\s*=' rust-toolchain.toml | sed -E 's/.*"([^"]+)".*/\1/')"
if [ -z "$pinned" ]; then
  echo "FAIL: could not read [toolchain] channel from rust-toolchain.toml" >&2
  exit 1
fi

active="$(rustc --version | awk '{print $2}')"
if [ "$active" != "$pinned" ]; then
  echo "FAIL: active rustc $active does not match pinned channel $pinned" >&2
  exit 1
fi
echo "OK: rustc $active matches the pinned toolchain"
