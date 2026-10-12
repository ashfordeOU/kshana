// SPDX-License-Identifier: AGPL-3.0-only
//! The `lunar-station-coverage` scenario kind: what positioning accuracy and protection level
//! a user gets from a **lunar differential reference station** at a known south-polar site,
//! as a function of where the user is and when.
//!
//! **MODELLED.** Under the stated assumptions (the constellation, its signal-in-space error,
//! the station's survey accuracy, the correction latency and the link quantization, each an
//! input labelled with its source or as ILLUSTRATIVE) the model gives the figures this kind
//! reports. They are **not** a statement about the performance of any real system, and the
//! work is **not** affiliated with or endorsed by any agency; no TRL or heritage claim.
//!
//! It adds no physics. It is a sweep and Monte Carlo wrapper over the tested functions of
//! [`crate::lunar_dpnt`] (the differential corrections, the survey-biased corrections, the
//! corrected and raw range errors, the snapshot least-squares position solve, the
//! correction-ageing and quantization laws, the DO-229E protection level) and the
//! visibility test and ring grid of [`crate::lunar_service`]:
//!
//! 1. For every grid point and epoch, the satellites above `mask_deg` from the point and
//!    from the station. Fewer than four at the point, or a satellite the point uses that
//!    the station does not see, marks the epoch unavailable (`user_lt4`,
//!    `station_missing_sat`) and computes no error.
//! 2. For every trial, the common-mode orbit and clock errors are drawn
//!    ([`crate::lunar_dpnt::inject_common_mode_errors`]); the station's corrections carry a
//!    per-trial survey error ([`crate::lunar_dpnt::survey_biased_corrections`]) and a
//!    per-satellite ageing (Gaussian, at the 1-sigma of
//!    [`crate::lunar_dpnt::correction_ageing_orbit_range_sigmas`] and
//!    [`crate::lunar_dpnt::correction_ageing_clock_range_sigma_m`]) and quantization
//!    (uniform over one step of [`crate::lunar_dpnt::correction_quantization_step_m`])
//!    error; the user's corrected and raw range errors are mapped through the same
//!    least-squares solve into a 3-D, horizontal and vertical position error.
//! 3. Per point: the stated percentile of those errors over the available (epoch, trial)
//!    samples, the availability, the coverage (the share of epochs whose percentile over
//!    the trials is at most `accuracy_threshold_m`), and the protection levels. Over the
//!    region: area-weighted means, the worst point, and, along each azimuth from the
//!    station, the distance to which coverage stays at least 95 %.
//!
//! Percentiles use the linear interpolation numpy's `percentile` uses by default
//! (`method="linear"`), reproduced operation for operation, so an independent numpy
//! re-computation of the same samples agrees exactly.
//!
//! **Determinism.** Every draw comes from a [`ChaCha8Rng`] seeded from `seed`, the epoch
//! index and the trial index (and, for the receiver noise, the point index), so the result
//! does not depend on iteration order. The draws for epoch 0, trial 0 (and point 0) are
//! seeded exactly as `lunar-differential-pnt` seeds its single draw, which is what lets one
//! point, one epoch and one trial reduce to that kind.

use crate::lunar::{selenographic_to_mcmf, Selenographic, R_MOON_M};
use crate::lunar_dpnt::{
    corrected_user_range_errors, correction_ageing_clock_range_sigma_m,
    correction_ageing_orbit_range_sigmas, correction_quantization_step_m,
    inject_common_mode_errors, lunar_dgnss_protection_level,
    position_error_vector_from_range_errors, raw_user_range_errors, survey_biased_corrections,
    CorrectionLinkBudget, LunarDpntScenario,
};
use crate::lunar_service::{
    south_polar_ring_grid, visible_sat_positions, LunarConstellation, LunarSat, PositionsMcmf,
};
use crate::lunar_terrain::{clears_horizon, LunarTerrainCfg, ResolvedTerrain};
use crate::palette::chart::{AMBER, AXIS, BG, CORAL, CYAN, FONT_SANS, INK, INK_2, INK_3, LIME};
use crate::skyline::Skyline;
use rand::{Rng, SeedableRng};
use rand_chacha::ChaCha8Rng;
use rand_distr::{Distribution, Normal};
use serde::{Deserialize, Serialize};

type Vec3 = [f64; 3];

/// The kind string.
pub const KIND: &str = "lunar-station-coverage";

/// The largest `n_points × n_epochs × n_trials` a run accepts.
pub const MAX_WORK: f64 = 5e7;

/// The coverage share an azimuth must hold for [`AzimuthRadius::radius_km`] to extend.
pub const RADIUS_COVERAGE: f64 = 0.95;

/// The honesty statement every result carries.
pub const NOTE: &str = "MODELLED. Under the stated assumptions (constellation, signal-in-space \
     error, station survey accuracy, correction latency and link quantization, each input \
     labelled in the scenario with its public source or as ILLUSTRATIVE), the model gives \
     these figures. Not a statement about the performance of any real system; not affiliated \
     with or endorsed by any agency; no TRL or heritage claim. Omitted: terrain and horizon \
     masking at the pole, multipath, receiver hardware, growth of the ephemeris error over \
     the correction latency beyond the line-of-sight re-projection.";

/// The honesty statement of a run with a `[terrain]` section: [`NOTE`] with the terrain
/// omission replaced by what the horizon masks do and do not model.
pub const NOTE_TERRAIN: &str = "MODELLED. Under the stated assumptions (constellation, \
     signal-in-space error, station survey accuracy, correction latency and link quantization, \
     each input labelled in the scenario with its public source or as ILLUSTRATIVE), the model \
     gives these figures. Not a statement about the performance of any real system; not \
     affiliated with or endorsed by any agency; no TRL or heritage claim. Terrain: a per-site \
     line-of-sight horizon (a stated profile and/or a ray march over the DEM at its grid \
     resolution; see terrain.note). Omitted: diffraction and terrain multipath, multipath, \
     receiver hardware, growth of the ephemeris error over the correction latency beyond the \
     line-of-sight re-projection.";

const NOISE_SALT: u64 = 0x9E37_79B9_7F4A_7C15;
const SURVEY_SALT: u64 = 0x5EED_5A1E_0F5E_7A71;
const LINK_SALT: u64 = 0x11AC_0FFE_E0DD_BA11;

/// The seed of the draws for epoch index `i` and trial index `k`; exactly `seed` for
/// `(0, 0)`, which is how one epoch and one trial reduce to `lunar-differential-pnt`.
pub fn trial_seed(seed: u64, i: usize, k: usize) -> u64 {
    seed.wrapping_add((i as u64).wrapping_mul(0x9E37_79B9_7F4A_7C15))
        .wrapping_add((k as u64).wrapping_mul(0xD1B5_4A32_D192_ED03))
}

/// The seed of the receiver-noise draws at point index `j` for epoch `i` and trial `k`;
/// for `(0, 0, 0)` exactly the noise seed `lunar-differential-pnt` uses.
pub fn noise_seed(seed: u64, i: usize, k: usize, j: usize) -> u64 {
    trial_seed(seed, i, k) ^ NOISE_SALT ^ (j as u64).wrapping_mul(0xA24B_AED4_963E_E407)
}

/// The value at percentile `p` (0 to 100) of `sorted` (ascending, non-empty), by the
/// linear interpolation of numpy's default `percentile` method, reproduced operation for
/// operation: virtual index `h = (p / 100)(n - 1)`, `t = h - floor(h)`, and
/// `a + (b - a) t` for `t < 0.5`, else `b - (b - a)(1 - t)`.
pub fn percentile_linear(sorted: &[f64], p: f64) -> f64 {
    let n = sorted.len();
    if n == 1 {
        return sorted[0];
    }
    let h = (p / 100.0) * (n - 1) as f64;
    let lo = (h.floor() as usize).min(n - 1);
    let hi = (lo + 1).min(n - 1);
    let t = h - lo as f64;
    let (a, b) = (sorted[lo], sorted[hi]);
    let d = b - a;
    if t >= 0.5 {
        b - d * (1.0 - t)
    } else {
        a + d * t
    }
}

fn sorted(mut v: Vec<f64>) -> Vec<f64> {
    v.sort_by(|a, b| a.total_cmp(b));
    v
}

// ───────────────────────────────────────────────────────────────────────────
// Scenario
// ───────────────────────────────────────────────────────────────────────────

/// A user point named explicitly, in place of the ring grid.
#[derive(Clone, Copy, Debug, Deserialize, Serialize, PartialEq)]
#[serde(deny_unknown_fields)]
pub struct UserPoint {
    /// Selenographic latitude (deg).
    pub lat_deg: f64,
    /// Selenographic longitude (deg).
    pub lon_deg: f64,
}

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
fn d_mask_deg() -> f64 {
    5.0
}
fn d_station_lat_deg() -> f64 {
    -89.0
}
fn d_survey_sigma_m() -> f64 {
    0.30
}
fn d_orbit_err_m() -> f64 {
    100.0
}
fn d_clock_err_m() -> f64 {
    30.0
}
fn d_sise_orbit_fraction() -> f64 {
    0.5
}
fn d_latency_s() -> f64 {
    10.0
}
fn d_quantization_bits() -> u32 {
    8
}
fn d_grid_lat_max_deg() -> f64 {
    -80.0
}
fn d_grid_lat_step_deg() -> f64 {
    1.0
}
fn d_t_span_s() -> f64 {
    86_400.0
}
fn d_t_step_s() -> f64 {
    600.0
}
fn d_n_trials() -> usize {
    200
}
fn d_accuracy_threshold_m() -> f64 {
    1.0
}
fn d_percentile() -> f64 {
    95.0
}
fn d_alert_limit_m() -> f64 {
    10.0
}
fn d_residual_sigma_m() -> f64 {
    5.0
}
fn d_p_hmi() -> f64 {
    1e-4
}
fn d_seed() -> u64 {
    42
}

/// A `lunar-station-coverage` scenario. Inputs that mean the same as in
/// [`LunarDpntScenario`] keep its names and defaults.
#[derive(Clone, Debug, Deserialize, Serialize, PartialEq)]
#[serde(deny_unknown_fields)]
pub struct LunarStationCoverageScenario {
    /// Always `lunar-station-coverage` when given.
    #[serde(default, skip_serializing)]
    pub kind: Option<String>,

    /// Satellites in the illustrative constellation (1 to 24), as in
    /// `lunar-differential-pnt`. Ignored with `ephemeris_path`.
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
    /// A tabulated Moon-centred ephemeris (the loader `moonlight-service-volume` uses) in
    /// place of the illustrative Keplerian set.
    #[serde(default)]
    pub ephemeris_path: Option<String>,
    /// Elevation mask (deg) at the user and at the station; the default is
    /// `moonlight-service-volume`'s.
    #[serde(default = "d_mask_deg")]
    pub mask_deg: f64,

    /// Station selenographic latitude (deg).
    #[serde(default = "d_station_lat_deg")]
    pub station_lat_deg: f64,
    /// Station selenographic longitude (deg).
    #[serde(default)]
    pub station_lon_deg: f64,
    /// Station height above the mean lunar sphere (m).
    #[serde(default)]
    pub station_height_m: f64,
    /// The station's 3-D coordinate 1-sigma (m), isotropic; drawn once per trial.
    #[serde(default = "d_survey_sigma_m")]
    pub survey_sigma_m: f64,

    /// Common-mode orbit-error magnitude per satellite (m), in a random direction.
    /// Ignored when `sise_sigma_m` is given.
    #[serde(default = "d_orbit_err_m")]
    pub orbit_err_m: f64,
    /// Common-mode clock-error magnitude per satellite (m), with a random sign. Ignored
    /// when `sise_sigma_m` is given.
    #[serde(default = "d_clock_err_m")]
    pub clock_err_m: f64,
    /// The signal-in-space error 1-sigma along a line of sight (m). When given, the orbit
    /// and clock magnitudes are set so that the orbit share of its variance is
    /// `sise_orbit_variance_fraction`: `orbit_err_m = sise sqrt(3 f)` (an isotropic
    /// direction projects one third of its variance onto a line of sight) and
    /// `clock_err_m = sise sqrt(1 - f)`.
    #[serde(default)]
    pub sise_sigma_m: Option<f64>,
    /// The orbit share of the SISE variance (0 to 1; default 0.5, ILLUSTRATIVE).
    #[serde(default = "d_sise_orbit_fraction")]
    pub sise_orbit_variance_fraction: f64,
    /// Per-receiver measurement-noise 1-sigma (m), at the user and at the station.
    #[serde(default)]
    pub noise_m: f64,
    /// Age of a correction when applied (s).
    #[serde(default = "d_latency_s")]
    pub latency_s: f64,
    /// Bits per transmitted correction; `0` disables quantization.
    #[serde(default = "d_quantization_bits")]
    pub quantization_bits: u32,

    /// The grid's outer latitude (deg); rings run every `grid_lat_step_deg` from here to
    /// the pole, plus the pole.
    #[serde(default = "d_grid_lat_max_deg")]
    pub grid_lat_max_deg: f64,
    /// Ring spacing (deg).
    #[serde(default = "d_grid_lat_step_deg")]
    pub grid_lat_step_deg: f64,
    /// Explicit user points in place of the grid (each weighted equally).
    #[serde(default)]
    pub points: Option<Vec<UserPoint>>,

    /// First epoch (s past the MCI/MCMF-aligned epoch).
    #[serde(default)]
    pub t_start_s: f64,
    /// Span of the epochs (s); epochs at `t_start_s + i t_step_s` for
    /// `i < ceil(t_span_s / t_step_s)`, at least one.
    #[serde(default = "d_t_span_s")]
    pub t_span_s: f64,
    /// Epoch spacing (s).
    #[serde(default = "d_t_step_s")]
    pub t_step_s: f64,
    /// Monte Carlo trials per epoch.
    #[serde(default = "d_n_trials")]
    pub n_trials: usize,

    /// Coverage threshold on the percentile 3-D error (m), stated before the run.
    #[serde(default = "d_accuracy_threshold_m")]
    pub accuracy_threshold_m: f64,
    /// The percentile reported (0 to 100).
    #[serde(default = "d_percentile")]
    pub percentile: f64,
    /// Horizontal alert limit (m). ILLUSTRATIVE: no public value exists.
    #[serde(default = "d_alert_limit_m")]
    pub alert_limit_m: f64,
    /// Differential residual 1-sigma (m) the protection levels scale with.
    #[serde(default = "d_residual_sigma_m")]
    pub residual_sigma_m: f64,
    /// Integrity-risk budget (interface parity; DO-229E K-factors are fixed).
    #[serde(default = "d_p_hmi")]
    pub p_hmi: f64,
    /// Seed of every draw.
    #[serde(default = "d_seed")]
    pub seed: u64,
    /// Per-site terrain horizon masks ([`crate::lunar_terrain`]): a stated profile at the
    /// station and/or at every user point, and/or a horizon ray-marched over a DEM at each
    /// site. Absent (the default), every site keeps the flat `mask_deg` and the result is
    /// byte-identical to a run without the field.
    #[serde(default, skip_serializing_if = "Option::is_none")]
    pub terrain: Option<LunarTerrainCfg>,
}

impl Default for LunarStationCoverageScenario {
    fn default() -> Self {
        toml::from_str("").expect("every field has a default")
    }
}

/// The error model actually injected, after `sise_sigma_m` (if given) is split.
#[derive(Clone, Debug, Serialize, PartialEq)]
pub struct ErrorModelEcho {
    /// `orbit_err_m and clock_err_m` or `sise_sigma_m split`.
    pub source: &'static str,
    /// Orbit-error magnitude injected per satellite (m).
    pub orbit_err_m: f64,
    /// Clock-error magnitude injected per satellite (m).
    pub clock_err_m: f64,
    /// The resulting line-of-sight SISE 1-sigma (m): `sqrt(orbit_err_m^2 / 3 + clock_err_m^2)`.
    pub los_sise_sigma_m: f64,
}

/// Per-point unavailable-epoch counts, by reason.
#[derive(Clone, Copy, Debug, Default, Serialize, PartialEq)]
pub struct UnavailableReasons {
    /// Fewer than four satellites above the mask at the point.
    pub user_lt4: usize,
    /// A satellite the point uses is not above the mask at the station.
    pub station_missing_sat: usize,
    /// Fewer than four satellites clear the terrain horizon at the point although at
    /// least four clear the flat mask (`user_lt4` then counts only the epochs short under
    /// the flat mask too); only with `[terrain]`.
    #[serde(skip_serializing_if = "Option::is_none")]
    pub terrain_masked: Option<usize>,
}

/// One user point's figures.
#[derive(Clone, Debug, Serialize, PartialEq)]
pub struct PointFigures {
    /// Latitude (deg).
    pub lat_deg: f64,
    /// Longitude (deg).
    pub lon_deg: f64,
    /// Great-circle distance from the station on the mean lunar sphere (km).
    pub distance_km: f64,
    /// Initial bearing from the station (deg, clockwise from north; 0 at the station).
    pub azimuth_deg: f64,
    /// The weight of the point in the region means (sr for the grid, 1 for listed points).
    pub area_weight: f64,
    /// Share of epochs not marked unavailable.
    pub availability: f64,
    /// Share of all epochs whose percentile over the trials of the corrected 3-D error is
    /// at most `accuracy_threshold_m`.
    pub coverage_fraction: f64,
    /// Percentile of the corrected 3-D error over the available (epoch, trial) samples (m).
    pub corrected_p_3d_m: Option<f64>,
    /// The same for the horizontal error (m).
    pub corrected_p_h_m: Option<f64>,
    /// The same for the vertical error (m).
    pub corrected_p_v_m: Option<f64>,
    /// Percentile of the uncorrected 3-D error (m).
    pub uncorrected_p_3d_m: Option<f64>,
    /// Median HPL over the epochs with one (m).
    pub hpl_median_m: Option<f64>,
    /// Largest HPL (m).
    pub hpl_max_m: Option<f64>,
    /// Largest VPL (m).
    pub vpl_max_m: Option<f64>,
    /// Share of all epochs with an HPL below `alert_limit_m`.
    pub hpl_below_alert_fraction: f64,
    /// Unavailable epochs by reason.
    pub unavailable: UnavailableReasons,
    /// The highest terrain horizon at the point (deg); only with `[terrain]`.
    #[serde(skip_serializing_if = "Option::is_none")]
    pub horizon_max_deg: Option<f64>,
    /// Share of the upper hemisphere's solid angle above `max(mask_deg, horizon)` at the
    /// point; only with `[terrain]`.
    #[serde(skip_serializing_if = "Option::is_none")]
    pub sky_open_fraction: Option<f64>,
}

/// The worst point of the region.
#[derive(Clone, Copy, Debug, Serialize, PartialEq)]
pub struct WorstPoint {
    /// Latitude (deg).
    pub lat_deg: f64,
    /// Longitude (deg).
    pub lon_deg: f64,
    /// Its corrected percentile 3-D error (m).
    pub corrected_p_3d_m: f64,
}

/// The region's figures.
#[derive(Clone, Debug, Serialize, PartialEq)]
pub struct RegionFigures {
    /// Area-weighted mean availability.
    pub availability: f64,
    /// Area-weighted mean coverage fraction.
    pub coverage_fraction: f64,
    /// Area-weighted mean over the points with samples of the corrected percentile 3-D
    /// error (m).
    pub corrected_p_3d_m: Option<f64>,
    /// The same, horizontal (m).
    pub corrected_p_h_m: Option<f64>,
    /// The same, vertical (m).
    pub corrected_p_v_m: Option<f64>,
    /// The same, uncorrected 3-D (m).
    pub uncorrected_p_3d_m: Option<f64>,
    /// `uncorrected_p_3d_m / corrected_p_3d_m`.
    pub improvement_factor: Option<f64>,
    /// Largest HPL over every point and epoch (m).
    pub hpl_max_m: Option<f64>,
    /// Largest VPL (m).
    pub vpl_max_m: Option<f64>,
    /// Area-weighted mean of the share of epochs with HPL below the alert limit.
    pub hpl_below_alert_fraction: f64,
    /// The point with the largest corrected percentile 3-D error.
    pub worst_point: Option<WorstPoint>,
}

/// The coverage radius along one azimuth.
#[derive(Clone, Copy, Debug, Serialize, PartialEq)]
pub struct AzimuthRadius {
    /// Centre of the 30-degree azimuth sector from the station (deg).
    pub azimuth_deg: f64,
    /// Distance (km) of the farthest point of the sector reached, walking outward from the
    /// station, before the first point whose coverage is below 95 %; `None` for a sector
    /// with no points.
    pub radius_km: Option<f64>,
    /// True when every point of the sector holds 95 % coverage, so the radius is the
    /// grid's edge and the true radius is at least that.
    pub limited_by_grid: bool,
    /// Points in the sector.
    pub n_points: usize,
}

/// The correction-link budget at the station and at the worst point.
#[derive(Clone, Debug, Serialize)]
pub struct BudgetPair {
    /// The representative epoch (s): `t_start_s`.
    pub epoch_s: f64,
    /// At the station; `None` when fewer than four satellites are in view there.
    pub station: Option<CorrectionLinkBudget>,
    /// At the worst point; `None` without a worst point or four satellites there.
    pub worst_point: Option<CorrectionLinkBudget>,
}

/// The result of a [`LunarStationCoverageScenario`].
#[derive(Clone, Debug, Serialize)]
pub struct LunarStationCoverageReport {
    /// `lunar-station-coverage`.
    pub kind: &'static str,
    /// `MODELLED`.
    pub label: &'static str,
    /// The inputs as run.
    pub inputs_echo: LunarStationCoverageScenario,
    /// The injected error model.
    pub error_model: ErrorModelEcho,
    /// Satellites in the constellation.
    pub n_sats: usize,
    /// User points.
    pub n_grid_points: usize,
    /// Epochs.
    pub n_epochs: usize,
    /// Trials per epoch.
    pub n_trials: usize,
    /// The percentile reported (0 to 100).
    pub percentile: f64,
    /// The mean lunar radius the distances use (m).
    pub moon_radius_m: f64,
    /// Region figures.
    pub region: RegionFigures,
    /// Coverage radius per azimuth sector.
    pub coverage_radius_km: Vec<AzimuthRadius>,
    /// Per-point figures, in grid order.
    pub points: Vec<PointFigures>,
    /// The correction-link budget at the station and at the worst point.
    pub budget_at_station_and_at_edge: BudgetPair,
    /// The terrain horizon masks; only with `[terrain]`.
    #[serde(skip_serializing_if = "Option::is_none")]
    pub terrain: Option<TerrainReport>,
    /// The honesty statement.
    pub note: &'static str,
}

/// The terrain horizon masks a run used.
#[derive(Clone, Debug, Serialize)]
pub struct TerrainReport {
    /// `MODELLED`.
    pub label: &'static str,
    /// The DEM read, if any.
    #[serde(skip_serializing_if = "Option::is_none")]
    pub dem: Option<crate::lunar_terrain::DemEcho>,
    /// The reference station's horizon.
    pub station: crate::lunar_terrain::SiteHorizonEcho,
    /// The user points' horizon sources (as for the station).
    pub user_sources: Vec<String>,
    /// Area-weighted mean over the points of the highest horizon (deg).
    pub user_horizon_max_deg_mean: f64,
    /// The highest horizon over every point (deg).
    pub user_horizon_max_deg_max: f64,
    /// Area-weighted mean over the points of the open-sky share.
    pub user_sky_open_fraction_mean: f64,
    /// What the horizon masks model and omit.
    pub note: &'static str,
}

/// One satellite subset of a constellation, as a [`PositionsMcmf`] provider.
struct Subset<'a> {
    inner: &'a dyn PositionsMcmf,
    idx: Vec<usize>,
}

impl PositionsMcmf for Subset<'_> {
    fn positions_mcmf(&self, t_s: f64) -> Vec<Vec3> {
        let all = self.inner.positions_mcmf(t_s);
        self.idx.iter().map(|&i| all[i]).collect()
    }
}

/// The draws shared by every user point at one (epoch, trial).
struct TrialDraw {
    /// Where the station believes it stands this trial (its survey error).
    assumed: Vec3,
    orbit_err: Vec<Vec3>,
    clock_err: Vec<f64>,
    /// The station's corrections, every satellite.
    corrections: Vec<f64>,
    /// The correction error the link adds (ageing plus quantization), every satellite.
    link_err: Vec<f64>,
}

/// One trial's arithmetic at one (point, epoch), as [`LunarStationCoverageScenario::trace_case`]
/// reports it.
#[derive(Clone, Debug, Serialize)]
pub struct TrialEval {
    /// The station's corrections for the satellites the user uses (m).
    pub corrections_m: Vec<f64>,
    /// The first noise draw per used satellite (m), added; empty without noise.
    pub noise_a_m: Vec<f64>,
    /// The second noise draw per used satellite (m), subtracted; empty without noise.
    pub noise_b_m: Vec<f64>,
    /// The user's raw range errors (m).
    pub raw_range_m: Vec<f64>,
    /// The user's corrected range errors (m): raw minus correction, plus `a - b` noise,
    /// minus the link error.
    pub corrected_range_m: Vec<f64>,
    /// The corrected position-error vector (m, MCMF axes).
    pub corrected_vec_m: Option<Vec3>,
    /// The uncorrected position-error vector (m, MCMF axes).
    pub uncorrected_vec_m: Option<Vec3>,
    /// Its 3-D magnitude (m).
    pub corrected_3d_m: Option<f64>,
    /// Its horizontal magnitude (m), about the local up of the spherical Moon.
    pub corrected_h_m: Option<f64>,
    /// Its vertical magnitude (m).
    pub corrected_v_m: Option<f64>,
    /// The uncorrected 3-D magnitude (m).
    pub uncorrected_3d_m: Option<f64>,
}

/// One (point, epoch, trial) case: the inputs and the arithmetic.
#[derive(Clone, Debug, Serialize)]
pub struct CaseTrace {
    /// Point index in grid order.
    pub point_index: usize,
    /// Epoch index.
    pub epoch_index: usize,
    /// Trial index.
    pub trial_index: usize,
    /// Epoch (s).
    pub t_s: f64,
    /// Elevation mask (rad).
    pub mask_rad: f64,
    /// User position (m, MCMF).
    pub user_mcmf: Vec3,
    /// Station position (m, MCMF).
    pub station_mcmf: Vec3,
    /// Where the station believes it stands this trial (m, MCMF).
    pub station_assumed_mcmf: Vec3,
    /// Every satellite (m, MCMF).
    pub sats_mcmf: Vec<Vec3>,
    /// Orbit-error vectors, every satellite (m).
    pub orbit_err_m: Vec<Vec3>,
    /// Clock errors, every satellite (m).
    pub clock_err_m: Vec<f64>,
    /// Link (ageing plus quantization) errors, every satellite (m).
    pub link_err_m: Vec<f64>,
    /// Indices of the satellites above the mask at the user.
    pub used: Vec<usize>,
    /// `available`, `user_lt4`, `station_missing_sat` or (with `[terrain]`)
    /// `terrain_masked`.
    pub status: &'static str,
    /// The arithmetic, when available.
    pub eval: Option<TrialEval>,
}

/// One epoch's shared geometry.
struct EpochGeometry {
    sats: Vec<Vec3>,
    station_sees: Vec<bool>,
    draws: Vec<TrialDraw>,
}

fn dot(a: Vec3, b: Vec3) -> f64 {
    a[0] * b[0] + a[1] * b[1] + a[2] * b[2]
}
fn norm(a: Vec3) -> f64 {
    dot(a, a).sqrt()
}

/// Whether `sat` clears `mask_rad` from `observer`, by [`visible_sat_positions`]'s own test.
fn sees(observer: Vec3, sat: Vec3, mask_rad: f64) -> bool {
    !visible_sat_positions(observer, &[sat], mask_rad).is_empty()
}

/// [`sees`] at a site with an optional terrain horizon: the flat test, then the horizon
/// ([`clears_horizon`]). With `None` this is exactly [`sees`].
fn sees_at(sky: Option<&Skyline>, observer: Vec3, sat: Vec3, mask_rad: f64) -> bool {
    match sky {
        None => sees(observer, sat, mask_rad),
        Some(k) => clears_horizon(k, observer, sat, sees(observer, sat, mask_rad)),
    }
}

/// The satellites above the flat mask at `observer` (the count a terrain-masked epoch is
/// told apart by).
fn flat_count(observer: Vec3, sats: &[Vec3], mask_rad: f64) -> usize {
    sats.iter()
        .filter(|&&s| sees(observer, s, mask_rad))
        .count()
}

/// Great-circle distance (km) on the mean lunar sphere and initial bearing (deg).
fn distance_bearing(lat1: f64, lon1: f64, lat2: f64, lon2: f64) -> (f64, f64) {
    let (p1, p2) = (lat1.to_radians(), lat2.to_radians());
    let dl = (lon2 - lon1).to_radians();
    let a = ((p2 - p1) / 2.0).sin().powi(2) + p1.cos() * p2.cos() * (dl / 2.0).sin().powi(2);
    let c = 2.0 * a.sqrt().min(1.0).asin();
    let d_km = R_MOON_M * c / 1000.0;
    if d_km < 1e-9 {
        return (0.0, 0.0);
    }
    let y = dl.sin() * p2.cos();
    let x = p1.cos() * p2.sin() - p1.sin() * p2.cos() * dl.cos();
    (d_km, y.atan2(x).to_degrees().rem_euclid(360.0))
}

/// The point reached from (`lat`, `lon`) along `bearing_deg` after `d_km` (deg, deg).
fn destination(lat: f64, lon: f64, bearing_deg: f64, d_km: f64) -> (f64, f64) {
    let (p1, l1, b) = (lat.to_radians(), lon.to_radians(), bearing_deg.to_radians());
    let c = d_km * 1000.0 / R_MOON_M;
    let p2 = (p1.sin() * c.cos() + p1.cos() * c.sin() * b.cos()).asin();
    let l2 = l1 + (b.sin() * c.sin() * p1.cos()).atan2(c.cos() - p1.sin() * p2.sin());
    (p2.to_degrees(), l2.to_degrees())
}

fn weighted_mean(values: &[(f64, f64)]) -> Option<f64> {
    let w: f64 = values.iter().map(|(_, w)| w).sum();
    if values.is_empty() || w <= 0.0 {
        return None;
    }
    Some(values.iter().map(|(v, w)| v * w).sum::<f64>() / w)
}

impl LunarStationCoverageScenario {
    /// The orbit and clock magnitudes injected, after splitting `sise_sigma_m`.
    pub fn error_model(&self) -> ErrorModelEcho {
        let (source, o, c) = match self.sise_sigma_m {
            Some(s) => {
                let f = self.sise_orbit_variance_fraction;
                (
                    "sise_sigma_m split",
                    s * (3.0 * f).sqrt(),
                    s * (1.0 - f).sqrt(),
                )
            }
            None => (
                "orbit_err_m and clock_err_m",
                self.orbit_err_m,
                self.clock_err_m,
            ),
        };
        ErrorModelEcho {
            source,
            orbit_err_m: o,
            clock_err_m: c,
            los_sise_sigma_m: (o * o / 3.0 + c * c).sqrt(),
        }
    }

    /// The epochs (s).
    pub fn epochs(&self) -> Vec<f64> {
        let n = if self.t_span_s > 0.0 {
            ((self.t_span_s / self.t_step_s) - 1e-9).ceil().max(1.0) as usize
        } else {
            1
        };
        (0..n)
            .map(|i| self.t_start_s + i as f64 * self.t_step_s)
            .collect()
    }

    /// The user points: `points` when given, else the ring grid. `(lat, lon, mcmf, weight)`.
    pub fn user_points(&self) -> Vec<(f64, f64, Vec3, f64)> {
        match &self.points {
            Some(p) => p
                .iter()
                .map(|u| {
                    let m = selenographic_to_mcmf(Selenographic {
                        lat_rad: u.lat_deg.to_radians(),
                        lon_rad: u.lon_deg.to_radians(),
                        alt_m: 0.0,
                    });
                    (u.lat_deg, u.lon_deg, m, 1.0)
                })
                .collect(),
            None => south_polar_ring_grid(self.grid_lat_max_deg, self.grid_lat_step_deg)
                .into_iter()
                .map(|g| (g.lat_deg, g.lon_deg, g.mcmf, g.area_sr))
                .collect(),
        }
    }

    /// The station's Moon-fixed position (m).
    pub fn station_mcmf(&self) -> Vec3 {
        selenographic_to_mcmf(Selenographic {
            lat_rad: self.station_lat_deg.to_radians(),
            lon_rad: self.station_lon_deg.to_radians(),
            alt_m: self.station_height_m,
        })
    }

    fn validate(&self) -> Result<(), String> {
        let bad = |what: &str| Err(format!("{KIND}: {what}"));
        if !(1..=24).contains(&self.n_sats) {
            return bad("n_sats must be 1 to 24 (the constellation builder's cap)");
        }
        for (name, v) in [
            ("sma_km", self.sma_km),
            ("t_step_s", self.t_step_s),
            ("accuracy_threshold_m", self.accuracy_threshold_m),
            ("alert_limit_m", self.alert_limit_m),
        ] {
            if !(v.is_finite() && v > 0.0) {
                return bad(&format!("{name} must be finite and positive"));
            }
        }
        for (name, v) in [
            ("survey_sigma_m", self.survey_sigma_m),
            ("orbit_err_m", self.orbit_err_m),
            ("clock_err_m", self.clock_err_m),
            ("noise_m", self.noise_m),
            ("latency_s", self.latency_s),
            ("t_span_s", self.t_span_s),
            ("residual_sigma_m", self.residual_sigma_m),
        ] {
            if !(v.is_finite() && v >= 0.0) {
                return bad(&format!("{name} must be finite and not negative"));
            }
        }
        if let Some(s) = self.sise_sigma_m {
            if !(s.is_finite() && s >= 0.0) {
                return bad("sise_sigma_m must be finite and not negative");
            }
        }
        if !(0.0..=1.0).contains(&self.sise_orbit_variance_fraction) {
            return bad("sise_orbit_variance_fraction must be 0 to 1");
        }
        if !(self.percentile > 0.0 && self.percentile <= 100.0) {
            return bad("percentile must be above 0 and at most 100");
        }
        if !(-90.0..=90.0).contains(&self.mask_deg) {
            return bad("mask_deg must be -90 to 90");
        }
        if self.n_trials == 0 {
            return bad("n_trials must be at least 1");
        }
        if !(-90.0..=90.0).contains(&self.station_lat_deg) || !self.station_height_m.is_finite() {
            return bad("the station must be a finite selenographic position");
        }
        if !self.t_start_s.is_finite() {
            return bad("t_start_s must be finite");
        }
        match &self.points {
            Some(p) if p.is_empty() => {
                return bad("points, when given, must name at least one point")
            }
            Some(p) => {
                if p.iter()
                    .any(|u| !(-90.0..=90.0).contains(&u.lat_deg) || !u.lon_deg.is_finite())
                {
                    return bad("every point needs a latitude of -90 to 90 and a finite longitude");
                }
            }
            None => {
                if south_polar_ring_grid(self.grid_lat_max_deg, self.grid_lat_step_deg).len() < 2 {
                    return bad(
                        "the grid needs grid_lat_max_deg in (-90, 0] and a positive grid_lat_step_deg",
                    );
                }
            }
        }
        if let Some(t) = &self.terrain {
            t.validate().map_err(|e| format!("{KIND}: {e}"))?;
        }
        let work =
            self.user_points().len() as f64 * self.epochs().len() as f64 * self.n_trials as f64;
        if work > MAX_WORK {
            return bad(&format!(
                "n_points x n_epochs x n_trials = {work:.0} exceeds {MAX_WORK:.0}; lower n_trials, \
                 coarsen grid_lat_step_deg (or list fewer points), or raise t_step_s / shorten \
                 t_span_s"
            ));
        }
        Ok(())
    }

    fn keplerian(&self) -> LunarConstellation {
        // The same layout as `lunar-differential-pnt`'s builder.
        let sma_m = self.sma_km * 1000.0;
        let n = self.n_sats;
        LunarConstellation::new(
            (0..n)
                .map(|k| LunarSat {
                    sma_m,
                    eccentricity: self.eccentricity,
                    inc_deg: self.inc_deg,
                    raan_deg: 360.0 * (k as f64) / (n as f64),
                    argp_deg: self.argp_deg,
                    mean_anom_deg: 360.0 * (k as f64) / (n as f64),
                })
                .collect(),
        )
    }

    /// The `lunar-differential-pnt` configuration whose correction-link budget this run
    /// reports.
    fn dpnt_for_budget(&self, t_s: f64, em: &ErrorModelEcho) -> LunarDpntScenario {
        LunarDpntScenario {
            n_sats: self.n_sats,
            sma_km: self.sma_km,
            eccentricity: self.eccentricity,
            inc_deg: self.inc_deg,
            argp_deg: self.argp_deg,
            ref_lat_deg: self.station_lat_deg,
            ref_lon_deg: self.station_lon_deg,
            orbit_err_m: em.orbit_err_m,
            clock_err_m: em.clock_err_m,
            noise_m: self.noise_m,
            seed: self.seed,
            t_s,
            residual_sigma_m: self.residual_sigma_m,
            p_hmi: self.p_hmi,
            survey_sigma_m: self.survey_sigma_m,
            latency_s: self.latency_s,
            quantization_bits: self.quantization_bits,
            ..LunarDpntScenario::default()
        }
    }

    /// Run the scenario. Reads `ephemeris_path` when given.
    pub fn run(&self) -> Result<LunarStationCoverageReport, String> {
        if let Some(k) = &self.kind {
            if k != KIND {
                return Err(format!("kind must be {KIND}; got {k}"));
            }
        }
        self.validate()?;
        let eph;
        let kep;
        let provider: &dyn PositionsMcmf = match &self.ephemeris_path {
            Some(path) => {
                eph = crate::lunar_ephemeris::LunarEphemeris::load(path)?;
                if let Some(until) = eph.covered_until_s() {
                    let last = self.epochs().last().copied().unwrap_or(0.0) + self.latency_s;
                    if last > until + 1e-6 {
                        return Err(format!(
                            "{KIND}: the ephemeris {path} covers {until} s but the run reaches \
                             {last} s (the last epoch plus latency_s); shorten t_span_s"
                        ));
                    }
                }
                &eph
            }
            None => {
                kep = self.keplerian();
                &kep
            }
        };
        let terrain = self.resolve_terrain()?;
        Ok(self.run_with_terrain(provider, terrain.as_ref()))
    }

    /// The terrain masks of the station and every user point (reads `dem_path`); `None`
    /// without a `[terrain]` section.
    pub fn resolve_terrain(&self) -> Result<Option<ResolvedTerrain>, String> {
        let Some(t) = &self.terrain else {
            return Ok(None);
        };
        let users: Vec<(f64, f64)> = self.user_points().iter().map(|p| (p.0, p.1)).collect();
        t.resolve(
            (self.station_lat_deg, self.station_lon_deg),
            &users,
            self.mask_deg,
        )
        .map(Some)
        .map_err(|e| format!("{KIND}: {e}"))
    }

    #[allow(clippy::too_many_arguments)]
    fn epoch_geometry(
        &self,
        provider: &dyn PositionsMcmf,
        i: usize,
        t: f64,
        em: &ErrorModelEcho,
        station: Vec3,
        mask: f64,
        station_sky: Option<&Skyline>,
    ) -> EpochGeometry {
        let sats = provider.positions_mcmf(t);
        let n = sats.len();
        let station_sees: Vec<bool> = sats
            .iter()
            .map(|&s| sees_at(station_sky, station, s, mask))
            .collect();
        let latency = self.latency_s;
        let ageing_orbit: Vec<f64> = if latency > 0.0 {
            let aged = provider.positions_mcmf(t + latency);
            correction_ageing_orbit_range_sigmas(station, &sats, &aged, em.orbit_err_m)
        } else {
            vec![0.0; n]
        };
        let ageing_clock = correction_ageing_clock_range_sigma_m(latency);
        let step = correction_quantization_step_m(
            em.orbit_err_m.abs() + em.clock_err_m.abs(),
            self.quantization_bits,
        );
        let survey_axis = self.survey_sigma_m / 3.0_f64.sqrt();
        let draws = (0..self.n_trials)
            .map(|k| {
                let (orbit_err, clock_err) = inject_common_mode_errors(
                    trial_seed(self.seed, i, k),
                    n,
                    em.orbit_err_m,
                    em.clock_err_m,
                );
                // One survey error per trial, shared by every epoch of it.
                let assumed = if survey_axis > 0.0 {
                    let mut rng =
                        ChaCha8Rng::seed_from_u64(trial_seed(self.seed, 0, k) ^ SURVEY_SALT);
                    let g = Normal::new(0.0, survey_axis).expect("finite positive sigma");
                    [
                        station[0] + g.sample(&mut rng),
                        station[1] + g.sample(&mut rng),
                        station[2] + g.sample(&mut rng),
                    ]
                } else {
                    station
                };
                let corrections =
                    survey_biased_corrections(station, assumed, &sats, &orbit_err, &clock_err);
                let mut link_err = vec![0.0_f64; n];
                if ageing_clock > 0.0 || ageing_orbit.iter().any(|&s| s > 0.0) || step > 0.0 {
                    let mut rng =
                        ChaCha8Rng::seed_from_u64(trial_seed(self.seed, i, k) ^ LINK_SALT);
                    let unit = Normal::new(0.0, 1.0).expect("unit normal");
                    for (s, e) in link_err.iter_mut().enumerate() {
                        let mut v = 0.0;
                        if ageing_orbit[s] > 0.0 {
                            v += ageing_orbit[s] * unit.sample(&mut rng);
                        }
                        if ageing_clock > 0.0 {
                            v += ageing_clock * unit.sample(&mut rng);
                        }
                        if step > 0.0 {
                            v += step * (rng.gen::<f64>() - 0.5);
                        }
                        *e = v;
                    }
                }
                TrialDraw {
                    assumed,
                    orbit_err,
                    clock_err,
                    corrections,
                    link_err,
                }
            })
            .collect();
        EpochGeometry {
            sats,
            station_sees,
            draws,
        }
    }

    /// One trial at one (point, epoch): the user's raw and corrected range errors over the
    /// satellites it uses and the position errors they give. The single code path behind
    /// both [`Self::run_with`] and [`Self::trace_case`].
    #[allow(clippy::too_many_arguments)]
    fn trial_eval(
        &self,
        j: usize,
        i: usize,
        k: usize,
        user: Vec3,
        up: Vec3,
        station: Vec3,
        sats: &[Vec3],
        used: &[usize],
        d: &TrialDraw,
    ) -> TrialEval {
        let orbit: Vec<Vec3> = used.iter().map(|&s| d.orbit_err[s]).collect();
        let clock: Vec<f64> = used.iter().map(|&s| d.clock_err[s]).collect();
        let corr: Vec<f64> = used.iter().map(|&s| d.corrections[s]).collect();
        let raw = raw_user_range_errors(user, sats, &orbit, &clock);
        let mut cre = corrected_user_range_errors(user, station, sats, &orbit, &clock, &corr);
        let (mut noise_a, mut noise_b) = (Vec::new(), Vec::new());
        if self.noise_m > 0.0 {
            // The user-minus-station receiver noise survives the difference, drawn as
            // `lunar-differential-pnt` draws it.
            let mut rng = ChaCha8Rng::seed_from_u64(noise_seed(self.seed, i, k, j));
            let gn = Normal::new(0.0, self.noise_m).expect("finite positive sigma");
            for e in cre.iter_mut() {
                let (a, b) = (gn.sample(&mut rng), gn.sample(&mut rng));
                *e = *e + a - b;
                noise_a.push(a);
                noise_b.push(b);
            }
        }
        for (e, &s) in cre.iter_mut().zip(used) {
            if d.link_err[s] != 0.0 {
                *e -= d.link_err[s];
            }
        }
        let dc = position_error_vector_from_range_errors(user, sats, &cre);
        let du = position_error_vector_from_range_errors(user, sats, &raw);
        let (mut e3, mut h, mut v, mut u3) = (None, None, None, None);
        if let (Some(dc), Some(du)) = (dc, du) {
            let m = (dc[0] * dc[0] + dc[1] * dc[1] + dc[2] * dc[2]).sqrt();
            let vert = dot(dc, up);
            e3 = Some(m);
            h = Some((m * m - vert * vert).max(0.0).sqrt());
            v = Some(vert.abs());
            u3 = Some((du[0] * du[0] + du[1] * du[1] + du[2] * du[2]).sqrt());
        }
        TrialEval {
            corrections_m: corr,
            noise_a_m: noise_a,
            noise_b_m: noise_b,
            raw_range_m: raw,
            corrected_range_m: cre,
            corrected_vec_m: dc,
            uncorrected_vec_m: du,
            corrected_3d_m: e3,
            corrected_h_m: h,
            corrected_v_m: v,
            uncorrected_3d_m: u3,
        }
    }

    /// Everything that went into, and came out of, trial `k` at point `j` and epoch `i`,
    /// for an independent re-computation of the arithmetic (`examples/gen_lunar_station_ref_inputs.rs`).
    pub fn trace_case(&self, j: usize, i: usize, k: usize) -> Result<CaseTrace, String> {
        self.validate()?;
        let pts = self.user_points();
        let epochs = self.epochs();
        if j >= pts.len() || i >= epochs.len() || k >= self.n_trials {
            return Err(format!("{KIND}: no case ({j}, {i}, {k})"));
        }
        let kep = self.keplerian();
        let eph;
        let provider: &dyn PositionsMcmf = match &self.ephemeris_path {
            Some(path) => {
                eph = crate::lunar_ephemeris::LunarEphemeris::load(path)?;
                &eph
            }
            None => &kep,
        };
        let em = self.error_model();
        let station = self.station_mcmf();
        let mask = self.mask_deg.to_radians();
        let terrain = self.resolve_terrain()?;
        let station_sky = terrain.as_ref().map(|t| &t.station.skyline);
        let user_sky = terrain.as_ref().map(|t| &t.users[j].skyline);
        let g = self.epoch_geometry(provider, i, epochs[i], &em, station, mask, station_sky);
        let user = pts[j].2;
        let up = {
            let n = norm(user);
            [user[0] / n, user[1] / n, user[2] / n]
        };
        let used: Vec<usize> = (0..g.sats.len())
            .filter(|&s| sees_at(user_sky, user, g.sats[s], mask))
            .collect();
        let status = if used.len() < 4 {
            if user_sky.is_some() && flat_count(user, &g.sats, mask) >= 4 {
                "terrain_masked"
            } else {
                "user_lt4"
            }
        } else if used.iter().any(|&s| !g.station_sees[s]) {
            "station_missing_sat"
        } else {
            "available"
        };
        let d = &g.draws[k];
        let eval = (status == "available").then(|| {
            let sats: Vec<Vec3> = used.iter().map(|&s| g.sats[s]).collect();
            self.trial_eval(j, i, k, user, up, station, &sats, &used, d)
        });
        Ok(CaseTrace {
            point_index: j,
            epoch_index: i,
            trial_index: k,
            t_s: epochs[i],
            mask_rad: mask,
            user_mcmf: user,
            station_mcmf: station,
            station_assumed_mcmf: d.assumed,
            sats_mcmf: g.sats.clone(),
            orbit_err_m: d.orbit_err.clone(),
            clock_err_m: d.clock_err.clone(),
            link_err_m: d.link_err.clone(),
            used,
            status,
            eval,
        })
    }

    /// Run against an explicit constellation provider with the flat `mask_deg` at every
    /// site (the `[terrain]` section is read by [`Self::run`]; see
    /// [`Self::run_with_terrain`]).
    pub fn run_with(&self, provider: &dyn PositionsMcmf) -> LunarStationCoverageReport {
        self.run_with_terrain(provider, None)
    }

    /// Run against an explicit constellation provider and resolved terrain masks
    /// ([`Self::resolve_terrain`]); `None` is the flat mask at every site.
    pub fn run_with_terrain(
        &self,
        provider: &dyn PositionsMcmf,
        terrain: Option<&ResolvedTerrain>,
    ) -> LunarStationCoverageReport {
        let em = self.error_model();
        let station = self.station_mcmf();
        let mask = self.mask_deg.to_radians();
        let epochs = self.epochs();
        let pts = self.user_points();
        let budget = crate::raim::IntegrityBudget {
            p_hmi_vert: self.p_hmi,
            p_hmi_horz: self.p_hmi,
            p_fa: 1e-5,
        };
        let geo: Vec<EpochGeometry> = epochs
            .iter()
            .enumerate()
            .map(|(i, &t)| {
                self.epoch_geometry(
                    provider,
                    i,
                    t,
                    &em,
                    station,
                    mask,
                    terrain.map(|r| &r.station.skyline),
                )
            })
            .collect();
        let n_sats = geo.first().map(|g| g.sats.len()).unwrap_or(0);
        let n_ep = epochs.len();
        let p = self.percentile;

        let mut points = Vec::with_capacity(pts.len());
        for (j, &(lat, lon, user, weight)) in pts.iter().enumerate() {
            let user_sky = terrain.map(|r| &r.users[j].skyline);
            let up = {
                let n = norm(user);
                [user[0] / n, user[1] / n, user[2] / n]
            };
            let (distance_km, azimuth_deg) =
                distance_bearing(self.station_lat_deg, self.station_lon_deg, lat, lon);
            let mut c3 = Vec::new();
            let mut ch = Vec::new();
            let mut cv = Vec::new();
            let mut u3 = Vec::new();
            let mut hpls = Vec::new();
            let mut vpl_max: Option<f64> = None;
            let mut covered = 0usize;
            let mut below_alert = 0usize;
            let mut unavailable = UnavailableReasons {
                terrain_masked: terrain.map(|_| 0),
                ..UnavailableReasons::default()
            };
            for (i, g) in geo.iter().enumerate() {
                let used: Vec<usize> = (0..g.sats.len())
                    .filter(|&s| sees_at(user_sky, user, g.sats[s], mask))
                    .collect();
                if used.len() < 4 {
                    match unavailable.terrain_masked.as_mut() {
                        Some(n) if flat_count(user, &g.sats, mask) >= 4 => *n += 1,
                        _ => unavailable.user_lt4 += 1,
                    }
                    continue;
                }
                if used.iter().any(|&s| !g.station_sees[s]) {
                    unavailable.station_missing_sat += 1;
                    continue;
                }
                let sats: Vec<Vec3> = used.iter().map(|&s| g.sats[s]).collect();
                if let Some(pl) =
                    lunar_dgnss_protection_level(user, &sats, self.residual_sigma_m, budget)
                {
                    hpls.push(pl.hpl_m);
                    vpl_max = Some(vpl_max.map_or(pl.vpl_m, |v: f64| v.max(pl.vpl_m)));
                    if pl.hpl_m < self.alert_limit_m {
                        below_alert += 1;
                    }
                }
                let mut epoch_c3 = Vec::with_capacity(self.n_trials);
                for (k, d) in g.draws.iter().enumerate() {
                    let ev = self.trial_eval(j, i, k, user, up, station, &sats, &used, d);
                    let (Some(e3), Some(h), Some(v), Some(u)) = (
                        ev.corrected_3d_m,
                        ev.corrected_h_m,
                        ev.corrected_v_m,
                        ev.uncorrected_3d_m,
                    ) else {
                        continue;
                    };
                    c3.push(e3);
                    ch.push(h);
                    cv.push(v);
                    u3.push(u);
                    epoch_c3.push(e3);
                }
                if !epoch_c3.is_empty()
                    && percentile_linear(&sorted(epoch_c3), p) <= self.accuracy_threshold_m
                {
                    covered += 1;
                }
            }
            let pct = |v: Vec<f64>| (!v.is_empty()).then(|| percentile_linear(&sorted(v), p));
            let available = n_ep
                - unavailable.user_lt4
                - unavailable.station_missing_sat
                - unavailable.terrain_masked.unwrap_or(0);
            let hpl_sorted = sorted(hpls);
            points.push(PointFigures {
                lat_deg: lat,
                lon_deg: lon,
                distance_km,
                azimuth_deg,
                area_weight: weight,
                availability: available as f64 / n_ep as f64,
                coverage_fraction: covered as f64 / n_ep as f64,
                corrected_p_3d_m: pct(c3),
                corrected_p_h_m: pct(ch),
                corrected_p_v_m: pct(cv),
                uncorrected_p_3d_m: pct(u3),
                hpl_median_m: (!hpl_sorted.is_empty())
                    .then(|| percentile_linear(&hpl_sorted, 50.0)),
                hpl_max_m: hpl_sorted.last().copied(),
                vpl_max_m: vpl_max,
                hpl_below_alert_fraction: below_alert as f64 / n_ep as f64,
                unavailable,
                horizon_max_deg: terrain.map(|r| r.users[j].echo.horizon_max_deg),
                sky_open_fraction: terrain.map(|r| r.users[j].echo.sky_open_fraction),
            });
        }

        let region = region_figures(&points);
        let coverage_radius_km = coverage_radius(&points);
        let t0 = epochs[0];
        let budget_at = |sky: Option<&Skyline>, user: Vec3| -> Option<CorrectionLinkBudget> {
            let g = &geo[0];
            let idx: Vec<usize> = (0..g.sats.len())
                .filter(|&s| sees_at(sky, user, g.sats[s], mask))
                .collect();
            if idx.len() < 4 {
                return None;
            }
            let sats: Vec<Vec3> = idx.iter().map(|&s| g.sats[s]).collect();
            let sub = Subset {
                inner: provider,
                idx,
            };
            Some(
                self.dpnt_for_budget(t0, &em)
                    .correction_link_budget(user, station, &sats, &sub),
            )
        };
        let budget_pair = BudgetPair {
            epoch_s: t0,
            station: budget_at(terrain.map(|r| &r.station.skyline), station),
            worst_point: region.worst_point.and_then(|w| {
                pts.iter()
                    .position(|p| p.0 == w.lat_deg && p.1 == w.lon_deg)
                    .and_then(|j| budget_at(terrain.map(|r| &r.users[j].skyline), pts[j].2))
            }),
        };
        let terrain_report = terrain.map(|r| {
            let wsum: f64 = points.iter().map(|p| p.area_weight).sum();
            let wmean = |f: &dyn Fn(usize) -> f64| -> f64 {
                points
                    .iter()
                    .enumerate()
                    .map(|(j, p)| f(j) * p.area_weight)
                    .sum::<f64>()
                    / wsum
            };
            TerrainReport {
                label: "MODELLED",
                dem: r.dem.clone(),
                station: r.station.echo.clone(),
                user_sources: r
                    .users
                    .first()
                    .map(|u| u.echo.sources.clone())
                    .unwrap_or_default(),
                user_horizon_max_deg_mean: wmean(&|j| r.users[j].echo.horizon_max_deg),
                user_horizon_max_deg_max: r
                    .users
                    .iter()
                    .map(|u| u.echo.horizon_max_deg)
                    .fold(f64::NEG_INFINITY, f64::max),
                user_sky_open_fraction_mean: wmean(&|j| r.users[j].echo.sky_open_fraction),
                note: crate::lunar_terrain::NOTE,
            }
        });

        LunarStationCoverageReport {
            kind: KIND,
            label: "MODELLED",
            inputs_echo: self.clone(),
            error_model: em,
            n_sats,
            n_grid_points: points.len(),
            n_epochs: n_ep,
            n_trials: self.n_trials,
            percentile: p,
            moon_radius_m: R_MOON_M,
            region,
            coverage_radius_km,
            points,
            budget_at_station_and_at_edge: budget_pair,
            note: if terrain_report.is_some() {
                NOTE_TERRAIN
            } else {
                NOTE
            },
            terrain: terrain_report,
        }
    }
}

fn region_figures(points: &[PointFigures]) -> RegionFigures {
    let all = |f: &dyn Fn(&PointFigures) -> f64| -> f64 {
        weighted_mean(
            &points
                .iter()
                .map(|p| (f(p), p.area_weight))
                .collect::<Vec<_>>(),
        )
        .unwrap_or(0.0)
    };
    let some = |f: &dyn Fn(&PointFigures) -> Option<f64>| -> Option<f64> {
        weighted_mean(
            &points
                .iter()
                .filter_map(|p| f(p).map(|v| (v, p.area_weight)))
                .collect::<Vec<_>>(),
        )
    };
    let corrected = some(&|p| p.corrected_p_3d_m);
    let uncorrected = some(&|p| p.uncorrected_p_3d_m);
    let max_of = |f: &dyn Fn(&PointFigures) -> Option<f64>| {
        points
            .iter()
            .filter_map(f)
            .fold(None, |m: Option<f64>, v| Some(m.map_or(v, |m| m.max(v))))
    };
    let worst_point = points
        .iter()
        .filter_map(|p| p.corrected_p_3d_m.map(|v| (p, v)))
        .fold(None, |w: Option<(&PointFigures, f64)>, (p, v)| match w {
            Some((_, wv)) if wv >= v => w,
            _ => Some((p, v)),
        })
        .map(|(p, v)| WorstPoint {
            lat_deg: p.lat_deg,
            lon_deg: p.lon_deg,
            corrected_p_3d_m: v,
        });
    RegionFigures {
        availability: all(&|p| p.availability),
        coverage_fraction: all(&|p| p.coverage_fraction),
        corrected_p_3d_m: corrected,
        corrected_p_h_m: some(&|p| p.corrected_p_h_m),
        corrected_p_v_m: some(&|p| p.corrected_p_v_m),
        uncorrected_p_3d_m: uncorrected,
        improvement_factor: match (uncorrected, corrected) {
            (Some(u), Some(c)) if c > 0.0 => Some(u / c),
            _ => None,
        },
        hpl_max_m: max_of(&|p| p.hpl_max_m),
        vpl_max_m: max_of(&|p| p.vpl_max_m),
        hpl_below_alert_fraction: all(&|p| p.hpl_below_alert_fraction),
        worst_point,
    }
}

fn coverage_radius(points: &[PointFigures]) -> Vec<AzimuthRadius> {
    (0..12)
        .map(|b| {
            let centre = 30.0 * b as f64;
            let mut sector: Vec<&PointFigures> = points
                .iter()
                .filter(|p| {
                    // The station's own point (distance 0) opens every sector.
                    p.distance_km == 0.0 || ((p.azimuth_deg / 30.0).round() as usize) % 12 == b
                })
                .collect();
            sector.sort_by(|a, b| a.distance_km.total_cmp(&b.distance_km));
            let n_points = sector.iter().filter(|p| p.distance_km > 0.0).count();
            if n_points == 0 {
                return AzimuthRadius {
                    azimuth_deg: centre,
                    radius_km: None,
                    limited_by_grid: false,
                    n_points,
                };
            }
            let mut radius = 0.0;
            let mut limited = true;
            for p in sector {
                if p.coverage_fraction >= RADIUS_COVERAGE {
                    radius = p.distance_km;
                } else {
                    limited = false;
                    break;
                }
            }
            AzimuthRadius {
                azimuth_deg: centre,
                radius_km: Some(radius),
                limited_by_grid: limited,
                n_points,
            }
        })
        .collect()
}

/// Units and provenance for every numeric field of the result document.
pub const UNITS: &[crate::field_schema::FieldUnit] = {
    use crate::field_schema::{FieldUnit, ProvenanceClass::*};
    macro_rules! u {
        ($path:expr, $unit:expr, $prov:expr, $def:expr) => {
            FieldUnit {
                path: $path,
                unit: $unit,
                provenance: $prov,
                definition: $def,
            }
        };
    }
    &[
        u!("inputs_echo.n_sats", "count", Input, "satellites in the illustrative constellation (ignored with ephemeris_path)"),
        u!("inputs_echo.sma_km", "km", Input, "semi-major axis of the illustrative constellation"),
        u!("inputs_echo.eccentricity", "1", Input, "eccentricity of the illustrative constellation"),
        u!("inputs_echo.inc_deg", "deg", Input, "inclination of the illustrative constellation"),
        u!("inputs_echo.argp_deg", "deg", Input, "argument of perilune of the illustrative constellation"),
        u!("inputs_echo.mask_deg", "deg", Input, "elevation mask at the user and at the station"),
        u!("inputs_echo.station_lat_deg", "deg", Input, "station selenographic latitude"),
        u!("inputs_echo.station_lon_deg", "deg", Input, "station selenographic longitude"),
        u!("inputs_echo.station_height_m", "m", Input, "station height above the mean lunar sphere"),
        u!("inputs_echo.survey_sigma_m", "m", Input, "station 3-D coordinate 1-sigma, isotropic, drawn once per trial"),
        u!("inputs_echo.orbit_err_m", "m", Input, "common-mode orbit-error magnitude per satellite (ignored with sise_sigma_m)"),
        u!("inputs_echo.clock_err_m", "m", Input, "common-mode clock-error magnitude per satellite (ignored with sise_sigma_m)"),
        u!("inputs_echo.sise_sigma_m", "m", Input, "line-of-sight signal-in-space error 1-sigma, split into orbit and clock magnitudes"),
        u!("inputs_echo.sise_orbit_variance_fraction", "1", Input, "orbit share of the SISE variance (fraction)"),
        u!("inputs_echo.noise_m", "m", Input, "per-receiver measurement-noise 1-sigma at the user and at the station"),
        u!("inputs_echo.latency_s", "s", Input, "age of a correction when applied"),
        u!("inputs_echo.quantization_bits", "bit", Input, "bits per transmitted correction; 0 disables quantization"),
        u!("inputs_echo.grid_lat_max_deg", "deg", Input, "outer latitude of the ring grid"),
        u!("inputs_echo.grid_lat_step_deg", "deg", Input, "ring spacing of the grid"),
        u!("inputs_echo.points[].lat_deg", "deg", Input, "latitude of a listed user point"),
        u!("inputs_echo.points[].lon_deg", "deg", Input, "longitude of a listed user point"),
        u!("inputs_echo.t_start_s", "s", Input, "first epoch, seconds past the MCI/MCMF-aligned epoch"),
        u!("inputs_echo.t_span_s", "s", Input, "span of the epochs"),
        u!("inputs_echo.t_step_s", "s", Input, "epoch spacing"),
        u!("inputs_echo.n_trials", "count", Input, "Monte Carlo trials per epoch"),
        u!("inputs_echo.accuracy_threshold_m", "m", Input, "coverage threshold on the percentile 3-D error, stated before the run"),
        u!("inputs_echo.percentile", "1", Input, "the percentile reported, in percent (0 to 100)"),
        u!("inputs_echo.alert_limit_m", "m", Input, "horizontal alert limit; ILLUSTRATIVE, no public value exists"),
        u!("inputs_echo.residual_sigma_m", "m", Input, "differential residual 1-sigma the protection levels scale with"),
        u!("inputs_echo.p_hmi", "1", Input, "integrity-risk budget, a probability (interface parity; DO-229E K-factors are fixed)"),
        u!("inputs_echo.seed", "1", Input, "seed of every draw (an integer label)"),
        u!("error_model.orbit_err_m", "m", Computed, "orbit-error magnitude injected per satellite, after any SISE split"),
        u!("error_model.clock_err_m", "m", Computed, "clock-error magnitude injected per satellite, after any SISE split"),
        u!("error_model.los_sise_sigma_m", "m", ClosedForm, "sqrt(orbit_err_m^2 / 3 + clock_err_m^2), the line-of-sight SISE 1-sigma"),
        u!("n_sats", "count", Computed, "satellites in the constellation the run used"),
        u!("n_grid_points", "count", Computed, "user points swept"),
        u!("n_epochs", "count", Computed, "epochs swept"),
        u!("n_trials", "count", Input, "Monte Carlo trials per epoch"),
        u!("percentile", "1", Input, "the percentile reported, in percent (0 to 100)"),
        u!("moon_radius_m", "m", Constant, "the mean lunar radius the great-circle distances use"),
        u!("region.availability", "1", Computed, "area-weighted mean over the points of the share of epochs available"),
        u!("region.coverage_fraction", "1", Computed, "area-weighted mean over the points of the share of epochs whose percentile 3-D error is at most accuracy_threshold_m"),
        u!("region.corrected_p_3d_m", "m", Computed, "area-weighted mean over the points with samples of each point's percentile corrected 3-D error"),
        u!("region.corrected_p_h_m", "m", Computed, "the same, horizontal"),
        u!("region.corrected_p_v_m", "m", Computed, "the same, vertical"),
        u!("region.uncorrected_p_3d_m", "m", Computed, "the same, uncorrected 3-D"),
        u!("region.improvement_factor", "1", Computed, "region uncorrected_p_3d_m / corrected_p_3d_m (ratio)"),
        u!("region.hpl_max_m", "m", Computed, "largest DO-229E HPL over every point and epoch"),
        u!("region.vpl_max_m", "m", Computed, "largest DO-229E VPL over every point and epoch"),
        u!("region.hpl_below_alert_fraction", "1", Computed, "area-weighted mean of the share of epochs with an HPL below alert_limit_m"),
        u!("region.worst_point.lat_deg", "deg", Computed, "latitude of the point with the largest percentile corrected 3-D error"),
        u!("region.worst_point.lon_deg", "deg", Computed, "longitude of that point"),
        u!("region.worst_point.corrected_p_3d_m", "m", Computed, "its percentile corrected 3-D error"),
        u!("coverage_radius_km[].azimuth_deg", "deg", Computed, "centre of a 30-degree azimuth sector from the station"),
        u!("coverage_radius_km[].radius_km", "km", Computed, "distance walked outward from the station before the first point of the sector below 95 % coverage"),
        u!("coverage_radius_km[].n_points", "count", Computed, "points in the sector"),
        u!("points[].lat_deg", "deg", Computed, "user point latitude"),
        u!("points[].lon_deg", "deg", Computed, "user point longitude"),
        u!("points[].distance_km", "km", Computed, "great-circle distance from the station on the mean lunar sphere"),
        u!("points[].azimuth_deg", "deg", Computed, "initial bearing from the station, clockwise from north"),
        u!("points[].area_weight", "sr", Computed, "weight of the point in the region means: its grid cell's solid angle, or 1 for a listed point"),
        u!("points[].availability", "1", Computed, "share of epochs not marked unavailable"),
        u!("points[].coverage_fraction", "1", Computed, "share of all epochs whose percentile over the trials of the corrected 3-D error is at most accuracy_threshold_m"),
        u!("points[].corrected_p_3d_m", "m", Computed, "percentile of the corrected 3-D error over the available (epoch, trial) samples"),
        u!("points[].corrected_p_h_m", "m", Computed, "the same, horizontal"),
        u!("points[].corrected_p_v_m", "m", Computed, "the same, vertical"),
        u!("points[].uncorrected_p_3d_m", "m", Computed, "percentile of the uncorrected 3-D error"),
        u!("points[].hpl_median_m", "m", Computed, "median DO-229E HPL over the epochs with one"),
        u!("points[].hpl_max_m", "m", Computed, "largest DO-229E HPL"),
        u!("points[].vpl_max_m", "m", Computed, "largest DO-229E VPL"),
        u!("points[].hpl_below_alert_fraction", "1", Computed, "share of all epochs with an HPL below alert_limit_m"),
        u!("points[].unavailable.user_lt4", "count", Computed, "epochs with fewer than four satellites above the mask at the point"),
        u!("points[].unavailable.station_missing_sat", "count", Computed, "epochs where a satellite the point uses is below the mask at the station"),
        u!("budget_at_station_and_at_edge.epoch_s", "s", Input, "the representative epoch of the budget: t_start_s"),
        u!("budget_at_station_and_at_edge.*.survey_sigma_m", "m", Input, "station 3-D coordinate 1-sigma"),
        u!("budget_at_station_and_at_edge.*.survey_sigma_per_axis_m", "m", ClosedForm, "survey_sigma_m / sqrt(3)"),
        u!("budget_at_station_and_at_edge.*.survey_range_sigma_m", "m", ClosedForm, "per-satellite 1-sigma of the survey term; correlated across satellites"),
        u!("budget_at_station_and_at_edge.*.survey_transfer", "1", Computed, "3-D position error per metre of per-axis station error, RSS over the three axes (ratio)"),
        u!("budget_at_station_and_at_edge.*.survey_position_sigma_m", "m", Computed, "position-domain 1-sigma of the survey term"),
        u!("budget_at_station_and_at_edge.*.latency_s", "s", Input, "age of a correction when applied"),
        u!("budget_at_station_and_at_edge.*.ageing_clock_time_error_s", "s", Spec, "sigma_y(tau) tau of the ageing clock's power law"),
        u!("budget_at_station_and_at_edge.*.ageing_orbit_rate_m_per_s", "m/s", Computed, "RMS orbit-ageing range-error growth rate from the propagator"),
        u!("budget_at_station_and_at_edge.*.latency_orbit_range_sigma_m", "m", Computed, "range-domain 1-sigma, RMS over satellites, of orbit ageing"),
        u!("budget_at_station_and_at_edge.*.latency_clock_range_sigma_m", "m", Spec, "range-domain 1-sigma of clock ageing"),
        u!("budget_at_station_and_at_edge.*.latency_range_sigma_m", "m", Computed, "range-domain 1-sigma of the whole latency term"),
        u!("budget_at_station_and_at_edge.*.latency_orbit_position_sigma_m", "m", Computed, "position-domain 1-sigma of orbit ageing"),
        u!("budget_at_station_and_at_edge.*.latency_clock_position_sigma_m", "m", Computed, "position-domain 1-sigma of clock ageing"),
        u!("budget_at_station_and_at_edge.*.latency_position_sigma_m", "m", Computed, "position-domain 1-sigma of the latency term"),
        u!("budget_at_station_and_at_edge.*.quantization_bits", "bit", Input, "bits per transmitted correction"),
        u!("budget_at_station_and_at_edge.*.quantization_full_scale_m", "m", ClosedForm, "half-range orbit_err_m + clock_err_m"),
        u!("budget_at_station_and_at_edge.*.quantization_step_m", "m", ClosedForm, "2 full_scale / 2^bits"),
        u!("budget_at_station_and_at_edge.*.quantization_range_sigma_m", "m", ClosedForm, "step / sqrt(12)"),
        u!("budget_at_station_and_at_edge.*.quantization_position_sigma_m", "m", Computed, "position-domain 1-sigma of quantization"),
        u!("budget_at_station_and_at_edge.*.pdop", "1", Computed, "user PDOP over the satellites in view at the budget epoch"),
        u!("budget_at_station_and_at_edge.*.total_range_sigma_m", "m", Computed, "RSS of the three range-domain terms"),
        u!("budget_at_station_and_at_edge.*.total_position_sigma_m", "m", Computed, "RSS of the three position-domain terms"),
        u!("budget_at_station_and_at_edge.*.residual_sigma_m", "m", Input, "the differential residual 1-sigma"),
        u!("budget_at_station_and_at_edge.*.total_with_residual_range_sigma_m", "m", Computed, "sqrt(residual_sigma_m^2 + total_range_sigma_m^2)"),
        u!("budget_at_station_and_at_edge.*.protection_level_with_link_m", "m", Computed, "DO-229E HPL at the augmented sigma"),
        u!("budget_at_station_and_at_edge.*.vpl_with_link_m", "m", Computed, "DO-229E VPL at the augmented sigma"),
        u!("budget_at_station_and_at_edge.*.latency_curve[][]", "(s, m)", Computed, "latency_s against total_position_sigma_m"),
    ]
};

/// Colour for a percentile error against the threshold.
fn shade(v: f64, threshold: f64) -> &'static str {
    let r = v / threshold;
    if r <= 0.5 {
        LIME
    } else if r <= 1.0 {
        CYAN
    } else if r <= 2.0 {
        AMBER
    } else {
        CORAL
    }
}

/// Render a [`LunarStationCoverageReport`] as a self-contained SVG: a south-polar
/// stereographic map of the corrected percentile 3-D error per point, with the station,
/// the points above the threshold outlined and the coverage-radius line (the per-azimuth
/// distance to which coverage holds at 95 %), beside a panel of region figures.
pub fn lunar_station_coverage_svg(r: &LunarStationCoverageReport) -> String {
    let (w, h) = (900.0_f64, 560.0_f64);
    let (cx, cy, rad) = (280.0_f64, 300.0_f64, 230.0_f64);
    let s = &r.inputs_echo;
    let thr = s.accuracy_threshold_m;
    // Stereographic radius from the south pole, normalised to the outermost point.
    let stereo = |lat: f64| {
        (std::f64::consts::FRAC_PI_4 + lat.to_radians() / 2.0)
            .tan()
            .abs()
    };
    let r_max = r
        .points
        .iter()
        .map(|p| stereo(p.lat_deg))
        .fold(stereo(s.station_lat_deg), f64::max)
        .max(1e-9);
    let xy = |lat: f64, lon: f64| {
        let q = stereo(lat) / r_max * rad;
        let l = lon.to_radians();
        (cx + q * l.sin(), cy - q * l.cos())
    };
    let mut svg = format!(
        "<svg xmlns=\"http://www.w3.org/2000/svg\" width=\"{w:.0}\" height=\"{h:.0}\" font-family=\"{FONT_SANS}\" font-size=\"12\" fill=\"{INK_2}\">\
         <rect width=\"{w:.0}\" height=\"{h:.0}\" fill=\"{BG}\"/>"
    );
    svg.push_str(&format!(
        "<text x=\"20\" y=\"24\" font-size=\"15\" font-weight=\"bold\" fill=\"{INK}\">Lunar reference station: p{:.0} corrected 3-D error over the south-polar region (MODELLED)</text>",
        r.percentile
    ));
    svg.push_str(&format!(
        "<circle cx=\"{cx:.1}\" cy=\"{cy:.1}\" r=\"{rad:.1}\" fill=\"none\" stroke=\"{AXIS}\"/>"
    ));
    let dot_r = (rad / (r.n_grid_points as f64).sqrt() / 1.6).clamp(2.0, 9.0);
    for p in &r.points {
        let (x, y) = xy(p.lat_deg, p.lon_deg);
        match p.corrected_p_3d_m {
            Some(v) => {
                let stroke = if v > thr {
                    format!(" stroke=\"{INK}\" stroke-width=\"0.8\"")
                } else {
                    String::new()
                };
                svg.push_str(&format!(
                    "<circle cx=\"{x:.1}\" cy=\"{y:.1}\" r=\"{dot_r:.1}\" fill=\"{}\"{stroke}/>",
                    shade(v, thr)
                ));
            }
            None => svg.push_str(&format!(
                "<circle cx=\"{x:.1}\" cy=\"{y:.1}\" r=\"{dot_r:.1}\" fill=\"none\" stroke=\"{INK_3}\"/>"
            )),
        }
    }
    // The coverage-radius line.
    let ring: Vec<(f64, f64)> = r
        .coverage_radius_km
        .iter()
        .filter_map(|a| {
            a.radius_km.map(|d| {
                let (lat, lon) =
                    destination(s.station_lat_deg, s.station_lon_deg, a.azimuth_deg, d);
                xy(lat, lon)
            })
        })
        .collect();
    if ring.len() >= 3 {
        let mut d = String::new();
        for (k, (x, y)) in ring.iter().enumerate() {
            d.push_str(&format!("{}{x:.1},{y:.1}", if k == 0 { "M" } else { " L" }));
        }
        svg.push_str(&format!(
            "<path d=\"{d} Z\" fill=\"none\" stroke=\"{INK}\" stroke-dasharray=\"5 3\" stroke-width=\"1.4\"/>"
        ));
    }
    let (sx, sy) = xy(s.station_lat_deg, s.station_lon_deg);
    svg.push_str(&format!(
        "<rect x=\"{:.1}\" y=\"{:.1}\" width=\"10\" height=\"10\" fill=\"{INK}\" transform=\"rotate(45 {sx:.1} {sy:.1})\"/>",
        sx - 5.0,
        sy - 5.0
    ));
    svg.push_str(&format!(
        "<text x=\"{cx:.1}\" y=\"{:.1}\" text-anchor=\"middle\" font-size=\"10\">0° E</text>",
        cy - rad - 6.0
    ));
    // Side panel.
    let f = |v: Option<f64>, unit: &str| v.map_or("n/a".to_string(), |v| format!("{v:.3} {unit}"));
    let lines = [
        format!(
            "{} points · {} epochs · {} trials",
            r.n_grid_points, r.n_epochs, r.n_trials
        ),
        format!("threshold {thr} m at p{:.0}", r.percentile),
        format!("availability {:.1} %", 100.0 * r.region.availability),
        format!("coverage {:.1} %", 100.0 * r.region.coverage_fraction),
        format!("corrected 3-D {}", f(r.region.corrected_p_3d_m, "m")),
        format!("uncorrected 3-D {}", f(r.region.uncorrected_p_3d_m, "m")),
        format!("HPL max {}", f(r.region.hpl_max_m, "m")),
        format!("SISE (LOS) {:.2} m", r.error_model.los_sise_sigma_m),
        format!(
            "survey {} m · latency {} s · {} bits",
            s.survey_sigma_m, s.latency_s, s.quantization_bits
        ),
    ];
    for (k, l) in lines.iter().enumerate() {
        svg.push_str(&format!(
            "<text x=\"560\" y=\"{:.0}\">{l}</text>",
            80.0 + 22.0 * k as f64
        ));
    }
    for (k, (c, label)) in [
        (LIME, "≤ half the threshold"),
        (CYAN, "≤ threshold"),
        (AMBER, "≤ twice the threshold"),
        (CORAL, "above twice the threshold"),
    ]
    .iter()
    .enumerate()
    {
        let y = 300.0 + 20.0 * k as f64;
        svg.push_str(&format!(
            "<circle cx=\"566\" cy=\"{:.0}\" r=\"6\" fill=\"{c}\"/><text x=\"580\" y=\"{y:.0}\">{label}</text>",
            y - 4.0
        ));
    }
    svg.push_str(&format!(
        "<text x=\"560\" y=\"392\">◆ station · dashed: distance to which coverage holds at 95 %</text>\
         <text x=\"20\" y=\"{:.0}\" font-size=\"10\" fill=\"{INK_3}\">MODELLED under stated assumptions; not a statement about any real system; not affiliated with or endorsed by any agency.</text></svg>",
        h - 14.0
    ));
    svg
}
