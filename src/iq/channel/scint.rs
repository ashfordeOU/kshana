// SPDX-License-Identifier: AGPL-3.0-only
//! **Ionospheric scintillation: the Cornell scintillation model.** MODELLED.
//!
//! Reference: T. E. Humphreys, M. L. Psiaki, J. C. Hinks, B. O'Hanlon, P. M. Kintner,
//! "Simulating ionosphere-induced scintillation for testing GPS receiver phase tracking
//! loops", *IEEE J. Sel. Topics Signal Process.* 3(4), 2009; and Humphreys et al.,
//! "Modeling the effects of ionospheric scintillation on GPS carrier phase tracking",
//! *IEEE Trans. Aerosp. Electron. Syst.* 46(4), 2010.
//!
//! The model multiplies the signal by a complex scintillation factor
//! `z(t) = ẑ + ξ(t)`, where `ẑ` is a constant line-of-sight component and `ξ(t)` a
//! zero-mean complex Gaussian process made by passing white noise through a second-order
//! Butterworth low-pass filter (independently on the in-phase and quadrature parts). `|z|`
//! is then Rice distributed. With `E|z|² = 1` and diffuse power `P = E|ξ|²`, the intensity
//! `I = |z|²` has `S4² = Var(I)/E[I]² = P(2 − P)`, so
//!
//! ```text
//!   P = 1 − √(1 − S4²),   ẑ = √(1 − P)        (0 ≤ S4 ≤ 1)
//! ```
//!
//! which is the model's Rice factor `K = ẑ²/P = √(1−S4²)/(1−√(1−S4²))`.
//!
//! **Decorrelation time.** Here `τ0` is stated as the lag at which the normalised
//! autocorrelation of the diffuse component `ξ` (equivalently of `z − ẑ`) falls to `1/e`.
//! For the Butterworth filter `H(s) = ωn²/(s² + √2·ωn·s + ωn²)` that autocorrelation is
//! `e^{−x}(cos x + sin x)` with `x = ωn·τ/√2`, which equals `1/e` at
//! `x = 1.2396464368…` ([`BUTTERWORTH_1_OVER_E_X`]), so `ωn = 1.2396464·√2/τ0`.
//!
//! **Sampling.** The filter state is propagated with the *exact* discretisation of the
//! continuous filter over whatever interval separates two updates, so the statistics do
//! not depend on the update rate.
//!
//! **Phase.** In the Cornell model the phase scintillation is `arg z`, tied to S4. An
//! optional extra phase term, a separate Butterworth-filtered real Gaussian with the same
//! `τ0` and standard deviation [`ScintParams::extra_phase_sigma_rad`], adds phase
//! scintillation beyond what the Rice model gives (an extension, not part of the Cornell
//! model; 0 by default). The total phase standard deviation is reported by
//! [`Scintillation::series`] runs, not asserted in closed form.
//!
//! **Frequency.** Parameters apply to the carrier the chain is evaluated on; set S4 and
//! `τ0` per carrier for multi-frequency scenes (the model does not scale them).
//!
//! Determinism: each satellite has its own ChaCha8 stream seeded from the model seed and the
//! satellite number, so the same seed gives bit-identical output whatever order satellites
//! are queried in.

use super::{sat_seed, ChannelEffect, LineOfSight};
use crate::iq::ChannelSnapshot;
use rand::{Rng, SeedableRng};
use rand_chacha::ChaCha8Rng;
use rand_distr::StandardNormal;
use std::collections::BTreeMap;
use std::f64::consts::SQRT_2;

/// The root of `e^{−x}(cos x + sin x) = 1/e`: the second-order Butterworth filter's
/// autocorrelation reaches `1/e` at `ωn·τ/√2` equal to this value.
pub const BUTTERWORTH_1_OVER_E_X: f64 = 1.239_646_436_810_474;

const SALT: u64 = 0x5C17_0000;

/// Parameters of the Cornell scintillation model.
#[derive(Clone, Copy, Debug, PartialEq)]
pub struct ScintParams {
    /// Amplitude scintillation index S4 (0..=1).
    pub s4: f64,
    /// Decorrelation time τ0 (s): the 1/e lag of the diffuse component's autocorrelation.
    pub tau0_s: f64,
    /// Standard deviation of the optional extra phase term (rad); 0 disables it.
    pub extra_phase_sigma_rad: f64,
}

impl ScintParams {
    /// Cornell-model parameters with no extra phase term.
    pub fn new(s4: f64, tau0_s: f64) -> Self {
        Self {
            s4,
            tau0_s,
            extra_phase_sigma_rad: 0.0,
        }
    }

    /// Diffuse power `P = 1 − √(1 − S4²)` (S4 clamped to 0..=1).
    pub fn diffuse_power(&self) -> f64 {
        let s4 = self.s4.clamp(0.0, 1.0);
        1.0 - (1.0 - s4 * s4).sqrt()
    }

    /// Butterworth natural frequency `ωn` (rad/s) giving the stated τ0.
    pub fn omega_n(&self) -> f64 {
        BUTTERWORTH_1_OVER_E_X * SQRT_2 / self.tau0_s
    }
}

/// One scintillation sample: the factor `z = amplitude·e^{j·phase}` applied to the signal.
#[derive(Clone, Copy, Debug, PartialEq)]
pub struct ScintSample {
    /// Amplitude factor `|z|` (linear; mean square 1).
    pub amplitude: f64,
    /// Phase `arg z` plus any extra phase term (rad).
    pub phase_rad: f64,
}

/// A real Butterworth-filtered Gaussian process in normalised state coordinates
/// `u = [y/σ, ẏ/(σ·ωn)]`, whose stationary covariance is the identity.
#[derive(Clone, Copy, Debug, Default)]
struct Bw2 {
    u: [f64; 2],
}

/// The exact transition of [`Bw2`] over `dt`: `Φ` and the Cholesky factor of the process
/// noise covariance `I − ΦΦᵀ`.
fn transition(omega_n: f64, dt: f64) -> ([[f64; 2]; 2], [[f64; 2]; 2]) {
    let x = omega_n * dt / SQRT_2;
    let e = (-x).exp();
    let (s, c) = x.sin_cos();
    let phi = [
        [e * (c + s), e * SQRT_2 * s],
        [-e * SQRT_2 * s, e * (c - s)],
    ];
    let q00 = 1.0 - phi[0][0] * phi[0][0] - phi[0][1] * phi[0][1];
    let q01 = -phi[0][0] * phi[1][0] - phi[0][1] * phi[1][1];
    let q11 = 1.0 - phi[1][0] * phi[1][0] - phi[1][1] * phi[1][1];
    let l00 = q00.max(0.0).sqrt();
    let l10 = if l00 > 0.0 { q01 / l00 } else { 0.0 };
    let l11 = (q11 - l10 * l10).max(0.0).sqrt();
    (phi, [[l00, 0.0], [l10, l11]])
}

impl Bw2 {
    fn stationary(rng: &mut ChaCha8Rng) -> Self {
        Self {
            u: [rng.sample(StandardNormal), rng.sample(StandardNormal)],
        }
    }
    fn step(&mut self, phi: &[[f64; 2]; 2], l: &[[f64; 2]; 2], rng: &mut ChaCha8Rng) {
        let w0: f64 = rng.sample(StandardNormal);
        let w1: f64 = rng.sample(StandardNormal);
        let u = self.u;
        self.u = [
            phi[0][0] * u[0] + phi[0][1] * u[1] + l[0][0] * w0,
            phi[1][0] * u[0] + phi[1][1] * u[1] + l[1][0] * w0 + l[1][1] * w1,
        ];
    }
}

#[derive(Clone, Debug)]
struct SatState {
    rng: ChaCha8Rng,
    re: Bw2,
    im: Bw2,
    ph: Bw2,
    last_t: f64,
}

/// The Cornell scintillation effect, with independent per-satellite processes.
#[derive(Clone, Debug)]
pub struct Scintillation {
    /// Model parameters (shared by every satellite).
    pub params: ScintParams,
    seed: u64,
    sats: BTreeMap<u32, SatState>,
}

impl Scintillation {
    /// A scintillation effect with `params`, seeded with `seed`.
    pub fn new(params: ScintParams, seed: u64) -> Self {
        Self {
            params,
            seed,
            sats: BTreeMap::new(),
        }
    }

    /// The scintillation factor for satellite `sat` at time `t_s`. The first call for a
    /// satellite draws its filter state from the stationary distribution; later calls
    /// propagate it exactly over the elapsed time. A call at or before the previous time
    /// returns the current state unchanged.
    pub fn sample(&mut self, sat: u32, t_s: f64) -> ScintSample {
        let p = self.params;
        let seed = self.seed;
        let st = self.sats.entry(sat).or_insert_with(|| {
            let mut rng = ChaCha8Rng::seed_from_u64(sat_seed(seed, sat, SALT));
            let re = Bw2::stationary(&mut rng);
            let im = Bw2::stationary(&mut rng);
            let ph = Bw2::stationary(&mut rng);
            SatState {
                rng,
                re,
                im,
                ph,
                last_t: t_s,
            }
        });
        let dt = t_s - st.last_t;
        if dt > 0.0 {
            let (phi, l) = transition(p.omega_n(), dt);
            st.re.step(&phi, &l, &mut st.rng);
            st.im.step(&phi, &l, &mut st.rng);
            st.ph.step(&phi, &l, &mut st.rng);
            st.last_t = t_s;
        }
        let pd = p.diffuse_power();
        let sigma = (pd / 2.0).sqrt();
        let zr = (1.0 - pd).sqrt() + sigma * st.re.u[0];
        let zi = sigma * st.im.u[0];
        ScintSample {
            amplitude: zr.hypot(zi),
            phase_rad: zi.atan2(zr) + p.extra_phase_sigma_rad * st.ph.u[0],
        }
    }

    /// A time series of `n` samples spaced `dt_s` apart for satellite `sat`, starting at
    /// the satellite's current state (or a fresh stationary draw at `t = 0`).
    pub fn series(&mut self, sat: u32, dt_s: f64, n: usize) -> Vec<ScintSample> {
        let t0 = self.sats.get(&sat).map_or(0.0, |s| s.last_t);
        (0..n)
            .map(|k| self.sample(sat, t0 + k as f64 * dt_s))
            .collect()
    }
}

impl ChannelEffect for Scintillation {
    fn apply(
        &mut self,
        sat: u32,
        t_s: f64,
        _geom: &LineOfSight,
        _carrier_hz: f64,
        snap: &mut ChannelSnapshot,
    ) {
        let z = self.sample(sat, t_s);
        for p in &mut snap.paths {
            p.amplitude *= z.amplitude;
            p.carrier_phase_rad += z.phase_rad;
        }
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    fn s4_of(xs: &[ScintSample]) -> f64 {
        let n = xs.len() as f64;
        let m1 = xs.iter().map(|s| s.amplitude.powi(2)).sum::<f64>() / n;
        let m2 = xs.iter().map(|s| s.amplitude.powi(4)).sum::<f64>() / n;
        (m2 - m1 * m1).sqrt() / m1
    }

    #[test]
    fn butterworth_constant_solves_the_closed_form_autocorrelation() {
        let x = BUTTERWORTH_1_OVER_E_X;
        let r = (-x).exp() * (x.cos() + x.sin());
        assert!((r - (-1f64).exp()).abs() < 1e-14);
    }

    #[test]
    fn rice_diffuse_power_reproduces_s4_in_closed_form() {
        for s4 in [0.1, 0.4, 0.7, 1.0] {
            let pd = ScintParams::new(s4, 1.0).diffuse_power();
            // Rice intensity: Var(I)/E[I]² = P(2 − P) with E[I] = 1.
            assert!(((pd * (2.0 - pd)).sqrt() - s4).abs() < 1e-12);
        }
    }

    /// Sample S4 of a long run matches the target. Run: 400 000 samples at τ0/4 spacing,
    /// about 100 000 τ0 of record; the tolerance (4 % relative) is several standard errors
    /// of the S4 estimator at that record length.
    #[test]
    fn sample_s4_matches_target_within_statistical_tolerance() {
        for (k, s4) in [0.3, 0.6, 0.9].into_iter().enumerate() {
            let tau0 = 0.4;
            let mut sc = Scintillation::new(ScintParams::new(s4, tau0), 11 + k as u64);
            let xs = sc.series(5, tau0 / 4.0, 400_000);
            let got = s4_of(&xs);
            assert!((got - s4).abs() / s4 < 0.04, "S4 target {s4}, got {got}");
            let mean_i = xs.iter().map(|s| s.amplitude.powi(2)).sum::<f64>() / xs.len() as f64;
            assert!((mean_i - 1.0).abs() < 0.02, "{mean_i}");
        }
    }

    /// The 1/e lag of the sample autocorrelation of `z − ẑ` matches τ0 (5 % tolerance).
    #[test]
    fn autocorrelation_decorrelation_time_matches_tau0() {
        let tau0 = 0.5;
        let dt = tau0 / 20.0;
        let p = ScintParams::new(0.7, tau0);
        let zhat = (1.0 - p.diffuse_power()).sqrt();
        let mut sc = Scintillation::new(p, 3);
        let xs: Vec<(f64, f64)> = sc
            .series(9, dt, 600_000)
            .iter()
            .map(|s| {
                let (si, co) = s.phase_rad.sin_cos();
                (s.amplitude * co - zhat, s.amplitude * si)
            })
            .collect();
        let n = xs.len();
        let r = |lag: usize| {
            (0..n - lag)
                .map(|i| xs[i].0 * xs[i + lag].0 + xs[i].1 * xs[i + lag].1)
                .sum::<f64>()
                / (n - lag) as f64
        };
        let r0 = r(0);
        let target = (-1f64).exp();
        let mut prev = 1.0;
        let mut lag_s = f64::NAN;
        for lag in 1..200 {
            let rho = r(lag) / r0;
            if rho < target {
                let frac = (prev - target) / (prev - rho);
                lag_s = ((lag - 1) as f64 + frac) * dt;
                break;
            }
            prev = rho;
        }
        assert!(
            (lag_s - tau0).abs() / tau0 < 0.05,
            "1/e lag {lag_s} vs τ0 {tau0}"
        );
    }

    #[test]
    fn same_seed_is_bit_identical_and_independent_of_query_order() {
        let p = ScintParams {
            extra_phase_sigma_rad: 0.2,
            ..ScintParams::new(0.5, 0.3)
        };
        let mut a = Scintillation::new(p, 42);
        let mut b = Scintillation::new(p, 42);
        let mut sa = Vec::new();
        let mut sb7 = Vec::new();
        let mut sb2 = Vec::new();
        for k in 0..500 {
            let t = k as f64 * 0.02;
            sa.push((a.sample(2, t), a.sample(7, t)));
            sb7.push(b.sample(7, t));
            sb2.push(b.sample(2, t));
        }
        for k in 0..500 {
            assert_eq!(sa[k].0, sb2[k]);
            assert_eq!(sa[k].1, sb7[k]);
        }
        let mut c = Scintillation::new(p, 43);
        assert_ne!(c.sample(2, 0.0), Scintillation::new(p, 42).sample(2, 0.0));
    }

    #[test]
    fn extra_phase_term_has_its_stated_standard_deviation() {
        // With S4 = 0 the Rice phase vanishes and only the extra term remains.
        let p = ScintParams {
            extra_phase_sigma_rad: 0.3,
            ..ScintParams::new(0.0, 0.2)
        };
        let mut sc = Scintillation::new(p, 8);
        let xs = sc.series(1, 0.05, 200_000);
        let n = xs.len() as f64;
        let m = xs.iter().map(|s| s.phase_rad).sum::<f64>() / n;
        let sd = (xs.iter().map(|s| (s.phase_rad - m).powi(2)).sum::<f64>() / n).sqrt();
        assert!((sd - 0.3).abs() / 0.3 < 0.04, "{sd}");
        assert!(xs.iter().all(|s| (s.amplitude - 1.0).abs() < 1e-12));
    }
}
