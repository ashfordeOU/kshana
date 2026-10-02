#!/bin/sh
# SPDX-License-Identifier: AGPL-3.0-only
# Regenerate site_speed_true_pole_orekit.txt (round 2, third step): run LaunchOrekitDriver in its
# "site-speed" mode with an Orekit data directory whose only Earth-orientation file is the frozen
# 2026-09-30 IERS finals2000A.all. Needs the oracle toolchain (source ~/Code/kshana-oracles/env.sh)
# and a JDK 17+. FINALS may point at the frozen file (default: the oracle datasets copy).
set -eu
here=$(cd "$(dirname "$0")" && pwd)
root=$(cd "$here/../../.." && pwd)
build=${BUILD_DIR:-"$root/target/launch-orekit-driver"}
finals=${FINALS:-"$HOME/Code/kshana-oracles/data/iers/finals2000A.all"}
echo "cc80680ec05c91b65e7d02c6068fe0d44dd0998dc880551975092d2d14aa8e18  $finals" | sha256sum -c -
data=$(mktemp -d)
for d in "$OREKIT_DATA"/*; do
  case "$(basename "$d")" in
    Earth-Orientation-Parameters) ;;
    *) ln -s "$d" "$data/$(basename "$d")" ;;
  esac
done
mkdir -p "$data/Earth-Orientation-Parameters/IAU-2000"
cp "$finals" "$data/Earth-Orientation-Parameters/IAU-2000/finals2000A.all"
mkdir -p "$build"
javac -cp "$OREKIT_CP" -d "$build" "$here/LaunchOrekitDriver.java"
OREKIT_DATA="$data" java -cp "$build:$OREKIT_CP" LaunchOrekitDriver site-speed > "$here/site_speed_true_pole_orekit.txt"
rm -rf "$data"
