<!-- Published on crates.io with the kshana-mcp crate. Images and links are ABSOLUTE
     (pinned to /main) because crates.io does not rewrite relative paths. -->

<p align="center">
  <picture>
    <source media="(prefers-color-scheme: dark)" srcset="https://raw.githubusercontent.com/AshfordeOU/kshana/main/docs/assets/readme/kshana-logo-dark.svg">
    <img src="https://raw.githubusercontent.com/AshfordeOU/kshana/main/docs/assets/readme/kshana-logo-light.svg" alt="Kshana: the mark, a compass reticle marking the precise instant, beside the wordmark kshana" width="260">
  </picture>
</p>

# kshana-mcp: ask your AI assistant, and the engine answers

`kshana-mcp` is a [Model Context Protocol](https://modelcontextprotocol.io) (MCP) server for
**Kshana**, the open-source simulator for PNT (positioning, navigation and timing)
resilience. It lets an AI (artificial intelligence) assistant run the real engine and read
back its JSON (JavaScript Object Notation), instead of guessing the maths. It speaks over
stdio (standard input and output) to any MCP-compatible client, including Cursor and
JetBrains AI Assistant / Junie.

The maths Kshana is validated for is exactly where a language model guesses badly: SGP4
(Simplified General Perturbations 4) orbit propagation, reference frames of the IAU
(International Astronomical Union), Allan deviations, GNSS (Global Navigation Satellite
System) availability and DOP (dilution of precision), ARAIM (advanced receiver autonomous
integrity monitoring) protection levels, GNSS and INS (inertial navigation system) fusion,
and quantum-sensor models. Ask a question; the assistant runs a real scenario and gets
figures of merit with their provenance and their VALIDATED or MODELLED label.

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="https://raw.githubusercontent.com/AshfordeOU/kshana/main/docs/assets/readme/architecture-dark.svg">
  <img src="https://raw.githubusercontent.com/AshfordeOU/kshana/main/docs/assets/readme/architecture-light.svg" alt="One open engine at the centre, with the MCP server as one of its surfaces beside the command line, the Rust library, Python, WebAssembly and Kshana Studio, the Docker image and the JetBrains plugin; every surface runs the same engine, and Kshana Pro depends on it without forking it" width="100%">
</picture>

## Tools

| Tool | What it does |
|------|--------------|
| `run_scenario` | Run a scenario from a TOML (Tom's Obvious, Minimal Language) definition; returns the summary + full result JSON (JavaScript Object Notation: figures of merit, curves). Optional `include_chart` returns the chart as SVG (Scalable Vector Graphics). |
| `list_scenario_kinds` | The 75 built-in scenario kinds with descriptions + required/optional fields — so the agent can construct a valid scenario. |
| `validate_scenario` | Pre-flight check: parse the TOML and detect its kind, without running. |
| `list_example_scenarios` | The bundled reference scenarios as JSON: each `name`, its `kind` and one sentence on what it shows. Optional `kind` filter. Every example runs as it stands, so this is the quickest way to a valid TOML for a kind. |
| `get_example_scenario` | The TOML text of one bundled reference scenario, byte for byte the file under `scenarios/`. |
| `report_scenario` | Run a scenario and return its report: executive summary, inputs, every figure with its unit and its VALIDATED or MODELLED label, events, the capabilities exercised and a reproducibility record. `format` is `json` (default) or `html` (the printable single-file page). |
| `animate_scenario` | Run a scenario and return its time series as an animation: `svg` (default), `html` (a self-contained player) or `frames` (at most 120 in a reply). The first content item is a JSON summary of what was drawn; the files follow. A kind with no sampled time axis is refused with the reason. |
| `list_export_formats` | Which interoperability formats apply to a scenario (`czml`, `kml`, `geojson`, `stk`, `sigmf`), the reason when one does not, and the specification each writer follows. Does not run the scenario. |
| `export_interop` | Export a scenario as CZML (Cesium Language), KML (Keyhole Markup Language), GeoJSON, STK (Systems Tool Kit) ephemeris `.e`, or SigMF (Signal Metadata Format, for a `spectrum` scenario with an `[iq]` block). The first content item is a JSON index of the files (suffix, size, encoding, and the SHA-256 digest, the 256-bit Secure Hash Algorithm); the files follow, the binary SigMF sample file as base64. |
| `import_route` | Write a GeoJSON `LineString` route into a scenario that flies a waypoint track (`terrain-nav`, `terrain-slam`, `gravity-map`, `combined-altpnt`) and return the new TOML. |
| `export_sp3` | Export an `orbit` scenario's constellation as SP3-c (Standard Product 3, revision c) precise ephemeris. |
| `export_omm` | Export an `orbit` scenario's elements as a CCSDS (Consultative Committee for Space Data Systems) 502.0-B-2 OMM (Orbit Mean-elements Message) catalogue. |
| `export_oem` | Export an `orbit` scenario's state series as CCSDS OEM (Orbit Ephemeris Message) 2.0 ephemeris — the TEME (true equator, mean equinox) position *and* velocity series flight-dynamics tools (GMAT, the General Mission Analysis Tool; Orekit; STK, the Systems Tool Kit) read; the velocity-carrying complement of the position-only `export_sp3`. |
| `export_table_csv` | Run a scenario and return its reproducibility table as CSV (comma-separated values) — the byte-stable table the CLI (command-line interface) writes as `<scenario>.table.csv`. Only `realtime-frame-eop`, `lunar-time-budget`, `lunar-jamming`, `telecom-timing`, `leo-navmsg` (its `encode-decode` analysis on a `kepler16` or `kepler-rac` message model) and `moonlight-service-volume` with `export_site_lat_deg` + `export_site_lon_deg` set emit one; any other kind returns an error naming these. |
| `assess_receiver_log` | Assess a real GNSS (global navigation satellite system) receiver log for trust. The TOML names the log's `format` (`ubx`, `rinex`, `android` or `nmea`) and gives its bytes inline as `text` or `base64`; the tool runs the trust monitors (carrier-to-noise density drop, loss of lock, AGC (automatic gain control), jamming indicator, position jump and, with RINEX plus broadcast navigation, RAIM (receiver autonomous integrity monitoring) and a clock-aided monitor) and returns when and why the fix stopped being trustworthy. Optional `[[events]]` and `[compare]` sections score stated events and predicted C/N0 drops against stated tolerances. A `[platform] kind = "vessel"` table selects the maritime monitors and adds a 0-100 trust score per epoch with the monitors that deducted (advisory; MODELLED). The log goes inline (at most 4 MiB); a `path` is refused, so the server reads no files for this tool. Chart and per-epoch CSV on request. See [`docs/RECEIVER-TRUST.md`](../../docs/RECEIVER-TRUST.md). |
| `assess_vessel_stream` | Replay a bounded NMEA 0183 excerpt (at most 4 MiB) through the engine behind `kshana receiver-trust live`: per-epoch trust state and 0-100 score with reasons, counts by state, the lowest score and, with `gate`, the stream the gate would have forwarded. The bounded form of the live command: no socket is opened and nothing is written to a port (the long-running process and `--listen` are command-line only). Advisory only; MODELLED. See [`docs/MARITIME-TRUST.md`](../../docs/MARITIME-TRUST.md). |
| `generate_training_nmea` | Synthetic bridge NMEA 0183 for crew training from a `nmea-scenario` TOML (jamming, position drag-off, time spoof, replay delay) with the instructor log (`kshana-nmea-training/1`); deterministic per seed. Text only: nothing is synthesised at RF or IQ and nothing is transmitted; never for a vessel's live navigation systems. The reply carries the first 2000 lines. |
| `build_interference_map` | A GNSS interference map from ADS-B or AIS position reports as CSV text (at most 4 MiB): one `kshana-interference-map/v1` GeoJSON per UTC day, aggregate only (no identifiers, cells under 5 distinct aircraft or vessels withheld), with the dataset licence embedded. A degraded cell does not identify interference as the cause; not a forecast. MODELLED. See [`docs/INTERFERENCE-MAP.md`](../../docs/INTERFERENCE-MAP.md). |
| `route_exposure` | The share of a route's length in degraded, not-degraded, unassessed and not-observed cells of one or more interference maps, optionally within a date range. Unobserved cells are not evidence of a clear route. |
| `iq_signals` | The GNSS IQ layer's set-up: the signal names the IQ tools accept, whether the IQ file tools are on, the work directory and the per-call sample budget. Call it first. |
| `iq_info` | Describe one IQ (in-phase and quadrature) recording in the work directory without processing it: format, sample rate, centre frequency, samples, duration, data files and sizes (`kshana iq info`). |
| `iq_scene` | Generate a multi-satellite GNSS IQ scene into the work directory (`kshana iq scene`): stated Doppler/C/N0 profiles, or true broadcast-ephemeris geometry from a RINEX navigation file, with an optional signal-level propagation channel. Replies with the files written and their byte counts and the truth's first epoch per satellite. |
| `iq_acquire` | FFT (fast Fourier transform) acquisition of one or more PRNs (pseudo-random noise codes) over a recording (`kshana iq acquire`), optionally behind front-end stages: per PRN, acquired or not, Doppler, code phase, peak statistic and threshold; `surface_out` (one PRN) keeps the whole Doppler × code-phase correlation surface with fine-Doppler refinements. |
| `iq_track` | Acquire, then track with the DLL/PLL/FLL (delay-, phase- and frequency-locked loop) bank (`kshana iq track`), with the loops from a `kshana.loop-design/1` TOML file in the work directory (`design`) or the built-in design, and optional re-acquisition (`reacquire`): per channel, epochs, final Doppler, final and mean C/N0, phase- and code-lock fractions, locked at the end, the final lock state, false locks and re-acquisitions, plus the design's name and hash. Tracking streams in bounded memory; per-epoch output goes to files only (`epochs_out`: E/P/L, discriminators, loop states, C/N0, lock state as .csv/.jsonl/.bin; `events_out`). |
| `iq_frontend` | Apply receiver front-end and interference-mitigation DSP (digital signal processing: band-pass, notch, blanking, excision, AGC, quantiser) to a recording and write a new one (`kshana iq frontend`). |
| `iq_campaign` | Run a lab-replay campaign (`kshana iq campaign`): recordings, each with a test-condition file stating the lab's known truth, × front-end chains × loop designs. Each cell is scored for time to loss of lock, re-acquisition time, C/N0 degradation against the stated J/S (beside an analytic reference labelled MODELLED), false-lock rate, PLL/DLL jitter and availability. Incremental and resumable: each call runs the pending cells that fit the sample budget (or `max_cells`). |
| `iq_campaign_status` | A campaign output folder's progress: cells done and pending, and the digest once complete. Reads files only. |

Each tool is a thin, faithful wrapper over a public function of the `kshana` library — no
new simulation logic lives here, so an agent runs exactly the validated engine.

### The GNSS IQ tools: files in, compact JSON out

IQ recordings run to gigabytes, so the `iq_*` tools never pass samples through the
protocol. They follow one contract:

- **A work directory.** The server reads and writes IQ files only inside the folder named
  by `KSHANA_MCP_IQ_DIR`. Every path argument is relative to it (an absolute path must
  resolve inside it); inputs are resolved through symlinks before the check, an output's
  folder must already exist inside it, and an existing output is replaced only with
  `overwrite: true`. Unset, the IQ file tools are off and say how to enable them; every
  other tool is unaffected.
- **A sample budget.** One call generates or processes at most `KSHANA_MCP_IQ_MAX_SAMPLES`
  complex samples (default 50 000 000). In bytes that is 400 MB as `cf32_le` (8 bytes a
  complex sample), 200 MB as `ci16_le` (4 bytes) and 100 MB as `ci8` (2 bytes); a scene is
  written as `cf32_le` unless `format` says otherwise. The check runs before any work, and
  the refusal names the duration or `max_seconds` that fits.
- **Compact replies.** Each tool answers with one JSON summary: acquisition peaks, C/N0,
  lock state, and every file written with its path and byte count. Per-epoch tables go to
  the `json_out` / `csv_out` files you name.
- **Unknown arguments are refused**, not ignored, so a misspelt option is an error.

Each tool runs the same code path as `kshana iq` on the command line, in process. The layer
is software only: it writes files for software receivers and drives no radio hardware. The IQ
layer adds no interference or spoofer synthesis, and nothing is ever transmitted. (The separate
`spectrum` scenario kind can write analytic jammer IQ snapshots to a file.)

```json
{
  "mcpServers": {
    "kshana": {
      "command": "/Users/you/.cargo/bin/kshana-mcp",
      "env": { "KSHANA_MCP_IQ_DIR": "/Users/you/iq" }
    }
  }
}
```

With the Docker image, mount the folder and point the variable at it:
`docker run --rm -i -v "$PWD/iq:/iq" -e KSHANA_MCP_IQ_DIR=/iq ghcr.io/ashfordeou/kshana-mcp`.

### Every kind is reachable

`run_scenario` dispatches on the scenario's `kind`, so every kind `list_scenario_kinds`
names runs through it. That includes the newer families, each with bundled examples an
agent can fetch:

| Capability | Kinds | An example to start from |
|------------|-------|--------------------------|
| Spectrum and waterfall | `spectrum` | `l-band-waterfall-jamming` |
| The solar system | `solar-system` | `solar-system-tour` |
| Constellations around any body | `constellation-design`, `body-pnt` | `lunar-relay-constellation`, `europa-surface-pnt` |
| Campaigns: chained phases, sweeps, Monte Carlo (seeded random ensembles), composition | `campaign` | `campaign-sweep-jammer-power` |
| Low Earth orbit (LEO) navigation: signal design | `leo-signal` | `leo-band-trade` |
| LEO navigation: pass link budget | `leo-pass` | `leo-pass-iridium` |
| LEO navigation: navigation message | `leo-navmsg` | `leo-navmsg-encode-decode` |
| LEO navigation: fused positioning and timing | `leo-pvt`, `leo-ppp`, `ntn-positioning`, `leo-pnt-chain` | `leo-doppler-positioning`, `leo-pnt-end-to-end` |

`list_example_scenarios` with a `kind` names every bundled example of that kind.
Animations, reports and interoperability exports are not kinds: they are views of a run,
and `animate_scenario`, `report_scenario` and `export_interop` return them for any
scenario they apply to.

Not served: study suites (`kshana --study <suite.toml>`), because a suite names sibling
scenario files on disk and the scenario tools read no file. Run each member with
`run_scenario`. (The IQ tools do read and write files, inside their work directory only.)

## Install

Pick whichever fits — all run the same server over stdio.

```sh
# crates.io (a Rust toolchain builds it from source):
cargo install kshana-mcp

# Docker / OCI (Open Container Initiative) image — no Rust toolchain needed;
# published for linux/amd64 and linux/arm64, so Apple silicon runs it natively:
docker run --rm -i ghcr.io/ashfordeou/kshana-mcp

# From a checkout (development):
cd mcp/kshana-mcp && cargo install --path .

# Bleeding edge, straight from git:
cargo install --git https://github.com/AshfordeOU/kshana kshana-mcp
```

`cargo install` puts `kshana-mcp` on your `PATH` (typically `~/.cargo/bin/kshana-mcp`).
The server talks JSON-RPC (JSON remote procedure call) over stdio; logs go to stderr. Building from source needs a Rust
toolchain ≥ 1.88 (the patched `rmcp` 2.x SDK needs it; the `kshana` library itself needs
only 1.85); the Docker image needs none.

## Register it with a client

Virtually every MCP client uses the same `mcpServers` config block — register the
`kshana-mcp` binary by absolute path:

```json
{
  "mcpServers": {
    "kshana": {
      "command": "/Users/you/.cargo/bin/kshana-mcp",
      "args": [],
      "env": {}
    }
  }
}
```

Or, with the Docker image instead of a local binary (no `PATH` needed):

```json
{
  "mcpServers": {
    "kshana": {
      "command": "docker",
      "args": ["run", "--rm", "-i", "ghcr.io/ashfordeou/kshana-mcp"]
    }
  }
}
```

Where that block lives depends on the client:

- **Cursor** — `~/.cursor/mcp.json` (global) or `.cursor/mcp.json` (per project).
- **JetBrains AI Assistant / Junie** — Settings → Tools → AI Assistant → Model Context
  Protocol → Add → *As JSON*, paste the block, then fully restart the IDE (integrated
  development environment).
- **Desktop assistants** — most use a `…_config.json` with the same `mcpServers` shape;
  check your client's docs for the file location.
- **CLI agents** — many accept the same JSON via an `mcp add` / `mcp.json` mechanism.

Always use an absolute path to the binary. Set `RUST_LOG=debug` in `env` to troubleshoot
(diagnostics go to stderr; stdout is reserved for the JSON-RPC protocol).

## Try it

Once registered, ask your assistant things like:

- *"List the Kshana scenario kinds."* → `list_scenario_kinds`
- *"Show me a Kshana spectrum example and run it."* → `list_example_scenarios`,
  `get_example_scenario`, `run_scenario`
- *"Run the Kshana clock-holdover scenario with a 20 ns threshold and a 2-hour GNSS
  outage; what's the quantum-vs-classical holdover?"* → `run_scenario`
- *"Export that GPS (Global Positioning System) constellation as SP3."* → `export_sp3`
- *"Give me the realtime-frame-eop table as CSV."* → `export_table_csv`
- *"Put that Iridium pass on a Cesium globe."* → `list_export_formats`, `export_interop`
- *"Animate the jamming campaign."* → `animate_scenario`
- *"Give me the report for that run, with its reproducibility record."* → `report_scenario`
- *"Make a one-second GPS L1 scene with PRNs 3 and 17, then acquire and track it."* →
  `iq_signals`, `iq_scene`, `iq_acquire`, `iq_track`

## Design note — why a separate crate

The server is a **standalone, workspace-excluded crate** with its own `Cargo.lock`, so the
official Rust MCP SDK (software development kit) `rmcp` and its async runtime never enter the published `kshana`
crate's dependency graph: a library or Python user does not compile a server they do not
run. (It was first split out because `rmcp` is **edition 2024**, needing rustc ≥ 1.85,
while the main crate then promised 1.75. The library now declares 1.85; this server
declares 1.88, the floor of the security-patched `rmcp` 2.x.) Continuous integration (CI)
gates this crate on its own — tests and `cargo deny` against its lockfile. rmcp's licence tree is clean
(Apache-2.0/MIT/BSD), so, unlike the `xval/anise-frames` cross-validation crate it
otherwise mirrors, the split is not about licensing.

License: AGPL-3.0-only, the GNU Affero General Public License version 3 only (or a
commercial licence from Ashforde OÜ; see the repository's
[LICENSING.md](https://github.com/AshfordeOU/kshana/blob/main/LICENSING.md)).
