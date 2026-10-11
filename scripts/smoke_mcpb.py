#!/usr/bin/env python3
# SPDX-License-Identifier: AGPL-3.0-only
"""Unzip an .mcpb bundle and check it: the manifest's entry point exists and is executable, the
manifest names the platform the bundle is for, and (with --run) the extracted binary answers an MCP
initialize and tools/list.

    scripts/smoke_mcpb.py <bundle.mcpb> [--run] [--min-tools N]
"""
from __future__ import annotations

import json
import stat
import subprocess
import sys
import tempfile
import zipfile
from pathlib import Path


def check(bundle: Path, run: bool, min_tools: int) -> None:
    with tempfile.TemporaryDirectory(prefix="mcpb-smoke-") as d:
        root = Path(d)
        with zipfile.ZipFile(bundle) as z:
            bad = z.testzip()
            if bad:
                raise SystemExit(f"FAIL: corrupt entry {bad}")
            names = z.namelist()
            if names != sorted(names):
                raise SystemExit("FAIL: bundle entries are not sorted")
            for info in z.infolist():
                n = info.filename
                if n.startswith("/") or ".." in Path(n).parts:
                    raise SystemExit(f"FAIL: unsafe entry name {n}")
            z.extractall(root)
            modes = {i.filename: (i.external_attr >> 16) & 0o777 for i in z.infolist()}
        m = json.loads((root / "manifest.json").read_text(encoding="utf-8"))
        entry = m["server"]["entry_point"]
        binary = root / entry
        if not binary.is_file():
            raise SystemExit(f"FAIL: entry point {entry} is not in the bundle")
        if m["server"]["mcp_config"]["command"] != "${__dirname}/" + entry:
            raise SystemExit("FAIL: mcp_config.command does not match the entry point")
        if not (root / m["icon"]).is_file():
            raise SystemExit(f"FAIL: icon {m['icon']} is not in the bundle")
        if "Advisory, not type-approved navigation equipment" not in m["description"]:
            raise SystemExit("FAIL: the manifest description lacks the advisory statement")
        if modes[entry] & 0o111 == 0:
            raise SystemExit(f"FAIL: {entry} is not executable in the archive")
        print(f"OK: {bundle.name}: entry point {entry}, platforms {m['compatibility']['platforms']}")
        if run:
            binary.chmod(binary.stat().st_mode | stat.S_IXUSR)
            r = subprocess.run([sys.executable, str(Path(__file__).with_name("smoke_mcp.py")), str(binary),
                                "--min-tools", str(min_tools)], capture_output=True, text=True)
            sys.stdout.write(r.stdout)
            sys.stderr.write(r.stderr)
            if r.returncode != 0:
                raise SystemExit(f"FAIL: the extracted binary did not pass the MCP smoke run ({r.returncode})")


def main(argv: list[str]) -> int:
    args = [a for a in argv[1:] if not a.startswith("--")]
    if len(args) < 1:
        print(__doc__, file=sys.stderr)
        return 2
    min_tools = 5
    if "--min-tools" in argv:
        min_tools = int(argv[argv.index("--min-tools") + 1])
        args = [a for a in args if a != str(min_tools)]
    check(Path(args[0]), "--run" in argv, min_tools)
    return 0


if __name__ == "__main__":
    sys.exit(main(sys.argv))
