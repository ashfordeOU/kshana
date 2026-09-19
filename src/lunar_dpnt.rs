// SPDX-License-Identifier: AGPL-3.0-only
//! Lunar **differential PNT** (a lunar DGNSS / SBAS analogue): a fixed reference
//! station at a *known* lunar-surface location computes per-satellite differential
//! corrections from a Moonlight / LCNS-class constellation, and a roving user applies
//! them so the **common-mode** orbit + clock errors cancel — leaving only a residual
//! that grows with the user↔reference **baseline** (spatial decorrelation) — plus user
//! protection levels that reuse the crate's DO-229E SBAS machinery.
//!
//! ## The differential identity (what this module implements)
//!
//! Each satellite `i` is seen along a line-of-sight unit vector `û_ref,i` from the
//! reference station and `û_user,i` from the user. The broadcast ephemeris gets the
//! satellite wrong by a **common** 3-D orbit-error vector `e_i` (m) and a **common**
//! clock error `c_i` (m). The pseudorange *error* each receiver sees from that satellite
//! is the projection of the orbit error onto its line of sight, plus the (common) clock
//! error, plus receiver noise:
//!
//! ```text
//! ref_error_i   = −e_i · û_ref,i  + c_i + noise_ref,i      (this is the correction)
//! user_raw_i    = −e_i · û_user,i + c_i + noise_user,i
//! ```
//!
//! The reference station *knows* its own position, so its pseudorange residual **is** the
//! correction. The user subtracts it:
//!
//! ```text
//! corrected_user_i = user_raw_i − correction_i
//!                  = −e_i · (û_user,i − û_ref,i) + (noise_user,i − noise_ref,i)
//! ```
//!
//! The clock term `c_i` **cancels exactly** (it is identical in both observations). The
//! orbit term collapses to the projection onto the *difference* of the two LOS unit
//! vectors. As the baseline → 0 the two lines of sight coincide (`û_user,i → û_ref,i`),
//! so the corrected error → 0 (the **spatial-decorrelation floor**); as the baseline
//! grows the LOS difference grows ≈ linearly with the angle subtended at the satellite,
//! so the residual grows ≈ linearly with baseline. Mapping the per-satellite corrected
//! range errors through the user geometry (a weighted-least-squares position solve)
//! yields the user **position** error, which the differential correction reduces from the
//! full standalone (orbit+clock) error to that small, baseline-growing residual.
//!
//! ## Honest scope (the moat)
//!
//! This is a **MODELLED** demonstration of the differential error-cancellation *method*.
//! The cancellation identity is exact algebra; the spatial-decorrelation residual is a
//! **first-order** geometric model (the LOS-difference projection of an injected orbit
//! error), **not** a fitted decorrelation model from real lunar tracking. NovaMoon is
//! referenced only as a system **class** (illustrative, public description of a lunar
//! reference station); the constellation reuses the illustrative public-source
//! [`crate::lunar_service::LunarConstellation`]. No real-data validation, no TRL, no
//! flight heritage, no agency affiliation or endorsement is claimed. The user protection
//! level **reuses the DO-229E [`crate::sbas`] protection-level machinery** with the
//! differential residual σ as the per-satellite error budget — it is the same algorithm,
//! not a certified conformance statement.
//!
//! ## The correction link (what a differential budget actually spends)
//!
//! The identity above assumes a *perfect* correction: computed by a station that knows
//! exactly where it is, delivered instantly, at infinite resolution. None of the three
//! holds. The [`CorrectionLinkBudget`] models all three, each driven by one scenario
//! input, and each is reported **separately** so the budget is a table rather than a
//! single blended number:
//!
//! 1. **Survey error** (`survey_sigma_m`). The station computes its residual against its
//!    *believed* coordinate. If that belief is wrong by `δ`, every correction it
//!    broadcasts carries `+δ·û_ref,i`, and the user's corrected measurement carries
//!    `−δ·û_ref,i`. That term contains **no user geometry at all** — it depends only on
//!    the reference station's lines of sight — so, unlike the orbit term, it does
//!    **not** vanish as the baseline → 0 and does **not** grow with baseline. It is a
//!    floor the differential method cannot see, let alone remove. Mapped through the
//!    user's least-squares solve it transfers essentially one-for-one into the user's
//!    position (see [`survey_position_transfer`]): a station known to half a metre gives
//!    a user known to no better than half a metre, at any baseline.
//! 2. **Correction ageing** (`latency_s`). A correction computed at `t` and applied at
//!    `t + τ` is stale in two ways, and both are modelled
//!    ([`correction_ageing_orbit_range_sigmas`], [`correction_ageing_clock_range_sigma_m`]):
//!    the satellite has *moved*, so the frozen orbit-error vector now projects onto a
//!    rotated line of sight and the un-cancelled remainder is `−e_i·(û_ref,i(t+τ) −
//!    û_ref,i(t))` — a rate taken from the crate's own Keplerian propagator, not an
//!    assumed figure; and the satellite *clock* has drifted off the value the correction
//!    froze, by `c·σ_y(τ)·τ` for the [`AGEING_CLOCK`] class whose power law
//!    [`crate::clock_specs`] calibrates to a published one-day spec row.
//! 3. **Quantization** (`quantization_bits`). The correction crosses a finite-rate link.
//!    Quantized uniformly over the full scale the injected error model can actually
//!    produce — `±(orbit_err_m + clock_err_m)`, which is an exact bound on
//!    `|−e_i·û + c_i|`, not a guess — the step is `2·FS/2^bits` and the residual variance
//!    is the uniform quantizer's `step²/12`.
//!
//! **Additivity.** Every one of these feeds *new* report fields only. With the three
//! inputs at their defaults the pre-existing outputs — `user_error_corrected_m`, the
//! `baseline_curve`, `protection_level_m`, everything — are bit-for-bit what they were
//! before the budget existed, and a test pins exactly that.

use crate::clock_specs::{x_clock_s, LunarClock};
use crate::lunar::{lunar_look_angle, selenographic_to_mcmf, Selenographic, R_MOON_M};
use crate::lunar_service::{LunarConstellation, LunarSat};
use crate::sbas::{sbas_protection_level, SbasErrorModel, SbasMode, SbasProtectionLevel, SbasSat};
use crate::timegeo::C_M_PER_S;
use rand::SeedableRng;
use rand_chacha::ChaCha8Rng;
use rand_distr::{Distribution, Normal};
use serde::{Deserialize, Serialize};

type Vec3 = [f64; 3];

fn sub(a: Vec3, b: Vec3) -> Vec3 {
    [a[0] - b[0], a[1] - b[1], a[2] - b[2]]
}
fn dot(a: Vec3, b: Vec3) -> f64 {
    a[0] * b[0] + a[1] * b[1] + a[2] * b[2]
}
fn norm(a: Vec3) -> f64 {
    dot(a, a).sqrt()
}

/// Line-of-sight **unit vector** from an observer (MCMF) to a satellite (MCMF). Returns
/// the zero vector if the two coincide.
fn los_unit(observer: Vec3, sat: Vec3) -> Vec3 {
    let d = sub(sat, observer);
    let n = norm(d);
    if n == 0.0 {
        [0.0, 0.0, 0.0]
    } else {
        [d[0] / n, d[1] / n, d[2] / n]
    }
}

// ───────────────────────────────────────────────────────────────────────────
// Core differential model
// ───────────────────────────────────────────────────────────────────────────

/// The per-satellite differential **corrections** computed at a reference station at the
/// *known* MCMF position `ref_mcmf`, observing the constellation `sats_mcmf`, given the
/// (common-mode) per-satellite broadcast orbit-error vectors `orbit_err` (m) and clock
/// errors `clock_err_m` (m, already in range units).
///
/// The correction for satellite `i` is the reference station's pseudorange *residual*:
/// `−e_i · û_ref,i + c_i` (the reference station knows its own geometry, so its residual
/// is precisely the common-mode error projected onto its line of sight, plus the clock
/// term). No reference-station noise is injected by this function — see
/// [`corrected_user_range_errors`] for the noisy path.
pub fn differential_corrections(
    ref_mcmf: Vec3,
    sats_mcmf: &[Vec3],
    orbit_err: &[Vec3],
    clock_err_m: &[f64],
) -> Vec<f64> {
    sats_mcmf
        .iter()
        .enumerate()
        .map(|(i, &s)| {
            let u = los_unit(ref_mcmf, s);
            -dot(orbit_err[i], u) + clock_err_m[i]
        })
        .collect()
}

/// The user's **corrected** per-satellite pseudorange errors (m): the user's raw error
/// `−e_i · û_user,i + c_i` minus the broadcast `corrections`. With noise-free corrections
/// (as from [`differential_corrections`]) this is exactly
/// `−e_i · (û_user,i − û_ref,i)` — the clock term cancels and only the LOS-difference
/// projection of the orbit error survives, which → 0 as the baseline → 0.
pub fn corrected_user_range_errors(
    user_mcmf: Vec3,
    _ref_mcmf: Vec3,
    sats_mcmf: &[Vec3],
    orbit_err: &[Vec3],
    clock_err_m: &[f64],
    corrections: &[f64],
) -> Vec<f64> {
    sats_mcmf
        .iter()
        .enumerate()
        .map(|(i, &s)| {
            let u = los_unit(user_mcmf, s);
            let user_raw = -dot(orbit_err[i], u) + clock_err_m[i];
            user_raw - corrections[i]
        })
        .collect()
}

/// The user's **raw** (uncorrected) per-satellite pseudorange errors (m):
/// `−e_i · û_user,i + c_i`. This is the standalone error the user would see using the
/// broadcast ephemeris directly, with no differential correction.
pub fn raw_user_range_errors(
    user_mcmf: Vec3,
    sats_mcmf: &[Vec3],
    orbit_err: &[Vec3],
    clock_err_m: &[f64],
) -> Vec<f64> {
    sats_mcmf
        .iter()
        .enumerate()
        .map(|(i, &s)| {
            let u = los_unit(user_mcmf, s);
            -dot(orbit_err[i], u) + clock_err_m[i]
        })
        .collect()
}

/// Map a set of per-satellite pseudorange *errors* (m) through the user geometry to a
/// 3-D position error (m), by a single-step weighted-least-squares snapshot solve.
///
/// The measurement model linearised about the user is `δρ_i = −û_user,i · δx + δt`, where
/// `δx` is the 3-D position error and `δt` a common (estimated) clock-bias error that
/// soaks up any range error common to all satellites. Solving the 4-unknown
/// `(δx, δt)` normal equations from the per-satellite range errors gives the position
/// error the user's solver would commit. Returns `None` if fewer than four satellites or
/// the geometry is singular.
///
/// The clock unknown is the position-domain analogue of the receiver-clock estimate in a
/// real PVT solve: a constant range bias does **not** corrupt the position fix. (This is
/// the local LS solve documented in the design note: a small, dependency-light snapshot
/// fit rather than the GNSS-Earth-specific [`crate::pvt`] path.)
fn position_error_from_range_errors(
    user_mcmf: Vec3,
    sats_mcmf: &[Vec3],
    range_errors: &[f64],
) -> Option<f64> {
    if sats_mcmf.len() < 4 {
        return None;
    }
    // Geometry rows g_i = [−û_x, −û_y, −û_z, 1] (the partial of pseudorange wrt the
    // [x, y, z, clock] state). Normal matrix A = GᵀG, RHS b = Gᵀ·(range errors).
    let mut a = [[0.0_f64; 4]; 4];
    let mut b = [0.0_f64; 4];
    for (i, &s) in sats_mcmf.iter().enumerate() {
        let u = los_unit(user_mcmf, s);
        let g = [-u[0], -u[1], -u[2], 1.0];
        for p in 0..4 {
            b[p] += g[p] * range_errors[i];
            for q in 0..4 {
                a[p][q] += g[p] * g[q];
            }
        }
    }
    let a_inv = crate::orbit::invert4(a)?;
    let dx: [f64; 4] = std::array::from_fn(|p| (0..4).map(|q| a_inv[p][q] * b[q]).sum());
    if dx.iter().any(|v| !v.is_finite()) {
        return None;
    }
    // 3-D position-error magnitude (the clock unknown dx[3] is discarded).
    Some((dx[0] * dx[0] + dx[1] * dx[1] + dx[2] * dx[2]).sqrt())
}

/// The user's 3-D **position error** (m) from the constellation, with or without the
/// differential corrections applied.
///
/// * `apply_corrections = false` → the standalone error: the raw per-satellite errors
///   `−e_i · û_user,i + c_i` mapped through the geometry. The common clock `c_i` appears
///   as a per-satellite range bias and is *not* fully absorbed by the single estimated
///   clock unknown when the `c_i` differ across satellites, so it corrupts the position
///   fix — this is the error differential correction removes.
/// * `apply_corrections = true` → the corrected error: the user subtracts the reference
///   station's corrections first, so only the baseline-growing LOS-difference residual
///   remains.
///
/// Noise-free. Returns `None` for an under-determined or singular geometry.
pub fn user_position_error_m(
    user_mcmf: Vec3,
    ref_mcmf: Vec3,
    sats_mcmf: &[Vec3],
    orbit_err: &[Vec3],
    clock_err_m: &[f64],
    apply_corrections: bool,
) -> Option<f64> {
    let range_errors = if apply_corrections {
        let corr = differential_corrections(ref_mcmf, sats_mcmf, orbit_err, clock_err_m);
        corrected_user_range_errors(
            user_mcmf,
            ref_mcmf,
            sats_mcmf,
            orbit_err,
            clock_err_m,
            &corr,
        )
    } else {
        raw_user_range_errors(user_mcmf, sats_mcmf, orbit_err, clock_err_m)
    };
    position_error_from_range_errors(user_mcmf, sats_mcmf, &range_errors)
}

/// The user's 3-D **position error** (m) including per-receiver measurement noise: the
/// corrected user range error carries `(noise_user,i − noise_ref,i)` (the clock and the
/// common-mode orbit error are removed by differencing, but the two receivers' *noise* is
/// independent and does **not** cancel — it is the irreducible floor differential
/// correction cannot remove). With `noise_sigma_m = 0` this reduces exactly to the
/// noise-free [`user_position_error_m`] with `apply_corrections = true`. Returns `None`
/// for an under-determined or singular geometry.
pub fn noisy_corrected_position_error_m(
    user_mcmf: Vec3,
    ref_mcmf: Vec3,
    sats_mcmf: &[Vec3],
    orbit_err: &[Vec3],
    clock_err_m: &[f64],
    noise_sigma_m: f64,
    rng: &mut ChaCha8Rng,
) -> Option<f64> {
    let corr = differential_corrections(ref_mcmf, sats_mcmf, orbit_err, clock_err_m);
    let clean = corrected_user_range_errors(
        user_mcmf,
        ref_mcmf,
        sats_mcmf,
        orbit_err,
        clock_err_m,
        &corr,
    );
    let range_errors: Vec<f64> = if noise_sigma_m > 0.0 {
        // The guard ensures positivity but not finiteness; `Normal::new` (rand_distr
        // 0.4) rejects only a non-finite std_dev, so an `inf` sigma would still panic.
        // Coerce a non-finite value to the smallest positive normal.
        let sigma = if noise_sigma_m.is_finite() {
            noise_sigma_m
        } else {
            f64::MIN_POSITIVE
        };
        let g = Normal::new(0.0, sigma)
            .expect("sigma is finite and strictly positive, which Normal::new always accepts");
        clean
            .iter()
            // The independent user-minus-reference receiver noise survives the difference.
            .map(|&e| e + g.sample(rng) - g.sample(rng))
            .collect()
    } else {
        clean
    };
    position_error_from_range_errors(user_mcmf, sats_mcmf, &range_errors)
}

// ───────────────────────────────────────────────────────────────────────────
// Protection level (reuse of the DO-229E SBAS machinery)
// ───────────────────────────────────────────────────────────────────────────

/// A lunar DGNSS user protection level (m), produced by reusing the DO-229E
/// [`crate::sbas`] protection-level algorithm with the differential residual σ as the
/// per-satellite error budget.
#[derive(Clone, Copy, Debug, PartialEq, Serialize)]
pub struct ProtLevel {
    /// Horizontal protection level (m).
    pub hpl_m: f64,
    /// Vertical protection level (m).
    pub vpl_m: f64,
    /// Satellites used.
    pub n_used: usize,
    /// The differential residual σ (m) the PL scales with.
    pub residual_sigma_m: f64,
}

/// Build the SBAS satellite-set (elevation / azimuth + a uniform residual error budget)
/// for the user from the MCMF satellite positions, reusing [`lunar_look_angle`] for the
/// local-level geometry (the DO-229E `geometry_row` azimuth/elevation convention).
fn sbas_sats_for_user(user_mcmf: Vec3, sats_mcmf: &[Vec3], residual_sigma_m: f64) -> Vec<SbasSat> {
    sats_mcmf
        .iter()
        .map(|&s| {
            let look = lunar_look_angle(user_mcmf, s);
            SbasSat {
                el_rad: look.el_deg.to_radians(),
                az_rad: look.az_deg.to_radians(),
                err: SbasErrorModel::uniform(residual_sigma_m),
            }
        })
        .collect()
}

/// The lunar DGNSS user protection level: a thin reuse of the DO-229E
/// [`crate::sbas::sbas_protection_level`] (Precision-Approach mode → both HPL and VPL)
/// with the differential residual σ `residual_sigma_m` as each satellite's 1-σ error
/// budget. `budget` is accepted for interface parity with the other lunar PL paths; the
/// DO-229E K-factors are fixed by the standard, so the residual σ and the geometry are
/// the live inputs. Returns `None` if fewer than four satellites or the geometry is
/// singular (the SBAS machinery's own guard).
pub fn lunar_dgnss_protection_level(
    user_mcmf: Vec3,
    sats_mcmf: &[Vec3],
    residual_sigma_m: f64,
    _budget: crate::raim::IntegrityBudget,
) -> Option<ProtLevel> {
    let sats = sbas_sats_for_user(user_mcmf, sats_mcmf, residual_sigma_m);
    let pl: SbasProtectionLevel = sbas_protection_level(&sats, SbasMode::PrecisionApproach)?;
    Some(ProtLevel {
        hpl_m: pl.hpl_m,
        vpl_m: pl.vpl_m.unwrap_or(0.0),
        n_used: pl.n_used,
        residual_sigma_m,
    })
}

// ───────────────────────────────────────────────────────────────────────────
// Correction link — survey error, correction ageing, quantization
// ───────────────────────────────────────────────────────────────────────────

/// The satellite-clock class whose instability sets the **clock** half of the
/// correction-ageing law.
///
/// [`LunarClock::Rafs`] is the Galileo-heritage full rubidium atomic frequency standard
/// already modelled in [`crate::clock_specs`], whose IEEE-1139 power law is calibrated
/// *there* to reproduce a published one-day time-error row
/// ([`LunarClock::cited_one_day_ns`] = 2.939388 ns at τ = 86 400 s). Assuming an
/// LCNS-class navigation satellite flies a clock of that class is an **illustrative**
/// choice — no lunar navigation satellite has a published in-flight stability — but the
/// curve it produces is the crate's own calibrated spec model, not an invented rate.
pub const AGEING_CLOCK: LunarClock = LunarClock::Rafs;

/// The largest number of bits [`correction_quantization_step_m`] will honour.
///
/// Beyond 64 bits the step underflows to zero anyway, and the cap keeps the `2^bits`
/// exponentiation inside `i32` so a nonsense input cannot wrap it negative and hand back
/// an enormous step.
pub const MAX_QUANTIZATION_BITS: u32 = 64;

/// `1/√3` — the RMS projection of an **isotropically directed** unit vector onto a fixed
/// direction, since `E[(ê·v̂)²] = 1/3`.
///
/// The scenario injects each satellite's orbit error as a uniformly random *direction*
/// times a fixed magnitude (see [`LunarDpntScenario::inject_errors`]), so this is exactly
/// the factor that turns that magnitude into a per-satellite 1-σ along a line of sight.
/// It is a property of the injected error model, not a tuning constant.
fn isotropic_projection() -> f64 {
    1.0 / 3.0_f64.sqrt()
}

/// The per-satellite differential corrections a reference station computes when the
/// coordinate it *believes* (`ref_assumed_mcmf`) is not where it actually *is*
/// (`ref_true_mcmf`).
///
/// The station forms its residual as `measured − predicted`. The measurement comes from
/// where the antenna physically stands; the prediction is computed from the surveyed
/// coordinate. The difference of the two geometric ranges,
/// `|x_i − ref_true| − |x_i − ref_assumed|` (computed exactly here — no linearisation),
/// therefore rides on top of the usual `−e_i·û_ref,i + c_i` and is broadcast to every
/// user as if it were a real satellite error.
///
/// With `ref_assumed_mcmf == ref_true_mcmf` this is identically
/// [`differential_corrections`].
pub fn survey_biased_corrections(
    ref_true_mcmf: Vec3,
    ref_assumed_mcmf: Vec3,
    sats_mcmf: &[Vec3],
    orbit_err: &[Vec3],
    clock_err_m: &[f64],
) -> Vec<f64> {
    sats_mcmf
        .iter()
        .enumerate()
        .map(|(i, &s)| {
            let u = los_unit(ref_true_mcmf, s);
            let survey = norm(sub(s, ref_true_mcmf)) - norm(sub(s, ref_assumed_mcmf));
            -dot(orbit_err[i], u) + clock_err_m[i] + survey
        })
        .collect()
}

/// `(GᵀG)⁻¹` for the user's snapshot geometry, whose rows are `g_i = [−û_i, 1]` — the
/// same design matrix [`position_error_from_range_errors`] solves. `None` for fewer than
/// four satellites or a singular geometry.
fn user_normal_inverse(user_mcmf: Vec3, sats_mcmf: &[Vec3]) -> Option<[[f64; 4]; 4]> {
    if sats_mcmf.len() < 4 {
        return None;
    }
    let mut a = [[0.0_f64; 4]; 4];
    for &s in sats_mcmf {
        let u = los_unit(user_mcmf, s);
        let g = [-u[0], -u[1], -u[2], 1.0];
        for p in 0..4 {
            for q in 0..4 {
                a[p][q] += g[p] * g[q];
            }
        }
    }
    crate::orbit::invert4(a)
}

/// The user's **position dilution of precision** — `√(trace of the 3×3 position block of
/// (GᵀG)⁻¹)` — for the lunar snapshot geometry. This is the factor by which an
/// *independent* per-satellite range error inflates into a 3-D position error.
///
/// Returns `None` for fewer than four satellites or a singular geometry, exactly as the
/// position solve does.
pub fn user_pdop(user_mcmf: Vec3, sats_mcmf: &[Vec3]) -> Option<f64> {
    let q = user_normal_inverse(user_mcmf, sats_mcmf)?;
    let p2 = q[0][0] + q[1][1] + q[2][2];
    if !p2.is_finite() || p2 < 0.0 {
        return None;
    }
    Some(p2.sqrt())
}

/// The 3-D position-domain 1-σ (m) produced by **mutually independent** per-satellite
/// range errors of 1-σ `range_sigmas`, propagated exactly through the user's
/// least-squares solve.
///
/// For the estimator `δx = (GᵀG)⁻¹Gᵀ δρ`, the position covariance is
/// `(GᵀG)⁻¹Gᵀ R G (GᵀG)⁻¹` with `R = diag(σ_i²)`; writing `w_i = (GᵀG)⁻¹g_i` for each
/// satellite's column of the pseudo-inverse, the reported quantity is
/// `√(Σ_i σ_i² (w_i,x² + w_i,y² + w_i,z²))`.
///
/// When every `σ_i` is the same `σ` this collapses **exactly** to `σ · PDOP`, which is
/// how [`user_pdop`] and this function keep each other honest. It is the right
/// propagation for the ageing and quantization terms, whose errors are independent
/// satellite to satellite, and the **wrong** one for the survey term, whose error is
/// fully correlated across satellites — see [`survey_position_transfer`].
///
/// `None` if the lengths disagree, or for a degenerate geometry.
pub fn position_sigma_from_range_sigmas(
    user_mcmf: Vec3,
    sats_mcmf: &[Vec3],
    range_sigmas: &[f64],
) -> Option<f64> {
    if sats_mcmf.len() != range_sigmas.len() {
        return None;
    }
    let q = user_normal_inverse(user_mcmf, sats_mcmf)?;
    let mut var = 0.0_f64;
    for (i, &s) in sats_mcmf.iter().enumerate() {
        let u = los_unit(user_mcmf, s);
        let g = [-u[0], -u[1], -u[2], 1.0];
        let w: [f64; 4] = std::array::from_fn(|p| (0..4).map(|k| q[p][k] * g[k]).sum());
        var += range_sigmas[i] * range_sigmas[i] * (w[0] * w[0] + w[1] * w[1] + w[2] * w[2]);
    }
    if !var.is_finite() || var < 0.0 {
        return None;
    }
    Some(var.sqrt())
}

/// The dimensionless **survey transfer**: the 3-D user position error committed per metre
/// of reference-station coordinate 1-σ *per axis*, root-sum-squared over the three MCMF
/// axes.
///
/// The station's coordinate error `δ` is one vector shared by every correction it
/// broadcasts, so the induced range errors `−δ·û_ref,i` are perfectly correlated and the
/// independent-error propagation of [`position_sigma_from_range_sigmas`] does not apply.
/// Instead this walks the three axes: for each, a 1 m station error is pushed through
/// [`survey_biased_corrections`] and the user's own solve, and the three responses are
/// combined in quadrature (valid because the map is linear and the three axis errors are
/// independent with equal σ).
///
/// The satellites are far enough away that `û_user,i ≈ û_ref,i`, so each axis response is
/// ≈ 1 m and the RSS is ≈ √3 ≈ 1.732 — i.e. a station whose **3-D** uncertainty is `S`
/// hands the user ≈ `S`. That near-unit transfer is the point: it carries no DOP
/// amplification and no baseline dependence.
///
/// `None` for a degenerate geometry.
pub fn survey_position_transfer(
    user_mcmf: Vec3,
    ref_mcmf: Vec3,
    sats_mcmf: &[Vec3],
) -> Option<f64> {
    let zero_orbit = vec![[0.0_f64; 3]; sats_mcmf.len()];
    let zero_clock = vec![0.0_f64; sats_mcmf.len()];
    let mut sum = 0.0_f64;
    for axis in 0..3 {
        let mut assumed = ref_mcmf;
        assumed[axis] += 1.0;
        let corr =
            survey_biased_corrections(ref_mcmf, assumed, sats_mcmf, &zero_orbit, &zero_clock);
        // With no orbit or clock error the user's raw error is zero, so the corrected
        // measurement is exactly minus the (survey-only) correction.
        let range_errors: Vec<f64> = corr.iter().map(|&c| -c).collect();
        let r = position_error_from_range_errors(user_mcmf, sats_mcmf, &range_errors)?;
        sum += r * r;
    }
    Some(sum.sqrt())
}

/// Per-satellite range-domain 1-σ (m) of the **orbit** half of correction ageing.
///
/// A correction computed at `t` froze the projection `−e_i·û_ref,i(t)`. By the time it is
/// applied the satellite has moved, and the un-cancelled remainder is
/// `−e_i·(û_ref,i(t+τ) − û_ref,i(t))`. The line-of-sight rotation comes from the crate's
/// own propagator (the caller passes `sats_aged` from
/// [`LunarConstellation::positions_mcmf`] at `t + τ`) — **there is no assumed
/// orbit-error rate anywhere in this function**. The only statistical step is the
/// [`isotropic_projection`] factor, which is a property of how the scenario draws `e_i`.
///
/// With `sats_aged == sats_now` every σ is exactly `0.0`.
pub fn correction_ageing_orbit_range_sigmas(
    ref_mcmf: Vec3,
    sats_now: &[Vec3],
    sats_aged: &[Vec3],
    orbit_err_m: f64,
) -> Vec<f64> {
    sats_now
        .iter()
        .zip(sats_aged)
        .map(|(&now, &aged)| {
            let d = sub(los_unit(ref_mcmf, aged), los_unit(ref_mcmf, now));
            orbit_err_m.abs() * norm(d) * isotropic_projection()
        })
        .collect()
}

/// Range-domain 1-σ (m) of the **clock** half of correction ageing over `latency_s`.
///
/// The correction froze the satellite clock offset at `t`; by `t + τ` the clock has
/// wandered by `x(τ) = σ_y(τ)·τ` seconds, which no differencing removes because the two
/// observations are no longer simultaneous. The rate is [`AGEING_CLOCK`]'s
/// [`crate::clock_specs`] power law, calibrated there to a published one-day spec row;
/// `x(τ)` is converted to range by the speed of light.
///
/// Exactly `0.0` at `latency_s <= 0` (and for a non-finite input), so switching latency
/// off recovers the un-aged residual bit-for-bit rather than to within a rounding error.
pub fn correction_ageing_clock_range_sigma_m(latency_s: f64) -> f64 {
    // NaN fails both tests below and so lands on the `0.0` branch, which is the only
    // honest answer for an unusable latency.
    if latency_s <= 0.0 || !latency_s.is_finite() {
        return 0.0;
    }
    C_M_PER_S * x_clock_s(&AGEING_CLOCK.powerlaw(), latency_s)
}

/// The step (m) of the uniform quantizer a finite-rate correction link imposes.
///
/// `full_scale_m` is the **half**-range: the quantizer covers `±full_scale_m`, so the
/// span is `2·full_scale_m` and the step is `2·full_scale_m / 2^bits`. Stating the range
/// matters more than stating the bit count, because the range is what sets the step.
/// [`LunarDpntScenario`] uses `orbit_err_m + clock_err_m`, which is an exact bound on
/// `|−e_i·û_ref,i + c_i|` for the injected error model (`|e_i| = orbit_err_m` and
/// `|c_i| = clock_err_m`), not a chosen dynamic range.
///
/// `bits == 0` means **no quantization** and returns `0.0`; `bits` is capped at
/// [`MAX_QUANTIZATION_BITS`].
pub fn correction_quantization_step_m(full_scale_m: f64, bits: u32) -> f64 {
    if bits == 0 || full_scale_m <= 0.0 || !full_scale_m.is_finite() {
        return 0.0;
    }
    let bits = bits.min(MAX_QUANTIZATION_BITS);
    2.0 * full_scale_m / 2.0_f64.powi(bits as i32)
}

/// The 1-σ (m) of a uniform quantizer of step `step_m`: `step/√12`, the square root of
/// the textbook `step²/12` uniform-quantization-error variance.
pub fn uniform_quantization_sigma_m(step_m: f64) -> f64 {
    step_m / 12.0_f64.sqrt()
}

/// The latency-**independent** half of the correction-link budget, carried together so
/// the latency sweep evaluates exactly the same survey and quantization terms the headline
/// figure does rather than recomputing (and possibly re-deriving) them per point.
#[derive(Clone, Copy, Debug)]
struct LinkFixedTerms {
    /// The user PDOP the independent terms scale with.
    pdop: f64,
    /// Position-domain 3-D 1-σ (m) of the survey term.
    survey_position_sigma_m: f64,
    /// Position-domain 3-D 1-σ (m) of the quantization term.
    quantization_position_sigma_m: f64,
}

/// Root-mean-square of a slice, or `0.0` for an empty one.
fn rms(v: &[f64]) -> f64 {
    if v.is_empty() {
        return 0.0;
    }
    (v.iter().map(|x| x * x).sum::<f64>() / v.len() as f64).sqrt()
}

/// The modelled **correction-link residual budget**: what a differential correction picks
/// up between being computed at the reference station and being used by the rover.
///
/// Three independent mechanisms, each with its own scenario input, each reported in both
/// the **range** domain (per-satellite 1-σ, the domain `residual_sigma_m` and the DO-229E
/// protection level live in) and the **position** domain (3-D 1-σ, the domain the
/// scenario's headline error lives in). They are kept apart rather than blended: the
/// three propagate differently, and a single number would hide that the survey term takes
/// no DOP amplification and no baseline dependence while the other two take both.
#[derive(Clone, Debug, Serialize)]
pub struct CorrectionLinkBudget {
    /// Input: the reference station's own **3-D** coordinate 1-σ (m), assumed isotropic.
    pub survey_sigma_m: f64,
    /// The per-axis 1-σ (m) that implies: `survey_sigma_m / √3`.
    pub survey_sigma_per_axis_m: f64,
    /// Range-domain per-satellite 1-σ (m) of the survey term. Since `|û| = 1`, this is
    /// exactly the per-axis σ — but it is **correlated** across satellites, unlike the
    /// other two terms.
    pub survey_range_sigma_m: f64,
    /// [`survey_position_transfer`] — 3-D position error per metre of per-axis station
    /// error, RSS'd over the three axes (dimensionless, ≈ √3).
    pub survey_transfer: f64,
    /// Position-domain 3-D 1-σ (m) of the survey term: `survey_sigma_per_axis_m ×
    /// survey_transfer`. Independent of baseline — that is the whole point.
    pub survey_position_sigma_m: f64,
    /// Input: the age of the correction when it is applied (s).
    pub latency_s: f64,
    /// The ageing law in words, so the report states its own model.
    pub ageing_law: &'static str,
    /// [`AGEING_CLOCK`]'s name — the clock class whose drift sets the clock half.
    pub ageing_clock_class: &'static str,
    /// The clock's time error `x(τ) = σ_y(τ)·τ` (s) at `latency_s`.
    pub ageing_clock_time_error_s: f64,
    /// RMS over satellites of the orbit-ageing range-error growth rate (m/s) — the rate
    /// the geometry actually produced, reported so it can be checked rather than assumed.
    pub ageing_orbit_rate_m_per_s: f64,
    /// Range-domain 1-σ (m), RMS over satellites, of the orbit half of ageing.
    pub latency_orbit_range_sigma_m: f64,
    /// Range-domain 1-σ (m) of the clock half of ageing (identical for every satellite).
    pub latency_clock_range_sigma_m: f64,
    /// Range-domain 1-σ (m) of the whole latency term: the two halves in quadrature.
    pub latency_range_sigma_m: f64,
    /// Position-domain 3-D 1-σ (m) of the orbit half, propagated per satellite.
    pub latency_orbit_position_sigma_m: f64,
    /// Position-domain 3-D 1-σ (m) of the clock half: `latency_clock_range_sigma_m × PDOP`.
    pub latency_clock_position_sigma_m: f64,
    /// Position-domain 3-D 1-σ (m) of the whole latency term.
    pub latency_position_sigma_m: f64,
    /// Input: bits per transmitted correction. `0` disables the term.
    pub quantization_bits: u32,
    /// The quantizer's **half**-range (m): `orbit_err_m + clock_err_m`, an exact bound on
    /// the correction magnitude for the injected error model.
    pub quantization_full_scale_m: f64,
    /// The resulting step (m): `2 × quantization_full_scale_m / 2^bits`.
    pub quantization_step_m: f64,
    /// Range-domain 1-σ (m): `step/√12`.
    pub quantization_range_sigma_m: f64,
    /// Position-domain 3-D 1-σ (m): `quantization_range_sigma_m × PDOP`.
    pub quantization_position_sigma_m: f64,
    /// The user PDOP the two independent terms scale with.
    pub pdop: f64,
    /// Root-sum-square of the three **range**-domain terms (m).
    pub total_range_sigma_m: f64,
    /// Root-sum-square of the three **position**-domain terms (m) — the budget total.
    pub total_position_sigma_m: f64,
    /// The scenario's pre-existing `residual_sigma_m` (m), repeated here so the budget
    /// sits beside the residual it is being compared with.
    pub residual_sigma_m: f64,
    /// `√(residual_sigma_m² + total_range_sigma_m²)` (m) — the per-satellite σ a protection
    /// level would use once the link is accounted for.
    pub total_with_residual_range_sigma_m: f64,
    /// The DO-229E horizontal protection level (m) recomputed at
    /// `total_with_residual_range_sigma_m`. Reported **beside**, never in place of, the
    /// scenario's existing `protection_level_m`.
    pub protection_level_with_link_m: f64,
    /// The matching vertical protection level (m).
    pub vpl_with_link_m: f64,
    /// `(latency_s, total_position_sigma_m)` over a sweep, so the single latency figure is
    /// never the only thing on offer.
    pub latency_curve: Vec<(f64, f64)>,
    /// Honest scope note for the budget specifically.
    pub note: &'static str,
}

/// Units and provenance class for every field [`CorrectionLinkBudget`] introduces.
///
/// The rest of the result document predates this block; this names only what the
/// correction-link budget adds, which is what the R3 units guard checks.
fn correction_link_units() -> serde_json::Value {
    serde_json::json!({
        "correction_link.survey_sigma_m": {
            "unit": "m", "provenance": "input",
            "note": "reference-station 3-D coordinate 1-sigma, isotropic"
        },
        "correction_link.survey_sigma_per_axis_m": {
            "unit": "m", "provenance": "closed-form", "note": "survey_sigma_m / sqrt(3)"
        },
        "correction_link.survey_range_sigma_m": {
            "unit": "m", "provenance": "closed-form",
            "note": "per-satellite 1-sigma; CORRELATED across satellites"
        },
        "correction_link.survey_transfer": {
            "unit": "1", "provenance": "computed",
            "note": "3-D position error per metre of per-axis station error, RSS over the three MCMF axes"
        },
        "correction_link.survey_position_sigma_m": {
            "unit": "m", "provenance": "computed", "note": "independent of baseline"
        },
        "correction_link.latency_s": { "unit": "s", "provenance": "input" },
        "correction_link.ageing_law": { "unit": "text", "provenance": "modelled" },
        "correction_link.ageing_clock_class": { "unit": "text", "provenance": "spec" },
        "correction_link.ageing_clock_time_error_s": {
            "unit": "s", "provenance": "spec",
            "note": "sigma_y(tau)*tau for the AGEING_CLOCK power law in crate::clock_specs"
        },
        "correction_link.ageing_orbit_rate_m_per_s": {
            "unit": "m/s", "provenance": "computed",
            "note": "from the crate's own propagator; no assumed orbit-error rate"
        },
        "correction_link.latency_orbit_range_sigma_m": { "unit": "m", "provenance": "computed" },
        "correction_link.latency_clock_range_sigma_m": { "unit": "m", "provenance": "spec" },
        "correction_link.latency_range_sigma_m": { "unit": "m", "provenance": "computed" },
        "correction_link.latency_orbit_position_sigma_m": { "unit": "m", "provenance": "computed" },
        "correction_link.latency_clock_position_sigma_m": { "unit": "m", "provenance": "computed" },
        "correction_link.latency_position_sigma_m": { "unit": "m", "provenance": "computed" },
        "correction_link.quantization_bits": { "unit": "bit", "provenance": "input" },
        "correction_link.quantization_full_scale_m": {
            "unit": "m", "provenance": "closed-form",
            "note": "half-range orbit_err_m + clock_err_m; an exact bound on |-e.u + c|"
        },
        "correction_link.quantization_step_m": {
            "unit": "m", "provenance": "closed-form", "note": "2*full_scale / 2^bits"
        },
        "correction_link.quantization_range_sigma_m": {
            "unit": "m", "provenance": "closed-form", "note": "step/sqrt(12)"
        },
        "correction_link.quantization_position_sigma_m": { "unit": "m", "provenance": "computed" },
        "correction_link.pdop": { "unit": "1", "provenance": "computed" },
        "correction_link.total_range_sigma_m": {
            "unit": "m", "provenance": "computed",
            "note": "RSS of the three range-domain terms; approximate, because the survey term is correlated across satellites"
        },
        "correction_link.total_position_sigma_m": {
            "unit": "m", "provenance": "computed",
            "note": "RSS of the three position-domain terms; the correlation-respecting total"
        },
        "correction_link.residual_sigma_m": { "unit": "m", "provenance": "input" },
        "correction_link.total_with_residual_range_sigma_m": { "unit": "m", "provenance": "computed" },
        "correction_link.protection_level_with_link_m": {
            "unit": "m", "provenance": "computed",
            "note": "DO-229E HPL at the augmented sigma; reported beside, never in place of, protection_level_m"
        },
        "correction_link.vpl_with_link_m": { "unit": "m", "provenance": "computed" },
        "correction_link.latency_curve": {
            "unit": "(s, m)", "provenance": "computed",
            "note": "latency_s vs total_position_sigma_m"
        },
        "correction_link.note": { "unit": "text", "provenance": "modelled" }
    })
}

// ───────────────────────────────────────────────────────────────────────────
// Scenario
// ───────────────────────────────────────────────────────────────────────────

fn d_n_sats() -> usize {
    8
}
fn d_sma_km() -> f64 {
    R_MOON_M / 1000.0 + 8_000.0
}
fn d_ecc() -> f64 {
    0.6
}
fn d_inc_deg() -> f64 {
    57.7
}
fn d_argp_deg() -> f64 {
    90.0
}
fn d_ref_lat_deg() -> f64 {
    -89.0
}
fn d_ref_lon_deg() -> f64 {
    0.0
}
fn d_baseline_km() -> f64 {
    50.0
}
fn d_orbit_err_m() -> f64 {
    100.0
}
fn d_clock_err_m() -> f64 {
    30.0
}
fn d_noise_m() -> f64 {
    0.0
}
fn d_seed() -> u64 {
    42
}
fn d_t_s() -> f64 {
    0.0
}
fn d_residual_sigma_m() -> f64 {
    5.0
}
fn d_p_hmi() -> f64 {
    1e-4
}
fn d_survey_sigma_m() -> f64 {
    0.30
}
fn d_latency_s() -> f64 {
    10.0
}
fn d_quantization_bits() -> u32 {
    8
}

/// A runnable lunar **differential PNT** scenario. The TOML
/// `kind = "lunar-differential-pnt"` entry the engine dispatches here builds an
/// illustrative LCNS-class constellation, places a NovaMoon-class reference station at a
/// known selenographic location and a user offset from it by `baseline_km`, injects
/// common-mode per-satellite orbit + clock errors, and reports the user position error
/// **with and without** the differential corrections (and the reduction factor), plus the
/// DO-229E user protection level.
///
/// **NovaMoon is referenced only as a system class (illustrative, not affiliated).
/// MODELLED — see the module docs for the honesty boundary.**
#[derive(Clone, Copy, Debug, Deserialize)]
pub struct LunarDpntScenario {
    /// Number of satellites in the illustrative constellation (1–24).
    ///
    /// The upper limit is the size of the illustrative LCNS-class set the constellation
    /// builder lays out, and matches [`crate::lunar_service`]. It was 12 until v0.27.0;
    /// a differential run asking for more satellites silently got twelve, which is
    /// visible in the published `dpnt_nsats_sweep.csv` as an n = 16 row identical to its
    /// n = 12 row. Raising it moves that row: see CHANGELOG.
    #[serde(default = "d_n_sats")]
    pub n_sats: usize,
    /// Semi-major axis (km).
    #[serde(default = "d_sma_km")]
    pub sma_km: f64,
    /// Eccentricity.
    #[serde(default = "d_ecc")]
    pub eccentricity: f64,
    /// Inclination (deg).
    #[serde(default = "d_inc_deg")]
    pub inc_deg: f64,
    /// Argument of perilune (deg).
    #[serde(default = "d_argp_deg")]
    pub argp_deg: f64,
    /// Reference-station selenographic latitude (deg).
    #[serde(default = "d_ref_lat_deg")]
    pub ref_lat_deg: f64,
    /// Reference-station selenographic longitude (deg).
    #[serde(default = "d_ref_lon_deg")]
    pub ref_lon_deg: f64,
    /// User offset from the reference station along the surface (km) — the baseline.
    #[serde(default = "d_baseline_km")]
    pub baseline_km: f64,
    /// Per-satellite common-mode orbit-error magnitude (m).
    #[serde(default = "d_orbit_err_m")]
    pub orbit_err_m: f64,
    /// Per-satellite common-mode clock-error magnitude (m, range units).
    #[serde(default = "d_clock_err_m")]
    pub clock_err_m: f64,
    /// Per-receiver measurement-noise 1-σ (m). Zero ⇒ exact cancellation at zero baseline.
    #[serde(default = "d_noise_m")]
    pub noise_m: f64,
    /// RNG seed (for the injected error directions + noise).
    #[serde(default = "d_seed")]
    pub seed: u64,
    /// Epoch (seconds past the MCI/MCMF-aligned epoch) at which to place the constellation.
    #[serde(default = "d_t_s")]
    pub t_s: f64,
    /// Differential residual σ (m) fed to the SBAS protection-level reuse.
    #[serde(default = "d_residual_sigma_m")]
    pub residual_sigma_m: f64,
    /// Integrity-risk budget `P_HMI` (interface parity; DO-229E K-factors are fixed).
    #[serde(default = "d_p_hmi")]
    pub p_hmi: f64,
    /// The reference station's own **3-D** coordinate 1-σ (m), assumed isotropic — the
    /// survey error. It corrupts every correction the station computes and, unlike the
    /// orbit term, does **not** decorrelate with baseline.
    ///
    /// **Default 0.30 m**, taken from the crate's own
    /// [`crate::lunar_time_budget::BudgetParams::frame_pos_error_m`] default: the lunar
    /// reference-frame position-realisation error, which is the ceiling on how well any
    /// lunar surface coordinate can be known. That figure is itself a **Modelled** budget
    /// allocation in this crate, not a measurement of a real station — no lunar surface
    /// station has a published surveyed accuracy. Set it to `0.0` to switch the term off.
    #[serde(default = "d_survey_sigma_m")]
    pub survey_sigma_m: f64,
    /// Age of the correction when the user applies it (s) — computed at one epoch,
    /// applied at a later one.
    ///
    /// **Default 10 s, an illustrative input**: no lunar differential-correction link has
    /// a published latency, so rather than lean on the single number the report also
    /// emits `correction_link.latency_curve` over 0–300 s. Set it to `0.0` to switch the
    /// term off, which reproduces the un-aged residual exactly.
    #[serde(default = "d_latency_s")]
    pub latency_s: f64,
    /// Bits per transmitted correction on the finite-rate link.
    ///
    /// The quantizer range is **not** a free parameter: it is `±(orbit_err_m +
    /// clock_err_m)`, an exact bound on the correction magnitude for the injected error
    /// model, so the step is `2(orbit_err_m + clock_err_m)/2^bits`.
    ///
    /// **Default 8 bits, an illustrative input** — the link rate of a lunar correction
    /// broadcast is a design choice nobody has published. `0` disables the term.
    #[serde(default = "d_quantization_bits")]
    pub quantization_bits: u32,
}

impl Default for LunarDpntScenario {
    fn default() -> Self {
        Self {
            n_sats: d_n_sats(),
            sma_km: d_sma_km(),
            eccentricity: d_ecc(),
            inc_deg: d_inc_deg(),
            argp_deg: d_argp_deg(),
            ref_lat_deg: d_ref_lat_deg(),
            ref_lon_deg: d_ref_lon_deg(),
            baseline_km: d_baseline_km(),
            orbit_err_m: d_orbit_err_m(),
            clock_err_m: d_clock_err_m(),
            noise_m: d_noise_m(),
            seed: d_seed(),
            t_s: d_t_s(),
            residual_sigma_m: d_residual_sigma_m(),
            p_hmi: d_p_hmi(),
            survey_sigma_m: d_survey_sigma_m(),
            latency_s: d_latency_s(),
            quantization_bits: d_quantization_bits(),
        }
    }
}

/// The result of a [`LunarDpntScenario`].
#[derive(Clone, Debug, Serialize)]
pub struct LunarDpntReport {
    pub n_sats: usize,
    pub baseline_km: f64,
    /// User 3-D position error (m) with the broadcast ephemeris only (no corrections).
    pub user_error_uncorrected_m: f64,
    /// User 3-D position error (m) after the differential corrections are applied.
    pub user_error_corrected_m: f64,
    /// `uncorrected / corrected` (how many times differential correction shrinks the error).
    pub reduction_factor: f64,
    /// The DO-229E user horizontal protection level (m) at the differential residual σ.
    pub protection_level_m: f64,
    /// The vertical protection level (m).
    pub vpl_m: f64,
    /// The differential residual σ (m) the PL scaled with.
    pub residual_sigma_m: f64,
    /// Per-receiver measurement-noise 1-σ (m) applied to the reported corrected error.
    pub noise_m: f64,
    /// The injected per-satellite clock-error magnitude expressed in ns
    /// (`clock_err_m / c`), the natural timing-domain reading of the cancelled term.
    pub clock_err_ns: f64,
    /// Error-vs-baseline curve: `(baseline_km, corrected_error_m)` over a sweep (noise-free).
    pub baseline_curve: Vec<(f64, f64)>,
    /// Honest scope note (illustrative / modelled).
    pub note: &'static str,
    /// The modelled **correction-link** residual budget — survey error, correction ageing
    /// and quantization — computed from the three inputs of the same names. Purely
    /// additive: nothing above this field depends on it.
    pub correction_link: CorrectionLinkBudget,
    /// Unit + provenance class for every field `correction_link` introduces.
    pub units: serde_json::Value,
}

impl LunarDpntScenario {
    fn constellation(&self) -> LunarConstellation {
        let sma_m = self.sma_km * 1000.0;
        // 24, not 12: the builder below lays out an evenly spread constellation for any
        // n, and the service-volume scenario already sweeps to 24. A lower limit here
        // returned a twelve-satellite answer under a larger n_sats label.
        let n = self.n_sats.clamp(1, 24);
        let sats = (0..n)
            .map(|k| LunarSat {
                sma_m,
                eccentricity: self.eccentricity,
                inc_deg: self.inc_deg,
                raan_deg: 360.0 * (k as f64) / (n as f64),
                argp_deg: self.argp_deg,
                mean_anom_deg: 360.0 * (k as f64) / (n as f64),
            })
            .collect();
        LunarConstellation::new(sats)
    }

    /// Reference-station MCMF position (known location).
    fn ref_mcmf(&self) -> Vec3 {
        selenographic_to_mcmf(Selenographic {
            lat_rad: self.ref_lat_deg.to_radians(),
            lon_rad: self.ref_lon_deg.to_radians(),
            alt_m: 0.0,
        })
    }

    /// A user MCMF position offset from the reference station by `baseline_km` along the
    /// surface, toward increasing longitude (a great-circle step from the reference
    /// latitude). For a zero baseline the user coincides with the reference station.
    fn user_mcmf(&self, baseline_km: f64) -> Vec3 {
        // Angular offset along the surface: arc / R_moon.
        let d_ang = (baseline_km * 1000.0) / R_MOON_M;
        selenographic_to_mcmf(Selenographic {
            lat_rad: self.ref_lat_deg.to_radians(),
            lon_rad: self.ref_lon_deg.to_radians() + d_ang,
            alt_m: 0.0,
        })
    }

    /// Deterministically draw the injected common-mode per-satellite orbit-error vectors
    /// (random direction × `orbit_err_m`) and clock errors (`±clock_err_m`).
    fn inject_errors(&self, n: usize) -> (Vec<Vec3>, Vec<f64>) {
        let mut rng = ChaCha8Rng::seed_from_u64(self.seed);
        let g = Normal::new(0.0, 1.0)
            .expect("std_dev is the finite literal 1.0, which Normal::new always accepts");
        let mut orbit_err = Vec::with_capacity(n);
        let mut clock_err = Vec::with_capacity(n);
        for _ in 0..n {
            let v = [g.sample(&mut rng), g.sample(&mut rng), g.sample(&mut rng)];
            let vn = norm(v).max(1e-12);
            orbit_err.push([
                v[0] / vn * self.orbit_err_m,
                v[1] / vn * self.orbit_err_m,
                v[2] / vn * self.orbit_err_m,
            ]);
            // A per-satellite clock error with a random sign so it does not look like a
            // single common receiver bias (which a clock unknown would simply absorb).
            let sign = if g.sample(&mut rng) >= 0.0 { 1.0 } else { -1.0 };
            clock_err.push(sign * self.clock_err_m);
        }
        (orbit_err, clock_err)
    }

    /// The position-domain 3-D 1-σ (m) of the whole correction-link budget at an
    /// arbitrary latency, reusing everything the full budget uses. Factored out so the
    /// `latency_curve` and the headline number cannot drift apart.
    fn link_total_position_sigma_m(
        &self,
        user_mcmf: Vec3,
        ref_mcmf: Vec3,
        sats_now: &[Vec3],
        constellation: &LunarConstellation,
        latency_s: f64,
        fixed: LinkFixedTerms,
    ) -> f64 {
        let sats_aged = constellation.positions_mcmf(self.t_s + latency_s);
        let orbit_sig =
            correction_ageing_orbit_range_sigmas(ref_mcmf, sats_now, &sats_aged, self.orbit_err_m);
        let orbit_pos =
            position_sigma_from_range_sigmas(user_mcmf, sats_now, &orbit_sig).unwrap_or(0.0);
        let clock_pos = correction_ageing_clock_range_sigma_m(latency_s) * fixed.pdop;
        (fixed.survey_position_sigma_m * fixed.survey_position_sigma_m
            + orbit_pos * orbit_pos
            + clock_pos * clock_pos
            + fixed.quantization_position_sigma_m * fixed.quantization_position_sigma_m)
            .sqrt()
    }

    /// Evaluate the [`CorrectionLinkBudget`] for this configuration at the user position
    /// `user_mcmf`. Pure geometry plus the [`AGEING_CLOCK`] spec curve — no RNG, so it
    /// cannot perturb the seeded draws the rest of the scenario depends on.
    fn correction_link_budget(
        &self,
        user_mcmf: Vec3,
        ref_mcmf: Vec3,
        sats_now: &[Vec3],
        constellation: &LunarConstellation,
    ) -> CorrectionLinkBudget {
        let pdop = user_pdop(user_mcmf, sats_now).unwrap_or(0.0);

        // ---- 1. Survey error: correlated across satellites, baseline-independent.
        let survey_sigma_m = self.survey_sigma_m.max(0.0);
        let survey_sigma_per_axis_m = survey_sigma_m / 3.0_f64.sqrt();
        let survey_transfer =
            survey_position_transfer(user_mcmf, ref_mcmf, sats_now).unwrap_or(0.0);
        let survey_range_sigma_m = survey_sigma_per_axis_m;
        let survey_position_sigma_m = survey_sigma_per_axis_m * survey_transfer;

        // ---- 2. Correction ageing: orbit (from the propagator) + clock (from the spec).
        let latency_s = if self.latency_s.is_finite() {
            self.latency_s.max(0.0)
        } else {
            0.0
        };
        let sats_aged = constellation.positions_mcmf(self.t_s + latency_s);
        let orbit_sigmas =
            correction_ageing_orbit_range_sigmas(ref_mcmf, sats_now, &sats_aged, self.orbit_err_m);
        let latency_orbit_range_sigma_m = rms(&orbit_sigmas);
        let latency_clock_range_sigma_m = correction_ageing_clock_range_sigma_m(latency_s);
        let latency_range_sigma_m = (latency_orbit_range_sigma_m * latency_orbit_range_sigma_m
            + latency_clock_range_sigma_m * latency_clock_range_sigma_m)
            .sqrt();
        let latency_orbit_position_sigma_m =
            position_sigma_from_range_sigmas(user_mcmf, sats_now, &orbit_sigmas).unwrap_or(0.0);
        let latency_clock_position_sigma_m = latency_clock_range_sigma_m * pdop;
        let latency_position_sigma_m = (latency_orbit_position_sigma_m
            * latency_orbit_position_sigma_m
            + latency_clock_position_sigma_m * latency_clock_position_sigma_m)
            .sqrt();
        let ageing_orbit_rate_m_per_s = if latency_s > 0.0 {
            latency_orbit_range_sigma_m / latency_s
        } else {
            0.0
        };

        // ---- 3. Quantization: uniform, over the exact correction full scale.
        let quantization_full_scale_m = self.orbit_err_m.abs() + self.clock_err_m.abs();
        let quantization_step_m =
            correction_quantization_step_m(quantization_full_scale_m, self.quantization_bits);
        let quantization_range_sigma_m = uniform_quantization_sigma_m(quantization_step_m);
        let quantization_position_sigma_m = quantization_range_sigma_m * pdop;

        // ---- Totals.
        let total_range_sigma_m = (survey_range_sigma_m * survey_range_sigma_m
            + latency_range_sigma_m * latency_range_sigma_m
            + quantization_range_sigma_m * quantization_range_sigma_m)
            .sqrt();
        let total_position_sigma_m = (survey_position_sigma_m * survey_position_sigma_m
            + latency_position_sigma_m * latency_position_sigma_m
            + quantization_position_sigma_m * quantization_position_sigma_m)
            .sqrt();
        let total_with_residual_range_sigma_m = (self.residual_sigma_m * self.residual_sigma_m
            + total_range_sigma_m * total_range_sigma_m)
            .sqrt();

        let budget = crate::raim::IntegrityBudget {
            p_hmi_vert: self.p_hmi,
            p_hmi_horz: self.p_hmi,
            p_fa: 1e-5,
        };
        let (protection_level_with_link_m, vpl_with_link_m) = match lunar_dgnss_protection_level(
            user_mcmf,
            sats_now,
            total_with_residual_range_sigma_m,
            budget,
        ) {
            Some(pl) => (pl.hpl_m, pl.vpl_m),
            None => (0.0, 0.0),
        };

        let fixed = LinkFixedTerms {
            pdop,
            survey_position_sigma_m,
            quantization_position_sigma_m,
        };
        let latency_curve = [0.0_f64, 1.0, 5.0, 10.0, 30.0, 60.0, 300.0]
            .iter()
            .map(|&t| {
                (
                    t,
                    self.link_total_position_sigma_m(
                        user_mcmf,
                        ref_mcmf,
                        sats_now,
                        constellation,
                        t,
                        fixed,
                    ),
                )
            })
            .collect();

        CorrectionLinkBudget {
            survey_sigma_m,
            survey_sigma_per_axis_m,
            survey_range_sigma_m,
            survey_transfer,
            survey_position_sigma_m,
            latency_s,
            ageing_law: "correction ageing = orbit + clock. Orbit: the frozen per-satellite \
                         orbit-error vector re-projected onto the line of sight the crate's own \
                         Keplerian propagator puts the satellite on at t + latency, so no \
                         orbit-error rate is assumed; growth of the ephemeris error VECTOR \
                         itself is NOT modelled (that needs a real fit-interval prediction \
                         model). Clock: c.sigma_y(tau).tau for the AGEING_CLOCK power law in \
                         crate::clock_specs, calibrated there to a published one-day spec row.",
            ageing_clock_class: AGEING_CLOCK.name(),
            ageing_clock_time_error_s: if latency_s > 0.0 {
                x_clock_s(&AGEING_CLOCK.powerlaw(), latency_s)
            } else {
                0.0
            },
            ageing_orbit_rate_m_per_s,
            latency_orbit_range_sigma_m,
            latency_clock_range_sigma_m,
            latency_range_sigma_m,
            latency_orbit_position_sigma_m,
            latency_clock_position_sigma_m,
            latency_position_sigma_m,
            quantization_bits: self.quantization_bits,
            quantization_full_scale_m,
            quantization_step_m,
            quantization_range_sigma_m,
            quantization_position_sigma_m,
            pdop,
            total_range_sigma_m,
            total_position_sigma_m,
            residual_sigma_m: self.residual_sigma_m,
            total_with_residual_range_sigma_m,
            protection_level_with_link_m,
            vpl_with_link_m,
            latency_curve,
            note: "MODELLED. The survey default is the crate's own lunar frame-realisation \
                   allocation (itself Modelled, not a measured station); the latency and bit \
                   count are ILLUSTRATIVE inputs, which is why the latency curve is reported \
                   beside the single figure. The range-domain total RSSs a survey term that is \
                   CORRELATED across satellites with two that are not, so the position-domain \
                   total is the one that respects the correlation structure. No real-data \
                   validation; no TRL/heritage/agency endorsement.",
        }
    }

    /// Run the scenario. Deterministic given the seed.
    pub fn run(&self) -> LunarDpntReport {
        let constellation = self.constellation();
        let sats = constellation.positions_mcmf(self.t_s);
        let n = sats.len();
        let ref_mcmf = self.ref_mcmf();
        let (orbit_err, clock_err) = self.inject_errors(n);

        // Headline single-baseline result. The uncorrected error is the clean geometric
        // standalone error; the corrected error carries the configured per-receiver
        // measurement noise (the floor differential correction cannot remove). With
        // `noise_m = 0` the corrected error is the exact noise-free residual.
        let user = self.user_mcmf(self.baseline_km);
        let uncorr = user_position_error_m(user, ref_mcmf, &sats, &orbit_err, &clock_err, false)
            .unwrap_or(0.0);
        // A separate, deterministic RNG stream for the measurement noise (seed-derived so
        // it does not perturb the injected-error draw).
        let mut noise_rng = ChaCha8Rng::seed_from_u64(self.seed ^ 0x9E37_79B9_7F4A_7C15);
        let corr = noisy_corrected_position_error_m(
            user,
            ref_mcmf,
            &sats,
            &orbit_err,
            &clock_err,
            self.noise_m,
            &mut noise_rng,
        )
        .unwrap_or(0.0);
        let reduction = if corr > 1e-12 {
            uncorr / corr
        } else {
            f64::INFINITY
        };

        // Protection level at the user (reuse of the SBAS DO-229E machinery).
        let budget = crate::raim::IntegrityBudget {
            p_hmi_vert: self.p_hmi,
            p_hmi_horz: self.p_hmi,
            p_fa: 1e-5,
        };
        let (pl_h, pl_v) =
            match lunar_dgnss_protection_level(user, &sats, self.residual_sigma_m, budget) {
                Some(pl) => (pl.hpl_m, pl.vpl_m),
                None => (0.0, 0.0),
            };

        // Error-vs-baseline curve (corrected error grows with baseline).
        let curve_baselines = [0.0_f64, 1.0, 10.0, 50.0, 100.0, 250.0, 500.0];
        let baseline_curve = curve_baselines
            .iter()
            .map(|&b| {
                let u = self.user_mcmf(b);
                let e = user_position_error_m(u, ref_mcmf, &sats, &orbit_err, &clock_err, true)
                    .unwrap_or(0.0);
                (b, e)
            })
            .collect();

        // The correction-link budget. Pure geometry + the AGEING_CLOCK spec curve, so it
        // draws nothing from either RNG stream and cannot move any value above.
        let correction_link = self.correction_link_budget(user, ref_mcmf, &sats, &constellation);

        LunarDpntReport {
            n_sats: n,
            baseline_km: self.baseline_km,
            user_error_uncorrected_m: uncorr,
            user_error_corrected_m: corr,
            reduction_factor: reduction,
            protection_level_m: pl_h,
            vpl_m: pl_v,
            residual_sigma_m: self.residual_sigma_m,
            noise_m: self.noise_m,
            clock_err_ns: self.clock_err_m / C_M_PER_S * 1.0e9,
            baseline_curve,
            note: "Illustrative, public-source LCNS-class constellation; NovaMoon referenced only \
                   as a system class (not affiliated with ESA). Common-mode cancellation is an \
                   exact identity; the spatial-decorrelation residual is a first-order geometric \
                   model. Protection level REUSES the DO-229E SBAS machinery (crate::sbas). \
                   MODELLED; not real-data validated; no TRL/heritage/agency endorsement.",
            correction_link,
            units: correction_link_units(),
        }
    }
}

/// Render a [`LunarDpntReport`] as a self-contained SVG: the corrected-error-vs-baseline
/// curve, with the uncorrected (standalone) error as a reference line and the headline
/// reduction factor in the caption.
pub fn lunar_dpnt_svg(r: &LunarDpntReport) -> String {
    let (w, h) = (820.0_f64, 360.0_f64);
    let (ml, mr, mt, mb) = (70.0_f64, 20.0_f64, 40.0_f64, 50.0_f64);
    let (pw, ph) = (w - ml - mr, h - mt - mb);

    let xs: Vec<f64> = r.baseline_curve.iter().map(|&(b, _)| b).collect();
    let ys: Vec<f64> = r.baseline_curve.iter().map(|&(_, e)| e).collect();
    let x_max = xs.iter().cloned().fold(1.0_f64, f64::max);
    let y_max = ys
        .iter()
        .cloned()
        .fold(0.0_f64, f64::max)
        .max(r.user_error_uncorrected_m)
        .max(1e-6);
    let xof = |x: f64| ml + (x / x_max) * pw;
    let yof = |y: f64| mt + ph - (y / y_max) * ph;

    let mut svg = String::new();
    svg.push_str(&format!(
        "<svg xmlns=\"http://www.w3.org/2000/svg\" width=\"{w:.0}\" height=\"{h:.0}\" font-family=\"sans-serif\" font-size=\"12\" fill=\"#bcb3a3\">"
    ));
    svg.push_str(&format!(
        "<rect width=\"{w:.0}\" height=\"{h:.0}\" fill=\"#0c0b08\"/>"
    ));
    svg.push_str(&format!(
        "<text x=\"{ml:.0}\" y=\"18\" font-size=\"15\" font-weight=\"bold\">Lunar differential PNT — {} sats: corrected error vs baseline (× {:.0} reduction at {:.0} km)</text>",
        r.n_sats, r.reduction_factor, r.baseline_km
    ));
    svg.push_str(&format!(
        "<text x=\"{ml:.0}\" y=\"34\" font-size=\"11\">uncorrected {:.1} m | corrected {:.2} m | HPL {:.1} m (σ_resid {:.1} m) | MODELLED</text>",
        r.user_error_uncorrected_m, r.user_error_corrected_m, r.protection_level_m, r.residual_sigma_m
    ));

    // Uncorrected (standalone) reference line.
    svg.push_str(&format!(
        "<line x1=\"{:.1}\" y1=\"{:.1}\" x2=\"{:.1}\" y2=\"{:.1}\" stroke=\"#e5645a\" stroke-dasharray=\"5 3\"/>",
        ml,
        yof(r.user_error_uncorrected_m),
        ml + pw,
        yof(r.user_error_uncorrected_m)
    ));
    svg.push_str(&format!(
        "<text x=\"{:.1}\" y=\"{:.1}\" font-size=\"10\" fill=\"#e5645a\">uncorrected (standalone)</text>",
        ml + pw - 150.0,
        yof(r.user_error_uncorrected_m) - 4.0
    ));

    // Corrected-error curve.
    let mut path = String::new();
    for (k, (&x, &y)) in xs.iter().zip(&ys).enumerate() {
        path.push_str(&format!(
            "{}{:.1},{:.1}",
            if k == 0 { "M" } else { " L" },
            xof(x),
            yof(y)
        ));
    }
    svg.push_str(&format!(
        "<path d=\"{path}\" fill=\"none\" stroke=\"#e0bd84\" stroke-width=\"2\"/>"
    ));
    for (&x, &y) in xs.iter().zip(&ys) {
        svg.push_str(&format!(
            "<circle cx=\"{:.1}\" cy=\"{:.1}\" r=\"3\" fill=\"#e0bd84\"/>",
            xof(x),
            yof(y)
        ));
    }

    // Axes.
    let axis_y = mt + ph;
    svg.push_str(&format!(
        "<line x1=\"{ml:.0}\" y1=\"{mt:.0}\" x2=\"{ml:.0}\" y2=\"{axis_y:.0}\" stroke=\"#342c21\"/>"
    ));
    svg.push_str(&format!(
        "<line x1=\"{ml:.0}\" y1=\"{axis_y:.0}\" x2=\"{:.0}\" y2=\"{axis_y:.0}\" stroke=\"#342c21\"/>",
        ml + pw
    ));
    svg.push_str(&format!(
        "<text x=\"{:.0}\" y=\"{:.0}\" font-size=\"11\" text-anchor=\"middle\">baseline (km)</text>",
        ml + pw / 2.0,
        h - 14.0
    ));
    svg.push_str(&format!(
        "<text x=\"{:.0}\" y=\"{:.0}\" font-size=\"11\">err (m)</text>",
        6.0,
        mt + 4.0
    ));
    svg.push_str("</svg>");
    svg
}

#[cfg(test)]
mod tests {
    use super::*;

    fn budget() -> crate::raim::IntegrityBudget {
        crate::raim::IntegrityBudget {
            p_hmi_vert: 1e-4,
            p_hmi_horz: 1e-4,
            p_fa: 1e-5,
        }
    }

    /// A small, well-spread satellite set in MCMF for a given user, with non-degenerate
    /// geometry (six relays at varied az/el).
    fn sky(user: Vec3) -> Vec<Vec3> {
        let azels = [
            (10.0_f64, 70.0_f64),
            (70.0, 35.0),
            (140.0, 55.0),
            (210.0, 28.0),
            (280.0, 60.0),
            (330.0, 40.0),
        ];
        crate::lunar::lunar_sky_geometry(user, 8.0e6, &azels)
    }

    /// THE HEADLINE: at zero baseline the user coincides with the reference station, so
    /// the differential corrections cancel the common-mode error EXACTLY (clock cancels
    /// identically, the LOS difference is zero) — corrected position error ≈ 0, far below
    /// the (large) uncorrected error.
    #[test]
    fn corrections_cancel_common_mode_at_zero_baseline() {
        let ref_mcmf = selenographic_to_mcmf(Selenographic {
            lat_rad: (-89.0_f64).to_radians(),
            lon_rad: 0.0,
            alt_m: 0.0,
        });
        let sats = sky(ref_mcmf);
        let n = sats.len();
        // Distinct common-mode orbit + clock errors per satellite.
        let orbit_err: Vec<Vec3> = (0..n)
            .map(|i| {
                let s = (i as f64 + 1.0) * 17.0;
                [40.0 + s, -25.0 + s, 60.0 - s]
            })
            .collect();
        let clock_err: Vec<f64> = (0..n)
            .map(|i| if i % 2 == 0 { 30.0 } else { -30.0 })
            .collect();

        // User == reference (zero baseline).
        let user = ref_mcmf;
        let corr =
            user_position_error_m(user, ref_mcmf, &sats, &orbit_err, &clock_err, true).unwrap();
        let uncorr =
            user_position_error_m(user, ref_mcmf, &sats, &orbit_err, &clock_err, false).unwrap();

        // Corrected error is essentially zero (machine precision), and the per-satellite
        // corrected range errors are all ~0 too (the clock term cancels exactly).
        let corrections = differential_corrections(ref_mcmf, &sats, &orbit_err, &clock_err);
        let corr_range = corrected_user_range_errors(
            user,
            ref_mcmf,
            &sats,
            &orbit_err,
            &clock_err,
            &corrections,
        );
        for (i, &e) in corr_range.iter().enumerate() {
            assert!(e.abs() < 1e-6, "sat {i} corrected range error {e} not ~0");
        }
        assert!(
            corr < 1e-6,
            "corrected position error must be ~0 at zero baseline, got {corr}"
        );
        assert!(
            uncorr > 1.0,
            "uncorrected error must be substantial (got {uncorr})"
        );
        assert!(
            corr < uncorr,
            "corrected {corr} must be ≪ uncorrected {uncorr}"
        );
    }

    /// The clock term cancels EXACTLY regardless of baseline: with zero orbit error and
    /// arbitrary per-satellite clock errors, the corrected user range errors are all 0
    /// to machine precision at any baseline (the clock is common-mode).
    #[test]
    fn clock_error_cancels_exactly_at_any_baseline() {
        let scn = LunarDpntScenario {
            orbit_err_m: 0.0, // ONLY clock error
            clock_err_m: 75.0,
            noise_m: 0.0,
            ..Default::default()
        };
        let constellation = scn.constellation();
        let sats = constellation.positions_mcmf(0.0);
        let n = sats.len();
        let ref_mcmf = scn.ref_mcmf();
        let (orbit_err, clock_err) = scn.inject_errors(n);
        let corrections = differential_corrections(ref_mcmf, &sats, &orbit_err, &clock_err);
        for &baseline in &[0.0, 50.0, 200.0, 500.0] {
            let user = scn.user_mcmf(baseline);
            let corr_range = corrected_user_range_errors(
                user,
                ref_mcmf,
                &sats,
                &orbit_err,
                &clock_err,
                &corrections,
            );
            for (i, &e) in corr_range.iter().enumerate() {
                assert!(
                    e.abs() < 1e-6,
                    "baseline {baseline} km, sat {i}: clock-only corrected error {e} must cancel"
                );
            }
        }
    }

    /// The spatial-decorrelation residual GROWS with baseline: the corrected user
    /// position error increases monotonically as the user moves away from the reference,
    /// while staying far below the uncorrected error at modest baselines.
    #[test]
    fn residual_grows_with_baseline() {
        let scn = LunarDpntScenario {
            orbit_err_m: 150.0,
            clock_err_m: 40.0,
            noise_m: 0.0,
            ..Default::default()
        };
        let constellation = scn.constellation();
        let sats = constellation.positions_mcmf(0.0);
        let n = sats.len();
        let ref_mcmf = scn.ref_mcmf();
        let (orbit_err, clock_err) = scn.inject_errors(n);

        let baselines = [1.0_f64, 10.0, 50.0, 100.0, 250.0, 500.0];
        let errs: Vec<f64> = baselines
            .iter()
            .map(|&b| {
                let u = scn.user_mcmf(b);
                user_position_error_m(u, ref_mcmf, &sats, &orbit_err, &clock_err, true).unwrap()
            })
            .collect();

        // Monotone non-decreasing in baseline.
        for w in errs.windows(2) {
            assert!(
                w[1] >= w[0] - 1e-9,
                "corrected error must grow with baseline: {:?}",
                errs
            );
        }
        // Strictly larger at the far end than near zero (a real spread).
        assert!(
            *errs.last().unwrap() > errs[0] + 1e-6,
            "far-baseline residual must exceed near-baseline: {:?}",
            errs
        );
        // Still well below the uncorrected error at a modest 50 km baseline.
        let u50 = scn.user_mcmf(50.0);
        let uncorr =
            user_position_error_m(u50, ref_mcmf, &sats, &orbit_err, &clock_err, false).unwrap();
        let corr50 = errs[2]; // baseline 50 km
        assert!(
            corr50 < 0.5 * uncorr,
            "at 50 km corrected {corr50} must be ≪ uncorrected {uncorr}"
        );
    }

    /// Differential beats standalone by a clear margin at a typical baseline.
    #[test]
    fn differential_beats_standalone() {
        let scn = LunarDpntScenario::default();
        let r = scn.run();
        assert!(
            r.user_error_corrected_m < r.user_error_uncorrected_m,
            "corrected {} must beat uncorrected {}",
            r.user_error_corrected_m,
            r.user_error_uncorrected_m
        );
        assert!(
            r.reduction_factor > 2.0,
            "differential should reduce error by a clear margin (>2×), got {}×",
            r.reduction_factor
        );
    }

    /// Per-receiver measurement noise is the irreducible floor differential correction
    /// cannot remove: enabling it raises the reported corrected error above the noise-free
    /// residual, while still beating the (large) uncorrected standalone error.
    #[test]
    fn measurement_noise_raises_the_corrected_floor() {
        let quiet = LunarDpntScenario {
            noise_m: 0.0,
            ..Default::default()
        }
        .run();
        let noisy = LunarDpntScenario {
            noise_m: 2.0,
            ..Default::default()
        }
        .run();
        assert!(
            noisy.user_error_corrected_m > quiet.user_error_corrected_m,
            "noise must raise the corrected floor: quiet {} noisy {}",
            quiet.user_error_corrected_m,
            noisy.user_error_corrected_m
        );
        // Even with noise the differential still beats standalone.
        assert!(noisy.user_error_corrected_m < noisy.user_error_uncorrected_m);
        // The clock-error-in-ns reporting is the c-converted reading of the cancelled term.
        let expect_ns = LunarDpntScenario::default().clock_err_m / C_M_PER_S * 1.0e9;
        assert!(
            (quiet.clock_err_ns - expect_ns).abs() < 1e-9 && quiet.clock_err_ns > 0.0,
            "clock_err_ns must equal clock_err_m / c (got {})",
            quiet.clock_err_ns
        );
    }

    /// The user protection level reuses the SBAS DO-229E machinery: it equals a direct
    /// `sbas::sbas_protection_level` call on the same user geometry + residual σ.
    #[test]
    fn protection_level_reuses_sbas_machinery() {
        let ref_mcmf = selenographic_to_mcmf(Selenographic {
            lat_rad: (-89.0_f64).to_radians(),
            lon_rad: 0.0,
            alt_m: 0.0,
        });
        let sats = sky(ref_mcmf);
        let sigma = 5.0;
        let pl = lunar_dgnss_protection_level(ref_mcmf, &sats, sigma, budget()).expect("PL");

        // Direct SBAS reference on the same look angles + uniform residual budget.
        let sbas_sats: Vec<SbasSat> = sats
            .iter()
            .map(|&s| {
                let look = lunar_look_angle(ref_mcmf, s);
                SbasSat {
                    el_rad: look.el_deg.to_radians(),
                    az_rad: look.az_deg.to_radians(),
                    err: SbasErrorModel::uniform(sigma),
                }
            })
            .collect();
        let direct = sbas_protection_level(&sbas_sats, SbasMode::PrecisionApproach).unwrap();
        assert!(
            (pl.hpl_m - direct.hpl_m).abs() < 1e-12,
            "HPL must match SBAS"
        );
        assert!(
            (pl.vpl_m - direct.vpl_m.unwrap()).abs() < 1e-12,
            "VPL must match SBAS"
        );
        assert_eq!(pl.n_used, direct.n_used);
        // The PL scales with the residual σ (smaller residual ⇒ smaller PL).
        let pl_small = lunar_dgnss_protection_level(ref_mcmf, &sats, 1.0, budget()).unwrap();
        assert!(pl_small.hpl_m < pl.hpl_m, "smaller σ ⇒ smaller HPL");
    }

    /// Fewer than four satellites ⇒ no protection level and no position error.
    #[test]
    fn under_determined_geometry_returns_none() {
        let ref_mcmf = selenographic_to_mcmf(Selenographic {
            lat_rad: (-89.0_f64).to_radians(),
            lon_rad: 0.0,
            alt_m: 0.0,
        });
        let sats = crate::lunar::lunar_sky_geometry(ref_mcmf, 8.0e6, &[(0.0, 70.0), (90.0, 50.0)]);
        assert!(lunar_dgnss_protection_level(ref_mcmf, &sats, 5.0, budget()).is_none());
        let orbit_err = vec![[10.0, 0.0, 0.0]; sats.len()];
        let clock_err = vec![5.0; sats.len()];
        assert!(
            user_position_error_m(ref_mcmf, ref_mcmf, &sats, &orbit_err, &clock_err, true)
                .is_none()
        );
    }

    /// The scenario is deterministic given the seed (same seed → bit-identical JSON;
    /// different seed → a different injected-error realisation).
    #[test]
    fn scenario_is_deterministic() {
        let a = LunarDpntScenario::default().run();
        let b = LunarDpntScenario::default().run();
        assert_eq!(
            serde_json::to_string(&a).unwrap(),
            serde_json::to_string(&b).unwrap()
        );
        let c = LunarDpntScenario {
            seed: 7,
            ..Default::default()
        }
        .run();
        // A different seed gives a (generally) different uncorrected error.
        assert!(
            (a.user_error_uncorrected_m - c.user_error_uncorrected_m).abs() > 1e-9
                || (a.reduction_factor - c.reduction_factor).abs() > 1e-9,
            "different seed should change the realisation"
        );
    }

    /// The satellite count is honoured up to the builder's own limit of 24.
    ///
    /// This is the regression guard for the clamp lifted in v0.27.0. Before it, a run
    /// asking for 16 or 24 satellites silently returned the twelve-satellite answer under
    /// the larger label, which is visible in the published `dpnt_nsats_sweep.csv` as an
    /// n = 16 row byte-identical to its n = 12 row. Each larger constellation must both
    /// report its own count and produce a genuinely different geometry: more satellites
    /// improve the user geometry, so the protection level must strictly fall.
    #[test]
    fn satellite_count_is_honoured_up_to_the_builder_limit() {
        let at = |n: usize| {
            LunarDpntScenario {
                n_sats: n,
                ..LunarDpntScenario::default()
            }
            .run()
        };
        let (a, b, c) = (at(12), at(16), at(24));
        assert_eq!((a.n_sats, b.n_sats, c.n_sats), (12, 16, 24));
        assert!(
            b.protection_level_m < a.protection_level_m,
            "16 satellites must improve on 12, got {} vs {}",
            b.protection_level_m,
            a.protection_level_m
        );
        assert!(
            c.protection_level_m < b.protection_level_m,
            "24 satellites must improve on 16, got {} vs {}",
            c.protection_level_m,
            b.protection_level_m
        );
        // And the clamp itself still holds at the top.
        assert_eq!(at(64).n_sats, 24);
    }

    /// The scenario produces a self-consistent report and a well-formed SVG carrying the
    /// honest illustrative/MODELLED note.
    #[test]
    fn scenario_report_self_consistent() {
        let scn = LunarDpntScenario::default();
        let r = scn.run();
        assert_eq!(r.n_sats, scn.n_sats.clamp(1, 24));
        assert!(r.user_error_uncorrected_m > 0.0);
        assert!(r.user_error_corrected_m >= 0.0);
        assert!(r.reduction_factor.is_finite() && r.reduction_factor > 1.0);
        assert!(r.protection_level_m > 0.0 && r.vpl_m > 0.0);
        // The baseline curve starts at ~0 error (zero baseline) and ends higher.
        assert!(
            r.baseline_curve.first().unwrap().1 < 1e-3,
            "curve starts ~0"
        );
        assert!(
            r.baseline_curve.last().unwrap().1 >= r.baseline_curve.first().unwrap().1,
            "curve grows"
        );
        let svg = lunar_dpnt_svg(&r);
        assert!(svg.starts_with("<svg") && svg.ends_with("</svg>"));
        let json = serde_json::to_string(&r).unwrap();
        assert!(json.contains("not affiliated with ESA"));
        assert!(json.contains("MODELLED"));
    }

    // ═══════════════════════════════════════════════════════════════════════════════
    // The correction-link budget: survey error, correction ageing, quantization.
    // ═══════════════════════════════════════════════════════════════════════════════

    /// The EXACT result document the released scenario produced at its defaults **before**
    /// the correction-link budget existed — captured by running
    /// `kshana scenarios/lunar-differential-pnt.toml` on the parent commit, not
    /// regenerated from the code under test.
    ///
    /// Written as Rust float **literals**, not as a JSON text blob: serde_json's default
    /// float parser is a fast one that can land a unit in the last place away from the
    /// decimal it is given, so parsing the captured text would compare against a number
    /// that is *nearly* the released one. The Rust compiler's literal parser is exact, so
    /// these are the released bits.
    fn pre_link_budget_default_report() -> serde_json::Value {
        serde_json::json!({
          "n_sats": 8,
          "baseline_km": 50.0_f64,
          "user_error_uncorrected_m": 24.460_652_495_293_342_f64,
          "user_error_corrected_m": 0.007_676_508_483_045_71_f64,
          "reduction_factor": 3_186.429_422_870_696_f64,
          "protection_level_m": 23.133_803_613_253_427_f64,
          "vpl_m": 17.227_221_314_344_384_f64,
          "residual_sigma_m": 5.0_f64,
          "noise_m": 0.0_f64,
          "clock_err_ns": 100.069_228_559_445_6_f64,
          "baseline_curve": [
            [0.0_f64, 0.0_f64],
            [1.0_f64, 0.000_153_931_654_819_086_65_f64],
            [10.0_f64, 0.001_538_599_186_168_784_5_f64],
            [50.0_f64, 0.007_676_508_483_045_71_f64],
            [100.0_f64, 0.015_309_308_830_229_898_f64],
            [250.0_f64, 0.037_904_748_016_440_955_f64],
            [500.0_f64, 0.074_320_702_306_343_22_f64]
          ],
          "note": "Illustrative, public-source LCNS-class constellation; NovaMoon referenced only as a system class (not affiliated with ESA). Common-mode cancellation is an exact identity; the spatial-decorrelation residual is a first-order geometric model. Protection level REUSES the DO-229E SBAS machinery (crate::sbas). MODELLED; not real-data validated; no TRL/heritage/agency endorsement."
        })
    }

    /// **THE ADDITIVITY GUARD.** With every new input at its default, the scenario emits
    /// the pre-existing document *unchanged* — same keys, same values, to the last bit —
    /// plus exactly two new top-level keys.
    ///
    /// This is the most important test in the correction-link work. The budget is
    /// allowed to add; it is not allowed to move a single released number. A field-by-field
    /// `Value` comparison against a literal captured *before* the change is the only form
    /// of that claim which cannot quietly re-baseline itself.
    #[test]
    fn the_link_budget_is_purely_additive_with_every_new_input_at_its_default() {
        let mut v = serde_json::to_value(LunarDpntScenario::default().run()).unwrap();
        let obj = v.as_object_mut().expect("the report is a JSON object");

        // Exactly two new top-level keys, and nothing else new.
        let before = pre_link_budget_default_report();
        let before_keys: std::collections::BTreeSet<String> =
            before.as_object().unwrap().keys().cloned().collect();
        let after_keys: std::collections::BTreeSet<String> = obj.keys().cloned().collect();
        let added: Vec<&String> = after_keys.difference(&before_keys).collect();
        let removed: Vec<&String> = before_keys.difference(&after_keys).collect();
        assert!(removed.is_empty(), "the budget REMOVED fields: {removed:?}");
        assert_eq!(
            added,
            vec![&"correction_link".to_string(), &"units".to_string()],
            "unexpected new top-level fields"
        );

        obj.remove("correction_link");
        obj.remove("units");
        assert_eq!(
            v, before,
            "a pre-existing value moved; the budget must be purely additive"
        );

        // Value equality folds 0.0 and -0.0, so pin the headline scalars bit-for-bit too.
        let r = LunarDpntScenario::default().run();
        for (name, got, want) in [
            (
                "user_error_uncorrected_m",
                r.user_error_uncorrected_m,
                24.460_652_495_293_342_f64,
            ),
            (
                "user_error_corrected_m",
                r.user_error_corrected_m,
                0.007_676_508_483_045_71_f64,
            ),
            (
                "reduction_factor",
                r.reduction_factor,
                3_186.429_422_870_696_f64,
            ),
            (
                "protection_level_m",
                r.protection_level_m,
                23.133_803_613_253_427_f64,
            ),
            ("vpl_m", r.vpl_m, 17.227_221_314_344_384_f64),
            ("clock_err_ns", r.clock_err_ns, 100.069_228_559_445_6_f64),
        ] {
            assert_eq!(
                got.to_bits(),
                want.to_bits(),
                "{name} moved: {got} vs the pre-budget {want}"
            );
        }
    }

    /// **THE STRUCTURAL CHECK.** Survey error does **not** decorrelate with baseline;
    /// the orbit term does. Wire the survey term into the user's geometry instead of the
    /// reference station's and this test fails.
    ///
    /// At a zero baseline the differential identity cancels the orbit term to machine
    /// precision — and the survey term is *entirely untouched*, because it never involved
    /// the user's line of sight at all.
    #[test]
    fn survey_error_does_not_decorrelate_with_baseline_but_orbit_error_does() {
        let scn = LunarDpntScenario::default();
        let constellation = scn.constellation();
        let sats = constellation.positions_mcmf(scn.t_s);
        let ref_mcmf = scn.ref_mcmf();
        let (orbit_err, clock_err) = scn.inject_errors(sats.len());

        let baselines = [0.0_f64, 1.0, 10.0, 50.0, 250.0, 500.0];
        let survey: Vec<f64> = baselines
            .iter()
            .map(|&b| {
                let u = scn.user_mcmf(b);
                scn.correction_link_budget(u, ref_mcmf, &sats, &constellation)
                    .survey_position_sigma_m
            })
            .collect();
        let orbit: Vec<f64> = baselines
            .iter()
            .map(|&b| {
                let u = scn.user_mcmf(b);
                user_position_error_m(u, ref_mcmf, &sats, &orbit_err, &clock_err, true).unwrap()
            })
            .collect();

        // The survey term is alive at zero baseline, where the orbit term is exactly gone.
        assert!(
            survey[0] > 0.25,
            "survey term must survive a zero baseline, got {}",
            survey[0]
        );
        assert!(
            orbit[0] < 1e-9,
            "the orbit term must cancel at zero baseline, got {}",
            orbit[0]
        );

        // The survey term is flat across a 0 → 500 km baseline …
        let lo = survey.iter().cloned().fold(f64::INFINITY, f64::min);
        let hi = survey.iter().cloned().fold(f64::NEG_INFINITY, f64::max);
        assert!(
            (hi - lo) / lo < 1e-2,
            "survey term must not decorrelate with baseline: {survey:?}"
        );
        // … while the orbit term grows by orders of magnitude over the same span.
        assert!(
            orbit[5] > 100.0 * orbit[1],
            "the orbit term must decorrelate with baseline: {orbit:?}"
        );
        // And at a 500 km baseline the survey term is STILL the larger of the two, which
        // is why an unmodelled survey error is a floor and not a rounding error.
        assert!(
            survey[5] > orbit[5],
            "survey {} vs orbit {} at 500 km",
            survey[5],
            orbit[5]
        );
    }

    /// A one-metre station coordinate error moves the user by about one metre — per axis,
    /// with no DOP amplification. The three-axis RSS is therefore ≈ √3.
    ///
    /// This is the physical oracle for the survey transfer: in a differential system the
    /// base station's coordinate error transfers into the rover one-for-one, because the
    /// satellites are far enough away that `û_user ≈ û_ref` and the least-squares solve
    /// reads the injected `−δ·û` back out as `δ`.
    #[test]
    fn a_one_metre_station_survey_error_transfers_one_for_one_into_the_user() {
        let scn = LunarDpntScenario::default();
        let sats = scn.constellation().positions_mcmf(scn.t_s);
        let ref_mcmf = scn.ref_mcmf();
        let user = scn.user_mcmf(scn.baseline_km);
        let transfer = survey_position_transfer(user, ref_mcmf, &sats).unwrap();
        assert!(
            (transfer - 3.0_f64.sqrt()).abs() < 1e-3,
            "three-axis transfer must be ≈ √3 = {:.6}, got {transfer}",
            3.0_f64.sqrt()
        );
        // PDOP here is ≈ 1.19, so a DOP-amplified answer would be visibly different: the
        // survey term does NOT take the DOP an independent range error takes.
        let pdop = user_pdop(user, &sats).unwrap();
        assert!(
            (transfer - 3.0_f64.sqrt() * pdop).abs() > 1e-3,
            "transfer must not equal √3·PDOP (pdop {pdop}, transfer {transfer})"
        );
    }

    /// Zero latency reproduces the un-aged residual **exactly** — not to a tolerance.
    #[test]
    fn zero_latency_reproduces_the_unaged_residual_exactly() {
        let aged = LunarDpntScenario::default().run().correction_link;
        let fresh = LunarDpntScenario {
            latency_s: 0.0,
            ..Default::default()
        }
        .run()
        .correction_link;

        assert_eq!(fresh.latency_orbit_range_sigma_m, 0.0);
        assert_eq!(fresh.latency_clock_range_sigma_m, 0.0);
        assert_eq!(fresh.latency_range_sigma_m, 0.0);
        assert_eq!(fresh.latency_position_sigma_m, 0.0);
        assert_eq!(fresh.ageing_clock_time_error_s, 0.0);
        assert_eq!(fresh.ageing_orbit_rate_m_per_s, 0.0);

        // The other two terms are untouched by latency, bit-for-bit …
        assert_eq!(
            fresh.survey_position_sigma_m.to_bits(),
            aged.survey_position_sigma_m.to_bits()
        );
        assert_eq!(
            fresh.quantization_position_sigma_m.to_bits(),
            aged.quantization_position_sigma_m.to_bits()
        );
        // … and the total is exactly their quadrature sum.
        let expect = (fresh.survey_position_sigma_m * fresh.survey_position_sigma_m
            + fresh.quantization_position_sigma_m * fresh.quantization_position_sigma_m)
            .sqrt();
        assert_eq!(fresh.total_position_sigma_m.to_bits(), expect.to_bits());

        // The reported latency curve's own zero-latency point agrees, to the bit.
        assert_eq!(aged.latency_curve[0].0, 0.0);
        assert_eq!(
            aged.latency_curve[0].1.to_bits(),
            fresh.total_position_sigma_m.to_bits()
        );
    }

    /// The residual grows monotonically with the age of the correction.
    #[test]
    fn the_residual_grows_monotonically_with_latency() {
        let at = |t: f64| {
            LunarDpntScenario {
                latency_s: t,
                ..Default::default()
            }
            .run()
            .correction_link
        };
        let taus = [0.0_f64, 1.0, 5.0, 10.0, 30.0, 60.0, 120.0, 300.0];
        let totals: Vec<f64> = taus.iter().map(|&t| at(t).total_position_sigma_m).collect();
        for w in totals.windows(2) {
            assert!(
                w[1] >= w[0],
                "the residual must grow with correction age: {totals:?}"
            );
        }
        assert!(
            *totals.last().unwrap() > totals[0] * 1.5,
            "a 300 s-old correction must be materially worse than a fresh one: {totals:?}"
        );
        // The emitted curve is the same function, evaluated at the same points.
        let curve = at(10.0).latency_curve;
        for (t, y) in &curve {
            let direct = at(*t).total_position_sigma_m;
            assert!(
                (y - direct).abs() <= 1e-12 * direct.max(1.0),
                "latency_curve at {t} s says {y}, a direct run says {direct}"
            );
        }
    }

    /// Quantization scales **exactly** as `2^(−bits)` in the step and as `step²/12` in the
    /// residual variance.
    #[test]
    fn quantization_scales_as_two_to_the_minus_bits_and_step_squared_over_twelve() {
        let full_scale = 130.0_f64;
        for bits in 1_u32..=30 {
            let s = correction_quantization_step_m(full_scale, bits);
            let s_next = correction_quantization_step_m(full_scale, bits + 1);
            // Halving a power-of-two-scaled step is exact in binary floating point.
            assert_eq!(
                (2.0 * s_next).to_bits(),
                s.to_bits(),
                "step must halve exactly from {bits} to {} bits",
                bits + 1
            );
            assert_eq!(
                s.to_bits(),
                (2.0 * full_scale / 2.0_f64.powi(bits as i32)).to_bits(),
                "step must be 2·full_scale·2^(−bits)"
            );
            // Uniform-quantizer variance: step²/12.
            let sigma = uniform_quantization_sigma_m(s);
            assert_eq!(sigma.to_bits(), (s / 12.0_f64.sqrt()).to_bits());
            let var = sigma * sigma;
            let want = s * s / 12.0;
            assert!(
                (var - want).abs() <= 1e-15 * want,
                "variance {var} must be step²/12 = {want}"
            );
        }
        // Zero bits means no quantizer at all.
        assert_eq!(correction_quantization_step_m(full_scale, 0), 0.0);
        assert_eq!(uniform_quantization_sigma_m(0.0), 0.0);

        // End to end through the scenario: one more bit exactly halves the term.
        let a = LunarDpntScenario {
            quantization_bits: 8,
            ..Default::default()
        }
        .run()
        .correction_link;
        let b = LunarDpntScenario {
            quantization_bits: 9,
            ..Default::default()
        }
        .run()
        .correction_link;
        assert_eq!(a.quantization_full_scale_m, 130.0, "orbit_err + clock_err");
        assert_eq!(
            (2.0 * b.quantization_step_m).to_bits(),
            a.quantization_step_m.to_bits()
        );
        assert_eq!(
            (2.0 * b.quantization_range_sigma_m).to_bits(),
            a.quantization_range_sigma_m.to_bits()
        );
        assert_eq!(
            (2.0 * b.quantization_position_sigma_m).to_bits(),
            a.quantization_position_sigma_m.to_bits()
        );
        // And the quantizer range — not the bit count alone — sets the step: doubling the
        // injected error magnitudes doubles the full scale and so doubles the step.
        let wide = LunarDpntScenario {
            orbit_err_m: 200.0,
            clock_err_m: 60.0,
            ..Default::default()
        }
        .run()
        .correction_link;
        assert_eq!(wide.quantization_full_scale_m, 260.0);
        assert_eq!(
            wide.quantization_step_m.to_bits(),
            (2.0 * a.quantization_step_m).to_bits()
        );
    }

    /// Switching each term off in turn recovers the other two in quadrature — so the
    /// three really are being combined as independent contributions and nothing else is
    /// hiding in the total.
    #[test]
    fn each_term_switched_off_recovers_the_remaining_total_in_quadrature() {
        let full = LunarDpntScenario::default().run().correction_link;
        let hypot2 = |a: f64, b: f64| (a * a + b * b).sqrt();
        let close = |a: f64, b: f64| (a - b).abs() <= 1e-12 * a.abs().max(1.0);

        // The full total is the quadrature sum of the three.
        assert!(
            close(
                full.total_position_sigma_m,
                (full.survey_position_sigma_m * full.survey_position_sigma_m
                    + full.latency_position_sigma_m * full.latency_position_sigma_m
                    + full.quantization_position_sigma_m * full.quantization_position_sigma_m)
                    .sqrt()
            ),
            "total {} is not the RSS of {} / {} / {}",
            full.total_position_sigma_m,
            full.survey_position_sigma_m,
            full.latency_position_sigma_m,
            full.quantization_position_sigma_m
        );

        let no_survey = LunarDpntScenario {
            survey_sigma_m: 0.0,
            ..Default::default()
        }
        .run()
        .correction_link;
        assert_eq!(no_survey.survey_position_sigma_m, 0.0);
        assert!(close(
            no_survey.total_position_sigma_m,
            hypot2(
                full.latency_position_sigma_m,
                full.quantization_position_sigma_m
            )
        ));

        let no_latency = LunarDpntScenario {
            latency_s: 0.0,
            ..Default::default()
        }
        .run()
        .correction_link;
        assert_eq!(no_latency.latency_position_sigma_m, 0.0);
        assert!(close(
            no_latency.total_position_sigma_m,
            hypot2(
                full.survey_position_sigma_m,
                full.quantization_position_sigma_m
            )
        ));

        let no_quant = LunarDpntScenario {
            quantization_bits: 0,
            ..Default::default()
        }
        .run()
        .correction_link;
        assert_eq!(no_quant.quantization_position_sigma_m, 0.0);
        assert!(close(
            no_quant.total_position_sigma_m,
            hypot2(full.survey_position_sigma_m, full.latency_position_sigma_m)
        ));

        // All three off ⇒ an exactly empty budget (and the scenario still runs).
        let none = LunarDpntScenario {
            survey_sigma_m: 0.0,
            latency_s: 0.0,
            quantization_bits: 0,
            ..Default::default()
        }
        .run()
        .correction_link;
        assert_eq!(none.total_position_sigma_m, 0.0);
        assert_eq!(none.total_range_sigma_m, 0.0);
        assert_eq!(
            none.total_with_residual_range_sigma_m.to_bits(),
            5.0_f64.to_bits(),
            "with the link switched off the augmented σ is exactly residual_sigma_m"
        );
    }

    /// Independent per-satellite range errors propagate as `σ · PDOP`, and this module's
    /// PDOP agrees with the crate's `orbit::dop` kernel.
    ///
    /// This is a **consistency** check, not an external oracle: both sides build the same
    /// `[−û, 1]` normal matrix. What it catches is a wrong propagation of the *covariance*
    /// — the general `(GᵀG)⁻¹Gᵀ R G (GᵀG)⁻¹` path collapsing to `σ·PDOP` only if the
    /// algebra is right — and a PDOP that drifts from the crate's own definition.
    #[test]
    fn independent_range_sigmas_propagate_as_sigma_times_pdop() {
        let scn = LunarDpntScenario::default();
        let sats = scn.constellation().positions_mcmf(scn.t_s);
        let user = scn.user_mcmf(scn.baseline_km);

        let mine = user_pdop(user, &sats).expect("pdop");
        let theirs = crate::orbit::dop(user, &sats).expect("orbit::dop").pdop;
        assert!(
            (mine - theirs).abs() < 1e-9,
            "user_pdop {mine} vs orbit::dop {theirs}"
        );

        for sigma in [0.25_f64, 1.0, 7.5] {
            let sigmas = vec![sigma; sats.len()];
            let pos = position_sigma_from_range_sigmas(user, &sats, &sigmas).unwrap();
            assert!(
                (pos - sigma * mine).abs() <= 1e-12 * (sigma * mine),
                "equal σ={sigma} must give σ·PDOP = {}, got {pos}",
                sigma * mine
            );
        }
        // A per-satellite σ set is not the same thing as its mean — the general path is
        // genuinely doing per-satellite work.
        let mut uneven = vec![0.0; sats.len()];
        uneven[0] = 10.0;
        let uneven_pos = position_sigma_from_range_sigmas(user, &sats, &uneven).unwrap();
        assert!(uneven_pos > 0.0 && uneven_pos < 10.0 * mine);
        // Length mismatch and degenerate geometry both return None rather than a number.
        assert!(position_sigma_from_range_sigmas(user, &sats, &[1.0]).is_none());
        assert!(user_pdop(user, &sats[..3]).is_none());
    }

    /// Every field the correction-link budget emits is named in the `units` block with a
    /// unit **and** a provenance class, and the block names nothing that does not exist.
    #[test]
    fn every_correction_link_field_carries_a_unit_and_a_provenance_class() {
        let v = serde_json::to_value(LunarDpntScenario::default().run()).unwrap();
        let units = v["units"].as_object().expect("a units block");
        assert!(!units.is_empty());

        // Forward: every emitted field of the block is described.
        for field in v["correction_link"].as_object().unwrap().keys() {
            let key = format!("correction_link.{field}");
            assert!(
                units.contains_key(&key),
                "{key} is emitted but carries no units entry"
            );
        }
        // Each entry states both a unit and a provenance class.
        for (field, meta) in units {
            assert!(meta["unit"].is_string(), "{field} has no unit");
            assert!(
                meta["provenance"].is_string(),
                "{field} has no provenance class"
            );
        }
        // Reverse: the block describes nothing the report does not emit.
        for field in units.keys() {
            let mut cur = &v;
            for seg in field.split('.') {
                cur = &cur[seg];
                assert!(
                    !cur.is_null(),
                    "units names {field}, which the report does not emit"
                );
            }
        }
        // The two domains are labelled, not left to be inferred.
        assert_eq!(units["correction_link.total_position_sigma_m"]["unit"], "m");
        assert_eq!(units["correction_link.pdop"]["unit"], "1");
        assert_eq!(units["correction_link.quantization_bits"]["unit"], "bit");
        assert_eq!(
            units["correction_link.ageing_orbit_rate_m_per_s"]["unit"],
            "m/s"
        );
    }

    /// **THE FINDING, PINNED.** At the stated defaults the correction-link budget is two
    /// orders of magnitude larger than the spatial-decorrelation residual the scenario
    /// has always reported — and still far below a 9.12 m allocation.
    ///
    /// The differential residual at a 50 km baseline is ≈ 8 mm. The link the correction
    /// travels over costs ≈ 0.47 m. Whichever way the allocation is read, the honest
    /// statement is that the three modelled terms do **not** fill it; the defaults are not
    /// tuned to make them.
    #[test]
    fn the_link_budget_dominates_the_decorrelation_residual_and_underfills_nine_metres() {
        let r = LunarDpntScenario::default().run();
        let b = &r.correction_link;
        assert!(
            b.total_position_sigma_m > 10.0 * r.user_error_corrected_m,
            "link budget {} vs decorrelation residual {}",
            b.total_position_sigma_m,
            r.user_error_corrected_m
        );
        assert!(
            b.total_position_sigma_m < 9.12,
            "the three modelled terms total {} m; if this ever exceeds 9.12 m the finding \
             reported alongside this work has changed and must be restated, NOT retuned",
            b.total_position_sigma_m
        );
        // Each term is a real, non-zero contribution — none is a placeholder.
        assert!(b.survey_position_sigma_m > 0.0);
        assert!(b.latency_position_sigma_m > 0.0);
        assert!(b.quantization_position_sigma_m > 0.0);
        // The augmented protection level is reported beside, never in place of, the
        // scenario's own, and is (slightly) the more conservative of the two.
        assert!(b.protection_level_with_link_m > r.protection_level_m);
        assert!(b.vpl_with_link_m > r.vpl_m);
        assert!(b.total_with_residual_range_sigma_m > r.residual_sigma_m);
    }

    /// A survey-biased correction reduces to the unbiased one when the station's believed
    /// coordinate is its real one, and the bias it injects is the reference station's
    /// line-of-sight projection — with no user geometry in it anywhere.
    #[test]
    fn survey_biased_corrections_reduce_to_the_unbiased_ones_and_project_on_the_station_los() {
        let scn = LunarDpntScenario::default();
        let sats = scn.constellation().positions_mcmf(scn.t_s);
        let ref_mcmf = scn.ref_mcmf();
        let (orbit_err, clock_err) = scn.inject_errors(sats.len());

        let plain = differential_corrections(ref_mcmf, &sats, &orbit_err, &clock_err);
        let same = survey_biased_corrections(ref_mcmf, ref_mcmf, &sats, &orbit_err, &clock_err);
        for (a, b) in plain.iter().zip(&same) {
            assert_eq!(
                a.to_bits(),
                b.to_bits(),
                "a zero survey error must change nothing"
            );
        }

        // A 3 m offset along +x: the extra term is δ·û_ref to first order.
        let delta = [3.0, 0.0, 0.0];
        let assumed = [
            ref_mcmf[0] + delta[0],
            ref_mcmf[1] + delta[1],
            ref_mcmf[2] + delta[2],
        ];
        let biased = survey_biased_corrections(ref_mcmf, assumed, &sats, &orbit_err, &clock_err);
        for (i, &s) in sats.iter().enumerate() {
            let expect = dot(delta, los_unit(ref_mcmf, s));
            let got = biased[i] - plain[i];
            assert!(
                (got - expect).abs() < 1e-5,
                "sat {i}: survey bias {got} must be δ·û_ref = {expect}"
            );
        }
    }
}
