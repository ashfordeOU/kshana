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
  zonal-gravity force model with a choice of adaptive driver — RK4 **step doubling** or the
  **Dormand–Prince RK5(4)** embedded pair (`integrator::integrate_dopri` / `propagate_dopri`, a
  cheaper 7-eval embedded error estimate) — pinned against analytic truth:
  the unperturbed orbit matches the exact universal-variable Kepler solution to sub-metre over 24 h,
  energy/angular-momentum conserve to ~1e-9, and the J2 nodal regression reproduces the closed-form
  secular rate; plus a convergence-guarded Kepler-equation solver. The force model spans the **full
  Earth zonal field through degree 6** (`forces::zonal_accel`, the published EGM-96 `J2..J6`): the
  acceleration is the exact analytic gradient of the zonal disturbing potential, validated against its
  own numerically-differentiated potential, against the 666-vector-validated J2 closed form, and via
  the odd/even zonals' characteristic north–south symmetry. **Epoch-driven third-body (Sun and Moon)**
  gravity is **wired into the time-varying integrator** (`ForceModel::third_body` / `accel_at`): each
  RHS evaluation samples the built-in **low-precision analytical Sun and Moon ephemerides**
  (`src/ephem.rs`, Montenbruck & Gill) at the advanced epoch `epoch_jd_tt + t/86400`, so the perturbers
  move along their orbits during the integration. Validated as the exact gradient of its disturbing
  potential; the Sun ephemeris against hand-derived J2000 anchors (perihelion distance, solstice
  declination, ~1°/day motion) and the Moon against its perigee/apogee envelope, ~384 400 km mean
  distance, ≤ 5.3° inclination bound, and sidereal-month return; and the integration wiring proven
  bit-exact (RHS term = `third_body_accel` at the sampled position), with a quarter-year epoch shift
  producing a different trajectory. **Solar-radiation pressure** (`forces::srp_accel` /
  `ForceModel::solar_radiation`) is wired into the same epoch-driven RHS: the cannonball model
  `ν·P☉·cᵣ·(A/m)·(AU/d)²·d̂` with a **conical umbra+penumbra** shadow (`forces::conical_shadow`, a
  smooth `ν ∈ [0,1]` from the Sun/Earth apparent-disk overlap), validated against the textbook 1-AU
  pressure (≈ 4.54·10⁻⁶ N/m²), the ~1.36·10⁻⁷ m/s² LEO magnitude, the inverse-square fall-off, an
  exactly-zero deep-umbra eclipse, a smooth monotonic penumbra that extends beyond the umbral
  cylinder, and a ~linear A/m scaling of the propagated displacement. **Atmospheric
  drag** (`forces::drag_accel` / `ForceModel::drag`) is wired in as the first velocity-dependent
  force: quadratic drag against the co-rotating atmosphere of the Vallado piecewise-exponential
  `forces::atmospheric_density`, validated by the 1.225 kg/m³ sea-level anchor, a monotonic LEO
  decay with a physical ~58 km scale height, the ~2·10⁻⁶ m/s² drag magnitude, and the dissipation
  signature (a 300 km orbit loses energy monotonically and its semi-major axis decays ~km/day where
  the vacuum orbit conserves energy). The **post-Newtonian (Schwarzschild) relativistic correction**
  (`forces::relativistic_accel` / `ForceModel::relativity`) is the second velocity-dependent term —
  the IERS `β = γ = 1` form `a = (μ/c²r³)·{[4μ/r − v²]·r + 4(r·v)·v}`, the leading driver of the
  relativistic perigee advance — validated by its closed-form circular value `3μ²/(c²r³)·r̂`, its
  textbook `≈1.9·10⁻⁹` LEO ratio to two-body, and the conservative signature (it perturbs the orbit
  but, unlike drag, holds the semi-major axis to under a metre/day). High-degree tesseral gravity,
  the NRLMSISE-00 thermospheric density, solar limb darkening / the oblate-Earth shadow, the
  Lense–Thirring frame-dragging term, and external GMAT/Orekit cross-validation remain follow-ons.
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
  the ESA NAVISP *Quantum Wayfarer* target. Magnetic maps (IGRF-14 main field) and
  terrain-referenced navigation are wired (`terrain-nav`, `combined-altpnt`), and
  **sequential terrain-referenced navigation** — SITAN as a running particle filter that
  tracks a *time-varying* INS drift epoch by epoch (`terrain-slam`) — is now built. The full
  EGM2008 coefficient set, a map-error Monte-Carlo, a real high-frequency crustal magnetic
  map, and joint map estimation (full SLAM) remain follow-ons.
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
- **Interoperability** — RINEX-3/4, SP3-c/d, CCSDS OEM 2.0 (export **and** import via the
  `oem-interop` round-trip bridge) and OMM (mean-elements) export, plus CCSDS-TDM (503) and
  the `space-packet` (CCSDS 133.0-B) framer.
- **Mission-analysis & environment (first-order, MODELLED)** — runnable `launch-window`
  (azimuth / plane-change / opportunities), `reentry` (Allen-Eggers corridor),
  `eo-coverage` (swath / GSD / access / revisit), `attitude-budget` (gravity-gradient torque
  + RSS pointing budget), `passes` (ground-station rise/set prediction), `link-budget`
  (CCSDS-401/DSN-810-005 link equation), and `space-weather` (Kp/ap/F10.7a + Jacchia-71
  exospheric temperature + activity-driven density). Plus the two-tender demonstrators
  `impairment-eval` (AI/ML RF-impairment ROC/AUC harness) and `quantum-trade`. All are
  first-order/MODELLED — the analysis layer above GMAT/STK, not a replacement, and never
  validated flight tools. See [`docs/CAPABILITY.md`](docs/CAPABILITY.md) for per-kind scope.
- **Surfaces** — Rust library, CLI, Python (PyO3) and WebAssembly (wasm-bindgen)
  bindings, and an in-browser playground.

## P1 — surface and harden (near-term)

- ITRF-precise frame reduction toward the GCRS/J2000 system on top of the shipped
  GMST-based TEME↔ECEF. *(In progress — IAU 2006 precession (`src/precession.rs`), both
  the IAU 2000B and the **full IAU 2000A** (678 luni-solar + 687 planetary terms)
  nutation series and the full TEME→TOD→MOD→GCRS chain (`src/nutation.rs`,
  `teme_to_gcrs`, `nutation_iau2000a` / `nutation_matrix_2000a`, both series validated
  bit-for-bit against the SOFA/ERFA `nut00b`/`nut00a` vectors; the 2000A table is
  machine-generated by `tools/gen_nut00a.py`), and IERS **polar motion** PEF→ITRF
  (`src/frames.rs`, `teme_to_itrf` / `polar_motion_matrix` per SOFA `iauPom00`,
  caller-supplied `x_p`/`y_p`) are delivered, **and the fully CIO-based IAU 2006/2000A
  (X, Y, s) reduction** (`src/cio.rs`: GCRS↔CIRS↔ITRS via `eraXys06a`/`eraC2ixys`/
  `eraEra00`/`eraC2tcio`, validated bit-for-bit against the SOFA vectors), **and the
  independent ANISE/SPICE numerical cross-check is delivered** (`xval/anise-frames/`:
  `gcrs_to_itrs_matrix` vs ANISE's GCRF→ITRF93 from JPL's `earth_latest_high_prec.bpc`,
  the same IERS `finals2000A` EOP fed to both, eight epochs 2020–2023 — max 0.028″,
  **≤ 0.86 m on the ground, ≤ 3.6 m at GNSS orbit**, inside the <10 m target). The
  cross-check is a standalone, workspace-excluded crate so the MPL-2.0 / edition-2024
  `anise` dependency never touches the published `kshana` crate or any default CI gate.)*
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
- Lunar / cislunar integrity (LunaNet). *(In progress — `src/lunar.rs`: the lunar
  ARAIM engine (σ_URE = 30 m, P_sat = 1e-4), the MCI↔MCMF cislunar frame reduction
  and selenographic lat/lon/alt, and a south-pole protection-level pass that
  quantifies the integrity gap against a 50 m alert limit. `src/cr3bp.rs` adds the
  Earth–Moon **CR3BP** (rotating-frame dynamics, RK4, Jacobi constant, Lagrange
  points — the three-body core a real NRHO needs). The differential-corrected 9:2
  NRHO initial conditions, the DE/ephemeris model, the LANS signal-in-space error
  budget, and a TOML scenario for the runner remain.)*
- A numerical propagator: the adaptive integrator core (`src/integrator.rs`, RK4 step-doubling
  **and** the Dormand–Prince RK5(4) embedded pair `integrate_dopri`) plus a hierarchical force
  model — the two-body gravity, the analytic
  J2 secular rates, the **full J2–J6 zonal field** (`forces::zonal_accel`), **epoch-driven
  third-body (Sun and Moon) gravity integrated by the time-varying RHS** (`forces::third_body_accel`
  + the `src/ephem.rs` low-precision Sun and Moon ephemerides + `ForceModel::accel_at` sampling them
  at `epoch_jd_tt + t/86400`), **solar-radiation pressure on the same epoch-driven RHS**
  (`forces::srp_accel` cannonball model + `forces::conical_shadow` umbra+penumbra eclipse +
  `ForceModel::solar_radiation`), **velocity-dependent atmospheric drag** (`forces::drag_accel`
  against the co-rotating `forces::atmospheric_density` Vallado exponential model +
  `ForceModel::drag` + the new `ForceModel::accel_rv` / velocity-passing RHS), and the
  `propagator::propagate` wiring are delivered (`src/forces.rs`, `src/propagator.rs`); the
  high-degree tesseral field, the NRLMSISE-00 thermospheric density, solar limb darkening, and
  DE-grade ephemeris accuracy remain — to complement the analytic SGP4/SDP4 path.
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
