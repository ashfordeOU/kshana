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
    build_gap_rows, fit_gap_predictor, loocv_by_class, loocv_by_detector, run_grid, CvResult,
    GridConfig, PredictorConfig, ID_FEATURE_NAMES,
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
        mlp_hidden: 16,
        mlp_epochs: 1200,
        mlp_lr: 0.1,
    }
}

fn config_hash(g: &GridConfig, pc: &PredictorConfig) -> String {
    let canon = format!(
        "n={} ft={} sev={:?} seeds={:?} pfa={} boot={}/{} lr_ep={} lr={} mlp={}x{}@{} \
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
        g.mlp_hidden,
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
    let learned = ["logreg", "mlp"];
    let physics_mean = mean(&PHYSICS.iter().map(|d| det_mean_gap(d)).collect::<Vec<_>>());
    let learned_mean = mean(&learned.iter().map(|d| det_mean_gap(d)).collect::<Vec<_>>());

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

    let feature_names: Vec<&str> = {
        let mut v: Vec<&str> = ID_FEATURE_NAMES.to_vec();
        if pc.include_self_slope {
            v.push("self_perturbation_slope");
        }
        v
    };

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
                "mlp": { "hidden": grid.mlp_hidden, "epochs": grid.mlp_epochs, "lr": grid.mlp_lr },
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
            "per_detector_mean_gap": g.detectors.iter()
                .map(|d| json!({ "detector": d, "mean_gap": det_mean_gap(d) }))
                .collect::<Vec<_>>(),
            "note": "Mean optimism gap pooled over classes and severities. A larger learned \
                     gap is the over-fitting-to-tuning-regime signature this study isolates.",
        },
        "gap_predictor": {
            "feature_names": feature_names,
            "coeffs_standardized": predictor.coeffs,
            "cv_leave_one_detector_out": cv_json(&by_det),
            "cv_leave_one_class_out": cv_json(&by_class),
            "ablation_no_self_slope": {
                "feature_names": ID_FEATURE_NAMES,
                "cv_leave_one_detector_out": cv_json(&by_det_ablate),
                "cv_leave_one_class_out": cv_json(&by_class_ablate),
                "note": "Self-perturbation slope removed. Compare R² to the headline to gauge \
                         how much of the predictability is carried by the ablatable feature.",
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
        "optimism-study | {} cells, {} trends, {} predictor rows | LOO-det R² {:.3} / LOO-class R² {:.3} \
         (ablation {:.3} / {:.3}) | learned gap {:.3} vs physics {:.3} | MODELLED synthetic → {}",
        g.cells.len(),
        g.trends.len(),
        n_rows,
        by_det.r2,
        by_class.r2,
        by_det_ablate.r2,
        by_class_ablate.r2,
        learned_mean,
        physics_mean,
        out,
    );
}
