# Validation status

| Noise term | Status | Evidence |
|------------|--------|----------|
| White FM (short-term) | `validated` | `tests/calibration.rs`: simulated overlapping ADEV reproduces published sigma_y(1 s) to ~2%, and the white-FM curve sigma_y(tau)=sigma_y(1s)/sqrt(tau) across tau = 1, 10, 100 s to <25% (matches CSAC datasheet 3e-10 / 1e-10 / 3e-11). |
| Random-walk FM (long-term) | `validated` | `tests/calibration.rs`: simulated ADEV matches sigma_y^2(tau)=q_rw*tau/3 (Riley NIST SP 1065) to ~20% (seed-averaged). |
| Aging / linear drift | `modeled` + calibrated-out | Deterministic; the holdover estimator removes offset and aging via a quadratic predictor, so the residual is the stochastic limit. Tested in `src/estimator.rs` / `src/models.rs`. |
| Kalman estimator + integrity bound | `validated` | `src/kalman.rs`: a two-state (phase, frequency) filter whose exact van Loan process noise matches the truth model; coasting reproduces the analytic holdover variance `q_wf*T + q_rw*T^3/3` to 1e-9. The run layer reports Integrity as the fraction of outage samples inside the 3-sigma protection bound (`src/run.rs`). |
| Security (spoof-detection score) | `validated` (model) | `src/security.rs`: the monitor 1-sigma floor `sqrt(r/m + q_wf*tau + q_rw*tau^3/3)` and the resulting `k`-sigma minimum-detectable offset and `[0,1]` score are hand-derived and unit-tested. The model (innovation / RAIM-style clock-aided detection) is sound; the *parameters* (monitoring window `tau`, detection multiplier `k`, measurement noise `r`) are representative, not fitted to a specific receiver. |
| Spoofing-attack detection | `validated` (model) | `src/spoof.rs`: a ramping false-time spoof is flagged when its offset exceeds the clock's detection bound; the detection time matches the hand-derived `start + bound/rate` to one grid step, and a clock whose bound exceeds the spec lets the spoof reach the threshold undetected. Same `representative-parameters` caveat as the Security score. |
| Flicker FM (floor) | `modeled` (off by default) | Synthesised as a sum of log-spaced Ornstein-Uhlenbeck processes calibrated to a configurable flat ADEV floor; `src/models.rs` validates the floor is flat across averaging time and sits at the configured level (seed-averaged). Enabled per clock via `flicker_floor`. The cited reference scenarios leave it off: CSAC is white-FM-dominated across its datasheet range (1-1000 s) and the optical-clock systematic floor (~5e-17) is represented by its accuracy figure. |
| Monte Carlo ensemble statistics | `validated` (aggregation) | `src/ensemble.rs`: nearest-rank percentiles and mean over `runs` reproducible realizations; a single run collapses the spread, the per-timestep band is ordered `p05 <= p50 <= p95`, and reruns are bit-identical. This is statistical aggregation over the already-validated single run, not a new physical model. |

| Clock | sigma_y(1 s) | Source |
|-------|--------------|--------|
| csac-sa45s (CSAC)        | 3.0e-10 | Microchip SA65 / SA.45s datasheet |
| optical-sr-lattice (Sr lattice) | 1.0e-15 | strontium optical lattice clock, space-oriented goal, arXiv:1503.08457 |

**Status: white FM and random-walk FM validated; aging modeled and calibrated-out; flicker FM modeled and validated (off by default in the cited scenarios).**

Maturity: the optical-clock figures are the *space-oriented goal* on ground hardware --
no strontium optical clock has flown. Laboratory Sr clocks reach 4.8e-17 (Oelker et al.
2019, Nature Photonics). CSAC figures are from a deployed commercial part.

Relations: Riley, NIST SP 1065, Eq. 67 -- white FM sigma_y^2(tau)=h0/(2 tau);
random-walk FM sigma_y^2(tau)=(2 pi^2/3) h_-2 tau, equivalently q_rw*tau/3 for a
frequency Wiener process of diffusion q_rw.

## Pack 2 — inertial dead-reckoning (quantum-IMU)

| Term | Status | Evidence |
|------|--------|----------|
| Constant/residual bias -> position | `validated` | pos error = 0.5*b*T^2 family (Groves AESS Tutorial); hand-derived discrete test in `src/inertial.rs`. |
| Velocity random walk (white accel) | `validated` | `src/inertial.rs`: simulated position-error SD matches sigma_x(T)=sqrt(S_a*T^3/3) (Groves eq.54) to ~12% (seed-averaged). |
| Gyro bias + angular random walk -> tilt -> gravity coupling | `modeled` (off by default) | A residual gyro bias and ARW drive an attitude error; the tilt couples gravity (`g*theta`) into horizontal specific-force error. `src/inertial.rs` validates the pure-bias cubic position growth exactly and the ARW attitude growth as a Wiener process (seed-averaged). Enabled per sensor via `gyro_bias` and `q_arw`; off in the cited accelerometer-only scenarios. |
| Bias instability (1/f flicker floor) | `modeled` (off by default) | `src/inertial.rs`: a 1/f flicker process (the same OU synthesis validated for the clock) whose flat Allan-deviation floor sits at the bias-instability coefficient; zero is a no-op, a non-zero floor changes the trajectory, both reproducible. Enabled per sensor via `bias_instability`. |
| Acceleration random walk (rate random walk) | `validated` | `src/inertial.rs`: the bias is a Wiener process with `Var(bias_rw(T)) = q_aa*T`, checked seed-averaged to ~20%. Enabled per sensor via `q_aa`. |
| Scale factor, finer cross-axis terms | `not modeled` | Scale-factor and cross-coupling errors are future work. |

| Sensor | bias stability | noise root-PSD | Source |
|--------|----------------|----------------|--------|
| cold-atom-quat (quantum) | 5.88e-7 m/s^2 (60 ng, 24 h) | 22 ug/sqrtHz = 2.16e-4 (m/s^2)/sqrtHz | Templier et al. 2022, Science Advances (arXiv:2209.13209) |
| nav-grade-quartz (classical) | 1.57e-3 m/s^2 (~160 ug) | ~20 ug/sqrtHz = 1.96e-4 (m/s^2)/sqrtHz | Honeywell QA-2000 / Groves AESS Tutorial |

Honest framing: the cold-atom advantage is **long-term bias stability** (~2600x lower), which dominates a long GNSS outage via 0.5*b*T^2. Short-term noise is comparable (quantum ~22 vs classical ~20 ug/sqrtHz) — the quantum sensor wins the marathon, not the sprint. Maturity: cold-atom accelerometers are laboratory/early (JRC122785), navigation-grade quartz is deployed.

## Pack 3 — time transfer (optical vs RF, optical inter-satellite link)

| Term | Status | Evidence |
|------|--------|----------|
| White timing jitter -> sync precision | `validated` | `src/timetransfer.rs`: simulated sync RMS reproduces the link jitter sigma_j; sample-mean averages as sigma/sqrt(N) to <20% (seed-averaged). |
| Timing -> one-way ranging | `validated` | range = c * dt, c=299792458 m/s; 1 ps = 0.299792458 mm (exact, hand-derived test). |
| Flicker/TDEV floor, two-way reciprocity residual | `not modeled` | Jitter is modeled as white; long-averaging floors and reciprocity residuals are future work. |

| Link | single-sample jitter | type | source |
|------|---------------------|------|--------|
| optical-isl | 1 ps (1e-12 s) | on-orbit-credible target | optical inter-satellite link, picosecond sync target; lab O-TWTFT ~1 fs (Giorgetta 2013 / Deschenes 2016) |
| twstft-rf | 0.5 ns (5e-10 s) | measured single-session | BIPM/PTB/NIST TWSTFT |

Honest framing: the optical figure is a picosecond-level on-orbit synchronization target (not flown). The terrestrial optical lab floor is ~1 fs (far better); a well-engineered microwave link (ACES MWL, ~0.3 ps) can rival optical, so the "RF = 0.5 ns" baseline is specifically ordinary TWSTFT. Ranging conversion is one-way (range = c*dt); two-way/round-trip halves it (range = c*dt/2).

## Pack 4 — hybrid fusion (capstone)

Composes Pack 1 (clock), Pack 2 (inertial), and Pack 3 (time-transfer) into one PNT
suite. The suite must keep BOTH timing (< timing spec) and position (< position spec)
within bounds; `pnt_holdover_s` is the time until either breaches. Optional optical
inter-satellite time-transfer re-syncs the clock during the outage (time aiding only —
position is not re-synced, since time transfer gives time, not position).

| Aspect | Status | Evidence |
|--------|--------|----------|
| Combined PNT scoring (timing AND position) | `validated` | `src/hybrid.rs` hand-derived `score_hybrid` test (pnt_holdover = first of timing/position to breach). |
| Integrity + Security for the hybrid pack | `validated` | `src/hybrid.rs`: a Kalman timing estimator disciplined to truth (nominal) and re-anchored at each optical re-sync; Integrity is the protection-bound containment (bound includes the link-jitter floor), Security the spoof-detection score. Tested for both suites including the link-aided case. |
| Joint fusion estimator | `validated` (model) | `src/fusion.rs`: a single joint Kalman filter ([phase, freq] ⊕ [pos, vel]) is the navigator, disciplined by GNSS (learning the offsets from non-zero initial covariance) and aided by time transfer; the joint covariance gives a joint integrity that is tested reliable (≥0.9) for both suites with noise-consistent sensors. For a static platform the optimal filter is block-diagonal; augmented-state constant-bias estimation and dynamic cross-aiding are future work. |
| Composition of validated sub-models | inherits | clock/inertial/time-transfer terms are validated in their own packs. |
| Sensor cross-aiding fidelity (full Kalman/factor-graph fusion) | `not modeled` | This is a system-level composition + time-aiding, not yet a full optimal estimator. |

Result: the all-quantum suite holds full PNT through a 1.8 h outage; the all-classical
suite is **position-limited** (nav-grade IMU breaches first). Optical ISL time-transfer
keeps even the classical CLOCK locked, isolating the inertial sensor as the classical
suite's weak link — the core argument for quantum inertial + optical timing together.

## Geometry — GNSS availability from orbits

| Aspect | Status | Evidence |
|--------|--------|----------|
| Circular two-body propagation | `validated` | `src/orbit.rs`: period `T=2 pi sqrt(r^3/mu)` (mu = 3.986004418e14), position returns after one period, equatorial/polar planarity — hand-derived tests. |
| Eccentric (Keplerian) propagation | `validated` | `src/orbit.rs`: Kepler's equation `M = E - e sin E` solved by Newton (residual < 1e-12); perigee/apogee radii `a(1∓e)`; circular case matches the closed-form path to 1e-9. |
| J2 secular nodal/apsidal drift | `validated` | `src/orbit.rs`: `Omega_dot = -1.5 n J2 (Re/p)^2 cos i`, `argp_dot = 0.75 n J2 (Re/p)^2 (5cos^2 i - 1)` (Vallado); node regresses (prograde) / advances (retrograde) / is stationary (polar), and apsides freeze at the critical inclination 63.4 deg — hand-derived sign/zero tests. Two-body + secular only, not osculating. |
| Line-of-sight visibility (Earth occultation + elevation mask) | `validated` | Antipodal sat occulted, radially-outward sat at 90 deg elevation, tangential sat on the horizon — exact hand-derived tests. |
| Visibility -> GNSS state -> timeline | `validated` | `>=4` visible = nominal, 1-3 degraded, 0 denied; Walker-delta generator; integration test drives a clock-holdover run from the derived timeline. |
| Dilution of precision (GDOP/PDOP/HDOP/VDOP/TDOP) -> position accuracy | `validated` | `src/orbit.rs`: `Q=(HᵀH)⁻¹` from the line-of-sight design matrix; a regular-tetrahedron geometry reproduces the closed-form DOPs (PDOP 1.5, TDOP 0.5, GDOP √2.5, HDOP √1.5, VDOP √0.75) to 1e-9. Position sigma = PDOP × user-equivalent range error. |
| Multi-constellation availability | `validated` | `src/orbit.rs`: additional `[[constellations]]` are merged into one satellite set for visibility/DOP; a combined-count test confirms the union. |
| Real constellation geometry from TLEs (line-2 / Keplerian) | `validated` (parsing) | `src/tle.rs`: parses the line-2 mean Keplerian elements (semi-major axis from the mean motion); a known ISS element set round-trips to the correct elements and period. For a line-2-only block, propagation is the engine's two-body (+ optional J2) of the *mean* elements — sound for a snapshot from a common epoch, drifting from SGP4 over time. |
| SGP4 / SDP4 propagation (full TLEs) | `validated` | `src/sgp4.rs`: full near-Earth SGP4 + deep-space SDP4 (lunar-solar secular/periodic + 12 h / 24 h geopotential resonance). Validated in `tests/sgp4_verification.rs` against the official AIAA 2006-6753 ("Revisiting Spacetrack Report #3") vectors — all 666 reference states (near-Earth, deep-space, resonant, error-code cases) match to a worst-case position error of ≈ 4.1 mm. A full two-line set (line 1 + line 2) is propagated with SGP4; line-2-only stays Keplerian; the two can be mixed. Frame is TEME, used consistently for the user and satellites (no TEME→ECEF reduction — adequate for availability/DOP geometry). |

Honest framing: this is a deterministic geometry layer (circular orbits, spherical
Earth of mean radius 6371 km, pure line-of-sight). It establishes *availability* and
the *geometric* position accuracy (dilution of precision × a representative range-error
budget) from real geometry, not a precise-ephemeris navigation solution. The
`orbit-gnss-challenged.toml` reference puts a spacecraft inside the GNSS shell: it holds
a fix only ~59% of the day, the quantum clock keeps a 5 ns timing solution through every
gap (availability 1.0) while the chip-scale clock holds ~0.83.

## Known limitations

- Quantum and classical runs now use independent RNG seeds (classical seed = seed + 0x9e3779b97f4a7c15) so their noise realizations are uncorrelated — fixed after review.
- `holdover_s` is segment-aware: outage timelines are split into contiguous segments at GNSS re-acquisition and the reported value is the worst-case (shortest) coast across them. It remains bounded by the time-grid resolution (a lower bound).
- ISL time-transfer re-sync models the residual link uncertainty as fresh zero-mean jitter per measurement step plus re-anchoring at the configured interval.
