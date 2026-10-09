# Where each capability is reachable

Every capability is available on the surfaces where it makes sense; where one cannot carry a
capability, the cell says **N/A** and why. The same engine runs behind every surface: the
Python, WebAssembly and MCP entry points for the 0.35 capabilities are thin wrappers over
`kshana::surface`, which calls the code the command line runs.

Surfaces: **CLI** (`kshana`), **Rust** (the `kshana` crate), **Python** (`pip install kshana`),
**WASM** (`npm install kshana`, the browser), **MCP** (`kshana-mcp`, for AI agents), **Plugin**
(the Claude Code plugin: slash commands and skills over the MCP server), **JetBrains** (IDE
actions that run the CLI), **Notebook** (`notebooks/`).

| Capability | CLI | Rust | Python | WASM | MCP | Plugin | JetBrains | Notebook |
|---|---|---|---|---|---|---|---|---|
| Vessel receiver-trust, batch log (0-100 score, reasons) | `receiver-trust` | `receiver_trust::scenario::run_toml` | `receiver_trust` | `receiver_trust` | `assess_receiver_log` | `/kshana-assess-receiver`, skill `vessel-receiver-trust` | Assess Receiver Trust | `vessel-trust-and-training` |
| Receiver-trust on a stream excerpt, with the gate's output | `receiver-trust live` | `surface::assess_vessel_stream` | `receiver_trust_replay` | `receiver_trust_replay` | `assess_vessel_stream` | same | CLI only (see below) | `vessel-trust-and-training` |
| `receiver-trust live` as a running process (stdin, followed file, TCP, UDP, `--gate`, `--listen`) | `receiver-trust live` | `receiver_trust::live::LiveEngine` | **N/A** | **N/A** | **N/A** | **N/A** | **N/A** | **N/A** |
| Training NMEA with an instructor log | `nmea-scenario` | `nmea_synth::generate_from_toml` | `nmea_training` | `nmea_training` | `generate_training_nmea` | `/kshana-training-scenario`, skill `training-nmea-scenario` | Generate Training NMEA | `vessel-trust-and-training` |
| Training NMEA streamed to a TCP or UDP address | `nmea-scenario --tcp/--udp` | `nmea_synth::stream` | **N/A** | **N/A** | **N/A** | **N/A** | **N/A** | **N/A** |
| Interference map (ADS-B, AIS) | `interference-map adsb\|ais` | `surface::interference_map` | `interference_map` | `interference_map` | `build_interference_map` | `/kshana-interference-map`, skill `interference-map-route-exposure` | Build Interference Map | `interference-map-route-exposure` |
| Route exposure | `route-exposure` | `surface::route_exposure` | `route_exposure` | `route_exposure` | `route_exposure` | same | Route Exposure | `interference-map-route-exposure` |
| Land-polygon download (`interference-map fetch-land`) | `--allow-network` | CLI code | **N/A** | **N/A** | **N/A** | **N/A** | **N/A** | **N/A** |

## Why the N/A cells are N/A

- **A running process.** `receiver-trust live` holds a stream open, can serve the gated stream
  to any number of TCP clients and runs until it is stopped. A Python call, a browser call, an
  MCP tool call and an IDE action each return when they finish and do not hold a socket open
  for others. Each of those surfaces carries the bounded form instead: an excerpt replayed
  through the same engine, with the gate's output returned as text and written to no port.
  The same holds for streaming training NMEA to an address: Python, WASM and MCP return the
  generated text, and the CLI sends it.
- **The land download.** It is the only command that opens a network connection, it needs the
  system `curl` and an explicit `--allow-network`, and it checks a pinned SHA-256. The browser
  has no `curl`, and an AI agent should not fetch data on a user's behalf; the other surfaces
  take the land file as text instead (`land_geojson`).
- **Trace archives and directories.** `interference-map adsb` on a readsb trace directory reads
  files from disk and is command-line only; the in-memory surfaces take CSV text.

## Limits that differ by surface

| Surface | Input limit | Files |
|---|---|---|
| MCP | 4 MiB per text input; replies carry at most 2000 NMEA lines, 200 non-nominal epoch lines and 4 MiB of GeoJSON | reads and writes none for these tools; `assess_receiver_log` refuses a `path` source |
| Python, Rust | 64 MiB per text input | `receiver_trust` may name a `path` the process can read |
| WASM | 64 MiB per text input, inside the browser's own memory | none: the browser has no file system, nothing is uploaded |

## Evidence tiers and caveats on every surface

- The receiver-trust monitors and the trust score are **MODELLED**: thresholds are stated
  inputs and nothing asserts how they perform against real interference. The output is
  **advisory**; Kshana is not type-approved navigation equipment (IEC 61108, IEC 61162) and
  the operator remains responsible. A high score is not proof of a genuine fix.
- The interference map is **MODELLED** (pre-registered thresholds, not validated against a
  ground-truth measurement). A degraded cell does not identify interference as the cause; a
  cell not observed is not evidence of a clear route; it describes past reports and is not a
  forecast. It is aggregate only: no identifier is returned.
- Training NMEA is **text only**: no RF, IQ or waveform is synthesised, nothing is transmitted,
  and it is never for a vessel's live navigation systems.
