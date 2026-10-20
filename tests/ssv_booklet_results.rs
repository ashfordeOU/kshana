// SPDX-License-Identifier: AGPL-3.0-only
//! Pins the recorded verdicts of the `gnss-ssv` comparison with the ICG Space Service Volume booklet
//! (xval/gnss-ssv/RESULTS.md), the misses included, and checks that the comparison harness runs. The full re-computation
//! takes about twelve minutes in release (`cargo run --release --example ssv_booklet_check`); the recorded cells are in
//! xval/gnss-ssv/results-*.json.

use serde_json::Value;

fn load(name: &str) -> Value {
    let p = format!("{}/xval/gnss-ssv/{name}", env!("CARGO_MANIFEST_DIR"));
    serde_json::from_str(&std::fs::read_to_string(p).expect("results file")).expect("json")
}

fn met(r: &Value, bar: &str) -> bool {
    r["bars"][bar]["verdict"]["met"].as_bool().expect("verdict")
}

fn cell<'a>(r: &'a Value, bar: &str, label: &str) -> &'a Value {
    r["bars"][bar]["cells"]
        .as_array()
        .unwrap()
        .iter()
        .find(|c| c["cell"] == label)
        .unwrap_or_else(|| panic!("no cell {label}"))
}

#[test]
fn run_1_verdicts_are_pinned_misses_included() {
    let r = load("results-run1.json");
    // Run 1 predates the variant flag: the key is absent (the pre-registered angles).
    assert!(r.get("glonass_table_4_2").is_none());
    let expect = [
        ("S0", true),
        ("S1", false),
        ("S2", false),
        ("S3", false),
        ("S4", false),
        ("S5", false),
        ("S6", true),
    ];
    for (bar, want) in expect {
        assert_eq!(met(&r, bar), want, "bar {bar}");
    }
    // The miss that explains most of them: GLONASS under tables B2/B6's 20 degree angle.
    let c = cell(&r, "S1", "B4 l1 glonass >=1 %");
    assert_eq!(c["published"], 93.9);
    assert!((c["sim"].as_f64().unwrap() - 59.13).abs() < 0.01);
    assert_eq!(c["pass"], false);
    assert_eq!(r["bars"]["S0"]["verdict"]["scored_cells"], 13);
}

#[test]
fn the_glonass_table_4_2_variant_is_diagnostic_and_recorded() {
    let v = load("results-variant-glonass-table-4-2.json");
    assert_eq!(v["glonass_table_4_2"], true);
    // Under table 4.2's angles the geometry and the GEO missions agree cell for cell; the RF, HEO and lunar bars still miss.
    for (bar, want) in [
        ("S0", true),
        ("S1", true),
        ("S2", true),
        ("S3", false),
        ("S4", true),
        ("S5", false),
        ("S6", false),
    ] {
        assert_eq!(met(&v, bar), want, "variant bar {bar}");
    }
    let c = cell(&v, "S3", "B9@20 l1 gps >=1 %");
    assert_eq!(c["pass"], false);
    assert!((c["sim"].as_f64().unwrap() - 88.05).abs() < 0.01);
}

#[test]
fn the_parametric_pattern_misses_the_measured_panel_patterns() {
    let r = load("results-s7.json");
    let s7 = &r["bars"]["S7"];
    assert_eq!(s7["verdict"]["met"], false);
    assert_eq!(s7["patterns"], 20);
    assert!(s7["min_rms_db"].as_f64().unwrap() > 3.0);
}

#[test]
fn the_harness_runs_at_reduced_size_and_the_link_budget_bar_is_exact() {
    let tables = std::fs::read_to_string(format!(
        "{}/xval/gnss-ssv/booklet-tables.json",
        env!("CARGO_MANIFEST_DIR")
    ))
    .unwrap();
    // A reduced run's verdicts mean nothing, but the structure and the formula bar (S0, size independent) do.
    let r = kshana::ssv::check::run(&tables, kshana::ssv::check::Size::Reduced, false).unwrap();
    assert!(met(&r, "S0"));
    assert_eq!(r["size"], "reduced");
    for bar in ["S1", "S2", "S3", "S4", "S5", "S6"] {
        assert!(
            r["bars"][bar]["verdict"]["scored_cells"].as_u64().unwrap() > 0,
            "{bar}"
        );
    }
}
