// SPDX-License-Identifier: AGPL-3.0-only
//! The seven-parameter Helmert datum driven by a **simulated observing campaign**, not by an
//! injected transform.
//!
//! [`crate::lunar_frame_realise`] fits the same seven-parameter similarity (Helmert) transform,
//! but it *injects* a known datum into a synthetic point network, adds seeded noise and recovers
//! it. The answer is put in by hand and taken back out, so the figure it reports measures the
//! least-squares solver. This module replaces the hand-set coordinate error with the error an
//! **observing programme actually buys**: a network of Earth stations observes a catalogue of
//! lunar-surface beacons over an explicit schedule; the lunar-VLBI delay partials of
//! [`crate::lunar_vlbi`] are accumulated over that schedule into a Fisher information matrix
//! exactly as [`crate::lunar_vlbi_fim`] does; and the **beacon coordinate information** that
//! comes out is propagated through the Helmert design matrix into the datum covariance.
//!
//! ## The chain, end to end
//!
//! ```text
//! schedule (beacons x baselines x epochs)
//!      -> delay partials  dtau/dr_beacon,MCMF          (crate::lunar_vlbi, rotated by B(t))
//!      -> M_b = J^T W J                                 (crate::fim::information_matrix)
//!      -> [optionally marginalise the station block]    (Schur complement)
//!      -> H   = A^T M_b A                               (A = the Helmert design)
//!      -> C_H = H^-1                                    (crate::fim::crlb)
//! ```
//!
//! `A` is the Jacobian of the Helmert model `q = t + (1+s)*R(theta)*p` with respect to the seven
//! parameters, linearised at the identity. With [`crate::precession`]'s SOFA rotation convention
//! `R(theta) v ~= v - theta x v`, so the block of `A` belonging to catalogue point `p` is
//!
//! ```text
//! dq/dt = I3        dq/dtheta = [p]_x        dq/ds = p
//! ```
//!
//! and the columns are carried in **balanced units** — translation in metres, rotation in
//! microradians, scale in parts-per-million — so that every column of `A` is O(1) at the lunar
//! radius and the rank test of [`crate::fim::crlb`] is not reading a unit choice.
//!
//! ## The datum defect is the subject, not a footnote
//!
//! A free network observed through delay differences to sources at one nearly-fixed direction
//! does not constrain all seven parameters equally, and the report never pretends it does. `H`
//! is diagnosed by [`crate::fim::crlb`]: rank, defect, condition number, eigenvalues and the
//! null-space directions **expressed in the seven-parameter basis** are emitted on every run,
//! each parameter carries the fraction of itself that lies outside the null space, and a
//! parameter the campaign does not constrain is published as **null with a status**, never as a
//! number read out of a near-singular inverse. That discipline is copied from
//! [`crate::lunar_vlbi_fim`] deliberately.
//!
//! ## Correlated beacon errors are measured, not assumed
//!
//! Errors from a common schedule are not independent. This module does not assume they are: the
//! beacon coordinates are carried in **one joint state**, so whatever correlation the campaign
//! induces is in the covariance it computes. Two things follow, and both are emitted rather than
//! asserted:
//!
//! * With the Earth-station coordinates **held fixed** (the default — ITRF is an externally
//!   realised datum, and this scenario treats the station coordinates as a stated input) no
//!   observation touches two beacons, so the joint information matrix is **exactly**
//!   block-diagonal and the beacons really are uncorrelated. That is a consequence of the
//!   held-fixed set, not an assumption: `beacon_information.offblock_fraction` measures it and a
//!   test pins it at zero.
//! * With the station coordinates **estimated** (`station_datum = "estimated-anchor-first"`) the
//!   shared station parameters couple every beacon to every other. Marginalising them out by a
//!   Schur complement leaves a beacon information matrix that is **not** block-diagonal, and the
//!   report prints the induced correlation and re-runs the whole Helmert propagation with those
//!   correlations discarded, so the price of the independence assumption is a number.
//!
//! What remains assumed is one level down and is the same assumption
//! [`crate::lunar_vlbi_fim`] labels: **individual delay observations** are weighted
//! `1/sigma_tau^2` and treated as independent of one another. A real session's troposphere and
//! clock are correlated between nearby scans, so densifying the schedule buys less than the
//! `1/sqrt(N)` this weighting implies. That is stated in the emitted label.
//!
//! ## Honesty / scope (MODELLED)
//!
//! The beacon catalogue is [`crate::lunar::NAMED_SITES`] — four real sites with per-site
//! citations on the constants — but the *campaign* is simulated: the Earth-station network is the
//! illustrative three-site set [`crate::lunar_vlbi_fim`] carries (round public complex
//! coordinates, not surveyed ITRF positions), the per-observation delay sigma is a stated
//! illustrative input, and no observation in this scenario was ever made. Everything
//! [`crate::lunar_vlbi`] and [`crate::lunar_vlbi_fim`] disclaim applies unchanged: no polar
//! motion, no light-time iteration, no media or aberration term, and the Moon-centre ephemeris,
//! the station clocks, the troposphere and the Earth-orientation parameters are held **fixed**, so
//! a real campaign estimating them alongside the coordinates would report *larger* sigmas. The
//! datum covariance is therefore a Cramer-Rao bound for a stated reduced parameter set, not a
//! predicted session result, and it is not a geodetic product. No TRL, flight heritage or agency
//! endorsement is claimed.

use crate::fim::{crlb, design_metrics, information_matrix};
use crate::frames::Geodetic;
use crate::lunar::Selenographic;
use crate::lunar_vlbi::{delay_partials_beacon, delay_partials_station1, delay_partials_station2};
use crate::lunar_vlbi_fim::{epoch_geometry, EpochGeometry, StationInput, DEFAULT_STATIONS};
use crate::precession::{mat_vec, Vec3};
use serde::Deserialize;

/// The number of parameters in a similarity (Helmert) datum: three translations, three
/// small-angle rotations, one scale.
pub const N_HELMERT: usize = 7;

/// Microradian in radians — the unit the rotation columns of the Helmert design are carried in.
const URAD: f64 = 1.0e-6;

/// Part-per-million as a dimensionless factor — the unit the scale column is carried in.
const PPM: f64 = 1.0e-6;

/// Parts-per-million to parts-per-billion.
const PPM_TO_PPB: f64 = 1.0e3;

/// The report's honesty label.
const LABEL: &str = "MODELLED campaign-driven lunar frame datum. The seven-parameter Helmert \
covariance is propagated from a beacon-coordinate information matrix accumulated from the \
engine's own lunar-VLBI delay partials over an explicit schedule of beacons, baselines and \
epochs; NO similarity transform is injected and nothing is recovered from a planted answer. The \
beacon catalogue is the crate's sourced named-site table, but the CAMPAIGN is simulated: the \
Earth-station network is an illustrative set of round public complex coordinates (NOT surveyed \
ITRF positions), the per-observation delay sigma is a stated illustrative input, and no \
observation here was ever made. Individual delay observations are weighted 1/sigma_tau^2 and \
treated as INDEPENDENT of one another, which a correlated troposphere and clock are not. The \
Moon-centre ephemeris, the station clocks, the troposphere and the Earth-orientation parameters \
are held FIXED; a real campaign estimating them alongside the coordinates would report LARGER \
sigmas. Cramer-Rao bound for the stated reduced parameter set, not a predicted campaign result. \
Not a geodetic product.";

// ---------------------------------------------------------------------------
// Small dense-matrix helpers.
// ---------------------------------------------------------------------------

/// `a - b`.
fn sub3(a: Vec3, b: Vec3) -> Vec3 {
    [a[0] - b[0], a[1] - b[1], a[2] - b[2]]
}

/// General dense product `a (n x m) * b (m x k)`.
fn matmul(a: &[Vec<f64>], b: &[Vec<f64>]) -> Vec<Vec<f64>> {
    let n = a.len();
    let m = if n > 0 { a[0].len() } else { 0 };
    let k = if m > 0 && !b.is_empty() {
        b[0].len()
    } else {
        0
    };
    let mut out = vec![vec![0.0; k]; n];
    for i in 0..n {
        for p in 0..m {
            let aip = a[i][p];
            if aip == 0.0 {
                continue;
            }
            for j in 0..k {
                out[i][j] += aip * b[p][j];
            }
        }
    }
    out
}

/// Transpose of a dense matrix.
fn transpose(a: &[Vec<f64>]) -> Vec<Vec<f64>> {
    let n = a.len();
    let m = if n > 0 { a[0].len() } else { 0 };
    let mut out = vec![vec![0.0; n]; m];
    for (i, row) in a.iter().enumerate() {
        for j in 0..m {
            out[j][i] = row[j];
        }
    }
    out
}

/// `a - b` for equally shaped dense matrices.
fn matsub(a: &[Vec<f64>], b: &[Vec<f64>]) -> Vec<Vec<f64>> {
    a.iter()
        .zip(b.iter())
        .map(|(ra, rb)| ra.iter().zip(rb.iter()).map(|(x, y)| x - y).collect())
        .collect()
}

/// The `rows x cols` sub-block of `a` anchored at `(r0, c0)`.
fn block(a: &[Vec<f64>], r0: usize, c0: usize, rows: usize, cols: usize) -> Vec<Vec<f64>> {
    (0..rows)
        .map(|i| (0..cols).map(|j| a[r0 + i][c0 + j]).collect())
        .collect()
}

/// The symmetric inverse of `a`, or its pseudo-inverse when `a` is rank-deficient; the flag says
/// which was used, so a caller can report a marginalisation that leaned on a pseudo-inverse
/// rather than silently presenting it as an inverse.
fn sym_inverse(a: &[Vec<f64>], rel_tol: f64) -> (Vec<Vec<f64>>, bool) {
    let c = crlb(a, rel_tol);
    match c.covariance {
        Some(m) => (m, true),
        None => (c.pseudo_covariance, false),
    }
}

// ---------------------------------------------------------------------------
// Inputs.
// ---------------------------------------------------------------------------

/// One lunar-surface beacon of the campaign catalogue, as the TOML declares it.
#[derive(Clone, Debug, Deserialize)]
pub struct BeaconInput {
    /// Beacon label used in the report. Defaults to `beacon-<n>` in declaration order.
    pub name: Option<String>,
    /// Selenographic latitude (deg), planetographic, north-positive.
    pub lat_deg: f64,
    /// Selenographic longitude (deg), east-positive.
    pub lon_deg: f64,
    /// Altitude above the mean lunar sphere (m). Defaults to 0.
    pub alt_m: Option<f64>,
}

/// What the campaign does with the Earth-station coordinates.
#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub enum StationDatum {
    /// The station coordinates are a stated input and are held fixed — the campaign realises the
    /// *lunar* frame against an externally realised terrestrial one. No observation then touches
    /// two beacons, so the beacon information matrix is exactly block-diagonal.
    Fixed,
    /// The station coordinates are estimated alongside the beacons, with station 1 anchored to
    /// remove the terrestrial datum defect. The shared station parameters correlate every beacon
    /// with every other; marginalising them out leaves a coupled beacon information matrix.
    EstimatedAnchorFirst,
}

impl StationDatum {
    /// The TOML spelling.
    pub fn as_str(self) -> &'static str {
        match self {
            StationDatum::Fixed => "fixed",
            StationDatum::EstimatedAnchorFirst => "estimated-anchor-first",
        }
    }

    /// Parse the TOML spelling, rejecting anything else rather than defaulting.
    pub fn parse(name: &str) -> Result<StationDatum, String> {
        match name {
            "fixed" => Ok(StationDatum::Fixed),
            "estimated-anchor-first" => Ok(StationDatum::EstimatedAnchorFirst),
            other => Err(format!(
                "unknown station_datum {other:?}: expected \"fixed\" or \
                 \"estimated-anchor-first\""
            )),
        }
    }
}

/// A runnable campaign-driven frame-datum scenario. The TOML `kind = "lunar-frame-campaign"`
/// entry the engine dispatches to [`LunarFrameCampaignScenario::run_json`].
#[derive(Clone, Debug, Default, Deserialize)]
pub struct LunarFrameCampaignScenario {
    /// The Earth-station network. Defaults to the illustrative three-site set
    /// [`crate::lunar_vlbi_fim`] carries.
    pub stations: Option<Vec<StationInput>>,
    /// The lunar beacon catalogue. Defaults to [`crate::lunar::NAMED_SITES`] — four sourced
    /// sites, each cited on its constant.
    pub beacons: Option<Vec<BeaconInput>>,
    /// Schedule start, UTC year. Default 2024.
    pub epoch_year: Option<i32>,
    /// Schedule start, UTC month. Default 1.
    pub epoch_month: Option<u32>,
    /// Schedule start, UTC day. Default 1.
    pub epoch_day: Option<u32>,
    /// Schedule length (hours). Default 24 — one Earth rotation.
    pub arc_hours: Option<f64>,
    /// Sampling step (minutes). Default 30.
    pub step_min: Option<f64>,
    /// Per-observation delay sigma (s). Default 1e-11, the same illustrative magnitude
    /// [`crate::lunar_vlbi_fim`] uses.
    pub delay_sigma_s: Option<f64>,
    /// Elevation mask (deg) the beacon must clear at both Earth stations of a baseline.
    /// Default 10.
    pub elevation_mask_deg: Option<f64>,
    /// Elevation mask (deg) an Earth station must clear above the *beacon's* local horizon.
    /// Default 0 — the geometric horizon, the least arbitrary choice; a polar beacon sees Earth
    /// grazing and this is what removes the epochs at which it does not see Earth at all.
    pub earth_elevation_mask_deg: Option<f64>,
    /// `fixed` (default) or `estimated-anchor-first`.
    pub station_datum: Option<String>,
    /// Relative eigenvalue threshold separating observable directions from the datum defect.
    /// Default 1e-9.
    pub rel_tol: Option<f64>,
    /// The per-coordinate sigma of the isotropic error model the campaign replaces (m). Default
    /// 1.0 — the `noise_sigma_m` default of [`crate::lunar_frame_realise`], so the comparison is
    /// against the number that scenario actually assumes.
    pub assumed_coordinate_sigma_m: Option<f64>,
}

impl LunarFrameCampaignScenario {
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
                "a VLBI campaign needs at least 2 stations to form a baseline, got {}",
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

    fn resolved_beacons(&self) -> Result<Vec<(String, String, Selenographic)>, String> {
        let raw: Vec<(String, String, f64, f64, f64)> = match &self.beacons {
            None => crate::lunar::NAMED_SITES
                .iter()
                .map(|s| {
                    (
                        s.name.to_string(),
                        "sourced: crate::lunar named-site table, cited per site on its constant"
                            .to_string(),
                        s.lat_deg,
                        s.lon_deg,
                        0.0,
                    )
                })
                .collect(),
            Some(v) => v
                .iter()
                .enumerate()
                .map(|(i, b)| {
                    (
                        b.name
                            .clone()
                            .unwrap_or_else(|| format!("beacon-{}", i + 1)),
                        "input: declared in the scenario TOML, unsourced by the engine".to_string(),
                        b.lat_deg,
                        b.lon_deg,
                        b.alt_m.unwrap_or(0.0),
                    )
                })
                .collect(),
        };
        if raw.len() < 3 {
            return Err(format!(
                "a seven-parameter Helmert datum needs at least 3 non-collinear beacons, got {}",
                raw.len()
            ));
        }
        for (name, _, lat, lon, alt) in &raw {
            if !lat.is_finite() || !lon.is_finite() || !alt.is_finite() {
                return Err(format!("beacon {name:?} has a non-finite coordinate"));
            }
            if !(-90.0..=90.0).contains(lat) {
                return Err(format!(
                    "beacon {name:?} latitude {lat} deg is outside [-90, 90]"
                ));
            }
        }
        Ok(raw
            .into_iter()
            .map(|(name, provenance, lat, lon, alt)| {
                (
                    name,
                    provenance,
                    Selenographic {
                        lat_rad: lat.to_radians(),
                        lon_rad: lon.to_radians(),
                        alt_m: alt,
                    },
                )
            })
            .collect())
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
        let n = (arc / (step / 60.0)).floor() as usize;
        if n > 5_000 {
            return Err(format!(
                "schedule of {} epochs is beyond this scenario's 5000-epoch guard; lengthen \
                 step_min or shorten arc_hours",
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

    fn resolved_earth_mask(&self) -> Result<f64, String> {
        let m = self.earth_elevation_mask_deg.unwrap_or(0.0);
        if !m.is_finite() || !(-90.0..90.0).contains(&m) {
            return Err(format!(
                "earth_elevation_mask_deg must be finite and in [-90, 90), got {m}"
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

    fn resolved_assumed_sigma(&self) -> Result<f64, String> {
        let s = self.assumed_coordinate_sigma_m.unwrap_or(1.0);
        if !s.is_finite() || s <= 0.0 {
            return Err(format!(
                "assumed_coordinate_sigma_m must be positive and finite, got {s}"
            ));
        }
        Ok(s)
    }

    fn resolved_station_datum(&self) -> Result<StationDatum, String> {
        StationDatum::parse(
            self.station_datum
                .as_deref()
                .unwrap_or(StationDatum::Fixed.as_str()),
        )
    }
}

// ---------------------------------------------------------------------------
// The campaign schedule.
// ---------------------------------------------------------------------------

/// One scheduled campaign observation: the delay on baseline `(station1, station2)` to `beacon`
/// at epoch index `epoch`.
#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub struct CampaignObservation {
    /// Index into the beacon catalogue.
    pub beacon: usize,
    /// Index into the epoch grid.
    pub epoch: usize,
    /// First station of the baseline (the one the delay is differenced *from*).
    pub station1: usize,
    /// Second station of the baseline.
    pub station2: usize,
}

/// The frozen geometry of the whole campaign: `geoms[beacon][epoch]` and the observations that
/// cleared both visibility tests.
pub struct CampaignSchedule {
    /// Per-beacon, per-epoch geometry, in catalogue and epoch order.
    pub geoms: Vec<Vec<EpochGeometry>>,
    /// The feasible observations, in beacon-major order.
    pub observations: Vec<CampaignObservation>,
    /// Per-beacon count of epochs at which the Earth station network was below the beacon's own
    /// local horizon mask — the lunar-side visibility the Earth-side elevation mask cannot see.
    pub earth_below_beacon_horizon: Vec<usize>,
}

impl LunarFrameCampaignScenario {
    /// Build the campaign schedule: every (beacon, epoch) geometry and every observation that
    /// clears the Earth-side elevation mask at both ends of a baseline *and* has that station
    /// above the beacon's own local horizon.
    ///
    /// Public because the accumulation is only meaningful next to the schedule that produced it.
    pub fn schedule(&self) -> Result<CampaignSchedule, String> {
        let stations = self.resolved_stations()?;
        let beacons = self.resolved_beacons()?;
        let (_arc, step_min, n_epochs) = self.resolved_schedule()?;
        let mask = self.resolved_mask()?;
        let earth_mask = self.resolved_earth_mask()?;
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

        let mut geoms: Vec<Vec<EpochGeometry>> = Vec::with_capacity(beacons.len());
        let mut observations = Vec::new();
        let mut earth_below = vec![0usize; beacons.len()];
        for (b, (_, _, sel)) in beacons.iter().enumerate() {
            let per_epoch: Vec<EpochGeometry> = (0..n_epochs)
                .map(|k| epoch_geometry(&geodetics, *sel, jd_utc_epoch, k as f64 * step_h))
                .collect();
            for (e, geom) in per_epoch.iter().enumerate() {
                let beacon_itrs = geom.beacon_itrs();
                let beacon_mcmf = geom.beacon_mcmf();
                // Two independent visibility tests: the beacon above each station's Earth
                // horizon, and each station above the BEACON's lunar horizon. A pole-proximate
                // beacon sees Earth grazing, and only the second test can express that.
                let visible: Vec<bool> = geodetics
                    .iter()
                    .enumerate()
                    .map(|(s, &g)| {
                        if !crate::frames::is_visible(g, beacon_itrs, mask) {
                            return false;
                        }
                        let station_mcmf = mat_vec(
                            &geom.icrf_to_moon,
                            sub3(geom.stations_inertial[s], geom.moon_inertial),
                        );
                        crate::lunar::lunar_look_angle(beacon_mcmf, station_mcmf).el_deg
                            >= earth_mask
                    })
                    .collect();
                if visible.iter().all(|v| !v) {
                    earth_below[b] += 1;
                }
                for i in 0..geodetics.len() {
                    for j in (i + 1)..geodetics.len() {
                        if visible[i] && visible[j] {
                            observations.push(CampaignObservation {
                                beacon: b,
                                epoch: e,
                                station1: i,
                                station2: j,
                            });
                        }
                    }
                }
            }
            geoms.push(per_epoch);
        }
        Ok(CampaignSchedule {
            geoms,
            observations,
            earth_below_beacon_horizon: earth_below,
        })
    }
}

/// The Jacobian row of one campaign observation.
///
/// Columns are `[station coordinates | beacon coordinates]`: `3*(n_stations-1)` Earth-fixed
/// (ITRS) metres when the stations are estimated (station 0 anchored), then three Moon-body-fixed
/// (MCMF) metres per beacon. Units are s/m. The partials are
/// [`crate::lunar_vlbi`]'s geometric-delay partials rotated into those frames, exactly as
/// [`crate::lunar_vlbi_fim::jacobian_row`] does.
pub fn campaign_jacobian_row(
    geom: &EpochGeometry,
    n_station_columns: usize,
    obs: CampaignObservation,
    dim: usize,
) -> Vec<f64> {
    debug_assert_ne!(
        obs.station1, obs.station2,
        "a baseline needs two distinct stations"
    );
    let mut row = vec![0.0; dim];
    let r1 = geom.stations_inertial[obs.station1];
    let r2 = geom.stations_inertial[obs.station2];
    let rb = geom.beacon_inertial;
    if n_station_columns > 0 {
        if obs.station1 > 0 {
            let o = 3 * (obs.station1 - 1);
            let e = mat_vec(&geom.gcrs_to_itrs, delay_partials_station1(r1, rb));
            row[o..o + 3].copy_from_slice(&e);
        }
        if obs.station2 > 0 {
            let o = 3 * (obs.station2 - 1);
            let e = mat_vec(&geom.gcrs_to_itrs, delay_partials_station2(r2, rb));
            row[o..o + 3].copy_from_slice(&e);
        }
    }
    let o = n_station_columns + 3 * obs.beacon;
    let e = mat_vec(&geom.icrf_to_moon, delay_partials_beacon(r1, r2, rb));
    row[o..o + 3].copy_from_slice(&e);
    row
}

// ---------------------------------------------------------------------------
// The Helmert design.
// ---------------------------------------------------------------------------

/// The Helmert design matrix `A` (`3N x 7`) at the catalogue points `points` (MCMF metres),
/// linearised at the identity datum.
///
/// With [`crate::precession`]'s SOFA rotation convention `R(theta) v ~= v - theta x v`, the block
/// belonging to point `p` is `[ I3 | [p]_x | p ]`. The columns are carried in balanced units —
/// translation in metres, rotation in microradians, scale in parts-per-million — so the rotation
/// and scale columns are `[p]_x * 1e-6` and `p * 1e-6`, each O(1.7) at the lunar radius against
/// the translation columns' O(1). Without that balancing an eigenvalue rank test would be reading
/// a unit choice rather than the geometry.
pub fn helmert_design(points: &[Vec3]) -> Vec<Vec<f64>> {
    let mut a = vec![vec![0.0; N_HELMERT]; 3 * points.len()];
    for (i, &p) in points.iter().enumerate() {
        let r = 3 * i;
        // dq/dt = I3.
        a[r][0] = 1.0;
        a[r + 1][1] = 1.0;
        a[r + 2][2] = 1.0;
        // dq/dtheta = [p]_x, in microradians.
        a[r][3] = 0.0;
        a[r][4] = -p[2] * URAD;
        a[r][5] = p[1] * URAD;
        a[r + 1][3] = p[2] * URAD;
        a[r + 1][4] = 0.0;
        a[r + 1][5] = -p[0] * URAD;
        a[r + 2][3] = -p[1] * URAD;
        a[r + 2][4] = p[0] * URAD;
        a[r + 2][5] = 0.0;
        // dq/ds = p, in parts-per-million.
        a[r][6] = p[0] * PPM;
        a[r + 1][6] = p[1] * PPM;
        a[r + 2][6] = p[2] * PPM;
    }
    a
}

/// The names of the seven Helmert parameters, in the order [`helmert_design`] lays its columns
/// out, each with the unit its column is carried in.
pub const HELMERT_PARAMETERS: [(&str, &str); N_HELMERT] = [
    ("tx", "m"),
    ("ty", "m"),
    ("tz", "m"),
    ("theta_x", "urad"),
    ("theta_y", "urad"),
    ("theta_z", "urad"),
    ("scale", "ppm"),
];

// ---------------------------------------------------------------------------
// The datum solution.
// ---------------------------------------------------------------------------

/// A seven-parameter datum covariance and the observability structure behind it.
#[derive(Clone, Debug)]
pub struct DatumSolution {
    /// Numerical rank of the `7 x 7` Helmert information matrix.
    pub rank: usize,
    /// Datum defect `7 - rank`: the similarity directions this campaign does not constrain.
    pub defect: usize,
    /// Eigenvalues of the Helmert information matrix, ascending.
    pub eigenvalues: Vec<f64>,
    /// Condition number over the observable subspace.
    pub condition: f64,
    /// Null-space basis in the seven-parameter (balanced-unit) basis, as columns.
    pub null_space: Vec<Vec<f64>>,
    /// Per-parameter standard deviation in the balanced units of [`HELMERT_PARAMETERS`].
    pub sigma: Vec<f64>,
    /// True when the information matrix has full rank, so `sigma` is an inverse rather than a
    /// pseudo-inverse.
    pub full_rank: bool,
    /// Per-parameter fraction of the parameter direction that lies **outside** the null space:
    /// `1 - sum_null v[k]^2`. One means the campaign constrains that parameter outright, zero
    /// means it does not constrain it at all.
    pub constrained_fraction: Vec<f64>,
    /// The eigenvector of the *smallest* eigenvalue of the Helmert information matrix, in the
    /// seven-parameter basis, sign-normalised so its largest-magnitude component is positive.
    ///
    /// A full-rank datum still has a weakest direction, and reporting only seven sigmas would
    /// hide it: this is the combination of similarity parameters the campaign determines least
    /// well, whether or not it falls below the rank threshold.
    pub weakest_direction: Vec<f64>,
    /// The smallest eigenvalue of the Helmert information matrix — the information the campaign
    /// puts into [`Self::weakest_direction`].
    pub weakest_eigenvalue: f64,
}

/// Propagate a beacon-coordinate information matrix `info_b` (`3N x 3N`, 1/m²) through the
/// Helmert design `a` (`3N x 7`) into the seven-parameter datum solution: `H = A^T M_b A`,
/// diagnosed by [`crate::fim::crlb`].
pub fn solve_datum(
    info_b: &[Vec<f64>],
    a: &[Vec<f64>],
    rel_tol: f64,
) -> (Vec<Vec<f64>>, DatumSolution) {
    let at = transpose(a);
    let h = matmul(&matmul(&at, info_b), a);
    let c = crlb(&h, rel_tol);
    let dm = design_metrics(&h, rel_tol);
    let eig = crate::fim::sym_eig(&h);
    // Column 0 is the smallest eigenvalue's eigenvector (sym_eig sorts ascending). An
    // eigenvector's sign is arbitrary, so pin it: the largest-magnitude component is made
    // positive, and the emitted direction is then reproducible rather than sign-flipping between
    // runs of a different arithmetic order.
    let mut weakest: Vec<f64> = (0..N_HELMERT).map(|k| eig.vectors[k][0]).collect();
    let pivot = weakest
        .iter()
        .enumerate()
        .fold((0usize, 0.0_f64), |(bi, bv), (i, v)| {
            if v.abs() > bv {
                (i, v.abs())
            } else {
                (bi, bv)
            }
        })
        .0;
    if weakest[pivot] < 0.0 {
        for v in &mut weakest {
            *v = -*v;
        }
    }
    let constrained_fraction: Vec<f64> = (0..N_HELMERT)
        .map(|k| {
            let leak: f64 = (0..c.defect).map(|j| c.null_space[k][j].powi(2)).sum();
            (1.0 - leak).clamp(0.0, 1.0)
        })
        .collect();
    let sol = DatumSolution {
        rank: c.rank,
        defect: c.defect,
        eigenvalues: c.eigenvalues.clone(),
        condition: dm.condition,
        null_space: c.null_space.clone(),
        sigma: c.crlb_std.clone(),
        full_rank: c.defect == 0,
        constrained_fraction,
        weakest_direction: weakest,
        weakest_eigenvalue: eig.values[0],
    };
    (h, sol)
}

impl DatumSolution {
    /// The translation sigma norm (m) — the headline datum accuracy, the root-sum-square of the
    /// three translation standard deviations.
    pub fn translation_sigma_norm_m(&self) -> f64 {
        (self.sigma[0].powi(2) + self.sigma[1].powi(2) + self.sigma[2].powi(2)).sqrt()
    }

    /// The rotation sigma norm (rad), root-sum-square over the three small-angle standard
    /// deviations.
    pub fn rotation_sigma_norm_rad(&self) -> f64 {
        (self.sigma[3].powi(2) + self.sigma[4].powi(2) + self.sigma[5].powi(2)).sqrt() * URAD
    }

    /// The scale standard deviation in parts-per-billion.
    pub fn scale_sigma_ppb(&self) -> f64 {
        self.sigma[6] * PPM_TO_PPB
    }
}

// ---------------------------------------------------------------------------
// The run.
// ---------------------------------------------------------------------------

/// Everything one run computed, before it is rendered.
struct Computed {
    json: serde_json::Value,
    summary: String,
}

/// A numeric value that is published only when the campaign actually determined it; a
/// rank-deficient direction is emitted as JSON `null`, never as a number out of a near-singular
/// inverse.
fn number_or_null(ok: bool, v: f64) -> serde_json::Value {
    if ok && v.is_finite() {
        serde_json::json!(v)
    } else {
        serde_json::Value::Null
    }
}

impl LunarFrameCampaignScenario {
    /// Run the scenario, returning `(json, summary)`.
    pub fn run_json(&self) -> Result<(String, String), String> {
        let c = self.compute()?;
        let json = serde_json::to_string_pretty(&c.json)
            .map_err(|e| format!("serializing lunar-frame-campaign result: {e}"))?;
        Ok((json, c.summary))
    }

    #[allow(clippy::too_many_lines)]
    fn compute(&self) -> Result<Computed, String> {
        let stations = self.resolved_stations()?;
        let beacons = self.resolved_beacons()?;
        let n_stations = stations.len();
        let n_beacons = beacons.len();
        let (arc, step_min, n_epochs) = self.resolved_schedule()?;
        let sigma_tau = self.resolved_sigma()?;
        let mask = self.resolved_mask()?;
        let earth_mask = self.resolved_earth_mask()?;
        let rel_tol = self.resolved_rel_tol()?;
        let assumed_sigma = self.resolved_assumed_sigma()?;
        let station_datum = self.resolved_station_datum()?;

        let sched = self.schedule()?;
        let n_obs = sched.observations.len();
        if n_obs == 0 {
            return Err(format!(
                "no observation in the campaign clears the {mask} deg Earth-side elevation mask \
                 at both ends of a baseline AND the {earth_mask} deg mask above the beacon's own \
                 horizon: {n_epochs} epochs x {} baselines x {n_beacons} beacons all rejected. \
                 Lengthen arc_hours, lower a mask, or move the stations.",
                n_stations * (n_stations - 1) / 2
            ));
        }

        let n_station_columns = match station_datum {
            StationDatum::Fixed => 0,
            StationDatum::EstimatedAnchorFirst => 3 * (n_stations - 1),
        };
        let n_beacon_columns = 3 * n_beacons;
        let dim = n_station_columns + n_beacon_columns;

        // --- Accumulate the joint information matrix over the whole campaign. ---
        let jac: Vec<Vec<f64>> = sched
            .observations
            .iter()
            .map(|&o| {
                campaign_jacobian_row(&sched.geoms[o.beacon][o.epoch], n_station_columns, o, dim)
            })
            .collect();
        let weights = vec![1.0 / (sigma_tau * sigma_tau); n_obs];
        let joint = information_matrix(&jac, &weights);

        // --- The beacon block, with any station block marginalised out. ---
        let m_bb = block(
            &joint,
            n_station_columns,
            n_station_columns,
            n_beacon_columns,
            n_beacon_columns,
        );
        let (info_b, station_block_full_rank) = if n_station_columns == 0 {
            (m_bb, true)
        } else {
            let m_ss = block(&joint, 0, 0, n_station_columns, n_station_columns);
            let m_sb = block(
                &joint,
                0,
                n_station_columns,
                n_station_columns,
                n_beacon_columns,
            );
            let (m_ss_inv, full) = sym_inverse(&m_ss, rel_tol);
            let correction = matmul(&matmul(&transpose(&m_sb), &m_ss_inv), &m_sb);
            (matsub(&m_bb, &correction), full)
        };

        // --- How far the beacons are from independent, measured on the information matrix. ---
        let mut max_diag = 0.0_f64;
        for (i, row) in info_b.iter().enumerate() {
            max_diag = max_diag.max(row[i].abs());
        }
        let mut max_offblock = 0.0_f64;
        for (i, row) in info_b.iter().enumerate() {
            for (j, v) in row.iter().enumerate() {
                if i / 3 != j / 3 {
                    max_offblock = max_offblock.max(v.abs());
                }
            }
        }
        let offblock_fraction = if max_diag > 0.0 {
            max_offblock / max_diag
        } else {
            0.0
        };

        // --- Beacon coordinate covariance and the correlation it carries. ---
        let (cov_b, cov_b_full_rank) = sym_inverse(&info_b, rel_tol);
        let beacon_crlb = crlb(&info_b, rel_tol);
        let mut max_interbeacon_corr = 0.0_f64;
        for i in 0..n_beacon_columns {
            for j in 0..n_beacon_columns {
                if i / 3 == j / 3 {
                    continue;
                }
                let d = (cov_b[i][i] * cov_b[j][j]).sqrt();
                if d > 0.0 {
                    max_interbeacon_corr = max_interbeacon_corr.max((cov_b[i][j] / d).abs());
                }
            }
        }

        // --- The Helmert design at the catalogue coordinates. ---
        let points: Vec<Vec3> = beacons
            .iter()
            .map(|(_, _, s)| crate::lunar::selenographic_to_mcmf(*s))
            .collect();
        let a = helmert_design(&points);

        // --- The datum, driven by the campaign. ---
        let (h, datum) = solve_datum(&info_b, &a, rel_tol);

        // --- The same propagation with the inter-beacon correlations discarded: what the
        // independence assumption would have cost. ---
        let mut cov_ind = vec![vec![0.0; n_beacon_columns]; n_beacon_columns];
        for i in 0..n_beacon_columns {
            for j in 0..n_beacon_columns {
                if i / 3 == j / 3 {
                    cov_ind[i][j] = cov_b[i][j];
                }
            }
        }
        let (info_ind, _) = sym_inverse(&cov_ind, rel_tol);
        let (_, datum_ind) = solve_datum(&info_ind, &a, rel_tol);

        // --- The modelled link being replaced: an isotropic per-coordinate sigma, propagated
        // through the SAME design over the SAME network. ---
        let mut info_iso = vec![vec![0.0; n_beacon_columns]; n_beacon_columns];
        for (i, row) in info_iso.iter_mut().enumerate() {
            row[i] = 1.0 / (assumed_sigma * assumed_sigma);
        }
        let (_, datum_iso) = solve_datum(&info_iso, &a, rel_tol);

        // --- The figure the injected-transform scenario reports today, computed here rather
        // than quoted. ---
        let injected = crate::lunar_frame_realise::LunarFrameRealiseScenario::default().run();

        // --- Schedule diagnostics, measured. ---
        // How far the Moon-body-fixed direction to the Earth's centre moved across the arc. This
        // is what separates the line-of-sight beacon coordinate from the plane-of-sky ones, and
        // over a single day it is the libration, not the Earth's rotation.
        let (sub_earth_sweep_deg, sub_earth_mean) = {
            let g0 = &sched.geoms[0][0];
            let u0 = unit_mcmf_to_earth(g0);
            let mut worst = 0.0_f64;
            let mut acc = [0.0_f64; 3];
            for g in &sched.geoms[0] {
                let u = unit_mcmf_to_earth(g);
                let d = (u0[0] * u[0] + u0[1] * u[1] + u0[2] * u[2])
                    .clamp(-1.0, 1.0)
                    .acos()
                    .to_degrees();
                worst = worst.max(d);
                for k in 0..3 {
                    acc[k] += u[k];
                }
            }
            let n = (acc[0] * acc[0] + acc[1] * acc[1] + acc[2] * acc[2]).sqrt();
            let mean = if n > 0.0 {
                [acc[0] / n, acc[1] / n, acc[2] / n]
            } else {
                acc
            };
            (worst, mean)
        };

        let beacon_rows: Vec<serde_json::Value> = beacons
            .iter()
            .enumerate()
            .map(|(b, (name, provenance, sel))| {
                let o = 3 * b;
                let n = sched
                    .observations
                    .iter()
                    .filter(|ob| ob.beacon == b)
                    .count();
                let sx = beacon_crlb.crlb_std[o];
                let sy = beacon_crlb.crlb_std[o + 1];
                let sz = beacon_crlb.crlb_std[o + 2];
                serde_json::json!({
                    "name": name,
                    "coordinate_provenance": provenance,
                    "lat_deg": sel.lat_rad.to_degrees(),
                    "lon_deg": sel.lon_rad.to_degrees(),
                    "alt_m": sel.alt_m,
                    "observations": n,
                    "epochs_with_no_station_above_its_horizon": sched.earth_below_beacon_horizon[b],
                    "sigma_x_m": number_or_null(cov_b_full_rank, sx),
                    "sigma_y_m": number_or_null(cov_b_full_rank, sy),
                    "sigma_z_m": number_or_null(cov_b_full_rank, sz),
                    "sigma_3d_m": number_or_null(
                        cov_b_full_rank,
                        (sx * sx + sy * sy + sz * sz).sqrt(),
                    ),
                })
            })
            .collect();

        let station_rows: Vec<serde_json::Value> = stations
            .iter()
            .enumerate()
            .map(|(s, (name, g))| {
                serde_json::json!({
                    "name": name,
                    "lat_deg": g.lat_rad.to_degrees(),
                    "lon_deg": g.lon_rad.to_degrees(),
                    "alt_m": g.alt_m,
                    "role": match station_datum {
                        StationDatum::Fixed => "held fixed - a stated input, contributes no column",
                        StationDatum::EstimatedAnchorFirst if s == 0 =>
                            "terrestrial datum anchor - held fixed, contributes no column",
                        StationDatum::EstimatedAnchorFirst => "estimated",
                    },
                })
            })
            .collect();

        let parameter_rows: Vec<serde_json::Value> = HELMERT_PARAMETERS
            .iter()
            .enumerate()
            .map(|(k, (name, unit))| {
                let constrained = datum.constrained_fraction[k] > 0.5;
                serde_json::json!({
                    "parameter": name,
                    "unit": unit,
                    "sigma": number_or_null(datum.full_rank, datum.sigma[k]),
                    "constrained_fraction": datum.constrained_fraction[k],
                    "weakest_direction_share": datum.weakest_direction[k].powi(2),
                    "constrained": constrained,
                    "status": if datum.full_rank {
                        "constrained by the campaign"
                    } else if constrained {
                        "constrained, but the datum as a whole is rank-deficient so no sigma is \
                         published for any parameter"
                    } else {
                        "NOT constrained by this campaign - the parameter lies in the \
                         unobservable similarity subspace"
                    },
                })
            })
            .collect();

        let null_rows: Vec<serde_json::Value> = (0..datum.defect)
            .map(|j| {
                let v: Vec<f64> = (0..N_HELMERT).map(|k| datum.null_space[k][j]).collect();
                serde_json::json!({ "index": j, "direction": v })
            })
            .collect();

        let trustworthy =
            datum.full_rank && datum.condition.is_finite() && datum.condition < 1.0e12;

        let headline_translation =
            number_or_null(datum.full_rank, datum.translation_sigma_norm_m());
        let status = if datum.full_rank {
            format!(
                "full-rank: all 7 similarity parameters are constrained by this campaign \
                 (condition number {:.3e})",
                datum.condition
            )
        } else {
            format!(
                "RANK-DEFICIENT: {} of 7 similarity directions are unobservable from this \
                 campaign, so NO datum sigma is published; the unobservable directions are \
                 listed in the seven-parameter basis",
                datum.defect
            )
        };

        let summary = format!(
            "lunar-frame-campaign | {n_beacons} beacons x {} baselines x {n_epochs} epochs = \
             {n_obs} obs (delay sigma {sigma_tau:.3e} s) | station datum {} | Helmert rank {}/7 \
             cond {:.3e} | datum translation sigma {} vs injected-transform recovery error \
             {:.4} m (ratio {})",
            n_stations * (n_stations - 1) / 2,
            station_datum.as_str(),
            datum.rank,
            datum.condition,
            if datum.full_rank {
                format!("{:.6} m", datum.translation_sigma_norm_m())
            } else {
                "UNOBSERVABLE".to_string()
            },
            injected.trans_err_norm_m,
            if datum.full_rank {
                format!(
                    "{:.3}",
                    injected.trans_err_norm_m / datum.translation_sigma_norm_m()
                )
            } else {
                "n/a".to_string()
            },
        );

        let json = serde_json::json!({
            "kind": "lunar-frame-campaign",
            "label": LABEL,
            "units": units_block(),
            "campaign": {
                "n_stations": n_stations,
                "n_beacons": n_beacons,
                "n_baselines": n_stations * (n_stations - 1) / 2,
                "n_epochs": n_epochs,
                "arc_hours": arc,
                "step_min": step_min,
                "elevation_mask_deg": mask,
                "earth_elevation_mask_deg": earth_mask,
                "n_observations": n_obs,
                "n_observations_unmasked": n_epochs * n_beacons * n_stations * (n_stations - 1) / 2,
                "delay_sigma_s": sigma_tau,
                "delay_sigma_range_equivalent_m": crate::timegeo::C_M_PER_S * sigma_tau,
                "weight_per_observation_s_minus2": 1.0 / (sigma_tau * sigma_tau),
                "sub_earth_direction_sweep_deg": sub_earth_sweep_deg,
                "sub_earth_direction_mcmf_unit": sub_earth_mean,
                "geometry_note": "The beacon partial is the near-field DIFFERENCE of the two \
        station unit vectors, so it lies almost entirely in the plane of the sky. What separates \
        the line-of-sight beacon coordinate from the plane-of-sky ones over an arc is how far the \
        Moon-body-fixed direction to Earth moves, and over a single day that is the LIBRATION, \
        not the Earth's rotation: sub_earth_direction_sweep_deg measures it. A short arc \
        therefore buys two well-determined coordinates per beacon and one weak one, and the \
        condition number says so.",
                "weight_rule": "w = 1 / delay_sigma_s^2, identical on every observation; no \
        elevation-dependent or per-baseline weighting is applied, and individual delay \
        observations are treated as INDEPENDENT. A real session's troposphere and clock are \
        correlated between nearby scans, so densifying the schedule buys less than the \
        1/sqrt(N) this weighting implies.",
                "station_catalogue_provenance": match &self.stations {
                    None => "illustrative: round public complex coordinates carried by \
        lunar_vlbi_fim, NOT surveyed ITRF positions",
                    Some(_) => "input: declared in the scenario TOML, unsourced by the engine",
                },
                "stations": station_rows,
                "beacons": beacon_rows,
            },
            "station_datum": {
                "choice": station_datum.as_str(),
                "n_station_columns": n_station_columns,
                "station_block_full_rank": station_block_full_rank,
                "note": "fixed treats the Earth-station coordinates as a stated input and \
        realises the LUNAR frame against an externally realised terrestrial one; no observation \
        then touches two beacons, so the beacon information is exactly block-diagonal. \
        estimated-anchor-first estimates them with station 1 anchored and marginalises them out \
        by a Schur complement, which couples every beacon to every other. \
        station_block_full_rank is false when that marginalisation had to lean on a \
        pseudo-inverse.",
            },
            "beacon_information": {
                "dimension": n_beacon_columns,
                "rank": beacon_crlb.rank,
                "defect": beacon_crlb.defect,
                "offblock_fraction": offblock_fraction,
                "max_interbeacon_correlation": max_interbeacon_corr,
                "eigenvalues_per_m2": beacon_crlb.eigenvalues,
                "independence_note": "offblock_fraction is the largest inter-beacon entry of the \
        beacon information matrix divided by its largest diagonal entry. It is a MEASUREMENT, not \
        an assumption: under station_datum = fixed it is exactly zero because no observation \
        touches two beacons, and under estimated-anchor-first it is whatever the shared station \
        parameters induced. Independence of the beacons is therefore never assumed here; \
        independence of the individual delay observations still is, and is labelled above.",
            },
            "helmert": {
                "parameter_order": HELMERT_PARAMETERS.iter().map(|(n, _)| *n).collect::<Vec<_>>(),
                "parameter_units": HELMERT_PARAMETERS.iter().map(|(_, u)| *u).collect::<Vec<_>>(),
                "information_matrix": h,
                "rank": datum.rank,
                "defect": datum.defect,
                "condition_number": datum.condition,
                "eigenvalues": datum.eigenvalues,
                "rel_tol": rel_tol,
                "covariance_numerically_trustworthy": trustworthy,
                "unobservable_directions": null_rows,
                "weakest_direction": {
                    "eigenvalue": datum.weakest_eigenvalue,
                    "direction": datum.weakest_direction,
                },
                "parameters": parameter_rows,
                "design_note": "H = A^T M_b A with A the Helmert design [I3 | [p]_x | p] at the \
        catalogue points, linearised at the identity datum and carried in balanced units \
        (m, urad, ppm) so that the eigenvalue rank test reads the geometry rather than a unit \
        choice. M_b is the campaign's beacon-coordinate information matrix, so every number below \
        derives from the schedule.",
            },
            "datum_accuracy": {
                "translation_sigma_m": [
                    number_or_null(datum.full_rank, datum.sigma[0]),
                    number_or_null(datum.full_rank, datum.sigma[1]),
                    number_or_null(datum.full_rank, datum.sigma[2]),
                ],
                "translation_sigma_norm_m": headline_translation,
                "rotation_sigma_urad": [
                    number_or_null(datum.full_rank, datum.sigma[3]),
                    number_or_null(datum.full_rank, datum.sigma[4]),
                    number_or_null(datum.full_rank, datum.sigma[5]),
                ],
                "rotation_sigma_norm_rad": number_or_null(
                    datum.full_rank,
                    datum.rotation_sigma_norm_rad(),
                ),
                "scale_sigma_ppb": number_or_null(datum.full_rank, datum.scale_sigma_ppb()),
                "status": status,
            },
            "comparison": {
                "assumed_isotropic": {
                    "coordinate_sigma_m": assumed_sigma,
                    "translation_sigma_norm_m": number_or_null(
                        datum_iso.full_rank,
                        datum_iso.translation_sigma_norm_m(),
                    ),
                    "rotation_sigma_norm_rad": number_or_null(
                        datum_iso.full_rank,
                        datum_iso.rotation_sigma_norm_rad(),
                    ),
                    "scale_sigma_ppb": number_or_null(
                        datum_iso.full_rank,
                        datum_iso.scale_sigma_ppb(),
                    ),
                    "rank": datum_iso.rank,
                    "note": "the SAME Helmert propagation over the SAME beacon network, with the \
        campaign's beacon information replaced by an isotropic 1/sigma^2 * I. This isolates what \
        the error model changes, holding the geometry fixed. The sigma is the injected-transform \
        scenario's noise_sigma_m default unless assumed_coordinate_sigma_m overrides it.",
                },
                "independence_discarded": {
                    "translation_sigma_norm_m": number_or_null(
                        datum_ind.full_rank,
                        datum_ind.translation_sigma_norm_m(),
                    ),
                    "rank": datum_ind.rank,
                    "note": "the campaign covariance with every inter-beacon correlation zeroed, \
        re-inverted and re-propagated: the price of assuming the beacons are independent. Under \
        station_datum = fixed the covariance already IS block-diagonal, so this equals the \
        campaign value exactly and the ratio is 1.",
                },
                "injected_transform_scenario": {
                    "kind": "lunar-frame-realisation",
                    "n_points": injected.n_points,
                    "translation_error_norm_m": injected.trans_err_norm_m,
                    "rotation_error_norm_rad": injected.rot_err_norm_rad,
                    "scale_error_ppb": injected.scale_err_ppb,
                    "rms_residual_m": injected.rms_residual_m,
                    "note": "run here rather than quoted: the default lunar-frame-realisation \
        scenario's recovery error against its own injected transform. It is a single-realisation \
        error under an ASSUMED per-coordinate noise on a SYNTHETIC point network, not a formal \
        sigma - the two quantities are not the same construction, which is precisely why the \
        ratio below is the finding rather than a validation.",
                },
                "ratio_injected_over_campaign_translation": number_or_null(
                    datum.full_rank,
                    injected.trans_err_norm_m / datum.translation_sigma_norm_m(),
                ),
                "ratio_injected_over_campaign_rotation": number_or_null(
                    datum.full_rank,
                    injected.rot_err_norm_rad / datum.rotation_sigma_norm_rad(),
                ),
                "ratio_injected_over_campaign_scale": number_or_null(
                    datum.full_rank,
                    injected.scale_err_ppb.abs() / datum.scale_sigma_ppb(),
                ),
                "ratio_assumed_isotropic_over_campaign_translation": number_or_null(
                    datum.full_rank && datum_iso.full_rank,
                    datum_iso.translation_sigma_norm_m() / datum.translation_sigma_norm_m(),
                ),
                "ratio_assumed_isotropic_over_campaign_rotation": number_or_null(
                    datum.full_rank && datum_iso.full_rank,
                    datum_iso.rotation_sigma_norm_rad() / datum.rotation_sigma_norm_rad(),
                ),
                "ratio_assumed_isotropic_over_campaign_scale": number_or_null(
                    datum.full_rank && datum_iso.full_rank,
                    datum_iso.scale_sigma_ppb() / datum.scale_sigma_ppb(),
                ),
                "ratio_independence_discarded_over_campaign_translation": number_or_null(
                    datum.full_rank && datum_ind.full_rank,
                    datum_ind.translation_sigma_norm_m() / datum.translation_sigma_norm_m(),
                ),
            },
        });

        Ok(Computed { json, summary })
    }
}

/// The Moon-body-fixed unit vector from the Moon's centre toward the Earth's centre at this
/// epoch — the direction whose motion across an arc is the libration the campaign rides.
fn unit_mcmf_to_earth(geom: &EpochGeometry) -> Vec3 {
    // The Moon's geocentric position is `moon_inertial`, so the Moon->Earth vector is its
    // negation; rotate into the body-fixed frame.
    let v = mat_vec(
        &geom.icrf_to_moon,
        [
            -geom.moon_inertial[0],
            -geom.moon_inertial[1],
            -geom.moon_inertial[2],
        ],
    );
    let n = (v[0] * v[0] + v[1] * v[1] + v[2] * v[2]).sqrt();
    if n == 0.0 {
        v
    } else {
        [v[0] / n, v[1] / n, v[2] / n]
    }
}

// ---------------------------------------------------------------------------
// Units contract.
// ---------------------------------------------------------------------------

/// Unit and provenance class for every numeric field this scenario publishes: `(dotted field
/// path, unit, provenance class, optional note)`. Array elements share their array's path. A
/// quantity whose unit a reader has to infer is an interface defect, so this table is the
/// contract and [`units_block`] only renders it; a test walks the emitted document and fails on
/// any numeric leaf missing from it.
const UNITS: &[(&str, &str, &str, Option<&str>)] = &[
    ("campaign.n_stations", "count", "input", None),
    ("campaign.n_beacons", "count", "input", None),
    ("campaign.n_baselines", "count", "computed", Some("n(n-1)/2 unordered station pairs")),
    ("campaign.n_epochs", "count", "computed", Some("floor(arc_hours / step) + 1")),
    ("campaign.arc_hours", "hr", "input", None),
    ("campaign.step_min", "min", "input", None),
    ("campaign.elevation_mask_deg", "deg", "input", None),
    ("campaign.earth_elevation_mask_deg", "deg", "input", Some("the mask an Earth station must clear above the BEACON's local horizon")),
    ("campaign.n_observations", "count", "computed", Some("(beacon, baseline, epoch) triples clearing both visibility tests")),
    ("campaign.n_observations_unmasked", "count", "computed", Some("what the campaign would hold with no visibility test")),
    ("campaign.delay_sigma_s", "s", "input", Some("illustrative; the same magnitude lunar_vlbi_fim uses, not a measured system spec")),
    ("campaign.delay_sigma_range_equivalent_m", "m", "computed", Some("c * delay_sigma_s")),
    ("campaign.weight_per_observation_s_minus2", "1/s^2", "computed", Some("1 / delay_sigma_s^2")),
    ("campaign.sub_earth_direction_mcmf_unit", "1", "computed", Some("the arc-mean Moon-body-fixed unit vector toward Earth; the direction the delay observable determines WORST, because the beacon partial is a difference of near-parallel unit vectors and so lies in the plane of the sky")),
    ("campaign.sub_earth_direction_sweep_deg", "deg", "computed", Some("largest angle the Moon-body-fixed direction to Earth makes with its first-epoch value across the arc; the libration that separates the line-of-sight beacon coordinate")),
    ("campaign.stations.lat_deg", "deg", "input", None),
    ("campaign.stations.lon_deg", "deg", "input", None),
    ("campaign.stations.alt_m", "m", "input", None),
    ("campaign.beacons.lat_deg", "deg", "input", Some("sourced from the crate's named-site table unless the TOML overrides it; coordinate_provenance says which")),
    ("campaign.beacons.lon_deg", "deg", "input", None),
    ("campaign.beacons.alt_m", "m", "input", None),
    ("campaign.beacons.observations", "count", "computed", None),
    ("campaign.beacons.epochs_with_no_station_above_its_horizon", "count", "computed", Some("epochs at which no Earth station cleared this beacon's own local horizon mask")),
    ("campaign.beacons.sigma_x_m", "m", "computed", Some("MCMF x standard deviation from the campaign's beacon covariance; null under a rank deficiency")),
    ("campaign.beacons.sigma_y_m", "m", "computed", None),
    ("campaign.beacons.sigma_z_m", "m", "computed", None),
    ("campaign.beacons.sigma_3d_m", "m", "computed", Some("root-sum-square of the three axis sigmas")),
    ("station_datum.n_station_columns", "count", "computed", Some("3 x (n_stations - 1) when the stations are estimated, else 0")),
    ("beacon_information.dimension", "count", "computed", Some("3 per beacon")),
    ("beacon_information.rank", "count", "computed", Some("eigenvalues above rel_tol * lambda_max")),
    ("beacon_information.defect", "count", "computed", None),
    ("beacon_information.offblock_fraction", "1", "computed", Some("largest inter-beacon entry over the largest diagonal entry; exactly 0 when no observation touches two beacons")),
    ("beacon_information.max_interbeacon_correlation", "1", "computed", Some("largest absolute correlation coefficient between coordinates of different beacons")),
    ("beacon_information.eigenvalues_per_m2", "1/m^2", "computed", Some("ascending")),
    ("helmert.information_matrix", "1/(balanced unit)^2", "computed", Some("A^T M_b A in the balanced units of parameter_units: 1/m^2, 1/urad^2, 1/ppm^2 on the diagonal and the mixed products off it")),
    ("helmert.rank", "count", "computed", None),
    ("helmert.defect", "count", "computed", Some("7 - rank; the similarity directions the campaign does not constrain")),
    ("helmert.condition_number", "1", "computed", Some("lambda_max / lambda_min over the observable subspace")),
    ("helmert.eigenvalues", "1/(balanced unit)^2", "computed", Some("ascending")),
    ("helmert.rel_tol", "1", "input", None),
    ("helmert.unobservable_directions.index", "count", "computed", None),
    ("helmert.unobservable_directions.direction", "1", "computed", Some("unit null-space vector in parameter_order, in balanced units")),
    ("helmert.parameters.sigma", "see parameters.unit", "computed", Some("the standard deviation of that Helmert parameter in the unit its row names; null when the datum is rank-deficient")),
    ("helmert.weakest_direction.eigenvalue", "1/(balanced unit)^2", "computed", Some("the smallest eigenvalue of A^T M_b A; the information the campaign puts into the direction it determines least well")),
    ("helmert.weakest_direction.direction", "1", "computed", Some("that eigenvector in parameter_order, sign-normalised so its largest-magnitude component is positive; a FULL-RANK datum still has one, and seven sigmas alone would hide it")),
    ("helmert.parameters.weakest_direction_share", "1", "computed", Some("the squared component of this parameter in weakest_direction - which parameters live in the poorly determined combination")),
    ("helmert.parameters.constrained_fraction", "1", "computed", Some("1 - the squared projection of that parameter direction onto the null space; 1 means fully constrained, 0 means not constrained at all")),
    ("datum_accuracy.translation_sigma_m", "m", "computed", Some("per-axis; null under a rank deficiency")),
    ("datum_accuracy.translation_sigma_norm_m", "m", "computed", Some("THE DELIVERABLE: the root-sum-square translation standard deviation of the seven-parameter datum, derived from the campaign's beacon covariance")),
    ("datum_accuracy.rotation_sigma_urad", "urad", "computed", None),
    ("datum_accuracy.rotation_sigma_norm_rad", "rad", "computed", None),
    ("datum_accuracy.scale_sigma_ppb", "ppb", "computed", None),
    ("comparison.assumed_isotropic.coordinate_sigma_m", "m", "input", Some("the per-coordinate sigma of the error model being replaced")),
    ("comparison.assumed_isotropic.translation_sigma_norm_m", "m", "modelled", Some("the same propagation with an isotropic coordinate covariance - the assumption this scenario replaces, computed here only to be compared against")),
    ("comparison.assumed_isotropic.rotation_sigma_norm_rad", "rad", "modelled", None),
    ("comparison.assumed_isotropic.scale_sigma_ppb", "ppb", "modelled", None),
    ("comparison.assumed_isotropic.rank", "count", "computed", None),
    ("comparison.independence_discarded.translation_sigma_norm_m", "m", "computed", Some("the campaign covariance with inter-beacon correlations zeroed and re-propagated")),
    ("comparison.independence_discarded.rank", "count", "computed", None),
    ("comparison.injected_transform_scenario.n_points", "count", "computed", Some("the default lunar-frame-realisation network size")),
    ("comparison.injected_transform_scenario.translation_error_norm_m", "m", "modelled", Some("that scenario's single-realisation recovery error against its own injected transform, run here rather than quoted")),
    ("comparison.injected_transform_scenario.rotation_error_norm_rad", "rad", "modelled", None),
    ("comparison.injected_transform_scenario.scale_error_ppb", "ppb", "modelled", None),
    ("comparison.injected_transform_scenario.rms_residual_m", "m", "modelled", None),
    ("comparison.ratio_injected_over_campaign_translation", "1", "computed", Some("the injected-transform figure over the campaign-derived one; a ratio between two different constructions, which is the finding and not a validation")),
    ("comparison.ratio_injected_over_campaign_rotation", "1", "computed", Some("same construction caveat as the translation ratio")),
    ("comparison.ratio_injected_over_campaign_scale", "1", "computed", Some("the injected-transform scenario's scale error is signed; its MAGNITUDE is used here")),
    ("comparison.ratio_assumed_isotropic_over_campaign_translation", "1", "computed", Some("the like-for-like ratio: same design, same network, only the error model changes")),
    ("comparison.ratio_assumed_isotropic_over_campaign_rotation", "1", "computed", Some("below 1 means the campaign determines the rotation BETTER than the isotropic assumption claims")),
    ("comparison.ratio_assumed_isotropic_over_campaign_scale", "1", "computed", None),
    ("comparison.ratio_independence_discarded_over_campaign_translation", "1", "internal-consistency", Some("exactly 1 when the campaign's beacon covariance is already block-diagonal")),
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

    /// A short, cheap campaign for the algebra tests.
    fn short() -> LunarFrameCampaignScenario {
        LunarFrameCampaignScenario {
            arc_hours: Some(6.0),
            step_min: Some(120.0),
            elevation_mask_deg: Some(-90.0),
            earth_elevation_mask_deg: Some(-90.0),
            ..Default::default()
        }
    }

    // ---- the Helmert design against an independent oracle -------------------------------

    #[test]
    fn the_helmert_design_matches_a_finite_difference_of_apply_helmert() {
        // The oracle is the module the datum is FOR: `lunar_frame_realise::apply_helmert`
        // evaluates q = t + (1+s) R(theta) p from the seven parameters directly. Central-
        // differencing it must reproduce the analytic design column for column, which is what
        // pins the sign convention of [p]_x against SOFA's rotation matrices.
        use crate::lunar_frame_realise::{apply_helmert, FrameDatum};
        let points: Vec<Vec3> = crate::lunar::NAMED_SITES.iter().map(|s| s.mcmf()).collect();
        let a = helmert_design(&points);
        // Step sizes in the BALANCED units the design is carried in.
        let steps = [1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0];
        let datum_of = |x: &[f64; N_HELMERT]| FrameDatum {
            translation_m: [x[0], x[1], x[2]],
            rotation_rad: [x[3] * URAD, x[4] * URAD, x[5] * URAD],
            scale_ppb: x[6] * PPM_TO_PPB,
        };
        let mut worst = 0.0_f64;
        for (i, &p) in points.iter().enumerate() {
            for k in 0..N_HELMERT {
                let mut hi = [0.0; N_HELMERT];
                let mut lo = [0.0; N_HELMERT];
                hi[k] = steps[k];
                lo[k] = -steps[k];
                let qh = apply_helmert(&datum_of(&hi), p);
                let ql = apply_helmert(&datum_of(&lo), p);
                for axis in 0..3 {
                    let fd = (qh[axis] - ql[axis]) / (2.0 * steps[k]);
                    let an = a[3 * i + axis][k];
                    // Every non-zero column of a translation/rotation/scale block is O(1);
                    // compare against that scale so a zero column cannot hide behind a
                    // relative test.
                    let err = (fd - an).abs();
                    worst = worst.max(err);
                    assert!(
                        err < 1e-6,
                        "design[{}][{k}] (point {i}, axis {axis}): analytic {an} vs finite \
                         difference {fd}",
                        3 * i + axis
                    );
                }
            }
        }
        assert!(worst > 0.0 || points.is_empty(), "the comparison never ran");
    }

    #[test]
    fn a_pure_translation_of_the_network_is_read_back_as_a_pure_translation() {
        // A second, independent check on the design: the least-squares solution of A x = dq for
        // a network shifted by a known translation must return that translation and nothing
        // else. This uses the design only, no covariance, so it isolates the model.
        let points: Vec<Vec3> = crate::lunar::NAMED_SITES.iter().map(|s| s.mcmf()).collect();
        let a = helmert_design(&points);
        let shift = [3.0, -5.0, 7.0];
        let mut dq = vec![0.0; 3 * points.len()];
        for i in 0..points.len() {
            for axis in 0..3 {
                dq[3 * i + axis] = shift[axis];
            }
        }
        // Normal equations with unit weights.
        let at = transpose(&a);
        let n = matmul(&at, &a);
        let (n_inv, full) = sym_inverse(&n, 1e-12);
        assert!(
            full,
            "the unit-weight normal matrix of this network is singular"
        );
        let rhs: Vec<f64> = at
            .iter()
            .map(|row| row.iter().zip(dq.iter()).map(|(x, y)| x * y).sum())
            .collect();
        let x: Vec<f64> = n_inv
            .iter()
            .map(|row| row.iter().zip(rhs.iter()).map(|(m, r)| m * r).sum())
            .collect();
        for axis in 0..3 {
            assert!(
                (x[axis] - shift[axis]).abs() < 1e-6,
                "translation[{axis}] recovered as {} not {}",
                x[axis],
                shift[axis]
            );
        }
        for k in 3..N_HELMERT {
            assert!(
                x[k].abs() < 1e-6,
                "a pure translation leaked {} into parameter {}",
                x[k],
                HELMERT_PARAMETERS[k].0
            );
        }
    }

    // ---- the campaign drives the number --------------------------------------------------

    #[test]
    fn the_datum_accuracy_moves_with_the_campaign_not_with_an_injected_transform() {
        // The whole point of the task: the reported accuracy must be a function of the
        // OBSERVING PROGRAMME. Halve the delay sigma and the datum sigma must halve with it;
        // shorten the arc and it must get worse. Neither knob exists in the injected-transform
        // path, and no injected transform exists here to recover.
        let base = run("kind = \"lunar-frame-campaign\"\n");
        let sharper = run("kind = \"lunar-frame-campaign\"\ndelay_sigma_s = 5.0e-12\n");
        let b = base["datum_accuracy"]["translation_sigma_norm_m"]
            .as_f64()
            .expect("base datum sigma");
        let s = sharper["datum_accuracy"]["translation_sigma_norm_m"]
            .as_f64()
            .expect("sharper datum sigma");
        // The covariance is exactly quadratic in the delay sigma, so the datum sigma is exactly
        // linear in it.
        assert!(
            (s / b - 0.5).abs() < 1e-9,
            "halving the delay sigma moved the datum sigma by {} not 0.5",
            s / b
        );

        // And the SCHEDULE moves it in the direction the geometry says it must: a shorter arc
        // rides less libration, so the line-of-sight beacon coordinate separates less and the
        // datum gets worse; a longer arc rides more and it gets better. Nothing in the
        // injected-transform path has an arc at all.
        let shorter = run("kind = \"lunar-frame-campaign\"\narc_hours = 16.0\n");
        let longer = run("kind = \"lunar-frame-campaign\"\narc_hours = 48.0\n");
        let sh = shorter["datum_accuracy"]["translation_sigma_norm_m"]
            .as_f64()
            .expect("the 16 h campaign still constrains the datum");
        let lo = longer["datum_accuracy"]["translation_sigma_norm_m"]
            .as_f64()
            .expect("the 48 h campaign constrains the datum");
        assert!(
            sh > b,
            "a 16 h arc ({sh} m) was not worse than a 24 h arc ({b} m)"
        );
        assert!(
            lo < b,
            "a 48 h arc ({lo} m) was not better than a 24 h arc ({b} m)"
        );
        // The libration the report measures moved the same way.
        let sweep = |v: &serde_json::Value| {
            v["campaign"]["sub_earth_direction_sweep_deg"]
                .as_f64()
                .unwrap()
        };
        assert!(sweep(&shorter) < sweep(&base) && sweep(&base) < sweep(&longer));
    }

    #[test]
    fn the_covariance_scales_exactly_as_the_delay_variance() {
        // Closed-form: M = J^T W J is linear in w = 1/sigma^2, so H and its inverse scale
        // exactly, and every one of the seven sigmas scales linearly with sigma_tau.
        let a = run("kind = \"lunar-frame-campaign\"\ndelay_sigma_s = 1.0e-11\n");
        let b = run("kind = \"lunar-frame-campaign\"\ndelay_sigma_s = 3.0e-11\n");
        for k in 0..N_HELMERT {
            let pa = a["helmert"]["parameters"][k]["sigma"].as_f64().unwrap();
            let pb = b["helmert"]["parameters"][k]["sigma"].as_f64().unwrap();
            assert!(
                (pb / pa - 3.0).abs() < 1e-8,
                "parameter {} scaled by {} not 3",
                HELMERT_PARAMETERS[k].0,
                pb / pa
            );
        }
    }

    #[test]
    fn no_injected_transform_appears_anywhere_in_the_emission() {
        // A guard against the failure mode the task names: the datum must not be a planted
        // answer read back. The only place an injected transform may appear is inside the
        // explicitly labelled comparison block.
        let out = crate::api::run_toml("kind = \"lunar-frame-campaign\"\n").unwrap();
        let v: serde_json::Value = serde_json::from_str(&out.json).unwrap();
        assert!(
            v["injected"].is_null(),
            "the campaign document carries an `injected` datum"
        );
        assert!(
            v["recovered"].is_null(),
            "the campaign document carries a `recovered` datum"
        );
        assert!(
            v["comparison"]["injected_transform_scenario"]["translation_error_norm_m"].is_number()
        );
    }

    #[test]
    fn the_side_by_side_comparison_is_computed_here_not_transcribed() {
        // The injected-transform figure in the comparison block must come from actually running
        // that scenario, not from a literal somebody typed. Run it independently and demand the
        // same number.
        //
        // The comparison is made to a few ULP rather than bit-for-bit for one specific reason:
        // the value under test has been through a JSON round trip, and serde_json's default
        // parser is not round-trip exact (its writer is). Measured here, that round trip moves
        // this quantity by exactly one ULP. A 1e-14 relative bound is therefore tight enough to
        // catch a transcribed literal, a stale constant or a different scenario, while not
        // failing on the deserializer's own last bit. The byte-identity of what is EMITTED is
        // pinned separately, by the R1 fingerprint test.
        let independent = crate::lunar_frame_realise::LunarFrameRealiseScenario::default().run();
        let v = run("kind = \"lunar-frame-campaign\"\n");
        let c = &v["comparison"]["injected_transform_scenario"];
        let close = |got: f64, want: f64, what: &str| {
            let rel = (got - want).abs() / want.abs().max(f64::MIN_POSITIVE);
            assert!(
                rel < 1e-14,
                "{what}: the comparison block published {got} but running the scenario gives \
                 {want} (relative difference {rel})"
            );
        };
        close(
            c["translation_error_norm_m"].as_f64().unwrap(),
            independent.trans_err_norm_m,
            "translation",
        );
        close(
            c["rotation_error_norm_rad"].as_f64().unwrap(),
            independent.rot_err_norm_rad,
            "rotation",
        );
        close(
            c["scale_error_ppb"].as_f64().unwrap(),
            independent.scale_err_ppb,
            "scale",
        );
        assert_eq!(
            c["n_points"].as_u64(),
            Some(independent.n_points as u64),
            "the comparison names a different network size than the scenario it ran"
        );
        // And the published ratio is the quotient of the two published numbers, not a third
        // independently computed thing that could drift from them.
        let campaign = v["datum_accuracy"]["translation_sigma_norm_m"]
            .as_f64()
            .unwrap();
        close(
            v["comparison"]["ratio_injected_over_campaign_translation"]
                .as_f64()
                .unwrap(),
            independent.trans_err_norm_m / campaign,
            "translation ratio",
        );
    }

    // ---- the datum defect ------------------------------------------------------------------

    #[test]
    fn every_helmert_parameter_reports_whether_the_campaign_constrains_it() {
        let v = run("kind = \"lunar-frame-campaign\"\n");
        let params = v["helmert"]["parameters"].as_array().unwrap();
        assert_eq!(params.len(), N_HELMERT);
        for (k, p) in params.iter().enumerate() {
            assert_eq!(p["parameter"].as_str(), Some(HELMERT_PARAMETERS[k].0));
            assert!(p["unit"].is_string());
            assert!(p["constrained_fraction"].is_number());
            assert!(p["status"].is_string());
        }
        // Rank plus defect is always seven, whatever the campaign turned out to buy.
        let rank = v["helmert"]["rank"].as_u64().unwrap();
        let defect = v["helmert"]["defect"].as_u64().unwrap();
        assert_eq!(rank + defect, N_HELMERT as u64);
    }

    #[test]
    fn a_rank_deficient_datum_publishes_null_not_a_number() {
        // Three beacons on one great circle through the origin cannot separate a rotation about
        // that circle's normal from nothing at all, and a campaign that observes them cannot
        // either. The engine must withhold the sigma, not read one out of a near-singular
        // inverse. (Three COLLINEAR points make the design itself rank-deficient, which is the
        // cleanest way to exercise the null path without tuning anything.)
        let src = "kind = \"lunar-frame-campaign\"\n\
                   [[beacons]]\nname = \"a\"\nlat_deg = 0.0\nlon_deg = 0.0\n\
                   [[beacons]]\nname = \"b\"\nlat_deg = 0.0\nlon_deg = 0.0\nalt_m = 1000.0\n\
                   [[beacons]]\nname = \"c\"\nlat_deg = 0.0\nlon_deg = 0.0\nalt_m = 2000.0\n";
        let v = run(src);
        assert!(
            v["helmert"]["defect"].as_u64().unwrap() > 0,
            "three collinear beacons produced a full-rank datum: {}",
            v["helmert"]
        );
        assert!(v["datum_accuracy"]["translation_sigma_norm_m"].is_null());
        assert!(v["datum_accuracy"]["scale_sigma_ppb"].is_null());
        assert!(v["datum_accuracy"]["status"]
            .as_str()
            .unwrap()
            .contains("RANK-DEFICIENT"));
        // The unobservable directions are published in the seven-parameter basis.
        let dirs = v["helmert"]["unobservable_directions"].as_array().unwrap();
        assert_eq!(
            dirs.len(),
            v["helmert"]["defect"].as_u64().unwrap() as usize
        );
        for d in dirs {
            assert_eq!(d["direction"].as_array().unwrap().len(), N_HELMERT);
        }
    }

    #[test]
    fn the_worst_determined_translation_axis_is_the_direction_to_earth() {
        // A physics oracle, not a tautology: the delay partial with respect to a beacon
        // coordinate is the DIFFERENCE of two near-parallel station->beacon unit vectors, so it
        // has almost no component along the line of sight. The Moon keeps one face to Earth, so
        // over a single day that line of sight barely moves in the body-fixed frame. The datum
        // translation must therefore be worst along the arc-mean Moon-body-fixed direction to
        // Earth - a direction the scenario MEASURES and emits, and which nothing in the solver
        // was told about.
        let v = run("kind = \"lunar-frame-campaign\"\n");
        let u: Vec<f64> = v["campaign"]["sub_earth_direction_mcmf_unit"]
            .as_array()
            .unwrap()
            .iter()
            .map(|x| x.as_f64().unwrap())
            .collect();
        let sig: Vec<f64> = v["datum_accuracy"]["translation_sigma_m"]
            .as_array()
            .unwrap()
            .iter()
            .map(|x| x.as_f64().unwrap())
            .collect();
        let worst_axis = (0..3).max_by(|&a, &b| sig[a].total_cmp(&sig[b])).unwrap();
        let earth_axis = (0..3)
            .max_by(|&a, &b| u[a].abs().total_cmp(&u[b].abs()))
            .unwrap();
        assert_eq!(
            worst_axis, earth_axis,
            "the worst translation axis was {worst_axis} but the body-fixed direction to Earth \
             is dominated by axis {earth_axis}: sigma {sig:?}, sub-Earth unit {u:?}"
        );
        // And it is worst by a wide margin, not by a rounding error.
        let others: f64 = (0..3)
            .filter(|&k| k != worst_axis)
            .map(|k| sig[k])
            .fold(0.0_f64, f64::max);
        assert!(
            sig[worst_axis] > 5.0 * others,
            "the line-of-sight translation sigma {} m is not decisively worse than the \
             plane-of-sky ones ({} m)",
            sig[worst_axis],
            others
        );
    }

    #[test]
    fn the_weakest_direction_is_a_unit_vector_whose_shares_add_up() {
        // A full-rank datum still has a least-determined combination, and the per-parameter
        // shares of it must be a partition of one.
        let v = run("kind = \"lunar-frame-campaign\"\n");
        let d: Vec<f64> = v["helmert"]["weakest_direction"]["direction"]
            .as_array()
            .unwrap()
            .iter()
            .map(|x| x.as_f64().unwrap())
            .collect();
        assert_eq!(d.len(), N_HELMERT);
        let n2: f64 = d.iter().map(|x| x * x).sum();
        assert!((n2 - 1.0).abs() < 1e-9, "weakest direction has norm^2 {n2}");
        let shares: f64 = v["helmert"]["parameters"]
            .as_array()
            .unwrap()
            .iter()
            .map(|p| p["weakest_direction_share"].as_f64().unwrap())
            .sum();
        assert!((shares - 1.0).abs() < 1e-9, "shares sum to {shares}");
        // The smallest eigenvalue is the smallest one emitted.
        let lam = v["helmert"]["weakest_direction"]["eigenvalue"]
            .as_f64()
            .unwrap();
        let first = v["helmert"]["eigenvalues"][0].as_f64().unwrap();
        assert!(
            (lam - first).abs() <= 1e-12 * first.abs().max(1.0),
            "weakest eigenvalue {lam} is not the first emitted eigenvalue {first}"
        );
    }

    // ---- correlation -------------------------------------------------------------------

    #[test]
    fn holding_the_stations_fixed_makes_the_beacons_exactly_uncorrelated() {
        // Not an assumption: with no station columns no observation touches two beacons, so the
        // information matrix is block-diagonal to the last bit and the independence-discarded
        // propagation is the same number.
        let v = run("kind = \"lunar-frame-campaign\"\n");
        assert_eq!(
            v["beacon_information"]["offblock_fraction"].as_f64(),
            Some(0.0)
        );
        assert_eq!(
            v["beacon_information"]["max_interbeacon_correlation"].as_f64(),
            Some(0.0)
        );
        let r = v["comparison"]["ratio_independence_discarded_over_campaign_translation"]
            .as_f64()
            .expect("the independence ratio");
        assert!(
            (r - 1.0).abs() < 1e-9,
            "zeroing correlations that are already zero moved the datum by {r}"
        );
    }

    #[test]
    fn estimating_the_stations_couples_the_beacons_and_the_report_says_so() {
        // The converse: the shared station parameters are exactly the common-mode error the
        // fixed-station variant assumes away, and marginalising them out must leave a coupled
        // beacon information matrix.
        let v =
            run("kind = \"lunar-frame-campaign\"\nstation_datum = \"estimated-anchor-first\"\n");
        assert_eq!(
            v["station_datum"]["n_station_columns"].as_u64(),
            Some(6),
            "three stations with one anchored should contribute six columns"
        );
        let off = v["beacon_information"]["offblock_fraction"]
            .as_f64()
            .unwrap();
        assert!(
            off > 0.0,
            "estimating the stations left the beacon information block-diagonal ({off})"
        );
        let corr = v["beacon_information"]["max_interbeacon_correlation"]
            .as_f64()
            .unwrap();
        assert!(
            corr > 0.0,
            "estimating the stations induced no inter-beacon correlation ({corr})"
        );
    }

    // ---- input validation ------------------------------------------------------------------

    #[test]
    fn bad_inputs_are_rejected_rather_than_producing_a_number() {
        for (src, needle) in [
            (
                "kind = \"lunar-frame-campaign\"\ndelay_sigma_s = 0.0\n",
                "delay_sigma_s",
            ),
            (
                "kind = \"lunar-frame-campaign\"\narc_hours = -1.0\n",
                "arc_hours",
            ),
            (
                "kind = \"lunar-frame-campaign\"\nstep_min = 0.0\n",
                "step_min",
            ),
            (
                "kind = \"lunar-frame-campaign\"\nstation_datum = \"whatever\"\n",
                "station_datum",
            ),
            (
                "kind = \"lunar-frame-campaign\"\nrel_tol = 2.0\n",
                "rel_tol",
            ),
            (
                "kind = \"lunar-frame-campaign\"\nassumed_coordinate_sigma_m = 0.0\n",
                "assumed_coordinate_sigma_m",
            ),
            (
                "kind = \"lunar-frame-campaign\"\n[[beacons]]\nlat_deg = 0.0\nlon_deg = 0.0\n",
                "at least 3",
            ),
            (
                "kind = \"lunar-frame-campaign\"\n[[stations]]\nlat_deg = 0.0\nlon_deg = 0.0\n",
                "at least 2",
            ),
        ] {
            let e = crate::api::run_toml(src).expect_err(&format!("{src:?} should be rejected"));
            let msg = format!("{e:?}");
            assert!(
                msg.contains(needle),
                "rejection message for {src:?} did not mention {needle:?}: {msg}"
            );
        }
    }

    #[test]
    fn a_mask_nothing_clears_is_an_error_not_an_empty_solve() {
        let e = crate::api::run_toml(
            "kind = \"lunar-frame-campaign\"\nelevation_mask_deg = 89.9\narc_hours = 1.0\n",
        )
        .expect_err("an impossible mask must be rejected");
        assert!(format!("{e:?}").contains("no observation"));
    }

    #[test]
    fn the_earth_side_horizon_test_removes_observations_and_never_adds_them() {
        // A mask above the beacon's own horizon can only ever reject.
        let open = run("kind = \"lunar-frame-campaign\"\nearth_elevation_mask_deg = -90.0\n");
        let tight = run("kind = \"lunar-frame-campaign\"\nearth_elevation_mask_deg = 20.0\n");
        let o = open["campaign"]["n_observations"].as_u64().unwrap();
        let t = tight["campaign"]["n_observations"].as_u64().unwrap();
        assert!(
            t <= o,
            "raising the lunar-side mask added observations: {t} > {o}"
        );
        assert!(t < o, "a 20 deg lunar-side mask rejected nothing at all");
    }

    // ---- the injected-transform path is untouched ---------------------------------------

    #[test]
    fn the_injected_transform_scenario_emits_byte_for_byte_what_it_emitted_before() {
        // R1, proved rather than asserted. These FNV-1a 64 fingerprints were taken from
        // `lunar-frame-realisation` on the commit this work branched from, BEFORE a line of it
        // was read into the new module. Every byte of its JSON, summary and SVG is covered, for
        // the default document and for two non-default ones, so an accidental field, a changed
        // default or a reordered key all fail here.
        fn fnv1a64(bytes: &[u8]) -> u64 {
            let mut h: u64 = 0xcbf2_9ce4_8422_2325;
            for &b in bytes {
                h ^= u64::from(b);
                h = h.wrapping_mul(0x1000_0000_01b3);
            }
            h
        }
        for (src, expect, expect_len) in [
            (
                "kind = \"lunar-frame-realisation\"\n",
                0xd4a0_2b1d_bf29_91c4_u64,
                2938_usize,
            ),
            (
                "kind = \"lunar-frame-realisation\"\nn_points = 12\nnoise_sigma_m = 0.5\nseed = 7\n",
                0x3556_a721_e142_cb29,
                2935,
            ),
            (
                "kind = \"lunar-frame-realisation\"\nnoise_sigma_m = 0.0\n",
                0xd930_d2e4_f86f_b1ef,
                2964,
            ),
        ] {
            let out = crate::api::run_toml(src).expect("the injected-transform scenario still runs");
            let mut buf = Vec::new();
            buf.extend_from_slice(out.json.as_bytes());
            buf.push(0);
            buf.extend_from_slice(out.summary.as_bytes());
            buf.push(0);
            buf.extend_from_slice(out.svg.as_bytes());
            assert_eq!(
                buf.len(),
                expect_len,
                "lunar-frame-realisation emission LENGTH changed for {src:?}"
            );
            assert_eq!(
                fnv1a64(&buf),
                expect,
                "lunar-frame-realisation emission CHANGED for {src:?} - R1 forbids it"
            );
        }
    }

    // ---- dispatch and registry ------------------------------------------------------------

    #[test]
    fn the_run_is_deterministic_and_the_dispatch_surface_is_populated() {
        let a = crate::api::run_toml("kind = \"lunar-frame-campaign\"\n").unwrap();
        let b = crate::api::run_toml("kind = \"lunar-frame-campaign\"\n").unwrap();
        assert_eq!(a.json, b.json);
        assert_eq!(a.summary, b.summary);
        assert!(a.summary.contains("lunar-frame-campaign"));
        assert!(a.svg.starts_with("<svg"));
        let v: serde_json::Value = serde_json::from_str(&a.json).unwrap();
        assert_eq!(v["kind"].as_str(), Some("lunar-frame-campaign"));
        assert!(v["label"].as_str().unwrap().contains("MODELLED"));
        assert!(v["label"]
            .as_str()
            .unwrap()
            .contains("NO similarity transform is injected"));
    }

    #[test]
    fn the_scenario_registers_in_the_pack_registry() {
        let reg = crate::registry::PackRegistry::with_builtins();
        let id = crate::registry::ids::LUNAR_FRAME_CAMPAIGN;
        assert!(reg.contains(&id), "{id} is not registered");
        assert!(crate::registry::ids::all().contains(&id));
    }

    #[test]
    fn the_short_campaign_helper_runs_through_the_typed_path() {
        // The struct path, not just the TOML path, so a caller embedding the scenario gets the
        // same document.
        let (json, summary) = short().run_json().expect("the short campaign runs");
        assert!(summary.contains("lunar-frame-campaign"));
        let v: serde_json::Value = serde_json::from_str(&json).unwrap();
        assert!(v["campaign"]["n_observations"].as_u64().unwrap() > 0);
    }

    // ---- the units contract -----------------------------------------------------------

    /// Walk every numeric leaf of `v`, collecting dotted paths; array elements share their
    /// array's path, and the `units` subtree itself is skipped.
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

    /// Every shape the document can take, so a field that only appears under one input still
    /// has to declare itself.
    const SHAPES: [&str; 4] = [
        "kind = \"lunar-frame-campaign\"\n",
        "kind = \"lunar-frame-campaign\"\nstation_datum = \"estimated-anchor-first\"\n",
        "kind = \"lunar-frame-campaign\"\nelevation_mask_deg = -90.0\narc_hours = 6.0\n",
        "kind = \"lunar-frame-campaign\"\n\
         [[beacons]]\nname = \"a\"\nlat_deg = 0.0\nlon_deg = 0.0\n\
         [[beacons]]\nname = \"b\"\nlat_deg = 0.0\nlon_deg = 0.0\nalt_m = 1000.0\n\
         [[beacons]]\nname = \"c\"\nlat_deg = 0.0\nlon_deg = 0.0\nalt_m = 2000.0\n",
    ];

    #[test]
    fn every_emitted_numeric_field_carries_a_unit_and_a_provenance_class() {
        for src in SHAPES {
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
        let mut seen: std::collections::HashSet<String> = std::collections::HashSet::new();
        for src in SHAPES {
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
