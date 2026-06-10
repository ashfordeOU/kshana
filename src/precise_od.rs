// SPDX-License-Identifier: Apache-2.0
//! Full-force **precise orbit determination** from position observations — the reference-grade
//! estimator that fits Kshana's complete force model (EGM2008 tesseral gravity + solid/ocean/
//! atmospheric tides + Sun/Moon third body + SRP + drag + Schwarzschild/Lense–Thirring GR) to a
//! track of inertial position fixes and reports the post-fit residuals in the radial/transverse/
//! normal (RTN) frame.
//!
//! This is a distinct, focused responsibility from the teaching range-only
//! [`crate::orbit_determination`] (which stays the simple ground-station example). Here:
//!
//! * **Dynamics** — [`PreciseForceModel`], the EGM2008 spherical-harmonic field of
//!   [`crate::gravity_sh`] (which subsumes two-body + the zonal/tesseral field) composed with the
//!   validated perturbation free-functions of [`crate::forces`] and [`crate::tides`], integrated by
//!   the existing Dormand–Prince driver. The geopotential is evaluated in the Earth-fixed frame
//!   through the CIO reduction of [`crate::cio`].
//! * **Jacobian** — the 6×6 variational **state-transition matrix** Φ ([`propagate_with_stm`]),
//!   integrated alongside the state with a numerically-evaluated dynamics matrix `A = ∂f/∂x`
//!   (general across the full force model, where a hand-coded partial of a degree-70 field is
//!   impractical), **cross-checked against whole-arc finite difference** — that agreement is the
//!   STM correctness gate.
//! * **Estimator** — Gauss–Newton batch least squares (the STM supplies the dominant 6-state
//!   Jacobian in a single forward integration; SRP `C_R` and the optional empirical-acceleration
//!   parameters take finite-difference partials), with per-observation weighting and n-sigma
//!   outlier editing. Validated first on **synthetic** data: a Kshana arc fit back to its own
//!   initial state recovers it to the observation-noise floor.
//!
//! The honest scope for the first wave is the synthetic self-recovery + STM correctness; the
//! real-agency-dataset fits (Galileo MEO, Swarm-A LEO, LRO lunar) layer real EOP and SP3/SPK
//! truth on top of this engine in the validation harnesses.

use crate::cio::gcrs_to_itrs_matrix;
use crate::ephem::{moon_position, sun_position};
use crate::forces::{
    drag_accel, lense_thirring_accel, relativistic_accel, srp_accel, third_body_accel, MU_MOON,
    MU_SUN,
};
use crate::fusion::ukf::inverse;
use crate::gravity_sh::SphericalHarmonicField;
use crate::integrator::{integrate_dopri, Tolerance};
use crate::precession::{julian_centuries_tt, mat_vec, transpose, Mat3};
use crate::tides::tidal_acceleration;
use crate::timescales::SECONDS_PER_DAY;

type Vec3 = [f64; 3];

/// A short, stable module name for provenance/linking in reports.
pub const MODULE_NAME: &str = "precise-od";

// --- small vector helpers (kept local; the orbit stack uses bare `[f64; 3]`) ---

fn dot(a: Vec3, b: Vec3) -> f64 {
    a[0] * b[0] + a[1] * b[1] + a[2] * b[2]
}

fn cross(a: Vec3, b: Vec3) -> Vec3 {
    [
        a[1] * b[2] - a[2] * b[1],
        a[2] * b[0] - a[0] * b[2],
        a[0] * b[1] - a[1] * b[0],
    ]
}

fn norm(a: Vec3) -> f64 {
    dot(a, a).sqrt()
}

fn unit(a: Vec3) -> Vec3 {
    let n = norm(a);
    if n == 0.0 {
        [0.0, 0.0, 0.0]
    } else {
        [a[0] / n, a[1] / n, a[2] / n]
    }
}

/// The rotation from inertial (ECI/GCRS) into the orbit-local **radial/transverse/normal** frame
/// for the state `(r, v)`, returned as a [`Mat3`] whose rows are the RTN basis vectors expressed
/// in ECI: row 0 = R̂ = r̂, row 1 = T̂ (in-plane, ~along-track), row 2 = N̂ = (r×v)̂ (orbit normal /
/// cross-track). Applying it to an ECI vector `w` with [`mat_vec`] yields `(w_R, w_T, w_N)`.
///
/// T̂ = N̂ × R̂ completes a right-handed triad, so for a circular prograde orbit T̂ points along the
/// velocity; for an eccentric orbit it is the in-plane direction perpendicular to r (the
/// transverse, not the exact velocity, direction — the standard RTN/RIC convention).
pub fn ric_from_state(r: Vec3, v: Vec3) -> Mat3 {
    let r_hat = unit(r);
    let n_hat = unit(cross(r, v));
    let t_hat = cross(n_hat, r_hat); // already unit (N̂ ⟂ R̂, both unit)
    [r_hat, t_hat, n_hat]
}

/// Decompose an inertial vector `w` (e.g. a position residual) into its RTN components for the
/// state `(r, v)`: returns `[w_R, w_T, w_N]`.
pub fn to_rtn(w: Vec3, r: Vec3, v: Vec3) -> Vec3 {
    mat_vec(&ric_from_state(r, v), w)
}

/// A single inertial **position observation**: `t` seconds past the fit epoch, the GCRS/ECI
/// position fix `pos` (m), and its 1σ position uncertainty `sigma` (m) used for weighting.
#[derive(Clone, Copy, Debug)]
pub struct Observation {
    /// Seconds past the estimation epoch.
    pub t: f64,
    /// Inertial (ECI/GCRS) position, metres.
    pub pos: Vec3,
    /// One-sigma position uncertainty, metres (the observation weight is `1/σ²` per axis).
    pub sigma: f64,
}

/// Constant + once-per-revolution **empirical accelerations** in the RTN frame (m/s²) — the
/// labelled second estimation tier that absorbs unmodelled forces (e.g. SRP mismodelling). Each
/// axis carries `[constant, cos, sin]` amplitudes against the argument of latitude `u`:
/// `a_axis(u) = c0 + c_cos·cos u + c_sin·sin u`.
#[derive(Clone, Copy, Debug, Default, PartialEq)]
pub struct EmpiricalAccel {
    /// Radial `[const, cos u, sin u]` (m/s²).
    pub radial: [f64; 3],
    /// Transverse `[const, cos u, sin u]` (m/s²).
    pub transverse: [f64; 3],
    /// Normal `[const, cos u, sin u]` (m/s²).
    pub normal: [f64; 3],
}

/// The parameters recovered by a [`fit`] solve: the epoch inertial state, the optional estimated
/// SRP coefficient `C_R`, and the optional empirical-acceleration tier.
#[derive(Clone, Copy, Debug)]
pub struct EstimatedParams {
    /// Epoch inertial position (m).
    pub r0: Vec3,
    /// Epoch inertial velocity (m/s).
    pub v0: Vec3,
    /// Estimated SRP radiation-pressure coefficient, when `C_R` was a free parameter.
    pub cr: Option<f64>,
    /// Estimated empirical accelerations, when that tier was enabled.
    pub empirical: Option<EmpiricalAccel>,
}

/// The outcome of a precise-OD fit: post-fit residual statistics (3-D and RTN), the observation
/// bookkeeping, and the recovered parameters — always reportable with and without the empirical
/// tier so a reader sees what the estimator absorbed.
#[derive(Clone, Copy, Debug)]
pub struct OdReport {
    /// Post-fit 3-D position-residual RMS (m).
    pub rms_3d: f64,
    /// Post-fit position-residual RMS in `[radial, transverse, normal]` (m).
    pub rms_rtn: Vec3,
    /// Observations used in the final fit.
    pub n_obs: usize,
    /// Observations rejected by n-sigma outlier editing.
    pub n_edited: usize,
    /// Number of estimated parameters.
    pub n_params: usize,
    /// Gauss–Newton iterations run.
    pub iterations: usize,
    /// Whether the step norm fell below tolerance before the iteration budget.
    pub converged: bool,
    /// The recovered parameters.
    pub params: EstimatedParams,
}

/// The argument of latitude `u` (rad) of the state `(r, v)`: the in-plane angle from the
/// ascending node to the satellite, the conventional phase for once-per-revolution empirical
/// accelerations. For a (near-)equatorial orbit the node is degenerate, so an arbitrary but
/// consistent in-plane reference is used (the empirical tier still spans the plane).
fn arg_of_latitude(r: Vec3, v: Vec3) -> f64 {
    let h = cross(r, v);
    let n_hat = unit(h); // orbit normal
    let node = cross([0.0, 0.0, 1.0], h); // toward the ascending node, in-plane
    let p_hat = if norm(node) < 1e-9 * norm(h) {
        unit(cross(n_hat, [0.0, 1.0, 0.0])) // equatorial floor: any in-plane reference
    } else {
        unit(node)
    };
    let q_hat = cross(n_hat, p_hat); // 90° ahead, in the direction of motion
    dot(r, q_hat).atan2(dot(r, p_hat))
}

/// The empirical RTN acceleration (m/s², ECI) for `emp` at state `(r, v)`: each axis amplitude
/// `c0 + c_cos·cos u + c_sin·sin u` against the argument of latitude `u`, projected back onto the
/// inertial RTN basis vectors.
fn empirical_accel(emp: &EmpiricalAccel, r: Vec3, v: Vec3) -> Vec3 {
    let ric = ric_from_state(r, v); // rows = R̂, T̂, N̂ in ECI
    let u = arg_of_latitude(r, v);
    let (cu, su) = (u.cos(), u.sin());
    let comp = |c: [f64; 3]| c[0] + c[1] * cu + c[2] * su;
    let rtn = [comp(emp.radial), comp(emp.transverse), comp(emp.normal)];
    // a_eci = a_R·R̂ + a_T·T̂ + a_N·N̂ = ricᵀ·rtn.
    mat_vec(&transpose(&ric), rtn)
}

/// The reference-grade force model fit by [`fit`]: the EGM2008 spherical-harmonic geopotential
/// (which already contains two-body + the zonal/tesseral field) plus the configured perturbations
/// and the optional empirical-acceleration tier.
///
/// The geopotential is evaluated in the Earth-fixed frame through the CIO reduction; in this first
/// wave the Earth-orientation parameters are nominal (UT1 ≈ TT, no polar motion), which is exact
/// for synthetic self-recovery (the same model generates and fits the arc). The agency-data
/// harnesses (W3+) supply real finals2000A EOP through the same rotation.
#[derive(Clone, Debug)]
pub struct PreciseForceModel {
    /// The geopotential field (EGM2008 to some degree, or any [`SphericalHarmonicField`]).
    pub geopotential: SphericalHarmonicField,
    /// Estimation/propagation epoch (Julian Date, TT) at integration time `t = 0`.
    pub epoch_jd_tt: f64,
    /// Include the Sun third body.
    pub sun: bool,
    /// Include the Moon third body.
    pub moon: bool,
    /// Include solar-radiation pressure.
    pub srp: bool,
    /// SRP radiation-pressure coefficient `C_R`.
    pub cr: f64,
    /// SRP cross-section-to-mass ratio `A/m` (m²/kg).
    pub area_over_mass: f64,
    /// Include atmospheric drag.
    pub drag: bool,
    /// Drag ballistic term `C_D·A/m` (m²/kg).
    pub cd_area_over_mass: f64,
    /// Include the Schwarzschild relativistic correction.
    pub relativity: bool,
    /// Include the Lense–Thirring frame-dragging correction.
    pub lense_thirring: bool,
    /// Include the solid/ocean/atmospheric tide perturbation.
    pub tides: bool,
    /// Optional empirical-acceleration tier (RTN constant + once-per-rev).
    pub empirical: Option<EmpiricalAccel>,
}

impl PreciseForceModel {
    /// A force model over the given geopotential field at `epoch_jd_tt`, no perturbations.
    pub fn from_field(geopotential: SphericalHarmonicField, epoch_jd_tt: f64) -> Self {
        Self {
            geopotential,
            epoch_jd_tt,
            sun: false,
            moon: false,
            srp: false,
            cr: 1.0,
            area_over_mass: 0.0,
            drag: false,
            cd_area_over_mass: 0.0,
            relativity: false,
            lense_thirring: false,
            tides: false,
            empirical: None,
        }
    }

    /// A force model over the bundled EGM2008 field truncated to `nmax` (0 = point mass).
    pub fn egm2008(nmax: usize, epoch_jd_tt: f64) -> Self {
        Self::from_field(SphericalHarmonicField::egm2008_truncated(nmax), epoch_jd_tt)
    }

    /// Add the Sun/Moon third-body perturbation.
    pub fn third_body(mut self, sun: bool, moon: bool) -> Self {
        self.sun = sun;
        self.moon = moon;
        self
    }

    /// Add solar-radiation pressure with coefficient `cr` and area-to-mass `area_over_mass`.
    pub fn solar_radiation(mut self, cr: f64, area_over_mass: f64) -> Self {
        self.srp = true;
        self.cr = cr;
        self.area_over_mass = area_over_mass;
        self
    }

    /// Add atmospheric drag with ballistic term `cd_area_over_mass`.
    pub fn drag(mut self, cd_area_over_mass: f64) -> Self {
        self.drag = true;
        self.cd_area_over_mass = cd_area_over_mass;
        self
    }

    /// Add the Schwarzschild relativistic correction.
    pub fn relativity(mut self) -> Self {
        self.relativity = true;
        self
    }

    /// Add the Lense–Thirring frame-dragging correction.
    pub fn lense_thirring(mut self) -> Self {
        self.lense_thirring = true;
        self
    }

    /// Add the tide perturbation.
    pub fn tides(mut self) -> Self {
        self.tides = true;
        self
    }

    /// Attach an empirical-acceleration tier.
    pub fn with_empirical(mut self, empirical: EmpiricalAccel) -> Self {
        self.empirical = Some(empirical);
        self
    }

    /// The GCRS→ITRS rotation at `jd_tt` (nominal EOP for the synthetic wave).
    fn frame(&self, jd_tt: f64) -> Mat3 {
        gcrs_to_itrs_matrix(jd_tt, jd_tt, 0.0, 0.0)
    }

    /// The acceleration given the per-evaluation-invariant context (frame `m`, Sun/Moon
    /// positions) already computed — so the variational A-matrix can finite-difference over
    /// `(r, v)` without recomputing the expensive nutation/ephemeris each perturbation.
    fn accel_with(
        &self,
        jd_tt: f64,
        m: &Mat3,
        sun: Option<Vec3>,
        moon: Option<Vec3>,
        r: Vec3,
        v: Vec3,
    ) -> Vec3 {
        // Geopotential: rotate into ECEF, evaluate, rotate the acceleration back.
        let r_ecef = mat_vec(m, r);
        let a_ecef = self.geopotential.acceleration(r_ecef);
        let mut a = mat_vec(&transpose(m), a_ecef);
        let mut add = |p: Vec3| {
            a = [a[0] + p[0], a[1] + p[1], a[2] + p[2]];
        };
        if self.sun {
            if let Some(s) = sun {
                add(third_body_accel(r, s, MU_SUN));
            }
        }
        if self.moon {
            if let Some(mn) = moon {
                add(third_body_accel(r, mn, MU_MOON));
            }
        }
        if self.srp {
            if let Some(s) = sun {
                add(srp_accel(r, s, self.cr, self.area_over_mass));
            }
        }
        if self.drag {
            add(drag_accel(r, v, self.cd_area_over_mass));
        }
        if self.relativity {
            add(relativistic_accel(r, v));
        }
        if self.lense_thirring {
            add(lense_thirring_accel(r, v));
        }
        if self.tides {
            add(tidal_acceleration(r, jd_tt));
        }
        if let Some(emp) = self.empirical {
            add(empirical_accel(&emp, r, v));
        }
        a
    }

    /// The Sun/Moon positions needed at `jd_tt` (only what the enabled terms require).
    fn ephem(&self, jd_tt: f64) -> (Option<Vec3>, Option<Vec3>) {
        let tjc = julian_centuries_tt(jd_tt);
        let sun = (self.sun || self.srp).then(|| sun_position(tjc));
        let moon = self.moon.then(|| moon_position(tjc));
        (sun, moon)
    }

    /// The full acceleration (m/s², ECI) at integration time `t` (s past the epoch), position `r`
    /// and velocity `v`.
    pub fn accel_rv(&self, t: f64, r: Vec3, v: Vec3) -> Vec3 {
        let jd_tt = self.epoch_jd_tt + t / SECONDS_PER_DAY;
        let m = self.frame(jd_tt);
        let (sun, moon) = self.ephem(jd_tt);
        self.accel_with(jd_tt, &m, sun, moon, r, v)
    }

    /// The 6×6 dynamics matrix `A = ∂f/∂x` (with `x = [r; v]`, `f = [v; a]`) at time `t`, state
    /// `(r, v)`. The upper-right block is the identity (`ṙ = v`); the lower blocks `∂a/∂r` and
    /// `∂a/∂v` are evaluated by central finite difference of the acceleration. The frame and
    /// Sun/Moon ephemeris are computed once and shared across the twelve perturbed evaluations, so
    /// the (expensive) nutation/ephemeris is not recomputed per column.
    fn dynamics_matrix(&self, t: f64, r: Vec3, v: Vec3) -> [[f64; 6]; 6] {
        let jd_tt = self.epoch_jd_tt + t / SECONDS_PER_DAY;
        let m = self.frame(jd_tt);
        let (sun, moon) = self.ephem(jd_tt);
        let accel = |r: Vec3, v: Vec3| self.accel_with(jd_tt, &m, sun, moon, r, v);

        let mut a_mat = [[0.0; 6]; 6];
        // ṙ = v ⇒ ∂ṙ/∂v = I.
        for i in 0..3 {
            a_mat[i][i + 3] = 1.0;
        }
        // ∂a/∂r (metre step ≈ 1e-7 relative at LEO) and ∂a/∂v (mm/s step).
        let hr = 1.0;
        let hv = 1.0e-3;
        for j in 0..3 {
            let (mut rp, mut rm) = (r, r);
            rp[j] += hr;
            rm[j] -= hr;
            let (ap, am) = (accel(rp, v), accel(rm, v));
            let (mut vp, mut vm) = (v, v);
            vp[j] += hv;
            vm[j] -= hv;
            let (apv, amv) = (accel(r, vp), accel(r, vm));
            for i in 0..3 {
                a_mat[3 + i][j] = (ap[i] - am[i]) / (2.0 * hr); // ∂a_i/∂r_j
                a_mat[3 + i][3 + j] = (apv[i] - amv[i]) / (2.0 * hv); // ∂a_i/∂v_j
            }
        }
        a_mat
    }
}

/// Numerically propagate the inertial state `(r0, v0)` (m, m/s) forward by `t_end` seconds under
/// the precise force model `fm`, with the Dormand–Prince driver to tolerance `tol`. Returns the
/// final `(r, v)`.
pub fn propagate(
    fm: &PreciseForceModel,
    r0: Vec3,
    v0: Vec3,
    t_end: f64,
    tol: &Tolerance,
) -> (Vec3, Vec3) {
    let f = |t: f64, y: &[f64]| {
        let a = fm.accel_rv(t, [y[0], y[1], y[2]], [y[3], y[4], y[5]]);
        vec![y[3], y[4], y[5], a[0], a[1], a[2]]
    };
    let y0 = vec![r0[0], r0[1], r0[2], v0[0], v0[1], v0[2]];
    let h0 = (t_end / 1000.0).max(1.0).min(t_end.max(1e-3));
    let sol = integrate_dopri(&f, 0.0, &y0, t_end, h0, tol);
    (
        [sol.y[0], sol.y[1], sol.y[2]],
        [sol.y[3], sol.y[4], sol.y[5]],
    )
}

/// Propagate `(r0, v0)` to `t_end` while integrating the 6×6 **state-transition matrix** Φ
/// alongside the state via the variational equations `Φ̇ = A(t, x)·Φ`, `Φ(0) = I`. Returns the
/// final `(r, v, Φ)`, where `Φ[i][j] = ∂x_i(t_end)/∂x0_j` with `x = [r; v]`.
///
/// The augmented 42-vector `[r(3); v(3); Φ(36, row-major)]` is integrated by the same
/// Dormand–Prince driver; `A` is the numerically-evaluated [`PreciseForceModel::dynamics_matrix`].
/// This single forward integration yields the position partials at every observation epoch the
/// batch estimator needs, and is cross-checked against whole-arc finite difference.
pub fn propagate_with_stm(
    fm: &PreciseForceModel,
    r0: Vec3,
    v0: Vec3,
    t_end: f64,
    tol: &Tolerance,
) -> (Vec3, Vec3, [[f64; 6]; 6]) {
    // y = [r(3); v(3); Φ row-major(36)].
    let mut y0 = vec![0.0; 42];
    y0[0..3].copy_from_slice(&r0);
    y0[3..6].copy_from_slice(&v0);
    for i in 0..6 {
        y0[6 + i * 6 + i] = 1.0; // Φ(0) = I
    }
    if t_end == 0.0 {
        let mut phi = [[0.0; 6]; 6];
        for (i, row) in phi.iter_mut().enumerate() {
            row[i] = 1.0;
        }
        return (r0, v0, phi);
    }

    let f = |t: f64, y: &[f64]| stm_rhs(fm, t, y);
    let h0 = (t_end / 1000.0).max(1.0).min(t_end.max(1e-3));
    let sol = integrate_dopri(&f, 0.0, &y0, t_end, h0, tol);
    (
        [sol.y[0], sol.y[1], sol.y[2]],
        [sol.y[3], sol.y[4], sol.y[5]],
        phi_from_augmented(&sol.y),
    )
}

/// The right-hand side of the augmented `[r; v; Φ(36)]` ODE: `ṙ = v`, `v̇ = a(t, r, v)`,
/// `Φ̇ = A(t, x)·Φ` with `A` the numerically-evaluated dynamics matrix.
fn stm_rhs(fm: &PreciseForceModel, t: f64, y: &[f64]) -> Vec<f64> {
    let r = [y[0], y[1], y[2]];
    let v = [y[3], y[4], y[5]];
    let a = fm.accel_rv(t, r, v);
    let a_mat = fm.dynamics_matrix(t, r, v);
    let mut dy = vec![0.0; 42];
    dy[0..3].copy_from_slice(&v);
    dy[3..6].copy_from_slice(&a);
    for i in 0..6 {
        for j in 0..6 {
            let mut s = 0.0;
            for (k, arow) in a_mat[i].iter().enumerate() {
                s += arow * y[6 + k * 6 + j];
            }
            dy[6 + i * 6 + j] = s;
        }
    }
    dy
}

/// Extract Φ (6×6) from the tail of an augmented 42-vector.
fn phi_from_augmented(y: &[f64]) -> [[f64; 6]; 6] {
    let mut phi = [[0.0; 6]; 6];
    for (i, row) in phi.iter_mut().enumerate() {
        for (j, e) in row.iter_mut().enumerate() {
            *e = y[6 + i * 6 + j];
        }
    }
    phi
}

/// Propagate `(r0, v0)` and sample the **state + STM** at each time in `times` (assumed sorted
/// ascending, all ≥ 0). One forward integration carried segment-by-segment — Φ accumulates from
/// the epoch, so `samples[i].1` is `∂x(times[i])/∂x0`. This is what the batch estimator needs:
/// predicted positions and their epoch-state partials at every observation epoch in one pass.
fn propagate_with_stm_samples(
    fm: &PreciseForceModel,
    r0: Vec3,
    v0: Vec3,
    times: &[f64],
    tol: &Tolerance,
) -> Vec<([f64; 6], [[f64; 6]; 6])> {
    let mut y = vec![0.0; 42];
    y[0..3].copy_from_slice(&r0);
    y[3..6].copy_from_slice(&v0);
    for i in 0..6 {
        y[6 + i * 6 + i] = 1.0;
    }
    let f = |t: f64, yy: &[f64]| stm_rhs(fm, t, yy);
    let mut t_prev = 0.0;
    let mut out = Vec::with_capacity(times.len());
    for &t in times {
        if t > t_prev {
            let dt = t - t_prev;
            let h0 = (dt / 100.0).max(1.0).min(dt);
            let sol = integrate_dopri(&f, t_prev, &y, t, h0, tol);
            y = sol.y;
            t_prev = t;
        }
        let state6 = [y[0], y[1], y[2], y[3], y[4], y[5]];
        out.push((state6, phi_from_augmented(&y)));
    }
    out
}

/// Propagate `(r0, v0)` and sample only the **position** at each time in `times` (sorted, ≥ 0) —
/// the cheap path used for the finite-difference partials of the non-state parameters (`C_R`,
/// empirical accelerations).
fn propagate_samples(
    fm: &PreciseForceModel,
    r0: Vec3,
    v0: Vec3,
    times: &[f64],
    tol: &Tolerance,
) -> Vec<Vec3> {
    let f = |t: f64, y: &[f64]| {
        let a = fm.accel_rv(t, [y[0], y[1], y[2]], [y[3], y[4], y[5]]);
        vec![y[3], y[4], y[5], a[0], a[1], a[2]]
    };
    let mut y = vec![r0[0], r0[1], r0[2], v0[0], v0[1], v0[2]];
    let mut t_prev = 0.0;
    let mut out = Vec::with_capacity(times.len());
    for &t in times {
        if t > t_prev {
            let dt = t - t_prev;
            let h0 = (dt / 100.0).max(1.0).min(dt);
            let sol = integrate_dopri(&f, t_prev, &y, t, h0, tol);
            y = sol.y;
            t_prev = t;
        }
        out.push([y[0], y[1], y[2]]);
    }
    out
}

/// Configuration for a [`fit`] solve.
#[derive(Clone, Debug)]
pub struct FitConfig {
    /// Estimate the SRP coefficient `C_R` as an additional parameter (the template must enable SRP).
    pub estimate_cr: bool,
    /// Estimate the nine RTN constant + once-per-rev empirical-acceleration parameters as a second
    /// tier (a-priori constrained by [`empirical_sigma`](Self::empirical_sigma)).
    pub estimate_empirical: bool,
    /// A-priori 1σ on each empirical-acceleration amplitude (m/s²), a pseudo-stochastic constraint
    /// pulling the empirical tier toward zero unless the data demands otherwise (≤ 0 = unconstrained).
    /// This regularises the (otherwise near-degenerate) constant-along-track vs velocity trade.
    pub empirical_sigma: f64,
    /// Maximum Gauss–Newton iterations.
    pub max_iter: usize,
    /// n-sigma outlier-editing threshold on the post-fit 3-D residual (≤ 0 disables editing).
    pub outlier_sigma: f64,
    /// Integration tolerance for the dynamics.
    pub tol: Tolerance,
}

impl Default for FitConfig {
    fn default() -> Self {
        Self {
            estimate_cr: false,
            estimate_empirical: false,
            empirical_sigma: 1e-7,
            max_iter: 20,
            outlier_sigma: 0.0,
            tol: Tolerance {
                rtol: 1e-11,
                atol: 1e-9,
                ..Tolerance::default()
            },
        }
    }
}

/// Read the `k`-th empirical amplitude (0–2 radial, 3–5 transverse, 6–8 normal).
fn emp_get(e: &EmpiricalAccel, k: usize) -> f64 {
    match k {
        0..=2 => e.radial[k],
        3..=5 => e.transverse[k - 3],
        _ => e.normal[k - 6],
    }
}

/// Write the `k`-th empirical amplitude (0–2 radial, 3–5 transverse, 6–8 normal).
fn emp_set(e: &mut EmpiricalAccel, k: usize, v: f64) {
    match k {
        0..=2 => e.radial[k] = v,
        3..=5 => e.transverse[k - 3] = v,
        _ => e.normal[k - 6] = v,
    }
}

/// Fit the epoch state (and optionally `C_R`) of the `template` dynamics to the inertial position
/// observations `obs` by Gauss–Newton weighted batch least squares. The 6-state Jacobian comes
/// from one STM-carrying forward integration per iteration; `C_R` takes a finite-difference
/// partial. Observations are weighted by `1/σ²`, and (when enabled) gross outliers are edited by
/// n-sigma rejection on the post-fit residual. Returns `None` on too few observations or a
/// singular normal matrix.
pub fn fit(
    template: &PreciseForceModel,
    initial: EstimatedParams,
    obs: &[Observation],
    cfg: &FitConfig,
) -> Option<OdReport> {
    if obs.len() < 3 {
        return None;
    }
    // Sort observations by time (the sampled propagators march forward).
    let mut order: Vec<usize> = (0..obs.len()).collect();
    order.sort_by(|&a, &b| {
        obs[a]
            .t
            .partial_cmp(&obs[b].t)
            .unwrap_or(std::cmp::Ordering::Equal)
    });
    let obs: Vec<Observation> = order.iter().map(|&i| obs[i]).collect();
    let times: Vec<f64> = obs.iter().map(|o| o.t).collect();
    let n_obs_total = obs.len();

    let n_emp = if cfg.estimate_empirical { 9 } else { 0 };
    let emp_base = 6 + cfg.estimate_cr as usize;
    let n_params = emp_base + n_emp;
    let mut r0 = initial.r0;
    let mut v0 = initial.v0;
    let mut cr = initial.cr.unwrap_or(template.cr);
    let mut emp = initial.empirical.unwrap_or_default();

    let mut edited = vec![false; n_obs_total];
    let mut did_edit = false;
    let mut iterations = 0;
    let mut converged = false;

    for it in 0..cfg.max_iter {
        iterations = it + 1;
        let mut fm = template.clone();
        fm.cr = cr;
        fm.empirical = if cfg.estimate_empirical {
            Some(emp)
        } else {
            initial.empirical
        };

        let preds = propagate_with_stm_samples(&fm, r0, v0, &times, &cfg.tol);

        // C_R finite-difference position partials (one extra pair of cheap propagations).
        let cr_partial: Option<Vec<Vec3>> = if cfg.estimate_cr {
            let dcr = 1e-3;
            let (mut fmp, mut fmm) = (fm.clone(), fm.clone());
            fmp.cr = cr + dcr;
            fmm.cr = cr - dcr;
            let pp = propagate_samples(&fmp, r0, v0, &times, &cfg.tol);
            let pm = propagate_samples(&fmm, r0, v0, &times, &cfg.tol);
            Some(
                pp.iter()
                    .zip(&pm)
                    .map(|(a, b)| {
                        [
                            (a[0] - b[0]) / (2.0 * dcr),
                            (a[1] - b[1]) / (2.0 * dcr),
                            (a[2] - b[2]) / (2.0 * dcr),
                        ]
                    })
                    .collect(),
            )
        } else {
            None
        };

        // Empirical-acceleration partials by forward difference against a nominal propagation. The
        // empirical force is linear in its amplitudes, so a forward difference is exact to rounding
        // (no truncation error), at one propagation per active parameter.
        let emp_partials: Vec<Vec<Vec3>> = if cfg.estimate_empirical {
            let nominal = propagate_samples(&fm, r0, v0, &times, &cfg.tol);
            let damp = 1e-9;
            (0..9)
                .map(|k| {
                    let mut ep = emp;
                    emp_set(&mut ep, k, emp_get(&emp, k) + damp);
                    let mut fmp = fm.clone();
                    fmp.empirical = Some(ep);
                    let pp = propagate_samples(&fmp, r0, v0, &times, &cfg.tol);
                    pp.iter()
                        .zip(&nominal)
                        .map(|(a, b)| {
                            [
                                (a[0] - b[0]) / damp,
                                (a[1] - b[1]) / damp,
                                (a[2] - b[2]) / damp,
                            ]
                        })
                        .collect()
                })
                .collect()
        } else {
            Vec::new()
        };

        // Weighted normal equations over the non-edited observations.
        let mut ata = vec![vec![0.0; n_params]; n_params];
        let mut atb = vec![0.0; n_params];
        for (i, ob) in obs.iter().enumerate() {
            if edited[i] {
                continue;
            }
            let w = 1.0 / (ob.sigma * ob.sigma);
            let (state6, phi) = &preds[i];
            let resid = [
                ob.pos[0] - state6[0],
                ob.pos[1] - state6[1],
                ob.pos[2] - state6[2],
            ];
            for axis in 0..3 {
                let mut row = vec![0.0; n_params];
                row[..6].copy_from_slice(&phi[axis][..6]);
                if let Some(cp) = &cr_partial {
                    row[6] = cp[i][axis];
                }
                if cfg.estimate_empirical {
                    for k in 0..9 {
                        row[emp_base + k] = emp_partials[k][i][axis];
                    }
                }
                for p in 0..n_params {
                    atb[p] += row[p] * w * resid[axis];
                    for q in 0..n_params {
                        ata[p][q] += row[p] * w * row[q];
                    }
                }
            }
        }

        // A-priori (pseudo-stochastic) constraint pulling each empirical amplitude toward zero.
        if cfg.estimate_empirical && cfg.empirical_sigma > 0.0 {
            let wa = 1.0 / (cfg.empirical_sigma * cfg.empirical_sigma);
            for k in 0..9 {
                ata[emp_base + k][emp_base + k] += wa;
                atb[emp_base + k] += wa * (0.0 - emp_get(&emp, k));
            }
        }

        let ata_inv = inverse(&ata)?;
        let dx: Vec<f64> = (0..n_params)
            .map(|p| (0..n_params).map(|q| ata_inv[p][q] * atb[q]).sum())
            .collect();
        for k in 0..3 {
            r0[k] += dx[k];
            v0[k] += dx[3 + k];
        }
        if cfg.estimate_cr {
            cr += dx[6];
        }
        if cfg.estimate_empirical {
            for k in 0..9 {
                let cur = emp_get(&emp, k);
                emp_set(&mut emp, k, cur + dx[emp_base + k]);
            }
        }

        let dpos = (dx[0] * dx[0] + dx[1] * dx[1] + dx[2] * dx[2]).sqrt();
        let dvel = (dx[3] * dx[3] + dx[4] * dx[4] + dx[5] * dx[5]).sqrt();
        if dpos < 1e-4 && dvel < 1e-7 {
            // Once the state has converged, apply n-sigma editing once and refit if anything was
            // rejected — editing on a converged fit, not on the large initial transient.
            if cfg.outlier_sigma > 0.0 && !did_edit {
                did_edit = true;
                let resid3d: Vec<f64> = preds
                    .iter()
                    .enumerate()
                    .map(|(i, (s, _))| {
                        let o = obs[i].pos;
                        ((o[0] - s[0]).powi(2) + (o[1] - s[1]).powi(2) + (o[2] - s[2]).powi(2))
                            .sqrt()
                    })
                    .collect();
                let mut any_new = false;
                for _pass in 0..3 {
                    let (mut sum, mut cnt) = (0.0, 0usize);
                    for (i, &d) in resid3d.iter().enumerate() {
                        if !edited[i] {
                            sum += d * d;
                            cnt += 1;
                        }
                    }
                    if cnt == 0 {
                        break;
                    }
                    let rms = (sum / cnt as f64).sqrt();
                    let thresh = cfg.outlier_sigma * rms;
                    let mut marked = false;
                    for (i, &d) in resid3d.iter().enumerate() {
                        if !edited[i] && d > thresh {
                            edited[i] = true;
                            marked = true;
                            any_new = true;
                        }
                    }
                    if !marked {
                        break;
                    }
                }
                if any_new {
                    continue; // refit without the rejected observations
                }
            }
            converged = true;
            break;
        }
    }

    // Final report: residuals over the used observations at the converged state.
    let mut fm = template.clone();
    fm.cr = cr;
    fm.empirical = if cfg.estimate_empirical {
        Some(emp)
    } else {
        initial.empirical
    };
    let preds = propagate_with_stm_samples(&fm, r0, v0, &times, &cfg.tol);
    let (mut sum3d, mut used) = (0.0, 0usize);
    let mut sum_rtn = [0.0; 3];
    for (i, ob) in obs.iter().enumerate() {
        if edited[i] {
            continue;
        }
        let (state6, _) = &preds[i];
        let resid = [
            ob.pos[0] - state6[0],
            ob.pos[1] - state6[1],
            ob.pos[2] - state6[2],
        ];
        sum3d += resid[0] * resid[0] + resid[1] * resid[1] + resid[2] * resid[2];
        let rv = [state6[0], state6[1], state6[2]];
        let vv = [state6[3], state6[4], state6[5]];
        let rtn = to_rtn(resid, rv, vv);
        for k in 0..3 {
            sum_rtn[k] += rtn[k] * rtn[k];
        }
        used += 1;
    }
    let used_f = used.max(1) as f64;
    let rms_3d = (sum3d / used_f).sqrt();
    let rms_rtn = [
        (sum_rtn[0] / used_f).sqrt(),
        (sum_rtn[1] / used_f).sqrt(),
        (sum_rtn[2] / used_f).sqrt(),
    ];

    Some(OdReport {
        rms_3d,
        rms_rtn,
        n_obs: used,
        n_edited: n_obs_total - used,
        n_params,
        iterations,
        converged,
        params: EstimatedParams {
            r0,
            v0,
            cr: cfg.estimate_cr.then_some(cr),
            empirical: if cfg.estimate_empirical {
                Some(emp)
            } else {
                initial.empirical
            },
        },
    })
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn to_rtn_radial_displacement_is_pure_radial() {
        // A radial-out displacement decomposes to (|d|, 0, 0) regardless of inclination.
        let r = [6.9e6, 1.0e6, 2.0e6];
        let v = [-1.0e3, 7.0e3, 1.0e3];
        let r_hat = unit(r);
        let d = [r_hat[0] * 3.0, r_hat[1] * 3.0, r_hat[2] * 3.0];
        let rtn = to_rtn(d, r, v);
        assert!((rtn[0] - 3.0).abs() < 1e-9, "radial {rtn:?}");
        assert!(
            rtn[1].abs() < 1e-9 && rtn[2].abs() < 1e-9,
            "off-radial leak {rtn:?}"
        );
    }
}
