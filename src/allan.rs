// SPDX-License-Identifier: Apache-2.0
use crate::types::Seconds;
use serde::Serialize;

/// Overlapping Allan deviation from phase samples `phase` (seconds), spaced
/// `tau0` seconds, at averaging factor `m` (so tau = m * tau0). Returns the
/// Allan deviation (dimensionless fractional frequency).
///
/// Riley, NIST SP 1065:
///   sigma_y^2(tau) = 1 / (2 (N-2m) tau^2) * sum_i (x_{i+2m} - 2 x_{i+m} + x_i)^2
pub fn overlapping_adev(phase: &[f64], tau0: Seconds, m: usize) -> f64 {
    let n = phase.len();
    assert!(m >= 1, "m must be >= 1");
    assert!(n > 2 * m, "need more than 2m phase samples");
    let tau = m as f64 * tau0;
    let count = n - 2 * m;
    let mut sumsq = 0.0;
    for i in 0..count {
        let d = phase[i + 2 * m] - 2.0 * phase[i + m] + phase[i];
        sumsq += d * d;
    }
    (sumsq / (2.0 * count as f64 * tau * tau)).sqrt()
}

/// One point on an Allan-deviation curve: the averaging time `tau`, the
/// overlapping ADEV at that tau, and the number of overlapping differences that
/// went into it (a confidence proxy — fewer samples at long tau).
#[derive(Clone, Copy, Debug, Serialize, PartialEq)]
pub struct AdevPoint {
    pub tau_s: f64,
    pub adev: f64,
    pub n_samples: usize,
}

/// Overlapping ADEV across octave-spaced averaging factors (m = 1, 2, 4, ...),
/// from phase samples spaced `tau0` seconds. The largest tau is capped so each
/// point still averages a useful number of overlapping differences
/// (`n - 2m >= MIN_OVERLAPS`), which keeps the long-tau tail from being a single
/// noisy estimate. Returns an empty vector if there are too few samples.
pub fn overlapping_adev_curve(phase: &[f64], tau0: Seconds) -> Vec<AdevPoint> {
    const MIN_OVERLAPS: usize = 8;
    let n = phase.len();
    let mut out = Vec::new();
    let mut m = 1usize;
    while n > 2 * m && (n - 2 * m) >= MIN_OVERLAPS {
        out.push(AdevPoint {
            tau_s: m as f64 * tau0,
            adev: overlapping_adev(phase, tau0, m),
            n_samples: n - 2 * m,
        });
        m *= 2;
    }
    out
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn linear_phase_has_zero_adev() {
        // Constant frequency => second differences are zero => ADEV = 0.
        let phase = [0.0, 2.0, 4.0, 6.0, 8.0];
        assert_eq!(overlapping_adev(&phase, 1.0, 1), 0.0);
    }

    #[test]
    fn hand_derived_adev() {
        // phase = [0,1,3,6], tau0=1, m=1, N=4:
        // second diffs: (3-2+0)=1, (6-6+1)=1 -> sumsq=2
        // sigma^2 = 1/(2*(4-2)*1^2)*2 = 0.5 -> ADEV = sqrt(0.5) = 1/sqrt(2)
        let phase = [0.0, 1.0, 3.0, 6.0];
        let adev = overlapping_adev(&phase, 1.0, 1);
        assert!(
            (adev - std::f64::consts::FRAC_1_SQRT_2).abs() < 1e-12,
            "adev={adev}"
        );
    }

    #[test]
    fn linear_frequency_drift_adev_is_exact() {
        // Deterministic signal: a linear fractional-frequency drift y(t) = a*t gives a
        // quadratic phase x(t) = 0.5*a*t^2. Its Allan deviation is exactly a*tau/sqrt(2)
        // (Riley, NIST SP 1065) at every averaging time — a closed-form check on the
        // estimator that does not depend on any noise realisation.
        let a = 3.0e-12; // fractional frequency drift per second
        let tau0 = 1.0;
        let n = 4096;
        let phase: Vec<f64> = (0..n)
            .map(|i| {
                let t = i as f64 * tau0;
                0.5 * a * t * t
            })
            .collect();
        for &m in &[1usize, 2, 4, 16, 64, 256] {
            let tau = m as f64 * tau0;
            let expect = a * tau / std::f64::consts::SQRT_2;
            let got = overlapping_adev(&phase, tau0, m);
            assert!(
                (got - expect).abs() / expect < 1e-9,
                "m={m}: adev={got} vs exact {expect}"
            );
        }
    }

    #[test]
    fn adev_curve_is_octave_spaced_with_decreasing_overlaps() {
        // The curve walks m = 1, 2, 4, ... so tau doubles each point, and the overlap
        // count strictly decreases; for a linear-drift phase the ADEV rises as tau
        // (slope +1 in log-log: doubling tau doubles the deviation).
        let a = 1.0e-12;
        let phase: Vec<f64> = (0..1000)
            .map(|i| {
                let t = i as f64;
                0.5 * a * t * t
            })
            .collect();
        let curve = overlapping_adev_curve(&phase, 1.0);
        assert!(curve.len() >= 5, "curve too short: {}", curve.len());
        for w in curve.windows(2) {
            assert!(
                (w[1].tau_s / w[0].tau_s - 2.0).abs() < 1e-9,
                "tau not octave-spaced"
            );
            assert!(
                w[1].n_samples < w[0].n_samples,
                "overlap count should decrease"
            );
            // ADEV ~ a*tau/sqrt2, so doubling tau doubles ADEV.
            assert!(
                (w[1].adev / w[0].adev - 2.0).abs() < 1e-6,
                "drift ADEV slope != +1"
            );
        }
        // Every reported tau keeps at least the minimum overlap count.
        assert!(curve.iter().all(|p| p.n_samples >= 8));
    }
}
