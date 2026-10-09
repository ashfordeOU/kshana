#!/bin/sh
# Dry-run check of the systemd units: `systemd-analyze verify` on copies whose absolute binary
# paths point at stubs in a temp directory (the real binaries are not needed). Touches nothing
# outside the temp directory and starts no service. CI-safe, no network.
set -eu
here="$(cd "$(dirname "$0")" && pwd)"
command -v systemd-analyze >/dev/null || { echo "FAIL: systemd-analyze not found" >&2; exit 2; }
tmp="$(mktemp -d)"
trap 'rm -rf "$tmp"' EXIT
mkdir -p "$tmp/bin" "$tmp/etc"
for b in kshana node stty sh; do printf '#!/bin/sh\nexit 0\n' > "$tmp/bin/$b"; chmod +x "$tmp/bin/$b"; done
: > "$tmp/etc/session.toml"; : > "$tmp/etc/relay.mjs"
fail=0
for u in "$here"/systemd/*.service; do
  n="$(basename "$u")"
  sed -e "s#/usr/local/bin/kshana#$tmp/bin/kshana#g" \
      -e "s#/usr/bin/node#$tmp/bin/node#g" \
      -e "s#/bin/stty#$tmp/bin/stty#g" \
      -e "s#ExecStart=/bin/sh#ExecStart=$tmp/bin/sh#" \
      -e "s#/opt/kshana/nmea-tcp-relay.mjs#$tmp/etc/relay.mjs#g" \
      -e "s#/etc/kshana/session.toml#$tmp/etc/session.toml#g" "$u" > "$tmp/$n"
  # the unit's user, group and serial device do not exist on a CI machine: those are the only
  # findings tolerated, everything else (syntax, unknown keys, bad values, dependencies) fails.
  out="$(systemd-analyze verify "$tmp/$n" 2>&1 || true)"
  bad="$(printf '%s\n' "$out" | grep -v -i -E "user .*kshana|group .*kshana|dialout|ttyGNSS|Unit .* is not loaded|^$" || true)"
  if [ -n "$bad" ]; then echo "FAIL $n"; printf '%s\n' "$bad"; fail=1; else echo "ok   $n"; fi
done
exit $fail
