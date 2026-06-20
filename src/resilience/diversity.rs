// SPDX-License-Identifier: AGPL-3.0-only
//! Common-mode / single-point-of-failure / diversity analysis. Apparent
//! redundancy (many sources) is not effective redundancy: sources that share an
//! independence group fail together, and a common-mode threat can defeat a whole
//! class of source kinds at once. This module quantifies the gap between the
//! source count and the genuinely independent failure domains.

use crate::resilience::arch::{PntArchitecture, SourceKind};
use std::collections::{BTreeMap, BTreeSet};

/// Effective number of independent sources: the Hill number of order 2
/// (inverse Simpson index) over independence groups, weighted by source
/// quality. `N` equal independent groups give `N`; all sources in one group
/// give `1`; an empty architecture gives `0`.
pub fn effective_diversity(arch: &PntArchitecture) -> f64 {
    let mut group_q: BTreeMap<u32, f64> = BTreeMap::new();
    for s in &arch.sources {
        *group_q.entry(s.independence_group).or_insert(0.0) += s.quality.clamp(0.0, 1.0);
    }
    let total: f64 = group_q.values().sum();
    if total <= 0.0 {
        return 0.0;
    }
    let sum_sq: f64 = group_q.values().map(|q| (q / total).powi(2)).sum();
    if sum_sq <= 0.0 {
        0.0
    } else {
        1.0 / sum_sq
    }
}

/// Fraction of total weighted source quality lost when every source whose kind
/// is in `defeated` fails simultaneously (a common-mode attack). `0` if nothing
/// relevant is hit, `1` if the attack defeats the whole architecture.
pub fn common_mode_loss(arch: &PntArchitecture, defeated: &BTreeSet<SourceKind>) -> f64 {
    let total: f64 = arch.sources.iter().map(|s| s.quality.clamp(0.0, 1.0)).sum();
    if total <= 0.0 {
        return 0.0;
    }
    let lost: f64 = arch
        .sources
        .iter()
        .filter(|s| defeated.contains(&s.kind))
        .map(|s| s.quality.clamp(0.0, 1.0))
        .sum();
    lost / total
}

/// Convenience: the common-mode loss from a wideband RF attack that defeats all
/// GNSS RF sources at once.
pub fn gnss_rf_common_mode_loss(arch: &PntArchitecture) -> f64 {
    let defeated: BTreeSet<SourceKind> = arch
        .sources
        .iter()
        .map(|s| s.kind)
        .filter(|k| k.is_gnss_rf())
        .collect();
    common_mode_loss(arch, &defeated)
}

/// Independence groups whose removal drops effective diversity below `viability`:
/// the single points of failure. A group is a SPOF if the architecture without
/// it can no longer field `viability` effective independent sources.
pub fn spofs(arch: &PntArchitecture, viability: f64) -> Vec<u32> {
    let groups: BTreeSet<u32> = arch.sources.iter().map(|s| s.independence_group).collect();
    let mut out = Vec::new();
    for &g in &groups {
        let reduced = PntArchitecture {
            name: arch.name.clone(),
            sources: arch
                .sources
                .iter()
                .copied()
                .filter(|s| s.independence_group != g)
                .collect(),
            techniques: arch.techniques.clone(),
        };
        if effective_diversity(&reduced) < viability {
            out.push(g);
        }
    }
    out
}

#[cfg(test)]
mod tests {
    use super::*;
    use crate::resilience::arch::PntSource;

    fn three_equal(groups: [u32; 3]) -> PntArchitecture {
        PntArchitecture::new(
            "x",
            vec![
                PntSource::new(SourceKind::GnssL1, groups[0], 1.0),
                PntSource::new(SourceKind::GnssL5, groups[1], 1.0),
                PntSource::new(SourceKind::Inertial, groups[2], 1.0),
            ],
            [],
        )
    }

    #[test]
    fn inverse_simpson_counts_independent_domains() {
        assert!((effective_diversity(&three_equal([1, 2, 3])) - 3.0).abs() < 1e-12);
        assert!((effective_diversity(&three_equal([1, 1, 1])) - 1.0).abs() < 1e-12);
    }

    #[test]
    fn common_mode_defeats_correlated_sources() {
        // All-GNSS architecture: a wideband RF attack defeats everything.
        let all_gnss = PntArchitecture::new(
            "gnss",
            vec![
                PntSource::new(SourceKind::GnssL1, 1, 1.0),
                PntSource::new(SourceKind::GnssL5, 2, 1.0),
            ],
            [],
        );
        assert!((gnss_rf_common_mode_loss(&all_gnss) - 1.0).abs() < 1e-12);

        // One of two equal sources defeated -> half lost.
        let defeated: BTreeSet<SourceKind> = [SourceKind::GnssL1].into_iter().collect();
        assert!((common_mode_loss(&all_gnss, &defeated) - 0.5).abs() < 1e-12);
    }

    #[test]
    fn spofs_flag_only_fragile_architectures() {
        // Two independent groups: removing either leaves diversity 1 < 1.5 -> both SPOF.
        let two = three_equal([1, 1, 2]); // groups {1,2}
        assert_eq!(spofs(&two, 1.5), vec![1, 2]);

        // Four independent groups: removing one leaves 3 >= 1.5 -> none.
        let four = PntArchitecture::new(
            "four",
            vec![
                PntSource::new(SourceKind::GnssMultiBand, 1, 1.0),
                PntSource::new(SourceKind::Inertial, 2, 1.0),
                PntSource::new(SourceKind::Clock, 3, 1.0),
                PntSource::new(SourceKind::Eloran, 4, 1.0),
            ],
            [],
        );
        assert!(spofs(&four, 1.5).is_empty());
    }
}
