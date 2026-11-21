// SPDX-License-Identifier: AGPL-3.0-only
//! Benchmark governance: stable citation ids for result files and the golden-file index of the
//! frozen sets (`bench/GOLDEN.json`).
//!
//! A **citation id** names one scored result so a report, a tender or a paper can cite it:
//! `kb-<major>-<task>-<split>-<16 hex>`, where the hex is the start of the SHA-256 of the facts that
//! define the result (the spec major version, task, split, the SHA-256 of the truth and of the
//! predictions, the system's name and version, and for a carried result the note naming its
//! source). It holds no engine version, no date and no metric value, so the same result keeps the
//! same id across releases; a change of truth, predictions or major version gives a new id.
//!
//! The **golden index** lists every frozen file of the benchmark (split manifests, the result
//! schema, the holdout commitments and the published result files) with its size and SHA-256, and,
//! for a result, its citation id. [`check_golden`] fails when a frozen file changed, disappeared or
//! appeared without being indexed, or when a citation id would move.

use std::path::Path;

use serde_json::{json, Value};

use super::sha256_hex;

/// Schema name of the golden index.
pub const GOLDEN_SCHEMA: &str = "kshana-bench-golden/1";

/// The frozen sets: (directory under the repository root, file-name suffix).
pub const FROZEN: [(&str, &str); 5] = [
    ("bench/manifests", ".json"),
    ("bench/schema", ".json"),
    ("bench/holdout", ".json"),
    ("bench/results", ".result.json"),
    ("bench/results-v1", ".result.json"),
];

/// Files under a frozen directory that are living lists, not frozen sets: the dataset registry is
/// revised as datasets are reviewed.
pub const NOT_FROZEN: [&str; 1] = ["bench/manifests/datasets.json"];

/// The major part of a spec version: `kshana-bench/2.1.0` gives `2`.
fn major(spec: &str) -> &str {
    spec.rsplit('/')
        .next()
        .unwrap_or("")
        .split('.')
        .next()
        .unwrap_or("")
}

/// The citation id of a result file (see the module text), or `None` when the file lacks the task,
/// split or spec version.
pub fn citation_id(r: &Value) -> Option<String> {
    let s = |p: &str| r.pointer(p).and_then(Value::as_str).unwrap_or("");
    let (task, split, spec) = (s("/task"), s("/split"), s("/spec_version"));
    if task.is_empty() || split.is_empty() || major(spec).is_empty() {
        return None;
    }
    let facts = [
        "kshana-bench/cite/1",
        major(spec),
        task,
        split,
        s("/truth_sha256"),
        s("/predictions_sha256"),
        s("/system/name"),
        s("/system/version"),
        s("/provenance"),
        s("/provenance_note"),
    ]
    .join("\n");
    Some(format!(
        "kb-{}-{task}-{split}-{}",
        major(spec),
        &sha256_hex(facts.as_bytes())[..16]
    ))
}

/// One line to cite a result by: system, task, split, spec version, the primary number when the
/// task has one, and the citation id.
pub fn citation_line(r: &Value) -> Option<String> {
    let id = citation_id(r)?;
    let s = |p: &str| r.pointer(p).and_then(Value::as_str).unwrap_or("");
    let m = &r["metrics"];
    let primary = [
        ("auc", "AUC"),
        ("auc_out", "AUC out"),
        ("primary_rmse_3600_ns", "RMSE 3600 s (ns)"),
        ("gsdc_score_m", "score (m)"),
        ("balanced_accuracy", "balanced accuracy"),
    ]
    .iter()
    .find_map(|(k, name)| {
        m.get(*k)
            .and_then(Value::as_f64)
            .map(|v| format!("{name} {v:.4}"))
    })
    .unwrap_or_default();
    Some(format!(
        "{} ({}). {}, task ({}), {} split{}{}. {id}",
        s("/system/name"),
        s("/system/version"),
        s("/spec_version"),
        s("/task"),
        s("/split"),
        if primary.is_empty() { "" } else { ", " },
        primary
    ))
}

/// The frozen files under `root`, sorted, as repository-relative paths with `/` separators.
pub fn frozen_files(root: &Path) -> Vec<String> {
    let mut out = Vec::new();
    for (dir, suffix) in FROZEN {
        let Ok(rd) = std::fs::read_dir(root.join(dir)) else {
            continue;
        };
        let mut v: Vec<String> = rd
            .flatten()
            .filter(|e| e.path().is_file())
            .map(|e| e.file_name().to_string_lossy().to_string())
            .filter(|n| n.ends_with(suffix))
            .map(|n| format!("{dir}/{n}"))
            .filter(|p| !NOT_FROZEN.contains(&p.as_str()))
            .collect();
        v.sort();
        out.extend(v);
    }
    out
}

/// Build the golden index of the frozen files under `root`.
pub fn golden_index(root: &Path) -> std::io::Result<Value> {
    let mut files = Vec::new();
    for rel in frozen_files(root) {
        let bytes = std::fs::read(root.join(&rel))?;
        let mut e = json!({"path": rel, "bytes": bytes.len(), "sha256": sha256_hex(&bytes)});
        if rel.ends_with(".result.json") {
            if let Some(id) = serde_json::from_slice::<Value>(&bytes)
                .ok()
                .as_ref()
                .and_then(citation_id)
            {
                e["citation_id"] = json!(id);
            }
        }
        files.push(e);
    }
    Ok(json!({
        "schema": GOLDEN_SCHEMA,
        "rule": "Frozen files never change in place: a revision is a new file (or a new spec major version) and a new index entry, made in a reviewed commit. A citation id is derived from the result's facts, never from the engine version, so it is stable across releases.",
        "files": files,
    }))
}

/// Compare a committed golden index with the files under `root`. Returns the problems, empty when
/// every frozen file is indexed, unchanged, and keeps its citation id.
pub fn check_golden(index: &Value, root: &Path) -> Vec<String> {
    let mut p = Vec::new();
    if index.get("schema").and_then(Value::as_str) != Some(GOLDEN_SCHEMA) {
        p.push(format!("schema must be {GOLDEN_SCHEMA}"));
        return p;
    }
    let now = match golden_index(root) {
        Ok(v) => v,
        Err(e) => {
            p.push(e.to_string());
            return p;
        }
    };
    let by_path = |v: &Value| -> std::collections::BTreeMap<String, Value> {
        v["files"]
            .as_array()
            .into_iter()
            .flatten()
            .map(|f| (f["path"].as_str().unwrap_or("").to_string(), f.clone()))
            .collect()
    };
    let (want, got) = (by_path(index), by_path(&now));
    for (path, w) in &want {
        match got.get(path) {
            None => p.push(format!("{path}: frozen file is missing")),
            Some(g) => {
                if g["sha256"] != w["sha256"] {
                    p.push(format!("{path}: frozen file changed (SHA-256 differs)"));
                }
                if g.get("citation_id") != w.get("citation_id") {
                    p.push(format!("{path}: citation id moved"));
                }
            }
        }
    }
    for path in got.keys() {
        if !want.contains_key(path) {
            p.push(format!("{path}: frozen file is not in the golden index"));
        }
    }
    p
}

#[cfg(test)]
mod tests {
    use super::*;

    fn result() -> Value {
        json!({
            "schema": "kshana-bench-result/1", "spec_version": "kshana-bench/2.2.0", "task": "f",
            "split": "test", "system": {"name": "s", "version": "1"}, "provenance": "scored",
            "truth_sha256": "a".repeat(64), "predictions_sha256": "b".repeat(64),
            "metrics": {"auc": 0.9}, "label": "MODELLED", "notice": "Advisory"
        })
    }

    #[test]
    fn a_citation_id_ignores_metrics_and_minor_versions_and_moves_with_the_facts() {
        let r = result();
        let id = citation_id(&r).unwrap();
        assert!(id.starts_with("kb-2-f-test-") && id.len() == "kb-2-f-test-".len() + 16);
        let mut same = r.clone();
        same["metrics"]["auc"] = json!(0.1);
        same["spec_version"] = json!("kshana-bench/2.9.1");
        same["engine"] = json!("9.9.9");
        assert_eq!(citation_id(&same).unwrap(), id);
        for (k, v) in [
            ("/predictions_sha256", json!("c".repeat(64))),
            ("/split", json!("dev")),
            ("/spec_version", json!("kshana-bench/3.0.0")),
            ("/system/version", json!("2")),
        ] {
            let mut d = r.clone();
            *d.pointer_mut(k).unwrap() = v;
            assert_ne!(citation_id(&d).unwrap(), id, "{k}");
        }
        assert!(citation_id(&json!({})).is_none());
        let line = citation_line(&r).unwrap();
        assert!(line.contains("AUC 0.9000") && line.ends_with(&id), "{line}");
    }

    #[test]
    fn the_golden_check_names_a_changed_a_missing_and_an_unindexed_file() {
        static N: std::sync::atomic::AtomicU64 = std::sync::atomic::AtomicU64::new(0);
        let dir = std::env::temp_dir().join(format!(
            "kshana-golden-{}-{}",
            std::process::id(),
            N.fetch_add(1, std::sync::atomic::Ordering::SeqCst)
        ));
        let res = dir.join("bench/results");
        std::fs::create_dir_all(&res).unwrap();
        std::fs::write(res.join("x.result.json"), result().to_string()).unwrap();
        std::fs::write(res.join("notes.txt"), "not frozen").unwrap();
        let idx = golden_index(&dir).unwrap();
        assert_eq!(idx["files"].as_array().unwrap().len(), 1);
        assert!(idx["files"][0]["citation_id"].is_string());
        assert!(check_golden(&idx, &dir).is_empty());
        std::fs::write(res.join("x.result.json"), "{}").unwrap();
        std::fs::write(res.join("y.result.json"), "{}").unwrap();
        let p = check_golden(&idx, &dir);
        assert!(p
            .iter()
            .any(|m| m.contains("x.result.json: frozen file changed")));
        assert!(p.iter().any(|m| m.contains("citation id moved")));
        assert!(p
            .iter()
            .any(|m| m.contains("y.result.json: frozen file is not in")));
        std::fs::remove_file(res.join("x.result.json")).unwrap();
        assert!(check_golden(&idx, &dir)
            .iter()
            .any(|m| m.contains("is missing")));
        std::fs::remove_dir_all(&dir).unwrap();
    }
}
