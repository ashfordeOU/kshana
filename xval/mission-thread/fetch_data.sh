#!/bin/bash
# SPDX-License-Identifier: AGPL-3.0-only
# Fetch the reference trajectory of oracle row C1 of xval/mission-thread/PREREGISTRATION.md, with the request fixed there
# and changed by its Amendment 1 (the span the comparison uses: Horizons has no ephemeris for the target before
# 2022-11-16 08:46 TDB).
#
#   bash fetch_data.sh <dest-dir>
#
# Writes: c1_artemis1_horizons.json and SHA256SUMS. Public source only: JPL Horizons (ssd.jpl.nasa.gov).
# The file is never committed to the repository; the test pins its SHA-256.
set -euo pipefail
dest="${1:?usage: fetch_data.sh <dest-dir>}"
mkdir -p "$dest"
curl -sS -L --fail -G "https://ssd.jpl.nasa.gov/api/horizons.api" \
  --data-urlencode "format=json" \
  --data-urlencode "COMMAND='-1023'" \
  --data-urlencode "OBJ_DATA='NO'" \
  --data-urlencode "MAKE_EPHEM='YES'" \
  --data-urlencode "EPHEM_TYPE='VECTORS'" \
  --data-urlencode "CENTER='500@399'" \
  --data-urlencode "START_TIME='2022-11-16 18:00'" \
  --data-urlencode "STOP_TIME='2022-11-19 18:00'" \
  --data-urlencode "STEP_SIZE='1 h'" \
  --data-urlencode "REF_SYSTEM='ICRF'" \
  --data-urlencode "REF_PLANE='FRAME'" \
  --data-urlencode "OUT_UNITS='KM-S'" \
  --data-urlencode "VEC_TABLE='2'" \
  --data-urlencode "CSV_FORMAT='YES'" \
  -o "$dest/c1_artemis1_horizons.json"
( cd "$dest" && sha256sum c1_artemis1_horizons.json > SHA256SUMS )
cat "$dest/SHA256SUMS"
