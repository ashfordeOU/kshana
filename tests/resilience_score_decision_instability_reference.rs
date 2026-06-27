// SPDX-License-Identifier: AGPL-3.0-only
//! Externally validate the resilience instability study's rank-statistics
//! kernels against an **independent third-party authority**: scipy 1.18.0
//! (Virtanen et al., *Nature Methods* 17, 2020; BSD-3-Clause) and numpy 2.4.6
//! (Harris et al., *Nature* 585, 2020; BSD-3-Clause).
//!
//! Four standalone primitives in `kshana::resilience::stats` are checked against
//! scipy's / numpy's own routines — the same library-vs-library validation DOP
//! gets against gnss_lib_py and the trade kernels against scipy:
//!
//!   * `kendall_tau`   vs `scipy.stats.kendalltau(variant='b')`  — EXACT (1e-12)
//!     over tie-free, +1/-1 extremes, single-swap, and tie-heavy inputs. The one
//!     documented divergence is the all-tied input: the tau-b denominator is 0,
//!     scipy returns NaN, kshana returns the finite 0.0 by contract; those rows
//!     assert the kshana-contract 0.0.
//!   * `rank_of`       vs `scipy.stats.rankdata(-scores, 'ordinal') - 1` — EXACT
//!     integer (rank 0 = best, ties broken by ascending original index).
//!   * `percentile_ci` vs `numpy.percentile(method='nearest')` — EXACT (1e-12)
//!     value on the (alpha/2, 1-alpha/2) endpoints. The generator only emits
//!     cases whose nearest-rank virtual index is unambiguous (not a half-integer
//!     boundary) so the two round-half rules pick the identical sample.
//!   * `dirichlet_weights` empirical mean vs `scipy.stats.dirichlet.mean(alpha)`
//!     — a STATISTICAL CONVERGENCE check (Monte-Carlo, ~1/sqrt(N)), NOT 1e-12:
//!     it confirms the seeded simplex sampler is unbiased toward the analytic
//!     Dirichlet mean.
//!
//! Honest scope: this validates the study's rank-statistics SPINE (the tau-b
//! dispersion metric `kendall_tau_mean`, the competition-rank vectors that drive
//! `top1_flip_rate`/`rank_ranges`, the percentile-CI endpoints `kendall_tau_ci`,
//! and that the weight sampler is unbiased). It does NOT validate the resilience
//! SCORING model itself (the RPCF sub-score formulas, composite weighting, and
//! Level/bounded gate), which stay honestly MODELLED — see src/verification.rs.
//!
//! Reference data, provenance, conventions and the committed generator live in
//! `tests/fixtures/resilience_score_decision_instability/`.

use kshana::resilience::stats::{dirichlet_weights, kendall_tau, percentile_ci, rank_of};

const REF: &str = include_str!(
    "fixtures/resilience_score_decision_instability/rankstats_reference.txt"
);

fn csv_f64(s: &str) -> Vec<f64> {
    s.trim()
        .split(',')
        .map(|x| x.trim().parse().unwrap())
        .collect()
}

/// Parse a `want` token that may be the sentinel `nan` (the documented all-tied
/// contract case) or a finite f64.
fn parse_want(tok: &str) -> Option<f64> {
    let t = tok.trim();
    if t.eq_ignore_ascii_case("nan") {
        None
    } else {
        Some(t.parse().unwrap())
    }
}

#[test]
fn kendall_tau_matches_scipy_kendalltau_b() {
    let mut n_exact = 0usize;
    let mut n_tied = 0usize;
    let mut worst = 0.0_f64;
    for line in REF.lines() {
        if !line.starts_with("KENDALL ") {
            continue;
        }
        // KENDALL <name> | a,... | b,... | want
        let parts: Vec<&str> = line.splitn(4, '|').collect();
        assert_eq!(parts.len(), 4, "KENDALL row needs 4 |-fields: {line}");
        let name = parts[0].trim_start_matches("KENDALL ").trim();
        let a = csv_f64(parts[1]);
        let b = csv_f64(parts[2]);
        assert_eq!(a.len(), b.len(), "{name}: length mismatch");

        let got = kendall_tau(&a, &b);
        match parse_want(parts[3]) {
            None => {
                // Documented divergence: scipy NaN (tau-b denom 0) vs kshana 0.0.
                assert_eq!(
                    got, 0.0,
                    "KENDALL {name}: kshana contract is 0.0 for all-tied (scipy NaN), got {got}"
                );
                n_tied += 1;
            }
            Some(want) => {
                let d = (got - want).abs();
                worst = worst.max(d);
                assert!(
                    d <= 1e-12,
                    "KENDALL {name}: kshana {got:.17} vs scipy {want:.17} (|Δ| {d:.2e})"
                );
                n_exact += 1;
            }
        }
    }
    // Planned minimum: >= 60 Kendall cases (exact + tied contract).
    assert!(
        n_exact + n_tied >= 60,
        "expected >= 60 Kendall cases, got {} ({n_exact} exact + {n_tied} tied)",
        n_exact + n_tied
    );
    assert!(n_tied >= 1, "expected >= 1 all-tied contract case");
    // Measured: worst |Δ| = 2.2e-16 (machine epsilon) over 58 exact + 3 tied.
    assert!(worst <= 1e-12, "worst tau-b |Δ| = {worst:.2e}");
}

#[test]
fn rank_of_matches_scipy_rankdata_ordinal() {
    let mut n = 0usize;
    for line in REF.lines() {
        if !line.starts_with("RANK ") {
            continue;
        }
        // RANK <name> | scores,... | r0 r1 ...
        let parts: Vec<&str> = line.splitn(3, '|').collect();
        assert_eq!(parts.len(), 3, "RANK row needs 3 |-fields: {line}");
        let name = parts[0].trim_start_matches("RANK ").trim();
        let scores = csv_f64(parts[1]);
        let want: Vec<usize> = parts[2]
            .split_whitespace()
            .map(|x| x.parse().unwrap())
            .collect();
        assert_eq!(want.len(), scores.len(), "{name}: rank length mismatch");

        let got = rank_of(&scores);
        assert_eq!(
            got, want,
            "RANK {name}: kshana {got:?} vs scipy rankdata(ordinal) {want:?}"
        );
        n += 1;
    }
    assert!(n >= 20, "expected >= 20 rank cases, got {n}");
}

#[test]
fn percentile_ci_matches_numpy_percentile_nearest() {
    let mut n = 0usize;
    let mut worst = 0.0_f64;
    for line in REF.lines() {
        if !line.starts_with("PERCENTILE ") {
            continue;
        }
        // PERCENTILE <name> alpha | samples,... | lo hi
        let parts: Vec<&str> = line.splitn(3, '|').collect();
        assert_eq!(parts.len(), 3, "PERCENTILE row needs 3 |-fields: {line}");
        let head: Vec<&str> = parts[0].split_whitespace().collect();
        // ["PERCENTILE", name, alpha]
        assert_eq!(head.len(), 3, "PERCENTILE head: PERCENTILE name alpha");
        let name = head[1];
        let alpha: f64 = head[2].parse().unwrap();
        let samples = csv_f64(parts[1]);
        let want: Vec<f64> = parts[2]
            .split_whitespace()
            .map(|x| x.parse().unwrap())
            .collect();
        assert_eq!(want.len(), 2, "{name}: need lo hi");

        let (lo, hi) = percentile_ci(&samples, alpha);
        for (lbl, got, w) in [("lo", lo, want[0]), ("hi", hi, want[1])] {
            let d = (got - w).abs();
            worst = worst.max(d);
            assert!(
                d <= 1e-12,
                "PERCENTILE {name} {lbl}: kshana {got:.17} vs numpy {w:.17} (|Δ| {d:.2e})"
            );
        }
        n += 1;
    }
    assert!(n >= 15, "expected >= 15 percentile cases, got {n}");
    // Measured: worst |Δ| = 0.0 (bit-exact sample selection) over 30 cases.
    assert!(worst <= 1e-12, "worst percentile endpoint |Δ| = {worst:.2e}");
}

#[test]
fn dirichlet_weights_mean_converges_to_scipy_dirichlet_mean() {
    // STATISTICAL convergence check (Monte-Carlo, ~1/sqrt(N)): the seeded
    // simplex sampler is unbiased toward the analytic Dirichlet mean that scipy
    // reports. This is NOT an exact 1e-12 kernel comparison — it is a directional
    // check that dirichlet_weights draws from the right distribution.
    let mut n_cases = 0usize;
    let mut worst = 0.0_f64;
    for line in REF.lines() {
        if !line.starts_with("DIRICHLET ") {
            continue;
        }
        // DIRICHLET <name> seed0 ndraws | alpha,... | mean,...
        let parts: Vec<&str> = line.splitn(3, '|').collect();
        assert_eq!(parts.len(), 3, "DIRICHLET row needs 3 |-fields: {line}");
        let head: Vec<&str> = parts[0].split_whitespace().collect();
        assert_eq!(head.len(), 4, "DIRICHLET head: DIRICHLET name seed0 ndraws");
        let name = head[1];
        let seed0: u64 = head[2].parse().unwrap();
        let ndraws: u64 = head[3].parse().unwrap();
        let alpha = csv_f64(parts[1]);
        let want_mean = csv_f64(parts[2]);
        assert_eq!(want_mean.len(), alpha.len(), "{name}: mean length mismatch");

        // Empirical mean across `ndraws` deterministic seeded draws, matching
        // how run_instability advances the seed: seed0.wrapping_add(d).
        let k = alpha.len();
        let mut acc = vec![0.0_f64; k];
        for d in 0..ndraws {
            let w = dirichlet_weights(&alpha, seed0.wrapping_add(d));
            // Each draw is itself a valid simplex point.
            assert!(w.iter().all(|&x| x >= 0.0), "{name}: negative weight");
            let s: f64 = w.iter().sum();
            assert!((s - 1.0).abs() < 1e-9, "{name}: draw not normalized ({s})");
            for (a, x) in acc.iter_mut().zip(w) {
                *a += x;
            }
        }
        for (j, a) in acc.iter().enumerate() {
            let emp = a / ndraws as f64;
            let d = (emp - want_mean[j]).abs();
            worst = worst.max(d);
            // Monte-Carlo tolerance: with >= 4000 draws and components ~0.03..0.5
            // the std error is well under 0.01.
            assert!(
                d <= 0.01,
                "DIRICHLET {name} comp {j}: empirical {emp:.5} vs scipy mean {:.5} (|Δ| {d:.2e})",
                want_mean[j]
            );
        }
        n_cases += 1;
    }
    assert!(n_cases >= 3, "expected >= 3 dirichlet cases, got {n_cases}");
    // Measured: worst empirical-mean |Δ| = 1.25e-3 (Monte-Carlo, inside band).
    // Sanity that this really is the loose statistical band, not a tight kernel.
    assert!(worst < 0.01, "worst empirical-mean |Δ| = {worst:.2e}");
}
