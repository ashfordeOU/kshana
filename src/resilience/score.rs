// SPDX-License-Identifier: AGPL-3.0-only
//! Framework-aligned resilience scoring: reduce a per-architecture, per-scenario
//! behaviour summary to per-dimension sub-scores across the DHS RPCF categories,
//! the RethinkPNT RDRR functions, and Yang's criteria, then to a single
//! (deliberately fragile) composite and a tentative RPCF Level.
//!
//! Every sub-score is a documented, monotone reduction of one or more behaviour
//! drivers, and every sub-score carries its honest
//! [`VerificationStatus`]/[`OracleKind`]. The drivers here are timing-domain and
//! detection figures of merit; they are MODELLED, not externally validated, and
//! they are not position-domain accuracy. The composite exists so [`super::study`]
//! can show how unstable it is — it is not a number to certify against.

use crate::resilience::arch::{PntArchitecture, RdrrFunction, TechniqueCategory, YangCriterion};
use crate::verification::{OracleKind, VerificationStatus};
use serde::Serialize;
use std::collections::BTreeMap;

/// Holdover (seconds) that maps to a full Recover sub-score (1 hour reference).
pub const HOLDOVER_REF_S: f64 = 3600.0;
/// Independent-group count that maps to a full Diversify sub-score.
pub const DIVERSITY_REF_GROUPS: f64 = 4.0;

/// The behaviour of one architecture under one scenario, as the figures of merit
/// the scoring consumes. Parameter-grounded and MODELLED; see [`crate::fom`].
#[derive(Clone, Copy, Debug, PartialEq, Serialize)]
pub struct SimSummary {
    /// Worst-case in-spec coast under denial. Seconds.
    pub holdover_s: f64,
    /// Fraction of the run with an in-spec solution. `[0, 1]`.
    pub availability: f64,
    /// Impairment-detector AUC under the scenario. `[0.5, 1]` (0.5 = chance).
    pub detect_auc: f64,
    /// Filter self-consistency / integrity fraction. `[0, 1]`.
    pub integrity: f64,
    /// Analytic spoof-detectability bound. `[0, 1]`.
    pub security: f64,
    /// Whether degradation stays bounded under sustained denial (the L2->L3 gate).
    pub bounded: bool,
}

/// One per-dimension sub-score with its honest provenance.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct DimensionScore {
    /// Sub-score in `[0, 1]`.
    pub value: f64,
    /// Honest status of the driver behind this sub-score.
    pub status: VerificationStatus,
    /// How that status is backed.
    pub oracle_kind: OracleKind,
    /// One line naming the driver and reduction.
    pub basis: String,
}

impl DimensionScore {
    fn modelled(value: f64, basis: impl Into<String>) -> Self {
        DimensionScore {
            value: value.clamp(0.0, 1.0),
            status: VerificationStatus::Modelled,
            oracle_kind: OracleKind::InternalConsistency,
            basis: basis.into(),
        }
    }
}

/// A full resilience profile: per-framework sub-scores plus a tentative RPCF
/// Level. Never a single number standing alone.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct ResilienceProfile {
    pub rpcf: BTreeMap<TechniqueCategory, DimensionScore>,
    pub rdrr: BTreeMap<RdrrFunction, DimensionScore>,
    pub yang: BTreeMap<YangCriterion, DimensionScore>,
    /// Tentative DHS RPCF maturity Level 0..=4 (simulation-derived, not certified).
    pub level: u8,
    pub level_basis: String,
}

fn mean_quality(arch: &PntArchitecture) -> f64 {
    if arch.sources.is_empty() {
        return 0.0;
    }
    let s: f64 = arch.sources.iter().map(|x| x.quality.clamp(0.0, 1.0)).sum();
    s / arch.sources.len() as f64
}

fn norm_auc(auc: f64) -> f64 {
    ((auc - 0.5) * 2.0).clamp(0.0, 1.0)
}

fn norm_holdover(s: f64) -> f64 {
    (s / HOLDOVER_REF_S).clamp(0.0, 1.0)
}

fn norm_groups(groups: usize) -> f64 {
    ((groups as f64 - 1.0) / (DIVERSITY_REF_GROUPS - 1.0)).clamp(0.0, 1.0)
}

/// Score an architecture under one scenario summary into a full profile.
pub fn score(arch: &PntArchitecture, sim: &SimSummary) -> ResilienceProfile {
    let mq = mean_quality(arch);
    let recover_v = norm_holdover(sim.holdover_s) * if sim.bounded { 1.0 } else { 0.5 };
    let verify_v = norm_auc(sim.detect_auc);
    let diversify_v = norm_groups(arch.independent_group_count());
    let mitigate_v = sim.availability.clamp(0.0, 1.0);

    // Procedural categories with no direct behaviour driver: credited only when
    // the architecture declares them, weighted by mean source quality.
    let proc_score = |t: TechniqueCategory| -> DimensionScore {
        let v = if arch.has(t) { mq } else { 0.0 };
        DimensionScore::modelled(
            v,
            format!("{t:?} = declared({}) x mean source quality", arch.has(t)),
        )
    };

    let mut rpcf = BTreeMap::new();
    rpcf.insert(
        TechniqueCategory::Obfuscate,
        proc_score(TechniqueCategory::Obfuscate),
    );
    rpcf.insert(
        TechniqueCategory::Limit,
        proc_score(TechniqueCategory::Limit),
    );
    rpcf.insert(
        TechniqueCategory::Verify,
        DimensionScore::modelled(verify_v, "Verify = normalized impairment-detector AUC"),
    );
    rpcf.insert(
        TechniqueCategory::Isolate,
        proc_score(TechniqueCategory::Isolate),
    );
    rpcf.insert(
        TechniqueCategory::Diversify,
        DimensionScore::modelled(
            diversify_v,
            "Diversify = normalized independent-group count",
        ),
    );
    rpcf.insert(
        TechniqueCategory::Mitigate,
        DimensionScore::modelled(mitigate_v, "Mitigate = availability under denial"),
    );
    rpcf.insert(
        TechniqueCategory::Recover,
        DimensionScore::modelled(
            recover_v,
            "Recover = normalized holdover x bounded-degradation gate",
        ),
    );

    // RDRR re-projections of the same drivers.
    let resist_v = (rpcf[&TechniqueCategory::Obfuscate].value
        + rpcf[&TechniqueCategory::Limit].value
        + rpcf[&TechniqueCategory::Isolate].value
        + diversify_v)
        / 4.0;
    let mut rdrr = BTreeMap::new();
    rdrr.insert(
        RdrrFunction::Resist,
        DimensionScore::modelled(resist_v, "Resist = mean(Obfuscate,Limit,Isolate,Diversify)"),
    );
    rdrr.insert(
        RdrrFunction::Detect,
        DimensionScore::modelled(verify_v, "Detect = Verify sub-score"),
    );
    rdrr.insert(
        RdrrFunction::Respond,
        DimensionScore::modelled(mitigate_v, "Respond = Mitigate sub-score"),
    );
    rdrr.insert(
        RdrrFunction::Recover,
        DimensionScore::modelled(recover_v, "Recover = Recover sub-score"),
    );

    // Yang criteria.
    let mut yang = BTreeMap::new();
    yang.insert(
        YangCriterion::Availability,
        DimensionScore::modelled(mitigate_v, "Availability = availability under denial"),
    );
    yang.insert(
        YangCriterion::Reliability,
        DimensionScore::modelled(
            sim.integrity.clamp(0.0, 1.0),
            "Reliability = filter integrity fraction",
        ),
    );
    yang.insert(
        YangCriterion::Continuity,
        DimensionScore::modelled(recover_v, "Continuity = holdover x bounded gate"),
    );
    yang.insert(
        YangCriterion::Accuracy,
        DimensionScore::modelled(
            mq,
            "Accuracy = timing/quality proxy; position-domain accuracy NOT modelled (see fom.rs)",
        ),
    );

    let (level, level_basis) = assign_level_from_rpcf(&rpcf, sim.bounded);
    ResilienceProfile {
        rpcf,
        rdrr,
        yang,
        level,
        level_basis,
    }
}

/// Weighted composite of the seven RPCF sub-scores, in canonical category order.
/// Weights are normalized to sum to 1, so the result stays in `[0, 1]`. This is
/// the single number whose instability the study quantifies.
pub fn composite(profile: &ResilienceProfile, dim_weights: &[f64]) -> f64 {
    let cats = TechniqueCategory::all();
    assert_eq!(dim_weights.len(), cats.len(), "composite: need 7 weights");
    let wsum: f64 = dim_weights.iter().sum();
    if wsum <= 0.0 {
        return 0.0;
    }
    cats.iter()
        .zip(dim_weights)
        .map(|(c, w)| profile.rpcf[c].value * w)
        .sum::<f64>()
        / wsum
}

fn assign_level_from_rpcf(
    rpcf: &BTreeMap<TechniqueCategory, DimensionScore>,
    bounded: bool,
) -> (u8, String) {
    let min_sub = rpcf.values().map(|d| d.value).fold(f64::INFINITY, f64::min);
    // Weakest-link ladder; unbounded degradation caps maturity at Level 2.
    let raw = if min_sub < 0.2 {
        0
    } else if min_sub < 0.4 {
        1
    } else if min_sub < 0.6 {
        2
    } else if min_sub < 0.8 {
        3
    } else {
        4
    };
    let level = if bounded { raw } else { raw.min(2) };
    let basis = format!(
        "weakest RPCF sub-score = {min_sub:.3}; bounded-degradation = {bounded} (caps at Level 2 if unbounded)"
    );
    (level, basis)
}

/// Public wrapper to assign a Level from a built profile and a bounded flag.
pub fn assign_level(profile: &ResilienceProfile, bounded: bool) -> (u8, String) {
    assign_level_from_rpcf(&profile.rpcf, bounded)
}

#[cfg(test)]
mod tests {
    use super::*;
    use crate::resilience::arch::{PntSource, SourceKind};

    fn strong_arch() -> PntArchitecture {
        PntArchitecture::new(
            "strong",
            vec![
                PntSource::new(SourceKind::GnssMultiBand, 1, 1.0),
                PntSource::new(SourceKind::Inertial, 2, 1.0),
                PntSource::new(SourceKind::Clock, 3, 1.0),
                PntSource::new(SourceKind::Eloran, 4, 1.0),
            ],
            TechniqueCategory::all(),
        )
    }

    fn full_sim() -> SimSummary {
        SimSummary {
            holdover_s: HOLDOVER_REF_S,
            availability: 1.0,
            detect_auc: 1.0,
            integrity: 1.0,
            security: 1.0,
            bounded: true,
        }
    }

    fn zero_arch() -> PntArchitecture {
        PntArchitecture::new("bare", vec![PntSource::new(SourceKind::GnssL1, 1, 0.0)], [])
    }

    fn zero_sim() -> SimSummary {
        SimSummary {
            holdover_s: 0.0,
            availability: 0.0,
            detect_auc: 0.5,
            integrity: 0.0,
            security: 0.0,
            bounded: true,
        }
    }

    #[test]
    fn verify_subscore_is_monotone_in_detect_auc_others_fixed() {
        let a = strong_arch();
        let mut lo = full_sim();
        lo.detect_auc = 0.7;
        let mut hi = full_sim();
        hi.detect_auc = 0.8;
        let plo = score(&a, &lo);
        let phi = score(&a, &hi);
        let v_lo = plo.rpcf[&TechniqueCategory::Verify].value;
        let v_hi = phi.rpcf[&TechniqueCategory::Verify].value;
        assert!(v_hi > v_lo, "verify not monotone: {v_lo} !< {v_hi}");
        // Other RPCF sub-scores must be unchanged by detect_auc.
        for c in TechniqueCategory::all() {
            if c != TechniqueCategory::Verify {
                assert_eq!(plo.rpcf[&c].value, phi.rpcf[&c].value, "{c:?} moved");
            }
        }
    }

    #[test]
    fn composite_bounds_and_hand_weighted_value() {
        let full = score(&strong_arch(), &full_sim());
        let w = [1.0; 7];
        assert!((composite(&full, &w) - 1.0).abs() < 1e-12);
        let zero = score(&zero_arch(), &zero_sim());
        assert!((composite(&zero, &w) - 0.0).abs() < 1e-12);
        // Hand example: weights concentrate on Verify only -> composite = Verify.
        let mut wv = [0.0; 7];
        // Verify is index 2 in canonical order.
        wv[2] = 1.0;
        let mut s = full_sim();
        s.detect_auc = 0.75; // norm_auc = 0.5
        let p = score(&strong_arch(), &s);
        assert!((composite(&p, &wv) - 0.5).abs() < 1e-12);
    }

    #[test]
    fn unbounded_degradation_caps_level_at_two() {
        let a = strong_arch();
        let mut bounded = full_sim();
        bounded.bounded = true;
        let pb = score(&a, &bounded);
        assert_eq!(pb.level, 4, "strong + bounded should reach Level 4");

        let mut unbounded = full_sim();
        unbounded.bounded = false;
        let pu = score(&a, &unbounded);
        assert!(
            pu.level <= 2,
            "unbounded must cap at Level <= 2, got {}",
            pu.level
        );
    }

    #[test]
    fn every_subscore_is_modelled_with_a_real_oracle() {
        let p = score(&strong_arch(), &full_sim());
        let all = p
            .rpcf
            .values()
            .chain(p.rdrr.values())
            .chain(p.yang.values());
        for d in all {
            assert_eq!(d.status, VerificationStatus::Modelled);
            assert_ne!(d.oracle_kind, OracleKind::NoneKind);
            assert!(!d.basis.is_empty());
        }
    }
}
