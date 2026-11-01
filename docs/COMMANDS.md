<!-- SPDX-License-Identifier: AGPL-3.0-only -->
# Every command

`kshana <scenario.toml>` runs a scenario; every other command is a subcommand. `kshana --help` prints the
usage of all of them, and each subcommand's own `--help` lists its flags. The examples run from a checkout.

| Command | What it does | Example | Docs |
|---|---|---|---|
| `kshana <scenario.toml>` | runs a scenario of any kind and writes its result, chart and report | `kshana scenarios/clock-holdover.toml` | [Scenarios](SCENARIOS.md) |
| `kshana --study <suite.toml>` | runs a suite of scenarios into one aggregated, stamped study | `kshana --study scenarios/quantum-pnt-demonstrator.suite.toml` | [Usage](../README.md#usage) |
| `kshana --validate <scenario.toml>` | lints a scenario without running it | `kshana --validate scenarios/gnss-ins.toml` | [Usage](../README.md#usage) |
| `kshana kinds [--json]` | lists every scenario kind with its required and optional fields | `kshana kinds` | [Kinds](KINDS.md) |
| `kshana example [<name>]` | prints a bundled scenario to start from | `kshana example clock-holdover > clock-holdover.toml` | [Scenarios](SCENARIOS.md) |
| `kshana receiver-trust <scenario>` | scores a receiver log, `live` scores a stream, `evidence` writes a signed pack | `kshana receiver-trust examples/receiver-trust/session.toml` | [Receiver trust](RECEIVER-TRUST.md) |
| `kshana evidence keygen`, `verify`, `attach-timestamp`, `round-trip` | signs, verifies and timestamps evidence packs and links a lab run to its score | `kshana evidence keygen --out signer.key` | [Evidence packs](EVIDENCE-PACKS.md) |
| `kshana jammertest import`, `score` | reads the published Jammertest plan and scores a log against it | `kshana jammertest score --help` | [Jammertest](JAMMERTEST.md) |
| `kshana trust-telemetry` | the trust stream as Prometheus, CEF, LEEF, OTLP or MQTT messages | `kshana trust-telemetry --result session.result.json --print-metrics` | [Trust telemetry](TRUST-TELEMETRY.md) |
| `kshana imu-fit <imu.csv>` | fits hybrid sensor parameters off a stationary IMU log | `kshana imu-fit still.csv --axis x --expected-mean 0 --id bench-imu` | [Machine inputs](MACHINE-INPUTS.md) |
| `kshana nmea-scenario <scenario>` | writes synthetic bridge NMEA with scripted jamming and spoofing, and an instructor log | `kshana nmea-scenario scenarios/training/coastal-drag-off.toml --out drag.nmea` | [NMEA training](NMEA-TRAINING.md) |
| `kshana interference-map adsb`, `ais`, `daily`, `sensitivity`, `fetch-land` | builds interference maps and the observatory's daily product from aircraft and ship reports | `examples/interference-map/regenerate.sh` | [Interference map](INTERFERENCE-MAP.md), [observatory](observatory/METHOD.md) |
| `kshana route-exposure` | how much of a route crosses degraded cells | `kshana route-exposure --route examples/interference-map/input/route-adsb.geojson --map examples/interference-map/output/` | [Interference map](INTERFERENCE-MAP.md) |
| `kshana bench spec`, `truth`, `cases`, `score`, `baseline`, `seal`, `reveal-check`, `manifest`, `verify-manifest`, `validate`, `leaderboard` | the kshana-bench tasks, scoring, sealed holdout and leaderboard | `kshana bench baseline --task d --split test --out results/` | [Bench](BENCH.md) |
| `kshana bench-export <scenario>` | a scenario's vehicle motion and events for a laboratory simulator (no signal is written) | `kshana bench-export scenarios/gnss-ins.toml --out run1 --epoch 2025-03-01T10:00:00Z` | [Test bench](TEST-BENCH.md) |
| `kshana compliance-report` | which rows of public resilience frameworks a set of runs supports evidence for | `kshana compliance-report --mapping` | [Compliance](compliance/README.md) |
| `kshana lunanet-afs-check spec`, `symbols`, `generate` | checks and generates the LunaNet AFS codes and frames | `kshana lunanet-afs-check spec` | [LunaNet AFS](LUNANET-AFS.md) |
| `kshana standards-pack list`, `run`, `rows`, `tests` | the scored standards packs | `kshana standards-pack run imo-circ-1575` | [Standards packs](compliance/README.md) |
| `kshana partner check <submission.toml>` | checks the format and metadata of a data-partner submission and reads its data file with the engine's readers; scores nothing | `kshana partner check examples/partner-submission/submission.toml` | [Partner data](PARTNER-DATA.md) |
| `kshana osnma verify <input>` | which satellites' navigation data a receiver can authenticate | `kshana osnma verify examples/osnma/pages-good.txt --public-key "$(cat examples/osnma/public-key.txt)" --json` | [OSNMA](OSNMA.md) |
| `kshana iq scene`, `acquire`, `track`, `sweep`, `labfit`, `campaign`, `conditions`, `frontend`, `monitor`, `inventory`, `info`, `extract`, `convert`, `decimate` | makes, reads, converts and processes baseband recordings with the software receiver | `kshana iq scene scene.sdrx --rate 2046000 --duration 1 --signal gps-l1ca --prn 3,11 --cn0 45` then `kshana iq acquire scene.sdrx --signal gps-l1ca --prn 3,11` | [IQ and the software receiver](IQ-FOLLOW.md) |
| `kshana sky <request>` | line-of-sight visibility, dilution of precision and availability under a stated skyline | `kshana sky --site 59.44,24.75 --systems gps-baseline,galileo --mask 10` | [Skyline](SKYLINE.md) |
| `kshana skyline` | the built-in obstruction profiles, with their provenance | `kshana skyline --presets` | [Skyline](SKYLINE.md) |
| `kshana --help`, `--version` | the usage of every command; the engine version | `kshana --help` | [Usage](../README.md#usage) |
