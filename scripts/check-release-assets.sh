#!/usr/bin/env bash
# SPDX-License-Identifier: AGPL-3.0-only
# Check a directory of release assets: the required files are all there, nothing unexpected is,
# and SHA256SUMS lists exactly the files present and matches their bytes.
#
#   scripts/check-release-assets.sh <dir> <version>
#
# Run by release.yml on the staged assets (before they are attested and uploaded, and in a
# dry run) and again on the assets downloaded back from the published release.
set -euo pipefail
dir="${1:?usage: check-release-assets.sh <dir> <version>}"; ver="${2:?version}"
here="$(cd "$(dirname "$0")" && pwd)"
cd "$dir"

required=(
  kshana kshana-mcp
  kshana-sbom.cdx.json kshana-channels-sbom.cdx.json kshana-validation-summary.html
  kshana-aarch64-apple-darwin kshana-x86_64-apple-darwin kshana-x86_64-pc-windows-msvc.exe
  "kshana_pi-${ver}-1_ubuntu-wx32-24.04-x86_64.tar.gz"
  "kshana_pi-${ver}-ubuntu-wx32-x86_64-24.04.xml"
  "kshana-opencpn-plugin-${ver}-source.tar.gz"
  SHA256SUMS
)
fail=0
for f in "${required[@]}"; do
  [ -f "$f" ] || { echo "::error::required release asset missing: $f"; fail=1; }
done
# Name patterns that must match at least one file, and nothing else is allowed.
shopt -s nullglob
grafana=(kshana-grafana-*.json); [ "${#grafana[@]}" -ge 1 ] || { echo "::error::no kshana-grafana-*.json asset"; fail=1; }
signalk=(*.tgz); [ "${#signalk[@]}" -eq 1 ] || { echo "::error::expected exactly one Signal K npm tarball (*.tgz), found ${#signalk[@]}"; fail=1; }
[ "$fail" -eq 0 ] || exit 1

present="$(find . -maxdepth 1 -type f | sed 's|^\./||' | LC_ALL=C sort)"
expected="$(printf '%s\n' "${required[@]}" "${grafana[@]}" "${signalk[@]}" | LC_ALL=C sort -u)"
[ "$present" = "$expected" ] || { echo "::error::asset set differs from the expected set"; diff <(echo "$expected") <(echo "$present") || true; exit 1; }

sha256sum --strict -c SHA256SUMS
listed="$(awk '{print $2}' SHA256SUMS | sed 's/^\*//' | LC_ALL=C sort)"
want="$(echo "$present" | grep -vx SHA256SUMS)"
[ "$listed" = "$want" ] || { echo "::error::SHA256SUMS does not list exactly the assets"; diff <(echo "$listed") <(echo "$want") || true; exit 1; }
# The OpenCPN catalogue metadata names the tarball and carries its SHA-256: they must agree.
python3 -I "$here/check-opencpn-metadata.py" "kshana_pi-${ver}-ubuntu-wx32-x86_64-24.04.xml" \
  --tarball "kshana_pi-${ver}-1_ubuntu-wx32-24.04-x86_64.tar.gz"
echo "OK: $(echo "$present" | wc -l | tr -d ' ') assets present, SHA256SUMS matches"
