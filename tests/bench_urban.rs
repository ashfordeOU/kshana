// SPDX-License-Identifier: AGPL-3.0-only
//! kshana-bench task (h): urban positioning accuracy on the UrbanNav Hong Kong sequences
//! (`bench/SPEC.md` section 3, `xval/bench-h/`).
//!
//! * Truth, CSV submissions and scoring run end to end through the binary on a synthetic directory
//!   in the layout `scripts/fetch_urbannav.sh` writes; the holdout split is refused.
//! * The committed result files (`bench/results/h-*.result.json`) are valid, metric-only (scores
//!   per trace, no position) and carry the scores of `xval/bench-h/RESULTS.md`.
//! * With `KSHANA_URBANNAV=<dir>` (the directory the fetch script filled) both baselines are
//!   recomputed on both splits and compared with the committed result files, metric for metric;
//!   `KSHANA_URBANNAV_TOKYO=<dir>` does the same for the Tokyo edition
//!   (`scripts/fetch_urbannav_tokyo.sh`, `bench/results/h-tokyo-*.result.json`).

use std::path::{Path, PathBuf};
use std::process::Command;
use std::sync::atomic::{AtomicU64, Ordering};

use serde_json::Value;

fn json(p: &Path) -> Value {
    serde_json::from_str(&std::fs::read_to_string(p).unwrap()).unwrap()
}

fn kshana(args: &[&str]) -> (i32, String) {
    let out = Command::new(env!("CARGO_BIN_EXE_kshana"))
        .args(args)
        .env("KSHANA_LANG", "en")
        .output()
        .unwrap();
    (
        out.status.code().unwrap_or(-1),
        String::from_utf8_lossy(&out.stdout).to_string() + &String::from_utf8_lossy(&out.stderr),
    )
}

fn temp_dir(tag: &str) -> PathBuf {
    static N: AtomicU64 = AtomicU64::new(0);
    let scratch_dir = std::env::temp_dir().join(format!(
        "kshana-bench-h-{tag}-{}-{}",
        std::process::id(),
        N.fetch_add(1, Ordering::SeqCst)
    ));
    std::fs::create_dir_all(&scratch_dir).unwrap();
    scratch_dir
}

const HEADER: &str = "      UTCTime       Week   GPSTime         Latitude        Longitude        H-Ell\n        (sec)    (weeks)     (sec)       (+/-D M S)       (+/-D M S)          (m)\n";

#[test]
fn task_h_truth_positions_and_score_run_end_to_end() {
    let data = temp_dir("data");
    // Two sequences, so one is test and one dev (SHA-256 order of the names).
    for seq in ["medium-urban-1", "deep-urban-1"] {
        let d = data.join(seq);
        std::fs::create_dir_all(&d).unwrap();
        let gt = format!(
            "{HEADER}1621218775.00 2158.00000  95593.00   22 18 04.00000  114 10 44.00000  3.4\r\n1621218776.00 2158.00000  95594.00   22 18 05.00000  114 10 44.00000  3.4\r\n"
        );
        std::fs::write(d.join("ground_truth.txt"), gt).unwrap();
        std::fs::write(d.join("ublox-f9p.nmea"), "").unwrap();
    }
    let out = temp_dir("out");
    let truth = out.join("truth.json");
    let (code, text) = kshana(&[
        "bench",
        "truth",
        "--task",
        "h",
        "--data",
        data.to_str().unwrap(),
        "--split",
        "test",
        "--out",
        truth.to_str().unwrap(),
    ]);
    assert_eq!(code, 0, "{text}");
    let t = json(&truth);
    assert_eq!(t["task"], "h");
    assert_eq!(t["spec_version"], "kshana-bench/2.3.0");
    let traces = t["traces"].as_object().unwrap();
    // PIN-SCOPE:    the split rule on two sequence names: the first in SHA-256 order is test.
    // PIN-EXCLUDES: the split of any other set of names.
    assert_eq!(
        traces.keys().collect::<Vec<_>>(),
        vec!["deep-urban-1/ublox-f9p"]
    );

    let (code, text) = kshana(&[
        "bench",
        "truth",
        "--task",
        "h",
        "--data",
        data.to_str().unwrap(),
        "--split",
        "holdout",
        "--out",
        out.join("h.json").to_str().unwrap(),
    ]);
    assert_ne!(code, 0);
    assert!(text.contains("no holdout split"), "{text}");

    // A submission one metre north of the truth at both epochs scores 1 m.
    let one_m = (1.0f64 / 6_371_000.0).to_degrees();
    let lat = |s: f64| 22.0 + 18.0 / 60.0 + s / 3600.0 + one_m;
    let lon = 114.0 + 10.0 / 60.0 + 44.0 / 3600.0;
    let csv = format!(
        "tripId,UnixTimeMillis,LatitudeDegrees,LongitudeDegrees\ndeep-urban-1/ublox-f9p,1621218775000,{},{lon}\ndeep-urban-1/ublox-f9p,1621218776000,{},{lon}\n",
        lat(4.0),
        lat(5.0)
    );
    let csv_path = out.join("sub.csv");
    std::fs::write(&csv_path, csv).unwrap();
    let preds = out.join("preds.json");
    let (code, text) = kshana(&[
        "bench",
        "positions",
        "--task",
        "h",
        "--split",
        "test",
        "--csv",
        csv_path.to_str().unwrap(),
        "--name",
        "one-metre-north",
        "--out",
        preds.to_str().unwrap(),
    ]);
    assert_eq!(code, 0, "{text}");
    let result = out.join("r.json");
    let (code, text) = kshana(&[
        "bench",
        "score",
        "--truth",
        truth.to_str().unwrap(),
        "--predictions",
        preds.to_str().unwrap(),
        "--out",
        result.to_str().unwrap(),
    ]);
    assert_eq!(code, 0, "{text}");
    let r = json(&result);
    assert!((r["metrics"]["gsdc_score_m"].as_f64().unwrap() - 1.0).abs() < 1e-6);
    assert_eq!(r["task"], "h");
    let (code, text) = kshana(&["bench", "validate", result.to_str().unwrap()]);
    assert_eq!(code, 0, "{text}");
    let _ = std::fs::remove_dir_all(&data);
    let _ = std::fs::remove_dir_all(&out);
}

/// The published first-run scores (`xval/bench-h/RESULTS.md`).
// PIN-SCOPE:    the first-run scores of xval/bench-h/RESULTS.md, on the SHA-256-checked files.
// PIN-EXCLUDES: any other data, receiver or baseline.
const PUBLISHED: [(&str, &str, f64); 4] = [
    ("test", "provided-nmea", 31.9825),
    ("test", "kshana-spp", 59.1150),
    ("dev", "provided-nmea", 209.2892),
    ("dev", "kshana-spp", 264.8843),
];

fn committed(split: &str, baseline: &str) -> Value {
    json(
        &PathBuf::from(env!("CARGO_MANIFEST_DIR"))
            .join(format!("bench/results/h-{split}-{baseline}.result.json")),
    )
}

/// The published first-run scores of the Tokyo edition (`xval/bench-h/RESULTS-TOKYO.md`).
// PIN-SCOPE:    the first-run Tokyo scores of xval/bench-h/RESULTS-TOKYO.md, on the SHA-256-checked files.
// PIN-EXCLUDES: any other data, receiver or baseline, and the Hong Kong edition.
const PUBLISHED_TOKYO: [(&str, f64); 2] = [("test", 26.5997), ("dev", 11.7161)];

fn committed_tokyo(split: &str) -> Value {
    json(&PathBuf::from(env!("CARGO_MANIFEST_DIR")).join(format!(
        "bench/results/h-tokyo-{split}-kshana-spp.result.json"
    )))
}

#[test]
fn task_h_tokyo_results_are_metric_only_named_by_edition_and_carry_the_published_scores() {
    for (split, score) in PUBLISHED_TOKYO {
        let r = committed_tokyo(split);
        assert!(kshana::bench::validate_result(&r).is_empty(), "{split}");
        assert_eq!(r["task"], "h");
        assert!(r["system"]["name"]
            .as_str()
            .unwrap()
            .ends_with("kshana-spp/tokyo"));
        let got = r["metrics"]["gsdc_score_m"].as_f64().unwrap();
        assert!((got - score).abs() < 5e-5, "{split}: {got} vs {score}");
        let mut k = Vec::new();
        keys(&r, &mut k);
        for bad in ["positions", "traces", "lat", "lon", "latitude", "longitude"] {
            assert!(!k.iter().any(|x| x == bad), "{split}: key {bad}");
        }
        let traces: Vec<&str> = r["metrics"]["per_trace"]
            .as_array()
            .unwrap()
            .iter()
            .map(|t| t["trace"].as_str().unwrap())
            .collect();
        assert!(traces.iter().all(|t| t.starts_with("tokyo-")), "{traces:?}");
    }
}

#[test]
fn task_h_tokyo_baseline_reproduces_the_published_results_when_the_data_is_present() {
    let Some(dir) = std::env::var_os("KSHANA_URBANNAV_TOKYO") else {
        eprintln!("KSHANA_URBANNAV_TOKYO is not set: the Tokyo recomputation is skipped (scripts/fetch_urbannav_tokyo.sh)");
        return;
    };
    let out = temp_dir("tokyo");
    for (split, _) in PUBLISHED_TOKYO {
        let (code, text) = kshana(&[
            "bench",
            "baseline",
            "--task",
            "h",
            "--split",
            split,
            "--data",
            dir.to_str().unwrap(),
            "--out",
            out.to_str().unwrap(),
        ]);
        assert_eq!(code, 0, "{text}");
        assert!(text.contains("provided-nmea skipped"), "{text}");
        let r = json(&out.join(format!("h-{split}-kshana-spp.result.json")));
        assert_eq!(r["metrics"], committed_tokyo(split)["metrics"], "{split}");
        assert_eq!(r["truth_sha256"], committed_tokyo(split)["truth_sha256"]);
    }
    let _ = std::fs::remove_dir_all(&out);
}

/// Every key anywhere in a JSON document.
fn keys(v: &Value, out: &mut Vec<String>) {
    match v {
        Value::Object(m) => {
            for (k, x) in m {
                out.push(k.clone());
                keys(x, out);
            }
        }
        Value::Array(a) => a.iter().for_each(|x| keys(x, out)),
        _ => {}
    }
}

#[test]
fn task_h_committed_results_are_metric_only_and_carry_the_published_scores() {
    for (split, b, score) in PUBLISHED {
        let r = committed(split, b);
        assert!(kshana::bench::validate_result(&r).is_empty(), "{split} {b}");
        assert_eq!(r["spec_version"], "kshana-bench/2.3.0");
        assert!(r["label"].as_str().unwrap().starts_with("MODELLED"));
        let got = r["metrics"]["gsdc_score_m"].as_f64().unwrap();
        assert!((got - score).abs() < 5e-5, "{split} {b}: {got} vs {score}");
        // No UrbanNav position is redistributed: no latitude, longitude, truth or predictions.
        let mut k = Vec::new();
        keys(&r, &mut k);
        for bad in ["positions", "traces", "lat", "lon", "latitude", "longitude"] {
            assert!(!k.iter().any(|x| x == bad), "{split} {b}: key {bad}");
        }
        assert_eq!(r["metrics"]["per_trace"].as_array().unwrap().len(), 4);
    }
}

#[test]
fn task_h_baselines_reproduce_the_published_results_when_the_data_is_present() {
    let Some(dir) = std::env::var_os("KSHANA_URBANNAV") else {
        eprintln!(
            "KSHANA_URBANNAV is not set: the task (h) recomputation is skipped (scripts/fetch_urbannav.sh)"
        );
        return;
    };
    let out = temp_dir("baseline");
    for split in ["test", "dev"] {
        let (code, text) = kshana(&[
            "bench",
            "baseline",
            "--task",
            "h",
            "--split",
            split,
            "--data",
            dir.to_str().unwrap(),
            "--out",
            out.to_str().unwrap(),
        ]);
        assert_eq!(code, 0, "{text}");
    }
    for (split, b, _) in PUBLISHED {
        let r = json(&out.join(format!("h-{split}-{b}.result.json")));
        assert_eq!(r["metrics"], committed(split, b)["metrics"], "{split} {b}");
        assert_eq!(r["truth_sha256"], committed(split, b)["truth_sha256"]);
        assert_eq!(
            r["predictions_sha256"],
            committed(split, b)["predictions_sha256"]
        );
    }
    let _ = std::fs::remove_dir_all(&out);
}

#[test]
fn the_leaderboard_renders_task_h_and_refuses_a_task_h_holdout_row() {
    let r = committed("test", "kshana-spp");
    let page = kshana::bench::site::leaderboard_html(std::slice::from_ref(&r)).unwrap();
    assert!(page.contains("Task (h)"), "no task (h) section");
    assert!(page.contains("59.115"), "the score is not on the board");
    let mut h = r.clone();
    h["split"] = Value::from("holdout");
    assert!(kshana::bench::site::leaderboard_html(&[h]).is_err());
}

#[test]
fn a_directory_mixing_the_two_editions_is_refused() {
    let data = temp_dir("mixed");
    std::fs::create_dir_all(data.join("medium-urban-1")).unwrap();
    std::fs::write(
        data.join("medium-urban-1/ground_truth.txt"),
        format!("{HEADER}1621218775.00 2158.00000  95593.00   22 18 04.0  114 10 44.0  3.4\n"),
    )
    .unwrap();
    std::fs::write(data.join("medium-urban-1/ublox-f9p.nmea"), "").unwrap();
    std::fs::create_dir_all(data.join("tokyo-odaiba")).unwrap();
    std::fs::write(
        data.join("tokyo-odaiba/tk_reference.csv"),
        "GPS TOW (s), GPS Week, Latitude (deg), Longitude (deg)\n273376.00, 2032, 35.6, 139.7\n",
    )
    .unwrap();
    std::fs::write(data.join("tokyo-odaiba/ublox-f9p.obs"), "").unwrap();
    let (code, text) = kshana(&[
        "bench",
        "truth",
        "--task",
        "h",
        "--data",
        data.to_str().unwrap(),
        "--split",
        "test",
        "--out",
        data.join("t.json").to_str().unwrap(),
    ]);
    assert_ne!(code, 0);
    assert!(
        text.contains("mixes the Hong Kong and Tokyo editions"),
        "{text}"
    );
    let _ = std::fs::remove_dir_all(&data);
}
