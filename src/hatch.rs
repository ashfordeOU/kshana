// SPDX-License-Identifier: AGPL-3.0-only
//! Hatch carrier smoothing of code pseudoranges.
//!
//! The Hatch filter (Hatch, "The synergism of GPS code and carrier measurements", Proc. 3rd
//! International Geodetic Symposium on Satellite Doppler Positioning, 1982) averages the noisy
//! code over a window while carrying it forward with the precise carrier change:
//!
//! `P̄(k) = P(k)/n + (n − 1)/n · [P̄(k − 1) + L(k) − L(k − 1)]`,  `n = min(k, N)`
//!
//! with the code `P` and carrier `L` in metres and the window length `N` in epochs. The filter
//! restarts on a cycle slip or a data gap. On one frequency the ionosphere moves code and
//! carrier in opposite directions, so the smoothed code drifts by twice the ionospheric change
//! over the window ("code-carrier divergence"); fed with the ionosphere-free code and carrier
//! combinations (the divergence-free form used here for dual-frequency data), the two share
//! the same ionosphere-free geometry and there is no divergence (RTCA DO-229 discusses both;
//! RTKLIB `csmooth` is the single-frequency form).
//!
//! The filter is pure measurement processing and changes nothing else; [`HatchFilter`] keeps
//! one state per satellite.

use std::collections::HashMap;

/// Per-satellite Hatch filter state: the smoothed code, the last carrier and the count.
#[derive(Clone, Copy, Debug)]
struct State {
    smoothed: f64,
    last_phase: f64,
    last_t: f64,
    n: usize,
}

/// A bank of Hatch filters, one per satellite.
#[derive(Clone, Debug)]
pub struct HatchFilter {
    window: usize,
    max_gap_s: f64,
    state: HashMap<String, State>,
}

impl HatchFilter {
    /// A filter bank with window `window` epochs (at least 1) that restarts a satellite after a
    /// gap longer than `max_gap_s`.
    pub fn new(window: usize, max_gap_s: f64) -> Self {
        Self {
            window: window.max(1),
            max_gap_s,
            state: HashMap::new(),
        }
    }

    /// Feed one epoch of satellite `sat` at time `t` (s): code and carrier in metres, `slip`
    /// true when a cycle slip was detected on the carrier. Returns the smoothed code (m) and the
    /// number of epochs it averages.
    pub fn update(
        &mut self,
        sat: &str,
        t: f64,
        code_m: f64,
        phase_m: f64,
        slip: bool,
    ) -> (f64, usize) {
        let restart = match self.state.get(sat) {
            None => true,
            Some(s) => slip || t - s.last_t > self.max_gap_s || t <= s.last_t,
        };
        let st = if restart {
            State {
                smoothed: code_m,
                last_phase: phase_m,
                last_t: t,
                n: 1,
            }
        } else {
            let s = self.state[sat];
            let n = (s.n + 1).min(self.window);
            let nf = n as f64;
            let predicted = s.smoothed + (phase_m - s.last_phase);
            State {
                smoothed: code_m / nf + (nf - 1.0) / nf * predicted,
                last_phase: phase_m,
                last_t: t,
                n: s.n + 1,
            }
        };
        self.state.insert(sat.to_string(), st);
        (st.smoothed, st.n.min(self.window))
    }

    /// Forget every satellite.
    pub fn reset(&mut self) {
        self.state.clear();
    }
}

#[cfg(test)]
mod tests {
    use super::*;
    use crate::portable_math::PortableFloat;

    #[test]
    fn noise_free_code_and_carrier_pass_through_unchanged() {
        let mut f = HatchFilter::new(100, 60.0);
        for k in 0..300 {
            let rho = 2.0e7 + 700.0 * k as f64;
            let (s, _) = f.update("G01", 30.0 * k as f64, rho, rho + 12.345, false);
            assert!((s - rho).abs() < 1e-6, "{k}: {}", s - rho);
        }
    }

    #[test]
    fn white_code_noise_is_reduced_by_the_square_root_of_the_window() {
        // Deterministic pseudo-random code noise of unit variance (a linear congruential
        // generator through Box-Muller), constant carrier geometry.
        let mut seed: u64 = 12345;
        let mut uniform = || {
            seed = seed
                .wrapping_mul(6364136223846793005)
                .wrapping_add(1442695040888963407);
            ((seed >> 11) as f64 + 0.5) / (1u64 << 53) as f64
        };
        let mut f = HatchFilter::new(100, 60.0);
        let mut sq = 0.0;
        let mut n = 0.0;
        for k in 0..20_000 {
            let (u1, u2) = (uniform(), uniform());
            let noise = (-2.0 * u1.pln()).sqrt() * (std::f64::consts::TAU * u2).pcos();
            let (s, used) = f.update("G01", k as f64, 100.0 + noise, 0.0, false);
            if used == 100 && k > 1000 {
                sq += (s - 100.0) * (s - 100.0);
                n += 1.0;
            }
        }
        // The steady-state variance of the recursive form is 1/(2N − 1).
        let var = sq / n;
        let expect = 1.0 / 199.0;
        assert!((var / expect - 1.0).abs() < 0.15, "{var} vs {expect}");
    }

    #[test]
    fn a_slip_or_a_gap_restarts_the_filter() {
        let mut f = HatchFilter::new(10, 60.0);
        f.update("G01", 0.0, 10.0, 0.0, false);
        assert_eq!(f.update("G01", 30.0, 11.0, 0.0, false).1, 2);
        assert_eq!(f.update("G01", 60.0, 12.0, 5.0, true), (12.0, 1));
        assert_eq!(f.update("G01", 200.0, 13.0, 5.0, false), (13.0, 1));
        assert_eq!(f.update("G02", 200.0, 1.0, 0.0, false), (1.0, 1));
    }
}
