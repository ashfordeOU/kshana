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
| Single-board computer | 64-bit ARM or x86, 2 GB RAM or more, wired Ethernet, a USB host | The monitor is light: one core is ample. Prefer a board that boots from an SSD or industrial-grade card, not a consumer card |
| Storage | 16 GB or more, rated for continuous writes | The monitor appends about 250 bytes per epoch (about 20 MB per day at 1 Hz) to `trust.jsonl`; rotate it |
| GNSS receiver | A multi-band, multi-constellation receiver that outputs NMEA 0183 (GGA, RMC, VTG and ideally GSV, a heading and a speed log on the bus) over USB or UART | The receiver is whatever you already trust for navigation. More independent sensors on the bus (a gyro or compass heading, a speed log) means more checks |
| Antenna | An active multi-band antenna with a clear sky view | Not the same antenna feeding the navigation receiver, if you can avoid it, so a failure of one does not take both |
| Power | A fused supply sized for the board, from a filtered 12 V or 24 V rail | Plan for clean shutdown on power loss |
| Network | A switch or router on the boat LAN | Signal K, OpenCPN and the monitor talk over TCP on the LAN |

What this build can and cannot see is in [`docs/MARITIME-TRUST.md`](../../docs/MARITIME-TRUST.md). A receiver that is already
being spoofed when the monitor starts has no clean baseline: start the monitor before the voyage.

## OS setup (Debian-family Linux)

```sh
sudo apt update && sudo apt install -y nodejs        # node 18 or newer, for the relay and the Signal K plugin
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

* `kshana-trust.service`: the advisory monitor. Reads the receiver, writes JSON lines to the journal and
  `/var/lib/kshana/trust.jsonl`. The NMEA stream is untouched.
* `kshana-gate.service`: opt-in. Reads the receiver, forwards the NMEA stream with the fix marked invalid while
  trust is collapsed and a `$PKSHT` per cycle, and serves it on `127.0.0.1:10110` for OpenCPN. Read "Gate mode" in
  [`MARITIME-TRUST.md`](../../docs/MARITIME-TRUST.md) first.

```sh
sudo install -m 0644 systemd/kshana-trust.service /etc/systemd/system/
sudo systemctl daemon-reload && sudo systemctl enable --now kshana-trust
journalctl -u kshana-trust -f
```

The serial speed in `ExecStartPre` and the `/dev/ttyGNSS` name are the two things to adjust. The gate unit expects
`nmea-tcp-relay.mjs` in `/opt/kshana/` (copy it from `integrations/opencpn/`).

Dry-run check (no service is started, nothing outside a temp directory is touched; needs `systemd-analyze`):

```sh
deploy/reference-build/check-units.sh
```

## Container option

```sh
docker build -f deploy/reference-build/Dockerfile -t kshana-trust .
cp examples/maritime-trust/session.toml deploy/reference-build/session.toml    # then edit [platform]
docker compose -f deploy/reference-build/docker-compose.yml up -d
```

The compose file reads the receiver at `/dev/ttyGNSS` (set the speed on the host first with `stty`) and serves the JSON
epochs on `127.0.0.1:10111`, which the Signal K plugin reads with source `tcp-json`. The Dockerfile and compose file
are not built by the project's CI; they are provided as a starting point.

## Signal K wiring

1. Receiver NMEA reaches Signal K as it does today (a serial or TCP data connection).
2. The monitor reads the same receiver, in one of two ways:
   * the plugin runs it for you: source `spawn-signalk-nmea` feeds the server's own NMEA input to `kshana receiver-trust live`
     (nothing else needs to open the serial port); or
   * the monitor runs as a service (above) and the plugin connects to it: source `tcp-json` (container) or `tcp-pksht` (gate stream).
3. Install the plugin from `integrations/signalk/`, enable "Kshana GNSS trust", pick the source, and set the thresholds.
4. The score, band, reasons and gate state appear under `navigation.gnss.kshana.*` and a notification at
   `notifications.navigation.gnss.kshanaTrust` is raised in the `warn` and `alarm` states.

Details, paths and the OpenCPN setup: [`docs/MARINE-INTEGRATIONS.md`](../../docs/MARINE-INTEGRATIONS.md).
