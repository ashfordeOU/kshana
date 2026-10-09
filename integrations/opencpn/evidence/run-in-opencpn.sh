#!/bin/sh
# Run the plugin inside a real OpenCPN under a virtual display and capture screenshots and the log
# lines the plugin writes. Needs: opencpn (tested with the Ubuntu 24.04 package, 5.8.4), xvfb, xdotool,
# scrot, node, and a built libkshana_pi.so. Everything lives in a fresh temporary HOME; nothing on the
# machine is changed. Screen coordinates are for a 1280x800 display and OpenCPN's first-run dialog.
#
#   integrations/opencpn/evidence/run-in-opencpn.sh <path/to/libkshana_pi.so> <out_dir>
#
# Two ways to feed OpenCPN. By default the recorded gated excerpt is served by the relay (no kshana needed).
# With KSHANA_BIN and KSHANA_DEMO (a directory with session.toml and the demo .nmea) set, a real
# `kshana receiver-trust live --gate --listen tcp:10110` serves the gated stream itself, the recommended setup.
#
# Advisory software, not type-approved equipment. Nothing here transmits.
set -eu
lib="$1"; out="$2"
here="$(cd "$(dirname "$0")" && pwd)"
stream="$here/../test/fixtures/gated-excerpt.nmea"
mkdir -p "$out"
home="$(mktemp -d)"
export HOME="$home" DISPLAY=:98
Xvfb :98 -screen 0 1280x800x24 >/dev/null 2>&1 & xvfb=$!
trap 'kill $xvfb $ocpn $feed 2>/dev/null || true; rm -rf "$home"' EXIT
sleep 2
# first run once so OpenCPN writes its configuration, then add a TCP input and enable the plugin
ocpn=0; feed=0
timeout -s KILL 15 opencpn >/dev/null 2>&1 || true
conf="$home/.opencpn/opencpn.conf"
sed -i 's#^DataConnections=#DataConnections=1;0;127.0.0.1;10110;0;;4800;1;0;1;;1;;0;0;0;0;1;kshana;0;;0;0;#' "$conf"
sed -i 's#^\[PlugIns\]#[PlugIns]\n[PlugIns/libkshana_pi.so]\nbEnabled=1#' "$conf"
mkdir -p "$home/.local/lib/opencpn" && cp "$lib" "$home/.local/lib/opencpn/"
rm -f "$home/.opencpn/_OpenCPN_SILock"
if [ -n "${KSHANA_BIN:-}" ] && [ -n "${KSHANA_DEMO:-}" ]; then
  nmea="$(ls "$KSHANA_DEMO"/*.nmea | head -1)"
  node "$here/feeder-direct.mjs" "$KSHANA_BIN" "$KSHANA_DEMO/session.toml" "$nmea" "$home/go" 1600 1000 10110 >"$out/feeder.log" 2>&1 & feed=$!
  mode=direct
else
  node "$here/feeder.mjs" "$stream" 1000 10110 >"$out/feeder.log" 2>&1 & feed=$!
  mode=relay
fi
opencpn >"$out/opencpn.stdout" 2>&1 & ocpn=$!
sleep 12
# the killed first run makes OpenCPN ask about safe mode: answer No, then OK on the welcome dialog
xdotool mousemove 594 480 click 1
sleep 12
xdotool mousemove 815 566 click 1
if [ "$mode" = direct ]; then
  until grep -q "connection established" "$home/.opencpn/opencpn.log" 2>/dev/null; do sleep 1; done
  touch "$home/go"
  until grep -q "^paced" "$out/feeder.log"; do sleep 1; done
else
  until grep -q "client connected" "$out/feeder.log"; do sleep 1; done
fi
sleep 2;  scrot -o "$out/1-early.png"
until grep -q "^done" "$out/feeder.log"; do sleep 1; done
sleep 1;  scrot -o "$out/2-after-collapse.png"
grep "kshana_pi" "$home/.opencpn/opencpn.log" | sed 's/^[^ ]* //' > "$out/plugin-log.txt"
cat "$out/plugin-log.txt"
