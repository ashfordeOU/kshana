// SPDX-License-Identifier: AGPL-3.0-only
//! O5 — scenario-suite manifest parser.
//!
//! A *suite* is a named set of scenarios run together into one aggregated,
//! comparable study artifact. These tests pin the manifest shape: a `title`, an
//! optional `description`, and a `scenarios` array that mixes plain path strings
//! with `{ path, label }` tables. A missing/empty `scenarios` or a missing `title`
//! is a clear error, not a silent empty study.

use kshana::suite::parse_suite;

#[test]
fn parses_a_two_scenario_suite_with_title_and_mixed_entries() {
    let src = include_str!("fixtures/suite-min.toml");
    let suite = parse_suite(src).expect("the minimal suite fixture parses");

    assert_eq!(suite.title, "Holdover comparison study");
    assert_eq!(
        suite.description.as_deref(),
        Some("Optical-lattice vs lab-Sr clock holdover, side by side.")
    );

    // Two entries, in manifest order.
    assert_eq!(suite.scenarios.len(), 2);

    // First entry came from a `{ path, label }` table.
    assert_eq!(
        suite.scenarios[0].path,
        "../../scenarios/clock-holdover.toml"
    );
    assert_eq!(
        suite.scenarios[0].label.as_deref(),
        Some("Space optical-lattice")
    );

    // Second entry came from a bare path string: a path, no label.
    assert_eq!(
        suite.scenarios[1].path,
        "../../scenarios/clock-holdover-labsr.toml"
    );
    assert_eq!(suite.scenarios[1].label, None);
}

#[test]
fn missing_scenarios_key_is_a_helpful_error() {
    let src = r#"title = "Study with no scenarios""#;
    let err = parse_suite(src).expect_err("a manifest with no scenarios must be rejected");
    assert!(
        err.to_lowercase().contains("scenarios"),
        "error should name the missing `scenarios` key: {err}"
    );
}

#[test]
fn empty_scenarios_array_is_a_helpful_error() {
    let src = "title = \"Empty\"\nscenarios = []\n";
    let err = parse_suite(src).expect_err("an empty scenarios array must be rejected");
    assert!(
        err.to_lowercase().contains("scenarios"),
        "error should name the empty `scenarios` key: {err}"
    );
}

#[test]
fn missing_title_is_a_helpful_error() {
    let src = "scenarios = [\"a.toml\"]\n";
    let err = parse_suite(src).expect_err("a manifest with no title must be rejected");
    assert!(
        err.to_lowercase().contains("title"),
        "error should name the missing `title` key: {err}"
    );
}
