// SPDX-License-Identifier: AGPL-3.0-only
//! The private holdout of tasks (f) and (g) (owner decision of 20 November 2026; spec section 4).
//!
//! Tasks (f) and (g) use public data, so their public splits cannot hide anything. A **private
//! holdout** adds a split that is never in this repository: the owner keeps a truth file of
//! cases that are not public (for task (f) further labelled housekeeping segments, for task (g)
//! phone traces with ground truth), and the repository holds only its SHA-256 in
//! `bench/holdout/PRIVATE.json`. Scoring reads the truth at run time from a path given on the
//! command line or in an environment variable (`KSHANA_BENCH_HOLDOUT_F`, `KSHANA_BENCH_HOLDOUT_G`),
//! checks its SHA-256 against the registry, scores it with the same metric code as the public
//! splits, and marks the result `holdout.private`. The leaderboard accepts a task (f) or (g)
//! holdout result only when it carries that mark and a registered truth hash, and labels it.
//!
//! * [`truth_f`] and [`truth_g`] build the cases and truth files of a private holdout from the
//!   owner's private data (every segment or trace in it is holdout), and refuse to write them
//!   inside this repository.
//! * [`entry`] is the registry entry the owner commits (task, SHA-256, number of cases): only that.
//! * [`score_private`] scores predictions against the private truth.
//!
//! What this protects against: tuning on the evaluation cases, because they are never published.
//! What it does not: a leak by whoever holds the file, and the owner's own choice of cases. A
//! private holdout is scored by the owner or an operator they name (spec section 4).

use super::{err, BenchError, Split, TRUTH_SCHEMA};
use serde_json::{json, Value};
use sha2::{Digest, Sha256};
use std::path::Path;

/// The registry committed to the repository.
pub const REGISTRY: &str = include_str!("../../bench/holdout/PRIVATE.json");
/// Schema of the registry.
pub const REGISTRY_SCHEMA: &str = "kshana-bench-private-holdouts/1";
/// Tasks with a private holdout.
pub const TASKS: [&str; 2] = ["f", "g"];

/// The environment variable that names a task's private truth file.
pub fn env_var(task: &str) -> String {
    format!("KSHANA_BENCH_HOLDOUT_{}", task.to_ascii_uppercase())
}

fn sha256_hex(b: &[u8]) -> String {
    hex::encode(Sha256::digest(b))
}

/// The registered truth hashes of `task` in a registry text.
pub fn registered(registry: &str, task: &str) -> Vec<String> {
    let v: Value = serde_json::from_str(registry).unwrap_or(Value::Null);
    v["holdouts"]
        .as_array()
        .map(|a| {
            a.iter()
                .filter(|e| e["task"].as_str() == Some(task))
                .filter_map(|e| e["truth_sha256"].as_str().map(|s| s.to_ascii_lowercase()))
                .collect()
        })
        .unwrap_or_default()
}

/// Whether `dir` is inside a kshana checkout (an ancestor holds `bench/SPEC.md`).
pub fn inside_repository(dir: &Path) -> bool {
    // The directory may not exist yet: test its nearest existing ancestor, resolved.
    let existing = dir.ancestors().find(|a| a.exists()).unwrap_or(dir);
    let start = std::fs::canonicalize(existing).unwrap_or_else(|_| existing.to_path_buf());
    start.ancestors().any(|a| a.join("bench/SPEC.md").is_file())
}

/// Cases and truth of a private task (f) holdout from the owner's segments (OPS-SAT-AD layout):
/// every segment is holdout, and the dataset hash is the private file's.
pub fn truth_f(csv_text: &str) -> Result<(Value, Value), BenchError> {
    let segs = super::anomaly::f_load(csv_text)?;
    let (mut cases, mut truth) = super::anomaly::f_files_all_as(&segs, Split::Holdout);
    let h = sha256_hex(csv_text.as_bytes());
    cases["dataset_sha256"] = json!(h);
    truth["dataset_sha256"] = json!(h);
    cases["private_holdout"] = json!(true);
    truth["private_holdout"] = json!(true);
    Ok((cases, truth))
}

/// Truth of a private task (g) holdout from the owner's traces (`<drive>/<phone>/ground_truth.csv`
/// under `root`): every trace is holdout.
pub fn truth_g(root: &Path) -> Result<Value, BenchError> {
    let traces = super::smartphone::g_load_all(root)?;
    let mut t = super::smartphone::g_truth_json(&traces, Split::Holdout);
    t["private_holdout"] = json!(true);
    Ok(t)
}

/// The registry entry for a private truth text: task, SHA-256 and number of cases. Refuses a
/// truth that is not a task (f) or (g) holdout truth.
pub fn entry(truth_text: &str) -> Result<Value, BenchError> {
    let t: Value = serde_json::from_str(truth_text)
        .map_err(|e| BenchError(crate::t!("bench-truth-is-not-json", e = e)))?;
    let task = t["task"].as_str().unwrap_or("");
    if t["schema"].as_str() != Some(TRUTH_SCHEMA)
        || !TASKS.contains(&task)
        || t["split"].as_str() != Some("holdout")
    {
        return err(crate::t!("bench-holdout-not-a-private-truth"));
    }
    let n = match task {
        "f" => t["labels"].as_array().map_or(0, Vec::len),
        _ => t["traces"].as_object().map_or(0, |o| o.len()),
    };
    Ok(json!({
        "task": task,
        "truth_sha256": sha256_hex(truth_text.as_bytes()),
        "cases": n,
        "spec_version": t["spec_version"],
    }))
}

/// Score predictions against a private truth: the truth's SHA-256 must be registered for its
/// task in `registry`. The result is the ordinary result file with `holdout.private` set.
pub fn score_private(
    registry: &str,
    truth_text: &str,
    predictions_text: &str,
) -> Result<Value, BenchError> {
    let e = entry(truth_text)?;
    let task = e["task"].as_str().unwrap_or("");
    let h = e["truth_sha256"].as_str().unwrap_or("");
    if !registered(registry, task).iter().any(|r| r == h) {
        return err(crate::t!(
            "bench-holdout-not-registered",
            task = task,
            sha = h
        ));
    }
    let text = super::score(truth_text, predictions_text, None)?;
    let mut r: Value = serde_json::from_str(&text).map_err(|e| BenchError(e.to_string()))?;
    r["holdout"] = json!({"private": true, "registry": "bench/holdout/PRIVATE.json"});
    Ok(r)
}

/// Whether a result is an acceptable private-holdout result against `registry`: task (f) or
/// (g), split holdout, marked private and scored on a registered truth.
pub fn accepted(registry: &str, r: &Value) -> bool {
    let task = r["task"].as_str().unwrap_or("");
    TASKS.contains(&task)
        && r["split"] == "holdout"
        && r["holdout"]["private"] == true
        && r["truth_sha256"].as_str().is_some_and(|h| {
            registered(registry, task)
                .iter()
                .any(|x| x == &h.to_ascii_lowercase())
        })
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn the_committed_registry_parses_and_holds_no_data() {
        let v: Value = serde_json::from_str(REGISTRY).unwrap();
        assert_eq!(v["schema"], REGISTRY_SCHEMA);
        for e in v["holdouts"].as_array().unwrap() {
            let keys: Vec<&String> = e.as_object().unwrap().keys().collect();
            for k in keys {
                assert!(
                    [
                        "task",
                        "truth_sha256",
                        "cases",
                        "spec_version",
                        "registered"
                    ]
                    .contains(&k.as_str()),
                    "{k}"
                );
            }
        }
    }

    #[test]
    fn env_var_names() {
        assert_eq!(env_var("f"), "KSHANA_BENCH_HOLDOUT_F");
        assert_eq!(env_var("g"), "KSHANA_BENCH_HOLDOUT_G");
    }
}
