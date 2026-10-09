// SPDX-License-Identifier: AGPL-3.0-only
//! Writes the synthetic NMEA 0183 log of `examples/maritime-trust/`: a ferry on a Tallinn to
//! Helsinki route with a position drag-off partway through. Text only: this models no radio
//! signal and transmits nothing. The log is deterministic; a test checks the committed file
//! against this generator.
//!
//! `cargo run --release --example gen_maritime_trust_demo`

use kshana::receiver_trust::synth::{gulf_of_finland_demo_spec, synth_voyage_with_truth};

fn main() {
    let path = std::env::args()
        .nth(1)
        .unwrap_or_else(|| "examples/maritime-trust/tallinn-helsinki.nmea".to_string());
    // NMEA 0183 sentences end in CR LF.
    let (log, truth) = synth_voyage_with_truth(&gulf_of_finland_demo_spec());
    let text: String = log.lines().map(|l| format!("{l}\r\n")).collect();
    std::fs::write(&path, text).expect("write the log");
    println!("wrote {path}");
    // The vessel's true position at each epoch (t_s from the start of the log), which a real
    // log never has: for plotting the reported track against it.
    let csv: String = std::iter::once("t_s,true_lat_deg,true_lon_deg\n".to_string())
        .chain(
            truth
                .iter()
                .enumerate()
                .map(|(t, p)| format!("{t},{:.7},{:.7}\n", p[0], p[1])),
        )
        .collect();
    let truth_path = path.replace(".nmea", ".truth.csv");
    std::fs::write(&truth_path, csv).expect("write the truth");
    println!("wrote {truth_path}");
}
