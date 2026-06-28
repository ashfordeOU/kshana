// SPDX-License-Identifier: AGPL-3.0-only
//! **Representativeness & gaps-to-flight ledger.**
//!
//! A simulation result is only useful as *evidence* if it states honestly what it
//! is anchored to, what it assumes, and what still separates it from a flight
//! system. This module makes that discipline a first-class, machine-checked output:
//! every demonstration can carry a [`Representativeness`] record listing its
//! external [`Anchor`]s, its modelled assumptions, its [`Gap`]s to flight, and the
//! TRL band it is representative for — with invariants enforced by unit tests.
//!
//! It is the companion to [`crate::verification`]: where the verification matrix
//! classifies a *capability* (validated / modelled / partner-owned), a
//! representativeness record qualifies a *specific demonstration output* so a
//! reviewer can see, on the face of the result, why it is (or is not) trustworthy
//! and what would close the remaining gaps.
//!
//! **Invariants the tests enforce:**
//! * A [`VerificationStatus::Validated`] record **must** list at least one
//!   [`OracleKind::ExternalDataset`] anchor — a simulation cannot be "validated"
//!   against itself.
//! * A [`VerificationStatus::Modelled`] record **must** list at least one
//!   gap-to-flight — a model that claims nothing remains is overclaiming.
//! * A modelled (simulation-only) record cannot claim a representativeness TRL band
//!   above 4: maturation beyond that needs hardware/flight evidence, which is a gap,
//!   not a simulation output.
//! * The TRL band is well-formed (`0 ≤ lo ≤ hi ≤ 9`).
//!
//! The record does **not** assert that the named anchors resolve to live tests —
//! those are curated, exactly like [`crate::verification`] rows. The machine-checked
//! claim is scoped to the status/anchor/gap/TRL invariants.

use crate::verification::{OracleKind, VerificationStatus};

/// An external reference a demonstration is calibrated or cross-checked against.
#[derive(Clone, Debug, serde::Serialize)]
pub struct Anchor {
    /// The quantity or behaviour that is anchored (what is checked).
    pub what: String,
    /// The external reference: a published value, dataset, or verification vectors.
    pub source: String,
    /// How that reference backs the claim (the honesty discriminator).
    pub kind: OracleKind,
}

impl Anchor {
    /// Convenience constructor.
    pub fn new(what: &str, source: &str, kind: OracleKind) -> Self {
        Anchor {
            what: what.to_string(),
            source: source.to_string(),
            kind,
        }
    }
    /// True if this anchor is an independent external dataset / published value.
    pub fn is_external(&self) -> bool {
        self.kind == OracleKind::ExternalDataset
    }
}

/// A remaining step between the modelled demonstration and a flight system.
#[derive(Clone, Debug, serde::Serialize)]
pub struct Gap {
    /// What is not yet represented / what remains to be demonstrated towards flight.
    pub gap: String,
    /// The phase or activity that would close it (e.g. "Phase B2 hardware EM test").
    pub closes_in: String,
}

impl Gap {
    /// Convenience constructor.
    pub fn new(gap: &str, closes_in: &str) -> Self {
        Gap {
            gap: gap.to_string(),
            closes_in: closes_in.to_string(),
        }
    }
}

/// Largest TRL band a simulation-only (modelled) demonstration may claim to be
/// representative for; maturation beyond this requires hardware/flight evidence.
pub const MODELLED_TRL_CEILING: u8 = 4;

/// A representativeness record attached to a demonstration output.
#[derive(Clone, Debug, serde::Serialize)]
pub struct Representativeness {
    /// The specific claim this record qualifies (one line).
    pub claim: String,
    /// Honest status of the claim (mirrors the verification matrix).
    pub status: VerificationStatus,
    /// External references the demonstration is anchored to.
    pub anchors: Vec<Anchor>,
    /// The modelling assumptions the result rests on.
    pub modelled_assumptions: Vec<String>,
    /// What still separates this demonstration from a flight system.
    pub gaps_to_flight: Vec<Gap>,
    /// The TRL band this demonstration is representative for, `(lo, hi)`.
    pub trl_band: (u8, u8),
}

impl Representativeness {
    /// A modelled demonstration: requires its assumptions and gaps-to-flight stated.
    pub fn modelled(claim: &str, trl_band: (u8, u8)) -> Self {
        Representativeness {
            claim: claim.to_string(),
            status: VerificationStatus::Modelled,
            anchors: Vec::new(),
            modelled_assumptions: Vec::new(),
            gaps_to_flight: Vec::new(),
            trl_band,
        }
    }

    /// A validated demonstration: requires at least one external anchor.
    pub fn validated(claim: &str, trl_band: (u8, u8)) -> Self {
        Representativeness {
            claim: claim.to_string(),
            status: VerificationStatus::Validated,
            anchors: Vec::new(),
            modelled_assumptions: Vec::new(),
            gaps_to_flight: Vec::new(),
            trl_band,
        }
    }

    /// Builder: add an external/cross-check anchor.
    pub fn with_anchor(mut self, a: Anchor) -> Self {
        self.anchors.push(a);
        self
    }
    /// Builder: add a modelling assumption.
    pub fn with_assumption(mut self, s: &str) -> Self {
        self.modelled_assumptions.push(s.to_string());
        self
    }
    /// Builder: add a gap-to-flight.
    pub fn with_gap(mut self, g: Gap) -> Self {
        self.gaps_to_flight.push(g);
        self
    }

    /// Whether any anchor is an independent external dataset / published value.
    pub fn has_external_anchor(&self) -> bool {
        self.anchors.iter().any(Anchor::is_external)
    }

    /// Returns the list of invariant violations; empty means the record is honest.
    pub fn check(&self) -> Vec<String> {
        let mut v = Vec::new();
        let (lo, hi) = self.trl_band;
        if lo > hi || hi > 9 {
            v.push(format!(
                "TRL band ({lo},{hi}) is not well-formed (need 0<=lo<=hi<=9)"
            ));
        }
        match self.status {
            VerificationStatus::Validated => {
                if !self.has_external_anchor() {
                    v.push(
                        "Validated claim must list at least one ExternalDataset anchor".to_string(),
                    );
                }
            }
            VerificationStatus::Modelled => {
                if self.gaps_to_flight.is_empty() {
                    v.push("Modelled claim must list at least one gap-to-flight".to_string());
                }
                if hi > MODELLED_TRL_CEILING {
                    v.push(format!(
                        "Modelled (simulation-only) claim cannot be representative above TRL {MODELLED_TRL_CEILING} (band hi={hi}); higher TRL is a gap, not a simulation output"
                    ));
                }
            }
            VerificationStatus::PartnerOwned => {
                if !self.anchors.is_empty() || !self.modelled_assumptions.is_empty() {
                    v.push("PartnerOwned claim must not assert anchors or assumptions".to_string());
                }
            }
        }
        v
    }

    /// True if the record satisfies every invariant.
    pub fn is_valid(&self) -> bool {
        self.check().is_empty()
    }

    /// Serialise to pretty JSON for embedding in a scenario report.
    pub fn to_json(&self) -> String {
        // `Representativeness` (Strings, unit enums, `Vec<Anchor>`/`Vec<Gap>`/`Vec<String>`
        // and a `(u8, u8)` tuple) has no non-string-keyed map field, so JSON serialisation
        // cannot fail.
        serde_json::to_string_pretty(self)
            .expect("Representativeness has no non-string-keyed map field, so it always serialises")
    }

    /// Render a short human-readable block.
    pub fn report(&self) -> String {
        let mut s = String::new();
        let (lo, hi) = self.trl_band;
        s.push_str(&format!(
            "Representativeness [{}] — {} (representative for TRL {lo}-{hi})\n",
            self.status.tag(),
            self.claim
        ));
        if !self.anchors.is_empty() {
            s.push_str("  anchored to:\n");
            for a in &self.anchors {
                let ext = if a.is_external() {
                    "external"
                } else {
                    "internal"
                };
                s.push_str(&format!("    - {} <- {} ({ext})\n", a.what, a.source));
            }
        }
        if !self.modelled_assumptions.is_empty() {
            s.push_str("  assumptions:\n");
            for m in &self.modelled_assumptions {
                s.push_str(&format!("    - {m}\n"));
            }
        }
        if !self.gaps_to_flight.is_empty() {
            s.push_str("  gaps to flight:\n");
            for g in &self.gaps_to_flight {
                s.push_str(&format!("    - {} (closes in: {})\n", g.gap, g.closes_in));
            }
        }
        s
    }
}

#[cfg(test)]
mod tests {
    use super::*;
    use crate::verification::OracleKind;

    #[test]
    fn validated_requires_external_anchor() {
        let bad = Representativeness::validated("optical clock ADEV", (3, 4));
        assert!(!bad.is_valid(), "validated with no anchor must fail");
        assert!(bad.check().iter().any(|m| m.contains("ExternalDataset")));

        let ok =
            Representativeness::validated("optical clock ADEV", (3, 4)).with_anchor(Anchor::new(
                "ADEV",
                "published optical-lattice curve",
                OracleKind::ExternalDataset,
            ));
        assert!(
            ok.is_valid(),
            "validated with external anchor must pass: {:?}",
            ok.check()
        );
    }

    #[test]
    fn an_internal_anchor_does_not_satisfy_validated() {
        let r = Representativeness::validated("x", (2, 3)).with_anchor(Anchor::new(
            "x",
            "sibling reimpl",
            OracleKind::ReferenceImpl,
        ));
        assert!(
            !r.is_valid(),
            "ReferenceImpl anchor is not external validation"
        );
    }

    #[test]
    fn modelled_requires_gap() {
        let bad = Representativeness::modelled("quantum time transfer chain", (3, 4));
        assert!(!bad.is_valid(), "modelled with no gap must fail");
        assert!(bad.check().iter().any(|m| m.contains("gap-to-flight")));

        let ok = Representativeness::modelled("quantum time transfer chain", (3, 4))
            .with_assumption("link asymmetry modelled, not measured")
            .with_gap(Gap::new("real optical-link hardware", "Phase B2 EM test"));
        assert!(
            ok.is_valid(),
            "modelled with a gap must pass: {:?}",
            ok.check()
        );
    }

    #[test]
    fn modelled_cannot_claim_above_trl4() {
        let r = Representativeness::modelled("x", (3, 6)).with_gap(Gap::new("hardware", "B2"));
        assert!(
            !r.is_valid(),
            "modelled cannot be representative above TRL 4"
        );
        assert!(r.check().iter().any(|m| m.contains("TRL")));
    }

    #[test]
    fn malformed_trl_band_is_caught() {
        let r = Representativeness::modelled("x", (5, 3)).with_gap(Gap::new("g", "p"));
        assert!(r.check().iter().any(|m| m.contains("well-formed")));
        let r2 = Representativeness::validated("x", (3, 12)).with_anchor(Anchor::new(
            "x",
            "src",
            OracleKind::ExternalDataset,
        ));
        assert!(r2.check().iter().any(|m| m.contains("well-formed")));
    }

    #[test]
    fn serialises_to_json_with_expected_fields() {
        let r = Representativeness::modelled("demo", (3, 4))
            .with_anchor(Anchor::new(
                "ADEV",
                "Stable32/NIST",
                OracleKind::ExternalDataset,
            ))
            .with_assumption("seeded synthetic")
            .with_gap(Gap::new("real hardware", "B2"));
        let j = r.to_json();
        for field in [
            "claim",
            "anchors",
            "modelled_assumptions",
            "gaps_to_flight",
            "trl_band",
        ] {
            assert!(j.contains(field), "json missing {field}: {j}");
        }
        assert!(j.contains("ExternalDataset"));
    }

    #[test]
    fn report_renders_sections() {
        let r = Representativeness::modelled("demo", (3, 4))
            .with_anchor(Anchor::new(
                "ADEV",
                "Stable32/NIST",
                OracleKind::ExternalDataset,
            ))
            .with_gap(Gap::new("real hardware", "B2"));
        let txt = r.report();
        assert!(txt.contains("MODELLED"));
        assert!(txt.contains("anchored to"));
        assert!(txt.contains("gaps to flight"));
    }
}
