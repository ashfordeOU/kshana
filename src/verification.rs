// SPDX-License-Identifier: AGPL-3.0-only
//! **Machine-checked verification matrix.**
//!
//! A formal verification cross-reference — *requirement → implementing module →
//! test evidence → validation oracle → status* — is the spine of an
//! ECSS-E-ST-10-02 verification plan, and it is exactly the artifact a feasibility
//! study's system-engineering lead needs to fold a navigation-performance
//! contribution into a project verification control document. Kshana already keeps
//! this discipline in prose (`docs/VALIDATION.md`, `docs/CAPABILITY.md`); this
//! module makes the *status invariants* executable, so the validated/modelled
//! boundary is enforced by unit tests rather than asserted in a document that can
//! drift.
//!
//! **What the tests enforce (and what they do not).** The honesty risk in any such
//! matrix is dressing up a self-consistency check as an external validation. To
//! prevent that, every row carries an [`OracleKind`] tag and the tests enforce:
//!
//! * A [`VerificationStatus::Validated`] row **must** carry an
//!   [`OracleKind::ExternalDataset`] oracle — an independent authoritative dataset,
//!   published verification vectors, or a published numeric value the
//!   implementation is checked against. A row whose only evidence is an internal
//!   algebraic identity or a sibling re-implementation **cannot** be Validated.
//! * A [`VerificationStatus::Modelled`] row implements published or
//!   first-principles physics with tests, and its oracle is honestly one of
//!   external (but loose), a same-codebase [`OracleKind::ReferenceImpl`]
//!   cross-check, or an [`OracleKind::InternalConsistency`] closed-form / algebraic
//!   identity. It is a model, not an external validation.
//! * A [`VerificationStatus::PartnerOwned`] row is a capability Kshana does **not**
//!   provide (spacecraft-bus, RF-payload, quantum-hardware and flight-PA
//!   engineering): no module, no test, no oracle, by design.
//!
//! The tests check the *classification* (a Validated row must be tagged external;
//! a partner row must claim nothing; counts are consistent). They do **not** prove
//! the named test/oracle strings resolve to live code — those are curated
//! references, maintained by hand and cross-checked in code review, exactly as the
//! citations in `docs/VALIDATION.md` are. The "machine-checked" claim is therefore
//! scoped to the status/oracle-kind invariants, not to the existence of every
//! string — stated plainly so the artifact does not oversell itself.

/// How a row's claim is actually backed — the distinction that separates an
/// external validation from a self-consistency check.
#[derive(Clone, Copy, Debug, PartialEq, Eq, serde::Serialize)]
pub enum OracleKind {
    /// Independent authoritative dataset, published verification vectors, or a
    /// published numeric value the implementation is checked against.
    ExternalDataset,
    /// A separate implementation in this same codebase (a different algorithm /
    /// code path), used as a cross-check. Independent of the unit under test but
    /// not externally authoritative.
    ReferenceImpl,
    /// An internal closed-form / algebraic identity or self-consistency check
    /// (e.g. a numeric integral vs its own analytic form). Catches transcription
    /// and coefficient errors; is **not** an external validation.
    InternalConsistency,
    /// No oracle — a partner-owned gap with no implementation.
    NoneKind,
}

/// Verification status of a capability row, with the evidence each level requires.
#[derive(Clone, Copy, Debug, PartialEq, Eq, serde::Serialize)]
pub enum VerificationStatus {
    /// Checked against an independent **external** oracle (dataset / published
    /// vectors / published value). Requires [`OracleKind::ExternalDataset`].
    Validated,
    /// Implemented from published or first-principles physics, with tests, but not
    /// checked against an external oracle to a stated tolerance.
    Modelled,
    /// Not provided by Kshana — a consortium partner's discipline. No code, by design.
    PartnerOwned,
}

impl VerificationStatus {
    /// Short tag for the rendered matrix.
    pub fn tag(self) -> &'static str {
        match self {
            VerificationStatus::Validated => "VALIDATED",
            VerificationStatus::Modelled => "MODELLED",
            VerificationStatus::PartnerOwned => "PARTNER",
        }
    }
}

/// One row of the verification matrix.
#[derive(Clone, Copy, Debug, serde::Serialize)]
pub struct VerificationItem {
    /// The tender-facing requirement / capability area.
    pub requirement: &'static str,
    /// What Kshana does for it (one line).
    pub capability: &'static str,
    /// Implementing crate path(s); empty for a partner-owned gap.
    pub module: &'static str,
    /// Representative test evidence; empty for a partner-owned gap.
    pub tests: &'static str,
    /// Validation oracle (free text); empty if none.
    pub oracle: &'static str,
    /// How the oracle actually backs the claim — the honesty discriminator.
    pub oracle_kind: OracleKind,
    /// Honest verification status.
    pub status: VerificationStatus,
}

/// The curated verification matrix: each PNT-resilience capability mapped to its
/// implementing module, test evidence, oracle (with its honest [`OracleKind`]) and
/// status — plus the partner-owned gaps. The unit tests enforce the per-status
/// evidence invariants, so a self-referential oracle cannot be labelled Validated.
pub fn verification_matrix() -> Vec<VerificationItem> {
    use OracleKind::*;
    use VerificationStatus::*;
    vec![
        // ── Externally validated core ─────────────────────────────────────────
        VerificationItem {
            requirement: "Frequency stability characterisation",
            capability: "Allan/modified/Hadamard deviation + power-law noise ID with χ² CIs",
            module: "allan",
            tests: "tests/allan_reference.rs (NBS14 vs Stable32 to 1e-4); allan::tests",
            oracle: "NIST SP 1065 (Riley) / Stable32 reference deviations on NBS14",
            oracle_kind: ExternalDataset,
            status: Validated,
        },
        VerificationItem {
            requirement: "Frequency stability on a real measured clock",
            capability: "Overlapping Allan + overlapping Hadamard deviation on a real caesium standard",
            module: "allan",
            tests: "tests/cs5071a_reference.rs (real 5071A Cs vs H-maser, 556 990 pts, 16 averaging factors vs Stable32 to 1e-3; data-gated via scripts/fetch_cs5071a.sh)",
            oracle: "Stable32 overlapping ADEV/HDEV on the measured 5071A caesium phase series (allantools)",
            oracle_kind: ExternalDataset,
            status: Validated,
        },
        VerificationItem {
            requirement: "Allan estimator parity on the canonical Stable32 reference series",
            capability: "Overlapping Allan + modified Allan + time deviation across the full AF ladder",
            module: "allan",
            tests: "tests/phasedat_reference.rs (Stable32 PHASE.DAT, 139 averaging factors, OADEV/MDEV/TDEV to 1e-3; data-gated via scripts/fetch_phasedat.sh)",
            oracle: "Stable32 reference deviations for PHASE.DAT (Riley; the standard regression series)",
            oracle_kind: ExternalDataset,
            status: Validated,
        },
        VerificationItem {
            requirement: "Integrity (RAIM/ARAIM/SBAS)",
            capability: "Snapshot/MHSS RAIM, ARAIM P_HMI budget, SBAS DO-229E combination",
            module: "raim, sbas, lunar",
            tests: "tests/igs_real_data.rs, tests/araim_dual_real_data.rs (real IGS SP3 + Celestrak TLE)",
            oracle: "DO-229E/DO-316 K-factors; real IGS SP3 geometry",
            oracle_kind: ExternalDataset,
            status: Validated,
        },
        VerificationItem {
            requirement: "Orbit propagation & determination",
            capability: "SGP4/SDP4, Cowell 6-DOF + perturbations, batch/sequential OD",
            module: "sgp4, propagator, orbit_determination, precise_od",
            tests: "tests/sgp4_verification.rs (666 AIAA verification vectors, worst 4.12 mm); tests/sgp4_crate_comparison.rs (independent sgp4 crate)",
            oracle: "AIAA 2006-6753 SGP4 verification vectors",
            oracle_kind: ExternalDataset,
            status: Validated,
        },
        VerificationItem {
            requirement: "Numerical Cowell propagator & force model",
            capability: "Cowell numerical propagator with a hierarchical force model (two-body, J2–J6 zonal, Sun/Moon third-body, cannonball SRP, exponential drag); RK4 step-doubling / DP5(4)",
            module: "propagator, forces",
            tests: "tests/numerical_cowell_propagator_reference.rs (275 epochs = 11 cases × 25 hourly states, LEO+GTO, vs Orekit 12.2 DormandPrince853; conservative tiers T1–T5 worst |Δr| 0.08 m over 24 h; drag tier characterised at 333 m)",
            oracle: "Orekit 12.2 (CS GROUP, Apache-2.0) NumericalPropagator/DormandPrince853 — an independent library, a different integrator and spherical-harmonic recursion. The conservative tiers (two-body → J2–J6 zonal → Sun/Moon third-body → cannonball SRP) agree to sub-metre over a 24 h arc, validating the integrator + force algebra; the drag tier and the absolute Sun/Moon-ephemeris / density input fidelity stay MODELLED (characterisation only)",
            oracle_kind: ExternalDataset,
            status: Validated,
        },
        VerificationItem {
            requirement: "Batch & sequential orbit determination",
            capability: "Recover an epoch state [r,v] from ground-station ranges via a Gauss–Newton batch differential corrector and a sequential filter, over a two-body+J2 force model",
            module: "orbit_determination, precise_od (batch_ls::gauss_newton, fusion::ukf)",
            tests: "tests/batch_sequential_orbit_determination_reference.rs (8 scenarios: 6 noiseless LEO/MEO/eccentric/3–4-station + 2 σ=5 m, vs Orekit 12.2; worst batch |Δr| 1e-3 m / |Δv| 1e-6 m/s, sequential |Δr| 0.9 m)",
            oracle: "Orekit 12.2 (CS GROUP, Apache-2.0) BatchLSEstimator (Levenberg–Marquardt) + KalmanEstimator (EKF) — an independent third-party estimation library on a matched force model; recovered epoch state + post-fit residual RMS agree to <1e-3 m noiseless and <3 m at a 5 m noise floor",
            oracle_kind: ExternalDataset,
            status: Validated,
        },
        VerificationItem {
            requirement: "Deep-space radiometric light-time solver",
            capability: "Retarded (down-leg) one-way light-time solution τ = |r_rx − r_target(t−τ)|/c for deep-space radiometric navigation (Earth→Mars/Sun/Moon)",
            module: "radiometric (light_time_solution)",
            tests: "tests/deep_space_mars_radiometric_reference.rs (24 legs over 8 epochs 2020–2027 vs ANISE DE440; worst |Δτ| 1.03e-9 s, |Δrange| 0.31 m at up to 2.5 AU)",
            oracle: "ANISE 0.10 (Nyx Space, MPL-2.0) converged-Newtonian aberration light time (Aberration::CN; SPICE spkapo-equivalent) over JPL DE440 — an independent Rust SPICE implementation; kshana's fixed-point retarded solver matched to sub-nanosecond. The broader Doppler / Shapiro / reduced-dynamic OD figures stay MODELLED",
            oracle_kind: ExternalDataset,
            status: Validated,
        },
        VerificationItem {
            requirement: "Broadcast-ephemeris satellite position (multi-GNSS RINEX)",
            capability: "IS-GPS-200 / Galileo-OS / BeiDou-OS broadcast-ephemeris Keplerian → ECEF satellite position from a parsed RINEX-3 navigation record",
            module: "rinex (parse_nav, RinexEphemeris::sv_position_ecef)",
            tests: "tests/rinex_sp3_interop_reference.rs (84 SV-epoch cases: GPS + Galileo + BeiDou-MEO, 12 SVs × 7 offsets, vs RTKLIB eph2pos; worst per-axis |Δ| 6.2e-8 m)",
            oracle: "RTKLIB v2.4.2-p13 eph2pos() compiled from C source (T. Takasu, BSD-2-Clause) — an independent IS-GPS-200/SIS-ICD implementation, fed the identical RINEX-3 nav records; satellite ECEF position matched to ~62 nm. (SP3 precise-ephemeris interpolation is validated separately — see 'SP3 precise-ephemeris interpolation')",
            oracle_kind: ExternalDataset,
            status: Validated,
        },
        VerificationItem {
            requirement: "SP3 precise-ephemeris interpolation",
            capability: "IGS-standard Lagrange interpolation of SP3 precise-ephemeris satellite positions with the per-node Earth-rotation correction (rotate each node by ω⊕·(t_node−t) into the query instant's Earth-fixed frame before the polynomial fit)",
            module: "sp3 (Sp3Interpolator::position_ecef)",
            tests: "tests/sp3_interp_reference.rs (72 off-node SV-epoch cases / 6 satellites vs RTKLIB peph2pos; worst per-axis |Δ| 1.5e-8 m)",
            oracle: "RTKLIB peph2pos() compiled from C source (preceph.c; T. Takasu, BSD-2-Clause) — the de-facto IGS reference, an independent implementation; kshana's interpolator (now carrying the same Earth-rotation node correction) matched to ~15 nm on a real SP3 product, down from ~5.5 cm before the correction",
            oracle_kind: ExternalDataset,
            status: Validated,
        },
        VerificationItem {
            requirement: "Strapdown INS mechanization",
            capability: "Quaternion-attitude, WGS-84 NED strapdown inertial mechanization (coning/sculling-compensated) propagating a navigation state from (Δθ, Δv) increments",
            module: "inertial::mechanization, inertial::attitude, inertial::imu_errors",
            tests: "tests/classical_strapdown_ins_reference.rs (static/turn/coning profiles, 30 epochs each, vs NaveGo: attitude bit-identical 0 rad; velocity/position within named analytic bounds)",
            oracle: "NaveGo v1.4 (R. Gonzalez et al., LGPL-3) run under Octave — an independent published INS toolbox driven by the identical (Δθ,Δv) increment stream. Attitude matches bit-for-bit (same NED / scalar-first-quaternion / Earth-rate / transport-rate conventions); velocity/position agree to two documented differences — the deflection-of-vertical north-gravity term NaveGo includes and kshana omits by design (plumb-bob gravity; matched to the Groves closed form to every digit, with a sanity-floor assert) and O(dt²) integrator differences — not mechanization errors",
            oracle_kind: ExternalDataset,
            status: Validated,
        },
        VerificationItem {
            requirement: "Gravity-field functional synthesis (gravity-aided / GNSS-free nav map)",
            capability: "Spherical-harmonic gravity magnitude + disturbance (mGal) from any ICGEM .gfc model; GRS80 normal gravity",
            module: "gravity_sh",
            tests: "tests/icgem_gravity_reference.rs (GRS80 synthesis reproduces Somigliana to 3.5e-12; real ICGEM EGM2008 disturbance map physical)",
            oracle: "GRS80 (Moritz 1980, IAG) Somigliana normal gravity + published γ_e/γ_p; real ICGEM EGM2008 field",
            oracle_kind: ExternalDataset,
            status: Validated,
        },
        VerificationItem {
            requirement: "Lambert two-body transfer solver",
            capability: "Izzo-2015 single-revolution Lambert solver (r1, r2, time-of-flight → boundary velocities) across LEO→GEO→heliocentric transfers, prograde and retrograde",
            module: "maneuver (lambert)",
            tests: "tests/lambert_reference.rs (13 transfers vs lamberthub izzo2015; worst |Δv| 7e-12 m/s)",
            oracle: "lamberthub 1.0.0 izzo2015 (J. Martínez Garrido, MIT) — an independent third-party Lambert solver. The single-revolution (M=0) Lambert problem has a unique solution, so library-vs-library agreement is a genuine external check; matched to <1e-4 m/s (observed ~1e-11), the same kind of validation DOP gets vs gnss_lib_py",
            oracle_kind: ExternalDataset,
            status: Validated,
        },
        VerificationItem {
            requirement: "Reference frames & timescales",
            capability: "IAU 2006/2000A precession-nutation, CIO GCRS↔ITRS, leap-second timescales",
            module: "frames, precession, nutation, cio, timescales",
            tests: "tests/frame_reference_vectors.rs (Vallado end-to-end; SOFA/ERFA vectors)",
            oracle: "IAU SOFA / ERFA reference vectors; Vallado AIAA 2006-6753 (0.1–4 mm)",
            oracle_kind: ExternalDataset,
            status: Validated,
        },
        VerificationItem {
            requirement: "Ranging-code design trade",
            capability: "m-sequence/Gold sidelobe & cross-correlation bounds, length↔ambiguity",
            module: "navsignal (CodeFamily)",
            tests: "navsignal::code_tests (GPS C/A Gold ≈ −23.9 dB; φ(1023)/10 = 60)",
            oracle: "Published GPS C/A Gold cross-correlation (−23.9 dB); Gold 1967 bound",
            oracle_kind: ExternalDataset,
            status: Validated,
        },
        VerificationItem {
            requirement: "GNSS geometry / dilution of precision (DOP)",
            capability: "GDOP/PDOP/HDOP/VDOP/TDOP from line-of-sight geometry via Q=(HᵀH)⁻¹ with a local ENU split",
            module: "orbit (dop)",
            tests: "tests/dop_reference.rs (8 geometries, well-conditioned → near-singular)",
            oracle: "gnss_lib_py 1.0.4 (Stanford NAV Lab) DOP — independent library, matched to 1e-6 relative",
            oracle_kind: ExternalDataset,
            status: Validated,
        },
        VerificationItem {
            requirement: "Broadcast ionosphere model (Klobuchar, IS-GPS-200)",
            capability: "Klobuchar single-frequency L1 slant ionospheric group delay from the eight broadcast α/β coefficients",
            module: "gnss_sim (klobuchar_delay_m)",
            tests: "tests/klobuchar_reference.rs (10 cases across elevation/azimuth/local-time, two coefficient sets)",
            oracle: "RTKLIB ionmodel (tomojitakasu/RTKLIB, src/rtkcmn.c) — independent reference implementation compiled from source; matched to < 1e-4 m",
            oracle_kind: ExternalDataset,
            status: Validated,
        },
        VerificationItem {
            requirement: "RAIM/ARAIM integrity statistical kernel (χ² / non-central χ² / normal laws)",
            capability: "The distributional core every protection level rests on: the snapshot fault-detection threshold χ²₁₋ₚfₐ(dof), the missed-detection non-centrality pbias=√λ, and the K_fa/K_md/K_V solution-separation multipliers",
            module: "raim (chi2_cdf, chi2_quantile, noncentral_chi2_cdf, normal_cdf, normal_quantile, pbias)",
            tests: "tests/raim_reference.rs (171 cases: χ² CDF/quantile, normal CDF/quantile, non-central χ² CDF, pbias across the P_fa/P_md/redundancy ranges)",
            oracle: "SciPy 1.17.0 (scipy.stats.chi2/.norm/.ncx2 + optimize.brentq) — independent library (Cephes/Boost), a different algorithm from Kshana's incomplete-gamma series; matched to ≤1e-6 rel. Kernel only — the ARAIM MHSS P_HMI budget *allocation* (vs MAAST) has no published numeric oracle and stays Modelled (see docs/ARAIM_REFERENCE.md)",
            oracle_kind: ExternalDataset,
            status: Validated,
        },
        VerificationItem {
            requirement: "SBAS protection level (DO-229E weighted-LS HPL/VPL)",
            capability: "DO-229E Appendix J weighted-least-squares protection levels: D=(GᵀWG)⁻¹ from per-satellite elevation/azimuth and error budget, horizontal error-ellipse major axis and vertical σ, scaled by the published K-factors",
            module: "sbas (sbas_protection_level)",
            tests: "tests/sbas_reference.rs (6 real-EGNOS epochs: HPL matched directly, vertical d_U checked K-factor-free)",
            oracle: "RTKLIB SBAS-PL fork — zsiki/rtklib_ws waasprotlevels() (Siki & Takács 2017, \"DO-229D Appendix J\"), run by rnx2rtkp -ws on real EGNOS GEO-PRN120 messages + real BUTE/Budapest RINEX; independent third-party implementation, HPL matched to < 2e-3 m. gLAB v6.0.0 (core/filter.c) confirmed identical convention. Both oracles round K_V→5.33 vs Kshana's exact Φ⁻¹(1−5e-8)=5.3267 (~0.06%), so the vertical is checked as the K-factor-free d_U",
            oracle_kind: ExternalDataset,
            status: Validated,
        },
        VerificationItem {
            requirement: "ML detector-evaluation metrics (ROC/AUC/confusion/Pfa-Pmd)",
            capability: "AUC (Mann-Whitney, ties ½), confusion matrix at threshold, P_d/P_md/P_fa/precision/accuracy/F1",
            module: "impairment_eval (auc, confusion_at, roc_curve)",
            tests: "tests/eval_metrics_reference.rs (5 datasets, 24 thresholds; exact counts + <1e-9)",
            oracle: "scikit-learn 1.9.0 (Pedregosa et al., JMLR 2011) — independent library, exact match",
            oracle_kind: ExternalDataset,
            status: Validated,
        },
        VerificationItem {
            requirement: "Anomaly-detection scoring on real spacecraft telemetry",
            capability: "ROC AUC + bootstrap CI separating real labelled anomalies; transparent detector (reproduces-labels)",
            module: "impairment_eval, eval_stats",
            tests: "tests/opssat_ad_reference.rs (real ESA OPS-SAT, AUC reproduces scikit-learn to 1e-9); tests/ai_ml_rf_impairment_detection_evaluation_reference.rs (122 cases on the real OPSSAT-AD test split: full operating-point confusion + Pd/Pfa/precision/F1 vs scikit-learn, integer-exact)",
            oracle: "scikit-learn roc_auc_score on the OPSSAT-AD test split (Ruszczak et al. 2025, CC BY 4.0) — real OPS-SAT telemetry",
            oracle_kind: ExternalDataset,
            status: Validated,
        },
        VerificationItem {
            requirement: "Quantum-trade numerical kernels (NNLS / χ² bands / van-Loan Q)",
            capability: "Measured-ADEV NNLS fit, NEES/NIS χ² consistency bands, and the clock van-Loan discrete process-noise (holdover-coast) covariance — the trade engine's computational spine",
            module: "quantum_trade (qparams_from_adev_curve), detection (chi2_inv_cdf), clock_state (ClockState3)",
            tests: "tests/scipy_reference.rs (NNLS; χ² at operating dof ≥ 48; van-Loan Q)",
            oracle: "scipy 1.17.1 — optimize.nnls / stats.chi2.ppf / linalg.expm; NNLS+Q exact, χ² <5e-4 at operating dof. Kernels only — device-performance numbers stay Modelled (next row)",
            oracle_kind: ExternalDataset,
            status: Validated,
        },
        VerificationItem {
            requirement: "Geomagnetic reference field (IGRF-14 synthesis)",
            capability: "Spherical-harmonic synthesis of the IGRF-14 main field — X/Y/Z/F components, declination and inclination — feeding the magnetic-anomaly alt-PNT layer",
            module: "igrf, igrf_data",
            tests: "tests/alternative_complementary_pnt_reference.rs (2520 global points × altitudes vs ppigrf @ epoch 2025.0; worst |ΔXYZF| 3.9e-4 nT, |ΔD| 2.8e-6°, |ΔI| 3.6e-7°)",
            oracle: "ppigrf 2.1.0 (K. M. Laundal, MIT) — the IAGA-VMOD pure-Python IGRF reference implementation shipping the official IGRF14.shc coefficients (IAGA 14th generation, Zenodo 10.5281/zenodo.14012302); an independent third-party codebase computing the uniquely-defined IGRF-14 field, matched over a global grid",
            oracle_kind: ExternalDataset,
            status: Validated,
        },
        VerificationItem {
            requirement: "Detection statistics — Gaussian AUC & minimum detectable fault",
            capability: "Analytic binormal ROC AUC = Φ(μ/(σ√2)) and the minimum detectable fault σ·(Φ⁻¹(1−P_fa)+Φ⁻¹(P_d)) underpinning the quantum-fault and anomaly detectors",
            module: "quantum_faults, eval_stats, detection",
            tests: "tests/quantum_faults_reference.rs (109 cases vs scipy 1.17 norm.cdf/ppf + scikit-learn roc_auc_score; worst |Δ| AUC 6.9e-8, min-detectable-fault 1.3e-8, empirical-AUC 1.1e-16)",
            oracle: "scipy 1.17 (Cephes ndtr/ndtri) + scikit-learn roc_auc_score (Pedregosa et al., JMLR 2011), both BSD-3-Clause — independent libraries computing the same uniquely-defined Gaussian-tail / AUC quantities, matched to the A&S-erf floor (~7e-8). The quantum-vs-classical advantage built on top stays MODELLED",
            oracle_kind: ExternalDataset,
            status: Validated,
        },
        VerificationItem {
            requirement: "Rank-order statistics kernel (Kendall-τ / Dirichlet / percentile)",
            capability: "Rank-correlation and resampling kernels under the resilience decision-instability study: Kendall τ-b, Dirichlet mean, competition ranking and percentile confidence intervals",
            module: "resilience::stats",
            tests: "tests/resilience_score_decision_instability_reference.rs (124 cases vs scipy 1.18 / numpy 2.4: 61 Kendall τ-b to 2e-16, ranking exact, Dirichlet mean + percentile-CI to 1e-12)",
            oracle: "scipy 1.18 (stats.kendalltau variant='b', rankdata) + numpy.percentile (BSD-3-Clause) — independent implementations (merge-sort τ) of the uniquely-defined rank statistics, matched to 1e-12. The decision-instability study built on these kernels stays MODELLED",
            oracle_kind: ExternalDataset,
            status: Validated,
        },
        VerificationItem {
            requirement: "CUSUM change-detection latency & ARL",
            capability: "Tabular-CUSUM detector worst-case detection latency (⌊h/(z−k)⌋+1) and out-of-control average run length, used by the timing-protection-level and spoof monitors",
            module: "tpl (Cusum), security",
            tests: "tests/timing_protection_level_under_spoofing_reference.rs (16 deterministic-latency cases EXACT vs a first-passage oracle; 8 ARL₁ cases, Monte-Carlo @60k trials vs the Siegmund approximation + published Montgomery tables)",
            oracle: "Published tabular-CUSUM ARL: Siegmund (1985) Brownian-motion approximation (Hawkins & Olwell 1998, eq. 3.7) cross-anchored to Montgomery, Introduction to Statistical Quality Control (Wiley) ARL tables for k=½, h∈{4,5}; deterministic latency matched exactly to a first-passage oracle. The composed TPL bound stays MODELLED",
            oracle_kind: ExternalDataset,
            status: Validated,
        },
        VerificationItem {
            requirement: "Clock-holdover coast-variance & threshold inversion",
            capability: "Coast phase-error variance growth q_wf·t + q_rw·t³/3 + q_drift·t⁵/20 and its monotone inversion to a timing-error holdover threshold",
            module: "holdover (coast_phase_variance, holdover_seconds)",
            tests: "tests/gnss_denied_clock_holdover_reference.rs (27 cases vs scipy 1.18: 12 coast-variance vs linalg.expm Van-Loan Q₀₀ worst rel 1.1e-15; 7 holdover inversions vs optimize.brentq worst rel 1.5e-16)",
            oracle: "scipy 1.18 (BSD-3-Clause): linalg.expm computing the Van-Loan 1978 discrete process-noise Q₀₀ = ∫₀ᵗ ΦQcΦᵀds via Padé scaling-and-squaring on the 6×6 augmented matrix — an independent route that never sees kshana's polynomial coefficients; plus optimize.brentq inverting the same monotone curve vs kshana's bisection. The per-class red-noise floor figures (ClockClass) stay MODELLED",
            oracle_kind: ExternalDataset,
            status: Validated,
        },
        VerificationItem {
            requirement: "Inverse-Simpson diversity kernel",
            capability: "Effective architectural diversity = inverse-Simpson / Hill-order-2 number 1/Σpᵢ² over per-independence-group source qualities (the diversity term in the resilience score)",
            module: "resilience::diversity (effective_diversity)",
            tests: "tests/resilience_diversity_reference.rs (17 cases: 14 vs scikit-bio inv_simpson + 3 pinned-zero boundary; worst |Δ| 0.0)",
            oracle: "scikit-bio 0.7.3 skbio.diversity.alpha.inv_simpson (McDonald et al., BSD-3-Clause) — an independent third-party library computing the uniquely-defined inverse-Simpson index; reproduced byte-for-byte. The DHS-RPCF scoring framework (weights/levels) built on top stays MODELLED",
            oracle_kind: ExternalDataset,
            status: Validated,
        },
        // ── Modelled (first-principles / published formulae, internally checked)─
        VerificationItem {
            requirement: "GNSS-denied clock holdover",
            capability: "Closed-form coast-error growth + holdover-to-threshold; quantum-clock classes",
            module: "holdover",
            tests: "holdover::tests (vs multi-step Kalman covariance recursion; white-FM exact; round-trip); coast-variance kernel externally validated in tests/gnss_denied_clock_holdover_reference.rs (vs scipy Van-Loan/brentq)",
            oracle: "Multi-step clock_state covariance recursion (same-codebase cross-check); the underlying coast-variance & holdover-inversion kernel is externally validated vs scipy (see 'Clock-holdover coast-variance & threshold inversion'). The per-class red-noise-floor holdover figures stay MODELLED",
            oracle_kind: ReferenceImpl,
            status: Modelled,
        },
        VerificationItem {
            requirement: "Onboard clock state estimation",
            capability: "3-state (phase/freq/drift) van-Loan Kalman clock, Joseph-stabilised",
            module: "clock_state",
            tests: "clock_state::tests (analytic van-Loan Q; NEES; PSD positivity); tests/clock_state_reference.rs (full predict+update trajectory — state x and 3×3 covariance P over 1925 steps / 4 parameter sets vs filterpy 1.4.5; worst |relΔ| 2.8e-14)",
            oracle: "filterpy 1.4.5 KalmanFilter (R. Labbe, MIT), with F via scipy.linalg.expm and Q via the Van-Loan 1978 block-matrix — an independent reference implementation reproducing kshana's full filter trajectory. Cross-implementation consistency: the clock physics / Allan calibration are not externally validated, so this stays MODELLED",
            oracle_kind: ReferenceImpl,
            status: Modelled,
        },
        VerificationItem {
            requirement: "Time-transfer error budgeting",
            capability: "Two-way/TWSTFT (Sagnac), GNSS common-view, PPP; link-jitter→range",
            module: "timetransfer, timetransfer_adv",
            tests: "timetransfer::tests (reciprocal cancellation; two-form Sagnac identity); tests/time_transfer_error_budgeting_reference.rs (Sagnac/geodist geometry cross-checked against RTKLIB 2.4.3 geodist() compiled from C source)",
            oracle: "BIPM 2Aω/c² Sagnac closed form, cross-checked against RTKLIB 2.4.3 geodist() (Takasu, BSD-2-Clause, compiled from C) which carries the same Sagnac geometry — independent code but the same closed form, so still InternalConsistency",
            oracle_kind: InternalConsistency,
            status: Modelled,
        },
        VerificationItem {
            requirement: "Nav-signal modulation & code-tracking analysis",
            capability: "BPSK-R/BOC PSD, spectral-separation κ, Gabor bandwidth, DLL jitter, multipath",
            module: "navsignal",
            tests: "navsignal::tests (BPSK self-SSC = 2/3R_c; unit-area PSD; DLL); tests/nav_signal_modulation_code_tracking_reference.rs (GPS C/A Gold cross/auto-correlation exact-integer match vs independent IS-GPS-200 code generation; BPSK-R(1)/sine-BOC(1,1) PSD vs an independent scipy periodogram)",
            oracle: "GPS C/A Gold cross/auto-correlation matched EXACTLY (integer ±65/−1/63) against independent IS-GPS-200 code generation; BPSK-R(1)/BOC(1,1) PSD shape vs an independent scipy periodogram. The modulation/SSC/DLL closed forms (Betz 2001 / Kaplan & Hegarty) remain analytic, so the row stays MODELLED — but the code-correlation sub-claim is externally matched",
            oracle_kind: ExternalDataset,
            status: Modelled,
        },
        VerificationItem {
            requirement: "Quantum inertial sensor performance",
            capability: "Cold-atom interferometer accelerometer from first principles (k_eff·T², QPN)",
            module: "inertial::quantum_imu",
            tests: "quantum_imu::tests (k_eff; Mach-Zehnder T²; Freier-2016 floor bracket); tests/quantum_inertial_sensor_reference.rs (transfer function |H(ω)|, k_eff·T² and shot-noise ASD vs published Cheinet 2008 / Peters / Freier numeric vectors)",
            oracle: "Published CAI primary-paper numeric vectors (Cheinet 2008 transfer function; Peters/Freier sensitivity): k_eff·T² matched exactly, shot-noise ASD a one-sided floor within ~2× of each published instrument (real devices carry technical noise above the quantum floor). A bracket, not parity",
            oracle_kind: ExternalDataset,
            status: Modelled,
        },
        VerificationItem {
            requirement: "Quantum inertial sensor fringe-ambiguity / dynamic range",
            capability: "Mach–Zehnder fringe-ambiguity dynamic range: the 2π-periodic fringe readout sets a maximum unambiguous specific force a_max=π/(k_eff·T²), and the unambiguous range in resolution cells a_max/σ_a=π/σ_Φ is independent of the optical scale factor — the T² sensitivity gain costs unambiguous range in exact lockstep (interrogation time trades resolution for range, leaving the cell count fixed by the readout phase noise)",
            module: "inertial::quantum_imu",
            tests: "quantum_imu::tests (a_max sits at the ±π half-fringe edge with the 1/T² range scaling; wrapped-phase recovery is exact inside [−a_max,a_max] and aliases by exactly 2·a_max outside it; the unambiguous dynamic range a_max/σ_a=π/σ_Φ is identical across two very different wavelength/T scale factors; the CaiAccelerometer methods match the free functions)",
            oracle: "Self-consistency of the interferometer fringe model: the half-fringe edge, the 2π-periodic aliasing structure, and the scale-factor cancellation in the range/resolution ratio are closed-form algebraic identities checked against the engine's own Mach–Zehnder phase and sensitivity functions — internal-consistency checks, NOT an external dataset, so the row stays InternalConsistency. MODELLED ideal three-pulse fringe-ambiguity; no wavefront-aberration or contrast-loss bounds on the unambiguous range",
            oracle_kind: InternalConsistency,
            status: Modelled,
        },
        VerificationItem {
            requirement: "Quantum inertial dead-reckoning resilience",
            capability: "Composed bias + scale-factor + VRW + stability-decay position budget over holdover",
            module: "inertial::quantum_imu (QuantumNavBudget)",
            tests: "budget_tests (bias vs AccelModel integrator; VRW vs analytic integral); tests/quantum_inertial_dead_reckoning_reference.rs (VRW vs an independent numpy Monte-Carlo double-integration of white-acceleration noise, worst dev 0.42% within ±3% over 6 coast times; bias/scale-factor vs a Groves 2013 closed-form value; holdover round-trips)",
            oracle: "Independent numpy Monte-Carlo SDE integration of double-integrated white-acceleration noise (validates the analytic VRW variance by a genuinely independent algorithm) + a Groves 2013 published-value anchor for the bias/scale-factor terms; the CAI device numbers quantify partner hardware and stay MODELLED",
            oracle_kind: ReferenceImpl,
            status: Modelled,
        },
        VerificationItem {
            requirement: "GNSS/INS sensor fusion",
            capability: "15-state error-state EKF (loosely & tightly coupled), tightly-coupled pseudorange/Doppler UKF, and a coupled clock+position filter",
            module: "fusion (gnss_ins_ekf, tightly_coupled, ukf, coupled)",
            tests: "fusion::tests (UKF==linear-KF identity; outage coast; NEES); tests/gnss_ins_sensor_fusion_reference.rs (50 cases vs filterpy 1.4.5: linear EKF loose/tight + coupled-PNT posteriors to ≤2.4e-12; UKF 40-epoch run worst |Δx| 1.9e-7 / |ΔP| 9.5e-6)",
            oracle: "filterpy 1.4.5 (R. Labbe, MIT) on numpy/scipy. The three LINEAR filters reach the uniquely-defined Bayesian posterior independently (Joseph vs standard form, machine precision) — a genuine library-vs-library check; the tightly-coupled UKF shares the same sigma-point recursion, so it is consistency-only. Stays MODELLED (the trajectory truth / sensor calibration are not externally validated)",
            oracle_kind: ReferenceImpl,
            status: Modelled,
        },
        VerificationItem {
            requirement: "GNSS-denied jamming resilience",
            capability: "Geometry J/S link budget, anti-jam C/N₀, per-satellite loss-of-lock",
            module: "jamming",
            tests: "jamming::tests (PSD-derived Q cross-check; despreading); tests/gnss_denied_jamming_resilience_reference.rs (FSPL/J-S/effective-C-N₀ vs an independent numpy re-derivation of the Kaplan & Hegarty §9.4 link budget; real JammerTest C/N₀ falls monotonically through the 25 dB-Hz threshold)",
            oracle: "Anti-jam C/N₀ link-budget equation cross-checked against an independent numpy re-derivation (shares the same closed form → InternalConsistency) plus a real-JammerTest-2024 C/N₀ degradation characterisation",
            oracle_kind: InternalConsistency,
            status: Modelled,
        },
        VerificationItem {
            requirement: "Spoofing detection",
            capability: "Clock-aided χ², RAIM, AGC, SQM fused per-epoch security FoM",
            module: "spoof, spoof_detect, spoof_monitors",
            tests: "tests/spoof_texbat_validation.rs (TEXBAT parameter characterisation)",
            oracle: "TEXBAT scenario parameters (Humphreys 2012) — characterisation, not pinned vectors",
            oracle_kind: ExternalDataset,
            status: Modelled,
        },
        VerificationItem {
            requirement: "Timing Protection Level under spoofing",
            capability: "Closed-form bound on worst-case undetected time error = monitor floor + oscillator coast-σ over CUSUM detection latency, reported as a red-noise-floor band",
            module: "tpl",
            tests: "tpl::tests (closed-form oracles + CUSUM); examples/tpl_jammertest.rs (JammerTest 2024 real-spoof calibration)",
            oracle: "Composes Validated primitives (allan/holdover van-Loan, security floor); calibrated on JammerTest 2024 scenario 2.1.1 (~1.01 ms real served-time pull vs ≤51 ns claimed). Bridge over Validated parts — not itself an external validation.",
            oracle_kind: InternalConsistency,
            status: Modelled,
        },
        VerificationItem {
            requirement: "Cislunar mission analysis",
            capability: "CR3BP STM + single-shooting differential corrector; L2 southern NRHO",
            module: "cr3bp",
            tests: "cr3bp::tests (STM vs finite-diff); tests/cislunar_mission_analysis_reference.rs (5 JPL L2-S NRHO members: the 9:2 + 4 neighbours; worst |ΔC| 1.5e-5, |ΔT|/T 9.6e-5, perilune 0.7 km in JPL length units)",
            oracle: "NASA/JPL Three-Body Periodic Orbit Database (SSD, periodic_orbits.api; Earth–Moon L2 Southern halo family, Howell/Davis methodology) — externally-published period T, Jacobi C and perpendicular-crossing initial conditions; kshana's single-shooting STM corrector, seeded with the catalog IC and perturbed, converges back onto the catalog members",
            oracle_kind: ExternalDataset,
            status: Validated,
        },
        VerificationItem {
            requirement: "Alternative / complementary PNT",
            capability: "Gravity-map matching, terrain-referenced (TERCOM/SITAN), magnetic anomaly",
            module: "altpnt, mapmatch, gravimeter, igrf",
            tests: "tests/* (map-matching CRLB; IGRF-14 field)",
            oracle: "IGRF-14 coefficients; first-principles matched-filter CRLB",
            oracle_kind: InternalConsistency,
            status: Modelled,
        },
        VerificationItem {
            requirement: "Reproducibility & software assurance",
            capability: "Deterministic, scenario-hashed, SBOM + cross-platform golden gates",
            module: "report, scenario; CI (golden/determinism/SBOM)",
            tests: "tests/golden.rs, tests/determinism.rs, tests/cross_platform_golden.rs; tests/reproducibility_software_assurance_reference.rs (the generated SBOM validates with zero errors against the official CycloneDX 1.5 JSON Schema over the full ~59-component locked graph)",
            oracle: "SBOM conformance to the official CycloneDX 1.5 JSON Schema (+ valid SPDX identifiers) — an external published standard, zero validation errors over the full dependency graph; the FoM-determinism / byte-reproducibility part remains a pinned self-consistency check, so the row stays MODELLED",
            oracle_kind: ExternalDataset,
            status: Modelled,
        },
        VerificationItem {
            requirement: "AI/ML RF-impairment detection evaluation (13494)",
            capability: "Labelled synthetic impairment corpus + detector-agnostic ROC/AUC/confusion/Pfa-Pmd harness; leakage guard, stratified split, distribution-shift (in- vs out-of-regime) optimism report. Runnable from the CLI/bindings as the `impairment-eval` scenario kind (scenarios/impairment-eval.toml)",
            module: "impairment_eval",
            tests: "impairment_eval::tests (AUC perfect=1/identical=0.5/tie=0.125, ROC monotone, fused>0.8, per-class layer separation, leakage guard, reproducible corpus, distribution-shift flags optimism); dominance_demonstrators (reachable + reproducible + MODELLED-not-VALIDATED + optimism-gap self-consistent)",
            oracle: "Closed-form AUC bounds (Mann–Whitney) + a perfect-oracle detector; corpus is SYNTHETIC (parameter-grounded, not field/IQ)",
            oracle_kind: InternalConsistency,
            status: Modelled,
        },
        VerificationItem {
            requirement: "AI/ML RF-impairment optimism-gap study & ID-only gap predictor",
            capability: "Controlled synthetic study of the in-distribution→out-of-distribution AUC optimism gap across published-method and learned (logistic-regression / one-hidden-layer MLP) detectors: per-class scaling-law trends (Spearman ρ + slope on 1−severity) and an ID-only ridge predictor that estimates the gap from in-distribution diagnostics alone, scored leave-one-detector-out and leave-one-class-out. Reproducible via `cargo run --release --example optimism_study`",
            module: "impairment_study, impairment_ml, eval_stats",
            tests: "impairment_study::tests (per-class oracle AUC≈1, learned optimism gap>0, grid shape + bootstrap CI brackets the mean + positive scaling trend, ID features finite, gap predictor beats predict-the-mean under BOTH leave-one-detector-out and leave-one-class-out CV + deterministic); impairment_ml::tests (logreg separates + deterministic + loss↓, MLP solves XOR a linear model cannot + seeded); eval_stats::tests (bootstrap/DeLong/Spearman/ridge vs closed forms)",
            oracle: "Hand-derived statistics vs closed forms (binormal AUC Φ(d'/√2), DeLong variance, tied-rank Spearman, exact OLS recovery) + leave-one-out CV against the predict-the-mean baseline. Corpus is SYNTHETIC (parameter-grounded, never field/IQ) and the optimism gap is a synthetic→synthetic severity shift, NOT a sim-to-field result",
            oracle_kind: InternalConsistency,
            status: Modelled,
        },
        VerificationItem {
            requirement: "Quantum-vs-classical PNT trade & GNSS-denied resilience (13503)",
            capability: "Measured-ADEV ingestion (NNLS), trade table (timing/inertial holdover + benefit), resilience-vs-time envelope; floor caveat carried on the artifact. Runnable from the CLI/bindings as the `quantum-trade` scenario kind (scenarios/quantum-trade.toml)",
            module: "quantum_trade",
            tests: "quantum_trade::tests (ADEV round-trip recovery, NNLS non-negativity, floor-caveat present/absent, benefit>1, monotone envelope + alt-PNT bound); dominance_demonstrators (measured-ADEV is data-driven not floor-assumed, assumed-class flags floor + caveat, malformed curve rejected, MODELLED-not-VALIDATED)",
            oracle: "The measured-ADEV→PSD fit (NNLS) kernel is matched to scipy.optimize.nnls (tests/scipy_reference.rs / tests/quantum_vs_classical_pnt_trade_reference.rs) — an independent external kernel; but the trade NUMBERS quantify (never validate) a partner clock/CAI, so the trade itself stays MODELLED, no validation halo",
            oracle_kind: ExternalDataset,
            status: Modelled,
        },
        VerificationItem {
            requirement: "Space-weather environment & activity-driven thermospheric density",
            capability: "Solar/geomagnetic indices (definitional Kp↔ap table), Jacchia-1971 exospheric temperature, and a calibrated first-order activity density correction over the static USSA76 atmosphere (the solar-cycle density swing the static model omits). Runnable from the CLI/bindings as the `space-weather` scenario kind (scenarios/space-weather.toml)",
            module: "space_weather",
            tests: "space_weather::tests (Kp↔ap exact at grid points + round-trip + monotone, daily-Ap mean, exospheric-T vs published solar-min/mean/max + storm increment anchors, density unity-at-reference, solar-cycle swing in the observed 5–10× band, scenario reproducible + MODELLED-not-VALIDATED + out-of-range rejection); dominance_demonstrators (reachable + reproducible + physical T + MODELLED-not-VALIDATED)",
            oracle: "Definitional Kp↔ap table + Jacchia-1971 exospheric-temperature closed form (matched to <1 K vs the published anchors, tests/space_weather_reference.rs); the density correction is characterised against pymsis NRLMSISE-00 (an independent NRL model) — directionally correct and within a factor of 3 of the 400 km solar-cycle swing, but diverging up to ~8× aloft, so the density layer is a CALIBRATED first-order model and stays MODELLED",
            oracle_kind: ExternalDataset,
            status: Modelled,
        },
        VerificationItem {
            requirement: "CCSDS OEM interoperability (GMAT/Orekit/STK ephemeris import)",
            capability: "CCSDS 502.0 OEM importer (parse_oem), tolerant of COMMENT lines / extra metadata keywords / covariance blocks and the exact inverse of the writer; round-trip + external-file ingest with a velocity-consistency check. Runnable from the CLI/bindings as the `oem-interop` scenario kind (scenarios/oem-interop.toml)",
            module: "oem",
            tests: "tests/ccsds_oem_interop_reference.rs (24 states / 2 fixtures decoded byte-identically by the independent `oem` parser, pos/vel Δ = 0); oem::tests (parse an external-tool OEM with extra keywords/comments/covariance, write→read round-trip of the full state, pos+vel+accel tolerated, position-only + missing-mandatory-metadata rejected, scenario round-trip high-fidelity + external ingest); dominance_demonstrators (reachable + reproducible + round-trip exact + MODELLED-not-VALIDATED)",
            oracle: "Independent third-party CCSDS-502 parser `oem` 0.4.5 (B. Sease, MIT) — a separate codebase that decodes kshana's emitted EME2000/UTC OEM byte-identically (24 states across 2 fixtures, pos/vel Δ = 0) and whose strict reader confirms the metadata tokens; kshana's parser likewise agrees with it on a vendored external OEM. Two honest interop findings (the oem library rejects kshana's per-satellite multi-segment convention and its multi-entry covariance lines) are documented in the test — so this validates the conformant single-object interchange, not full CCSDS-502 conformance of every kshana variant",
            oracle_kind: ExternalDataset,
            status: Validated,
        },
        VerificationItem {
            requirement: "Launch-window & ascent geometry (mission analysis)",
            capability: "Two-body launch azimuth(s) (sin Az = cos i / cos lat), minimum reachable inclination, circular velocity, Earth-rotation eastward bonus, dogleg plane-change Δv and daily opportunities. Runnable from the CLI/bindings as the `launch-window` scenario kind (scenarios/launch-window.toml)",
            module: "launch",
            tests: "launch::tests (due-east launch reaches i=latitude, KSC→ISS = textbook 45°, polar = N/S, i<lat unreachable, 465 m/s equatorial bonus, plane-change 10° ≈ 1.34 km/s + 180° = 2v, daily-opportunity counts, scenario reproducible/MODELLED + dogleg path); dominance_demonstrators (reachable + reproducible + KSC→ISS 45° + MODELLED-not-VALIDATED)",
            oracle: "Closed-form spherical-trig launch geometry vs published worked-example anchors (Vallado, Fundamentals of Astrodynamics 4th ed., Algorithm 37 launch-azimuth + Ch.6 plane-change; tests/launch_window_ascent_geometry_reference.rs). These re-use the same closed form kshana implements (a published-value parity / transcription check, InternalConsistency); MODELLED two-body, no rotating-Earth velocity-triangle / ascent / drag-loss model",
            oracle_kind: InternalConsistency,
            status: Modelled,
        },
        VerificationItem {
            requirement: "Ballistic re-entry corridor (Allen–Eggers)",
            capability: "Peak deceleration (ballistic-coefficient-independent), velocity + altitude at peak-g, and peak-heating velocity for an exponential-atmosphere ballistic entry. Runnable from the CLI/bindings as the `reentry` scenario kind (scenarios/reentry.toml)",
            module: "reentry",
            tests: "reentry::tests (peak-g independent of ballistic coefficient + physical g-band, grows with steeper γ / faster entry, peak-g velocity = V_e·e^(−1/2) and peak-heating = V_e·e^(−1/6) faster, peak-g altitude physical + deeper for higher B, scenario reproducible/MODELLED + degenerate-geometry rejected); dominance_demonstrators (reachable + reproducible + V_e·e^(−1/2) fraction + MODELLED-not-VALIDATED)",
            oracle: "Closed-form Allen–Eggers analytic entry, additionally cross-checked vs a scipy 1.18 solve_ivp (DOP853) numerical integration of the SAME drag-only entry ODE (tests/ballistic_re_entry_corridor_reference.rs, 36 cases, worst a_max rel 2.9e-9) — a numeric-integral-vs-own-analytic-form check, so still InternalConsistency, NOT an external validation. MODELLED ballistic (no lift), no aerothermal/TPS — heating output is a velocity, not a heat-flux",
            oracle_kind: InternalConsistency,
            status: Modelled,
        },
        VerificationItem {
            requirement: "EO payload footprint & coverage geometry",
            capability: "SMAD space-triangle geometry: Earth angular radius, swath width, nadir GSD, maximum off-nadir access, circular period + equatorial ground-track spacing with a contiguous-coverage flag. Runnable from the CLI/bindings as the `eo-coverage` scenario kind (scenarios/eo-coverage.toml)",
            module: "eo_payload",
            tests: "eo_payload::tests (angular radius 64° at 700 km + shrinks with altitude, nadir→zenith/zero-range, horizon→ε=0/max central angle, past-horizon errors, swath grows with FOV / GSD with altitude, ~2750 km node spacing, scenario reproducible/MODELLED + bad-input rejection); dominance_demonstrators (reachable + reproducible + 64° angular radius + MODELLED-not-VALIDATED)",
            oracle: "Closed-form SMAD/Wertz space-triangle relations cross-checked against Skyfield/SGP4 + a WGS-84 ray-ellipsoid geodesic (tests/eo_payload_coverage_reference.rs): equatorial node spacing within 1% of an SGP4 propagation and the limb angle within 0.3° of the ellipsoid. MODELLED spherical-Earth geometry (the ellipsoid/SGP4 envelope difference is the modelling gap), no radiometry/MTF/atmosphere/jitter/glint",
            oracle_kind: ExternalDataset,
            status: Modelled,
        },
        VerificationItem {
            requirement: "CCSDS Space Packet (133.0) TM/TC framing",
            capability: "CCSDS 133.0-B Space Packet primary-header encode/decode (version/type/sec-hdr/APID/seq-flags/count/data-length) + a framing scenario. Runnable from the CLI/bindings as the `space-packet` scenario kind (scenarios/space-packet.toml)",
            module: "space_packet",
            tests: "space_packet::tests (header bits match the CCSDS-133 layout, encode→decode round-trips all fields, out-of-range/truncated rejected); tests/ccsds_space_packet_reference.rs (33 cases vs spacepackets 0.32.0, incl. 12 full-packet comparisons; zero mismatched octets)",
            oracle: "spacepackets 0.32.0 (us-irs/spacepackets-py, R. Mueller, Apache-2.0) — an independent third-party implementation of CCSDS 133.0-B-2; kshana's encode_packet/decode_packet matched byte-exact (the 6-octet primary header for 33 cases + the full encoded packet for 12)",
            oracle_kind: ExternalDataset,
            status: Validated,
        },
        VerificationItem {
            requirement: "3-DOF attitude & pointing error budget (AOCS)",
            capability: "Gravity-gradient worst-case disturbance torque ((3/2)(μ/R³)ΔI) + RSS pointing-error budget over named 1σ contributors with the dominant term. Runnable from the CLI/bindings as the `attitude-budget` scenario kind (scenarios/attitude-budget.toml)",
            module: "attitude_budget",
            tests: "attitude_budget::tests (GG torque vanishes for a symmetric body, grows lower-down, linear in ΔI, RSS quadrature sum, variance-fractions-sum-to-1); tests/attitude_gg_torque_reference.rs (20 cases vs an independent full-tensor GG torque T=(3μ/R³)(n̂×(I·n̂)) numerically maximised over attitude with Hipparchus 3.1 linalg; worst rel 6e-15, + Wertz/Sidi published O(1e-6) s⁻² band)",
            oracle: "Closed-form gravity-gradient torque and quadrature RSS, cross-checked against a hand-coded full-tensor torque numerically maximised over attitude (Hipparchus 3.1 linalg) which blindly rediscovers the 45° peak — a strong self-consistency check, but the GG physics is shared/hand-coded so it stays InternalConsistency, not external. MODELLED scalar AOCS budget — no control-loop/6-DoF/flexible-mode simulation",
            oracle_kind: InternalConsistency,
            status: Modelled,
        },
        VerificationItem {
            requirement: "Ground-station pass prediction (ground segment)",
            capability: "Time-domain visibility passes (AOS/TCA/LOS, max elevation, duration) of an orbit over a station above an elevation mask, with interpolated rise/set crossings and total access. Runnable from the CLI/bindings as the `passes` scenario kind (scenarios/passes.toml)",
            module: "passes",
            tests: "passes::tests (interp-cross linear + degenerate-safe, polar→mid-lat passes, higher mask ⇒ fewer-or-equal); tests/ground_station_pass_prediction_reference.rs (22 scenarios / 129 passes vs Orekit 12.2 ElevationDetector; worst |Δ| AOS/LOS 0.0000 s, max-elevation 0.0014°, total access 0.0001 s, identical pass count)",
            oracle: "Orekit 12.2 (CS GROUP, Apache-2.0) + Hipparchus 3.1 — an independent flight-dynamics library: ElevationDetector (Brent root-finder) + EventsLogger over an ITRF ephemeris, station as a WGS-84 TopocentricFrame. AOS/LOS/max-elevation/pass-count/total-access matched on identical orbit+station+mask+window (committed fixture; driver xval/orekit-passes)",
            oracle_kind: ExternalDataset,
            status: Validated,
        },
        VerificationItem {
            requirement: "One-way link budget (comms / link design)",
            capability: "Free-space path loss, C/N₀, Eb/N₀, margin and closure over the CCSDS 401 / DSN 810-005 link equation for EIRP/G·T/range/rate/band against a required Eb/N₀. Runnable from the CLI/bindings as the `link-budget` scenario kind (scenarios/link-budget.toml)",
            module: "linkbudget",
            tests: "linkbudget::tests (free-space-loss form, link-equation closure); tests/one_way_link_budget_reference.rs (DESCANSO/JPL Galileo X-band DCT reproduced end-to-end + 6 ITU-R P.525 FSL cases across DSN S/X/Ka band centres; worst |ΔFSL| 4.6e-3 dB, |Δcarrier| 2.5e-2 dB)",
            oracle: "Published deep-space telecom design-control table as pinned numeric vectors: DESCANSO / J. H. Yuen (ed.), Deep Space Telecommunications Systems Engineering, JPL Pub 82-76, Table 1-1 (Galileo X-band) — kshana reassembles the table line-items and reproduces its published end-to-end L_fs 290.54 dB and Pr/N0 54.6 dB-Hz; free-space loss also checked vs ITU-R P.525",
            oracle_kind: ExternalDataset,
            status: Validated,
        },
        VerificationItem {
            requirement: "Frugal cost-per-coverage / ROI framing",
            capability: "Cost-per-percent-coverage + coverage-per-euro ROI over the constellation sizing engine; per-satellite cost is a caller-sourced low/nominal/high bracket (no fabricated prices)",
            module: "frugal (over walker)",
            tests: "frugal::tests (hand-derived cost-per-coverage 48/96=0.5, ROI ratio 2.667, bracket-ordering + zero-coverage guards)",
            oracle: "Closed-form cost arithmetic vs hand-derived values; an economic FRAMING of a modelled coverage figure, not a quote or validated cost model",
            oracle_kind: InternalConsistency,
            status: Modelled,
        },
        VerificationItem {
            requirement: "Detection-miss integrity impact (context-aware HPL/VPL vs alert limit)",
            capability: "Maps an undetected spoof/jam bias to effective error → Stanford region (available/unavailable/MI/HMI) against context-specific HAL/VAL (open-sky vs urban)",
            module: "integrity_impact (over raim)",
            tests: "integrity_impact::tests (same miss flips Available→MI→HMI as the context tightens; conservative-PL→Unavailable; per-axis HMI; input guards)",
            oracle: "Composes the externally-validated RAIM Stanford classification (raim::classify_stanford); the detection-miss→AL mapping itself is modelled, not a certified integrity allocation",
            oracle_kind: ReferenceImpl,
            status: Modelled,
        },
        VerificationItem {
            requirement: "CAI cited error-model parameter sheet (13503)",
            capability: "Bracketed (best/nominal/conservative) cold-atom-interferometer performance — bias instability, velocity/angle random walk, scale-factor stability, interrogation-limited sample rate, fringe-ambiguity dynamic range — each citation-traceable; feeds QuantumNavBudget without modelling hardware",
            module: "inertial::cai_params (over inertial::quantum_imu)",
            tests: "inertial::cai_params::tests (physics VRW lands inside the cited VRW bracket at all 3 levels; raw fringe-ambiguity range computed from k_eff·T²; conservative budget drifts more than best; every bracket sourced + confirmation-flagged; bracket-ordering guards)",
            oracle: "Internal consistency: the cited VRW bracket cross-checked against CaiAccelerometer::accel_asd physics + raw dynamic range computed from the fringe-ambiguity limit; numbers are MODELLED literature-survey brackets (needs_source_confirmation), no device validated, no validation halo",
            oracle_kind: InternalConsistency,
            status: Modelled,
        },
        // ── Honestly partner-owned gaps (no code, by design) ──────────────────
        VerificationItem {
            requirement: "Spacecraft bus engineering (AOCS/thermal/structures/propulsion/power)",
            capability: "Not provided — Kshana is a navigation-performance simulator, not a bus house",
            module: "",
            tests: "",
            oracle: "",
            oracle_kind: NoneKind,
            status: PartnerOwned,
        },
        VerificationItem {
            requirement: "Navigation RF payload & antenna hardware design",
            capability: "Not provided — Kshana models signal performance, not payload/antenna hardware",
            module: "",
            tests: "",
            oracle: "",
            oracle_kind: NoneKind,
            status: PartnerOwned,
        },
        VerificationItem {
            requirement: "Quantum payload hardware design & maturation",
            capability: "Not provided — performance models only; cold-atom/clock hardware is a partner's",
            module: "",
            tests: "",
            oracle: "",
            oracle_kind: NoneKind,
            status: PartnerOwned,
        },
        VerificationItem {
            requirement: "Flight-hardware product assurance (radiation/EEE/MAIT)",
            capability: "Not provided — Kshana speaks to software PA only; flight PA is a partner's",
            module: "",
            tests: "",
            oracle: "",
            oracle_kind: NoneKind,
            status: PartnerOwned,
        },
        VerificationItem {
            requirement: "Lunar coordinate time",
            capability: "Relativistic Earth-Moon clock-rate (LTC/TCL) + TT/TAI/UTC chaining + ensemble",
            module: "lunar_time",
            tests: "lunar_time::tests (closed-form rate; round-trip); tests/lunar_coordinate_time_reference.rs (LTC self-potential & secular-rate terms vs published Ashby & Patla 2024 values + geocentric Moon speed vs JPL DE440)",
            oracle: "Ashby & Patla 2024, 'A Relativistic Framework to Estimate Clock Rates on the Moon', Astronomical Journal 167:149 (NIST; basis for the IAU/IAG LunaNet LTC): Moon-surface self-potential L_m = 3.13881e-11 and secular total 56.02 µs/day matched as published numeric values; geocentric Moon speed cross-checked vs JPL DE440 (de440s.bsp via SPICE)",
            oracle_kind: OracleKind::ExternalDataset,
            status: VerificationStatus::Validated,
        },
        VerificationItem {
            requirement: "Lunar geodetic VLBI",
            capability: "Near-field VLBI delay for an Earth baseline observing a lunar beacon + partials",
            module: "lunar_vlbi",
            tests: "lunar_vlbi::tests (far-field limit matches delta_dor; near-field correction; FD partials)",
            oracle: "Plane-wave delta_dor (same-codebase) in the far-field limit; finite-difference partials",
            oracle_kind: OracleKind::ReferenceImpl,
            status: VerificationStatus::Modelled,
        },
        VerificationItem {
            requirement: "Lunar joint multi-technique OD + clock",
            capability: "Batch fusion of VLBI + lunar-local range + inter-sat range to recover station+constellation positions and clocks",
            module: "lunar_combination",
            tests: "lunar_combination::tests (recovers simulated truth; VLBI restores station 3-D observability; deterministic); tests/lunar_joint_multi_technique_od_reference.rs (6 geometries × 16 params, 31 obs each, vs Orekit 12.2 / Hipparchus Levenberg-Marquardt on identical observations; recovered state worst |Δ| 1.4e-8 m)",
            oracle: "Recovery of an injected simulated truth + NEES covariance consistency (internal); the underlying batch-LS estimator primitive is additionally cross-checked against Orekit 12.2 / Hipparchus Levenberg-Marquardt on identical observations (ReferenceImpl). The joint multi-technique solve as a whole stays MODELLED — the frame/VLBI sub-models are validated separately",
            oracle_kind: OracleKind::ReferenceImpl,
            status: VerificationStatus::Modelled,
        },
        VerificationItem {
            requirement: "Lunar reference-frame realisation",
            capability: "7-parameter Helmert datum fit + ICRF orientation tie from a network of points",
            module: "lunar_frame_realise",
            tests: "lunar_frame_realise::tests (recovers injected Helmert transform); tests/lunar_reference_frame_realisation_reference.rs (14 cases vs an independent closed-form Umeyama-SVD solver; worst |Δ| translation 2.0e-5 m, rotation 5.3e-12 rad, scale 9.3e-2 ppb, post-fit RMS 6.1e-9 m)",
            oracle: "Independent closed-form weighted Umeyama (Horn) similarity-transform solver (numpy/scipy SVD-based; Umeyama 1991 IEEE TPAMI, Horn 1987 JOSA A) — a different algorithm from kshana's iterative Gauss–Newton fit, reaching the same uniquely-defined weighted-LS optimum on byte-identical point networks",
            oracle_kind: OracleKind::ExternalDataset,
            status: VerificationStatus::Validated,
        },
        VerificationItem {
            requirement: "Lunar navigation service volume",
            capability: "Moonlight-class lunar DOP / coverage / availability + generalised lunar ARAIM protection levels over a service volume",
            module: "lunar_service",
            tests: "lunar_service::tests (DOP reuses the validated kernel; PL reduces to the south-pole case); tests/lunar_navigation_service_volume_reference.rs (per-satellite MCI position to <1e-3 m + EXACT visible-satellite set over the full grid×epoch sweep vs ANISE 0.10.2)",
            oracle: "Independent third-party authority ANISE 0.10.2 astro::Orbit Keplerian propagator (Nyx Space, MPL-2.0) — an equinoctial two-body code path distinct from kshana's Newton-Raphson Kepler; per-satellite MCI position agrees to <1e-3 m and the derived visible-satellite count/set matches exactly at every grid point. The DOP kernel is gnss_lib_py-validated; integrity uses published LunaNet/LCNS parameters",
            oracle_kind: OracleKind::ExternalDataset,
            status: VerificationStatus::Validated,
        },
        VerificationItem {
            requirement: "Lunar differential PNT",
            capability: "NovaMoon-class differential reference station: common-mode cancellation + baseline-growing residual + DGNSS protection levels",
            module: "lunar_dpnt",
            tests: "lunar_dpnt::tests (clock common-mode cancels exactly; residual grows with baseline; reuses SBAS PL); tests/lunar_differential_pnt_reference.rs (single-difference residual + WLS position solve vs RTKLIB's lsq() compiled from C source)",
            oracle: "Differential error-cancellation identity + reuse of the DO-229E SBAS PL machinery; the single-difference + WLS solve is additionally cross-checked against RTKLIB's lsq()/matinv() (Takasu, BSD-2-Clause, compiled C) — independent solver code, but the same first-order LOS-difference algebra, so still InternalConsistency",
            oracle_kind: OracleKind::InternalConsistency,
            status: VerificationStatus::Modelled,
        },
        VerificationItem {
            requirement: "Lunar interoperability export",
            capability: "LunaNet/IOAG-aligned lunar frame + time + ephemeris export (CCSDS OEM + KIF) with round-trip conformance",
            module: "lunar_interop",
            tests: "lunar_interop::tests (OEM carries lunar REF_FRAME/TIME_SYSTEM; time metadata round-trips; KIF envelope); tests/lunar_interoperability_export_reference.rs (kshana's emitted lunar OEM re-parsed by the independent `oem` Python library: REF_FRAME/TIME_SYSTEM/CENTER tokens + per-epoch state to format precision; a corrupted export is rejected)",
            oracle: "kshana's lunar OEM export re-parsed by the independent third-party `oem` library (R. J. Anderson): frame/time tokens and per-epoch state agree to write precision (1 mm / 1e-9 km/s) and a dropped-TIME_SYSTEM export is rejected — a structural interchange round-trip; the lunar frame/time physical semantics are validated by their own rows, so this stays MODELLED",
            oracle_kind: OracleKind::InternalConsistency,
            status: VerificationStatus::Modelled,
        },
        // ── Resilience scoring & instability study ────────────────────────────
        VerificationItem {
            requirement: "PNT-resilience framework-aligned scoring",
            capability: "Per-dimension sub-scores over DHS RPCF categories, RethinkPNT RDRR functions and Yang criteria, each tagged Modelled with its driver; tentative RPCF Level with a bounded-degradation gate. Simulation-derived self-assessment, never certification.",
            module: "resilience::arch, resilience::score, resilience::diversity, resilience::timeline",
            tests: "resilience::score::tests (monotonicity, composite bounds, level cap, modelled-provenance); resilience::diversity::tests (inverse-Simpson, common-mode, SPOF)",
            oracle: "Hand-derived per-metric formulas: inverse-Simpson diversity, weighted-mean composite, bounded/unbounded timeline durations, weakest-link Level ladder",
            oracle_kind: InternalConsistency,
            status: Modelled,
        },
        VerificationItem {
            requirement: "Resilience-score decision-instability study",
            capability: "Quantifies how a single composite score / RPCF Level reorders architectures under a defensible weighting simplex and a threat ensemble (top-1 flip rate, Kendall-tau dispersion, Level-flip rate, rank ranges); declared-vs-measured and diversity-collapse analyses.",
            module: "resilience::stats, resilience::study, resilience::panel",
            tests: "resilience::stats::tests (Kendall-tau hand example, Dirichlet simplex, flip-rate); resilience::study::tests (stability control, instability witness, declared-vs-measured, diversity collapse)",
            oracle: "Closed-form rank-statistics identities (tau in [-1,1] with hand-computed values; deterministic seeded Dirichlet) and constructed stable/unstable witnesses",
            oracle_kind: InternalConsistency,
            status: Modelled,
        },
        VerificationItem {
            requirement: "Demonstration representativeness & gaps-to-flight",
            capability: "Per-result honesty ledger qualifying a demonstration output: its external anchors, modelled assumptions, gaps-to-flight and representative TRL band, with invariants enforced (Validated requires an external anchor; Modelled requires a gap and cannot claim above TRL 4).",
            module: "representativeness",
            tests: "representativeness::tests (validated-needs-external-anchor, modelled-needs-gap, modelled-TRL-ceiling, malformed-band, JSON fields)",
            oracle: "Closed-form invariants mapping to the 'representativeness justified + gaps-to-flight identified' compliance discipline; tied to the verification status/oracle-kind boundary",
            oracle_kind: InternalConsistency,
            status: Modelled,
        },
        VerificationItem {
            requirement: "Quantum-vs-classical trade evidence (common shape)",
            capability: "One reproducible TradeEvidence object (fixed frame: scenario+seed+engine; common per-FoM quantum-vs-classical values with polarity-correct benefit, optional 95% CI, validated/modelled label) carrying a representativeness record, so every quantum-PNT vertical reports the trade the same honest way.",
            module: "qtrade",
            tests: "qtrade::tests (benefit polarity higher/lower-is-better, wraps a real TradeResult faithfully, dishonest evidence rejected, validated-FoM needs external anchor, deterministic JSON)",
            oracle: "Closed-form benefit/winner identities + faithful wrap of the existing quantum_trade::TradeResult; honesty tied to the representativeness ledger and verification labels",
            oracle_kind: InternalConsistency,
            status: Modelled,
        },
        VerificationItem {
            requirement: "Quantum device error-model library",
            capability: "Device cards (optical/trapped-ion/mercury-ion + classical clocks reused from holdover/clock_state; cold-atom interferometer; classical + entanglement/single-photon time-transfer links) each carrying a representativeness record; the entanglement link adds a shot-limited timing-precision model (~jitter/sqrt(R*tau), dark-count penalty, systematic floor).",
            module: "quantum_devices",
            tests: "quantum_devices::tests (clock cards honest+ordered; entanglement precision ~1/sqrt(tau); detected rate -10x/10dB; dark counts degrade; systematic floor bounds; card modelled+valid)",
            oracle: "Reused clock/CAI coefficients (holdover/clock_state, published values) + closed-form shot-noise/loss identities for the entanglement link",
            oracle_kind: InternalConsistency,
            status: Modelled,
        },
        VerificationItem {
            requirement: "Trusted quantum timing (time transfer + secure dissemination + anomaly)",
            capability: "End-to-end quantum vs classical time-transfer chain (clock coast + link precision in quadrature), a reused timing protection level, a delay/replay-attack security FoM (1-P_md) and a clock-anomaly detection probability + CUSUM latency, emitted as honest TradeEvidence with a representativeness record.",
            module: "timetransfer_chain",
            tests: "timetransfer_chain::tests (precision improves with integration; quantum can win AND lose; PL finite-positive; security FoM in [0,1] and grows with attack delay; anomaly Pd monotone; trade is_honest)",
            oracle: "Closed-form quadrature budget over reused validated kernels (ADEV vs Stable32/NIST; TPL bound; detection analytic_pd/pmd); honesty tied to the representativeness ledger",
            oracle_kind: InternalConsistency,
            status: Modelled,
        },
        VerificationItem {
            requirement: "GNSS-free quantum navigation",
            capability: "Quantum (cold-atom interferometer) vs classical navigation-grade INS dead-reckoning over a GNSS outage: position-error growth, holdover to a position threshold, and the quantum-vs-classical trade as honest TradeEvidence; honest observability note (bias unobservable without a fix, so error grows).",
            module: "quantum_nav_od",
            tests: "quantum_nav_od::tests (quantum beats classical over a long outage; advantage is outage-dependent; trade is_honest); tests/gnss_free_quantum_navigation_reference.rs (dead-reckoning position growth vs an independent Octave double-integration + the Freier-2016 published noise anchor)",
            oracle: "Reused inertial budgets cross-checked against an independent Octave double-integration of the same dead-reckoning ODE (different runtime, shared model → ReferenceImpl) plus the Freier-2016 published short-term noise as a one-sided anchor; the quantum-vs-classical composite stays MODELLED",
            oracle_kind: InternalConsistency,
            status: Modelled,
        },
        VerificationItem {
            requirement: "Fault/anomaly detection for quantum PNT systems",
            capability: "Labelled quantum-fault catalog (clock frequency-jump/drift/lock-loss; sensor bias-step/dropout), a detection-statistic ROC AUC with a bootstrap CI, and a minimum-detectable fault at a fixed false-alarm rate; a quantum-clock-aided monitor detects smaller faults than a classical one, emitted as honest TradeEvidence.",
            module: "quantum_faults",
            tests: "quantum_faults::tests (analytic AUC known values; empirical bootstrap AUC brackets the closed form; quantum detects smaller faults / higher AUC; advantage vanishes for huge faults; 5-class catalog; trade is_honest)",
            oracle: "Closed-form Gaussian AUC = Phi(mu/(sigma*sqrt2)) cross-checked against the externally-validated eval_stats::bootstrap_auc_ci (vs scikit-learn) + detection analytic thresholds",
            oracle_kind: InternalConsistency,
            status: Modelled,
        },
        VerificationItem {
            requirement: "Torque-free rigid-body attitude dynamics",
            capability: "Euler's rotational equations of motion (I ω̇ = τ − ω × Iω, principal-axis and general inertia tensor) coupled to quaternion attitude kinematics (q̇ = ½ q ⊗ ω) and propagated with a fixed-step RK4 integrator that re-normalises the quaternion each step",
            module: "attitude_dynamics",
            tests: "attitude_dynamics::tests (apply/solve inverse, spherical-top zero torque, principal-axis fixed point, short-run energy+momentum conservation, q̇=½q⊗ω, symmetric-top rate sign + body-cone precession); tests/attitude_dynamics_reference.rs (200 000-step torque-free runs: |q|=1 to 1e-10, kinetic energy T=½ωᵀIω conserved to 1e-9 rel, |Iω| and the inertial momentum vector conserved to 1e-9/1e-8 rel, both on a tri-axial and a general non-diagonal inertia; symmetric-top oblate + prolate body-cone precession reproduced to 1e-6 vs the analytic λ=ω₃(I_a−I_t)/I_t)",
            oracle: "Physical conservation laws of the free rigid body (quaternion-norm, rotational kinetic energy, body-frame and inertial angular-momentum) plus the closed-form symmetric-top body-cone precession rate (Goldstein §5.6–5.7; Wertz §16) — these are self-consistency invariants the integrator must preserve, NOT an external dataset, so the row stays InternalConsistency. MODELLED first-principles dynamics — no flexible-body / control-loop / external-torque environment",
            oracle_kind: InternalConsistency,
            status: Modelled,
        },
        VerificationItem {
            requirement: "Clohessy–Wiltshire / Hill relative-motion dynamics",
            capability: "Linearised relative motion of a chaser about a target on a circular reference orbit in the LVLH frame (ẍ−2nẏ−3n²x=0, ÿ+2nẋ=0, z̈+n²z=0), solved by the closed-form 6×6 state-transition matrix Φ(n,t) (Clohessy–Wiltshire 1960; Vallado Alg. 48), with the bounded relative-orbit condition ẏ₀=−2n·x₀",
            module: "cw_dynamics",
            tests: "cw_dynamics::tests (Φ(0)=I, cross-track decoupled SHM); tests/cw_dynamics_reference.rs (closed-form Φ vs an independent fixed-step RK4 integration of the same Hill ODEs to <1e-6 over a third of an orbit; Φ(t)Φ(−t)=I to 1e-9; the bounded condition ẏ₀=−2n·x₀ closes the full state after one period to 1e-9 with no secular along-track drift over 10 orbits; a pure radial offset drifts the analytic −12π·x₀ per orbit)",
            oracle: "The closed-form CW state-transition matrix cross-checked against an independent numeric integration of the same linearised equations of motion, plus the analytic relative-orbit invariants (time-reversibility Φ(t)Φ(−t)=I, the −2n·x₀ bounded-orbit condition, the −12π·x₀ per-orbit secular drift, decoupled cross-track SHM) — self-consistency checks of the linear dynamics, NOT an external dataset, so the row stays InternalConsistency. MODELLED linear relative motion on a circular reference orbit — no eccentricity (Tschauner–Hempel), J2, or differential-drag terms",
            oracle_kind: InternalConsistency,
            status: Modelled,
        },
        VerificationItem {
            requirement: "TDOA/FDOA passive emitter geolocation",
            capability: "Locate an emitter (jammer/spoofer, or an opportunistic source for reverse-PNT) from time-difference-of-arrival across a receiver network — the τᵢ=(Rᵢ−R₀)/c hyperboloid intersection solved by Gauss–Newton least squares — and, adding frequency-difference-of-arrival (range-rate differences) with moving receivers, jointly recover position and velocity; with the Cramér–Rao lower bound on the position covariance from the measurement geometry",
            module: "geolocation",
            tests: "geolocation::tests (noiseless TDOA forward→inverse to 1e-6 m; J·CRLB=I with a symmetric PD covariance; the CRLB position-variance trace is non-increasing when a receiver is added; joint TDOA+FDOA recovers a moving emitter's position+velocity; <4 receivers rejected); tests/geolocation_reference.rs (round trips over four geometries with a 3-D-diverse network; the Gauss–Newton estimator attains its Cramér–Rao bound — empirical error covariance tracks the analytic bound over 4000 Monte-Carlo trials)",
            oracle: "Self-consistency of the estimator and geometry: forward→inverse round trips, the Fisher/CRLB identity J·CRLB=I, GDOP monotonicity, and the estimator attaining its own Cramér–Rao bound under Monte-Carlo noise — internal-consistency checks, NOT an external dataset, so the row stays InternalConsistency. MODELLED passive geolocation — point-source line-of-sight model; no multipath / NLOS, receiver-clock-bias, or atmospheric-refraction terms",
            oracle_kind: InternalConsistency,
            status: Modelled,
        },
        VerificationItem {
            requirement: "Wahba/TRIAD/QUEST attitude determination",
            capability: "Optimal three-axis attitude from weighted vector observations (star/sun/magnetometer directions): the deterministic two-vector TRIAD, Davenport's q-method (the exact Wahba-loss minimiser — the optimal quaternion is the largest-eigenvalue eigenvector of the 4×4 Davenport matrix K, solved by a symmetric Jacobi eigensolve), and QUEST (Newton/secant root of K's characteristic equation seeded at Σ weights, then Gibbs-vector quaternion recovery)",
            module: "wahba",
            tests: "wahba::tests (A(identity quaternion)=I; the Jacobi eigensolver satisfies Kv=λv and preserves the trace on a known symmetric matrix; K is symmetric); tests/wahba_reference.rs (TRIAD and the q-method recover a known rotation from noiseless observations to <1e-10 rad with λ_max=Σ weights and zero Wahba loss; the q-method quaternion round-trips the library body→nav convention and yields a proper rotation; QUEST agrees with the optimal q-method on λ_max and attitude to <1e-7 rad; the q-method solution minimises the Wahba loss — every small perturbation raises it; the optimal estimator beats two-vector TRIAD in RMS attitude error over 2000 noisy Monte-Carlo trials)",
            oracle: "Self-consistency of the attitude estimators: closed-form recovery of a known rotation, the q-method/QUEST cross-check against each other and the optimal-loss property (the q-method is the exact Wahba minimiser, verified by perturbation), and the optimal estimator's statistical advantage over TRIAD under Monte-Carlo noise — internal-consistency checks, NOT an external dataset, so the row stays InternalConsistency. MODELLED point-direction attitude determination — unit-vector observations; no sensor field-of-view, measurement-bias, or temporal-correlation modelling, and QUEST is singular at a 180° rotation (the q-method covers that case)",
            oracle_kind: InternalConsistency,
            status: Modelled,
        },
        VerificationItem {
            requirement: "GNSS square-law acquisition detection statistics",
            capability: "Square-law (non-coherent) acquisition detector over a code-phase × Doppler search: false-alarm probability (central χ² with 2M dof), the threshold achieving a target P_fa (χ² CDF inverted by bisection), and detection probability (non-central χ² with non-centrality 2M·ρ for per-cell post-correlation SNR ρ), with the generalized Marcum Q-function Q_M(a,b)=1−F_{χ'²(2M,a²)}(b²)",
            module: "acquisition",
            tests: "acquisition::tests (Marcum-Q central case Q_1(0,b)=exp(−b²/2); the P_d=Q_M(√(2Mρ),√γ) identity; P_fa↔threshold round-trip across M and P_fa; ROC monotonicity — P_d rises with SNR, falls with threshold, P_d→P_fa as SNR→0; the non-coherent integration gain raises P_d at fixed P_fa; Marcum-Q monotone in a and b and bounded in [0,1])",
            oracle: "Self-consistency of the detector statistics over the engine's validated chi-square machinery (raim::chi2_cdf / noncentral_chi2_cdf): the Marcum-Q ↔ non-central-χ² identity, the closed-form central-case exponential, P_fa/threshold inversion, ROC ordering, and the integration gain are analytic detection-theory identities checked against those CDFs — internal-consistency checks, NOT an external dataset, so the row stays InternalConsistency. MODELLED per-cell square-law detector — no CFAR cell-averaging or code/Doppler-bin straddling loss",
            oracle_kind: InternalConsistency,
            status: Modelled,
        },
    ]
}

/// Count of rows by status.
#[derive(Clone, Copy, Debug, PartialEq, Eq, serde::Serialize)]
pub struct MatrixSummary {
    pub validated: usize,
    pub modelled: usize,
    pub partner_owned: usize,
    pub total: usize,
}

/// Summarise a matrix by status.
pub fn summarize(items: &[VerificationItem]) -> MatrixSummary {
    let mut s = MatrixSummary {
        validated: 0,
        modelled: 0,
        partner_owned: 0,
        total: items.len(),
    };
    for it in items {
        match it.status {
            VerificationStatus::Validated => s.validated += 1,
            VerificationStatus::Modelled => s.modelled += 1,
            VerificationStatus::PartnerOwned => s.partner_owned += 1,
        }
    }
    s
}

/// Render the matrix as a GitHub-flavoured Markdown table.
pub fn to_markdown(items: &[VerificationItem]) -> String {
    let mut out = String::new();
    out.push_str("| Requirement | Capability | Module | Tests | Oracle | Status |\n");
    out.push_str("|---|---|---|---|---|---|\n");
    for it in items {
        out.push_str(&format!(
            "| {} | {} | {} | {} | {} | {} |\n",
            it.requirement,
            it.capability,
            if it.module.is_empty() {
                "—"
            } else {
                it.module
            },
            if it.tests.is_empty() { "—" } else { it.tests },
            if it.oracle.is_empty() {
                "—"
            } else {
                it.oracle
            },
            it.status.tag(),
        ));
    }
    let s = summarize(items);
    out.push_str(&format!(
        "\n{} rows: {} externally validated, {} modelled, {} partner-owned.\n",
        s.total, s.validated, s.modelled, s.partner_owned
    ));
    out
}

/// Render the matrix as CSV (one header row + one row per item).
pub fn to_csv(items: &[VerificationItem]) -> String {
    let esc = |f: &str| {
        if f.contains(',') || f.contains('"') {
            format!("\"{}\"", f.replace('"', "\"\""))
        } else {
            f.to_string()
        }
    };
    let mut out = String::from("requirement,capability,module,tests,oracle,oracle_kind,status\n");
    for it in items {
        let kind = format!("{:?}", it.oracle_kind);
        out.push_str(&format!(
            "{},{},{},{},{},{},{}\n",
            esc(it.requirement),
            esc(it.capability),
            esc(it.module),
            esc(it.tests),
            esc(it.oracle),
            kind,
            it.status.tag(),
        ));
    }
    out
}

// ── Browsable-evidence artifacts (single source → JSON for the web ledger + docs) ──
//
// These turn the matrix into the artifacts the public site and docs link to, so a
// reader can click from "VALIDATED" through to the actual test, module source and
// committed provenance. The link helpers EXISTENCE-CHECK every path against the repo
// so the generated ledger never carries a dead link; the generator binary and the
// `verification_artifacts_doc_sync` test call these same functions, and that test
// pins the committed artifacts to the matrix (drift becomes a build failure). They
// touch the filesystem, so they are native-only (the wasm build reads the committed
// JSON, never regenerates it).
#[cfg(not(target_arch = "wasm32"))]
mod artifacts {
    use super::*;
    use std::path::Path;

    /// GitHub blob root the deep-links are built against.
    pub const REPO_BLOB_BASE: &str = "https://github.com/AshfordeOU/kshana/blob/main/";

    /// A source/test deep-link: repo-relative path + its GitHub blob URL.
    #[derive(serde::Serialize)]
    struct Link {
        path: String,
        url: String,
    }

    /// A committed-provenance pointer for a validated row, when one exists on disk.
    #[derive(serde::Serialize)]
    struct Fixture {
        path: String,
        url: String,
        notice_url: Option<String>,
    }

    /// One enriched ledger row: the raw matrix fields plus existence-checked links.
    #[derive(serde::Serialize)]
    struct LedgerRow {
        requirement: &'static str,
        capability: &'static str,
        status: &'static str,
        oracle_kind: String,
        oracle: &'static str,
        module: &'static str,
        tests: &'static str,
        module_links: Vec<Link>,
        test_links: Vec<Link>,
        fixture: Option<Fixture>,
    }

    #[derive(serde::Serialize)]
    struct Ledger {
        generated_from: &'static str,
        note: &'static str,
        repo_blob_base: &'static str,
        summary: MatrixSummary,
        rows: Vec<LedgerRow>,
    }

    /// Extract repo-relative `*.rs` paths (src/ tests/ examples/) from a free-text
    /// field. Unicode-safe: splits on whitespace / separators (the fields carry
    /// `×`, `Δ`, `≥`, …), so it never indexes mid-codepoint. A `tests/*` glob has no
    /// `.rs` suffix and is ignored.
    fn extract_rs_paths(field: &str) -> Vec<String> {
        let mut out: Vec<String> = Vec::new();
        for raw in
            field.split(|c: char| c.is_whitespace() || c == ',' || c == ';' || c == '(' || c == ')')
        {
            let tok = raw.trim();
            if tok.ends_with(".rs")
                && (tok.starts_with("tests/")
                    || tok.starts_with("src/")
                    || tok.starts_with("examples/"))
                && !out.iter().any(|p| p == tok)
            {
                out.push(tok.to_string());
            }
        }
        out
    }

    /// Candidate source-file paths for a `module` field (comma-separated module
    /// names, possibly `a::b` paths, possibly with a `(note)`). Both `src/x.rs` and
    /// `src/x/mod.rs` forms are offered; the caller keeps only those that exist.
    fn module_candidate_paths(module: &str) -> Vec<String> {
        let mut out: Vec<String> = Vec::new();
        let push = |p: String, out: &mut Vec<String>| {
            if !out.contains(&p) {
                out.push(p);
            }
        };
        for raw in module.split(',') {
            let mut name = raw.trim().to_string();
            if let Some(p) = name.find('(') {
                name.truncate(p);
            }
            let name = name.trim();
            if name.is_empty() {
                continue;
            }
            if name.ends_with(".rs") && (name.starts_with("src/") || name.starts_with("tests/")) {
                push(name.to_string(), &mut out);
                continue;
            }
            let rel = name.replace("::", "/");
            push(format!("src/{rel}.rs"), &mut out);
            push(format!("src/{rel}/mod.rs"), &mut out);
        }
        out
    }

    fn link_for(path: &str) -> Link {
        Link {
            path: path.to_string(),
            url: format!("{REPO_BLOB_BASE}{path}"),
        }
    }

    /// The committed fixture directory for a test, if one exists: `tests/<stem>.rs`
    /// maps to `tests/fixtures/<stem-without-_reference>/`, with its NOTICE if present.
    fn fixture_for(test_paths: &[String], repo_root: &Path) -> Option<Fixture> {
        for tp in test_paths {
            let stem = Path::new(tp).file_stem()?.to_str()?;
            let base = stem.strip_suffix("_reference").unwrap_or(stem);
            let rel = format!("tests/fixtures/{base}");
            if !repo_root.join(&rel).is_dir() {
                continue;
            }
            let notice_url = ["NOTICE", "NOTICE.md"]
                .iter()
                .map(|n| format!("{rel}/{n}"))
                .find(|p| repo_root.join(p).is_file())
                .map(|p| format!("{REPO_BLOB_BASE}{p}"));
            return Some(Fixture {
                path: rel.clone(),
                url: format!("{REPO_BLOB_BASE}{rel}"),
                notice_url,
            });
        }
        None
    }

    /// Render the matrix as the enriched JSON ledger the web UI consumes. Every link
    /// is existence-checked against `repo_root`, so no dead links are emitted.
    pub fn to_ledger_json(items: &[VerificationItem], repo_root: &Path) -> String {
        let rows: Vec<LedgerRow> = items
            .iter()
            .map(|it| {
                let module_links: Vec<Link> = module_candidate_paths(it.module)
                    .into_iter()
                    .filter(|p| repo_root.join(p).is_file())
                    .map(|p| link_for(&p))
                    .collect();
                let test_paths: Vec<String> = extract_rs_paths(it.tests)
                    .into_iter()
                    .filter(|p| repo_root.join(p).is_file())
                    .collect();
                let fixture = fixture_for(&test_paths, repo_root);
                LedgerRow {
                    requirement: it.requirement,
                    capability: it.capability,
                    status: it.status.tag(),
                    oracle_kind: format!("{:?}", it.oracle_kind),
                    oracle: it.oracle,
                    module: it.module,
                    tests: it.tests,
                    module_links,
                    test_links: test_paths.iter().map(|p| link_for(p)).collect(),
                    fixture,
                }
            })
            .collect();
        let ledger = Ledger {
            generated_from: "src/verification.rs::verification_matrix()",
            note: "Generated by `cargo run --bin gen_validation_artifacts` and pinned by \
                   tests/verification_artifacts_doc_sync.rs. Do not edit by hand.",
            repo_blob_base: REPO_BLOB_BASE,
            summary: summarize(items),
            rows,
        };
        // `Ledger` is static strings + `MatrixSummary` (usizes) + `Vec<LedgerRow>`, whose
        // fields are static strings / String / `Vec<Link>` / `Option<Fixture>` — no map
        // and no fallible custom `Serialize`, so JSON serialisation cannot fail.
        let mut s = serde_json::to_string_pretty(&ledger)
            .expect("Ledger (strings + numeric summary + row Vecs, no maps) always serialises");
        s.push('\n');
        s
    }

    /// Render the full 75-row matrix as a titled Markdown document (the browsable
    /// per-capability ledger in `docs/`). Wraps [`to_markdown`] with a generated-file
    /// header so both the generator and the sync test produce byte-identical output.
    pub fn to_verification_matrix_md(items: &[VerificationItem]) -> String {
        let s = summarize(items);
        let mut out = String::new();
        out.push_str("# Verification matrix\n\n");
        out.push_str(
            "<!-- Generated by `cargo run --bin gen_validation_artifacts` from \
             src/verification.rs; pinned by tests/verification_artifacts_doc_sync.rs. \
             Do not edit by hand. -->\n\n",
        );
        out.push_str(&format!(
            "The complete, machine-checked evidence ledger: **{} rows — {} VALIDATED, \
             {} MODELLED, {} PARTNER**. A row may be VALIDATED only with an independent \
             external oracle (the matrix invariant tests enforce this). The same data, \
             with clickable per-row links to each test, module and committed fixture, is \
             the *Validation ledger* on https://kshana.dev. See [MODELLED-RATIONALE.md]\
             (MODELLED-RATIONALE.md) for why each Modelled row is not externally validated.\n\n",
            s.total, s.validated, s.modelled, s.partner_owned
        ));
        out.push_str(&to_markdown(items));
        out
    }

    /// Render the Modelled rows as a rationale table: each carries the honest reason
    /// it is *not* externally validated (its [`OracleKind`] + the oracle text).
    pub fn to_modelled_rationale_md(items: &[VerificationItem]) -> String {
        let why = |k: OracleKind| -> &'static str {
            match k {
                OracleKind::ReferenceImpl => {
                    "checked against a separate implementation in this same codebase — \
                     independent of the unit under test, but not externally authoritative"
                }
                OracleKind::InternalConsistency => {
                    "checked against its own closed-form / analytic identity — catches \
                     transcription and coefficient errors, but is not an external oracle"
                }
                OracleKind::ExternalDataset => {
                    "a sub-claim is externally checked, but the whole capability composes \
                     modelled pieces, so the capability stays Modelled"
                }
                OracleKind::NoneKind => "no oracle",
            }
        };
        let mut out = String::new();
        out.push_str("# Modelled capabilities — rationale\n\n");
        out.push_str(
            "<!-- Generated by `cargo run --bin gen_validation_artifacts` from \
             src/verification.rs; pinned by tests/verification_artifacts_doc_sync.rs. \
             Do not edit by hand. -->\n\n",
        );
        out.push_str(
            "These capabilities are implemented from published or first-principles physics \
             with tests, but are **honestly labelled MODELLED** — not checked against an \
             independent external oracle to a stated tolerance. The matrix invariant tests \
             enforce that only `ExternalDataset`-backed rows may be VALIDATED, so nothing \
             here can be silently promoted. Each row states why it stays Modelled.\n\n",
        );
        out.push_str(
            "| Requirement | Capability | Oracle kind | Why it stays Modelled | Module | Tests |\n",
        );
        out.push_str("|---|---|---|---|---|---|\n");
        for it in items
            .iter()
            .filter(|i| i.status == VerificationStatus::Modelled)
        {
            out.push_str(&format!(
                "| {} | {} | {:?} | {} — {} | {} | {} |\n",
                it.requirement,
                it.capability,
                it.oracle_kind,
                why(it.oracle_kind),
                if it.oracle.is_empty() {
                    "—"
                } else {
                    it.oracle
                },
                if it.module.is_empty() {
                    "—"
                } else {
                    it.module
                },
                if it.tests.is_empty() { "—" } else { it.tests },
            ));
        }
        let s = summarize(items);
        out.push_str(&format!(
            "\n{} capabilities labelled MODELLED.\n",
            s.modelled
        ));
        out
    }
}

#[cfg(not(target_arch = "wasm32"))]
pub use artifacts::{
    to_ledger_json, to_modelled_rationale_md, to_verification_matrix_md, REPO_BLOB_BASE,
};

#[cfg(test)]
mod tests {
    use super::*;

    // ── Honesty invariant (the central one): Validated ⇒ EXTERNAL oracle ──────
    // This is what stops an internal algebraic identity being dressed as a
    // validation — a Validated row must carry an independent external oracle.
    #[test]
    fn validated_rows_require_an_external_oracle() {
        for it in verification_matrix() {
            if it.status == VerificationStatus::Validated {
                assert_eq!(
                    it.oracle_kind,
                    OracleKind::ExternalDataset,
                    "Validated row '{}' must carry an ExternalDataset oracle, not {:?}",
                    it.requirement,
                    it.oracle_kind
                );
                assert!(
                    !it.module.is_empty() && !it.tests.is_empty() && !it.oracle.is_empty(),
                    "Validated row '{}' must name module+test+oracle",
                    it.requirement
                );
            }
        }
    }

    // ── Modelled ⇒ has module+tests and a real (non-None) oracle kind ─────────
    #[test]
    fn modelled_rows_have_module_tests_and_an_oracle_kind() {
        for it in verification_matrix() {
            if it.status == VerificationStatus::Modelled {
                assert!(
                    !it.module.is_empty() && !it.tests.is_empty(),
                    "Modelled row '{}' must name module+tests",
                    it.requirement
                );
                assert_ne!(
                    it.oracle_kind,
                    OracleKind::NoneKind,
                    "Modelled row '{}' must have a real oracle kind",
                    it.requirement
                );
            }
        }
    }

    // ── PartnerOwned ⇒ no code/test/oracle, kind None (a real gap) ─────────────
    #[test]
    fn partner_rows_claim_nothing() {
        for it in verification_matrix() {
            if it.status == VerificationStatus::PartnerOwned {
                assert!(
                    it.module.is_empty() && it.tests.is_empty() && it.oracle.is_empty(),
                    "PartnerOwned row '{}' must not claim any implementation",
                    it.requirement
                );
                assert_eq!(it.oracle_kind, OracleKind::NoneKind);
            }
        }
    }

    // ── Only partner rows may use the None oracle kind ────────────────────────
    #[test]
    fn none_oracle_kind_only_on_partner_rows() {
        for it in verification_matrix() {
            if it.oracle_kind == OracleKind::NoneKind {
                assert_eq!(
                    it.status,
                    VerificationStatus::PartnerOwned,
                    "row '{}' has NoneKind oracle but is not PartnerOwned",
                    it.requirement
                );
            }
        }
    }

    // ── The matrix records the four audited hardware gaps honestly ────────────
    #[test]
    fn the_four_partner_gaps_are_present() {
        let n = verification_matrix()
            .iter()
            .filter(|it| it.status == VerificationStatus::PartnerOwned)
            .count();
        assert_eq!(
            n, 4,
            "the four partner-owned hardware/PA gaps must be recorded"
        );
    }

    // ── Requirements are unique (no duplicate rows) ───────────────────────────
    #[test]
    fn requirements_are_unique() {
        let m = verification_matrix();
        for i in 0..m.len() {
            for j in (i + 1)..m.len() {
                assert_ne!(m[i].requirement, m[j].requirement, "duplicate requirement");
            }
        }
    }

    // ── Summary counts add up; a non-trivial externally-validated core exists ──
    #[test]
    fn summary_counts_are_consistent() {
        let m = verification_matrix();
        let s = summarize(&m);
        assert_eq!(s.validated + s.modelled + s.partner_owned, s.total);
        assert_eq!(s.total, m.len());
        // A modest floor — and, unlike a bare count, adding an *overclaimed*
        // Validated row cannot satisfy it because of the external-oracle invariant.
        assert!(
            s.validated >= 4,
            "expected a real externally-validated core"
        );
    }

    // ── Renderers produce a row per item ──────────────────────────────────────
    #[test]
    fn renderers_have_a_row_per_item() {
        let m = verification_matrix();
        let csv = to_csv(&m);
        assert_eq!(csv.lines().count(), m.len() + 1); // header + one per item
        let md = to_markdown(&m);
        assert!(md.contains("| Requirement |"));
        assert!(md.contains("VALIDATED"));
        assert!(md.contains("PARTNER"));
    }
}
