// SPDX-License-Identifier: AGPL-3.0-only
//! B3a synthetic gate runner (`xval/locator-power-difference/README.md`, readings 9, 13 to 15).
//!
//! ```text
//! cargo run --release --example locate_pd_gate -- dev            # seeds 1-200, every tempering candidate
//! cargo run --release --example locate_pd_gate -- gate           # seeds 1001-2000 at TEMPER_V1
//! cargo run --release --example locate_pd_gate -- json SEED      # one seed's input (for oracle.py)
//! cargo run --release --example locate_pd_gate -- answer SEED    # the engine's answer for that seed
//!
//! Version 2 (readings V1 to V15), with `preregistered_v2`:
//! cargo run --release --example locate_pd_gate -- dev2           # seeds 3001-3200 (implementation checks, V13)
//! cargo run --release --example locate_pd_gate -- gate2          # seeds 4001-5000, run once (V14)
//! cargo run --release --example locate_pd_gate -- json2 SEED     # one seed's input (for oracle.py --v2)
//! cargo run --release --example locate_pd_gate -- answer2 SEED   # the engine's v2 answer for that seed
//! ```
//! Output is JSON on stdout.

use kshana::locate_pd::{
    gate_row, gate_summary, synth_answer_json, synth_json, GateRow, PowerDifferenceParams,
    TEMPER_CANDIDATES, TEMPER_V1,
};
use serde_json::json;

fn run(p: &PowerDifferenceParams, seeds: Vec<u64>, tempers: Vec<f64>) -> Vec<GateRow> {
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

/// Version 2's rows: v1's fields and whether the session was located (V7).
fn rows_json_v2(rows: &[GateRow]) -> serde_json::Value {
    json!(rows
        .iter()
        .map(|r| json!({"seed": r.seed, "covered": r.covered, "area_share": r.area_share,
            "centroid_err_km": r.centroid_err_km, "nn_spacing_km": r.nn_spacing_km, "redraws": r.redraws,
            "located": r.located}))
        .collect::<Vec<_>>())
}

/// A version 2 run's summary (V12): S1 to S3, redraws and sessions not located.
fn summary_v2(set: &str, seeds: [u64; 2], rows: &[GateRow]) -> serde_json::Value {
    let p = PowerDifferenceParams::preregistered_v2();
    let (s1, s2, s3) = gate_summary(rows, 0);
    json!({"set": set, "seeds": seeds, "method": p.to_json(),
        "S1_coverage": s1, "S2_median_area_share": s2, "S3_centroid_ratio": s3,
        "redraws": rows.iter().map(|r| r.redraws).sum::<u32>(),
        "not_located": rows.iter().filter(|r| !r.located).count(),
        "rows": rows_json_v2(rows)})
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
            let rows = run(&p, (1..=200).collect(), TEMPER_CANDIDATES.to_vec());
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
            let rows = run(&p, (1001..=2000).collect(), vec![TEMPER_V1]);
            let (s1, s2, s3) = gate_summary(&rows, 0);
            json!({"set": "gate", "seeds": [1001, 2000], "temper": TEMPER_V1,
                "S1_coverage": s1, "S2_median_area_share": s2, "S3_centroid_ratio": s3,
                "redraws": rows.iter().map(|r| r.redraws).sum::<u32>(), "rows": rows_json(&rows)})
        }
        Some("json") => synth_json(&p, a[1].parse().expect("seed")),
        Some("answer") => synth_answer_json(&p, a[1].parse().expect("seed")),
        Some("dev2") => {
            let q = PowerDifferenceParams::preregistered_v2();
            summary_v2(
                "dev2",
                [3001, 3200],
                &run(&q, (3001..=3200).collect(), vec![q.temper]),
            )
        }
        Some("gate2") => {
            let q = PowerDifferenceParams::preregistered_v2();
            summary_v2(
                "gate2",
                [4001, 5000],
                &run(&q, (4001..=5000).collect(), vec![q.temper]),
            )
        }
        Some("json2") => synth_json(
            &PowerDifferenceParams::preregistered_v2(),
            a[1].parse().expect("seed"),
        ),
        Some("answer2") => synth_answer_json(
            &PowerDifferenceParams::preregistered_v2(),
            a[1].parse().expect("seed"),
        ),
        _ => {
            eprintln!("usage: locate_pd_gate dev|gate|json SEED|answer SEED|dev2|gate2|json2 SEED|answer2 SEED");
            std::process::exit(2);
        }
    };
    println!("{}", serde_json::to_string(&out).expect("json"));
}
