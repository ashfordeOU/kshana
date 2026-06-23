// SPDX-License-Identifier: AGPL-3.0-only
//! O7 — `validate_scenario` lints a scenario TOML against the existing
//! `ScenarioKind`/`ScenarioMeta` introspection BEFORE a (possibly long) run.
//!
//! It reuses the one schema the crate already publishes: it classifies the kind,
//! looks up that kind's REQUIRED top-level fields from `list_scenario_kinds()`,
//! and reports one violation per required field absent from the document. It makes
//! no new validity claims — only what the metadata already marks required — and it
//! never runs the scenario. A well-formed scenario yields an empty Vec.

use kshana::api::validate_scenario;

#[test]
fn missing_required_field_is_reported_by_name() {
    // A clock scenario (the default kind) missing its required `time` table. The
    // clock metadata marks `time` required, so the lint must flag it by name.
    let src = r#"
threshold_ns = 20.0
[gnss]
windows = [ { t0 = 0.0, t1 = 600.0, state = "denied" } ]
[clock_quantum]
id = "q"
provenance = "test"
y0 = 5.0e-17
q_wf = 1.0e-30
q_rw = 0.0
[clock_classical]
id = "c"
provenance = "test"
y0 = 5.0e-10
q_wf = 9.0e-20
q_rw = 0.0
"#;
    let violations = validate_scenario(src);
    assert!(
        !violations.is_empty(),
        "a scenario missing a required field must report at least one violation"
    );
    assert!(
        violations.iter().any(|v| v.contains("time")),
        "a violation must name the missing field `time`: {violations:?}"
    );
    // It also names the kind it classified against.
    assert!(
        violations.iter().any(|v| v.contains("clock")),
        "a violation must name the classified kind `clock`: {violations:?}"
    );
}

#[test]
fn well_formed_in_tree_scenario_has_no_violations() {
    // The shipped reference clock scenario carries every clock-required field, so a
    // conservative lint must return an empty Vec (and must NOT run the scenario).
    let src = include_str!("../scenarios/clock-holdover.toml");
    let violations = validate_scenario(src);
    assert!(
        violations.is_empty(),
        "a known-good in-tree scenario should lint clean, got: {violations:?}"
    );
}

#[test]
fn malformed_toml_is_reported() {
    // Not valid TOML at all: the parse failure must surface as a single clear
    // violation rather than a late runtime panic.
    let src = "this is = = not valid toml [[[";
    let violations = validate_scenario(src);
    assert!(
        !violations.is_empty(),
        "malformed TOML must yield at least one violation"
    );
}
