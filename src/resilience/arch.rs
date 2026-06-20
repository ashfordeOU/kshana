// SPDX-License-Identifier: AGPL-3.0-only
//! The PNT-architecture model: a system described as a set of PNT sources
//! (each in an independence group) plus the resilience technique categories it
//! implements. This is the object the scoring engine grades and the diversity
//! analysis dissects. It is a deliberately abstract, parameter-grounded
//! description, not a hardware model.

use serde::Serialize;
use std::collections::BTreeSet;

/// A kind of PNT source. Independence between sources is captured separately by
/// [`PntSource::independence_group`]; this enum names the technology so a
/// common-mode attack can target a set of kinds at once.
#[derive(Clone, Copy, Debug, PartialEq, Eq, PartialOrd, Ord, Serialize)]
pub enum SourceKind {
    GnssL1,
    GnssL5,
    GnssMultiBand,
    Inertial,
    Clock,
    Terrain,
    Gravity,
    Magnetic,
    SignalOfOpportunity,
    Eloran,
}

impl SourceKind {
    /// Whether this source is a space-based GNSS RF source, and therefore shares
    /// a common-mode vulnerability to wideband RF denial with other GNSS kinds.
    pub fn is_gnss_rf(self) -> bool {
        matches!(
            self,
            SourceKind::GnssL1 | SourceKind::GnssL5 | SourceKind::GnssMultiBand
        )
    }
}

/// The seven DHS/CISA RPCF v2.0 technique categories. "OLVIDMR" is a Kshana
/// mnemonic for the set; DHS names the categories, not the acronym.
#[derive(Clone, Copy, Debug, PartialEq, Eq, PartialOrd, Ord, Serialize)]
pub enum TechniqueCategory {
    Obfuscate,
    Limit,
    Verify,
    Isolate,
    Diversify,
    Mitigate,
    Recover,
}

impl TechniqueCategory {
    /// All seven categories, in canonical order.
    pub fn all() -> [TechniqueCategory; 7] {
        use TechniqueCategory::*;
        [
            Obfuscate, Limit, Verify, Isolate, Diversify, Mitigate, Recover,
        ]
    }
}

/// The RethinkPNT / Firesmith resilience function model: Resist, Detect,
/// Respond, Recover.
#[derive(Clone, Copy, Debug, PartialEq, Eq, PartialOrd, Ord, Serialize)]
pub enum RdrrFunction {
    Resist,
    Detect,
    Respond,
    Recover,
}

impl RdrrFunction {
    pub fn all() -> [RdrrFunction; 4] {
        use RdrrFunction::*;
        [Resist, Detect, Respond, Recover]
    }
}

/// Yang Yuanxi's resilient-PNT criteria (the subset Kshana's timing/detection
/// figures of merit can speak to honestly).
#[derive(Clone, Copy, Debug, PartialEq, Eq, PartialOrd, Ord, Serialize)]
pub enum YangCriterion {
    Availability,
    Reliability,
    Continuity,
    Accuracy,
}

impl YangCriterion {
    pub fn all() -> [YangCriterion; 4] {
        use YangCriterion::*;
        [Availability, Reliability, Continuity, Accuracy]
    }
}

/// One PNT source within an architecture. `independence_group` identifies which
/// sources fail together: two sources sharing a group are *not* independent
/// (e.g. two receivers on the same antenna feed). `quality` in `[0, 1]` is a
/// relative capability weight used by the diversity accounting.
#[derive(Clone, Copy, Debug, PartialEq, Serialize)]
pub struct PntSource {
    pub kind: SourceKind,
    pub independence_group: u32,
    pub quality: f64,
}

impl PntSource {
    pub fn new(kind: SourceKind, independence_group: u32, quality: f64) -> Self {
        PntSource {
            kind,
            independence_group,
            quality,
        }
    }
}

/// A PNT architecture: named, a set of sources, and the resilience technique
/// categories it implements.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct PntArchitecture {
    pub name: String,
    pub sources: Vec<PntSource>,
    pub techniques: BTreeSet<TechniqueCategory>,
}

impl PntArchitecture {
    pub fn new(
        name: impl Into<String>,
        sources: Vec<PntSource>,
        techniques: impl IntoIterator<Item = TechniqueCategory>,
    ) -> Self {
        PntArchitecture {
            name: name.into(),
            sources,
            techniques: techniques.into_iter().collect(),
        }
    }

    /// Number of distinct independence groups among the sources: the count of
    /// genuinely independent failure domains, not the raw source count.
    pub fn independent_group_count(&self) -> usize {
        self.sources
            .iter()
            .map(|s| s.independence_group)
            .collect::<BTreeSet<_>>()
            .len()
    }

    /// Whether the architecture implements a given technique category.
    pub fn has(&self, t: TechniqueCategory) -> bool {
        self.techniques.contains(&t)
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    fn arch() -> PntArchitecture {
        PntArchitecture::new(
            "test",
            vec![
                PntSource::new(SourceKind::GnssL1, 1, 1.0),
                PntSource::new(SourceKind::GnssL5, 1, 1.0),
                PntSource::new(SourceKind::Inertial, 2, 0.6),
            ],
            [TechniqueCategory::Verify, TechniqueCategory::Diversify],
        )
    }

    #[test]
    fn independent_group_count_counts_distinct_failure_domains() {
        // groups {1, 1, 2} -> two independent domains, not three sources.
        assert_eq!(arch().independent_group_count(), 2);
    }

    #[test]
    fn has_reports_technique_membership() {
        let a = arch();
        assert!(a.has(TechniqueCategory::Verify));
        assert!(a.has(TechniqueCategory::Diversify));
        assert!(!a.has(TechniqueCategory::Recover));
    }

    #[test]
    fn gnss_rf_common_mode_classification() {
        assert!(SourceKind::GnssL1.is_gnss_rf());
        assert!(SourceKind::GnssMultiBand.is_gnss_rf());
        assert!(!SourceKind::Inertial.is_gnss_rf());
        assert!(!SourceKind::Eloran.is_gnss_rf());
    }

    #[test]
    fn category_sets_are_complete() {
        assert_eq!(TechniqueCategory::all().len(), 7);
        assert_eq!(RdrrFunction::all().len(), 4);
        assert_eq!(YangCriterion::all().len(), 4);
    }
}
