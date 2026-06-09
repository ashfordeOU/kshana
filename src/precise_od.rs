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
use crate::gravity_sh::SphericalHarmonicField;
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
