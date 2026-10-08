// SPDX-License-Identifier: AGPL-3.0-only
//! Stochastic clock and error models — the noise processes a scenario samples to
//! drive a run.
use crate::types::{ModelSpec, Seconds};
use rand::RngCore;
use rand_distr::{Distribution, Normal};

/// Coerce a per-step random-walk standard deviation into a value
/// `rand_distr::Normal::new` is guaranteed to accept. `Normal::new` (0.4) rejects only a
/// non-finite `std_dev`; a config-supplied `inf` PSD (or `dt`) would make the product —
/// and hence `sqrt()` — `inf`. A non-finite value maps to the smallest positive normal;
/// a finite value is floored to it. The result is always finite and strictly positive.
fn finite_pos_std_dev(std_dev: f64) -> f64 {
    if std_dev.is_finite() {
        std_dev.max(f64::MIN_POSITIVE)
    } else {
        f64::MIN_POSITIVE
    }
}

/// A sensor/clock error model: evolve internal error state, expose a spec.
pub trait ErrorModel {
    fn step(&mut self, dt: Seconds, rng: &mut dyn RngCore);
    fn spec(&self) -> ModelSpec;
}

/// Flicker (1/f) FM frequency noise, synthesized as a sum of log-spaced
/// Ornstein-Uhlenbeck (Lorentzian) processes. A single OU process of correlation
/// time `tau` has one-sided PSD `S(f) = 4 sigma^2 tau / (1 + (2 pi f tau)^2)`;
/// summing equal-variance components spaced geometrically in `tau` yields a `1/f`
/// envelope across the band [tau_min, tau_max]. In the continuum limit the summed
/// PSD is `S_y(f) = sigma0^2 / (ln(rho) * f)`, i.e. `h_-1 = sigma0^2 / ln(rho)`.
/// Flicker FM has a flat Allan-deviation floor `sigma_y = sqrt(2 ln2 * h_-1)`, so
/// choosing `sigma0^2 = sigma_floor^2 * ln(rho) / (2 ln2)` places the floor exactly
/// at `sigma_floor`. References: NIST SP 1065 (Riley); Kasdin, Proc. IEEE 1995.
///
/// The process is unit-agnostic — it produces a stationary 1/f signal whose flat
/// Allan-deviation floor is `sigma_floor` — so it models both clock flicker FM
/// (fractional frequency) and accelerometer/gyro bias instability (the Allan
/// bias-instability coefficient) with the same code.
#[derive(Clone, Debug)]
pub(crate) struct Flicker {
    sigma_floor: f64,
    comp_var: f64,
    log_ratio: f64,
    taus: Vec<f64>,
    states: Vec<f64>,
    initialized: bool,
}

impl Flicker {
    pub(crate) fn new(sigma_floor: f64, tau_min: f64, tau_max: f64, per_decade: usize) -> Self {
        assert!(tau_max > tau_min && tau_min > 0.0 && per_decade >= 1);
        let rho = 10f64.powf(1.0 / per_decade as f64);
        let ln_rho = rho.ln();
        // Per-component stationary variance that places the flat ADEV floor at sigma_floor.
        let comp_var = sigma_floor * sigma_floor * ln_rho / (2.0 * std::f64::consts::LN_2);
        let decades = (tau_max / tau_min).log10();
        let m = (decades * per_decade as f64).round() as usize + 1;
        let taus: Vec<f64> = (0..m).map(|i| tau_min * rho.powi(i as i32)).collect();
        Self {
            sigma_floor,
            comp_var,
            log_ratio: ln_rho,
            states: vec![0.0; taus.len()],
            taus,
            initialized: false,
        }
    }

    /// The same bank as a filter model: `h_-1 = comp_var / ln(rho)` and the same correlation
    /// times, so a filter built from it models exactly the process this truth draws.
    pub(crate) fn bank(&self) -> crate::clock_state::FlickerFmBank {
        crate::clock_state::FlickerFmBank {
            h_minus1: self.comp_var / self.log_ratio,
            taus: self.taus.clone(),
            log_ratio: self.log_ratio,
        }
    }

    /// Variance (s^2) of the phase this bank adds over `n` steps of `dt` seconds when the
    /// first step starts from the (stationary) state at an unknown instant: the variance of
    /// `dt * sum_{k=1..n} y_k` for each component's AR(1) sequence `y_k = a y_{k-1} + w`,
    /// `a = exp(-dt/tau)`, stationary variance `comp_var`, summed over components.
    /// This is exactly the process [`step`](Self::step) generates; it tends to the
    /// continuous-time integral as `dt -> 0`.
    pub(crate) fn phase_variance_after_steps(&self, n: usize, dt: f64) -> f64 {
        let nf = n as f64;
        self.taus
            .iter()
            .map(|&tau| {
                let a = (-dt / tau).exp();
                let one_minus_a = -(-dt / tau).exp_m1();
                // sum_{m=1}^{n-1} (n - m) a^m, with the n(n-1)/2 limit as a -> 1.
                let cross = if one_minus_a < 1e-7 {
                    nf * (nf - 1.0) / 2.0
                } else {
                    a * (nf - 1.0 - nf * a + a.powi(n as i32)) / (one_minus_a * one_minus_a)
                };
                dt * dt * self.comp_var * (nf + 2.0 * cross)
            })
            .sum()
    }

    /// Reset to an unseeded zero state (re-seeds on the next [`step`]).
    ///
    /// [`step`]: Self::step
    pub(crate) fn reset(&mut self) {
        for s in &mut self.states {
            *s = 0.0;
        }
        self.initialized = false;
    }

    /// Advance every OU component by `dt` and return the summed flicker
    /// contribution (fractional frequency for a clock, acceleration for a sensor
    /// bias). Components are lazily seeded from their stationary distribution on
    /// first use so the process is stationary from t=0.
    pub(crate) fn step(&mut self, dt: Seconds, rng: &mut dyn RngCore) -> f64 {
        let sd0 = self.comp_var.sqrt();
        if !self.initialized {
            let n0 = Normal::new(0.0, finite_pos_std_dev(sd0))
                .expect("finite_pos_std_dev returns a finite, strictly-positive std_dev, which Normal::new always accepts");
            for s in &mut self.states {
                *s = n0.sample(rng);
            }
            self.initialized = true;
        }
        let mut sum = 0.0;
        for (i, s) in self.states.iter_mut().enumerate() {
            let a = (-dt / self.taus[i]).exp();
            let sd = (self.comp_var * (1.0 - a * a)).sqrt();
            let n = Normal::new(0.0, finite_pos_std_dev(sd))
                .expect("finite_pos_std_dev returns a finite, strictly-positive std_dev, which Normal::new always accepts");
            *s = *s * a + n.sample(rng);
            sum += *s;
        }
        sum
    }
}

/// Clock error model: deterministic fractional-frequency offset `y0`, linear
/// aging `drift` (per second), white FM (`q_wf`), random-walk FM (`q_rw`), and an
/// optional flicker (1/f) FM floor.
#[derive(Clone, Debug)]
pub struct ClockModel {
    pub id: String,
    pub provenance: String,
    pub y0: f64,
    pub q_wf: f64,
    pub q_rw: f64,
    pub drift: f64,
    flicker: Option<Flicker>,
    phase: Seconds,
    freq: f64,
    t: Seconds,
}

impl ClockModel {
    pub fn new(id: &str, provenance: &str, y0: f64, q_wf: f64, q_rw: f64) -> Self {
        Self {
            id: id.into(),
            provenance: provenance.into(),
            y0,
            q_wf,
            q_rw,
            drift: 0.0,
            flicker: None,
            phase: 0.0,
            freq: 0.0,
            t: 0.0,
        }
    }
    /// Builder: set linear fractional-frequency aging rate (per second).
    pub fn with_drift(mut self, drift: f64) -> Self {
        self.drift = drift;
        self
    }
    /// Builder: add a flicker (1/f) FM floor at Allan deviation `sigma_floor`,
    /// synthesized over the band [tau_min, tau_max] seconds at `per_decade`
    /// Lorentzian components per decade. Ignored when `sigma_floor <= 0`.
    pub fn with_flicker_band(
        mut self,
        sigma_floor: f64,
        tau_min: f64,
        tau_max: f64,
        per_decade: usize,
    ) -> Self {
        if sigma_floor > 0.0 {
            self.flicker = Some(Flicker::new(sigma_floor, tau_min, tau_max, per_decade));
        }
        self
    }
    /// Builder: add a flicker FM floor at `sigma_floor` over a default 5-decade
    /// band (1 s to 1e5 s) at 4 components per decade. Ignored when non-positive.
    /// The flicker bank as a filter model, or `None` without a flicker floor. Built from the
    /// truth's own bank, so the two cannot drift apart.
    pub(crate) fn flicker_bank(&self) -> Option<crate::clock_state::FlickerFmBank> {
        self.flicker.as_ref().map(Flicker::bank)
    }

    /// Variance (s^2) of the flicker phase accumulated over `n` steps of `dt` seconds, `0`
    /// without a flicker floor ([`Flicker::phase_variance_after_steps`]).
    pub(crate) fn flicker_phase_variance_after_steps(&self, n: usize, dt: f64) -> f64 {
        self.flicker
            .as_ref()
            .map_or(0.0, |f| f.phase_variance_after_steps(n, dt))
    }

    pub fn with_flicker(self, sigma_floor: f64) -> Self {
        self.with_flicker_band(sigma_floor, 1.0, 1e5, 4)
    }
    pub fn phase(&self) -> Seconds {
        self.phase
    }
    /// Instantaneous deterministic (calibratable) frequency = y0 + drift*t.
    pub fn det_freq(&self) -> f64 {
        self.y0 + self.drift * self.t
    }
    /// Deterministic aging rate (per second).
    pub fn drift_rate(&self) -> f64 {
        self.drift
    }
}

impl ErrorModel for ClockModel {
    fn step(&mut self, dt: Seconds, rng: &mut dyn RngCore) {
        if dt <= 0.0 {
            return;
        }
        if self.q_rw > 0.0 {
            let n = Normal::new(0.0, finite_pos_std_dev((self.q_rw * dt).sqrt()))
                .expect("finite_pos_std_dev returns a finite, strictly-positive std_dev, which Normal::new always accepts");
            self.freq += n.sample(rng);
        }
        let y_flicker = match &mut self.flicker {
            Some(f) => f.step(dt, rng),
            None => 0.0,
        };
        let y_det = self.y0 + self.drift * self.t;
        let mut dx = (y_det + self.freq + y_flicker) * dt;
        if self.q_wf > 0.0 {
            let n = Normal::new(0.0, finite_pos_std_dev((self.q_wf * dt).sqrt()))
                .expect("finite_pos_std_dev returns a finite, strictly-positive std_dev, which Normal::new always accepts");
            dx += n.sample(rng);
        }
        self.phase += dx;
        self.t += dt;
    }
    fn spec(&self) -> ModelSpec {
        ModelSpec {
            id: self.id.clone(),
            kind: "clock".into(),
            provenance: self.provenance.clone(),
            params: serde_json::json!({
                "y0": self.y0,
                "q_wf": self.q_wf,
                "q_rw": self.q_rw,
                "drift": self.drift,
                "flicker_floor": self.flicker.as_ref().map(|f| f.sigma_floor),
            }),
        }
    }
}

#[cfg(test)]
mod tests {
    use super::*;
    use rand::SeedableRng;
    use rand_chacha::ChaCha8Rng;

    #[test]
    fn deterministic_freq_offset_no_noise() {
        let mut c = ClockModel::new("test", "unit", 1e-9, 0.0, 0.0);
        let mut rng = ChaCha8Rng::seed_from_u64(1);
        for _ in 0..10 {
            c.step(1.0, &mut rng);
        }
        assert!((c.phase() - 1e-8).abs() < 1e-18);
    }

    #[test]
    fn same_seed_is_reproducible() {
        let run = || {
            let mut c = ClockModel::new("q", "unit", 0.0, 1e-20, 1e-24);
            let mut rng = ChaCha8Rng::seed_from_u64(42);
            for _ in 0..100 {
                c.step(1.0, &mut rng);
            }
            c.phase()
        };
        assert_eq!(run(), run());
    }

    #[test]
    fn pure_aging_accumulates_quadratically() {
        // drift d, y0=0, no noise, dt=1, N steps: phase = d * sum_{i=0}^{N-1} i = d*N(N-1)/2
        let mut c = ClockModel::new("age", "unit", 0.0, 0.0, 0.0).with_drift(1e-9);
        let mut rng = ChaCha8Rng::seed_from_u64(1);
        for _ in 0..4 {
            c.step(1.0, &mut rng);
        } // 1e-9 * (4*3/2)=6 -> 6e-9
        assert!((c.phase() - 6e-9).abs() < 1e-20);
    }

    #[test]
    fn zero_flicker_floor_is_a_noop() {
        // with_flicker(0.0) must add nothing: identical phase to the base clock.
        let base = || {
            let mut c = ClockModel::new("b", "unit", 0.0, 1e-24, 1e-32);
            let mut rng = ChaCha8Rng::seed_from_u64(3);
            for _ in 0..50 {
                c.step(1.0, &mut rng);
            }
            c.phase()
        };
        let zero_flick = || {
            let mut c = ClockModel::new("b", "unit", 0.0, 1e-24, 1e-32).with_flicker(0.0);
            let mut rng = ChaCha8Rng::seed_from_u64(3);
            for _ in 0..50 {
                c.step(1.0, &mut rng);
            }
            c.phase()
        };
        assert_eq!(base(), zero_flick());
    }

    #[test]
    fn flicker_is_reproducible() {
        let run = || {
            let mut c = ClockModel::new("q", "unit", 0.0, 0.0, 0.0).with_flicker(1e-13);
            let mut rng = ChaCha8Rng::seed_from_u64(11);
            for _ in 0..500 {
                c.step(1.0, &mut rng);
            }
            c.phase()
        };
        assert_eq!(run(), run());
        // A flicker-only clock must actually move (non-trivial phase).
        assert!(run().abs() > 0.0);
    }

    #[test]
    fn flicker_only_clock_has_flat_adev_floor() {
        // Flicker FM -> flat Allan-deviation floor at sigma_floor, independent of tau.
        // Build a flicker-only clock, sample phase at 1 s, and confirm the overlapping
        // ADEV at tau=10 s and tau=100 s both sit near sigma_floor and are flat.
        use crate::allan::overlapping_adev;
        let sigma_floor = 1e-13;
        let dt = 1.0;
        let n = 16000usize;
        let seeds: Vec<u64> = (1..=12).collect();
        let (mut avar10, mut avar100) = (0.0, 0.0);
        for &seed in &seeds {
            let mut c = ClockModel::new("flick", "unit", 0.0, 0.0, 0.0).with_flicker(sigma_floor);
            let mut rng = ChaCha8Rng::seed_from_u64(seed);
            let mut phase = Vec::with_capacity(n + 1);
            phase.push(c.phase());
            for _ in 0..n {
                c.step(dt, &mut rng);
                phase.push(c.phase());
            }
            let a10 = overlapping_adev(&phase, dt, 10);
            let a100 = overlapping_adev(&phase, dt, 100);
            avar10 += a10 * a10;
            avar100 += a100 * a100;
        }
        let adev10 = (avar10 / seeds.len() as f64).sqrt();
        let adev100 = (avar100 / seeds.len() as f64).sqrt();
        // Level: both within 30% of the configured floor.
        assert!(
            (adev10 - sigma_floor).abs() / sigma_floor < 0.30,
            "adev(10s)={adev10} vs floor={sigma_floor}"
        );
        assert!(
            (adev100 - sigma_floor).abs() / sigma_floor < 0.30,
            "adev(100s)={adev100} vs floor={sigma_floor}"
        );
        // Flatness: a decade of tau changes ADEV by less than ~1.5x either way.
        let ratio = adev100 / adev10;
        assert!(
            ratio > 0.65 && ratio < 1.55,
            "flicker not flat: ratio={ratio}"
        );
    }

    /// The filter's flicker bank is built from the truth's own bank: same correlation times,
    /// same per-process variance, and `h_-1` equal to `sigma^2 / (2 ln 2)`.
    #[test]
    fn the_filter_bank_is_the_truth_bank() {
        use crate::clock_state::FlickerFmBank;
        let sigma = 2.0e-11;
        let c = ClockModel::new("c", "unit", 0.0, 0.0, 0.0).with_flicker(sigma);
        let bank = c.flicker_bank().expect("floor > 0 has a bank");
        let direct =
            FlickerFmBank::log_spaced(sigma * sigma / (2.0 * std::f64::consts::LN_2), 1.0, 1e5, 4);
        assert_eq!(bank.taus.len(), direct.taus.len());
        for (a, b) in bank.taus.iter().zip(&direct.taus) {
            assert!((a / b - 1.0).abs() < 1e-12, "{a} vs {b}");
        }
        assert!((bank.h_minus1 / direct.h_minus1 - 1.0).abs() < 1e-12);
        assert!((bank.log_ratio - direct.log_ratio).abs() < 1e-15);
        assert!(ClockModel::new("c", "unit", 0.0, 0.0, 0.0)
            .flicker_bank()
            .is_none());
        assert_eq!(
            ClockModel::new("c", "unit", 0.0, 0.0, 0.0)
                .flicker_phase_variance_after_steps(100, 10.0),
            0.0
        );
    }

    /// The closed-form phase variance equals the empirical variance of the phase the truth
    /// clock accumulates, from the stationary start, over `n` steps (all other noise off).
    #[test]
    fn the_flicker_phase_variance_matches_the_simulated_clock() {
        use rand::SeedableRng;
        use rand_chacha::ChaCha8Rng;
        let (sigma, dt) = (2.0e-11, 10.0);
        for n in [1usize, 5, 60, 660] {
            let model = ClockModel::new("c", "unit", 0.0, 0.0, 0.0).with_flicker(sigma);
            let want = model.flicker_phase_variance_after_steps(n, dt);
            let runs = 4000;
            let mut acc = 0.0;
            for seed in 0..runs {
                let mut rng = ChaCha8Rng::seed_from_u64(1000 + seed);
                let mut c = model.clone();
                c.step(dt, &mut rng); // the first step seeds the stationary state
                                      // Anchor after a burn-in, as at a GNSS sync: the state is stationary and the
                                      // predictor knows nothing of it.
                for _ in 0..50 {
                    c.step(dt, &mut rng);
                }
                let p0 = c.phase();
                for _ in 0..n {
                    c.step(dt, &mut rng);
                }
                let e = c.phase() - p0;
                acc += e * e;
            }
            let got = acc / runs as f64;
            assert!(
                (got / want - 1.0).abs() < 0.1,
                "n = {n}: simulated {got:e} vs closed form {want:e}"
            );
        }
        // The continuous-time limit: dt -> 0 with n dt fixed approaches the integral formula.
        let m = ClockModel::new("c", "unit", 0.0, 0.0, 0.0).with_flicker(sigma);
        let coarse = m.flicker_phase_variance_after_steps(10, 100.0);
        let fine = m.flicker_phase_variance_after_steps(1000, 1.0);
        assert!((coarse / fine - 1.0).abs() < 0.2, "{coarse:e} vs {fine:e}");
    }
}
