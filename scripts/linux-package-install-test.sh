#!/bin/sh
# SPDX-License-Identifier: AGPL-3.0-only
# Install a Kshana Desktop Linux package on a clean distribution and check that it starts (0.42 Q2).
#
#   scripts/linux-package-install-test.sh [--raspberry-pi-archive] <package.deb | package.rpm>
#
# --raspberry-pi-archive (Debian containers only) first adds the Raspberry Pi archive
# (archive.raspberrypi.com, the suite of the container's Debian release) the way Raspberry Pi
# OS has it, so the package's dependencies resolve against Raspberry Pi OS's package set. In a
# Debian trixie arm64 container that is the Raspberry Pi OS (64-bit) userland; the kernel,
# firmware and GPU driver of a real Raspberry Pi are not part of the test.
#
# Run as root inside a fresh container of the distribution under test (Ubuntu, Debian or
# Raspberry Pi OS with apt; Fedora with dnf). .github/workflows/linux-packages.yml runs it in
# ubuntu:22.04, ubuntu:24.04, fedora and a Raspberry Pi OS (arm64) container. It:
#   1. installs the package with the distribution's own package manager, so every declared
#      dependency is resolved from the distribution's archive (nothing is preinstalled);
#   2. checks the installed files: one executable in /usr/bin, the .desktop entry, the icons;
#   3. checks that the dynamic loader finds every shared library the executable needs;
#   4. starts the application on a virtual X display and requires its window (titled with the
#      .desktop entry's Name) to be mapped and the process to be still running at the end of
#      the wait (a missing library, a GTK or WebKit start-up failure or a panic ends it
#      first), then stops it;
#   5. removes the package and checks the executable is gone.
# Exit status 0 only when every step passes. POSIX sh: the containers have no bash by default.
set -eu

pi_archive=0
if [ "${1:-}" = "--raspberry-pi-archive" ]; then pi_archive=1; shift; fi
pkg="${1:?usage: linux-package-install-test.sh [--raspberry-pi-archive] <package.deb|package.rpm>}"
wait_s="${KSHANA_START_WAIT_S:-20}"
[ -f "$pkg" ] || { echo "no such package: $pkg" >&2; exit 2; }
[ "$(id -u)" = 0 ] || { echo "run as root (inside the test container)" >&2; exit 2; }

say() { printf '\n== %s\n' "$*"; }
fail() { printf 'FAIL: %s\n' "$*" >&2; exit 1; }

. /etc/os-release
say "distribution: ${PRETTY_NAME:-unknown} ($(uname -m))"

case "$pkg" in
  *.deb)
    command -v apt-get >/dev/null || fail "a .deb needs apt-get"
    export DEBIAN_FRONTEND=noninteractive
    apt-get update -qq
    if [ "$pi_archive" = 1 ]; then
      [ "${ID:-}" = debian ] || fail "--raspberry-pi-archive needs a Debian container"
      say "add the Raspberry Pi archive (${VERSION_CODENAME})"
      apt-get install -y -qq --no-install-recommends ca-certificates curl >/dev/null
      # The archive's own keyring package, pinned by SHA-256 (Raspberry Pi OS installs the same file).
      kr=raspberrypi-archive-keyring_2025.1+rpt1_all.deb
      curl -fsSL "https://archive.raspberrypi.com/debian/pool/main/r/raspberrypi-archive-keyring/$kr" -o "/tmp/$kr"
      echo "2e727149d7acb8cc7f604e66d0049161039c8aa1eaf1175e54f9e69d963d60e4  /tmp/$kr" | sha256sum -c -
      dpkg -i "/tmp/$kr" >/dev/null
      echo "deb [signed-by=/usr/share/keyrings/raspberrypi-archive-keyring.pgp] https://archive.raspberrypi.com/debian/ ${VERSION_CODENAME} main" \
        >/etc/apt/sources.list.d/raspi.list
      apt-get update -qq
      apt-get upgrade -y -qq >/dev/null
    fi
    say "install $pkg with apt (dependencies from the archive)"
    # apt installs a local file when the path has a slash.
    case "$pkg" in /*|./*) local_pkg="$pkg" ;; *) local_pkg="./$pkg" ;; esac
    apt-get install -y -qq --no-install-recommends "$local_pkg"
    name="$(dpkg-deb -f "$pkg" Package)"
    files="$(dpkg -L "$name")"
    say "start-up tools"
    apt-get install -y -qq --no-install-recommends xvfb xauth x11-utils dbus dbus-x11 procps >/dev/null
    remove() { apt-get remove -y -qq "$name" >/dev/null; }
    ;;
  *.rpm)
    command -v dnf >/dev/null || fail "an .rpm needs dnf"
    say "install $pkg with dnf (dependencies from the repositories)"
    dnf install -y -q "$pkg"
    name="$(rpm -qp --qf '%{NAME}' "$pkg")"
    files="$(rpm -ql "$name")"
    say "start-up tools"
    dnf install -y -q xorg-x11-server-Xvfb xorg-x11-xauth xwininfo dbus-daemon dbus-x11 procps-ng which >/dev/null
    command -v xvfb-run >/dev/null || dnf install -y -q /usr/bin/xvfb-run >/dev/null
    remove() { dnf remove -y -q "$name" >/dev/null; }
    ;;
  *) fail "not a .deb or .rpm: $pkg" ;;
esac

say "installed files of $name"
printf '%s\n' "$files" | grep -E '^/usr/(bin|share/applications|share/icons)/' || true
bins="$(printf '%s\n' "$files" | grep -E '^/usr/bin/[^/]+$' || true)"
[ "$(printf '%s\n' "$bins" | grep -c .)" = 1 ] || fail "expected exactly one executable in /usr/bin, got: $bins"
bin="$bins"
[ -x "$bin" ] || fail "$bin is not executable"
printf '%s\n' "$files" | grep -qE '^/usr/share/applications/.+\.desktop$' || fail "no .desktop entry"
printf '%s\n' "$files" | grep -qE '^/usr/share/icons/hicolor/.+\.png$' || fail "no icon"
desktop="$(printf '%s\n' "$files" | grep -E '^/usr/share/applications/.+\.desktop$' | head -n 1)"
grep -q '^Exec=' "$desktop" || fail "$desktop has no Exec line"

say "shared libraries of $bin"
missing="$(ldd "$bin" | grep 'not found' || true)"
[ -z "$missing" ] || fail "libraries not found: $missing"
echo "all found ($(ldd "$bin" | grep -c '=>') resolved)"

title="$(sed -n 's/^Name=//p' "$desktop" | head -n 1)"
[ -n "$title" ] || fail "$desktop has no Name line"
say "start $bin on a virtual display (window \"$title\" mapped and still running after ${wait_s} s)"
log="$(mktemp)"
probe="$(mktemp)"
# Runs inside the virtual display: start the application, then for wait_s seconds check once a
# second that it is alive and whether a window with its title is mapped.
cat >"$probe" <<'PROBE'
"$KT_BIN" >"$KT_LOG" 2>&1 &
pid=$!
seen=0
i=0
while [ "$i" -lt "$KT_WAIT" ]; do
  sleep 1
  i=$((i + 1))
  kill -0 "$pid" 2>/dev/null || { echo "the application ended after ${i} s"; exit 3; }
  if xwininfo -root -tree 2>/dev/null | grep -qF "\"$KT_TITLE\""; then
    [ "$seen" = 1 ] || echo "window \"$KT_TITLE\" mapped after ${i} s"
    seen=1
  fi
done
kill "$pid" 2>/dev/null || true
[ "$seen" = 1 ] || { echo "no window titled \"$KT_TITLE\" in ${KT_WAIT} s"; exit 4; }
exit 0
PROBE
# A container has no user namespaces for WebKit's bubblewrap sandbox; it is turned off for
# this start-up check only (it is on, as WebKit ships it, on a user's machine).
export WEBKIT_DISABLE_SANDBOX_THIS_IS_DANGEROUS=1
export NO_AT_BRIDGE=1
export HOME="${HOME:-/root}"
mkdir -p "$HOME"
export KT_BIN="$bin" KT_LOG="$log" KT_WAIT="$wait_s" KT_TITLE="$title"
status=0
timeout --kill-after=10 "$((wait_s + 60))" \
  dbus-run-session -- xvfb-run -a -s '-screen 0 1440x900x24' sh "$probe" || status=$?
echo "--- application output (last 40 lines)"
tail -n 40 "$log" || true
echo "---"
[ "$status" = 0 ] || fail "start-up check failed (status $status)"
if grep -qi 'panicked' "$log"; then fail "the application panicked"; fi
echo "start-up OK"

say "remove $name"
remove
[ ! -e "$bin" ] || fail "$bin is still there after removal"
say "PASS: $name on ${PRETTY_NAME:-unknown} ($(uname -m))"
