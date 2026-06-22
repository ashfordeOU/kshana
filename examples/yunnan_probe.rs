// SPDX-License-Identifier: AGPL-3.0-only
//! Real-data optimism-gap probe on the Yunnan University GNSS attack dataset.
//!
//! This runs the H4 pipeline on genuine receiver data. It reads Yunnan processed
//! `observation<HH>.json` files with the [`yunnan`] adapter, labels every C/N0 sample
//! clean/spoofing/jamming by `recordTime` against the dataset's documented attack
//! windows, groups each constellation+band into its own detector, and computes the
//! in-distribution-vs-shifted optimism gap with leave-one-out cross-validation and a
//! permutation null, exactly as the synthetic study does.
//!
//! Severity is a documented proxy, not graded power (the Data in Brief article gives
//! attack times and targets but no per-attack power): spoofing splits into an early
//! window and a later, multi-transmitter window; jamming splits into early and late
//! bursts. The clean negatives are the receiver's own inter-attack and pre-attack
//! seconds, so the comparison is like-for-like (same receiver, site, day).
//!
//! ```text
//! cargo run --release --example yunnan_probe -- \
//!     windows.json out.json observation12.json observation16.json observation17.json
//! ```

use kshana::impairment_study::{
    build_real_gap_rows, real_loocv, real_permutation_pvalue, CvAxis, CvResult, GapSample,
    ProbeRecord,
};
use kshana::realdata::{yunnan, Observation, Orient};
use serde::Deserialize;
use serde_json::{json, Value};
use std::path::Path;

/// Spoofing severity split: seconds at or after this are "late" spoofing (the
/// multi-transmitter phase the article describes).
const SPOOF_LATE_FROM: &str = "2023-12-21 15:00:00";
/// Start of the jamming campaign (spoofing ends 16:50, jamming 16:51 on).
const JAM_FROM: &str = "2023-12-21 16:51:00";
/// Jamming severity split: bursts at or after this are "late" jamming.
const JAM_LATE_FROM: &str = "2023-12-21 17:08:00";

#[derive(Deserialize)]
struct Window {
    class: String,
    start: String,
    end: String,
}

fn die(msg: String) -> ! {
    eprintln!("{msg}");
    std::process::exit(1);
}

/// The shift bin for a sample, by time only, so clean and attack seconds in the same
/// period share a bin (the negatives the AUC needs).
fn bin_for(time: &str) -> &'static str {
    if time >= JAM_FROM {
        if time >= JAM_LATE_FROM {
            "jam_late"
        } else {
            "jam_early"
        }
    } else if time >= SPOOF_LATE_FROM {
        "spoof_late"
    } else {
        "spoof_early"
    }
}

/// The class of the window covering `time` ("clean"/"spoofing"/"jamming"), or "clean"
/// when no window covers it (the pre/post-attack quiet the article calls clean).
fn class_at<'a>(windows: &'a [Window], time: &str) -> &'a str {
    for w in windows {
        if time >= w.start.as_str() && time <= w.end.as_str() {
            return &w.class;
        }
    }
    "clean"
}

fn cv_json(cv: &CvResult) -> Value {
    json!({
        "r2": cv.r2,
        "rmse": cv.rmse,
        "n_folds": cv.n_folds,
        "n_points": cv.pred_actual.len(),
        "scatter": cv.pred_actual.iter().map(|(p, a)| json!({"predicted": p, "actual": a})).collect::<Vec<_>>(),
    })
}

fn sample_json(s: &GapSample) -> Value {
    json!({"detector": s.detector, "class": s.class, "gap": s.gap, "features": s.features})
}

fn main() {
    let mut args = std::env::args().skip(1);
    let windows_path = args.next().unwrap_or_else(|| {
        die("usage: yunnan_probe <windows.json> <out.json> <observation*.json>...".into())
    });
    let out = args
        .next()
        .unwrap_or_else(|| die("missing out.json argument".into()));
    let obs_paths: Vec<String> = args.collect();
    if obs_paths.is_empty() {
        die("provide at least one observation<HH>.json".into());
    }
    let lambda = 0.1;
    let target_pfa = 0.05;

    let windows: Vec<Window> = serde_json::from_str(
        &std::fs::read_to_string(&windows_path)
            .unwrap_or_else(|e| die(format!("read windows: {e}"))),
    )
    .unwrap_or_else(|e| die(format!("parse windows: {e}")));

    // Ingest every C/N0 sample, label it, and stamp a probe record.
    let mut records: Vec<ProbeRecord> = Vec::new();
    let (mut n_clean, mut n_spoof, mut n_jam) = (0u64, 0u64, 0u64);
    for path in &obs_paths {
        let text =
            std::fs::read_to_string(path).unwrap_or_else(|e| die(format!("read {path}: {e}")));
        let series = yunnan::cn0_series(&text).unwrap_or_else(|e| die(format!("{path}: {e}")));
        eprintln!("{path}: {} C/N0 samples", series.len());
        for s in &series {
            let class = class_at(&windows, &s.time);
            let is_nominal = class == "clean";
            match class {
                "clean" => n_clean += 1,
                "spoofing" => n_spoof += 1,
                "jamming" => n_jam += 1,
                _ => {}
            }
            let o = Observation::new(s.detector(), s.cn0, Orient::Negate);
            records.push(ProbeRecord::new(
                o.detector,
                if is_nominal { "nominal" } else { class },
                bin_for(&s.time),
                o.score,
                is_nominal,
            ));
        }
    }
    eprintln!(
        "labelled {} records: clean {n_clean}, spoofing {n_spoof}, jamming {n_jam}",
        records.len()
    );

    // Spoofing gaps anchor on the early spoofing bin; jamming gaps on the early jamming
    // bin (one anchor per class, since no single real bin holds both attack types).
    let mut samples: Vec<GapSample> = build_real_gap_rows(&records, "spoof_early", target_pfa)
        .into_iter()
        .filter(|s| s.class == "spoofing")
        .collect();
    samples.extend(
        build_real_gap_rows(&records, "jam_early", target_pfa)
            .into_iter()
            .filter(|s| s.class == "jamming"),
    );
    samples.sort_by(|a, b| {
        (a.class.clone(), a.detector.clone()).cmp(&(b.class.clone(), b.detector.clone()))
    });

    if samples.is_empty() {
        die("no gap samples — check the observation hours cover both an id and a shifted bin per class".into());
    }
    eprintln!("\n{} gap samples (per detector x class):", samples.len());
    for s in &samples {
        eprintln!(
            "  {:<8} {:<9} gap {:+.3}  (auc_in {:.3})",
            s.detector, s.class, s.gap, s.features[0]
        );
    }

    let by_det = real_loocv(&samples, lambda, CvAxis::Detector);
    let by_class = real_loocv(&samples, lambda, CvAxis::Class);
    let p_det = real_permutation_pvalue(&samples, lambda, CvAxis::Detector, 2000, 20_261_221);
    let p_class = real_permutation_pvalue(&samples, lambda, CvAxis::Class, 2000, 20_261_221);

    let value = json!({
        "schema_version": "yunnan-optimism-probe/1",
        "label": "REAL data: Yunnan University GNSS attack dataset (Mendeley 10.17632/nxk9r22wd6, 2023-12-21). \
                  C/N0 per constellation+band is one detector; clean negatives are the receiver's own quiet seconds.",
        "provenance": {
            "engine": "kshana",
            "engine_version": env!("CARGO_PKG_VERSION"),
            "dataset_doi": "10.17632/nxk9r22wd6",
            "observation_files": obs_paths,
            "severity_proxy": "documented attack windows + early/late split (per-attack power is unpublished)",
            "bins": {"spoof_late_from": SPOOF_LATE_FROM, "jam_from": JAM_FROM, "jam_late_from": JAM_LATE_FROM},
            "ridge_lambda": lambda, "target_pfa": target_pfa,
            "counts": {"records": records.len(), "clean": n_clean, "spoofing": n_spoof, "jamming": n_jam},
        },
        "samples": samples.iter().map(sample_json).collect::<Vec<_>>(),
        "gap_predictor": {
            "feature_names": ["auc_in","dprime","overlap","var_ratio","tail_margin","pd_at_pfa"],
            "cv_leave_one_detector_out": cv_json(&by_det),
            "cv_leave_one_class_out": cv_json(&by_class),
            "permutation_null": {"n_permutations": 2000, "p_leave_one_detector_out": p_det, "p_leave_one_class_out": p_class},
        },
    });

    if let Some(parent) = Path::new(&out).parent() {
        if !parent.as_os_str().is_empty() {
            std::fs::create_dir_all(parent).unwrap_or_else(|e| die(format!("mkdir: {e}")));
        }
    }
    std::fs::write(
        &out,
        serde_json::to_string_pretty(&value).expect("serialize"),
    )
    .unwrap_or_else(|e| die(format!("write: {e}")));

    println!(
        "yunnan-optimism-probe | {} samples | LOO-det R2 {:.3} (p={:.4}) / LOO-class R2 {:.3} (p={:.4}) | REAL data -> {}",
        samples.len(), by_det.r2, p_det, by_class.r2, p_class, out
    );
}
