// SPDX-License-Identifier: AGPL-3.0-only
//! The station time laboratory: the optional `[time_lab]` block of `lunar-time-budget`.
//!
//! MODELLED throughout. What these tests check:
//!
//! * additivity: a run with the block emits exactly the document a run without it emits, plus
//!   the `time_lab` object and its own `units` entries, and the default run does not carry it;
//! * the free-running clock term is the budget's clock term (checked in the module's own unit
//!   test, to the bit) and the bisected time to threshold matches the closed form here, end to
//!   end through the scenario;
//! * the clock ordering optical < PHM < RAFS < miniRAFS, over the span where it holds in this
//!   model, and the disclosed point where it stops holding;
//! * every numeric field of the block has a unit and a provenance class.

use kshana::api::run_toml;
use kshana::clock_specs::{x_clock_s, LunarClock};
use kshana::field_schema::audit_document;
use kshana::lunar_time_lab::{TimeLabInput, TERM_NAMES};
use serde_json::Value;

const EXAMPLE: &str = "scenarios/lunar-station-time-lab.toml";

fn run(src: &str) -> Value {
    serde_json::from_str(&run_toml(src).expect("runs").json).expect("json")
}

/// The document without RM-04's trailing `figure_tiers` block, which lists the time lab's
/// own figures too: additivity is about the scenario document, the block is pinned apart.
fn run_untiered(src: &str) -> Value {
    let json = run_toml(src).expect("runs").json;
    let json = kshana::api::without_figure_tiers(&json).unwrap_or(json);
    serde_json::from_str(&json).expect("json")
}

#[test]
fn the_block_is_additive() {
    let base = run_untiered("kind = \"lunar-time-budget\"\n");
    assert!(base.get("time_lab").is_none());
    assert!(base["units"]
        .as_object()
        .unwrap()
        .keys()
        .all(|k| !k.starts_with("time_lab")));

    let mut with =
        run_untiered("kind = \"lunar-time-budget\"\n[time_lab]\nclock = \"mini-rafs\"\n");
    assert!(with.get("time_lab").is_some());
    with.as_object_mut().unwrap().remove("time_lab");
    with["units"]
        .as_object_mut()
        .unwrap()
        .retain(|k, _| !k.starts_with("time_lab"));
    assert_eq!(
        base, with,
        "the block changed a field outside its own object"
    );

    // The long-form table and the default summary are untouched too.
    let a = run_toml("kind = \"lunar-time-budget\"\n").unwrap();
    let b = run_toml("kind = \"lunar-time-budget\"\n[time_lab]\n").unwrap();
    assert_eq!(a.csv, b.csv);
    assert!(b.summary.starts_with(&a.summary));
}

#[test]
fn the_example_runs_and_reports_the_three_thresholds() {
    let src = std::fs::read_to_string(EXAMPLE).unwrap();
    let v = run(&src);
    let lab = &v["time_lab"];
    assert_eq!(lab["clock"], "mini-rafs");
    assert!(lab["label"].as_str().unwrap().contains("MODELLED"));
    assert!(lab["source_statement"]
        .as_str()
        .unwrap()
        .contains("not a claim"));
    let thr: Vec<f64> = lab["time_to_threshold"]
        .as_array()
        .unwrap()
        .iter()
        .map(|r| r["threshold_ns"].as_f64().unwrap())
        .collect();
    assert_eq!(thr, vec![1.0, 10.0, 100.0]);
    let n = lab["t_s"].as_array().unwrap().len();
    assert_eq!(lab["x_total_ns"].as_array().unwrap().len(), n);
    for (k, t) in lab["terms"].as_array().unwrap().iter().enumerate() {
        assert_eq!(t["name"], TERM_NAMES[k]);
        assert_eq!(t["x_ns"].as_array().unwrap().len(), n);
    }
    for h in lab["horizons"].as_array().unwrap() {
        assert!(TERM_NAMES.contains(&h["dominant_term"].as_str().unwrap()));
    }
}

#[test]
fn time_to_threshold_matches_the_closed_form_through_the_scenario() {
    for clock in ["optical-master", "passive-h-maser", "rafs", "mini-rafs"] {
        let v = run(&format!(
            "kind = \"lunar-time-budget\"\ntau_max_s = 1e9\n[time_lab]\nclock = \"{clock}\"\n"
        ));
        let mut reached = 0;
        for row in v["time_lab"]["time_to_threshold"].as_array().unwrap() {
            if row["status"] != "reached" {
                continue;
            }
            reached += 1;
            let rel = row["closed_form_rel_diff"].as_f64().unwrap();
            assert!(rel < 1e-9, "{clock}: {row}");
        }
        assert!(reached > 0, "{clock}: no threshold reached");
    }
}

/// At every run time the clock time error is ordered optical < PHM < RAFS < miniRAFS — over
/// the span where that holds in this model. It does not hold everywhere: the PHM is modelled as
/// a pure flicker-FM floor (x grows as t) and the RAFS as pure white FM (x grows as sqrt(t)),
/// so the PHM curve overtakes the RAFS curve where 1.15e-14 t = 1e-11 sqrt(t), near 7.5e5 s
/// (8.7 days). That crossing is pinned below as a disclosed property of the single-noise-type
/// clock models, not hidden by a narrower test.
#[test]
fn clocks_are_ordered_over_the_span_where_the_model_orders_them() {
    let order = [
        LunarClock::OpticalMaster,
        LunarClock::Phm,
        LunarClock::Rafs,
        LunarClock::MiniRafs,
    ];
    let labs: Vec<_> = order
        .iter()
        .map(|c| {
            TimeLabInput {
                clock: Some(c.name().to_string()),
                ..Default::default()
            }
            .resolve()
            .unwrap()
        })
        .collect();
    let mut t = 1.0;
    while t <= 7.0e5 {
        let clocks: Vec<f64> = labs.iter().map(|l| l.terms_at_tau(t)[0]).collect();
        let totals: Vec<f64> = labs.iter().map(|l| l.total_at(t)).collect();
        for w in clocks.windows(2) {
            assert!(
                w[0] < w[1],
                "clock term out of order at t = {t}: {clocks:?}"
            );
        }
        for w in totals.windows(2) {
            assert!(w[0] <= w[1], "total out of order at t = {t}: {totals:?}");
        }
        t *= 1.1;
    }

    // The disclosed crossing of the PHM and RAFS clock curves.
    let phm = LunarClock::Phm.powerlaw();
    let rafs = LunarClock::Rafs.powerlaw();
    let d = |t: f64| x_clock_s(&phm, t) - x_clock_s(&rafs, t);
    assert!(d(7.0e5) < 0.0 && d(8.0e5) > 0.0);
}

#[test]
fn every_time_lab_field_has_a_unit() {
    for src in [
        std::fs::read_to_string(EXAMPLE).unwrap(),
        "kind = \"lunar-time-budget\"\n[time_lab]\nsteer_interval_s = 3600.0\nstation_height_sigma_m = 5.0\n"
            .to_string(),
    ] {
        let v = run(&src);
        let audit = audit_document(&v);
        assert!(audit.malformed.is_empty(), "{:?}", audit.malformed);
        assert!(
            audit.missing.is_empty(),
            "fields without units: {:?}",
            audit.missing
        );
    }
}

#[test]
fn unknown_time_lab_fields_and_clocks_are_refused() {
    assert!(run_toml("kind = \"lunar-time-budget\"\n[time_lab]\nclok = \"rafs\"\n").is_err());
    assert!(run_toml("kind = \"lunar-time-budget\"\n[time_lab]\nclock = \"sundial\"\n").is_err());
}
