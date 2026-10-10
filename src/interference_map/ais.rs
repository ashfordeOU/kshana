// SPDX-License-Identifier: AGPL-3.0-only
//! AIS method: anomaly detectors on vessel position reports, aggregated per grid cell per day.
//!
//! Five detectors: positions on land, circular tracks, implausible jumps, implausible
//! reported speeds, and many vessels reporting the same position at the same time. A cell
//! is *anomalous* when a detector flags at least a minimum number of distinct vessels and
//! at least a minimum share of the vessels observed in the cell. See
//! `docs/INTERFERENCE-MAP.md` for the thresholds and the false-positive causes.

use std::collections::{BTreeMap, HashMap, HashSet};

use serde_json::{json, Map, Value};

use super::grid::{haversine_m, CellId, Grid, EARTH_RADIUS_M};
use super::land::LandMask;
use super::output::{CellOut, DayOut};
use super::time::{day_of, parse_timestamp};
use super::{stream_csv, IdHasher, MapError, PUBLICATION_MIN_DISTINCT};

/// Identifier of the AIS method version, written into every AIS output file.
pub const METHOD_ID: &str = "kshana-interference-map/ais/v2";

const KN_PER_MS: f64 = 1.943_844_492;

#[derive(Debug, Clone, PartialEq)]
/// Pre-registered AIS detector parameters; see the field docs and `docs/INTERFERENCE-MAP.md`.
pub struct AisParams {
    /// Speed above which a reported speed or an implied speed is implausible (knots).
    pub max_speed_kn: f64,
    /// A reported-speed anomaly needs this many such reports from a vessel in the cell.
    pub min_speed_reports: u32,
    /// A jump needs at least this distance (metres), so timestamp rounding cannot make one.
    pub jump_min_dist_m: f64,
    /// Consecutive reports further apart in time than this are not compared (seconds).
    pub jump_max_dt_s: f64,
    /// A vessel is flagged for jumps in a cell after this many jumps arriving there.
    pub min_jumps: u32,
    /// Distance inland (metres) a position must be to count as on land.
    pub land_buffer_m: f64,
    /// A vessel is flagged on land in a cell after this many on-land reports there.
    pub min_land_reports: u32,
    /// Position rounding for the same-position detector (degrees; 1e-4 is about 11 m).
    pub same_pos_round_deg: f64,
    /// Time window for the same-position detector (seconds).
    pub same_pos_window_s: f64,
    /// Distinct vessels at one rounded position in one window to count as a group.
    pub same_pos_min_vessels: usize,
    /// Circle detector: reports per window, window stride, radius range (metres), maximum
    /// radius coefficient of variation, maximum angular step (degrees), minimum total
    /// winding (degrees), minimum mean speed (knots), maximum gap between reports (seconds).
    pub circle_window: usize,
    /// Circle detector: reports between successive windows.
    pub circle_stride: usize,
    /// Circle detector: smallest mean radius that counts (metres).
    pub circle_min_radius_m: f64,
    /// Circle detector: largest mean radius that counts (metres).
    pub circle_max_radius_m: f64,
    /// Circle detector: largest radius coefficient of variation.
    pub circle_max_cv: f64,
    /// Circle detector: largest angular step between consecutive reports (degrees).
    pub circle_max_step_deg: f64,
    /// Circle detector: smallest net winding around the centroid (degrees).
    pub circle_min_winding_deg: f64,
    /// Circle detector: smallest mean speed (knots), which excludes anchor swinging.
    pub circle_min_mean_speed_kn: f64,
    /// Circle detector: largest time gap between consecutive reports in a window (seconds).
    pub circle_max_dt_s: f64,
    /// A detector qualifies in a cell with at least this many flagged vessels ...
    pub min_flagged_vessels: usize,
    /// ... making up at least this share of the vessels observed there.
    pub min_flagged_share: f64,
}

impl AisParams {
    /// The pre-registered version 2 parameters. Changing a value means a new method version.
    pub const PREREGISTERED_V1: AisParams = AisParams {
        max_speed_kn: 70.0,
        min_speed_reports: 3,
        jump_min_dist_m: 1000.0,
        jump_max_dt_s: 3600.0,
        min_jumps: 2,
        land_buffer_m: 2000.0,
        min_land_reports: 3,
        same_pos_round_deg: 1e-4,
        same_pos_window_s: 600.0,
        same_pos_min_vessels: 5,
        circle_window: 20,
        circle_stride: 10,
        circle_min_radius_m: 500.0,
        circle_max_radius_m: 20_000.0,
        circle_max_cv: 0.15,
        circle_max_step_deg: 90.0,
        circle_min_winding_deg: 270.0,
        circle_min_mean_speed_kn: 2.0,
        circle_max_dt_s: 1800.0,
        min_flagged_vessels: PUBLICATION_MIN_DISTINCT,
        min_flagged_share: 0.2,
    };

    /// The parameters as the JSON object embedded in output files.
    pub fn to_json(&self) -> Value {
        json!({
            "max_speed_kn": self.max_speed_kn,
            "min_speed_reports": self.min_speed_reports,
            "jump_min_dist_m": self.jump_min_dist_m,
            "jump_max_dt_s": self.jump_max_dt_s,
            "min_jumps": self.min_jumps,
            "land_buffer_m": self.land_buffer_m,
            "min_land_reports": self.min_land_reports,
            "same_position_round_deg": self.same_pos_round_deg,
            "same_position_window_s": self.same_pos_window_s,
            "same_position_min_vessels": self.same_pos_min_vessels,
            "circle_window_reports": self.circle_window,
            "circle_stride_reports": self.circle_stride,
            "circle_min_radius_m": self.circle_min_radius_m,
            "circle_max_radius_m": self.circle_max_radius_m,
            "circle_max_radius_cv": self.circle_max_cv,
            "circle_max_step_deg": self.circle_max_step_deg,
            "circle_min_winding_deg": self.circle_min_winding_deg,
            "circle_min_mean_speed_kn": self.circle_min_mean_speed_kn,
            "circle_max_gap_s": self.circle_max_dt_s,
            "min_flagged_vessels": self.min_flagged_vessels,
            "min_flagged_share": self.min_flagged_share,
            "publication_min_distinct": PUBLICATION_MIN_DISTINCT,
        })
    }
}

#[derive(Debug, Clone, Copy, PartialEq, Eq, Hash, PartialOrd, Ord)]
/// The five AIS anomaly detectors.
pub enum Detector {
    /// Positions inland of the supplied coastline by more than the buffer.
    OnLand,
    /// A track that circles at a near-constant radius.
    Circle,
    /// Consecutive positions implying an implausible speed.
    Jump,
    /// Reported speeds above the plausible maximum.
    Speed,
    /// Many distinct vessels at one position in one time window.
    SamePosition,
}

impl Detector {
    /// Every detector, in output order.
    pub const ALL: [Detector; 5] = [
        Detector::OnLand,
        Detector::Circle,
        Detector::Jump,
        Detector::Speed,
        Detector::SamePosition,
    ];

    /// The detector's name as written in output files.
    pub fn name(self) -> &'static str {
        match self {
            Detector::OnLand => "on_land",
            Detector::Circle => "circle",
            Detector::Jump => "implausible_jump",
            Detector::Speed => "implausible_speed",
            Detector::SamePosition => "same_position",
        }
    }
}

#[derive(Debug, Default, Clone, PartialEq)]
/// Counters for AIS rows read and rejected.
pub struct AisReadStats {
    /// Rows read.
    pub rows: u64,
    /// Rows aggregated.
    pub used: u64,
    /// Rows with an unparseable time, position or identifier.
    pub rejected_malformed: u64,
    /// Rows with a not-available or default position.
    pub rejected_invalid_position: u64,
}

#[derive(Clone, Copy)]
struct Rep {
    t: f64,
    lat: f64,
    lon: f64,
    sog: Option<f64>,
}

/// Aggregates AIS reports per vessel per UTC day, then evaluates the detectors per cell.
pub struct AisAggregator {
    grid: Grid,
    params: AisParams,
    hasher: IdHasher,
    land: Option<LandMask>,
    days: BTreeMap<String, HashMap<u64, Vec<Rep>>>,
    /// Counters for rows read and rejected so far.
    pub stats: AisReadStats,
}

impl AisAggregator {
    /// An empty aggregator; `land` enables the on-land detector.
    pub fn new(grid: Grid, params: AisParams, hasher: IdHasher, land: Option<LandMask>) -> Self {
        Self {
            grid,
            params,
            hasher,
            land,
            days: BTreeMap::new(),
            stats: AisReadStats::default(),
        }
    }

    /// Whether the on-land detector has a land mask.
    pub fn land_enabled(&self) -> bool {
        self.land.is_some()
    }

    /// Read the documented CSV from text; see [`AisAggregator::read_csv_reader`].
    pub fn read_csv(&mut self, text: &str) -> Result<(), MapError> {
        self.read_csv_reader(text.as_bytes())
    }

    /// Read the documented CSV row by row (the text is never held whole; each accepted
    /// report is kept in a compact form until the day is evaluated): required columns
    /// `timestamp, vessel_id, lat, lon`; optional `sog_kn` (the AIS "not available" value
    /// 102.3 is treated as missing). Other columns are ignored.
    pub fn read_csv_reader<R: std::io::BufRead>(&mut self, reader: R) -> Result<(), MapError> {
        struct Cols {
            t: usize,
            id: usize,
            lat: usize,
            lon: usize,
            sog: Option<usize>,
        }
        stream_csv(
            reader,
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
                let get = |k: usize| row.get(k).copied().unwrap_or("");
                self.add_row(
                    parse_timestamp(get(c.t)),
                    get(c.id),
                    get(c.lat).parse::<f64>().ok(),
                    get(c.lon).parse::<f64>().ok(),
                    c.sog.and_then(|k| get(k).parse::<f64>().ok()),
                );
            },
        )
    }

    fn add_row(
        &mut self,
        ts: Option<f64>,
        id: &str,
        lat: Option<f64>,
        lon: Option<f64>,
        sog: Option<f64>,
    ) {
        self.stats.rows += 1;
        let (Some(ts), Some(lat), Some(lon)) = (ts, lat, lon) else {
            self.stats.rejected_malformed += 1;
            return;
        };
        if id.is_empty() {
            self.stats.rejected_malformed += 1;
            return;
        }
        // Not-available sentinels (91, 181) fall outside these ranges; (0, 0) is the usual
        // default of a transponder without a fix.
        if !(-90.0..=90.0).contains(&lat)
            || !(-180.0..=180.0).contains(&lon)
            || (lat == 0.0 && lon == 0.0)
        {
            self.stats.rejected_invalid_position += 1;
            return;
        }
        let sog = sog.filter(|s| s.is_finite() && (0.0..102.3).contains(s));
        let vid = self.hasher.hash(id);
        self.days
            .entry(day_of(ts))
            .or_default()
            .entry(vid)
            .or_default()
            .push(Rep {
                t: ts,
                lat,
                lon,
                sog,
            });
        self.stats.used += 1;
    }

    /// Evaluate every day seen, one `DayOut` per UTC day.
    pub fn finish(mut self) -> Vec<DayOut> {
        let days = std::mem::take(&mut self.days);
        days.into_iter()
            .map(|(date, vessels)| self.evaluate_day(date, vessels))
            .collect()
    }

    fn evaluate_day(&mut self, date: String, vessels: HashMap<u64, Vec<Rep>>) -> DayOut {
        let p = self.params.clone();
        let grid = self.grid;
        let mut observed: HashMap<CellId, HashSet<u64>> = HashMap::new();
        let mut flagged: HashMap<(Detector, CellId), HashSet<u64>> = HashMap::new();
        // Same-position groups: (lat bin, lon bin, window index) -> distinct vessels.
        let mut groups: HashMap<(i64, i64, i64), HashSet<u64>> = HashMap::new();

        for (&vid, reps) in &vessels {
            let mut reps = reps.clone();
            reps.sort_by(|a, b| a.t.total_cmp(&b.t));

            let mut speed_n: HashMap<CellId, u32> = HashMap::new();
            let mut land_n: HashMap<CellId, u32> = HashMap::new();
            let mut jump_n: HashMap<CellId, u32> = HashMap::new();

            for (k, r) in reps.iter().enumerate() {
                let cell = grid.cell_of(r.lat, r.lon);
                observed.entry(cell).or_default().insert(vid);
                if r.sog.is_some_and(|s| s > p.max_speed_kn) {
                    *speed_n.entry(cell).or_default() += 1;
                }
                if let Some(land) = self.land.as_mut() {
                    if land.is_inland(r.lat, r.lon) {
                        *land_n.entry(cell).or_default() += 1;
                    }
                }
                let key = (
                    (r.lat / p.same_pos_round_deg).round() as i64,
                    (r.lon / p.same_pos_round_deg).round() as i64,
                    (r.t / p.same_pos_window_s).floor() as i64,
                );
                groups.entry(key).or_default().insert(vid);
                if k > 0 {
                    let q = &reps[k - 1];
                    let dt = r.t - q.t;
                    if dt <= p.jump_max_dt_s {
                        let d = haversine_m(q.lat, q.lon, r.lat, r.lon);
                        if d >= p.jump_min_dist_m && d / dt.max(1.0) * KN_PER_MS > p.max_speed_kn {
                            *jump_n.entry(cell).or_default() += 1;
                        }
                    }
                }
            }
            for (c, n) in speed_n {
                if n >= p.min_speed_reports {
                    flagged.entry((Detector::Speed, c)).or_default().insert(vid);
                }
            }
            for (c, n) in land_n {
                if n >= p.min_land_reports {
                    flagged
                        .entry((Detector::OnLand, c))
                        .or_default()
                        .insert(vid);
                }
            }
            for (c, n) in jump_n {
                if n >= p.min_jumps {
                    flagged.entry((Detector::Jump, c)).or_default().insert(vid);
                }
            }
            // Circle detector over sliding windows of consecutive reports.
            let w = p.circle_window;
            if reps.len() >= w {
                let mut s = 0;
                while s + w <= reps.len() {
                    if let Some((clat, clon)) = circle_fit(&p, &reps[s..s + w]) {
                        flagged
                            .entry((Detector::Circle, grid.cell_of(clat, clon)))
                            .or_default()
                            .insert(vid);
                    }
                    s += p.circle_stride.max(1);
                }
            }
        }
        for ((la, lo, _), vs) in &groups {
            if vs.len() >= p.same_pos_min_vessels {
                let cell = grid.cell_of(
                    *la as f64 * p.same_pos_round_deg,
                    *lo as f64 * p.same_pos_round_deg,
                );
                flagged
                    .entry((Detector::SamePosition, cell))
                    .or_default()
                    .extend(vs.iter().copied());
            }
        }

        let mut cells_sorted: Vec<CellId> = observed.keys().copied().collect();
        cells_sorted.sort();
        let mut out = Vec::new();
        for id in &cells_sorted {
            let n_obs = observed[id].len();
            if n_obs < PUBLICATION_MIN_DISTINCT {
                continue;
            }
            let mut props = Map::new();
            props.insert("vessels_observed".into(), json!(n_obs));
            let mut qualifying = Vec::new();
            let mut counts = Map::new();
            for d in Detector::ALL {
                // Only vessels that were also observed in the cell count toward it.
                let n = flagged
                    .get(&(d, *id))
                    .map_or(0, |s| s.iter().filter(|v| observed[id].contains(v)).count());
                let q =
                    n >= p.min_flagged_vessels && n as f64 / n_obs as f64 >= p.min_flagged_share;
                if q {
                    qualifying.push(d.name());
                }
                // Every count below the publication minimum is withheld (null), zero included,
                // so a null never reads as "none" and no number can single out a vessel.
                counts.insert(
                    d.name().into(),
                    if n >= PUBLICATION_MIN_DISTINCT {
                        json!(n)
                    } else {
                        Value::Null
                    },
                );
            }
            props.insert("vessels_flagged".into(), Value::Object(counts));
            props.insert("detectors".into(), json!(qualifying));
            let degraded = !qualifying.is_empty();
            out.push(CellOut {
                id: *id,
                status: if degraded {
                    "anomalous"
                } else {
                    "not_anomalous"
                }
                .into(),
                degraded,
                props,
            });
        }
        let mut meta = Map::new();
        meta.insert(
            "on_land_detector".into(),
            json!(if self.land.is_some() {
                "enabled"
            } else {
                "disabled: no land polygons supplied"
            }),
        );
        meta.insert("cells_published".into(), json!(out.len()));
        meta.insert(
            "cells_suppressed_below_min_distinct".into(),
            json!(cells_sorted.len() - out.len()),
        );
        DayOut {
            source_kind: "ais",
            date,
            cells: out,
            day_meta: meta,
        }
    }
}

/// Test one window of consecutive reports for circular motion. Returns the centroid when the
/// reports lie on a circle: radius within range, near-constant, one consistent direction of
/// travel covering enough of the circle in steps small enough that none is skipped, and a
/// mean speed above anchored-vessel swinging.
fn circle_fit(p: &AisParams, w: &[Rep]) -> Option<(f64, f64)> {
    if w.windows(2).any(|q| q[1].t - q[0].t > p.circle_max_dt_s) {
        return None;
    }
    let n = w.len() as f64;
    let lat0 = w.iter().map(|r| r.lat).sum::<f64>() / n;
    let lon0 = w.iter().map(|r| r.lon).sum::<f64>() / n;
    let m_per_deg = EARTH_RADIUS_M * std::f64::consts::PI / 180.0;
    let k = lat0.to_radians().cos();
    let xy: Vec<(f64, f64)> = w
        .iter()
        .map(|r| ((r.lon - lon0) * k * m_per_deg, (r.lat - lat0) * m_per_deg))
        .collect();
    let radii: Vec<f64> = xy.iter().map(|&(x, y)| x.hypot(y)).collect();
    let mean_r = radii.iter().sum::<f64>() / n;
    if !(p.circle_min_radius_m..=p.circle_max_radius_m).contains(&mean_r) {
        return None;
    }
    let sd = (radii.iter().map(|r| (r - mean_r).powi(2)).sum::<f64>() / n).sqrt();
    if sd / mean_r > p.circle_max_cv {
        return None;
    }
    let (mut net, mut abs_sum, mut max_step) = (0.0_f64, 0.0_f64, 0.0_f64);
    for q in xy.windows(2) {
        let (a0, a1) = (q[0].1.atan2(q[0].0), q[1].1.atan2(q[1].0));
        let mut d = a1 - a0;
        while d > std::f64::consts::PI {
            d -= 2.0 * std::f64::consts::PI;
        }
        while d <= -std::f64::consts::PI {
            d += 2.0 * std::f64::consts::PI;
        }
        net += d;
        abs_sum += d.abs();
        max_step = max_step.max(d.abs());
    }
    if max_step.to_degrees() > p.circle_max_step_deg
        || net.abs().to_degrees() < p.circle_min_winding_deg
        || net.abs() < 0.8 * abs_sum
    {
        return None;
    }
    let speeds: Vec<f64> = w.iter().filter_map(|r| r.sog).collect();
    let mean_speed = if speeds.is_empty() {
        let path: f64 = w
            .windows(2)
            .map(|q| haversine_m(q[0].lat, q[0].lon, q[1].lat, q[1].lon))
            .sum();
        path / (w[w.len() - 1].t - w[0].t).max(1.0) * KN_PER_MS
    } else {
        speeds.iter().sum::<f64>() / speeds.len() as f64
    };
    (mean_speed >= p.circle_min_mean_speed_kn).then_some((lat0, lon0))
}

/// Method metadata embedded in every AIS output file.
pub fn method_json(p: &AisParams, stats: &AisReadStats, land_enabled: bool) -> Value {
    json!({
        "id": METHOD_ID,
        "summary": "Anomaly detectors on AIS position reports per fixed grid cell and UTC day: positions on land, circular tracks, implausible jumps, implausible speeds, and many vessels at one position.",
        "parameters": p.to_json(),
        "detectors": Detector::ALL.iter().map(|d| d.name()).collect::<Vec<_>>(),
        "on_land_detector_enabled": land_enabled,
        "guards": [
            "distinct vessels are counted, not reports",
            "a detector qualifies in a cell only with a minimum number and share of flagged vessels",
            "on-land requires a buffer inland of a coastline that is only accurate to about a kilometre",
            "circles must be a consistent direction of travel at more than anchor-swing speed",
            "the AIS 'not available' position and speed values are discarded before any detector runs",
            "cells with fewer than the minimum distinct vessels are not published; every per-cell count below the minimum is withheld, zero included",
            "a detector qualifies only if at least the publication minimum of vessels are flagged",
        ],
        "input_stats": {
            "rows": stats.rows,
            "used": stats.used,
            "rejected_malformed": stats.rejected_malformed,
            "rejected_invalid_position": stats.rejected_invalid_position,
        },
        "caveats": [
            "An anomalous cell means vessels reported implausible positions or motion there that day. It does not identify interference as the cause.",
            "Other causes include vessels in rivers, canals and ports near the coastline, shared or duplicated identifiers, transponder faults, test equipment and legitimate loitering patterns.",
            "AIS covers only vessels that carry and use a transponder, and each source excludes some vessel classes.",
            "Cells with no published entry were not observed by enough vessels, which is not the same as clear.",
        ],
    })
}

#[cfg(test)]
mod tests {
    use super::*;

    const HDR: &str = "timestamp,vessel_id,lat,lon,sog_kn\n";

    fn agg(land: Option<LandMask>) -> AisAggregator {
        AisAggregator::new(
            Grid::new(0.5).unwrap(),
            AisParams::PREREGISTERED_V1,
            IdHasher::with_salt([3; 16]),
            land,
        )
    }

    fn ts(sec: u32) -> String {
        format!(
            "2026-03-01T{:02}:{:02}:{:02}Z",
            sec / 3600,
            (sec % 3600) / 60,
            sec % 60
        )
    }

    /// `n` vessels cruising straight east at 12 knots in the cell around (60.2, 24.2):
    /// ordinary traffic.
    fn background(csv: &mut String, n: usize) {
        for v in 0..n {
            for k in 0..6u32 {
                let lon = 24.05 + 0.01 * k as f64;
                csv.push_str(&format!(
                    "{},bg{v},{},{lon},12\n",
                    ts(36_000 + k * 120),
                    60.1 + 0.01 * v as f64
                ));
            }
        }
    }

    #[test]
    fn ordinary_traffic_is_not_anomalous() {
        let mut csv = HDR.to_string();
        background(&mut csv, 8);
        let mut a = agg(None);
        a.read_csv(&csv).unwrap();
        let day = &a.finish()[0];
        assert_eq!(day.cells.len(), 1);
        assert!(!day.cells[0].degraded);
        assert_eq!(day.cells[0].props["vessels_observed"], 8);
    }

    #[test]
    fn circling_vessels_are_flagged() {
        let mut csv = HDR.to_string();
        background(&mut csv, 3);
        // Five vessels circling at 2 km radius, 24 reports over about 1.2 revolutions.
        for v in 0..5 {
            for k in 0..24u32 {
                let th = (k as f64) * 20.0_f64.to_radians();
                let lat = 60.2 + 2000.0 * th.sin() / 111_195.0;
                let lon = 24.2 + 2000.0 * th.cos() / (111_195.0 * 60.2_f64.to_radians().cos());
                csv.push_str(&format!("{},circ{v},{lat},{lon},9\n", ts(40_000 + k * 60)));
            }
        }
        let mut a = agg(None);
        a.read_csv(&csv).unwrap();
        let day = &a.finish()[0];
        let c = day
            .cells
            .iter()
            .find(|c| c.degraded)
            .expect("an anomalous cell");
        assert!(c.props["detectors"]
            .as_array()
            .unwrap()
            .iter()
            .any(|d| d == "circle"));
        assert_eq!(c.props["vessels_flagged"]["circle"], 5);
    }

    #[test]
    fn anchored_swing_is_not_a_circle() {
        let mut csv = HDR.to_string();
        background(&mut csv, 5);
        // Swing on an anchor: radius 300 m (below the minimum radius), speed about 0.
        for v in 0..5 {
            for k in 0..24u32 {
                let th = (k as f64) * 20.0_f64.to_radians();
                let lat = 60.2 + 0.01 * v as f64 + 300.0 * th.sin() / 111_195.0;
                let lon = 24.2 + 300.0 * th.cos() / (111_195.0 * 60.2_f64.to_radians().cos());
                csv.push_str(&format!("{},anc{v},{lat},{lon},0.2\n", ts(40_000 + k * 60)));
            }
        }
        let mut a = agg(None);
        a.read_csv(&csv).unwrap();
        assert!(a.finish()[0].cells.iter().all(|c| !c.degraded));
    }

    #[test]
    fn back_and_forth_scatter_is_not_a_circle() {
        // Alternating between two points 2 km from the centre: constant radius, no winding.
        let p = AisParams::PREREGISTERED_V1;
        let w: Vec<Rep> = (0..20)
            .map(|k| Rep {
                t: k as f64 * 60.0,
                lat: 60.0 + if k % 2 == 0 { 0.018 } else { -0.018 },
                lon: 24.0,
                sog: Some(10.0),
            })
            .collect();
        assert!(circle_fit(&p, &w).is_none());
    }

    #[test]
    fn jumps_speed_and_same_position() {
        let mut csv = HDR.to_string();
        background(&mut csv, 4);
        for v in 0..6 {
            // Alternate between the true position and one 30 km away every minute: three jumps arriving at each end.
            for k in 0..8u32 {
                let lon = if k % 2 == 0 { 24.2 } else { 24.7 };
                csv.push_str(&format!("{},jmp{v},60.2,{lon},20\n", ts(41_000 + k * 60)));
            }
        }
        for v in 0..6 {
            for k in 0..4u32 {
                csv.push_str(&format!("{},spd{v},60.3,24.3,95\n", ts(42_000 + k * 60)));
            }
        }
        for v in 0..6 {
            csv.push_str(&format!("{},same{v},60.4,24.4,0\n", ts(43_000)));
        }
        let mut a = agg(None);
        a.read_csv(&csv).unwrap();
        let day = &a.finish()[0];
        let names: HashSet<String> = day
            .cells
            .iter()
            .flat_map(|c| {
                c.props["detectors"]
                    .as_array()
                    .unwrap()
                    .iter()
                    .map(|d| d.as_str().unwrap().to_string())
            })
            .collect();
        for d in ["implausible_jump", "implausible_speed", "same_position"] {
            assert!(names.contains(d), "{d} missing from {names:?}");
        }
    }

    #[test]
    fn invalid_sentinels_are_discarded() {
        let mut a = agg(None);
        a.read_csv(
            "timestamp,vessel_id,lat,lon,sog_kn\n\
             2026-03-01T10:00:00Z,a,91,181,10\n\
             2026-03-01T10:00:00Z,a,0,0,10\n\
             2026-03-01T10:00:00Z,a,60,24,102.3\n\
             bad,a,60,24,1\n",
        )
        .unwrap();
        assert_eq!(
            (
                a.stats.rows,
                a.stats.used,
                a.stats.rejected_invalid_position,
                a.stats.rejected_malformed
            ),
            (4, 1, 2, 1)
        );
    }

    #[test]
    fn on_land_detector_uses_buffer_and_needs_a_mask() {
        let land =
            r#"{"type":"Polygon","coordinates":[[[24,60],[25,60],[25,61],[24,61],[24,60]]]}"#;
        let mut csv = HDR.to_string();
        // Six vessels reporting from 10 km inside the polygon.
        for v in 0..6 {
            for k in 0..4u32 {
                csv.push_str(&format!(
                    "{},land{v},{},24.5,5\n",
                    ts(30_000 + k * 600 + v * 7),
                    60.5 + 0.01 * v as f64
                ));
            }
        }
        let mut with = agg(Some(LandMask::from_geojson_str(land, 2000.0).unwrap()));
        with.read_csv(&csv).unwrap();
        let d = &with.finish()[0];
        assert!(d.cells[0].props["detectors"]
            .as_array()
            .unwrap()
            .iter()
            .any(|x| x == "on_land"));
        let mut without = agg(None);
        without.read_csv(&csv).unwrap();
        let d = &without.finish()[0];
        assert!(!d.cells[0].degraded);
        assert!(d.day_meta["on_land_detector"]
            .as_str()
            .unwrap()
            .starts_with("disabled"));
    }

    #[test]
    fn small_cells_suppressed_and_small_counts_withheld() {
        let mut csv = HDR.to_string();
        for v in 0..4 {
            csv.push_str(&format!("{},few{v},55.2,10.2,9\n", ts(1000)));
        }
        // A cell with 6 vessels, 2 of which are flagged: count is withheld (null), not published.
        background(&mut csv, 4);
        for v in 0..2 {
            for k in 0..4u32 {
                csv.push_str(&format!("{},fast{v},60.2,24.2,99\n", ts(50_000 + k * 60)));
            }
        }
        let mut a = agg(None);
        a.read_csv(&csv).unwrap();
        let day = &a.finish()[0];
        assert_eq!(day.cells.len(), 1, "the 4-vessel cell is suppressed");
        let c = &day.cells[0];
        assert!(!c.degraded);
        // Both a count of 2 and a count of 0 are withheld: null never means "none".
        assert!(c.props["vessels_flagged"]["implausible_speed"].is_null());
        assert!(c.props["vessels_flagged"]["on_land"].is_null());
    }

    #[test]
    fn every_count_below_the_minimum_is_withheld_and_the_call_needs_the_minimum() {
        // 20 vessels in a cell; `n` of them report 99 knots.
        let run = |n: usize| {
            let mut csv = HDR.to_string();
            background(&mut csv, 20 - n);
            for v in 0..n {
                for k in 0..4u32 {
                    csv.push_str(&format!("{},fast{v},60.2,24.2,99\n", ts(50_000 + k * 60)));
                }
            }
            let mut a = agg(None);
            a.read_csv(&csv).unwrap();
            let day = a.finish().remove(0);
            let c = day.cells.into_iter().next().unwrap();
            (
                c.degraded,
                c.props["vessels_flagged"]["implausible_speed"].clone(),
            )
        };
        for n in 0..PUBLICATION_MIN_DISTINCT {
            let (degraded, count) = run(n);
            assert!(!degraded && count.is_null(), "n = {n}");
        }
        let (degraded, count) = run(PUBLICATION_MIN_DISTINCT);
        assert!(degraded, "5 of 20 vessels is 25%, over the 20% share");
        assert_eq!(count, PUBLICATION_MIN_DISTINCT);
    }

    #[test]
    fn output_never_contains_identifiers() {
        let mut csv = HDR.to_string();
        background(&mut csv, 6);
        let mut a = agg(None);
        a.read_csv(&csv).unwrap();
        let day = a.finish().remove(0);
        let text =
            serde_json::to_string(&day.cells.iter().map(|c| &c.props).collect::<Vec<_>>()).unwrap();
        assert!(!text.contains("bg0"));
    }

    #[test]
    fn preregistered_values_match_the_documentation() {
        let p = AisParams::PREREGISTERED_V1;
        assert_eq!(
            (
                p.max_speed_kn,
                p.min_speed_reports,
                p.min_jumps,
                p.jump_min_dist_m
            ),
            (70.0, 3, 2, 1000.0)
        );
        assert_eq!((p.land_buffer_m, p.min_land_reports), (2000.0, 3));
        assert_eq!((p.same_pos_min_vessels, p.same_pos_window_s), (5, 600.0));
        assert_eq!(
            (
                p.circle_window,
                p.circle_stride,
                p.circle_min_radius_m,
                p.circle_max_radius_m
            ),
            (20, 10, 500.0, 20_000.0)
        );
        assert_eq!(
            (
                p.circle_max_cv,
                p.circle_max_step_deg,
                p.circle_min_winding_deg,
                p.circle_min_mean_speed_kn
            ),
            (0.15, 90.0, 270.0, 2.0)
        );
        assert_eq!((p.min_flagged_vessels, p.min_flagged_share), (5, 0.2));
        assert_eq!(METHOD_ID, "kshana-interference-map/ais/v2");
    }
}
