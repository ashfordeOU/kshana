# SPDX-License-Identifier: AGPL-3.0-only
import hashlib
import http.server
import os
import platform
import subprocess
import sys
import tempfile
import threading
import unittest
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent.parent / "src"))
from kshana_mcp import launcher as L  # noqa: E402


def serve(files):
    class H(http.server.BaseHTTPRequestHandler):
        def do_GET(self):
            name = self.path.rsplit("/", 1)[-1]
            if name not in files:
                self.send_response(404); self.end_headers(); return
            self.send_response(200); self.end_headers(); self.wfile.write(files[name])

        def log_message(self, *a):
            pass

    srv = http.server.HTTPServer(("127.0.0.1", 0), H)
    threading.Thread(target=srv.serve_forever, daemon=True).start()
    return srv


class Launcher(unittest.TestCase):
    def test_asset_for(self):
        self.assertEqual(L.asset_for("Linux", "x86_64"), "kshana-mcp")
        self.assertEqual(L.asset_for("Linux", "aarch64"), "kshana-mcp-aarch64-unknown-linux-gnu")
        self.assertEqual(L.asset_for("Darwin", "arm64"), "kshana-mcp-aarch64-apple-darwin")
        self.assertEqual(L.asset_for("Darwin", "x86_64"), "kshana-mcp-x86_64-apple-darwin")
        self.assertEqual(L.asset_for("Windows", "AMD64"), "kshana-mcp-x86_64-pc-windows-msvc.exe")
        self.assertIsNone(L.asset_for("FreeBSD", "x86_64"))

    def test_verify(self):
        data = b"hello"
        sums = L.parse_sums(f"{hashlib.sha256(data).hexdigest()}  kshana-mcp\n{'0' * 64} *other\nnot a line\n")
        L.verify(data, "kshana-mcp", sums)
        with self.assertRaisesRegex(RuntimeError, "does not match"):
            L.verify(b"tampered", "kshana-mcp", sums)
        with self.assertRaisesRegex(RuntimeError, "does not list"):
            L.verify(data, "missing", sums)

    def test_ensure_binary_downloads_verifies_caches_and_refuses_a_swapped_file(self):
        name = L.asset_for(platform.system(), platform.machine())
        if not name:
            self.skipTest("unsupported test host")
        script = b"@echo off\r\necho ran %*\r\n" if os.name == "nt" else b"#!/bin/sh\necho ran \"$@\"\n"
        sums = f"{hashlib.sha256(script).hexdigest()}  {name}\n".encode()
        with tempfile.TemporaryDirectory() as cache:
            srv = serve({name: script, "SHA256SUMS": sums})
            env = {"KSHANA_MCP_CACHE_DIR": cache, "KSHANA_MCP_RELEASE_BASE": f"http://127.0.0.1:{srv.server_port}"}
            path = L.ensure_binary("0.0.0", env)
            self.assertEqual(path.read_bytes(), script)
            self.assertEqual(L.ensure_binary("0.0.0", env), path)   # from the cache, re-verified
            if os.name != "nt":
                out = subprocess.run([str(path), "a", "b"], capture_output=True, text=True).stdout.strip()
                self.assertEqual(out, "ran a b")
            srv.shutdown()
        with tempfile.TemporaryDirectory() as cache:
            srv = serve({name: b"evil", "SHA256SUMS": sums})
            env = {"KSHANA_MCP_CACHE_DIR": cache, "KSHANA_MCP_RELEASE_BASE": f"http://127.0.0.1:{srv.server_port}"}
            with self.assertRaisesRegex(RuntimeError, "does not match SHA256SUMS"):
                L.ensure_binary("0.0.0", env)
            self.assertFalse((Path(cache) / "0.0.0" / name).exists(), "a refused file is never written")
            srv.shutdown()

    def test_version_matches_pyproject(self):
        text = (Path(__file__).resolve().parent.parent / "pyproject.toml").read_text()
        self.assertIn(f'version = "{L.__version__}"', text)


if __name__ == "__main__":
    unittest.main()
