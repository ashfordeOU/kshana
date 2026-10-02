#!/usr/bin/env bash
# Fill the local LSIS V1.0 cache that src/lunar_afs reads at run time.
#
#   xval/lunar-afs/fetch_lsis.sh            # cache in $KSHANA_LSIS_DIR or ~/.cache/kshana/lsis
#
# The LunaNet Signal-In-Space Recommended Standard (LSIS) V1.0 of 29 January 2025 and its
# attachments carry no reuse terms, so Kshana does not redistribute them. This script downloads
# the NASA-hosted PDF, checks its SHA-256, extracts the embedded attachments (pdfdetach) and the
# printed check values the data-gated oracle test reads (pdftotext + extract_lsis_tables.py),
# and checks every attachment the engine reads against the digests pinned in
# src/lunar_afs/lsis.rs. Needs curl, poppler-utils (pdfdetach, pdftotext), python3, sha256sum.
set -euo pipefail
HERE="$(cd "$(dirname "$0")" && pwd)"
DIR="${KSHANA_LSIS_DIR:-$HOME/.cache/kshana/lsis}"
URL="https://www.nasa.gov/wp-content/uploads/2025/02/lunanet-signal-in-space-recommended-standard-augmented-forward-signal-vol-a.pdf"
PDF_SHA=986e07959f527d24280d87b5477298424ffdf754c4625f08041b5749592e61b6
mkdir -p "$DIR"
cd "$DIR"
if [ ! -s lsis.pdf ] || ! echo "$PDF_SHA  lsis.pdf" | sha256sum -c --quiet - 2>/dev/null; then
  curl -fsSL --retry 3 -o lsis.pdf.part "$URL"
  mv lsis.pdf.part lsis.pdf
fi
echo "$PDF_SHA  lsis.pdf" | sha256sum -c --quiet -
pdfdetach -saveall lsis.pdf
pdftotext -layout lsis.pdf lsis.txt
python3 "$HERE/extract_lsis_tables.py" lsis.txt printed
# Verify every file the engine reads against the digests pinned in src/lunar_afs/lsis.rs.
python3 - "$HERE/../../src/lunar_afs/lsis.rs" <<'PY'
import hashlib, re, sys
pins = re.findall(r'\(\s*"([^"]+)",\s*"([0-9a-f]{64})",?\s*\)', open(sys.argv[1]).read())
if len(pins) < 14:
    sys.exit(f"only {len(pins)} pinned digests found in {sys.argv[1]}")
bad = [n for n, h in pins if hashlib.sha256(open(n, "rb").read()).hexdigest() != h]
if bad:
    sys.exit(f"SHA-256 mismatch: {bad}")
print(f"{len(pins)} pinned files verified")
PY
echo "LSIS cache ready: $DIR"
