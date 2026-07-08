// SPDX-License-Identifier: AGPL-3.0-only
//! Perturbed lunar-constellation ephemeris: an Elliptical Lunar Frozen Orbit (ELFO) /
//! LCNS-class relay propagated under lunar `J2` + `C22` plus Earth (and optional Sun)
//! third-body gravity, in a Moon-centred inertial (MCI) frame.
//!
//! ## Why this module exists
//!
//! The lunar service-volume analysis in [`crate::lunar_service`] places its relays on
//! **pure two-body Keplerian** orbits ([`crate::lunar_service::LunarSat::position_mci`]):
//! the geometry is idealised, so a surface-beacon DOP computed from it reflects a
//! never-perturbed constellation. This module adds a *perturbed* propagation of the same
//! constellation so a lunar DOP can be reported as a **sensitivity band** — "how much does
//! the geometry (and therefore the DOP) move once realistic secular drift of the nodes and
//! perilunes is admitted?" — rather than an idealised point estimate. Its
//! [`PerturbedConstellation::positions_mcmf`] is a drop-in analogue of
//! [`crate::lunar_service::LunarConstellation::positions_mcmf`] that feeds the same
//! frame-agnostic DOP / coverage kernels.
//!
//! ## Force model
//!
//! It reuses the crate's existing engine rather than reinventing it:
//!
//! * the central two-body term uses [`crate::lunar::MOON_GM_M3_S2`] — the exact `μ` the
//!   analytic [`crate::lunar_service::LunarSat`] propagator uses, so the two-body limit is
//!   bit-comparable;
//! * third-body Earth/Sun gravity uses the frame-general perturbation helper
//!   [`crate::forces::third_body_accel`] with [`crate::forces::MU_EARTH`] /
//!   [`crate::forces::MU_SUN`] and the built-in low-precision ephemerides
//!   [`crate::ephem::moon_position`] / [`crate::ephem::sun_position`] (the Moon-relative
//!   positions of Earth and Sun);
//! * the state is advanced by the crate's Runge–Kutta drivers
//!   ([`crate::integrator::integrate`] adaptive step-doubling for a final state,
//!   [`crate::integrator::rk4_step`] fixed-step for a uniform time series).
//!
//! The lunar oblateness `J2` and the dominant sectoral `C22` are the two largest terms of
//! the lunar gravity field after the monopole. `J2` is axially symmetric and evaluated
//! directly in MCI (whose `+z` is the lunar spin/pole axis, matching
//! [`crate::lunar::mci_to_mcmf`]); `C22` is longitude-dependent, so it is evaluated in the
//! Moon-fixed (MCMF) frame and rotated back to MCI each step.
//!
//! ## Validated vs Modelled (honest)
//!
//! * **Validated** — the *method's* correctness is pinned against analytic truth:
//!   1. **Two-body limit** — with every perturbation off, the propagation reproduces the
//!      exact analytic Kepler position of [`crate::lunar_service::LunarSat::position_mci`]
//!      to sub-metre over several orbits (for the two-body problem the closed form *is* the
//!      truth, a tighter gate than any numerical cross-tool).
//!   2. **J2 secular rates** — with `J2` alone, the propagated secular nodal regression
//!      `Ω̇` and apsidal precession `ω̇` reproduce the closed-form first-order secular rates
//!      (`Ω̇ = −1.5 n J2 (R/p)² cos i`, `ω̇ = 0.75 n J2 (R/p)² (5cos²i − 1)`; Vallado,
//!      *Fundamentals of Astrodynamics and Applications*) to a few percent.
//!   3. **C22 gradient** — the `C22` acceleration is the exact analytic gradient of its
//!      disturbing potential (finite-difference gold standard), and `J2`-only energy /
//!      semi-major-axis are conserved (a bounded orbit stays bounded).
//! * **Modelled** — a *specific* ELFO/LCNS constellation number is illustrative, not an
//!   operational ephemeris. The frame simplifications are: MCI is taken **parallel to the
//!   Earth mean-equator/equinox** used by [`crate::ephem`] (so Earth/Sun directions carry
//!   the real ephemeris but the `~1.5°`–`6.7°` lunar-pole tilt/libration relative to that
//!   frame is neglected), and `C22` is evaluated in the **principal-axis** frame
//!   (`S22 = 0`). These do not affect the two-body-limit or the single-frame `J2` secular
//!   oracle above; they bound the fidelity of the full perturbed constellation, which is a
//!   sensitivity band, not a certified ephemeris.
//!
//! Sources for the gravity coefficients: lunar `J2 = 2.0321e-4` is the crate's existing
//! [`crate::body::MOON_ZONALS_J2_J3`] value (GRAIL GRGM / Lunar Prospector LP150Q-derived,
//! Konopliv et al. 2001; Lemoine et al. 2013). The sectoral `C22 = 2.2382e-5` (unnormalised)
//! is the GRAIL GRGM900C / LP150Q value (equivalently normalised `C̄22 ≈ 3.4674e-5`); the
//! reference radius is the crate's [`crate::lunar::R_MOON_M`] (`1737.4 km`, IAU mean; GRGM900C's
//! formal `1738.0 km` differs by `0.03 %`, negligible for a sensitivity band and self-consistent
//! with the rest of Kshana's lunar stack).

use crate::body::MOON_ZONALS_J2_J3;
use crate::ephem::{moon_position, sun_position};
use crate::forces::{third_body_accel, MU_EARTH, MU_SUN};
use crate::integrator::{integrate, rk4_step, Tolerance};
use crate::lunar::{mci_to_mcmf, mcmf_to_mci, MOON_GM_M3_S2, R_MOON_M};
use crate::timescales::SECONDS_PER_DAY;

type Vec3 = [f64; 3];

// ---------------------------------------------------------------------------
// Gravity-field constants (see the module "Validated vs Modelled" note for sources)
// ---------------------------------------------------------------------------

/// Lunar second zonal harmonic `J2` (unnormalised), the crate's existing
/// [`crate::body::MOON_ZONALS_J2_J3`] value (`2.0321e-4`; GRAIL GRGM / Lunar Prospector
/// LP150Q-derived). Reused here so this module and the rest of Kshana's lunar stack share
/// one literal.
pub const MOON_J2: f64 = MOON_ZONALS_J2_J3[0];

/// Lunar dominant sectoral harmonic `C22` (unnormalised), `2.2382e-5` (GRAIL GRGM900C /
/// LP150Q; equivalently normalised `C̄22 ≈ 3.4674e-5`). The Moon's largest tesseral term —
/// it makes the equatorial figure slightly triaxial.
pub const MOON_C22: f64 = 2.2382e-5;

/// Lunar sectoral `S22`. Taken as `0` because the field is expressed in the **principal-axis**
/// frame (the DE/GRAIL convention in which `C21 = S21 = S22 = 0`). This is the `Modelled`
/// simplification flagged in the module docs.
pub const MOON_S22: f64 = 0.0;

/// Reference radius of the lunar gravity field (m). The crate's [`crate::lunar::R_MOON_M`]
/// (IAU mean, `1737.4 km`). The same `R` appears in both the propagated `J2` acceleration and
/// the analytic secular-rate oracle, so the oracle is self-consistent regardless of the
/// `0.03 %` offset from GRGM900C's formal `1738.0 km`.
pub const MOON_REF_RADIUS_M: f64 = R_MOON_M;

/// Lunar gravitational parameter `μ = GM` (m³/s²) used for the central two-body term — the
/// crate's [`crate::lunar::MOON_GM_M3_S2`], so the two-body limit matches
/// [`crate::lunar_service::LunarSat`] exactly.
pub const MOON_MU_M3_S2: f64 = MOON_GM_M3_S2;

/// One Julian century in seconds (`36525 × 86400`), the divisor turning propagation seconds
/// into the Julian-centuries-TT argument the [`crate::ephem`] series expect.
const JULIAN_CENTURY_S: f64 = 36_525.0 * SECONDS_PER_DAY;

// ---------------------------------------------------------------------------
// Small vector helpers (kept local so the module is self-contained)
// ---------------------------------------------------------------------------

fn dot(a: Vec3, b: Vec3) -> f64 {
    a[0] * b[0] + a[1] * b[1] + a[2] * b[2]
}

fn norm(a: Vec3) -> f64 {
    dot(a, a).sqrt()
}

fn cross(a: Vec3, b: Vec3) -> Vec3 {
    [
        a[1] * b[2] - a[2] * b[1],
        a[2] * b[0] - a[0] * b[2],
        a[0] * b[1] - a[1] * b[0],
    ]
}

fn add(a: Vec3, b: Vec3) -> Vec3 {
    [a[0] + b[0], a[1] + b[1], a[2] + b[2]]
}

fn sub(a: Vec3, b: Vec3) -> Vec3 {
    [a[0] - b[0], a[1] - b[1], a[2] - b[2]]
}

fn scale(a: Vec3, k: f64) -> Vec3 {
    [a[0] * k, a[1] * k, a[2] * k]
}

/// Active rotation of a 3-vector about `+z` by `angle` (right-handed). Distinct from the
/// passive `R3` of [`crate::lunar::mci_to_mcmf`]; used to build the perifocal → MCI transform
/// so the generated initial state matches the [`crate::lunar_service::LunarSat`] convention.
fn rotz(v: Vec3, angle: f64) -> Vec3 {
    let (s, c) = angle.sin_cos();
    [c * v[0] - s * v[1], s * v[0] + c * v[1], v[2]]
}

/// Active rotation of a 3-vector about `+x` by `angle` (right-handed).
fn rotx(v: Vec3, angle: f64) -> Vec3 {
    let (s, c) = angle.sin_cos();
    [v[0], c * v[1] - s * v[2], s * v[1] + c * v[2]]
}

// ---------------------------------------------------------------------------
// State + orbital-element helpers
// ---------------------------------------------------------------------------

/// A Moon-centred inertial (MCI) Cartesian state: position (m) and velocity (m/s).
#[derive(Clone, Copy, Debug, PartialEq)]
pub struct LunarState {
    /// Position in the Moon-centred inertial frame (m).
    pub r: Vec3,
    /// Velocity in the Moon-centred inertial frame (m/s).
    pub v: Vec3,
}

/// Mean motion `n = √(μ/a³)` (rad/s) for lunar semi-major axis `a` (m), using
/// [`MOON_MU_M3_S2`]. (Unlike [`crate::forces::mean_motion`], which is hard-wired to Earth's
/// `μ`.)
pub fn mean_motion(a: f64) -> f64 {
    (MOON_MU_M3_S2 / (a * a * a)).sqrt()
}

/// Build the MCI state `(r, v)` from classical orbital elements about the Moon, matching the
/// 3-1-3 (RAAN, inclination, argument-of-perilune) convention of
/// [`crate::lunar_service::LunarSat::position_mci`]: the perifocal position/velocity are
/// rotated by `Rz(Ω)·Rx(i)·Rz(argp)`. `mean_anom_deg` is the mean anomaly at epoch; Kepler's
/// equation is solved by Newton–Raphson (exact for `e = 0`). Angles in degrees.
///
/// The position component is asserted equal to
/// [`crate::lunar_service::LunarSat::position_mci`] `(t = 0)` in the module tests, so the
/// generated velocity is guaranteed consistent with that analytic orbit.
pub fn elements_to_state(
    sma_m: f64,
    eccentricity: f64,
    inc_deg: f64,
    raan_deg: f64,
    argp_deg: f64,
    mean_anom_deg: f64,
) -> LunarState {
    let e = eccentricity;
    let a = sma_m;
    let m = mean_anom_deg.to_radians();
    // Newton–Raphson for the eccentric anomaly E: M = E − e·sin E.
    let mut ea = m;
    if e != 0.0 {
        for _ in 0..60 {
            let d = (ea - e * ea.sin() - m) / (1.0 - e * ea.cos());
            ea -= d;
            if d.abs() < 1e-14 {
                break;
            }
        }
    }
    let r = a * (1.0 - e * ea.cos());
    let nu = 2.0 * ((1.0 + e).sqrt() * (ea * 0.5).sin()).atan2((1.0 - e).sqrt() * (ea * 0.5).cos());
    let p = a * (1.0 - e * e);
    let (snu, cnu) = nu.sin_cos();
    // Perifocal (x̂ toward perilune) position and velocity.
    let r_pf: Vec3 = [r * cnu, r * snu, 0.0];
    let sqrt_mu_p = (MOON_MU_M3_S2 / p).sqrt();
    let v_pf: Vec3 = [-sqrt_mu_p * snu, sqrt_mu_p * (e + cnu), 0.0];
    let argp = argp_deg.to_radians();
    let inc = inc_deg.to_radians();
    let raan = raan_deg.to_radians();
    let to_mci = |vpf: Vec3| rotz(rotx(rotz(vpf, argp), inc), raan);
    LunarState {
        r: to_mci(r_pf),
        v: to_mci(v_pf),
    }
}

/// Osculating semi-major axis (m) from the state, by vis-viva `1/a = 2/r − v²/μ`.
pub fn osculating_sma(state: &LunarState) -> f64 {
    let rn = norm(state.r);
    let v2 = dot(state.v, state.v);
    1.0 / (2.0 / rn - v2 / MOON_MU_M3_S2)
}

/// Osculating right ascension of the ascending node `Ω` (rad): the in-plane angle of the node
/// vector `n = ẑ × (r × v)`. Identical in form to [`crate::propagator::raan_rad`].
pub fn osculating_raan(state: &LunarState) -> f64 {
    let h = cross(state.r, state.v);
    // n = ẑ × h = (−h_y, h_x, 0).
    h[0].atan2(-h[1])
}

/// Osculating argument of perilune `ω` (rad) from the state: the angle in the orbit plane
/// from the ascending-node vector `n` to the eccentricity vector `e = (v×h)/μ − r/|r|`,
/// resolved into `[0, 2π)` by the sign of `e_z`. Ill-defined for an equatorial or circular
/// orbit; the ELFO/LCNS orbits this module targets are inclined and eccentric.
pub fn osculating_argp(state: &LunarState) -> f64 {
    let r = state.r;
    let v = state.v;
    let h = cross(r, v);
    let n = [-h[1], h[0], 0.0];
    let rn = norm(r);
    let e_vec = sub(scale(cross(v, h), 1.0 / MOON_MU_M3_S2), scale(r, 1.0 / rn));
    let nn = norm(n);
    let en = norm(e_vec);
    if nn == 0.0 || en == 0.0 {
        return 0.0;
    }
    let mut w = (dot(n, e_vec) / (nn * en)).clamp(-1.0, 1.0).acos();
    if e_vec[2] < 0.0 {
        w = std::f64::consts::TAU - w;
    }
    w
}

// ---------------------------------------------------------------------------
// Accelerations
// ---------------------------------------------------------------------------

/// Central two-body lunar acceleration `−μ·r/|r|³` (m/s²) with `μ =` [`MOON_MU_M3_S2`].
pub fn moon_two_body_accel(r: Vec3) -> Vec3 {
    let rn = norm(r);
    scale(r, -MOON_MU_M3_S2 / (rn * rn * rn))
}

/// Lunar `J2` oblateness acceleration (m/s², MCI) — the standard closed form
/// `a = −1.5·J2·μ·R²/r⁵·[x(1−5z²/r²), y(1−5z²/r²), z(3−5z²/r²)]` with the lunar
/// [`MOON_J2`], [`MOON_MU_M3_S2`] and [`MOON_REF_RADIUS_M`]. Evaluated directly in MCI because
/// `J2` is axially symmetric about the `+z` spin/pole axis (the axis
/// [`crate::lunar::mci_to_mcmf`] rotates about).
pub fn moon_j2_accel(r: Vec3) -> Vec3 {
    let rn = norm(r);
    let r2 = rn * rn;
    let zr2 = 5.0 * r[2] * r[2] / r2;
    let c = -1.5 * MOON_J2 * MOON_MU_M3_S2 * MOON_REF_RADIUS_M * MOON_REF_RADIUS_M / rn.powi(5);
    [
        c * r[0] * (1.0 - zr2),
        c * r[1] * (1.0 - zr2),
        c * r[2] * (3.0 - zr2),
    ]
}

/// The `C22` sectoral disturbing potential in the **Moon-fixed** frame (m²/s²):
/// `U = 3·μ·R²·C22·(x² − y²)/r⁵` (the `S22 = 0` principal-axis form). Exposed so its gradient
/// [`moon_c22_accel_bodyfixed`] can be checked against a finite difference.
pub fn moon_c22_potential_bodyfixed(r_bf: Vec3) -> f64 {
    let rn = norm(r_bf);
    let k = 3.0 * MOON_MU_M3_S2 * MOON_REF_RADIUS_M * MOON_REF_RADIUS_M * MOON_C22;
    k * (r_bf[0] * r_bf[0] - r_bf[1] * r_bf[1]) / rn.powi(5)
}

/// The `C22` sectoral acceleration in the **Moon-fixed** frame (m/s²) — the exact analytic
/// gradient `∇U` of [`moon_c22_potential_bodyfixed`]:
/// `a = (3μR²C22/r⁵)·[2x − 5x(x²−y²)/r², −2y − 5y(x²−y²)/r², −5z(x²−y²)/r²]`.
pub fn moon_c22_accel_bodyfixed(r_bf: Vec3) -> Vec3 {
    let rn = norm(r_bf);
    let r2 = rn * rn;
    let k = 3.0 * MOON_MU_M3_S2 * MOON_REF_RADIUS_M * MOON_REF_RADIUS_M * MOON_C22 / rn.powi(5);
    let dxy = r_bf[0] * r_bf[0] - r_bf[1] * r_bf[1];
    [
        k * (2.0 * r_bf[0] - 5.0 * r_bf[0] * dxy / r2),
        k * (-2.0 * r_bf[1] - 5.0 * r_bf[1] * dxy / r2),
        k * (-5.0 * r_bf[2] * dxy / r2),
    ]
}

/// The `C22` acceleration expressed in **MCI** at `seconds` past epoch: rotate the MCI position
/// into the Moon-fixed frame ([`crate::lunar::mci_to_mcmf`]), evaluate
/// [`moon_c22_accel_bodyfixed`], then rotate the acceleration vector back
/// ([`crate::lunar::mcmf_to_mci`]). This is what makes `C22` genuinely time-varying (the
/// longitude of the sub-satellite point sweeps as the Moon rotates).
pub fn moon_c22_accel_mci(r_mci: Vec3, seconds: f64) -> Vec3 {
    let r_bf = mci_to_mcmf(r_mci, seconds);
    let a_bf = moon_c22_accel_bodyfixed(r_bf);
    mcmf_to_mci(a_bf, seconds)
}

/// Selenocentric Earth position (m, MCI) at `t_tt_jc`: the negated geocentric Moon position
/// [`crate::ephem::moon_position`]. (MCI is taken parallel to the ephemeris mean-equator frame;
/// see the module `Modelled` note.)
pub fn earth_position_mci(t_tt_jc: f64) -> Vec3 {
    scale(moon_position(t_tt_jc), -1.0)
}

/// Selenocentric Sun position (m, MCI) at `t_tt_jc`: geocentric Sun minus geocentric Moon
/// ([`crate::ephem::sun_position`] − [`crate::ephem::moon_position`]).
pub fn sun_position_mci(t_tt_jc: f64) -> Vec3 {
    sub(sun_position(t_tt_jc), moon_position(t_tt_jc))
}

// ---------------------------------------------------------------------------
// Force model
// ---------------------------------------------------------------------------

/// Which perturbations sit on top of the lunar two-body term, plus the epoch that anchors the
/// time-varying third-body ephemerides.
///
/// Build with [`LunarPerturbations::two_body`], [`j2_only`](Self::j2_only) or
/// [`elfo_full`](Self::elfo_full) and toggle with the `with_*` methods.
#[derive(Clone, Copy, Debug, PartialEq)]
pub struct LunarPerturbations {
    /// Include the lunar `J2` oblateness term.
    pub j2: bool,
    /// Include the lunar `C22` sectoral term.
    pub c22: bool,
    /// Include Earth third-body gravity.
    pub earth: bool,
    /// Include Sun third-body gravity.
    pub sun: bool,
    /// Epoch (Julian centuries of TT since J2000.0) at which propagation time `t = 0` sits; it
    /// anchors the third-body ephemeris sampling `t_jc = epoch_tt_jc + t / (36525·86400)`.
    pub epoch_tt_jc: f64,
}

impl Default for LunarPerturbations {
    /// The full ELFO model (`J2 + C22 + Earth + Sun`) at the J2000.0 epoch.
    fn default() -> Self {
        Self::elfo_full()
    }
}

impl LunarPerturbations {
    /// Pure two-body: every perturbation off (the two-body-limit oracle configuration).
    pub fn two_body() -> Self {
        Self {
            j2: false,
            c22: false,
            earth: false,
            sun: false,
            epoch_tt_jc: 0.0,
        }
    }

    /// `J2` only — the configuration whose secular `Ω̇`/`ω̇` match the analytic oracle.
    pub fn j2_only() -> Self {
        Self {
            j2: true,
            ..Self::two_body()
        }
    }

    /// The full ELFO force model: lunar `J2 + C22` plus Earth and Sun third-body gravity, at
    /// the J2000.0 epoch. Set a different epoch with [`with_epoch`](Self::with_epoch).
    pub fn elfo_full() -> Self {
        Self {
            j2: true,
            c22: true,
            earth: true,
            sun: true,
            epoch_tt_jc: 0.0,
        }
    }

    /// Set the epoch (Julian centuries of TT since J2000.0) for the third-body ephemerides.
    pub fn with_epoch(mut self, epoch_tt_jc: f64) -> Self {
        self.epoch_tt_jc = epoch_tt_jc;
        self
    }

    /// Toggle the `C22` sectoral term.
    pub fn with_c22(mut self, on: bool) -> Self {
        self.c22 = on;
        self
    }

    /// Toggle Earth third-body gravity.
    pub fn with_earth(mut self, on: bool) -> Self {
        self.earth = on;
        self
    }

    /// Toggle Sun third-body gravity.
    pub fn with_sun(mut self, on: bool) -> Self {
        self.sun = on;
        self
    }

    /// Total modelled acceleration (m/s², MCI) at propagation time `t` (s past epoch) for a
    /// satellite at MCI position `r`: two-body plus every enabled perturbation.
    pub fn accel(&self, t: f64, r: Vec3) -> Vec3 {
        let mut a = moon_two_body_accel(r);
        if self.j2 {
            a = add(a, moon_j2_accel(r));
        }
        if self.c22 {
            a = add(a, moon_c22_accel_mci(r, t));
        }
        if self.earth || self.sun {
            let t_jc = self.epoch_tt_jc + t / JULIAN_CENTURY_S;
            if self.earth {
                a = add(a, third_body_accel(r, earth_position_mci(t_jc), MU_EARTH));
            }
            if self.sun {
                a = add(a, third_body_accel(r, sun_position_mci(t_jc), MU_SUN));
            }
        }
        a
    }

    /// The first-order state derivative `f(t, [r; v]) = [v; a(t, r)]` the integrators consume.
    fn rhs(&self) -> impl Fn(f64, &[f64]) -> Vec<f64> + '_ {
        move |t: f64, y: &[f64]| {
            let a = self.accel(t, [y[0], y[1], y[2]]);
            vec![y[3], y[4], y[5], a[0], a[1], a[2]]
        }
    }
}

/// A deterministic, fine tolerance for the adaptive driver — tight enough that the two-body
/// limit holds to sub-metre over several orbits (the integrator truncation, not the tolerance,
/// then dominates). Fixed values only: no wall-clock, no RNG.
pub fn default_tolerance() -> Tolerance {
    Tolerance {
        rtol: 1e-12,
        atol: 1e-6,
        h_min: 1e-4,
        h_max: 120.0,
    }
}

/// Propagate an MCI state forward by `t_end` seconds under `model` with the adaptive
/// step-doubling driver ([`crate::integrator::integrate`]) at `tol`, returning the final state.
/// Deterministic. A non-positive `t_end` returns the input state unchanged.
pub fn propagate(state0: &LunarState, t_end: f64, model: &LunarPerturbations, tol: &Tolerance) -> LunarState {
    if !(t_end.is_finite() && t_end > 0.0) {
        return *state0;
    }
    let f = model.rhs();
    let y0 = vec![
        state0.r[0], state0.r[1], state0.r[2], state0.v[0], state0.v[1], state0.v[2],
    ];
    // A small fraction of the span is a safe, well-scaled initial step.
    let h0 = (t_end / 1000.0).clamp(1e-3, tol.h_max);
    let sol = integrate(&f, 0.0, &y0, t_end, h0, tol);
    LunarState {
        r: [sol.y[0], sol.y[1], sol.y[2]],
        v: [sol.y[3], sol.y[4], sol.y[5]],
    }
}

/// Trace the trajectory at a fixed RK4 step `step_s` (s) for `t_end` s under `model`, returning
/// uniform `(t, state)` samples (including `t = 0`). A fixed step (rather than the adaptive
/// driver, which returns only the final state) yields the uniform time series the secular-rate
/// fit needs; a small `step_s` keeps truncation error far below the secular signal.
pub fn propagate_history(
    state0: &LunarState,
    t_end: f64,
    step_s: f64,
    model: &LunarPerturbations,
) -> Vec<(f64, LunarState)> {
    let f = model.rhs();
    let mut y = vec![
        state0.r[0], state0.r[1], state0.r[2], state0.v[0], state0.v[1], state0.v[2],
    ];
    let mut t = 0.0;
    let mut out = vec![(0.0, *state0)];
    if !(step_s.is_finite() && step_s > 0.0) {
        return out;
    }
    let n_steps = (((t_end - 1e-9) / step_s).ceil().max(0.0) as usize).saturating_add(2);
    for _ in 0..n_steps {
        if t >= t_end - 1e-9 {
            break;
        }
        y = rk4_step(&f, t, &y, step_s);
        t += step_s;
        out.push((
            t,
            LunarState {
                r: [y[0], y[1], y[2]],
                v: [y[3], y[4], y[5]],
            },
        ));
    }
    out
}

// ---------------------------------------------------------------------------
// Analytic J2 secular-rate oracle
// ---------------------------------------------------------------------------

/// The two first-order lunar `J2` secular rates (rad/s) of a Keplerian orbit: the nodal
/// regression `Ω̇` and the apsidal precession `ω̇`.
#[derive(Clone, Copy, Debug, PartialEq)]
pub struct J2SecularRates {
    /// Nodal regression `Ω̇ = −1.5 n J2 (R/p)² cos i` (rad/s).
    pub raan: f64,
    /// Apsidal precession `ω̇ = 0.75 n J2 (R/p)² (5cos²i − 1)` (rad/s).
    pub arg_perilune: f64,
}

/// Closed-form first-order lunar `J2` secular rates for semi-major axis `a` (m), eccentricity
/// `e`, inclination `i` (rad), using the lunar [`MOON_J2`] / [`MOON_REF_RADIUS_M`] and the
/// lunar mean motion. The analytic oracle the `J2`-only propagation must reproduce (Vallado,
/// *Fundamentals of Astrodynamics and Applications*).
pub fn j2_secular_rates(a: f64, e: f64, i_rad: f64) -> J2SecularRates {
    let n = mean_motion(a);
    let p = a * (1.0 - e * e);
    let factor = n * MOON_J2 * (MOON_REF_RADIUS_M / p).powi(2);
    let ci = i_rad.cos();
    J2SecularRates {
        raan: -1.5 * factor * ci,
        arg_perilune: 0.75 * factor * (5.0 * ci * ci - 1.0),
    }
}

// ---------------------------------------------------------------------------
// Perturbed constellation (the two-body positions_mcmf analogue)
// ---------------------------------------------------------------------------

/// A lunar relay constellation whose satellites are propagated **under perturbations** rather
/// than on ideal Keplerian orbits. Holds one epoch MCI state per satellite plus a shared force
/// model and integrator tolerance.
///
/// [`positions_mcmf`](Self::positions_mcmf) is the perturbed analogue of
/// [`crate::lunar_service::LunarConstellation::positions_mcmf`]: it re-propagates each satellite
/// from epoch to `t_s` and reduces to Moon-fixed coordinates, so it can feed the same
/// frame-agnostic DOP / coverage kernels and expose a lunar-DOP **sensitivity band**.
///
/// **Modelled** — the constellation is illustrative (see [`from_lcns`](Self::from_lcns)); the
/// *method* (two-body limit, `J2` secular rates) is what is Validated.
#[derive(Clone, Debug)]
pub struct PerturbedConstellation {
    /// Epoch (`t = 0`) MCI states, one per satellite.
    pub states0: Vec<LunarState>,
    /// The shared perturbation model.
    pub model: LunarPerturbations,
    /// The integrator tolerance used by [`positions_mci`](Self::positions_mci).
    pub tol: Tolerance,
}

impl PerturbedConstellation {
    /// Build from explicit epoch states, a force model and a tolerance.
    pub fn new(states0: Vec<LunarState>, model: LunarPerturbations, tol: Tolerance) -> Self {
        Self {
            states0,
            model,
            tol,
        }
    }

    /// Build the perturbed twin of the illustrative LCNS-class constellation
    /// [`crate::lunar_service::LunarConstellation::illustrative_lcns`]: the same `n` satellites
    /// (same classical elements at epoch) but propagated under `model`. The epoch states are
    /// produced by [`elements_to_state`] from each [`crate::lunar_service::LunarSat`]'s
    /// elements. **Illustrative; public-source; not affiliated with ESA.**
    pub fn from_lcns(n: usize, model: LunarPerturbations) -> Self {
        let base = crate::lunar_service::LunarConstellation::illustrative_lcns(n);
        let states0 = base
            .sats
            .iter()
            .map(|s| {
                elements_to_state(
                    s.sma_m,
                    s.eccentricity,
                    s.inc_deg,
                    s.raan_deg,
                    s.argp_deg,
                    s.mean_anom_deg,
                )
            })
            .collect();
        Self::new(states0, model, default_tolerance())
    }

    /// Number of satellites.
    pub fn n_sats(&self) -> usize {
        self.states0.len()
    }

    /// MCI positions of every satellite at `t_s` seconds past epoch (each propagated under the
    /// perturbation model from its epoch state).
    pub fn positions_mci(&self, t_s: f64) -> Vec<Vec3> {
        self.states0
            .iter()
            .map(|s| propagate(s, t_s, &self.model, &self.tol).r)
            .collect()
    }

    /// MCMF (Moon-fixed) positions of every satellite at `t_s`: each is propagated in MCI then
    /// reduced with [`crate::lunar::mci_to_mcmf`], so a rotating surface user and the satellites
    /// share one frame — the perturbed drop-in for
    /// [`crate::lunar_service::LunarConstellation::positions_mcmf`].
    pub fn positions_mcmf(&self, t_s: f64) -> Vec<Vec3> {
        self.states0
            .iter()
            .map(|s| mci_to_mcmf(propagate(s, t_s, &self.model, &self.tol).r, t_s))
            .collect()
    }
}

#[cfg(test)]
mod tests {
    use super::*;
    use crate::lunar_service::LunarSat;
    use crate::propagator::secular_slope;
    use std::f64::consts::TAU;

    // A clean, well-inclined, mildly eccentric test orbit for the J2 secular oracle: low enough
    // that J2 dominates cleanly, i = 45° so both Ω̇ and ω̇ are firmly non-zero (away from the
    // critical inclination where ω̇ = 0).
    const A_TEST: f64 = R_MOON_M + 3_000_000.0;
    const E_TEST: f64 = 0.1;
    const I_TEST_DEG: f64 = 45.0;
    const RAAN_TEST_DEG: f64 = 30.0;
    const ARGP_TEST_DEG: f64 = 40.0;

    fn test_state() -> LunarState {
        elements_to_state(A_TEST, E_TEST, I_TEST_DEG, RAAN_TEST_DEG, ARGP_TEST_DEG, 10.0)
    }

    // ---- IC generator consistency ----

    #[test]
    fn elements_to_state_position_matches_analytic_lunarsat() {
        // Oracle: crate::lunar_service::LunarSat::position_mci is the in-tree analytic Kepler
        // propagator. The generated initial position must equal it at t = 0 (same 3-1-3
        // convention), which pins the velocity we build to that same orbit.
        for &(e, argp, m0) in &[(0.0, 0.0, 0.0), (0.1, 40.0, 10.0), (0.6, 90.0, 123.0)] {
            let st = elements_to_state(A_TEST, e, I_TEST_DEG, RAAN_TEST_DEG, argp, m0);
            let sat = LunarSat {
                sma_m: A_TEST,
                eccentricity: e,
                inc_deg: I_TEST_DEG,
                raan_deg: RAAN_TEST_DEG,
                argp_deg: argp,
                mean_anom_deg: m0,
            };
            let p = sat.position_mci(0.0);
            let d = norm(sub(st.r, p));
            assert!(d < 1e-6, "IC position vs analytic LunarSat: {d} m (e={e})");
        }
    }

    // ---- Validated oracle 1: two-body limit ----

    #[test]
    fn two_body_limit_reproduces_analytic_kepler_to_submetre() {
        // Oracle: with every perturbation off, the numerical propagation must reproduce the
        // exact analytic Kepler position (LunarSat::position_mci) — for the two-body problem the
        // closed form IS the truth.
        let e = 0.3;
        let argp = 25.0;
        let m0 = 15.0;
        let st = elements_to_state(A_TEST, e, I_TEST_DEG, RAAN_TEST_DEG, argp, m0);
        let sat = LunarSat {
            sma_m: A_TEST,
            eccentricity: e,
            inc_deg: I_TEST_DEG,
            raan_deg: RAAN_TEST_DEG,
            argp_deg: argp,
            mean_anom_deg: m0,
        };
        let model = LunarPerturbations::two_body();
        let tol = default_tolerance();
        let period = TAU / mean_motion(A_TEST);
        for k in 1..=4 {
            let t = k as f64 * period * 0.9; // sample off the period so it's not the epoch point
            let got = propagate(&st, t, &model, &tol).r;
            let truth = sat.position_mci(t);
            let d = norm(sub(got, truth));
            assert!(d < 1.0, "two-body limit at t={t:.0}s: {d:.4} m vs analytic Kepler");
        }
    }

    // ---- Validated oracle 2: J2 secular rates ----

    #[test]
    fn j2_secular_raan_and_argp_match_closed_form() {
        // Oracle: the closed-form first-order J2 secular rates
        //   Ω̇ = −1.5 n J2 (R/p)² cos i,   ω̇ = 0.75 n J2 (R/p)² (5cos²i − 1)
        // (Vallado). Propagate J2-only over an integer number of periods so short-period terms
        // average out of the least-squares slope, then compare the fitted secular rates.
        let st = test_state();
        let model = LunarPerturbations::j2_only();
        let n = mean_motion(A_TEST);
        let period = TAU / n;
        let n_orbits = 12.0;
        let t_end = n_orbits * period;
        let step = period / 240.0;
        let hist = propagate_history(&st, t_end, step, &model);

        let raan_series: Vec<(f64, f64)> =
            hist.iter().map(|(t, s)| (*t, osculating_raan(s))).collect();
        let argp_series: Vec<(f64, f64)> =
            hist.iter().map(|(t, s)| (*t, osculating_argp(s))).collect();

        let raan_rate = secular_slope(&raan_series);
        let argp_rate = secular_slope(&argp_series);

        let oracle = j2_secular_rates(A_TEST, E_TEST, I_TEST_DEG.to_radians());

        let raan_rel = (raan_rate - oracle.raan).abs() / oracle.raan.abs();
        let argp_rel = (argp_rate - oracle.arg_perilune).abs() / oracle.arg_perilune.abs();

        assert!(
            raan_rel < 0.03,
            "Ω̇: propagated {raan_rate:.6e} vs oracle {:.6e} rad/s ({:.2}%)",
            oracle.raan,
            raan_rel * 100.0
        );
        assert!(
            argp_rel < 0.03,
            "ω̇: propagated {argp_rate:.6e} vs oracle {:.6e} rad/s ({:.2}%)",
            oracle.arg_perilune,
            argp_rel * 100.0
        );
        // Nodal regression is retrograde for a prograde orbit; apsidal precession is prograde
        // below the critical inclination (i = 45° < 63.4°).
        assert!(raan_rate < 0.0, "Ω̇ must be retrograde: {raan_rate:.3e}");
        assert!(argp_rate > 0.0, "ω̇ must be prograde below i_crit: {argp_rate:.3e}");
    }

    // ---- Validated oracle 3: C22 gradient + energy/bounded sanity ----

    #[test]
    fn c22_accel_is_the_exact_gradient_of_its_potential() {
        // Gold standard (same as forces.rs uses for the third body): the analytic acceleration
        // must equal the central finite difference of the potential, component by component.
        let r = [2.5e6, -1.1e6, 8.0e5];
        let a = moon_c22_accel_bodyfixed(r);
        let h = 1.0; // 1 m step
        for k in 0..3 {
            let mut rp = r;
            let mut rm = r;
            rp[k] += h;
            rm[k] -= h;
            let fd = (moon_c22_potential_bodyfixed(rp) - moon_c22_potential_bodyfixed(rm)) / (2.0 * h);
            let rel = (a[k] - fd).abs() / fd.abs().max(1e-30);
            assert!(rel < 1e-5, "C22 ∇U comp {k}: analytic {} vs FD {fd}", a[k]);
        }
    }

    #[test]
    fn j2_only_conserves_semi_major_axis_and_stays_bounded() {
        // J2 produces no secular change in a (energy sanity): the osculating semi-major axis
        // oscillates only at the short-period J2 amplitude and the orbit stays bounded.
        let st = test_state();
        let model = LunarPerturbations::j2_only();
        let period = TAU / mean_motion(A_TEST);
        let hist = propagate_history(&st, 8.0 * period, period / 200.0, &model);
        let a0 = osculating_sma(&st);
        for (_, s) in &hist {
            let a = osculating_sma(s);
            let rel = (a - a0).abs() / a0;
            assert!(rel < 5e-3, "J2 must not change a secularly: rel {rel:.2e}");
            let rn = norm(s.r);
            assert!(rn.is_finite() && rn > R_MOON_M, "orbit must stay above the surface: {rn:.0} m");
        }
    }

    // ---- Modelled: full ELFO stays bounded and moves the geometry ----

    #[test]
    fn full_elfo_stays_bounded_over_days() {
        // The full J2+C22+Earth+Sun ELFO propagation must remain a bounded lunar orbit over a
        // multi-day span (no escape / no impact), i.e. the sensitivity band is physical.
        let st = elements_to_state(R_MOON_M + 8_000_000.0, 0.6, 57.7, 0.0, 90.0, 0.0);
        let model = LunarPerturbations::elfo_full();
        let apolune = (R_MOON_M + 8_000_000.0) * (1.0 + 0.6);
        // 2 days, coarse sampling is enough to catch an unbounded excursion.
        let hist = propagate_history(&st, 2.0 * SECONDS_PER_DAY, 300.0, &model);
        for (_, s) in &hist {
            let rn = norm(s.r);
            assert!(
                rn.is_finite() && rn > R_MOON_M && rn < 3.0 * apolune,
                "full ELFO radius left the bounded band: {rn:.0} m"
            );
        }
    }

    #[test]
    fn perturbed_constellation_moves_relative_to_two_body_but_stays_sane() {
        // The perturbed positions_mcmf must (a) match the two-body twin at epoch, (b) diverge
        // from it after propagation (the sensitivity signal), and (c) keep every satellite a
        // bounded lunar-orbit radius — so it is a safe drop-in for the DOP/coverage kernels.
        let n = 4;
        let two_body = PerturbedConstellation::from_lcns(n, LunarPerturbations::two_body());
        let perturbed = PerturbedConstellation::from_lcns(n, LunarPerturbations::elfo_full());
        assert_eq!(perturbed.n_sats(), n);

        // (a) identical at epoch.
        let p0_tb = two_body.positions_mcmf(0.0);
        let p0_pt = perturbed.positions_mcmf(0.0);
        for (a, b) in p0_tb.iter().zip(p0_pt.iter()) {
            assert!(norm(sub(*a, *b)) < 1e-6, "epoch positions must coincide");
        }

        // (b) + (c) after ~half a day.
        let t = 0.5 * SECONDS_PER_DAY;
        let tb = two_body.positions_mcmf(t);
        let pt = perturbed.positions_mcmf(t);
        let mut max_shift = 0.0_f64;
        for (a, b) in tb.iter().zip(pt.iter()) {
            let shift = norm(sub(*a, *b));
            max_shift = max_shift.max(shift);
            let rn = norm(*b);
            assert!(rn.is_finite() && rn > R_MOON_M, "perturbed sat left the body: {rn:.0} m");
        }
        // Earth third-body + J2/C22 must move the geometry by a meaningful margin over half a day.
        assert!(max_shift > 1_000.0, "perturbed geometry barely moved: {max_shift:.1} m");
    }

    // ---- Determinism ----

    #[test]
    fn propagation_is_deterministic() {
        let st = test_state();
        let model = LunarPerturbations::elfo_full();
        let tol = default_tolerance();
        let a = propagate(&st, 12_345.0, &model, &tol);
        let b = propagate(&st, 12_345.0, &model, &tol);
        assert_eq!(a, b, "no RNG / wall-clock: identical inputs give identical output");
    }
}
