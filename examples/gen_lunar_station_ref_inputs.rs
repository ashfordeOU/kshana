// SPDX-License-Identifier: AGPL-3.0-only
//! Export fixed `lunar-station-coverage` cases for the independent numpy re-computation
//! (`scripts/gen_lunar_station_ref.py`, pre-registered in
//! `tests/fixtures/lunar_station/PREREGISTRATION.md`).
//!
//! Writes `tests/fixtures/lunar_station/cases.json`: for 20 fixed (point, epoch, trial)
//! cases of `tests/fixtures/lunar_station/oracle.toml`, everything the run drew (satellite
//! positions, the station's surveyed and believed positions, the orbit, clock, link and
//! noise errors) beside what it computed from them (the satellites used, the corrections,
//! the raw and corrected range errors, the corrected and uncorrected position-error
//! vectors and their 3-D, horizontal and vertical magnitudes); and, for every point, the
//! corrected 3-D error of every available (epoch, trial) sample with the percentile the
//! run reported for it.
//!
//! Run: `cargo run --release --example gen_lunar_station_ref_inputs`

use kshana::lunar_station::LunarStationCoverageScenario;
use serde_json::json;

const SCENARIO: &str = "tests/fixtures/lunar_station/oracle.toml";
const OUT: &str = "tests/fixtures/lunar_station/cases.json";

/// The 20 cases: points 0..5, epochs {0, 3}, trials {0, 5}.
pub fn case_indices() -> Vec<(usize, usize, usize)> {
    let mut v = Vec::new();
    for j in 0..5 {
        for i in [0, 3] {
            for k in [0, 5] {
                v.push((j, i, k));
            }
        }
    }
    v
}

fn main() {
    let src = std::fs::read_to_string(SCENARIO).expect("read the oracle scenario");
    let s: LunarStationCoverageScenario = toml::from_str(&src).expect("parse the oracle scenario");
    let report = s.run().expect("run the oracle scenario");
    let cases: Vec<_> = case_indices()
        .into_iter()
        .map(|(j, i, k)| s.trace_case(j, i, k).expect("trace a case"))
        .collect();
    let mut points = Vec::new();
    for (j, p) in report.points.iter().enumerate() {
        let mut samples = Vec::new();
        for i in 0..report.n_epochs {
            for k in 0..report.n_trials {
                let c = s.trace_case(j, i, k).expect("trace a sample");
                if let Some(e) = c.eval.and_then(|e| e.corrected_3d_m) {
                    samples.push(e);
                }
            }
        }
        points.push(json!({
            "point_index": j,
            "samples_corrected_3d_m": samples,
            "reported_corrected_p_3d_m": p.corrected_p_3d_m,
        }));
    }
    let doc = json!({
        "scenario": SCENARIO,
        "engine_version": env!("CARGO_PKG_VERSION"),
        "percentile": report.percentile,
        "cases": cases,
        "points": points,
    });
    let text = serde_json::to_string_pretty(&doc).expect("plain JSON") + "\n";
    std::fs::write(OUT, text).expect("write the cases");
    println!(
        "wrote {OUT}: {} cases, {} points",
        cases_len(&doc),
        report.points.len()
    );
}

fn cases_len(doc: &serde_json::Value) -> usize {
    doc["cases"].as_array().map_or(0, |a| a.len())
}
