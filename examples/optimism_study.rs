// SPDX-License-Identifier: AGPL-3.0-only
//! One-command results artifact for the RF-impairment **optimism-gap** study.
//!
//! Runs the full experiment grid and the ID-only gap predictor, then writes a
//! versioned, self-describing JSON artifact (every aggregate, the scaling-law
//! slopes with Spearman ρ/p, the learned-vs-physics gaps with CIs, the predictor's
//! cross-detector and cross-class CV with scatter, the self-slope ablation, and
//! full provenance) to the path argument.
//!
//! ```text
//! cargo run --release --example optimism_study -- paper-artifacts/optimism-study.json
//! ```
//!
//! MODELLED — synthetic, parameter-grounded corpus (never field/IQ). Every number
//! is an AUC over model-derived labels on synthetic data; the optimism gap is a
//! synthetic→synthetic shift, not a sim-to-field claim.

use kshana::impairment_eval::ImpairmentClass;
use kshana::impairment_study::{
    build_gap_rows, fit_gap_predictor, loocv_by_class, loocv_by_detector, permutation_pvalue,
    run_grid, select_features, CvAxis, CvResult, GridConfig, PredictorConfig, ID_FEATURE_NAMES,
};
use serde_json::{json, Value};
use sha2::{Digest, Sha256};
use std::path::Path;

const SCHEMA_VERSION: &str = "optimism-study/1";
const PHYSICS: [&str; 5] = [
    "energy(cn0-drop)",
    "agc-excess",
    "sqm-imbalance",
    "raim-parity",
    "fused(max-z)",
];

fn paper_grid() -> GridConfig {
    GridConfig {
        n_per_class: 400,
        frac_train: 0.7,
        severities: vec![0.2, 0.4, 0.6, 0.8],
        seeds: vec![1, 2, 3, 4, 5],
        target_pfa: 0.05,
        bootstrap_resamples: 2000,
        bootstrap_alpha: 0.05,
        logreg_epochs: 500,
        logreg_lr: 0.3,
        mlp_hidden_sizes: vec![4, 8, 16, 32],
        mlp_epochs: 1200,
        mlp_lr: 0.1,
    }
}

fn config_hash(g: &GridConfig, pc: &PredictorConfig) -> String {
    let canon = format!(
        "n={} ft={} sev={:?} seeds={:?} pfa={} boot={}/{} lr_ep={} lr={} mlp={:?}x{}@{} \
         self={} probes={:?} lambda={}",
        g.n_per_class,
        g.frac_train,
        g.severities,
        g.seeds,
        g.target_pfa,
        g.bootstrap_resamples,
        g.bootstrap_alpha,
        g.logreg_epochs,
        g.logreg_lr,
        g.mlp_hidden_sizes,
        g.mlp_epochs,
        g.mlp_lr,
        pc.include_self_slope,
        pc.probe_scales,
        pc.ridge_lambda,
    );
    let mut h = Sha256::new();
    h.update(canon.as_bytes());
    hex::encode(h.finalize())
}

fn cv_json(cv: &CvResult) -> Value {
    json!({
        "r2": cv.r2,
        "rmse": cv.rmse,
        "n_folds": cv.n_folds,
        "n_points": cv.pred_actual.len(),
        "scatter": cv.pred_actual.iter()
            .map(|(p, a)| json!({ "predicted": p, "actual": a }))
            .collect::<Vec<_>>(),
    })
}

fn mean(v: &[f64]) -> f64 {
    if v.is_empty() {
        f64::NAN
    } else {
        v.iter().sum::<f64>() / v.len() as f64
    }
}

/// Feature names for the shape-only (auc_in-dropped) predictor.
fn feature_names_shape(include_self_slope: bool) -> Vec<&'static str> {
    let mut v: Vec<&'static str> = ID_FEATURE_NAMES[1..].to_vec();
    if include_self_slope {
        v.push("self_perturbation_slope");
    }
    v
}

fn main() {
    let out = std::env::args()
        .nth(1)
        .unwrap_or_else(|| "paper-artifacts/optimism-study.json".to_string());

    let grid = paper_grid();
    let pc = PredictorConfig {
        grid: grid.clone(),
        include_self_slope: true,
        probe_scales: vec![0.8, 0.9, 1.0],
        ridge_lambda: 0.1,
    };

    eprintln!("running grid ({} seeds)…", grid.seeds.len());
    let g = run_grid(&grid);

    // Cells and scaling-law trends.
    let cells: Vec<Value> = g
        .cells
        .iter()
        .map(|c| {
            json!({
                "detector": c.detector,
                "class": c.class.label(),
                "severity": c.severity,
                "mean_gap": c.mean_gap,
                "boot_ci": [c.boot_lo, c.boot_hi],
                "seed_se": c.seed_se,
                "per_seed_gaps": c.gaps,
            })
        })
        .collect();
    let trends: Vec<Value> = g
        .trends
        .iter()
        .map(|t| {
            json!({
                "detector": t.detector,
                "class": t.class.label(),
                "spearman_rho": t.spearman_rho,
                "spearman_p": t.spearman_p,
                "scaling_slope": t.slope,
                "id_auc_mean": t.id_auc_mean,
            })
        })
        .collect();

    // Learned-vs-physics summary: mean gap pooled over classes & severities.
    let det_mean_gap = |name: &str| -> f64 {
        let gaps: Vec<f64> = g
            .cells
            .iter()
            .filter(|c| c.detector == name)
            .map(|c| c.mean_gap)
            .collect();
        mean(&gaps)
    };
    // Three families: physics baselines, full-feature learned (logreg + MLPs), and
    // single-feature learned controls (logreg-<obs>) — the H2 evidence-breadth control.
    let is_physics = |d: &str| PHYSICS.contains(&d);
    let is_single = |d: &str| d.starts_with("logreg-");
    let group_mean = |pred: &dyn Fn(&str) -> bool| -> f64 {
        mean(
            &g.detectors
                .iter()
                .filter(|d| pred(d))
                .map(|d| det_mean_gap(d))
                .collect::<Vec<_>>(),
        )
    };
    let physics_mean = group_mean(&|d: &str| is_physics(d));
    let learned_single_mean = group_mean(&|d: &str| is_single(d));
    let learned_mean = group_mean(&|d: &str| !is_physics(d) && !is_single(d));
    // Matched-dimensionality pairs: single-observable physics vs single-feature learned.
    let matched_pairs: Vec<Value> = [
        ("energy(cn0-drop)", "logreg-cn0"),
        ("agc-excess", "logreg-agc"),
        ("raim-parity", "logreg-parity"),
    ]
    .iter()
    .map(|(phys, learn)| {
        json!({
            "observable_pair": [phys, learn],
            "physics_mean_gap": det_mean_gap(phys),
            "learned_mean_gap": det_mean_gap(learn),
        })
    })
    .collect();

    // Predictor: full grid + cross-detector / cross-class CV, with the ablation.
    eprintln!("building gap-predictor rows (with self-slope)…");
    let rows = build_gap_rows(&pc);
    let by_det = loocv_by_detector(&rows, pc.ridge_lambda);
    let by_class = loocv_by_class(&rows, pc.ridge_lambda);
    let predictor = fit_gap_predictor(&rows, pc.ridge_lambda);

    eprintln!("building ablation rows (no self-slope)…");
    let pc_ablate = PredictorConfig {
        include_self_slope: false,
        ..pc.clone()
    };
    let rows_ablate = build_gap_rows(&pc_ablate);
    let by_det_ablate = loocv_by_detector(&rows_ablate, pc.ridge_lambda);
    let by_class_ablate = loocv_by_class(&rows_ablate, pc.ridge_lambda);

    // The honest "shape-only" predictor: drop auc_in (feature index 0), which is one
    // additive term of the target gap, so its predictive value is partly tautological.
    // If the shape features alone still beat predict-the-mean, the predictability is real.
    let n_feat = rows[0].features.len();
    let shape_keep: Vec<usize> = (1..n_feat).collect();
    let rows_shape = select_features(&rows, &shape_keep);
    let by_det_shape = loocv_by_detector(&rows_shape, pc.ridge_lambda);
    let by_class_shape = loocv_by_class(&rows_shape, pc.ridge_lambda);

    // Permutation-null p-values for the headline R²s (full feature set).
    eprintln!("running permutation nulls…");
    let n_perms = 2000;
    let p_det = permutation_pvalue(&rows, pc.ridge_lambda, CvAxis::Detector, n_perms, 20260619);
    let p_class = permutation_pvalue(&rows, pc.ridge_lambda, CvAxis::Class, n_perms, 20260619);

    // Coefficients labelled with the leading intercept so a reader cannot mis-zip them.
    let mut coeff_labels: Vec<&str> = vec!["intercept"];
    coeff_labels.extend(ID_FEATURE_NAMES.iter().copied());
    if pc.include_self_slope {
        coeff_labels.push("self_perturbation_slope");
    }
    let coeffs_labeled: Vec<Value> = coeff_labels
        .iter()
        .zip(predictor.coeffs.iter())
        .map(|(name, &v)| json!({ "name": name, "value": v }))
        .collect();

    let feature_names: Vec<&str> = coeff_labels[1..].to_vec();

    let value = json!({
        "schema_version": SCHEMA_VERSION,
        "label": "MODELLED — synthetic parameter-grounded corpus (never field/IQ); AUC over \
                  model-derived labels; operating characteristics only, no good/bad verdict",
        "caveat": "The optimism gap is a synthetic→synthetic distribution shift (a lower \
                   severity scale within the same generative model), NOT a sim-to-field claim. \
                   Results demonstrate the phenomenon and the predictor's signal on synthetic \
                   data; they do not assert field-detection performance.",
        "provenance": {
            "engine": "kshana",
            "engine_version": env!("CARGO_PKG_VERSION"),
            "config_hash": config_hash(&grid, &pc),
            "seeds": grid.seeds,
            "grid": {
                "n_per_class": grid.n_per_class,
                "frac_train": grid.frac_train,
                "severities": grid.severities,
                "target_pfa": grid.target_pfa,
                "bootstrap_resamples": grid.bootstrap_resamples,
                "bootstrap_alpha": grid.bootstrap_alpha,
                "logreg": { "epochs": grid.logreg_epochs, "lr": grid.logreg_lr },
                "mlp": { "hidden_sizes": grid.mlp_hidden_sizes, "epochs": grid.mlp_epochs, "lr": grid.mlp_lr },
            },
            "predictor": {
                "include_self_slope": pc.include_self_slope,
                "probe_scales": pc.probe_scales,
                "ridge_lambda": pc.ridge_lambda,
            },
        },
        "detectors": g.detectors,
        "classes": ImpairmentClass::impaired().iter().map(|c| c.label()).collect::<Vec<_>>(),
        "cells": cells,
        "scaling_law_trends": trends,
        "learned_vs_physics": {
            "physics_mean_gap": physics_mean,
            "learned_mean_gap": learned_mean,
            "learned_single_feature_mean_gap": learned_single_mean,
            "matched_dimensionality_pairs": matched_pairs,
            "per_detector_mean_gap": g.detectors.iter()
                .map(|d| json!({ "detector": d, "mean_gap": det_mean_gap(d) }))
                .collect::<Vec<_>>(),
            "note": "Mean optimism gap pooled over classes and severities, by family. \
                     learned = full-feature (logreg + MLPs); learned_single_feature = \
                     logreg on one observable. matched_dimensionality_pairs compare a \
                     single-observable physics baseline against a single-feature learned \
                     detector reading the same observable — the H2 evidence-breadth control: \
                     similar gaps within a pair ⇒ the gap is about evidence breadth, not learning.",
        },
        "gap_predictor": {
            "feature_names": feature_names,
            "coeffs_standardized_with_intercept": coeffs_labeled,
            "cv_leave_one_detector_out": cv_json(&by_det),
            "cv_leave_one_class_out": cv_json(&by_class),
            "permutation_null": {
                "n_permutations": n_perms,
                "p_leave_one_detector_out": p_det,
                "p_leave_one_class_out": p_class,
                "note": "Fraction of label-permuted runs whose out-of-fold R² ≥ the observed R² \
                         ((#≥obs + 1)/(n+1)). Small p ⇒ the predictability is unlikely under no \
                         ID→gap relationship.",
            },
            "ablation_no_auc_in": {
                "feature_names": feature_names_shape(pc.include_self_slope),
                "cv_leave_one_detector_out": cv_json(&by_det_shape),
                "cv_leave_one_class_out": cv_json(&by_class_shape),
                "note": "auc_in removed. Because the target gap = auc_in − mean_OOD, auc_in is one \
                         additive term of the target; this shape-only predictor shows the \
                         NON-tautological predictability from score-distribution shape alone.",
            },
            "ablation_no_self_slope": {
                "feature_names": ID_FEATURE_NAMES,
                "cv_leave_one_detector_out": cv_json(&by_det_ablate),
                "cv_leave_one_class_out": cv_json(&by_class_ablate),
                "note": "Self-perturbation slope removed (the only generator-touching feature). \
                         Compare R² to the headline to gauge how much it carries.",
            },
        },
    });

    if let Some(parent) = Path::new(&out).parent() {
        if !parent.as_os_str().is_empty() {
            std::fs::create_dir_all(parent).expect("create artifact directory");
        }
    }
    let pretty = serde_json::to_string_pretty(&value).expect("serialize artifact");
    std::fs::write(&out, &pretty).expect("write artifact");

    let n_rows: usize = rows.len();
    println!(
        "optimism-study | {} cells, {} trends, {} rows | LOO-det R² {:.3} (p={:.4}) / LOO-class R² {:.3} (p={:.4}) \
         | shape-only (no auc_in) {:.3} / {:.3} | no-self-slope {:.3} / {:.3} | learned gap {:.3} vs physics {:.3} \
         | MODELLED synthetic → {}",
        g.cells.len(),
        g.trends.len(),
        n_rows,
        by_det.r2,
        p_det,
        by_class.r2,
        p_class,
        by_det_shape.r2,
        by_class_shape.r2,
        by_det_ablate.r2,
        by_class_ablate.r2,
        learned_mean,
        physics_mean,
        out,
    );
}
