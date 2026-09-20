// SPDX-License-Identifier: AGPL-3.0-only
//! **Lunar-native RF jamming** (`kind = "lunar-jamming"`): per-satellite
//! jammer-to-signal ratio, effective C/N₀ and loss of lock for a lunar **surface**
//! user under a lunar surface (or raised) jammer, over a Moonlight / LCNS-class
//! lunar-orbit constellation.
//!
//! ## Why this module exists
//!
//! The engine's [`crate::jamming`] pack is Earth-shaped: its scenario type takes a
//! [`crate::walker::WalkerSgp4`] shell, propagates it in TEME, and reduces to ECEF
//! against a WGS-84 geodetic receiver. There is no seam in it for a lunar orbit or a
//! selenographic user, so a lunar link-jamming analysis could only be assembled *outside*
//! the engine: run the `link-budget` pack once for the jammer→user leg, run it a second
//! time for the satellite→user leg, and subtract the two received powers **by hand in a
//! manuscript**. Hand arithmetic over two runs is not a reproducible result — it cannot be
//! regenerated, diffed, or unit-tested, and it collapses the per-satellite structure into
//! whatever single number the author chose to quote.
//!
//! This module closes that gap. It **composes** the already-public jamming physics with the
//! already-public lunar sky geometry; it re-derives neither:
//!
//! * [`crate::jamming::j_over_s_db`] — the J/S link equation.
//! * [`crate::jamming::effective_cn0_dbhz`] — the anti-jam equation
//!   `(C/N₀)_eff = [1/(C/N₀) + (J/S)/(Q·R_c)]⁻¹` (Kaplan & Hegarty §9.4).
//! * [`crate::jamming::rx_antenna_gain_db`] — the receive-antenna elevation pattern.
//! * [`crate::jamming::lock_status`] — the tracking-threshold classification.
//! * [`crate::jamming::q_factor`], [`crate::jamming::nominal_cn0_dbhz`],
//!   [`crate::jamming::free_space_path_loss_db`] — the rest of the same chain.
//! * [`crate::lunar_service::LunarConstellation`] and
//!   [`crate::lunar_service::topocentric`] — the lunar sky geometry (MCI → MCMF, then
//!   azimuth / elevation / slant range from a selenographic surface user). No geometry is
//!   duplicated here.
//! * [`crate::lunar::selenographic_to_mcmf`] — the user and jammer placement.
//!
//! ## The composition, stated as an identity
//!
//! The two-`link-budget` recipe a manuscript had to run by hand is, for one satellite:
//!
//! ```text
//!   P_J = P_tx + G_tx − FSPL(d_J, f) + G_rx(el_J)      (link-budget run 1: jammer → user)
//!   P_S = EIRP_sat    − FSPL(d_S, f) + G_rx(el_S)      (link-budget run 2: satellite → user)
//!   J/S = P_J − P_S                                     (the manuscript subtraction)
//! ```
//!
//! and [`crate::jamming::j_over_s_db`] evaluates
//!
//! ```text
//!   (P_tx + G_tx + G_rx(el_J) − FSPL(d_J, f)) − (S_iso + G_rx(el_S))
//! ```
//!
//! so passing `S_iso = EIRP_sat − FSPL(d_S, f)` — the satellite's **isotropic received
//! power**, which is exactly link-budget run 2 with the user gain removed — makes the two
//! expressions the same expression. This module passes precisely that, per satellite, per
//! epoch, and the tests check the identity numerically against
//! [`crate::linkbudget::received_signal_power_dbw`], whose free-space loss is written as a
//! single `20·log₁₀(4πRf/c)` rather than the three-term sum
//! [`crate::jamming::free_space_path_loss_db`] uses — an independent code path for the same
//! quantity.
//!
//! ## What is reported
//!
//! Every visible (epoch, satellite) link is reported as **its own row**: azimuth,
//! elevation, slant range, the two received powers the J/S is the difference of, the J/S
//! itself, the nominal and effective C/N₀, and the lock status. **No median, mean or other
//! central statistic replaces the per-satellite values** — the aggregate figures of merit
//! are reported *alongside* the full table, never instead of it, and the same table is
//! emitted as CSV so the paper-facing artifact is a file the engine writes rather than a
//! transcription.
//!
//! ## The denial contour, and why it carries a band
//!
//! A denial contour drawn from one number is a contour whose position is an assumption.
//! Quote a single median wanted-signal C/N₀ and the contour becomes one curve, one
//! radius, one verdict for a whole constellation whose links differ by several dB — and
//! at a mixed operating point that single verdict is simply wrong for a real share of
//! the rows it replaced (the test
//! `a_single_median_j_over_s_would_misreport_the_outcome_that_the_table_reports`
//! measures exactly that).
//!
//! So [`LunarJammingReport::denial_contour`] emits the measured C/N₀ *distribution*
//! ([`Cn0Distribution`]) and then evaluates the contour at that distribution's own
//! order statistics, under both denial criteria the engine recognises
//! ([`DenialContour`]). The band is the p05 and p95 contours — the same closed-form map
//! applied to two real quantiles — so it is not a sigma, not a fit, and not
//! `median ± k·stdev`; the standard deviation is reported for continuity and is used by
//! nothing. Where a quantile is already below the tracking threshold no finite jammer
//! denies it, and the column is a null with a counted reason rather than an infinity.
//!
//! ## Honest scope
//!
//! The constellation is the **illustrative, public-source LCNS-class** geometry of
//! [`crate::lunar_service`] — not the real Moonlight ephemeris, and no affiliation or
//! endorsement is implied. The interference model inherits every limitation of
//! [`crate::jamming`]: it is a **link budget**. It does not model terrain shadowing of the
//! jammer (which on a cratered airless body is a first-order effect at the south pole),
//! multipath, AGC near/far dynamics, adaptive nulling, or acquisition-versus-tracking
//! hysteresis. The Moon being airless removes atmospheric attenuation from the budget —
//! that part is more, not less, faithful than the terrestrial case. The transmit powers,
//! antenna gains and the receiver noise temperature are representative inputs, not a
//! qualified terminal's design-control table. Deterministic: pure geometry and closed-form
//! radiometry, no random state.

use crate::jamming::{
    effective_cn0_dbhz, free_space_path_loss_db, j_over_s_db, lock_status,
    noise_density_dbw_per_hz, nominal_cn0_dbhz, q_factor, rx_antenna_gain_db, C_M_PER_S,
};
use crate::lunar::{selenographic_to_mcmf, Selenographic, R_MOON_M};
use crate::lunar_service::{topocentric, LunarConstellation, LunarSat};
use serde::{Deserialize, Serialize};

// ---------------------------------------------------------------------------
// Defaults. Every input is optional; the defaults reproduce the lunar baseline
// (an LCNS-class 4-satellite shell seen from the Shackleton rim, S-band AFS link,
// a 10 W broadband surface jammer 10 km away).
// ---------------------------------------------------------------------------

fn d_n_sats() -> usize {
    4
}
/// Semi-major axis (km): `R_moon + 8000 km`, the `moonlight-service-volume` default.
fn d_sma_km() -> f64 {
    (R_MOON_M + 8_000_000.0) / 1000.0
}
fn d_eccentricity() -> f64 {
    0.6
}
fn d_inc_deg() -> f64 {
    57.7
}
fn d_argp_deg() -> f64 {
    90.0
}
/// Shackleton crater rim ([`crate::lunar::SHACKLETON_RIM`]) — the Artemis south-pole
/// target region the LCNS-class geometry is shaped for.
fn d_site_lat_deg() -> f64 {
    crate::lunar::SHACKLETON_RIM.lat_deg
}
fn d_site_lon_deg() -> f64 {
    crate::lunar::SHACKLETON_RIM.lon_deg
}
fn d_horizon_hours() -> f64 {
    12.0
}
fn d_step_min() -> f64 {
    60.0
}
fn d_elev_mask_deg() -> f64 {
    5.0
}
/// Lunar augmented-forward-signal EIRP (dBW) — the P1 / `lunar-attack-surface` value.
fn d_sat_eirp_dbw() -> f64 {
    26.0
}
/// S-band AFS carrier (Hz) — the P1 / `lunar-attack-surface` value.
fn d_carrier_hz() -> f64 {
    2.4e9
}
/// Spreading-code chip rate (chips/s) — the GPS C/A reference rate
/// [`crate::jamming::CA_CHIP_RATE_HZ`], the despreading processing gain.
fn d_chip_rate_hz() -> f64 {
    crate::jamming::CA_CHIP_RATE_HZ
}
/// User-antenna boresight gain (dBi) — the P1 surface-user value. The elevation
/// pattern [`rx_antenna_gain_db`] is *relative* to boresight, so this is added to it.
fn d_user_boresight_gain_dbi() -> f64 {
    3.0
}
fn d_temp_k() -> f64 {
    crate::jamming::DEFAULT_TEMP_K
}
fn d_tracking_threshold_dbhz() -> f64 {
    crate::jamming::DEFAULT_TRACKING_THRESHOLD_DBHZ
}
fn d_degraded_margin_db() -> f64 {
    crate::jamming::DEFAULT_DEGRADED_MARGIN_DB
}
fn d_jammer_power_dbw() -> f64 {
    10.0 // 10 W
}
fn d_jammer_type() -> String {
    "broadband".to_string()
}
fn d_jammer_range_m() -> f64 {
    10_000.0
}

// ---------------------------------------------------------------------------
// Scenario inputs
// ---------------------------------------------------------------------------

/// A jammer seen by the lunar surface user.
///
/// It can be placed **two** ways, and both feed the identical evaluation path:
///
/// * **Selenographically** — set `lat_deg` *and* `lon_deg` (and optionally `alt_m`).
///   The slant range and elevation then come from the same
///   [`crate::lunar_service::topocentric`] geometry the satellites use, so a jammer over
///   the horizon of an airless body gets a genuinely negative elevation.
/// * **Directly** — leave `lat_deg` / `lon_deg` unset and give `range_m` (default 10 km)
///   and `el_deg` (default 0°, on the local horizon). This is the form a standoff sweep
///   wants, and the form the two-`link-budget` recipe states its jammer leg in.
#[derive(Clone, Debug, Deserialize, Serialize)]
pub struct LunarJammerCfg {
    /// Transmit power (dBW; 10 dBW = 10 W). Default 10.0.
    #[serde(default = "d_jammer_power_dbw")]
    pub power_dbw: f64,
    /// Jammer antenna gain toward the user (dBi). Default 0.0.
    #[serde(default)]
    pub gain_dbi: f64,
    /// Selenographic latitude of the jammer (deg). With `lon_deg`, places the jammer
    /// on the Moon and derives its range / elevation geometrically.
    #[serde(default)]
    pub lat_deg: Option<f64>,
    /// Selenographic longitude of the jammer (deg). See `lat_deg`.
    #[serde(default)]
    pub lon_deg: Option<f64>,
    /// Height of the jammer above the mean lunar sphere (m). Default 0.0.
    #[serde(default)]
    pub alt_m: f64,
    /// Direct placement: slant range from the user (m). Used when `lat_deg`/`lon_deg`
    /// are not both given. Default 10 000 m.
    #[serde(default = "d_jammer_range_m")]
    pub range_m: f64,
    /// Direct placement: elevation of the jammer above the user's local horizon (deg).
    /// Default 0.0 — a surface jammer on the horizon. Only the receive-antenna gain
    /// depends on it; the J/S link itself depends on the range.
    #[serde(default)]
    pub el_deg: f64,
    /// `broadband` (default), `narrowband` / `cw`, or `swept` — selects the
    /// spectral-separation coefficient via [`crate::jamming::q_factor`].
    #[serde(default = "d_jammer_type")]
    pub jammer_type: String,
    /// Jammer bandwidth (MHz) — informational, echoed in the report.
    #[serde(default)]
    pub bandwidth_mhz: Option<f64>,
    /// Override the spectral-separation coefficient `Q` (else type-dependent).
    #[serde(default)]
    pub q_override: Option<f64>,
}

impl Default for LunarJammerCfg {
    fn default() -> Self {
        Self {
            power_dbw: d_jammer_power_dbw(),
            gain_dbi: 0.0,
            lat_deg: None,
            lon_deg: None,
            alt_m: 0.0,
            range_m: d_jammer_range_m(),
            el_deg: 0.0,
            jammer_type: d_jammer_type(),
            bandwidth_mhz: None,
            q_override: None,
        }
    }
}

/// The `lunar-jamming` scenario. Every field is optional; a bare `kind` line runs the
/// documented lunar baseline.
#[derive(Clone, Debug, Deserialize)]
pub struct LunarJammingScenario {
    /// Satellites in the illustrative LCNS-class constellation (clamped to 1..=24).
    #[serde(default = "d_n_sats")]
    pub n_sats: usize,
    /// Semi-major axis (km). Default `R_moon + 8000 km`.
    #[serde(default = "d_sma_km")]
    pub sma_km: f64,
    /// Eccentricity. Default 0.6.
    #[serde(default = "d_eccentricity")]
    pub eccentricity: f64,
    /// Inclination (deg). Default 57.7.
    #[serde(default = "d_inc_deg")]
    pub inc_deg: f64,
    /// Argument of perilune (deg). Default 90 (apolune over the south).
    #[serde(default = "d_argp_deg")]
    pub argp_deg: f64,
    /// Selenographic latitude of the surface user (deg). Default: Shackleton rim.
    #[serde(default = "d_site_lat_deg")]
    pub site_lat_deg: f64,
    /// Selenographic longitude of the surface user (deg). Default: Shackleton rim.
    #[serde(default = "d_site_lon_deg")]
    pub site_lon_deg: f64,
    /// Height of the user above the mean lunar sphere (m). Default 0.
    #[serde(default)]
    pub site_alt_m: f64,
    /// Time horizon (hours). Default 12.
    #[serde(default = "d_horizon_hours")]
    pub horizon_hours: f64,
    /// Time step (minutes). Default 60.
    #[serde(default = "d_step_min")]
    pub step_min: f64,
    /// Elevation mask (deg). Default 5.
    #[serde(default = "d_elev_mask_deg")]
    pub elev_mask_deg: f64,
    /// Satellite transmit EIRP (dBW). Default 26 (the P1 AFS value).
    #[serde(default = "d_sat_eirp_dbw")]
    pub sat_eirp_dbw: f64,
    /// Carrier frequency (Hz). Default 2.4e9 (the P1 AFS S-band value).
    #[serde(default = "d_carrier_hz")]
    pub carrier_hz: f64,
    /// Spreading-code chip rate (chips/s). Default 1.023e6 (the C/A reference).
    #[serde(default = "d_chip_rate_hz")]
    pub chip_rate_hz: f64,
    /// User-antenna boresight gain (dBi). Default 3. The elevation roll-off of
    /// [`rx_antenna_gain_db`] is added to this. **J/S is invariant to this value** (it
    /// enters the jammer and the signal leg identically and cancels); it moves the
    /// absolute C/N₀ only.
    #[serde(default = "d_user_boresight_gain_dbi")]
    pub user_boresight_gain_dbi: f64,
    /// Receiver system noise temperature (K). Default 290.
    #[serde(default = "d_temp_k")]
    pub temp_k: f64,
    /// Code-tracking loss threshold (dB-Hz). Default 25.
    #[serde(default = "d_tracking_threshold_dbhz")]
    pub tracking_threshold_dbhz: f64,
    /// Margin (dB) above the loss threshold below which a link reports `DEGRADED`
    /// rather than `LOCKED`. Default 6.
    #[serde(default = "d_degraded_margin_db")]
    pub degraded_margin_db: f64,
    /// The jammer. Absent ⇒ a clean-sky lunar baseline (no J/S is defined, and every
    /// visible satellite is scored at its un-jammed C/N₀).
    #[serde(default)]
    pub jammer: Option<LunarJammerCfg>,
}

impl Default for LunarJammingScenario {
    fn default() -> Self {
        Self {
            n_sats: d_n_sats(),
            sma_km: d_sma_km(),
            eccentricity: d_eccentricity(),
            inc_deg: d_inc_deg(),
            argp_deg: d_argp_deg(),
            site_lat_deg: d_site_lat_deg(),
            site_lon_deg: d_site_lon_deg(),
            site_alt_m: 0.0,
            horizon_hours: d_horizon_hours(),
            step_min: d_step_min(),
            elev_mask_deg: d_elev_mask_deg(),
            sat_eirp_dbw: d_sat_eirp_dbw(),
            carrier_hz: d_carrier_hz(),
            chip_rate_hz: d_chip_rate_hz(),
            user_boresight_gain_dbi: d_user_boresight_gain_dbi(),
            temp_k: d_temp_k(),
            tracking_threshold_dbhz: d_tracking_threshold_dbhz(),
            degraded_margin_db: d_degraded_margin_db(),
            jammer: None,
        }
    }
}

// ---------------------------------------------------------------------------
// Report
// ---------------------------------------------------------------------------

/// One **(epoch, satellite)** link — one row of the per-satellite J/S table. This is the
/// unit the report is built from: there is no median or other collapse of these rows.
#[derive(Clone, Debug, Serialize)]
pub struct LunarJamLink {
    /// Seconds from scenario epoch.
    pub t_s: f64,
    /// Satellite index within the constellation.
    pub sat: usize,
    /// Azimuth from the user, deg clockwise from local north, in `[0, 360)`.
    pub az_deg: f64,
    /// Elevation above the user's local horizon (deg).
    pub el_deg: f64,
    /// Slant range user→satellite (km).
    pub range_km: f64,
    /// Receive-antenna gain toward this satellite (dBi): boresight + elevation pattern.
    pub rx_gain_toward_sat_dbi: f64,
    /// **Link-budget leg 2**, isotropic: `EIRP_sat − FSPL(range, f)` (dBW). The J/S is
    /// formed against this, so the manuscript's second `link-budget` run is printed here
    /// rather than re-run by hand.
    pub signal_rx_isotropic_dbw: f64,
    /// **Link-budget leg 2**, at the antenna output: `signal_rx_isotropic_dbw +
    /// rx_gain_toward_sat_dbi` (dBW).
    pub signal_rx_dbw: f64,
    /// Jammer-to-signal ratio for **this** satellite (dB). `NaN` with no jammer.
    pub js_db: f64,
    /// Un-jammed carrier-to-noise density (dB-Hz).
    pub cn0_nominal_dbhz: f64,
    /// Carrier-to-noise density under the jammer (dB-Hz). Equals the nominal value
    /// with no jammer.
    pub cn0_effective_dbhz: f64,
    /// `LOCKED`, `DEGRADED` or `LOST`.
    pub status: String,
}

/// One epoch's counts. The per-satellite numbers live in [`LunarJammingReport::links`];
/// this block carries only what a count is.
#[derive(Clone, Debug, Serialize)]
pub struct LunarJamEpoch {
    /// Seconds from scenario epoch.
    pub t_s: f64,
    /// Satellites above the elevation mask.
    pub visible: usize,
    /// Visible satellites whose effective C/N₀ holds at or above the tracking
    /// threshold (`LOCKED` or `DEGRADED`, not `LOST`).
    pub tracking: usize,
}

/// The resolved jammer geometry and its received power — **link-budget leg 1**, printed
/// so the difference the J/S is can be checked from the report alone.
#[derive(Clone, Debug, Serialize)]
pub struct LunarJammerGeometry {
    /// Transmit power (dBW).
    pub power_dbw: f64,
    /// Jammer antenna gain toward the user (dBi).
    pub gain_dbi: f64,
    /// Slant range user→jammer (m).
    pub range_m: f64,
    /// Elevation of the jammer above the user's local horizon (deg).
    pub el_deg: f64,
    /// `true` when the range/elevation came from a selenographic placement rather
    /// than from the direct `range_m` / `el_deg` inputs.
    pub placed_selenographically: bool,
    /// Receive-antenna gain toward the jammer (dBi): boresight + elevation pattern.
    pub rx_gain_toward_jammer_dbi: f64,
    /// Free-space path loss on the jammer leg (dB).
    pub fspl_db: f64,
    /// **Link-budget leg 1**: `power_dbw + gain_dbi + rx_gain_toward_jammer_dbi −
    /// fspl_db` (dBW) — the received jammer power at the antenna output.
    pub received_dbw: f64,
    /// Spectral-separation coefficient `Q` actually used.
    pub q: f64,
    /// Jammer type string as supplied.
    pub jammer_type: String,
    /// Jammer bandwidth (MHz), if supplied.
    #[serde(skip_serializing_if = "Option::is_none")]
    pub bandwidth_mhz: Option<f64>,
}

/// Aggregate figures of merit. These sit **beside** the per-satellite table, never in
/// place of it.
#[derive(Clone, Debug, Serialize)]
pub struct LunarJammingFoM {
    /// Fraction of epochs with ≥ 4 satellites still tracking under the jammer.
    pub availability_under_jamming: f64,
    /// Fraction of epochs with ≥ 4 satellites geometrically visible — the clean-sky
    /// ceiling for this geometry.
    pub availability_nominal: f64,
    /// Fewest satellites tracking at any epoch.
    pub min_tracking: usize,
    /// Smallest per-link J/S over the whole table (dB); `NaN` with no jammer.
    pub min_js_db: f64,
    /// Largest per-link J/S over the whole table (dB); `NaN` with no jammer.
    pub max_js_db: f64,
    /// Arithmetic mean J/S over the table (dB); `NaN` with no jammer. Reported for
    /// continuity with the Earth `jamming` pack — the table above is the result.
    pub mean_js_db: f64,
    /// Links in the table (visible (epoch, satellite) pairs).
    pub n_links: usize,
    /// Links reported `LOST`.
    pub n_lost: usize,
}

// ---------------------------------------------------------------------------
// The denial contour and the band the measured C/N₀ spread puts on it
// ---------------------------------------------------------------------------

/// The jammer-to-signal ratio (dB) at which the engine's **incumbent** power-ratio
/// denial criterion fires.
///
/// This is not a new number: it is the same 30 dB
/// [`crate::attack_surface`]`::jam_denial_js_db` sizes its required-transmit-power curve
/// against and [`crate::tracking_loop`]`::denial_js_threshold_db` inverts for its denial
/// radius. It is repeated here as a named constant, rather than added as a scenario
/// input, so that the contour this module reports is the *same* criterion the rest of
/// the engine already publishes; a test pins it against the tracking-loop default so
/// the two cannot drift apart.
pub const DENIAL_JS_THRESHOLD_DB: f64 = 30.0;

/// Quantile levels the denial contour is evaluated at, ordered by increasing quantile
/// (and therefore by non-decreasing C/N₀). `min` and `max` are the sample extremes;
/// `p05`/`p95` are the reported band edges.
const CONTOUR_QUANTILES: &[(&str, f64)] = &[
    ("min", 0.0),
    ("p05", 0.05),
    ("p25", 0.25),
    ("median", 0.50),
    ("p75", 0.75),
    ("p95", 0.95),
    ("max", 1.0),
];

/// Linear-interpolation quantile of an already-sorted, non-empty sample: with `n`
/// values the level `q` sits at position `h = (n−1)·q`, and the result interpolates
/// linearly between the two order statistics that bracket `h`. This is the rule
/// `numpy.quantile` calls `linear` and the statistics literature calls type 7; it is
/// stated here because a quantile without its interpolation rule is not reproducible.
/// `q` outside `[0, 1]` is clamped.
fn quantile_sorted(sorted: &[f64], q: f64) -> f64 {
    let n = sorted.len();
    if n == 1 {
        return sorted[0];
    }
    let h = (n - 1) as f64 * q.clamp(0.0, 1.0);
    let floor = h.floor();
    let i = floor as usize;
    if i + 1 >= n {
        return sorted[n - 1];
    }
    sorted[i] + (h - floor) * (sorted[i + 1] - sorted[i])
}

/// The standoff (m) at which the free-space path loss reaches `fspl_db` at `f_hz` — the
/// exact inverse of [`crate::jamming::free_space_path_loss_db`] in distance, obtained by
/// solving `20·log₁₀(d) + 20·log₁₀(f) + 20·log₁₀(4π/c) = fspl_db` for `d`.
///
/// The forward function clamps its distance to 1 mm; this inverse does not clamp, so a
/// round trip through the pair is exact wherever the forward clamp is not active, and
/// the tests check that on the values this module actually produces.
pub fn range_for_free_space_path_loss_m(fspl_db: f64, f_hz: f64) -> f64 {
    let k = 20.0 * f_hz.log10() + 20.0 * (4.0 * std::f64::consts::PI / C_M_PER_S).log10();
    10f64.powf((fspl_db - k) / 20.0)
}

/// The jammer-to-signal ratio (dB) at which the anti-jam equation takes a link whose
/// un-jammed carrier-to-noise density is `cn0_nominal_dbhz` down to exactly
/// `threshold_dbhz` — the closed-form inverse of
/// [`crate::jamming::effective_cn0_dbhz`] on its `js_db` argument:
///
/// ```text
///   (C/N₀)_eff = [1/(C/N₀) + (J/S)/(Q·R_c)]⁻¹ = threshold
///     ⇒  (J/S) = Q·R_c · ( 10^(−threshold/10) − 10^(−cn0/10) )
/// ```
///
/// Returns `None` when `cn0_nominal_dbhz` is at or below `threshold_dbhz`: such a link
/// is already under the tracking threshold with no jammer at all, so no finite J/S
/// denies it. A `None` is reported as a null with a stated count rather than as an
/// infinity or a clamped radius, because a fabricated contour point at an already-lost
/// link would be the exact failure this task exists to close.
pub fn denial_js_db(
    cn0_nominal_dbhz: f64,
    threshold_dbhz: f64,
    q: f64,
    chip_rate_hz: f64,
) -> Option<f64> {
    // `q.max(1e-9)` mirrors the clamp `effective_cn0_dbhz` applies, so the inverse is
    // the inverse of the function the report's own rows were scored with.
    let arg = (q.max(1e-9) * chip_rate_hz)
        * (10f64.powf(-threshold_dbhz / 10.0) - 10f64.powf(-cn0_nominal_dbhz / 10.0));
    if arg.is_finite() && arg > 0.0 {
        Some(10.0 * arg.log10())
    } else {
        None
    }
}

/// Order statistics of the measured wanted-signal C/N₀ sample — the distribution the
/// denial contour's band is driven by, reported in full rather than collapsed to its
/// median. Every figure is over the same per-link rows
/// ([`LunarJammingReport::links`]) the table already carries.
#[derive(Clone, Copy, Debug, Serialize)]
pub struct Cn0Distribution {
    /// Links in the sample — the whole per-satellite table.
    pub n: usize,
    /// Smallest nominal C/N₀ in the sample (dB-Hz).
    pub min_dbhz: f64,
    /// 5th-percentile nominal C/N₀ (dB-Hz).
    pub p05_dbhz: f64,
    /// 25th-percentile nominal C/N₀ (dB-Hz).
    pub p25_dbhz: f64,
    /// Median nominal C/N₀ (dB-Hz) — the single scalar the contour used to rest on,
    /// kept so the collapse can be compared against the spread beside it.
    pub median_dbhz: f64,
    /// 75th-percentile nominal C/N₀ (dB-Hz).
    pub p75_dbhz: f64,
    /// 95th-percentile nominal C/N₀ (dB-Hz).
    pub p95_dbhz: f64,
    /// Largest nominal C/N₀ in the sample (dB-Hz).
    pub max_dbhz: f64,
    /// Arithmetic mean nominal C/N₀ (dB-Hz).
    pub mean_dbhz: f64,
    /// Sample standard deviation (n−1 divisor) of the nominal C/N₀ (dB); `0.0` for a
    /// single-row sample. Reported for continuity with the rest of the engine, **not**
    /// used to build the band.
    pub stdev_dbhz: f64,
    /// How far the sample is from symmetric about its own median:
    /// `(p95 − median) − (median − p05)`, in dB. Zero for a symmetric sample.
    pub asymmetry_db: f64,
}

impl Cn0Distribution {
    /// Order statistics of an already-sorted, non-empty sample.
    fn from_sorted(sorted: &[f64]) -> Self {
        let n = sorted.len();
        let mean = sorted.iter().sum::<f64>() / n as f64;
        let stdev = if n < 2 {
            0.0
        } else {
            (sorted.iter().map(|x| (x - mean).powi(2)).sum::<f64>() / (n - 1) as f64).sqrt()
        };
        let (p05, med, p95) = (
            quantile_sorted(sorted, 0.05),
            quantile_sorted(sorted, 0.50),
            quantile_sorted(sorted, 0.95),
        );
        Self {
            n,
            min_dbhz: sorted[0],
            p05_dbhz: p05,
            p25_dbhz: quantile_sorted(sorted, 0.25),
            median_dbhz: med,
            p75_dbhz: quantile_sorted(sorted, 0.75),
            p95_dbhz: p95,
            max_dbhz: sorted[n - 1],
            mean_dbhz: mean,
            stdev_dbhz: stdev,
            asymmetry_db: (p95 - med) - (med - p05),
        }
    }
}

/// One point of the denial contour: the contour function evaluated at **one quantile of
/// the measured C/N₀ sample**, under both criteria. Nothing here is fitted — each row is
/// the same closed-form map applied to an order statistic the table actually produced.
#[derive(Clone, Debug, Serialize)]
pub struct DenialContourPoint {
    /// Which order statistic this row is: `min`, `p05`, `p25`, `median`, `p75`, `p95`
    /// or `max`.
    pub label: &'static str,
    /// The quantile level, in `[0, 1]`.
    pub quantile: f64,
    /// The measured nominal C/N₀ at that quantile (dB-Hz) — the contour's argument.
    pub cn0_nominal_dbhz: f64,
    /// **Loss-of-lock criterion.** The J/S (dB) at which the anti-jam equation takes
    /// this C/N₀ down to `tracking_threshold_dbhz`. Null when the C/N₀ is already at or
    /// below the threshold.
    #[serde(skip_serializing_if = "Option::is_none")]
    pub loss_of_lock_js_db: Option<f64>,
    /// **Loss-of-lock criterion.** The jammer EIRP (dBW) that reaches that J/S at the
    /// scenario's own jammer standoff. Null when the criterion has no point here.
    #[serde(skip_serializing_if = "Option::is_none")]
    pub loss_of_lock_eirp_dbw: Option<f64>,
    /// **Loss-of-lock criterion.** The standoff (km) at which the scenario's own jammer
    /// EIRP reaches that J/S — the denial radius for a link of this C/N₀. Null when the
    /// criterion has no point here.
    #[serde(skip_serializing_if = "Option::is_none")]
    pub loss_of_lock_standoff_km: Option<f64>,
    /// **Power-ratio criterion.** The jammer EIRP (dBW) that reaches
    /// [`DENIAL_JS_THRESHOLD_DB`] against this C/N₀ at the scenario's jammer standoff.
    pub power_ratio_eirp_dbw: f64,
    /// **Power-ratio criterion.** The standoff (km) at which the scenario's own jammer
    /// EIRP reaches [`DENIAL_JS_THRESHOLD_DB`] against this C/N₀.
    pub power_ratio_standoff_km: f64,
}

/// The contour and its band under **one** criterion, on both axes of the denial plane:
/// the standoff at the scenario's jammer EIRP, and the jammer EIRP at the scenario's
/// standoff. Every figure is read off [`DenialContour::points`]; nothing is refitted.
#[derive(Clone, Copy, Debug, Serialize)]
pub struct ContourBand {
    /// Denial standoff at the 5th-percentile C/N₀ (km) — the weak-signal band edge.
    pub standoff_p05_km: f64,
    /// Denial standoff at the median C/N₀ (km) — the single-scalar contour.
    pub standoff_median_km: f64,
    /// Denial standoff at the 95th-percentile C/N₀ (km) — the strong-signal band edge.
    pub standoff_p95_km: f64,
    /// Width of the standoff band, `|standoff_p05_km − standoff_p95_km|` (km).
    pub standoff_width_km: f64,
    /// `(standoff_p95_km − standoff_median_km) − (standoff_median_km − standoff_p05_km)`
    /// (km). Zero would mean the band sits symmetrically about the median contour.
    pub standoff_asymmetry_km: f64,
    /// Required jammer EIRP at the 5th-percentile C/N₀ (dBW).
    pub eirp_p05_dbw: f64,
    /// Required jammer EIRP at the median C/N₀ (dBW) — the single-scalar contour.
    pub eirp_median_dbw: f64,
    /// Required jammer EIRP at the 95th-percentile C/N₀ (dBW).
    pub eirp_p95_dbw: f64,
    /// Width of the EIRP band, `|eirp_p95_dbw − eirp_p05_dbw|` (dB).
    pub eirp_width_db: f64,
    /// `(eirp_p95_dbw − eirp_median_dbw) − (eirp_median_dbw − eirp_p05_dbw)` (dB).
    pub eirp_asymmetry_db: f64,
    /// Measured over the emitted points, ordered by increasing C/N₀: `true` when the
    /// denial standoff never increases. Non-strict, because two quantiles of a small
    /// sample can coincide.
    pub standoff_monotone_in_cn0: bool,
    /// Measured over the emitted points, ordered by increasing C/N₀: `true` when the
    /// required jammer EIRP never decreases.
    pub eirp_monotone_in_cn0: bool,
}

impl ContourBand {
    /// Assemble the band from the per-quantile contour values, in the same order as
    /// [`CONTOUR_QUANTILES`]. Returns `None` if any quantile has no contour point.
    fn from_points(standoff_km: &[Option<f64>], eirp_dbw: &[Option<f64>]) -> Option<Self> {
        if standoff_km.iter().any(|x| x.is_none()) || eirp_dbw.iter().any(|x| x.is_none()) {
            return None;
        }
        let s: Vec<f64> = standoff_km.iter().map(|x| x.expect("checked")).collect();
        let e: Vec<f64> = eirp_dbw.iter().map(|x| x.expect("checked")).collect();
        let idx = |label: &str| {
            CONTOUR_QUANTILES
                .iter()
                .position(|(l, _)| *l == label)
                .expect("the quantile grid names p05, median and p95")
        };
        let (i05, imed, i95) = (idx("p05"), idx("median"), idx("p95"));
        Some(Self {
            standoff_p05_km: s[i05],
            standoff_median_km: s[imed],
            standoff_p95_km: s[i95],
            standoff_width_km: (s[i05] - s[i95]).abs(),
            standoff_asymmetry_km: (s[i95] - s[imed]) - (s[imed] - s[i05]),
            eirp_p05_dbw: e[i05],
            eirp_median_dbw: e[imed],
            eirp_p95_dbw: e[i95],
            eirp_width_db: (e[i95] - e[i05]).abs(),
            eirp_asymmetry_db: (e[i95] - e[imed]) - (e[imed] - e[i05]),
            standoff_monotone_in_cn0: s.windows(2).all(|w| w[1] <= w[0]),
            eirp_monotone_in_cn0: e.windows(2).all(|w| w[1] >= w[0]),
        })
    }
}

/// **The denial contour, reported with the uncertainty band the real C/N₀ spread
/// implies** instead of as one scalar read off the median.
///
/// Two criteria are reported, never one in place of the other:
///
/// * **power-ratio** — `J/S ≥ `[`DENIAL_JS_THRESHOLD_DB`], the engine's incumbent
///   criterion ([`crate::attack_surface`], [`crate::tracking_loop`]) and the criterion
///   behind the released lunar link-jamming table's `denial` column;
/// * **loss-of-lock** — the effective C/N₀ falling to `tracking_threshold_dbhz`, which
///   is the criterion this report's own `links[].status` column is scored with.
///
/// The band is **not** a sigma. Each edge is the same closed-form contour map applied to
/// an order statistic of the measured sample, so the band inherits the sample's own
/// shape: [`Cn0Distribution::asymmetry_db`] states that shape, and the band's own
/// asymmetry fields state what the contour did with it.
#[derive(Clone, Debug, Serialize)]
pub struct DenialContour {
    /// The measured wanted-signal C/N₀ distribution the band is driven by.
    pub cn0_nominal: Cn0Distribution,
    /// The power-ratio criterion's J/S threshold (dB) — [`DENIAL_JS_THRESHOLD_DB`].
    pub power_ratio_js_threshold_db: f64,
    /// The jammer EIRP the standoff contour is evaluated at (dBW): the scenario's
    /// `jammer.power_dbw + jammer.gain_dbi`.
    pub jammer_eirp_dbw: f64,
    /// The contour at each quantile of the measured sample, ordered by increasing
    /// quantile.
    pub points: Vec<DenialContourPoint>,
    /// The band under the loss-of-lock criterion. Null when any of p05 / median / p95
    /// sits at or below the tracking threshold, where that criterion has no contour.
    #[serde(skip_serializing_if = "Option::is_none")]
    pub loss_of_lock: Option<ContourBand>,
    /// The band under the power-ratio criterion. Always defined: a power ratio has a
    /// solution at every C/N₀.
    pub power_ratio: ContourBand,
    /// How many of the emitted points have no loss-of-lock contour because their C/N₀
    /// is already at or below the tracking threshold.
    pub n_points_without_loss_of_lock_contour: usize,
    /// The two criteria, in words, so the report is self-describing.
    pub criterion_definition: &'static str,
    /// How the band is built, in words — including what it is *not*.
    pub band_definition: &'static str,
}

const CRITERION_DEFINITION: &str =
    "Two denial criteria, reported side by side. power_ratio: the jammer denies when \
     J/S reaches power_ratio_js_threshold_db (30 dB), the engine's incumbent criterion \
     in attack_surface and tracking_loop. loss_of_lock: the jammer denies when the \
     anti-jam equation jamming::effective_cn0_dbhz takes the link's effective C/N0 down \
     to tracking_threshold_dbhz, which is the criterion this report's own \
     links[].status column is scored with. Each contour point is the closed-form \
     inverse of those same functions, evaluated at one order statistic of the measured \
     cn0_nominal_dbhz sample; the standoff column inverts \
     jamming::free_space_path_loss_db at the scenario's own jammer EIRP, holding the \
     receive-antenna gain toward the jammer fixed at its resolved value (the same \
     convention tracking_loop::DenialLink uses when it bisects a denial radius).";

const BAND_DEFINITION: &str =
    "The band is the measured distribution pushed through the SAME contour map, \
     evaluated at the distribution's own quantiles: the p05 and p95 edges are \
     contour(p05_dbhz) and contour(p95_dbhz), not median +/- k*stdev and not a sigma \
     fitted to the sample. stdev_dbhz is reported for continuity and is not used to \
     build any edge. Because the map is applied to order statistics, the band carries \
     the sample's own shape: cn0_nominal.asymmetry_db states how far the sample is from \
     symmetric, and the *_asymmetry_* fields state what the contour did with it - a \
     band symmetric about the median contour would have to come from a symmetric sample \
     AND a locally linear contour, and the power-ratio EIRP contour is the only one of \
     the four that is exactly linear in C/N0.";

/// The `lunar-jamming` result.
#[derive(Clone, Debug, Serialize)]
pub struct LunarJammingReport {
    /// Satellites in the constellation actually built.
    pub n_sats: usize,
    /// Epochs evaluated.
    pub n_epochs: usize,
    /// Selenographic latitude of the user (deg).
    pub site_lat_deg: f64,
    /// Selenographic longitude of the user (deg).
    pub site_lon_deg: f64,
    /// Elevation mask (deg).
    pub elev_mask_deg: f64,
    /// Carrier frequency (Hz).
    pub carrier_hz: f64,
    /// Satellite EIRP (dBW).
    pub sat_eirp_dbw: f64,
    /// Spreading-code chip rate (chips/s).
    pub chip_rate_hz: f64,
    /// User-antenna boresight gain (dBi).
    pub user_boresight_gain_dbi: f64,
    /// Receiver system noise temperature (K).
    pub temp_k: f64,
    /// Code-tracking loss threshold (dB-Hz).
    pub tracking_threshold_dbhz: f64,
    /// Margin (dB) above the loss threshold below which a link reports `DEGRADED`.
    pub degraded_margin_db: f64,
    /// Whether a jammer was configured.
    pub jammer_present: bool,
    /// The resolved jammer geometry and link-budget leg 1. `None` with no jammer.
    #[serde(skip_serializing_if = "Option::is_none")]
    pub jammer: Option<LunarJammerGeometry>,
    /// Per-epoch visible / tracking counts.
    pub epochs: Vec<LunarJamEpoch>,
    /// **The per-satellite J/S table** — one row per visible (epoch, satellite) link.
    pub links: Vec<LunarJamLink>,
    /// Aggregate figures of merit.
    pub fom: LunarJammingFoM,
    /// Honest scope note.
    pub note: &'static str,
    /// How the J/S is formed, in words, so the report is self-describing.
    pub js_definition: &'static str,
    /// **The denial contour with the band the measured C/N₀ spread puts on it.**
    /// Appended at the end of the struct on purpose: every pre-existing key keeps its
    /// value byte-for-byte and nothing above it moves. `None` with no jammer — with no
    /// interfering signal there is no J/S and no contour to draw.
    #[serde(skip_serializing_if = "Option::is_none")]
    pub denial_contour: Option<DenialContour>,
}

const NOTE: &str = "MODELLED. Illustrative, public-source LCNS-class lunar constellation \
                    (not the real Moonlight/LCNS ephemeris; no affiliation or endorsement \
                    implied) combined with the link-budget interference model of \
                    crate::jamming. No terrain shadowing of the jammer, no multipath, no \
                    AGC near/far dynamics, no adaptive nulling, no acquisition-vs-tracking \
                    hysteresis. Transmit powers, antenna gains and noise temperature are \
                    representative inputs, not a qualified terminal design-control table.";

const JS_DEFINITION: &str = "js_db = (power_dbw + gain_dbi + rx_gain_toward_jammer_dbi - fspl_db) \
     - (signal_rx_isotropic_dbw + rx_gain_toward_sat_dbi), i.e. the received jammer \
     power minus the received signal power - the difference of the two link budgets \
     the engine now runs internally, per satellite, instead of a manuscript running \
     the link-budget scenario twice and subtracting by hand.";

// ---------------------------------------------------------------------------
// Evaluation
// ---------------------------------------------------------------------------

impl LunarJammingScenario {
    /// The epoch grid (seconds from epoch): `0, step, 2·step, …` strictly inside the
    /// horizon. Always at least one epoch.
    fn times(&self) -> Vec<f64> {
        let horizon_s = self.horizon_hours.abs() * 3600.0;
        let step_s = if self.step_min.abs() < 1e-9 {
            3600.0
        } else {
            self.step_min.abs() * 60.0
        };
        let n = (((horizon_s - 1e-6) / step_s).ceil().max(0.0) as usize).saturating_add(2);
        let mut ts = Vec::new();
        let mut t = 0.0;
        for _ in 0..n {
            if t >= horizon_s - 1e-6 {
                break;
            }
            ts.push(t);
            t += step_s;
        }
        if ts.is_empty() {
            ts.push(0.0);
        }
        ts
    }

    /// The user's selenographic position.
    fn site(&self) -> Selenographic {
        Selenographic {
            lat_rad: self.site_lat_deg.to_radians(),
            lon_rad: self.site_lon_deg.to_radians(),
            alt_m: self.site_alt_m,
        }
    }

    /// The illustrative constellation, phased evenly in RAAN and mean anomaly — the same
    /// construction [`crate::lunar_service::LunarServiceScenario`] uses, so the two
    /// scenarios see the same sky for the same inputs.
    fn constellation(&self) -> LunarConstellation {
        let n = self.n_sats.clamp(1, 24);
        LunarConstellation::new(
            (0..n)
                .map(|k| LunarSat {
                    sma_m: self.sma_km * 1000.0,
                    eccentricity: self.eccentricity,
                    inc_deg: self.inc_deg,
                    raan_deg: 360.0 * (k as f64) / (n as f64),
                    argp_deg: self.argp_deg,
                    mean_anom_deg: 360.0 * (k as f64) / (n as f64),
                })
                .collect(),
        )
    }

    /// Receive-antenna gain (dBi) toward a direction at elevation `el_deg`: the
    /// boresight gain plus the shared elevation pattern [`rx_antenna_gain_db`].
    fn rx_gain_dbi(&self, el_deg: f64) -> f64 {
        self.user_boresight_gain_dbi + rx_antenna_gain_db(el_deg.to_radians())
    }

    /// Resolve the jammer's range / elevation (either selenographically or directly) and
    /// evaluate link-budget leg 1.
    fn jammer_geometry(&self, j: &LunarJammerCfg) -> LunarJammerGeometry {
        let (range_m, el_deg, placed) = match (j.lat_deg, j.lon_deg) {
            (Some(lat), Some(lon)) => {
                let user = selenographic_to_mcmf(self.site());
                let jam = selenographic_to_mcmf(Selenographic {
                    lat_rad: lat.to_radians(),
                    lon_rad: lon.to_radians(),
                    alt_m: j.alt_m,
                });
                let (_az, el, rng) = topocentric(user, jam);
                (rng, el, true)
            }
            _ => (j.range_m, j.el_deg, false),
        };
        let rx_gain = self.rx_gain_dbi(el_deg);
        let fspl_db = free_space_path_loss_db(range_m, self.carrier_hz);
        LunarJammerGeometry {
            power_dbw: j.power_dbw,
            gain_dbi: j.gain_dbi,
            range_m,
            el_deg,
            placed_selenographically: placed,
            rx_gain_toward_jammer_dbi: rx_gain,
            fspl_db,
            received_dbw: j.power_dbw + j.gain_dbi + rx_gain - fspl_db,
            q: q_factor(&j.jammer_type, j.q_override),
            jammer_type: j.jammer_type.clone(),
            bandwidth_mhz: j.bandwidth_mhz,
        }
    }

    /// Validate the inputs that the physics cannot absorb.
    fn validate(&self) -> Result<(), String> {
        if !self.carrier_hz.is_finite() || self.carrier_hz <= 0.0 {
            return Err("carrier_hz must be finite and positive".to_string());
        }
        if !self.chip_rate_hz.is_finite() || self.chip_rate_hz <= 0.0 {
            return Err("chip_rate_hz must be finite and positive".to_string());
        }
        if !self.temp_k.is_finite() || self.temp_k <= 0.0 {
            return Err("temp_k must be finite and positive".to_string());
        }
        if !self.sma_km.is_finite() || self.sma_km * 1000.0 <= R_MOON_M {
            return Err("sma_km must be finite and above the lunar radius".to_string());
        }
        if !(0.0..1.0).contains(&self.eccentricity) {
            return Err("eccentricity must be in [0, 1)".to_string());
        }
        if let Some(j) = &self.jammer {
            let placed_selenographically = j.lat_deg.is_some() && j.lon_deg.is_some();
            if !placed_selenographically && (!j.range_m.is_finite() || j.range_m <= 0.0) {
                return Err(
                    "jammer.range_m must be finite and positive (or give jammer.lat_deg \
                     and jammer.lon_deg to place the jammer selenographically)"
                        .to_string(),
                );
            }
            if !j.power_dbw.is_finite() {
                return Err("jammer.power_dbw must be finite".to_string());
            }
        }
        Ok(())
    }

    /// Run the scenario: propagate the lunar constellation, and score every visible
    /// satellite's J/S, effective C/N₀ and lock status against the jammer. Deterministic.
    pub fn run(&self) -> Result<LunarJammingReport, String> {
        self.validate()?;
        let site = self.site();
        let user_mcmf = selenographic_to_mcmf(site);
        let con = self.constellation();
        let n_sats = con.n_sats();
        let jam = self.jammer.as_ref().map(|j| self.jammer_geometry(j));

        let times = self.times();
        let mut epochs = Vec::with_capacity(times.len());
        let mut links: Vec<LunarJamLink> = Vec::new();
        let (mut avail_jam, mut avail_nom) = (0usize, 0usize);
        let mut min_tracking = usize::MAX;

        for &t in &times {
            let sats = con.positions_mcmf(t);
            let mut visible = 0usize;
            let mut tracking = 0usize;
            for (sat, &p) in sats.iter().enumerate() {
                let (az_deg, el_deg, range_m) = topocentric(user_mcmf, p);
                if el_deg < self.elev_mask_deg {
                    continue;
                }
                visible += 1;
                let rx_gain_sat = self.rx_gain_dbi(el_deg);
                // Link-budget leg 2, isotropic: EIRP − FSPL(range).
                let sig_iso = self.sat_eirp_dbw - free_space_path_loss_db(range_m, self.carrier_hz);
                let cn0_nom = nominal_cn0_dbhz(sig_iso, rx_gain_sat, self.temp_k);
                let (js_db, cn0_eff) = match &jam {
                    Some(g) => {
                        let js = j_over_s_db(
                            g.power_dbw,
                            g.gain_dbi,
                            g.rx_gain_toward_jammer_dbi,
                            g.range_m,
                            self.carrier_hz,
                            sig_iso,
                            rx_gain_sat,
                        );
                        (js, effective_cn0_dbhz(cn0_nom, js, g.q, self.chip_rate_hz))
                    }
                    None => (f64::NAN, cn0_nom),
                };
                let status = lock_status(
                    cn0_eff,
                    self.tracking_threshold_dbhz,
                    self.degraded_margin_db,
                );
                let status = status_label(status);
                if status != "LOST" {
                    tracking += 1;
                }
                links.push(LunarJamLink {
                    t_s: t,
                    sat,
                    az_deg,
                    el_deg,
                    range_km: range_m / 1000.0,
                    rx_gain_toward_sat_dbi: rx_gain_sat,
                    signal_rx_isotropic_dbw: sig_iso,
                    signal_rx_dbw: sig_iso + rx_gain_sat,
                    js_db,
                    cn0_nominal_dbhz: cn0_nom,
                    cn0_effective_dbhz: cn0_eff,
                    status: status.to_string(),
                });
            }
            if visible >= 4 {
                avail_nom += 1;
            }
            if tracking >= 4 {
                avail_jam += 1;
            }
            min_tracking = min_tracking.min(tracking);
            epochs.push(LunarJamEpoch {
                t_s: t,
                visible,
                tracking,
            });
        }

        let denom = epochs.len().max(1) as f64;
        let n_lost = links.iter().filter(|l| l.status == "LOST").count();
        let (min_js, max_js, mean_js) = if jam.is_some() && !links.is_empty() {
            let mut lo = f64::INFINITY;
            let mut hi = f64::NEG_INFINITY;
            let mut sum = 0.0;
            for l in &links {
                lo = lo.min(l.js_db);
                hi = hi.max(l.js_db);
                sum += l.js_db;
            }
            (lo, hi, sum / links.len() as f64)
        } else {
            (f64::NAN, f64::NAN, f64::NAN)
        };

        let denial_contour = jam
            .as_ref()
            .filter(|_| !links.is_empty())
            .map(|g| self.denial_contour(g, &links));

        Ok(LunarJammingReport {
            n_sats,
            n_epochs: epochs.len(),
            site_lat_deg: self.site_lat_deg,
            site_lon_deg: self.site_lon_deg,
            elev_mask_deg: self.elev_mask_deg,
            carrier_hz: self.carrier_hz,
            sat_eirp_dbw: self.sat_eirp_dbw,
            chip_rate_hz: self.chip_rate_hz,
            user_boresight_gain_dbi: self.user_boresight_gain_dbi,
            temp_k: self.temp_k,
            tracking_threshold_dbhz: self.tracking_threshold_dbhz,
            degraded_margin_db: self.degraded_margin_db,
            jammer_present: jam.is_some(),
            jammer: jam,
            fom: LunarJammingFoM {
                availability_under_jamming: avail_jam as f64 / denom,
                availability_nominal: avail_nom as f64 / denom,
                min_tracking: if min_tracking == usize::MAX {
                    0
                } else {
                    min_tracking
                },
                min_js_db: min_js,
                max_js_db: max_js,
                mean_js_db: mean_js,
                n_links: links.len(),
                n_lost,
            },
            epochs,
            links,
            note: NOTE,
            js_definition: JS_DEFINITION,
            denial_contour,
        })
    }

    /// Build the denial contour and its band from the measured per-link C/N₀ sample.
    ///
    /// The whole point of the block is that no step here collapses the sample: the
    /// quantiles come out of the table the report already carries, and each one is
    /// pushed through the identical closed-form map. `links` must be non-empty.
    fn denial_contour(&self, g: &LunarJammerGeometry, links: &[LunarJamLink]) -> DenialContour {
        let mut sample: Vec<f64> = links.iter().map(|l| l.cn0_nominal_dbhz).collect();
        sample.sort_by(|a, b| a.partial_cmp(b).unwrap_or(std::cmp::Ordering::Equal));
        let cn0_nominal = Cn0Distribution::from_sorted(&sample);

        let n0 = noise_density_dbw_per_hz(self.temp_k);
        let jammer_eirp_dbw = g.power_dbw + g.gain_dbi;

        // Required received jammer power (dBW) for a J/S of `js_db` against a link whose
        // un-jammed C/N0 is `cn0`: the received wanted power is `cn0 + 10log10(kT)`, and
        // J/S is the difference of the two received powers, so P_J = J/S + C/N0 + N0.
        let received_for = |js_db: f64, cn0: f64| js_db + cn0 + n0;
        // ...the EIRP that delivers it at the scenario's own jammer standoff...
        let eirp_for = |pj: f64| pj - g.rx_gain_toward_jammer_dbi + g.fspl_db;
        // ...and the standoff at which the scenario's own jammer EIRP delivers it.
        let standoff_km_for = |pj: f64| {
            range_for_free_space_path_loss_m(
                jammer_eirp_dbw + g.rx_gain_toward_jammer_dbi - pj,
                self.carrier_hz,
            ) / 1000.0
        };

        let mut points = Vec::with_capacity(CONTOUR_QUANTILES.len());
        let mut lol_standoff: Vec<Option<f64>> = Vec::with_capacity(CONTOUR_QUANTILES.len());
        let mut lol_eirp: Vec<Option<f64>> = Vec::with_capacity(CONTOUR_QUANTILES.len());
        let mut pr_standoff: Vec<Option<f64>> = Vec::with_capacity(CONTOUR_QUANTILES.len());
        let mut pr_eirp: Vec<Option<f64>> = Vec::with_capacity(CONTOUR_QUANTILES.len());

        for (label, q) in CONTOUR_QUANTILES {
            let cn0 = quantile_sorted(&sample, *q);

            let js = denial_js_db(cn0, self.tracking_threshold_dbhz, g.q, self.chip_rate_hz);
            let (lol_js, lol_e, lol_s) = match js {
                Some(js) => {
                    let pj = received_for(js, cn0);
                    (Some(js), Some(eirp_for(pj)), Some(standoff_km_for(pj)))
                }
                None => (None, None, None),
            };

            let pj_pr = received_for(DENIAL_JS_THRESHOLD_DB, cn0);
            let (pr_e, pr_s) = (eirp_for(pj_pr), standoff_km_for(pj_pr));

            lol_standoff.push(lol_s);
            lol_eirp.push(lol_e);
            pr_standoff.push(Some(pr_s));
            pr_eirp.push(Some(pr_e));

            points.push(DenialContourPoint {
                label,
                quantile: *q,
                cn0_nominal_dbhz: cn0,
                loss_of_lock_js_db: lol_js,
                loss_of_lock_eirp_dbw: lol_e,
                loss_of_lock_standoff_km: lol_s,
                power_ratio_eirp_dbw: pr_e,
                power_ratio_standoff_km: pr_s,
            });
        }

        DenialContour {
            cn0_nominal,
            power_ratio_js_threshold_db: DENIAL_JS_THRESHOLD_DB,
            jammer_eirp_dbw,
            n_points_without_loss_of_lock_contour: points
                .iter()
                .filter(|p| p.loss_of_lock_js_db.is_none())
                .count(),
            loss_of_lock: ContourBand::from_points(&lol_standoff, &lol_eirp),
            power_ratio: ContourBand::from_points(&pr_standoff, &pr_eirp)
                .expect("the power-ratio criterion has a solution at every C/N0"),
            points,
            criterion_definition: CRITERION_DEFINITION,
            band_definition: BAND_DEFINITION,
        }
    }

    /// The per-satellite J/S table as CSV — the paper-facing artifact, written by the
    /// engine rather than transcribed. One row per visible (epoch, satellite) link.
    pub fn to_csv(&self) -> Result<String, String> {
        let r = self.run()?;
        let mut s = String::from(
            "t_s,sat,az_deg,el_deg,range_km,rx_gain_toward_sat_dbi,signal_rx_isotropic_dbw,\
             signal_rx_dbw,js_db,cn0_nominal_dbhz,cn0_effective_dbhz,status\n",
        );
        for l in &r.links {
            s.push_str(&format!(
                "{:.6},{},{:.9},{:.9},{:.9},{:.9},{:.9},{:.9},{:.9},{:.9},{:.9},{}\n",
                l.t_s,
                l.sat,
                l.az_deg,
                l.el_deg,
                l.range_km,
                l.rx_gain_toward_sat_dbi,
                l.signal_rx_isotropic_dbw,
                l.signal_rx_dbw,
                l.js_db,
                l.cn0_nominal_dbhz,
                l.cn0_effective_dbhz,
                l.status
            ));
        }
        Ok(s)
    }

    /// Run the scenario for the engine dispatch: `(json, summary, svg)`.
    pub fn run_output(&self) -> Result<(String, String, String), String> {
        let r = self.run()?;
        let mut json = serde_json::to_value(&r).map_err(|e| e.to_string())?;
        json["kind"] = serde_json::Value::String("lunar-jamming".to_string());
        json["units"] = units_block();
        let json = serde_json::to_string_pretty(&json).map_err(|e| e.to_string())?;
        let summary = if r.jammer_present {
            format!(
                "lunar-jamming | {} sats, {} epochs, {} links from ({:.2}, {:.2}) | \
                 J/S {:.3}..{:.3} dB (mean {:.3}) | {} LOST | availability {:.3} of \
                 {:.3} nominal",
                r.n_sats,
                r.n_epochs,
                r.fom.n_links,
                r.site_lat_deg,
                r.site_lon_deg,
                r.fom.min_js_db,
                r.fom.max_js_db,
                r.fom.mean_js_db,
                r.fom.n_lost,
                r.fom.availability_under_jamming,
                r.fom.availability_nominal,
            )
        } else {
            format!(
                "lunar-jamming | {} sats, {} epochs, {} links from ({:.2}, {:.2}) | \
                 no jammer (clean-sky lunar baseline) | {} LOST | availability {:.3}",
                r.n_sats,
                r.n_epochs,
                r.fom.n_links,
                r.site_lat_deg,
                r.site_lon_deg,
                r.fom.n_lost,
                r.fom.availability_nominal,
            )
        };
        let svg = to_svg(&r);
        Ok((json, summary, svg))
    }
}

fn status_label(s: crate::jamming::LockStatus) -> &'static str {
    match s {
        crate::jamming::LockStatus::Locked => "LOCKED",
        crate::jamming::LockStatus::Degraded => "DEGRADED",
        crate::jamming::LockStatus::Lost => "LOST",
    }
}

/// Unit and provenance class for every numeric field the report emits — the same
/// contract [`crate::linkbudget`] and [`crate::hybrid_integrity`] publish, so a
/// quantity's unit never has to be inferred from a consistency check. The table is a
/// slice rather than one `json!` literal because the literal exceeds the macro
/// recursion limit at this many keys, and raising a crate-wide limit to hold a
/// documentation table would be the wrong trade.
const UNITS: &[(&str, &str, &str, &str)] = &[
    // (JSON path, unit, provenance class, note — "" for no note)
    (
        "site_lat_deg",
        "deg",
        "input",
        "selenographic latitude of the surface user",
    ),
    (
        "site_lon_deg",
        "deg",
        "input",
        "selenographic east longitude of the surface user",
    ),
    ("elev_mask_deg", "deg", "input", ""),
    ("carrier_hz", "Hz", "input", ""),
    (
        "sat_eirp_dbw",
        "dBW",
        "input",
        "representative lunar AFS EIRP, not a qualified payload figure",
    ),
    (
        "chip_rate_hz",
        "chip/s",
        "input",
        "sets the despreading processing gain in the anti-jam equation",
    ),
    (
        "user_boresight_gain_dbi",
        "dBi",
        "input",
        "J/S is invariant to this: it enters both legs and cancels",
    ),
    ("temp_k", "K", "input", ""),
    ("tracking_threshold_dbhz", "dB-Hz", "input", ""),
    (
        "degraded_margin_db",
        "dB",
        "input",
        "band above the loss threshold reported as DEGRADED rather than LOCKED",
    ),
    ("n_sats", "count", "input", ""),
    ("n_epochs", "count", "computed", ""),
    ("jammer.power_dbw", "dBW", "input", ""),
    ("jammer.gain_dbi", "dBi", "input", ""),
    (
        "jammer.range_m",
        "m",
        "computed",
        "geometric when placed selenographically, otherwise the input jammer.range_m echoed",
    ),
    (
        "jammer.el_deg",
        "deg",
        "computed",
        "geometric when placed selenographically, otherwise the input jammer.el_deg echoed",
    ),
    (
        "jammer.rx_gain_toward_jammer_dbi",
        "dBi",
        "computed",
        "user_boresight_gain_dbi + jamming::rx_antenna_gain_db(el)",
    ),
    (
        "jammer.fspl_db",
        "dB",
        "computed",
        "jamming::free_space_path_loss_db(range_m, carrier_hz)",
    ),
    (
        "jammer.received_dbw",
        "dBW",
        "computed",
        "link-budget leg 1: power + gain + rx gain - FSPL",
    ),
    (
        "jammer.q",
        "dimensionless",
        "modelled",
        "spectral-separation coefficient; representative per jammer type unless overridden",
    ),
    ("epochs.t_s", "s", "computed", "seconds from scenario epoch"),
    ("epochs.visible", "count", "computed", ""),
    ("epochs.tracking", "count", "computed", ""),
    ("links.t_s", "s", "computed", "seconds from scenario epoch"),
    ("links.sat", "index", "computed", ""),
    (
        "links.az_deg",
        "deg",
        "computed",
        "clockwise from local north, [0, 360)",
    ),
    (
        "links.el_deg",
        "deg",
        "computed",
        "above the user's local horizon",
    ),
    (
        "links.range_km",
        "km",
        "computed",
        "slant range user to satellite",
    ),
    (
        "links.rx_gain_toward_sat_dbi",
        "dBi",
        "computed",
        "user_boresight_gain_dbi + jamming::rx_antenna_gain_db(el)",
    ),
    (
        "links.signal_rx_isotropic_dbw",
        "dBW",
        "computed",
        "link-budget leg 2, isotropic: sat_eirp_dbw - FSPL(range, carrier)",
    ),
    (
        "links.signal_rx_dbw",
        "dBW",
        "computed",
        "link-budget leg 2 at the antenna output",
    ),
    (
        "links.js_db",
        "dB",
        "computed",
        "per-satellite jammer-to-signal ratio; NaN when no jammer is configured",
    ),
    ("links.cn0_nominal_dbhz", "dB-Hz", "computed", ""),
    (
        "links.cn0_effective_dbhz",
        "dB-Hz",
        "computed",
        "anti-jam equation, Kaplan & Hegarty section 9.4",
    ),
    (
        "fom.availability_under_jamming",
        "fraction",
        "computed",
        "fraction of epochs with >= 4 satellites tracking",
    ),
    (
        "fom.availability_nominal",
        "fraction",
        "computed",
        "fraction of epochs with >= 4 satellites visible",
    ),
    ("fom.min_tracking", "count", "computed", ""),
    ("fom.min_js_db", "dB", "computed", ""),
    ("fom.max_js_db", "dB", "computed", ""),
    (
        "fom.mean_js_db",
        "dB",
        "computed",
        "reported beside the per-satellite table, never in place of it",
    ),
    ("fom.n_links", "count", "computed", ""),
    ("fom.n_lost", "count", "computed", ""),
    // --- the denial contour and its band (additive; emitted only with a jammer) -----
    (
        "denial_contour.cn0_nominal.n",
        "count",
        "computed",
        "links in the measured wanted-signal C/N0 sample: the whole per-satellite table",
    ),
    (
        "denial_contour.cn0_nominal.min_dbhz",
        "dB-Hz",
        "computed",
        "smallest nominal C/N0 over the per-satellite table",
    ),
    (
        "denial_contour.cn0_nominal.p05_dbhz",
        "dB-Hz",
        "computed",
        "5th-percentile nominal C/N0, linear-interpolation (type 7) quantile of the table",
    ),
    (
        "denial_contour.cn0_nominal.p25_dbhz",
        "dB-Hz",
        "computed",
        "25th-percentile nominal C/N0, same quantile rule",
    ),
    (
        "denial_contour.cn0_nominal.median_dbhz",
        "dB-Hz",
        "computed",
        "median nominal C/N0 - the single scalar the contour used to rest on, kept beside \
         the spread rather than in place of it",
    ),
    (
        "denial_contour.cn0_nominal.p75_dbhz",
        "dB-Hz",
        "computed",
        "75th-percentile nominal C/N0, same quantile rule",
    ),
    (
        "denial_contour.cn0_nominal.p95_dbhz",
        "dB-Hz",
        "computed",
        "95th-percentile nominal C/N0, same quantile rule",
    ),
    (
        "denial_contour.cn0_nominal.max_dbhz",
        "dB-Hz",
        "computed",
        "largest nominal C/N0 over the per-satellite table",
    ),
    (
        "denial_contour.cn0_nominal.mean_dbhz",
        "dB-Hz",
        "computed",
        "arithmetic mean nominal C/N0 over the table",
    ),
    (
        "denial_contour.cn0_nominal.stdev_dbhz",
        "dB",
        "computed",
        "sample standard deviation (n-1 divisor) of the nominal C/N0; reported for \
         continuity and NOT used to build any band edge",
    ),
    (
        "denial_contour.cn0_nominal.asymmetry_db",
        "dB",
        "computed",
        "(p95 - median) - (median - p05) of the C/N0 sample: how far the measured \
         distribution is from symmetric about its own median",
    ),
    (
        "denial_contour.power_ratio_js_threshold_db",
        "dB",
        "constant",
        "J/S at which the incumbent power-ratio criterion denies (30 dB), the same value \
         attack_surface and tracking_loop use",
    ),
    (
        "denial_contour.jammer_eirp_dbw",
        "dBW",
        "computed",
        "jammer.power_dbw + jammer.gain_dbi - the EIRP the standoff contour is evaluated at",
    ),
    (
        "denial_contour.n_points_without_loss_of_lock_contour",
        "count",
        "computed",
        "contour points whose C/N0 is already at or below tracking_threshold_dbhz, where no \
         finite J/S denies the link and the loss-of-lock columns are null rather than \
         fabricated",
    ),
    (
        "denial_contour.points[].quantile",
        "1",
        "constant",
        "the quantile level this contour point is evaluated at, in [0, 1]",
    ),
    (
        "denial_contour.points[].cn0_nominal_dbhz",
        "dB-Hz",
        "computed",
        "the measured nominal C/N0 at this quantile - the contour function's argument",
    ),
    (
        "denial_contour.points[].loss_of_lock_js_db",
        "dB",
        "closed-form",
        "J/S at which jamming::effective_cn0_dbhz takes this C/N0 down to \
         tracking_threshold_dbhz; the closed-form inverse of that same function",
    ),
    (
        "denial_contour.points[].loss_of_lock_eirp_dbw",
        "dBW",
        "closed-form",
        "jammer EIRP reaching that J/S at the scenario's own jammer standoff",
    ),
    (
        "denial_contour.points[].loss_of_lock_standoff_km",
        "km",
        "closed-form",
        "standoff at which the scenario's own jammer EIRP reaches that J/S - the denial \
         radius for a link of this C/N0, with the receive gain toward the jammer held at \
         its resolved value",
    ),
    (
        "denial_contour.points[].power_ratio_eirp_dbw",
        "dBW",
        "closed-form",
        "jammer EIRP reaching power_ratio_js_threshold_db against this C/N0 at the \
         scenario's own jammer standoff",
    ),
    (
        "denial_contour.points[].power_ratio_standoff_km",
        "km",
        "closed-form",
        "standoff at which the scenario's own jammer EIRP reaches \
         power_ratio_js_threshold_db against this C/N0",
    ),
    (
        "denial_contour.loss_of_lock.standoff_p05_km",
        "km",
        "closed-form",
        "loss-of-lock denial standoff at the 5th-percentile C/N0 - the weak-signal band edge",
    ),
    (
        "denial_contour.loss_of_lock.standoff_median_km",
        "km",
        "closed-form",
        "loss-of-lock denial standoff at the median C/N0 - the single-scalar contour",
    ),
    (
        "denial_contour.loss_of_lock.standoff_p95_km",
        "km",
        "closed-form",
        "loss-of-lock denial standoff at the 95th-percentile C/N0 - the strong-signal band \
         edge",
    ),
    (
        "denial_contour.loss_of_lock.standoff_width_km",
        "km",
        "computed",
        "|standoff_p05_km - standoff_p95_km|",
    ),
    (
        "denial_contour.loss_of_lock.standoff_asymmetry_km",
        "km",
        "computed",
        "(standoff_p95_km - standoff_median_km) - (standoff_median_km - standoff_p05_km); \
         zero would mean the band sits symmetrically about the median contour",
    ),
    (
        "denial_contour.loss_of_lock.eirp_p05_dbw",
        "dBW",
        "closed-form",
        "loss-of-lock required jammer EIRP at the 5th-percentile C/N0",
    ),
    (
        "denial_contour.loss_of_lock.eirp_median_dbw",
        "dBW",
        "closed-form",
        "loss-of-lock required jammer EIRP at the median C/N0",
    ),
    (
        "denial_contour.loss_of_lock.eirp_p95_dbw",
        "dBW",
        "closed-form",
        "loss-of-lock required jammer EIRP at the 95th-percentile C/N0",
    ),
    (
        "denial_contour.loss_of_lock.eirp_width_db",
        "dB",
        "computed",
        "|eirp_p95_dbw - eirp_p05_dbw|",
    ),
    (
        "denial_contour.loss_of_lock.eirp_asymmetry_db",
        "dB",
        "computed",
        "(eirp_p95_dbw - eirp_median_dbw) - (eirp_median_dbw - eirp_p05_dbw)",
    ),
    (
        "denial_contour.power_ratio.standoff_p05_km",
        "km",
        "closed-form",
        "power-ratio denial standoff at the 5th-percentile C/N0",
    ),
    (
        "denial_contour.power_ratio.standoff_median_km",
        "km",
        "closed-form",
        "power-ratio denial standoff at the median C/N0 - the single-scalar contour",
    ),
    (
        "denial_contour.power_ratio.standoff_p95_km",
        "km",
        "closed-form",
        "power-ratio denial standoff at the 95th-percentile C/N0",
    ),
    (
        "denial_contour.power_ratio.standoff_width_km",
        "km",
        "computed",
        "|standoff_p05_km - standoff_p95_km| under the power-ratio criterion",
    ),
    (
        "denial_contour.power_ratio.standoff_asymmetry_km",
        "km",
        "computed",
        "(standoff_p95_km - standoff_median_km) - (standoff_median_km - standoff_p05_km) \
         under the power-ratio criterion",
    ),
    (
        "denial_contour.power_ratio.eirp_p05_dbw",
        "dBW",
        "closed-form",
        "power-ratio required jammer EIRP at the 5th-percentile C/N0",
    ),
    (
        "denial_contour.power_ratio.eirp_median_dbw",
        "dBW",
        "closed-form",
        "power-ratio required jammer EIRP at the median C/N0",
    ),
    (
        "denial_contour.power_ratio.eirp_p95_dbw",
        "dBW",
        "closed-form",
        "power-ratio required jammer EIRP at the 95th-percentile C/N0",
    ),
    (
        "denial_contour.power_ratio.eirp_width_db",
        "dB",
        "computed",
        "|eirp_p95_dbw - eirp_p05_dbw| under the power-ratio criterion",
    ),
    (
        "denial_contour.power_ratio.eirp_asymmetry_db",
        "dB",
        "computed",
        "(eirp_p95_dbw - eirp_median_dbw) - (eirp_median_dbw - eirp_p05_dbw) under the \
         power-ratio criterion; exactly equal to cn0_nominal.asymmetry_db, because this \
         one contour of the four is an exact unit-slope translate of the C/N0 sample",
    ),
];

/// Render [`UNITS`] as the report's `units` block.
fn units_block() -> serde_json::Value {
    let mut m = serde_json::Map::new();
    for (path, unit, provenance, note) in UNITS {
        let mut e = serde_json::Map::new();
        e.insert("unit".into(), serde_json::Value::String((*unit).into()));
        e.insert(
            "provenance".into(),
            serde_json::Value::String((*provenance).into()),
        );
        if !note.is_empty() {
            e.insert("note".into(), serde_json::Value::String((*note).into()));
        }
        m.insert((*path).into(), serde_json::Value::Object(e));
    }
    serde_json::Value::Object(m)
}

/// Per-satellite J/S against elevation, one marker per link, with the loss-of-lock
/// rows marked — the per-satellite structure a median would have destroyed.
pub fn to_svg(r: &LunarJammingReport) -> String {
    let (w, h) = (820.0_f64, 420.0_f64);
    let (ml, mr, mt, mb) = (60.0_f64, 20.0_f64, 34.0_f64, 50.0_f64);
    let pw = w - ml - mr;
    let ph = h - mt - mb;
    let axis_y = mt + ph;
    let mut svg = String::new();
    svg.push_str(&format!(
        "<svg xmlns=\"http://www.w3.org/2000/svg\" width=\"{w:.0}\" height=\"{h:.0}\" \
         font-family=\"sans-serif\" font-size=\"12\" fill=\"#bcb3a3\">\
         <rect width=\"{w:.0}\" height=\"{h:.0}\" fill=\"#0c0b08\"/>"
    ));
    svg.push_str(&format!(
        "<text x=\"{ml:.0}\" y=\"20\" font-size=\"15\" font-weight=\"bold\">\
         Per-satellite J/S vs elevation, lunar surface user</text>"
    ));
    let js_hi = r
        .links
        .iter()
        .map(|l| l.js_db)
        .filter(|v| v.is_finite())
        .fold(f64::NEG_INFINITY, f64::max);
    let js_lo = r
        .links
        .iter()
        .map(|l| l.js_db)
        .filter(|v| v.is_finite())
        .fold(f64::INFINITY, f64::min);
    let (js_lo, js_hi) = if js_lo.is_finite() && js_hi.is_finite() && js_hi > js_lo {
        (js_lo, js_hi)
    } else {
        (0.0, 1.0)
    };
    let pad = (js_hi - js_lo) * 0.1;
    let (y_lo, y_hi) = (js_lo - pad, js_hi + pad);
    svg.push_str(&crate::chart::y_axis(ml, mt, pw, ph, y_hi, "J/S (dB)"));
    svg.push_str(&format!(
        "<line x1=\"{ml:.0}\" y1=\"{mt:.0}\" x2=\"{ml:.0}\" y2=\"{axis_y:.0}\" stroke=\"#342c21\"/>\
         <line x1=\"{ml:.0}\" y1=\"{axis_y:.0}\" x2=\"{:.0}\" y2=\"{axis_y:.0}\" stroke=\"#342c21\"/>",
        ml + pw
    ));
    for l in &r.links {
        if !l.js_db.is_finite() {
            continue;
        }
        let x = ml + (l.el_deg.clamp(0.0, 90.0) / 90.0) * pw;
        let y = mt + ph - ((l.js_db - y_lo) / (y_hi - y_lo)).clamp(0.0, 1.0) * ph;
        let fill = if l.status == "LOST" {
            "#e5645a"
        } else if l.status == "DEGRADED" {
            "#d6a73b"
        } else {
            "#46b67e"
        };
        svg.push_str(&format!(
            "<circle cx=\"{x:.1}\" cy=\"{y:.1}\" r=\"3.5\" fill=\"{fill}\" fill-opacity=\"0.85\"/>"
        ));
    }
    svg.push_str(&format!(
        "<text x=\"{:.0}\" y=\"{:.0}\" text-anchor=\"middle\" fill=\"#8c8273\">\
         satellite elevation (deg)</text>",
        ml + pw / 2.0,
        axis_y + 34.0
    ));
    svg.push_str(&format!(
        "<text x=\"{:.0}\" y=\"42\" fill=\"#46b67e\">LOCKED</text>\
         <text x=\"{:.0}\" y=\"58\" fill=\"#d6a73b\">DEGRADED</text>\
         <text x=\"{:.0}\" y=\"74\" fill=\"#e5645a\">LOST</text>",
        ml + 10.0,
        ml + 10.0,
        ml + 10.0
    ));
    svg.push_str(&format!(
        "<text x=\"{:.0}\" y=\"{:.0}\" text-anchor=\"end\" fill=\"#8c8273\">{} links</text>",
        ml + pw,
        mt + 14.0,
        r.fom.n_links
    ));
    svg.push_str("</svg>");
    svg
}

#[cfg(test)]
mod tests {
    use super::*;
    use crate::linkbudget::received_signal_power_dbw;

    fn jammed() -> LunarJammingScenario {
        LunarJammingScenario {
            jammer: Some(LunarJammerCfg::default()),
            ..Default::default()
        }
    }

    #[test]
    fn the_scenario_reports_one_j_over_s_row_per_visible_satellite_and_never_a_median() {
        let r = jammed().run().expect("baseline runs");
        // Every visible (epoch, satellite) pair is its own row, and the epoch counts
        // add up to the table length — nothing is collapsed on the way out.
        let counted: usize = r.epochs.iter().map(|e| e.visible).sum();
        assert_eq!(
            counted,
            r.links.len(),
            "the table must hold one row per visible link"
        );
        assert_eq!(r.fom.n_links, r.links.len());
        assert!(r.links.len() > 1, "a single row could not show structure");
        // Distinct J/S values: a median (or any single quoted number) could not carry
        // this spread.
        let lo = r.fom.min_js_db;
        let hi = r.fom.max_js_db;
        assert!(
            hi - lo > 1.0,
            "per-satellite J/S should span more than a dB here (got {lo} .. {hi})"
        );
        // The serialised report carries the table, not just the summary.
        let j = serde_json::to_value(&r).unwrap();
        assert!(j["links"].as_array().unwrap().len() == r.links.len());
        assert!(j["links"][0]["js_db"].is_number());
    }

    #[test]
    fn a_single_median_j_over_s_would_misreport_the_outcome_that_the_table_reports() {
        // The second half of the acceptance criterion, stated as something that can
        // fail. At a 25 km standoff the per-satellite table splits: some links hold on,
        // most do not. Collapse the table to one median J/S (and the median nominal
        // C/N0, so the collapse is as favourable as it can be) and classify that single
        // number: the verdict it gives disagrees with a substantial share of the rows it
        // replaced. That disagreement is the reason this scenario emits per-satellite
        // J/S at all.
        let scn = LunarJammingScenario {
            jammer: Some(LunarJammerCfg {
                range_m: 25_000.0,
                ..LunarJammerCfg::default()
            }),
            ..Default::default()
        };
        let r = scn.run().unwrap();
        assert!(r.links.len() >= 8, "need a table worth collapsing");
        let median = |mut v: Vec<f64>| -> f64 {
            v.sort_by(|a, b| a.partial_cmp(b).unwrap());
            let n = v.len();
            if n % 2 == 1 {
                v[n / 2]
            } else {
                0.5 * (v[n / 2 - 1] + v[n / 2])
            }
        };
        let js_med = median(r.links.iter().map(|l| l.js_db).collect());
        let cn0_med = median(r.links.iter().map(|l| l.cn0_nominal_dbhz).collect());
        let q = r.jammer.as_ref().unwrap().q;
        let collapsed = status_label(lock_status(
            effective_cn0_dbhz(cn0_med, js_med, q, r.chip_rate_hz),
            r.tracking_threshold_dbhz,
            r.degraded_margin_db,
        ));
        let disagree = r.links.iter().filter(|l| l.status != collapsed).count();
        // The table is genuinely mixed here — not all rows share one verdict...
        assert!(
            r.links.iter().any(|l| l.status != r.links[0].status),
            "this operating point must produce a mixed table or the test proves nothing"
        );
        // ...and the median's single verdict is wrong for a real share of the rows.
        assert!(
            disagree > 0,
            "the median verdict {collapsed} matched every row; the collapse lost nothing \
             at this operating point and the claim is not demonstrated here"
        );
        assert!(
            disagree * 4 >= r.links.len(),
            "expected the median to misreport at least a quarter of the rows; it \
             misreported {disagree} of {}",
            r.links.len()
        );
    }

    #[test]
    fn j_over_s_equals_the_difference_of_two_independent_link_budget_runs() {
        // The acceptance identity. The manuscript recipe is: run `link-budget` once for
        // the jammer leg, once for the satellite leg, subtract the two received powers.
        // Here the two legs are evaluated with `linkbudget::received_signal_power_dbw`,
        // whose free-space loss is the single expression 20*log10(4*pi*R*f/c) — a
        // different code path from the three-term sum `jamming::free_space_path_loss_db`
        // the scenario uses. The two must agree to 1e-9 dB on every row.
        let scn = jammed();
        let r = scn.run().expect("run");
        let g = r.jammer.as_ref().expect("a jammer");
        // Link-budget leg 1 (jammer -> user), composed exactly as a manuscript would.
        let p_j = received_signal_power_dbw(
            g.power_dbw + g.gain_dbi,
            g.rx_gain_toward_jammer_dbi,
            g.range_m,
            r.carrier_hz,
        );
        let mut worst = 0.0f64;
        for l in &r.links {
            // Link-budget leg 2 (satellite -> user).
            let p_s = received_signal_power_dbw(
                r.sat_eirp_dbw,
                l.rx_gain_toward_sat_dbi,
                l.range_km * 1000.0,
                r.carrier_hz,
            );
            worst = worst.max((l.js_db - (p_j - p_s)).abs());
        }
        assert!(
            worst < 1e-9,
            "composed two-link-budget J/S vs scenario J/S: worst {worst:e} dB"
        );
        assert!(!r.links.is_empty());
    }

    #[test]
    fn the_report_prints_both_link_budget_legs_so_the_difference_is_checkable_from_it() {
        // "Print what the source already holds": the J/S is a difference, and both
        // operands are in the report, so a reader never has to re-run anything.
        let r = jammed().run().expect("run");
        let g = r.jammer.as_ref().unwrap();
        assert!(
            (g.received_dbw - (g.power_dbw + g.gain_dbi + g.rx_gain_toward_jammer_dbi - g.fspl_db))
                .abs()
                < 1e-12
        );
        for l in &r.links {
            assert!(
                (l.signal_rx_dbw - (l.signal_rx_isotropic_dbw + l.rx_gain_toward_sat_dbi)).abs()
                    < 1e-12
            );
            assert!(
                (l.js_db - (g.received_dbw - l.signal_rx_dbw)).abs() < 1e-9,
                "js_db must be the printed difference of the two printed powers"
            );
        }
    }

    #[test]
    fn j_over_s_is_invariant_to_the_user_antenna_boresight_gain() {
        // The boresight gain enters the jammer leg and the signal leg identically, so it
        // cancels out of the ratio. C/N0 does move with it — that is asserted too, so
        // the invariance is not being read off a field that never changes.
        let a = jammed();
        let b = LunarJammingScenario {
            user_boresight_gain_dbi: a.user_boresight_gain_dbi + 7.5,
            ..jammed()
        };
        let (ra, rb) = (a.run().unwrap(), b.run().unwrap());
        assert_eq!(ra.links.len(), rb.links.len());
        for (la, lb) in ra.links.iter().zip(rb.links.iter()) {
            assert!(
                (la.js_db - lb.js_db).abs() < 1e-12,
                "J/S moved with the boresight gain: {} vs {}",
                la.js_db,
                lb.js_db
            );
            assert!(
                (lb.cn0_nominal_dbhz - la.cn0_nominal_dbhz - 7.5).abs() < 1e-9,
                "C/N0 must move by exactly the boresight change"
            );
        }
    }

    #[test]
    fn a_closer_jammer_raises_j_over_s_by_exactly_the_free_space_loss_difference() {
        // Physics, not a trend: halving the standoff must add 20*log10(2) dB to every
        // row, because the only term that changed is the jammer-leg path loss.
        let far = jammed();
        let near = LunarJammingScenario {
            jammer: Some(LunarJammerCfg {
                range_m: d_jammer_range_m() / 2.0,
                ..LunarJammerCfg::default()
            }),
            ..Default::default()
        };
        let (rf, rn) = (far.run().unwrap(), near.run().unwrap());
        let expect = 20.0 * 2.0_f64.log10();
        assert_eq!(rf.links.len(), rn.links.len());
        for (lf, ln) in rf.links.iter().zip(rn.links.iter()) {
            assert!(
                (ln.js_db - lf.js_db - expect).abs() < 1e-9,
                "expected +{expect} dB, got {}",
                ln.js_db - lf.js_db
            );
        }
        // And the effective C/N0 can only fall when the interference rises.
        for (lf, ln) in rf.links.iter().zip(rn.links.iter()) {
            assert!(ln.cn0_effective_dbhz <= lf.cn0_effective_dbhz + 1e-12);
        }
    }

    #[test]
    fn a_more_distant_satellite_is_the_weaker_signal_so_it_carries_the_higher_j_over_s() {
        // The lunar-native part: the signal leg is NOT a constant received power the way
        // the Earth pack's `signal_power_dbw` is. Range spread across an eccentric lunar
        // orbit moves the received power, hence the J/S, satellite by satellite. Check it
        // on rows that share an epoch (so the jammer leg is identical) and differ only in
        // slant range and elevation.
        let r = jammed().run().unwrap();
        let mut compared = 0usize;
        for e in &r.epochs {
            let rows: Vec<&LunarJamLink> = r
                .links
                .iter()
                .filter(|l| (l.t_s - e.t_s).abs() < 1e-9)
                .collect();
            for a in &rows {
                for b in &rows {
                    // Isolate range: only compare rows whose receive-antenna gain is the
                    // same to within a hundredth of a dB, so the elevation pattern cannot
                    // be what orders them.
                    if (a.rx_gain_toward_sat_dbi - b.rx_gain_toward_sat_dbi).abs() > 1e-2 {
                        continue;
                    }
                    if a.range_km <= b.range_km + 1.0 {
                        continue;
                    }
                    compared += 1;
                    assert!(
                        a.js_db > b.js_db,
                        "the farther satellite ({:.0} km) must carry the higher J/S than \
                         the nearer one ({:.0} km): {} vs {}",
                        a.range_km,
                        b.range_km,
                        a.js_db,
                        b.js_db
                    );
                }
            }
        }
        assert!(
            compared > 0,
            "no same-epoch, same-gain pair was available to compare — the claim was not \
             actually exercised"
        );
    }

    #[test]
    fn no_jammer_is_a_clean_sky_lunar_baseline_with_an_undefined_j_over_s() {
        let r = LunarJammingScenario::default().run().unwrap();
        assert!(!r.jammer_present);
        assert!(r.jammer.is_none());
        assert!(r.fom.mean_js_db.is_nan());
        assert!(r.fom.min_js_db.is_nan() && r.fom.max_js_db.is_nan());
        for l in &r.links {
            assert!(l.js_db.is_nan(), "J/S is undefined with no jammer");
            assert!((l.cn0_effective_dbhz - l.cn0_nominal_dbhz).abs() < 1e-12);
        }
        // Every epoch's tracking count equals its visible count with no interference.
        for e in &r.epochs {
            assert_eq!(e.tracking, e.visible);
        }
    }

    #[test]
    fn a_selenographic_jammer_gets_its_range_from_the_shared_lunar_geometry() {
        // Placing the jammer on the Moon must reuse `lunar_service::topocentric`, not a
        // private copy: the reported range has to equal the chord the same function
        // returns for the same two selenographic points.
        let scn = LunarJammingScenario {
            jammer: Some(LunarJammerCfg {
                lat_deg: Some(-89.0),
                lon_deg: Some(129.78),
                ..LunarJammerCfg::default()
            }),
            ..Default::default()
        };
        let r = scn.run().unwrap();
        let g = r.jammer.as_ref().unwrap();
        assert!(g.placed_selenographically);
        let user = selenographic_to_mcmf(scn.site());
        let jam = selenographic_to_mcmf(Selenographic {
            lat_rad: (-89.0f64).to_radians(),
            lon_rad: 129.78f64.to_radians(),
            alt_m: 0.0,
        });
        let (_az, el, rng) = topocentric(user, jam);
        assert!((g.range_m - rng).abs() < 1e-9);
        assert!((g.el_deg - el).abs() < 1e-12);
        // A jammer 0.67 deg of arc away over an airless body is below the local
        // horizon, so the pattern hands it the horizon (floor) gain.
        assert!(el < 0.0, "expected a below-horizon jammer, got el = {el}");
        assert!((g.rx_gain_toward_jammer_dbi - (scn.user_boresight_gain_dbi - 4.0)).abs() < 1e-12);
    }

    #[test]
    fn a_narrowband_jammer_leaves_a_higher_effective_cn0_than_broadband_at_equal_js() {
        // Same J/S, different despreading efficiency: Q = 1.5 for a tone vs 1.0 for
        // matched wideband noise, so the tone hurts less. The J/S rows must be identical
        // (Q does not enter the ratio) while the effective C/N0 rises.
        let wide = jammed();
        let tone = LunarJammingScenario {
            jammer: Some(LunarJammerCfg {
                jammer_type: "narrowband".into(),
                ..LunarJammerCfg::default()
            }),
            ..Default::default()
        };
        let (rw, rt) = (wide.run().unwrap(), tone.run().unwrap());
        assert!((rt.jammer.as_ref().unwrap().q - 1.5).abs() < 1e-12);
        for (lw, lt) in rw.links.iter().zip(rt.links.iter()) {
            assert!((lw.js_db - lt.js_db).abs() < 1e-12, "Q must not move J/S");
            assert!(
                lt.cn0_effective_dbhz > lw.cn0_effective_dbhz,
                "a less efficiently despread jammer must leave more C/N0"
            );
        }
    }

    #[test]
    fn a_strong_enough_jammer_takes_every_lunar_link_below_the_tracking_threshold() {
        let scn = LunarJammingScenario {
            jammer: Some(LunarJammerCfg {
                power_dbw: 40.0,
                range_m: 1_000.0,
                ..LunarJammerCfg::default()
            }),
            ..Default::default()
        };
        let r = scn.run().unwrap();
        assert!(r.fom.n_links > 0);
        assert_eq!(r.fom.n_lost, r.fom.n_links, "expected a total denial");
        assert_eq!(r.fom.availability_under_jamming, 0.0);
        assert!(
            r.fom.availability_nominal > 0.0,
            "the clean-sky geometry must not be the reason availability is zero"
        );
        for l in &r.links {
            assert_eq!(l.status, "LOST");
            assert!(l.cn0_effective_dbhz < r.tracking_threshold_dbhz);
        }
    }

    #[test]
    fn the_csv_table_carries_every_row_of_the_json_table() {
        let scn = jammed();
        let r = scn.run().unwrap();
        let csv = scn.to_csv().unwrap();
        let lines: Vec<&str> = csv.lines().collect();
        assert_eq!(
            lines.len(),
            r.links.len() + 1,
            "one header plus one row per link"
        );
        assert!(lines[0].starts_with("t_s,sat,az_deg,el_deg,range_km"));
        assert!(lines[0].contains("js_db"));
        // The first data row's J/S round-trips through the CSV to 1e-9 dB.
        let first: Vec<&str> = lines[1].split(',').collect();
        let js: f64 = first[8].parse().unwrap();
        assert!((js - r.links[0].js_db).abs() < 1e-9);
    }

    #[test]
    fn every_emitted_numeric_field_has_a_unit_and_a_provenance_class() {
        let (json, _s, _svg) = jammed().run_output().unwrap();
        let v: serde_json::Value = serde_json::from_str(&json).unwrap();
        let units = v["units"].as_object().expect("a units block");
        for (k, u) in units {
            assert!(
                u.get("unit").and_then(|x| x.as_str()).is_some(),
                "{k} has no unit"
            );
            assert!(
                u.get("provenance").and_then(|x| x.as_str()).is_some(),
                "{k} has no provenance class"
            );
        }
        // Every scalar top-level numeric field, and every numeric field of a `links`
        // row, of the `epochs` rows, of `fom` and of `jammer`, must be covered.
        let mut missing: Vec<String> = Vec::new();
        let mut check = |prefix: &str, obj: &serde_json::Value| {
            if let Some(m) = obj.as_object() {
                for (k, val) in m {
                    if val.is_number() {
                        let key = if prefix.is_empty() {
                            k.clone()
                        } else {
                            format!("{prefix}.{k}")
                        };
                        if !units.contains_key(&key) {
                            missing.push(key);
                        }
                    }
                }
            }
        };
        check("", &v);
        check("jammer", &v["jammer"]);
        check("fom", &v["fom"]);
        check("epochs", &v["epochs"][0]);
        check("links", &v["links"][0]);
        assert!(
            missing.is_empty(),
            "fields with no units entry: {missing:?}"
        );
    }

    #[test]
    fn the_run_is_deterministic_and_the_dispatch_surface_is_populated() {
        let scn = jammed();
        let (j1, s1, v1) = scn.run_output().unwrap();
        let (j2, s2, v2) = scn.run_output().unwrap();
        assert_eq!(j1, j2);
        assert_eq!(s1, s2);
        assert_eq!(v1, v2);
        assert!(v1.starts_with("<svg"));
        assert!(s1.contains("lunar-jamming"));
        assert!(j1.contains("MODELLED"));
        assert!(j1.contains("not the real Moonlight/LCNS ephemeris"));
    }

    #[test]
    fn bad_inputs_are_rejected_rather_than_producing_a_number() {
        let bad = LunarJammingScenario {
            carrier_hz: 0.0,
            ..Default::default()
        };
        assert!(bad.run().is_err());
        let bad = LunarJammingScenario {
            eccentricity: 1.0,
            ..Default::default()
        };
        assert!(bad.run().is_err());
        let bad = LunarJammingScenario {
            sma_km: 100.0,
            ..Default::default()
        };
        assert!(bad.run().is_err());
        let bad = LunarJammingScenario {
            jammer: Some(LunarJammerCfg {
                range_m: -1.0,
                ..LunarJammerCfg::default()
            }),
            ..Default::default()
        };
        assert!(bad.run().is_err());
    }

    #[test]
    fn raising_the_elevation_mask_can_only_remove_rows_never_change_the_ones_that_remain() {
        // A mask is a filter, not a physical input: the surviving rows must be
        // bit-identical, which is what makes a masked table safe to compare against an
        // unmasked one.
        let low = jammed();
        let high = LunarJammingScenario {
            elev_mask_deg: 25.0,
            ..jammed()
        };
        let (rl, rh) = (low.run().unwrap(), high.run().unwrap());
        assert!(rh.links.len() <= rl.links.len());
        for lh in &rh.links {
            let m = rl
                .links
                .iter()
                .find(|l| (l.t_s - lh.t_s).abs() < 1e-9 && l.sat == lh.sat)
                .expect("a masked row must also exist unmasked");
            assert_eq!(m.js_db.to_bits(), lh.js_db.to_bits());
            assert_eq!(m.el_deg.to_bits(), lh.el_deg.to_bits());
            assert_eq!(
                m.cn0_effective_dbhz.to_bits(),
                lh.cn0_effective_dbhz.to_bits()
            );
        }
        assert!(rh.links.iter().all(|l| l.el_deg >= 25.0));
    }

    // -----------------------------------------------------------------------
    // The denial contour and the band the measured C/N₀ spread puts on it
    // -----------------------------------------------------------------------

    /// The operating point the whole contour argument is made at: the jammer 25 km off,
    /// every other input at the module's documented default. It is the same point
    /// `a_single_median_j_over_s_would_misreport_the_outcome_that_the_table_reports`
    /// uses, because the claim being made is about that table.
    fn mixed_operating_point() -> LunarJammingScenario {
        LunarJammingScenario {
            jammer: Some(LunarJammerCfg {
                range_m: 25_000.0,
                ..LunarJammerCfg::default()
            }),
            ..Default::default()
        }
    }

    #[test]
    fn the_denial_threshold_is_the_same_thirty_decibels_the_rest_of_the_engine_uses() {
        // The power-ratio criterion is not a new constant invented here. If the
        // tracking-loop pack ever moves its threshold, this fails rather than letting
        // two packs publish two different "denial" contours under one word.
        assert_eq!(
            DENIAL_JS_THRESHOLD_DB,
            crate::tracking_loop::TrackingLoopScenario::default().denial_js_threshold_db,
            "the lunar contour's power-ratio threshold has drifted from tracking_loop's"
        );
    }

    #[test]
    fn the_contour_is_the_exact_inverse_of_the_functions_the_rows_were_scored_with() {
        // A contour is only "the same contour function" if it round-trips through the
        // forward functions the report itself uses. Three inversions, each checked
        // against its own forward expression on every emitted point.
        let r = mixed_operating_point().run().unwrap();
        let c = r.denial_contour.as_ref().expect("a jammer means a contour");
        let g = r.jammer.as_ref().unwrap();
        let eirp = g.power_dbw + g.gain_dbi;

        for p in &c.points {
            let js = p
                .loss_of_lock_js_db
                .expect("defined at this operating point");
            // 1. the anti-jam equation, forward, lands exactly on the threshold...
            let eff = effective_cn0_dbhz(p.cn0_nominal_dbhz, js, g.q, r.chip_rate_hz);
            assert!(
                (eff - r.tracking_threshold_dbhz).abs() < 1e-9,
                "{}: inverting effective_cn0_dbhz gave {js} dB, which the forward \
                 function maps to {eff} dB-Hz, not the {} dB-Hz threshold",
                p.label,
                r.tracking_threshold_dbhz
            );
            // ...and the contour is the *boundary* of the denial set, so the verdict
            // must flip across it. Exactly on the contour the residual is float
            // round-off (~1e-15 dB-Hz above) and `lock_status`'s strict `<` can land
            // either way on the last bit, which is why the flip is measured a real
            // 1e-4 dB of J/S either side rather than at the point itself.
            let verdict = |dj: f64| {
                status_label(lock_status(
                    effective_cn0_dbhz(p.cn0_nominal_dbhz, js + dj, g.q, r.chip_rate_hz),
                    r.tracking_threshold_dbhz,
                    r.degraded_margin_db,
                ))
            };
            assert_eq!(
                (verdict(-1e-4), verdict(1e-4)),
                ("DEGRADED", "LOST"),
                "{}: the verdict must flip across the contour",
                p.label
            );

            // 2. the free-space-loss inversion round-trips.
            let range_m = p.loss_of_lock_standoff_km.unwrap() * 1000.0;
            let fspl = free_space_path_loss_db(range_m, r.carrier_hz);
            let back = range_for_free_space_path_loss_m(fspl, r.carrier_hz);
            assert!(
                (back - range_m).abs() < 1e-6,
                "{}: FSPL round trip moved {range_m} m to {back} m",
                p.label
            );

            // 3. the standoff really does produce that J/S, measured with the FORWARD
            //    j_over_s_db against a link of this C/N0 — the same function the table's
            //    own js_db column is built with.
            let signal_rx = p.cn0_nominal_dbhz + noise_density_dbw_per_hz(r.temp_k);
            let js_fwd = j_over_s_db(
                g.power_dbw,
                g.gain_dbi,
                g.rx_gain_toward_jammer_dbi,
                range_m,
                r.carrier_hz,
                signal_rx,
                0.0,
            );
            assert!(
                (js_fwd - js).abs() < 1e-9,
                "{}: the contour standoff {range_m} m gives J/S {js_fwd} dB, not {js} dB",
                p.label
            );

            // 4. the EIRP axis: the required EIRP, put back through the forward J/S at
            //    the scenario's own standoff, reproduces the same J/S.
            let js_eirp = j_over_s_db(
                p.loss_of_lock_eirp_dbw.unwrap(),
                0.0,
                g.rx_gain_toward_jammer_dbi,
                g.range_m,
                r.carrier_hz,
                signal_rx,
                0.0,
            );
            assert!((js_eirp - js).abs() < 1e-9, "{}: EIRP axis", p.label);

            // …and the same for the power-ratio criterion, which must land on 30 dB.
            let js_pr = j_over_s_db(
                p.power_ratio_eirp_dbw,
                0.0,
                g.rx_gain_toward_jammer_dbi,
                g.range_m,
                r.carrier_hz,
                signal_rx,
                0.0,
            );
            assert!((js_pr - DENIAL_JS_THRESHOLD_DB).abs() < 1e-9);
        }
        assert_eq!(c.n_points_without_loss_of_lock_contour, 0);
        assert!((c.jammer_eirp_dbw - eirp).abs() < 1e-12);
    }

    #[test]
    fn the_band_is_the_measured_quantiles_pushed_through_the_contour_not_a_sigma() {
        // The band edges must BE contour(p05) and contour(p95) — the same map applied to
        // the sample's own order statistics — and must not be reproducible by any
        // median ± k·stdev.
        let r = mixed_operating_point().run().unwrap();
        let c = r.denial_contour.as_ref().unwrap();
        let b = c.loss_of_lock.as_ref().expect("defined here");
        let at = |label: &str| {
            c.points
                .iter()
                .find(|p| p.label == label)
                .expect("the grid names it")
        };

        // The edges are literally the points, not a refit.
        assert_eq!(
            b.standoff_p05_km.to_bits(),
            at("p05").loss_of_lock_standoff_km.unwrap().to_bits()
        );
        assert_eq!(
            b.standoff_p95_km.to_bits(),
            at("p95").loss_of_lock_standoff_km.unwrap().to_bits()
        );
        assert_eq!(
            b.eirp_median_dbw.to_bits(),
            at("median").loss_of_lock_eirp_dbw.unwrap().to_bits()
        );

        // A ±k·σ band would place both edges the same distance from the median. Measure
        // the two half-widths on each axis and require them to differ.
        let lo_half = b.standoff_p05_km - b.standoff_median_km;
        let hi_half = b.standoff_median_km - b.standoff_p95_km;
        assert!(
            (lo_half - hi_half).abs() > 1e-6,
            "the standoff band is symmetric about the median contour: {lo_half} km out, \
             {hi_half} km in. That is the reparametrised-sigma failure this test exists \
             to catch — report it rather than forcing it."
        );
        let e_lo = b.eirp_median_dbw - b.eirp_p05_dbw;
        let e_hi = b.eirp_p95_dbw - b.eirp_median_dbw;
        assert!(
            (e_lo - e_hi).abs() > 1e-6,
            "the EIRP band is symmetric about the median contour ({e_lo} vs {e_hi} dB)"
        );

        // And no single k reproduces both edges from the stdev.
        let sd = c.cn0_nominal.stdev_dbhz;
        assert!(sd > 0.0);
        let k_lo = e_lo / sd;
        let k_hi = e_hi / sd;
        assert!(
            (k_lo - k_hi).abs() > 1e-6,
            "one k reproduced both EIRP edges ({k_lo} vs {k_hi}) — the band would be a \
             reparametrised sigma after all"
        );
    }

    #[test]
    fn the_asymmetry_the_band_carries_is_the_samples_own_shape_bent_by_the_criterion() {
        // The sharpest statement that the band is not a sigma: the power-ratio EIRP
        // contour is an EXACT unit-slope translate of the C/N0 sample, so its band's
        // asymmetry equals the sample's asymmetry to the last bit; the loss-of-lock
        // contour is not linear, so its band's asymmetry differs — by a measured amount.
        let r = mixed_operating_point().run().unwrap();
        let c = r.denial_contour.as_ref().unwrap();
        let skew = c.cn0_nominal.asymmetry_db;
        assert!(
            skew.abs() > 1e-3,
            "this operating point's C/N0 sample is symmetric ({skew} dB); the asymmetry \
             claim cannot be demonstrated here"
        );

        let pr = c.power_ratio.eirp_asymmetry_db;
        assert!(
            (pr - skew).abs() < 1e-9,
            "the power-ratio EIRP band asymmetry {pr} dB should equal the sample's own \
             {skew} dB exactly: that contour is C/N0 + 30 dB + N0, unit slope"
        );

        let lol = c.loss_of_lock.as_ref().unwrap().eirp_asymmetry_db;
        let bend = lol - skew;
        assert!(
            bend.abs() > 1e-6,
            "the loss-of-lock EIRP band asymmetry {lol} dB matched the sample's own \
             {skew} dB; the anti-jam equation added no curvature at this operating point"
        );

        // Pinned at the documented operating point (jammer 25 km, all else default):
        // sample skew +1.439070 dB, power-ratio band +1.439070 dB, loss-of-lock band
        // +1.442570 dB — a +0.003500 dB bend from the anti-jam equation.
        assert!((skew - 1.439_070).abs() < 5e-6, "sample skew {skew}");
        assert!(
            (lol - 1.442_570).abs() < 5e-6,
            "loss-of-lock band skew {lol}"
        );
        assert!((bend - 0.003_500).abs() < 5e-6, "the bend {bend}");

        // On the standoff axis both bands are strongly asymmetric even where the EIRP
        // contour is exactly linear, because range is exponential in dB.
        assert!((c.power_ratio.standoff_asymmetry_km + 6.503_720).abs() < 5e-5);
        assert!((c.loss_of_lock.as_ref().unwrap().standoff_asymmetry_km + 3.628_364).abs() < 5e-5);
    }

    #[test]
    fn the_contour_is_monotone_in_cn0_measured_over_a_dense_sweep_not_assumed() {
        // The quantile ordering is only trivial if the map is monotone, and that is a
        // claim about the anti-jam equation, not an axiom. Sweep the contour densely
        // across and well beyond the C/N0 range the table produces and count the
        // violations; if the map ever folds, this is the test that catches it.
        let r = mixed_operating_point().run().unwrap();
        let c = r.denial_contour.as_ref().unwrap();
        let g = r.jammer.as_ref().unwrap();
        let n0 = noise_density_dbw_per_hz(r.temp_k);
        let eirp = g.power_dbw + g.gain_dbi;

        let standoff_km = |cn0: f64| -> Option<f64> {
            let js = denial_js_db(cn0, r.tracking_threshold_dbhz, g.q, r.chip_rate_hz)?;
            Some(
                range_for_free_space_path_loss_m(
                    eirp + g.rx_gain_toward_jammer_dbi - (js + cn0 + n0),
                    r.carrier_hz,
                ) / 1000.0,
            )
        };

        let (lo, hi, n) = (r.tracking_threshold_dbhz + 1e-3, 80.0_f64, 20_001usize);
        let mut prev: Option<(f64, f64)> = None;
        let mut violations = 0usize;
        let mut first: Option<String> = None;
        for i in 0..n {
            let cn0 = lo + (hi - lo) * i as f64 / (n - 1) as f64;
            let s = standoff_km(cn0).expect("above the threshold, so defined");
            let p =
                denial_js_db(cn0, r.tracking_threshold_dbhz, g.q, r.chip_rate_hz).unwrap() + cn0;
            // Finiteness first, so the ordering test below can use plain comparisons
            // without a NaN quietly passing as "not a violation".
            assert!(
                s.is_finite() && p.is_finite(),
                "the contour returned a non-finite value at C/N0 {cn0} dB-Hz"
            );
            if let Some((ps, pp)) = prev {
                if s >= ps || p <= pp {
                    violations += 1;
                    first.get_or_insert(format!(
                        "at C/N0 {cn0} dB-Hz: standoff {ps} -> {s} km, required power \
                         {pp} -> {p} dBW"
                    ));
                }
            }
            prev = Some((s, p));
        }
        assert_eq!(
            violations, 0,
            "the denial contour is NOT monotone in C/N0 over [{lo}, {hi}] dB-Hz \
             ({violations} of {n} samples break the ordering; first: {first:?}). That is \
             a real finding about the anti-jam equation — pin it, do not smooth it."
        );

        // Having measured it, the emitted ordering must agree: strictly here, because
        // this sample's quantiles are distinct.
        let b = c.loss_of_lock.as_ref().unwrap();
        assert!(b.standoff_monotone_in_cn0 && b.eirp_monotone_in_cn0);
        assert!(c.power_ratio.standoff_monotone_in_cn0 && c.power_ratio.eirp_monotone_in_cn0);
        let mut prev_s = f64::INFINITY;
        for p in &c.points {
            let s = p.loss_of_lock_standoff_km.unwrap();
            assert!(
                s < prev_s,
                "{}: the emitted points are not strictly ordered ({s} after {prev_s})",
                p.label
            );
            prev_s = s;
        }
        // …so the band edges are the p05/p95 ones and never crossed.
        assert!(b.standoff_p05_km > b.standoff_median_km);
        assert!(b.standoff_median_km > b.standoff_p95_km);
    }

    #[test]
    fn the_band_recovers_the_split_verdict_the_single_scalar_contour_lost() {
        // The acceptance case, at the operating point the sibling median test already
        // uses. The scalar contour puts the whole constellation on one side of the
        // boundary; the band puts the boundary THROUGH the constellation, which is what
        // the per-satellite table says is happening.
        let scn = mixed_operating_point();
        let r = scn.run().unwrap();
        let c = r.denial_contour.as_ref().unwrap();
        let b = c.loss_of_lock.as_ref().unwrap();
        let g = r.jammer.as_ref().unwrap();
        let standoff_km = g.range_m / 1000.0;
        assert!((standoff_km - 25.0).abs() < 1e-12);

        // What the table actually reports, per satellite.
        let lost = r.links.iter().filter(|l| l.status == "LOST").count();
        assert_eq!((lost, r.links.len()), (26, 38));

        // The single-scalar contour: one radius, one verdict, for all 38 rows.
        assert!(
            standoff_km < b.standoff_median_km,
            "the median contour must bracket the operating point for this test to bite"
        );
        let scalar_verdict_wrong = r.links.len() - lost;
        assert_eq!(
            scalar_verdict_wrong, 12,
            "the median contour declares every link denied; it is wrong for the rows \
             that are not"
        );
        assert!(scalar_verdict_wrong * 4 >= r.links.len());

        // The band: the operating point sits INSIDE it, so the report states that the
        // constellation straddles the denial boundary rather than asserting one verdict.
        assert!(
            b.standoff_p95_km < standoff_km && standoff_km < b.standoff_p05_km,
            "25 km must fall inside [{}, {}] km for the band to carry the split",
            b.standoff_p95_km,
            b.standoff_p05_km
        );

        // And the contour map, applied per link rather than per quantile, reproduces the
        // report's own status column exactly — so the band is an envelope of the real
        // per-link contours, not a decoration on top of them.
        let n0 = noise_density_dbw_per_hz(r.temp_k);
        let eirp = g.power_dbw + g.gain_dbi;
        let mut disagree = 0usize;
        let mut above = 0usize;
        for l in &r.links {
            let js = denial_js_db(
                l.cn0_nominal_dbhz,
                r.tracking_threshold_dbhz,
                g.q,
                r.chip_rate_hz,
            )
            .expect("every link here is above the threshold unjammed");
            let radius_km = range_for_free_space_path_loss_m(
                eirp + g.rx_gain_toward_jammer_dbi - (js + l.cn0_nominal_dbhz + n0),
                r.carrier_hz,
            ) / 1000.0;
            // Strict, to match `lock_status`'s strict `<`: a link exactly on the
            // contour is the boundary and is not denied.
            if radius_km > standoff_km {
                above += 1;
            }
            if (radius_km > standoff_km) != (l.status == "LOST") {
                disagree += 1;
            }
        }
        assert_eq!(
            disagree,
            0,
            "the per-link contour radius disagreed with the report's own status column \
             on {disagree} of {} rows",
            r.links.len()
        );
        assert_eq!(above, lost);

        // Pinned numbers at this exact configuration (kind = lunar-jamming, every input
        // default except jammer.range_m = 25 000 m): the scalar contour 27.402916 km,
        // the band 21.256108 .. 29.921360 km, 8.665251 km wide.
        assert!((b.standoff_median_km - 27.402_916).abs() < 5e-5);
        assert!((b.standoff_p95_km - 21.256_108).abs() < 5e-5);
        assert!((b.standoff_p05_km - 29.921_360).abs() < 5e-5);
        assert!((b.standoff_width_km - 8.665_251).abs() < 5e-5);
        // The two criteria disagree about where the contour is, which is exactly why
        // both are reported: the power-ratio band does not even contain 25 km.
        assert!(c.power_ratio.standoff_p95_km > standoff_km);
    }

    #[test]
    fn a_link_already_below_the_threshold_gets_a_null_contour_point_not_a_number() {
        // Raise the tracking threshold above every link's un-jammed C/N0. No finite J/S
        // denies a link that is already lost, and the report must say so rather than
        // print an infinity or a clamped radius.
        let scn = LunarJammingScenario {
            tracking_threshold_dbhz: 60.0,
            jammer: Some(LunarJammerCfg::default()),
            ..Default::default()
        };
        let r = scn.run().unwrap();
        let c = r.denial_contour.as_ref().unwrap();
        assert!(r.links.iter().all(|l| l.cn0_nominal_dbhz < 60.0));
        assert_eq!(c.n_points_without_loss_of_lock_contour, c.points.len());
        assert!(c.points.iter().all(|p| p.loss_of_lock_js_db.is_none()));
        assert!(c.loss_of_lock.is_none());
        // The power-ratio criterion still has a solution everywhere, so it is still
        // reported — one criterion going undefined does not silence the other.
        assert!(c.power_ratio.standoff_median_km.is_finite());
        let v = serde_json::to_value(&r).unwrap();
        assert!(v["denial_contour"]["loss_of_lock"].is_null());
        assert!(v["denial_contour"]["power_ratio"]["standoff_median_km"].is_number());
    }

    #[test]
    fn a_clean_sky_run_has_no_contour_at_all_rather_than_an_empty_one() {
        let r = LunarJammingScenario::default().run().unwrap();
        assert!(!r.jammer_present);
        assert!(r.denial_contour.is_none());
        let v = serde_json::to_value(&r).unwrap();
        assert!(v.get("denial_contour").is_none());
    }

    #[test]
    fn the_distribution_is_the_tables_own_order_statistics_and_keeps_the_rows() {
        // The distribution must be computed over the same rows the report emits, and
        // emitting it must not have removed them.
        let r = mixed_operating_point().run().unwrap();
        let c = r.denial_contour.as_ref().unwrap();
        let d = &c.cn0_nominal;
        let mut s: Vec<f64> = r.links.iter().map(|l| l.cn0_nominal_dbhz).collect();
        s.sort_by(|a, b| a.partial_cmp(b).unwrap());
        assert_eq!(d.n, r.links.len());
        assert_eq!(d.n, r.fom.n_links);
        assert_eq!(d.min_dbhz.to_bits(), s[0].to_bits());
        assert_eq!(d.max_dbhz.to_bits(), s[s.len() - 1].to_bits());
        assert!(d.min_dbhz <= d.p05_dbhz);
        assert!(d.p05_dbhz <= d.p25_dbhz);
        assert!(d.p25_dbhz <= d.median_dbhz);
        assert!(d.median_dbhz <= d.p75_dbhz);
        assert!(d.p75_dbhz <= d.p95_dbhz);
        assert!(d.p95_dbhz <= d.max_dbhz);
        // The median is the same median the sibling collapse test computes by hand.
        let n = s.len();
        let hand = if n % 2 == 1 {
            s[n / 2]
        } else {
            0.5 * (s[n / 2 - 1] + s[n / 2])
        };
        assert!((d.median_dbhz - hand).abs() < 1e-12);
        // Mean and stdev, recomputed independently.
        let mean = s.iter().sum::<f64>() / n as f64;
        assert!((d.mean_dbhz - mean).abs() < 1e-12);
        let var = s.iter().map(|x| (x - mean).powi(2)).sum::<f64>() / (n - 1) as f64;
        assert!((d.stdev_dbhz - var.sqrt()).abs() < 1e-12);
        // …and the per-link rows are still all there.
        assert_eq!(
            r.links.len(),
            r.epochs.iter().map(|e| e.visible).sum::<usize>()
        );
    }

    #[test]
    fn the_units_block_describes_the_contour_and_names_nothing_the_report_omits() {
        // Forward: every numeric leaf of the contour block carries a unit and a
        // provenance class. Reverse: the block names no field the report does not emit.
        // A units entry nobody emits reads as a guarantee.
        let (json, _s, _svg) = mixed_operating_point().run_output().unwrap();
        let v: serde_json::Value = serde_json::from_str(&json).unwrap();
        let units = v["units"].as_object().expect("a units block");

        let mut emitted: std::collections::HashSet<String> = std::collections::HashSet::new();
        fn walk(v: &serde_json::Value, prefix: &str, out: &mut std::collections::HashSet<String>) {
            match v {
                serde_json::Value::Object(m) => {
                    for (k, val) in m {
                        let p = if prefix.is_empty() {
                            k.clone()
                        } else {
                            format!("{prefix}.{k}")
                        };
                        walk(val, &p, out);
                    }
                }
                serde_json::Value::Array(a) => {
                    for e in a {
                        walk(e, &format!("{prefix}[]"), out);
                    }
                }
                serde_json::Value::Number(_) => {
                    out.insert(prefix.to_string());
                }
                _ => {}
            }
        }
        // `units` describes the document, it is not part of it.
        let mut doc = v.clone();
        doc.as_object_mut().unwrap().remove("units");
        walk(&doc, "", &mut emitted);

        // Forward, over the contour block only — the rest of the document has its own
        // test, unchanged.
        let missing: Vec<&String> = emitted
            .iter()
            .filter(|p| p.starts_with("denial_contour"))
            .filter(|p| !units.contains_key(p.as_str()))
            .collect();
        assert!(
            missing.is_empty(),
            "contour fields with no units entry: {missing:?}"
        );
        assert!(
            emitted
                .iter()
                .filter(|p| p.starts_with("denial_contour"))
                .count()
                >= 40,
            "the contour block should carry the whole distribution and both bands"
        );

        // Reverse, over the whole block: strip the optional `[]` suffix on both sides so
        // the older unsuffixed spellings this module already ships still match.
        let norm = |s: &str| s.replace("[]", "");
        let seen: std::collections::HashSet<String> = emitted.iter().map(|p| norm(p)).collect();
        let orphan: Vec<&str> = UNITS
            .iter()
            .map(|(f, _, _, _)| *f)
            .filter(|f| !seen.contains(&norm(f)))
            .collect();
        assert!(
            orphan.is_empty(),
            "units entries naming fields the report does not emit: {orphan:?}"
        );

        // Every entry is well formed against the shared vocabulary, and every NEW entry
        // states a definition.
        for (path, unit, provenance, note) in UNITS {
            assert!(!unit.is_empty(), "{path} has no unit");
            assert!(
                crate::field_schema::ProvenanceClass::parse(provenance).is_some(),
                "{path} has provenance {provenance:?}, outside the vocabulary"
            );
            if path.starts_with("denial_contour") {
                assert!(!note.is_empty(), "{path} is a new entry with no definition");
            }
        }
    }
}
