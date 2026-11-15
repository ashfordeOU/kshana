# OpenAPI description of the open HTTP endpoints

[`openapi.json`](openapi.json) is an OpenAPI 3.1 description of every HTTP endpoint the open engine
serves (roadmap 0.42 I11). Kshana hosts none of them: each is served by a process the operator runs.

| Process | Paths | Default address |
|---|---|---|
| `kshana station run <station.toml>` ([STATION.md](../STATION.md)) | `GET /health`, `GET /status`; and a status report `POST`ed to a fleet manager (the `stationFleetReport` webhook) | `127.0.0.1:8470` |
| `kshana trust-telemetry --listen <addr>` ([TRUST-TELEMETRY.md](../TRUST-TELEMETRY.md)) | `GET /metrics`, `GET /healthz` | the address given |
| `kshana-mcp --http <addr>` ([deploy/mcp-http.md](../deploy/mcp-http.md)) | `POST /mcp` (MCP JSON-RPC; the tool list comes from `tools/list`) | the address given, loopback by default |

How it is kept true:

- `tests/openapi_doc_sync.rs` reads the routes from the code that serves them (`src/station.rs`,
  `src/telemetry/prometheus.rs`, `mcp/kshana-mcp/src/http.rs`) and fails when the paths or methods
  differ from this file, when the Station status schema differs from the keys the code writes, or when
  a `$ref` does not resolve.
- The `api-description` CI job lints the file with Redocly's OpenAPI linter (pinned version).
- `scripts/check-version-sync.sh` holds `info.version` to the engine version.
- The MCP tool list is held to the server's tools by `tests/scenario_count_doc_sync.rs`
  (`the_mcp_readme_lists_exactly_the_tools_the_server_serves`).

The Pro service publishes its own OpenAPI document from its route table; this file covers only the
open endpoints.
