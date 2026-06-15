// SPDX-License-Identifier: Apache-2.0
//! Sequential (recursive) terrain-referenced navigation — SITAN as a running filter.
//!
//! [`super::terrain::run_terrain_nav`] is a *batch* navigator: it recovers a single
//! **constant** INS drift offset over an entire pass with one coarse-to-fine search. That
//! is the right model when the inertial error is a fixed bias, but a real strapdown INS
//! position error **grows with time** — it ramps over the GNSS outage rather than holding a
//! constant value. A single constant-offset fit structurally cannot follow a moving error.
//!
//! This module runs the same map-match measurement model recursively, epoch by epoch,
//! through the [`crate::particle_filter`] SIR filter: at each waypoint the cloud is
//! propagated by the INS-reported increment (itself corrupted by the per-step drift
//! growth), reweighted by how well each particle's predicted ground elevation matches the
//! altimeter, and resampled when it degenerates. The weighted-mean estimate tracks the true
//! position even as the free-inertial solution walks away unbounded — recursive
//! terrain-aided navigation (Monte-Carlo localization against a DEM), the *localization*
//! half of terrain SLAM.
//!
//! ## Scope (honest)
//!
//! The map is **known and fixed**: this is recursive localization against a stored DEM, not
//! joint map estimation (full SLAM). The dynamics are a known nominal track plus an injected
//! time-varying drift; the filter is handed only the (drifting) INS increments and the
//! altimeter, never the truth. Non-circular by construction — the drift ramp is the
//! independent ground truth and every reported error is measured against it, never against
//! the DEM's own value. The recursion reuses the exact `predict`/`update`/`resample`
//! primitives the batch navigator's measurement model is built on, so the two paths share
//! one estimator engine.

use super::terrain::{deg_offset_to_m, Altimeter, DemGrid};
use crate::mapmatch::field_likelihood;
use crate::particle_filter::ParticleFilter;
use rand::{RngCore, SeedableRng};
use rand_chacha::ChaCha8Rng;
use rand_distr::{Distribution, Normal};
use serde::{Deserialize, Serialize};

fn default_n_particles() -> usize {
    2000
}
fn default_init_pos_sigma_deg() -> f64 {
    0.01
}
fn default_process_sigma_deg() -> f64 {
    0.004
}
fn default_resample_ess_frac() -> f64 {
    0.5
}

/// Sequential terrain-referenced navigation configuration (deserialised from
/// `scenarios/terrain-slam.toml`).
#[derive(Clone, Debug, Deserialize)]
pub struct SequentialTrnCfg {
    /// Synthetic-DEM seed (self-contained; jitters [`DemGrid::synthetic_fixture`]).
    pub dem_seed: u64,
    /// Track start latitude (deg).
    pub start_lat_deg: f64,
    /// Track start longitude (deg).
    pub start_lon_deg: f64,
    /// Per-waypoint latitude step (deg).
    pub step_lat_deg: f64,
    /// Per-waypoint longitude step (deg).
    pub step_lon_deg: f64,
    /// Number of waypoints flown GPS-denied.
    pub waypoints: usize,
    /// True INS drift **rate** (deg/waypoint), latitude component — the per-step growth of
    /// the inertial position error (a linear ramp; zero at the first waypoint).
    pub drift_rate_lat_deg: f64,
    /// True INS drift **rate** (deg/waypoint), longitude component.
    pub drift_rate_lon_deg: f64,
    /// Altimeter 1σ measurement noise (m).
    pub altimeter_sigma_m: f64,
    /// DEM representation error (m); combined with the altimeter noise into the matching σ.
    pub map_sigma_m: f64,
    /// Particle count.
    #[serde(default = "default_n_particles")]
    pub n_particles: usize,
    /// 1σ spread of the initial particle cloud around the first INS fix (deg).
    #[serde(default = "default_init_pos_sigma_deg")]
    pub init_pos_sigma_deg: f64,
    /// Per-step process noise on each position component (deg) — must span the per-step
    /// drift growth so the cloud can be pulled back onto the truth by the terrain match.
    #[serde(default = "default_process_sigma_deg")]
    pub process_sigma_deg: f64,
    /// Resample when the effective sample size drops below this fraction of `n_particles`.
    #[serde(default = "default_resample_ess_frac")]
    pub resample_ess_frac: f64,
    /// Seed for the deterministic filter / measurement-noise stream.
    #[serde(default)]
    pub seed: u64,
}

/// One epoch of a sequential terrain-navigation run.
#[derive(Clone, Copy, Debug, Serialize)]
pub struct SeqEpoch {
    /// Waypoint index.
    pub k: usize,
    /// Free-inertial (unaided) position error at this waypoint (m) — grows with the drift ramp.
    pub free_inertial_m: f64,
    /// Terrain-matched position error at this waypoint (m) — kept bounded by the recursion.
    pub matched_m: f64,
    /// Effective sample size of the particle cloud after this update (filter-health monitor).
    pub ess: f64,
}

/// Result of a sequential terrain-referenced navigation run.
#[derive(Clone, Debug, Serialize)]
pub struct SequentialTrnResult {
    /// Number of waypoints flown.
    pub waypoints: usize,
    /// Effective matching 1σ used (m): `hypot(altimeter σ, map σ)`.
    pub measurement_sigma_m: f64,
    /// Free-inertial position error at the final waypoint (m).
    pub free_inertial_final_m: f64,
    /// RMS free-inertial position error over the track (m).
    pub free_inertial_rms_m: f64,
    /// Terrain-matched position error at the final waypoint (m).
    pub matched_final_m: f64,
    /// RMS terrain-matched position error over the track (m).
    pub matched_rms_m: f64,
    /// Mean effective sample size over the track (filter health).
    pub mean_ess: f64,
    /// Minimum effective sample size over the track (worst-case degeneracy).
    pub min_ess: f64,
    /// Per-waypoint record.
    pub epochs: Vec<SeqEpoch>,
}

/// A uniform draw in `[0, 1)` from the raw RNG stream (53-bit mantissa), so the resample
/// offset is deterministic for a fixed seed without pulling in the `Rng` range trait.
fn unit_draw(rng: &mut dyn RngCore) -> f64 {
    (rng.next_u64() >> 11) as f64 / (1u64 << 53) as f64
}

/// Run the GPS-denied **sequential** terrain-referenced navigation benchmark.
///
/// A vehicle flies a known-shape track with no GNSS while its inertial position error grows
/// as a linear ramp (`drift_rate · k`). A radar/baro altimeter measures the ground elevation
/// under each true waypoint (real seeded white-noise floor injected). The particle filter is
/// seeded around the first INS fix and, at each waypoint, propagated by the INS-reported
/// increment plus process noise, then reweighted by the terrain-match likelihood and
/// resampled on degeneracy. The weighted-mean estimate tracks the true position; the residual
/// `|estimate − truth|` is reported alongside the unbounded free-inertial error `|INS − truth|`.
///
/// Non-circular by construction: the injected drift ramp is the independent ground truth, and
/// every error is measured against it — never against the DEM's own value. Particles whose
/// hypothesised cell falls on a DEM void (NaN sample) get zero likelihood and die; an epoch
/// whose measured truth is itself a void is skipped so a sentinel never enters the weights.
pub fn run_sequential_trn(cfg: &SequentialTrnCfg) -> SequentialTrnResult {
    let dem = DemGrid::synthetic_fixture(cfg.dem_seed);
    let field = dem.sampler_deg();
    let alt = Altimeter {
        sigma_m: cfg.altimeter_sigma_m,
    };
    let sigma_m = (cfg.altimeter_sigma_m * cfg.altimeter_sigma_m
        + cfg.map_sigma_m * cfg.map_sigma_m)
        .sqrt()
        .max(f64::MIN_POSITIVE);
    let n = cfg.waypoints.max(1);
    let np = cfg.n_particles.max(1);
    let mut rng = ChaCha8Rng::seed_from_u64(cfg.seed);

    // True track, time-varying INS drift (linear ramp), and noisy altimeter measurements.
    let truth: Vec<(f64, f64)> = (0..n)
        .map(|k| {
            (
                cfg.start_lat_deg + cfg.step_lat_deg * k as f64,
                cfg.start_lon_deg + cfg.step_lon_deg * k as f64,
            )
        })
        .collect();
    let ins: Vec<(f64, f64)> = truth
        .iter()
        .enumerate()
        .map(|(k, &(la, lo))| {
            (
                la + cfg.drift_rate_lat_deg * k as f64,
                lo + cfg.drift_rate_lon_deg * k as f64,
            )
        })
        .collect();
    let noise = Normal::new(0.0, cfg.altimeter_sigma_m.max(f64::MIN_POSITIVE)).unwrap();
    let measured: Vec<f64> = truth
        .iter()
        .map(|&(la, lo)| alt.measure(field(la, lo), noise.sample(&mut rng)))
        .collect();

    // Seed the cloud around the first INS fix (the filter is told nothing else).
    let init = Normal::new(0.0, cfg.init_pos_sigma_deg.max(f64::MIN_POSITIVE)).unwrap();
    let particles: Vec<Vec<f64>> = (0..np)
        .map(|_| {
            vec![
                ins[0].0 + init.sample(&mut rng),
                ins[0].1 + init.sample(&mut rng),
            ]
        })
        .collect();
    let mut pf = ParticleFilter::new(particles);

    let process_sd = [
        cfg.process_sigma_deg.max(0.0),
        cfg.process_sigma_deg.max(0.0),
    ];
    let mut epochs = Vec::with_capacity(n);
    let (mut sq_free, mut sq_match, mut ess_sum, mut ess_min) = (0.0, 0.0, 0.0, np as f64);

    for k in 0..n {
        // Predict by the INS-reported increment (the seeded cloud is the k = 0 prior).
        if k > 0 {
            let dlat = ins[k].0 - ins[k - 1].0;
            let dlon = ins[k].1 - ins[k - 1].1;
            pf.predict(|p| vec![p[0] + dlat, p[1] + dlon], &process_sd, &mut rng);
        }
        // Update by the terrain-match likelihood; guard DEM voids / NaN samples.
        let m = measured[k];
        if m.is_finite() {
            pf.update(|p| {
                let pred = field(p[0], p[1]);
                if pred.is_finite() {
                    field_likelihood(pred, m, sigma_m)
                } else {
                    0.0
                }
            });
        }
        let ess = pf.effective_sample_size();
        if ess < cfg.resample_ess_frac * np as f64 {
            pf.resample(unit_draw(&mut rng));
        }
        let est = pf.estimate();
        let ref_lat = truth[k].0;
        let free_m = deg_offset_to_m(ins[k].0 - truth[k].0, ins[k].1 - truth[k].1, ref_lat);
        let match_m = deg_offset_to_m(est[0] - truth[k].0, est[1] - truth[k].1, ref_lat);
        sq_free += free_m * free_m;
        sq_match += match_m * match_m;
        ess_sum += ess;
        if ess < ess_min {
            ess_min = ess;
        }
        epochs.push(SeqEpoch {
            k,
            free_inertial_m: free_m,
            matched_m: match_m,
            ess,
        });
    }

    let nf = n as f64;
    SequentialTrnResult {
        waypoints: n,
        measurement_sigma_m: sigma_m,
        free_inertial_final_m: epochs.last().map(|e| e.free_inertial_m).unwrap_or(0.0),
        free_inertial_rms_m: (sq_free / nf).sqrt(),
        matched_final_m: epochs.last().map(|e| e.matched_m).unwrap_or(0.0),
        matched_rms_m: (sq_match / nf).sqrt(),
        mean_ess: ess_sum / nf,
        min_ess: ess_min,
        epochs,
    }
}

/// Render a two-line SVG of the free-inertial vs terrain-matched position error over the
/// track — the recursive filter keeping error bounded while the unaided solution diverges.
pub fn sequential_trn_svg(r: &SequentialTrnResult) -> String {
    let (w, h) = (720.0, 320.0);
    let (x0, y0) = (60.0, 40.0);
    let (pw, ph) = (w - x0 - 20.0, h - y0 - 40.0);
    let span = (r.epochs.len() as f64 - 1.0).max(1.0);
    let maxv = r
        .epochs
        .iter()
        .map(|e| e.free_inertial_m.max(e.matched_m))
        .fold(1.0_f64, f64::max);
    let xk = |k: usize| x0 + pw * k as f64 / span;
    let yv = |v: f64| y0 + ph * (1.0 - (v / maxv).clamp(0.0, 1.0));
    let poly = |sel: &dyn Fn(&SeqEpoch) -> f64| -> String {
        r.epochs
            .iter()
            .map(|e| format!("{:.1},{:.1}", xk(e.k), yv(sel(e))))
            .collect::<Vec<_>>()
            .join(" ")
    };
    let free_pts = poly(&|e| e.free_inertial_m);
    let match_pts = poly(&|e| e.matched_m);
    format!(
        "<svg xmlns=\"http://www.w3.org/2000/svg\" width=\"{w}\" height=\"{h}\" \
         viewBox=\"0 0 {w} {h}\" font-family=\"sans-serif\">\
         <text x=\"16\" y=\"24\" font-size=\"16\" font-weight=\"bold\">\
         Sequential terrain-referenced navigation (recursive SITAN)</text>\
         <polyline fill=\"none\" stroke=\"#c0392b\" stroke-width=\"2\" points=\"{free_pts}\"/>\
         <polyline fill=\"none\" stroke=\"#27ae60\" stroke-width=\"2\" points=\"{match_pts}\"/>\
         <text x=\"{lx}\" y=\"{ly1}\" font-size=\"12\" fill=\"#c0392b\">free-inertial drift (grows)</text>\
         <text x=\"{lx}\" y=\"{ly2}\" font-size=\"12\" fill=\"#27ae60\">terrain-matched (bounded)</text>\
         <text x=\"16\" y=\"{yb}\" font-size=\"11\" fill=\"#555\">waypoint \u{2192}    full scale {maxv:.0} m</text>\
         </svg>",
        lx = x0 + 12.0,
        ly1 = y0 + 16.0,
        ly2 = y0 + 32.0,
        yb = h - 12.0,
    )
}

#[cfg(test)]
mod tests {
    use super::*;

    fn base_cfg() -> SequentialTrnCfg {
        // The synthetic DEM is a 0.5°×0.5° patch over [12.0–12.5, 20.0–20.5]; the track and
        // the cloud must stay inside it. Truth runs 12.10→12.295, 20.10→20.295 — well inside.
        SequentialTrnCfg {
            dem_seed: 7,
            start_lat_deg: 12.1,
            start_lon_deg: 20.1,
            step_lat_deg: 0.005,
            step_lon_deg: 0.005,
            waypoints: 40,
            // A growing INS error: ~0.001 deg/step ⇒ ~4 km off truth by the last waypoint.
            drift_rate_lat_deg: 0.0008,
            drift_rate_lon_deg: 0.0006,
            altimeter_sigma_m: 15.0,
            map_sigma_m: 15.0,
            n_particles: 3000,
            init_pos_sigma_deg: 0.008,
            process_sigma_deg: 0.003,
            resample_ess_frac: 0.5,
            seed: 42,
        }
    }

    #[test]
    fn sequential_filter_tracks_a_time_varying_drift() {
        // The whole point of the recursive estimator: a constant-offset batch fit cannot
        // follow a ramping INS error, but the sequential filter keeps the position error
        // bounded while the unaided solution diverges to kilometres.
        let r = run_sequential_trn(&base_cfg());
        assert!(
            r.free_inertial_rms_m > 1000.0,
            "the scenario must actually drift km-scale: free RMS = {} m",
            r.free_inertial_rms_m
        );
        assert!(
            r.matched_rms_m < 0.5 * r.free_inertial_rms_m,
            "matched RMS {} m must be far below free-inertial RMS {} m",
            r.matched_rms_m,
            r.free_inertial_rms_m
        );
        assert!(
            r.matched_final_m < r.free_inertial_final_m,
            "matched final {} m must beat free-inertial final {} m",
            r.matched_final_m,
            r.free_inertial_final_m
        );
        assert_eq!(r.epochs.len(), 40);
    }

    #[test]
    fn free_inertial_error_grows_monotonically_with_the_ramp() {
        let r = run_sequential_trn(&base_cfg());
        // The first waypoint has zero drift; the error then increases every step.
        assert!(r.epochs[0].free_inertial_m < 1.0);
        for w in r.epochs.windows(2) {
            assert!(
                w[1].free_inertial_m > w[0].free_inertial_m,
                "free-inertial error must ramp up: {} -> {}",
                w[0].free_inertial_m,
                w[1].free_inertial_m
            );
        }
    }

    #[test]
    fn reproducible_for_a_fixed_seed() {
        let a = run_sequential_trn(&base_cfg());
        let b = run_sequential_trn(&base_cfg());
        assert_eq!(a.matched_rms_m.to_bits(), b.matched_rms_m.to_bits());
        assert_eq!(a.matched_final_m.to_bits(), b.matched_final_m.to_bits());
        assert_eq!(a.mean_ess.to_bits(), b.mean_ess.to_bits());
        for (ea, eb) in a.epochs.iter().zip(&b.epochs) {
            assert_eq!(ea.matched_m.to_bits(), eb.matched_m.to_bits());
        }
    }

    #[test]
    fn filter_health_stays_above_collapse() {
        let r = run_sequential_trn(&base_cfg());
        // The resample-on-degeneracy guard keeps the cloud from collapsing to one particle.
        assert!(r.min_ess >= 1.0, "ESS = {}", r.min_ess);
        assert!(
            r.mean_ess > 1.0,
            "mean ESS {} should reflect a live cloud",
            r.mean_ess
        );
    }

    #[test]
    fn degenerate_inputs_do_not_panic() {
        // Single waypoint, single particle, zero noise — must stay finite, not divide by zero.
        let cfg = SequentialTrnCfg {
            waypoints: 1,
            n_particles: 1,
            altimeter_sigma_m: 0.0,
            map_sigma_m: 0.0,
            init_pos_sigma_deg: 0.0,
            process_sigma_deg: 0.0,
            ..base_cfg()
        };
        let r = run_sequential_trn(&cfg);
        assert_eq!(r.waypoints, 1);
        assert!(r.measurement_sigma_m.is_finite() && r.measurement_sigma_m > 0.0);
        assert!(r.matched_rms_m.is_finite());
        assert!(r.free_inertial_rms_m.is_finite());
    }

    #[test]
    fn svg_is_well_formed() {
        let r = run_sequential_trn(&base_cfg());
        let svg = sequential_trn_svg(&r);
        assert!(svg.starts_with("<svg"));
        assert!(svg.trim_end().ends_with("</svg>"));
        assert!(svg.contains("recursive SITAN"));
        assert!(svg.contains("<polyline"));
    }
}
