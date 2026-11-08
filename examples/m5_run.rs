// SPDX-License-Identifier: AGPL-3.0-only
//! M5: `m5_run b4` prints the engine's B4 rows; `m5_run scenario [N]` runs the scenario once
//! (N placements, default 200). JSON on stdout.
fn main() {
    let a: Vec<String> = std::env::args().skip(1).collect();
    let v = match a.first().map(String::as_str) {
        Some("b4") => kshana::m5_hybrid::b4_rows(),
        Some("bounds") => {
            let mut fails = Vec::new();
            let mut finite = [0usize; 3];
            let mut n = 0;
            for (i, pl) in kshana::m5_hybrid::placements().into_iter().enumerate() {
                for (name, e) in kshana::m5_hybrid::CLASSES {
                    let b = kshana::m5_hybrid::bounds(pl, e);
                    n += 1;
                    for k in 0..3 {
                        finite[k] += usize::from(b[k].is_some());
                    }
                    if let Some(h) = b[2] {
                        for (k, layer) in b.iter().take(2).enumerate() {
                            if let Some(c) = *layer {
                                if !kshana::m5_hybrid::no_larger(c, h) {
                                    fails.push(serde_json::json!({"placement": i, "class": name, "layer": k}));
                                }
                            }
                        }
                    }
                }
            }
            serde_json::json!({"cases": n, "finite": {"space": finite[0], "ground": finite[1], "hybrid": finite[2]}, "violations": fails})
        }
        Some("detect") => {
            // Reading 10: lowest EIRP (1 dB grid, -10 to 60 dBm) at which every receiver's P_d at the
            // pass peak reaches 0.9, per placement; geometry only.
            let x0 = kshana::m5_hybrid::threshold();
            let mut out = Vec::new();
            for (lat, lon, h) in kshana::m5_hybrid::placements() {
                let lowest = kshana::m5_hybrid::pass(lat, lon, h).and_then(|(_, tpk)| {
                    (-10..=60).map(f64::from).find(|&e| {
                        kshana::m5_hybrid::formation_u0().iter().all(|&q| {
                            let r = kshana::m5_hybrid::range_m(lat, lon, h, q, tpk);
                            kshana::m5_hybrid::link(e, r, x0).2 >= 0.9
                        })
                    })
                });
                out.push(serde_json::json!({"height_m": h, "lowest_eirp_dbm": lowest}));
            }
            serde_json::json!(out)
        }
        Some("scenario") => {
            kshana::m5_hybrid::run(a.get(1).and_then(|s| s.parse().ok()).unwrap_or(200))
        }
        _ => {
            eprintln!("usage: m5_run b4|scenario [N]");
            std::process::exit(2);
        }
    };
    println!("{}", serde_json::to_string(&v).expect("json"));
}
