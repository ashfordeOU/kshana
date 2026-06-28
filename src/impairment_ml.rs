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

/// Zero the standardized features the `mask` excludes (used to build single- or
/// few-feature learned detectors at matched input dimensionality to the physics
/// baselines). A masked feature is always 0, so its weight gets no gradient and
/// stays at its zero init — it contributes nothing to training or scoring.
fn apply_mask(x: &[f64; 5], mask: &[bool; 5]) -> [f64; 5] {
    let mut out = [0.0; 5];
    for k in 0..5 {
        if mask[k] {
            out[k] = x[k];
        }
    }
    out
}

/// Logistic-regression impairment detector: a linear model over standardized
/// features, trained by full-batch gradient descent on the binary
/// `is_impaired` label. Zero-initialised, so training is fully deterministic; the
/// decision statistic ([`ImpairmentDetector::score`]) is the raw logit. A feature
/// `mask` allows a reduced-dimensionality model (see [`LogisticRegression::fit_masked`]).
#[derive(Clone, Debug)]
pub struct LogisticRegression {
    std: Standardizer,
    w: [f64; 5],
    b: f64,
    mask: [bool; 5],
}

impl LogisticRegression {
    /// Train on all five features by full-batch gradient descent.
    pub fn fit(train: &[LabeledCase], epochs: usize, lr: f64) -> Self {
        Self::fit_masked(train, [true; 5], epochs, lr)
    }

    /// Train and also return the per-epoch mean cross-entropy loss (loss is
    /// measured *before* each weight update, so `trace[0]` is the zero-init loss).
    pub fn fit_with_trace(train: &[LabeledCase], epochs: usize, lr: f64) -> (Self, Vec<f64>) {
        Self::fit_masked_with_trace(train, [true; 5], epochs, lr)
    }

    /// Train using only the features the `mask` selects (others are forced to a
    /// zero weight). Use it for the matched-input-dimensionality H2 control: a
    /// single-feature learned detector to compare against a single-observable
    /// physics baseline.
    pub fn fit_masked(train: &[LabeledCase], mask: [bool; 5], epochs: usize, lr: f64) -> Self {
        Self::fit_masked_with_trace(train, mask, epochs, lr).0
    }

    /// [`LogisticRegression::fit_masked`] plus the per-epoch loss trace.
    pub fn fit_masked_with_trace(
        train: &[LabeledCase],
        mask: [bool; 5],
        epochs: usize,
        lr: f64,
    ) -> (Self, Vec<f64>) {
        let std = Standardizer::fit(train);
        let xs: Vec<[f64; 5]> = train
            .iter()
            .map(|c| apply_mask(&std.transform_case(&c.obs), &mask))
            .collect();
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
        (Self { std, w, b, mask }, trace)
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
        self.b
            + dot(
                &self.w,
                &apply_mask(&self.std.transform_case(o), &self.mask),
            )
    }
}

/// One-hidden-layer multilayer perceptron impairment detector: ReLU hidden units,
/// a single sigmoid output, trained by stochastic-gradient backpropagation on the
/// binary `is_impaired` label over standardized features. Weights are seeded, and
/// each epoch's sample order is a seeded shuffle, so training is fully reproducible
/// from `(corpus, seed)`. The decision statistic is the pre-sigmoid output logit.
#[derive(Clone, Debug)]
pub struct Mlp {
    std: Standardizer,
    w1: Vec<[f64; 5]>, // [hidden][input]
    b1: Vec<f64>,      // [hidden]
    w2: Vec<f64>,      // [hidden] output weights
    b2: f64,
}

/// Pre-sigmoid output logit of a one-hidden-layer ReLU→sigmoid MLP, given its
/// parameter slices and a standardized feature vector.
fn mlp_logit(w1: &[[f64; 5]], b1: &[f64], w2: &[f64], b2: f64, x: &[f64; 5]) -> f64 {
    let mut s = b2;
    for ((row, &bh), &wo) in w1.iter().zip(b1.iter()).zip(w2.iter()) {
        s += wo * (bh + dot(row, x)).max(0.0);
    }
    s
}

impl Mlp {
    /// Train an MLP with `hidden` ReLU units for `epochs` of SGD at rate `lr`,
    /// seeded for reproducible init and shuffling.
    pub fn fit(train: &[LabeledCase], hidden: usize, epochs: usize, lr: f64, seed: u64) -> Self {
        Self::fit_with_trace(train, hidden, epochs, lr, seed).0
    }

    /// Train and return the per-epoch mean cross-entropy loss (measured at the
    /// start of each epoch with the current weights).
    pub fn fit_with_trace(
        train: &[LabeledCase],
        hidden: usize,
        epochs: usize,
        lr: f64,
        seed: u64,
    ) -> (Self, Vec<f64>) {
        use rand::{Rng, SeedableRng};
        use rand_chacha::ChaCha8Rng;
        use rand_distr::{Distribution, Normal};

        let h = hidden.max(1);
        let std = Standardizer::fit(train);
        let xs: Vec<[f64; 5]> = train.iter().map(|c| std.transform_case(&c.obs)).collect();
        let ys: Vec<f64> = train
            .iter()
            .map(|c| if c.is_impaired() { 1.0 } else { 0.0 })
            .collect();

        let mut rng = ChaCha8Rng::seed_from_u64(seed);
        // He-style init for the ReLU hidden layer; smaller Gaussian for the output.
        let din = Normal::new(0.0, (2.0_f64 / 5.0).sqrt())
            .expect("std_dev sqrt(2/5) is a finite positive constant, which Normal::new always accepts");
        // `h = hidden.max(1) >= 1`, so `2.0 / h as f64` is finite in (0, 2] and its
        // square root is finite and strictly positive: Normal::new always accepts it.
        let dout = Normal::new(0.0, (2.0_f64 / h as f64).sqrt())
            .expect("h >= 1 makes std_dev sqrt(2/h) finite and strictly positive, which Normal::new always accepts");
        let mut w1: Vec<[f64; 5]> = (0..h)
            .map(|_| {
                let mut row = [0.0; 5];
                for r in row.iter_mut() {
                    *r = din.sample(&mut rng);
                }
                row
            })
            .collect();
        let mut b1 = vec![0.0_f64; h];
        let mut w2: Vec<f64> = (0..h).map(|_| dout.sample(&mut rng)).collect();
        let mut b2 = 0.0_f64;

        let n = xs.len();
        let mut order: Vec<usize> = (0..n).collect();
        let mut trace = Vec::with_capacity(epochs);
        for _ in 0..epochs {
            // Mean cross-entropy at the start of this epoch, current weights.
            let mut loss = 0.0;
            for (x, &y) in xs.iter().zip(ys.iter()) {
                let p = sigmoid(mlp_logit(&w1, &b1, &w2, b2, x)).clamp(1e-12, 1.0 - 1e-12);
                loss += -(y * p.ln() + (1.0 - y) * (1.0 - p).ln());
            }
            trace.push(loss / n.max(1) as f64);

            // Seeded Fisher–Yates shuffle, then a per-sample SGD pass.
            for i in (1..n).rev() {
                order.swap(i, rng.gen_range(0..=i));
            }
            for &idx in &order {
                let x = &xs[idx];
                let y = ys[idx];
                // Forward (cache pre-activations for the ReLU derivative).
                let mut a = vec![0.0_f64; h];
                let mut pre = vec![0.0_f64; h];
                for k in 0..h {
                    pre[k] = b1[k] + dot(&w1[k], x);
                    a[k] = pre[k].max(0.0);
                }
                let p = sigmoid(b2 + w2.iter().zip(a.iter()).map(|(w, ai)| w * ai).sum::<f64>());
                let d_logit = p - y; // dL/dlogit for BCE + sigmoid
                                     // Hidden-layer gradients FIRST, using the current (pre-update) w2.
                for k in 0..h {
                    if pre[k] > 0.0 {
                        let d_pre = d_logit * w2[k];
                        for (wk, &xk) in w1[k].iter_mut().zip(x.iter()) {
                            *wk -= lr * d_pre * xk;
                        }
                        b1[k] -= lr * d_pre;
                    }
                }
                // Output-layer gradients.
                for k in 0..h {
                    w2[k] -= lr * d_logit * a[k];
                }
                b2 -= lr * d_logit;
            }
        }
        (
            Self {
                std,
                w1,
                b1,
                w2,
                b2,
            },
            trace,
        )
    }

    /// The pre-sigmoid output logit for a standardized feature vector.
    fn logit(&self, x: &[f64; 5]) -> f64 {
        mlp_logit(&self.w1, &self.b1, &self.w2, self.b2, x)
    }
}

impl ImpairmentDetector for Mlp {
    fn name(&self) -> &str {
        "mlp"
    }
    fn score(&self, o: &CaseObservables) -> f64 {
        self.logit(&self.std.transform_case(o))
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

    /// A non-linearly-separable (XOR) toy corpus in the (cn0_drop, agc_excess)
    /// plane: label = impaired iff exactly one of the two features is "high". A
    /// linear model cannot separate it; a one-hidden-layer MLP can.
    fn xor_toy(seed: u64, per_corner: usize) -> Vec<LabeledCase> {
        use crate::impairment_eval::{CaseParams, ImpairmentClass};
        use rand::SeedableRng;
        use rand_chacha::ChaCha8Rng;
        use rand_distr::{Distribution, Normal};
        let mut rng = ChaCha8Rng::seed_from_u64(seed);
        let jit = Normal::new(0.0_f64, 0.25).unwrap();
        // (cn0_high, agc_high, impaired?)
        let corners = [
            (0.0, 0.0, false),
            (3.0, 3.0, false),
            (0.0, 3.0, true),
            (3.0, 0.0, true),
        ];
        let mut out = Vec::new();
        let mut key = 0u64;
        for (ci, &(cn0, agc, imp)) in corners.iter().enumerate() {
            for _ in 0..per_corner {
                let obs = CaseObservables {
                    js_db: 0.0,
                    cn0_drop_db: cn0 + jit.sample(&mut rng),
                    agc_excess_db: agc + jit.sample(&mut rng),
                    sqm_el_metric: 0.0,
                    parity_stat: 0.0,
                };
                out.push(LabeledCase {
                    class: if imp {
                        ImpairmentClass::Jamming
                    } else {
                        ImpairmentClass::Nominal
                    },
                    params: CaseParams {
                        severity: 0.0,
                        key: ((ci as u64) << 32) | key,
                    },
                    obs,
                });
                key += 1;
            }
        }
        out
    }

    #[test]
    fn masked_logreg_uses_only_selected_features() {
        let corpus = generate_corpus(
            &CorpusConfig {
                n_per_class: 200,
                ..Default::default()
            },
            17,
        );
        // A single-feature learned detector on cn0_drop (index 0) only.
        let mask = [true, false, false, false, false];
        let m = LogisticRegression::fit_masked(&corpus, mask, 600, 0.3);
        let w = m.weights();
        // Masked-out features keep their zero init; the selected feature is used.
        assert!(
            w[0].abs() > 1e-6,
            "selected feature must have non-zero weight"
        );
        for (k, wk) in w.iter().enumerate().skip(1) {
            assert_eq!(*wk, 0.0, "masked feature {k} weight must stay zero");
        }
        // It still detects jamming (a cn0-driven class) better than chance.
        let auc = evaluate(&m, &corpus, 0.05).auc;
        assert!(auc > 0.5, "single-feature learned detector AUC {auc}");
    }

    #[test]
    fn mlp_separates_xor_where_logreg_cannot_seeded_and_loss_decreases() {
        let toy = xor_toy(101, 60);
        // A linear model is at chance on XOR.
        let logreg = LogisticRegression::fit(&toy, 800, 0.3);
        let lr_auc = evaluate(&logreg, &toy, 0.05).auc;
        assert!(
            lr_auc < 0.75,
            "logreg should be near-chance on XOR, got {lr_auc}"
        );
        // The MLP learns the non-linear boundary.
        let (mlp, trace) = Mlp::fit_with_trace(&toy, 12, 3000, 0.1, 7);
        let mlp_auc = evaluate(&mlp, &toy, 0.05).auc;
        assert!(mlp_auc > 0.9, "MLP should separate XOR, got {mlp_auc}");
        assert!(
            mlp_auc > lr_auc + 0.15,
            "MLP {mlp_auc} should clearly beat logreg {lr_auc} on a non-linear set"
        );
        // Seeded: same seed → identical model (identical AUC bit-for-bit).
        let mlp2 = Mlp::fit(&toy, 12, 3000, 0.1, 7);
        assert_eq!(
            evaluate(&mlp, &toy, 0.05).auc.to_bits(),
            evaluate(&mlp2, &toy, 0.05).auc.to_bits(),
            "same seed must reproduce the model"
        );
        // Training loss drops over the run.
        assert!(
            *trace.last().unwrap() < trace[0] * 0.5,
            "MLP loss should fall substantially: {} -> {}",
            trace[0],
            trace.last().unwrap()
        );
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
