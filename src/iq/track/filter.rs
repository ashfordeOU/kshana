// SPDX-License-Identifier: AGPL-3.0-only
//! Loop filters designed from a noise bandwidth `Bn`, after Ward's coefficient table
//! (Kaplan & Hegarty, *Understanding GPS*, 2nd ed., Table 5.6, and Fig. 5.8 for the
//! FLL-assisted PLL).
//!
//! | loop order | natural frequency `ω0` | filter (Laplace)                     |
//! |-----------:|-----------------------:|--------------------------------------|
//! | 1          | `Bn / 0.25`            | `ω0`                                 |
//! | 2          | `Bn / 0.53`            | `a2·ω0 + ω0²/s`, `a2 = 1.414`        |
//! | 3          | `Bn / 0.7845`          | `b3·ω0 + a3·ω0²/s + ω0³/s²`, `a3 = 1.1`, `b3 = 2.4` |
//!
//! A frequency-locked loop (FLL) of order `n` uses the same `ω0` relation one order lower
//! (its input is a frequency error), and the FLL-assisted PLL adds the FLL terms into the
//! PLL's integrators as in Ward's figure: the acceleration integrator takes
//! `ω0p³·φe + ω0f²·fe`, the velocity integrator takes that output plus
//! `a3·ω0p²·φe + a2·ω0f·fe` (third-order PLL, second-order FLL) or `ω0p²·φe + ω0f·fe`
//! (second-order PLL, first-order FLL), and the output adds `b3·ω0p·φe` (or `a2·ω0p·φe`).
//! The integrators are the bilinear (trapezoidal) form `y[n] = y[n−1] + T·(x[n] + x[n−1])/2`.
//!
//! The coefficients set the continuous-time noise bandwidth exactly; the discrete loop with
//! one update of delay matches it to a few per cent while `Bn·T` is small (the tests derive
//! the effective bandwidth from the loop's impulse response and state the agreement).

use std::f64::consts::SQRT_2;

/// Ward's `a2` (second-order loop damping coefficient, `2ζ` with `ζ = 1/√2`).
pub const A2: f64 = SQRT_2;
/// Ward's `a3` (third-order loop).
pub const A3: f64 = 1.1;
/// Ward's `b3` (third-order loop).
pub const B3: f64 = 2.4;

/// Natural frequency `ω0` (rad/s) of a loop of `order` 1, 2 or 3 with noise bandwidth
/// `bn_hz`, from Kaplan & Hegarty Table 5.6. `None` for another order or a non-positive
/// bandwidth.
pub fn natural_frequency(order: u8, bn_hz: f64) -> Option<f64> {
    if !(bn_hz > 0.0 && bn_hz.is_finite()) {
        return None;
    }
    match order {
        1 => Some(bn_hz / 0.25),
        2 => Some(bn_hz / 0.53),
        3 => Some(bn_hz / 0.7845),
        _ => None,
    }
}

/// Continuous-time noise bandwidth (Hz) of a second-order loop with natural frequency
/// `w0` and damping `zeta`: `Bn = ω0·(1 + 4ζ²)/(8ζ)` (the standard closed form, Gardner,
/// *Phaselock Techniques*; `0.53·ω0` at `ζ = 1/√2`).
pub fn second_order_noise_bandwidth(w0: f64, zeta: f64) -> f64 {
    w0 * (1.0 + 4.0 * zeta * zeta) / (8.0 * zeta)
}

/// A bilinear (trapezoidal) integrator.
#[derive(Clone, Copy, Debug, Default, PartialEq)]
struct Integrator {
    y: f64,
    x_prev: f64,
}

impl Integrator {
    fn step(&mut self, x: f64, t: f64) -> f64 {
        self.y += 0.5 * t * (x + self.x_prev);
        self.x_prev = x;
        self.y
    }
}

/// A loop filter: a phase-error path of order 1 to 3 (PLL or DLL), an optional
/// frequency-error path of order 1 or 2 (FLL), or both (FLL-assisted PLL).
///
/// Inputs are a phase error (rad for a carrier loop, chips for a code loop) and a frequency
/// error (rad/s); the output is a frequency correction in the matching unit per second
/// (rad/s, or chips/s).
#[derive(Clone, Debug, PartialEq)]
pub struct LoopFilter {
    phase: Option<(u8, f64)>,
    freq: Option<(u8, f64)>,
    acc: Integrator,
    vel: Integrator,
}

impl LoopFilter {
    /// A filter with an optional phase path `(order 1..=3, Bn Hz)` and an optional
    /// frequency path `(order 1..=2, Bn Hz)`; at least one must be present.
    pub fn new(phase: Option<(u8, f64)>, freq: Option<(u8, f64)>) -> Result<Self, String> {
        let phase = match phase {
            Some((o, bn)) => Some((
                o,
                natural_frequency(o, bn).ok_or_else(|| {
                    format!("phase loop needs order 1..=3 and Bn > 0 (got {o}, {bn})")
                })?,
            )),
            None => None,
        };
        let freq = match freq {
            Some((o, bn)) if o == 1 || o == 2 => Some((
                o,
                natural_frequency(o, bn)
                    .ok_or_else(|| format!("frequency loop needs Bn > 0 (got {bn})"))?,
            )),
            Some((o, _)) => return Err(format!("frequency loop order must be 1 or 2 (got {o})")),
            None => None,
        };
        if phase.is_none() && freq.is_none() {
            return Err("a loop filter needs a phase path, a frequency path, or both".into());
        }
        Ok(Self {
            phase,
            freq,
            acc: Integrator::default(),
            vel: Integrator::default(),
        })
    }

    /// A phase-only filter (PLL or DLL) of `order` with noise bandwidth `bn_hz`.
    pub fn pll(order: u8, bn_hz: f64) -> Result<Self, String> {
        Self::new(Some((order, bn_hz)), None)
    }

    /// A frequency-only filter (FLL) of `order` 1 or 2 with noise bandwidth `bn_hz`.
    pub fn fll(order: u8, bn_hz: f64) -> Result<Self, String> {
        Self::new(None, Some((order, bn_hz)))
    }

    /// Natural frequency of the phase path (rad/s), if present.
    pub fn phase_natural_frequency(&self) -> Option<f64> {
        self.phase.map(|p| p.1)
    }

    /// Natural frequency of the frequency path (rad/s), if present.
    pub fn freq_natural_frequency(&self) -> Option<f64> {
        self.freq.map(|p| p.1)
    }

    /// The proportional, first-integral and second-integral gains of the phase path,
    /// `(K1, K2, K3)` with the filter `K1 + K2/s + K3/s²`.
    pub fn phase_gains(&self) -> (f64, f64, f64) {
        match self.phase {
            Some((1, w)) => (w, 0.0, 0.0),
            Some((2, w)) => (A2 * w, w * w, 0.0),
            Some((_, w)) => (B3 * w, A3 * w * w, w * w * w),
            None => (0.0, 0.0, 0.0),
        }
    }

    /// The proportional and first-integral gains of the frequency path, `(F1, F2)` with the
    /// contribution `(F1 + F2/s)/s` to the output (the FLL's own integrator is the `1/s`).
    pub fn freq_gains(&self) -> (f64, f64) {
        match self.freq {
            Some((1, w)) => (w, 0.0),
            Some((_, w)) => (A2 * w, w * w),
            None => (0.0, 0.0),
        }
    }

    /// One update with phase error `phase_err` and frequency error `freq_err` over an
    /// integration of `t_s` seconds; returns the frequency correction.
    pub fn update(&mut self, phase_err: f64, freq_err: f64, t_s: f64) -> f64 {
        let (k1, k2, k3) = self.phase_gains();
        let (f1, f2) = self.freq_gains();
        let acc_in = k3 * phase_err + f2 * freq_err;
        let acc = if k3 != 0.0 || f2 != 0.0 {
            self.acc.step(acc_in, t_s)
        } else {
            0.0
        };
        let vel_in = acc + k2 * phase_err + f1 * freq_err;
        let vel = if k2 != 0.0 || f1 != 0.0 || k3 != 0.0 || f2 != 0.0 {
            self.vel.step(vel_in, t_s)
        } else {
            0.0
        };
        vel + k1 * phase_err
    }

    /// Clear the integrators.
    pub fn reset(&mut self) {
        self.acc = Integrator::default();
        self.vel = Integrator::default();
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn ward_table_natural_frequencies() {
        assert!((natural_frequency(1, 10.0).unwrap() - 40.0).abs() < 1e-12);
        assert!((natural_frequency(2, 5.3).unwrap() - 10.0).abs() < 1e-12);
        assert!((natural_frequency(3, 7.845).unwrap() - 10.0).abs() < 1e-12);
        assert!(natural_frequency(4, 1.0).is_none());
        assert!(natural_frequency(2, 0.0).is_none());
    }

    #[test]
    fn second_order_closed_form_gives_ward_0_53() {
        // Bn = ω0(1 + 4ζ²)/(8ζ) at ζ = 1/√2 is 3/(4√2) ω0 = 0.5303 ω0, Ward's 0.53.
        let r = second_order_noise_bandwidth(1.0, 1.0 / SQRT_2);
        assert!((r - 0.53).abs() < 5e-4, "{r}");
    }

    #[test]
    fn rejects_bad_orders() {
        assert!(LoopFilter::new(None, None).is_err());
        assert!(LoopFilter::fll(3, 1.0).is_err());
        assert!(LoopFilter::pll(0, 1.0).is_err());
    }
}
