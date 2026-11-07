#!/usr/bin/env bash
# SPDX-License-Identifier: AGPL-3.0-only
# B8: fetch the GFZ index files (CC BY 4.0, doi:10.5880/Kp.0001) into <dir>, never vendored, and check them
# against the SHA-256 values in MANIFEST.tsv (the copies the event days were drawn from on 7 November 2026).
# The Kp file grows every day, so a later copy differs; the event days only need the rows up to 2025.
#   bash xval/env-baseline/fetch_indices.sh <dir>
set -euo pipefail
dir=${1:?usage: fetch_indices.sh <dir>}
here=$(cd "$(dirname "$0")" && pwd)
mkdir -p "$dir"; cd "$dir"
curl -sS --fail -o Kp_ap_Ap_SN_F107_since_1932.txt https://kp.gfz.de/app/files/Kp_ap_Ap_SN_F107_since_1932.txt
for y in $(seq 2015 2025); do
  curl -sS --fail -o "QD_days$y.txt" "https://datapub.gfz.de/download/10.5880.Kp.0001/Quiet_Disturbed_Days/QD_days$y.txt"
done
while IFS=$'\t' read -r f sum; do
  got=$(sha256sum "$f" | cut -d' ' -f1)
  [ "$got" = "$sum" ] && echo "ok $f" || echo "differs $f (a later copy of a growing file is expected to)"
done < "$here/MANIFEST.tsv"
