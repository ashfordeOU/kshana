#!/bin/sh
# SPDX-License-Identifier: AGPL-3.0-only
# Run the Kshana Connect conformance kit v2 offline (roadmap 0.42 I12). Everything it reads is in this
# folder and the checkout's examples/ and tests/fixtures/; the live paths use loopback servers inside the
# kshana process. Nothing is fetched.
#
#   conformance/run-kit.sh [path/to/kshana]      # default: kshana on PATH
#
# Exit 0 when every vector passes on every path; 1 otherwise. conformance/kit.toml lists what is covered.
set -eu
KSHANA="${1:-kshana}"
DIR="$(cd "$(dirname "$0")" && pwd)"
cd "$DIR/.."
export KSHANA_LANG=en
echo "== kshana connect check (readers, decoders, exports, mappings)"
"$KSHANA" connect check "$DIR/connect"
echo "== kshana connect check-live (mappings over MQTT, WebSocket and the directory watch)"
"$KSHANA" connect check-live "$DIR/connect"
echo "== kshana connect timing check (timing parsers)"
"$KSHANA" connect timing check "$DIR/timing"
echo "kit v2: every vector passed"
