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


def serve(handler_fn):
    class H(http.server.BaseHTTPRequestHandler):
        def do_GET(self):
            handler_fn(self)

        def log_message(self, *a):
            pass

    srv = http.server.HTTPServer(("127.0.0.1", 0), H)
    threading.Thread(target=srv.serve_forever, daemon=True).start()
    return srv


def release(files) -> str:
    """A local release directory, as a file:// base."""
    d = Path(tempfile.mkdtemp(prefix="kshana-mcp-rel-"))
    for n, b in files.items():
        (d / n).write_bytes(b)
    return d.as_uri()


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
            env = {"KSHANA_MCP_CACHE_DIR": cache, "KSHANA_MCP_RELEASE_BASE": release({name: script, "SHA256SUMS": sums})}
            path = L.ensure_binary("0.0.0", env)
            self.assertEqual(path.read_bytes(), script)
            self.assertEqual(L.ensure_binary("0.0.0", env), path)   # from the cache, re-verified
            if os.name != "nt":
                out = subprocess.run([str(path), "a", "b"], capture_output=True, text=True).stdout.strip()
                self.assertEqual(out, "ran a b")
        with tempfile.TemporaryDirectory() as cache:
            env = {"KSHANA_MCP_CACHE_DIR": cache, "KSHANA_MCP_RELEASE_BASE": release({name: b"evil", "SHA256SUMS": sums})}
            with self.assertRaisesRegex(RuntimeError, "does not match SHA256SUMS"):
                L.ensure_binary("0.0.0", env)
            self.assertFalse((Path(cache) / "0.0.0" / name).exists(), "a refused file is never written")

    def test_release_base_accepts_only_https_or_file_and_announces_the_override(self):
        import contextlib
        import io
        for bad in ("http://127.0.0.1:8000", "ftp://x", "/tmp/rel"):
            with self.assertRaisesRegex(RuntimeError, r"https:// or file://"):
                L.release_base("1.0.0", {"KSHANA_MCP_RELEASE_BASE": bad})
        err = io.StringIO()
        with contextlib.redirect_stderr(err):
            self.assertEqual(L.release_base("1.0.0", {"KSHANA_MCP_RELEASE_BASE": "https://m.example/r/"}), "https://m.example/r")
        self.assertRegex(err.getvalue(), r"NOTICE.*KSHANA_MCP_RELEASE_BASE")
        err = io.StringIO()
        with contextlib.redirect_stderr(err):
            self.assertTrue(L.release_base("1.0.0", {}).startswith("https://github.com/"))
        self.assertEqual(err.getvalue(), "")

    def test_a_redirect_to_a_non_https_address_is_refused(self):
        def h(r):
            r.send_response(302); r.send_header("Location", "http://127.0.0.1:1/x"); r.end_headers()
        srv = serve(h)
        try:
            with self.assertRaisesRegex(Exception, "non-https"):
                L._get(f"http://127.0.0.1:{srv.server_port}/a", 1000, {})
        finally:
            srv.shutdown()

    def test_size_caps(self):
        def h(r):
            r.send_response(200); r.send_header("Content-Length", "5000"); r.end_headers(); r.wfile.write(b"x" * 5000)
        srv = serve(h)
        try:
            with self.assertRaisesRegex(RuntimeError, "over the 1000-byte limit"):
                L._get(f"http://127.0.0.1:{srv.server_port}/a", 1000, {})
            self.assertEqual(len(L._get(f"http://127.0.0.1:{srv.server_port}/a", 5000, {})), 5000)
        finally:
            srv.shutdown()

        def chunked(r):   # no Content-Length: the cap must hold while reading
            r.send_response(200); r.send_header("Connection", "close"); r.end_headers(); r.wfile.write(b"x" * 5000)
        srv = serve(chunked)
        try:
            with self.assertRaisesRegex(RuntimeError, "more than the 1000-byte limit"):
                L._get(f"http://127.0.0.1:{srv.server_port}/a", 1000, {})
        finally:
            srv.shutdown()
        self.assertEqual(L.MAX_BINARY_BYTES, 100 * 1024 * 1024)
        self.assertEqual(L.MAX_SUMS_BYTES, 64 * 1024)

    def test_a_fetch_that_never_answers_times_out(self):
        import time

        def h(r):
            time.sleep(2)
        srv = serve(h)
        try:
            t = time.monotonic()
            with self.assertRaises(Exception):
                L._get(f"http://127.0.0.1:{srv.server_port}/a", 1000, {"KSHANA_MCP_FETCH_TIMEOUT_S": "0.2"})
            self.assertLess(time.monotonic() - t, 1.5)
        finally:
            srv.shutdown()

    def test_version_matches_pyproject(self):
        text = (Path(__file__).resolve().parent.parent / "pyproject.toml").read_text()
        self.assertIn(f'version = "{L.__version__}"', text)


if __name__ == "__main__":
    unittest.main()
