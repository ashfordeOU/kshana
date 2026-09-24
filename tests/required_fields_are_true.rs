// SPDX-License-Identifier: AGPL-3.0-only
//! The published `required_fields` of every scenario kind must be TRUE, in both
//! directions, against the engine itself rather than against a reading of the source.
//!
//! `api::list_scenario_kinds()` is served verbatim to `--validate`, the MCP
//! `list_scenario_kinds` tool, the Python `scenario_kinds()`, the WASM playground and
//! `docs/SCENARIOS.md`, and callers are told to build documents from it and invent
//! nothing. So a missing entry is a lint that passes a document which then fails
//! (a bare `kind = "ephemeris"` did exactly that), and an extra entry is a lint that
//! rejects a document which runs. For every kind, starting from its shipped scenario
//! under `scenarios/`:
//!
//! 1. **No extra entry.** Removing any one declared required entry (every field of
//!    every alternative, for an entry such as `tle|orbit+epoch`) makes
//!    `api::run_toml` fail. These documents are rejected at
//!    deserialisation or at the first check of the run, so this half is fast.
//! 2. **No missing entry.** A document holding ONLY `kind` and the declared required
//!    entries (values copied from the shipped scenario) runs to completion. For the
//!    all-defaulted kinds that document is the bare `kind = "<name>"`.
//!
//! Plus two cheap structural checks: no field is in both lists, and every top-level
//! key a shipped scenario uses is published in one of them.

use kshana::api::{list_scenario_kinds, run_toml, ScenarioMeta};
use std::collections::BTreeMap;
use std::path::Path;

/// The first shipped scenario (by file name) for every kind, as a parsed top-level
/// table. An absent `kind` is `clock`, exactly as the classifier treats it.
fn shipped() -> BTreeMap<String, (String, toml::Table)> {
    let dir = Path::new(env!("CARGO_MANIFEST_DIR")).join("scenarios");
    let mut files: Vec<_> = std::fs::read_dir(&dir)
        .expect("read scenarios/")
        .filter_map(|e| e.ok().map(|e| e.path()))
        .filter(|p| {
            let name = p.file_name().and_then(|n| n.to_str()).unwrap_or("");
            name.ends_with(".toml") && !name.ends_with(".suite.toml")
        })
        .collect();
    files.sort();
    let mut out = BTreeMap::new();
    for path in files {
        let src = std::fs::read_to_string(&path).expect("read scenario");
        let table: toml::Table = toml::from_str(&src)
            .unwrap_or_else(|e| panic!("{} is not a TOML table: {e}", path.display()));
        let kind = table
            .get("kind")
            .and_then(|v| v.as_str())
            .unwrap_or("clock")
            .to_string();
        let name = path.file_name().unwrap().to_string_lossy().into_owned();
        out.entry(kind).or_insert((name, table));
    }
    out
}

/// A required entry is `|`-separated alternatives of `+`-joined fields (the grammar
/// `api::list_scenario_kinds` documents); a plain name is one alternative of one field.
fn alternatives(entry: &str) -> Vec<Vec<&str>> {
    entry
        .split('|')
        .map(|alt| alt.split('+').collect())
        .collect()
}

/// Every field an entry names, across all of its alternatives.
fn fields_of(entry: &str) -> Vec<&str> {
    alternatives(entry).into_iter().flatten().collect()
}

/// Every kind paired with its shipped scenario; a kind with none is itself a failure,
/// because this test cannot hold that row to anything.
fn catalogue_with_shipped() -> Vec<(ScenarioMeta, String, toml::Table)> {
    let mut shipped = shipped();
    list_scenario_kinds()
        .into_iter()
        .map(|m| {
            let (file, table) = shipped.remove(m.name).unwrap_or_else(|| {
                panic!(
                    "kind `{}` has no shipped scenario under scenarios/ to check its required fields against",
                    m.name
                )
            });
            (m, file, table)
        })
        .collect()
}

/// Run `f` over every item on its own thread; a few kinds take seconds each in a debug
/// build and they are independent. Returns every failure message, not just the first.
fn par_failures<T: Sync>(items: &[T], f: impl Fn(&T) -> Option<String> + Sync) -> Vec<String> {
    std::thread::scope(|s| {
        let handles: Vec<_> = items.iter().map(|it| s.spawn(|| f(it))).collect();
        handles
            .into_iter()
            .filter_map(|h| h.join().unwrap_or_else(|_| Some("a check panicked".into())))
            .collect()
    })
}

#[test]
fn every_declared_required_field_is_really_required() {
    let cases = catalogue_with_shipped();
    let mut work = Vec::new();
    for (m, file, table) in &cases {
        for entry in m.required_fields {
            work.push((m.name, file.as_str(), table, *entry));
        }
    }
    let failures = par_failures(&work, |(kind, file, table, entry)| {
        let mut doc = (*table).clone();
        let mut removed_any = false;
        for f in fields_of(entry) {
            removed_any |= doc.remove(f).is_some();
        }
        if !removed_any {
            return Some(format!(
                "{kind}: required entry `{entry}` is absent from {file}, yet that scenario is shipped as runnable"
            ));
        }
        let src = toml::to_string(&doc).expect("re-serialise scenario");
        match run_toml(&src) {
            Ok(_) => Some(format!(
                "{kind}: `{entry}` is published as required, but {file} without it still runs"
            )),
            Err(_) => None,
        }
    });
    assert!(failures.is_empty(), "{}", failures.join("\n"));
}

#[test]
fn a_document_of_only_the_declared_required_fields_runs() {
    let cases = catalogue_with_shipped();
    let failures = par_failures(&cases, |(m, file, table)| {
        let mut doc = toml::Table::new();
        if let Some(kind) = table.get("kind") {
            doc.insert("kind".into(), kind.clone());
        }
        for entry in m.required_fields {
            // For an entry with alternatives, supply the first one the shipped file
            // uses in full — every field it joins.
            let Some(alt) = alternatives(entry)
                .into_iter()
                .find(|alt| alt.iter().all(|f| table.contains_key(*f)))
            else {
                return Some(format!("{}: {file} has no value for `{entry}`", m.name));
            };
            for f in alt {
                doc.insert(f.to_string(), table[f].clone());
            }
        }
        let src = toml::to_string(&doc).expect("serialise minimal scenario");
        match run_toml(&src) {
            Ok(_) => None,
            Err(e) => Some(format!(
                "{}: a document of only `kind` + the published required fields {:?} does not run — \
                 the published contract is missing a field: {e}\n--- document ---\n{src}",
                m.name, m.required_fields
            )),
        }
    });
    assert!(failures.is_empty(), "{}", failures.join("\n\n"));
}

#[test]
fn required_and_optional_are_disjoint_and_cover_every_shipped_key() {
    let mut problems = Vec::new();
    for (m, file, table) in catalogue_with_shipped() {
        let required: Vec<&str> = m
            .required_fields
            .iter()
            .flat_map(|e| fields_of(e))
            .collect();
        for f in &required {
            if m.optional_fields.contains(f) {
                problems.push(format!("{}: `{f}` is both required and optional", m.name));
            }
        }
        for key in table.keys() {
            let k = key.as_str();
            if k != "kind" && !required.contains(&k) && !m.optional_fields.contains(&k) {
                problems.push(format!(
                    "{}: {file} sets top-level `{k}`, which neither field list publishes",
                    m.name
                ));
            }
        }
    }
    assert!(problems.is_empty(), "{}", problems.join("\n"));
}
