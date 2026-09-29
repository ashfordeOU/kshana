# `kshana-mcp` — Kshana as a Model Context Protocol server for AI agents

A [Model Context Protocol](https://modelcontextprotocol.io) (MCP) server that exposes the
**Kshana** PNT (positioning, navigation and timing) resilience simulator to AI (artificial
intelligence) agents and assistants — **Cursor, JetBrains AI Assistant / Junie, and any
MCP-compatible client** — over stdio (standard input and output).

Large language models are unreliable at the math Kshana is *validated* for: SGP4/SDP4
(Simplified General Perturbations 4 and its deep-space variant) orbit propagation, IAU
(International Astronomical Union) reference frames, Allan deviations, GNSS (global
navigation satellite system) availability and DOP (dilution of precision), ARAIM
(advanced receiver autonomous integrity monitoring) protection levels, GNSS/INS
(inertial navigation system) fusion and quantum-sensor models. This server lets an agent call the validated engine
instead of guessing: ask a question, the agent runs a real scenario and gets figures of
merit with provenance.

## Tools

| Tool | What it does |
|------|--------------|
| `run_scenario` | Run a scenario from a TOML (Tom's Obvious, Minimal Language) definition; returns the summary + full result JSON (JavaScript Object Notation: figures of merit, curves). Optional `include_chart` returns the chart as SVG (Scalable Vector Graphics). |
| `list_scenario_kinds` | The 75 built-in scenario kinds with descriptions + required/optional fields — so the agent can construct a valid scenario. |
| `validate_scenario` | Pre-flight check: parse the TOML and detect its kind, without running. |
| `export_sp3` | Export an `orbit` scenario's constellation as SP3-c (Standard Product 3, revision c) precise ephemeris. |
| `export_omm` | Export an `orbit` scenario's elements as a CCSDS (Consultative Committee for Space Data Systems) 502.0-B-2 OMM (Orbit Mean-elements Message) catalogue. |
| `export_oem` | Export an `orbit` scenario's state series as CCSDS OEM (Orbit Ephemeris Message) 2.0 ephemeris — the TEME (true equator, mean equinox) position *and* velocity series flight-dynamics tools (GMAT, the General Mission Analysis Tool; Orekit; STK, the Systems Tool Kit) read; the velocity-carrying complement of the position-only `export_sp3`. |
| `export_table_csv` | Run a scenario and return its reproducibility table as CSV (comma-separated values) — the byte-stable table the CLI (command-line interface) writes as `<scenario>.table.csv`. `realtime-frame-eop`, `lunar-time-budget`, `lunar-jamming`, `telecom-timing` and `leo-navmsg` always emit one, and `moonlight-service-volume` does when `export_site_lat_deg` + `export_site_lon_deg` are set; any other kind returns an error. |

Each tool is a thin, faithful wrapper over a public `kshana::api` function — no new
simulation logic lives here, so an agent runs exactly the validated engine.

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
- *"Run the Kshana clock-holdover scenario with a 20 ns threshold and a 2-hour GNSS
  outage; what's the quantum-vs-classical holdover?"* → `run_scenario`
- *"Export that GPS constellation as SP3."* → `export_sp3`
- *"Give me the realtime-frame-eop table as CSV."* → `export_table_csv`

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
