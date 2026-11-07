# Kshana Station

A Kshana Station is a computer on a site wired to receivers. `kshana station run` reads each
receiver's stream as it arrives and keeps it as `kshana.obs/1` observation files
([OBS-SCHEMA.md](OBS-SCHEMA.md)), reports its state on a local port, and runs unattended as a
system service. It only reads: nothing is ever written to a receiver.

Abbreviations used on this page, in full:

| Abbreviation | Meaning |
|---|---|
| HTTP | HyperText Transfer Protocol |
| JSON | JavaScript Object Notation |
| MiB | mebibyte (1,048,576 bytes) |
| NMEA | National Marine Electronics Association (its sentence format) |
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

## Limits

- The fleet report is plain HTTP; across a network put a TLS tunnel in front of it.
- A source blocked on a device read stops only with the process.
- One Station is open. Managing several from one place (fleet management) is part of
  Kshana Pro.
