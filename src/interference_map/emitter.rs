// SPDX-License-Identifier: AGPL-3.0-only
//! Where can an interference source be? A feasible-region estimate from aircraft (ADS-B) or ship (AIS)
//! position reports, never a point.
//!
//! Model (MODELLED, `docs/INTERFERENCE-MAP.md`, "Emitter region"). Reports are binned into *units* (one
//! aircraft or vessel in one two-minute bin), each *affected* (low-accuracy ADS-B fields, or an implausible
//! AIS position) or *unaffected*. Affected units are grouped in time and space into *sessions*. For one session
//! every candidate emitter position `x` on a grid gets a likelihood from every unit:
//!
//! * radio line of sight to an aircraft at height `h` from an emitter antenna at `h_e` reaches
//!   `4.122 (sqrt h + sqrt h_e)` km on a 4/3-earth radius, and the emitter's power limits the reach to an
//!   effective range `R`;
//! * an aircraft or vessel is susceptible with probability `p_susceptible`; a unit of a susceptible one inside that
//!   reach is affected with probability `p_det`, any other unit with the background rate `p_bg`, so an
//!   unaffected aircraft with line of sight counts against `x` (by at most one aircraft's worth) and one
//!   without says nothing;
//! * `h_e` and `R` are nuisance parameters and are marginalised over fixed lists, and terrain is not modelled
//!   (it can only remove line of sight);
//! * susceptibility is a latent property of the aircraft or vessel, summed out per aircraft, so the units of one
//!   aircraft are not counted as independent evidence.
//!
//! The posterior over the grid gives the highest-density regions at the stated confidence levels, the
//! posterior-weighted centroid and its moment ellipse. Credibility is conditional on the model; the synthetic
//! round trips in the tests check that the known emitter falls inside at about the stated rate when the
//! generator matches the model, and the Jammertest comparison is a separate, pre-registered check.
//!
//! Aggregate only. Identifiers are used for distinct-counting and are never kept; a session is published only
//! with at least [`PUBLICATION_MIN_DISTINCT`] distinct aircraft or vessels; hour-of-day counts below that are
//! `null`.

use std::collections::{BTreeMap, HashMap, HashSet};

use super::adsb::{AdsbAggregator, AdsbParams, NONE_CODE};
use super::grid::{Grid, EARTH_RADIUS_M};
use super::time::{day_of, parse_timestamp};
use super::{IdHasher, MapError, PUBLICATION_MIN_DISTINCT};

/// Method id, written into every output.
pub const METHOD_ID: &str = "kshana-interference-map/emitter-region/v1";

/// Publishing emitter regions in the public observatory is a separate owner decision and is off. The
/// observatory does not read this module; a test pins this to `false`.
pub const OBSERVATORY_PUBLISHES_EMITTER_REGIONS: bool = false;

/// Each coarse grid cell holding appreciable posterior mass is split into this many sub-cells per side.
const REFINE: usize = 4;
/// A coarse cell is refined when its log density is within this of the peak.
const REFINE_LOG_RATIO: f64 = 9.0;

/// The effective ranges marginalised over (km): a geometric ladder of ratio 1.25 from 12 km to 426 km, then line of
/// sight only. The steps are about the width of the soft reach edge, so the grid does not constrain where the
/// data put the reach.
fn effective_range_grid() -> Vec<f64> {
    let mut v: Vec<f64> = (0..17).map(|k| 12.0 * 1.25f64.powi(k)).collect();
    v.push(f64::INFINITY);
    v
}

/// Emitter antenna heights marginalised over, spaced evenly in the logarithm between the two ends of the range.
const HEIGHT_STEPS: usize = 8;

/// Kilometres of radio horizon per square root of a height in metres, on a 4/3-earth radius
/// (`sqrt(2 * 4/3 * 6371.0088 km / 1000 m)`).
pub const HORIZON_KM_PER_SQRT_M: f64 = 4.121_9;

const FT_TO_M: f64 = 0.3048;
const EARTH_KM: f64 = EARTH_RADIUS_M / 1000.0;
const KN_TO_MS: f64 = 0.514_444;

/// What the reports are, which sets the report-level rule for "affected".
#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub enum Source {
    /// ADS-B: a report is affected when its NIC or NACp is low (the pre-registered ADS-B rule).
    Adsb,
    /// AIS: a report is affected when its position arrives as an implausible jump, its reported speed is
    /// implausible, or it lies inland of the supplied coastline.
    Ais,
}

impl Source {
    /// `adsb` or `ais`.
    pub fn as_str(self) -> &'static str {
        match self {
            Source::Adsb => "adsb",
            Source::Ais => "ais",
        }
    }
}

/// Parameters of the estimator. Fixed from the physics and from the privacy rule before any real data was
/// examined; a change is a new method version.
#[derive(Debug, Clone, PartialEq)]
pub struct EmitterParams {
    /// Seconds per unit bin.
    pub bin_s: f64,
    /// Affected share of a unit's reports at or above which the unit is affected.
    pub affected_report_share: f64,
    /// An aircraft or vessel counts only with at least this many good (unflagged) reports in the input.
    pub min_baseline_good: u32,
    /// Altitude floor for ADS-B reports (feet).
    pub min_alt_ft: f64,
    /// Antenna height range of the emitter above the datum of the report heights (metres).
    pub emitter_height_m: (f64, f64),
    /// Effective ranges (km) marginalised over, power being the unknown; `f64::INFINITY` is "line of sight only".
    pub effective_ranges_km: Vec<f64>,
    /// Probability that a unit within reach is affected.
    pub p_det: f64,
    /// Exponent applied to the log-likelihood (a power posterior): below one it widens the regions to allow for
    /// evidence that is more dependent, and edges less sharp, than the model says. Set from synthetic data only.
    pub temper: f64,
    /// Half-width of the soft edge of the reach, as a share of the reach: a unit at the reach is in reach with
    /// weight one half, and the weight falls linearly from one to zero across `reach +- softness * reach`.
    pub reach_softness: f64,
    /// Probability that an aircraft or vessel is susceptible at all: an unaffected one in reach is then a
    /// bounded counter-evidence of one aircraft, however many units it has.
    pub p_susceptible: f64,
    /// Probability that an aircraft or vessel has a persistent fault (its units are affected wherever it is):
    /// such a one is explained by the fault and cannot pull the posterior by more than one aircraft's worth.
    pub p_fault: f64,
    /// Probability that a unit is affected with no emitter in reach (other causes).
    pub p_bg: f64,
    /// A new session starts when affected units are more than this far apart in time (seconds).
    pub session_gap_s: f64,
    /// Confidence levels of the published regions, ascending.
    pub confidence_levels: Vec<f64>,
    /// Requested cell size of the search grid (km); raised when the grid would exceed `max_cells`.
    pub cell_km: f64,
    /// Largest number of grid cells.
    pub max_cells: usize,
    /// Most units used in one session; unaffected units are thinned evenly above it.
    pub max_units: usize,
    /// Most coarse cells refined 4 x 4.
    pub max_refined: usize,
    /// A region covering more than this share of the search domain is reported as unconstrained.
    pub unconstrained_share: f64,
}

impl EmitterParams {
    /// The pre-registered version 1 parameters.
    pub fn preregistered_v1() -> Self {
        Self {
            bin_s: 120.0,
            affected_report_share: 0.5,
            min_baseline_good: 5,
            min_alt_ft: 5000.0,
            emitter_height_m: (2.0, 100.0),
            effective_ranges_km: effective_range_grid(),
            p_det: 0.9,
            temper: 0.3,
            reach_softness: 0.15,
            p_susceptible: 0.6,
            p_fault: 0.03,
            p_bg: 0.03,
            session_gap_s: 1800.0,
            confidence_levels: vec![0.5, 0.9, 0.95],
            cell_km: 5.0,
            max_cells: 12_000,
            max_units: 4000,
            max_refined: 1000,
            unconstrained_share: 0.8,
        }
    }

    /// The parameters as JSON, for the method block.
    pub fn to_json(&self) -> serde_json::Value {
        let ranges: Vec<serde_json::Value> = self
            .effective_ranges_km
            .iter()
            .map(|r| {
                if r.is_finite() {
                    serde_json::json!(r)
                } else {
                    serde_json::json!("line_of_sight_only")
                }
            })
            .collect();
        serde_json::json!({
            "horizon_km_per_sqrt_m": HORIZON_KM_PER_SQRT_M,
            "earth_radius_factor": "4/3",
            "unit_bin_s": self.bin_s,
            "unit_affected_report_share": self.affected_report_share,
            "min_baseline_good_reports": self.min_baseline_good,
            "adsb_altitude_floor_ft": self.min_alt_ft,
            "emitter_height_m": [self.emitter_height_m.0, self.emitter_height_m.1],
            "emitter_height_steps_log_spaced": HEIGHT_STEPS,
            "effective_ranges_km": ranges,
            "p_susceptible": self.p_susceptible,
            "p_persistent_fault": self.p_fault,
            "p_detect_unit_given_susceptible_in_reach": self.p_det,
            "reach_softness": self.reach_softness,
            "likelihood_temper": self.temper,
            "p_background": self.p_bg,
            "per_aircraft_latent_susceptibility": true,
            "session_gap_s": self.session_gap_s,
            "confidence_levels": self.confidence_levels,
            "search_cell_km_requested": self.cell_km,
            "max_cells": self.max_cells,
            "max_units_per_session": self.max_units,
            "max_refined_cells": self.max_refined,
            "refine_factor": REFINE,
            "unconstrained_share": self.unconstrained_share,
            "publication_min_distinct": PUBLICATION_MIN_DISTINCT,
        })
    }
}

/// One report: the identifier is the per-run salted hash, used only to count distinct aircraft or vessels.
#[derive(Debug, Clone, Copy)]
pub struct Report {
    /// Unix seconds.
    pub t: f64,
    /// Hashed identifier.
    pub id: u64,
    /// Latitude, degrees.
    pub lat: f64,
    /// Longitude, degrees.
    pub lon: f64,
    /// Height of the receiver above the datum, metres.
    pub h_m: f64,
    /// The report is flagged (low accuracy, or an implausible position).
    pub flagged: bool,
    /// The report is good evidence the equipment can report (the baseline guard).
    pub good: bool,
}

/// One aircraft or vessel in one time bin.
#[derive(Debug, Clone, Copy)]
pub struct Unit {
    /// Mean time, Unix seconds.
    pub t: f64,
    /// Hashed identifier.
    pub id: u64,
    /// Mean latitude, degrees.
    pub lat: f64,
    /// Mean longitude, degrees.
    pub lon: f64,
    /// Mean height, metres.
    pub h_m: f64,
    /// Affected.
    pub affected: bool,
}

/// Counters of what was read and kept.
#[derive(Debug, Clone, Default, PartialEq, Eq)]
pub struct EmitterStats {
    /// Reports offered.
    pub reports: u64,
    /// Reports kept after the exclusions.
    pub reports_used: u64,
    /// Reports dropped by the altitude floor, a missing field or a malformed row.
    pub reports_excluded: u64,
    /// Aircraft or vessels dropped by the equipment baseline guard.
    pub excluded_no_baseline: u64,
    /// Units built.
    pub units: u64,
    /// Affected units.
    pub units_affected: u64,
    /// Candidate sessions with fewer than the publication minimum of distinct aircraft or vessels.
    pub sessions_suppressed_below_min_distinct: u64,
}

/// Reports from ADS-B CSV text or readsb traces, through the same exclusions and hashing as the map.
pub struct AdsbReports {
    agg: AdsbAggregator,
    params: AdsbParams,
}

impl Default for AdsbReports {
    fn default() -> Self {
        Self::new()
    }
}

impl AdsbReports {
    /// An empty reader with a fresh random salt.
    pub fn new() -> Self {
        let params = AdsbParams::PREREGISTERED_V1;
        Self {
            agg: AdsbAggregator::new(
                Grid::new(0.5).expect("0.5 is valid"),
                params.clone(),
                IdHasher::new(),
            )
            .record_rows(),
            params,
        }
    }

    /// The underlying aggregator, for the file-walking readers of the command line.
    pub(crate) fn aggregator(&mut self) -> &mut AdsbAggregator {
        &mut self.agg
    }

    /// Read the documented ADS-B CSV.
    pub fn read_csv(&mut self, text: &str) -> Result<(), MapError> {
        self.agg.read_csv(text)
    }

    /// Read one readsb trace file (gzip or plain JSON).
    pub fn read_trace(&mut self, bytes: &[u8]) -> Result<(), MapError> {
        self.agg
            .read_readsb_trace(bytes, super::api::MAX_TRACE_BYTES)
    }

    /// The reports, in input order, and the count of rows read.
    pub fn finish(mut self, min_alt_ft: f64) -> (Vec<Report>, u64) {
        let rows = self.agg.stats.rows;
        let recorded = self.agg.take_recorded();
        let code = |c: u8| (c != NONE_CODE).then_some(c);
        let out = recorded
            .iter()
            .filter(|r| r.alt_ft.is_finite() && r.alt_ft >= min_alt_ft)
            .filter(|r| code(r.nic).is_some() || code(r.nacp).is_some())
            .map(|r| {
                let (low, good) = self.params.classify(code(r.nic), code(r.nacp));
                Report {
                    t: r.ts,
                    id: r.aid,
                    lat: r.lat,
                    lon: r.lon,
                    h_m: r.alt_ft * FT_TO_M,
                    flagged: low,
                    good,
                }
            })
            .collect();
        (out, rows)
    }
}

/// Reports from AIS CSV text (`timestamp, vessel_id, lat, lon[, sog_kn]`), flagged by the report-level
/// rules of the AIS map: an implausible reported speed, a jump arriving at an implied speed above the limit,
/// or a position inland of the coastline.
pub fn ais_reports(
    csv: &str,
    land: Option<&mut super::land::LandMask>,
    ship_height_m: f64,
) -> Result<(Vec<Report>, u64), MapError> {
    use super::ais::{ais_position_is_valid, ais_speed_kn, AisParams};
    let p = AisParams::PREREGISTERED_V1;
    let hasher = IdHasher::new();
    struct Cols {
        t: usize,
        id: usize,
        lat: usize,
        lon: usize,
        sog: Option<usize>,
    }
    let mut rows = 0u64;
    type Row = (f64, f64, f64, Option<f64>);
    let mut by_vessel: HashMap<u64, Vec<Row>> = HashMap::new();
    super::stream_csv(
        csv.as_bytes(),
        |h| {
            Ok(Cols {
                t: h.require("timestamp")?,
                id: h.require("vessel_id")?,
                lat: h.require("lat")?,
                lon: h.require("lon")?,
                sog: h.col("sog_kn"),
            })
        },
        |c, row| {
            rows += 1;
            let get = |k: usize| row.get(k).copied().unwrap_or("");
            let (Some(t), Some(lat), Some(lon)) = (
                parse_timestamp(get(c.t)),
                get(c.lat).parse::<f64>().ok(),
                get(c.lon).parse::<f64>().ok(),
            ) else {
                return;
            };
            if get(c.id).is_empty() || !ais_position_is_valid(lat, lon) {
                return;
            }
            let sog = c
                .sog
                .and_then(|k| get(k).parse::<f64>().ok())
                .and_then(ais_speed_kn);
            by_vessel
                .entry(hasher.hash(get(c.id)))
                .or_default()
                .push((t, lat, lon, sog));
        },
    )?;
    let mut land = land;
    let mut out = Vec::new();
    let mut ids: Vec<u64> = by_vessel.keys().copied().collect();
    ids.sort_unstable();
    for id in ids {
        let mut v = by_vessel.remove(&id).unwrap_or_default();
        v.sort_by(|a, b| a.0.total_cmp(&b.0));
        for (k, &(t, lat, lon, sog)) in v.iter().enumerate() {
            let mut flagged = sog.is_some_and(|s| s > p.max_speed_kn);
            if k > 0 {
                let (t0, la0, lo0, _) = v[k - 1];
                let d = super::grid::haversine_m(la0, lo0, lat, lon);
                let dt = t - t0;
                if d >= p.jump_min_dist_m
                    && dt <= p.jump_max_dt_s
                    && d / dt.max(1.0) / KN_TO_MS > p.max_speed_kn
                {
                    flagged = true;
                }
            }
            if let Some(l) = land.as_deref_mut() {
                if l.is_inland(lat, lon) {
                    flagged = true;
                }
            }
            out.push(Report {
                t,
                id,
                lat,
                lon,
                h_m: ship_height_m,
                flagged,
                good: !flagged,
            });
        }
    }
    Ok((out, rows))
}

/// Bin reports into units after the equipment baseline guard.
pub fn build_units(reports: &[Report], p: &EmitterParams, stats: &mut EmitterStats) -> Vec<Unit> {
    stats.reports += reports.len() as u64;
    let mut good: HashMap<u64, u32> = HashMap::new();
    for r in reports {
        if r.good {
            *good.entry(r.id).or_default() += 1;
        }
    }
    let ids: HashSet<u64> = reports.iter().map(|r| r.id).collect();
    stats.excluded_no_baseline += ids
        .iter()
        .filter(|i| good.get(i).copied().unwrap_or(0) < p.min_baseline_good)
        .count() as u64;
    #[derive(Default)]
    struct Acc {
        n: u32,
        flagged: u32,
        t: f64,
        lat: f64,
        lon: f64,
        h: f64,
    }
    let mut bins: BTreeMap<(u64, i64), Acc> = BTreeMap::new();
    for r in reports {
        if good.get(&r.id).copied().unwrap_or(0) < p.min_baseline_good {
            continue;
        }
        stats.reports_used += 1;
        let a = bins
            .entry((r.id, (r.t / p.bin_s).floor() as i64))
            .or_default();
        a.n += 1;
        a.flagged += u32::from(r.flagged);
        a.t += r.t;
        a.lat += r.lat;
        a.lon += r.lon;
        a.h += r.h_m;
    }
    let units: Vec<Unit> = bins
        .into_iter()
        .map(|((id, _), a)| {
            let n = f64::from(a.n);
            Unit {
                t: a.t / n,
                id,
                lat: a.lat / n,
                lon: a.lon / n,
                h_m: a.h / n,
                affected: f64::from(a.flagged) / n >= p.affected_report_share,
            }
        })
        .collect();
    stats.units += units.len() as u64;
    stats.units_affected += units.iter().filter(|u| u.affected).count() as u64;
    units
}

/// Great-circle reach (km) of radio line of sight from a receiver height to an emitter antenna height.
pub fn los_reach_km(h_receiver_m: f64, h_emitter_m: f64) -> f64 {
    HORIZON_KM_PER_SQRT_M * (h_receiver_m.max(0.0).sqrt() + h_emitter_m.max(0.0).sqrt())
}

type V3 = [f64; 3];

fn unit_vec(lat: f64, lon: f64) -> V3 {
    let (p, l) = (lat.to_radians(), lon.to_radians());
    [p.cos() * l.cos(), p.cos() * l.sin(), p.sin()]
}

fn dot(a: V3, b: V3) -> f64 {
    a[0] * b[0] + a[1] * b[1] + a[2] * b[2]
}

/// Local azimuthal-equidistant projection about a centre, kilometres east and north.
#[derive(Debug, Clone, Copy)]
pub struct Proj {
    lat0: f64,
    lon0: f64,
}

impl Proj {
    /// A projection centred at `(lat0, lon0)` degrees.
    pub fn new(lat0: f64, lon0: f64) -> Self {
        Self {
            lat0: lat0.to_radians(),
            lon0: lon0.to_radians(),
        }
    }

    /// `(east, north)` km of a position.
    pub fn forward(&self, lat: f64, lon: f64) -> (f64, f64) {
        let (p, l) = (lat.to_radians(), lon.to_radians());
        let dl = l - self.lon0;
        let c = (self.lat0.sin() * p.sin() + self.lat0.cos() * p.cos() * dl.cos())
            .clamp(-1.0, 1.0)
            .acos();
        if c.abs() < 1e-12 {
            return (0.0, 0.0);
        }
        let k = c / c.sin();
        (
            EARTH_KM * k * p.cos() * dl.sin(),
            EARTH_KM * k * (self.lat0.cos() * p.sin() - self.lat0.sin() * p.cos() * dl.cos()),
        )
    }

    /// `(lat, lon)` degrees of `(east, north)` km.
    pub fn inverse(&self, x: f64, y: f64) -> (f64, f64) {
        let rho = x.hypot(y);
        if rho < 1e-9 {
            return (self.lat0.to_degrees(), self.lon0.to_degrees());
        }
        let c = rho / EARTH_KM;
        let lat = (c.cos() * self.lat0.sin() + y / rho * c.sin() * self.lat0.cos())
            .clamp(-1.0, 1.0)
            .asin();
        let lon = self.lon0
            + (x * c.sin()).atan2(rho * self.lat0.cos() * c.cos() - y * self.lat0.sin() * c.sin());
        (lat.to_degrees(), (lon.to_degrees() + 540.0) % 360.0 - 180.0)
    }
}

/// A session: affected units that can share one emitter, with the unaffected units seen meanwhile.
#[derive(Debug, Clone)]
pub struct Session {
    /// Affected units.
    pub affected: Vec<Unit>,
    /// Unaffected units seen between the first and last affected unit.
    pub unaffected: Vec<Unit>,
    /// First affected time, Unix seconds.
    pub start: f64,
    /// Last affected time, Unix seconds.
    pub end: f64,
}

impl Session {
    /// Distinct aircraft or vessels among the affected units.
    pub fn distinct_affected(&self) -> usize {
        self.affected
            .iter()
            .map(|u| u.id)
            .collect::<HashSet<_>>()
            .len()
    }

    /// Distinct aircraft or vessels among all units.
    pub fn distinct_observed(&self) -> usize {
        self.affected
            .iter()
            .chain(&self.unaffected)
            .map(|u| u.id)
            .collect::<HashSet<_>>()
            .len()
    }
}

fn find(parent: &mut [usize], mut a: usize) -> usize {
    while parent[a] != a {
        parent[a] = parent[parent[a]];
        a = parent[a];
    }
    a
}

/// Group affected units into sessions: a gap in time of more than `session_gap_s` splits, and within a
/// time cluster two units are linked when one emitter could be in reach of both (their reaches overlap at
/// the largest emitter height); a linked set is one session. Sessions with fewer than the publication minimum
/// of distinct aircraft or vessels are dropped and counted.
pub fn sessions(units: &[Unit], p: &EmitterParams, stats: &mut EmitterStats) -> Vec<Session> {
    let mut aff: Vec<Unit> = units.iter().filter(|u| u.affected).copied().collect();
    aff.sort_by(|a, b| a.t.total_cmp(&b.t));
    let mut un: Vec<Unit> = units.iter().filter(|u| !u.affected).copied().collect();
    un.sort_by(|a, b| a.t.total_cmp(&b.t));
    let mut clusters: Vec<Vec<Unit>> = Vec::new();
    for u in aff {
        match clusters.last_mut() {
            Some(c) if u.t - c.last().map_or(u.t, |x| x.t) <= p.session_gap_s => c.push(u),
            _ => clusters.push(vec![u]),
        }
    }
    let he = p.emitter_height_m.1;
    let mut out = Vec::new();
    for c in clusters {
        let vecs: Vec<V3> = c.iter().map(|u| unit_vec(u.lat, u.lon)).collect();
        let reach: Vec<f64> = c.iter().map(|u| los_reach_km(u.h_m, he)).collect();
        let mut parent: Vec<usize> = (0..c.len()).collect();
        for i in 0..c.len() {
            for j in (i + 1)..c.len() {
                let d = dot(vecs[i], vecs[j]).clamp(-1.0, 1.0).acos() * EARTH_KM;
                if d <= reach[i] + reach[j] {
                    let (a, b) = (find(&mut parent, i), find(&mut parent, j));
                    parent[a] = b;
                }
            }
        }
        let mut groups: BTreeMap<usize, Vec<Unit>> = BTreeMap::new();
        for (i, u) in c.iter().enumerate() {
            let r = find(&mut parent, i);
            groups.entry(r).or_default().push(*u);
        }
        for (_, g) in groups {
            let start = g.iter().map(|u| u.t).fold(f64::INFINITY, f64::min);
            let end = g.iter().map(|u| u.t).fold(f64::NEG_INFINITY, f64::max);
            let unaffected: Vec<Unit> = un
                .iter()
                .filter(|u| u.t >= start && u.t <= end)
                .copied()
                .collect();
            let s = Session {
                affected: g,
                unaffected,
                start,
                end,
            };
            if s.distinct_affected() < PUBLICATION_MIN_DISTINCT {
                stats.sessions_suppressed_below_min_distinct += 1;
            } else {
                out.push(s);
            }
        }
    }
    out.sort_by(|a, b| a.start.total_cmp(&b.start));
    out
}

/// A confidence region as a set of grid cells.
#[derive(Debug, Clone)]
pub struct Region {
    /// The confidence level.
    pub level: f64,
    /// Rings of the region in `(lon, lat)`, outer rings counter-clockwise, each with its holes.
    pub polygons: Vec<Vec<Vec<[f64; 2]>>>,
    /// Area, km squared.
    pub area_km2: f64,
}

/// The estimate for one session.
#[derive(Debug, Clone)]
pub struct Estimate {
    /// Regions at the confidence levels, ascending.
    pub regions: Vec<Region>,
    /// Posterior-weighted centroid `(lat, lon)`.
    pub centroid: (f64, f64),
    /// Moment ellipse of the posterior: semi-major, semi-minor (km, scaled to 95% under a Gaussian) and the
    /// azimuth of the major axis in degrees clockwise from north.
    pub ellipse: (f64, f64, f64),
    /// The ellipse as a closed ring in `(lon, lat)`.
    pub ellipse_ring: Vec<[f64; 2]>,
    /// The search domain's area, km squared.
    pub domain_area_km2: f64,
    /// True when the data do not constrain the emitter to less than `unconstrained_share` of the domain.
    pub unconstrained: bool,
    /// Grid cell side actually used, km.
    pub cell_km: f64,
    /// Units used: affected, unaffected, and unaffected units dropped by thinning.
    pub units: (usize, usize, usize),
    /// Distinct unaffected aircraft or vessels with line of sight to the 95% region's centroid under the
    /// largest reach: the counter-evidence behind the estimate.
    pub unaffected_with_los: usize,
}

struct Scenario {
    he: f64,
    range_km: f64,
}

/// Estimate the emitter region of one session; `external` optionally multiplies the posterior by a
/// Gaussian fix (`lat, lon, sigma_east_km, sigma_north_km, rho`), for example from `geolocation.rs`.
pub fn estimate(
    s: &Session,
    p: &EmitterParams,
    external: Option<&GaussianFix>,
) -> Option<Estimate> {
    // Thin the unaffected units evenly above the cap; the affected units are all kept.
    let room = p.max_units.saturating_sub(s.affected.len()).max(1);
    let mut un: Vec<Unit> = s.unaffected.clone();
    let dropped = un.len().saturating_sub(room);
    if un.len() > room {
        let step = un.len() as f64 / room as f64;
        un = (0..room)
            .map(|k| s.unaffected[(k as f64 * step) as usize])
            .collect();
    }
    let mut units: Vec<Unit> = s.affected.clone();
    units.extend(un.iter().copied());
    // Aircraft index of every unit (the units of one aircraft share a latent susceptibility).
    let mut ac_index: HashMap<u64, usize> = HashMap::new();
    let ac_of: Vec<usize> = units
        .iter()
        .map(|u| {
            let n = ac_index.len();
            *ac_index.entry(u.id).or_insert(n)
        })
        .collect();
    let n_ac = ac_index.len();
    let vecs: Vec<V3> = units.iter().map(|u| unit_vec(u.lat, u.lon)).collect();

    // Scenarios: emitter heights x effective ranges.
    let (h0, h1) = p.emitter_height_m;
    let heights: Vec<f64> = (0..HEIGHT_STEPS)
        .map(|k| h0 * (h1 / h0).powf(k as f64 / (HEIGHT_STEPS - 1) as f64))
        .collect();
    let mut scen = Vec::new();
    for &he in &heights {
        for &r in &p.effective_ranges_km {
            scen.push(Scenario { he, range_km: r });
        }
    }
    // Projection and grid: centred on the affected units, extended by the largest reach.
    let n_aff = s.affected.len() as f64;
    let mut c3 = [0.0; 3];
    for u in &s.affected {
        let v = unit_vec(u.lat, u.lon);
        for k in 0..3 {
            c3[k] += v[k] / n_aff;
        }
    }
    let cn = (c3[0] * c3[0] + c3[1] * c3[1] + c3[2] * c3[2]).sqrt();
    if cn < 1e-9 {
        return None;
    }
    let lat0 = (c3[2] / cn).asin().to_degrees();
    let lon0 = c3[1].atan2(c3[0]).to_degrees();
    let proj = Proj::new(lat0, lon0);
    let max_reach = s
        .affected
        .iter()
        .map(|u| {
            los_reach_km(u.h_m, h1).min(p.effective_ranges_km.iter().cloned().fold(0.0, f64::max))
        })
        .fold(0.0, f64::max)
        .min(EARTH_KM * 1.2);
    let (mut xmin, mut xmax, mut ymin, mut ymax) = (f64::MAX, f64::MIN, f64::MAX, f64::MIN);
    for u in &s.affected {
        let (x, y) = proj.forward(u.lat, u.lon);
        xmin = xmin.min(x);
        xmax = xmax.max(x);
        ymin = ymin.min(y);
        ymax = ymax.max(y);
    }
    let (xmin, xmax, ymin, ymax) = (
        xmin - max_reach,
        xmax + max_reach,
        ymin - max_reach,
        ymax + max_reach,
    );
    let mut cell = p.cell_km.max(0.1);
    let cells_at = |c: f64| (((xmax - xmin) / c).ceil() * ((ymax - ymin) / c).ceil()) as usize;
    while cells_at(cell) > p.max_cells {
        cell *= 1.15;
    }
    let nx = ((xmax - xmin) / cell).ceil() as usize;
    let ny = ((ymax - ymin) / cell).ceil() as usize;

    // Scenarios that give every unit the same reach (to 0.5 km) are one scenario with a multiplicity, so the prior
    // weight of "line of sight only" is kept without computing it many times.
    let reach_of = |sc: &Scenario, u: &Unit| los_reach_km(u.h_m, sc.he).min(sc.range_km).max(0.1);
    let mut uniq: Vec<(usize, f64)> = Vec::new();
    for (si, sc) in scen.iter().enumerate() {
        let dup = uniq.iter_mut().find(|(sj, _)| {
            units
                .iter()
                .all(|u| (reach_of(sc, u) - reach_of(&scen[*sj], u)).abs() < 0.5)
        });
        match dup {
            Some(d) => d.1 += 1.0,
            None => uniq.push((si, 1.0)),
        }
    }
    let ns = uniq.len();
    let ln_w: Vec<f64> = uniq.iter().map(|(_, c)| c.ln()).collect();
    let ln_w_total = (scen.len() as f64).ln();
    // The soft edge of the reach is at least three-quarters of a coarse grid cell wide on each side: the reach is
    // not known better than the grid can resolve, and a likelihood sharper than the grid could be missed by the
    // coarse pass.
    let w = p.reach_softness.clamp(0.0, 0.9);
    let hw_min = 0.75 * cell;
    let mut edge: Vec<f64> = Vec::with_capacity(units.len() * ns);
    let mut inv_width: Vec<f64> = Vec::with_capacity(units.len() * ns);
    let mut rho_max: Vec<f64> = Vec::with_capacity(units.len());
    for u in &units {
        let mut mx = 0.0f64;
        for (si, _) in &uniq {
            let r = reach_of(&scen[*si], u);
            let hw = (w * r).max(hw_min);
            edge.push(r + hw);
            inv_width.push(1.0 / (2.0 * hw));
            mx = mx.max(r + hw);
        }
        rho_max.push(mx);
    }
    let d_aff = (p.p_det / p.p_bg).ln();
    let d_un = ((1.0 - p.p_det) / (1.0 - p.p_bg)).ln();
    let delta: Vec<f64> = units
        .iter()
        .map(|u| if u.affected { d_aff } else { d_un })
        .collect();
    // A persistently faulty aircraft is affected wherever it is: its log odds against the background, per aircraft.
    let mut fault = vec![0.0f64; n_ac];
    for (i, u) in units.iter().enumerate() {
        fault[ac_of[i]] += if u.affected { d_aff } else { d_un };
    }
    let ln_ps = p.p_susceptible.ln();
    let ln_pf = p.p_fault.ln();
    let ln_rest = (1.0 - p.p_susceptible - p.p_fault).max(1e-9).ln();

    // Posterior over the grid: a coarse pass over the whole domain, then every coarse cell that holds
    // appreciable mass is split `REFINE` x `REFINE`, so the regions are not limited by the coarse cell size.
    let n_aff_units = s.affected.len();
    let eval = |x: f64, y: f64| -> f64 {
        let (la, lo) = proj.inverse(x, y);
        let cv = unit_vec(la, lo);
        // The emitter must be able to affect at least one affected unit.
        if !(0..n_aff_units)
            .any(|i| dot(vecs[i], cv).clamp(-1.0, 1.0).acos() * EARTH_KM <= rho_max[i])
        {
            return f64::NEG_INFINITY;
        }
        let mut acc = vec![0.0f64; ns * n_ac];
        for i in 0..units.len() {
            let d = dot(vecs[i], cv).clamp(-1.0, 1.0).acos() * EARTH_KM;
            if d > rho_max[i] {
                continue;
            }
            let (r, iw) = (
                &edge[i * ns..(i + 1) * ns],
                &inv_width[i * ns..(i + 1) * ns],
            );
            let a = &mut acc[ac_of[i] * ns..(ac_of[i] + 1) * ns];
            let di = delta[i];
            for j in 0..ns {
                // Linear soft edge: weight one inside reach-hw, zero beyond reach+hw.
                let m = ((r[j] - d) * iw[j]).clamp(0.0, 1.0);
                a[j] += m * di;
            }
        }
        // Per scenario: the sum over aircraft of ln(p_s e^S + p_rest + p_f e^F), S the in-reach log odds of the
        // aircraft and F its log odds under a persistent fault.
        let mut ll = vec![0.0f64; ns];
        for a in 0..n_ac {
            let f = ln_pf + fault[a];
            for (j, l) in ll.iter_mut().enumerate() {
                let t = [ln_ps + acc[a * ns + j], ln_rest, f];
                let m = t[0].max(t[1]).max(t[2]);
                *l += m + ((t[0] - m).exp() + (t[1] - m).exp() + (t[2] - m).exp()).ln();
            }
        }
        let tl: Vec<f64> = ll.iter().zip(&ln_w).map(|(l, w)| l + w).collect();
        let m = tl.iter().cloned().fold(f64::NEG_INFINITY, f64::max);
        let sum: f64 = tl.iter().map(|a| (a - m).exp()).sum();
        let mut v = p.temper * (m + sum.ln() - ln_w_total);
        if let Some(g) = external {
            v += g.log_density(&proj, x, y);
        }
        v
    };
    let cell_xy = |ix: usize, iy: usize| {
        (
            xmin + (ix as f64 + 0.5) * cell,
            ymin + (iy as f64 + 0.5) * cell,
        )
    };
    let mut logp = vec![f64::NEG_INFINITY; nx * ny];
    for iy in 0..ny {
        for ix in 0..nx {
            let (x, y) = cell_xy(ix, iy);
            logp[iy * nx + ix] = eval(x, y);
        }
    }
    let m0 = logp.iter().cloned().fold(f64::NEG_INFINITY, f64::max);
    if !m0.is_finite() {
        return None;
    }
    let domain_cells = logp.iter().filter(|l| l.is_finite()).count();
    let domain_area = domain_cells as f64 * cell * cell;
    // Cells to refine: within `REFINE_LOG_RATIO` of the peak, at most `MAX_REFINED` of them, best first.
    let mut cand: Vec<usize> = (0..logp.len())
        .filter(|&k| logp[k] >= m0 - REFINE_LOG_RATIO)
        .collect();
    cand.sort_by(|&a, &b| logp[b].total_cmp(&logp[a]).then(a.cmp(&b)));
    cand.truncate(p.max_refined);
    let (fnx, fny, fcell) = (nx * REFINE, ny * REFINE, cell / REFINE as f64);
    let mut flog = vec![f64::NEG_INFINITY; fnx * fny];
    // Cells not refined keep the coarse density, spread evenly over their sub-cells.
    for iy in 0..fny {
        for ix in 0..fnx {
            flog[iy * fnx + ix] = logp[(iy / REFINE) * nx + ix / REFINE];
        }
    }
    for &k in &cand {
        let (cx, cy) = (k % nx, k / nx);
        for sy in 0..REFINE {
            for sx in 0..REFINE {
                let (fx, fy) = (cx * REFINE + sx, cy * REFINE + sy);
                let x = xmin + (fx as f64 + 0.5) * fcell;
                let y = ymin + (fy as f64 + 0.5) * fcell;
                flog[fy * fnx + fx] = eval(x, y);
            }
        }
    }
    let m = flog.iter().cloned().fold(f64::NEG_INFINITY, f64::max);
    let mut post: Vec<f64> = flog
        .iter()
        .map(|l| if l.is_finite() { (l - m).exp() } else { 0.0 })
        .collect();
    let total: f64 = post.iter().sum();
    for q in post.iter_mut() {
        *q /= total;
    }
    let (nx, ny, cell) = (fnx, fny, fcell);

    // Highest-density regions.
    let mut order: Vec<usize> = (0..post.len()).filter(|&k| post[k] > 0.0).collect();
    order.sort_by(|&a, &b| post[b].total_cmp(&post[a]).then(a.cmp(&b)));
    let mut regions = Vec::new();
    for &level in &p.confidence_levels {
        let mut sel = vec![false; nx * ny];
        let mut mass = 0.0;
        let mut n = 0usize;
        for &k in &order {
            if mass >= level {
                break;
            }
            sel[k] = true;
            mass += post[k];
            n += 1;
        }
        regions.push(Region {
            level,
            polygons: cells_to_polygons(&sel, nx, ny, xmin, ymin, cell, &proj),
            area_km2: n as f64 * cell * cell,
        });
    }
    // Centroid and moment ellipse.
    let (mut mx, mut my) = (0.0, 0.0);
    for (k, &pk) in post.iter().enumerate() {
        if pk > 0.0 {
            mx += pk * (xmin + ((k % nx) as f64 + 0.5) * cell);
            my += pk * (ymin + ((k / nx) as f64 + 0.5) * cell);
        }
    }
    let (mut sxx, mut syy, mut sxy) = (0.0, 0.0, 0.0);
    for (k, &pk) in post.iter().enumerate() {
        if pk > 0.0 {
            let (dx, dy) = (
                xmin + ((k % nx) as f64 + 0.5) * cell - mx,
                ymin + ((k / nx) as f64 + 0.5) * cell - my,
            );
            sxx += pk * dx * dx;
            syy += pk * dy * dy;
            sxy += pk * dx * dy;
        }
    }
    // One cell of quantisation variance, so a single-cell posterior is not a zero-size ellipse.
    let q = cell * cell / 12.0;
    let (sxx, syy) = (sxx + q, syy + q);
    let tr = sxx + syy;
    let det = sxx * syy - sxy * sxy;
    let disc = (tr * tr / 4.0 - det).max(0.0).sqrt();
    let (l1, l2) = (tr / 2.0 + disc, (tr / 2.0 - disc).max(0.0));
    let scale = 5.991_464_547_107_98_f64.sqrt();
    let (a, b) = (scale * l1.sqrt(), scale * l2.sqrt());
    let theta = 0.5 * (2.0 * sxy).atan2(sxx - syy); // from the x (east) axis
    let az = (90.0 - theta.to_degrees()).rem_euclid(180.0);
    let ring: Vec<[f64; 2]> = (0..=72)
        .map(|k| {
            let t = k as f64 / 72.0 * std::f64::consts::TAU;
            let (ex, ey) = (a * t.cos(), b * t.sin());
            let (x, y) = (
                mx + ex * theta.cos() - ey * theta.sin(),
                my + ex * theta.sin() + ey * theta.cos(),
            );
            let (la, lo) = proj.inverse(x, y);
            [lo, la]
        })
        .collect();
    let (clat, clon) = proj.inverse(mx, my);
    let top = regions.last().map_or(0.0, |r| r.area_km2);
    let cvec = unit_vec(clat, clon);
    let los_ids: HashSet<u64> = s
        .unaffected
        .iter()
        .filter(|u| {
            dot(unit_vec(u.lat, u.lon), cvec).clamp(-1.0, 1.0).acos() * EARTH_KM
                <= los_reach_km(u.h_m, h0)
        })
        .map(|u| u.id)
        .collect();
    Some(Estimate {
        regions,
        centroid: (clat, clon),
        ellipse: (a, b, az),
        ellipse_ring: ring,
        domain_area_km2: domain_area,
        unconstrained: top > p.unconstrained_share * domain_area,
        cell_km: cell,
        units: (s.affected.len(), un.len(), dropped),
        unaffected_with_los: los_ids.len(),
    })
}

/// A Gaussian position fix to fuse with the line-of-sight posterior.
#[derive(Debug, Clone, Copy)]
pub struct GaussianFix {
    /// Latitude, degrees.
    pub lat: f64,
    /// Longitude, degrees.
    pub lon: f64,
    /// Standard deviation east, km.
    pub sigma_east_km: f64,
    /// Standard deviation north, km.
    pub sigma_north_km: f64,
    /// Correlation east-north.
    pub rho: f64,
}

impl GaussianFix {
    fn log_density(&self, proj: &Proj, x: f64, y: f64) -> f64 {
        let (fx, fy) = proj.forward(self.lat, self.lon);
        let (dx, dy) = (
            (x - fx) / self.sigma_east_km,
            (y - fy) / self.sigma_north_km,
        );
        let r = self.rho.clamp(-0.999, 0.999);
        -(dx * dx - 2.0 * r * dx * dy + dy * dy) / (2.0 * (1.0 - r * r))
    }

    /// A fix from time differences of arrival at three or more receivers, by [`crate::geolocation`]: the
    /// least-squares position and the Cramer-Rao covariance on the Earth's surface. Receivers are
    /// `(lat, lon, height_m)`; `tdoa_s[i]` is the arrival time of receiver `i + 1` minus receiver 0.
    pub fn from_tdoa(
        receivers: &[(f64, f64, f64)],
        tdoa_s: &[f64],
        sigma_s: f64,
        start: (f64, f64),
    ) -> Option<Self> {
        use crate::geolocation::{tdoa_crlb_on_sphere, tdoa_predict, C};
        if receivers.len() < 3
            || tdoa_s.len() != receivers.len() - 1
            || sigma_s.is_nan()
            || sigma_s <= 0.0
        {
            return None;
        }
        let ecef = |lat: f64, lon: f64, h: f64| {
            let (p, l) = (lat.to_radians(), lon.to_radians());
            let r = EARTH_RADIUS_M + h;
            [r * p.cos() * l.cos(), r * p.cos() * l.sin(), r * p.sin()]
        };
        let rx: Vec<[f64; 3]> = receivers.iter().map(|&(a, o, h)| ecef(a, o, h)).collect();
        // Two-dimensional Gauss-Newton on the surface (east, north in km about the start): ground
        // receivers leave the height unobservable, so the position is constrained to the Earth's surface.
        let proj = Proj::new(start.0, start.1);
        let model = |x: f64, y: f64| {
            let (la, lo) = proj.inverse(x, y);
            tdoa_predict(ecef(la, lo, 0.0), &rx)
        };
        let (mut x, mut y) = (0.0f64, 0.0f64);
        for _ in 0..40 {
            let f0 = model(x, y);
            let h = 0.05;
            let (fx, fy) = (model(x + h, y), model(x, y + h));
            let (mut a11, mut a12, mut a22, mut b1, mut b2) = (0.0, 0.0, 0.0, 0.0, 0.0);
            for i in 0..f0.len() {
                let (jx, jy) = ((fx[i] - f0[i]) / h, (fy[i] - f0[i]) / h);
                let r = tdoa_s[i] - f0[i];
                a11 += jx * jx;
                a12 += jx * jy;
                a22 += jy * jy;
                b1 += jx * r;
                b2 += jy * r;
            }
            let det = a11 * a22 - a12 * a12;
            let det_ok = det.abs() > 1e-30;
            if !det_ok {
                return None;
            }
            let (dx, dy) = ((a22 * b1 - a12 * b2) / det, (a11 * b2 - a12 * b1) / det);
            x += dx;
            y += dy;
            if dx.hypot(dy) < 1e-6 {
                break;
            }
            if x.hypot(y) > 5000.0 {
                return None;
            }
        }
        let (lat, lon) = proj.inverse(x, y);
        let x = ecef(lat, lon, 0.0);
        let n = receivers.len() - 1;
        // Range differences against a common reference receiver with equal, independent receiver noise:
        // variance 2 sigma^2 on the diagonal, sigma^2 off it.
        let sig_rd = sigma_s * C;
        let q: Vec<Vec<f64>> = (0..n)
            .map(|i| {
                (0..n)
                    .map(|j| sig_rd * sig_rd * if i == j { 2.0 } else { 1.0 })
                    .collect()
            })
            .collect();
        let cov = tdoa_crlb_on_sphere(&rx, [x[0], x[1], x[2]], &q)?;
        let (p0, l0) = (lat.to_radians(), lon.to_radians());
        let east = [-l0.sin(), l0.cos(), 0.0];
        let north = [-p0.sin() * l0.cos(), -p0.sin() * l0.sin(), p0.cos()];
        let quad = |a: [f64; 3], b: [f64; 3]| {
            let mut s = 0.0;
            for i in 0..3 {
                for j in 0..3 {
                    s += a[i] * cov[i][j] * b[j];
                }
            }
            s / 1.0e6
        };
        let (se, sn, sen) = (quad(east, east), quad(north, north), quad(east, north));
        if !(se > 0.0 && sn > 0.0) {
            return None;
        }
        Some(Self {
            lat,
            lon,
            sigma_east_km: se.sqrt(),
            sigma_north_km: sn.sqrt(),
            rho: sen / (se.sqrt() * sn.sqrt()),
        })
    }
}

/// The boundary of a set of grid cells as polygons in `(lon, lat)`.
fn cells_to_polygons(
    sel: &[bool],
    nx: usize,
    ny: usize,
    xmin: f64,
    ymin: f64,
    cell: f64,
    proj: &Proj,
) -> Vec<Vec<Vec<[f64; 2]>>> {
    let at = |ix: i64, iy: i64| -> bool {
        ix >= 0
            && iy >= 0
            && (ix as usize) < nx
            && (iy as usize) < ny
            && sel[iy as usize * nx + ix as usize]
    };
    // Directed edges with the selected cell on the left, as vertex pairs of the cell lattice.
    let mut next: HashMap<(i64, i64), Vec<(i64, i64)>> = HashMap::new();
    for iy in 0..ny as i64 {
        for ix in 0..nx as i64 {
            if !at(ix, iy) {
                continue;
            }
            if !at(ix, iy - 1) {
                next.entry((ix, iy)).or_default().push((ix + 1, iy));
            }
            if !at(ix + 1, iy) {
                next.entry((ix + 1, iy)).or_default().push((ix + 1, iy + 1));
            }
            if !at(ix, iy + 1) {
                next.entry((ix + 1, iy + 1)).or_default().push((ix, iy + 1));
            }
            if !at(ix - 1, iy) {
                next.entry((ix, iy + 1)).or_default().push((ix, iy));
            }
        }
    }
    let mut keys: Vec<(i64, i64)> = next.keys().copied().collect();
    keys.sort_unstable();
    let mut rings: Vec<Vec<(i64, i64)>> = Vec::new();
    for start in keys {
        while let Some(first) = next.get_mut(&start).and_then(|v| v.pop()) {
            let mut ring = vec![start];
            let mut cur = first;
            let mut guard = 0usize;
            while cur != start && guard < 4 * nx * ny + 8 {
                ring.push(cur);
                let outs = next.get_mut(&cur);
                let Some(outs) = outs else { break };
                let prev = ring[ring.len() - 2];
                // At a vertex with two outgoing edges, turn left (keeps touching rings apart).
                let pick = if outs.len() > 1 {
                    let (dx, dy) = (cur.0 - prev.0, cur.1 - prev.1);
                    let left = outs
                        .iter()
                        .position(|o| (dx * (o.1 - cur.1) - dy * (o.0 - cur.0)) > 0);
                    left.unwrap_or(0)
                } else {
                    0
                };
                cur = outs.remove(pick);
                guard += 1;
            }
            rings.push(ring);
        }
    }
    let to_ll = |v: (i64, i64)| -> [f64; 2] {
        let (la, lo) = proj.inverse(xmin + v.0 as f64 * cell, ymin + v.1 as f64 * cell);
        [lo, la]
    };
    // Drop collinear vertices, then split outer rings (positive area) from holes.
    let mut outers: Vec<(Vec<(i64, i64)>, f64)> = Vec::new();
    let mut holes: Vec<Vec<(i64, i64)>> = Vec::new();
    for ring in rings {
        let n = ring.len();
        let mut simp = Vec::new();
        for k in 0..n {
            let (a, b, c) = (ring[(k + n - 1) % n], ring[k], ring[(k + 1) % n]);
            if (b.0 - a.0) * (c.1 - b.1) - (b.1 - a.1) * (c.0 - b.0) != 0 {
                simp.push(b);
            }
        }
        if simp.len() < 3 {
            continue;
        }
        let area: f64 = (0..simp.len())
            .map(|k| {
                let (a, b) = (simp[k], simp[(k + 1) % simp.len()]);
                (a.0 * b.1 - b.0 * a.1) as f64 / 2.0
            })
            .sum();
        if area > 0.0 {
            outers.push((simp, area));
        } else {
            holes.push(simp);
        }
    }
    let inside = |poly: &[(i64, i64)], px: f64, py: f64| -> bool {
        let mut c = false;
        let n = poly.len();
        for i in 0..n {
            let (a, b) = (poly[i], poly[(i + 1) % n]);
            let (ax, ay, bx, by) = (a.0 as f64, a.1 as f64, b.0 as f64, b.1 as f64);
            if (ay > py) != (by > py) && px < (bx - ax) * (py - ay) / (by - ay) + ax {
                c = !c;
            }
        }
        c
    };
    let mut out: Vec<Vec<Vec<[f64; 2]>>> = outers
        .iter()
        .map(|(r, _)| {
            let mut ring: Vec<[f64; 2]> = r.iter().map(|&v| to_ll(v)).collect();
            ring.push(ring[0]);
            vec![ring]
        })
        .collect();
    for h in holes {
        // A point just inside the hole: the first edge's midpoint, nudged to its right.
        let (a, b) = (h[0], h[1]);
        let (mx, my) = ((a.0 + b.0) as f64 / 2.0, (a.1 + b.1) as f64 / 2.0);
        let (ex, ey) = ((b.0 - a.0) as f64, (b.1 - a.1) as f64);
        let (px, py) = (mx + 0.25 * ey, my - 0.25 * ex);
        let best = outers
            .iter()
            .enumerate()
            .filter(|(_, (r, _))| inside(r, px, py))
            .min_by(|x, y| x.1 .1.total_cmp(&y.1 .1))
            .map(|(i, _)| i);
        if let Some(i) = best {
            let mut ring: Vec<[f64; 2]> = h.iter().map(|&v| to_ll(v)).collect();
            ring.push(ring[0]);
            out[i].push(ring);
        }
    }
    out
}

/// Seconds of a session overlapping a UTC hour of day, summed: the time-of-day profile input.
fn overlap_s(a: f64, b: f64, lo: f64, hi: f64) -> f64 {
    (b.min(hi) - a.max(lo)).max(0.0)
}

/// Time-of-day profile and hours per day over the published sessions.
#[derive(Debug, Clone, PartialEq)]
pub struct Profile {
    /// Distinct affected aircraft or vessels per UTC hour of day, or `None` (withheld) below the minimum.
    pub distinct_by_hour: Vec<Option<usize>>,
    /// Minutes of session time per UTC hour of day, over all days.
    pub minutes_by_hour: Vec<f64>,
    /// Hours of session time per UTC day (overlapping sessions counted once).
    pub hours_per_day: BTreeMap<String, f64>,
}

/// Build the profile from published sessions.
pub fn profile(sessions: &[Session]) -> Profile {
    let mut ids: Vec<HashSet<u64>> = vec![HashSet::new(); 24];
    for s in sessions {
        for u in &s.affected {
            ids[((u.t.rem_euclid(86_400.0)) / 3600.0) as usize % 24].insert(u.id);
        }
    }
    let mut minutes = vec![0.0; 24];
    let mut intervals: Vec<(f64, f64)> = sessions.iter().map(|s| (s.start, s.end)).collect();
    intervals.sort_by(|a, b| a.0.total_cmp(&b.0));
    // Union of intervals.
    let mut union: Vec<(f64, f64)> = Vec::new();
    for (a, b) in intervals {
        match union.last_mut() {
            Some(l) if a <= l.1 => l.1 = l.1.max(b),
            _ => union.push((a, b)),
        }
    }
    let mut per_day: BTreeMap<String, f64> = BTreeMap::new();
    for &(a, b) in &union {
        let mut day = (a / 86_400.0).floor() as i64;
        while (day as f64) * 86_400.0 <= b {
            let d0 = day as f64 * 86_400.0;
            for (h, m) in minutes.iter_mut().enumerate() {
                *m +=
                    overlap_s(a, b, d0 + h as f64 * 3600.0, d0 + (h as f64 + 1.0) * 3600.0) / 60.0;
            }
            *per_day.entry(day_of(d0)).or_default() += overlap_s(a, b, d0, d0 + 86_400.0) / 3600.0;
            day += 1;
        }
    }
    Profile {
        distinct_by_hour: ids
            .iter()
            .map(|s| (s.len() >= PUBLICATION_MIN_DISTINCT).then_some(s.len()))
            .collect(),
        minutes_by_hour: minutes,
        hours_per_day: per_day,
    }
}

/// Area (km squared) of the 0.5-degree cells that hold an affected unit and at least the publication minimum
/// of distinct aircraft or vessels in the session, so no cell is counted on fewer than the minimum.
pub fn affected_area_km2(s: &Session) -> f64 {
    let g = Grid::new(0.5).expect("0.5 is valid");
    let mut obs: HashMap<super::grid::CellId, HashSet<u64>> = HashMap::new();
    let mut aff: HashSet<super::grid::CellId> = HashSet::new();
    for u in &s.affected {
        let c = g.cell_of(u.lat, u.lon);
        obs.entry(c).or_default().insert(u.id);
        aff.insert(c);
    }
    for u in &s.unaffected {
        obs.entry(g.cell_of(u.lat, u.lon)).or_default().insert(u.id);
    }
    aff.iter()
        .filter(|c| {
            obs.get(c)
                .is_some_and(|s| s.len() >= PUBLICATION_MIN_DISTINCT)
        })
        .map(|c| {
            let (s, w, n, e) = g.bounds(*c);
            let mid = ((s + n) / 2.0).to_radians();
            (n - s).to_radians() * EARTH_KM * (e - w).to_radians() * EARTH_KM * mid.cos()
        })
        .sum()
}

#[cfg(test)]
mod tests {
    use super::*;

    fn pr() -> EmitterParams {
        EmitterParams::preregistered_v1()
    }

    #[test]
    fn projection_round_trips() {
        let p = Proj::new(69.3, 16.0);
        for (la, lo) in [(69.3, 16.0), (70.1, 12.0), (66.0, 20.5), (72.0, 25.0)] {
            let (x, y) = p.forward(la, lo);
            let (la2, lo2) = p.inverse(x, y);
            assert!(
                (la - la2).abs() < 1e-9 && (lo - lo2).abs() < 1e-9,
                "{la} {lo} -> {la2} {lo2}"
            );
        }
        // One degree of latitude north is about 111.2 km.
        let (x, y) = p.forward(70.3, 16.0);
        assert!(x.abs() < 1e-6 && (y - 111.195).abs() < 0.05, "{x} {y}");
    }

    #[test]
    fn horizon_matches_the_textbook_figure() {
        // 10 000 m aircraft, emitter antenna at the surface: about 412 km on a 4/3 earth.
        assert!((los_reach_km(10_000.0, 0.0) - 412.2).abs() < 0.5);
        // Two 10 m heights: 4.12 * 2 * sqrt(10) = 26.1 km.
        assert!((los_reach_km(10.0, 10.0) - 26.07).abs() < 0.1);
    }

    // ---- synthetic forward and inverse round trips -------------------------------------------------

    use rand::{rngs::StdRng, Rng, SeedableRng};

    struct Truth {
        lat: f64,
        lon: f64,
        he: f64,
        range_km: f64,
    }

    /// Forward model, the same one the estimator inverts: aircraft on straight tracks, each with a fixed
    /// susceptibility; in reach and susceptible gives flagged reports, outside reach the background rate.
    fn forward(rng: &mut StdRng, t: &Truth, n_aircraft: usize, p: &EmitterParams) -> Vec<Report> {
        forward_geom(
            rng,
            t,
            n_aircraft,
            p,
            &Geom {
                half_km: 380.0,
                h_lo: 7000.0,
                h_hi: 12000.0,
                speed_km_s: 0.23,
            },
        )
    }

    struct Geom {
        half_km: f64,
        h_lo: f64,
        h_hi: f64,
        speed_km_s: f64,
    }

    fn forward_geom(
        rng: &mut StdRng,
        t: &Truth,
        n_aircraft: usize,
        p: &EmitterParams,
        g: &Geom,
    ) -> Vec<Report> {
        let proj = Proj::new(t.lat, t.lon);
        let mut out = Vec::new();
        for id in 0..n_aircraft as u64 {
            let (x, y) = (
                rng.gen_range(-g.half_km..g.half_km),
                rng.gen_range(-g.half_km..g.half_km),
            );
            let hdg: f64 = rng.gen_range(0.0..std::f64::consts::TAU);
            let h_m = if g.h_hi > g.h_lo {
                rng.gen_range(g.h_lo..g.h_hi)
            } else {
                g.h_lo
            };
            let u: f64 = rng.gen();
            let ub: f64 = rng.gen();
            // The reach edge is uncertain by about 15% (terrain, antenna, path), one draw per aircraft: the edge the
            // estimator's soft reach assumes.
            let edge: f64 = 1.0 + 0.15 * (2.0 * rng.gen::<f64>() - 1.0);
            // good baseline reports before the session
            for k in 0..6 {
                out.push(Report {
                    t: -7200.0 + 60.0 * k as f64,
                    id,
                    lat: t.lat + 4.0,
                    lon: t.lon,
                    h_m,
                    flagged: false,
                    good: true,
                });
            }
            for k in 0..15 {
                let s = 120.0 * k as f64;
                let (xx, yy) = (
                    x + g.speed_km_s * s * hdg.sin(),
                    y + g.speed_km_s * s * hdg.cos(),
                );
                let (lat, lon) = proj.inverse(xx, yy);
                let d = xx.hypot(yy);
                let reach = los_reach_km(h_m, t.he).min(t.range_km) * edge;
                let flagged = if d <= reach && u < p.p_susceptible {
                    rng.gen::<f64>() < p.p_det
                } else {
                    ub < p.p_bg
                };
                out.push(Report {
                    t: s,
                    id,
                    lat,
                    lon,
                    h_m,
                    flagged,
                    good: !flagged,
                });
            }
        }
        out
    }

    fn contains(r: &Region, lat: f64, lon: f64) -> bool {
        r.polygons.iter().any(|poly| {
            let mut inside = false;
            for ring in poly {
                let n = ring.len();
                for i in 0..n - 1 {
                    let (a, b) = (ring[i], ring[(i + 1) % (n - 1)]);
                    if (a[1] > lat) != (b[1] > lat)
                        && lon < (b[0] - a[0]) * (lat - a[1]) / (b[1] - a[1]) + a[0]
                    {
                        inside = !inside;
                    }
                }
            }
            inside
        })
    }

    fn small() -> EmitterParams {
        let mut p = pr();
        p.max_cells = 900;
        p.max_refined = 100;
        p
    }

    fn run_trials(
        seed: u64,
        trials: usize,
        truth_of: impl Fn(&mut StdRng) -> Truth,
        n_aircraft: usize,
        gen_p: &EmitterParams,
    ) -> (Vec<usize>, usize, Vec<f64>) {
        let est_p = small();
        let mut rng = StdRng::seed_from_u64(seed);
        let (mut hits, mut done) = (vec![0usize; 3], 0usize);
        let mut errs = Vec::new();
        for _ in 0..trials {
            let t = truth_of(&mut rng);
            let reps = forward(&mut rng, &t, n_aircraft, gen_p);
            let mut stats = EmitterStats::default();
            let units = build_units(&reps, &est_p, &mut stats);
            let sess = sessions(&units, &est_p, &mut stats);
            // The largest session is the one the emitter made.
            let Some(s) = sess.iter().max_by_key(|s| s.affected.len()) else {
                continue;
            };
            let Some(e) = estimate(s, &est_p, None) else {
                continue;
            };
            done += 1;
            for (i, r) in e.regions.iter().enumerate() {
                hits[i] += usize::from(contains(r, t.lat, t.lon));
            }
            let proj = Proj::new(t.lat, t.lon);
            let (x, y) = proj.forward(e.centroid.0, e.centroid.1);
            errs.push(x.hypot(y));
        }
        (hits, done, errs)
    }

    #[test]
    fn round_trip_known_emitter_is_inside_the_stated_region_at_about_the_stated_rate() {
        let gen_p = small();
        let (hits, done, errs) = run_trials(
            11,
            40,
            |r| Truth {
                lat: 69.3,
                lon: 16.0,
                he: r.gen_range(2.0..100.0),
                range_km: *[50.0, 100.0, 200.0, 1000.0].get(r.gen_range(0..4)).unwrap(),
            },
            60,
            &gen_p,
        );
        assert!(
            done >= 30,
            "only {done} of 40 trials produced a published session"
        );
        let rate = |i: usize| hits[i] as f64 / done as f64;
        eprintln!("coverage over {done} trials: 50% -> {:.2}, 90% -> {:.2}, 95% -> {:.2}; median centroid error {:.1} km",
            rate(0), rate(1), rate(2), { let mut e = errs.clone(); e.sort_by(|a, b| a.total_cmp(b)); e[e.len() / 2] });
        // Binomial slack for 30 to 40 trials: the stated level minus about three standard deviations.
        assert!(rate(2) >= 0.80, "95% region coverage {:.2}", rate(2));
        assert!(rate(1) >= 0.72, "90% region coverage {:.2}", rate(1));
        assert!(rate(0) >= 0.30, "50% region coverage {:.2}", rate(0));
        // Nested regions: a smaller level is inside a larger one.
        assert!(hits[0] <= hits[1] && hits[1] <= hits[2]);
    }

    #[test]
    fn round_trip_with_the_generator_off_the_model_still_covers_most_of_the_time() {
        // Mismatch: a different detection probability and background than the estimator assumes.
        let mut gen_p = small();
        gen_p.p_susceptible = 0.85;
        gen_p.p_det = 0.97;
        gen_p.p_bg = 0.06;
        let (hits, done, _) = run_trials(
            23,
            30,
            |r| Truth {
                lat: 69.3,
                lon: 16.0,
                he: r.gen_range(2.0..100.0),
                range_km: *[100.0, 200.0, 1000.0].get(r.gen_range(0..3)).unwrap(),
            },
            60,
            &gen_p,
        );
        assert!(done >= 20);
        let r95 = hits[2] as f64 / done as f64;
        eprintln!("mismatch coverage 95% -> {r95:.2} over {done}");
        assert!(r95 >= 0.70, "{r95}");
    }

    #[test]
    fn a_session_with_no_traffic_in_reach_is_unconstrained_not_a_point() {
        // Five affected aircraft in a tight cluster and no unaffected units: the region is the whole domain.
        let mut reps = Vec::new();
        for id in 0..6u64 {
            for k in 0..6 {
                reps.push(Report {
                    t: -7200.0 + 60.0 * k as f64,
                    id,
                    lat: 69.0,
                    lon: 16.0,
                    h_m: 10000.0,
                    flagged: false,
                    good: true,
                });
            }
            for k in 0..10 {
                reps.push(Report {
                    t: 120.0 * k as f64,
                    id,
                    lat: 69.0 + 0.01 * id as f64,
                    lon: 16.0,
                    h_m: 10000.0,
                    flagged: true,
                    good: false,
                });
            }
        }
        let p = small();
        let mut st = EmitterStats::default();
        let u = build_units(&reps, &p, &mut st);
        let s = sessions(&u, &p, &mut st);
        assert_eq!(s.len(), 1);
        let e = estimate(&s[0], &p, None).unwrap();
        // Nothing separates positions within the common reach, so the 95% region is a large area
        // (hundreds of thousands of square kilometres), and the ellipse is large too.
        assert!(
            e.regions[2].area_km2 > 100_000.0,
            "{}",
            e.regions[2].area_km2
        );
        assert!(e.ellipse.0 > 100.0);
    }

    #[test]
    fn fewer_than_the_publication_minimum_of_aircraft_is_withheld() {
        let mut reps = Vec::new();
        for id in 0..(PUBLICATION_MIN_DISTINCT as u64 - 1) {
            for k in 0..6 {
                reps.push(Report {
                    t: -7200.0 + 60.0 * k as f64,
                    id,
                    lat: 60.0,
                    lon: 10.0,
                    h_m: 10000.0,
                    flagged: false,
                    good: true,
                });
            }
            for k in 0..6 {
                reps.push(Report {
                    t: 120.0 * k as f64,
                    id,
                    lat: 69.0,
                    lon: 16.0,
                    h_m: 10000.0,
                    flagged: true,
                    good: false,
                });
            }
        }
        let p = pr();
        let mut st = EmitterStats::default();
        let u = build_units(&reps, &p, &mut st);
        assert!(sessions(&u, &p, &mut st).is_empty());
        assert_eq!(st.sessions_suppressed_below_min_distinct, 1);
    }

    #[test]
    fn aircraft_without_baseline_good_reports_are_not_counted() {
        let mut reps = Vec::new();
        for id in 0..8u64 {
            for k in 0..10 {
                reps.push(Report {
                    t: 120.0 * k as f64,
                    id,
                    lat: 69.0,
                    lon: 16.0,
                    h_m: 10000.0,
                    flagged: true,
                    good: false,
                });
            }
        }
        let p = pr();
        let mut st = EmitterStats::default();
        assert!(build_units(&reps, &p, &mut st).is_empty());
        assert_eq!(st.excluded_no_baseline, 8);
    }

    #[test]
    fn sessions_split_in_time_and_space() {
        let p = pr();
        let mk = |id: u64, t: f64, lat: f64, lon: f64| Unit {
            t,
            id,
            lat,
            lon,
            h_m: 10000.0,
            affected: true,
        };
        let mut u = Vec::new();
        for id in 0..6 {
            u.push(mk(id, 1000.0 + 60.0 * id as f64, 69.0, 16.0)); // session A
            u.push(mk(100 + id, 1000.0 + 60.0 * id as f64, 69.0, 60.0)); // same time, far away: session B
            u.push(mk(200 + id, 20_000.0 + 60.0 * id as f64, 69.0, 16.0)); // later: session C
        }
        let mut st = EmitterStats::default();
        let s = sessions(&u, &p, &mut st);
        assert_eq!(s.len(), 3, "{s:?}");
        assert!(s.iter().all(|x| x.distinct_affected() == 6));
        assert!(s[0].start <= s[1].start && s[1].start < s[2].start);
    }

    #[test]
    fn profile_counts_hours_and_withholds_small_hours() {
        let mk = |id: u64, t: f64| Unit {
            t,
            id,
            lat: 69.0,
            lon: 16.0,
            h_m: 10000.0,
            affected: true,
        };
        let day = 1_757_980_800.0; // 2025-09-16T00:00Z
        let mut aff = Vec::new();
        for id in 0..6 {
            aff.push(mk(id, day + 3600.0 * 12.0 + 60.0 * id as f64)); // hour 12: 6 aircraft
        }
        aff.push(mk(9, day + 3600.0 * 14.0 + 10.0)); // hour 14: one aircraft
        let s = Session {
            start: day + 3600.0 * 12.0,
            end: day + 3600.0 * 14.5,
            affected: aff,
            unaffected: vec![],
        };
        let pf = profile(&[s]);
        assert_eq!(pf.distinct_by_hour[12], Some(6));
        assert_eq!(pf.distinct_by_hour[14], None);
        assert_eq!(pf.distinct_by_hour[3], None);
        assert!(
            (pf.minutes_by_hour[12] - 60.0).abs() < 1e-9
                && (pf.minutes_by_hour[14] - 30.0).abs() < 1e-9
        );
        assert!((pf.hours_per_day["2025-09-16"] - 2.5).abs() < 1e-9);
    }

    #[test]
    fn a_tdoa_fix_fuses_with_the_line_of_sight_posterior() {
        // Four receivers around a known point; exact TDOAs; the fix lands on the point and narrows the region.
        let truth = (69.28, 16.0);
        let rx = [
            (69.6, 15.2, 20.0),
            (69.0, 16.9, 20.0),
            (69.5, 17.0, 20.0),
            (68.9, 15.4, 20.0),
        ];
        let ecef = |a: f64, o: f64, h: f64| {
            let (p, l) = (a.to_radians(), o.to_radians());
            let r = EARTH_RADIUS_M + h;
            [r * p.cos() * l.cos(), r * p.cos() * l.sin(), r * p.sin()]
        };
        let e = ecef(truth.0, truth.1, 0.0);
        let d = |q: [f64; 3]| {
            ((q[0] - e[0]).powi(2) + (q[1] - e[1]).powi(2) + (q[2] - e[2]).powi(2)).sqrt()
        };
        let r0 = d(ecef(rx[0].0, rx[0].1, rx[0].2));
        let tdoa: Vec<f64> = rx[1..]
            .iter()
            .map(|r| (d(ecef(r.0, r.1, r.2)) - r0) / crate::geolocation::C)
            .collect();
        let fix = GaussianFix::from_tdoa(&rx, &tdoa, 1e-6, (69.0, 16.5)).expect("fix");
        let err = Proj::new(truth.0, truth.1).forward(fix.lat, fix.lon);
        assert!(err.0.hypot(err.1) < 1.0, "{err:?}");
        assert!(fix.sigma_east_km > 0.0 && fix.sigma_north_km > 0.0);
        assert!(GaussianFix::from_tdoa(&rx[..2], &tdoa[..1], 1e-6, (69.0, 16.5)).is_none());
    }

    #[test]
    fn the_observatory_does_not_publish_emitter_regions() {
        const { assert!(!OBSERVATORY_PUBLISHES_EMITTER_REGIONS) };
        let obs = include_str!("observatory.rs");
        assert!(
            !obs.contains("emitter"),
            "the observatory must not reference the emitter-region estimator"
        );
    }

    /// Derivation of the centroid-error bars of `docs/emitter-region/PREREGISTRATION.md`: synthetic only, no real data.
    /// Run: `cargo test --lib derive_centroid_error_bars -- --ignored --nocapture`.
    #[test]
    #[ignore]
    fn derive_centroid_error_bars() {
        let est_p = pr();
        for (name, geom, ranges, ns, trials) in [
            (
                "adsb",
                Geom {
                    half_km: 380.0,
                    h_lo: 7000.0,
                    h_hi: 12000.0,
                    speed_km_s: 0.23,
                },
                vec![50.0, 100.0, 200.0, 1000.0],
                vec![15usize, 25, 40],
                240usize,
            ),
            (
                "ais",
                Geom {
                    half_km: 70.0,
                    h_lo: 15.0,
                    h_hi: 15.0,
                    speed_km_s: 0.008,
                },
                vec![20.0, 50.0, 100.0, 1000.0],
                vec![15usize, 25, 40],
                240usize,
            ),
        ] {
            let mut rng = StdRng::seed_from_u64(20261027);
            let mut errs = Vec::new();
            let mut hit95_constrained = 0usize;
            let (mut hit95, mut hit90, mut hit50, mut done, mut uncon) =
                (0usize, 0usize, 0usize, 0usize, 0usize);
            let mut baseline = Vec::new();
            for k in 0..trials {
                let t = Truth {
                    lat: 69.25,
                    lon: 15.95,
                    he: rng.gen_range(2.0..100.0),
                    range_km: ranges[rng.gen_range(0..ranges.len())],
                };
                let reps = forward_geom(&mut rng, &t, ns[k % ns.len()], &est_p, &geom);
                let mut st = EmitterStats::default();
                let units = build_units(&reps, &est_p, &mut st);
                let sess = sessions(&units, &est_p, &mut st);
                let Some(s) = sess.iter().max_by_key(|s| s.affected.len()) else {
                    continue;
                };
                let Some(e) = estimate(s, &est_p, None) else {
                    continue;
                };
                done += 1;
                uncon += usize::from(e.unconstrained);
                hit95 += usize::from(contains(&e.regions[2], t.lat, t.lon));
                hit95_constrained +=
                    usize::from(!e.unconstrained && contains(&e.regions[2], t.lat, t.lon));
                hit90 += usize::from(contains(&e.regions[1], t.lat, t.lon));
                hit50 += usize::from(contains(&e.regions[0], t.lat, t.lon));
                let proj = Proj::new(t.lat, t.lon);
                let (x, y) = proj.forward(e.centroid.0, e.centroid.1);
                errs.push(x.hypot(y));
                let n = s.affected.len() as f64;
                let (mut bx, mut by) = (0.0, 0.0);
                for u in &s.affected {
                    let (ux, uy) = proj.forward(u.lat, u.lon);
                    bx += ux / n;
                    by += uy / n;
                }
                baseline.push(bx.hypot(by));
            }
            let pct = |v: &mut Vec<f64>, q: f64| {
                v.sort_by(|a, b| a.total_cmp(b));
                v[((v.len() as f64 - 1.0) * q).round() as usize]
            };
            let mut e2 = errs.clone();
            let mut b2 = baseline.clone();
            eprintln!(
                "{name}: {done} published of {trials}; unconstrained {uncon}; 50% holds truth {:.2}, 90% {:.2}, 95% {hit95} ({:.2}), 95% and constrained {:.2}; centroid error km p50 {:.1} p75 {:.1} p90 {:.1}; naive affected-mean p50 {:.1} p75 {:.1} p90 {:.1}",
                hit50 as f64 / done as f64,
                hit90 as f64 / done as f64,
                hit95 as f64 / done as f64,
                hit95_constrained as f64 / done as f64,
                pct(&mut e2, 0.5), pct(&mut e2, 0.75), pct(&mut e2, 0.9),
                pct(&mut b2, 0.5), pct(&mut b2, 0.75), pct(&mut b2, 0.9)
            );
        }
    }

    #[test]
    #[ignore]
    #[allow(clippy::type_complexity)]
    fn diag_calibration_ladder() {
        let est_p = {
            let mut p = pr();
            p.max_cells = 4000;
            if let Ok(t) = std::env::var("DIAG_TEMPER") {
                p.temper = t.parse().unwrap();
            }
            p
        };
        let geom = if std::env::var("DIAG_AIS").is_ok() {
            Geom {
                half_km: 70.0,
                h_lo: 15.0,
                h_hi: 15.0,
                speed_km_s: 0.008,
            }
        } else {
            Geom {
                half_km: 380.0,
                h_lo: 7000.0,
                h_hi: 12000.0,
                speed_km_s: 0.23,
            }
        };
        // (name, p_susceptible, p_det, p_bg, fixed he, range choices)
        let rungs: Vec<(&str, f64, f64, f64, Option<f64>, Vec<f64>)> = vec![
            (
                "clean: all susceptible, certain, no background, he 30, LOS only",
                1.0,
                1.0,
                0.0,
                Some(30.0),
                vec![1000.0],
            ),
            (
                "+ ranges unknown",
                1.0,
                1.0,
                0.0,
                Some(30.0),
                vec![50.0, 100.0, 200.0, 1000.0],
            ),
            (
                "+ he unknown",
                1.0,
                1.0,
                0.0,
                None,
                vec![50.0, 100.0, 200.0, 1000.0],
            ),
            (
                "+ susceptible 0.6",
                0.6,
                1.0,
                0.0,
                None,
                vec![50.0, 100.0, 200.0, 1000.0],
            ),
            (
                "+ p_det 0.9",
                0.6,
                0.9,
                0.0,
                None,
                vec![50.0, 100.0, 200.0, 1000.0],
            ),
            (
                "+ background 0.03 persistent",
                0.6,
                0.9,
                0.03,
                None,
                vec![50.0, 100.0, 200.0, 1000.0],
            ),
        ];
        for (name, ps, pd, pb, he, ranges) in rungs {
            let mut gen_p = est_p.clone();
            gen_p.p_susceptible = ps;
            gen_p.p_det = pd;
            gen_p.p_bg = pb;
            let mut rng = StdRng::seed_from_u64(77);
            let (mut hit, mut done) = (0usize, 0usize);
            let mut errs = Vec::new();
            let mut by_r: std::collections::BTreeMap<u64, (usize, usize)> = Default::default();
            for _ in 0..80 {
                let t = Truth {
                    lat: 69.25,
                    lon: 15.95,
                    he: he.unwrap_or_else(|| rng.gen_range(2.0..100.0)),
                    range_km: ranges[rng.gen_range(0..ranges.len())],
                };
                let reps = forward_geom(&mut rng, &t, 30, &gen_p, &geom);
                let mut st = EmitterStats::default();
                let units = build_units(&reps, &est_p, &mut st);
                let sess = sessions(&units, &est_p, &mut st);
                let Some(s) = sess.iter().max_by_key(|s| s.affected.len()) else {
                    continue;
                };
                let Some(e) = estimate(s, &est_p, None) else {
                    continue;
                };
                done += 1;
                let h = usize::from(contains(&e.regions[2], t.lat, t.lon));
                hit += h;
                let ent = by_r.entry(t.range_km as u64).or_default();
                ent.0 += h;
                ent.1 += 1;
                let (x, y) = Proj::new(t.lat, t.lon).forward(e.centroid.0, e.centroid.1);
                errs.push(x.hypot(y));
            }
            eprintln!("  by truth range (hits, sessions): {by_r:?}");
            errs.sort_by(|a, b| a.total_cmp(b));
            eprintln!("{name}: {done} sessions, 95% holds truth {hit} ({:.2}), error p50 {:.1} p90 {:.1}, region cell {:.1}", hit as f64 / done.max(1) as f64, errs[errs.len() / 2], errs[errs.len() * 9 / 10], 0.0);
        }
    }

    #[test]
    #[ignore]
    fn diag_one_ais_trial() {
        let est_p = {
            let mut p = pr();
            p.max_cells = 4000;
            p
        };
        let geom = Geom {
            half_km: 70.0,
            h_lo: 15.0,
            h_hi: 15.0,
            speed_km_s: 0.008,
        };
        let mut gen_p = est_p.clone();
        gen_p.p_susceptible = 1.0;
        gen_p.p_det = 1.0;
        gen_p.p_bg = 0.0;
        let mut rng = StdRng::seed_from_u64(5);
        for _ in 0..12 {
            let t = Truth {
                lat: 69.25,
                lon: 15.95,
                he: 30.0,
                range_km: 1000.0,
            };
            let reps = forward_geom(&mut rng, &t, 30, &gen_p, &geom);
            let mut st = EmitterStats::default();
            let units = build_units(&reps, &est_p, &mut st);
            let sess = sessions(&units, &est_p, &mut st);
            let n_aff_all = units
                .iter()
                .filter(|u| u.affected)
                .map(|u| u.id)
                .collect::<std::collections::HashSet<_>>()
                .len();
            let Some(s) = sess.iter().max_by_key(|s| s.affected.len()) else {
                eprintln!("no session; affected ships total {n_aff_all}");
                continue;
            };
            let e = estimate(s, &est_p, None).unwrap();
            let (x, y) = Proj::new(t.lat, t.lon).forward(e.centroid.0, e.centroid.1);
            eprintln!(
                "affected ships total {n_aff_all}, in session {} (units {}), unaffected units {}; centroid err {:.1} km; ellipse {:.1}x{:.1}; area50 {:.0} area95 {:.0} km2; truth in 95%: {}; cell {:.2}",
                s.distinct_affected(), s.affected.len(), s.unaffected.len(), x.hypot(y), e.ellipse.0, e.ellipse.1, e.regions[0].area_km2, e.regions[2].area_km2, contains(&e.regions[2], t.lat, t.lon), e.cell_km
            );
        }
    }

    #[test]
    #[ignore]
    #[allow(clippy::type_complexity)]
    fn diag_ais_sensitivity() {
        let geom = Geom {
            half_km: 70.0,
            h_lo: 15.0,
            h_hi: 15.0,
            speed_km_s: 0.008,
        };
        let base = {
            let mut p = pr();
            p.max_cells = 4000;
            p
        };
        let variants: Vec<(&str, Box<dyn Fn(&mut EmitterParams)>)> = vec![
            ("baseline", Box::new(|_| {})),
            (
                "exact generator (ps .99, pd .99, bg .002, fault .001)",
                Box::new(|p| {
                    p.p_susceptible = 0.99;
                    p.p_det = 0.99;
                    p.p_bg = 0.002;
                    p.p_fault = 0.001;
                }),
            ),
            (
                "exact generator + softness 0.02",
                Box::new(|p| {
                    p.p_susceptible = 0.99;
                    p.p_det = 0.99;
                    p.p_bg = 0.002;
                    p.p_fault = 0.001;
                    p.reach_softness = 0.02;
                }),
            ),
            ("p_det 0.7", Box::new(|p| p.p_det = 0.7)),
        ];
        for (name, f) in variants {
            let mut est_p = base.clone();
            f(&mut est_p);
            let mut gen_p = base.clone();
            gen_p.p_susceptible = 1.0;
            gen_p.p_det = 1.0;
            gen_p.p_bg = 0.0;
            let mut rng = StdRng::seed_from_u64(5);
            let (mut hit, mut done) = (0, 0);
            for _ in 0..60 {
                let t = Truth {
                    lat: 69.25,
                    lon: 15.95,
                    he: 30.0,
                    range_km: 1000.0,
                };
                let reps = forward_geom(&mut rng, &t, 30, &gen_p, &geom);
                let mut st = EmitterStats::default();
                let units = build_units(&reps, &est_p, &mut st);
                let sess = sessions(&units, &est_p, &mut st);
                let Some(s) = sess.iter().max_by_key(|s| s.affected.len()) else {
                    continue;
                };
                let e = estimate(s, &est_p, None).unwrap();
                done += 1;
                hit += usize::from(contains(&e.regions[2], t.lat, t.lon));
            }
            eprintln!("{name}: {hit}/{done}");
        }
    }

    #[test]
    #[ignore]
    fn diag_ais_exact_failure() {
        let geom = Geom {
            half_km: 70.0,
            h_lo: 15.0,
            h_hi: 15.0,
            speed_km_s: 0.008,
        };
        let mut est_p = pr();
        est_p.max_cells = 4000;
        est_p.p_susceptible = 0.99;
        est_p.p_det = 0.99;
        est_p.p_bg = 0.002;
        est_p.p_fault = 0.001;
        let mut gen_p = est_p.clone();
        gen_p.p_susceptible = 1.0;
        gen_p.p_det = 1.0;
        gen_p.p_bg = 0.0;
        let mut rng = StdRng::seed_from_u64(5);
        let mut shown = 0;
        for _ in 0..40 {
            let t = Truth {
                lat: 69.25,
                lon: 15.95,
                he: 30.0,
                range_km: 1000.0,
            };
            let reps = forward_geom(&mut rng, &t, 30, &gen_p, &geom);
            let mut st = EmitterStats::default();
            let units = build_units(&reps, &est_p, &mut st);
            let sess = sessions(&units, &est_p, &mut st);
            let Some(s) = sess.iter().max_by_key(|s| s.affected.len()) else {
                continue;
            };
            let e = estimate(s, &est_p, None).unwrap();
            if contains(&e.regions[2], t.lat, t.lon) || shown >= 2 {
                continue;
            }
            shown += 1;
            let pt = Proj::new(t.lat, t.lon);
            let (cx, cy) = pt.forward(e.centroid.0, e.centroid.1);
            eprintln!("FAIL: centroid at ({cx:.1},{cy:.1}) km from truth; area95 {:.0}; ellipse {:.1}x{:.1}", e.regions[2].area_km2, e.ellipse.0, e.ellipse.1);
            let mut ids: Vec<u64> = s
                .affected
                .iter()
                .chain(&s.unaffected)
                .map(|u| u.id)
                .collect();
            ids.sort_unstable();
            ids.dedup();
            for id in ids {
                let us: Vec<&Unit> = s
                    .affected
                    .iter()
                    .chain(&s.unaffected)
                    .filter(|u| u.id == id)
                    .collect();
                let aff = us.iter().filter(|u| u.affected).count();
                let (x, y) = pt.forward(us[0].lat, us[0].lon);
                let dt = x.hypot(y);
                let dc = (x - cx).hypot(y - cy);
                if aff > 0 || dt < 60.0 {
                    eprintln!(
                        "  ship {id}: {aff}/{} affected, dist truth {dt:.1}, dist centroid {dc:.1}",
                        us.len()
                    );
                }
            }
        }
    }
}
