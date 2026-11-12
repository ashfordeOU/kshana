// SPDX-License-Identifier: AGPL-3.0-only
//! B3b synthetic gate runner (`xval/tdoa-locator/README.md`, readings T14 to T16).
//!
//! ```text
//! cargo run --release --example locate_tdoa_gate -- dev                 # seeds 5001-5200, run once
//! cargo run --release --example locate_tdoa_gate -- gate                # seeds 6001-7000, run once
//! cargo run --release --example locate_tdoa_gate -- oracle-inputs DIR   # seeds 6001-6020 for oracle.py
//! cargo run --release --example locate_tdoa_gate -- answers             # the engine's rows for 6001-6020
//! ```
//! Output is JSON on stdout.

use kshana::locate_tdoa::{
    gate_summary, locate, oracle_input, session, SessionResult, DEV_SEEDS, GATE_SEEDS,
};

fn rows(seeds: (u64, u64), first: u64) -> Vec<SessionResult> {
    let all: Vec<u64> = (seeds.0..=seeds.1).collect();
    let threads = std::thread::available_parallelism().map_or(1, |n| n.get());
    let mut out: Vec<SessionResult> = std::thread::scope(|sc| {
        let hs: Vec<_> = (0..threads)
            .map(|t| {
                let mine: Vec<u64> = all.iter().copied().skip(t).step_by(threads).collect();
                sc.spawn(move || {
                    mine.into_iter()
                        .map(|s| locate(&session(s, first)))
                        .collect::<Vec<_>>()
                })
            })
            .collect();
        hs.into_iter()
            .flat_map(|h| h.join().expect("thread"))
            .collect()
    });
    out.sort_by_key(|r| r.seed);
    out
}

fn main() {
    let args: Vec<String> = std::env::args().skip(1).collect();
    match args.first().map(String::as_str) {
        Some("dev") => {
            let r = rows(DEV_SEEDS, DEV_SEEDS.0);
            println!(
                "{}",
                serde_json::json!({"seeds": DEV_SEEDS, "summary": gate_summary(&r), "rows": r})
            );
        }
        Some("gate") => {
            let r = rows(GATE_SEEDS, GATE_SEEDS.0);
            println!(
                "{}",
                serde_json::json!({"seeds": GATE_SEEDS, "summary": gate_summary(&r), "rows": r})
            );
        }
        Some("oracle-inputs") => {
            let dir = std::path::PathBuf::from(args.get(1).expect("DIR"));
            std::fs::create_dir_all(&dir).expect("DIR");
            for seed in GATE_SEEDS.0..GATE_SEEDS.0 + 20 {
                let (doc, iq) = oracle_input(&session(seed, GATE_SEEDS.0));
                std::fs::write(dir.join(format!("{seed}.json")), doc).expect("write");
                std::fs::write(dir.join(format!("{seed}.iq")), iq).expect("write");
            }
        }
        Some("answers") => {
            let r = rows((GATE_SEEDS.0, GATE_SEEDS.0 + 19), GATE_SEEDS.0);
            println!("{}", serde_json::to_string_pretty(&r).expect("json"));
        }
        _ => eprintln!("usage: locate_tdoa_gate dev | gate | oracle-inputs DIR | answers"),
    }
}
