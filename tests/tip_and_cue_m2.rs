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
