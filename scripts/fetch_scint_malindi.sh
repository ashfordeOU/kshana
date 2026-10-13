#!/usr/bin/env sh
# Fetch the measured 50 Hz GPS L1 scintillation log used by
# tests/iq_scint_malindi_measured.rs (pre-registered in xval/scint-malindi/PREREGISTRATION.md).
#
# Zenodo record 16941224 (doi 10.5281/zenodo.16941224; INGV, NORISK project, Malindi,
# Kenya, 18 March 2023, GPS PRN 26), file data_f1.txt, Creative Commons Attribution 4.0
# International. It is 66 MB, so it is fetched into a git-ignored cache rather than vendored;
# the bytes are checked against the SHA-256 the pre-registration records.
#
# Usage: scripts/fetch_scint_malindi.sh [dest-dir]   (default: ./realdata-cache/scint-malindi)
set -eu

DEST="${1:-realdata-cache/scint-malindi}"
EXPECT_SHA256="4934ab9ab9d37a14fae0f3dc15aa0e00f848a5f3738d9f46da1445db5fadc7ef"
URL="https://zenodo.org/records/16941224/files/data_f1.txt?download=1"

sha256_of() {
    if command -v sha256sum >/dev/null 2>&1; then sha256sum "$1" | cut -d' ' -f1
    else shasum -a 256 "$1" | cut -d' ' -f1; fi
}

mkdir -p "$DEST"
if [ -f "$DEST/data_f1.txt" ]; then
    echo "Malindi scintillation log already present: $DEST/data_f1.txt"
    exit 0
fi
curl -fsSL "$URL" -o "$DEST/data_f1.txt.part"
GOT="$(sha256_of "$DEST/data_f1.txt.part")"
if [ "$GOT" != "$EXPECT_SHA256" ]; then
    rm -f "$DEST/data_f1.txt.part"
    echo "SHA-256 mismatch for data_f1.txt: got $GOT, expected $EXPECT_SHA256" >&2
    exit 1
fi
mv "$DEST/data_f1.txt.part" "$DEST/data_f1.txt"
echo "Malindi scintillation log fetched: $DEST/data_f1.txt"
