// SPDX-License-Identifier: AGPL-3.0-only
//! M5: `m5_run b4` prints the engine's B4 rows; `m5_run scenario [N]` runs the scenario once
//! (N placements, default 200). JSON on stdout.
fn main() {
    let a: Vec<String> = std::env::args().skip(1).collect();
    let v = match a.first().map(String::as_str) {
        Some("b4") => kshana::m5_hybrid::b4_rows(),
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
