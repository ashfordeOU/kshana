#!/usr/bin/env bash
# SPDX-License-Identifier: AGPL-3.0-only
# Build a Claude Desktop extension (.mcpb) for one platform from a built kshana-mcp binary.
#
#   scripts/build-mcpb.sh <version> <target> <kshana-mcp binary> <out-dir>
#
#   <target>  a Rust target: aarch64-apple-darwin, x86_64-apple-darwin, x86_64-pc-windows-msvc,
#             x86_64-unknown-linux-gnu or aarch64-unknown-linux-gnu
#
# Writes <out-dir>/kshana-mcp-<target>.mcpb: manifest.json (from packaging/mcp/mcpb/manifest.json.in),
# icon.png, LICENSE and the binary under server/. `mcpb` (@anthropic-ai/mcpb) is a BUILD-TIME tool only:
# it validates the manifest and zips the folder; nothing from it ships in the extension. The version is
# pinned exactly (a release published long before it is used), and run through npx without being added to
# any package.json.
set -euo pipefail

MCPB_VERSION="2.1.2"   # @anthropic-ai/mcpb, published 2025-12-04

[ "$#" -eq 4 ] || { echo "usage: $0 <version> <target> <kshana-mcp binary> <out-dir>" >&2; exit 2; }
ver="$1"; target="$2"; bin="$3"; out="$4"
root="$(cd "$(dirname "$0")/.." && pwd)"
[ -f "$bin" ] || { echo "FAIL: $bin not found" >&2; exit 1; }
case "$target" in
  *-apple-darwin)        platform="darwin"; name="kshana-mcp" ;;
  *-pc-windows-msvc)     platform="win32";  name="kshana-mcp.exe" ;;
  *-unknown-linux-gnu)   platform="linux";  name="kshana-mcp" ;;
  *) echo "FAIL: unknown target $target" >&2; exit 2 ;;
esac
mkdir -p "$out"
out="$(cd "$out" && pwd)"

stage="$(mktemp -d)"
trap 'rm -rf "$stage"' EXIT
mkdir -p "$stage/server"
install -m 0755 "$bin" "$stage/server/$name"
cp "$root/web/assets/brand/apple-touch-icon.png" "$stage/icon.png"
cp "$root/LICENSE" "$stage/LICENSE"
sed -e "s|@VERSION@|${ver}|g" -e "s|@BINARY@|${name}|g" -e "s|@PLATFORM@|${platform}|g" \
  "$root/packaging/mcp/mcpb/manifest.json.in" > "$stage/manifest.json"
python3 -I -c 'import json,sys; json.load(open(sys.argv[1], encoding="utf-8"))' "$stage/manifest.json"

npx --yes "@anthropic-ai/mcpb@${MCPB_VERSION}" validate "$stage/manifest.json"
npx --yes "@anthropic-ai/mcpb@${MCPB_VERSION}" pack "$stage" "$out/kshana-mcp-${target}.mcpb"
ls -l "$out/kshana-mcp-${target}.mcpb"
