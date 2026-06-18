// SPDX-License-Identifier: AGPL-3.0-only
//! `mars-od-xval` — run the DE-grade heliocentric-Mars cross-validation: resolve (or fetch) the
//! DE440 SPK, load the DE440 Mars/Sun ephemeris through ANISE, seed Kshana's Sun-central two-body
//! propagator from a DE440 Mars-barycenter state, and write the honest per-arc residual report.
//!
//! When the DE440 kernel is **absent** (and not fetchable without network) the binary prints a clear
//! "kernels not found, skipping" message and exits cleanly (status 0) — it is a manual /
//! `workflow_dispatch` DE-grade check, never a default CI gate.

use std::path::Path;

use kshana_anise_mars_od::{kernel, xval, AniseMarsEnvironment};
use sha2::{Digest, Sha256};

/// Seed epoch for the cross-check: 2022-01-01 (JD 2459580.5 TDB), inside the de440s coverage and
/// the same probe epoch the lunar cross-check uses.
const SEED_JD_TDB: f64 = 2_459_580.5;

fn sha256_file(path: &Path) -> String {
    let bytes = std::fs::read(path).unwrap_or_default();
    let mut h = Sha256::new();
    h.update(&bytes);
    hex::encode(h.finalize())
}

fn main() {
    // Resolve the kernel; if absent, try to fetch it (network), else skip cleanly.
    let spk = match kernel::resolve_spk() {
        Some(p) => p,
        None => {
            eprintln!(
                "DE440 SPK (de440s.bsp) not found. Set $KSHANA_ANISE_DE440S to a local copy, or \
                 ensure network access to fetch it (~32 MB) into kernels/."
            );
            match kernel::download_spk() {
                Ok(p) => p,
                Err(e) => {
                    eprintln!("kernels not found and download failed ({e}); skipping the DE-grade cross-check.");
                    return; // clean exit (status 0) — this is a manual check, not a gate
                }
            }
        }
    };

    eprintln!(
        "Loading DE-grade Mars environment:\n  SPK {}",
        spk.display()
    );
    let env = match AniseMarsEnvironment::load(spk.to_str().unwrap()) {
        Ok(env) => env,
        Err(e) => {
            eprintln!("failed to load the DE-grade Mars environment ({e}); skipping.");
            return;
        }
    };

    let shas = vec![(kernel::SPK_FILENAME.to_string(), sha256_file(&spk))];

    eprintln!("Running the DE-grade heliocentric-Mars cross-check (seed JD {SEED_JD_TDB} TDB) ...");
    let report = match xval::run(&env, SEED_JD_TDB, shas) {
        Ok(r) => r,
        Err(e) => {
            eprintln!("cross-check failed ({e}); skipping report.");
            return;
        }
    };

    let md = report.to_markdown();
    print!("{md}");

    let dir = env!("CARGO_MANIFEST_DIR");
    if let Err(e) = std::fs::write(
        format!("{dir}/report.json"),
        serde_json::to_string_pretty(&report).expect("serialize report"),
    ) {
        eprintln!("warning: could not write report.json: {e}");
    }
    if let Err(e) = std::fs::write(format!("{dir}/report.md"), &md) {
        eprintln!("warning: could not write report.md: {e}");
    }
    eprintln!("\nWrote report.json + report.md.");
}
