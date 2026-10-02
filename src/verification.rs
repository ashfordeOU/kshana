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
//! The unit tests here check the *classification* (a Validated row must be tagged
//! external; a partner row must claim nothing; counts are consistent). Two
//! integration guards extend that to the citations themselves:
//! `tests/verification_rows_cite_evidence_that_exists.rs` requires every
//! repo-relative artefact a row names to be on disk, and
//! `tests/verification_rows_name_a_test_that_exists.rs` resolves every Rust item
//! path a row names — `navsignal::code_tests`, `eop::parse_all`,
//! `api::tests::tracking_loop_kind_round_trips_through_the_dispatch` — against the
//! crate source, and requires every non-partner row to name at least one test that
//! actually carries `#[test]`.
//!
//! What stays outside the machine's reach is the *judgement*: whether the oracle a
//! row names is a good one for the claim, and whether the prose describes what the
//! test does. Those are read by a human. So "machine-checked" here means the status
//! and oracle-kind invariants hold and nothing a row cites is missing — not that the
//! oracle has been graded — stated plainly so the artifact does not oversell itself.

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

impl OracleKind {
    /// Why a MODELLED row backed by this oracle kind is not an external validation: the
    /// sentence `docs/MODELLED-RATIONALE.md` prints for each such row, and the advanced
    /// run report quotes.
    pub fn modelled_reason(self) -> &'static str {
        match self {
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
    }
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
            requirement: "Power-law noise identification by lag-1 autocorrelation",
            capability: "allan::lag1_noise_id: the Riley and Greenhall (2004) lag-1 autocorrelation noise identifier (decimated phase with its quadratic removed, or group-averaged frequency with its line removed; repeated first differences until delta = r1/(1+r1) < 0.25 or d = dmax), returning the integer and unrounded power-law exponent alpha (+2 white PM to -2 random-walk FM) at any averaging factor; it sets the noise-type degrees of freedom of the measured clock library's device cards",
            module: "allan (lag1_noise_id, lag1_acf)",
            tests: "tests/clock_library_lag1_noise_id_allantools.rs (140 cases: ten Kasdin power-law records, b = 0 to -4, as phase and frequency data, af = 1 to 64; alpha_int and d identical, worst |d alpha| 9.6e-13 and |d rho| 4.8e-13 against 1e-9; pre-registered 2ec76864); allan::tests (lag1_identifies_white_pm_white_fm_and_random_walk_fm; lag1_is_blind_to_a_quadratic_phase_trend)",
            oracle: "allantools 2024.6 autocorr_noise_id (A. Wallin and contributors, LGPL-3.0-or-later, run as a separate program by the fixture generator): an independent implementation of the published Riley-Greenhall algorithm, a uniquely defined quantity under the stated conventions. Validates the identifier, not the noise content of any real clock",
            oracle_kind: ExternalDataset,
            status: Validated,
        },
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
            capability: "ARAIM multiple-hypothesis solution separation per the ARAIM Airborne Design Document (ADD) v4.2 (araim_reference::add_v42_protection_levels and add_v42_protection_levels_ecef: subset determination by the P_THRES and FC_THRES rules, VPL, HPL, the effective monitor threshold EMT and sigma_acc); chi-squared snapshot RAIM fault detection with single-satellite exclusion (raim::snapshot_raim, raim::snapshot_raim_fde) and slope-based HPL/VPL on the geodetic local level; and the SBAS DO-229E protection-level combination (sbas::sbas_protection_level) on the L1 service. NOT covered, stated plainly: the uniform-sigma convenience functions raim::araim_raim and raim::araim_dual_raim are NOT ADD-conformant (on matched inputs they miss Stanford MAAST by 0.75 m VPL / 4.04 m HPL and 0.39 m VPL / 1.93 m HPL, a finding); the dual-frequency multi-constellation (DFMC) L5 SBAS comparison is a finding (308 user-epoch pairs with no GEO in view are protected by Kshana and not by MAAST, whose GEO-reception gate Kshana does not model); raim::solution_separation_raim has no external comparison",
            module: "araim_reference (add_v42_protection_levels, add_v42_protection_levels_ecef); raim (snapshot_raim, snapshot_raim_fde, araim_raim, araim_dual_raim, solution_separation_raim); sbas (sbas_protection_level); lunar",
            tests: "tests/integrity_araim_stanford_oracle.rs::araim_mhss_matches_stanford_maast_add_v4_2 (270 real-geometry cases, Celestrak GPS+Galileo and IGS SP3: worst |dVPL| 2.2e-3 m, |dHPL| 1.1e-3 m, |dEMT| 2.1e-10 m against the ADD TOL_PL 0.05 m); tests/integrity_araim_stanford_oracle.rs::uniform_sigma_matched_gap_finding (the uniform-sigma gaps, pinned); tests/integrity_snapshot_raim_rtklib_oracle.rs::snapshot_raim_decisions_and_slope_levels_match_rtklib (real IGS ABMF 2018-05-13, 288 epochs, 2016 cases with injected 10 to 100 m biases: 2016/2016 detection and 801/801 exclusion decisions identical, slope HPL/VPL within 2.7e-12 m against 1e-6 m); tests/integrity_sbas_stanford_oracle.rs::sbas_l1_protection_levels_match_stanford_maast_on_real_waas_messages (2868 user-epoch pairs on real WAAS broadcasts, the same protected set, worst |dVPL| 7.1e-6 m and |dHPL| 1.6e-5 m against 1e-4 m); tests/integrity_sbas_stanford_oracle.rs::sbas_l5_finding_geo_reception_gate (the L5 finding, pinned); tests/igs_real_data.rs and tests/araim_dual_real_data.rs (plausibility on real IGS SP3 and Celestrak geometry, kept as regression checks, not oracles)",
            oracle: "Three independent tools, pre-registered (0123cee1) before any fixture or oracle output existed, tolerances fixed then. (1) ARAIM: Stanford MAAST for ARAIM 2 (commit ab70e2a3, BSD-3) mhss_raim_baseline_v5.m, run as a separate program under GNU Octave 8.4 with a driver-side unique() compatibility shim (disclosed, no algorithm change), at the ADD TOL_PL of 0.05 m: the Rust reproduces the ADD reference implementation on 270 real cases. Disclosed: the Kshana ADD path was written after the pre-registration, following the ADD as MAAST implements it; an independent hold-out by the reviewer (270 new user geometries and a second integrity support message, MAAST re-run against the frozen code) passed at the same bar. (2) Snapshot RAIM: RTKLIB v2.4.2-p13 (BSD-2) estpos/valsol/raim_fde in a separate C harness for detection and exclusion; the slope PL from RTKLIB matinv/xyz2enu plus SciPy 1.18.1 chi2/ncx2, where both sides evaluate the same closed form (Brown; Parkinson and Axelrad), so the PL check covers the implementation, not the formula. (3) SBAS: Stanford MAAST (commit 7d32b049) usr_vhpl, unmodified, on MAAST own recorded WAAS broadcasts: L1 levels within 1e-4 m after the K rescaling and an equal protected set. The same comparisons produced the findings stated in the capability: the uniform-sigma ARAIM functions are not ADD-conformant, and the L5 set equality fails on 308 pairs with no GEO in view (the levels on the 3267 pairs both tools protect agree to 1e-13 m). The DO-229E/DO-316 K-factors are transcribed constants and the real geometry is an input; neither is counted as an oracle. 0.30 revision: snapshot_raim protection levels moved from the radial to the geodetic local level (up to 0.31 m HPL and 0.14 m VPL at 16 deg N)",
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
            requirement: "Measured clock device cards (held-out prediction)",
            capability: "clock_library: a device card (white phase, white, flicker and random-walk FM plus a linear frequency drift) fitted to one third of a named measured clock record after a logged conditioning pass (gaps, phase outliers, phase steps, bursts removed; frequency steps logged), weighted by the lag-1-identified noise-type degrees of freedom, and its predicted Allan deviation scored on the held-out two thirds; readers for RINEX and IGS clock files, BIPM per-laboratory files and Circular T Section 1; conversion of a card to the slot-timing noise model, the extended Kalman clock model and the spoofing monitor's noise levels",
            module: "clock_library (card, condition, series), realdata::clk, allan (lag1_noise_id)",
            tests: "tests/clock_library_device_cards_oracle.rs (gps_iif_cards_reproduce_the_recorded_finding; receiver_training_is_blocked_by_the_epoch_minimum; non_blind_cards_are_reported; pre-registered 2ec76864); clock_library::card::tests; clock_library::condition::tests; clock_library::series::tests; realdata::clk::tests; tests/clock_library_f9p_cards_oracle.rs (f9p_first_pipeline_reproduces_the_recorded_finding; f9p_corrected_pipeline_reproduces_the_recorded_finding; data-gated)",
            oracle: "Measured records, held out: IGS final combined 30 s clocks of the 11 GPS Block IIF satellites over 2026-03-01 to 14 (a window no test had opened; IGS, open with attribution) and the JammerTest 2024 u-blox ZED-F9P receiver in its non-scored stationary sessions (GPL-3.0-or-later). D9 external comparison (pre-registered 2ec76864, every card's predicted / measured Allan deviation within [1/1.5, 1.5] at its fitted averaging times), a finding (stays MODELLED): 10 of 11 GPS IIF cards are within the bar; G27 is optimistic at the two-hour scale (0.662 at 7680 s, worst factor 1.510), the periodic hour-scale error a power-law card does not carry. The receiver TCXO card is blocked: outside the logged transmissions the dataset's other sessions leave 167 epochs against the 3600 required. Reported, not blind (records opened by earlier rows): the 5071A caesium card is within the bar (worst 1.070 up to 4096 s), the OCXO card is conservative and outside it (2.348 at 128 s; its noise floor changes during the record), and the Norcia strontium card fitted on the three shortest published points is within it at the two scored points (1.291, 1.405). Galileo passive hydrogen masers (no login-free source of final Galileo clocks reachable) and the Deep Space Atomic Clock (one open in-space value) are blocked. D9 round 2, the ZED-F9P receiver TCXO as a model class on 14 days of 12 static Wroclaw stations (Zenodo 6488497, CC BY 4.0; pre-registered fb475550), a finding: with the registered pipeline 11 of 12 stations were not evaluable (RAIM rejected most ionosphere-free epochs) and BX14 failed; a disclosed re-run with a corrected pipeline (pre-registered c9cc0d49) passes 1 of 11 blind stations (BX12, 1.412; BX07 1.532 and BX13 1.542 just outside), because single-point receiver clocks from intermittent 30 s files are not a clean oscillator record",
            oracle_kind: ExternalDataset,
            status: Modelled,
        },
        VerificationItem {
            requirement: "Measured GPS Block IIF clock cards with per-revolution terms (held-out prediction)",
            capability: "clock_library::card::DeviceCard::fit_phase_periodic: a device card that carries the once- to four-per-revolution phase terms (period T/k, T = 43 082.05 s), fitted jointly with the quadratic by least squares on one third of a measured satellite clock record, with each term's closed-form Allan contribution 4 A^2 sin^4(pi tau / P) / tau^2 in the predicted Allan deviation",
            module: "clock_library (card)",
            tests: "tests/clock_library_periodic_cards_oracle.rs (periodic_cards_reproduce_the_recorded_finding; pre-registered fb475550); clock_library::card::tests (a_periodic_card_carries_the_sinusoid_a_power_law_card_cannot)",
            oracle: "Measured records, held out: IGS final combined 30 s clocks of the 11 GPS Block IIF satellites over 2026-04-01 to 14 (a window no test had opened; IGS, open with attribution). D9 external comparison (pre-registered fb475550, predicted / measured Allan deviation within [1/1.5, 1.5] at every fitted averaging time on every satellite), a finding (stays MODELLED): 9 of 11 cards are within the bar; G03 (1.947) and G25 (1.581) are optimistic between 60 s and 2000 s because their held-out records are noisier than their fit thirds (G25's held-out part carries 16 gaps and 29 phase outliers), a change of the clock rather than a missing periodic term. Dropping the periodic terms from the prediction fails all 11 cards (1.77 to 4.96), so the terms carry the prediction",
            oracle_kind: ExternalDataset,
            status: Modelled,
        },
        VerificationItem {
            requirement: "Onboard clock state estimation",
            capability: "3-state (phase/freq/drift) van-Loan Kalman clock, Joseph-stabilised",
            module: "clock_state",
            tests: "clock_state::tests (analytic van-Loan Q; NEES; PSD positivity); tests/clock_state_reference.rs (full predict+update trajectory — state x and 3×3 covariance P over 1925 steps / 4 parameter sets vs filterpy 1.4.5; worst |relΔ| 2.8e-14); tests/clock_state_igs_holdout_oracle.rs::three_state_filter_on_held_out_igs_clocks_finding (pins the finding); tests/clock_state_ext_igs_fresh_oracle.rs::extended_filter_on_fresh_igs_clocks_finding; tests/clock_state_ext_igs_conditioned_oracle.rs::conditioned_extended_filter_finding (D9 round 3)",
            oracle: "filterpy 1.4.5 KalmanFilter (R. Labbe, MIT), with F via scipy.linalg.expm and Q via the Van-Loan 1978 block-matrix — an independent reference implementation reproducing kshana's full filter trajectory. Cross-implementation consistency: the clock physics / Allan calibration are not externally validated, so this stays MODELLED. 0.30 external comparison, a finding (stays MODELLED): on IGS final 30 s clocks of 11 GPS Block IIF satellites (2025-08-17 to 30), with Q fitted to the first-half ADEV and the filter scored on the held-out second half, the filter is consistent one step ahead (0.906 to 0.971 of epochs inside its 95 % band, bar 90 %) but over-confident at one hour on 9 of 11 clocks (0.486 to 0.829) and its innovation sums fall outside [2.4, 3.6] on 5. The fitted white-phase noise is zero on every satellite, and the hour-scale error (periodic terms, flicker FM) is not in the 3-state model. 0.30 round 2, an extended filter (flicker FM and once- and twice-per-revolution states) on fresh held-out IGS clocks of 2025-09-01 to 14 (pre-registered 4b1a841e), a finding (stays MODELLED): the one-step and one-hour consistency criteria hold on all 11 satellites (0.948 to 0.988 and 0.907 to 0.996), but the innovation-sum criterion fails on G24 (0.964) and G30 (1.929) against [2.4, 3.6]. D9 round 3, the round-2 extended filter, tuning and criteria unchanged after the frozen clock_library conditioning detector, on fresh IGS clocks of 2026-04-01 to 14 (pre-registered fb475550), a finding (stays MODELLED): (a) one-step 0.941 to 0.968 and (c) triple-NIS mean 2.641 to 3.549 hold on all 11 satellites; (b) one hour fails on G09 (0.894) and G26 (0.876) against 0.90",
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
            tests: "navsignal::tests (BPSK self-SSC = 2/3R_c; unit-area PSD; DLL); tests/nav_signal_modulation_code_tracking_reference.rs (GPS C/A Gold cross/auto-correlation exact-integer match vs independent IS-GPS-200 code generation; BPSK-R(1)/sine-BOC(1,1) PSD vs an independent scipy periodogram); tests/nav_signal_betz_hein_published_oracle.rs (betz_text_correlation_values_over_1_ghz; hein_mboc_interference_improvements; finding_betz_side_lobes_and_multipath, pinned)",
            oracle: "GPS C/A Gold cross/auto-correlation matched EXACTLY (integer ±65/−1/63) against independent IS-GPS-200 code generation; BPSK-R(1)/BOC(1,1) PSD shape vs an independent scipy periodogram. The modulation/SSC/DLL closed forms (Betz 2001 / Kaplan & Hegarty) remain analytic, so the row stays MODELLED — but the code-correlation sub-claim is externally matched. 0.30 round 2, against the printed values of Betz 2001 and Hein et al. 2006 (pre-registered 9f4f2ce8, half a printed unit), a finding (stays MODELLED): all 45 Table 1 spectral cells, the 1 GHz correlation values, the MBOC interference figures and 2 of 3 Fig. 17 offsets agree; the 24 MHz first side lobes, the BOC(8,4) Fig. 17 offset and every Figs. 18-21 worst-case multipath bias (11 to 15 % low) do not. Kshana and an independent NumPy evaluation of the pre-registered reading agree, so the gap lies in that reading or in an unstated detail of the paper; cause unresolved",
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
            tests: "quantum_imu::tests (k_eff; Mach-Zehnder T²; Freier-2016 floor bracket); tests/quantum_inertial_sensor_reference.rs (transfer function |H(ω)|, k_eff·T² and shot-noise ASD vs published Cheinet 2008 / Peters / Freier numeric vectors); tests/quantum_inertial_measured_qpn.rs (gauguet_finding_qpn_floor_sits_below_the_measured_noise, pinned; gradiometer_qpn_line_matches_janvier_model)",
            oracle: "Published CAI primary-paper numeric vectors (Cheinet 2008 transfer function; Peters/Freier sensitivity): k_eff·T² matched exactly, shot-noise ASD a one-sided floor within ~2× of each published instrument (real devices carry technical noise above the quantum floor). A bracket, not parity. 0.30 round 2 (pre-registered fcb9ac64), a finding (stays MODELLED): the QPN-only rotation noise against the measured Gauguet et al. 2009 Fig. 14 points gives ratios 0.695 to 0.788 at the three admitted points (0.751 at the operating point), missing the pre-registered 30 % bar by 0.5 points; the QPN floor sits 21 to 31 % below the measured noise, as expected of a model without laser and detection noise. The gradiometer composition matches the Janvier et al. 2022 QPN model line (ratio 1.013 to 1.017, Reference). The measured test cannot discriminate a sqrt(2) composition error; only the unequal-contrast Janvier line can",
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
            capability: "15-state error-state EKF, loosely coupled (validated on a real IMU/GNSS drive against NaveGo); a tightly coupled pseudorange/Doppler UKF and a coupled clock+position filter (consistency-only, outside the validated claim)",
            module: "fusion (gnss_ins_ekf, tightly_coupled, ukf, coupled)",
            tests: "fusion::tests (UKF==linear-KF identity; outage coast; NEES); tests/gnss_ins_sensor_fusion_reference.rs (50 cases vs filterpy 1.4.5: linear EKF loose/tight + coupled-PNT posteriors to ≤2.4e-12; UKF 40-epoch run worst |Δx| 1.9e-7 / |ΔP| 9.5e-6); tests/gnss_ins_navego_dataset_oracle.rs::loosely_coupled_rms_within_1p2x_of_navego (NaveGo v1.4 loosely coupled solution on NaveGo's real Ekinox IMU/GNSS drive: horizontal RMS 0.912x, vertical 0.940x, position-innovation RMS 0.861x of NaveGo's, mean normalised innovation 0.395; bars 1.2x, 1.2x, 1.2x and 1.5 fixed before the run)",
            oracle: "NaveGo v1.4 (R. Gonzalez, LGPL-3.0, run as a tool under GNU Octave, never linked): its loosely coupled ins_gnss on its own real Ekinox IMU/GNSS land-vehicle drive, both solutions scored against the Ekinox reference trajectory. Both filters read the same 20 Hz float32 input, and Kshana's configuration is mapped mechanically from the dataset's published parameters. Kshana's horizontal and vertical position RMS and its position-innovation RMS are within 1.2x of NaveGo's (measured 0.912, 0.940 and 0.861) and its mean normalised innovation is at most 1.5 (measured 0.395: about 2.5x under-confident, given the dataset's stated GNSS sigmas); tolerances fixed before the comparison. Scope: GNSS is present at 5 Hz for the whole drive, so no outage or coast is tested and the check catches gross filter defects rather than fine tuning (lever-arm-corrected raw fixes would land near the vertical bar); the lever-arm transform is computed in the test harness. The tightly coupled UKF and the coupled clock+position filter keep their filterpy 1.4.5 consistency checks (linear posteriors to 2.4e-12) and stay outside the validated claim",
            oracle_kind: ExternalDataset,
            status: Validated,
        },
        VerificationItem {
            requirement: "GNSS-denied jamming resilience",
            capability: "Geometry J/S link budget, anti-jam C/N₀, per-satellite loss-of-lock",
            module: "jamming",
            tests: "jamming::tests (PSD-derived Q cross-check; despreading); tests/gnss_denied_jamming_resilience_reference.rs (FSPL/J-S/effective-C-N₀ vs an independent numpy re-derivation of the Kaplan & Hegarty §9.4 link budget; real JammerTest C/N₀ falls monotonically through the 25 dB-Hz threshold); tests/jamming_jammertest_cn0_oracle.rs (pre-registered, blocked, not run)",
            oracle: "Anti-jam C/N₀ link-budget equation cross-checked against an independent numpy re-derivation (shares the same closed form → InternalConsistency) plus a real-JammerTest-2024 C/N₀ degradation characterisation. 0.30 round 2, blocked (stays MODELLED): the measured JammerTest 2024 C/N0 drop against a link-budget prediction (pre-registered 6a66994b, within 3 dB) was not run because the F8.1 antenna position and pointing at Bleik and the L1 share of the multi-band 1.6.4 ramp power are not documented in the test catalogue or the official log",
            oracle_kind: InternalConsistency,
            status: Modelled,
        },
        VerificationItem {
            requirement: "Spoofing detection",
            capability: "Clock-aided χ², RAIM, AGC, SQM fused per-epoch security FoM",
            module: "spoof, spoof_detect, spoof_monitors",
            tests: "tests/spoof_texbat_validation.rs (TEXBAT parameter characterisation); tests/spoof_detection_jammertest_oracle.rs::monitors_against_the_published_onsets_reproduce_the_recorded_disagreement (pins the finding); tests/spoof_detection_jammertest_log_oracle.rs::engine_monitors_against_the_logged_onsets_reproduce_the_recorded_disagreement; tests/clock_library_tcxo_card_jammertest_oracle.rs (round_3_is_blocked_by_the_training_minimum; round_4_reproduces_the_recorded_finding; round_4b_reproduces_the_recorded_finding; D9)",
            oracle: "TEXBAT scenario parameters (Humphreys 2012) — characterisation, not pinned vectors. 0.30 external comparison, a finding (stays MODELLED): on JammerTest 2024 (Bleik; GPL-3.0 data) the observable-level monitors (clock-aided chi-square, RAIM, solve failure) raised no alarm within 10 s of any of the 8 evaluable published spoofing onsets (where the pre-onset window was clean, the first alarm came 10.2 to 39 s after the published slot start), and three pre-onset windows carried false alarms from the clock monitor (81, 64 and 173 epochs). The first observable effect was a loss of dual-frequency GPS tracking, not a RAIM inconsistency. The published onsets are minute-resolution schedule slot starts; that they precede the RF capture is an interpretation, not a measurement. 0.30 round 2, against the organisers official JammerTest 2024 log (second resolution; pre-registered 6a66994b with a Hadamard-calibrated three-state clock monitor without latching), a finding (stays MODELLED): the monitor alarms within 10 s at 4 of 10 logged onsets; at the other six it is 18 to 211 s late or raises pre-onset clock false alarms (1 at 2.1.4, 85 at 2.3.15). D9 round 3 (a receiver card from the JammerTest unit's other sessions, pre-registered 2ec76864) blocked: 167 training epochs against 3600. D9 rounds 4 and 4b (noise levels from a u-blox ZED-F9P model-class card, Wroclaw 2021, pre-registered fb475550; 4b a disclosed re-run with a corrected extraction, c9cc0d49), a finding (stays MODELLED): zero pre-onset false alarms at all 10 logged onsets and 6 of 10 within 10 s; 2.1.1, 2.3.5, 2.3.10 and 2.6.1 stay late (+211, +23, +18, +51 s), unchanged by the clock noise level",
            oracle_kind: ExternalDataset,
            status: Modelled,
        },
        VerificationItem {
            requirement: "Timing Protection Level under spoofing",
            capability: "Closed-form bound on worst-case undetected time error = monitor floor + oscillator coast-σ over CUSUM detection latency, reported as a red-noise-floor band",
            module: "tpl",
            tests: "tpl::tests (closed-form oracles + CUSUM); examples/tpl_jammertest.rs (JammerTest 2024 real-spoof calibration); tests/tpl_jammertest_coverage_oracle.rs::tpl_against_measured_time_error_reproduces_the_recorded_disagreement (pins the finding); tests/tpl_jammertest_log_oracle.rs::drift_state_tpl_against_the_logged_onsets_reproduces_the_recorded_disagreement",
            oracle: "Composes Validated primitives (allan/holdover van-Loan, security floor); calibrated on JammerTest 2024 scenario 2.1.1 (~1.01 ms real served-time pull vs ≤51 ns claimed). Bridge over Validated parts — not itself an external validation. 0.30 external comparison, a finding (stays MODELLED): on the JammerTest 2024 spoofing scenarios the measured undetected served-time error exceeds the nominal TPL at 3 of 8 detected onsets: 184.3 vs 34.6 ns (2.1.4), 295.7 vs 159.3 ns (2.3.5) and 143.0 vs 69.0 ns (2.3.11); three of the five inside are trivial (a latched pre-onset false alarm). Likely cause: the coast term from a 60 s calibration with zero drift noise does not cover the receiver TCXO's frequency wander over 15 to 39 s. The measured error is Kshana's own single-point clock estimate against a line fitted to its own pre-onset estimates, so even agreement would not have been fully independent. 0.30 round 2, against the official JammerTest 2024 log onsets and the measured receiver time error (pre-registered 6a66994b), a finding (stays MODELLED): at 4 of 10 logged onsets the undetected error exceeds the drift-state TPL (634.7 against 458.5 ns at 2.1.1, 232.6 against 16.2 ns at 2.3.5, 41.3 against 6.0 ns at 2.3.10, 218.6 against 47.4 ns at 2.6.3)",
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
            tests: "tests/alternative_complementary_pnt_reference.rs (map-matching CRLB; IGRF-14 field); mapmatch::tests; gravimeter::tests; igrf::tests",
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
            tests: "tests/golden.rs, tests/determinism.rs, tests/cross_platform_golden.rs; tests/reproducibility_software_assurance_reference.rs (the generated SBOM validates with zero errors against the official CycloneDX 1.5 JSON Schema over the full 66-component shipped graph: default + python + wasm features, dev-dependencies excluded)",
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
            capability: "Solar/geomagnetic indices (definitional Kp↔ap table), the Jacchia-1971 exospheric temperature, and the Jacchia 1971 thermospheric density (SAO Special Report 332: static diffusion profiles reproducing its Table 7, with the diurnal, geomagnetic, semiannual, seasonal-latitudinal and helium variations) against the static USSA76 atmosphere. Runnable from the CLI/bindings as the `space-weather` scenario kind (scenarios/space-weather.toml)",
            module: "space_weather",
            tests: "space_weather::tests (Kp↔ap exact at grid points + round-trip + monotone, daily-Ap mean, exospheric-T vs published solar-min/mean/max + storm increment anchors, density unity-at-reference, solar-cycle swing in the observed 5–10× band, scenario reproducible + MODELLED-not-VALIDATED + out-of-range rejection); dominance_demonstrators (reachable + reproducible + physical T + MODELLED-not-VALIDATED); tests/space_weather_density_accelerometer_oracle.rs::jacchia71_finding_is_pinned",
            oracle: "Definitional Kp↔ap table + Jacchia-1971 exospheric-temperature closed form (matched to <1 K vs the published anchors, tests/space_weather_reference.rs); the density is characterised against pymsis NRLMSISE-00 (an independent NRL model): the 800 km solar-cycle swing is 10.4x against NRLMSISE-00 13.6x. 0.30 revision: the calibrated first-order activity factor was replaced by Jacchia 1971 (default scenario density at 400 km 4.176e-12 -> 6.929e-12 kg/m3; reference_exospheric_temperature_k removed, mean_exospheric_temperature_k added). 0.30 round 2, measured TOLEOS CHAMP/GRACE/GRACE-FO accelerometer densities (ESA Swarm DISC; pre-registered 20eed695), a finding (stays MODELLED): orbit averages at 400 to 500 km are within a factor 2 at solar maximum outside storms (CHAMP 2001 521/521, GRACE-A 2002 120/120, GRACE-FO 2024 526/547), but Jacchia 1971 is about 1.7x too dense in the 2008 solar minimum (GRACE-A 412/544 within a factor 2), so the density is not validated",
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
            capability: "Two-body launch azimuth(s) (sin Az = cos i / cos lat), minimum reachable inclination, circular velocity, Earth-rotation eastward bonus, dogleg plane-change Δv and daily opportunities, and, given an epoch and IERS finals2000A rows, the site speed about the true pole (launch::site_rotation_speed_at). Runnable from the CLI/bindings as the `launch-window` scenario kind (scenarios/launch-window.toml)",
            module: "launch",
            tests: "launch::tests (due-east launch reaches i=latitude, KSC→ISS = textbook 45°, polar = N/S, i<lat unreachable, 465 m/s equatorial bonus, plane-change 10° ≈ 1.34 km/s + 180° = 2v, daily-opportunity counts, scenario reproducible/MODELLED + dogleg path); dominance_demonstrators (reachable + reproducible + KSC→ISS 45° + MODELLED-not-VALIDATED); tests/launch_geometry_orekit_oracle.rs::burnout_azimuth_reproduces_the_target_inclination_in_orekit; tests/launch_geometry_orekit_oracle.rs::earth_rotation_speed_gap_is_recorded_as_a_finding; tests/launch_geometry_orekit_oracle.rs::true_pole_site_speed_matches_orekit_at_a_fresh_epoch_and_longitudes",
            oracle: "Closed-form spherical-trig launch geometry vs published worked-example anchors (Vallado, Fundamentals of Astrodynamics 4th ed., Algorithm 37 launch-azimuth + Ch.6 plane-change; tests/launch_window_ascent_geometry_reference.rs). These re-use the same closed form kshana implements (a published-value parity / transcription check, InternalConsistency); MODELLED two-body, no rotating-Earth velocity-triangle / ascent / drag-loss model. 0.30 external comparison against Orekit 12.2 (Apache-2.0), a finding (stays MODELLED): the geometry agrees to rounding (inclination read back from the burnout azimuth over 158 cases, worst 2.6e-15 rad; minimum inclination, circular velocity and dogleg delta-v to 3e-16), but the Earth-rotation site speed misses the pre-registered 1e-6 relative at 62.9 deg latitude (1.12e-6). The gap grows as tan(lat), consistent with a polar-motion pole offset of about 5.8e-7 rad in Orekit's Earth frame that the spherical ω·R·cos(lat) omits. The claim was not narrowed before the run, so the row cannot promote on this comparison. 0.30 round 2 (pre-registered 71bebf63): with an epoch and IERS rows, the true-pole site speed (scenario field site_rotation_speed_true_pole_m_s) agrees with Orekit within 1e-6 at 24 sites over four longitudes (worst 4.9e-8), but the nominal no-epoch speed the scenario emits by default as the Earth-rotation bonus still misses by 1.12e-6, so the row stays MODELLED pending a decision on the default output",
            oracle_kind: InternalConsistency,
            status: Modelled,
        },
        VerificationItem {
            requirement: "Ballistic re-entry corridor (Allen–Eggers)",
            capability: "Peak deceleration (ballistic-coefficient-independent), velocity + altitude at peak-g, and peak-heating velocity for an exponential-atmosphere ballistic entry. Runnable from the CLI/bindings as the `reentry` scenario kind (scenarios/reentry.toml)",
            module: "reentry",
            tests: "reentry::tests (peak-g independent of ballistic coefficient + physical g-band, grows with steeper γ / faster entry, peak-g velocity = V_e·e^(−1/2) and peak-heating = V_e·e^(−1/6) faster, peak-g altitude physical + deeper for higher B, scenario reproducible/MODELLED + degenerate-geometry rejected); dominance_demonstrators (reachable + reproducible + V_e·e^(−1/2) fraction + MODELLED-not-VALIDATED); tests/reentry_reconstruction_oracle.rs::reentry_overprediction_is_recorded_as_a_finding; tests/reentry_point_mass_reconstruction_oracle.rs::point_mass_peak_deceleration_matches_reconstructed_entries (cross-check only); tests/reentry_point_mass_accelerometer_oracle.rs (blocked, not run)",
            oracle: "Closed-form Allen–Eggers analytic entry, additionally cross-checked vs a scipy 1.18 solve_ivp (DOP853) numerical integration of the SAME drag-only entry ODE (tests/ballistic_re_entry_corridor_reference.rs, 36 cases, worst a_max rel 2.9e-9) — a numeric-integral-vs-own-analytic-form check, so still InternalConsistency, NOT an external validation. MODELLED ballistic (no lift), no aerothermal/TPS — heating output is a velocity, not a heat-flux. 0.30 external comparison, a finding (stays MODELLED): against the Stardust SRC entry reconstruction (Desai and Qualls, NASA NTRS 20080008567), the Allen–Eggers peak deceleration for the printed inertial entry state (12.9 km/s, -8.2 deg, H 7200 m) is 61.8 g against the best-estimated-trajectory 32.89 g, +88 % against a 15 % tolerance: the constant-flight-path-angle, no-gravity solution roughly doubles the peak of a shallow, faster-than-escape entry. Stardust carried no accelerometer, so the reconstruction is a trajectory estimate. 0.30 round 2, blocked (stays MODELLED): an integrated planar point-mass solution (reentry::simulate_planar_entry, US76, inverse-square gravity, curvature) agrees with the Stardust and Genesis best-estimated trajectories within 15 % (+11.3 %, +5.6 %), but those maxima are agency simulation outputs, not measurements, so this is a cross-check only. The accelerometer comparison (pre-registered a94a283d) is blocked on a readable copy of the Hayabusa2 REMM analysis (doi 10.57350/jesa.16)",
            oracle_kind: InternalConsistency,
            status: Modelled,
        },
        VerificationItem {
            requirement: "EO payload footprint & coverage geometry",
            capability: "SMAD space-triangle geometry: Earth angular radius, swath width, nadir GSD, maximum off-nadir access and circular period, plus the first-order J2 nodal period (eo_payload::j2_nodal_period) and the equatorial ground-track spacing R_e (omega_E - dOmega/dt) T_nodal (eo_payload::ground_track_spacing_equator_j2) with a contiguous-coverage flag, for an orbit altitude, inclination and sensor FOV/IFOV. Runnable from the CLI/bindings as the `eo-coverage` scenario kind (scenarios/eo-coverage.toml); its default inclination is the sun-synchronous one from eo_payload::sun_synchronous_inclination, a convenience default that is not part of the validated claim",
            module: "eo_payload (j2_node_rate, j2_nodal_period, ground_track_spacing_equator_j2, sun_synchronous_inclination)",
            tests: "eo_payload::tests (angular radius 64° at 700 km + shrinks with altitude, nadir→zenith/zero-range, horizon→ε=0/max central angle, past-horizon errors, swath grows with FOV / GSD with altitude, ~2750 km node spacing, scenario reproducible/MODELLED + bad-input rejection); dominance_demonstrators (reachable + reproducible + 64° angular radius + MODELLED-not-VALIDATED); tests/eo_payload_coverage_orekit_oracle.rs::eo_coverage_matches_orekit_and_geographiclib (altitudes 400-1500 km, inclinations 1-98 deg, half FOV 7.5-50 deg, IFOV 10-50 microrad, slew 30 and 89 deg: every quantity inside its pre-registered bar, contiguous flag 168/168); tests/eo_payload_coverage_orekit_oracle.rs::exempt_flag_points_are_the_engines; regression tests/eo_payload_coverage_reference.rs",
            oracle: "Orekit 12.2 (Apache-2.0) and GeographicLib 2.1 (MIT), both run as separate programs, pre-registered (766823f3) before the engine change and any oracle run: sphere quantities within 1e-9 relative (worst: angular radius 5.4e-16, swath 7.0e-13, access 1.9e-14), period 1e-12 (1.6e-16), nadir GSD 1e-7 (2.9e-10), the J2 nodal period and node spacing within 0.1 % of an Orekit numerical J2 propagation with a node detector (1.2e-5 and 6.7e-5), the contiguous flag exact (168/168), and against the WGS-84 ellipsoid the limb within 0.3 deg (0.186 deg) and the maximum ground range within 0.5 % (3.2e-3). Removing the nodal regression term fails 35 of 42 node points. MODELLED scope: spherical-Earth footprint; no radiometry, MTF, atmosphere, jitter or glint; the sun-synchronous default inclination is not compared. The earlier Skyfield/SGP4 cross-check is kept as a regression. 0.30 revision: the spacing now carries the J2 nodal regression (default scenario 2756.37 -> 2752.17 km)",
            oracle_kind: ExternalDataset,
            status: Validated,
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
            capability: "Gravity-gradient worst-case disturbance torque ((3/2)(μ/R³)ΔI) as the peak over attitude (the validated claim), plus an RSS pointing-error budget over named 1σ contributors with the dominant term (a quadrature sum of caller-supplied numbers, outside the validated claim). Runnable from the CLI/bindings as the `attitude-budget` scenario kind (scenarios/attitude-budget.toml)",
            module: "attitude_budget",
            tests: "attitude_budget::tests (GG torque vanishes for a symmetric body, grows lower-down, linear in ΔI, RSS quadrature sum, variance-fractions-sum-to-1); tests/attitude_gg_torque_reference.rs (20 cases vs an independent full-tensor GG torque T=(3μ/R³)(n̂×(I·n̂)) numerically maximised over attitude with Hipparchus 3.1 linalg; worst rel 6e-15, + Wertz/Sidi published O(1e-6) s⁻² band); tests/attitude_gg_torque_basilisk_oracle.rs::gravity_gradient_torque_matches_basilisk (40 cases vs Basilisk 2.9.1 GravityGradientEffector: peak at the 45 deg attitude within 1e-12 relative, worst 2.1e-15; no torque above the peak over 2000 random attitudes per case, 3 diagonal and 5 general inertia tensors, 5 altitudes)",
            oracle: "Basilisk 2.9.1 GravityGradientEffector (AVSLab, ISC), an independent C++ implementation of the full-tensor gravity-gradient torque: Kshana's peak (3/2)(μ/R³)ΔI equals Basilisk's torque at the 45 deg attitude within 1e-12 relative (worst 2.1e-15) over 5 altitudes and 8 inertia tensors, and bounds Basilisk's torque over 2000 random attitudes per case; tolerance fixed before the comparison. Validated claim: the gravity-gradient torque peak. The RSS pointing budget is a quadrature sum of caller-supplied numbers with no external truth and stays outside it; the hand-coded Hipparchus full-tensor maximisation remains as supporting self-consistency. No control-loop/6-DoF/flexible-mode simulation",
            oracle_kind: ExternalDataset,
            status: Validated,
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
        // ── Timing Integrity Benchmark (CTI P4) — honesty-immune, no accuracy claim ──
        VerificationItem {
            requirement: "Timing-integrity conformance benchmark — Stanford integrity-diagram epoch classifier",
            capability: "TIB Stanford integrity-diagram epoch classification (nominal / unavailable / MI / HMI)",
            module: "src/benchmark/stanford.rs",
            tests: "src/benchmark/stanford.rs::tests (four regions + inclusive boundaries + |error| + PL>AL unavailability); tests/tib_scorer_reference.rs (classification counts vs independent numpy on a fixed synthetic set)",
            oracle: "Independent numpy re-implementation of the four-region rule (scripts/gen_tib_scorer_reference.py) on the identical sample set; method Cited from the Stanford–ESA integrity diagram (Tossaint et al., ION GNSS 2007) and RTCA DO-229 WAAS MOPS. NOT an ExternalDataset accuracy oracle — the benchmark is honesty-immune.",
            oracle_kind: InternalConsistency,
            status: Modelled,
        },
        VerificationItem {
            requirement: "Timing-integrity conformance benchmark — integrity-coverage scorer",
            capability: "TIB integrity-coverage scoring (HMI/MI/availability rates + overbound-coverage verdict)",
            module: "src/benchmark/coverage.rs",
            tests: "src/benchmark/coverage.rs::tests (clean/under-bounded/all-unavailable/empty); tests/tib_scorer_reference.rs (counts + rates + coverage_ok vs numpy to 1e-12)",
            oracle: "Independent numpy region re-count in tests/fixtures/tib/reference.json; scorer machinery cross-check only, no accuracy claim.",
            oracle_kind: InternalConsistency,
            status: Modelled,
        },
        VerificationItem {
            requirement: "Timing-integrity conformance benchmark — fault catalog (parametric generators)",
            capability: "TIB fault menu (domain-divergence, clock-slam, holdover-coast, static/incremental/symmetric/asymmetric delay, replay-within-freshness, path-selective, k-of-N quorum)",
            module: "src/benchmark/faults.rs",
            tests: "src/benchmark/faults.rs::tests (offset profiles, monotone coast, undetectable-set flagging, max_offset consistency, exactly two undetectable classes)",
            oracle: "Representative parametric fault generators (Modelled); the undetectable set (symmetric delay, replay-within-freshness) is Cited from Mizrahi RFC 7384 and Narula & Humphreys (IEEE JSTSP 2018). No external oracle — a fault catalog makes no measured claim.",
            oracle_kind: InternalConsistency,
            status: Modelled,
        },
        VerificationItem {
            requirement: "Timing-integrity conformance benchmark — undetectable-absorption verdict",
            capability: "TIB undetectable-absorption verdict (symmetric/replay must be absorbed by the PL, never reported detected)",
            module: "src/benchmark/scorecard.rs",
            tests: "src/benchmark/scorecard.rs::tests (reference PL absorbs; broken PL unabsorbed-never-detected; detectable coverage verdict; the honesty property that no coverage/detection verdict is reachable for an undetectable scenario)",
            oracle: "Property check that the Verdict enum structurally cannot report an undetectable fault as detected (Mizrahi RFC 7384); absorbed ⟺ PL ≥ offset. No accuracy oracle.",
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
            module: "frame_eop, realtime_frame_eop",
            tests: "frame_eop::tests and realtime_frame_eop::tests (all three components carry equal, elementwise-identical, strictly ascending epoch sets over both real IERS extracts; the joint set collapses to the intersection when the two Bulletin B blocks genuinely disagree, and a horizon with no shared rows is omitted rather than zero-filled; the emptiness of the predicted-versus-final table is stated in the document rather than implied by a missing field; a real second vintage populates it, cross-checked row for row; a missing later vintage is an error, not a silent empty table); tests/joint_eop_table_astropy_erfa_oracle.rs::joint_table_and_predicted_vs_final_tables_match_astropy_and_erfa (Tables 3, 4 and 6 of the scenario end to end: epoch sets exact, UT1 and pole statistics within 1e-9, the combination at the Moon within 1e-5 of a full ERFA rotation, the stated status of every predicted-versus-final case); tests/joint_eop_error_iers_ar2019_oracle.rs::bulletin_a_2019_prediction_error_matches_the_iers_realised_statistics (Kshana/IERS 1.001 to 1.100 at 1 to 90 days); row census: tests/embedded_eop_vintage_astropy_preregistered.rs (offline-input row); round-1 regression: tests/joint_eop_error_bulletin_a_oracle.rs::measured_error_against_the_iers_accuracy_formula_pole_agrees_ut1_does_not",
            oracle: "astropy 8.0.1 utils.iers (BSD-3) reading the IERS finals2000A product with its own Bulletin-B-else-A rule, and pyerfa 2.0.1.5 (SOFA) full celestial-to-terrestrial rotations (c2i06a, sp00, pom00, c2tcio; the Earth rotation angle per IERS 2010 eq. 5.15 in exact arithmetic), run as separate programs on verbatim rows of the frozen 2026-09-30 finals2000A.all; pre-registered (455b8fb5) with amendments A1 and A2 fixing only the oracle numerical precision (both disclosed with the runs they followed): every Table 3 epoch list equal, UT1 and pole statistics within 6e-16, the combination within 1.9e-7, 12/12 predicted-versus-final cases. The combination check cannot resolve pole-term errors below about 1e-4 relative because UT1 dominates it; pole accuracy rests on the 1e-9 pole-statistic check. The epoch-set and fallback rules are the generator mirroring Kshana definitions, and the empty-table statuses are design behaviour with no external truth. Magnitudes: IERS Annual Report 2019 Table 3a realised prediction errors, Kshana/IERS 1.001 to 1.100 at 1 to 90 days (bar [0.8, 1.25], Measured). Row census: astropy (offline-input row). Round 1 (kept as a regression): against the accuracy formula printed in 178 Bulletin A issues the pole agrees within 1.5x and UT1 does not, which tests the IERS formula against its realised error",
            oracle_kind: OracleKind::ExternalDataset,
            status: VerificationStatus::Validated,
        },
        VerificationItem {
            requirement: "Offline default Earth-orientation input is a real IERS product",
            capability: "The `realtime-frame-eop` runtime default is the library own embedded copy of a verbatim IERS finals2000A extract (tools/finals2000A_20260930.txt: 174 consecutive daily rows, MJD 61224-61397, cut from the finals2000A.all of 2026-09-30) carrying all three row vintages the format defines, classified by the IERS I/P flags (eop::row_vintage): 30 Bulletin B finals, 54 rapid measured rows (flag I without a Bulletin B block) and 90 Bulletin A predictions (flag P). A bare run with no file argument and no network emits a populated per-horizon table, the census rows = final_rows + rapid_rows + prediction_rows (174 = 30 + 54 + 90) and predicted_rows.n = 90 over MJD 61308-61397; the as-issued cutoff of the predicted-versus-final comparisons is the last measured row. The earlier 32-row extract (tools/finals2000A_2026.txt, every row flag I) and the five-row final-only excerpt stay shipped and exercised: on them predicted_rows.n is 0, a property of the input file and not a parser outcome",
            module: "realtime_frame_eop, eop",
            tests: "tests/embedded_eop_vintage_astropy_preregistered.rs::vintage_of_every_row_matches_astropy_and_predictions_match_bulletin_a (six exact criteria: the extract bytes; 174 rows; per-vintage counts and full MJD lists 30/54/90; flag P on both polar motion and UT1 of every predicted row; the bare default run census; every predicted row equal to IERS Bulletin A Vol. XXXIX No. 039 within its last printed digit, worst 5.0e-5 arcsec and 4.9e-6 s); tests/embedded_eop_census_astropy_oracle.rs::vintage_census_matches_astropy (regression pin of the old 32-row extract under the flag classifier: 20 final, 12 rapid, 0 predicted); tests/embedded_eop_census_astropy_oracle.rs::rows_called_prediction_only_are_flagged_measured_by_astropy (the round-1 finding, kept); realtime_frame_eop::tests; tests/operational_eop_predictor_reference.rs",
            oracle: "astropy 8.0.1 astropy.utils.iers.IERS_A (BSD-3-Clause), reading the same bytes with its own reader, and the IERS Bulletin A Vol. XXXIX No. 039 table, copied number for number; pre-registered (6fdae01b) with six exact criteria before astropy was run. All six hold: 30 final, 54 rapid and 90 predicted rows with equal MJD lists, every predicted row flag P, the default-run census equal, and the predictions equal to Bulletin A within the last printed digit. Disclosed: the cut was chosen with a plain column slice of the flags and the Bulletin B block, which showed 30/54/90, before the commit; the extract is a verbatim slice this repository cut from an IERS product (SHA-256 in the fixture NOTICE). The validated claim is the vintage classification and census of the shipped default input and its predicted rows; arbitrary user inputs are classified by the same flag rule but are not part of the comparison. 0.30 round 1 (superseded): the earlier default called 12 flag-I rows Bulletin A predictions; the engine now classifies by flag. REVISIONS: the default-run cells that moved are listed old-to-new in docs/revisions/M035-default-eop-recut-cell-changes.md (predicted_rows 12 -> 90, the pole floor 0.06776 -> 0.05550 mas, the Earth-orientation term 14.01601 -> 14.01583 m, the total 20.09759 -> 20.09746 m and 67.03834 -> 67.03790 ns, the Table 2 rows of tests/golden/realtime-frame-eop.csv, and the operational-predictor agreement figures); earlier ones in docs/revisions/G12-default-eop-cell-changes.md",
            oracle_kind: OracleKind::ExternalDataset,
            status: VerificationStatus::Validated,
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
            tests: "lunar_vlbi::tests (far-field limit matches delta_dor; near-field correction; FD partials); tests/lunar_vlbi_anise_oracle.rs::near_field_delay_disagrees_with_the_anise_light_time_difference",
            oracle: "Plane-wave delta_dor (same-codebase) in the far-field limit; finite-difference partials. 0.30 external comparison, a finding (stays MODELLED): against ANISE 0.10 converged light times through DE440 (75 delays on 2024-01-01 over three DSN baselines, generated by xval/anise-lunar-od without Kshana code), no delay is within the 1 ps tolerance. The largest gap is 24 µs, from the analytic Moon centre (about 200 km from DE440), the single instantaneous geometry with no light-time iteration (3.6 µs) and the dropped polar motion; beacon partials differ by up to 2.9e-3 relative against 1e-6. The module-doc claim that the frame approximations are below the model fidelity does not hold at this level. 0.30 round 2: the kernel path (lunar_vlbi::KernelGeometry) is validated against NAIF SPICE light times in its own row, Lunar geodetic VLBI, kernel path; the ANISE comparison of that path (75/75 within 1 ps, worst 0.12 ps, tests/lunar_vlbi_anise_oracle.rs::kernel_delay_matches_the_anise_light_time_difference) is a kernel-evaluation cross-check only, because the light-time solve in that harness is this project own. This row (the analytic default path) stays MODELLED with the finding above",
            oracle_kind: OracleKind::ReferenceImpl,
            status: VerificationStatus::Modelled,
        },
        VerificationItem {
            requirement: "Lunar geodetic VLBI, kernel path",
            capability: "Near-field VLBI delay for an Earth baseline observing a lunar beacon, with beacon and station partials, on the kernel path (lunar_vlbi::KernelGeometry): DE440 Earth and Moon, DE440 lunar principal axes, ITRF93 Earth orientation with UT1 and polar motion, each light time converged in the barycentric frame, partials with the light-time factor 1/(c - u.V). Runnable as the `lunar-vlbi` scenario with planetary_kernel_path, earth_orientation_kernel_path and moon_orientation_kernel_path set; the validated outputs are the kernel-path geometric_delay_s series and epoch_partials. On the kernel path delay_s adds the analytic differenced Shapiro term, which is not compared, and delay_rate and near_field_correction_us are not compared",
            module: "lunar_vlbi (KernelGeometry, delay_partials_beacon_body, delay_partials_stations, LunarVlbiScenario); naif_kernel",
            tests: "tests/lunar_vlbi_spice_oracle.rs::kernel_delay_and_partials_match_spice_light_times_near_j2000 (75 delays at 25 epochs near J2000 over DSS-14, DSS-43 and DSS-63: delays within 1 ps, worst 0.06 ps; body-frame beacon partials within 1e-6, worst 7.4e-9; ITRF93 station partials within 1e-6, worst 3.8e-11); tests/lunar_vlbi_spice_oracle.rs::spice_2024_epochs_finding_is_unchanged; tests/lunar_vlbi_anise_oracle.rs::kernel_delay_matches_the_anise_light_time_difference (kernel-evaluation cross-check); tests/naif_kernel_reader_check.rs; lunar_vlbi::tests",
            oracle: "NAIF SPICE Toolkit N0067 (spiceypy 8.2.0, MIT) converged Newtonian light times (spkcpt/spkcpo, CN) from a beacon fixed in MOON_PA_DE440 to the DSN stations DSS-14, DSS-43 and DSS-63 from NAIF station kernel earthstns_itrf93_260814.bsp, with de440s, moon_pa_de440_200625, moon_de440_250416.tf, earth_latest_high_prec and naif0012; partials are five-point central differences of SPICE light times, not Kshana 1/(c - u.V) formula. Pre-registered (a689c797, 2024 epochs) with bars of 1 ps on every delay and 1e-6 relative on every partial. That first run failed (17/75 delays within 1 ps, worst 1.03e-11 s): SPICE carries ET as one double, whose spacing at 2024 rounds the emission epoch by up to 6e-8 s, about 6 ps of light time, and the residual matches that rounding at 0.99999 correlation (pinned; the reviewer reproduced it independently). Amendment 66e365d4, written after that result and before its fixture existed, moved the same oracle and bars to 25 hourly epochs near J2000, where the ET spacing is at most 1.5e-11 s: 75/75 delays within 1 ps (worst 6.2e-14 s), 75/75 beacon partials (worst 7.4e-9), 150/150 station partials (worst 3.8e-11). Outside the claim: the analytic default path (series Moon and mean lunar frame, 24 µs from ANISE through DE440, the Lunar geodetic VLBI row), the differenced Shapiro term the scenario adds analytically, media, and the barycentric-to-geocentric scale",
            oracle_kind: ExternalDataset,
            status: Validated,
        },
        VerificationItem {
            requirement: "NAIF kernel reader: DAF container, SPK type 2 and binary PCK type 2",
            capability: "The engine's own pure-Rust reader of NAIF binary kernels (naif_kernel): the DAF container (both byte orders, linked summary records), SPK type-2 Chebyshev position segments chained through their centres to a lowest common ancestor, and binary PCK type-2 Euler-angle segments turned into a J2000-to-body rotation, with epochs taken as two-part ET so a sub-microsecond offset keeps its precision. It is what KernelEphemeris (ephem_provider) and the kernel paths of lunar_vlbi, lunar_llr and lunar_vlbi_fim read DE440 through. The claim is that it reads JPL kernels correctly; it is not a claim that DE440, or the engine's analytic Sun and Moon series, is accurate",
            module: "naif_kernel (DafFile, SpkKernel, PckKernel); ephem_provider (KernelEphemeris)",
            tests: "tests/naif_reader_spice_oracle.rs::reader_matches_spice_and_anise_on_the_post_registration_grid (600 de440s.bsp states and 200 MOON_PA_DE440 rotations at 200 epochs 1849-2150 and random body pairs drawn from the pre-registration commit's own hash, against SPICE and ANISE on cut kernels bit-identical to NAIF's: worst difference 0.6 % of its bar, 1.95e-3 m absolute); tests/naif_reader_spice_oracle.rs::reader_matches_spice_and_anise_on_the_full_naif_kernels_when_present (the same on the full NAIF files, SHA-256 checked; data-gated); tests/naif_kernel_reader_check.rs (engineering guard, not evidence); naif_kernel::tests; ephem_provider::tests",
            oracle: "Two independent kernel readers on the same NAIF files: NAIF SPICE Toolkit N0067 (CSPICE through spiceypy 8.2.0, MIT; spkezr and pxform) and ANISE 0.10.6 (Nyx Space, MPL-2.0; Almanac.translate and Almanac.rotate), both run as separate programs on de440s.bsp and moon_pa_de440_200625.bpc. Pre-registered (abcd9133) before any fixture or oracle value existed: the grid seed is the first 16 hex digits of that commit's hash, so neither the 200 epochs nor the body pairs could be chosen with the result in view; each epoch also carries the Moon and the Sun relative to the Earth. Bars fixed in advance from double-precision Chebyshev evaluation (at most 15 coefficients, n^2 u = 2.5e-14 per evaluation, two evaluations and up to two hops per side): position 1e-13 R + 1e-5 m, velocity 1e-13 V + 1e-10 m/s, R and V the larger magnitude relative to the lowest common ancestor; rotation element 1e-13 W + 1e-15, W the coefficient sum of the covering record; ANISE adds 2 ns of relative motion for its nanosecond epochs. Result: every one of 600 states and 200 rotations inside its bar against both oracles, on the cut and on the full kernels; worst 6.0e-3 of the bar (position), 5.9e-3 (velocity), 3.7e-3 (rotation). Mutation: evaluating each record at -s fails 3597 comparisons. Disclosed: an earlier 25-epoch check against SPICE (4.6e-5 m, tests/naif_kernel_reader_check.rs) was seen before this row and is not its evidence; the fixture generator's first run aborted on an empty grid interval before producing any value and was corrected. Both sides read DE440, so agreement validates the reader, not the ephemeris",
            oracle_kind: ExternalDataset,
            status: Validated,
        },
        VerificationItem {
            requirement: "Earth-GNSS at lunar distance",
            capability: "Earth-GNSS reception at lunar distance: the weak-signal layer P7 Table 1 names and the engine had no model for. Per satellite and per epoch it computes the off-boresight angle against the transmitter nadir, whether the Earth occults the straight path, the slant range and its free-space loss, the transmit gain at that angle, the received power and the carrier-to-noise density; it then aggregates only the links clearing a tracking threshold, and sweeps a full constellation revolution so the answer is a DISTRIBUTION rather than one snapshot. Three facts drive the result and the report states each: the Earth subtends 13.90 deg from the constellation radius so the beam PEAK is geometrically unavailable to any lunar-bound ray; what remains is the main-lobe edge and the sidelobes, the regime LuGRE operated in at the Moon in 2025; and the L1 path loss is about 208 dB, some 25 dB more than a terrestrial user pays. MEASURED on the bundled 24-satellite GPS-class geometry over 64 epochs of one orbital period: SIGNAL availability 0.375 with a best link of 30.93 dB-Hz, and FIX availability 0.000 - at most two simultaneous trackable links, never the four a position needs. The separation of those two availabilities is the point, and the report refuses to let them be confused: Earth-GNSS at lunar distance is a TIMING-grade layer, not a position-grade one, and a layered-resilience prior must take the fix availability. The conditioning is emitted for the same reason - every visible satellite lies inside a cone a couple of degrees wide as seen from the Moon, so the lines of sight are near-parallel by construction. Runnable as the `earth-gnss-lunar` kind",
            module: "earth_gnss_lunar",
            tests: "earth_gnss_lunar::tests (11 lib tests: the Earth-limb half angle against its closed form asin(R/r) with a further assertion that EVERY un-occulted link lies outside that cone, so the occultation test and the limb angle cannot disagree; the occultation predicate checked on the near side, the far side and the case where the body lies BEHIND the transmitter; path loss bounded to the plausible lunar-range band on every link; the trackable set shown to be a subset of the geometrically visible set and disjoint from the occulted one; monotonicity in both directions - more receiving gain never reduces the count, a stricter threshold never raises it; no link credited with more than boresight gain; a receiver inside the Earth refused; the sweep asserted to actually VARY with epoch; and signal-vs-fix availability asserted distinct, correctly ordered, and consistent with the per-epoch rows); tests/earth_gnss_measured_montenbruck_oracle.rs::finding_genesis_nadir_counts_exceed_the_paper (pinned)",
            oracle: "Closed-form identities and internal consistency; NO external oracle is claimed. The limb half angle is checked against asin(R_earth/r_orbit) and the geometry against it; the free-space loss, the DOP kernel and the SGP4 propagation this composes are each externally validated in their own rows and this row does not borrow their status. WHY MODELLED, and it is the transmit pattern: the gain at angle is a uniformly illuminated circular aperture, the Airy pattern, while a real GPS L1 antenna is a twelve-element helical array with a shaped main lobe peaked off-boresight to even out power across the Earth disc and sidelobes that are not Airy. Published measured patterns exist and are not vendored here, so orderings and orders of magnitude carry, while the dB of any single satellite does not. A FIRST IMPLEMENTATION OF THIS ROW WAS WRONG IN A WAY WORTH RECORDING: the Airy expression is valid only in the forward hemisphere, its argument goes as sin(theta), and at theta near 180 deg it wraps around and returns FULL BORESIGHT GAIN behind the aperture - so the two strongest links in the first report were satellites pointing their antennas away from the Moon, and they were the only two that cleared the threshold. Behind the aperture the model now applies a flat back-lobe floor, stated as a bound rather than a fabricated pattern shape. Deliberately absent, each making the budget OPTIMISTIC: no ionospheric or tropospheric loss on the limb-grazing rays, no polarisation, pointing or implementation loss, and a spherical Earth with no refractive extension. The Moon position is an INPUT, not an ephemeris lookup, because the quantity under test is the link and the beam geometry. Upgrading this row to Validated needs a measured transmit pattern and LuGRE normal points to check against; neither is in the repository and neither is invented here. 0.30 round 2, a finding (stays MODELLED): a measured-input link path (real SP3 positions, per-block transmit power, tabulated transmit and receive patterns, acquisition and tracking hysteresis) was checked against Montenbruck et al. 2023 Table 3 for GENESIS at 6000 km (pre-registered 5b414f0a): zenith-antenna means agree on 5 of 6 within one dB of the paper sensitivity; nadir-antenna means are 1.0 to 2.4 satellites higher than printed, plausibly because the paper used azimuth-dependent GPS side-lobe patterns that are not published. The lunar-distance figures of this row still use the Airy stand-in",
            oracle_kind: OracleKind::InternalConsistency,
            status: VerificationStatus::Modelled,
        },
        VerificationItem {
            requirement: "Lunar surface-beacon DOP augmentation",
            capability: "Beacon-augmented dilution of precision for a lunar surface user: the visible-satellite line-of-sight rows and the visible-surface-beacon ranging rows are concatenated into one design matrix and evaluated through the shared DOP kernel, and the resulting DOP is mapped to a realised 1-sigma accuracy IN METRES through a per-beacon user-equivalent ranging error assembled as the root-sum-square of clock-synchronisation, multipath and survey terms. Beacon visibility is the airless-Moon two-height geometric horizon, which has no refractive extension and is therefore exact rather than approximate. Runnable as the `lunar-beacon` scenario kind, which reports satellites alone, satellites plus beacons, and a larger constellation as the competing route to the same geometry. MEASURED on the bundled golden geometry (user at -80 deg, three surveyed beacons, six-satellite illustrative LCNS at t=0, 5 deg mask): 5 visible satellites give PDOP 9.6941 and a 3-D 1-sigma of 11.222 m; adding the beacons that actually clear the horizon gives PDOP 4.1160 and 4.765 m, a factor of 2.355; the 24-satellite service instead gives PDOP 2.4226 and 2.804 m, a factor of 4.002. The report prints the VISIBLE beacon count rather than the configured one, and on this geometry only ONE of the three beacons clears the horizon: the two flanking sites lie about 333 km from the user against an 86 km horizon for a 2 m antenna, so a reader is never left to assume all three contributed",
            module: "lunar_beacon",
            tests: "lunar_beacon::tests (horizon visibility against the L01 closed form; the beacon-augmented DOP against the bare one; the error-budget root-sum-square; the DOP-to-metres relation); tests/validate_p2_beacon_before_after_table.rs (the whole before/after table pinned to a committed golden at 1e-9 relative); tests/validate_p2_beacon_before_after_independent_dop.rs (the same geometry through an INDEPENDENT DOP path, so the augmentation is not checked against the kernel that produced it); tests/validate_lunar_beacon_anise_visibility_dop.rs::beacon_visibility_and_augmented_dop_match_anise_and_numpy",
            oracle: "The DOP arithmetic is the crate::orbit::dop kernel, separately externally validated against gnss_lib_py in tests/dop_reference.rs; this row does not re-borrow that row's status. The beacon-visibility horizon is the L01 closed form, and sigma = DOP x sigma_URE is the standard GNSS relation (Kaplan and Hegarty, Understanding GPS/GNSS, section 7). Within this row the augmentation itself is checked against an independent in-repo DOP path and pinned to a committed golden. WHY MODELLED: the constellation design, the beacon placement, the antenna heights and all three error-budget magnitudes are illustrative inputs rather than a fielded survey or a measured link, so the reported metres are a property of a chosen scenario and not of any deployed service. NOTE ON PROVENANCE: this capability was advertised in the README and exercised by two validation tests, yet carried NO matrix row and no scenario kind, so it could not be reached from a run at all. It was claimed in prose, absent from the ledger, and unreachable in the engine at the same time. The row and the kind were added together. 0.30 round 2 (pre-registered db0eb9ec), blocked (stays MODELLED): ANISE 0.10.6 visibility and a numpy DOP on the row geometry agree (visible sets exact including 72 near-horizon and 48 near-mask cases; DOP within 7.2e-13), but the reported metres are DOP times an illustrative 1.158 m root-sum-square ranging error with no oracle; the scoping that would exclude them awaits an owner decision",
            oracle_kind: OracleKind::ReferenceImpl,
            status: VerificationStatus::Modelled,
        },
        VerificationItem {
            requirement: "Common-mode integrity blindness",
            capability: "Exact parity-subspace split of a measurement error into the part RAIM cannot see and the part it can. For the linearised snapshot model y = G\u{b7}x + e, any error dy decomposes uniquely into a BLIND component in range(G) \u{2014} absorbed as a state error S\u{b7}dy and annihilated by the residual projector Pperp = I \u{2212} G\u{b7}S, so invisible to ANY residual test, not merely to a particular threshold \u{2014} and a DETECTABLE component in parity space. The module returns the projector, the split, and the blind fraction, so a caller can quantify how much of a specific error a snapshot monitor is structurally unable to report. Applied to the real inter-ephemeris floor: the metre-level DE440-vs-INPOP21a and DE440-vs-EPM2021 disagreement in the geocentric Moon position is absorbed almost entirely as user position error (median blind fraction 1.000000; median blind position error 2.3955 m and 2.0050 m) against a parity residual at the 1e-15 m level",
            module: "lunar_common_mode",
            tests: "lunar_common_mode::tests (8 lib tests: the split is additive and reconstructs dy; a common-mode covariance yields a positive common-mode protection level while a parity-only covariance yields a near-zero one; the projector annihilates range(G)); tests/lunar_common_mode_integrity_reference.rs (the engine split against an independent numpy computation on byte-identical inputs over the committed 366-epoch sample, relative AND absolute error < 1e-3); tests/lunar_common_mode_parity_numpy_oracle.rs::common_mode_split_matches_numpy_lstsq_on_parity_bearing_inputs (1464 parity-bearing cases on the 8-satellite geometry and a 6-satellite subset over both real inter-ephemeris pairs: blind_dx, residual and norms within 1e-12 of |dy|, worst 1.06e-14)",
            oracle: "P2: numpy linalg.lstsq (LAPACK gelsd SVD, BSD-3) recomputes the least-squares split on committed inputs WITH a real parity part (dy = E·Δs + w, w ~ N(0, 1 m), seed 20261001) on the 8-satellite geometry and a 6-satellite subset, 1464 cases over both real inter-ephemeris pairs, pre-registered (f672a314): blind_dx, residual, blind_norm and detectable_norm within 1e-12 relative to |dy| and blind_fraction within 1e-12 absolute (worst blind_dx 1.06e-14, residual 4.4e-15, blind_fraction 3.1e-15). numpy builds G itself from the committed positions, while the engine uses normal equations with Gauss-Jordan; an oblique left inverse turns the test red at 5.5e-2 |dy|. Amendment 1 (86c53301, after a first run, disclosed) relaxed only an input precondition on the parity fraction (every case at least 1e-3 and 95 % of each geometry at least 0.05), not the agreement bar. Validated claim, as P2 allows: the linear algebra of the split on those inputs; the inter-ephemeris floor magnitudes and the illustrative lunar geometry (8 LCNS-like nodes at 5000 km) are inputs, not validated, and the blindness is a known property of all snapshot RAIM. The round-1 numpy comparison (tests/lunar_common_mode_integrity_reference.rs) checked only the identity S·G = I because its inputs lay in range(G); it is kept as a regression. Ephemeris provenance: tests/fixtures/inter_ephemeris/NOTICE.md (JPL, IMCCE, IAA RAS)",
            oracle_kind: OracleKind::ExternalDataset,
            status: VerificationStatus::Validated,
        },
        VerificationItem {
            requirement: "Common-mode protection level and total integrity envelope",
            capability: "cmpl_horizontal bounds the k-sigma horizontal position error contributed by the blind common-mode class, by forming blind_position_covariance = S*Cov*S^T and projecting it into ENU; integrity_envelope reports hpl_total = hpl_araim + cmpl. The distinction the pair exists to make: the RAIM/ARAIM RESIDUAL test is provably blind to range(G) errors, but the ARAIM PROTECTION LEVEL is not - its fault-free term already bounds them up to a provider URA plus nominal bias. The CMPL is therefore only the cross-provider EXCESS that a single provider per-provider URA/ISM does not overbound, and the sum is a conservative triangle-inequality bound rather than an RSS, valid only where that excess is not already inside URA.",
            module: "lunar_common_mode",
            tests: "lunar_common_mode::tests (common_mode_covariance_gives_positive_cmpl, parity_only_covariance_gives_near_zero_cmpl, envelope_sums_the_two_classes, state_map_matches_split)",
            oracle: "Analytic projector algebra checked against itself: a covariance confined to range(G) must give a positive CMPL, a covariance confined to parity space must give approximately zero, and the envelope must sum two measurement-space-orthogonal contributions. The common-mode covariance, the constellation geometry and k are representative Modelled inputs, NOT a certified budget, and no claim is made that the triangle bound is tight. NOTE ON PROVENANCE: cmpl_horizontal, blind_position_covariance and integrity_envelope are public and shipped, and their unit tests were already cited by the common-mode blindness row, but the ENVELOPE CLAIM itself carried no row - so the one caveat that keeps it honest, that the sum is a triangle bound and not an RSS, was stated nowhere in the ledger. The row registers the claim and the caveat together.",
            oracle_kind: OracleKind::InternalConsistency,
            status: VerificationStatus::Modelled,
        },
        VerificationItem {
            requirement: "Lunar joint multi-technique OD + clock",
            capability: "Batch fusion of VLBI + lunar-local range + inter-sat range to recover station+constellation positions and clocks",
            module: "lunar_combination (problem, model, estimate, formal_covariance); batch_ls (gauss_newton_qr)",
            tests: "lunar_combination::tests (recovers simulated truth; VLBI restores station 3-D observability; deterministic); tests/lunar_joint_multi_technique_od_reference.rs (6 geometries × 16 params, 31 obs each, vs Orekit 12.2 / Hipparchus Levenberg-Marquardt on identical observations; recovered state worst |Δ| 1.4e-8 m); tests/lunar_joint_od_numpy_oracle.rs::joint_solve_linear_algebra_matches_numpy (six networks including one without VLBI: Gauss-Newton steps within 2.4e-11, formal sigmas within 1.3e-11, station errors equal)",
            oracle: "P2: numpy 2.4.6 (numpy.linalg.lstsq with LAPACK gelsd, numpy.linalg.inv; BSD-3) recomputes each Gauss-Newton step, the converged weighted-least-squares solution, the formal sigmas and the station error on the committed Jacobians and observations of six simulated networks, pre-registered (5094bc31) at max(1e-8, 100 kappa eps) relative. The first run failed the no-VLBI network (6.1e-7 against 1e-8, a normal-equation inverse at condition 1.4e5); the engine fix written after that result (batch_ls::gauss_newton_qr, a Householder QR step used by estimate and formal_covariance) was re-run at the unchanged bar: steps 1.1e-14 to 2.4e-11, sigmas at most 1.3e-11. The validated claim is the fusion solve linear algebra on those inputs, not the physical magnitudes of the simulated network or its observation models: the lunar geodetic VLBI delay row stays MODELLED (its analytic path differs from ANISE by up to 24 µs), and the frames have their own rows. Recovery of an injected simulated truth and NEES consistency remain internal checks; the earlier Orekit 12.2 / Hipparchus Levenberg-Marquardt cross-check (tests/lunar_joint_multi_technique_od_reference.rs) exercises batch_ls::gauss_newton, which estimate no longer calls, and is kept as a check of that primitive. 0.30 revision: the default lunar-joint-od-clock station errors 3.541344 -> 3.541350 m with VLBI and 2183.119 -> 2183.558 m without (QR solve)",
            oracle_kind: OracleKind::ExternalDataset,
            status: VerificationStatus::Validated,
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
            tests: "lunar_combination::tests (rank-deficient without Earth baselines; three baselines restore full rank — the 3-station threshold from the information rank, not solve error; station CRLB attained by the estimator at efficiency 0.98; CRLB tightens monotonically with baselines); tests/lunar_observability_numpy_oracle.rs::lunar_observability_matches_numpy_on_the_committed_jacobians",
            oracle: "Analytic datum-defect structure — the unobservable absolute-frame mode lies in the null space of the Fisher information (closed-form), the rank threshold matches the published 3-station design rationale, and the estimator attains the resulting CRLB in Monte-Carlo. The lunar geometry itself is a representative network (not a flown ephemeris), so the row stays MODELLED; the underlying FIM/CRLB engine is checked against the Kay (1993) closed forms separately. 0.30 round 2 (pre-registered fab02df9), blocked (stays MODELLED): NumPy/SciPy recompute the rank and defect at the stated 1e-9 threshold, the station axes share of the null space (within 8.4e-10) and the station CRLB (within 1.2e-10) on 17 committed Kshana-generated configurations (P2). Not promoted: the claim that the estimator attains the bound (Monte Carlo efficiency about 0.98) has no oracle, and the scoping that would leave it MODELLED awaits an owner decision",
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
            capability: "Per-satellite topocentric look angles (azimuth clockwise from north, elevation) and slant range at a named selenographic site, given the satellite in the site's Moon body-fixed frame (the validated claim). The signal-in-space ranging accuracy is exposed as a scenario parameter so the service-volume sweep yields a ranging REQUIREMENT rather than a pass/fail at one fixed sigma; that parameter is a design input outside the validated claim",
            module: "lunar_service",
            tests: "lunar_service::tests (topocentric against hand-computed geometry: overhead, due north/east/west, antipodal, and the degenerate polar east direction; the exported visible flag agrees with the independent visibility filter over a full 6 h sweep; the export is off by default and provably changes nothing else; protection levels are exactly linear in the exposed sigma while the geometry underneath is untouched); tests/lunar_service_geometry_oracle.rs::look_angles_match_anise_at_selenographic_sites (768 samples over 8 sites, 12 epochs and 8 satellites vs ANISE 0.10.2: azimuth and elevation within 1e-6 deg, range and site position within 1 mm; worst 2.2e-12 deg, 2.1e-13 deg, 5.6e-9 m)",
            oracle: "ANISE 0.10.2 (Nyx Space, MPL-2.0, run as a tool from xval/anise-service-geometry, binary lunar-look-angles-xval, which calls no Kshana code): ANISE's own azimuth, elevation and range routine (azimuth_elevation_range_sez) from sites built by its latitude-longitude-altitude constructor on the pck00011 Moon (sphere 1737.4 km), with the satellites rotated into MOON_PA_DE440 through moon_pa_de440_200625.bpc. 768 samples over 8 sites (the 4 named sites and 4 others, above and below the horizon), 12 epochs and 8 satellites agree within 1e-6 deg in azimuth and elevation and 1 mm in range and site position (fixed before the comparison); measured 2.2e-12 deg, 2.1e-13 deg and 5.6e-9 m. Claim: site placement and look angles given the satellite in the site's body-fixed frame. Kshana's own mean-rotation Moon-fixed frame realisation and the ranging-accuracy parameter are outside it; the closed-form geometry unit tests remain as supporting checks",
            oracle_kind: OracleKind::ExternalDataset,
            status: VerificationStatus::Validated,
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
            tests: "lunar_interop::tests (OEM carries lunar REF_FRAME/TIME_SYSTEM; time metadata round-trips; KIF envelope); tests/lunar_interoperability_export_reference.rs (kshana's emitted lunar OEM re-parsed by the independent `oem` Python library: REF_FRAME/TIME_SYSTEM/CENTER tokens + per-epoch state to format precision; a corrupted export is rejected); tests/lunar_interop_oem_oracle.rs::recorded_two_reader_outcome_is_for_todays_export",
            oracle: "kshana's lunar OEM export re-parsed by the independent third-party `oem` library (R. J. Anderson): frame/time tokens and per-epoch state agree to write precision (1 mm / 1e-9 km/s) and a dropped-TIME_SYSTEM export is rejected — a structural interchange round-trip; the lunar frame/time physical semantics are validated by their own rows, so this stays MODELLED. 0.30 external comparison, a finding (stays MODELLED): a second independent reader, the Orekit 12.2 CCSDS OEM parser (Apache-2.0, strict defaults), refuses both lunar files because it does not implement the LTC and TCL time systems (it decodes the crate's EME2000/UTC OEM, and decodes the lunar files once TIME_SYSTEM is replaced by TDB); oem 0.4.5 decodes them within the written precision only by falling back from the unsupported time system. Interchange of these lunar files with mainstream CCSDS readers is not established",
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
            tests: "attitude_dynamics::tests (apply/solve inverse, spherical-top zero torque, principal-axis fixed point, short-run energy+momentum conservation, q̇=½q⊗ω, symmetric-top rate sign + body-cone precession); tests/attitude_dynamics_reference.rs (200 000-step torque-free runs: |q|=1 to 1e-10, kinetic energy T=½ωᵀIω conserved to 1e-9 rel, |Iω| and the inertial momentum vector conserved to 1e-9/1e-8 rel, both on a tri-axial and a general non-diagonal inertia; symmetric-top oblate + prolate body-cone precession reproduced to 1e-6 vs the analytic λ=ω₃(I_a−I_t)/I_t); tests/attitude_dynamics_basilisk_oracle.rs::torque_free_motion_matches_basilisk (two general non-diagonal inertias, 1e4 s torque-free vs the Basilisk 2.9.1 spacecraft hub with RKF78: quaternion within 1e-9, worst 3.3e-11; body rates within 1e-9 rad/s, worst 3.4e-12)",
            oracle: "Basilisk 2.9.1 spacecraft hub rigid-body propagation (AVSLab, ISC; MRP attitude through its own coupled hub equations, svIntegratorRKF78 at relative tolerance 1e-12), an independent implementation of the torque-free rigid-body equations: Kshana's RK4 quaternion (dt 0.01 s) and body rates agree within 1e-9 over 1e4 s on two general non-diagonal inertias (worst 3.3e-11 and 3.4e-12 rad/s); tolerance fixed before the comparison. Validated claim: torque-free motion; the external-torque term is not compared. The conservation-law and symmetric-top checks remain as supporting self-consistency. No flexible-body / control-loop / external-torque environment",
            oracle_kind: ExternalDataset,
            status: Validated,
        },
        VerificationItem {
            requirement: "Clohessy–Wiltshire / Hill relative-motion dynamics",
            capability: "Relative motion of a chaser about a target on a circular reference orbit in the LVLH frame: the linearised Clohessy–Wiltshire equations (ẍ−2nẏ−3n²x=0, ÿ+2nẋ=0, z̈+n²z=0) solved by the closed-form 6×6 state-transition matrix Φ(n,t) (Clohessy–Wiltshire 1960; Vallado Alg. 48) with the bounded relative-orbit condition ẏ₀=−2n·x₀, and a closed-form second-order correction (cw_dynamics::second_order_correction, the CW response to the quadratic terms of the exact circular-chief equations; Karlgaard and Lutze 2003, Newman, Lovell and Pratt 2015) composed as cw_dynamics::propagate_second_order. The validated output is propagate_second_order; the linear Φ alone is characterised against nonlinear truth, not validated",
            module: "cw_dynamics (propagate, second_order_correction, propagate_second_order)",
            tests: "cw_dynamics::tests (Φ(0)=I, cross-track decoupled SHM); tests/cw_dynamics_reference.rs (closed-form Φ vs an independent fixed-step RK4 integration of the same Hill ODEs to <1e-6 over a third of an orbit; Φ(t)Φ(−t)=I to 1e-9; the bounded condition ẏ₀=−2n·x₀ closes the full state after one period to 1e-9 with no secular along-track drift over 10 orbits; a pure radial offset drifts the analytic −12π·x₀ per orbit); tests/cw_dynamics_orekit_oracle.rs::cw_second_order_matches_nonlinear_orekit_within_1mm (four cases at 100 m over a third of a 500 km orbit: worst 1.15e-7 m against 1e-3 m); tests/cw_dynamics_orekit_oracle.rs::cw_disagreement_with_orekit_is_recorded_as_a_finding (the linear Φ alone: 1.2 to 6.3 mm, pinned)",
            oracle: "Orekit 12.2 (Apache-2.0) NumericalPropagator, two-body, LOFType.QSW, run as a separate program (fixture unchanged since round 1). Pre-registered bar 1e-3 m on every sample of every case; the second-order engine fix was re-run against it unchanged (amendment 8c8e768d, written before the propagator existed, disclosing that the first-order gaps were known). propagate_second_order agrees within 1.15e-7 m (C1), 9.8e-8, 5.4e-8 and 2.2e-8 m; halving the second-order term fails at 1.85e-3 to 3.14e-3 m. The linear Φ alone departs from nonlinear truth by 1.2 to 6.3 mm at 100 m over a third of an orbit (the omitted second-order term; its strict test is kept ignored), so it is characterised, not validated. Internal checks kept: Φ against an RK4 integration of the Hill equations, Φ(t)Φ(−t)=I, the bounded-orbit and −12π·x₀ drift identities, and the third-order residual scaling of the second-order term. Scope: circular chief, separations near 100 m, up to a third of an orbit; no eccentricity (Tschauner–Hempel), J2 or differential-drag terms; small-separation assumption",
            oracle_kind: ExternalDataset,
            status: Validated,
        },
        VerificationItem {
            requirement: "TDOA/FDOA passive emitter geolocation",
            capability: "Locate an emitter (jammer/spoofer, or an opportunistic source for reverse-PNT) from time-difference-of-arrival across a receiver network — the τᵢ=(Rᵢ−R₀)/c hyperboloid intersection solved by Gauss–Newton least squares — and, adding frequency-difference-of-arrival (range-rate differences) with moving receivers, jointly recover position and velocity; with the Cramér–Rao lower bound on the position covariance from the measurement geometry",
            module: "geolocation",
            tests: "geolocation::tests (noiseless TDOA forward→inverse to 1e-6 m; J·CRLB=I with a symmetric PD covariance; the CRLB position-variance trace is non-increasing when a receiver is added; joint TDOA+FDOA recovers a moving emitter's position+velocity; <4 receivers rejected); tests/geolocation_reference.rs (round trips over four geometries with a 3-D-diverse network; the Gauss–Newton estimator attains its Cramér–Rao bound — empirical error covariance tracks the analytic bound over 4000 Monte-Carlo trials); tests/geolocation_crlb_published_oracle.rs (ho_chan_1993_maximum_tdoa; ho_xu_2004_fig7_with_the_authors_corrected_source; ho_xu_2004_bound_matches_the_authors_code; finding_ho_chan_ottawa_printed_values_are_not_the_bound and finding_ho_xu_fig7_printed_source_is_not_the_plotted_one, pinned)",
            oracle: "Self-consistency of the estimator and geometry: forward→inverse round trips, the Fisher/CRLB identity J·CRLB=I, GDOP monotonicity, and the estimator attaining its own Cramér–Rao bound under Monte-Carlo noise — internal-consistency checks, NOT an external dataset, so the row stays InternalConsistency. MODELLED passive geolocation — point-source line-of-sight model; no multipath / NLOS, receiver-clock-bias, or atmospheric-refraction terms. 0.30 round 2, against Ho and Chan 1993 and Ho and Xu 2004 (pre-registered f89018b8, 1 % of each printed value), a finding (stays MODELLED): the surface-constrained TDOA bound reproduces the 40 N geometric factors (-0.11 %, -0.02 %) and the maximum TDOA; the joint TDOA+FDOA bound reproduces Fig. 6 (+0.06 %, -0.17 %) and, at the source the authors own code names for Fig. 7 (amendment written after that result was seen, disclosed), Fig. 7 (+0.11 %, -0.02 %); it equals the authors published bound code (BSD-style, run under GNU Octave) to 3e-12; the covariance-weighted maximum-likelihood solver attains the printed bound (+0.3 to +0.4 %). The Ottawa factors the paper prints from a Monte Carlo (251, 7.1) differ by +1.3 % and +4.4 %, outside the 1 % bar",
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
            capability: "Integer least-squares ambiguity fixing the LAMBDA way: a volume-preserving integer (Z) decorrelating transform (integer-Gauss size reduction of the L D Lᵀ factor) + an exact Schnorr–Euchner depth-first branch-and-bound integer least-squares search, with the ratio test on the two best candidates (the validated claim); plus the closed-form bootstrapped success rate P_s=∏(2Φ(1/(2σ_{i|I}))−1), checked only internally and outside the validated claim",
            module: "lambda",
            tests: "lambda::tests (L D Lᵀ reconstructs Q); tests/lambda_reference.rs (the Z-transform is unimodular |det Z|=1 with Q_z=ZᵀQZ SPD, det-preserving, and lower total off-diagonal correlation; the Schnorr–Euchner ILS matches brute-force enumeration over 300 random covariances; the full decorrelate→search→back-transform pipeline equals the direct ILS and Z⁻ᵀZᵀ round-trips integers; the closed-form bootstrapped success rate matches a 200k-trial Monte-Carlo of sequential conditional rounding to <0.01); tests/lambda_rtklib_oracle.rs::ils_solution_matches_rtklib_lambda_on_300_covariances (the fixed integers equal RTKLIB v2.4.2-p13 lambda() on 300 random covariances, n 2 to 10, 226 of them not solvable by rounding; the two best squared norms agree to 1e-9 relative, measured 5.6e-13)",
            oracle: "RTKLIB v2.4.2-p13 lambda() (its lambda.c source file, T. Takasu, BSD-2-Clause), an independent LAMBDA reduction and MLAMBDA search compiled from C and run as a tool, on 300 random covariances (n 2 to 10): integer least squares has a unique minimiser, so the fixed integers must be identical (0 mismatches) and the two best squared norms, which feed the ratio test, agree to 1e-9 relative (measured 5.6e-13); tolerance fixed before the comparison. Validated claim: the ILS solution and its two best norms. RTKLIB does not compute the bootstrapped success rate, which stays checked internally against a Monte-Carlo of the rounding process; the Z-transform invariants and the brute-force enumeration remain as supporting checks. Integer-Gauss decorrelation only (the reordering permutations of the full LAMBDA reduction speed the search but change neither the exact ILS answer nor the bootstrapped rate)",
            oracle_kind: ExternalDataset,
            status: Validated,
        },
        VerificationItem {
            requirement: "B-plane targeting & patched-conic gravity assist",
            capability: "Hyperbolic-flyby geometry (a=−μ/v∞², e=1+r_p·v∞²/μ, turn angle δ=2·asin(1/e), impact parameter |B|=|a|·√(e²−1)), the B-plane Ŝ/T̂/R̂ aim-point frame and B·T̂/B·R̂ decomposition, and a patched-conic gravity assist (v∞-magnitude conserved, direction deflected by δ, heliocentric Δv=2·v∞·sin(δ/2) at no propellant cost) with the Tisserand parameter T_P=a_P/a+2√((a/a_P)(1−e²))cos i",
            module: "bplane",
            tests: "bplane::tests (the flyby scalars satisfy the closed forms with two agreeing |B| identities and |B|>r_p; the turn angle decreases with periapsis radius and hits the δ→0 / δ→π limits; deflection preserves v∞ speed and rotates exactly by δ; the assist Δv magnitude equals 2·v∞·sin(δ/2) and is bounded by 2·v∞; the B-plane axes are orthonormal and ⊥ Ŝ with |B|²=(B·T̂)²+(B·R̂)²; the Tisserand parameter is invariant across a v∞-preserving deflection that does change a,e,i, and equals 3−(v∞/v_circ)²); tests/bplane_gmat_oracle.rs::bplane_matches_gmat_over_a_hyperbolic_grid; tests/bplane_heliocentric_oracle.rs::assist_delta_v_matches_gmat_asymptotes_and_c3; tests/bplane_heliocentric_oracle.rs::heliocentric_elements_and_tisserand_match_gmat_and_sbpy; tests/bplane_heliocentric_oracle.rs::tisserand_matches_kasuga_jewitt_2019_table_8_1",
            oracle: "GMAT R2026a (Apache-2.0, run as a separate program) on 192 hyperbolic Earth states: B.T, B.R and |B| within 1e-6 km (worst 1.35e-8 km), the turn angle and both asymptotes within 1e-9 rad (worst 9.3e-15 rad); the assist velocity change from GMAT C3 and asymptotes within 1e-9 v_inf (worst 5.6e-14); heliocentric SMA, ECC and INC on 350 Sun-centred states before and after the assist within 1e-9 relative and 1e-12 rad (worst 2.2e-14 and 4.1e-14 rad); the Tisserand parameter against sbpy 0.6.0 (BSD-3) on GMAT elements within 1e-9 (worst 1.3e-15) and against 3 - C3/v_c^2 (8.9e-16); and the Tisserand closed form against Kasuga and Jewitt (2019) Table 8.1 for 12 objects within the printed-rounding bound (worst 0.39 of it; a P1 published worked value). Pre-registered (436293bf; heliocentric repair 6fd9f5e6); amendment 374c806b, written after the oracle files were generated and before any Kshana value, widened the inclination input filter from 1e-2 to 1e-3 rad, keeping more and worse-conditioned states. MODELLED scope: patched-conic two-body flyby on a circular planetary orbit, no sphere-of-influence transition, encounter perturbations or ephemeris",
            oracle_kind: ExternalDataset,
            status: Validated,
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
            capability: "Position-error-vs-coast-duration budget built from IMU coefficients, each error source (accelerometer bias, gyro bias, velocity random walk, angle random walk, scale factor cruising and under sustained specific force) propagated through a nine-state local-level INS error model with the Schuler feedback (inertial::coast::ErrorDynamics after Groves 2nd ed. ch. 14: attitude, velocity and position errors, the vertical channel with its gravity gradient, WGS-84 radii and normal gravity, a level platform heading north at the configured speed, latitude_deg and height_m; systematic terms by an augmented matrix exponential, random walks by Van Loan), the flat-Earth monomials kept only as leading_order_m; contributions combined under a stated rule (rss / linear-sum / deterministic-sum-with-stochastic-rss); the coast durations reaching caller-supplied position thresholds (10 m and 50 m by default) located by a forward scan for the first crossing (first_crossing_s, since the Schuler-bounded curves are not monotone), with the dominant source at each crossing; and a TRN-bounded mode giving the largest terrain-fix interval that holds each threshold. Runnable as the `ins-trn-coast` scenario kind",
            module: "inertial::coast (ErrorDynamics, ErrorSource, source_error_m, CoastModel, Contribution, Combination, TrnFixMode, first_crossing_s, InsTrnCoastScenario); scenario kind `ins-trn-coast`",
            tests: "tests/ins_coast_schuler_navego_oracle.rs::coast_error_model_matches_the_corrected_navego_runs (48 points, six error terms at 30 s to 3600 s, Tactical grade, 45 deg N, level and north-pointing: every point within 5 %, worst +3.70 % velocity random walk at 1200 s); inertial::coast::tests (the_error_model_follows_the_leading_order_law_on_a_short_coast; a_bias_error_is_schuler_bounded; doubling_the_coast_scales_each_contribution_by_two_to_its_own_power; every_contributions_closed_form_crossing_agrees_with_the_engines_bisection; the_located_crossing_puts_the_model_on_the_threshold_it_searched_for; the_bias_law_matches_the_engines_stochastic_dead_reckoner_stepped_forward; the_velocity_random_walk_law_matches_a_monte_carlo_of_the_engines_dead_reckoner; the_scale_factor_law_matches_a_double_integration_of_the_engines_imu_error_model; a_full_reset_fix_makes_every_inter_fix_excursion_identical; the_largest_fix_interval_holding_a_threshold_puts_the_peak_on_that_threshold; an_error_free_imu_never_reaches_a_threshold_and_says_so_instead_of_reporting_zero; every_published_field_carries_a_unit_and_a_provenance_class; the_scenario_runs_through_the_engines_public_dispatch_and_is_reproducible); tests/ins_coast_navego_montecarlo_oracle.rs::finding_laws_hold_to_600_s_and_overstate_beyond (the round-1 finding on the flat-Earth leading-order laws, kept as a regression)",
            oracle: "NaveGo v1.4 (commit 24d9488, LGPL-3.0), run as a separate program under GNU Octave 8.4.0: free-inertial coast runs with the same IMU error profile, with one corrected numerical dead band in its quaternion update (qua_update.m: the guard on a rate below 1e-8 rad/s replaced by wnorm == 0, applied to a run-time copy and asserted to match once; with the guard in place a slowly drifting platform attitude froze and cut the Schuler feedback). Pre-registered (4262b969) with the corrected generator before it was run; the engine (440b3877) was committed before any corrected output was opened; same 5 % bar, 48 points, terms, seeds and statistic as round 1. Result: 48/48 within 5 % (worst +3.70 % velocity random walk at 1200 s, +3.33 % angle random walk at 1800 s); at 3600 s NaveGo/Kshana give 2375.4/2376.2 m for the accelerometer bias and 130 885/131 675 m for the gyro bias. Zeroing the Schuler transport-rate feedback fails the test (+695 % at 3600 s). Disclosed: single-channel Schuler predictions and the round-1 NaveGo values were known; the model has no fitted parameter. Scope: the per-term error curves at Tactical grade, 45 deg N, level and north-pointing, up to 3600 s; the crossings, the combination rule and the TRN mode are deterministic functions of those curves. The IMU class coefficients (Groves 2013 Table 4.1 band figures) and the TRN fix residual stay MODELLED inputs. Round 1 (superseded): the flat-Earth monomials, now leading_order_m, overstate beyond 600 s (2.2x to 8x at one hour). 0.30 revision: every ins-trn-coast output moves (the shipped scenario TRN peak 52.932679 -> 44.711834 m)",
            oracle_kind: ExternalDataset,
            status: Validated,
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
            tests: "hybrid_integrity::tests (the detection-power curve runs from the false-alarm rate at zero fault to 1 − P_md at the minimum detectable bias; the minimum detectable bias fed back through noncentral_chi2_cdf at the threshold the monitor itself applied returns P_md to 1e-9, on every axis and through the public helper; a bias actually injected into the RF estimate shifts the monitor's own statistic by exactly the hand-computed b²/(σ_rf² + σ_opt²); a noise-free bias is caught above √(T/λ*)×MDB and missed below it, with the injected ladder straddling that crossing; detection power is monotone in fault magnitude and identical on all four axes in MDB multiples; a seeded 200,000-sample Monte-Carlo of the monitor statistic reproduces the analytic power within 4σ at four points on the curve; the timing MDB is pinned above the timing alert limit, which is a measured weakness and not a feature; the Wilson-Hilferty quantile is measured to disagree with the monitor's exact threshold by ~4%, recording why it was not used; the ramp figure is exactly MDB/rate and scales inversely with the rate, and a non-positive rate reports null rather than zero); tests/hybrid_fault_power_scipy_oracle.rs (report_detection_power_matches_scipy_chi2_and_ncx2; report_detection_power_matches_scipy_with_comparable_sigmas)",
            oracle: "Two internal oracles, no external dataset. (1) Closed-form round trip: the minimum detectable bias is produced by inverting the non-central chi-square tail on the non-centrality (raim::pbias) and is verified by feeding the resulting non-centrality back through raim::noncentral_chi2_cdf at the monitor's own threshold, which must return P_md. (2) Injection vs analysis: a bias is written into the RF estimate of one axis and cross_raim::run_cross_raim is re-run, so the statistic compared against the analytic non-centrality is the one the monitor computed, not a re-derivation. A seeded Monte-Carlo of the statistic itself is carried in the tests as a third check; it is deliberately NOT in the report, because a sampled estimate would be slower and not reproducible bit-for-bit. ExternalDataset is declined: the quantity is the detection power of THIS monitor at THIS scenario's sigma allocation, and the sigma magnitudes the MDB is scaled by are Modelled representative inputs, not measurements. ReferenceImpl was also considered and declined — the Monte-Carlo samples the same statistic the analysis describes, so it catches transcription and coefficient errors but is not an independent implementation of the monitor. 0.30 round 2 (pre-registered 0135a9e4), blocked (stays MODELLED): SciPy 1.18.1 chi2/ncx2/brentq reproduce the report threshold (within 5.4e-12), per-axis MDB, power curve, crossing multiple and ramp time-to-detect (within 5.3e-10) on five configurations; the injected-fault statistics have no independent oracle and the sigma magnitudes are Modelled inputs, so the scoping awaits an owner decision",
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
            tests: "antenna::tests and lunar_service::tests (the half-power crossing located by bisection on the pattern matches the published Airy x = 1.61634 and yields the exact 1.02899·λ/D width, recording that the conventional 1.02 coefficient sits at −2.955 dB not −3.010 dB; the pattern is strictly decreasing over 400 points from boresight to the first null; the implied-efficiency algebra round-trips to 1e-12 and reproduces 0.641 / 0.920; the off-boresight angle matches tan θ = R·sin γ/(r − R·cos γ) at 20 points and both limits to 1e-12; the approximate cone contains the real beam row by row; the headline counts equal the per-row flags they summarise and the correction equals their difference; every row verdict is recomputable from the emitted report alone; every emitted numeric and boolean field has a unit and a provenance class; an impossible aperture emits no block; with no antenna configured the export keeps exactly its six pre-existing keys, 0 leaves changed and 0 removed); tests/validate_lunar_export_offboresight_spice.rs (flown_orbiter_export_matches_spice_geometry_and_scipy_pattern; documented_working_point_matches_anise_propagation_and_scipy_pattern)",
            oracle: "Mixed, and separated rather than pooled. The PATTERN underneath is externally validated and keeps its own row (a scipy.special.j1 fixture to < 0.05 dB in tests/validate_p1_orbital_footprint.rs, plus here the published Airy half-power abscissa x = 1.61634 located by bisection rather than assumed). The GEOMETRY is checked against closed-form triangle trigonometry written as a different expression from the dot product under test. The CONTAINMENT of the real beam by the approximate cone is derived algebra (28.019/√η vs 29.479 degrees per λ/D), so the correction can only be non-positive for η ≤ 0.9035. But the in-beam COUNTS themselves have no external oracle: no published table gives how many satellites of a Moonlight/LCNS-class shell hold a south-polar site inside a given dish's half-power beam, and the constellation is an illustrative public-source approximation, not a flown ephemeris. The measured disagreement at the documented working point — 0 links in beam under the real pattern against 28 under the approximation, −2.33 satellites per epoch, worst epoch 3, on 76 evaluated links — is therefore a MODELLED finding about the approximation, pinned as a regression literal (the nearest row sits 0.069° from either beam edge, four orders of magnitude above any last-digit disagreement), not an externally validated coverage number. Labelling the row ExternalDataset on the strength of the pattern's own external anchor would be borrowed validation, which is the move the matrix invariants exist to prevent. 0.30 round 2 (pre-registered d9755d28), blocked (stays MODELLED): SPICE geometry and SciPy Bessel functions reproduce the off-boresight angle (worst 3.0e-5 deg), Airy gain and in-beam flags on 6 336 rows of flown-orbiter states and the documented working point; but on flown geometry the flags split by satellite identity (the nearest link is 1.66 deg from the beam edge), the 5 deg visibility is checked as a flag, not a numeric elevation, the symmetric-approximation flag applies the 31000/G rule of thumb to a validated angle without validating the rule, and the implied efficiencies have no oracle; the scoping awaits an owner decision",
            oracle_kind: InternalConsistency,
            status: Modelled,
        },
        VerificationItem {
            requirement: "Tracking-loop loss of lock and spoof pull-in under interference",
            capability: "Loss of lock computed from loop dynamics instead of a power ratio: carrier (Costas) and code (non-coherent early/late) 1σ thermal jitter against C/N₀ with the squaring loss, against the stated rules 3σ_PLL + θ_e ≤ 45° and 3σ_DLL + ramp lag ≤ d/2 chips; drop and re-lock C/N₀ thresholds with the binding loop named and the hysteresis DERIVED from the wider pull-in bandwidth rather than asserted; the declared time to lose lock from a two-threshold lock detector with confirmation dwells, reported separately from the physical phase-escape time (Viterbi mean time between cycle slips, in log₁₀ s because it spans hundreds of decades); the largest code slew and carrier Doppler rate the victim's loops can follow; and the DENIAL RADIUS the loop dynamics imply reported alongside the existing power-ratio radius with their signed difference as its own named field. Runnable as the `tracking-loop` scenario kind",
            module: "tracking_loop (composing sdr, jamming)",
            tests: "tracking_loop::tests (open-loop Costas discriminator jitter against sdr::correlate stepped forward on seeded synthetic IF, 3 pooled noise realisations × 900 epochs, agreeing to 0.63% over 35-45 dB-Hz, with the squaring-loss term required to fit at least 3× better than the no-squaring-loss form wherever it is resolvable; the ~32 dB-Hz atan-discriminator saturation asserted rather than merely stated, so the validity limit is pinned; closed-loop σ against a stepped sdr Costas loop over 4000 epochs to 3.7%; first-order DLL ramp lag against a stepped sdr DLL to 0.17%; bessel_i0 against tabulated I₀ to 7.4e-8; the hysteresis width required to fall in [5·log₁₀ r, 10·log₁₀ r] across 4 ratios × 2 integration times × 3 bandwidths); api::tests::tracking_loop_kind_round_trips_through_the_dispatch; tests/tracking_loop_gnss_sdr_oracle.rs::finding_is_pinned",
            oracle: "The engine's own sdr correlator (sdr::correlate / synth_if / CaCode) stepped forward on seeded synthetic IF at a calibrated C/N₀ — a separate code path reaching the same numbers by numerical correlation of sampled IQ rather than by an algebraic jitter expression, so it is a different route and not a restatement — plus standard tabulated modified-Bessel I₀ values for the cycle-slip term. Loop theory per Kaplan & Hegarty ch. 8 and Viterbi/Gardner for the slip time. The row stays ReferenceImpl/MODELLED: the cross-check lives in this same codebase, and the bessel_i0 check validates one special function rather than the tracking model, so promoting the row on that basis would be self-serving labelling. ExternalDataset would need a recorded raw-IF dataset with ground-truth C/N₀ and an annotated loss-of-lock instant (TEXBAT/OAKBAT class); none ships in this tree, and even with the IQ those datasets publish no per-epoch loop-state truth, so a declared loss-of-lock time could only be validated against some other receiver's lock detector, which is a modelled choice and not an oracle. The loop bandwidths, integration time, correlator spacing, pull-in ratio, dwells, jammer power and antenna gains are representative band figures, not a datasheet. 0.30 round 2, GNSS-SDR 0.0.19 (GPL-3.0, run as a program) on independently generated IF (pre-registered 6ef7698c, amendments to the measurement method disclosed), a finding (stays MODELLED): closed-loop PLL and DLL jitter agree within 8 % at 35 to 45 dB-Hz, the 10 Hz/s dynamic stress within 1 % and the first-order code ramp lag within 2 %; at 30 dB-Hz the PLL jitter is 21 % higher and the DLL jitter 32 % lower, the measured 15-degree-rule thresholds sit 1.5 dB above the engine, and the second-order loop slips 0.5 to 2 decades more often than the first-order slip-time bound. 0.30 revision: the Costas slip time now uses the loop SNR rho/4 (half-cycle slips); the default jitter_table log10_mean_time_to_cycle_slip_s falls from 11.58 to 2.10 at the 25.47 dB-Hz threshold",
            oracle_kind: ReferenceImpl,
            status: Modelled,
        },
        VerificationItem {
            requirement: "Lunar-VLBI station-coordinate covariance from a tracking schedule",
            capability: "Delay partials accumulated over a schedule of baselines × epochs into a Fisher information matrix, inverted to the station coordinate covariance and the per-coordinate station sigma, replacing an assumed isotropic equipartition link from a scalar delay precision. The state carries Earth-fixed (ITRS) station coordinates, so the Jacobian is the inertial partial rotated by each epoch's GCRS→ITRS matrix and Earth rotation is what makes those coordinates observable — the report MEASURES the Earth-fixed line-of-sight sweep and the beacon declination rather than assuming them. Rank, datum defect, condition number, the information spectrum and the free-network null space are emitted on every run, and under a rank deficiency the headline sigma is published as NULL with a status rather than read out of a near-singular inverse. The equipartition value c·σ_τ·√(g/N) for the SAME schedule is printed beside the computed one with their ratio, together with the isotropic trace bound √(p/trace(M)) that AM-HM makes a hard floor. Runnable as the `lunar-vlbi-fim` scenario kind",
            module: "lunar_vlbi_fim (composing lunar_vlbi, fim, cio, lunar_frame, frames)",
            tests: "lunar_vlbi_fim::tests (24 lib tests: the analytic Jacobian against a central finite difference of lunar_vlbi::vlbi_delay_s taken through a route that rotates the state's own coordinates forward and never touches a partial derivative, agreeing to < 1e-6 of 1/c per column, with the two information matrices agreeing to < 1e-6 of the largest diagonal and the covariances to < 1e-5 relative; an orthogonal unit geometry whose covariance is c·σ_τ per axis in closed form to 1e-12, which is also the one case where the equipartition link is exact; the covariance spectrum and every station's 3-D sigma invariant under a rigid rotation of the whole network to 1e-9 with C_rot = R·C·Rᵀ pinned blockwise AND an explicit assertion that the per-axis sigmas did move, so the test cannot pass vacuously; covariance scaling exactly as σ² and as 1/N; the AM-HM trace bound never beaten; the delay closure τ_ik = τ_ij + τ_jk pinned to one ULP on the delays and on the Jacobian rows, with a redundant baseline shown to add information but never rank; a single epoch reported rank-deficient with a null headline; a longer arc measured to condition better at matched observation count; the beacon block shown unobservable on this schedule; the neglected differenced-Shapiro partial measured by finite difference at run time and emitted rather than waved away); tests/lunar_vlbi_campaign_spice_oracle.rs::lunar_vlbi_fim_matches_spice_geometry_and_numpy (default anchored network and free network: SPICE-built Jacobian, the 16-observation schedule identical, station sigmas within 2.2e-3, eigenvalues 2.3e-3, condition 2.4e-3, headline 1.0e-3, line of sight 0.018 deg, declination 0.007 deg, against bars of 1 % and 0.1 deg; free network rank 8/9 with a null headline, null space 0.006 deg apart; NumPy on the committed Jacobian to 2e-13)",
            oracle: "An independent in-repo route. Every Jacobian row is re-derived by central finite difference of lunar_vlbi::vlbi_delay_s evaluated from the state's own Earth-fixed and Moon-body-fixed coordinates rotated forward through the frame chain — a path that computes no derivative and shares no expression with the analytic partials — and the information matrices the two routes build agree to < 1e-6 of the largest diagonal. The linear-algebra kernel this composes (information_matrix, crlb, sym_eig) is separately externally anchored against numpy.linalg.eigh / numpy.linalg.inv in tests/fim_observability_reference.rs, and the delay observable carries lunar_vlbi's own delta-DOR far-field oracle; the row does not borrow either status. Closed-form identities checked here and labelled as such: σ² and 1/N scaling, and √(p/trace(M)) as an AM-HM lower bound the computed sigma cannot beat, which coincides with the equipartition value only on an isotropic geometry — which is why the measured ratio is exactly the anisotropy the assumption discarded. 0.30 external comparison (Library: NAIF SPICE CSPICE N0067 via spiceypy 8.2.0, MIT; DE440, ITRF93 earth_latest_high_prec, MOON_PA), pre-registered (50863551) together with an engine-side model-error sensitivity run: every Jacobian row is rebuilt by central differences of converged Newtonian light-time differences from SPICE geometry (the light-time equation is a short script over SPICE positions; SPICE carries the geometry), with the schedule rebuilt from SPICE elevations. The schedule, rank, defect, information spectrum, condition number, station sigmas, headline, trace bound, equipartition ratios, free-network null space, line-of-sight sweep and beacon declination agree within the pre-registered 1 % / 0.1 deg, which sits above the engine known analytic-Moon error (3.2e-3 on sigmas, measured before the run). NumPy 2.3.5 redoes the linear algebra on the committed engine Jacobian to 2e-13 (P2). Validated as a Cramér-Rao bound for the stated reduced parameter set on the stated illustrative inputs: the Moon-centre ephemeris, clocks, troposphere and Earth-orientation parameters are held fixed in both legs, so it is not a real-campaign accuracy",
            oracle_kind: ExternalDataset,
            status: Validated,
        },
        VerificationItem {
            requirement: "Lunar-surface-point coordinate covariance from a VLBI delay schedule, kept distinct from the Earth-station one",
            capability: "A third datum choice, `all-stations-fixed`, that holds every Earth station and estimates the BEACON's Moon-body-fixed coordinates alone — the configuration a lunar surface-point uncertainty is actually quoted for, since Earth station coordinates are an input to the delay model rather than an unknown of it. It exists because the station-level covariance and the surface-point covariance are DIFFERENT QUANTITIES separated by the lever arm ρ/B, and nothing previously stopped one being quoted against the other. The emitted `beacon_link` block carries ρ, the longest baseline, the lever arm, the surface-point form of the equipartition link c·σ_τ·(ρ/B)·√(g/N), the computed per-coordinate beacon sigma and their ratio — the ratio null rather than misleading whenever the beacon is unestimated or the matrix rank-deficient. B is taken as the LONGEST baseline present, the most favourable one, so the ratio can only understate. Runnable as `datum = \"all-stations-fixed\"` with `estimate_beacon = true`, which is refused with a message naming the missing input when the beacon is not estimated",
            module: "lunar_vlbi_fim (composing lunar_vlbi, fim, cio, lunar_frame, frames)",
            tests: "lunar_vlbi_fim::tests (7 lib tests: every datum spelling round-trips through parse/as_str and an unknown one is refused; holding every station without the beacon is refused with an error naming `estimate_beacon`; the lever arm is asserted EQUAL to ρ/B and the beacon equipartition EQUAL to the station equipartition times it, both to 1e-15, with a further assertion that the lever arm exceeds 10 so the two budgets are not confusable on this geometry; the fixture's published baseline is pinned to 10726.748 km and its 49-sample schedule asserted to yield strictly fewer than 49 mutually visible observations; the beacon spectrum on a single baseline is measured to span at least five decades and the resulting ratio asserted above 1 by AM-HM and above 100 in fact; the station-plus-beacon layout is asserted rank-deficient with BOTH computed fields null while the modelled comparand still reports. Plus a guard on the fixture itself: a top-level key spliced after an array-of-tables becomes station data instead, so the splice point is asserted and the parsed scenario checked to carry the key — the failure mode is a run that silently uses a different configuration from the one the test names)",
            oracle: "Closed-form identities, with no external oracle claimed or available. The lever arm is checked against ρ/B and the two equipartition forms against each other to 1e-15 — algebraic identities, so they catch a wiring error and nothing else, and are labelled as such. The substantive result is MEASURED rather than asserted: a delay from a fixed baseline constrains the beacon's DIRECTION, so the line-of-sight component reaches the information matrix only through the near-field range term, and the test reads the resulting anisotropy off the emitted spectrum instead of deriving it. AM-HM makes √(p/trace(M)) a hard floor, so an isotropic-equipartition link can only ever UNDERSTATE, and the computed-over-equipartition ratio is exactly the anisotropy it discarded. MEASURED on the Goldstone-like/Canberra-like pair whose chord is 10726.748 km: over 112 sampled days, 36 admit no mutually visible epoch at all at a 10° mask, the most ever mutually visible is 17 of a 49-sample schedule, and on the 73 viable days the three-component ratio runs from 113.9× to four orders of magnitude more, median 1513×, while restricting to the two transverse directions the line of sight does not starve gives 3.94× to 25.8×, median 7.8×. WHAT THIS ROW DOES NOT CLAIM: any of those figures as a property of a real campaign. It establishes that the surface-point quantity is now COMPUTED rather than assumed, and that it cannot be silently interchanged with the station-level one. Stays ReferenceImpl/MODELLED: no published lunar-VLBI surface-point covariance exists to validate against, the stations and beacon site are illustrative rather than surveyed, and the ephemeris, clocks, troposphere and Earth-orientation parameters are held FIXED, so this is a Cramér-Rao bound for a reduced parameter set and optimistic in its own right. The same quantity on the kernel path (beacon on the DE440 Moon) is validated on its own row, \"…, kernel path\"; on this analytic path the smallest beacon sigma is 3.9 % below that row's SPICE oracle, which is why this row stays MODELLED",
            oracle_kind: ReferenceImpl,
            status: Modelled,
        },
        VerificationItem {
            requirement: "Lunar-surface-point coordinate covariance from a VLBI delay schedule, kernel path",
            capability: "The all-stations-fixed beacon covariance of the lunar-vlbi-fim scenario (every Earth station held, the beacon's Moon-body-fixed coordinates estimated alone) with the beacon placed on the JPL DE440 Moon read by the engine's own kernel reader (planetary_kernel_path; lunar_vlbi_fim::epoch_geometry_with, ephem_provider::KernelEphemeris). Only the Moon centre differs from the analytic path; the IAU 2015 body rotation, stations, Earth rotation and linear algebra are the same. The validated outputs are the observation set, the 3 x 3 information spectrum, rank and condition number, the three body-fixed beacon sigmas and their RMS, the lever arm and the computed-over-equipartition ratio, on the default schedule. Runnable as the `lunar-vlbi-fim` scenario with datum = \"all-stations-fixed\", estimate_beacon = true and planetary_kernel_path set",
            module: "lunar_vlbi_fim (epoch_geometry_with, schedule, schedule_jacobian); ephem_provider (KernelEphemeris); naif_kernel",
            tests: "tests/lunar_vlbi_surface_point_spice_oracle.rs::surface_point_covariance_kernel_path_matches_spice_geometry_and_numpy (16 observations identical; rank 3/3; eigenvalues within 5.9e-5; condition 5.9e-5; beacon sigmas within 1.7e-3 against 1e-2; RMS 2.9e-5; lever arm 1.4e-8; P2 sigmas 3.9e-14 against 1e-9); lunar_vlbi_fim::tests",
            oracle: "Binding Library leg: NAIF SPICE Toolkit N0067 (spiceypy 8.2.0, MIT) on de440s, earth_latest_high_prec (ITRF93 with UT1 and polar motion) and the DE440 lunar frames, the beacon fixed in MOON_ME; every Jacobian row is a 3 km central difference of the converged Newtonian light-time difference (the M069 oracle's own light-time code, imported), never a Kshana partial; visibility rebuilt from WGS-84 elevations; NumPy 2.3.5 / SciPy 1.18.1 (BSD-3-Clause, LAPACK) eigh and inv. P2 leg: NumPy on the engine's committed Jacobian. Pre-registered (4a51256) before the fixture or oracle existed, with bars of 1 % on eigenvalues, condition, sigmas, RMS and ratio, 1e-4 on the lever arm, exact observation set and rank; P2 1e-9. Disclosed: the engine-only comparison of analytic and kernel Moon (3.9 % on the y sigma) was run before the pre-registration, to choose the kernel path, and is stated there. Result: both legs agree, worst 1.7e-3 (beacon y sigma 0.081211 m against 0.081351 m). Mutation: transposing the beacon partial's body rotation fails both legs. Both sides read DE440, so agreement validates the geometry and linear algebra on DE440, not DE440. Outside the claim: a real campaign's surface-point accuracy (clocks, troposphere and Earth orientation held fixed; illustrative stations and beacon site), and the analytic default path (row above, which stays MODELLED: on the analytic Moon the y sigma is 3.9 % below this oracle)",
            oracle_kind: ExternalDataset,
            status: Validated,
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
            tests: "cislunar_observability::tests and observability_gramian::tests (the default document pinned bit-for-bit by FNV-1a of its JSON, summary and SVG, with explicit-default values asserted to be a no-op and the eight extension keys asserted ABSENT so the capture cannot be regenerated into a self-comparison; the additive `units` block excluded from the freeze by being stripped and re-hashed against the constant pinned before it existed, which proves rather than assumes that nothing released moved; rank invariance under a homoscedastic sigma asserted at σ = 0, 0.1, 1, 10, 100 m; σ_pos asserted to scale exactly linearly with σ to 1e-6 relative; the DRO null space asserted to be exactly the z and ż coordinate axes with the two causes separated — a range row between coplanar spacecraft has û_z = 0, and the CR3BP out-of-plane block decouples exactly at z = 0; spatial Jacobians against central finite differences and against the crate's independent 3-D range-rate observable; out-of-plane families refused in planar mode)",
            oracle: "An independent row-echelon rank by Gaussian elimination with partial pivoting confirms every six-state rank verdict — a different algorithm sharing no code with the eigen/SVD route under test. The 6×6 CR3BP state-transition matrix this composes carries its own ReferenceImpl oracle against SciPy variational integration, and the halo/NRHO initial conditions come from a corrector that reproduces the published L2 southern 9:2 Gateway orbit. The existing square-root-information-filter leg is explicitly NOT counted as corroboration: it consumes the same Jacobians and reduces to the same normal matrix, so it is a consistency check between two numerical machines, and the emitted extension label says so. NOT externally anchored, and ExternalDataset is therefore declined rather than borrowed from the STM's row: the threshold arc lengths themselves depend on the MODELLED constellation design, the epoch grid, and — measurably, by up to 40× — on the singular-value tolerance. The published planar 2.09 h is reproduced exactly at rel_tol = 1e-6 and is itself tolerance-dependent (10.25 h at 1e-4, 0.42 h at 1e-8), which is a property of the criterion rather than of the orbit. No public dataset publishes an arc-length observability threshold for a chosen cislunar constellation. MEASURED RESULT: the spatial six-state threshold is 22.17 h for the L2 NRHO and 40.42 h for the L2 halo, and DOES NOT EXIST for the planar-DRO family the published claim was derived on — rank 4 of 6 with datum defect 2 and two exactly-zero eigenvalues, a structural defect no arc length recovers",
            oracle_kind: InternalConsistency,
            status: Modelled,
        },
        VerificationItem {
            requirement: "Operational-style Earth-orientation prediction error, measured predicted-versus-final",
            capability: "A least-squares bias-plus-rate fit over a trailing window plus the principal periodic terms — annual, semi-annual and the two principal zonal tides for UT1; Chandler, annual and semi-annual for the pole — extrapolated with the last in-window residual carried forward: the class IERS Bulletin A uses, in place of the persistence predictor the published horizon rested on. Scored the only honest way: a forecast for T+h built from rapid Bulletin A rows at or before T, measured against the LATER-PUBLISHED Bulletin B final at T+h, with persistence scored over the identical epoch set against the identical finals beside it. A target epoch with no published final is dropped rather than re-scored against the rapid column; a periodic term the window cannot constrain is reported as rejected with the cycles it actually spans; an incomplete window is refused rather than quietly shortened",
            module: "frame_eop, realtime_frame_eop",
            tests: "frame_eop::tests, realtime_frame_eop::tests and tests/operational_eop_predictor_reference.rs (analytic-signal coefficient recovery to 1e-9 at a 365-day window; a bias-plus-rate fit equal to the closed-form ordinary-least-squares slope and intercept to 1e-12 on real rows; TWO look-ahead detectors that wreck the rapid UT1 and pole columns of every row after the issue epoch — leaving the Bulletin B finals intact — and demand bit-identical output, mutation-verified to turn 10 tests red when the fit barrier is loosened by exactly one day; an independently rebuilt epoch list; a target's Bulletin B block blanked and the epoch shown to leave the table; term admission checked at 6, 15, 150 and 365-day windows; monotone row counts; and a frozen pre-change capture of the default report asserted field for field with no tolerance, which additionally asserts the capture does not contain the new keys so it cannot be silently regenerated into a self-comparison); tests/operational_eop_predictor_bulletin_a_oracle.rs::predictor_mae_against_bulletin_a_and_the_pcc_range_finding; tests/operational_eop_ls_ar_bulletin_a_oracle.rs::ls_ar_predictor_against_bulletin_a_finding",
            oracle: "Three independent routes, none of them a published prediction-accuracy figure. (1) An analytic signal with known coefficients — the only way to exercise the periodic machinery, since no committed series is long enough to admit an annual term. (2) The textbook closed-form least-squares solution, different algebra from the matrix solve under test, on real rows. (3) The genuine archived Bulletin A prediction rows the real 2026 product publishes, compared per lead as an AGREEMENT statistic and explicitly not as an error: 0.256 ms at 1 day, 0.695 ms at 2 days, 1.252 ms at 3 days, drifting to 3.885 ms at 9 days. So this is Bulletin A's CLASS, close at short lead, not Bulletin A. The predicted-versus-final residuals are real measured quantities over real IERS rows, but their magnitude is checked only against the DIRECTION of the comparison, never against an IERS-published accuracy number — reading a real product is provenance, not an oracle. MEASURED: at day 1 the operational predictor gives 3.78 m of Moon-frame error against persistence's 11.39 m (3.01×), at day 2 10.23 m against 21.72 m (2.12×), at day 3 20.33 m against 30.57 m (1.50×) — and it is WORSE beyond three days (0.87× at 5 days, 0.43× at 10), which the report emits rather than showing only the horizons that flatter it. NOT reproduced: the autoregressive residual filter and the tabulated zonal-tide reduction, the 365-day operational window is unreachable with the committed data, and NO archived earlier vintage of the series exists in this repository — so the archived-vintage table reports no rows rather than scoring a synthesised one. 0.30 external comparison, a finding (stays MODELLED): scored against the same finals over 178 archived Bulletin A issues with the crate's default 15-day window, the predictor's UT1 MAE is 2.4x to 12.6x Bulletin A's at 1 to 10 days (bar 1.5x) and 5.32 ms at 10 days, outside the 0.36 to 3.13 ms range of the 2nd EOP PCC; the pole is 1.5x to 1.85x Bulletin A's (inside 1.5x only at 6 and 7 days); 19 of 21 pre-registered conditions fail. Correction to route (3): the 2026 product rows it was compared with carry the IERS I (measured) flag, not P, so those agreement figures are against measured rapid values, not Bulletin A predictions. 0.30 round 2, a least-squares plus autoregressive predictor with the zonal tides removed analytically, against 178 archived Bulletin A issues at the round-1 bar (pre-registered c93605b4), a finding (stays MODELLED): 12 of 21 conditions hold; the UT1 MAE is 1.73 to 2.11x Bulletin A at 2 to 10 days (bar 1.5x) while the pole is within 1.27x at every lead. 0.30 revision: with the offline input now classified by IERS flag, the route-(3) agreement figures are against real Bulletin A predictions (0.256/0.695/1.252/3.885 ms at 1/2/3/9 days against rapid rows -> 0.133/0.421/0.839/2.786 ms)",
            oracle_kind: ReferenceImpl,
            status: Modelled,
        },
        VerificationItem {
            requirement: "Lunar frame datum from an observing campaign",
            capability: "The seven-parameter Helmert datum propagated from a SIMULATED OBSERVING CAMPAIGN instead of recovered from an injected transform. Earth stations observe a sourced catalogue of lunar-surface beacons over an explicit schedule; the lunar-VLBI delay partials are accumulated into a beacon-coordinate Fisher information matrix and pushed through the Helmert design A = [I₃ | [p]ₓ | p] into H = AᵀM_bA, so the reported datum accuracy is a function of the observing programme — exactly linear in the delay sigma and monotone in the arc through the libration the report MEASURES. The datum defect is the subject rather than a footnote: rank, defect, condition number, spectrum, unobservable directions in the seven-parameter basis, the weakest direction even at full rank and each parameter's share of it are emitted on every run, and any parameter the campaign does not constrain is published as NULL with a status. Beacon-error correlation is MEASURED, not assumed — exactly zero with the stations held fixed, and printed with its cost when they are estimated. Runnable as the `lunar-frame-campaign` scenario kind",
            module: "lunar_frame_campaign (composing lunar_vlbi, lunar_vlbi_fim, fim, lunar, lunar_frame_realise, frames, cio, lunar_frame)",
            tests: "lunar_frame_campaign::tests (21 lib tests: the Helmert design against a central finite difference of lunar_frame_realise::apply_helmert — the module the datum is FOR, which computes no derivative and so pins the [p]ₓ sign convention — all 84 design entries agreeing to < 1e-6; a pure network translation read back as a pure translation with < 1e-6 leakage into the other six parameters; the datum sigma exactly linear in the delay sigma to 1e-8 over a 3× change on all seven parameters; a 16 h arc measured worse and a 48 h arc measured better than 24 h, with the emitted libration sweep ordered the same way; the worst translation axis asserted to BE the dominant axis of the separately measured body-fixed direction to Earth and worse than the others by > 5×, a physics oracle nothing in the solver was told about; three collinear beacons producing a defect with every datum sigma NULL and the null directions emitted in the seven-parameter basis; offblock_fraction and inter-beacon correlation exactly 0.0 with the stations fixed and both > 0 with them estimated; the comparison block's injected-transform figures shown equal to an independent run of that scenario to 1e-14 relative rather than transcribed; a guard that no injected/recovered datum appears anywhere in the document; the lunar-frame-realisation emission pinned byte-for-byte by FNV-1a-64 over json‖summary‖svg for three input shapes, fingerprinted before the work began); tests/lunar_vlbi_campaign_spice_oracle.rs::lunar_frame_campaign_finding_stations_estimated_p2_precision (gated; the strict lunar_frame_campaign_matches_spice_geometry_and_numpy stays ignored); tests/lunar_frame_campaign_mpmath_oracle.rs::lunar_frame_campaign_datum_matches_mpmath_extended_precision (finding, promotion of this row pending a founder decision: against a 50-digit mpmath oracle, pre-registered 804662d5, the engine's stations-estimated datum sigmas are within their a-priori backward-error bound, 9.7e-6 off on 2024-01-01, and the 1e-9 bar was below what any double-precision route reaches, the best, a NumPy QR projection, being 5.5e-9 off; the evidence backs the separate row 'Lunar frame datum covariance with the stations estimated, against 50-digit extended precision')",
            oracle: "Closed-form identities and an independent in-repo route, with no external oracle claimed. The Helmert design — the only new derivative in the module — is re-derived by central finite difference of lunar_frame_realise::apply_helmert, a path sharing no expression with the analytic form. The accumulation it composes is lunar-vlbi-fim's, whose Jacobian is finite-differenced against lunar_vlbi::vlbi_delay_s there, and whose linear-algebra kernel is separately externally anchored against numpy in tests/fim_observability_reference.rs — this row borrows neither status. The physics oracle is structural rather than numerical: a beacon delay partial is the near-field DIFFERENCE of two near-parallel unit vectors, so the worst-determined translation direction MUST be the body-fixed direction to Earth, and the test asserts the computed answer against the separately measured direction. MEASURED: campaign-derived translation sigma 6.3975 m against the injected-transform scenario's 0.3125 m recovery error (20.5× tighter), while rotation and scale run the OTHER way at 2.32× and 13.5× looser — the injected path assumes one isotropic sigma and so spreads its error uniformly across seven parameters, which the delay observable does not. Rank 7/7 but condition 3.8e5, with one direction 99.57 % pure translation-toward-Earth and forty times worse than any other. WHAT THIS ROW DOES NOT CLAIM: that the campaign figure is right in absolute terms. It establishes that the figure now DERIVES from a schedule, a geometry and an error model rather than from a planted answer. Stays ReferenceImpl/MODELLED: no published lunar-VLBI campaign-plus-datum-covariance pair exists, the station network and delay sigma are ILLUSTRATIVE inputs (the beacon catalogue is sourced, the campaign is not), observations are treated as independent while a real session's troposphere and clock are correlated between nearby scans, and the ephemeris, clocks, troposphere and Earth-orientation parameters are held FIXED. 0.30 external comparison, a finding (stays MODELLED): with every beacon Jacobian row rebuilt from NAIF SPICE light times (DE440, ITRF93, MOON_ME; pre-registered 50863551), the schedule, Helmert rank, datum sigmas (within 4.7e-3), condition, weakest direction (0.07 deg), libration sweep and arc ordering agree on six scenarios within the pre-registered 1 % / 0.2 / 0.05 deg. NumPy on the committed engine Jacobian agrees to 3e-14 where the stations are fixed. With the stations estimated it differs by 6.8e-6 against a pre-registered 1e-9, whose condition-number premise was wrong (Helmert condition 2.1e8; independent NumPy routes disagree by 3e-6; a contribution from the engine 1e-9 pseudo-inverse fallback is not ruled out), so the row is not promoted on that pre-registration",
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
            tests: "lunar_ephemeris::tests (format and frame parsing; Lagrange interpolation exact at nodes and on a linear track off-node; ICRF elements take the IAU 2015 reduction and are byte-equal to an explicit icrf_to_iau_moon application; true↔mean anomaly round-trips against a forward Kepler solve; malformed files refused with the reason named). lunar_service::tests (with `ephemeris_path` unset the report's key set and SHA-256 are pinned; the Keplerian row equals the standalone Keplerian run field for field; the identity σ_required · HPL_max / σ_URE = AL, then an END-TO-END re-run at the computed requirement reaching 100 % protection-level availability and a re-run 1 % above it not reaching it; every emitted numeric field of both new blocks walked from the produced JSON for a unit and a provenance class; the committed fixtures matched to their source tables satellite for satellite; a horizon past the end of a table refused); tests/lunar_service_requirement_orekit_oracle.rs::lncss_b_dense_finding_is_unchanged; tests/lunar_service_volume_orekit_oracle.rs::service_volume_matches_orekit_on_identical_ephemeris_and_grid",
            oracle: "The GEOMETRY is external and hashed: three fixtures whose numbers come only from documents retrieved with URL, retrieval date and SHA-256, regenerable by committed generators that verify the upstream hash and ABORT rather than emit a number — the LANS interoperability-demonstration reference constellation (NASA NTRS 20250009447, SHA-256 d1b916be…), the LNCSS case studies (NAVIGATION 70(4) navi.613, CC BY, SHA-256 4e294687…), and a genuine flown-spacecraft ephemeris for LRO, Danuri, Chandrayaan-2 and CAPSTONE evaluated from JPL's own reconstructed kernels via Horizons. NO lunar-navigation constellation kernel exists publicly — Moonlight/LCNS, LCRNS and LNSS are not flying and NAIF publishes nothing for them — and none was invented. The DERIVED σ_URE requirement has NO external oracle (nobody publishes the ranging accuracy a 50 m lunar HPL demands over this service volume), so it is checked against its own algebraic identity and, independently, by re-running the whole sweep at the computed requirement and confirming availability flips there. MEASURED: the published 8-satellite design needs σ_URE 2.9044 m at 100 % coverage against the illustrative constellation's 0.3591 m at 37.85 % — an 8.09× revision of a published number under programme rule R4. The qualitative conclusion survives (LNIS-class 30 m still does not close a 50 m south-polar HPL) but the shortfall was overstated eightfold. The 5-satellite LANS demo yields ZERO protection-level samples — five satellites cannot give the six-in-view a single-fault hypothesis set needs — and the requirement field is ABSENT rather than fabricated; likewise for the four real spacecraft at 0 % coverage. InternalConsistency is the honest kind: the INPUT data is external and hashed, but the quantity this row is about is validated only against itself. 0.30 external comparison, a finding (stays MODELLED): against the LNCSS case-study statistics of navi.613 on 346 grid points, 4 of 12 availability statistics fall outside the pre-registered 2 percentage points (case A: -4.0, +22.5 and -3.6 pp; case B: -12.1 pp). Likely causes: elements read in the wrong frame, two-body Kepler over 15 days against the paper's unstated force model, and a grid not reproducible from the text. The PDOP half was not evaluable (LANS prints no numeric statistic); the comparison test is committed ignored. 0.30 round 2, a finding (stays MODELLED): against an Orekit 12.2 / Hipparchus 3.1 oracle computing the whole report (Orekit propagation, DOPComputer visibility and DOP, Hipparchus-composed MHSS protection levels, the requirement solved per sample; pre-registered d3ce97b2) on all five retrieved geometries and two grids, 155 of 160 values agree within the pre-registered bars (2 pp, 5 %, 1 %), including the sigma_URE requirement for LNCSS A and C (3.879072208 m on both sides for case A) and the absent requirement for LANS and the orbiters. LNCSS B on the dense grid fails on its worst-sample statistics (sigma_required 0.000923 against 0.001511 m, hpl_max 1.63e6 against 0.99e6 m) where near-singular geometries (PDOP about 1e6) amplify the metre-level position agreement; its p95 requirement agrees (1.6343 against 1.6357 m). The worst-sample requirement is ill-posed on degenerate geometry. Against navi.613: 4 of 12 still outside 2 pp (pinned)",
            oracle_kind: InternalConsistency,
            status: Modelled,
        },
        VerificationItem {
            requirement: "Unit and provenance declared for every reported quantity",
            capability: "A machine-readable schema giving unit, provenance class and definition for every numeric field of every scenario report, plus a single global gate that runs every registered scenario kind and fails if an emitted numeric field lacks either. The provenance vocabulary is closed and each class carries an evidence tier, with two classes deliberately mapped to `inherits-scenario-label` and `depends-on-input` rather than being assigned a tier the class does not determine",
            module: "field_schema",
            tests: "tests/field_units_global.rs (all 61 registered kinds run, one document shape each: every numeric leaf must resolve to an entry in that document's own units block; a malformed entry counts as missing for EVERY kind, exempt or not, so a placeholder buys no coverage; the exemption list may not exceed its pinned ceiling, a listed kind that turns out to be fully covered FAILS the gate so the list cannot be padded, and a registered kind absent from the runner table fails so a new pack cannot slip in unexamined — which it did, catching both kinds added after this work began; a one-way ratchet on the described-but-undefined backlog; and a staleness check on the committed schema document); field_schema::tests",
            oracle: "The emitted document itself: every numeric leaf must resolve to an entry in that document's own units block. There is no external unit registry to check a DECLARED unit against, so a declared unit is a reviewed assertion and not a verified one — the gate verifies COMPLETENESS and WELL-FORMEDNESS, not truth, and Validated would be wrong because nothing external confirms that `m` is the right unit for a field named `_m`. An independent name-suffix cross-check was run over the 1,434 fields described AT THAT TIME: of the 691 carrying a unit-bearing suffix, 40 disagree with the declared unit and all 40 are explained (per-second suffixes, minima, aperture-seconds, newton-metres against a nanometre-looking suffix), so no wrong unit surfaced. That cross-check has not been re-run since, and coverage has grown past it — the figure is left at what was actually measured rather than restated at the current total. COVERAGE MOVED 7 of 56 kinds to 60 of 61, and 389 of 1354 fields to 1,742 of 1,744 (docs/field-units-schema.json, which a staleness check keeps current). ONE kind remains uncovered and is named with its reason rather than hidden behind a wildcard: `sweep-nd`, two of whose columns are caller-keyed so their units are data. `cislunar-observability` was the second, and came off the list when its released document gained a units block: the additivity pin that had named `units` as a forbidden key now PROVES the addition is additive instead — strip the block back off and the document still hashes to the two constants frozen before it existed, so a released value that moved underneath the addition still fails. The work also surfaced twelve unit or documentation defects in existing code, reported rather than fixed under R1",
            oracle_kind: InternalConsistency,
            status: Modelled,
        },
        VerificationItem {
            requirement: "Lunar frame datum from a REAL observing campaign",
            capability: "The seven-parameter Helmert datum covariance, with its two simulated inputs replaced by measured ones: the schedule is the ground-transmit epochs of 337 archived ILRS lunar laser-ranging normal points (2015-04-08 to 2015-06-27, Grasse MeO 7845 and Matera MLRO 7941, all five retroreflector arrays) and every observation weight is that point's own archived precision bin_rms/√n_raw — median 5.13 mm of one-way range, read out of the file. Station coordinates IERS ITRF2020, reflector coordinates JPL DE430 Table 7. Runnable as the `lunar-llr-datum` scenario kind",
            module: "lunar_llr, realdata::llr_crd (composing fim, cio, frames, ephem, lunar_frame, lunar_frame_campaign)",
            tests: "tests/lunar_llr_real_data.rs (11 tests: all 15 committed CRD files byte-identical to their recorded digests; all 349 records accounted for, 337 used and 12 skipped for a named reason; every archived range inside the real perigee/apogee envelope; the weights shown to BE bin_rms/√n_raw; the line-of-sight coordinate best determined for every array with the libration sweep that buys it measured separately; the residual and its independent confirmation against JPL Horizons; the 0.1-degree geometry-tilt sensitivity; the simulated-campaign comparison shown equal to an independent run of that scenario; an R1 bit-for-bit pin on the three pre-existing lunar frame packs); lunar_llr::tests (12: the range partial against a central finite difference of the modelled time of flight to < 1e-6 relative; the light time a converged lunar round trip; the datum sigma exactly linear in the weight scale to 1e-9; block-diagonality exact; a missing data directory refused rather than substituted; an edited catalogue row caught by its own radius column); realdata::llr_crd::tests (7: field semantics, midnight rollover, refusal of a non-UTC time scale and of an unsupported format version, and no substituted sigma for an empty bin); tests/validate_llr_datum_spice_oracle.rs (llr_datum_finding_tz_sigma_one_percent_gap, pinned; reported_residual_is_the_engine_to_spice_light_time_gap)",
            oracle: "Closed-form identities and an independent in-repo route; NO external oracle is claimed for the covariance, because no published lunar-LLR datum-covariance pair exists to check it against. The only new derivative — the range partial with respect to the reflector's body-fixed position — is re-derived by central finite difference of the two-way light time it differentiates, a path sharing no expression with the analytic form. The physics oracle is structural: the partial of a range IS twice the line of sight, so the body-fixed coordinate along the mean direction to Earth must be determined far better than the two plane-of-sky coordinates, which only the libration reaches — measured at 50.7× to 71.7× across the five arrays against a libration sweep the report measures independently, with the isotropic small-angle prediction and the transverse anisotropy that explains the gap both printed. WHAT CHANGED: the schedule, the observation count and every observation weight are now measured; 337 of 349 archived points are used and the 12 that are not are skipped and counted, because ITRF2020 carries no position for Apache Point. MEASURED: datum translation sigma 1.851746e-2 m against the SIMULATED campaign's 6.3975 m (345×), rotation 36×, scale 24× — a ratio between a laser-range network and a VLBI-delay network, so a finding rather than a validation. Reflector information rank 15/15 with inter-array coupling exactly 0; Helmert rank 7/7, condition 2.4e4. WHAT THIS ROW DOES NOT CLAIM: that the figure is right in absolute terms. A real LLR solution co-estimates the lunar orbit, physical librations, Earth orientation, station coordinates and tidal and relativistic parameters, and reports decimetres (DE430 Table 7's own 0.12-0.27 m) where this bound is far smaller; this is a Cramér-Rao bound for a stated reduced parameter set, not an accuracy. Stays MODELLED: the Moon-centre ephemeris and the IAU 2015 body orientation are modelled, and troposphere, tides, station eccentricity, polar motion, UT1-UTC, relativistic delay and station clocks are absent. Their combined size is PUBLISHED rather than argued — observed-minus-computed one-way range 156,494 m RMS over the 337 points — and their effect on the covariance is BOUNDED rather than argued: re-solving the entire datum with every partial tilted by 0.1° (twice the measured worst-epoch ephemeris tilt, sign alternating) moves the deliverable by 0.288 %. EXTERNAL CHECK (0.30 round 2, pre-registered 6b27964a), a finding (stays MODELLED): SPICE two-way light time (DE440, ITRF93, DE440 lunar orientation) with finite-difference partials, and a numpy inverse, on the same 337 measured normal points and weights, agree on bookkeeping, both ranks, zero coupling, the residual RMS (2.1e-5) and 15 of 16 covariance figures. The z-translation sigma is 1.03 % high against the pre-registered 1 % bar. With the Moon centre from DE440 it falls to 0.049 % (c51f8b2, seen data), and on fresh 2019 normal points the kernel-Moon datum holds every bar (row \"…, kernel Moon centre\"), where the analytic Moon also stays inside the bars (worst 3.8e-3, information only), so that comparison does not separate the Moon models. This row, on the analytic default, stays MODELLED until a pre-registered fresh-data run of the analytic path",
            oracle_kind: ReferenceImpl,
            status: Modelled,
        },
        VerificationItem {
            requirement: "Lunar frame datum from a REAL observing campaign, kernel Moon centre",
            capability: "The lunar-llr-datum seven-parameter Helmert datum covariance from archived ILRS normal points and their measured weights, on the kernel path: the geocentric Moon centre is read from JPL DE440 by the engine's own kernel reader (planetary_kernel_path; lunar_llr::llr_geometry_with, ephem_provider::KernelEphemeris). Only the Moon centre differs from the analytic row; the IAU 2015 orientation, the absent polar motion and UT1, the catalogues, selection rules, weights and linear algebra are the same. The validated claim is only that this path's datum covariance agrees with an independent SPICE and NumPy oracle on fresh, unseen normal points. The comparison does not discriminate Moon models and does not check the Moon centre: on the same slice the analytic Moon also passes every bar, the pre-registered mutation (the kernel Moon read one hour late) was not detected, and a Moon centre about 4,650 km wrong also passes (see the oracle text). It is not evidence that the kernel Moon improves the datum. Runnable as the `lunar-llr-datum` scenario with planetary_kernel_path (and normal_points_dir for another slice)",
            module: "lunar_llr (llr_geometry_with, LunarLlrDatumScenario); ephem_provider (KernelEphemeris); naif_kernel",
            tests: "tests/validate_llr_datum_kernel_moon_fresh.rs::llr_datum_kernel_moon_matches_spice_and_numpy_on_fresh_normal_points (447 unseen 2019-Q2 normal points; sigmas and norms within 4.0e-5 of 1e-2, condition 1.6e-5 of 2e-2, ratios 7.6e-5 of 2e-2, bookkeeping and ranks exact); tests/validate_llr_datum_kernel_moon.rs (the 2015 seen-data diagnostic, 0.049 % on tz; not evidence for this row); lunar_llr::tests",
            oracle: "NAIF SPICE Toolkit N0067 (spiceypy 8.2.0, MIT) two-way light times on DE440, ITRF93 Earth orientation and the DE440 lunar orientation (MOON_ME) with 100 m finite-difference partials, and numpy 2.3.5 (BSD-3-Clause, LAPACK) information matrix and inverse: the unchanged generator of the analytic row's comparison (6b27964a), run on a fresh slice (EDC CRD normal points, 2019-04..06) pre-registered in 830d945a before any of it was fetched, at the analytic row's bars (1 % sigmas and norms, 2 % condition and ratios, exact bookkeeping, ranks and coupling) and its oracle self-check (SPICE O-C 10.86 m < 100 m). Every quantity holds, worst 7.6e-5. Mutations: the planned one-hour Moon delay is NOT detected (the covariance depends on the spread of the lines of sight, not their timing); a structural mutation chosen afterwards and disclosed as such, dropping the down-leg partial, fails every sigma. Finding: on this slice the analytic Moon passes too (worst 3.8e-3), so the bar does not discriminate Moon models and this validates the covariance on fresh data, not a kernel-Moon improvement. Integrator check at the fold (not pre-registered): the kernel Moon read relative to the Earth-Moon barycentre instead of the Earth (residual RMS 4,649 km) and the kernel epoch without TT minus UTC (69 s; residual 2.6 km) both still pass every bar, while dropping sqrt(n_raw) from the measured weights fails all 16 banded quantities; the comparison is sensitive to the weights, partials and linear algebra, not to the Moon centre. Both sides read DE440: this validates the computation on DE440, not DE440. Outside the claim: an LLR accuracy (a Cramér-Rao bound for a reduced parameter set)",
            oracle_kind: ExternalDataset,
            status: Validated,
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
        // ── CTI P1: Composed-timing integrity rows ────────────────────────────
        VerificationItem {
            requirement: "Composed timing PL — scalar MHSS specialization (H=1_N)",
            capability: "Scalar-time solution-separation TPL over heterogeneous sources; PL driven by worst-exclusion subset noise + UTC(k) bias",
            module: "src/integrity/tpl_scalar.rs",
            tests: "integrity::tpl_scalar::tests (rank-1, fuse/exclude, bias-dominance, IR cross-check); tests/tpl_scalar_numpy_oracle.rs::scalar_mhss_pl_matches_numpy (300 committed cases: numpy lstsq subset estimators, general separation covariance, scipy brentq PL; PL within 1e-9 relative, worst 1.2e-10; driving subset exact)",
            oracle: "P2: numpy 2.3.5 linalg.lstsq and scipy 1.18.1 (norm.isf, norm.sf, brentq) recompute, by their own algorithms, the subset weighted least-squares estimators, the general separation covariance sqrt(Δ Σ Δᵀ), the biases and the protection level from them on 300 committed inputs (tests/fixtures/tpl_scalar_numpy_oracle); the PL agrees within 1e-9 relative (worst 1.2e-10) and the driving exclusion subset is identical, tolerance fixed before the comparison. The multipliers, priors and bias overbounds are inputs, and the structure of the PL equation (mode list, ir/2 split, bias projection) is a stated input, as for the Lunar ARAIM protection-level kernel row; the validated claim is the linear algebra and the PL on those inputs, not the physical magnitudes of a timing scenario. ARAIM lineage Blanch 2015 / Joerger 2014",
            oracle_kind: ExternalDataset,
            status: Validated,
        },
        VerificationItem {
            requirement: "Composed timing PL — P0-seeded holdover ride-through",
            capability: "PL(τ)=max(TPL_handover,HPL(τ)); lower-semicontinuous PL(0+)≥PL(0−); K(IR/2) running-max; τ/τ³/τ⁵ phase exponents",
            module: "src/integrity/composed_pl.rs",
            tests: "integrity::composed_pl::tests (monotone, P0-floor, K(IR/2), exponents, lower-semicontinuity)",
            oracle: "Property tests (monotonicity, no-drop-at-handover) + exponent lint against holdover::coast_phase_variance",
            oracle_kind: InternalConsistency,
            status: Modelled,
        },
        VerificationItem {
            requirement: "Composed timing PL — holdover envelope coverage, multi-year regime (tau>=90d)",
            capability: "Running-max envelope overbound-covers (zero-piercing) a real metrological series at every tested lag tau>=90d on a disjoint segment; short-tau (<=30d) is a disclosed Modelled boundary",
            module: "src/integrity/composed_pl.rs",
            tests: "tests/cti_holdover_coverage_reference.rs",
            oracle: "BIPM Circular-T [UTC-UTC(USNO)] 5-day series MJD 56074-60429 (872 pts, webtai API); disjoint fit/test, multi-year zero-piercing coverage",
            oracle_kind: ExternalDataset,
            status: Validated,
        },
        VerificationItem {
            requirement: "Composed timing PL — LIL a.s. envelope (impossibility + consistency)",
            capability: "No finite worst-case holdover (Brownian sup diverges); IR-allocated HPL consistent with Hartman-Wintner envelope as IR→0",
            module: "src/integrity/lil_envelope.rs",
            tests: "integrity::lil_envelope::tests (divergence, threshold, IR-tightening dominance)",
            oracle: "Closed-form a.s. envelope √(2Dt·lnln t) identity + HPL-dominance check; Baweja arXiv:2606.24210 impossibility seam",
            oracle_kind: InternalConsistency,
            status: Modelled,
        },
        VerificationItem {
            requirement: "Heterogeneous UTC(k) traceability-bias integrity overbound",
            capability: "Per-source bias overbound b = (U/k_cov)·Phi^-1(1-tail/2) + ageing, inflating a published Type-B expanded uncertainty to an allocated integrity tail; bridges to tpl_scalar as bias_s",
            module: "src/integrity/hetero_budget.rs",
            tests: "integrity::hetero_budget::tests + tests/hetero_budget_reference.rs; tests/hetero_budget_utc_k_oracle.rs::overbound_exceedance_on_real_utc_k_finding (data-gated: skips with a message when the BIPM series is absent); tests/hetero_budget_utc_k_realised_overbound_oracle.rs::realised_offset_overbound_finding; tests/utck_bound_prospective_oracle.rs (D9 round 3, prospective, not yet run)",
            oracle: "Independent numpy + stdlib-statistics reproduction of the overbound closed form (InternalConsistency). The BIPM Circular-T [UTC-UTC(USNO)] series is a CITED input only — it is the SAME series already Validated for the R4 holdover-coverage row and is NOT re-validated here; reproducing its values proves nothing about R2. Deep integrity tail is Modelled. 0.30 external comparison, a finding (stays MODELLED): on the BIPM per-laboratory UTC-UTC(k) files (102 laboratories, 105 024 rows with published uncertainties) the overbound b = 2.576 u at the 1e-2 tail is exceeded by 50.8 % of rows (Clopper-Pearson 95 %: 50.4 to 51.1 %) and by more than 1 % at 101 of 102 laboratories. The published u is the uncertainty of the BIPM's determination of UTC-UTC(k), not a bound on the offset, which routinely runs to many times u; the overbound as specified does not bound real UTC(k) traceability bias. 0.30 round 2, an overbound of the realised UTC-UTC(k) offsets trained on 2015-2022 and tested on 2023-2026 BIPM Circular T data (pre-registered ca0921a4, pooled exceedance at most 1e-2), a finding (stays MODELLED): the pooled exceedance is 0.0333 (694 of 20 826 rows over 82 laboratories; 0.0127 without the 430 rows that have no bound by rule). D9 round 3, a pooled hierarchical ageing bound (utck_bound), pre-registered fb475550 and scored prospectively on Circular T issues from 465: not yet run (awaiting issues)",
            oracle_kind: InternalConsistency,
            status: Modelled,
        },
        VerificationItem {
            requirement: "Correlated traceability-bias cross-covariance (common-mode-unsafe allocation)",
            capability: "N×N bias cross-covariance with rho·b_i·b_j off-diagonals for sources sharing a UTC(k) realizer; PROVEN correlated_fused_bias >= independent_fused_bias (naive independent allocation under-bounds the fused bias -> optimistic -> unsafe)",
            module: "src/integrity/hetero_budget.rs",
            tests: "integrity::hetero_budget::tests (correlated_fused_bias_dominates_independent_when_correlated, rho_one_single_realizer_recovers_linear_sum) + tests/hetero_budget_reference.rs",
            oracle: "Independent numpy reproduction of the cross-covariance and the correlated-vs-independent fused bias inequality (InternalConsistency). Representative source set; Modelled scenario.",
            oracle_kind: InternalConsistency,
            status: Modelled,
        },
        VerificationItem {
            requirement: "GLS common-mode whitening (Aitken) + Mahalanobis identity",
            capability: "Hand-rolled Cholesky Omega=LL^T and forward-substitution whitening z=L^-1 r (Cov(z)=I when Cov(r)=Omega); Mahalanobis square z^T z = r^T Omega^-1 r",
            module: "src/integrity/gls_commonmode.rs",
            tests: "integrity::gls_commonmode::tests + tests/gls_reference.rs + tests/gls_whitening_numpy_oracle.rs::whitening_and_mahalanobis_match_numpy_lapack (201 committed SPD cases: factor, whitened residual, whitening operator and Mahalanobis square against numpy LAPACK within 1e-12 relative, worst 7.9e-16)",
            oracle: "P2: numpy 2.3.5 linalg.cholesky (LAPACK potrf), solve (gesv) and inv on 201 committed SPD inputs (tests/fixtures/gls_whitening_numpy_oracle) check the hand-rolled factor, the whitened residual and the whitening operator; the Mahalanobis square is checked against solve(Omega, r), which uses no Cholesky, so the identity z^T z = r^T Omega^-1 r is confirmed by a separate route. All within 1e-12 relative (worst 7.9e-16), tolerance fixed before the comparison. The largest condition number is 19.3, so ill-conditioned matrices are not covered. GLS/Aitken 1935 whitening is Cited.",
            oracle_kind: ExternalDataset,
            status: Validated,
        },
        VerificationItem {
            requirement: "Common-mode consistency statistic (separation-blind shared-reference fault)",
            capability: "Score statistic (1^T Omega^-1 r)^2/(1^T Omega^-1 1) ~ chi^2_1 for a common-mode shift that solution separation (contrasts orthogonal to 1) cannot see; a common-mode shift inflates it while pairwise separations stay flat",
            module: "src/integrity/gls_commonmode.rs",
            tests: "integrity::gls_commonmode::tests (common_mode_shift_inflates_statistic_but_not_contrasts, post_fit_common_mode_statistic_is_zero) + tests/gls_reference.rs; tests/gls_common_mode_statistic_numpy_oracle.rs::common_mode_statistic_matches_numpy_lapack",
            oracle: "Independent numpy reproduction of the statistic + property test that a common-mode injection inflates it (InternalConsistency). Modelled scenario. 0.30 round 2 (pre-registered f9aa360d), blocked (stays MODELLED): numpy 2.3.5 LAPACK gesv reproduces the statistic value on 261 committed cases (within 3.5e-15 well-conditioned, 1.2e-9 at condition up to 6.1e7); the chi-square(1) null law is a cited theorem and the flat pairwise separations an identity with no engine output to compare, so the scoping awaits an owner decision",
            oracle_kind: InternalConsistency,
            status: Modelled,
        },
        VerificationItem {
            requirement: "Residual-outside-Omega undetectable common-mode bound",
            capability: "Undetectable common-mode ceiling: the largest fault magnitude along a direction d that escapes BOTH separation (alpha_ss = T_ss / whitened contrast norm of d) and the common-mode statistic (alpha_cm = sqrt(T_cm 1^T Omega^-1 1) / |1^T Omega^-1 d|), reported as min(alpha_ss, alpha_cm). Under a positive-definite Omega the two blind directions (d proportional to 1, and 1^T Omega^-1 d = 0) are mutually exclusive, so the ceiling is FINITE for every nonzero d; it is infinite only for a zero direction or a non-positive-definite Omega. A direction outside the modelled common axis is blind to the common-mode statistic only and is bounded by separation",
            module: "src/integrity/gls_commonmode.rs",
            tests: "integrity::gls_commonmode::tests (separation_alone_is_blind_to_common_mode, degenerate_direction_or_non_pd_gives_no_finite_ceiling, every_nonzero_direction_under_pd_omega_has_a_finite_ceiling); tests/gls_outside_omega_bound_numpy_oracle.rs::undetectable_common_mode_ceiling_matches_numpy_lapack (256 committed cases: alpha_ss, alpha_cm and the minimum within 1e-12 relative on 210 well-conditioned and boundary cases, worst 3.3e-15; 40 ill-conditioned up to condition 1.3e8 within a stated condition-scaled bound, worst 1.1e-9; six exact infinities)",
            oracle: "P2: numpy 2.3.5 linalg.solve (LAPACK gesv, LU with no Cholesky) recomputes alpha_ss (the threshold over the whitened contrast norm of d after removing its GLS common-mode coefficient), alpha_cm and their minimum on 256 committed (Omega, d, T_ss, T_cm) inputs (tests/fixtures/gls_outside_omega_bound_numpy_oracle), including pure common-mode directions, directions outside the modelled common axis, and the zero-direction and non-positive-definite cases that must give +inf; pre-registered (d070699a; amendment 8a44267b, before any comparison, restating the matrix form); tolerances fixed before the comparison. The capability text was corrected by owner decision (2026-10-02): it had said the bound is infinite for a direction outside the common axis, which contradicted the code and this comparison. That the idealised single-contrast detector lower-bounds a real subset detector undetectable magnitude stays Modelled",
            oracle_kind: ExternalDataset,
            status: Validated,
        },
        VerificationItem {
            requirement: "Lunar datum identifiability - decomposition linear algebra",
            capability: "Schur-complement marginal of the {lunocenter-X, scale} block of the 7-parameter Helmert datum Fisher: the scalar degeneracy metric lambda_min(S), the origin-X CRLB, and the origin-scale correlation",
            module: "lunar_identifiability",
            tests: "tests/lunar_datum_identifiability_reference.rs::decompose_matches_scipy_reference (16 synthetic 7x7 SPD matrices spanning well-conditioned to {0,3}-near-degenerate; Schur lambda_min / origin CRLB / |corr| vs SciPy/NumPy to <1e-9 rel)",
            oracle: "Independent SciPy/NumPy reference (scripts/gen_datum_identifiability_ref.py -> tests/fixtures/datum_identifiability/scipy_ref.csv): the Schur complement, its eigenvalues, and the 2x2 inverse computed by an independent library. Scoped to the decomposition LINEAR ALGEBRA; the lunar correlation/CRLB MAGNITUDES from real geometry remain MODELLED.",
            oracle_kind: ExternalDataset,
            status: Validated,
        },
        VerificationItem {
            requirement: "Lunar datum null-space classification (LLR rank-additivity + libration defect-lift)",
            capability: "Classification of the internal-ranging datum problem: a single range observation contributes rank 1 (6-dimensional null space); the origin-X and scale pair is near-null and physical DE440 libration lifts the defect to zero while the pair stays near-degenerate",
            module: "lunar_identifiability, lunar_datum",
            tests: "tests/lunar_datum_identifiability_reference.rs (single_internal_range_row_has_six_dim_datum_null_space; extending_the_librating_arc_lifts_the_origin_scale_degeneracy); tests/lunar_datum_sosnica_oracle.rs::origin_scale_correlation_and_crlb_disagree_with_the_published_geometry",
            oracle: "Engine-reproduced geometric structure plus the closed-form 2x2 Schur identity; consistent in STRUCTURE with Sosnica et al. 2025 (arXiv:2510.15484), whose reported magnitudes are NOT reproduced here. The classification is structural; the correlation/CRLB magnitudes under real geometry are MODELLED (reflector coordinates and orientation held fixed). 0.30 external comparison, a finding (stays MODELLED): against Sosnica et al. 2025, the range-Fisher origin-scale correlation (-0.993 / -0.988) is within 0.05 of the published -0.97, but on the paper's own five-reflector geometry the equal-weight 7-parameter Helmert correlation is -0.78 (the published value rests on per-reflector errors the paper does not print), and the origin CRLB (0.6 to 1.2 mm at 3 mm range noise) is 96 to 98 % below the paper's 3.07 cm against a 20 % tolerance. Magnitudes not reproduced",
            oracle_kind: InternalConsistency,
            status: Modelled,
        },
        VerificationItem {
            requirement: "Multi-technique lunar datum information (LLR + lunar VLBI + orbiter range)",
            capability: "Datum-Jacobian rows for Earth-reflector LLR range, two-station lunar-VLBI differential delay, and orbiter-to-beacon range over the 7-parameter datum, combined into one consistently-preconditioned Fisher; demonstrates that off-radial (orbiter / depth-diverse) tracking breaks the origin-X to scale degeneracy where transverse VLBI helps only indirectly",
            module: "lunar_datum, lunar_identifiability",
            tests: "lunar_datum::tests (LLR/VLBI/orbiter analytic partials vs finite difference); lunar_identifiability::tests (adding_an_offradial_technique_collapses_the_origin_scale_degeneracy; transverse-vs-radial via crlb_diag)",
            oracle: "Analytic-vs-finite-difference cross-checks of each technique's partials (internal); the improvement DIRECTION is a geometric fact. Beacon locations, schedules and noise are MODELLED/representative (see tests/fixtures/llr_geometry/NOTICE.md).",
            oracle_kind: InternalConsistency,
            status: Modelled,
        },
        VerificationItem {
            requirement: "DE440 lunar principal-axis orientation provider",
            capability: "MOON_PA_DE440 to J2000 rotation at arbitrary epochs inside 2014-01-01 to 2030-12-31 TDB, by geodesic interpolation R0·Exp(f·Log(R0ᵀR1)) between the nodes of a committed 6 209-row daily series (the try_ functions return OrientationSpanError outside it, the infallible ones panic; it never clamps); embedded at compile time so there is no runtime filesystem I/O and the WASM build carries it",
            module: "lunar_orientation",
            tests: "lunar_orientation::tests (de440_moon_pa_reproduces_fixture_rows, de440_moon_pa_shows_real_libration); tests/lunar_pa_frame_realisation_guard.rs::the_orientation_series_interpolation_error_is_tens_of_metres_not_sub_metre; tests/lunar_pa_orientation_spice_oracle.rs::interpolated_rotation_matches_direct_kernel_evaluation_off_node (2 000 random off-node epochs vs SPICE pxform on the binary PCK: rotation angle within 1.7e-5 rad, worst 1.7e-6 rad, 3 m at the mean radius)",
            oracle: "NAIF SPICE Toolkit (CSPICE N0067 through spiceypy 8.2.0, run as a tool): pxform from MOON_PA_DE440 to J2000 evaluating JPL's binary PCK moon_pa_de440_200625.bpc directly, with NAIF's own frame kernel moon_de440_250416.tf, at 2 000 random off-node epochs in the embedded window. The rotation angle between Kshana's and SPICE's matrices is within 1.7e-5 rad (30 m at the 1737.4 km mean radius, fixed before the comparison); measured worst 1.7e-6 rad (3 m), RMS 7.8e-7 rad, and worst 1.75e-6 rad on 6 000 further epochs drawn by the verifier. The daily nodes were themselves extracted from the same kernel (scripts/gen_de440_moon_pa.py, fixture SHA-256 3076f81ef95d83f5efa240ed4c7ccb422f109407dde841fcf28d42dc63586eb7), so this comparison tests the interpolation between them, which is the claim. Found by this comparison and fixed: the earlier element-wise linear interpolation with Gram-Schmidt kept the axis but not the angle of the 13.2 deg/day rotation and was in error by up to 2.0e-4 rad (340 m) near the quarter points; the earlier figure of about 14 m came from a guard that samples interval midpoints only. The series covers 2014-01-01 to 2030-12-31 and errors outside it (round 2); its 2024-2025 nodes regenerate from the same kernel to 4.3e-13. The SPICE off-node comparison above covers 2024-2025 only, which is the validated window; the extended nodes come from the same kernel and script but are not compared off-node. A geometry substrate for identifiability analysis, not a sub-metre orientation product",
            oracle_kind: ExternalDataset,
            status: Validated,
        },
        VerificationItem {
            requirement: "Lunar LLR datum geometry substrate (principal-axis reflectors, ground stations, analytic range partials)",
            capability: "The five near-side retroreflector arrays in PA body-frame metres and the LLR ground stations in geodetic coordinates; reflector body-to-inertial placement through the DE440 PA orientation; analytic partials of Earth-to-reflector range with respect to the 4-parameter datum; and the LLR-only Fisher matrix exhibiting the lunocentre-X to scale degeneracy that motivates the 7-parameter analysis",
            module: "lunar_llr_geometry",
            tests: "lunar_llr_geometry::tests (reflector_and_station_catalogs_are_well_formed, analytic_partials_match_finite_difference, llr_one_way_range_is_earth_moon_scale, zero_datum_reproduces_nominal_range, llr_only_fisher_shows_strong_com_x_scale_degeneracy); tests/lunar_pa_frame_realisation_guard.rs; tests/llr_datum_degeneracy_reference.rs; tests/lunar_llr_geometry_range_oracle.rs::reflector_ranges_against_ilrs_normal_points",
            oracle: "The computation is checked internally: every analytic partial against a finite difference, and the zero-datum case against the nominal range. The CATALOGUE is checked externally and independently - the DE440 principal-axis coordinates (Park et al. 2021, tests/fixtures/llr_geometry/de440_retroreflectors_pa.csv) are cross-checked against Table 6 of the DE430 surface-coordinates memorandum (tests/fixtures/lunar_llr/de430_retroreflectors_pa.csv, machine-extracted from a SHA-256-verified PDF by tests/fixtures/lunar_llr/generate_de430_retroreflectors_pa.py) and agree to 1.12 m, while the mean-Earth realisation of the same five arrays differs by 672 to 871 m. The DEGENERACY STRUCTURE is checked against a published result: Sosnica et al. 2025, 'Definition and Realization of the International Lunar Reference Frame', arXiv:2510.15484, which reports for the lunar principal-axis frame a lunocentre-X to scale correlation coefficient of r = -0.97, and that LLR fails to reach the actual centre of mass of the Moon with an accuracy better than 12 cm because of that correlation. This module recovers the same structure (|corr(t_x, scale)| between 0.9 and 0.9999, datum defect <= 1) from an LLR-only Fisher design. The corroboration is across ephemerides, not a round trip: the paper combines INPOP21a, DE430 and EPM2021, whereas this module is driven by DE440 libration. What is NOT reproduced is magnitude - the correlation here is about -0.988 against their -0.97, and the 4-parameter CRLB is sub-millimetre against their 12 cm achieved floor, because orientation and reflector coordinates are held fixed here and solved there. Geometry and degeneracy structure only; no accuracy claim about a solved datum. 0.30 external comparison: the measured-range parts of this module (reflectors(), stations_itrf(), the DE440 PA placement and the barycentric light time llr_bcrs_one_way_m) are validated in their own row, LLR measured-range model, against 192 ILRS normal points (RMS 2.81 m against 10 m). This row stays MODELLED because the measured comparison does not exercise the rest of its claim. The geodetic station catalogue stations() rounds APOLLO to 0.001 deg; with a geocentric light time it gives 22.7 m on the same points (test reflector_ranges_against_ilrs_normal_points; 96 m with the earlier element-wise orientation interpolation). The analytic range partials and the LLR-only Fisher are computed through llr_range_m and reflector_inertial with the analytic Moon series (ephem::moon_position, about 0.3 deg from the GCRS) and no light time",
            oracle_kind: ExternalDataset,
            status: Modelled,
        },
        VerificationItem {
            requirement: "LLR measured-range model (reflector catalogue, ITRF2020 stations, DE440 principal-axis placement, IERS 2010 barycentric light time)",
            capability: "The one-way Earth-station to reflector range of a lunar laser-ranging normal point: the five near-side retroreflector arrays in DE440 principal-axis (PA) body-frame metres (lunar_llr_geometry::reflectors); the stations of stations_itrf(), namely Grasse 7845 and Matera 7941 from ITRF2020 at epoch 2015.0 with their velocities, placed in the Geocentric Celestial Reference System (GCRS) by the IERS 2010 transform with Bulletin A polar motion (lunar_vlbi::station_inertial_position_itrs), and APOLLO 7045 at its operator-published approximate geocentric position (no velocity); the reflector body-to-inertial placement through the DE440 PA orientation (lunar_orientation::try_de440_moon_pa_body_to_inertial, which errors outside 2014-2030); and the IERS Conventions 2010 Section 11.2 barycentric light time (lunar_llr_geometry::llr_bcrs_one_way_m: the Eq. 11.19 body-to-BCRS transformation of station and reflector, and the Eq. 11.17 Shapiro delay from the Sun, the Earth and the Moon). INPUTS, not part of the claim: the barycentric Earth, Moon and Sun states and potentials (DE440 through SPICE), IERS UT1-UTC and polar motion, and the measured round trip converted from TT to TDB. HARNESS-SIDE, not part of the claim: the Mendes-Pavlis zenith delay with FCULa mapping, in the test, with elevation from the geodetic stations() catalogue. Not modelled: tides, station eccentricities, reflector thermal terms",
            module: "lunar_llr_geometry (reflectors, stations_itrf, ItrfStation, StationCoordinates, llr_bcrs_one_way_m, body_to_bcrs_tdb, shapiro_leg_m, BcrsEvent); lunar_orientation (try_de440_moon_pa_body_to_inertial); lunar_vlbi (station_inertial_position_itrs)",
            tests: "tests/lunar_llr_geometry_range_oracle.rs::reflector_ranges_bcrs_iers2010_relativistic (192 ILRS normal points: RMS 2.81 m; the two ITRF2020 stations alone 2.96 m; both at most 10 m); tests/lunar_llr_geometry_range_oracle.rs::round2_finding_is_a_common_offset_of_about_eleven_metres (the superseded geocentric light-time model, 10.94 m, pinned)",
            oracle: "Measured: 192 ILRS CRD v2 lunar normal points (EUROLAS Data Center, DGFI-TUM, 2024-04 to 2024-06; Grasse 151, APOLLO 32, Matera 9; committed verbatim with SHA256SUMS). The predicted one-way range is compared with c times half the measured round trip in TDB. Bar fixed before the comparison: RMS at most 10 m over all 192 points AND over the 160 points of the two ITRF2020 stations alone. The bar is from the third pre-registration amendment 3e0f5cdf, committed before the engine change and the run; the 10 m figure is unchanged since round 1. Measured: 2.81 m (mean 2.67 m) on all points; 2.96 m on the ITRF2020 stations; APOLLO 1.94 m; 2015 slice (349 points, secondary) 3.82 m. Mutation: zeroing the Sun Shapiro legs gives 10.19 m, which fails. History, disclosed: 96 m with element-wise orientation interpolation; 22.7 m after geodesic interpolation with the geodetic catalogue; 10.94 m with ITRF2020 stations and polar motion but a geocentric light time (a common +10.9 m offset). The barycentric model was written after that offset was seen. It is the published IERS 2010 Section 11.2 model with no free parameter. The third amendment replaced a self-imposed all-ITRF2020/SLRF2020 condition after the BLOCKED result. The ITRF2020-only RMS passes without APOLLO, which has no ITRF2020 or SLRF2020 solution, and its position is the operator stated-approximate one. A common +2.7 m remains, below the bar and not tuned. The bar is loose relative to the result: a missing 7.6 m solar term still gives 10.19 m. Terms below the bar are not resolved one by one: with polar motion zeroed the RMS is 6.15 m (ITRF2020 stations 5.98 m), and with the Eq. 11.19 transformation removed it is 2.96 m; both would still pass. Station velocities and the Earth and Moon Shapiro terms are smaller still. The comparison validates the assembled one-way range at 10 m RMS and the solar Shapiro term, not each listed component",
            oracle_kind: ExternalDataset,
            status: Validated,
        },
        VerificationItem {
            requirement: "Coupled lunar frame and timescale gauge: the joint spatial-datum, clock-offset and clock-rate null space",
            capability: "assemble_coupled_info builds the 9-parameter coupled Fisher over [t_x, t_y, t_z, s, theta_x, theta_y, theta_z, d_tau, d_alpha]; classify_null_space returns a basis-invariant decomposition of its null space into spatial-only, temporal-only and genuinely coupled dimensions plus the spatial-to-temporal projector coupling norm; coupled_marginal_eigs gives the {scale, offset} Schur-complement marginal. On the committed networks the engine reports a full-rank datum (defect 0) for the well-posed case and an exact single rate-direction defect for the single-epoch case (elapsed time zero, so the rate is unobservable by construction), and computes the {s, d_tau} marginal in both.",
            module: "lunar_gauge",
            tests: "tests/lunar_coupled_gauge_reference.rs::coupled_gauge_matches_numpy_on_real_de440_rows (9 eigenvalues, defect/dim_spatial/dim_temporal/coupled_dim/p_st_norm and the {scale,offset} Schur marginal for the well_posed 120-row and single_epoch 30-row networks, to rel<1e-3 and abs<1e-3); lunar_gauge::tests (coupled_marginal_fisher_is_symmetric_and_psd, oneway_spatial_equals_orbiter_range_row_datum7, twoway_spatial_equals_oneway_spatial_at_same_geometry)",
            oracle: "WHAT IS EXTERNALLY CHECKED, stated narrowly: kshana computes the eigendecomposition with its own hand-written Jacobi solver (fim::sym_eig) and the marginal with its own pseudo-inverse; the oracle recomputes both with numpy/LAPACK (np.linalg.eigvalsh/eigh/pinv) via scripts/gen_coupled_gauge_ref.py. Agreement to rel<1e-3 is therefore an independent-library check of THIS CRATE ARITHMETIC against a standard implementation, which is the Validated claim and the whole of it. WHAT IS NOT: the assembly and the null-space classification are this module's own rules, and the oracle reproduces them from the same specification rather than from an independent source - that corroborates the implementation, not the rule. The beacon and orbiter geometry is Modelled and representative. The observation rows do carry the real DE440 Moon PA orientation (lunar_datum::orbiter_range_row_datum7 -> lunar_orientation::de440_moon_pa_body_to_inertial), but that is an INPUT both sides receive, not evidence about the answer, and it is recorded here as provenance rather than as the warrant for the status - the same distinction main already draws in the common-mode integrity row. Every row float is rounded to 6 dp before network.json is written, so both sides read identical IEEE-754 doubles and the only difference left is the solver.",
            oracle_kind: ExternalDataset,
            status: Validated,
        },
        VerificationItem {
            requirement: "Range to clock-offset degeneracy in one-way lunar ranging, and the geometric-diversity design law",
            capability: "The per-node radial-range to receiver-clock-offset degeneracy is exact at 1 m to 3.336 ns (one over c). The {scale, offset} Schur-complement marginal (coupled_marginal_fisher) shows that in a geometrically diverse network two-way ranging lifts the marginal by about the same factor as an equal count of additional one-way data, while in the idealised single-node regime the two-way lift is orders of magnitude larger. The design law that follows: geometric diversity, not two-way ranging as such, is what separates lunar frame scale from timescale offset in one-way ranging; a two-way or external time tie is required only in the low-diversity or single-user regime.",
            module: "lunar_gauge",
            tests: "lunar_gauge::tests (coupled_marginal_well_posed_network_is_psd, coupled_marginal_twoway_equals_more_oneway_in_diverse_network, coupled_marginal_twoway_lift_three_orders, oneway_range_row_has_correct_temporal_entries, twoway_range_row_has_zero_at_offset_and_rate, time_tie_row_equals_pure_offset_vector, rate_tie_row_has_correct_structure)",
            oracle: "Schur-complement marginal Fisher of the coupled information matrix, in closed-form linear algebra, checked against the two limiting regimes it predicts. The 1 m to 3.336 ns equivalence is the definition of the metre via c and is not an empirical result. The observation networks are representative Modelled geometry, so the design law is a statement about the geometry presented to it and carries no claim about any fielded lunar network.",
            oracle_kind: InternalConsistency,
            status: Modelled,
        },
        VerificationItem {
            requirement: "Relativistic clock-rate to frame coupling for the lunar timescale",
            capability: "rate_frame_jacobian(_with) gives the sensitivity of the lunar timescale rate to the frame realisation, from the equatorial effective potential truncated at degree 2 (GM, equatorial radius, J2, rotation; LunarSurfacePotential): d_alpha/d_scale = L_m, about +3.1388e-11; d_alpha/d_velocity = -|v_moon|/c^2, about -1.11e-14 (time-dependent); d_alpha/d_r_radial = g_eff/c^2, about +1.806e-17 per metre. For a 1 m radial datum shift this is a rate perturbation of about 1.8e-17 (an arithmetic consequence of the radial entry), far below the roughly 1.7e-11 rate offset of a lunar timescale against TT",
            module: "lunar_gauge, lunar_time",
            tests: "tests/lunar_rate_frame_coupling_preregistered.rs (entry1_d_alpha_d_scale_matches_the_published_l_m_for_both_cited_fields: L_m within 2.8e-6 of Ashby and Patla 2024 with J2 from AIUB-GRL350A/B; entry2_d_alpha_d_radial_matches_the_degree_350_equatorial_gravity_for_both_fields: the radial entry within 8.3e-5 of pyshtools degree-350 equatorial gravity; entry3_d_alpha_d_velocity_matches_the_de441_lunar_speed: the velocity entry within 2.5e-3 of the DE441 lunar speed at 2000 epochs); lunar_gauge::tests; regression tests/lunar_rate_frame_coupling_oracle.rs",
            oracle: "Pre-registered (5590ab21): L_m against Ashby and Patla 2024 (AJ 167:149) Eq. (10), 3.13881(15)e-11, from the paper GM, a_m, omega_m and the J2 of the two degree-350 fields the paper cites (Bertone et al. 2021, AIUB-GRL350A/B), within 1e-4; the radial entry against pyshtools 4.14.1 (BSD-3) equatorial gravity of the same fields within 1e-4 (measured 8.3e-5 and 6.7e-5, a narrow margin); the velocity entry against JPL Horizons DE441 lunar speed within 4.5e-3. A degree-2 closed form of a degree-350 published value (residual degree 3-350; Reference, not P1). Disclosed: the entry-1 outcome was known before the pre-registration, and the shipped default radius 1738.14 km is the paper surface definition, adopted after round 1. The tidal contributions and the comparison band remain Modelled reference-surface figures",
            oracle_kind: ExternalDataset,
            status: Validated,
        },
        VerificationItem {
            requirement: "Basis-invariant classification of the coupled frame and timescale null space",
            capability: "classify_null_space decomposes the datum null space into spatial-only (dimension d minus rank U_T), temporal-only (d minus rank U_S) and genuinely coupled (rank U_S plus rank U_T minus d) parts, plus the spatial-to-temporal projector coupling norm p_st_norm, the Frobenius norm of the off-diagonal block of the null-space projector. Every one of these is a function of the PROJECTOR rather than of a chosen basis, so they are invariant under any orthonormal choice of null vectors - which is what makes the classification reportable at all.",
            module: "lunar_gauge",
            tests: "lunar_gauge::tests (classify_is_invariant_under_null_basis_rotation - an axis-aligned null basis and its 0.6 rad rotation yield identical defect, dim_spatial, dim_temporal, coupled_dim and p_st_norm; classify_direct_sum_null and classify_coupled_null - constructed direct-sum and genuinely coupled cases confirm the dimension decomposition; classify_basis_invariant; index_consts_are_correct); tests/lunar_gauge_classification_scipy_oracle.rs::classify_null_space_matches_scipy_subspace_intersection (72 constructed 9x9 Fisher matrices over 18 null subspaces, each in four random orthonormal re-bases: defect, dim_spatial, dim_temporal and coupled_dim exact; p_st_norm within 6.0e-15, bar 1e-9)",
            oracle: "SciPy/NumPy (BSD-3-Clause; scipy.linalg.null_space and numpy.linalg.svd, LAPACK gesdd) classify the same committed matrices by subspace intersection, dim null([F; E_T]) and dim null([F; E_S]), and the SVD null-space projector, which differs from Kshana Jacobi eigenvectors and Gram-rank formulas; pre-registered (d429993c): integers exact, p_st_norm to 1e-9 (P2, an independent numerical library), with the rank threshold fixed in advance and a spectral gap of at least 1e6 asserted. The row claim is the classification of a stated matrix, so P2 covers it in full. The constructed cases include direct-sum, coupled and mixed null spaces and random re-bases; the real-network dimensions of the coupled-gauge row are not re-counted here. The in-crate invariance test (a rotated null basis gives identical results) is kept",
            oracle_kind: ExternalDataset,
            status: Validated,
        },
        VerificationItem {
            requirement: "Representative multi-technique measurement menu and the additive Fisher combination rule",
            capability: "MeasurementBlock holds one candidate measurement campaign as a 7x7 Fisher information contribution plus a scalar relative cost; block_from_rows builds one from raw datum-Jacobian rows so every block is preconditioned identically through lunar_identifiability::assemble_multi_info; combine sums the information of a chosen subset, which is the correct rule because Fisher information is additive across independent measurements; representative_lunar_menu supplies a deterministic four-block menu (LLR, a transverse VLBI limb beacon, a near-side orbiter and a far-side orbiter). The budget-constrained design optimiser that consumes this menu is not part of this crate.",
            module: "lunar_techniques",
            tests: "lunar_techniques::tests (combine_is_additive_order_independent_and_empty_is_zero - empty selection gives the zero matrix, a single selection is the identity, a pair equals an independently written element-wise sum, and the result is invariant under selection order; adding_a_block_never_reduces_the_degeneracy_metric - monotonicity under added information; radial_diversity_beats_transverse_for_breaking_the_degeneracy - the far-side orbiter block raises the degeneracy metric more than the transverse VLBI block)",
            oracle: "Additivity of Fisher information across independent measurements is a closed-form property, checked here against an independently written element-wise sum and against the order-invariance and monotonicity that follow from it. NOTE ON EVIDENCE: the combiner previously had no test at all, and the one test in the module summed the two information matrices inline instead of calling it, so a broken combiner would have left the module green; the test now goes through combine and fails when it is mutated. All beacon locations, orbiter geometry, per-technique precisions and relative costs are representative choices rather than mission values (see tests/fixtures/llr_geometry/NOTICE.md), so every degeneracy metric and CRLB figure reached through this menu inherits the Modelled status of lunar_identifiability::decompose.",
            oracle_kind: InternalConsistency,
            status: Modelled,
        },
        VerificationItem {
            requirement: "Cross-provider lunar frame/dynamics consistency (real inter-ephemeris)",
            capability: "rotation-only (6-parameter translation+rotation) decomposition of the DE440/INPOP21a/EPM2021 geocentric-Moon disagreement into a reducible common ICRF frame-tie and an irreducible lunar-orbit-orientation excess (the full 7-parameter Helmert fit is a separate public function NOT covered by this external check: its evidence is an internal analytic-recovery unit test plus tests/lunar_helmert_fit_cross_check.rs, which agrees it against the Validated exact Gauss-Newton fit in lunar_frame_realise and pins the opposite-rotation-sign convention between the two)",
            module: "lunar_interop_budget",
            tests: "tests/lunar_interop_budget_reference.rs (raw / rotation-residual / theta_moon / theta_frametie / theta_excess / reducible / irreducible for 3 provider pairs vs the independent SciPy SVD lstsq fit in tests/fixtures/inter_ephemeris/reference.json, rel<1e-3 abs<1e-3 m; fixtures + oracle byte-consistent via scripts/gen_interop_ref.py on public DE440/INPOP21a/EPM2021 kernels through IMCCE calceph)",
            oracle: "Three independent authoritative ephemerides — DE440 (JPL), INPOP21a (IMCCE), EPM2021 (IAA RAS) — sampled via IMCCE calceph, cross-checked by an independent numpy SVD least-squares fit. WHY THIS IS Validated WHERE lunar_common_mode IS NOT, on the same three ephemerides: here the reported quantity IS a property of the published data — their mutual disagreement — so the ephemerides are the oracle, not an input. In lunar_common_mode the same disagreement feeds a MODELLED constellation geometry and the answer is a property of that model, which is why that row is correctly Modelled/ReferenceImpl.",
            oracle_kind: ExternalDataset,
            status: Validated,
        },
        VerificationItem {
            requirement: "Cross-provider consistency tolerance for a mixed-provider user",
            capability: "consistency_tolerance: inverts a user position budget to a per-parameter inter-provider Helmert agreement requirement (origin/scale/rotation) at a reference lever arm, optionally inflated by the P1 single-provider realization CRLB",
            module: "lunar_interop_budget",
            tests: "lunar_interop_budget::tests (monotonicity in budget; RSS budget reduction under a per-provider CRLB; worked rotation tolerance at the lunar lever arm; binding-term = rotation)",
            oracle: "Worst-case triangle bound on the Helmert point-Jacobian action (closed form)",
            oracle_kind: InternalConsistency,
            status: Modelled,
        },
        VerificationItem {
            requirement: "Multi-provider lunar interoperability error budget and frame-vs-ephemeris design law",
            capability: "interop_budget: reducible (common frame-tie) vs irreducible (dynamics) split under PerProvider / CommonFrameTie / CommonEphemeris conventions, with the irreducible-fraction design-law metric (~0.69 on real DE440/INPOP/EPM: a common frame tag alone leaves the dominant floor)",
            module: "lunar_interop_budget",
            tests: "lunar_interop_budget::tests (CommonEphemeris zeroes the budget; CommonFrameTie < PerProvider; irreducible_fraction > 0.5 on the real splits; convention ordering)",
            oracle: "RMS aggregation of the Validated per-pair splits under each convention (closed form)",
            oracle_kind: InternalConsistency,
            status: Modelled,
        },
        VerificationItem {
            requirement: "Autonomous free-network fault-observability linear-algebra pipeline (parity projector, detectability, MDB non-centrality, Byzantine block-spark)",
            capability: "On the real-DE440 per-node lunar network (each row a differential inter-node one-way range built via pernode_range_row with a real DE440 Moon PA-frame line of sight), the engine computes the weighted parity projector P⊥ = I − G(GᵀWG)⁺GᵀW (the rank-deficient pseudo-inverse form that survives the 8-dim datum⊕timescale gauge), the T1 detectability residual ‖P⊥·b‖ (in-range faults annihilated, generic faults detectable), the Baarda MDB non-centrality quadratic form cᵀWP⊥c (the correct single-P⊥ weighted form, NOT the double-P⊥ form cᵀP⊥WP⊥c) with MDB = √(λ₀/cᵀWP⊥c), and the Byzantine block-spark detect/identify counts of the stacked effective peer signatures P⊥·B_T (column-rank, not merely nonzero)",
            module: "lunar_faultobs",
            tests: "tests/lunar_faultobs_reference.rs (faultobs_matches_numpy_scipy_on_real_de440_rows: the 84×84 P⊥ element-wise, trace(P⊥) = parity_dim = 52 and rank(G) = 32, detectability norms + flags, the MDB quadratic form cᵀWP⊥c + MDB value, and the block-spark detect/identify counts for each peer coalition, reproduced against an independent numpy/scipy oracle to rel<1e-3 abs<1e-3 with integer counts exact; inputs byte-consistent via examples/gen_faultobs_rows.rs + scripts/gen_faultobs_ref.py)",
            oracle: "Independent numpy/scipy linear-algebra reproduction on real DE440 Moon PA-frame line-of-sight rows (P⊥ from the SVD of the whitened design W^{1/2}G; the MDB non-centrality from the classical Baarda (1968) parity-subspace squared norm; the block rank from a numpy SVD singular-value count) — a genuinely different numerical route than the crate's cyclic-Jacobi eigendecomposition of GᵀWG. Scope (per tests/fixtures/faultobs/NOTICE.md): this validates the LINEAR-ALGEBRA PIPELINE on these rows only. The node geometry is Modelled. It is NOT an operational integrity guarantee, a protection-level certification, or any RAIM/ARAIM availability claim, and NOT a Byzantine-fault-tolerance mission guarantee — the tolerated-fault COUNT for this network is Modelled, while the detect>f / identify>2f block-spark BOUND is Cited (Fawzi–Tabuada–Diggavi 2014; Shoukry–Tabuada 2016; block-wise spark of Donoho–Elad 2003) and proven-instantiation in code",
            oracle_kind: ExternalDataset,
            status: Validated,
        },
        VerificationItem {
            requirement: "Byzantine block-spark detect/identify bound on the autonomous per-node lunar network (T3)",
            capability: "byzantine_bound instantiates the secure-state-estimation coding / sparse-observability bound on the per-node network geometry: a Byzantine peer injects an arbitrary linear combination of the measurements it participates in, and the network DETECTS any coalition of ≤ f = block_spark − 1 peers and uniquely IDENTIFIES any coalition of ≤ ⌊(block_spark − 1)/2⌋, where block_spark is the smallest peer-coalition whose stacked effective signatures P⊥·B_T are column-rank-deficient. Peer detectability is FULL COLUMN RANK of P⊥·B_j (a nonzero-but-rank-deficient block is a nonzero attack that lands in range(G) and leaves no residual), not merely P⊥·B_j ≠ 0",
            module: "lunar_faultobs",
            tests: "lunar_faultobs::tests — byzantine_c3_rank_deficient_but_nonzero_is_undetectable (nonzero yet rank-deficient block ⇒ block_spark 1, f_detect 0; independent columns ⇒ block_spark 2, f_detect 1), byzantine_real_network_uniform_bias_is_clock_offset (a peer owning all of a node's measurements = a clock-offset error ∈ range(G), undetectable, with a clear Gram spectral gap), byzantine_redundant_net_identifies_at_least_one (six independent single-measurement peers ⇒ block_spark 7, f_identify 3), byzantine_analytic_spark_identity_projector + byzantine_detect_identify_relations (P⊥ = I hand cases pin f_detect = block_spark − 1, f_identify = ⌊(block_spark − 1)/2⌋)",
            oracle: "Geometric instantiation of the block-wise spark / secure-state-estimation bound (Fawzi–Tabuada–Diggavi 2014; Shoukry–Tabuada 2016; block-wise spark of Donoho–Elad 2003; Candès–Tao 2005) — NOT the Lamport–Shostak–Pease 3f+1 consensus threshold ('Byzantine' names the arbitrary/colluding fault MODEL only). The specific tolerated-fault count is a Modelled property of the representative network geometry, checked for self-consistency by hand-constructed analytic cases and the count formulas",
            oracle_kind: InternalConsistency,
            status: Modelled,
        },
        VerificationItem {
            requirement: "Autonomous-holdover temporal-gauge floor for the self-referential lunar constellation (T4)",
            capability: "holdover_floor establishes that in an ensemble of autonomous nodes connected only by inter-node measurements the common clock rate (δα_j += 1 ∀j) is an ensemble-time free parameter lying in N(GᵀWG): no amount of additional inter-node ranging can observe it (rate_in_gauge = true, temporal_gauge_dim = 2 with the common offset). This is the genuine holdover floor — the temporal analog of the rigid-frame position gauge. Adding one external absolute-rate tie (a direct link to an off-network reference) expels the common rate from the null space (rate_in_gauge = false, temporal_gauge_dim = 1), proving the floor is a real gauge, not an oscillator-model artefact",
            module: "lunar_faultobs",
            tests: "lunar_faultobs::tests — holdover_floor_self_ref_and_anchored (self-referential net: the common rate lies in N(GᵀWG), temporal_gauge_dim 2; after one external rate-tie row: rate expelled from the gauge, temporal_gauge_dim 1 with the common offset surviving)",
            oracle: "Ensemble-time free-parameter argument (Percival 1978; Lewandowski & Thomas 1991) instantiated on the representative real-DE440 per-node network: a relative-residual null test of the analytic common-rate generator against GᵀWG, with the tie-broken contrast distinguishing the genuine gauge from an oscillator-model artefact. Representative Modelled geometry, not a certified timing budget",
            oracle_kind: InternalConsistency,
            status: Modelled,
        },
        VerificationItem {
            requirement: "Provider common/differential split, one-rank-deficiency unification, and protection-gap slope (T5 / §0 / g7)",
            capability: "Three facets of the single decomposition ℝ^{state_dim} = N(GᵀWG) ⊕ range(GᵀWG) with the 8-dim datum⊕timescale gauge as N(G) and the state_dim − 8 = 32 observable directions as range(G): (T5) provider_mismatch_split classifies a common multi-provider bias (∈ range(G)) as UNDETECTABLE — needing an external tie — and a differential bias (∉ range(G)) as self-monitored / DETECTABLE; (§0) the unification is that the SAME range(G) blind subspace governs the undetectable fault class, so the datum gauge N(G) and the fault-blind subspace range(G) are one geometry, not two; (g7) slope returns the Brown protection-gap slope ‖Π_obs Δx̂‖ / ‖P⊥b‖_W → ∞ for a fault b ∈ range(G) (estimator corrupted with zero parity) and finite for a detectable fault",
            module: "lunar_faultobs",
            tests: "lunar_faultobs::tests — provider_mismatch_split_common_undetectable_differential_detectable (common bias undetectable, differential detectable), slope_infinity_in_range_finite_detectable (g7: slope ∞ for b ∈ range(G), finite for b ∉ range(G)), pernode_rank_is_state_dim_minus_eight (§0: rank(GᵀWG) = state_dim − 8, the 8-dim gauge is the entire null space with a >1e6 spectral gap)",
            oracle: "Closed-form parity-projector / pseudo-inverse algebra on the representative real-DE440 per-node network: the common/differential split, the N(G) ⊕ range(G) unification and the Brown (1992) protection-gap slope all follow from range annihilation P⊥·G = 0. Representative Modelled geometry, not a certified protection level",
            oracle_kind: InternalConsistency,
            status: Modelled,
        },
        // ── Telecom timing (ITU-T masks) ────────────────────────────────────────
        VerificationItem {
            requirement: "Telecom-timing MTIE and TDEV on a holdover time-error series",
            capability: "The maximum time interval error and time deviation the `telecom-timing` scenario kind reports, on a telecom-scale holdover record: an O(n) monotonic-queue sliding-window MTIE (telecom_timing::mtie_sliding, needed so a day of one-second samples stays fast) and the engine's TDEV (allan::time_deviation), evaluated on the grid the kind reports and read back out of a full run that ingests the series",
            module: "telecom_timing (mtie_sliding, mtie_curve_ns, tdev_curve_ns); allan (mtie, time_deviation)",
            tests: "tests/telecom_timing_reference.rs (17 MTIE and 12 TDEV averaging factors on a committed 2 048-sample chip-scale-atomic-clock holdover series with aging, flicker and temperature, vs allantools 2024.06 to <1e-12 / <1e-9 relative, observed exact / 1.1e-15; the same curves read out of a full telecom-timing run that ingests the CSV); telecom_timing::tests (sliding MTIE equal to allan::mtie at every window; hand-derived MTIE and TDEV; monotone MTIE)",
            oracle: "allantools 2024.06 — an independent third-party frequency-stability library — mtie() and tdev() on tests/fixtures/telecom_timing/holdover_te_series.csv, the series parsed from the same 17-significant-figure text on both sides; the reference records the series' SHA-256 and is regenerable offline via tests/fixtures/telecom_timing/generate_telecom_timing_reference.py. Validates the ESTIMATORS on this record, not the synthetic holdover that produced it",
            oracle_kind: ExternalDataset,
            status: Validated,
        },
        VerificationItem {
            requirement: "ITU-T telecom synchronisation masks with PASS/FAIL and margin",
            capability: "Transcribed limits of ITU-T G.8272 (07/2025) PRTC-A/B, G.8272.1 (2024) Amd. 1 (07/2025) ePRTC locked and ePRTC-A holdover (including the Table 3 time-error envelope), G.8273.2 (2023) Amd. 2 (11/2025) T-BC/T-TSC classes A-D and G.8271.1 (2022) Amd. 3 (05/2025) reference point C, each open or closed interval as the table states it, with every 'for further study' entry left out; a verdict and a margin at the binding point per check, and the time to exceed each budget. Runnable as the `telecom-timing` scenario kind",
            module: "telecom_timing (MASKS, eprtc_a_holdover_limit_ns, check_curve, check_mask)",
            tests: "telecom_timing::tests (mask_boundaries_follow_the_tables_exactly — open and closed ends, the τ = 400 s gap of G.8271.1 Table 7-3, continuity at every breakpoint the tables imply; a_curve_exactly_on_the_limit_passes_and_just_above_fails; eprtc_a_holdover_envelope_follows_table_3; a_coarse_record_is_not_evaluated_against_a_filtered_mask); tests/telecom_timing_reference.rs (telecom_timing_kind_round_trips_through_the_dispatch); tests/telecom_masks_itu_printed_values.rs (mask_values_match_the_numbers_the_recommendations_print; figure_7_2_label_at_1_3_s_is_not_its_own_table_value)",
            oracle: "Transcription of the named Recommendations (freely downloadable from itu.int), each limit carrying its table or clause, listed with every unconfirmed or unimplemented item in docs/TELECOM-TIMING.md; the breakpoint-continuity identities the tables imply are checked in the tests. A standards transcription with internal consistency checks, not a conformance test and not an external validation. 0.30 round 2 (pre-registered 970003ee), blocked (stays MODELLED): the ten mask values and thirteen ePRTC-A holdover values the Recommendations print as worked numbers (G.8272 Figs. 1-2, G.8272.1 Amd.1 cl. 8.2.1 and Figs. V.1-V.3, G.8271.1 Amd.3 Figs. 7-2 to 7-4) are reproduced inside half a printed unit, most of them table constants or breakpoints; G.8271.1 Fig. 7-2 labels 200 ns at 1.3 s against its own Table 7-1 (197.5 ns). The G.8273.2 class A-D limits have no printed worked value, and the G.8272.1 ePRTC locked breakpoint labels (on solid construction lines) were excluded by the pre-registered selection rule, so those remain transcriptions",
            oracle_kind: InternalConsistency,
            status: Modelled,
        },
        VerificationItem {
            requirement: "Oscillator holdover presets from public datasheets",
            capability: "Four presets — OCXO (Microchip OX-208), rubidium (Microchip 8040C), caesium (Microchip 5071A high-performance tube) and CSAC (Microchip SA.45s) — each carrying its datasheet's Allan-deviation maxima, aging and temperature bound; a non-negative least-squares white + flicker + random-walk frequency-noise fit scaled to envelope every datasheet point, a flicker floor never below the longest-τ figure, linear aging and a sinusoidal temperature term, synthesised as a seeded holdover after a GNSS loss",
            module: "telecom_timing (PRESETS, fit_noise, with_flicker_floor, synthesize_holdover); models (ClockModel)",
            tests: "telecom_timing::tests (every_preset_carries_a_named_datasheet_and_figures; the_noise_fit_envelopes_every_datasheet_point; pure_aging_matches_its_closed_form — the discrete aging ramp within 0.1 % of (1/2)·D·t² over a day; same_seed_same_series_and_hash_different_seed_different_series); tests/oscillator_presets_measured.rs (caesium_finding_pinned; rubidium_finding_pinned; csac_finding_pinned; ocxo_preset_has_no_measured_record)",
            oracle: "The four named Microchip datasheets (document numbers and URLs in each preset and in docs/TELECOM-TIMING.md) for the input figures; the closed-form aging ramp and the fit's envelope property as internal checks. How the figures become a noise model — the fit, the floor rule, the 30-day month, the linear temperature reading — is a modelling choice; no preset is a measurement of a unit. 0.30 round 2, one-sided bars against measured units (pre-registered a01c491c), a finding (stays MODELLED): the IGS station THU2 Symmetricom 8040C in ESA MGEX final clocks has an Allan deviation 0.35 to 0.87 of the rubidium preset but a holdover error 1.07 to 1.60 of it; the 5071A record sits outside the caesium preset to 1000 s (measurement white phase noise, 30x at 1 s) and in holdover (1.15 to 8.74); the worst 2011 production SA.45s is 1.26x the CSAC preset at 1 s; the OX-208 has no measured record (blocked)",
            oracle_kind: InternalConsistency,
            status: Modelled,
        },
        // ── Slot timing (time-indexed slots, fix cadence, orbital spoofing) ─────
        VerificationItem {
            requirement: "Holdover prediction from a measured clock record, checked on held-out data",
            capability: "The `slot-timing` kind's measured-record path: the overlapping Allan deviation of a phase record fitted by edf-weighted non-negative least squares in the white-phase and IEEE Std 1139 frequency-modulation basis (slot_timing::fit_weighted), then inverted for the coast time at which the time error reaches a threshold (slot_timing::slot_budget). The red-noise floor is measured from the record instead of assumed",
            module: "slot_timing (ClockNoise::from_phase_record, fit_weighted, slot_budget, breach_after_sync_s)",
            tests: "tests/slot_timing_cs5071a_holdout.rs (holdover_inversion_predicts_the_held_out_caesium_record: fit on the first third of the record, predict the one-sigma breach at 0.5, 0.75, 1, 1.5, 2 and 2.5 ns, measure it on the other two thirds from a sync point every 997 s; bar, fixed before the first run, a factor of 1.5 either way; observed ratios 0.84 to 1.03; a control, the one-second Allan deviation read as white FM, misses by a factor of about 1 000 and must fail the bar; a mutation halving the white-FM level fails the test); slot_timing::tests (a_measured_white_fm_record_recovers_its_level; reduces_to_the_holdover_inversion; ieee1139_conversion_matches_the_powerlaw_module)",
            oracle: "A real free-running atomic clock: 556 990 one-second phase samples of a 5071A caesium standard measured against a hydrogen maser (A. Wallin, distributed with allantools; pinned commit and SHA-256 in scripts/fetch_cs5071a.sh), the same record tests/cs5071a_reference.rs uses for the estimators. The held-out two thirds are an external measurement the prediction never saw. Data-gated: the realdata-clock workflow fetches the record and runs the test with KSHANA_REQUIRE_REALDATA=1. Validates the fit-then-invert path on a white-FM-dominated atomic standard over coasts up to about 50 000 s; not the datasheet or class sources, not the deterministic terms. NOT a crystal oscillator: on a measured OCXO record (tests/slot_timing_ocxo_holdout.rs, allantools, 5.5 h against a hydrogen maser) the held-out prediction is conservative, at 0.59 to 0.70 of the measured breach, and mostly outside the bar, because that oscillator's noise floor halved during the record; in sample it is within 0.98 to 1.17. The crystal case stays MODELLED. NOT atomic clocks in orbit either: on 10 GPS Block IIF satellite clocks (tests/slot_timing_igs_holdout.rs, IGS final 30 s clocks, 14 days, protocol written before download) 8 land within the bar and 2 (G25, G30) are optimistic by up to about 2x, so under the protocol the orbital case stays MODELLED",
            oracle_kind: ExternalDataset,
            status: Validated,
        },
        VerificationItem {
            requirement: "Seconds until a free-running clock leaves a time-indexed slot's guard, and the fix cadence that keeps it inside",
            capability: "The `slot-timing` kind: the predicted error E(t) = k·√(σ₀² + σ_x²(t)) + (|y₀| + |c_T·ΔT|)·t + ½|D|t² inverted for the breach, the time left, the resynchronisation interval net of the fix latency and fixes per day, each term itemised with the dominant one named; clocks from the six ClockClass defaults (TCXO, OCXO and RAFS added, each citing one datasheet), the telecom-timing presets, an inline datasheet or a measured record; a breach beyond the source's longest averaging time flagged as extrapolated",
            module: "slot_timing (predicted_error_s, breach_after_sync_s, terms_at, slot_budget, ClockNoise::from_datasheet, SlotTimingScenario); clock_state (ClockClass::Tcxo, Ocxo, Rafs, source)",
            tests: "tests/slot_timing_igs_holdout.rs (10 GPS Block IIF satellite clocks, 14 days of IGS final clocks: 8 within the 1.5 bar, G25 and G30 optimistic by up to about 2x, pinned); tests/slot_timing_ocxo_holdout.rs (a measured OCXO: held-out prediction never optimistic, 0.59 to 0.70 of the measured breach; in sample within 0.98 to 1.17; without the fix-frequency term the in-sample prediction is optimistic at every threshold); slot_timing::tests (fix_frequency_uncertainty_alone_is_linear_in_time; reduces_to_the_holdover_inversion — every class against holdover::holdover_seconds to 1e-9; white_fm_with_fix_error_has_its_closed_form; flicker_floor_alone_is_linear_in_time; ageing_alone_is_quadratic_in_time; frequency_offsets_add_in_magnitude; the_error_at_the_breach_is_the_guard; datasheet_fit_envelopes_every_point; datasheet_classes_match_their_presets_at_one_second; a_breach_beyond_the_datasheet_is_flagged_as_extrapolated; the_report_carries_the_result_and_a_unit_for_each_field)",
            oracle: "Closed forms for each term alone and the independent holdover::holdover_seconds root-find; the datasheet figures are the named documents (docs/SLOT-TIMING.md). A class default rests on an assumed red-noise floor and a datasheet source is an envelope of maxima, so neither is a measurement of any unit",
            oracle_kind: InternalConsistency,
            status: Modelled,
        },
        VerificationItem {
            requirement: "Timing protection level for a receiver in orbit under GNSS spoofing",
            capability: "orbital_timing::orbital_timing, reachable as the `slot-timing` kind's spoofing section: circular-orbit speed and period, the longest time a ground spoofer can reach the satellite per pass, the clock-aided monitor floor and CUSUM detection latency, the conditional protection level (floor plus coast over the latency), the pull a spoofer at a stated maximum ramp rate accumulates before the satellite leaves its footprint or an independent check runs, and whether each ground-contact or crosslink check is independent of one ground spoofer",
            module: "orbital_timing (orbital_timing, visibility_half_angle_rad, max_pass_s, crosslink_neighbour_is_outside_footprint)",
            tests: "orbital_timing::tests (reduces_to_the_terrestrial_tpl — exactly tpl::timing_protection_level_ns when the clock has no flicker, white-phase or random-run term; leo_geometry_matches_its_closed_forms; crosslink_independence_follows_the_footprint; an_independent_check_caps_the_ramp_before_the_pass_ends; a_crosslink_inside_the_footprint_does_not_count; a_ramp_below_the_reference_is_never_detected)",
            oracle: "Reduction to the existing timing protection level and the circular-orbit and spherical-Earth visibility closed forms. Conditional on detection, one terrestrial spoofer at a stated ramp rate, an overhead pass on a non-rotating Earth; not validated on a spoofed receiver in orbit",
            oracle_kind: InternalConsistency,
            status: Modelled,
        },
        // ── L-band spectrum model, waterfall and SigMF / Welch estimates ─────────
        VerificationItem {
            requirement: "Closed-form L-band signal power spectral densities and spectral separation coefficients",
            capability: "Unit-area power spectral densities of GPS L1 C/A and L2C (BPSK(1)), GPS L5 and Galileo E5a (BPSK(10)), sine-BOC(1,1) and Galileo E1 MBOC(6,1,1/11) (navsignal::Modulation::psd, with an MBOC variant added), their numerically located nulls and maxima (spectrum::psd_nulls_hz, psd_peak_hz, main_lobe_null_to_null_hz), and the spectral separation coefficient of a signal against any spectrum at any offset (navsignal::spectral_separation_coeff_offset) or against a tone, flat noise, a chirp or matched noise (spectrum::Jammer::ssc), with the anti-jam coefficient Q = 1/(R_c kappa)",
            module: "navsignal (Modulation::psd, spectral_separation_coeff_offset, q_from_ssc); spectrum (psd_nulls_hz, psd_peak_hz, main_lobe_null_to_null_hz, Jammer::ssc)",
            tests: "spectrum::tests (bpsk_main_lobe_null_to_null_is_two_n_times_1_023_mhz — BPSK(1) 2.046 MHz and BPSK(10) 20.46 MHz located numerically on the closed form; boc11_lobes_are_centred_at_plus_minus_1_023_mhz — carrier null, first null at 2.046 MHz, lobe centre 1.023 MHz, and the exact maximum at 0.7590 MHz against an independent Newton solve of tan y = 2y; ssc_matches_parseval_closed_forms — C/A x C/A 2/(3R_c) = -61.86 dB/Hz, BOC(1,1) x BOC(1,1) 1/(3R_c) = -64.87 dB/Hz, C/A x BOC(1,1) 1/(6R_c) = -67.88 dB/Hz, each within 0.02 dB; q_values_match_kaplan_hegarty — CW at the carrier Q = 1, matched-spectrum noise Q = 1.5, flat null-to-null noise Q = 2.215; mboc_is_a_unit_area_one_eleventh_mix)",
            oracle: "Published textbook values: the BPSK(n) main lobe of 2n x 1.023 MHz null to null and the anti-jam coefficients Q = 1 for a narrowband (CW) jammer and Q = 1.5 for a spread-spectrum jammer matched to C/A (Kaplan & Hegarty, Understanding GPS/GNSS, 3rd ed., section 9.4); the BOC(m,n) main lobes centred at plus or minus m x 1.023 MHz (Betz, Binary Offset Carrier Modulations for Radionavigation, NAVIGATION 48(4), 2001); the spectral separation coefficients -61.8, -64.8 and -67.8 dB/Hz for C/A with C/A, BOC(1,1) with BOC(1,1) and C/A with BOC(1,1) (Betz 2001; Hein et al., MBOC: The New Optimized Spreading Modulation Recommended for Galileo L1 OS and GPS L1C, Inside GNSS, May/June 2006), reproduced here from their Parseval autocorrelation closed forms. The BOC(1,1) maximum is not at 1.023 MHz: the lobe spans the carrier null to 2.046 MHz and peaks at 0.759 MHz, and the test pins both. The MBOC mix is the ICD definition, checked for unit area and linearity only",
            oracle_kind: ExternalDataset,
            status: Validated,
        },
        VerificationItem {
            requirement: "L-band spectrum waterfall with per-band J/S and effective C/N0 under a scripted jammer timeline",
            capability: "The `spectrum` kind: a frequency-by-time grid of the L-band power spectral density (thermal floor k T_sys with T_sys = T_ant + 290 K (F - 1), the signals at their interface-specification minimum received powers, and continuous-wave, narrowband, chirp and matched-noise jammers with on/off times), each cell averaged over its bin and row (chirps exactly over whole and partial sweeps, jammers by duty), per-band effective C/N0 = [1/(C/N0) + sum (J/S) kappa]^-1 per row, J/S per band, in-band J/S, and an SVG waterfall with C/N0 bars. The report carries a cross-check against the `jamming` kind's chain on the same link inputs",
            module: "spectrum (SpectrumScenario, SpectrumModel::bin_psd_w_per_hz, SpectrumModel::band_state, effective_cn0_multi_dbhz, system_temp_k, Jammer::power_fraction_in, Jammer::duty)",
            tests: "spectrum::tests (agrees_with_the_jamming_kind_chain — J/S equal to jamming::j_over_s_db and effective C/N0 equal to jamming::effective_cn0_dbhz with Q = 1/(R_c kappa) to 1e-9 dB, and the 32.105 dB anchor of the jamming kind's own test; noise_floor_is_kt0f; chirp_window_splits_whole_and_partial_sweeps; duty_weights_partial_rows; demo_scenario_runs_and_denies_l1_while_l5_survives; defaults_run_with_no_jammer; bad_inputs_are_refused)",
            oracle: "Reduction to the existing `jamming` kind's anti-jam equation and link budget (the same code, called on the same inputs), and the k T0 F noise-floor closed form. The signal spectra underneath are the validated row above; the jammer powers, timeline and front-end bandwidths are scenario inputs, the spectra are continuous (no spreading-code lines), and no automatic gain control, blanking or antenna pattern acts on the jammer. No measured jammed spectrum is in the repository to check the composite against. The `jamming` kind's representative Q table (broadband 1.0, CW 1.5) differs from the Q this model derives from the spectra (CW at the carrier 1.0, matched 1.5, flat null-to-null 2.2); the report prints both",
            oracle_kind: InternalConsistency,
            status: Modelled,
        },
        VerificationItem {
            requirement: "SigMF recording input and output, and Welch spectral estimates of complex IQ",
            capability: "sigmf: read and write Signal Metadata Format recordings (JSON .sigmf-meta with the core global, captures and annotations fields; raw .sigmf-data as cf32_le, ci16_le or ci8, the integer decoders shared with realdata::iqif::load_iq), all on strings and byte buffers. spectrum::welch_psd: Hann-windowed, overlapped, averaged periodograms, density-scaled, on an in-crate radix-2 transform (spectrum::fft_in_place). Those two are the validated claim. spectrum::synthesise_iq draws the model as IQ, and the `spectrum` kind's [iq] section runs model to IQ to SigMF to Welch and compares with the model; its [recording] section estimates a real recording (native builds); the synthesis and those model comparisons are outside the validated claim",
            module: "sigmf (read, write, encode, decode, parse_meta, meta_to_json); spectrum (welch_psd, fft_in_place, synthesise_iq)",
            tests: "sigmf::tests (cf32_round_trip_is_exact_to_single_precision; ci16_round_trip_is_within_half_a_code; ci16_is_little_endian_i_then_q; integer_encoding_counts_saturation; metadata_uses_the_core_namespace; unsupported_types_and_channels_are_refused; sample_start_offsets_into_the_data); spectrum::tests (fft_matches_a_direct_dft; welch_reads_white_noise_as_variance_over_fs_and_keeps_a_tone_s_power — floor within 2 % of variance over sample rate, Parseval total within 2 %, Hann equivalent noise bandwidth 1.5 bins; noise_like_synthesis_is_unbiased_through_welch — median Welch-minus-model within 0.1 dB through a ci16_le round trip; synthesised_iq_through_sigmf_reproduces_the_model_spectrum); tests/sigmf_welch_oracle.rs::welch_and_sigmf_io_match_scipy_and_sigmf_python (Welch PSD vs scipy 1.18.1 signal.welch per bin to 1e-12 relative over 27 cases, observed 6.0e-14; five sigmf-python 1.13.0 recordings decoded bit-identically with identical metadata; crate-written recordings read back bit-identically by sigmf-python and schema-valid against SigMF v1.2.6)",
            oracle: "scipy 1.18.1 scipy.signal.welch (BSD-3-Clause) with the same periodic Hann window, overlap, density scaling, no detrend and two-sided mean average: every bin within 1e-12 relative (observed 6.0e-14) over 27 cases, with segment counts taken from scipy's own spectrogram. sigmf-python 1.13.0 (LGPL-3.0, run as a tool) writes five third-party recordings (cf32_le, ci16_le, ci8, two captures with annotations, a non-zero first sample_start) that the crate decodes bit-identically with identical core fields, and reads the crate's recordings back bit-identically; the SigMF v1.2.6 metadata schema reports zero errors on the crate's metadata. Tolerances fixed before the first comparison. Outside the claim: spectrum::synthesise_iq and the [iq] and [recording] comparisons with the model (a synthesis has no single right answer; a periodic chirp shows lines, Fresnel ripple and edge tails the smooth model omits, total power within 2 %), the integer-to-float scaling convention (the crate divides by 32767 and 127, sigmf-python's autoscale by 2^15 and 2^7, which the specification leaves open; the comparison uses raw codes), multi-channel recordings and the data types the reader refuses",
            oracle_kind: ExternalDataset,
            status: Validated,
        },
        // ── Solar-system ephemeris and positioning around any body ──────────────
        VerificationItem {
            requirement: "Planet positions across the solar system from the JPL Standish Keplerian elements",
            capability: "Heliocentric positions of Mercury, Venus, the Earth-Moon barycentre, the Earth, Mars, Jupiter and Saturn from Standish Table 1 (1800 AD to 2050 AD), and of all eight planets from Tables 2a/2b (3000 BC to 3000 AD, with the b, c, s, f mean-anomaly terms), following the JPL page's algorithm step for step and rotated to the ICRF (International Celestial Reference Frame) by the page's obliquity; the Earth is split from the barycentre by the Montenbruck & Gill lunar series and the mass ratio. Composed as ephem_provider::AnalyticSolarSystem so any body is available relative to any other, and runnable as the `solar-system` kind",
            module: "ephem (standish_state, standish_elements, standish_nominal_error, ecliptic_to_icrf); ephem_provider (AnalyticSolarSystem); solar_system (SolarSystemScenario)",
            tests: "tests/solar_system_standish_preregistered.rs::standish_rms_errors_are_within_explanatory_supplement_table_8_10_1 (barycentres 1800-2050 from Table 1 and 3000 BC-3000 AD from Table 2, 8908 and 21857 epochs, worst RMS 0.778 of the Table 8.10.1 figure); tests/solar_system_standish_earth_icrf_preregistered.rs (earth_from_the_split_barycentre_is_within_the_emb_table_8_10_1_rms: the Earth through AnalyticSolarSystem and icrf_to_ecliptic, RMS 0.483 of the EMB figure; icrf_positions_are_within_the_table_8_10_1_rms: ICRF positions of the Table 1 bodies and the Earth, worst 0.778; earth_minus_barycentre_offset_matches_de441_1950_to_2050: the lunar-series split, worst 0.088 deg and 6.1 km); ephem::tests (standish_periods_obey_keplers_third_law; a_planet_track_is_one_closed_ellipse). Non-gating regression: tests/solar_system_horizons_reference.rs",
            oracle: "JPL Horizons DE441 geometric heliocentric vectors (ecliptic and ICRF), fetched after the pre-registration commits 80451866, 8d38a28b and 558cc807. Bar: per planet and component, RMS at most 1.0x the approximate errors of the Explanatory Supplement 3rd ed. Table 8.10.1 (the EMB row for the Earth); the Earth-EMB split is checked directly against DE441 399 minus 3, at most 0.3 deg and 8.1 km at every epoch 1950-2050 (the 8.1 km length bar comes from the lunar-series accuracy stated in Kshana own ephemeris documentation, citing Montenbruck and Gill, and was not checked against the book; the measured 6.09 km sits close to it). The RMS statistic was chosen knowing that an earlier 27-epoch comparison reached 1.87x nominal at its maximum; single-epoch errors reach 3.83x (3.87x in the ICRF case). The Supplement does not define its figures as RMS. Case B rotates both sides with the IAU 1976 obliquity typed in the test, so the rotation is not checked against itself. The default table selection of AnalyticSolarSystem is not exercised (the tests force Table 1). Uranus and Neptune from Table 1 are a separate MODELLED row",
            oracle_kind: ExternalDataset,
            status: Validated,
        },
        VerificationItem {
            requirement: "Sun, Moon, Mercury and Venus positions from the DE440 kernel at UTC epochs (KernelEphemeris)",
            capability: "Geometric positions of the Sun, Mercury, Venus, the Earth and the Moon relative to one another (J2000/ICRF axes, metres) from a JPL DE440 kernel through ephem_provider::KernelEphemeris at UTC epochs: body names mapped to NAIF codes, UTC carried through the leap-second table and TT to TDB with the two-term TDB-TT series, the kernel read by the engine's own reader. A body the kernel holds only as a system barycentre (Mars to Neptune, Pluto in de440s) is refused, never substituted. The kernel-free Standish row stays the browser and fallback path",
            module: "ephem_provider (KernelEphemeris::relative_position_utc, utc_to_tdb_jd2); naif_kernel; timescales",
            tests: "tests/kernel_ephemeris_skyfield_oracle.rs::kernel_ephemeris_matches_skyfield_at_utc_epochs (600 positions at 200 UTC epochs 1973-2026 drawn from the pre-registration hash; worst 0.66 of the bar, 2.96 m); tests/kernel_ephemeris_skyfield_oracle.rs::kernel_ephemeris_matches_skyfield_on_the_full_kernel_when_present (data-gated); tests/kernel_ephemeris_skyfield_oracle.rs::barycentre_only_bodies_are_refused_not_substituted; ephem_provider::tests",
            oracle: "Skyfield 1.54 (MIT), with its own leap-second table, its own TDB-TT and its own reader of the same NAIF de440s.bsp (jplephem), run as a separate program at UTC epochs. Pre-registered (0bfafe6d) before the fixture existed, the grid seeded from that commit's hash, with a bar of 5e-5 s times the relative speed (the engine's stated two-term TDB-TT accuracy) plus 1e-13 of the barycentric distance plus 1e-5 m, per component. Result: all 600 inside, worst 0.66 of the bar (2.96 m on a fast pair, the TDB-TT series' own error). Mutation: TT used as TDB fails at 33 times the bar. Both sides read DE440: this validates the provider and its time chain, not DE440. Outside the claim: the planets beyond Venus as bodies (de440s carries their barycentres only), the planetary moons, and precision below the two-term TDB-TT series (a few metres for the fastest pairs)",
            oracle_kind: ExternalDataset,
            status: Validated,
        },
        VerificationItem {
            requirement: "Light time between solar-system bodies",
            capability: "The Newtonian one-way light time from any body to any other, received at an epoch, solved by the radiometric fixed-point light-time solver (radiometric::light_time_solution, transmitter at its retarded position) through solar_system::link_on on any EphemerisProvider; the solar-system kind runs it on the analytic solar system in the heliocentric frame (solar_system::link). The two-way range from radiometric::two_way_range and the Sun Shapiro delay from radiometric::shapiro_delay are reported separately and are not externally compared. Emitted for every body against an observer and for any extra link by the `solar-system` kind, and for the body-to-Earth downlink by the `body-pnt` kind",
            module: "radiometric (light_time_solution, two_way_range, shapiro_delay); solar_system (link, link_on); ephem_provider (AnalyticSolarSystem)",
            tests: "tests/solar_system_light_time_solver_preregistered.rs::light_time_solver_on_de441_positions_matches_horizons_lt_within_1e_6_s (Mercury, Venus, Mars, Jupiter and Saturn barycentres, the Sun and the Moon to the Earth centre, 1576 epochs each on interpolated DE441 positions, worst 6.7e-9 s against 1e-6 s); non-gating accuracy statement for the analytic path: tests/solar_system_light_time_preregistered.rs (RMS c dLT 0.17 to 0.30 of the Table 8.10.1 position bar); solar_system::tests",
            oracle: "JPL Horizons DE441 one-way down-leg Newtonian light time LT (VEC_CORR=LT, observer the Earth centre), pre-registered (480037d3, amendment 54d5c86f changing only the interpolation node spacing after the first fetch failed its 10 m interpolation precondition, before any light time was compared) with a bar of 1e-6 s per light time, the solver fed DE441 barycentric positions so the retarded-transmitter iteration is visible (a first-iterate solver misses by up to 0.1 s). On the analytic Standish positions the light time is only as good as those positions (see the planet-position row); the shipped link treats the Sun as an inertial centre, which stays inside that position error but is not separately validated. two_way_range and shapiro_delay are not externally compared",
            oracle_kind: ExternalDataset,
            status: Validated,
        },
        VerificationItem {
            requirement: "Uranus and Neptune from Standish Table 1, Pluto, and planetary velocities",
            capability: "Positions of Uranus and Neptune from Standish Table 1 (the default inside 1800 AD to 2050 AD), Pluto from the 1992 Table 1 row the current JPL page no longer lists, and the heliocentric velocity of every planet: the two-body derivative with the mean motion the elements imply plus the turning of the ellipse by the perihelion, inclination and node rates",
            module: "ephem (standish_state, StandishElements::state_at_mean_anomaly, Planet::Pluto); solar_system (position_label)",
            tests: "tests/solar_system_horizons_reference.rs (standish_table1_uranus_and_neptune_exceed_the_nominal_error: pinned at 2.04 and 5.16 times the nominal longitude error, under six times; pluto_from_the_1992_row_is_measured_not_validated: within 39 arcsec and 1.14e9 m; standish_velocities_track_horizons_to_one_percent: worst 3.7e-3 of the speed); ephem::tests (standish_velocity_is_the_derivative_of_the_position; pluto_has_no_table2_row_and_no_stated_error)",
            oracle: "Measured against JPL Horizons DE441 (the same committed fixtures), but not validated: Table 1's stated figures for Uranus and Neptune are exceeded by up to 2.0 and 5.2 times against DE441 heliocentric positions (Neptune meets them against barycentric positions, which suggests the fit was not heliocentric), the page states no error for Pluto, and no published bound exists for the velocities. Tables 2a/2b meet their own figures for Uranus and Neptune and are covered by the validated row",
            oracle_kind: ExternalDataset,
            status: Modelled,
        },
        VerificationItem {
            requirement: "Positions of the Moon and seven major moons (Phobos, Deimos, the Galilean moons, Titan)",
            capability: "The geocentric Moon from the Montenbruck & Gill series (whose -1.3972 deg per century term already refers it to the J2000 equinox), and planetocentric positions and velocities of Phobos, Deimos, Io, Europa, Ganymede and Callisto from the JPL Solar System Dynamics mean elements in each moon's Laplace plane with the mean-longitude rate taken from the IAU synchronous rotation rate (the table prints the period to too few digits to hold the phase), and of Titan from the IAU rotation model (the moon on minus the body-fixed x axis at the mean distance), because Titan's printed Laplace-plane row does not reproduce Horizons even at its own epoch",
            module: "ephem (satellite_state, Satellite, SatelliteMethod, moon_icrf, moon_icrf_velocity); ephem_provider (AnalyticSolarSystem)",
            tests: "tests/solar_system_horizons_reference.rs (moons_track_horizons_to_the_measured_angles: worst angular error seen from the planet over 2000 to 2040, Phobos 5.65 deg, Deimos 0.38, Io 0.40, Europa 1.63, Ganymede 0.22, Callisto 0.27, Titan 3.31; geocentric_moon_tracks_horizons: 0.046 deg); ephem::tests (moons_sit_at_their_mean_distance_and_move_at_their_mean_speed); ephem_provider::tests (earth_and_moon_balance_about_their_barycentre)",
            oracle: "Measured against JPL Horizons satellite ephemerides (DE441, MAR099, JUP365, SAT441) committed in tests/fixtures/solar_system/horizons_satellites_icrf.csv with the query and retrieval date; no published accuracy exists for mean elements or for the rotation-model placement, so the pinned bars catch regressions and do not validate. Mean elements omit the resonant and solar perturbations, and Phobos' secular acceleration is not modelled",
            oracle_kind: ExternalDataset,
            status: Modelled,
        },
        VerificationItem {
            requirement: "Physical constants of every solar-system body and the whole-system report",
            capability: "Body gains Mercury, Venus, Jupiter, Saturn, Uranus, Neptune, Pluto, Phobos, Deimos, Io, Europa, Ganymede, Callisto and Titan (gravitational parameter, reference radius, J2 where published with the radius it is referenced to, IAU pole and prime meridian), a name lookup and a BodyFacts record (NAIF code, class, parent, equatorial and mean radius); the `solar-system` kind reports them for all eighteen bodies with the positions, light times and an orbit track over one revolution, each body labelled VALIDATED or MODELLED",
            module: "body (Body::by_name, Body::facts, Body::prime_meridian, SOLAR_SYSTEM, BodyFacts); solar_system (SolarSystemScenario, position_label)",
            tests: "body::tests (every_catalogue_body_resolves_by_name_and_carries_its_record; a_zonal_field_is_referenced_to_its_sources_radius; retrograde_rotators_have_negative_rates_and_periods_match_the_iau_rate); solar_system::tests (defaults_report_all_eighteen_bodies_with_tracks; earth_heliocentric_distance_is_one_au_and_period_one_year; a_planet_track_closes_on_its_orbit_and_starts_at_the_epoch_position; moons_orbit_their_planets_at_their_mean_distance; pluto_outside_its_table_is_an_error_not_a_guess; every_emitted_number_has_a_unit); tests/body_constants_naif_oracle.rs::only_the_conventional_constants_of_other_rows_differ; tests/body_constants_naif_oracle.rs::constants_match_naif_pck00011_and_gm_de440; tests/body_orientation_spice_oracle.rs::orientation_matches_spice_pxform_for_the_fourteen_added_bodies",
            oracle: "Transcription of published constants, each cited where it is defined: gravitational parameters from the JPL Horizons body records and the JPL satellite physical-parameter table, radii from the JPL physical-parameter tables (IAU WGCCRE 2015), poles and prime meridians from the IAU Working Group on Cartographic Coordinates and Rotational Elements (mean values, without the T-rate and periodic terms), J2 from Smith et al. 2012, Iess et al. 2018 and 2019, and Jacobson 2009 and 2014. Checked for internal consistency (the Jupiter rotation period against the System III rate, each J2 against its reference radius), not against an external oracle. 0.30 round 2 (stays MODELLED; a split is pending): the GM values were adopted from gm_de440 and the Phobos and Deimos elements from pck00011, so 0 of 84 constants of the fourteen added bodies now differ from NAIF (was 12), which is a transcription check and is not counted. The computed IAU body-fixed orientation of the fourteen added bodies (pole and prime meridian with century rates, the quadratic term and the periodic terms) agrees with SPICE pxform on pck00011 within 1e-9 rad at 41 epochs from 1955 to 2044 (574 matrices, worst Phobos 1.43e-10 rad; pre-registered c2434204), a Library check of that computation only. J2 and the mean radius are cited, not validated; the positions in the report rest on their own rows; and the report prime_meridian_deg for the Earth, the Moon and Mars stays on conventional constants (up to 6.6e-3, 2.8e-2 and 9.6e-4 rad from IAU_<BODY>). 0.30 revisions: Phobos GM 7.087e5 -> 7.087546066894452e5, Deimos 9.62e4 -> 9.615569648120313e4, Uranus 5.7939506103e15 -> 5.793951256527211e15, Neptune 6.83509997e15 -> 6.835103145462294e15, Pluto 8.69326e11 -> 8.696138177608748e11 m³/s²; Phobos equatorial radius 13.1 -> 13.0 km; prime_meridian_deg now includes the quadratic and periodic terms",
            oracle_kind: InternalConsistency,
            status: Modelled,
        },
        VerificationItem {
            requirement: "Positioning around any solar-system body with a local constellation and a deep-space link from Earth",
            capability: "The `body-pnt` kind: an orbiter or a surface lander around a body chosen by name navigates with one-way pseudoranges from a Walker navigation constellation around the body (two-body orbits with the body's J2 secular drift, an unknown user clock) and an optional clock-free two-way range from the Earth, the Earth's direction and distance from the analytic ephemeris at every epoch; lines of sight blocked by the body's sphere and a surface elevation mask; per epoch the constellation-only GDOP and PDOP (orbit::dop), the formal position uncertainty with and without the Earth row, and seeded Gauss-Newton fixes (batch_ls::gauss_newton) each way, with the body-to-Earth light time and round trip",
            module: "body_pnt (BodyPntScenario, formal_sigma, fix_error); orbit (dop); batch_ls (gauss_newton); mars_pnt (chord_clears_sphere); mars_frame (bodyfixed_to_inertial)",
            tests: "body_pnt::tests (relay_period_is_keplers_third_law_for_the_body; an_orbiter_keeps_its_radius_and_a_lander_sits_on_the_surface; the_earth_range_never_worsens_the_formal_uncertainty; seeded_fix_errors_are_consistent_with_the_formal_sigma: the root-mean-square of each fix error over its own formal sigma in [0.6, 1.5]; earth_light_time_is_minutes_at_mars_and_the_run_is_deterministic; defaults_run_around_mars_and_every_number_has_a_unit)",
            oracle: "Closed forms and self-consistency: Kepler's third law for the relay period, the orbit radius and the surface radius held over the run, adding a measurement never increasing the formal uncertainty, and the seeded errors agreeing with the covariance. The relay orbits ignore third bodies (Jupiter's pull on relays around Europa is not modelled), the noise is Gaussian at stated levels and the measurement model is instantaneous, so this is not validated against any mission's navigation data",
            oracle_kind: InternalConsistency,
            status: Modelled,
        },
        // ── Constellation design (Walker, presets, coverage and DOP maps) ─────
        VerificationItem {
            requirement: "Walker constellation geometry and the published nominal slots of GPS, Galileo and GLONASS",
            capability: "The `constellation-design` kind's generators: Walker delta and star patterns in the T/P/F convention (node spacing 360/P or 180/P, in-plane spacing 360·P/T, inter-plane phase offset 360·F/T), and the GPS baseline and expandable 24-slot, Galileo and GLONASS presets built from their published nominal elements, placed in an Earth-fixed frame by the Greenwich hour angle their documents state",
            module: "constellation (WalkerSpec::elements, gps_slots, galileo_walker, glonass_slots, GPS_BASELINE_SLOTS, GPS_EXPANDABLE_SLOTS)",
            tests: "constellation::tests::walker_24_3_1_reproduces_galileo_os_sdd_table_23 (all 24 RAAN and mean-anomaly rows to 1e-9 deg); constellation::tests::glonass_icd_slot_formula_is_a_walker_24_3_1 (the ICD slot formula and a Walker 24/3/1 are the same 24 node and argument-of-latitude pairs); constellation::tests::gps_presets_reproduce_the_published_equatorial_crossings (the groundtrack equatorial crossing of all 36 GPS locations from RAAN, argument of latitude and the 100.765 deg hour angle: 35 within 0.0108 deg against a 0.015 deg rounding bar, and E3F within 0.06 deg because the table's own E3F row is inconsistent with its RAAN and argument of latitude by about 0.06 deg; the secular nodal regression within 5 % of the table's -0.0402 deg/day); constellation::tests::walker_geometry_identities_are_exact (the three spacing identities for delta and star patterns up to 1 584 satellites, to 1e-9 deg)",
            oracle: "Published agency documents: Galileo Open Service Service Definition Document issue 1.1 (European GNSS Service Centre) Tables 1 and 23, the reference constellation at 2016-11-21 00:00 UTC; GLONASS Interface Control Document edition 5.1 (2008) section 5.2, the slot formula for node longitude and argument of latitude; GPS Standard Positioning Service Performance Standard 5th edition (April 2020) Tables 3.2-1, 3.2-2 and 3.2-3, including the groundtrack equatorial crossing column, which is an independent statement of the Earth-fixed geometry the preset must reproduce. Validates the generators and the transcription; the BeiDou medium-orbit phase and inclined-geosynchronous nodes are not published and are not covered",
            oracle_kind: ExternalDataset,
            status: Validated,
        },
        VerificationItem {
            requirement: "Global dilution of precision of the GPS baseline constellation",
            capability: "The `constellation-design` coverage engine on the GPS baseline 24-slot preset under the GPS Standard Positioning Service Performance Standard (SPS PS) Appendix B conditions (one sidereal day, 287 five-minute steps, a 4 x 4 deg global grid weighted by the cosine of latitude, all in view, 5 deg mask, one receiver clock): the global HDOP distribution, the PDOP median and the PDOP-at-most-6 availability, globally and at the worst site",
            module: "constellation (coverage, dop_at, NormalAccum)",
            tests: "constellation::tests::gps_baseline_global_dop_matches_the_sps_performance_standard (HDOP median 0.940, 90 % 1.165, 95 % 1.255, 98 % 1.370, mean 0.965 against 0.94, 1.16, 1.25, 1.37 and 0.96, bar 0.03 on each fixed before the first run; PDOP median 1.795 at or below Table B.3-1's 1.815 for a degraded 20-24 satellite mix; availability 100 % global and at the worst site against Table 3.8-1's 98 % and 88 %); constellation::tests::single_epoch_dop_matches_the_hand_computation (zenith plus three satellites at 30 deg elevation: HDOP 4/3, VDOP 2.3094, PDOP 8/3, TDOP 1.5275, GDOP 3.0732 to 1e-9, and equal to orbit::dop with a common clock)",
            oracle: "GPS SPS PS 5th edition (April 2020) Appendix B sections B.3.2.2 and B.3.2.3, the published global-average HDOP distribution of the fully occupied baseline 24-slot constellation (median 0.94, 90 % 1.16, 95 % 1.25, 98 % 1.37, mean 0.96), Table 3.8-1 (PDOP availability) and Table B.3-1 (ensemble PDOP of a degraded constellation, used only as an upper bound), plus a hand-derived closed form for one epoch. The VDOP and PDOP distributions of the full constellation are published only as a figure, so PDOP is pinned one-sided; the worst time-space point (HDOP 2.40 and VDOP 5.22 here, 2.49 and 5.43 published) depends on the grid and is reported, not pinned",
            oracle_kind: ExternalDataset,
            status: Validated,
        },
        VerificationItem {
            requirement: "Coverage and dilution-of-precision maps for arbitrary multi-constellation designs at scale, around any central body",
            capability: "The `constellation-design` kind beyond the two pinned cases: explicit and multi-shell designs, several constellations per run with one receiver clock per constellation, the Earth, the Moon and Mars from the body constants, the BeiDou preset (medium-orbit phase and 118 deg E inclined-geosynchronous crossing modelled), per-cell satellites in view, GDOP, PDOP, HDOP, VDOP and availability, downsampled ground tracks, and a sub-satellite-latitude visibility prefilter that runs a 5 000-satellite design on a 10 deg grid in a fraction of a second",
            module: "constellation (coverage, ConstellationDesignScenario, beidou_slots, body_by_name)",
            tests: "constellation::tests (prefilter_matches_brute_force_exactly — every map and counter equals a scan with the direct elevation test; five_thousand_satellites_on_a_coarse_grid — 5 000 satellites, prints the run time and the pair tests kept; a_clock_per_constellation_needs_one_more_satellite; beidou_geo_and_igso_geometry; lunar_shell_runs_around_the_moon; presets_are_earth_only_and_errors_are_clear; preset_counts); tests/constellation_availability_published_spec_oracle.rs::presets_meet_the_published_dop_availability (regression check only); tests/coverage_dop_full_oracle.rs::finding_is_pinned; tests/coverage_dop_gnss_lib_py_oracle.rs (regression)",
            oracle: "Internal consistency: the brute-force elevation scan, the hand-computed and orbit::dop reductions, and the closed-form Walker and geosynchronous geometry. Two-body orbits with an optional secular J2, a spherical body with the local vertical along the radius, geometric visibility only (no signal power, satellite health, terrain or third-body perturbation), and the relative phase between systems taken from different reference epochs, so it is not a snapshot of any date. 0.30 review, a finding (stays MODELLED): the presets meet the published one-sided DOP-availability floors (BeiDou OS Performance Standard 3.0, Galileo OS SDD) at 100 %, but with the engine's PDOP doubled in a scratch copy they still meet them (worst point 99.36 %), so the floors cannot detect even a 100 % error in the quantity this row computes; tightening them after the run would be a post-hoc tolerance. Promotion needs a two-sided comparison of DOP values on identical geometry with a pre-set tolerance. 0.30 round 2 (tests/coverage_dop_full_oracle.rs, pre-registered add671d6), a finding (stays MODELLED): Orekit 12.2 positions, elevation, azimuth and ground tracks with gnss_lib_py 1.0.4 GDOP/PDOP/HDOP/VDOP (common clock) and a numpy inverse (one clock per constellation) agree on every bar on the Galileo, GPS, BeiDou, Galileo+GPS (one clock each) and a 1584-satellite Earth design (DOP within 2e-14 relative, identical fix, availability and visibility counts). On the Moon and Mars designs the elements, positions, visibility and tracks agree, but DOP exceeds the pre-set 1e-9 relative bar in cells whose largest PDOP is 1434 or more (up to 8e-6), and 4 cells differ by one fix epoch on numerically singular geometry (engine pivot 1e-10 against numpy rank), so the row is not validated. 0.30 revisions: the TDOP/GDOP reference clock is now the lowest-numbered constellation in view (constellation-multi-gnss-coverage global GDOP max 2.2236 -> 2.1205, mean 1.122 -> 1.131), and per-constellation visible counts are summed as integers",
            oracle_kind: InternalConsistency,
            status: Modelled,
        },
        // ── Campaigns (composition of existing kinds) ───────────────────────────
        VerificationItem {
            requirement: "A chained mission across scenario kinds on one shared timeline",
            capability: "The `campaign` kind's phases: each phase runs one or more scenarios of existing kinds through run_toml, reads their outputs into named channels (clock time error and guard, mean effective carrier-to-noise density ratio and tracking floor, vertical protection level and alert limit, position error, satellites tracking, alarm flags) by per-kind presets or explicit result paths, places them at the phase start and holds them onto a common grid, with phase boundaries and events; state is handed on by carry (a channel continues from the previous phase's end value), handoff (a previous phase's number written into the next scenario) and end_at (a phase ends at a time a run computed, such as a spoofing monitor's detection time); a campaign hash and a digest over every member result",
            module: "campaign (run_campaign_detailed, run_chain, presets, extract, to_svg)",
            tests: "tests/campaign_composition_reference.rs (a_one_phase_clock_campaign_reproduces_the_standalone_run_bit_for_bit, a_one_phase_integrity_campaign_reproduces_the_standalone_run_bit_for_bit, a_one_phase_jamming_campaign_reproduces_the_standalone_run_bit_for_bit — the member result byte-identical to the stand-alone run and every aligned value equal to the stand-alone series; the_chained_mission_hands_state_on_and_ends_the_spoofing_phase_on_detection; a_handoff_writes_the_previous_phase_number_into_the_next_scenario; malformed_campaigns_fail_loudly)",
            oracle: "Composition identities against the stand-alone runs of the same kinds: a one-phase campaign reproduces the stand-alone output bit for bit, the carried offset equals the previous run's own last sample, and the phase ended by end_at has exactly the run's detection time as its length. The additive carry across a phase boundary and the zero-order hold are modelling choices, and each phase is as good as the kind that ran it; no chained mission has been checked against a measured one",
            oracle_kind: InternalConsistency,
            status: Modelled,
        },
        VerificationItem {
            requirement: "Parameter sweeps and seeded Monte Carlo ensembles over any scenario kind",
            capability: "The `campaign` kind's sweep (one to three dotted keys of any kind, on the generic sweep's axis values, optionally an ensemble at every node) and monte_carlo sections: realisation k runs at base_seed + k; each metric reports mean, standard deviation, nearest-rank 5th/50th/95th percentiles and a fixed-seed percentile-bootstrap 95% confidence interval on the mean (inertial::metric_stat); metric units read from the swept kind's own units block",
            module: "campaign (run_sweep, run_monte_carlo, ensemble); sweep (GenericAxis, coords_of, set_dotted_value); inertial (metric_stat)",
            tests: "tests/campaign_composition_reference.rs (a_fixed_seed_ensemble_is_byte_stable_and_each_realisation_is_the_standalone_run; the_ensemble_mean_and_spread_match_the_white_fm_closed_form — 200 seeds of a white-frequency-noise clock coasting tau = 3010 s: the true mean 0 inside the reported interval, the interval half-width within 25% of 1.96 sigma/sqrt(n), and the sample variance inside the two-sided 99% chi-square interval of sigma = sqrt(q_wf tau) = 16.459 ns; a_one_node_sweep_and_a_one_member_composition_read_the_standalone_number)",
            oracle: "The closed form of the phase random walk under white frequency noise, variance q_wf tau (NIST Technical Note 1337), for the statistics machinery, and byte equality with the stand-alone runs for the seeding. It checks the ensemble arithmetic on the engine's own clock model, not an external dataset",
            oracle_kind: InternalConsistency,
            status: Modelled,
        },
        VerificationItem {
            requirement: "Several scenarios under shared conditions, with a combined summary",
            capability: "The `campaign` kind's compose section: named shared values (for example one jammer's power and position) written into each member at the keys it binds them to, every member run, and per metric the smallest, largest and mean value across the members with the member named; metric units must agree across members",
            module: "campaign (run_compose)",
            tests: "tests/campaign_composition_reference.rs (a_one_node_sweep_and_a_one_member_composition_read_the_standalone_number — a one-member composition reads the stand-alone number and result digest)",
            oracle: "Composition identity against the stand-alone run. The shared-condition arithmetic is bookkeeping; the physics is that of the member kinds, each with its own row",
            oracle_kind: InternalConsistency,
            status: Modelled,
        },
        // ── LEO-PNT signal designs and the multi-band spectrum ──────────────────
        VerificationItem {
            requirement: "Band-limited closed forms for any ranging signal: power in band and early-late code-tracking jitter against published values, with the Gabor bandwidth and offset spectral separation cross-checked",
            capability: "navsignal: the sine integral (sine_integral), the BPSK-R fraction of power inside a double-sided band in closed form (bpsk_power_in_band_closed_form), the band-limited BPSK Gabor bandwidth in closed form (bpsk_gabor_bandwidth_closed_form_hz), the band-limited coherent and non-coherent early-late delay-lock-loop jitter for any unit-area spectrum after Betz & Kolodziejski 2009 (dll_jitter_bandlimited_s) and its vanishing-spacing Gabor bound (dll_jitter_small_spacing_limit_s), the offset BPSK spectral separation coefficient in closed form (bpsk_offset_ssc_closed_form), the Galileo E5 AltBOC(15,10) spectrum (altboc_15_10_psd) and a modulation-label parser (parse_modulation); used by the `leo-signal` kind for every signal design",
            module: "navsignal (sine_integral, bpsk_power_in_band_closed_form, bpsk_gabor_bandwidth_closed_form_hz, dll_jitter_bandlimited_s, dll_jitter_small_spacing_limit_s, bpsk_offset_ssc_closed_form, altboc_15_10_psd, parse_modulation)",
            tests: "navsignal::band_limited_tests (sine_integral_matches_tables_and_its_limit — Si(1), Si(pi), Si(2 pi) to 1e-12; bpsk_power_in_band_closed_form_matches_textbook_and_numeric — 0.9028 of the power in the main lobe for BPSK(1/3), BPSK(1), BPSK(5), BPSK(10), and the closed form equal to quadrature to 1e-7 in 10, 15, 20 and 51.15 MHz; bpsk_gabor_closed_form_matches_numeric_and_asymptote — to 1e-4, and the sqrt(B R_c / (2 pi^2)) asymptote; bandlimited_dll_reduces_to_the_textbook_forms — coherent early-late BPSK(1) at 45 dB-Hz, B_L 1 Hz, d 1 chip, T 20 ms: 0.0039564 chips (1.159 m) within 1 %, the non-coherent form equal to navsignal::dll_code_jitter_chips within 1 %, the vanishing-spacing limit equal to its closed form to 1e-5; offset_bpsk_ssc_matches_parseval_closed_form — offsets 0 to 3.2 R_c within 0.01 dB and -71.86 dB/Hz at zero offset for BPSK(10); altboc_psd_is_unit_area_with_lobes_at_e5a_and_e5b; modulation_labels_round_trip)",
            oracle: "Externally pinned: 90.3 per cent main-lobe power, the coherent early-late jitter at the stated operating point, the sine-integral table values, and the BPSK self spectral separation coefficient 2/(3 R_c) at zero offset. Internal cross-checks only, not external validation: the band-limited BPSK Gabor-bandwidth closed form and its asymptote, and the offset BPSK spectral separation coefficient at non-zero offsets, both derived here and checked against quadrature. Published closed forms: the BPSK-R sinc-squared spectrum and its 90 per cent main-lobe power (Kaplan & Hegarty, Understanding GPS/GNSS, 3rd ed.); the coherent early-late code-tracking jitter sigma^2 = B_L d / (2 C/N0) chips^2 (Kaplan & Hegarty, section 8) and the band-limited generalisation with its Gabor-bandwidth limit (Betz & Kolodziejski, Generalized Theory of Code Tracking with an Early-Late Discriminator, Part I, IEEE Transactions on Aerospace and Electronic Systems 45(4), 2009); the sine-integral tables of Abramowitz & Stegun (Table 5.1); the spectral separation coefficient as the Fourier transform of the squared autocorrelation (Betz 2001). The AltBOC spectrum is checked for unit area and lobe position only (the Galileo Open Service Signal-in-Space Interface Control Document expression integrates to 8 and is divided by it).",
            oracle_kind: ExternalDataset,
            status: Validated,
        },
        VerificationItem {
            requirement: "Maximum Doppler of a low Earth orbit navigation satellite, which sizes the acquisition search",
            capability: "leo_signal::max_doppler_hz: the largest satellite Doppler on an overhead pass at the elevation mask for a circular orbit, v R_E cos(el) / (R_E + h) times f / c, from each preset's own carrier and orbit altitude; the `leo-signal` kind adds oscillator and user terms and turns it into Doppler bins",
            module: "leo_signal (max_doppler_hz)",
            tests: "leo_signal::tests::max_doppler_matches_published_xona_and_iridium_figures — Xona Pulsar X1 (1593.3225 MHz, 1080 km) 33.2 kHz inside the published 32 to 34 kHz; Iridium (1621 MHz, 780 km) within 0.5 kHz of the published 36 kHz",
            oracle: "Published figures: Xona Pulsar X1 maximum Doppler 32 to 34 kHz (Leclère, Marathe & Reid, ION GNSS+ 2025, https://arxiv.org/abs/2509.19551); Iridium Doppler up to +/-36 kHz (Resilient Navigation and Timing Foundation, Recent PNT Improvements and Test Results Based on Low Earth Orbit Satellites). Earth rotation is left out, which moves the figure by up to about 2.3 kHz; both published figures are met without it.",
            oracle_kind: ExternalDataset,
            status: Validated,
        },
        VerificationItem {
            requirement: "Low Earth orbit positioning, navigation and timing signal designs: code tracking, acquisition, GNSS compatibility and a band trade for any system",
            capability: "The `leo-signal` kind: parameterised signal designs (band, transmit bandwidth, ITU allocation; acquisition, data and pilot components with BPSK(n), BOC(m,n), MBOC or flat spectra, power shares, FDMA sub-carriers, code lengths and data rates) from compiled-in public preset files (Xona Pulsar, Iridium STL, Starlink signal of opportunity, CentiSpace, a generic C-band design and generic UHF/L/S/C/wide-C designs, each with its source URL and unpublished values labelled REPRESENTATIVE) or written inline; per signal the band-limited power spectral density, in-band power fractions, Gabor bandwidth, code jitter against C/N0 and spacing and the ranging accuracy, the acquisition search space, square-law detection probability and mean serial and code-parallel acquisition time, the spectral separation coefficient into and from GPS L1 C/A, Galileo E1, GPS L5, Galileo E5a, E5b and AltBOC with the C/N0 degradation, and the CW, wideband and matched J/S tolerance from the spectrum kind's SSC chain; a band trade of ionospheric delay, free-space loss, ranging accuracy at equal C/N0 and equal EIRP and jammer tolerance; and qualitative shape checks of a design against a described measurement",
            module: "leo_signal (LeoSignalScenario, SignalDesign, Component, Shape, code_jitter_m, gabor_bandwidth_hz, detection_probability, threshold_for_pfa, mean_acquisition_time_s, ssc_leo_into_gnss, ssc_gnss_into_leo, jammer_tolerance, gnss_victim, preset, public_signal)",
            tests: "leo_signal::tests (every_public_preset_parses_and_cites_a_url; detector_reduces_to_pfa_and_grows_with_snr; detection_probability_with_several_looks_matches_the_noncentral_chi_square; mean_time_of_a_perfect_detector_is_half_the_cells; compatibility_ssc_magnitudes_match_independent_quadrature; to_spectrum_band_is_consistent_with_the_design; jammer_tolerance_orders_cw_matched_wideband; e5_centred_signal_hits_e5a_and_e5b_equally; defaults_run_on_the_generic_band_preset; inline_signal_and_bad_inputs); tests/leo_signal_reference.rs (every bundled system-agnostic scenario runs with no workshop data, the band trade's ionospheric ratios equal (f_ref/f)^2 and its free-space differences 20 log10(f/f_ref), the jitter at the reference C/N0 sits between its Gabor bound and its unlimited-band form, the workshop-parameter scenario's E5 shape checks are consistent when that file is present, and no source file compiles that file in)",
            oracle: "The validated closed forms of the two rows above, the square-law false-alarm identity P_d(snr = 0) = P_fa and Holmes's mean acquisition time, and reduction to the spectrum kind's own SSC chain (the same Jammer::ssc code). The designs themselves are inputs: presets marked REPRESENTATIVE or WORKSHOP are not published specifications, enhanced Feher QPSK, code shift keying and OFDM spectra are approximated, and the shape checks compare shapes, not calibrated levels.",
            oracle_kind: InternalConsistency,
            status: Modelled,
        },
        VerificationItem {
            requirement: "Multi-band spectrum waterfall (UHF, L, S, C) with designed signals and per-band jammers",
            capability: "The `spectrum` kind extended beyond the L band: bands given as a preset signal design (drawn with every component, band-limited to the transmit bandwidth, C/N0 and J/S referred to the tracked component) or as a custom carrier and modulation; extra waterfall panels over any frequency range on the same timeline and colour scale; a wideband (barrage) jammer beside CW, narrowband, chirp and matched noise; per-band J/S and effective C/N0 from the unchanged spectral separation coefficient chain",
            module: "spectrum (Band::unit_psd, Band::tracked_power_dbw, BandDesign, BandCfg, PanelCfg, SpectrumScenario, Waveform, multi_band_svg); leo_signal (SignalDesign::to_spectrum_band)",
            tests: "tests/leo_signal_reference.rs (the multi-band waterfall runs with four panels, the UHF, L5-band, S and C jammers each deny only their own band, and a plain-band run is unchanged by the extension); leo_signal::tests::to_spectrum_band_is_consistent_with_the_design; spectrum::tests (agrees_with_the_jamming_kind_chain)",
            oracle: "Reduction to the existing spectrum chain and the jamming kind's anti-jam equation (a single-component band gives the same numbers as before the extension) and the signal spectra of the validated rows. The jammer powers, timeline, front-end bandwidths and the designed signals are inputs, and a designed signal is truncated at its transmit band (no out-of-band emission).",
            oracle_kind: InternalConsistency,
            status: Modelled,
        },
        // ── LEO-PNT pass and per-band link budget (`leo-pass`) ───────────────────
        VerificationItem {
            requirement: "Rain specific-attenuation coefficients for any band a LEO-PNT link uses",
            capability: "ITU-R (International Telecommunication Union, Radiocommunication Sector) P.838-3 equations (1) to (5): k_H, alpha_H, k_V, alpha_V from the Tables 1 to 4 curve fits, the path- and polarisation-dependent (k, alpha) and the specific attenuation k R^alpha; used by the `leo-pass` kind's rain term",
            module: "leo_link::itu (p838_coefficients, p838_k_alpha, rain_specific_attenuation_db_km)",
            tests: "tests/leo_link_reference.rs (p838_coefficients_reproduce_table5_to_its_printed_digits: all 115 rows of Table 5, 1 GHz to 1000 GHz, every coefficient within 0.6 of its last printed digit; worst observed 0.51)",
            oracle: "ITU-R P.838-3 (03/2005) Table 5, the Recommendation's own tabulated k_H, alpha_H, k_V, alpha_V, committed in tests/fixtures/leo_link/p838_3_table5.csv with the PDF URL and retrieval date. The table is rounded to its printed digits, so the bar is that rounding",
            oracle_kind: ExternalDataset,
            status: Validated,
        },
        VerificationItem {
            requirement: "Long-term slant-path rain attenuation on an Earth-space link",
            capability: "ITU-R P.618-14 section 2.2.1.1 steps 2 to 10 (slant and horizontal path below the rain height, horizontal reduction and vertical adjustment factors, A0.01 and its scaling to 0.001 % to 5 % of an average year), with the rain height (P.839) and R0.01 (P.837) as inputs because the engine carries neither digital map; applied per band and epoch by the `leo-pass` kind",
            module: "leo_link::itu (p618_rain_attenuation_db, RainPath)",
            tests: "tests/leo_link_reference.rs (p618_rain_attenuation_matches_the_itu_validation_examples: 56 cases at five sites, 14.25 and 29 GHz, 0.001 % to 1 %, within 1e-4 dB; observed 5e-6 dB)",
            oracle: "ITU-R Study Group 3 validation examples file CG-3M3J-13-ValEx-Rev8.3.0 for P.618-14, as tabulated by the ITU-Rpy validation pages, with each site's P.839-4 rain height from the same examples; committed in tests/fixtures/leo_link/p618_14_rain_attenuation.csv with the URLs and retrieval date. Validates the procedure given h_R and R0.01, not the maps",
            oracle_kind: ExternalDataset,
            status: Validated,
        },
        VerificationItem {
            requirement: "Tropospheric amplitude scintillation on an Earth-space link",
            capability: "ITU-R P.618-14 section 2.4.1 steps 3 to 9 (reference sigma from N_wet, effective path length, antenna averaging factor, fade depth for 0.01 % to 50 % of the time), with N_wet an input or computed from temperature, humidity and pressure by the ITU-R P.453-14 expressions; below 4 GHz the `leo-pass` kind flags the value as an extrapolation",
            module: "leo_link::itu (p618_scintillation_db, wet_refractivity, ScintillationPath)",
            tests: "tests/leo_link_reference.rs (p618_scintillation_matches_the_itu_validation_examples: 42 cases at seven sites, 14.25 and 20 GHz, within 1e-5 dB; observed 5e-7 dB)",
            oracle: "ITU-R Study Group 3 validation examples (CG-3M3J-13-ValEx-Rev8.3.0) for P.618-14 scintillation, with each site's P.453-14 N_wet from the same examples; committed in tests/fixtures/leo_link/p618_14_scintillation.csv with the URLs and retrieval date. The wet-refractivity expression from temperature and humidity is not covered by this row",
            oracle_kind: ExternalDataset,
            status: Validated,
        },
        VerificationItem {
            requirement: "Building entry loss for an indoor LEO-PNT user",
            capability: "ITU-R P.2109-2 Annex 1 equations (1) to (10) with Table 1: the loss not exceeded with probability P for traditional and thermally-efficient buildings at the elevation of the path at the facade, 80 MHz to 100 GHz; applied per band and epoch to an indoor user by the `leo-pass` kind (the UHF indoor case)",
            module: "leo_link::itu (p2109_building_entry_loss_db, BuildingClass); detection (normal_inv_cdf)",
            tests: "tests/leo_link_reference.rs (p2109_building_entry_loss_matches_the_itu_workbook: 568 values, 28 GHz at 0 deg and 2 GHz at 45 deg, both classes, P from 1e-7 to 0.998, within 0.001 dB)",
            oracle: "The ITU-R Study Group 3 Clutter and BEL validation workbook values, as transcribed in the reference MATLAB implementation's validation script (github.com/eeveetza/p2109), committed in tests/fixtures/leo_link/p2109_bel.csv with the URL and retrieval date. The workbook prints three decimals",
            oracle_kind: ExternalDataset,
            status: Validated,
        },
        VerificationItem {
            requirement: "First-order ionospheric delay per band, the ionosphere-free combination and free-space loss",
            capability: "Group delay 40.3 STEC/f^2 per band; the ionosphere-free coefficients f1^2/(f1^2 - f2^2) and -f2^2/(f1^2 - f2^2) and the noise amplification sqrt(a1^2 s1^2 + a2^2 s2^2) for any band pair; the free-space loss 20 log10(4 pi R f/c) of linkbudget::free_space_loss_db in its kilometre-megahertz form",
            module: "leo_link::iono (group_delay_m, iono_free_coefficients, iono_free_noise_amplification); leo_link (fspl_db); linkbudget (free_space_loss_db)",
            tests: "tests/leo_link_reference.rs (first_order_iono_reproduces_the_is_gps_200_group_delay_ratio: gamma = (77/60)^2 to 1e-12, L1/L2 and L1/L5 amplification 2.978 and 2.588; free_space_loss_is_the_friis_kilometre_megahertz_form: 32.4478 + 20 log d + 20 log f to 1e-4 dB); leo_link::iono::tests (delay_scales_as_one_over_f_squared; iono_free_combination_removes_the_first_order_delay)",
            oracle: "IS-GPS-200 section 20.3.3.3.3.2, which states the L1/L2 group-delay ratio gamma = (77/60)^2 that follows from first-order 1/f^2 scaling, and the Friis transmission formula (Proc. IRE, 1946). Validates the scaling laws, not a slant TEC",
            oracle_kind: ExternalDataset,
            status: Validated,
        },
        VerificationItem {
            requirement: "Maximum Doppler a static user sees from a LEO or MEO orbit",
            capability: "leo_link::geometry::max_static_user_range_rate: a search over every orbit position and every user on the satellite's horizon of a circular orbit, with the Earth turning, for the largest range rate, plus the orbital and largest Earth-fixed satellite speeds; reported per band as the Doppler envelope by the `leo-pass` kind and used as the cold-start search window of its low-energy model",
            module: "leo_link::geometry (max_static_user_range_rate, DopplerEnvelope, doppler_hz)",
            tests: "tests/leo_link_reference.rs (doppler_envelope_reproduces_the_pulsar_paper_table_1: Pulsar IOV 520 km 97 deg, Pulsar FOC polar 1080 km 97 deg, Pulsar FOC inclined 1080 km 53 deg and GPS 20180 km 55 deg; orbital speed, maximum ECEF speed, maximum relative speed and maximum L1- and L5-band carrier Doppler, 20 values, each within 0.05 %)",
            oracle: "Leclere, Marathe and Reid, Insights into Xona Pulsar LEO PNT: Constellation, Signals, and Receiver Design, ION GNSS+ 2025, arXiv 2509.19551, Table 1 (static receiver on a 6371 km sphere, Earth rotation the only other effect): 37751.7 / 33628.5 / 31813.4 / 4018.4 Hz on L1. Covers circular two-body orbits",
            oracle_kind: ExternalDataset,
            status: Validated,
        },
        VerificationItem {
            requirement: "A LEO-PNT pass and its per-band link budget against the MEO GNSS satellites in view",
            capability: "The `leo-pass` kind: satellites from a designed pass, elements, a TLE through SGP4 or a Walker constellation from constellation-design; per band and epoch the look angles, range, closed-form range rate and range acceleration (checked each run against central differences and reported), free-space loss, EIRP with an isoflux, Gaussian or flat pattern, a patch, hemispherical or isotropic user antenna, ITU-R P.676-10 Annex 2 gaseous attenuation, P.618 rain and scintillation, P.2109 building entry loss, polarisation mismatch, system noise temperature, C/N0, Doppler and Doppler rate, and the first-order delay from a Klobuchar or vertical-TEC slant TEC scaled by the Chapman fraction below the satellite; ionosphere-free pairs with code noise at the pass peak; Galileo or GPS carriers from their interface-document received powers through the same receiver",
            module: "leo_pass (LeoPassScenario); leo_link::geometry (design_pass, link_geometry, numerical_check, SatMotion, UserMotion); leo_link::antenna; leo_link::itu (p676_gaseous_attenuation_db); leo_link (system_noise_temperature_k, cn0_dbhz)",
            tests: "leo_pass::tests (the_leo_pass_is_a_bell_above_flat_gnss; closed_form_doppler_agrees_with_the_numerical_derivative: under 0.01 Hz and 0.01 Hz/s; indoor_uhf_suffers_less_building_loss_than_c_band; rain_attenuates_c_band_more_than_s_band; iono_delay_scales_as_one_over_f_squared_across_bands; a_fully_custom_band_needs_no_preset; a_walker_constellation_and_a_tle_satellite_both_run; defaults_run_with_no_preset_named_and_every_number_has_a_unit); leo_link::geometry::tests (kepler_velocity_is_the_derivative_of_the_position; a_designed_pass_reaches_the_requested_elevation; closed_form_range_rate_and_accel_match_central_differences_for_two_body_motion); leo_link::antenna::tests",
            oracle: "Closed forms and self-consistency: the range-rate and range-acceleration identities against numerical derivatives, the isoflux gain cancelling the range growth, the textbook polarisation-loss limits, the qualitative LEO-versus-GNSS observation (a bell-shaped pass of minutes peaking several dB above flat 44-51 dB-Hz GNSS carriers). The EIRPs and patterns are published received powers turned into an EIRP or representative choices, the gaseous term is the superseded P.676-10 simplified method, and nothing is compared with a measured LEO C/N0",
            oracle_kind: InternalConsistency,
            status: Modelled,
        },
        VerificationItem {
            requirement: "Named LEO-PNT system presets with stated sources, and a system-agnostic engine",
            capability: "leo_link::presets: generic multi-band (UHF, L, S, C), generic C band, Xona Pulsar X1/X5, Iridium STL, Starlink as a Doppler-only signal of opportunity, CentiSpace and an optional Celeste IOD preset, each with its source marked PUBLIC (with URL), REPRESENTATIVE or WORKSHOP, the workshop one in the optional Celeste IOD preset file, compiled in only when that file exists; every band and orbit overridable in a scenario, and a scenario may name no preset at all",
            module: "leo_link::presets (SystemPreset, BandPreset, all, by_id, gnss_meo); leo_pass (resolve_bands)",
            tests: "leo_link::presets::tests (every_preset_is_sourced_and_self_consistent; only_the_celeste_preset_is_sourced_from_the_workshop); leo_link::presets::xona_pulsar::tests (the_eirps_reproduce_the_published_minimum_power_at_ten_degrees; a_flat_pattern_lands_the_zenith_power_near_the_published_maximum: within 0.5 dB of -139.1 and -136.2 dBW); leo_link::presets::iridium::tests; leo_pass::tests (a_fully_custom_band_needs_no_preset)",
            oracle: "Transcription of the cited public figures and a consistency check: an EIRP set from a published minimum received power predicts the published maximum within 0.5 dB with a flat pattern. That is a check of the range spread, not a validation of any satellite's antenna; representative presets make no claim about a real system",
            oracle_kind: InternalConsistency,
            status: Modelled,
        },
        VerificationItem {
            requirement: "Low-energy positioning: time to first fix and energy per fix against duty cycle",
            capability: "leo_link::energy and the `leo-pass` kind's [iot] section: coherent integration capped by the Doppler rate, square-law non-coherent sums to a detection threshold, a Doppler-bin search over the orbit's static-user envelope (cold) or an aided window (hot), parallel or serial code search, navigation-message time on a cold start, energy per fix and battery life across fix intervals, for each LEO band and the GNSS signal",
            module: "leo_link::energy (fix_budget, duty_curve, IotReceiver, IotSignal); leo_pass (iot_section)",
            tests: "leo_link::energy::tests (stronger_signals_and_smaller_doppler_windows_fix_faster; the_doppler_rate_caps_the_coherent_time; battery_life_grows_with_the_fix_interval_toward_the_sleep_floor); leo_pass::tests (the_run_is_deterministic_and_bad_inputs_are_rejected)",
            oracle: "Internal consistency of a stated design model: every power, threshold and search choice is an input, and the model ignores bit-edge ambiguity, missed detection and re-acquisition. Not compared with a measured receiver",
            oracle_kind: InternalConsistency,
            status: Modelled,
        },
        // ── LEO navigation message (leo-navmsg) ─────────────────────────────────
        VerificationItem {
            requirement: "Global-average signal-in-space range error weights for any orbit altitude",
            capability: "leo_navmsg::sisre::sisre_weights: the radial weight w_R and the squared transverse weight w_AC^2 as averages of cos^2 and half sin^2 of the line-of-sight nadir angle over users uniformly distributed on the visible Earth cap above an elevation mask, for any orbit radius, by Simpson integration; used by every leo-navmsg SISRE figure (at 510 km, w_R 0.46 and w_AC^2 1/2.5)",
            module: "leo_navmsg::sisre (sisre_weights, StatsAcc)",
            tests: "leo_navmsg::sisre::tests (weights_reproduce_the_published_meo_and_geo_table — GPS 0.979 and 1/48.9, GLONASS 1/45.0, Galileo 0.984 and 1/61.1, BeiDou MEO 1/54.2, geostationary 0.992 and 1/126.2 at a 0 deg mask, each within 0.005 of w_R and 0.5 of 1/w_AC^2; leo_weights_shift_toward_the_transverse_axes — horizon nadir angle 67.8 deg at 510 km)",
            oracle: "The published SISRE weighting-factor table of Montenbruck, Steigenberger and Hauschild (2018), Multi-GNSS signal-in-space range error assessment - Methodology and results, Advances in Space Research 61(12):3020-3038, doi 10.1016/j.asr.2018.03.041: GPS 0.98 and 1/49, GLONASS 0.98 and 1/45, Galileo 0.98 and 1/61, BeiDou MEO 0.98 and 1/54, BeiDou IGSO/GEO 0.99 and 1/126. The same average evaluated at LEO radii gives the LEO weights; no published LEO table is pinned, so the LEO values are the validated method applied, not separately validated",
            oracle_kind: ExternalDataset,
            status: Validated,
        },
        VerificationItem {
            requirement: "Galileo ICD broadcast-ephemeris user algorithm as the base of a LEO navigation message",
            capability: "leo_navmsg::elements::kepler_point: the Galileo OS SIS ICD Keplerian evaluation (Kepler's equation, second-harmonic corrections, Earth-fixed node) written separately from the engine's RINEX evaluator, returning the position with the argument of latitude, inclination and node the along/cross/radial correction frame is built from, and the Liu et al. 2025 extension terms",
            module: "leo_navmsg::elements (kepler_point, kepler_frame, ephemeris_at, sat_state)",
            tests: "tests/leo_navmsg_reference.rs (the_galileo_user_algorithm_reproduces_rtklib_to_a_millimetre — four real Galileo broadcast ephemerides E10, E19, E24, E25 at tk = 0, +/-600, +/-1800, +/-3600 s, every axis within 1 mm of RTKLIB; real_galileo_records_survive_the_binary_frame_and_the_text_block — within 5 mm after the Kshana binary frame and 1 mm after the RINEX-style block)",
            oracle: "RTKLIB 2.4.2-p13 eph2pos ECEF positions (an independent implementation of the same ICD algorithm) for real BKG/IGS broadcast records of 2024-09-10, both committed with provenance in tests/fixtures/rinex_sp3_interop (NOTICE, rinex_ecef_reference.txt, brdc_multignss_slice.rnx). This validates the Keplerian user algorithm; the along/cross/radial corrections added on top are covered by their own rows, and the Liu terms by the Liu et al. 2025 22-parameter row",
            oracle_kind: ExternalDataset,
            status: Validated,
        },
        VerificationItem {
            requirement: "CRC-24Q frame check for the LEO navigation message",
            capability: "leo_navmsg::codec::crc24q: generator polynomial 0x1864CFB, initial value 0, no reflection, no final XOR, the check the Kshana LEO frame carries over every preceding byte",
            module: "leo_navmsg::codec (crc24q, encode, decode)",
            tests: "leo_navmsg::codec::tests (crc24q_matches_the_catalogue_check_value — 0xCDE703 for the ASCII string 123456789; crc24q_matches_the_rtcm_1005_example_frame — the three check bytes 0x360B98 of the RTCM 10403 message-type 1005 example frame, and zero over the whole frame)",
            oracle: "The CRC catalogue check value for these parameters (reveng.sourceforge.io CRC catalogue, CRC-24/LTE-A: width 24, poly 0x864CFB, init 0, check 0xCDE703), which are the CRC-24Q parameters of RTCM 10403 and the Galileo OS SIS ICD, and the message-type 1005 example frame printed in RTCM 10403",
            oracle_kind: ExternalDataset,
            status: Validated,
        },
        VerificationItem {
            requirement: "LEO broadcast-ephemeris fitter and signal-in-space range error versus fit interval and update period",
            capability: "The `leo-navmsg` kind's fitter and trade: a truth orbit integrated with zonal J2-J6 or EGM2008 gravity to the chosen degree and drag, and a seeded free or steered clock; a Levenberg-Marquardt fit of the Galileo Keplerian set on non-singular elements with weak priors, then along-track, cross-track and radial correction polynomials by linear least squares; the clock polynomial fitted net of the user's relativistic term; SISRE (orbit-only and with clock) over usage periods centred in their fit windows, versus fit interval and update period. Validated part: the 16-parameter Keplerian fit and its orbit-only SISRE against fit interval on real precise orbits, and the integrated J2-J6/EGM2008(20, 70)/drag truth orbit against Orekit 12.2 within 4.6 mm over 6 h (bar 2 cm, same density input); the correction polynomials, the clock fit (seeded free or steered clock) and the update-period trade remain modelled",
            module: "leo_navmsg::fit (fit_message, lstsq, polyfit); leo_navmsg::truth (TruthOrbit, TruthClock); leo_navmsg (sequence_stats, LeoNavmsgScenario)",
            tests: "leo_navmsg::tests::a_two_body_truth_is_recovered_by_the_keplerian_fit_to_a_millimetre; leo_navmsg::tests::the_user_algorithm_reproduces_the_fitted_truth_to_a_millimetre_with_corrections; leo_navmsg::tests::the_clock_fit_returns_the_truth_clock_through_the_user_relativistic_term; leo_navmsg::tests::keplerian_sisre_grows_with_the_fit_interval_and_the_corrections_fix_it (monotonic growth from 1 to 15 minutes and at least a threefold improvement at 15 minutes); leo_navmsg::tests::defaults_run_encode_decode_without_any_preset_and_are_deterministic; tests/leo_navmsg_fit_real_orbit_oracle.rs::fitted_sisre_matches_liu_2025_on_real_orbits (TU Graz ITSG reduced-dynamic orbits of GRACE-A, GRACE-C, Sentinel-2A and Sentinel-6A fitted over 20 and 30 min arcs: along, cross and radial RMS 0.804 to 1.087 and SISRE 0.716 to 0.809 of Liu et al. 2025, inside 1.5x; SISRE weights within 0.0007 of its Table 2); tests/leo_navmsg_full_claim_oracle.rs::integrated_truth_orbit_matches_orekit_within_2_cm_over_6_h (Orekit 12.2 + Hipparchus 3.1, same initial state and density input: worst 3.95 mm two-body, 3.92 mm J2-J6 and EGM2008 to degree 20 and 70, 4.55 mm EGM2008 degree 20 with drag at 400 km, bar 0.02 m over 6 h); internal cross-check, not an oracle: tests/leo_navmsg_full_claim_oracle.rs::corrections_clock_fit_and_update_period_trade_agree_with_an_internal_cross_check_on_grace_fo",
            oracle: "Real precise science orbits as truth (TU Graz IfG/ITSG operational reduced-dynamic orbits, free for any use with acknowledgment; SHA-256 values in the fixture NOTICE) fitted by the 16-parameter set over 20 and 30 min arcs, against the statistics Liu et al. 2025 (Remote Sensing 17(16):2894, CC BY 4.0) publish for the same satellites and days: along, cross and radial RMS each within 1.5x (measured 0.804 to 1.087), SISRE within 1.5x (measured 0.716 to 0.809) and SISRE weights within 0.005 of its Table 2 (measured 0.0007); tolerances fixed before the comparison. The per-component gate gives the test its teeth: zeroing the inclination rate leaves every SISRE ratio inside 1.5x but fails the cross-track gate. The uniform 0.72 to 0.81 SISRE ratio is the paper's: its printed SISRE values use Table 2's weights unsquared rather than its own Eq. 9, which Kshana follows (Montenbruck et al. 2018). The integrated truth orbit (zonal J2-J6, EGM2008 to degree 20 and 70, drag) agrees with Orekit 12.2 (CS GROUP, Apache-2.0) and Hipparchus 3.1, propagated from the same initial state in the same frames with the same density input, within 4.55 mm over 6 h (bar 0.02 m fixed before the run, pre-registration 65e4d46c). Outside the claim: the correction polynomials, the clock fit and the update-period trade, which keep internal checks (a two-body truth recovered by the 16-parameter set to below 1 mm, and an internal numpy cross-check of the exported messages on GRACE-FO with its CLK1B clock, which was written and run by this project and is not an independent oracle)",
            oracle_kind: ExternalDataset,
            status: Validated,
        },
        VerificationItem {
            requirement: "Mid-pass LEO navigation message update with a continuity check at the switch",
            capability: "The `leo-navmsg` midpass-update analysis: the highest pass over a user within a search span, messages on a global schedule with usage periods centred in their fit windows, and at each switch the 3D position jump, the clock jump, the user pseudorange jump, the largest jump over any visible line of sight (closed form over the nadir cone), the range error before and after, and PASS/FAIL against a threshold",
            module: "leo_navmsg (LeoNavmsgScenario::midpass, worst_case_jump, elevation, geodetic_to_ecef)",
            tests: "leo_navmsg::tests::a_mid_pass_update_is_continuous (every switch's range jump equals the change in range error, and a corrected 300 s fit updated every 150 s passes a 5 cm threshold); leo_navmsg::tests::a_keplerian_only_update_over_a_long_interval_is_flagged; leo_navmsg::tests::worst_case_jump_bounds_every_line_of_sight (the closed form bounds a dense sampling of the cone)",
            oracle: "Internal consistency (the jump identity and the cone bound against brute-force sampling). The threshold is an input; no published LEO continuity requirement is pinned",
            oracle_kind: InternalConsistency,
            status: Modelled,
        },
        VerificationItem {
            requirement: "Documented binary encoding of the LEO navigation message with a quantisation-error budget",
            capability: "leo_navmsg::codec: Kshana's own frame (preamble, version, model, length, payload, CRC-24Q) for the four ephemeris models, the clock polynomial, SVID, issue of data, band, health, a Klobuchar set, NeQuick-G coefficients and UTC parameters, every field with a stated width and step (field_table), quantisation with range refusal, and a budget of the largest position and clock change a half-step change of each field makes over the validity window",
            module: "leo_navmsg::codec (encode, decode, write_payload, read_payload, field_table, quantisation_budget)",
            tests: "leo_navmsg::codec::tests (signed_fields_round_trip_through_the_bit_packer; week8_resolves_near_the_reference); leo_navmsg::tests::every_model_round_trips_through_the_binary_frame (every model within 2 mm of the exact message after decoding, re-encoding bit-identical, a flipped bit rejected by the CRC); leo_navmsg::tests::every_field_of_the_budget_stays_under_a_millimetre",
            oracle: "Round-trip identities and the budget itself. The format is Kshana's own, modelled on the published message components and the Galileo ICD field set; it is not the bit layout of Celeste or any other system (none is public), so there is no external layout to validate against",
            oracle_kind: InternalConsistency,
            status: Modelled,
        },
        VerificationItem {
            requirement: "RINEX-4-style and CSV exports of LEO navigation messages",
            capability: "leo_navmsg::text: a RINEX-4-style block (> EPH record header, satellite and epoch line with three clock terms, D19.12 broadcast-orbit lines) with system letter L and record types KP16, KRAC, LU22 and APOL, labelled in every header as a Kshana extension not part of RINEX 4.02, and a CSV table with a default column schema and preset schemas, each with an importer",
            module: "leo_navmsg::text (rinex_export, rinex_import, csv_export, csv_import, calendar, from_calendar)",
            tests: "leo_navmsg::text::tests (calendar_round_trips_and_knows_the_gps_origin; d19_is_rinex_shaped); leo_navmsg::tests::rinex_and_csv_round_trips (every model within 0.1 mm after the text block, the CSV exact)",
            oracle: "Round trips and the calendar arithmetic. RINEX 4.02 defines no LEO navigation records (IGS RINEX 4.02), so the layout is a documented extension with arXiv 2401.17767 cited as prior art; no external reader of it exists to check against",
            oracle_kind: InternalConsistency,
            status: Modelled,
        },
        VerificationItem {
            requirement: "Liu et al. 2025 22-parameter LEO ephemeris model and its fit on real precise orbits",
            capability: "the Liu22 variant of leo_navmsg::elements::EphemerisModel, evaluated by kepler_point with Liu22Extra: the 16-parameter set plus a semi-major-axis rate a_dot, a mean-motion rate n_dot entering as n = sqrt(mu/A0^3) + dn + n_dot tk, transcribed from the paper Eq. 1 (the fit comparison does not depend on this scale convention, so the meaning of a transmitted nDot value is not validated here), and once- and three-per-revolution radius harmonics Crs1, Crc1, Crs3, Crc3 on the uncorrected argument of latitude. Its fit by leo_navmsg::fit::fit_message takes the paper Section 2.3 start and estimator (every correction starts at zero; plain least squares with no priors; the paper 100-iteration cap), but stops on Kshana parameter-convergence rule (every step below 1e-3 of its formal sigma) instead of the paper rule of an RMS change below 0.1 mm. Fitted over 20 and 30 minute arcs of a tabulated precise orbit",
            module: "leo_navmsg::elements (kepler_point, Liu22Extra); leo_navmsg::fit (fit_message, fit_kepler, initial_params, formal_sigma); leo_navmsg::truth (TruthOrbit)",
            tests: "tests/leo_navmsg_fit_real_orbit_oracle.rs::liu22_model_matches_the_published_sisre (four paper days: along, cross, radial and SISRE ratios 0.755 to 1.138 of Liu et al. 2025, inside 1.5x); tests/leo_navmsg_fit_real_orbit_oracle.rs::liu22_holds_on_held_out_days (eight held-out days, two arcs each: 0.683 to 1.186)",
            oracle: "Measured: TU Graz IfG/ITSG operational reduced-dynamic orbits (free for any use with acknowledgment; SHA-256 values in the fixture NOTICE) of GRACE-A, GRACE-C, Sentinel-2A and Sentinel-6A are the truth, fitted over 20 and 30 min arcs, and compared with the 22-parameter rows (a_dot, n_dot, Crs3, Crc3, Crs1, Crc1) of Tables 4, 5, 6 and 8 of Liu, Su, Xie, Zhou and Qu (2025), Remote Sensing 17(16):2894, doi 10.3390/rs17162894 (CC BY 4.0; numbers cited, not vendored). Bars fixed before the first comparison: along, cross and radial RMS each within 1.5x two-sided, and SISRE within 1.5x, for every satellite and both arc lengths. The round-2 re-run was pre-registered (aa559785) before the engine change and before the held-out orbits were fetched: the paper Eq. 1 and Section 2.3 fit, plus two new held-out days per satellite against the same printed values. Measured: every paper-day ratio 0.755 to 1.138, and every held-out ratio 0.683 to 1.186. Disclosed: the first run 1.71 (Sentinel-2A) and 1.86 (Sentinel-6A) 20 min along-track ratios were known before the re-run. The lowest held-out SISRE ratios sit near the 0.667 lower bound because the paper printed SISRE uses Table 2 weights unsquared (see the 16-parameter fitter row). The pre-registration mis-stated the paper stop rule (the paper stops on an RMS change below 0.1 mm); the pre-registered parameter-convergence rule was kept. Mutation: restoring zero-centred priors gives Sentinel-6A 20 min along-track 1.08 against 0.70 cm (1.54), which fails. Reviewer probe: the pre-0.30 convention (a factor 1/2 on n_dot) leaves every figure unchanged, so the comparison constrains the function space of the 22-parameter model and the quality of its fit, not the n_dot convention. Outside the claim: the ATOMIC ECEF polynomial and the synthetic five-altitude model-comparison table, which have their own MODELLED row",
            oracle_kind: ExternalDataset,
            status: Validated,
        },
        VerificationItem {
            requirement: "ATOMIC zero-clock ECEF polynomial and the synthetic five-altitude LEO model comparison",
            capability: "the EcefPoly variant of leo_navmsg::elements::EphemerisModel: a per-axis ECEF polynomial with no clock terms, the relativistic term from -2 r.v/c^2, scored against a steered clock. Also the model-comparison analysis (liu_comparison over LIU2025_TABLE), which fits the 22-parameter model at the paper five altitudes over 20-minute arcs of a Kshana-integrated orbit and prints the result beside the published SISRE",
            module: "leo_navmsg::elements (EcefPoly, ephemeris_at); leo_navmsg (liu_comparison, LIU2025_TABLE)",
            tests: "leo_navmsg::tests::liu22_beats_the_16_parameter_set_over_a_20_minute_arc; leo_navmsg::tests::the_ecef_polynomial_fits_a_minute_to_millimetres; leo_navmsg::tests::every_preset_resolves_and_the_atomic_preset_selects_the_zero_clock_polynomial",
            oracle: "ATOMIC model facts from InsideGNSS (6th-order polynomial, about one minute validity, 30 s refresh, clock steered, 24 cm clock error). These are descriptive facts with no published numbers to compare against. The five-altitude table prints Liu et al. 2025 SISRE (8.88, 6.21, 2.87, 2.11 and 0.75 cm at 320, 475, 786, 966 and 1336 km over a 20-minute arc) beside Kshana fit on its own integrated orbit (4.25, 2.87, 2.20, 1.25 and 0.51 cm; ratios 0.46 to 0.77), not pinned, because the paper fitted real precise orbits and the truths differ. The 22-parameter model and fit themselves are validated against real orbits in the row Liu et al. 2025 22-parameter LEO ephemeris model and its fit on real precise orbits. 0.30 revision: the table figures moved with the paper-convention fit (GRACE-A 5.40 -> 4.25 cm, GRACE-C 4.12 -> 2.87, Sentinel-2A 2.95 -> 2.20, HY-2A 2.38 -> 1.25, Sentinel-6A 0.70 -> 0.51)",
            oracle_kind: InternalConsistency,
            status: Modelled,
        },
        VerificationItem {
            requirement: "Single-frequency ionospheric and UTC services of a LEO navigation message",
            capability: "leo_navmsg::services: the Klobuchar broadcast delay at any carrier (the engine's L1 model scaled by (f_L1/f)^2), the NeQuick-G effective ionisation level Az = ai0 + ai1 mu + ai2 mu^2 with the all-zero and [0, 400] sfu rules, and system time to UTC with the ICD's three leap-second cases",
            module: "leo_navmsg::services (klobuchar_delay_m, effective_ionisation_level, system_to_utc)",
            tests: "leo_navmsg::services::tests (klobuchar_scales_with_inverse_frequency_squared — the L1 value is RTKLIB's 6.1278 m; nequick_az_rules; utc_without_an_event_is_tow_minus_leap_seconds_folded_to_a_day; utc_drift_terms_follow_the_icd_formula; an_inserted_leap_second_reads_86400_at_the_end_of_the_day); tests/leo_navmsg_services_gnsstk_oracle.rs::services_match_gnsstk_and_erfa (Klobuchar at L1, L2 and L5 over 4 320 cases, worst 7.0e-13 m; Az over 222 coefficient sets including the all-zero and 400 sfu rules, worst 5.7e-14 sfu; UTC drift over 50 cases, worst 3.6e-15 s; the three leap-second cases over 21 602 instants across the real 2015 and 2016 leap seconds, 0 s)",
            oracle: "GNSSTk 15.3.1 (ARL:UT, LGPL-3.0, commit 55ea3344, run as a separate program through a harness; no GNSSTk code is vendored): getIonoCorr of KlobucharIonoNavData at L1, L2 and L5, getEffIonoLevel of NeQuickIonoNavData for Az with the all-zero and [0, 400] sfu rules, and getOffset of GPSLNavTimeOffset for the UTC drift, within 1e-3 m, 1e-6 sfu and 1e-9 s; and ERFA via pyerfa 2.0.1.5 (BSD-3), which derives UTC from the IERS leap-second table, for the ICD three leap-second cases across the real 2015-06-30 and 2016-12-31 leap seconds including the 23:59:60 reading, within 1e-9 s (GNSSTk does not implement the ICD case (b) day-length rule, so it was not used there, as written in the pre-registration). Inputs are the real IGS BRDC header coefficients. Pre-registered (6a66994b; amendment 88807a7e committed a 21 602-row subset of the leap-second grid before any Kshana value was compared). The NeQuick electron-density integration is not implemented, and no correction is made for a LEO satellite flying inside the ionosphere",
            oracle_kind: ExternalDataset,
            status: Validated,
        },
        // ── Fused MEO + LEO positioning, navigation and timing ──────────────────
        VerificationItem {
            requirement: "Doppler a ground receiver must handle from a LEO navigation satellite",
            capability: "Exact range rate of a satellite whose Earth-fixed position and velocity come from a two-body orbit with the secular J2 drift and the Earth's rotation (leo_fusion::geom::EarthOrbit::state, velocity the exact time derivative of the position), turned into Doppler at a carrier; the largest absolute Doppler, Doppler rate and jerk above an elevation mask over a window (leo_fusion::doppler::doppler_envelope), reported per LEO system by the `leo-pvt` kind in doppler mode",
            module: "leo_fusion::geom (EarthOrbit); leo_fusion::doppler (range_rate, doppler_envelope)",
            tests: "tests/leo_doppler_reference.rs (iridium_doppler_reaches_the_published_36_khz: one satellite at 780 km and 86.4 deg flown for a day at 1621 MHz over four latitudes, maximum within 5% of 36 kHz; xona_pulsar_x1_doppler_lies_in_the_published_32_to_34_khz: one satellite of each published shell, 1080 km at 53 and 97 deg, 1593.3225 MHz, the constellation maximum inside 32 to 34 kHz with no widening (33.6 kHz, set by the 97 deg shell; the 53 deg shell alone peaks at 31.8 kHz)); leo_fusion::geom::tests (velocity_is_the_time_derivative_of_the_position)",
            oracle: "Published figures reproduced from the stated orbit and carrier: Iridium Doppler up to plus or minus 36 kHz (Resilient Navigation and Timing Foundation, Recent PNT improvements and test results based on LEO satellites) and Xona Pulsar X1 maximum Doppler 32 to 34 kHz (Leclère, Marathe and Reid, ION GNSS+ 2025, arXiv:2509.19551). The Iridium figure is a rounded upper bound, hence the 5% bar. The Doppler rate and jerk are reported but not validated: the modelled overhead-pass jerk of Pulsar X1 is about 1.0 Hz/s^2 against the published 1.26",
            oracle_kind: ExternalDataset,
            status: Validated,
        },
        VerificationItem {
            requirement: "Positioning from LEO Doppler, single- and multi-satellite, with clock-drift and velocity states",
            capability: "Batch Gauss-Newton positioning from range rate with analytic partials (d rho_dot / d r = -(I - u u^T)(v_s - v_u)/rho, d/dv = -u, d/d drift = 1), a constant user velocity as an option, a height pseudo-measurement for a surface user, damped steps; the formal covariance at the truth; along-track, cross-track and vertical projections; the single-pass accuracy against the user's cross-track offset; the time of closest approach. The `leo-pvt` kind's doppler mode adds the error against window length and a Doppler-only signals-of-opportunity mode (the starlink-sop preset)",
            module: "leo_fusion::doppler (solve, formal_covariance, single_pass_geometry, offset_site, closest_approach); leo_fusion::pvt_kind (run_doppler)",
            tests: "leo_fusion::doppler::tests (range_acceleration_obeys_the_kinematic_identity_and_vanishes_doppler_at_closest_approach; noise_free_multi_satellite_doppler_recovers_the_user: to 1 mm and the drift to 1e-6 m/s; a_single_pass_has_a_mirror_solution_across_the_ground_track; the_cross_track_error_grows_as_the_pass_goes_overhead; velocity_states_are_recovered_for_a_moving_user); leo_fusion::pvt_kind::tests (doppler_positioning_improves_with_the_window_and_is_deterministic: the weighted residual RMS in [0.8, 1.2] and the error under four formal sigmas); tests/leo_fusion_scenarios.rs (leo_doppler_positioning_forms_a_fix_and_the_cross_track_error_explodes_overhead; starlink_doppler_only_mode_runs_without_ranging)",
            oracle: "Internal consistency: noise-free recovery, the kinematic identity rho_ddot = (|v|^2 - rho_dot^2 + d.a)/rho differentiated numerically, zero Doppler at closest approach, the mirror solution of a single pass, and seeded errors against the formal covariance. The Starlink figure of Kozhaya, Saroufim and Kassas (NAVIGATION 72(1), 2025: about 2 m in 20 s with three satellites) is a comparison only: the modelled receiver, with a perfect ephemeris and every error in a 30 Hz Doppler sigma, is several times less accurate over the same window, and the paper's receiver and measurement rate are not reproduced",
            oracle_kind: InternalConsistency,
            status: Modelled,
        },
        VerificationItem {
            requirement: "Joint GNSS and LEO pseudorange positioning with inter-system biases and per-signal error models",
            capability: "Weighted least-squares Gauss-Newton fixes over any mix of systems, one receiver clock per system (the inter-system bias estimated with the position) or a known broadcast offset on the reference time scale; per-measurement sigmas supplied by the caller, by default the engine's delay-lock-loop thermal noise (navsignal::dll_code_jitter_chips) at the C/N0 of the elevation combined with the signal-in-space range error; unweighted DOP (GDOP, PDOP, HDOP, VDOP, TDOP) in the local geodetic frame, formal east-north-up sigmas and the bias sigmas; the `leo-pvt` joint mode compares GNSS-only, LEO-only and fused fixes and sweeps the DOP against the number of LEO satellites added",
            module: "leo_fusion::joint_pvt (solve, dop, code_sigma_dll_m, SystemClock); leo_fusion::system (SystemCfg, System); leo_fusion::pvt_kind (run_joint)",
            tests: "leo_fusion::joint_pvt::tests (dop_matches_the_hand_derived_zenith_plus_three_horizon_case: HDOP = VDOP = sqrt(4/3), TDOP = sqrt(1/3), PDOP = sqrt(8/3), GDOP = sqrt(3) to 1e-9; a_lone_satellite_with_its_own_clock_adds_nothing_and_a_known_offset_does; a_noise_free_fix_recovers_position_clock_and_inter_system_bias; seeded_fixes_agree_with_their_formal_covariance; dll_noise_is_the_textbook_figure_for_gps_l1_ca); leo_fusion::pvt_kind::tests (fusing_leo_never_worsens_the_median_pdop_and_the_isb_is_recovered); tests/leo_fusion_scenarios.rs (meo_leo_fusion_beats_gnss_alone_and_recovers_the_leo_bias); tests/joint_pvt_dual_freq_itrf_rtklib_oracle.rs::dual_frequency_finding_is_pinned; tests/joint_pvt_precise_itrf_rtklib_oracle.rs::precise_product_finding_is_pinned",
            oracle: "A hand-derived four-satellite DOP (one satellite at the zenith and three on the horizon 120 deg apart, whose normal matrix inverts by hand), the structural identity that a system with its own clock and one satellite adds no geometry, noise-free recovery of position, clock and bias, and seeded errors against the covariance. Internal checks only; not compared with a receiver's output. 0.30 external comparison, a finding (stays MODELLED): on a multi-GNSS IGS day (ABMF 2018-05-13, GPS and Galileo C1C, broadcast ephemeris, Klobuchar) the inter-system bias agrees with RTKLIB v2.4.2-p13 rnx2rtkp (median difference -0.11 ns after the 0.30 broadcast group-delay fix, -0.35 ns before; bar 1 ns), but only 93.6 % of 280 epochs (93.2 % before the fix) are within 3 m of the ITRF2020 coordinate against the pre-registered 95 %. RTKLIB itself reaches 88.2 % on the same data, so the bar is beyond single-frequency broadcast positioning at this station and day rather than a solver discrepancy; the comparison test is committed ignored. 0.30 round 2, stricter inputs at the unchanged 3 m / 95 % / 1 ns bar, a finding (stays MODELLED): with the Galileo E1/E5a ionosphere-free pair (pre-registered 6927e039) 79.9 % of epochs are within 3 m (RTKLIB 67.9 %); with precise CODE MGEX orbits, clocks, satellite antenna offsets and code biases (pre-registered 7d8c3597) 94.2 % (RTKLIB 94.1 %), and the inter-system bias differs from RTKLIB by -1.03 ns because RTKLIB single mode ignores satellite antenna offsets (+0.04 ns when both omit them)",
            oracle_kind: InternalConsistency,
            status: Modelled,
        },
        VerificationItem {
            requirement: "Precise point positioning convergence with GNSS only and with LEO augmentation",
            capability: "A float PPP extended Kalman filter on ionosphere-free code and phase: static coordinates, a white receiver clock, one inter-system bias per extra system, a random-walk zenith wet delay mapped by 1/sin(elevation), a float ambiguity per satellite arc added at rise and dropped at set, and the precise orbit-and-clock error common to a satellite's code and phase, processed as one correlated two-row update in a Joseph-stabilised form; measurements simulated from the same model; convergence time (errors below the thresholds until the end of the run), error curves and the run-averaged position NEES for GNSS only and each LEO case, run as the `leo-ppp` kind",
            module: "leo_fusion::ppp (run, PppScenario, LI_2019)",
            tests: "leo_fusion::ppp::tests (the_filter_is_consistent_over_monte_carlo_seeds: 24 seeds, run-averaged NEES mean in [2.4, 3.6] and at least 75% of epochs inside the two-sided 95% chi-square band; measured with 150 seeds, mean 2.84 GNSS only and 2.87 with LEO; leo_augmentation_shortens_convergence; same_seed_same_answer_and_every_number_has_a_unit); tests/leo_fusion_scenarios.rs (ppp_convergence_of_the_bundled_scenario_shortens_monotonically)",
            oracle: "The NEES chi-square test is an internal consistency check (truth and filter share the model). The trend is compared with Li et al., LEO constellation-augmented multi-GNSS for rapid PPP convergence, J. Geod. 93:749-764 (2019), doi 10.1007/s00190-018-1195-2: multi-GNSS 9.6 min shortened to 7.0, 3.2, 2.1 and 1.3 min with 60, 96, 192 and 288 LEO satellites. The bundled scenario gives 7.4, 4.8, 3.2, 2.7 and 2.3 min with its own representative 1000 km, 60 deg shells, noise and stations; the paper's constellations, noise and convergence definition are not reproduced, so this is a MODELLED consistency of the trend (monotone shortening, the largest constellation under a third of the GNSS-only time), not a validation",
            oracle_kind: ExternalDataset,
            status: Modelled,
        },
        VerificationItem {
            requirement: "5G non-terrestrial-network positioning accuracy from signal bandwidth",
            capability: "The Cramér-Rao bound on time of arrival from the root-mean-square (Gabor) bandwidth, c/(2 pi beta sqrt(2 (C/N0) T)), for a flat OFDM spectrum (beta = B/sqrt(12)), a band-limited BPSK spectrum (closed-form numerator) or any spectrum by quadrature, and on the frequency of a complex tone, sqrt(3/(2 pi^2 (C/N0) T^3)); downlink time-of-arrival fixes with an unknown receiver clock and a single-satellite Doppler fix over a pass in the 3GPP n256 MSS S band, run as the `ntn-positioning` kind",
            module: "leo_fusion::ntn (gabor_bandwidth_flat_hz, gabor_bandwidth_bpsk_hz, gabor_bandwidth_numeric_hz, rms_duration_numeric_s, toa_crb_sigma_m, doppler_crb_sigma_hz, frequency_crb_sigma_hz, NtnScenario::geometry, NtnScenario); leo_fusion::joint_pvt (formal_sigma_enu)",
            tests: "leo_fusion::ntn::tests (the_numerical_rms_bandwidth_matches_the_closed_forms; the_range_bound_scales_as_one_over_bandwidth_and_root_cn0: 0.4157 m by hand at 5 MHz, 45 dB-Hz, 0.1 s; the_frequency_bound_is_the_complex_tone_crlb; defaults_run_wider_is_better_and_every_number_has_a_unit); tests/leo_fusion_scenarios.rs (ntn_wide_channel_bounds_far_tighter_than_the_narrow_one); tests/ntn_crlb_published_value_oracle.rs (ssb_bounds_reproduce_the_published_values; ntn_fix_covariances_match_numpy; bpsk_rms_bandwidth_reproduces_betz_table_1)",
            oracle: "Published worked values (P1): Bachl, Lei and Nabeel, arXiv:2608.10270 (2026), single-SSB bounds of NR NTN reproduced from the 3GPP TS 38.211 SSB map through Kshana own numeric functions (W_rms 1.9616 vs 1.96 MHz, sigma_t 38.755 vs 39 us, sigma_f 100.79/87.28 vs 101/87 Hz, sigma_rho 0.5970/0.5831 vs 0.60/0.58 m, each within half a unit of the printed last digit); Betz 2001 Table 1 BPSK-R RMS bandwidths (1.128/3.477 vs 1.1/3.5 MHz, supplementary); the time-of-arrival and Doppler fix covariances agree with numpy 2.4.6 numpy.linalg.inv on the exported geometry (P2; 5e-15 and 1.2e-5 relative, bars 1e-5 and 1e-3). Pre-registered (9f2875db; part C 0d66dccd). The engine fix joint_pvt::formal_sigma_enu (the bound evaluated at the true position, not the noisy fix) was written after the first 200 kHz run failed at 6.5e-5 and was re-run at the unchanged tolerance. The flat-spectrum and complex-tone forms the scenario runs (gabor_bandwidth_flat_hz, doppler_crb_sigma_hz) reach the P1 check through in-crate identity unit tests. Bounds on a multipath-free channel, not achieved accuracy. 0.30 revision: ntn-5g-positioning toa_median_sigma_3d_m 2.0903959 -> 2.0903962 m (NR 5 MHz) and 25.938613 -> 25.938839 m (NB 200 kHz)",
            oracle_kind: ExternalDataset,
            status: Validated,
        },
        VerificationItem {
            requirement: "LEO-assisted time transfer to UTC against C/N0 and the receiver oscillator",
            capability: "Clock measurements from every LEO satellite in view at a known position, combined by inverse variance from the pseudorange noise model, filtered by a two-state (phase, frequency) Kalman filter whose process noise is the oscillator class's white and random-walk frequency noise (slot_timing::ClockNoise, clock_state::ClockClass; the coast variance of holdover::coast_phase_variance), a seeded truth clock from the same levels, and the IS-GPS-200 section 20.3.3.5.2.4 system-time-to-UTC expression with a broadcast-offset uncertainty added as a per-run bias; the `leo-pvt` timing mode sweeps oscillators and C/N0 offsets",
            module: "leo_fusion::timing (simulate, utc_offset_s, system_to_utc_s); leo_fusion::pvt_kind (run_timing)",
            tests: "leo_fusion::timing::tests (the_utc_offset_follows_the_is_gps_200_expression; continuous_tracking_approaches_the_measurement_floor_and_gaps_cost_time; the_filter_is_consistent_over_seeds; the_utc_offset_uncertainty_sets_a_floor); tests/leo_fusion_scenarios.rs (leo_timing_error_grows_as_the_c_n0_falls)",
            oracle: "Internal consistency: the published offset expression evaluated by hand, the normalised error over 40 seeds, and the floor set by the offset uncertainty. The NIST figure for Iridium timing receivers with a miniature atomic clock (under 40 ns from UTC(NIST) over 40 days) is a comparison only; the bundled Iridium scenario gives 10 to 11 ns RMS at nominal power with its representative 5 m range error. Flicker frequency noise and ionospheric delay are not simulated",
            oracle_kind: InternalConsistency,
            status: Modelled,
        },
        VerificationItem {
            requirement: "LEO coverage and dilution of precision for polar and Arctic users against MEO GNSS",
            capability: "Satellites in view and median PDOP, HDOP and VDOP with availability against latitude, over sampled longitudes and epochs, for the MEO GNSS systems alone, the LEO systems alone and all of them, each system with its own mask and clock model, run as the `leo-pvt` polar mode",
            module: "leo_fusion::polar (latitude_sweep); leo_fusion::joint_pvt (dop)",
            tests: "leo_fusion::polar::tests (gps_vertical_geometry_weakens_at_the_pole_and_a_polar_leo_shell_restores_it); tests/leo_fusion_scenarios.rs (a_polar_leo_constellation_fills_the_sky_where_gnss_vertical_geometry_weakens); tests/leo_polar_coverage_orekit_oracle.rs (the_polar_sweep_agrees_with_orekit_and_numpy_on_the_given_states; the_committed_states_and_grid_are_the_ones_the_polar_mode_runs)",
            oracle: "Internal consistency with the known geometry: MEO orbits at 55 to 56 deg leave the polar sky equatorward and low, so GNSS VDOP rises toward the pole (1.20 at the equator to 1.51 at 89.9 deg for GPS and Galileo in the bundled scenario), while a near-polar LEO shell converges there. Geometry only; no scintillation, terrain or signal power. 0.30 round 2 (pre-registered 3254d456), blocked (stays MODELLED): on the same tabulated Earth-fixed satellite states Orekit 12.2 visibility and DOPComputer, with a NumPy inverse for multi-clock groups, agree on in-view counts for 4040/4040 samples and on median DOP within 4.6e-14; the states themselves come from the two-body plus secular-J2 model, which no oracle covers, so the scoping awaits an owner decision",
            oracle_kind: InternalConsistency,
            status: Modelled,
        },
        VerificationItem {
            requirement: "Named LEO PNT systems as optional data presets, each with its source",
            capability: "System-agnostic inputs: every system is Walker shells, explicit elements or a GNSS preset, a signal (carrier, chip rate, bandwidth, received power or C/N0 range), a SISRE, a Doppler sigma and a clock model; presets fill only what a scenario leaves out, one file each with sources marked PUBLIC (with a URL), WORKSHOP or DERIVED and the unpublished values listed as representative: Xona Pulsar X1/X5, Iridium STL, Starlink signals of opportunity, CentiSpace, a representative C-band system, the ATOMIC zero-clock ephemeris model, and one workshop-derived preset in the optional Celeste IOD preset file, withheld by deleting that file and its scenarios",
            module: "leo_fusion::presets (all, by_id, cn0_range_dbhz, noise_density_dbw_hz); leo_fusion::system (SystemCfg::build)",
            tests: "leo_fusion::presets::tests (every_preset_has_a_source_and_every_public_source_a_url; only_one_preset_uses_workshop_material; noise_density_at_290_k_is_minus_204_dbw_per_hz); tests/workshop_preset_isolation.rs (only_the_listed_files_name_the_workshop_preset; workshop_numbers_live_only_in_the_preset_file_and_its_scenarios: source-text scans of src, scenarios and tests); leo_fusion::system::tests (a_preset_fills_what_the_scenario_leaves_out; a_system_needs_no_preset; pseudorange_sigma_falls_with_elevation_and_never_below_the_sisre)",
            oracle: "Transcription of the cited public values, checked for structure (every public source has a URL, Walker patterns divide evenly, the C/N0 from received power over kT at 290 K), not against an external oracle. Representative values are named in each preset and are illustrative",
            oracle_kind: InternalConsistency,
            status: Modelled,
        },
        // ── LEO-PNT end to end (`leo-pnt-chain`) ────────────────────────────────
        VerificationItem {
            requirement: "One LEO-PNT system end to end: signal design, pass link budget, navigation message and fused positioning, each stage's output handed to the next",
            capability: "The `leo-pnt-chain` kind: a leo-signal design (public preset or inline) sets a leo-pass band's centre, bandwidth, chip rate and EIRP split; the pass gives the tracked-component C/N0 and band-limited code jitter per epoch; a least-squares C/N0 line in sin(elevation), the leo-navmsg message's SISRE (fitted at the pass satellite's orbit, plus a stated orbit-determination term in root-sum-square) and the design's carrier and chip rate go to every LEO system of a leo-pvt joint fix and, optionally, to the LEO cases of leo-ppp; every hand-off is reported with its value and unit",
            module: "leo_pnt_chain (LeoPntChainScenario); leo_pass (BandCfg::signal, design_tracking); leo_navmsg (LeoNavmsgScenario::broadcast_sisre); leo_fusion::pvt_kind; leo_fusion::ppp",
            tests: "leo_pnt_chain::tests (a_sine_line_fit_recovers_its_line); tests/leo_pnt_chain.rs (every_upstream_change_moves_the_downstream_figures: a stronger EIRP, a longer fit interval and a larger orbit-determination term each move the handed-on value and the fused fix; the_handed_on_values_are_the_stage_outputs; a_band_design_splits_the_eirp_and_reports_the_design_jitter; the_pass_export_reproduces_the_engine_range)",
            oracle: "Self-consistency of the hand-offs: each handed-on value equals the upstream stage's own output, and mutating an upstream input moves every downstream figure that depends on it. The stages keep their own labels; the chain adds no physics and no external oracle",
            oracle_kind: InternalConsistency,
            status: Modelled,
        },
        // ── LEO-PNT resilience (`leo-pass` `[spoofer]`, band pairs) ─────────────
        VerificationItem {
            requirement: "Spoofing detection by LEO Doppler and pass-geometry consistency",
            capability: "The `leo-pass` kind's `[spoofer]` section: a spoofer counterfeits, self-consistently in range and range rate, the signals seen at a claimed position that jumps and/or is pushed from the true one after an onset (per LEO band and for the MEO GNSS signal); the receiver predicts every range rate from the broadcast orbit and an independent prior position and velocity, and tests the measured range rates with a generalised least-squares chi-square statistic over a window of epochs (clock drift a nuisance or with a prior), on the GNSS channels, the LEO channels and all channels, with frequency-lock-loop thermal noise from C/N0 (Kaplan & Hegarty 2006, section 5.6.2); detection probability from the non-central chi-square law at a stated false-alarm probability, detection declared at a stated missed-detection probability",
            module: "leo_link::spoof (range_rate_position_gradient, line_of_sight, fll_frequency_jitter_hz, doppler_consistency_window, doppler_consistency); leo_pass (SpooferCfg, spoof_section)",
            tests: "leo_link::spoof::tests (the_gradient_is_the_derivative_of_the_range_rate; fll_jitter_matches_the_formula_by_hand; a_common_mode_residual_is_a_clock_drift_and_is_not_detected; with_no_prior_and_equal_noise_the_statistic_is_the_scatter_about_the_mean; a_push_the_prior_explains_is_not_detected; a_velocity_push_is_hidden_by_a_loose_velocity_prior_only; the_information_form_equals_the_covariance_form); tests/leo_resilience_verticals.rs (the_monitors_are_silent_before_the_onset; the_doppler_statistic_is_quadratic_in_the_jump; leo_range_rates_see_a_jump_that_gnss_range_rates_do_not)",
            oracle: "Closed forms and identities, not an external measurement: the range-rate gradient against a central difference, the information-form statistic against the dense covariance form, a pure clock drift giving zero, a prior-explained push giving at most |dx|^2/sigma_p^2, the statistic quadratic in a jump. No detection figure is compared with a measured attack; the spoofer is idealised (no power, angle-of-arrival or correlation-peak signature)",
            oracle_kind: InternalConsistency,
            status: Modelled,
        },
        VerificationItem {
            requirement: "Spoofing detection by cross-band consistency of a multi-band LEO signal",
            capability: "For every LEO satellite and pair of ranging bands the `[spoofer]` section forms the geometry-free pseudorange combination, removes the receiver's ionospheric model and tests its epoch-to-epoch step against the two bands' code noise and a stated tolerated unmodelled ionospheric rate (two-sided Gaussian, exact detection probability); a spoofer that counterfeits some bands and not others, or every band without the ionosphere, is seen at its onset; one that counterfeits every band and simulates the ionosphere is not, which the result states",
            module: "leo_link::spoof (cross_band_step); leo_pass (spoof_section: pairs, cross_band)",
            tests: "leo_link::spoof::tests (the_cross_band_threshold_and_power); tests/leo_resilience_verticals.rs (a_ground_spoofer_leaves_the_ionospheric_step_and_an_ionosphere_aware_one_does_not; a_one_band_spoofer_is_seen_by_the_cross_band_monitor_at_the_onset; the_monitors_are_silent_before_the_onset)",
            oracle: "Identities: the onset step of an ionosphere-free spoofer equals the pair's modelled ionospheric delay difference, the threshold is the two-sided normal quantile times the step's standard deviation plus the rate bound. The receiver's ionospheric model is the engine's, so the authentic residual is zero in the mean by construction; no external oracle",
            oracle_kind: InternalConsistency,
            status: Modelled,
        },
        VerificationItem {
            requirement: "Ionosphere sounding: slant TEC from the dual-band delay of a LEO pass",
            capability: "For every band pair of a `leo-pass` satellite the report gives the slant total electron content the geometry-free code combination recovers at the pass peak, (P2 - P1) f1^2 f2^2 / (40.3 (f1^2 - f2^2)), and its 1-sigma from the two bands' thermal code noise, so any multi-band LEO-PNT design can be traded as an ionosphere sounder",
            module: "leo_pass (IonoFreePair::geometry_free_stec_tecu, geometry_free_stec_sigma_tecu); leo_link::iono::geometry_free_stec_tecu",
            tests: "tests/leo_resilience_verticals.rs (the_geometry_free_tec_is_the_pass_slant_tec: equals the pass's slant TEC at the peak to 1e-9 and its sigma equals the RSS code noise over 40.3 (1/f1^2 - 1/f2^2)); tests/geometry_free_tec_gim_oracle.rs::geometry_free_finding_is_pinned",
            oracle: "The first-order dispersion identity, exact by construction against the engine's own first-order delay (whose 1/f^2 scaling is VALIDATED against IS-GPS-200 in its own row); the precision is thermal code noise only, without multipath or inter-frequency biases. 0.30 round 2, measured (pre-registered 5e795f93), a finding (stays MODELLED): the CODE global ionosphere map CODG1330.18I against ABMF C1C/C2W code with the CODE biases gives 33 of 36 arc means within 3 TECU (worst +6.84 TECU on an evening arc; per-epoch RMS 3.95 TECU), against a bar of every arc; not validated",
            oracle_kind: InternalConsistency,
            status: Modelled,
        },
        VerificationItem {
            requirement: "Lunar frame datum covariance with the stations estimated, against 50-digit extended precision",
            capability: "The seven-parameter Helmert datum covariance of the lunar-frame-campaign scenario with the Earth stations estimated (station 1 anchored), as lunar_frame_campaign computes it in binary64: the joint station-and-beacon Fisher information accumulated from the delay Jacobian, the station block marginalised by a Schur complement through a Jacobi spectral inverse, H = AᵀSA formed with the Helmert design and inverted spectrally. The problem is ill-conditioned by construction (Helmert condition number 2.1e8 to 2.3e8, joint information condition number 1.6e12 to 3.0e13): a 1e-9 relative change in the Schur correction moves the datum sigmas by up to 28 %. Reported: the seven datum sigmas, the Helmert condition number and the weakest direction. CLAIM, NARROWED: the engine's datum sigmas and condition number lie within the a-priori worst-case error bound of a backward-stable double-precision pipeline on this problem; this does not claim they are as accurate as double precision allows (a factorisation route is about a thousand times more accurate on the same inputs, and the opt-in square-root solver about ten million times), and the weakest direction is validated only where its bar is below a right angle (the stations-fixed control)",
            module: "lunar_frame_campaign, fim",
            tests: "tests/lunar_frame_campaign_mpmath_oracle.rs (lunar_frame_campaign_datum_matches_mpmath_extended_precision: three scenarios — stations estimated on a new campaign date 2026-03-18 (binding), stations fixed on that date (control), stations estimated on 2024-01-01 (the scenario of the earlier double-precision miss); every datum sigma, the condition number and the weakest direction against a condition-scaled bar recomputed in the test from the oracle's exact sensitivities; engine_inputs_match_the_committed_fixture: the committed Jacobian, weights and Helmert design are what the engine builds now; record_engine_accuracy_against_a_factorisation_route: the engine's error band and the NumPy Cholesky diagnostic pinned)",
            oracle: "mpmath 1.3.0 (BSD-3-Clause) at 50 significant digits, self-checked at 80 (agreement 1.1e-38 or better), on the engine's committed Jacobian, weights and Helmert design: mpmath's own LU solve for the Schur complement, its inverse for H and its Jacobi eigen-decomposition (P2, an independent numerical library). Pre-registered 804662d5 before the fixture existed, with bars from a first-order backward-error formula: constant (3n+1)n + m times the unit roundoff (Higham, Accuracy and Stability of Numerical Algorithms, Theorem 10.4, the Tier B form), times each quantity's exact first-order sensitivity to the joint information, the Schur complement and H. Measured: datum sigmas within 4.8e-6 on 2026-03-18 (bars 9.6e-2 to 2.2e-1), 9.7e-6 on 2024-01-01 (bars 2.8e-2 to 6.9e-2) and 2.0e-14 with the stations fixed (bars 1.0e-11 to 2.8e-7); condition number within 4.6e-6, 1.3e-5 and 4.1e-14. On the stations-estimated scenarios the bars are worst-case and four orders of magnitude above the measured error, and the weakest-direction bar there exceeds a right angle, so that one check is not counted; on the stations-fixed control the weakest direction agrees to 6.6e-16 rad against a 9.4e-11 bar, measured by the chord between unit vectors (an earlier acos comparator could not resolve angles below 1.5e-8 rad; the bar is unchanged). Diagnostic: NumPy 2.3.5 Cholesky and QR routes reach 9e-9 and 5e-9 on the 2024-01-01 inputs, its inverse and eigen routes 2.9e-6 and 6.2e-6: the engine is within its bound but about a thousand times less accurate than a factorisation route. Validates the linear algebra on the committed inputs, not the Jacobian (the SPICE leg of the campaign row does that) and not the physical accuracy of the illustrative campaign",
            oracle_kind: ExternalDataset,
            status: Validated,
        },
        VerificationItem {
            requirement: "Square-root information datum solver against 50-digit extended precision",
            capability: "An opt-in square-root information solver (lunar-frame-campaign solver = \"srif\"; default unchanged) that never forms or inverts an information matrix for the datum: Householder QR (orthogonal-triangular decomposition) of the whitened delay Jacobian as a square-root information filter measurement update, the Earth stations marginalised through the trailing triangular block (whose Gram product is the Schur complement), a second QR of R_bb A for the seven-parameter Helmert datum, sigmas as the row norms of the triangular inverse, and the spectrum (condition number, weakest direction) from a one-sided Jacobi singular value decomposition. Inner products are compensated with a Dekker-split error-free product, so every operation is a correctly rounded IEEE-754 basic operation or square root; identical results on every platform are argued from that, not tested across platforms",
            module: "linalg_sr, lunar_frame_campaign",
            tests: "tests/lunar_frame_campaign_srif_mpmath_oracle.rs (srif_datum_matches_mpmath_extended_precision: four scenarios — stations estimated on a new campaign date 2026-06-09 (binding), stations fixed on that date (control), and the 2026-03-18 and 2024-01-01 stations-estimated inputs; every datum sigma, the condition number and the weakest direction against a square-root-form bar recomputed in the test from the oracle's exact ingredients; engine_inputs_match_the_committed_fixture); linalg_sr::tests (9 lib tests: the Dekker product equal to the fused multiply-add residual on 20 000 pairs, compensated summation of a cancelling sum, R^T R equal to A^T A, sequential filter updates equal to one batch update, the trailing block equal to the square root of the Schur complement, the triangular inverse, the Jacobi SVD, agreement with the spectral datum on a well-conditioned case, bit-identical reruns); lunar_frame_campaign::tests::the_default_solver_is_unchanged_and_an_unknown_solver_is_rejected and the_srif_solver_agrees_with_the_spectral_one_where_both_are_accurate_and_says_so",
            oracle: "mpmath 1.3.0 (BSD-3-Clause) at 50 significant digits, self-checked at 80 (agreement 1.4e-43 or better), on the engine's committed Jacobian, weights and Helmert design (P2, an independent numerical library: mpmath's own LU solve, inverse, Cholesky and Jacobi eigen-decomposition). Pre-registered b41908c9 before the solver was written, with bars from a first-order backward-error bound in square-root form: Householder QR constant mn plus (3n+1)n times the unit roundoff (Higham, Accuracy and Stability of Numerical Algorithms, Theorem 19.4 and Chapter 8) times exact sensitivities. Measured: datum sigmas within 3.0e-13 on 2026-06-09 (bars 4.1e-7 to 5.3e-7), 1.9e-15 with the stations fixed (bars down to 4.8e-12), 3.8e-13 on 2026-03-18 and 2.3e-13 on 2024-01-01, where the default spectral solver is off by 4.8e-6 and 9.7e-6; condition number within 4.9e-13; weakest direction within 1.4e-13 rad (control 1.7e-16 against 5.1e-10). LIMIT OF THE CHECK: the bars certify only datum errors below about 2e-7 relative; the measured 1e-13 figures are observations, not what the bars certify. The check rejects the default spectral solver (sigmas 9.7e-6 against 2.9e-7 on 2024-01-01; on the binding date 1.3e-6 against 4.9e-7, a margin of 1.3 to 2.6) and a mis-taken triangular inverse (column norms: red), but a flipped Householder sign, an uncompensated dot product, and sigmas from a spectral inverse of the H formed from the square-root factor (3.7e-9) all pass, so it does not show that each square-root step is needed. Validates the opt-in solver's linear algebra on committed inputs, not the Jacobian and not the default solver; bit-reproducibility across platforms is argued from the operations used and tested only as rerun identity on one platform",
            oracle_kind: ExternalDataset,
            status: Validated,
        },
    ]
}

// ── Oracle basis of every VALIDATED row (the promotion rule, applied both ways) ──
//
// `docs/VALIDATION.md` ("The promotion rule") names the oracle kinds a VALIDATED row may
// rest on. `OracleKind::ExternalDataset` says only that the oracle is external; the table
// below says WHICH accepted kind it is, and names the one test that carries the
// comparison. The unit tests in this file require every VALIDATED row to be declared
// exactly once, the declared source to be the one the row's own oracle text names, and
// the declared test to be one the row cites; `tests/verification_rows_declare_an_oracle_basis.rs`
// requires that test to exist on disk as a real, non-ignored `#[test]`.

/// Which accepted oracle kind backs a VALIDATED row (`docs/VALIDATION.md`, "The promotion
/// rule"). The kinds are disjoint by what supplies the comparand, not by how strong it is.
#[derive(Clone, Copy, Debug, PartialEq, Eq, serde::Serialize)]
pub enum OracleBasis {
    /// Measured data: the truth is an observation of the physical world (a clock record,
    /// telemetry with ground-truth labels, a terrain survey, laser ranging, UTC(k)).
    Measured,
    /// An independent third-party library or tool computes the same uniquely defined
    /// quantity on the same inputs, and implements the domain computation itself.
    Library,
    /// Published reference vectors, tables or verification examples: numbers a standard,
    /// agency or reference text prints so implementations can be checked against them.
    Reference,
    /// Policy P1: a published worked value computed from the same closed form the row
    /// implements, in a publication independent of Kshana, compared at a stated tolerance.
    P1WorkedValue,
    /// Policy P2: an independent numerical library (numpy, SciPy, LAPACK, or an equivalent
    /// third-party numerical core) recomputes a uniquely defined linear-algebra quantity on
    /// stated inputs by a different algorithm than Kshana's.
    P2NumericalLibrary,
}

/// The declared oracle basis of one VALIDATED row.
#[derive(Clone, Copy, Debug, serde::Serialize)]
pub struct OracleBasisEntry {
    /// The row's `requirement` (unique in the matrix), which keys the declaration.
    pub requirement: &'static str,
    /// The accepted oracle kind the row rests on.
    pub basis: OracleBasis,
    /// The test that carries the comparison: `tests/x.rs`, `tests/x.rs::test_fn` or
    /// `src/m.rs::test_fn`. It must be one the row cites and a real `#[test]`.
    pub oracle_test: &'static str,
    /// The independent source, quoted verbatim from the row's own oracle text.
    pub source: &'static str,
    /// Empty when the row satisfies the written rule. Otherwise the reason it does not,
    /// recorded rather than hidden; flagged rows are listed in `docs/VALIDATION.md`.
    pub flag: &'static str,
}

/// The oracle basis of every VALIDATED row of [`verification_matrix`], one entry per row.
pub fn validated_oracle_basis() -> Vec<OracleBasisEntry> {
    use OracleBasis::*;
    vec![
        OracleBasisEntry {
            requirement: "Power-law noise identification by lag-1 autocorrelation",
            basis: Library,
            oracle_test: "tests/clock_library_lag1_noise_id_allantools.rs",
            source: "allantools 2024.6",
            flag: "",
        },
        OracleBasisEntry {
            requirement: "Frequency stability characterisation",
            basis: Reference,
            oracle_test: "tests/allan_reference.rs",
            source: "NIST SP 1065",
            flag: "",
        },
        OracleBasisEntry {
            requirement: "Frequency stability on a real measured clock",
            basis: Library,
            oracle_test: "tests/cs5071a_reference.rs",
            source: "Stable32",
            flag: "",
        },
        OracleBasisEntry {
            requirement: "Allan estimator parity on the canonical Stable32 reference series",
            basis: Library,
            oracle_test: "tests/phasedat_reference.rs",
            source: "Stable32",
            flag: "",
        },
        OracleBasisEntry {
            requirement: "Extended-range frequency stability (Theo1 / TOTDEV)",
            basis: Library,
            oracle_test: "tests/theo1_totvar_reference.rs",
            source: "allantools 2024.06",
            flag: "",
        },
        OracleBasisEntry {
            requirement: "Maximum Time Interval Error (MTIE) — telecom wander metric",
            basis: Library,
            oracle_test: "tests/mtie_reference.rs",
            source: "allantools 2024.06",
            flag: "",
        },
        OracleBasisEntry {
            requirement: "Modified Allan / Time deviation (MDEV / TDEV)",
            basis: Library,
            oracle_test: "tests/mdev_tdev_reference.rs",
            source: "allantools 2024.06",
            flag: "",
        },
        OracleBasisEntry {
            requirement: "Optical-clock frequency stability on a real measured curve",
            basis: Measured,
            oracle_test: "tests/optical_clock_adev_reference.rs",
            source: "Norcia",
            flag: "",
        },
        OracleBasisEntry {
            requirement: "Integrity (RAIM/ARAIM/SBAS)",
            basis: Library,
            oracle_test: "tests/integrity_araim_stanford_oracle.rs::araim_mhss_matches_stanford_maast_add_v4_2",
            source: "Stanford MAAST for ARAIM 2",
            flag: "",
        },
        OracleBasisEntry {
            requirement: "Orbit propagation & determination",
            basis: Reference,
            oracle_test: "tests/sgp4_verification.rs",
            source: "AIAA 2006-6753",
            flag: "",
        },
        OracleBasisEntry {
            requirement: "Numerical Cowell propagator & force model",
            basis: Library,
            oracle_test: "tests/numerical_cowell_propagator_reference.rs",
            source: "Orekit 12.2",
            flag: "",
        },
        OracleBasisEntry {
            requirement: "Batch & sequential orbit determination",
            basis: Library,
            oracle_test: "tests/batch_sequential_orbit_determination_reference.rs",
            source: "Orekit 12.2",
            flag: "",
        },
        OracleBasisEntry {
            requirement: "Deep-space radiometric light-time solver",
            basis: Library,
            oracle_test: "tests/deep_space_mars_radiometric_reference.rs",
            source: "ANISE 0.10",
            flag: "",
        },
        OracleBasisEntry {
            requirement: "Broadcast-ephemeris satellite position (multi-GNSS RINEX)",
            basis: Library,
            oracle_test: "tests/rinex_sp3_interop_reference.rs",
            source: "RTKLIB v2.4.2-p13",
            flag: "",
        },
        OracleBasisEntry {
            requirement: "SP3 precise-ephemeris interpolation",
            basis: Library,
            oracle_test: "tests/sp3_interp_reference.rs",
            source: "RTKLIB peph2pos",
            flag: "",
        },
        OracleBasisEntry {
            requirement: "Strapdown INS mechanization",
            basis: Library,
            oracle_test: "tests/classical_strapdown_ins_reference.rs",
            source: "NaveGo v1.4",
            flag: "",
        },
        OracleBasisEntry {
            requirement: "Gravity-field functional synthesis (gravity-aided / GNSS-free nav map)",
            basis: Reference,
            oracle_test: "tests/icgem_gravity_reference.rs",
            source: "GRS80",
            flag: "",
        },
        OracleBasisEntry {
            requirement: "Lambert two-body transfer solver",
            basis: Library,
            oracle_test: "tests/lambert_reference.rs",
            source: "lamberthub 1.0.0",
            flag: "",
        },
        OracleBasisEntry {
            requirement: "Reference frames & timescales",
            basis: Reference,
            oracle_test: "tests/frame_reference_vectors.rs",
            source: "SOFA / ERFA reference vectors",
            flag: "",
        },
        OracleBasisEntry {
            requirement: "Ranging-code design trade",
            basis: P1WorkedValue,
            oracle_test: "src/navsignal.rs::gps_ca_gold_crosscorr_matches_textbook",
            source: "Published GPS C/A Gold cross-correlation",
            flag: "",
        },
        OracleBasisEntry {
            requirement: "GNSS geometry / dilution of precision (DOP)",
            basis: Library,
            oracle_test: "tests/dop_reference.rs",
            source: "gnss_lib_py 1.0.4",
            flag: "",
        },
        OracleBasisEntry {
            requirement: "Broadcast ionosphere model (Klobuchar, IS-GPS-200)",
            basis: Library,
            oracle_test: "tests/klobuchar_reference.rs",
            source: "RTKLIB ionmodel",
            flag: "",
        },
        OracleBasisEntry {
            requirement: "RAIM/ARAIM integrity statistical kernel (χ² / non-central χ² / normal laws)",
            basis: Library,
            oracle_test: "tests/raim_reference.rs",
            source: "SciPy 1.17.0",
            flag: "",
        },
        OracleBasisEntry {
            requirement: "SBAS protection level (DO-229E weighted-LS HPL/VPL)",
            basis: Library,
            oracle_test: "tests/sbas_reference.rs",
            source: "RTKLIB SBAS-PL fork",
            flag: "",
        },
        OracleBasisEntry {
            requirement: "ML detector-evaluation metrics (ROC/AUC/confusion/Pfa-Pmd)",
            basis: Library,
            oracle_test: "tests/eval_metrics_reference.rs",
            source: "scikit-learn 1.9.0",
            flag: "",
        },
        OracleBasisEntry {
            requirement: "Anomaly-detection scoring on real spacecraft telemetry",
            basis: Library,
            oracle_test: "tests/opssat_ad_reference.rs",
            source: "scikit-learn roc_auc_score",
            flag: "",
        },
        OracleBasisEntry {
            requirement: "Quantum-trade numerical kernels (NNLS / χ² bands / van-Loan Q)",
            basis: Library,
            oracle_test: "tests/scipy_reference.rs",
            source: "scipy 1.17.1",
            flag: "",
        },
        OracleBasisEntry {
            requirement: "Geomagnetic reference field (IGRF-14 synthesis)",
            basis: Library,
            oracle_test: "tests/alternative_complementary_pnt_reference.rs",
            source: "ppigrf 2.1.0",
            flag: "",
        },
        OracleBasisEntry {
            requirement: "Detection statistics — Gaussian AUC & minimum detectable fault",
            basis: Library,
            oracle_test: "tests/quantum_faults_reference.rs",
            source: "scikit-learn roc_auc_score",
            flag: "",
        },
        OracleBasisEntry {
            requirement: "Rank-order statistics kernel (Kendall-τ / Dirichlet / percentile)",
            basis: Library,
            oracle_test: "tests/resilience_score_decision_instability_reference.rs",
            source: "stats.kendalltau",
            flag: "",
        },
        OracleBasisEntry {
            requirement: "MCDA priority-derivation kernel (AHP eigenvector / consistency ratio)",
            basis: P2NumericalLibrary,
            oracle_test: "tests/mcda_ahp_reference.rs",
            source: "scipy.linalg.eig",
            flag: "",
        },
        OracleBasisEntry {
            requirement: "MCDA weighted-aggregation kernels (WSM / WPM)",
            basis: Library,
            oracle_test: "tests/mcda_wsm_reference.rs",
            source: "pymcdm",
            flag: "",
        },
        OracleBasisEntry {
            requirement: "MCDA distance-to-ideal ranking (TOPSIS)",
            basis: Library,
            oracle_test: "tests/mcda_topsis_reference.rs",
            source: "pymcdm",
            flag: "",
        },
        OracleBasisEntry {
            requirement: "MCDA compromise ranking (VIKOR)",
            basis: Library,
            oracle_test: "tests/mcda_vikor_reference.rs",
            source: "pymcdm",
            flag: "",
        },
        OracleBasisEntry {
            requirement: "MCDA outranking net-flow ranking (PROMETHEE II)",
            basis: Library,
            oracle_test: "tests/mcda_promethee_reference.rs",
            source: "pymcdm",
            flag: "",
        },
        OracleBasisEntry {
            requirement: "MCDA outranking choice kernel (ELECTRE I)",
            basis: Library,
            oracle_test: "tests/mcda_electre_reference.rs",
            source: "pyDecision",
            flag: "",
        },
        OracleBasisEntry {
            requirement: "MCDA aggregation kernels (WASPAS / MOORA)",
            basis: Library,
            oracle_test: "tests/mcda_waspas_reference.rs",
            source: "pymcdm",
            flag: "",
        },
        OracleBasisEntry {
            requirement: "MCDA proportional ranking (COPRAS)",
            basis: Library,
            oracle_test: "tests/mcda_copras_reference.rs",
            source: "pyDecision",
            flag: "",
        },
        OracleBasisEntry {
            requirement: "CUSUM change-detection latency & ARL",
            basis: Reference,
            oracle_test: "tests/timing_protection_level_under_spoofing_reference.rs::cusum_arl1_matches_siegmund_and_montgomery",
            source: "Montgomery",
            flag: "",
        },
        OracleBasisEntry {
            requirement: "Clock-holdover coast-variance & threshold inversion",
            basis: P2NumericalLibrary,
            oracle_test: "tests/gnss_denied_clock_holdover_reference.rs",
            source: "scipy 1.18 (BSD-3-Clause): linalg.expm",
            flag: "",
        },
        OracleBasisEntry {
            requirement: "Inverse-Simpson diversity kernel",
            basis: Library,
            oracle_test: "tests/resilience_diversity_reference.rs",
            source: "scikit-bio 0.7.3",
            flag: "",
        },
        OracleBasisEntry {
            requirement: "GPS L1 C/A spreading-code generation",
            basis: Reference,
            oracle_test: "src/sdr.rs::ca_first_ten_chips_match_is_gps_200_octal",
            source: "IS-GPS-200 Table 3-Ia",
            flag: "",
        },
        OracleBasisEntry {
            requirement: "Cislunar mission analysis",
            basis: Reference,
            oracle_test: "tests/cislunar_mission_analysis_reference.rs",
            source: "Three-Body Periodic Orbit Database",
            flag: "",
        },
        OracleBasisEntry {
            requirement: "SRTM digital-elevation reader on real terrain",
            basis: Measured,
            oracle_test: "tests/terrain_nav_validation.rs::real_srtm_committed_badwater_tile_reads_real_relief",
            source: "SRTM v3",
            flag: "",
        },
        OracleBasisEntry {
            requirement: "CCSDS OEM interoperability (GMAT/Orekit/STK ephemeris import)",
            basis: Library,
            oracle_test: "tests/ccsds_oem_interop_reference.rs",
            source: "B. Sease",
            flag: "",
        },
        OracleBasisEntry {
            requirement: "CCSDS Space Packet (133.0) TM/TC framing",
            basis: Library,
            oracle_test: "tests/ccsds_space_packet_reference.rs",
            source: "spacepackets 0.32.0",
            flag: "",
        },
        OracleBasisEntry {
            requirement: "Ground-station pass prediction (ground segment)",
            basis: Library,
            oracle_test: "tests/ground_station_pass_prediction_reference.rs",
            source: "Orekit 12.2",
            flag: "",
        },
        OracleBasisEntry {
            requirement: "One-way link budget (comms / link design)",
            basis: P1WorkedValue,
            oracle_test: "tests/one_way_link_budget_reference.rs",
            source: "JPL Pub 82-76",
            flag: "",
        },
        OracleBasisEntry {
            requirement: "Lunar coordinate time",
            basis: P1WorkedValue,
            oracle_test: "tests/lunar_coordinate_time_reference.rs",
            source: "Ashby & Patla 2024",
            flag: "",
        },
        OracleBasisEntry {
            requirement: "Fisher information & Cramér–Rao observability",
            basis: P2NumericalLibrary,
            oracle_test: "tests/fim_observability_reference.rs",
            source: "numpy.linalg.eigh",
            flag: "",
        },
        OracleBasisEntry {
            requirement: "Lunar reference-frame realisation",
            basis: P2NumericalLibrary,
            oracle_test: "tests/lunar_reference_frame_realisation_reference.rs",
            source: "numpy/scipy SVD",
            flag: "",
        },
        OracleBasisEntry {
            requirement: "Lunar navigation service volume",
            basis: Library,
            oracle_test: "tests/lunar_navigation_service_volume_reference.rs",
            source: "ANISE 0.10.2",
            flag: "",
        },
        OracleBasisEntry {
            requirement: "Wahba/TRIAD/QUEST attitude determination",
            basis: Library,
            oracle_test: "tests/wahba_reference.rs",
            source: "Rotation.align_vectors",
            flag: "",
        },
        OracleBasisEntry {
            requirement: "GNSS square-law acquisition detection statistics",
            basis: Library,
            oracle_test: "tests/acquisition_reference.rs",
            source: "scipy.stats.ncx2",
            flag: "",
        },
        OracleBasisEntry {
            requirement: "CRPA anti-jam array beamforming",
            basis: P2NumericalLibrary,
            oracle_test: "tests/crpa_reference.rs",
            source: "numpy.linalg",
            flag: "",
        },
        OracleBasisEntry {
            requirement: "IEEE-1139 power-law clock noise + flicker-FM floor",
            basis: Library,
            oracle_test: "tests/powerlaw_oadev_reference.rs",
            source: "allantools 2024.06",
            flag: "",
        },
        OracleBasisEntry {
            requirement: "CCSDS OEM covariance-block interchange",
            basis: Library,
            oracle_test: "tests/ccsds_oem_covariance_reference.rs",
            source: "oem 0.4.5",
            flag: "",
        },
        OracleBasisEntry {
            requirement: "Lunar ARAIM protection-level kernel",
            basis: P2NumericalLibrary,
            oracle_test: "tests/lunar_protection_level_reference.rs",
            source: "RTKLIB 2.4.2-p13",
            flag: "",
        },
        OracleBasisEntry {
            requirement: "ARAIM MHSS protection levels against published reference vectors",
            basis: Reference,
            oracle_test: "tests/araim_reference_vectors.rs",
            source: "Working Group C",
            flag: "",
        },
        OracleBasisEntry {
            requirement: "Built-in analytic lunar ephemeris — its STATED ACCURACY BOUND checked against real data",
            basis: Measured,
            oracle_test: "tests/lunar_llr_real_data.rs::the_analytic_moon_series_disagrees_with_jpl_by_the_same_amount",
            source: "lunar laser-ranging normal points",
            flag: "",
        },
        OracleBasisEntry {
            requirement: "Composed timing PL — holdover envelope coverage, multi-year regime (tau>=90d)",
            basis: Measured,
            oracle_test: "tests/cti_holdover_coverage_reference.rs",
            source: "BIPM Circular-T",
            flag: "",
        },
        OracleBasisEntry {
            requirement: "Lunar datum identifiability - decomposition linear algebra",
            basis: P2NumericalLibrary,
            oracle_test: "tests/lunar_datum_identifiability_reference.rs::decompose_matches_scipy_reference",
            source: "SciPy/NumPy",
            flag: "",
        },
        OracleBasisEntry {
            requirement: "Coupled lunar frame and timescale gauge: the joint spatial-datum, clock-offset and clock-rate null space",
            basis: P2NumericalLibrary,
            oracle_test: "tests/lunar_coupled_gauge_reference.rs::coupled_gauge_matches_numpy_on_real_de440_rows",
            source: "numpy/LAPACK",
            flag: "",
        },
        OracleBasisEntry {
            requirement: "Cross-provider lunar frame/dynamics consistency (real inter-ephemeris)",
            basis: P2NumericalLibrary,
            oracle_test: "tests/lunar_interop_budget_reference.rs",
            source: "numpy SVD least-squares",
            flag: "",
        },
        OracleBasisEntry {
            requirement: "Autonomous free-network fault-observability linear-algebra pipeline (parity projector, detectability, MDB non-centrality, Byzantine block-spark)",
            basis: P2NumericalLibrary,
            oracle_test: "tests/lunar_faultobs_reference.rs::faultobs_matches_numpy_scipy_on_real_de440_rows",
            source: "numpy/scipy",
            flag: "",
        },
        OracleBasisEntry {
            requirement: "Telecom-timing MTIE and TDEV on a holdover time-error series",
            basis: Library,
            oracle_test: "tests/telecom_timing_reference.rs",
            source: "allantools 2024.06",
            flag: "",
        },
        OracleBasisEntry {
            requirement: "Holdover prediction from a measured clock record, checked on held-out data",
            basis: Measured,
            oracle_test: "tests/slot_timing_cs5071a_holdout.rs::holdover_inversion_predicts_the_held_out_caesium_record",
            source: "5071A caesium",
            flag: "",
        },
        OracleBasisEntry {
            requirement: "Closed-form L-band signal power spectral densities and spectral separation coefficients",
            basis: P1WorkedValue,
            oracle_test: "src/spectrum.rs::q_values_match_kaplan_hegarty",
            source: "Kaplan & Hegarty",
            flag: "",
        },
        OracleBasisEntry {
            requirement: "Planet positions across the solar system from the JPL Standish Keplerian elements",
            basis: Reference,
            oracle_test: "tests/solar_system_standish_preregistered.rs::standish_rms_errors_are_within_explanatory_supplement_table_8_10_1",
            source: "JPL Horizons DE441",
            flag: "",
        },
        OracleBasisEntry {
            requirement: "Light time between solar-system bodies",
            basis: Reference,
            oracle_test: "tests/solar_system_light_time_solver_preregistered.rs::light_time_solver_on_de441_positions_matches_horizons_lt_within_1e_6_s",
            source: "JPL Horizons DE441",
            flag: "",
        },
        OracleBasisEntry {
            requirement: "Walker constellation geometry and the published nominal slots of GPS, Galileo and GLONASS",
            basis: Reference,
            oracle_test: "src/constellation.rs::walker_24_3_1_reproduces_galileo_os_sdd_table_23",
            source: "Galileo Open Service Service Definition Document",
            flag: "",
        },
        OracleBasisEntry {
            requirement: "Global dilution of precision of the GPS baseline constellation",
            basis: Reference,
            oracle_test: "src/constellation.rs::gps_baseline_global_dop_matches_the_sps_performance_standard",
            source: "GPS SPS PS 5th edition",
            flag: "",
        },
        OracleBasisEntry {
            requirement: "Band-limited closed forms for any ranging signal: power in band and early-late code-tracking jitter against published values, with the Gabor bandwidth and offset spectral separation cross-checked",
            basis: P1WorkedValue,
            oracle_test: "src/navsignal.rs::bpsk_power_in_band_closed_form_matches_textbook_and_numeric",
            source: "90.3 per cent main-lobe power",
            flag: "",
        },
        OracleBasisEntry {
            requirement: "Maximum Doppler of a low Earth orbit navigation satellite, which sizes the acquisition search",
            basis: P1WorkedValue,
            oracle_test: "src/leo_signal.rs::max_doppler_matches_published_xona_and_iridium_figures",
            source: "Xona Pulsar X1",
            flag: "",
        },
        OracleBasisEntry {
            requirement: "Rain specific-attenuation coefficients for any band a LEO-PNT link uses",
            basis: Reference,
            oracle_test: "tests/leo_link_reference.rs::p838_coefficients_reproduce_table5_to_its_printed_digits",
            source: "ITU-R P.838-3",
            flag: "",
        },
        OracleBasisEntry {
            requirement: "Long-term slant-path rain attenuation on an Earth-space link",
            basis: Reference,
            oracle_test: "tests/leo_link_reference.rs::p618_rain_attenuation_matches_the_itu_validation_examples",
            source: "validation examples",
            flag: "",
        },
        OracleBasisEntry {
            requirement: "Tropospheric amplitude scintillation on an Earth-space link",
            basis: Reference,
            oracle_test: "tests/leo_link_reference.rs::p618_scintillation_matches_the_itu_validation_examples",
            source: "validation examples",
            flag: "",
        },
        OracleBasisEntry {
            requirement: "Building entry loss for an indoor LEO-PNT user",
            basis: Reference,
            oracle_test: "tests/leo_link_reference.rs::p2109_building_entry_loss_matches_the_itu_workbook",
            source: "validation workbook",
            flag: "",
        },
        OracleBasisEntry {
            requirement: "First-order ionospheric delay per band, the ionosphere-free combination and free-space loss",
            basis: P1WorkedValue,
            oracle_test: "tests/leo_link_reference.rs::first_order_iono_reproduces_the_is_gps_200_group_delay_ratio",
            source: "IS-GPS-200",
            flag: "",
        },
        OracleBasisEntry {
            requirement: "Maximum Doppler a static user sees from a LEO or MEO orbit",
            basis: P1WorkedValue,
            oracle_test: "tests/leo_link_reference.rs::doppler_envelope_reproduces_the_pulsar_paper_table_1",
            source: "Table 1",
            flag: "",
        },
        OracleBasisEntry {
            requirement: "Global-average signal-in-space range error weights for any orbit altitude",
            basis: P1WorkedValue,
            oracle_test: "src/leo_navmsg/sisre.rs::weights_reproduce_the_published_meo_and_geo_table",
            source: "Montenbruck, Steigenberger and Hauschild (2018)",
            flag: "",
        },
        OracleBasisEntry {
            requirement: "Galileo ICD broadcast-ephemeris user algorithm as the base of a LEO navigation message",
            basis: Library,
            oracle_test: "tests/leo_navmsg_reference.rs::the_galileo_user_algorithm_reproduces_rtklib_to_a_millimetre",
            source: "RTKLIB 2.4.2-p13 eph2pos",
            flag: "",
        },
        OracleBasisEntry {
            requirement: "CRC-24Q frame check for the LEO navigation message",
            basis: Reference,
            oracle_test: "src/leo_navmsg/codec.rs::crc24q_matches_the_catalogue_check_value",
            source: "CRC catalogue check value",
            flag: "",
        },
        OracleBasisEntry {
            requirement: "Doppler a ground receiver must handle from a LEO navigation satellite",
            basis: P1WorkedValue,
            oracle_test: "tests/leo_doppler_reference.rs::iridium_doppler_reaches_the_published_36_khz",
            source: "Iridium Doppler",
            flag: "",
        },
        OracleBasisEntry {
            requirement: "GNSS/INS sensor fusion",
            basis: Library,
            oracle_test: "tests/gnss_ins_navego_dataset_oracle.rs::loosely_coupled_rms_within_1p2x_of_navego",
            source: "NaveGo v1.4",
            flag: "",
        },
        OracleBasisEntry {
            requirement: "3-DOF attitude & pointing error budget (AOCS)",
            basis: Library,
            oracle_test: "tests/attitude_gg_torque_basilisk_oracle.rs::gravity_gradient_torque_matches_basilisk",
            source: "Basilisk 2.9.1 GravityGradientEffector",
            flag: "",
        },
        OracleBasisEntry {
            requirement: "Lunar joint communications-and-navigation geometry",
            basis: Library,
            oracle_test: "tests/lunar_service_geometry_oracle.rs::look_angles_match_anise_at_selenographic_sites",
            source: "ANISE 0.10.2",
            flag: "",
        },
        OracleBasisEntry {
            requirement: "Torque-free rigid-body attitude dynamics",
            basis: Library,
            oracle_test: "tests/attitude_dynamics_basilisk_oracle.rs::torque_free_motion_matches_basilisk",
            source: "Basilisk 2.9.1 spacecraft hub",
            flag: "",
        },
        OracleBasisEntry {
            requirement: "GNSS carrier-phase integer ambiguity resolution (LAMBDA)",
            basis: Library,
            oracle_test: "tests/lambda_rtklib_oracle.rs::ils_solution_matches_rtklib_lambda_on_300_covariances",
            source: "RTKLIB v2.4.2-p13",
            flag: "",
        },
        OracleBasisEntry {
            requirement: "Composed timing PL — scalar MHSS specialization (H=1_N)",
            basis: P2NumericalLibrary,
            oracle_test: "tests/tpl_scalar_numpy_oracle.rs::scalar_mhss_pl_matches_numpy",
            source: "numpy 2.3.5",
            flag: "",
        },
        OracleBasisEntry {
            requirement: "GLS common-mode whitening (Aitken) + Mahalanobis identity",
            basis: P2NumericalLibrary,
            oracle_test: "tests/gls_whitening_numpy_oracle.rs::whitening_and_mahalanobis_match_numpy_lapack",
            source: "numpy 2.3.5",
            flag: "",
        },
        OracleBasisEntry {
            requirement: "DE440 lunar principal-axis orientation provider",
            basis: Library,
            oracle_test: "tests/lunar_pa_orientation_spice_oracle.rs::interpolated_rotation_matches_direct_kernel_evaluation_off_node",
            source: "NAIF SPICE Toolkit",
            flag: "",
        },
        OracleBasisEntry {
            requirement: "SigMF recording input and output, and Welch spectral estimates of complex IQ",
            basis: Library,
            oracle_test: "tests/sigmf_welch_oracle.rs::welch_and_sigmf_io_match_scipy_and_sigmf_python",
            source: "scipy 1.18.1 scipy.signal.welch",
            flag: "",
        },
        OracleBasisEntry {
            requirement: "LEO broadcast-ephemeris fitter and signal-in-space range error versus fit interval and update period",
            basis: Measured,
            oracle_test: "tests/leo_navmsg_fit_real_orbit_oracle.rs::fitted_sisre_matches_liu_2025_on_real_orbits",
            source: "Liu et al. 2025",
            flag: "",
        },
        OracleBasisEntry {
            requirement: "Relativistic clock-rate to frame coupling for the lunar timescale",
            basis: Reference,
            oracle_test: "tests/lunar_rate_frame_coupling_preregistered.rs::entry1_d_alpha_d_scale_matches_the_published_l_m_for_both_cited_fields",
            source: "Ashby and Patla 2024",
            flag: "",
        },
        OracleBasisEntry {
            requirement: "Offline default Earth-orientation input is a real IERS product",
            basis: Library,
            oracle_test: "tests/embedded_eop_vintage_astropy_preregistered.rs::vintage_of_every_row_matches_astropy_and_predictions_match_bulletin_a",
            source: "astropy 8.0.1",
            flag: "",
        },
        OracleBasisEntry {
            requirement: "Joint UT1 and polar-motion error over a common row set",
            basis: Library,
            oracle_test: "tests/joint_eop_table_astropy_erfa_oracle.rs",
            source: "pyerfa 2.0.1.5 (SOFA)",
            flag: "",
        },
        OracleBasisEntry {
            requirement: "EO payload footprint & coverage geometry",
            basis: Library,
            oracle_test: "tests/eo_payload_coverage_orekit_oracle.rs::eo_coverage_matches_orekit_and_geographiclib",
            source: "Orekit 12.2",
            flag: "",
        },
        OracleBasisEntry {
            requirement: "Clohessy–Wiltshire / Hill relative-motion dynamics",
            basis: Library,
            oracle_test: "tests/cw_dynamics_orekit_oracle.rs::cw_second_order_matches_nonlinear_orekit_within_1mm",
            source: "Orekit 12.2",
            flag: "",
        },
        OracleBasisEntry {
            requirement: "B-plane targeting & patched-conic gravity assist",
            basis: Library,
            oracle_test: "tests/bplane_heliocentric_oracle.rs::heliocentric_elements_and_tisserand_match_gmat_and_sbpy",
            source: "GMAT R2026a",
            flag: "",
        },
        OracleBasisEntry {
            requirement: "INS/TRN coasting error growth & threshold crossings",
            basis: Library,
            oracle_test: "tests/ins_coast_schuler_navego_oracle.rs::coast_error_model_matches_the_corrected_navego_runs",
            source: "NaveGo v1.4",
            flag: "",
        },
        OracleBasisEntry {
            requirement: "Common-mode integrity blindness",
            basis: P2NumericalLibrary,
            oracle_test: "tests/lunar_common_mode_parity_numpy_oracle.rs::common_mode_split_matches_numpy_lstsq_on_parity_bearing_inputs",
            source: "numpy linalg.lstsq",
            flag: "",
        },
        OracleBasisEntry {
            requirement: "Lunar joint multi-technique OD + clock",
            basis: P2NumericalLibrary,
            oracle_test: "tests/lunar_joint_od_numpy_oracle.rs::joint_solve_linear_algebra_matches_numpy",
            source: "numpy 2.4.6",
            flag: "",
        },
        OracleBasisEntry {
            requirement: "Lunar-VLBI station-coordinate covariance from a tracking schedule",
            basis: Library,
            oracle_test: "tests/lunar_vlbi_campaign_spice_oracle.rs::lunar_vlbi_fim_matches_spice_geometry_and_numpy",
            source: "NAIF SPICE",
            flag: "",
        },
        OracleBasisEntry {
            requirement: "Residual-outside-Omega undetectable common-mode bound",
            basis: P2NumericalLibrary,
            oracle_test: "tests/gls_outside_omega_bound_numpy_oracle.rs::undetectable_common_mode_ceiling_matches_numpy_lapack",
            source: "numpy 2.3.5",
            flag: "",
        },
        OracleBasisEntry {
            requirement: "Basis-invariant classification of the coupled frame and timescale null space",
            basis: P2NumericalLibrary,
            oracle_test: "tests/lunar_gauge_classification_scipy_oracle.rs::classify_null_space_matches_scipy_subspace_intersection",
            source: "SciPy/NumPy",
            flag: "",
        },
        OracleBasisEntry {
            requirement: "Single-frequency ionospheric and UTC services of a LEO navigation message",
            basis: Library,
            oracle_test: "tests/leo_navmsg_services_gnsstk_oracle.rs::services_match_gnsstk_and_erfa",
            source: "GNSSTk",
            flag: "",
        },
        OracleBasisEntry {
            requirement: "5G non-terrestrial-network positioning accuracy from signal bandwidth",
            basis: P1WorkedValue,
            oracle_test: "tests/ntn_crlb_published_value_oracle.rs",
            source: "Bachl, Lei and Nabeel, arXiv:2608.10270",
            flag: "",
        },
        OracleBasisEntry {
            requirement: "Liu et al. 2025 22-parameter LEO ephemeris model and its fit on real precise orbits",
            basis: Measured,
            oracle_test: "tests/leo_navmsg_fit_real_orbit_oracle.rs::liu22_model_matches_the_published_sisre",
            source: "Liu, Su, Xie, Zhou and Qu (2025)",
            flag: "",
        },
        OracleBasisEntry {
            requirement: "LLR measured-range model (reflector catalogue, ITRF2020 stations, DE440 principal-axis placement, IERS 2010 barycentric light time)",
            basis: Measured,
            oracle_test: "tests/lunar_llr_geometry_range_oracle.rs::reflector_ranges_bcrs_iers2010_relativistic",
            source: "ILRS CRD v2 lunar normal points",
            flag: "",
        },
        OracleBasisEntry {
            requirement: "Lunar geodetic VLBI, kernel path",
            basis: Library,
            oracle_test: "tests/lunar_vlbi_spice_oracle.rs::kernel_delay_and_partials_match_spice_light_times_near_j2000",
            source: "NAIF SPICE Toolkit N0067",
            flag: "",
        },
        OracleBasisEntry {
            requirement: "NAIF kernel reader: DAF container, SPK type 2 and binary PCK type 2",
            basis: Library,
            oracle_test: "tests/naif_reader_spice_oracle.rs::reader_matches_spice_and_anise_on_the_post_registration_grid",
            source: "NAIF SPICE Toolkit N0067",
            flag: "",
        },
        OracleBasisEntry {
            requirement: "Lunar-surface-point coordinate covariance from a VLBI delay schedule, kernel path",
            basis: Library,
            oracle_test: "tests/lunar_vlbi_surface_point_spice_oracle.rs::surface_point_covariance_kernel_path_matches_spice_geometry_and_numpy",
            source: "NAIF SPICE Toolkit N0067",
            flag: "",
        },
        OracleBasisEntry {
            requirement: "Lunar frame datum from a REAL observing campaign, kernel Moon centre",
            basis: Library,
            oracle_test: "tests/validate_llr_datum_kernel_moon_fresh.rs::llr_datum_kernel_moon_matches_spice_and_numpy_on_fresh_normal_points",
            source: "NAIF SPICE Toolkit N0067",
            flag: "",
        },
        OracleBasisEntry {
            requirement: "Sun, Moon, Mercury and Venus positions from the DE440 kernel at UTC epochs (KernelEphemeris)",
            basis: Library,
            oracle_test: "tests/kernel_ephemeris_skyfield_oracle.rs::kernel_ephemeris_matches_skyfield_at_utc_epochs",
            source: "Skyfield 1.54",
            flag: "",
        },
        OracleBasisEntry {
            requirement: "Lunar frame datum covariance with the stations estimated, against 50-digit extended precision",
            basis: P2NumericalLibrary,
            oracle_test: "tests/lunar_frame_campaign_mpmath_oracle.rs",
            source: "mpmath 1.3.0",
            flag: "",
        },
        OracleBasisEntry {
            requirement: "Square-root information datum solver against 50-digit extended precision",
            basis: P2NumericalLibrary,
            oracle_test: "tests/lunar_frame_campaign_srif_mpmath_oracle.rs",
            source: "mpmath 1.3.0",
            flag: "",
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

    /// `repo_root/rel` is a regular file whose every path component is spelled exactly
    /// as `rel` spells it. `Path::is_file` alone is not enough: on a case-insensitive
    /// filesystem (the macOS default) the candidate `src/SOLAR_SYSTEM.rs`, made from the
    /// constant named in a `module` field, resolved to `src/solar_system.rs`, so the
    /// committed ledger carried a link that is dead on GitHub and that a Linux
    /// regeneration drops — and `ledger_json_matches_the_matrix` failed on Linux only.
    fn is_file_exact(repo_root: &Path, rel: &str) -> bool {
        if !repo_root.join(rel).is_file() {
            return false;
        }
        let mut dir = repo_root.to_path_buf();
        for part in Path::new(rel).components() {
            let std::path::Component::Normal(name) = part else {
                return false;
            };
            let listed = std::fs::read_dir(&dir)
                .map(|it| it.flatten().any(|e| e.file_name() == name))
                .unwrap_or(false);
            if !listed {
                return false;
            }
            dir.push(name);
        }
        true
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
                    .filter(|p| is_file_exact(repo_root, p))
                    .map(|p| link_for(&p))
                    .collect();
                let test_paths: Vec<String> = extract_rs_paths(it.tests)
                    .into_iter()
                    .filter(|p| is_file_exact(repo_root, p))
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
        let why = |k: OracleKind| -> &'static str { k.modelled_reason() };
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

    // ── The promotion rule, applied both ways: every VALIDATED row declares which
    // accepted oracle kind backs it, and nothing else may declare one ────────────
    #[test]
    fn every_validated_row_declares_exactly_one_oracle_basis() {
        let m = verification_matrix();
        let basis = validated_oracle_basis();
        for it in m
            .iter()
            .filter(|i| i.status == VerificationStatus::Validated)
        {
            let n = basis
                .iter()
                .filter(|b| b.requirement == it.requirement)
                .count();
            assert_eq!(
                n, 1,
                "Validated row '{}' must declare exactly one oracle basis (found {n})",
                it.requirement
            );
        }
        for b in &basis {
            let row = m.iter().find(|i| i.requirement == b.requirement);
            assert!(
                matches!(row, Some(r) if r.status == VerificationStatus::Validated),
                "oracle basis declared for '{}', which is not a Validated row",
                b.requirement
            );
        }
    }

    /// The row a declaration is keyed to.
    fn row_of(b: &OracleBasisEntry) -> VerificationItem {
        verification_matrix()
            .into_iter()
            .find(|i| i.requirement == b.requirement)
            .expect("declaration keyed to a matrix row (checked above)")
    }

    #[test]
    fn a_declared_basis_quotes_the_rows_own_source_and_test() {
        for b in validated_oracle_basis() {
            let row = row_of(&b);
            assert!(
                !b.source.trim().is_empty()
                    && row.oracle.to_lowercase().contains(&b.source.to_lowercase()),
                "row '{}': declared source '{}' is not named in the row's oracle text",
                b.requirement,
                b.source
            );
            // Our own second implementation, or our own earlier output, is never the oracle.
            assert!(
                !b.source.to_lowercase().contains("kshana"),
                "row '{}': the declared source is Kshana itself",
                b.requirement
            );
            let path = b.oracle_test.split("::").next().unwrap_or("");
            assert!(
                path.ends_with(".rs") && (path.starts_with("tests/") || path.starts_with("src/")),
                "row '{}': oracle test '{}' must be tests/*.rs or src/*.rs, optionally ::test_fn",
                b.requirement,
                b.oracle_test
            );
            let module = path.strip_prefix("src/").map(|p| {
                p.trim_end_matches(".rs")
                    .trim_end_matches("/mod")
                    .replace('/', "::")
            });
            let cited = row.tests.contains(path)
                || module
                    .as_deref()
                    .is_some_and(|m| row.tests.contains(&format!("{m}::")));
            assert!(
                cited,
                "row '{}': oracle test '{}' is not one the row cites in its tests field",
                b.requirement, b.oracle_test
            );
        }
    }

    #[test]
    fn p2_rows_name_an_independent_numerical_library() {
        const NUMERICAL: [&str; 5] = ["numpy", "scipy", "lapack", "rtklib", "mpmath"];
        for b in validated_oracle_basis()
            .into_iter()
            .filter(|b| b.basis == OracleBasis::P2NumericalLibrary)
        {
            let s = b.source.to_lowercase();
            assert!(
                NUMERICAL.iter().any(|n| s.contains(n)),
                "P2 row '{}': source '{}' is not an independent numerical library",
                b.requirement,
                b.source
            );
        }
    }

    // Rows the written rule does not support are flagged, never silently kept; the list is
    // pinned here and printed in docs/VALIDATION.md ("Existing VALIDATED rows re-examined").
    #[test]
    fn flagged_rows_are_exactly_the_documented_ones() {
        // Release 0.30 round 2 re-backed all three formerly flagged rows on pre-registered
        // external comparisons (docs/VALIDATION.md); none is flagged now.
        const FLAGGED: [&str; 0] = [];
        let mut got: Vec<&str> = validated_oracle_basis()
            .into_iter()
            .filter(|b| !b.flag.is_empty())
            .map(|b| b.requirement)
            .collect();
        got.sort_unstable();
        let mut want = FLAGGED.to_vec();
        want.sort_unstable();
        assert_eq!(
            got, want,
            "flagged rows changed: update docs/VALIDATION.md too"
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

    // ── The README headline counts, checked where every row edit is tested ─────────
    // tests/readme_validation_counts_doc_sync.rs pins every README count site, and it did
    // fail when the 0.30 round-1 promotions moved the matrix to 93 VALIDATED while the
    // README badge still said 83. Nobody saw it: that integration ran the full suite only
    // part of the way (the run stopped before the `readme_*` binaries), and CI runs only on
    // pushes and pull requests to main, so the integration branch had no CI at all. Every
    // row change is tested with `cargo test --lib verification::` first, so the headline
    // badge and the summary line are pinned here as well, where that run catches them. The
    // integration test keeps the full list of sites; this is an earlier tripwire, not a
    // replacement.
    #[test]
    fn readme_headline_counts_match_the_matrix() {
        let m = verification_matrix();
        let s = summarize(&m);
        let readme = include_str!("../README.md");
        let badge = format!("badge/validated-{}%2F{}-", s.validated, s.total);
        assert!(
            readme.contains(&badge),
            "README.md validated badge is stale: expected {badge:?}; update README.md and \
             run tests/readme_validation_counts_doc_sync.rs for every other count site"
        );
        let line = format!(
            "{} rows — {} VALIDATED, {} MODELLED, {} PARTNER",
            s.total, s.validated, s.modelled, s.partner_owned
        );
        assert!(
            readme.contains(&line),
            "README.md matrix summary line is stale: expected {line:?}"
        );
    }
}
