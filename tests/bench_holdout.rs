// SPDX-License-Identifier: AGPL-3.0-only
//! The private holdout of kshana-bench tasks (f) and (g): truth built from private data outside the
//! repository, a registry that holds only hashes, scoring that refuses an unregistered truth, and a
//! leaderboard that accepts a task (f) or (g) holdout row only when it is private and registered.
use kshana::bench::anomaly::F_FEATURES;
use kshana::bench::holdout::*;
use kshana::bench::{validate_result, PREDICTIONS_SCHEMA};
use serde_json::{json, Value};
use std::path::PathBuf;
use std::process::Command;
use std::sync::atomic::{AtomicU64, Ordering};

fn temp_dir(tag: &str) -> PathBuf {
    static N: AtomicU64 = AtomicU64::new(0);
    let d = std::env::temp_dir().join(format!(
        "kshana-bench-holdout-{tag}-{}-{}",
        std::process::id(),
        N.fetch_add(1, Ordering::SeqCst)
    ));
    std::fs::create_dir_all(&d).unwrap();
    d
}

fn kshana(args: &[&str], env: &[(&str, &str)]) -> (i32, String) {
    let mut c = Command::new(env!("CARGO_BIN_EXE_kshana"));
    c.args(args)
        .env("KSHANA_LANG", "en")
        .env_remove("KSHANA_BENCH_HOLDOUT_F");
    for (k, v) in env {
        c.env(k, v);
    }
    let o = c.output().unwrap();
    (
        o.status.code().unwrap_or(-1),
        String::from_utf8_lossy(&o.stdout).to_string() + &String::from_utf8_lossy(&o.stderr),
    )
}

/// A private OPS-SAT-AD-layout file: 10 nominal and 4 anomalous segments (the `train` column says
/// nothing for a private holdout).
fn private_csv() -> String {
    let mut s = String::from("segment,anomaly,train,channel,sampling");
    for f in F_FEATURES {
        s.push(',');
        s.push_str(f);
    }
    s.push('\n');
    for i in 0..14 {
        let anomaly = i >= 10;
        let v = if anomaly {
            5.0 + i as f64
        } else {
            1.0 + 0.01 * i as f64
        };
        s.push_str(&format!(
            "{},{},{},CADC0884,5",
            9000 + i,
            anomaly as u8,
            i % 2
        ));
        for _ in F_FEATURES {
            s.push_str(&format!(",{v}"));
        }
        s.push('\n');
    }
    s
}

fn registry_with(task: &str, sha: &str) -> String {
    json!({"schema": REGISTRY_SCHEMA, "holdouts": [{"task": task, "truth_sha256": sha, "cases": 1}]}).to_string()
}

fn f_predictions(truth: &Value) -> String {
    let mut scores = serde_json::Map::new();
    for l in truth["labels"].as_array().unwrap() {
        let s = if l["positive"] == true { 0.9 } else { 0.1 };
        scores.insert(l["id"].as_str().unwrap().to_string(), json!(s));
    }
    json!({"schema": PREDICTIONS_SCHEMA, "task": "f", "split": "holdout",
           "system": {"name": "perfect", "version": "1"}, "scores": scores})
    .to_string()
}

#[test]
fn a_private_f_holdout_scores_only_against_a_registered_truth() {
    let (cases, truth) = truth_f(&private_csv()).unwrap();
    assert_eq!(truth["split"], "holdout");
    assert_eq!(truth["private_holdout"], true);
    assert_eq!(truth["labels"].as_array().unwrap().len(), 14);
    assert!(
        cases["cases"][0].get("positive").is_none(),
        "cases carry no label"
    );
    let text = serde_json::to_string_pretty(&truth).unwrap() + "\n";
    let e = entry(&text).unwrap();
    assert_eq!(e["task"], "f");
    assert_eq!(e["cases"], 14);
    let sha = e["truth_sha256"].as_str().unwrap().to_string();
    let reg = registry_with("f", &sha);
    let r = score_private(&reg, &text, &f_predictions(&truth)).unwrap();
    assert_eq!(r["holdout"]["private"], true);
    assert_eq!(r["split"], "holdout");
    assert_eq!(r["truth_sha256"], json!(sha));
    assert!((r["metrics"]["auc"].as_f64().unwrap() - 1.0).abs() < 1e-12);
    assert!(validate_result(&r).is_empty());
    assert!(accepted(&reg, &r));
    // Not registered, registered for another task, or a changed truth: refused.
    assert!(score_private(&registry_with("g", &sha), &text, &f_predictions(&truth)).is_err());
    assert!(score_private(REGISTRY, &text, &f_predictions(&truth)).is_err());
    let changed = text.replace("\"positive\": true", "\"positive\": false");
    assert!(score_private(&reg, &changed, &f_predictions(&truth)).is_err());
    // A public-split truth is not a private holdout truth.
    let mut public = truth.clone();
    public["split"] = json!("test");
    assert!(entry(&public.to_string()).is_err());
}

#[test]
fn the_leaderboard_refuses_an_unregistered_or_unmarked_f_g_holdout_row() {
    let (_, truth) = truth_f(&private_csv()).unwrap();
    let text = serde_json::to_string_pretty(&truth).unwrap() + "\n";
    let sha = entry(&text).unwrap()["truth_sha256"]
        .as_str()
        .unwrap()
        .to_string();
    let r = score_private(&registry_with("f", &sha), &text, &f_predictions(&truth)).unwrap();
    // The committed registry holds no entry yet, so the row is refused.
    assert!(kshana::bench::site::leaderboard_html(std::slice::from_ref(&r)).is_err());
    let mut unmarked = r.clone();
    unmarked.as_object_mut().unwrap().remove("holdout");
    assert!(!accepted(&registry_with("f", &sha), &unmarked));
    // A public-split row still renders.
    let mut public = r;
    public["split"] = json!("test");
    public.as_object_mut().unwrap().remove("holdout");
    assert!(kshana::bench::site::leaderboard_html(&[public]).is_ok());
}

#[test]
fn private_g_truth_takes_every_trace() {
    let gsdc_root = temp_dir("g");
    for i in 0..3 {
        let trace_dir = gsdc_root.join(format!("2026-11-0{i}-private/phone{i}"));
        std::fs::create_dir_all(&trace_dir).unwrap();
        let mut gt = String::from(
            "MessageType,Provider,LatitudeDegrees,LongitudeDegrees,AltitudeMeters,UnixTimeMillis\n",
        );
        for k in 0..5 {
            gt.push_str(&format!(
                "Fix,GT,{},{},10,{}\n",
                59.4 + 1e-5 * k as f64,
                24.7,
                1_700_000_000_000i64 + 1000 * k
            ));
        }
        std::fs::write(trace_dir.join("ground_truth.csv"), gt).unwrap();
    }
    let t = truth_g(&gsdc_root).unwrap();
    assert_eq!(t["split"], "holdout");
    assert_eq!(t["traces"].as_object().unwrap().len(), 3);
    let text = serde_json::to_string_pretty(&t).unwrap() + "\n";
    assert_eq!(entry(&text).unwrap()["cases"], 3);
    let _ = std::fs::remove_dir_all(&gsdc_root);
}

#[test]
fn the_command_line_keeps_private_files_out_of_the_repository() {
    let data = temp_dir("f-data").join("private.csv");
    std::fs::write(&data, private_csv()).unwrap();
    let repo_out = PathBuf::from(env!("CARGO_MANIFEST_DIR"))
        .join("target")
        .join(format!("holdout-refuse-{}", std::process::id()));
    let (code, out) = kshana(
        &[
            "bench",
            "holdout",
            "truth",
            "--task",
            "f",
            "--data",
            data.to_str().unwrap(),
            "--out",
            repo_out.to_str().unwrap(),
        ],
        &[],
    );
    assert_eq!(code, 2, "{out}");
    assert!(out.contains("inside"), "{out}");
    assert!(!repo_out.join("truth.json").exists());
    let _ = std::fs::remove_dir_all(&repo_out);
    let priv_out = temp_dir("f-out");
    let (code, out) = kshana(
        &[
            "bench",
            "holdout",
            "truth",
            "--task",
            "f",
            "--data",
            data.to_str().unwrap(),
            "--out",
            priv_out.to_str().unwrap(),
        ],
        &[],
    );
    assert_eq!(code, 0, "{out}");
    let printed: Value = serde_json::from_str(out.trim()).unwrap();
    let (code, reg) = kshana(
        &[
            "bench",
            "holdout",
            "register",
            "--truth",
            priv_out.join("truth.json").to_str().unwrap(),
        ],
        &[],
    );
    assert_eq!(code, 0);
    let reg: Value = serde_json::from_str(reg.trim()).unwrap();
    assert_eq!(reg["truth_sha256"], printed["truth_sha256"]);
    assert_eq!(reg["registered"].as_str().unwrap().len(), 10);
    // Scoring without a truth path or variable says which variable to set; with the variable
    // pointing at an unregistered truth it is refused.
    let preds = priv_out.join("p.json");
    let truth: Value =
        serde_json::from_str(&std::fs::read_to_string(priv_out.join("truth.json")).unwrap())
            .unwrap();
    std::fs::write(&preds, f_predictions(&truth)).unwrap();
    let (code, out) = kshana(
        &[
            "bench",
            "holdout",
            "score",
            "--task",
            "f",
            "--predictions",
            preds.to_str().unwrap(),
        ],
        &[],
    );
    assert_eq!(code, 2);
    assert!(out.contains("KSHANA_BENCH_HOLDOUT_F"), "{out}");
    let (code, out) = kshana(
        &[
            "bench",
            "holdout",
            "score",
            "--task",
            "f",
            "--predictions",
            preds.to_str().unwrap(),
        ],
        &[(
            "KSHANA_BENCH_HOLDOUT_F",
            priv_out.join("truth.json").to_str().unwrap(),
        )],
    );
    assert_eq!(code, 2);
    assert!(out.contains("not registered"), "{out}");
    let _ = std::fs::remove_dir_all(&priv_out);
}

/// No file in the repository has the SHA-256 of a registered private truth.
#[test]
fn no_registered_private_truth_is_in_the_tree() {
    use sha2::{Digest, Sha256};
    let reg: Value = serde_json::from_str(REGISTRY).unwrap();
    let hashes: Vec<String> = reg["holdouts"]
        .as_array()
        .unwrap()
        .iter()
        .filter_map(|e| e["truth_sha256"].as_str().map(str::to_string))
        .collect();
    if hashes.is_empty() {
        return;
    }
    let root = PathBuf::from(env!("CARGO_MANIFEST_DIR"));
    let mut stack = vec![root.clone()];
    while let Some(d) = stack.pop() {
        for e in std::fs::read_dir(&d).unwrap().flatten() {
            let p = e.path();
            let name = p.file_name().unwrap().to_string_lossy().to_string();
            if name == "target" || name == ".git" {
                continue;
            }
            if p.is_dir() {
                stack.push(p);
            } else if p.extension().is_some_and(|x| x == "json") {
                let h = hex::encode(Sha256::digest(std::fs::read(&p).unwrap()));
                assert!(
                    !hashes.contains(&h),
                    "{} is a registered private truth",
                    p.display()
                );
            }
        }
    }
}
