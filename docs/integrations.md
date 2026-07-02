# Use Kshana inside your AI agent

Kshana ships an [MCP](https://modelcontextprotocol.io) server, **`kshana-mcp`**, that exposes
the validated engine as agent tools. MCP is the shared plugin protocol, so the *same* server
plugs into Claude Code, Claude Desktop, Codex, Cursor, VS Code, Windsurf, and JetBrains — the
agent calls the real, externally-validated engine instead of guessing the math.

Tools exposed: `run_scenario`, `list_scenario_kinds`, `validate_scenario`, `export_sp3`,
`export_omm` — each a thin, faithful wrapper over a public `kshana::api` function.

## 1. Install the server (once)

```sh
# crates.io — a Rust toolchain builds the prebuilt source onto your PATH (~/.cargo/bin):
cargo install kshana-mcp

# …or Docker / OCI — no Rust toolchain, amd64 + Apple Silicon:
docker run --rm -i ghcr.io/ashfordeou/kshana-mcp
```

Every host below runs the same stdio server. Where a host wants an absolute path, it's
usually `~/.cargo/bin/kshana-mcp` (run `command -v kshana-mcp` to confirm).

## 2. Wire it into your host

### Claude Code

Fastest — one command:

```sh
claude mcp add kshana -- kshana-mcp
```

Or install the **plugin** (bundles the server, adds a `/kshana-run` command):

```
/plugin marketplace add ashfordeOU/kshana
/plugin install kshana@ashforde
```

Docker instead of the binary:

```sh
claude mcp add kshana -- docker run --rm -i ghcr.io/ashfordeou/kshana-mcp
```

### Claude Desktop

Edit `claude_desktop_config.json` (Settings → Developer → Edit Config):

```json
{
  "mcpServers": {
    "kshana": { "command": "kshana-mcp", "args": [] }
  }
}
```

### Codex CLI

Add to `~/.codex/config.toml`:

```toml
[mcp_servers.kshana]
command = "kshana-mcp"
args = []
```

### Cursor

`.cursor/mcp.json` (project) or `~/.cursor/mcp.json` (global):

```json
{
  "mcpServers": {
    "kshana": { "command": "kshana-mcp", "args": [] }
  }
}
```

### VS Code (Copilot agent mode / Continue)

`.vscode/mcp.json`:

```json
{
  "servers": {
    "kshana": { "type": "stdio", "command": "kshana-mcp", "args": [] }
  }
}
```

### Windsurf

`~/.codeium/windsurf/mcp_config.json`:

```json
{
  "mcpServers": {
    "kshana": { "command": "kshana-mcp", "args": [] }
  }
}
```

### JetBrains AI Assistant / Junie

Settings → Tools → AI Assistant → MCP → add a stdio server with command `kshana-mcp`.

## 3. Try it

Ask the agent something the engine is validated for, e.g.:

> "Use kshana: run a clock-holdover scenario with an optical clock through a 1-hour GNSS
> outage and report the p95 timing error and availability."

The agent calls `list_scenario_kinds` → builds the TOML → `run_scenario`, and reports figures
of merit with a `scenario + seed + engine version` provenance line — reproducible, not guessed.

## Notes

- **Absolute paths:** if a host can't find `kshana-mcp`, give the full path from
  `command -v kshana-mcp` (typically `~/.cargo/bin/kshana-mcp`).
- **Docker form:** replace `"command": "kshana-mcp", "args": []` with
  `"command": "docker", "args": ["run", "--rm", "-i", "ghcr.io/ashfordeou/kshana-mcp"]`.
- **Registry:** the server is also published to the [MCP registry](https://registry.modelcontextprotocol.io)
  (`io.github.ashfordeOU/kshana-mcp`) and listed on [Glama](https://glama.ai/mcp/servers/ashfordeOU/kshana).
