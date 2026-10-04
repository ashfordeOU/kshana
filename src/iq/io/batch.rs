// SPDX-License-Identifier: AGPL-3.0-only
//! A batch runner: apply a closure to many inputs on worker threads.
//!
//! Built on `std::thread::scope` and channels only. At most `workers` inputs are in flight
//! at once (the work queue is a bounded `sync_channel`), each worker owns its own buffers
//! through the closure, and results come back in **input order** whatever order the
//! workers finish in, so a batch run is deterministic given a deterministic closure. A
//! panic inside the closure is caught and reported as that input's error; the other inputs
//! still run.

use super::report::BatchResult;
use std::panic::{catch_unwind, AssertUnwindSafe};
use std::path::{Path, PathBuf};
use std::sync::{mpsc, Mutex};

/// The worker count used for `workers = 0`: the machine's available parallelism.
pub fn default_workers() -> usize {
    std::thread::available_parallelism()
        .map(|n| n.get())
        .unwrap_or(1)
}

fn panic_message(p: Box<dyn std::any::Any + Send>) -> String {
    if let Some(s) = p.downcast_ref::<&str>() {
        format!("panicked: {s}")
    } else if let Some(s) = p.downcast_ref::<String>() {
        format!("panicked: {s}")
    } else {
        "panicked".to_string()
    }
}

/// Apply `f` to every item on up to `workers` threads (0 = [`default_workers`]); the
/// results are returned in the order of `items`.
pub fn run_batch_items<I, T, F>(items: &[I], workers: usize, f: F) -> Vec<Result<T, String>>
where
    I: Sync,
    T: Send,
    F: Fn(&I) -> Result<T, String> + Sync,
{
    let n = items.len();
    if n == 0 {
        return Vec::new();
    }
    let workers = if workers == 0 {
        default_workers()
    } else {
        workers
    }
    .clamp(1, n);
    let (work_tx, work_rx) = mpsc::sync_channel::<usize>(workers);
    let work_rx = Mutex::new(work_rx);
    let (res_tx, res_rx) = mpsc::channel::<(usize, Result<T, String>)>();
    let mut slots: Vec<Option<Result<T, String>>> = (0..n).map(|_| None).collect();
    std::thread::scope(|s| {
        for _ in 0..workers {
            let res_tx = res_tx.clone();
            let (work_rx, f) = (&work_rx, &f);
            s.spawn(move || loop {
                let next = work_rx.lock().map(|rx| rx.recv());
                let Ok(Ok(i)) = next else { break };
                let r = catch_unwind(AssertUnwindSafe(|| f(&items[i])))
                    .unwrap_or_else(|p| Err(panic_message(p)));
                if res_tx.send((i, r)).is_err() {
                    break;
                }
            });
        }
        drop(res_tx);
        for i in 0..n {
            if work_tx.send(i).is_err() {
                break;
            }
        }
        drop(work_tx);
        for (i, r) in res_rx.iter() {
            slots[i] = Some(r);
        }
    });
    slots
        .into_iter()
        .map(|r| r.unwrap_or_else(|| Err("worker exited before processing this input".into())))
        .collect()
}

/// Apply `f` to every file on up to `workers` threads (0 = [`default_workers`]),
/// returning one [`BatchResult`] per path in the order given.
pub fn run_batch<T, F>(paths: &[PathBuf], workers: usize, f: F) -> Vec<BatchResult<T>>
where
    T: Send,
    F: Fn(&Path) -> Result<T, String> + Sync,
{
    run_batch_items(paths, workers, |p| f(p))
        .into_iter()
        .enumerate()
        .map(|(index, outcome)| BatchResult {
            index,
            input: paths[index].display().to_string(),
            outcome,
        })
        .collect()
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn a_panicking_input_is_an_error_and_the_rest_still_run() {
        let items: Vec<u32> = (0..10).collect();
        let out = run_batch_items(&items, 3, |&x| {
            if x == 4 {
                panic!("four");
            }
            Ok(x * 2)
        });
        assert_eq!(out.len(), 10);
        assert!(out[4].as_ref().unwrap_err().contains("four"));
        assert_eq!(out[9], Ok(18));
    }
}
