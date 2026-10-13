// SPDX-License-Identifier: AGPL-3.0-only
//! The pre-registered receiver-trust threshold calibration on the JammerTest 2024 dataset
//! (CAP-13; `xval/jammertest-trust/PREREGISTRATION.md`).
//!
//! The dataset (Zenodo record 15911589, GPL-3.0-or-later) is not vendored. Fetch and extract it
//! outside the repository, then:
//!
//! ```text
//! cargo run --release --example jammertest_trust_calibration -- <extracted-root> [out.json] [--ubx]
//! ```
//!
//! Prints the per-monitor results and the bars, and writes the full report as JSON.
use kshana::receiver_trust::calibration::run_dataset;

fn main() {
    let args: Vec<String> = std::env::args().skip(1).collect();
    let Some(root) = args.first() else {
        eprintln!("usage: jammertest_trust_calibration <extracted-root> [out.json] [--ubx]");
        std::process::exit(2);
    };
    let with_ubx = args.iter().any(|a| a == "--ubx");
    let r = match run_dataset(std::path::Path::new(root), with_ubx) {
        Ok(r) => r,
        Err(e) => {
            eprintln!("error: {e}");
            std::process::exit(1);
        }
    };
    for f in &r.folders {
        println!(
            "folder {} attack={:?} jamming={} state={} excluded={:?} clean={} jamming_epochs={} other={}",
            f.path, f.attack_type, f.jamming, f.rover_state, f.excluded, f.epochs.clean, f.epochs.jamming, f.epochs.other
        );
    }
    for s in &r.stats {
        println!(
            "stat {} default {} at_default Pfa {:?} Pd {:?} | AUC {:?} | selected {:?} at_selected Pfa {:?} Pd {:?} | LOSO held-out Pfa {:?} Pd {:?} ({}/{} clean, {}/{} jamming)",
            s.config_field,
            s.default_threshold,
            s.at_default.pfa(),
            s.at_default.pd(),
            s.auc,
            s.selected,
            s.at_selected.map(|c| c.pfa()),
            s.at_selected.map(|c| c.pd()),
            s.loso_heldout.pfa(),
            s.loso_heldout.pd(),
            s.loso_heldout.clean_alarmed,
            s.loso_heldout.clean,
            s.loso_heldout.jamming_alarmed,
            s.loso_heldout.jamming
        );
    }
    println!(
        "union default Pfa {:?} Pd {:?}; calibrated Pfa {:?} Pd {:?}; LOSO held-out Pfa {:?} Pd {:?}",
        r.union_default.pfa(),
        r.union_default.pd(),
        r.union_calibrated.pfa(),
        r.union_calibrated.pd(),
        r.union_loso_heldout.pfa(),
        r.union_loso_heldout.pd()
    );
    for b in &r.bars {
        println!(
            "bar {} | {} | {}",
            b.bar,
            b.measured,
            if b.pass { "PASS" } else { "FAIL" }
        );
    }
    println!(
        "jamming folders {} minimum_data {} calibrated {:?} verdict {}",
        r.n_jamming_folders, r.minimum_data, r.calibrated, r.verdict
    );
    if let Some(out) = args.iter().skip(1).find(|a| !a.starts_with("--")) {
        std::fs::write(out, serde_json::to_string_pretty(&r).expect("json")).expect("write");
        println!("wrote {out}");
    }
}
