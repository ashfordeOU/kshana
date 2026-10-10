#!/bin/sh
# SPDX-License-Identifier: AGPL-3.0-only
# Load the plugin into a REAL Signal K server (the pinned signalk-server npm package), feed it synthetic
# data, and record what the server's own REST and WebSocket APIs show.
#
#   integrations/signalk/evidence/run-with-signalk-server.sh <work_dir> <out_dir> [pksht|spawn]
#
# pksht (default): the plugin's `tcp-pksht` source reads synthetic $PKSHT sentences: warn, alarm, clear, stale.
# spawn: needs KSHANA_BIN and KSHANA_DEMO (a directory with session.toml and the demo .nmea). The plugin's
#        `spawn-signalk-nmea` source runs the real kshana on the NMEA the server itself receives.
# The first run installs signalk-server into <work_dir> (needs network, npm). The server and the feed then run
# in a private network namespace with only a loopback interface (unshare -rn), so nothing is reachable from
# outside and nothing leaves. Advisory software, not type-approved equipment.
set -eu
work="$1"; out="$2"; scenario="${3:-pksht}"
here="$(cd "$(dirname "$0")" && pwd)"
plugin="$(cd "$here/.." && pwd)"
SK_VERSION=2.33.0
mkdir -p "$work" "$out"
if [ ! -x "$work/node_modules/.bin/signalk-server" ]; then
  (cd "$work" && npm init -y >/dev/null && npm install --no-audit --no-fund --loglevel=error "signalk-server@$SK_VERSION")
fi
cfg="$work/config-$scenario"
rm -rf "$cfg"; mkdir -p "$cfg/node_modules" "$cfg/plugin-config-data"
ln -s "$plugin" "$cfg/node_modules/signalk-kshana-trust"
if [ "$scenario" = pksht ]; then
  cat > "$cfg/settings.json" <<JSON
{"port":3010,"mdns":false,"interfaces":{"admin-ui":false,"appstore":false,"plugins":true},"pipedProviders":[]}
JSON
  cat > "$cfg/plugin-config-data/kshana-trust.json" <<JSON
{"enabled":true,"configuration":{"source":"tcp-pksht","host":"127.0.0.1","port":10120,"staleAfterS":3}}
JSON
else
  : "${KSHANA_BIN:?set KSHANA_BIN}" "${KSHANA_DEMO:?set KSHANA_DEMO}"
  cat > "$cfg/settings.json" <<JSON
{"port":3010,"mdns":false,"interfaces":{"admin-ui":false,"appstore":false,"plugins":true},"pipedProviders":[{"id":"demo","enabled":true,"pipeElements":[{"type":"providers/simple","options":{"logging":false,"type":"NMEA0183","subOptions":{"type":"tcp","host":"127.0.0.1","port":"10120"}}}]}]}
JSON
  cat > "$cfg/plugin-config-data/kshana-trust.json" <<JSON
{"enabled":true,"configuration":{"source":"spawn-signalk-nmea","command":"$KSHANA_BIN","sessionFile":"$KSHANA_DEMO/session.toml","inputArgs":["--replay"],"staleAfterS":0}}
JSON
fi
# one namespace holds the server, the feed and the driver; only loopback exists in it
unshare -rn sh -c '
  python3 "$1" || { echo "cannot bring loopback up" >&2; exit 1; }
  node "$2/node_modules/.bin/signalk-server" -c "$3" >"$4/$5-server.log" 2>&1 &
  srv=$!
  node "$6/driver.mjs" "$5" "$4" "$2" "$7" "$8"
  rc=$?
  kill $srv 2>/dev/null
  exit $rc
' sh "$here/lo-up.py" "$work" "$cfg" "$out" "$scenario" "$here" "${KSHANA_BIN:-}" "${KSHANA_DEMO:-}"
