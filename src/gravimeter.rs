// SPDX-License-Identifier: Apache-2.0
//! Cold-atom gravimeter measurement model and a spherical-harmonic gravity-anomaly
//! reference field for **gravity-map-matching navigation** (GPS-denied alt-PNT).
//!
//! This is the alt-PNT capability layer ESA NAVISP's *Quantum Wayfarer* and QT-CCI
//! gravity-map-matching studies call for: a vehicle carrying an inertial unit and a
//! quantum (cold-atom-interferometer) gravimeter, navigating without GNSS by matching
//! the gravity-anomaly *signature it flies through* against a stored reference map. It
//! composes three pieces already in the tree:
//!
//! 1. [`crate::inertial::quantum_imu::CaiAccelerometer`] — the CAI physics that fixes
//!    the gravimeter's white-noise floor (a gravimeter is a CAI accelerometer measuring
//!    `g` over an averaging time);
//! 2. [`GravityAnomalyModel`] — the reference field, evaluated here as a low-degree,
//!    fully-normalised spherical-harmonic synthesis of the gravity anomaly plus optional
//!    localized anomalies (mascons);
//! 3. [`crate::mapmatch`] + [`crate::particle_filter`] — the map-matching particle
//!    filter that collapses the position uncertainty onto the true track.
//!
//! ## Scope (honest)
//!
//! The spherical-harmonic synthesis is **correct geodesy at low degree** (validated below
//! against the closed-form normalised Legendre functions and a hand-derived single-term
//! anomaly), but Kshana **does not bundle the full EGM2008 2190×2190 coefficient set** —
//! the regional trend comes from a handful of well-known low-degree coefficients, and the
//! distinctive *local* features that make gravity-map matching observable are supplied as
//! synthetic mascons (Gaussian anomalies), the stand-in for the high-degree EGM content
//! not shipped. Loading a real EGM2008/EIGEN coefficient file, a magnetic-anomaly map, and
//! terrain-aided SLAM remain follow-ons; so does wiring the benchmark into the global
//! scenario-engine `kind=` dispatcher with an SVG drift chart. See `docs/CAPABILITY.md`.

use crate::inertial::quantum_imu::CaiAccelerometer;
use crate::mapmatch::{hierarchical_offset_search, map_match_likelihood};
use crate::particle_filter::ParticleFilter;
use rand::SeedableRng;
use rand_chacha::ChaCha8Rng;
use rand_distr::{Distribution, Normal};
use serde::Deserialize;

/// Earth gravitational parameter `GM` (m³/s², WGS-84/EGM).
const GM_EARTH: f64 = 3.986_004_418e14;
/// Earth reference radius `R` (m, WGS-84 semi-major).
const R_EARTH: f64 = 6_378_137.0;
/// Metres per degree of latitude (spherical approximation, `π·R/180`). `pub(crate)` so the
/// alt-PNT navigators in [`crate::altpnt`] reuse the identical constant rather than
/// re-defining it (a divergent copy would be a silent unit bug).
pub(crate) const M_PER_DEG: f64 = 111_319.490_793_27;

/// One milligal in SI units (m/s²). `1 Gal = 0.01 m/s²`, so `1 mGal = 1e-5 m/s²`.
pub const MGAL: f64 = 1.0e-5;

// ---------------------------------------------------------------------------
// Fully-normalised associated Legendre functions P̄ₙₘ(sin φ)
// ---------------------------------------------------------------------------

/// Fully-normalised associated Legendre functions `P̄ₙₘ(t)` with `t = sin φ`, for all
/// `0 ≤ m ≤ n ≤ nmax`, returned as `p[n][m]`.
///
/// Built from the unnormalised Ferrers functions `Pₙₘ` via the standard recurrences and
/// then scaled by the geodesy normalisation `N̄ₙₘ = √((2−δ₀ₘ)(2n+1)(n−m)!/(n+m)!)`. This
/// "unnormalised recurrence × explicit factor" route is chosen because every low-degree
/// term has a textbook closed form to check against (see the unit tests):
/// `P̄₁₁ = √3·cos φ`, `P̄₂₀ = (√5/2)(3sin²φ−1)`, `P̄₂₂ = (√15/2)cos²φ`.
// The recurrences are inherently index-based (Pₙₘ depends on Pₙ₋₁,ₘ and Pₙ₋₂,ₘ), so the
// `0..=n` loops read clearer than iterator gymnastics over a triangular table.
#[allow(clippy::needless_range_loop)]
fn normalized_legendre(nmax: usize, t: f64) -> Vec<Vec<f64>> {
    let u = (1.0 - t * t).max(0.0).sqrt(); // cos φ ≥ 0 for φ ∈ [−90°, 90°]
    let mut p = vec![vec![0.0_f64; nmax + 1]; nmax + 1];
    p[0][0] = 1.0;
    // Sectorial: Pₘₘ = (2m−1)·u·Pₘ₋₁,ₘ₋₁  (so Pₘₘ = (2m−1)!!·uᵐ).
    for m in 1..=nmax {
        p[m][m] = (2 * m - 1) as f64 * u * p[m - 1][m - 1];
    }
    // First sub-diagonal: Pₘ₊₁,ₘ = t·(2m+1)·Pₘₘ.
    for m in 0..nmax {
        p[m + 1][m] = t * (2 * m + 1) as f64 * p[m][m];
    }
    // General column recurrence:
    // Pₙₘ = [ (2n−1)·t·Pₙ₋₁,ₘ − (n+m−1)·Pₙ₋₂,ₘ ] / (n−m).
    for m in 0..=nmax {
        for n in (m + 2)..=nmax {
            p[n][m] = ((2 * n - 1) as f64 * t * p[n - 1][m] - (n + m - 1) as f64 * p[n - 2][m])
                / (n - m) as f64;
        }
    }
    // Normalise in place.
    let mut pbar = vec![vec![0.0_f64; nmax + 1]; nmax + 1];
    for n in 0..=nmax {
        for m in 0..=n {
            let delta = if m == 0 { 1.0 } else { 2.0 };
            // (n−m)!/(n+m)! = 1 / ∏_{k=n−m+1}^{n+m} k.
            let mut ratio = 1.0_f64;
            for k in (n - m + 1)..=(n + m) {
                ratio /= k as f64;
            }
            let norm = (delta * (2 * n + 1) as f64 * ratio).sqrt();
            pbar[n][m] = norm * p[n][m];
        }
    }
    pbar
}

// ---------------------------------------------------------------------------
// Gravity-anomaly reference field
// ---------------------------------------------------------------------------

/// A localized Gaussian gravity anomaly ("mascon"): the synthetic stand-in for the
/// high-degree EGM content Kshana does not bundle, used to give a map-matching benchmark a
/// distinctive, well-conditioned local signature.
#[derive(Clone, Copy, Debug, Deserialize)]
pub struct Mascon {
    /// Centre latitude (degrees).
    pub lat_deg: f64,
    /// Centre longitude (degrees).
    pub lon_deg: f64,
    /// Peak amplitude (mGal).
    pub amp_mgal: f64,
    /// Gaussian 1σ width (degrees of arc).
    pub sigma_deg: f64,
}

/// A spherical-harmonic gravity-anomaly model evaluated on the reference sphere `r = R`,
/// plus optional [`Mascon`] features. Coefficients are the *anomalous* fully-normalised
/// `C̄ₙₘ`, `S̄ₙₘ` (i.e. relative to the reference ellipsoid, so the even-zonal `J₂`, `J₄`
/// reference field is already removed and degree-2 terms are the disturbing field).
#[derive(Clone, Debug)]
pub struct GravityAnomalyModel {
    nmax: usize,
    cbar: Vec<Vec<f64>>,
    sbar: Vec<Vec<f64>>,
    mascons: Vec<Mascon>,
}

impl GravityAnomalyModel {
    /// An empty model (zero field) up to degree/order `nmax`.
    pub fn new(nmax: usize) -> Self {
        Self {
            nmax,
            cbar: vec![vec![0.0; nmax + 1]; nmax + 1],
            sbar: vec![vec![0.0; nmax + 1]; nmax + 1],
            mascons: Vec::new(),
        }
    }

    /// Set the normalised anomalous coefficients `C̄ₙₘ`, `S̄ₙₘ` for degree `n`, order `m`.
    pub fn set_coeff(&mut self, n: usize, m: usize, cbar: f64, sbar: f64) {
        if n <= self.nmax && m <= n {
            self.cbar[n][m] = cbar;
            self.sbar[n][m] = sbar;
        }
    }

    /// Add a localized Gaussian anomaly.
    pub fn add_mascon(&mut self, m: Mascon) {
        self.mascons.push(m);
    }

    /// Gravity anomaly Δg (mGal) at geocentric latitude/longitude (radians) on the
    /// reference sphere `r = R`:
    ///
    /// `Δg = (GM/R²) · Σₙ₌₂ᴺ (n−1) · Σₘ (C̄ₙₘ cos mλ + S̄ₙₘ sin mλ) · P̄ₙₘ(sin φ)`
    ///
    /// plus the sum of the Gaussian mascons.
    // Indexing the parallel C̄/S̄/P̄ tables by (n, m) is clearer than zipping three
    // triangular arrays.
    #[allow(clippy::needless_range_loop)]
    pub fn anomaly_mgal(&self, lat_rad: f64, lon_rad: f64) -> f64 {
        let t = lat_rad.sin();
        let pbar = normalized_legendre(self.nmax, t);
        let mut sum = 0.0;
        for n in 2..=self.nmax {
            let scale = (n as f64) - 1.0;
            for m in 0..=n {
                let ml = (m as f64) * lon_rad;
                let trig = self.cbar[n][m] * ml.cos() + self.sbar[n][m] * ml.sin();
                sum += scale * trig * pbar[n][m];
            }
        }
        let mut anom = (GM_EARTH / (R_EARTH * R_EARTH)) * sum / MGAL;

        let lat_deg = lat_rad.to_degrees();
        let lon_deg = lon_rad.to_degrees();
        let cos_lat = lat_rad.cos();
        for ms in &self.mascons {
            let dlat = lat_deg - ms.lat_deg;
            let dlon = (lon_deg - ms.lon_deg) * cos_lat; // metric east-west scaling
            let r2 = (dlat * dlat + dlon * dlon) / (2.0 * ms.sigma_deg * ms.sigma_deg);
            anom += ms.amp_mgal * (-r2).exp();
        }
        anom
    }

    /// Field sampler in **degrees** matching the `Fn(lat, lon) -> value` signature
    /// [`crate::mapmatch::map_match_likelihood`] expects.
    pub fn sampler_deg(&self) -> impl Fn(f64, f64) -> f64 + '_ {
        move |lat_deg: f64, lon_deg: f64| {
            self.anomaly_mgal(lat_deg.to_radians(), lon_deg.to_radians())
        }
    }
}

// ---------------------------------------------------------------------------
// Cold-atom gravimeter measurement model
// ---------------------------------------------------------------------------

/// A cold-atom gravimeter: a CAI accelerometer pointed at local gravity. Its white
/// measurement-noise floor is fixed by the interferometer's acceleration ASD and the
/// averaging time; a static bias models the residual systematic offset.
#[derive(Clone, Copy, Debug)]
pub struct Gravimeter {
    /// Acceleration amplitude spectral density (m/s²/√Hz).
    asd_si: f64,
    /// Static measurement bias (mGal).
    bias_mgal: f64,
}

impl Gravimeter {
    /// A gravimeter with an explicit acceleration ASD (m/s²/√Hz) and bias (mGal).
    pub fn new(asd_si: f64, bias_mgal: f64) -> Self {
        Self { asd_si, bias_mgal }
    }

    /// A gravimeter whose noise floor is derived from a [`CaiAccelerometer`]'s ASD.
    pub fn from_cai(sensor: &CaiAccelerometer, bias_mgal: f64) -> Self {
        Self::new(sensor.accel_asd(), bias_mgal)
    }

    /// 1σ white measurement noise (mGal) after averaging for `tau_s`: a white-ASD sensor
    /// averages down as `σ = ASD/√τ`.
    pub fn measurement_sigma_mgal(&self, tau_s: f64) -> f64 {
        if tau_s <= 0.0 {
            return f64::INFINITY;
        }
        (self.asd_si / tau_s.sqrt()) / MGAL
    }

    /// A measured anomaly (mGal): truth + static bias + a caller-supplied noise sample.
    /// Noise is injected by the caller (deterministic in tests) rather than drawn here.
    pub fn measure(&self, true_anomaly_mgal: f64, noise_sample_mgal: f64) -> f64 {
        true_anomaly_mgal + self.bias_mgal + noise_sample_mgal
    }
}

// ---------------------------------------------------------------------------
// Gravity-map-matching navigation benchmark
// ---------------------------------------------------------------------------

/// One gravity-anomaly coefficient, for the benchmark TOML.
#[derive(Clone, Copy, Debug, Deserialize)]
pub struct CoeffEntry {
    /// Degree n.
    pub n: usize,
    /// Order m.
    pub m: usize,
    /// Normalised cosine coefficient.
    pub cbar: f64,
    /// Normalised sine coefficient.
    pub sbar: f64,
}

/// Benchmark configuration (deserialised from `scenarios/gravity-map-nav.toml`).
#[derive(Clone, Debug, Deserialize)]
pub struct GravityMapBenchmarkCfg {
    /// Maximum spherical-harmonic degree/order of the reference field.
    pub nmax: usize,
    /// Low-degree anomalous coefficients (regional trend).
    #[serde(default)]
    pub coeffs: Vec<CoeffEntry>,
    /// Localized Gaussian anomalies (the high-degree stand-in).
    #[serde(default)]
    pub mascons: Vec<Mascon>,
    /// Track start latitude / longitude (degrees).
    pub start_lat_deg: f64,
    /// Track start longitude (degrees).
    pub start_lon_deg: f64,
    /// Per-waypoint latitude / longitude step (degrees) — an oblique leg samples the
    /// anomaly gradient in both axes so a single scalar measurement sequence is 2-D
    /// observable.
    pub step_lat_deg: f64,
    /// Per-waypoint longitude step (degrees).
    pub step_lon_deg: f64,
    /// Number of waypoints flown GPS-denied.
    pub waypoints: usize,
    /// True constant INS position-drift error over the outage (degrees lat, lon).
    pub drift_lat_deg: f64,
    /// True constant INS position-drift error, longitude component (degrees).
    pub drift_lon_deg: f64,
    /// Gravimeter acceleration ASD (m/s²/√Hz).
    pub gravimeter_asd: f64,
    /// Per-waypoint gravimeter averaging time (s).
    pub averaging_time_s: f64,
    /// Map/representation error (mGal): the reference field is never exact, and the
    /// candidate grid quantises position — both enter the matching budget alongside the
    /// gravimeter white noise. The effective matching σ is `hypot(sensor σ, this)`.
    pub map_sigma_mgal: f64,
    /// Half-width of the offset search grid (degrees).
    pub search_half_deg: f64,
    /// Offset search-grid step (degrees).
    pub search_step_deg: f64,
    /// Number of coarse-to-fine refinement stages for the offset search. `1` (the default)
    /// is the original single-grid behaviour; each extra stage recentres on the running
    /// estimate and shrinks the window and step by [`Self::refine_factor`], buying sub-grid
    /// resolution without an intractably fine single grid. Used by
    /// [`run_gps_denied_gravity_nav`]; [`run_gravity_map_benchmark`] ignores it.
    #[serde(default = "default_refine_stages")]
    pub refine_stages: usize,
    /// Per-stage shrink factor applied to the refinement window half-width and step.
    #[serde(default = "default_refine_factor")]
    pub refine_factor: f64,
    /// Seed for the deterministic gravimeter measurement-noise sequence injected by
    /// [`run_gps_denied_gravity_nav`] (per-seed reproducible; vary it to sweep realisations).
    #[serde(default)]
    pub noise_seed: u64,
}

fn default_refine_stages() -> usize {
    1
}

fn default_refine_factor() -> f64 {
    8.0
}

/// Result of the gravity-map-matching benchmark.
#[derive(Clone, Copy, Debug)]
pub struct GravityMapNavResult {
    /// Position error of the unaided inertial solution at end of the outage (m) — the
    /// magnitude of the true INS drift.
    pub free_inertial_drift_m: f64,
    /// Position error after gravity-map matching (m).
    pub map_matched_error_m: f64,
    /// Gravimeter 1σ measurement noise used (mGal).
    pub measurement_sigma_mgal: f64,
}

/// Run the gravity-map-matching benchmark.
///
/// A vehicle flies a known-shape oblique track GPS-denied. Its inertial solution has
/// accumulated a constant, unknown position offset `d` (the drift). At each waypoint the
/// quantum gravimeter measures the local gravity anomaly. A particle filter searches over
/// candidate offsets `δ`: each candidate hypothesises the true positions as
/// `(INS-reported − δ)` and predicts the anomaly there; the product likelihood over the
/// waypoint sequence peaks when `δ = d`. The matched solution's residual error is reported
/// against the unaided drift.
pub fn run_gravity_map_benchmark(cfg: &GravityMapBenchmarkCfg) -> GravityMapNavResult {
    // Reference field.
    let mut model = GravityAnomalyModel::new(cfg.nmax);
    for c in &cfg.coeffs {
        model.set_coeff(c.n, c.m, c.cbar, c.sbar);
    }
    for m in &cfg.mascons {
        model.add_mascon(*m);
    }
    let field = model.sampler_deg();

    // Gravimeter white-noise floor, combined with the map/representation error into the
    // effective matching σ used by the likelihood.
    let grav = Gravimeter::new(cfg.gravimeter_asd, 0.0);
    let sensor_sigma = grav.measurement_sigma_mgal(cfg.averaging_time_s);
    let sigma_mgal = (sensor_sigma * sensor_sigma + cfg.map_sigma_mgal * cfg.map_sigma_mgal).sqrt();

    // True track and the gravimeter measurements taken along it (noise-free truth — the
    // benchmark isolates geometric observability, not a Monte-Carlo noise realisation).
    let truth: Vec<(f64, f64)> = (0..cfg.waypoints)
        .map(|k| {
            (
                cfg.start_lat_deg + cfg.step_lat_deg * k as f64,
                cfg.start_lon_deg + cfg.step_lon_deg * k as f64,
            )
        })
        .collect();
    let measured: Vec<f64> = truth.iter().map(|&(la, lo)| field(la, lo)).collect();

    // INS-reported positions carry the true constant drift d.
    let ins: Vec<(f64, f64)> = truth
        .iter()
        .map(|&(la, lo)| (la + cfg.drift_lat_deg, lo + cfg.drift_lon_deg))
        .collect();

    // Candidate-offset grid δ (centred on zero — the filter's prior is "no drift").
    let mut particles = Vec::new();
    let n_side = (cfg.search_half_deg / cfg.search_step_deg).round() as i64;
    for i in -n_side..=n_side {
        for j in -n_side..=n_side {
            particles.push(vec![
                i as f64 * cfg.search_step_deg,
                j as f64 * cfg.search_step_deg,
            ]);
        }
    }
    let mut pf = ParticleFilter::new(particles);

    // Reweight by the product likelihood over the whole measurement sequence.
    pf.update(|delta| {
        let mut like = 1.0;
        for (k, &(la, lo)) in ins.iter().enumerate() {
            // Hypothesised true position = INS-reported − δ.
            let hlat = la - delta[0];
            let hlon = lo - delta[1];
            like *= map_match_likelihood(&field, hlat, hlon, measured[k], sigma_mgal);
        }
        like
    });
    let est = pf.estimate(); // δ̂ (degrees lat, lon)

    // Representative latitude for the east-west metric scale.
    let mid_lat = cfg.start_lat_deg + cfg.step_lat_deg * (cfg.waypoints as f64 - 1.0) / 2.0;
    let cos_lat = mid_lat.to_radians().cos();
    let to_m = |dlat: f64, dlon: f64| {
        let north = dlat * M_PER_DEG;
        let east = dlon * M_PER_DEG * cos_lat;
        (north * north + east * east).sqrt()
    };

    let free_inertial_drift_m = to_m(cfg.drift_lat_deg, cfg.drift_lon_deg);
    // Residual = (true drift − estimated offset), i.e. the position error the matched
    // solution still carries.
    let map_matched_error_m = to_m(cfg.drift_lat_deg - est[0], cfg.drift_lon_deg - est[1]);

    GravityMapNavResult {
        free_inertial_drift_m,
        map_matched_error_m,
        measurement_sigma_mgal: sigma_mgal,
    }
}

/// Run the full **60-minute GPS-denied** gravity-map-matching benchmark.
///
/// This is the harder, validation-grade form of [`run_gravity_map_benchmark`] and the
/// capability target of ESA NAVISP's *Quantum Wayfarer* gravity-aided alt-PNT: a vehicle
/// flies a long known-shape track with **no GNSS**, its inertial solution carrying an
/// unknown constant position drift `d`. A quantum (cold-atom) gravimeter samples the local
/// gravity anomaly at each waypoint; the samples carry the sensor's real white-noise floor,
/// injected here as a **deterministic, seeded** Gaussian sequence (so the matcher is never
/// handed noise-free truth, yet the test is exactly reproducible). The offset is recovered
/// by a **hierarchical coarse-to-fine** particle/grid search: stage 1 sweeps the full
/// `±search_half_deg` window at `search_step_deg`; each later stage recentres on the running
/// estimate and shrinks the window and step by `refine_factor`, so the final offset
/// resolution is `search_step_deg / refine_factor^(refine_stages−1)` — sub-grid accuracy
/// without an intractably fine single grid.
///
/// Returns the unaided inertial drift (which, for the committed scenario, exceeds 10 km) and
/// the matched residual (which falls below a few hundred metres).
///
/// ## Scope (honest)
///
/// The injected noise is the gravimeter's white **sensor** floor; the matching `σ` also
/// budgets a map representation-error term ([`GravityMapBenchmarkCfg::map_sigma_mgal`]), but
/// a full Monte-Carlo over map-error *realisations* — perturbing the stored map away from the
/// truth field — and a real EGM2008/EIGEN coefficient map are follow-ons (see
/// `docs/CAPABILITY.md`). The reference field here is the low-degree spherical-harmonic trend
/// plus synthetic mascons validated in this module's unit tests.
pub fn run_gps_denied_gravity_nav(cfg: &GravityMapBenchmarkCfg) -> GravityMapNavResult {
    let mut model = GravityAnomalyModel::new(cfg.nmax);
    for c in &cfg.coeffs {
        model.set_coeff(c.n, c.m, c.cbar, c.sbar);
    }
    for m in &cfg.mascons {
        model.add_mascon(*m);
    }
    let field = model.sampler_deg();

    // Gravimeter white-noise floor; the matching σ additionally budgets the map error.
    let grav = Gravimeter::new(cfg.gravimeter_asd, 0.0);
    let sensor_sigma = grav.measurement_sigma_mgal(cfg.averaging_time_s);
    let sigma_mgal = (sensor_sigma * sensor_sigma + cfg.map_sigma_mgal * cfg.map_sigma_mgal).sqrt();

    // The GPS-denied track and the noisy gravimeter samples taken along it.
    let truth: Vec<(f64, f64)> = (0..cfg.waypoints)
        .map(|k| {
            (
                cfg.start_lat_deg + cfg.step_lat_deg * k as f64,
                cfg.start_lon_deg + cfg.step_lon_deg * k as f64,
            )
        })
        .collect();
    let mut rng = ChaCha8Rng::seed_from_u64(cfg.noise_seed);
    let noise = Normal::new(0.0, sensor_sigma.max(f64::MIN_POSITIVE)).unwrap();
    let measured: Vec<f64> = truth
        .iter()
        .map(|&(la, lo)| field(la, lo) + noise.sample(&mut rng))
        .collect();

    // INS-reported positions carry the true constant drift d.
    let ins: Vec<(f64, f64)> = truth
        .iter()
        .map(|&(la, lo)| (la + cfg.drift_lat_deg, lo + cfg.drift_lon_deg))
        .collect();

    // Product likelihood over the whole waypoint sequence for a candidate offset δ.
    let weigh = |delta: &[f64]| -> f64 {
        let mut like = 1.0;
        for (k, &(la, lo)) in ins.iter().enumerate() {
            like *= map_match_likelihood(
                &field,
                la - delta[0],
                lo - delta[1],
                measured[k],
                sigma_mgal,
            );
        }
        like
    };

    // Hierarchical coarse-to-fine offset search (one shared implementation in `mapmatch`).
    let est = hierarchical_offset_search(
        weigh,
        cfg.search_half_deg,
        cfg.search_step_deg,
        cfg.refine_stages,
        cfg.refine_factor,
    );

    let mid_lat = cfg.start_lat_deg + cfg.step_lat_deg * (cfg.waypoints as f64 - 1.0) / 2.0;
    let cos_lat = mid_lat.to_radians().cos();
    let to_m = |dlat: f64, dlon: f64| {
        let north = dlat * M_PER_DEG;
        let east = dlon * M_PER_DEG * cos_lat;
        (north * north + east * east).sqrt()
    };

    GravityMapNavResult {
        free_inertial_drift_m: to_m(cfg.drift_lat_deg, cfg.drift_lon_deg),
        map_matched_error_m: to_m(cfg.drift_lat_deg - est[0], cfg.drift_lon_deg - est[1]),
        measurement_sigma_mgal: sigma_mgal,
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn normalized_legendre_matches_closed_forms_at_the_equator() {
        // At the equator sin φ = 0, cos φ = 1.
        let p = normalized_legendre(2, 0.0);
        assert!((p[0][0] - 1.0).abs() < 1e-12);
        assert!((p[1][1] - 3.0_f64.sqrt()).abs() < 1e-12); // √3·cos φ
        assert!(p[1][0].abs() < 1e-12); // √3·sin φ = 0
                                        // P̄₂₀ = (√5/2)(3sin²φ − 1) = −√5/2 at the equator.
        assert!((p[2][0] + (5.0_f64.sqrt() / 2.0)).abs() < 1e-12);
        assert!(p[2][1].abs() < 1e-12); // √15·sin φ·cos φ = 0
                                        // P̄₂₂ = (√15/2)cos²φ = √15/2.
        assert!((p[2][2] - 15.0_f64.sqrt() / 2.0).abs() < 1e-12);
    }

    #[test]
    fn normalized_legendre_matches_closed_forms_off_equator() {
        let phi = 30.0_f64.to_radians();
        let (t, u) = (phi.sin(), phi.cos()); // 0.5, √3/2
        let p = normalized_legendre(2, t);
        assert!((p[1][0] - 3.0_f64.sqrt() * t).abs() < 1e-12);
        assert!((p[1][1] - 3.0_f64.sqrt() * u).abs() < 1e-12);
        assert!((p[2][0] - (5.0_f64.sqrt() / 2.0) * (3.0 * t * t - 1.0)).abs() < 1e-12);
        assert!((p[2][1] - 15.0_f64.sqrt() * t * u).abs() < 1e-12);
        assert!((p[2][2] - (15.0_f64.sqrt() / 2.0) * u * u).abs() < 1e-12);
    }

    #[test]
    fn single_term_anomaly_matches_a_hand_derived_value() {
        // Only C̄₂₂ = 1e-6; at the equator (φ = 0), λ = 0:
        //   Δg = (GM/R²)·(2−1)·C̄₂₂·cos(0)·P̄₂₂(0)
        //      = 9.798286 m/s² · 1e-6 · (√15/2)
        //      = 9.798286 · 1.9364917e-6  = 1.89744e-5 m/s²  = 1.89744 mGal.
        let mut model = GravityAnomalyModel::new(2);
        model.set_coeff(2, 2, 1.0e-6, 0.0);
        let dg = model.anomaly_mgal(0.0, 0.0);
        let gm_over_r2 = GM_EARTH / (R_EARTH * R_EARTH);
        let expected = gm_over_r2 * 1.0e-6 * (15.0_f64.sqrt() / 2.0) / MGAL;
        assert!((expected - 1.897_44).abs() < 1e-3, "hand value {expected}");
        assert!((dg - expected).abs() < 1e-9, "dg = {dg}");

        // The S̄₂₂ term rotates the pattern by 45°/m in longitude: at λ = 45° the cos(2λ)
        // term vanishes, so a pure C̄₂₂ field is zero there.
        let dg_quarter = model.anomaly_mgal(0.0, 45.0_f64.to_radians());
        assert!(dg_quarter.abs() < 1e-9, "dg(45°) = {dg_quarter}");
    }

    #[test]
    fn mascon_adds_its_peak_at_its_centre() {
        let mut model = GravityAnomalyModel::new(2);
        model.add_mascon(Mascon {
            lat_deg: 10.0,
            lon_deg: 20.0,
            amp_mgal: 30.0,
            sigma_deg: 0.4,
        });
        // At the centre the Gaussian is exactly its amplitude (field has no SH part here).
        let at_centre = model.anomaly_mgal(10.0_f64.to_radians(), 20.0_f64.to_radians());
        assert!((at_centre - 30.0).abs() < 1e-9, "centre = {at_centre}");
        // One σ away (north) it falls to amp·e^{−1/2}.
        let one_sigma = model.anomaly_mgal((10.4_f64).to_radians(), 20.0_f64.to_radians());
        assert!(
            (one_sigma - 30.0 * (-0.5_f64).exp()).abs() < 1e-6,
            "1σ = {one_sigma}"
        );
    }

    #[test]
    fn gravimeter_white_noise_averages_down_as_asd_over_sqrt_tau() {
        // ASD 1e-7 m/s²/√Hz (≈10 µGal/√Hz, cold-atom grade), τ = 100 s ⇒
        //   σ = 1e-7/√100 = 1e-8 m/s² = 1e-3 mGal.
        let g = Gravimeter::new(1.0e-7, 0.0);
        assert!((g.measurement_sigma_mgal(100.0) - 1.0e-3).abs() < 1e-12);
        // Quadrupling the averaging time halves the noise.
        assert!((g.measurement_sigma_mgal(400.0) - 0.5e-3).abs() < 1e-12);
    }

    #[test]
    fn gravimeter_derives_its_floor_from_the_cai_physics() {
        // A CAI accelerometer's ASD must flow straight through to the gravimeter floor.
        let cai = CaiAccelerometer {
            wavelength_m: 780.0e-9,
            pulse_sep_t: 0.01,
            atom_number: 1.0e6,
            contrast: 0.5,
            cycle_time_s: 0.5,
        };
        let g = Gravimeter::from_cai(&cai, 0.0);
        let tau = 10.0_f64;
        let expected = (cai.accel_asd() / tau.sqrt()) / MGAL;
        assert!((g.measurement_sigma_mgal(tau) - expected).abs() < 1e-15);
        assert!(g.measurement_sigma_mgal(tau) > 0.0);
    }

    #[test]
    fn map_matching_recovers_the_track_far_better_than_free_inertial_drift() {
        // A distinctive field: a gentle degree-2/3 regional trend plus two mascons the
        // oblique track flies across. The true INS drift is ≈ 71 km; the matched solution
        // must cut that by a large factor.
        let cfg = GravityMapBenchmarkCfg {
            nmax: 3,
            coeffs: vec![
                CoeffEntry {
                    n: 2,
                    m: 0,
                    cbar: 4.0e-6,
                    sbar: 0.0,
                },
                CoeffEntry {
                    n: 3,
                    m: 1,
                    cbar: 2.0e-6,
                    sbar: 1.0e-6,
                },
            ],
            mascons: vec![
                Mascon {
                    lat_deg: 11.0,
                    lon_deg: 21.0,
                    amp_mgal: 30.0,
                    sigma_deg: 0.45,
                },
                Mascon {
                    lat_deg: 10.6,
                    lon_deg: 20.6,
                    amp_mgal: -25.0,
                    sigma_deg: 0.35,
                },
            ],
            start_lat_deg: 10.0,
            start_lon_deg: 20.0,
            step_lat_deg: 0.18,
            step_lon_deg: 0.13,
            waypoints: 12,
            drift_lat_deg: 0.52,
            drift_lon_deg: -0.41,
            gravimeter_asd: 1.0e-7,
            averaging_time_s: 100.0,
            map_sigma_mgal: 2.0,
            search_half_deg: 1.0,
            search_step_deg: 0.05,
            refine_stages: 1,
            refine_factor: 8.0,
            noise_seed: 0,
        };
        let r = run_gravity_map_benchmark(&cfg);

        // Drift of ≈ 71 km (0.52° N, 0.41° E at ~11° lat).
        assert!(
            (r.free_inertial_drift_m - 71_000.0).abs() < 3_000.0,
            "drift = {} m",
            r.free_inertial_drift_m
        );
        // Gravity-map matching cuts the error by at least 5×, to within a few km.
        assert!(
            r.map_matched_error_m < 0.2 * r.free_inertial_drift_m,
            "matched {} m vs drift {} m",
            r.map_matched_error_m,
            r.free_inertial_drift_m
        );
        assert!(
            r.map_matched_error_m < 8_000.0,
            "matched error {} m should be within grid resolution",
            r.map_matched_error_m
        );
        assert!(r.measurement_sigma_mgal > 0.0 && r.measurement_sigma_mgal.is_finite());
    }

    /// The committed 60-minute GPS-denied scenario (single source of truth for the params).
    fn gps_denied_cfg() -> GravityMapBenchmarkCfg {
        toml::from_str(include_str!("../scenarios/gps-denied-gravity-nav.toml"))
            .expect("60-min GPS-denied scenario parses")
    }

    #[test]
    fn gps_denied_60min_recovers_position_within_500m() {
        // The headline alt-PNT result: one hour with no GNSS, the inertial solution drifts
        // to ≈ 70 km, and hierarchical gravity-map matching pulls it back under 500 m.
        let r = run_gps_denied_gravity_nav(&gps_denied_cfg());
        assert!(
            r.free_inertial_drift_m > 10_000.0,
            "free-inertial drift {} m must exceed 10 km",
            r.free_inertial_drift_m
        );
        assert!(
            r.map_matched_error_m < 500.0,
            "matched error {} m must beat the 500 m GPS-denied target",
            r.map_matched_error_m
        );
        // A genuine fix, not a marginal trim: at least a 100× cut over free-inertial drift.
        assert!(
            r.map_matched_error_m < r.free_inertial_drift_m / 100.0,
            "matched {} m vs drift {} m",
            r.map_matched_error_m,
            r.free_inertial_drift_m
        );
        assert!(r.measurement_sigma_mgal > 0.0 && r.measurement_sigma_mgal.is_finite());
    }

    #[test]
    fn hierarchical_refinement_is_what_breaks_the_500m_barrier() {
        // A single coarse grid (search_step ≈ 0.08° ≈ 9 km) cannot reach 500 m; the
        // coarse-to-fine refinement is what buys the sub-grid resolution. Same field, same
        // noise — only the stage count differs.
        let mut single = gps_denied_cfg();
        single.refine_stages = 1;
        let coarse = run_gps_denied_gravity_nav(&single);
        let refined = run_gps_denied_gravity_nav(&gps_denied_cfg());

        assert!(
            coarse.map_matched_error_m > 500.0,
            "single-stage {} m should NOT already meet the target",
            coarse.map_matched_error_m
        );
        assert!(refined.map_matched_error_m < 500.0);
        assert!(
            refined.map_matched_error_m < coarse.map_matched_error_m / 4.0,
            "refinement {} m must sharply beat single-stage {} m",
            refined.map_matched_error_m,
            coarse.map_matched_error_m
        );
    }

    #[test]
    fn gps_denied_recovery_is_stable_across_noise_realisations() {
        // The seeded gravimeter noise is reproducible per seed; across realisations the
        // matched error stays well under target and barely moves (the cold-atom floor is
        // far below the map error, so geometry — not noise — sets the result).
        let mut errs = Vec::new();
        for seed in 1..=5u64 {
            let mut cfg = gps_denied_cfg();
            cfg.noise_seed = seed;
            let r = run_gps_denied_gravity_nav(&cfg);
            assert!(
                r.map_matched_error_m < 500.0,
                "seed {seed}: matched {} m",
                r.map_matched_error_m
            );
            errs.push(r.map_matched_error_m);
        }
        let max = errs.iter().cloned().fold(f64::MIN, f64::max);
        let min = errs.iter().cloned().fold(f64::MAX, f64::min);
        assert!(max - min < 50.0, "spread {} m across seeds", max - min);
    }

    #[test]
    fn run_is_deterministic_for_a_fixed_seed() {
        let a = run_gps_denied_gravity_nav(&gps_denied_cfg());
        let b = run_gps_denied_gravity_nav(&gps_denied_cfg());
        assert_eq!(
            a.map_matched_error_m.to_bits(),
            b.map_matched_error_m.to_bits()
        );
    }

    #[test]
    fn committed_benchmark_scenario_loads_and_runs() {
        // The committed NAVISP benchmark spec parses and drives the same recovery.
        let cfg: GravityMapBenchmarkCfg =
            toml::from_str(include_str!("../scenarios/gravity-map-nav.toml"))
                .expect("benchmark scenario parses");
        let r = run_gravity_map_benchmark(&cfg);
        assert!(r.map_matched_error_m < 0.25 * r.free_inertial_drift_m);
        assert!(r.free_inertial_drift_m > 10_000.0);
    }
}
