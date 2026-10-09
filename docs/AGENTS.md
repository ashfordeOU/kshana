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
| Was this receiver log, or this vessel's NMEA, trustworthy, and when did it stop being? | `assess_receiver_log` (whole log), `assess_vessel_stream` (excerpt, optional gate) | `/kshana-assess-receiver` |
| I need synthetic NMEA with a jamming, drag-off, time-spoof or replay event for training | `generate_training_nmea` | `/kshana-training-scenario` |
| Where has GNSS looked degraded, and how much of this route is in it? | `build_interference_map`, then `route_exposure` | `/kshana-interference-map` |
| GNSS IQ recordings (scene, acquire, track, front-end, campaigns) | `iq_signals` first, then the `iq_*` tools | |

The skills `vessel-receiver-trust`, `training-nmea-scenario` and `interference-map-route-exposure`
carry the rules below for agents that load skills.

## What each tool will not do

- **Read or write files** (the 0.35 tools). Inputs are text in the request, capped at 4 MiB;
  `assess_receiver_log` refuses a `path` source. Only the `iq_*` tools touch a folder, and only the
  one named by `KSHANA_MCP_IQ_DIR`.
- **Run a process.** `receiver-trust live` as a running stream (with a gate and `--listen`) and
  streaming training NMEA to an address are command-line only. `assess_vessel_stream` replays
  an excerpt through the same engine and writes to no port.
- **Fetch data.** The land-polygon download is command-line only and needs `--allow-network`.
  Pass the land file, if wanted, as text. Use only data the user is licensed to use.
- **Transmit anything or synthesise RF.** The training generator writes NMEA text; the IQ layer
  writes sample files for software receivers.

## What to keep with the answer

| Output | Keep |
|---|---|
| Receiver trust score | **Advisory**: not type-approved navigation equipment (IEC 61108, IEC 61162); the operator remains responsible. **MODELLED**. State the vessel's limits before the run and do not tune a threshold to a result. A high score is not proof of a genuine fix; the checks cannot see a spoofer consistent with every other sensor. |
| Gate output | Returned as text only. It marks a fix invalid while untrusted; it is not applied to any receiver. |
| Training NMEA | **Text only**, for training and testing, **never** for a vessel's live navigation systems. Return the seed and the instructor log. |
| Interference map, route exposure | A degraded cell does **not** identify interference as the cause. A cell not observed is **not** evidence of a clear route. Past reports, **not a forecast**. **MODELLED**. Aggregate only: do not try to recover identifiers. ADS-B and AIS maps stay separate. |
| Any scenario result | The `figure_tiers` or `label` it states, and the provenance line. |

## Boundaries

Use synthetic or the user's own data. Do not name people, vessels or organisations in outputs
that were not in the user's input. Kshana is an analysis and training tool, not a flight or
navigation product.
