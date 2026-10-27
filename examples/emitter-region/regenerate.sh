#!/bin/sh
# Regenerate examples/emitter-region/output from input/ with a built kshana binary.
#   examples/emitter-region/regenerate.sh [path/to/kshana]
set -eu
HERE=$(cd "$(dirname "$0")" && pwd)
BIN=${1:-kshana}
rm -f "$HERE"/output/emitter-adsb-custom-*
"$BIN" interference-map locate "$HERE/input/adsb-synthetic.csv" --source adsb --dataset custom \
  --licence CC0-1.0 --licence-url https://creativecommons.org/publicdomain/zero/1.0/ \
  --attribution "Synthetic data made up for this example; not a measurement" --out "$HERE/output"
