// SPDX-License-Identifier: AGPL-3.0-only
//! Raw-IF optimism-gap probe on the TEXBAT / OAKBAT spoofing batteries.
//!
//! TEXBAT (and OAKBAT) ship sampled antenna IQ, not correlator dumps, so this driver
//! runs the [`crate::sdr`] software-receiver front end on the raw samples: it reads a
//! time window from each labelled `.bin`, acquires and tracks every candidate PRN, and
//! turns the tracked correlators into the SQM and prompt-power detectors the
//! optimism-gap pipeline scores. The clean recording is the nominal negative; each
//! spoofing scenario is a `spoof` positive in its own power-advantage bin (TEXBAT ds2
//! ~10 dB, ds3 ~1.3 dB, ds4 ~0.4 dB), so the spoofer power advantage is the graded
//! severity axis.
//!
//! TEXBAT is complex int16 little-endian I/Q at 25 Msps; OAKBAT is the same datatype at
//! 5 Msps. Files are tens of gigabytes, so only the first `window_sec` seconds of each
//! are read into memory.
//!
//! ```text
//! cargo run --release --example texbat_probe -- \
//!     out.json <fs_hz> <window_sec> <if_hz> \
//!     nominal:cleanStatic.bin p10:ds2.bin p1_3:ds3.bin p0_4:ds4.bin
//! ```

use kshana::impairment_eval::auc;
use kshana::impairment_study::{
    build_real_gap_rows, real_loocv, real_permutation_pvalue, CvAxis, CvResult, ProbeRecord,
};
use kshana::realdata::iqif::{self, FeatureStageConfig, IqFormat};
use kshana::sdr::TrackConfig;
use serde_json::{json, Value};
use std::io::Read;
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

/// Read the first `n` bytes of a file (a time window of a multi-gigabyte IF capture).
fn read_window(path: &str, n: usize) -> Vec<u8> {
    let f = std::fs::File::open(path).unwrap_or_else(|e| die(format!("open {path}: {e}")));
    let mut buf = vec![0u8; n];
    let mut handle = f.take(n as u64);
    let mut filled = 0;
    loop {
        match handle.read(&mut buf[filled..]) {
            Ok(0) => break,
            Ok(k) => filled += k,
            Err(e) => die(format!("read {path}: {e}")),
        }
    }
    buf.truncate(filled);
    buf
}

fn main() {
    let mut args = std::env::args().skip(1);
    let out = args.next().unwrap_or_else(|| {
        die("usage: texbat_probe out.json <fs_hz> <window_sec> <if_hz> label:path...".into())
    });
    let fs_hz: f64 = args
        .next()
        .and_then(|s| s.parse().ok())
        .unwrap_or(25_000_000.0);
    let window_sec: f64 = args.next().and_then(|s| s.parse().ok()).unwrap_or(8.0);
    let if_hz: f64 = args.next().and_then(|s| s.parse().ok()).unwrap_or(0.0);
    let files: Vec<String> = args.collect();
    if files.is_empty() {
        die("need at least one label:path (e.g. nominal:cleanStatic.bin p10:ds2.bin)".into());
    }

    let cfg = FeatureStageConfig {
        fs_hz,
        if_hz,
        doppler_max_hz: 6000.0,
        doppler_step_hz: 250.0,
        acq_threshold: 2.5,
        n_epochs: (window_sec * 1000.0) as usize,
        track: TrackConfig::default(),
    };
    // Window length in bytes (int16 I + int16 Q = 4 bytes/sample).
    let window_bytes = (fs_hz * window_sec) as usize * 4;
    let target_pfa = 0.05;

    // Parse label:path pairs; the label whose name starts with "nominal" is the clean
    // negative, replicated into every spoof bin.
    let parsed: Vec<(String, String)> = files
        .iter()
        .map(|f| {
            let (label, path) = f
                .split_once(':')
                .unwrap_or_else(|| die(format!("bad label:path '{f}'")));
            (label.to_string(), path.to_string())
        })
        .collect();
    let spoof_bins: Vec<&str> = parsed
        .iter()
        .filter(|(l, _)| !l.starts_with("nominal"))
        .map(|(l, _)| l.as_str())
        .collect();
    if spoof_bins.is_empty() {
        die("need at least one non-nominal (spoof) labelled file".into());
    }

    let mut records: Vec<ProbeRecord> = Vec::new();
    for (label, path) in &parsed {
        let bytes = read_window(path, window_bytes);
        let iq = iqif::load_iq(&bytes, IqFormat::Int16Le);
        eprintln!("{label}: {} samples from {path}", iq.len());
        let mut acquired = 0;
        for prn in 1u8..=32 {
            let Some(dumps) = iqif::dumps_for_prn(&iq, prn, &cfg) else {
                continue;
            };
            acquired += 1;
            let sqm = iqif::sqm_observations(&dumps);
            let pwr = iqif::prompt_power_observations(&dumps);
            let push = |records: &mut Vec<ProbeRecord>,
                        det: String,
                        obs: &[kshana::realdata::Observation],
                        bin: &str,
                        nominal: bool,
                        class: &str| {
                for o in obs {
                    records.push(ProbeRecord::new(det.clone(), class, bin, o.score, nominal));
                }
            };
            if label.starts_with("nominal") {
                for bin in &spoof_bins {
                    push(
                        &mut records,
                        format!("sqm_{prn}"),
                        &sqm,
                        bin,
                        true,
                        "nominal",
                    );
                    push(
                        &mut records,
                        format!("pwr_{prn}"),
                        &pwr,
                        bin,
                        true,
                        "nominal",
                    );
                }
            } else {
                push(
                    &mut records,
                    format!("sqm_{prn}"),
                    &sqm,
                    label,
                    false,
                    "spoof",
                );
                push(
                    &mut records,
                    format!("pwr_{prn}"),
                    &pwr,
                    label,
                    false,
                    "spoof",
                );
            }
        }
        eprintln!("  acquired {acquired} PRNs");
    }

    let detectors: Vec<&str> = {
        let mut d: Vec<&str> = records.iter().map(|r| r.detector.as_str()).collect();
        d.sort();
        d.dedup();
        d
    };
    let id_bin = spoof_bins[0].to_string();
    let samples = build_real_gap_rows(&records, &id_bin, target_pfa);
    if samples.is_empty() {
        die(format!(
            "no gap samples: each detector needs nominal + spoof in id_bin '{id_bin}' and >=1 other bin"
        ));
    }
    let by_det = real_loocv(&samples, 0.1, CvAxis::Detector);
    let p_det = real_permutation_pvalue(&samples, 0.1, CvAxis::Detector, 2000, 20_240_911);

    // Transparent per-detector per-bin AUC.
    let mut auc_tbl = serde_json::Map::new();
    for det in &detectors {
        let neg: Vec<f64> = records
            .iter()
            .filter(|r| r.detector == *det && r.is_nominal)
            .map(|r| r.score)
            .collect();
        let per: Value = spoof_bins
            .iter()
            .map(|b| {
                let pos: Vec<f64> = records
                    .iter()
                    .filter(|r| r.detector == *det && !r.is_nominal && r.shift_bin == **b)
                    .map(|r| r.score)
                    .collect();
                let a = if pos.is_empty() || neg.is_empty() {
                    Value::Null
                } else {
                    json!(auc(&pos, &neg))
                };
                ((*b).to_string(), a)
            })
            .collect::<serde_json::Map<_, _>>()
            .into();
        auc_tbl.insert((*det).to_string(), per);
    }

    let value = json!({
        "schema_version": "texbat-optimism-probe/1",
        "label": "REAL raw-IF data via the kshana SDR feature stage (acquire + track). Clean recording = \
                  nominal negatives; each spoofing scenario = a spoof positive in its own power-advantage bin. \
                  Detectors = SQM (Early-Late) and prompt power per acquired PRN.",
        "provenance": {
            "engine": "kshana", "engine_version": env!("CARGO_PKG_VERSION"),
            "fs_hz": fs_hz, "if_hz": if_hz, "window_sec": window_sec,
            "id_bin": id_bin, "target_pfa": target_pfa,
            "files": parsed.iter().map(|(l,p)| json!({"label": l, "path": p})).collect::<Vec<_>>(),
            "detectors": detectors,
        },
        "auc_by_detector_and_bin": auc_tbl,
        "samples": samples.iter().map(|s| json!({"detector": s.detector, "class": s.class, "gap": s.gap, "features": s.features})).collect::<Vec<_>>(),
        "gap_predictor": {
            "feature_names": ["auc_in","dprime","overlap","var_ratio","tail_margin","pd_at_pfa"],
            "cv_leave_one_detector_out": cv_json(&by_det),
            "permutation_null": {"n_permutations": 2000, "p_leave_one_detector_out": p_det},
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
    .unwrap_or_else(|e| die(format!("write {out}: {e}")));
    println!(
        "texbat-optimism-probe | {} gap samples ({} detectors) | LOO-det R2 {:.3} (p={:.4}) | REAL raw-IF -> {}",
        samples.len(), detectors.len(), by_det.r2, p_det, out
    );
}
