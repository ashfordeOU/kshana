#!/usr/bin/env sh
# Fetch OPSSAT-AD dataset.csv, the one file kshana-bench task (f) reads, OUTSIDE the repository.
#
# Source: Zenodo record 15108715 (doi 10.5281/zenodo.15108715), dataset.csv, 507,550 bytes. Licence: CC-BY-4.0
# in the record metadata; the record's LICENSE file is the MIT licence (copyright 2024 KP Labs). Cite B. Ruszczak
# et al., "OPSSAT-AD: anomaly detection dataset for satellite telemetry", Scientific Data (2025),
# doi 10.1038/s41597-025-05035-3. The file is
# never committed: it is checked against the SHA-256 below (bench/manifests/f-opssat-ad.json) before use.
#
# Usage: scripts/fetch_opssat_ad.sh <dest-dir>
#   dest-dir/dataset.csv    pass this to `kshana bench cases|baseline --task f --data`
set -eu

DEST="${1:?usage: fetch_opssat_ad.sh <dest-dir>}"
URL="https://zenodo.org/records/15108715/files/dataset.csv?download=1"
SHA="b524177da6f516d5c9f63c7acbc385341f0ad42046ef20c1bed2d25e51b98f02"
F="$DEST/dataset.csv"

sha256_of() {
    if command -v sha256sum >/dev/null 2>&1; then sha256sum "$1" | cut -d' ' -f1
    else shasum -a 256 "$1" | cut -d' ' -f1; fi
}

mkdir -p "$DEST"
if [ ! -f "$F" ]; then
    curl -fsSL --retry 5 --retry-delay 10 -o "$F.part" "$URL"
    mv "$F.part" "$F"
fi
GOT="$(sha256_of "$F")"
if [ "$GOT" != "$SHA" ]; then
    echo "SHA-256 mismatch: got $GOT, expected $SHA" >&2
    exit 1
fi
echo "$F verified (SHA-256 $SHA)"
