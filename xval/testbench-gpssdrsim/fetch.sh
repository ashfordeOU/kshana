#!/usr/bin/env bash
# SPDX-License-Identifier: AGPL-3.0-only
# Clone gps-sdr-sim (MIT) at the registered commit into $1 (default ./gps-sdr-sim-src, outside
# git's tracking via .gitignore). Nothing from it is vendored into this repository.
set -euo pipefail
DEST="${1:-$(dirname "$0")/gps-sdr-sim-src}"
COMMIT=28ca29a6719475195e3aabd5930c4ed02d67190f
if [ ! -d "$DEST/.git" ]; then
  git clone -q https://github.com/osqzss/gps-sdr-sim.git "$DEST"
fi
git -C "$DEST" checkout -q "$COMMIT"
test "$(git -C "$DEST" rev-parse HEAD)" = "$COMMIT"
echo "gps-sdr-sim at $COMMIT in $DEST"
