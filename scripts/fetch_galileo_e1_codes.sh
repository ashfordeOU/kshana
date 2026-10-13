#!/bin/sh
# SPDX-License-Identifier: AGPL-3.0-only
# Fetch the Galileo E1-B / E1-C primary memory codes into data/galileo-os-sis-icd/ (and the E5a
# Annex C.3 / C.4 test oracle into tests/fixtures/iq_signals/) for your own use. They are Technical Data of the Galileo OS SIS ICD (c) European Union 2021, which the ICD
# lets you store with the source acknowledged and use in a product, but redistribute only for
# non-commercial purposes; so Kshana does not bundle them, and the extracted files are
# git-ignored. Read the ICD's "Terms of Use and Disclaimers" and its IPR Authorisation (Annex G
# of Issue 2.0) before using them; see LICENSING.md and data/galileo-os-sis-icd/PROVENANCE.md.
#
# Usage (from the repository root): sh scripts/fetch_galileo_e1_codes.sh
# Needs curl, sha256sum and pdfdetach (poppler-utils).
set -e
URL="https://www.gsc-europa.eu/sites/default/files/sites/all/files/Galileo_OS_SIS_ICD_v2.0.pdf"
PDF_SHA256="ce97057a9e9d74cc41a6b986c6e9ef03ce420eda474787b4f8f0456b369a81c0"
OUT="$(cd "$(dirname "$0")/.." && pwd)/data/galileo-os-sis-icd"
TMP="$(mktemp -d)"
trap 'rm -rf "$TMP"' EXIT
curl -sSfL -o "$TMP/icd.pdf" "$URL"
echo "$PDF_SHA256  $TMP/icd.pdf" | sha256sum -c -
mkdir -p "$TMP/att"
pdfdetach -saveall -o "$TMP/att" "$TMP/icd.pdf"
for f in C7_E1B.txt C8_E1C.txt; do
    cp "$TMP/att/$f" "$OUT/$f"
done
# The E5a-I / E5a-Q codes (Annex C.3 / C.4), the test-only oracle of the E5a LFSR generator.
FIX="$(cd "$(dirname "$0")/.." && pwd)/tests/fixtures/iq_signals"
for f in C3_E5aI.txt C4_E5aQ.txt; do
    cp "$TMP/att/$f" "$FIX/$f"
done
# The CR-stripped hashes recorded in PROVENANCE.md.
( cd "$OUT" && for f in C7_E1B.txt C8_E1C.txt; do printf '%s  %s\n' "$(tr -d '\r' < "$f" | sha256sum | cut -d' ' -f1)" "$f"; done )
echo "Galileo E1 tables written to $OUT (for your own use; do not redistribute them commercially)."
