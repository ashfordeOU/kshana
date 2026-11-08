// SPDX-License-Identifier: AGPL-3.0-only
//! M4 development and scored runs (readings 17 to 19):
//! `m4_dev dev` runs seeds 0-9 for every (m, c) candidate; `m4_dev scored` runs seeds 1000-1009 once
//! at `M4Params::v1`. JSON on stdout.
use kshana::m4_dark_vessel::generate;
use kshana::m4_logic::{decide, decided_classes, metrics, M4Params};
use serde_json::json;

fn main() {
    let a: Vec<String> = std::env::args().skip(1).collect();
    match a.first().map(String::as_str) {
        Some("dev") => {
            let scenes: Vec<_> = (0..10).map(generate).collect();
            let mut out = Vec::new();
            for m in [1usize, 2, 3] {
                for c in [3000.0, 5000.0] {
                    let p = M4Params {
                        m,
                        c_m: c,
                        ..M4Params::base()
                    };
                    let rows: Vec<_> = scenes
                        .iter()
                        .flat_map(|s| decided_classes(s, &decide(s, &p)))
                        .collect();
                    out.push(json!({"m": m, "c_m": c, "metrics": metrics(&rows)}));
                }
            }
            println!(
                "{}",
                serde_json::to_string(&json!({"set": "dev", "seeds": [0, 9], "runs": out}))
                    .expect("json")
            );
        }
        Some("scored") => {
            let p = M4Params::v1();
            let mut redraws = 0;
            let mut rows = Vec::new();
            for seed in 1000..1010 {
                let s = generate(seed);
                redraws += s.redraws;
                rows.extend(decided_classes(&s, &decide(&s, &p)));
            }
            println!("{}", serde_json::to_string(&json!({"set": "scored", "seeds": [1000, 1009], "m": p.m, "c_m": p.c_m, "redraws": redraws, "metrics": metrics(&rows)})).expect("json"));
        }
        _ => eprintln!("usage: m4_dev dev|scored"),
    }
}
