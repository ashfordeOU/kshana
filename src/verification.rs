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
            requirement: "Extended-range frequency stability (Theo1 / TOTDEV)",
            capability: "Theo1 and total deviation (TOTVAR) — extended-range long-tau stability estimators reaching ~75% of the record where the Allan deviation gives out near ~50%; the bias-removed ThêoH hybrid (allan::theoh_curve) built on them stays MODELLED",
            module: "allan",
            tests: "tests/theo1_totvar_reference.rs (Theo1 + TOTDEV on the NIST SP 1065 §12.4 1000-point LCG data set, 6 + 6 averaging factors vs allantools 2024.06 to <1e-9); allan::tests (white-FM closed-form tracking; TOTVAR=ADEV identity at m=1; Theo1/TOTVAR phase/frequency-offset invariance; -1/2 white-FM slope)",
            oracle: "allantools 2024.06 — an independent third-party frequency-stability library — theo1 (NIST SP 1065 eq 30) and totdev (NIST SP 1065 eq 25) on the hermetic NIST SP 1065 §12.4 LCG data set; regenerable offline via tests/fixtures/theo1_totvar/generate_theo1_totvar_reference.py",
            oracle_kind: ExternalDataset,
            status: Validated,
        },
        VerificationItem {
            requirement: "Maximum Time Interval Error (MTIE) — telecom wander metric",
            capability: "MTIE(τ): the maximum peak-to-peak time-error swing over any sliding window of τ = m·tau0, the ITU-T G.810/G.823/G.8261 wander statistic synchronisation-network limits (MTIE masks) are written against — an extremal (max/min) figure distinct from the RMS Allan family",
            module: "allan (mtie, mtie_curve)",
            tests: "tests/mtie_reference.rs (MTIE on the hermetic NIST SP 1065 §12.4 1000-point LCG phase series, 9 averaging factors m=1..256 vs allantools 2024.06 mtie to <1e-9, observed ≤4e-15); allan::tests (hand-derived peak-to-peak; monotone non-decreasing in τ; exact a·m on a pure ramp)",
            oracle: "allantools 2024.06 — an independent third-party frequency-stability library — mtie() on the hermetic NIST SP 1065 §12.4 LCG phase series; MTIE is a pure max/min statistic, so the estimator output is bit-exact against allantools on the identically-built phase array (the committed 15-significant-figure reference constants sit within 1 ULP). Regenerable offline via tests/fixtures/mtie/generate_mtie_reference.py",
            oracle_kind: ExternalDataset,
            status: Validated,
        },
        VerificationItem {
            requirement: "Modified Allan / Time deviation (MDEV / TDEV)",
            capability: "MDEV(τ): the overlapping modified Allan deviation (second-difference sliding-window estimator that separates white- from flicker-phase noise), and TDEV(τ) = τ/√3·MDEV(τ), the ITU-T G.811/G.812/G.823 time-domain wander statistic the sync masks are written against",
            module: "allan (modified_adev, time_deviation)",
            tests: "tests/mdev_tdev_reference.rs (MDEV + TDEV on the hermetic NIST SP 1065 §12.4 1000-point LCG phase series, 8 averaging factors m=1..200 vs allantools 2024.06 mdev/tdev to <1e-9 relative, plus the τ/√3 identity on the real series); allan::tests (white-FM −1/2 slope; hand-derived MDEV small case)",
            oracle: "allantools 2024.06 — an independent third-party frequency-stability library — mdev() and tdev() on the hermetic NIST SP 1065 §12.4 LCG phase series (same series as the Theo1/TOTDEV/MTIE rows), computing the same uniquely-defined estimators; matched to <1e-9 relative. Regenerable offline via tests/fixtures/mdev_tdev/generate_mdev_tdev_reference.py. (The data-gated phasedat_reference.rs also checks these against Stable32 to 1e-3; this is the tight, always-on hermetic cross-check)",
            oracle_kind: ExternalDataset,
            status: Validated,
        },
        VerificationItem {
            requirement: "Optical-clock frequency stability on a real measured curve",
            capability: "Power-law (white-FM + red-noise-floor) NNLS recovery from a published measured ⁸⁸Sr optical-clock-transition Allan deviation — reproducing σ_y(τ) and the headline 4.7e-16/√τ short-τ scaling with a genuine measured long-τ floor, rather than the synthesised optical-class floor holdover.rs otherwise assumes",
            module: "quantum_trade (qparams_from_adev_curve), powerlaw",
            tests: "tests/optical_clock_adev_reference.rs (Norcia et al. ⁸⁸Sr tweezer-clock σ_y(τ), 8 averaging times 0.92–117.76 s vendored verbatim under CC-BY-4.0: NNLS reconstructs the curve to ~10% RMS / ≤21% worst point; recovered √q_wf = 4.33e-16 matches the published 4.7e-16/√τ; q_rw > 0 measured red-noise floor)",
            oracle: "Norcia, Young, Eckner, Oelker, Ye, Kaufman, Science 366:93 (2019), Fig. 4 measured ADEV; curve vendored verbatim from Zenodo 10.5281/zenodo.3382347 (CC-BY-4.0). Scoped to reproducing the published measured stability curve — the clock-class holdover-to-threshold device figures stay MODELLED",
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
            oracle: "SciPy 1.17.0 (scipy.stats.chi2/.norm/.ncx2 + optimize.brentq) — independent library (Cephes/Boost), a different algorithm from Kshana's incomplete-gamma series; matched to ≤1e-6 rel. Kernel only. The ARAIM MHSS P_HMI budget *allocation* is no longer without a published numeric oracle — the WG-C ARAIM Technical Subgroup's own worked example now backs the separate 'ARAIM MHSS protection levels against published reference vectors' row, matched at the reference's own TOL_PL = 5e-2 m — so this row's scope is the statistical kernel and that row carries the allocation (see docs/ARAIM_REFERENCE.md)",
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
            requirement: "MCDA priority-derivation kernel (AHP eigenvector / consistency ratio)",
            capability: "Analytic Hierarchy Process priority weights = normalised principal (Perron) eigenvector of a reciprocal pairwise-comparison matrix by power iteration, with the Saaty Consistency Index / Consistency Ratio and the CR<0.10 acceptance gate",
            module: "mcda::ahp",
            tests: "tests/mcda_ahp_reference.rs (Saaty 1980 Random Index table n=1..10 EXACT; priority vector + λ_max + CR vs SciPy/LAPACK eig on a consistent 3×3 and inconsistent 3×3 / 4×4, matched to <1e-9)",
            oracle: "Saaty (1980) canonical Random Index table (RI(5)=1.12) reproduced exactly + SciPy/LAPACK scipy.linalg.eig (BSD-3-Clause) as an independent eigensolver computing the same uniquely-defined Perron eigenvector/eigenvalue, matched to <1e-9. The Pareto / sensitivity / MAUT decision layer built on this kernel stays MODELLED (the WSM/WPM/TOPSIS/VIKOR/PROMETHEE/ELECTRE aggregators are separately externally validated — see the rows below)",
            oracle_kind: ExternalDataset,
            status: Validated,
        },
        VerificationItem {
            requirement: "MCDA weighted-aggregation kernels (WSM / WPM)",
            capability: "Weighted Sum Model (min–max-normalised additive aggregate + ranking) and Weighted Product Model (sum-normalised, reciprocal-for-cost multiplicative aggregate) — the two value-aggregation trade-study scorers",
            module: "mcda::wsm, mcda::wpm",
            tests: "tests/mcda_wsm_reference.rs (WSM scores + ranking) and tests/mcda_wpm_reference.rs (WPM scores + ranking), each vs pymcdm to <1e-9 on a fixed 4×3 benefit/cost decision matrix",
            oracle: "pymcdm (methods.WSM + normalizations.minmax_normalization; methods.WPM + normalizations.sum_normalization) — an independent, widely-used third-party Python MCDA library computing the same uniquely-defined weighted aggregates; matched to <1e-9. Regenerable offline via tests/fixtures/mcda_wsm/ and tests/fixtures/mcda_wpm/. Garbage-in-garbage-out on the inputs; the sensitivity/robustness layer stays MODELLED",
            oracle_kind: ExternalDataset,
            status: Validated,
        },
        VerificationItem {
            requirement: "MCDA distance-to-ideal ranking (TOPSIS)",
            capability: "Technique for Order of Preference by Similarity to Ideal Solution — min–max normalisation, weighted positive/negative ideal solutions, relative closeness Cᵢ = d⁻/(d⁺+d⁻) and ranking",
            module: "mcda::topsis",
            tests: "tests/mcda_topsis_reference.rs (closeness coefficients + ranking vs pymcdm to <1e-9 on a fixed 4×3 benefit/cost matrix)",
            oracle: "pymcdm methods.TOPSIS + normalizations.minmax_normalization — an independent third-party MCDA library computing the same uniquely-defined closeness coefficients; matched to <1e-9. Regenerable offline via tests/fixtures/mcda_topsis/generate_topsis_reference.py",
            oracle_kind: ExternalDataset,
            status: Validated,
        },
        VerificationItem {
            requirement: "MCDA compromise ranking (VIKOR)",
            capability: "VlseKriterijumska Optimizacija — group-utility Sᵢ, individual-regret Rᵢ and the compromise index Qᵢ at strategy weight v=0.5, with the lower-is-better ranking",
            module: "mcda::vikor",
            tests: "tests/mcda_vikor_reference.rs (Q index + ranking vs pymcdm to <1e-9 on a fixed 4×3 benefit/cost matrix)",
            oracle: "pymcdm methods.VIKOR(v=0.5) — an independent third-party MCDA library computing the same uniquely-defined range-normalised S/R/Q aggregation; matched to <1e-9. Regenerable offline via tests/fixtures/mcda_vikor/generate_vikor_reference.py",
            oracle_kind: ExternalDataset,
            status: Validated,
        },
        VerificationItem {
            requirement: "MCDA outranking net-flow ranking (PROMETHEE II)",
            capability: "Preference Ranking Organization METHod — pairwise preference index with the six standard generalised-criterion shapes, positive/negative outranking flows and the complete net-flow ranking (usual criterion validated)",
            module: "mcda::promethee",
            tests: "tests/mcda_promethee_reference.rs (net outranking flow + ranking, usual criterion, vs pymcdm to <1e-9 on a fixed 4×3 benefit/cost matrix)",
            oracle: "pymcdm methods.PROMETHEE_II('usual') — an independent third-party MCDA library computing the same uniquely-defined net outranking flow; matched to <1e-9. Regenerable offline via tests/fixtures/mcda_promethee/generate_promethee_reference.py. The thresholded (q/p/σ) preference shapes reduce to the same generalised-criterion algebra and stay property-checked",
            oracle_kind: ExternalDataset,
            status: Validated,
        },
        VerificationItem {
            requirement: "MCDA outranking choice kernel (ELECTRE I)",
            capability: "ELimination Et Choix Traduisant la REalité — concordance / discordance matrices, the concordance-and-non-veto dominance relation and the outranking choice kernel (all-benefit, sum-normalised-weight, single-global-scale convention)",
            module: "mcda::electre",
            tests: "tests/mcda_electre_reference.rs (concordance, discordance, dominance matrices element-for-element + kernel/dominated set vs pyDecision to <1e-9 on a fixed 4×3 all-benefit dataset)",
            oracle: "pyDecision algorithm.electre_i (Valdecy Pereira) — an independent third-party multi-criteria decision library computing the same uniquely-defined concordance/discordance/dominance/kernel; matched element-for-element to <1e-9. Regenerable offline via tests/fixtures/mcda_electre/generate_electre_reference.py. The ĉ/d̂ threshold choices are analyst inputs (sensitivity stays MODELLED)",
            oracle_kind: ExternalDataset,
            status: Validated,
        },
        VerificationItem {
            requirement: "MCDA aggregation kernels (WASPAS / MOORA)",
            capability: "Weighted Aggregated Sum Product ASSessment (linear-normalised convex blend λ·WSM+(1−λ)·WPM at λ=0.5) and the MOORA ratio system (vector-normalised weighted benefit total minus weighted cost total) — the stability-hardened value blend and the signed ratio-system scorer",
            module: "mcda::waspas, mcda::moora",
            tests: "tests/mcda_waspas_reference.rs (WASPAS preferences + ranking) and tests/mcda_moora_reference.rs (MOORA scores + ranking), each vs pymcdm to <1e-9 on a fixed 4×3 benefit/cost decision matrix",
            oracle: "pymcdm (methods.WASPAS + normalizations.linear_normalization, l=0.5; methods.MOORA ratio system, vector normalisation) — an independent, widely-used third-party Python MCDA library computing the same uniquely-defined aggregates; matched to <1e-9. Regenerable offline via tests/fixtures/mcda_waspas/ and tests/fixtures/mcda_moora/. Garbage-in-garbage-out on the inputs; the sensitivity/robustness layer stays MODELLED",
            oracle_kind: ExternalDataset,
            status: Validated,
        },
        VerificationItem {
            requirement: "MCDA proportional ranking (COPRAS)",
            capability: "COmplex PRoportional ASsessment — column-sum-normalised benefit significance S⁺ plus the inverse-cost significance term, the relative significance Q and utility degree U = Q/max Q (best alternative = 1)",
            module: "mcda::copras",
            tests: "tests/mcda_copras_reference.rs (utility degrees + ranking vs pyDecision to <1e-9 on a fixed 4×3 benefit/cost matrix)",
            oracle: "pyDecision algorithm.copras_method (Valdecy Pereira) — an independent third-party MCDA library computing the same uniquely-defined COPRAS relative-significance/utility. pyDecision is used deliberately: pymcdm 1.4.0's COPRAS collapses algebraically to the trivial S⁺+S⁻ and is not a faithful reference, whereas pyDecision implements the canonical Q = S⁺+(min(S⁻)·ΣS⁻)/(S⁻·Σ(min(S⁻)/S⁻)). Matched to <1e-9; regenerable offline via tests/fixtures/mcda_copras/generate_copras_reference.py",
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
            tests: "timetransfer::tests (reciprocal cancellation; two-form Sagnac identity); tests/time_transfer_error_budgeting_reference.rs (equatorial-circumnavigation Sagnac = 207.386 ns vs the published Ashby 207.4 ns to <0.05 ns; plus Sagnac/geodist geometry cross-checked against RTKLIB 2.4.3 geodist() compiled from C source)",
            oracle: "Sagnac magnitude checked against an authoritative PUBLISHED VALUE — N. Ashby, 'Relativity in the GPS', Living Reviews in Relativity 6:1 (2003), Eq. 1.29: an eastward equatorial circumnavigation accrues 207.4 ns (2ωA_E/c²); kshana reproduces 207.386 ns. Independently corroborated by RTKLIB 2.4.3 geodist() (Takasu, BSD-2-Clause), which carries the same 2Aω/c² geometry. The composite BIPM TWSTFT transponder/common-view/PPP budget has no external oracle, so the capability stays Modelled",
            oracle_kind: ExternalDataset,
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
            requirement: "GPS L1 C/A spreading-code generation",
            capability: "G1/G2 LFSR C/A-code generator reproducing the IS-GPS-200 published first-10-chip octal verification vectors for PRN 1–9 (plus 1023-chip length, 512-ones balance, three-valued periodic autocorrelation)",
            module: "sdr",
            tests: "sdr::code_tests (ca_first_ten_chips_match_is_gps_200_octal — PRN 1–9 first-10-chips reproduce IS-GPS-200 Table 3-Ia octals 1440/1620/1710/1744/1133/1455/1131/1454/1626 exactly; ca_code_has_1023_chips_and_is_balanced; ca_periodic_autocorrelation_is_three_valued)",
            oracle: "IS-GPS-200 Table 3-Ia 'Code Phase Assignments' — the authoritative US-Government public-domain published first-10-chip OCTAL verification vectors (GPS Directorate, navcen.uscg.gov); kshana's own G1/G2 LFSR regenerates every PRN 1–9 vector exactly. The downstream modulation/SSC/DLL closed forms stay Modelled (separate row)",
            oracle_kind: ExternalDataset,
            status: Validated,
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
            requirement: "SRTM digital-elevation reader on real terrain",
            capability: "Hand-rolled SRTM .hgt parser (16-bit big-endian, north-row-first, void-aware) + bilinear sampler reading a real public-domain DEM tile and resolving a documented survey benchmark",
            module: "altpnt::terrain",
            tests: "tests/terrain_nav_validation.rs (real_srtm_committed_badwater_tile_reads_real_relief — the committed 6-arc-second decimation of the public-domain SRTM v3 N36W117 tile places Badwater Basin, the lowest point in North America, at −78 m within the [−95,−70] m survey band and reads the tile's true ~2.2 km eastern-range relief; plus the hand-built bilinear-midpoint and synthetic-fixture parser oracles)",
            oracle: "NASA/USGS SRTM v3 (1-arc-second) N36W117 tile — US-Government PUBLIC-DOMAIN elevation data from the AWS elevation-tiles-prod open mirror, decimated to 6-arc-second and committed under tests/fixtures/terrain/ (see NOTICE.md). The documented Badwater Basin benchmark (−86 m, lowest in North America) anchors the geo-referenced read. The terrain-matching/TERCOM nav-fix that consumes the DEM stays Modelled (separate Alternative/complementary PNT row)",
            oracle_kind: ExternalDataset,
            status: Validated,
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
            requirement: "Hybrid optical/RF report self-description",
            capability: "The hybrid-optical-rf report states the link configuration it actually ran at (carrier wavelength, transmit and receive aperture, range, pulse width, integration time, efficiencies and losses, defaults resolved) and carries a units block giving the unit and provenance class of every quantity a paper is likely to quote, including the handoff covariance traces in square metres",
            module: "hybrid_integrity",
            tests: "hybrid_integrity::tests (the resolved configuration is echoed for defaults and for overrides, without round-tripping the wavelength through metres; every units entry carries both a unit and a provenance class; every field the units block names is actually emitted, so it cannot document a ghost)",
            oracle: "No external oracle, and none is possible: this is self-description, not a measurement. It is recorded because the absence of it was a defect -- P5 had to quote the carrier wavelength and transmit aperture from source defaults, and to infer that a bare `variance` was in square metres from an internal consistency check. The inference was correct, which is precisely why it mattered: nothing would have caught it being wrong",
            oracle_kind: OracleKind::InternalConsistency,
            status: VerificationStatus::Modelled,
        },
        VerificationItem {
            requirement: "Hybrid optical/RF link availability on the RF side",
            capability: "The hybrid-optical-rf report states an RF link availability, composed from quantities the engine already computes rather than from an imported climatology, and states the composition as a named rule: A_rf = I_closure * I_track, where I_closure is the closure verdict of the one-way CCSDS-401 / DSN-810-005 link budget (linkbudget::link_budget, Eb/N0 margin >= 0) at the scenario's own range and I_track is the tracking-loop verdict (jamming::lock_status) on the C/N0 that SAME budget returned. Each factor carries its input's provenance class through to the output, and the factors deliberately NOT in the product -- geometric visibility, interference denial, and an RF outage climatology -- are named with the reason rather than silently set to 1. The resolved RF leg is echoed as its own rf_link_configuration block, and the continuous figures beside the indicator (link margin, C/N0 margin, the closed-form closure and tracking ranges, and the range utilisation) are the range inversions of the same budget. The report states in full, on the block and in the units entry a reader lands on, that this figure is MARGIN/GEOMETRY-LIMITED and DETERMINISTIC while optical availability is WEATHER/CLIMATOLOGY-LIMITED and probabilistic, so the two can never be quoted as a comparable pair of percentages",
            module: "hybrid_integrity, linkbudget, jamming",
            tests: "hybrid_integrity::tests (the availability equals the product of the two indicators recomputed from the report's own margins, and those margins are themselves reassembled from the report's own EIRP, free-space loss, lumped loss, figure of merit, Boltzmann term, data rate and requirement to 1e-9 dB; the value is measured to be 0 or 1 while the optical availability at the same run is measured to be strictly between them; each factor row carries a provenance class from the closed field_schema vocabulary; the reported closure range re-run through the link budget returns a margin of 0 to 1e-9 dB and is measured to be independent of the range the run sat at across four decades, while the range utilisation moves by exactly the range ratio; a -40 dBW link reports availability 0, LOST, and a utilisation above 1 rather than a fraction; the superseded 'no RF-availability counterpart is computed by this engine' note is asserted gone and the replacement is asserted to name the new field; a malformed RF input is refused rather than clamped)",
            oracle: "No external oracle, and ExternalDataset is declined. The two inputs are an Eb/N0 margin and a C/N0 threshold crossing, both functions of a MODELLED EIRP, figure of merit and lumped loss allocation; there is no measured availability record for an Earth-Moon optical/RF hybrid service to check the composed figure against. The checks that exist are internal and are stated as such: the composition is recomputed from the report's own published margins rather than from the emitter's internals, and the closure range is verified by re-running the link equation AT it and requiring the margin to vanish -- an inversion round trip, not an independent implementation. The honest limit of the figure is recorded on the report itself: it is a deterministic 0/1 indicator, not a probability, because nothing in this engine measures an RF link-outage distribution at this band and geometry. That missing input is named in rf_availability.factors_not_included rather than invented, and supplying it is what a probabilistic RF availability would need",
            oracle_kind: OracleKind::InternalConsistency,
            status: VerificationStatus::Modelled,
        },
        VerificationItem {
            requirement: "Like-for-like optical-versus-RF ranging comparison",
            capability: "The hybrid-optical-rf report emits the optical-versus-RF ranging ratio with the ONE configuration both legs were evaluated at carried in the same object: the same one-way path, the same range, and the same accumulation time. The optical leg is the engine's photon-limited ToA CRLB on the one-way photon count; the RF leg is the engine's DLL early-late thermal code-tracking jitter at the C/N0 the engine's own link budget returns for that same one-way range. The loop noise bandwidth is derived, not chosen: B_L = 1/(2*integration_s) puts the RF leg at exactly the optical accumulation time, and if a caller overrides it so the two averaging times disagree the ratio is REFUSED -- null, with the mismatch and both times named -- rather than quoted at two operating points. No ratio is formed against the scenario's CHOSEN parametric rf_position_sigma_m, and the refusal says why: that input carries no configuration at all. The released two-way optical headline and the exact factor bridging it to the one-way comparison leg are emitted beside the ratio, so the report cannot be read as carrying two disagreeing optical sigmas",
            module: "hybrid_integrity, optical_linkbudget, linkbudget, navsignal",
            tests: "hybrid_integrity::tests (the ratio equals the two emitted legs divided, to 1e-15 relative, and its reciprocal and decibel forms agree; each leg's range and time sigma are related by exactly c; the emitted common configuration is asserted equal to the scenario's own range and integration time and the RF leg's range is asserted equal to the optical leg's; the RF leg's C/N0 is bit-for-bit the availability block's, from one link budget, not a re-derivation; the LIKE-FOR-LIKE property is MEASURED rather than asserted -- quadrupling the common accumulation time halves the optical leg to 1e-12 and the RF leg to 1e-7 and leaves the ratio unmoved to 3.19e-9 relative, which a leg secretly averaging over something else could not do; an rf_dll_bandwidth_hz override that breaks the common averaging time makes the ratio null with a reason naming both times, while both legs are still emitted; a one-way run makes the comparison leg bit-for-bit the released headline with a penalty factor of exactly 1, and a two-way run reproduces the penalty 0.5/sqrt(return-path geometric loss) recomputed from the report's own geometric_loss_db to 1e-12)",
            oracle: "No external oracle for the RATIO, and ExternalDataset is declined deliberately. The underlying RF chain does have one -- tests/validate_p5_rf_ranging_precision.rs checks linkbudget::link_budget and navsignal::dll_code_jitter_chips against an independent Python/NumPy fixture and against the hardcoded Kaplan & Hegarty worked value (2.814e-3 chip / 0.825 m at 45 dB-Hz) -- and the optical CRLB has its own closed-form row. Claiming either anchor for this row would be borrowed validation, which the matrix invariants exist to prevent: the quantity here is a RATIO at a configuration with a MODELLED EIRP, figure of merit, transmit power and aperture, and no measured optical-versus-RF ranging comparison at a common operating point exists to check it against. What is checked internally is the thing the ratio can actually get wrong: that the two legs sit at one operating point. That is measured by scaling the common accumulation time and requiring both legs to move by the same square-root law and the ratio to stay put, and it is enforced by refusing the ratio outright when the averaging times disagree. Both legs are thermal/shot-noise bounds and both exclude media delay, clock error and ambiguity, so the exclusion is identical on each side; the report says so rather than leaving it inferred",
            oracle_kind: OracleKind::InternalConsistency,
            status: VerificationStatus::Modelled,
        },
        VerificationItem {
            requirement: "Link-budget report self-description",
            capability: "The link-budget report states every absolute constant its own margin was computed from -- the carrier frequency the free-space loss used, the EIRP, the figure of merit, the lumped loss and the Boltzmann term -- plus the required G/T at which the margin is zero, the link constant (EIRP - losses - required Eb/N0) that is the only combination a published rate/gain table can ever fix, and, when a caller states a system noise temperature, the receive antenna gain that figure of merit implies",
            module: "linkbudget",
            tests: "linkbudget::tests (across three bands, four decades of range and both closure verdicts, the margin and the free-space loss under it are recomputed from the report alone to better than 1e-9 dB; the required G/T assembled from the equation terms agrees with the same quantity reached as G/T minus margin, and re-running at it zeroes the margin; three budgets with wildly different EIRP, loss and threshold but an equal link constant give an identical requirement, while 1 dB on the constant moves it exactly 1 dB; the gain split is absent unless a noise temperature is stated and a non-positive one is refused; every field the units block names is actually emitted)",
            oracle: "No external oracle: this is self-description over an equation already validated against a published design-control table (see the one-way link budget row). It is recorded because the absence of it was a measured defect -- reproducing the released d1_rate_gain_beamwidth.csv required back-solving one effective constant to 0.0034 dB from all thirty rows, and the engine now both names that combination and proves, by test, that no released table could ever have separated its three components",
            oracle_kind: OracleKind::InternalConsistency,
            status: VerificationStatus::Modelled,
        },
        VerificationItem {
            requirement: "Per-clock-class lunar time crossover table",
            capability: "One lunar-time-budget run emits a clock-vs-frame crossover row per clock class against a single shared frame term, so the clock is the only variable in the comparison; each row carries the crossover reached two ways -- bisected from the general power-law time-error curve and inverted algebraically from the row's dominant noise type -- with the relative difference between them",
            module: "lunar_time_budget",
            tests: "lunar_time_budget::tests and lunar_time_budget_scenario::tests (all four classes present in one run and in a requested subset order; every row agrees with its own closed form to better than 1e-12 relative; scaling the frame error by k scales the crossover by k for a flicker-FM clock and by k^2 for a white-FM one, checked at k=2 and k=3, which separates the two noise classes; each row reproduces the single-clock crossover the budget already reported; every row recovers the one shared frame term; an unknown clock name is rejected)",
            oracle: "Two different in-codebase computations of the same quantity, not one restated: bisection on the IEEE-1139 power-law curve knows nothing about noise type, while the closed form inverts the dominant type algebraically, so a misclassified noise type or a bad bracket shows as a non-tiny relative difference. The four values also reproduce the paper's published table to half its last printed digit -- but that table was itself reconstructed from the same closed form, so it is a reproducibility check and not an external oracle, and the frame term it is measured against is a Modelled allocation",
            oracle_kind: OracleKind::InternalConsistency,
            status: VerificationStatus::Modelled,
        },
        VerificationItem {
            requirement: "Joint UT1 and polar-motion error over a common row set",
            capability: "One table reports the UT1 prediction error, the polar-motion pole error and their quadrature combination at the Moon over an IDENTICAL epoch set per horizon, emitting the epochs each component was measured at. Separately, the scenario names whichever EOP input is in force and decomposes its row census, and always emits the predicted-versus-final horizon table with an explicit statement of why it is empty when it is",
            module: "frame_eop",
            tests: "frame_eop::tests and realtime_frame_eop::tests (all three components carry equal, elementwise-identical, strictly ascending epoch sets over both real IERS extracts; the joint set collapses to the intersection when the two Bulletin B blocks genuinely disagree, and a horizon with no shared rows is omitted rather than zero-filled; the emptiness of the predicted-versus-final table is stated in the document rather than implied by a missing field; a real second vintage populates it, cross-checked row for row; a missing later vintage is an error, not a silent empty table)",
            oracle: "An algebraic identity evaluated by a different expression than the one under test: the emitted combination is the root-mean-square of the per-epoch hypotenuse, and the check is the hypotenuse of the two components' own root-mean-squares. The residual path is cross-checked against a separate call into frame_eop, and the row census against the identity rows = finals + predictions. The residual MAGNITUDE is checked only against a plausibility band, never against an IERS-published prediction-accuracy figure -- reading a real product is provenance, not an oracle, which is why this stays Modelled",
            oracle_kind: OracleKind::InternalConsistency,
            status: VerificationStatus::Modelled,
        },
        VerificationItem {
            requirement: "Offline default Earth-orientation input is a real IERS product",
            capability: "The `realtime-frame-eop` runtime default is the library's own embedded copy of a verbatim IERS finals2000A extract (MJD 61173-61204) carrying BOTH row vintages the format defines -- 20 Bulletin B finals and 12 Bulletin A prediction-only rows -- so a bare run with no file argument and no network emits a populated per-horizon table and `predicted_rows.n = 12`, together with the operational-predictor comparison and the agreement against the product's own published prediction rows. The prior five-row final-only excerpt remains shipped, byte-pinned and exercised: on it `predicted_rows.n` is 0, which is the input file's property and not a parser outcome, and the emitted census names whichever input is in force and decomposes it as rows = final_rows + prediction_rows",
            module: "realtime_frame_eop, eop",
            tests: "realtime_frame_eop::tests and tests/operational_eop_predictor_reference.rs (a bare default run asserted to report 32 rows / 20 finals / 12 predictions spanning MJD 61193-61204 against an INDEPENDENT count taken by eop::parse_all and eop::parse_all_predicted over the same bytes, with every horizon row required to be measured from real rows; the same scenario run on the final-only excerpt asserted to report zero prediction rows and rows == final_rows, with eop::parse_all_predicted independently confirming the file publishes none; both `tools/` runtime assets pinned byte-for-byte against their `tests/fixtures/` mirrors and asserted to be different products; the census prose asserted to name the input in force and asserted NOT to contain the superseded explanation; and the frozen pre-change capture of the old default still asserted field for field, with no tolerance, against a run on the input it was captured on -- the three source-identity strings that legitimately moved pinned individually old-to-new so the allowance cannot absorb a numeric change)",
            oracle: "The published IERS finals2000A series itself, used verbatim and byte-pinned: this row's claim is a claim about that external product -- how many rows of each Bulletin vintage the shipped extract carries, over which MJD span -- and the reference is the file's own fixed-column content, whose SHA-256 is recorded in tests/fixtures/agency/NOTICE.md and which is byte-identical to the copy the arXiv P4 artifact bundle publishes. ExternalDataset is nonetheless DECLINED and the status is Modelled, deliberately: the count is taken by this crate's own parser and checked by this crate's own parser over the same bytes, so the check shares its expression with the thing under test; the IERS publishes no companion table of per-vintage row counts for an arbitrary excerpt that could serve as an independent oracle; and the excerpt is a slice this repository cut, not a product IERS issued in that form. What the external data does buy is PROVENANCE -- the rows are real and unaltered -- which is not the same as an oracle, the same line already drawn on the joint-EOP and operational-predictor rows. REVISION (programme rule R4): moving the default off the five-row final-only excerpt moved ten cells of the released p4_frame_eop.csv -- eop_source, predicted_rows.n 0 -> 12, first_mjd and last_mjd from blank to 61193 / 61204, the measured pole floor 0.07693113803915594 -> 0.06776429738439221 mas with its two per-axis terms 0.05439852939188552 -> 0.04791659420284556 mas, the Earth-orientation term 14.016178596543083 -> 14.016014260081214 m, the total 20.097702765309116 -> 20.09758815707301 m and 67.03872038471734 -> 67.03833809279155 ns -- and the twenty-four populated Table 2 cells of tests/golden/realtime-frame-eop.csv. The other twelve cells of p4_frame_eop.csv, and both Table 1 rows of the golden CSV, are unchanged. Every moved cell is enumerated old-to-new in docs/revisions/G12-default-eop-cell-changes.md. The revised pole floor is the SAME quantity P4 already publishes in its polar-motion table (n = 20, 0.0678 mas): before this change the paper's budget took that floor from the five-row excerpt while its pole table took it from the 2026 extract, and the budget's value was 13.5 % the larger of the two. Every other figure P4 prints from this table -- 14.016 m, 14.403 m, 0.177 m, 20.098 m, 67.04 ns, 0.7170 ms, the 48.6 / 51.4 / 0.008 percent variance shares and the 20.3 / 21.6 / 50.0 percent halving sensitivities -- is unchanged at the precision printed; the two pole figures are the only printed numbers that move",
            oracle_kind: OracleKind::InternalConsistency,
            status: VerificationStatus::Modelled,
        },
        VerificationItem {
            requirement: "Capture footprint against altitude and beamwidth",
            capability: "Two-axis sweep of the pattern-weighted, altitude-limited surface capture footprint over transmitter altitude and dish diameter, emitted one row per operating point with the half-power beamwidth each diameter implies, and limb capture reported as a THRESHOLD -- per row the limb J/S, its margin and the transmit power that would close it; per grid the located crossings, or an explicit statement that the limb is not reached anywhere on the grid, with the shortfall",
            module: "antenna",
            tests: "antenna::tests and attack_surface::tests (the grid is complete and every captured fraction lies in [0,1]; captured fraction is non-decreasing in transmit power at every node; it is NOT monotone in beamwidth or altitude, which is pinned by its own test so the sweep cannot later be smoothed; the baseline node reproduces the existing captured fraction bit-for-bit; the limb-only evaluation is bit-identical to the full sweep's last point; a located crossing sits on the threshold to 1e-9 dB and is straddled)",
            oracle: "Set inclusion: the jammer-to-signal ratio enters as a uniform decibel offset, so the captured set at a higher transmit power contains the set at a lower one and the fraction can only rise -- a property the Airy pattern does NOT give in beamwidth or altitude, where the captured region breaks into rings and the fraction is genuinely non-monotone. No published table gives the captured disk fraction of a lunar orbital transmitter against altitude and beamwidth, so there is nothing external to check these cells against; the pattern underneath is separately Validated against published Bessel values and keeps its own row",
            oracle_kind: OracleKind::InternalConsistency,
            status: VerificationStatus::Modelled,
        },
        VerificationItem {
            requirement: "Lunar time-error budget reproducibility",
            capability: "The lunar-time-budget scenario publishes its array-valued outputs as a long-form (grid index, averaging time, term) table alongside the report, so the seven per-term x(tau) curves and the root-sum-square total are engine output rather than something a reader rebuilds from the method section",
            module: "lunar_time_budget_scenario",
            tests: "lunar_time_budget_scenario::tests (all 57 averaging times x 8 terms present, the grid index runs 0..=56 and carries 8 rows each; the `total` row equals the root-sum-square of the seven terms beside it at every tau; the table follows a requested grid rather than a hard-coded one; emitting it leaves the report JSON byte-identical)",
            oracle: "Self-consistency only: the published total is checked against the root-sum-square of the terms in the same file, and the emitted curve reproduces the released p3_time_budget_curve.csv over all 57 points. Both checks share this engine's own term definitions, so neither is independent. The clock term rests on published clock specifications, but the link, frame, relativistic and ephemeris floor MAGNITUDES are documented budget allocations with no external oracle",
            oracle_kind: OracleKind::InternalConsistency,
            status: VerificationStatus::Modelled,
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
            requirement: "Fisher information & Cramér–Rao observability",
            capability: "Fisher information M=HᵀWH, Cramér–Rao lower bound, observability rank / datum-defect null space (Moore–Penrose pseudo-inverse), and D/A/E/T-optimal experiment-design scalars from a symmetric Jacobi eigensolver",
            module: "fim",
            tests: "tests/fim_observability_reference.rs (eigenvalues vs numpy.linalg.eigh; CRLB covariance vs σ²(XᵀX)⁻¹ via numpy.linalg.inv; GNSS GDOP/PDOP/HDOP/VDOP/TDOP from the information matrix vs numpy — all matched to 1e-9); fim::tests (Jacobi eigensolver vs closed-form spectra; CRLB vs Kay 1993 closed forms — DC-in-WGN σ²/N and line-fit σ²(XᵀX)⁻¹; Monte-Carlo CRLB attainment; Moore–Penrose identity MM⁺M=M; datum-defect null space)",
            oracle: "NumPy 2.4.1 (numpy.linalg.eigh / .inv; BSD-3-Clause, LAPACK-backed) — an independent third-party authority computing the same uniquely-defined eigenvalues, σ²(XᵀX)⁻¹ Cramér–Rao covariance and GNSS dilution-of-precision factors by a different algorithm (LAPACK divide-and-conquer + LU) than Kshana's cyclic-Jacobi sweep and spectral pseudo-inverse; matched to 1e-9. The same external-library class already validates the DOP engine (vs gnss_lib_py) and the χ²/erf kernels (vs SciPy). Additionally cross-checked against the Kay (1993) closed-form CRLBs and Monte-Carlo CRLB attainment (internal)",
            oracle_kind: OracleKind::ExternalDataset,
            status: VerificationStatus::Validated,
        },
        VerificationItem {
            requirement: "Lunar absolute-station observability (datum defect)",
            capability: "Fisher-information observability of the joint lunar solve: without Earth baselines the absolute-frame datum lies in the null space of HᵀWH (station position unobservable); ≥3 baselines restore full rank and bound the station Cramér–Rao error, which the estimator attains",
            module: "lunar_combination (lunar_observability) + fim",
            tests: "lunar_combination::tests (rank-deficient without Earth baselines; three baselines restore full rank — the 3-station threshold from the information rank, not solve error; station CRLB attained by the estimator at efficiency 0.98; CRLB tightens monotonically with baselines)",
            oracle: "Analytic datum-defect structure — the unobservable absolute-frame mode lies in the null space of the Fisher information (closed-form), the rank threshold matches the published 3-station design rationale, and the estimator attains the resulting CRLB in Monte-Carlo. The lunar geometry itself is a representative network (not a flown ephemeris), so the row stays MODELLED; the underlying FIM/CRLB engine is checked against the Kay (1993) closed forms separately",
            oracle_kind: OracleKind::InternalConsistency,
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
            requirement: "Lunar joint communications-and-navigation geometry",
            capability: "Per-satellite topocentric look angles and slant range at a named selenographic site, and the signal-in-space ranging accuracy exposed as a scenario parameter so the service-volume sweep yields a ranging REQUIREMENT rather than a pass/fail at one fixed sigma",
            module: "lunar_service",
            tests: "lunar_service::tests (topocentric against hand-computed geometry: overhead, due north/east/west, antipodal, and the degenerate polar east direction; the exported visible flag agrees with the independent visibility filter over a full 6 h sweep; the export is off by default and provably changes nothing else; protection levels are exactly linear in the exposed sigma while the geometry underneath is untouched)",
            oracle: "Closed-form geometry whose answer is known without running the code (elevation 90 deg overhead, azimuth 0/90/270 deg due north/east/west, Euclidean slant range) plus cross-agreement with lunar_service::visible_sat_positions, which computes the same elevation through a separate expression. MODELLED: the oracle is internal. The MCI propagation and the visible-satellite SET the export is derived from are separately Validated against ANISE 0.10.2 (see the service-volume row); an external azimuth/range oracle is the outstanding upgrade for this row",
            oracle_kind: OracleKind::InternalConsistency,
            status: VerificationStatus::Modelled,
        },
        VerificationItem {
            requirement: "Lunar differential PNT",
            capability: "NovaMoon-class differential reference station: common-mode cancellation + baseline-growing residual + DGNSS protection levels",
            module: "lunar_dpnt",
            tests: "lunar_dpnt::tests (clock common-mode cancels exactly; residual grows with baseline; reuses SBAS PL; the satellite count is honoured to the builder's limit of 24, so a larger constellation cannot silently return a smaller one); tests/lunar_differential_pnt_reference.rs (single-difference residual + WLS position solve vs RTKLIB's lsq() compiled from C source)",
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
            tests: "wahba::tests (A(identity quaternion)=I; the Jacobi eigensolver satisfies Kv=λv and preserves the trace on a known symmetric matrix; K is symmetric); tests/wahba_reference.rs (TRIAD, Davenport's q-method and QUEST reproduce scipy.spatial.transform.Rotation.align_vectors' optimal DCM on noiseless weighted vector sets to <1e-9 rad via the frame-agnostic attitude-error angle; plus the q-method recovers a known rotation with λ_max=Σ weights and zero Wahba loss, the q-method solution minimises the Wahba loss under perturbation, QUEST agrees with the optimal q-method to <1e-7 rad, and the optimal estimator beats two-vector TRIAD in RMS attitude error over 2000 noisy Monte-Carlo trials)",
            oracle: "scipy.spatial.transform.Rotation.align_vectors (SciPy 1.13; Virtanen et al., Nature Methods 2020) — the Kabsch/Markley SVD solution of Wahba's problem, a genuinely independent algorithm (SVD of the attitude profile matrix) and codebase from kshana's Davenport-K eigensolve / QUEST characteristic-root method, computing the SAME uniquely-defined Wahba-optimal attitude. On noiseless weighted vector-observation sets TRIAD, the q-method and QUEST reproduce scipy's optimal rotation to <1e-9 rad (compared via the sign-invariant attitude-error angle). The noisy Monte-Carlo 'optimal beats TRIAD' statistical claim stays MODELLED (no external oracle); point-direction unit-vector observations only — no sensor field-of-view/bias/temporal-correlation modelling, and QUEST is singular at 180° (the q-method covers that case)",
            oracle_kind: ExternalDataset,
            status: Validated,
        },
        VerificationItem {
            requirement: "GNSS square-law acquisition detection statistics",
            capability: "Square-law (non-coherent) acquisition detector over a code-phase × Doppler search: false-alarm probability (central χ² with 2M dof), the threshold achieving a target P_fa (χ² CDF inverted by bisection), and detection probability (non-central χ² with non-centrality 2M·ρ for per-cell post-correlation SNR ρ), with the generalized Marcum Q-function Q_M(a,b)=1−F_{χ'²(2M,a²)}(b²)",
            module: "acquisition",
            tests: "acquisition::tests (Marcum-Q central case Q_1(0,b)=exp(−b²/2); the P_d=Q_M(√(2Mρ),√γ) identity; P_fa↔threshold round-trip across M and P_fa; ROC monotonicity — P_d rises with SNR, falls with threshold, P_d→P_fa as SNR→0; the non-coherent integration gain raises P_d at fixed P_fa; Marcum-Q monotone in a and b and bounded in [0,1]); tests/acquisition_reference.rs (the generalized Marcum Q_M(a,b), P_d, P_fa and the P_fa→threshold inversion matched vs scipy.stats.ncx2/chi2 over an (M,a,b)/(M,P_fa)/(M,SNR) grid to ~1e-6)",
            oracle: "scipy.stats.ncx2 / scipy.stats.chi2 (SciPy 1.13; Cephes/Boost) — an independent algorithm (continued-fraction non-central/central χ²) from kshana's incomplete-gamma series (raim::chi2_cdf / noncentral_chi2_cdf), computing the same uniquely-defined detection-statistics KERNEL: the generalized Marcum Q_M(a,b)=ncx2.sf(b²,2M,a²), the detection probability P_d, the false-alarm probability P_fa and the P_fa→threshold inversion, matched to ~1e-6 — the same independence basis as the Validated 'RAIM/ARAIM integrity statistical kernel' row. KERNEL only: the per-cell CFAR cell-averaging and code/Doppler-bin straddling loss stay MODELLED",
            oracle_kind: ExternalDataset,
            status: Validated,
        },
        VerificationItem {
            requirement: "GNSS carrier-phase integer ambiguity resolution (LAMBDA)",
            capability: "Integer least-squares ambiguity fixing the LAMBDA way: a volume-preserving integer (Z) decorrelating transform (integer-Gauss size reduction of the L D Lᵀ factor) + an exact Schnorr–Euchner depth-first branch-and-bound integer least-squares search + the closed-form bootstrapped success rate P_s=∏(2Φ(1/(2σ_{i|I}))−1), with the ratio test on the two best candidates",
            module: "lambda",
            tests: "lambda::tests (L D Lᵀ reconstructs Q); tests/lambda_reference.rs (the Z-transform is unimodular |det Z|=1 with Q_z=ZᵀQZ SPD, det-preserving, and lower total off-diagonal correlation; the Schnorr–Euchner ILS matches brute-force enumeration over 300 random covariances; the full decorrelate→search→back-transform pipeline equals the direct ILS and Z⁻ᵀZᵀ round-trips integers; the closed-form bootstrapped success rate matches a 200k-trial Monte-Carlo of sequential conditional rounding to <0.01)",
            oracle: "Self-consistency of the integer estimator: the Z-transform invariants (unimodularity, congruence, determinant), the EXACT ILS verified against independent brute-force enumeration, and the bootstrapped success rate verified against a Monte-Carlo of the rounding process it models — internal-consistency checks, NOT an external dataset, so the row stays InternalConsistency. MODELLED integer-Gauss decorrelation (the conditional-variance reordering permutations of the full LAMBDA reduction are out of scope; they speed the search but change neither the exact ILS answer nor the bootstrapped rate)",
            oracle_kind: InternalConsistency,
            status: Modelled,
        },
        VerificationItem {
            requirement: "B-plane targeting & patched-conic gravity assist",
            capability: "Hyperbolic-flyby geometry (a=−μ/v∞², e=1+r_p·v∞²/μ, turn angle δ=2·asin(1/e), impact parameter |B|=|a|·√(e²−1)), the B-plane Ŝ/T̂/R̂ aim-point frame and B·T̂/B·R̂ decomposition, and a patched-conic gravity assist (v∞-magnitude conserved, direction deflected by δ, heliocentric Δv=2·v∞·sin(δ/2) at no propellant cost) with the Tisserand parameter T_P=a_P/a+2√((a/a_P)(1−e²))cos i",
            module: "bplane",
            tests: "bplane::tests (the flyby scalars satisfy the closed forms with two agreeing |B| identities and |B|>r_p; the turn angle decreases with periapsis radius and hits the δ→0 / δ→π limits; deflection preserves v∞ speed and rotates exactly by δ; the assist Δv magnitude equals 2·v∞·sin(δ/2) and is bounded by 2·v∞; the B-plane axes are orthonormal and ⊥ Ŝ with |B|²=(B·T̂)²+(B·R̂)²; the Tisserand parameter is invariant across a v∞-preserving deflection that does change a,e,i, and equals 3−(v∞/v_circ)²)",
            oracle: "Self-consistency of the flyby geometry and the patched-conic invariants: the hyperbolic closed forms, the B-plane orthonormal decomposition, v∞ conservation, and Tisserand invariance (cross-checked two ways — invariance across the deflection and the v∞ link) are analytic identities checked against the engine's own state→element conversion — internal-consistency checks, NOT an external dataset, so the row stays InternalConsistency. MODELLED patched-conic two-body flyby on a circular planetary orbit — no finite-sphere-of-influence transition, encounter third-body perturbations, or ephemeris",
            oracle_kind: InternalConsistency,
            status: Modelled,
        },
        VerificationItem {
            requirement: "CRPA anti-jam array beamforming",
            capability: "Controlled-reception-pattern antenna nulling: complex array steering vectors a(û)=exp(j·k·pₙ·û), deterministic null-steering (unit gain toward the SV, exact nulls toward up to N−1 jammers via the minimum-norm w=Aᴴ(AAᴴ)⁻¹b), and MVDR adaptive weights w=R⁻¹a_sv/(a_svᴴR⁻¹a_sv) that self-steer deep nulls onto strong interferers (with a from-scratch complex linear-algebra kernel)",
            module: "crpa",
            tests: "crpa::tests (complex arithmetic identities incl. z/z=1, |exp(jθ)|=1, zᴴz=|z|²; deterministic null-steering gives exact unit SV gain and <1e-9 jammer nulls on a 4-element ULA with 3 jammers; an N-element array rejects >N−1 jammers and min-norm-nulls fewer; MVDR stays distortionless toward the SV while the jammer null deepens monotonically with jammer power to <1e-3 at 60 dB); tests/crpa_reference.rs (the MVDR and minimum-norm null-steering weight vectors and the resulting array-response gains matched vs an independent numpy/scipy LAPACK computation to ~1e-9)",
            oracle: "numpy.linalg / scipy.linalg (LAPACK zgesv complex solve) — an independent linear-algebra codebase from kshana's from-scratch complex kernel, computing the SAME uniquely-defined weights: MVDR w=R⁻¹a_sv/(a_svᴴR⁻¹a_sv) and minimum-norm null-steering w=Aᴴ(AAᴴ)⁻¹b, plus the resulting array-response gains, matched to ~1e-9 — the same class of oracle as the Validated DOP (gnss_lib_py) and Fisher-information (numpy) rows. MODELLED narrowband far-field identical-isotropic-element array — no mutual coupling, per-element mismatch, finite-bandwidth (STAP), or steering-vector estimation error",
            oracle_kind: ExternalDataset,
            status: Validated,
        },
        VerificationItem {
            requirement: "IEEE-1139 power-law clock noise + flicker-FM floor",
            capability: "The five-coefficient IEEE-1139 PSD↔Allan-variance conversion S_y(f)=Σh_α f^α → σ_y²(τ) (white/flicker PM, white/flicker/random-walk FM), the flicker-FM floor σ_y=√(2 ln2·h_{-1}) as a first-class fittable term, and a non-negative FM-family fit in the {(2π²/3)τ, 2 ln2, 1/(2τ)} basis that recovers the floor the drift basis {1/τ,τ,τ³} cannot represent",
            module: "powerlaw",
            tests: "powerlaw::tests (each pure noise type shows its signature ADEV log-log slope — white FM −½, flicker FM 0, random-walk FM +½, white PM −1; the flicker-FM term is a flat floor equal to √(2 ln2·h_{-1}) across five decades of τ; the FM-family fit round-trips known h_{-2},h_{-1},h_0 from a synthetic curve to <1e-6; and a flicker-dominated curve's floor is recovered here while the drift-basis fit (quantum_trade::qparams_from_adev_curve) is >10% wrong at long τ — closing a documented gap); tests/powerlaw_oadev_reference.rs (σ_y(τ) matched vs allantools 2024.06 Noise.adev closed forms across the τ ladder for all five noise types, plus an allantools Kasdin-generator→oadev-estimator corroboration of the h_a level)",
            oracle: "allantools 2024.06 (A. Wallin; Kasdin & Walter 1992 / Vernotte 2015 coefficients) — an independent third-party codebase and citation lineage computing the SAME uniquely-defined IEEE-1139 PSD→Allan conversion σ_y(τ) for each of the five power-law noise types. kshana's powerlaw::allan_deviation matches the allantools closed forms (white/flicker-FM, RW-FM and white-PM to <5e-9 relative; flicker-PM to ~1e-5 — the genuine independence signal, kshana using the NIST-SP-1065 tabulated 1.038 constant vs allantools' full 3γ−ln2), and the flicker-FM floor √(2 ln2·h_{-1}) matches allantools across the ladder — the same bar the Validated MDEV/TDEV/Theo1/MTIE rows clear. MODELLED stationary power-law model — no deterministic-drift (τ²) term; per-device coefficients / measured floors stay Modelled",
            oracle_kind: ExternalDataset,
            status: Validated,
        },
        VerificationItem {
            requirement: "CCSDS OEM covariance-block interchange",
            capability: "Serialise and parse the CCSDS 502.0 OEM COVARIANCE_START…COVARIANCE_STOP block — the 6×6 position/velocity covariance written as its 21-element lower triangle (canonical CX_X … CZ_DOT_Z_DOT order) with the optional COV_REF_FRAME, complementing the existing OEM state-vector writer/parser so orbit-determination and filter covariances round-trip in the standard format",
            module: "oem (covariance_block_kvn, parse_covariance_block)",
            tests: "oem::tests (a symmetric PD covariance round-trips KVN→parse to f64 round-off and stays symmetric; the block emits exactly the 21 lower-triangular entries — i+1 per matrix row — with/without COV_REF_FRAME; a block with the wrong value count and a missing block are both rejected); tests/ccsds_oem_covariance_reference.rs (the independent oem 0.4.5 library parses a kshana-emitted OEM segment and reconstructs the symmetric 6×6, matching kshana's input covariance to f64 round-off; with a perturbed negative control and an oem-rejects-the-labelled-CX_X-variant check)",
            oracle: "oem 0.4.5 (Brad Sease, MIT) — the SAME independent CCSDS-502 parser trusted by the Validated 'CCSDS OEM interoperability' row, a completely separate codebase (its own KVN tokenizer, covariance-section state machine and numpy matrix assembly). kshana emits a full OEM segment carrying its unlabelled bare-number lower-triangular COVARIANCE block; oem parses it and reconstructs the symmetric 6×6, matching kshana's input covariance element-for-element to f64 round-off — a genuine library-vs-library interchange round-trip (compared against oem's reconstruction, not a kshana re-parse), closing the row's previous 'no third-party fixture' gap",
            oracle_kind: ExternalDataset,
            status: Validated,
        },
        VerificationItem {
            requirement: "INS/TRN coasting error growth & threshold crossings",
            capability: "Position-error-vs-coast-duration budget built from IMU coefficients — accelerometer bias (t²), gyro-bias tilt through gravity (t³), velocity random walk (t^1.5), angle random walk (t^2.5) and scale factor times the travelled distance (t¹ cruising, t² under sustained specific force) — combined under a stated rule (rss / linear-sum / deterministic-sum-with-stochastic-rss), with the coast durations reaching caller-supplied position thresholds (10 m and 50 m by default) located by bisection, a per-contribution breakdown naming the dominant source at each crossing, and a TRN-bounded mode giving the largest terrain-fix interval that holds each threshold. Runnable as the `ins-trn-coast` scenario kind",
            module: "inertial::coast (CoastModel, Contribution, Combination, TrnFixMode, InsTrnCoastScenario); scenario kind `ins-trn-coast`",
            tests: "inertial::coast::tests (36 library tests). Growth powers: doubling_the_coast_scales_each_contribution_by_two_to_its_own_power; a_pure_bias_error_quadruples_and_a_pure_random_walk_error_grows_by_two_to_the_three_halves; the_exponents_the_document_publishes_are_the_ones_the_curves_actually_follow. Cross-model oracles: the_bias_law_matches_the_engines_stochastic_dead_reckoner_stepped_forward; the_gyro_tilt_law_matches_the_engines_stochastic_dead_reckoner_stepped_forward; the_velocity_random_walk_law_matches_a_monte_carlo_of_the_engines_dead_reckoner (300 seeds, rel < 0.10); the_angle_random_walk_law_matches_a_monte_carlo_of_the_engines_dead_reckoner (300 seeds, rel < 0.10); the_scale_factor_law_matches_a_double_integration_of_the_engines_imu_error_model (rel < 2e-3); the_model_reduces_to_the_engines_existing_classical_ins_budget (rel < 1e-12). Crossings: every_contributions_closed_form_crossing_agrees_with_the_engines_bisection (20 pairs, rel < 1e-9); the_located_crossing_puts_the_model_on_the_threshold_it_searched_for; an_error_free_imu_never_reaches_a_threshold_and_says_so_instead_of_reporting_zero. TRN: a_full_reset_fix_makes_every_inter_fix_excursion_identical; a_position_only_fix_lets_each_excursion_exceed_the_last_and_the_peak_is_the_final_one; the_largest_fix_interval_holding_a_threshold_puts_the_peak_on_that_threshold; a_position_only_fix_cannot_bound_a_tactical_hour_at_any_fix_rate; a_fix_residual_above_the_threshold_is_reported_as_never_holding_not_as_a_zero. Surface: every_published_field_carries_a_unit_and_a_provenance_class; the_scenario_runs_through_the_engines_public_dispatch_and_is_reproducible",
            oracle: "Two in-codebase routes that never see this module's algebra. (1) `inertial::AccelModel`, the engine's step-by-step stochastic dead-reckoner, integrated forward at dt = 0.01-0.05 s: deterministic for the bias and gyro-bias channels (agreeing to the Euler truncation, rel < 2e-4 and < 1e-3), and Monte-Carlo over 300 fixed seeds for the velocity- and angle-random-walk channels, whose sample RMS reproduces σ_vrw·t^1.5/√3 and g·σ_arw·t^2.5/√20 to rel < 0.10 (the sampling error of an RMS over 300 seeds is ~4%). The simulator only ever adds a white increment per step; it has no knowledge of the t^1.5 or t^2.5 laws, so this is a different route to the same number, not the same expression restated. (2) `inertial::imu_errors::ImuErrorModel::distort` double-integrated over an accelerate-then-cruise profile, reproducing s×(travelled distance) to rel < 2e-3 without ever multiplying a distance by a scale factor. Separately, and labelled a COMPATIBILITY check rather than an oracle, the model reduces bit-close (rel < 1e-12) to `quantum_trade::ClassicalInsBudget` when the gyro channels are off and the platform is under sustained specific force — that shares the expression and so cannot fail with it; it is there to prove no second, divergent error model was forked. Threshold crossings are located by the engine's existing bisection (`quantum_trade::PositionDrift::inertial_holdover_s`) and each single contribution's crossing is additionally inverted algebraically, the two agreeing to rel < 1e-15. The IMU class coefficients (navigation/tactical/industrial/consumer) are representative Groves 2013 Table 4.1 BAND figures and stay MODELLED, as does the TRN fix residual, which is a documented input. No external reference dataset of coasted position error exists in the tree and none was fetched: promoting this row to Validated needs a logged inertial dataset with position truth propagated through an independent strapdown navigator",
            oracle_kind: ReferenceImpl,
            status: Modelled,
        },
        VerificationItem {
            requirement: "Aperture navigation-versus-communications duty cycle",
            capability: "One run takes a contact plan (a list of aos_s/los_s windows, each asking the aperture for navigation or communications — the same window vocabulary `passes::predict_passes` emits, converted by `aperture_duty::windows_from_passes`), an aperture count and an explicit arbitration policy, and returns the navigation duty, the communications duty, the idle duty and the per-session outage. The policy is an input with a documented default (`navigation-priority`; also `communications-priority` and non-preemptive `first-come-first-served`), and the report carries the resolved policy, its full definition and the duty and outage definitions, because a duty figure quoted without its arbitration rule is not reproducible. The schedule is an exact interval sweep over the window boundaries, so a window that ends exactly where the next begins never contends, and navigation, communications and idle aperture-seconds are accumulated independently in that one sweep. Runnable as the `aperture-duty-cycle` scenario kind",
            module: "aperture_duty",
            tests: "aperture_duty::tests (a window that ends exactly when the next begins does not contend, and moving it one second earlier costs exactly one second — the off-by-one guard; overlapping windows beyond the aperture count put the lower-ranked session in outage, with the contention interval pinned; the arbitration policy decides which service holds the aperture, with all three policies' numbers pinned on one plan; first-come-first-served does not preempt a session already holding an aperture; a session that loses arbitration at its start acquires an aperture when one frees; the three duties account for every available aperture-second across 3 policies × 4 aperture counts; adding an aperture never increases any session outage, measured over 200 pseudo-random plans × 3 policies × every aperture count; enough apertures for every session leave no outage at all; the reporting horizon clips the plan and sets the duty denominator; a predicted pass list becomes a contact plan without a second window type; the bundled plan duty numbers are engine outputs for one and two apertures; the report states the policy that produced the numbers; every reported figure carries a unit and a provenance class; the scenario is reproducible and declares itself MODELLED; the scenario rejects a plan it cannot schedule); api::tests::aperture_duty_cycle_kind_round_trips_through_the_dispatch",
            oracle: "Internal consistency, from three quantities computed by different expressions in the same sweep and then required to close. Navigation aperture-seconds, communications aperture-seconds and idle aperture-seconds are accumulated separately — idle from (apertures − |served|) per elementary interval, never as a remainder — and their sum is asserted against apertures × horizon_s, which a mis-bracketed boundary, a double-counted interval or a dropped one breaks immediately; the per-session served times are separately required to add back to the two service totals. The scheduler's structural properties are measured rather than assumed: served time is asserted non-decreasing in the aperture count over 200 pseudo-random plans for all three policies (not obvious for the non-preemptive policy, where an extra aperture changes who holds what at every later boundary), and the boundary arithmetic is pinned at the touching/one-second-overlap pair where an off-by-one would otherwise hide. The pass-predictor bridge is checked against `passes::predict_passes` output: with one aperture and no competing service the navigation aperture-seconds equal the predictor's own summed pass durations. No external oracle is claimed and none exists: the capability supersedes hand arithmetic rather than being checked against it, the bundled contact plan is illustrative rather than flown, and no operational scheduler publishes a plan-plus-answer pair with its arbitration rule stated — a duty computed under an unstated policy is not comparable to one computed under a stated one, and the policy dependence is measured (navigation duties of 100/150 vs 50/150 on the identical plan). Slew and changeover time, data volume, buffer state, energy and link closure are excluded in the report label rather than silently modelled",
            oracle_kind: InternalConsistency,
            status: Modelled,
        },
        VerificationItem {
            requirement: "Lunar surface-navigation RF jamming (per-satellite J/S)",
            capability: "Lunar-native jammer-to-signal ratio, effective C/N₀ and loss of lock for a selenographic surface user under a lunar surface (or raised) jammer, over the illustrative public-source Moonlight/LCNS-class constellation. Composes the open jamming chain (j_over_s_db, effective_cn0_dbhz, rx_antenna_gain_db, lock_status, q_factor, nominal_cn0_dbhz, free_space_path_loss_db) with the open lunar sky geometry (lunar_service::LunarConstellation + topocentric, lunar::selenographic_to_mcmf); no geometry or radiometry is re-derived. Unlike the Earth `jamming` kind the signal leg is not a fixed received power: each satellite's isotropic received power is its own link-budget EIRP − FSPL(slant range), so J/S varies satellite by satellite with lunar range and elevation. Emits ONE ROW PER VISIBLE (epoch, satellite) LINK as JSON and as a *.table.csv artifact, with both received powers the J/S is the difference of printed alongside it; aggregate figures of merit sit beside that table, never in place of it. Runnable as the `lunar-jamming` scenario kind",
            module: "lunar_jamming (composing jamming, lunar_service, lunar)",
            tests: "lunar_jamming::tests (17 lib tests: j_over_s_equals_the_difference_of_two_independent_link_budget_runs; the_report_prints_both_link_budget_legs_so_the_difference_is_checkable_from_it; the_scenario_reports_one_j_over_s_row_per_visible_satellite_and_never_a_median; a_single_median_j_over_s_would_misreport_the_outcome_that_the_table_reports; a_closer_jammer_raises_j_over_s_by_exactly_the_free_space_loss_difference; a_more_distant_satellite_is_the_weaker_signal_so_it_carries_the_higher_j_over_s; j_over_s_is_invariant_to_the_user_antenna_boresight_gain; a_narrowband_jammer_leaves_a_higher_effective_cn0_than_broadband_at_equal_js; a_selenographic_jammer_gets_its_range_from_the_shared_lunar_geometry; a_strong_enough_jammer_takes_every_lunar_link_below_the_tracking_threshold; no_jammer_is_a_clean_sky_lunar_baseline_with_an_undefined_j_over_s; raising_the_elevation_mask_can_only_remove_rows_never_change_the_ones_that_remain; every_emitted_numeric_field_has_a_unit_and_a_provenance_class; the_csv_table_carries_every_row_of_the_json_table; the_run_is_deterministic_and_the_dispatch_surface_is_populated; bad_inputs_are_rejected_rather_than_producing_a_number); api::tests::lunar_jamming_kind_round_trips_through_the_dispatch_with_a_per_satellite_table",
            oracle: "Composition cross-check against an independent in-repo code path: every per-link J/S is re-derived as the difference of two link budgets computed with linkbudget::received_signal_power_dbw, whose free-space loss is the single expression 20·log10(4πRf/c) rather than the three-term sum jamming::free_space_path_loss_db uses — the two agree to < 1e-9 dB on every row (measured worst case 7.11e-14 dB, i.e. float round-off). The underlying interference chain it composes is separately externally anchored in tests/gnss_denied_jamming_resilience_reference.rs (independent numpy/scipy re-derivation of J/S and effective C/N₀ pinned to Kaplan & Hegarty §9.4, plus JammerTest 2024 measured C/N₀, Zenodo 10.5281/zenodo.15910563); the lunar geometry it composes is the lunar_service/lunar geometry with its own oracles. Closed-form identities checked here: a halved jammer standoff adds exactly 20·log10(2) dB to every row; J/S is exactly invariant to the user-antenna boresight gain while C/N₀ moves by exactly that gain; an elevation mask changes no surviving row bit-for-bit. The row itself stays ReferenceImpl/Modelled: no measured lunar jamming campaign exists to validate against, and the constellation is an illustrative public-source Moonlight/LCNS-class geometry, not a flown ephemeris",
            oracle_kind: ReferenceImpl,
            status: Modelled,
        },
        VerificationItem {
            requirement: "Lunar denial contour with an uncertainty band from the measured C/N₀ spread",
            capability: "The `lunar-jamming` report no longer rests its denial contour on one scalar. It emits the full measured wanted-signal C/N₀ distribution over the per-satellite table — n, min, p05, p25, median, p75, p95, max, mean, sample stdev, and the sample's own asymmetry (p95 − median) − (median − p05) — beside the per-link rows, which are unchanged. The contour is then reported at each of those order statistics under BOTH denial criteria the engine recognises, never one in place of the other: the incumbent power-ratio criterion (J/S = 30 dB, the same threshold attack_surface and tracking_loop use, and the criterion behind the released lunar link-jamming table's `denial` column), and the loss-of-lock criterion (the effective C/N₀ falling to tracking_threshold_dbhz), which is the criterion this report's own links[].status column is scored with. Each contour point is given on both axes of the denial plane — the jammer EIRP required at the scenario's standoff, and the denial standoff at the scenario's EIRP — so the band is an interval on the same axes a contour plot is drawn on. The band edges ARE contour(p05) and contour(p95): the same closed-form map applied to the sample's own quantiles, not a sigma fitted to the sample and not median ± k·stdev, and the report says so in a band_definition string beside the numbers. stdev is emitted for continuity and is used by nothing. A quantile whose C/N₀ is already at or below the tracking threshold has no finite denying J/S; those columns are emitted as null with a counted reason rather than as an infinity or a clamped radius",
            module: "lunar_jamming (denial_js_db, range_for_free_space_path_loss_m, Cn0Distribution, DenialContourPoint, ContourBand, DenialContour; inverting jamming::effective_cn0_dbhz, jamming::j_over_s_db and jamming::free_space_path_loss_db)",
            tests: "lunar_jamming::tests (10 lib tests: the_contour_is_the_exact_inverse_of_the_functions_the_rows_were_scored_with; the_band_is_the_measured_quantiles_pushed_through_the_contour_not_a_sigma; the_asymmetry_the_band_carries_is_the_samples_own_shape_bent_by_the_criterion; the_contour_is_monotone_in_cn0_measured_over_a_dense_sweep_not_assumed; the_band_recovers_the_split_verdict_the_single_scalar_contour_lost; the_distribution_is_the_tables_own_order_statistics_and_keeps_the_rows; a_link_already_below_the_threshold_gets_a_null_contour_point_not_a_number; a_clean_sky_run_has_no_contour_at_all_rather_than_an_empty_one; the_denial_threshold_is_the_same_thirty_decibels_the_rest_of_the_engine_uses; the_units_block_describes_the_contour_and_names_nothing_the_report_omits)",
            oracle: "Internal consistency against the engine's own forward functions, which is all this capability can honestly claim. Every contour point is a closed-form inversion, and each inversion is checked by pushing its answer back through the FORWARD function the report's own rows were scored with: the J/S column through jamming::effective_cn0_dbhz (which must return tracking_threshold_dbhz to < 1e-9 dB-Hz), the standoff column through jamming::free_space_path_loss_db and jamming::j_over_s_db (the same J/S to < 1e-9 dB), the EIRP column through jamming::j_over_s_db at the scenario's own standoff. The contour is further checked to be the BOUNDARY of the denial set rather than a point inside it — lock_status loses lock on a strict inequality, so the verdict is measured to flip from DEGRADED to LOST across 1e-4 dB of J/S either side of the contour, which an off-by-an-epsilon contour would fail. The strongest check is per-link rather than per-quantile: applying the same map to every row's own C/N₀ reproduces the report's status column exactly — 0 disagreements on 38 of 38 rows at the documented operating point (kind = lunar-jamming, every input default except jammer.range_m = 25 000 m), where 26 rows are LOST and 12 are not. Monotonicity is measured, not assumed: 20 001 samples across [tracking_threshold + 1e-3, 80] dB-Hz, 0 violations of a strictly decreasing standoff and a strictly increasing required power, so the quantile ordering of the band is demonstrated rather than asserted. ExternalDataset is declined and Validated with it: no measured lunar jamming campaign exists to compare a denial radius against, the constellation is an illustrative public-source Moonlight/LCNS-class geometry rather than a flown ephemeris, and the contour's inputs (EIRP, jammer power, antenna gains, noise temperature) are representative magnitudes. ReferenceImpl was considered and declined too — the inverse and the forward expression are the SAME algebra read in two directions, so the round trip catches transcription and sign errors but is not an independent implementation; calling it a cross-check would be the borrowed-independence move the matrix invariants exist to prevent. What the band buys is measured and quoted rather than asserted: at that operating point the single-scalar contour is 27.402916 km and puts 25 km on the denied side for all 38 rows, while the band 21.256108 .. 29.921360 km contains the operating point and therefore reports the split the table actually shows. The two criteria are also measured to disagree — the power-ratio band (38.186527 .. 53.691675 km) does not contain 25 km at all — which is why both are printed",
            oracle_kind: InternalConsistency,
            status: Modelled,
        },
        VerificationItem {
            requirement: "Cross-modality integrity monitor detection power",
            capability: "The hybrid-optical-rf report states what the cross-modality chi-square monitor can actually DETECT, not only that it passes a fault-free case: the minimum detectable bias per monitored axis (east, north, up, clock) at the scenario's stated false-alarm and missed-detection probabilities, the detection-power curve either side of it, the noise-free bias multiple at which the realised statistic first crosses the threshold, and the time-to-detect for a bias ramp at a stated rate. Faults are also injected through the real monitor and the statistic it returns is reported alongside the analytic prediction",
            module: "hybrid_integrity",
            tests: "hybrid_integrity::tests (the detection-power curve runs from the false-alarm rate at zero fault to 1 − P_md at the minimum detectable bias; the minimum detectable bias fed back through noncentral_chi2_cdf at the threshold the monitor itself applied returns P_md to 1e-9, on every axis and through the public helper; a bias actually injected into the RF estimate shifts the monitor's own statistic by exactly the hand-computed b²/(σ_rf² + σ_opt²); a noise-free bias is caught above √(T/λ*)×MDB and missed below it, with the injected ladder straddling that crossing; detection power is monotone in fault magnitude and identical on all four axes in MDB multiples; a seeded 200,000-sample Monte-Carlo of the monitor statistic reproduces the analytic power within 4σ at four points on the curve; the timing MDB is pinned above the timing alert limit, which is a measured weakness and not a feature; the Wilson-Hilferty quantile is measured to disagree with the monitor's exact threshold by ~4%, recording why it was not used; the ramp figure is exactly MDB/rate and scales inversely with the rate, and a non-positive rate reports null rather than zero)",
            oracle: "Two internal oracles, no external dataset. (1) Closed-form round trip: the minimum detectable bias is produced by inverting the non-central chi-square tail on the non-centrality (raim::pbias) and is verified by feeding the resulting non-centrality back through raim::noncentral_chi2_cdf at the monitor's own threshold, which must return P_md. (2) Injection vs analysis: a bias is written into the RF estimate of one axis and cross_raim::run_cross_raim is re-run, so the statistic compared against the analytic non-centrality is the one the monitor computed, not a re-derivation. A seeded Monte-Carlo of the statistic itself is carried in the tests as a third check; it is deliberately NOT in the report, because a sampled estimate would be slower and not reproducible bit-for-bit. ExternalDataset is declined: the quantity is the detection power of THIS monitor at THIS scenario's sigma allocation, and the sigma magnitudes the MDB is scaled by are Modelled representative inputs, not measurements. ReferenceImpl was also considered and declined — the Monte-Carlo samples the same statistic the analysis describes, so it catches transcription and coefficient errors but is not an independent implementation of the monitor",
            oracle_kind: InternalConsistency,
            status: Modelled,
        },
        VerificationItem {
            requirement: "Post-handover covariance re-growth against the alert limit",
            capability: "The hybrid-optical-rf report exposes the filter's process-noise model and states how long the post-handover solution stays inside the alert limit: for both handoff directions it carries the per-axis covariance the handover left behind, propagates it forward under a stated random-walk process noise, and reports the time at which the coverage-scaled 1σ reaches the horizontal, vertical and timing alert limits, which limit binds first, the variance doubling time constant, and a sampled coast profile that brackets the crossing. Process-noise PSDs, the coverage factor and the alert limits are all inputs with documented defaults",
            module: "hybrid_integrity",
            tests: "hybrid_integrity::tests (the coast starts from exactly the covariance trace the handoff block reports, for both directions, so the replayed diagonal cannot drift from the reported handover; the reported crossing time is recomputed from the report's own handover sigma, process-noise PSD and coverage factor, and the bound is inside the alert limit just before it and outside just after; the coast time scales exactly inversely with the process-noise PSD and shortens when the alert limit tightens; a zero-PSD coast reports null rather than a zero time, because never is not immediately; the emitted profile crosses exactly once and brackets the reported crossing; the variance doubling time and the alert-limit crossing time are pinned apart, being eight orders of magnitude different after the tight optical stage and within one order of magnitude after the loose RF stage; leaving the optical modality buys more coast time than leaving RF, by exactly the covariance difference divided by the horizontal growth rate; and random_walk_time_to_limit separates already-outside, crosses-at-t and never-crosses)",
            oracle: "No external oracle. The crossing is a closed-form solution of the random-walk variance growth, and the tests recompute it independently from the values the report itself publishes rather than from the emitter's internals. The starting covariance is pinned bit-for-bit to the trace the existing handoff block already reported, so the coast cannot propagate a covariance nobody else saw. The process-noise PSDs are MODELLED representative inputs and the crossing times scale directly with them, which the scaling test states as a measured property rather than a claim. ExternalDataset is declined deliberately: the coast time is a direct function of two Modelled PSDs and of alert limits that are themselves representative, and there is no measured lunar optical/RF handover coast to compare against. An external oracle here would need a published post-handover covariance-growth or holdover-accuracy curve for a comparable receiver with its process-noise model stated, checked to a tolerance",
            oracle_kind: InternalConsistency,
            status: Modelled,
        },
        VerificationItem {
            requirement: "Off-boresight antenna pattern in the lunar geometry export",
            capability: "The per-satellite geometry export carries, per (epoch, satellite), the off-boresight angle AT THE SATELLITE and the transmit gain toward the site from the real uniformly-illuminated circular-aperture (Airy) pattern, and reports the in-beam count under that pattern BESIDE the in-beam count under the symmetric gain-to-beamwidth approximation (θ_3dB[deg] = √(31000/G_lin)), with the difference emitted as an explicit correction in links, in satellites per epoch, and as the worst single epoch. Both implied aperture efficiencies of the approximation are emitted (0.641 against the 70·λ/D degrees rule it is quoted with, 0.920 against a uniform circular aperture) so the efficiency it silently assumes is stated rather than inferred. Off by default: the block appears only when an export site and an aperture are both given",
            module: "lunar_service, antenna",
            tests: "antenna::tests and lunar_service::tests (the half-power crossing located by bisection on the pattern matches the published Airy x = 1.61634 and yields the exact 1.02899·λ/D width, recording that the conventional 1.02 coefficient sits at −2.955 dB not −3.010 dB; the pattern is strictly decreasing over 400 points from boresight to the first null; the implied-efficiency algebra round-trips to 1e-12 and reproduces 0.641 / 0.920; the off-boresight angle matches tan θ = R·sin γ/(r − R·cos γ) at 20 points and both limits to 1e-12; the approximate cone contains the real beam row by row; the headline counts equal the per-row flags they summarise and the correction equals their difference; every row verdict is recomputable from the emitted report alone; every emitted numeric and boolean field has a unit and a provenance class; an impossible aperture emits no block; with no antenna configured the export keeps exactly its six pre-existing keys, 0 leaves changed and 0 removed)",
            oracle: "Mixed, and separated rather than pooled. The PATTERN underneath is externally validated and keeps its own row (a scipy.special.j1 fixture to < 0.05 dB in tests/validate_p1_orbital_footprint.rs, plus here the published Airy half-power abscissa x = 1.61634 located by bisection rather than assumed). The GEOMETRY is checked against closed-form triangle trigonometry written as a different expression from the dot product under test. The CONTAINMENT of the real beam by the approximate cone is derived algebra (28.019/√η vs 29.479 degrees per λ/D), so the correction can only be non-positive for η ≤ 0.9035. But the in-beam COUNTS themselves have no external oracle: no published table gives how many satellites of a Moonlight/LCNS-class shell hold a south-polar site inside a given dish's half-power beam, and the constellation is an illustrative public-source approximation, not a flown ephemeris. The measured disagreement at the documented working point — 0 links in beam under the real pattern against 28 under the approximation, −2.33 satellites per epoch, worst epoch 3, on 76 evaluated links — is therefore a MODELLED finding about the approximation, pinned as a regression literal (the nearest row sits 0.069° from either beam edge, four orders of magnitude above any last-digit disagreement), not an externally validated coverage number. Labelling the row ExternalDataset on the strength of the pattern's own external anchor would be borrowed validation, which is the move the matrix invariants exist to prevent",
            oracle_kind: InternalConsistency,
            status: Modelled,
        },
        VerificationItem {
            requirement: "Tracking-loop loss of lock and spoof pull-in under interference",
            capability: "Loss of lock computed from loop dynamics instead of a power ratio: carrier (Costas) and code (non-coherent early/late) 1σ thermal jitter against C/N₀ with the squaring loss, against the stated rules 3σ_PLL + θ_e ≤ 45° and 3σ_DLL + ramp lag ≤ d/2 chips; drop and re-lock C/N₀ thresholds with the binding loop named and the hysteresis DERIVED from the wider pull-in bandwidth rather than asserted; the declared time to lose lock from a two-threshold lock detector with confirmation dwells, reported separately from the physical phase-escape time (Viterbi mean time between cycle slips, in log₁₀ s because it spans hundreds of decades); the largest code slew and carrier Doppler rate the victim's loops can follow; and the DENIAL RADIUS the loop dynamics imply reported alongside the existing power-ratio radius with their signed difference as its own named field. Runnable as the `tracking-loop` scenario kind",
            module: "tracking_loop (composing sdr, jamming)",
            tests: "tracking_loop::tests (open-loop Costas discriminator jitter against sdr::correlate stepped forward on seeded synthetic IF, 3 pooled noise realisations × 900 epochs, agreeing to 0.63% over 35-45 dB-Hz, with the squaring-loss term required to fit at least 3× better than the no-squaring-loss form wherever it is resolvable; the ~32 dB-Hz atan-discriminator saturation asserted rather than merely stated, so the validity limit is pinned; closed-loop σ against a stepped sdr Costas loop over 4000 epochs to 3.7%; first-order DLL ramp lag against a stepped sdr DLL to 0.17%; bessel_i0 against tabulated I₀ to 7.4e-8; the hysteresis width required to fall in [5·log₁₀ r, 10·log₁₀ r] across 4 ratios × 2 integration times × 3 bandwidths); api::tests::tracking_loop_kind_round_trips_through_the_dispatch",
            oracle: "The engine's own sdr correlator (sdr::correlate / synth_if / CaCode) stepped forward on seeded synthetic IF at a calibrated C/N₀ — a separate code path reaching the same numbers by numerical correlation of sampled IQ rather than by an algebraic jitter expression, so it is a different route and not a restatement — plus standard tabulated modified-Bessel I₀ values for the cycle-slip term. Loop theory per Kaplan & Hegarty ch. 8 and Viterbi/Gardner for the slip time. The row stays ReferenceImpl/MODELLED: the cross-check lives in this same codebase, and the bessel_i0 check validates one special function rather than the tracking model, so promoting the row on that basis would be self-serving labelling. ExternalDataset would need a recorded raw-IF dataset with ground-truth C/N₀ and an annotated loss-of-lock instant (TEXBAT/OAKBAT class); none ships in this tree, and even with the IQ those datasets publish no per-epoch loop-state truth, so a declared loss-of-lock time could only be validated against some other receiver's lock detector, which is a modelled choice and not an oracle. The loop bandwidths, integration time, correlator spacing, pull-in ratio, dwells, jammer power and antenna gains are representative band figures, not a datasheet",
            oracle_kind: ReferenceImpl,
            status: Modelled,
        },
        VerificationItem {
            requirement: "Lunar-VLBI station-coordinate covariance from a tracking schedule",
            capability: "Delay partials accumulated over a schedule of baselines × epochs into a Fisher information matrix, inverted to the station coordinate covariance and the per-coordinate station sigma, replacing an assumed isotropic equipartition link from a scalar delay precision. The state carries Earth-fixed (ITRS) station coordinates, so the Jacobian is the inertial partial rotated by each epoch's GCRS→ITRS matrix and Earth rotation is what makes those coordinates observable — the report MEASURES the Earth-fixed line-of-sight sweep and the beacon declination rather than assuming them. Rank, datum defect, condition number, the information spectrum and the free-network null space are emitted on every run, and under a rank deficiency the headline sigma is published as NULL with a status rather than read out of a near-singular inverse. The equipartition value c·σ_τ·√(g/N) for the SAME schedule is printed beside the computed one with their ratio, together with the isotropic trace bound √(p/trace(M)) that AM-HM makes a hard floor. Runnable as the `lunar-vlbi-fim` scenario kind",
            module: "lunar_vlbi_fim (composing lunar_vlbi, fim, cio, lunar_frame, frames)",
            tests: "lunar_vlbi_fim::tests (24 lib tests: the analytic Jacobian against a central finite difference of lunar_vlbi::vlbi_delay_s taken through a route that rotates the state's own coordinates forward and never touches a partial derivative, agreeing to < 1e-6 of 1/c per column, with the two information matrices agreeing to < 1e-6 of the largest diagonal and the covariances to < 1e-5 relative; an orthogonal unit geometry whose covariance is c·σ_τ per axis in closed form to 1e-12, which is also the one case where the equipartition link is exact; the covariance spectrum and every station's 3-D sigma invariant under a rigid rotation of the whole network to 1e-9 with C_rot = R·C·Rᵀ pinned blockwise AND an explicit assertion that the per-axis sigmas did move, so the test cannot pass vacuously; covariance scaling exactly as σ² and as 1/N; the AM-HM trace bound never beaten; the delay closure τ_ik = τ_ij + τ_jk pinned to one ULP on the delays and on the Jacobian rows, with a redundant baseline shown to add information but never rank; a single epoch reported rank-deficient with a null headline; a longer arc measured to condition better at matched observation count; the beacon block shown unobservable on this schedule; the neglected differenced-Shapiro partial measured by finite difference at run time and emitted rather than waved away)",
            oracle: "An independent in-repo route. Every Jacobian row is re-derived by central finite difference of lunar_vlbi::vlbi_delay_s evaluated from the state's own Earth-fixed and Moon-body-fixed coordinates rotated forward through the frame chain — a path that computes no derivative and shares no expression with the analytic partials — and the information matrices the two routes build agree to < 1e-6 of the largest diagonal. The linear-algebra kernel this composes (information_matrix, crlb, sym_eig) is separately externally anchored against numpy.linalg.eigh / numpy.linalg.inv in tests/fim_observability_reference.rs, and the delay observable carries lunar_vlbi's own delta-DOR far-field oracle; the row does not borrow either status. Closed-form identities checked here and labelled as such: σ² and 1/N scaling, and √(p/trace(M)) as an AM-HM lower bound the computed sigma cannot beat, which coincides with the equipartition value only on an isotropic geometry — which is why the measured ratio is exactly the anisotropy the assumption discarded. The row stays ReferenceImpl/MODELLED: no published lunar-VLBI schedule-plus-covariance pair exists to validate against, the station coordinates and beacon site are illustrative rather than surveyed, and the Moon-centre ephemeris, station clocks, troposphere and Earth-orientation parameters are held FIXED while a real session co-estimates them with correlated scan noise, so the covariance is a Cramér-Rao bound for a reduced parameter set and is optimistic in its own right. An IVS SINEX covariance would not be comparable without that co-estimation",
            oracle_kind: ReferenceImpl,
            status: Modelled,
        },
        VerificationItem {
            requirement: "Lunar-surface-point coordinate covariance from a VLBI delay schedule, kept distinct from the Earth-station one",
            capability: "A third datum choice, `all-stations-fixed`, that holds every Earth station and estimates the BEACON's Moon-body-fixed coordinates alone — the configuration a lunar surface-point uncertainty is actually quoted for, since Earth station coordinates are an input to the delay model rather than an unknown of it. It exists because the station-level covariance and the surface-point covariance are DIFFERENT QUANTITIES separated by the lever arm ρ/B, and nothing previously stopped one being quoted against the other. The emitted `beacon_link` block carries ρ, the longest baseline, the lever arm, the surface-point form of the equipartition link c·σ_τ·(ρ/B)·√(g/N), the computed per-coordinate beacon sigma and their ratio — the ratio null rather than misleading whenever the beacon is unestimated or the matrix rank-deficient. B is taken as the LONGEST baseline present, the most favourable one, so the ratio can only understate. Runnable as `datum = \"all-stations-fixed\"` with `estimate_beacon = true`, which is refused with a message naming the missing input when the beacon is not estimated",
            module: "lunar_vlbi_fim (composing lunar_vlbi, fim, cio, lunar_frame, frames)",
            tests: "lunar_vlbi_fim::tests (7 lib tests: every datum spelling round-trips through parse/as_str and an unknown one is refused; holding every station without the beacon is refused with an error naming `estimate_beacon`; the lever arm is asserted EQUAL to ρ/B and the beacon equipartition EQUAL to the station equipartition times it, both to 1e-15, with a further assertion that the lever arm exceeds 10 so the two budgets are not confusable on this geometry; the fixture's published baseline is pinned to 10726.748 km and its 49-sample schedule asserted to yield strictly fewer than 49 mutually visible observations; the beacon spectrum on a single baseline is measured to span at least five decades and the resulting ratio asserted above 1 by AM-HM and above 100 in fact; the station-plus-beacon layout is asserted rank-deficient with BOTH computed fields null while the modelled comparand still reports. Plus a guard on the fixture itself: a top-level key spliced after an array-of-tables becomes station data instead, so the splice point is asserted and the parsed scenario checked to carry the key — the failure mode is a run that silently uses a different configuration from the one the test names)",
            oracle: "Closed-form identities, with no external oracle claimed or available. The lever arm is checked against ρ/B and the two equipartition forms against each other to 1e-15 — algebraic identities, so they catch a wiring error and nothing else, and are labelled as such. The substantive result is MEASURED rather than asserted: a delay from a fixed baseline constrains the beacon's DIRECTION, so the line-of-sight component reaches the information matrix only through the near-field range term, and the test reads the resulting anisotropy off the emitted spectrum instead of deriving it. AM-HM makes √(p/trace(M)) a hard floor, so an isotropic-equipartition link can only ever UNDERSTATE, and the computed-over-equipartition ratio is exactly the anisotropy it discarded. MEASURED on the Goldstone-like/Canberra-like pair whose chord is 10726.748 km: over 112 sampled days, 36 admit no mutually visible epoch at all at a 10° mask, the most ever mutually visible is 17 of a 49-sample schedule, and on the 73 viable days the three-component ratio runs from 113.9× to four orders of magnitude more, median 1513×, while restricting to the two transverse directions the line of sight does not starve gives 3.94× to 25.8×, median 7.8×. WHAT THIS ROW DOES NOT CLAIM: any of those figures as a property of a real campaign. It establishes that the surface-point quantity is now COMPUTED rather than assumed, and that it cannot be silently interchanged with the station-level one. Stays ReferenceImpl/MODELLED: no published lunar-VLBI surface-point covariance exists to validate against, the stations and beacon site are illustrative rather than surveyed, and the ephemeris, clocks, troposphere and Earth-orientation parameters are held FIXED, so this is a Cramér-Rao bound for a reduced parameter set and optimistic in its own right",
            oracle_kind: ReferenceImpl,
            status: Modelled,
        },
        VerificationItem {
            requirement: "Lunar differential PNT — correction-link residual budget",
            capability: "The three terms a differential correction picks up between the epoch it is computed at and the epoch it is used at, each previously left as unmodelled headroom: reference-station survey error (correlated across satellites, baseline-independent, ~1:1 position transfer and provably not DOP-amplified), correction ageing (the frozen orbit-error vector re-projected onto the line of sight the engine's own propagator puts the satellite on one latency later, plus c·σ_y(τ)·τ clock drift from the calibrated power law), and uniform link quantization over an exact ±(orbit_err + clock_err) full scale with step²/12 variance. Reported in both the range and position domains, beside — never in place of — the existing residual and protection level, with a latency curve beside the single figure",
            module: "lunar_dpnt",
            tests: "lunar_dpnt::tests (a purely-additive guard whose key-set delta is exactly {correction_link, units} with every pre-existing value bit-identical against literals captured before the change; survey error does NOT decorrelate with baseline while the orbit term does, and survives a zero baseline where the orbit term is exactly zero — the structural check that catches wiring the term into the wrong place; a 1 m station error transfers 1:1 and is proved not DOP-amplified; zero latency reproduces the un-aged residual bit-for-bit and the residual is monotone in latency, with the emitted curve equal to direct runs; the quantization step halves exactly per bit and σ² = step²/12, and the full scale tracks the injected magnitudes; each term switched off in turn recovers the other two in quadrature; equal per-satellite σ propagates to exactly σ·PDOP and that PDOP agrees with orbit::dop; every emitted field carries a unit and a provenance class, checked in both directions)",
            oracle: "Closed-form identities and self-consistency: the uniform-quantizer step²/12 variance, the exact (GᵀG)⁻¹GᵀRG(GᵀG)⁻¹ covariance propagation collapsing to σ·PDOP for equal σ, the survey term's 1:1 transfer as a consequence of û_user ≈ û_ref, and switching-off quadrature closure. The PDOP cross-check against orbit::dop shares the [−û, 1] normal matrix, so it is a consistency check and is labelled as one rather than an independent oracle. No ExternalDataset is available or claimed: no lunar surface station has a published surveyed accuracy, no lunar differential-correction link has a published latency or message format, and the quantization result is a closed form rather than a measurement. RTKLIB — already the external-code oracle for the single-difference and weighted-least-squares kernel — could be driven with a deliberately mis-surveyed base to confirm the 1:1 survey transfer, but that is independent code over the same first-order line-of-sight algebra. MAGNITUDES ARE MODELLED: the survey default is this crate's own lunar frame-realisation allocation rather than a measured station, the latency and bit count are ILLUSTRATIVE inputs, and growth of the broadcast ephemeris error VECTOR itself is not modelled at all — stated in the emitted ageing-law string, because it is the term most likely to dominate a real link",
            oracle_kind: InternalConsistency,
            status: Modelled,
        },
        VerificationItem {
            requirement: "Lunar ARAIM protection-level kernel",
            capability: "The lunar protection level's geometry-to-covariance step — (GᵀG)⁻¹ over the all-in-view and every single-fault sub-geometry, projected onto the local vertical and the horizontal block trace — and its statistical kernel: the Bonferroni detector multiplier, the Gaussian upper tail of every fault hypothesis, and the root solve mapping an integrity-risk budget onto a protection level, over a 7-point lunar service volume",
            module: "lunar_service (lunar_protection_level, lunar_protection_level_with_sigma), lunar (lunar_araim_with_sigma), raim (araim_raim)",
            tests: "tests/lunar_protection_level_reference.rs (7 service-volume cases — south-polar, mid-latitude, equatorial, raised highland — 6 to 19 satellites, σ_URE 10/30/60 m, P_HMI 1e-3 down to 1e-7, protection levels spanning 1.7e2 to 6.9e3 m: HPL/VPL against the composed RTKLIB + SciPy oracle, worst |Δ| 1.061e-8 m and 1.044e-8 m against a 1e-6 m tolerance; DOP against RTKLIB's own (GᵀG)⁻¹ to 1.790e-14 relative; K_fa against scipy.stats.norm.isf to 2.716e-11 relative; three negative controls — a 5 km satellite shift, a 1e-6 relative σ_URE change and a 0.1 % tighter P_HMI — each measured to move the protection level by at least 171× the tolerance; and a stale-fixture guard pinning the committed geometry bit-for-bit to what the engine's own constellation and visibility code produce, so a green cannot survive the constellation changing underneath it)",
            oracle: "Two established third-party implementations composed, both run offline, with the fixture regenerated end-to-end and verified byte-identical. RTKLIB 2.4.2-p13 (T. Takasu, BSD-2-Clause), commit 71db0ff, src/rtkcmn.c compiled from C source with -ULAPACK: lsq() → matinv() → ludcmp()/lubksb() inverts the normal matrix by Crout LU with partial pivoting, an algorithm unrelated to kshana's hand-written Gauss-Jordan invert4(); numpy.linalg.inv (LAPACK getrf/getri) re-inverts every one as a third independent inverse, agreeing with RTKLIB to 1.112e-12 relative. SciPy 1.17.0 / NumPy 2.4.1 (BSD-3-Clause) supply norm.isf, norm.sf (Cephes ndtri/ndtr) and optimize.brentq against kshana's Numerical-Recipes incomplete-gamma series, bisected inverse and 200-step bisection — and SciPy's direct sf is a different numerical route into the far tail than kshana's 1 − Φ, so the deep-tail cancellation is measured rather than mirrored. The vertical axis is the radial unit vector (the definition of local vertical on a spherical Moon) and the horizontal variance is the trace of the horizontal block, so no East/North azimuth convention is shared. EXPLICITLY NOT VALIDATED BY THIS ROW: σ_URE, the per-satellite fault prior and the illustrative Moonlight/LCNS-class constellation are MODELLED inputs handed to the oracle as given; and the FORM of the single-fault MHSS integrity equation is transcribed from the same published bound kshana implements — a shared closed form is a shared assumption, so this row covers a wrong evaluation of that equation, not a wrong choice of it. No third-party MHSS ARAIM implementation is reachable (RTKLIB exposes no protection-level entry point, no such PyPI distribution exists, Stanford MAAST is MATLAB), which is the outstanding upgrade",
            oracle_kind: ExternalDataset,
            status: Validated,
        },
        VerificationItem {
            requirement: "ARAIM MHSS protection levels against published reference vectors",
            capability: "The multiple-hypothesis solution-separation protection-level equation itself: all-in-view and per-fault-mode weighted least squares on an East/North/Up geometry with one clock state per constellation, the sub-solution sigmas, solution-separation sigmas and one-sided nominal-bias projections, the Bonferroni K_fa thresholds, the unmonitored-fault risk allocation, and the VPL/HPL that solve the integrity-risk equation. Runnable as the `araim-reference-check` scenario kind",
            module: "araim_reference (araim_reference_protection_levels, published_vectors), raim (araim_protection_level, araim_integrity_risk, normal_quantile)",
            tests: "tests/araim_reference_vectors.rs (2 published vectors + 6 negative controls, fixture tests/fixtures/araim_reference/wgc_araim_reference_vectors.txt: dropping the nominal bias misses the published VPL by 2.6457 m, a 10 % ISM error by 0.2798 m, K_fa at 57 modes instead of 12 by 0.4015 m, a +2 %/+5 % integrity-variance error by 0.0750/0.1971 m — and a +1 % error moves it only 0.0339 m, reported as the check's resolution limit rather than hidden; the two documents' answers each miss the other's by more than the tolerance, so the vectors are not interchangeable; the committed fixture and the compiled constants are two independent transcriptions asserted to match, so a published figure cannot be edited on one side to make a check pass; and C_int − C_acc = σ²_URA − σ²_URE = 0.3125 m² holds for all 40 transcribed variances, an arithmetic identity a transcription typo would break)",
            oracle: "EU-U.S. Working Group C ARAIM Technical Subgroup, Reference Airborne Algorithm Description Document v3.1 (20 June 2019), Appendix D worked numerical example — published INPUTS (10-satellite 2-constellation geometry matrix, C_int/C_acc diagonals, b_nom, P_sat, P_const, LPV-200 constants) and published OUTPUTS (VPL 18.3 m, HPL 13.45 m, EMT 7.2998 m, σ_v_acc 1.3694 m, K_fa_3 5.1083, and six constellation-fault intermediates), retrieved 2026-09-20, source SHA-256 7f42934488c5c2261363439fabd48385e39526df34d514f395e22b6990b6bdb7. Matched at the reference's OWN stated tolerance TOL_PL = 5e-2 m: VPL 0.0074 m, HPL 0.0437 m; EMT and σ_v_acc to their printed precision. The same subgroup's Milestone 3 Report (2016) Annex A §A.IX states the same example but is internally inconsistent — a sign typo in row 3 of G (+0.7477 where the 2019 document prints −0.7477; with the plus, the document's own σ_v_acc comes out 0.8690 m against its published 1.47 m), and a K_fa_3 evaluated at 57 fault modes while the document states N_fault_max = 1, i.e. 12, so its EMT follows the 57-mode threshold and its VPL/HPL do not. No conforming implementation can reproduce all of its outputs at once. Its geometry intermediates reproduce exactly and its protection levels are recorded as measured discrepancies (VPL 0.0171 m, HPL 0.0842 m, EMT 0.4806 m), excluded from the acceptance figure; the tolerance was not widened to absorb them. SCOPE: N_fault_max = 1 only — multi-event fault subsets are refused rather than truncated, and exclusion, the chi-square consistency check and the double-counting re-allocation step stay MODELLED",
            oracle_kind: ExternalDataset,
            status: Validated,
        },
        VerificationItem {
            requirement: "Spatial, noisy, multi-family cislunar arc-length observability",
            capability: "The cislunar arc-length observability threshold in the SPATIAL six-state CR3BP rather than the planar four-state, across DRO, L2 halo and L2 near-rectilinear halo families, with measurement noise entering the Gramian and TWO criteria reported because there is no single honest one: the published rank criterion, which is provably invariant to a homoscedastic measurement sigma (whitening multiplies the observability matrix by a scalar, leaving the relative singular-value spectrum and hence rank, defect and condition unchanged), and an estimability criterion — the first arc at which the formal 1σ position uncertainty of the chief's initial state falls below a stated bound — which is the one that does move with noise. Each threshold carries the epoch-grid bracket it sits in; an unreached criterion is null with a reason. Planar mode remains the default and out-of-plane families are refused there rather than flattened into a state that cannot represent them",
            module: "cislunar_observability, observability_gramian, intersat_range, cislunar_srif",
            tests: "cislunar_observability::tests and observability_gramian::tests (the default document pinned bit-for-bit by FNV-1a of its JSON, summary and SVG, with explicit-default values asserted to be a no-op and the eight extension keys asserted ABSENT so the capture cannot be regenerated into a self-comparison; rank invariance under a homoscedastic sigma asserted at σ = 0, 0.1, 1, 10, 100 m; σ_pos asserted to scale exactly linearly with σ to 1e-6 relative; the DRO null space asserted to be exactly the z and ż coordinate axes with the two causes separated — a range row between coplanar spacecraft has û_z = 0, and the CR3BP out-of-plane block decouples exactly at z = 0; spatial Jacobians against central finite differences and against the crate's independent 3-D range-rate observable; out-of-plane families refused in planar mode)",
            oracle: "An independent row-echelon rank by Gaussian elimination with partial pivoting confirms every six-state rank verdict — a different algorithm sharing no code with the eigen/SVD route under test. The 6×6 CR3BP state-transition matrix this composes carries its own ReferenceImpl oracle against SciPy variational integration, and the halo/NRHO initial conditions come from a corrector that reproduces the published L2 southern 9:2 Gateway orbit. The existing square-root-information-filter leg is explicitly NOT counted as corroboration: it consumes the same Jacobians and reduces to the same normal matrix, so it is a consistency check between two numerical machines, and the emitted extension label says so. NOT externally anchored, and ExternalDataset is therefore declined rather than borrowed from the STM's row: the threshold arc lengths themselves depend on the MODELLED constellation design, the epoch grid, and — measurably, by up to 40× — on the singular-value tolerance. The published planar 2.09 h is reproduced exactly at rel_tol = 1e-6 and is itself tolerance-dependent (10.25 h at 1e-4, 0.42 h at 1e-8), which is a property of the criterion rather than of the orbit. No public dataset publishes an arc-length observability threshold for a chosen cislunar constellation. MEASURED RESULT: the spatial six-state threshold is 22.17 h for the L2 NRHO and 40.42 h for the L2 halo, and DOES NOT EXIST for the planar-DRO family the published claim was derived on — rank 4 of 6 with datum defect 2 and two exactly-zero eigenvalues, a structural defect no arc length recovers",
            oracle_kind: InternalConsistency,
            status: Modelled,
        },
        VerificationItem {
            requirement: "Operational-style Earth-orientation prediction error, measured predicted-versus-final",
            capability: "A least-squares bias-plus-rate fit over a trailing window plus the principal periodic terms — annual, semi-annual and the two principal zonal tides for UT1; Chandler, annual and semi-annual for the pole — extrapolated with the last in-window residual carried forward: the class IERS Bulletin A uses, in place of the persistence predictor the published horizon rested on. Scored the only honest way: a forecast for T+h built from rapid Bulletin A rows at or before T, measured against the LATER-PUBLISHED Bulletin B final at T+h, with persistence scored over the identical epoch set against the identical finals beside it. A target epoch with no published final is dropped rather than re-scored against the rapid column; a periodic term the window cannot constrain is reported as rejected with the cycles it actually spans; an incomplete window is refused rather than quietly shortened",
            module: "frame_eop, realtime_frame_eop",
            tests: "frame_eop::tests, realtime_frame_eop::tests and tests/operational_eop_predictor_reference.rs (analytic-signal coefficient recovery to 1e-9 at a 365-day window; a bias-plus-rate fit equal to the closed-form ordinary-least-squares slope and intercept to 1e-12 on real rows; TWO look-ahead detectors that wreck the rapid UT1 and pole columns of every row after the issue epoch — leaving the Bulletin B finals intact — and demand bit-identical output, mutation-verified to turn 10 tests red when the fit barrier is loosened by exactly one day; an independently rebuilt epoch list; a target's Bulletin B block blanked and the epoch shown to leave the table; term admission checked at 6, 15, 150 and 365-day windows; monotone row counts; and a frozen pre-change capture of the default report asserted field for field with no tolerance, which additionally asserts the capture does not contain the new keys so it cannot be silently regenerated into a self-comparison)",
            oracle: "Three independent routes, none of them a published prediction-accuracy figure. (1) An analytic signal with known coefficients — the only way to exercise the periodic machinery, since no committed series is long enough to admit an annual term. (2) The textbook closed-form least-squares solution, different algebra from the matrix solve under test, on real rows. (3) The genuine archived Bulletin A prediction rows the real 2026 product publishes, compared per lead as an AGREEMENT statistic and explicitly not as an error: 0.256 ms at 1 day, 0.695 ms at 2 days, 1.252 ms at 3 days, drifting to 3.885 ms at 9 days. So this is Bulletin A's CLASS, close at short lead, not Bulletin A. The predicted-versus-final residuals are real measured quantities over real IERS rows, but their magnitude is checked only against the DIRECTION of the comparison, never against an IERS-published accuracy number — reading a real product is provenance, not an oracle. MEASURED: at day 1 the operational predictor gives 3.78 m of Moon-frame error against persistence's 11.39 m (3.01×), at day 2 10.23 m against 21.72 m (2.12×), at day 3 20.33 m against 30.57 m (1.50×) — and it is WORSE beyond three days (0.87× at 5 days, 0.43× at 10), which the report emits rather than showing only the horizons that flatter it. NOT reproduced: the autoregressive residual filter and the tabulated zonal-tide reduction, the 365-day operational window is unreachable with the committed data, and NO archived earlier vintage of the series exists in this repository — so the archived-vintage table reports no rows rather than scoring a synthesised one",
            oracle_kind: ReferenceImpl,
            status: Modelled,
        },
        VerificationItem {
            requirement: "Lunar frame datum from an observing campaign",
            capability: "The seven-parameter Helmert datum propagated from a SIMULATED OBSERVING CAMPAIGN instead of recovered from an injected transform. Earth stations observe a sourced catalogue of lunar-surface beacons over an explicit schedule; the lunar-VLBI delay partials are accumulated into a beacon-coordinate Fisher information matrix and pushed through the Helmert design A = [I₃ | [p]ₓ | p] into H = AᵀM_bA, so the reported datum accuracy is a function of the observing programme — exactly linear in the delay sigma and monotone in the arc through the libration the report MEASURES. The datum defect is the subject rather than a footnote: rank, defect, condition number, spectrum, unobservable directions in the seven-parameter basis, the weakest direction even at full rank and each parameter's share of it are emitted on every run, and any parameter the campaign does not constrain is published as NULL with a status. Beacon-error correlation is MEASURED, not assumed — exactly zero with the stations held fixed, and printed with its cost when they are estimated. Runnable as the `lunar-frame-campaign` scenario kind",
            module: "lunar_frame_campaign (composing lunar_vlbi, lunar_vlbi_fim, fim, lunar, lunar_frame_realise, frames, cio, lunar_frame)",
            tests: "lunar_frame_campaign::tests (21 lib tests: the Helmert design against a central finite difference of lunar_frame_realise::apply_helmert — the module the datum is FOR, which computes no derivative and so pins the [p]ₓ sign convention — all 84 design entries agreeing to < 1e-6; a pure network translation read back as a pure translation with < 1e-6 leakage into the other six parameters; the datum sigma exactly linear in the delay sigma to 1e-8 over a 3× change on all seven parameters; a 16 h arc measured worse and a 48 h arc measured better than 24 h, with the emitted libration sweep ordered the same way; the worst translation axis asserted to BE the dominant axis of the separately measured body-fixed direction to Earth and worse than the others by > 5×, a physics oracle nothing in the solver was told about; three collinear beacons producing a defect with every datum sigma NULL and the null directions emitted in the seven-parameter basis; offblock_fraction and inter-beacon correlation exactly 0.0 with the stations fixed and both > 0 with them estimated; the comparison block's injected-transform figures shown equal to an independent run of that scenario to 1e-14 relative rather than transcribed; a guard that no injected/recovered datum appears anywhere in the document; the lunar-frame-realisation emission pinned byte-for-byte by FNV-1a-64 over json‖summary‖svg for three input shapes, fingerprinted before the work began)",
            oracle: "Closed-form identities and an independent in-repo route, with no external oracle claimed. The Helmert design — the only new derivative in the module — is re-derived by central finite difference of lunar_frame_realise::apply_helmert, a path sharing no expression with the analytic form. The accumulation it composes is lunar-vlbi-fim's, whose Jacobian is finite-differenced against lunar_vlbi::vlbi_delay_s there, and whose linear-algebra kernel is separately externally anchored against numpy in tests/fim_observability_reference.rs — this row borrows neither status. The physics oracle is structural rather than numerical: a beacon delay partial is the near-field DIFFERENCE of two near-parallel unit vectors, so the worst-determined translation direction MUST be the body-fixed direction to Earth, and the test asserts the computed answer against the separately measured direction. MEASURED: campaign-derived translation sigma 6.3975 m against the injected-transform scenario's 0.3125 m recovery error (20.5× tighter), while rotation and scale run the OTHER way at 2.32× and 13.5× looser — the injected path assumes one isotropic sigma and so spreads its error uniformly across seven parameters, which the delay observable does not. Rank 7/7 but condition 3.8e5, with one direction 99.57 % pure translation-toward-Earth and forty times worse than any other. WHAT THIS ROW DOES NOT CLAIM: that the campaign figure is right in absolute terms. It establishes that the figure now DERIVES from a schedule, a geometry and an error model rather than from a planted answer. Stays ReferenceImpl/MODELLED: no published lunar-VLBI campaign-plus-datum-covariance pair exists, the station network and delay sigma are ILLUSTRATIVE inputs (the beacon catalogue is sourced, the campaign is not), observations are treated as independent while a real session's troposphere and clock are correlated between nearby scans, and the ephemeris, clocks, troposphere and Earth-orientation parameters are held FIXED",
            oracle_kind: ReferenceImpl,
            status: Modelled,
        },
        VerificationItem {
            requirement: "Independent-estimator corroboration of the cislunar arc-length threshold",
            capability: "A batch least-squares estimator that RECOVERS the chief's initial state from simulated inter-satellite measurements over growing prefixes of the same epoch grid the rank-vs-arc table uses, with the measurement partials taken as central finite differences of the composed forward model. It consumes none of the machinery the threshold was measured with — no analytic Jacobian row, no variational state-transition matrix, no singular-value or eigen decomposition, no rank tolerance, no square-root information filter — and shares only the dynamics, the initial conditions, the scalar observable and the epoch grid, each named in the emitted document. Two criteria, both swept: noise-free recovery (the rank analogue) and Monte-Carlo estimability (the estimability analogue, measured against a known truth rather than predicted from a covariance). Runnable as the `cislunar-arc-recovery` scenario kind",
            module: "cislunar_arc_recovery, batch_ls",
            tests: "cislunar_arc_recovery::tests and tests/cislunar_arc_recovery_reference.rs (both boundaries and their ratios pinned on the published grid; the measured error curve compared to the formal covariance row by row with a per-row factor-of-two bound and a geometric-mean bound; a NEGATIVE CONTROL — the planar-DRO six-state — asserting the criterion CAN fail and that the unregularised estimator diverges past 1e6 km rather than returning a plausible small error; parameterisation invariance asserted on every prefix to 1e-3 relative; a source-text guard that strips comments, string literals and the test module and then fails on any mention of the Jacobian, STM, SVD-rank or SRIF machinery, mutation-verified by injecting a forbidden call; a test-only check that the finite differences equal the analytic rows, so the linearisation is known good while the analytic route stays absent from the estimator; determinism asserted byte-for-byte; the released cislunar-observability document pinned by key set, canonical fingerprint and summary line)",
            oracle: "A separate estimator in this codebase on a different algorithm and a disjoint code path: nonlinear weighted Gauss-Newton with finite-difference partials, its verdict read as a measured state-recovery error in km and mm/s. It has no expression in common with the Gramian's rank-and-covariance route, and the separation is ENFORCED by a source-text guard rather than asserted. MEASURED on the published planar DRO grid: the ESTIMABILITY criterion is CORROBORATED — the measured Monte-Carlo boundary is 5.739130 h against the formal 5.739130 h (ratio 1.0000), and the measured RMS reproduces the formal 1σ over 21 arc lengths to a geometric-mean ratio of 0.9804. The RANK criterion is NOT corroborated as a recoverability boundary: the estimator recovers from 0.782609 h against the Gramian's 2.086957 h, ratio 0.375, and at 1.826087 h — the last prefix the rank read scores 3 of 4 — recovers to 1.96e-5 of the a-priori displacement. The recovery boundary is unmoved over three decades of its own bound while the rank threshold spans 'never' to 0.782609 h over four decades of rel_tol, and the two coincide exactly at rel_tol = 1e-8. That span was first recorded as reaching 0.260870 h; that figure was an ARTEFACT, produced by a rank read that counted 4 directions from 2 measurement rows below the f64 noise floor, and it is corrected here rather than left standing. The rank read is now bounded by Sylvester's inequality with the reason emitted, and the corrected span saturates at exactly the arc where the independent estimator recovers, which strengthens this row's cross-validation rather than weakening it: the published 1e-6 is a conservative singular-value CONVENTION, not a statement about recoverability. Same pattern spatially: NRHO 9.290323 h against 21.677419 h, halo 22.978723 h against 39.829787 h, with estimability agreeing exactly in both. The planar-DRO six-state recovers at no arc, independently reproducing that family's structural datum defect from an estimator told nothing about it. NOT externally anchored — the dynamics and initial conditions are shared with the analysis under test and no public dataset publishes such a threshold — so ExternalDataset is declined",
            oracle_kind: ReferenceImpl,
            status: Modelled,
        },
        VerificationItem {
            requirement: "Lunar service volume from real, retrieved constellation geometry",
            capability: "Accepts a tabulated Moon-centred state ephemeris (the evaluation of an SPK/BSP kernel) or a published constellation definition behind `ephemeris_path`, runs the identical coverage / DOP / protection-level sweep against it, and emits the σ_URE ranging requirement it implies BESIDE the unchanged illustrative Keplerian and perturbed results with the difference as its own named quantity. Every figure carries a provenance class that distinguishes kernel-derived from published-element-derived from modelled, so the two can never be confused in a downstream quotation",
            module: "lunar_ephemeris, lunar_service",
            tests: "lunar_ephemeris::tests (format and frame parsing; Lagrange interpolation exact at nodes and on a linear track off-node; ICRF elements take the IAU 2015 reduction and are byte-equal to an explicit icrf_to_iau_moon application; true↔mean anomaly round-trips against a forward Kepler solve; malformed files refused with the reason named). lunar_service::tests (with `ephemeris_path` unset the report's key set and SHA-256 are pinned; the Keplerian row equals the standalone Keplerian run field for field; the identity σ_required · HPL_max / σ_URE = AL, then an END-TO-END re-run at the computed requirement reaching 100 % protection-level availability and a re-run 1 % above it not reaching it; every emitted numeric field of both new blocks walked from the produced JSON for a unit and a provenance class; the committed fixtures matched to their source tables satellite for satellite; a horizon past the end of a table refused)",
            oracle: "The GEOMETRY is external and hashed: three fixtures whose numbers come only from documents retrieved with URL, retrieval date and SHA-256, regenerable by committed generators that verify the upstream hash and ABORT rather than emit a number — the LANS interoperability-demonstration reference constellation (NASA NTRS 20250009447, SHA-256 d1b916be…), the LNCSS case studies (NAVIGATION 70(4) navi.613, CC BY, SHA-256 4e294687…), and a genuine flown-spacecraft ephemeris for LRO, Danuri, Chandrayaan-2 and CAPSTONE evaluated from JPL's own reconstructed kernels via Horizons. NO lunar-navigation constellation kernel exists publicly — Moonlight/LCNS, LCRNS and LNSS are not flying and NAIF publishes nothing for them — and none was invented. The DERIVED σ_URE requirement has NO external oracle (nobody publishes the ranging accuracy a 50 m lunar HPL demands over this service volume), so it is checked against its own algebraic identity and, independently, by re-running the whole sweep at the computed requirement and confirming availability flips there. MEASURED: the published 8-satellite design needs σ_URE 2.9044 m at 100 % coverage against the illustrative constellation's 0.3591 m at 37.85 % — an 8.09× revision of a published number under programme rule R4. The qualitative conclusion survives (LNIS-class 30 m still does not close a 50 m south-polar HPL) but the shortfall was overstated eightfold. The 5-satellite LANS demo yields ZERO protection-level samples — five satellites cannot give the six-in-view a single-fault hypothesis set needs — and the requirement field is ABSENT rather than fabricated; likewise for the four real spacecraft at 0 % coverage. InternalConsistency is the honest kind: the INPUT data is external and hashed, but the quantity this row is about is validated only against itself",
            oracle_kind: InternalConsistency,
            status: Modelled,
        },
        VerificationItem {
            requirement: "Unit and provenance declared for every reported quantity",
            capability: "A machine-readable schema giving unit, provenance class and definition for every numeric field of every scenario report, plus a single global gate that runs every registered scenario kind and fails if an emitted numeric field lacks either. The provenance vocabulary is closed and each class carries an evidence tier, with two classes deliberately mapped to `inherits-scenario-label` and `depends-on-input` rather than being assigned a tier the class does not determine",
            module: "field_schema",
            tests: "tests/field_units_global.rs (all 58 registered kinds run, one document shape each, ~31 s: every numeric leaf must resolve to an entry in that document's own units block; a malformed entry counts as missing for EVERY kind, exempt or not, so a placeholder buys no coverage; the exemption list may not exceed its pinned ceiling, a listed kind that turns out to be fully covered FAILS the gate so the list cannot be padded, and a registered kind absent from the runner table fails so a new pack cannot slip in unexamined — which it did, catching both kinds added after this work began; a one-way ratchet on the described-but-undefined backlog; and a staleness check on the committed schema document); field_schema::tests",
            oracle: "The emitted document itself: every numeric leaf must resolve to an entry in that document's own units block. There is no external unit registry to check a DECLARED unit against, so a declared unit is a reviewed assertion and not a verified one — the gate verifies COMPLETENESS and WELL-FORMEDNESS, not truth, and Validated would be wrong because nothing external confirms that `m` is the right unit for a field named `_m`. An independent name-suffix cross-check was run over the 1,434 described fields: of the 691 carrying a unit-bearing suffix, 40 disagree with the declared unit and all 40 are explained (per-second suffixes, minima, aperture-seconds, newton-metres against a nanometre-looking suffix), so no wrong unit surfaced. COVERAGE MOVED 7 of 56 kinds to 56 of 58, and 389 of 1354 fields to 1434 of 1477. Two kinds remain uncovered and are named with reasons rather than hidden behind a wildcard: `sweep-nd`, two of whose columns are caller-keyed so their units are data, and `cislunar-observability`, whose released document is byte-frozen by an explicit additivity pin asserting it has no units key — adding one is a decision about that pin, not about units. The work also surfaced twelve unit or documentation defects in existing code, reported rather than fixed under R1",
            oracle_kind: InternalConsistency,
            status: Modelled,
        },
        VerificationItem {
            requirement: "Lunar frame datum from a REAL observing campaign",
            capability: "The seven-parameter Helmert datum covariance, with its two simulated inputs replaced by measured ones: the schedule is the ground-transmit epochs of 337 archived ILRS lunar laser-ranging normal points (2015-04-08 to 2015-06-27, Grasse MeO 7845 and Matera MLRO 7941, all five retroreflector arrays) and every observation weight is that point's own archived precision bin_rms/√n_raw — median 5.13 mm of one-way range, read out of the file. Station coordinates IERS ITRF2020, reflector coordinates JPL DE430 Table 7. Runnable as the `lunar-llr-datum` scenario kind",
            module: "lunar_llr, realdata::llr_crd (composing fim, cio, frames, ephem, lunar_frame, lunar_frame_campaign)",
            tests: "tests/lunar_llr_real_data.rs (11 tests: all 15 committed CRD files byte-identical to their recorded digests; all 349 records accounted for, 337 used and 12 skipped for a named reason; every archived range inside the real perigee/apogee envelope; the weights shown to BE bin_rms/√n_raw; the line-of-sight coordinate best determined for every array with the libration sweep that buys it measured separately; the residual and its independent confirmation against JPL Horizons; the 0.1-degree geometry-tilt sensitivity; the simulated-campaign comparison shown equal to an independent run of that scenario; an R1 bit-for-bit pin on the three pre-existing lunar frame packs); lunar_llr::tests (12: the range partial against a central finite difference of the modelled time of flight to < 1e-6 relative; the light time a converged lunar round trip; the datum sigma exactly linear in the weight scale to 1e-9; block-diagonality exact; a missing data directory refused rather than substituted; an edited catalogue row caught by its own radius column); realdata::llr_crd::tests (7: field semantics, midnight rollover, refusal of a non-UTC time scale and of an unsupported format version, and no substituted sigma for an empty bin)",
            oracle: "Closed-form identities and an independent in-repo route; NO external oracle is claimed for the covariance, because no published lunar-LLR datum-covariance pair exists to check it against. The only new derivative — the range partial with respect to the reflector's body-fixed position — is re-derived by central finite difference of the two-way light time it differentiates, a path sharing no expression with the analytic form. The physics oracle is structural: the partial of a range IS twice the line of sight, so the body-fixed coordinate along the mean direction to Earth must be determined far better than the two plane-of-sky coordinates, which only the libration reaches — measured at 50.7× to 71.7× across the five arrays against a libration sweep the report measures independently, with the isotropic small-angle prediction and the transverse anisotropy that explains the gap both printed. WHAT CHANGED: the schedule, the observation count and every observation weight are now measured; 337 of 349 archived points are used and the 12 that are not are skipped and counted, because ITRF2020 carries no position for Apache Point. MEASURED: datum translation sigma 1.851746e-2 m against the SIMULATED campaign's 6.3975 m (345×), rotation 36×, scale 24× — a ratio between a laser-range network and a VLBI-delay network, so a finding rather than a validation. Reflector information rank 15/15 with inter-array coupling exactly 0; Helmert rank 7/7, condition 2.4e4. WHAT THIS ROW DOES NOT CLAIM: that the figure is right in absolute terms. A real LLR solution co-estimates the lunar orbit, physical librations, Earth orientation, station coordinates and tidal and relativistic parameters, and reports decimetres (DE430 Table 7's own 0.12-0.27 m) where this bound is far smaller; this is a Cramér-Rao bound for a stated reduced parameter set, not an accuracy. Stays MODELLED: the Moon-centre ephemeris and the IAU 2015 body orientation are modelled, and troposphere, tides, station eccentricity, polar motion, UT1-UTC, relativistic delay and station clocks are absent. Their combined size is PUBLISHED rather than argued — observed-minus-computed one-way range 156,494 m RMS over the 337 points — and their effect on the covariance is BOUNDED rather than argued: re-solving the entire datum with every partial tilted by 0.1° (twice the measured worst-epoch ephemeris tilt, sign alternating) moves the deliverable by 0.288 %",
            oracle_kind: ReferenceImpl,
            status: Modelled,
        },
        VerificationItem {
            requirement: "Built-in analytic lunar ephemeris — its STATED ACCURACY BOUND checked against real data",
            capability: "ephem::moon_position, the low-precision geocentric lunar series the crate falls back on when no DE/SPK kernel is present, measured against real lunar laser ranging and against a published planetary ephemeris over the same span. This row validates the bound the module states about itself, NOT an accuracy: the series is confirmed to be no worse than it says, not confirmed to be good",
            module: "ephem (moon_position), lunar_llr, realdata::llr_crd",
            tests: "tests/lunar_llr_real_data.rs::the_analytic_moon_series_disagrees_with_jpl_by_the_same_amount (12 weekly geocentric states, worst-epoch angle asserted < 0.3° and RMS < 5e5 m against the module's own documented claim, plus the LLR residual asserted to agree with the radial disagreement to < 5×); ::the_measured_residual_is_the_ephemeris_error (337 real normal points)",
            oracle: "TWO independent external datasets that share nothing. (1) 337 archived ILRS lunar laser-ranging normal points (EUROLAS Data Center, DGFI-TUM, 2015-04-08 to 2015-06-27, five retroreflector arrays, committed with per-file SHA-256 and a re-download-and-verify script): observed-minus-computed one-way range 156,494 m RMS, with station coordinates from IERS ITRF2020 and reflector coordinates from JPL DE430 Table 7, so the residual is dominated by the Moon-centre series. (2) JPL Horizons geometric geocentric Moon states over the same span: 112,567 m RMS radial, 195,655 m RMS vector, worst epoch 360,324 m = 0.0536°. A range residual responds to the RADIAL part of an ephemeris error, so (1) and (2) are the same quantity reached two ways and agree to 1.39× — which is what licenses the lunar-llr-datum scenario to attribute its residual to the ephemeris. The engine's own module documentation claims ~0.3° / ~few·10² km; both measurements are inside it, the angular claim with a 5.6× margin. SCOPE, stated so no reader can mistake it: this validates the stated BOUND, not an accuracy figure. The series remains unsuitable for any application needing better than ~1e5 m, and that limitation is the row's content as much as the agreement is. Regenerable offline by the committed fetch-and-verify scripts",
            oracle_kind: ExternalDataset,
            status: Validated,
        },
        // ── Gate integrity ────────────────────────────────────────────────────
        VerificationItem {
            requirement: "Gate integrity — a green that means what it says",
            capability: "Three structural guards over the verification process itself, each closing a class of defect that reached the canonical gate as an intermittent or spurious red. (1) Every constructed temp path in the Rust sources must carry a per-call unique component; a process id is rejected, because cargo runs the library tests as parallel threads of ONE process and the pid is shared by all of them. (2) Every byte-for-byte or hash pin must declare, next to itself or in its module header, what it covers and what it deliberately excludes — so a cross-cutting change can tell at a glance which pins are in scope and which have silently become repository-wide change detectors. (3) A green is claimable only from the FULL suite: scripts/gate.sh runs `cargo test --all`, captures the true exit code with no pipe in the way, and writes a receipt naming the commit, the integration-binary count, the test count and the duration; the pre-push check refuses a push whose commit no valid receipt names, on a clean tree. Repeatability is sampled separately by scripts/check-repeatability.sh, which runs the library suite N times and fails if the set of passing tests differs.",
            module: "scripts/gate.sh, scripts/check-gate-receipt.sh, scripts/check-repeatability.sh, scripts/install-gate-hook.sh",
            tests: "tests/source_guards.rs (9 tests: both guards over the whole source tree, plus mutation fixtures that grade each guard in both directions — the F22 pattern reported on both colliding paths, the shipped atomic-sequence fix accepted, a half-fix reported on exactly the path that lost its unique component, a tempfile handle and an inherited unique directory accepted, a wall clock rejected; an undeclared pin reported, a declared one accepted, a scope without an exclusion rejected, a declaration in the enclosing test's doc comment accepted and shown not to leak to the next test; and each pin spelling — hex, decimal, digest string, byte length, named byte count, golden file — seen while algorithm constants, RNG seeds and small cardinality checks are not)",
            oracle: "Closed-form: each guard is run over a fixed known-bad snippet that must fire and a fixed known-good snippet that must stay silent, both literal constants the detector cannot influence. The two known-bad snippets are the F22 and F25 defects in their original shape. This is an INTERNAL oracle and the row is MODELLED accordingly: it proves the guards discriminate the defect from its fix, not that the classes they describe are exhaustive. Their stated blind spots — shared state that is not a path, a pin held in a short named constant, a rare race that three runs do not sample, and a receipt that anyone who can write the file can forge — are written out in the module documentation of tests/source_guards.rs and in each script's header rather than left to be discovered.",
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

    /// Render the full matrix as a titled Markdown document (the browsable
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
