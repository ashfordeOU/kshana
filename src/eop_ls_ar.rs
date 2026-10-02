// SPDX-License-Identifier: AGPL-3.0-only
//! Least-squares plus autoregressive (LS+AR) Earth-orientation prediction with the zonal
//! tides removed analytically.
//!
//! This is the operational prediction scheme of the IERS Rapid Service/Prediction Centre
//! and of most entries in the Earth Orientation Parameters Prediction Comparison Campaigns
//! (Kosek et al., Artificial Satellites 2005; Kalarus et al., J. Geod. 84 2010), without the
//! atmospheric angular-momentum forecasts Bulletin A adds for UT1:
//!
//! * **UT1.** The zonal-tide effect `dUT1` of the IERS Conventions (2010), chapter 8,
//!   Table 8.1 (62 terms, Yoder et al. 1981 body tide, Wahr and Bergen 1986 inelasticity,
//!   Kantha et al. 1998 ocean tides) is removed from `UT1 - TAI` to form the regularised
//!   `UT1R - TAI`. Its daily first difference (the excess length of day with the tides
//!   removed, LODR, sign aside) is fitted over the window by least squares with a bias, a
//!   rate, and annual and semi-annual pairs; an autoregressive model of order `p`, fitted by
//!   least squares to the LS residuals, forecasts the residual; the forecast LODR is summed
//!   from the last `UT1R - TAI` value, and the tides are restored at the target epoch.
//! * **Polar motion.** Each coordinate is fitted over its window by least squares with a
//!   bias, a rate, and Chandler, annual and semi-annual pairs; an AR model of the residuals
//!   forecasts the stochastic part, added to the LS extrapolation.
//!
//! Every input sample must lie at or before the issue epoch (enforced), on a gap-free daily
//! grid over the window.

/// IERS Conventions (2010) Table 8.1: Delaunay multipliers `l, l', F, D, Omega` and the
/// `dUT1` coefficients `B` (sine) and `C` (cosine) in units of 1e-4 s. (The length-of-day and
/// angular-velocity columns are not needed here.) Transcribed from the published table and
/// checked against the DATA statements of the IERS Conventions routine RG_ZONT2.
const ZONAL_TIDES: [([i8; 5], f64, f64); 62] = [
    ([1, 0, 2, 2, 2], -0.0235, 0.0000),
    ([2, 0, 2, 0, 1], -0.0404, 0.0000),
    ([2, 0, 2, 0, 2], -0.0987, 0.0000),
    ([0, 0, 2, 2, 1], -0.0508, 0.0000),
    ([0, 0, 2, 2, 2], -0.1231, 0.0000),
    ([1, 0, 2, 0, 0], -0.0385, 0.0000),
    ([1, 0, 2, 0, 1], -0.4108, 0.0000),
    ([1, 0, 2, 0, 2], -0.9926, 0.0000),
    ([3, 0, 0, 0, 0], -0.0179, 0.0000),
    ([-1, 0, 2, 2, 1], -0.0818, 0.0000),
    ([-1, 0, 2, 2, 2], -0.1974, 0.0000),
    ([1, 0, 0, 2, 0], -0.0761, 0.0000),
    ([2, 0, 2, -2, 2], 0.0216, 0.0000),
    ([0, 1, 2, 0, 2], 0.0254, 0.0000),
    ([0, 0, 2, 0, 0], -0.2989, 0.0000),
    ([0, 0, 2, 0, 1], -3.1873, 0.2010),
    ([0, 0, 2, 0, 2], -7.8468, 0.5320),
    ([2, 0, 0, 0, -1], 0.0216, 0.0000),
    ([2, 0, 0, 0, 0], -0.3384, 0.0000),
    ([2, 0, 0, 0, 1], 0.0179, 0.0000),
    ([0, -1, 2, 0, 2], -0.0244, 0.0000),
    ([0, 0, 0, 2, -1], 0.0470, 0.0000),
    ([0, 0, 0, 2, 0], -0.7341, 0.0000),
    ([0, 0, 0, 2, 1], -0.0526, 0.0000),
    ([0, -1, 0, 2, 0], -0.0508, 0.0000),
    ([1, 0, 2, -2, 1], 0.0498, 0.0000),
    ([1, 0, 2, -2, 2], 0.1006, 0.0000),
    ([1, 1, 0, 0, 0], 0.0395, 0.0000),
    ([-1, 0, 2, 0, 0], 0.0470, 0.0000),
    ([-1, 0, 2, 0, 1], 0.1767, 0.0000),
    ([-1, 0, 2, 0, 2], 0.4352, 0.0000),
    ([1, 0, 0, 0, -1], 0.5339, 0.0000),
    ([1, 0, 0, 0, 0], -8.4046, 0.2500),
    ([1, 0, 0, 0, 1], 0.5443, 0.0000),
    ([0, 0, 0, 1, 0], 0.0470, 0.0000),
    ([1, -1, 0, 0, 0], -0.0555, 0.0000),
    ([-1, 0, 0, 2, -1], 0.1175, 0.0000),
    ([-1, 0, 0, 2, 0], -1.8236, 0.0000),
    ([-1, 0, 0, 2, 1], 0.1316, 0.0000),
    ([1, 0, -2, 2, -1], 0.0179, 0.0000),
    ([-1, -1, 0, 2, 0], -0.0855, 0.0000),
    ([0, 2, 2, -2, 2], -0.0573, 0.0000),
    ([0, 1, 2, -2, 1], 0.0329, 0.0000),
    ([0, 1, 2, -2, 2], -1.8847, 0.0000),
    ([0, 0, 2, -2, 0], 0.2510, 0.0000),
    ([0, 0, 2, -2, 1], 1.1703, 0.0000),
    ([0, 0, 2, -2, 2], -49.7174, 0.4330),
    ([0, 2, 0, 0, 0], -0.1936, 0.0000),
    ([2, 0, 0, -2, -1], 0.0489, 0.0000),
    ([2, 0, 0, -2, 0], -0.5471, 0.0000),
    ([2, 0, 0, -2, 1], 0.0367, 0.0000),
    ([0, -1, 2, -2, 1], -0.0451, 0.0000),
    ([0, 1, 0, 0, -1], 0.0921, 0.0000),
    ([0, -1, 2, -2, 2], 0.8281, 0.0000),
    ([0, 1, 0, 0, 0], -15.8887, 0.1530),
    ([0, 1, 0, 0, 1], -0.1382, 0.0000),
    ([1, 0, 0, -1, 0], 0.0348, 0.0000),
    ([2, 0, -2, 0, 0], -0.1372, 0.0000),
    ([-2, 0, 2, 0, 1], 0.4211, 0.0000),
    ([-1, 1, 0, 1, 0], -0.0404, 0.0000),
    ([0, 0, 0, 0, 2], 7.8998, 0.0000),
    ([0, 0, 0, 0, 1], -1617.2681, 0.0000),
];

/// Zonal-tide effect on UT1, `dUT1` (seconds), at `mjd` (TT; UTC is within the precision of
/// these slow terms), IERS Conventions (2010) eq. 8.8 with Table 8.1.
pub fn zonal_tide_dut1(mjd: f64) -> f64 {
    let jd_tt = mjd + 2_400_000.5;
    let a = crate::nutation::delaunay_args(jd_tt);
    let mut s = 0.0;
    for (m, b, c) in ZONAL_TIDES.iter().rev() {
        let arg: f64 = m
            .iter()
            .zip(a.iter())
            .map(|(&k, &x)| f64::from(k) * x)
            .sum();
        let (sn, cs) = arg.sin_cos();
        s += b * sn + c * cs;
    }
    s * 1e-4
}

/// Configuration of the LS+AR predictor.
#[derive(Clone, Copy, Debug, PartialEq)]
pub struct LsArConfig {
    /// UT1 least-squares window, days.
    pub ut1_window_days: usize,
    /// Autoregressive order for the UT1 (LODR) residuals.
    pub ut1_ar_order: usize,
    /// Polar-motion least-squares window, days.
    pub pm_window_days: usize,
    /// Autoregressive order for the polar-motion residuals.
    pub pm_ar_order: usize,
}

impl Default for LsArConfig {
    /// Five-year windows and order-20 AR models for both quantities.
    fn default() -> Self {
        Self {
            ut1_window_days: 1825,
            ut1_ar_order: 20,
            pm_window_days: 1825,
            pm_ar_order: 20,
        }
    }
}

/// One daily Earth-orientation sample: MJD, `x_p` and `y_p` (arcsec), `UT1 - UTC` (s).
pub type EopSample = (f64, f64, f64, f64);

/// Errors of [`ls_ar_predict`].
#[derive(Clone, Debug, PartialEq)]
pub enum LsArError {
    /// The history does not reach back over the window on a gap-free daily grid.
    IncompleteWindow,
    /// A least-squares system was singular.
    Singular,
}

const ANNUAL: f64 = 365.25;
const SEMIANNUAL: f64 = 365.25 / 2.0;
const CHANDLER: f64 = 433.0;

fn tai_minus_utc(mjd: f64) -> f64 {
    crate::timescales::tai_minus_utc(mjd + crate::timescales::MJD_OFFSET)
}

/// Solve the least-squares problem `min |A x - b|` through the normal equations (Gaussian
/// elimination with partial pivoting).
fn lstsq(rows: &[Vec<f64>], b: &[f64]) -> Option<Vec<f64>> {
    let k = rows.first()?.len();
    let mut a = vec![vec![0.0; k]; k];
    let mut y = vec![0.0; k];
    for (r, &v) in rows.iter().zip(b) {
        for i in 0..k {
            y[i] += r[i] * v;
            for j in 0..k {
                a[i][j] += r[i] * r[j];
            }
        }
    }
    for col in 0..k {
        let p = (col..k).max_by(|&i, &j| a[i][col].abs().total_cmp(&a[j][col].abs()))?;
        if a[p][col].abs().partial_cmp(&1e-300) != Some(std::cmp::Ordering::Greater) {
            return None;
        }
        a.swap(col, p);
        y.swap(col, p);
        for row in col + 1..k {
            let f = a[row][col] / a[col][col];
            let (upper, lower) = a.split_at_mut(row);
            for (t, &v) in lower[0][col..].iter_mut().zip(&upper[col][col..]) {
                *t -= f * v;
            }
            y[row] -= f * y[col];
        }
    }
    let mut x = vec![0.0; k];
    for i in (0..k).rev() {
        let s: f64 = (i + 1..k).map(|c| a[i][c] * x[c]).sum();
        x[i] = (y[i] - s) / a[i][i];
    }
    x.iter().all(|v| v.is_finite()).then_some(x)
}

fn design_row(t: f64, periods: &[f64]) -> Vec<f64> {
    let mut r = vec![1.0, t / ANNUAL];
    for p in periods {
        let w = std::f64::consts::TAU * t / p;
        r.push(w.cos());
        r.push(w.sin());
    }
    r
}

/// LS fit of `values` at times `t` (days from the issue epoch) with bias, rate and the
/// periodic pairs, an AR(`p`) model of the residuals, and the forecast at `1..=h_max` days.
fn ls_ar_series(
    t: &[f64],
    values: &[f64],
    periods: &[f64],
    p: usize,
    h_max: usize,
) -> Option<Vec<f64>> {
    let rows: Vec<Vec<f64>> = t.iter().map(|&ti| design_row(ti, periods)).collect();
    let c = lstsq(&rows, values)?;
    let model = |r: &[f64]| -> f64 { r.iter().zip(&c).map(|(a, b)| a * b).sum() };
    let resid: Vec<f64> = rows.iter().zip(values).map(|(r, v)| v - model(r)).collect();
    let mut fc: Vec<f64> = (1..=h_max)
        .map(|h| model(&design_row(h as f64, periods)))
        .collect();
    if p > 0 {
        if resid.len() <= 2 * p {
            return None;
        }
        // AR(p) by least squares: r_k = sum_j phi_j r_{k-j}.
        let ar_rows: Vec<Vec<f64>> = (p..resid.len())
            .map(|k| (1..=p).map(|j| resid[k - j]).collect())
            .collect();
        let phi = lstsq(&ar_rows, &resid[p..])?;
        let mut buf: Vec<f64> = resid[resid.len() - p..].to_vec();
        for f in fc.iter_mut() {
            let n = buf.len();
            let v: f64 = (1..=p).map(|j| phi[j - 1] * buf[n - j]).sum();
            *f += v;
            buf.push(v);
        }
    }
    Some(fc)
}

/// Forecast `x_p`, `y_p` (arcsec) and `UT1 - UTC` (s) at `issue_mjd + 1 ..= issue_mjd +
/// h_max` from the daily `history` (any order; samples after `issue_mjd` are discarded).
/// Returns `(mjd, x_p, y_p, UT1 - UTC)` per lead day.
pub fn ls_ar_predict(
    history: &[EopSample],
    issue_mjd: f64,
    h_max: usize,
    cfg: &LsArConfig,
) -> Result<Vec<EopSample>, LsArError> {
    let mut h: Vec<EopSample> = history
        .iter()
        .copied()
        .filter(|s| s.0 <= issue_mjd + 1e-6)
        .collect();
    h.sort_by(|a, b| a.0.total_cmp(&b.0));
    h.dedup_by(|a, b| (a.0 - b.0).abs() < 1e-6);
    let need = cfg.ut1_window_days.max(cfg.pm_window_days) + 1;
    let Some(&(last_mjd, ..)) = h.last() else {
        return Err(LsArError::IncompleteWindow);
    };
    if h.len() < need || (last_mjd - issue_mjd).abs() > 1e-6 {
        return Err(LsArError::IncompleteWindow);
    }
    let tail = &h[h.len() - need..];
    if tail
        .windows(2)
        .any(|w| (w[1].0 - w[0].0 - 1.0).abs() > 1e-6)
    {
        return Err(LsArError::IncompleteWindow);
    }
    // UT1: regularised UT1R - TAI, its daily differences (LODR with the sign of dUT1/dt).
    let wu = &tail[tail.len() - cfg.ut1_window_days - 1..];
    let ut1r: Vec<f64> = wu
        .iter()
        .map(|s| s.3 - tai_minus_utc(s.0) - zonal_tide_dut1(s.0))
        .collect();
    let d: Vec<f64> = ut1r.windows(2).map(|w| w[1] - w[0]).collect();
    let td: Vec<f64> = wu[1..].iter().map(|s| s.0 - issue_mjd).collect();
    let dfc = ls_ar_series(&td, &d, &[ANNUAL, SEMIANNUAL], cfg.ut1_ar_order, h_max)
        .ok_or(LsArError::Singular)?;
    // Polar motion.
    let wp = &tail[tail.len() - cfg.pm_window_days..];
    let tp: Vec<f64> = wp.iter().map(|s| s.0 - issue_mjd).collect();
    let xs: Vec<f64> = wp.iter().map(|s| s.1).collect();
    let ys: Vec<f64> = wp.iter().map(|s| s.2).collect();
    let pm_periods = [CHANDLER, ANNUAL, SEMIANNUAL];
    let xfc =
        ls_ar_series(&tp, &xs, &pm_periods, cfg.pm_ar_order, h_max).ok_or(LsArError::Singular)?;
    let yfc =
        ls_ar_series(&tp, &ys, &pm_periods, cfg.pm_ar_order, h_max).ok_or(LsArError::Singular)?;

    let mut acc = *ut1r.last().ok_or(LsArError::IncompleteWindow)?;
    let mut out = Vec::with_capacity(h_max);
    for k in 0..h_max {
        acc += dfc[k];
        let m = issue_mjd + (k + 1) as f64;
        let ut1_utc = acc + zonal_tide_dut1(m) + tai_minus_utc(m);
        out.push((m, xfc[k], yfc[k], ut1_utc));
    }
    Ok(out)
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn zonal_tide_terms_and_scale() {
        assert_eq!(ZONAL_TIDES.len(), 62);
        // The 18.6-year term dominates: |dUT1| stays below its 0.1617 s amplitude plus the
        // sum of all the others.
        let bound: f64 = ZONAL_TIDES
            .iter()
            .map(|t| t.1.abs() + t.2.abs())
            .sum::<f64>()
            * 1e-4;
        for k in 0..400 {
            let v = zonal_tide_dut1(51_544.5 + 25.0 * k as f64);
            assert!(v.abs() <= bound);
        }
        // The fortnightly Mf term (0 0 2 0 2, B = -7.8468e-4 s) makes the series vary by
        // about +-1 ms over two weeks.
        let a = zonal_tide_dut1(60_000.0);
        let span = (0..14)
            .map(|d| zonal_tide_dut1(60_000.0 + d as f64) - a)
            .fold(0.0f64, |m, v| m.max(v.abs()));
        assert!(span > 5e-4 && span < 5e-3, "{span}");
    }

    #[test]
    fn predictor_recovers_a_noise_free_model_and_refuses_gaps() {
        // Synthetic: linear pole drift plus an annual term; UT1R a quadratic in time.
        let issue = 60_000.0;
        let f = |m: f64| -> EopSample {
            let t = m - issue;
            let w = std::f64::consts::TAU * t / ANNUAL;
            let ut1r = 0.1 - 1e-3 * t / 1.0 + 2e-8 * t * t;
            (
                m,
                0.1 + 1e-4 * t + 0.05 * w.cos(),
                0.3 - 2e-4 * t + 0.03 * w.sin(),
                ut1r + zonal_tide_dut1(m) + tai_minus_utc(m),
            )
        };
        let hist: Vec<EopSample> = (0..=1900).map(|k| f(issue - 1900.0 + k as f64)).collect();
        let cfg = LsArConfig {
            ut1_ar_order: 0,
            pm_ar_order: 0,
            ..LsArConfig::default()
        };
        let p = ls_ar_predict(&hist, issue, 10, &cfg).unwrap();
        for (k, s) in p.iter().enumerate() {
            let e = f(issue + (k + 1) as f64);
            assert!((s.1 - e.1).abs() < 1e-9 && (s.2 - e.2).abs() < 1e-9);
            assert!((s.3 - e.3).abs() < 1e-8, "{} {}", s.3, e.3);
        }
        let mut gap = hist.clone();
        gap.remove(1500);
        assert_eq!(
            ls_ar_predict(&gap, issue, 10, &cfg),
            Err(LsArError::IncompleteWindow)
        );
    }
}
