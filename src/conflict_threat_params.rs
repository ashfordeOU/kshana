// SPDX-License-Identifier: AGPL-3.0-only
//! Sourced threat-parameter provenance catalog for the conflict-resilience pack (L36).
//!
//! Every per-layer vulnerability and accuracy prior the `conflict-resilience` scenario
//! (paper P7) consumes is anchored here to an open, citable source — GNSS jamming /
//! spoofing incidence, the vendored JammerTest 2024 field campaign
//! ([`crate::realdata::jammertest`]), the TEXBAT spoofing battery, and LunaNet / IOAG
//! augmentation references. The catalog is the single place a reviewer can trace where
//! each number came from.
//!
//! ## Honesty scope (load-bearing)
//! These are **`Modelled` inputs with provenance**, NOT `Validated` measurements. The
//! cited campaigns establish the *ordering and rough magnitude* of the modelled
//! effects (L1 C/A is denied at a lower jammer power than wideband L5/E5; a spoofing
//! layer with message authentication raises the bar but shares the RF-denial vector;
//! an inertial layer is immune to that vector). The exact per-vector denial
//! probabilities, availabilities and accuracy sigmas are **allocations** informed by
//! those sources — they are not read off any dataset as a calibrated probability, so
//! they carry a citation for provenance but remain `Modelled`. The `min`/`nominal`/
//! `max` vulnerability triple is exactly the prior range the L35 sensitivity sweep
//! ranges over, so the reported spread is the honest reflection of that modelling
//! uncertainty.

use serde::Deserialize;

/// The four named threat vectors of the P7 §4.2 graceful-degradation breakdown, in a
/// fixed order (jamming, spoofing, kinetic, cyber). The aggregate
/// [`ThreatParam::vector_weight`] couples a layer to the *shared RF* denial vector used by
/// the headline resilience-ratio story; this decomposition resolves the threat into the
/// four distinct vectors so a per-vector usable-PNT survival curve can be reported for each.
pub const THREAT_VECTORS: [&str; 4] = ["jamming", "spoofing", "kinetic", "cyber"];

/// Per-vector denial susceptibility of a layer, each component in `[0, 1]`. Under threat
/// **vector `v` acting alone** at intensity `x`, the layer is denied with probability
/// `clamp(susceptibility_v · x, 0, 1)` (see
/// [`crate::conflict_resilience::per_vector_deny`]). Kept as absolute per-vector denial
/// sensitivities — deliberately *not* multiplied by the aggregate RF `vulnerability` — so
/// the §4.2 per-vector survival breakdown is a clean, independently oracle-checkable
/// decomposition rather than a re-scaling of the headline RF story.
#[derive(Clone, Copy, Debug, PartialEq, Deserialize)]
pub struct VectorProfile {
    /// Susceptibility to RF **jamming** (broadband power denial), in `[0, 1]`.
    pub jamming: f64,
    /// Susceptibility to **spoofing** (counterfeit-signal capture), in `[0, 1]`.
    pub spoofing: f64,
    /// Susceptibility to a **kinetic** strike on the layer's physical assets, in `[0, 1]`.
    pub kinetic: f64,
    /// Susceptibility to a **cyber** attack on the layer's control / network, in `[0, 1]`.
    pub cyber: f64,
}

impl VectorProfile {
    /// The susceptibilities in [`THREAT_VECTORS`] order.
    pub fn as_array(&self) -> [f64; 4] {
        [self.jamming, self.spoofing, self.kinetic, self.cyber]
    }
}

/// A cited per-layer threat-parameter prior. All numbers are `Modelled` inputs with the
/// [`ThreatParam::citation`] provenance string; the `min`/`nominal`/`max` vulnerability
/// triple is the prior range the sensitivity sweep explores.
#[derive(Clone, Debug, PartialEq)]
pub struct ThreatParam {
    /// Human-readable layer name (e.g. `"GNSS L1 C/A (open service)"`).
    pub layer: &'static str,
    /// Base availability of the layer absent any threat, in `[0, 1]`.
    pub availability: f64,
    /// Nominal 1σ position error of the layer (metres).
    pub sigma_m: f64,
    /// Lower prior on the per-vector denial vulnerability, in `[0, 1]`.
    pub vulnerability_min: f64,
    /// Nominal prior on the per-vector denial vulnerability, in `[0, 1]`.
    pub vulnerability_nominal: f64,
    /// Upper prior on the per-vector denial vulnerability, in `[0, 1]`.
    pub vulnerability_max: f64,
    /// Coupling weight of this layer to the shared threat vector, in `[0, 1]`.
    pub vector_weight: f64,
    /// Per-vector denial susceptibility (jamming / spoofing / kinetic / cyber) driving the
    /// §4.2 graceful-degradation survival curves. `Modelled` allocation informed by the
    /// same [`ThreatParam::citation`] sources.
    pub vector_profile: VectorProfile,
    /// Provenance for the priors — an open, citable source. `Modelled`, not `Validated`.
    pub citation: &'static str,
}

/// The full sourced catalog: the four correlated RF layers that make up the conflict
/// baseline, plus two complementary alt-PNT layers (inertial, augmentation relay) a
/// caller can add for a genuinely diverse architecture. Returned in a fixed order so
/// the scenario is deterministic.
pub fn threat_catalog() -> Vec<ThreatParam> {
    vec![
        ThreatParam {
            layer: "GNSS L1 C/A (open service)",
            availability: 0.99,
            sigma_m: 4.0,
            vulnerability_min: 0.80,
            vulnerability_nominal: 0.90,
            vulnerability_max: 0.98,
            vector_weight: 0.58,
            // Jam-fragile (denied at the lowest power), spoofable (no message auth); the
            // GNSS space segment is hard to strike kinetically and the open signal exposes
            // little cyber surface at the user.
            vector_profile: VectorProfile {
                jamming: 0.98,
                spoofing: 0.85,
                kinetic: 0.12,
                cyber: 0.18,
            },
            citation: "JammerTest 2024 field campaign, Bleik/Andoya, Norway (Zenodo DOI \
                10.5281/zenodo.15910563, GPL-3.0; vendored in crate::realdata::jammertest): \
                L1 C/A loses lock at the lowest jammer power of any tracked signal. \
                Conflict-zone L1 interference incidence: OPSGROUP/GPSJAM 2024 daily \
                aircraft GNSS-interference maps; EASA Safety Information Bulletin 2022-02 \
                (GNSS outages and spoofing). Magnitudes Modelled.",
        },
        ThreatParam {
            layer: "GNSS L5 / E5a (wideband)",
            availability: 0.97,
            sigma_m: 3.0,
            vulnerability_min: 0.70,
            vulnerability_nominal: 0.85,
            vulnerability_max: 0.95,
            vector_weight: 0.60,
            // Wideband ⇒ more jam-resistant than L1 C/A but still RF-denied; comparable
            // spoof/kinetic/cyber posture.
            vector_profile: VectorProfile {
                jamming: 0.90,
                spoofing: 0.80,
                kinetic: 0.12,
                cyber: 0.18,
            },
            citation: "JammerTest 2024 (Zenodo DOI 10.5281/zenodo.15910563): the wideband \
                L5/E5 signal is more jam-resistant than L1 C/A yet is still denied at \
                moderate jammer-to-signal ratios, and shares the same RF band as the \
                conflict-zone interference in EASA SIB 2022-02. Magnitudes Modelled.",
        },
        ThreatParam {
            layer: "Galileo E1 OS + OSNMA",
            availability: 0.98,
            sigma_m: 4.0,
            vulnerability_min: 0.72,
            vulnerability_nominal: 0.88,
            vulnerability_max: 0.96,
            vector_weight: 0.59,
            // OSNMA authentication sharply lowers the spoofing susceptibility while the
            // shared RF band leaves the jamming susceptibility high.
            vector_profile: VectorProfile {
                jamming: 0.92,
                spoofing: 0.40,
                kinetic: 0.12,
                cyber: 0.22,
            },
            citation: "TEXBAT — the Texas Spoofing Test Battery (Humphreys et al., \
                University of Texas Radionavigation Laboratory, 2012): recorded live-sky \
                spoofing scenarios. Galileo OSNMA (navigation-message authentication) \
                raises the spoofing bar but still shares the RF power-denial vector. \
                Magnitudes Modelled.",
        },
        ThreatParam {
            layer: "SBAS / augmentation (WAAS/EGNOS-class)",
            availability: 0.96,
            sigma_m: 3.0,
            vulnerability_min: 0.72,
            vulnerability_nominal: 0.86,
            vulnerability_max: 0.95,
            vector_weight: 0.60,
            // Rides the L1/L5 RF band (jam-fragile) and, being a networked augmentation
            // service, carries a materially larger cyber and ground-segment kinetic surface.
            vector_profile: VectorProfile {
                jamming: 0.90,
                spoofing: 0.68,
                kinetic: 0.28,
                cyber: 0.55,
            },
            citation: "RTCA DO-229 (SBAS Minimum Operational Performance Standards) \
                nominal accuracy; an SBAS relay rides the same L1/L5 RF band, so it \
                shares the jamming vector documented by JammerTest 2024 and EASA SIB \
                2022-02. Magnitudes Modelled.",
        },
        ThreatParam {
            layer: "Inertial (navigation-grade INS)",
            availability: 0.999,
            sigma_m: 30.0,
            vulnerability_min: 0.00,
            vulnerability_nominal: 0.03,
            vulnerability_max: 0.10,
            vector_weight: 0.10,
            // Immune to RF jamming/spoofing (self-contained); residual kinetic exposure is
            // mechanical shock/upset, residual cyber exposure is onboard firmware only.
            vector_profile: VectorProfile {
                jamming: 0.00,
                spoofing: 0.00,
                kinetic: 0.20,
                cyber: 0.10,
            },
            citation: "Alt-PNT diversity layer: an inertial system is immune to the \
                RF-denial vector (residual vulnerability = mechanical shock / upset only), \
                per the DHS/CISA Resilient PNT Conformance Framework v2.0 diversity \
                principle and DARPA All-Source Positioning and Navigation (ASPN). \
                Magnitudes Modelled.",
        },
        ThreatParam {
            layer: "LunaNet / IOAG augmentation relay",
            availability: 0.95,
            sigma_m: 30.0,
            vulnerability_min: 0.10,
            vulnerability_nominal: 0.25,
            vulnerability_max: 0.45,
            vector_weight: 0.30,
            // Shares only a partial RF vector with terrestrial GNSS; as a physical relay on
            // a network it carries the largest kinetic and cyber surface of the catalog.
            vector_profile: VectorProfile {
                jamming: 0.40,
                spoofing: 0.35,
                kinetic: 0.50,
                cyber: 0.50,
            },
            citation: "LunaNet Interoperability Specification (NASA/ESA) and the IOAG \
                Lunar Communications Architecture: an augmentation / relay PNT layer that \
                shares only a partial RF vector with terrestrial GNSS. Magnitudes \
                Modelled.",
        },
    ]
}

/// The conflict baseline: the four correlated RF layers (the first four catalog
/// entries). This is deliberately the *fragile* case for the P7 story — an apparently
/// diverse GNSS stack whose members all ride the same RF band and therefore share the
/// denial vector, so the resilience gain over a single layer is both modest (~7x under
/// independence) and correlation-fragile.
pub fn conflict_baseline() -> Vec<ThreatParam> {
    threat_catalog().into_iter().take(4).collect()
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn every_param_is_a_well_formed_prior_with_a_citation() {
        for p in threat_catalog() {
            assert!(
                (0.0..=1.0).contains(&p.availability),
                "{}: availability out of range",
                p.layer
            );
            assert!(p.sigma_m > 0.0, "{}: sigma must be positive", p.layer);
            assert!(
                p.vulnerability_min <= p.vulnerability_nominal
                    && p.vulnerability_nominal <= p.vulnerability_max,
                "{}: vulnerability triple must be ordered min<=nominal<=max",
                p.layer
            );
            assert!(
                (0.0..=1.0).contains(&p.vulnerability_min)
                    && (0.0..=1.0).contains(&p.vulnerability_max),
                "{}: vulnerability priors out of range",
                p.layer
            );
            assert!(
                (0.0..=1.0).contains(&p.vector_weight),
                "{}: vector_weight out of range",
                p.layer
            );
            assert!(
                !p.citation.trim().is_empty(),
                "{}: every prior must carry a provenance citation",
                p.layer
            );
            for (name, s) in THREAT_VECTORS.iter().zip(p.vector_profile.as_array()) {
                assert!(
                    (0.0..=1.0).contains(&s),
                    "{}: {name} susceptibility {s} out of range",
                    p.layer
                );
            }
        }
    }

    #[test]
    fn baseline_layers_are_jamming_dominant() {
        // The §4.2 qualitative claim: for the correlated-RF baseline, jamming is the
        // sharpest vector — every baseline layer is at least as jam-susceptible as it is
        // susceptible to any other vector, and the mean jamming susceptibility dominates.
        let base = conflict_baseline();
        let mean = |f: fn(&VectorProfile) -> f64| {
            base.iter().map(|p| f(&p.vector_profile)).sum::<f64>() / base.len() as f64
        };
        let jam = mean(|v| v.jamming);
        assert!(jam > mean(|v| v.spoofing), "jam must dominate spoofing");
        assert!(jam > mean(|v| v.kinetic), "jam must dominate kinetic");
        assert!(jam > mean(|v| v.cyber), "jam must dominate cyber");
        for p in &base {
            let prof = p.vector_profile;
            assert!(
                prof.jamming >= prof.spoofing
                    && prof.jamming >= prof.kinetic
                    && prof.jamming >= prof.cyber,
                "{}: jamming must be the peak susceptibility",
                p.layer
            );
        }
    }

    #[test]
    fn inertial_is_rf_immune() {
        // The diversity layer must be immune to the RF vectors (jam+spoof = 0) so it can
        // carry PNT through a jamming campaign — the whole point of alt-PNT diversity.
        let inertial = threat_catalog()
            .into_iter()
            .find(|p| p.layer.contains("Inertial"))
            .expect("inertial layer present");
        assert_eq!(inertial.vector_profile.jamming, 0.0);
        assert_eq!(inertial.vector_profile.spoofing, 0.0);
    }

    #[test]
    fn conflict_baseline_is_the_four_correlated_rf_layers() {
        let base = conflict_baseline();
        assert_eq!(base.len(), 4);
        // Every baseline layer is heavily RF-vulnerable (nominal > 0.5) and shares the
        // vector (vector_weight > 0.5) — the fragile, correlated case.
        for p in &base {
            assert!(p.vulnerability_nominal > 0.5, "{}: not RF-fragile", p.layer);
            assert!(p.vector_weight > 0.5, "{}: not vector-shared", p.layer);
        }
    }

    #[test]
    fn citations_name_the_sourced_campaigns() {
        let all = threat_catalog();
        let joined: String = all.iter().map(|p| p.citation).collect::<Vec<_>>().join(" ");
        assert!(joined.contains("JammerTest 2024"));
        assert!(joined.contains("TEXBAT"));
        assert!(joined.contains("LunaNet"));
        assert!(joined.contains("zenodo"));
    }
}
