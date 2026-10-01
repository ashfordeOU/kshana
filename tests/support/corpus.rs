// SPDX-License-Identifier: AGPL-3.0-only
//! The bundled-scenario corpus, walked on every core.
//!
//! Three integration tests run every runnable file under `scenarios/`: `determinism`
//! (twice), `advanced_report` and `animation`. They used to walk it one file at a time.
//! The corpus grew from 74 files (0.27.2) to 139 (0.29.0), and a handful of the new
//! low-Earth-orbit (LEO) navigation scenarios cost minutes each in a debug build
//! (`leo-ppp-convergence` alone is about two minutes, more under coverage
//! instrumentation). Serial walks made those three binaries 37 of the coverage job's
//! minutes on 0.29.0, against 3 on 0.27.2, and the job grew from 91 to 143 minutes.
//!
//! [`par_map`] keeps every scenario in every test and every assertion where it was; it
//! only runs the independent per-file work on a fixed pool of threads and hands the
//! results back in the corpus's sorted order, so what the tests report and assert does
//! not depend on which thread finished first.
//!
//! Included with `#[path = "support/corpus.rs"] mod corpus;`; it is not part of
//! `support/mod.rs`, so the binaries that do not walk the corpus do not compile it.
#![allow(dead_code)]

use std::path::{Path, PathBuf};
use std::sync::atomic::{AtomicBool, AtomicUsize, Ordering};
use std::sync::Mutex;

/// Every `scenarios/*.toml` except the suite manifests (`*.suite.toml`, which list other
/// scenarios and run through the study path), sorted by path. The paths are relative
/// (`scenarios/<file>.toml`; cargo runs integration tests from the package root), since
/// the reports name the scenario they were run from.
pub fn runnable_scenarios() -> Vec<PathBuf> {
    let mut v: Vec<PathBuf> = std::fs::read_dir(Path::new("scenarios"))
        .expect("scenarios dir")
        .filter_map(Result::ok)
        .map(|e| e.path())
        .filter(|p| p.extension().is_some_and(|x| x == "toml"))
        .filter(|p| {
            !p.file_name()
                .and_then(|n| n.to_str())
                .unwrap_or_default()
                .ends_with(".suite.toml")
        })
        .collect();
    v.sort();
    v
}

/// How many worker threads [`par_map`] uses for `n` items: `KSHANA_CORPUS_THREADS` if set
/// (1 restores the old serial walk), otherwise the machine's available parallelism,
/// never more than `n` and never fewer than 1.
pub fn workers(n: usize) -> usize {
    let want = std::env::var("KSHANA_CORPUS_THREADS")
        .ok()
        .and_then(|v| v.trim().parse::<usize>().ok())
        .unwrap_or_else(|| {
            std::thread::available_parallelism()
                .map(|p| p.get())
                .unwrap_or(1)
        });
    want.clamp(1, n.max(1))
}

/// Apply `f` to every item on [`workers`] threads; the results come back in `items`'
/// order. A panic in `f` stops the other workers from taking new items and is re-raised
/// once they have finished (its message, which names the scenario, is printed by the
/// panic hook as it happens).
pub fn par_map<T: Sync, R: Send>(items: &[T], f: impl Fn(&T) -> R + Sync) -> Vec<R> {
    let next = AtomicUsize::new(0);
    let failed = AtomicBool::new(false);
    let slots: Vec<Mutex<Option<R>>> = items.iter().map(|_| Mutex::new(None)).collect();

    struct FlagOnPanic<'a>(&'a AtomicBool);
    impl Drop for FlagOnPanic<'_> {
        fn drop(&mut self) {
            if std::thread::panicking() {
                self.0.store(true, Ordering::SeqCst);
            }
        }
    }

    std::thread::scope(|s| {
        for _ in 0..workers(items.len()) {
            s.spawn(|| {
                let _flag = FlagOnPanic(&failed);
                while !failed.load(Ordering::SeqCst) {
                    let i = next.fetch_add(1, Ordering::SeqCst);
                    if i >= items.len() {
                        break;
                    }
                    let r = f(&items[i]);
                    *slots[i].lock().expect("result slot") = Some(r);
                }
            });
        }
    });
    slots
        .into_iter()
        .map(|m| {
            m.into_inner()
                .expect("result slot")
                .expect("every item was processed")
        })
        .collect()
}

#[test]
fn par_map_keeps_the_input_order_and_visits_every_item_once() {
    let items: Vec<usize> = (0..257).collect();
    let calls = AtomicUsize::new(0);
    let out = par_map(&items, |&i| {
        calls.fetch_add(1, Ordering::SeqCst);
        // Later items finish first, so an order bug would show.
        std::thread::sleep(std::time::Duration::from_micros(
            ((257 - i) % 7) as u64 * 50,
        ));
        i * 3
    });
    assert_eq!(calls.load(Ordering::SeqCst), items.len());
    assert_eq!(out, items.iter().map(|i| i * 3).collect::<Vec<_>>());
    assert!(par_map(&Vec::<u8>::new(), |&b| b).is_empty());
}

#[test]
fn par_map_reraises_a_panic_from_a_worker() {
    let items: Vec<u32> = (0..64).collect();
    let r = std::panic::catch_unwind(|| {
        par_map(&items, |&i| {
            assert_ne!(i, 17, "item 17 fails");
            i
        })
    });
    assert!(r.is_err(), "a failing item must fail the whole walk");
}

#[test]
fn the_corpus_is_the_runnable_scenarios_in_sorted_order() {
    let v = runnable_scenarios();
    assert!(!v.is_empty());
    assert!(v.windows(2).all(|w| w[0] < w[1]), "sorted, no duplicates");
    assert!(v.iter().all(|p| {
        let n = p.file_name().unwrap().to_string_lossy();
        n.ends_with(".toml") && !n.ends_with(".suite.toml")
    }));
}
