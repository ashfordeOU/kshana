// SPDX-License-Identifier: AGPL-3.0-only
//! P7-G5 — the `conflict-resilience` analysis (and its §4.2 per-vector survival block)
//! must be reachable from every user surface, not only from a unit test.
//!
//! Every surface funnels through the same three public entry points:
//!
//! * `kshana::api::run_toml` — the Python `kshana.run` / `run_full`, the WASM
//!   `run_scenario`, and the MCP `run_scenario` tool all call this verbatim.
//! * `kshana::api::list_scenario_kinds` — the Python `scenario_kinds()` and the MCP
//!   `list_scenario_kinds` tool call this (via `list_scenario_kinds_json`).
//! * `kshana::api::ScenarioKind::classify` — the `validate_scenario` lint and the MCP
//!   `validate_scenario` tool call this.
//!
//! Guarding those three funnels here proves the scenario is reachable-from-binary across
//! Python, WASM and MCP with one portable test, and drift-guards it: if the scenario is
//! ever dropped from the catalogue, unwired from dispatch, or the per-vector block is
//! removed, this fails.

use kshana::api::{list_scenario_kinds, run_toml, ScenarioKind};

const SCENARIO: &str = include_str!("../scenarios/conflict-resilience.toml");

#[test]
fn run_toml_surface_reaches_the_per_vector_survival_block() {
    // This is the exact call the Python, WASM and MCP `run` paths make.
    let out = run_toml(SCENARIO).expect("conflict-resilience runs through run_toml");
    let v: serde_json::Value = serde_json::from_str(&out.json).expect("result JSON parses");
    assert_eq!(v["kind"], "conflict-resilience");

    let pvs = &v["per_vector_survival"];
    assert!(
        pvs.is_object(),
        "the run_toml surface must expose the §4.2 per_vector_survival block"
    );
    let vectors = pvs["vectors"].as_array().expect("per-vector array");
    assert_eq!(vectors.len(), 4, "jamming/spoofing/kinetic/cyber");
    assert_eq!(
        pvs["sharpest_vector"], "jamming",
        "the correlated-RF baseline's sharpest vector is jamming"
    );
    // Each vector carries the Validated closed-form ~= MC survival curve.
    for vec in vectors {
        let rows = vec["rows"].as_array().expect("survival rows");
        assert!(
            !rows.is_empty(),
            "each vector must sweep the intensity grid"
        );
        for r in rows {
            let cf = r["survival_closed_form"].as_f64().unwrap();
            let mc = r["survival_mc"].as_f64().unwrap();
            assert!(
                (cf - mc).abs() < 0.05,
                "surface MC {mc} strayed from the closed form {cf}"
            );
        }
    }
    // The human summary carried by every surface names the per-vector result.
    assert!(out.summary.contains("per-vector survival"));
    assert!(out.summary.contains("sharpest jamming"));
}

#[test]
fn catalogue_surface_lists_conflict_resilience() {
    // The Python `scenario_kinds()` and MCP `list_scenario_kinds` discovery path.
    let meta = list_scenario_kinds()
        .into_iter()
        .find(|m| m.name == "conflict-resilience")
        .expect("conflict-resilience is in the discovery catalogue");
    // The catalogue advertises the §4.2 per-vector capability so a caller can find it.
    assert!(
        meta.description.contains("per-vector"),
        "the catalogue description must advertise the per-vector survival breakdown"
    );
}

#[test]
fn classify_surface_detects_the_kind() {
    // The `validate_scenario` lint and MCP `validate_scenario` pre-flight path.
    let kind = ScenarioKind::classify(SCENARIO).expect("classifies the shipped scenario");
    assert_eq!(kind, ScenarioKind::ConflictResilience);
}
