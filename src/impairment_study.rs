// SPDX-License-Identifier: AGPL-3.0-only
//! The optimism-gap study: per-class AUC, the distribution-shift optimism gap,
//! the experiment grid, and the ID-only gap predictor.
//!
//! This is the analysis layer over [`crate::impairment_eval`] (the corpus +
//! detector-agnostic harness) and [`crate::impairment_ml`] (learned detectors). It
//! measures, on the synthetic parameter-grounded corpus, how much a detector's
//! in-distribution (ID) per-class AUC over-states its performance on a subtler,
//! out-of-distribution (OOD) corpus — the *optimism gap* — and asks whether that
//! gap can be predicted from ID-only diagnostics.
//!
//! ## Honest scope (load-bearing)
//! Every number here is computed over **model-derived labels on synthetic data**.
//! The optimism gap is a *synthetic→synthetic* shift (a lower severity scale), not
//! a sim-to-field claim; a positive gap demonstrates the phenomenon and the
//! predictor's signal, never a field-detection result. See [`crate::verification`].

use crate::impairment_eval::{auc, ImpairmentClass, ImpairmentDetector, LabeledCase};

/// Per-class AUC: one impairment `class`'s cases (positives) versus the corpus's
/// `Nominal` cases (negatives), scored by `det`. This isolates a single
/// impairment type's separability from nominal — the quantity the optimism gap is
/// computed on. Intended for impaired classes; passing `Nominal` compares nominal
/// against itself and returns the degenerate `0.5`. `NaN` if either side is empty.
pub fn auc_per_class<D: ImpairmentDetector>(
    det: &D,
    corpus: &[LabeledCase],
    class: ImpairmentClass,
) -> f64 {
    let pos: Vec<f64> = corpus
        .iter()
        .filter(|c| c.class == class)
        .map(|c| det.score(&c.obs))
        .collect();
    let neg: Vec<f64> = corpus
        .iter()
        .filter(|c| c.class == ImpairmentClass::Nominal)
        .map(|c| det.score(&c.obs))
        .collect();
    auc(&pos, &neg)
}

/// The per-class optimism gap `AUC_in − AUC_out`: how much a detector's
/// in-distribution per-class AUC over-states its AUC on a subtler (lower-severity,
/// out-of-tuning-regime) OOD corpus. Positive ⇒ the ID number is optimistic — the
/// exact quantity a hostile reviewer cares about. Both AUCs use the same `class`
/// positives vs `Nominal` negatives within their respective corpora.
pub fn optimism_gap<D: ImpairmentDetector>(
    det: &D,
    in_corpus: &[LabeledCase],
    out_corpus: &[LabeledCase],
    class: ImpairmentClass,
) -> f64 {
    auc_per_class(det, in_corpus, class) - auc_per_class(det, out_corpus, class)
}

#[cfg(test)]
mod tests {
    use super::*;
    use crate::impairment_eval::{
        generate_corpus, stratified_split, CaseObservables, CorpusConfig,
    };
    use crate::impairment_ml::Mlp;

    /// Reads whichever observable an impaired class drives away from nominal.
    struct Oracle;
    impl ImpairmentDetector for Oracle {
        fn name(&self) -> &str {
            "oracle"
        }
        fn score(&self, o: &CaseObservables) -> f64 {
            o.cn0_drop_db
                .max(o.agc_excess_db)
                .max(o.sqm_el_metric.abs() * 100.0)
                .max(o.parity_stat)
        }
    }

    #[test]
    fn auc_per_class_oracle_is_near_one_and_learned_gap_is_positive() {
        // On a low-noise corpus an oracle separates each impaired class from nominal.
        let clean = generate_corpus(
            &CorpusConfig {
                n_per_class: 150,
                meas_noise: 0.0,
                ..Default::default()
            },
            2,
        );
        for class in ImpairmentClass::impaired() {
            let a = auc_per_class(&Oracle, &clean, class);
            assert!(a > 0.95, "oracle per-class AUC {a} for {}", class.label());
        }

        // A learned detector trained on the nominal-severity (ID) corpus shows a
        // positive optimism gap on a subtler OOD corpus (mean over impaired classes).
        let id = generate_corpus(
            &CorpusConfig {
                n_per_class: 300,
                ..Default::default()
            },
            5,
        );
        let split = stratified_split(&id, 0.7, 5);
        assert!(
            !split.near_duplicate_leakage(1e-6),
            "train/test must be a genuine generalisation split"
        );
        let mlp = Mlp::fit(&split.train, 12, 1500, 0.1, 9);
        let ood = generate_corpus(
            &CorpusConfig {
                n_per_class: 300,
                severity_scale: 0.3,
                ..Default::default()
            },
            6,
        );
        let mean_gap = ImpairmentClass::impaired()
            .iter()
            .map(|&c| optimism_gap(&mlp, &split.test, &ood, c))
            .sum::<f64>()
            / 4.0;
        assert!(
            mean_gap > 0.0,
            "mean optimism gap {mean_gap} should be positive"
        );
    }
}
