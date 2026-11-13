# Kshana Desktop

The Kshana Studio in a native window, with the engine linked natively: no browser tab
limits, runs on every core the engine uses, files of any size read from disk piece by
piece. It is the free, open (AGPL-3.0-only) application; the Pro build is a separate
download (it carries the Pro features, the free build carries none).

## The window

The app opens its own shell (`shell/`, staged by `build-frontend.sh` as `studio/desktop/` next
to the Studio, whose modules it imports unchanged): a sidebar (Home, Runs, Scenario library,
Devices, Evidence packs, Files, and the Pro items, which open a screen on what Pro adds), one
document tab per open scenario, a centre view (the engine's chart, a map for ground tracks,
the timeline, a table of key figures, the JSON), a result strip, an inspector (inputs, result,
export and the command line that reproduces the run) and a status bar (engine version from
the native bridge, the device being read, cores, edition). ⌘K / Ctrl+K opens a command
palette over the scenario index and the actions; the Runs view compares two runs of the
session. A run's evidence pack is an unsigned zip with a SHA-256 manifest; signed dossiers
are Pro. The Studio's own pages are staged unchanged for the tool pages, and the website is
not affected. Tests: `node apps/desktop/shell/shell.test.mjs`.

What runs where:

| Function | Engine |
|---|---|
| Scenario runs, charts, tables, the localised summary (`run`, `run_all`, `summary`, `chart_svg`, `table_csv`, `run_human`), the kind list, the bundled examples, the CCSDS and SP3 exports | Native (`src-tauri/src/bridge.rs`, the same engine calls as `src/wasm.rs`) |
| The tool pages (receiver trust, telemetry, evidence packs, the sky geometry and the rest) | The WebAssembly engine, in the same window, as on the web |
| Large files (`file_info`, `read_range`, `iq_probe`) | Native: an IQ recording of any size is probed and read in blocks, never whole |
| The receiver-trust scorers (`receiver_trust_replay`, `assess_vessel_log`) | Native, so the trust page's live device panel scores without the WebAssembly package |
| Live devices (`devices_list`, `device_start`, `device_status`, `device_excerpt`, `device_stop`) | Native (`src-tauri/src/devices.rs`), read only |

## Live devices

The trust page shows a "Score a receiver live" panel in the Desktop (and only there). It
reads a receiver's NMEA 0183 output from:

| Source | Written as |
|---|---|
| A serial or USB port (Linux `/dev/serial/by-id/*`, `/dev/ttyACM*`, `/dev/ttyUSB*`; macOS `/dev/cu.*`; Windows `COMn`) | The port's path, picked from the list; the speed is set with `stty` on Linux and macOS when one is chosen, and left as the port has it otherwise (on Windows, set it in the port's properties) |
| A TCP stream (a receiver's NMEA port, a multiplexer, a serial-to-network bridge) | `tcp:<host>:<port>` |
| A file that is still being written (a logger's output) | `file:<path>` |

Every source is opened for reading only; nothing is written to the device or sent
anywhere. The app keeps the latest 1.5 MiB of sentences (lines starting with `$` or `!`;
about an hour at one fix a second) and the page scores that excerpt with the native
engine every five seconds, with the session settings above it, and shows it in the view.
The score calibrates on the excerpt's first five minutes, so once the window rolls the
calibration moves with it. One device is read at a time. Advisory only: the operator
remains responsible for the navigation of the vessel.

A run is off the window's thread; cancelling returns at once (the native run finishes in
the background and its answer is dropped).

## Build

Linux needs the WebKitGTK development packages (Ubuntu: `libwebkit2gtk-4.1-dev
libsoup-3.0-dev librsvg2-dev`); macOS and Windows need nothing extra.

```bash
apps/desktop/build-frontend.sh                      # stage web/studio as the frontend
cargo build --manifest-path apps/desktop/src-tauri/Cargo.toml          # the application
cargo test  --manifest-path apps/desktop/src-tauri/Cargo.toml          # the bridge tests
cargo install tauri-cli --version "^2" --locked     # once, for the bundles
(cd apps/desktop/src-tauri && cargo tauri build)    # .dmg/.app, .msi, .deb, .rpm, AppImage
```

## Not done yet

- **Signing and notarisation.** The bundles are unsigned: macOS Gatekeeper and Windows
  SmartScreen warn on first start. Apple notarisation and Windows signing need the
  publisher's accounts; the release plan ships the engine first and the signed apps as a
  following patch release.
- **Signed automatic updates.** Not configured: the update key is the publisher's to make.
- **SDRs and binary receiver protocols** in the devices panel (it reads NMEA 0183 text),
  and the IQ view of a large recording in the page: the native commands for files exist;
  the page for them does not yet.
- **Serial speed on Windows** is not set by the app.
