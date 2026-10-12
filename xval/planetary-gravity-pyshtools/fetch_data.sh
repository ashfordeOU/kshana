#!/bin/bash
# SPDX-License-Identifier: AGPL-3.0-only
# Fetch the full-degree planetary gravity tables for the gated tests in
# tests/planetary_gravity_pds.rs and verify their SHA-256 (recorded 2026-10-12).
#
#   bash fetch_data.sh <dest-dir>
#   export KSHANA_GMM3_SHA=<dest-dir>/gmm3_120_sha.tab
#   export KSHANA_GRAIL_SHA=<dest-dir>/jggrx_0660b_sha.tab
#   export KSHANA_GL0660B_GFC=<dest-dir>/GL0660B.gfc
#   cargo test --test planetary_gravity_pds -- --ignored --nocapture
set -euo pipefail
dest="${1:?usage: fetch_data.sh <dest-dir>}"
mkdir -p "$dest"
mro=https://pds-geosciences.wustl.edu/mro/mro-m-rss-5-sdp-v1/mrors_1xxx/data/shadr
grail=https://pds-geosciences.wustl.edu/grail/grail-l-lgrs-5-rdr-v1/grail_1001/shadr
icgem=https://icgem.gfz.de/getmodel/gfc/b4f8182e0e0a2112fc3720a2fb5d10f885e4aed39652b8ba8e9d3c2a8645c29c/GL0660B.gfc
while read -r sha url; do
  f="$dest/$(basename "$url")"
  [ -f "$f" ] || curl -sS -L --fail -o "$f" "$url"
  echo "$sha  $f" | sha256sum -c -
done <<EOF
eb4913b1afb6682406e6a9dad5be7918a162fa8462473c9a2e7aae258d4c2c9c $mro/gmm3_120_sha.tab
097f9989fc87bc9adbf04be754734349160228de940f9a242164f3be1b80bb7d $mro/gmm3_120_sha.lbl
500e47e0ae2fa32d30615ea4af9ed6cca3a60e05c332d918692596a425708534 $grail/jggrx_0660b_sha.tab
57637dfbb1cc93743fb080405c217840d396dd9712c3aacfcdc1da4d753b398c $grail/jggrx_0660b_sha.lbl
e15d0d1f69b02126b5bb493c4c93b854ea30843b82b1818d03599ad420a19bcf $icgem
EOF
