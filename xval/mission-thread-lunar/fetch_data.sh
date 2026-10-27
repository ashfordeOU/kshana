#!/bin/bash
# SPDX-License-Identifier: AGPL-3.0-only
# Fetch the data for the pre-registered oracle rows A1 (LRO) and A2 (CAPSTONE) of
# xval/mission-thread-lunar/PREREGISTRATION.md, with the requests fixed in its Amendment 2, and the GRAIL GL0660B
# table of Amendment 1 (SHA-256 checked against the value recorded in
# xval/planetary-gravity-pyshtools/fetch_data.sh).
#
#   bash fetch_data.sh <dest-dir>
#
# Writes: a1_lro_horizons.json, a2_capstone_horizons.json, jggrx_0660b_sha.tab, and SHA256SUMS.
# Public sources only: JPL Horizons (ssd.jpl.nasa.gov) and the NASA PDS Geosciences Node.
set -euo pipefail
dest="${1:?usage: fetch_data.sh <dest-dir>}"
mkdir -p "$dest"
horizons() { # id start stop step out
  curl -sS -L --fail -G "https://ssd.jpl.nasa.gov/api/horizons.api" \
    --data-urlencode "format=json" \
    --data-urlencode "COMMAND='$1'" \
    --data-urlencode "OBJ_DATA='NO'" \
    --data-urlencode "MAKE_EPHEM='YES'" \
    --data-urlencode "EPHEM_TYPE='VECTORS'" \
    --data-urlencode "CENTER='500@301'" \
    --data-urlencode "START_TIME='$2'" \
    --data-urlencode "STOP_TIME='$3'" \
    --data-urlencode "STEP_SIZE='$4'" \
    --data-urlencode "REF_SYSTEM='ICRF'" \
    --data-urlencode "REF_PLANE='FRAME'" \
    --data-urlencode "OUT_UNITS='KM-S'" \
    --data-urlencode "VEC_TABLE='2'" \
    --data-urlencode "CSV_FORMAT='YES'" \
    -o "$5"
}
horizons -85   "2025-01-01 00:00" "2025-01-02 00:00" "10 m" "$dest/a1_lro_horizons.json"
horizons -1176 "2023-01-01 00:00" "2023-03-31 00:00" "1 h"  "$dest/a2_capstone_horizons.json"
grail=https://pds-geosciences.wustl.edu/grail/grail-l-lgrs-5-rdr-v1/grail_1001/shadr/jggrx_0660b_sha.tab
f="$dest/jggrx_0660b_sha.tab"
[ -f "$f" ] || curl -sS -L --fail -o "$f" "$grail"
echo "500e47e0ae2fa32d30615ea4af9ed6cca3a60e05c332d918692596a425708534  $f" | sha256sum -c -
( cd "$dest" && sha256sum a1_lro_horizons.json a2_capstone_horizons.json jggrx_0660b_sha.tab > SHA256SUMS )
cat "$dest/SHA256SUMS"
