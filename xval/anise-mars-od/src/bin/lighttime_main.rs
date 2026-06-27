// SPDX-License-Identifier: AGPL-3.0-only
//! `lighttime-xval` — run the deep-space **light-time** cross-validation (D0.7): resolve the DE440
//! SPK, load it through ANISE, and for a set of DE440 epochs compare kshana's retarded
//! `light_time_solution` τ (Earth→{Mars,Sun,Moon}) against ANISE's converged-Newtonian aberration
//! light time on the *same* DE440 SSB-relative geometry.
//!
//! Outputs:
//! - `lighttime_report.json` + `report_lighttime.md` in this crate (the full per-leg residual);
//! - the committed fixture `tests/fixtures/deep_space_mars_radiometric/anise_lighttime_de440.txt`
//!   in the **main** crate — the pinned ANISE oracle the main-repo gating test re-asserts against,
//!   with the per-leg DE440 Taylor geometry so that test re-runs kshana's solver with **no ANISE**.
//!
//! When the DE440 kernel is absent (and not fetchable) the binary prints a clear skip message and
//! exits cleanly — it is a manual / `workflow_dispatch` DE-grade check, never a default CI gate.

use std::path::{Path, PathBuf};

use kshana_anise_mars_od::{kernel, lighttime, AniseMarsEnvironment};
use sha2::{Digest, Sha256};

/// Sub-microsecond gate the cross-check enforces before it will write the fixture: kshana's τ must
/// agree with ANISE's converged-Newtonian τ to ≤ 1e-6 s on every leg.
const TAU_GATE_S: f64 = 1e-6;

fn sha256_file(path: &Path) -> String {
    let bytes = std::fs::read(path).unwrap_or_default();
    let mut h = Sha256::new();
    h.update(&bytes);
    hex::encode(h.finalize())
}

/// The main-crate fixture directory (`<repo>/tests/fixtures/deep_space_mars_radiometric`), reached
/// from this excluded crate's manifest dir (`<repo>/xval/anise-mars-od`).
fn main_crate_fixture_dir() -> PathBuf {
    PathBuf::from(env!("CARGO_MANIFEST_DIR"))
        .join("../../tests/fixtures/deep_space_mars_radiometric")
}

fn main() {
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
                    eprintln!("kernels not found and download failed ({e}); skipping the light-time cross-check.");
                    return; // clean exit (status 0) — manual check, not a gate
                }
            }
        }
    };

    eprintln!("Loading DE-grade Mars environment:\n  SPK {}", spk.display());
    let env = match AniseMarsEnvironment::load(spk.to_str().unwrap()) {
        Ok(env) => env,
        Err(e) => {
            eprintln!("failed to load the DE-grade Mars environment ({e}); skipping.");
            return;
        }
    };

    let shas = vec![(kernel::SPK_FILENAME.to_string(), sha256_file(&spk))];

    eprintln!("Running the deep-space light-time cross-check (kshana vs ANISE CN over DE440) ...");
    let report = match lighttime::run(&env, shas) {
        Ok(r) => r,
        Err(e) => {
            eprintln!("light-time cross-check failed ({e}); skipping report.");
            std::process::exit(1);
        }
    };

    // Print the human-readable summary.
    print!("{}", report.to_markdown());
    eprintln!(
        "\nWorst |Δτ| = {:.3e} s ; worst |Δrange| = {:.3e} m over {} legs.",
        report.worst_d_tau_s,
        report.worst_d_range_m,
        report.legs.len()
    );

    // Enforce the sub-microsecond gate before committing anything.
    if report.worst_d_tau_s > TAU_GATE_S {
        eprintln!(
            "GATE FAILED: worst |Δτ| {:.3e} s exceeds the {:.0e} s sub-microsecond bound.",
            report.worst_d_tau_s, TAU_GATE_S
        );
        std::process::exit(2);
    }
    eprintln!(
        "GATE OK: every leg agrees to ≤ {:.0e} s (sub-microsecond).",
        TAU_GATE_S
    );

    // Write the crate-local report.json + report.md.
    let dir = env!("CARGO_MANIFEST_DIR");
    if let Err(e) = std::fs::write(
        format!("{dir}/lighttime_report.json"),
        serde_json::to_string_pretty(&report).expect("serialize report"),
    ) {
        eprintln!("warning: could not write lighttime_report.json: {e}");
    }
    if let Err(e) = std::fs::write(format!("{dir}/report_lighttime.md"), report.to_markdown()) {
        eprintln!("warning: could not write report_lighttime.md: {e}");
    }

    // Write the committed fixture into the MAIN crate's tests/fixtures tree.
    let fixture_dir = main_crate_fixture_dir();
    if let Err(e) = std::fs::create_dir_all(&fixture_dir) {
        eprintln!(
            "warning: could not create fixture dir {}: {e}",
            fixture_dir.display()
        );
    }
    let fixture_path = fixture_dir.join("anise_lighttime_de440.txt");
    match std::fs::write(&fixture_path, report.to_fixture()) {
        Ok(()) => eprintln!("Wrote committed fixture {}.", fixture_path.display()),
        Err(e) => eprintln!(
            "warning: could not write fixture {}: {e}",
            fixture_path.display()
        ),
    }

    eprintln!("Wrote lighttime_report.json + report_lighttime.md.");
}
