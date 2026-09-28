// SPDX-License-Identifier: AGPL-3.0-only
//! Signal-in-space range error (SISRE) of a navigation message against the truth.
//!
//! The global-average SISRE of Montenbruck, Steigenberger and Hauschild (2018,
//! "Multi-GNSS signal-in-space range error assessment – Methodology and results",
//! Advances in Space Research 61(12):3020–3038, doi 10.1016/j.asr.2018.03.041):
//!
//! ```text
//! SISRE_orb = sqrt( w_R² R² + w_AC² (A² + C²) )
//! SISRE     = sqrt( (w_R R − c·dT)² + w_AC² (A² + C²) )
//! ```
//!
//! with `R, A, C` the radial, along-track and cross-track errors of the message position
//! and `dT` its clock error (message minus truth). The weights are the averages, over a
//! uniform distribution of users on the Earth's surface who see the satellite above the
//! elevation mask, of `cos² η` (radial) and `½ sin² η` (each transverse axis), with `η`
//! the nadir angle of the line of sight at the satellite. [`sisre_weights`] computes them
//! for any orbit radius and mask; at a 0° mask it reproduces the published table of that
//! paper for the medium Earth orbit (MEO) and geostationary constellations (GPS 0.98 and
//! 1/49, GLONASS 1/45, Galileo 1/61, BeiDou MEO 1/54, geostationary 0.99 and 1/126), the
//! check that pins the computation. For LEO the same average gives much smaller radial
//! weights (0.46 at 510 km) and much larger transverse weights (1/2.5): a LEO user sees
//! the satellite from far off nadir, so along- and cross-track errors matter.

use super::elements::{sat_state, sub, LeoNavMessage, SysTime, C_LIGHT};
use super::truth::{TruthClock, TruthOrbit};
use serde::{Deserialize, Serialize};

/// Earth radius used for the user sphere in the weight average (m): the WGS 84
/// equatorial radius.
pub const EARTH_RADIUS_M: f64 = 6_378_137.0;

/// SISRE weighting factors.
#[derive(Clone, Copy, Debug, PartialEq, Serialize, Deserialize)]
pub struct SisreWeights {
    /// Radial weight `w_R`.
    pub w_r: f64,
    /// Squared transverse weight `w_AC²` (applied to `A² + C²`).
    pub w_ac2: f64,
    /// Largest nadir angle of a visible user (deg).
    pub max_nadir_deg: f64,
}

/// The global-average SISRE weights for a satellite at orbit radius `r_m` and a user
/// elevation mask `mask_deg`, by Simpson integration over the visible spherical cap
/// (area element `sin λ dλ`, `λ` the Earth-central angle from the sub-satellite point).
pub fn sisre_weights(r_m: f64, mask_deg: f64) -> SisreWeights {
    let re = EARTH_RADIUS_M;
    let el = mask_deg.to_radians();
    let lam_max = (re / r_m * el.cos()).acos() - el;
    let n = 20_000usize; // even
    let h = lam_max / n as f64;
    let (mut s_w, mut s_c2, mut s_s2) = (0.0, 0.0, 0.0);
    for k in 0..=n {
        let lam = k as f64 * h;
        let coef = if k == 0 || k == n {
            1.0
        } else if k % 2 == 1 {
            4.0
        } else {
            2.0
        };
        let rho = (re * re + r_m * r_m - 2.0 * re * r_m * lam.cos()).sqrt();
        let sin_eta = if rho > 0.0 { re * lam.sin() / rho } else { 0.0 };
        let wgt = lam.sin() * coef;
        s_w += wgt;
        s_c2 += wgt * (1.0 - sin_eta * sin_eta);
        s_s2 += wgt * sin_eta * sin_eta;
    }
    let max_nadir = (re * el.cos() / r_m).asin();
    SisreWeights {
        w_r: (s_c2 / s_w).sqrt(),
        w_ac2: 0.5 * s_s2 / s_w,
        max_nadir_deg: max_nadir.to_degrees(),
    }
}

/// Error statistics of one message (or a sequence) over an evaluation span.
#[derive(Clone, Debug, Default, PartialEq, Serialize, Deserialize)]
pub struct ErrorStats {
    /// Epochs evaluated.
    pub n: usize,
    /// Root-mean-square orbit-only SISRE (m).
    pub sisre_orb_rms_m: f64,
    /// Largest orbit-only SISRE (m).
    pub sisre_orb_max_m: f64,
    /// Root-mean-square SISRE including the clock (m).
    pub sisre_rms_m: f64,
    /// Largest SISRE including the clock (m).
    pub sisre_max_m: f64,
    /// Root-mean-square radial error (m).
    pub radial_rms_m: f64,
    /// Root-mean-square along-track error (m).
    pub along_rms_m: f64,
    /// Root-mean-square cross-track error (m).
    pub cross_rms_m: f64,
    /// Root-mean-square clock error times c (m).
    pub clock_rms_m: f64,
    /// Largest 3D position error (m).
    pub pos3d_max_m: f64,
}

/// Accumulator for [`ErrorStats`].
#[derive(Clone, Debug, Default)]
pub struct StatsAcc {
    n: usize,
    so2: f64,
    somax: f64,
    s2: f64,
    smax: f64,
    r2: f64,
    a2: f64,
    c2: f64,
    k2: f64,
    p3max: f64,
}

impl StatsAcc {
    /// Add one epoch: `rac` errors (m) and clock error times c (m).
    pub fn push(&mut self, w: &SisreWeights, rac: [f64; 3], clock_m: f64) {
        let (a, c, r) = (rac[0], rac[1], rac[2]);
        let orb = (w.w_r * w.w_r * r * r + w.w_ac2 * (a * a + c * c)).sqrt();
        let tot = ((w.w_r * r - clock_m).powi(2) + w.w_ac2 * (a * a + c * c)).sqrt();
        self.n += 1;
        self.so2 += orb * orb;
        self.somax = self.somax.max(orb);
        self.s2 += tot * tot;
        self.smax = self.smax.max(tot);
        self.r2 += r * r;
        self.a2 += a * a;
        self.c2 += c * c;
        self.k2 += clock_m * clock_m;
        self.p3max = self.p3max.max((a * a + c * c + r * r).sqrt());
    }

    /// Merge another accumulator.
    pub fn merge(&mut self, o: &StatsAcc) {
        self.n += o.n;
        self.so2 += o.so2;
        self.somax = self.somax.max(o.somax);
        self.s2 += o.s2;
        self.smax = self.smax.max(o.smax);
        self.r2 += o.r2;
        self.a2 += o.a2;
        self.c2 += o.c2;
        self.k2 += o.k2;
        self.p3max = self.p3max.max(o.p3max);
    }

    /// The statistics.
    pub fn finish(&self) -> ErrorStats {
        let n = self.n.max(1) as f64;
        ErrorStats {
            n: self.n,
            sisre_orb_rms_m: (self.so2 / n).sqrt(),
            sisre_orb_max_m: self.somax,
            sisre_rms_m: (self.s2 / n).sqrt(),
            sisre_max_m: self.smax,
            radial_rms_m: (self.r2 / n).sqrt(),
            along_rms_m: (self.a2 / n).sqrt(),
            cross_rms_m: (self.c2 / n).sqrt(),
            clock_rms_m: (self.k2 / n).sqrt(),
            pos3d_max_m: self.p3max,
        }
    }
}

/// Message minus truth at `t`: `[along, cross, radial]` in the true frame (m) and the
/// clock error times c (m). Without a truth clock the clock error is taken as zero
/// (orbit-only).
pub fn message_error(
    truth: &TruthOrbit,
    clock: Option<&TruthClock>,
    msg: &LeoNavMessage,
    t: &SysTime,
) -> ([f64; 3], f64) {
    let dt = truth.dt_of(t);
    let (pos, _, frame) = truth.state_ecef(dt);
    let s = sat_state(msg, t);
    let rac = frame.project(sub(s.pos, pos));
    let clk = match clock {
        Some(c) => (s.clock_s - c.apparent_s(truth, dt)) * C_LIGHT,
        None => 0.0,
    };
    (rac, clk)
}

/// Accumulate a message's errors over `[from, from + len]` at `step_s`.
#[allow(clippy::too_many_arguments)]
pub fn accumulate(
    acc: &mut StatsAcc,
    w: &SisreWeights,
    truth: &TruthOrbit,
    clock: Option<&TruthClock>,
    msg: &LeoNavMessage,
    from: &SysTime,
    len: f64,
    step_s: f64,
) {
    let n = (len / step_s).round().max(1.0) as usize;
    for k in 0..n {
        let t = from.plus(len * k as f64 / n as f64);
        let (rac, clk) = message_error(truth, clock, msg, &t);
        acc.push(w, rac, clk);
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    /// Montenbruck, Steigenberger & Hauschild (2018), Adv. Space Res. 61(12), the
    /// SISRE weighting-factor table: GPS 0.98 / 1/49, GLONASS 0.98 / 1/45, Galileo
    /// 0.98 / 1/61, BeiDou MEO 0.98 / 1/54, BeiDou IGSO and GEO 0.99 / 1/126.
    #[test]
    fn weights_reproduce_the_published_meo_and_geo_table() {
        let cases = [
            ("GPS", 26_560e3, 0.98, 49.0),
            ("GLONASS", 25_510e3, 0.98, 45.0),
            ("Galileo", 29_600e3, 0.98, 61.0),
            ("BeiDou MEO", 27_906e3, 0.98, 54.0),
            ("BeiDou GEO", 42_164e3, 0.99, 126.0),
        ];
        for (name, r, wr, inv) in cases {
            let w = sisre_weights(r, 0.0);
            assert!(
                (w.w_r - wr).abs() < 0.005,
                "{name}: w_R {:.4} vs published {wr}",
                w.w_r
            );
            let inv_calc = 1.0 / w.w_ac2;
            assert!(
                (inv_calc - inv).abs() < 0.5,
                "{name}: 1/w_AC^2 {inv_calc:.2} vs published {inv}"
            );
        }
    }

    #[test]
    fn leo_weights_shift_toward_the_transverse_axes() {
        let w500 = sisre_weights(EARTH_RADIUS_M + 510e3, 0.0);
        let w1300 = sisre_weights(EARTH_RADIUS_M + 1336e3, 0.0);
        assert!(w500.w_r < 0.5 && w500.w_r > 0.4, "{w500:?}");
        assert!(w1300.w_r > w500.w_r);
        assert!(w500.w_ac2 > w1300.w_ac2);
        // A higher mask sees the satellite closer to nadir: more radial weight.
        let w10 = sisre_weights(EARTH_RADIUS_M + 510e3, 10.0);
        assert!(w10.w_r > w500.w_r);
        // Nadir angle at the horizon from 510 km: asin(6378/6888) = 67.8 deg.
        assert!((w500.max_nadir_deg - 67.8).abs() < 0.1);
    }
}
