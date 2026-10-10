# SPDX-License-Identifier: AGPL-3.0-only
"""Download, verify and run the prebuilt kshana-mcp binary of THIS package's version.

The binary is a GitHub release asset; SHA256SUMS (also a release asset, written by the same release run) lists its
checksum. The download is refused when the checksum differs, so a damaged or swapped file is never run. That
protects the transfer; it does not prove who built it: for that, `gh attestation verify <file> --repo
ashfordeOU/kshana` checks the build provenance of the same file. Nothing is written to stdout except by the server
itself (stdout is the MCP channel); every message goes to stderr.
"""
from __future__ import annotations

import hashlib
import os
import platform
import re
import subprocess
import sys
import tempfile
import urllib.request
from pathlib import Path

from . import __version__

REPO = "ashfordeOU/kshana"


def asset_for(system: str, machine: str) -> str | None:
    """The release asset for a platform, or None. Linux x86-64 keeps its historical bare name."""
    m = machine.lower()
    arm = m in ("arm64", "aarch64")
    x64 = m in ("x86_64", "amd64", "x64")
    if system == "Linux" and x64:
        return "kshana-mcp"
    if system == "Linux" and arm:
        return "kshana-mcp-aarch64-unknown-linux-gnu"
    if system == "Darwin" and arm:
        return "kshana-mcp-aarch64-apple-darwin"
    if system == "Darwin" and x64:
        return "kshana-mcp-x86_64-apple-darwin"
    if system == "Windows" and x64:
        return "kshana-mcp-x86_64-pc-windows-msvc.exe"
    return None


def parse_sums(text: str) -> dict[str, str]:
    out = {}
    for line in text.splitlines():
        m = re.match(r"^([0-9a-fA-F]{64})\s+\*?(.+)$", line.strip())
        if m:
            out[m.group(2)] = m.group(1).lower()
    return out


def verify(data: bytes, name: str, sums: dict[str, str]) -> None:
    want = sums.get(name)
    if not want:
        raise RuntimeError(f"SHA256SUMS does not list {name}; refusing to run an unlisted file")
    got = hashlib.sha256(data).hexdigest()
    if got != want:
        raise RuntimeError(f"{name}: sha256 {got} does not match SHA256SUMS {want}; refusing to run it")


def release_base(version: str, env=os.environ) -> str:
    return (env.get("KSHANA_MCP_RELEASE_BASE") or f"https://github.com/{REPO}/releases/download/v{version}").rstrip("/")


def cache_dir(version: str, env=os.environ) -> Path:
    root = env.get("KSHANA_MCP_CACHE_DIR")
    if root:
        return Path(root) / version
    base = env.get("XDG_CACHE_HOME") or str(Path.home() / ".cache")
    return Path(base) / "kshana-mcp" / version


def _get(url: str) -> bytes:
    with urllib.request.urlopen(url, timeout=120) as r:  # follows redirects (GitHub release assets redirect)
        return r.read()


def ensure_binary(version: str = __version__, env=os.environ, system: str | None = None,
                  machine: str | None = None) -> Path:
    name = asset_for(system or platform.system(), machine or platform.machine())
    if not name:
        raise RuntimeError(f"no prebuilt kshana-mcp for {platform.system()}/{platform.machine()}; "
                           "use the Docker image or `cargo install kshana-mcp`")
    base = release_base(version, env)
    target = cache_dir(version, env) / name
    sums = parse_sums(_get(f"{base}/SHA256SUMS").decode("utf-8"))
    if target.exists():
        try:
            verify(target.read_bytes(), name, sums)   # a cached file is re-checked every run
            return target
        except RuntimeError as e:
            print(f"kshana-mcp: cached file rejected ({e}); downloading again", file=sys.stderr)
            target.unlink()
    print(f"kshana-mcp: downloading {name} v{version}", file=sys.stderr)
    data = _get(f"{base}/{name}")
    verify(data, name, sums)
    target.parent.mkdir(parents=True, exist_ok=True)
    fd, tmp = tempfile.mkstemp(dir=target.parent, suffix=".tmp")
    with os.fdopen(fd, "wb") as fh:
        fh.write(data)
    os.chmod(tmp, 0o755)
    os.replace(tmp, target)
    return target


def main(argv: list[str] | None = None) -> int:
    args = sys.argv[1:] if argv is None else argv
    try:
        binary = ensure_binary()
    except Exception as e:  # noqa: BLE001 - one clear line, no traceback, on stderr
        print(f"kshana-mcp: {e}", file=sys.stderr)
        return 1
    try:
        return subprocess.call([str(binary), *args])
    except OSError as e:
        print(f"kshana-mcp: cannot run {binary}: {e}", file=sys.stderr)
        return 1


if __name__ == "__main__":
    raise SystemExit(main())
