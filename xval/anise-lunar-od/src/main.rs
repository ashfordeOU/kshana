// SPDX-License-Identifier: Apache-2.0
//! `lunar-od-xval` — run the DE-grade LRO cross-validation: fetch the kernels if absent, load the
//! DE440 ephemeris + DE440 lunar principal-axis orientation through ANISE, refit the real Horizons
//! LRO orbit with the *same* `kshana` estimator, and write the honest residual report.

use std::path::Path;

use kshana_anise_lunar_od::{fit, kernel, AniseLunarEnvironment};
use sha2::{Digest, Sha256};

fn sha256_file(path: &Path) -> String {
    let bytes = std::fs::read(path).unwrap_or_default();
    let mut h = Sha256::new();
    h.update(&bytes);
    hex::encode(h.finalize())
}

fn main() {
    let (spk, bpc) = match kernel::resolve_all() {
        Some(p) => p,
        None => {
            eprintln!(
                "Fetching DE440 kernels (de440s.bsp ~32 MB + moon_pa_de440_200625.bpc ~13 MB) \
                 into kernels/ ..."
            );
            kernel::download_all().expect("download DE440 kernels")
        }
    };

    eprintln!(
        "Loading DE-grade lunar environment:\n  SPK {}\n  BPC {}",
        spk.display(),
        bpc.display()
    );
    let env = AniseLunarEnvironment::load(spk.to_str().unwrap(), bpc.to_str().unwrap())
        .expect("load DE-grade lunar environment (kernels + ANISE)");

    let shas = vec![
        (kernel::SPK_FILENAME.to_string(), sha256_file(&spk)),
        (kernel::BPC_FILENAME.to_string(), sha256_file(&bpc)),
    ];

    eprintln!("Running the DE-grade LRO fit (this takes a while — full d/o-100 batch over 241 epochs) ...");
    let report = fit::run(env, shas).expect("DE-grade LRO fit");

    let md = report.to_markdown();
    print!("{md}");

    let dir = env!("CARGO_MANIFEST_DIR");
    std::fs::write(
        format!("{dir}/report.json"),
        serde_json::to_string_pretty(&report).expect("serialize report"),
    )
    .expect("write report.json");
    std::fs::write(format!("{dir}/report.md"), &md).expect("write report.md");
    eprintln!("\nWrote report.json + report.md.");
}
