// SPDX-License-Identifier: AGPL-3.0-only
//! **The C/N0 model of the lab fit from IQ campaigns** (`docs/design/LABFIT-FROM-IQ.md` §3.1).
//!
//! Measured C/N0 against stated J/S is fitted with the spectral-separation form
//!
//! ```text
//! (C/N0)_eff = [ 1/(C/N0)_0 + 10^((J/S + δ)/10) / (Q_eff · R_c) ]^-1
//! ```
//!
//! with `(C/N0)_0` each satellite's measured baseline (not fitted), `R_c` the signal's chip
//! rate (stated), and two bounded parameters: `Q_eff` (default bounds `[0.1, 10]`) and the
//! J/S calibration offset `δ` (default `±10 dB`). The objective is weighted least squares on
//! the measured C/N0 in dB, each bin weighted by its epoch count `n`. Censored bins (the
//! satellite locked for less than 90 % of the bin) are kept out by the caller.
//!
//! **Degeneracy** (`docs/design/LABFIT-FROM-IQ.md` §13). `Q_eff` and `δ` enter the form only
//! through `10^(δ/10) / Q_eff`, so with the baseline held at its measured value they trade off
//! exactly against each other: the curve depends on `δ_eff = δ − 10·log10 Q_eff` alone,
//! whatever the J/S span. `Q_eff` is not identifiable from C/N0 data without an independent
//! measurement of the jammer and signal powers; it is stated, never fitted, and `δ_eff`
//! ([`delta_eff_db`]) is the fitted parameter. The fit reports the
//! correlation of the two estimates from the weighted Jacobian, and fixes `Q` at its stated
//! value (fitting `δ` alone) when the uncensored span is under 8 dB **or** that correlation
//! is at least 0.999 in magnitude: the two are then not separately identifiable from the
//! data. In that mode `Q` is reported as **"stated, not fitted"** with its source, never with
//! an interval. The stated `Q` is [`crate::jamming::q_factor`] of the event's type, the
//! event's own `q`, or, for a type the table does not cover, the most damaging stated value
//! (the smallest `Q` in the table, CW).

use serde::Serialize;

use super::optim::{grid_search, nelder_mead_bounded, NmOptions};

/// Uncensored J/S span (dB) below which `Q` is always held at its stated value.
pub const MIN_SPAN_DB: f64 = 8.0;
/// Correlation magnitude of the two estimates at or above which they are taken as not
/// separately identifiable.
pub const MAX_ABS_CORR: f64 = 0.999;

/// Modelled C/N0 (dB-Hz) at stated J/S `js_db` for baseline `c0_dbhz`.
pub fn model_cn0_dbhz(c0_dbhz: f64, js_db: f64, q: f64, delta_db: f64, chip_rate_hz: f64) -> f64 {
    crate::jamming::effective_cn0_dbhz(c0_dbhz, js_db + delta_db, q, chip_rate_hz)
}

/// The stated J/S at which C/N0 falls to `c_thr_dbhz` from `c0_dbhz` (§3.2 closed form):
/// `10·log10(Q·R_c·(1/C_thr − 1/C0)) − δ`. `None` when the threshold is at or above the
/// baseline (the satellite is below it at any J/S) or not finite.
pub fn threshold_js_db(
    c0_dbhz: f64,
    c_thr_dbhz: f64,
    q: f64,
    delta_db: f64,
    chip_rate_hz: f64,
) -> Option<f64> {
    if !(c_thr_dbhz.is_finite() && c0_dbhz.is_finite()) {
        return None;
    }
    let lin = |x: f64| 10f64.powf(x / 10.0);
    let a = q * chip_rate_hz * (1.0 / lin(c_thr_dbhz) - 1.0 / lin(c0_dbhz));
    (a > 0.0).then(|| 10.0 * a.log10() - delta_db)
}

/// One measured C/N0 bin entering the fit.
#[derive(Clone, Copy, Debug, PartialEq, Serialize)]
pub struct Cn0Point {
    /// The satellite's measured baseline C/N0 (dB-Hz).
    pub c0_dbhz: f64,
    /// Stated J/S of the bin (dB).
    pub js_db: f64,
    /// Measured C/N0 in the bin (dB-Hz).
    pub cn0_dbhz: f64,
    /// Weight: the bin's epoch count.
    pub weight: f64,
    /// Chip rate of the signal (chips/s).
    pub chip_rate_hz: f64,
}

impl Cn0Point {
    /// Measured minus modelled C/N0 (dB).
    pub fn residual(&self, q: f64, delta_db: f64) -> f64 {
        self.cn0_dbhz - model_cn0_dbhz(self.c0_dbhz, self.js_db, q, delta_db, self.chip_rate_hz)
    }
}

/// Whether `Q_eff` was fitted or held at its stated value.
#[derive(Clone, Copy, Debug, PartialEq, Eq, Serialize)]
#[serde(rename_all = "kebab-case")]
pub enum QMode {
    /// Both `Q_eff` and `δ` were fitted.
    Fitted,
    /// `Q` held at its stated value; `δ` fitted alone.
    FixedStated,
}

impl QMode {
    /// The label used in reports.
    pub fn as_str(self) -> &'static str {
        match self {
            QMode::Fitted => "fitted",
            QMode::FixedStated => "fixed-stated",
        }
    }
}

/// Bounds and the stated `Q` of one C/N0 fit.
#[derive(Clone, Copy, Debug, PartialEq)]
pub struct Cn0FitCfg {
    /// Bounds of `Q_eff`.
    pub q_bounds: [f64; 2],
    /// Bounds of `δ` (dB).
    pub delta_bounds_db: [f64; 2],
    /// The stated `Q`: the starting point, and the value held in fixed-stated mode.
    pub q_stated: f64,
}

/// The result of one C/N0 fit.
#[derive(Clone, Copy, Debug, PartialEq, Serialize)]
pub struct Cn0Fit {
    /// `Q_eff`: fitted, or the stated value in fixed-stated mode.
    pub q: f64,
    /// `δ` (dB).
    pub delta_db: f64,
    /// How `Q` was obtained.
    pub mode: QMode,
    /// Correlation of the `10·log10 Q_eff` and `δ` estimates from the weighted Jacobian at
    /// the stated `Q` (±1 when they are not separately identifiable).
    pub corr_q_delta: Option<f64>,
    /// Uncensored J/S span (dB).
    pub span_db: f64,
    /// Weighted RMS of the residuals (dB).
    pub residual_rms_db: f64,
    /// Points fitted.
    pub n_points: usize,
}

/// The weighted Jacobian correlation of (`10·log10 Q`, `δ`) at (`q`, `δ`): from the 2×2
/// normal matrix `JᵀWJ`, `corr = −b/√(ac)`. `None` without two informative points.
pub fn jacobian_corr(points: &[Cn0Point], q: f64, delta_db: f64) -> Option<f64> {
    let (mut a, mut b, mut c) = (0.0, 0.0, 0.0);
    for p in points {
        // f = −10·log10(1/C0 + 10^((J+δ)/10 − qdB/10)/R_c); ∂f/∂δ = −s, ∂f/∂qdB = +s.
        let lin = |x: f64| 10f64.powf(x / 10.0);
        let jt = lin(p.js_db + delta_db) / (q * p.chip_rate_hz);
        let s = jt / (1.0 / lin(p.c0_dbhz) + jt);
        let (jq, jd) = (s, -s);
        a += p.weight * jq * jq;
        b += p.weight * jq * jd;
        c += p.weight * jd * jd;
    }
    (a > 0.0 && c > 0.0).then(|| (-b / (a * c).sqrt()).clamp(-1.0, 1.0))
}

fn wsse(points: &[Cn0Point], q: f64, delta: f64) -> f64 {
    points
        .iter()
        .map(|p| p.weight * p.residual(q, delta).powi(2))
        .sum()
}

fn opts() -> NmOptions {
    NmOptions {
        max_evals: 4000,
        ftol: 1e-13,
        xtol: 1e-10,
        initial_step: 0.5,
        max_restarts: 3,
    }
}

/// Fit `δ` alone at `Q = q`.
fn fit_delta(points: &[Cn0Point], q: f64, cfg: &Cn0FitCfg) -> f64 {
    let [lo, hi] = cfg.delta_bounds_db;
    let f = |x: &[f64]| wsse(points, q, x[0]);
    let start = grid_search(f, &[lo], &[hi], 41)
        .first()
        .map_or(0.0, |(x, _)| x[0]);
    nelder_mead_bounded(f, &[start], &[lo], &[hi], &opts()).x[0]
}

/// Fit both parameters (`Q` searched in dB).
fn fit_both(points: &[Cn0Point], cfg: &Cn0FitCfg) -> (f64, f64) {
    let qlo = 10.0 * cfg.q_bounds[0].log10();
    let qhi = 10.0 * cfg.q_bounds[1].log10();
    let [dlo, dhi] = cfg.delta_bounds_db;
    let f = |x: &[f64]| wsse(points, 10f64.powf(x[0] / 10.0), x[1]);
    let lo = [qlo, dlo];
    let hi = [qhi, dhi];
    let mut best: Option<(Vec<f64>, f64)> = None;
    for (x, _) in grid_search(f, &lo, &hi, 21).into_iter().take(3) {
        let r = nelder_mead_bounded(f, &x, &lo, &hi, &opts());
        if best.as_ref().is_none_or(|b| r.f < b.1) {
            best = Some((r.x, r.f));
        }
    }
    let x = best.map_or(vec![10.0 * cfg.q_stated.log10(), 0.0], |b| b.0);
    (10f64.powf(x[0] / 10.0), x[1])
}

/// The identifiable offset of a fit, `δ_eff = δ − 10·log10 Q` (dB): the J/S offset referred
/// to `Q = 1`. It is the same for every `(Q, δ)` on the degenerate ridge.
pub fn delta_eff_db(f: &Cn0Fit) -> f64 {
    f.delta_db - 10.0 * f.q.log10()
}

/// The span (dB) of the stated J/S over `points`.
pub fn span_db(points: &[Cn0Point]) -> f64 {
    let lo = points.iter().map(|p| p.js_db).fold(f64::INFINITY, f64::min);
    let hi = points
        .iter()
        .map(|p| p.js_db)
        .fold(f64::NEG_INFINITY, f64::max);
    if hi >= lo {
        hi - lo
    } else {
        0.0
    }
}

/// Choose the mode for `points`: fixed-stated under [`MIN_SPAN_DB`] of span or at
/// [`MAX_ABS_CORR`] of correlation at the stated `Q`.
pub fn choose_mode(points: &[Cn0Point], cfg: &Cn0FitCfg) -> (QMode, Option<f64>) {
    let corr = jacobian_corr(points, cfg.q_stated, 0.0);
    let degenerate = corr.is_none_or(|c| c.abs() >= MAX_ABS_CORR);
    if span_db(points) < MIN_SPAN_DB || degenerate {
        (QMode::FixedStated, corr)
    } else {
        (QMode::Fitted, corr)
    }
}

/// Fit the C/N0 model in the given `mode`. `None` without a point to fit.
pub fn fit_in_mode(points: &[Cn0Point], cfg: &Cn0FitCfg, mode: QMode) -> Option<Cn0Fit> {
    if points.is_empty() || points.iter().all(|p| p.weight <= 0.0) {
        return None;
    }
    let (q, delta_db) = match mode {
        QMode::FixedStated => (cfg.q_stated, fit_delta(points, cfg.q_stated, cfg)),
        QMode::Fitted => fit_both(points, cfg),
    };
    let wsum: f64 = points.iter().map(|p| p.weight).sum();
    Some(Cn0Fit {
        q,
        delta_db,
        mode,
        corr_q_delta: jacobian_corr(points, cfg.q_stated, 0.0),
        span_db: span_db(points),
        residual_rms_db: (wsse(points, q, delta_db) / wsum).sqrt(),
        n_points: points.len(),
    })
}

/// Fit the C/N0 model, choosing the mode from the data ([`choose_mode`]).
pub fn fit(points: &[Cn0Point], cfg: &Cn0FitCfg) -> Option<Cn0Fit> {
    let (mode, _) = choose_mode(points, cfg);
    fit_in_mode(points, cfg, mode)
}

#[cfg(test)]
mod tests {
    use super::*;

    const RC: f64 = 1.023e6;

    fn pts(q: f64, delta: f64, js: &[f64]) -> Vec<Cn0Point> {
        js.iter()
            .map(|&j| Cn0Point {
                c0_dbhz: 45.0,
                js_db: j,
                cn0_dbhz: model_cn0_dbhz(45.0, j, q, delta, RC),
                weight: 100.0,
                chip_rate_hz: RC,
            })
            .collect()
    }

    fn cfg(q: f64) -> Cn0FitCfg {
        Cn0FitCfg {
            q_bounds: [0.1, 10.0],
            delta_bounds_db: [-10.0, 10.0],
            q_stated: q,
        }
    }

    #[test]
    fn q_and_delta_are_exactly_degenerate() {
        // The same curve from (Q, δ) and (2Q, δ + 3.0103 dB).
        for j in [0.0, 15.0, 30.0] {
            let a = model_cn0_dbhz(45.0, j, 1.0, 0.0, RC);
            let b = model_cn0_dbhz(45.0, j, 2.0, 10.0 * 2f64.log10(), RC);
            assert!((a - b).abs() < 1e-12);
        }
        let p = pts(2.0, 1.5, &[0.0, 10.0, 20.0, 30.0, 40.0]);
        let c = jacobian_corr(&p, 2.0, 0.0).unwrap();
        assert!((c - 1.0).abs() < 1e-12, "corr {c}");
        let (mode, _) = choose_mode(&p, &cfg(2.0));
        assert_eq!(mode, QMode::FixedStated);
    }

    #[test]
    fn delta_is_recovered_at_the_stated_q() {
        let p = pts(2.0, 1.5, &[10.0, 15.0, 20.0, 25.0, 30.0]);
        let f = fit(&p, &cfg(2.0)).unwrap();
        assert_eq!(f.mode, QMode::FixedStated);
        assert!((f.delta_db - 1.5).abs() < 1e-6, "{f:?}");
        assert!(f.residual_rms_db < 1e-6);
        // At a wrong stated Q, δ absorbs 10·log10 of the ratio exactly.
        let f = fit(&p, &cfg(1.0)).unwrap();
        assert!((f.delta_db - (1.5 - 10.0 * 2f64.log10())).abs() < 1e-6);
    }

    #[test]
    fn the_closed_form_threshold_inverts_the_model() {
        let (q, d) = (2.0, -1.0);
        let thr = threshold_js_db(45.0, 28.0, q, d, RC).unwrap();
        assert!((model_cn0_dbhz(45.0, thr, q, d, RC) - 28.0).abs() < 1e-9);
        assert!(threshold_js_db(45.0, 46.0, q, d, RC).is_none());
    }
}
