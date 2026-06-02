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

    // ---------------------------------------------------------------------
    // Independent validation
    //
    // The tests below check the estimator against (a) a second, independently
    // coded estimator (the classic *non-overlapping* Allan deviation), (b) the
    // closed-form power-law slopes of canonical clock noise types, and (c)
    // algebraic invariances the statistic must satisfy. None of them reuse the
    // production estimator as their own reference.
    // ---------------------------------------------------------------------

    use rand::SeedableRng;
    use rand_chacha::ChaCha8Rng;
    use rand_distr::{Distribution, Normal};

    /// Classic *non-overlapping* Allan deviation, coded independently of
    /// `overlapping_adev`: average the fractional frequency over disjoint blocks
    /// of `m` samples, then take the variance of successive differences.
    ///
    ///   ybar_k = (x_{(k+1)m} - x_{km}) / (m*tau0)
    ///   sigma_y^2(tau) = 1/(2(K-1)) * sum_k (ybar_{k+1} - ybar_k)^2,  K = floor(N/m)-1
    fn nonoverlapping_adev(phase: &[f64], tau0: f64, m: usize) -> f64 {
        let tau = m as f64 * tau0;
        let blocks = phase.len() / m; // number of disjoint frequency averages available
        assert!(blocks >= 3, "need at least 3 frequency blocks");
        let ybar: Vec<f64> = (0..blocks)
            .map(|k| (phase[(k + 1) * m] - phase[k * m]) / tau)
            .take(blocks - 1) // last index (k+1)*m must be in range
            .collect();
        let mut sumsq = 0.0;
        for w in ybar.windows(2) {
            let d = w[1] - w[0];
            sumsq += d * d;
        }
        (sumsq / (2.0 * (ybar.len() - 1) as f64)).sqrt()
    }

    /// Phase samples (s) from iid white *frequency* noise: each 1-s sample has a
    /// fractional frequency drawn N(0, sigma0), integrated to phase. White FM by
    /// construction, so sigma_y(tau) = sigma0 / sqrt(tau) exactly in expectation.
    fn white_fm_phase(sigma0: f64, n: usize, seed: u64) -> Vec<f64> {
        let mut rng = ChaCha8Rng::seed_from_u64(seed);
        let dist = Normal::new(0.0, sigma0).unwrap();
        let mut x = 0.0;
        let mut phase = Vec::with_capacity(n);
        phase.push(0.0);
        for _ in 1..n {
            let y = dist.sample(&mut rng); // fractional frequency over this 1-s step
            x += y; // tau0 = 1 s, so phase increment = y * 1 s
            phase.push(x);
        }
        phase
    }

    /// Best-fit slope of log10(adev) vs log10(tau) over a curve, by ordinary
    /// least squares — the log-log slope that identifies the dominant noise type.
    fn loglog_slope(curve: &[AdevPoint]) -> f64 {
        let n = curve.len() as f64;
        let xs: Vec<f64> = curve.iter().map(|p| p.tau_s.log10()).collect();
        let ys: Vec<f64> = curve.iter().map(|p| p.adev.log10()).collect();
        let sx: f64 = xs.iter().sum();
        let sy: f64 = ys.iter().sum();
        let sxx: f64 = xs.iter().map(|x| x * x).sum();
        let sxy: f64 = xs.iter().zip(&ys).map(|(x, y)| x * y).sum();
        (n * sxy - sx * sy) / (n * sxx - sx * sx)
    }

    #[test]
    fn overlapping_matches_nonoverlapping_estimator_on_drift() {
        // On a deterministic quadratic phase (linear frequency drift) BOTH
        // estimators must return the exact closed form a*tau/sqrt(2). Agreement
        // between two independently coded estimators is a strong correctness check
        // that does not lean on any single implementation.
        let a = 2.5e-12;
        let tau0 = 1.0;
        let n = 4096;
        let phase: Vec<f64> = (0..n)
            .map(|i| {
                let t = i as f64 * tau0;
                0.5 * a * t * t
            })
            .collect();
        for &m in &[1usize, 2, 8, 64] {
            let ov = overlapping_adev(&phase, tau0, m);
            let nov = nonoverlapping_adev(&phase, tau0, m);
            let exact = a * (m as f64 * tau0) / std::f64::consts::SQRT_2;
            assert!(
                (ov - exact).abs() / exact < 1e-9,
                "m={m}: overlapping {ov} vs exact {exact}"
            );
            assert!(
                (nov - exact).abs() / exact < 1e-9,
                "m={m}: non-overlapping {nov} vs exact {exact}"
            );
        }
    }

    #[test]
    fn white_fm_magnitude_matches_sigma0_over_sqrt_tau() {
        // White FM: sigma_y(tau) = sigma0 / sqrt(tau). Seed-average the variance
        // to cut the estimator's own scatter, then compare to the closed form.
        let sigma0 = 4.0e-12;
        let n = 16384;
        for &m in &[1usize, 4, 16, 64] {
            let mut var_sum = 0.0;
            let seeds = [11u64, 22, 33, 44, 55, 66, 77, 88];
            for &s in &seeds {
                let phase = white_fm_phase(sigma0, n, s);
                let a = overlapping_adev(&phase, 1.0, m);
                var_sum += a * a;
            }
            let adev = (var_sum / seeds.len() as f64).sqrt();
            let expect = sigma0 / (m as f64).sqrt();
            let rel = (adev - expect).abs() / expect;
            assert!(
                rel < 0.1,
                "m={m}: white-FM adev={adev} vs {expect}, rel={rel}"
            );
        }
    }

    #[test]
    fn white_fm_loglog_slope_is_minus_half() {
        // White FM has ADEV ~ tau^(-1/2): a log-log slope of -0.5.
        let phase = white_fm_phase(3.0e-12, 1 << 15, 12345);
        let curve = overlapping_adev_curve(&phase, 1.0);
        let slope = loglog_slope(&curve);
        assert!(
            (slope + 0.5).abs() < 0.07,
            "white-FM log-log slope = {slope}, want -0.5"
        );
    }

    #[test]
    fn random_walk_fm_loglog_slope_is_plus_half() {
        // Random-walk FM (integrate white FM once more) has ADEV ~ tau^(+1/2):
        // a log-log slope of +0.5.
        let mut rng = ChaCha8Rng::seed_from_u64(99);
        let dist = Normal::new(0.0, 1.0e-13).unwrap();
        let n = 1 << 15;
        let mut y = 0.0; // random-walk frequency
        let mut x = 0.0;
        let mut phase = Vec::with_capacity(n);
        phase.push(0.0);
        for _ in 1..n {
            y += dist.sample(&mut rng); // frequency does a random walk
            x += y;
            phase.push(x);
        }
        let curve = overlapping_adev_curve(&phase, 1.0);
        let slope = loglog_slope(&curve);
        assert!(
            (slope - 0.5).abs() < 0.1,
            "RW-FM log-log slope = {slope}, want +0.5"
        );
    }

    #[test]
    fn adev_is_scale_linear() {
        // Scaling the phase record by k scales the ADEV by k (it is a linear
        // functional of the second differences).
        let phase = white_fm_phase(1.0e-12, 4096, 7);
        let scaled: Vec<f64> = phase.iter().map(|x| 3.0 * x).collect();
        for &m in &[1usize, 3, 9] {
            let base = overlapping_adev(&phase, 1.0, m);
            let big = overlapping_adev(&scaled, 1.0, m);
            assert!(
                (big - 3.0 * base).abs() / (3.0 * base) < 1e-12,
                "scale linearity broke at m={m}"
            );
        }
    }

    #[test]
    fn adev_ignores_constant_offset_and_frequency_offset() {
        // The second difference x_{i+2m} - 2 x_{i+m} + x_i annihilates any
        // constant phase offset and any constant frequency (linear phase) term,
        // so adding c0 + c1*t to the record must not change the ADEV.
        let phase = white_fm_phase(2.0e-12, 4096, 21);
        // Offsets of the same order as the phase record itself: a larger c0 (e.g.
        // a 5-second constant on picosecond data) would cancel exactly in real
        // arithmetic but f64 cannot represent x + c0 without losing the small term.
        let c0 = 1.0e-9;
        let c1 = 1.0e-12;
        let shifted: Vec<f64> = phase
            .iter()
            .enumerate()
            .map(|(i, x)| x + c0 + c1 * i as f64)
            .collect();
        for &m in &[1usize, 2, 7, 31] {
            let base = overlapping_adev(&phase, 1.0, m);
            let got = overlapping_adev(&shifted, 1.0, m);
            assert!(
                (got - base).abs() / base < 1e-9,
                "offset/frequency invariance broke at m={m}"
            );
        }
    }

    #[test]
    fn curve_overlap_count_is_n_minus_2m_and_taus_are_octaves() {
        // The reported confidence proxy must be exactly N-2m, and the averaging
        // times must be the octave grid tau = m*tau0 with m = 1,2,4,...
        let phase = white_fm_phase(1.0e-12, 5000, 3);
        let tau0 = 0.5;
        let curve = overlapping_adev_curve(&phase, tau0);
        let mut m = 1usize;
        for p in &curve {
            assert_eq!(
                p.n_samples,
                phase.len() - 2 * m,
                "overlap count wrong at m={m}"
            );
            assert!(
                (p.tau_s - m as f64 * tau0).abs() < 1e-12,
                "tau off the octave grid at m={m}"
            );
            m *= 2;
        }
    }

    #[test]
    fn curve_is_empty_for_too_few_samples() {
        // With MIN_OVERLAPS = 8, a 9-sample record yields exactly one usable
        // point (m=1: 9-2=7 < 8 fails) so the curve is empty; an 8-sample record
        // is empty too. Guards against a panic / spurious point on short records.
        assert!(overlapping_adev_curve(&[0.0; 8], 1.0).is_empty());
        assert!(overlapping_adev_curve(&[0.0; 9], 1.0).is_empty());
        assert!(!overlapping_adev_curve(&[0.0; 10], 1.0).is_empty());
    }

    #[test]
    fn curve_is_deterministic_for_identical_input() {
        // Same phase record in, byte-identical curve out (no hidden global state).
        let phase = white_fm_phase(1.0e-12, 4096, 555);
        let a = overlapping_adev_curve(&phase, 1.0);
        let b = overlapping_adev_curve(&phase, 1.0);
        assert_eq!(a, b);
    }
}
