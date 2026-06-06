<!-- SPDX-License-Identifier: Apache-2.0 -->
# Kshana roadmap

This is the phased, honest roadmap for Kshana. It complements two other sources of
truth: [`CHANGELOG.md`](CHANGELOG.md) records *released* history, and
[`docs/CAPABILITY.md`](docs/CAPABILITY.md) tracks the maturity of *each* capability
(`validated` / `runnable` / `library` / `partial` / `not-modeled`). When those
disagree with this file, the per-capability table in `docs/CAPABILITY.md` wins.

Horizons are indicative, not commitments. Kshana is pre-1.0; the public
scenario/result schema may still change (breaking changes are called out in the
[`CHANGELOG.md`](CHANGELOG.md)).

## Shipped (on `main`)

A validated, fully reproducible engine spanning the PNT stack:

- **Orbit & geometry** — SGP4/SDP4 propagation validated to 4.12 mm against all 666
  AIAA 2006-6753 vectors; real-TLE (committed date-stamped Celestrak `gps-ops` snapshot)
  and synthetic Walker constellations whose mean elements realise the `i:T/P/F` formula to
  under 1 km over 24 h; multi-constellation visibility, dilution of precision, and GNSS
  availability; a gradient-free constellation-design optimiser, streets-of-coverage
  minimum-satellite sizing, a multi-constellation comparison tool, and a Walker design sweep
  that tabulates coverage / PDOP / revisit-time over a planes×satellites grid and reports the
  Pareto-optimal designs as JSON.
- **Maneuvers & trajectory design** — impulsive ΔV nodes with 6×6 covariance propagation
  (ECI / LVLH execution-error frames), finite-burn integration checked against the closed-form
  Tsiolkovsky rocket equation to < 0.01 %, an Izzo-2015 single-revolution Lambert solver and an
  exact universal-variable Kepler propagator, and a porkchop (launch × arrival) C3 / arrival-V∞
  sweep emitted as a JSON contour grid — the performance-simulation layer above GMAT/Orekit, with
  Lambert outputs round-tripped against two-body truth and the porkchop minimum checked against the
  analytic Hohmann floor.
- **Numerical propagator** — a Cowell propagator (`src/propagator.rs`) integrating a configurable
  zonal-gravity force model with the adaptive step-doubling RK4 driver, pinned against analytic truth:
  the unperturbed orbit matches the exact universal-variable Kepler solution to sub-metre over 24 h,
  energy/angular-momentum conserve to ~1e-9, and the J2 nodal regression reproduces the closed-form
  secular rate; plus a convergence-guarded Kepler-equation solver. The force model spans the **full
  Earth zonal field through degree 6** (`forces::zonal_accel`, the published EGM-96 `J2..J6`): the
  acceleration is the exact analytic gradient of the zonal disturbing potential, validated against its
  own numerically-differentiated potential, against the 666-vector-validated J2 closed form, and via
  the odd/even zonals' characteristic north–south symmetry. **Third-body (Sun)** gravity
  (`forces::third_body_accel`) with a built-in **low-precision analytical Sun ephemeris**
  (`src/ephem.rs`, Montenbruck & Gill) is also delivered — the perturbation validated as the exact
  gradient of its disturbing potential and the ephemeris against hand-derived J2000 anchors
  (perihelion distance, solstice declination, ~1°/day motion). High-degree tesseral gravity, the
  Moon's series, drag, SRP, and external GMAT/Orekit cross-validation remain follow-ons.
- **Time systems** — IERS leap-second UTC/TAI/TT/UT1, Julian-date API, IAU-2000
  Earth Rotation Angle; GMST-based TEME↔ECEF and WGS-84 geodetic frames.
- **Inertial** — three-axis strapdown INS (quaternion attitude, NED mechanization,
  coning/sculling, deterministic IMU error model), plus a sequential-importance-resampling
  particle filter for map-aided (terrain-/gravity-referenced) GPS-denied navigation.
- **Gravity-map / alt-PNT** — a cold-atom **gravimeter measurement model** (white-noise floor
  `σ = ASD/√τ` derived from the CAI accelerometer physics), a low-degree fully-normalised
  **spherical-harmonic gravity-anomaly field** (validated against the closed-form Legendre
  functions and a hand-derived single-term anomaly) plus synthetic mascons, and a
  **gravity-map-matching particle filter** that recovers a GPS-denied track from the anomaly
  sequence it flies through. A **60-minute GPS-denied benchmark** flies a ~700 km / one-hour
  outage where the inertial solution drifts to ~70 km, and a **hierarchical coarse-to-fine**
  matcher with the gravimeter's deterministic seeded noise recovers it to **~145 m (< 500 m)** —
  the ESA NAVISP *Quantum Wayfarer* target. The full EGM2008 coefficient set, a map-error
  Monte-Carlo, magnetic maps, and terrain-aided SLAM remain follow-ons.
- **Fusion** — loosely-coupled 15-state GNSS/INS error-state EKF with closed-loop
  feedback, a tightly-coupled pseudorange update that corrects with fewer than four
  satellites, a coupled clock+position filter, a general unscented (sigma-point)
  Kalman estimator for strongly nonlinear measurement models, a tightly-coupled
  GNSS/INS UKF navigator (pseudorange + Doppler, force-model orbital coast validated to
  0.77 m RMS over a 30-minute curving LEO pass including a 120-second GNSS outage), and a
  full 17-state tightly-coupled GNSS/INS UKF (position, velocity, attitude error, accelerometer
  and gyro biases, clock bias and drift) whose quantum-CAI dead-reckoning coasts a 120-second
  outage on the cold-atom accelerometer's derived velocity-random-walk.
- **Integrity** — snapshot and solution-separation (ARAIM-style) RAIM with HPL/VPL,
  FDE, and Stanford diagrams; an explicit integrity-risk-budget (MHSS) protection level,
  including the dual-/multi-constellation constellation-wide fault mode (EU ARAIM / DO-316).
- **Clock & timing** — two-state holdover Kalman, Allan-family stability with
  confidence intervals, optical/RF two-way time transfer, and the geometric
  time-transfer corrections (Sagnac effect, GNSS common-view single difference).
  Operational transfer methods build on these: TWSTFT with the BIPM Sagnac closed
  form `2·A·ω_E/c²` and a one-day `T_A−T_B`/TDEV campaign, GNSS common-view between
  two synthetic ground stations, PPP ionosphere-free time transfer with a receiver-clock
  solve, a free-space optical link with Rytov/Fried turbulence scintillation, a full
  IEEE-1139 five-coefficient power-law noise fit, and an inverse-variance clock-ensemble
  (paper) timescale that beats the best contributing clock.
- **GNSS measurement domain** — Klobuchar (broadcast) and IONEX/TEC-grid (measured)
  ionosphere, with an IONEX file parser, time interpolation between maps, and the slant
  obliquity mapping; Saastamoinen + Niell troposphere, pseudorange/Doppler, snapshot RAIM.
- **Resilience** — link-budget jamming (J/S → effective C/N₀ → loss of lock); a
  stochastic time-spoof detector (Neyman–Pearson / χ²₁ energy test, Monte-Carlo
  P_fa/P_md, Security FoM = 1 − P_md); and a multi-layer spoof detector fusing a
  RAIM-consistency parity test (with the common-mode blind spot modelled honestly), an
  RF-layer AGC-power monitor, and a signal-quality (SQM Early-minus-Late) monitor.
- **Interoperability** — RINEX-3/4, SP3-c/d, CCSDS OEM 2.0 and OMM (mean-elements) export.
- **Surfaces** — Rust library, CLI, Python (PyO3) and WebAssembly (wasm-bindgen)
  bindings, and an in-browser playground.

## P1 — surface and harden (near-term)

- ITRF-precise frame reduction toward the GCRS/J2000 system on top of the shipped
  GMST-based TEME↔ECEF. *(In progress — IAU 2006 precession (Fukushima–Williams angles
  and bias-precession matrix) is delivered in `src/precession.rs`; the IAU 2000A nutation,
  the full TEME→GCRS chain, and polar motion remain.)*
- Two-part Julian dates (the single-`f64` JD is ~50 µs near 2020). *(Delivered — `src/jd2.rs` `Jd2`; surfacing it through the time API and propagator epoch handling remains.)*
- Surface the loosely-/tightly-coupled GNSS/INS navigator across more scenario packs.
- Golden numerics and calibration ensembles for the V&V suite; committed
  cross-platform golden hashes (reproducibility milestone).
- Provenance as a first-class, citable asset (`docs/PROVENANCE.md`).

## P2 — Quantum physics layer

Today Kshana's quantum sensors are driven by **published Allan/noise-budget
coefficients** (ACES/SHM/CSAC/optical-clock datasheets), not simulated from first
principles. The P2 layer adds first-principles cold-atom-interferometer (CAI)
physics so error budgets can be *derived*, not just *supplied*:

- **Mach–Zehnder CAI phase**, interferometer contrast, and cycle time. *(Delivered —
  `src/inertial/quantum_imu.rs`; see [`docs/QUANTUM.md`](docs/QUANTUM.md).)*
- **Quantum projection / shot noise** from first principles (not only its net Allan
  contribution). *(Delivered — derives the `q_va` PSD the classical model consumes.)*
- **Vibration coupling** — the interferometer acceleration→phase transfer function
  `|H(ω)| = (4/ω²)sin²(ωT/2)` and the white-PSD phase variance `σ_Φ² = k_eff²·S_a·T³/3`.
  *(Delivered — `src/inertial/quantum_imu.rs`; the dominant real-device term, so error
  budgets now span the shot-noise floor and the vibration-limited regime above it.)*
- **Laser-phase noise** and remaining sensor systematics (Coriolis/rotation, light shift,
  wavefront). *(Still to do.)*
- Two-part JD-backed long-horizon timing; carrier-phase + explicit receiver-clock
  state in tight coupling; a trajectory library beyond the single deterministic path.

See [`docs/QUANTUM-MODELS.md`](docs/QUANTUM-MODELS.md) for exactly what is and is not
modelled today. If you need first-principles CAI error budgets (e.g.
CARIOQA-PMP-grade or X-37B-style validation), the P2 layer is the path — and we
welcome collaboration: see [Support & professional services](README.md#support--professional-services).

## P3 — interoperability & standards depth

- Additional CCSDS message types (ODM/AEM/TDM) and SPICE interop.
- Receiver-domain parity (e.g. gLAB) for the GNSS measurement chain; multi-fault
  ARAIM.
- A numerical propagator: the adaptive RK4/step-doubling integrator core
  (`src/integrator.rs`) plus a hierarchical force model — the two-body gravity, the analytic
  J2 secular rates, the **full J2–J6 zonal field** (`forces::zonal_accel`), **third-body (Sun)
  gravity** (`forces::third_body_accel` + the `src/ephem.rs` low-precision Sun ephemeris), and the
  `propagator::propagate` wiring are delivered (`src/forces.rs`, `src/propagator.rs`); the
  high-degree tesseral field, the Moon, drag, and SRP remain — to complement the analytic
  SGP4/SDP4 path.
- Batch orbit determination is delivered: `src/orbit_determination.rs` recovers an
  orbital state from ground-station ranges via the Gauss–Newton corrector
  (`src/batch_ls.rs`) over the two-body + J2 force model, with a sequential
  (unscented-filter) variant alongside the batch solver; range-rate/azimuth-elevation
  measurements and an analytic J2 state-transition matrix remain.
- Alternative (GNSS-denied) PNT: the map-matching measurement model
  (`src/mapmatch.rs`, `field_likelihood` / `map_match_likelihood`) closes the loop on the
  shipped particle filter for terrain-/gravity-referenced navigation; the real reference maps
  (SRTM elevation, EGM/EIGEN gravity anomaly) and their loaders remain.

---

*Maintained by Ashforde OÜ. Roadmap items are prioritised against real user and
tender needs; nothing here is a delivery commitment.*
