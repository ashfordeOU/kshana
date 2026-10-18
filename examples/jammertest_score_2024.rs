// SPDX-License-Identifier: AGPL-3.0-only
//! The pre-registered scoring run on the JammerTest 2024 dataset
//! (`xval/jammertest-score/PREREGISTRATION.md`).
//!
//! ```text
//! cargo run --release --example jammertest_score_2024 -- <extracted-root> report.json
//! ```
//!
//! The dataset (Zenodo record 15911589, GPL-3.0-or-later) is fetched by `xval/oracles/setup.sh`
//! and extracted outside the repository; nothing is vendored.

fn main() {
    let args: Vec<String> = std::env::args().collect();
    let (Some(root), Some(out)) = (args.get(1), args.get(2)) else {
        eprintln!("usage: jammertest_score_2024 <extracted-root> <report.json>");
        std::process::exit(2);
    };
    let r =
        kshana::jammertest::dataset::run_dataset(std::path::Path::new(root)).unwrap_or_else(|e| {
            eprintln!("error: {e}");
            std::process::exit(1);
        });
    std::fs::write(out, serde_json::to_string_pretty(&r).expect("serialise"))
        .expect("write report");
    for f in &r.folders {
        println!(
            "{:<8} {:<10} {}",
            f.scenario_id,
            f.rover_state,
            f.excluded.as_deref().unwrap_or("scored")
        );
    }
    println!(
        "kept {} folders ({} with jamming windows); minimum data: {}",
        r.kept, r.kept_jamming_folders, r.minimum_data
    );
    for b in &r.bars {
        println!("{} {:<14} {}", b.id, b.verdict, b.measured);
    }
    println!("{}", kshana::receiver_trust::ADVISORY);
}
