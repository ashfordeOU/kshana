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

use crate::eval_stats::{bootstrap_ci, ridge_fit, spearman};
use crate::impairment_eval::{
    auc, generate_corpus, stratified_split, AgcDetector, CorpusConfig, EnergyDetector,
    FusedDetector, ImpairmentClass, ImpairmentDetector, LabeledCase, ParityDetector, SqmDetector,
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
    /// MLP hidden-unit count.
    pub mlp_hidden: usize,
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
/// (stateless) plus the two learned detectors trained on `train`.
fn detectors_for_seed(
    train: &[LabeledCase],
    cfg: &GridConfig,
    seed: u64,
) -> Vec<(String, Box<dyn ImpairmentDetector>)> {
    vec![
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
        (
            "mlp".to_string(),
            Box::new(Mlp::fit(
                train,
                cfg.mlp_hidden,
                cfg.mlp_epochs,
                cfg.mlp_lr,
                seed,
            )),
        ),
    ]
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
            trends.push(Trend {
                detector: name.clone(),
                class,
                spearman_rho: rho,
                spearman_p: p,
                slope,
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
            mlp_hidden: 8,
            mlp_epochs: 500,
            mlp_lr: 0.1,
        }
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
        assert!(n_det >= 7, "expected the 5 physics + 2 learned detectors");
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
                .any(|t| t.detector == "mlp" && t.spearman_rho > 0.0),
            "MLP should show a positive optimism-vs-severity trend on some class"
        );
    }
}
