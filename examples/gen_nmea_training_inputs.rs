// SPDX-License-Identifier: AGPL-3.0-only
//! Writes the NMEA streams that `scripts/gen_nmea_training_ref.py` hands to pynmea2.
//!
//! For every library training scenario and each seed in `SEEDS` it writes
//! `<dir>/<scenario>_s<seed>.nmea` (CRLF text, the bytes under test).
//!
//! Run: `cargo run --example gen_nmea_training_inputs -- <dir>`

use kshana::nmea_synth::generate_from_toml;

const SCENARIOS: [&str; 4] = [
    "open-sea-jamming",
    "coastal-drag-off",
    "port-approach-time-spoof",
    "combined-event",
];
const SEEDS: [u64; 2] = [1, 7];

fn main() {
    let dir = std::env::args()
        .nth(1)
        .expect("usage: gen_nmea_training_inputs <dir>");
    std::fs::create_dir_all(&dir).unwrap();
    for name in SCENARIOS {
        let toml = std::fs::read_to_string(format!("scenarios/training/{name}.toml")).unwrap();
        for seed in SEEDS {
            let g = generate_from_toml(&toml, Some(seed)).unwrap();
            std::fs::write(format!("{dir}/{name}_s{seed}.nmea"), g.nmea_text()).unwrap();
        }
    }
}
