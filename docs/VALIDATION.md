# Validation status

> **On tolerances.** "Validated" below means a calibration test asserts the simulated
> statistic matches the reference relation within an **enforced gate**, currently
> **20–25% relative error** (seed-averaged) for the Allan/noise-budget relations. Median
> observed agreement is often much tighter (a few percent), but the *guaranteed* bound is
> the gate, not the median. Where a number like "~2%" appears it is a typical observation,
> not the enforced tolerance. See [Claims vs. reality](#claims-vs-reality--quick-reference).

| Noise term | Status | Evidence |
|------------|--------|----------|
| Allan estimator parity (ADEV/MDEV/TDEV/OHDEV) | `validated` | `tests/allan_reference.rs`: the overlapping ADEV, modified ADEV, time deviation, and overlapping Hadamard estimators reproduce the **Stable32 reference deviations for the canonical NBS14 dataset** (Riley, NIST SP 1065 ~p.107) at tau = 1, 2 to a **1e-4** relative tolerance — agreement is actually ~1e-6 (e.g. OADEV(2) 85.952868 vs 85.95287). This pins the *estimator maths* against the reference tool, distinct from the noise-*calibration* rows below. |
| Noise-type-specific edf (confidence intervals) | `validated` | `src/allan.rs`: the χ² confidence band on each overlapping-ADEV point uses the noise-type-specific effective degrees of freedom (NIST SP 1065 Table 5 closed forms for WPM/FPM/WFM/FFM/RWFM — the Stable32 simple set), with the record's power-law type identified from its MDEV log-log slope. Two independent checks: (a) the five formulas reproduce hand-evaluated values at N=64,m=4 to 1e-12; (b) a **Monte-Carlo white-FM ensemble** (4 000 records) measures the estimator's actual chi-squared edf = 2·mean²/Var(σ²) and matches the formula within 20% (and materially beats the conservative non-overlapping count). The exported ADEV curve carries the identified noise type, edf, and 95% band per τ. |
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
| Dilution of precision (GDOP/PDOP/HDOP/VDOP/TDOP) -> position accuracy | `validated` | `src/orbit.rs`: `Q=(HᵀH)⁻¹` from the line-of-sight design matrix; a regular-tetrahedron geometry reproduces the closed-form DOPs (PDOP 1.5, TDOP 0.5, GDOP √2.5, HDOP √1.5, VDOP √0.75) to 1e-9. Position sigma = PDOP × user-equivalent range error. |
| Multi-constellation availability | `validated` | `src/orbit.rs`: additional `[[constellations]]` are merged into one satellite set for visibility/DOP; a combined-count test confirms the union. |
| Real constellation geometry from TLEs (line-2 / Keplerian) | `validated` (parsing) | `src/tle.rs`: parses the line-2 mean Keplerian elements (semi-major axis from the mean motion); a known ISS element set round-trips to the correct elements and period. For a line-2-only block, propagation is the engine's two-body (+ optional J2) of the *mean* elements — sound for a snapshot from a common epoch, drifting from SGP4 over time. |
| SGP4 / SDP4 propagation (full TLEs) | `validated` | `src/sgp4.rs`: full near-Earth SGP4 + deep-space SDP4 (lunar-solar secular/periodic + 12 h / 24 h geopotential resonance). Validated in `tests/sgp4_verification.rs` against the official AIAA 2006-6753 ("Revisiting Spacetrack Report #3") vectors — all 666 reference states (near-Earth, deep-space, resonant, error-code cases) match to a worst-case position error of ≈ 4.1 mm. A full two-line set (line 1 + line 2) is propagated with SGP4; line-2-only stays Keplerian; the two can be mixed. Frame is TEME, used consistently for the user and satellites (no TEME→ECEF reduction — adequate for availability/DOP geometry). |
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
