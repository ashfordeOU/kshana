// SPDX-License-Identifier: AGPL-3.0-only
//! Externally validate the 13503 quantum-vs-classical PNT trade engine's
//! measured-ADEV ingestion kernel — `quantum_trade::qparams_from_adev_curve` —
//! against an **independent third-party authority**: scipy's
//! `scipy.optimize.nnls` (Lawson-Hanson non-negative least squares; scipy =
//! Virtanen et al., *Nature Methods* 17, 2020; BSD-3-Clause).
//!
//! `qparams_from_adev_curve(taus, adevs)` fits a clock's **measured**
//! overlapping-ADEV curve to the holdover noise model
//!
//! ```text
//! sigma_y^2(tau) = q_wf/tau + (q_rw/3)*tau + (q_drift/20)*tau^3
//! ```
//!
//! by non-negative least squares over the basis A = [1/tau, tau, tau^3] against
//! b = sigma_y^2(tau). kshana solves this 3-variable NNLS by an exact active-set
//! subset enumeration (the global optimum for <=3 variables); scipy solves the
//! *same* min ||Ax-b|| s.t. x>=0 problem by the Lawson-Hanson algorithm — a
//! different codebase and a different algorithm, which is what makes scipy a
//! genuine oracle for this kernel (the same kind of library-vs-library check DOP
//! gets against gnss_lib_py and the Lambert solver gets against lamberthub).
//!
//! Three things are checked per case, in order of strength:
//!
//!   1. **Residual (the strong correctness claim).** kshana's NNLS residual
//!      ||A x - b||_2 must be no worse than scipy's (up to a tiny floor). Because
//!      kshana's exact enumeration finds the global optimum, on ill-conditioned
//!      designs it can fit *strictly better* than scipy's active-set path (which
//!      may leave a numerically-negligible "dead" variable). The check is
//!      one-sided in kshana's favour — it never lets kshana fit *worse*.
//!   2. **Fitted sigma_y^2(tau) at every node**, to a 1e-6 relative tolerance
//!      PLUS a per-node absolute floor of 2*||scipy residual||. Two valid NNLS
//!      solutions of the same b differ pointwise by at most the sum of their
//!      residuals: |fit_k(t)-b(t)| <= r_k and |fit_s(t)-b(t)| <= r_s, hence
//!      |fit_k(t)-fit_s(t)| <= r_k + r_s <= 2 r_s (kshana's residual is the
//!      smaller). On a heteroscedastic multi-decade design scipy can leave a
//!      tiny dead coefficient that makes a *large relative* but *small absolute*
//!      error at a low-magnitude node; the residual-scaled absolute floor is the
//!      provable, honest bound there (kshana is the more accurate fit, never
//!      forced to reproduce scipy's small-tau leakage).
//!   3. **Recovered (q_wf, q_rw, q_drift)** to 1e-3 relative, with a per-coeff
//!      absolute floor = ordinary numerical-zero floor PLUS scipy's
//!      "indistinguishable-from-zero" coefficient magnitude, which for basis
//!      column c_j is ||scipy residual|| / ||A column j|| (the coefficient that
//!      contributes one residual-norm to the fit — scipy cannot resolve a
//!      coefficient below its own residual). A dead variable scipy leaves at this
//!      scale is treated as a numerical zero; genuine coefficients (far above it)
//!      stay pinned to 1e-3.
//!
//! ## Honest scope (load-bearing)
//! This validates the trade engine's measured-ADEV **computational kernel** (an
//! NNLS fit) against scipy. It does NOT validate the device-performance numbers
//! (clock / cold-atom parameters), which quantify a partner's hardware and stay
//! MODELLED — see `src/verification.rs`. The trade row stays Modelled; this
//! fixture strengthens the kernel evidence beneath it.
//!
//! Reference data, provenance and the committed generator live in
//! `tests/fixtures/quantum_vs_classical_pnt_trade/`.

use kshana::quantum_trade::qparams_from_adev_curve;

const REF: &str = include_str!(
    "fixtures/quantum_vs_classical_pnt_trade/quantum_vs_classical_pnt_trade_reference.txt"
);

/// Per-coefficient relative tolerance once above the numerical-zero floor.
const COEF_REL_TOL: f64 = 1e-3;
/// Numerical-zero floor for coefficients, relative to the case's dominant coeff.
const COEF_ABS_FLOOR_REL: f64 = 1e-9;
/// Floor for the fitted-sigma_y^2 relative tolerance (used when scipy's own
/// relative residual is smaller than this — i.e. a well-conditioned case).
const FIT_REL_FLOOR: f64 = 1e-6;

fn approx(got: f64, want: f64, rel_tol: f64, abs_tol: f64) -> bool {
    (got - want).abs() <= rel_tol * want.abs() + abs_tol
}

fn csv_f64(s: &str) -> Vec<f64> {
    s.trim()
        .split(',')
        .map(|x| x.trim().parse().unwrap())
        .collect()
}

/// Fitted sigma_y^2(tau) for coefficients (q_wf, q_rw, q_drift) — the exact model
/// qparams_from_adev_curve fits: q_wf/tau + (q_rw/3)*tau + (q_drift/20)*tau^3.
fn fitted_sigma2(q: &[f64; 3], t: f64) -> f64 {
    q[0] / t + (q[1] / 3.0) * t + (q[2] / 20.0) * t * t * t
}

/// L2 norm of the fit residual A x - b for coefficients `q` over `taus`, where
/// b = sigma_y^2(tau) = adev(tau)^2.
fn residual_norm(q: &[f64; 3], taus: &[f64], adevs: &[f64]) -> f64 {
    taus.iter()
        .zip(adevs.iter())
        .map(|(&t, &s)| {
            let r = fitted_sigma2(q, t) - s * s;
            r * r
        })
        .sum::<f64>()
        .sqrt()
}

#[test]
fn qparams_from_adev_curve_matches_scipy_nnls() {
    let mut n = 0usize;
    let mut worst_fit_rel = 0.0_f64;
    let mut worst_coef_rel = 0.0_f64;
    let mut worst_resid_ratio = 0.0_f64; // kshana_resid / max(scipy_resid, floor)
    for line in REF.lines() {
        if !line.starts_with("NNLS ") {
            continue;
        }
        // NNLS <name> | taus(,) | adevs(,) | q_wf q_rw q_drift | fitted_sigma2(,) | resid target
        let parts: Vec<&str> = line.splitn(6, '|').collect();
        assert_eq!(parts.len(), 6, "NNLS row needs 6 |-fields: {line}");
        let name = parts[0].trim_start_matches("NNLS").trim();
        let taus = csv_f64(parts[1]);
        let adevs = csv_f64(parts[2]);
        let want: Vec<f64> = parts[3]
            .split_whitespace()
            .map(|x| x.parse().unwrap())
            .collect();
        assert_eq!(want.len(), 3, "{name}: need q_wf q_rw q_drift");
        let want_fit = csv_f64(parts[4]);
        let resid_fields: Vec<f64> = parts[5]
            .split_whitespace()
            .map(|x| x.parse().unwrap())
            .collect();
        assert_eq!(
            resid_fields.len(),
            2,
            "{name}: need scipy_resid_norm scipy_target_norm"
        );
        let scipy_resid = resid_fields[0];
        let target_norm = resid_fields[1];
        assert_eq!(taus.len(), adevs.len(), "{name}: taus/adevs length mismatch");
        assert_eq!(
            want_fit.len(),
            taus.len(),
            "{name}: fitted_sigma2 length must match taus"
        );
        assert!(target_norm > 0.0, "{name}: degenerate target");

        let q = qparams_from_adev_curve(&taus, &adevs);
        let got = [q.q_wf, q.q_rw, q.q_drift];
        let want_arr = [want[0], want[1], want[2]];

        // --- (1) residual: kshana must fit at least as well as scipy ---
        let kshana_resid = residual_norm(&got, &taus, &adevs);
        // Floor scipy's residual at sqrt(eps)*target so a numerically-exact scipy
        // fit (resid ~ 0) does not make the one-sided test infinitely strict.
        let resid_floor = 1e-7 * target_norm;
        let resid_budget = scipy_resid.max(resid_floor);
        worst_resid_ratio = worst_resid_ratio.max(kshana_resid / resid_budget);
        assert!(
            kshana_resid <= resid_budget * (1.0 + 1e-6),
            "NNLS {name}: kshana residual {kshana_resid:.6e} WORSE than scipy {scipy_resid:.6e} \
             (budget {resid_budget:.6e}) — kshana must solve the NNLS at least as well",
        );

        // Per-node absolute floor: two valid NNLS fits of the same b differ by at
        // most the sum of their residuals (<= 2*scipy_resid, since kshana's is the
        // smaller). This is the provable bound where scipy leaves a small absolute
        // (but large relative) error at a low-magnitude node on a wide-decade fit.
        let scipy_rel_resid = scipy_resid / target_norm;
        let fit_abs_floor = 2.0 * scipy_resid;

        // --- (2) fitted sigma_y^2(tau) at every node ---
        for (&t, &wf) in taus.iter().zip(want_fit.iter()) {
            // Sanity: the pinned fit equals the model evaluated at scipy's coeffs.
            let model_wf = fitted_sigma2(&want_arr, t);
            assert!(
                approx(model_wf, wf, 1e-9, 0.0),
                "NNLS {name}: pinned fit({t}) {wf:.9e} != model(scipy coeffs) {model_wf:.9e}"
            );
            let gf = fitted_sigma2(&got, t);
            if wf.abs() > fit_abs_floor {
                worst_fit_rel = worst_fit_rel.max((gf - wf).abs() / wf.abs());
            }
            assert!(
                approx(gf, wf, FIT_REL_FLOOR, fit_abs_floor),
                "NNLS {name}: fitted sigma_y^2({t}) {gf:.9e} vs scipy {wf:.9e} \
                 (|Δ|={:.2e} > {:.2e})",
                (gf - wf).abs(),
                FIT_REL_FLOOR * wf.abs() + fit_abs_floor,
            );
        }

        // --- (3) recovered coefficients ---
        let _ = scipy_rel_resid; // (the per-coeff floor below is the sharper bound)
        let scale = want.iter().fold(0.0_f64, |m, &v| m.max(v.abs()));
        // Basis column L2 norms over this case's taus: c0=1/tau, c1=tau, c2=tau^3.
        // A coefficient indistinguishable from zero to scipy contributes <= one
        // residual-norm to the fit, i.e. |x_j| <= scipy_resid/||col_j||. Map that
        // to the q-scaling (q_wf=x0, q_rw=3*x1, q_drift=20*x2).
        let col_norm = |p: i32| -> f64 {
            taus.iter().map(|&t| (t.powi(p)).powi(2)).sum::<f64>().sqrt()
        };
        let (n0, n1, n2) = (col_norm(-1), col_norm(1), col_norm(3));
        let dead = [
            scipy_resid / n0,        // q_wf  = x0
            3.0 * scipy_resid / n1,  // q_rw  = 3 x1
            20.0 * scipy_resid / n2, // q_drift = 20 x2
        ];
        for (lbl, idx) in [("q_wf", 0usize), ("q_rw", 1), ("q_drift", 2)] {
            let g = got[idx];
            let w = want_arr[idx];
            // Numerical-zero floor (relative to the dominant coeff) PLUS scipy's
            // residual-scale "dead variable" magnitude for this column.
            let abs_tol = COEF_ABS_FLOOR_REL * scale + dead[idx];
            if w.abs() > abs_tol {
                worst_coef_rel = worst_coef_rel.max((g - w).abs() / w.abs());
            }
            assert!(
                approx(g, w, COEF_REL_TOL, abs_tol),
                "NNLS {name}: {lbl} {g:.9e} vs scipy {w:.9e} \
                 (|Δ|={:.2e} > {:.2e})",
                (g - w).abs(),
                COEF_REL_TOL * w.abs() + abs_tol,
            );
        }
        n += 1;
    }
    assert!(n >= 12, "expected >= 12 NNLS reference cases, got {n}");
    eprintln!(
        "quantum_vs_classical_pnt_trade_reference: {n} cases vs scipy.optimize.nnls — \
         worst fitted-sigma_y^2 rel {worst_fit_rel:.2e}, worst coefficient rel {worst_coef_rel:.2e}, \
         worst (kshana_resid/scipy_resid) {worst_resid_ratio:.3} (<=1 means kshana fits >= as well)"
    );
}
