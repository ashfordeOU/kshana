// SPDX-License-Identifier: AGPL-3.0-only
//! Positioning from LEO range rate (Doppler).
//!
//! A receiver that measures the Doppler shift `f_D` of a carrier at wavelength `λ` observes
//! the range rate `ρ̇ = −λ f_D`. With the satellite state known from its ephemeris,
//!
//! `ρ̇ = u · (v_s − v_u) + ḋ + ε`,  `u = (r_s − r_u) / |r_s − r_u|`,
//!
//! where `ḋ` is the receiver clock drift expressed as a velocity (m/s). The unknowns are the
//! user position, the clock drift and optionally a constant user velocity (the position then
//! moves as `r_u(t) = r_0 + v_0 t` over the window). The partial derivatives are analytic:
//!
//! * `∂ρ̇/∂r_u = −(I − u uᵀ)(v_s − v_u) / ρ` — only the velocity component across the line
//!   of sight carries position information, so a single pass locates the user along the
//!   track (the time of zero Doppler) and across it (the steepness of the Doppler curve);
//! * `∂ρ̇/∂v_u = −u`, `∂ρ̇/∂ḋ = 1`.
//!
//! A batch Gauss-Newton fit over every measurement of the window solves them. A surface user
//! may add a height constraint (a pseudo-measurement on the local vertical), which is how a
//! single pass is usually solved (the Transit system did the same).
//!
//! ## Single-pass geometry
//!
//! Over one pass the two sides of the ground track give almost the same Doppler curve: on a
//! non-rotating Earth the mirror image of the user across the orbit plane produces exactly the
//! same range rates, and only the Earth's rotation separates them. [`single_pass_geometry`]
//! reports the formal along-track and cross-track errors against the cross-track offset of
//! the user; the cross-track error grows without bound as the pass goes overhead, where the
//! Doppler curve stops depending on the cross-track distance. At the time of closest approach
//! of a straight-line pass the range acceleration is `v² / d_min` (the classic Doppler-slope
//! relation), which the tests check on the Earth-fixed pass.
//!
//! ## Label
//!
//! MODELLED. The measurement model is exact for the modelled orbits; the noise is Gaussian at
//! a stated level, the ephemeris is perfect unless an ephemeris range-rate error is added by
//! the caller, and the ionosphere, troposphere and oscillator acceleration are not modelled.

use super::geom::{cross, dot, inverse, norm, normal_equations, scale, sub, EarthOrbit, Mat, Vec3};
use serde::Serialize;

/// One range-rate measurement.
#[derive(Clone, Copy, Debug, PartialEq)]
pub struct RangeRateObs {
    /// Time of the measurement, seconds after the window start.
    pub t_s: f64,
    /// Satellite ECEF position (m).
    pub sat_pos: Vec3,
    /// Satellite ECEF velocity (m/s).
    pub sat_vel: Vec3,
    /// Measured range rate (m/s): `−λ f_D`.
    pub range_rate_mps: f64,
    /// One-sigma measurement error (m/s).
    pub sigma_mps: f64,
}

/// Options of the Doppler fit.
#[derive(Clone, Copy, Debug, PartialEq, Serialize)]
pub struct DopplerOptions {
    /// Estimate a constant user velocity as well as the position.
    pub estimate_velocity: bool,
    /// One-sigma of a height pseudo-measurement holding the user on a known height
    /// (m); `None` for a free three-dimensional fit.
    pub height_sigma_m: Option<f64>,
    /// Gauss-Newton iteration limit.
    pub max_iter: usize,
}

impl Default for DopplerOptions {
    fn default() -> Self {
        Self {
            estimate_velocity: false,
            height_sigma_m: None,
            max_iter: 30,
        }
    }
}

/// A Doppler fix.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct DopplerFix {
    /// Estimated ECEF position at the window start (m).
    pub position: [f64; 3],
    /// Estimated ECEF velocity (m/s); zero when not estimated.
    pub velocity: [f64; 3],
    /// Estimated receiver clock drift (m/s).
    pub drift_mps: f64,
    /// Formal one-sigma position error east, north, up (m).
    pub sigma_enu_m: [f64; 3],
    /// Formal one-sigma velocity error east, north, up (m/s); zero when not estimated.
    pub sigma_vel_enu_mps: [f64; 3],
    /// Formal one-sigma clock drift (m/s).
    pub sigma_drift_mps: f64,
    /// Iterations taken.
    pub iterations: usize,
    /// Whether the position step fell below 1 mm.
    pub converged: bool,
    /// Weighted post-fit residual RMS (near 1 when the sigmas describe the noise).
    pub weighted_rms: f64,
    /// Sum of squared weighted residuals.
    pub chi2: f64,
    /// Measurements used.
    pub n_used: usize,
    /// Full covariance of the estimate, state order `[r(3), drift, v(3)?]`.
    #[serde(skip)]
    pub covariance: Mat,
}

/// Predicted range rate for a user at `r_u` moving at `v_u` (m/s).
pub fn range_rate(r_u: Vec3, v_u: Vec3, r_s: Vec3, v_s: Vec3) -> f64 {
    let d = sub(r_s, r_u);
    dot(d, sub(v_s, v_u)) / norm(d)
}

/// Row of partial derivatives of the range rate with respect to `[r_u, drift, v_u?]`.
fn partials(r_u: Vec3, v_u: Vec3, o: &RangeRateObs, with_vel: bool) -> Vec<f64> {
    let d = sub(o.sat_pos, r_u);
    let rho = norm(d);
    let u = scale(d, 1.0 / rho);
    let dv = sub(o.sat_vel, v_u);
    let along = dot(u, dv);
    // −(I − u uᵀ) dv / ρ
    let g = [
        -(dv[0] - u[0] * along) / rho,
        -(dv[1] - u[1] * along) / rho,
        -(dv[2] - u[2] * along) / rho,
    ];
    let mut row = vec![g[0], g[1], g[2], 1.0];
    if with_vel {
        // r_u = r0 + v0 t: ∂/∂v0 = t ∂/∂r_u − u.
        for i in 0..3 {
            row.push(o.t_s * g[i] - u[i]);
        }
    }
    row
}

fn up_of(r: Vec3) -> Vec3 {
    let g = crate::frames::ecef_to_geodetic(r);
    super::geom::enu_at(g.lat_rad, g.lon_rad).2
}

fn enu_sigmas(q: &Mat, at: Vec3, offset: usize) -> [f64; 3] {
    let g = crate::frames::ecef_to_geodetic(at);
    let (e, n, u) = super::geom::enu_at(g.lat_rad, g.lon_rad);
    let var = |v: Vec3| -> f64 {
        let mut s = 0.0;
        for i in 0..3 {
            for j in 0..3 {
                s += v[i] * q[offset + i][offset + j] * v[j];
            }
        }
        s.max(0.0).sqrt()
    };
    [var(e), var(n), var(u)]
}

/// Batch Gauss-Newton Doppler fix. `apriori` is the starting position; with a height
/// constraint, the constrained height is `apriori_height_ref`'s geodetic height.
pub fn solve(
    obs: &[RangeRateObs],
    opts: &DopplerOptions,
    apriori: Vec3,
    height_ref: Option<Vec3>,
) -> Result<DopplerFix, String> {
    if obs
        .iter()
        .any(|o| !(o.sigma_mps.is_finite() && o.sigma_mps > 0.0))
    {
        return Err("every range rate needs a positive, finite sigma".into());
    }
    let with_vel = opts.estimate_velocity;
    let n = if with_vel { 7 } else { 4 };
    let n_meas = obs.len() + usize::from(opts.height_sigma_m.is_some());
    if n_meas < n {
        return Err(format!(
            "{n_meas} measurements cannot resolve {n} Doppler unknowns"
        ));
    }
    let h_target = height_ref.map(|r| crate::frames::ecef_to_geodetic(r).alt_m);
    let mut x = vec![0.0; n];
    x[..3].copy_from_slice(&apriori);
    let mut converged = false;
    let mut iterations = 0;
    let mut cov = None;
    let pos_at = |x: &[f64], t: f64| -> (Vec3, Vec3) {
        if with_vel {
            (
                [x[0] + x[4] * t, x[1] + x[5] * t, x[2] + x[6] * t],
                [x[4], x[5], x[6]],
            )
        } else {
            ([x[0], x[1], x[2]], [0.0; 3])
        }
    };
    let residuals = |x: &[f64]| -> (Vec<Vec<f64>>, Vec<f64>, Vec<f64>) {
        let mut h = Vec::with_capacity(n_meas);
        let mut r = Vec::with_capacity(n_meas);
        let mut w = Vec::with_capacity(n_meas);
        for o in obs {
            let (ru, vu) = pos_at(x, o.t_s);
            h.push(partials(ru, vu, o, with_vel));
            r.push(o.range_rate_mps - (range_rate(ru, vu, o.sat_pos, o.sat_vel) + x[3]));
            w.push(1.0 / (o.sigma_mps * o.sigma_mps));
        }
        if let (Some(sig), Some(ht)) = (opts.height_sigma_m, h_target) {
            let r0 = [x[0], x[1], x[2]];
            let up = up_of(r0);
            let mut row = vec![up[0], up[1], up[2], 0.0];
            if with_vel {
                row.extend_from_slice(&[0.0; 3]);
            }
            h.push(row);
            r.push(ht - crate::frames::ecef_to_geodetic(r0).alt_m);
            w.push(1.0 / (sig * sig));
        }
        (h, r, w)
    };
    for it in 0..opts.max_iter.max(1) {
        iterations = it + 1;
        let (h, r, w) = residuals(&x);
        let (a, b) = normal_equations(&h, &w, &r);
        let q = inverse(&a).ok_or("the Doppler geometry is singular")?;
        let dx = super::geom::mat_vec(&q, &b);
        // Damp very large steps so a poor start does not jump through the Earth.
        let step = dx.iter().take(3).map(|d| d * d).sum::<f64>().sqrt();
        let k = if step > 2.0e5 { 2.0e5 / step } else { 1.0 };
        for i in 0..n {
            x[i] += k * dx[i];
        }
        cov = Some(q);
        if step < 1e-3 {
            converged = true;
            break;
        }
    }
    let (h, r, w) = residuals(&x);
    let (a, _) = normal_equations(&h, &w, &r);
    let q = inverse(&a).or(cov).ok_or("no covariance")?;
    let chi2: f64 = r.iter().zip(&w).map(|(ri, wi)| ri * ri * wi).sum();
    let r0 = [x[0], x[1], x[2]];
    Ok(DopplerFix {
        position: r0,
        velocity: if with_vel {
            [x[4], x[5], x[6]]
        } else {
            [0.0; 3]
        },
        drift_mps: x[3],
        sigma_enu_m: enu_sigmas(&q, r0, 0),
        sigma_vel_enu_mps: if with_vel {
            enu_sigmas(&q, r0, 4)
        } else {
            [0.0; 3]
        },
        sigma_drift_mps: q[3][3].max(0.0).sqrt(),
        iterations,
        converged,
        weighted_rms: (chi2 / (n_meas.saturating_sub(n)).max(1) as f64).sqrt(),
        chi2,
        n_used: obs.len(),
        covariance: q,
    })
}

/// Formal covariance of the Doppler fix at the true state, without noise or iteration:
/// `(HᵀWH)⁻¹` evaluated at `truth`. `None` when singular.
pub fn formal_covariance(
    obs: &[RangeRateObs],
    opts: &DopplerOptions,
    truth: Vec3,
    truth_vel: Vec3,
) -> Option<Mat> {
    let with_vel = opts.estimate_velocity;
    let mut h = Vec::new();
    let mut w = Vec::new();
    for o in obs {
        let ru = if with_vel {
            [
                truth[0] + truth_vel[0] * o.t_s,
                truth[1] + truth_vel[1] * o.t_s,
                truth[2] + truth_vel[2] * o.t_s,
            ]
        } else {
            truth
        };
        h.push(partials(ru, truth_vel, o, with_vel));
        w.push(1.0 / (o.sigma_mps * o.sigma_mps));
    }
    if let Some(sig) = opts.height_sigma_m {
        let up = up_of(truth);
        let mut row = vec![up[0], up[1], up[2], 0.0];
        if with_vel {
            row.extend_from_slice(&[0.0; 3]);
        }
        h.push(row);
        w.push(1.0 / (sig * sig));
    }
    let r = vec![0.0; h.len()];
    let (a, _) = normal_equations(&h, &w, &r);
    inverse(&a)
}

/// Along-track, cross-track and vertical one-sigma of a position covariance, with the
/// along-track direction taken as the horizontal projection of `sat_vel` at the user.
pub fn along_cross_up(q: &Mat, user: Vec3, sat_vel: Vec3) -> [f64; 3] {
    let up = up_of(user);
    let h = sub(sat_vel, scale(up, dot(sat_vel, up)));
    let hn = norm(h);
    let along = if hn > 0.0 {
        scale(h, 1.0 / hn)
    } else {
        [1.0, 0.0, 0.0]
    };
    let cr = cross(up, along);
    let var = |v: Vec3| -> f64 {
        let mut s = 0.0;
        for i in 0..3 {
            for j in 0..3 {
                s += v[i] * q[i][j] * v[j];
            }
        }
        s.max(0.0).sqrt()
    };
    [var(along), var(cr), var(up)]
}

/// One row of the single-pass geometry table.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct PassRow {
    /// Great-circle distance of the user from the ground track at closest approach (km).
    pub cross_track_offset_km: f64,
    /// Highest elevation of the pass (deg).
    pub max_elevation_deg: f64,
    /// Time above the mask (s).
    pub pass_duration_s: f64,
    /// Measurements used.
    pub n_obs: usize,
    /// Formal one-sigma along-track error (m); `None` when singular.
    pub sigma_along_m: Option<f64>,
    /// Formal one-sigma cross-track error (m).
    pub sigma_cross_m: Option<f64>,
    /// Formal one-sigma vertical error (m).
    pub sigma_up_m: Option<f64>,
}

/// Ground point at great-circle distance `offset_m` from the sub-satellite point of `orbit` at
/// time `t_c`, perpendicular to the ground track (positive to the left of the motion), on
/// the ellipsoid.
pub fn offset_site(orbit: &EarthOrbit, t_c: f64, offset_m: f64) -> super::geom::Site {
    let (r, v) = orbit.state(t_c);
    let s_hat = scale(r, 1.0 / norm(r));
    let track = sub(v, scale(s_hat, dot(v, s_hat)));
    let t_hat = scale(track, 1.0 / norm(track));
    let c_hat = cross(s_hat, t_hat);
    let th = offset_m / super::geom::RE_EARTH;
    let p = [
        s_hat[0] * th.cos() + c_hat[0] * th.sin(),
        s_hat[1] * th.cos() + c_hat[1] * th.sin(),
        s_hat[2] * th.cos() + c_hat[2] * th.sin(),
    ];
    super::geom::Site {
        lat_deg: p[2].clamp(-1.0, 1.0).asin() / super::geom::DEG,
        lon_deg: p[1].atan2(p[0]) / super::geom::DEG,
        height_m: 0.0,
    }
}

/// Range-rate observations of one satellite seen from `site` over `[t0, t1]` every `dt`
/// seconds above `mask` (rad), noise-free, each with sigma `sigma_mps`.
pub fn pass_observations(
    orbit: &EarthOrbit,
    site: &super::geom::Site,
    t0: f64,
    t1: f64,
    dt: f64,
    mask: f64,
    sigma_mps: f64,
) -> Vec<RangeRateObs> {
    let user = site.ecef();
    let up = site.enu().2;
    let mut out = Vec::new();
    let mut t = t0;
    while t <= t1 + 1e-9 {
        let (rs, vs) = orbit.state(t);
        if super::geom::elevation(user, up, rs) >= mask {
            out.push(RangeRateObs {
                t_s: t - t0,
                sat_pos: rs,
                sat_vel: vs,
                range_rate_mps: range_rate(user, [0.0; 3], rs, vs),
                sigma_mps,
            });
        }
        t += dt;
    }
    out
}

/// Formal accuracy of a single pass against the cross-track offset of the user.
///
/// The pass is centred on `t_c`, the time the satellite is over the reference ground point;
/// users are placed at each offset perpendicular to the track, and the window is
/// `t_c ± half_window_s` sampled every `dt_s`. The fit estimates position and clock drift,
/// with the height held to `height_sigma_m` when given.
#[allow(clippy::too_many_arguments)]
pub fn single_pass_geometry(
    orbit: &EarthOrbit,
    t_c: f64,
    offsets_km: &[f64],
    half_window_s: f64,
    dt_s: f64,
    mask: f64,
    sigma_mps: f64,
    height_sigma_m: Option<f64>,
) -> Vec<PassRow> {
    let opts = DopplerOptions {
        estimate_velocity: false,
        height_sigma_m,
        max_iter: 1,
    };
    offsets_km
        .iter()
        .map(|&off| {
            let site = offset_site(orbit, t_c, off * 1e3);
            let obs = pass_observations(
                orbit,
                &site,
                t_c - half_window_s,
                t_c + half_window_s,
                dt_s,
                mask,
                sigma_mps,
            );
            let user = site.ecef();
            let up = site.enu().2;
            let max_el = obs
                .iter()
                .map(|o| super::geom::elevation(user, up, o.sat_pos))
                .fold(f64::MIN, f64::max);
            let q = if obs.len() >= 4 {
                formal_covariance(&obs, &opts, user, [0.0; 3])
            } else {
                None
            };
            let vel_c = orbit.state(t_c).1;
            let s = q.as_ref().map(|q| along_cross_up(q, user, vel_c));
            let ok = |v: f64| (v.is_finite() && v < 1e9).then_some(v);
            PassRow {
                cross_track_offset_km: off,
                max_elevation_deg: if obs.is_empty() {
                    0.0
                } else {
                    max_el / super::geom::DEG
                },
                pass_duration_s: obs.len().saturating_sub(1) as f64 * dt_s,
                n_obs: obs.len(),
                sigma_along_m: s.and_then(|s| ok(s[0])),
                sigma_cross_m: s.and_then(|s| ok(s[1])),
                sigma_up_m: s.and_then(|s| ok(s[2])),
            }
        })
        .collect()
}

/// Doppler envelope of a satellite as seen from a site above an elevation mask.
#[derive(Clone, Copy, Debug, PartialEq, Serialize)]
pub struct DopplerEnvelope {
    /// Largest absolute Doppler shift (Hz).
    pub max_doppler_hz: f64,
    /// Largest absolute Doppler rate (Hz/s).
    pub max_doppler_rate_hz_s: f64,
    /// Largest absolute Doppler jerk, the rate of change of the Doppler rate (Hz/s^2).
    pub max_doppler_jerk_hz_s2: f64,
}

/// Doppler, Doppler rate and jerk envelope of `orbit` seen from `site` over `[t0, t1]`
/// sampled every `dt` seconds above `mask` (rad), at carrier `carrier_hz`. The rate and
/// jerk are central differences of the analytic range rate (step 0.5 s).
pub fn doppler_envelope(
    orbit: &EarthOrbit,
    site: &super::geom::Site,
    carrier_hz: f64,
    t0: f64,
    t1: f64,
    dt: f64,
    mask: f64,
) -> DopplerEnvelope {
    let lambda = super::C_LIGHT / carrier_hz;
    let user = site.ecef();
    let up = site.enu().2;
    let rr = |t: f64| {
        let (rs, vs) = orbit.state(t);
        range_rate(user, [0.0; 3], rs, vs)
    };
    let h = 0.5;
    let mut env = DopplerEnvelope {
        max_doppler_hz: 0.0,
        max_doppler_rate_hz_s: 0.0,
        max_doppler_jerk_hz_s2: 0.0,
    };
    let mut t = t0;
    while t <= t1 + 1e-9 {
        let (rs, _) = orbit.state(t);
        if super::geom::elevation(user, up, rs) >= mask {
            let (m1, p0, p1) = (rr(t - h), rr(t), rr(t + h));
            let acc = (p1 - m1) / (2.0 * h);
            let jerk = (p1 - 2.0 * p0 + m1) / (h * h);
            env.max_doppler_hz = env.max_doppler_hz.max(p0.abs() / lambda);
            env.max_doppler_rate_hz_s = env.max_doppler_rate_hz_s.max(acc.abs() / lambda);
            env.max_doppler_jerk_hz_s2 = env.max_doppler_jerk_hz_s2.max(jerk.abs() / lambda);
        }
        t += dt;
    }
    env
}

/// Time of closest approach of `orbit` to `site` within `[t0, t1]` (golden-section search on
/// the range after a coarse scan every `dt` seconds).
pub fn closest_approach(
    orbit: &EarthOrbit,
    site: &super::geom::Site,
    t0: f64,
    t1: f64,
    dt: f64,
) -> f64 {
    let user = site.ecef();
    let range = |t: f64| norm(sub(orbit.state(t).0, user));
    let mut best = (t0, f64::MAX);
    let mut t = t0;
    while t <= t1 {
        let r = range(t);
        if r < best.1 {
            best = (t, r);
        }
        t += dt;
    }
    let (mut a, mut b) = (best.0 - dt, best.0 + dt);
    let g = 0.5 * (5f64.sqrt() - 1.0);
    for _ in 0..80 {
        let c = b - g * (b - a);
        let d = a + g * (b - a);
        if range(c) < range(d) {
            b = d;
        } else {
            a = c;
        }
    }
    0.5 * (a + b)
}

#[cfg(test)]
mod tests {
    use super::*;
    use crate::leo_fusion::geom::{Site, DEG};
    use rand::SeedableRng;
    use rand_chacha::ChaCha8Rng;
    use rand_distr::{Distribution, Normal};

    fn orbit() -> EarthOrbit {
        EarthOrbit::circular(1080e3, 53.0 * DEG, 0.0, 0.0)
    }

    #[test]
    fn range_acceleration_obeys_the_kinematic_identity_and_vanishes_doppler_at_closest_approach() {
        // Differentiating rho^2 = d.d twice gives rho_ddot = (|v|^2 - rho_dot^2 + d.a) / rho for
        // the relative position d, velocity v and acceleration a. At closest approach
        // rho_dot = 0, so the straight-line value v^2/d_min is corrected only by d.a, the
        // satellite's acceleration projected on the line of sight.
        let o = orbit();
        let site = offset_site(&o, 600.0, 300e3);
        let tca = closest_approach(&o, &site, 0.0, 1200.0, 5.0);
        let user = site.ecef();
        let rr = |t: f64| {
            let (rs, vs) = o.state(t);
            range_rate(user, [0.0; 3], rs, vs)
        };
        assert!(
            rr(tca).abs() < 1e-3,
            "zero Doppler at closest approach: {}",
            rr(tca)
        );
        for t in [tca - 200.0, tca, tca + 150.0] {
            let h = 0.05;
            let acc = (rr(t + h) - rr(t - h)) / (2.0 * h);
            let (rs, vs) = o.state(t);
            let a = scale(sub(o.state(t + h).1, o.state(t - h).1), 0.5 / h);
            let d = sub(rs, user);
            let rho = norm(d);
            let want = (dot(vs, vs) - rr(t).powi(2) + dot(d, a)) / rho;
            assert!(((acc - want) / want).abs() < 1e-5, "t {t}: {acc} vs {want}");
        }
        // The straight-line value overstates the slope by the gravity term, here 10 to 20%.
        let (rs, vs) = o.state(tca);
        let straight = dot(vs, vs) / norm(sub(rs, user));
        let acc = (rr(tca + 0.05) - rr(tca - 0.05)) / 0.1;
        assert!(
            acc < straight && acc > 0.75 * straight,
            "{acc} vs {straight}"
        );
    }

    #[test]
    fn noise_free_multi_satellite_doppler_recovers_the_user() {
        let site = Site {
            lat_deg: 48.0,
            lon_deg: 11.0,
            height_m: 500.0,
        };
        let user = site.ecef();
        let mut obs = Vec::new();
        for k in 0..6 {
            let o = EarthOrbit::circular(
                1080e3,
                (53.0 + 10.0 * k as f64) * DEG,
                (k as f64 * 25.0) * DEG,
                (k as f64 * 40.0) * DEG,
            );
            let tca = closest_approach(&o, &site, 0.0, 6400.0, 20.0);
            obs.extend(pass_observations(
                &o,
                &site,
                tca - 400.0,
                tca + 400.0,
                10.0,
                10.0 * DEG,
                0.1,
            ));
        }
        for o in &mut obs {
            o.range_rate_mps += 2.5; // clock drift
        }
        let fix = solve(
            &obs,
            &DopplerOptions::default(),
            [user[0] + 2e3, user[1] - 3e3, user[2] + 1e3],
            None,
        )
        .unwrap();
        assert!(fix.converged);
        assert!(
            norm(sub(fix.position, user)) < 1e-3,
            "{:?}",
            sub(fix.position, user)
        );
        assert!((fix.drift_mps - 2.5).abs() < 1e-6);
    }

    #[test]
    fn a_single_pass_has_a_mirror_solution_across_the_ground_track() {
        // One pass, height held: starting on the wrong side of the track converges to a
        // second solution near the mirror image, whose fit is almost as good. Earth
        // rotation is what separates them.
        let o = orbit();
        let site = offset_site(&o, 600.0, 400e3);
        let mirror = offset_site(&o, 600.0, -400e3);
        let user = site.ecef();
        let tca = closest_approach(&o, &site, 0.0, 1200.0, 5.0);
        let mut obs = pass_observations(&o, &site, tca - 500.0, tca + 500.0, 5.0, 10.0 * DEG, 0.05);
        let mut rng = ChaCha8Rng::seed_from_u64(3);
        let nrm = Normal::new(0.0, 0.05).unwrap();
        for ob in &mut obs {
            ob.range_rate_mps += nrm.sample(&mut rng);
        }
        let opts = DopplerOptions {
            height_sigma_m: Some(1.0),
            ..Default::default()
        };
        let right = solve(
            &obs,
            &opts,
            [user[0] + 5e3, user[1] + 5e3, user[2]],
            Some(user),
        )
        .unwrap();
        let wrong = solve(&obs, &opts, mirror.ecef(), Some(user)).unwrap();
        assert!(
            norm(sub(right.position, user)) < 50.0,
            "{}",
            norm(sub(right.position, user))
        );
        let sep = norm(sub(wrong.position, user));
        assert!(
            sep > 500e3,
            "the mirror start should stay on its side: {sep}"
        );
        assert!(wrong.chi2 > right.chi2, "the true side fits better");
    }

    #[test]
    fn the_cross_track_error_grows_as_the_pass_goes_overhead() {
        let o = orbit();
        let rows = single_pass_geometry(
            &o,
            600.0,
            &[20.0, 200.0, 800.0],
            700.0,
            5.0,
            10.0 * DEG,
            0.1,
            Some(1.0),
        );
        let c: Vec<f64> = rows.iter().map(|r| r.sigma_cross_m.unwrap()).collect();
        assert!(c[0] > 5.0 * c[1], "{c:?}");
        let a: Vec<f64> = rows.iter().map(|r| r.sigma_along_m.unwrap()).collect();
        assert!(a.iter().all(|x| *x < 10.0), "{a:?}");
        assert!(rows[0].max_elevation_deg > rows[2].max_elevation_deg);
    }

    #[test]
    fn velocity_states_are_recovered_for_a_moving_user() {
        let site = Site {
            lat_deg: 30.0,
            lon_deg: -20.0,
            height_m: 0.0,
        };
        let user = site.ecef();
        let (e, n, _) = site.enu();
        let vel = [
            15.0 * e[0] + 10.0 * n[0],
            15.0 * e[1] + 10.0 * n[1],
            15.0 * e[2] + 10.0 * n[2],
        ];
        let sys: crate::leo_fusion::system::SystemCfg =
            toml::from_str("name = \"X\"\nleo_preset = \"xona-pulsar\"\n").unwrap();
        let orbits = sys.build().unwrap().orbits;
        let up = site.enu().2;
        let mut obs = Vec::new();
        let mut t = 0.0;
        while t <= 300.0 {
            let ru = [
                user[0] + vel[0] * t,
                user[1] + vel[1] * t,
                user[2] + vel[2] * t,
            ];
            for o in &orbits {
                let (rs, vs) = o.state(t);
                if crate::leo_fusion::geom::elevation(ru, up, rs) > 10.0 * DEG {
                    obs.push(RangeRateObs {
                        t_s: t,
                        sat_pos: rs,
                        sat_vel: vs,
                        range_rate_mps: range_rate(ru, vel, rs, vs),
                        sigma_mps: 0.1,
                    });
                }
            }
            t += 10.0;
        }
        assert!(obs.len() > 20, "{}", obs.len());
        let opts = DopplerOptions {
            estimate_velocity: true,
            ..Default::default()
        };
        let fix = solve(&obs, &opts, [user[0] + 1e3, user[1], user[2] - 1e3], None).unwrap();
        assert!(norm(sub(fix.position, user)) < 1e-2);
        assert!(norm(sub(fix.velocity, vel)) < 1e-4);
    }
}
