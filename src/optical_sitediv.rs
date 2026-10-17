// SPDX-License-Identifier: AGPL-3.0-only
//! **Site diversity** for an optical ground network: availability of `N` spatially separated
//! stations whose weather is correlated through distance.
//!
//! Outage of site `i` is the event `Z_i > z_i`, `z_i = Φ⁻¹(a_i)`, where the latent weather
//! variables follow a **one-factor Gaussian copula**:
//! `Z_i = ℓ_i Y + √(1−ℓ_i²) ε_i`, with `Y` the shared synoptic weather and `ε_i` local. The
//! loading is set from the pairwise correlation `ρ_ij = exp(−d_ij/d₀)` of the stations (distance
//! `d_ij`, decorrelation length `d₀`): `ℓ_i² = mean_{j≠i} ρ_ij`. The network is down only when every
//! site is down, so `A = 1 − ∫ φ(y) Π_i [1 − Φ((z_i − ℓ_i y)/√(1−ℓ_i²))] dy` (Simpson, deterministic).
//!
//! Exact limits: `ρ = 0` is the independent union `1 − Π(1−a_i)`; `ρ = 1` is the best single site
//! (and the single-site availability for identical sites); `A` is non-decreasing in the number of
//! sites and non-increasing in `ρ`. Away from the exact limits the result carries the ≈1e-9 accuracy of
//! the probit `Φ⁻¹` ([`crate::detection::normal_inv_cdf`]). The decorrelation length `d₀` and the copula
//! are **Modelled**.

use crate::detection::{normal_cdf, normal_inv_cdf};
use crate::portable_math::PortableFloat;

const Y_INTERVALS: usize = 4_000;
const Y_LIMIT: f64 = 9.0;
const EARTH_RADIUS_KM: f64 = 6_371.0088;

/// Great-circle distance (km) between two points (degrees).
pub fn great_circle_km(lat1_deg: f64, lon1_deg: f64, lat2_deg: f64, lon2_deg: f64) -> f64 {
    let (p1, p2) = (lat1_deg.to_radians(), lat2_deg.to_radians());
    let dl = (lon2_deg - lon1_deg).to_radians();
    let a = ((p2 - p1) / 2.0).psin().ppowi(2) + p1.pcos() * p2.pcos() * (dl / 2.0).psin().ppowi(2);
    2.0 * EARTH_RADIUS_KM * a.sqrt().min(1.0).pasin()
}

/// Pairwise correlation matrix `ρ_ij = exp(−d_ij/d₀)` of stations at `(lat, lon)` degrees.
pub fn correlation_matrix(sites: &[(f64, f64)], decorrelation_km: f64) -> Vec<Vec<f64>> {
    let n = sites.len();
    let mut m = vec![vec![1.0; n]; n];
    for i in 0..n {
        for j in 0..n {
            if i != j {
                let d = great_circle_km(sites[i].0, sites[i].1, sites[j].0, sites[j].1);
                m[i][j] = (-d / decorrelation_km).pexp();
            }
        }
    }
    m
}

/// Independent-union availability `1 − Π(1 − a_i)`.
pub fn independent_union(avail: &[f64]) -> f64 {
    1.0 - avail.iter().map(|a| 1.0 - a).product::<f64>()
}

/// Network availability under the one-factor Gaussian copula with correlation matrix `rho`.
pub fn network_availability(avail: &[f64], rho: &[Vec<f64>]) -> f64 {
    let n = avail.len();
    if n == 0 {
        return 0.0;
    }
    if n == 1 {
        return avail[0];
    }
    if avail.iter().any(|&a| a >= 1.0) {
        return 1.0;
    }
    let all_one = (0..n).all(|i| (0..n).all(|j| i == j || rho[i][j] >= 1.0));
    if all_one {
        return avail.iter().cloned().fold(0.0, f64::max);
    }
    let live: Vec<usize> = (0..n).filter(|&i| avail[i] > 0.0).collect();
    if live.is_empty() {
        return 0.0;
    }
    let z: Vec<f64> = (0..n).map(|i| normal_inv_cdf(avail[i])).collect();
    let load: Vec<f64> = (0..n)
        .map(|i| {
            let m = (0..n).filter(|&j| j != i).map(|j| rho[i][j]).sum::<f64>() / (n - 1) as f64;
            m.clamp(0.0, 1.0).sqrt().min(1.0 - 1e-9)
        })
        .collect();
    if load.iter().all(|&l| l == 0.0) {
        // no shared weather: the model is exactly the independent union
        return independent_union(avail);
    }
    let h = 2.0 * Y_LIMIT / Y_INTERVALS as f64;
    let f = |y: f64| {
        let phi = (-0.5 * y * y).pexp() / (2.0 * std::f64::consts::PI).sqrt();
        let all_down: f64 = live
            .iter()
            .map(|&i| 1.0 - normal_cdf((z[i] - load[i] * y) / (1.0 - load[i] * load[i]).sqrt()))
            .product();
        phi * all_down
    };
    let mut sum = f(-Y_LIMIT) + f(Y_LIMIT);
    for k in 1..Y_INTERVALS {
        let c = if k % 2 == 1 { 4.0 } else { 2.0 };
        sum += c * f(-Y_LIMIT + h * k as f64);
    }
    (1.0 - sum * h / 3.0).clamp(0.0, 1.0)
}

/// Uniform-correlation matrix (every off-diagonal `rho`), for the limit checks.
pub fn uniform_correlation(n: usize, rho: f64) -> Vec<Vec<f64>> {
    (0..n)
        .map(|i| (0..n).map(|j| if i == j { 1.0 } else { rho }).collect())
        .collect()
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn limits_and_monotonicity() {
        let a = [0.6, 0.7, 0.5, 0.65];
        let ind = independent_union(&a);
        assert!((network_availability(&a, &uniform_correlation(4, 0.0)) - ind).abs() < 1e-12);
        let same = [0.62; 3];
        assert_eq!(
            network_availability(&same, &uniform_correlation(3, 1.0)),
            0.62
        );
        let mut prev = 1.0;
        for r in [0.0, 0.2, 0.5, 0.8, 0.95] {
            let v = network_availability(&a, &uniform_correlation(4, r));
            assert!(v <= prev + 1e-12, "rho {r}: {v} > {prev}");
            assert!(v >= a[1] - 1e-9);
            prev = v;
        }
        let mut prev = 0.0;
        for n in 1..=4 {
            let v = network_availability(&a[..n], &uniform_correlation(n, 0.4));
            assert!(v >= prev - 1e-12);
            prev = v;
        }
    }

    #[test]
    fn distance_decorrelates() {
        // two sites 5000 km apart are nearly independent for d0 = 500 km
        let m = correlation_matrix(&[(50.0, 10.0), (50.0, 80.0)], 500.0);
        assert!(m[0][1] < 1e-3);
        let near = correlation_matrix(&[(50.0, 10.0), (50.0, 10.5)], 500.0);
        assert!(near[0][1] > 0.9);
        assert!((great_circle_km(0.0, 0.0, 0.0, 90.0) - 10_007.54).abs() < 1.0);
    }
}
