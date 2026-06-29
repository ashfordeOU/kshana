// SPDX-License-Identifier: AGPL-3.0-only
//! IEEE-1139 power-law clock-noise model: the five-coefficient PSD ↔ Allan-variance
//! conversion, with first-class support for the **flicker-FM floor**.
//!
//! A clock's fractional-frequency noise is the sum of five power-law processes with
//! one-sided PSD `S_y(f) = Σ_{α=−2}^{2} h_α f^α`. Each maps to a known Allan-variance
//! term (IEEE Std 1139-2008; Riley, NIST SP 1065, Table 3):
//!
//! ```text
//!   σ_y²(τ) =  h_2 · 3 f_h /(4π²τ²)                       (white  PM,  ADEV ∝ τ⁻¹)
//!            + h_1 · [1.038 + 3 ln(2π f_h τ)]/(4π²τ²)     (flicker PM, ADEV ∝ ~τ⁻¹)
//!            + h_0 · 1/(2τ)                                (white  FM,  ADEV ∝ τ⁻¹ᐟ²)
//!            + h_{-1} · 2 ln 2                             (flicker FM, ADEV ∝ τ⁰  — FLOOR)
//!            + h_{-2} · (2π²/3) τ                          (random-walk FM, ADEV ∝ τ⁺¹ᐟ²)
//! ```
//!
//! where `f_h` is the measurement-system bandwidth (Hz). The `h_{-1}` term is constant in
//! `τ`: it is the **flicker-FM floor** where the Allan deviation flattens,
//! `σ_y = √(2 ln 2 · h_{-1})`. This is exactly the term the engine's holdover model and the
//! quantum-trade ADEV fit (`{1/τ, τ, τ³}` basis) deliberately omit — closing that gap is
//! the point of this module, and it makes the floor a *fittable* quantity rather than an
//! assumed constant.
//!
//! Scope (honest): the standard stationary power-law model — no deterministic frequency
//! drift (the `τ²` term), no bias-instability/quantisation refinements, and the PM terms
//! carry the usual bandwidth (`f_h`) dependence. It is a MODELLED capability whose
//! reference tests check the per-noise-type ADEV slopes, the flicker-FM floor identity,
//! and round-trip coefficient recovery, and contrast it against the drift-basis fit that
//! cannot represent a floor — internal-consistency oracles, not an external dataset.
//!
//! References:
//! - IEEE Std 1139-2008, *Standard Definitions of Physical Quantities for Fundamental
//!   Frequency and Time Metrology*.
//! - W. J. Riley, *Handbook of Frequency Stability Analysis*, NIST SP 1065 (2008), §3
//!   (power-law noise, the σ_y²↔h_α conversion table).

use std::f64::consts::PI;

/// The five IEEE-1139 power-law PSD coefficients `h_α` (`S_y(f) = Σ h_α f^α`), indexed by
/// the exponent: `h_m2 = h_{−2}` (random-walk FM) … `h2 = h_{+2}` (white PM).
#[derive(Clone, Copy, Debug, Default)]
pub struct PowerLaw {
    /// `h_{−2}` — random-walk FM (ADEV ∝ τ⁺¹ᐟ²).
    pub h_m2: f64,
    /// `h_{−1}` — flicker FM (ADEV ∝ τ⁰, the floor).
    pub h_m1: f64,
    /// `h_0` — white FM (ADEV ∝ τ⁻¹ᐟ²).
    pub h_0: f64,
    /// `h_{+1}` — flicker PM (ADEV ∝ ~τ⁻¹).
    pub h_1: f64,
    /// `h_{+2}` — white PM (ADEV ∝ τ⁻¹).
    pub h_2: f64,
}

/// Allan variance `σ_y²(τ)` from the power-law coefficients, with measurement bandwidth
/// `f_h` (Hz) governing the two PM terms.
pub fn allan_variance(p: &PowerLaw, tau: f64, f_h: f64) -> f64 {
    let inv_t2 = 1.0 / (tau * tau);
    let wpm = p.h_2 * 3.0 * f_h / (4.0 * PI * PI) * inv_t2;
    let fpm = p.h_1 * (1.038 + 3.0 * (2.0 * PI * f_h * tau).ln()) / (4.0 * PI * PI) * inv_t2;
    let wfm = p.h_0 * 0.5 / tau;
    let ffm = p.h_m1 * 2.0 * 2.0_f64.ln();
    let rwfm = p.h_m2 * (2.0 * PI * PI / 3.0) * tau;
    wpm + fpm + wfm + ffm + rwfm
}

/// Allan deviation `σ_y(τ) = √(σ_y²(τ))`.
pub fn allan_deviation(p: &PowerLaw, tau: f64, f_h: f64) -> f64 {
    allan_variance(p, tau, f_h).max(0.0).sqrt()
}

/// The flicker-FM floor `σ_y = √(2 ln 2 · h_{−1})` — the τ-independent Allan-deviation
/// level a flicker-FM-limited clock cannot beat by averaging.
pub fn flicker_fm_floor(h_m1: f64) -> f64 {
    (2.0 * 2.0_f64.ln() * h_m1).max(0.0).sqrt()
}

/// Recovered FM-family coefficients `(h_{−2}, h_{−1}, h_0)` from a measured ADEV curve, by
/// non-negative least squares of `σ_y²(τ)` in the basis
/// `{(2π²/3)·τ, 2 ln 2, 1/(2τ)}` (random-walk FM, **flicker FM**, white FM). Unlike the
/// drift basis `{1/τ, τ, τ³}`, this basis carries the constant flicker term, so a floor is
/// recoverable rather than aliased onto white/random-walk FM.
pub fn fit_fm_family(taus: &[f64], adevs: &[f64]) -> (f64, f64, f64) {
    let pts: Vec<(f64, f64)> = taus
        .iter()
        .zip(adevs)
        .filter(|(&t, &s)| t > 0.0 && s.is_finite() && s >= 0.0)
        .map(|(&t, &s)| (t, s))
        .collect();
    if pts.len() < 2 {
        return (0.0, 0.0, 0.0);
    }
    let ln2 = 2.0_f64.ln();
    // Basis columns for σ_y² (coefficients are h_{-2}, h_{-1}, h_0 respectively).
    let basis = |t: f64| [(2.0 * PI * PI / 3.0) * t, 2.0 * ln2, 0.5 / t];
    let rows: Vec<[f64; 3]> = pts.iter().map(|&(t, _)| basis(t)).collect();
    let y: Vec<f64> = pts.iter().map(|&(_, s)| s * s).collect();

    // Non-negative LS over all non-empty subsets of the 3 columns; keep the
    // min-residual feasible (all-non-negative) solution — the NNLS optimum for 3 vars.
    let subsets: [&[usize]; 7] = [&[0], &[1], &[2], &[0, 1], &[0, 2], &[1, 2], &[0, 1, 2]];
    let mut best: Option<([f64; 3], f64)> = None;
    for sub in subsets {
        if let Some(coef) = ls_subset(&rows, &y, sub) {
            if coef.iter().any(|&c| c < -1e-300) {
                continue;
            }
            let mut full = [0.0f64; 3];
            for (j, &idx) in sub.iter().enumerate() {
                full[idx] = coef[j].max(0.0);
            }
            let resid: f64 = rows
                .iter()
                .zip(&y)
                .map(|(r, &yi)| {
                    let pred = r[0] * full[0] + r[1] * full[1] + r[2] * full[2];
                    (pred - yi) * (pred - yi)
                })
                .sum();
            if best.map_or(true, |(_, r)| resid < r) {
                best = Some((full, resid));
            }
        }
    }
    let c = best.map(|(c, _)| c).unwrap_or([0.0; 3]);
    (c[0], c[1], c[2])
}

/// Ordinary least squares of `y` on the chosen `cols` of `rows` (normal equations,
/// Gaussian elimination). Returns the per-column coefficients, or `None` if singular.
#[allow(clippy::needless_range_loop)]
fn ls_subset(rows: &[[f64; 3]], y: &[f64], cols: &[usize]) -> Option<Vec<f64>> {
    let k = cols.len();
    let mut ata = vec![vec![0.0f64; k]; k];
    let mut atb = vec![0.0f64; k];
    for (r, &yi) in rows.iter().zip(y) {
        for a in 0..k {
            atb[a] += r[cols[a]] * yi;
            for b in 0..k {
                ata[a][b] += r[cols[a]] * r[cols[b]];
            }
        }
    }
    // Solve ata x = atb by Gaussian elimination with partial pivoting.
    for col in 0..k {
        let mut p = col;
        for row in (col + 1)..k {
            if ata[row][col].abs() > ata[p][col].abs() {
                p = row;
            }
        }
        if ata[p][col].abs() < 1e-300 {
            return None;
        }
        ata.swap(col, p);
        atb.swap(col, p);
        for row in (col + 1)..k {
            let f = ata[row][col] / ata[col][col];
            for c in col..k {
                ata[row][c] -= f * ata[col][c];
            }
            atb[row] -= f * atb[col];
        }
    }
    let mut x = vec![0.0; k];
    for i in (0..k).rev() {
        let mut s = atb[i];
        for c in (i + 1)..k {
            s -= ata[i][c] * x[c];
        }
        x[i] = s / ata[i][i];
    }
    Some(x)
}

#[cfg(test)]
mod tests {
    use super::*;

    fn approx(a: f64, b: f64, tol: f64) -> bool {
        (a - b).abs() <= tol
    }

    // log-log slope of the ADEV between two decades of τ for a single noise type.
    fn adev_slope(p: &PowerLaw, f_h: f64) -> f64 {
        let (t1, t2) = (1.0, 100.0);
        let s1 = allan_deviation(p, t1, f_h).ln();
        let s2 = allan_deviation(p, t2, f_h).ln();
        (s2 - s1) / (t2.ln() - t1.ln())
    }

    #[test]
    fn each_noise_type_has_its_signature_adev_slope() {
        let f_h = 100.0;
        // white FM ⇒ −1/2
        let wfm = PowerLaw {
            h_0: 1e-22,
            ..Default::default()
        };
        assert!(approx(adev_slope(&wfm, f_h), -0.5, 1e-9));
        // flicker FM ⇒ 0 (the floor)
        let ffm = PowerLaw {
            h_m1: 1e-24,
            ..Default::default()
        };
        assert!(approx(adev_slope(&ffm, f_h), 0.0, 1e-9));
        // random-walk FM ⇒ +1/2
        let rwfm = PowerLaw {
            h_m2: 1e-28,
            ..Default::default()
        };
        assert!(approx(adev_slope(&rwfm, f_h), 0.5, 1e-9));
        // white PM ⇒ −1
        let wpm = PowerLaw {
            h_2: 1e-24,
            ..Default::default()
        };
        assert!(approx(adev_slope(&wpm, f_h), -1.0, 1e-9));
    }

    #[test]
    fn flicker_fm_is_a_flat_floor() {
        let h_m1 = 3.0e-25;
        let p = PowerLaw {
            h_m1,
            ..Default::default()
        };
        let floor = flicker_fm_floor(h_m1);
        for &tau in &[1.0_f64, 10.0, 1e3, 1e5] {
            assert!(
                approx(allan_deviation(&p, tau, 100.0), floor, 1e-18),
                "flicker floor not flat at τ={tau}"
            );
        }
        // identity σ_y = √(2 ln2 · h_{-1})
        assert!(approx(floor, (2.0 * 2.0_f64.ln() * h_m1).sqrt(), 1e-30));
    }

    #[test]
    fn fm_family_round_trips_through_the_fit() {
        // Synthesize an ADEV curve from known FM-family coefficients incl. a flicker floor.
        let truth = PowerLaw {
            h_m2: 2.0e-30,
            h_m1: 1.5e-25,
            h_0: 4.0e-23,
            ..Default::default()
        };
        let taus: Vec<f64> = (0..7).map(|k| 10f64.powi(k)).collect(); // 1 … 1e6 s
        let adevs: Vec<f64> = taus
            .iter()
            .map(|&t| allan_deviation(&truth, t, 100.0))
            .collect();
        let (h_m2, h_m1, h_0) = fit_fm_family(&taus, &adevs);
        assert!((h_m2 - truth.h_m2).abs() / truth.h_m2 < 1e-6, "h_-2 {h_m2}");
        assert!((h_m1 - truth.h_m1).abs() / truth.h_m1 < 1e-6, "h_-1 {h_m1}");
        assert!((h_0 - truth.h_0).abs() / truth.h_0 < 1e-6, "h_0 {h_0}");
    }

    #[test]
    fn drift_basis_cannot_represent_a_floor_but_this_basis_can() {
        // A flicker-FM-dominated curve (flat floor) over τ.
        let truth = PowerLaw {
            h_m1: 1.0e-24,
            h_0: 1.0e-23,
            ..Default::default()
        };
        let taus: Vec<f64> = (0..7).map(|k| 10f64.powi(k)).collect();
        let adevs: Vec<f64> = taus
            .iter()
            .map(|&t| allan_deviation(&truth, t, 100.0))
            .collect();

        // This basis recovers the floor.
        let (_h_m2, h_m1, _h_0) = fit_fm_family(&taus, &adevs);
        assert!(
            (h_m1 - truth.h_m1).abs() / truth.h_m1 < 1e-6,
            "floor not recovered: {h_m1}"
        );

        // The drift basis {1/τ, τ, τ³} has no constant term, so it cannot fit the flat
        // floor: its best σ_y² reconstruction is materially wrong at large τ.
        let q = crate::quantum_trade::qparams_from_adev_curve(&taus, &adevs);
        let big_t = *taus.last().unwrap();
        let pred_var = q.q_wf / big_t + q.q_rw * big_t + q.q_drift * big_t * big_t * big_t;
        let true_var = allan_variance(&truth, big_t, 100.0);
        let rel = (pred_var - true_var).abs() / true_var;
        assert!(
            rel > 0.1,
            "drift basis unexpectedly reproduced the floor (rel={rel})"
        );
    }
}
