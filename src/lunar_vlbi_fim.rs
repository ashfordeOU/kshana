// SPDX-License-Identifier: AGPL-3.0-only
//! Station-coordinate covariance from a lunar-VLBI **schedule** — the Fisher-information
//! accumulation that replaces a modelled equipartition link.
//!
//! [`crate::lunar_vlbi`] already gives the delay observable and its analytic partials;
//! [`crate::fim`] already gives `M = HᵀWH`, its inverse and its rank diagnosis. What was
//! missing between them is the **accumulation**: running the partials over a schedule
//! (baselines × epochs), forming the information matrix, inverting it, and reading the
//! station coordinate covariance off the result. That is what this module does, so the
//! per-coordinate station sigma is a **computed engine output** rather than a scalar delay
//! precision pushed through an assumed geometry factor.
//!
//! ## What is estimated, and in which frame
//!
//! The state vector holds **station coordinates in the Earth-fixed ITRS frame** (metres)
//! and, optionally, the **beacon coordinates in the Moon body-fixed MCMF frame**. Those
//! are the quantities that are constant across the schedule; the inertial positions the
//! delay is a function of are not. The partials chain through the frame rotations:
//!
//! ```text
//! r_gcrs = Mᵀ(t) · r_itrs      ⇒   ∂τ/∂r_itrs = M(t) · ∂τ/∂r_gcrs
//! r_gcrs = r_moon(t) + Bᵀ(t) · r_mcmf ⇒ ∂τ/∂r_mcmf = B(t) · ∂τ/∂r_beacon,gcrs
//! ```
//!
//! with `M(t) = ` [`crate::cio::gcrs_to_itrs_matrix`] and `B(t) = `
//! [`crate::lunar_frame::icrf_to_iau_moon`]. **That chain is where Earth rotation enters,
//! and Earth rotation is the entire reason station coordinates are observable at all.** A
//! single epoch constrains each station only along the (nearly common) line of sight to the
//! Moon; as the Earth turns, `M(t)` sweeps that line of sight around the ITRS polar axis, so
//! the equatorial coordinates fill in over the arc and the polar coordinate fills in only to
//! the extent the beacon's declination is non-zero. The report measures the sweep
//! (`schedule.los_itrs_sweep_deg`) instead of assuming it, and reports the rank and condition
//! number that result.
//!
//! ## The observation, its weight, and what is *not* in the Jacobian
//!
//! One observation is one (baseline, epoch) pair whose **both** stations see the beacon above
//! the elevation mask. Its weight is `1/σ_τ²` for a per-observation delay sigma `σ_τ`, a
//! stated input (the default 1e-11 s is the same illustrative VLBI delay sigma
//! [`crate::lunar_combination`] already uses; it is a representative magnitude, not a measured
//! system spec). The Jacobian rows are the **geometric**-delay partials
//! ([`crate::lunar_vlbi::delay_partials_station1`] / `_station2` / `_beacon`); the differenced
//! Shapiro term of [`crate::lunar_vlbi::vlbi_delay_s`] contributes a partial that is **not**
//! modelled here. That omission is measured rather than asserted: the report's
//! `jacobian.neglected_shapiro_partial_fraction` finite-differences the full delay with and
//! without the Shapiro term and prints the largest relative row difference it produces.
//!
//! ## Closure: baselines are not independent
//!
//! For a common beacon the geometric delay obeys `τ_ik = τ_ij + τ_jk` exactly, so of the
//! `n(n−1)/2` baselines an `n`-station network forms, only `n−1` are geometrically
//! independent at any epoch. The redundant ones still **add information** (their noise is
//! independent) but can never **add rank**. The report prints both counts, and the module's
//! tests pin the identity and its consequence.
//!
//! ## Datum
//!
//! A free network of station coordinates observed through range differences to one source has
//! a datum defect: translating the whole network along the line of sight barely changes any
//! delay. The scenario therefore reports the **free-network** rank, defect and null space in
//! every run, and takes a `datum` input deciding what the headline covariance is computed on:
//! `anchor-first-station` (the default — station 1 held fixed, so the remaining coordinates
//! are estimated *relative to it*, which is what a VLBI session actually delivers without an
//! external datum) or `free-network` (nothing held; the headline is then reported on the
//! observable subspace through the pseudo-inverse, and flagged as such). When the information
//! matrix is rank-deficient the headline sigma is reported as **null with a status**, never as
//! a number read out of a near-singular inverse.
//!
//! ## The equipartition comparison
//!
//! The modelled link this module exists to remove converts a scalar delay precision straight
//! into a per-coordinate station sigma by assuming the information is spread isotropically over
//! `g = 3` coordinate directions:
//!
//! ```text
//! σ_equipartition = c · σ_τ · sqrt(g / N_obs),      g = 3.
//! ```
//!
//! That is not an arbitrary comparison: it is the **isotropic limit of this very schedule**. For
//! a `p`-parameter state the arithmetic-mean/harmonic-mean inequality gives
//! `trace(M⁻¹)/p ≥ p/trace(M)`, with equality exactly when every eigenvalue of `M` is equal —
//! so `sqrt(p / trace(M))` is a hard lower bound on the computed RMS per-coordinate sigma, and
//! `c·σ_τ·sqrt(3/N)` coincides with it for a single station whose rows are unit-norm/c. The
//! computed-over-equipartition **ratio is therefore ≥ 1 and is precisely the anisotropy the
//! assumption was throwing away.** Both the literal `g = 3` value and the trace bound for the
//! same schedule are emitted beside the computed value, with both ratios.
//!
//! ## Honesty / scope (MODELLED)
//!
//! Everything [`crate::lunar_vlbi`] disclaims applies unchanged: polar motion is dropped, the
//! beacon mixes a mean-equator-of-date Moon series with an ICRF body-fixed offset with
//! `jd_tdb ≈ jd_tt`, and there is no light-time iteration, media (troposphere, ionosphere,
//! plasma) or aberration term. On top of that, this module holds the Moon's **centre**
//! ephemeris, the station clocks and every media/Earth-orientation parameter **fixed**: a real
//! session estimates clocks and troposphere alongside the coordinates, and doing so would
//! *raise* the reported sigmas. The covariance is therefore a Cramér–Rao bound for the stated
//! reduced parameter set, not a predicted session result, and the delay sigma, the station
//! coordinates and the schedule are inputs, not a flown campaign. No TRL, flight heritage or
//! agency endorsement is claimed.

use crate::fim::{crlb, design_metrics, information_matrix};
use crate::frames::Geodetic;
use crate::lunar::Selenographic;
use crate::lunar_vlbi::{
    beacon_inertial_position, delay_partials_beacon, delay_partials_station1,
    delay_partials_station2, station_inertial_position, vlbi_delay_s,
};
use crate::precession::{mat_vec, transpose, Mat3, Vec3};
use serde::Deserialize;

/// Speed of light (m/s) — the constant every delay partial is expressed through.
const C: f64 = crate::timegeo::C_M_PER_S;

/// The report's honesty label.
const LABEL: &str = "MODELLED lunar-VLBI station-coordinate covariance. The covariance is \
accumulated from the engine's own analytic delay partials over an explicit schedule of \
baselines and epochs and inverted; it is NOT converted from a scalar delay precision by an \
assumed geometry factor. The per-observation delay sigma, the station coordinates, the beacon \
site and the schedule are inputs. The Moon-centre ephemeris, the station clocks, the \
troposphere and the Earth-orientation parameters are held FIXED: a real session estimates \
those alongside the coordinates and the sigmas would rise. Observations are treated as \
independent, which a correlated troposphere and clock are not. Cramer-Rao bound for the \
stated reduced parameter set, not a predicted session result. Not a geodetic product.";

// ---------------------------------------------------------------------------
// Small vector helpers (kept local, as the rest of the lunar-VLBI code does).
// ---------------------------------------------------------------------------

/// Vector difference `a − b`.
fn sub(a: Vec3, b: Vec3) -> Vec3 {
    [a[0] - b[0], a[1] - b[1], a[2] - b[2]]
}

/// Vector sum `a + b`.
fn add(a: Vec3, b: Vec3) -> Vec3 {
    [a[0] + b[0], a[1] + b[1], a[2] + b[2]]
}

/// Euclidean norm `|v|`.
fn norm(v: Vec3) -> f64 {
    (v[0] * v[0] + v[1] * v[1] + v[2] * v[2]).sqrt()
}

/// `v` scaled to unit length; the zero vector is returned unchanged.
fn unit(v: Vec3) -> Vec3 {
    let n = norm(v);
    if n == 0.0 {
        v
    } else {
        [v[0] / n, v[1] / n, v[2] / n]
    }
}

/// Dot product `a · b`.
fn dot(a: Vec3, b: Vec3) -> f64 {
    a[0] * b[0] + a[1] * b[1] + a[2] * b[2]
}

// ---------------------------------------------------------------------------
// Epoch geometry.
// ---------------------------------------------------------------------------

/// The frozen geometry of one schedule epoch: every position the delay and its partials
/// need, plus the two frame rotations the partials are chained through.
#[derive(Clone, Debug)]
pub struct EpochGeometry {
    /// Hours from the schedule epoch.
    pub t_hours: f64,
    /// Terrestrial Time Julian date of this epoch.
    pub jd_tt: f64,
    /// UT1 Julian date of this epoch (the Earth-rotation argument).
    pub jd_ut1: f64,
    /// Station geocentric-inertial (GCRS) positions (m), in schedule order.
    pub stations_inertial: Vec<Vec3>,
    /// Beacon geocentric-inertial (GCRS) position (m).
    pub beacon_inertial: Vec3,
    /// Geocentric-inertial position of the Moon's centre (m) — the origin the body-fixed
    /// beacon offset is added to.
    pub moon_inertial: Vec3,
    /// GCRS→ITRS rotation at this epoch: the Earth rotation that makes station coordinates
    /// observable across the arc.
    pub gcrs_to_itrs: Mat3,
    /// ICRF→Moon-body-fixed rotation at this epoch.
    pub icrf_to_moon: Mat3,
}

impl EpochGeometry {
    /// A station's Earth-fixed (ITRS) position (m) at this epoch — the inertial position
    /// rotated back through [`Self::gcrs_to_itrs`]. Constant across the schedule up to the
    /// frame model, and the quantity the state vector actually carries.
    pub fn station_itrs(&self, station: usize) -> Vec3 {
        mat_vec(&self.gcrs_to_itrs, self.stations_inertial[station])
    }

    /// The beacon's Moon-body-fixed (MCMF) position (m) at this epoch.
    pub fn beacon_mcmf(&self) -> Vec3 {
        mat_vec(
            &self.icrf_to_moon,
            sub(self.beacon_inertial, self.moon_inertial),
        )
    }

    /// The beacon's Earth-fixed (ITRS) position (m) — what an elevation test needs.
    pub fn beacon_itrs(&self) -> Vec3 {
        mat_vec(&self.gcrs_to_itrs, self.beacon_inertial)
    }
}

/// Build the geometry of one epoch `t_hours` after the UTC Julian date `jd_utc_epoch`.
///
/// The GCRS→ITRS matrix stored on the result is built with the same arguments
/// ([`crate::cio::gcrs_to_itrs_matrix`] with zero polar motion) that
/// [`crate::lunar_vlbi::station_inertial_position`] uses internally, so rotating a station's
/// inertial position back through it reproduces its Earth-fixed position exactly.
pub fn epoch_geometry(
    stations: &[Geodetic],
    beacon: Selenographic,
    jd_utc_epoch: f64,
    t_hours: f64,
) -> EpochGeometry {
    let jd_utc = jd_utc_epoch + t_hours / 24.0;
    let jd_tt = crate::timescales::utc_to_tt(jd_utc);
    let jd_ut1 = crate::timescales::utc_to_ut1(jd_utc, 0.0);
    let t_tt_jc = (jd_tt - crate::timescales::JD_J2000) / 36_525.0;
    EpochGeometry {
        t_hours,
        jd_tt,
        jd_ut1,
        stations_inertial: stations
            .iter()
            .map(|&g| station_inertial_position(g, jd_tt, jd_ut1))
            .collect(),
        beacon_inertial: beacon_inertial_position(beacon, jd_tt),
        moon_inertial: crate::ephem::moon_position(t_tt_jc),
        gcrs_to_itrs: crate::cio::gcrs_to_itrs_matrix(jd_tt, jd_ut1, 0.0, 0.0),
        icrf_to_moon: crate::lunar_frame::icrf_to_iau_moon(jd_tt),
    }
}

// ---------------------------------------------------------------------------
// State layout.
// ---------------------------------------------------------------------------

/// Which parameters the state vector carries and where each sits in it.
///
/// Station coordinates are Earth-fixed (ITRS) metres, three per estimated station in
/// schedule order; the optional beacon coordinates are Moon-body-fixed (MCMF) metres and
/// occupy the last three slots. A station named in `held_fixed` contributes no columns — it
/// is the datum anchor, and the remaining coordinates are estimated relative to it.
#[derive(Clone, Debug, PartialEq, Eq)]
pub struct StateLayout {
    station_slot: Vec<Option<usize>>,
    beacon_slot: Option<usize>,
    dim: usize,
}

impl StateLayout {
    /// Lay out a state over `n_stations` stations, holding the indices in `held_fixed`
    /// fixed and appending three beacon columns when `estimate_beacon` is set.
    pub fn new(n_stations: usize, held_fixed: &[usize], estimate_beacon: bool) -> StateLayout {
        let mut station_slot = Vec::with_capacity(n_stations);
        let mut dim = 0usize;
        for s in 0..n_stations {
            if held_fixed.contains(&s) {
                station_slot.push(None);
            } else {
                station_slot.push(Some(dim));
                dim += 3;
            }
        }
        let beacon_slot = if estimate_beacon {
            let o = dim;
            dim += 3;
            Some(o)
        } else {
            None
        };
        StateLayout {
            station_slot,
            beacon_slot,
            dim,
        }
    }

    /// The state dimension `p`.
    pub fn dim(&self) -> usize {
        self.dim
    }

    /// The column offset of station `s`, or `None` when it is held fixed.
    pub fn station_offset(&self, s: usize) -> Option<usize> {
        self.station_slot.get(s).copied().flatten()
    }

    /// The column offset of the beacon block, or `None` when the beacon is held fixed.
    pub fn beacon_offset(&self) -> Option<usize> {
        self.beacon_slot
    }

    /// The indices of the stations this layout estimates, in schedule order.
    pub fn estimated_stations(&self) -> Vec<usize> {
        self.station_slot
            .iter()
            .enumerate()
            .filter_map(|(s, slot)| slot.map(|_| s))
            .collect()
    }
}

// ---------------------------------------------------------------------------
// Jacobian accumulation.
// ---------------------------------------------------------------------------

/// One scheduled observation: the delay on baseline `(station1, station2)` at epoch index
/// `epoch`.
#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub struct Observation {
    /// Index into the epoch-geometry slice.
    pub epoch: usize,
    /// First station of the baseline (the one the delay is differenced *from*).
    pub station1: usize,
    /// Second station of the baseline.
    pub station2: usize,
}

/// The Jacobian row of one observation in the estimated state's coordinates.
///
/// The geometric-delay partials of [`crate::lunar_vlbi`] are rotated out of the inertial
/// frame into the frames the state is carried in: `M(t)` for the Earth-fixed station
/// coordinates, `B(t)` for the Moon-body-fixed beacon coordinates. Units are s/m.
///
/// Panics in a debug build on a degenerate baseline (`station1 == station2`), which carries
/// no information and would alias its own two column writes.
pub fn jacobian_row(
    geom: &EpochGeometry,
    layout: &StateLayout,
    station1: usize,
    station2: usize,
) -> Vec<f64> {
    debug_assert_ne!(station1, station2, "a baseline needs two distinct stations");
    let mut row = vec![0.0; layout.dim()];
    let r1 = geom.stations_inertial[station1];
    let r2 = geom.stations_inertial[station2];
    let rb = geom.beacon_inertial;
    if let Some(o) = layout.station_offset(station1) {
        let e = mat_vec(&geom.gcrs_to_itrs, delay_partials_station1(r1, rb));
        row[o..o + 3].copy_from_slice(&e);
    }
    if let Some(o) = layout.station_offset(station2) {
        let e = mat_vec(&geom.gcrs_to_itrs, delay_partials_station2(r2, rb));
        row[o..o + 3].copy_from_slice(&e);
    }
    if let Some(o) = layout.beacon_offset() {
        let e = mat_vec(&geom.icrf_to_moon, delay_partials_beacon(r1, r2, rb));
        row[o..o + 3].copy_from_slice(&e);
    }
    row
}

/// The whole schedule's Jacobian: one row per observation, in observation order.
pub fn schedule_jacobian(
    geoms: &[EpochGeometry],
    observations: &[Observation],
    layout: &StateLayout,
) -> Vec<Vec<f64>> {
    observations
        .iter()
        .map(|o| jacobian_row(&geoms[o.epoch], layout, o.station1, o.station2))
        .collect()
}

/// The VLBI delay (s) of one observation recomputed **from the state's own coordinates** —
/// Earth-fixed station positions and a Moon-body-fixed beacon position — by rotating them
/// forward into the inertial frame and calling [`crate::lunar_vlbi::vlbi_delay_s`].
///
/// This is the independent route the analytic Jacobian is finite-differenced against: it
/// never touches a partial derivative, and it exercises the same frame chain the analytic
/// row asserts.
pub fn delay_from_state(
    geom: &EpochGeometry,
    stations_itrs: &[Vec3],
    beacon_mcmf: Vec3,
    station1: usize,
    station2: usize,
    with_shapiro: bool,
) -> f64 {
    let m_t = transpose(&geom.gcrs_to_itrs);
    let b_t = transpose(&geom.icrf_to_moon);
    let r1 = mat_vec(&m_t, stations_itrs[station1]);
    let r2 = mat_vec(&m_t, stations_itrs[station2]);
    let rb = add(geom.moon_inertial, mat_vec(&b_t, beacon_mcmf));
    vlbi_delay_s(r1, r2, rb, 0.0, 0.0, with_shapiro)
}

/// The central finite-difference Jacobian row of one observation, stepping each estimated
/// coordinate by `step_m` and re-evaluating [`delay_from_state`].
///
/// The independent oracle for [`jacobian_row`], and (with `with_shapiro` toggled) the way the
/// report measures the size of the Shapiro partial the analytic row leaves out.
pub fn finite_difference_row(
    geom: &EpochGeometry,
    layout: &StateLayout,
    station1: usize,
    station2: usize,
    step_m: f64,
    with_shapiro: bool,
) -> Vec<f64> {
    let n_stations = geom.stations_inertial.len();
    let base_stations: Vec<Vec3> = (0..n_stations).map(|s| geom.station_itrs(s)).collect();
    let base_beacon = geom.beacon_mcmf();
    let mut row = vec![0.0; layout.dim()];
    let fd = |plus: (&[Vec3], Vec3), minus: (&[Vec3], Vec3)| -> f64 {
        let hi = delay_from_state(geom, plus.0, plus.1, station1, station2, with_shapiro);
        let lo = delay_from_state(geom, minus.0, minus.1, station1, station2, with_shapiro);
        (hi - lo) / (2.0 * step_m)
    };
    for s in 0..n_stations {
        let Some(o) = layout.station_offset(s) else {
            continue;
        };
        for axis in 0..3 {
            let mut plus = base_stations.clone();
            let mut minus = base_stations.clone();
            plus[s][axis] += step_m;
            minus[s][axis] -= step_m;
            row[o + axis] = fd((&plus, base_beacon), (&minus, base_beacon));
        }
    }
    if let Some(o) = layout.beacon_offset() {
        for axis in 0..3 {
            let mut plus = base_beacon;
            let mut minus = base_beacon;
            plus[axis] += step_m;
            minus[axis] -= step_m;
            row[o + axis] = fd((&base_stations, plus), (&base_stations, minus));
        }
    }
    row
}

// ---------------------------------------------------------------------------
// Datum choice.
// ---------------------------------------------------------------------------

/// What the headline covariance is computed on.
#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub enum Datum {
    /// Station 1 held fixed: the remaining station coordinates are estimated relative to
    /// it, which is what a VLBI session delivers without an external datum.
    AnchorFirstStation,
    /// Nothing held fixed. The free network keeps its datum defect, so the headline is
    /// reported on the observable subspace (pseudo-inverse) and flagged.
    FreeNetwork,
}

impl Datum {
    /// The TOML spelling.
    pub fn as_str(self) -> &'static str {
        match self {
            Datum::AnchorFirstStation => "anchor-first-station",
            Datum::FreeNetwork => "free-network",
        }
    }

    /// Parse the TOML spelling, rejecting anything else rather than defaulting.
    pub fn parse(name: &str) -> Result<Datum, String> {
        match name {
            "anchor-first-station" => Ok(Datum::AnchorFirstStation),
            "free-network" => Ok(Datum::FreeNetwork),
            other => Err(format!(
                "unknown datum {other:?}: expected \"anchor-first-station\" or \"free-network\""
            )),
        }
    }

    /// The station indices this datum holds fixed.
    pub fn held_fixed(self) -> Vec<usize> {
        match self {
            Datum::AnchorFirstStation => vec![0],
            Datum::FreeNetwork => vec![],
        }
    }
}

// ---------------------------------------------------------------------------
// Scenario inputs.
// ---------------------------------------------------------------------------

/// One ground station of the network, as the TOML declares it.
#[derive(Clone, Debug, Deserialize)]
pub struct StationInput {
    /// Station label used in the report. Defaults to `station-<n>` in declaration order.
    pub name: Option<String>,
    /// Geodetic latitude (deg).
    pub lat_deg: f64,
    /// Geodetic longitude (deg).
    pub lon_deg: f64,
    /// Altitude above the WGS-84 ellipsoid (m). Defaults to 0.
    pub alt_m: Option<f64>,
}

/// The illustrative default network: the three DSN-flavoured Earth sites the crate already
/// carries (`lunar_combination`'s station table, itself the two `lunar-vlbi` defaults plus
/// Madrid). Round public complex coordinates, **not** surveyed ITRF positions.
const DEFAULT_STATIONS: [(&str, f64, f64, f64); 3] = [
    ("goldstone-like", 40.4256, -116.8893, 1000.0),
    ("canberra-like", -35.4014, 148.9819, 688.0),
    ("madrid-like", 40.4314, -4.2481, 837.0),
];

/// A runnable lunar-VLBI Fisher-information scenario: a network of Earth stations observing
/// one lunar-surface beacon over a schedule of epochs, accumulated into a station-coordinate
/// covariance. The TOML `kind = "lunar-vlbi-fim"` entry the engine dispatches to
/// [`LunarVlbiFimScenario::run_json`].
#[derive(Clone, Debug, Default, Deserialize)]
pub struct LunarVlbiFimScenario {
    /// The station network. Defaults to the three-site illustrative network.
    pub stations: Option<Vec<StationInput>>,
    /// Beacon selenographic latitude (deg). Default 0.
    pub beacon_lat_deg: Option<f64>,
    /// Beacon selenographic longitude (deg). Default 0.
    pub beacon_lon_deg: Option<f64>,
    /// Beacon altitude above the mean lunar sphere (m). Default 0.
    pub beacon_alt_m: Option<f64>,
    /// Schedule start, UTC year. Default 2024.
    pub epoch_year: Option<i32>,
    /// Schedule start, UTC month. Default 1.
    pub epoch_month: Option<u32>,
    /// Schedule start, UTC day. Default 1.
    pub epoch_day: Option<u32>,
    /// Schedule length (hours). Default 24 — a full Earth rotation, so the line of sight
    /// sweeps the whole ITRS cone.
    pub arc_hours: Option<f64>,
    /// Sampling step (minutes). Default 30.
    pub step_min: Option<f64>,
    /// Per-observation delay sigma (s). Default 1e-11.
    pub delay_sigma_s: Option<f64>,
    /// Elevation mask (deg) both stations of a baseline must clear. Default 10.
    pub elevation_mask_deg: Option<f64>,
    /// Datum: `anchor-first-station` (default) or `free-network`.
    pub datum: Option<String>,
    /// Estimate the beacon's Moon-body-fixed coordinates alongside the stations. Default
    /// false.
    pub estimate_beacon: Option<bool>,
    /// Relative eigenvalue threshold separating observable directions from the datum
    /// defect. Default 1e-9.
    pub rel_tol: Option<f64>,
    /// The `g` of the equipartition link being compared against. Default 3.
    pub equipartition_g: Option<f64>,
}

/// Defaults, one accessor each, so the resolved value and the documented default can never
/// drift apart.
impl LunarVlbiFimScenario {
    fn resolved_stations(&self) -> Result<Vec<(String, Geodetic)>, String> {
        let raw: Vec<(String, f64, f64, f64)> = match &self.stations {
            None => DEFAULT_STATIONS
                .iter()
                .map(|&(n, lat, lon, alt)| (n.to_string(), lat, lon, alt))
                .collect(),
            Some(v) => v
                .iter()
                .enumerate()
                .map(|(i, s)| {
                    (
                        s.name
                            .clone()
                            .unwrap_or_else(|| format!("station-{}", i + 1)),
                        s.lat_deg,
                        s.lon_deg,
                        s.alt_m.unwrap_or(0.0),
                    )
                })
                .collect(),
        };
        if raw.len() < 2 {
            return Err(format!(
                "a VLBI schedule needs at least 2 stations to form a baseline, got {}",
                raw.len()
            ));
        }
        for (name, lat, lon, alt) in &raw {
            if !lat.is_finite() || !lon.is_finite() || !alt.is_finite() {
                return Err(format!("station {name:?} has a non-finite coordinate"));
            }
            if !(-90.0..=90.0).contains(lat) {
                return Err(format!(
                    "station {name:?} latitude {lat} deg is outside [-90, 90]"
                ));
            }
        }
        Ok(raw
            .into_iter()
            .map(|(name, lat, lon, alt)| {
                (
                    name,
                    Geodetic {
                        lat_rad: lat.to_radians(),
                        lon_rad: lon.to_radians(),
                        alt_m: alt,
                    },
                )
            })
            .collect())
    }

    fn resolved_beacon(&self) -> Result<Selenographic, String> {
        let lat = self.beacon_lat_deg.unwrap_or(0.0);
        let lon = self.beacon_lon_deg.unwrap_or(0.0);
        let alt = self.beacon_alt_m.unwrap_or(0.0);
        if !lat.is_finite() || !lon.is_finite() || !alt.is_finite() {
            return Err("beacon coordinates must be finite".to_string());
        }
        if !(-90.0..=90.0).contains(&lat) {
            return Err(format!("beacon latitude {lat} deg is outside [-90, 90]"));
        }
        Ok(Selenographic {
            lat_rad: lat.to_radians(),
            lon_rad: lon.to_radians(),
            alt_m: alt,
        })
    }

    fn resolved_schedule(&self) -> Result<(f64, f64, usize), String> {
        let arc = self.arc_hours.unwrap_or(24.0);
        let step = self.step_min.unwrap_or(30.0);
        if !arc.is_finite() || arc <= 0.0 {
            return Err(format!("arc_hours must be positive and finite, got {arc}"));
        }
        if !step.is_finite() || step <= 0.0 {
            return Err(format!("step_min must be positive and finite, got {step}"));
        }
        let step_h = step / 60.0;
        let n = (arc / step_h).floor() as usize;
        if n > 20_000 {
            return Err(format!(
                "schedule of {} epochs is beyond this scenario's 20000-epoch guard; \
                 lengthen step_min or shorten arc_hours",
                n + 1
            ));
        }
        Ok((arc, step, n + 1))
    }

    fn resolved_sigma(&self) -> Result<f64, String> {
        let s = self.delay_sigma_s.unwrap_or(1.0e-11);
        if !s.is_finite() || s <= 0.0 {
            return Err(format!(
                "delay_sigma_s must be positive and finite, got {s}"
            ));
        }
        Ok(s)
    }

    fn resolved_mask(&self) -> Result<f64, String> {
        let m = self.elevation_mask_deg.unwrap_or(10.0);
        if !m.is_finite() || !(-90.0..90.0).contains(&m) {
            return Err(format!(
                "elevation_mask_deg must be finite and in [-90, 90), got {m}"
            ));
        }
        Ok(m)
    }

    fn resolved_rel_tol(&self) -> Result<f64, String> {
        let t = self.rel_tol.unwrap_or(1.0e-9);
        if !t.is_finite() || !(0.0..1.0).contains(&t) {
            return Err(format!("rel_tol must be finite and in [0, 1), got {t}"));
        }
        Ok(t)
    }

    fn resolved_g(&self) -> Result<f64, String> {
        let g = self.equipartition_g.unwrap_or(3.0);
        if !g.is_finite() || g <= 0.0 {
            return Err(format!(
                "equipartition_g must be positive and finite, got {g}"
            ));
        }
        Ok(g)
    }
}

// ---------------------------------------------------------------------------
// The solved schedule.
// ---------------------------------------------------------------------------

/// The covariance solution for one state layout: what [`crlb`] found, plus the conditioning
/// and the per-coordinate summary read off it.
#[derive(Clone, Debug)]
pub struct CovarianceSolution {
    /// State dimension `p`.
    pub dim: usize,
    /// Numerical rank of the information matrix.
    pub rank: usize,
    /// Datum-defect dimension `p − rank`.
    pub defect: usize,
    /// Eigenvalues of the information matrix (1/m²), ascending.
    pub eigenvalues: Vec<f64>,
    /// `trace(M)` (1/m²).
    pub trace_information: f64,
    /// Condition number over the observable subspace (dimensionless; `+∞` when empty).
    pub condition: f64,
    /// Null-space basis of the information matrix, as columns.
    pub null_space: Vec<Vec<f64>>,
    /// The covariance actually used: `M⁻¹` at full rank, otherwise the pseudo-inverse `M⁺`
    /// restricted to the observable subspace.
    pub covariance: Vec<Vec<f64>>,
    /// True when the covariance is the full-rank inverse rather than a pseudo-inverse.
    pub full_rank: bool,
    /// Per-parameter standard deviations (m): the square root of the covariance diagonal.
    pub sigma: Vec<f64>,
}

/// Solve one layout's information matrix into a [`CovarianceSolution`].
pub fn solve_covariance(info: &[Vec<f64>], rel_tol: f64) -> CovarianceSolution {
    let c = crlb(info, rel_tol);
    let dm = design_metrics(info, rel_tol);
    let trace_information = (0..info.len()).map(|i| info[i][i]).sum();
    let covariance = c
        .covariance
        .clone()
        .unwrap_or_else(|| c.pseudo_covariance.clone());
    CovarianceSolution {
        dim: c.n,
        rank: c.rank,
        defect: c.defect,
        eigenvalues: c.eigenvalues.clone(),
        trace_information,
        condition: dm.condition,
        null_space: c.null_space.clone(),
        covariance,
        full_rank: c.defect == 0,
        sigma: c.crlb_std.clone(),
    }
}

impl CovarianceSolution {
    /// The RMS per-coordinate sigma (m) over the whole state: `sqrt(trace(C)/p)`.
    pub fn rms_per_coordinate_sigma_m(&self) -> f64 {
        let all: Vec<usize> = (0..self.dim).collect();
        self.rms_sigma_over(&all)
    }

    /// The RMS per-coordinate sigma (m) over a subset of the state's columns — how the
    /// station coordinates are summarised when the state also carries the beacon.
    pub fn rms_sigma_over(&self, columns: &[usize]) -> f64 {
        if columns.is_empty() {
            return f64::NAN;
        }
        let tr: f64 = columns.iter().map(|&i| self.covariance[i][i]).sum();
        (tr / columns.len() as f64).sqrt()
    }

    /// The isotropic limit of this same information matrix, `sqrt(p / trace(M))` — a hard
    /// arithmetic-mean/harmonic-mean lower bound on [`Self::rms_per_coordinate_sigma_m`],
    /// attained exactly when every eigenvalue is equal.
    pub fn isotropic_trace_bound_m(&self) -> f64 {
        if self.dim == 0 || self.trace_information <= 0.0 {
            return f64::NAN;
        }
        (self.dim as f64 / self.trace_information).sqrt()
    }
}

/// The per-coordinate station sigma an isotropic-equipartition link produces for a schedule
/// of `n_obs` observations at delay sigma `delay_sigma_s`, spreading the information equally
/// over `g` coordinate directions: `σ = c · σ_τ · sqrt(g / N)`.
///
/// This is the modelled link the Fisher accumulation replaces, kept in the engine so the
/// comparison is computed rather than quoted.
pub fn equipartition_sigma_m(delay_sigma_s: f64, n_obs: usize, g: f64) -> f64 {
    if n_obs == 0 {
        return f64::INFINITY;
    }
    C * delay_sigma_s * (g / n_obs as f64).sqrt()
}

// ---------------------------------------------------------------------------
// The run.
// ---------------------------------------------------------------------------

/// Everything one run computed, before it is rendered.
struct Computed {
    json: serde_json::Value,
    summary: String,
}

impl LunarVlbiFimScenario {
    /// Run the scenario, returning `(json, summary)`.
    pub fn run_json(&self) -> Result<(String, String), String> {
        let c = self.compute()?;
        let json = serde_json::to_string_pretty(&c.json)
            .map_err(|e| format!("serializing lunar-vlbi-fim result: {e}"))?;
        Ok((json, c.summary))
    }

    /// Build the schedule: the epoch geometries and the feasible (baseline, epoch)
    /// observations, with the elevation mask applied at both ends of every baseline.
    ///
    /// Public because the accumulation is only meaningful next to the schedule that
    /// produced it, and a caller reproducing the covariance needs the same observation set.
    pub fn schedule(&self) -> Result<(Vec<EpochGeometry>, Vec<Observation>), String> {
        let stations = self.resolved_stations()?;
        let beacon = self.resolved_beacon()?;
        let (_arc, step_min, n_epochs) = self.resolved_schedule()?;
        let mask = self.resolved_mask()?;
        let geodetics: Vec<Geodetic> = stations.iter().map(|(_, g)| *g).collect();
        let jd_utc_epoch = crate::timescales::julian_date(
            self.epoch_year.unwrap_or(2024),
            self.epoch_month.unwrap_or(1),
            self.epoch_day.unwrap_or(1),
            0,
            0,
            0.0,
        );
        let step_h = step_min / 60.0;
        let geoms: Vec<EpochGeometry> = (0..n_epochs)
            .map(|k| epoch_geometry(&geodetics, beacon, jd_utc_epoch, k as f64 * step_h))
            .collect();
        let mut observations = Vec::new();
        for (e, geom) in geoms.iter().enumerate() {
            let beacon_itrs = geom.beacon_itrs();
            let visible: Vec<bool> = geodetics
                .iter()
                .map(|&g| crate::frames::is_visible(g, beacon_itrs, mask))
                .collect();
            for i in 0..geodetics.len() {
                for j in (i + 1)..geodetics.len() {
                    if visible[i] && visible[j] {
                        observations.push(Observation {
                            epoch: e,
                            station1: i,
                            station2: j,
                        });
                    }
                }
            }
        }
        Ok((geoms, observations))
    }

    #[allow(clippy::too_many_lines)]
    fn compute(&self) -> Result<Computed, String> {
        let stations = self.resolved_stations()?;
        let n_stations = stations.len();
        let (arc, step_min, n_epochs) = self.resolved_schedule()?;
        let sigma = self.resolved_sigma()?;
        let mask = self.resolved_mask()?;
        let rel_tol = self.resolved_rel_tol()?;
        let g = self.resolved_g()?;
        let datum = Datum::parse(
            self.datum
                .as_deref()
                .unwrap_or(Datum::AnchorFirstStation.as_str()),
        )?;
        let estimate_beacon = self.estimate_beacon.unwrap_or(false);

        let (geoms, observations) = self.schedule()?;
        let n_obs = observations.len();
        if n_obs == 0 {
            return Err(format!(
                "no observation in the schedule clears the {mask} deg elevation mask at both \
                 ends of a baseline: {n_epochs} epochs x {} baselines all rejected. Lengthen \
                 arc_hours, lower elevation_mask_deg, or move the stations.",
                n_stations * (n_stations - 1) / 2
            ));
        }

        let weights = vec![1.0 / (sigma * sigma); n_obs];
        let free_layout = StateLayout::new(n_stations, &[], estimate_beacon);
        let used_layout = StateLayout::new(n_stations, &datum.held_fixed(), estimate_beacon);
        if used_layout.dim() == 0 {
            return Err("the datum leaves no parameter to estimate".to_string());
        }

        let free_info = information_matrix(
            &schedule_jacobian(&geoms, &observations, &free_layout),
            &weights,
        );
        let free = solve_covariance(&free_info, rel_tol);

        let jac = schedule_jacobian(&geoms, &observations, &used_layout);
        let info = information_matrix(&jac, &weights);
        let used = solve_covariance(&info, rel_tol);

        // --- The Shapiro partial the analytic Jacobian leaves out, measured. ---
        let shapiro_fraction = {
            let o = observations[0];
            let step = 1.0;
            let with = finite_difference_row(
                &geoms[o.epoch],
                &used_layout,
                o.station1,
                o.station2,
                step,
                true,
            );
            let without = finite_difference_row(
                &geoms[o.epoch],
                &used_layout,
                o.station1,
                o.station2,
                step,
                false,
            );
            let scale = without
                .iter()
                .fold(0.0_f64, |m, v| m.max(v.abs()))
                .max(f64::MIN_POSITIVE);
            with.iter()
                .zip(without.iter())
                .fold(0.0_f64, |m, (a, b)| m.max((a - b).abs()))
                / scale
        };

        // --- Earth rotation actually exercised, measured rather than assumed. ---
        let los_first = unit(mat_vec(&geoms[0].gcrs_to_itrs, geoms[0].beacon_inertial));
        let last = &geoms[geoms.len() - 1];
        let los_last = unit(mat_vec(&last.gcrs_to_itrs, last.beacon_inertial));
        let los_sweep_deg = dot(los_first, los_last)
            .clamp(-1.0, 1.0)
            .acos()
            .to_degrees();
        let mut los_max_sweep_deg: f64 = 0.0;
        for a in &geoms {
            let ua = unit(mat_vec(&a.gcrs_to_itrs, a.beacon_inertial));
            let c = dot(los_first, ua).clamp(-1.0, 1.0).acos().to_degrees();
            los_max_sweep_deg = los_max_sweep_deg.max(c);
        }
        let beacon_declination_deg = {
            let u = unit(geoms[0].beacon_inertial);
            u[2].clamp(-1.0, 1.0).asin().to_degrees()
        };

        // --- Per-epoch rows. ---
        let epoch_rows: Vec<serde_json::Value> = geoms
            .iter()
            .enumerate()
            .map(|(e, geom)| {
                let beacon_itrs = geom.beacon_itrs();
                let elevations: Vec<f64> = stations
                    .iter()
                    .map(|(_, g)| crate::frames::elevation(*g, beacon_itrs).to_degrees())
                    .collect();
                let n = observations.iter().filter(|o| o.epoch == e).count();
                let u = unit(beacon_itrs);
                serde_json::json!({
                    "t_hours": geom.t_hours,
                    "beacon_range_km": norm(geom.beacon_inertial) / 1e3,
                    "elevation_deg": elevations,
                    "los_itrs_unit": [u[0], u[1], u[2]],
                    "observations": n,
                })
            })
            .collect();

        // --- Baseline table. ---
        let mut baseline_rows = Vec::new();
        for i in 0..n_stations {
            for j in (i + 1)..n_stations {
                let n = observations
                    .iter()
                    .filter(|o| o.station1 == i && o.station2 == j)
                    .count();
                let len_km = norm(sub(
                    geoms[0].stations_inertial[j],
                    geoms[0].stations_inertial[i],
                )) / 1e3;
                baseline_rows.push(serde_json::json!({
                    "station1": stations[i].0,
                    "station2": stations[j].0,
                    "length_km": len_km,
                    "observations": n,
                }));
            }
        }

        // --- Station covariance table. ---
        let station_rows: Vec<serde_json::Value> = stations
            .iter()
            .enumerate()
            .map(|(s, (name, geo))| match used_layout.station_offset(s) {
                None => serde_json::json!({
                    "name": name,
                    "lat_deg": geo.lat_rad.to_degrees(),
                    "lon_deg": geo.lon_rad.to_degrees(),
                    "alt_m": geo.alt_m,
                    "estimated": false,
                    "role": "datum anchor - held fixed, contributes no column",
                }),
                Some(o) => {
                    let sx = used.sigma[o];
                    let sy = used.sigma[o + 1];
                    let sz = used.sigma[o + 2];
                    serde_json::json!({
                        "name": name,
                        "lat_deg": geo.lat_rad.to_degrees(),
                        "lon_deg": geo.lon_rad.to_degrees(),
                        "alt_m": geo.alt_m,
                        "estimated": true,
                        "role": "estimated",
                        "sigma_x_m": sx,
                        "sigma_y_m": sy,
                        "sigma_z_m": sz,
                        "sigma_3d_m": (sx * sx + sy * sy + sz * sz).sqrt(),
                    })
                }
            })
            .collect();

        // --- The order the covariance rows and columns are in. ---
        let mut parameter_order: Vec<String> = Vec::with_capacity(used_layout.dim());
        for s in used_layout.estimated_stations() {
            for ax in ["x", "y", "z"] {
                parameter_order.push(format!("{}.{ax}", stations[s].0));
            }
        }
        if estimate_beacon {
            for ax in ["x", "y", "z"] {
                parameter_order.push(format!("beacon_mcmf.{ax}"));
            }
        }

        // --- Headline. The deliverable is the STATION coordinate sigma, so the headline
        // averages the station columns only; the whole-state average sits beside it
        // because that is the quantity the AM-HM trace bound applies to. With the beacon
        // held fixed (the default) the two are the same number.
        let station_columns: Vec<usize> = used_layout
            .estimated_stations()
            .iter()
            .flat_map(|&s| {
                let o = used_layout.station_offset(s).expect("estimated");
                [o, o + 1, o + 2]
            })
            .collect();
        let computed_rms = used.rms_sigma_over(&station_columns);
        let computed_rms_all = used.rms_per_coordinate_sigma_m();
        let trace_bound = used.isotropic_trace_bound_m();
        let eq_g = equipartition_sigma_m(sigma, n_obs, g);
        let eq_p = equipartition_sigma_m(sigma, n_obs, used_layout.dim() as f64);
        let status = if used.full_rank {
            "full-rank: the headline sigma is the inverse of the information matrix".to_string()
        } else {
            format!(
                "RANK-DEFICIENT: {} of {} directions are unobservable, so no per-coordinate \
                 sigma is reported; the observable-subspace value below is a pseudo-inverse \
                 restricted to the {} observable directions and is NOT a station sigma",
                used.defect, used.dim, used.rank
            )
        };
        let trustworthy = used.full_rank && used.condition.is_finite() && used.condition < 1e12;
        let headline_sigma: serde_json::Value = if used.full_rank {
            serde_json::json!(computed_rms)
        } else {
            serde_json::Value::Null
        };

        let null_rows: Vec<serde_json::Value> = (0..used.defect)
            .map(|k| {
                let v: Vec<f64> = (0..used.dim).map(|r| used.null_space[r][k]).collect();
                serde_json::json!({ "index": k, "direction": v })
            })
            .collect();
        let free_null_rows: Vec<serde_json::Value> = (0..free.defect)
            .map(|k| {
                let v: Vec<f64> = (0..free.dim).map(|r| free.null_space[r][k]).collect();
                serde_json::json!({ "index": k, "direction": v })
            })
            .collect();

        let summary = format!(
            "lunar-vlbi-fim | {} stations / {} baselines x {} epochs = {} obs (mask {:.1} deg) | \
             datum {} | rank {}/{} cond {:.3e} | station sigma {} vs equipartition g={:.0} \
             {:.4} m (ratio {})",
            n_stations,
            n_stations * (n_stations - 1) / 2,
            n_epochs,
            n_obs,
            mask,
            datum.as_str(),
            used.rank,
            used.dim,
            used.condition,
            if used.full_rank {
                format!("{computed_rms:.4} m")
            } else {
                "UNOBSERVABLE".to_string()
            },
            g,
            eq_g,
            if used.full_rank {
                format!("{:.3}", computed_rms / eq_g)
            } else {
                "n/a".to_string()
            },
        );

        let json = serde_json::json!({
            "kind": "lunar-vlbi-fim",
            "label": LABEL,
            "units": units_block(),
            "schedule": {
                "n_stations": n_stations,
                "n_baselines": n_stations * (n_stations - 1) / 2,
                "independent_baselines_per_epoch": n_stations - 1,
                "closure_note": "For a common beacon the geometric delay obeys tau_ik = \
        tau_ij + tau_jk exactly, so only n-1 of the n(n-1)/2 baselines are geometrically \
        independent at any epoch. The redundant ones carry independent noise, so they add \
        INFORMATION but can never add RANK.",
                "n_epochs": n_epochs,
                "arc_hours": arc,
                "step_min": step_min,
                "elevation_mask_deg": mask,
                "n_observations": n_obs,
                "n_observations_unmasked": n_epochs * n_stations * (n_stations - 1) / 2,
                "delay_sigma_s": sigma,
                "delay_sigma_source": "input; the default 1e-11 s is the illustrative VLBI \
        delay sigma lunar_combination already uses for the same observable - a representative \
        magnitude, not a measured system spec",
                "delay_sigma_range_equivalent_m": C * sigma,
                "weight_per_observation_s_minus2": 1.0 / (sigma * sigma),
                "weight_rule": "w = 1 / delay_sigma_s^2, identical on every observation; no \
        elevation-dependent or per-baseline weighting is applied, and observations are \
        treated as INDEPENDENT. A real session's troposphere and clock are correlated \
        between nearby scans, so densifying the schedule buys less than the 1/sqrt(N) this \
        weighting implies.",
                "los_itrs_sweep_deg": los_sweep_deg,
                "los_itrs_max_sweep_deg": los_max_sweep_deg,
                "beacon_declination_deg": beacon_declination_deg,
                "geometry_note": "The state carries Earth-FIXED station coordinates, so the \
        Jacobian is the inertial partial rotated by the GCRS->ITRS matrix of each epoch. \
        los_itrs_max_sweep_deg is how far Earth rotation actually moved the line of sight \
        across the arc: that sweep is what separates the equatorial coordinates, and the \
        beacon declination is what separates the polar one.",
                "stations": station_rows,
                "baselines": baseline_rows,
                "epochs": epoch_rows,
            },
            "jacobian": {
                "frame": "station coordinates in ITRS metres; beacon coordinates in MCMF metres",
                "state_dimension": used_layout.dim(),
                "estimate_beacon": estimate_beacon,
                "neglected_shapiro_partial_fraction": shapiro_fraction,
                "neglected_shapiro_note": "The analytic rows are the GEOMETRIC-delay partials; \
        the differenced Shapiro term's partial is not modelled. This fraction is the largest \
        relative row difference between a finite-difference Jacobian of the full delay and one \
        of the geometric delay alone, measured on the first observation of this schedule.",
            },
            "datum": {
                "choice": datum.as_str(),
                "held_fixed": datum.held_fixed(),
                "note": "anchor-first-station estimates the remaining coordinates RELATIVE to \
        station 1, which is what a VLBI session delivers without an external datum; \
        free-network keeps the defect and reports the observable subspace.",
            },
            "fim": {
                "dimension": used.dim,
                "rank": used.rank,
                "defect": used.defect,
                "rel_tol": rel_tol,
                "condition_number": used.condition,
                "trace_per_m2": used.trace_information,
                "eigenvalues_per_m2": used.eigenvalues,
                "covariance_numerically_trustworthy": trustworthy,
                "conditioning_note": "A condition number above 1e12 leaves under four \
        significant digits in an f64 inverse; covariance_numerically_trustworthy is false \
        there and the covariance below should be read as an order of magnitude, not a value.",
                "unobservable_directions": null_rows,
            },
            "free_network": {
                "dimension": free.dim,
                "rank": free.rank,
                "defect": free.defect,
                "condition_number": free.condition,
                "trace_per_m2": free.trace_information,
                "eigenvalues_per_m2": free.eigenvalues,
                "unobservable_directions": free_null_rows,
                "note": "The free network holds nothing fixed. A common translation of the \
        whole network along the line of sight changes every delay only by the near-field \
        difference of the two unit vectors, so it is the weakest direction the geometry has - \
        this block reports it whether or not the headline datum removed it.",
            },
            "station_covariance": {
                "frame": "ITRS (Earth-fixed) metres, in estimated-parameter order",
                "parameter_order": parameter_order,
                "matrix_m2": used.covariance,
                "sigma_m": used.sigma,
            },
            "headline": {
                "computed_per_coordinate_sigma_m": headline_sigma,
                "computed_per_coordinate_sigma_all_parameters_m": computed_rms_all,
                "observable_subspace_per_coordinate_sigma_m": computed_rms,
                "equipartition_g": g,
                "equipartition_per_coordinate_sigma_m": eq_g,
                "equipartition_formula": "sigma = c * delay_sigma_s * sqrt(g / n_observations)",
                "equipartition_all_parameters_sigma_m": eq_p,
                "ratio_computed_over_equipartition": if used.full_rank { computed_rms / eq_g } else { f64::NAN },
                "ratio_computed_over_equipartition_all_parameters": if used.full_rank { computed_rms / eq_p } else { f64::NAN },
                "isotropic_trace_bound_m": trace_bound,
                "ratio_computed_over_trace_bound": computed_rms_all / trace_bound,
                "bound_note": "isotropic_trace_bound_m = sqrt(p / trace(M)) is the \
        arithmetic-mean/harmonic-mean limit of THIS information matrix: the per-coordinate \
        sigma the same total information would give if it were spread isotropically. The \
        computed value can never be below it, so ratio_computed_over_trace_bound >= 1 is the \
        anisotropy of the schedule - exactly what the equipartition assumption discarded.",
                "status": status,
            },
        });

        Ok(Computed { json, summary })
    }
}

// ---------------------------------------------------------------------------
// Units contract.
// ---------------------------------------------------------------------------

/// Unit and provenance class for every numeric field this scenario publishes: `(dotted
/// field path, unit, provenance class, optional note)`. Array elements share their array's
/// path. A quantity whose unit a reader has to infer is an interface defect, so this table
/// is the contract and [`units_block`] only renders it; a test walks the emitted document
/// and fails on any numeric leaf missing from it.
const UNITS: &[(&str, &str, &str, Option<&str>)] = &[
    ("schedule.n_stations", "count", "input", None),
    ("schedule.n_baselines", "count", "computed", Some("n(n-1)/2 unordered station pairs")),
    ("schedule.independent_baselines_per_epoch", "count", "closed-form", Some("n-1; the delay closure tau_ik = tau_ij + tau_jk makes the rest linearly dependent")),
    ("schedule.n_epochs", "count", "computed", Some("floor(arc_hours / step) + 1")),
    ("schedule.arc_hours", "hr", "input", None),
    ("schedule.step_min", "min", "input", None),
    ("schedule.elevation_mask_deg", "deg", "input", None),
    ("schedule.n_observations", "count", "computed", Some("(baseline, epoch) pairs with BOTH stations above the mask")),
    ("schedule.n_observations_unmasked", "count", "computed", Some("what the schedule would hold with no visibility test")),
    ("schedule.delay_sigma_s", "s", "input", None),
    ("schedule.delay_sigma_range_equivalent_m", "m", "computed", Some("c * delay_sigma_s")),
    ("schedule.weight_per_observation_s_minus2", "1/s^2", "computed", Some("1 / delay_sigma_s^2")),
    ("schedule.los_itrs_sweep_deg", "deg", "computed", Some("angle between the first and last epoch's Earth-fixed line of sight")),
    ("schedule.los_itrs_max_sweep_deg", "deg", "computed", Some("largest angle any epoch's Earth-fixed line of sight makes with the first")),
    ("schedule.beacon_declination_deg", "deg", "computed", Some("the beacon's inertial declination at the first epoch; it is what makes the polar station coordinate observable")),
    ("schedule.stations.lat_deg", "deg", "input", None),
    ("schedule.stations.lon_deg", "deg", "input", None),
    ("schedule.stations.alt_m", "m", "input", None),
    ("schedule.stations.sigma_x_m", "m", "computed", Some("ITRS x standard deviation from the covariance diagonal")),
    ("schedule.stations.sigma_y_m", "m", "computed", None),
    ("schedule.stations.sigma_z_m", "m", "computed", None),
    ("schedule.stations.sigma_3d_m", "m", "computed", Some("root-sum-square of the three axis sigmas")),
    ("schedule.baselines.length_km", "km", "computed", Some("|r2 - r1| at the first epoch")),
    ("schedule.baselines.observations", "count", "computed", None),
    ("schedule.epochs.t_hours", "hr", "computed", Some("hours from the schedule start")),
    ("schedule.epochs.beacon_range_km", "km", "computed", None),
    ("schedule.epochs.elevation_deg", "deg", "computed", Some("beacon elevation at each station, in schedule order")),
    ("schedule.epochs.los_itrs_unit", "1", "computed", Some("Earth-fixed unit line of sight to the beacon")),
    ("schedule.epochs.observations", "count", "computed", None),
    ("jacobian.state_dimension", "count", "computed", Some("p = 3 x estimated stations, plus 3 when the beacon is estimated")),
    ("jacobian.neglected_shapiro_partial_fraction", "1", "computed", Some("measured by finite difference on the first observation; the size of the partial the analytic rows leave out")),
    ("datum.held_fixed", "count", "input", Some("station indices contributing no column")),
    ("fim.dimension", "count", "computed", None),
    ("fim.rank", "count", "computed", Some("eigenvalues above rel_tol * lambda_max")),
    ("fim.defect", "count", "computed", Some("dimension - rank; the unobservable directions")),
    ("fim.rel_tol", "1", "input", None),
    ("fim.condition_number", "1", "computed", Some("lambda_max / lambda_min over the observable subspace")),
    ("fim.trace_per_m2", "1/m^2", "computed", None),
    ("fim.eigenvalues_per_m2", "1/m^2", "computed", Some("ascending")),
    ("fim.unobservable_directions.index", "count", "computed", None),
    ("fim.unobservable_directions.direction", "1", "computed", Some("unit null-space vector in parameter_order")),
    ("free_network.dimension", "count", "computed", None),
    ("free_network.rank", "count", "computed", None),
    ("free_network.defect", "count", "computed", None),
    ("free_network.condition_number", "1", "computed", None),
    ("free_network.trace_per_m2", "1/m^2", "computed", None),
    ("free_network.eigenvalues_per_m2", "1/m^2", "computed", Some("ascending")),
    ("free_network.unobservable_directions.index", "count", "computed", None),
    ("free_network.unobservable_directions.direction", "1", "computed", None),
    ("station_covariance.matrix_m2", "m^2", "computed", Some("the inverse information matrix, or its pseudo-inverse under a datum defect")),
    ("station_covariance.sigma_m", "m", "computed", Some("square root of the covariance diagonal, in parameter_order")),
    ("headline.computed_per_coordinate_sigma_m", "m", "computed", Some("the deliverable: sqrt of the mean covariance diagonal over the STATION coordinates only; null when the information matrix is rank-deficient")),
    ("headline.computed_per_coordinate_sigma_all_parameters_m", "m", "computed", Some("the same average over the whole state; identical to the headline unless the beacon is estimated too, and it is the quantity the AM-HM trace bound applies to")),
    ("headline.observable_subspace_per_coordinate_sigma_m", "m", "computed", Some("the station-coordinate average taken from the pseudo-inverse; equals the computed value at full rank, and is NOT a station sigma under a defect")),
    ("headline.equipartition_g", "count", "input", Some("the g of the link being compared against; 3 is one station's three coordinates")),
    ("headline.equipartition_per_coordinate_sigma_m", "m", "modelled", Some("c * delay_sigma_s * sqrt(g / n_observations) - the assumption this scenario replaces, computed here only to be compared against")),
    ("headline.equipartition_all_parameters_sigma_m", "m", "modelled", Some("the same link with g = p, the full estimated state")),
    ("headline.ratio_computed_over_equipartition", "1", "computed", Some("NaN when rank-deficient")),
    ("headline.ratio_computed_over_equipartition_all_parameters", "1", "computed", None),
    ("headline.isotropic_trace_bound_m", "m", "closed-form", Some("sqrt(p / trace(M)); the arithmetic-mean/harmonic-mean lower bound this covariance cannot go below")),
    ("headline.ratio_computed_over_trace_bound", "1", "internal-consistency", Some(">= 1 by AM-HM; the measured anisotropy of the schedule")),
];

/// Render [`UNITS`] as the result document's `units` object.
fn units_block() -> serde_json::Value {
    let mut m = serde_json::Map::with_capacity(UNITS.len());
    for (field, unit, provenance, note) in UNITS {
        let mut e = serde_json::Map::new();
        e.insert("unit".into(), serde_json::Value::from(*unit));
        e.insert("provenance".into(), serde_json::Value::from(*provenance));
        if let Some(n) = note {
            e.insert("note".into(), serde_json::Value::from(*n));
        }
        m.insert((*field).to_string(), serde_json::Value::Object(e));
    }
    serde_json::Value::Object(m)
}

#[cfg(test)]
mod tests {
    use super::*;

    fn run(src: &str) -> serde_json::Value {
        let out = crate::api::run_toml(src).expect("scenario runs");
        serde_json::from_str(&out.json).expect("result parses")
    }

    /// A short, cheap schedule for the algebra tests.
    fn short(arc_hours: f64, step_min: f64) -> LunarVlbiFimScenario {
        LunarVlbiFimScenario {
            arc_hours: Some(arc_hours),
            step_min: Some(step_min),
            elevation_mask_deg: Some(-90.0),
            ..Default::default()
        }
    }

    fn info_of(scn: &LunarVlbiFimScenario, layout: &StateLayout) -> Vec<Vec<f64>> {
        let (geoms, obs) = scn.schedule().expect("schedule");
        let sigma = scn.resolved_sigma().expect("sigma");
        let jac = schedule_jacobian(&geoms, &obs, layout);
        information_matrix(&jac, &vec![1.0 / (sigma * sigma); obs.len()])
    }

    // ---- the analytic Jacobian against a finite difference of the delay ------------

    #[test]
    fn the_analytic_jacobian_matches_a_finite_difference_of_the_delay_itself() {
        // The oracle: `delay_from_state` rotates the state's own Earth-fixed and
        // body-fixed coordinates forward and calls `vlbi_delay_s`. It never touches a
        // partial derivative, so agreeing with it exercises the whole chain — the
        // partial formulae, the GCRS->ITRS rotation and the ICRF->MCMF rotation.
        let scn = LunarVlbiFimScenario {
            arc_hours: Some(6.0),
            step_min: Some(90.0),
            elevation_mask_deg: Some(-90.0),
            estimate_beacon: Some(true),
            ..Default::default()
        };
        let (geoms, obs) = scn.schedule().expect("schedule");
        let layout = StateLayout::new(3, &[], true);
        assert_eq!(layout.dim(), 12);
        let mut worst = 0.0_f64;
        for o in obs.iter().step_by(3) {
            let a = jacobian_row(&geoms[o.epoch], &layout, o.station1, o.station2);
            let f = finite_difference_row(
                &geoms[o.epoch],
                &layout,
                o.station1,
                o.station2,
                1.0e3,
                false,
            );
            for (k, (av, fv)) in a.iter().zip(f.iter()).enumerate() {
                // Every non-zero column is O(1/c) = 3.3e-9 s/m; compare against that
                // scale so a zero column cannot hide behind a relative test.
                let rel = (av - fv).abs() / (1.0 / C);
                worst = worst.max(rel);
                assert!(
                    rel < 1e-6,
                    "column {k} of baseline {}-{} at epoch {}: analytic {av} vs FD {fv}",
                    o.station1,
                    o.station2,
                    o.epoch
                );
            }
        }
        assert!(worst > 0.0, "the comparison never ran");
    }

    #[test]
    fn the_information_matrix_from_analytic_partials_matches_one_from_finite_differences() {
        // One level up from the row check: the whole accumulation, both routes.
        let scn = short(12.0, 60.0);
        let (geoms, obs) = scn.schedule().expect("schedule");
        let layout = StateLayout::new(3, &[0], false);
        let sigma = 1.0e-11;
        let w = vec![1.0 / (sigma * sigma); obs.len()];
        let analytic = information_matrix(&schedule_jacobian(&geoms, &obs, &layout), &w);
        let fd_jac: Vec<Vec<f64>> = obs
            .iter()
            .map(|o| {
                finite_difference_row(
                    &geoms[o.epoch],
                    &layout,
                    o.station1,
                    o.station2,
                    1.0e3,
                    false,
                )
            })
            .collect();
        let fd = information_matrix(&fd_jac, &w);
        let scale = (0..layout.dim())
            .map(|i| analytic[i][i])
            .fold(0.0_f64, f64::max);
        for i in 0..layout.dim() {
            for j in 0..layout.dim() {
                let rel = (analytic[i][j] - fd[i][j]).abs() / scale;
                assert!(
                    rel < 1e-6,
                    "M[{i}][{j}]: {} vs {}",
                    analytic[i][j],
                    fd[i][j]
                );
            }
        }
        // And the covariances they imply agree to the same tolerance.
        let a = solve_covariance(&analytic, 1e-9);
        let b = solve_covariance(&fd, 1e-9);
        let ra = a.rms_per_coordinate_sigma_m();
        let rb = b.rms_per_coordinate_sigma_m();
        assert!(
            (ra - rb).abs() / ra < 1e-5,
            "per-coordinate sigma {ra} (analytic) vs {rb} (finite difference)"
        );
    }

    // ---- known geometry with an analytically predictable covariance -----------------

    #[test]
    fn an_orthogonal_unit_geometry_gives_the_covariance_the_closed_form_predicts() {
        // Three observations whose rows are the three coordinate axes over c. Then
        // M = I/(c sigma)^2, C = (c sigma)^2 I, every coordinate sigma is exactly
        // c*sigma, and the g=3 equipartition value with N=3 is c*sigma too — the
        // isotropic case is the one case where the assumption is exact.
        let sigma = 2.0e-11;
        let jac = vec![
            vec![1.0 / C, 0.0, 0.0],
            vec![0.0, 1.0 / C, 0.0],
            vec![0.0, 0.0, 1.0 / C],
        ];
        let info = information_matrix(&jac, &[1.0 / (sigma * sigma); 3]);
        let s = solve_covariance(&info, 1e-9);
        let want = C * sigma;
        for k in 0..3 {
            assert!(
                (s.sigma[k] - want).abs() / want < 1e-12,
                "axis {k} sigma {} vs closed form {want}",
                s.sigma[k]
            );
        }
        assert!((s.rms_per_coordinate_sigma_m() - want).abs() / want < 1e-12);
        assert!((s.isotropic_trace_bound_m() - want).abs() / want < 1e-12);
        let eq = equipartition_sigma_m(sigma, 3, 3.0);
        assert!(
            (eq - want).abs() / want < 1e-12,
            "the equipartition link must be EXACT on an isotropic geometry, got {eq} vs {want}"
        );
    }

    #[test]
    fn the_equipartition_value_is_a_lower_bound_the_computed_sigma_cannot_beat() {
        // AM-HM: trace(C)/p >= p/trace(M), with equality only when the spectrum is flat.
        // So the trace bound never exceeds the computed sigma, and on a real schedule it
        // is strictly below it. Internal consistency — an algebraic identity of the same
        // matrix, not an independent oracle.
        let scn = short(12.0, 60.0);
        let layout = StateLayout::new(3, &[0], false);
        let s = solve_covariance(&info_of(&scn, &layout), 1e-9);
        let computed = s.rms_per_coordinate_sigma_m();
        let bound = s.isotropic_trace_bound_m();
        assert!(
            computed >= bound * (1.0 - 1e-12),
            "computed {computed} fell below the AM-HM bound {bound}"
        );
        assert!(
            computed > bound * 1.05,
            "a real lunar-VLBI schedule should be visibly anisotropic; ratio {}",
            computed / bound
        );
    }

    // ---- exact scaling laws ---------------------------------------------------------

    #[test]
    fn the_covariance_scales_exactly_as_sigma_squared() {
        // Internal consistency: the weights are the only place sigma enters, so every
        // covariance entry must scale as sigma^2 to the last bit the arithmetic allows.
        let layout = StateLayout::new(3, &[0], false);
        let a = LunarVlbiFimScenario {
            delay_sigma_s: Some(1.0e-11),
            ..short(8.0, 60.0)
        };
        let b = LunarVlbiFimScenario {
            delay_sigma_s: Some(3.0e-11),
            ..short(8.0, 60.0)
        };
        let ca = solve_covariance(&info_of(&a, &layout), 1e-9);
        let cb = solve_covariance(&info_of(&b, &layout), 1e-9);
        for i in 0..layout.dim() {
            for j in 0..layout.dim() {
                let want = ca.covariance[i][j] * 9.0;
                let got = cb.covariance[i][j];
                assert!(
                    (got - want).abs() <= 1e-9 * want.abs().max(1e-30),
                    "C[{i}][{j}] scaled to {got}, expected {want}"
                );
            }
        }
        assert!(
            (cb.rms_per_coordinate_sigma_m() / ca.rms_per_coordinate_sigma_m() - 3.0).abs() < 1e-9
        );
    }

    #[test]
    fn the_covariance_scales_exactly_as_one_over_the_observation_count() {
        // Repeating the identical schedule twice doubles the information and halves the
        // covariance exactly. Internal consistency, but it is the identity the
        // equipartition link's sqrt(1/N) leans on, so it is worth pinning.
        let scn = short(8.0, 60.0);
        let (geoms, obs) = scn.schedule().expect("schedule");
        let layout = StateLayout::new(3, &[0], false);
        let sigma = 1.0e-11;
        let jac = schedule_jacobian(&geoms, &obs, &layout);
        let single = information_matrix(&jac, &vec![1.0 / (sigma * sigma); obs.len()]);
        let mut doubled_jac = jac.clone();
        doubled_jac.extend(jac.iter().cloned());
        let doubled = information_matrix(&doubled_jac, &vec![1.0 / (sigma * sigma); 2 * obs.len()]);
        let cs = solve_covariance(&single, 1e-9);
        let cd = solve_covariance(&doubled, 1e-9);
        let r = cd.rms_per_coordinate_sigma_m() / cs.rms_per_coordinate_sigma_m();
        assert!(
            (r - 0.5_f64.sqrt()).abs() < 1e-9,
            "doubling N scaled the sigma by {r}, expected 1/sqrt(2)"
        );
        // And the equipartition link must follow the same law, exactly.
        let ea = equipartition_sigma_m(sigma, obs.len(), 3.0);
        let eb = equipartition_sigma_m(sigma, 2 * obs.len(), 3.0);
        assert!((eb / ea - 0.5_f64.sqrt()).abs() < 1e-12);
    }

    // ---- rigid rotation of the whole network ----------------------------------------

    /// A synthetic, deliberately well-conditioned but **anisotropic** network for the
    /// invariance test: three fixed stations on an Earth-sized sphere, and a source visited
    /// at five spread — but deliberately not axis-symmetric — directions, so the covariance
    /// has a genuine shape for the rotation to move. The frame matrices are the identity,
    /// so the estimated coordinates ARE the positions this builder places, which is what
    /// lets the whole configuration be rotated.
    fn synthetic_network(r: Option<&Mat3>) -> Vec<EpochGeometry> {
        let identity: Mat3 = [[1.0, 0.0, 0.0], [0.0, 1.0, 0.0], [0.0, 0.0, 1.0]];
        let stations: [Vec3; 3] = [
            [6.37e6, 0.0, 0.0],
            [0.0, 6.37e6, 0.0],
            [3.0e6, 3.0e6, 4.5e6],
        ];
        let d = 4.0e8;
        let scaled = |v: Vec3| {
            let u = unit(v);
            [d * u[0], d * u[1], d * u[2]]
        };
        let dirs: [Vec3; 5] = [
            scaled([1.0, 0.0, 0.0]),
            scaled([0.6, 0.8, 0.0]),
            scaled([0.5, 0.3, 0.9]),
            scaled([-0.7, 0.2, 0.4]),
            scaled([0.1, -0.9, 0.2]),
        ];
        dirs.iter()
            .enumerate()
            .map(|(k, &b)| {
                let turn = |v: Vec3| match r {
                    Some(m) => mat_vec(m, v),
                    None => v,
                };
                EpochGeometry {
                    t_hours: k as f64,
                    jd_tt: 0.0,
                    jd_ut1: 0.0,
                    stations_inertial: stations.iter().map(|&v| turn(v)).collect(),
                    beacon_inertial: turn(b),
                    moon_inertial: turn(b),
                    gcrs_to_itrs: identity,
                    icrf_to_moon: identity,
                }
            })
            .collect()
    }

    /// The covariance the synthetic network produces under `layout`, optionally rigidly
    /// rotated.
    fn synthetic_solution_with(r: Option<&Mat3>, layout: &StateLayout) -> CovarianceSolution {
        let geoms = synthetic_network(r);
        let obs: Vec<Observation> = (0..geoms.len())
            .flat_map(|e| {
                [(0usize, 1usize), (0, 2), (1, 2)]
                    .into_iter()
                    .map(move |(i, j)| Observation {
                        epoch: e,
                        station1: i,
                        station2: j,
                    })
            })
            .collect();
        let sigma = 1.0e-11;
        let info = information_matrix(
            &schedule_jacobian(&geoms, &obs, layout),
            &vec![1.0 / (sigma * sigma); obs.len()],
        );
        solve_covariance(&info, 1e-9)
    }

    /// The synthetic network solved with station 0 anchored — the shape the rotation
    /// invariance is measured on.
    fn synthetic_solution(r: Option<&Mat3>) -> CovarianceSolution {
        synthetic_solution_with(r, &StateLayout::new(3, &[0], false))
    }

    #[test]
    fn a_rigid_rotation_of_the_whole_network_leaves_the_covariance_spectrum_invariant() {
        // Rotate every station and every source position by one common rotation, with the
        // frame matrices left as the identity so the estimated coordinates are the rotated
        // ones. The covariance must transform as C -> R C R^T blockwise: the information
        // eigenvalues and every station's 3-D sigma are unchanged, the per-axis sigmas are
        // not. Nothing about that is built into the accumulation code, which only ever
        // sees positions.
        let r = crate::precession::matmul(
            &crate::precession::rz(0.7),
            &crate::precession::matmul(&crate::precession::ry(-0.4), &crate::precession::rx(1.1)),
        );
        let plain = synthetic_solution(None);
        let rotated = synthetic_solution(Some(&r));
        assert_eq!(plain.dim, 6);
        assert_eq!(plain.rank, 6, "the synthetic network must be full rank");
        assert_eq!(plain.rank, rotated.rank);
        for (a, b) in plain.eigenvalues.iter().zip(rotated.eigenvalues.iter()) {
            assert!(
                (a - b).abs() <= 1e-9 * a.abs().max(1e-30),
                "eigenvalue {a} moved to {b} under a rigid rotation"
            );
        }
        for s in 0..2 {
            let o = 3 * s;
            let tr = |c: &CovarianceSolution| {
                (c.covariance[o][o] + c.covariance[o + 1][o + 1] + c.covariance[o + 2][o + 2])
                    .sqrt()
            };
            let (a, b) = (tr(&plain), tr(&rotated));
            assert!(
                (a - b).abs() <= 1e-9 * a,
                "station {s} 3-D sigma {a} moved to {b} under a rigid rotation"
            );
        }
        let moved = (0..plain.dim)
            .any(|i| (plain.sigma[i] - rotated.sigma[i]).abs() > 1e-3 * plain.sigma[i]);
        assert!(moved, "no per-axis sigma changed; the rotation did nothing");
        for a in 0..3 {
            for b in 0..3 {
                let want: f64 = (0..3)
                    .map(|k| {
                        (0..3)
                            .map(|l| r[a][k] * plain.covariance[k][l] * r[b][l])
                            .sum::<f64>()
                    })
                    .sum();
                let got = rotated.covariance[a][b];
                assert!(
                    (got - want).abs() <= 1e-9 * want.abs().max(1e-30),
                    "C_rot[{a}][{b}] = {got}, R C R^T = {want}"
                );
            }
        }
    }

    // ---- closure --------------------------------------------------------------------

    #[test]
    fn the_delay_closure_makes_the_third_baseline_linearly_dependent() {
        // tau_13 = tau_12 + tau_23 exactly for the geometric delay, so row_13 is the sum
        // of the other two rows. Checked on the delays themselves AND on the rows.
        let scn = short(2.0, 120.0);
        let (geoms, _obs) = scn.schedule().expect("schedule");
        let g = &geoms[0];
        let st: Vec<Vec3> = (0..3).map(|s| g.station_itrs(s)).collect();
        let b = g.beacon_mcmf();
        let t12 = delay_from_state(g, &st, b, 0, 1, false);
        let t23 = delay_from_state(g, &st, b, 1, 2, false);
        let t13 = delay_from_state(g, &st, b, 0, 2, false);
        // Exact in real arithmetic; in f64 the two routes differ by about one ULP of a
        // 2e-2 s delay, so the tolerance is a relative ULP budget rather than an absolute
        // zero.
        assert!(
            (t13 - (t12 + t23)).abs() < 4e-16 * t13.abs(),
            "closure broken: {t13} vs {}",
            t12 + t23
        );
        let layout = StateLayout::new(3, &[], false);
        let r12 = jacobian_row(g, &layout, 0, 1);
        let r23 = jacobian_row(g, &layout, 1, 2);
        let r13 = jacobian_row(g, &layout, 0, 2);
        let scale = r13.iter().fold(0.0_f64, |m, v| m.max(v.abs()));
        for k in 0..layout.dim() {
            assert!(
                (r13[k] - (r12[k] + r23[k])).abs() < 1e-12 * scale,
                "row column {k}: {} vs {}",
                r13[k],
                r12[k] + r23[k]
            );
        }
    }

    #[test]
    fn a_closure_baseline_adds_information_but_never_rank() {
        // The redundant baseline carries independent noise, so it raises the information;
        // it is a linear combination of the others, so it cannot raise the rank.
        let scn = short(10.0, 45.0);
        let (geoms, obs) = scn.schedule().expect("schedule");
        let layout = StateLayout::new(3, &[0], false);
        let sigma = 1.0e-11;
        let two: Vec<Observation> = obs
            .iter()
            .copied()
            .filter(|o| !(o.station1 == 0 && o.station2 == 2))
            .collect();
        let three = obs.clone();
        let m2 = information_matrix(
            &schedule_jacobian(&geoms, &two, &layout),
            &vec![1.0 / (sigma * sigma); two.len()],
        );
        let m3 = information_matrix(
            &schedule_jacobian(&geoms, &three, &layout),
            &vec![1.0 / (sigma * sigma); three.len()],
        );
        let s2 = solve_covariance(&m2, 1e-9);
        let s3 = solve_covariance(&m3, 1e-9);
        assert!(
            three.len() > two.len(),
            "the closure baseline was not added"
        );
        assert_eq!(s2.rank, s3.rank, "the closure baseline changed the rank");
        assert!(
            s3.trace_information > s2.trace_information,
            "the closure baseline added no information"
        );
        assert!(
            s3.rms_per_coordinate_sigma_m() < s2.rms_per_coordinate_sigma_m(),
            "the closure baseline did not tighten the covariance"
        );
    }

    // ---- observability ---------------------------------------------------------------

    #[test]
    fn a_single_epoch_cannot_determine_the_station_coordinates() {
        // One epoch gives at most n-1 independent rows against 3(n-1) unknowns, so the
        // information matrix must be rank-deficient and the headline sigma must be null
        // with a status — never a number read out of a near-singular inverse.
        let v = run(
            "kind = \"lunar-vlbi-fim\"\narc_hours = 0.01\nstep_min = 30.0\nelevation_mask_deg = -90.0\n",
        );
        assert_eq!(v["schedule"]["n_epochs"].as_u64(), Some(1));
        assert_eq!(v["fim"]["dimension"].as_u64(), Some(6));
        assert!(
            v["fim"]["defect"].as_u64().unwrap() > 0,
            "a single epoch left no datum defect: {}",
            v["fim"]
        );
        assert!(
            v["headline"]["computed_per_coordinate_sigma_m"].is_null(),
            "a rank-deficient solve still published a sigma"
        );
        assert!(v["headline"]["status"]
            .as_str()
            .unwrap()
            .contains("RANK-DEFICIENT"));
        assert!(
            !v["fim"]["unobservable_directions"]
                .as_array()
                .unwrap()
                .is_empty(),
            "the unobservable directions were not reported"
        );
    }

    #[test]
    fn earth_rotation_is_what_makes_the_station_coordinates_observable() {
        // The same network and the same number of observations, but a longer arc: the
        // Earth-fixed line of sight sweeps further, and the solution conditions better.
        let short_arc = run(
            "kind = \"lunar-vlbi-fim\"\narc_hours = 1.0\nstep_min = 5.0\nelevation_mask_deg = -90.0\n",
        );
        let long_arc = run(
            "kind = \"lunar-vlbi-fim\"\narc_hours = 12.0\nstep_min = 60.0\nelevation_mask_deg = -90.0\n",
        );
        let sweep_s = short_arc["schedule"]["los_itrs_max_sweep_deg"]
            .as_f64()
            .unwrap();
        let sweep_l = long_arc["schedule"]["los_itrs_max_sweep_deg"]
            .as_f64()
            .unwrap();
        assert!(
            sweep_l > sweep_s * 5.0,
            "the long arc swept {sweep_l} deg against the short arc's {sweep_s} deg"
        );
        let cond_s = short_arc["fim"]["condition_number"].as_f64().unwrap();
        let cond_l = long_arc["fim"]["condition_number"].as_f64().unwrap();
        assert!(
            cond_l < cond_s,
            "the longer arc conditioned worse: {cond_l} vs {cond_s}"
        );
        // Both schedules carry a comparable observation count, so this is geometry and
        // not just more data.
        let n_s = short_arc["schedule"]["n_observations"].as_u64().unwrap();
        let n_l = long_arc["schedule"]["n_observations"].as_u64().unwrap();
        assert_eq!(n_s, n_l, "the two arcs were not matched on observations");
    }

    #[test]
    fn the_free_network_keeps_a_datum_defect_the_anchor_removes() {
        let free = run("kind = \"lunar-vlbi-fim\"\ndatum = \"free-network\"\n");
        let anchored = run("kind = \"lunar-vlbi-fim\"\n");
        assert_eq!(free["fim"]["dimension"].as_u64(), Some(9));
        assert_eq!(anchored["fim"]["dimension"].as_u64(), Some(6));
        assert!(
            free["free_network"]["defect"].as_u64().unwrap() > 0
                || free["free_network"]["condition_number"].as_f64().unwrap() > 1e6,
            "the free network was neither rank-deficient nor ill-conditioned: {}",
            free["free_network"]
        );
        // The anchored solve is the one that produces a headline number.
        assert!(anchored["headline"]["computed_per_coordinate_sigma_m"].is_number());
        // Both runs report the free-network diagnosis, whichever datum was chosen.
        assert!(anchored["free_network"]["defect"].is_number());
    }

    // ---- the headline comparison -----------------------------------------------------

    #[test]
    fn the_report_puts_the_computed_sigma_beside_the_equipartition_value_and_their_ratio() {
        let v = run("kind = \"lunar-vlbi-fim\"\n");
        let computed = v["headline"]["computed_per_coordinate_sigma_m"]
            .as_f64()
            .expect("a computed sigma");
        let eq = v["headline"]["equipartition_per_coordinate_sigma_m"]
            .as_f64()
            .expect("an equipartition sigma");
        let ratio = v["headline"]["ratio_computed_over_equipartition"]
            .as_f64()
            .expect("a ratio");
        assert!((ratio - computed / eq).abs() < 1e-12);
        // The equipartition value must be exactly the documented closed form.
        let sigma = v["schedule"]["delay_sigma_s"].as_f64().unwrap();
        let n = v["schedule"]["n_observations"].as_u64().unwrap() as usize;
        let want = equipartition_sigma_m(sigma, n, 3.0);
        assert!((eq - want).abs() / want < 1e-12, "{eq} vs {want}");
        // And the assumption understates the truth on a real schedule.
        assert!(
            ratio > 1.0,
            "the equipartition link did not understate the computed sigma (ratio {ratio})"
        );
    }

    #[test]
    fn the_equipartition_g_is_an_input_and_moving_it_moves_only_the_comparison() {
        let a = run("kind = \"lunar-vlbi-fim\"\n");
        let b = run("kind = \"lunar-vlbi-fim\"\nequipartition_g = 6.0\n");
        assert_eq!(
            a["headline"]["computed_per_coordinate_sigma_m"],
            b["headline"]["computed_per_coordinate_sigma_m"],
            "changing g must not touch the computed covariance"
        );
        let ea = a["headline"]["equipartition_per_coordinate_sigma_m"]
            .as_f64()
            .unwrap();
        let eb = b["headline"]["equipartition_per_coordinate_sigma_m"]
            .as_f64()
            .unwrap();
        assert!((eb / ea - 2.0_f64.sqrt()).abs() < 1e-12);
    }

    // ---- the Shapiro partial the Jacobian leaves out ---------------------------------

    #[test]
    fn the_neglected_shapiro_partial_is_measured_and_small() {
        let v = run("kind = \"lunar-vlbi-fim\"\n");
        let f = v["jacobian"]["neglected_shapiro_partial_fraction"]
            .as_f64()
            .expect("a measured fraction");
        assert!(f.is_finite() && f >= 0.0, "fraction {f}");
        assert!(
            f < 1e-3,
            "the neglected Shapiro partial is {f} of the geometric one, which is no longer \
             a negligible omission"
        );
    }

    // ---- inputs, rejection, determinism, dispatch -------------------------------------

    #[test]
    fn bad_inputs_are_rejected_rather_than_producing_a_number() {
        for src in [
            "kind = \"lunar-vlbi-fim\"\ndelay_sigma_s = 0.0\n",
            "kind = \"lunar-vlbi-fim\"\ndelay_sigma_s = -1e-11\n",
            "kind = \"lunar-vlbi-fim\"\narc_hours = 0.0\n",
            "kind = \"lunar-vlbi-fim\"\nstep_min = -5.0\n",
            "kind = \"lunar-vlbi-fim\"\ndatum = \"whatever\"\n",
            "kind = \"lunar-vlbi-fim\"\nrel_tol = 2.0\n",
            "kind = \"lunar-vlbi-fim\"\nequipartition_g = 0.0\n",
            "kind = \"lunar-vlbi-fim\"\nstations = [{ lat_deg = 0.0, lon_deg = 0.0 }]\n",
            "kind = \"lunar-vlbi-fim\"\nbeacon_lat_deg = 120.0\n",
        ] {
            assert!(
                crate::api::run_toml(src).is_err(),
                "accepted a bad input: {src}"
            );
        }
    }

    #[test]
    fn an_elevation_mask_no_station_clears_is_an_error_not_an_empty_solve() {
        let err = crate::api::run_toml(
            "kind = \"lunar-vlbi-fim\"\nelevation_mask_deg = 89.9\narc_hours = 1.0\n",
        )
        .unwrap_err();
        let msg = format!("{err:?}");
        assert!(
            msg.contains("elevation mask"),
            "unexpected error message: {msg}"
        );
    }

    #[test]
    fn the_elevation_mask_removes_observations_and_never_adds_them() {
        let open = run("kind = \"lunar-vlbi-fim\"\nelevation_mask_deg = -90.0\n");
        let masked = run("kind = \"lunar-vlbi-fim\"\nelevation_mask_deg = 20.0\n");
        let n_open = open["schedule"]["n_observations"].as_u64().unwrap();
        let n_masked = masked["schedule"]["n_observations"].as_u64().unwrap();
        assert!(
            n_masked < n_open,
            "the mask removed nothing: {n_masked} vs {n_open}"
        );
        assert_eq!(
            open["schedule"]["n_observations_unmasked"],
            masked["schedule"]["n_observations_unmasked"]
        );
    }

    #[test]
    fn adding_a_parameter_can_only_loosen_a_station_marginal() {
        // The nested-model theorem: fixing a parameter is infinite prior information on it,
        // so a station's marginal covariance under the larger (free) state must dominate
        // its marginal under the anchored state. Measured on the synthetic network, where
        // BOTH layouts are full rank — the theorem says nothing about a pseudo-inverse.
        let anchored = synthetic_solution_with(None, &StateLayout::new(3, &[0], false));
        let free = synthetic_solution_with(None, &StateLayout::new(3, &[], false));
        assert_eq!(
            anchored.defect, 0,
            "the anchored synthetic solve must be full rank"
        );
        assert_eq!(free.defect, 0, "the free synthetic solve must be full rank");
        // Station 1 sits at columns 0..3 anchored and 3..6 free; station 2 at 3..6 and 6..9.
        for (s, (a0, f0)) in [(1usize, (0usize, 3usize)), (2, (3, 6))].into_iter() {
            for axis in 0..3 {
                let a = anchored.covariance[a0 + axis][a0 + axis];
                let f = free.covariance[f0 + axis][f0 + axis];
                assert!(
                    f >= a * (1.0 - 1e-9),
                    "station {s} axis {axis} variance TIGHTENED from {a} (anchored) to {f} \
                     (free) when three parameters were added"
                );
            }
        }
    }

    #[test]
    fn this_schedule_cannot_observe_the_beacon_coordinates_and_says_so() {
        // Turning the beacon on is a real question with a real answer: the beacon partial
        // is the NEAR-FIELD difference of the two station unit vectors, ~baseline/range
        // smaller than a station partial, so on this three-station schedule the beacon
        // block falls below the rank threshold. The engine must report that as a defect and
        // withhold the headline sigma, not publish a number out of a near-singular inverse.
        let v = run("kind = \"lunar-vlbi-fim\"\nestimate_beacon = true\n");
        assert_eq!(v["fim"]["dimension"].as_u64(), Some(9));
        assert_eq!(v["fim"]["rank"].as_u64(), Some(6));
        assert_eq!(v["fim"]["defect"].as_u64(), Some(3));
        assert!(v["headline"]["computed_per_coordinate_sigma_m"].is_null());
        assert_eq!(
            v["fim"]["covariance_numerically_trustworthy"].as_bool(),
            Some(false)
        );
        // The unobservable directions live in the beacon block (the last three columns).
        for d in v["fim"]["unobservable_directions"].as_array().unwrap() {
            let c: Vec<f64> = d["direction"]
                .as_array()
                .unwrap()
                .iter()
                .map(|x| x.as_f64().unwrap())
                .collect();
            assert_eq!(c.len(), 9);
            let beacon_share: f64 = c[6..9].iter().map(|x| x * x).sum();
            assert!(
                beacon_share > 0.9,
                "an unobservable direction was not a beacon direction: {c:?}"
            );
        }
    }

    #[test]
    fn the_run_is_deterministic_and_the_dispatch_surface_is_populated() {
        let out1 = crate::api::run_toml("kind = \"lunar-vlbi-fim\"\n").unwrap();
        let out2 = crate::api::run_toml("kind = \"lunar-vlbi-fim\"\n").unwrap();
        assert_eq!(out1.json, out2.json);
        assert_eq!(out1.summary, out2.summary);
        assert!(out1.summary.contains("lunar-vlbi-fim"));
        assert!(out1.svg.starts_with("<svg"));
        let v: serde_json::Value = serde_json::from_str(&out1.json).unwrap();
        assert_eq!(v["kind"].as_str(), Some("lunar-vlbi-fim"));
        assert!(v["label"].as_str().unwrap().contains("MODELLED"));
    }

    #[test]
    fn the_scenario_registers_in_the_pack_registry() {
        let reg = crate::registry::PackRegistry::with_builtins();
        let id = crate::registry::ids::LUNAR_VLBI_FIM;
        assert!(reg.contains(&id), "{id} is not registered");
        assert!(crate::registry::ids::all().contains(&id));
    }

    // ---- the units contract -----------------------------------------------------------

    /// Walk every numeric leaf of `v`, collecting dotted paths; array elements share
    /// their array's path, and the `units` subtree itself is skipped.
    fn numeric_paths(v: &serde_json::Value, prefix: &str, out: &mut Vec<String>) {
        match v {
            serde_json::Value::Number(_) => out.push(prefix.to_string()),
            serde_json::Value::Array(a) => {
                for e in a {
                    numeric_paths(e, prefix, out);
                }
            }
            serde_json::Value::Object(m) => {
                for (k, val) in m {
                    if prefix.is_empty() && k == "units" {
                        continue;
                    }
                    let p = if prefix.is_empty() {
                        k.clone()
                    } else {
                        format!("{prefix}.{k}")
                    };
                    numeric_paths(val, &p, out);
                }
            }
            _ => {}
        }
    }

    #[test]
    fn every_emitted_numeric_field_carries_a_unit_and_a_provenance_class() {
        // Run every shape the document can take, so a field that only appears under one
        // input still has to declare itself.
        for src in [
            "kind = \"lunar-vlbi-fim\"\n",
            "kind = \"lunar-vlbi-fim\"\ndatum = \"free-network\"\n",
            "kind = \"lunar-vlbi-fim\"\nestimate_beacon = true\n",
            "kind = \"lunar-vlbi-fim\"\narc_hours = 0.01\nelevation_mask_deg = -90.0\n",
        ] {
            let v = run(src);
            let units = v["units"].as_object().expect("a units block");
            for (field, e) in units {
                assert!(
                    e["unit"].is_string(),
                    "{field} declares no unit in the units block"
                );
                let p = e["provenance"].as_str().unwrap_or_default();
                assert!(
                    [
                        "input",
                        "computed",
                        "modelled",
                        "closed-form",
                        "internal-consistency",
                    ]
                    .contains(&p),
                    "{field} carries an unrecognised provenance class {p:?}"
                );
            }
            let mut paths = Vec::new();
            numeric_paths(&v, "", &mut paths);
            paths.sort();
            paths.dedup();
            let missing: Vec<&String> = paths.iter().filter(|p| !units.contains_key(*p)).collect();
            assert!(
                missing.is_empty(),
                "numeric fields with no units entry under {src:?}: {missing:?}"
            );
        }
    }

    #[test]
    fn the_units_block_describes_only_fields_that_exist() {
        // A units entry naming a field nobody emits reads as a guarantee. Every declared
        // path must be produced by at least one of the document shapes.
        let mut seen: std::collections::HashSet<String> = std::collections::HashSet::new();
        for src in [
            "kind = \"lunar-vlbi-fim\"\n",
            "kind = \"lunar-vlbi-fim\"\ndatum = \"free-network\"\n",
            "kind = \"lunar-vlbi-fim\"\nestimate_beacon = true\n",
            "kind = \"lunar-vlbi-fim\"\narc_hours = 0.01\nelevation_mask_deg = -90.0\n",
        ] {
            let v = run(src);
            let mut paths = Vec::new();
            numeric_paths(&v, "", &mut paths);
            seen.extend(paths);
        }
        let orphan: Vec<&str> = UNITS
            .iter()
            .map(|(f, _, _, _)| *f)
            .filter(|f| !seen.contains(*f))
            .collect();
        assert!(orphan.is_empty(), "units entries nobody emits: {orphan:?}");
    }
}
