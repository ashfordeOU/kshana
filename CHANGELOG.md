# Changelog

All notable changes to Kshana are documented here.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).
While the project is pre-1.0, the public scenario/result schema may still change;
breaking changes are called out explicitly.

## [Unreleased]

### Planned
- Flicker-FM floor modeling for clocks (the remaining honest noise gap).
- Full Kalman / factor-graph fusion replacing the analytic holdover predictor.
- Multi-window (segment-aware) holdover scoring.
- Gyroscope / angular-random-walk in the inertial pack.
- Orbit-based scenarios (precise time + propagation libraries) and position error.
- Python (PyO3) and WebAssembly bindings.

## [0.7.1] - 2026-06-01

### Fixed
- Quantum and classical runs now use **independent RNG seeds**
  (`classical_seed = seed + 0x9e3779b97f4a7c15`) across all packs; previously both
  shared the scenario seed, producing perfectly correlated noise realizations and a
  misleading comparison.
- The optical inter-satellite re-sync in the hybrid pack now models residual link
  uncertainty as **fresh zero-mean jitter per measurement step** plus re-anchoring at
  the configured interval, instead of a single held constant offset.

### Documented
- `holdover_s` assumes a single contiguous GNSS-outage window (true for all shipped
  scenarios); multi-window timelines need segment-aware holdover (tracked as future
  work). Added a "Known limitations" section to `docs/VALIDATION.md`.

## [0.7.0] - 2026-06-01

### Added
- **Pack 4 — hybrid fusion (capstone):** `hybrid.rs` composes the clock, inertial,
  and time-transfer packs into a unified PNT suite that must hold both timing and
  position; reports `pnt_holdover`. Optional optical inter-satellite time-transfer
  re-syncs the clock during the outage (time aiding only — position is not re-synced).
- `hybrid-pnt.toml` scenario and CLI dispatch for `kind = "hybrid"`; PNT
  spec-utilization SVG chart.

### Changed
- Crate version bumped to 0.7.0 so the `engine_version` embedded in result JSON tracks
  the release.

## [0.6.0] - 2026-06-01

### Added
- **Pack 3 — time transfer:** `timetransfer.rs` models an optical vs RF two-way
  time-transfer link (white timing jitter → synchronization precision → one-way
  ranging), with sync/ranging figures of merit. Maps to ESA's OpSTAR optical
  inter-satellite link.
- `timetransfer.toml` scenario (optical OpSTAR-target 1 ps vs RF TWSTFT 0.5 ns), CLI
  dispatch for `kind = "timetransfer"`, and an SVG chart.
- Validation: simulated sync RMS reproduces the link jitter; `σ/√N` averaging; exact
  `1 ps = 0.299792458 mm` ranging conversion.

## [0.5.0] - 2026-06-01

### Added
- **Pack 2 — inertial dead-reckoning:** `inertial.rs` with `AccelModel` (residual bias
  + velocity random walk, double-integrated to position error), `PositionFoM`, and
  `score_position`.
- `imu-deadreckoning.toml` scenario (cold-atom vs navigation-grade accelerometer), CLI
  dispatch for `kind = "inertial"`, and a position-error SVG chart.
- Validation: position-error standard deviation matches `σ_x(T) = √(S_a·T³/3)` (Groves)
  to ~12%; constant-bias double-integration hand-derived.

## [0.4.0] - 2026-06-01

### Added
- SVG divergence chart (`report::to_svg`); the CLI now emits `<scenario>.chart.svg`
  alongside the result JSON.
- `clock-holdover-labsr.toml` — laboratory-grade strontium optical clock variant
  (σ_y(1 s) = 4.8×10⁻¹⁷, Oelker et al. 2019).

## [0.3.0] - 2026-06-01

### Added
- Full clock noise model: linear aging/frequency drift, with a quadratic holdover
  estimator that removes offset and aging so the reported residual is the stochastic
  limit.
- `allan.rs` — overlapping Allan deviation estimator (Riley, NIST SP 1065).
- Extended validation: white-FM Allan-deviation curve at τ = 1, 10, 100 s (matches the
  CSAC datasheet to ≤5%) and the random-walk-FM relation `σ²_y(τ) = q_rw·τ/3`.

## [0.2.0] - 2026-06-01

### Added
- Clock white-FM noise calibrated to published `σ_y(1 s)` via `q_wf = σ_y(1 s)²`
  (Microchip CSAC datasheet; ESA SOC optical-clock space goal).
- `tests/calibration.rs` — empirical Allan-deviation validation (~2%).

### Changed
- Reference scenario timing spec tightened to 20 ns so the comparison is decisive.

## [0.1.0] - 2026-06-01

### Added
- Initial clock-holdover-during-GNSS-outage engine: time grid, GNSS availability
  timeline, two-state `ClockModel` (white FM + random-walk FM), GNSS-disciplined
  `HoldoverEstimator`, figure-of-merit scoring against ESA's six PNT criteria,
  versioned result schema with scenario hash, and a CLI.
- Reference scenario, golden + reproducibility tests, repository guards
  (`check-reproducible.sh`, `check-no-attribution.sh`), and the Apache-2.0 license.

[Unreleased]: https://github.com/AshfordeOU/kshana/compare/v0.7.1...HEAD
[0.7.1]: https://github.com/AshfordeOU/kshana/compare/v0.7.0...v0.7.1
[0.7.0]: https://github.com/AshfordeOU/kshana/compare/v0.6.0...v0.7.0
[0.6.0]: https://github.com/AshfordeOU/kshana/compare/v0.5.0...v0.6.0
[0.5.0]: https://github.com/AshfordeOU/kshana/compare/v0.4.0...v0.5.0
[0.4.0]: https://github.com/AshfordeOU/kshana/compare/v0.3.0...v0.4.0
[0.3.0]: https://github.com/AshfordeOU/kshana/compare/v0.2.0...v0.3.0
[0.2.0]: https://github.com/AshfordeOU/kshana/compare/v0.1.0...v0.2.0
[0.1.0]: https://github.com/AshfordeOU/kshana/releases/tag/v0.1.0
