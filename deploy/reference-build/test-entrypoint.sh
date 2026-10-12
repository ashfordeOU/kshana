#!/bin/sh
# SPDX-License-Identifier: AGPL-3.0-only
# CI-safe test of docker-entrypoint.sh: a stub `kshana` records its arguments, so no build, no Docker, no network.
set -eu
here="$(cd "$(dirname "$0")" && pwd)"
tmp="$(mktemp -d)"
trap 'rm -rf "$tmp"' EXIT
printf '#!/bin/sh\necho "$@" > "%s/args"\n' "$tmp" > "$tmp/kshana"; chmod +x "$tmp/kshana"
run() { rm -f "$tmp/args"; env -i PATH="$PATH" KSHANA_BIN="$tmp/kshana" "$@" "$here/docker-entrypoint.sh" ${EXTRA:-}; cat "$tmp/args"; }
check() { [ "$1" = "$2" ] || { echo "FAIL: expected '$2', got '$1'" >&2; exit 1; }; }
tail=" --gate --listen tcp:0.0.0.0:10110 --json /var/lib/kshana/trust.jsonl"
s="receiver-trust live /etc/kshana/session.toml"
check "$(run)" "$s$tail"
check "$(run KSHANA_INPUT=tcp:192.0.2.10:10110)" "$s --tcp 192.0.2.10:10110$tail"
check "$(run KSHANA_INPUT=udp:10110)" "$s --udp 10110$tail"
check "$(run KSHANA_INPUT=file:/data/log.nmea KSHANA_REPLAY=1)" "$s --replay --file /data/log.nmea$tail"
check "$(run KSHANA_INPUT=tcp:h:1 KSHANA_LISTEN=tcp:127.0.0.1:9 KSHANA_SESSION=/s.toml)" "receiver-trust live /s.toml --tcp h:1 --gate --listen tcp:127.0.0.1:9 --json /var/lib/kshana/trust.jsonl"
if env -i PATH="$PATH" KSHANA_BIN="$tmp/kshana" KSHANA_INPUT=bogus "$here/docker-entrypoint.sh" 2>/dev/null; then echo "FAIL: bad input accepted" >&2; exit 1; fi
echo "ok   docker-entrypoint.sh"
