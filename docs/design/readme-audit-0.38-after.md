# README audit

Scenario kinds: 87; mentioned 87; docs page linked 87; figure 87; runnable command 87.

## Scenario kinds

| kind | in README | docs page | page linked | figure | command in README |
|---|---|---|---|---|---|
| `clock` | yes | CAMPAIGNS.md | yes | figures/kinds/clock.svg | `kshana scenarios/clock-ensemble.toml` |
| `inertial` | yes | QUANTUM-MODELS.md | yes | figures/kinds/inertial.svg | `cargo run -- scenarios/imu-deadreckoning.toml` |
| `orbit` | yes | SKYLINE.md | yes | figures/kinds/orbit.svg | `cargo run -- scenarios/orbit-gnss-challenged.toml` |
| `ephemeris` | yes | SOLAR-SYSTEM.md | yes | figures/kinds/ephemeris.svg | `kshana scenarios/ephemeris.toml` |
| `integrity` | yes | CAMPAIGNS.md | yes | figures/kinds/integrity.svg | `cargo run -- scenarios/integrity-raim.toml` |
| `lunar-integrity` | yes | KINDS.md | yes | figures/kinds/lunar-integrity.svg | `kshana scenarios/lunanet-araim.toml` |
| `lunar-time-offset` | yes | KINDS.md | yes | figures/kinds/lunar-time-offset.svg | `kshana scenarios/lunar-time-offset.toml` |
| `lunar-vlbi` | yes | KINDS.md | yes | figures/kinds/lunar-vlbi.svg | `kshana scenarios/lunar-vlbi.toml` |
| `lunar-joint-od-clock` | yes | KINDS.md | yes | figures/kinds/lunar-joint-od-clock.svg | `kshana scenarios/lunar-joint-od-clock.toml` |
| `lunar-frame-realisation` | yes | KINDS.md | yes | figures/kinds/lunar-frame-realisation.svg | `kshana scenarios/lunar-frame-realisation.toml` |
| `moonlight-service-volume` | yes | LUNAR-REFERENCE-STATION.md | yes | figures/kinds/moonlight-service-volume.svg | `kshana scenarios/moonlight-service-volume.toml` |
| `lunar-differential-pnt` | yes | LUNAR-REFERENCE-STATION.md | yes | figures/kinds/lunar-differential-pnt.svg | `kshana scenarios/lunar-differential-pnt.toml` |
| `lunar-station-coverage` | yes | LUNAR-REFERENCE-STATION.md | yes | figures/kinds/lunar-station-coverage.svg | `kshana scenarios/lunar-station-coverage.toml` |
| `lunar-interop-export` | yes | KINDS.md | yes | figures/kinds/lunar-interop-export.svg | `kshana scenarios/lunar-interop-export.toml` |
| `timetransfer` | yes | KINDS.md | yes | figures/kinds/timetransfer.svg | `cargo run -- scenarios/timetransfer.toml` |
| `quantum-anomaly-detect` | yes | QUANTUM-MODELS.md | yes | figures/kinds/quantum-anomaly-detect.svg | `kshana scenarios/quantum-anomaly-detect.toml` |
| `quantum-gnss-free-nav` | yes | QUANTUM-MODELS.md | yes | figures/kinds/quantum-gnss-free-nav.svg | `kshana scenarios/quantum-gnss-free-nav.toml` |
| `quantum-time-transfer` | yes | QUANTUM-MODELS.md | yes | figures/kinds/quantum-time-transfer.svg | `kshana scenarios/quantum-time-transfer.toml` |
| `hybrid` | yes | KINDS.md | yes | figures/kinds/hybrid.svg | `cargo run -- scenarios/hybrid-pnt.toml` |
| `fusion` | yes | KINDS.md | yes | figures/kinds/fusion.svg | `kshana scenarios/fusion-pnt.toml` |
| `hybrid-ukf` | yes | QUANTUM-MODELS.md | yes | figures/kinds/hybrid-ukf.svg | `kshana scenarios/hybrid-ukf.toml` |
| `gnss-ins` | yes | TEST-BENCH.md | yes | figures/kinds/gnss-ins.svg | `kshana scenarios/gnss-ins.toml` |
| `gnss-sim` | yes | KINDS.md | yes | figures/kinds/gnss-sim.svg | `kshana scenarios/gnss-sim-raim.toml` |
| `jamming` | yes | CAMPAIGNS.md | yes | figures/kinds/jamming.svg | `cargo run -- scenarios/jamming-demo.toml --export all` |
| `spoof` | yes | CAMPAIGNS.md | yes | figures/kinds/spoof.svg | `kshana scenarios/spoof-attack.toml` |
| `spoof-detect` | yes | KINDS.md | yes | figures/kinds/spoof-detect.svg | `kshana scenarios/spoof-detect.toml` |
| `sweep` | yes | CAMPAIGNS.md | yes | figures/kinds/sweep.svg | `kshana scenarios/sweep-clock-stability.toml` |
| `sweep-nd` | yes | KINDS.md | yes | figures/kinds/sweep-nd.svg | `kshana scenarios/sweep-nd-inertial.toml` |
| `gravity-map` | yes | KINDS.md | yes | figures/kinds/gravity-map.svg | `kshana scenarios/gravity-map-nav.toml` |
| `terrain-nav` | yes | KINDS.md | yes | figures/kinds/terrain-nav.svg | `kshana scenarios/terrain-nav.toml` |
| `terrain-slam` | yes | KINDS.md | yes | figures/kinds/terrain-slam.svg | `kshana scenarios/terrain-slam.toml` |
| `combined-altpnt` | yes | KINDS.md | yes | figures/kinds/combined-altpnt.svg | `kshana scenarios/combined-altpnt.toml` |
| `pvt` | yes | POSITIONING.md | yes | figures/kinds/pvt.svg | `kshana scenarios/pvt-abmf.toml` |
| `mars-pnt` | yes | KINDS.md | yes | figures/kinds/mars-pnt.svg | `kshana scenarios/mars-pnt-lmo.toml` |
| `impairment-eval` | yes | KINDS.md | yes | figures/kinds/impairment-eval.svg | `kshana scenarios/impairment-eval.toml` |
| `quantum-trade` | yes | KINDS.md | yes | figures/kinds/quantum-trade.svg | `kshana scenarios/quantum-trade.toml` |
| `space-weather` | yes | KINDS.md | yes | figures/kinds/space-weather.svg | `kshana scenarios/space-weather.toml` |
| `oem-interop` | yes | KINDS.md | yes | figures/kinds/oem-interop.svg | `kshana scenarios/oem-interop.toml` |
| `launch-window` | yes | KINDS.md | yes | figures/kinds/launch-window.svg | `kshana scenarios/launch-window.toml` |
| `reentry` | yes | KINDS.md | yes | figures/kinds/reentry.svg | `kshana scenarios/reentry.toml` |
| `eo-coverage` | yes | KINDS.md | yes | figures/kinds/eo-coverage.svg | `kshana scenarios/eo-coverage.toml` |
| `space-packet` | yes | KINDS.md | yes | figures/kinds/space-packet.svg | `kshana scenarios/space-packet.toml` |
| `attitude-budget` | yes | KINDS.md | yes | figures/kinds/attitude-budget.svg | `kshana scenarios/attitude-budget.toml` |
| `passes` | yes | KINDS.md | yes | figures/kinds/passes.svg | `kshana scenarios/passes.toml` |
| `link-budget` | yes | KINDS.md | yes | figures/kinds/link-budget.svg | `kshana scenarios/link-budget.toml` |
| `lunar-time-budget` | yes | KINDS.md | yes | figures/kinds/lunar-time-budget.svg | `kshana scenarios/lunar-time-budget.toml` |
| `hybrid-optical-rf` | yes | KINDS.md | yes | figures/kinds/hybrid-optical-rf.svg | `kshana scenarios/hybrid-optical-rf.toml` |
| `cislunar-observability` | yes | KINDS.md | yes | figures/kinds/cislunar-observability.svg | `kshana scenarios/cislunar-observability.toml` |
| `conflict-resilience` | yes | RESILIENCE-CROSSWALK.md | yes | figures/kinds/conflict-resilience.svg | `kshana scenarios/conflict-resilience.toml` |
| `lunar-attack-surface` | yes | KINDS.md | yes | figures/kinds/lunar-attack-surface.svg | `kshana scenarios/lunar-attack-surface.toml` |
| `realtime-frame-eop` | yes | KINDS.md | yes | figures/kinds/realtime-frame-eop.svg | `kshana scenarios/realtime-frame-eop.toml` |
| `aperture-duty-cycle` | yes | KINDS.md | yes | figures/kinds/aperture-duty-cycle.svg | `kshana scenarios/aperture-duty-cycle.toml` |
| `lunar-jamming` | yes | KINDS.md | yes | figures/kinds/lunar-jamming.svg | `kshana scenarios/lunar-jamming.toml` |
| `ins-trn-coast` | yes | KINDS.md | yes | figures/kinds/ins-trn-coast.svg | `kshana scenarios/ins-trn-coast.toml` |
| `lunar-vlbi-fim` | yes | KINDS.md | yes | figures/kinds/lunar-vlbi-fim.svg | `kshana scenarios/lunar-vlbi-fim.toml` |
| `tracking-loop` | yes | KINDS.md | yes | figures/kinds/tracking-loop.svg | `kshana scenarios/tracking-loop.toml` |
| `araim-reference-check` | yes | KINDS.md | yes | figures/kinds/araim-reference-check.svg | `kshana scenarios/araim-reference-check.toml` |
| `lunar-frame-campaign` | yes | KINDS.md | yes | figures/kinds/lunar-frame-campaign.svg | `kshana scenarios/lunar-frame-campaign.toml` |
| `lunar-llr-datum` | yes | KINDS.md | yes | figures/kinds/lunar-llr-datum.svg | `kshana scenarios/lunar-llr-datum.toml` |
| `lunar-beacon` | yes | KINDS.md | yes | figures/kinds/lunar-beacon.svg | `kshana scenarios/lunar-beacon.toml` |
| `earth-gnss-lunar` | yes | KINDS.md | yes | figures/kinds/earth-gnss-lunar.svg | `kshana scenarios/earth-gnss-lunar.toml` |
| `lunar-infrastructure` | yes | KINDS.md | yes | 0.38/lunar-frame, 0.38/lunar-geodesy, 0.38/lunar-od, 0.38/lunar-tie | `kshana scenarios/lunar-infrastructure-od-consistency.toml` |
| `cislunar-arc-recovery` | yes | KINDS.md | yes | figures/kinds/cislunar-arc-recovery.svg | `kshana scenarios/cislunar-arc-recovery.toml` |
| `telecom-timing` | yes | KINDS.md | yes | figures/kinds/telecom-timing.svg | `kshana scenarios/telecom-synce-eec.toml` |
| `slot-timing` | yes | LEO-PNT.md | yes | figures/kinds/slot-timing.svg | `kshana scenarios/slot-timing-ocxo-leo.toml` |
| `spectrum` | yes | LEO-PNT.md | yes | readme/lband-waterfall | `kshana scenarios/l-band-waterfall-jamming.toml` |
| `solar-system` | yes | SOLAR-SYSTEM.md | yes | figures/kinds/solar-system.svg | `kshana scenarios/solar-system-tour.toml` |
| `body-pnt` | yes | SOLAR-SYSTEM.md | yes | figures/kinds/body-pnt.svg | `kshana scenarios/mars-orbit-pnt.toml` |
| `constellation-design` | yes | SOLAR-SYSTEM.md | yes | readme/coverage-map, readme/hero | `kshana scenarios/leo-pnt-mega-shell.toml` |
| `campaign` | yes | LEO-PNT.md | yes | readme/campaign-timeline, readme/hero | `cargo run -- scenarios/campaign-jam-spoof-holdover-integrity.toml --an` |
| `leo-signal` | yes | LEO-PNT.md | yes | figures/kinds/leo-signal.svg | `kshana scenarios/leo-band-trade.toml` |
| `leo-pass` | yes | LEO-PNT.md | yes | figures/kinds/leo-pass.svg | `kshana scenarios/leo-pass-iridium.toml` |
| `leo-navmsg` | yes | LEO-PNT.md | yes | figures/kinds/leo-navmsg.svg | `kshana scenarios/leo-navmsg-celeste-iod.toml` |
| `leo-pvt` | yes | LEO-PNT-FUSION.md | yes | figures/kinds/leo-pvt.svg | `kshana scenarios/leo-pvt-fjord-skyline.toml` |
| `leo-ppp` | yes | LEO-PNT.md | yes | figures/kinds/leo-ppp.svg | `kshana scenarios/leo-ppp-convergence.toml` |
| `ntn-positioning` | yes | LEO-PNT.md | yes | figures/kinds/ntn-positioning.svg | `kshana scenarios/ntn-5g-positioning.toml` |
| `leo-pnt-chain` | yes | LEO-PNT.md | yes | readme/flow-leo-chain | `kshana scenarios/leo-pnt-end-to-end.toml` |
| `contact-schedule` | yes | KINDS.md | yes | figures/kinds/contact-schedule.svg | `kshana scenarios/contact-schedule.toml` |
| `acm-link` | yes | KINDS.md | yes | figures/kinds/acm-link.svg | `kshana scenarios/acm-link.toml` |
| `aocs` | yes | KINDS.md | yes | figures/kinds/aocs.svg | `kshana scenarios/aocs-slew.toml` |
| `entry-heating` | yes | KINDS.md | yes | figures/kinds/entry-heating.svg | `kshana scenarios/entry-heating-stardust.toml` |
| `eo-radiometry` | yes | KINDS.md | yes | figures/kinds/eo-radiometry.svg | `kshana scenarios/eo-radiometry.toml` |
| `ascent-losses` | yes | KINDS.md | yes | figures/kinds/ascent-losses.svg | `kshana scenarios/ascent-losses.toml` |
| `time-transfer-budget` | yes | KINDS.md | yes | figures/kinds/time-transfer-budget.svg | `kshana scenarios/time-transfer-budget.toml` |
| `optical-atmosphere` | yes | OPTICAL-ATMOSPHERE.md | yes | 0.38/optical | `kshana scenarios/optical-atmosphere-network.toml` |
| `holdover-test` | yes | TIMING-HIL.md | yes | 0.38/timing | `kshana scenarios/holdover-test-example.toml` |
| `gnss-ssv` | yes | SSV.md | yes | 0.38/ssv-formation, 0.38/ssv-heo, 0.38/ssv-nav, 0.38/ssv-shell | `kshana scenarios/gnss-ssv-shell.toml            # shell: the upper spa` |

## CLI commands

| command | subcommands | in README | docs page | page linked | runnable in README |
|---|---|---|---|---|---|
| `kshana <scenario.toml>` | - | yes | - | - | yes |
| `kshana --study` | - | yes | - | - | yes |
| `kshana --validate` | - | yes | - | - | yes |
| `kshana receiver-trust` | evidence | yes | MARINE-INTEGRATIONS.md | yes | yes |
| `kshana evidence` | attach-timestamp, keygen, round-trip, verify | yes | EVIDENCE-PACKS.md | yes | yes |
| `kshana jammertest` | import, score | yes | JAMMERTEST.md | yes | yes |
| `kshana trust-telemetry` | - | yes | TRUST-TELEMETRY.md | yes | yes |
| `kshana imu-fit` | - | yes | MACHINE-INPUTS.md | yes | yes |
| `kshana nmea-scenario` | - | yes | NMEA-TRAINING.md | yes | yes |
| `kshana interference-map` | adsb, ais, daily, fetch-land, sensitivity | yes | INTERFERENCE-MAP.md | yes | yes |
| `kshana route-exposure` | - | yes | INTERFERENCE-MAP.md | yes | yes |
| `kshana bench` | baseline, cases, leaderboard, manifest, reveal-check, score, seal, spec, truth, validate, verify-manifest | yes | BENCH.md | yes | yes |
| `kshana bench-export` | - | yes | TEST-BENCH.md | yes | yes |
| `kshana compliance-report` | - | yes | TEST-BENCH.md | yes | yes |
| `kshana lunanet-afs-check` | generate, spec, symbols | yes | LUNANET-AFS.md | yes | yes |
| `kshana standards-pack` | list, rows, run, tests | yes | - | - | yes |
| `kshana osnma` | verify | yes | OSNMA.md | yes | yes |
| `kshana iq` | acquire, campaign, conditions, convert, decimate, extract, frontend, info, inventory, labfit, monitor, scene, sweep, track | yes | IQ-FOLLOW.md | yes | yes |
| `kshana sky` | - | yes | SKYLINE.md | yes | yes |
| `kshana skyline` | - | yes | SKYLINE.md | yes | yes |
| `kshana kinds` | - | yes | KINDS.md | yes | yes |
| `kshana example` | - | yes | LEO-SIGNAL.md | yes | yes |
| `kshana --help` | - | yes | - | - | yes |

## MCP tools

16 items; not mentioned in README: none


## Plugin commands

15 items; not mentioned in README: none


## Skills

10 items; not mentioned in README: none


## Studio pages

13 items; not mentioned in README: none


## Integrations and distribution

13 items; not mentioned in README: none


## Capability domains

34 items; not mentioned in README: none


## Figure and diagram files under docs/

215 files; not embedded in the README: 93.

| file | README | docs pages |
|---|---|---|
| docs/assets/clock-holdover.svg | yes | - |
| docs/assets/diagrams/distribution.png | yes | - |
| docs/assets/diagrams/distribution.svg | yes | - |
| docs/assets/diagrams/engine-flow.png | yes | - |
| docs/assets/diagrams/engine-flow.svg | yes | - |
| docs/assets/diagrams/lab-round-trip.png | yes | - |
| docs/assets/diagrams/lab-round-trip.svg | yes | - |
| docs/assets/diagrams/module-map.png | yes | - |
| docs/assets/diagrams/module-map.svg | yes | - |
| docs/assets/diagrams/studio-flow.png | yes | - |
| docs/assets/diagrams/studio-flow.svg | yes | - |
| docs/assets/diagrams/surfaces.png | yes | - |
| docs/assets/diagrams/surfaces.svg | yes | - |
| docs/assets/diagrams/system-overview.png | yes | - |
| docs/assets/diagrams/system-overview.svg | yes | - |
| docs/assets/diagrams/trust-flow.png | yes | - |
| docs/assets/diagrams/trust-flow.svg | yes | - |
| docs/assets/diagrams/validation-provenance.png | yes | - |
| docs/assets/diagrams/validation-provenance.svg | yes | - |
| docs/assets/figures/domain-coverage-map.png | yes | - |
| docs/assets/figures/domain-coverage-map.svg | yes | - |
| docs/assets/figures/oracle-kind-stacked.png | yes | - |
| docs/assets/figures/oracle-kind-stacked.svg | yes | - |
| docs/assets/figures/scenario-fom.png | yes | - |
| docs/assets/figures/scenario-fom.svg | yes | - |
| docs/assets/figures/sgp4-regime-bars.png | yes | - |
| docs/assets/figures/sgp4-regime-bars.svg | yes | - |
| docs/assets/figures/validation-breakdown.png | yes | - |
| docs/assets/figures/validation-breakdown.svg | yes | - |
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
| docs/diagrams/distribution.mmd | yes | - |
| docs/diagrams/engine-flow.mmd | yes | - |
| docs/diagrams/lab-round-trip.mmd | yes | - |
| docs/diagrams/module-map.mmd | yes | - |
| docs/diagrams/studio-flow.mmd | yes | - |
| docs/diagrams/surfaces.mmd | yes | - |
| docs/diagrams/system-overview.mmd | yes | - |
| docs/diagrams/trust-flow.mmd | yes | - |
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
| docs/figures/kinds/acm-link.svg | **NO** | KINDS.md |
| docs/figures/kinds/aocs.svg | **NO** | KINDS.md |
| docs/figures/kinds/aperture-duty-cycle.svg | **NO** | KINDS.md |
| docs/figures/kinds/araim-reference-check.svg | **NO** | KINDS.md |
| docs/figures/kinds/ascent-losses.svg | **NO** | KINDS.md |
| docs/figures/kinds/attitude-budget.svg | **NO** | KINDS.md |
| docs/figures/kinds/body-pnt.svg | **NO** | KINDS.md |
| docs/figures/kinds/campaign.svg | **NO** | KINDS.md |
| docs/figures/kinds/cislunar-arc-recovery.svg | **NO** | KINDS.md |
| docs/figures/kinds/cislunar-observability.svg | **NO** | KINDS.md |
| docs/figures/kinds/clock.svg | yes | KINDS.md |
| docs/figures/kinds/combined-altpnt.svg | **NO** | KINDS.md |
| docs/figures/kinds/conflict-resilience.svg | **NO** | KINDS.md |
| docs/figures/kinds/constellation-design.svg | **NO** | KINDS.md |
| docs/figures/kinds/contact-schedule.svg | **NO** | KINDS.md |
| docs/figures/kinds/earth-gnss-lunar.svg | **NO** | KINDS.md |
| docs/figures/kinds/entry-heating.svg | **NO** | KINDS.md |
| docs/figures/kinds/eo-coverage.svg | **NO** | KINDS.md |
| docs/figures/kinds/eo-radiometry.svg | **NO** | KINDS.md |
| docs/figures/kinds/ephemeris.svg | **NO** | KINDS.md |
| docs/figures/kinds/fusion.svg | **NO** | KINDS.md |
| docs/figures/kinds/gnss-ins.svg | **NO** | KINDS.md |
| docs/figures/kinds/gnss-sim.svg | **NO** | KINDS.md |
| docs/figures/kinds/gnss-ssv.svg | **NO** | KINDS.md |
| docs/figures/kinds/gravity-map.svg | **NO** | KINDS.md |
| docs/figures/kinds/holdover-test.svg | **NO** | KINDS.md |
| docs/figures/kinds/hybrid-optical-rf.svg | **NO** | KINDS.md |
| docs/figures/kinds/hybrid-ukf.svg | **NO** | KINDS.md |
| docs/figures/kinds/hybrid.svg | **NO** | KINDS.md |
| docs/figures/kinds/impairment-eval.svg | **NO** | KINDS.md |
| docs/figures/kinds/inertial.svg | yes | KINDS.md |
| docs/figures/kinds/ins-trn-coast.svg | **NO** | KINDS.md |
| docs/figures/kinds/integrity.svg | **NO** | KINDS.md |
| docs/figures/kinds/jamming.svg | **NO** | KINDS.md |
| docs/figures/kinds/launch-window.svg | **NO** | KINDS.md |
| docs/figures/kinds/leo-navmsg.svg | **NO** | KINDS.md |
| docs/figures/kinds/leo-pass.svg | **NO** | KINDS.md |
| docs/figures/kinds/leo-pnt-chain.svg | **NO** | KINDS.md |
| docs/figures/kinds/leo-ppp.svg | **NO** | KINDS.md |
| docs/figures/kinds/leo-pvt.svg | **NO** | KINDS.md |
| docs/figures/kinds/leo-signal.svg | **NO** | KINDS.md |
| docs/figures/kinds/link-budget.svg | **NO** | KINDS.md |
| docs/figures/kinds/lunar-attack-surface.svg | **NO** | KINDS.md |
| docs/figures/kinds/lunar-beacon.svg | **NO** | KINDS.md |
| docs/figures/kinds/lunar-differential-pnt.svg | **NO** | KINDS.md |
| docs/figures/kinds/lunar-frame-campaign.svg | **NO** | KINDS.md |
| docs/figures/kinds/lunar-frame-realisation.svg | **NO** | KINDS.md |
| docs/figures/kinds/lunar-infrastructure.svg | **NO** | KINDS.md |
| docs/figures/kinds/lunar-integrity.svg | **NO** | KINDS.md |
| docs/figures/kinds/lunar-interop-export.svg | **NO** | KINDS.md |
| docs/figures/kinds/lunar-jamming.svg | **NO** | KINDS.md |
| docs/figures/kinds/lunar-joint-od-clock.svg | **NO** | KINDS.md |
| docs/figures/kinds/lunar-llr-datum.svg | **NO** | KINDS.md |
| docs/figures/kinds/lunar-station-coverage.svg | **NO** | KINDS.md |
| docs/figures/kinds/lunar-time-budget.svg | **NO** | KINDS.md |
| docs/figures/kinds/lunar-time-offset.svg | **NO** | KINDS.md |
| docs/figures/kinds/lunar-vlbi-fim.svg | **NO** | KINDS.md |
| docs/figures/kinds/lunar-vlbi.svg | **NO** | KINDS.md |
| docs/figures/kinds/mars-pnt.svg | **NO** | KINDS.md |
| docs/figures/kinds/moonlight-service-volume.svg | **NO** | KINDS.md |
| docs/figures/kinds/ntn-positioning.svg | **NO** | KINDS.md |
| docs/figures/kinds/oem-interop.svg | **NO** | KINDS.md |
| docs/figures/kinds/optical-atmosphere.svg | **NO** | KINDS.md |
| docs/figures/kinds/orbit.svg | **NO** | KINDS.md |
| docs/figures/kinds/passes.svg | **NO** | KINDS.md |
| docs/figures/kinds/pvt.svg | **NO** | KINDS.md |
| docs/figures/kinds/quantum-anomaly-detect.svg | **NO** | KINDS.md |
| docs/figures/kinds/quantum-gnss-free-nav.svg | **NO** | KINDS.md |
| docs/figures/kinds/quantum-time-transfer.svg | **NO** | KINDS.md |
| docs/figures/kinds/quantum-trade.svg | **NO** | KINDS.md |
| docs/figures/kinds/realtime-frame-eop.svg | **NO** | KINDS.md |
| docs/figures/kinds/reentry.svg | **NO** | KINDS.md |
| docs/figures/kinds/slot-timing.svg | **NO** | KINDS.md |
| docs/figures/kinds/solar-system.svg | **NO** | KINDS.md |
| docs/figures/kinds/space-packet.svg | **NO** | KINDS.md |
| docs/figures/kinds/space-weather.svg | **NO** | KINDS.md |
| docs/figures/kinds/spectrum.svg | **NO** | KINDS.md |
| docs/figures/kinds/spoof-detect.svg | **NO** | KINDS.md |
| docs/figures/kinds/spoof.svg | **NO** | KINDS.md |
| docs/figures/kinds/sweep-nd.svg | **NO** | KINDS.md |
| docs/figures/kinds/sweep.svg | **NO** | KINDS.md |
| docs/figures/kinds/telecom-timing.svg | **NO** | KINDS.md |
| docs/figures/kinds/terrain-nav.svg | **NO** | KINDS.md |
| docs/figures/kinds/terrain-slam.svg | **NO** | KINDS.md |
| docs/figures/kinds/time-transfer-budget.svg | **NO** | KINDS.md |
| docs/figures/kinds/timetransfer.svg | **NO** | KINDS.md |
| docs/figures/kinds/tracking-loop.svg | **NO** | KINDS.md |

## Mermaid diagrams

| diagram | embedded | PNG bound to SVG |
|---|---|---|
| module-map | yes | yes |
| system-overview | yes | yes |
| engine-flow | yes | yes |
| distribution | yes | yes |
| validation-provenance | yes | yes |
