# Validation status

| Noise term | Status | Evidence |
|------------|--------|----------|
| White FM (short-term) | `validated` | `tests/calibration.rs`: simulated overlapping ADEV reproduces published sigma_y(1 s) to ~2%, and the white-FM curve sigma_y(tau)=sigma_y(1s)/sqrt(tau) across tau = 1, 10, 100 s to <25% (matches CSAC datasheet 3e-10 / 1e-10 / 3e-11). |
| Random-walk FM (long-term) | `validated` | `tests/calibration.rs`: simulated ADEV matches sigma_y^2(tau)=q_rw*tau/3 (Riley NIST SP 1065) to ~20% (seed-averaged). |
| Aging / linear drift | `modeled` + calibrated-out | Deterministic; the holdover estimator removes offset and aging via a quadratic predictor, so the residual is the stochastic limit. Tested in `src/estimator.rs` / `src/models.rs`. |
| Kalman estimator + integrity bound | `validated` | `src/kalman.rs`: a two-state (phase, frequency) filter whose exact van Loan process noise matches the truth model; coasting reproduces the analytic holdover variance `q_wf*T + q_rw*T^3/3` to 1e-9. The run layer reports Integrity as the fraction of outage samples inside the 3-sigma protection bound (`src/run.rs`). |
| Flicker FM (floor) | `modeled` (off by default) | Synthesised as a sum of log-spaced Ornstein-Uhlenbeck processes calibrated to a configurable flat ADEV floor; `src/models.rs` validates the floor is flat across averaging time and sits at the configured level (seed-averaged). Enabled per clock via `flicker_floor`. The cited reference scenarios leave it off: CSAC is white-FM-dominated across its datasheet range (1-1000 s) and the optical-clock systematic floor (~5e-17) is represented by its accuracy figure. |

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
| Bias instability (slow drift), scale factor | `not modeled` | Residual bias is modeled as a constant at the published bias-stability level; finer bias-instability dynamics and scale-factor error are future work. |

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
| Line-of-sight visibility (Earth occultation + elevation mask) | `validated` | Antipodal sat occulted, radially-outward sat at 90 deg elevation, tangential sat on the horizon — exact hand-derived tests. |
| Visibility -> GNSS state -> timeline | `validated` | `>=4` visible = nominal, 1-3 degraded, 0 denied; Walker-delta generator; integration test drives a clock-holdover run from the derived timeline. |
| Higher-fidelity propagation / position-domain (GDOP) | `not modeled` | Circular orbits and a spherical Earth; no perturbations, ephemerides, or DOP-based position error yet. |

Honest framing: this is a deterministic geometry layer (circular orbits, spherical
Earth of mean radius 6371 km, pure line-of-sight). It establishes *availability* from
real geometry, not a precise-ephemeris navigation solution. The
`orbit-gnss-challenged.toml` reference puts a spacecraft inside the GNSS shell: it holds
a fix only ~59% of the day, the quantum clock keeps a 5 ns timing solution through every
gap (availability 1.0) while the chip-scale clock holds ~0.83.

## Known limitations

- Quantum and classical runs now use independent RNG seeds (classical seed = seed + 0x9e3779b97f4a7c15) so their noise realizations are uncorrelated — fixed after review.
- `holdover_s` is segment-aware: outage timelines are split into contiguous segments at GNSS re-acquisition and the reported value is the worst-case (shortest) coast across them. It remains bounded by the time-grid resolution (a lower bound).
- ISL time-transfer re-sync models the residual link uncertainty as fresh zero-mean jitter per measurement step plus re-anchoring at the configured interval.
