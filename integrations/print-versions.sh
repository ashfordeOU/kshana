#!/bin/sh
# SPDX-License-Identifier: AGPL-3.0-only
# Prints the version of every shippable under integrations/ (one `name=version` per line), each read from the
# single file that owns it, so a version-sync check can compare them with the engine's:
#   signalk-plugin        integrations/signalk/package.json
#   opencpn-relay         integrations/opencpn/package.json
#   opencpn-plugin        integrations/opencpn/plugin/CMakeLists.txt  (project(... VERSION x.y.z))
set -eu
here="$(cd "$(dirname "$0")" && pwd)"
js() { sed -n 's/^ *"version": *"\([^"]*\)".*/\1/p' "$1" | head -1; }
echo "signalk-plugin=$(js "$here/signalk/package.json")"
echo "opencpn-relay=$(js "$here/opencpn/package.json")"
echo "opencpn-plugin=$(sed -n 's/^project([a-z_]* VERSION \([0-9.]*\).*/\1/p' "$here/opencpn/plugin/CMakeLists.txt" | head -1)"
