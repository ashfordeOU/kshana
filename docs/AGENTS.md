# Using Kshana from an AI agent

For an agent (or the person directing one): which tool to call for which question, what the
tools will and will not do, and what to keep with every answer. Surfaces and the cells that are
not available on a given surface: [`SURFACES.md`](SURFACES.md).

## Connect

```sh
cargo install kshana-mcp            # or: docker run --rm -i ghcr.io/ashfordeou/kshana-mcp
```

Claude Code: `/plugin marketplace add ashfordeOU/kshana`, then `/plugin install kshana@ashforde`.
Other MCP clients (Cursor, JetBrains AI Assistant, desktop assistants): see
[`mcp/kshana-mcp/README.md`](../mcp/kshana-mcp/README.md). If the tools are not there, the server
is not connected: say so rather than estimating the figures.

## The rule for every answer

Run the engine; do not guess the numbers. Report what a tool returned with its unit and its
evidence tier (VALIDATED against an external oracle, or MODELLED), the scenario, the seed and the
engine version, so the run can be repeated. Keep each result's own caveats with it.

## Which tool for which question

| The question | Tool (MCP) | Slash command |
|---|---|---|
| Run or explain a PNT scenario (orbits, GNSS, timing, fusion, lunar, ...) | `list_scenario_kinds`, `list_example_scenarios`, `get_example_scenario`, `validate_scenario`, `run_scenario`, `report_scenario`, `animate_scenario`, `export_*` | `/kshana-run` |
| Was this receiver log, or this vessel's NMEA, trustworthy, and when did it stop being? | `assess_receiver_log` (any log format), `assess_vessel_log` (vessel NMEA, batch), `assess_vessel_stream` (bounded excerpt) | `/kshana-assess-receiver` |
| I need synthetic NMEA with a jamming, drag-off, time-spoof or replay event for training | `generate_training_nmea` | `/kshana-training-scenario` |
| Make a tamper-evident record of what the engine said about a window of a vessel's log, or check one | `create_evidence_pack`, `verify_evidence_pack` | `/kshana-evidence-pack` |
| I need a scenario's vehicle motion and event times to replay through a laboratory GNSS simulator | `export_test_bench` | `/kshana-bench-export` |
| Which public-framework requirement rows do these runs support evidence for, and what is the gap? | `compliance_report` (from result text), `compliance_mapping` (the tables, no runs) | `/kshana-compliance-report` |
| I need a scenario to fly a GeoJSON route (terrain-nav, terrain-slam, gravity-map, combined-altpnt) | `import_route` | `/kshana-import-route` |
| Where has GNSS looked degraded, and how much of this route is in it? | `build_interference_map`, then `route_exposure` | `/kshana-interference-map` |
| GNSS IQ recordings (scene, acquire, track, front-end, campaigns) | `iq_signals` first, then the `iq_*` tools | `/kshana-iq` |

The skills `vessel-receiver-trust`, `training-nmea-scenario`, `compliance-mapping`, `test-bench-export`, `gnss-iq` and `interference-map-route-exposure`
carry the rules below for agents that load skills.

## What each tool will not do

- **Read or write files.** Content is inline: inputs are text in the request, capped at 4 MiB, and
  a scenario field that names a file is refused. Only the `iq_*` tools touch a folder, and only the
  one named by `KSHANA_MCP_IQ_DIR`, with every path confined to it.
- **Run a process.** `receiver-trust live` as a running stream (with a gate and `--listen`), the
  telemetry exporters (`trust-telemetry`: Prometheus, syslog, OTLP) and streaming training NMEA to
  an address are command-line only. `assess_vessel_stream` scores an excerpt with the same engine
  and writes to no port. The excerpt tools return live JSON-lines schema 1.2 (an `advisory` statement on every epoch); a vessel run's CSV begins with a `#` comment line carrying the same statement, so read it with a comment option. `--udp` and `--listen tcp:` bind the loopback address unless told otherwise.
- **Write a signal.** `export_test_bench` returns vehicle motion and labelled event intervals as text; nothing it returns is, models or drives a radio-frequency or baseband signal, and an event is not a recipe for producing interference. Give its `notice` with the files; the simulator and its operator are responsible for running them only where authorised.
- **Say more than the mapping says.** `compliance_report` states which framework rows a set of runs supports evidence for, with each row's gap. It never says a framework is met or a product is rated or approved; carry its `statement` verbatim and say "supports evidence for", nothing stronger. It reads result and scenario text you pass in, never a path.
- **Fetch data.** The land-polygon download is command-line only and needs `--allow-network`.
  Pass the land file, if wanted, as text. Use only data the user is licensed to use.
- **Transmit anything or synthesise RF.** The training generator writes NMEA text; the IQ layer
  writes sample files for software receivers.

## What to keep with the answer

| Output | Keep |
|---|---|
| Receiver trust score | **Advisory**: not type-approved navigation equipment (IEC 61108, IEC 61162); the operator remains responsible. **MODELLED**. State the vessel's limits before the run and do not tune a threshold to a result. A high score is not proof of a genuine fix; the checks cannot see a spoofer consistent with every other sensor. |
| Evidence pack | A **technical record**, not a legal opinion, a finding of fact or an approval. Verify with the signer's public key obtained by another route; without it the verdict is `intact-signer-not-pinned`, which proves only integrity against the key the pack names itself: say "intact, signer not established", never "verified". Never return, log or ask for a signing seed in a conversation if the key matters: use the CLI. |
| Training NMEA | **Text only**, for training and testing, **never** for a vessel's live navigation systems. Return the seed and the instructor log. |
| Interference map, route exposure | A degraded cell does **not** identify interference as the cause. A cell not observed is **not** evidence of a clear route. Past reports, **not a forecast**. **MODELLED**. Aggregate only: do not try to recover identifiers. ADS-B and AIS maps stay separate. |
| Any scenario result | The `figure_tiers` or `label` it states, and the provenance line. |

## Boundaries

Use synthetic or the user's own data. Do not name people, vessels or organisations in outputs
that were not in the user's input. Kshana is an analysis and training tool, not a flight or
navigation product.
