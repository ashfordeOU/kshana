// SPDX-License-Identifier: AGPL-3.0-only
//! The instability study: the scientific core. Given a panel of architectures,
//! a defensible space of dimension weightings (a Dirichlet over the seven RPCF
//! categories), and an ensemble of threat-scenario mixes, it quantifies how much
//! a single composite score or a single RPCF Level reorders the architectures.
//!
//! * [`run_instability`] (H1): top-1 flip rate, Kendall-tau dispersion vs the
//!   equal-weight baseline, RPCF-Level flip rate across mixes, and per-architecture
//!   rank ranges.
//! * [`declared_vs_measured`] (H2): pairs of architectures with identical declared
//!   techniques whose measured bounded-degradation verdict (and assigned Level)
//!   disagree under the same scenario.
//! * [`diversity_collapse`] (H3): effective diversity assuming independence vs.
//!   accounting for GNSS common-mode coupling.

use crate::resilience::arch::{PntArchitecture, SourceKind, TechniqueCategory};
use crate::resilience::diversity::effective_diversity;
use crate::resilience::score::{assign_level, composite, score, SimSummary};
use crate::resilience::stats::{
    dirichlet_weights, kendall_tau, percentile_ci, rank_of, rank_ranges, top1_flip_rate,
};
use serde::Serialize;
use std::collections::{BTreeMap, BTreeSet};

/// One threat-scenario mix: the behaviour summary of each architecture (by name)
/// under that mix.
#[derive(Clone, Debug, Serialize)]
pub struct ScenarioMix {
    pub name: String,
    pub per_arch: BTreeMap<String, SimSummary>,
}

/// Configuration for the instability study.
#[derive(Clone, Debug)]
pub struct StudyConfig {
    pub archs: Vec<PntArchitecture>,
    pub mixes: Vec<ScenarioMix>,
    pub n_weight_draws: usize,
    /// Dirichlet concentration per RPCF category (length 7).
    pub dirichlet_alpha: Vec<f64>,
    pub seed: u64,
}

/// H1 result.
#[derive(Clone, Debug, Serialize)]
pub struct InstabilityResult {
    /// Fraction of (weighting x mix) rankings whose winner differs from the modal winner.
    pub top1_flip_rate: f64,
    /// Mean Kendall-tau between each draw's ranking and its mix's equal-weight baseline.
    pub kendall_tau_mean: f64,
    /// Percentile CI (5%,95%) of those Kendall-tau values.
    pub kendall_tau_ci: (f64, f64),
    /// Fraction of architectures whose assigned RPCF Level is not constant across mixes.
    pub level_flip_rate: f64,
    /// Per-architecture (min,max) rank over all (weighting x mix) draws.
    pub rank_ranges: BTreeMap<String, (usize, usize)>,
    pub n_evaluations: usize,
}

fn equal_weights() -> Vec<f64> {
    vec![1.0; TechniqueCategory::all().len()]
}

/// Composite score of every architecture under a mix, in `archs` order.
fn composites(archs: &[PntArchitecture], mix: &ScenarioMix, weights: &[f64]) -> Vec<f64> {
    archs
        .iter()
        .map(|a| {
            let sim = mix.per_arch.get(&a.name).copied().unwrap_or(SimSummary {
                holdover_s: 0.0,
                availability: 0.0,
                detect_auc: 0.5,
                integrity: 0.0,
                security: 0.0,
                bounded: true,
            });
            composite(&score(a, &sim), weights)
        })
        .collect()
}

/// Run the H1 instability experiment.
pub fn run_instability(cfg: &StudyConfig) -> InstabilityResult {
    assert_eq!(
        cfg.dirichlet_alpha.len(),
        TechniqueCategory::all().len(),
        "dirichlet_alpha must have 7 entries (one per RPCF category)"
    );
    let n = cfg.archs.len();
    let weight_draws: Vec<Vec<f64>> = (0..cfg.n_weight_draws)
        .map(|d| dirichlet_weights(&cfg.dirichlet_alpha, cfg.seed.wrapping_add(d as u64)))
        .collect();

    let mut all_rankings: Vec<Vec<usize>> = Vec::new();
    let mut taus: Vec<f64> = Vec::new();

    for mix in &cfg.mixes {
        let base_scores = composites(&cfg.archs, mix, &equal_weights());
        let base_rank = rank_of(&base_scores);
        let base_rank_f: Vec<f64> = base_rank.iter().map(|&r| r as f64).collect();
        for w in &weight_draws {
            let sc = composites(&cfg.archs, mix, w);
            let r = rank_of(&sc);
            if n >= 2 {
                let rf: Vec<f64> = r.iter().map(|&x| x as f64).collect();
                taus.push(kendall_tau(&rf, &base_rank_f));
            }
            all_rankings.push(r);
        }
    }

    // Level flip across mixes (Level is weight-independent).
    let mut level_changes = 0usize;
    for a in &cfg.archs {
        let mut levels: BTreeSet<u8> = BTreeSet::new();
        for mix in &cfg.mixes {
            if let Some(sim) = mix.per_arch.get(&a.name) {
                let p = score(a, sim);
                levels.insert(assign_level(&p, sim.bounded).0);
            }
        }
        if levels.len() > 1 {
            level_changes += 1;
        }
    }
    let level_flip_rate = if n == 0 {
        0.0
    } else {
        level_changes as f64 / n as f64
    };

    let ranges = rank_ranges(&all_rankings, n);
    let rank_ranges: BTreeMap<String, (usize, usize)> = cfg
        .archs
        .iter()
        .enumerate()
        .map(|(i, a)| (a.name.clone(), ranges[i]))
        .collect();

    let kendall_tau_mean = if taus.is_empty() {
        1.0
    } else {
        taus.iter().sum::<f64>() / taus.len() as f64
    };
    let kendall_tau_ci = percentile_ci(&taus, 0.1);

    InstabilityResult {
        top1_flip_rate: top1_flip_rate(&all_rankings),
        kendall_tau_mean,
        kendall_tau_ci,
        level_flip_rate,
        rank_ranges,
        n_evaluations: all_rankings.len() * n.max(1),
    }
}

/// One H2 contrast: two architectures with identical declared techniques whose
/// measured bounded verdict (and Level) disagree under one mix.
#[derive(Clone, Debug, Serialize)]
pub struct ContrastPair {
    pub mix: String,
    pub arch_a: String,
    pub arch_b: String,
    pub bounded_a: bool,
    pub bounded_b: bool,
    pub level_a: u8,
    pub level_b: u8,
}

/// H2: find architecture pairs that *declare* the same techniques (what a
/// self-assessment checklist sees) but whose *measured* bounded-degradation
/// verdict differs under the same scenario mix.
pub fn declared_vs_measured(cfg: &StudyConfig) -> Vec<ContrastPair> {
    let mut out = Vec::new();
    for mix in &cfg.mixes {
        for (i, a) in cfg.archs.iter().enumerate() {
            for b in cfg.archs.iter().skip(i + 1) {
                if a.techniques != b.techniques {
                    continue; // different declared posture
                }
                let (Some(sa), Some(sb)) = (mix.per_arch.get(&a.name), mix.per_arch.get(&b.name))
                else {
                    continue;
                };
                if sa.bounded != sb.bounded {
                    let la = assign_level(&score(a, sa), sa.bounded).0;
                    let lb = assign_level(&score(b, sb), sb.bounded).0;
                    out.push(ContrastPair {
                        mix: mix.name.clone(),
                        arch_a: a.name.clone(),
                        arch_b: b.name.clone(),
                        bounded_a: sa.bounded,
                        bounded_b: sb.bounded,
                        level_a: la,
                        level_b: lb,
                    });
                }
            }
        }
    }
    out
}

/// H3 row: effective diversity assuming independence vs. accounting for GNSS
/// common-mode coupling (all GNSS-RF sources collapsed to one failure domain).
#[derive(Clone, Debug, Serialize)]
pub struct DiversityCollapse {
    pub arch: String,
    pub independence_assumed: f64,
    pub common_mode_aware: f64,
}

fn collapse_gnss_common_mode(arch: &PntArchitecture) -> PntArchitecture {
    const SHARED: u32 = u32::MAX;
    let sources = arch
        .sources
        .iter()
        .copied()
        .map(|mut s| {
            if s.kind.is_gnss_rf() {
                s.independence_group = SHARED;
            }
            s
        })
        .collect();
    PntArchitecture {
        name: arch.name.clone(),
        sources,
        techniques: arch.techniques.clone(),
    }
}

/// H3: for each architecture, the diversity it appears to have (independence
/// assumed) vs. what survives GNSS common-mode coupling.
pub fn diversity_collapse(archs: &[PntArchitecture]) -> Vec<DiversityCollapse> {
    archs
        .iter()
        .map(|a| DiversityCollapse {
            arch: a.name.clone(),
            independence_assumed: effective_diversity(a),
            common_mode_aware: effective_diversity(&collapse_gnss_common_mode(a)),
        })
        .collect()
}

/// Convenience: the set of all GNSS-RF source kinds present in an architecture
/// (the target set of a wideband common-mode attack).
pub fn gnss_common_mode_target(arch: &PntArchitecture) -> BTreeSet<SourceKind> {
    arch.sources
        .iter()
        .map(|s| s.kind)
        .filter(|k| k.is_gnss_rf())
        .collect()
}

#[cfg(test)]
mod tests {
    use super::*;
    use crate::resilience::arch::PntSource;

    fn sim(holdover: f64, avail: f64, auc: f64, bounded: bool) -> SimSummary {
        SimSummary {
            holdover_s: holdover,
            availability: avail,
            detect_auc: auc,
            integrity: avail,
            security: 0.5,
            bounded,
        }
    }

    fn mix_uniform(archs: &[PntArchitecture], s: SimSummary, name: &str) -> ScenarioMix {
        ScenarioMix {
            name: name.into(),
            per_arch: archs.iter().map(|a| (a.name.clone(), s)).collect(),
        }
    }

    #[test]
    fn identical_architectures_are_perfectly_stable() {
        let a = PntArchitecture::new(
            "a",
            vec![PntSource::new(SourceKind::GnssMultiBand, 1, 1.0)],
            TechniqueCategory::all(),
        );
        let b = PntArchitecture::new(
            "b",
            vec![PntSource::new(SourceKind::GnssMultiBand, 1, 1.0)],
            TechniqueCategory::all(),
        );
        let archs = vec![a, b];
        let mixes = vec![mix_uniform(&archs, sim(3600.0, 1.0, 0.9, true), "m1")];
        let cfg = StudyConfig {
            archs,
            mixes,
            n_weight_draws: 50,
            dirichlet_alpha: vec![1.0; 7],
            seed: 1,
        };
        let r = run_instability(&cfg);
        assert!((r.top1_flip_rate - 0.0).abs() < 1e-12);
        assert!((r.kendall_tau_mean - 1.0).abs() < 1e-12);
        assert!((r.level_flip_rate - 0.0).abs() < 1e-12);
    }

    #[test]
    fn crossing_architectures_make_the_winner_flip() {
        // A: strong Verify (high AUC), weak Diversify (1 group).
        let a = PntArchitecture::new(
            "verify_heavy",
            vec![PntSource::new(SourceKind::GnssMultiBand, 1, 1.0)],
            TechniqueCategory::all(),
        );
        // B: weak Verify (chance AUC), strong Diversify (4 groups).
        let b = PntArchitecture::new(
            "diverse_heavy",
            vec![
                PntSource::new(SourceKind::GnssL1, 1, 1.0),
                PntSource::new(SourceKind::Inertial, 2, 1.0),
                PntSource::new(SourceKind::Clock, 3, 1.0),
                PntSource::new(SourceKind::Eloran, 4, 1.0),
            ],
            TechniqueCategory::all(),
        );
        let archs = vec![a.clone(), b.clone()];
        let mut per_arch = BTreeMap::new();
        per_arch.insert("verify_heavy".to_string(), sim(0.0, 0.3, 0.99, true));
        per_arch.insert("diverse_heavy".to_string(), sim(0.0, 0.3, 0.51, true));
        let mixes = vec![ScenarioMix {
            name: "m".into(),
            per_arch,
        }];
        let cfg = StudyConfig {
            archs,
            mixes,
            n_weight_draws: 300,
            dirichlet_alpha: vec![1.0; 7],
            seed: 7,
        };
        let r = run_instability(&cfg);
        assert!(r.top1_flip_rate > 0.0, "winner never flipped: {r:?}");
        assert_eq!(r.rank_ranges["verify_heavy"], (0, 1));
        assert_eq!(r.rank_ranges["diverse_heavy"], (0, 1));
        assert!(r.kendall_tau_mean < 1.0, "tau should disperse below 1");
    }

    #[test]
    fn declared_vs_measured_finds_same_posture_different_outcome() {
        // Same declared techniques and structure; only the measured bounded
        // verdict differs. Strong sub-scores so the bounded-gate actually moves
        // the assigned Level (bounded -> high Level, unbounded -> capped at 2).
        let strong_sources = || {
            vec![
                PntSource::new(SourceKind::GnssMultiBand, 1, 1.0),
                PntSource::new(SourceKind::Inertial, 2, 1.0),
                PntSource::new(SourceKind::Clock, 3, 1.0),
                PntSource::new(SourceKind::Eloran, 4, 1.0),
            ]
        };
        let a = PntArchitecture::new("a", strong_sources(), TechniqueCategory::all());
        let b = PntArchitecture::new("b", strong_sources(), TechniqueCategory::all());
        let archs = vec![a, b];
        let mut per_arch = BTreeMap::new();
        per_arch.insert("a".to_string(), sim(3600.0, 0.9, 0.9, true));
        per_arch.insert("b".to_string(), sim(3600.0, 0.9, 0.9, false));
        let mixes = vec![ScenarioMix {
            name: "denial".into(),
            per_arch,
        }];
        let cfg = StudyConfig {
            archs,
            mixes,
            n_weight_draws: 1,
            dirichlet_alpha: vec![1.0; 7],
            seed: 0,
        };
        let pairs = declared_vs_measured(&cfg);
        assert_eq!(pairs.len(), 1);
        assert_ne!(pairs[0].bounded_a, pairs[0].bounded_b);
        assert_ne!(pairs[0].level_a, pairs[0].level_b);
    }

    #[test]
    fn diversity_collapse_exposes_illusory_redundancy() {
        // "Redundant": four GNSS receivers in four independence groups.
        let redundant = PntArchitecture::new(
            "quad_gnss",
            vec![
                PntSource::new(SourceKind::GnssL1, 1, 1.0),
                PntSource::new(SourceKind::GnssL5, 2, 1.0),
                PntSource::new(SourceKind::GnssMultiBand, 3, 1.0),
                PntSource::new(SourceKind::GnssL1, 4, 1.0),
            ],
            [],
        );
        let rows = diversity_collapse(&[redundant]);
        assert!((rows[0].independence_assumed - 4.0).abs() < 1e-9);
        assert!((rows[0].common_mode_aware - 1.0).abs() < 1e-9);
    }
}
