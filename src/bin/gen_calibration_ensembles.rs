// SPDX-License-Identifier: AGPL-3.0-only
//! Writes `docs/CALIBRATION-ENSEMBLES.md` and `docs/data/calibration-ensembles.csv`
//! (CAP-10). Run with `cargo run --release --bin gen_calibration_ensembles`.

fn main() {
    let r = kshana::calibration_ensembles::run().expect("calibration ensembles run");
    let root = std::path::Path::new(env!("CARGO_MANIFEST_DIR"));
    std::fs::write(
        root.join("docs/data/calibration-ensembles.csv"),
        kshana::calibration_ensembles::csv(&r),
    )
    .expect("write csv");
    std::fs::write(
        root.join("docs/CALIBRATION-ENSEMBLES.md"),
        kshana::calibration_ensembles::markdown(&r),
    )
    .expect("write report");
    for b in kshana::calibration_ensembles::bars(&r) {
        println!(
            "{} {}: {} in [{}, {}] -> {}",
            b.id,
            b.what,
            b.count,
            b.lo,
            b.hi,
            if b.met() { "MET" } else { "NOT MET" }
        );
    }
}
