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

use crate::eval_stats::{bootstrap_ci, ridge_fit, ridge_predict, spearman};
use crate::impairment_eval::{
    auc, generate_corpus, stratified_split, threshold_for_pfa, AgcDetector, CorpusConfig,
    EnergyDetector, FusedDetector, ImpairmentClass, ImpairmentDetector, LabeledCase,
    ParityDetector, SqmDetector,
};
use crate::impairment_ml::{LogisticRegression, Mlp};

/// Per-class AUC: one impairment `class`'s cases (positives) versus the corpus's
/// `Nominal` cases (negatives), scored by `det`. This isolates a single
/// impairment type's separability from nominal — the quantity the optimism gap is
/// computed on. Intended for impaired classes; passing `Nominal` compares nominal
/// against itself and returns the degenerate `0.5`. `NaN` if either side is empty.
pub fn auc_per_class<D: ImpairmentDetector + ?Sized>(
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
pub fn optimism_gap<D: ImpairmentDetector + ?Sized>(
    det: &D,
    in_corpus: &[LabeledCase],
    out_corpus: &[LabeledCase],
    class: ImpairmentClass,
) -> f64 {
    auc_per_class(det, in_corpus, class) - auc_per_class(det, out_corpus, class)
}

// ── Experiment grid ─────────────────────────────────────────────────────────

/// Configuration for the optimism-gap experiment grid.
#[derive(Clone, Debug)]
pub struct GridConfig {
    /// Cases per class in each (class-balanced) corpus.
    pub n_per_class: usize,
    /// Fraction of the ID corpus used to train learned detectors.
    pub frac_train: f64,
    /// OOD severity scales (`< 1.0` = subtler than the ID regime), e.g. `[0.3, 0.6, 0.9]`.
    pub severities: Vec<f64>,
    /// Replication seeds — each is an independent corpus draw + training run.
    pub seeds: Vec<u64>,
    /// Operating-point target P_fa (retained for provenance; the gap uses AUC).
    pub target_pfa: f64,
    /// Bootstrap resamples for each cell's mean-gap CI.
    pub bootstrap_resamples: usize,
    /// Bootstrap confidence level `alpha` (e.g. `0.05` → 95% CI).
    pub bootstrap_alpha: f64,
    /// Logistic-regression training epochs.
    pub logreg_epochs: usize,
    /// Logistic-regression learning rate.
    pub logreg_lr: f64,
    /// MLP hidden-unit counts — one learned MLP detector is trained per capacity,
    /// widening the detector panel (more leave-one-detector-out folds).
    pub mlp_hidden_sizes: Vec<usize>,
    /// MLP training epochs.
    pub mlp_epochs: usize,
    /// MLP learning rate.
    pub mlp_lr: f64,
}

/// One aggregated grid cell: the optimism gap for `(detector, class, severity)`,
/// summarised across the replication seeds.
#[derive(Clone, Debug)]
pub struct Cell {
    /// Detector name.
    pub detector: String,
    /// Impairment class.
    pub class: ImpairmentClass,
    /// OOD severity scale.
    pub severity: f64,
    /// Mean optimism gap `Δ = AUC_in − AUC_out` over the seeds.
    pub mean_gap: f64,
    /// Bootstrap CI lower bound on the mean gap.
    pub boot_lo: f64,
    /// Bootstrap CI upper bound on the mean gap.
    pub boot_hi: f64,
    /// Across-seed standard error of the gap (`std / √k`).
    pub seed_se: f64,
    /// The per-seed gaps (transparency / provenance).
    pub gaps: Vec<f64>,
}

/// The scaling-law trend for one `(detector, class)`: how the optimism gap grows
/// as the OOD regime gets subtler, measured over all `(1 − s, Δ)` sample points.
#[derive(Clone, Debug)]
pub struct Trend {
    /// Detector name.
    pub detector: String,
    /// Impairment class.
    pub class: ImpairmentClass,
    /// Spearman rank correlation of `Δ` with `(1 − s)` (monotone scaling).
    pub spearman_rho: f64,
    /// Two-sided large-sample p-value for the correlation.
    pub spearman_p: f64,
    /// OLS slope of `Δ` on `(1 − s)` — the scaling-law slope.
    pub slope: f64,
    /// Mean held-out **in-distribution** per-class AUC over seeds — lets a reader
    /// verify that a non-positive trend coincides with a near-chance ID AUC (a
    /// detector with nothing to lose), rather than a failure of the scaling law.
    pub id_auc_mean: f64,
}

/// The full grid result: per-cell aggregates, per-`(d,c)` trends, the detector
/// roster, and the config (for provenance).
#[derive(Clone, Debug)]
pub struct GridResult {
    /// One aggregated cell per `(detector, class, severity)`.
    pub cells: Vec<Cell>,
    /// One scaling-law trend per `(detector, class)`.
    pub trends: Vec<Trend>,
    /// Detector names, in evaluation order.
    pub detectors: Vec<String>,
    /// The config that produced this result.
    pub config: GridConfig,
}

/// Build the detector roster for one seed: the five transparent physics baselines
/// (stateless), full-feature learned detectors (logistic regression + one MLP per
/// configured capacity), and three **single-feature** learned controls (logistic
/// regression on one observable each) at matched input dimensionality to the
/// single-observable physics baselines — the H2 evidence-breadth control.
fn detectors_for_seed(
    train: &[LabeledCase],
    cfg: &GridConfig,
    seed: u64,
) -> Vec<(String, Box<dyn ImpairmentDetector>)> {
    let mut v: Vec<(String, Box<dyn ImpairmentDetector>)> = vec![
        (EnergyDetector.name().to_string(), Box::new(EnergyDetector)),
        (AgcDetector.name().to_string(), Box::new(AgcDetector)),
        (SqmDetector.name().to_string(), Box::new(SqmDetector)),
        (ParityDetector.name().to_string(), Box::new(ParityDetector)),
        (FusedDetector.name().to_string(), Box::new(FusedDetector)),
        (
            "logreg".to_string(),
            Box::new(LogisticRegression::fit(
                train,
                cfg.logreg_epochs,
                cfg.logreg_lr,
            )),
        ),
    ];
    // One MLP per configured hidden capacity (varied seed per capacity).
    for &h in &cfg.mlp_hidden_sizes {
        v.push((
            format!("mlp{h}"),
            Box::new(Mlp::fit(
                train,
                h,
                cfg.mlp_epochs,
                cfg.mlp_lr,
                seed.wrapping_add(h as u64),
            )),
        ));
    }
    // Single-feature learned controls (matched-dimensionality H2 control):
    // logistic regression on cn0_drop (idx 0), agc_excess (idx 1), parity (idx 3),
    // the observables the energy / agc / parity physics baselines read.
    for (name, idx) in [
        ("logreg-cn0", 0usize),
        ("logreg-agc", 1),
        ("logreg-parity", 3),
    ] {
        let mut mask = [false; 5];
        mask[idx] = true;
        v.push((
            name.to_string(),
            Box::new(LogisticRegression::fit_masked(
                train,
                mask,
                cfg.logreg_epochs,
                cfg.logreg_lr,
            )),
        ));
    }
    v
}

/// A reproducible OOD corpus seed, distinct from the ID seed and per severity index.
fn ood_seed(seed: u64, severity_index: usize) -> u64 {
    seed.wrapping_mul(0x1_0000_000B)
        .wrapping_add(severity_index as u64 + 1)
}

/// Run the optimism-gap experiment grid: for each seed, train learned detectors on
/// an ID train split (asserting the near-duplicate leakage guard), measure each
/// detector's held-out ID per-class AUC, then for each OOD severity measure the
/// per-class AUC on a subtler corpus and record the gap. Aggregates per
/// `(detector, class, severity)` cell (mean gap + bootstrap & across-seed CIs) and
/// fits a per-`(detector, class)` scaling-law trend (Spearman ρ + OLS slope on
/// `(1 − s, Δ)`).
///
/// # Panics
/// Panics if a training split fails the near-duplicate leakage guard — that would
/// mean the generalisation measurement is compromised, which must never pass silently.
pub fn run_grid(cfg: &GridConfig) -> GridResult {
    let classes = ImpairmentClass::impaired();
    let severities = &cfg.severities;
    // raw[det][class][sev] = Vec over seeds of the gap Δ.
    let mut det_names: Vec<String> = Vec::new();
    let mut raw: Vec<Vec<Vec<Vec<f64>>>> = Vec::new();
    // raw_id_auc[det][class] = Vec over seeds of the held-out ID per-class AUC.
    let mut raw_id_auc: Vec<Vec<Vec<f64>>> = Vec::new();

    for &seed in &cfg.seeds {
        let id = generate_corpus(
            &CorpusConfig {
                n_per_class: cfg.n_per_class,
                ..Default::default()
            },
            seed,
        );
        let split = stratified_split(&id, cfg.frac_train, seed);
        assert!(
            !split.near_duplicate_leakage(1e-6),
            "leakage guard tripped: ID train/test split for seed {seed} is not a genuine \
             generalisation split"
        );
        let dets = detectors_for_seed(&split.train, cfg, seed);
        if det_names.is_empty() {
            det_names = dets.iter().map(|(n, _)| n.clone()).collect();
            raw = vec![vec![vec![Vec::new(); severities.len()]; classes.len()]; det_names.len()];
            raw_id_auc = vec![vec![Vec::new(); classes.len()]; det_names.len()];
        }
        // Held-out ID per-class AUC for every detector.
        let id_auc: Vec<Vec<f64>> = dets
            .iter()
            .map(|(_, d)| {
                classes
                    .iter()
                    .map(|&c| auc_per_class(d.as_ref(), &split.test, c))
                    .collect()
            })
            .collect();
        for (di, row) in id_auc.iter().enumerate() {
            for (ci, &a) in row.iter().enumerate() {
                raw_id_auc[di][ci].push(a);
            }
        }
        // OOD per-class AUC at each severity, and the gap.
        for (si, &s) in severities.iter().enumerate() {
            let ood = generate_corpus(
                &CorpusConfig {
                    n_per_class: cfg.n_per_class,
                    severity_scale: s,
                    ..Default::default()
                },
                ood_seed(seed, si),
            );
            for (di, (_, d)) in dets.iter().enumerate() {
                for (ci, &c) in classes.iter().enumerate() {
                    let gap = id_auc[di][ci] - auc_per_class(d.as_ref(), &ood, c);
                    raw[di][ci][si].push(gap);
                }
            }
        }
    }

    // Aggregate cells and fit trends.
    let mut cells = Vec::new();
    let mut trends = Vec::new();
    for (di, name) in det_names.iter().enumerate() {
        for (ci, &class) in classes.iter().enumerate() {
            // Trend points across all (severity, seed) pairs.
            let mut tx = Vec::new();
            let mut ty = Vec::new();
            for (si, &s) in severities.iter().enumerate() {
                let gaps = &raw[di][ci][si];
                let k = gaps.len().max(1) as f64;
                let mean = gaps.iter().sum::<f64>() / k;
                let var = if gaps.len() > 1 {
                    gaps.iter().map(|g| (g - mean).powi(2)).sum::<f64>() / (gaps.len() as f64 - 1.0)
                } else {
                    0.0
                };
                let (boot_lo, boot_hi) = bootstrap_ci(
                    gaps,
                    cfg.bootstrap_resamples,
                    ood_seed(0xB007, si * 31 + di),
                    cfg.bootstrap_alpha,
                );
                cells.push(Cell {
                    detector: name.clone(),
                    class,
                    severity: s,
                    mean_gap: mean,
                    boot_lo,
                    boot_hi,
                    seed_se: (var / k).sqrt(),
                    gaps: gaps.clone(),
                });
                for &g in gaps {
                    tx.push(1.0 - s);
                    ty.push(g);
                }
            }
            let (rho, p) = spearman(&tx, &ty);
            let xcol: Vec<Vec<f64>> = tx.iter().map(|&v| vec![v]).collect();
            let slope = ridge_fit(&xcol, &ty, 0.0).get(1).copied().unwrap_or(0.0);
            let id_aucs = &raw_id_auc[di][ci];
            let id_auc_mean = id_aucs.iter().sum::<f64>() / id_aucs.len().max(1) as f64;
            trends.push(Trend {
                detector: name.clone(),
                class,
                spearman_rho: rho,
                spearman_p: p,
                slope,
                id_auc_mean,
            });
        }
    }

    GridResult {
        cells,
        trends,
        detectors: det_names,
        config: cfg.clone(),
    }
}

// ── ID-only gap predictor (the headline) ────────────────────────────────────

/// The fixed ID-only diagnostic feature names, in order (see [`id_features`]).
pub const ID_FEATURE_NAMES: [&str; 6] = [
    "auc_in",
    "dprime",
    "overlap",
    "var_ratio",
    "tail_margin",
    "pd_at_pfa",
];

fn mean_of(v: &[f64]) -> f64 {
    if v.is_empty() {
        0.0
    } else {
        v.iter().sum::<f64>() / v.len() as f64
    }
}

fn std_pop(v: &[f64], m: f64) -> f64 {
    if v.is_empty() {
        0.0
    } else {
        (v.iter().map(|x| (x - m).powi(2)).sum::<f64>() / v.len() as f64).sqrt()
    }
}

/// Nearest-rank quantile of a pre-sorted slice; `NaN` if empty.
fn quantile(sorted: &[f64], q: f64) -> f64 {
    if sorted.is_empty() {
        return f64::NAN;
    }
    let idx = (q.clamp(0.0, 1.0) * (sorted.len() - 1) as f64).round() as usize;
    sorted[idx.min(sorted.len() - 1)]
}

/// The six ID-only diagnostic features for a `(detector, class)`, computed purely
/// from the in-distribution corpus (class positives vs `Nominal` negatives), with
/// **no** access to any out-of-distribution data:
/// `[auc_in, d′, overlap, var_ratio, tail_margin, pd_at_pfa]` (see
/// [`ID_FEATURE_NAMES`]). These are the predictors the gap model uses to estimate
/// how optimistic the ID AUC will prove under shift.
pub fn id_features<D: ImpairmentDetector + ?Sized>(
    det: &D,
    corpus: &[LabeledCase],
    class: ImpairmentClass,
    target_pfa: f64,
) -> [f64; 6] {
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
    id_features_from_scores(&pos, &neg, target_pfa)
}

/// The six ID-only diagnostic features computed directly from a detector's score
/// distribution: `pos` are the impaired (positive) scores and `neg` the nominal
/// (negative) scores, both in-distribution. This is the score-level core shared by
/// the synthetic path ([`id_features`]) and the real-data path
/// ([`build_real_gap_rows`]), so a real dataset that exposes one scalar detector
/// statistic per labelled observation runs the identical feature extraction.
pub fn id_features_from_scores(pos: &[f64], neg: &[f64], target_pfa: f64) -> [f64; 6] {
    let auc_in = auc(pos, neg);
    let (mp, mn) = (mean_of(pos), mean_of(neg));
    let (sp, sn) = (std_pop(pos, mp), std_pop(neg, mn));
    let pooled = (((sp * sp + sn * sn) / 2.0).sqrt()).max(1e-9);
    let dprime = (mp - mn) / pooled;
    let var_ratio = sp / sn.max(1e-9);
    let mut posv = pos.to_vec();
    let mut negv = neg.to_vec();
    // `total_cmp` is a total order over all f64, so a NaN score cannot make the sort
    // comparator return `None` (which `partial_cmp` would).
    posv.sort_by(|a, b| a.total_cmp(b));
    negv.sort_by(|a, b| a.total_cmp(b));
    let q95_neg = quantile(&negv, 0.95);
    let tail_margin = (quantile(&posv, 0.05) - q95_neg) / pooled;
    let overlap = posv.iter().filter(|&&p| p <= q95_neg).count() as f64 / posv.len().max(1) as f64;
    let thr = threshold_for_pfa(&negv, target_pfa);
    let pd_at_pfa = posv.iter().filter(|&&p| p >= thr).count() as f64 / posv.len().max(1) as f64;
    [auc_in, dprime, overlap, var_ratio, tail_margin, pd_at_pfa]
}

/// The self-perturbation slope: the local sensitivity of validation AUC to a small
/// **self-imposed** severity perturbation, fitted as the OLS slope of per-class
/// AUC on `(1 − scale)` over the mild probe corpora. It is an ID-time fragility
/// probe — it uses the experimenter's own perturbed validation data, never the
/// true OOD corpus — so it is reported as a *separate, ablatable* feature.
fn self_perturbation_slope<D: ImpairmentDetector + ?Sized>(
    det: &D,
    probes: &[(f64, Vec<LabeledCase>)],
    class: ImpairmentClass,
) -> f64 {
    let xcol: Vec<Vec<f64>> = probes.iter().map(|(s, _)| vec![1.0 - s]).collect();
    let ys: Vec<f64> = probes
        .iter()
        .map(|(_, c)| auc_per_class(det, c, class))
        .collect();
    ridge_fit(&xcol, &ys, 0.0).get(1).copied().unwrap_or(0.0)
}

/// Configuration for building gap-predictor training rows.
#[derive(Clone, Debug)]
pub struct PredictorConfig {
    /// The experiment grid (corpus sizes, severities, seeds, ML hyperparameters).
    pub grid: GridConfig,
    /// Append the (ablatable) self-perturbation slope feature.
    pub include_self_slope: bool,
    /// Mild probe scales for the self-perturbation slope (e.g. `[0.8, 0.9, 1.0]`).
    pub probe_scales: Vec<f64>,
    /// Ridge penalty for the gap predictor.
    pub ridge_lambda: f64,
}

/// One training row for the gap predictor: ID-only features and the realised
/// optimism gap (mean over the OOD severities) for a `(detector, class, seed)`.
#[derive(Clone, Debug)]
pub struct GapRow {
    /// Detector name.
    pub detector: String,
    /// Impairment class.
    pub class: ImpairmentClass,
    /// Replication seed.
    pub seed: u64,
    /// ID-only features (6 core, plus the self-perturbation slope if enabled).
    pub features: Vec<f64>,
    /// Realised optimism gap = `AUC_in − mean_s AUC_out(s)`.
    pub gap: f64,
}

/// A reproducible probe-corpus seed, distinct from the ID and OOD seeds.
fn probe_seed(seed: u64, index: usize) -> u64 {
    seed.wrapping_mul(0x9E37_79B1)
        .wrapping_add(index as u64 + 1000)
}

/// Build the gap-predictor training rows: for each seed, train the learned
/// detectors on an ID train split (leakage-guarded), then for each
/// `(detector, class)` record the ID-only features on the held-out ID test set and
/// the realised optimism gap against the OOD severity sweep.
pub fn build_gap_rows(pc: &PredictorConfig) -> Vec<GapRow> {
    let cfg = &pc.grid;
    let classes = ImpairmentClass::impaired();
    let mut rows = Vec::new();
    for &seed in &cfg.seeds {
        let id = generate_corpus(
            &CorpusConfig {
                n_per_class: cfg.n_per_class,
                ..Default::default()
            },
            seed,
        );
        let split = stratified_split(&id, cfg.frac_train, seed);
        assert!(
            !split.near_duplicate_leakage(1e-6),
            "leakage guard tripped for seed {seed}"
        );
        let dets = detectors_for_seed(&split.train, cfg, seed);
        let oods: Vec<Vec<LabeledCase>> = cfg
            .severities
            .iter()
            .enumerate()
            .map(|(si, &s)| {
                generate_corpus(
                    &CorpusConfig {
                        n_per_class: cfg.n_per_class,
                        severity_scale: s,
                        ..Default::default()
                    },
                    ood_seed(seed, si),
                )
            })
            .collect();
        // Mild self-perturbation probes (independent seeds), generated once per seed.
        let probes: Vec<(f64, Vec<LabeledCase>)> = pc
            .probe_scales
            .iter()
            .enumerate()
            .map(|(pi, &s)| {
                (
                    s,
                    generate_corpus(
                        &CorpusConfig {
                            n_per_class: cfg.n_per_class,
                            severity_scale: s,
                            ..Default::default()
                        },
                        probe_seed(seed, pi),
                    ),
                )
            })
            .collect();
        for (name, d) in &dets {
            for &class in &classes {
                let id_auc = auc_per_class(d.as_ref(), &split.test, class);
                let mean_ood = oods
                    .iter()
                    .map(|o| auc_per_class(d.as_ref(), o, class))
                    .sum::<f64>()
                    / oods.len().max(1) as f64;
                let mut feats =
                    id_features(d.as_ref(), &split.test, class, cfg.target_pfa).to_vec();
                if pc.include_self_slope {
                    feats.push(self_perturbation_slope(d.as_ref(), &probes, class));
                }
                rows.push(GapRow {
                    detector: name.clone(),
                    class,
                    seed,
                    features: feats,
                    gap: id_auc - mean_ood,
                });
            }
        }
    }
    rows
}

/// Per-column mean and population std over training rows (for standardisation).
fn col_stats(rows: &[Vec<f64>]) -> (Vec<f64>, Vec<f64>) {
    let p = rows.first().map(|r| r.len()).unwrap_or(0);
    let n = rows.len().max(1) as f64;
    let mut mean = vec![0.0; p];
    for r in rows {
        for (m, &v) in mean.iter_mut().zip(r.iter()) {
            *m += v;
        }
    }
    for m in &mut mean {
        *m /= n;
    }
    let mut std = vec![0.0; p];
    for r in rows {
        for (k, &v) in r.iter().enumerate() {
            std[k] += (v - mean[k]).powi(2);
        }
    }
    for s in &mut std {
        *s = (*s / n).sqrt().max(1e-9);
    }
    (mean, std)
}

fn zrow(row: &[f64], mean: &[f64], std: &[f64]) -> Vec<f64> {
    row.iter()
        .zip(mean.iter().zip(std.iter()))
        .map(|(&v, (&m, &s))| (v - m) / s)
        .collect()
}

/// A fitted ridge gap predictor with its feature standardisation.
#[derive(Clone, Debug)]
pub struct GapPredictor {
    /// Per-feature training mean.
    pub mean: Vec<f64>,
    /// Per-feature training std.
    pub std: Vec<f64>,
    /// Ridge coefficients `[intercept, w…]` on standardised features.
    pub coeffs: Vec<f64>,
}

impl GapPredictor {
    /// Predict the optimism gap for a raw ID feature vector.
    pub fn predict(&self, features: &[f64]) -> f64 {
        ridge_predict(&self.coeffs, &zrow(features, &self.mean, &self.std))
    }
}

/// Fit a ridge gap predictor on all rows (features standardised on the full set).
pub fn fit_gap_predictor(rows: &[GapRow], lambda: f64) -> GapPredictor {
    let x: Vec<Vec<f64>> = rows.iter().map(|r| r.features.clone()).collect();
    let y: Vec<f64> = rows.iter().map(|r| r.gap).collect();
    let (mean, std) = col_stats(&x);
    let xz: Vec<Vec<f64>> = x.iter().map(|row| zrow(row, &mean, &std)).collect();
    let coeffs = ridge_fit(&xz, &y, lambda);
    GapPredictor { mean, std, coeffs }
}

/// A cross-validation result: out-of-fold `R²` (vs predict-the-mean), RMSE, the
/// predicted-vs-actual pairs, and the number of held-out folds.
#[derive(Clone, Debug)]
pub struct CvResult {
    /// Out-of-fold coefficient of determination (`> 0` ⇒ beats the global mean).
    pub r2: f64,
    /// Out-of-fold root-mean-square error.
    pub rmse: f64,
    /// `(predicted, actual)` pairs across all held-out folds.
    pub pred_actual: Vec<(f64, f64)>,
    /// Number of held-out folds (groups).
    pub n_folds: usize,
}

fn cv_metrics(pa: Vec<(f64, f64)>, n_folds: usize) -> CvResult {
    let n = pa.len().max(1) as f64;
    let ybar = pa.iter().map(|(_, a)| a).sum::<f64>() / n;
    let ss_tot: f64 = pa.iter().map(|(_, a)| (a - ybar).powi(2)).sum();
    let ss_res: f64 = pa.iter().map(|(p, a)| (a - p).powi(2)).sum();
    let r2 = if ss_tot > 0.0 {
        1.0 - ss_res / ss_tot
    } else {
        0.0
    };
    CvResult {
        r2,
        rmse: (ss_res / n).sqrt(),
        pred_actual: pa,
        n_folds,
    }
}

/// A detector-class observation for cross-validation: an in-distribution feature
/// vector and the realised optimism gap, with string grouping keys. Both the
/// synthetic path ([`GapRow`]) and the real-data path ([`build_real_gap_rows`])
/// reduce to this, so they share the identical CV and permutation machinery.
#[derive(Clone, Debug)]
pub struct GapSample {
    /// Detector name (the leave-one-detector-out grouping key).
    pub detector: String,
    /// Class label (the leave-one-class-out grouping key).
    pub class: String,
    /// In-distribution feature vector.
    pub features: Vec<f64>,
    /// Realised optimism gap.
    pub gap: f64,
}

fn gaprow_to_sample(r: &GapRow) -> GapSample {
    GapSample {
        detector: r.detector.clone(),
        class: r.class.label().to_string(),
        features: r.features.clone(),
        gap: r.gap,
    }
}

/// Leave-one-group-out CV over samples (group by detector or by class): hold out a
/// group, train ridge standardised on the training fold only, predict the held out.
fn loocv_samples(samples: &[GapSample], lambda: f64, by_detector: bool) -> CvResult {
    use std::collections::BTreeSet;
    let key = |s: &GapSample| {
        if by_detector {
            s.detector.clone()
        } else {
            s.class.clone()
        }
    };
    let groups: BTreeSet<String> = samples.iter().map(&key).collect();
    let mut pred_actual = Vec::new();
    for g in &groups {
        let xtr: Vec<Vec<f64>> = samples
            .iter()
            .filter(|s| key(s) != *g)
            .map(|s| s.features.clone())
            .collect();
        let ytr: Vec<f64> = samples
            .iter()
            .filter(|s| key(s) != *g)
            .map(|s| s.gap)
            .collect();
        if xtr.is_empty() {
            continue;
        }
        let (mean, std) = col_stats(&xtr);
        let xz: Vec<Vec<f64>> = xtr.iter().map(|row| zrow(row, &mean, &std)).collect();
        let coeffs = ridge_fit(&xz, &ytr, lambda);
        for s in samples.iter().filter(|s| key(s) == *g) {
            pred_actual.push((
                ridge_predict(&coeffs, &zrow(&s.features, &mean, &std)),
                s.gap,
            ));
        }
    }
    cv_metrics(pred_actual, groups.len())
}

/// Permutation-null p-value over samples: shuffle the gap targets `n_perms` times
/// (seeded) and return the fraction of permuted out-of-fold R² values at or above
/// the observed one, `(#{perm ≥ obs} + 1)/(n_perms + 1)`.
fn permutation_samples(
    samples: &[GapSample],
    lambda: f64,
    by_detector: bool,
    n_perms: usize,
    seed: u64,
) -> f64 {
    use rand::{Rng, SeedableRng};
    use rand_chacha::ChaCha8Rng;
    let observed = loocv_samples(samples, lambda, by_detector).r2;
    let gaps: Vec<f64> = samples.iter().map(|s| s.gap).collect();
    let mut rng = ChaCha8Rng::seed_from_u64(seed);
    let mut ge = 0usize;
    for _ in 0..n_perms.max(1) {
        let mut g = gaps.clone();
        for i in (1..g.len()).rev() {
            g.swap(i, rng.gen_range(0..=i));
        }
        let permuted: Vec<GapSample> = samples
            .iter()
            .zip(g.iter())
            .map(|(s, &gap)| GapSample { gap, ..s.clone() })
            .collect();
        if loocv_samples(&permuted, lambda, by_detector).r2 >= observed {
            ge += 1;
        }
    }
    (ge as f64 + 1.0) / (n_perms.max(1) as f64 + 1.0)
}

/// Leave-one-**detector**-out CV: can ID-only features predict the optimism gap for
/// a detector held out of training entirely? (The cross-detector headline.)
pub fn loocv_by_detector(rows: &[GapRow], lambda: f64) -> CvResult {
    loocv_samples(
        &rows.iter().map(gaprow_to_sample).collect::<Vec<_>>(),
        lambda,
        true,
    )
}

/// Leave-one-**class**-out CV: can ID-only features predict the optimism gap for an
/// impairment class held out of training entirely? (The cross-class headline.)
pub fn loocv_by_class(rows: &[GapRow], lambda: f64) -> CvResult {
    loocv_samples(
        &rows.iter().map(gaprow_to_sample).collect::<Vec<_>>(),
        lambda,
        false,
    )
}

/// Return a copy of `rows` keeping only the feature columns in `keep` (by index).
/// Use it to measure the predictor with a feature **excluded** — e.g. dropping
/// `auc_in` (index 0), which is one additive term of the target gap, so a model
/// leaning on it is partly tautological. If the shape-only predictor still beats
/// predict-the-mean, the predictability is genuine and not a definitional artefact.
pub fn select_features(rows: &[GapRow], keep: &[usize]) -> Vec<GapRow> {
    rows.iter()
        .map(|r| GapRow {
            detector: r.detector.clone(),
            class: r.class,
            seed: r.seed,
            features: keep
                .iter()
                .filter_map(|&k| r.features.get(k).copied())
                .collect(),
            gap: r.gap,
        })
        .collect()
}

/// Whether a leave-one-group-out CV groups by detector or by class.
#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub enum CvAxis {
    /// Leave-one-detector-out.
    Detector,
    /// Leave-one-class-out.
    Class,
}

/// Permutation-null p-value for a leave-one-group-out CV R²: shuffle the gap
/// targets `n_perms` times (seeded), recompute the out-of-fold R² each time, and
/// return the fraction of permuted R²s that meet or exceed the observed R²
/// (`(#{perm ≥ obs} + 1)/(n_perms + 1)`, the unbiased estimator). A small p means
/// the predictor's accuracy is unlikely under no ID→gap relationship.
pub fn permutation_pvalue(
    rows: &[GapRow],
    lambda: f64,
    axis: CvAxis,
    n_perms: usize,
    seed: u64,
) -> f64 {
    let samples: Vec<GapSample> = rows.iter().map(gaprow_to_sample).collect();
    permutation_samples(&samples, lambda, axis == CvAxis::Detector, n_perms, seed)
}

// ── Real-data probe ─────────────────────────────────────────────────────────
//
// The bridge that lets a real labelled dataset run the *identical* H4 pipeline.
// A real detector reduces to one scalar score per observation, so a dataset is a
// flat list of [`ProbeRecord`]s. The five-observable schema need NOT be complete:
// each available observable (e.g. C/N0 drop, AGC excess) is its own "detector",
// scored independently, which matches the ragged feature matrix real public sets
// expose (C/N0 is widely available, AGC only on receiver logs, SQM only from
// tracked IQ, RAIM derivable from pseudoranges).

/// One labelled real-data observation: a scalar `score` from one detector on one
/// case, its impairment `class` (ignored when `is_nominal`), and the `shift_bin`
/// (the severity/condition group; one designated bin is the in-distribution
/// reference).
#[derive(Clone, Debug, serde::Serialize, serde::Deserialize)]
pub struct ProbeRecord {
    /// Detector / observable name (e.g. `"cn0"`, `"agc"`).
    pub detector: String,
    /// Impairment class label (e.g. `"jamming"`); ignored when `is_nominal`.
    pub class: String,
    /// Severity / condition group; the `id_bin` argument names the reference bin.
    pub shift_bin: String,
    /// The detector's scalar score for this observation (higher ⇒ more impaired).
    pub score: f64,
    /// Whether this is a nominal (clean) case — the negative for AUC.
    pub is_nominal: bool,
}

impl ProbeRecord {
    /// Construct a labelled probe record. The `score` must already be oriented so
    /// that **higher means more impaired** (the convention [`auc`] and the feature
    /// extractor assume); the real-data adapters in [`crate::realdata`] apply that
    /// orientation per observable before calling this.
    pub fn new(
        detector: impl Into<String>,
        class: impl Into<String>,
        shift_bin: impl Into<String>,
        score: f64,
        is_nominal: bool,
    ) -> Self {
        Self {
            detector: detector.into(),
            class: class.into(),
            shift_bin: shift_bin.into(),
            score,
            is_nominal,
        }
    }
}

/// Build gap samples from real-data records, one per `(detector, class)`. For each
/// detector the in-distribution per-class AUC is computed in `id_bin` (class
/// positives vs nominal negatives), the realised gap is the ID AUC minus the mean
/// AUC over the shifted bins, and the six ID-only features are extracted on the
/// in-distribution bin. Pairs with no nominal or no class data in a bin are skipped.
pub fn build_real_gap_rows(
    records: &[ProbeRecord],
    id_bin: &str,
    target_pfa: f64,
) -> Vec<GapSample> {
    use std::collections::BTreeSet;
    let detectors: BTreeSet<&str> = records.iter().map(|r| r.detector.as_str()).collect();
    let bins: BTreeSet<&str> = records.iter().map(|r| r.shift_bin.as_str()).collect();
    let classes: BTreeSet<&str> = records
        .iter()
        .filter(|r| !r.is_nominal)
        .map(|r| r.class.as_str())
        .collect();
    let scores = |det: &str, bin: &str, cls: Option<&str>| -> Vec<f64> {
        records
            .iter()
            .filter(|r| {
                r.detector == det
                    && r.shift_bin == bin
                    && match cls {
                        Some(c) => !r.is_nominal && r.class == c,
                        None => r.is_nominal,
                    }
            })
            .map(|r| r.score)
            .collect()
    };
    let mut out = Vec::new();
    for det in &detectors {
        let neg_in = scores(det, id_bin, None);
        if neg_in.is_empty() {
            continue;
        }
        for cls in &classes {
            let pos_in = scores(det, id_bin, Some(cls));
            if pos_in.is_empty() {
                continue;
            }
            let auc_in = auc(&pos_in, &neg_in);
            let shifted: Vec<f64> = bins
                .iter()
                .filter(|b| **b != id_bin)
                .filter_map(|b| {
                    let neg_b = scores(det, b, None);
                    let pos_b = scores(det, b, Some(cls));
                    if neg_b.is_empty() || pos_b.is_empty() {
                        None
                    } else {
                        Some(auc(&pos_b, &neg_b))
                    }
                })
                .collect();
            if shifted.is_empty() {
                continue;
            }
            let mean_shifted = shifted.iter().sum::<f64>() / shifted.len() as f64;
            out.push(GapSample {
                detector: det.to_string(),
                class: cls.to_string(),
                features: id_features_from_scores(&pos_in, &neg_in, target_pfa).to_vec(),
                gap: auc_in - mean_shifted,
            });
        }
    }
    out
}

/// Leave-one-out CV for real-data gap samples (cross-detector or cross-class) — the
/// same out-of-fold ridge as the synthetic path, against predict-the-mean.
pub fn real_loocv(samples: &[GapSample], lambda: f64, axis: CvAxis) -> CvResult {
    loocv_samples(samples, lambda, axis == CvAxis::Detector)
}

/// Permutation-null p-value for the real-data leave-one-out CV R².
pub fn real_permutation_pvalue(
    samples: &[GapSample],
    lambda: f64,
    axis: CvAxis,
    n_perms: usize,
    seed: u64,
) -> f64 {
    permutation_samples(samples, lambda, axis == CvAxis::Detector, n_perms, seed)
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

    fn small_grid_config() -> GridConfig {
        GridConfig {
            n_per_class: 120,
            frac_train: 0.7,
            severities: vec![0.3, 0.6, 0.9],
            seeds: vec![1, 2, 3],
            target_pfa: 0.05,
            bootstrap_resamples: 500,
            bootstrap_alpha: 0.05,
            logreg_epochs: 300,
            logreg_lr: 0.3,
            mlp_hidden_sizes: vec![4, 8],
            mlp_epochs: 500,
            mlp_lr: 0.1,
        }
    }

    /// Detector roster size for a config: 5 physics + logreg + one MLP per hidden
    /// capacity + 3 single-feature learned controls.
    fn roster_size(cfg: &GridConfig) -> usize {
        5 + 1 + cfg.mlp_hidden_sizes.len() + 3
    }

    #[test]
    fn run_grid_has_shape_brackets_mean_and_shows_trend() {
        let cfg = small_grid_config();
        let res = run_grid(&cfg);
        let n_det = res.detectors.len();
        let n_class = ImpairmentClass::impaired().len();
        let n_sev = cfg.severities.len();
        // Right shape: one cell per (detector, class, severity); one trend per (d, c).
        assert_eq!(res.cells.len(), n_det * n_class * n_sev, "cell count");
        assert_eq!(res.trends.len(), n_det * n_class, "trend count");
        assert_eq!(
            n_det,
            roster_size(&cfg),
            "physics + learned + control roster"
        );
        for cell in &res.cells {
            assert_eq!(cell.gaps.len(), cfg.seeds.len(), "one gap per seed");
            assert!(cell.gaps.iter().all(|g| g.is_finite()), "no NaN gaps");
            // The bootstrap CI brackets the cell mean.
            assert!(
                cell.boot_lo <= cell.mean_gap + 1e-9 && cell.mean_gap <= cell.boot_hi + 1e-9,
                "cell CI [{}, {}] must bracket mean {}",
                cell.boot_lo,
                cell.boot_hi,
                cell.mean_gap
            );
            assert!(cell.seed_se >= 0.0, "across-seed SE is non-negative");
        }
        // A learned detector exhibits the scaling law: subtler OOD ⇒ bigger gap ⇒
        // positive Spearman ρ on (1 − s, Δ) for at least one class.
        assert!(
            res.trends
                .iter()
                .any(|t| t.detector.starts_with("mlp") && t.spearman_rho > 0.0),
            "an MLP should show a positive optimism-vs-severity trend on some class"
        );
    }

    fn predictor_config() -> PredictorConfig {
        PredictorConfig {
            grid: small_grid_config(),
            include_self_slope: true,
            probe_scales: vec![0.8, 0.9, 1.0],
            ridge_lambda: 0.1,
        }
    }

    #[test]
    fn id_features_are_finite_and_sized() {
        let corpus = generate_corpus(
            &CorpusConfig {
                n_per_class: 150,
                ..Default::default()
            },
            4,
        );
        let f = id_features(
            &crate::impairment_eval::FusedDetector,
            &corpus,
            ImpairmentClass::Jamming,
            0.05,
        );
        assert_eq!(f.len(), 6);
        assert!(f.iter().all(|v| v.is_finite()), "features {f:?}");
        // The fused statistic separates jamming from nominal, so AUC_in is high.
        assert!(f[0] > 0.8, "auc_in feature {} should be high", f[0]);
    }

    #[test]
    fn gap_predictor_beats_mean_across_held_out_detectors_and_classes() {
        let pc = predictor_config();
        let rows = build_gap_rows(&pc);
        let n_det = roster_size(&pc.grid);
        let expected = n_det * ImpairmentClass::impaired().len() * pc.grid.seeds.len();
        assert_eq!(rows.len(), expected, "one row per (detector, class, seed)");
        assert!(
            rows.iter()
                .all(|r| r.features.len() == 7 && r.gap.is_finite()),
            "6 ID features + self-slope, finite gaps"
        );

        // HEADLINE: ID-only diagnostics predict the OOD optimism gap for a detector
        // — and for an impairment class — held entirely out of training.
        let by_det = loocv_by_detector(&rows, pc.ridge_lambda);
        let by_class = loocv_by_class(&rows, pc.ridge_lambda);
        assert!(
            by_det.r2 > 0.0,
            "LOO-by-detector R² {} must beat predict-the-mean",
            by_det.r2
        );
        assert!(
            by_class.r2 > 0.0,
            "LOO-by-class R² {} must beat predict-the-mean",
            by_class.r2
        );
        assert_eq!(by_det.n_folds, n_det);
        assert_eq!(by_class.n_folds, ImpairmentClass::impaired().len());

        // Deterministic end to end.
        let rows2 = build_gap_rows(&pc);
        let by_det2 = loocv_by_detector(&rows2, pc.ridge_lambda);
        assert_eq!(
            by_det.r2.to_bits(),
            by_det2.r2.to_bits(),
            "predictor pipeline must be reproducible"
        );

        // The full-data fit predicts a finite gap for a held example.
        let predictor = fit_gap_predictor(&rows, pc.ridge_lambda);
        assert!(predictor.predict(&rows[0].features).is_finite());
    }

    #[test]
    fn shape_only_features_and_permutation_null_behave() {
        let pc = predictor_config();
        let rows = build_gap_rows(&pc);
        // Drop auc_in (index 0) — it is one additive term of the target gap, so the
        // shape-only set isolates non-tautological predictability.
        let shape = select_features(&rows, &[1, 2, 3, 4, 5, 6]);
        assert_eq!(shape[0].features.len(), rows[0].features.len() - 1);
        // Subset CV runs, is finite, and is deterministic.
        let r2a = loocv_by_class(&shape, pc.ridge_lambda).r2;
        let r2b = loocv_by_class(
            &select_features(&rows, &[1, 2, 3, 4, 5, 6]),
            pc.ridge_lambda,
        )
        .r2;
        assert!(r2a.is_finite() && r2a.to_bits() == r2b.to_bits());
        // Permutation null: a valid probability, deterministic, and the real
        // cross-class signal beats most label permutations.
        let p = permutation_pvalue(&rows, pc.ridge_lambda, CvAxis::Class, 100, 7);
        let p2 = permutation_pvalue(&rows, pc.ridge_lambda, CvAxis::Class, 100, 7);
        assert_eq!(
            p.to_bits(),
            p2.to_bits(),
            "permutation p must be reproducible"
        );
        assert!(
            (1.0 / 101.0..=1.0).contains(&p),
            "p {p} must be a probability"
        );
        assert!(
            p < 0.5,
            "real cross-class R² should beat most permutations (p={p})"
        );
    }

    #[test]
    fn real_data_probe_ingests_records_and_runs_the_pipeline() {
        // Export the synthetic corpus to ProbeRecords (each detector's score per
        // case across an ID bin and two shifted bins), then run the real-data
        // ingest. This proves the ingest reproduces the H4 pipeline on the engine.
        let id_corpus = generate_corpus(
            &CorpusConfig {
                n_per_class: 200,
                ..Default::default()
            },
            7,
        );
        let probe_dets: Vec<(&str, Box<dyn ImpairmentDetector>)> = vec![
            ("energy", Box::new(EnergyDetector)),
            ("agc", Box::new(AgcDetector)),
            ("sqm", Box::new(SqmDetector)),
            ("parity", Box::new(ParityDetector)),
            ("fused", Box::new(FusedDetector)),
            (
                "logreg",
                Box::new(LogisticRegression::fit(&id_corpus, 400, 0.3)),
            ),
            ("mlp", Box::new(Mlp::fit(&id_corpus, 16, 800, 0.1, 1))),
        ];
        let bins = [(1.0_f64, "id"), (0.6, "s060"), (0.3, "s030")];
        let mut records = Vec::new();
        for (s, bin) in bins {
            let corpus = generate_corpus(
                &CorpusConfig {
                    n_per_class: 200,
                    severity_scale: s,
                    ..Default::default()
                },
                7,
            );
            for (name, d) in &probe_dets {
                for case in &corpus {
                    records.push(ProbeRecord {
                        detector: name.to_string(),
                        class: case.class.label().to_string(),
                        shift_bin: bin.to_string(),
                        score: d.score(&case.obs),
                        is_nominal: !case.is_impaired(),
                    });
                }
            }
        }
        let samples = build_real_gap_rows(&records, "id", 0.05);
        assert_eq!(
            samples.len(),
            7 * 4,
            "one sample per (detector, impaired class)"
        );
        assert!(samples
            .iter()
            .all(|s| s.features.len() == 6 && s.gap.is_finite()));
        // The optimism gap is real and correctly signed (shifted AUC ≤ ID AUC on average).
        let mean_gap = samples.iter().map(|s| s.gap).sum::<f64>() / samples.len() as f64;
        assert!(
            mean_gap > 0.0,
            "mean real-ingest gap {mean_gap} should be positive"
        );
        // The same out-of-fold CV runs, has the right fold count, and is deterministic.
        let by_class = real_loocv(&samples, 0.1, CvAxis::Class);
        assert!(by_class.r2.is_finite() && by_class.n_folds == 4);
        let again = real_loocv(
            &build_real_gap_rows(&records, "id", 0.05),
            0.1,
            CvAxis::Class,
        );
        assert_eq!(
            by_class.r2.to_bits(),
            again.r2.to_bits(),
            "ingest pipeline must be reproducible"
        );
        let p = real_permutation_pvalue(&samples, 0.1, CvAxis::Class, 200, 7);
        assert!(
            (1.0 / 201.0..=1.0).contains(&p),
            "permutation p {p} must be a probability"
        );
    }
}
