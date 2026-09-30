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

Each tool is a thin, faithful wrapper over a public function of the `kshana` library — no
new simulation logic lives here, so an agent runs exactly the validated engine.

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
scenario files on disk and this server reads no file. Run each member with `run_scenario`.

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
