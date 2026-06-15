// SPDX-License-Identifier: Apache-2.0
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
            capability: "Labelled synthetic impairment corpus + detector-agnostic ROC/AUC/confusion/Pfa-Pmd harness; leakage guard, stratified split, distribution-shift (in- vs out-of-regime) optimism report",
            module: "impairment_eval",
            tests: "impairment_eval::tests (AUC perfect=1/identical=0.5/tie=0.125, ROC monotone, fused>0.8, per-class layer separation, leakage guard, reproducible corpus, distribution-shift flags optimism)",
            oracle: "Closed-form AUC bounds (Mann–Whitney) + a perfect-oracle detector; corpus is SYNTHETIC (parameter-grounded, not field/IQ)",
            oracle_kind: InternalConsistency,
            status: Modelled,
        },
        VerificationItem {
            requirement: "Quantum-vs-classical PNT trade & GNSS-denied resilience (13503)",
            capability: "Measured-ADEV ingestion (NNLS), trade table (timing/inertial holdover + benefit), resilience-vs-time envelope; floor caveat carried on the artifact",
            module: "quantum_trade",
            tests: "quantum_trade::tests (ADEV round-trip recovery, NNLS non-negativity, floor-caveat present/absent, benefit>1, monotone envelope + alt-PNT bound)",
            oracle: "ADEV→q round-trip vs the holdover noise model; quantifies (never validates) a partner clock/CAI; numbers MODELLED, no validation halo",
            oracle_kind: ReferenceImpl,
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
