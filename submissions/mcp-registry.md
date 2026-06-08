# MCP server listings — one-click submission kit

Pre-built submissions to get `kshana-mcp` discoverable in the MCP ecosystem. Each is an
external action for the founder (these are public submissions). Do them in order.

The server is built and tested in-repo (`mcp/kshana-mcp/`); the manifest is
`mcp/kshana-mcp/server.json` (MCP registry schema).

---

## 0. Prerequisite — publish `kshana-mcp` to crates.io

The registry listing and the cleanest install (`cargo install kshana-mcp`) both want the
crate on crates.io. `kshana` itself is already published; publish the server:

```sh
# from the repo root, with a crates.io token already set (cargo login)
cargo publish -p kshana-mcp --manifest-path mcp/kshana-mcp/Cargo.toml
```

The crate uses `kshana = { path = "../..", version = "0.14" }`, so `cargo publish`
records the version requirement and resolves against the published `kshana` crate.
(crates.io publishes are permanent — yank-only — so this is founder-gated.)

---

## 1. Official MCP registry (registry.modelcontextprotocol.io)

The canonical registry. Authenticated by proving GitHub ownership of the
`io.github.AshfordeOU` namespace (matches the `name` in `server.json`).

```sh
# Install the official publisher CLI (Go), then from mcp/kshana-mcp/:
mcp-publisher login github         # opens a browser to auth the AshfordeOU org
mcp-publisher publish              # validates + publishes ./server.json
```

If the schema has moved on, regenerate the skeleton with `mcp-publisher init` and copy
the `packages`/`repository` blocks from the committed `server.json`.

---

## 2. `awesome-mcp-servers` (the high-traffic discovery list)

Fork <https://github.com/punkpeye/awesome-mcp-servers>, add the line below under a
relevant category (e.g. **🔬 Science & Education** or **📊 Data Platforms**), and open a PR.
Ready-to-paste entry:

```markdown
- [AshfordeOU/kshana](https://github.com/AshfordeOU/kshana) 🦀 🏠 - Run the validated **Kshana** positioning/navigation/timing (PNT) resilience simulator from an agent — SGP4/SDP4 orbits, IAU reference frames (cross-validated vs SPICE), Allan deviations, GNSS availability/DOP, ARAIM protection levels, GNSS/INS fusion, and quantum-sensor models. `cargo install kshana-mcp`.
```

(Legend: 🦀 = Rust, 🏠 = local/stdio. Adjust the emoji to match the list's current legend.)

PR title: `Add kshana — PNT-resilience / GNSS simulator`.

---

## 3. Aggregators (lower-effort, mostly auto-indexed once #1 lands)

- **Smithery** (<https://smithery.ai>) — "Add server", point it at the GitHub repo; it reads `server.json`.
- **mcp.so** (<https://mcp.so/submit>) — submit the repo URL.
- **Glama** (<https://glama.ai/mcp/servers>) — auto-indexes public GitHub MCP servers; submitting the repo speeds it up.
- **PulseMCP** (<https://www.pulsemcp.com>) — "Submit a server" with the repo URL.

---

## One-paragraph blurb (reuse anywhere)

> **kshana-mcp** exposes the open, reproducible **Kshana** PNT-resilience simulator to AI
> agents over MCP. Instead of guessing orbital, timing, or GNSS-integrity math, an agent
> runs the *validated* engine — SGP4/SDP4 (4.12 mm vs the AIAA reference), IAU 2006/2000A
> reference frames (cross-validated against ANISE/SPICE), Allan deviations (NIST SP1065),
> GNSS availability/DOP, ARAIM/DO-229E protection levels, GNSS/INS fusion, and
> quantum-sensor performance models — and gets figures of merit with provenance. Works in
> Cursor, JetBrains AI Assistant/Junie, and any MCP client. `cargo install kshana-mcp`.
