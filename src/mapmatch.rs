// SPDX-License-Identifier: Apache-2.0
//! Map-matching measurement model for terrain-/gravity-referenced navigation.
//!
//! The measurement model that turns the [`crate::particle_filter`] into a working
//! GPS-denied navigator: each particle predicts the value of a georeferenced reference
//! field — terrain elevation (terrain-referenced navigation, TRN) or a gravity anomaly
//! (gravity-map matching) — at its own position, and is reweighted by how well that
//! prediction matches the value the vehicle's sensor (radar/baro altimeter, gravimeter)
//! actually measured. Over a distinctive patch of field the particle cloud collapses onto
//! the true position, providing a fix without GNSS.
//!
//! The field is any `Fn(lat, lon) -> value` sampler, so it composes with the bilinear grid
//! in [`crate::ionex`] (reusable as a generic 2-D field) or a closure. Scope (honest): the
//! real reference maps (SRTM elevation, EGM/EIGEN gravity anomaly) and their loaders are
//! follow-ons (see `ROADMAP.md`).

/// Gaussian likelihood that a `predicted` field value explains the `measured` value under
/// measurement noise `sigma`: `exp(−½·((predicted − measured)/σ)²)`. Unit at a perfect
/// match, falling off with the mismatch.
pub fn field_likelihood(predicted: f64, measured: f64, sigma: f64) -> f64 {
    let z = (predicted - measured) / sigma;
    (-0.5 * z * z).exp()
}

/// Map-match likelihood for a particle at `(lat, lon)`: sample the reference `field` there
/// and compare to the `measured` value. Suitable as the per-particle likelihood the
/// particle filter's `update` reweights by.
pub fn map_match_likelihood<S>(field: S, lat: f64, lon: f64, measured: f64, sigma: f64) -> f64
where
    S: Fn(f64, f64) -> f64,
{
    field_likelihood(field(lat, lon), measured, sigma)
}

#[cfg(test)]
mod tests {
    use super::*;
    use crate::particle_filter::ParticleFilter;

    #[test]
    fn likelihood_peaks_at_a_perfect_match() {
        assert!((field_likelihood(100.0, 100.0, 5.0) - 1.0).abs() < 1e-12);
        // One sigma off ⇒ e^(−1/2) ≈ 0.6065.
        assert!((field_likelihood(105.0, 100.0, 5.0) - (-0.5_f64).exp()).abs() < 1e-12);
        // Far off ⇒ negligible.
        assert!(field_likelihood(140.0, 100.0, 5.0) < 1e-6);
    }

    #[test]
    fn terrain_match_recovers_position_with_a_particle_filter() {
        // A distinctive synthetic terrain: a single Gaussian "hill" centred at (2, 3).
        let terrain = |lat: f64, lon: f64| {
            1000.0 * (-((lat - 2.0).powi(2) + (lon - 3.0).powi(2)) / 0.5).exp()
        };
        let truth = (2.0, 3.0);
        let measured = terrain(truth.0, truth.1);

        // A deterministic grid of candidate positions over the patch.
        let mut particles = Vec::new();
        for i in 0..41 {
            for j in 0..41 {
                particles.push(vec![0.0 + 0.1 * i as f64, 1.0 + 0.1 * j as f64]);
            }
        }
        let mut pf = ParticleFilter::new(particles);
        pf.update(|p| map_match_likelihood(terrain, p[0], p[1], measured, 50.0));
        let est = pf.estimate();
        assert!((est[0] - truth.0).abs() < 0.1, "lat = {}", est[0]);
        assert!((est[1] - truth.1).abs() < 0.1, "lon = {}", est[1]);
    }
}
