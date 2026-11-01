# README audit

Scenario kinds: 87; mentioned 69; docs page linked 47; figure 8; runnable command 11.

## Scenario kinds

| kind | in README | docs page | page linked | figure | command in README |
|---|---|---|---|---|---|
| `clock` | yes | CAMPAIGNS.md | yes | - | **NO** |
| `inertial` | yes | QUANTUM-MODELS.md | yes | - | `cargo run -- scenarios/imu-deadreckoning.toml` |
| `orbit` | yes | SKYLINE.md | yes | - | `cargo run -- scenarios/orbit-gnss-challenged.toml` |
| `ephemeris` | yes | SOLAR-SYSTEM.md | yes | - | **NO** |
| `integrity` | yes | CAMPAIGNS.md | yes | - | `cargo run -- scenarios/integrity-raim.toml` |
| `lunar-integrity` | yes | - | - | - | **NO** |
| `lunar-time-offset` | yes | - | - | - | **NO** |
| `lunar-vlbi` | yes | - | - | - | **NO** |
| `lunar-joint-od-clock` | yes | - | - | - | **NO** |
| `lunar-frame-realisation` | yes | - | - | - | **NO** |
| `moonlight-service-volume` | yes | LUNAR-REFERENCE-STATION.md | yes | - | **NO** |
| `lunar-differential-pnt` | yes | LUNAR-REFERENCE-STATION.md | **NO** | - | **NO** |
| `lunar-station-coverage` | **NO** | LUNAR-REFERENCE-STATION.md | **NO** | - | **NO** |
| `lunar-interop-export` | yes | - | - | - | **NO** |
| `timetransfer` | yes | - | - | - | `cargo run -- scenarios/timetransfer.toml` |
| `quantum-anomaly-detect` | yes | QUANTUM-MODELS.md | yes | - | **NO** |
| `quantum-gnss-free-nav` | yes | QUANTUM-MODELS.md | yes | - | **NO** |
| `quantum-time-transfer` | yes | QUANTUM-MODELS.md | yes | - | **NO** |
| `hybrid` | yes | MACHINE-INPUTS.md | yes | - | `cargo run -- scenarios/hybrid-pnt.toml` |
| `fusion` | yes | MACHINE-INPUTS.md | yes | - | **NO** |
| `hybrid-ukf` | yes | QUANTUM-MODELS.md | yes | - | **NO** |
| `gnss-ins` | yes | TEST-BENCH.md | yes | - | **NO** |
| `gnss-sim` | yes | TEST-BENCH.md | yes | - | **NO** |
| `jamming` | yes | CAMPAIGNS.md | yes | - | `cargo run -- scenarios/jamming-demo.toml --export all` |
| `spoof` | yes | CAMPAIGNS.md | yes | - | **NO** |
| `spoof-detect` | yes | CAMPAIGNS.md | yes | - | **NO** |
| `sweep` | yes | CAMPAIGNS.md | yes | - | **NO** |
| `sweep-nd` | yes | CAMPAIGNS.md | yes | - | **NO** |
| `gravity-map` | yes | - | - | - | **NO** |
| `terrain-nav` | yes | - | - | - | **NO** |
| `terrain-slam` | yes | - | - | - | **NO** |
| `combined-altpnt` | yes | - | - | - | **NO** |
| `pvt` | yes | POSITIONING.md | yes | - | **NO** |
| `mars-pnt` | yes | SOLAR-SYSTEM.md | yes | - | **NO** |
| `impairment-eval` | yes | BENCH.md | yes | - | **NO** |
| `quantum-trade` | yes | QUANTUM-MODELS.md | yes | - | **NO** |
| `space-weather` | yes | - | - | - | **NO** |
| `oem-interop` | yes | - | - | - | **NO** |
| `launch-window` | yes | ENTRY-EO-ASCENT.md | **NO** | - | **NO** |
| `reentry` | yes | ENTRY-EO-ASCENT.md | **NO** | - | **NO** |
| `eo-coverage` | yes | ENTRY-EO-ASCENT.md | **NO** | - | **NO** |
| `space-packet` | yes | - | - | - | **NO** |
| `attitude-budget` | yes | - | - | - | **NO** |
| `passes` | yes | CONTACT-SCHEDULING.md | **NO** | - | **NO** |
| `link-budget` | yes | - | - | - | **NO** |
| `lunar-time-budget` | yes | integrations.md | yes | - | **NO** |
| `hybrid-optical-rf` | yes | - | - | - | **NO** |
| `cislunar-observability` | yes | - | - | - | **NO** |
| `conflict-resilience` | yes | RESILIENCE-CROSSWALK.md | yes | - | **NO** |
| `lunar-attack-surface` | yes | - | - | - | **NO** |
| `realtime-frame-eop` | yes | integrations.md | yes | - | **NO** |
| `aperture-duty-cycle` | **NO** | - | - | - | **NO** |
| `lunar-jamming` | **NO** | integrations.md | yes | - | **NO** |
| `ins-trn-coast` | **NO** | RESILIENCE-CROSSWALK.md | yes | - | **NO** |
| `lunar-vlbi-fim` | **NO** | - | - | - | **NO** |
| `tracking-loop` | **NO** | - | - | - | **NO** |
| `araim-reference-check` | **NO** | INTEGRITY.md | yes | - | **NO** |
| `lunar-frame-campaign` | **NO** | - | - | - | **NO** |
| `lunar-llr-datum` | **NO** | LUNAR-REFERENCE-STATION.md | **NO** | - | **NO** |
| `lunar-beacon` | yes | - | - | - | **NO** |
| `earth-gnss-lunar` | **NO** | - | - | - | **NO** |
| `lunar-infrastructure` | yes | LUNAR-INFRASTRUCTURE.md | yes | 0.38/lunar-frame, 0.38/lunar-geodesy, 0.38/lunar-od, 0.38/lunar-tie | `kshana scenarios/lunar-infrastructure-od-consistency.toml` |
| `cislunar-arc-recovery` | yes | - | - | - | **NO** |
| `telecom-timing` | yes | integrations.md | yes | - | **NO** |
| `slot-timing` | **NO** | LEO-PNT.md | yes | - | **NO** |
| `spectrum` | yes | LEO-PNT.md | yes | readme/lband-waterfall | **NO** |
| `solar-system` | yes | SOLAR-SYSTEM.md | yes | - | **NO** |
| `body-pnt` | yes | SOLAR-SYSTEM.md | yes | - | **NO** |
| `constellation-design` | yes | SOLAR-SYSTEM.md | yes | readme/coverage-map, readme/hero | **NO** |
| `campaign` | yes | LEO-PNT.md | yes | readme/campaign-timeline, readme/hero | `cargo run -- scenarios/campaign-jam-spoof-holdover-integrity.toml --an` |
| `leo-signal` | yes | LEO-PNT.md | yes | - | **NO** |
| `leo-pass` | yes | LEO-PNT.md | yes | - | **NO** |
| `leo-navmsg` | yes | LEO-PNT.md | yes | - | **NO** |
| `leo-pvt` | yes | LEO-PNT-FUSION.md | yes | - | **NO** |
| `leo-ppp` | yes | LEO-PNT.md | yes | - | **NO** |
| `ntn-positioning` | yes | LEO-PNT.md | yes | - | **NO** |
| `leo-pnt-chain` | yes | LEO-PNT.md | yes | readme/flow-leo-chain | **NO** |
| `contact-schedule` | **NO** | CONTACT-SCHEDULING.md | **NO** | - | **NO** |
| `acm-link` | **NO** | CONTACT-SCHEDULING.md | **NO** | - | **NO** |
| `aocs` | **NO** | AOCS.md | **NO** | - | **NO** |
| `entry-heating` | **NO** | ENTRY-EO-ASCENT.md | **NO** | - | **NO** |
| `eo-radiometry` | **NO** | ENTRY-EO-ASCENT.md | **NO** | - | **NO** |
| `ascent-losses` | **NO** | ENTRY-EO-ASCENT.md | **NO** | - | **NO** |
| `time-transfer-budget` | **NO** | - | - | - | **NO** |
| `optical-atmosphere` | yes | OPTICAL-ATMOSPHERE.md | yes | 0.38/optical | `kshana scenarios/optical-atmosphere-network.toml` |
| `holdover-test` | yes | TIMING-HIL.md | yes | 0.38/timing | `kshana scenarios/holdover-test-example.toml` |
| `gnss-ssv` | yes | SSV.md | yes | 0.38/ssv-formation, 0.38/ssv-heo, 0.38/ssv-nav, 0.38/ssv-shell | `kshana scenarios/gnss-ssv-shell.toml            # shell: the upper spa` |

## CLI commands

| command | subcommands | in README | docs page | page linked | runnable in README |
|---|---|---|---|---|---|
| `kshana <scenario.toml>` | - | yes | - | - | yes |
| `kshana --study` | - | **NO** | - | - | yes |
| `kshana --validate` | - | **NO** | - | - | yes |
| `kshana receiver-trust` | evidence | yes | MARINE-INTEGRATIONS.md | yes | yes |
| `kshana evidence` | attach-timestamp, keygen (NO), round-trip, verify | yes | EVIDENCE-PACKS.md | yes | yes |
| `kshana jammertest` | import, score | yes | JAMMERTEST.md | yes | yes |
| `kshana trust-telemetry` | - | yes | TRUST-TELEMETRY.md | yes | yes |
| `kshana imu-fit` | - | yes | MACHINE-INPUTS.md | yes | yes |
| `kshana nmea-scenario` | - | yes | NMEA-TRAINING.md | yes | **NO** |
| `kshana interference-map` | adsb (NO), ais (NO), daily, fetch-land (NO), sensitivity | yes | INTERFERENCE-MAP.md | yes | yes |
| `kshana route-exposure` | - | yes | INTERFERENCE-MAP.md | yes | **NO** |
| `kshana bench` | baseline, cases, leaderboard, manifest, reveal-check (NO), score, seal (NO), spec, truth, validate (NO), verify-manifest (NO) | yes | BENCH.md | yes | yes |
| `kshana bench-export` | - | yes | TEST-BENCH.md | yes | **NO** |
| `kshana compliance-report` | - | yes | TEST-BENCH.md | yes | **NO** |
| `kshana lunanet-afs-check` | generate, spec, symbols | yes | LUNANET-AFS.md | yes | yes |
| `kshana standards-pack` | list, rows, run, tests | yes | - | - | yes |
| `kshana osnma` | verify | **NO** | OSNMA.md | yes | **NO** |
| `kshana iq` | acquire, campaign, conditions, convert (NO), decimate (NO), extract (NO), frontend (NO), info (NO), inventory (NO), labfit, monitor, scene, sweep, track | yes | IQ-FOLLOW.md | yes | **NO** |
| `kshana sky` | - | **NO** | SKYLINE.md | yes | **NO** |
| `kshana skyline` | - | **NO** | SKYLINE.md | yes | **NO** |
| `kshana kinds` | - | yes | TIMING-HIL.md | yes | **NO** |
| `kshana example` | - | yes | LEO-SIGNAL.md | yes | yes |
| `kshana --help` | - | **NO** | - | - | yes |

## MCP tools

16 items; not mentioned in README: none


## Plugin commands

15 items; not mentioned in README: `kshana-fit-imu`, `kshana-lunanet-afs-check`, `kshana-standards-pack`, `kshana-trust-telemetry`


## Skills

10 items; not mentioned in README: `compliance-mapping`, `gnss-iq`, `interference-map-route-exposure`, `test-bench-export`, `training-nmea-scenario`, `vessel-receiver-trust`


## Studio pages

13 items; not mentioned in README: `/studio/advanced/`, `/studio/geometry/`, `/studio/interference/`, `/studio/lunar/`, `/studio/lunar-infra/`, `/studio/ssv/`, `/studio/tools/`, `/studio/training/`, `/studio/trust/`


## Integrations and distribution

13 items; not mentioned in README: `systemd unit`


## Capability domains

34 items; not mentioned in README: `Decision support`, `GNSS authentication`, `GNSS positioning`, `Nav-signal performance`, `Optical / RF PNT`, `Resilience assessment`, `Timing integrity`, `Verification & assurance`


## Figure and diagram files under docs/

118 files; not embedded in the README: 29.

| file | README | docs pages |
|---|---|---|
| docs/assets/clock-ensemble-band.svg | **NO** | - |
| docs/assets/clock-holdover.svg | yes | - |
| docs/assets/diagrams/distribution.png | **NO** | - |
| docs/assets/diagrams/distribution.svg | **NO** | - |
| docs/assets/diagrams/engine-flow.png | **NO** | - |
| docs/assets/diagrams/engine-flow.svg | **NO** | - |
| docs/assets/diagrams/module-map.png | **NO** | - |
| docs/assets/diagrams/module-map.svg | **NO** | - |
| docs/assets/diagrams/system-overview.png | **NO** | - |
| docs/assets/diagrams/system-overview.svg | **NO** | - |
| docs/assets/diagrams/validation-provenance.png | yes | - |
| docs/assets/diagrams/validation-provenance.svg | **NO** | - |
| docs/assets/figures/domain-coverage-map.png | **NO** | - |
| docs/assets/figures/domain-coverage-map.svg | **NO** | - |
| docs/assets/figures/oracle-kind-stacked.png | yes | - |
| docs/assets/figures/oracle-kind-stacked.svg | **NO** | - |
| docs/assets/figures/scenario-fom.png | yes | - |
| docs/assets/figures/scenario-fom.svg | **NO** | - |
| docs/assets/figures/sgp4-regime-bars.png | yes | - |
| docs/assets/figures/sgp4-regime-bars.svg | **NO** | - |
| docs/assets/figures/validation-breakdown.png | yes | - |
| docs/assets/figures/validation-breakdown.svg | **NO** | - |
| docs/assets/inertial-deadreckoning.svg | yes | - |
| docs/assets/kshana-banner.svg | **NO** | - |
| docs/assets/kshana-logo.png | **NO** | - |
| docs/assets/kshana-mark.png | **NO** | - |
| docs/assets/kshana-mark.svg | **NO** | - |
| docs/assets/kshana-wordmark.png | **NO** | - |
| docs/assets/kshana-wordmark.svg | **NO** | - |
| docs/assets/orbit-gnss-challenged.svg | yes | - |
| docs/assets/readme/architecture-dark.svg | yes | - |
| docs/assets/readme/architecture-light.svg | yes | - |
| docs/assets/readme/campaign-timeline-dark.svg | yes | - |
| docs/assets/readme/campaign-timeline-light.svg | yes | - |
| docs/assets/readme/coverage-map-dark.svg | yes | - |
| docs/assets/readme/coverage-map-light.svg | yes | - |
| docs/assets/readme/evidence-pack-dark.svg | yes | EVIDENCE-PACKS.md |
| docs/assets/readme/evidence-pack-light.svg | yes | EVIDENCE-PACKS.md |
| docs/assets/readme/flow-architecture-dark.svg | yes | - |
| docs/assets/readme/flow-architecture-light.svg | yes | - |
| docs/assets/readme/flow-leo-chain-dark.svg | yes | - |
| docs/assets/readme/flow-leo-chain-light.svg | yes | - |
| docs/assets/readme/flow-pipeline-dark.svg | yes | - |
| docs/assets/readme/flow-pipeline-light.svg | yes | - |
| docs/assets/readme/flow-verification-dark.svg | yes | - |
| docs/assets/readme/flow-verification-light.svg | yes | - |
| docs/assets/readme/hero-dark.svg | yes | - |
| docs/assets/readme/hero-light.svg | yes | - |
| docs/assets/readme/interference-map-dark.svg | yes | INTERFERENCE-MAP.md |
| docs/assets/readme/interference-map-light.svg | yes | INTERFERENCE-MAP.md |
| docs/assets/readme/kshana-logo-dark.svg | yes | - |
| docs/assets/readme/kshana-logo-light.svg | yes | - |
| docs/assets/readme/kshana-mark-dark.png | **NO** | - |
| docs/assets/readme/kshana-mark-light.png | **NO** | - |
| docs/assets/readme/lband-waterfall-dark.svg | yes | - |
| docs/assets/readme/lband-waterfall-light.svg | yes | - |
| docs/assets/readme/leo-pass-dark.svg | yes | - |
| docs/assets/readme/leo-pass-light.svg | yes | - |
| docs/assets/readme/research-dark.svg | yes | - |
| docs/assets/readme/research-light.svg | yes | - |
| docs/assets/readme/site/site-strip-dark.jpg | yes | - |
| docs/assets/readme/site/site-strip-light.jpg | yes | - |
| docs/assets/readme/solar-system-dark.svg | yes | - |
| docs/assets/readme/solar-system-light.svg | yes | - |
| docs/assets/readme/studio/studio-advanced-dark.jpg | yes | - |
| docs/assets/readme/studio/studio-advanced-light.jpg | yes | - |
| docs/assets/readme/studio/studio-home-dark.jpg | yes | - |
| docs/assets/readme/studio/studio-home-light.jpg | yes | - |
| docs/assets/readme/studio/studio-task-dark.jpg | yes | - |
| docs/assets/readme/studio/studio-task-light.jpg | yes | - |
| docs/assets/readme/training-track-dark.svg | yes | NMEA-TRAINING.md |
| docs/assets/readme/training-track-light.svg | yes | NMEA-TRAINING.md |
| docs/assets/readme/trust-timeline-dark.svg | yes | MARITIME-TRUST.md, RECEIVER-TRUST.md |
| docs/assets/readme/trust-timeline-light.svg | yes | MARITIME-TRUST.md, RECEIVER-TRUST.md |
| docs/assets/sweep-clock-stability.svg | **NO** | - |
| docs/diagrams/distribution.mmd | **NO** | - |
| docs/diagrams/engine-flow.mmd | **NO** | - |
| docs/diagrams/module-map.mmd | **NO** | - |
| docs/diagrams/system-overview.mmd | **NO** | - |
| docs/diagrams/validation-provenance.mmd | yes | - |
| docs/figures/0.38/bench-dark.svg | yes | BENCH.md |
| docs/figures/0.38/bench-light.svg | yes | BENCH.md |
| docs/figures/0.38/exporters-dark.svg | yes | TRUST-TELEMETRY.md |
| docs/figures/0.38/exporters-light.svg | yes | TRUST-TELEMETRY.md |
| docs/figures/0.38/jammertest-dark.svg | yes | JAMMERTEST.md |
| docs/figures/0.38/jammertest-light.svg | yes | JAMMERTEST.md |
| docs/figures/0.38/lunanet-afs-dark.svg | yes | LUNANET-AFS.md |
| docs/figures/0.38/lunanet-afs-light.svg | yes | LUNANET-AFS.md |
| docs/figures/0.38/lunar-carrier-dark.svg | yes | LUNAR-INFRASTRUCTURE.md |
| docs/figures/0.38/lunar-carrier-light.svg | yes | LUNAR-INFRASTRUCTURE.md |
| docs/figures/0.38/lunar-frame-dark.svg | yes | LUNAR-INFRASTRUCTURE.md |
| docs/figures/0.38/lunar-frame-light.svg | yes | LUNAR-INFRASTRUCTURE.md |
| docs/figures/0.38/lunar-geodesy-dark.svg | yes | LUNAR-INFRASTRUCTURE.md |
| docs/figures/0.38/lunar-geodesy-light.svg | yes | LUNAR-INFRASTRUCTURE.md |
| docs/figures/0.38/lunar-od-dark.svg | yes | LUNAR-INFRASTRUCTURE.md |
| docs/figures/0.38/lunar-od-light.svg | yes | LUNAR-INFRASTRUCTURE.md |
| docs/figures/0.38/lunar-tie-dark.svg | yes | LUNAR-INFRASTRUCTURE.md |
| docs/figures/0.38/lunar-tie-light.svg | yes | LUNAR-INFRASTRUCTURE.md |
| docs/figures/0.38/machine-inputs-dark.svg | yes | MACHINE-INPUTS.md |
| docs/figures/0.38/machine-inputs-light.svg | yes | MACHINE-INPUTS.md |
| docs/figures/0.38/optical-dark.svg | yes | OPTICAL-ATMOSPHERE.md |
| docs/figures/0.38/optical-light.svg | yes | OPTICAL-ATMOSPHERE.md |
| docs/figures/0.38/receiver-flags-dark.svg | yes | RECEIVER-TRUST.md |
| docs/figures/0.38/receiver-flags-light.svg | yes | RECEIVER-TRUST.md |
| docs/figures/0.38/ssv-booklet-dark.svg | yes | SSV.md |
| docs/figures/0.38/ssv-booklet-light.svg | yes | SSV.md |
| docs/figures/0.38/ssv-formation-dark.svg | yes | SSV.md |
| docs/figures/0.38/ssv-formation-light.svg | yes | SSV.md |
| docs/figures/0.38/ssv-heo-dark.svg | yes | SSV.md |
| docs/figures/0.38/ssv-heo-light.svg | yes | SSV.md |
| docs/figures/0.38/ssv-nav-dark.svg | yes | SSV.md |
| docs/figures/0.38/ssv-nav-light.svg | yes | SSV.md |
| docs/figures/0.38/ssv-shell-dark.svg | yes | SSV.md |
| docs/figures/0.38/ssv-shell-light.svg | yes | SSV.md |
| docs/figures/0.38/standards-dark.svg | yes | - |
| docs/figures/0.38/standards-light.svg | yes | - |
| docs/figures/0.38/timing-dark.svg | yes | TIMING-HIL.md |
| docs/figures/0.38/timing-light.svg | yes | TIMING-HIL.md |

## Mermaid diagrams

| diagram | embedded | PNG bound to SVG |
|---|---|---|
| module-map | **NO** | yes |
| system-overview | **NO** | yes |
| engine-flow | **NO** | yes |
| distribution | **NO** | yes |
| validation-provenance | yes | yes |
