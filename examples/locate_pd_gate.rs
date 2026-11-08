// SPDX-License-Identifier: AGPL-3.0-only
//! B3a synthetic gate runner (`xval/locator-power-difference/README.md`, readings 9, 13 to 15).
//!
//! ```text
//! cargo run --release --example locate_pd_gate -- dev            # seeds 1-200, every tempering candidate
//! cargo run --release --example locate_pd_gate -- gate           # seeds 1001-2000 at TEMPER_V1
//! cargo run --release --example locate_pd_gate -- json SEED      # one seed's input (for oracle.py)
//! cargo run --release --example locate_pd_gate -- answer SEED    # the engine's answer for that seed
//! ```
//! Output is JSON on stdout.

use kshana::locate_pd::{
    gate_row, gate_summary, synth_answer_json, synth_json, GateRow, PowerDifferenceParams,
    TEMPER_CANDIDATES, TEMPER_V1,
};
use serde_json::json;

fn run(seeds: Vec<u64>, tempers: Vec<f64>) -> Vec<GateRow> {
    let p = PowerDifferenceParams::preregistered_v1();
    let threads = std::thread::available_parallelism().map_or(1, |n| n.get());
    let chunks: Vec<Vec<u64>> = (0..threads)
        .map(|t| seeds.iter().copied().skip(t).step_by(threads).collect())
        .collect();
    let mut rows: Vec<GateRow> = std::thread::scope(|sc| {
        let hs: Vec<_> = chunks
            .into_iter()
            .map(|c| {
                let (p, tempers) = (p.clone(), tempers.clone());
                sc.spawn(move || {
                    c.into_iter()
                        .map(|s| gate_row(&p, s, &tempers))
                        .collect::<Vec<_>>()
                })
            })
            .collect();
        hs.into_iter()
            .flat_map(|h| h.join().expect("thread"))
            .collect()
    });
    rows.sort_by_key(|r| r.seed);
    rows
}

fn rows_json(rows: &[GateRow]) -> serde_json::Value {
    json!(rows
        .iter()
        .map(|r| json!({"seed": r.seed, "covered": r.covered, "area_share": r.area_share,
            "centroid_err_km": r.centroid_err_km, "nn_spacing_km": r.nn_spacing_km, "redraws": r.redraws}))
        .collect::<Vec<_>>())
}

fn main() {
    let a: Vec<String> = std::env::args().skip(1).collect();
    let p = PowerDifferenceParams::preregistered_v1();
    let out = match a.first().map(String::as_str) {
        Some("dev") => {
            let rows = run((1..=200).collect(), TEMPER_CANDIDATES.to_vec());
            let summary: Vec<_> = TEMPER_CANDIDATES
                .iter()
                .enumerate()
                .map(|(k, t)| {
                    let (s1, s2, s3) = gate_summary(&rows, k);
                    json!({"temper": t, "coverage": s1, "median_area_share": s2, "centroid_ratio": s3})
                })
                .collect();
            json!({"set": "dev", "seeds": [1, 200], "summary": summary, "rows": rows_json(&rows)})
        }
        Some("gate") => {
            let rows = run((1001..=2000).collect(), vec![TEMPER_V1]);
            let (s1, s2, s3) = gate_summary(&rows, 0);
            json!({"set": "gate", "seeds": [1001, 2000], "temper": TEMPER_V1,
                "S1_coverage": s1, "S2_median_area_share": s2, "S3_centroid_ratio": s3,
                "redraws": rows.iter().map(|r| r.redraws).sum::<u32>(), "rows": rows_json(&rows)})
        }
        Some("json") => synth_json(&p, a[1].parse().expect("seed")),
        Some("answer") => synth_answer_json(&p, a[1].parse().expect("seed")),
        _ => {
            eprintln!("usage: locate_pd_gate dev|gate|json SEED|answer SEED");
            std::process::exit(2);
        }
    };
    println!("{}", serde_json::to_string(&out).expect("json"));
}
