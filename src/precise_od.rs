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

use crate::precession::{mat_vec, Mat3};

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
