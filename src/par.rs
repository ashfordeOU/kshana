// SPDX-License-Identifier: AGPL-3.0-only
//! Deterministic parallel map over run indices.
//!
//! A Monte Carlo ensemble whose run `k` depends only on `k` (its own seed, its own inputs) can use
//! every core and still give the same bytes as one core: [`map_indexed`] runs `f(0)`, `f(1)`, ...
//! on a pool of scoped threads and returns the results **in index order**, so every reduction the
//! caller does afterwards (sums, percentiles, the first member) sees exactly the sequence a plain
//! loop would have produced. Nothing is shared between runs; there is no global state.
//!
//! The number of threads is [`threads`]: the `KSHANA_THREADS` environment variable when it is a
//! positive whole number, otherwise every available core. One thread (or WebAssembly, which has
//! none) runs the loop in the calling thread. The result never depends on the number.

/// Threads to use: `KSHANA_THREADS` when set to a positive whole number, else every available
/// core; always 1 on WebAssembly.
pub fn threads() -> usize {
    if cfg!(target_arch = "wasm32") {
        return 1;
    }
    std::env::var("KSHANA_THREADS")
        .ok()
        .and_then(|v| v.trim().parse::<usize>().ok())
        .filter(|&n| n >= 1)
        .unwrap_or_else(|| std::thread::available_parallelism().map_or(1, |n| n.get()))
}

/// `(0..n).map(f).collect()`, run on [`threads`] threads, results in index order.
pub fn map_indexed<T, F>(n: usize, f: F) -> Vec<T>
where
    T: Send,
    F: Fn(usize) -> T + Sync,
{
    map_indexed_on(threads(), n, f)
}

/// The error codes a worker recorded, handed back to the caller.
type Codes = Vec<(String, String)>;

thread_local! {
    /// Set on the pool's own workers: a parallel map nested inside another (a campaign of sweeps)
    /// runs inline on its worker instead of spawning cores × cores threads.
    static IN_POOL: std::cell::Cell<bool> = const { std::cell::Cell::new(false) };
}

/// [`map_indexed`] on exactly `threads` threads (at least one), for callers and tests that fix it.
/// Inside another parallel map it runs on the calling worker.
pub fn map_indexed_on<T, F>(threads: usize, n: usize, f: F) -> Vec<T>
where
    T: Send,
    F: Fn(usize) -> T + Sync,
{
    let nested = IN_POOL.with(|p| p.get());
    let threads = if nested {
        1
    } else {
        threads.max(1).min(n.max(1))
    };
    if threads == 1 || cfg!(target_arch = "wasm32") {
        return (0..n).map(f).collect();
    }
    // Contiguous, nearly equal chunks: chunk `t` holds indices [start(t), start(t + 1)).
    let start = |t: usize| t * n / threads;
    let f = &f;
    // Each worker speaks the caller's language (an `in_english` block stays English on every
    // thread, so machine files are the same bytes), and hands back the error codes it recorded so
    // an error raised on a worker still prints with its code.
    let lang = crate::i18n::current();
    let parts: Vec<(Vec<T>, Codes)> = std::thread::scope(|s| {
        let handles: Vec<_> = (0..threads)
            .map(|t| {
                let lang = lang.clone();
                s.spawn(move || {
                    IN_POOL.with(|p| p.set(true));
                    let v = crate::i18n::with_lang(lang, || {
                        (start(t)..start(t + 1)).map(f).collect::<Vec<T>>()
                    });
                    (v, crate::i18n::drain_codes())
                })
            })
            .collect();
        handles
            .into_iter()
            .map(|h| match h.join() {
                Ok(v) => v,
                // A run that panics panics here too, as it would in a plain loop.
                Err(e) => std::panic::resume_unwind(e),
            })
            .collect()
    });
    let mut out = Vec::with_capacity(n);
    for (p, codes) in parts {
        out.extend(p);
        crate::i18n::absorb_codes(codes);
    }
    out
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn order_and_values_match_a_plain_loop_for_every_thread_count() {
        let f = |k: usize| (k as f64).sin() * 1e3 + k as f64;
        let plain: Vec<f64> = (0..1003).map(f).collect();
        for t in [1, 2, 3, 7, 16, 2000] {
            let par = map_indexed_on(t, 1003, f);
            assert_eq!(par.len(), plain.len());
            assert!(
                par.iter()
                    .zip(&plain)
                    .all(|(a, b)| a.to_bits() == b.to_bits()),
                "threads {t}"
            );
        }
    }

    #[test]
    fn workers_speak_the_callers_language_and_hand_back_error_codes() {
        let de = crate::i18n::resolve("de").expect("German is in the catalogue");
        let langs = crate::i18n::with_lang(de.clone(), || {
            map_indexed_on(4, 8, |_| crate::i18n::current().tag().to_string())
        });
        assert!(langs.iter().all(|l| l == de.tag()), "{langs:?}");
        let msgs = map_indexed_on(4, 8, |k| {
            crate::terr!(
                "e-scenario-version-newer",
                stated = k.to_string(),
                current = "1"
            )
        });
        for m in &msgs {
            assert_eq!(
                crate::i18n::code_of(m).as_deref(),
                Some("E-SCENARIO-VERSION-NEWER"),
                "{m}"
            );
        }
    }

    #[test]
    fn a_nested_map_runs_inline_on_its_worker_and_keeps_order() {
        let outer = map_indexed_on(4, 6, |i| {
            let me = std::thread::current().id();
            let inner = map_indexed_on(8, 5, |j| (std::thread::current().id(), i * 10 + j));
            assert!(
                inner.iter().all(|(t, _)| *t == me),
                "nested map left its worker"
            );
            inner.into_iter().map(|(_, v)| v).collect::<Vec<_>>()
        });
        let want: Vec<Vec<usize>> = (0..6)
            .map(|i| (0..5).map(|j| i * 10 + j).collect())
            .collect();
        assert_eq!(outer, want);
    }

    #[test]
    fn empty_and_single_inputs() {
        assert!(map_indexed_on(8, 0, |k| k).is_empty());
        assert_eq!(map_indexed_on(8, 1, |k| k + 1), vec![1]);
    }

    #[test]
    #[should_panic(expected = "run 5 failed")]
    fn a_panicking_run_panics_the_caller() {
        let _ = map_indexed_on(4, 10, |k| {
            if k == 5 {
                panic!("run 5 failed");
            }
            k
        });
    }
}
