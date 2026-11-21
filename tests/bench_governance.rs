// SPDX-License-Identifier: AGPL-3.0-only
//! kshana-bench E34: tasks (f) and (g), the dataset registry and the golden index of the frozen
//! sets (`bench/SPEC.md` sections 3 and 8, `docs/BENCH.md`).
//!
//! * The registry (`bench/manifests/datasets.json`) meets its rules against this repository: every
//!   fetch script exists, data in the repository is named in NOTICE, and no file of a dataset that
//!   is not redistributed (TEXBAT, JammerTest, the task (f) and (g) sources) is in the tree.
//! * The golden index (`bench/GOLDEN.json`) matches the frozen files, and every citation id it
//!   lists is the one the result file gives today, so ids are stable across releases.
//! * Task (f): the committed baseline results meet bars F2 and F3 of
//!   `xval/bench-f/PREREGISTRATION.md`; with `KSHANA_OPSSAT_AD=<dataset.csv>` they are recomputed
//!   and compared value for value; the pipeline also runs hermetically on the vendored earlier
//!   record of the dataset.
//! * Task (g): truth, the provided-WLS baseline, scoring, `cite` and the leaderboard run end to end
//!   through the binary on a synthetic GSDC-layout directory.

use std::path::{Path, PathBuf};
use std::process::Command;
use std::sync::atomic::{AtomicU64, Ordering};

use kshana::bench::{anomaly, cite, datasets, validate_result, Split};
use serde_json::Value;

fn root() -> PathBuf {
    PathBuf::from(env!("CARGO_MANIFEST_DIR"))
}

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
    let unique_dir = std::env::temp_dir().join(format!(
        "kshana-e34-{tag}-{}-{}",
        std::process::id(),
        N.fetch_add(1, Ordering::SeqCst)
    ));
    std::fs::create_dir_all(&unique_dir).unwrap();
    unique_dir
}

#[test]
fn the_dataset_registry_meets_its_rules_against_this_repository() {
    let notice = std::fs::read_to_string(root().join("NOTICE")).unwrap();
    let reg = datasets::registry();
    let p = datasets::check(&reg, Some(&notice), Some(&root()));
    assert!(p.is_empty(), "{p:#?}");
    let (code, out) = kshana(&[
        "bench",
        "datasets",
        "--check",
        "--root",
        root().to_str().unwrap(),
    ]);
    assert_eq!(code, 0, "{out}");
    // Every spoofing or jamming entry is for detection benchmarking only.
    for d in reg["datasets"].as_array().unwrap() {
        if !d["threat_class"].is_null() {
            assert!(d["use_limits"]
                .as_str()
                .unwrap()
                .contains("detection benchmarking only"));
        }
    }
}

#[test]
fn no_file_of_a_dataset_that_is_not_redistributed_is_in_the_tree() {
    let reg = datasets::registry();
    let list = reg["datasets"].as_array().unwrap();
    let claimed: Vec<&str> = list
        .iter()
        .filter(|d| d["in_repository"] == true)
        .filter_map(|d| d["fetch"].as_str())
        .collect();
    let names: Vec<&str> = list
        .iter()
        .filter(|d| d["in_repository"] == false)
        .flat_map(|d| d["files"].as_array().into_iter().flatten())
        .filter_map(Value::as_str)
        .collect();
    assert!(names.contains(&"ds1.bin") && names.contains(&"GNSS_DATASET_JAMMING_SPOOFING.tar.gz"));
    fn walk(dir: &Path, out: &mut Vec<PathBuf>) {
        for e in std::fs::read_dir(dir).into_iter().flatten().flatten() {
            let p = e.path();
            let n = e.file_name().to_string_lossy().to_string();
            if p.is_dir() {
                if !(n.starts_with('.') || n == "target" || n == "node_modules") {
                    walk(&p, out);
                }
            } else {
                out.push(p);
            }
        }
    }
    let mut files = Vec::new();
    walk(&root(), &mut files);
    let mut found = Vec::new();
    for f in files {
        let n = f.file_name().unwrap().to_string_lossy().to_string();
        if names.contains(&n.as_str()) {
            let rel = f
                .strip_prefix(root())
                .unwrap()
                .to_string_lossy()
                .replace('\\', "/");
            if !claimed.iter().any(|c| c.contains(&rel)) {
                found.push(rel);
            }
        }
    }
    assert!(found.is_empty(), "dataset files in the tree: {found:?}");
}

#[test]
fn the_golden_index_matches_the_frozen_files_and_citation_ids_are_stable() {
    let idx = json(&root().join("bench/GOLDEN.json"));
    let p = cite::check_golden(&idx, &root());
    assert!(
        p.is_empty(),
        "{p:#?}\n(a frozen file changed: revise it as a new file, then `kshana bench golden --root . --out bench/GOLDEN.json` in a reviewed commit)"
    );
    let files = idx["files"].as_array().unwrap();
    assert!(files.len() >= 30);
    let mut ids = std::collections::BTreeSet::new();
    for f in files {
        if let Some(id) = f["citation_id"].as_str() {
            assert!(ids.insert(id.to_string()), "duplicate citation id {id}");
        }
    }
    // PIN-SCOPE:    the citation id of one committed result (task (c), linear, test), the stability promise itself.
    // PIN-EXCLUDES: every other field of the result file and every other result.
    let r = json(&root().join("bench/results/c-test-linear.result.json"));
    assert_eq!(
        cite::citation_id(&r).unwrap(),
        "kb-2-c-test-ddc0a64e803845a3"
    );
}

fn f_results() -> Vec<(String, Value)> {
    let mut v: Vec<(String, Value)> = std::fs::read_dir(root().join("bench/results"))
        .unwrap()
        .flatten()
        .map(|e| e.file_name().to_string_lossy().to_string())
        .filter(|n| n.starts_with("f-") && n.ends_with(".result.json"))
        .map(|n| {
            let r = json(&root().join("bench/results").join(&n));
            (n, r)
        })
        .collect();
    v.sort_by(|a, b| a.0.cmp(&b.0));
    v
}

#[test]
fn task_f_results_are_valid_and_meet_bars_f2_and_f3() {
    let rs = f_results();
    assert_eq!(rs.len(), 4, "dev and test for both baselines");
    let auc = |name: &str| {
        rs.iter().find(|(n, _)| n == name).unwrap().1["metrics"]["auc"]
            .as_f64()
            .unwrap()
    };
    for (n, r) in &rs {
        assert!(validate_result(r).is_empty(), "{n}");
        assert_eq!(r["spec_version"], "kshana-bench/2.2.0");
        assert!(r["label"].as_str().unwrap().starts_with("MODELLED"));
        assert!(r["metrics"]["n_positive"].as_u64().unwrap() > 100);
    }
    // Bars F2 and F3 (xval/bench-f/PREREGISTRATION.md), test split.
    assert!(auc("f-test-feature-z-max.result.json") >= 0.80);
    assert!(auc("f-test-diff2-var-z.result.json") >= 0.70);
}

#[test]
fn task_f_recomputes_from_the_fetched_dataset_when_present() {
    let Some(path) = std::env::var_os("KSHANA_OPSSAT_AD") else {
        eprintln!("KSHANA_OPSSAT_AD is not set: the task (f) recomputation is skipped (scripts/fetch_opssat_ad.sh)");
        return;
    };
    let f_out = temp_dir("f");
    for split in ["dev", "test"] {
        let (code, log) = kshana(&[
            "bench",
            "baseline",
            "--task",
            "f",
            "--split",
            split,
            "--data",
            path.to_str().unwrap(),
            "--out",
            f_out.to_str().unwrap(),
        ]);
        assert_eq!(code, 0, "{log}");
    }
    for (n, r) in f_results() {
        assert_eq!(json(&f_out.join(&n)), r, "{n}");
    }
    std::fs::remove_dir_all(&f_out).unwrap();
}

#[test]
fn task_f_runs_on_the_vendored_earlier_record_and_refuses_it_as_the_task_data() {
    let text = std::fs::read_to_string(root().join("tests/fixtures/opssat/dataset.csv")).unwrap();
    let segs = anomaly::f_load(&text).unwrap();
    // PIN-SCOPE:    the segment count of the vendored earlier OPSSAT-AD record (its row count).
    // PIN-EXCLUDES: every value in the file and every score.
    assert_eq!(segs.len(), 2123);
    let (_, truth) = anomaly::f_files(&segs, Split::Test).unwrap();
    let scores = anomaly::f_baseline_scores("feature-z-max", &segs, Split::Test).unwrap();
    let preds = serde_json::json!({"scores": scores});
    let (m, _) = anomaly::score_f(&truth, &preds, None).unwrap();
    let a = m["auc"].as_f64().unwrap();
    assert!(a > 0.5 && a <= 1.0, "{a}");
    // The command reads only the pinned record.
    let (code, out) = kshana(&[
        "bench",
        "cases",
        "--task",
        "f",
        "--split",
        "test",
        "--data",
        root()
            .join("tests/fixtures/opssat/dataset.csv")
            .to_str()
            .unwrap(),
        "--out",
        temp_dir("f-refuse").to_str().unwrap(),
    ]);
    assert_ne!(code, 0);
    assert!(out.contains("fetch_opssat_ad.sh"), "{out}");
}

/// A GSDC-layout directory: `n` drives with one phone each, a straight track, and a device file whose
/// WLS fix is 3 m north of the truth.
fn gsdc_dir(n: usize) -> PathBuf {
    let gsdc_root = temp_dir("g");
    let north_3m = (3.0 / 6_371_000.0f64).to_degrees();
    for i in 0..n {
        let trace_dir = gsdc_root.join(format!("2023-01-0{i}-route/phone{i}"));
        std::fs::create_dir_all(&trace_dir).unwrap();
        let mut gt = String::from(
            "MessageType,Provider,LatitudeDegrees,LongitudeDegrees,AltitudeMeters,UnixTimeMillis\n",
        );
        let mut dev = String::from("utcTimeMillis,Svid,WlsPositionXEcefMeters,WlsPositionYEcefMeters,WlsPositionZEcefMeters\n");
        for k in 0..20 {
            let (lat, lon): (f64, f64) = (37.4 + 1e-5 * k as f64, -122.1);
            let ms = 1_600_000_000_000i64 + 1000 * k;
            gt.push_str(&format!("Fix,GT,{lat},{lon},10,{ms}\n"));
            let g = kshana::frames::Geodetic {
                lat_rad: (lat + north_3m).to_radians(),
                lon_rad: lon.to_radians(),
                alt_m: 10.0,
            };
            let r = kshana::frames::geodetic_to_ecef(g);
            dev.push_str(&format!("{ms},5,{},{},{}\n", r[0], r[1], r[2]));
        }
        std::fs::write(trace_dir.join("ground_truth.csv"), gt).unwrap();
        std::fs::write(trace_dir.join("device_gnss.csv"), dev).unwrap();
    }
    gsdc_root
}

#[test]
fn task_g_runs_end_to_end_through_the_binary() {
    let gsdc_data = gsdc_dir(8);
    let g_out = temp_dir("g-out");
    let (code, log) = kshana(&[
        "bench",
        "baseline",
        "--task",
        "g",
        "--split",
        "dev",
        "--data",
        gsdc_data.to_str().unwrap(),
        "--out",
        g_out.to_str().unwrap(),
    ]);
    assert_eq!(code, 0, "{log}");
    let r = json(&g_out.join("g-dev-provided-wls.result.json"));
    assert!(validate_result(&r).is_empty());
    let m = &r["metrics"];
    // 8 traces: 2 holdout, 2 test, 4 dev by the section 4 rule.
    assert_eq!(m["n_traces"], 4);
    assert!(
        (m["gsdc_score_m"].as_f64().unwrap() - 3.0).abs() < 0.01,
        "{m}"
    );
    // A GSDC-format CSV converts to the same predictions and scores the same.
    let truth = json(&g_out.join("g-dev.truth.json"));
    let mut csv = String::from("tripId,UnixTimeMillis,LatitudeDegrees,LongitudeDegrees\n");
    for (id, eps) in truth["traces"].as_object().unwrap() {
        for e in eps.as_array().unwrap() {
            csv.push_str(&format!("{id},{},{},{}\n", e[0], e[1], e[2]));
        }
    }
    std::fs::write(g_out.join("sub.csv"), csv).unwrap();
    let p = g_out.join("sub.predictions.json");
    let (code, log) = kshana(&[
        "bench",
        "positions",
        "--task",
        "g",
        "--split",
        "dev",
        "--csv",
        g_out.join("sub.csv").to_str().unwrap(),
        "--name",
        "truth-echo",
        "--out",
        p.to_str().unwrap(),
    ]);
    assert_eq!(code, 0, "{log}");
    let res = g_out.join("echo.result.json");
    let (code, log) = kshana(&[
        "bench",
        "score",
        "--truth",
        g_out.join("g-dev.truth.json").to_str().unwrap(),
        "--predictions",
        p.to_str().unwrap(),
        "--out",
        res.to_str().unwrap(),
    ]);
    assert_eq!(code, 0, "{log}");
    assert_eq!(json(&res)["metrics"]["gsdc_score_m"], 0.0);
    let (code, log) = kshana(&["bench", "cite", res.to_str().unwrap()]);
    assert_eq!(code, 0, "{log}");
    assert!(log.contains("kb-2-g-dev-"), "{log}");
    let page = g_out.join("board.html");
    let (code, log) = kshana(&[
        "bench",
        "leaderboard",
        g_out.to_str().unwrap(),
        "--out",
        page.to_str().unwrap(),
    ]);
    assert_eq!(code, 0, "{log}");
    let html = std::fs::read_to_string(&page).unwrap();
    assert!(html.contains("Task (g)") && html.contains("truth-echo"));
    // The holdout of task (f) is refused; task (g) has a holdout split of traces.
    let (code, _) = kshana(&[
        "bench",
        "truth",
        "--task",
        "g",
        "--split",
        "holdout",
        "--data",
        gsdc_data.to_str().unwrap(),
        "--out",
        g_out.join("h.json").to_str().unwrap(),
    ]);
    assert_eq!(code, 0);
    std::fs::remove_dir_all(&gsdc_data).unwrap();
    std::fs::remove_dir_all(&g_out).unwrap();
}
