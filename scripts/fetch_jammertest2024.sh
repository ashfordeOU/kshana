#!/usr/bin/env sh
# Fetch the JammerTest 2024 dataset used by kshana-bench task (a) and extract it OUTSIDE the repository.
#
# Source: Zenodo record 15911589 (doi 10.5281/zenodo.15911589), GNSS_DATASET_JAMMING_SPOOFING.tar.gz,
# 375,338,522 bytes, GPL-3.0-or-later. Cite V. Renaudin, M. I. Sayyaf, F. Le Bourhis, M. Ortiz, "GNSS
# Positioning Under Threat", IEEE JISPIN, doi 10.1109/JISPIN.2025.3629705. The data is never vendored:
# the archive is checked against the SHA-256 below before it is extracted.
#
# Usage: scripts/fetch_jammertest2024.sh <dest-dir>
#   dest-dir/GNSS_DATASET_JAMMING_SPOOFING.tar.gz   the archive (kept)
#   dest-dir/extracted/                             pass this to `kshana bench truth|baseline --data`
set -eu

DEST="${1:?usage: fetch_jammertest2024.sh <dest-dir>}"
URL="https://zenodo.org/records/15911589/files/GNSS_DATASET_JAMMING_SPOOFING.tar.gz?download=1"
SHA="73e78934aa00d01dfeebabc45f81b38c9c0aecf972f5fc94d9ff60527065b313"
F="$DEST/GNSS_DATASET_JAMMING_SPOOFING.tar.gz"

sha256_of() {
    if command -v sha256sum >/dev/null 2>&1; then sha256sum "$1" | cut -d' ' -f1
    else shasum -a 256 "$1" | cut -d' ' -f1; fi
}

mkdir -p "$DEST/extracted"
if [ ! -f "$F" ]; then
    curl -fsSL -C - --retry 5 --retry-delay 10 -o "$F.part" "$URL"
    mv "$F.part" "$F"
fi
GOT="$(sha256_of "$F")"
if [ "$GOT" != "$SHA" ]; then
    echo "SHA-256 mismatch: got $GOT, expected $SHA" >&2
    exit 1
fi
tar -xzf "$F" -C "$DEST/extracted"
echo "extracted to $DEST/extracted (24 scenario folders expected)"
