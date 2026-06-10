# Validation status

> **On tolerances.** "Validated" below means a calibration test asserts the simulated
> statistic matches the reference relation within an **enforced gate**, currently
> **20–25% relative error** (seed-averaged) for the Allan/noise-budget relations. Median
> observed agreement is often much tighter (a few percent), but the *guaranteed* bound is
> the gate, not the median. Where a number like "~2%" appears it is a typical observation,
> not the enforced tolerance. See [Claims vs. reality](#claims-vs-reality--quick-reference).

| Noise term | Status | Evidence |
|------------|--------|----------|
| Allan estimator parity (ADEV/MDEV/TDEV/OHDEV) | `validated` | Two primary-source checks against **NIST SP 1065** (Riley, *Handbook of Frequency Stability Analysis*, 2008), both to a **1e-4** relative tolerance. (1) `tests/allan_reference.rs`: the overlapping ADEV, modified ADEV, time deviation, and overlapping Hadamard estimators reproduce the deviations for the canonical 10-point **NBS14** data set (**SP 1065 Table 29/30, p. 107**) at tau = 1, 2 — agreement is actually ~1e-6 (e.g. OADEV(2) 85.952868 vs 85.95287). (2) `tests/allan_nist_sp1065_1000point.rs`: the same four estimators reproduce the **SP 1065 §12.4 1000-point data set** (**Table 31, p. 108**) at averaging factors 1 / 10 / 100, where the data set is regenerated in code from the SP 1065 LCG (Eq. 73) — hermetic, no fixture. The same data and Table-31 numbers are the regression target in aewallin/allantools (`tests/nbs14`), reproduced here with no third-party code. This pins the *estimator maths* against the reference, distinct from the noise-*calibration* rows below. |
| Noise-type-specific edf (confidence intervals) | `validated` | `src/allan.rs`: the χ² confidence band on each overlapping-ADEV point uses the noise-type-specific effective degrees of freedom (NIST SP 1065 Table 5 closed forms for WPM/FPM/WFM/FFM/RWFM — the Stable32 simple set), with the record's power-law type identified from its MDEV log-log slope. Three independent checks: (a) the five formulas reproduce hand-evaluated values at N=64,m=4 to 1e-12; (b) a **Monte-Carlo white-FM ensemble** (4 000 records) measures the estimator's actual chi-squared edf = 2·mean²/Var(σ²) and matches the formula within 20% (and materially beats the conservative non-overlapping count); (c) `tests/allan_nist_sp1065_1000point.rs` reproduces the printed **SP 1065 Table 32 (p. 109)** edf = 146.177 for the 1000-point data set at m=10 (white FM) to 5e-3, and the table's 95% confidence bounds (8.223942e-2 / 1.035201e-1) to <0.2% (the small residual is the Wilson-Hilferty χ² approximation vs NIST's exact χ²). The exported ADEV curve carries the identified noise type, edf, and 95% band per τ. |
| White FM (short-term) | `validated` | `tests/calibration.rs`: simulated overlapping ADEV reproduces published sigma_y(1 s) — typically within a few percent, **enforced gate 25%** — and the white-FM curve sigma_y(tau)=sigma_y(1s)/sqrt(tau) across tau = 1, 10, 100 s within the same 25% gate (matches CSAC datasheet 3e-10 / 1e-10 / 3e-11). |
| Random-walk FM (long-term) | `validated` | `tests/calibration.rs`: simulated ADEV matches sigma_y^2(tau)=q_rw*tau/3 (Riley NIST SP 1065) to ~20% (seed-averaged). |
| Aging / linear drift | `modeled` + calibrated-out | Deterministic; the holdover estimator removes offset and aging via a quadratic predictor, so the residual is the stochastic limit. Tested in `src/estimator.rs` / `src/models.rs`. |
| Kalman estimator + integrity bound | `validated` | `src/kalman.rs`: a two-state (phase, frequency) filter whose exact van Loan process noise matches the truth model; coasting reproduces the analytic holdover variance `q_wf*T + q_rw*T^3/3` to 1e-9. The covariance update is in **Joseph stabilised form** `P⁺ = (I−KH)P(I−KH)ᵀ + KRKᵀ`, which stays positive-semidefinite (Cholesky-checked) through 500 predict/update steps at an extreme `R=1e-26 / Q≈1e-30` ratio, and agrees with the naive form to 1e-9 where the latter is well-conditioned. The run layer reports Integrity as the fraction of outage samples inside the 3-sigma protection bound (`src/run.rs`). |
| Filter self-consistency (NIS / NEES) | `validated` (model) | `src/filter_health.rs`: a Monte-Carlo consistency assessment (Bar-Shalom §5.4). The matched filter's pooled **NIS → 1** and **NEES → 2** land inside their 95% χ² bands (the NIS band uses the pooled white-innovation count; the NEES band uses the independent-run count, since estimation errors are temporally correlated). A **Q/R-mismatch sweep** test verifies the monitor reports `consistent=true` only at unit tuning and `consistent=false` at ×0.1/×0.5/×2/×10 mistuning, with NIS scaling as ≈1/q_factor as derived. Surfaced as `filter_health` in the clock result JSON and a playground card. The χ² bands use the Wilson–Hilferty quantile (`detection::chi2_inv_cdf`, table-checked). |
| Two-way time-transfer model | `validated` (model) | `src/timetransfer.rs`: the reciprocal common-mode delay cancels exactly in the `(m_AB - m_BA)/2` estimate (hand-derived, exact) and two one-way measurements average to `1/sqrt(2)` (seed-averaged); the non-reciprocal differential delay is a colored white-FM + random-walk-FM process whose Allan deviation follows `sigma_y^2(tau) = q_rw*tau/3` (seed-averaged, ~20%, via the link's own `step()`). The *parameters* (per-link `sigma_j`, `q_rw`) are representative TWSTFT/optical figures, not fitted to a specific terminal. |
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
| CAI accelerometer physics (first-principles) | `validated` (model) | `src/inertial/quantum_imu.rs`: a three-pulse Mach-Zehnder cold-atom interferometer. Hand-verified against textbook geometry — Rb-87 `k_eff = 4pi/lambda ~ 1.611e7 rad/m`; `Phi = k_eff*a*T^2 ~ 1.580e4 rad` at 1 g, `T = 10 ms`; projection noise `sigma_Phi = 1/(C*sqrt(N)) = 2e-3 rad` at `C = 0.5`, `N = 1e6`; per-shot `sigma_a ~ 1.24e-6 m/s^2`; the `1/T^2` and `1/sqrt(N)` scaling laws; exponential contrast decay. `q_va()` **derives** the white-acceleration PSD the classical `AccelModel` consumes. Honest scope: the **quantum-projection-noise floor** only (~0.09 ug/sqrtHz here) — far below real, vibration-limited devices (1-50 ug/sqrtHz); the vibration tensor, Coriolis and light-shift systematics are not yet modelled (see [`QUANTUM.md`](QUANTUM.md)). |
| Gyro bias + angular random walk -> tilt -> gravity coupling | `modeled` (off by default) | A residual gyro bias and ARW drive an attitude error; the tilt couples gravity (`g*theta`) into horizontal specific-force error. `src/inertial.rs` validates the pure-bias cubic position growth exactly and the ARW attitude growth as a Wiener process (seed-averaged). Enabled per sensor via `gyro_bias` and `q_arw`; off in the cited accelerometer-only scenarios. |
| Bias instability (1/f flicker floor) | `modeled` (off by default) | `src/inertial.rs`: a 1/f flicker process (the same OU synthesis validated for the clock) whose flat Allan-deviation floor sits at the bias-instability coefficient; zero is a no-op, a non-zero floor changes the trajectory, both reproducible. Enabled per sensor via `bias_instability`. |
| Acceleration random walk (rate random walk) | `validated` | `src/inertial.rs`: the bias is a Wiener process with `Var(bias_rw(T)) = q_aa*T`, checked seed-averaged to ~20%. Enabled per sensor via `q_aa`. |
| NaveGo cross-validation (IMU noise coefficients) | `validated` | `tests/navego_imu_crossval.rs`: an external cross-check against **NaveGo** (R. Gonzalez, open-source INS/GNSS toolbox, `github.com/rodralez/NaveGo`). Reproduces the synthetic round-trip of NaveGo's `navego_example_allan.m` on its **published Microstrain 3DM-GX3-35 reference profile**: driving our (NBS14/Stable32-validated) overlapping-ADEV estimator with white sensor noise at NaveGo's 1-σ levels recovers the velocity- and angle-random-walk coefficients (`ADEV(1 s) = σ·√dt`) to **< 5%** (actual ~0.4%), with the white-noise branch at the −1/2 slope. Confirms our Allan pipeline and NaveGo's VRW/ARW definitions agree. The 40 MB recorded STIM300 `.mat` log is not ingested (binary-format-gated). |
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
| Joint fusion estimator | `validated` (model) | `src/fusion/mod.rs`: a single joint Kalman filter ([phase, freq] ⊕ [pos, vel]) is the navigator, disciplined by GNSS (learning the offsets from non-zero initial covariance) and aided by time transfer; the joint covariance gives a joint integrity that is tested reliable (≥0.9) for both suites with noise-consistent sensors. The pack observes position and time **separately**, for which the optimal filter is block-diagonal; augmented-state constant-bias estimation and dynamic cross-aiding are future work. |
| Coupled clock+position filter (cross-block covariance) | `validated` (model) | `src/fusion/coupled.rs` `CoupledPntFilter`: a single stacked `[pos, vel, phase, freq]` Kalman filter (Joseph-form updates) whose **pseudorange** measurement `ρ = g·pos + c·phase + noise` couples the position and clock blocks. Tests: a shared pseudorange drives `P[pos,phase]` non-zero (decoupled filters keep it exactly 0); two distinct geometries jointly resolve injected position and clock offsets a single range cannot separate; a **clock-only** fix sharpens the **position** through the cross-covariance (the payoff coupling provides and decoupled filters cannot); and a Monte-Carlo **NEES is χ²(4)-consistent** (Bar-Shalom §5.4, run-based band). 1-DOF (the pack's dimensionality); not yet wired into the runnable pack, and the 3-D 8-state extension is future work. |
| Composition of validated sub-models | inherits | clock/inertial/time-transfer terms are validated in their own packs. |
| Loosely-coupled GNSS/INS (`gnss-ins` pack) | `validated` (model) | `src/fusion/{gnss_ins_ekf,closed_loop,pack}.rs`: a 15-state error-state EKF (δp, δv, ψ, accel/gyro bias; Groves §14) drives the three-axis strapdown navigator with feedback. Tests: an injected position error nulls under perfect-truth aiding; the aided solution stays metre-bounded while a free-running INS diverges past 100 m; and the fused position RMS over a 60 s outage beats unaided dead-reckoning by ~4× (ensemble). Honest limit: loosely-coupled accel-bias/tilt are weakly separable, so per-bias calibration is not claimed. |
| Tightly-coupled GNSS/INS (pseudorange) | `validated` (model) | `src/fusion/gnss_ins_ekf.rs` `update_tightly_coupled` + `closed_loop.rs` `fuse_tightly_coupled`: the innovation is formed in the range domain (line-of-sight Jacobian on δp). Tests: four satellites null an injected 8 m/−5 m horizontal error to < 0.1 m; **two satellites** (no PVT fix possible) still cut the horizontal error by > 5×; a single overhead satellite observes only the along-line-of-sight (vertical) component and leaves the horizontal untouched; malformed inputs are rejected. Pseudorange-only — carrier phase and an explicit receiver-clock state are roadmap. |
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
| Constellation-design optimiser + streets-of-coverage geometry | `validated` (model) | `src/walker.rs`: `optimize_walker_design` searches the `{planes × sats × inclination}` grid and returns the cell that best meets a `DesignObjective` (min satellites for a coverage target / max coverage / min worst-PDOP) — a test asserts the pick equals an independent brute-force scan of the same sweep, and a worked example confirms a GPS Walker 24/6/1 design covers at least as well as a thinned 18-satellite one. The analytical **streets-of-coverage** closed forms (`coverage_half_angle_rad` `λ = arccos(Re/r·cos ε) − ε`; `street_half_width_rad` `cos c = cos λ / cos(π/s)`, Rider/Beste) are hand-verified against textbook geometry (GPS at a 5° mask: λ ≈ 71.16°, 4-sat street half-width ≈ 62.83°) and detect the under-population gap (`λ < π/s ⇒ None`). The full Rider minimum-satellite *global*-coverage solver (the seam-sensitive plane count) is not yet implemented. |
| Dilution of precision (GDOP/PDOP/HDOP/VDOP/TDOP) -> position accuracy | `validated` | `src/orbit.rs`: `Q=(HᵀH)⁻¹` from the line-of-sight design matrix; a regular-tetrahedron geometry reproduces the closed-form DOPs (PDOP 1.5, TDOP 0.5, GDOP √2.5, HDOP √1.5, VDOP √0.75) to 1e-9. Position sigma = PDOP × user-equivalent range error. |
| Multi-constellation availability | `validated` | `src/orbit.rs`: additional `[[constellations]]` are merged into one satellite set for visibility/DOP; a combined-count test confirms the union. |
| Real constellation geometry from TLEs (line-2 / Keplerian) | `validated` (parsing) | `src/tle.rs`: parses the line-2 mean Keplerian elements (semi-major axis from the mean motion); a known ISS element set round-trips to the correct elements and period. For a line-2-only block, propagation is the engine's two-body (+ optional J2) of the *mean* elements — sound for a snapshot from a common epoch, drifting from SGP4 over time. |
| SGP4 / SDP4 propagation (full TLEs) | `validated` | `src/sgp4.rs`: full near-Earth SGP4 + deep-space SDP4 (lunar-solar secular/periodic + 12 h / 24 h geopotential resonance). Validated in `tests/sgp4_verification.rs` against the official AIAA 2006-6753 ("Revisiting Spacetrack Report #3") vectors — all 666 reference states (near-Earth, deep-space, resonant, error-code cases) match to a worst-case position error of ≈ 4.1 mm. A full two-line set (line 1 + line 2) is propagated with SGP4; line-2-only stays Keplerian; the two can be mixed. Frame is TEME, used consistently for the user and satellites (no TEME→ECEF reduction — adequate for availability/DOP geometry). |
| IAU 2000A / 2000B nutation + TEME→GCRS reduction | `validated` | `src/nutation.rs`: the **full IAU 2000A** series (678 luni-solar + 687 planetary terms, `nutation_iau2000a`) and the 77-term 2000B truncation (`nutation_iau2000b`) are each validated **bit-for-bit** against the published SOFA/ERFA reference vectors at JD_TT 2453736.5 — `eraNut00a` gives Δψ = −0.9630909107115518e-5, Δε = 0.4063239174001679e-4; `eraNut00b` gives Δψ = −0.9632552291148363e-5, Δε = 0.4063197106621160e-4 — both to **1e-13 rad**. The 2000A table is machine-generated from the ERFA `nut00a` source by `tools/gen_nut00a.py` (reproduces the committed `nutation_iau2000a_data.rs` bit-for-bit). The nutation matrix (`iauNumat`), equation of the equinoxes, and the full TEME→TOD→MOD→GCRS chain (`teme_to_gcrs`, Vallado AIAA-2006-6980) are tested for proper-rotation/round-trip/precession-plus-nutation properties; 2000A vs 2000B agree to < 1 mas as required. The chain is equinox/GMST-based; the equinox-free CIO (X,Y,s) reduction and its independent ANISE/SPICE numerical cross-check (≤ 3.6 m at GNSS orbit, well inside the < 10 m target) are in the CIO row below. |
| IGRF-14 geomagnetic main-field model | `validated` (self-contained) | `src/igrf.rs`: the IAGA Schmidt-normalised spherical-harmonic field (degree/order 13, 2025.0 + secular variation; coefficients machine-generated from the official `igrf14coeffs.txt` by `tools/gen_igrf.py`, reproducing `igrf_data.rs` bit-for-bit). Validated without external data on four independent fronts: (1) exact coefficient spot-checks vs the IAGA file (g₁⁰=−29350.0, g₁¹=−1410.3, h₁¹=4545.5 nT); (2) the degree-1 synthesis reproduces the **exact closed-form tilted dipole** field `(B_r,B_θ,B_φ)` to 1e-6; (3) the **full degree-13 analytic field equals −∇V** of the scalar potential (finite-difference, to 1e-4) — exercising the Legendre derivatives and the 1/sinθ term end-to-end; (4) the dipole axis reproduces the known **geomagnetic north pole** (~80.7°N, −72.7°E) and **dipole strength** (~29.7 µT), and the global field lies in the physical 22–67 µT band with the correct hemisphere dip sign. A bit-for-bit check against an external IGRF synthesis at a reference point is a follow-on (the field model + crustal-anomaly map for navigation are tracked separately). |
| CIO-based IAU 2006/2000A GCRS↔ITRS reduction | `validated` | `src/cio.rs`: the equinox-free celestial-to-terrestrial chain. The CIP coordinates `(X, Y)` and the 66-term CIO-locator `s` series are validated **bit-for-bit** against the published SOFA/ERFA `eraXys06a` vector at JD_TT 2453736.5 — X=0.5791308482835292617e-3 (1e-14), Y=0.4020580099454020310e-4 (1e-15), s=-0.1220032294164579896e-7 (1e-18); the GCRS→CIRS matrix against `eraC2ixys` (all nine elements to 1e-12); the Earth rotation angle against `eraEra00(2400000.5, 54388.0)` = 0.4022837240028158102 (1e-12). The `s` table is machine-generated from the ERFA `s06.c` reference by `tools/gen_s06.py` (reproduces `cio_s06_data.rs` bit-for-bit). The full `gcrs_to_itrs_matrix` (CIO `eraC2tcio` = polar-motion · ERA · GCRS→CIRS) is tested for proper-rotation + round-trip, and shown consistent with the legacy equinox/GMST-1982 TEME reduction up to the documented ≈2·(equation of equinoxes) sidereal-convention difference. **Independent third-party cross-check (`xval/anise-frames/`):** the same `gcrs_to_itrs_matrix` is compared against **ANISE** (the pure-Rust NAIF/SPICE reimplementation) rotating GCRF→ITRF93 from JPL's `earth_latest_high_prec.bpc`, with **identical IERS `finals2000A` Earth-orientation parameters fed to both sides**, over eight quarterly epochs 2020–2023. The two independent frame realizations agree to a **maximum relative rotation of 0.028″ — ≤ 0.86 m on the ground, ≤ 0.93 m at LEO, ≤ 3.6 m at GNSS orbit** (mean angle 0.023″). This is the ROADMAP "< 10 m" frame cross-check, **delivered**; the residual is the expected ITRF93-vs-IERS-2010-CIO model/datum difference, not a defect (the bit-for-bit anchor remains the SOFA/ERFA vectors above). ANISE is an MPL-2.0 / edition-2024 crate, so the check lives in a standalone, workspace-excluded sub-crate that never touches the published `kshana` dependency graph or any default CI gate. |
| SP3 export round-trip (constellation → SP3-c → re-parse) | `validated` | `tests/sp3_export_roundtrip.rs`: the real Celestrak `gps-ops` snapshot (30 GPS satellites) is propagated with SGP4, exported to SP3-c (`Sp3File::from_propagators` → `to_sp3_string`), re-parsed (`parse_sp3`), and the recovered ECEF positions are compared against the SGP4 truth at every epoch over 24 h — worst residual **< 0.5 m** (the writer's millimetre serialisation; the milestone's 10 m TLE-grade tolerance is met with large margin). The CLI `--export-sp3` path is covered too: the bundled orbit scenario exports a re-parseable 30-satellite SP3, and a non-orbit scenario is rejected. |
| Real GPS constellation geometry from TLEs (SGP4 → ECEF) | `validated` | `tests/igs_real_data.rs`: a genuine **Celestrak `gps-ops` snapshot** (2021-07-28, 30 operational GPS satellites; provenance in `tests/fixtures/celestrak/NOTICE`) is parsed and each satellite propagated through the validated SGP4 core to a common instant, rotated TEME→ECEF. Asserts the full constellation lands on the GPS MEO shell within 1%, and that from a mid-latitude open-sky site the real all-in-view (nine satellites) yields PDOP 1.64 with the vertical dilution exceeding the horizontal (as it must for a ground user). This exercises SGP4 on a real constellation, alongside the SP3 (precise) and RINEX (broadcast) real-data paths. |
| SGP4 mean-element Walker generator | `validated` | `src/walker.rs`: a designed Walker-delta pattern is emitted as SGP4 mean elements (Kozai mean motion chosen so the SGP4 semi-major axis lands on the target shell) and propagated through the validated core. Tests: a 24-satellite GPS-like Walker sits on the MEO shell within 1%, the planes are spaced exactly 90° in RAAN recovered from the orbit normals, and the mean motion reproduces the ~718 min GPS-shell period. |
| Constellation PDOP sweep + coverage/revisit FoMs | `validated` (monotonicity) | `src/walker.rs`: `pdop_sweep` tabulates coverage and median/worst PDOP over a `{planes × sats × inclination}` grid; `coverage_revisit` reports the coverage fraction and revisit gaps at a ground point. Validated by the physical monotonicities a design trade must obey: adding satellites never lowers coverage and strictly lowers the median PDOP (a full 24-satellite design covers continuously at PDOP ~1.7), and densifying a thinned constellation strictly shrinks the worst revisit gap. The mean revisit gap never exceeds the max. These are geometry trade tables, not a certified link/coverage budget. |

Honest framing: this is a deterministic geometry layer (circular orbits, spherical
Earth of mean radius 6371 km, pure line-of-sight). It establishes *availability* and
the *geometric* position accuracy (dilution of precision × a representative range-error
budget) from real geometry, not a precise-ephemeris navigation solution. The
`orbit-gnss-challenged.toml` reference puts a spacecraft inside the GNSS shell: it holds
a fix only ~59% of the day, the quantum clock keeps a 5 ns timing solution through every
gap (availability 1.0) while the chip-scale clock holds ~0.83.

## Numerical (Cowell) propagator & force model

The numerical propagator (`src/propagator.rs`) integrates a hierarchical force model
(`src/forces.rs`) with the adaptive integrators (`src/integrator.rs`). Each term is
validated against analytic truth or a hand-derived closed form, not against another
tool; the perturbations are **off by default**, so the released goldens are untouched.

| Term | Status | Evidence |
|------|--------|----------|
| Cowell propagator vs analytic Kepler truth | `validated` | `src/propagator.rs`: the unperturbed (two-body) orbit reproduces the **exact universal-variable Kepler solution to sub-metre over a 24 h LEO orbit** (a tighter gate than "vs a numerical reference < 10 m"); specific energy and angular momentum conserve to ~1e-9 relative; the J2 nodal regression reproduces the closed-form `j2_secular_rates` to first-order theory (within 2 %, the O(J2²) residual). `solve_kepler_checked` returns `Err` rather than a silently-wrong answer when Newton fails to converge (near-perigee e = 0.999). |
| Adaptive integrators (RK4 step-doubling + Dormand–Prince RK5(4)) | `validated` | `src/integrator.rs`: RK4 integrates `y' = y → e` to < 1e-9, shows the ~16× error drop per halved step (4th-order convergence), and conserves the harmonic oscillator over a period. The DP5(4) embedded error estimate is **O(h⁵)** (halving the step cuts it ~32×), integrates the oscillator over 50 periods conserving energy to < 1e-6, and reaches the same endpoint at the same tolerance in **fewer function evaluations** than step doubling; `propagate_dopri` clears the same sub-metre Kepler gate and agrees with the RK4 path to < 1 m on a J2..J6 orbit. |
| J2–J6 zonal-harmonic field | `validated` | `src/forces.rs`: `zonal_accel` is checked three ways — it **reduces to the 666-vector-validated `j2_accel` to machine precision** when restricted to `[J2]`; it **matches the numerical gradient of its own zonal potential** through the full J2..J6 field (the conservative-field gold standard); and the odd `J3` vs even `J2`/`J4..J6` terms show the characteristic north–south (anti)symmetry under `z → −z`. A propagated J2..J6 orbit conserves total energy to ~1e-8 over a day. |
| Third-body (Sun and Moon) gravity | `validated` | `src/forces.rs` + `src/ephem.rs`: `third_body_accel` **matches the exact gradient of its disturbing potential**, vanishes at the geocentre, and hits the textbook LEO magnitudes (~5e-7 m/s² Sun, ~1.1e-6 m/s² Moon). The low-precision Montenbruck–Gill Sun ephemeris hits hand-derived J2000 anchors (perihelion distance ≈ 1.471e11 m, ~−23° solstice declination, ~1°/day motion); the Moon ephemeris stays inside its perigee/apogee envelope, recovers the ~384 400 km mean distance, never exceeds the 5.3° inclination, and returns to within 1° after one sidereal month. The epoch-driven RHS wiring is **bit-exact** (the RHS term equals `third_body_accel` at the sampled position at t = 0 and t = 1 day), and a quarter-year epoch shift yields a different trajectory. |
| Solar-radiation pressure + conical shadow | `validated` | `src/forces.rs`: `srp_accel` (cannonball `ν·P☉·cᵣ·(A/m)·(AU/d)²·d̂`) is **bit-identical** to the closed form in full sun, pins the **1-AU radiation pressure to ≈ 4.5398e-6 N/m²**, sits in the ~1.36e-7 m/s² LEO band pushing away from the Sun, quarters when the Sun distance doubles (inverse-square), and is **exactly zero** deep in the umbra. `conical_shadow` gives `ν = 1` in full sun and `ν = 0` in total umbra (exact), a smooth monotonic penumbra rising 0 → 1 across the `[b−a, b+a]` band that **extends beyond the umbral cylinder**. |
| Atmospheric drag (first velocity-dependent term) | `validated` | `src/forces.rs`: `atmospheric_density` (Vallado Table 8-4 piecewise-exponential) **anchors at 1.225 kg/m³ at sea level**, clamps below the surface, decreases monotonically through LEO, sits in the ~1e-12 kg/m³ band at 400 km with a physical recovered ~58 km scale height; `drag_accel` opposes the co-rotating relative velocity at the ~2e-6 m/s² LEO magnitude. The signature check: a 300 km orbit loses specific energy **monotonically** and its semi-major axis decays a bounded ~km/day, where the vacuum baseline conserves energy to < 1e-9. |
| Post-Newtonian (Schwarzschild) relativistic correction | `validated` | `src/forces.rs`: `relativistic_accel` (IERS `β = γ = 1` form `a = (μ/c²r³)·{[4μ/r − v²]·r + 4(r·v)·v}`) collapses on a circular orbit to the closed form `3μ²/(c²r³)·r̂` (radial, **outward**, off-axis components exactly zero), shows the textbook **`≈1.9e-9` LEO ratio to two-body**, matches the hand-simplified radial-velocity form `μ(4μ + 3v²r)/(c²r³)` to < 1e-12, and in the propagator **perturbs the orbit while holding the semi-major axis to under a metre/day** — the conservative opposite of drag's decay. |

Honest scope: the released `ForceModel` defaults integrate the zonal field. The
high-degree EGM2008 **tesseral** field (`src/gravity_sh.rs`, degree/order 70), the
solid/ocean/atmospheric **tides** (`src/tides.rs`), and the **Lense–Thirring**
frame-dragging term are now implemented and composed into the reference-grade
precise-OD force model (`src/precise_od.rs` — see below). The NRLMSISE-00 thermospheric
density (drag is the static Vallado model), solar limb darkening / the oblate-Earth
shadow, DE-grade ephemeris accuracy, and an external GMAT/Orekit cross-validation of a
high-fidelity run remain follow-ons.

## Tides on the geopotential (`src/tides.rs`)

Time-varying corrections ΔC̄_nm, ΔS̄_nm to the Stokes coefficients (IERS Conventions
2010, Chapter 6), validated against the conventions' own published numbers — not against
another tool.

| Contribution | Status | Evidence |
|------|--------|----------|
| Solid Earth tide (IERS Eq. 6.6 / 6.8b / 6.14) | `validated` | `tests/tides_iers.rs`: the permanent (zero-frequency) tide ΔC̄₂₀ lands within 1 % of the IERS-published −4.1736×10⁻⁹ (anelastic Love numbers); the **Step-2 K1 worked example is reproduced bit-for-bit** (sin/cos amplitudes 470.9 / −30.2 ×10⁻¹² to 0.1×10⁻¹²); the normalized Legendre path is pinned by closed-form hand values independent of the recurrence. |
| Ocean tide (IERS Eq. 6.15, FES2004, 8 constituents) | `validated` | The vendored FES2004 subset (`tools/gen_fes2004.py` → `src/fes2004_data.rs`, Doodson→multiplier parse) reproduces the source M2 (2,2) coefficients exactly; the K1 Doodson phase equals θ_g + π; the degree-2 sectorial magnitude is physical and an order below the solid tide. |
| Atmospheric S2 air tide (Ray 2001, NASA GSFC) | `validated` | The vendored Ray harmonics convert through the surface-load relation (Eq. 6.21) to a peak ΔC̄₂₂ ≈ 4×10⁻¹¹ (~10 % of the ocean M2 term). Honest caveat: **no published geopotential-coefficient oracle exists for the air tide**, so it is validated by source-integrity + magnitude, a weaker bar than the solid/ocean tides. |

## Maneuvers & trajectory design (`src/maneuver.rs`)

| Aspect | Status | Evidence |
|--------|--------|----------|
| Impulsive ΔV + covariance propagation | `validated` | A velocity discontinuity with a 6×6 covariance carried forward (deterministic burn ⇒ identity STM; the execution-error covariance rotates from the burn frame — ECI or LVLH — into the velocity block). |
| Finite-burn integration vs Tsiolkovsky | `validated` | Constant-thrust integration over a burn arc (mass as a state) whose achieved ΔV matches the closed-form **Tsiolkovsky** rocket equation to **better than 0.01 %**. |
| Lambert solver (Izzo 2015) round-trip | `validated` | The single-revolution Lambert output (`r1`, `r2`, time-of-flight ⇒ `v1`, `v2`) is **round-tripped through the exact universal-variable Kepler propagator** — it must land back on `r2`. |
| Porkchop sweep vs Hohmann floor | `validated` | The launch × arrival C3 / arrival-V∞ grid's minimum is checked against the **analytic Hohmann-transfer C3 floor** for two coplanar circular orbits. |

Honest scope: no trajectory optimizer, no multi-revolution Lambert branches, and a
synthetic coplanar-circular heliocentric model (no planetary DE ephemeris, so a GMAT
Earth–Mars C3 cross-check has not been run).

## Orbit determination (`src/orbit_determination.rs`, `src/batch_ls.rs`)

| Aspect | Status | Evidence |
|--------|--------|----------|
| Gauss–Newton batch corrector | `validated` | The generic `gauss_newton` solver reaches the exact weighted-least-squares solution on a linear fit, recovers true parameters on a nonlinear `a·exp(b·t)` fit, and solves a 3-D range-multilateration from noiseless ranges. |
| Batch orbit determination from ranges | `validated` | `determine_orbit_batch` recovers `[r, v]` from ground-station range tracking (propagated over the two-body + J2 force model) to **sub-metre / mm·s⁻¹ from noiseless ranges**, and to **~2 m with a post-fit residual at the 5 m noise floor** — the signature of a consistent least-squares fit. |
| Sequential (unscented-filter) OD | `validated` | `determine_orbit_sequential` recursively recovers the state to within tens of metres on the same dynamics and range model. |

Honest scope: range-rate/Doppler and angle measurements and station-visibility masking
are follow-ons for the range-only teaching estimator (the full-force precise-OD engine
below carries the variational state-transition matrix).

## Precise orbit determination (`src/precise_od.rs`)

A reference-grade, full-force position-observation batch least-squares estimator: the
EGM2008 tesseral geopotential (evaluated in the Earth-fixed frame through the CIO
reduction) composed with the Sun/Moon third body, SRP, drag, Schwarzschild/Lense–Thirring
GR, and the tides above, fit to a track of inertial position fixes with a variational
state-transition-matrix Jacobian. Validated on **synthetic** data, where the truth is
Kshana's own integrator, so every residual is the estimator's and not the dynamics'.

| Aspect | Status | Evidence |
|--------|--------|----------|
| Precise force model composition | `validated` | `tests/precise_od_synth.rs`: the degree-0 field is the exact point mass at every epoch (the central term is rotation-invariant); degree-8 adds the J2-band oblateness; the Sun third body and the tide term wire in bit-faithfully; a constant radial empirical acceleration is purely radial in RTN. |
| Variational state-transition matrix | `validated` | Every column of Φ over a half LEO orbit (degree-8 geopotential + Sun + Moon) agrees with an independent **whole-arc central finite-difference** re-propagation to **< 1×10⁻⁶ relative** in both the position and velocity response — the documented STM↔FD cross-check. Φ(0) = I; the augmented and plain propagators agree to sub-millimetre. |
| Batch-LS self-recovery | `validated` | A 1-hour Kshana arc (degree-6 + Sun + Moon) observed noise-free is recovered from a 150 m / 0.1 m·s⁻¹ offset to the **epoch state within 1×10⁻² m** with near-zero post-fit RMS; with 5 m white noise the post-fit 3-D RMS settles at the **~σ noise floor**, unbiased. SRP **C_R is recovered from 1.0 to within 1 %** of the 1.4 truth. |
| Outlier editing & RTN reporting | `validated` | A 500 m gross blunder is rejected by 5-σ post-fit editing (exactly one observation), leaving a clean millimetre-level fit; residuals are reported decomposed into radial/transverse/normal as well as 3-D. |
| Empirical-acceleration tier (RTN constant + 1-CPR) | `validated` | The nine a-priori-constrained empirical parameters stay below 1×10⁻⁸ m·s⁻² on empirical-free truth without disturbing the fit; a constant 3×10⁻⁸ m·s⁻² cross-track acceleration injected into the truth is recovered to within 20 %. |

Honest scope: the synthetic wave uses nominal Earth-orientation parameters (UT1 ≈ TT, no
polar motion) — exact for self-recovery, since the same model generates and fits the arc.
The agency-dataset validations layer **real** finals2000A EOP and SP3/SPK truth on top of
this engine through the CIO frame chain (`src/eop.rs`, `tests/agency_galileo.rs`).

### Real agency precise orbits (`tests/agency_galileo.rs`)

| Dataset | Status | Evidence |
|---------|--------|----------|
| **Galileo MEO — < 5 m GREEN** | `validated` | Kshana's full-force engine fit to a verbatim slice of **ESA/ESOC's own final orbit** (`ESA0MGNFIN`, ITRF) for Galileo **E11** over 8 h, each ITRF fix rotated into GCRS with real finals2000A EOP: post-fit **3-D RMS 0.132 m** pure force + `C_R` (RTN 0.105/0.067/0.047 m, `C_R` 1.174), **0.070 m** with the empirical tier, from a 78.7 km raw overlap. The full 24 h arc is **0.611 m**. All far inside the 5 m bar. Field gravity-converged by d/o-8 (identical at d/o 8/10/12); the `workflow_dispatch` job runs the full d/o-70. Provenance + SHA-256 in `tests/fixtures/agency/NOTICE.md`; full record in `docs/REFERENCE-GRADE-OD.md`. |
| Swarm-A LEO, LRO lunar | `pending` | The two harder/heterogeneous datasets (drag-dominated LEO; lunar central body via GRGM + NAIF SPK truth) — next wave; honest RMS reported even if above 5 m. |

## Gravity-map / alt-PNT navigation (`src/gravimeter.rs`, `src/mapmatch.rs`, `src/particle_filter.rs`, `src/altpnt/terrain.rs`)

| Aspect | Status | Evidence |
|--------|--------|----------|
| Spherical-harmonic gravity-anomaly field | `validated` | `src/gravimeter.rs`: a low-degree, fully-normalised field checked against the closed-form Legendre functions (`P̄₁₁ = √3·cosφ`, `P̄₂₀ = (√5/2)(3sin²φ−1)`, `P̄₂₂ = (√15/2)cos²φ`) and a hand-derived single-term anomaly of 1.897 mGal. |
| Cold-atom gravimeter measurement model | `validated` (model) | The white-noise floor is derived from the CAI accelerometer ASD (`σ = ASD/√τ`), injected as a deterministic seeded sequence (the matcher is never handed noise-free truth, yet the run is bit-reproducible). |
| Sequential-importance-resampling particle filter | `validated` | `src/particle_filter.rs`: the deterministic core is pinned exactly — ESS spanning 1…N, systematic resampling picking indices in proportion to weight, the weighted-mean convex combination, a Gaussian likelihood pulling the estimate onto the measurement, and seeded predict determinism. |
| Map-match likelihood + recovery | `validated` | `src/mapmatch.rs`: `field_likelihood` peaks (= 1) at a perfect match and falls to `e^(−½)` at one sigma; a particle filter over a distinctive synthetic-terrain patch recovers the true position to within 0.1. |
| 60-minute GPS-denied benchmark | `validated` | `run_gps_denied_gravity_nav` (`scenarios/gps-denied-gravity-nav.toml`): a ~700 km / one-hour outage where the inertial solution drifts to **≈ 70 km** is recovered to **≈ 145 m (< 500 m)** by a hierarchical coarse-to-fine matcher — bit-reproducible, stable across noise realisations, and provably refinement-limited (a single coarse grid stalls at ~2 km). |
| SRTM `.hgt` DEM loader + bilinear sample (ORACLE A) | `validated` | `src/altpnt/terrain.rs` / `tests/terrain_nav_validation.rs`: a hand-built 2×2 `.hgt` buffer with corners [100,200;300,400] bilinear-interpolates to **exactly 250.0** at the cell centre (closed-form oracle), the 16-bit-big-endian round-trip is exact, and the row-flip places the northernmost file-row at the highest stored latitude — all against the **GDAL SRTMHGT driver spec** (16-bit signed big-endian, row-major, north row first, void -32768, <https://gdal.org/en/stable/drivers/raster/srtmhgt.html>). A committed 11×11 fixture (`tools/gen_terrain_fixture.py`) exercises the parser in CI; `#[ignore]`-gated real-tile tests sample published spot-heights (Mount Whitney 4421 m, Badwater Basin −86 m; NGS/NOAA, <https://en.wikipedia.org/wiki/Mount_Whitney>) within survey bands — source-of-truth is the survey, the DEM is under test (non-circular). |
| Terrain-referenced navigation (TERCOM/SITAN) convergence (ORACLE B) | `validated` | `run_terrain_nav` (`scenarios/terrain-nav.toml`): a **hand-derived** injected INS drift (0.5°N, −0.4°E ≈ 70 km at ~12° lat, computed as drift° × M_per_deg × cos lat) is recovered to **< 500 m** (within the grid-resolution floor `search_step/factor² ≈ 140 m`), a > 100× cut over free-inertial — checked against the *injected* number, never the DEM (non-circular), bit-reproducible and stable across noise seeds. |
| Combined gravity+magnetic+terrain fusion gain (ORACLE C) | `validated` | `run_combined_altpnt` (`scenarios/combined-altpnt.toml`): three scalar channels (Δg · |B| crustal-anomaly · elevation) fused as a product likelihood give a **bounded < 500 m** residual over the 60-min outage that, seed-averaged, is **no worse than the best single channel** (information additivity / lower CRLB). Sits in the published TERCOM/TRN "tens of metres" CEP regime (<https://en.wikipedia.org/wiki/TERCOM>; PeerJ 2024 ESKF-TERCOM, <https://peerj.com/articles/cs-3118/>). |

Honest scope: the gravity field is low-degree + synthetic mascons, **not** the full
EGM2008/EIGEN coefficient set; the magnetic channel rides on the smooth IGRF main field plus
**synthetic** crustal-anomaly mascons (a real high-frequency crustal map is a follow-on); the
CI terrain field is the self-contained synthetic DEM (real SRTM tiles are exercised only by
the `#[ignore]`-gated tests). A map-representation-error Monte-Carlo remains a follow-on. All
three navigators are now scenario-engine `kind=` wired (`gravity-map`, `terrain-nav`,
`combined-altpnt`).

## INS / IMU error model — datasheet-referenced validation (`src/inertial/`)

The IMU stochastic error model is validated against **published manufacturer
datasheet / dataset specifications** — never against a value Kshana itself produced.
The bridge from a field-unit spec to the SI noise model is the standard
Allan-deviation identification (Riley, NIST SP 1065 §5; IEEE Std 952): the random-walk
coefficient `N` is the overlapping ADEV read at τ = 1 s on the τ⁻¹ᐟ² slope, and the
bias-instability coefficient is the flat Allan plateau (`tests/imu_allan_spec.rs`,
hermetic — no download).

| Aspect | Status | Evidence / oracle |
|--------|--------|-------------------|
| Unit-conversion layer (the #1 non-circularity risk) | `validated` | Hand-checked: 0.15 deg/√hr = 4.3633e-5 rad/√s; 3.6 µg = 3.5304e-5 m/s²; 2.0 deg/hr = 9.6963e-6 rad/s. |
| Gyro angle random walk | `validated` | ADIS16465 ARW 0.15 deg/√hr (Analog Devices datasheet) recovered from ADEV(1 s) to < 5%. |
| Accel velocity random walk | `validated` | ADIS16465 VRW 0.1 m/s/√hr recovered to < 5%. |
| White-noise Allan slope | `validated` | ADIS16460 white branch log-log slope −0.5 ± 0.05. |
| In-run bias instability plateau | `validated` | ADIS16465 gyro BI 2.0 deg/hr recovered as the flat Allan minimum to < 15%. |
| Second IMU profile | `validated` | NaveGo ADIS16488 (ARW 0.3 deg/√hr, VRW 0.029 m/s/√hr) both recovered to < 5%. |

Honest scope: this validates the **stochastic error model** against datasheet Allan
coefficients. A full strapdown + tightly-coupled EKF cross-check against the i2Nav-WHU
**KF-GINS** vehicle dataset is a follow-on — the published static-RTK segment converges
to the cm-level antenna position, so a meaningful navigation-accuracy comparison there
first requires GNSS/IMU lever-arm compensation and a dynamic free-inertial-divergence
window; until then it would measure a fixed geometric offset, not navigation quality.

## Operating envelope

Each pack is exercised across its stated input envelope by
`tests/scenario_coverage.rs`, which asserts every numeric output is finite (no
NaN/Inf) and bounded. The table lists the tested input range per pack, the
expected output behaviour, and the covering test.

| Pack | Input swept | Tested range | Expected output | Covering test |
|------|-------------|--------------|-----------------|---------------|
| clock | `threshold_ns` (timing spec) | 1 – 500 ns | finite holdover/timing/security FoMs | `clock_pack_covers_the_spec_threshold_envelope` |
| inertial | `accel.bias` | 1e-7 – 1e-2 m/s² (cold-atom → crude MEMS) | finite, bounded position RMS/p95 | `inertial_pack_covers_the_accel_bias_envelope` |
| orbit | `mask_deg` (elevation mask) | 5° – 30° | finite DOP/availability; bounded | `orbit_pack_covers_the_elevation_mask_envelope` |
| spoof | `attack.rate_ns_per_s` | 0.1 – 50 ns/s | finite P_md / security, bounded | `spoof_pack_covers_the_attack_rate_envelope` |
| hybrid | `position_spec_m` | 10 – 1000 m | finite timing/position holdover | `hybrid_pack_covers_the_position_spec_envelope` |
| orbit (real) | real Celestrak `gps-ops` TLEs | 30-satellite snapshot, checksum-strict | loads only with valid checksums; bounded geometry | `real_gps_constellation_scenario_loads_with_valid_checksums_and_bounded_output` |
| clock (flicker) | `flicker_floor` on/off | 0 vs 1e-12 | enabling the 1/f floor **worsens** the timing-p95 coast | `flicker_fm_floor_degrades_the_clock_holdover_when_enabled` |
| fusion (realism) | `accel.bias` 0 vs 5.88e-7 m/s² | zero vs realistic non-zero | filter still converges, within 3× the zero-bias error | `fusion_filter_converges_with_a_realistic_non_zero_bias` |

The flicker-FM and fusion-bias rows close two specific realism gaps: the noise
terms are **off by default but demonstrably affect output when enabled**, and the
joint fusion filter **does not depend on biases being zeroed** — it converges with
a realistic cold-atom-grade residual bias too.

## Known limitations

- Quantum and classical runs now use independent RNG seeds (classical seed = seed + 0x9e3779b97f4a7c15) so their noise realizations are uncorrelated — fixed after review.
- `holdover_s` is segment-aware: outage timelines are split into contiguous segments at GNSS re-acquisition and the reported value is the worst-case (shortest) coast across them. It remains bounded by the time-grid resolution (a lower bound).
- ISL time-transfer re-sync models the residual link uncertainty as fresh zero-mean jitter per measurement step plus re-anchoring at the configured interval.

## Claims vs. reality — quick reference

A hostile reviewer's checklist. For each term that could be read as more than it is:
what Kshana does today, and where the real version sits on the roadmap.

| Term you may see | What it actually is today | What it is **not** (yet) |
|------------------|---------------------------|--------------------------|
| "hybrid quantum/classical PNT simulator" | a classical stochastic simulator driven by published quantum-sensor Allan/noise coefficients | first-principles quantum physics (Mach–Zehnder phase, projection noise, systematics) — see [`QUANTUM-MODELS.md`](QUANTUM-MODELS.md) |
| "joint Kalman fusion" / fusion pack | the runnable `fusion` pack observes the clock and position **separately** (a direct time fix and a direct position fix), for which the optimal estimator is genuinely block-diagonal — two two-state filters with a combined FoM | a *coupled* filter for the **pseudorange** case now **exists** as `fusion::coupled::CoupledPntFilter` (4-state stacked `[pos,vel,phase,freq]`, non-zero cross-block covariance, NEES-validated) but is **not yet wired into the runnable pack**, and the pack is **1-DOF** — the 3-D 8-state extension is future work |
| Security FoM (`spoof` kind) | `1 − P_md` of a **stochastic time-spoof detector**: a two-sided χ²₁ / Neyman–Pearson test on a clock-aided monitor statistic, threshold set from a target `P_fa`, `P_md` evaluated **at the spec magnitude** both closed-form and by Monte-Carlo (which agree to a few ×1/√N) | a multi-satellite RAIM/ARAIM detector — see [`INTEGRITY.md`](INTEGRITY.md); the monitor statistic is a Gaussian model with the clock's PSD-derived σ, not a signal-level correlation |
| "clock-aided spoof-detection" | a **single-clock** time-discrepancy monitor (Gaussian statistic, σ from the clock PSD), NOT multi-SV RAIM | range-domain multi-SV RAIM with protection levels |
| spoof-detector P_md (closed-form vs Monte-Carlo) | the analytic `Φ`-based `P_md` and the empirical `mc_runs`-trial estimate match within sampling error (≈ 1/√N); validated in `src/spoof.rs` / `src/detection.rs` tests at a stressed deflection (μ/σ = 2) | a measured detector ROC against recorded spoofing data |
| `gnss-sim` pseudorange model | a **forward simulation**: `ρ = geometric + clocks + Klobuchar iono + Saastamoinen·Niell tropo + noise + multipath`. Each atmosphere model is unit-tested against hand values (ZHD ≈ 2.3 m, Niell = 1 at zenith, Klobuchar obliquity); a **zero-noise run reproduces geometry + corrections to sub-millimetre** (RAIM residual ≈ 0) | a position **solution** from real signals (PPP/RTK), dual-frequency iono-free combination, or carrier-phase ambiguity resolution — not modelled |
| jamming model (`jamming` kind) | a **link-budget** chain: J/S from free-space path loss + per-direction antenna gain → effective C/N₀ via the anti-jam equation (despreading gain × spectral-separation `Q`) → loss of lock at a threshold (Kaplan & Hegarty §9.4) | multipath, terrain shadowing of the jammer, near/far AGC, adaptive nulling, acquisition-vs-tracking hysteresis; `Q` is a representative per-type constant, not derived from the jammer's measured PSD |
| Integrity FoM | filter **self-consistency** (fraction of outage samples inside its own k·σ bound) | HPL/VPL, integrity risk / P_HMI, alert limits, DO-229E/316/ED-259A |
| legacy `inertial` scenario **pack** FoM | a **single-axis (1-DOF)** accelerometer/gyro error budget (VRW/ARW, bias-instability) with a truth-snap reset | the *legacy* pack is 1-DOF; the **3-axis path ships in the `gnss-ins` pack** (next row) |
| 3-axis strapdown **library** + `gnss-ins` **pack** (`src/inertial/`, `src/fusion/pack.rs`) | a verified quaternion/NED navigator with a deterministic IMU error model — **scale-factor, misalignment, g-sensitivity, quantization, rate-ramp** modelled (IEEE Std 952-1997 §A.2; Groves 2013 §4.3) — now **driven by the `gnss-ins` scenario pack** and **configurable per sensor from TOML** (`[imu_*.error_model]`) | **not modelled:** vibration rectification error, temperature-gradient drift. The fused-coast error is floor-limited by hand-over attitude error (tilt/accel-bias weakly separable), so per-bias calibration is not claimed |
| "Hybrid PNT integration" | open-loop dead-reckoning bracketed by truth-snap GNSS resets | a coupled (loose/tight) GNSS–INS Kalman blend |
| "Positioning Performance" (clock packs) | clock-phase **timing** RMS in ns (`timing_rms_ns`) | a position-domain RMS/CEP/SEP/DOP-weighted accuracy |
| inertial position FoM (`pos_rms_m`) | a **single-seed, single-axis** position RMS/p95 in metres | an ensemble CEP / 2DRMS distribution (roadmap: Monte-Carlo CEP) |
| "validated to ~2%" | a *typical* observed agreement; the **enforced gate is 20–25%** relative error | a guaranteed 2% accuracy bound |
| "reproducible / bit-identical" | bit-identical re-run on the **same OS + pinned toolchain** | a committed cross-platform golden-hash check (roadmap: reproducibility milestone) |
| SGP4 GPS scenario (`orbit-sgp4-gps.toml`) | synthetic Walker TLEs (placeholder NORAD IDs) for geometry demonstration | the real `gps-ops` constellation — drop in a Celestrak snapshot (see [`REAL_TLE_GUIDE.md`](REAL_TLE_GUIDE.md)) |
