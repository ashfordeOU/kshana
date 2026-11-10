// SPDX-License-Identifier: AGPL-3.0-only
//! M4 development and scored runs (readings 17 to 19):
//! `m4_dev dev` runs seeds 0-9 for every (m, c) candidate; `m4_dev scored` runs seeds 1000-1009 once
//! at `M4Params::v1`; `dev2` runs seeds 20-29 for m in {2, 3} (v2, R24); `scored2` runs seeds
//! 2000-2009 once at `M4Params::v2`; `dev3` runs seeds 30-39 for m in {2, 3} and the new-track cost
//! in {9.21, 13.82} (v3, R31); `scored3` runs seeds 3000-3009 once at `M4Params::v3`. JSON on stdout.
use kshana::m4_dark_vessel::generate;
use kshana::m4_logic::{decide, decided_classes, metrics, M4Params};
use serde_json::json;

fn main() {
    let a: Vec<String> = std::env::args().skip(1).collect();
    match a.first().map(String::as_str) {
        Some("dev") => {
            let scenes: Vec<_> = (0..10).map(generate).collect();
            let mut out = Vec::new();
            for w in [60u32, 180] {
                for m in [1usize, 2, 3] {
                    for c in [3000.0, 5000.0] {
                        let p = M4Params {
                            m,
                            c_m: c,
                            epoch_window_s: w,
                            ..M4Params::base()
                        };
                        let rows: Vec<_> = scenes
                            .iter()
                            .flat_map(|s| decided_classes(s, &decide(s, &p)))
                            .collect();
                        out.push(
                            json!({"window_s": w, "m": m, "c_m": c, "metrics": metrics(&rows)}),
                        );
                    }
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
        Some("seed") => {
            let seed: u64 = a[1].parse().expect("seed");
            let s = generate(seed);
            let rows = decided_classes(&s, &decide(&s, &M4Params::v1()));
            println!(
                "{}",
                serde_json::to_string(&metrics(&rows)["confusion"]).expect("json")
            );
        }
        Some("seed2") => {
            let seed: u64 = a[1].parse().expect("seed");
            let s = generate(seed);
            let rows = decided_classes(&s, &decide(&s, &M4Params::v2()));
            println!(
                "{}",
                serde_json::to_string(&metrics(&rows)["confusion"]).expect("json")
            );
        }
        Some("dev2") => {
            // v2 (R21, R24): seeds 20-29, m in {2, 3}.
            let scenes: Vec<_> = (20..30).map(generate).collect();
            let out: Vec<_> = [2usize, 3]
                .iter()
                .map(|&m| {
                    let p = M4Params::v2_base(m);
                    let rows: Vec<_> = scenes
                        .iter()
                        .flat_map(|s| decided_classes(s, &decide(s, &p)))
                        .collect();
                    json!({"m": m, "metrics": metrics(&rows)})
                })
                .collect();
            println!(
                "{}",
                serde_json::to_string(&json!({"set": "dev-v2", "seeds": [20, 29], "runs": out}))
                    .expect("json")
            );
        }
        Some("scored2") => {
            let p = M4Params::v2();
            let mut redraws = 0;
            let mut rows = Vec::new();
            for seed in 2000..2010 {
                let s = generate(seed);
                redraws += s.redraws;
                rows.extend(decided_classes(&s, &decide(&s, &p)));
            }
            println!("{}", serde_json::to_string(&json!({"set": "scored-v2", "seeds": [2000, 2009], "m": p.m, "c_m": p.c_m, "redraws": redraws, "metrics": metrics(&rows)})).expect("json"));
        }
        Some("dev3") => {
            // v3 (R31): seeds 30-39, m in {2, 3} x new-track cost in {9.21, 13.82}.
            let scenes: Vec<_> = (30..40).map(generate).collect();
            let mut out = Vec::new();
            for m in [2usize, 3] {
                for c in [9.21, 13.82] {
                    let p = M4Params::v3_base(m, c);
                    let rows: Vec<_> = scenes
                        .iter()
                        .flat_map(|s| decided_classes(s, &decide(s, &p)))
                        .collect();
                    out.push(json!({"m": m, "new_track_cost": c, "metrics": metrics(&rows)}));
                }
            }
            println!(
                "{}",
                serde_json::to_string(&json!({"set": "dev-v3", "seeds": [30, 39], "runs": out}))
                    .expect("json")
            );
        }
        Some("scored3") => {
            let p = M4Params::v3();
            let mut redraws = 0;
            let mut rows = Vec::new();
            for seed in 3000..3010 {
                let s = generate(seed);
                redraws += s.redraws;
                rows.extend(decided_classes(&s, &decide(&s, &p)));
            }
            println!("{}", serde_json::to_string(&json!({"set": "scored-v3", "seeds": [3000, 3009], "m": p.m, "c_m": p.c_m, "new_track_cost": p.new_track_cost, "redraws": redraws, "metrics": metrics(&rows)})).expect("json"));
        }
        Some("seed3") => {
            let seed: u64 = a[1].parse().expect("seed");
            let m: usize = a.get(2).map_or(3, |x| x.parse().expect("m"));
            let c: f64 = a.get(3).map_or(13.82, |x| x.parse().expect("cost"));
            let s = generate(seed);
            let rows = decided_classes(&s, &decide(&s, &M4Params::v3_base(m, c)));
            println!(
                "{}",
                serde_json::to_string(&metrics(&rows)["confusion"]).expect("json")
            );
        }
        _ => eprintln!(
            "usage: m4_dev dev|scored|seed N|dev2|scored2|seed2 N|dev3|scored3|seed3 N [m c]"
        ),
    }
}
