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
| Live AIS and ADS-B (`live_start`, `live_status`, `live_snapshot`, `live_stop`) | Native (`src-tauri/src/live.rs`), read only |
| The Python notebook (`python_probe`, `python_exec`, `python_status`, `python_stop`) | The Python on the computer, through `src-tauri/src/python.rs` |
| Globe imagery tiles (`tile_cache_get`, `tile_cache_put`) | Native cache (`src-tauri/src/tiles.rs`); fetched only when the person turns imagery on |

## The look and the wording

The shell's look (0.42 U14) is in `shell/look.css` and `shell/lib/`: colour roles as `--k-*`
tokens for both themes (five domain colours, the Pro accent, the evidence badges, the
constellations, a green-to-amber-to-red trust scale with `trustColour(x)` in `lib/look.mjs`;
red only means "bad now"), a symbol set of twelve (`lib/symbols.mjs`, drawn in `currentColor`,
also reachable by name through `KshanaShell.icon`), numbers with units and uncertainty in Geist
Mono (`lib/format.mjs`: `14.2 ± 0.4 m`, `14:21:07.250 UTC`, `3 h 12 m`) and a Comfortable or
Compact density (`data-density` on `<html>`, switched from the status bar or the palette and
remembered in this window). `node apps/desktop/shell/look.test.mjs` checks WCAG AA contrast of
the text colours and the colour-blind separation of the domain colours and trust endpoints.

The Studio pages are staged unchanged, then `build-frontend.sh` rewrites the staged copy with
`wording.mjs` (never `web/`): inside the app nothing says it runs in a browser; the question
view says the engine runs natively on this computer. The build fails if a banned phrase is
left; `node apps/desktop/wording.test.mjs` checks the same. `build-frontend.sh [out-dir]`
stages elsewhere than `apps/desktop/dist`.

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
in node. The globe (0.42 U24, below) is drawn by the chart library's own WebGL2 renderer
instead of CesiumJS for the same reason; the map's model (`shell/lib/timemodel.mjs`) does not
depend on the renderer.

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

## Projects, files and the console

**Runs kept on disk (0.42 U8).** The session is kept in a project folder whose name ends in
`.kshana` (`Documents/Kshana/Session.kshana` until the person keeps it under a name or opens
another one, on Files and project). It is plain text, written by the app's native side
(`src-tauri/src/project.rs`: relative paths inside the folder only, the project's file kinds
only, each file written to a temporary name and renamed) a moment after each change and
every few seconds while the layout changes:

| Path | Holds |
|---|---|
| `project.json` | format `kshana-project/1`, the name, when it was made |
| `runs/<time>-<n>/` | `run.json` (title, scenario file, engine and version, the SHA-256 of the scenario text and of the result, seed, tags, pin, note), `scenario.toml` (the recipe), `result.json` (the engine's result as it wrote it, byte for byte), and `summary.txt`, `chart.svg`, `table.csv` when the engine made them |
| `scenarios/` | the open tabs' scenarios that were edited or opened from a file |
| `layouts/session.json` | the open tabs, the view of each, its clock (cursor, range, timed markers) and its plot's markers A and B, the selected runs, the page shown |
| `data/links.json` | the data files the project uses, by path, with format and size |
| `notebooks/notes.md`, `notebooks/console.json` | the project's notes and the console |

Closing and opening the app brings back the tabs, their views, cursors and markers, the runs
and the selection. The Runs page searches (words, `tag:name`, `is:pinned`, `is:edited`),
pins, tags and annotates runs, and **replays** a run: its `scenario.toml` runs again and the
result's SHA-256 is compared with the one kept; the same engine version gives the same bytes.
A page opened outside the app keeps the same files in the window's storage.

**Drop anything in (U9).** Files or a folder dropped on the window (or chosen on Files and
project) go to the native format detective (`src-tauri/src/detective.rs`), which uses the
engine's own readers: RINEX observation, navigation and clock files, SP3, the twelve
receiver-log formats of the receiver-trust kind (UBX, NMEA 0183, SBF, NovAtel, RTCM 3 MSM,
RTKLIB .pos, Android GnssLogger, GNSS-SDR, SBP, GREIS, Unicore, RINEX), the clock logs of
`[clock_log]`, SigMF and raw IQ recordings (described by their size and metadata, never
read), and AIS, ADS-B, MAVLink and ULog track files. Before anything is loaded it shows the
format, the span, the epochs and interval, the constellations and satellites, and the gaps
(spans longer than one and a half intervals); a file larger than 8 MiB is described from its
first 8 MiB, and the page says so. A file the engine does not read is named with the reason.
A receiver log then opens as a receiver-trust run of its own path; a clock log opens beside
the bundled clock simulation (`clock-measured-log.toml` with its `[clock_log]` replaced);
navigation, orbit, IQ and track files are kept as data links of the project (no scenario
opens them on their own yet).

**The code mirror (U10).** The Console page lists, for every open, setting change, reset,
run, export, evidence pack, comparison, replay, drop, marker pair, sky plot and figure
export, the Python line (the `kshana` package) and the command line that do the same. A run is
written so it reproduces: `kshana.get_example(name)` for an unedited bundled scenario, the
whole scenario text otherwise, then `kshana.run()` and a line that prints whether the
result's SHA-256 is the one the window got. The session copies (or saves) as one Python
script or one shell script. Every figure carries **Copy the script that makes this**: the run,
the figure's data taken from the result by path where the series is found there (else its
values as drawn), and a matplotlib plot; the engine's chart as `kshana.run_full()`; the sky
plot as the `kshana.sky_geometry` requests.

## Markers, journal figures and the sky plot

**Markers (U12).** The Timeline's plot is the interactive chart (`lib/plot.mjs` `mountPlot`
renders through `lib/chart`; the U15 linked view keeps its place in the Timeline, with the
chart as its plot). Alt-click or M on the plot places marker A, then B; the inspector reads
out the time and value of each, Δt, Δ value and the slope, and the map draws A and B where
the run was at those instants (the track, a single moving object, or the fixed receiver).
Escape clears them. They are kept with the project.

**Journal figures (U13).** A chart's **Export for a journal** draws its visible window
again in the IEEE, ION or AIAA manner (`lib/chart/journal.mjs`): one or two column widths
(IEEE's 3.5 and 7.16 in; for ION and AIAA 3.25 and 6.75 in, a common two-column layout, not
taken from their guides), a Times face, black and grey lines
told apart by dash and weight so the figure prints in black and white, as SVG, PDF (vectors,
written by the module) or PNG at 300 dpi. The figure is drawn from the chart's own data and
window: every point in the window is drawn (a series of more than 20,000 points there by the
first, lowest, highest and last point of each of four columns per output point), and the
visible data ride along (CSV in the SVG's metadata, an embedded file in the PDF), the same
rows as the chart's CSV export. Check the figure against the current author guide before
submitting.

**The sky plot (U16).** A run whose scene has a receiver or station gets a Sky view: the
engine's `sky_geometry` (the function of the Studio's sky geometry page and of the Python
package) at 61 epochs over the run, from that site, with the scenario's elevation mask (5°
when it states none). The azimuths and elevations are drawn as the engine gives them (the
tests check each sample against the engine's reply); trails follow the run's clock, the mask
is the dashed ring, and each satellite is coloured by its state at each sample: in view and
used, above the horizon but under the mask or skyline, or below the horizon (a state for
satellites a source flags unhealthy is drawn when one is given; no source gives it yet). The
constellations are the engine's GPS and Galileo presets propagated to the run's seconds; the
engine labels them representative, not the broadcast constellation of the run's date.

Tests: `node --test apps/desktop/shell/lib/*.test.mjs apps/desktop/shell/lib/chart/journal.test.mjs`;
the detective and project folders: `cargo test --manifest-path apps/desktop/src-tauri/Cargo.toml`.

## Explain, ships and aircraft, panes, sweeps, run diff and languages

**Explain this number (U11).** Any number of a result (the result strip, the key figures in the
inspector, the Table view, the values at the cursor) is a button. It opens a card drawn from
`lib/explain.mjs`: the figure's path in the result and its value as the engine wrote it; the
provenance class of the result's `units` entry, in plain words; the scenario kind, the engine
modules that compute it (`kind_modules`) and the kind's method page
(`docs/kinds/by-kind/<kind>.md`); the engine's own words (the units definition, the pass or
fail reason, the figure's tier note, the result's label); the scenario's numeric settings, the
ones the engine ranks first (`field_importance`) at the top, and the one the figure echoes
marked; the assumptions and limitations the result lists; the evidence tier (the figure's own
from `figure_tiers`, else the result's) and the ledger rows it names; the SHA-256 of the
scenario and of the result. **Sensitivity** runs the scenario again with each of the top four
settings moved by ±10 % and gives the elasticity by the central difference: every value is a
fresh run, none is estimated. A number the window shows without a path is looked up by its
value and said to be so; a part the result does not state is said to be absent.

**Ships and aircraft (U17).** A track file (AIS NMEA 0183, Mode S / ADS-B as AVR or Beast,
OpenSky state vectors, ASTERIX, canboat NMEA 2000, MAVLink, ULog) dropped on the window,
picked in Files and project, or one of the engine's public samples (`examples/tracks`, staged
as `data/tracks/`; synthetic or published worked examples, provenance in their `NOTICE.md`) is
decoded by the engine's own connectors (`src/interconnect`, through the native
`decode_tracks`) and opens in a tab of its own on the time cursor and the map
(`lib/traffic.mjs`): each object's reported track coloured by the quality class its reader
draws from the message's own accuracy and integrity fields, and at the cursor a symbol along
its course with its name, callsign or id; altitudes and speeds on the plot. The colour is a
class, not a verdict on whether a position is true; there is no estimated track in the free
edition.

**Panes and layouts (U20).** A scenario tab's **Panes** view (`lib/dock.mjs`,
`lib/dockview.mjs`) lays out the plot, the map, the sky plot, the engine's chart, the key
figures, the inspector and the console side by side under one clock strip: drag the bars to
resize (or arrow keys on a focused bar), drag a pane's title onto another pane to dock it at
that side or swap the two, split, close, or show one pane alone. Four layouts are built in;
named layouts are kept with the project in `layouts/saved.json`, each tab's in
`layouts/session.json`.

**Sweep studio (U21).** A scenario tab's **Sweep** view runs the scenario across one or two of
its numeric settings (range, steps, linear or logarithmic, whole numbers or not) and reads one
figure of the result from every run (`lib/sweepgrid.mjs`, `lib/sweepview.mjs`). The runs go to
the native engine several at once (one fewer than the cores, at most eight); **Cancel** stops
after the runs in progress. One setting draws a curve, two a heat map; a failed run is a
crossed cell; any cell opens as an ordinary run (tagged `sweep`). The console writes the same
grid as the engine's own `sweep-nd` scenario, so the sweep reproduces in one engine call.

**Run diff (U22).** Comparing two runs (Runs, select two) gives five views: the key figures;
the inputs (the settings that differ, with the change, and the scenario text line by line);
every number of the two results that differs, the largest relative change first, with the
engine's units; both runs on one time axis (run B's series dashed and named B, its track the
dashed line on the map, one clock for both); and the engine's two charts.

**Languages (U18).** The shell's messages are `i18n/en/desktop-js.ftl`, generated from its
`t()` call sites (`node tools/i18n.mjs jsx --src apps/desktop/shell --out i18n/en/desktop-js.ftl`),
translated in every language the Studio offers (`i18n/<lang>/desktop-js.ftl`, machine
translation, not reviewed by a native speaker; English is the reference). The build stages
them (`apps/desktop/stage-i18n.mjs`) with the Studio messages of the modules the shell imports
and the glossary; the title bar's language control switches without a reload. Tests:
`node --test apps/desktop/shell/i18n.test.mjs` (the catalogue is current, complete in every
language and passes the Studio's checker).

Tests: `node --test apps/desktop/shell/lib/explain.test.mjs apps/desktop/shell/lib/traffic.test.mjs
apps/desktop/shell/lib/dock.test.mjs apps/desktop/shell/lib/sweepgrid.test.mjs
apps/desktop/shell/lib/rundiff.test.mjs`; the native decode: `cargo test --manifest-path
apps/desktop/src-tauri/Cargo.toml`.

## Notebook, globe, plots, live traffic and course (0.42 wave 4)

**Python notebook and console (U23).** The Python notebook page (`lib/notebook.mjs`,
`lib/notebookview.mjs`) holds Markdown and Python cells kept in the project folder as
`notebooks/<name>.ipynb`, Jupyter's nbformat 4, so a notebook opens in Jupyter as it is. The
app carries no Python: its native side (`src-tauri/src/python.rs`) looks for the interpreter
the person names, else `python3`, `python` (and `py -3` on Windows), and the page says which
one it found and whether `import kshana` works there (`pip install kshana`), or plainly that
there is none. The cells run in one session (a small driver reading one JSON request per line,
one namespace for every cell) started in the project folder with `KSHANA_PROJECT` set to it;
each cell answers with what it printed, the value of a last expression, the traceback of an
error and the matplotlib figures it drew (as PNG). A cell past its time limit, or Stop, ends
the session. The console under the notebook runs lines in the same session (its history stays
in the window). Exports: Jupyter, a self-contained HTML page (no script, no request) and a PDF
of the cells' text and output (figures are named there; they are in the HTML and Jupyter
files). **Cite** adds the reference of `CITATION.cff` at the engine version as Markdown and
copies the BibTeX; **Add the console's Python** turns the code mirror's lines into cells.

**Globe (U24).** A run with anything on the map gets a Globe view (`lib/globe.mjs`,
`lib/globeview.mjs`), drawn by the chart library's WebGL2 renderer (`lib/chart/chart3d.mjs`
gained a solid, optionally textured `globe` layer and `axes: false`; no globe library is
vendored): the WGS-84 globe with the Natural Earth coastlines and a 30° graticule, the
scenario's sites and moving objects from the engine's GeoJSON export with their heights, the
run's track, ships and aircraft at the cursor, and at the cursor the coverage circle of each
satellite (the ground that sees it above the scenario's elevation mask, on a spherical Earth).
**Follow** turns the globe so the followed object stays under the camera. Terrain is not drawn.

*Offline region packs.* A pack (`kshana-mappack/1`: name, box, source, licence and a
`kshana-land/1` land layer) holds finer Natural Earth land for a region; it is added on Files
and project, kept in the project's `packs/` folder, drawn by the 2D map in place of the 1:50m
land wherever the pack's box holds the whole view (from zoom 5), and as extra coastlines on the
globe. `tools/pack_natural_earth.py --region WEST,SOUTH,EAST,NORTH --name NAME` clips Natural
Earth to a box and writes one; `shell/data/packs/baltic-10m.mappack.json` (the 1:10m Baltic
Sea, 92 KB, public domain; see `shell/data/NATURAL-EARTH.md`) is bundled.

*Imagery, off by default.* The globe can drape NASA's Blue Marble: Next Generation from NASA
GIBS (EPSG:4326 tiles at level 2). Only sources whose terms allow keeping tiles for offline
use are listed (`IMAGERY_SOURCES` in `lib/globe.mjs`, each with its terms): NASA has a free and
open policy for data and information generated under NASA sponsorship (Earthdata, *Data Use
and Citation Guidance*), NASA imagery is not protected by copyright in the United States, and
NASA asks to be credited, which the globe does. Nothing is fetched until the person picks the
source on the globe; each tile is then fetched once and kept in the app's cache folder
(`src-tauri/src/tiles.rs`, tile keys checked, files written 0644), so the globe draws it again
with no network. The window's script policy allows that one host (`connect-src` in
`src-tauri/tauri.conf.json`).

*Bridge (red) mode* (the globe's toolbar, the command palette, or the status bar while on): the
dark theme drawn in reds on black, canvases included, for a bridge or a night watch.

**Plots (U25).** A run whose result holds Allan deviation, MTIE or TDEV curves, Stanford points,
a spectrum or a waterfall gets a Plots view (`lib/plots.mjs` finds them by the field names the
engine writes, at any depth; `lib/plotsview.mjs` draws them): one log–log chart per kind with
the engine's 95 % confidence band where it gives one (MTIE and TDEV together, seconds shown in
nanoseconds), the Stanford plot with its alert limit and regions, the Welch spectrum and the
2D ↔ 3D waterfall, all with the chart library's interaction and exports, and the path in the
result under each. Nothing is fitted or computed: the values are the result's. The masks of
the telecom kinds are in the engine's chart and `masks[]`. An IQ recording on Files and
project (a raw `.ci8`/`.cu8`/`.ci16`/`.cf32` file or a SigMF pair) opens **Spectrum and
waterfall**: up to 16 MiB from a chosen time, read natively in one block, then a Welch spectrum
(Hann windows, half overlapping) and a 64-row waterfall in dBFS/Hz (a recording carries no
calibration), with the sample rate the person gives for a raw file.

**Live ships and aircraft (U26).** Devices has **Live ships and aircraft**: AIS NMEA 0183 over
TCP (a receiver's or multiplexer's port) or UDP (`udp:127.0.0.1:10110` takes datagrams sent to
this computer only; `udp:0.0.0.0:…` from the network, and the page says so), or Mode S / ADS-B
as Beast (`tcp:127.0.0.1:30005`) or AVR (`tcp:127.0.0.1:30002`) from a dump1090 or readsb. The
native side (`src-tauri/src/live.rs`) only reads; it keeps the last 30 minutes (at most 6 MiB)
and stamps each message with its arrival time on this computer (an AIS sentence gets a TAG
block with `c:` in milliseconds unless it has one; a Beast or AVR frame becomes an AVR line
whose 12 MHz counter runs from the start of the capture). Every three seconds the page asks
for the kept messages decoded by the engine's reader and redraws the traffic view (map, globe,
timeline), following the newest time unless that is turned off. Times are reception times,
not transmission times; positions are as broadcast; not for navigation.

**Course mode (U29).** The Course page lists guided lessons (`shell/data/course/lessons.json`,
checked by `lib/course.mjs`; in English): clock holdover, jamming, RAIM integrity and telecom
holdover. A lesson opens its bundled scenario in a tab with a panel above the result: the
step's text, the setting to try with its value field ("Set it to … and run"), and whether the
step's checkpoint is met by the tab's own runs (a run, the view shown, a setting the run used,
a figure of the result, or a figure that rose or fell from the lesson's first run). Every
suggested change was run with the engine before it was written into a lesson, and
`lib/course.test.mjs` checks each setting exists in its scenario and that the suggested value
meets its checkpoint. The lessons are teaching material, not an assessment. Paper reproduction
kits in the window are not built (the paper's scenarios run from the command line); the lesson
assistant is planned and marked so.

Tests: `node --test apps/desktop/shell/lib/notebook.test.mjs apps/desktop/shell/lib/globe.test.mjs
apps/desktop/shell/lib/plots.test.mjs apps/desktop/shell/lib/live.test.mjs
apps/desktop/shell/lib/course.test.mjs`; the native Python session, live sources and tile cache:
`cargo test --manifest-path apps/desktop/src-tauri/Cargo.toml`.

## Charts

`shell/lib/chart/` is the Desktop's interactive chart library (0.42 U30): pure ES modules, no
library from outside and no request, so it works offline. `index.mjs` exports it.

| Module | What it does |
|---|---|
| `chart2d.mjs` | `createChart(host, spec)`: the 2D chart on Canvas 2D, drawn at the device pixel ratio. Types: `xy` (lines, p5–p95 bands, steps, areas, scatter, bars; linear or log axes; a second y axis), `heatmap` (cells with a colour scale), `waterfall` (an image buffer) and `polar` (a sky plot with trails). |
| `chart3d.mjs` | `createChart3D(host, spec)`: the 3D chart on WebGL2. Layers: a trajectory coloured by value, a 3D scatter, covariance ellipsoids, a surface from a grid, a wireframe sphere (an Earth outline for ECEF or ECI tracks), any line segments; axes with ticks and labels. |
| `dual.mjs` | A heatmap or waterfall with a 2D ↔ 3D switch to the same grid as a surface. |
| `presets.mjs` | Specs for the usual plots: the Stanford plot (alert limit and regions), log–log stability plots (Allan deviation, MTIE, TDEV) with confidence bands and a mask, heatmaps of sweeps, waterfalls, sky plots. |
| `link.mjs` | Link groups: linked x-axes and linked brushing. |
| `decimate.mjs`, `scale.mjs`, `hit.mjs`, `export.mjs`, `data.mjs`, `mat3d.mjs`, `colour.mjs`, `paint.mjs` | The pure parts: min/max (M4) decimation per pixel column, scales and zoom and pan maths, hit-testing, CSV and SVG, the chart model, the 3D maths, the colour roles of the look (`--k-*` of `look.css`, with the Studio's tokens as fallback). |
| `shell-view.mjs` | The scenario tab's Timeline view, drawn with the library (one chart per run, so a re-render keeps the zoom, pins and markers). |
| `demo.mjs`, `demo-data.json` | The Charts view (an extension: a sidebar item, a palette entry): every chart type on real engine output. `scripts/chart-demo-data.mjs` makes the data by running the engine's command line on copies of bundled scenarios in a temporary directory. |

Every chart has the same interaction: hover for a crosshair and the exact values of the
nearest point of each series, with units; click to pin a readout; Alt-click (or the A/B tool,
or M) for two markers with Δx, Δy and the slope; the wheel zooms about the cursor (over an
axis, that axis only); drag pans; Shift-drag zooms to a box; dragging an axis zooms that axis;
double-click or 0 returns to the full view; + − and the arrow keys zoom and pan; `,` and `.`
step a keyboard cursor through the points, Enter pins, Esc clears; Ctrl- or ⌘-drag selects
epochs, which every chart of the link group highlights (x for a time series, the points' own
epochs for a scatter, rows for a waterfall, trails for a sky plot); the legend shows and hides
series (Shift: only that one). Each chart saves its visible data as CSV (units in the header),
itself as SVG (vectors: the same display list the canvas draws) and as PNG. The 3D chart
rotates (drag), pans (Shift- or right-drag), zooms (wheel), resets (double-click, 0) and fits
(F); hover picks the nearest point with the same matrix that draws it.

The time cursor is injected, not owned: a chart given `clock` (`{ now, range, subscribe(fn),
set(t), setRange(a, b) }`, the interface of the window's clock) draws the cursor at
`clock.now`, sets it when the cursor line or the time axis is dragged, and passes a brush on
the time axis to `clock.setRange`. Each chart has an accessible name, a keyboard-reachable
data table (T, or the "Data table" disclosure) and announces readouts; animated view changes
are skipped under `prefers-reduced-motion`.

**Why a hand-written WebGL2 renderer and not three.js.** The 3D views need five kinds of
layer, an orbit camera and exact picking, which come to about 700 lines here
(`chart3d.mjs`, `mat3d.mjs`, tested in node). A vendored three.js build is over 600 kB of
code the app would carry and review for every update, and its picking would still need the
same projection code to give exact values; the Studio already draws its 3D orbit view without
it (`web/studio/lib/orbit3d.mjs`). No third-party code is vendored for the charts, so there is
no new licence to record. The globe item can add textures and a camera path to the same
renderer.

Performance (`node apps/desktop/scripts/chart-perf.mjs`, headless Chromium, device pixel
ratio 2, the chart panned and zoomed on every frame): 1,000,000 points in two series about
34 fps (draw 13 ms mean), 100,000 points about 60 fps (2 ms), a 100,000-point scatter 60 fps
(4 ms); headless Chromium paces frames at about 60 Hz. It is a documented script, not a CI
step (frame rates on shared runners vary too much to gate on). Tests:
`node apps/desktop/shell/lib/chart/chart.test.mjs` (in CI).

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

### Linux packages, installed and started

`.github/workflows/linux-packages.yml` builds the `.deb` and `.rpm` for x86_64 and arm64 on Ubuntu
22.04 and installs each one in a fresh container with the distribution's own package manager:
Ubuntu 22.04 and 24.04 (`.deb`), Fedora (`.rpm`) and Raspberry Pi OS 64-bit (Debian trixie arm64
with the Raspberry Pi archive, on an arm64 runner). `scripts/linux-package-install-test.sh` then
checks the installed files and shared libraries, starts the app on a virtual display until its
window is mapped, and removes the package. To run it on your own package:

```bash
docker run --rm -v "$PWD:/w:ro" ubuntu:24.04 sh /w/scripts/linux-package-install-test.sh "/w/<package>.deb"
docker run --rm -v "$PWD:/w:ro" debian:trixie sh /w/scripts/linux-package-install-test.sh --raspberry-pi-archive "/w/<package>.deb"
```

The test does not cover a real Raspberry Pi's kernel, firmware or GPU driver.

## Not done yet

- **Signing and notarisation.** The bundles are unsigned: macOS Gatekeeper and Windows
  SmartScreen warn on first start. Apple notarisation and Windows signing need the
  publisher's accounts; the release plan ships the engine first and the signed apps as a
  following patch release.
- **Signed automatic updates.** Not configured: the update key is the publisher's to make.
- **SDRs and binary receiver protocols** in the devices panel (it reads NMEA 0183 text). An IQ
  recording's spectrum and waterfall (U25) read one block of up to 16 MiB at a time; a
  recording-wide overview is on the Studio's IQ page.
- **Terrain on the globe** (U24) and a reconnecting live source (U26: a closed TCP source stops
  and says so; Start again reconnects).
- **Serial speed on Windows** is not set by the app.
- **Pop-out windows, presentation and focus modes** of the panes (U20): one pane can be shown
  alone inside the tab; separate windows are not made yet.
- **Monte Carlo in the sweep studio** (U21): the grid runs one seed per cell; seeded ensembles
  per cell are the engine's `campaign` kind, not offered in the window yet.
