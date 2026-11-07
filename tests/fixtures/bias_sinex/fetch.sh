#!/usr/bin/env bash
# SPDX-License-Identifier: AGPL-3.0-only
# Fetch, OUTSIDE the repository, the two public Bias-SINEX files tests/bias_sinex.rs reads when
# KSHANA_BIAS_SINEX_DIR names the output directory. They are not vendored (see NOTICE.md).
#   bash fetch.sh <out dir>      then   KSHANA_BIAS_SINEX_DIR=<out dir> cargo test --test bias_sinex
# Source: the IGS global data centre at BKG (anonymous HTTPS).
set -euo pipefail
OUT="${1:?usage: fetch.sh <out dir>}"; mkdir -p "$OUT"
BKG=https://igs.bkg.bund.de/root_ftp/IGS/products
get() { # url, compressed sha256, plain name, plain sha256
  local z="$OUT/$(basename "$1")"
  [ -s "$z" ] && echo "$2  $z" | sha256sum -c --status - || curl -fsSL -o "$z" "$1"
  echo "$2  $z" | sha256sum -c -
  gzip -dc "$z" > "$OUT/$3"
  echo "$4  $OUT/$3" | sha256sum -c -
}
get "$BKG/2300/CAS0OPSRAP_20240350000_01D_01D_DCB.BIA.gz" \
  7b30f113a12f476304414e6f49dfaacf82a36d92150b7ac547dd3276a836105e \
  CAS0OPSRAP_20240350000_01D_01D_DCB.BIA \
  c221acee092d7c0c54b5813f6ec20499049808a8ebda47fe2bf3fe4ec4838de9
get "$BKG/mgex/2237/com22370.bia.Z" \
  306de772513d7b84962a724bbfb74798999e257d7f2c4dc05959c37d38d923d4 \
  com22370.bia \
  4858ca378fc30774d4f37e33130ff328a78d9a6e10b3f1872ac9bac64f5cf0a4
