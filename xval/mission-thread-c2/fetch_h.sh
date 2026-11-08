#!/bin/bash
# SPDX-License-Identifier: AGPL-3.0-only
# Fetch H for C2 (docs/mission-thread/PREREGISTRATION-C2.md, section 1): the half-hour offsets of W1, from
# 2022-11-16 18:30 to 2022-11-19 17:30 TDB at one hour (71 states), same source and request form as C1. Run only
# after the detector, the impulses (xval/mission-thread-c2/impulses.json) and the propagation code are committed.
#
#   bash fetch_h.sh <dest-dir>
#
# Writes c2_artemis1_h.json and SHA256SUMS. Never committed; the result records the state table's SHA-256.
set -euo pipefail
dest="${1:?usage: fetch_h.sh <dest-dir>}"
mkdir -p "$dest"
curl -sS -L --fail -G "https://ssd.jpl.nasa.gov/api/horizons.api" \
  --data-urlencode "format=json" \
  --data-urlencode "COMMAND='-1023'" \
  --data-urlencode "OBJ_DATA='NO'" \
  --data-urlencode "MAKE_EPHEM='YES'" \
  --data-urlencode "EPHEM_TYPE='VECTORS'" \
  --data-urlencode "CENTER='500@399'" \
  --data-urlencode "TIME_TYPE='TDB'" \
  --data-urlencode "START_TIME='2022-11-16 18:30'" \
  --data-urlencode "STOP_TIME='2022-11-19 17:30'" \
  --data-urlencode "STEP_SIZE='1 h'" \
  --data-urlencode "REF_SYSTEM='ICRF'" \
  --data-urlencode "REF_PLANE='FRAME'" \
  --data-urlencode "OUT_UNITS='KM-S'" \
  --data-urlencode "VEC_TABLE='2'" \
  --data-urlencode "CSV_FORMAT='YES'" \
  -o "$dest/c2_artemis1_h.json"
( cd "$dest" && sha256sum c2_artemis1_h.json > SHA256SUMS )
cat "$dest/SHA256SUMS"
