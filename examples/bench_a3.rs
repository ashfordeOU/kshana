// SPDX-License-Identifier: AGPL-3.0-only
//! Bar A3 of `xval/bench/PREREGISTRATION-0.40-A2.md` (EXPLORATORY): the folder-clustered bootstrap
//! of the pooled `agc_k_sigma` AUC over the 14 evaluable folders of the JammerTest 2024 archive.
//!
//! ```text
//! cargo run --release --example bench_a3 -- <extracted JammerTest 2024 dir>
//! ```
use kshana::bench::tasks::{a_load, UNDEFINED_SCORE};
use kshana::receiver_trust::calibration::Stat;
use rand::{Rng, SeedableRng};
use rand_chacha::ChaCha8Rng;
use std::collections::BTreeMap;

/// Mann-Whitney AUC with ties counted half, by midranks.
fn auc(pos: &[f64], neg: &[f64]) -> f64 {
    let mut all: Vec<(f64, bool)> = pos
        .iter()
        .map(|&x| (x, true))
        .chain(neg.iter().map(|&x| (x, false)))
        .collect();
    all.sort_by(|a, b| a.0.total_cmp(&b.0));
    let (mut rank_sum, mut i) = (0.0, 0);
    while i < all.len() {
        let mut j = i;
        while j + 1 < all.len() && all[j + 1].0 == all[i].0 {
            j += 1;
        }
        let mid = 0.5 * ((i + 1) as f64 + (j + 1) as f64);
        rank_sum += mid * all[i..=j].iter().filter(|x| x.1).count() as f64;
        i = j + 1;
    }
    let (n1, n0) = (pos.len() as f64, neg.len() as f64);
    (rank_sum - n1 * (n1 + 1.0) / 2.0) / (n1 * n0)
}

fn main() {
    let root = std::env::args()
        .nth(1)
        .expect("the extracted archive directory");
    let t = a_load(std::path::Path::new(&root), None).expect("archive loads");
    // Per folder: positive and negative agc_k_sigma scores.
    let mut per: BTreeMap<String, (Vec<f64>, Vec<f64>)> = BTreeMap::new();
    for f in &t.folders {
        per.entry(f.0.clone()).or_default();
    }
    for l in &t.labels {
        let path = l.id.rsplit_once('#').unwrap().0.to_string();
        let s = t.samples[&l.id].get(Stat::Agc).unwrap_or(UNDEFINED_SCORE);
        let e = per.entry(path).or_default();
        if l.positive {
            e.0.push(s)
        } else {
            e.1.push(s)
        }
    }
    let jam: Vec<&String> = t.folders.iter().filter(|f| f.2 > 0).map(|f| &f.0).collect();
    let oth: Vec<&String> = t
        .folders
        .iter()
        .filter(|f| f.2 == 0)
        .map(|f| &f.0)
        .collect();
    println!(
        "folders: {} evaluable, {} jamming, {} other",
        t.folders.len(),
        jam.len(),
        oth.len()
    );
    let pool = |sel: &[&String]| -> f64 {
        let (mut p, mut n) = (Vec::new(), Vec::new());
        for f in sel {
            p.extend(&per[*f].0);
            n.extend(&per[*f].1);
        }
        auc(&p, &n)
    };
    let all: Vec<&String> = t.folders.iter().map(|f| &f.0).collect();
    let point = pool(&all);
    println!("point estimate (pooled, 14 folders): {point:.6}");
    let mut rng = ChaCha8Rng::seed_from_u64(4001);
    let b = 2000;
    let mut v = Vec::with_capacity(b);
    for _ in 0..b {
        let mut sel: Vec<&String> = Vec::new();
        for _ in 0..jam.len() {
            sel.push(jam[rng.gen_range(0..jam.len())]);
        }
        for _ in 0..oth.len() {
            sel.push(oth[rng.gen_range(0..oth.len())]);
        }
        v.push(pool(&sel));
    }
    v.sort_by(|a, b| a.total_cmp(b));
    let (lo, hi) = (
        v[(0.025 * b as f64).floor() as usize - 1],
        v[(0.975 * b as f64).ceil() as usize - 1],
    );
    println!(
        "bootstrap B={b} seed 4001: 2.5% = {lo:.6}, 97.5% = {hi:.6}, median = {:.6}",
        v[b / 2]
    );
    println!(
        "A3 (2.5% quantile >= 0.80): {}",
        if lo >= 0.80 { "MET" } else { "NOT MET" }
    );
    println!("leave-one-jamming-folder-out AUCs:");
    for (k, f) in jam.iter().enumerate() {
        let sel: Vec<&String> = all.iter().copied().filter(|x| x != f).collect();
        println!("  {k}: {f}: {:.6}", pool(&sel));
    }
    let (p, n): (Vec<f64>, Vec<f64>) = (
        all.iter().flat_map(|f| per[*f].0.clone()).collect(),
        all.iter().flat_map(|f| per[*f].1.clone()).collect(),
    );
    println!(
        "cross-check with impairment_eval::auc: {:.6}",
        kshana::impairment_eval::auc(&p, &n)
    );
}
