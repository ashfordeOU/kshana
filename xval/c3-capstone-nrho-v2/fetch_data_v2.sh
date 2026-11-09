#!/bin/bash
# SPDX-License-Identifier: AGPL-3.0-only
# Fetch the data for C3 v2 (xval/c3-capstone-nrho-v2/README.md)
# (docs/design/evidence/c3-capstone-nrho-force-model/PREREGISTRATION.md): the fresh span G of CAPSTONE (v2)
# (JPL Horizons -1176, Moon-centred, ICRF, TDB, hourly, 2023-07-01 00:00 to 2023-09-28 00:00 UTC) and NAIF's de440s.bsp.
# Neither is vendored: each file is written with its URL, retrieval date and SHA-256 to FETCHED.txt, which is
# committed; the runs read the files from <dest-dir>.
#
#   bash fetch_data.sh <dest-dir>
#
# Public sources only: JPL Horizons (ssd.jpl.nasa.gov) and the NAIF generic kernels.
set -euo pipefail
dest="${1:?usage: fetch_data.sh <dest-dir>}"
mkdir -p "$dest"
url_h="https://ssd.jpl.nasa.gov/api/horizons.api"
curl -sS -L --fail -G "$url_h" \
  --data-urlencode "format=json" \
  --data-urlencode "COMMAND='-1176'" \
  --data-urlencode "OBJ_DATA='NO'" \
  --data-urlencode "MAKE_EPHEM='YES'" \
  --data-urlencode "EPHEM_TYPE='VECTORS'" \
  --data-urlencode "CENTER='500@301'" \
  --data-urlencode "START_TIME='2023-07-01 00:00'" \
  --data-urlencode "STOP_TIME='2023-09-28 00:00'" \
  --data-urlencode "STEP_SIZE='1 h'" \
  --data-urlencode "REF_SYSTEM='ICRF'" \
  --data-urlencode "REF_PLANE='FRAME'" \
  --data-urlencode "OUT_UNITS='KM-S'" \
  --data-urlencode "VEC_TABLE='2'" \
  --data-urlencode "CSV_FORMAT='YES'" \
  -o "$dest/g_capstone_horizons.json"
url_k="https://naif.jpl.nasa.gov/pub/naif/generic_kernels/spk/planets/de440s.bsp"
[ -f "$dest/de440s.bsp" ] || curl -sS -L --fail -o "$dest/de440s.bsp" "$url_k"
# The de440s.bsp SHA-256 already recorded in tests/fixtures/porkchop_de440/NOTICE.md.
echo "c1c7feeab882263fc493a9d5a5b2ddd71b54826cdf65d8d17a76126b260a49f2  $dest/de440s.bsp" | sha256sum -c -
{
  echo "retrieved_utc: $(date -u +%Y-%m-%dT%H:%M:%SZ)"
  echo "g_capstone_horizons.json  $url_h (COMMAND=-1176 CENTER=500@301 ICRF VEC_TABLE=2 KM-S, 2023-07-01 00:00 to 2023-09-28 00:00, 1 h)"
  echo "de440s.bsp  $url_k"
  ( cd "$dest" && sha256sum g_capstone_horizons.json de440s.bsp )
} > "$dest/FETCHED.txt"
cat "$dest/FETCHED.txt"
