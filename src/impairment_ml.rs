// SPDX-License-Identifier: AGPL-3.0-only
//! Learned RF-impairment detectors for the optimism-gap study.
//!
//! A fixed measurement-domain feature map, a train-fit [`Standardizer`], and two
//! transparent learned baselines — [`LogisticRegression`] (linear) and [`Mlp`]
//! (one hidden layer) — that plug into the [`ImpairmentDetector`] trait so the
//! existing [`crate::impairment_eval`] harness scores them exactly like the
//! published-method physics baselines.
//!
//! ## Honest scope (load-bearing)
//! These are **deliberately small, reproducible** learners trained on the
//! synthetic, parameter-grounded corpus — included to *measure the optimism gap a
//! learned model opens up under distribution shift*, not to claim a
//! state-of-the-art detector. Every model is seeded (or zero-initialised) so a
//! reported weight vector is reproducible from `(corpus, seed)`. An AUC here is an
//! AUC over model-derived labels on synthetic data; it carries **no** field /
//! raw-IQ performance claim. See [`crate::verification`] for the honesty invariant.

use crate::impairment_eval::{CaseObservables, ImpairmentDetector, LabeledCase};

/// Numerically safe logistic sigmoid `1 / (1 + e^{−z})`.
fn sigmoid(z: f64) -> f64 {
    if z >= 0.0 {
        1.0 / (1.0 + (-z).exp())
    } else {
        let e = z.exp();
        e / (1.0 + e)
    }
}

/// Dot product of a weight vector and a feature vector.
fn dot(w: &[f64; 5], x: &[f64; 5]) -> f64 {
    w.iter().zip(x.iter()).map(|(a, b)| a * b).sum()
}

/// The fixed feature map a learned detector consumes: the five measurement-domain
/// observables in a stable order, with the (sign-free) SQM imbalance taken as a
/// magnitude. Order: `[cn0_drop_db, agc_excess_db, |sqm_el_metric|, parity_stat, js_db]`.
pub fn features(o: &CaseObservables) -> [f64; 5] {
    [
        o.cn0_drop_db,
        o.agc_excess_db,
        o.sqm_el_metric.abs(),
        o.parity_stat,
        o.js_db,
    ]
}

/// Per-feature mean/standard-deviation standardiser fit on a training set.
///
/// [`Standardizer::transform`] maps a raw feature vector to z-scores
/// `(x − mean) / std`. The standard deviation is the **population** std (divided
/// by `N`) so the transformed *training* set has exactly zero mean and unit
/// variance; each component is floored at `1e-9` so a constant feature does not
/// divide by zero (it maps to ~0 instead of exploding).
#[derive(Clone, Debug)]
pub struct Standardizer {
    /// Per-feature training mean.
    pub mean: [f64; 5],
    /// Per-feature training standard deviation (floored at `1e-9`).
    pub std: [f64; 5],
}

impl Standardizer {
    /// Fit per-feature mean and population std over the training cases' features.
    pub fn fit(train: &[LabeledCase]) -> Self {
        let n = train.len().max(1) as f64;
        let mut mean = [0.0; 5];
        for c in train {
            let f = features(&c.obs);
            for k in 0..5 {
                mean[k] += f[k];
            }
        }
        for m in &mut mean {
            *m /= n;
        }
        let mut var = [0.0; 5];
        for c in train {
            let f = features(&c.obs);
            for k in 0..5 {
                var[k] += (f[k] - mean[k]).powi(2);
            }
        }
        let mut std = [0.0; 5];
        for k in 0..5 {
            std[k] = (var[k] / n).sqrt().max(1e-9);
        }
        Self { mean, std }
    }

    /// Z-score a raw feature vector with the fitted mean/std.
    pub fn transform(&self, x: &[f64; 5]) -> [f64; 5] {
        let mut z = [0.0; 5];
        for k in 0..5 {
            z[k] = (x[k] - self.mean[k]) / self.std[k];
        }
        z
    }

    /// Convenience: feature-extract then standardise one case's observables.
    pub fn transform_case(&self, o: &CaseObservables) -> [f64; 5] {
        self.transform(&features(o))
    }
}

/// Logistic-regression impairment detector: a linear model over standardized
/// features, trained by full-batch gradient descent on the binary
/// `is_impaired` label. Zero-initialised, so training is fully deterministic; the
/// decision statistic ([`ImpairmentDetector::score`]) is the raw logit.
#[derive(Clone, Debug)]
pub struct LogisticRegression {
    std: Standardizer,
    w: [f64; 5],
    b: f64,
}

impl LogisticRegression {
    /// Train by full-batch gradient descent for `epochs` at learning rate `lr`.
    pub fn fit(train: &[LabeledCase], epochs: usize, lr: f64) -> Self {
        Self::fit_with_trace(train, epochs, lr).0
    }

    /// Train and also return the per-epoch mean cross-entropy loss (loss is
    /// measured *before* each weight update, so `trace[0]` is the zero-init loss).
    pub fn fit_with_trace(train: &[LabeledCase], epochs: usize, lr: f64) -> (Self, Vec<f64>) {
        let std = Standardizer::fit(train);
        let xs: Vec<[f64; 5]> = train.iter().map(|c| std.transform_case(&c.obs)).collect();
        let ys: Vec<f64> = train
            .iter()
            .map(|c| if c.is_impaired() { 1.0 } else { 0.0 })
            .collect();
        let n = train.len().max(1) as f64;
        let mut w = [0.0_f64; 5];
        let mut b = 0.0_f64;
        let mut trace = Vec::with_capacity(epochs);
        for _ in 0..epochs {
            let mut gw = [0.0_f64; 5];
            let mut gb = 0.0_f64;
            let mut loss = 0.0_f64;
            for (x, &y) in xs.iter().zip(ys.iter()) {
                let p = sigmoid(b + dot(&w, x));
                let e = p - y;
                for k in 0..5 {
                    gw[k] += e * x[k];
                }
                gb += e;
                let pc = p.clamp(1e-12, 1.0 - 1e-12);
                loss += -(y * pc.ln() + (1.0 - y) * (1.0 - pc).ln());
            }
            trace.push(loss / n);
            for k in 0..5 {
                w[k] -= lr * gw[k] / n;
            }
            b -= lr * gb / n;
        }
        (Self { std, w, b }, trace)
    }

    /// The fitted feature weights (post-standardisation).
    pub fn weights(&self) -> [f64; 5] {
        self.w
    }

    /// The fitted bias / intercept.
    pub fn bias(&self) -> f64 {
        self.b
    }
}

impl ImpairmentDetector for LogisticRegression {
    fn name(&self) -> &str {
        "logreg"
    }
    fn score(&self, o: &CaseObservables) -> f64 {
        self.b + dot(&self.w, &self.std.transform_case(o))
    }
}

#[cfg(test)]
mod tests {
    use super::*;
    use crate::impairment_eval::{evaluate, generate_corpus, CorpusConfig};

    #[test]
    fn features_are_the_fixed_five_vector_in_order() {
        let o = CaseObservables {
            js_db: 5.0,
            cn0_drop_db: 3.0,
            agc_excess_db: 2.0,
            sqm_el_metric: -0.1,
            parity_stat: 0.5,
        };
        // cn0_drop, agc, |sqm|, parity, js — note |−0.1| = 0.1.
        assert_eq!(features(&o), [3.0, 2.0, 0.1, 0.5, 5.0]);
    }

    #[test]
    fn logreg_separates_corpus_is_deterministic_and_loss_decreases() {
        let corpus = generate_corpus(
            &CorpusConfig {
                n_per_class: 300,
                ..Default::default()
            },
            13,
        );
        let (model, trace) = LogisticRegression::fit_with_trace(&corpus, 600, 0.3);
        // The synthetic corpus is largely linearly separable in feature space, so a
        // standardized linear model reads it near-perfectly (AUC over model labels).
        let rep = evaluate(&model, &corpus, 0.05);
        assert!(rep.auc > 0.95, "logreg AUC {} on separable corpus", rep.auc);
        // Full-batch GD from a zero init is deterministic: identical weights.
        let again = LogisticRegression::fit(&corpus, 600, 0.3);
        assert_eq!(model.weights(), again.weights());
        assert_eq!(model.bias().to_bits(), again.bias().to_bits());
        // Training cross-entropy decreases monotonically (convex loss, small lr).
        assert!(
            *trace.last().unwrap() < trace[0],
            "loss should drop: {} -> {}",
            trace[0],
            trace.last().unwrap()
        );
        for w in trace.windows(2) {
            assert!(
                w[1] <= w[0] + 1e-9,
                "loss must not increase: {} -> {}",
                w[0],
                w[1]
            );
        }
    }

    #[test]
    fn standardizer_zero_means_unit_var_on_train() {
        let corpus = generate_corpus(
            &CorpusConfig {
                n_per_class: 100,
                ..Default::default()
            },
            7,
        );
        let s = Standardizer::fit(&corpus);
        let z: Vec<[f64; 5]> = corpus
            .iter()
            .map(|c| s.transform(&features(&c.obs)))
            .collect();
        for k in 0..5 {
            let m = z.iter().map(|r| r[k]).sum::<f64>() / z.len() as f64;
            let v = z.iter().map(|r| (r[k] - m).powi(2)).sum::<f64>() / z.len() as f64;
            assert!(m.abs() < 1e-9, "feature {k} train mean {m} should be ~0");
            assert!(
                (v - 1.0).abs() < 1e-6,
                "feature {k} train var {v} should be ~1"
            );
        }
    }
}
