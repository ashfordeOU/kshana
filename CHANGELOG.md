# Changelog

All notable changes to Kshana are documented here.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).
While the project is pre-1.0, the public scenario/result schema may still change;
breaking changes are called out explicitly.

## [Unreleased]

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

### Changed
- Holdover scoring is now segment-aware: outage timelines are split into
  contiguous segments at GNSS re-acquisition, and the reported holdover is the
  worst-case (shortest) coast across them. Single-outage scenarios are
  unchanged. Applies to the clock, inertial, and hybrid scorers.
- The inertial model's reported `kind` is now `inertial` (was `accelerometer`),
  reflecting the combined accelerometer and gyro channels.

### Planned
- Orbit-based scenarios (precise time + propagation libraries) and position error.
- Python (PyO3) and WebAssembly bindings.

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

[Unreleased]: https://github.com/AshfordeOU/kshana/compare/v0.1.0...HEAD
[0.1.0]: https://github.com/AshfordeOU/kshana/releases/tag/v0.1.0
