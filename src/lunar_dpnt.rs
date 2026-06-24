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
        let g = Normal::new(0.0, noise_sigma_m).unwrap();
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
    /// Number of satellites in the illustrative constellation (1–12).
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
}

impl LunarDpntScenario {
    fn constellation(&self) -> LunarConstellation {
        let sma_m = self.sma_km * 1000.0;
        let n = self.n_sats.clamp(1, 12);
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
        let g = Normal::new(0.0, 1.0).unwrap();
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

    /// The scenario produces a self-consistent report and a well-formed SVG carrying the
    /// honest illustrative/MODELLED note.
    #[test]
    fn scenario_report_self_consistent() {
        let scn = LunarDpntScenario::default();
        let r = scn.run();
        assert_eq!(r.n_sats, scn.n_sats.clamp(1, 12));
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
}
