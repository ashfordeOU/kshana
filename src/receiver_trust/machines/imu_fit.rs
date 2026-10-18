// SPDX-License-Identifier: AGPL-3.0-only
//! Fit the inertial-sensor parameters of the hybrid and 17-state UKF scenarios from a
//! stationary IMU log.
//!
//! Those scenarios do not take a measured time series: they take noise parameters
//! ([`crate::inertial::AccelCfg`]: bias, velocity-random-walk PSD `q_va`, angle-random-walk PSD
//! `q_arw`, gyro bias, bias-instability floor). This module reads them off a log recorded with
//! the sensor held still, with the overlapping Allan deviation of the integrated signal
//! ([`crate::allan::overlapping_adev_curve`], the IEEE 952 / NIST SP 1065 estimator):
//!
//! * `bias` is the mean of the chosen accelerometer axis minus the mean specific force that
//!   axis should read at rest (`expected_mean`: 0 for a horizontal axis, about 9.80665 for the
//!   vertical one); `gyro_bias` is the mean of the z gyro.
//! * `q_va` is `(sigma(tau0) * sqrt(tau0))^2`, the white-noise coefficient read at the shortest
//!   averaging time, valid where the curve falls with slope -1/2, which is reported.
//!   `q_arw` is the same for the gyro.
//! * `bias_instability` is the minimum of the accelerometer Allan curve when the curve turns up
//!   again after it (a floor was reached); otherwise 0 and the report says the log was too short
//!   to see one. `q_aa` (acceleration random walk) is left 0: it needs a log far longer than
//!   the floor.
//!
//! A log that is not stationary, or too short, gives wrong parameters: the diagnostics (sample
//! rate, span, white-noise slope) are returned so the caller can see that. MODELLED: the fit is
//! the estimator applied to the log, with no external oracle.

use super::imu::ImuSample;
use crate::allan::overlapping_adev_curve;
use serde::Serialize;

/// Result of [`fit_accel_cfg`].
#[derive(Clone, Debug, Serialize, PartialEq)]
pub struct ImuFit {
    /// Samples used.
    pub samples: usize,
    /// Mean sample interval, s.
    pub dt_s: f64,
    /// Log span, s.
    pub span_s: f64,
    /// Fitted accelerometer bias, m/s^2.
    pub bias: f64,
    /// Velocity-random-walk PSD, (m/s^2)^2/Hz.
    pub q_va: f64,
    /// Gyro bias, rad/s.
    pub gyro_bias: f64,
    /// Angle-random-walk PSD, (rad/s)^2/Hz.
    pub q_arw: f64,
    /// Accelerometer bias-instability Allan floor, m/s^2 (0 when no floor was reached).
    pub bias_instability: f64,
    /// Slope of log(adev) against log(tau) over the first octaves of the accelerometer curve;
    /// about -0.5 where white noise dominates.
    pub accel_white_slope: Option<f64>,
    /// The same for the gyro.
    pub gyro_white_slope: Option<f64>,
    /// What the fit could not do or could not trust.
    pub notes: Vec<String>,
}

/// Sample count below which the Allan curve is too short to fit.
const MIN_SAMPLES: usize = 2000;

fn mean(v: impl Iterator<Item = f64>) -> f64 {
    let (s, n) = v.fold((0.0, 0usize), |(s, n), x| (s + x, n + 1));
    s / n.max(1) as f64
}

/// Allan curve of the integral of `x` sampled every `dt`.
fn curve(x: &[f64], dt: f64) -> Vec<(f64, f64)> {
    let mut phase = Vec::with_capacity(x.len() + 1);
    let mut acc = 0.0;
    phase.push(0.0);
    for v in x {
        acc += v * dt;
        phase.push(acc);
    }
    overlapping_adev_curve(&phase, dt)
        .into_iter()
        .map(|p| (p.tau_s, p.adev))
        .collect()
}

fn white_slope(c: &[(f64, f64)]) -> Option<f64> {
    let pts: Vec<_> = c.iter().take(4).filter(|p| p.1 > 0.0).collect();
    if pts.len() < 3 {
        return None;
    }
    let (x, y): (Vec<f64>, Vec<f64>) = pts.iter().map(|p| (p.0.ln(), p.1.ln())).unzip();
    let (mx, my) = (mean(x.iter().copied()), mean(y.iter().copied()));
    let num: f64 = x.iter().zip(&y).map(|(a, b)| (a - mx) * (b - my)).sum();
    let den: f64 = x.iter().map(|a| (a - mx) * (a - mx)).sum();
    (den > 0.0).then(|| num / den)
}

/// Fit [`crate::inertial::AccelCfg`] parameters from a stationary log. `axis` is 0, 1 or 2
/// (x, y, z) of the accelerometer; the z gyro is always used.
pub fn fit_accel_cfg(
    samples: &[ImuSample],
    axis: usize,
    expected_mean: f64,
) -> Result<ImuFit, String> {
    if axis > 2 {
        return Err("axis must be 0, 1 or 2 (x, y, z)".into());
    }
    if !expected_mean.is_finite() {
        return Err("expected_mean must be finite".into());
    }
    let n = samples.len();
    if n < MIN_SAMPLES {
        return Err(format!(
            "the log has {n} samples; at least {MIN_SAMPLES} are needed for an Allan fit"
        ));
    }
    let span = samples[n - 1].t_s - samples[0].t_s;
    let dt = span / (n - 1) as f64;
    if !(dt.is_finite() && dt > 0.0) {
        return Err("the log's time does not advance".into());
    }
    let uneven = samples
        .windows(2)
        .filter(|w| ((w[1].t_s - w[0].t_s) / dt - 1.0).abs() > 0.25)
        .count();
    if uneven * 20 > n {
        return Err(format!(
            "the sample interval is not uniform ({uneven} of {n} intervals differ by over 25 %): \
             resample the log first"
        ));
    }
    let a: Vec<f64> = samples.iter().map(|s| s.accel[axis]).collect();
    let g: Vec<f64> = samples.iter().map(|s| s.gyro[2]).collect();
    let ca = curve(&a, dt);
    let cg = curve(&g, dt);
    if ca.is_empty() || cg.is_empty() {
        return Err("the log is too short to form an Allan curve".into());
    }
    let mut notes = Vec::new();
    let n_a = ca[0].1 * ca[0].0.sqrt();
    let n_g = cg[0].1 * cg[0].0.sqrt();
    let (min_i, min_v) =
        ca.iter().enumerate().fold(
            (0, f64::INFINITY),
            |m, (i, p)| if p.1 < m.1 { (i, p.1) } else { m },
        );
    let bias_instability = if min_i > 0 && min_i + 1 < ca.len() {
        min_v
    } else {
        notes.push(
            "no bias-instability floor in the accelerometer curve (it falls to the longest \
             averaging time): a longer log is needed; bias_instability left 0"
                .to_string(),
        );
        0.0
    };
    notes.push("q_aa (acceleration random walk) is not fitted and stays 0".to_string());
    let (sa, sg) = (white_slope(&ca), white_slope(&cg));
    for (name, s) in [("accelerometer", sa), ("gyro", sg)] {
        match s {
            Some(v) if !(-0.8..=-0.2).contains(&v) => notes.push(format!(
                "the {name} curve's early slope is {v:.2}, not about -0.5: white noise does not \
                 dominate (is the sensor still?), so its noise coefficient is unreliable"
            )),
            None => notes.push(format!("the {name} curve is too short to check its slope")),
            _ => {}
        }
    }
    Ok(ImuFit {
        samples: n,
        dt_s: dt,
        span_s: span,
        bias: mean(a.iter().copied()) - expected_mean,
        q_va: n_a * n_a,
        gyro_bias: mean(g.iter().copied()),
        q_arw: n_g * n_g,
        bias_instability,
        accel_white_slope: sa,
        gyro_white_slope: sg,
        notes,
    })
}

impl ImuFit {
    /// The fit as an `[accel_classical]` table for a `hybrid` or `fusion` scenario, with the
    /// given sensor id and provenance text.
    pub fn to_toml(&self, table: &str, id: &str, provenance: &str) -> String {
        format!(
            "[{table}]\nid = {id:?}\nprovenance = {provenance:?}\nbias = {:e}\nq_va = {:e}\n\
             gyro_bias = {:e}\nq_arw = {:e}\nbias_instability = {:e}\n",
            self.bias, self.q_va, self.gyro_bias, self.q_arw, self.bias_instability
        )
    }
}

#[cfg(test)]
mod tests {
    use super::*;
    use rand::{Rng, SeedableRng};
    use rand_chacha::ChaCha8Rng;

    /// White noise generator (Box-Muller) so the test needs no distribution crate.
    fn gauss(r: &mut ChaCha8Rng) -> f64 {
        let (u, v): (f64, f64) = (r.gen_range(1e-12..1.0), r.gen_range(0.0..1.0));
        (-2.0 * u.ln()).sqrt() * (std::f64::consts::TAU * v).cos()
    }

    fn log(n: usize, dt: f64, na: f64, ng: f64, bias: f64, gbias: f64) -> Vec<ImuSample> {
        let mut r = ChaCha8Rng::seed_from_u64(7);
        // A white-noise coefficient N (units/sqrt(s)) sampled at dt has per-sample sigma N/sqrt(dt).
        (0..n)
            .map(|i| ImuSample {
                t_s: i as f64 * dt,
                gyro: [0.0, 0.0, gbias + ng / dt.sqrt() * gauss(&mut r)],
                accel: [bias + na / dt.sqrt() * gauss(&mut r), 0.0, 9.80665],
            })
            .collect()
    }

    #[test]
    fn recovers_a_known_white_noise_log() {
        let (na, ng) = (2.0e-3, 1.0e-4); // m/s/sqrt(s), rad/sqrt(s)
        let s = log(60_000, 0.01, na, ng, 0.02, 3e-4);
        let f = fit_accel_cfg(&s, 0, 0.0).unwrap();
        assert!((f.bias - 0.02).abs() < 1e-4, "{}", f.bias);
        assert!((f.gyro_bias - 3e-4).abs() < 1e-5);
        assert!(
            (f.q_va / (na * na) - 1.0).abs() < 0.1,
            "{}",
            f.q_va / (na * na)
        );
        assert!((f.q_arw / (ng * ng) - 1.0).abs() < 0.1);
        assert!((f.accel_white_slope.unwrap() + 0.5).abs() < 0.1);
        assert!(f
            .notes
            .iter()
            .any(|n| n.contains("no bias-instability floor")));
        // the vertical axis reads gravity at rest
        let z = fit_accel_cfg(&s, 2, 9.80665).unwrap();
        assert!(z.bias.abs() < 1e-9);
    }

    #[test]
    fn refuses_short_uneven_and_bad_axis() {
        let s = log(100, 0.01, 1e-3, 1e-4, 0.0, 0.0);
        assert!(fit_accel_cfg(&s, 0, 0.0).is_err());
        let mut s = log(3000, 0.01, 1e-3, 1e-4, 0.0, 0.0);
        assert!(fit_accel_cfg(&s, 3, 0.0).is_err());
        for (i, x) in s.iter_mut().enumerate() {
            if i % 3 == 0 {
                x.t_s += 0.006;
            }
        }
        assert!(fit_accel_cfg(&s, 0, 0.0)
            .unwrap_err()
            .contains("not uniform"));
    }

    #[test]
    fn toml_stanza_parses_as_an_accel_cfg() {
        let s = log(20_000, 0.01, 2e-3, 1e-4, 0.01, 1e-4);
        let f = fit_accel_cfg(&s, 0, 0.0).unwrap();
        let t = f.to_toml(
            "accel_classical",
            "my-imu",
            "fitted from imu.csv sha256 abc",
        );
        #[derive(serde::Deserialize)]
        struct W {
            accel_classical: crate::inertial::AccelCfg,
        }
        let w: W = toml::from_str(&t).unwrap();
        assert_eq!(w.accel_classical.id, "my-imu");
        assert!((w.accel_classical.q_va - f.q_va).abs() <= f.q_va * 1e-12);
    }
}
