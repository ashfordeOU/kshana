// SPDX-License-Identifier: AGPL-3.0-only
//! **ADS-B interference indicators beyond the accuracy fields: update-rate collapse, track
//! consistency and exposed-flight denominators, per grid cell per day.** MODELLED.
//!
//! The interference map (`kshana interference-map adsb`, [`crate::interference_map::adsb`])
//! calls a cell degraded from the navigation-accuracy fields (NIC, NACp) of the aircraft that
//! *reported* there. Two things escape it: an aircraft whose receiver lost GNSS may stop sending
//! airborne positions altogether, so it is missing from both the numerator and the
//! denominator; and an aircraft fed a false position may keep high accuracy fields while its
//! track jumps. This module reads the same ADS-B CSV and states, per cell and UTC day:
//!
//! * **exposed aircraft** (the denominator): distinct aircraft that reported in the cell *or*
//!   crossed it during a reporting gap (the straight line between the last report before and
//!   the first after the gap, sampled every kilometre, without the two cells those reports are
//!   in);
//! * **update-rate collapse**: exposed aircraft that crossed the cell in a gap of more than
//!   [`Params::gap_s`] seconds although they normally report at least every
//!   [`Params::max_normal_interval_s`] seconds (their median interval), gaps longer than
//!   [`Params::max_gap_s`] being treated as leaving coverage;
//! * **track inconsistency**: exposed aircraft with a step between consecutive reports
//!   (at most [`Params::max_step_s`] apart) whose implied speed exceeds both twice the reported
//!   ground speed and the ground speed plus [`Params::speed_margin_kt`] (600 kt assumed when no
//!   speed is reported), over at least [`Params::min_jump_m`], counted in the cell of the
//!   later report;
//! * **low accuracy**, for comparison: reporting aircraft whose in-cell reports are mostly
//!   low-accuracy by the interference map's own pre-registered classification.
//!
//! Each count comes with its share of the exposed aircraft and a Wilson 95 % interval. A cell
//! is flagged `update_rate_collapse` or `track_inconsistency` when the share reaches the
//! pre-registered threshold over at least [`crate::interference_map::PUBLICATION_MIN_DISTINCT`]
//! aircraft. The document also states how far the indicators agree with the low-accuracy
//! share over the cells where both are known (rank correlation and a two-by-two table), and how
//! much the low-accuracy share changes when its denominator is the exposed rather than the
//! reporting aircraft.
//!
//! **Privacy and scope.** Identifiers are hashed in memory with a per-run salt and never
//! written; cells with fewer than the publication minimum of exposed aircraft are not
//! published, and a count below that minimum is written as `null`. A flag says the reports are
//! inconsistent with normal reporting; it names no cause and locates no emitter. Phantom-target
//! detection is not part of this module. The thresholds are fixed here (method
//! `kshana-adsb-indicators/v1`) and are tested on synthetic tracks only.

use crate::interference_map::adsb::{wilson95, AdsbParams};
use crate::interference_map::grid::{haversine_m, CellId, Grid};
use crate::interference_map::time::{day_of, parse_timestamp};
use crate::interference_map::{IdHasher, PUBLICATION_MIN_DISTINCT};
use serde_json::{json, Value};
use std::collections::{BTreeMap, BTreeSet, HashMap};

/// Method id written into every output.
pub const METHOD_ID: &str = "kshana-adsb-indicators/v1";
/// Schema id of the output document.
pub const SCHEMA: &str = "kshana.adsb-indicators/1";

/// Pre-registered parameters.
#[derive(Clone, Debug, PartialEq)]
pub struct Params {
    /// Reports below this barometric altitude (ft) are ignored (as in the map).
    pub min_alt_ft: f64,
    /// A gap longer than this (s) is a reporting gap.
    pub gap_s: f64,
    /// A gap longer than this (s) is treated as leaving coverage, not as a gap.
    pub max_gap_s: f64,
    /// An aircraft counts for update-rate collapse only if its median interval is at most this (s).
    pub max_normal_interval_s: f64,
    /// Consecutive reports at most this far apart (s) are checked for a jump.
    pub max_step_s: f64,
    /// Speed margin over the reported ground speed (kt).
    pub speed_margin_kt: f64,
    /// Smallest step (m) that can count as a jump.
    pub min_jump_m: f64,
    /// Share of exposed aircraft for an update-rate-collapse flag.
    pub gap_share_flag: f64,
    /// Share of exposed aircraft for a track-inconsistency flag.
    pub jump_share_flag: f64,
    /// Share of an aircraft's in-cell reports that must be low-accuracy for it to count.
    pub low_report_share: f64,
}

impl Params {
    pub const PREREGISTERED_V1: Params = Params {
        min_alt_ft: 5000.0,
        gap_s: 30.0,
        max_gap_s: 1800.0,
        max_normal_interval_s: 10.0,
        max_step_s: 60.0,
        speed_margin_kt: 200.0,
        min_jump_m: 2000.0,
        gap_share_flag: 0.3,
        jump_share_flag: 0.2,
        low_report_share: 0.5,
    };

    pub fn to_json(&self) -> Value {
        json!({
            "method": METHOD_ID,
            "min_alt_ft": self.min_alt_ft, "gap_s": self.gap_s, "max_gap_s": self.max_gap_s,
            "max_normal_interval_s": self.max_normal_interval_s, "max_step_s": self.max_step_s,
            "speed_margin_kt": self.speed_margin_kt, "min_jump_m": self.min_jump_m,
            "gap_share_flag": self.gap_share_flag, "jump_share_flag": self.jump_share_flag,
            "low_report_share": self.low_report_share,
            "publication_min_distinct": PUBLICATION_MIN_DISTINCT,
        })
    }
}

#[derive(Clone, Copy, Debug)]
struct Report {
    t: f64,
    lat: f64,
    lon: f64,
    gs_kt: Option<f64>,
    low: Option<bool>,
}

/// Input counts.
#[derive(Clone, Debug, Default, serde::Serialize)]
pub struct ReadStats {
    pub rows: u64,
    pub used: u64,
    pub below_min_alt: u64,
    pub bad_row: u64,
}

/// Errors reading the CSV.
#[derive(Clone, Debug, PartialEq)]
pub enum IndicatorError {
    /// A required column is missing (its name).
    MissingColumn(&'static str),
}

/// Reports per (UTC day, hashed aircraft), in time order.
type Tracks = BTreeMap<(String, u64), Vec<Report>>;

/// Read the ADS-B CSV (`timestamp, aircraft_id, lat, lon, alt_baro_ft`, optional `gs_kt`,
/// `nic`, `nacp`), grouping reports per hashed aircraft and UTC day.
fn read(text: &str, p: &Params, hasher: &IdHasher) -> Result<(Tracks, ReadStats), IndicatorError> {
    let mut lines = text.lines();
    let head: Vec<String> = lines
        .next()
        .unwrap_or("")
        .split(',')
        .map(|h| h.trim().to_ascii_lowercase())
        .collect();
    let col = |n: &str| head.iter().position(|h| h == n);
    let need = |n: &'static str| col(n).ok_or(IndicatorError::MissingColumn(n));
    let (ti, ii, la, lo, al) = (
        need("timestamp")?,
        need("aircraft_id")?,
        need("lat")?,
        need("lon")?,
        need("alt_baro_ft")?,
    );
    let (gi, ni, nai) = (col("gs_kt"), col("nic"), col("nacp"));
    let classify = AdsbParams::PREREGISTERED_V1;
    let mut st = ReadStats::default();
    let mut out: Tracks = BTreeMap::new();
    for l in lines {
        if l.trim().is_empty() {
            continue;
        }
        st.rows += 1;
        let c: Vec<&str> = l.split(',').map(str::trim).collect();
        let g = |k: usize| c.get(k).copied().unwrap_or("");
        let f = |k: usize| g(k).parse::<f64>().ok().filter(|v| v.is_finite());
        let (Some(t), Some(lat), Some(lon), Some(alt)) =
            (parse_timestamp(g(ti)), f(la), f(lo), f(al))
        else {
            st.bad_row += 1;
            continue;
        };
        if g(ii).is_empty() || !(-90.0..=90.0).contains(&lat) || !(-180.0..=180.0).contains(&lon) {
            st.bad_row += 1;
            continue;
        }
        if alt < p.min_alt_ft {
            st.below_min_alt += 1;
            continue;
        }
        let u8f = |k: Option<usize>| k.and_then(|k| g(k).parse::<u8>().ok());
        let (nic, nacp) = (u8f(ni), u8f(nai));
        let low = if nic.is_none() && nacp.is_none() {
            None
        } else {
            Some(classify.classify(nic, nacp).0)
        };
        st.used += 1;
        out.entry((day_of(t), hasher.hash(g(ii))))
            .or_default()
            .push(Report {
                t,
                lat,
                lon,
                gs_kt: gi.and_then(f).filter(|v| *v >= 0.0),
                low,
            });
    }
    for v in out.values_mut() {
        v.sort_by(|a, b| a.t.total_cmp(&b.t));
    }
    Ok((out, st))
}

#[derive(Default, Clone)]
struct CellAcc {
    exposed: BTreeSet<u64>,
    reporting: BTreeSet<u64>,
    gap: BTreeSet<u64>,
    jump: BTreeSet<u64>,
    low_known: BTreeSet<u64>,
    low: BTreeSet<u64>,
}

/// Cells crossed by the great-circle-free straight line between two reports, sampled every
/// kilometre (adequate for cells of tens of kilometres).
fn cells_along(grid: &Grid, a: &Report, b: &Report) -> Vec<CellId> {
    let d = haversine_m(a.lat, a.lon, b.lat, b.lon);
    let n = (d / 1000.0).ceil().max(1.0) as usize;
    let mut out = Vec::new();
    for k in 0..=n {
        let f = k as f64 / n as f64;
        let mut dlon = b.lon - a.lon;
        if dlon > 180.0 {
            dlon -= 360.0;
        } else if dlon < -180.0 {
            dlon += 360.0;
        }
        let mut lon = a.lon + f * dlon;
        if lon >= 180.0 {
            lon -= 360.0;
        } else if lon < -180.0 {
            lon += 360.0;
        }
        let c = grid.cell_of(a.lat + f * (b.lat - a.lat), lon);
        if out.last() != Some(&c) {
            out.push(c);
        }
    }
    out
}

fn count(n: usize) -> Value {
    if n >= PUBLICATION_MIN_DISTINCT {
        json!(n)
    } else {
        Value::Null
    }
}

fn share(k: usize, n: usize) -> (Value, Value) {
    if k < PUBLICATION_MIN_DISTINCT || n == 0 {
        return (Value::Null, Value::Null);
    }
    let s = k as f64 / n as f64;
    let ci = wilson95(k, n).map_or(Value::Null, |(lo, hi)| json!([round4(lo), round4(hi)]));
    (json!(round4(s)), ci)
}

fn round4(v: f64) -> f64 {
    (v * 1e4).round() / 1e4
}

/// Spearman rank correlation of paired values (average ranks for ties); `None` under three pairs.
pub fn spearman(xs: &[f64], ys: &[f64]) -> Option<f64> {
    if xs.len() < 3 || xs.len() != ys.len() {
        return None;
    }
    let rank = |v: &[f64]| {
        let mut idx: Vec<usize> = (0..v.len()).collect();
        idx.sort_by(|a, b| v[*a].total_cmp(&v[*b]));
        let mut r = vec![0.0; v.len()];
        let mut i = 0;
        while i < idx.len() {
            let mut j = i;
            while j + 1 < idx.len() && v[idx[j + 1]] == v[idx[i]] {
                j += 1;
            }
            let avg = (i + j) as f64 / 2.0 + 1.0;
            for k in i..=j {
                r[idx[k]] = avg;
            }
            i = j + 1;
        }
        r
    };
    let (rx, ry) = (rank(xs), rank(ys));
    let n = rx.len() as f64;
    let (mx, my) = (rx.iter().sum::<f64>() / n, ry.iter().sum::<f64>() / n);
    let (mut sxy, mut sxx, mut syy) = (0.0, 0.0, 0.0);
    for (a, b) in rx.iter().zip(&ry) {
        sxy += (a - mx) * (b - my);
        sxx += (a - mx).powi(2);
        syy += (b - my).powi(2);
    }
    if sxx <= 0.0 || syy <= 0.0 {
        return None;
    }
    Some(sxy / (sxx * syy).sqrt())
}

/// Compute the indicators of an ADS-B CSV on `grid` (see the module documentation).
pub fn indicators(text: &str, grid: &Grid, p: &Params) -> Result<Value, IndicatorError> {
    let hasher = IdHasher::new();
    let (tracks, stats) = read(text, p, &hasher)?;
    let mut days: BTreeMap<String, HashMap<CellId, CellAcc>> = BTreeMap::new();
    for ((day, id), reps) in &tracks {
        let cells = days.entry(day.clone()).or_default();
        let mut intervals: Vec<f64> = reps
            .windows(2)
            .map(|w| w[1].t - w[0].t)
            .filter(|d| *d > 0.0 && *d < 60.0)
            .collect();
        intervals.sort_by(f64::total_cmp);
        let median = intervals
            .get(intervals.len() / 2)
            .copied()
            .unwrap_or(f64::INFINITY);
        // Reports per cell, and low-accuracy shares.
        let mut low_counts: HashMap<CellId, (u32, u32)> = HashMap::new();
        for r in reps {
            let c = grid.cell_of(r.lat, r.lon);
            let acc = cells.entry(c).or_default();
            acc.exposed.insert(*id);
            acc.reporting.insert(*id);
            if let Some(l) = r.low {
                let e = low_counts.entry(c).or_default();
                e.0 += 1;
                e.1 += l as u32;
            }
        }
        for (c, (n, k)) in low_counts {
            let acc = cells.entry(c).or_default();
            acc.low_known.insert(*id);
            if f64::from(k) >= p.low_report_share * f64::from(n) {
                acc.low.insert(*id);
            }
        }
        for w in reps.windows(2) {
            let (a, b) = (&w[0], &w[1]);
            let dt = b.t - a.t;
            if dt > p.gap_s && dt <= p.max_gap_s && median <= p.max_normal_interval_s {
                // The cells of the two reports themselves are left out: the aircraft reported
                // there, and the gap may have begun anywhere after the last report.
                let (ca, cb) = (grid.cell_of(a.lat, a.lon), grid.cell_of(b.lat, b.lon));
                for c in cells_along(grid, a, b)
                    .into_iter()
                    .filter(|c| *c != ca && *c != cb)
                {
                    let acc = cells.entry(c).or_default();
                    acc.exposed.insert(*id);
                    acc.gap.insert(*id);
                }
            }
            if dt > 0.0 && dt <= p.max_step_s {
                let d = haversine_m(a.lat, a.lon, b.lat, b.lon);
                let v_kt = d / dt / 0.514_444;
                let gs = a.gs_kt.or(b.gs_kt).unwrap_or(600.0);
                if d >= p.min_jump_m && v_kt > (2.0 * gs).max(gs + p.speed_margin_kt) {
                    // Counted in the cell of the later report: the one that arrived
                    // inconsistent with the track so far.
                    cells
                        .entry(grid.cell_of(b.lat, b.lon))
                        .or_default()
                        .jump
                        .insert(*id);
                }
            }
        }
    }
    let thr_low = AdsbParams::PREREGISTERED_V1.degraded_share;
    let mut out_days = Vec::new();
    let (mut xs_low, mut ys_gap, mut ys_jump) = (Vec::new(), Vec::new(), Vec::new());
    let mut table = [[0usize; 2]; 2]; // [low-flag][indicator-flag]
    let mut denom_shift = Vec::new();
    for (day, cells) in &days {
        let mut feats = Vec::new();
        let mut ids: Vec<&CellId> = cells.keys().collect();
        ids.sort();
        let mut suppressed = 0usize;
        for c in ids {
            let a = &cells[c];
            let n = a.exposed.len();
            if n < PUBLICATION_MIN_DISTINCT {
                suppressed += 1;
                continue;
            }
            let (gs, gci) = share(a.gap.len(), n);
            let (js, jci) = share(a.jump.len(), n);
            let gap_flag = a.gap.len() >= PUBLICATION_MIN_DISTINCT
                && a.gap.len() as f64 >= p.gap_share_flag * n as f64;
            let jump_flag = a.jump.len() >= PUBLICATION_MIN_DISTINCT
                && a.jump.len() as f64 >= p.jump_share_flag * n as f64;
            // Low-accuracy share over the reporting aircraft with accuracy fields, and over the exposed.
            let low_rep = if a.low_known.len() >= PUBLICATION_MIN_DISTINCT {
                Some(a.low.len() as f64 / a.low_known.len() as f64)
            } else {
                None
            };
            if let Some(lr) = low_rep {
                xs_low.push(lr);
                ys_gap.push(a.gap.len() as f64 / n as f64);
                ys_jump.push(a.jump.len() as f64 / n as f64);
                table[(lr >= thr_low) as usize][(gap_flag || jump_flag) as usize] += 1;
                denom_shift.push(json!({"cell_i": c.i, "cell_j": c.j,
                    "low_share_of_reporting": round4(lr),
                    "low_share_of_exposed": round4(a.low.len() as f64 / n as f64)}));
            }
            let (s, w, nn, e) = grid.bounds(*c);
            let mut flags = Vec::new();
            if gap_flag {
                flags.push("update_rate_collapse");
            }
            if jump_flag {
                flags.push("track_inconsistency");
            }
            feats.push(json!({
                "type": "Feature",
                "geometry": {"type": "Polygon", "coordinates": [[[w, s], [e, s], [e, nn], [w, nn], [w, s]]]},
                "properties": {
                    "cell_i": c.i, "cell_j": c.j,
                    "exposed_aircraft": n,
                    "reporting_aircraft": count(a.reporting.len()),
                    "gap_aircraft": count(a.gap.len()), "gap_share": gs, "gap_share_ci95": gci,
                    "jump_aircraft": count(a.jump.len()), "jump_share": js, "jump_share_ci95": jci,
                    "low_accuracy_aircraft": count(a.low.len()),
                    "low_accuracy_share_of_reporting": low_rep.filter(|_| a.low.len() >= PUBLICATION_MIN_DISTINCT).map(round4),
                    "flags": flags,
                }
            }));
        }
        out_days.push(json!({"date": day, "cells_published": feats.len(), "cells_suppressed_below_min_distinct": suppressed,
            "cells": {"type": "FeatureCollection", "features": feats}}));
    }
    Ok(json!({
        "schema": SCHEMA,
        "label": "MODELLED",
        "note": "indicators of inconsistent reporting per cell; they name no cause and locate no emitter; identifiers are never written",
        "method": p.to_json(),
        "grid": {"cell_deg": grid.cell_deg},
        "input": stats,
        "days": out_days,
        "agreement_with_low_accuracy": {
            "cells": xs_low.len(),
            "low_accuracy_flag_share": thr_low,
            "spearman_gap": spearman(&xs_low, &ys_gap),
            "spearman_jump": spearman(&xs_low, &ys_jump),
            "table": {"low_flag_and_indicator": table[1][1], "low_flag_only": table[1][0],
                      "indicator_only": table[0][1], "neither": table[0][0]},
        },
        "denominator_effect": denom_shift,
    }))
}

/// `kshana adsb-indicators <adsb.csv> [--cell-deg <d>] [--out <file.json>]`.
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
    let usage = || crate::t!("adsb-indicators-usage");
    if args.is_empty() {
        return Err(usage());
    }
    if args.iter().any(|a| a == "--help" || a == "-h") {
        println!("{}", usage());
        return Ok(());
    }
    let (mut input, mut out, mut cell) = (
        None,
        None,
        crate::interference_map::grid::PREREGISTERED_CELL_DEG,
    );
    let mut i = 0;
    while i < args.len() {
        let a = args[i].as_str();
        let mut val = || {
            i += 1;
            args.get(i)
                .cloned()
                .ok_or_else(|| crate::terr!("e-adsb-indicators-missing-value", option = a))
        };
        match a {
            "--out" => out = Some(val()?),
            "--cell-deg" => {
                let v = val()?;
                cell = v
                    .parse::<f64>()
                    .ok()
                    .filter(|x| x.is_finite())
                    .ok_or_else(|| {
                        crate::terr!("e-adsb-indicators-bad-cell", value = v.as_str())
                    })?;
            }
            s if s.starts_with('-') => {
                return Err(crate::terr!("e-adsb-indicators-unknown-option", option = s))
            }
            s if input.is_none() => input = Some(s.to_string()),
            _ => return Err(usage()),
        }
        i += 1;
    }
    let Some(path) = input else {
        return Err(usage());
    };
    let grid = Grid::new(cell)
        .ok_or_else(|| crate::terr!("e-adsb-indicators-bad-cell", value = cell.to_string()))?;
    let text = std::fs::read_to_string(&path)
        .map_err(|e| crate::terr!("e-adsb-indicators-cannot-read", path = path.as_str(), e = e))?;
    let doc = indicators(&text, &grid, &Params::PREREGISTERED_V1).map_err(|e| match e {
        IndicatorError::MissingColumn(c) => {
            crate::terr!("e-adsb-indicators-missing-column", name = c)
        }
    })?;
    let flagged: usize = doc["days"]
        .as_array()
        .map(|d| {
            d.iter()
                .flat_map(|day| {
                    day["cells"]["features"]
                        .as_array()
                        .cloned()
                        .unwrap_or_default()
                })
                .filter(|f| {
                    f["properties"]["flags"]
                        .as_array()
                        .is_some_and(|a| !a.is_empty())
                })
                .count()
        })
        .unwrap_or(0);
    let s = serde_json::to_string_pretty(&doc).unwrap_or_default() + "\n";
    match out {
        Some(p) => std::fs::write(&p, s).map_err(|e| {
            crate::terr!("e-adsb-indicators-cannot-write", path = p.as_str(), e = e)
        })?,
        None => print!("{s}"),
    }
    eprintln!("{}", crate::t!("adsb-indicators-summary", n = flagged));
    Ok(())
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn spearman_basics() {
        assert!((spearman(&[1.0, 2.0, 3.0], &[2.0, 4.0, 9.0]).unwrap() - 1.0).abs() < 1e-12);
        assert!((spearman(&[1.0, 2.0, 3.0], &[3.0, 2.0, 1.0]).unwrap() + 1.0).abs() < 1e-12);
        assert!(spearman(&[1.0, 2.0], &[1.0, 2.0]).is_none());
    }
}
