// SPDX-License-Identifier: AGPL-3.0-only
//! Clock-assisted RAIM: what the receiver clock is worth as an extra measurement.
//!
//! Snapshot RAIM estimates three position coordinates and the receiver clock bias from `n`
//! pseudoranges and has `n − 4` degrees of freedom to detect a fault with. A clock whose bias has been
//! calibrated (for example while more satellites were in view) and is then predicted forward adds a
//! pseudo-measurement of the clock state, `[0, 0, 0, 1]`, whose standard deviation is the clock's
//! prediction error after the coast, `c·σ_x(t)`. That gives one more degree of freedom (RAIM with four
//! satellites) and a stronger geometry while the clock is good; as the coast grows its weight falls
//! and the benefit fades. The idea of clock coasting in RAIM is long-standing (for example Sturza,
//! "Navigation system integrity monitoring using redundant measurements", NAVIGATION 35(4), 1988);
//! this module quantifies it for a stated clock and sky.
//!
//! Method: weighted least squares in local East, North, Up with the geometry row
//! `[−cos el·sin az, −cos el·cos az, −sin el, 1]` per satellite (σ `sigma_m`) and the clock row
//! (σ `c·σ_x(t)`). With whitened rows the slope of measurement `i` is
//! `|S_pos,i| / sqrt(1 − P_ii)`, and the protection level is the largest slope times `pbias`, the
//! non-centrality root that meets the missed-detection probability at the chi-squared threshold of
//! the false-alarm probability ([`crate::raim::pbias`], [`crate::raim::chi2_quantile`]), the same
//! construction as [`crate::raim::snapshot_raim`] with weights. The clock row is itself a measurement
//! that can fail and is included in the slopes (`aided`); a clock row much more precise than the
//! pseudoranges has little redundancy of its own, so its own slope can set the level, and the
//! smallest level then falls at a clock σ near the range σ. `aided_clock_fault_free` leaves the
//! clock's own slope out, for a clock monitored by other means. With no clock row and equal weights the levels equal
//! [`crate::raim::snapshot_raim`] (a unit test).
//!
//! The clock's coast error is `σ_x(t) = sqrt(σ_cal² + (t·σ_y(t))² + (D·t²/2)²)`: the calibration
//! error, the stochastic part of [`super::environment`] and the unmodelled ageing over the coast.
//! MODELLED.

use super::{field_err, positive, ClockRef, LABEL};
use crate::raim::{chi2_quantile, pbias};
use serde::{Deserialize, Serialize};

/// Speed of light, m/s.
const C_M_S: f64 = 299_792_458.0;

/// Input of `kshana oscillator raim-aid`.
#[derive(Clone, Debug, PartialEq, Serialize, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct RaimAidInput {
    /// The receiver clock.
    pub clock: ClockRef,
    /// Satellites `[azimuth_deg, elevation_deg]`.
    pub satellites: Vec<(f64, f64)>,
    /// One-sigma pseudorange error, m.
    pub sigma_m: f64,
    /// False-alarm probability.
    pub p_fa: f64,
    /// Missed-detection probability.
    pub p_md: f64,
    /// One-sigma clock bias error at calibration, s.
    #[serde(default)]
    pub calibration_sigma_s: f64,
    /// Coast times since calibration, s.
    pub coast_s: Vec<f64>,
}

/// Protection levels for one configuration.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct Levels {
    /// Degrees of freedom of the detection test.
    pub dof: usize,
    /// Horizontal protection level, m.
    pub hpl_m: f64,
    /// Vertical protection level, m.
    pub vpl_m: f64,
}

/// One coast time.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct CoastRow {
    /// Coast since calibration, s.
    pub coast_s: f64,
    /// The clock row's standard deviation, m.
    pub clock_sigma_m: f64,
    /// Levels with the clock row, the clock row itself counted as a measurement that can fail.
    pub aided: Option<Levels>,
    /// Levels with the clock row assumed not to fail (only the satellites' slopes).
    pub aided_clock_fault_free: Option<Levels>,
}

/// Report of `kshana oscillator raim-aid`.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct RaimAidReport {
    /// Evidence label.
    pub label: &'static str,
    /// The clock's id.
    pub clock: String,
    /// Levels without the clock row (`null`: fewer than five satellites, no RAIM).
    pub unaided: Option<Levels>,
    /// Levels with the clock row, per coast time.
    pub coast: Vec<CoastRow>,
}

fn invert4(m: [[f64; 4]; 4]) -> Option<[[f64; 4]; 4]> {
    let mut a = m;
    let mut inv = [[0.0; 4]; 4];
    for (i, row) in inv.iter_mut().enumerate() {
        row[i] = 1.0;
    }
    for c in 0..4 {
        let p = (c..4).max_by(|&i, &j| a[i][c].abs().total_cmp(&a[j][c].abs()))?;
        if a[p][c].abs() < 1e-14 {
            return None;
        }
        a.swap(c, p);
        inv.swap(c, p);
        let d = a[c][c];
        for k in 0..4 {
            a[c][k] /= d;
            inv[c][k] /= d;
        }
        for r in 0..4 {
            if r != c {
                let f = a[r][c];
                for k in 0..4 {
                    a[r][k] -= f * a[c][k];
                    inv[r][k] -= f * inv[c][k];
                }
            }
        }
    }
    Some(inv)
}

/// Weighted slope RAIM on rows `(g, sigma)` in East, North, Up, clock. `None` when there is no
/// redundancy or the geometry is singular.
/// With `last_can_fail` false the last row's own slope is left out (it is then assumed not to fail).
pub fn weighted_levels(
    rows: &[([f64; 4], f64)],
    p_fa: f64,
    p_md: f64,
    last_can_fail: bool,
) -> Option<Levels> {
    if rows.len() < 5 {
        return None;
    }
    let w: Vec<[f64; 4]> = rows
        .iter()
        .map(|(g, s)| [g[0] / s, g[1] / s, g[2] / s, g[3] / s])
        .collect();
    let mut n = [[0.0; 4]; 4];
    for r in &w {
        for i in 0..4 {
            for j in 0..4 {
                n[i][j] += r[i] * r[j];
            }
        }
    }
    let a = invert4(n)?;
    let dof = rows.len() - 4;
    let thr = chi2_quantile(1.0 - p_fa, dof as f64);
    let pb = pbias(thr, dof as f64, p_md);
    let (mut sh, mut sv) = (0.0_f64, 0.0_f64);
    let faultable = if last_can_fail { w.len() } else { w.len() - 1 };
    for r in &w[..faultable] {
        // Column of S = A·Wᵀ for this row, and the hat-matrix diagonal.
        let s: Vec<f64> = (0..4)
            .map(|i| (0..4).map(|k| a[i][k] * r[k]).sum())
            .collect();
        let pii: f64 = (0..4).map(|k| r[k] * s[k]).sum();
        let red = (1.0 - pii).max(1e-12);
        sh = sh.max(((s[0] * s[0] + s[1] * s[1]) / red).sqrt());
        sv = sv.max((s[2] * s[2] / red).sqrt());
    }
    Some(Levels {
        dof,
        hpl_m: sh * pb,
        vpl_m: sv * pb,
    })
}

/// The geometry row of a satellite at azimuth and elevation (degrees).
pub fn enu_row(az_deg: f64, el_deg: f64) -> [f64; 4] {
    let (az, el) = (az_deg.to_radians(), el_deg.to_radians());
    [-el.cos() * az.sin(), -el.cos() * az.cos(), -el.sin(), 1.0]
}

/// Run the comparison.
pub fn run(inp: &RaimAidInput) -> Result<RaimAidReport, String> {
    positive("sigma_m", inp.sigma_m)?;
    for (n, p) in [("p_fa", inp.p_fa), ("p_md", inp.p_md)] {
        if !(p.is_finite() && p > 0.0 && p < 1.0) {
            return Err(field_err(n, p));
        }
    }
    if !(inp.calibration_sigma_s.is_finite() && inp.calibration_sigma_s >= 0.0) {
        return Err(field_err("calibration_sigma_s", inp.calibration_sigma_s));
    }
    if inp.satellites.len() > 200 || inp.coast_s.len() > 10_000 {
        return Err(field_err("entries", 10_000.0));
    }
    for &(az, el) in &inp.satellites {
        if !(az.is_finite() && el.is_finite() && (-90.0..=90.0).contains(&el)) {
            return Err(field_err("satellites", el));
        }
    }
    for &t in &inp.coast_s {
        if !(t.is_finite() && t >= 0.0) {
            return Err(field_err("coast_s", t));
        }
    }
    let spec = inp.clock.resolve()?;
    let noise = spec.noise();
    let d = spec.aging_per_day / 86_400.0;
    let sats: Vec<([f64; 4], f64)> = inp
        .satellites
        .iter()
        .map(|&(az, el)| (enu_row(az, el), inp.sigma_m))
        .collect();
    let unaided = weighted_levels(&sats, inp.p_fa, inp.p_md, true);
    let coast = inp
        .coast_s
        .iter()
        .map(|&t| {
            let stoch = if t > 0.0 { t * noise.adev(t) } else { 0.0 };
            let ageing = 0.5 * d * t * t;
            let sx = (inp.calibration_sigma_s.powi(2) + stoch * stoch + ageing * ageing).sqrt();
            let sm = (C_M_S * sx).max(1e-6);
            let mut rows = sats.clone();
            rows.push(([0.0, 0.0, 0.0, 1.0], sm));
            CoastRow {
                coast_s: t,
                clock_sigma_m: sm,
                aided: weighted_levels(&rows, inp.p_fa, inp.p_md, true),
                aided_clock_fault_free: weighted_levels(&rows, inp.p_fa, inp.p_md, false),
            }
        })
        .collect();
    Ok(RaimAidReport {
        label: LABEL,
        clock: spec.id,
        unaided,
        coast,
    })
}
