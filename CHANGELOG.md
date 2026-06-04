# Changelog

All notable changes to Kshana are documented here.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).
While the project is pre-1.0, the public scenario/result schema may still change;
breaking changes are called out explicitly.

## [Unreleased]

## [0.10.0] - 2026-06-04

### Changed
- **Real-data validation.** The multi-GNSS RINEX navigation parser, the GLONASS
  RK4 propagator, and the SP3 reader are now exercised against genuine IGS/DLR
  files (a real RINEX 3 mixed broadcast nav file and an IGS SP3-c orbit product),
  not only self-authored samples — asserting non-empty satellite sets and finite,
  physically-sized ECEF positions. The fixtures are test-only (excluded from the
  published crate); see `tests/fixtures/igs/NOTICE`.
- **RAIM on real reference-orbit geometry.** The snapshot, solution-separation
  (MHSS), and ARAIM protection-level cores are now validated against the real IGS
  precise-orbit (SP3) geometry, not synthetic constellations alone: the line-of-sight
  geometry is built from the first SP3 epoch at a real ground station, and the tests
  assert metre-level, APV-I-available protection levels, that a 60 m pseudorange bias
  trips the χ² monitor, that solution separation **identifies** the faulted satellite,
  and that ARAIM's levels meet the allocated `P_HMI`. Closes the
  validated-on-synthetic-geometry-only gap (receiver-domain gLAB parity over a full
  RINEX arc remains a roadmap item — it needs a pseudorange solution).

### Added
- **Per-node confidence intervals for the N-D parameter sweep** (`sweep::nd_sweep_ensemble`).
  Each grid node of the N-dimensional Cartesian-product sweep can now be evaluated as a
  Monte-Carlo ensemble of seeds, reporting the metric's mean, percentiles, and a
  percentile-bootstrap 95% CI per node (for both clocks) — a statistically honest sweep
  rather than one draw per node. Reuses the ensemble/bootstrap machinery (`metric_stat`);
  deterministic; `runs = 1` reduces exactly to the single-seed `nd_sweep`. (Generalising
  the sweep across all packs, entangled with the typed-Scenario refactor, and parallel
  execution remain.)
- **NaveGo cross-validation of the IMU-noise pipeline** (`tests/navego_imu_crossval.rs`).
  An external cross-check against NaveGo (R. Gonzalez's open-source INS/GNSS toolbox):
  reproduces the synthetic round-trip of `navego_example_allan.m` on its published
  Microstrain 3DM-GX3-35 reference profile, confirming our overlapping-ADEV estimator
  recovers NaveGo's velocity- and angle-random-walk coefficients (`ADEV(1 s) = σ·√dt`)
  to under 5% with the expected −1/2 white-noise slope. (The 40 MB recorded STIM300
  `.mat` log is not ingested — binary-format-gated.)
- **Tightly-coupled (pseudorange) GNSS/INS update.** `GnssInsEkf::update_tightly_coupled`
  (and the `ClosedLoopInsGnss::fuse_tightly_coupled` wrapper) implement the
  previously-stubbed range-domain measurement: the innovation is the predicted
  range from the INS position to each satellite versus the measured pseudorange,
  with a line-of-sight Jacobian on the position error. Because each satellite is a
  scalar measurement, the filter keeps correcting with **fewer than four
  satellites** — where a loosely-coupled PVT fix does not exist. Five tests cover
  four-satellite nulling, two-satellite correction (no PVT possible), single-
  satellite along-line-of-sight observability, and input validation. Pseudorange-
  only; carrier phase and an explicit receiver-clock state remain roadmap. The
  unused `tight_coupling` cargo feature (which gated the old error stub) is removed.
- **Loosely-coupled GNSS/INS scenario pack (`kind = "gnss-ins"`, `src/fusion/pack.rs`).**
  Wires the three-axis strapdown navigator and the 15-state error-state EKF
  (`closed_loop` / `gnss_ins_ekf`) into a runnable scenario with a figure of merit —
  the EKF disciplines the mechanization against noisy GNSS fixes while coverage is
  up, then coasts through the outage, replacing the legacy 1-DOF scalar pack's
  truth-snap reset with genuine fusion. The result reports the fused horizontal
  error series, the scored position FoM (availability / outage RMS / holdover), and
  the open-loop free-INS RMS for comparison; a quantum/classical IMU pair differs
  only in true bias. Dispatched from the CLI/Python/wasm entry point with a
  `scenarios/gnss-ins.toml` example. Honest framing: loosely-coupled only, one
  deterministic trajectory, and the fused outage error is floor-limited by the
  hand-over attitude error (so it is not claimed to scale with bias) — the robust
  findings are that fusion beats unaided dead-reckoning for a biased sensor and that
  a lower-bias sensor has the better unaided coast.
- **Constellation design on the validated SGP4 core (`src/walker.rs`).** A new
  `walker` module emits a designed Walker-delta pattern (`i: T/P/F`) as SGP4
  **mean elements**, so the synthetic constellation propagates through the same
  SGP4 path validated to 4.12 mm against the AIAA 2006-6753 vectors — not the
  analytic Keplerian generator. On top of it: `pdop_sweep` tabulates coverage and
  median/worst PDOP over a `{planes × sats × inclination}` design grid, and
  `coverage_revisit` reports the coverage fraction and revisit gaps (worst/mean)
  at a ground point. Validated by the physical monotonicities a trade must obey
  (more satellites ⇒ higher coverage, lower PDOP, shorter revisit). Separately, a
  genuine **Celestrak `gps-ops` TLE snapshot** (2021-07-28, 30 operational GPS
  satellites) is added as a test-only fixture and the real-TLE → SGP4 → ECEF
  geometry path validated against it (full MEO shell within 1%, nine-satellite
  all-in-view at PDOP 1.64), alongside the existing SP3 and RINEX real-data paths.
- **Noise-type-specific effective degrees of freedom for the Allan confidence
  intervals.** `allan::edf_overlapping_adev` implements the NIST SP 1065 Table 5
  closed forms (the Stable32 simple set) for all five canonical power-law noise
  types — white/flicker PM, white/flicker FM, random-walk FM — replacing the
  conservative non-overlapping count as the χ² degrees of freedom. A new
  `PowerLawNoise` enum and `classify_power_law` identify the dominant type from
  the record's **modified** Allan-deviation slope (MDEV separates white from
  flicker PM where ADEV cannot), and `overlapping_adev_curve` now attaches the
  identified noise type, its edf, and a 95% confidence band to every point of the
  exported ADEV curve (`AdevPoint` gains `noise`/`edf`/`ci_lo`/`ci_hi`, additive
  with serde defaults). Validated two ways: the five formulas match hand-evaluated
  values to 1e-12, and a 4 000-record Monte-Carlo white-FM ensemble confirms the
  formula predicts the estimator's actual chi-squared edf within 20% (and that it
  materially beats the conservative count). Eight new tests.
- **Two-way time-transfer stochastic model.** `timetransfer::TwoWayLink` replaces the
  white-only sampler with a physically-grounded model: the reciprocal (common-mode) path
  delay cancels in the `(m_AB - m_BA)/2` estimate (`two_way_offset_estimate`, so two
  independent one-way measurements average to `1/sqrt(2)`), and the residual is the
  **non-reciprocal** differential delay — modelled as a colored white-FM + random-walk-FM
  process (the validated `ClockModel`), giving the synchronization-error series a realistic
  Allan signature (`sigma_y^2(tau) = q_rw*tau/3`) instead of flat white noise. `LinkCfg`
  gains `q_wf_s`/`q_rw_s` (serde default 0 ⇒ the legacy white-only behaviour, bit-for-bit),
  the link FoM reports `adev_tau0` (the model's Allan deviation at the base step), and the
  `timetransfer` scenario/CLI surface it. Golden FoM re-pinned. Six hand-derived tests
  (common-mode cancellation, the sqrt(2) two-way gain, the RWFM `tau/3` law via the link's
  own `step()`, legacy-equivalence at `q=0`, determinism, and end-to-end FoM exposure).
- **Stable32 numeric parity for the Allan-family estimators (NBS14).** `tests/allan_reference.rs`
  validates the overlapping ADEV, modified ADEV, time deviation, and overlapping Hadamard
  estimators against the Stable32 reference deviations for the canonical **NBS14** dataset
  (W. J. Riley, *Handbook of Frequency Stability Analysis*, NIST SP 1065, ~p.107) at
  tau = 1, 2 to a 1e-4 relative tolerance — actual agreement ~1e-6. This pins the
  estimator mathematics against the de-facto reference implementation, not just against
  the estimators' own analytic self-consistency. Only the public reference numbers are
  used; no third-party code.
- **Vertical Stanford integrity diagram exported by the `integrity` scenario.** The
  runnable `integrity` scenario kind now exports a vertical Stanford(-ESA) diagram
  alongside the HPL/VPL availability map: at each protected epoch a seeded, reproducible
  no-fault range-error draw is mapped through the geometry to an actual vertical position
  error and classified against the VPL and the vertical alert limit (Available /
  System-Unavailable / Misleading / Hazardously-Misleading). The diagram (per-epoch
  points + region counts) is carried in the result JSON and the integrity-event / HMI
  counts in the CLI summary, so the Stanford classifier — previously library-only — is
  reachable end-to-end. `IntegrityScenario` gains a `seed` field (default 0) controlling
  the error realization; the availability map itself remains geometry-only and seed
  independent.
- **ARAIM integrity-risk (P_HMI) budget for the protection levels.** `raim::araim_raim`
  derives the horizontal and vertical protection levels from an explicit integrity-risk
  budget rather than a fixed `K_md` multiplier: for the all-in-view solution and every
  single-satellite exclusion sub-solution it builds the per-mode `(prior, detection
  threshold, σ)` on each axis, then `araim_protection_level` solves the smallest PL whose
  summed probability of hazardously-misleading information (`araim_integrity_risk`,
  `P_HMI = Σ_k p_fault,k · Q((PL − T_k)/σ_k)`, Blanch et al. *Baseline ARAIM*) meets the
  allocated `P_HMI`. The result reports the integrity risk the levels actually achieve, so
  a user can trade integrity against the alert limit explicitly. Six hand-derived tests
  (fault-free and thresholded single-mode closed forms, multi-mode summation/monotonicity,
  end-to-end fault-free protection with a 10⁵× tighter budget raising the PL, fault
  detection/identification, and the six-satellite redundancy floor). Single-fault MHSS is
  the ARAIM baseline; simultaneous multi-SV-subset faults, the constellation-wide fault
  mode, and gLAB reference-dataset validation are documented extensions.
- **Two-speed coning/sculling compensation for the strapdown mechanization.**
  `inertial::mechanization::coning_sculling_compensate` folds the high-rate coning
  (attitude) and rotation+sculling (velocity) terms out of a coarse update's
  ordered sub-interval IMU increments, so a moderate-rate `NavState::step_increments`
  reproduces vibration-rectified motion a coarse step over the raw sums misses. A
  validation test drives a 10 Hz coning+sculling environment for 60 s and compares
  fine-rate truth, naive coarse integration, and the folded coarse integration:
  the fold cuts the position error by ~18× (metres of naive drift → sub-decimetre),
  confirming the coning/sculling terms are load-bearing. A `ScalarErrorBudget`
  type alias names the legacy 1-DOF `AccelModel` for what it is, distinct from the
  three-axis `NavState` navigator.
- **RINEX observation-file parser.** New `rinex_obs` module reads the RINEX 3.0x /
  4.00 *observation* file — the receiver's actual measurements — completing the
  RINEX pair alongside the existing navigation-message parser. `parse_obs` decodes
  the header (version/type, the per-system `SYS / # / OBS TYPES` lists with
  continuation lines, approximate position, interval, time of first observation)
  and each epoch's per-satellite records: pseudorange, carrier phase, Doppler, and
  signal strength, keyed by their RINEX 3 observation code (`C1C`, `L1C`, …) with
  the loss-of-lock (LLI) and signal-strength (SSI) flags, a blank field preserved
  as absent rather than zero. Honest scope: this is the standards-format *ingest*
  (a real RTKLIB/gLAB/IGS-station observation log in, typed measurements out), not
  a positioning engine — no pseudorange solution, PPP, or RTK here.
- **CCSDS OEM (Orbit Ephemeris Message) writer.** New `oem` module exports a
  propagated constellation as a valid CCSDS 502.0-B OEM 2.0 message —
  the KVN ephemeris format GMAT, Orekit, STK, and most flight-dynamics tools
  ingest. `OemFile::from_propagators` samples each satellite's inertial
  (TEME) state — position **and** velocity, taken straight from the propagator
  with no Earth-fixed rotation, unlike the SP3 export — onto a time grid, and
  `OemFile::to_oem_string` serialises the `CCSDS_OEM_VERS`/`CREATION_DATE`/
  `ORIGINATOR` header plus one `META_START … META_STOP` segment per satellite
  (`OBJECT_NAME`/`OBJECT_ID`/`CENTER_NAME`/`REF_FRAME = TEME`/`TIME_SYSTEM = GPS`/
  `START_TIME`/`STOP_TIME`) followed by its `epoch X Y Z X_DOT Y_DOT Z_DOT`
  lines (km, km/s). The `CREATION_DATE` is caller-supplied, never wall-clock, so
  output is byte-identical across runs (the reproducibility contract). This is the
  spacecraft-ephemeris counterpart to the GNSS SP3 export: a Kshana orbit can now
  be handed to a flight-dynamics tool in a standard format.
- **SP3 precise ephemeris as a propagation source.** `Sp3File::interpolator`
  builds a per-satellite `Sp3Interpolator` that fills the position between the
  tabulated SP3 epochs with a 9th-order Lagrange polynomial (standard IGS
  practice) and rotates it into the shared TEME frame, exposed as
  `Propagator::Sp3Precise`. An IGS/analysis-centre precise-orbit file can now drive
  the same geometry/visibility/integrity pipeline as the broadcast and analytic
  propagators. Validated round-trip: a Kepler orbit written to SP3 and re-read
  through the interpolator matches the original to sub-metre at the nodes and
  < 100 m mid-interval. Clock interpolation is next.
- **GLONASS broadcast ephemeris (completes multi-GNSS RINEX nav).** New `glonass`
  module: GLONASS doesn't broadcast Keplerian elements but a PZ-90 Earth-fixed
  **state vector** (position, velocity, luni-solar acceleration). `parse_glonass_nav`
  reads the RINEX 3 `R` records, and the satellite position at any time is obtained
  by **4th-order Runge–Kutta integration** of the GLONASS ICD equations of motion
  (central gravity + `J2` + Earth-rotation Coriolis/centrifugal terms + the
  broadcast acceleration). Exposed as `Propagator::Glonass`, so GLONASS satellites
  flow through the constellation/visibility/integrity pipeline alongside the
  Keplerian systems; a single `rinex` constellation block can now mix GPS, Galileo,
  QZSS, BeiDou, and GLONASS.
- **Multi-GNSS RINEX navigation (GPS, Galileo, QZSS, BeiDou).** The RINEX 3
  navigation parser now decodes Galileo (`E`), QZSS (`J`), and BeiDou (`C`,
  MEO/IGSO) records alongside GPS (`G`) — they share the Keplerian layout and user
  algorithm — each evaluated with its own gravitational constant and Earth-rotation
  rate (Galileo/BeiDou μ, BeiDou Ω̇ₑ). A mixed-constellation file yields all of
  them, flowing through the constellation/visibility/integrity pipeline as
  `Propagator::Rinex`. BeiDou geostationary satellites use a different coordinate
  rotation and are skipped pending a reference fixture to validate against. The
  record walker uses per-system line counts, fixing a latent bug where four-line
  GLONASS/SBAS records were skipped as if eight lines long. GLONASS (a state-vector
  model) is next.
- **SP3-c/d precise-ephemeris reader and writer.** New `sp3` module parses
  IGS/analysis-centre SP3 precise orbit files (`parse_sp3`) — the post-processed
  ECEF position/clock product that PPP engines (Ginan, RTKLIB, gLAB) treat as
  reference — into a structured `Sp3File` (header, epoch grid, per-satellite
  position km→m, clock µs, and velocity dm/s→m/s for `V` products), preserving the
  SP3 bad-value sentinels. The reverse direction is also covered:
  `Sp3File::from_propagators` builds an SP3 from a propagated constellation
  (TEME→ECEF per epoch) and `to_sp3_string` serialises it, so Kshana orbits can be
  exported in the format external PPP tools ingest — the read↔write round trip.
  Epoch interpolation and an SP3 propagator source are next.
- **RINEX broadcast ephemeris as a runnable constellation source.** A
  constellation now accepts an inline `rinex` block (RINEX 3 GPS navigation
  text) alongside the existing `tle` option, so a real broadcast file drives a
  scenario end-to-end from the CLI, Python, or the in-browser playground — RINEX
  in, PNT geometry out. New `scenarios/orbit-rinex.toml` demonstrates GNSS
  availability and DOP from eight GPS satellites built straight from broadcast
  records. (GPS LNAV only; multi-GNSS and SP3 are next.)
- **RINEX broadcast ephemeris as a propagation source.** A parsed
  `RinexEphemeris` now converts to an `orbit::Propagator` (`Propagator::Rinex`):
  position is the IS-GPS-200 broadcast orbit rotated from ECEF into the shared
  TEME inertial frame (`sv_position_teme`, with leap-second-correct GPS→UT1 time),
  velocity by central finite difference, and the Keplerian orbital period. Real
  GPS broadcast data can now drive the same geometry, visibility, and integrity
  (RAIM) pipeline as the analytic SGP4/Keplerian propagators. (Not yet exposed as
  a RINEX-file scenario kind — that and multi-GNSS/SP3 are next.)

## [0.9.2] - 2026-06-03

### Added
- **Archival DOI.** Releases are now deposited to Zenodo and assigned a citable DOI.

## [0.9.1] - 2026-06-03

### Changed
- **Documentation.** Refreshed the README to institutional grade: a Capabilities
  overview of the full v0.9.0 stack, a Versioning & releases section, a clean
  header with the new mark, and a concise status line. No engine changes.

## [0.9.0] - 2026-06-03

This release adds three substantial capability areas on top of the 0.8.0 SGP4
substrate: a genuine three-axis strapdown INS, a loosely-coupled GNSS/INS
error-state EKF with closed-loop feedback, real snapshot and solution-separation
(ARAIM-style) RAIM with HPL/VPL and a runnable `integrity` scenario, and the first
step of GNSS-format interoperability (RINEX-3 GPS ephemeris ingestion).

### Added
- **RINEX 3 GPS navigation-message parser (`src/rinex.rs`).** First step toward
  GNSS-format interoperability: `parse_nav` reads a RINEX 3.x navigation file and
  decodes each GPS (`G`) broadcast-ephemeris record — the eight-line SV/epoch +
  `BROADCAST ORBIT` block — into a `RinexEphemeris` of Keplerian elements and
  clock corrections, with field names and units per IS-GPS-200. Handles the
  Fortran `D`-exponent float format (`parse_d`) and fixed-width column layout;
  records for non-GPS systems are skipped, not rejected, so a mixed file still
  yields its GPS ephemerides. Four tests: `D`-exponent parsing (including blanks
  and errors), a full record decoded against known field values with a GPS
  semi-major-axis sanity check (√A² ≈ 26 560 km), non-GPS skipping, and the
  empty-file case.
- **GPS broadcast-ephemeris → ECEF position (`src/rinex.rs`).**
  `RinexEphemeris::sv_position_ecef(t_tow)` evaluates the satellite's Earth-fixed
  position from the parsed ephemeris via the IS-GPS-200 §20.3.3.4.3.1 user
  algorithm: Newton solution of Kepler's equation for the eccentric anomaly, the
  second-harmonic argument-of-latitude / radius / inclination corrections, and the
  rotation into ECEF accounting for Earth rotation since the reference epoch (with
  the GPS `μ` and `Ω̇ₑ` mandated by the spec, and a week-rollover `tk` fold). Three
  tests: the geocentric radius stays in the GPS band (≈ 26 560 km), the Earth-fixed
  speed is ~3.9 km/s, and evaluating a full week away reproduces the same position.
- **GPS SV clock bias with the relativistic correction (`src/rinex.rs`).**
  `RinexEphemeris::sv_clock_bias_s(t_tow)` evaluates the broadcast clock
  polynomial `af0 + af1·Δt + af2·Δt²` about `Toc` plus the relativistic
  eccentricity term `F·e·√A·sin Ek` (IS-GPS-200 §20.3.3.3.3.1). A new
  `EpochUtc::gps_time_of_week` converts the record's calendar epoch to GPS
  time-of-week via Julian-day arithmetic from the GPS epoch (1980-01-06), and the
  Kepler solve is shared with the position evaluation. Tests: GPS time-of-week for
  a Sunday/Tuesday/Saturday (week boundaries), and the clock bias being
  af0-dominated with a present, bounded relativistic term. The L1 group-delay
  `TGD` is exposed but deliberately not folded in. Honest scope: a `Propagator`
  source, Galileo/BeiDou/GLONASS, and SP3 remain next steps. (`docs/CAPABILITY.md`
  updated to match.)
- **User-runnable `integrity` scenario kind (`scenarios/integrity-raim.toml`).**
  The RAIM availability capability is now reachable from the CLI/TOML like every
  other pack: `kind = "integrity"` parses an `IntegrityScenario` (user orbit, one
  or more GNSS constellations, elevation mask, and the `(sigma, P_fa, P_md, AL_H,
  AL_V)` integrity config), runs `constellation_raim_availability`, and emits the
  per-epoch HPL/VPL availability map as JSON plus a self-contained SVG —
  protection levels over time against the alert limits, with a green/red
  availability strip. `kshana scenarios/integrity-raim.toml` writes the JSON, the
  chart, and an HTML report. The bundled scenario (24-satellite Walker, 1 m
  dual-frequency ranging, APV-I limits) reports ~95 % availability; it documents
  that single-frequency RAIM does not meet the vertical APV-I limit on one
  constellation, which is why vertical guidance uses SBAS/dual-frequency/ARAIM.
  Tests cover the dispatch, the availability-map JSON, and the SVG.
- **Runnable RAIM availability over a constellation (`src/raim.rs`).** The
  integrity module had no caller — `constellation_raim_availability` makes it a
  genuine end-to-end entry point: at each epoch on a time grid it propagates the
  visible satellites (the same SGP4/Keplerian `Propagator`s the engine uses),
  computes the no-fault protection levels, and judges availability against the
  horizontal/vertical alert limits, returning a `serde`-serializable
  `RaimAvailabilityReport` (per-epoch `n_visible`/HPL/VPL/`available` plus the
  availability fraction). A `RaimConfig` bundles `(sigma, P_fa, P_md, AL_H, AL_V)`
  and the per-epoch `raim_availability_epoch` is exposed for callers that resolve
  their own geometry. Three tests: an epoch judged available under APV-I limits on
  a ten-satellite geometry, made unavailable by an impossibly tight limit, and
  `None` levels below five satellites; and an end-to-end run over a 24-satellite
  Walker constellation that yields a finite availability map and serializes. (Six
  satellites — the residual-RAIM redundancy floor — honestly do *not* meet APV-I
  even at 1 m ranging; APV-I availability needs the denser geometry the test uses.)
- **Stanford(-ESA) integrity diagram accumulator (`src/raim.rs`).** The standard
  way to summarise an integrity monitor over many epochs: it plots actual
  position error (x) against protection level (y) and classifies each epoch, by
  the diagonal `y = x` and the alert limit, into `Available` (PL bounds error,
  within AL), `SystemUnavailable` (PL bounds error but exceeds AL — safe,
  unusable), `MisleadingInformation` (PL < error ≤ AL), or
  `HazardouslyMisleadingInformation` (PL < error and error > AL — the unsafe
  failure). `classify_stanford` is the pure classifier; `StanfordDiagram`
  accumulates `(error, PL)` points against a fixed alert limit, exposing region
  counts, availability, integrity-event totals, and `serde`-serializable points
  for plotting/JSON export. Four tests: every region (including the `error == PL`
  bounded boundary), count/availability accumulation, and JSON round-trip. This
  is the reporting surface for the RAIM protection levels; wiring it into the
  constellation scenario and validating against a public dataset remain roadmap
  items.
- **Solution-separation (ARAIM-style) RAIM (`src/raim.rs`).** A
  multiple-hypothesis integrity monitor alongside the existing residual/parity
  chi-squared `snapshot_raim`. For the all-in-view least-squares solution and
  every single-satellite exclusion sub-solution, it forms the separation
  `Δ_k = x_k − x₀` — zero-mean Gaussian under no fault with covariance
  `Cov(x_k) − Cov(x₀)` (the nested-estimator identity, valid because the
  all-in-view solution is BLUE) — and so it both **detects** a fault and
  **identifies** the faulted satellite (the one whose exclusion gives the largest
  normalized separation). Horizontal/vertical protection levels follow the
  standard MHSS allocation `PL = max(K_md·σ₀, max_k[K_fa·σ_ss,k + K_md·σ_k])`,
  with `K_fa = Φ⁻¹(1−P_fa/2)`, `K_md = Φ⁻¹(1−P_md)`. New dependency-free
  `normal_cdf`/`normal_quantile` built from the module's existing regularized
  incomplete gamma (`erf(x) = P(½,x²)`). Four hand-derived tests: normal CDF /
  quantile against textbook values (Φ(1.95996)=0.975, the 1e-7 tail = 5.1993,
  symmetry); a fault-free geometry that does not alarm and yields finite, positive
  HPL/VPL; a 60-σ single-satellite bias that is detected *and* correctly
  identified (`excluded_sv == 2`); and the six-satellite redundancy floor. Closes
  the audit's "tautological integrity — no real RAIM/HPL/VPL" P0 gap on the
  algorithm side; gLAB-dataset validation and the Stanford-diagram accumulator
  remain roadmap items.
- **Closed-loop GNSS/INS integration (`src/fusion/closed_loop.rs`).**
  `ClosedLoopInsGnss` wires the error-state EKF kernel to the three-axis strapdown
  mechanization: each IMU sample is corrected by the running bias estimates,
  mechanized forward, and the EKF covariance time-propagated with the matching
  navigation context; each GNSS position/velocity fix forms the INS−GNSS
  innovation and feeds the estimated **position, velocity, attitude error (ψ, as a
  quaternion rotation) and accelerometer/gyro biases** back into the solution,
  resetting the error-state mean. Feeding the attitude back (not only the biases)
  is required for stability — the tilt and accelerometer bias are a coupled pair,
  so correcting one without the other diverges. INS and GNSS are compared in a
  local tangent-plane NED frame using the mechanization's own radii of curvature
  (new `mechanization::radii_of_curvature`; `NavState::omega_ie_n`/`omega_en_n`
  exposed). This is the honest replacement for the hybrid pack's *truth-snap
  reset*. Three tests: a closed loop nulling an injected 8 m / −5 m position error
  to <0.1 m; an aided solution staying metre-bounded (<6 m) on a driving
  trajectory while a free-running INS diverges past 100 m; and the milestone
  benchmark — the fused solution's **Monte-Carlo position RMS over a 60 s GNSS
  outage beats an unaided open-loop dead-reckoner by >2× (≈4× across seeds)**.
  Honest limitation documented in the module: in loosely-coupled mode the accel
  bias and tilt are only weakly separable (both couple through gravity), so the
  delivered value is the bounded, corrected state and a clean outage-entry — not a
  precise inertial calibration; richer dynamics and the tightly-coupled extension
  remain roadmap items.
- **Loosely-coupled GNSS/INS error-state EKF kernel (`src/fusion/gnss_ins_ekf.rs`).**
  A 15-state error-state extended Kalman filter — `δx = [δp, δv, ψ, b_a, b_g]` —
  with the strapdown error dynamics from Groves 2013 §14.2 (specific-force/tilt
  coupling, Coriolis, body→nav bias projection, Gauss–Markov bias models), a
  first-order discrete transition `Φ = I + F·dt`, and a loosely-coupled
  position+velocity measurement update (`H = [I₃ 0 0 0 0; 0 I₃ 0 0 0]`) in Joseph
  form. Dependency-free dense linear algebra (Gauss–Jordan inverse, Joseph
  covariance update). A `tight_coupling` cargo feature gates a documented,
  not-yet-implemented pseudorange/Doppler update. 7 tests with hand-derived
  expectations: the skew/cross-product identity, a verified 3×3 inverse,
  covariance staying symmetric/PSD under prediction (and position uncertainty
  growing un-aided), a position fix shrinking the position covariance, exact
  recovery of a known position error at the analytic Kalman gain `P/(P+R)`, and
  smaller corrections under larger measurement noise. This is the kernel that
  will replace the hybrid pack's open-loop truth-snap reset with closed-loop
  feedback (pack wiring + NaveGo validation to follow).
- **Deterministic IMU error model for the 3-axis strapdown navigator (`src/inertial/imu_errors.rs`).**
  `ImuErrorModel` distorts a true body-frame `(ω, f)` pair into a measured one
  through five systematic categories (IEEE Std 952-1997 §A.2; Groves 2013 §4.3,
  Table 4.1): **scale-factor** (per-axis ppm gain error), **misalignment /
  cross-coupling** (off-diagonal triad non-orthogonality), **g-sensitivity** (a
  gyro rate bias proportional to specific force), **quantization** (rounding to
  the output LSB), and **rate-ramp** (a linear-in-time drift — the third Allan
  region), plus a constant turn-on bias. Every term defaults to zero, so
  `ImuErrorModel::ideal()` is a transparent pass-through and existing scenarios
  are unaffected. Each error source has an isolation test (scale linear to <0.01%,
  misalignment cross-axis above the VRW floor, g-sensitivity bias, LSB grid,
  linear ramp), and an end-to-end test drives a navigation error through the
  mechanization from a distorted IMU. Not modelled: vibration rectification error,
  temperature-gradient drift. (The shipped `inertial` scenario pack still runs the
  legacy 1-DOF scalar budget; this model feeds the 3-axis library.)
- **Coning and sculling compensation for the strapdown integrator.** The
  attitude path adds the two-sample `coning_increment` (`½ Δθ_prev × Δθ_cur`); a
  coarse-rate (30 Hz, 5-samples/cycle) integration of a 5 Hz coning environment
  is verified to track fine-rate truth ≥ 3× better with the correction than naive
  increment-summing. The velocity path adds `sculling_increment` (`½ Δθ × Δv`,
  Groves eq. 5.82) and resolves the body velocity increment through a new
  `NavState::step_increments` increment-based update using the body-relative
  rotation `Δθ_rel = Δθ_b − C_n^b ζ`, so an Earth-fixed platform incurs no
  spurious sculling while a genuine vibration triggers the full term.
- **Full three-axis strapdown mechanization in the NED frame (`src/inertial/mechanization.rs`).**
  `NavState { q, v_ned, p_llh }` is advanced by `step(gyro_b, accel_f_b, dt)` using
  the standard terrestrial-frame NED equations (Groves §5.4): body→NED attitude
  corrected for the inertial-to-nav rate `ω_in = ω_ie + ω_en` (Earth rotation +
  transport rate); specific force resolved body→NED through the DCM; velocity
  integrating `v̇ = f_n − (2 ω_ie + ω_en) × v + g_n` (Coriolis/transport + gravity);
  and geodetic position via the meridian/transverse radii of curvature. Gravity is
  the WGS-84 closed-form Somigliana **normal (plumb-bob) gravity** with a NIMA
  free-air altitude correction — never a hard-coded constant. This is the genuine
  three-axis navigator that supersedes the 1-DOF scalar error-budget path. Verified
  by physical invariants: a platform bolted to the rotating Earth at 45°N (sensing
  Earth rate + 1 g) stays within 1 mm over 60 s; a level north specific force gives
  `v_N ≈ a·t` and `½ a t²` displacement; normal gravity matches the known
  equator/pole/45° surface values and the free-air lapse rate.
- **Three-axis attitude representation for strapdown INS (`src/inertial/attitude.rs`).**
  A unit-quaternion `Quaternion` type (scalar-first, Hamilton convention) carrying
  body→nav rotation, with a DCM view (`to_dcm`/`from_dcm` via Shepperd's method),
  Hamilton product, axis-angle and rotation-vector (exact exp-map) constructors,
  and quaternion kinematics — both a first-order RK rate update (`q̇ = ½ q ⊗ ω`)
  and a coning-corrected rotation-vector update. The two-sample `coning_increment`
  (Savage / Bryan–Lewantowski, `½ Δθ_prev × Δθ_cur`) supplies the rotation-rate
  cross-coupling term that scalar dead-reckoning omits. This is the attitude
  foundation for the full 3-axis mechanization that replaces the legacy 1-DOF
  error-budget path. Verified against closed-form rotations: constant-rate
  propagation matches the axis-angle quaternion to 1e-6, DCMs are orthonormal with
  unit determinant, and coning vanishes for single-axis motion. (`src/inertial.rs`
  is now the `src/inertial/` module directory; the public path `crate::inertial`
  is unchanged.)
- **Geodetically-correct ground-station visibility (`src/frames.rs`).**
  `elevation`, `is_visible`, and `visible_count` compute a satellite's elevation
  above a ground station's horizon against the **WGS-84 ellipsoid normal** (the
  true local vertical), not the geocentric radial — the two differ by up to the
  ~0.19° geodetic deflection, enough to flip near-horizon satellites in or out of
  an elevation mask. Verified end-to-end (a Walker constellation propagated,
  rotated TEME→ECEF, and counted from a geodetic site) and against the
  geocentric approximation.

### Changed
- **CI reliability.** The `test-python-bindings` job now builds the wheel with
  `PyO3/maturin-action` (manylinux container) instead of a raw host `maturin
  build`, eliminating an intermittent `rustfmt-preview`/`cargo-fmt` rustup
  conflict on the runner image. The `deny` job installs `cargo-deny` as a
  prebuilt binary via `taiki-e/install-action` instead of the Docker-based
  `cargo-deny-action`, removing a Docker Hub registry-pull timeout. Neither
  change affects the checks performed.

## [0.8.0] - 2026-06-02

### Added
- **Inertial velocity is exposed downstream.** `Propagator::velocity_eci` and
  `Propagator::state_eci` (returning `StateEci { r_m, v_m_s }`) thread the analytic
  TEME velocity SGP4 already computes — previously discarded — through to callers in
  m/s; `Orbit::velocity_eci` gives the Keplerian path a consistent velocity. The
  AIAA 2006-6753 verification test now also checks velocity for every reference row
  (worst velocity error 1.85e-9 km/s across all 666 states) and pins the compared
  row count at exactly 666.
- **Stricter, panic-free TLE parsing.** Lines are required to be ASCII and are
  sliced safely (no more byte-index panics on multi-byte input); elements are
  range-checked (inclination, eccentricity, mean motion); the column-69 checksum
  can be enforced via `ParseOpts { strict_checksum }` / `parse_propagators_opts`
  and the new `strict_checksum` flag on `ConstellationCfg` (lenient by default).
- **Allan-deviation curve in the output.** Each clock run now reports an
  `adev_curve` (`[{tau_s, adev, n_samples}]`) and the browser playground renders a
  log-log "Clock stability (ADEV)" chart.
- **Time-grid input validation.** `TimeCfg::validate` rejects a non-finite, zero,
  negative, or oversized time grid (a step larger than the duration, or more than
  `MAX_TIME_STEPS` samples) before any allocation, so a malformed scenario returns
  an error instead of panicking or exhausting memory.
- **Monte Carlo ensembles for the inertial pack.** `runs = N` on an inertial
  scenario runs N seeds and reports each metric's mean, standard deviation,
  percentiles, and a percentile-bootstrap 95% confidence interval (`ensemble`).
  Every inertial run now carries a `monte_carlo` flag, so a single-realisation FoM
  is no longer mistaken for a distribution. (CEP/2DRMS are intentionally not
  reported — they require the 3-axis model on the roadmap.)
- **Guided playground mode.** The browser playground no longer drops you onto a
  raw TOML wall: a "Start here" strip of one-click scenario cards loads and runs a
  worked example, sliders expose the universal knobs (seed, timing threshold)
  without touching the TOML, a "How to read this" note explains the result, and the
  full TOML is one collapsible away. Every run is shareable — **Copy share link**
  encodes the whole scenario into the URL fragment (nothing is uploaded) so a link
  reproduces the exact run on load. The codec is unit-tested (`web/share.test.mjs`,
  run in CI).
- **N-dimensional parameter sweeps (`src/sweep.rs`).** `nd_sweep` evaluates a
  metric over the full Cartesian product of several `SweepAxis` ranges (the
  multi-parameter trade study), in row-major order, deterministically. Additive —
  the existing 1-D sweep API is unchanged. Per-node bootstrap confidence intervals
  and generalisation beyond the clock pack remain on the roadmap.
- **Real snapshot RAIM (`src/raim.rs`).** Genuine position-domain Receiver
  Autonomous Integrity Monitoring: it builds the line-of-sight geometry to the
  visible satellites, forms the least-squares solution and residuals, runs a χ²
  residual fault-detection test (exact threshold from a dependency-free
  incomplete-gamma χ²/non-central-χ²), and computes slope-based horizontal and
  vertical protection levels (HPL/VPL) with the missed-detection bias derived for
  the configured P_fa/P_md. This is distinct from — and is **not yet wired into** —
  the scenario pipeline's filter-self-consistency Integrity figure; fault
  exclusion, alert-limit/P_HMI budgeting, and ARAIM remain on the roadmap.
- **Frequency-stability suite: MDEV, TDEV, HDEV + confidence intervals**
  (`src/allan.rs`). Alongside the overlapping ADEV: the modified Allan deviation
  (separates white from flicker phase noise), the time deviation
  (`TDEV = tau/sqrt(3) * MDEV`), and the Hadamard deviation (rejects linear
  frequency drift exactly and converges for divergent red-noise types). χ²-based
  confidence intervals (`deviation_ci`) use a dependency-free normal/χ² quantile
  pair (Acklam + Wilson-Hilferty) with a conservative non-overlapping edf;
  noise-type-specific edf and Stable32 numeric parity remain on the roadmap.
- **Reference-frame reduction (`src/frames.rs`).** GMST-based TEME↔ECEF rotation
  (using the same IAU-1982 sidereal time as the propagator), exact WGS-84
  geodetic↔ECEF with a Bowring-seeded iterative inverse (machine-precision at all
  altitudes, including MEO/GEO), and a geodetic ground-station
  observer that returns azimuth / elevation / range in the local East-North-Up
  frame. Polar motion and sub-arcsecond nutation are not applied (GMST-only,
  sub-kilometre on the ground track); an ITRF-precise CIO chain is on the roadmap.
- **Time-scale foundation (`src/timescales.rs`).** A dependency-free Julian-date
  API (Gregorian civil ↔ JD, MJD), the full IERS integer leap-second history
  (UTC↔TAI, 10 s in 1972 to 37 s since 2017), the defined TAI→TT offset, the UT1
  correction via a supplied DUT1, and the IAU-2000 Earth Rotation Angle. This is
  the time substrate that Earth-fixed frame reduction (planned) sits on. Instants
  are single-`f64` Julian Dates (~50 µs resolution near the present epoch; a
  two-part JD is on the roadmap), and the pre-1972 rubber-second era is not
  modelled — both documented in the module.
- **Reproducibility & provenance.** A deterministic CycloneDX SBOM generator
  (`scripts/gen-sbom.sh`) and a SLSA build-provenance attestation on the release
  binary and SBOM; the release toolchain is pinned to match CI. Determinism
  guarantees, the cross-platform `libm` caveat, and the golden-pinning approach are
  documented in `docs/REPRODUCIBILITY.md`.

- **Property-based and fuzz tests** (`tests/property.rs`). Deterministic
  randomized tests (no new dependency) assert invariants over thousands of inputs:
  the TLE and scenario parsers never panic on garbage, non-ASCII, mutated, or
  truncated input; `TimeCfg::validate` never panics on NaN/inf/negative grids; the
  TLE checksum is consistent and column-69-only; geodetic↔ECEF round-trips and the
  TEME→ECEF rotation preserves norm across the globe and a wide altitude band.

### Changed
- Golden tests now **pin the figures of merit field-by-field** for the four
  reference scenarios (with a tolerance that absorbs cross-platform `libm` jitter),
  replacing the earlier inequality-only checks, so a silent numerical regression is
  caught immediately.
- `schema_version` in result artifacts bumped from `0.1` to `0.7` (it was frozen
  while the engine moved on).
- `cargo-deny` now **denies** (not warns on) yanked dependencies.
- New docs: `CAPABILITY.md` (honest scope map), `SCHEMA.md` (result-field
  reference), `INTEGRITY.md`, `QUANTUM-MODELS.md`, `REAL_TLE_GUIDE.md`. A CI guard
  fails if the README version badge drifts from `Cargo.toml`.

## [0.7.0] - 2026-06-02

### Added
- **SGP4/SDP4 orbit propagation.** A full, dependency-free implementation of the
  standard simplified-perturbations propagator — near-Earth SGP4 together with the
  deep-space SDP4 extension (lunar-solar secular and periodic perturbations and
  12 h / 24 h geopotential resonance). It is validated against the official AIAA
  2006-6753 ("Revisiting Spacetrack Report #3") verification vectors: all 666
  reference states across the near-Earth, deep-space, resonant, and error-code
  cases match to a worst-case position error of about 4 mm. This is the model
  two-line element sets are defined against, so it represents real constellations
  — notably the ~12 h GNSS orbits, which are deep-space and resonant and which the
  earlier two-body + J2-secular model cannot capture.
- A constellation given as **full two-line element sets** (line 1 + line 2) is now
  propagated with SGP4/SDP4; a constellation given as line-2-only elements keeps
  the analytic Keplerian two-body propagation, unchanged. The two forms can be
  mixed in one block. New `orbit-sgp4-gps.toml` reference scenario (a GPS-like MEO
  constellation in real two-line format, propagated with SGP4) — drop in a current
  Celestrak "gps-ops" set to study the live constellation.

## [0.6.0] - 2026-06-02

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

[Unreleased]: https://github.com/AshfordeOU/kshana/compare/v0.8.0...HEAD
[0.8.0]: https://github.com/AshfordeOU/kshana/compare/v0.7.0...v0.8.0
[0.7.0]: https://github.com/AshfordeOU/kshana/compare/v0.6.0...v0.7.0
[0.6.0]: https://github.com/AshfordeOU/kshana/compare/v0.5.0...v0.6.0
[0.5.0]: https://github.com/AshfordeOU/kshana/compare/v0.4.0...v0.5.0
[0.4.0]: https://github.com/AshfordeOU/kshana/compare/v0.3.0...v0.4.0
[0.3.0]: https://github.com/AshfordeOU/kshana/compare/v0.2.0...v0.3.0
[0.2.0]: https://github.com/AshfordeOU/kshana/compare/v0.1.0...v0.2.0
[0.1.0]: https://github.com/AshfordeOU/kshana/releases/tag/v0.1.0
