#!/usr/bin/env bash
# SPDX-License-Identifier: AGPL-3.0-only
# Package the built OpenCPN plugin library and its source, deterministically.
#
#   scripts/package-opencpn-plugin.sh <version> <libkshana_pi.so> <platform> <out-dir>
#
#   <platform>  the target name used in the asset name, e.g. linux-x86_64
#
# Writes, into <out-dir>:
#   kshana-opencpn-plugin-<version>-<platform>.tar.gz
#       lib/opencpn/libkshana_pi.so                          the plugin, where OpenCPN looks
#       share/opencpn/plugins/kshana_pi/LICENSE              GPL-3.0-or-later
#       share/opencpn/plugins/kshana_pi/README.md
#       share/opencpn/plugins/kshana_pi/third_party-opencpn-README.txt   header provenance
#   kshana-opencpn-plugin-<version>-source.tar.gz            (once, when absent)
#       the plugin's complete corresponding source (GPL), from `git archive` of the tag
#   kshana-opencpn-catalogue-draft.xml                       DRAFT catalogue metadata
#
# Reproducible: sorted entries, fixed owner, mtime from the commit, `gzip -n`. The same
# inputs give the same bytes.
#
# The catalogue draft is only ever written next to the build, never attached to a release
# and never submitted anywhere: submitting a plugin to OpenCPN's catalogue is an outward
# step the maintainer approves separately (docs/RELEASING.md).
set -euo pipefail

[ "$#" -eq 4 ] || { echo "usage: $0 <version> <libkshana_pi.so> <platform> <out-dir>" >&2; exit 2; }
ver="$1"; lib="$2"; platform="$3"; out="$4"
root="$(cd "$(dirname "$0")/.." && pwd)"
plugin="$root/integrations/opencpn/plugin"
[ -f "$lib" ] || { echo "FAIL: $lib not found" >&2; exit 1; }
mkdir -p "$out"
out="$(cd "$out" && pwd)"

mtime="$(git -C "$root" log -1 --format=%ct)"
tar_det() { # tar_det <dir> <archive> <paths...>
  local dir="$1" archive="$2"; shift 2
  tar -C "$dir" --sort=name --owner=0 --group=0 --numeric-owner \
      --mtime="@${mtime}" --format=gnu -cf - "$@" | gzip -n -9 > "$archive"
}

stage="$(mktemp -d)"
trap 'rm -rf "$stage"' EXIT
install -D -m 0755 "$lib" "$stage/lib/opencpn/libkshana_pi.so"
doc="$stage/share/opencpn/plugins/kshana_pi"
install -D -m 0644 "$plugin/LICENSE" "$doc/LICENSE"
install -D -m 0644 "$plugin/README.md" "$doc/README.md"
install -D -m 0644 "$plugin/third_party/opencpn/README.txt" "$doc/third_party-opencpn-README.txt"
bin="$out/kshana-opencpn-plugin-${ver}-${platform}.tar.gz"
tar_det "$stage" "$bin" lib share

src="$out/kshana-opencpn-plugin-${ver}-source.tar.gz"
if [ ! -f "$src" ]; then
  # The GPL source that corresponds to the binary: the plugin directory, the sentence
  # fixtures its tests read, and the wx-free core the panel uses.
  git -C "$root" archive --format=tar --prefix="kshana-opencpn-plugin-${ver}/" HEAD \
      integrations/opencpn/plugin integrations/signalk/test/fixtures \
    | gzip -n -9 > "$src"
fi

sha="$(sha256sum "$bin" | awk '{print $1}')"
size="$(wc -c < "$bin" | tr -d ' ')"
sed -e "s/@VERSION@/${ver}/g" -e "s/@PLATFORM@/${platform}/g" \
    -e "s/@SHA256@/${sha}/g" -e "s/@SIZE@/${size}/g" \
    "$root/packaging/opencpn/kshana_pi-catalogue.draft.xml" \
    > "$out/kshana-opencpn-catalogue-draft.xml"

echo "packaged $(basename "$bin") ($size bytes, sha256 $sha)"
