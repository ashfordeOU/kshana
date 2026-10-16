#!/usr/bin/env bash
# SPDX-License-Identifier: AGPL-3.0-only
# Build and run the KF-GINS C++ program (i2Nav-WHU/KF-GINS, GPL-3.0, commit 8291a93e) as a
# separate tool on the dataset fetch.sh wrote, so its output KF_GINS_Navresult.nav lands next to
# the data for bars B4 and B5 (PREREGISTRATION.md). Nothing of KF-GINS is linked or copied.
#   KFGINS=<clone at 8291a93e> bash run_kfgins.sh <dir written by fetch.sh>
set -euo pipefail
DIR="$(cd "${1:?usage: run_kfgins.sh <dir>}" && pwd)"
[ "$(git -C "$KFGINS" rev-parse HEAD)" = 8291a93e49de513fe9d21f819500d39082ded611 ] || { echo "KF-GINS is not 8291a93e"; exit 1; }
if [ ! -x "$KFGINS/bin/KF-GINS" ]; then
  cmake -S "$KFGINS" -B "$KFGINS/build" -DCMAKE_BUILD_TYPE=Release && make -C "$KFGINS/build" -j4
fi
# The dataset's own configuration, with its three paths pointed at <dir>.
sed -e "s#^imupath:.*#imupath: \"$DIR/Leador-A15.txt\"#" \
    -e "s#^gnsspath:.*#gnsspath: \"$DIR/GNSS-RTK.txt\"#" \
    -e "s#^outputpath:.*#outputpath: \"$DIR\"#" "$DIR/kf-gins.yaml" > "$DIR/kf-gins.run.yaml"
"$KFGINS/bin/KF-GINS" "$DIR/kf-gins.run.yaml"
sha256sum "$DIR/KF_GINS_Navresult.nav"
