// SPDX-License-Identifier: AGPL-3.0-only
//! `kshana::api::HEADLINE_FIELDS` names only kinds the dispatcher has and fields a bundled
//! scenario of that kind really carries.

use kshana::api::{field_importance_json, list_scenario_kinds, HEADLINE_FIELDS};
use std::collections::{BTreeMap, BTreeSet};

/// Every value found at `path` (dotted; `name[]` descends into each element of an array of
/// tables) in `v`.
fn found(v: &toml::Value, path: &str) -> bool {
    let Some((head, rest)) = path.split_once('.') else {
        let (name, array) = match path.strip_suffix("[]") {
            Some(n) => (n, true),
            None => (path, false),
        };
        return match v.get(name) {
            Some(x) => !array || x.as_array().is_some_and(|a| !a.is_empty()),
            None => false,
        };
    };
    let (name, array) = match head.strip_suffix("[]") {
        Some(n) => (n, true),
        None => (head, false),
    };
    match v.get(name) {
        Some(x) if array => x
            .as_array()
            .is_some_and(|a| a.iter().any(|e| found(e, rest))),
        Some(x) => found(x, rest),
        None => false,
    }
}

/// The bundled scenarios of each kind, parsed. A campaign's member scenarios are searched too,
/// because a kind such as `campaign` carries its fields inside `phases[].runs[].scenario`.
fn bundled() -> BTreeMap<String, Vec<toml::Value>> {
    let mut out: BTreeMap<String, Vec<toml::Value>> = BTreeMap::new();
    let dir = concat!(env!("CARGO_MANIFEST_DIR"), "/scenarios");
    for e in std::fs::read_dir(dir).unwrap() {
        let p = e.unwrap().path();
        if p.extension().and_then(|x| x.to_str()) != Some("toml") {
            continue;
        }
        let Ok(v) = std::fs::read_to_string(&p).unwrap().parse::<toml::Value>() else {
            continue;
        };
        if let Some(k) = v.get("kind").and_then(|k| k.as_str()) {
            out.entry(k.to_string()).or_default().push(v);
        }
    }
    out
}

#[test]
fn every_kind_is_dispatchable_and_every_path_listed_once() {
    let kinds: BTreeSet<&str> = list_scenario_kinds().iter().map(|m| m.name).collect();
    let mut seen_kind = BTreeSet::new();
    for (kind, paths) in HEADLINE_FIELDS {
        assert!(kinds.contains(kind), "`{kind}` is not a scenario kind");
        assert!(seen_kind.insert(*kind), "`{kind}` is listed twice");
        let mut seen = BTreeSet::new();
        for p in *paths {
            assert!(seen.insert(*p), "`{kind}`: `{p}` is listed twice");
        }
    }
}

#[test]
fn every_path_exists_in_a_bundled_scenario_of_its_kind() {
    let files = bundled();
    for (kind, paths) in HEADLINE_FIELDS {
        let docs = files
            .get(*kind)
            .unwrap_or_else(|| panic!("no bundled scenario has kind `{kind}`"));
        for p in *paths {
            assert!(
                docs.iter().any(|d| found(d, p)),
                "`{kind}`: `{p}` is in none of its {} bundled scenario(s)",
                docs.len()
            );
        }
    }
}

#[test]
fn the_json_is_the_table() {
    let v: serde_json::Value = serde_json::from_str(&field_importance_json()).unwrap();
    let o = v.as_object().unwrap();
    assert_eq!(o.len(), HEADLINE_FIELDS.len());
    for (kind, paths) in HEADLINE_FIELDS {
        let got: Vec<&str> = o[*kind]["headline"]
            .as_array()
            .unwrap()
            .iter()
            .map(|x| x.as_str().unwrap())
            .collect();
        assert_eq!(&got, paths);
    }
}
