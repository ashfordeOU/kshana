// SPDX-License-Identifier: AGPL-3.0-only
//! The M2 run (docs/design/evidence/m2-revisit-tip-and-cue/PREREGISTRATION.md): the nine
//! pre-registered cases over the 996 Baltic sea points, 7 days at a 10 s step, printed as JSON.
//!
//!     cargo run --release --example m2_tip_and_cue > xval/m2-revisit-tip-and-cue/m2_result.json
fn main() {
    use kshana::tip_and_cue::{baltic_points, m2_cases, run, Grid};
    let points = baltic_points();
    let results = run(&m2_cases(), &points, Grid::default()).expect("the M2 cases run");
    let doc = serde_json::json!({
        "row": "M2",
        "points": points.len(),
        "step_s": Grid::default().step_s,
        "span_s": Grid::default().span_s,
        "epoch_utc": "2025-01-01T00:00:00Z",
        "cases": results,
    });
    println!("{}", serde_json::to_string_pretty(&doc).expect("JSON"));
}
