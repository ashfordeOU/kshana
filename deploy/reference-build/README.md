# Reference build: a trust monitor on a boat

A small, generic computer next to the GNSS receiver you already have, running `kshana receiver-trust live`,
publishing the trust score to Signal K and (opt-in) to OpenCPN. Nothing here transmits, and nothing here
replaces a receiver or approved navigation equipment.

> **Advisory software.** Kshana is not type-approved navigation equipment (IEC 61108, IEC 61162) and has not
> been assessed against any performance standard. The score and the gate are aids to the navigator's judgement.
> The operator stays responsible for the safe navigation of the vessel. This build has not been tested on
> a vessel by the project; treat it as a starting point and test it at the dock first.

## Parts (generic, no endorsement)

| Part | Needs | Notes |
|---|---|---|
| Single-board computer | 64-bit ARM or x86, 2 GB RAM or more, wired Ethernet, a USB host | The monitor does little work per epoch (not benchmarked on any particular board). Prefer a board that boots from an SSD or industrial-grade card, not a consumer card |
| Storage | 16 GB or more, rated for continuous writes | The monitor appends one JSON line per epoch to `trust.jsonl`: about 380 bytes a line on the synthetic demo (about 33 MB a day at 1 Hz; real lines vary with the number of deductions). Rotate it: `logrotate/kshana-trust` |
| GNSS receiver | A multi-band, multi-constellation receiver that outputs NMEA 0183 (GGA, RMC, VTG and ideally GSV, a heading and a speed log on the bus) over USB or UART | The receiver is whatever you already trust for navigation. More independent sensors on the bus (a gyro or compass heading, a speed log) means more checks |
| Antenna | An active multi-band antenna with a clear sky view | Not the same antenna feeding the navigation receiver, if you can avoid it, so a failure of one does not take both |
| Power | A fused supply sized for the board, from a filtered 12 V or 24 V rail | Plan for clean shutdown on power loss |
| Network | A switch or router on the boat LAN | Signal K, OpenCPN and the monitor talk over TCP on the LAN |

What this build can and cannot see is in [`docs/MARITIME-TRUST.md`](../../docs/MARITIME-TRUST.md). A receiver that is already
being spoofed when the monitor starts has no clean baseline: start the monitor before the voyage.

## OS setup (Debian-family Linux)

```sh
sudo apt update && sudo apt install -y nodejs        # node 18 or newer, for the Signal K plugin 
sudo useradd --system --create-home --home-dir /var/lib/kshana kshana
sudo usermod -aG dialout kshana                      # serial port access
sudo install -m 0755 kshana /usr/local/bin/kshana    # a release binary, or: cargo install --locked --path .
sudo install -d /etc/kshana
sudo install -m 0644 session.toml /etc/kshana/       # start from examples/maritime-trust/session.toml
```

Edit `/etc/kshana/session.toml`: the `[platform]` table states the vessel's limits (maximum speed, acceleration and
turn rate, antenna height, whether a heading sensor is on the bus). Every threshold and score weight is in that file
and in [`RECEIVER-TRUST.md`](../../docs/RECEIVER-TRUST.md).

Give the receiver a stable name with a udev rule, matching your adapter's vendor and product ids:

```
# /etc/udev/rules.d/99-gnss.rules
SUBSYSTEM=="tty", ATTRS{idVendor}=="XXXX", ATTRS{idProduct}=="YYYY", SYMLINK+="ttyGNSS", GROUP="dialout", MODE="0660"
```

## systemd

Two units in [`systemd/`](systemd/); enable **one** of them per serial port.

* `kshana-trust.service`: the advisory monitor. Reads the receiver and writes one JSON line per epoch to
  `/var/lib/kshana/trust.jsonl` (not to the journal: with `--json <path>` the epochs go to the file; the journal carries
  only start-up and error messages). The NMEA stream is untouched, and the unit has no network (`PrivateNetwork=yes`),
  so it feeds nothing live: it is for logging and for evidence.
* `kshana-gate.service`: opt-in. Reads the receiver, forwards the NMEA stream with the fix marked invalid while
  trust is collapsed and a `$PKSHT` per cycle, and serves it itself (`--listen tcp:10110`, loopback) for OpenCPN: no relay is needed. Read "Gate mode" in
  [`MARITIME-TRUST.md`](../../docs/MARITIME-TRUST.md) first.

```sh
sudo install -m 0644 systemd/kshana-trust.service /etc/systemd/system/
sudo systemctl daemon-reload && sudo systemctl enable --now kshana-trust
sudo install -m 0644 logrotate/kshana-trust /etc/logrotate.d/kshana-trust
journalctl -u kshana-trust -f        # start-up and errors
tail -f /var/lib/kshana/trust.jsonl  # the epochs
```

Both units restart whatever the exit status (`Restart=always`): the monitor exits cleanly when its input ends, for example when a
serial adapter is re-plugged, and the gate is a single point in the chain. Both run sandboxed (no new privileges, read-only
system, no kernel tunables, namespaces or real-time scheduling, no writable-executable memory; the gate may use loopback only
unless you edit `IPAddressAllow=`).

The serial speed in `ExecStartPre` and the `/dev/ttyGNSS` name are the two things to adjust. The gate unit needs a `kshana` with `--listen`
(0.35 or newer). The Node relay in `integrations/opencpn/` is only for older builds or special setups.

Dry-run check (no service is started, nothing outside a temp directory is touched; needs `systemd-analyze`):

```sh
deploy/reference-build/check-units.sh
```

## Container option

The image runs the **gate** (the opt-in service above) with its input and session taken from environment variables; the gated
stream is served on port 10110 inside the container. Read "Gate mode" in [`MARITIME-TRUST.md`](../../docs/MARITIME-TRUST.md) first.

```sh
docker build -f deploy/reference-build/Dockerfile -t kshana-trust-gate .
cp examples/maritime-trust/session.toml deploy/reference-build/session.toml    # then edit [platform]
# edit KSHANA_INPUT in docker-compose.yml, then:
docker compose -f deploy/reference-build/docker-compose.yml up -d
```

| Variable | Default | Meaning |
|---|---|---|
| `KSHANA_INPUT` | `stdin` | `stdin` (`docker run -i ... < device`), `tcp:<host>:<port>`, `udp:<port>` or `file:<path>` |
| `KSHANA_SESSION` | `/etc/kshana/session.toml` | the vessel's limits, thresholds and score weights |
| `KSHANA_LISTEN` | `tcp:0.0.0.0:10110` | where the gated stream is served inside the container |
| `KSHANA_REPLAY` | unset | `1` for a stored log fed faster than real time |

**Publish the port to loopback on the host** (`-p 127.0.0.1:10110:10110`, as the compose file does): anyone who can reach the
port can read the stream, and the container listens on all its own addresses. OpenCPN then connects to `127.0.0.1:10110`. A
serial receiver is best bridged to TCP on the host (a serial-to-network bridge, or `stty` plus a pipe); the image does not open
serial ports itself. The image carries its version in the `org.opencontainers.image.version` label. The Dockerfile and compose
file are not built by the project's CI (no container build is run there); `test-entrypoint.sh` checks the entrypoint's argument
handling without Docker.

## Signal K wiring

1. Receiver NMEA reaches Signal K as it does today (a serial or TCP data connection).
2. The monitor reads the same receiver, in one of three ways:
   * the plugin runs it for you: source `spawn-signalk-nmea` feeds the server's own NMEA input to `kshana receiver-trust live`.
     **Use this only on a server with a single NMEA source.** It feeds every NMEA 0183 sentence the server receives, from all
     providers interleaved: a second GNSS receiver, or AIS, looks to the monitor like one receiver whose position jumps, and
     can be scored as spoofing;
   * the plugin runs it on one receiver: source `spawn-args` with `inputArgs ["--tcp","<host>:<port>"]` (or `--udp`) for
     that receiver's own stream. Prefer this on a server with more than one NMEA source;
   * the gate runs as a service (above) and the plugin connects to it: source `tcp-pksht` against the gate's port
     (`kshana-gate.service`, or the container). Marking fixes invalid then happens in that stream, not in Signal K.
3. Install the plugin from `integrations/signalk/`, enable "Kshana GNSS trust", pick the source, and set the thresholds.
4. The score, band, reasons and gate state appear under `navigation.gnss.kshana.*` and a notification at
   `notifications.navigation.gnss.kshana.trust` is raised in the `warn` and `alarm` states.

Details, paths and the OpenCPN setup: [`docs/MARINE-INTEGRATIONS.md`](../../docs/MARINE-INTEGRATIONS.md).
