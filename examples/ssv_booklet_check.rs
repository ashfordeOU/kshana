// SPDX-License-Identifier: AGPL-3.0-only
//! The pre-registered comparison of the `gnss-ssv` sweeps with the ICG SSV booklet's tables
//! (xval/gnss-ssv/PREREGISTRATION.md). Run in release: `cargo run --release --example ssv_booklet_check [out.json] [--glonass-table-4-2]`.

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
    let report = kshana::ssv::check::run(
        &tables,
        size,
        std::env::args().any(|a| a == "--glonass-table-4-2"),
    )
    .expect("comparison");
    let text = serde_json::to_string_pretty(&report).unwrap();
    match std::env::args().nth(1).filter(|a| !a.starts_with("--")) {
        Some(p) => std::fs::write(p, text).unwrap(),
        None => println!("{text}"),
    }
}
