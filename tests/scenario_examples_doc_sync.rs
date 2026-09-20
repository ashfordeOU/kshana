//! Every built-in scenario kind must ship a runnable example.
//!
//! WHY
//!   An enumeration of the 59 kinds against the bundled `scenarios/` directory found
//!   five kinds with no file at all, and four of the five were capabilities this
//!   programme had just built: the Fisher-information station covariance that removes a
//!   published paper's modelled link, the campaign-driven Helmert datum, the datum from
//!   real archived laser ranging, and the independent estimator that arbitrates another
//!   paper's observability threshold. The engine gained the capabilities the papers
//!   depend on and left a reader no way to run any of them by example.
//!
//!   Documentation describes a capability; a scenario file *is* one. The difference
//!   matters to anyone trying to believe a number: a bundled file can be run, diffed and
//!   pointed at, and it is the unit an arXiv package can ship beside a manuscript.
//!
//!   This is the enumeration itself, wired as a gate, so a new kind cannot be added
//!   without an example. It is deliberately a coverage test and not a content test: it
//!   asserts that every kind is reachable from a bundled document, nothing about what
//!   that document contains.

use std::collections::{BTreeMap, BTreeSet};

/// Read every bundled `.toml` and map it to the kind it classifies as.
fn bundled_examples() -> BTreeMap<String, Vec<String>> {
    let mut by_kind: BTreeMap<String, Vec<String>> = BTreeMap::new();
    let dir = std::fs::read_dir("scenarios").expect("scenarios/ must exist");
    let mut paths: Vec<std::path::PathBuf> = dir
        .flatten()
        .map(|e| e.path())
        .filter(|p| p.extension().and_then(|s| s.to_str()) == Some("toml"))
        .collect();
    paths.sort();
    for p in paths {
        let src = std::fs::read_to_string(&p).expect("readable scenario");
        // An unparseable or unknown-kind document is a separate failure, reported by
        // name rather than silently skipped — that silence is what this campaign's
        // other findings kept turning out to be.
        let kind = kshana::api::ScenarioKind::classify(&src).unwrap_or_else(|e| {
            panic!("{} does not classify: {e}", p.display());
        });
        by_kind
            .entry(kind.as_str().to_string())
            .or_default()
            .push(p.file_name().unwrap().to_string_lossy().into_owned());
    }
    by_kind
}

#[test]
fn every_scenario_kind_ships_a_runnable_example() {
    let by_kind = bundled_examples();
    let missing: Vec<&str> = kshana::api::list_scenario_kinds()
        .iter()
        .map(|m| m.name)
        .filter(|name| !by_kind.contains_key(*name))
        .collect();
    assert!(
        missing.is_empty(),
        "these scenario kinds ship no file under scenarios/, so a reader cannot run \
         them by example:\n  {}\n\nAdd one file per kind. Every one of these takes no \
         required fields, so a single `kind = \"...\"` line with a header explaining \
         what the run shows is enough.",
        missing.join("\n  ")
    );
}

#[test]
fn every_bundled_example_names_a_kind_the_engine_has() {
    // The other direction: a file naming a kind the engine dropped would sit in the
    // directory looking runnable and fail only when someone ran it. Since an unknown
    // kind is now an error rather than a silent fallback to the clock pack,
    // `bundled_examples` would already have panicked — this states the invariant so the
    // reason is in the assertion rather than in a panic message.
    let known: BTreeSet<&str> = kshana::api::list_scenario_kinds()
        .iter()
        .map(|m| m.name)
        .collect();
    for kind in bundled_examples().keys() {
        assert!(
            known.contains(kind.as_str()),
            "a bundled scenario classifies as {kind:?}, which is not a built-in kind"
        );
    }
}
