// SPDX-License-Identifier: AGPL-3.0-only
//! Sequential-importance-resampling (SIR) particle filter.
//!
//! The nonlinear, non-Gaussian estimator behind **map-aided, GPS-denied navigation**:
//! terrain-referenced navigation against a digital elevation model, or gravity-map
//! matching against a gravity-anomaly field. A cloud of weighted state hypotheses
//! (particles) is propagated through the platform dynamics, reweighted by how well each
//! explains the latest map measurement, and resampled when it degenerates.
//!
//! This is the generic estimator engine: `predict` (propagate + process noise),
//! `update` (reweight by a likelihood), systematic `resample`, the effective-sample-size
//! degeneracy monitor, and the weighted-mean estimate. The reference maps and their
//! measurement models are now built on top: the gravity-anomaly field in
//! [`crate::gravimeter`], the IGRF-14 magnetic field in [`crate::igrf`], and an SRTM `.hgt`
//! digital-elevation grid with the terrain-referenced and combined gravity+magnetic+terrain
//! navigators in [`crate::altpnt::terrain`] — all reusing the bilinear grid sampler pattern
//! from [`crate::ionex`].

use rand::RngCore;
use rand_distr::{Distribution, Normal};

/// Normalise weights to sum 1. If every weight is zero (total particle collapse), reset
/// to a uniform distribution rather than divide by zero.
pub fn normalize(weights: &mut [f64]) {
    let sum: f64 = weights.iter().sum();
    if sum > 0.0 {
        for w in weights.iter_mut() {
            *w /= sum;
        }
    } else {
        let u = 1.0 / weights.len() as f64;
        for w in weights.iter_mut() {
            *w = u;
        }
    }
}

/// Effective sample size `1 / Σwᵢ²` (weights assumed normalised): `N` for a uniform cloud,
/// `1` when one particle holds all the weight. The standard resample-when-it-drops monitor.
pub fn effective_sample_size(weights: &[f64]) -> f64 {
    let s: f64 = weights.iter().map(|w| w * w).sum();
    if s > 0.0 {
        1.0 / s
    } else {
        0.0
    }
}

/// Systematic resampling: return `weights.len()` particle indices to keep, drawing one
/// stratified sample per `1/N` interval offset by `u0 ∈ [0,1)`. Deterministic given `u0`,
/// and lower-variance than multinomial resampling.
pub fn systematic_resample(weights: &[f64], u0: f64) -> Vec<usize> {
    let n = weights.len();
    let mut cumsum = Vec::with_capacity(n);
    let mut acc = 0.0;
    for &w in weights {
        acc += w;
        cumsum.push(acc);
    }
    let mut idx = vec![0usize; n];
    let (mut i, mut j) = (0usize, 0usize);
    while i < n {
        let pos = (u0 + i as f64) / n as f64;
        if pos < cumsum[j] {
            idx[i] = j;
            i += 1;
        } else if j + 1 < n {
            j += 1;
        } else {
            idx[i] = n - 1; // floating-point guard at the top of the cumulative sum
            i += 1;
        }
    }
    idx
}

/// Weighted mean of the particle states (the minimum-mean-square-error estimate).
pub fn weighted_mean(particles: &[Vec<f64>], weights: &[f64]) -> Vec<f64> {
    let dim = particles[0].len();
    let mut m = vec![0.0; dim];
    for (p, &w) in particles.iter().zip(weights) {
        for (mk, &pk) in m.iter_mut().zip(p) {
            *mk += w * pk;
        }
    }
    m
}

/// A SIR particle filter over an `n`-dimensional state.
#[derive(Clone, Debug)]
pub struct ParticleFilter {
    /// The particle states.
    pub particles: Vec<Vec<f64>>,
    /// The (normalised) particle weights.
    pub weights: Vec<f64>,
}

impl ParticleFilter {
    /// A filter seeded with the given particles and uniform weights.
    pub fn new(particles: Vec<Vec<f64>>) -> Self {
        let n = particles.len().max(1);
        Self {
            weights: vec![1.0 / n as f64; particles.len()],
            particles,
        }
    }

    /// Propagate every particle through the dynamics `f`, adding per-component Gaussian
    /// process noise with standard deviations `noise_sd` (drawn from `rng`).
    pub fn predict<F>(&mut self, f: F, noise_sd: &[f64], rng: &mut dyn RngCore)
    where
        F: Fn(&[f64]) -> Vec<f64>,
    {
        for p in self.particles.iter_mut() {
            let mut next = f(p);
            for (k, &sd) in noise_sd.iter().enumerate() {
                if sd > 0.0 && k < next.len() {
                    next[k] += Normal::new(0.0, sd).unwrap().sample(rng);
                }
            }
            *p = next;
        }
    }

    /// Reweight by a per-particle measurement likelihood, then renormalise.
    pub fn update<L>(&mut self, likelihood: L)
    where
        L: Fn(&[f64]) -> f64,
    {
        for (w, p) in self.weights.iter_mut().zip(&self.particles) {
            *w *= likelihood(p);
        }
        normalize(&mut self.weights);
    }

    /// Effective sample size of the current weights.
    pub fn effective_sample_size(&self) -> f64 {
        effective_sample_size(&self.weights)
    }

    /// Systematic-resample the cloud (offset `u0 ∈ [0,1)`) and reset to uniform weights.
    pub fn resample(&mut self, u0: f64) {
        let idx = systematic_resample(&self.weights, u0);
        self.particles = idx.iter().map(|&i| self.particles[i].clone()).collect();
        let u = 1.0 / self.weights.len() as f64;
        for w in self.weights.iter_mut() {
            *w = u;
        }
    }

    /// The weighted-mean state estimate.
    pub fn estimate(&self) -> Vec<f64> {
        weighted_mean(&self.particles, &self.weights)
    }
}

#[cfg(test)]
mod tests {
    use super::*;
    use rand::SeedableRng;
    use rand_chacha::ChaCha8Rng;

    #[test]
    fn effective_sample_size_spans_one_to_n() {
        assert!((effective_sample_size(&[0.25; 4]) - 4.0).abs() < 1e-12);
        assert!((effective_sample_size(&[1.0, 0.0, 0.0, 0.0]) - 1.0).abs() < 1e-12);
        assert!((effective_sample_size(&[0.5, 0.5, 0.0, 0.0]) - 2.0).abs() < 1e-12);
    }

    #[test]
    fn systematic_resample_picks_in_proportion_to_weight() {
        // Weights [0.1, 0.6, 0.3], u0 = 0.5 ⇒ indices [1, 1, 2] (the 0.6 particle twice,
        // the 0.3 particle once, the 0.1 particle dropped).
        assert_eq!(systematic_resample(&[0.1, 0.6, 0.3], 0.5), vec![1, 1, 2]);
        // A collapsed weight vector resamples entirely to the surviving particle.
        assert_eq!(systematic_resample(&[0.0, 1.0, 0.0], 0.5), vec![1, 1, 1]);
    }

    #[test]
    fn weighted_mean_is_the_convex_combination() {
        let particles = vec![vec![0.0], vec![2.0], vec![4.0]];
        let m = weighted_mean(&particles, &[0.5, 0.25, 0.25]);
        assert!((m[0] - 1.5).abs() < 1e-12); // 0.5·0 + 0.25·2 + 0.25·4
    }

    #[test]
    fn update_concentrates_weight_near_the_measurement() {
        // A fine, deterministic grid of 1-D particles over [−10, 10]; a Gaussian
        // likelihood centred on z = 5 (σ = 1) must pull the estimate to ≈ 5.
        let n = 1001;
        let particles: Vec<Vec<f64>> = (0..n)
            .map(|i| vec![-10.0 + 20.0 * i as f64 / (n - 1) as f64])
            .collect();
        let mut pf = ParticleFilter::new(particles);
        let z = 5.0;
        pf.update(|p| (-0.5 * (p[0] - z) * (p[0] - z)).exp());
        assert!(
            (pf.estimate()[0] - z).abs() < 1e-3,
            "estimate = {}",
            pf.estimate()[0]
        );
        // The cloud has degenerated (ESS far below N), so it should be resampled.
        assert!(pf.effective_sample_size() < n as f64 / 2.0);
    }

    #[test]
    fn resample_then_uniform_weights_and_concentrated_particles() {
        let particles = vec![vec![0.0], vec![5.0], vec![10.0]];
        let mut pf = ParticleFilter::new(particles);
        pf.weights = vec![0.0, 1.0, 0.0]; // all weight on the middle particle
        pf.resample(0.5);
        assert!(pf.particles.iter().all(|p| (p[0] - 5.0).abs() < 1e-12));
        assert!(pf.weights.iter().all(|&w| (w - 1.0 / 3.0).abs() < 1e-12));
    }

    #[test]
    fn predict_is_deterministic_for_a_fixed_seed_and_moves_particles() {
        // Constant-velocity-ish drift f(x) = x + 1, with process noise.
        let run = || {
            let mut pf = ParticleFilter::new(vec![vec![0.0], vec![10.0]]);
            let mut rng = ChaCha8Rng::seed_from_u64(7);
            pf.predict(|p| vec![p[0] + 1.0], &[0.5], &mut rng);
            pf.particles.clone()
        };
        let a = run();
        let b = run();
        assert_eq!(a, b, "same seed must reproduce the propagation");
        // Each particle moved ~ +1 from its start (within a few sigma of the noise).
        assert!((a[0][0] - 1.0).abs() < 3.0 && (a[1][0] - 11.0).abs() < 3.0);
    }
}
