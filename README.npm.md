<!-- Surface README for the npm WebAssembly package. Copied into web/pkg/README.md by
     web/build.sh after wasm-pack runs (web/pkg is gitignored/generated). Images/links are
     ABSOLUTE (pinned to /main) because npm does not rewrite relative paths or render Mermaid.
     The canonical, full README lives at README.md on GitHub. To re-pin images to an immutable
     release tag at publish time, replace `/main/` with `/vX.Y.Z/` across this file. -->

<p align="center">
  <img src="https://raw.githubusercontent.com/AshfordeOU/kshana/main/docs/assets/kshana-wordmark.png" alt="Kshana" width="300">
</p>

<p align="center">
  <strong>क्षण</strong> — Sanskrit for <em>the precise instant</em>, the smallest measure of time.<br>
  Open, reproducible PNT (positioning, navigation and timing) resilience simulation, compiled to WebAssembly — the whole engine, in the browser.
</p>

<p align="center">
  <a href="https://github.com/AshfordeOU/kshana/blob/main/tests/sgp4_verification.rs"><img src="https://img.shields.io/badge/SGP4-666%2F666%20AIAA%20vectors%20%C2%B7%204.12mm-3fb950" alt="SGP4 validated against all 666 AIAA 2006-6753 vectors, worst 4.12 mm"></a>
  <a href="https://github.com/AshfordeOU/kshana#validation-at-a-glance"><img src="https://img.shields.io/badge/validated-64%20external%20oracles-3fb950" alt="64 of 168 capabilities validated against independent external oracles"></a>
  <a href="https://github.com/AshfordeOU/kshana/releases"><img src="https://img.shields.io/badge/release-v0.27.2-c79e63" alt="Release v0.27.2"></a>
  <a href="https://kshana.dev"><img src="https://img.shields.io/badge/playground-try%20in%20browser-c79e63" alt="Live playground — run in your browser, no install"></a>
  <a href="https://github.com/AshfordeOU/kshana/blob/main/LICENSE"><img src="https://img.shields.io/badge/License-AGPL_v3-blue.svg" alt="License: AGPL-3.0-only"></a>
  <a href="https://doi.org/10.5281/zenodo.20528627"><img src="https://img.shields.io/badge/DOI-10.5281%2Fzenodo.20528627-blue.svg" alt="DOI 10.5281/zenodo.20528627"></a>
</p>

**Kshana** is an open, reproducible **PNT-resilience simulator with quantum-sensor
performance models** — PNT being positioning, navigation, and timing. This package is the Rust
engine compiled to **WebAssembly**: it runs entirely client-side — pass a scenario TOML
(Tom's Obvious, Minimal Language) string in, get a reproducible JSON (JavaScript Object Notation) result and an SVG (Scalable Vector Graphics) chart back, with nothing uploaded.
Every result is reproducible from `scenario + seed + engine version`, and every sensor
parameter is traceable to a published source.

> ***Validated, not asserted.*** 666/666 AIAA (American Institute of Aeronautics and
> Astronautics) SGP4 (Simplified General Perturbations 4, the standard satellite-orbit
> propagator) vectors to **4.12 mm** · Cowell force model **0.08 m** vs Orekit 12.2 ·
> Galileo **0.61 m** / Swarm-A **0.10 m** vs real ESA (European Space Agency) precise
> ephemerides · GCRS→ITRS (Geocentric Celestial Reference System to International
> Terrestrial Reference System) bit-for-bit vs SOFA/ERFA (the International Astronomical
> Union's Standards of Fundamental Astronomy library and its open port, Essential Routines
> for Fundamental Astronomy) · ML (machine-learning) metrics exact
> vs scikit-learn · **64 of 168** capabilities validated against independent external
> oracles; 100 honestly labelled Modelled, 4 partner-owned.

<p align="center">
  <img src="https://raw.githubusercontent.com/AshfordeOU/kshana/main/docs/assets/diagrams/system-overview.png" alt="Kshana system overview: five front doors (command-line interface, Python wheel, WebAssembly playground, Model Context Protocol server, JetBrains plugin) converge on a single api::run_toml dispatch, through the engine, to a reproducible result.json + chart.svg" width="840">
</p>

### Validated against external oracles — every row gated in continuous integration

Each row is checked against an **independent external oracle** and re-checked in CI
(continuous integration) on every change.

| | Capability | Result | External oracle |
|---|---|---|---|
| ✅ | SGP4/SDP4 (Simplified Deep-space Perturbations 4) propagation | 666/666 vectors, worst **4.12 mm** | AIAA 2006-6753 (Vallado) + independent `sgp4` crate |
| ✅ | Numerical Cowell force model | **0.08 m** / 24 h, 275 epochs | Orekit 12.2 `DormandPrince853` (CS GROUP) |
| ✅ | Orbit fit vs precise ephemeris | Galileo **0.61 m** · Swarm-A **0.10 m** | ESA/ESOC (European Space Operations Centre) SP3 (the Standard Product 3 precise-orbit format of the International GNSS Service, GNSS being Global Navigation Satellite System) precise orbits |
| ✅ | GCRS→ITRS frame chain | bit-for-bit vs SOFA; ≤ 0.86 m vs SPICE (Spacecraft, Planet, Instrument, C-matrix, Events — the planetary-geometry toolkit) | ERFA/SOFA + ANISE (Attitude, Navigation, Instrument, Spacecraft, Ephemeris — a pure-Rust SPICE) |
| ✅ | Allan deviations | reproduce reference deviations | NIST SP 1065 (National Institute of Standards and Technology Special Publication 1065) + Stable32 on a real Cs (caesium) clock |
| ✅ | GNSS DOP (dilution of precision) · ML detector metrics | to **1e-6** · to **1e-9** | gnss_lib_py · scikit-learn |

<p align="center">
  <img src="https://raw.githubusercontent.com/AshfordeOU/kshana/main/docs/assets/figures/validation-breakdown.png" alt="Verification status across all 168 capabilities: 64 Validated, 100 Modelled, 4 Partner-owned" width="780">
</p>

## Install

```bash
npm install kshana
```

## Usage

The package is an ES (ECMAScript, standard JavaScript) module with a WebAssembly payload,
built for the browser. Initialise it once, then call the engine synchronously. The only
difference between the browser and Node.js is how the WebAssembly binary is loaded.

**In the browser** (through a bundler, or a page that serves `node_modules/kshana/`),
`init()` fetches `kshana_bg.wasm` from beside the module:

```js
import init, { run, summary, chart_svg, version } from "kshana";

await init();                                   // fetch and compile the WebAssembly binary
```

**In Node.js**, `init()` fails with `TypeError: fetch failed` (Node's `fetch` cannot read
a local file), so read the binary from disk and hand it to `initSync`:

```js
import { readFileSync } from "node:fs";
import { createRequire } from "node:module";
import { initSync, run, summary, chart_svg, version } from "kshana";

const wasmPath = createRequire(import.meta.url).resolve("kshana/kshana_bg.wasm");
initSync({ module: readFileSync(wasmPath) });      // compile the WebAssembly binary
```

Save the Node.js version as a `.mjs` file (or set `"type": "module"` in your
`package.json`) so that `import` works. From there both are the same:

```js
// A complete scenario, not a sketch: scenarios/clock-holdover.toml without its comment
// lines. It runs 2 h, 10 min of GNSS then about 1.8 h with GNSS denied, and asks how long
// a strontium optical clock and a chip-scale atomic clock (CSAC) each hold time to within
// 20 ns. sigma_y(1s) is a clock's Allan deviation at an averaging time of one second;
// q_wf, the white-frequency-noise intensity, is its square.
const toml = `
seed = 42
threshold_ns = 20.0

[time]
step_s = 10.0
duration_s = 7200.0

[gnss]
windows = [
  { t0 = 0.0,    t1 = 600.0,  state = "nominal" },
  { t0 = 600.0,  t1 = 7200.0, state = "denied" },
]

[clock_quantum]
id = "optical-sr-lattice"
provenance = "Strontium optical lattice clock, space-oriented goal sigma_y(1s)=1e-15 (Origlia/Schiller/Bongs et al., arXiv:1503.08457); q_wf=sigma_y(1s)^2; ground-demonstrator maturity, not flown; flicker/aging not modeled"
y0   = 5.0e-17
q_wf = 1.0e-30
q_rw = 0.0

[clock_classical]
id = "csac-sa45s"
provenance = "Microchip SA65 / SA.45s CSAC datasheet sigma_y(1s)=3e-10; q_wf=sigma_y(1s)^2; flicker/aging not modeled"
y0   = 5.0e-10
q_wf = 9.0e-20
q_rw = 0.0
`;

const result = JSON.parse(run(toml));           // the full result document
// timing_p95_ns: the 95th-percentile timing error over the GNSS outage, in nanoseconds
console.log(version(), result.classical.fom.timing_p95_ns);

console.log(summary(toml));                     // the one-line result string
const svg = chart_svg(toml);                    // the same chart the command-line interface (CLI) writes
```

On the WebAssembly face every entry point is a separate call: `run` (the result
document as a JSON string), `summary`, `chart_svg`, `table_csv` (the scenario's CSV
(comma-separated values) table as a string, or `undefined` for kinds that publish no table; it throws on an
invalid scenario), `run_all` (one engine run returning `{json, svg, summary, csv}` as a
JSON string — use it when you want more than one output, since every other call runs
the scenario afresh), `version`, `list_kinds` /
`error_kind` (introspection), `encode_permalink` / `decode_permalink` — the
shareable-link (URL, uniform resource locator) codec the [playground](https://kshana.dev) uses to round-trip a whole
scenario through the address-bar fragment — and `export_sp3` / `export_omm` /
`export_oem`, the SP3-c (revision c of the Standard Product 3 format) and CCSDS
(Consultative Committee for Space Data Systems) ephemeris artifacts — OMM, the Orbit
Mean-elements Message, and OEM, the Orbit Ephemeris Message — the CLI writes. There is no
one-call `run_full` here; that binding exists only on the Python wheel.

Every figure of merit is labelled **validated** or **modelled**; optical-clock figures
are space goals on ground hardware (no strontium optical clock has flown). Maturity is
*not* uniform across domains — Earth PNT is real-data validated; deep-space / Mars
navigation is simulation-validated; real-mission deep-space OD (orbit determination) is on the roadmap.

## Learn more

- **Full README & validation matrix** → <https://github.com/AshfordeOU/kshana>
- **Live playground** → <https://kshana.dev>
- **Capabilities** → [docs/CAPABILITY.md](https://github.com/AshfordeOU/kshana/blob/main/docs/CAPABILITY.md)
- **Validation & provenance** → [docs/VALIDATION.md](https://github.com/AshfordeOU/kshana/blob/main/docs/VALIDATION.md) · [docs/PROVENANCE.md](https://github.com/AshfordeOU/kshana/blob/main/docs/PROVENANCE.md)

## Licence

Free and open source under the **GNU AGPL-3.0-only** (the GNU Affero General Public License, version 3 only). A **commercial licence** is
available from [Ashforde OÜ](https://ashforde.org) (an Estonian private limited company;
OÜ = osaühing) for proprietary/closed integration
— see [LICENSING.md](https://github.com/AshfordeOU/kshana/blob/main/LICENSING.md).
Professionally developed and maintained by Ashforde OÜ; commercial support, integration,
and proprietary extensions available.
