// SPDX-License-Identifier: AGPL-3.0-only
//! Orbit determination: recover a satellite's orbital state from ground-station tracking.
//!
//! Given tracking measurements from known ground stations to a satellite across a tracking arc, recover
//! the satellite's initial state `[r, v]` (the classic orbit-determination problem). This composes
//! three shipped pieces into a working pipeline: the **two-body + J2 force model**
//! ([`crate::forces`]) and the **RK4 integrator** ([`crate::integrator`]) propagate a candidate
//! state across the arc, and on the range-only path a model predicts each station range; the **Gauss–Newton
//! batch least-squares corrector** ([`crate::batch_ls::gauss_newton`]) then drives the candidate
//! onto the state that best explains the measurements. The same force-model dynamics and range model
//! also drive a **sequential** (recursive) determination on the shipped unscented filter
//! ([`crate::fusion::ukf::Ukf`]), so both the batch and the sequential estimators are available.
//!
//! **Tracking measurements (range, range-rate, azimuth/elevation).** A second, opt-in batch path
//! ([`determine_orbit_batch_tracking`]) fits a list of [`TrackingObs`] of mixed kinds
//! ([`MeasurementType::Range`], [`MeasurementType::RangeRate`], [`MeasurementType::AzEl`]) with
//! **analytic measurement partials** ([`measurement_with_partials`]) chained through the
//! **variational state-transition matrix** ([`propagate_with_stm`]): `Φ(t, t0)` is integrated
//! alongside the state by the same fixed-step RK4, with the dynamics matrix `A(t)` built from the
//! closed-form two-body + J2 gravity gradient ([`gravity_gradient`]), so the corrector's Jacobian
//! is `H = (∂h/∂x(t))·Φ(t, t0)` with no finite differencing
//! ([`crate::batch_ls::gauss_newton_analytic`]). Station visibility is an elevation mask
//! ([`is_visible`]) in the station's topocentric east-north-up frame (zenith along the station's
//! geocentric radius, i.e. a spherical Earth).
//!
//! Model conventions (both paths): the dynamics are two-body + J2 in an inertial frame; stations
//! are **fixed inertial points** (no Earth rotation); every measurement is **instantaneous and
//! geometric** (no light time, no aberration, no refraction); range-rate is the line-of-sight
//! projection of the satellite's inertial velocity (the station is at rest); azimuth is measured
//! from north through east in `[0, 2π)`, elevation from the local horizontal.
//!
//! Scope (honest): the range-only batch and sequential functions are unchanged and still use the
//! finite-difference Jacobian. The tracking path's STM is a *variational* STM (integrated, with
//! analytic two-body + J2 partials in `A(t)`), not a closed-form analytic STM. Higher-order
//! gravity, non-gravitational forces, light time, Earth rotation and a sequential filter for
//! range-rate/angles are not modelled here (`crate::precise_od` carries the full force model for
//! position fits).

use crate::batch_ls::{gauss_newton, LsqResult};
use crate::forces::{gravity_accel, J2, MU_EARTH, RE_EARTH};
use crate::fusion::ukf::Ukf;
use crate::integrator::rk4_step;
use crate::portable_math::PortableFloat;

/// A ground tracking station at a fixed ECEF position (m).
#[derive(Clone, Copy, Debug)]
pub struct Station {
    /// Station ECEF position (m).
    pub pos: [f64; 3],
}

/// Derivative of the six-state `[r, v]` under the two-body + J2 gravity field: `ṙ = v`, `v̇ = g(r)`.
fn gravity_deriv(_t: f64, y: &[f64]) -> Vec<f64> {
    let a = gravity_accel([y[0], y[1], y[2]]);
    vec![y[3], y[4], y[5], a[0], a[1], a[2]]
}

/// Propagate the six-state `x0` forward, returning its position at each of `n_epochs` epochs spaced
/// `dt` seconds apart (epoch `k` is `x0` advanced by `k·dt`, for `k = 1..=n_epochs`).
pub fn propagate_positions(x0: &[f64], dt: f64, n_epochs: usize) -> Vec<[f64; 3]> {
    let mut s = x0.to_vec();
    let mut out = Vec::with_capacity(n_epochs);
    for _ in 0..n_epochs {
        s = rk4_step(&gravity_deriv, 0.0, &s, dt);
        out.push([s[0], s[1], s[2]]);
    }
    out
}

fn range_to(sat: [f64; 3], station: &Station) -> f64 {
    let d = [
        sat[0] - station.pos[0],
        sat[1] - station.pos[1],
        sat[2] - station.pos[2],
    ];
    (d[0] * d[0] + d[1] * d[1] + d[2] * d[2]).sqrt()
}

/// Predicted range measurements for an initial state `x0`: propagate across the arc and, at each
/// epoch, the range to every station — stacked epoch-major (`epoch 1 × all stations`, then
/// `epoch 2 × …`). This is the measurement model the batch corrector inverts.
pub fn predict_ranges(x0: &[f64], stations: &[Station], dt: f64, n_epochs: usize) -> Vec<f64> {
    let positions = propagate_positions(x0, dt, n_epochs);
    let mut z = Vec::with_capacity(n_epochs * stations.len());
    for sat in positions {
        for st in stations {
            z.push(range_to(sat, st));
        }
    }
    z
}

/// **Batch** orbit determination: recover the initial state best explaining the stacked range
/// measurements `z` (epoch-major, matching [`predict_ranges`]) by Gauss–Newton least squares from
/// the initial guess `x0`. `weights` is one `1/σ²` per measurement. Returns `None` on a dimension
/// mismatch or rank-deficient geometry.
#[allow(clippy::too_many_arguments)]
pub fn determine_orbit_batch(
    z: &[f64],
    weights: &[f64],
    x0: &[f64],
    stations: &[Station],
    dt: f64,
    n_epochs: usize,
    max_iter: usize,
    tol: f64,
) -> Option<LsqResult> {
    let stations = stations.to_vec();
    gauss_newton(
        |x| predict_ranges(x, &stations, dt, n_epochs),
        z,
        weights,
        x0,
        max_iter,
        tol,
    )
}

/// [`determine_orbit_batch`] by the opt-in square-root solver
/// ([`crate::batch_ls::gauss_newton_srif`]): each Gauss–Newton step is solved by Householder QR of
/// the whitened Jacobian instead of inverting the normal matrix, and the formal covariance of the
/// initial state is returned from the same triangular factor. The default batch solver is
/// unchanged.
#[allow(clippy::too_many_arguments)]
pub fn determine_orbit_batch_srif(
    z: &[f64],
    weights: &[f64],
    x0: &[f64],
    stations: &[Station],
    dt: f64,
    n_epochs: usize,
    max_iter: usize,
    tol: f64,
) -> Option<(LsqResult, Vec<Vec<f64>>)> {
    let stations = stations.to_vec();
    crate::batch_ls::gauss_newton_srif(
        |x| predict_ranges(x, &stations, dt, n_epochs),
        z,
        weights,
        x0,
        max_iter,
        tol,
    )
}

/// **Sequential** orbit determination: starting from `x0`/`p0`, step a [`Ukf`] forward through the
/// force-model dynamics and update it with each epoch's station ranges in turn, returning the final
/// filter. `ranges_per_epoch[k]` holds one range per station for epoch `k` (spaced `dt` apart);
/// `q` is the per-step process noise and `sigma` the per-range standard deviation.
pub fn determine_orbit_sequential(
    x0: Vec<f64>,
    p0: Vec<Vec<f64>>,
    q: &[Vec<f64>],
    stations: &[Station],
    ranges_per_epoch: &[Vec<f64>],
    sigma: f64,
    dt: f64,
) -> Ukf {
    let mut ukf = Ukf::new(x0, p0);
    ukf.alpha = 1.0;
    ukf.kappa = 0.0;
    let stations = stations.to_vec();
    let predict = move |s: &[f64]| rk4_step(&gravity_deriv, 0.0, s, dt);
    for epoch in ranges_per_epoch {
        ukf.predict(predict, q);
        let stns = stations.clone();
        let h = move |s: &[f64]| {
            stns.iter()
                .map(|st| range_to([s[0], s[1], s[2]], st))
                .collect()
        };
        let k = epoch.len();
        let mut r = vec![vec![0.0; k]; k];
        for (i, row) in r.iter_mut().enumerate() {
            row[i] = sigma * sigma;
        }
        ukf.update(h, epoch, &r);
    }
    ukf
}

/// The kind of a ground-station tracking measurement.
#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub enum MeasurementType {
    /// Instantaneous geometric range `|r − s|` (m).
    Range,
    /// Instantaneous geometric range-rate `(r − s)·v / |r − s|` (m/s), the station at rest.
    RangeRate,
    /// Azimuth (from north through east, `[0, 2π)`) and elevation (rad) in the station's
    /// topocentric east-north-up frame.
    AzEl,
}

impl MeasurementType {
    /// Number of scalar components (1 for range and range-rate, 2 for azimuth/elevation).
    pub fn dim(self) -> usize {
        match self {
            MeasurementType::AzEl => 2,
            _ => 1,
        }
    }
}

/// One tracking observation for [`determine_orbit_batch_tracking`].
#[derive(Clone, Copy, Debug, PartialEq)]
pub struct TrackingObs {
    /// Epoch index `k`: the measurement time is `t0 + k·dt` (`k = 0` is the epoch state itself).
    pub epoch: usize,
    /// Index of the observing station in the station list.
    pub station: usize,
    /// Measurement kind.
    pub kind: MeasurementType,
    /// Measured value: `[ρ, —]` (m), `[ρ̇, —]` (m/s) or `[azimuth, elevation]` (rad).
    pub value: [f64; 2],
    /// One-sigma noise of each component (same units as `value`); the weight is `1/σ²`.
    pub sigma: [f64; 2],
}

/// The station's topocentric unit axes `[east, north, up]` in the inertial frame. `up` is the
/// station's geocentric radial direction (spherical Earth); `east = ẑ × up / |ẑ × up|` and
/// `north = up × east`. `None` for a station at the origin or on the polar axis.
pub fn topocentric_axes(station: &Station) -> Option<[[f64; 3]; 3]> {
    let s = station.pos;
    let sn = norm3(s);
    if sn == 0.0 {
        return None;
    }
    let up = [s[0] / sn, s[1] / sn, s[2] / sn];
    let h = (up[0] * up[0] + up[1] * up[1]).sqrt();
    if h < 1e-12 {
        return None;
    }
    let east = [-up[1] / h, up[0] / h, 0.0];
    let north = cross3(up, east);
    Some([east, north, up])
}

/// Elevation (rad) of the satellite position `sat` above the station's local horizontal
/// (zenith along the station's geocentric radius).
pub fn elevation(sat: [f64; 3], station: &Station) -> f64 {
    let d = sub3(sat, station.pos);
    let sn = norm3(station.pos);
    let up = [
        station.pos[0] / sn,
        station.pos[1] / sn,
        station.pos[2] / sn,
    ];
    (dot3(d, up) / norm3(d)).clamp(-1.0, 1.0).pasin()
}

/// Station visibility: `true` when the satellite at `sat` is at or above the elevation mask
/// `mask_rad` of `station`.
pub fn is_visible(sat: [f64; 3], station: &Station, mask_rad: f64) -> bool {
    elevation(sat, station) >= mask_rad
}

/// The predicted measurement for `kind` from the inertial satellite state `x = [r, v]` (at the
/// measurement time) and its **analytic** partials `∂h/∂x` (one 6-row per scalar component).
/// Returns `None` for degenerate geometry (the satellite on the station, at the station's
/// zenith for azimuth, or a station on the polar axis for azimuth/elevation).
///
/// * Range `ρ = |d|`, `d = r − s`: `∂ρ/∂r = d/ρ`, `∂ρ/∂v = 0`.
/// * Range-rate `ρ̇ = d·v/ρ`: `∂ρ̇/∂r = (v − ρ̇ d/ρ)/ρ`, `∂ρ̇/∂v = d/ρ`.
/// * Azimuth `atan2(d·e, d·n)` and elevation `atan2(d·u, h)`, `h = √((d·e)² + (d·n)²)`, with the
///   [`topocentric_axes`] `e, n, u`: `∂az/∂r = ((d·n) e − (d·e) n)/h²` and
///   `∂el/∂r = (h u − (d·u)((d·e) e + (d·n) n)/h)/ρ²`; both are independent of `v`.
pub fn measurement_with_partials(
    kind: MeasurementType,
    x: &[f64],
    station: &Station,
) -> Option<(Vec<f64>, Vec<[f64; 6]>)> {
    let r = [x[0], x[1], x[2]];
    let v = [x[3], x[4], x[5]];
    let d = sub3(r, station.pos);
    let rho = norm3(d);
    if rho == 0.0 {
        return None;
    }
    match kind {
        MeasurementType::Range => {
            let g = [d[0] / rho, d[1] / rho, d[2] / rho, 0.0, 0.0, 0.0];
            Some((vec![rho], vec![g]))
        }
        MeasurementType::RangeRate => {
            let rr = dot3(d, v) / rho;
            let mut g = [0.0; 6];
            for k in 0..3 {
                g[k] = (v[k] - rr * d[k] / rho) / rho;
                g[k + 3] = d[k] / rho;
            }
            Some((vec![rr], vec![g]))
        }
        MeasurementType::AzEl => {
            let [e, n, u] = topocentric_axes(station)?;
            let (de, dn, du) = (dot3(d, e), dot3(d, n), dot3(d, u));
            let h2 = de * de + dn * dn;
            if h2 == 0.0 {
                return None;
            }
            let h = h2.sqrt();
            let mut az = de.patan2(dn);
            if az < 0.0 {
                az += std::f64::consts::TAU;
            }
            let el = du.patan2(h);
            let mut ga = [0.0; 6];
            let mut ge = [0.0; 6];
            for k in 0..3 {
                ga[k] = (dn * e[k] - de * n[k]) / h2;
                ge[k] = (h * u[k] - du * (de * e[k] + dn * n[k]) / h) / (rho * rho);
            }
            Some((vec![az, el], vec![ga, ge]))
        }
    }
}

/// The closed-form gravity gradient `G = ∂g/∂r` (s⁻²) of the two-body + J2 acceleration
/// [`crate::forces::gravity_accel`]: `G_2b = −μ/r³ I + 3μ/r⁵ r rᵀ`, and for
/// `a_J2 = c·[x f₁, y f₁, z f₃]` with `c = −1.5 J2 μ Re²/r⁵`, `f₁ = 1 − 5z²/r²`,
/// `f₃ = 3 − 5z²/r²`: `∂c/∂r_j = −5c r_j/r²` and `∂f/∂r_j = −5(2z δ_jz/r² − 2z² r_j/r⁴)`.
pub fn gravity_gradient(r: [f64; 3]) -> [[f64; 3]; 3] {
    let r2 = dot3(r, r);
    let rn = r2.sqrt();
    let r3 = r2 * rn;
    let r5 = r3 * r2;
    let mut g = [[0.0; 3]; 3];
    for (i, row) in g.iter_mut().enumerate() {
        for (j, gij) in row.iter_mut().enumerate() {
            let diag = if i == j { MU_EARTH / r3 } else { 0.0 };
            *gij = 3.0 * MU_EARTH * r[i] * r[j] / r5 - diag;
        }
    }
    let z = r[2];
    let zr2 = z * z / r2;
    let c = -1.5 * J2 * MU_EARTH * RE_EARTH * RE_EARTH / r5;
    let f1 = 1.0 - 5.0 * zr2;
    let f3 = 3.0 - 5.0 * zr2;
    let f = [f1, f1, f3];
    for (i, row) in g.iter_mut().enumerate() {
        for (j, gij) in row.iter_mut().enumerate() {
            let dc = -5.0 * c * r[j] / r2;
            let dz = if j == 2 { 2.0 * z / r2 } else { 0.0 };
            let df = -5.0 * (dz - 2.0 * z * z * r[j] / (r2 * r2));
            let delta = if i == j { 1.0 } else { 0.0 };
            *gij += dc * r[i] * f[i] + c * delta * f[i] + c * r[i] * df;
        }
    }
    g
}

/// Derivative of the augmented 42-vector `[r, v, Φ (row-major)]`: the state under two-body + J2
/// and the variational equations `Φ̇ = A Φ`, `A = [[0, I], [G(r), 0]]`.
fn stm_deriv(_t: f64, y: &[f64]) -> Vec<f64> {
    let r = [y[0], y[1], y[2]];
    let a = gravity_accel(r);
    let g = gravity_gradient(r);
    let mut out = vec![0.0; 42];
    out[..3].copy_from_slice(&y[3..6]);
    out[3..6].copy_from_slice(&a);
    let phi = &y[6..42];
    for j in 0..6 {
        for i in 0..3 {
            // Rows 0..3 of Φ̇ are rows 3..6 of Φ; rows 3..6 are G · rows 0..3 of Φ.
            out[6 + i * 6 + j] = phi[(i + 3) * 6 + j];
            out[6 + (i + 3) * 6 + j] = (0..3).map(|k| g[i][k] * phi[k * 6 + j]).sum();
        }
    }
    out
}

/// A propagated state `[r, v]` and its state-transition matrix `Φ(t, t0)`.
pub type StateAndStm = ([f64; 6], [[f64; 6]; 6]);

/// Propagate `x0` with its **variational state-transition matrix**: returns, for
/// `k = 0..=n_epochs`, the state `x(t0 + k·dt)` and `Φ(t0 + k·dt, t0) = ∂x(t)/∂x0`. The augmented
/// system (state plus `Φ̇ = A(t)Φ`, with the analytic two-body + J2 [`gravity_gradient`] in `A`)
/// is integrated by the same fixed-step RK4 of step `dt` as [`propagate_positions`], so the state
/// is the same trajectory and `Φ` is the derivative of that discrete RK4 map (to rounding).
pub fn propagate_with_stm(x0: &[f64], dt: f64, n_epochs: usize) -> Vec<StateAndStm> {
    let mut y = vec![0.0; 42];
    y[..6].copy_from_slice(&x0[..6]);
    for i in 0..6 {
        y[6 + i * 6 + i] = 1.0;
    }
    let unpack = |y: &[f64]| {
        let mut s = [0.0; 6];
        s.copy_from_slice(&y[..6]);
        let mut phi = [[0.0; 6]; 6];
        for (i, row) in phi.iter_mut().enumerate() {
            row.copy_from_slice(&y[6 + i * 6..12 + i * 6]);
        }
        (s, phi)
    };
    let mut out = Vec::with_capacity(n_epochs + 1);
    out.push(unpack(&y));
    for _ in 0..n_epochs {
        y = rk4_step(&stm_deriv, 0.0, &y, dt);
        out.push(unpack(&y));
    }
    out
}

/// Simulate the noiseless tracking measurements of each `(kind, sigma)` in `kinds` from every
/// station at every epoch `k = 1..=n_epochs` at which the satellite is visible above
/// `elevation_mask_rad` ([`is_visible`]), ordered epoch-major, then by station, then by `kinds`
/// order. The `sigma` is attached to the observation for weighting.
pub fn simulate_tracking(
    x0: &[f64],
    stations: &[Station],
    dt: f64,
    n_epochs: usize,
    kinds: &[(MeasurementType, [f64; 2])],
    elevation_mask_rad: f64,
) -> Vec<TrackingObs> {
    let traj = propagate_with_stm(x0, dt, n_epochs);
    let mut out = Vec::new();
    for (k, (x, _)) in traj.iter().enumerate().skip(1) {
        for (si, st) in stations.iter().enumerate() {
            if !is_visible([x[0], x[1], x[2]], st, elevation_mask_rad) {
                continue;
            }
            for &(kind, sigma) in kinds {
                if let Some((h, _)) = measurement_with_partials(kind, x, st) {
                    let mut value = [0.0; 2];
                    value[..h.len()].copy_from_slice(&h);
                    out.push(TrackingObs {
                        epoch: k,
                        station: si,
                        kind,
                        value,
                        sigma,
                    });
                }
            }
        }
    }
    out
}

/// Predicted tracking measurements for the epoch state `x0` and their Jacobian with respect to
/// `x0`, `H = (∂h/∂x(t))·Φ(t, t0)`, stacked in observation order (two rows for each azimuth/
/// elevation pair). Each predicted azimuth is shifted by a multiple of `2π` to lie within `π` of
/// its observed value, so residuals never wrap. `None` on an out-of-range station index or a
/// degenerate geometry.
pub fn predict_tracking(
    x0: &[f64],
    obs: &[TrackingObs],
    stations: &[Station],
    dt: f64,
) -> Option<(Vec<f64>, Vec<Vec<f64>>)> {
    let n_epochs = obs.iter().map(|o| o.epoch).max().unwrap_or(0);
    let traj = propagate_with_stm(x0, dt, n_epochs);
    let mut h = Vec::new();
    let mut jac = Vec::new();
    for o in obs {
        let (x, phi) = &traj[o.epoch];
        let (vals, parts) = measurement_with_partials(o.kind, x, stations.get(o.station)?)?;
        for (c, (mut val, p)) in vals.into_iter().zip(parts).enumerate() {
            if o.kind == MeasurementType::AzEl && c == 0 {
                let tau = std::f64::consts::TAU;
                val += tau * ((o.value[0] - val) / tau).round();
            }
            h.push(val);
            jac.push(
                (0..6)
                    .map(|j| (0..6).map(|i| p[i] * phi[i][j]).sum())
                    .collect(),
            );
        }
    }
    Some((h, jac))
}

/// The outcome of [`determine_orbit_batch_tracking`].
#[derive(Clone, Debug)]
pub struct TrackingFit {
    /// Estimated epoch state `[r (m), v (m/s)]`.
    pub x: Vec<f64>,
    /// Gauss–Newton iterations run.
    pub iterations: usize,
    /// `true` when the step norm fell below `tol`.
    pub converged: bool,
    /// Formal covariance `(HᵀWH)⁻¹` of the epoch state at the solution.
    pub covariance: Vec<Vec<f64>>,
    /// RMS of the sigma-normalised post-fit residuals `(z − h)/σ` over all scalar components.
    pub normalized_rms: f64,
    /// Post-fit residual RMS of the range observations (m); `None` when there are none.
    pub rms_range: Option<f64>,
    /// Post-fit residual RMS of the range-rate observations (m/s).
    pub rms_range_rate: Option<f64>,
    /// Post-fit residual RMS of the azimuths (rad).
    pub rms_azimuth: Option<f64>,
    /// Post-fit residual RMS of the elevations (rad).
    pub rms_elevation: Option<f64>,
    /// Number of scalar measurement components fitted.
    pub n_components: usize,
}

/// Flatten observations into the measurement vector `z` and the weights `1/σ²`.
fn stack_obs(obs: &[TrackingObs]) -> (Vec<f64>, Vec<f64>) {
    let mut z = Vec::new();
    let mut w = Vec::new();
    for o in obs {
        for c in 0..o.kind.dim() {
            z.push(o.value[c]);
            w.push(1.0 / (o.sigma[c] * o.sigma[c]));
        }
    }
    (z, w)
}

/// **Batch** orbit determination from mixed range, range-rate and azimuth/elevation tracking with
/// the **state-transition-matrix Jacobian**: Gauss–Newton
/// ([`crate::batch_ls::gauss_newton_analytic`]) on `H = (∂h/∂x(t))·Φ(t, t0)` from
/// [`predict_tracking`], starting at `x0`, weights `1/σ²` from each observation. Returns `None` on
/// fewer scalar measurements than the six unknowns, a non-positive sigma, an out-of-range station,
/// degenerate geometry or rank deficiency.
pub fn determine_orbit_batch_tracking(
    obs: &[TrackingObs],
    x0: &[f64],
    stations: &[Station],
    dt: f64,
    max_iter: usize,
    tol: f64,
) -> Option<TrackingFit> {
    let bad_sigma = obs
        .iter()
        .any(|o| (0..o.kind.dim()).any(|c| o.sigma[c].is_nan() || o.sigma[c] <= 0.0));
    if bad_sigma || x0.len() < 6 {
        return None;
    }
    let (z, w) = stack_obs(obs);
    let model = |x: &[f64]| predict_tracking(x, obs, stations, dt);
    let (lsq, covariance) =
        crate::batch_ls::gauss_newton_analytic(model, &z, &w, &x0[..6], max_iter, tol)?;
    let (h, _) = predict_tracking(&lsq.x, obs, stations, dt)?;
    let mut sums = [(0.0, 0usize); 4];
    let mut norm = 0.0;
    let mut i = 0;
    for o in obs {
        for c in 0..o.kind.dim() {
            let r = z[i] - h[i];
            norm += r * r * w[i];
            let slot = match (o.kind, c) {
                (MeasurementType::Range, _) => 0,
                (MeasurementType::RangeRate, _) => 1,
                (MeasurementType::AzEl, 0) => 2,
                _ => 3,
            };
            sums[slot].0 += r * r;
            sums[slot].1 += 1;
            i += 1;
        }
    }
    let rms = |k: usize| (sums[k].1 > 0).then(|| (sums[k].0 / sums[k].1 as f64).sqrt());
    Some(TrackingFit {
        x: lsq.x,
        iterations: lsq.iterations,
        converged: lsq.converged,
        covariance,
        normalized_rms: (norm / z.len() as f64).sqrt(),
        rms_range: rms(0),
        rms_range_rate: rms(1),
        rms_azimuth: rms(2),
        rms_elevation: rms(3),
        n_components: z.len(),
    })
}

fn sub3(a: [f64; 3], b: [f64; 3]) -> [f64; 3] {
    [a[0] - b[0], a[1] - b[1], a[2] - b[2]]
}
fn dot3(a: [f64; 3], b: [f64; 3]) -> f64 {
    a[0] * b[0] + a[1] * b[1] + a[2] * b[2]
}
fn norm3(a: [f64; 3]) -> f64 {
    dot3(a, a).sqrt()
}
fn cross3(a: [f64; 3], b: [f64; 3]) -> [f64; 3] {
    [
        a[1] * b[2] - a[2] * b[1],
        a[2] * b[0] - a[0] * b[2],
        a[0] * b[1] - a[1] * b[0],
    ]
}

#[cfg(test)]
mod tests {
    use super::*;
    use crate::forces::MU_EARTH;
    use crate::portable_distr::{Distribution, Normal};
    use crate::portable_math::PortableFloat;
    use rand::SeedableRng;
    use rand_chacha::ChaCha8Rng;

    // Three ground stations spread around the Earth (ECEF, on the equatorial surface and a tilt).
    fn stations() -> Vec<Station> {
        vec![
            Station {
                pos: [6.378e6, 0.0, 0.0],
            },
            Station {
                pos: [0.0, 6.378e6, 0.0],
            },
            Station {
                pos: [3.5e6, 3.5e6, 4.0e6],
            },
        ]
    }

    // A true LEO orbital state [r, v]: circular speed at r = 7000 km, inclined 35°.
    fn truth_state() -> [f64; 6] {
        let r = 7.0e6_f64;
        let v = (MU_EARTH / r).sqrt();
        let inc = 35.0_f64.to_radians();
        [r, 0.0, 0.0, 0.0, v * inc.pcos(), v * inc.psin()]
    }

    fn pos_err(est: &[f64], truth: &[f64]) -> f64 {
        let d = [est[0] - truth[0], est[1] - truth[1], est[2] - truth[2]];
        (d[0] * d[0] + d[1] * d[1] + d[2] * d[2]).sqrt()
    }
    fn vel_err(est: &[f64], truth: &[f64]) -> f64 {
        let d = [est[3] - truth[3], est[4] - truth[4], est[5] - truth[5]];
        (d[0] * d[0] + d[1] * d[1] + d[2] * d[2]).sqrt()
    }

    #[test]
    fn range_prediction_starts_at_the_geometric_range() {
        let truth = truth_state();
        let stns = stations();
        let dt = 30.0;
        let z = predict_ranges(&truth, &stns, dt, 1);
        // First epoch is one dt in; the orbit has moved, but the range to each station is a valid
        // Euclidean distance and changes across the arc (so the geometry is informative).
        assert_eq!(z.len(), stns.len());
        let later = predict_ranges(&truth, &stns, dt, 20);
        assert_eq!(later.len(), 20 * stns.len());
        // The range to station 0 is not constant across the arc (the satellite is moving).
        assert!((later[0] - later[later.len() - stns.len()]).abs() > 1.0);
    }

    #[test]
    fn batch_recovers_orbit_from_noiseless_ranges() {
        let truth = truth_state();
        let stns = stations();
        let dt = 20.0;
        let n = 30; // a 10-minute tracking arc
        let z = predict_ranges(&truth, &stns, dt, n);
        let weights = vec![1.0; z.len()];
        // A guess perturbed ~1 km in position and ~5 m/s in velocity.
        let guess = [
            truth[0] + 1000.0,
            truth[1] - 800.0,
            truth[2] + 600.0,
            truth[3] + 5.0,
            truth[4] - 4.0,
            truth[5] + 3.0,
        ];
        let sol = determine_orbit_batch(&z, &weights, &guess, &stns, dt, n, 30, 1e-9)
            .expect("OD converges");
        assert!(sol.converged, "did not converge: {sol:?}");
        // Noiseless ranges + an exact dynamic model ⇒ the corrector recovers the true state tightly.
        assert!(
            pos_err(&sol.x, &truth) < 1.0,
            "position error {} m",
            pos_err(&sol.x, &truth)
        );
        assert!(
            vel_err(&sol.x, &truth) < 1e-3,
            "velocity error {} m/s",
            vel_err(&sol.x, &truth)
        );
    }

    #[test]
    fn the_srif_batch_matches_the_default_batch_and_returns_a_covariance() {
        let truth = truth_state();
        let stns = stations();
        let (dt, n) = (20.0, 30);
        let clean = predict_ranges(&truth, &stns, dt, n);
        let mut rng = ChaCha8Rng::seed_from_u64(0x0D_0D_0E);
        let noise = Normal::new(0.0, 5.0).unwrap();
        let z: Vec<f64> = clean.iter().map(|&r| r + noise.sample(&mut rng)).collect();
        let weights = vec![1.0 / 25.0; z.len()];
        let guess = [
            truth[0] + 1000.0,
            truth[1] - 800.0,
            truth[2] + 600.0,
            truth[3] + 5.0,
            truth[4] - 4.0,
            truth[5] + 3.0,
        ];
        // The noisy-range tolerance of the default test: both correctors stall at the
        // finite-difference noise floor below it, at slightly different points.
        let a = determine_orbit_batch(&z, &weights, &guess, &stns, dt, n, 50, 1e-3).expect("runs");
        let (b, cov) =
            determine_orbit_batch_srif(&z, &weights, &guess, &stns, dt, n, 50, 1e-3).expect("runs");
        // They reach the same least-squares state to a small fraction of the formal sigma (the two
        // solvers round differently; neither is an oracle for the other here).
        for (k, (p, q)) in a.x.iter().zip(&b.x).enumerate() {
            assert!((p - q).abs() < 1e-2 * cov[k][k].sqrt(), "x[{k}] {p} vs {q}");
        }
        // The formal covariance is symmetric positive-definite and its position sigma covers the
        // achieved position error at a few sigma.
        for i in 0..6 {
            assert!(cov[i][i] > 0.0);
            for j in 0..6 {
                assert!((cov[i][j] - cov[j][i]).abs() <= 1e-12 * (cov[i][i] * cov[j][j]).sqrt());
            }
        }
        let pos_sigma = (cov[0][0] + cov[1][1] + cov[2][2]).sqrt();
        let err = ((b.x[0] - truth[0]).ppowi(2)
            + (b.x[1] - truth[1]).ppowi(2)
            + (b.x[2] - truth[2]).ppowi(2))
        .sqrt();
        assert!(
            err < 5.0 * pos_sigma,
            "error {err} m vs sigma {pos_sigma} m"
        );
    }

    #[test]
    fn batch_recovers_orbit_from_noisy_ranges_within_bound() {
        let truth = truth_state();
        let stns = stations();
        let dt = 20.0;
        let n = 30;
        let clean = predict_ranges(&truth, &stns, dt, n);
        let mut rng = ChaCha8Rng::seed_from_u64(0x0D_0D_0D);
        let noise = Normal::new(0.0, 5.0).unwrap(); // σ = 5 m ranging noise
        let z: Vec<f64> = clean.iter().map(|&r| r + noise.sample(&mut rng)).collect();
        let weights = vec![1.0 / 25.0; z.len()]; // 1/σ²
        let guess = [
            truth[0] + 1000.0,
            truth[1] - 800.0,
            truth[2] + 600.0,
            truth[3] + 5.0,
            truth[4] - 4.0,
            truth[5] + 3.0,
        ];
        let sol =
            determine_orbit_batch(&z, &weights, &guess, &stns, dt, n, 50, 1e-3).expect("OD runs");
        // The real OD acceptance is the estimate, not the internal step-norm flag: with 5 m ranging
        // noise over a 90-measurement arc the batch estimate recovers position to a few metres, and
        // the post-fit residual RMS sits at the measurement-noise floor (≈ σ = 5 m), the signature
        // of a consistent least-squares fit. (The `converged` flag stays false here because at the
        // noise floor the Gauss–Newton step oscillates above the 1e-3 m tolerance — expected.)
        assert!(
            pos_err(&sol.x, &truth) < 20.0,
            "position error {} m",
            pos_err(&sol.x, &truth)
        );
        assert!(
            (3.0..8.0).contains(&sol.rms_residual),
            "post-fit RMS {} m (want ≈ σ = 5 m)",
            sol.rms_residual
        );
    }

    #[test]
    fn sequential_ukf_recovers_orbit_from_ranges() {
        let truth = truth_state();
        let stns = stations();
        let dt = 20.0;
        let n = 60; // a longer arc for the recursive estimator to converge
        let positions = propagate_positions(&truth, dt, n);
        let ranges_per_epoch: Vec<Vec<f64>> = positions
            .iter()
            .map(|&sat| stns.iter().map(|st| range_to(sat, st)).collect())
            .collect();
        let guess = vec![
            truth[0] + 1000.0,
            truth[1] - 800.0,
            truth[2] + 600.0,
            truth[3] + 5.0,
            truth[4] - 4.0,
            truth[5] + 3.0,
        ];
        let p0 = diag(&[1.0e6, 1.0e6, 1.0e6, 1.0e2, 1.0e2, 1.0e2]);
        let q = diag(&[1.0e-3, 1.0e-3, 1.0e-3, 1.0e-6, 1.0e-6, 1.0e-6]);
        let ukf = determine_orbit_sequential(guess, p0, &q, &stns, &ranges_per_epoch, 1.0, dt);
        // The recursive filter, processing the noiseless ranges one epoch at a time, converges onto
        // the truth state (final position at the last epoch).
        let final_truth = {
            let last = positions[n - 1];
            // truth velocity at the final epoch is not directly known here; check position only.
            [last[0], last[1], last[2], 0.0, 0.0, 0.0]
        };
        assert!(
            pos_err(&ukf.x, &final_truth) < 50.0,
            "sequential OD position error {} m",
            pos_err(&ukf.x, &final_truth)
        );
    }

    // ---- tracking (range / range-rate / az-el) path with the variational STM ----

    // Ground stations under the truth orbit (fixed inertial points on a 6378 km sphere), each
    // displaced a few degrees off the sub-satellite point at a fraction of the arc, so every
    // station sees a pass above the elevation mask.
    fn track_stations(truth: &[f64], dt: f64, n: usize) -> Vec<Station> {
        let traj = propagate_positions(truth, dt, n);
        [0.08, 0.27, 0.45, 0.63, 0.81, 0.95]
            .iter()
            .enumerate()
            .map(|(i, f)| {
                let p = traj[((n as f64 * f) as usize).min(n - 1)];
                let off = if i % 2 == 0 { 0.06 } else { -0.05 };
                let q = [p[0] + off * p[2], p[1], p[2] - off * p[0]];
                let qn = norm3(q);
                Station {
                    pos: [
                        6.378e6 * q[0] / qn,
                        6.378e6 * q[1] / qn,
                        6.378e6 * q[2] / qn,
                    ],
                }
            })
            .collect()
    }

    fn guess_of(truth: &[f64]) -> Vec<f64> {
        vec![
            truth[0] + 1000.0,
            truth[1] - 800.0,
            truth[2] + 600.0,
            truth[3] + 1.0,
            truth[4] - 0.8,
            truth[5] + 0.6,
        ]
    }

    #[test]
    fn the_gravity_gradient_matches_a_central_difference_of_the_acceleration() {
        for r in [
            [7.0e6, 0.0, 0.0],
            [4.1e6, -3.3e6, 4.4e6],
            [-1.2e7, 8.0e6, -1.5e7],
        ] {
            let g = gravity_gradient(r);
            for j in 0..3 {
                let h = 100.0;
                let (mut rp, mut rm) = (r, r);
                rp[j] += h;
                rm[j] -= h;
                let (ap, am) = (gravity_accel(rp), gravity_accel(rm));
                for i in 0..3 {
                    let fd = (ap[i] - am[i]) / (2.0 * h);
                    let scale = g[i][i].abs().max(g[0][0].abs());
                    assert!(
                        (g[i][j] - fd).abs() < 1e-7 * scale,
                        "G[{i}][{j}] {} vs {fd}",
                        g[i][j]
                    );
                }
            }
        }
    }

    #[test]
    fn the_measurement_partials_match_central_differences() {
        let st = Station {
            pos: [3.5e6, 3.5e6, 4.0e6],
        };
        let x = [5.1e6, 4.2e6, 3.9e6, -3200.0, 5100.0, 2900.0];
        for kind in [
            MeasurementType::Range,
            MeasurementType::RangeRate,
            MeasurementType::AzEl,
        ] {
            let (h0, p) = measurement_with_partials(kind, &x, &st).expect("geometry");
            assert_eq!(h0.len(), kind.dim());
            for j in 0..6 {
                let step = if j < 3 { 1.0 } else { 1e-3 };
                let (mut xp, mut xm) = (x, x);
                xp[j] += step;
                xm[j] -= step;
                let hp = measurement_with_partials(kind, &xp, &st).unwrap().0;
                let hm = measurement_with_partials(kind, &xm, &st).unwrap().0;
                for c in 0..kind.dim() {
                    let fd = (hp[c] - hm[c]) / (2.0 * step);
                    let tol = 1e-6 * p[c].iter().fold(0.0f64, |a, v| a.max(v.abs()));
                    assert!(
                        (p[c][j] - fd).abs() <= tol,
                        "{kind:?}[{c}] d/dx{j}: {} vs {fd}",
                        p[c][j]
                    );
                }
            }
        }
        // Azimuth/elevation conventions: a satellite due north of an equatorial station on the
        // horizon plane has azimuth 0; one straight up has elevation 90°.
        let eq = Station {
            pos: [6.378e6, 0.0, 0.0],
        };
        let north = [6.378e6, 0.0, 1.0e6, 0.0, 0.0, 0.0];
        let (h, _) = measurement_with_partials(MeasurementType::AzEl, &north, &eq).unwrap();
        assert!(h[0].abs() < 1e-12 && h[1].abs() < 1e-12, "{h:?}");
        let east = [6.378e6, 1.0e6, 0.0, 0.0, 0.0, 0.0];
        let (h, _) = measurement_with_partials(MeasurementType::AzEl, &east, &eq).unwrap();
        assert!((h[0] - std::f64::consts::FRAC_PI_2).abs() < 1e-12);
        assert!((elevation([7.0e6, 0.0, 0.0], &eq) - std::f64::consts::FRAC_PI_2).abs() < 1e-12);
        assert!(is_visible([7.0e6, 1.0e5, 0.0], &eq, 10f64.to_radians()));
        assert!(!is_visible([-7.0e6, 0.0, 0.0], &eq, 0.0));
    }

    #[test]
    fn the_variational_stm_reproduces_the_state_and_matches_whole_arc_differences() {
        let truth = truth_state();
        let (dt, n) = (20.0, 120);
        let traj = propagate_with_stm(&truth, dt, n);
        // The state part is the existing RK4 trajectory, bit for bit.
        let pos = propagate_positions(&truth, dt, n);
        for k in 1..=n {
            assert_eq!([traj[k].0[0], traj[k].0[1], traj[k].0[2]], pos[k - 1]);
        }
        // Φ(t_n, t0) against a central difference of the whole propagated arc.
        let phi = traj[n].1;
        for j in 0..6 {
            let step = if j < 3 { 1.0 } else { 1e-3 };
            let (mut xp, mut xm) = (truth, truth);
            xp[j] += step;
            xm[j] -= step;
            let sp = propagate_with_stm(&xp, dt, n)[n].0;
            let sm = propagate_with_stm(&xm, dt, n)[n].0;
            for i in 0..6 {
                let fd = (sp[i] - sm[i]) / (2.0 * step);
                let scale = (0..6).fold(0.0f64, |a, c| a.max(phi[i][c].abs()));
                assert!(
                    (phi[i][j] - fd).abs() < 1e-6 * scale,
                    "Φ[{i}][{j}] {} vs {fd}",
                    phi[i][j]
                );
            }
        }
    }

    #[test]
    fn tracking_batch_recovers_the_orbit_from_each_measurement_type_under_a_mask() {
        let truth = truth_state();
        let (dt, n) = (10.0, 600);
        let stns = track_stations(&truth, dt, n);
        let mask = 10f64.to_radians();
        for kinds in [
            vec![(MeasurementType::RangeRate, [5e-3, 0.0])],
            vec![(MeasurementType::AzEl, [1e-4, 1e-4])],
            vec![
                (MeasurementType::Range, [5.0, 0.0]),
                (MeasurementType::RangeRate, [5e-3, 0.0]),
                (MeasurementType::AzEl, [1e-4, 1e-4]),
            ],
        ] {
            let obs = simulate_tracking(&truth, &stns, dt, n, &kinds, mask);
            assert!(
                obs.len() > 40,
                "{kinds:?}: only {} visible observations",
                obs.len()
            );
            // Every simulated observation is at or above the mask.
            let traj = propagate_positions(&truth, dt, n);
            assert!(obs
                .iter()
                .all(|o| elevation(traj[o.epoch - 1], &stns[o.station]) >= mask));
            let fit = determine_orbit_batch_tracking(&obs, &guess_of(&truth), &stns, dt, 30, 1e-8)
                .expect("tracking OD runs");
            assert!(fit.converged, "{kinds:?}: {fit:?}");
            assert!(
                pos_err(&fit.x, &truth) < 1e-3,
                "{kinds:?}: {} m",
                pos_err(&fit.x, &truth)
            );
            assert!(
                vel_err(&fit.x, &truth) < 1e-6,
                "{kinds:?}: {} m/s",
                vel_err(&fit.x, &truth)
            );
            assert!(fit.normalized_rms < 1e-4);
        }
    }

    #[test]
    fn tracking_batch_on_noisy_mixed_data_sits_at_the_noise_floor() {
        let truth = truth_state();
        let (dt, n) = (10.0, 600);
        let stns = track_stations(&truth, dt, n);
        let kinds = [
            (MeasurementType::Range, [5.0, 0.0]),
            (MeasurementType::RangeRate, [5e-3, 0.0]),
            (MeasurementType::AzEl, [1e-4, 1e-4]),
        ];
        let mut obs = simulate_tracking(&truth, &stns, dt, n, &kinds, 5f64.to_radians());
        let mut rng = ChaCha8Rng::seed_from_u64(0x0D_7AC);
        let unit = Normal::new(0.0, 1.0).unwrap();
        for o in &mut obs {
            for c in 0..o.kind.dim() {
                o.value[c] += o.sigma[c] * unit.sample(&mut rng);
            }
        }
        let fit = determine_orbit_batch_tracking(&obs, &guess_of(&truth), &stns, dt, 30, 1e-6)
            .expect("runs");
        assert!(fit.converged);
        // A consistent weighted fit: the normalised residual RMS is ≈ 1, and the state error is
        // within a few formal sigma.
        assert!(
            (0.9..1.1).contains(&fit.normalized_rms),
            "{}",
            fit.normalized_rms
        );
        let pos_sigma = (fit.covariance[0][0] + fit.covariance[1][1] + fit.covariance[2][2]).sqrt();
        assert!(pos_err(&fit.x, &truth) < 5.0 * pos_sigma);
        assert!(fit.rms_range.unwrap() > 3.0 && fit.rms_range.unwrap() < 7.0);
        assert!(fit.rms_azimuth.is_some() && fit.rms_elevation.is_some());
        // Malformed input is refused.
        let mut bad = obs.clone();
        bad[0].sigma[0] = 0.0;
        assert!(determine_orbit_batch_tracking(&bad, &truth, &stns, dt, 5, 1e-6).is_none());
        bad[0].sigma[0] = 1.0;
        bad[0].station = 99;
        assert!(determine_orbit_batch_tracking(&bad, &truth, &stns, dt, 5, 1e-6).is_none());
    }

    fn diag(d: &[f64]) -> Vec<Vec<f64>> {
        let n = d.len();
        let mut m = vec![vec![0.0; n]; n];
        for (i, &v) in d.iter().enumerate() {
            m[i][i] = v;
        }
        m
    }
}
