// SPDX-License-Identifier: AGPL-3.0-only
//! The pre-registered comparison of the `gnss-ssv` sweeps with the ICG SSV booklet's tables
//! (xval/gnss-ssv/PREREGISTRATION.md). Run in release: `cargo run --release --example ssv_booklet_check [out.json] [--glonass-table-4-2] [--patterns=l1-azavg.csv] [--ablation=B1..B5] [--s7b=l1-azavg.csv]`.

fn main() {
    let tables =
        std::fs::read_to_string("xval/gnss-ssv/booklet-tables.json").expect("booklet-tables.json");
    let size = if cfg!(debug_assertions) {
        eprintln!(
            "debug build: running the reduced size, whose verdicts mean nothing; use --release"
        );
        kshana::ssv::check::Size::Reduced
    } else {
        kshana::ssv::check::Size::Full
    };
    let arg = |name: &str| std::env::args().find_map(|a| a.strip_prefix(name).map(str::to_string));
    let mut report = if std::env::args().any(|a| a == "--s7-only") {
        serde_json::json!({"bars": {}})
    } else if let Some(id) = arg("--ablation=") {
        kshana::ssv::check::run_ablation(&tables, size, &id).expect("ablation")
    } else {
        kshana::ssv::check::run(
            &tables,
            size,
            std::env::args().any(|a| a == "--glonass-table-4-2"),
        )
        .expect("comparison")
    };
    if let Some(p) =
        std::env::args().find_map(|a| a.strip_prefix("--patterns=").map(str::to_string))
    {
        let csv = std::fs::read_to_string(p).expect("pattern csv");
        report["bars"]["S7"] = kshana::ssv::check::s7(&csv).expect("S7");
    }
    if let Some(p) = arg("--s7b=") {
        let csv = std::fs::read_to_string(p).expect("pattern csv");
        report["bars"]["S7b"] = kshana::ssv::check::s7b(
            &csv,
            &kshana::ssv::check::S7B_TRAIN,
            &kshana::ssv::check::S7B_TEST,
        )
        .expect("S7b");
    }
    let text = serde_json::to_string_pretty(&report).unwrap();
    match std::env::args().nth(1).filter(|a| !a.starts_with("--")) {
        Some(p) => std::fs::write(p, text).unwrap(),
        None => println!("{text}"),
    }
}
