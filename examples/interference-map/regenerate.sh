#!/usr/bin/env bash
# SPDX-License-Identifier: AGPL-3.0-only
# Rewrites examples/interference-map/output/ from the synthetic inputs in input/.
# tests/interference_map_examples.rs fails if the committed outputs differ from what this
# command produces. Run from the repository root:
#   examples/interference-map/regenerate.sh [path-to-kshana-binary]
set -euo pipefail
K="${1:-target/debug/kshana}"
D=examples/interference-map
ATTR="Synthetic data generated for Kshana documentation. Not real observations."
LIC=(--dataset custom --licence CC0-1.0 --licence-url https://creativecommons.org/publicdomain/zero/1.0/ --attribution "$ATTR")
rm -rf "$D/output"
"$K" interference-map adsb "$D/input/adsb.csv" "${LIC[@]}" --out "$D/output"
"$K" interference-map ais "$D/input/ais.csv" "${LIC[@]}" --land "$D/input/land.geojson" --out "$D/output"
