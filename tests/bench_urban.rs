// SPDX-License-Identifier: AGPL-3.0-only
//! kshana-bench task (h): urban positioning accuracy on the UrbanNav Hong Kong sequences
//! (`bench/SPEC.md` section 3, `xval/bench-h/`).
//!
//! * Truth, CSV submissions and scoring run end to end through the binary on a synthetic directory
//!   in the layout `scripts/fetch_urbannav.sh` writes; the holdout split is refused.
//! * With `KSHANA_URBANNAV=<dir>` (the directory the fetch script filled) both baselines are
//!   recomputed on both splits and compared with `xval/bench-h/RESULTS.md`.

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

#[test]
fn task_h_baselines_reproduce_the_published_results_when_the_data_is_present() {
    let Some(dir) = std::env::var_os("KSHANA_URBANNAV") else {
        eprintln!(
            "KSHANA_URBANNAV is not set: the task (h) recomputation is skipped (scripts/fetch_urbannav.sh)"
        );
        return;
    };
    // PIN-SCOPE:    the first-run scores of xval/bench-h/RESULTS.md, on the SHA-256-checked files.
    // PIN-EXCLUDES: any other data, receiver or baseline.
    let want = [
        ("test", "provided-nmea", 31.9825),
        ("test", "kshana-spp", 59.1150),
        ("dev", "provided-nmea", 209.2892),
        ("dev", "kshana-spp", 264.8843),
    ];
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
    for (split, b, score) in want {
        let r = json(&out.join(format!("h-{split}-{b}.result.json")));
        let got = r["metrics"]["gsdc_score_m"].as_f64().unwrap();
        assert!((got - score).abs() < 5e-5, "{split} {b}: {got} vs {score}");
    }
    let _ = std::fs::remove_dir_all(&out);
}
