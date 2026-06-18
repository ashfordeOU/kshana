// SPDX-License-Identifier: Apache-2.0
//! Externally validate the 13503 quantum-vs-classical trade engine's numerical
//! kernels against an **independent third-party authority**: scipy 1.17.1
//! (Virtanen et al., Nature Methods 2020).
//!
//! Three exactly-reproducible kernels are checked against scipy's own routines —
//! the same kind of validation DOP gets against gnss_lib_py and the ML metrics
//! against scikit-learn:
//!
//!   * `quantum_trade::qparams_from_adev_curve` (the measured-ADEV NNLS fit)
//!     vs `scipy.optimize.nnls`;
//!   * `detection::chi2_inv_cdf` (the UKF NEES/NIS consistency bands)
//!     vs `scipy.stats.chi2.ppf`, at the operating pooled dof (>= 48);
//!   * the `clock_state` van-Loan discrete process-noise Q (the holdover-coast
//!     covariance under the trade table) vs `scipy.linalg.expm` (Van Loan 1978).
//!
//! Honest scope: this validates the trade engine's *computational spine*. It does
//! NOT validate the device-performance numbers (clock/CAI parameters), which
//! quantify a partner's hardware and stay MODELLED — see `src/verification.rs`.
//!
//! Reference data, provenance and the committed generator live in
//! `tests/fixtures/scipy/`.

use kshana::clock_state::ClockState3;
use kshana::detection::chi2_inv_cdf;
use kshana::quantum_trade::qparams_from_adev_curve;

const REF: &str = include_str!("fixtures/scipy/scipy_reference.txt");

/// `got` is within tolerance of the scipy `want`: a relative bound, plus an
/// absolute floor so a coefficient scipy reports as a numerical zero (e.g.
/// 7e-45) matches Kshana's exact 0.0.
fn approx(got: f64, want: f64, rel_tol: f64, abs_tol: f64) -> bool {
    (got - want).abs() <= rel_tol * want.abs() + abs_tol
}

fn csv_f64(s: &str) -> Vec<f64> {
    s.trim()
        .split(',')
        .map(|x| x.trim().parse().unwrap())
        .collect()
}

#[test]
fn nnls_matches_scipy_optimize_nnls() {
    let mut n = 0usize;
    for line in REF.lines() {
        if !line.starts_with("NNLS ") {
            continue;
        }
        // NNLS <name> | taus, | adevs, | q_wf q_rw q_drift
        let parts: Vec<&str> = line.splitn(4, '|').collect();
        assert_eq!(parts.len(), 4, "NNLS row needs 4 |-fields: {line}");
        let name = parts[0].trim();
        let taus = csv_f64(parts[1]);
        let adevs = csv_f64(parts[2]);
        let want: Vec<f64> = parts[3]
            .split_whitespace()
            .map(|x| x.parse().unwrap())
            .collect();
        assert_eq!(want.len(), 3, "{name}: need q_wf q_rw q_drift");

        let q = qparams_from_adev_curve(&taus, &adevs);
        // Scale the absolute floor to the dominant coefficient of the case, so a
        // numerical-zero component matches without masking a real disagreement.
        let scale = want.iter().fold(0.0_f64, |m, &v| m.max(v.abs()));
        let abs_tol = 1e-9 * scale;
        for (lbl, got, w) in [
            ("q_wf", q.q_wf, want[0]),
            ("q_rw", q.q_rw, want[1]),
            ("q_drift", q.q_drift, want[2]),
        ] {
            assert!(
                approx(got, w, 1e-3, abs_tol),
                "NNLS {name}: {lbl} {got:.6e} vs scipy {w:.6e}"
            );
        }
        // The fitted curves must agree tightly at every tau (robust to the
        // ill-conditioned coefficient split): predicted sigma_y^2(tau).
        for &t in &taus {
            let pred = |p: &[f64; 3]| p[0] / t + (p[1] / 3.0) * t + (p[2] / 20.0) * t * t * t;
            let g = pred(&[q.q_wf, q.q_rw, q.q_drift]);
            let w = pred(&[want[0], want[1], want[2]]);
            assert!(
                approx(g, w, 1e-6, 0.0),
                "NNLS {name}: sigma^2({t}) {g:.6e} vs {w:.6e}"
            );
        }
        n += 1;
    }
    assert!(n >= 5, "expected >= 5 NNLS cases, got {n}");
}

#[test]
fn chi2_inv_cdf_matches_scipy_stats_chi2() {
    // Wilson-Hilferty vs scipy at the operating pooled dof (>= 8). Worst case is
    // the smallest dof / deepest tail; tightens rapidly with dof.
    let mut n = 0usize;
    let mut worst = 0.0_f64;
    for line in REF.lines() {
        if !line.starts_with("CHI2 ") {
            continue;
        }
        let f: Vec<&str> = line.split_whitespace().collect();
        assert_eq!(f.len(), 4, "CHI2 row: CHI2 p dof value");
        let p: f64 = f[1].parse().unwrap();
        let dof: f64 = f[2].parse().unwrap();
        let want: f64 = f[3].parse().unwrap();
        assert!(
            dof >= 48.0,
            "chi2 validation is scoped to operating dof >= 48"
        );
        let got = chi2_inv_cdf(p, dof);
        let rd = (got - want).abs() / want.abs();
        worst = worst.max(rd);
        assert!(
            rd <= 5.0e-4,
            "CHI2 p={p} dof={dof}: {got:.6} vs scipy {want:.6} (rel {rd:.2e})"
        );
        n += 1;
    }
    assert!(n >= 30, "expected >= 30 chi2 points, got {n}");
    // Tightens rapidly with dof; the UKF pools to dof in the hundreds (NEES = 384).
    assert!(worst <= 5.0e-4, "worst chi2 rel error {worst:.2e}");
}

#[test]
fn clock_van_loan_q_matches_scipy_linalg_expm() {
    let mut n = 0usize;
    for line in REF.lines() {
        if !line.starts_with("VANLOAN ") {
            continue;
        }
        // VANLOAN <name> q_wf q_rw q_drift dt | q00 q01 q02 q11 q12 q22
        let parts: Vec<&str> = line.splitn(2, '|').collect();
        assert_eq!(parts.len(), 2, "VANLOAN row needs a |");
        let head: Vec<&str> = parts[0].split_whitespace().collect();
        assert_eq!(
            head.len(),
            6,
            "VANLOAN head: VANLOAN name q_wf q_rw q_drift dt"
        );
        let name = head[1];
        let (q_wf, q_rw, q_drift, dt) = (
            head[2].parse::<f64>().unwrap(),
            head[3].parse::<f64>().unwrap(),
            head[4].parse::<f64>().unwrap(),
            head[5].parse::<f64>().unwrap(),
        );
        let want: Vec<f64> = parts[1]
            .split_whitespace()
            .map(|x| x.parse().unwrap())
            .collect();
        assert_eq!(want.len(), 6, "{name}: need 6 Q entries");

        // Extract the discrete process noise Q: with zero initial covariance,
        // one predict step leaves P = Q exactly.
        let mut cs = ClockState3::new(q_wf, q_rw, q_drift).with_initial_cov(0.0, 0.0, 0.0);
        cs.predict(dt);
        let p = cs.covariance();
        let scale = want.iter().fold(0.0_f64, |m, &v| m.max(v.abs()));
        let abs_tol = 1e-12 * scale;
        let got = [p[0][0], p[0][1], p[0][2], p[1][1], p[1][2], p[2][2]];
        let names = ["q00", "q01", "q02", "q11", "q12", "q22"];
        for i in 0..6 {
            assert!(
                approx(got[i], want[i], 1e-9, abs_tol),
                "VANLOAN {name}: {} {:.6e} vs scipy {:.6e}",
                names[i],
                got[i],
                want[i]
            );
        }
        // Symmetry sanity (P is a covariance).
        assert!(
            approx(p[1][0], p[0][1], 1e-12, abs_tol),
            "{name}: Q not symmetric"
        );
        n += 1;
    }
    assert!(n >= 4, "expected >= 4 van-Loan cases, got {n}");
}
