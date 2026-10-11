#!/usr/bin/env python3
# SPDX-License-Identifier: AGPL-3.0-only
"""Smoke-run a kshana-mcp binary over stdio: initialize, then list the tools.

    scripts/smoke_mcp.py <path/to/kshana-mcp[.exe]> [--min-tools N]

Sends the MCP handshake (initialize, initialized, tools/list), closes stdin, and checks that the
server answers with its name and at least N tools. Used by release.yml on every built binary, again on
the binaries downloaded from the published release, and by the npm and PyPI launchers' tests.
Portable (macOS, Linux, Windows): no `timeout` command is needed.
"""
from __future__ import annotations

import json
import subprocess
import sys

REQUESTS = [
    {"jsonrpc": "2.0", "id": 1, "method": "initialize",
     "params": {"protocolVersion": "2025-03-26", "capabilities": {},
                "clientInfo": {"name": "kshana-smoke", "version": "0"}}},
    {"jsonrpc": "2.0", "method": "notifications/initialized"},
    {"jsonrpc": "2.0", "id": 2, "method": "tools/list"},
]


def main(argv: list[str]) -> int:
    if len(argv) < 2:
        print(__doc__, file=sys.stderr)
        return 2
    binary = argv[1]
    min_tools = int(argv[argv.index("--min-tools") + 1]) if "--min-tools" in argv else 5
    payload = "".join(json.dumps(r) + "\n" for r in REQUESTS)
    try:
        run = subprocess.run([binary], input=payload, capture_output=True, text=True, timeout=60)
    except (OSError, subprocess.TimeoutExpired) as e:
        print(f"FAIL: {binary} did not run to completion: {e}", file=sys.stderr)
        return 1
    replies = {}
    for line in run.stdout.splitlines():
        line = line.strip()
        if line.startswith("{"):
            try:
                msg = json.loads(line)
            except ValueError:
                continue
            if "id" in msg:
                replies[msg["id"]] = msg
    init = replies.get(1, {}).get("result")
    if not init or "serverInfo" not in init:
        print(f"FAIL: no initialize result from {binary}\nstdout: {run.stdout[:400]}\nstderr: {run.stderr[:400]}",
              file=sys.stderr)
        return 1
    tools = replies.get(2, {}).get("result", {}).get("tools", [])
    if len(tools) < min_tools:
        print(f"FAIL: tools/list gave {len(tools)} tools, expected at least {min_tools}", file=sys.stderr)
        return 1
    print(f"OK: {binary} is '{init['serverInfo'].get('name')}' {init['serverInfo'].get('version')}, "
          f"protocol {init.get('protocolVersion')}, {len(tools)} tools")
    return 0


if __name__ == "__main__":
    sys.exit(main(sys.argv))
