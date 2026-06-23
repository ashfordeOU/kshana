// SPDX-License-Identifier: AGPL-3.0-only
//! O6 — `study` aggregation: run a suite into one comparable artifact.
//!
//! A study runs each scenario in a suite through the existing engine
//! ([`kshana::api::run_toml`]) and aggregates the per-scenario figures of merit
//! into one JSON document plus a self-contained side-by-side comparison HTML.
//!
//! The load-bearing guarantees pinned here:
//!  * determinism — a scenario's FoMs inside the study are byte-identical to the
//!    same scenario run alone through `run_toml` (no clock, no per-study drift);
//!  * the comparison report names every scenario label and is a real table;
//!  * the honesty surface survives — a VALIDATED/MODELLED tier tag is rendered.

use kshana::suite::Suite;

/// Build a two-scenario suite from real, in-tree clock-holdover scenarios, so the
/// study exercises the actual engine path the CLI uses.
fn two_scenario_suite() -> Suite {
    let src = include_str!("fixtures/suite-min.toml");
    kshana::suite::parse_suite(src).expect("fixture suite parses")
}

/// The repo root, so `base_dir` resolves the fixture's `../../scenarios/...`
/// relative paths to the real scenario files on disk.
fn fixtures_dir() -> std::path::PathBuf {
    std::path::Path::new(env!("CARGO_MANIFEST_DIR")).join("tests/fixtures")
}

#[test]
fn html_names_both_scenarios_and_renders_a_comparison_table() {
    let suite = two_scenario_suite();
    let out = kshana::study::run_suite(&suite, &fixtures_dir()).expect("study runs");

    // The study title is surfaced.
    assert!(
        out.html.contains("Holdover comparison study"),
        "study title missing from HTML"
    );

    // Both scenario column labels appear: the explicit label and the fallback
    // (derived from the path stem when no label was given).
    assert!(
        out.html.contains("Space optical-lattice"),
        "first scenario label missing from comparison HTML"
    );
    assert!(
        out.html.contains("clock-holdover-labsr"),
        "second scenario fallback label missing from comparison HTML"
    );

    // It is an actual side-by-side table, rows = FoMs.
    assert!(out.html.contains("<table"), "no comparison table in HTML");
    assert!(out.html.contains("Holdover"), "FoM row label missing");

    // One-line summary names the count.
    assert!(
        out.summary.contains("2 scenarios"),
        "summary should report the scenario count: {}",
        out.summary
    );
}

#[test]
fn a_validation_tier_tag_is_rendered() {
    let suite = two_scenario_suite();
    let out = kshana::study::run_suite(&suite, &fixtures_dir()).expect("study runs");
    // The holdover FoMs are MODELLED; the honesty tag must survive aggregation.
    assert!(
        out.html.contains("MODELLED") || out.html.contains("VALIDATED"),
        "no VALIDATED/MODELLED validation tag in the comparison HTML"
    );
    assert!(
        out.html.contains("MODELLED"),
        "the modelled holdover tier tag must be present (honesty intact)"
    );
}

#[test]
fn per_scenario_foms_match_running_the_scenario_alone() {
    let suite = two_scenario_suite();
    let out = kshana::study::run_suite(&suite, &fixtures_dir()).expect("study runs");

    let study: serde_json::Value = serde_json::from_str(&out.json).expect("study json parses");
    let scenarios = study["scenarios"]
        .as_array()
        .expect("study json has a scenarios array");
    assert_eq!(scenarios.len(), 2);

    // Determinism: each scenario's FoM block and scenario_hash in the study must
    // equal what `run_toml` produces for that scenario in isolation.
    for (i, entry) in suite.scenarios.iter().enumerate() {
        let path = fixtures_dir().join(&entry.path);
        let src = std::fs::read_to_string(&path)
            .unwrap_or_else(|e| panic!("read {}: {e}", path.display()));
        let alone = kshana::api::run_toml(&src).expect("scenario runs alone");
        let alone_json: serde_json::Value =
            serde_json::from_str(&alone.json).expect("alone json parses");

        // scenario_hash is identical.
        assert_eq!(
            scenarios[i]["scenario_hash"], alone_json["scenario_hash"],
            "scenario_hash drift for entry {i}"
        );

        // The quantum + classical FoM blocks are byte-identical.
        assert_eq!(
            scenarios[i]["foms"]["quantum"], alone_json["quantum"]["fom"],
            "quantum FoM drift for entry {i}"
        );
        assert_eq!(
            scenarios[i]["foms"]["classical"], alone_json["classical"]["fom"],
            "classical FoM drift for entry {i}"
        );
    }
}

#[test]
fn run_suite_is_pure_and_repeatable() {
    let suite = two_scenario_suite();
    let a = kshana::study::run_suite(&suite, &fixtures_dir()).expect("first run");
    let b = kshana::study::run_suite(&suite, &fixtures_dir()).expect("second run");
    // No clock in the library: two runs are byte-identical.
    assert_eq!(a.json, b.json, "study json is not deterministic");
    assert_eq!(a.html, b.html, "study html is not deterministic");
}
