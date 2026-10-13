#!/usr/bin/env bash
# SPDX-License-Identifier: AGPL-3.0-only
# Download the KF-GINS demo dataset (i2Nav-WHU/KF-GINS, commit 8291a93e, dataset/) into <dir>
# and check the SHA-256 values pinned in PREREGISTRATION.md. The data carry no stated licence,
# so they are not vendored. Then:  KSHANA_KFGINS_DIR=<dir> cargo test --release --test fusion_kfgins_dataset_oracle
set -euo pipefail
OUT="${1:?usage: fetch.sh <dir>}"; mkdir -p "$OUT"
BASE="https://raw.githubusercontent.com/i2Nav-WHU/KF-GINS/8291a93e/dataset"
while read -r sha name; do
  [ -s "$OUT/$name" ] || curl -fsSL -o "$OUT/$name" "$BASE/$name"
  echo "$sha  $OUT/$name" | sha256sum -c -
done <<'PINS'
3c1ecf6d03121d695f59ea8383af5ec4233ef9ff1c33939b7c42caa609a94521 GNSS-RTK.txt
47d3d5136dc9494a2eb12bbf1c3206ab02b8e19cacad9eabab3eb8b700f93b78 Leador-A15.txt
47d2b7b888cf01e9f0e04f47901d7851cee1b92abe114b5b61eea8e66a47e1e0 kf-gins.yaml
25582530dbeac47e014e350d53dae984fe53ffc47b2304d893a243c885c96012 truth.nav
PINS
