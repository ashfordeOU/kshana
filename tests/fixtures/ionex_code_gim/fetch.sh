#!/usr/bin/env bash
# SPDX-License-Identifier: AGPL-3.0-only
# Fetch the CODE final global ionosphere map of 2018-05-13 and build, OUTSIDE the repository,
# the latitude crop and its formula reference that tests/ionex_code_gim_oracle.rs checks when
# KSHANA_IONEX_CODE_GIM_DIR names the output directory. The map is not vendored: no licence for
# it could be confirmed from a primary source (see NOTICE.md).
#   bash fetch.sh <out dir>      then   KSHANA_IONEX_CODE_GIM_DIR=<out dir> cargo test --test ionex_code_gim_oracle
# Sources, tried in order: the CDDIS IGS data center (needs an Earthdata login in ~/.netrc), then
# the AIUB archive of the producer.
set -euo pipefail
HERE="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
OUT="${1:?usage: fetch.sh <out dir>}"; mkdir -p "$OUT"
Z="$OUT/CODG1330.18I.Z"
SHA_Z=6f2ef96d339ff0e6fa9ef42f337d9a7ab6ee5c3cc5c8cf94c21080c77ca235c1
SHA_I=95a0ea0d046f20e4fbded109295ae76cfa7fe2f75004883b1baef47c5d3151c4
ok() { [ -s "$Z" ] && echo "$SHA_Z  $Z" | sha256sum -c --status -; }
for url in "https://cddis.nasa.gov/archive/gnss/products/ionex/2018/133/codg1330.18i.Z" \
           "https://www.aiub.unibe.ch/download/CODE/2018/CODG1330.18I.Z"; do
  ok && break
  curl -fsSL --netrc-optional -o "$Z" "$url" || true   # a login page also lands here; the hash rejects it
done
ok || { echo "no source gave the pinned file (SHA-256 $SHA_Z)"; exit 1; }
gzip -dc "$Z" > "$OUT/CODG1330.18I"
echo "$SHA_I  $OUT/CODG1330.18I" | sha256sum -c -
python3 -I "$HERE/make_fixture.py" "$OUT/CODG1330.18I" > "$OUT/map.18i"
python3 -I "$HERE/reference_interp.py" "$OUT/map.18i" "$OUT/reference_vtec.csv.gz"
sha256sum "$OUT/map.18i" "$OUT/reference_vtec.csv.gz"
