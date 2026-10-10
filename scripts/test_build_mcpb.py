#!/usr/bin/env python3
# SPDX-License-Identifier: AGPL-3.0-only
"""Tests for scripts/build_mcpb.py and scripts/smoke_mcpb.py."""
import hashlib
import json
import os
import stat
import subprocess
import sys
import tempfile
import unittest
import zipfile
from pathlib import Path

HERE = Path(__file__).resolve().parent
sys.path.insert(0, str(HERE))
import build_mcpb as B  # noqa: E402

FAKE = b"#!/bin/sh\necho fake kshana-mcp\n"


def fake_binary(d: Path) -> Path:
    p = d / "kshana-mcp-bin"
    p.write_bytes(FAKE)
    p.chmod(0o755)
    return p


class BuildMcpb(unittest.TestCase):
    def test_two_builds_are_byte_identical_even_when_inputs_change_mtime(self):
        with tempfile.TemporaryDirectory() as d:
            d = Path(d)
            b = fake_binary(d)
            a = B.build("0.35.0", "x86_64-unknown-linux-gnu", b, d / "one")
            os.utime(b, (1, 1))   # a different mtime on the input must not matter
            c = B.build("0.35.0", "x86_64-unknown-linux-gnu", b, d / "two")
            self.assertEqual(hashlib.sha256(a.read_bytes()).hexdigest(), hashlib.sha256(c.read_bytes()).hexdigest())

    def test_entries_are_sorted_with_fixed_times_and_modes(self):
        with tempfile.TemporaryDirectory() as d:
            d = Path(d)
            out = B.build("0.35.0", "x86_64-pc-windows-msvc", fake_binary(d), d / "o")
            with zipfile.ZipFile(out) as z:
                names = z.namelist()
                self.assertEqual(names, sorted(names))
                self.assertEqual(names, ["LICENSE", "icon.png", "manifest.json", "server/kshana-mcp.exe"])
                for i in z.infolist():
                    self.assertEqual(i.date_time, (1980, 1, 1, 0, 0, 0))
                    mode = (i.external_attr >> 16) & 0o7777
                    self.assertEqual(mode, 0o755 if i.filename.startswith("server/") else 0o644, i.filename)
                self.assertEqual(z.read("server/kshana-mcp.exe"), FAKE)

    def test_manifest_is_valid_and_consistent_for_every_target(self):
        with tempfile.TemporaryDirectory() as d:
            d = Path(d)
            for target, (platform, name) in B.TARGETS.items():
                out = B.build("0.35.0", target, fake_binary(d), d / "o")
                with zipfile.ZipFile(out) as z:
                    m = json.loads(z.read("manifest.json"))
                self.assertEqual(m["version"], "0.35.0")
                self.assertEqual(m["compatibility"]["platforms"], [platform])
                self.assertEqual(m["server"]["entry_point"], f"server/{name}")
                self.assertEqual(m["server"]["mcp_config"]["command"], f"${{__dirname}}/server/{name}")
                self.assertIn("Advisory, not type-approved navigation equipment", m["description"])

    def test_an_invalid_manifest_is_refused(self):
        m = B.render_manifest("0.35.0", "linux", "kshana-mcp")
        B.validate_manifest(m)
        bad = dict(m)
        bad["manifest_version"] = "9.9"
        with self.assertRaises(SystemExit):
            B.validate_manifest(bad)
        bad = json.loads(json.dumps(m))
        bad["server"]["mcp_config"]["command"] = "/somewhere/else"
        with self.assertRaises(SystemExit):
            B.validate_manifest(bad)

    def test_the_committed_schema_matches_its_recorded_hash(self):
        self.assertEqual(hashlib.sha256(B.SCHEMA.read_bytes()).hexdigest(), B.SCHEMA_SHA256)
        self.assertIn(B.SCHEMA_SHA256, (B.MCPB_DIR / "SCHEMA-SOURCE.md").read_text())

    @unittest.skipIf(os.name == "nt", "shell stand-in for the server binary")
    def test_smoke_unzips_checks_the_entry_point_and_runs_the_binary(self):
        # A stand-in server that speaks just enough MCP for scripts/smoke_mcp.py.
        server = b'''#!/usr/bin/env python3
import json, sys
for line in sys.stdin:
    m = json.loads(line)
    if m.get("method") == "initialize":
        print(json.dumps({"jsonrpc": "2.0", "id": m["id"], "result": {"protocolVersion": "2025-06-18", "capabilities": {"tools": {}}, "serverInfo": {"name": "kshana-mcp", "version": "0.0.0"}}}), flush=True)
    elif m.get("method") == "tools/list":
        print(json.dumps({"jsonrpc": "2.0", "id": m["id"], "result": {"tools": [{"name": "t%d" % i} for i in range(6)]}}), flush=True)
'''
        with tempfile.TemporaryDirectory() as d:
            d = Path(d)
            b = d / "srv"
            b.write_bytes(server)
            b.chmod(0o755)
            out = B.build("0.35.0", "x86_64-unknown-linux-gnu", b, d / "o")
            r = subprocess.run([sys.executable, str(HERE / "smoke_mcpb.py"), str(out), "--run"],
                               capture_output=True, text=True)
            self.assertEqual(r.returncode, 0, r.stdout + r.stderr)
            self.assertIn("entry point server/kshana-mcp", r.stdout)
            # A bundle whose entry point is missing is refused.
            bad = d / "bad.mcpb"
            with zipfile.ZipFile(out) as zin, zipfile.ZipFile(bad, "w") as zout:
                for i in zin.infolist():
                    if not i.filename.startswith("server/"):
                        zout.writestr(i, zin.read(i.filename))
            r = subprocess.run([sys.executable, str(HERE / "smoke_mcpb.py"), str(bad)], capture_output=True, text=True)
            self.assertNotEqual(r.returncode, 0)
            self.assertIn("entry point", r.stderr + r.stdout)


if __name__ == "__main__":
    unittest.main()
