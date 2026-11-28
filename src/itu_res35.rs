// SPDX-License-Identifier: AGPL-3.0-only
//! ITU Resolution 35 deployment check from public element sets (`kshana itu-res35`,
//! docs/ITU-RES35.md).
//!
//! Resolution 35 sets a milestone-based approach for the frequency
//! assignments of large non-geostationary systems in the FSS, MSS and BSS bands its Table lists.
//! The text this module follows is **Resolution 35 (Rev.WRC-23)**, as published by ITU at
//! <https://www.itu.int/en/ITU-R/space/Documents/RES35(REV.%20WRC-23).pdf> (fetched 2026-11-27).
//! What it uses from that text:
//!
//! * the milestones fall two, five and seven years after the end of the seven-year regulatory
//!   period of No. 11.44 (*resolves* 7a-c); for assignments whose period ended before
//!   1 January 2021 they fall on 1 January 2023, 2026 and 2028 (*resolves* 8a-c); the report is
//!   due 30 days after each milestone and any modification 90 days after (*resolves* 7, 8, 11);
//! * the minimum deployed is 10 % and 50 % of the total number of satellites, "rounded down to the
//!   lower integer", then 100 % (*resolves* 11a-c), where 100 % may mean 100 % of the filed
//!   satellites or 100 % minus one satellite (*resolves* 4);
//! * when a milestone is missed the modified total may be at most 10 times, 2 times and 1 time the
//!   number deployed (*resolves* 11a-c);
//! * a "notified orbital plane" is defined by its inclination, apogee, perigee and (for an
//!   eccentric orbit) argument of perigee, and the "total number of satellites" is the sum of the
//!   satellites per notified plane (*noting*); Annex 1 asks for the number of space stations
//!   deployed into each notified orbital plane.
//!
//! The Resolution gives **no numeric orbital tolerance** for "deployed into a notified plane", and
//! no rule for judging deployment from public element sets. The tolerances and the
//! station-keeping test are therefore inputs, stated in the filing file and repeated in the
//! report as assumptions. The post-milestone procedure of *resolves* 19 to 21 is not evaluated.
//!
//! **Evidence: MODELLED.** The report estimates deployment from public element sets (mean
//! elements; altitudes from the un-Kozai'd SGP4 mean motion over the WGS-72 radius). It is not the
//! deployment information an administration submits, not an examination by the
//! Radiocommunication Bureau, and says nothing about whether a satellite can transmit or receive
//! on the filed assignments.

use std::collections::{BTreeMap, BTreeSet};

use serde::{Deserialize, Serialize};
use sha2::{Digest, Sha256};

use crate::gnss_time::days_from_civil;

/// Report format tag.
pub const FORMAT: &str = "kshana.itu-res35-report/1";
/// The text the milestones are taken from.
pub const SOURCE_TITLE: &str = "ITU Resolution 35 (Rev.WRC-23): A milestone-based approach for the implementation of frequency assignments to space stations in a non-geostationary-satellite system in specific frequency bands and services";
/// Where it was read.
pub const SOURCE_URL: &str =
    "https://www.itu.int/en/ITU-R/space/Documents/RES35(REV.%20WRC-23).pdf";
/// When it was read.
pub const SOURCE_FETCHED: &str = "2026-11-27";
/// What the report is not.
pub const DISCLAIMER: &str = "MODELLED estimate of deployment from public element sets under the tolerances stated in the filing file. It is not the deployment information a notifying administration submits under Annex 1, not an examination or finding of the ITU Radiocommunication Bureau, and not a statement that any satellite can transmit or receive on the filed assignments.";
/// The date before which the end of the regulatory period puts a system under *resolves* 3 and 8.
pub const TRANSITION_DATE: &str = "2021-01-01";

/// WGS-72 Earth radius (km), the SGP4 convention of element sets.
const RE_KM: f64 = 6378.135;
/// WGS-72 gravitational parameter (km^3/s^2).
const MU_KM3_S2: f64 = 398_600.8;
/// WGS-72 J2.
const J2: f64 = 0.001_082_616;

/// Which satellites belong to the system.
#[derive(Clone, Debug, Default, Deserialize, Serialize)]
#[serde(deny_unknown_fields)]
pub struct Select {
    /// NORAD catalogue numbers.
    #[serde(default)]
    pub norad_ids: Vec<u32>,
    /// Object-name prefixes (from the element sets or the satellite catalogue).
    #[serde(default)]
    pub name_prefixes: Vec<String>,
    /// International-designator prefixes (`2024-`, `2024-05`).
    #[serde(default)]
    pub object_id_prefixes: Vec<String>,
}

/// Orbital tolerances for "deployed into a notified plane" (inputs; the Resolution gives none).
#[derive(Clone, Debug, Deserialize, Serialize)]
#[serde(deny_unknown_fields)]
pub struct Tolerance {
    /// |inclination − notified| at most this (deg).
    pub inclination_deg: f64,
    /// |apogee − notified| and |perigee − notified| at most this (km).
    pub altitude_km: f64,
    /// |argument of perigee − notified| at most this (deg), for planes that give one.
    #[serde(default)]
    pub argument_of_perigee_deg: Option<f64>,
}

/// The station-keeping test (an input).
#[derive(Clone, Debug, Deserialize, Serialize)]
#[serde(deny_unknown_fields)]
pub struct StationKeeping {
    /// Element sets within this many days before the as-of date are used (days).
    pub window_days: f64,
    /// The sets used must span at least this many days, or the result is `unknown` (days).
    pub min_span_days: f64,
    /// Station-keeping when the range of semi-major axis over the window is at most this (km).
    pub max_sma_range_km: f64,
    /// An object whose latest set is older than this at the as-of date is not counted (days).
    pub max_element_age_days: f64,
}

/// A group of notified orbital planes with the same characteristics.
#[derive(Clone, Debug, Deserialize, Serialize)]
#[serde(deny_unknown_fields)]
pub struct PlaneGroup {
    /// Label of the group.
    pub id: String,
    /// Number of notified orbital planes in the group (default 1).
    #[serde(default = "one")]
    pub planes: u32,
    /// Satellites per plane (Appendix 4 item A.4.b.4.b).
    pub satellites_per_plane: u32,
    /// Inclination (deg, A.4.b.4.a).
    pub inclination_deg: f64,
    /// Apogee altitude (km, A.4.b.4.d).
    pub apogee_km: f64,
    /// Perigee altitude (km, A.4.b.4.e).
    pub perigee_km: f64,
    /// Argument of perigee (deg, A.4.b.4.i), for eccentric orbits.
    #[serde(default)]
    pub argument_of_perigee_deg: Option<f64>,
}

fn one() -> u32 {
    1
}

/// The filing description file.
#[derive(Clone, Debug, Deserialize, Serialize)]
#[serde(deny_unknown_fields)]
pub struct Filing {
    /// Name of the satellite system.
    pub system: String,
    /// Notifying administration, as stated.
    #[serde(default)]
    pub administration: String,
    /// End of the seven-year regulatory period of No. 11.44 (`YYYY-MM-DD`).
    pub regulatory_period_end: String,
    /// Which objects belong to the system.
    pub select: Select,
    /// Orbital tolerances.
    pub tolerance: Tolerance,
    /// Station-keeping test.
    pub station_keeping: StationKeeping,
    /// Notified orbital planes.
    #[serde(rename = "plane_group")]
    pub plane_groups: Vec<PlaneGroup>,
}

/// One element set, reduced to what the check needs.
#[derive(Clone, Debug, PartialEq)]
pub struct ElementSet {
    /// NORAD catalogue number.
    pub norad: u32,
    /// Object name, if the source gives one.
    pub name: String,
    /// International designator, if the source gives one.
    pub object_id: String,
    /// Epoch, days since 1970-01-01 UTC.
    pub epoch_days: f64,
    /// Kozai mean motion (rev/day).
    pub mean_motion_rev_day: f64,
    /// Eccentricity.
    pub eccentricity: f64,
    /// Inclination (deg).
    pub inclination_deg: f64,
    /// Argument of perigee (deg).
    pub argument_of_perigee_deg: f64,
}

/// One satellite-catalogue row.
#[derive(Clone, Debug, PartialEq, Default)]
pub struct CatalogueEntry {
    /// Object name.
    pub name: String,
    /// International designator.
    pub object_id: String,
    /// `PAY`, `R/B`, `DEB`, `UNK` (empty when absent).
    pub object_type: String,
    /// Decay date, days since 1970-01-01, when given.
    pub decay_days: Option<i64>,
}

/// One input file, as hashed.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct InputRecord {
    /// Name as given on the command line.
    pub input: String,
    /// `filing`, `elements` or `satcat`.
    pub role: &'static str,
    /// SHA-256 of the bytes read.
    pub sha256: String,
    /// Records read.
    pub records: usize,
}

/// The mean orbit of one element set.
#[derive(Clone, Copy, Debug, PartialEq, Serialize)]
pub struct MeanOrbit {
    /// Semi-major axis (km).
    pub sma_km: f64,
    /// Apogee altitude (km).
    pub apogee_km: f64,
    /// Perigee altitude (km).
    pub perigee_km: f64,
}

/// One object of the system.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct ObjectResult {
    /// NORAD catalogue number.
    pub norad: u32,
    /// Name.
    pub name: String,
    /// International designator.
    pub object_id: String,
    /// `deployed`, `not-in-notified-plane`, `decayed`, `not-a-payload`, `stale-elements` or
    /// `no-elements`.
    pub status: &'static str,
    /// The plane group matched, if any.
    pub plane_group: Option<String>,
    /// `station-keeping`, `not-station-keeping` or `unknown`.
    pub station_keeping: &'static str,
    /// Epoch of the latest set used (`YYYY-MM-DD`).
    pub latest_epoch: Option<String>,
    /// Inclination of the latest set (deg).
    pub inclination_deg: Option<f64>,
    /// Mean orbit of the latest set.
    pub orbit: Option<MeanOrbit>,
    /// Range of semi-major axis over the station-keeping window (km).
    pub sma_range_km: Option<f64>,
    /// Span of the sets in that window (days).
    pub span_days: Option<f64>,
}

/// Counts per plane group.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct GroupResult {
    /// Group id.
    pub id: String,
    /// Notified satellites in the group.
    pub notified: u32,
    /// Objects matched to the group.
    pub deployed: u32,
    /// Of those, station-keeping.
    pub station_keeping: u32,
    /// Of those, station-keeping not decidable from the sets given.
    pub station_keeping_unknown: u32,
    /// Matched objects beyond the notified number (not counted toward the total).
    pub excess: u32,
}

/// One milestone.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct Milestone {
    /// `M1` (2 years), `M2` (5 years), `M3` (7 years).
    pub id: &'static str,
    /// The provision.
    pub provision: &'static str,
    /// Milestone date (`YYYY-MM-DD`).
    pub date: String,
    /// Deployment information due (`YYYY-MM-DD`).
    pub report_due: String,
    /// Modifications due if short (`YYYY-MM-DD`, *resolves* 11).
    pub modification_due: String,
    /// The percentage of the total.
    pub percent: u32,
    /// Minimum number deployed (10 % and 50 % rounded down; 100 % minus one for M3).
    pub required: u32,
    /// `passed` or `upcoming` at the as-of date.
    pub state: &'static str,
    /// Deployed count at the as-of date (counted toward the total).
    pub deployed: u32,
    /// Station-keeping count at the as-of date.
    pub station_keeping: u32,
    /// `required − deployed`, floored at 0.
    pub shortfall: u32,
    /// Whether `deployed ≥ required` at the as-of date.
    pub met_at_as_of: bool,
    /// If short at the milestone: the largest modified total *resolves* 11 allows.
    pub max_total_if_modified: u32,
}

/// The report.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct Report {
    /// [`FORMAT`].
    pub format: &'static str,
    /// `MODELLED`.
    pub label: &'static str,
    /// [`DISCLAIMER`].
    pub disclaimer: &'static str,
    /// Source of the milestone rules.
    pub source: BTreeMap<&'static str, &'static str>,
    /// Inputs and their hashes.
    pub inputs: Vec<InputRecord>,
    /// System name.
    pub system: String,
    /// Administration.
    pub administration: String,
    /// `resolves 7` (period ended on or after 2021-01-01) or `resolves 8`.
    pub regime: &'static str,
    /// End of the regulatory period.
    pub regulatory_period_end: String,
    /// Total number of satellites in the notified planes.
    pub total_satellites: u32,
    /// The date the counts are for.
    pub as_of: String,
    /// The tolerances and station-keeping test used, as given.
    pub assumptions: serde_json::Value,
    /// Per plane group.
    pub plane_groups: Vec<GroupResult>,
    /// Counted toward the total: the deployed objects, capped per group at the notified number.
    pub deployed: u32,
    /// Of those, station-keeping (capped the same way).
    pub station_keeping: u32,
    /// Per milestone.
    pub milestones: Vec<Milestone>,
    /// Per object.
    pub objects: Vec<ObjectResult>,
}

/// The `YYYY-MM-DD` date of a day count from 1970-01-01.
pub fn date_of(days: i64) -> String {
    crate::utc_readiness::civil_from_days(days)
}

/// Day count of a `YYYY-MM-DD` date (rejects impossible dates).
pub fn parse_date(s: &str) -> Option<i64> {
    let d = crate::utc_readiness::parse_date(s)?;
    (date_of(d) == s.trim()).then_some(d)
}

/// `date` plus `years` calendar years; 29 February becomes 28 February in a common year.
pub fn add_years(date: i64, years: i64) -> i64 {
    let s = date_of(date);
    let y: i64 = s[..4].parse().unwrap_or(1970) + years;
    let m: u32 = s[5..7].parse().unwrap_or(1);
    let mut d: u32 = s[8..10].parse().unwrap_or(1);
    let leap = (y % 4 == 0 && y % 100 != 0) || y % 400 == 0;
    if m == 2 && d == 29 && !leap {
        d = 28;
    }
    days_from_civil(y, m, d)
}

/// The mean orbit of a Kozai mean motion (rev/day), eccentricity and inclination: the SGP4
/// initialisation recovers the Brouwer mean motion, from which the semi-major axis follows.
pub fn mean_orbit(mean_motion_rev_day: f64, ecc: f64, incl_deg: f64) -> MeanOrbit {
    let xke = 60.0 / (RE_KM.powi(3) / MU_KM3_S2).sqrt();
    let no = mean_motion_rev_day * std::f64::consts::TAU / 1440.0;
    let cosio = incl_deg.to_radians().cos();
    let omeosq = 1.0 - ecc * ecc;
    let rteosq = omeosq.sqrt();
    let d1 = 0.75 * J2 * (3.0 * cosio * cosio - 1.0) / (rteosq * omeosq);
    let ak = (xke / no).powf(2.0 / 3.0);
    let del = d1 / (ak * ak);
    let adel = ak * (1.0 - del * del - del * (1.0 / 3.0 + 134.0 * del * del / 81.0));
    let del = d1 / (adel * adel);
    let no_unkozai = no / (1.0 + del);
    let a = (xke / no_unkozai).powf(2.0 / 3.0) * RE_KM;
    MeanOrbit {
        sma_km: a,
        apogee_km: a * (1.0 + ecc) - RE_KM,
        perigee_km: a * (1.0 - ecc) - RE_KM,
    }
}

/// Days since 1970 of an ISO-8601 UTC time `YYYY-MM-DDThh:mm:ss[.fff][Z]` or a CCSDS
/// day-of-year time `YYYY-DDDThh:mm:ss[.fff]`.
pub fn parse_epoch(s: &str) -> Option<f64> {
    let s = s.trim().trim_end_matches('Z');
    let (date, time) = s.split_once('T').unwrap_or((s, "00:00:00"));
    let day = if date.len() == 8 && date.as_bytes()[4] == b'-' {
        let y: i64 = date[..4].parse().ok()?;
        let doy: i64 = date[5..].parse().ok()?;
        if !(1..=366).contains(&doy) {
            return None;
        }
        days_from_civil(y, 1, 1) + doy - 1
    } else {
        parse_date(date)?
    };
    let mut it = time.splitn(3, ':');
    let h: f64 = it.next()?.parse().ok()?;
    let m: f64 = it.next().unwrap_or("0").parse().ok()?;
    let sec: f64 = it.next().unwrap_or("0").parse().ok()?;
    if !(0.0..24.0).contains(&h) || !(0.0..60.0).contains(&m) || !(0.0..61.0).contains(&sec) {
        return None;
    }
    Some(day as f64 + (h * 3600.0 + m * 60.0 + sec) / 86_400.0)
}

/// Split one CSV line (double quotes, `""` inside quotes).
pub fn split_csv(line: &str) -> Vec<String> {
    let mut out = Vec::new();
    let mut cur = String::new();
    let mut q = false;
    let mut it = line.chars().peekable();
    while let Some(c) = it.next() {
        match c {
            '"' if q && it.peek() == Some(&'"') => {
                cur.push('"');
                it.next();
            }
            '"' => q = !q,
            ',' if !q => out.push(std::mem::take(&mut cur)),
            _ => cur.push(c),
        }
    }
    out.push(cur);
    out.into_iter().map(|s| s.trim().to_string()).collect()
}

fn json_num(v: &serde_json::Value, k: &str) -> Option<f64> {
    match v.get(k)? {
        serde_json::Value::Number(n) => n.as_f64(),
        serde_json::Value::String(s) => s.trim().parse().ok(),
        _ => None,
    }
}

fn json_str(v: &serde_json::Value, k: &str) -> String {
    match v.get(k) {
        Some(serde_json::Value::String(s)) => s.trim().to_string(),
        Some(serde_json::Value::Number(n)) => n.to_string(),
        _ => String::new(),
    }
}

fn omm_record(v: &serde_json::Value) -> Result<ElementSet, String> {
    let need =
        |k: &str| json_num(v, k).ok_or_else(|| crate::terr!("e-itu-res35-omm-missing", k = k));
    Ok(ElementSet {
        norad: need("NORAD_CAT_ID")? as u32,
        name: json_str(v, "OBJECT_NAME"),
        object_id: json_str(v, "OBJECT_ID"),
        epoch_days: parse_epoch(&json_str(v, "EPOCH")).ok_or_else(|| {
            crate::terr!(
                "e-itu-res35-omm-epoch",
                epoch = format!("{:?}", json_str(v, "EPOCH"))
            )
        })?,
        mean_motion_rev_day: need("MEAN_MOTION")?,
        eccentricity: need("ECCENTRICITY")?,
        inclination_deg: need("INCLINATION")?,
        argument_of_perigee_deg: need("ARG_OF_PERICENTER")?,
    })
}

/// What a file holds.
#[derive(Clone, Debug, PartialEq)]
pub enum Parsed {
    /// Element sets.
    Elements(Vec<ElementSet>),
    /// Catalogue rows by NORAD number.
    Catalogue(BTreeMap<u32, CatalogueEntry>),
}

/// Parse an element-set or catalogue file: OMM JSON (an array of CelesTrak-style GP records or
/// one record), GP CSV (OMM keywords as the header), satellite-catalogue CSV (CelesTrak SATCAT
/// columns: `OBJECT_NAME`, `OBJECT_ID`, `NORAD_CAT_ID`, `OBJECT_TYPE`, `DECAY_DATE`), or
/// two- or three-line element sets.
pub fn parse_input(text: &str) -> Result<Parsed, String> {
    let t = text.trim_start_matches('\u{feff}').trim();
    if t.starts_with('[') || t.starts_with('{') {
        let v: serde_json::Value = serde_json::from_str(t).map_err(|e| e.to_string())?;
        let recs = match &v {
            serde_json::Value::Array(a) => a.iter().map(omm_record).collect::<Result<_, _>>()?,
            o => vec![omm_record(o)?],
        };
        return Ok(Parsed::Elements(recs));
    }
    let first = t.lines().next().unwrap_or("");
    if first.contains("NORAD_CAT_ID") {
        let head = split_csv(first);
        let col = |k: &str| head.iter().position(|h| h.eq_ignore_ascii_case(k));
        if col("MEAN_MOTION").is_some() {
            let mut out = Vec::new();
            for line in t.lines().skip(1).filter(|l| !l.trim().is_empty()) {
                let cells = split_csv(line);
                let obj: serde_json::Map<String, serde_json::Value> = head
                    .iter()
                    .zip(cells)
                    .map(|(h, c)| (h.to_ascii_uppercase(), serde_json::Value::String(c)))
                    .collect();
                out.push(omm_record(&serde_json::Value::Object(obj))?);
            }
            return Ok(Parsed::Elements(out));
        }
        let id = col("NORAD_CAT_ID").ok_or_else(|| crate::terr!("e-itu-res35-satcat-no-id"))?;
        let mut out = BTreeMap::new();
        for line in t.lines().skip(1).filter(|l| !l.trim().is_empty()) {
            let c = split_csv(line);
            let get = |k: &str| col(k).and_then(|i| c.get(i)).cloned().unwrap_or_default();
            let Ok(n) = c.get(id).map(String::as_str).unwrap_or("").parse::<u32>() else {
                return Err(crate::terr!("e-itu-res35-satcat-bad-id", line = line));
            };
            let decay = get("DECAY_DATE");
            out.insert(
                n,
                CatalogueEntry {
                    name: get("OBJECT_NAME"),
                    object_id: get("OBJECT_ID"),
                    object_type: get("OBJECT_TYPE"),
                    decay_days: if decay.is_empty() {
                        None
                    } else {
                        Some(parse_date(&decay[..decay.len().min(10)]).ok_or_else(|| {
                            crate::terr!(
                                "e-itu-res35-satcat-bad-decay",
                                decay = format!("{decay:?}")
                            )
                        })?)
                    },
                },
            );
        }
        return Ok(Parsed::Catalogue(out));
    }
    // Two- or three-line element sets.
    let lines: Vec<&str> = t
        .lines()
        .map(str::trim_end)
        .filter(|l| !l.trim().is_empty())
        .collect();
    let mut out = Vec::new();
    let mut name = String::new();
    let mut i = 0;
    while i < lines.len() {
        let l = lines[i];
        if l.starts_with("1 ") && lines.get(i + 1).is_some_and(|n| n.starts_with("2 ")) {
            let (l1, l2) = (l, lines[i + 1]);
            let tle = crate::tle::parse_tle(l1, l2)?;
            let id = crate::tle::parse_tle_identity(l1)?;
            let n = tle.no_kozai_rad_min * 1440.0 / std::f64::consts::TAU;
            out.push(ElementSet {
                norad: id.norad_cat_id,
                name: std::mem::take(&mut name),
                object_id: id.intl_designator,
                epoch_days: parse_epoch(&id.epoch_iso)
                    .ok_or_else(|| crate::terr!("e-itu-res35-tle-epoch"))?,
                mean_motion_rev_day: n,
                eccentricity: tle.ecco,
                inclination_deg: tle.inclo_rad.to_degrees(),
                argument_of_perigee_deg: tle.argpo_rad.to_degrees(),
            });
            i += 2;
        } else {
            name = l.trim().trim_start_matches("0 ").trim().to_string();
            i += 1;
        }
    }
    if out.is_empty() {
        return Err(crate::terr!("e-itu-res35-no-records"));
    }
    Ok(Parsed::Elements(out))
}

/// Parse and check a filing description (TOML).
pub fn parse_filing(text: &str) -> Result<Filing, String> {
    let f: Filing = toml::from_str(text).map_err(|e| e.to_string())?;
    if parse_date(&f.regulatory_period_end).is_none() {
        return Err(crate::terr!(
            "e-itu-res35-bad-period-end",
            value = format!("{:?}", f.regulatory_period_end)
        ));
    }
    if f.plane_groups.is_empty() {
        return Err(crate::terr!("e-itu-res35-no-planes"));
    }
    let s = &f.select;
    if s.norad_ids.is_empty() && s.name_prefixes.is_empty() && s.object_id_prefixes.is_empty() {
        return Err(crate::terr!("e-itu-res35-no-select"));
    }
    let t = &f.tolerance;
    let k = &f.station_keeping;
    for (name, v) in [
        ("tolerance.inclination_deg", t.inclination_deg),
        ("tolerance.altitude_km", t.altitude_km),
        ("station_keeping.window_days", k.window_days),
        ("station_keeping.min_span_days", k.min_span_days),
        ("station_keeping.max_sma_range_km", k.max_sma_range_km),
        (
            "station_keeping.max_element_age_days",
            k.max_element_age_days,
        ),
    ] {
        if !(v.is_finite() && v >= 0.0) {
            return Err(crate::terr!("e-itu-res35-negative", name = name));
        }
    }
    for g in &f.plane_groups {
        if g.planes == 0 || g.satellites_per_plane == 0 {
            return Err(crate::terr!(
                "e-itu-res35-empty-group",
                id = format!("{:?}", g.id)
            ));
        }
        if g.argument_of_perigee_deg.is_some() && t.argument_of_perigee_deg.is_none() {
            return Err(crate::terr!(
                "e-itu-res35-aop-tolerance",
                id = format!("{:?}", g.id)
            ));
        }
    }
    Ok(f)
}

/// Total number of satellites in the notified planes.
pub fn total_satellites(f: &Filing) -> u32 {
    f.plane_groups
        .iter()
        .map(|g| g.planes * g.satellites_per_plane)
        .sum()
}

/// The milestone dates and minimum numbers, without counts.
pub fn milestones(f: &Filing) -> (&'static str, Vec<Milestone>) {
    let end = parse_date(&f.regulatory_period_end).unwrap_or(0);
    let n = total_satellites(f);
    let early = end < parse_date(TRANSITION_DATE).unwrap_or(0);
    let rows: [(&str, i64, u32, u32, &str, &str); 3] = [
        ("M1", 2, 10, n / 10, "resolves 7a)", "resolves 8a)"),
        ("M2", 5, 50, n / 2, "resolves 7b)", "resolves 8b)"),
        (
            "M3",
            7,
            100,
            n.saturating_sub(1),
            "resolves 7c)",
            "resolves 8c)",
        ),
    ];
    let base = if early {
        parse_date(TRANSITION_DATE).unwrap_or(0)
    } else {
        end
    };
    let ms = rows
        .iter()
        .map(|&(id, years, percent, required, p7, p8)| {
            let date = add_years(base, years);
            Milestone {
                id,
                provision: if early { p8 } else { p7 },
                date: date_of(date),
                // resolves 8 names 1 February (31 days after 1 January); resolves 7 says 30 days.
                report_due: date_of(date + if early { 31 } else { 30 }),
                modification_due: date_of(date + 90),
                percent,
                required,
                state: "upcoming",
                deployed: 0,
                station_keeping: 0,
                shortfall: required,
                met_at_as_of: false,
                max_total_if_modified: 0,
            }
        })
        .collect();
    (if early { "resolves 8" } else { "resolves 7" }, ms)
}

fn selected(f: &Filing, norad: u32, name: &str, object_id: &str) -> bool {
    let s = &f.select;
    s.norad_ids.contains(&norad)
        || (!name.is_empty() && s.name_prefixes.iter().any(|p| name.starts_with(p.as_str())))
        || (!object_id.is_empty()
            && s.object_id_prefixes
                .iter()
                .any(|p| object_id.starts_with(p.as_str())))
}

fn angle_diff(a: f64, b: f64) -> f64 {
    let d = (a - b).rem_euclid(360.0);
    d.min(360.0 - d)
}

/// The plane group an orbit falls in, by the smallest normalised distance among the groups
/// within tolerance.
pub fn match_group<'a>(f: &'a Filing, e: &ElementSet, o: &MeanOrbit) -> Option<&'a PlaneGroup> {
    let t = &f.tolerance;
    let mut best: Option<(f64, &PlaneGroup)> = None;
    for g in &f.plane_groups {
        let di = (e.inclination_deg - g.inclination_deg).abs();
        let da = (o.apogee_km - g.apogee_km).abs();
        let dp = (o.perigee_km - g.perigee_km).abs();
        if di > t.inclination_deg || da > t.altitude_km || dp > t.altitude_km {
            continue;
        }
        let mut score = di / t.inclination_deg.max(1e-9) + (da + dp) / t.altitude_km.max(1e-9);
        if let (Some(w), Some(tol)) = (g.argument_of_perigee_deg, t.argument_of_perigee_deg) {
            let dw = angle_diff(e.argument_of_perigee_deg, w);
            if dw > tol {
                continue;
            }
            score += dw / tol.max(1e-9);
        }
        if best.is_none_or(|(s, _)| score < s) {
            best = Some((score, g));
        }
    }
    best.map(|(_, g)| g)
}

/// Run the check. `inputs` are `(name, bytes)` of the element-set and catalogue files; the
/// filing's own name and bytes are recorded too. `as_of` defaults to the date of the latest
/// selected element set.
pub fn evaluate(
    filing_name: &str,
    filing_bytes: &[u8],
    inputs: &[(String, Vec<u8>)],
    as_of: Option<i64>,
) -> Result<Report, String> {
    let f = parse_filing(&String::from_utf8_lossy(filing_bytes))?;
    let sha = |b: &[u8]| hex::encode(Sha256::digest(b));
    let mut records = vec![InputRecord {
        input: filing_name.to_string(),
        role: "filing",
        sha256: sha(filing_bytes),
        records: f.plane_groups.len(),
    }];
    let mut sets: BTreeMap<u32, Vec<ElementSet>> = BTreeMap::new();
    let mut cat: BTreeMap<u32, CatalogueEntry> = BTreeMap::new();
    for (name, bytes) in inputs {
        let parsed =
            parse_input(&String::from_utf8_lossy(bytes)).map_err(|e| format!("{name}: {e}"))?;
        let (role, n) = match parsed {
            Parsed::Elements(v) => {
                let n = v.len();
                for e in v {
                    sets.entry(e.norad).or_default().push(e);
                }
                ("elements", n)
            }
            Parsed::Catalogue(c) => {
                let n = c.len();
                cat.extend(c);
                ("satcat", n)
            }
        };
        records.push(InputRecord {
            input: name.clone(),
            role,
            sha256: sha(bytes),
            records: n,
        });
    }
    // The objects of the system: selected by any name or designator the inputs give.
    let mut ids = BTreeSet::new();
    for (n, v) in &sets {
        let c = cat.get(n);
        if v.iter().any(|e| selected(&f, *n, &e.name, &e.object_id))
            || c.is_some_and(|c| selected(&f, *n, &c.name, &c.object_id))
        {
            ids.insert(*n);
        }
    }
    for (n, c) in &cat {
        if selected(&f, *n, &c.name, &c.object_id) {
            ids.insert(*n);
        }
    }
    for n in &f.select.norad_ids {
        ids.insert(*n);
    }
    let latest = ids
        .iter()
        .filter_map(|n| sets.get(n))
        .flatten()
        .map(|e| e.epoch_days)
        .fold(f64::NEG_INFINITY, f64::max);
    let as_of = match as_of {
        Some(d) => d,
        None if latest.is_finite() => latest.floor() as i64,
        None => return Err(crate::terr!("e-itu-res35-no-elements")),
    };
    // A set counts if its epoch is before the end of the as-of day.
    let cutoff = (as_of + 1) as f64;
    let sk = &f.station_keeping;
    let mut objects = Vec::new();
    let mut groups: BTreeMap<&str, GroupResult> = f
        .plane_groups
        .iter()
        .map(|g| {
            (
                g.id.as_str(),
                GroupResult {
                    id: g.id.clone(),
                    notified: g.planes * g.satellites_per_plane,
                    deployed: 0,
                    station_keeping: 0,
                    station_keeping_unknown: 0,
                    excess: 0,
                },
            )
        })
        .collect();
    for n in &ids {
        let c = cat.get(n).cloned().unwrap_or_default();
        let mut v: Vec<&ElementSet> = sets
            .get(n)
            .map(|v| v.iter().filter(|e| e.epoch_days < cutoff).collect())
            .unwrap_or_default();
        v.sort_by(|a, b| a.epoch_days.total_cmp(&b.epoch_days));
        let last = v.last().copied();
        let name = last
            .map(|e| e.name.clone())
            .filter(|s| !s.is_empty())
            .unwrap_or_else(|| c.name.clone());
        let object_id = last
            .map(|e| e.object_id.clone())
            .filter(|s| !s.is_empty())
            .unwrap_or_else(|| c.object_id.clone());
        let mut r = ObjectResult {
            norad: *n,
            name,
            object_id,
            status: "no-elements",
            plane_group: None,
            station_keeping: "unknown",
            latest_epoch: last.map(|e| date_of(e.epoch_days.floor() as i64)),
            inclination_deg: last.map(|e| e.inclination_deg),
            orbit: last
                .map(|e| mean_orbit(e.mean_motion_rev_day, e.eccentricity, e.inclination_deg)),
            sma_range_km: None,
            span_days: None,
        };
        if c.decay_days.is_some_and(|d| d <= as_of) {
            r.status = "decayed";
        } else if !c.object_type.is_empty() && !c.object_type.eq_ignore_ascii_case("PAY") {
            r.status = "not-a-payload";
        } else if let (Some(e), Some(o)) = (last, r.orbit) {
            if cutoff - e.epoch_days > sk.max_element_age_days + 1.0 {
                r.status = "stale-elements";
            } else if let Some(g) = match_group(&f, e, &o) {
                r.status = "deployed";
                r.plane_group = Some(g.id.clone());
                let win: Vec<f64> = v
                    .iter()
                    .filter(|x| x.epoch_days >= cutoff - 1.0 - sk.window_days)
                    .map(|x| {
                        mean_orbit(x.mean_motion_rev_day, x.eccentricity, x.inclination_deg).sma_km
                    })
                    .collect();
                let first_in = v
                    .iter()
                    .find(|x| x.epoch_days >= cutoff - 1.0 - sk.window_days)
                    .map(|x| x.epoch_days)
                    .unwrap_or(e.epoch_days);
                let span = e.epoch_days - first_in;
                let lo = win.iter().copied().fold(f64::INFINITY, f64::min);
                let hi = win.iter().copied().fold(f64::NEG_INFINITY, f64::max);
                r.span_days = Some(span);
                r.sma_range_km = Some(hi - lo);
                r.station_keeping = if span < sk.min_span_days {
                    "unknown"
                } else if hi - lo <= sk.max_sma_range_km {
                    "station-keeping"
                } else {
                    "not-station-keeping"
                };
                let gr = groups.get_mut(g.id.as_str()).ok_or("group")?;
                gr.deployed += 1;
                match r.station_keeping {
                    "station-keeping" => gr.station_keeping += 1,
                    "unknown" => gr.station_keeping_unknown += 1,
                    _ => {}
                }
            } else {
                r.status = "not-in-notified-plane";
            }
        }
        objects.push(r);
    }
    let mut deployed = 0;
    let mut kept = 0;
    let groups: Vec<GroupResult> = f
        .plane_groups
        .iter()
        .filter_map(|g| groups.remove(g.id.as_str()))
        .map(|mut g| {
            g.excess = g.deployed.saturating_sub(g.notified);
            deployed += g.deployed.min(g.notified);
            kept += g.station_keeping.min(g.notified);
            g
        })
        .collect();
    let (regime, mut ms) = milestones(&f);
    for m in &mut ms {
        let date = parse_date(&m.date).unwrap_or(0);
        m.state = if as_of >= date { "passed" } else { "upcoming" };
        m.deployed = deployed;
        m.station_keeping = kept;
        m.shortfall = m.required.saturating_sub(deployed);
        m.met_at_as_of = deployed >= m.required;
        m.max_total_if_modified = match m.id {
            "M1" => deployed.saturating_mul(10),
            "M2" => deployed.saturating_mul(2),
            _ => deployed,
        };
    }
    let mut source = BTreeMap::new();
    source.insert("title", SOURCE_TITLE);
    source.insert("url", SOURCE_URL);
    source.insert("fetched", SOURCE_FETCHED);
    Ok(Report {
        format: FORMAT,
        label: "MODELLED",
        disclaimer: DISCLAIMER,
        source,
        inputs: records,
        system: f.system.clone(),
        administration: f.administration.clone(),
        regime,
        regulatory_period_end: f.regulatory_period_end.clone(),
        total_satellites: total_satellites(&f),
        as_of: date_of(as_of),
        assumptions: serde_json::json!({
            "tolerance": f.tolerance,
            "station_keeping": f.station_keeping,
            "orbit_model": "mean elements; semi-major axis from the un-Kozai'd SGP4 mean motion, WGS-72 (Re 6378.135 km, mu 398600.8 km3/s2, J2 0.001082616)",
            "counting": "an object counts toward the total when its latest element set is current and within the tolerances of a notified plane group; per group at most the notified number counts",
        }),
        plane_groups: groups,
        deployed,
        station_keeping: kept,
        milestones: ms,
        objects,
    })
}

/// The report as text.
pub fn text(r: &Report) -> String {
    let mut s = format!(
        "{} ({})\nsystem: {}  administration: {}  total satellites: {}  as of: {}\nregime: {} (regulatory period ended {})\nsource: {} ({}; fetched {})\n\n",
        r.format,
        r.label,
        r.system,
        r.administration,
        r.total_satellites,
        r.as_of,
        r.regime,
        r.regulatory_period_end,
        SOURCE_TITLE,
        SOURCE_URL,
        SOURCE_FETCHED
    );
    s.push_str("plane group        notified  deployed  station-keeping  unknown  excess\n");
    for g in &r.plane_groups {
        s.push_str(&format!(
            "{:<18} {:>8}  {:>8}  {:>15}  {:>7}  {:>6}\n",
            g.id, g.notified, g.deployed, g.station_keeping, g.station_keeping_unknown, g.excess
        ));
    }
    s.push_str(&format!(
        "counted toward the total: {} deployed, {} station-keeping\n\n",
        r.deployed, r.station_keeping
    ));
    s.push_str(
        "milestone  provision     date        report due  %    required  state     shortfall\n",
    );
    for m in &r.milestones {
        s.push_str(&format!(
            "{:<9}  {:<12}  {}  {}  {:<3}  {:>8}  {:<8}  {:>9}\n",
            m.id, m.provision, m.date, m.report_due, m.percent, m.required, m.state, m.shortfall
        ));
    }
    let mut by: BTreeMap<&str, usize> = BTreeMap::new();
    for o in &r.objects {
        *by.entry(o.status).or_default() += 1;
    }
    s.push_str(&format!(
        "\nobjects: {}\n",
        by.iter()
            .map(|(k, v)| format!("{k}={v}"))
            .collect::<Vec<_>>()
            .join(" ")
    ));
    s.push_str(&format!("\n{}\n", r.disclaimer));
    s
}

/// `kshana itu-res35 milestones <filing.toml> [--json]` and
/// `kshana itu-res35 report <filing.toml> <elements|satcat> ... [--as-of <YYYY-MM-DD>] [--json]
/// [--out <file>]`. Exit 0 when no passed milestone is short at the as-of date, 1 when one is,
/// 2 on a usage or input error.
pub fn run_cli(args: &[String]) -> i32 {
    let usage = || {
        eprintln!("{}", crate::t!("itu-res35-usage"));
        2
    };
    let Some(sub) = args.first().map(String::as_str) else {
        return usage();
    };
    if matches!(sub, "--help" | "-h") {
        println!("{}", crate::t!("itu-res35-usage"));
        return 0;
    }
    let mut json = false;
    let mut as_of = None;
    let mut out = None;
    let mut files = Vec::new();
    let mut i = 1;
    while i < args.len() {
        match args[i].as_str() {
            "--json" => json = true,
            "--as-of" => match args.get(i + 1).and_then(|s| parse_date(s)) {
                Some(d) => {
                    as_of = Some(d);
                    i += 1;
                }
                None => return usage(),
            },
            "--out" => match args.get(i + 1) {
                Some(p) => {
                    out = Some(p.clone());
                    i += 1;
                }
                None => return usage(),
            },
            a if a.starts_with("--") => return usage(),
            a => files.push(a.to_string()),
        }
        i += 1;
    }
    let read = |p: &str| -> Result<Vec<u8>, i32> {
        std::fs::read(p).map_err(|e| {
            eprintln!(
                "{}",
                crate::terr!("e-itu-res35-cannot-read", path = p, e = e.to_string())
            );
            2
        })
    };
    let Some(filing) = files.first().cloned() else {
        return usage();
    };
    let fb = match read(&filing) {
        Ok(b) => b,
        Err(c) => return c,
    };
    match sub {
        "milestones" if files.len() == 1 => match parse_filing(&String::from_utf8_lossy(&fb)) {
            Ok(f) => {
                let (regime, ms) = milestones(&f);
                if json {
                    let v = serde_json::json!({
                        "format": "kshana.itu-res35-milestones/1",
                        "label": "MODELLED",
                        "source": {"title": SOURCE_TITLE, "url": SOURCE_URL, "fetched": SOURCE_FETCHED},
                        "system": f.system,
                        "regime": regime,
                        "total_satellites": total_satellites(&f),
                        "milestones": ms.iter().map(|m| serde_json::json!({
                            "id": m.id, "provision": m.provision, "date": m.date,
                            "report_due": m.report_due, "modification_due": m.modification_due,
                            "percent": m.percent, "required": m.required,
                        })).collect::<Vec<_>>(),
                    });
                    println!("{}", serde_json::to_string_pretty(&v).unwrap_or_default());
                } else {
                    println!(
                        "{}",
                        crate::t!(
                            "itu-res35-milestones-head",
                            system = f.system.clone(),
                            n = total_satellites(&f),
                            regime = regime,
                            url = SOURCE_URL,
                            fetched = SOURCE_FETCHED
                        )
                    );
                    for m in &ms {
                        println!(
                            "{}",
                            crate::t!(
                                "itu-res35-milestone-line",
                                id = m.id,
                                provision = m.provision,
                                date = m.date.clone(),
                                percent = m.percent,
                                required = m.required,
                                due = m.report_due.clone(),
                                modify = m.modification_due.clone()
                            )
                        );
                    }
                }
                0
            }
            Err(e) => {
                eprintln!(
                    "{}",
                    crate::terr!("e-itu-res35-bad-input", path = filing, e = e)
                );
                2
            }
        },
        "report" if files.len() >= 2 => {
            let mut inputs = Vec::new();
            for p in &files[1..] {
                match read(p) {
                    Ok(b) => inputs.push((p.clone(), b)),
                    Err(c) => return c,
                }
            }
            let r = match evaluate(&filing, &fb, &inputs, as_of) {
                Ok(r) => r,
                Err(e) => {
                    eprintln!(
                        "{}",
                        crate::terr!("e-itu-res35-bad-input", path = filing, e = e)
                    );
                    return 2;
                }
            };
            let body = if json || out.is_some() {
                serde_json::to_string_pretty(&r).unwrap_or_default() + "\n"
            } else {
                text(&r)
            };
            match &out {
                Some(p) => {
                    if let Err(e) = std::fs::write(p, body.as_bytes()) {
                        eprintln!(
                            "{}",
                            crate::terr!("e-itu-res35-cannot-write", path = p, e = e.to_string())
                        );
                        return 2;
                    }
                    if !json {
                        print!("{}", text(&r));
                    }
                }
                None => print!("{body}"),
            }
            i32::from(
                r.milestones
                    .iter()
                    .any(|m| m.state == "passed" && !m.met_at_as_of),
            )
        }
        _ => usage(),
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn years_and_leap_days() {
        let d = parse_date("2024-02-29").unwrap();
        assert_eq!(date_of(add_years(d, 2)), "2026-02-28");
        assert_eq!(date_of(add_years(d, 4)), "2028-02-29");
        assert!(parse_date("2025-02-29").is_none());
    }

    #[test]
    fn epochs() {
        assert_eq!(parse_epoch("1970-01-02T12:00:00"), Some(1.5));
        assert_eq!(parse_epoch("1970-002T12:00:00.000000"), Some(1.5));
    }
}
