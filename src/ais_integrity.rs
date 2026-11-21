// SPDX-License-Identifier: AGPL-3.0-only
//! AIS position-integrity flags per vessel track (`kshana ais-integrity`, `docs/AIS-INTEGRITY.md`).
//!
//! The interference map (`crate::interference_map::ais`) counts anomalous vessels per grid cell and
//! never publishes an identifier. This module answers the per-track question instead: which reports of
//! which track (identified as the input states it) are inconsistent with ship motion or with each
//! other, and which of those inconsistencies happened together. Twelve detectors run on the reports:
//!
//! * motion: `position_jump` (consecutive positions imply more than the plausible speed),
//!   `reported_speed` (speed over ground above the plausible maximum), `speed_inconsistency` (reported
//!   speed over ground against the track, steps in it that no ship can make, and speed through the
//!   water against speed over ground), `circle` (a track circling at a near-constant radius) and
//!   `drift_while_stationary` (a vessel reporting no speed whose positions move steadily away);
//! * place: `on_land` (inland of a supplied coastline by more than a buffer), `at_listed_place`
//!   (inside a supplied list of places such as airports, where no vessel can be) and
//!   `common_position` (many vessels at one position at one time);
//! * identity: `identity_conflict` (one identifier reported from two places that alternate, as two
//!   transmitters stating one identity would), `identity_change` (one identifier stating more than one
//!   IMO number), `shared_imo` (one IMO number stated by more than one identifier at overlapping times)
//!   and `identity_format` (an MMSI or IMO number that cannot be valid).
//!
//! Flags close in time and space are joined into *events* (single linkage), which separates
//! simultaneous episodes in different areas from one another.
//!
//! MODELLED: the thresholds are pre-registered here and the false-alarm and detection figures in the
//! method page come from synthetic tracks. A flag states that reports are inconsistent; it never says
//! why, never names a cause, a source or an intent, and never estimates the position of an emitter.
//! Identifiers are written exactly as the input states them.

use std::collections::{BTreeMap, BTreeSet, HashMap};
use std::io::Write;

use serde_json::{json, Map, Value};

use crate::interference_map::ais::{ais_position_is_valid, ais_speed_kn};
use crate::interference_map::grid::haversine_m;
use crate::interference_map::land::LandMask;
use crate::interference_map::time::{civil_from_days, parse_timestamp};
use crate::interference_map::{stream_csv, MapError};
use crate::portable_math::PortableFloat;

/// The schema id of the JSON Lines this module writes.
pub const SCHEMA: &str = "kshana.ais-integrity/1";
/// The method version, written into every output. Changing a parameter means a new version.
pub const METHOD_ID: &str = "kshana-ais-integrity/v1";

const KN_PER_MS: f64 = 1.943_844_492;

/// Pre-registered detector parameters (`docs/AIS-INTEGRITY.md` gives each one's reason).
#[derive(Debug, Clone, PartialEq)]
pub struct Params {
    /// Speed above which a reported or implied speed is implausible for a ship (knots).
    pub max_speed_kn: f64,
    /// A jump needs at least this distance (metres), so rounding and noise cannot make one.
    pub jump_min_dist_m: f64,
    /// Reports further apart in time than this are not compared for jumps (seconds).
    pub jump_max_dt_s: f64,
    /// Hits of one detector on one track closer than this in time form one flag (seconds).
    pub episode_gap_s: f64,
    /// A `reported_speed` flag needs this many reports above the maximum.
    pub min_speed_reports: usize,
    /// `speed_inconsistency`: span over which the track speed is measured (seconds) ...
    pub span_s: f64,
    /// ... and the longest span still compared (seconds).
    pub span_max_s: f64,
    /// `speed_inconsistency`: smallest disagreement between reported and track speed (knots) ...
    pub sog_track_min_diff_kn: f64,
    /// ... and as a share of the larger of the two.
    pub sog_track_min_ratio: f64,
    /// `speed_inconsistency`: a step in reported speed of at least this (knots) ...
    pub sog_step_kn: f64,
    /// ... between reports at most this far apart (seconds).
    pub sog_step_max_dt_s: f64,
    /// `speed_inconsistency`: largest plausible difference between speed over ground and through the
    /// water, which is the current (knots).
    pub stw_max_diff_kn: f64,
    /// A `speed_inconsistency` flag needs this many hits.
    pub min_inconsistent: usize,
    /// `drift_while_stationary`: reported speeds at or below this count as stationary (knots).
    pub drift_max_sog_kn: f64,
    /// `drift_while_stationary`: window length (seconds).
    pub drift_window_s: f64,
    /// `drift_while_stationary`: smallest net displacement in a window (metres).
    pub drift_min_dist_m: f64,
    /// `drift_while_stationary`: net displacement over the largest distance from the window's start.
    pub drift_min_straightness: f64,
    /// `drift_while_stationary`: the track speed must exceed this multiple of the mean reported speed ...
    pub drift_sog_factor: f64,
    /// ... plus this margin (knots).
    pub drift_sog_margin_kn: f64,
    /// `circle`: reports per window.
    pub circle_window: usize,
    /// `circle`: reports between successive windows.
    pub circle_stride: usize,
    /// `circle`: smallest mean radius (metres).
    pub circle_min_radius_m: f64,
    /// `circle`: largest mean radius (metres).
    pub circle_max_radius_m: f64,
    /// `circle`: largest radius coefficient of variation.
    pub circle_max_cv: f64,
    /// `circle`: largest angular step between consecutive reports (degrees).
    pub circle_max_step_deg: f64,
    /// `circle`: smallest net winding around the centroid (degrees).
    pub circle_min_winding_deg: f64,
    /// `circle`: smallest mean speed, which excludes an anchored vessel swinging (knots).
    pub circle_min_mean_speed_kn: f64,
    /// `circle`: largest gap between consecutive reports in a window (seconds).
    pub circle_max_dt_s: f64,
    /// `on_land`: distance inland a position must be (metres).
    pub land_buffer_m: f64,
    /// An `on_land` flag needs this many reports.
    pub min_land_reports: usize,
    /// An `at_listed_place` flag needs this many reports.
    pub min_place_reports: usize,
    /// `common_position`: position rounding (degrees; 1e-4 is about 11 m) ...
    pub same_pos_round_deg: f64,
    /// ... time window (seconds) ...
    pub same_pos_window_s: f64,
    /// ... and distinct vessels needed.
    pub same_pos_min_vessels: usize,
    /// `identity_conflict`: reports each of the two alternating tracks needs.
    pub branch_min_reports: usize,
    /// `identity_conflict`: switches between the two tracks needed.
    pub branch_min_alternations: usize,
    /// `identity_conflict`: largest share of reports neither track explains.
    pub branch_max_unexplained: f64,
    /// Events: flags whose time intervals are at most this far apart can link (seconds) ...
    pub event_link_s: f64,
    /// ... when their anchor positions are at most this far apart (metres).
    pub event_link_m: f64,
    /// An event needs this many distinct vessels.
    pub event_min_vessels: usize,
}

impl Params {
    /// The pre-registered version 1 parameters. The circle, land and common-position values are the
    /// interference map's (`AisParams::PREREGISTERED_V1`).
    pub const PREREGISTERED_V1: Params = Params {
        max_speed_kn: 70.0,
        jump_min_dist_m: 1000.0,
        jump_max_dt_s: 3600.0,
        episode_gap_s: 1800.0,
        min_speed_reports: 3,
        span_s: 120.0,
        span_max_s: 900.0,
        sog_track_min_diff_kn: 5.0,
        sog_track_min_ratio: 0.5,
        sog_step_kn: 25.0,
        sog_step_max_dt_s: 60.0,
        stw_max_diff_kn: 8.0,
        min_inconsistent: 3,
        drift_max_sog_kn: 0.5,
        drift_window_s: 1800.0,
        drift_min_dist_m: 500.0,
        drift_min_straightness: 0.8,
        drift_sog_factor: 3.0,
        drift_sog_margin_kn: 0.5,
        circle_window: 20,
        circle_stride: 10,
        circle_min_radius_m: 500.0,
        circle_max_radius_m: 20_000.0,
        circle_max_cv: 0.15,
        circle_max_step_deg: 90.0,
        circle_min_winding_deg: 270.0,
        circle_min_mean_speed_kn: 2.0,
        circle_max_dt_s: 1800.0,
        land_buffer_m: 2000.0,
        min_land_reports: 3,
        min_place_reports: 2,
        same_pos_round_deg: 1e-4,
        same_pos_window_s: 600.0,
        same_pos_min_vessels: 5,
        branch_min_reports: 5,
        branch_min_alternations: 3,
        branch_max_unexplained: 0.1,
        event_link_s: 900.0,
        event_link_m: 150_000.0,
        event_min_vessels: 3,
    };

    /// The parameters as the JSON object written into the header line.
    pub fn to_json(&self) -> Value {
        json!({
            "max_speed_kn": self.max_speed_kn,
            "jump_min_dist_m": self.jump_min_dist_m,
            "jump_max_dt_s": self.jump_max_dt_s,
            "episode_gap_s": self.episode_gap_s,
            "min_speed_reports": self.min_speed_reports,
            "span_s": self.span_s,
            "span_max_s": self.span_max_s,
            "sog_track_min_diff_kn": self.sog_track_min_diff_kn,
            "sog_track_min_ratio": self.sog_track_min_ratio,
            "sog_step_kn": self.sog_step_kn,
            "sog_step_max_dt_s": self.sog_step_max_dt_s,
            "stw_max_diff_kn": self.stw_max_diff_kn,
            "min_inconsistent": self.min_inconsistent,
            "drift_max_sog_kn": self.drift_max_sog_kn,
            "drift_window_s": self.drift_window_s,
            "drift_min_dist_m": self.drift_min_dist_m,
            "drift_min_straightness": self.drift_min_straightness,
            "drift_sog_factor": self.drift_sog_factor,
            "drift_sog_margin_kn": self.drift_sog_margin_kn,
            "circle_window_reports": self.circle_window,
            "circle_stride_reports": self.circle_stride,
            "circle_min_radius_m": self.circle_min_radius_m,
            "circle_max_radius_m": self.circle_max_radius_m,
            "circle_max_radius_cv": self.circle_max_cv,
            "circle_max_step_deg": self.circle_max_step_deg,
            "circle_min_winding_deg": self.circle_min_winding_deg,
            "circle_min_mean_speed_kn": self.circle_min_mean_speed_kn,
            "circle_max_gap_s": self.circle_max_dt_s,
            "land_buffer_m": self.land_buffer_m,
            "min_land_reports": self.min_land_reports,
            "min_place_reports": self.min_place_reports,
            "same_position_round_deg": self.same_pos_round_deg,
            "same_position_window_s": self.same_pos_window_s,
            "same_position_min_vessels": self.same_pos_min_vessels,
            "branch_min_reports": self.branch_min_reports,
            "branch_min_alternations": self.branch_min_alternations,
            "branch_max_unexplained": self.branch_max_unexplained,
            "event_link_s": self.event_link_s,
            "event_link_m": self.event_link_m,
            "event_min_vessels": self.event_min_vessels,
        })
    }
}

/// The twelve detectors.
#[derive(Debug, Clone, Copy, PartialEq, Eq, Hash, PartialOrd, Ord)]
pub enum Detector {
    /// Consecutive positions implying more than the plausible speed.
    PositionJump,
    /// Reported speed over ground above the plausible maximum.
    ReportedSpeed,
    /// Reported speed against the track, steps in it, or against speed through the water.
    SpeedInconsistency,
    /// A track circling at a near-constant radius.
    Circle,
    /// Positions moving steadily away while the vessel reports no speed.
    DriftWhileStationary,
    /// Positions inland of the supplied coastline.
    OnLand,
    /// Positions inside a supplied place (an airport, for example).
    AtListedPlace,
    /// Many vessels at one position at one time.
    CommonPosition,
    /// One identifier reported from two alternating places.
    IdentityConflict,
    /// One identifier stating more than one IMO number.
    IdentityChange,
    /// One IMO number stated by more than one identifier at overlapping times.
    SharedImo,
    /// An MMSI or IMO number that cannot be valid.
    IdentityFormat,
}

impl Detector {
    /// Every detector, in output order.
    pub const ALL: [Detector; 12] = [
        Detector::PositionJump,
        Detector::ReportedSpeed,
        Detector::SpeedInconsistency,
        Detector::Circle,
        Detector::DriftWhileStationary,
        Detector::OnLand,
        Detector::AtListedPlace,
        Detector::CommonPosition,
        Detector::IdentityConflict,
        Detector::IdentityChange,
        Detector::SharedImo,
        Detector::IdentityFormat,
    ];

    /// The name written in outputs.
    pub fn name(self) -> &'static str {
        match self {
            Detector::PositionJump => "position_jump",
            Detector::ReportedSpeed => "reported_speed",
            Detector::SpeedInconsistency => "speed_inconsistency",
            Detector::Circle => "circle",
            Detector::DriftWhileStationary => "drift_while_stationary",
            Detector::OnLand => "on_land",
            Detector::AtListedPlace => "at_listed_place",
            Detector::CommonPosition => "common_position",
            Detector::IdentityConflict => "identity_conflict",
            Detector::IdentityChange => "identity_change",
            Detector::SharedImo => "shared_imo",
            Detector::IdentityFormat => "identity_format",
        }
    }

    /// Whether the detector's flags have a time and a place, and so can join an event.
    pub fn joins_events(self) -> bool {
        !matches!(
            self,
            Detector::IdentityChange | Detector::SharedImo | Detector::IdentityFormat
        )
    }
}

/// One position report of one track.
#[derive(Debug, Clone, PartialEq)]
pub struct Report {
    /// UTC, seconds since 1970-01-01 (any consistent origin works for the detectors).
    pub t: f64,
    /// Latitude, degrees.
    pub lat: f64,
    /// Longitude, degrees.
    pub lon: f64,
    /// Reported speed over ground, knots.
    pub sog: Option<f64>,
    /// Speed through the water, knots, when the input has it (a log, not AIS).
    pub stw: Option<f64>,
    /// AIS navigational status (0 to 15).
    pub nav_status: Option<u8>,
}

/// Counters for rows read and rejected.
#[derive(Debug, Default, Clone, PartialEq)]
pub struct ReadStats {
    /// Rows or messages read.
    pub rows: u64,
    /// Position reports kept.
    pub used: u64,
    /// Rows with an unparseable time, position or identifier.
    pub rejected_malformed: u64,
    /// Reports with a not-available or default position.
    pub rejected_invalid_position: u64,
    /// NMEA position reports with no time (no TAG block `c:` field).
    pub rejected_no_time: u64,
    /// NMEA sentences dropped for a failed checksum.
    pub bad_checksum: u64,
}

/// The tracks and stated identities read from one or more inputs.
#[derive(Debug, Default, Clone)]
pub struct Input {
    tracks: BTreeMap<String, Vec<Report>>,
    imo: BTreeMap<String, BTreeSet<u64>>,
    names: BTreeMap<String, BTreeSet<String>>,
    /// Counters.
    pub stats: ReadStats,
}

impl Input {
    /// An empty input.
    pub fn new() -> Self {
        Self::default()
    }

    /// Add one report of the track `id` (validity is the caller's: see [`Input::read_csv`]).
    pub fn push(&mut self, id: &str, r: Report) {
        self.stats.used += 1;
        self.tracks.entry(id.to_string()).or_default().push(r);
    }

    /// Record an IMO number the track `id` states (0, "not available", is ignored).
    pub fn state_imo(&mut self, id: &str, imo: u64) {
        if imo != 0 {
            self.imo.entry(id.to_string()).or_default().insert(imo);
        }
    }

    /// Record a name the track `id` states (blank is ignored).
    pub fn state_name(&mut self, id: &str, name: &str) {
        let n = name.trim().trim_end_matches('@').trim();
        if !n.is_empty() {
            self.names
                .entry(id.to_string())
                .or_default()
                .insert(n.to_string());
        }
    }

    /// Number of tracks.
    pub fn track_count(&self) -> usize {
        self.tracks.len()
    }

    /// Read the documented CSV: required columns `timestamp, vessel_id, lat, lon`; optional `sog_kn`,
    /// `stw_kn`, `nav_status`, `imo`, `name`. The AIS "not available" values are discarded.
    pub fn read_csv<R: std::io::BufRead>(&mut self, reader: R) -> Result<(), MapError> {
        struct Cols {
            t: usize,
            id: usize,
            lat: usize,
            lon: usize,
            sog: Option<usize>,
            stw: Option<usize>,
            nav: Option<usize>,
            imo: Option<usize>,
            name: Option<usize>,
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
                    stw: h.col("stw_kn"),
                    nav: h.col("nav_status"),
                    imo: h.col("imo"),
                    name: h.col("name"),
                })
            },
            |c, row| {
                let get = |k: usize| row.get(k).copied().unwrap_or("");
                let opt = |k: Option<usize>| k.map(get).filter(|s| !s.is_empty());
                self.stats.rows += 1;
                let id = get(c.id);
                let (Some(t), Ok(lat), Ok(lon)) = (
                    parse_timestamp(get(c.t)),
                    get(c.lat).parse::<f64>(),
                    get(c.lon).parse::<f64>(),
                ) else {
                    self.stats.rejected_malformed += 1;
                    return;
                };
                if id.is_empty() {
                    self.stats.rejected_malformed += 1;
                    return;
                }
                if let Some(imo) = opt(c.imo).and_then(|s| s.parse::<u64>().ok()) {
                    self.state_imo(id, imo);
                }
                if let Some(n) = opt(c.name) {
                    self.state_name(id, n);
                }
                if !ais_position_is_valid(lat, lon) {
                    self.stats.rejected_invalid_position += 1;
                    return;
                }
                let sog = opt(c.sog)
                    .and_then(|s| s.parse::<f64>().ok())
                    .and_then(ais_speed_kn);
                let stw = opt(c.stw)
                    .and_then(|s| s.parse::<f64>().ok())
                    .filter(|v| v.is_finite() && (0.0..100.0).contains(v));
                let nav_status = opt(c.nav)
                    .and_then(|s| s.parse::<u8>().ok())
                    .filter(|v| *v <= 15);
                self.push(
                    id,
                    Report {
                        t,
                        lat,
                        lon,
                        sog,
                        stw,
                        nav_status,
                    },
                );
            },
        )
    }

    /// Read NMEA 0183 `!AIVDM`/`!AIVDO` lines (`crate::interconnect::ais`). A position report takes its
    /// time from the NMEA 4 TAG block before it; one without a time is counted and dropped. Static
    /// messages (types 5, 19, 24) give the stated IMO number and name.
    pub fn read_nmea<R: std::io::BufRead>(&mut self, reader: R) -> Result<(), MapError> {
        let mut rd = crate::interconnect::ais::Reader::default();
        for line in reader.lines() {
            let line = line.map_err(|e| {
                MapError::Io(crate::terr!("e-interference-map-cannot-read-input", e = e))
            })?;
            rd.push_line(&line);
        }
        let d = rd.finish();
        self.stats.rows += d.read as u64;
        self.stats.bad_checksum += d.bad_checksum as u64;
        self.stats.rejected_malformed += d.malformed as u64;
        for f in d.fixes {
            let Some(t) = f.t_unix_s else {
                self.stats.rejected_no_time += 1;
                continue;
            };
            if !ais_position_is_valid(f.lat_deg, f.lon_deg) {
                self.stats.rejected_invalid_position += 1;
                continue;
            }
            let sog = f
                .extra
                .get("sog_kn")
                .and_then(Value::as_f64)
                .and_then(ais_speed_kn);
            let nav_status = f
                .extra
                .get("nav_status")
                .and_then(Value::as_u64)
                .and_then(|v| u8::try_from(v).ok());
            self.push(
                &f.id,
                Report {
                    t,
                    lat: f.lat_deg,
                    lon: f.lon_deg,
                    sog,
                    stw: None,
                    nav_status,
                },
            );
        }
        for r in d.records {
            let Some(id) = r.get("id").and_then(Value::as_str) else {
                continue;
            };
            let id = id.to_string();
            if let Some(imo) = r.get("imo").and_then(Value::as_u64) {
                self.state_imo(&id, imo);
            }
            if let Some(n) = r.get("name").and_then(Value::as_str) {
                self.state_name(&id, n);
            }
        }
        Ok(())
    }
}

/// A place where no vessel can be (an airport, an inland site), with a radius.
#[derive(Debug, Clone, PartialEq)]
pub struct Place {
    /// The name as the list states it.
    pub name: String,
    /// Latitude, degrees.
    pub lat: f64,
    /// Longitude, degrees.
    pub lon: f64,
    /// Radius, metres.
    pub radius_m: f64,
}

/// Read a places CSV: columns `name, lat, lon, radius_m`.
pub fn read_places<R: std::io::BufRead>(reader: R) -> Result<Vec<Place>, MapError> {
    struct Cols {
        name: usize,
        lat: usize,
        lon: usize,
        r: usize,
    }
    let mut out = Vec::new();
    let mut bad: Option<String> = None;
    stream_csv(
        reader,
        |h| {
            Ok(Cols {
                name: h.require("name")?,
                lat: h.require("lat")?,
                lon: h.require("lon")?,
                r: h.require("radius_m")?,
            })
        },
        |c, row| {
            let get = |k: usize| row.get(k).copied().unwrap_or("");
            match (
                get(c.lat).parse::<f64>(),
                get(c.lon).parse::<f64>(),
                get(c.r).parse::<f64>(),
            ) {
                (Ok(lat), Ok(lon), Ok(r))
                    if lat.abs() <= 90.0 && lon.abs() <= 180.0 && r > 0.0 && r.is_finite() =>
                {
                    out.push(Place {
                        name: get(c.name).to_string(),
                        lat,
                        lon,
                        radius_m: r,
                    })
                }
                _ => {
                    if bad.is_none() {
                        bad = Some(row.join(","));
                    }
                }
            }
        },
    )?;
    match bad {
        Some(row) => Err(MapError::Format(crate::terr!(
            "e-ais-integrity-bad-place",
            row = row
        ))),
        None => Ok(out),
    }
}

/// One flag: a detector's finding on one track over one time interval.
#[derive(Debug, Clone, PartialEq)]
pub struct Flag {
    /// The track's identifier as the input states it.
    pub vessel_id: String,
    /// The detector.
    pub detector: Detector,
    /// First and last time of the reports behind it (Unix seconds); `None` for identity flags that
    /// have no time.
    pub span: Option<(f64, f64)>,
    /// Reports (or windows, or pairs) behind it.
    pub hits: usize,
    /// The last plausible report before the flag: where the vessel reported from before the
    /// inconsistency (used to link flags into events; never a source location).
    pub anchor: Option<(f64, f64)>,
    /// Detector-specific numbers and values, as stated or measured.
    pub detail: Map<String, Value>,
    /// The event it joined, if any.
    pub event: Option<usize>,
}

/// Flags joined in time and space.
#[derive(Debug, Clone, PartialEq)]
pub struct Event {
    /// 1-based number.
    pub id: usize,
    /// First and last time.
    pub span: (f64, f64),
    /// Distinct tracks, as stated.
    pub vessels: Vec<String>,
    /// Flags per detector.
    pub detectors: BTreeMap<&'static str, usize>,
    /// The area of the anchors: south, west, north, east.
    pub area: [f64; 4],
}

/// What a run found.
#[derive(Debug, Clone)]
pub struct Analysis {
    /// Flags, ordered by track, start time and detector.
    pub flags: Vec<Flag>,
    /// Events, ordered by start.
    pub events: Vec<Event>,
    /// Per track: reports, first and last time.
    pub tracks: Vec<(String, usize, f64, f64)>,
    /// Whether the on-land detector ran.
    pub land_enabled: bool,
    /// Places supplied.
    pub places: usize,
}

#[derive(Clone)]
struct Hit {
    t: f64,
    anchor: (f64, f64),
    vals: Vec<(&'static str, f64)>,
    tags: Vec<String>,
}

fn hit(t: f64, anchor: (f64, f64)) -> Hit {
    Hit {
        t,
        anchor,
        vals: Vec::new(),
        tags: Vec::new(),
    }
}

fn implied_kn(a: &Report, b: &Report) -> (f64, f64) {
    let d = haversine_m(a.lat, a.lon, b.lat, b.lon);
    (d, d / (b.t - a.t).max(1.0) * KN_PER_MS)
}

/// Whether `r` can follow `prev` by ship motion.
fn plausible(p: &Params, prev: &Report, r: &Report) -> bool {
    let dt = r.t - prev.t;
    if dt > p.jump_max_dt_s {
        return true;
    }
    let (d, v) = implied_kn(prev, r);
    d < p.jump_min_dist_m || v <= p.max_speed_kn
}

/// Merge hits closer than `gap` into flags; a flag needs `min` hits.
fn episodes(
    vessel: &str,
    det: Detector,
    mut hits: Vec<Hit>,
    gap: f64,
    min: usize,
    out: &mut Vec<Flag>,
) {
    hits.sort_by(|a, b| a.t.total_cmp(&b.t));
    let mut k = 0;
    while k < hits.len() {
        let mut e = k + 1;
        while e < hits.len() && hits[e].t - hits[e - 1].t <= gap {
            e += 1;
        }
        let group = &hits[k..e];
        if group.len() >= min {
            let mut detail = Map::new();
            for h in group {
                for &(key, v) in &h.vals {
                    let cur = detail.get(key).and_then(Value::as_f64);
                    if cur.is_none_or(|c| v > c) {
                        detail.insert(key.into(), json!(v));
                    }
                }
            }
            let tags: BTreeSet<&String> = group.iter().flat_map(|h| h.tags.iter()).collect();
            if !tags.is_empty() {
                let key = match det {
                    Detector::AtListedPlace => "places",
                    _ => "reasons",
                };
                detail.insert(key.into(), json!(tags));
            }
            out.push(Flag {
                vessel_id: vessel.to_string(),
                detector: det,
                span: Some((group[0].t, group[group.len() - 1].t)),
                hits: group.len(),
                anchor: Some(group[0].anchor),
                detail: round_detail(detail),
                event: None,
            });
        }
        k = e;
    }
}

fn round_to(x: f64, step: f64) -> f64 {
    (x / step).round() * step
}

fn round_detail(mut m: Map<String, Value>) -> Map<String, Value> {
    for (k, v) in m.iter_mut() {
        if let Some(x) = v.as_f64() {
            let step = if k.ends_with("_m") { 1.0 } else { 0.1 };
            *v = json!(round_to(x, step));
        }
    }
    m
}

/// Split a track into two alternating sub-tracks when one identifier is reported from two places.
/// Returns the indices of each sub-track, the number of switches and the reports neither explains.
fn branches(p: &Params, seq: &[&Report]) -> (Vec<usize>, Vec<usize>, usize, usize, f64) {
    let (mut a, mut b): (Vec<usize>, Vec<usize>) = (Vec::new(), Vec::new());
    let (mut alt, mut unexplained, mut last) = (0usize, 0usize, 0u8);
    let mut min_sep = f64::INFINITY;
    for (i, r) in seq.iter().enumerate() {
        let fits_a = a.last().is_none_or(|&j| plausible(p, seq[j], r));
        let which = if fits_a {
            1
        } else if b.last().is_none_or(|&j| plausible(p, seq[j], r)) {
            if let Some(&j) = a.last() {
                min_sep = min_sep.min(haversine_m(seq[j].lat, seq[j].lon, r.lat, r.lon));
            }
            2
        } else {
            unexplained += 1;
            continue;
        };
        if which == 1 {
            a.push(i);
        } else {
            b.push(i);
        }
        if last != 0 && last != which {
            alt += 1;
        }
        last = which;
    }
    (a, b, alt, unexplained, min_sep)
}

/// Fit a circle to one window; the centroid when the reports lie on one.
fn circle_fit(p: &Params, w: &[&Report]) -> Option<(f64, f64, f64)> {
    if w.windows(2).any(|q| q[1].t - q[0].t > p.circle_max_dt_s) {
        return None;
    }
    let n = w.len() as f64;
    let lat0 = w.iter().map(|r| r.lat).sum::<f64>() / n;
    let lon0 = w.iter().map(|r| r.lon).sum::<f64>() / n;
    let m_per_deg = crate::interference_map::grid::EARTH_RADIUS_M * std::f64::consts::PI / 180.0;
    let k = lat0.to_radians().pcos();
    let xy: Vec<(f64, f64)> = w
        .iter()
        .map(|r| ((r.lon - lon0) * k * m_per_deg, (r.lat - lat0) * m_per_deg))
        .collect();
    let radii: Vec<f64> = xy.iter().map(|&(x, y)| x.phypot(y)).collect();
    let mean_r = radii.iter().sum::<f64>() / n;
    if !(p.circle_min_radius_m..=p.circle_max_radius_m).contains(&mean_r) {
        return None;
    }
    let sd = (radii.iter().map(|r| (r - mean_r).ppowi(2)).sum::<f64>() / n).sqrt();
    if sd / mean_r > p.circle_max_cv {
        return None;
    }
    let (mut net, mut abs_sum, mut max_step) = (0.0_f64, 0.0_f64, 0.0_f64);
    for q in xy.windows(2) {
        let mut d = q[1].1.patan2(q[1].0) - q[0].1.patan2(q[0].0);
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
    (mean_speed >= p.circle_min_mean_speed_kn).then_some((lat0, lon0, mean_r))
}

/// The motion detectors on one consistent sequence of reports.
fn motion(p: &Params, id: &str, seq: &[&Report], out: &mut Vec<Flag>) {
    let gap = p.episode_gap_s;
    let pos = |r: &Report| (r.lat, r.lon);
    // position_jump: the anchor is the last report before the jump.
    let mut jumps = Vec::new();
    for q in seq.windows(2) {
        if !plausible(p, q[0], q[1]) {
            let (d, v) = implied_kn(q[0], q[1]);
            let mut h = hit(q[1].t, pos(q[0]));
            h.vals = vec![("max_jump_m", d), ("max_implied_speed_kn", v)];
            jumps.push(h);
        }
    }
    episodes(id, Detector::PositionJump, jumps, gap, 1, out);

    // speed_inconsistency: reported speed against the track over spans of about `span_s`.
    let mut inc = Vec::new();
    let mut i = 0;
    while i + 1 < seq.len() {
        let Some(j) = (i + 1..seq.len()).find(|&j| seq[j].t - seq[i].t >= p.span_s) else {
            break;
        };
        let dt = seq[j].t - seq[i].t;
        let sogs: Vec<f64> = seq[i..=j].iter().filter_map(|r| r.sog).collect();
        if dt <= p.span_max_s && sogs.len() >= 2 && 2 * sogs.len() > j - i {
            let (_, v) = implied_kn(seq[i], seq[j]);
            let m = sogs.iter().sum::<f64>() / sogs.len() as f64;
            let diff = (v - m).abs();
            if v <= p.max_speed_kn
                && diff
                    > p.sog_track_min_diff_kn
                        .max(p.sog_track_min_ratio * v.max(m))
            {
                let mut h = hit(seq[i].t, pos(seq[i]));
                h.vals = vec![("max_sog_track_diff_kn", diff)];
                h.tags = vec!["sog_vs_track".into()];
                inc.push(h);
            }
        }
        i = j;
    }
    for q in seq.windows(2) {
        if let (Some(a), Some(b)) = (q[0].sog, q[1].sog) {
            if q[1].t - q[0].t <= p.sog_step_max_dt_s && (b - a).abs() >= p.sog_step_kn {
                let mut h = hit(q[1].t, pos(q[0]));
                h.vals = vec![("max_sog_step_kn", (b - a).abs())];
                h.tags = vec!["sog_step".into()];
                inc.push(h);
            }
        }
    }
    for (k, r) in seq.iter().enumerate() {
        if let (Some(s), Some(w)) = (r.sog, r.stw) {
            if (s - w).abs() > p.stw_max_diff_kn {
                let a = if k > 0 { pos(seq[k - 1]) } else { pos(r) };
                let mut h = hit(r.t, a);
                h.vals = vec![("max_stw_sog_diff_kn", (s - w).abs())];
                h.tags = vec!["stw_vs_sog".into()];
                inc.push(h);
            }
        }
    }
    episodes(
        id,
        Detector::SpeedInconsistency,
        inc,
        gap,
        p.min_inconsistent,
        out,
    );

    // circle
    let mut circ = Vec::new();
    let w = p.circle_window;
    if seq.len() >= w && w >= 3 {
        let mut s = 0;
        while s + w <= seq.len() {
            if let Some((_, _, r)) = circle_fit(p, &seq[s..s + w]) {
                let a = if s > 0 { pos(seq[s - 1]) } else { pos(seq[s]) };
                let mut h = hit(seq[s].t, a);
                h.vals = vec![("max_radius_m", r)];
                circ.push(h);
            }
            s += p.circle_stride.max(1);
        }
    }
    episodes(id, Detector::Circle, circ, gap, 1, out);

    // drift_while_stationary: windows of stationary reports whose positions move steadily away.
    let mut drift = Vec::new();
    let mut i = 0;
    while i + 1 < seq.len() {
        let Some(j) = (i + 1..seq.len()).find(|&j| seq[j].t - seq[i].t >= p.drift_window_s) else {
            break;
        };
        let win = &seq[i..=j];
        let stationary = win
            .iter()
            .all(|r| r.sog.is_some_and(|s| s <= p.drift_max_sog_kn));
        if stationary && win.windows(2).all(|q| plausible(p, q[0], q[1])) {
            let net = haversine_m(win[0].lat, win[0].lon, win[j - i].lat, win[j - i].lon);
            let maxd = win
                .iter()
                .map(|r| haversine_m(win[0].lat, win[0].lon, r.lat, r.lon))
                .fold(0.0, f64::max);
            let dt = win[j - i].t - win[0].t;
            let v = net / dt.max(1.0) * KN_PER_MS;
            let m = win.iter().filter_map(|r| r.sog).sum::<f64>() / win.len() as f64;
            if net >= p.drift_min_dist_m
                && net >= p.drift_min_straightness * maxd
                && v >= p.drift_sog_factor * m + p.drift_sog_margin_kn
            {
                let mut h = hit(win[0].t, pos(win[0]));
                h.vals = vec![
                    ("max_displacement_m", net),
                    ("max_track_speed_kn", v),
                    ("max_reported_speed_kn", m),
                ];
                if let Some(ns) = win[0].nav_status {
                    h.tags = vec![format!("nav_status_{ns}")];
                }
                drift.push(h);
            }
        }
        // Advance by half a window.
        let half = seq[i].t + p.drift_window_s / 2.0;
        i = (i + 1..seq.len())
            .find(|&k| seq[k].t >= half)
            .unwrap_or(seq.len());
    }
    // Overlapping windows of one drift are one flag.
    episodes(
        id,
        Detector::DriftWhileStationary,
        drift,
        p.drift_window_s.max(gap),
        1,
        out,
    );
}

/// Whether an MMSI string is a 9-digit number whose leading digits can belong to a ship, a coast
/// station, a group, search and rescue aircraft, an aid to navigation, a craft associated with a
/// parent ship or a distress device (ITU-R M.585). Non-numeric identifiers are not MMSIs and are
/// not checked.
fn mmsi_problem(id: &str) -> Option<&'static str> {
    if id.is_empty() || !id.bytes().all(|b| b.is_ascii_digit()) {
        return None;
    }
    if id.len() != 9 {
        return Some("mmsi_not_nine_digits");
    }
    let mid = |s: &str| {
        s.parse::<u32>()
            .ok()
            .is_some_and(|m| (201..=775).contains(&m))
    };
    let ok = match &id[..1] {
        "0" => {
            // 0MIDxxxxx group or 00MIDxxxx coast station.
            mid(&id[1..4]) || (id.starts_with("00") && mid(&id[2..5]))
        }
        "1" => id.starts_with("111") && mid(&id[3..6]),
        "8" => mid(&id[1..4]),
        "9" => {
            (id.starts_with("98") || id.starts_with("99")) && mid(&id[2..5])
                || ["970", "972", "974"].iter().any(|p| id.starts_with(p))
        }
        _ => mid(&id[..3]),
    };
    (!ok).then_some("mmsi_prefix_not_allocated")
}

/// Whether a 7-digit IMO number passes its check digit.
pub fn imo_check_digit_ok(imo: u64) -> bool {
    if !(1_000_000..=9_999_999).contains(&imo) {
        return false;
    }
    let d: Vec<u64> = imo
        .to_string()
        .bytes()
        .map(|b| u64::from(b - b'0'))
        .collect();
    let s: u64 = (0..6).map(|k| d[k] * (7 - k as u64)).sum();
    s % 10 == d[6]
}

/// Run every detector.
pub fn analyse(
    input: &Input,
    p: &Params,
    mut land: Option<&mut LandMask>,
    places: &[Place],
) -> Analysis {
    let mut flags = Vec::new();
    let mut tracks = Vec::new();
    // common_position: (rounded position and window, track, report) of every report, sorted later,
    // so that no per-position allocation is needed.
    let mut keys: Vec<((i64, i64, i64), u32, u32)> = Vec::new();
    let ids: Vec<&String> = input.tracks.keys().collect();
    let mut sorted_tracks: Vec<Vec<&Report>> = Vec::with_capacity(ids.len());
    for (ti, (id, reps)) in input.tracks.iter().enumerate() {
        let mut reps: Vec<&Report> = reps.iter().collect();
        reps.sort_by(|a, b| a.t.total_cmp(&b.t));
        tracks.push((id.clone(), reps.len(), reps[0].t, reps[reps.len() - 1].t));
        let (a, b, alt, unexplained, min_sep) = branches(p, &reps);
        let conflict = a.len() >= p.branch_min_reports
            && b.len() >= p.branch_min_reports
            && alt >= p.branch_min_alternations
            && (unexplained as f64) <= p.branch_max_unexplained * reps.len() as f64;
        if conflict {
            let (t0, t1) = (
                reps[a[0].min(b[0])].t,
                reps[(*a.last().unwrap_or(&0)).max(*b.last().unwrap_or(&0))].t,
            );
            let mut detail = Map::new();
            detail.insert("reports_first_track".into(), json!(a.len()));
            detail.insert("reports_second_track".into(), json!(b.len()));
            detail.insert("alternations".into(), json!(alt));
            detail.insert("unexplained_reports".into(), json!(unexplained));
            if min_sep.is_finite() {
                detail.insert("min_separation_m".into(), json!(min_sep.round()));
            }
            flags.push(Flag {
                vessel_id: id.clone(),
                detector: Detector::IdentityConflict,
                span: Some((t0, t1)),
                hits: alt,
                anchor: Some((reps[a[0]].lat, reps[a[0]].lon)),
                detail,
                event: None,
            });
            for idx in [&a, &b] {
                let seq: Vec<&Report> = idx.iter().map(|&i| reps[i]).collect();
                motion(p, id, &seq, &mut flags);
            }
        } else {
            motion(p, id, &reps, &mut flags);
        }

        // Point detectors on every report.
        let mut speed = Vec::new();
        let mut on_land = Vec::new();
        let mut at_place = Vec::new();
        for (k, r) in reps.iter().enumerate() {
            let anchor = if k > 0 {
                (reps[k - 1].lat, reps[k - 1].lon)
            } else {
                (r.lat, r.lon)
            };
            if let Some(s) = r.sog.filter(|s| *s > p.max_speed_kn) {
                let mut h = hit(r.t, anchor);
                h.vals = vec![("max_reported_speed_kn", s)];
                speed.push(h);
            }
            if let Some(l) = land.as_deref_mut() {
                if l.is_inland(r.lat, r.lon) {
                    on_land.push(hit(r.t, anchor));
                }
            }
            for pl in places {
                if haversine_m(pl.lat, pl.lon, r.lat, r.lon) <= pl.radius_m {
                    let mut h = hit(r.t, anchor);
                    h.tags = vec![pl.name.clone()];
                    at_place.push(h);
                }
            }
            let key = (
                (r.lat / p.same_pos_round_deg).round() as i64,
                (r.lon / p.same_pos_round_deg).round() as i64,
                (r.t / p.same_pos_window_s).floor() as i64,
            );
            keys.push((key, ti as u32, k as u32));
        }
        let gap = p.episode_gap_s;
        episodes(
            id,
            Detector::ReportedSpeed,
            speed,
            gap,
            p.min_speed_reports,
            &mut flags,
        );
        episodes(
            id,
            Detector::OnLand,
            on_land,
            gap,
            p.min_land_reports,
            &mut flags,
        );
        episodes(
            id,
            Detector::AtListedPlace,
            at_place,
            gap,
            p.min_place_reports,
            &mut flags,
        );
        if let Some(why) = mmsi_problem(id) {
            let mut detail = Map::new();
            detail.insert("reasons".into(), json!([why]));
            flags.push(Flag {
                vessel_id: id.clone(),
                detector: Detector::IdentityFormat,
                span: None,
                hits: 1,
                anchor: None,
                detail,
                event: None,
            });
        }
        sorted_tracks.push(reps);
    }

    // common_position: runs of one key with enough distinct tracks; each track's first report there.
    keys.sort_unstable();
    let mut common: BTreeMap<&str, Vec<Hit>> = BTreeMap::new();
    let mut s = 0;
    while s < keys.len() {
        let mut e = s + 1;
        while e < keys.len() && keys[e].0 == keys[s].0 {
            e += 1;
        }
        let mut members: Vec<(u32, u32)> = keys[s..e].iter().map(|k| (k.1, k.2)).collect();
        members.dedup_by_key(|m| m.0);
        if members.len() >= p.same_pos_min_vessels {
            let (la, lo, _) = keys[s].0;
            for (ti, k) in members.iter().map(|&(a, b)| (a as usize, b as usize)) {
                let reps = &sorted_tracks[ti];
                let a = reps[k.saturating_sub(1)];
                let mut h = hit(reps[k].t, (a.lat, a.lon));
                h.vals = vec![("max_vessels_at_position", members.len() as f64)];
                h.tags = vec![format!(
                    "{:.4},{:.4}",
                    la as f64 * p.same_pos_round_deg,
                    lo as f64 * p.same_pos_round_deg
                )];
                common.entry(ids[ti].as_str()).or_default().push(h);
            }
        }
        s = e;
    }
    for (id, hits) in common {
        let mut f = Vec::new();
        episodes(
            id,
            Detector::CommonPosition,
            hits,
            p.episode_gap_s,
            1,
            &mut f,
        );
        for mut fl in f {
            if let Some(v) = fl.detail.remove("reasons") {
                fl.detail.insert("positions".into(), v);
            }
            flags.push(fl);
        }
    }

    // Identity: stated IMO numbers.
    let span_of: HashMap<&str, (f64, f64)> = tracks
        .iter()
        .map(|(id, _, a, b)| (id.as_str(), (*a, *b)))
        .collect();
    let mut by_imo: BTreeMap<u64, Vec<&str>> = BTreeMap::new();
    for (id, imos) in &input.imo {
        if imos.len() > 1 {
            let mut detail = Map::new();
            detail.insert("imo_stated".into(), json!(imos));
            flags.push(Flag {
                vessel_id: id.clone(),
                detector: Detector::IdentityChange,
                span: span_of.get(id.as_str()).copied(),
                hits: imos.len(),
                anchor: None,
                detail,
                event: None,
            });
        }
        let bad: Vec<u64> = imos
            .iter()
            .copied()
            .filter(|i| !imo_check_digit_ok(*i))
            .collect();
        if !bad.is_empty() {
            let mut detail = Map::new();
            detail.insert("reasons".into(), json!(["imo_check_digit"]));
            detail.insert("imo_stated".into(), json!(bad));
            flags.push(Flag {
                vessel_id: id.clone(),
                detector: Detector::IdentityFormat,
                span: None,
                hits: bad.len(),
                anchor: None,
                detail,
                event: None,
            });
        }
        for i in imos {
            by_imo.entry(*i).or_default().push(id.as_str());
        }
    }
    for (imo, ids) in &by_imo {
        for id in ids {
            let Some(&(a0, a1)) = span_of.get(id) else {
                continue;
            };
            let others: Vec<&str> = ids
                .iter()
                .filter(|o| *o != id)
                .filter(|o| {
                    span_of
                        .get(*o)
                        .is_some_and(|&(b0, b1)| b0 <= a1 && a0 <= b1)
                })
                .copied()
                .collect();
            if !others.is_empty() {
                let mut detail = Map::new();
                detail.insert("imo_stated".into(), json!(imo));
                detail.insert("also_stated_by".into(), json!(others));
                flags.push(Flag {
                    vessel_id: id.to_string(),
                    detector: Detector::SharedImo,
                    span: Some((a0, a1)),
                    hits: others.len(),
                    anchor: None,
                    detail,
                    event: None,
                });
            }
        }
    }

    flags.sort_by(|a, b| {
        a.vessel_id
            .cmp(&b.vessel_id)
            .then(
                a.span
                    .map_or(f64::NEG_INFINITY, |s| s.0)
                    .total_cmp(&b.span.map_or(f64::NEG_INFINITY, |s| s.0)),
            )
            .then(a.detector.cmp(&b.detector))
    });
    let events = link_events(p, &mut flags);
    Analysis {
        flags,
        events,
        tracks,
        land_enabled: land.is_some(),
        places: places.len(),
    }
}

fn find(parent: &mut [usize], mut x: usize) -> usize {
    while parent[x] != x {
        parent[x] = parent[parent[x]];
        x = parent[x];
    }
    x
}

/// Single-linkage clustering of the flags with a time and an anchor.
fn link_events(p: &Params, flags: &mut [Flag]) -> Vec<Event> {
    let mut idx: Vec<usize> = (0..flags.len())
        .filter(|&i| flags[i].detector.joins_events() && flags[i].anchor.is_some())
        .filter(|&i| flags[i].span.is_some())
        .collect();
    let span = |f: &Flag| f.span.unwrap_or((0.0, 0.0));
    idx.sort_by(|&a, &b| span(&flags[a]).0.total_cmp(&span(&flags[b]).0));
    let mut parent: Vec<usize> = (0..flags.len()).collect();
    // Sweep in start order; `active` holds flags that can still link to a later start.
    let mut active: Vec<usize> = Vec::new();
    for &i in &idx {
        let (s, _) = span(&flags[i]);
        active.retain(|&j| span(&flags[j]).1 + p.event_link_s >= s);
        let (la, lo) = flags[i].anchor.unwrap_or((0.0, 0.0));
        for &j in &active {
            let (lb, lob) = flags[j].anchor.unwrap_or((0.0, 0.0));
            if flags[j].vessel_id == flags[i].vessel_id
                || haversine_m(la, lo, lb, lob) <= p.event_link_m
            {
                let (ri, rj) = (find(&mut parent, i), find(&mut parent, j));
                if ri != rj {
                    parent[ri.max(rj)] = ri.min(rj);
                }
            }
        }
        active.push(i);
    }
    let mut groups: BTreeMap<usize, Vec<usize>> = BTreeMap::new();
    for &i in &idx {
        let r = find(&mut parent, i);
        groups.entry(r).or_default().push(i);
    }
    let mut events: Vec<(f64, String, Vec<usize>)> = groups
        .into_values()
        .filter(|g| {
            let v: BTreeSet<&str> = g.iter().map(|&i| flags[i].vessel_id.as_str()).collect();
            v.len() >= p.event_min_vessels
        })
        .map(|g| {
            let t0 = g
                .iter()
                .map(|&i| span(&flags[i]).0)
                .fold(f64::INFINITY, f64::min);
            let first = g
                .iter()
                .map(|&i| flags[i].vessel_id.clone())
                .min()
                .unwrap_or_default();
            (t0, first, g)
        })
        .collect();
    events.sort_by(|a, b| a.0.total_cmp(&b.0).then(a.1.cmp(&b.1)));
    let mut out = Vec::new();
    for (n, (_, _, g)) in events.into_iter().enumerate() {
        let id = n + 1;
        let mut vessels = BTreeSet::new();
        let mut detectors: BTreeMap<&'static str, usize> = BTreeMap::new();
        let (mut t0, mut t1) = (f64::INFINITY, f64::NEG_INFINITY);
        let mut area = [90.0f64, 180.0, -90.0, -180.0];
        for &i in &g {
            let f = &mut flags[i];
            f.event = Some(id);
            vessels.insert(f.vessel_id.clone());
            *detectors.entry(f.detector.name()).or_default() += 1;
            let (a, b) = f.span.unwrap_or((0.0, 0.0));
            t0 = t0.min(a);
            t1 = t1.max(b);
            let (la, lo) = f.anchor.unwrap_or((0.0, 0.0));
            area = [
                area[0].min(la),
                area[1].min(lo),
                area[2].max(la),
                area[3].max(lo),
            ];
        }
        out.push(Event {
            id,
            span: (t0, t1),
            vessels: vessels.into_iter().collect(),
            detectors,
            area,
        });
    }
    out
}

/// ISO 8601 UTC, whole seconds.
pub fn iso(t: f64) -> String {
    let s = t.floor() as i64;
    let (y, m, d) = civil_from_days(s.div_euclid(86_400));
    let sod = s.rem_euclid(86_400);
    format!(
        "{y:04}-{m:02}-{d:02}T{:02}:{:02}:{:02}Z",
        sod / 3600,
        (sod % 3600) / 60,
        sod % 60
    )
}

fn r6(x: f64) -> f64 {
    round_to(x, 1e-6)
}

const CAVEATS: [&str; 5] = [
    "A flag states that reports of a track are inconsistent with ship motion, with a supplied map or list of places, or with other reports. It does not identify a cause, a source or an intent.",
    "Causes other than interference include receiver and transponder faults, wrong configuration, shared or re-used identifiers, data processing and merging errors, and test equipment.",
    "Identifiers are written as the input states them; a stated identity is not a verified one.",
    "Events join flags close in time and space. The reported area of an event is where the affected tracks reported from before the inconsistency; it is not the location of any source.",
    "MODELLED: thresholds are pre-registered and the stated false-alarm and detection rates come from synthetic tracks (docs/AIS-INTEGRITY.md).",
];

impl Analysis {
    /// The JSON Lines: a header, per track a `track` line and its `flag` lines, then the `event` lines
    /// and a `summary` line.
    pub fn to_jsonl(&self, p: &Params, stats: &ReadStats) -> String {
        let mut lines: Vec<Value> = Vec::new();
        lines.push(json!({
            "kind": "header",
            "schema": SCHEMA,
            "method": METHOD_ID,
            "evidence": "MODELLED",
            "detectors": Detector::ALL.iter().map(|d| d.name()).collect::<Vec<_>>(),
            "parameters": p.to_json(),
            "on_land_detector": if self.land_enabled { "enabled" } else { "disabled: no land polygons supplied" },
            "listed_places": self.places,
            "input_stats": {
                "rows": stats.rows,
                "used": stats.used,
                "rejected_malformed": stats.rejected_malformed,
                "rejected_invalid_position": stats.rejected_invalid_position,
                "rejected_no_time": stats.rejected_no_time,
                "bad_checksum": stats.bad_checksum,
            },
            "caveats": CAVEATS,
        }));
        let mut by_vessel: BTreeMap<&str, Vec<&Flag>> = BTreeMap::new();
        for f in &self.flags {
            by_vessel.entry(f.vessel_id.as_str()).or_default().push(f);
        }
        for (id, n, t0, t1) in &self.tracks {
            let fl = by_vessel.remove(id.as_str()).unwrap_or_default();
            lines.push(json!({
                "kind": "track",
                "vessel_id": id,
                "reports": n,
                "t_first": iso(*t0),
                "t_last": iso(*t1),
                "flags": fl.len(),
            }));
            lines.extend(fl.into_iter().map(flag_json));
        }
        // Identity flags of identifiers with no position report.
        for fl in by_vessel.into_values() {
            lines.extend(fl.into_iter().map(flag_json));
        }
        for e in &self.events {
            lines.push(json!({
                "kind": "event",
                "event": e.id,
                "t_start": iso(e.span.0),
                "t_end": iso(e.span.1),
                "vessels": e.vessels.len(),
                "vessel_ids": e.vessels,
                "detectors": e.detectors,
                "reported_area": {
                    "south": r6(e.area[0]), "west": r6(e.area[1]),
                    "north": r6(e.area[2]), "east": r6(e.area[3]),
                },
                "evidence": "MODELLED",
            }));
        }
        let mut per: Map<String, Value> = Map::new();
        for d in Detector::ALL {
            let fl: Vec<&Flag> = self.flags.iter().filter(|f| f.detector == d).collect();
            let v: BTreeSet<&str> = fl.iter().map(|f| f.vessel_id.as_str()).collect();
            per.insert(
                d.name().into(),
                json!({"flags": fl.len(), "tracks": v.len()}),
            );
        }
        let flagged: BTreeSet<&str> = self.flags.iter().map(|f| f.vessel_id.as_str()).collect();
        lines.push(json!({
            "kind": "summary",
            "tracks": self.tracks.len(),
            "tracks_flagged": flagged.len(),
            "flags": self.flags.len(),
            "events": self.events.len(),
            "per_detector": per,
            "evidence": "MODELLED",
        }));
        let mut s = String::new();
        for l in lines {
            s.push_str(&l.to_string());
            s.push('\n');
        }
        s
    }
}

fn flag_json(f: &Flag) -> Value {
    let mut o = Map::new();
    o.insert("kind".into(), json!("flag"));
    o.insert("vessel_id".into(), json!(f.vessel_id));
    o.insert("detector".into(), json!(f.detector.name()));
    if let Some((a, b)) = f.span {
        o.insert("t_start".into(), json!(iso(a)));
        o.insert("t_end".into(), json!(iso(b)));
    }
    o.insert("hits".into(), json!(f.hits));
    if let Some((la, lo)) = f.anchor {
        o.insert("anchor".into(), json!({"lat": r6(la), "lon": r6(lo)}));
    }
    o.insert("detail".into(), Value::Object(f.detail.clone()));
    if let Some(e) = f.event {
        o.insert("event".into(), json!(e));
    }
    o.insert("evidence".into(), json!("MODELLED"));
    Value::Object(o)
}

fn looks_like_nmea(text: &str) -> bool {
    text.lines()
        .map(|l| l.trim_matches(|c: char| c.is_whitespace() || c == '\0'))
        .find(|l| !l.is_empty())
        .is_some_and(|l| l.starts_with('!') || l.starts_with('\\') || l.starts_with("UdPbC"))
}

/// `kshana ais-integrity <input> [--format csv|nmea] [--land <land.geojson>] [--places <places.csv>]
/// [--out <flags.jsonl>]`; returns the exit code (0 on success, 2 on a usage or input error).
pub fn run_cli(args: &[String]) -> i32 {
    match run_inner(args) {
        Ok(()) => 0,
        Err(e) => {
            eprintln!("{e}");
            2
        }
    }
}

fn run_inner(args: &[String]) -> Result<(), String> {
    if args.is_empty() || args.iter().any(|a| a == "--help" || a == "-h") {
        if args.is_empty() {
            return Err(crate::t!("ais-integrity-usage"));
        }
        println!("{}", crate::t!("ais-integrity-usage"));
        return Ok(());
    }
    let (mut input, mut format, mut land, mut places, mut out) = (None, None, None, None, None);
    let mut it = args.iter();
    while let Some(a) = it.next() {
        let mut val = || {
            it.next()
                .cloned()
                .ok_or_else(|| crate::terr!("e-ais-integrity-missing-value", option = a))
        };
        match a.as_str() {
            "--format" => format = Some(val()?),
            "--land" => land = Some(val()?),
            "--places" => places = Some(val()?),
            "--out" => out = Some(val()?),
            s if s.starts_with('-') => {
                return Err(crate::terr!("e-ais-integrity-unknown-option", option = s))
            }
            s if input.is_none() => input = Some(s.to_string()),
            _ => return Err(crate::t!("ais-integrity-usage")),
        }
    }
    let Some(input_path) = input else {
        return Err(crate::t!("ais-integrity-usage"));
    };
    let read = |path: &str| {
        std::fs::read_to_string(path)
            .map_err(|e| crate::terr!("e-ais-integrity-cannot-read", path = path, e = e))
    };
    let text = read(&input_path)?;
    let nmea = match format.as_deref() {
        Some("nmea") => true,
        Some("csv") => false,
        Some(other) => return Err(crate::terr!("e-ais-integrity-bad-format", value = other)),
        None => looks_like_nmea(&text),
    };
    let p = Params::PREREGISTERED_V1;
    let mut inp = Input::new();
    if nmea {
        inp.read_nmea(text.as_bytes())
    } else {
        inp.read_csv(text.as_bytes())
    }
    .map_err(|e| e.to_string())?;
    let mut mask = match land {
        Some(path) => Some(
            LandMask::from_geojson_str(&read(&path)?, p.land_buffer_m)
                .map_err(|e| e.to_string())?,
        ),
        None => None,
    };
    let places = match places {
        Some(path) => read_places(read(&path)?.as_bytes()).map_err(|e| e.to_string())?,
        None => Vec::new(),
    };
    let an = analyse(&inp, &p, mask.as_mut(), &places);
    let body = an.to_jsonl(&p, &inp.stats);
    match out {
        Some(path) => {
            std::fs::write(&path, &body)
                .map_err(|e| crate::terr!("e-ais-integrity-cannot-write", path = path, e = e))?;
            let flagged: BTreeSet<&str> = an.flags.iter().map(|f| f.vessel_id.as_str()).collect();
            eprintln!(
                "{}",
                crate::t!(
                    "ais-integrity-summary",
                    n_tracks = an.tracks.len(),
                    n_flagged = flagged.len(),
                    n_flags = an.flags.len(),
                    n_events = an.events.len()
                )
            );
        }
        None => {
            let mut so = std::io::stdout().lock();
            so.write_all(body.as_bytes())
                .map_err(|e| crate::terr!("e-ais-integrity-cannot-write", path = "-", e = e))?;
        }
    }
    Ok(())
}

#[cfg(test)]
mod tests {
    use super::*;

    fn rep(t: f64, lat: f64, lon: f64, sog: Option<f64>) -> Report {
        Report {
            t,
            lat,
            lon,
            sog,
            stw: None,
            nav_status: None,
        }
    }

    #[test]
    fn imo_check_digit_follows_the_published_rule() {
        // IMO 9074729: 9*7 + 0*6 + 7*5 + 4*4 + 7*3 + 2*2 = 139, check digit 9.
        assert!(imo_check_digit_ok(9_074_729));
        assert!(!imo_check_digit_ok(9_074_728));
        assert!(!imo_check_digit_ok(123));
    }

    #[test]
    fn mmsi_rules() {
        assert_eq!(mmsi_problem("230123456"), None);
        assert_eq!(mmsi_problem("ABC"), None);
        assert_eq!(mmsi_problem("23012345"), Some("mmsi_not_nine_digits"));
        assert_eq!(mmsi_problem("123456789"), Some("mmsi_prefix_not_allocated"));
        assert_eq!(mmsi_problem("002301234"), None);
        assert_eq!(mmsi_problem("992301234"), None);
        assert_eq!(mmsi_problem("970123456"), None);
        assert_eq!(mmsi_problem("111230123"), None);
        assert_eq!(mmsi_problem("200000001"), Some("mmsi_prefix_not_allocated"));
    }

    #[test]
    fn two_alternating_places_are_an_identity_conflict_not_jumps() {
        let p = Params::PREREGISTERED_V1;
        let mut inp = Input::new();
        for k in 0..40 {
            let t = 1.7e9 + k as f64 * 10.0;
            let (lat, lon) = if k % 2 == 0 {
                (60.0, 24.0 + k as f64 * 1e-4)
            } else {
                (59.0, 22.0 + k as f64 * 1e-4)
            };
            inp.push("230000001", rep(t, lat, lon, None));
        }
        let an = analyse(&inp, &p, None, &[]);
        let dets: Vec<_> = an.flags.iter().map(|f| f.detector).collect();
        assert_eq!(dets, vec![Detector::IdentityConflict], "{:?}", an.flags);
    }

    #[test]
    fn iso_formats_whole_seconds() {
        assert_eq!(iso(1_735_603_200.4), "2024-12-31T00:00:00Z");
    }
}
