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
| Vessel receiver-trust, batch log (0-100 score, reasons) | `receiver-trust` | `receiver_trust::assess::assess_vessel_log` | `receiver_trust`, `assess_vessel_log` | `receiver_trust`, `assess_vessel_log` | `assess_receiver_log`, `assess_vessel_log` | `/kshana-assess-receiver`, skill `vessel-receiver-trust` | Assess Receiver Trust | `vessel-trust-and-training` |
| Receiver-trust on a bounded stream excerpt (scores, states, reasons; no gate) | `receiver-trust live` | `receiver_trust::assess::assess_stream_excerpt` | `receiver_trust_replay` | `receiver_trust_replay` | `assess_vessel_stream` | same | CLI only | `vessel-trust-and-training` |
| `receiver-trust live` as a running process (stdin, followed file, TCP, UDP, `--gate`, `--listen`) | `receiver-trust live` | `receiver_trust::live::LiveEngine` | **N/A** | **N/A** | **N/A** | **N/A** | **N/A** | **N/A** |
| Evidence pack: create (signed, window of a log) | `receiver-trust evidence` | `evidence::create_bundle`, `surface::evidence_create` | `evidence_create` | **N/A** (signing key) | `create_evidence_pack` | `/kshana-evidence-pack`, skill `evidence-pack` | Create Evidence Pack | `vessel-trust-and-training` |
| Evidence pack: verify | `evidence verify` | `evidence::verify_bundle` | `evidence_verify` | `evidence_verify` | `verify_evidence_pack` | same | Verify Evidence Pack (pinned key only) | `vessel-trust-and-training` |
| Trust telemetry (Prometheus, syslog CEF/LEEF, OTLP) | `trust-telemetry` | `telemetry` | **N/A** | **N/A** | **N/A** | **N/A** (how-to) | **N/A** (how-to) | **N/A** |
| Training NMEA with an instructor log | `nmea-scenario` | `nmea_synth::generate_from_toml` | `nmea_training` | `nmea_training` | `generate_training_nmea` | `/kshana-training-scenario`, skill `training-nmea-scenario` | Generate Training NMEA | `vessel-trust-and-training` |
| Training NMEA streamed to a TCP or UDP address | `nmea-scenario --tcp/--udp` | `nmea_synth::stream` | **N/A** | **N/A** | **N/A** | **N/A** | **N/A** | **N/A** |
| Interference map (ADS-B, AIS) | `interference-map adsb\|ais` | `interference_map::api` | `interference_map` | `interference_map` | `build_interference_map` | `/kshana-interference-map`, skill `interference-map-route-exposure` | Build Interference Map | `interference-map-route-exposure` |
| Route exposure | `route-exposure` | `interference_map::api::route_exposure` | `route_exposure` | `route_exposure` | `route_exposure` | same | Route Exposure | `interference-map-route-exposure` |
| Signal K plugin and OpenCPN gate feed (`docs/MARINE-INTEGRATIONS.md`) | `integrations/`, `receiver-trust live --gate --listen` | **N/A** (processes) | **N/A** | **N/A** | **N/A** | how-to only: `/kshana-marine-integrations`, skill `marine-integrations` | **N/A** | **N/A** |
| Test-bench export (motion CSV, NMEA, waypoints, events for a laboratory simulator) | `bench-export` | `interop::testbench::export_with_notes`, `surface::bench_export` | `bench_export` | `bench_export` | `export_test_bench` | `/kshana-bench-export`, skill `test-bench-export` | Export Test-Bench Files | **N/A** |
| Compliance mapping from runs (which public-framework rows the runs support evidence for) | `compliance-report` | `compliance::assess_texts`, `surface::compliance_report` | `compliance_report` | `compliance_report` | `compliance_report` | `/kshana-compliance-report`, skill `compliance-mapping` | Build Compliance Report | **N/A** |
| Compliance mapping tables and sources | `compliance-report --mapping`, `--sources` | `compliance::mapping`, `surface::compliance_mapping` | `compliance_mapping` | `compliance_mapping` | `compliance_mapping` | same | Show Compliance Mapping | **N/A** |
| Land-polygon download (`interference-map fetch-land`) | `--allow-network` | CLI code | **N/A** | **N/A** | **N/A** | **N/A** | **N/A** | **N/A** |

## Why the N/A cells are N/A

- **Signal K and OpenCPN.** They are consumers of the running live process and of its TCP gate, so
  they are command-line deployments; the plugin carries a how-to command and a skill that point to
  `docs/MARINE-INTEGRATIONS.md` and call no tool.

- **A running process.** `receiver-trust live` holds a stream open, can serve the gated stream
  to any number of TCP clients and runs until it is stopped. A Python call, a browser call, an
  MCP tool call and an IDE action each return when they finish and do not hold a socket open
  for others. Python, WASM and MCP carry the bounded form instead: an excerpt scored by the
  same engine, in the live schema (JSON lines 1.2: `position` and an `advisory` statement on every
  epoch), with no socket and no gate (the gate marks a fix invalid on a live stream, which only a
  process in the data path can do). Two behaviours belong to the process and are not in the
  excerpt tools: a stream replayed faster than real time through `receiver-trust live` without
  `--replay` is scored untrusted (its time disagrees with the host clock; an excerpt is read
  without a host clock), and `--udp <port>` and `--listen tcp:<port>` bind the loopback address
  unless an address is given.
- **Trust telemetry.** `trust-telemetry` serves Prometheus metrics, sends syslog and exports
  OpenTelemetry from a running stream, so it is a process by nature. How-to: pipe the live
  command into it, or replay a result file (`kshana trust-telemetry --result session.result.json
  --print-metrics`); see [`TRUST-TELEMETRY.md`](TRUST-TELEMETRY.md). An agent or a notebook that
  wants the per-epoch scores calls the batch or excerpt functions instead.
- **Creating a pack in the browser.** Signing needs a private key, which should not pass
  through a web page; the browser build verifies packs (`evidence_verify`) and the other
  surfaces create them. The MCP tool never returns or logs the signing seed, and without one it
  signs with a one-time key (integrity, not identity); for a key that matters, use the CLI.
  The same holds for streaming training NMEA to an address: Python, WASM and MCP return the
  generated text, and the CLI sends it.
- **Study suites.** `--study <suite.toml>` runs a manifest that names sibling scenario files on
  disk. The in-memory surfaces take scenario text, not a folder of files, so they run each member
  as a scenario instead (`run`, `run_scenario`, `run_all`).
- **GNSS IQ in the browser, and recordings that are rewritten.** A recording is gigabytes of
  samples, which a page cannot hold and the MCP protocol must not carry, so WASM has no IQ
  functions and the MCP tools read and write one work directory only (`KSHANA_MCP_IQ_DIR`, with a
  per-call sample budget). `iq extract`, `convert` and `decimate` exist to rewrite recordings on
  disk and stay command-line only. `iq labfit` and `iq conditions` carry text, so MCP takes them
  inline (a log that names a file is refused).
- **The land download.** It is the only command that opens a network connection, it needs the
  system `curl` and an explicit `--allow-network`, and it checks a pinned SHA-256. The browser
  has no `curl`, and an AI agent should not fetch data on a user's behalf; the other surfaces
  take the land file as text instead (`land_geojson`).
- **Trace archives and directories.** `interference-map adsb` on a readsb trace directory reads
  files from disk and is command-line only; the in-memory surfaces take CSV text.

## Every command-line subcommand, and who covers it

One row per subcommand or mode of `kshana --help`. **yes** names the entry point; **no** is a gap
with its reason; **N/A** is a surface that cannot carry it for the reason given above or in the
last column. JetBrains actions run the command line, so a "CLI only" there means no IDE action
exists yet.

| Subcommand | Python | WASM | MCP | Plugin | JetBrains | Notebook | Note |
|---|---|---|---|---|---|---|---|
| `kshana <scenario.toml>` (run, chart, table) | `run`, `run_full`, `run_typed` | `run`, `chart_svg`, `summary`, `table_csv`, `run_all` | `run_scenario`, `report_scenario`, `export_table_csv` | `/kshana-run` | Run Kshana Scenario | `quantum-vs-classical-gdop` | |
| `--validate <scenario.toml>` | `validate_toml` | `error_kind` (a run throws on an invalid scenario) | `validate_scenario` | `/kshana-run` | CLI only | | |
| `--study <suite.toml>` | N/A | N/A | N/A | N/A | CLI only | | A suite names sibling scenario files on disk (N/A above); run each member as a scenario |
| `--export-sp3/-omm/-oem` | `export_sp3`, `export_omm`, `export_oem` | `export_sp3`, `export_omm`, `export_oem` | `export_sp3`, `export_omm`, `export_oem` | `/kshana-run` | CLI only | | |
| `--export <czml,kml,geojson,stk,sigmf>` | `export_scenario`, `export_formats` | `export_scenario`, `export_formats` | `export_interop`, `list_export_formats` | `/kshana-run` | Export Scenario | | Files come back as text (`utf-8`) or base64 (the SigMF samples) |
| `--import-route` | `import_route` | `import_route` | `import_route` | `/kshana-import-route` | Import Route | | |
| `--animate <svg,html,frames>` | `animate_scenario` | `animate_scenario` | `animate_scenario` | `/kshana-run` | Animate Scenario | | At most 120 frames per call; longer sequences use the CLI |
| `kinds [--json]` | `scenario_kinds`, `list_kinds` | `list_kinds` | `list_scenario_kinds` | `/kshana-run` | CLI only | | |
| `example [<name>]` | `list_examples`, `get_example` | `list_examples`, `get_example` | `list_example_scenarios`, `get_example_scenario` | `/kshana-run` | Insert Example Scenario | | The `python` and `wasm` features compile the example text in (about 0.7 MB) |
| `receiver-trust <scenario.toml>` (batch) | `receiver_trust`, `assess_vessel_log` | `receiver_trust`, `assess_vessel_log` | `assess_receiver_log`, `assess_vessel_log` | `/kshana-assess-receiver` | Assess Receiver Trust | `vessel-trust-and-training` | |
| `receiver-trust live` | excerpt: `receiver_trust_replay` | excerpt: `receiver_trust_replay` | excerpt: `assess_vessel_stream` | excerpt | CLI only | | A running process; the excerpt has no socket and no gate (N/A above) |
| `trust-telemetry` | N/A | N/A | N/A | how-to | N/A | | A process (N/A above) |
| `receiver-trust evidence` (create a pack) | `evidence_create` | N/A | `create_evidence_pack` | `/kshana-evidence-pack` | Create Evidence Pack | `vessel-trust-and-training` | No signing key in a browser |
| `evidence verify` | `evidence_verify` | `evidence_verify` | `verify_evidence_pack` | `/kshana-evidence-pack` | Verify Evidence Pack (pinned key only) | `vessel-trust-and-training` | |
| `evidence keygen` | `evidence_keygen` | N/A | N/A | N/A | CLI only | | Python returns the key in memory with a warning; a private key should not pass through a conversation or a page |
| `evidence attach-timestamp` | `evidence_attach_timestamp` | `evidence_attach_timestamp` | `attach_evidence_timestamp` | `/kshana-evidence-pack` | Attach Timestamp | | Token as bytes or base64, updated pack returned in memory; the authority's signature is not checked (`openssl ts -verify`) |
| `nmea-scenario <scenario.toml>` | `nmea_training` | `nmea_training` | `generate_training_nmea` | `/kshana-training-scenario` | Generate Training NMEA | `vessel-trust-and-training` | |
| `nmea-scenario --tcp/--udp` | N/A | N/A | N/A | N/A | CLI only | | Sends to an address (N/A above) |
| `interference-map adsb\|ais` (CSV) | `interference_map` | `interference_map` | `build_interference_map` | `/kshana-interference-map` | Build Interference Map | `interference-map-route-exposure` | |
| `interference-map adsb` (trace directory) | N/A | N/A | N/A | N/A | CLI only | | Reads a directory (N/A above) |
| `interference-map fetch-land` | N/A | N/A | N/A | N/A | CLI only | | Network access (N/A above) |
| `route-exposure` | `route_exposure` | `route_exposure` | `route_exposure` | `/kshana-interference-map` | Route Exposure | `interference-map-route-exposure` | |
| `bench-export` | `bench_export` | `bench_export` | `export_test_bench` | `/kshana-bench-export` | Export Test-Bench Files | | Returns text, writes nothing; no signal |
| `compliance-report` | `compliance_report` | `compliance_report` | `compliance_report` | `/kshana-compliance-report` | Build Compliance Report | | |
| `compliance-report --mapping`, `--sources` | `compliance_mapping` | `compliance_mapping` | `compliance_mapping` | `/kshana-compliance-report` | Show Compliance Mapping | | |
| `iq scene` | `iq_scene`, `iq_scene_broadcast` | N/A | `iq_scene` | `/kshana-iq` | CLI only | | Samples are files |
| `iq acquire` | `iq_acquire`, `iq_acq_surface` | N/A | `iq_acquire` | `/kshana-iq` | CLI only | | |
| `iq track` | `iq_track`, `iq_loop_designs` | N/A | `iq_track` | `/kshana-iq` | CLI only | | |
| `iq sweep` | `iq_sweep` | N/A | `iq_sweep` | `/kshana-iq` | CLI only | | |
| `iq labfit` | `iq_labfit` | N/A | `iq_labfit` (logs inline, no files) | `/kshana-iq` | CLI only | | |
| `iq frontend` | `iq_frontend` | N/A | `iq_frontend` | `/kshana-iq` | CLI only | | |
| `iq monitor` | `iq_monitor` | N/A | `iq_monitor` | `/kshana-iq` | CLI only | | |
| `iq campaign`, `iq campaign report` | `iq_campaign`, `iq_campaign_report` | N/A | `iq_campaign`, `iq_campaign_status` | `/kshana-iq` | CLI only | | |
| `iq conditions` | `iq_test_conditions` | N/A | `iq_test_conditions` (text, inline) | `/kshana-iq` | CLI only | | |
| `iq inventory`, `info` | `iq_inventory`, `iq_info` | N/A | `iq_info` | `/kshana-iq` | CLI only | | Inventory of a folder is Python and CLI; the MCP server reads one work directory |
| `iq extract`, `convert`, `decimate` | N/A | N/A | N/A | N/A | CLI only | | They rewrite recordings on disk (N/A above) |
| the signal list (`iq --help`) | `iq_signals` | N/A | `iq_signals` | `/kshana-iq` | CLI only | | |

## Limits that differ by surface

| Surface | Input limit | Files |
|---|---|---|
| MCP | 4 MiB per text input (2 MiB and 20,000 epochs for a stream excerpt); replies carry at most 2000 NMEA lines, 200 non-nominal epoch lines and 4 MiB of GeoJSON or pack files | inline content only: a scenario field that names a file is refused; the `iq_*` tools use one opt-in work directory, with every path confined to it |
| MCP over HTTP (`--http`, self-hosted) | as MCP, with a 5 MiB request body, 120 s per request and 8 requests at once by default | none: the `iq_*` file tools are off; every other tool takes inline content |
| Python, Rust | 64 MiB per text input | `receiver_trust` may name a `path` the process can read |
| WASM | 64 MiB per text input, inside the browser's own memory | none: the browser has no file system, nothing is uploaded |

## Evidence tiers and caveats on every surface

- An evidence pack is a **technical record** of what the engine computed from a log under stated
  settings, with every hash and a signature over them. It is not a legal opinion, a finding of
  fact about any event or an approval. A pass of verify says the record is unchanged; with no
  trusted public key it proves only integrity against the key the pack names itself.
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
