// SPDX-License-Identifier: AGPL-3.0-only
//! A reference panel of PNT architectures and a threat-scenario ensemble, with a
//! documented, parameter-grounded reduction from (architecture, threat) to the
//! behaviour summary the scoring consumes. These reductions are MODELLED and
//! deliberately simple; they are NOT tuned to manufacture a result. The study
//! reports whatever instability emerges from genuinely different architectures
//! stressed along different axes.
//!
//! The honest point the panel encodes is a real-world tradeoff, not a rigged one:
//! a single-band GNSS receiver is precise and cheap but fragile, while a diverse
//! architecture is robust but each fallback source is coarser, so no single
//! weighting of the resilience dimensions can be neutral between them.

use crate::resilience::arch::{PntArchitecture, PntSource, SourceKind, TechniqueCategory};
use crate::resilience::score::SimSummary;
use crate::resilience::study::ScenarioMix;
use serde::Serialize;

/// The threat scenarios in the ensemble.
#[derive(Clone, Copy, Debug, PartialEq, Eq, Serialize)]
pub enum Threat {
    Nominal,
    WidebandJam,
    Spoofing,
    Meaconing,
    Combined,
}

impl Threat {
    pub fn name(self) -> &'static str {
        match self {
            Threat::Nominal => "nominal",
            Threat::WidebandJam => "wideband_jam",
            Threat::Spoofing => "spoofing",
            Threat::Meaconing => "meaconing",
            Threat::Combined => "combined",
        }
    }

    pub fn all() -> [Threat; 5] {
        [
            Threat::Nominal,
            Threat::WidebandJam,
            Threat::Spoofing,
            Threat::Meaconing,
            Threat::Combined,
        ]
    }

    /// Whether the threat denies GNSS RF (jamming/spoofing/meaconing/combined).
    fn denies_gnss(self) -> bool {
        !matches!(self, Threat::Nominal)
    }
}

/// Modelled coast capacity (seconds) a surviving source provides under denial.
fn holdover_capacity(kind: SourceKind, threat: Threat) -> f64 {
    match kind {
        SourceKind::Clock | SourceKind::Eloran => 3600.0,
        SourceKind::Terrain | SourceKind::Gravity | SourceKind::Magnetic => 600.0,
        SourceKind::SignalOfOpportunity => 600.0,
        SourceKind::Inertial => 300.0,
        SourceKind::GnssL1 | SourceKind::GnssL5 | SourceKind::GnssMultiBand => {
            // GNSS only sustains the solution while it is not denied.
            if threat == Threat::Nominal {
                3600.0
            } else {
                0.0
            }
        }
    }
}

/// Modelled detector AUC for the threat, given whether the architecture declares
/// the Verify technique and how many independent groups it has (cross-checks).
fn detect_auc(threat: Threat, has_verify: bool, groups: usize) -> f64 {
    let base = match threat {
        Threat::Nominal => 0.50,
        Threat::WidebandJam => {
            if has_verify {
                0.95
            } else {
                0.90
            }
        } // jamming is conspicuous even without a dedicated monitor
        Threat::Spoofing => {
            if has_verify {
                0.85
            } else {
                0.55
            }
        }
        Threat::Meaconing => {
            if has_verify {
                0.70
            } else {
                0.52
            }
        } // replay is the hardest to tell from truth
        Threat::Combined => {
            if has_verify {
                0.92
            } else {
                0.60
            }
        }
    };
    (base + 0.02 * (groups as f64 - 1.0)).min(0.99)
}

/// Reduce one (architecture, threat) to a behaviour summary. Documented MODELLED
/// reduction; see the module note.
pub fn simulate(arch: &PntArchitecture, threat: Threat) -> SimSummary {
    let total_q: f64 = arch.sources.iter().map(|s| s.quality.clamp(0.0, 1.0)).sum();
    let surviving: Vec<&PntSource> = arch
        .sources
        .iter()
        .filter(|s| !(threat.denies_gnss() && s.kind.is_gnss_rf()))
        .collect();
    let surv_q: f64 = surviving.iter().map(|s| s.quality.clamp(0.0, 1.0)).sum();
    let avail_base = if total_q > 0.0 { surv_q / total_q } else { 0.0 };

    let holdover_s = surviving
        .iter()
        .map(|s| holdover_capacity(s.kind, threat))
        .fold(0.0_f64, f64::max);

    let has_verify = arch.has(TechniqueCategory::Verify);
    let groups = arch.independent_group_count();
    let auc = detect_auc(threat, has_verify, groups);
    let detected = has_verify && (auc - 0.5) * 2.0 > 0.5;

    // A stealthy spoof/meacon you cannot detect corrupts the solution silently.
    let stealthy = matches!(threat, Threat::Spoofing | Threat::Meaconing) && !detected;

    let availability = if threat == Threat::Nominal || !stealthy {
        avail_base
    } else {
        avail_base * 0.5
    };
    let integrity = if threat == Threat::Nominal || detected {
        avail_base
    } else {
        avail_base * 0.5
    };
    let bounded = if threat == Threat::Nominal {
        true
    } else {
        holdover_s > 0.0 && !stealthy
    };

    SimSummary {
        holdover_s,
        availability,
        detect_auc: auc,
        integrity,
        security: ((auc - 0.5) * 2.0).clamp(0.0, 1.0),
        bounded,
    }
}

fn src(kind: SourceKind, group: u32, quality: f64) -> PntSource {
    PntSource::new(kind, group, quality)
}

/// The reference architecture panel. Includes a deliberate "paper-tiger" pair:
/// `checkbox_gnss` (single-band GNSS that nonetheless *declares* all seven RPCF
/// techniques) and `diverse_full` (genuinely diverse, also declaring all seven),
/// so a checklist sees identical posture while measured resilience diverges.
pub fn reference_panel() -> Vec<PntArchitecture> {
    use TechniqueCategory::*;
    vec![
        PntArchitecture::new("gnss_l1", vec![src(SourceKind::GnssL1, 1, 0.95)], []),
        PntArchitecture::new(
            "gnss_multiband",
            vec![
                src(SourceKind::GnssMultiBand, 1, 1.0),
                src(SourceKind::GnssL5, 1, 0.9),
            ],
            [Verify, Diversify],
        ),
        PntArchitecture::new(
            "gnss_ins",
            vec![
                src(SourceKind::GnssMultiBand, 1, 1.0),
                src(SourceKind::Inertial, 2, 0.6),
            ],
            [Verify, Diversify, Mitigate, Recover],
        ),
        PntArchitecture::new(
            "spoof_hardened",
            vec![
                src(SourceKind::GnssMultiBand, 1, 1.0),
                src(SourceKind::Inertial, 2, 0.6),
            ],
            [Verify, Isolate, Mitigate],
        ),
        PntArchitecture::new(
            "checkbox_gnss",
            vec![src(SourceKind::GnssL1, 1, 0.95)],
            TechniqueCategory::all(),
        ),
        // Apparent redundancy: four GNSS receivers in four independence groups
        // (e.g. separate antennas/constellations). Looks four-way diverse, but a
        // wideband RF denial defeats every one at once -- effective diversity 1.
        PntArchitecture::new(
            "quad_gnss",
            vec![
                src(SourceKind::GnssMultiBand, 1, 0.95),
                src(SourceKind::GnssL5, 2, 0.9),
                src(SourceKind::GnssL1, 3, 0.9),
                src(SourceKind::GnssMultiBand, 4, 0.9),
            ],
            [
                TechniqueCategory::Verify,
                TechniqueCategory::Diversify,
                TechniqueCategory::Mitigate,
            ],
        ),
        PntArchitecture::new(
            "diverse_full",
            vec![
                src(SourceKind::GnssMultiBand, 1, 1.0),
                src(SourceKind::Inertial, 2, 0.6),
                src(SourceKind::Clock, 3, 0.9),
                src(SourceKind::Eloran, 4, 0.8),
            ],
            TechniqueCategory::all(),
        ),
    ]
}

/// Build the scenario-mix ensemble for a panel by simulating each architecture
/// under each threat.
pub fn scenario_ensemble(panel: &[PntArchitecture]) -> Vec<ScenarioMix> {
    Threat::all()
        .iter()
        .map(|&t| ScenarioMix {
            name: t.name().to_string(),
            per_arch: panel
                .iter()
                .map(|a| (a.name.clone(), simulate(a, t)))
                .collect(),
        })
        .collect()
}

#[cfg(test)]
mod tests {
    use super::*;

    fn by_name<'a>(panel: &'a [PntArchitecture], name: &str) -> &'a PntArchitecture {
        panel.iter().find(|a| a.name == name).unwrap()
    }

    #[test]
    fn all_gnss_collapses_under_wideband_jam() {
        let p = reference_panel();
        let s = simulate(by_name(&p, "gnss_l1"), Threat::WidebandJam);
        assert!(s.availability < 1e-9, "should lose availability: {s:?}");
        assert_eq!(s.holdover_s, 0.0);
        assert!(!s.bounded, "all-GNSS under jam must be unbounded");
    }

    #[test]
    fn diverse_architecture_coasts_under_jam() {
        let p = reference_panel();
        let s = simulate(by_name(&p, "diverse_full"), Threat::WidebandJam);
        assert_eq!(s.holdover_s, 3600.0, "clock/eLoran should sustain holdover");
        assert!(s.bounded, "diverse architecture must stay bounded");
        assert!(s.availability > 0.0);
    }

    #[test]
    fn meaconing_is_harder_to_detect_than_jamming() {
        let p = reference_panel();
        let a = by_name(&p, "diverse_full"); // declares Verify
        assert!(
            simulate(a, Threat::Meaconing).detect_auc < simulate(a, Threat::WidebandJam).detect_auc
        );
    }

    #[test]
    fn paper_tiger_and_diverse_share_declared_posture() {
        let p = reference_panel();
        // Same declared techniques (all seven) ...
        assert_eq!(
            by_name(&p, "checkbox_gnss").techniques,
            by_name(&p, "diverse_full").techniques
        );
        // ... but different measured bounded verdict under jamming.
        assert_ne!(
            simulate(by_name(&p, "checkbox_gnss"), Threat::WidebandJam).bounded,
            simulate(by_name(&p, "diverse_full"), Threat::WidebandJam).bounded
        );
    }

    #[test]
    fn ensemble_covers_every_threat_and_architecture() {
        let p = reference_panel();
        let e = scenario_ensemble(&p);
        assert_eq!(e.len(), Threat::all().len());
        for mix in &e {
            assert_eq!(mix.per_arch.len(), p.len());
        }
    }
}
