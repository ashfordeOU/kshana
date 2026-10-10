#!/usr/bin/env bash
# SPDX-License-Identifier: AGPL-3.0-only
# Package the built OpenCPN plugin library for OpenCPN's plugin catalogue, deterministically.
#
#   scripts/package-opencpn-plugin.sh <version> <libkshana_pi.so> <out-dir>
#
# Writes, into <out-dir>:
#   kshana_pi-<version>-1_ubuntu-wx32-24.04-x86_64.tar.gz   the plugin tarball, in the catalogue's layout
#       <stem>/metadata.xml                                      (the metadata below, without a checksum)
#       <stem>/lib/opencpn/libkshana_pi.so                       where OpenCPN looks for plugins
#       <stem>/share/opencpn/plugins/kshana_pi/data/{license.txt,README.md,...}
#   kshana_pi-<version>-ubuntu-wx32-x86_64-24.04.xml        the catalogue metadata, with the tarball's
#                                                               checksum and its release URL
#   kshana-opencpn-plugin-<version>-source.tar.gz            the plugin's complete source (GPL)
#
# The layout and the names follow the OpenCPN plugins project's tarball and metadata conventions
# (github.com/leamas/opencpn/wiki/Tarballs, OpenCPN/plugins). The XML is checked by
# scripts/check-opencpn-metadata.py. Reproducible: sorted entries, fixed owner, mtime from the commit,
# `gzip -n`. The target is where the build ran: Ubuntu 24.04, wxWidgets 3.2 (GTK3), x86-64.
#
# This writes files and nothing else. Submitting the metadata to OpenCPN's catalogue is a pull request the
# maintainer opens by hand after the release (packaging/opencpn/SUBMITTING.md).
set -euo pipefail

[ "$#" -eq 3 ] || { echo "usage: $0 <version> <libkshana_pi.so> <out-dir>" >&2; exit 2; }
ver="$1"; lib="$2"; out="$3"
root="$(cd "$(dirname "$0")/.." && pwd)"
plugin="$root/integrations/opencpn/plugin"
[ -f "$lib" ] || { echo "FAIL: $lib not found" >&2; exit 1; }
mkdir -p "$out"
out="$(cd "$out" && pwd)"

release=1
target="ubuntu-wx32-x86_64"; target_version="24.04"; target_arch="x86_64"
stem="kshana_pi-${ver}-${release}_ubuntu-wx32-${target_version}-${target_arch}"
tarball="${stem}.tar.gz"
metadata="kshana_pi-${ver}-${target}-${target_version}.xml"
url="https://github.com/ashfordeOU/kshana/releases/download/v${ver}/${tarball}"

mtime="$(git -C "$root" log -1 --format=%ct)"
tar_det() { # tar_det <dir> <archive> <paths...>
  local dir="$1" archive="$2"; shift 2
  tar -C "$dir" --sort=name --owner=0 --group=0 --numeric-owner \
      --mtime="@${mtime}" --format=gnu -cf - "$@" | gzip -n -9 > "$archive"
}
fill() { # fill [checksum]  -> metadata text on stdout (the checksum element only when given)
  local line="  <tarball-checksum>sha256:${1:-}</tarball-checksum>"
  local drop=""; [ -n "${1:-}" ] || drop="/@CHECKSUM_LINE@/d;"
  sed -e "${drop}" -e "s|@VERSION@|${ver}|g" -e "s|@RELEASE@|${release}|g" -e "s|@TARGET@|${target}|g" \
      -e "s|@TARGET_VERSION@|${target_version}|g" -e "s|@TARGET_ARCH@|${target_arch}|g" \
      -e "s|@TARBALL_URL@|${url}|g" -e "s|@CHECKSUM_LINE@|${line}|" \
      "$root/packaging/opencpn/kshana_pi.metadata.xml.in"
}

stage="$(mktemp -d)"
trap 'rm -rf "$stage"' EXIT
top="$stage/$stem"
install -D -m 0755 "$lib" "$top/lib/opencpn/libkshana_pi.so"
data="$top/share/opencpn/plugins/kshana_pi/data"
install -D -m 0644 "$plugin/LICENSE" "$data/license.txt"
install -D -m 0644 "$plugin/README.md" "$data/README.md"
install -D -m 0644 "$plugin/third_party/opencpn/README.txt" "$data/third_party-opencpn-README.txt"
fill > "$top/metadata.xml"          # no checksum inside the tarball it would describe
tar_det "$stage" "$out/$tarball" "$stem"

sha="$(sha256sum "$out/$tarball" | awk '{print $1}')"
fill "$sha" > "$out/$metadata"
python3 -I "$root/scripts/check-opencpn-metadata.py" "$out/$metadata" --tarball "$out/$tarball"
python3 -I "$root/scripts/check-opencpn-metadata.py" "$top/metadata.xml"

src="$out/kshana-opencpn-plugin-${ver}-source.tar.gz"
if [ ! -f "$src" ]; then
  # The GPL source that corresponds to the binary: the plugin directory and the sentence fixtures its
  # tests read.
  git -C "$root" archive --format=tar --prefix="kshana-opencpn-plugin-${ver}/" HEAD \
      integrations/opencpn/plugin integrations/signalk/test/fixtures \
    | gzip -n -9 > "$src"
fi
echo "packaged $tarball ($(wc -c < "$out/$tarball" | tr -d ' ') bytes, sha256 $sha) and $metadata"
