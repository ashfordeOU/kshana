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
#[derive(Clone, Copy, Debug, PartialEq, Eq)]
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
#[derive(Clone, Copy, Debug, PartialEq, Eq)]
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
#[derive(Clone, Copy, Debug)]
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
            tests: "tests/* (666 AIAA verification vectors, 4.12 mm)",
            oracle: "AIAA 2006-6753 SGP4 verification vectors",
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
            requirement: "ML detector-evaluation metrics (ROC/AUC/confusion/Pfa-Pmd)",
            capability: "AUC (Mann-Whitney, ties ½), confusion matrix at threshold, P_d/P_md/P_fa/precision/accuracy/F1",
            module: "impairment_eval (auc, confusion_at, roc_curve)",
            tests: "tests/eval_metrics_reference.rs (5 datasets, 24 thresholds; exact counts + <1e-9)",
            oracle: "scikit-learn 1.9.0 (Pedregosa et al., JMLR 2011) — independent library, exact match",
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
        // ── Modelled (first-principles / published formulae, internally checked)─
        VerificationItem {
            requirement: "GNSS-denied clock holdover",
            capability: "Closed-form coast-error growth + holdover-to-threshold; quantum-clock classes",
            module: "holdover",
            tests: "holdover::tests (vs multi-step Kalman covariance recursion; white-FM exact; round-trip)",
            oracle: "Multi-step clock_state covariance recursion (same-codebase cross-check)",
            oracle_kind: ReferenceImpl,
            status: Modelled,
        },
        VerificationItem {
            requirement: "Onboard clock state estimation",
            capability: "3-state (phase/freq/drift) van-Loan Kalman clock, Joseph-stabilised",
            module: "clock_state",
            tests: "clock_state::tests (analytic van-Loan Q; NEES consistency; PSD positivity)",
            oracle: "Analytic van-Loan Q closed form (internal algebraic identity)",
            oracle_kind: InternalConsistency,
            status: Modelled,
        },
        VerificationItem {
            requirement: "Time-transfer error budgeting",
            capability: "Two-way/TWSTFT (Sagnac), GNSS common-view, PPP; link-jitter→range",
            module: "timetransfer, timetransfer_adv",
            tests: "timetransfer::tests (reciprocal cancellation; two-form Sagnac identity)",
            oracle: "BIPM 2Aω/c² Sagnac closed form (internal algebraic identity)",
            oracle_kind: InternalConsistency,
            status: Modelled,
        },
        VerificationItem {
            requirement: "Nav-signal modulation & code-tracking analysis",
            capability: "BPSK-R/BOC PSD, spectral-separation κ, Gabor bandwidth, DLL jitter, multipath",
            module: "navsignal",
            tests: "navsignal::tests (BPSK self-SSC = 2/3R_c; unit-area PSD; DLL)",
            oracle: "Betz 2001 / Kaplan & Hegarty closed forms (internal algebraic identity)",
            oracle_kind: InternalConsistency,
            status: Modelled,
        },
        VerificationItem {
            requirement: "Quantum inertial sensor performance",
            capability: "Cold-atom interferometer accelerometer from first principles (k_eff·T², QPN)",
            module: "inertial::quantum_imu",
            tests: "quantum_imu::tests (k_eff; Mach-Zehnder T²; Freier-2016 floor bracket)",
            oracle: "Freier et al. 2016 mobile gravimeter — order-of-magnitude bracket, not parity",
            oracle_kind: ExternalDataset,
            status: Modelled,
        },
        VerificationItem {
            requirement: "Quantum inertial dead-reckoning resilience",
            capability: "Composed bias + scale-factor + VRW + stability-decay position budget over holdover",
            module: "inertial::quantum_imu (QuantumNavBudget)",
            tests: "budget_tests (bias vs AccelModel integrator; VRW vs analytic integral; round-trip)",
            oracle: "AccelModel Euler integrator (same-codebase reference); analytic closed forms",
            oracle_kind: ReferenceImpl,
            status: Modelled,
        },
        VerificationItem {
            requirement: "GNSS-denied jamming resilience",
            capability: "Geometry J/S link budget, anti-jam C/N₀, per-satellite loss-of-lock",
            module: "jamming",
            tests: "jamming::tests (PSD-derived Q cross-check; despreading)",
            oracle: "Anti-jam C/N₀ equation; navsignal PSD-derived Q (internal)",
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
            requirement: "Cislunar mission analysis",
            capability: "CR3BP STM + single-shooting differential corrector; L2 southern NRHO",
            module: "cr3bp",
            tests: "cr3bp::tests (STM vs finite-diff; reproduces 9:2 NRHO regime ≈6.57 d)",
            oracle: "Published Gateway 9:2 NRHO period/perilune (literature, approximate)",
            oracle_kind: ExternalDataset,
            status: Modelled,
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
            tests: "tests/golden.rs, tests/determinism.rs, tests/cross_platform_golden.rs",
            oracle: "Pinned golden FoM (1e-6) + SHA-256 determinism (self-consistency)",
            oracle_kind: InternalConsistency,
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
            requirement: "Quantum-vs-classical PNT trade & GNSS-denied resilience (13503)",
            capability: "Measured-ADEV ingestion (NNLS), trade table (timing/inertial holdover + benefit), resilience-vs-time envelope; floor caveat carried on the artifact. Runnable from the CLI/bindings as the `quantum-trade` scenario kind (scenarios/quantum-trade.toml)",
            module: "quantum_trade",
            tests: "quantum_trade::tests (ADEV round-trip recovery, NNLS non-negativity, floor-caveat present/absent, benefit>1, monotone envelope + alt-PNT bound); dominance_demonstrators (measured-ADEV is data-driven not floor-assumed, assumed-class flags floor + caveat, malformed curve rejected, MODELLED-not-VALIDATED)",
            oracle: "ADEV→q round-trip vs the holdover noise model; quantifies (never validates) a partner clock/CAI; numbers MODELLED, no validation halo",
            oracle_kind: ReferenceImpl,
            status: Modelled,
        },
        VerificationItem {
            requirement: "Space-weather environment & activity-driven thermospheric density",
            capability: "Solar/geomagnetic indices (definitional Kp↔ap table), Jacchia-1971 exospheric temperature, and a calibrated first-order activity density correction over the static USSA76 atmosphere (the solar-cycle density swing the static model omits). Runnable from the CLI/bindings as the `space-weather` scenario kind (scenarios/space-weather.toml)",
            module: "space_weather",
            tests: "space_weather::tests (Kp↔ap exact at grid points + round-trip + monotone, daily-Ap mean, exospheric-T vs published solar-min/mean/max + storm increment anchors, density unity-at-reference, solar-cycle swing in the observed 5–10× band, scenario reproducible + MODELLED-not-VALIDATED + out-of-range rejection); dominance_demonstrators (reachable + reproducible + physical T + MODELLED-not-VALIDATED)",
            oracle: "Definitional Kp↔ap table + published Jacchia-71 exospheric-temperature magnitudes; the density correction is a CALIBRATED first-order scale-height model (anchored to the empirical solar-cycle swing), NOT a data-validated (NRLMSISE) atmosphere",
            oracle_kind: InternalConsistency,
            status: Modelled,
        },
        VerificationItem {
            requirement: "CCSDS OEM interoperability (GMAT/Orekit/STK ephemeris import)",
            capability: "CCSDS 502.0 OEM importer (parse_oem), tolerant of COMMENT lines / extra metadata keywords / covariance blocks and the exact inverse of the writer; round-trip + external-file ingest with a velocity-consistency check. Runnable from the CLI/bindings as the `oem-interop` scenario kind (scenarios/oem-interop.toml)",
            module: "oem",
            tests: "oem::tests (parse an external-tool OEM with extra keywords/comments/covariance, write→read round-trip of the full state, pos+vel+accel tolerated, position-only + missing-mandatory-metadata rejected, scenario round-trip high-fidelity + external ingest); dominance_demonstrators (reachable + reproducible + round-trip exact + MODELLED-not-VALIDATED)",
            oracle: "Round-trip against the writer (import is the exact inverse of export) + a vendored external-tool-style OEM fixture; a structural/physical ingest check, NOT an orbit-accuracy validation of the source",
            oracle_kind: ReferenceImpl,
            status: Modelled,
        },
        VerificationItem {
            requirement: "Launch-window & ascent geometry (mission analysis)",
            capability: "Two-body launch azimuth(s) (sin Az = cos i / cos lat), minimum reachable inclination, circular velocity, Earth-rotation eastward bonus, dogleg plane-change Δv and daily opportunities. Runnable from the CLI/bindings as the `launch-window` scenario kind (scenarios/launch-window.toml)",
            module: "launch",
            tests: "launch::tests (due-east launch reaches i=latitude, KSC→ISS = textbook 45°, polar = N/S, i<lat unreachable, 465 m/s equatorial bonus, plane-change 10° ≈ 1.34 km/s + 180° = 2v, daily-opportunity counts, scenario reproducible/MODELLED + dogleg path); dominance_demonstrators (reachable + reproducible + KSC→ISS 45° + MODELLED-not-VALIDATED)",
            oracle: "Closed-form spherical-trig launch geometry vs published anchors (KSC→ISS 45°, equatorial 465 m/s); MODELLED two-body, no rotating-Earth velocity-triangle / ascent / drag-loss model",
            oracle_kind: InternalConsistency,
            status: Modelled,
        },
        VerificationItem {
            requirement: "Ballistic re-entry corridor (Allen–Eggers)",
            capability: "Peak deceleration (ballistic-coefficient-independent), velocity + altitude at peak-g, and peak-heating velocity for an exponential-atmosphere ballistic entry. Runnable from the CLI/bindings as the `reentry` scenario kind (scenarios/reentry.toml)",
            module: "reentry",
            tests: "reentry::tests (peak-g independent of ballistic coefficient + physical g-band, grows with steeper γ / faster entry, peak-g velocity = V_e·e^(−1/2) and peak-heating = V_e·e^(−1/6) faster, peak-g altitude physical + deeper for higher B, scenario reproducible/MODELLED + degenerate-geometry rejected); dominance_demonstrators (reachable + reproducible + V_e·e^(−1/2) fraction + MODELLED-not-VALIDATED)",
            oracle: "Closed-form Allen–Eggers analytic entry (peak-g formula, e^(−1/2)/e^(−1/6) velocity fractions); MODELLED ballistic (no lift), no aerothermal/TPS model — heating output is a velocity, not a heat-flux",
            oracle_kind: InternalConsistency,
            status: Modelled,
        },
        VerificationItem {
            requirement: "EO payload footprint & coverage geometry",
            capability: "SMAD space-triangle geometry: Earth angular radius, swath width, nadir GSD, maximum off-nadir access, circular period + equatorial ground-track spacing with a contiguous-coverage flag. Runnable from the CLI/bindings as the `eo-coverage` scenario kind (scenarios/eo-coverage.toml)",
            module: "eo_payload",
            tests: "eo_payload::tests (angular radius 64° at 700 km + shrinks with altitude, nadir→zenith/zero-range, horizon→ε=0/max central angle, past-horizon errors, swath grows with FOV / GSD with altitude, ~2750 km node spacing, scenario reproducible/MODELLED + bad-input rejection); dominance_demonstrators (reachable + reproducible + 64° angular radius + MODELLED-not-VALIDATED)",
            oracle: "Closed-form SMAD/Wertz space-triangle relations vs known anchors (ρ=64° @700 km, GSD=h·IFOV); MODELLED spherical-Earth geometry, no radiometry/MTF/atmosphere/jitter/glint, nodal spacing (no J2 regression)",
            oracle_kind: InternalConsistency,
            status: Modelled,
        },
        VerificationItem {
            requirement: "CCSDS Space Packet (133.0) TM/TC framing",
            capability: "CCSDS 133.0-B Space Packet primary-header encode/decode (version/type/sec-hdr/APID/seq-flags/count/data-length) + a framing scenario. Runnable from the CLI/bindings as the `space-packet` scenario kind (scenarios/space-packet.toml)",
            module: "space_packet",
            tests: "space_packet::tests (primary-header bits match the CCSDS-133 layout on a hand-derived packet, TC + secondary-header flag bits, encode→decode round-trips all fields, data-length-field = octets−1, out-of-range/empty rejected, truncated/length-mismatched decode rejected, scenario deterministic + round-trip-exact); dominance_demonstrators (reachable + deterministic + round-trip-exact + never-VALIDATED)",
            oracle: "Round-trip against the encoder (decode is the exact inverse of encode) + a hand-derived header byte vector; exact deterministic framing, NOT a CCSDS conformance certification",
            oracle_kind: ReferenceImpl,
            status: Modelled,
        },
        VerificationItem {
            requirement: "3-DOF attitude & pointing error budget (AOCS)",
            capability: "Gravity-gradient worst-case disturbance torque ((3/2)(μ/R³)ΔI) + RSS pointing-error budget over named 1σ contributors with the dominant term. Runnable from the CLI/bindings as the `attitude-budget` scenario kind (scenarios/attitude-budget.toml)",
            module: "attitude_budget",
            tests: "attitude_budget::tests (GG torque magnitude + vanishes for a symmetric body + grows lower-down + linear in ΔI, RSS is the quadrature sum + monotone, scenario reproducible/MODELLED + variance-fractions-sum-to-1 + dominant term + bad-input rejection); dominance_demonstrators (reachable + reproducible + positive budget/torque + MODELLED-not-VALIDATED)",
            oracle: "Closed-form gravity-gradient torque and quadrature RSS; MODELLED scalar AOCS budget — no control-loop/6-DoF/flexible-mode simulation (a pre-hardware complement to Basilisk/42)",
            oracle_kind: InternalConsistency,
            status: Modelled,
        },
        VerificationItem {
            requirement: "Ground-station pass prediction (ground segment)",
            capability: "Time-domain visibility passes (AOS/TCA/LOS, max elevation, duration) of an orbit over a station above an elevation mask, with interpolated rise/set crossings and total access. Runnable from the CLI/bindings as the `passes` scenario kind (scenarios/passes.toml)",
            module: "passes",
            tests: "passes::tests (interp-cross is linear + degenerate-safe, a polar orbit gives a mid-lat station valid passes with max-el ≥ mask and AOS≤TCA≤LOS and 0<duration<period, higher mask ⇒ fewer-or-equal passes, scenario reproducible/MODELLED + bad-input rejection); dominance_demonstrators (reachable + reproducible + every pass clears the mask + MODELLED-not-VALIDATED)",
            oracle: "Geometric look-angle (frames::look_angles) over TEME→ECEF propagation vs the mask; MODELLED Keplerian + Earth-rotation, no SGP4 drag/J2 regression, TCA at sample-step resolution",
            oracle_kind: ReferenceImpl,
            status: Modelled,
        },
        VerificationItem {
            requirement: "One-way link budget (comms / link design)",
            capability: "Free-space path loss, C/N₀, Eb/N₀, margin and closure over the CCSDS 401 / DSN 810-005 link equation for EIRP/G·T/range/rate/band against a required Eb/N₀. Runnable from the CLI/bindings as the `link-budget` scenario kind (scenarios/link-budget.toml)",
            module: "linkbudget",
            tests: "linkbudget::tests (free-space-loss form, link-equation closure on representative deep-space params); dominance_demonstrators (reachable + reproducible + margin = Eb/N0 − required self-consistency + closes flag)",
            oracle: "Closed-form CCSDS 401 / DSN 810-005 link equation; a deterministic engineering calculation — inputs are user-supplied or cited order-of-magnitude defaults, not a calibrated terminal datasheet",
            oracle_kind: InternalConsistency,
            status: Modelled,
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
    ]
}

/// Count of rows by status.
#[derive(Clone, Copy, Debug, PartialEq, Eq)]
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
