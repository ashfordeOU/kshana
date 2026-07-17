# Scenario kinds

The 50 built-in scenario kinds that `kshana::api::run_toml` dispatches over, each with its one-line description and its required / optional TOML fields.

This file is **generated** from `api::list_scenario_kinds()` — the single source of truth — by `cargo run --bin gen_validation_artifacts`; edit the source, not this file. Every binding (the Python package, the MCP server's `list_scenario_kinds` tool, and the WASM playground) exposes this same catalogue, so what is listed here is exactly what every surface can run.

| # | Kind | Description |
|--:|------|-------------|
| 1 | [`clock`](#clock) | Clock holdover vs spec; optional Monte-Carlo ensemble (runs > 1). |
| 2 | [`inertial`](#inertial) | 1-DOF inertial dead-reckoning during a GNSS outage. |
| 3 | [`orbit`](#orbit) | GNSS availability + DOP from an orbital constellation (Walker / TLE / RINEX). |
| 4 | [`ephemeris`](#ephemeris) | Ephemeris & ground track: propagate one satellite (TLE→SGP4 or analytic orbit) and emit its TEME/GCRS state (position + velocity), ITRF/ECEF position, WGS-84 sub-satellite lat/lon/alt, and per-step station az/el/range + range-rate (Doppler). |
| 5 | [`integrity`](#integrity) | Snapshot / solution-separation / ARAIM RAIM with HPL/VPL and a Stanford diagram. |
| 6 | [`lunar-integrity`](#lunar-integrity) | Lunar south-pole ARAIM protection-level pass vs a representative LunaNet relay set. |
| 7 | [`lunar-time-offset`](#lunar-time-offset) | Modelled relativistic Earth–Moon clock rate (Lunar Coordinate Time, LTC/TCL): the secular LTC−TT rate from the self-potential difference and the Moon's kinetic term, reported with the published 56–59 µs/day band, plus the accumulated offset over a horizon. |
| 8 | [`lunar-vlbi`](#lunar-vlbi) | Modelled lunar geodetic VLBI delay observable: an Earth baseline (two ground stations, GCRS) observes a one-way signal from a NovaMoon-class lunar-surface beacon. Emits the near-field two-range-difference delay, its rate, and the wavefront-curvature near-field correction over a pass — cross-checked against the same-codebase plane-wave Δ-DOR observable in the far-field limit, with finite-difference-verified partials. MODELLED, NOT validated against real VLBI data; carries the frame-consistency, xp=yp=0 polar-motion and plane-wave-vs-near-field caveats. |
| 9 | [`lunar-joint-od-clock`](#lunar-joint-od-clock) | Modelled joint multi-technique lunar OD + clock batch estimator on a SIMULATED network: a Gauss-Newton snapshot fit that fuses Earth-baseline geodetic VLBI delays, lunar-local station↔satellite ranges and inter-satellite ranges to recover, together, a lunar surface station's 3-D position, a small constellation's positions and every asset's clock offset from an injected truth. The headline honest result — VLBI makes the station's full 3-D position observable where lunar-local ranging alone leaves a weakly-observed direction — is reported as the with-vs-without-VLBI station-error contrast. MODELLED simulated closed-loop recovery (truth shares the observation model), deterministic (seeded), NOT real-data validated; no force-model propagation inside the solver; no TRL/heritage/agency endorsement. |
| 10 | [`lunar-frame-realisation`](#lunar-frame-realisation) | Modelled lunar reference-frame realisation: a 7-parameter Helmert (similarity) datum fit — 3 translation, 3 small-angle rotation, 1 scale — tying an estimated set of selenographic-derived MCMF point coordinates to a datum by weighted least squares (crate::batch_ls::gauss_newton), plus a simple orientation tie expressing the realised small rotation about the ICRF axes relative to the IAU 2015 WGCCRE body orientation. The scenario injects a known small transform (translation ~tens of m, rotation ~µrad, scale ~1e-7) into a well-spread synthetic point network, adds seeded Gaussian noise, recovers the datum, and reports the recovered transform, the per-parameter recovery error vs the injected truth, and the post-fit RMS residual. MODELLED self-consistency — recovers an injected similarity transform (noiseless to ~machine precision), NOT a realisation against real tracking/VLBI data; deterministic (seeded); no TRL/heritage/agency endorsement. |
| 11 | [`moonlight-service-volume`](#moonlight-service-volume) | Modelled lunar navigation service-volume analysis from an ILLUSTRATIVE, public-source Moonlight/LCNS-class lunar-orbit constellation (not affiliated with ESA): sweeps a selenographic lat/lon grid over a time horizon and reports DOP / coverage / availability (≥4 sats AND PDOP < threshold) plus a generalised lunar ARAIM protection-level (HPL/VPL) envelope over the volume. The DOP geometry REUSES the gnss_lib_py-VALIDATED kernel (crate::orbit::dop); the protection level REUSES the LunaNet LNIS lunar ARAIM machinery (crate::lunar, σ_URE≈30 m) and reduces to the existing south-pole PL as a special case. MODELLED composition: a circular-/elliptical-Keplerian relay set (not the real differential-corrected LCNS/NRHO ephemeris), a mean-rotation Moon (no libration/precessing pole). Deterministic (pure geometry). No TRL/heritage/agency endorsement. |
| 12 | [`lunar-differential-pnt`](#lunar-differential-pnt) | Modelled lunar DIFFERENTIAL PNT (a lunar DGNSS/SBAS analogue): a NovaMoon-class reference station at a KNOWN selenographic location computes per-satellite differential corrections from an ILLUSTRATIVE, public-source Moonlight/LCNS-class constellation (NovaMoon referenced only as a system CLASS, not affiliated with ESA), and a user offset by baseline_km applies them so the COMMON-MODE orbit + clock errors cancel. The clock term cancels EXACTLY (an algebraic identity); the orbit term leaves only the line-of-sight-difference projection, which → 0 as baseline → 0 (the spatial-decorrelation floor) and grows ≈ linearly with baseline. Reports the user 3-D position error WITH vs WITHOUT corrections, the reduction factor, the error-vs-baseline curve, and a user protection level that REUSES the DO-229E SBAS machinery (crate::sbas) with the differential residual σ. MODELLED — exact cancellation identity + first-order decorrelation model; not real-data validated; no TRL/heritage/agency endorsement. Deterministic if seeded. |
| 13 | [`lunar-interop-export`](#lunar-interop-export) | Modelled lunar interoperability export: emits the lunar reference frame, lunar time scale and lunar ephemeris in LunaNet/IOAG-aligned, CCSDS-based interchange forms with round-trip / field conformance. REUSES the crate's CCSDS OEM 2.0 emitter+parser (crate::oem) re-tagged for the lunar context — the OEM REF_FRAME carries the IAU 2015 WGCCRE lunar body frame (MOON_ME / MOON_PA), TIME_SYSTEM the lunar time scale (LTC / TCL / UTC), CENTER_NAME = MOON — over a sample illustrative LCNS-class ephemeris (positions from crate::lunar_service, velocity by finite difference). Also emits a LunaNet/IOAG-aligned lunar-time descriptor (scale id, secular rate µs/day from crate::lunar_time, published band, reference surface) that round-trips via serde_json, and wraps the artifacts in the existing KIF envelope (crate::interchange) with the MODELLED honesty label. Reports artifacts emitted, OEM line count, field-conformance pass + present/missing field list, OEM round-trip ok, time-metadata round-trip ok, and KIF byte size. MODELLED — deterministic round-trip + field-name conformance vs published CCSDS OEM + LunaNet/IOAG field semantics is the oracle; NOT a certified interoperability conformance test; illustrative public-source ephemeris, not affiliated with ESA; no TRL/heritage/agency endorsement. |
| 14 | [`timetransfer`](#timetransfer) | Optical vs RF two-way time/frequency transfer. |
| 15 | [`quantum-anomaly-detect`](#quantum-anomaly-detect) | MODELLED fault/anomaly detection for quantum PNT systems: a labelled fault catalog (clock frequency-jump/drift/lock-loss; sensor bias-step/dropout), a detection-statistic ROC AUC (with a bootstrap CI from the externally-validated eval_stats) and a minimum-detectable-fault at a fixed false-alarm rate, with the quantum-clock-aided monitor (lower noise) detecting smaller faults — as honest TradeEvidence + representativeness. Gaussian detection-statistic model (AUC = Phi(mu/(sigma*sqrt2))); models the class, illustrative public-source params, no TRL/flight/certification. |
| 16 | [`quantum-gnss-free-nav`](#quantum-gnss-free-nav) | MODELLED GNSS-free quantum navigation: during a GNSS outage, a quantum (cold-atom interferometer) inertial budget vs a classical navigation-grade INS — position-error growth over the coast, holdover to a position threshold, and the quantum-vs-classical trade as honest TradeEvidence with representativeness. Honest observability note: with no external fix the accelerometer bias is unobservable so the error grows; the quantum sensor slows but does not close that gap. Illustrative public-source device params; models the class, no TRL/flight/certification. |
| 17 | [`quantum-time-transfer`](#quantum-time-transfer) | MODELLED trusted-quantum-timing chain: an end-to-end quantum (optical-lattice clock + entanglement/single-photon link) vs classical (CSAC + RF two-way) time-transfer budget, a reused timing protection level + a delay/replay-attack security FoM (1-P_md), a clock-anomaly detection probability + CUSUM latency, and the quantum-vs-classical trade as honest TradeEvidence with a representativeness + gaps-to-flight record. Illustrative public-source device/link params; models the class, no TRL/flight/certification claimed. |
| 18 | [`hybrid`](#hybrid) | Hybrid PNT capstone: clock + IMU + time-transfer aiding. |
| 19 | [`fusion`](#fusion) | Joint Kalman sensor-fusion PNT over the same hybrid inputs. |
| 20 | [`hybrid-ukf`](#hybrid-ukf) | 17-state hybrid quantum+classical tightly-coupled GNSS/INS UKF (MODELLED): 15 INS error states + CAI-derived accel-bias correction + a 2-state (phase+frequency) clock from the q-parameter clock engine, driven by the bracketed CAI error model. The figure of merit is filter self-consistency (NEES + innovation-whiteness vs χ² bounds) — a self-consistency statement, NOT a real-world accuracy guarantee. Simulation only; no TRL>3, no flight heritage, no external validation. |
| 21 | [`gnss-ins`](#gnss-ins) | Loosely- and tightly-coupled GNSS/INS error-state EKF. |
| 22 | [`gnss-sim`](#gnss-sim) | Measurement-domain pseudorange simulation (Klobuchar iono, Saastamoinen/Niell tropo) + RAIM. |
| 23 | [`jamming`](#jamming) | Link-budget jamming: J/S → effective C/N₀ → loss of lock. |
| 24 | [`spoof`](#spoof) | Stochastic time-spoof detector (Neyman–Pearson / χ²₁) with Monte-Carlo P_fa/P_md. |
| 25 | [`spoof-detect`](#spoof-detect) | Combined RF/measurement spoof detector (multi-SV RAIM-consistency + AGC + SQM, fused) vs a parameterised attack (power advantage, carrier-phase alignment, time/position push; TEXBAT-style). |
| 26 | [`sweep`](#sweep) | 1-D trade-study sweep over a clock-pack parameter. |
| 27 | [`sweep-nd`](#sweep-nd) | Generic N-D sweep over any pack via dotted TOML keys / JSON metric paths. |
| 28 | [`gravity-map`](#gravity-map) | GPS-denied gravity-map-matching navigation: a cold-atom gravimeter recovers a constant INS drift from the gravity-anomaly sequence it flies through. |
| 29 | [`terrain-nav`](#terrain-nav) | GPS-denied terrain-referenced navigation (TERCOM/SITAN): a radar/baro altimeter matches the ground-elevation profile against an SRTM-style DEM to recover the INS drift. |
| 30 | [`terrain-slam`](#terrain-slam) | GPS-denied sequential (recursive) terrain-referenced navigation: a particle filter runs the terrain-match measurement model epoch by epoch (SITAN as a running filter) so a time-varying INS drift is tracked along the track, where the batch terrain-nav only recovers a single constant offset. |
| 31 | [`combined-altpnt`](#combined-altpnt) | GPS-denied combined gravity + magnetic + terrain navigator: three scalar field channels fused per waypoint for a sharper (lower-CRLB) drift fix than any single field. |
| 32 | [`pvt`](#pvt) | Real-observation single-point positioning: solve a receiver's position from a RINEX 3 observation file and a broadcast-navigation file (code pseudoranges, broadcast ephemeris, Klobuchar iono, Saastamoinen/Niell tropo), optionally validated against a surveyed coordinate. |
| 33 | [`mars-pnt`](#mars-pnt) | Deep-space Mars PNT: a simulated MARCONI relay constellation (areostationary + inclined relays broadcasting one-way + relaying two-way to a deep-space station) navigates a reference user (transfer \| lmo \| surface) through the joint one-way/two-way radiometric fusion estimator. Reports per-epoch geometry/visibility, achieved RMS vs truth, and the formal covariance (1σ / 3σ position) — an honest simulated FoM, NOT a certified protection level. |
| 34 | [`impairment-eval`](#impairment-eval) | AI/ML RF-impairment detection evaluation testbed (13494): generate a labelled, parameter-grounded SYNTHETIC corpus (nominal/jamming/spoof-time/spoof-position/multipath), score a detector (energy\|agc\|sqm\|parity\|fused) with the detector-agnostic harness, and report AUC/ROC/confusion + per-class Pd at a target Pfa, plus the in- vs out-of-distribution optimism gap. MODELLED operating characteristics only — never field/IQ, no good/bad verdict. |
| 35 | [`quantum-trade`](#quantum-trade) | Quantum-vs-classical PNT trade (13503): timing-holdover + inertial-holdover benefit of a candidate clock (a measured-ADEV curve — the defensibility hinge — or a quantum clock class) vs a classical baseline class, with the long-tau floor-assumption caveat carried on the artifact, plus a GNSS-denied resilience-vs-time envelope. MODELLED; quantifies (never validates) a partner device. |
| 36 | [`space-weather`](#space-weather) | Space-weather environment model: solar (F10.7/F10.7a) and geomagnetic (Kp, with the definitional Kp↔ap table) activity indices, the Jacchia-1971 exospheric temperature they drive (validated vs published solar-min/mean/max), and the activity-corrected vs static thermospheric neutral density at a set of altitudes — the solar-cycle density dependence the static USSA76 atmosphere omits. MODELLED: the density correction is a calibrated first-order scale-height coupling, NOT a data-validated (NRLMSISE) atmosphere. |
| 37 | [`oem-interop`](#oem-interop) | CCSDS OEM interoperability bridge: import an Orbit Ephemeris Message produced by an external flight-dynamics tool (GMAT/Orekit/STK all emit OEM) and report its segments/objects/frames/epoch-span plus a velocity-consistency check; with no input it round-trips a generated reference orbit and reports the import↔export fidelity. MODELLED structural/physical ingest check, NOT an orbit-accuracy validation of the source. |
| 38 | [`launch-window`](#launch-window) | Two-body launch & ascent geometry: launch azimuth(s) (sin Az = cos i / cos lat), minimum reachable inclination, circular velocity, the Earth-rotation eastward bonus, dogleg plane-change Δv when the target inclination is below the site latitude, and the number of daily launch opportunities. MODELLED spherical-Earth geometry (no rotating-Earth velocity-triangle correction, no ascent/drag-loss model). |
| 39 | [`reentry`](#reentry) | Allen-Eggers ballistic re-entry corridor: peak deceleration (ballistic-coefficient-independent, V_e^2 sin\|γ\|/(2eH)), the velocity and altitude at peak-g, and the peak-heating velocity, for an entry velocity/flight-path-angle/ballistic-coefficient through an exponential atmosphere. MODELLED ballistic (no-lift) analytic entry; heating output is the peak-heating VELOCITY, not a heat-flux (no aerothermal/TPS model). |
| 40 | [`eo-coverage`](#eo-coverage) | Earth-observation payload footprint & coverage geometry (SMAD space triangle): Earth angular radius, swath width, nadir ground sample distance, maximum off-nadir access, circular period and equatorial ground-track spacing with a contiguous-coverage flag, for an orbit altitude + sensor FOV/IFOV. MODELLED spherical-Earth geometry (no radiometry/MTF/atmosphere/jitter/glint; nodal R_e·ω·T spacing, no J2 regression). |
| 41 | [`space-packet`](#space-packet) | CCSDS 133.0-B Space Packet Protocol framing: encode a synthetic TM/TC packet stream (6-octet primary header + data field) and report the per-packet header decode, total octets and an exact encode↔decode round trip. Deterministic exact bit-layout framing — the agency packet-format interop layer; NOT a conformance certification (no secondary-header/CRC/segmentation logic beyond the flags). |
| 42 | [`attitude-budget`](#attitude-budget) | 3-DOF attitude & pointing error budget: the worst-case gravity-gradient disturbance torque ((3/2)(μ/R³)ΔI) and a root-sum-square pointing-error budget over named 1σ contributors (sensor noise, reaction-wheel jitter, thermal, alignment) with the dominant term, for an orbit altitude + body inertia spread. MODELLED scalar AOCS budget — a pre-hardware complement to Basilisk/42, not a control-loop/6-DoF/flexible-mode simulation. |
| 43 | [`passes`](#passes) | Ground-station pass prediction: the time-domain visibility passes (AOS/TCA/LOS, maximum elevation, duration) of a circular orbit over a station above an elevation mask across a window, with interpolated rise/set crossings and total access time. MODELLED Keplerian propagation + Earth rotation (no SGP4 drag/J2 regression), TCA at the sample-step resolution, no light-time/refraction correction. |
| 44 | [`link-budget`](#link-budget) | One-way link budget over the CCSDS 401 / DSN 810-005 link equation: free-space path loss, C/N₀, Eb/N₀, margin and closure for a transmit EIRP, receive G/T, range, data rate and band (s\|x\|ka) against a required Eb/N₀. A deterministic engineering calculation from the supplied inputs (not a calibrated terminal datasheet). |
| 45 | [`lunar-time-budget`](#lunar-time-budget) | MODELLED end-to-end Coordinated Lunar Time (LTC) time-error budget: the seven LTC error terms assembled as time-error curves x_i(τ) over a whole averaging-time grid, root-summed into x_Σ(τ), and the clock-vs-frame CROSSOVER τ at which the growing clock term overtakes the constant real-time frame-realisation term (below it the budget is frame-limited, above it clock-limited) — the honest answer to the single-τ artifact. The τ-slopes are closed-form and analytically checkable (clock τ^{+1/2}/τ^{+1}, floors τ^0, measurement τ^{-1/2}) and the clock rows reproduce the published one-day clock specs (crate::clock_specs); the RF/optical-link, frame-realisation, relativistic-residual and ephemeris floor MAGNITUDES are Modelled budget allocations (documented defaults, caller-overridable), not measurements. The contribution is the reproducible crossover τ, not a certified per-term number; not certified for operational timekeeping. |
| 46 | [`hybrid-optical-rf`](#hybrid-optical-rf) | MODELLED heterogeneous optical + RF PNT joint figure of merit (P5): composes the 1550 nm two-way optical link budget (photon-limited two-way ranging CRLB σ_τ/√N and diffraction footprint λ/D·range), a cross-modality solution-separation RAIM protection level (position AND timing) that fuses the loose RF and tight optical solutions with disparate covariances, the N-station optical clear-sky availability (independent-union 1−Π(1−a_i) and a spatially-correlated variant), an optical↔RF state/covariance handoff with a PROVEN bit-continuous (no-jump) mean and a NEES χ² consistency gate, and a joint P(available AND precision-grade AND integrity-assured) score with correlation handling. VALIDATED closed form: the ranging CRLB, diffraction footprint, χ² protection-level quantile, union combinatorics, handoff mean-continuity + NEES gate, and the joint independent product. MODELLED: the optical loss allocations, RF/optical σ magnitudes, cloud-climatology inputs, correlations, and P_HMI budget. Not a certified availability/integrity product. |
| 47 | [`cislunar-observability`](#cislunar-observability) | MODELLED planar cislunar constellation observability (P6): tracks a four-spacecraft differential-corrected planar-DRO constellation with inter-satellite ranging and reports how much of a spacecraft's four-state [x,y,ẋ,ẏ] the arc makes observable. Emits (1) the rank-vs-arc-length table for a single range-only link — instantaneously rank-1, growing toward the full four-state as the arc extends (P6 Table 1); (2) the observability-Gramian eigen-spectrum + condition number over the arc; (3) the range-only-vs-range+range-rate instantaneous-rank comparison (the Doppler design lever) plus the range-only-singular / range+rate-defined GDOP reporting; and (4) an independent SRIF cross-validation whose posterior covariance turns finite / well-conditioned exactly at the arc where the observable rank reaches four. VALIDATED core: the observable rank is a rank-revealing singular-value threshold cross-checked against the Gramian eigen-rank; the eigen-spectrum obeys the spectral invariants (trace=Σλ, det=Πλ, Frobenius²=Σλ²); the variational STM is the finite-difference-validated CR3BP STM; the range/range-rate Jacobian rows are finite-difference-validated analytic partials (cross-checked against the crate's 3-D range-rate observable); the four initial conditions are differential-corrected planar DROs that close to a tight periodicity residual and are retrograde; the rank transition is cross-validated against the crate's square-root information filter (posterior covariance finite exactly at full rank, cond(P)=cond(OᵀO)); a rank-deficient snapshot is flagged GDOP-undefined (fim condition=inf), never a bogus finite value — the same singular-geometry guard pvt::solve_spp applies. MODELLED: the constellation design (DRO perilune amplitudes and phases) and the specific rank progression it produces. Not a certified navigation-performance product. |
| 48 | [`conflict-resilience`](#conflict-resilience) | MODELLED layered-PNT conflict resilience (P7): a contested-environment user fields several PNT layers (open-service GNSS, wideband GNSS, an authenticated constellation, an augmentation relay), each with a base availability, a 1σ accuracy and a per-vector denial vulnerability to the shared jamming/spoofing threat. An intensity-swept SEEDED Monte-Carlo denies each layer with probability clamp(vulnerability·intensity·vector_weight,0,1), fuses the survivors by the closed-form inverse-variance rule σ_fused=(Σ 1/σ_i²)^(−1/2), and reports the total-loss probability (all layers denied), the median fused error and per-layer usable/denial statistics vs intensity. The headline resilience ratio (single-layer vs layered total-loss probability) lands at ~7x under the INDEPENDENCE assumption; a one-factor Gaussian-copula correlated-denial sweep then shows that ~7x collapse toward 1 as denial correlation rises (correlation defeats layering). A prior-sensitivity block ranges the headline over the SOURCED vulnerability priors via the mcda tornado + a Dirichlet threat-effort re-allocation + percentile CIs. VALIDATED core: the Monte-Carlo total-loss converges to the closed-form independent product Π_i p_deny_i (within MC standard error at a fixed seed and large N); the inverse-variance fuse is a closed-form identity; at ρ=0 the copula reduces to the independent model and every ρ preserves each layer's marginal denial rate. MODELLED: the per-layer vulnerability/availability/accuracy magnitudes are sourced-but-Modelled inputs (JammerTest 2024, TEXBAT, EASA SIB, RTCA DO-229, LunaNet/IOAG — see conflict_threat_params), and the specific ~7x magnitude and the ratio-vs-correlation curve shape follow from that parameterisation. A §4.2 per-vector survival breakdown then resolves the shared RF threat into the four named vectors (jamming/spoofing/kinetic/cyber) and reports each vector's usable-PNT graceful-degradation curve S_v(x)=1-Prod_i(1-a_i(1-clamp(susceptibility_i,v·x,0,1))) — VALIDATED: the seeded per-layer Monte-Carlo converges to that closed form; jamming is the sharpest vector for the correlated-RF baseline and the RF-immune inertial layer is the decisive survivor. Not a certified navigation-availability product. |
| 49 | [`lunar-attack-surface`](#lunar-attack-surface) | Lunar surface-navigation signal-security attack surface (P1): composes the open signal-security analyses into one binary-reachable run. Reports (1) the AFS received power and its power deficit versus a terrestrial GPS reference, plus the 12-18 dB sensitivity band as a genuine multi-axis sweep over the link inputs (reference level x EIRP x slant range) with the 32x-rounded / 36x-unrounded linear-factor reconciliation; (2) the required attacker transmit power to spoof (J/S = 3 dB) and to deny (J/S = 30 dB) at each standoff, the inverse of the J/S link; (3) the orbital capture footprint under a real uniform-aperture antenna pattern (Airy [2 J1(x)/x]^2), an altitude-limited sub-hemispheric cap whose limb is NOT captured; (4) a computed tracking-loop spoof-capture pull-in outcome (does a matched-code spoofer at a given power advantage and code offset actually drag the DLL/PLL) rather than the asserted 3 dB threshold; (5) the airless-body geometric horizon reach of a raised surface transmitter; and (6) the OSNMA/TESLA authentication budget (20 bit/s overhead = ~40 % of a 50 bit/s AFS nav message, key-disclosure latency, 2^-40 forgery). An empty body reproduces the P1 baseline; every input is defaulted and overridable. VALIDATED sub-results carry their source module's oracle (closed-form dB radiometry; inverse-J/S round trip; Airy pattern vs A&S Bessel and spherical-cap geometry; DLL/PLL pull-in vs Kaplan & Hegarty; spherical-tangent horizon identity vs eo_payload; OSNMA SIS-ICD field sizing). MODELLED: the representative geometry/power magnitudes and the specific capture-map cell values. Not a certified security product. |
| 50 | [`realtime-frame-eop`](#realtime-frame-eop) | Real-time lunar frame / Earth-orientation prediction budget: P4 Table 1 (the frame-error consistency check — post-processed ~0.27 m ↔ ~0.010 ms and real-time ~15 m ↔ ~0.5 ms, each frame position expressed as its equivalent UT1 error via the L19 lever arm Δr = D_EM·ω⊕·ΔUT1) and Table 2 (measured UT1 prediction error vs horizon — the L18 curve read directly off the real IERS finals2000A series: the Bulletin A − Bulletin B final floor and the multi-day persistence-predictor error, each mapped to a Moon-frame position by L19), plus the L21 root-sum-square real-time frame-error budget (EOP + ephemeris + realisation floor). VALIDATED closed form (the L19 lever arm, ω⊕ cross-checked against the CIO Earth-rotation angle) and VALIDATED real data (the L18 curve off the real finals2000A rows); MODELLED are the lunar-relay OD covariance magnitudes and frame-realisation floor (representative allocations) and the persistence predictor (not IERS's operational Bulletin A algorithm). Not a certified real-time frame product. |

## `clock`

Clock holdover vs spec; optional Monte-Carlo ensemble (runs > 1).

- **Required fields:** `threshold_ns`, `time`, `gnss`, `clock_quantum`, `clock_classical`
- **Optional fields:** `seed`, `runs`

## `inertial`

1-DOF inertial dead-reckoning during a GNSS outage.

- **Required fields:** `threshold_m`, `time`, `gnss`, `accel_quantum`, `accel_classical`
- **Optional fields:** `seed`, `runs`

## `orbit`

GNSS availability + DOP from an orbital constellation (Walker / TLE / RINEX).

- **Required fields:** `threshold_ns`, `time`, `user`, `constellation`, `clock_quantum`, `clock_classical`
- **Optional fields:** `mask_deg`, `sigma_uere_m`, `seed`

## `ephemeris`

Ephemeris & ground track: propagate one satellite (TLE→SGP4 or analytic orbit) and emit its TEME/GCRS state (position + velocity), ITRF/ECEF position, WGS-84 sub-satellite lat/lon/alt, and per-step station az/el/range + range-rate (Doppler).

- **Required fields:** *(none)*
- **Optional fields:** `tle`, `orbit`, `epoch`, `step_s`, `duration_s`, `station`, `dut1_s`, `xp_arcsec`, `yp_arcsec`, `carrier_hz`, `eop_finals2000a`

## `integrity`

Snapshot / solution-separation / ARAIM RAIM with HPL/VPL and a Stanford diagram.

- **Required fields:** `time`, `user`, `constellation`
- **Optional fields:** `mask_deg`, `sigma_uere_m`, `p_fa`, `p_md`

## `lunar-integrity`

Lunar south-pole ARAIM protection-level pass vs a representative LunaNet relay set.

- **Required fields:** *(none)*
- **Optional fields:** `step_s`, `duration_s`, `alert_limit_m`, `p_hmi`

## `lunar-time-offset`

Modelled relativistic Earth–Moon clock rate (Lunar Coordinate Time, LTC/TCL): the secular LTC−TT rate from the self-potential difference and the Moon's kinetic term, reported with the published 56–59 µs/day band, plus the accumulated offset over a horizon.

- **Required fields:** *(none)*
- **Optional fields:** `epoch_year`, `epoch_month`, `epoch_day`, `horizon_days`

## `lunar-vlbi`

Modelled lunar geodetic VLBI delay observable: an Earth baseline (two ground stations, GCRS) observes a one-way signal from a NovaMoon-class lunar-surface beacon. Emits the near-field two-range-difference delay, its rate, and the wavefront-curvature near-field correction over a pass — cross-checked against the same-codebase plane-wave Δ-DOR observable in the far-field limit, with finite-difference-verified partials. MODELLED, NOT validated against real VLBI data; carries the frame-consistency, xp=yp=0 polar-motion and plane-wave-vs-near-field caveats.

- **Required fields:** *(none)*
- **Optional fields:** `station1_lat_deg`, `station1_lon_deg`, `station1_alt_m`, `station2_lat_deg`, `station2_lon_deg`, `station2_alt_m`, `beacon_lat_deg`, `beacon_lon_deg`, `beacon_alt_m`, `epoch_year`, `epoch_month`, `epoch_day`, `horizon_hours`, `step_min`

## `lunar-joint-od-clock`

Modelled joint multi-technique lunar OD + clock batch estimator on a SIMULATED network: a Gauss-Newton snapshot fit that fuses Earth-baseline geodetic VLBI delays, lunar-local station↔satellite ranges and inter-satellite ranges to recover, together, a lunar surface station's 3-D position, a small constellation's positions and every asset's clock offset from an injected truth. The headline honest result — VLBI makes the station's full 3-D position observable where lunar-local ranging alone leaves a weakly-observed direction — is reported as the with-vs-without-VLBI station-error contrast. MODELLED simulated closed-loop recovery (truth shares the observation model), deterministic (seeded), NOT real-data validated; no force-model propagation inside the solver; no TRL/heritage/agency endorsement.

- **Required fields:** *(none)*
- **Optional fields:** `n_sat`, `n_earth`, `seed`, `sigma_vlbi_s`, `sigma_range_m`, `sigma_isl_m`, `station_lat_deg`, `station_lon_deg`, `station_alt_m`, `orbit_radius_km`, `epoch_year`, `epoch_month`, `epoch_day`

## `lunar-frame-realisation`

Modelled lunar reference-frame realisation: a 7-parameter Helmert (similarity) datum fit — 3 translation, 3 small-angle rotation, 1 scale — tying an estimated set of selenographic-derived MCMF point coordinates to a datum by weighted least squares (crate::batch_ls::gauss_newton), plus a simple orientation tie expressing the realised small rotation about the ICRF axes relative to the IAU 2015 WGCCRE body orientation. The scenario injects a known small transform (translation ~tens of m, rotation ~µrad, scale ~1e-7) into a well-spread synthetic point network, adds seeded Gaussian noise, recovers the datum, and reports the recovered transform, the per-parameter recovery error vs the injected truth, and the post-fit RMS residual. MODELLED self-consistency — recovers an injected similarity transform (noiseless to ~machine precision), NOT a realisation against real tracking/VLBI data; deterministic (seeded); no TRL/heritage/agency endorsement.

- **Required fields:** *(none)*
- **Optional fields:** `n_points`, `tx_m`, `ty_m`, `tz_m`, `rot_x_urad`, `rot_y_urad`, `rot_z_urad`, `scale_ppb`, `noise_sigma_m`, `seed`, `epoch_year`, `epoch_month`, `epoch_day`

## `moonlight-service-volume`

Modelled lunar navigation service-volume analysis from an ILLUSTRATIVE, public-source Moonlight/LCNS-class lunar-orbit constellation (not affiliated with ESA): sweeps a selenographic lat/lon grid over a time horizon and reports DOP / coverage / availability (≥4 sats AND PDOP < threshold) plus a generalised lunar ARAIM protection-level (HPL/VPL) envelope over the volume. The DOP geometry REUSES the gnss_lib_py-VALIDATED kernel (crate::orbit::dop); the protection level REUSES the LunaNet LNIS lunar ARAIM machinery (crate::lunar, σ_URE≈30 m) and reduces to the existing south-pole PL as a special case. MODELLED composition: a circular-/elliptical-Keplerian relay set (not the real differential-corrected LCNS/NRHO ephemeris), a mean-rotation Moon (no libration/precessing pole). Deterministic (pure geometry). No TRL/heritage/agency endorsement.

- **Required fields:** *(none)*
- **Optional fields:** `n_sats`, `sma_km`, `eccentricity`, `inc_deg`, `argp_deg`, `lat_min_deg`, `lat_max_deg`, `lat_step_deg`, `lon_min_deg`, `lon_max_deg`, `lon_step_deg`, `horizon_hours`, `step_min`, `elev_mask_deg`, `pdop_threshold`, `alert_limit_m`, `p_hmi`, `perturbed`

## `lunar-differential-pnt`

Modelled lunar DIFFERENTIAL PNT (a lunar DGNSS/SBAS analogue): a NovaMoon-class reference station at a KNOWN selenographic location computes per-satellite differential corrections from an ILLUSTRATIVE, public-source Moonlight/LCNS-class constellation (NovaMoon referenced only as a system CLASS, not affiliated with ESA), and a user offset by baseline_km applies them so the COMMON-MODE orbit + clock errors cancel. The clock term cancels EXACTLY (an algebraic identity); the orbit term leaves only the line-of-sight-difference projection, which → 0 as baseline → 0 (the spatial-decorrelation floor) and grows ≈ linearly with baseline. Reports the user 3-D position error WITH vs WITHOUT corrections, the reduction factor, the error-vs-baseline curve, and a user protection level that REUSES the DO-229E SBAS machinery (crate::sbas) with the differential residual σ. MODELLED — exact cancellation identity + first-order decorrelation model; not real-data validated; no TRL/heritage/agency endorsement. Deterministic if seeded.

- **Required fields:** *(none)*
- **Optional fields:** `n_sats`, `sma_km`, `eccentricity`, `inc_deg`, `argp_deg`, `ref_lat_deg`, `ref_lon_deg`, `baseline_km`, `orbit_err_m`, `clock_err_m`, `noise_m`, `seed`, `t_s`, `residual_sigma_m`, `p_hmi`

## `lunar-interop-export`

Modelled lunar interoperability export: emits the lunar reference frame, lunar time scale and lunar ephemeris in LunaNet/IOAG-aligned, CCSDS-based interchange forms with round-trip / field conformance. REUSES the crate's CCSDS OEM 2.0 emitter+parser (crate::oem) re-tagged for the lunar context — the OEM REF_FRAME carries the IAU 2015 WGCCRE lunar body frame (MOON_ME / MOON_PA), TIME_SYSTEM the lunar time scale (LTC / TCL / UTC), CENTER_NAME = MOON — over a sample illustrative LCNS-class ephemeris (positions from crate::lunar_service, velocity by finite difference). Also emits a LunaNet/IOAG-aligned lunar-time descriptor (scale id, secular rate µs/day from crate::lunar_time, published band, reference surface) that round-trips via serde_json, and wraps the artifacts in the existing KIF envelope (crate::interchange) with the MODELLED honesty label. Reports artifacts emitted, OEM line count, field-conformance pass + present/missing field list, OEM round-trip ok, time-metadata round-trip ok, and KIF byte size. MODELLED — deterministic round-trip + field-name conformance vs published CCSDS OEM + LunaNet/IOAG field semantics is the oracle; NOT a certified interoperability conformance test; illustrative public-source ephemeris, not affiliated with ESA; no TRL/heritage/agency endorsement.

- **Required fields:** *(none)*
- **Optional fields:** `frame`, `time_system`, `n_states`, `epoch`, `step_min`, `object`

## `timetransfer`

Optical vs RF two-way time/frequency transfer.

- **Required fields:** `time`, `optical`, `rf`
- **Optional fields:** `seed`

## `quantum-anomaly-detect`

MODELLED fault/anomaly detection for quantum PNT systems: a labelled fault catalog (clock frequency-jump/drift/lock-loss; sensor bias-step/dropout), a detection-statistic ROC AUC (with a bootstrap CI from the externally-validated eval_stats) and a minimum-detectable-fault at a fixed false-alarm rate, with the quantum-clock-aided monitor (lower noise) detecting smaller faults — as honest TradeEvidence + representativeness. Gaussian detection-statistic model (AUC = Phi(mu/(sigma*sqrt2))); models the class, illustrative public-source params, no TRL/flight/certification.

- **Required fields:** *(none)*
- **Optional fields:** `fault_mu`, `quantum_sigma`, `classical_sigma`, `pfa`, `pd`, `samples`, `seed`

## `quantum-gnss-free-nav`

MODELLED GNSS-free quantum navigation: during a GNSS outage, a quantum (cold-atom interferometer) inertial budget vs a classical navigation-grade INS — position-error growth over the coast, holdover to a position threshold, and the quantum-vs-classical trade as honest TradeEvidence with representativeness. Honest observability note: with no external fix the accelerometer bias is unobservable so the error grows; the quantum sensor slows but does not close that gap. Illustrative public-source device params; models the class, no TRL/flight/certification.

- **Required fields:** *(none)*
- **Optional fields:** `outage_s`, `threshold_m`, `quantum_bias_m_s2`, `classical_bias_m_s2`

## `quantum-time-transfer`

MODELLED trusted-quantum-timing chain: an end-to-end quantum (optical-lattice clock + entanglement/single-photon link) vs classical (CSAC + RF two-way) time-transfer budget, a reused timing protection level + a delay/replay-attack security FoM (1-P_md), a clock-anomaly detection probability + CUSUM latency, and the quantum-vs-classical trade as honest TradeEvidence with a representativeness + gaps-to-flight record. Illustrative public-source device/link params; models the class, no TRL/flight/certification claimed.

- **Required fields:** *(none)*
- **Optional fields:** `integration_s`, `dissemination_interval_s`, `link_loss_db`, `classical_link_sigma_s`, `monitor_pfa`, `attack_delay_s`, `clock_fault_sigma`

## `hybrid`

Hybrid PNT capstone: clock + IMU + time-transfer aiding.

- **Required fields:** `timing_spec_ns`, `position_spec_m`, `time`, `gnss`, `clock_quantum`, `clock_classical`, `accel_quantum`, `accel_classical`
- **Optional fields:** `resync`, `seed`

## `fusion`

Joint Kalman sensor-fusion PNT over the same hybrid inputs.

- **Required fields:** `timing_spec_ns`, `position_spec_m`, `time`, `gnss`, `clock_quantum`, `clock_classical`, `accel_quantum`, `accel_classical`
- **Optional fields:** `resync`, `seed`

## `hybrid-ukf`

17-state hybrid quantum+classical tightly-coupled GNSS/INS UKF (MODELLED): 15 INS error states + CAI-derived accel-bias correction + a 2-state (phase+frequency) clock from the q-parameter clock engine, driven by the bracketed CAI error model. The figure of merit is filter self-consistency (NEES + innovation-whiteness vs χ² bounds) — a self-consistency statement, NOT a real-world accuracy guarantee. Simulation only; no TRL>3, no flight heritage, no external validation.

- **Required fields:** `time`, `gnss`, `accel`, `clock`
- **Optional fields:** `seed`, `residual_accel_bias_m_s2`, `speed_m_s`, `sigma_pr_m`, `sigma_rr_mps`, `consistency_seeds`, `q_factor`, `r_factor`

## `gnss-ins`

Loosely- and tightly-coupled GNSS/INS error-state EKF.

- **Required fields:** `time`, `gnss`, `imu_quantum`, `imu_classical`
- **Optional fields:** `seed`, `threshold_m`, `fix_interval_s`, `sigma_pos_m`, `sigma_vel_mps`, `lat_deg`, `lon_deg`, `alt_m`

## `gnss-sim`

Measurement-domain pseudorange simulation (Klobuchar iono, Saastamoinen/Niell tropo) + RAIM.

- **Required fields:** `seed`, `time`, `receiver`, `constellation`
- **Optional fields:** `iono`, `tropo`, `mask_deg`, `noise_sigma_m`, `multipath_m`, `sat_clock_rms_m`, `uere_m`, `p_fa`, `p_md`, `alert_limit_h_m`, `alert_limit_v_m`

## `jamming`

Link-budget jamming: J/S → effective C/N₀ → loss of lock.

- **Required fields:** `seed`, `time`, `receiver`, `constellation`
- **Optional fields:** `jammer`, `mask_deg`, `tracking_threshold_dbhz`, `degraded_margin_db`, `signal_power_dbw`, `temp_k`, `freq_hz`, `chip_rate_hz`

## `spoof`

Stochastic time-spoof detector (Neyman–Pearson / χ²₁) with Monte-Carlo P_fa/P_md.

- **Required fields:** `threshold_ns`, `time`, `attack`, `clock_quantum`, `clock_classical`
- **Optional fields:** *(none)*

## `spoof-detect`

Combined RF/measurement spoof detector (multi-SV RAIM-consistency + AGC + SQM, fused) vs a parameterised attack (power advantage, carrier-phase alignment, time/position push; TEXBAT-style).

- **Required fields:** `attack`
- **Optional fields:** `satellites`, `detector`

## `sweep`

1-D trade-study sweep over a clock-pack parameter.

- **Required fields:** `parameter`, `metric`, `start`, `stop`, `steps`, `base`
- **Optional fields:** `scale`

## `sweep-nd`

Generic N-D sweep over any pack via dotted TOML keys / JSON metric paths.

- **Required fields:** `base`, `axes`, `metrics`
- **Optional fields:** *(none)*

## `gravity-map`

GPS-denied gravity-map-matching navigation: a cold-atom gravimeter recovers a constant INS drift from the gravity-anomaly sequence it flies through.

- **Required fields:** `nmax`, `start_lat_deg`, `start_lon_deg`, `step_lat_deg`, `step_lon_deg`, `waypoints`, `drift_lat_deg`, `drift_lon_deg`, `gravimeter_asd`, `averaging_time_s`, `map_sigma_mgal`, `search_half_deg`, `search_step_deg`
- **Optional fields:** `coeffs`, `mascons`, `refine_stages`, `refine_factor`, `noise_seed`

## `terrain-nav`

GPS-denied terrain-referenced navigation (TERCOM/SITAN): a radar/baro altimeter matches the ground-elevation profile against an SRTM-style DEM to recover the INS drift.

- **Required fields:** `dem_seed`, `start_lat_deg`, `start_lon_deg`, `step_lat_deg`, `step_lon_deg`, `waypoints`, `drift_lat_deg`, `drift_lon_deg`, `altimeter_sigma_m`, `map_sigma_m`, `search_half_deg`, `search_step_deg`
- **Optional fields:** `refine_stages`, `refine_factor`, `noise_seed`

## `terrain-slam`

GPS-denied sequential (recursive) terrain-referenced navigation: a particle filter runs the terrain-match measurement model epoch by epoch (SITAN as a running filter) so a time-varying INS drift is tracked along the track, where the batch terrain-nav only recovers a single constant offset.

- **Required fields:** `dem_seed`, `start_lat_deg`, `start_lon_deg`, `step_lat_deg`, `step_lon_deg`, `waypoints`, `drift_rate_lat_deg`, `drift_rate_lon_deg`, `altimeter_sigma_m`, `map_sigma_m`
- **Optional fields:** `n_particles`, `init_pos_sigma_deg`, `process_sigma_deg`, `resample_ess_frac`, `seed`

## `combined-altpnt`

GPS-denied combined gravity + magnetic + terrain navigator: three scalar field channels fused per waypoint for a sharper (lower-CRLB) drift fix than any single field.

- **Required fields:** `start_lat_deg`, `start_lon_deg`, `step_lat_deg`, `step_lon_deg`, `waypoints`, `drift_lat_deg`, `drift_lon_deg`, `search_half_deg`, `search_step_deg`, `nmax`, `gravity_sigma_mgal`, `igrf_year`, `magnetic_sigma_nt`, `dem_seed`, `terrain_sigma_m`
- **Optional fields:** `coeffs`, `mascons`, `magnetic_mascons`, `igrf_alt_km`, `refine_stages`, `refine_factor`, `noise_seed`

## `pvt`

Real-observation single-point positioning: solve a receiver's position from a RINEX 3 observation file and a broadcast-navigation file (code pseudoranges, broadcast ephemeris, Klobuchar iono, Saastamoinen/Niell tropo), optionally validated against a surveyed coordinate.

- **Required fields:** `obs_rinex`, `nav_rinex`
- **Optional fields:** `truth_ecef`, `apriori_ecef`, `mask_deg`

## `mars-pnt`

Deep-space Mars PNT: a simulated MARCONI relay constellation (areostationary + inclined relays broadcasting one-way + relaying two-way to a deep-space station) navigates a reference user (transfer | lmo | surface) through the joint one-way/two-way radiometric fusion estimator. Reports per-epoch geometry/visibility, achieved RMS vs truth, and the formal covariance (1σ / 3σ position) — an honest simulated FoM, NOT a certified protection level.

- **Required fields:** *(none)*
- **Optional fields:** `user`, `clock_class`, `step_s`, `duration_s`, `nmax`, `range_sigma_m`, `doppler_sigma_mps`, `dynamic_tightness`, `two_way_period_s`, `seed`

## `impairment-eval`

AI/ML RF-impairment detection evaluation testbed (13494): generate a labelled, parameter-grounded SYNTHETIC corpus (nominal/jamming/spoof-time/spoof-position/multipath), score a detector (energy|agc|sqm|parity|fused) with the detector-agnostic harness, and report AUC/ROC/confusion + per-class Pd at a target Pfa, plus the in- vs out-of-distribution optimism gap. MODELLED operating characteristics only — never field/IQ, no good/bad verdict.

- **Required fields:** *(none)*
- **Optional fields:** `seed`, `n_per_class`, `nominal_cn0_dbhz`, `meas_noise`, `detector`, `target_pfa`, `shift_severity_scale`, `optimism_tol`

## `quantum-trade`

Quantum-vs-classical PNT trade (13503): timing-holdover + inertial-holdover benefit of a candidate clock (a measured-ADEV curve — the defensibility hinge — or a quantum clock class) vs a classical baseline class, with the long-tau floor-assumption caveat carried on the artifact, plus a GNSS-denied resilience-vs-time envelope. MODELLED; quantifies (never validates) a partner device.

- **Required fields:** `timing_threshold_s`, `position_threshold_m`, `baseline_clock_class`
- **Optional fields:** `candidate_clock_class`, `candidate_adev_taus`, `candidate_adev_values`, `baseline_ins`, `candidate_ins`, `resilience_times_s`, `alt_pnt_bound_m`

## `space-weather`

Space-weather environment model: solar (F10.7/F10.7a) and geomagnetic (Kp, with the definitional Kp↔ap table) activity indices, the Jacchia-1971 exospheric temperature they drive (validated vs published solar-min/mean/max), and the activity-corrected vs static thermospheric neutral density at a set of altitudes — the solar-cycle density dependence the static USSA76 atmosphere omits. MODELLED: the density correction is a calibrated first-order scale-height coupling, NOT a data-validated (NRLMSISE) atmosphere.

- **Required fields:** *(none)*
- **Optional fields:** `f107`, `f107a`, `kp`, `altitudes_km`

## `oem-interop`

CCSDS OEM interoperability bridge: import an Orbit Ephemeris Message produced by an external flight-dynamics tool (GMAT/Orekit/STK all emit OEM) and report its segments/objects/frames/epoch-span plus a velocity-consistency check; with no input it round-trips a generated reference orbit and reports the import↔export fidelity. MODELLED structural/physical ingest check, NOT an orbit-accuracy validation of the source.

- **Required fields:** *(none)*
- **Optional fields:** `oem_text`

## `launch-window`

Two-body launch & ascent geometry: launch azimuth(s) (sin Az = cos i / cos lat), minimum reachable inclination, circular velocity, the Earth-rotation eastward bonus, dogleg plane-change Δv when the target inclination is below the site latitude, and the number of daily launch opportunities. MODELLED spherical-Earth geometry (no rotating-Earth velocity-triangle correction, no ascent/drag-loss model).

- **Required fields:** *(none)*
- **Optional fields:** `site_lat_deg`, `target_inclination_deg`, `altitude_km`

## `reentry`

Allen-Eggers ballistic re-entry corridor: peak deceleration (ballistic-coefficient-independent, V_e^2 sin|γ|/(2eH)), the velocity and altitude at peak-g, and the peak-heating velocity, for an entry velocity/flight-path-angle/ballistic-coefficient through an exponential atmosphere. MODELLED ballistic (no-lift) analytic entry; heating output is the peak-heating VELOCITY, not a heat-flux (no aerothermal/TPS model).

- **Required fields:** *(none)*
- **Optional fields:** `entry_velocity_m_s`, `flight_path_angle_deg`, `ballistic_coeff_kg_m2`, `scale_height_m`, `rho0_kg_m3`

## `eo-coverage`

Earth-observation payload footprint & coverage geometry (SMAD space triangle): Earth angular radius, swath width, nadir ground sample distance, maximum off-nadir access, circular period and equatorial ground-track spacing with a contiguous-coverage flag, for an orbit altitude + sensor FOV/IFOV. MODELLED spherical-Earth geometry (no radiometry/MTF/atmosphere/jitter/glint; nodal R_e·ω·T spacing, no J2 regression).

- **Required fields:** *(none)*
- **Optional fields:** `altitude_km`, `half_fov_deg`, `ifov_microrad`, `max_off_nadir_deg`

## `space-packet`

CCSDS 133.0-B Space Packet Protocol framing: encode a synthetic TM/TC packet stream (6-octet primary header + data field) and report the per-packet header decode, total octets and an exact encode↔decode round trip. Deterministic exact bit-layout framing — the agency packet-format interop layer; NOT a conformance certification (no secondary-header/CRC/segmentation logic beyond the flags).

- **Required fields:** *(none)*
- **Optional fields:** `apid`, `telecommand`, `packet_count`, `data_len`

## `attitude-budget`

3-DOF attitude & pointing error budget: the worst-case gravity-gradient disturbance torque ((3/2)(μ/R³)ΔI) and a root-sum-square pointing-error budget over named 1σ contributors (sensor noise, reaction-wheel jitter, thermal, alignment) with the dominant term, for an orbit altitude + body inertia spread. MODELLED scalar AOCS budget — a pre-hardware complement to Basilisk/42, not a control-loop/6-DoF/flexible-mode simulation.

- **Required fields:** *(none)*
- **Optional fields:** `altitude_km`, `i_max_kg_m2`, `i_min_kg_m2`, `contributors`

## `passes`

Ground-station pass prediction: the time-domain visibility passes (AOS/TCA/LOS, maximum elevation, duration) of a circular orbit over a station above an elevation mask across a window, with interpolated rise/set crossings and total access time. MODELLED Keplerian propagation + Earth rotation (no SGP4 drag/J2 regression), TCA at the sample-step resolution, no light-time/refraction correction.

- **Required fields:** *(none)*
- **Optional fields:** `altitude_km`, `inclination_deg`, `raan_deg`, `arg_lat_deg`, `station_lat_deg`, `station_lon_deg`, `station_alt_m`, `epoch`, `mask_deg`, `duration_hours`, `step_s`

## `link-budget`

One-way link budget over the CCSDS 401 / DSN 810-005 link equation: free-space path loss, C/N₀, Eb/N₀, margin and closure for a transmit EIRP, receive G/T, range, data rate and band (s|x|ka) against a required Eb/N₀. A deterministic engineering calculation from the supplied inputs (not a calibrated terminal datasheet).

- **Required fields:** *(none)*
- **Optional fields:** `band`, `eirp_dbw`, `g_over_t_db`, `range_km`, `data_rate_bps`, `other_losses_db`, `required_eb_n0_db`

## `lunar-time-budget`

MODELLED end-to-end Coordinated Lunar Time (LTC) time-error budget: the seven LTC error terms assembled as time-error curves x_i(τ) over a whole averaging-time grid, root-summed into x_Σ(τ), and the clock-vs-frame CROSSOVER τ at which the growing clock term overtakes the constant real-time frame-realisation term (below it the budget is frame-limited, above it clock-limited) — the honest answer to the single-τ artifact. The τ-slopes are closed-form and analytically checkable (clock τ^{+1/2}/τ^{+1}, floors τ^0, measurement τ^{-1/2}) and the clock rows reproduce the published one-day clock specs (crate::clock_specs); the RF/optical-link, frame-realisation, relativistic-residual and ephemeris floor MAGNITUDES are Modelled budget allocations (documented defaults, caller-overridable), not measurements. The contribution is the reproducible crossover τ, not a certified per-term number; not certified for operational timekeeping.

- **Required fields:** *(none)*
- **Optional fields:** `clock`, `tau_min_s`, `tau_max_s`, `points_per_decade`

## `hybrid-optical-rf`

MODELLED heterogeneous optical + RF PNT joint figure of merit (P5): composes the 1550 nm two-way optical link budget (photon-limited two-way ranging CRLB σ_τ/√N and diffraction footprint λ/D·range), a cross-modality solution-separation RAIM protection level (position AND timing) that fuses the loose RF and tight optical solutions with disparate covariances, the N-station optical clear-sky availability (independent-union 1−Π(1−a_i) and a spatially-correlated variant), an optical↔RF state/covariance handoff with a PROVEN bit-continuous (no-jump) mean and a NEES χ² consistency gate, and a joint P(available AND precision-grade AND integrity-assured) score with correlation handling. VALIDATED closed form: the ranging CRLB, diffraction footprint, χ² protection-level quantile, union combinatorics, handoff mean-continuity + NEES gate, and the joint independent product. MODELLED: the optical loss allocations, RF/optical σ magnitudes, cloud-climatology inputs, correlations, and P_HMI budget. Not a certified availability/integrity product.

- **Required fields:** *(none)*
- **Optional fields:** `wavelength_nm`, `tx_power_w`, `tx_aperture_m`, `rx_aperture_m`, `range_km`, `pulse_rms_ps`, `integration_s`, `atmospheric_loss_db`, `pointing_loss_db`, `optics_efficiency`, `detector_efficiency`, `two_way`, `rf_pos_sigma_m`, `rf_vertical_sigma_m`, `rf_clock_sigma_s`, `p_fa`, `p_md`, `alert_limit_h_m`, `alert_limit_v_m`, `alert_limit_t_s`, `grade_pos_m`, `grade_time_s`, `n_optical_sites`, `site_correlation`, `fom_correlation`, `handoff_inflation`, `p_hmi`

## `cislunar-observability`

MODELLED planar cislunar constellation observability (P6): tracks a four-spacecraft differential-corrected planar-DRO constellation with inter-satellite ranging and reports how much of a spacecraft's four-state [x,y,ẋ,ẏ] the arc makes observable. Emits (1) the rank-vs-arc-length table for a single range-only link — instantaneously rank-1, growing toward the full four-state as the arc extends (P6 Table 1); (2) the observability-Gramian eigen-spectrum + condition number over the arc; (3) the range-only-vs-range+range-rate instantaneous-rank comparison (the Doppler design lever) plus the range-only-singular / range+rate-defined GDOP reporting; and (4) an independent SRIF cross-validation whose posterior covariance turns finite / well-conditioned exactly at the arc where the observable rank reaches four. VALIDATED core: the observable rank is a rank-revealing singular-value threshold cross-checked against the Gramian eigen-rank; the eigen-spectrum obeys the spectral invariants (trace=Σλ, det=Πλ, Frobenius²=Σλ²); the variational STM is the finite-difference-validated CR3BP STM; the range/range-rate Jacobian rows are finite-difference-validated analytic partials (cross-checked against the crate's 3-D range-rate observable); the four initial conditions are differential-corrected planar DROs that close to a tight periodicity residual and are retrograde; the rank transition is cross-validated against the crate's square-root information filter (posterior covariance finite exactly at full rank, cond(P)=cond(OᵀO)); a rank-deficient snapshot is flagged GDOP-undefined (fim condition=inf), never a bogus finite value — the same singular-geometry guard pvt::solve_spp applies. MODELLED: the constellation design (DRO perilune amplitudes and phases) and the specific rank progression it produces. Not a certified navigation-performance product.

- **Required fields:** *(none)*
- **Optional fields:** `mu`, `arc_hours`, `epochs`, `steps`, `rel_tol`

## `conflict-resilience`

MODELLED layered-PNT conflict resilience (P7): a contested-environment user fields several PNT layers (open-service GNSS, wideband GNSS, an authenticated constellation, an augmentation relay), each with a base availability, a 1σ accuracy and a per-vector denial vulnerability to the shared jamming/spoofing threat. An intensity-swept SEEDED Monte-Carlo denies each layer with probability clamp(vulnerability·intensity·vector_weight,0,1), fuses the survivors by the closed-form inverse-variance rule σ_fused=(Σ 1/σ_i²)^(−1/2), and reports the total-loss probability (all layers denied), the median fused error and per-layer usable/denial statistics vs intensity. The headline resilience ratio (single-layer vs layered total-loss probability) lands at ~7x under the INDEPENDENCE assumption; a one-factor Gaussian-copula correlated-denial sweep then shows that ~7x collapse toward 1 as denial correlation rises (correlation defeats layering). A prior-sensitivity block ranges the headline over the SOURCED vulnerability priors via the mcda tornado + a Dirichlet threat-effort re-allocation + percentile CIs. VALIDATED core: the Monte-Carlo total-loss converges to the closed-form independent product Π_i p_deny_i (within MC standard error at a fixed seed and large N); the inverse-variance fuse is a closed-form identity; at ρ=0 the copula reduces to the independent model and every ρ preserves each layer's marginal denial rate. MODELLED: the per-layer vulnerability/availability/accuracy magnitudes are sourced-but-Modelled inputs (JammerTest 2024, TEXBAT, EASA SIB, RTCA DO-229, LunaNet/IOAG — see conflict_threat_params), and the specific ~7x magnitude and the ratio-vs-correlation curve shape follow from that parameterisation. A §4.2 per-vector survival breakdown then resolves the shared RF threat into the four named vectors (jamming/spoofing/kinetic/cyber) and reports each vector's usable-PNT graceful-degradation curve S_v(x)=1-Prod_i(1-a_i(1-clamp(susceptibility_i,v·x,0,1))) — VALIDATED: the seeded per-layer Monte-Carlo converges to that closed form; jamming is the sharpest vector for the correlated-RF baseline and the RF-immune inertial layer is the decisive survivor. Not a certified navigation-availability product.

- **Required fields:** *(none)*
- **Optional fields:** `layers`, `intensity`, `correlation`, `trials`, `seed`, `primary_layer`

## `lunar-attack-surface`

Lunar surface-navigation signal-security attack surface (P1): composes the open signal-security analyses into one binary-reachable run. Reports (1) the AFS received power and its power deficit versus a terrestrial GPS reference, plus the 12-18 dB sensitivity band as a genuine multi-axis sweep over the link inputs (reference level x EIRP x slant range) with the 32x-rounded / 36x-unrounded linear-factor reconciliation; (2) the required attacker transmit power to spoof (J/S = 3 dB) and to deny (J/S = 30 dB) at each standoff, the inverse of the J/S link; (3) the orbital capture footprint under a real uniform-aperture antenna pattern (Airy [2 J1(x)/x]^2), an altitude-limited sub-hemispheric cap whose limb is NOT captured; (4) a computed tracking-loop spoof-capture pull-in outcome (does a matched-code spoofer at a given power advantage and code offset actually drag the DLL/PLL) rather than the asserted 3 dB threshold; (5) the airless-body geometric horizon reach of a raised surface transmitter; and (6) the OSNMA/TESLA authentication budget (20 bit/s overhead = ~40 % of a 50 bit/s AFS nav message, key-disclosure latency, 2^-40 forgery). An empty body reproduces the P1 baseline; every input is defaulted and overridable. VALIDATED sub-results carry their source module's oracle (closed-form dB radiometry; inverse-J/S round trip; Airy pattern vs A&S Bessel and spherical-cap geometry; DLL/PLL pull-in vs Kaplan & Hegarty; spherical-tangent horizon identity vs eo_payload; OSNMA SIS-ICD field sizing). MODELLED: the representative geometry/power magnitudes and the specific capture-map cell values. Not a certified security product.

- **Required fields:** *(none)*
- **Optional fields:** `afs_eirp_dbw`, `user_gain_dbi`, `slant_range_m`, `slant_range_max_m`, `carrier_hz`, `gps_reference_dbw`, `gps_reference_min_dbw`, `afs_isotropic_signal_dbw`, `transmitter_altitude_m`, `transmitter_power_dbw`, `antenna_diameter_m`, `footprint_grid`, `spoof_power_advantage_db`, `spoof_code_offset_chips`, `attacker_gain_dbi`, `spoof_capture_js_db`, `jam_denial_js_db`, `standoffs_m`, `mast_height_m`, `user_antenna_height_m`

## `realtime-frame-eop`

Real-time lunar frame / Earth-orientation prediction budget: P4 Table 1 (the frame-error consistency check — post-processed ~0.27 m ↔ ~0.010 ms and real-time ~15 m ↔ ~0.5 ms, each frame position expressed as its equivalent UT1 error via the L19 lever arm Δr = D_EM·ω⊕·ΔUT1) and Table 2 (measured UT1 prediction error vs horizon — the L18 curve read directly off the real IERS finals2000A series: the Bulletin A − Bulletin B final floor and the multi-day persistence-predictor error, each mapped to a Moon-frame position by L19), plus the L21 root-sum-square real-time frame-error budget (EOP + ephemeris + realisation floor). VALIDATED closed form (the L19 lever arm, ω⊕ cross-checked against the CIO Earth-rotation angle) and VALIDATED real data (the L18 curve off the real finals2000A rows); MODELLED are the lunar-relay OD covariance magnitudes and frame-realisation floor (representative allocations) and the persistence predictor (not IERS's operational Bulletin A algorithm). Not a certified real-time frame product.

- **Required fields:** *(none)*
- **Optional fields:** `epoch`, `horizons_days`, `ephemeris_pos_sigma_m`, `ephemeris_vel_sigma_mps`, `latency_s`, `frame_realization_floor_m`, `delta_ut1_ms`, `delta_xp_mas`, `delta_yp_mas`, `eop_finals2000a`

