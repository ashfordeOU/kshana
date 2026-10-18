// SPDX-License-Identifier: AGPL-3.0-only
//! The interference observatory's daily product: one UTC day of ADS-B navigation-accuracy
//! reports turned into a GeoJSON map, a PNG picture and an incident-report JSON, plus the
//! sensitivity study of the method's pre-registered parameters (`docs/observatory/METHOD.md`).
//!
//! Three states only: `degraded`, `not_degraded` and `not_observed`. A cell is never labelled
//! with a cause, and `not_observed` is not "clear": it means the day's data did not allow a call
//! (too few aircraft, no background, or a day-wide effect). A day is released only after a delay
//! of at least [`MIN_DELAY_HOURS`] past its end, on cells no finer than [`MIN_CELL_DEG`] degrees.
//! Nothing here opens a network connection.

use std::collections::{BTreeMap, BTreeSet};
use std::io::Write;
use std::path::{Path, PathBuf};

use serde_json::{json, Value};

use super::adsb::{self, AdsbAggregator, AdsbParams, RecordedRow};
use super::cli::{check_args, dataset_from, flag_value, positional, read_adsb_input};
use super::grid::{CellId, Grid};
use super::output::DayOut;
use super::sources::{Dataset, Kind};
use super::time::{civil_from_days, parse_day};
use super::{IdHasher, MapError};

/// Identifier of the observatory product version, written into every product file.
pub const PRODUCT_ID: &str = "kshana-observatory/adsb/v1";
/// Schema of the daily map file.
pub const DAY_SCHEMA: &str = "kshana-observatory-day/1";
/// Schema of the incident-report file.
pub const INCIDENT_SCHEMA: &str = "kshana-incident-report/1";
/// Schema of the sensitivity report.
pub const SENSITIVITY_SCHEMA: &str = "kshana-observatory-sensitivity/1";
/// The shortest allowed delay between the end of a UTC day and its release, hours.
pub const MIN_DELAY_HOURS: f64 = 24.0;
/// The finest cell the observatory publishes, degrees.
pub const MIN_CELL_DEG: f64 = 0.5;

/// What a published cell says about the day.
#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub enum State {
    /// A high share of aircraft reported low navigation accuracy, above the day's background.
    Degraded,
    /// Enough aircraft were sampled and the share did not reach the pre-registered rule.
    NotDegraded,
    /// The data did not allow a call; this is not the same as clear.
    NotObserved,
}

impl State {
    /// The name written to files.
    pub fn as_str(self) -> &'static str {
        match self {
            State::Degraded => "degraded",
            State::NotDegraded => "not_degraded",
            State::NotObserved => "not_observed",
        }
    }
}

/// Map a status of the underlying method to the observatory's three states and, for
/// `not_observed`, the data-sufficiency reason (never a cause of interference).
pub fn state_of(status: &str) -> (State, Option<&'static str>) {
    match status {
        "degraded" => (State::Degraded, None),
        "not_degraded" => (State::NotDegraded, None),
        "insufficient_sample" => (State::NotObserved, Some("insufficient_sample")),
        "withheld_no_background" => (State::NotObserved, Some("no_day_background")),
        "withheld_day_confounded" => (State::NotObserved, Some("day_wide_effect")),
        _ => (State::NotObserved, Some("unclassified")),
    }
}

/// `YYYY-MM-DDTHH:MM:SSZ` of a Unix time in seconds.
pub fn fmt_utc(t: i64) -> String {
    let (y, m, d) = civil_from_days(t.div_euclid(86_400));
    let s = t.rem_euclid(86_400);
    format!(
        "{y:04}-{m:02}-{d:02}T{:02}:{:02}:{:02}Z",
        s / 3600,
        s % 3600 / 60,
        s % 60
    )
}

/// The earliest Unix time (s) the product of `day` may be released: the end of that UTC day plus
/// `delay_hours`.
pub fn earliest_release(day: &str, delay_hours: f64) -> Result<i64, MapError> {
    let d = parse_day(day)
        .ok_or_else(|| MapError::Format(format!("--day `{day}` is not a date (YYYY-MM-DD)")))?;
    Ok((d + 1) * 86_400 + (delay_hours * 3600.0).round() as i64)
}

/// Refuse a release that is too early or too fine. `as_of` is the release time (s).
pub fn check_release(
    day: &str,
    delay_hours: f64,
    cell_deg: f64,
    as_of: i64,
) -> Result<(), MapError> {
    if !delay_hours.is_finite() || delay_hours < MIN_DELAY_HOURS {
        return Err(MapError::Format(format!(
            "--delay-hours must be {MIN_DELAY_HOURS} or more: the observatory does not publish sooner"
        )));
    }
    if !cell_deg.is_finite() || cell_deg < MIN_CELL_DEG {
        return Err(MapError::Format(format!(
            "--cell-deg must be {MIN_CELL_DEG} or coarser: the observatory publishes coarse cells only"
        )));
    }
    let at = earliest_release(day, delay_hours)?;
    if as_of < at {
        return Err(MapError::Format(format!(
            "{day} is not publishable yet: its product is released no earlier than {} ({delay_hours} h after the day ends)",
            fmt_utc(at)
        )));
    }
    Ok(())
}

/// Parse `south,west,north,east` degrees.
pub fn parse_bbox(s: &str) -> Result<(f64, f64, f64, f64), MapError> {
    let v: Vec<f64> = s
        .split(',')
        .map(|x| x.trim().parse::<f64>())
        .collect::<Result<_, _>>()
        .map_err(|_| MapError::Format("--bbox is south,west,north,east in degrees".into()))?;
    let [s, w, n, e] = v[..] else {
        return Err(MapError::Format(
            "--bbox is south,west,north,east in degrees".into(),
        ));
    };
    if !(-90.0..=90.0).contains(&s)
        || !(-90.0..=90.0).contains(&n)
        || !(-180.0..=180.0).contains(&w)
        || !(-180.0..=180.0).contains(&e)
        || s >= n
        || w >= e
    {
        return Err(MapError::Format(
            "--bbox must satisfy south < north and west < east, within the globe (no antimeridian crossing)".into(),
        ));
    }
    Ok((s, w, n, e))
}

/// Group cells that touch (including diagonally) into incidents. Each group is sorted, and the
/// groups are ordered by their first cell, so the result does not depend on input order.
pub fn cluster(cells: &[CellId]) -> Vec<Vec<CellId>> {
    let set: BTreeSet<(i32, i32)> = cells.iter().map(|c| (c.i, c.j)).collect();
    let mut seen: BTreeSet<(i32, i32)> = BTreeSet::new();
    let mut out = Vec::new();
    for &start in &set {
        if seen.contains(&start) {
            continue;
        }
        let mut group = Vec::new();
        let mut stack = vec![start];
        seen.insert(start);
        while let Some((i, j)) = stack.pop() {
            group.push(CellId { i, j });
            for di in -1..=1 {
                for dj in -1..=1 {
                    let n = (i + di, j + dj);
                    if set.contains(&n) && seen.insert(n) {
                        stack.push(n);
                    }
                }
            }
        }
        group.sort_by_key(|c| (c.i, c.j));
        out.push(group);
    }
    out
}

/// The three files of one day.
pub struct Product {
    /// The map as GeoJSON.
    pub geojson: Value,
    /// The incident report.
    pub incidents: Value,
    /// The picture, PNG bytes.
    pub png: Vec<u8>,
}

fn region_json(region: Option<(f64, f64, f64, f64)>) -> Value {
    match region {
        Some((s, w, n, e)) => json!({"south": s, "west": w, "north": n, "east": e}),
        None => Value::Null,
    }
}

const NOTICE: &str = "A degraded cell means a high share of aircraft reported low navigation accuracy there that day. No cause is attributed. A cell that is not observed, or absent, was not assessed, which is not the same as clear. Advisory only: not an approval, certification or statement of conformance.";

/// Build the product of one day from the method's output for that day.
pub fn build_product(
    day: &DayOut,
    grid: &Grid,
    method: Value,
    dataset: &Dataset,
    region: Option<(f64, f64, f64, f64)>,
    delay_hours: f64,
) -> Result<Product, MapError> {
    let release_not_before = fmt_utc(earliest_release(&day.date, delay_hours)?);
    let confounded = day.day_meta.get("day_confounded") == Some(&json!(true));
    let mut feats = Vec::new();
    let mut counts: BTreeMap<&str, usize> = BTreeMap::new();
    let mut cells_png: Vec<(CellId, State)> = Vec::new();
    let mut degraded: Vec<(CellId, &super::output::CellOut)> = Vec::new();
    for c in &day.cells {
        let (st, reason) = state_of(&c.status);
        *counts.entry(st.as_str()).or_default() += 1;
        cells_png.push((c.id, st));
        if st == State::Degraded {
            degraded.push((c.id, c));
        }
        let (s, w, n, e) = grid.bounds(c.id);
        let mut props = c.props.clone();
        props.insert("cell_i".into(), json!(c.id.i));
        props.insert("cell_j".into(), json!(c.id.j));
        props.insert("state".into(), json!(st.as_str()));
        if let Some(r) = reason {
            props.insert("reason".into(), json!(r));
        }
        feats.push(json!({
            "type": "Feature",
            "properties": props,
            "geometry": {"type": "Polygon", "coordinates": [[[w, s], [e, s], [e, n], [w, n], [w, s]]]},
        }));
    }
    let summary = json!({
        "cells_published": day.cells.len(),
        "degraded": counts.get("degraded").copied().unwrap_or(0),
        "not_degraded": counts.get("not_degraded").copied().unwrap_or(0),
        "not_observed_published": counts.get("not_observed").copied().unwrap_or(0),
        "day_wide_effect": confounded,
    });
    let geojson = json!({
        "type": "FeatureCollection",
        "kshana_observatory": {
            "schema": DAY_SCHEMA,
            "product": PRODUCT_ID,
            "source_kind": day.source_kind,
            "date": day.date,
            "states": ["degraded", "not_degraded", "not_observed"],
            "grid": {"type": "fixed_lat_lon", "cell_deg": grid.cell_deg},
            "region": region_json(region),
            "release": {"min_delay_hours": delay_hours, "not_before_utc": release_not_before},
            "summary": summary,
            "method": method,
            "day": day.day_meta,
            "data": dataset.to_json(),
            "kshana_version": env!("CARGO_PKG_VERSION"),
            "notice": NOTICE,
        },
        "features": feats,
    });

    let clusters = cluster(&degraded.iter().map(|d| d.0).collect::<Vec<_>>());
    let by_id: BTreeMap<(i32, i32), &super::output::CellOut> =
        degraded.iter().map(|(id, c)| ((id.i, id.j), *c)).collect();
    let incidents_list: Vec<Value> = clusters
        .iter()
        .enumerate()
        .map(|(n, g)| {
            let mut bb = (f64::MAX, f64::MAX, f64::MIN, f64::MIN);
            let cells: Vec<Value> = g
                .iter()
                .map(|id| {
                    let (s, w, nn, e) = grid.bounds(*id);
                    bb = (bb.0.min(s), bb.1.min(w), bb.2.max(nn), bb.3.max(e));
                    let p = &by_id[&(id.i, id.j)].props;
                    json!({
                        "cell_i": id.i, "cell_j": id.j,
                        "south": s, "west": w, "north": nn, "east": e,
                        "aircraft_sampled": p.get("aircraft_sampled").cloned().unwrap_or(Value::Null),
                        "aircraft_affected": p.get("aircraft_affected").cloned().unwrap_or(Value::Null),
                        "affected_share": p.get("affected_share").cloned().unwrap_or(Value::Null),
                    })
                })
                .collect();
            json!({
                "id": format!("KOBS-{}-{:03}", day.date, n + 1),
                "state": "degraded",
                "cell_count": g.len(),
                "bbox": {"south": bb.0, "west": bb.1, "north": bb.2, "east": bb.3},
                "cells": cells,
            })
        })
        .collect();
    let incidents = json!({
        "schema": INCIDENT_SCHEMA,
        "product": PRODUCT_ID,
        "date": day.date,
        "source_kind": day.source_kind,
        "region": region_json(region),
        "grid_cell_deg": grid.cell_deg,
        "release": {"min_delay_hours": delay_hours, "not_before_utc": release_not_before},
        "summary": summary,
        "incidents": incidents_list,
        "cause": "not attributed",
        "day_wide_effect": confounded,
        "reporting_cycle": "This file is an input to a report, confirm and notify cycle. It is a report of what published position data showed on one day, not a confirmation and not a NOTAM.",
        "method_id": adsb::METHOD_ID,
        "data": dataset.to_json(),
        "kshana_version": env!("CARGO_PKG_VERSION"),
        "notice": NOTICE,
    });
    let png = render_png(&cells_png, grid, &day.date, dataset, &summary);
    Ok(Product {
        geojson,
        incidents,
        png,
    })
}

// ------------------------------------------------------------------ picture

/// 5x7 glyphs, one byte per row, bit 4 the leftmost pixel.
const FONT: &[(char, [u8; 7])] = &[
    (' ', [0; 7]),
    (
        '(',
        [
            0b00010, 0b00100, 0b01000, 0b01000, 0b01000, 0b00100, 0b00010,
        ],
    ),
    (
        ')',
        [
            0b01000, 0b00100, 0b00010, 0b00010, 0b00010, 0b00100, 0b01000,
        ],
    ),
    (
        'F',
        [
            0b11111, 0b10000, 0b10000, 0b11110, 0b10000, 0b10000, 0b10000,
        ],
    ),
    (
        'J',
        [
            0b00111, 0b00010, 0b00010, 0b00010, 0b00010, 0b10010, 0b01100,
        ],
    ),
    (
        'M',
        [
            0b10001, 0b11011, 0b10101, 0b10101, 0b10001, 0b10001, 0b10001,
        ],
    ),
    (
        'P',
        [
            0b11110, 0b10001, 0b10001, 0b11110, 0b10000, 0b10000, 0b10000,
        ],
    ),
    (
        'Q',
        [
            0b01110, 0b10001, 0b10001, 0b10001, 0b10101, 0b10010, 0b01101,
        ],
    ),
    (
        'W',
        [
            0b10001, 0b10001, 0b10001, 0b10101, 0b10101, 0b11011, 0b10001,
        ],
    ),
    (
        'X',
        [
            0b10001, 0b10001, 0b01010, 0b00100, 0b01010, 0b10001, 0b10001,
        ],
    ),
    (
        'Z',
        [
            0b11111, 0b00001, 0b00010, 0b00100, 0b01000, 0b10000, 0b11111,
        ],
    ),
    ('-', [0, 0, 0, 0b11111, 0, 0, 0]),
    ('.', [0, 0, 0, 0, 0, 0b01100, 0b01100]),
    (':', [0, 0b01100, 0b01100, 0, 0b01100, 0b01100, 0]),
    (
        '0',
        [
            0b01110, 0b10001, 0b10011, 0b10101, 0b11001, 0b10001, 0b01110,
        ],
    ),
    (
        '1',
        [
            0b00100, 0b01100, 0b00100, 0b00100, 0b00100, 0b00100, 0b01110,
        ],
    ),
    (
        '2',
        [
            0b01110, 0b10001, 0b00001, 0b00010, 0b00100, 0b01000, 0b11111,
        ],
    ),
    (
        '3',
        [
            0b11110, 0b00001, 0b00001, 0b01110, 0b00001, 0b00001, 0b11110,
        ],
    ),
    (
        '4',
        [
            0b00010, 0b00110, 0b01010, 0b10010, 0b11111, 0b00010, 0b00010,
        ],
    ),
    (
        '5',
        [
            0b11111, 0b10000, 0b11110, 0b00001, 0b00001, 0b10001, 0b01110,
        ],
    ),
    (
        '6',
        [
            0b00110, 0b01000, 0b10000, 0b11110, 0b10001, 0b10001, 0b01110,
        ],
    ),
    (
        '7',
        [
            0b11111, 0b00001, 0b00010, 0b00100, 0b01000, 0b01000, 0b01000,
        ],
    ),
    (
        '8',
        [
            0b01110, 0b10001, 0b10001, 0b01110, 0b10001, 0b10001, 0b01110,
        ],
    ),
    (
        '9',
        [
            0b01110, 0b10001, 0b10001, 0b01111, 0b00001, 0b00010, 0b01100,
        ],
    ),
    (
        'A',
        [
            0b01110, 0b10001, 0b10001, 0b11111, 0b10001, 0b10001, 0b10001,
        ],
    ),
    (
        'B',
        [
            0b11110, 0b10001, 0b10001, 0b11110, 0b10001, 0b10001, 0b11110,
        ],
    ),
    (
        'C',
        [
            0b01110, 0b10001, 0b10000, 0b10000, 0b10000, 0b10001, 0b01110,
        ],
    ),
    (
        'D',
        [
            0b11110, 0b10001, 0b10001, 0b10001, 0b10001, 0b10001, 0b11110,
        ],
    ),
    (
        'E',
        [
            0b11111, 0b10000, 0b10000, 0b11110, 0b10000, 0b10000, 0b11111,
        ],
    ),
    (
        'G',
        [
            0b01110, 0b10001, 0b10000, 0b10111, 0b10001, 0b10001, 0b01111,
        ],
    ),
    (
        'H',
        [
            0b10001, 0b10001, 0b10001, 0b11111, 0b10001, 0b10001, 0b10001,
        ],
    ),
    (
        'I',
        [
            0b01110, 0b00100, 0b00100, 0b00100, 0b00100, 0b00100, 0b01110,
        ],
    ),
    (
        'K',
        [
            0b10001, 0b10010, 0b10100, 0b11000, 0b10100, 0b10010, 0b10001,
        ],
    ),
    (
        'L',
        [
            0b10000, 0b10000, 0b10000, 0b10000, 0b10000, 0b10000, 0b11111,
        ],
    ),
    (
        'N',
        [
            0b10001, 0b11001, 0b10101, 0b10011, 0b10001, 0b10001, 0b10001,
        ],
    ),
    (
        'O',
        [
            0b01110, 0b10001, 0b10001, 0b10001, 0b10001, 0b10001, 0b01110,
        ],
    ),
    (
        'R',
        [
            0b11110, 0b10001, 0b10001, 0b11110, 0b10100, 0b10010, 0b10001,
        ],
    ),
    (
        'S',
        [
            0b01111, 0b10000, 0b10000, 0b01110, 0b00001, 0b00001, 0b11110,
        ],
    ),
    (
        'T',
        [
            0b11111, 0b00100, 0b00100, 0b00100, 0b00100, 0b00100, 0b00100,
        ],
    ),
    (
        'U',
        [
            0b10001, 0b10001, 0b10001, 0b10001, 0b10001, 0b10001, 0b01110,
        ],
    ),
    (
        'V',
        [
            0b10001, 0b10001, 0b10001, 0b10001, 0b10001, 0b01010, 0b00100,
        ],
    ),
    (
        'Y',
        [
            0b10001, 0b10001, 0b01010, 0b00100, 0b00100, 0b00100, 0b00100,
        ],
    ),
];

const BG: [u8; 3] = [0xE8, 0xEC, 0xF3];
const INK: [u8; 3] = [0x18, 0x20, 0x33];
const DEGRADED: [u8; 3] = [0xB8, 0x26, 0x2B];
const NOT_DEGRADED: [u8; 3] = [0x2E, 0x6F, 0xA7];
const NOT_OBS: [u8; 3] = [0xD5, 0xDA, 0xE5];
const NOT_OBS_STRIPE: [u8; 3] = [0x8E, 0x98, 0xAE];

struct Canvas {
    w: usize,
    h: usize,
    px: Vec<u8>,
}

impl Canvas {
    fn new(w: usize, h: usize) -> Self {
        let mut px = Vec::with_capacity(w * h * 3);
        for _ in 0..w * h {
            px.extend_from_slice(&BG);
        }
        Self { w, h, px }
    }

    fn set(&mut self, x: usize, y: usize, c: [u8; 3]) {
        if x < self.w && y < self.h {
            let o = (y * self.w + x) * 3;
            self.px[o..o + 3].copy_from_slice(&c);
        }
    }

    fn rect(&mut self, x: usize, y: usize, w: usize, h: usize, c: [u8; 3]) {
        for yy in y..y + h {
            for xx in x..x + w {
                self.set(xx, yy, c);
            }
        }
    }

    fn text(&mut self, x: usize, y: usize, scale: usize, s: &str, c: [u8; 3]) -> usize {
        let mut cx = x;
        for ch in s.chars() {
            let up = ch.to_ascii_uppercase();
            if let Some((_, g)) = FONT.iter().find(|(k, _)| *k == up) {
                for (r, row) in g.iter().enumerate() {
                    for b in 0..5 {
                        if row >> (4 - b) & 1 == 1 {
                            self.rect(cx + b * scale, y + r * scale, scale, scale, c);
                        }
                    }
                }
            }
            cx += 6 * scale;
        }
        cx
    }
}

fn render_png(
    cells: &[(CellId, State)],
    grid: &Grid,
    date: &str,
    dataset: &Dataset,
    summary: &Value,
) -> Vec<u8> {
    let margin = 16usize;
    let (i0, i1, j0, j1) = cells
        .iter()
        .fold((i32::MAX, i32::MIN, i32::MAX, i32::MIN), |a, (c, _)| {
            (a.0.min(c.i), a.1.max(c.i), a.2.min(c.j), a.3.max(c.j))
        });
    let (i0, i1, j0, j1) = if cells.is_empty() {
        (0, 0, 0, 0)
    } else {
        (i0 - 1, i1 + 1, j0 - 1, j1 + 1)
    };
    let cols = ((j1 - j0 + 1).max(8)) as usize;
    let rows = ((i1 - i0 + 1).max(6)) as usize;
    let cp = (1400 / cols).clamp(3, 40);
    let grid_w = cols * cp;
    let width = (grid_w + 2 * margin).max(600);
    let top = 64usize;
    let height = top + rows * cp + 78;
    let mut cv = Canvas::new(width, height);
    cv.text(
        margin,
        14,
        2,
        &format!("KSHANA OBSERVATORY  ADS-B  {date}"),
        INK,
    );
    cv.text(
        margin,
        38,
        1,
        &format!(
            "{} DEG CELLS  UTC DAY  NOT OBSERVED IS NOT CLEAR  NO CAUSE ATTRIBUTED",
            trim_deg(grid.cell_deg)
        ),
        INK,
    );
    for (c, st) in cells {
        let x = margin + (c.j - j0) as usize * cp;
        let y = top + (i1 - c.i) as usize * cp;
        let inner = cp.saturating_sub(1).max(1);
        match st {
            State::Degraded => cv.rect(x, y, inner, inner, DEGRADED),
            State::NotDegraded => cv.rect(x, y, inner, inner, NOT_DEGRADED),
            State::NotObserved => {
                for yy in 0..inner {
                    for xx in 0..inner {
                        let col = if (xx + yy) % 6 < 2 {
                            NOT_OBS_STRIPE
                        } else {
                            NOT_OBS
                        };
                        cv.set(x + xx, y + yy, col);
                    }
                }
            }
        }
    }
    // Legend: swatch and label, one row under the grid.
    let ly = top + rows * cp + 14;
    let mut lx = margin;
    for (label, col, hatch) in [
        ("DEGRADED", DEGRADED, false),
        ("NOT DEGRADED", NOT_DEGRADED, false),
        ("NOT OBSERVED", NOT_OBS, true),
    ] {
        for yy in 0..14 {
            for xx in 0..14 {
                let c = if hatch && (xx + yy) % 6 < 2 {
                    NOT_OBS_STRIPE
                } else {
                    col
                };
                cv.set(lx + xx, ly + yy, c);
            }
        }
        lx = cv.text(lx + 22, ly, 2, label, INK) + 28;
    }
    let src = format!(
        "SOURCE {}  LICENCE {}",
        dataset.key.to_ascii_uppercase(),
        dataset.licence.to_ascii_uppercase()
    );
    cv.text(margin, ly + 26, 1, &src, INK);
    let meta = format!(
        "{} DEGRADED  {} NOT DEGRADED  {} NOT OBSERVED (PUBLISHED CELLS)",
        summary["degraded"], summary["not_degraded"], summary["not_observed_published"]
    );
    cv.text(margin, ly + 40, 1, &meta, INK);
    encode_png(
        &cv,
        &[
            ("Title", format!("Kshana observatory, ADS-B navigation-accuracy map, {date}")),
            (
                "Description",
                "Degraded, not degraded or not observed per cell. Not observed is not clear. No cause is attributed. Advisory only.".into(),
            ),
            ("Source", dataset.name.clone()),
            ("Copyright", format!("{} ({})", dataset.attribution, dataset.licence)),
            ("Software", format!("kshana {}", env!("CARGO_PKG_VERSION"))),
        ],
    )
}

fn trim_deg(d: f64) -> String {
    let s = format!("{d}");
    s
}

fn crc32(bytes: &[u8]) -> u32 {
    let mut crc = 0xFFFF_FFFFu32;
    for &b in bytes {
        crc ^= u32::from(b);
        for _ in 0..8 {
            crc = if crc & 1 == 1 {
                0xEDB8_8320 ^ (crc >> 1)
            } else {
                crc >> 1
            };
        }
    }
    !crc
}

fn chunk(out: &mut Vec<u8>, kind: &[u8; 4], data: &[u8]) {
    out.extend_from_slice(&(data.len() as u32).to_be_bytes());
    let mut body = kind.to_vec();
    body.extend_from_slice(data);
    out.extend_from_slice(&body);
    out.extend_from_slice(&crc32(&body).to_be_bytes());
}

fn encode_png(cv: &Canvas, text: &[(&str, String)]) -> Vec<u8> {
    let mut raw = Vec::with_capacity((cv.w * 3 + 1) * cv.h);
    for y in 0..cv.h {
        raw.push(0);
        raw.extend_from_slice(&cv.px[y * cv.w * 3..(y + 1) * cv.w * 3]);
    }
    let mut z = flate2::write::ZlibEncoder::new(Vec::new(), flate2::Compression::new(6));
    let _ = z.write_all(&raw);
    let idat = z.finish().unwrap_or_default();
    let mut out = vec![0x89, b'P', b'N', b'G', 0x0D, 0x0A, 0x1A, 0x0A];
    let mut ihdr = Vec::new();
    ihdr.extend_from_slice(&(cv.w as u32).to_be_bytes());
    ihdr.extend_from_slice(&(cv.h as u32).to_be_bytes());
    ihdr.extend_from_slice(&[8, 2, 0, 0, 0]);
    chunk(&mut out, b"IHDR", &ihdr);
    for (k, v) in text {
        let mut d = k.as_bytes().to_vec();
        d.push(0);
        // tEXt is Latin-1: keep ASCII, replace anything else.
        d.extend(v.chars().map(|c| if c.is_ascii() { c as u8 } else { b'?' }));
        chunk(&mut out, b"tEXt", &d);
    }
    chunk(&mut out, b"IDAT", &idat);
    chunk(&mut out, b"IEND", &[]);
    out
}

// ---------------------------------------------------------------- commands

fn now_unix() -> i64 {
    std::time::SystemTime::now()
        .duration_since(std::time::UNIX_EPOCH)
        .map(|d| d.as_secs() as i64)
        .unwrap_or(0)
}

/// OpenSky data may not be used for a published product: its licence bars commercial use.
fn refuse_opensky(ds: &Dataset) -> Result<(), MapError> {
    let hay = format!(
        "{} {} {} {}",
        ds.name, ds.licence, ds.licence_url, ds.attribution
    )
    .to_ascii_lowercase();
    if hay.contains("opensky") {
        return Err(MapError::Format(
            "OpenSky Network data is excluded: its licence does not allow commercial use or redistribution of derived maps (docs/data/INTERFERENCE-DATA-SOURCES.md)".into(),
        ));
    }
    Ok(())
}

fn dataset_checked(rest: &[String]) -> Result<Dataset, MapError> {
    let ds = dataset_from(rest, Kind::Adsb)?;
    refuse_opensky(&ds)?;
    Ok(ds)
}

fn write_new(path: &Path, bytes: &[u8]) -> Result<(), MapError> {
    let mut f = std::fs::OpenOptions::new()
        .write(true)
        .create_new(true)
        .open(path)
        .map_err(|e| {
            MapError::Io(format!(
                "cannot create {} (Kshana does not overwrite products): {e}",
                path.display()
            ))
        })?;
    f.write_all(bytes)
        .map_err(|e| MapError::Io(format!("cannot write {}: {e}", path.display())))
}

fn read_day(
    input: &Path,
    grid: Grid,
    region: Option<(f64, f64, f64, f64)>,
    params: AdsbParams,
    record: bool,
) -> Result<(AdsbAggregator, Vec<RecordedRow>), MapError> {
    let mut agg = AdsbAggregator::new(grid, params, IdHasher::new());
    if let Some(r) = region {
        agg = agg.with_region(r);
    }
    if record {
        agg = agg.record_rows();
    }
    read_adsb_input(&mut agg, input)?;
    let rows = agg.take_recorded();
    Ok((agg, rows))
}

fn stats_json(s: &adsb::AdsbReadStats) -> Value {
    json!({
        "rows": s.rows,
        "used": s.used,
        "rejected_malformed": s.rejected_malformed,
        "excluded_ground_or_below_altitude_floor": s.excluded_ground_or_low,
        "excluded_non_adsb_source": s.excluded_non_adsb_source,
        "excluded_no_accuracy_field": s.excluded_no_accuracy_field,
        "excluded_outside_region": s.excluded_outside_region,
        "trace_files": s.trace_files,
        "trace_files_unreadable": s.trace_files_unreadable,
    })
}

/// `kshana interference-map daily`: write the three files and a hash manifest for one day.
pub fn run_daily(rest: &[String]) -> Result<(), MapError> {
    let valued = [
        "--dataset",
        "--out",
        "--cell-deg",
        "--licence",
        "--licence-url",
        "--attribution",
        "--day",
        "--bbox",
        "--delay-hours",
    ];
    check_args(rest, &valued, &[], 1)?;
    let input =
        positional(rest, &valued).ok_or_else(|| MapError::Format("input file missing".into()))?;
    let ds = dataset_checked(rest)?;
    let day = flag_value(rest, "--day")?
        .ok_or_else(|| MapError::Format("--day is required".into()))?
        .to_string();
    let cell_deg = match flag_value(rest, "--cell-deg")? {
        None => MIN_CELL_DEG,
        Some(s) => s
            .parse::<f64>()
            .map_err(|_| MapError::Format("--cell-deg is not a number".into()))?,
    };
    let delay = match flag_value(rest, "--delay-hours")? {
        None => MIN_DELAY_HOURS,
        Some(s) => s
            .parse::<f64>()
            .map_err(|_| MapError::Format("--delay-hours is not a number".into()))?,
    };
    check_release(&day, delay, cell_deg, now_unix())?;
    let grid = Grid::new(cell_deg)
        .ok_or_else(|| MapError::Format("--cell-deg must be between 0.5 and 10".into()))?;
    let region = flag_value(rest, "--bbox")?.map(parse_bbox).transpose()?;
    let out = PathBuf::from(
        flag_value(rest, "--out")?.ok_or_else(|| MapError::Format("--out is required".into()))?,
    );
    let (agg, _) = read_day(
        Path::new(input),
        grid,
        region,
        AdsbParams::PREREGISTERED_V1,
        false,
    )?;
    let stats = agg.stats.clone();
    let days = agg.finish();
    let Some(d) = days.iter().find(|d| d.date == day) else {
        return Err(MapError::Format(format!(
            "the input has no usable report on {day} (days found: {})",
            days.iter()
                .map(|d| d.date.as_str())
                .collect::<Vec<_>>()
                .join(", ")
        )));
    };
    let mut method = adsb::method_json(&AdsbParams::PREREGISTERED_V1, &stats);
    method["input_stats"]["excluded_outside_region"] = json!(stats.excluded_outside_region);
    method["scope"] = json!(if region.is_some() {
        "regional: the equipment baseline and the day's background are computed from the reports inside the region only"
    } else {
        "input as given"
    });
    let p = build_product(d, &grid, method, &ds, region, delay)?;
    std::fs::create_dir_all(&out)
        .map_err(|e| MapError::Io(format!("cannot create {}: {e}", out.display())))?;
    let stem = format!("observatory-adsb-{}-{day}", ds.key);
    let gj = to_text(&p.geojson)?;
    let inc = to_text(&p.incidents)?;
    let names = [
        (format!("{stem}.geojson"), gj.into_bytes()),
        (format!("{stem}.png"), p.png),
        (format!("{stem}.incidents.json"), inc.into_bytes()),
    ];
    let mut files = Vec::new();
    for (name, _) in &names {
        let path = out.join(name);
        if path.exists() {
            return Err(MapError::Io(format!(
                "{} already exists; Kshana does not overwrite products",
                path.display()
            )));
        }
    }
    for (name, bytes) in &names {
        write_new(&out.join(name), bytes)?;
        files.push(json!({"name": name, "bytes": bytes.len(), "sha256": hex::encode(<sha2::Sha256 as sha2::Digest>::digest(bytes))}));
        println!("wrote {}", out.join(name).display());
    }
    let manifest = json!({
        "schema": "kshana-observatory-manifest/1",
        "product": PRODUCT_ID,
        "date": day,
        "kshana_version": env!("CARGO_PKG_VERSION"),
        "method_id": adsb::METHOD_ID,
        "dataset": ds.to_json(),
        "input_stats": stats_json(&stats),
        "files": files,
    });
    write_new(
        &out.join(format!("{stem}.manifest.json")),
        to_text(&manifest)?.as_bytes(),
    )?;
    println!(
        "{} cells published, {} degraded, {} incident(s)",
        p.geojson["kshana_observatory"]["summary"]["cells_published"],
        p.geojson["kshana_observatory"]["summary"]["degraded"],
        p.incidents["incidents"].as_array().map_or(0, Vec::len)
    );
    Ok(())
}

fn to_text(v: &Value) -> Result<String, MapError> {
    serde_json::to_string_pretty(v)
        .map(|s| s + "\n")
        .map_err(|e| MapError::Format(e.to_string()))
}

/// One variant of the sensitivity study: the parameter changed, the value, and the new params.
fn variants() -> Vec<(String, String, AdsbParams, f64)> {
    let b = AdsbParams::PREREGISTERED_V1;
    let mut v: Vec<(String, String, AdsbParams, f64)> = Vec::new();
    let mut add = |name: &str, val: &str, p: AdsbParams, cell: f64| {
        v.push((name.into(), val.into(), p, cell));
    };
    for x in [5u8, 7] {
        add(
            "low_nacp_max",
            &x.to_string(),
            AdsbParams {
                low_nacp_max: x,
                ..b.clone()
            },
            0.5,
        );
    }
    for x in [4u8, 6] {
        add(
            "low_nic_max",
            &x.to_string(),
            AdsbParams {
                low_nic_max: x,
                ..b.clone()
            },
            0.5,
        );
    }
    for x in [7u8, 9] {
        add(
            "good_nacp_min",
            &x.to_string(),
            AdsbParams {
                good_nacp_min: x,
                ..b.clone()
            },
            0.5,
        );
    }
    for x in [3000.0, 8000.0] {
        add(
            "min_alt_ft",
            &x.to_string(),
            AdsbParams {
                min_alt_ft: x,
                ..b.clone()
            },
            0.5,
        );
    }
    for x in [0.4, 0.6] {
        add(
            "affected_report_share",
            &x.to_string(),
            AdsbParams {
                affected_report_share: x,
                ..b.clone()
            },
            0.5,
        );
    }
    for x in [0.2, 0.4] {
        add(
            "degraded_share",
            &x.to_string(),
            AdsbParams {
                degraded_share: x,
                ..b.clone()
            },
            0.5,
        );
    }
    for x in [0.10, 0.20] {
        add(
            "background_margin",
            &x.to_string(),
            AdsbParams {
                background_margin: x,
                ..b.clone()
            },
            0.5,
        );
    }
    for x in [8usize, 15] {
        add(
            "min_aircraft",
            &x.to_string(),
            AdsbParams {
                min_aircraft: x,
                ..b.clone()
            },
            0.5,
        );
    }
    for x in [3u32, 10] {
        add(
            "min_baseline_good",
            &x.to_string(),
            AdsbParams {
                min_baseline_good: x,
                ..b.clone()
            },
            0.5,
        );
    }
    for x in [2u32, 5] {
        add(
            "min_reports_per_aircraft",
            &x.to_string(),
            AdsbParams {
                min_reports_per_aircraft: x,
                ..b.clone()
            },
            0.5,
        );
    }
    for x in [0.10, 0.25] {
        add(
            "day_confound_background",
            &x.to_string(),
            AdsbParams {
                day_confound_background: x,
                ..b.clone()
            },
            0.5,
        );
    }
    add("cell_deg", "1.0", b.clone(), 1.0);
    v
}

#[derive(Default)]
struct DayCounts {
    degraded: BTreeSet<(i32, i32)>,
    not_degraded: usize,
    not_observed: usize,
    published: usize,
    confounded: bool,
    states: BTreeMap<(i32, i32), State>,
}

fn counts_of(d: Option<&DayOut>) -> DayCounts {
    let mut c = DayCounts::default();
    let Some(d) = d else { return c };
    c.confounded = d.day_meta.get("day_confounded") == Some(&json!(true));
    for cell in &d.cells {
        c.published += 1;
        let (st, _) = state_of(&cell.status);
        c.states.insert((cell.id.i, cell.id.j), st);
        match st {
            State::Degraded => {
                c.degraded.insert((cell.id.i, cell.id.j));
            }
            State::NotDegraded => c.not_degraded += 1,
            State::NotObserved => c.not_observed += 1,
        }
    }
    c
}

/// Run every variant on the recorded rows of one day and report how the calls move.
pub fn sensitivity_report(
    rows: &[RecordedRow],
    day: &str,
    region: Option<(f64, f64, f64, f64)>,
) -> Value {
    let run = |p: AdsbParams, cell: f64| -> DayCounts {
        let grid = Grid::new(cell).unwrap_or(Grid {
            cell_deg: MIN_CELL_DEG,
        });
        let mut a = AdsbAggregator::new(grid, p, IdHasher::new());
        a.replay(rows);
        let days = a.finish();
        counts_of(days.iter().find(|d| d.date == day))
    };
    let base = run(AdsbParams::PREREGISTERED_V1, 0.5);
    let mut out = Vec::new();
    for (name, val, p, cell) in variants() {
        let c = run(p, cell);
        let comparable = (cell - 0.5).abs() < 1e-9;
        let jaccard = if comparable {
            let inter = base.degraded.intersection(&c.degraded).count() as f64;
            let union = base.degraded.union(&c.degraded).count() as f64;
            if union == 0.0 {
                Value::Null
            } else {
                json!(round4(inter / union))
            }
        } else {
            Value::Null
        };
        let flips = if comparable {
            json!(base
                .states
                .iter()
                .filter(|(k, s)| c.states.get(*k).is_some_and(|t| t != *s))
                .count())
        } else {
            Value::Null
        };
        out.push(json!({
            "parameter": name,
            "value": val,
            "cell_deg": cell,
            "cells_degraded": c.degraded.len(),
            "degraded_area_deg2": round4(c.degraded.len() as f64 * cell * cell),
            "cells_not_degraded": c.not_degraded,
            "cells_not_observed_published": c.not_observed,
            "cells_published": c.published,
            "day_wide_effect": c.confounded,
            "degraded_jaccard_with_registered": jaccard,
            "cells_whose_state_changed": flips,
            "delta_degraded_cells": c.degraded.len() as i64 - base.degraded.len() as i64,
        }));
    }
    json!({
        "schema": SENSITIVITY_SCHEMA,
        "product": PRODUCT_ID,
        "method_id": adsb::METHOD_ID,
        "date": day,
        "region": region_json(region),
        "design": "one parameter at a time around the pre-registered values; the registered rule is not changed by this study",
        "registered": {
            "parameters": AdsbParams::PREREGISTERED_V1.to_json(),
            "cells_degraded": base.degraded.len(),
            "cells_not_degraded": base.not_degraded,
            "cells_not_observed_published": base.not_observed,
            "cells_published": base.published,
            "day_wide_effect": base.confounded,
        },
        "variants": out,
        "caveat": "A change in the number of degraded cells under a parameter shows how much the call depends on that parameter, not which value is right. No variant is a validated alternative.",
    })
}

fn round4(x: f64) -> f64 {
    (x * 1e4).round() / 1e4
}

/// `kshana interference-map sensitivity`: the sensitivity study of one day.
pub fn run_sensitivity(rest: &[String]) -> Result<(), MapError> {
    let valued = [
        "--dataset",
        "--out",
        "--licence",
        "--licence-url",
        "--attribution",
        "--day",
        "--bbox",
    ];
    check_args(rest, &valued, &[], 1)?;
    let input =
        positional(rest, &valued).ok_or_else(|| MapError::Format("input file missing".into()))?;
    let _ds = dataset_checked(rest)?;
    let day = flag_value(rest, "--day")?
        .ok_or_else(|| MapError::Format("--day is required".into()))?
        .to_string();
    let region = flag_value(rest, "--bbox")?.map(parse_bbox).transpose()?;
    let out =
        flag_value(rest, "--out")?.ok_or_else(|| MapError::Format("--out is required".into()))?;
    let grid = Grid::new(MIN_CELL_DEG).ok_or_else(|| MapError::Format("grid".into()))?;
    let (_, rows) = read_day(
        Path::new(input),
        grid,
        region,
        AdsbParams::PREREGISTERED_V1,
        true,
    )?;
    if rows.is_empty() {
        return Err(MapError::Format("the input has no usable report".into()));
    }
    let rep = sensitivity_report(&rows, &day, region);
    write_new(Path::new(out), to_text(&rep)?.as_bytes())?;
    println!(
        "{} rows replayed under {} variants: {out}",
        rows.len(),
        variants().len()
    );
    Ok(())
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn statuses_map_to_three_states_and_never_to_a_cause() {
        assert_eq!(state_of("degraded").0, State::Degraded);
        assert_eq!(state_of("not_degraded").0, State::NotDegraded);
        for s in [
            "insufficient_sample",
            "withheld_no_background",
            "withheld_day_confounded",
            "whatever",
        ] {
            let (st, reason) = state_of(s);
            assert_eq!(st, State::NotObserved);
            let r = reason.unwrap();
            for banned in ["jam", "spoof", "attack", "interf", "military", "state"] {
                assert!(!r.contains(banned), "{r}");
            }
        }
    }

    #[test]
    fn release_needs_the_delay_the_coarse_cell_and_a_past_day() {
        let day = "2026-03-01";
        let end = parse_day(day).unwrap() * 86_400 + 86_400;
        assert!(check_release(day, 24.0, 0.5, end + 24 * 3600).is_ok());
        assert!(check_release(day, 24.0, 0.5, end + 24 * 3600 - 1)
            .unwrap_err()
            .to_string()
            .contains("not publishable"));
        assert!(check_release(day, 23.9, 0.5, end + 99_999_999).is_err());
        assert!(check_release(day, 24.0, 0.25, end + 99_999_999).is_err());
        assert!(check_release(day, 48.0, 1.0, end + 47 * 3600).is_err());
        assert!(check_release("not-a-day", 24.0, 0.5, i64::MAX).is_err());
        assert_eq!(fmt_utc(end + 24 * 3600), "2026-03-03T00:00:00Z");
    }

    #[test]
    fn bbox_is_checked() {
        assert_eq!(parse_bbox("53.5,9,66,31").unwrap(), (53.5, 9.0, 66.0, 31.0));
        for bad in ["1,2,3", "66,9,53,31", "a,b,c,d", "0,0,100,10", "0,10,5,10"] {
            assert!(parse_bbox(bad).is_err(), "{bad}");
        }
    }

    #[test]
    fn clusters_join_touching_cells_including_diagonals_and_are_order_independent() {
        let c = |i, j| CellId { i, j };
        let cells = [c(5, 5), c(6, 6), c(9, 9), c(5, 6), c(20, 1)];
        let a = cluster(&cells);
        let mut rev = cells;
        rev.reverse();
        assert_eq!(a, cluster(&rev));
        assert_eq!(a.len(), 3);
        assert_eq!(a[0].len(), 3);
    }

    #[test]
    fn opensky_is_refused() {
        let ds = super::super::sources::custom(
            Kind::Adsb,
            "x",
            "https://opensky-network.org/terms",
            "OpenSky Network",
        );
        assert!(refuse_opensky(&ds)
            .unwrap_err()
            .to_string()
            .contains("OpenSky"));
        let ok = super::super::sources::preset("adsb-lol").unwrap();
        assert!(refuse_opensky(&ok).is_ok());
    }

    #[test]
    fn the_font_covers_every_character_the_picture_prints() {
        let text = "KSHANA OBSERVATORY  ADS-B  2026-03-01 0.5 DEG CELLS  UTC DAY  NOT OBSERVED IS NOT CLEAR  NO CAUSE ATTRIBUTED DEGRADED NOT DEGRADED SOURCE ADSB-LOL LICENCE ODBL-1.0 NOLD-2.0 (PUBLISHED CELLS) NOAA CC0 NLOD";
        for c in text.chars() {
            assert!(
                FONT.iter().any(|(k, _)| *k == c.to_ascii_uppercase()),
                "no glyph for {c:?}"
            );
        }
    }

    #[test]
    fn the_png_is_a_valid_png_with_the_advisory_text() {
        let ds = super::super::sources::preset("adsb-lol").unwrap();
        let cells = vec![
            (CellId { i: 280, j: 400 }, State::Degraded),
            (CellId { i: 280, j: 401 }, State::NotDegraded),
            (CellId { i: 281, j: 400 }, State::NotObserved),
        ];
        let png = render_png(
            &cells,
            &Grid::new(0.5).unwrap(),
            "2026-03-01",
            &ds,
            &json!({"degraded": 1, "not_degraded": 1, "not_observed_published": 1}),
        );
        assert_eq!(&png[..8], &[0x89, b'P', b'N', b'G', 0x0D, 0x0A, 0x1A, 0x0A]);
        let text = String::from_utf8_lossy(&png);
        assert!(text.contains("Not observed is not clear"));
        assert!(text.contains("IHDR") && text.contains("IDAT") && text.contains("IEND"));
        // The same input gives the same bytes.
        let again = render_png(
            &cells,
            &Grid::new(0.5).unwrap(),
            "2026-03-01",
            &ds,
            &json!({"degraded": 1, "not_degraded": 1, "not_observed_published": 1}),
        );
        assert_eq!(png, again);
    }
}
