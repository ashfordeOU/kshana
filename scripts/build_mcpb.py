#!/usr/bin/env python3
# SPDX-License-Identifier: AGPL-3.0-only
"""Build a Claude Desktop extension (.mcpb) for one platform from a built kshana-mcp binary.

    scripts/build_mcpb.py <version> <target> <kshana-mcp binary> <out-dir>

  <target>  a Rust target: aarch64-apple-darwin, x86_64-apple-darwin, x86_64-pc-windows-msvc,
            x86_64-unknown-linux-gnu or aarch64-unknown-linux-gnu

Writes <out-dir>/kshana-mcp-<target>.mcpb. An .mcpb is a zip archive holding manifest.json, an icon and
the server; this script writes that zip itself, with the standard library only, so the release needs no
third-party packer and installs nothing at build time.

DETERMINISTIC: entries are sorted by name, every timestamp is 1980-01-01 00:00:00, permissions are fixed
(0755 for the binary, 0644 for the rest), no extra fields, and the compression level is fixed, so two
builds from the same inputs on the same Python are byte-identical (tests/test_build_mcpb.py proves it).

VALIDATED: the manifest is checked against the published MCPB manifest schema, version 0.3, committed as
packaging/mcp/mcpb/manifest-v0.3.schema.json. Source and version are recorded in
packaging/mcp/mcpb/SCHEMA-SOURCE.md and pinned here by hash.
Schema source: https://github.com/modelcontextprotocol/mcpb/blob/main/schemas/mcpb-manifest-v0.3.schema.json
Schema version: manifest_version 0.3 (copied from the packer's 2.1.2 release, published 2025-12-04).
"""
from __future__ import annotations

import hashlib
import json
import stat
import sys
import zipfile
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
MCPB_DIR = ROOT / "packaging" / "mcp" / "mcpb"
SCHEMA = MCPB_DIR / "manifest-v0.3.schema.json"
SCHEMA_SHA256 = "3a0ac9d845711a1b9b17dfa5a52f8b60628239d6a86a9db417206a9efc78592d"
TARGETS = {
    "aarch64-apple-darwin": ("darwin", "kshana-mcp"),
    "x86_64-apple-darwin": ("darwin", "kshana-mcp"),
    "x86_64-pc-windows-msvc": ("win32", "kshana-mcp.exe"),
    "x86_64-unknown-linux-gnu": ("linux", "kshana-mcp"),
    "aarch64-unknown-linux-gnu": ("linux", "kshana-mcp"),
}
FIXED_TIME = (1980, 1, 1, 0, 0, 0)


def render_manifest(version: str, platform: str, binary_name: str) -> dict:
    text = (MCPB_DIR / "manifest.json.in").read_text(encoding="utf-8")
    text = text.replace("@VERSION@", version).replace("@BINARY@", binary_name).replace("@PLATFORM@", platform)
    return json.loads(text)


def validate_manifest(manifest: dict) -> None:
    raw = SCHEMA.read_bytes()
    if hashlib.sha256(raw).hexdigest() != SCHEMA_SHA256:
        raise SystemExit(f"FAIL: {SCHEMA} differs from the recorded published schema (see SCHEMA-SOURCE.md)")
    try:
        import jsonschema
    except ImportError:
        raise SystemExit("FAIL: the jsonschema package is required to validate the manifest (pip install jsonschema)")
    errors = sorted(jsonschema.Draft7Validator(json.loads(raw)).iter_errors(manifest), key=lambda e: list(e.path))
    if errors:
        for e in errors:
            print(f"FAIL: manifest.json {'/'.join(map(str, e.path)) or '<root>'}: {e.message}", file=sys.stderr)
        raise SystemExit(1)
    server = manifest["server"]
    if server["type"] != "binary" or not server["entry_point"].startswith("server/"):
        raise SystemExit("FAIL: manifest server must be a binary under server/")
    if server["mcp_config"]["command"] != "${__dirname}/" + server["entry_point"]:
        raise SystemExit("FAIL: manifest mcp_config.command does not point at its entry_point")


def build(version: str, target: str, binary: Path, out_dir: Path) -> Path:
    if target not in TARGETS:
        raise SystemExit(f"FAIL: unknown target {target}")
    platform, name = TARGETS[target]
    if not binary.is_file():
        raise SystemExit(f"FAIL: {binary} not found")
    manifest = render_manifest(version, platform, name)
    validate_manifest(manifest)
    members = {
        "LICENSE": ((ROOT / "LICENSE").read_bytes(), 0o644),
        "icon.png": ((ROOT / "web" / "assets" / "brand" / "apple-touch-icon.png").read_bytes(), 0o644),
        "manifest.json": ((json.dumps(manifest, indent=2, ensure_ascii=False) + "\n").encode("utf-8"), 0o644),
        f"server/{name}": (binary.read_bytes(), 0o755),
    }
    out_dir.mkdir(parents=True, exist_ok=True)
    out = out_dir / f"kshana-mcp-{target}.mcpb"
    tmp = out.with_suffix(".mcpb.tmp")
    with zipfile.ZipFile(tmp, "w", zipfile.ZIP_DEFLATED, compresslevel=9) as z:
        for arc in sorted(members):
            data, mode = members[arc]
            info = zipfile.ZipInfo(arc, FIXED_TIME)
            info.create_system = 3  # Unix, so the mode bits below are honoured on extraction
            info.external_attr = (stat.S_IFREG | mode) << 16
            info.compress_type = zipfile.ZIP_DEFLATED
            z.writestr(info, data, compress_type=zipfile.ZIP_DEFLATED, compresslevel=9)
    tmp.replace(out)
    return out


def main(argv: list[str]) -> int:
    if len(argv) != 5:
        print("usage: build_mcpb.py <version> <target> <kshana-mcp binary> <out-dir>", file=sys.stderr)
        return 2
    out = build(argv[1], argv[2], Path(argv[3]), Path(argv[4]))
    print(f"wrote {out} ({out.stat().st_size} bytes, sha256 {hashlib.sha256(out.read_bytes()).hexdigest()})")
    return 0


if __name__ == "__main__":
    sys.exit(main(sys.argv))
