// SPDX-License-Identifier: AGPL-3.0-only
//! Oracle for the matrix row "Heterogeneous UTC(k) traceability-bias integrity overbound"
//! (row 147, M083), round 2: the per-source bias overbound built from each laboratory's
//! REALISED offsets (`integrity::hetero_budget::source_bias_from_realised_offsets`, a paired
//! Gaussian overbound after Rife et al. 2006 and DeCleene 2000, plus an ageing term that
//! overbounds the offset's change over the staleness interval), trained on 2015-2022 and
//! tested on 2023-2026.
//!
//! WHY A NEW COMPARISON. Round 1 inflated the published Circular T uncertainty u and found
//! it exceeded by 50.8 % of offsets (record M083): u is the uncertainty of the BIPM's
//! determination of UTC-UTC(k), not a bound on the offset. The plan's remedy is an
//! overbound of the realised offsets themselves. Every BIPM series was seen in round 1
//! (against u only). The method below was developed on the TRAINING years alone (2011-2014
//! training scored on 2015-2018, and 2015-2018 on 2019-2022: pooled exceedance 1.96 % and
//! 1.84 % at the 1e-2 allocation, disclosed); no 2023-2026 value has been scored against
//! any realised-offset overbound before this commit.
//!
//! QUANTITY. Pooled fraction of 2023-2026 laboratory offsets |UTC-UTC(k)| that exceed the
//! laboratory's overbound b at the allocated two-sided tail 1e-2.
//!
//! INPUTS. BIPM Time Department per-laboratory [UTC-UTC(k)] files
//! (https://webtai.bipm.org/ftp/pub/tai/other-products/utcr/, free use with citation),
//! retrieved 2026-09-30, read from `$KSHANA_ORACLES/data/bipm/utclab/` with every file's
//! SHA-256 checked against the round-1 pin list; skipped, saying so, when absent. Every row
//! whose first two fields parse as an integer MJD and a number (rows printed "-" excluded).
//!
//! RULES, fixed now. Training: MJD 57023-59944 (2015-01-01 to 2022-12-31); test: MJD >=
//! 59945. A laboratory takes part when it has at least 100 training values and at least one
//! test value. Per laboratory, per test row: lag = test MJD - the laboratory's last training
//! MJD, rounded to the nearest multiple of 5 days; increments = every training pair
//! x(t + lag) - x(t) with both MJDs present; b = integrity_bias_overbound(
//! source_bias_from_realised_offsets(training offsets, increments, 1e-2), 1e-2). A test row
//! whose lag has fewer than 20 training pairs has no overbound and COUNTS AS AN EXCEEDANCE.
//!
//! ORACLE (Measured): the 2023-2026 offsets themselves.
//!
//! TOLERANCE, unchanged from round 1: pooled exceedance fraction <= 1e-2 (the allocated
//! tail). The Clopper-Pearson 95 % interval and the per-laboratory rates are reported.
//!
//! VERDICT (first and only run, 2026-10-02): DISAGREES, the row stays MODELLED. 82
//! laboratories, 20 826 test offsets, 694 exceedances: 0.0333 (Clopper-Pearson 95 % interval
//! printed by the test). 430 of the 694 are rows whose staleness lag had fewer than 20
//! training pairs (gappy laboratory series), counted as exceedances by rule; without them
//! the rate is 264 / 20 396 = 0.0129, still above 1e-2 (informational, not the bar). The
//! excess sits in a few laboratories whose offsets changed regime after 2022 (largest: KZ,
//! AGGO, NSAI, IPQ, UAE, NAO). Against round 1 (0.508) the realised-offset overbound is
//! fifteen times closer, but it does not bound 2023-2026 UTC(k) offsets at the 1e-2
//! allocation. The CP interval code was corrected after the run (its upper limit solved the
//! wrong sign); the bar does not use it.

use kshana::integrity::hetero_budget::{
    integrity_bias_overbound, source_bias_from_realised_offsets, UtcRealizer,
};
use std::collections::BTreeMap;
use std::path::PathBuf;

const PINS: &str = include_str!("fixtures/hetero_budget_utc_k_oracle/utclab.sha256");
const TAIL: f64 = 1e-2;
const ALLOCATION: f64 = 1e-2;
const TRAIN: (i64, i64) = (57_023, 59_944);
const TEST_FROM: i64 = 59_945;
const MIN_TRAIN: usize = 100;
const MIN_PAIRS: usize = 20;

fn data_dir() -> PathBuf {
    let root = std::env::var_os("KSHANA_ORACLES")
        .map(PathBuf::from)
        .unwrap_or_else(|| {
            PathBuf::from(std::env::var_os("HOME").unwrap_or_default()).join("Code/kshana-oracles")
        });
    root.join("data/bipm/utclab")
}

fn sha256_hex(bytes: &[u8]) -> String {
    use sha2::{Digest, Sha256};
    Sha256::digest(bytes)
        .iter()
        .map(|b| format!("{b:02x}"))
        .collect()
}

/// Every pinned laboratory's (MJD -> offset ns) series, or `None` when the data is absent.
fn load() -> Option<Vec<(String, BTreeMap<i64, f64>)>> {
    let dir = data_dir();
    if !dir.is_dir() {
        return None;
    }
    let mut labs = Vec::new();
    for pin in PINS.lines().filter(|l| !l.trim().is_empty()) {
        let (hash, name) = pin.split_once("  ").expect("sha256 line");
        let bytes = std::fs::read(dir.join(name)).unwrap_or_else(|e| panic!("{name}: {e}"));
        assert_eq!(
            sha256_hex(&bytes),
            hash,
            "{name} differs from the pinned bytes"
        );
        let text = String::from_utf8_lossy(&bytes);
        let series: BTreeMap<i64, f64> = text
            .lines()
            .filter_map(|l| {
                let mut f = l.split_whitespace();
                let m = f.next()?.parse::<i64>().ok()?;
                let v = f.next()?.parse::<f64>().ok()?;
                v.is_finite().then_some((m, v))
            })
            .collect();
        labs.push((name.trim_start_matches("utc-").to_string(), series));
    }
    Some(labs)
}

/// Clopper-Pearson two-sided 95 % interval for k of n, by bisection on the binomial tail.
fn clopper_pearson(k: usize, n: usize) -> (f64, f64) {
    let ln_binom_tail = |p: f64, from: usize| -> f64 {
        // P(X >= from) for X ~ Bin(n, p), summed in log space.
        let mut acc = 0.0f64;
        let mut ln_c = 0.0f64; // ln C(n, 0)
        for j in 0..=n {
            if j > 0 {
                ln_c += ((n - j + 1) as f64).ln() - (j as f64).ln();
            }
            if j >= from {
                acc += (ln_c + j as f64 * p.ln() + (n - j) as f64 * (1.0 - p).ln()).exp();
            }
        }
        acc
    };
    let solve = |f: &dyn Fn(f64) -> f64| {
        let (mut lo, mut hi) = (1e-12, 1.0 - 1e-12);
        for _ in 0..100 {
            let mid = 0.5 * (lo + hi);
            if f(mid) < 0.0 {
                lo = mid;
            } else {
                hi = mid;
            }
        }
        0.5 * (lo + hi)
    };
    let lower = if k == 0 {
        0.0
    } else {
        solve(&|p| ln_binom_tail(p, k) - 0.025)
    };
    let upper = if k == n {
        1.0
    } else {
        solve(&|p| ln_binom_tail(p, k + 1) - 0.975)
    };
    (lower, upper)
}

/// (laboratories, test rows, exceedances, rows without an overbound, per-lab rates).
fn run() -> Option<(usize, usize, usize, usize, Vec<(String, usize, usize)>)> {
    let labs = load()?;
    let (mut n, mut exc, mut nob) = (0usize, 0usize, 0usize);
    let mut per = Vec::new();
    for (lab, series) in &labs {
        let train: Vec<(i64, f64)> = series
            .range(TRAIN.0..=TRAIN.1)
            .map(|(&m, &v)| (m, v))
            .collect();
        let test: Vec<(i64, f64)> = series.range(TEST_FROM..).map(|(&m, &v)| (m, v)).collect();
        if train.len() < MIN_TRAIN || test.is_empty() {
            continue;
        }
        let last = train.last().unwrap().0;
        let offsets: Vec<f64> = train.iter().map(|&(_, v)| v * 1e-9).collect();
        let mut cache: BTreeMap<i64, Option<f64>> = BTreeMap::new();
        let mut e_lab = 0usize;
        for &(m, v) in &test {
            let lag = ((m - last) as f64 / 5.0).round() as i64 * 5;
            let b = *cache.entry(lag).or_insert_with(|| {
                let inc: Vec<f64> = train
                    .iter()
                    .filter_map(|&(t, x)| {
                        series
                            .get(&(t + lag))
                            .filter(|_| t + lag <= TRAIN.1)
                            .map(|y| (y - x) * 1e-9)
                    })
                    .collect();
                if inc.len() < MIN_PAIRS {
                    return None;
                }
                let sb = source_bias_from_realised_offsets(&offsets, &inc, TAIL, UtcRealizer(0))?;
                Some(integrity_bias_overbound(&sb, TAIL) * 1e9)
            });
            match b {
                Some(b) if v.abs() <= b => {}
                Some(_) => e_lab += 1,
                None => {
                    e_lab += 1;
                    nob += 1;
                }
            }
        }
        n += test.len();
        exc += e_lab;
        per.push((lab.clone(), test.len(), e_lab));
    }
    Some((per.len(), n, exc, nob, per))
}

#[test]
#[ignore = "pre-registered bar not met (2026-10-02): pooled exceedance 694 / 20 826 = 0.0333 against \
            1e-2 (430 of them rows with no overbound; 0.0127 without those)"]
fn realised_offset_overbound_holds_on_2023_2026() {
    let Some((nl, n, exc, nob, mut per)) = run() else {
        eprintln!(
            "SKIPPED: BIPM UTC(k) files not found under {} (set KSHANA_ORACLES); this oracle \
             did not run",
            data_dir().display()
        );
        return;
    };
    let frac = exc as f64 / n as f64;
    let (lo, hi) = clopper_pearson(exc, n);
    per.sort_by(|a, b| (b.2 as f64 / b.1 as f64).total_cmp(&(a.2 as f64 / a.1 as f64)));
    println!(
        "labs {nl} test rows {n} exceedances {exc} (of which no overbound {nob}) fraction \
         {frac:.4} (Clopper-Pearson 95 %: {lo:.4} to {hi:.4}); worst: {:?}",
        &per[..12.min(per.len())]
    );
    assert!(
        frac <= ALLOCATION,
        "pooled exceedance {frac:.4} > {ALLOCATION}"
    );
}

/// Pins the recorded outcome (first and only run, 2026-10-02).
#[test]
fn realised_offset_overbound_finding() {
    let Some((nl, n, exc, nob, _)) = run() else {
        eprintln!(
            "SKIPPED: BIPM UTC(k) files not found under {} (set KSHANA_ORACLES); this oracle \
             did not run",
            data_dir().display()
        );
        return;
    };
    assert_eq!(
        (nl, n, exc, nob),
        (82, 20_826, 694, 430),
        "recorded finding changed"
    );
}
