// SPDX-License-Identifier: AGPL-3.0-only
//! Real-data **graded-severity** optimism-gap probe on the SatGrid dataset.
//!
//! SatGrid (Virginia Tech, DOI 10.7294/SE62-7X13) records genuine GPS L1 C/A plus
//! counterfeit (spoofed) signals at six amplification levels (0,20,40,60,80,100). This
//! probe uses the **spoofer amplification level as the distribution-shift axis** -- the
//! graded-severity sweep the paper's H4 wants -- with genuine vs counterfeit
//! separability scored by four GNSS-SDR tracking detectors (cn0, sqm, lock, qratio).
//!
//! The per-channel GNSS-SDR tracking dumps are flattened to a tidy CSV by
//! `papers/satgrid_extract.py` first; this driver reads that CSV via the
//! [`satgrid`](kshana::realdata::satgrid) adapter, labels genuine as nominal and each
//! counterfeit level as a `spoof` positive in its own shift bin, and runs the same
//! leave-one-detector-out gap predictor used for the synthetic and JammerTest corpora.
//!
//! ```text
//! cargo run --release --example satgrid_probe -- <features.csv> <out.json> [id_level]
//! ```

use kshana::impairment_eval::auc;
use kshana::impairment_study::{
    build_real_gap_rows, real_loocv, real_permutation_pvalue, CvAxis, CvResult, ProbeRecord,
};
use kshana::realdata::satgrid;
use serde_json::{json, Value};
use std::path::Path;

const LEVELS: [&str; 6] = ["0", "20", "40", "60", "80", "100"];

fn die(msg: String) -> ! {
    eprintln!("{msg}");
    std::process::exit(1);
}

fn cv_json(cv: &CvResult) -> Value {
    json!({
        "r2": cv.r2, "rmse": cv.rmse, "n_folds": cv.n_folds, "n_points": cv.pred_actual.len(),
        "scatter": cv.pred_actual.iter().map(|(p, a)| json!({"predicted": p, "actual": a})).collect::<Vec<_>>(),
    })
}

fn main() {
    let mut args = std::env::args().skip(1);
    let csv_path = args
        .next()
        .unwrap_or_else(|| die("usage: satgrid_probe <features.csv> <out.json> [id_level]".into()));
    let out = args
        .next()
        .unwrap_or_else(|| die("missing out.json".into()));
    let id_bin = args.next().unwrap_or_else(|| "100".to_string());
    let (lambda, target_pfa) = (0.1, 0.05);

    let text =
        std::fs::read_to_string(&csv_path).unwrap_or_else(|e| die(format!("read {csv_path}: {e}")));
    let rows = satgrid::parse(&text);
    if rows.is_empty() {
        die(format!("no rows parsed from {csv_path}"));
    }

    // Genuine -> nominal negatives, replicated into every level bin; counterfeit -> a
    // `spoof` positive in its own amplification-level bin.
    let mut records: Vec<ProbeRecord> = Vec::new();
    let (mut n_gen, mut n_cf) = (0u64, 0u64);
    for r in &rows {
        let obs = r.observations();
        if r.is_genuine() {
            n_gen += 1;
            for lvl in LEVELS {
                for o in &obs {
                    records.push(ProbeRecord::new(&o.detector, "nominal", lvl, o.score, true));
                }
            }
        } else if LEVELS.contains(&r.level.as_str()) {
            n_cf += 1;
            for o in &obs {
                records.push(ProbeRecord::new(
                    &o.detector,
                    "spoof",
                    r.level.as_str(),
                    o.score,
                    false,
                ));
            }
        }
    }
    eprintln!(
        "{} rows -> {} records (genuine {n_gen}, counterfeit {n_cf})",
        rows.len(),
        records.len()
    );

    // Transparent per-detector x per-level AUC (genuine negatives vs counterfeit level).
    let detectors: Vec<&str> = {
        let mut d: Vec<&str> = records.iter().map(|r| r.detector.as_str()).collect();
        d.sort();
        d.dedup();
        d
    };
    let det_scores = |det: &str, level: Option<&str>, nominal: bool| -> Vec<f64> {
        records
            .iter()
            .filter(|r| {
                r.detector == det
                    && r.is_nominal == nominal
                    && (nominal || level.map(|l| r.shift_bin == l).unwrap_or(true))
            })
            .map(|r| r.score)
            .collect()
    };
    let mut auc_table = serde_json::Map::new();
    for det in &detectors {
        // Genuine negatives are identical across bins.
        let neg = det_scores(det, None, true);
        let per_level: Value = LEVELS
            .iter()
            .map(|lvl| {
                let pos = det_scores(det, Some(lvl), false);
                let a = if pos.is_empty() || neg.is_empty() {
                    Value::Null
                } else {
                    json!(auc(&pos, &neg))
                };
                (lvl.to_string(), a)
            })
            .collect::<serde_json::Map<_, _>>()
            .into();
        auc_table.insert((*det).to_string(), per_level);
    }

    let samples = build_real_gap_rows(&records, &id_bin, target_pfa);
    if samples.is_empty() {
        die(format!(
            "no gap samples (need genuine + counterfeit in id_bin '{id_bin}' and >=1 other level)"
        ));
    }
    let mut sorted = samples.clone();
    sorted.sort_by(|a, b| a.detector.cmp(&b.detector));
    eprintln!(
        "\n{} gap samples (detector, id_bin={id_bin}):",
        sorted.len()
    );
    for s in &sorted {
        eprintln!(
            "  {:<8} gap {:+.3}  (auc_in {:.3})",
            s.detector, s.gap, s.features[0]
        );
    }

    let by_det = real_loocv(&samples, lambda, CvAxis::Detector);
    let p_det = real_permutation_pvalue(&samples, lambda, CvAxis::Detector, 2000, 20_200_823);

    let value = json!({
        "schema_version": "satgrid-optimism-probe/1",
        "label": "REAL data: SatGrid (DOI 10.7294/SE62-7X13, Arlington_Aug_23_Round_2). Graded-severity \
                  axis = spoofer amplification level (0/20/40/60/80/100); detectors = GNSS-SDR cn0, sqm \
                  (Early-Late), lock (carrier-lock test), qratio (quadrature fraction); negatives = the \
                  genuine recording. Single attack class (spoofing), so cross-detector only.",
        "provenance": {
            "engine": "kshana", "engine_version": env!("CARGO_PKG_VERSION"),
            "dataset_doi": "10.7294/SE62-7X13",
            "scenario": "Arlington_Aug_23_Round_2",
            "shift_axis": "spoofer_amplification_level", "id_bin": id_bin,
            "ridge_lambda": lambda, "target_pfa": target_pfa,
            "counts": {"rows": rows.len(), "genuine": n_gen, "counterfeit": n_cf, "records": records.len()},
            "levels": LEVELS,
            "detectors": detectors,
        },
        "auc_by_detector_and_level": auc_table,
        "samples": sorted.iter().map(|s| json!({"detector": s.detector, "class": s.class, "gap": s.gap, "features": s.features})).collect::<Vec<_>>(),
        "gap_predictor": {
            "feature_names": ["auc_in","dprime","overlap","var_ratio","tail_margin","pd_at_pfa"],
            "cv_leave_one_detector_out": cv_json(&by_det),
            "permutation_null": {"n_permutations": 2000, "p_leave_one_detector_out": p_det},
            "note": "Cross-class CV is not applicable: SatGrid has a single attack class (spoofing).",
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
        "satgrid-optimism-probe | {} gap samples ({} detectors) | LOO-det R2 {:.3} (p={:.4}) | id_level={id_bin} | REAL graded data -> {}",
        sorted.len(), detectors.len(), by_det.r2, p_det, out
    );
}
