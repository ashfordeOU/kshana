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
for b in kshana stty; do printf '#!/bin/sh\nexit 0\n' > "$tmp/bin/$b"; chmod +x "$tmp/bin/$b"; done
: > "$tmp/etc/session.toml"; : > "$tmp/etc/relay.mjs"
fail=0
for u in "$here"/systemd/*.service; do
  n="$(basename "$u")"
  sed -e "s#/usr/local/bin/kshana#$tmp/bin/kshana#g" \
      -e "s#/bin/stty#$tmp/bin/stty#g" \
      -e "s#/etc/kshana/session.toml#$tmp/etc/session.toml#g" "$u" > "$tmp/$n"
  # every finding fails: syntax, unknown keys, bad values, dependencies. Nothing is filtered out.
  out="$(systemd-analyze verify "$tmp/$n" 2>&1 || true)"
  if [ -n "$out" ]; then echo "FAIL $n"; printf '%s\n' "$out"; fail=1; else echo "ok   $n"; fi
  # guards that verify cannot give: no shell in ExecStart (a pipeline under /bin/sh is dash on Debian, where
  # `set -o pipefail` aborts), the restart policy, and the sandbox keys
  if grep -E '^ExecStart(Pre)?=.*(/bin/)?(ba)?sh( |$)' "$u" >/dev/null; then echo "FAIL $n: ExecStart runs a shell"; fail=1; fi
  grep -q '^Restart=always' "$u" || { echo "FAIL $n: Restart=always missing"; fail=1; }
  for k in NoNewPrivileges ProtectSystem ProtectKernelTunables ProtectKernelModules ProtectKernelLogs ProtectControlGroups \
           ProtectHostname ProtectProc RestrictNamespaces RestrictRealtime RestrictSUIDSGID LockPersonality \
           MemoryDenyWriteExecute SystemCallArchitectures UMask; do
    grep -q "^$k=" "$u" || { echo "FAIL $n: $k= missing"; fail=1; }
  done
  grep -q '^PrivateNetwork=yes' "$u" || grep -q '^IPAddressDeny=any' "$u" || { echo "FAIL $n: no network restriction"; fail=1; }
done
exit $fail
