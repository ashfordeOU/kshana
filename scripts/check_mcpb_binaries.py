#!/usr/bin/env python3
# SPDX-License-Identifier: AGPL-3.0-only
"""Check that the server binary inside each .mcpb is byte-identical to the standalone asset of the same target.

    scripts/check_mcpb_binaries.py <assets-dir>

The release attests and checksums both; this makes sure they are the same build, so a user who verifies the
standalone binary has verified the one inside the Claude Desktop extension too. Linux x86-64 keeps its
historical bare asset name (`kshana-mcp`); the other targets are `kshana-mcp-<target>[.exe]`.
"""
from __future__ import annotations

import hashlib
import sys
import zipfile
from pathlib import Path

TARGETS = {
    "x86_64-unknown-linux-gnu": ("kshana-mcp", "server/kshana-mcp"),
    "aarch64-unknown-linux-gnu": ("kshana-mcp-aarch64-unknown-linux-gnu", "server/kshana-mcp"),
    "aarch64-apple-darwin": ("kshana-mcp-aarch64-apple-darwin", "server/kshana-mcp"),
    "x86_64-apple-darwin": ("kshana-mcp-x86_64-apple-darwin", "server/kshana-mcp"),
    "x86_64-pc-windows-msvc": ("kshana-mcp-x86_64-pc-windows-msvc.exe", "server/kshana-mcp.exe"),
}


def check(assets: Path) -> list[str]:
    problems = []
    for target, (asset, member) in TARGETS.items():
        bundle = assets / f"kshana-mcp-{target}.mcpb"
        standalone = assets / asset
        if not bundle.is_file() or not standalone.is_file():
            problems.append(f"{target}: missing {bundle.name if not bundle.is_file() else asset}")
            continue
        with zipfile.ZipFile(bundle) as z:
            inner = hashlib.sha256(z.read(member)).hexdigest()
        outer = hashlib.sha256(standalone.read_bytes()).hexdigest()
        if inner != outer:
            problems.append(f"{target}: {member} in {bundle.name} ({inner}) is not {asset} ({outer})")
        else:
            print(f"OK: {target}: {member} == {asset} ({outer})")
    return problems


def main(argv: list[str]) -> int:
    if len(argv) != 2:
        print(__doc__, file=sys.stderr)
        return 2
    problems = check(Path(argv[1]))
    for p in problems:
        print(f"FAIL: {p}", file=sys.stderr)
    return 1 if problems else 0


if __name__ == "__main__":
    sys.exit(main(sys.argv))
