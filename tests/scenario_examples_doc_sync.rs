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
    let mut suites = 0usize;
    for p in paths {
        // A suite manifest (`*.suite.toml`) is run through the study path, not the
        // scenario dispatcher. It carries no `kind` key, so `classify` defaults it
        // to the clock pack and it would be counted here as a clock example that
        // `--validate` rejects with five missing required fields. tests/determinism.rs
        // already excludes them for the same reason; keep the two gates agreeing on
        // what the directory contains.
        if p.file_name()
            .is_some_and(|n| n.to_string_lossy().ends_with(".suite.toml"))
        {
            suites += 1;
            continue;
        }
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
    // An exclusion that matches nothing reads exactly like an exclusion that works.
    // scenarios/ ships one suite manifest; if it is renamed out from under this
    // filter, fail here rather than silently go back to counting it as a clock example.
    assert!(
        suites >= 1,
        "the `*.suite.toml` exclusion matched no file; scenarios/ is expected to ship \
         at least one suite manifest, so the filter is grading nothing"
    );
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

#[test]
fn every_capability_card_run_target_is_bundled_and_offered() {
    // A capability card's `run` field puts a Run button on the public site, but only if
    // the file is ALSO in the playground catalogue: web/app.js gates the button behind
    // `knownScenario(c.run)`, which searches its own SCENARIOS table. A card naming a
    // file the table does not carry renders with no button and no error — the reader
    // sees a capability described and no way to run it, which is exactly the silence
    // `every_scenario_kind_ships_a_runnable_example` exists to prevent one layer down.
    //
    // Six cards were in that state when this test was written, one of them the
    // real-laser-ranging datum, which had shipped for weeks with a dead `run`.
    //
    // Both halves matter: the catalogue entry makes the button appear, and the bundled
    // file makes it work, because the page fetches `scenarios/<file>` at run time.
    let caps_raw =
        std::fs::read_to_string("web/capabilities.json").expect("read web/capabilities.json");
    let caps: serde_json::Value = serde_json::from_str(&caps_raw).expect("parse capabilities.json");
    let cards = caps["capabilities"].as_array().expect("capabilities array");

    let app = std::fs::read_to_string("web/app.js").expect("read web/app.js");
    // The catalogue rows are `["<file>.toml", ...` — match the file in that position
    // only, so a scenario merely mentioned in a comment does not count as offered.
    let offered: BTreeSet<String> = app
        .lines()
        .filter_map(|l| l.trim().strip_prefix("[\""))
        .filter_map(|r| r.split_once("\","))
        .map(|(f, _)| f.to_string())
        .filter(|f| f.ends_with(".toml"))
        .collect();
    assert!(
        offered.len() > 40,
        "only {} catalogue entries parsed out of web/app.js — the SCENARIOS row shape \
         changed and this test is now grading nothing",
        offered.len()
    );

    let mut broken = Vec::new();
    for c in cards {
        let Some(run) = c["run"].as_str() else {
            continue;
        };
        let name = c["name"].as_str().unwrap_or("<unnamed>");
        if !std::path::Path::new("scenarios").join(run).exists() {
            broken.push(format!("{name:?} runs {run:?}, which is not in scenarios/"));
        } else if !offered.contains(run) {
            broken.push(format!(
                "{name:?} runs {run:?}, which the playground catalogue in web/app.js \
                 does not offer, so the card renders with no Run button"
            ));
        }
    }
    assert!(
        broken.is_empty(),
        "capability card(s) name a scenario the site cannot run:\n  {}",
        broken.join("\n  ")
    );
}
