#!/bin/sh
# SPDX-License-Identifier: AGPL-3.0-only
# Container entrypoint: runs the Kshana trust GATE, serving the gated NMEA stream (with $PKSHT) over TCP.
# Advisory software, not type-approved equipment: the operator stays responsible for navigation.
#
#   KSHANA_INPUT    where the receiver's NMEA comes from (default: stdin)
#                     stdin             read standard input (docker run -i ... < a serial device or a pipe)
#                     tcp:<host>:<port> connect to a TCP source (a serial-to-network bridge, a multiplexer)
#                     udp:<port>        listen for UDP datagrams
#                     file:<path>       read a file (a log; add KSHANA_REPLAY=1 for a stored log)
#   KSHANA_SESSION  session file with the vessel's limits (default /etc/kshana/session.toml)
#   KSHANA_LISTEN   where the gated stream is served inside the container (default tcp:0.0.0.0:10110).
#                   Publish the port to loopback on the host: -p 127.0.0.1:10110:10110
#   KSHANA_REPLAY   set to 1 for a stored log fed faster than real time
# Extra arguments are passed to kshana unchanged. The JSON epochs go to /var/lib/kshana/trust.jsonl.
set -eu
input="${KSHANA_INPUT:-stdin}"
session="${KSHANA_SESSION:-/etc/kshana/session.toml}"
listen="${KSHANA_LISTEN:-tcp:0.0.0.0:10110}"
bin="${KSHANA_BIN:-kshana}"
json="${KSHANA_JSON:-/var/lib/kshana/trust.jsonl}"
case "$input" in
  stdin) set -- "$@" ;;
  tcp:*:*) set -- --tcp "${input#tcp:}" "$@" ;;
  udp:*) set -- --udp "${input#udp:}" "$@" ;;
  file:*) set -- --file "${input#file:}" "$@" ;;
  *) echo "kshana entrypoint: KSHANA_INPUT must be stdin, tcp:<host>:<port>, udp:<port> or file:<path> (got '$input')" >&2; exit 2 ;;
esac
if [ "${KSHANA_REPLAY:-0}" = 1 ]; then set -- --replay "$@"; fi
exec "$bin" receiver-trust live "$session" "$@" --gate --listen "$listen" --json "$json"
