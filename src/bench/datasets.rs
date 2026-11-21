// SPDX-License-Identifier: AGPL-3.0-only
//! The kshana-bench dataset registry (`bench/manifests/datasets.json`, compiled in): every dataset a
//! task uses or may use, with its DOI or URL, what its publisher states about its licence, whether it
//! may be redistributed, how it is fetched and checked, and the limits on its use.
//!
//! [`check`] enforces the rules the registry states: a dataset is in the repository only when its
//! licence allows redistribution and the NOTICE file names it; TEXBAT and JammerTest data are never
//! in the repository; a spoofing or jamming set is for detection benchmarking only; a fetch script
//! exists; a set wanted but not found carries its gap and no reference.

use std::collections::BTreeSet;
use std::path::Path;

use serde_json::Value;

/// The registry, compiled in so `kshana bench datasets` needs no checkout.
pub const REGISTRY: &str = include_str!("../../bench/manifests/datasets.json");

/// Schema name of the registry.
pub const REGISTRY_SCHEMA: &str = "kshana-bench-datasets/1";

/// Datasets whose data this project never redistributes, whatever their licence says.
pub const NEVER_REDISTRIBUTED: [&str; 2] = ["texbat", "jammertest-2024"];

const REDISTRIBUTION: [&str; 3] = ["allowed", "not-permitted", "not-stated"];
const ACCESS: [&str; 4] = ["fetch-script", "manual", "generated", "none"];
const STATUS: [&str; 4] = ["in-bench", "reference-only", "candidate", "wanted"];
const THREAT: [&str; 3] = ["jamming", "spoofing", "jamming-spoofing"];

/// The compiled-in registry as JSON.
pub fn registry() -> Value {
    serde_json::from_str(REGISTRY).unwrap_or(Value::Null)
}

/// Check a registry against its rules. `notice` is the text of the NOTICE file and `root` the
/// repository root; each enables the rules that need it. Returns the problems, empty when valid.
pub fn check(reg: &Value, notice: Option<&str>, root: Option<&Path>) -> Vec<String> {
    let mut p = Vec::new();
    if reg.get("schema").and_then(Value::as_str) != Some(REGISTRY_SCHEMA) {
        p.push(format!("schema must be {REGISTRY_SCHEMA}"));
    }
    let Some(list) = reg.get("datasets").and_then(Value::as_array) else {
        p.push("no datasets array".into());
        return p;
    };
    let mut ids = BTreeSet::new();
    for d in list {
        let s = |k: &str| d.get(k).and_then(Value::as_str).unwrap_or("");
        let id = s("id");
        if id.is_empty() || !ids.insert(id.to_string()) {
            p.push(format!("dataset id `{id}` is empty or repeated"));
            continue;
        }
        let mut bad = |m: &str| p.push(format!("{id}: {m}"));
        let reference = d.get("reference").and_then(Value::as_str);
        let status = s("status");
        if !STATUS.contains(&status) {
            bad("status is not one of in-bench, reference-only, candidate, wanted");
        }
        if status == "wanted" {
            if reference.is_some() || s("gap").is_empty() {
                bad("a wanted dataset has no reference and states its gap");
            }
        } else if !reference.is_some_and(|r| r.starts_with("10.") || r.starts_with("https://")) {
            bad("reference must be a DOI (10.x) or an https URL");
        }
        let redis = s("redistribution");
        if !REDISTRIBUTION.contains(&redis) {
            bad("redistribution must be allowed, not-permitted or not-stated");
        }
        if redis == "not-stated" && d.get("spdx").is_some_and(|v| !v.is_null()) {
            bad("an SPDX id is given but the redistribution terms are not stated");
        }
        if !ACCESS.contains(&s("access")) {
            bad("access must be fetch-script, manual, generated or none");
        }
        if s("publisher_licence").is_empty() || s("use_limits").is_empty() {
            bad("publisher_licence and use_limits are required");
        }
        let in_repo = d.get("in_repository").and_then(Value::as_bool);
        let extracts = d
            .get("derived_extracts_in_repository")
            .and_then(Value::as_bool)
            .unwrap_or(false);
        if in_repo.is_none() {
            bad("in_repository must be true or false");
        }
        if (in_repo == Some(true) || extracts) && redis != "allowed" {
            bad("data in the repository needs a licence that allows redistribution");
        }
        if NEVER_REDISTRIBUTED.contains(&id) && (in_repo != Some(false) || extracts) {
            bad("this dataset is never redistributed: in_repository must be false");
        }
        if in_repo == Some(true) || extracts {
            let name = d.get("notice_name").and_then(Value::as_str).unwrap_or(id);
            if let Some(n) = notice {
                if !n.contains(name) {
                    bad("data in the repository must be named in the NOTICE file");
                }
            }
        }
        let threat = d.get("threat_class").and_then(Value::as_str);
        if let Some(t) = threat {
            if !THREAT.contains(&t) {
                bad("threat_class must be jamming, spoofing or jamming-spoofing");
            }
            if !s("use_limits").contains("detection benchmarking only") {
                bad("a spoofing or jamming set is for detection benchmarking only, and use_limits says so");
            }
        }
        if s("access") == "fetch-script" {
            let f = s("fetch");
            if !f.starts_with("scripts/") {
                bad("a fetch-script dataset names its script under scripts/");
            } else if let Some(r) = root {
                if !r.join(f).is_file() {
                    bad("the fetch script does not exist");
                }
            }
        }
    }
    for must in NEVER_REDISTRIBUTED {
        if !ids.contains(must) {
            p.push(format!("{must}: must be listed (never redistributed)"));
        }
    }
    p
}

/// One line per dataset for the terminal: id, status, redistribution, SPDX or the publisher's
/// words, and the reference.
pub fn table(reg: &Value) -> Vec<String> {
    reg.get("datasets")
        .and_then(Value::as_array)
        .into_iter()
        .flatten()
        .map(|d| {
            let s = |k: &str| d.get(k).and_then(Value::as_str).unwrap_or("-");
            format!(
                "{:<32} {:<14} {:<13} {:<18} {}",
                s("id"),
                s("status"),
                s("redistribution"),
                s("spdx"),
                s("reference")
            )
        })
        .collect()
}

#[cfg(test)]
mod tests {
    use super::*;
    use serde_json::json;

    #[test]
    fn the_committed_registry_passes_its_own_rules() {
        let r = registry();
        assert_eq!(check(&r, None, None), Vec::<String>::new());
        assert!(table(&r).iter().any(|l| l.starts_with("texbat")));
    }

    #[test]
    fn each_rule_fires_on_the_entry_that_breaks_it() {
        let ok = json!({
            "id": "x", "status": "candidate", "reference": "10.1/x", "redistribution": "not-stated",
            "spdx": null, "access": "manual", "publisher_licence": "none stated",
            "use_limits": "detection benchmarking only", "in_repository": false, "threat_class": "jamming"
        });
        let reg = |e: Value| {
            json!({"schema": REGISTRY_SCHEMA, "datasets": [
                e,
                {"id": "texbat", "status": "candidate", "reference": "https://a", "redistribution": "not-permitted", "access": "manual", "publisher_licence": "p", "use_limits": "u", "in_repository": false},
                {"id": "jammertest-2024", "status": "candidate", "reference": "https://a", "redistribution": "allowed", "access": "manual", "publisher_licence": "p", "use_limits": "u", "in_repository": false}
            ]})
        };
        assert!(check(&reg(ok.clone()), None, None).is_empty());
        let with = |k: &str, v: Value| {
            let mut e = ok.clone();
            e[k] = v;
            check(&reg(e), Some("NOTICE text"), None)
        };
        assert!(!with("in_repository", json!(true)).is_empty());
        assert!(!with("use_limits", json!("any use")).is_empty());
        assert!(!with("reference", json!("ftp://x")).is_empty());
        assert!(!with("spdx", json!("MIT")).is_empty());
        assert!(!with("status", json!("wanted")).is_empty());
        assert!(!with("access", json!("fetch-script")).is_empty());
        // Allowed and in the repository, but not named in the NOTICE file.
        let mut e = ok.clone();
        e["redistribution"] = json!("allowed");
        e["in_repository"] = json!(true);
        assert!(!check(&reg(e.clone()), Some("NOTICE"), None).is_empty());
        assert!(check(&reg(e), Some("names x here"), None).is_empty());
        // TEXBAT in the repository is refused whatever else is said.
        let mut r = reg(ok);
        r["datasets"][1]["in_repository"] = json!(true);
        r["datasets"][1]["redistribution"] = json!("allowed");
        assert!(check(&r, None, None)
            .iter()
            .any(|m| m.starts_with("texbat")));
    }
}
