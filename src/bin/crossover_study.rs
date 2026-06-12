// SPDX-License-Identifier: Apache-2.0
//! Reproducible generator for the paper's quantum-vs-classical resilience
//! crossover study. Writes the schema-versioned [`CrossoverResult`] JSON for the
//! canonical inertial study (fixed seed, cited parameters) so the figure and every
//! number in the paper regenerate from one command:
//!
//! ```text
//! cargo run --release --bin crossover_study -- paper/crossover/inertial.json
//! ```
use std::process::ExitCode;

fn main() -> ExitCode {
    let out = std::env::args()
        .nth(1)
        .unwrap_or_else(|| "crossover-inertial.json".to_string());
    let result = kshana::crossover::InertialCrossover::paper_inertial().run();
    let json = match serde_json::to_string_pretty(&result) {
        Ok(j) => j,
        Err(e) => {
            eprintln!("error: serialize: {e}");
            return ExitCode::FAILURE;
        }
    };
    if let Err(e) = std::fs::write(&out, json) {
        eprintln!("error: cannot write {out}: {e}");
        return ExitCode::FAILURE;
    }
    eprintln!(
        "wrote {out}: {} nodes over {} outages × {} vibration levels (seed {})",
        result.nodes.len(),
        result.outages_s.len(),
        result.vibration_psds.len(),
        kshana::crossover::InertialCrossover::paper_inertial().seed,
    );
    ExitCode::SUCCESS
}
