// SPDX-License-Identifier: AGPL-3.0-only
//! Real-data optimism-gap probe: run the H4 pipeline on a real labelled dataset.
//!
//! Input is a JSON array of records, one scalar detector score per labelled
//! observation:
//! ```json
//! [{"detector":"cn0","class":"jamming","shift_bin":"jsr20","score":7.3,"is_nominal":false},
//!  {"detector":"cn0","class":"nominal","shift_bin":"id","score":0.2,"is_nominal":true}, ...]
//! ```
//! One `shift_bin` is the in-distribution reference (the `id_bin` argument). Each
//! `detector` is one available observable, so the five-observable schema need not
//! be complete: real public sets expose a ragged matrix (C/N0 widely, AGC only on
//! receiver logs, SQM only from tracked IQ, RAIM derivable from pseudoranges) and
//! this scores each available observable independently.
//!
//! ```text
//! cargo run --release --example real_data_probe -- records.json id paper-artifacts/real-probe.json
//! ```
//! Output is the same self-describing JSON shape as the synthetic study: per-sample
//! gaps, leave-one-detector-out and leave-one-class-out CV (R^2/RMSE + scatter), and
//! permutation-null p-values. Results are over REAL labelled data, not synthetic.

use kshana::impairment_study::{
    build_real_gap_rows, real_loocv, real_permutation_pvalue, CvAxis, CvResult, ProbeRecord,
};
use serde_json::{json, Value};
use std::path::Path;

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

fn main() {
    let mut args = std::env::args().skip(1);
    let input = args.next().unwrap_or_else(|| {
        eprintln!("usage: real_data_probe <records.json> [id_bin] [out.json]");
        std::process::exit(2);
    });
    let id_bin = args.next().unwrap_or_else(|| "id".to_string());
    let out = args
        .next()
        .unwrap_or_else(|| "paper-artifacts/real-probe.json".to_string());
    let lambda = 0.1;

    let text = std::fs::read_to_string(&input).expect("read records file");
    let records: Vec<ProbeRecord> = serde_json::from_str(&text).expect("parse JSON records");
    eprintln!("loaded {} records from {input}", records.len());

    let samples = build_real_gap_rows(&records, &id_bin, 0.05);
    if samples.is_empty() {
        eprintln!(
            "no gap samples built — check that id_bin '{id_bin}' and other bins both \
             carry nominal and class records for at least one detector"
        );
        std::process::exit(1);
    }

    let by_det = real_loocv(&samples, lambda, CvAxis::Detector);
    let by_class = real_loocv(&samples, lambda, CvAxis::Class);
    let p_det = real_permutation_pvalue(&samples, lambda, CvAxis::Detector, 2000, 20260619);
    let p_class = real_permutation_pvalue(&samples, lambda, CvAxis::Class, 2000, 20260619);

    let detectors: Vec<&String> = {
        let mut v: Vec<&String> = samples.iter().map(|s| &s.detector).collect();
        v.sort();
        v.dedup();
        v
    };
    let classes: Vec<&String> = {
        let mut v: Vec<&String> = samples.iter().map(|s| &s.class).collect();
        v.sort();
        v.dedup();
        v
    };

    let value = json!({
        "schema_version": "real-optimism-probe/1",
        "label": "REAL labelled data (not synthetic). Each detector is one available \
                  observable; the five-observable schema may be ragged across the source.",
        "provenance": {
            "engine": "kshana",
            "engine_version": env!("CARGO_PKG_VERSION"),
            "input": input,
            "id_bin": id_bin,
            "ridge_lambda": lambda,
            "n_records": records.len(),
        },
        "detectors": detectors,
        "classes": classes,
        "samples": samples.iter().map(|s| json!({
            "detector": s.detector,
            "class": s.class,
            "gap": s.gap,
            "features": s.features,
        })).collect::<Vec<_>>(),
        "gap_predictor": {
            "feature_names": ["auc_in","dprime","overlap","var_ratio","tail_margin","pd_at_pfa"],
            "cv_leave_one_detector_out": cv_json(&by_det),
            "cv_leave_one_class_out": cv_json(&by_class),
            "permutation_null": {
                "n_permutations": 2000,
                "p_leave_one_detector_out": p_det,
                "p_leave_one_class_out": p_class,
            },
        },
    });

    if let Some(parent) = Path::new(&out).parent() {
        if !parent.as_os_str().is_empty() {
            std::fs::create_dir_all(parent).expect("create output directory");
        }
    }
    std::fs::write(
        &out,
        serde_json::to_string_pretty(&value).expect("serialize"),
    )
    .expect("write");

    println!(
        "real-optimism-probe | {} records -> {} samples ({} detectors, {} classes) | \
         LOO-det R2 {:.3} (p={:.4}) / LOO-class R2 {:.3} (p={:.4}) | REAL data -> {}",
        records.len(),
        samples.len(),
        detectors.len(),
        classes.len(),
        by_det.r2,
        p_det,
        by_class.r2,
        p_class,
        out,
    );
}
