// SPDX-License-Identifier: AGPL-3.0-only
//! **External-oracle harness wired to the honesty gate.**
//!
//! A capability is only ever labelled [`VerificationStatus::Validated`] when it is
//! checked against an *independent external* oracle — an authoritative dataset,
//! published verification vectors, or a published numeric value — to a stated
//! tolerance (see [`crate::verification`]). This module is the executable harness
//! that performs that check: it takes a small set of known-answer vectors (KATs),
//! compares the implementation's computed values against them within tolerance,
//! and — crucially — refuses to let a *passing* comparison justify a `Validated`
//! label unless the oracle is genuinely an [`OracleKind::ExternalDataset`].
//!
//! [`OracleKind`]: crate::verification::OracleKind
//! [`VerificationStatus::Validated`]: crate::verification::VerificationStatus::Validated
//!
//! **The honesty constraint, in code.** A reference re-implementation in this same
//! codebase or an internal algebraic identity can *pass* every KAT and still not be
//! an external validation. [`justifies_validated`] encodes that distinction: it
//! returns `true` only when the report passed **and** the oracle's
//! [`OracleKind`] is [`ExternalDataset`]. Every other kind — [`ReferenceImpl`],
//! [`InternalConsistency`], [`NoneKind`] — stays Modelled no matter how clean the
//! match. This mirrors the per-status evidence invariant the verification matrix
//! already enforces, so the harness cannot be used to launder a self-consistency
//! check into a validation halo.
//!
//! [`ExternalDataset`]: crate::verification::OracleKind::ExternalDataset
//! [`ReferenceImpl`]: crate::verification::OracleKind::ReferenceImpl
//! [`InternalConsistency`]: crate::verification::OracleKind::InternalConsistency
//! [`NoneKind`]: crate::verification::OracleKind::NoneKind
//!
//! This module is `wasm32`-safe: it uses only `f64` math and owned strings, never
//! calls [`std::time::SystemTime::now`], and holds no `HashMap`.

use crate::verification::OracleKind;

/// A single known-answer test vector: a labelled expected value with an absolute
/// tolerance the computed value must fall within.
#[derive(Clone, Debug, PartialEq)]
pub struct Kat {
    /// Identifier matching the corresponding computed value's label.
    pub label: String,
    /// The authoritative expected value (from the external oracle).
    pub expected: f64,
    /// Absolute tolerance: the comparison passes iff `|computed - expected| <= tol`.
    pub tol: f64,
}

/// An external-oracle definition: a named set of KAT vectors together with the
/// honest [`OracleKind`] describing how the oracle actually backs the claim.
#[derive(Clone, Debug)]
pub struct Oracle {
    /// Human-readable oracle name (e.g. the dataset or published source).
    pub name: String,
    /// How this oracle backs the claim — the honesty discriminator. Only
    /// [`OracleKind::ExternalDataset`] can justify a `Validated` label.
    pub kind: OracleKind,
    /// The known-answer vectors the implementation is checked against.
    pub vectors: Vec<Kat>,
}

/// The outcome of running an [`Oracle`] against a set of computed values.
#[derive(Clone, Debug, PartialEq)]
pub struct OracleReport {
    /// `true` iff every KAT vector had a matching computed value within tolerance.
    pub passed: bool,
    /// Per-vector outcome: `(label, within_tolerance, abs_error)`. A vector with no
    /// matching computed value is recorded as failed with `f64::INFINITY` error.
    pub per_vector: Vec<(String, bool, f64)>,
}

/// Check each KAT vector in `o` against the matching entry in `computed` (matched
/// by label) within the vector's absolute tolerance.
///
/// A vector whose label has no matching computed value fails with an absolute
/// error of [`f64::INFINITY`] (a missing measurement is never a pass). The report
/// `passed` flag is the conjunction over all vectors.
pub fn check(o: &Oracle, computed: &[(String, f64)]) -> OracleReport {
    let mut per_vector = Vec::with_capacity(o.vectors.len());
    let mut all_passed = true;
    for kat in &o.vectors {
        let (within, err) = match computed.iter().find(|(label, _)| *label == kat.label) {
            Some((_, value)) => {
                let err = (value - kat.expected).abs();
                (err <= kat.tol, err)
            }
            None => (false, f64::INFINITY),
        };
        all_passed &= within;
        per_vector.push((kat.label.clone(), within, err));
    }
    OracleReport {
        passed: all_passed,
        per_vector,
    }
}

/// The honesty gate: does this oracle outcome justify a [`VerificationStatus::Validated`]
/// label?
///
/// Returns `true` **only** when `report.passed` is `true` **and** the oracle is an
/// [`OracleKind::ExternalDataset`]. A passing [`OracleKind::ReferenceImpl`],
/// [`OracleKind::InternalConsistency`], or [`OracleKind::NoneKind`] oracle returns
/// `false` — the capability stays Modelled, exactly as the verification matrix
/// requires. This is the one place the harness is allowed to grant a validation
/// label, and it cannot do so for a self-consistency check.
///
/// [`VerificationStatus::Validated`]: crate::verification::VerificationStatus::Validated
pub fn justifies_validated(o: &Oracle, report: &OracleReport) -> bool {
    report.passed && o.kind == OracleKind::ExternalDataset
}

#[cfg(test)]
mod tests {
    use super::*;

    fn kats() -> Vec<Kat> {
        vec![
            Kat {
                label: "a".to_string(),
                expected: 1.0,
                tol: 1e-6,
            },
            Kat {
                label: "b".to_string(),
                expected: 2.0,
                tol: 1e-3,
            },
        ]
    }

    fn computed_within() -> Vec<(String, f64)> {
        vec![("a".to_string(), 1.0 + 1e-9), ("b".to_string(), 2.0 - 1e-4)]
    }

    // (a) A passing oracle whose kind IS ExternalDataset justifies Validated.
    #[test]
    fn passing_external_dataset_justifies_validated() {
        let o = Oracle {
            name: "published vectors".to_string(),
            kind: OracleKind::ExternalDataset,
            vectors: kats(),
        };
        let report = check(&o, &computed_within());
        assert!(report.passed, "all vectors should be within tolerance");
        assert!(
            justifies_validated(&o, &report),
            "a passing ExternalDataset oracle must justify Validated"
        );
    }

    // (b) A passing oracle whose kind is NOT ExternalDataset stays Modelled.
    #[test]
    fn passing_non_external_oracle_does_not_justify_validated() {
        for kind in [
            OracleKind::ReferenceImpl,
            OracleKind::InternalConsistency,
            OracleKind::NoneKind,
        ] {
            let o = Oracle {
                name: "self-consistency".to_string(),
                kind,
                vectors: kats(),
            };
            let report = check(&o, &computed_within());
            assert!(report.passed, "vectors are within tolerance for {kind:?}");
            assert!(
                !justifies_validated(&o, &report),
                "a passing {kind:?} oracle must NOT justify Validated — stays Modelled"
            );
        }
    }

    // (c) A failing ExternalDataset oracle does not justify Validated.
    #[test]
    fn failing_external_dataset_does_not_justify_validated() {
        let o = Oracle {
            name: "published vectors".to_string(),
            kind: OracleKind::ExternalDataset,
            vectors: kats(),
        };
        // 'b' is far outside its tolerance.
        let computed = vec![("a".to_string(), 1.0), ("b".to_string(), 9.0)];
        let report = check(&o, &computed);
        assert!(!report.passed, "an out-of-tolerance vector must fail");
        assert!(
            !justifies_validated(&o, &report),
            "a FAILING ExternalDataset oracle must NOT justify Validated"
        );
    }

    // A missing computed value for a KAT label fails with infinite error.
    #[test]
    fn missing_computed_value_fails_with_infinite_error() {
        let o = Oracle {
            name: "published vectors".to_string(),
            kind: OracleKind::ExternalDataset,
            vectors: kats(),
        };
        let computed = vec![("a".to_string(), 1.0)]; // 'b' absent
        let report = check(&o, &computed);
        assert!(!report.passed);
        let b = report
            .per_vector
            .iter()
            .find(|(label, _, _)| label == "b")
            .expect("b vector reported");
        assert!(!b.1, "missing value is not a pass");
        assert!(b.2.is_infinite(), "missing value reports infinite error");
        assert!(!justifies_validated(&o, &report));
    }
}
