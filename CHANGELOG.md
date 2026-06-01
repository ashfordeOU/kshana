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

[Unreleased]: https://github.com/AshfordeOU/kshana/compare/v0.1.0...HEAD
[0.1.0]: https://github.com/AshfordeOU/kshana/releases/tag/v0.1.0
