// SPDX-License-Identifier: AGPL-3.0-only
//! B3c synthetic gate runner (`xval/tdoa-locator-b3c/README.md`, readings U10 to U13).
//!
//! ```text
//! cargo run --release --example locate_tdoa_b3c_gate -- dev                 # seeds 8001-8200, run once
//! cargo run --release --example locate_tdoa_b3c_gate -- gate                # seeds 9001-10000, run once
//! cargo run --release --example locate_tdoa_b3c_gate -- oracle-inputs DIR   # seeds 9001-9020 for oracle.py
//! cargo run --release --example locate_tdoa_b3c_gate -- answers             # the engine's rows for 9001-9020
//! ```
//! `oracle-inputs DIR dev` and `answers dev` do the same for development seeds 8001 to 8020 (fault finding before the
//! gate).
//! Output is JSON on stdout.

use kshana::locate_tdoa::{oracle_input, session};
use kshana::locate_tdoa_b3c::{gate_summary, locate, B3cResult, DEV_SEEDS, GATE_SEEDS};

fn rows(seeds: (u64, u64), first: u64) -> Vec<B3cResult> {
    let all: Vec<u64> = (seeds.0..=seeds.1).collect();
    let threads = std::thread::available_parallelism().map_or(1, |n| n.get());
    let mut out: Vec<B3cResult> = std::thread::scope(|sc| {
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
        Some(set @ ("dev" | "gate")) => {
            let seeds = if set == "dev" { DEV_SEEDS } else { GATE_SEEDS };
            let r = rows(seeds, seeds.0);
            println!(
                "{}",
                serde_json::json!({"seeds": seeds, "summary": gate_summary(&r), "rows": r})
            );
        }
        Some("oracle-inputs") => {
            let dir = std::path::PathBuf::from(args.get(1).expect("DIR"));
            let first = if args.get(2).map(String::as_str) == Some("dev") {
                DEV_SEEDS.0
            } else {
                GATE_SEEDS.0
            };
            std::fs::create_dir_all(&dir).expect("DIR");
            for seed in first..first + 20 {
                let (doc, iq) = oracle_input(&session(seed, first));
                std::fs::write(dir.join(format!("{seed}.json")), doc).expect("write");
                std::fs::write(dir.join(format!("{seed}.iq")), iq).expect("write");
            }
        }
        Some("answers") => {
            let first = if args.get(1).map(String::as_str) == Some("dev") {
                DEV_SEEDS.0
            } else {
                GATE_SEEDS.0
            };
            let r = rows((first, first + 19), first);
            println!("{}", serde_json::to_string_pretty(&r).expect("json"));
        }
        _ => eprintln!("usage: locate_tdoa_b3c_gate dev | gate | oracle-inputs DIR | answers"),
    }
}
