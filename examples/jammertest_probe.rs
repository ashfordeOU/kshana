// SPDX-License-Identifier: AGPL-3.0-only
//! Real-data optimism-gap probe on the JammerTest 2024 field dataset.
//!
//! Runs the H4 pipeline on a genuine over-the-air interference campaign. It walks the
//! per-scenario folders, reads `mon_rf.csv` (AGC, jamming indicator) and `rinex.csv`
//! (C/N0 per constellation+band) with the [`jammertest`] adapter, labels each sample
//! clean vs attack from the scenario's `attack_log`, and uses the **rover mobility
//! state** (stationary vs dynamic) as the distribution-shift axis, which is the one
//! condition every attack class shares in this dataset. Clean negatives are each
//! scenario's own pre/post-attack seconds.
//!
//! The `attack_log` timestamps are wall-clock local (CEST, UTC+2) tagged "Z"; the
//! receiver `real_time` is UTC. They are reconciled with a fixed -2 h shift (validated
//! against the jamming-indicator onset), applied in seconds-of-day.
//!
//! ```text
//! cargo run --release --example jammertest_probe -- <dataset_root> <out.json> [id_state]
//! ```

use kshana::impairment_study::{
    build_real_gap_rows, real_loocv, real_permutation_pvalue, CvAxis, CvResult, GapSample,
    ProbeRecord,
};
use kshana::realdata::{jammertest, Orient};
use serde_json::{json, Value};
use std::path::{Path, PathBuf};

/// CEST (UTC+2) to UTC, in seconds — the `attack_log` "Z" stamps are really local.
const TZ_OFFSET_SEC: i64 = 7200;

fn die(msg: String) -> ! {
    eprintln!("{msg}");
    std::process::exit(1);
}

/// Seconds-of-day from a `"... HH:MM:SS[.fff]"` or `"...THH:MM:SS Z"` timestamp.
fn secs_of_day(ts: &str) -> Option<i64> {
    let tail = ts.split([' ', 'T']).nth(1)?;
    let hms = tail.trim_end_matches('Z');
    let mut it = hms.split(':');
    let h: i64 = it.next()?.trim().parse().ok()?;
    let m: i64 = it.next()?.trim().parse().ok()?;
    let s: i64 = it.next()?.split('.').next()?.trim().parse().ok()?;
    Some(h * 3600 + m * 60 + s)
}

/// Attack windows (seconds-of-day, UTC) from a scenario's `attack_log`: each
/// "...start..." event opens a window, the next "...end/stop..." closes it.
fn attack_windows(meta: &Value) -> Vec<(i64, i64)> {
    let mut wins = Vec::new();
    let mut open: Option<i64> = None;
    if let Some(log) = meta.get("attack_log").and_then(Value::as_array) {
        for ev in log {
            let (Some(ts), Some(event)) = (
                ev.get("timestamp_utc").and_then(Value::as_str),
                ev.get("event").and_then(Value::as_str),
            ) else {
                continue;
            };
            let Some(raw) = secs_of_day(ts) else { continue };
            let s = (raw - TZ_OFFSET_SEC).rem_euclid(86_400);
            let e = event.to_lowercase();
            if e.contains("start") {
                open = Some(s);
            } else if (e.contains("end") || e.contains("stop")) && open.is_some() {
                wins.push((open.take().unwrap(), s));
            }
        }
    }
    wins
}

/// Whether a seconds-of-day falls in any attack window (handles a midnight-wrapped
/// window where start > end).
fn in_attack(secs: i64, wins: &[(i64, i64)]) -> bool {
    wins.iter().any(|&(s, e)| {
        if s <= e {
            secs >= s && secs <= e
        } else {
            secs >= s || secs <= e
        }
    })
}

fn find_scenarios(dir: &Path, out: &mut Vec<PathBuf>) {
    let Ok(rd) = std::fs::read_dir(dir) else {
        return;
    };
    let entries: Vec<_> = rd.flatten().collect();
    if entries.iter().any(|e| e.file_name() == "scenario.json") {
        out.push(dir.to_path_buf());
    }
    for e in entries {
        if e.path().is_dir() {
            find_scenarios(&e.path(), out);
        }
    }
}

fn cv_json(cv: &CvResult) -> Value {
    json!({
        "r2": cv.r2, "rmse": cv.rmse, "n_folds": cv.n_folds, "n_points": cv.pred_actual.len(),
        "scatter": cv.pred_actual.iter().map(|(p, a)| json!({"predicted": p, "actual": a})).collect::<Vec<_>>(),
    })
}

fn main() {
    let mut args = std::env::args().skip(1);
    let root = args.next().unwrap_or_else(|| {
        die("usage: jammertest_probe <dataset_root> <out.json> [id_state]".into())
    });
    let out = args
        .next()
        .unwrap_or_else(|| die("missing out.json".into()));
    let id_state = args.next().unwrap_or_else(|| "stationary".to_string());
    let (lambda, target_pfa) = (0.1, 0.05);

    let mut scenarios = Vec::new();
    find_scenarios(Path::new(&root), &mut scenarios);
    scenarios.sort();
    if scenarios.is_empty() {
        die(format!("no scenario.json found under {root}"));
    }

    let mut records: Vec<ProbeRecord> = Vec::new();
    let (mut n_clean, mut n_attack, mut n_skipped) = (0u64, 0u64, 0u64);
    for dir in &scenarios {
        let meta: Value = match std::fs::read_to_string(dir.join("scenario.json"))
            .ok()
            .and_then(|t| serde_json::from_str(&t).ok())
        {
            Some(m) => m,
            None => {
                n_skipped += 1;
                continue;
            }
        };
        let class = meta
            .get("attack_type")
            .and_then(Value::as_str)
            .unwrap_or("unknown")
            .to_lowercase()
            .replace([' ', '+'], "_");
        let path_str = dir.to_string_lossy().to_lowercase();
        let state = if path_str.contains("dynamic") {
            "dynamic"
        } else if path_str.contains("stationary") {
            "stationary"
        } else {
            n_skipped += 1;
            continue;
        };
        let wins = attack_windows(&meta);
        if wins.is_empty() {
            n_skipped += 1;
            continue; // cannot separate clean from attack without a window
        }

        let mon = std::fs::read_to_string(dir.join("mon_rf.csv")).unwrap_or_default();
        let rnx = std::fs::read_to_string(dir.join("rinex.csv")).unwrap_or_default();
        let mut samples = jammertest::mon_rf_observations(&mon, Orient::Negate);
        samples.extend(jammertest::rinex_cn0_observations(&rnx));

        for t in &samples {
            let Some(secs) = secs_of_day(&t.time) else {
                continue;
            };
            let is_attack = in_attack(secs, &wins);
            if is_attack {
                n_attack += 1;
            } else {
                n_clean += 1;
            }
            records.push(ProbeRecord::new(
                t.obs.detector.clone(),
                if is_attack { class.as_str() } else { "nominal" },
                state,
                t.obs.score,
                !is_attack,
            ));
        }
    }
    eprintln!(
        "{} scenarios ({n_skipped} skipped) -> {} records: clean {n_clean}, attack {n_attack}",
        scenarios.len(),
        records.len()
    );

    // Shift axis = rover state; id_state is in-distribution, the other state is shifted.
    let samples: Vec<GapSample> = build_real_gap_rows(&records, &id_state, target_pfa);
    if samples.is_empty() {
        die(format!(
            "no gap samples — each detector/class needs clean+attack in both '{id_state}' and the other state"
        ));
    }
    let mut sorted = samples.clone();
    sorted.sort_by(|a, b| {
        (a.class.clone(), a.detector.clone()).cmp(&(b.class.clone(), b.detector.clone()))
    });
    eprintln!("\n{} gap samples (detector x class):", sorted.len());
    for s in &sorted {
        eprintln!(
            "  {:<10} {:<18} gap {:+.3}  (auc_in {:.3})",
            s.detector, s.class, s.gap, s.features[0]
        );
    }

    let by_det = real_loocv(&samples, lambda, CvAxis::Detector);
    let by_class = real_loocv(&samples, lambda, CvAxis::Class);
    let p_det = real_permutation_pvalue(&samples, lambda, CvAxis::Detector, 2000, 20_240_911);
    let p_class = real_permutation_pvalue(&samples, lambda, CvAxis::Class, 2000, 20_240_911);

    let classes: std::collections::BTreeSet<&str> =
        sorted.iter().map(|s| s.class.as_str()).collect();
    let detectors: std::collections::BTreeSet<&str> =
        sorted.iter().map(|s| s.detector.as_str()).collect();

    let value = json!({
        "schema_version": "jammertest-optimism-probe/1",
        "label": "REAL data: JammerTest 2024 (Zenodo 10.5281/zenodo.15910563). Shift axis = rover mobility \
                  (stationary vs dynamic); detectors = cn0 per constellation+band, agc, jamind; clean negatives \
                  are each scenario's own pre/post-attack seconds.",
        "provenance": {
            "engine": "kshana", "engine_version": env!("CARGO_PKG_VERSION"),
            "dataset_doi": "10.5281/zenodo.15910563",
            "shift_axis": "rover_state", "id_bin": id_state,
            "tz_correction_sec": TZ_OFFSET_SEC,
            "ridge_lambda": lambda, "target_pfa": target_pfa,
            "counts": {"scenarios": scenarios.len(), "skipped": n_skipped, "records": records.len(),
                       "clean": n_clean, "attack": n_attack},
            "classes": classes, "detectors": detectors,
        },
        "samples": sorted.iter().map(|s| json!({"detector": s.detector, "class": s.class, "gap": s.gap, "features": s.features})).collect::<Vec<_>>(),
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
        "jammertest-optimism-probe | {} samples ({} detectors x {} classes) | LOO-det R2 {:.3} (p={:.4}) / LOO-class R2 {:.3} (p={:.4}) | REAL data -> {}",
        sorted.len(), detectors.len(), classes.len(), by_det.r2, p_det, by_class.r2, p_class, out
    );
}
