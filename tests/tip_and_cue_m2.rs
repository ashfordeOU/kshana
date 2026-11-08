// SPDX-License-Identifier: AGPL-3.0-only
//! M2 (revisit and tip-and-cue latency): bar M2-B0 of
//! `docs/design/evidence/m2-revisit-tip-and-cue/PREREGISTRATION.md`.
//!
//! The independent oracle (`xval/m2-revisit-tip-and-cue/oracle.py`, numpy only, written from the
//! readings before the planner code) lists the access intervals of the 16-satellite RF layer at
//! the ten M1 points over the first 24 h; its output is committed as `oracle_b0.json`. The engine's
//! per-satellite and merged intervals must have the same counts, and every start and end must agree
//! to within one step (10 s).

use kshana::tip_and_cue::{merged_access, satellite_access, Field, Grid, Layer};
use serde_json::Value;

const ORACLE: &str = include_str!("../xval/m2-revisit-tip-and-cue/oracle_b0.json");

fn intervals(v: &Value) -> Vec<[f64; 2]> {
    v.as_array()
        .unwrap()
        .iter()
        .map(|iv| [iv[0].as_f64().unwrap(), iv[1].as_f64().unwrap()])
        .collect()
}

fn agree(eng: &[[u32; 2]], ora: &[[f64; 2]], what: &str) -> f64 {
    assert_eq!(eng.len(), ora.len(), "{what}: interval count");
    let mut worst = 0.0f64;
    for (e, o) in eng.iter().zip(ora) {
        for k in 0..2 {
            worst = worst.max((f64::from(e[k]) - o[k]).abs());
        }
    }
    assert!(worst <= 10.0, "{what}: worst difference {worst} s");
    worst
}

#[test]
fn b0_access_intervals_match_the_independent_oracle() {
    let o: Value = serde_json::from_str(ORACLE).unwrap();
    let pts: Vec<(f64, f64)> = o["points"]
        .as_array()
        .unwrap()
        .iter()
        .map(|p| (p["lat"].as_f64().unwrap(), p["lon"].as_f64().unwrap()))
        .collect();
    assert_eq!(pts.len(), 10);
    let els = Layer {
        total: 16,
        planes: 8,
        phasing: 1,
        node_offset: 0.0,
    }
    .elements()
    .unwrap();
    let grid = Grid {
        step_s: 10,
        span_s: 86_400,
    };
    let field = Field::Elevation(10.0);
    let merged = merged_access(&els, field, &pts, grid, None);
    let per_sat = satellite_access(&els, field, &pts, grid);
    let (mut worst, mut n) = (0.0f64, 0usize);
    for (i, p) in o["points"].as_array().unwrap().iter().enumerate() {
        worst = worst.max(agree(
            &merged[i],
            &intervals(&p["merged"]),
            &format!("P{} merged", i + 1),
        ));
        n += merged[i].len();
        for (s, ora) in p["per_satellite"].as_array().unwrap().iter().enumerate() {
            worst = worst.max(agree(
                &per_sat[i][s],
                &intervals(ora),
                &format!("P{} sat {s}", i + 1),
            ));
            n += per_sat[i][s].len();
        }
    }
    // M2-B0 MET: the counts are equal and every start and end is within one step.
    eprintln!("M2-B0: {n} intervals, worst difference {worst} s");
    assert!(n > 1_000);
}

const RESULT: &str = include_str!("../xval/m2-revisit-tip-and-cue/m2_result.json");

/// Minutes of a figure of a case in the committed run.
fn minutes(doc: &Value, case: &str, fig: &str) -> f64 {
    doc["cases"]
        .as_array()
        .unwrap()
        .iter()
        .find(|c| c["case"]["name"] == case)
        .unwrap_or_else(|| panic!("{case}"))[fig]["value_s"]
        .as_f64()
        .unwrap()
        / 60.0
}

/// M2-B1 and M2-B2 as recorded in `docs/design/evidence/m2-revisit-tip-and-cue/RESULTS.md`, from the
/// committed run (`cargo run --release --example m2_tip_and_cue`). The windows are the signed bars;
/// each verdict below is asserted as found, misses included.
#[test]
fn b1_and_b2_verdicts_are_the_recorded_ones() {
    let d: Value = serde_json::from_str(RESULT).unwrap();
    assert_eq!(d["points"], 996);
    let within = |v: f64, published: f64, tol: f64| (v - published).abs() <= tol * published;
    // (figure, published 16, published 32, consistent 16, consistent 32)
    for (fig, p16, p32, c16, c32) in [
        ("revisit", 20.0, 10.0, true, false),
        ("full_refresh", 39.0, 18.0, false, false),
        ("reaction", 15.0, 7.0, false, false),
    ] {
        let k16 = minutes(&d, "primary-16", fig);
        let k32 = minutes(&d, "primary-32", fig);
        assert_eq!(
            within(k16, p16, 0.25),
            c16,
            "B1 {fig} 16: {k16:.2} min vs {p16}"
        );
        assert_eq!(
            within(k32, p32, 0.25),
            c32,
            "B1 {fig} 32: {k32:.2} min vs {p32}"
        );
        // B2: every ratio NOT consistent with the published one.
        assert!(
            !within(k16 / k32, p16 / p32, 0.15),
            "B2 {fig}: {}",
            k16 / k32
        );
    }
    // The recorded values themselves, to the hundredth of a minute.
    for (case, fig, want) in [
        ("primary-16", "revisit", 23.97),
        ("primary-32", "revisit", 22.92),
        ("primary-16", "full_refresh", 14.84),
        ("primary-32", "full_refresh", 12.95),
        ("primary-16", "reaction", 23.09),
        ("primary-32", "reaction", 12.99),
        ("V1-32-8x4", "revisit", 13.60),
    ] {
        assert!(
            (minutes(&d, case, fig) - want).abs() < 0.005,
            "{case} {fig}"
        );
    }
}

/// The committed run is what the planner gives: one case recomputed in full (all 996 points, 7 days at
/// 10 s). A few seconds in a release build (minutes in a debug one), so it runs on request:
/// `cargo test --release --test tip_and_cue_m2 -- --ignored`.
#[test]
#[ignore = "a few seconds in release; recomputes primary-16 of the committed M2 run"]
fn the_committed_run_reproduces() {
    use kshana::tip_and_cue::{baltic_points, m2_cases, run, Grid};
    let d: Value = serde_json::from_str(RESULT).unwrap();
    let r = run(&m2_cases()[..1], &baltic_points(), Grid::default()).unwrap();
    let got = serde_json::to_value(&r[0]).unwrap();
    assert_eq!(got, d["cases"][0]);
}
