# Kshana Desktop

The Kshana Studio in a native window, with the engine linked natively: no browser tab
limits, runs on every core the engine uses, files of any size read from disk piece by
piece. It is the free, open (AGPL-3.0-only) application; the Pro build is a separate
download (it carries the Pro features, the free build carries none).

What runs where:

| Function | Engine |
|---|---|
| Scenario runs, charts, tables, the localised summary (`run`, `run_all`, `summary`, `chart_svg`, `table_csv`, `run_human`), the kind list, the bundled examples, the CCSDS and SP3 exports | Native (`src-tauri/src/bridge.rs`, the same engine calls as `src/wasm.rs`) |
| The tool pages (receiver trust, telemetry, evidence packs, the sky geometry and the rest) | The WebAssembly engine, in the same window, as on the web |
| Large files (`file_info`, `read_range`, `iq_probe`) | Native: an IQ recording of any size is probed and read in blocks, never whole |

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
- **Devices panel** (serial and USB receivers, network feeds, SDRs) and the IQ view of a
  large recording in the page: the native commands exist; the page for them does not yet.
