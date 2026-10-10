// SPDX-License-Identifier: AGPL-3.0-only
//! Writes the two outputs the telemetry format oracles read, from the committed synthetic
//! stream `tests/fixtures/telemetry_oracle/stream.jsonl`: `exposition.prom` (Prometheus text)
//! and `otlp.json` (OTLP/HTTP JSON; needs `--features otlp`). It writes no oracle output;
//! that is `scripts/gen_telemetry_formats_ref.py`'s job.
//!
//! Run: `cargo run --example gen_telemetry_oracle_inputs --features otlp`

use kshana::telemetry::prometheus::Registry;
use kshana::telemetry::sample::parse_live_line;
use std::path::Path;

const VERSION: &str = "9.9.9-oracle";
const NOW: f64 = 1_790_000_000.0;
#[cfg(feature = "otlp")]
const NOW_NANO: u64 = 1_790_000_100_000_000_000;

fn main() {
    let dir = Path::new(env!("CARGO_MANIFEST_DIR")).join("tests/fixtures/telemetry_oracle");
    let stream = std::fs::read_to_string(dir.join("stream.jsonl")).unwrap();
    let mut reg = Registry::new(VERSION);
    reg.set_expose_position(true);
    for line in stream.lines().filter(|l| !l.trim().is_empty()) {
        match parse_live_line(line) {
            Ok(s) => reg.observe(&s, Some(NOW)),
            Err(_) => reg.observe_input_error(),
        }
    }
    std::fs::write(dir.join("exposition.prom"), reg.render()).unwrap();
    #[cfg(feature = "otlp")]
    {
        let p = kshana::telemetry::otlp::build_payload(&reg, NOW_NANO);
        std::fs::write(
            dir.join("otlp.json"),
            serde_json::to_string_pretty(&p).unwrap() + "\n",
        )
        .unwrap();
    }
    #[cfg(not(feature = "otlp"))]
    eprintln!("note: built without the `otlp` feature; otlp.json not written");
    println!("wrote {}", dir.display());
}
