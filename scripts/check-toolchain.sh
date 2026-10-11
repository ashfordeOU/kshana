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
# So: every dtolnay/rust-toolchain use is pinned by commit SHA and its `toolchain:` input must be the
# pinned channel (or, for the msrv job only, the rust-version Cargo.toml declares), and no workflow
# may pipe an installer script into a shell. Skipped where there are no workflows to read (a packaged crate).
if [ -d .github/workflows ]; then
  msrv="$(grep -m1 '^rust-version' Cargo.toml | sed -E 's/.*"([^"]+)".*/\1/')"
  # Every `dtolnay/rust-toolchain` use is pinned by commit SHA (a branch such as `@1.93.0` moves), and
  # the compiler it installs is its `toolchain:` input, which must be the pinned channel (or the MSRV).
  bad="$(python3 - "$pinned" "$msrv" <<'PY'
import glob, re, sys
pinned, msrv = sys.argv[1], sys.argv[2]
for f in sorted(glob.glob(".github/workflows/*.yml")):
    lines = open(f, encoding="utf-8").read().split("\n")
    for i, line in enumerate(lines):
        m = re.search(r"uses:\s*dtolnay/rust-toolchain@([^\s#]+)", line)
        if not m:
            continue
        where = f"{f}:{i + 1}"
        if not re.fullmatch(r"[0-9a-f]{40}", m.group(1)):
            print(f"  {where}: not pinned by commit SHA ({m.group(1)})")
            continue
        indent = len(line) - len(line.lstrip()) + (2 if line.lstrip().startswith("- ") else 0)
        tool = None
        for nxt in lines[i + 1:]:
            if nxt.strip() and len(nxt) - len(nxt.lstrip()) < indent:
                break
            if re.match(r"\s*- ", nxt) and len(nxt) - len(nxt.lstrip()) <= indent - 2:
                break
            t = re.match(r"\s*toolchain:\s*([^\s#]+)", nxt)
            if t:
                tool = t.group(1)
                break
        if tool is None or not (tool == pinned or tool == msrv or tool.startswith(msrv + ".")):
            print(f"  {where}: toolchain input is {tool!r}, not {pinned} (or the MSRV {msrv})")
PY
)"
  if [ -n "$bad" ]; then
    printf 'FAIL: a workflow does not pin dtolnay/rust-toolchain by SHA with the toolchain %s (or the MSRV %s):\n%s\n' \
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
