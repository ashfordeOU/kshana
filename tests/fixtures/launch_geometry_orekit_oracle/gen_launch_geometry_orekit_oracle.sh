#!/bin/sh
# SPDX-License-Identifier: AGPL-3.0-only
# Regenerate launch_geometry_orekit_oracle.txt: dump Kshana's azimuths, feed them to the Orekit
# 12.2 driver. Needs the oracle toolchain (source ~/Code/kshana-oracles/env.sh first) and a JDK 17+.
set -eu
here=$(cd "$(dirname "$0")" && pwd)
root=$(cd "$here/../../.." && pwd)
build=${BUILD_DIR:-"$root/target/launch-orekit-driver"}
mkdir -p "$build"
javac -cp "$OREKIT_CP" -d "$build" "$here/LaunchOrekitDriver.java"
cd "$root"
cargo test --test launch_geometry_orekit_oracle dump_kshana_launch_azimuths -- --ignored --nocapture --test-threads=1 2>/dev/null \
  | grep -o 'INCREQ .*' \
  | java -cp "$build:$OREKIT_CP" LaunchOrekitDriver > "$here/launch_geometry_orekit_oracle.txt"
