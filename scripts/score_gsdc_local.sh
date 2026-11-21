#!/usr/bin/env bash
# SPDX-License-Identifier: AGPL-3.0-only
#
# Score the kshana-bench task (g) baselines on a local copy of the Google Smartphone Decimeter
# Challenge 2023 data, which you download yourself from Kaggle under its competition rules.
# Nothing is downloaded here and nothing of the data is copied into the repository.
#
#   scripts/score_gsdc_local.sh <GSDC train dir> <output dir outside the repository> [kshana binary]
#
# <GSDC train dir> is the directory holding <drive>/<phone>/ground_truth.csv (and the phone
# logs), as the competition's `train` folder is laid out. For each public split (dev, test)
# it writes the truth file, the baseline predictions and results, validates the results and
# prints their citation ids. The holdout traces of the public split rule are public too (spec
# section 4); a private holdout is scored with `kshana bench holdout score` instead.
set -euo pipefail
data="${1:?usage: score_gsdc_local.sh <GSDC train dir> <output dir> [kshana binary]}"
out="${2:?usage: score_gsdc_local.sh <GSDC train dir> <output dir> [kshana binary]}"
kshana="${3:-kshana}"
[ -d "$data" ] || { echo "not a directory: $data" >&2; exit 2; }
mkdir -p "$out"
here="$(cd "$(dirname "$0")/.." && pwd)"
case "$(cd "$out" && pwd)/" in
  "$here"/*) echo "refusing to write GSDC-derived files inside the repository: $out" >&2; exit 2 ;;
esac
for split in dev test; do
  "$kshana" bench truth --task g --data "$data" --split "$split" --out "$out/g-$split.truth.json"
  "$kshana" bench baseline --task g --split "$split" --data "$data" --out "$out/$split"
done
"$kshana" bench validate "$out"/*/*.result.json
"$kshana" bench cite "$out"/*/*.result.json
