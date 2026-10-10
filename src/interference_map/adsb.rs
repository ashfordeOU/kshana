// SPDX-License-Identifier: AGPL-3.0-only
//! ADS-B method: navigation-accuracy fields (NIC, NACp) aggregated per grid cell per day.
//!
//! See `docs/INTERFERENCE-MAP.md` for the full statement. In short, a cell is *degraded* on
//! a day when the share of **distinct aircraft** (not reports) that were mostly
//! low-accuracy inside the cell reaches a stated threshold over a stated minimum sample,
//! after guards that remove the common non-interference causes of low accuracy.

use std::collections::{BTreeMap, HashMap};

use serde_json::{json, Map, Value};

use super::grid::{CellId, Grid};
use super::output::{CellOut, DayOut};
use super::time::{day_of, parse_timestamp};
use super::{stream_csv, IdHasher, MapError, PUBLICATION_MIN_DISTINCT};

/// Identifier of the ADS-B method version, written into every ADS-B output file.
pub const METHOD_ID: &str = "kshana-interference-map/adsb/v2";

/// Pre-registered parameters. Fixed from the definitions of the NIC and NACp codes and from
/// the privacy rule, before any data was examined; see the doc for the reasoning.
#[derive(Debug, Clone, PartialEq)]
pub struct AdsbParams {
    /// Reports below this barometric altitude (feet) are ignored: low and surface reports
    /// have legitimate accuracy loss (terrain masking, surface position format).
    pub min_alt_ft: f64,
    /// A report is low-accuracy if NACp is at or below this (the reported EPU bound is 556 m or larger, or unknown).
    pub low_nacp_max: u8,
    /// ... or if NIC is at or below this (the reported containment-radius bound is 1852 m or larger, or unknown).
    pub low_nic_max: u8,
    /// A report is "good" (evidence the aircraft's own equipment can report accuracy) if
    /// NACp is at or above this ...
    pub good_nacp_min: u8,
    /// ... and NIC is at or above this.
    pub good_nic_min: u8,
    /// An aircraft counts toward a cell only if it also sent this many good reports outside
    /// that cell the same day (equipment baseline guard).
    pub min_baseline_good: u32,
    /// Minimum in-cell reports for an aircraft to be sampled in a cell.
    pub min_reports_per_aircraft: u32,
    /// An aircraft is affected in a cell if at least this share of its in-cell reports is low.
    pub affected_report_share: f64,
    /// Minimum sampled aircraft in a cell for a degraded/not-degraded call.
    pub min_aircraft: usize,
    /// A cell is degraded only if at least this many aircraft are affected, so a call never
    /// rests on fewer aircraft than the publication minimum.
    pub min_affected_aircraft: usize,
    /// A cell is degraded when the affected share of sampled aircraft is at least this.
    pub degraded_share: f64,
    /// ... and exceeds the day's background (median cell share) by at least this margin.
    pub background_margin: f64,
    /// If the day's background itself is at least this, the day is confounded (regional or
    /// global cause) and no cell is declared degraded.
    pub day_confound_background: f64,
    /// The background is evaluated only over at least this many sampled cells.
    pub min_cells_for_background: usize,
}

impl AdsbParams {
    /// The pre-registered version 2 parameters. Changing a value means a new method version.
    pub const PREREGISTERED_V1: AdsbParams = AdsbParams {
        min_alt_ft: 5000.0,
        low_nacp_max: 6,
        low_nic_max: 5,
        good_nacp_min: 8,
        good_nic_min: 7,
        min_baseline_good: 5,
        min_reports_per_aircraft: 3,
        affected_report_share: 0.5,
        min_aircraft: 10,
        min_affected_aircraft: PUBLICATION_MIN_DISTINCT,
        degraded_share: 0.30,
        background_margin: 0.15,
        day_confound_background: 0.15,
        min_cells_for_background: 5,
    };

    /// The parameters as the JSON object embedded in output files.
    pub fn to_json(&self) -> Value {
        json!({
            "min_alt_ft": self.min_alt_ft,
            "low_nacp_max": self.low_nacp_max,
            "low_nic_max": self.low_nic_max,
            "good_nacp_min": self.good_nacp_min,
            "good_nic_min": self.good_nic_min,
            "min_baseline_good_reports": self.min_baseline_good,
            "min_reports_per_aircraft_in_cell": self.min_reports_per_aircraft,
            "affected_report_share": self.affected_report_share,
            "min_aircraft_sampled": self.min_aircraft,
            "min_affected_aircraft": self.min_affected_aircraft,
            "degraded_share": self.degraded_share,
            "background_margin": self.background_margin,
            "day_confound_background": self.day_confound_background,
            "min_cells_for_background": self.min_cells_for_background,
            "publication_min_distinct": PUBLICATION_MIN_DISTINCT,
        })
    }
}

impl AdsbParams {
    /// Classify one report from its accuracy codes: `(low, good)`.
    ///
    /// *Low* when NACp is at or below `low_nacp_max` or NIC is at or below `low_nic_max`
    /// (judged on whichever field is present). *Good* when every present field is at or above
    /// its `good_*_min`, with at least one present: an input with only one of the two columns
    /// still establishes an equipment baseline.
    pub fn classify(&self, nic: Option<u8>, nacp: Option<u8>) -> (bool, bool) {
        let low = nacp.is_some_and(|v| v <= self.low_nacp_max)
            || nic.is_some_and(|v| v <= self.low_nic_max);
        let good = (nacp.is_some() || nic.is_some())
            && nacp.is_none_or(|v| v >= self.good_nacp_min)
            && nic.is_none_or(|v| v >= self.good_nic_min);
        (low, good)
    }
}

/// The 95% horizontal position accuracy bound (EPU, metres) that a NACp code stands for:
/// the true position is within this distance with 95% probability. `None` for code 0 (the
/// bound is 10 NM or worse, or unknown) and for codes above 11. Values are the DO-260B
/// table in metres (0.05 NM is 92.6 m, 0.1 NM is 185.2 m, 0.3 NM is 555.6 m, and so on).
pub fn nacp_epu_bound_m(code: u8) -> Option<f64> {
    match code {
        1 => Some(18_520.0),
        2 => Some(7_408.0),
        3 => Some(3_704.0),
        4 => Some(1_852.0),
        5 => Some(926.0),
        6 => Some(555.6),
        7 => Some(185.2),
        8 => Some(92.6),
        9 => Some(30.0),
        10 => Some(10.0),
        11 => Some(3.0),
        _ => None,
    }
}

/// The horizontal containment radius bound (Rc, metres) that a NIC code stands for, as
/// `(smallest, largest)` over the ADS-B versions and supplement bits that can produce the
/// code: NIC 6, for example, stands for 0.3 NM (555.6 m) or 0.6 NM (1111.2 m) depending on
/// the supplement. `None` for code 0 (unknown or 20 NM or worse) and for codes above 11.
/// Values are the DO-260B table in metres.
pub fn nic_rc_bound_range_m(code: u8) -> Option<(f64, f64)> {
    match code {
        1 => Some((37_040.0, 37_040.0)),
        2 => Some((14_816.0, 14_816.0)),
        3 => Some((7_408.0, 7_408.0)),
        4 => Some((3_704.0, 3_704.0)),
        5 => Some((1_852.0, 1_852.0)),
        6 => Some((555.6, 1_111.2)),
        7 => Some((370.4, 370.4)),
        8 => Some((185.2, 185.2)),
        9 => Some((75.0, 75.0)),
        10 => Some((25.0, 25.0)),
        11 => Some((7.5, 7.5)),
        _ => None,
    }
}

#[derive(Default, Clone, Copy)]
struct PairAcc {
    n: u32,
    low: u32,
    good: u32,
}

#[derive(Default)]
struct DayAcc {
    pairs: HashMap<(u64, CellId), PairAcc>,
    good_total: HashMap<u64, u32>,
}

/// Counters for rows that were read but not used, written into the output metadata.
#[derive(Debug, Default, Clone, PartialEq)]
pub struct AdsbReadStats {
    /// Rows read (CSV rows or trace entries).
    pub rows: u64,
    /// Rows that passed every exclusion and were aggregated.
    pub used: u64,
    /// Rows with an unparseable time, position or identifier.
    pub rejected_malformed: u64,
    /// Rows on the ground, without an altitude, or below the altitude floor.
    pub excluded_ground_or_low: u64,
    /// Rows whose source is not ADS-B (for example multilateration).
    pub excluded_non_adsb_source: u64,
    /// Rows carrying neither NIC nor NACp.
    pub excluded_no_accuracy_field: u64,
    /// readsb trace files read, and files that could not be parsed or decompressed.
    pub trace_files: u64,
    /// readsb trace files that could not be decompressed or parsed.
    pub trace_files_unreadable: u64,
}

/// Aggregation state across one input (which may span several UTC days).
pub struct AdsbAggregator {
    grid: Grid,
    params: AdsbParams,
    hasher: IdHasher,
    days: BTreeMap<String, DayAcc>,
    /// Counters for rows read and excluded so far.
    pub stats: AdsbReadStats,
}

fn parse_u8_field(s: &str) -> Option<u8> {
    let s = s.trim();
    if s.is_empty() {
        None
    } else {
        s.parse::<u8>().ok().filter(|v| *v <= 11)
    }
}

impl AdsbAggregator {
    /// An empty aggregator for the given grid, parameters and identifier hasher.
    pub fn new(grid: Grid, params: AdsbParams, hasher: IdHasher) -> Self {
        Self {
            grid,
            params,
            hasher,
            days: BTreeMap::new(),
            stats: AdsbReadStats::default(),
        }
    }

    /// Read the documented CSV from text; see [`AdsbAggregator::read_csv_reader`].
    pub fn read_csv(&mut self, text: &str) -> Result<(), MapError> {
        self.read_csv_reader(text.as_bytes())
    }

    /// Read the documented CSV row by row (the input is never held whole in memory):
    /// required columns `timestamp, aircraft_id, lat, lon, alt_baro_ft`; at least one of
    /// `nic`, `nacp`; optional `source_type`.
    pub fn read_csv_reader<R: std::io::BufRead>(&mut self, reader: R) -> Result<(), MapError> {
        struct Cols {
            t: usize,
            id: usize,
            lat: usize,
            lon: usize,
            alt: usize,
            nic: Option<usize>,
            nacp: Option<usize>,
            src: Option<usize>,
        }
        stream_csv(
            reader,
            |h| {
                let c = Cols {
                    t: h.require("timestamp")?,
                    id: h.require("aircraft_id")?,
                    lat: h.require("lat")?,
                    lon: h.require("lon")?,
                    alt: h.require("alt_baro_ft")?,
                    nic: h.col("nic"),
                    nacp: h.col("nacp"),
                    src: h.col("source_type"),
                };
                if c.nic.is_none() && c.nacp.is_none() {
                    return Err(MapError::Format(
                        "need at least one of columns `nic`, `nacp`".into(),
                    ));
                }
                Ok(c)
            },
            |c, row| {
                let get = |k: usize| row.get(k).copied().unwrap_or("");
                self.add_row(
                    parse_timestamp(get(c.t)),
                    get(c.id),
                    get(c.lat).parse::<f64>().ok(),
                    get(c.lon).parse::<f64>().ok(),
                    get(c.alt).parse::<f64>().ok(),
                    (
                        c.nic.and_then(|k| parse_u8_field(get(k))),
                        c.nacp.and_then(|k| parse_u8_field(get(k))),
                    ),
                    c.src.map(get),
                );
            },
        )
    }

    /// One input row, from either format: applies the exclusions, counts them, and adds
    /// the report to the day's aggregates.
    #[allow(clippy::too_many_arguments)]
    fn add_row(
        &mut self,
        ts: Option<f64>,
        id: &str,
        lat: Option<f64>,
        lon: Option<f64>,
        alt_ft: Option<f64>,
        (nic, nacp): (Option<u8>, Option<u8>),
        source_type: Option<&str>,
    ) {
        self.stats.rows += 1;
        if source_type.is_some_and(|s| !s.to_ascii_lowercase().starts_with("adsb")) {
            self.stats.excluded_non_adsb_source += 1;
            return;
        }
        let (Some(ts), Some(lat), Some(lon)) = (ts, lat, lon) else {
            self.stats.rejected_malformed += 1;
            return;
        };
        if id.is_empty() || !(-90.0..=90.0).contains(&lat) || !(-180.0..=180.0).contains(&lon) {
            self.stats.rejected_malformed += 1;
            return;
        }
        // "ground" or a missing altitude cannot be shown to be airborne above the floor.
        match alt_ft.filter(|a| a.is_finite()) {
            Some(a) if a >= self.params.min_alt_ft => {}
            _ => {
                self.stats.excluded_ground_or_low += 1;
                return;
            }
        }
        if nic.is_none() && nacp.is_none() {
            self.stats.excluded_no_accuracy_field += 1;
            return;
        }
        self.add_report(ts, id, lat, lon, nic, nacp);
    }

    /// Read one readsb history trace file (`trace_full_<address>.json`, as in the adsb.lol
    /// daily archives after extraction): gzip-compressed or plain JSON. Detected by the gzip
    /// magic bytes, not the file name, because readsb writes gzip under a `.json` name.
    /// Decompression stops at `max_decompressed` bytes.
    pub fn read_readsb_trace(
        &mut self,
        bytes: &[u8],
        max_decompressed: u64,
    ) -> Result<(), MapError> {
        use std::io::Read;
        let text: Vec<u8> = if bytes.starts_with(&[0x1f, 0x8b]) {
            let mut out = Vec::new();
            flate2::read::GzDecoder::new(bytes)
                .take(max_decompressed + 1)
                .read_to_end(&mut out)
                .map_err(|e| MapError::Format(format!("gzip: {e}")))?;
            if out.len() as u64 > max_decompressed {
                return Err(MapError::Format(
                    "gzip: decompressed size over the limit".into(),
                ));
            }
            out
        } else {
            bytes.to_vec()
        };
        let v: Value = serde_json::from_slice(&text)
            .map_err(|e| MapError::Format(format!("trace JSON: {e}")))?;
        let id = v
            .get("icao")
            .and_then(Value::as_str)
            .filter(|s| !s.is_empty());
        let base = v.get("timestamp").and_then(Value::as_f64);
        let (Some(id), Some(base), Some(trace)) =
            (id, base, v.get("trace").and_then(Value::as_array))
        else {
            return Err(MapError::Format(
                "trace JSON lacks icao, timestamp or trace".into(),
            ));
        };
        for e in trace {
            let Some(e) = e.as_array() else {
                self.stats.rows += 1;
                self.stats.rejected_malformed += 1;
                continue;
            };
            let f = |k: usize| e.get(k).and_then(Value::as_f64);
            let field = |name: &str| {
                e.get(8)
                    .and_then(|d| d.get(name))
                    .and_then(Value::as_u64)
                    .and_then(|n| u8::try_from(n).ok())
                    .filter(|n| *n <= 11)
            };
            self.add_row(
                f(0).map(|o| base + o),
                id,
                f(1),
                f(2),
                f(3),
                (field("nic"), field("nac_p")),
                e.get(9).and_then(Value::as_str),
            );
        }
        self.stats.trace_files += 1;
        Ok(())
    }

    fn add_report(
        &mut self,
        ts: f64,
        id: &str,
        lat: f64,
        lon: f64,
        nic: Option<u8>,
        nacp: Option<u8>,
    ) {
        let (low, good) = self.params.classify(nic, nacp);
        let aid = self.hasher.hash(id);
        let cell = self.grid.cell_of(lat, lon);
        let day = self.days.entry(day_of(ts)).or_default();
        let e = day.pairs.entry((aid, cell)).or_default();
        e.n += 1;
        e.low += u32::from(low);
        e.good += u32::from(good);
        if good {
            *day.good_total.entry(aid).or_default() += 1;
        }
        self.stats.used += 1;
    }

    /// Evaluate every day seen.
    pub fn finish(self) -> Vec<DayOut> {
        let AdsbAggregator {
            grid: _,
            params,
            days,
            ..
        } = self;
        days.into_iter()
            .map(|(date, acc)| evaluate_day(&params, date, acc))
            .collect()
    }
}

struct CellStat {
    observed: usize,
    sampled: usize,
    affected: usize,
}

fn evaluate_day(p: &AdsbParams, date: String, acc: DayAcc) -> DayOut {
    let mut cells: BTreeMap<CellId, CellStat> = BTreeMap::new();
    for ((aid, cell), pa) in &acc.pairs {
        let st = cells.entry(*cell).or_insert(CellStat {
            observed: 0,
            sampled: 0,
            affected: 0,
        });
        st.observed += 1;
        let total_good = acc.good_total.get(aid).copied().unwrap_or(0);
        let baseline = total_good.saturating_sub(pa.good);
        if pa.n >= p.min_reports_per_aircraft && baseline >= p.min_baseline_good {
            st.sampled += 1;
            if f64::from(pa.low) / f64::from(pa.n) >= p.affected_report_share {
                st.affected += 1;
            }
        }
    }
    // Background: median share over cells with a full sample.
    let mut shares: Vec<f64> = cells
        .values()
        .filter(|s| s.sampled >= p.min_aircraft)
        .map(|s| s.affected as f64 / s.sampled as f64)
        .collect();
    shares.sort_by(f64::total_cmp);
    let background_evaluated = shares.len() >= p.min_cells_for_background;
    let background = if background_evaluated {
        shares[shares.len() / 2]
    } else {
        f64::NAN
    };
    let day_confounded = background_evaluated && background >= p.day_confound_background;

    let mut out = Vec::new();
    for (id, s) in &cells {
        if s.observed < PUBLICATION_MIN_DISTINCT {
            continue; // suppressed: could single out an aircraft
        }
        let share = if s.sampled > 0 {
            s.affected as f64 / s.sampled as f64
        } else {
            0.0
        };
        let meets = s.sampled >= p.min_aircraft
            && share >= p.degraded_share
            && s.affected >= p.min_affected_aircraft;
        let (status, degraded) = if s.sampled < p.min_aircraft {
            ("insufficient_sample", false)
        } else if !meets {
            ("not_degraded", false)
        } else if !background_evaluated {
            // Too few fully sampled cells to know the day's background: no call either way.
            ("withheld_no_background", false)
        } else if share - background < p.background_margin {
            ("not_degraded", false)
        } else if day_confounded {
            ("withheld_day_confounded", false)
        } else {
            ("degraded", true)
        };
        // Every count below the publication minimum is withheld (null), zero included, so a
        // null never reads as "none" and no published number can single out an aircraft.
        let count = |n: usize| {
            if n >= PUBLICATION_MIN_DISTINCT {
                json!(n)
            } else {
                Value::Null
            }
        };
        let mut props = Map::new();
        props.insert("aircraft_observed".into(), count(s.observed));
        props.insert("aircraft_sampled".into(), count(s.sampled));
        props.insert("aircraft_affected".into(), count(s.affected));
        // The share would reveal a withheld affected count, so it needs both counts.
        let share_out =
            if s.sampled >= PUBLICATION_MIN_DISTINCT && s.affected >= PUBLICATION_MIN_DISTINCT {
                json!(round4(share))
            } else {
                Value::Null
            };
        props.insert("affected_share".into(), share_out);
        out.push(CellOut {
            id: *id,
            status: status.into(),
            degraded,
            props,
        });
    }
    let mut meta = Map::new();
    meta.insert("background_evaluated".into(), json!(background_evaluated));
    meta.insert(
        "background_share".into(),
        if background_evaluated {
            json!(round4(background))
        } else {
            Value::Null
        },
    );
    meta.insert("day_confounded".into(), json!(day_confounded));
    meta.insert("cells_published".into(), json!(out.len()));
    meta.insert(
        "cells_suppressed_below_min_distinct".into(),
        json!(cells.len() - out.len()),
    );
    DayOut {
        source_kind: "adsb",
        date,
        cells: out,
        day_meta: meta,
    }
}

pub(crate) fn round4(x: f64) -> f64 {
    (x * 1e4).round() / 1e4
}

/// Method metadata embedded in every ADS-B output file.
pub fn method_json(p: &AdsbParams, stats: &AdsbReadStats) -> Value {
    json!({
        "id": METHOD_ID,
        "summary": "Share of distinct aircraft whose NIC/NACp reports are low-accuracy within a fixed grid cell, per UTC day.",
        "parameters": p.to_json(),
        "guards": [
            "airborne reports above the altitude floor only",
            "distinct aircraft are counted, not reports, so one aircraft cannot dominate a cell",
            "an aircraft counts only if it sent good-accuracy reports elsewhere the same day (excludes equipment that never reports accuracy)",
            "the cell share must exceed the day's median cell share by a margin",
            "a day whose median cell share is itself high is marked confounded and no cell is declared degraded",
            "a cell is declared degraded only if at least the publication minimum of aircraft are affected",
            "when too few cells are fully sampled to estimate the day's background, no cell is declared degraded",
            "every per-cell count below the publication minimum is withheld, zero included",
            "cells with fewer than the minimum distinct aircraft are not published",
        ],
        "input_stats": {
            "rows": stats.rows,
            "used": stats.used,
            "rejected_malformed": stats.rejected_malformed,
            "excluded_ground_or_below_altitude_floor": stats.excluded_ground_or_low,
            "excluded_non_adsb_source": stats.excluded_non_adsb_source,
            "excluded_no_accuracy_field": stats.excluded_no_accuracy_field,
            "trace_files": stats.trace_files,
            "trace_files_unreadable": stats.trace_files_unreadable,
        },
        "caveats": [
            "A degraded cell means a high share of aircraft reported low navigation accuracy there that day. It does not identify interference as the cause.",
            "Other causes include satellite constellation or augmentation outages, space-weather effects, and receiver or transponder faults.",
            "Conservative by construction: aircraft that fly only inside an affected region all day have no baseline and are not counted.",
            "Cells with no published entry were not observed by enough aircraft, which is not the same as clear.",
        ],
    })
}

#[cfg(test)]
mod tests {
    use super::*;

    fn agg() -> AdsbAggregator {
        AdsbAggregator::new(
            Grid::new(0.5).unwrap(),
            AdsbParams::PREREGISTERED_V1,
            IdHasher::with_salt([1; 16]),
        )
    }

    /// One synthetic aircraft: `good_elsewhere` good reports far away, then `n` reports in
    /// the cell at (lat, lon) with the given NACp.
    fn fly(csv: &mut String, id: &str, at: (f64, f64), n: u32, acc: (u8, u8), good_elsewhere: u32) {
        let (lat, lon) = at;
        let (nacp, nic) = acc;
        for k in 0..good_elsewhere {
            csv.push_str(&format!(
                "2026-03-01T10:{:02}:00Z,{id},10.1,10.1,30000,11,10\n",
                k % 60
            ));
        }
        for k in 0..n {
            csv.push_str(&format!(
                "2026-03-01T11:{:02}:00Z,{id},{lat},{lon},30000,{nacp},{nic}\n",
                k % 60
            ));
        }
    }

    const HDR: &str = "timestamp,aircraft_id,lat,lon,alt_baro_ft,nacp,nic\n";

    #[test]
    fn affected_cell_is_degraded_clean_cells_are_not() {
        let mut csv = HDR.to_string();
        // Eight cells, each with 12 aircraft. The cell at (50.2, 20.2) has 6 of 12 affected
        // aircraft; the rest have none.
        for cell in 0..8 {
            let lat = 40.2 + cell as f64;
            for a in 0..12 {
                let hit = cell == 2 && a < 6;
                let (nacp, nic) = if hit { (0, 0) } else { (10, 9) };
                fly(
                    &mut csv,
                    &format!("a{cell}-{a}"),
                    (lat, 20.2),
                    6,
                    (nacp, nic),
                    6,
                );
            }
        }
        let mut g = agg();
        g.read_csv(&csv).unwrap();
        let days = g.finish();
        assert_eq!(days.len(), 1);
        let day = &days[0];
        assert_eq!(day.date, "2026-03-01");
        // Plus one cell (10.1, 10.1) holding every aircraft's "elsewhere" reports.
        let degraded: Vec<_> = day.cells.iter().filter(|c| c.degraded).collect();
        assert_eq!(
            degraded.len(),
            1,
            "{:?}",
            day.cells
                .iter()
                .map(|c| (&c.status, c.id))
                .collect::<Vec<_>>()
        );
        assert_eq!(degraded[0].props["aircraft_affected"], 6);
        assert_eq!(day.day_meta["day_confounded"], false);
    }

    #[test]
    fn equipment_without_baseline_is_not_counted() {
        // 12 aircraft that never send a good report anywhere (legacy equipment) fly through
        // one cell with NACp 0 all day: no baseline, so the cell has no sample and cannot
        // be called degraded.
        let mut csv = HDR.to_string();
        for a in 0..12 {
            fly(&mut csv, &format!("legacy{a}"), (45.2, 15.2), 8, (0, 0), 0);
        }
        let mut g = agg();
        g.read_csv(&csv).unwrap();
        let day = &g.finish()[0];
        let c = day
            .cells
            .iter()
            .find(|c| c.props["aircraft_observed"] == 12)
            .unwrap();
        assert_eq!(c.status, "insufficient_sample");
        assert!(!c.degraded);
    }

    #[test]
    fn small_cells_are_suppressed() {
        let mut csv = HDR.to_string();
        for a in 0..(PUBLICATION_MIN_DISTINCT - 1) {
            fly(&mut csv, &format!("s{a}"), (33.2, 33.2), 6, (0, 0), 6);
        }
        let mut g = agg();
        g.read_csv(&csv).unwrap();
        let day = &g.finish()[0];
        assert!(
            day.cells.is_empty(),
            "no cell may be published below the minimum"
        );
    }

    /// `n` aircraft in the cell at (lat, 20.2), the first `hit` of them affected.
    fn cell_of_aircraft(csv: &mut String, tag: &str, lat: f64, n: usize, hit: usize) {
        for a in 0..n {
            let acc = if a < hit { (0, 0) } else { (10, 9) };
            fly(csv, &format!("{tag}{a}"), (lat, 20.2), 6, acc, 6);
        }
    }

    #[test]
    fn counts_below_the_minimum_are_withheld_even_when_the_cell_is_published() {
        // 5 aircraft observed, but only one has a baseline and is affected: the cell is
        // published, its counts are not.
        let mut csv = HDR.to_string();
        fly(&mut csv, "one", (33.2, 33.2), 6, (0, 0), 6);
        for a in 0..4 {
            fly(&mut csv, &format!("nobase{a}"), (33.2, 33.2), 6, (0, 0), 0);
        }
        let mut g = agg();
        g.read_csv(&csv).unwrap();
        let day = &g.finish()[0];
        let cell = day
            .cells
            .iter()
            .find(|c| c.props["aircraft_observed"] == 5)
            .unwrap();
        assert!(cell.props["aircraft_sampled"].is_null());
        assert!(cell.props["aircraft_affected"].is_null());
        assert!(
            cell.props["affected_share"].is_null(),
            "a share would reveal the affected count"
        );
        assert_eq!(cell.status, "insufficient_sample");
    }

    #[test]
    fn a_degraded_call_needs_the_publication_minimum_of_affected_aircraft() {
        // Six background cells of 12 clean aircraft; one cell with 4 of 12 affected (33%,
        // over the 30% share, but under 5 aircraft).
        let mut csv = HDR.to_string();
        for cell in 0..6 {
            cell_of_aircraft(&mut csv, &format!("c{cell}-"), 40.2 + cell as f64, 12, 0);
        }
        cell_of_aircraft(&mut csv, "t-", 47.2, 12, 4);
        let mut g = agg();
        g.read_csv(&csv).unwrap();
        let day = &g.finish()[0];
        let t = day
            .cells
            .iter()
            .find(|c| c.props["aircraft_sampled"] == 12 && c.props["aircraft_affected"].is_null())
            .unwrap();
        assert_eq!(t.status, "not_degraded");
        assert!(!t.degraded);
        // With 5 affected the same cell is degraded and its counts are published.
        let mut csv = HDR.to_string();
        for cell in 0..6 {
            cell_of_aircraft(&mut csv, &format!("c{cell}-"), 40.2 + cell as f64, 12, 0);
        }
        cell_of_aircraft(&mut csv, "t-", 47.2, 12, 5);
        let mut g = agg();
        g.read_csv(&csv).unwrap();
        let day = &g.finish()[0];
        let t = day.cells.iter().find(|c| c.degraded).unwrap();
        assert_eq!(t.props["aircraft_affected"], 5);
    }

    #[test]
    fn too_few_sampled_cells_withhold_the_call_instead_of_skipping_the_background_check() {
        // Only two cells have a full sample, so the day's background cannot be estimated.
        let mut csv = HDR.to_string();
        cell_of_aircraft(&mut csv, "a-", 40.2, 12, 0);
        cell_of_aircraft(&mut csv, "b-", 41.2, 12, 8);
        let mut g = agg();
        g.read_csv(&csv).unwrap();
        let day = &g.finish()[0];
        assert_eq!(day.day_meta["background_evaluated"], false);
        let b = day
            .cells
            .iter()
            .find(|c| c.props["aircraft_affected"] == 8)
            .unwrap();
        assert_eq!(b.status, "withheld_no_background");
        assert!(day.cells.iter().all(|c| !c.degraded));
    }

    #[test]
    fn an_input_with_only_one_accuracy_column_still_works() {
        for col in ["nic", "nacp"] {
            let mut csv = format!("timestamp,aircraft_id,lat,lon,alt_baro_ft,{col}\n");
            for cell in 0..6 {
                for a in 0..12 {
                    let id = format!("o{cell}x{a}");
                    for k in 0..6 {
                        csv.push_str(&format!("2026-03-01T09:0{k}:00Z,{id},10.1,10.1,30000,11\n"));
                    }
                    let v = if cell == 2 && a < 7 { 0 } else { 10 };
                    for k in 0..4 {
                        csv.push_str(&format!(
                            "2026-03-01T10:0{k}:00Z,{id},{},20.2,30000,{v}\n",
                            40.2 + cell as f64
                        ));
                    }
                }
            }
            let mut g = agg();
            g.read_csv(&csv).unwrap();
            let day = &g.finish()[0];
            assert_eq!(day.cells.iter().filter(|c| c.degraded).count(), 1, "{col}");
        }
    }

    #[test]
    fn global_background_confounds_the_day() {
        // Every cell has 40% affected aircraft: that is the day's background, not a local event.
        let mut csv = HDR.to_string();
        for cell in 0..6 {
            for a in 0..10 {
                let hit = a < 4;
                let (nacp, nic) = if hit { (0, 0) } else { (10, 9) };
                fly(
                    &mut csv,
                    &format!("c{cell}-{a}"),
                    (40.2 + cell as f64, 20.2),
                    6,
                    (nacp, nic),
                    6,
                );
            }
        }
        let mut g = agg();
        g.read_csv(&csv).unwrap();
        let day = &g.finish()[0];
        assert_eq!(day.day_meta["day_confounded"], true);
        assert!(day.cells.iter().all(|c| !c.degraded));
    }

    #[test]
    fn low_and_ground_and_non_adsb_rows_are_excluded_and_counted() {
        let mut g = agg();
        let csv = "timestamp,aircraft_id,lat,lon,alt_baro_ft,nacp,nic,source_type\n\
                   2026-03-01T10:00:00Z,x,10,10,1000,10,9,adsb_icao\n\
                   2026-03-01T10:00:00Z,x,10,10,ground,10,9,adsb_icao\n\
                   2026-03-01T10:00:00Z,x,10,10,30000,10,9,mlat\n\
                   2026-03-01T10:00:00Z,x,10,10,30000,,,adsb_icao\n\
                   not-a-time,x,10,10,30000,10,9,adsb_icao\n\
                   2026-03-01T10:00:00Z,x,10,10,30000,10,9,adsb_icao\n";
        g.read_csv(csv).unwrap();
        let s = g.stats.clone();
        assert_eq!(
            (
                s.rows,
                s.used,
                s.excluded_ground_or_low,
                s.excluded_non_adsb_source,
                s.excluded_no_accuracy_field,
                s.rejected_malformed
            ),
            (6, 1, 2, 1, 1, 1)
        );
    }

    #[test]
    fn missing_columns_are_errors() {
        let mut g = agg();
        assert!(g
            .read_csv("timestamp,aircraft_id,lat,lon,alt_baro_ft\n")
            .is_err());
        assert!(g.read_csv("timestamp,lat,lon,alt_baro_ft,nic\n").is_err());
    }

    /// A synthetic readsb trace: `n` entries at 33000 ft, every one carrying nic/nac_p.
    fn trace_json(icao: &str, lat: f64, lon: f64, n: usize, nic: u8, nacp: u8) -> String {
        let entries: Vec<String> = (0..n)
            .map(|k| {
                format!(
                    "[{}, {lat}, {lon}, 33000, 450.0, 90.0, 0, 0, {{\"nic\": {nic}, \"nac_p\": {nacp}}}, \"adsb_icao\", 33100, null, null, null]",
                    k * 10
                )
            })
            .collect();
        format!(
            "{{\"icao\": \"{icao}\", \"timestamp\": 1772359200.0, \"trace\": [{}]}}",
            entries.join(",")
        )
    }

    fn gzip(text: &str) -> Vec<u8> {
        use std::io::Write;
        let mut e = flate2::write::GzEncoder::new(Vec::new(), flate2::Compression::fast());
        e.write_all(text.as_bytes()).unwrap();
        e.finish().unwrap()
    }

    #[test]
    fn readsb_trace_plain_and_gzip_agree() {
        let t = trace_json("abc123", 50.2, 12.2, 5, 9, 10);
        let (mut a, mut b) = (agg(), agg());
        a.read_readsb_trace(t.as_bytes(), 1 << 20).unwrap();
        b.read_readsb_trace(&gzip(&t), 1 << 20).unwrap();
        assert_eq!(a.stats, b.stats);
        assert_eq!((a.stats.used, a.stats.trace_files), (5, 1));
        // 1772359200 is 2026-03-01T10:00:00Z.
        let days = a.finish();
        assert_eq!(days[0].date, "2026-03-01");
        assert!(
            days[0].cells.is_empty(),
            "one aircraft is below the publication minimum"
        );
    }

    #[test]
    fn readsb_entries_are_filtered_like_csv_rows() {
        let t = r#"{"icao":"abc123","timestamp":1772359200.0,"trace":[
            [0, 50.2, 12.2, "ground", 10, 90, 0, 0, {"nic":9,"nac_p":10}, "adsb_icao"],
            [1, 50.2, 12.2, 1000, 10, 90, 0, 0, {"nic":9,"nac_p":10}, "adsb_icao"],
            [2, 50.2, 12.2, 33000, 10, 90, 0, 0, {"nic":9,"nac_p":10}, "mlat"],
            [3, 50.2, 12.2, 33000, 10, 90, 0, 0, null, "adsb_icao"],
            [4, 50.2, 12.2, 33000, 10, 90, 0, 0, {"nic":9,"nac_p":10}, "adsb_icao"],
            [5, 50.2, 12.2, 33000, 10, 90, 0, 0, {"nic":9,"nac_p":10}],
            "junk"
        ]}"#;
        let mut a = agg();
        a.read_readsb_trace(t.as_bytes(), 1 << 20).unwrap();
        let s = &a.stats;
        assert_eq!(
            (
                s.rows,
                s.used,
                s.excluded_ground_or_low,
                s.excluded_non_adsb_source,
                s.excluded_no_accuracy_field,
                s.rejected_malformed
            ),
            (7, 2, 2, 1, 1, 1)
        );
    }

    #[test]
    fn readsb_bad_input_is_an_error_and_size_is_bounded() {
        let mut a = agg();
        assert!(a.read_readsb_trace(b"not json", 1 << 20).is_err());
        assert!(a.read_readsb_trace(br#"{"icao":"x"}"#, 1 << 20).is_err());
        let t = trace_json("abc123", 50.2, 12.2, 50, 9, 10);
        assert!(
            a.read_readsb_trace(&gzip(&t), 100).is_err(),
            "over the decompression limit"
        );
        assert!(
            a.read_readsb_trace(&[0x1f, 0x8b, 0, 0], 1 << 20).is_err(),
            "truncated gzip"
        );
    }

    #[test]
    fn readsb_traces_produce_the_same_map_as_the_equivalent_csv() {
        // Seven cells, 12 aircraft each, cell 2 with 7 affected, as in the CSV tests.
        let (mut via_trace, mut via_csv) = (agg(), agg());
        let mut csv = String::from("timestamp,aircraft_id,lat,lon,alt_baro_ft,nic,nacp\n");
        for cell in 0..7 {
            let lon = 10.2 + 0.5 * cell as f64;
            for a in 0..12 {
                let id = format!("syn{cell}x{a}");
                let (nic, nacp) = if cell == 2 && a < 7 { (0, 0) } else { (9, 10) };
                via_trace
                    .read_readsb_trace(trace_json(&id, 40.1, 5.1, 6, 10, 11).as_bytes(), 1 << 20)
                    .unwrap();
                via_trace
                    .read_readsb_trace(&gzip(&trace_json(&id, 50.2, lon, 4, nic, nacp)), 1 << 20)
                    .unwrap();
                for k in 0..6 {
                    csv.push_str(&format!(
                        "{},{id},40.1,5.1,33000,10,11\n",
                        1_772_359_200 + k * 10
                    ));
                }
                for k in 0..4 {
                    csv.push_str(&format!(
                        "{},{id},50.2,{lon},33000,{nic},{nacp}\n",
                        1_772_359_200 + k * 10
                    ));
                }
            }
        }
        via_csv.read_csv(&csv).unwrap();
        let (a, b) = (via_trace.finish(), via_csv.finish());
        let key = |d: &DayOut| {
            d.cells
                .iter()
                .map(|c| (c.id, c.status.clone()))
                .collect::<Vec<_>>()
        };
        assert_eq!(key(&a[0]), key(&b[0]));
        assert_eq!(a[0].cells.iter().filter(|c| c.degraded).count(), 1);
    }

    #[test]
    fn preregistered_values_match_the_documentation() {
        let p = AdsbParams::PREREGISTERED_V1;
        assert_eq!(
            (
                p.low_nacp_max,
                p.low_nic_max,
                p.good_nacp_min,
                p.good_nic_min
            ),
            (6, 5, 8, 7)
        );
        assert_eq!(
            (
                p.min_aircraft,
                p.min_baseline_good,
                p.min_reports_per_aircraft
            ),
            (10, 5, 3)
        );
        assert_eq!(
            (
                p.degraded_share,
                p.background_margin,
                p.day_confound_background
            ),
            (0.30, 0.15, 0.15)
        );
        assert_eq!(p.min_alt_ft, 5000.0);
        assert_eq!(p.min_affected_aircraft, 5);
        assert_eq!(METHOD_ID, "kshana-interference-map/adsb/v2");
    }
}
