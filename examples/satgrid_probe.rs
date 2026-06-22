// SPDX-License-Identifier: AGPL-3.0-only
//! Real-data **graded-severity** optimism-gap probe on the SatGrid dataset.
//!
//! SatGrid records genuine GPS L1 C/A plus counterfeit (spoofed) signals at several
//! spoofer amplification levels, across independent recording sessions. This probe uses
//! the **amplification level as the per-session distribution-shift axis**: within each
//! session it calibrates every detector at the lowest amplification and measures how far
//! the genuine-vs-counterfeit AUC falls at higher amplification (the optimism gap). The
//! per-(detector, session) gaps are then **pooled** so the leave-one-detector-out gap
//! predictor is tested across sessions, not just within one.
//!
//! Detectors are four GNSS-SDR tracking channels (cn0, sqm Early-Late, carrier-lock
//! test, quadrature ratio); the genuine recording is the negative. The per-channel
//! tracking dumps are flattened to a tidy CSV by `papers/satgrid_extract.py` first.
//!
//! ```text
//! cargo run --release --example satgrid_probe -- <features.csv> <out.json>
//! ```

use kshana::impairment_eval::auc;
use kshana::impairment_study::{
    build_real_gap_rows, real_loocv, real_permutation_pvalue, CvAxis, CvResult, GapSample,
    ProbeRecord,
};
use kshana::realdata::satgrid::{self, SatGridRow};
use serde_json::{json, Value};
use std::collections::BTreeSet;
use std::path::Path;

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

/// Sorted numeric counterfeit levels present in a scenario's rows (skips `na`/`cf`).
fn numeric_levels(rows: &[&SatGridRow]) -> Vec<String> {
    let mut lv: Vec<(f64, String)> = rows
        .iter()
        .filter(|r| !r.is_genuine())
        .filter_map(|r| r.level.parse::<f64>().ok().map(|n| (n, r.level.clone())))
        .collect();
    lv.sort_by(|a, b| a.0.partial_cmp(&b.0).unwrap());
    lv.dedup_by(|a, b| a.1 == b.1);
    lv.into_iter().map(|(_, s)| s).collect()
}

/// Build probe records for one scenario: genuine replicated as the nominal negative into
/// every level bin, counterfeit as a `spoof` positive in its own level bin.
fn scenario_records(rows: &[&SatGridRow], levels: &[String]) -> Vec<ProbeRecord> {
    let mut out = Vec::new();
    for r in rows {
        let obs = r.observations();
        if r.is_genuine() {
            for lvl in levels {
                for o in &obs {
                    out.push(ProbeRecord::new(
                        &o.detector,
                        "nominal",
                        lvl.as_str(),
                        o.score,
                        true,
                    ));
                }
            }
        } else if levels.iter().any(|l| l == &r.level) {
            for o in &obs {
                out.push(ProbeRecord::new(
                    &o.detector,
                    "spoof",
                    r.level.as_str(),
                    o.score,
                    false,
                ));
            }
        }
    }
    out
}

fn main() {
    let mut args = std::env::args().skip(1);
    let csv_path = args
        .next()
        .unwrap_or_else(|| die("usage: satgrid_probe <features.csv> <out.json>".into()));
    let out = args
        .next()
        .unwrap_or_else(|| die("missing out.json".into()));
    let (lambda, target_pfa) = (0.1, 0.05);

    let text =
        std::fs::read_to_string(&csv_path).unwrap_or_else(|e| die(format!("read {csv_path}: {e}")));
    let rows = satgrid::parse(&text);
    if rows.is_empty() {
        die(format!("no rows parsed from {csv_path}"));
    }

    let scenarios: BTreeSet<&str> = rows
        .iter()
        .map(|r| {
            if r.scenario.is_empty() {
                "default"
            } else {
                r.scenario.as_str()
            }
        })
        .collect();

    let mut pooled: Vec<GapSample> = Vec::new();
    let mut per_scenario = serde_json::Map::new();
    for scn in &scenarios {
        let scn_rows: Vec<&SatGridRow> = rows
            .iter()
            .filter(|r| {
                (if r.scenario.is_empty() {
                    "default"
                } else {
                    r.scenario.as_str()
                }) == *scn
            })
            .collect();
        let levels = numeric_levels(&scn_rows);
        // Per-detector per-level AUC (genuine negatives vs counterfeit level), reported
        // for every scenario including single-level ones.
        let recs_all_levels = scenario_records(&scn_rows, &levels);
        let detectors: Vec<String> = {
            let mut d: Vec<String> = recs_all_levels.iter().map(|r| r.detector.clone()).collect();
            d.sort();
            d.dedup();
            d
        };
        let mut auc_tbl = serde_json::Map::new();
        for det in &detectors {
            let neg: Vec<f64> = recs_all_levels
                .iter()
                .filter(|r| &r.detector == det && r.is_nominal)
                .map(|r| r.score)
                .collect();
            let per: Value = levels
                .iter()
                .map(|lvl| {
                    let pos: Vec<f64> = recs_all_levels
                        .iter()
                        .filter(|r| &r.detector == det && !r.is_nominal && &r.shift_bin == lvl)
                        .map(|r| r.score)
                        .collect();
                    let a = if pos.is_empty() || neg.is_empty() {
                        Value::Null
                    } else {
                        json!(auc(&pos, &neg))
                    };
                    (lvl.clone(), a)
                })
                .collect::<serde_json::Map<_, _>>()
                .into();
            auc_tbl.insert(det.clone(), per);
        }

        // Graded gaps require >= 2 levels; the lowest level is the in-distribution one.
        let scn_gaps = if levels.len() >= 2 {
            let id_bin = &levels[0];
            let g = build_real_gap_rows(&recs_all_levels, id_bin, target_pfa);
            pooled.extend(g.iter().cloned());
            g
        } else {
            Vec::new()
        };
        per_scenario.insert(
            (*scn).to_string(),
            json!({
                "levels": levels,
                "id_level": levels.first(),
                "auc_by_detector_and_level": auc_tbl,
                "gaps": scn_gaps.iter().map(|s| json!({"detector": s.detector, "gap": s.gap, "auc_in": s.features[0]})).collect::<Vec<_>>(),
            }),
        );
        eprintln!(
            "{scn}: levels {:?} -> {} gap samples",
            levels,
            scn_gaps.len()
        );
    }

    if pooled.is_empty() {
        die("no graded scenarios (need >=2 amplification levels in at least one session)".into());
    }
    pooled.sort_by(|a, b| a.detector.cmp(&b.detector));
    eprintln!(
        "\npooled {} gap samples across {} sessions:",
        pooled.len(),
        scenarios.len()
    );
    for s in &pooled {
        eprintln!(
            "  {:<8} gap {:+.3}  (auc_in {:.3})",
            s.detector, s.gap, s.features[0]
        );
    }

    let by_det = real_loocv(&pooled, lambda, CvAxis::Detector);
    let p_det = real_permutation_pvalue(&pooled, lambda, CvAxis::Detector, 2000, 20_200_823);
    // Rank-correlation of in-distribution AUC against the realised gap: the right
    // statistic at this sample size, robust to the ridge being underpowered.
    let auc_in: Vec<f64> = pooled.iter().map(|s| s.features[0]).collect();
    let gaps: Vec<f64> = pooled.iter().map(|s| s.gap).collect();
    let (rho, rho_p) = kshana::eval_stats::spearman(&auc_in, &gaps);
    let n_det = pooled
        .iter()
        .map(|s| s.detector.as_str())
        .collect::<BTreeSet<_>>()
        .len();
    let mean_gap = pooled.iter().map(|s| s.gap).sum::<f64>() / pooled.len() as f64;

    let value = json!({
        "schema_version": "satgrid-optimism-probe/2",
        "label": "REAL data: SatGrid (DOI 10.7294/SE62-7X13). Graded-severity axis = spoofer amplification \
                  level, per recording session; detectors = GNSS-SDR cn0, sqm (Early-Late), lock, qratio; \
                  negatives = the genuine recording. Per-(detector, session) gaps pooled for the cross-detector \
                  predictor. Single attack class (spoofing), so cross-detector only.",
        "provenance": {
            "engine": "kshana", "engine_version": env!("CARGO_PKG_VERSION"),
            "dataset_doi": "10.7294/SE62-7X13",
            "sessions": scenarios,
            "shift_axis": "spoofer_amplification_level", "id_rule": "lowest amplification per session",
            "ridge_lambda": lambda, "target_pfa": target_pfa,
            "n_rows": rows.len(),
        },
        "per_scenario": per_scenario,
        "pooled": {
            "n_gap_samples": pooled.len(),
            "n_detectors": n_det,
            "mean_gap": mean_gap,
            "samples": pooled.iter().map(|s| json!({"detector": s.detector, "gap": s.gap, "features": s.features})).collect::<Vec<_>>(),
            "gap_predictor": {
                "feature_names": ["auc_in","dprime","overlap","var_ratio","tail_margin","pd_at_pfa"],
                "cv_leave_one_detector_out": cv_json(&by_det),
                "permutation_null": {"n_permutations": 2000, "p_leave_one_detector_out": p_det},
                "note": "Cross-class CV is not applicable: SatGrid has a single attack class (spoofing).",
            },
            "spearman_auc_in_vs_gap": {"rho": rho, "p": rho_p,
                "note": "Rank-correlation of in-distribution AUC against the realised gap across pooled detector-session samples; the H4 direction at small n."},
        },
    });

    if let Some(parent) = Path::new(&out).parent() {
        if !parent.as_os_str().is_empty() {
            std::fs::create_dir_all(parent).ok();
        }
    }
    std::fs::write(
        &out,
        serde_json::to_string_pretty(&value).expect("serialize"),
    )
    .unwrap_or_else(|e| die(format!("write: {e}")));

    println!(
        "satgrid-optimism-probe/2 | {} sessions, {} pooled gap samples ({} detectors) | mean gap {:+.3} | Spearman(auc_in,gap) rho={:.3} | LOO-det R2 {:.3} (p={:.4}) | REAL graded data -> {}",
        scenarios.len(), pooled.len(), n_det, mean_gap, rho, by_det.r2, p_det, out
    );
}
