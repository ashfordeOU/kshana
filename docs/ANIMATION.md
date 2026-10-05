# Animation export

`--animate` turns a run's time series into something that moves: an animated Scalable
Vector Graphics (SVG) file, a single self-contained HyperText Markup Language (HTML)
player, or a numbered sequence of SVG frames for a video encoder. A campaign plays as its
phases (jamming, spoofing, holdover, integrity alarm) with its alarms marked; a spectrum
run plays its waterfall row by row; a low Earth orbit (LEO) pass plays its per-band link
and, with a spoofer, the monitor statistics epoch by epoch.

```bash
kshana scenarios/campaign-jam-spoof-holdover-integrity.toml --animate all
kshana scenarios/l-band-waterfall-jamming.toml --animate html
kshana scenarios/clock-holdover.toml --animate frames --animate-fps 24 --animate-duration 10
```

Code: `src/animation.rs`. Tests: `tests/animation.rs`.

## What it is, and what it is not

The exporter reads the result document the run already wrote. It does not re-run the
physics, it does not resample, smooth or interpolate between samples (apart from the one
straight-line segment that ends a trace at the cursor), and it adds no number of its own.
An animation is therefore exactly as good as the run behind it. Its tier is **MODELLED,
internal consistency**: it is a rendering, never evidence, and it carries no
verification-matrix row of its own.

## Outputs

Each format is written next to the scenario, beside the usual `result.json`,
`chart.svg` and `report.html`:

| Format | Written as | What it holds |
|---|---|---|
| `svg` | `<scenario>.animation.svg` | One SVG animated with Cascading Style Sheets (CSS) keyframes and no script: the traces draw in behind a moving time cursor, events appear at their instant, waterfall rows reveal in time order. It loops, with a 1.5 s hold on the finished picture. |
| `html` | `<scenario>.animation.html` | One file with inline script and style and no external asset: play and pause, a scrubber, speed (0.25x to 4x), every panel on one synced cursor, a live value per trace, the phase strip, and an event list that seeks on click. Space plays or pauses, the arrow keys step, Home and End jump. |
| `frames` | `<scenario>.frames/` | `frame_0000.svg`, `frame_0001.svg`, … and `manifest.json`. |

`--animate` is repeatable and takes a comma list (`--animate svg,html`) or `all`.
`--animate-fps` (1 to 60, default 12) and `--animate-duration` (0.5 s to 600 s, default
8 s) set the playback; the frame sequence is capped at 7,200 frames.

When `--export` runs in the same command, the HTML player lists the export files written
beside it (CZML, KML, GeoJSON, STK, SigMF) as relative links to those sibling files; a link
is written only for a bare file name, so none can leave the folder or reach the network.
The advanced report (`report.html`) embeds the animated drawing whenever the result has a
time series, whether or not `--animate` ran.

When `--animate` runs, `result.json` gains an `animation` block: the formats, frames per
second (fps), duration, frame count, the time span, the panel titles, the JSON paths every
trace was read from (`sources`) and any series found but not drawn (`omitted`). Without
`--animate` the result is byte-identical to a plain run.

### The frame sequence

The sequence has exactly `round(duration × fps)` frames. Frame *i* shows the timeline up
to `t_start + (t_end − t_start) × i / (n − 1)`, so the first frame is the start and the
last is the finished picture. `manifest.json` records `fps`, `duration_s`,
`frame_count`, `frame_pattern` (`frame_%04d.svg`), the pixel size, `t_start`, `t_end`,
the mission time of every frame (`frame_times`), the phases, the events and the sources.
A re-export into the same directory first removes every `frame_NNNN.svg` already there
(and nothing else), so a shorter sequence never leaves frames of a longer one behind for
the encoder to read.

The frames are SVG, not Portable Network Graphics (PNG). An `ffmpeg` built with the
`librsvg` library reads them directly, at the rate the sequence was written with (24 in
the example above; the manifest's `fps`):

```bash
ffmpeg -framerate 24 -i clock-holdover.frames/frame_%04d.svg -pix_fmt yuv420p clock-holdover.mp4
```

An `ffmpeg` without `librsvg` stops with "no decoder found for: svg". Rasterise the
frames first, for example with `rsvg-convert`, and encode the PNGs:

```bash
for f in clock-holdover.frames/frame_*.svg; do rsvg-convert "$f" -o "${f%.svg}.png"; done
ffmpeg -framerate 24 -i clock-holdover.frames/frame_%04d.png -pix_fmt yuv420p clock-holdover.mp4
```

## Accessibility and theme

- **Colour scheme.** The player follows `prefers-color-scheme` and redraws when it
  changes; the animated SVG carries a light variant of its palette under the same media
  query. The frames use the dark palette of the static charts, because a video has no
  scheme.
- **Reduced motion.** Under `prefers-reduced-motion: reduce` the animated SVG switches
  every animation off and shows the finished picture (its base styles are the end state,
  so nothing is hidden), and the player opens paused on the finished picture instead of
  playing; the user can still scrub or press Play.
- The SVG has a `<title>` and `<desc>`; the player's controls are labelled buttons, a
  range input with a spoken time value, and a select.

## What counts as a time series

The result documents differ kind by kind, so the exporter recognises the shapes the
engine emits rather than a list of kinds:

1. **An array of records with a time field** (`t`, `t_s`, `t_hours`, `t_min`, `t_days`,
   or `k` on an `epochs` array) that strictly increases along the array. Every other
   numeric field becomes a trace; the same field under two roots (`quantum.series[].error_ns`
   and `classical.series[].error_ns`) shares a panel.
2. **An object with a strictly increasing time array** (`t_s`, `t`, `times_s`, …) beside
   arrays of the same length: sibling numeric arrays, a `channels` map of
   `{unit, values}` records (the `campaign` timeline), an array of records holding such
   arrays (the `spectrum` bands, a constellation's satellite tracks), and a
   two-dimensional array whose rows match the time axis with a sibling `*_hz` frequency
   axis (the `spectrum` waterfall).
3. Beside that time array, `phases` (`name`, `t0_s`, `t1_s`) become the phase strip and
   `events` (`t_s`, `label`, `alarm`) become the markers. A band's `*_t_s` scalars (its
   first loss of lock, its lowest carrier-to-noise density ratio) are marked too.

Traces with a unit share a panel when their magnitudes are within a factor of 100, so a
50 ns guard does not flatten a 2 ns error. At most 6 panels of 6 traces are drawn; the
rest are listed under `omitted`. Traces over 2,400 samples are thinned by an even stride
that keeps the last sample, and a waterfall over 96 × 120 cells is averaged down (in
power, for decibel cells, so a narrow jammer is not diluted).

A kind whose result carries none of these shapes (a link budget, a single-epoch geometry,
a statistics-only Monte Carlo summary, or the telecom holdover, whose result publishes the
record's hash but not the record) is refused with `no time series to animate`, and nothing
is written. With kshana 0.31.0, 68 of the 132 bundled scenarios animate and 64 are
refused (over all 138 scenario files, 71 and 67). `cargo test --test animation --
--nocapture` prints the census over all 138 files.

Among the LEO kinds, every bundled `leo-pass`, `leo-pnt-chain` and `leo-ppp` scenario
animates. `leo-pvt` animates in its Doppler, joint-positioning and timing modes (a timing
run needs `trace = true`, which makes every row report its time error and predicted sigma
at every epoch) and is refused in its polar-coverage mode. `leo-navmsg` animates its
mid-pass update and is refused for the encoding, fit-interval and model-comparison
analyses. `leo-signal` and `ntn-positioning` results carry no time axis and are refused.

## Determinism

The output is a pure function of the result document and the options: no clock, no random
number, no hash-map iteration, no file or network access in the library, and no timestamp
anywhere, so the same scenario, seed and options give byte-identical files. The module
builds for WebAssembly unchanged; only the command-line interface writes files.

## Library use

```rust
use kshana::animation::{AnimationFormat, AnimationOptions};
let anim = kshana::api::animate_toml(src, AnimationFormat::Html, &AnimationOptions::default())?;
std::fs::write("run.html", &anim.files[0].content)?;
```

`kshana::animation::animate_result` animates a result document you already have, and
`extract_timeline` returns what would be drawn without rendering it.

## Limits

- The Python wheel and the WebAssembly module do not expose the exporter yet; it is
  reachable from the command line, the Rust library and the Model Context Protocol (MCP)
  server's `animate_scenario` tool (which returns at most 120 frames in one reply).
- Axes are linear. A series spanning many decades (a clock's error growth from 0.1 ns to
  a microsecond) reads as flat until late in the run.
- The animated SVG relies on CSS animation of a clip rectangle; current Chromium, Firefox
  and Safari engines play it, while a viewer without CSS animation shows the finished
  picture.
- Sweep, Monte Carlo and compose campaigns carry no time axis and are refused; the summary
  statistics of a sweep or an ensemble are not a time series. A chained campaign
  animates.
