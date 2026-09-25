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

# The workflows that build shipped bytes must ask for the same compiler, and must not
# fetch build tools from a moving "latest".
#
# Through v0.27.2 publish.yml and pages.yml requested `dtolnay/rust-toolchain@stable`. The
# v0.27.2 publish log shows why that went unnoticed: rustup installed stable (1.98.1) and
# then compiled with 1.93.0 anyway, because rust-toolchain.toml outranks the default
# toolchain the action sets. So the shipped bytes were right, but only by precedence
# accident, and the wasm32 target the npm job asked for landed on the unused toolchain.
# The same log shows the unpinned `curl ... wasm-pack/installer/init.sh | sh` installing
# wasm-pack 0.13.1 while 0.15.0 was current: that installer is frozen, not "latest", and
# nothing recorded which version built the package.
#
# So: every dtolnay/rust-toolchain ref must be the pinned channel (or, for the msrv job
# only, the rust-version Cargo.toml declares), and no workflow may pipe an installer
# script into a shell. Skipped where there are no workflows to read (a packaged crate).
if [ -d .github/workflows ]; then
  msrv="$(grep -m1 '^rust-version' Cargo.toml | sed -E 's/.*"([^"]+)".*/\1/')"
  bad=""
  while IFS= read -r hit; do
    [ -n "$hit" ] || continue
    ref="$(printf '%s' "$hit" | sed -E 's/.*dtolnay\/rust-toolchain@([^[:space:]#]+).*/\1/')"
    case "$ref" in
      "$pinned"|"$msrv"|"$msrv".*) ;;
      *) bad="${bad}  ${hit}\n" ;;
    esac
  done <<EOF
$(grep -n 'dtolnay/rust-toolchain@' .github/workflows/*.yml || true)
EOF
  if [ -n "$bad" ]; then
    printf 'FAIL: a workflow requests a toolchain other than %s (or the MSRV %s):\n%b' \
      "$pinned" "$msrv" "$bad" >&2
    exit 1
  fi
  pipes="$(grep -nE 'curl[^|]*\|[[:space:]]*(ba)?sh' .github/workflows/*.yml || true)"
  if [ -n "$pipes" ]; then
    echo "FAIL: a workflow pipes a downloaded script into a shell; pin the tool instead:" >&2
    printf '%s\n' "$pipes" >&2
    exit 1
  fi
  echo "OK: every workflow toolchain request is ${pinned} (or the MSRV ${msrv}); no curl-pipe installers"
fi
