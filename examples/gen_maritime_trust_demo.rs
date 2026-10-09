// SPDX-License-Identifier: AGPL-3.0-only
//! Writes the synthetic NMEA 0183 log of `examples/maritime-trust/`: a ferry on a Tallinn to
//! Helsinki route with a position drag-off partway through. Text only: this models no radio
//! signal and transmits nothing. The log is deterministic; a test checks the committed file
//! against this generator.
//!
//! `cargo run --release --example gen_maritime_trust_demo`

use kshana::receiver_trust::synth::{gulf_of_finland_demo_spec, synth_voyage};

fn main() {
    let path = std::env::args()
        .nth(1)
        .unwrap_or_else(|| "examples/maritime-trust/tallinn-helsinki.nmea".to_string());
    // NMEA 0183 sentences end in CR LF.
    let text: String = synth_voyage(&gulf_of_finland_demo_spec())
        .lines()
        .map(|l| format!("{l}\r\n"))
        .collect();
    std::fs::write(&path, text).expect("write the log");
    println!("wrote {path}");
}
