# Stream 7: lab fit of receiver behaviour (`iq::labfit`)

Entries for integration to merge into `CHANGELOG.md` and `docs/VALIDATION.md`. This
stream did not edit those files, `docs/VERIFICATION-MATRIX.md`, or any surface outside
`src/iq/labfit/`, `tests/iq_labfit.rs` and this note.

## What was built

`src/iq/labfit/` fits the open receiver's lock models to a real receiver's observed loss
of lock and reacquisition in lab runs.

| File | Content |
|---|---|
| `schema.rs` | TOML scenario (`kind = "iq-labfit"`): runs (a `receiver-trust` `LogCfg` plus stated conditions: onset, offset, a `cn0-drop` or `j-over-s` level profile, stepped or linear, jammer type, Doppler rate, code slew); fit settings (seed, bootstrap count, folds, grid, budget); bounds; loop settings held fixed; condition-distance scales; prediction queries. |
| `observe.rs` | Per-satellite observations from a `receiver_trust::Timeline`: pre-onset median C/N0, first loss after onset, reacquisition after it (epoch midpoints), C/N0 at loss and reacquisition, reported C/N0 inside the event. |
| `model.rs` | Tracking-loop model (thresholds from `tracking_loop::LoopConfig::thresholds`; fitted: PLL bandwidth, pull-in ratio, drop and re-lock dwells; held: integration time, spacing, DLL bandwidth, allowances; per-run dynamics) and an empirical baseline (drop C/N0, hysteresis, two dwells). Continuous-time two-threshold detector with confirmation dwells; analytic crossings of stepped or linear level profiles. |
| `optim.rs` | In-crate Nelder-Mead (none existed), unbounded and bounded (MINUIT sine transform), restarts, starting grid. |
| `fit.rs` | Level-calibration offset fit (reported vs. modelled C/N0); staged bounded least squares on event times (drop pair on loss times, re-lock pair, then joint); seeded bootstrap over runs; leave-one-run-out or seeded k-fold hold-out split into interpolation and extrapolation; predictions labelled `PREDICTION` with nearest tested run, distance, extrapolation distance and bootstrap band. |
| `synth.rs` | Synthetic runs from known parameters (seeded C/N0 noise and per-satellite threshold jitter), for the tests. |
| `report.rs` | JSON, residual CSV, prediction CSV, markdown; every row carries its run's SHA-256 (of the log bytes, or of the JSON timeline for a synthetic run). |
| `mod.rs` | `load_runs`, `run_scenario`, `run_toml`, `resolve_paths`. |

Not wired to the CLI, Python, WebAssembly or MCP surfaces, and not registered as a
dispatcher kind (integration's job, plan step 2). The README kind count is unchanged.

## Proposed CHANGELOG entry (Unreleased / Added)

- `iq::labfit`: fit the tracking-loop loss-of-lock model and a per-receiver empirical
  threshold baseline to observed per-satellite loss-of-lock and reacquisition times in
  lab runs (receiver-trust timelines plus stated onset/offset, stepped or ramped C/N0-drop
  or J/S level, platform dynamics), with a fitted level-calibration offset, bootstrap
  uncertainty over runs, leave-one-run-out / k-fold hold-out error split into
  interpolation and extrapolation, and predictions for untested conditions labelled
  `PREDICTION` with the nearest tested run and extrapolation distance. JSON, CSV and
  markdown reports trace every number to its log's SHA-256. In-crate Nelder-Mead.
  MODELLED.

## Proposed VALIDATION entry

**Status: MODELLED.** No real-receiver fit has been checked against an independent
oracle. What is tested (`tests/iq_labfit.rs`, `iq::labfit::optim` unit tests):

| Claim | Reference | Tolerance |
|---|---|---|
| Nelder-Mead reaches the Rosenbrock minimum from (−1.2, 1) | closed form (1, 1), f = 0 | 1e-6 in x, f < 1e-12 |
| Bounded Nelder-Mead lands on the active bound | closed form (separable quadratic) | 1e-9 / 1e-6 |
| Forward model loss/reacquisition times on a linear ramp | closed-form crossing time | 1e-12 s |
| Loop model thresholds | `tracking_loop::LoopConfig::thresholds` (reuse, bit-equal) | exact |
| Noise-free synthetic runs: offset; empirical and loop parameters | generating values | offset 1e-6 dB; thresholds 0.03–0.05 dB, PLL bandwidth 0.1 Hz, ratio 0.05; dwells 0.03–0.05 s (0.02 s epochs) |
| Noisy synthetic runs (0.5 dB C/N0 noise, 0.3 dB threshold jitter): parameters | generating values | 0.4 dB / 0.5 dB / 0.5 s / 0.8 s and within 4 bootstrap sd |
| J/S levels: offset through the inverse of `jamming::effective_cn0_dbhz` | generating value | 1e-6 dB |
| Stepped levels pin a threshold to its step | generating value | one step (2 dB) |
| Hold-out: dynamics-blind baseline is worse on a 40 Hz/s run outside the 0–15 Hz/s training range, which is classed `extrapolation` at distance 25; the loop model is not | generating model | see test |
| Predictions: labels, nearest tested run, box distance | closed form | 1e-12 |
| Determinism | same seed → bit-identical JSON | exact |
| End to end: TOML → RINEX text → `receiver_trust` reader → fit; SHA-256 equals the bytes' digest | `sha2` on the same bytes | exact |
| JammerTest 2024 fixture (`jt2024_2_1_1.obs`) is reported unusable, with its SHA-256 | the fixture has `C1C C2L` only, no `S` codes | exact |

## Limitations (state in the release notes)

- The JammerTest fixtures in `tests/` carry pseudoranges but no C/N0, and the JammerTest
  jamming power-ramp fixture is not in the tree, so no real-receiver fit is in the test
  suite. The real-log path is exercised only to the point of correctly refusing a log
  without C/N0.
- One loss and one reacquisition per satellite per run; nominal C/N0 is the pre-onset
  median, held constant (no elevation change). One global level-calibration offset.
- Observed event times are epoch midpoints (± half an epoch).
- A stepped test pins thresholds only to the step that contains them; the objective is
  piecewise constant in the thresholds there.
- In the loop model, integration time, spacing, DLL bandwidth and allowances are stated,
  not fitted (they are not separately identifiable from loss times alone). Oscillator and
  vibration jitter are not modelled (as in `tracking_loop`).
- Bootstrap refits are warm-started at the full fit; on a multimodal objective that can
  understate the spread. Cross-validation folds refit from the grid.
- Fitted parameters describe the open model fitted to observed behaviour, not a
  commercial receiver's internals.
