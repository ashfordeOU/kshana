// SPDX-License-Identifier: Apache-2.0
//! Reproducible generator for the paper's quantum-vs-classical resilience
//! crossover studies. Writes the schema-versioned JSON for each canonical study
//! (fixed seed, cited parameters) into an output directory, so every figure and
//! number in the paper regenerates from one command:
//!
//! ```text
//! cargo run --release --bin crossover_study -- paper/crossover
//! ```
//!
//! Produces `inertial.json` (cold-atom vs navigation-grade dead-reckoning over
//! outage × platform vibration) and `clock.json` (optical / maser / OCXO / CSAC
//! holdover to a 1 µs budget, with technology-readiness labels).
use std::path::Path;
use std::process::ExitCode;

fn write_json<T: serde::Serialize>(dir: &Path, name: &str, value: &T) -> Result<(), String> {
    let path = dir.join(name);
    let json = serde_json::to_string_pretty(value).map_err(|e| format!("serialize {name}: {e}"))?;
    std::fs::write(&path, json).map_err(|e| format!("write {}: {e}", path.display()))?;
    eprintln!("wrote {}", path.display());
    Ok(())
}

fn main() -> ExitCode {
    let dir = std::env::args().nth(1).unwrap_or_else(|| ".".to_string());
    let dir = Path::new(&dir);
    if let Err(e) = std::fs::create_dir_all(dir) {
        eprintln!("error: cannot create {}: {e}", dir.display());
        return ExitCode::FAILURE;
    }

    let inertial = kshana::crossover::InertialCrossover::paper_inertial().run();
    let clock = kshana::crossover::ClockHoldover::paper_clocks().run();

    for r in [
        write_json(dir, "inertial.json", &inertial),
        write_json(dir, "clock.json", &clock),
    ] {
        if let Err(e) = r {
            eprintln!("error: {e}");
            return ExitCode::FAILURE;
        }
    }
    eprintln!(
        "done: inertial {} nodes, clock {} curves (seed 42)",
        inertial.nodes.len(),
        clock.curves.len()
    );
    ExitCode::SUCCESS
}
