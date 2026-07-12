// SPDX-License-Identifier: AGPL-3.0-only
//! GNSS square-law acquisition **detection-statistics kernel** reference test
//! (external oracle: SciPy `scipy.stats.ncx2` / `scipy.stats.chi2`).
//!
//! kshana's square-law (non-coherent) acquisition detector
//! ([`kshana::acquisition`]) builds its false-alarm probability, detection
//! probability, threshold and generalized Marcum Q-function on top of the
//! engine's chi-square machinery ([`kshana::raim::chi2_cdf`],
//! [`kshana::raim::noncentral_chi2_cdf`]). That machinery evaluates the
//! non-central chi-square as a **Poisson(λ/2)-weighted sum of
//! regularized-incomplete-gamma central chi-square CDFs** — a series expansion
//! written from scratch in `src/raim.rs`.
//!
//! This test pins every one of the detector's public outputs against
//! **SciPy**, whose `ncx2` / `chi2` distributions are implemented on top of
//! **Cephes/Boost** — a wholly independent codebase using a different algorithm
//! (Cephes continued-fraction / Boost special-function evaluation, *not* a
//! Poisson-weighted incomplete-gamma series). The reference values are read
//! from a committed fixture emitted by
//! `tests/fixtures/acq_marcumq/generate_p6_acq_marcumq_reference.py`; no
//! third-party code runs inside this test. Matching SciPy across the full
//! false-alarm / detection / integration-count range the detector actually uses
//! makes the **detection-statistics kernel externally validated**, not merely
//! self-consistent. This is the same independence basis already accepted for
//! the Validated RAIM/ARAIM chi2 kernel row (`tests/raim_reference.rs`).
//!
//! The generalized Marcum Q-function is the survival function of a non-central
//! chi-square with `2M` degrees of freedom and non-centrality `a²`, evaluated at
//! `b²`:  `Q_M(a, b) = ncx2.sf(b², 2M, a²)`. The mapping to kshana's public API:
//!
//! ```text
//!   marcum_q(M, a, b)            <->  ncx2.sf(b², 2M, a²)
//!   pfa_square_law(gamma, N)     <->  chi2.sf(gamma, 2N)
//!   threshold_for_pfa(pfa, N)    <->  chi2.ppf(1 - pfa, 2N)
//!   pd_square_law(gamma, N, snr) <->  ncx2.sf(gamma, 2N, 2N·snr)
//! ```
//!
//! HONEST SCOPE — NARROW promotion. This validates ONLY the per-cell
//! detection-statistics kernel (generalized Marcum-Q / P_fa / P_d / threshold vs
//! SciPy `ncx2`/`chi2`). The CFAR cell-averaging, squaring/combining-loss
//! tables, and code/Doppler-bin straddling loss of a real acquisition search
//! STAY MODELLED — no external dataset covers those, and they are tracked
//! honestly in `src/verification.rs`. Mirrors how the "RAIM/ARAIM integrity
//! statistical kernel" row is scoped to its kernel.
//!
//! Oracle: SciPy 1.13.1 (NumPy 1.26.4). Reference values are SciPy outputs
//! serialised to full f64.

use kshana::acquisition::{marcum_q, pd_square_law, pfa_square_law, threshold_for_pfa};

const REF: &str = include_str!("fixtures/acq_marcumq/acq_marcumq_reference.txt");

/// Pass when `got` is within `abstol + reltol·|want|` of `want` — a combined
/// absolute / relative band, so both deep tail probabilities near 0 and O(1)
/// probabilities / O(10) thresholds are checked meaningfully.
fn close(got: f64, want: f64, abstol: f64, reltol: f64, what: &str) {
    let d = (got - want).abs();
    assert!(
        d <= abstol + reltol * want.abs(),
        "{what}: kshana {got:.12e} vs SciPy {want:.12e} (|Δ|={d:.2e} > {abstol:.0e}+{reltol:.0e}·|want|)"
    );
}

fn f(tok: &str) -> f64 {
    tok.parse::<f64>()
        .unwrap_or_else(|_| panic!("bad float token: {tok:?}"))
}

/// Marcum Q-function `Q_M(a,b)` vs `scipy.stats.ncx2.sf(b², 2M, a²)`.
/// Tail values run down to ~1e-30, so use a tight relative band plus a small
/// absolute floor for values that underflow toward 0.
#[test]
fn marcum_q_matches_scipy_ncx2() {
    let mut n = 0usize;
    for line in REF.lines() {
        if !line.starts_with("MARCUM ") {
            continue;
        }
        let p: Vec<&str> = line.split_whitespace().collect();
        let (m, a, b, want) = (f(p[1]), f(p[2]), f(p[3]), f(p[4]));
        close(
            marcum_q(m, a, b),
            want,
            1e-12,
            1e-9,
            &format!("marcum_q(M={m}, a={a}, b={b})"),
        );
        n += 1;
    }
    assert!(n >= 200, "expected the full Marcum grid, saw {n}");
}

/// False-alarm probability `P_fa(γ, N)` vs `scipy.stats.chi2.sf(γ, 2N)`.
#[test]
fn pfa_matches_scipy_chi2() {
    let mut n = 0usize;
    for line in REF.lines() {
        if !line.starts_with("PFA ") {
            continue;
        }
        let p: Vec<&str> = line.split_whitespace().collect();
        let (nc, gamma, want) = (f(p[1]), f(p[2]), f(p[3]));
        close(
            pfa_square_law(gamma, nc),
            want,
            1e-12,
            1e-9,
            &format!("pfa_square_law(gamma={gamma}, N={nc})"),
        );
        n += 1;
    }
    assert!(n >= 30, "expected the full P_fa grid, saw {n}");
}

/// Detection threshold `γ(P_fa, N)` vs `scipy.stats.chi2.ppf(1 − P_fa, 2N)`.
/// kshana inverts its own `chi2_cdf` by bisection; the quantile it lands on must
/// equal SciPy's `ppf`. Bisection converges to a fixed absolute band, so use a
/// modest absolute tolerance on the O(1)–O(80) threshold values.
#[test]
fn threshold_matches_scipy_chi2_ppf() {
    let mut n = 0usize;
    for line in REF.lines() {
        if !line.starts_with("THR ") {
            continue;
        }
        let p: Vec<&str> = line.split_whitespace().collect();
        let (nc, pfa, want) = (f(p[1]), f(p[2]), f(p[3]));
        close(
            threshold_for_pfa(pfa, nc),
            want,
            1e-6,
            1e-7,
            &format!("threshold_for_pfa(pfa={pfa}, N={nc})"),
        );
        n += 1;
    }
    assert!(n >= 20, "expected the full threshold grid, saw {n}");
}

/// Detection probability `P_d(γ, N, snr)` vs
/// `scipy.stats.ncx2.sf(γ, 2N, 2N·snr)`. Covers `snr = 0` (reduces to P_fa,
/// central case) through strong signal, at several thresholds and counts.
#[test]
fn pd_matches_scipy_ncx2() {
    let mut n = 0usize;
    for line in REF.lines() {
        if !line.starts_with("PD ") {
            continue;
        }
        let p: Vec<&str> = line.split_whitespace().collect();
        let (nc, gamma, snr, want) = (f(p[1]), f(p[2]), f(p[3]), f(p[4]));
        close(
            pd_square_law(gamma, nc, snr),
            want,
            1e-12,
            1e-9,
            &format!("pd_square_law(gamma={gamma}, N={nc}, snr={snr})"),
        );
        n += 1;
    }
    assert!(n >= 60, "expected the full P_d grid, saw {n}");
}
