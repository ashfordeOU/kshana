# Changelog

All notable changes to Kshana are documented here.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).
While the project is pre-1.0, the public scenario/result schema may still change;
breaking changes are called out explicitly.

## [Unreleased]

### Added
- **Active spoofing-attack demonstrator.** A new `spoof` scenario kind injects a
  ramping false-time spoof and runs each clock's clock-aided integrity monitor,
  reporting whether and when the spoof is detected and whether it reaches the
  operational spec undetected — turning the Security figure of merit into a concrete
  attack/defence demonstration. New `spoof-attack.toml` reference scenario.
- **Multi-constellation availability.** An orbit scenario can combine several
  constellations (a `[[constellations]]` list alongside the primary
  `[constellation]`) for multi-GNSS availability and dilution of precision — e.g.
  GPS plus Galileo. New `orbit-multignss.toml` reference scenario.

### Planned
- Higher-fidelity orbit propagation (precise SGP4 ephemerides / perturbations),
  beyond the current two-body + J2-secular mean-element model.

## [0.5.0] - 2026-06-02

### Added
- **HTML scorecard report.** Every run now also produces a self-contained, branded
  HTML scorecard — the one-line summary, the chart (embedded as an inert data-URI
  image), and the full JSON — written by the CLI alongside the JSON and SVG. A
  shareable single-file artifact for a study deliverable or annex.
- **Joint sensor-fusion estimator.** A new `fusion` scenario kind runs a single
  recursive Kalman filter as the navigation solution — fusing the clock state
  `[phase, frequency]` and the position state `[position, velocity]`, disciplined by
  GNSS (learning the frequency offset and velocity) and aided by optical time
  transfer during the outage — rather than composing independent predictors. It
  reports fused timing/position holdover and a joint-covariance integrity. New
  `fusion-pnt.toml` reference scenario.
- **Fuller IMU noise model.** The accelerometer now models the remaining
  Allan-variance terms beyond the constant bias and velocity random walk:
  **bias instability** (a 1/f flicker floor at the standard Allan bias-instability
  coefficient, reusing the clock's flicker synthesis) and **acceleration random
  walk**. New optional `bias_instability` and `q_aa` inertial scenario fields; a
  GNSS re-fix re-calibrates the residual bias drift.
- **Real constellation geometry from TLEs.** A constellation can be given as a block
  of two-line element sets (the standard NORAD/Celestrak format) via a `tle` field,
  so availability and dilution of precision use a real constellation's published
  geometry instead of a synthetic Walker pattern. The engine reads each TLE's mean
  Keplerian elements and propagates them two-body — not SGP4 — which is sound for a
  snapshot study from a common epoch. New `orbit-real-tle.toml` reference scenario.

## [0.4.0] - 2026-06-02

### Added
- **Trade-study parameter sweeps.** A new `sweep` scenario kind varies one
  parameter (`threshold_ns`, `duration_s`, `quantum_q_wf`, or `classical_q_wf`)
  across a linear or logarithmic range and records a chosen figure of merit at each
  point for both clocks, producing the "how does holdover scale with clock
  stability?" comparison chart a design trade needs. New `sweep-clock-stability.toml`
  reference scenario.
- **Monte Carlo confidence bands.** The clock-holdover scenario can run many
  realizations (new optional `runs` field): each figure of merit is then reported
  as a mean with a 5th–95th-percentile spread, and the chart shades the 5–95%
  error envelope around the median for each clock. A single run remains the default.
  New `clock-ensemble.toml` reference scenario.
- **Eccentric orbits and J2 drift.** The orbit type is now a full Keplerian orbit
  (semi-major axis, eccentricity, inclination, RAAN, argument of perigee, mean
  anomaly), propagated by solving Kepler's equation, with optional secular J2 nodal
  regression and apsidal precession. New optional `eccentricity`, `argp_deg`, and
  `j2` scenario fields, and an `orbit-molniya.toml` reference scenario (a 12 h
  highly-eccentric critically-inclined user). Circular orbits keep the original
  closed-form path bit-for-bit.
- The hybrid (combined-PNT) pack now reports **Integrity** and **Security**, so all
  four packs cover the full set of operational figures of merit. Integrity is the
  timing-channel protection-bound containment from a Kalman estimator disciplined to
  truth while GNSS is nominal and re-anchored (more loosely) at each optical re-sync;
  its bound includes the link's measurement-noise floor, so a clock far better than
  the link is scored against the delivered solution's actual noise. Security is the
  clock-aided spoof-detection score against the timing spec.

### Changed
- Release notes are now generated from the curated CHANGELOG section for the tag
  (`scripts/changelog-extract.sh`), so each GitHub release highlights what changed
  instead of listing raw commits.

## [0.3.0] - 2026-06-02

### Added
- **Security** figure of merit (previously unpopulated): a clock-aided
  spoof-detection score for the clock-holdover and orbit packs. It models an
  integrity monitor that cross-checks GNSS-derived time against the clock's own
  coasted prediction over a coherent window; the detection floor combines the
  averaged measurement noise with the clock's coast uncertainty, so a quieter
  clock detects smaller, slower time-spoofs. The score is reported in `[0, 1]`
  relative to the timing spec, completing the six operational figures of merit.
- Geometry-derived **position accuracy** for the orbit pack: from the
  line-of-sight geometry to the visible satellites it forms the design matrix
  and its covariance factor `Q = (HᵀH)⁻¹`, yielding the dilution-of-precision
  factors (GDOP/PDOP/HDOP/VDOP/TDOP). Position accuracy is the position DOP
  scaled by a configurable user-equivalent range error (new optional
  `sigma_uere_m` scenario field). An orbit result now carries a geometry summary
  (fraction of samples with a fix, best and median PDOP and position sigma).
- An in-browser **playground** (`web/`) that runs the engine client-side as
  WebAssembly: pick a reference scenario or edit the TOML, run it, and see the
  summary, chart, and full JSON, with nothing uploaded. A `pages` workflow
  builds and publishes it to GitHub Pages, and a new `summary` WebAssembly export
  backs the readout.
- Labelled y-axes on the SVG charts: gridlines, numeric tick labels, and a units
  axis title (via a shared `chart` helper), so magnitudes are readable.
- Package-publishing workflow (`publish`) for crates.io, PyPI, and npm, each
  gated on its registry token and triggered by a published release.

## [0.2.0] - 2026-06-02

### Added
- Flicker (1/f) FM floor for the clock error model, synthesised as a sum of
  log-spaced Ornstein-Uhlenbeck processes and calibrated so the flat
  Allan-deviation floor sits at a configurable level. Off by default; enabled
  per clock via the optional `flicker_floor` scenario field.
- Gyro channel for the inertial model: residual gyro bias and angular random
  walk drive an attitude (tilt) error that couples gravity into a horizontal
  specific-force error, the dominant strapdown error-growth mechanism. Off by
  default; enabled per sensor via the optional `gyro_bias` and `q_arw` fields.
- Two-state (phase, frequency) Kalman clock estimator with exact van Loan
  process-noise discretisation. Coasting from a known state reproduces the
  analytic holdover error growth (`q_wf*T + q_rw*T^3/3`) exactly, and the filter
  additionally yields an online 1-sigma uncertainty bound.
- The clock run now reports the **Integrity** figure of merit (previously
  unpopulated): the fraction of outage samples whose error stays inside the
  filter's 3-sigma protection bound, surfaced in the JSON result and CLI summary.
- Geometry-derived GNSS availability: circular-orbit propagation, a Walker-delta
  constellation generator, and line-of-sight visibility (Earth-occultation plus
  elevation mask) produce the availability timeline from real orbital geometry.
  New `orbit` scenario kind and the `orbit-gnss-challenged.toml` reference
  scenario (a spacecraft inside the GNSS shell with intermittent coverage).
- Optional Python extension (PyO3, abi3) exposing `run`, `run_full`, and
  `version`, packaged with maturin (`pyproject.toml`) and built for Linux, macOS,
  and Windows by a release-tag `wheels` workflow. The binding is a feature-gated,
  optional dependency: the default build, tests, and dependency-audit gate are
  unaffected.
- Optional WebAssembly module (wasm-bindgen) exposing `run`, `chart_svg`, and
  `version`, built with wasm-pack under the `wasm` feature; `getrandom` is
  target-gated to use the browser entropy source on `wasm32`.
- Shared `api::run_toml` dispatch used by the CLI and both bindings, so the
  command line and the bindings cannot drift.

### Changed
- Holdover scoring is now segment-aware: outage timelines are split into
  contiguous segments at GNSS re-acquisition, and the reported holdover is the
  worst-case (shortest) coast across them. Single-outage scenarios are
  unchanged. Applies to the clock, inertial, and hybrid scorers.
- The inertial model's reported `kind` is now `inertial` (was `accelerometer`),
  reflecting the combined accelerometer and gyro channels.

## [0.1.0] - 2026-06-01

Initial release.

### Added
- **Deterministic simulation engine** for hybrid quantum/classical PNT: a common
  error-model interface, declarative GNSS-availability scenarios, holdover /
  dead-reckoning estimators, and figure-of-merit scoring against the standard
  operational PNT criteria. Results are reproducible from `scenario + seed + engine
  version` (versioned, self-describing JSON with a scenario hash) and rendered as SVG
  charts. The CLI dispatches scenarios by `kind`.
- **Four sensor packs**, each calibrated to published data and validated against the
  standard relation:
  - **Clock holdover** — white FM, random-walk FM, and linear aging; validated by
    overlapping Allan deviation (Riley, NIST SP 1065). Chip-scale atomic clock vs
    strontium optical lattice clock.
  - **Inertial dead-reckoning** — residual bias + velocity random walk, double
    integrated to position error; validated against Groves' error-growth relations.
    Cold-atom vs navigation-grade accelerometer.
  - **Time transfer** — optical vs RF link timing jitter → synchronization precision →
    one-way ranging.
  - **Hybrid fusion (capstone)** — a combined PNT suite that must hold both timing and
    position, with optional optical inter-satellite time-transfer clock-aiding.
- **One cited reference scenario per pack** under `scenarios/`, every numeric
  parameter carrying a peer-reviewed `provenance`.
- **Reproducibility and repository-hygiene guards**; CI (format, clippy, tests,
  guards, MSRV) and a tag-gated release pipeline that re-runs all checks.
- **Documentation**: README with architecture diagrams, validation-status report,
  contributing guide, security policy, and code of conduct; Apache-2.0 license;
  issue/PR templates and Dependabot configuration.
- Vendor-neutral throughout; peer-reviewed scientific and metrology citations retained.
- Apache-2.0 license hygiene: SPDX headers on all sources, a `NOTICE` with trademark
  notice, Developer Certificate of Origin (DCO) sign-off for contributions, and
  `cargo-deny` enforcement of dependency licenses/advisories in CI.
- Open-core positioning (README): a free Apache-2.0 engine plus available commercial
  support, integration, and proprietary extensions from Ashforde OÜ — sustained by
  services, not license fees.
- `CITATION.cff` so the software can be cited.

[Unreleased]: https://github.com/AshfordeOU/kshana/compare/v0.5.0...HEAD
[0.5.0]: https://github.com/AshfordeOU/kshana/compare/v0.4.0...v0.5.0
[0.4.0]: https://github.com/AshfordeOU/kshana/compare/v0.3.0...v0.4.0
[0.3.0]: https://github.com/AshfordeOU/kshana/compare/v0.2.0...v0.3.0
[0.2.0]: https://github.com/AshfordeOU/kshana/compare/v0.1.0...v0.2.0
[0.1.0]: https://github.com/AshfordeOU/kshana/releases/tag/v0.1.0
