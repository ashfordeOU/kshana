# Kshana Station

A Kshana Station is a computer on a site wired to receivers. `kshana station run` reads each
receiver's stream as it arrives and keeps it as `kshana.obs/1` observation files
([OBS-SCHEMA.md](OBS-SCHEMA.md)), reports its state on a local port, and runs unattended as a
system service. It only reads: nothing is ever written to a receiver.

Abbreviations used on this page, in full:

| Abbreviation | Meaning |
|---|---|
| C/N0 | carrier-to-noise density ratio |
| GiB | gibibyte (1,073,741,824 bytes) |
| HTTP | HyperText Transfer Protocol |
| JSON | JavaScript Object Notation |
| MiB | mebibyte (1,048,576 bytes) |
| NMEA | National Marine Electronics Association (its sentence format) |
| RF | radio frequency |
| SBF | Septentrio Binary Format |
| SNR | signal-to-noise ratio |
| TCP | Transmission Control Protocol |
| TLS | Transport Layer Security |
| UBX | the u-blox binary protocol |
| USB | Universal Serial Bus |

## Commands

```bash
kshana station check <station.toml>                       # validate a configuration
kshana station run <station.toml>                         # run until stopped
kshana station service <systemd|launchd|windows> <station.toml>   # print what installs it as a service
```

## Configuration

See [`examples/station/station.toml`](../examples/station/station.toml).

| Table | Key | Meaning |
|---|---|---|
| `[station]` | `id`, position, antenna | the `kshana.obs/1` station block written into every file's header |
| `[[source]]` | `name` | letters, digits, `-` and `_`; names the source's directory |
| | `input` | `tcp:host:port`, or a file or device path (a serial port: set its speed first) |
| | `format` | any `kshana obs live` format: `ubx`, `sbf`, `nmea`, `rtcm3`, `novatel`, `gnss-sdr`, ... |
| | `reconnect` | open the stream again when it ends (default true) |
| `[output]` | `dir` | where the files go, relative to the configuration file |
| | `rotate_mb` | start a new file past this size (default 64 MiB) |
| | `keep` | files kept per source (default 48); the oldest go first |
| `[http]` | `listen` | the status port (default `127.0.0.1:8470`, local only) |
| | `token_file` | required for any other address; every request but `/health` then needs `Authorization: Bearer <token>` |
| `[fleet]` | `url`, `token_file`, `interval_s` | post the status to a fleet manager every `interval_s` seconds (default 30), `http://` only |

## What it writes

`<dir>/<source>/<sequence>.obs.jsonl`. Every file starts with the source's header record, so
each is a valid observation file on its own (`kshana obs check` passes on each). The epochs of
a connection are the epochs a replay of the same bytes gives (`kshana obs convert`), bit for
bit, from the same live reader `kshana obs live` uses. A stream that ends or fails is opened
again every second; the time without input is counted as a gap and never filled, and each new
connection starts a new file.

## Status

`GET /health` answers `ok`. `GET /status` answers `kshana.station-status/1`: the station, the
engine version, uptime, and per source whether it is connected, its connections and gaps,
bytes and epochs read, when the last epoch arrived, the last error and the current file; and
the last fleet report's outcome.

## As a service

`kshana station service <system> <station.toml>` prints, for the configuration's absolute path
and this program's path:

- **systemd** (Linux): a unit; save it as `/etc/systemd/system/kshana-station.service`, then
  `systemctl enable --now kshana-station`. It restarts on failure and after a reboot; it is in
  the `dialout` group for serial ports.
- **launchd** (macOS): a property list; save it as
  `/Library/LaunchDaemons/dev.kshana.station.plist`, then
  `launchctl bootstrap system /Library/LaunchDaemons/dev.kshana.station.plist`.
- **windows**: a `schtasks` command that runs the Station at start-up as the system account, so
  it comes back after a reboot.

## Field guide: a real receiver on a site

These steps take one receiver from its box to an unattended Station on Linux. They use only the open
engine. The Station reads; it never configures a receiver, so step 1 uses the maker's own tool.

### 1. Make the receiver send what the Station reads

Set the receiver's output with its maker's tool (u-blox u-center, Septentrio's web interface or
RxTools, and so on), and save that configuration in the receiver so it survives a power cycle.

| `format` | Messages to enable | What they give |
|---|---|---|
| `ubx` (u-blox) | UBX-NAV-PVT, UBX-NAV-SAT, UBX-MON-RF; optionally UBX-NAV-STATUS, UBX-SEC-SIG, UBX-NAV-TIMEGPS | the fix and time, C/N0 per satellite, the gain control and jamming indicator, and the receiver's own spoofing and jamming flags ([RECEIVER-PROTOCOLS.md](RECEIVER-PROTOCOLS.md)) |
| `sbf` (Septentrio) | PVTGeodetic, MeasEpoch, RFStatus | the fix, C/N0 per satellite and signal, the RF-band report (carried, not interpreted) |
| `nmea` | GGA, RMC, GSV | time and position, SNR per satellite |

Once a second is enough. The other `format` values (`rtcm3`, `novatel`, `gnss-sdr`, ...) read the
messages listed in [OBS-SCHEMA.md](OBS-SCHEMA.md).

### 2. Connect it

- **USB.** Most receivers appear as `/dev/ttyACM0` or `/dev/ttyUSB0`. Use the stable name under
  `/dev/serial/by-id/` in the configuration, because the numbers change when devices are plugged in
  a different order.
- **Serial line.** The Station does not set the line speed. Set it and raw mode before the Station
  opens the port: `stty -F /dev/serial/by-id/<receiver> 115200 raw -echo`. Use the speed the receiver
  sends at. A USB receiver that presents a virtual serial port ignores the speed.
- **Network.** A receiver or a serial-to-network server (for example ser2net) that serves the
  stream on a TCP port is read with `input = "tcp:<address>:<port>"`. The Station reconnects every
  second when the connection drops.

Check that bytes arrive before going further: `cat /dev/serial/by-id/<receiver> | head -c 200 | od -c`
shows the sync bytes (`µb` for UBX, `$@` for SBF, `$G` for NMEA).

### 3. Write the configuration

The service runs with a read-only system (`ProtectSystem=strict`) and may write only under
`/var/lib/kshana-station`, so keep the configuration and the output there:

```bash
sudo mkdir -p /var/lib/kshana-station
sudo cp examples/station/station.toml /var/lib/kshana-station/station.toml
```

Set the station's `id`, its position (`lat_deg`, `lon_deg`, `height_m`) and its antenna, and one
`[[source]]` per receiver, with `input` the device or `tcp:` address from step 2 and `format` from
step 1. Keep `[output] dir` relative (it is taken relative to the configuration file).

The output needs `rotate_mb × keep` of disk per source: 3 GiB with the defaults (64 MiB × 48 files).
The oldest file goes first when a source has `keep` files.

### 4. Run it once in the foreground

```bash
kshana station check /var/lib/kshana-station/station.toml
sudo kshana station run /var/lib/kshana-station/station.toml
```

In another terminal:

```bash
curl -s http://127.0.0.1:8470/status            # each source: connected, epochs read, the last error
kshana obs check /var/lib/kshana-station/station-data/<source>/<file>.obs.jsonl
```

`/status` should show each source connected and its epoch count rising. `obs check` should pass on
the file being written. Stop the Station with Ctrl-C.

### 5. Install it as a service

```bash
kshana station service systemd /var/lib/kshana-station/station.toml | sudo tee /etc/systemd/system/kshana-station.service
```

For a serial line from step 2, add the `stty` call to the unit so the speed is set after every
reboot. Run `sudo systemctl edit kshana-station` and add:

```ini
[Service]
ExecStartPre=/bin/stty -F /dev/serial/by-id/<receiver> 115200 raw -echo
```

Then `sudo systemctl enable --now kshana-station`. Its log is `journalctl -u kshana-station`. The
unit restarts the Station after a failure and after a reboot, and puts it in the `dialout` group,
which may read serial ports.

### 6. Day to day

- **Gaps.** A source with no input is counted as a gap (`/status`, per source), never filled. Each
  reconnection starts a new file.
- **Time.** Epoch times in the files come from the receiver's own messages, not from the computer's
  clock.
- **Off the site.** Keep the status port local. To read it from elsewhere, give `[http]` a
  `token_file` and put a TLS tunnel in front, as for the fleet report.

| What you see | Likely cause |
|---|---|
| `/status`: source not connected, last error "permission denied" | the service user is not allowed to open the device: is it in `dialout`, or does a udev rule restrict the device? |
| connected, but no epochs | the wrong `format`, the wrong line speed (`stty`), or the messages of step 1 not enabled |
| epochs, but no C/N0 in the files | UBX-NAV-SAT, MeasEpoch or GSV not enabled |
| the service starts and stops at once | `kshana station check` names the problem in the configuration; `journalctl -u kshana-station` shows it |
| the disk fills | lower `keep` or `rotate_mb`; the space is `rotate_mb × keep` per source |

## Limits

- The fleet report is plain HTTP; across a network put a TLS tunnel in front of it.
- A source blocked on a device read stops only with the process.
- One Station is open. Managing several from one place (fleet management) is part of
  Kshana Pro.
