// SPDX-License-Identifier: AGPL-3.0-only
//! **Per-figure-of-merit validation tier.**
//!
//! Every number a study report shows next to a [`crate::fom::FoMScores`] field
//! is either externally *validated* against an authoritative oracle or it is a
//! *modelled* first-principles figure. A reader — especially a procurement
//! reviewer — must be able to tell which, inline, next to the value. This module
//! is the single name→tier lookup that surfaces that distinction.
//!
//! **Single source of truth.** The tier is *derived from* the existing
//! verification matrix ([`crate::verification::verification_matrix`]); this
//! module deliberately does **not** keep a second, independent matrix that could
//! drift. Each FoM field name is mapped to the matrix `requirement` that owns it,
//! and the tier is read back from that row's [`VerificationStatus`]. If a metric
//! has no owning row, the lookup returns the most conservative honest tier rather
//! than inventing a validation halo.
//!
//! **Why the timing FoMs are MODELLED.** The timing-domain figures
//! (`timing_rms_ns`, `timing_p95_ns`, `holdover_s`, `resilience_slope_ns_per_s`,
//! `availability`) are all produced by the clock-holdover scoring engine over a
//! *modelled* GNSS-denied coast (the matrix's "GNSS-denied clock holdover" /
//! "Onboard clock state estimation" rows, both `Modelled`). The `integrity` and
//! `security` FoMs are, per their own field docs in [`crate::fom::FoMScores`], a
//! Kalman self-consistency fraction and an analytic spoof-detectability bound —
//! explicitly **not** the externally-validated aviation RAIM / multi-satellite
//! detector. So they are mapped to their honest modelled rows, never to the
//! Validated RAIM core.

use crate::verification::{verification_matrix, VerificationStatus};

/// The honest validation tier shown next to a figure of merit in a report.
///
/// Mirrors [`VerificationStatus`] but in the FoM-reporting vocabulary the rest of
/// the product uses (`Partial` is reserved for a metric that is only validated in
/// part of its operating envelope; the current FoMs are all `Modelled`).
#[derive(Clone, Copy, Debug, PartialEq, Eq, serde::Serialize)]
pub enum ValidationTier {
    /// Checked against an independent external oracle (dataset / published vectors
    /// / published value) — see the matrix's `Validated` rows.
    Validated,
    /// Implemented from published or first-principles physics with tests, but not
    /// checked against an external oracle to a stated tolerance.
    Modelled,
    /// Validated only over part of its operating envelope; modelled elsewhere.
    Partial,
}

impl ValidationTier {
    /// Short upper-case tag for inline rendering, e.g. `(MODELLED)`.
    pub fn tag(self) -> &'static str {
        match self {
            ValidationTier::Validated => "VALIDATED",
            ValidationTier::Modelled => "MODELLED",
            ValidationTier::Partial => "PARTIAL",
        }
    }
}

/// The verification-matrix `requirement` that owns each FoM field. The tier is
/// read back from that row, so the matrix stays the single source of truth and
/// this is only a name→row crosswalk, never a second status table.
///
/// The timing-domain FoMs are owned by the modelled clock-holdover rows; the
/// `integrity`/`security` FoMs are mapped to the rows describing the actual
/// quantity reported (a filter self-consistency fraction; an analytic
/// spoof-detectability bound) — deliberately not the Validated aviation RAIM row,
/// because [`crate::fom::FoMScores`] documents those fields as *not* being it.
fn owning_requirement(fom: &str) -> Option<&'static str> {
    Some(match fom {
        "timing_rms_ns"
        | "timing_p95_ns"
        | "holdover_s"
        | "resilience_slope_ns_per_s"
        | "availability" => "GNSS-denied clock holdover",
        "integrity" => "Onboard clock state estimation",
        "security" => "Spoofing detection",
        _ => return None,
    })
}

/// The honest validation tier for a [`crate::fom::FoMScores`] field name, derived
/// from the verification matrix.
///
/// Returns `None` only for a name that is not a known FoM field. For a known FoM
/// whose owning row is missing from the matrix, returns the most conservative
/// honest tier ([`ValidationTier::Modelled`]) — it never fabricates `Validated`.
pub fn tier_for(fom: &str) -> Option<ValidationTier> {
    let requirement = owning_requirement(fom)?;
    let status = verification_matrix()
        .into_iter()
        .find(|it| it.requirement == requirement)
        .map(|it| it.status);
    Some(match status {
        Some(VerificationStatus::Validated) => ValidationTier::Validated,
        // A modelled, partner-owned, or (defensively) absent row all map to the
        // conservative tier — never a validation halo the matrix didn't grant.
        Some(VerificationStatus::Modelled) | Some(VerificationStatus::PartnerOwned) | None => {
            ValidationTier::Modelled
        }
    })
}

#[cfg(test)]
mod tests {
    use super::*;

    // Every FoM field resolves to a tier; an unknown name does not.
    #[test]
    fn known_foms_resolve_unknown_does_not() {
        for name in [
            "timing_rms_ns",
            "timing_p95_ns",
            "holdover_s",
            "resilience_slope_ns_per_s",
            "availability",
            "integrity",
            "security",
        ] {
            assert!(tier_for(name).is_some(), "no tier for {name}");
        }
        assert_eq!(tier_for("not_a_fom"), None);
    }

    // The tier is the matrix's status, not an independent assertion: every FoM's
    // owning requirement must exist in the matrix and its tier must match.
    #[test]
    fn tier_is_read_back_from_the_matrix() {
        let matrix = verification_matrix();
        for name in [
            "timing_rms_ns",
            "timing_p95_ns",
            "holdover_s",
            "resilience_slope_ns_per_s",
            "availability",
            "integrity",
            "security",
        ] {
            let req = owning_requirement(name).expect("known FoM has an owning requirement");
            let row = matrix
                .iter()
                .find(|it| it.requirement == req)
                .unwrap_or_else(|| panic!("owning requirement '{req}' missing from matrix"));
            let expected = match row.status {
                VerificationStatus::Validated => ValidationTier::Validated,
                _ => ValidationTier::Modelled,
            };
            assert_eq!(tier_for(name), Some(expected), "tier drift for {name}");
        }
    }

    // The honest expectation: holdover is a modelled coast, never validated.
    #[test]
    fn holdover_is_modelled() {
        assert_eq!(tier_for("holdover_s"), Some(ValidationTier::Modelled));
    }

    // The tag strings are stable for inline rendering.
    #[test]
    fn tags_are_stable() {
        assert_eq!(ValidationTier::Validated.tag(), "VALIDATED");
        assert_eq!(ValidationTier::Modelled.tag(), "MODELLED");
        assert_eq!(ValidationTier::Partial.tag(), "PARTIAL");
    }
}
