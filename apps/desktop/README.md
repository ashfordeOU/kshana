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
| Scenario runs, charts, tables, the localised summary (`run`, `run_all`, `summary`, `chart_svg`, `table_csv`, `run_human`), the kind list, the bundled examples, the CCSDS and SP3 exports, the scenario's geometry for the map (`export_scenario`, `export_formats`) | Native (`src-tauri/src/bridge.rs`, the same engine calls as `src/wasm.rs`) |
| The tool pages (receiver trust, telemetry, evidence packs, the sky geometry and the rest) | The WebAssembly engine, in the same window, as on the web |
| Large files (`file_info`, `read_range`, `iq_probe`) | Native: an IQ recording of any size is probed and read in blocks, never whole |
| The receiver-trust scorers (`receiver_trust_replay`, `assess_vessel_log`) | Native, so the trust page's live device panel scores without the WebAssembly package |
| Live devices (`devices_list`, `device_start`, `device_status`, `device_excerpt`, `device_stop`) | Native (`src-tauri/src/devices.rs`), read only |

## The time cursor and the map

A run whose result goes over time opens on one clock (`shell/lib/clock.mjs`): the
**Timeline** view shows the timeline strip (the run's whole span, the cursor, the selected
range and the markers), the time-series plot and the 2D map side by side; the **Map** view
shows the strip and the map alone; the inspector shows the values at the cursor. Every one
of them follows the clock.

| Key | Does |
|---|---|
| Space | play or pause |
| J / K / L | play backwards (again: faster), pause, play forwards (again: faster) |
| ← / → | one epoch of the run back or forward (Shift: ten) |
| M | a marker at the cursor (on a marker: removes it); `,` and `.` jump between markers |
| [ / ] | the range starts or ends at the cursor; Escape clears it |

Drag on the strip or click on the plot to move the cursor; Shift-drag on the strip or drag on
the plot to select a range, which narrows the plot and the map's trail (double-click the
plot to clear it). On the map: drag pans, the wheel or + and − zoom, 0 fits the run, hovering
shows the latitude and longitude, and a click on a point of the track drops a timed marker
there (a click anywhere else does nothing). The map keeps the time, the position, the trust
or fix and the plotted values at the cursor in its corner.

What the views draw is what the engine returns: the plot takes the series the Studio's chart
model finds in the result (`web/studio/lib/views.mjs`), else the trust score or the station
elevation; the map's track is a receiver-trust result's positions coloured by its trust
score, or an ephemeris result's ground track coloured by whether the station sees the
satellite; the receivers, ground stations, jammers, jammer areas and satellites come from
the engine's GeoJSON export of the scenario (`export_scenario`, native in the bridge, the
command line's `--export geojson`). A jammer area is drawn as the circle where every
satellite is lost and the band out to where tracking starts to fail, labelled with its
evidence class ("modelled": computed from the scenario's jammer by the engine's link
equations; "estimated" when the export says so). Scale bar, projection name ("Web Mercator")
and "coastlines Natural Earth" are always on the map. Night ops (dark) and Chart (light)
follow the window's theme; the switch on the map overrides it for the session.

**Why a Canvas 2D renderer and not MapLibre GL JS.** The shell and the Studio are plain ES
modules with no build step and no npm dependencies; MapLibre would bring the repository's
first JavaScript bundling and vendoring pipeline (about 800 KB minified, a pinned package,
its licence record, and a worker the window's script policy would have to allow) to draw
what is, for 0.42, one GeoJSON land layer, a track, a few points and circles. The renderer
in `shell/lib/map/` (Web Mercator, pan and zoom, graticule, scale bar, two canvases so a
cursor move redraws only the top layer) is under 800 lines with its projection maths tested
in node. Vector tiles, imagery and the globe (0.43) are where MapLibre or CesiumJS earn
their place; the map's model (`shell/lib/timemodel.mjs`) does not depend on the renderer.

The base map is Natural Earth land (public domain) at 1:110m for the world and 1:50m from
zoom 3.5, bundled in `shell/data/` (37 KB and 423 KB) so the map opens with no network; see
`shell/data/NATURAL-EARTH.md`. The 1:10m layer is not bundled (about 1.9 MB even simplified).

Performance: scrubbing 24 h of 1 Hz data (86 400 epochs) is measured by
`tools/time-cursor-bench.mjs` (Playwright, Chromium, the engine's command line standing in
for the native bridge): the work of a scrub frame was 1.1 ms at the median and 4.5 ms at the
95th percentile, with frames every 16.7 ms. It needs a browser and the engine binary, so CI
runs the pure part (`shell/lib/clock.test.mjs`, about 0.02 ms of model work per frame).
Tests: `node apps/desktop/shell/lib/clock.test.mjs`.

## Extending the shell

A module loaded into the shell's page (a `<script type="module">` added after `shell.js` in a
staged copy of `shell/index.html`) can add to the window through `window.KshanaShell`. The API
is the same for any extension; with none registered, the shell draws only its own parts. The
registry is `shell/lib/ext.mjs` (pure, tested in `shell.test.mjs`).

```js
function attach(shell) {
  shell.registerView("account", { title: "Account", render(el, ctx) { /* draw into el */ } });
  shell.registerNavSection({ heading: "EXTRA", items: () => [{ id: "account", label: "Account", icon: "files", view: "account" }] });
}
if (window.KshanaShell) attach(window.KshanaShell);
else addEventListener("kshana-shell-ready", (e) => attach(e.detail), { once: true });
```

| Call | What it does |
|---|---|
| `version` | `1`. An extension checks it before relying on the calls below. |
| `registerView(id, { title, render(el, ctx) })` | A view in the centre. `id` is lower-case letters, digits and `-`, and not one of the shell's views. `render` is called on every render of the shell while the view is shown: on the first, `el` is empty and `ctx.fresh` is `true`; afterwards `el` still holds what the view drew, which it may keep or redraw. It may also return a node, which then fills `el`. A view that throws gives the place back to the shell's own view. `title` (a string or a function) names the window while the view is shown. |
| `replaceView(builtinId, viewId)` | Shows the registered `viewId` wherever the shell would show its own `builtinId` (`home`, `runs`, `library`, `devices`, `evidence`, `files`, `upgrade`); `null` gives it back. Links and buttons that open the built-in view open the replacement. |
| `registerNavSection({ heading, items })` | A sidebar section after the shell's own items. `items` is a list, or a function returning one (read on every render), of `{ id, label, icon, badge, view, onSelect }`: `icon` is the name of one of the shell's icons or a function returning a node; `badge` is a short text or `{ text, dot, title }` (`dot` a CSS colour); `view` opens that view and marks the item current while it is shown; `onSelect` is called on a click. |
| `registerPaletteGroup({ heading, items })` | A group of the command palette (⌘K / Ctrl+K) after the shell's actions. `items` is a list or a function of `{ id, label, keywords, icon, tag, hint, disabled, onSelect }`; the query matches every word against the label and keywords, the arrow keys and Enter move through these rows as through the shell's, and `onSelect` runs after the palette closes. Not shown when the palette opens a scenario in a new tab. |
| `setStatusItems(side, items)` | Status bar items: `"left"` items follow the shell's (engine, device, cores); `"right"` items take the place of the shell's edition items. A list or a function of strings or `{ text, title, dot }`; `null` gives the side back to the shell. |
| `setEdition({ appName, tag, title, text, action: { label, onSelect } })` | The edition this window runs: the sidebar's edition box shows `title`, `text` and the action in place of the shell's own box and its section on other editions; `tag` follows the brand; `appName` names the window. `null` gives the shell's own back. |
| `on(event, fn)` | `"render"` (after every render), `"runs-changed"` (`{ runs }`, after a run is added or the comparison selection changes) and `"view-changed"` (`{ view, tab }`). Returns the function that stops listening. |
| `show(id)`, `view` | Opens a view (the shell's or a registered one); the view shown (`"tab"` for an open scenario). |
| `runs()`, `run(id)` | The runs of this session, newest first, as copies: `{ id, file, title, domain, custom, edited, toml, result, svg, summary, csv, ms, at, engine, selected }`. |
| `refresh()`, `icon(name)`, `toast(text)` | Draws the shell again (after something an extension shows has changed); one of the shell's icons as an SVG node; a short message. |

Every `register…` call returns a function that removes what it added. `ctx` holds `view`,
`route`, `replaces` (the built-in view it stands in for, or `null`), `fresh`, `runs`, `show`
and `parts`: `parts.recentRuns()` (the home's table of the latest runs, or `null` with none)
and `parts.scenarioGrid()` (the home's scenario cards), so a view that replaces the home can
keep them. An extension's errors are logged and never stop the shell. The shell writes every
text an extension gives it through `textContent`. `kshana-shell-ready` is dispatched on
`window` once, with the API as `detail`, before the shell's first render.

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
