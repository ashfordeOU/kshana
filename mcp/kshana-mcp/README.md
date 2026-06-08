# `kshana-mcp` — Kshana as an MCP server for AI agents

A [Model Context Protocol](https://modelcontextprotocol.io) server that exposes the
**Kshana** PNT-resilience simulator to AI agents and assistants — **Cursor, JetBrains
AI Assistant / Junie, and any MCP-compatible client** — over stdio.

LLMs are unreliable at the math Kshana is *validated* for (SGP4/SDP4, IAU reference
frames, Allan deviations, GNSS availability/DOP, ARAIM protection levels, GNSS/INS
fusion, quantum-sensor models). This server lets an agent call the validated engine
instead of guessing: ask a question, the agent runs a real scenario and gets figures of
merit with provenance.

## Tools

| Tool | What it does |
|------|--------------|
| `run_scenario` | Run a scenario from a TOML definition; returns the summary + full result JSON (FoMs, curves). Optional `include_chart` returns the SVG. |
| `list_scenario_kinds` | The ~17 built-in scenario kinds with descriptions + required/optional fields — so the agent can construct a valid scenario. |
| `validate_scenario` | Pre-flight check: parse the TOML and detect its kind, without running. |
| `export_sp3` | Export an `orbit` scenario's constellation as SP3-c precise ephemeris. |
| `export_omm` | Export an `orbit` scenario's elements as a CCSDS 502.0-B-2 OMM catalogue. |

Each tool is a thin, faithful wrapper over a public `kshana::api` function — no new
simulation logic lives here, so an agent runs exactly the validated engine.

## Install

Pick whichever fits — all run the same server over stdio.

```sh
# crates.io (a Rust toolchain installs the prebuilt source):
cargo install kshana-mcp

# Docker / OCI — no Rust toolchain needed, works on amd64 + Apple Silicon:
docker run --rm -i ghcr.io/ashfordeou/kshana-mcp

# From a checkout (development):
cd mcp/kshana-mcp && cargo install --path .

# Bleeding edge, straight from git:
cargo install --git https://github.com/AshfordeOU/kshana kshana-mcp
```

`cargo install` puts `kshana-mcp` on your `PATH` (typically `~/.cargo/bin/kshana-mcp`).
The server talks JSON-RPC over stdio; logs go to stderr. Building from source needs a Rust
toolchain ≥ 1.85 (the `rmcp` SDK is edition 2024); the Docker image needs none.

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
  Protocol → Add → *As JSON*, paste the block, then fully restart the IDE.
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

## Design note — why a separate crate

The official Rust MCP SDK `rmcp` is **edition 2024** (needs rustc ≥ 1.85). `cargo`
resolves edition for the whole dependency graph at build time, so this server cannot be
a feature of the main `kshana` crate (whose MSRV is 1.75) — it is a **standalone,
workspace-excluded crate** with its own `Cargo.lock`, invisible to root `cargo` and to
the published `kshana` crate. (rmcp's license tree is clean Apache-2.0/MIT/BSD, so there
is no `cargo deny` concern — the edition is the sole reason for isolation.) This mirrors
the `xval/anise-frames` cross-validation crate.

License: Apache-2.0.
