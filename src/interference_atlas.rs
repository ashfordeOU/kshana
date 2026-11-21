// SPDX-License-Identifier: AGPL-3.0-only
//! **Persistent interference-area atlas from the daily map products, a ground-station C/N0
//! interference layer from RINEX observations, and the ground-against-airborne comparison.**
//! MODELLED.
//!
//! * [`build`] reads daily ADS-B (or AIS) map products (`kshana interference-map` GeoJSON) and
//!   states, per cell: the days with a call (`degraded` or `not_degraded`), the days degraded,
//!   the persistence (degraded over called days) with a Wilson 95 % interval, and the first and
//!   last degraded day. Cells degraded on at least [`AtlasParams::min_days`] days with a
//!   persistence of at least [`AtlasParams::min_persistence`] form **zones**: groups of such
//!   cells touching at an edge or a corner, each with its bounding box, cell count, degraded
//!   days and dates. The atlas carries the SHA-256 of every input file and a **version**: the
//!   SHA-256 of its own canonical content (inputs, parameters, cells and zones). `verify`
//!   recomputes it, so a changed atlas is detected; `--previous` records the version it
//!   supersedes, so versions form a chain and none is edited in place.
//! * [`cors_layer`] compares a station's RINEX observation file with an earlier one of the same
//!   station: each GPS satellite's C/N0 at an epoch against the same satellite one GPS
//!   ground-track repeat earlier ([`GPS_REPEAT_S`], so the geometry and the multipath repeat).
//!   An epoch is flagged when the median drop over at least [`CorsParams::min_sats`] satellites
//!   reaches [`CorsParams::drop_db`]; flagged epochs closer than [`CorsParams::join_s`] form
//!   intervals. A drop on many satellites at once is what wideband interference does; a single
//!   satellite's drop is not counted.
//! * [`ground_vs_airborne`] sets a station's flagged intervals beside the status of the ADS-B
//!   cell that contains the station on the same day: `both`, `ground_only`, `airborne_only`,
//!   `neither`, or `not_observed`.
//!
//! **Scope.** The atlas summarises the map's own calls; it does not add evidence beyond them and
//! names no cause. The backlog's acceptance (reproducing the 31 zones of a published study)
//! needs those days of data, which are not in this repository. The C/N0 layer needs the
//! satellites' own C/N0 recorded in the observation files (`S` codes) and two days of the same
//! station; it uses GPS only, whose ground tracks repeat daily.

use crate::interference_map::adsb::wilson95;
use crate::rinex_obs::RinexObs;
use serde_json::{json, Value};
use sha2::{Digest, Sha256};
use std::collections::{BTreeMap, BTreeSet};

/// Schema ids.
pub const ATLAS_SCHEMA: &str = "kshana.interference-atlas/1";
pub const CORS_SCHEMA: &str = "kshana.cors-cn0-layer/1";
/// Method id of the atlas and layer.
pub const METHOD_ID: &str = "kshana-interference-atlas/v1";
/// GPS ground-track repeat (s): one sidereal day less about four minutes (86 164.09 s − 8 s).
pub const GPS_REPEAT_S: f64 = 86_156.0;

/// Atlas parameters (pre-registered).
#[derive(Clone, Debug, PartialEq)]
pub struct AtlasParams {
    pub min_days: usize,
    pub min_persistence: f64,
}

impl AtlasParams {
    pub const PREREGISTERED_V1: AtlasParams = AtlasParams {
        min_days: 3,
        min_persistence: 0.5,
    };
}

/// Errors of the atlas and layer.
#[derive(Clone, Debug, PartialEq)]
pub enum AtlasError {
    /// An input is not a daily map product (missing date, grid or features).
    NotAProduct(String),
    /// Two inputs have different grids or sources.
    Mixed,
    /// No input.
    Empty,
    /// The two observation files share no GPS satellite with C/N0.
    NoCn0,
}

fn sha256_hex(b: &[u8]) -> String {
    hex::encode(Sha256::digest(b))
}

/// Canonical JSON (object keys sorted, which `serde_json` does without `preserve_order`).
fn canonical(v: &Value) -> String {
    serde_json::to_string(v).unwrap_or_default()
}

/// Build the atlas from daily products `(name, text)`.
pub fn build(
    inputs: &[(String, String)],
    p: &AtlasParams,
    previous: Option<&str>,
) -> Result<Value, AtlasError> {
    if inputs.is_empty() {
        return Err(AtlasError::Empty);
    }
    // cell -> (called days, degraded dates)
    let mut cells: BTreeMap<(i64, i64), (BTreeSet<String>, BTreeSet<String>)> = BTreeMap::new();
    let mut grid_deg: Option<f64> = None;
    let mut source: Option<String> = None;
    let mut files = Vec::new();
    let mut dates = BTreeSet::new();
    for (name, text) in inputs {
        let v: Value =
            serde_json::from_str(text).map_err(|_| AtlasError::NotAProduct(name.clone()))?;
        let meta = &v["kshana_interference_map"];
        let (Some(date), Some(deg), Some(features)) = (
            meta["date"].as_str(),
            meta["grid"]["cell_deg"].as_f64(),
            v["features"].as_array(),
        ) else {
            return Err(AtlasError::NotAProduct(name.clone()));
        };
        let src = meta["method"]["id"]
            .as_str()
            .or_else(|| v["method"]["id"].as_str())
            .or_else(|| meta["source"].as_str())
            .unwrap_or("map")
            .split('/')
            .take(2)
            .collect::<Vec<_>>()
            .join("/");
        if grid_deg.is_some_and(|g| (g - deg).abs() > 1e-12)
            || source.as_ref().is_some_and(|s| *s != src)
        {
            return Err(AtlasError::Mixed);
        }
        grid_deg = Some(deg);
        source = Some(src);
        dates.insert(date.to_string());
        files.push(json!({"name": name, "sha256": sha256_hex(text.as_bytes()), "date": date}));
        for f in features {
            let pr = &f["properties"];
            let (Some(i), Some(j), Some(status)) = (
                pr["cell_i"].as_i64(),
                pr["cell_j"].as_i64(),
                pr["status"].as_str(),
            ) else {
                continue;
            };
            let e = cells.entry((i, j)).or_default();
            match status {
                "degraded" | "anomalous" => {
                    e.0.insert(date.to_string());
                    e.1.insert(date.to_string());
                }
                "not_degraded" | "not_anomalous" => {
                    e.0.insert(date.to_string());
                }
                _ => {}
            }
        }
    }
    let deg = grid_deg.unwrap_or(0.5);
    let bounds = |i: i64, j: i64| {
        let s = i as f64 * deg - 90.0;
        let w = j as f64 * deg - 180.0;
        (s, w, (s + deg).min(90.0), (w + deg).min(180.0))
    };
    let mut cell_rows = Vec::new();
    let mut persistent: BTreeSet<(i64, i64)> = BTreeSet::new();
    for ((i, j), (called, degr)) in &cells {
        if called.is_empty() {
            continue;
        }
        let per = degr.len() as f64 / called.len() as f64;
        if degr.len() >= p.min_days && per >= p.min_persistence {
            persistent.insert((*i, *j));
        }
        cell_rows.push(json!({
            "cell_i": i, "cell_j": j,
            "days_called": called.len(), "days_degraded": degr.len(),
            "persistence": (per * 1e4).round() / 1e4,
            "persistence_ci95": wilson95(degr.len(), called.len()).map(|(a, b)| json!([(a * 1e4).round() / 1e4, (b * 1e4).round() / 1e4])),
            "first_degraded": degr.iter().next(), "last_degraded": degr.iter().next_back(),
        }));
    }
    // Zones: 8-connected groups of persistent cells.
    let mut seen = BTreeSet::new();
    let mut zones = Vec::new();
    for start in &persistent {
        if seen.contains(start) {
            continue;
        }
        let mut stack = vec![*start];
        let mut members = Vec::new();
        seen.insert(*start);
        while let Some((i, j)) = stack.pop() {
            members.push((i, j));
            for di in -1..=1 {
                for dj in -1..=1 {
                    let n = (i + di, j + dj);
                    if persistent.contains(&n) && seen.insert(n) {
                        stack.push(n);
                    }
                }
            }
        }
        members.sort();
        let (mut s, mut w, mut nn, mut e) = (90.0f64, 180.0f64, -90.0f64, -180.0f64);
        let mut days = BTreeSet::new();
        for (i, j) in &members {
            let b = bounds(*i, *j);
            s = s.min(b.0);
            w = w.min(b.1);
            nn = nn.max(b.2);
            e = e.max(b.3);
            days.extend(cells[&(*i, *j)].1.iter().cloned());
        }
        zones.push(json!({
            "cells": members.len(),
            "bbox": [w, s, e, nn],
            "days_degraded_any_cell": days.len(),
            "first_degraded": days.iter().next(), "last_degraded": days.iter().next_back(),
            "members": members.iter().map(|(i, j)| json!([i, j])).collect::<Vec<_>>(),
        }));
    }
    for (k, z) in zones.iter_mut().enumerate() {
        z["zone"] = json!(format!("Z{:03}", k + 1));
    }
    let body = json!({
        "schema": ATLAS_SCHEMA,
        "label": "MODELLED",
        "note": "a summary of the map's own daily calls; persistence is not a cause, and a zone names none",
        "method": {"id": METHOD_ID, "min_days": p.min_days, "min_persistence": p.min_persistence, "connectivity": "8-neighbour"},
        "source": source,
        "grid": {"cell_deg": deg},
        "dates": {"first": dates.iter().next(), "last": dates.iter().next_back(), "count": dates.len()},
        "inputs": files,
        "previous_version": previous,
        "cells": cell_rows,
        "zones": zones,
    });
    let version = sha256_hex(canonical(&body).as_bytes());
    let mut out = body;
    out["version"] = json!(version);
    Ok(out)
}

/// Recompute an atlas's version; `Ok(true)` when it matches.
pub fn verify(atlas: &Value) -> bool {
    let Some(v) = atlas["version"].as_str() else {
        return false;
    };
    let mut body = atlas.clone();
    if let Some(o) = body.as_object_mut() {
        o.remove("version");
    }
    sha256_hex(canonical(&body).as_bytes()) == v
}

// ─────────────────────────────── C/N0 layer ───────────────────────────────

/// C/N0 layer parameters (pre-registered).
#[derive(Clone, Debug, PartialEq)]
pub struct CorsParams {
    pub drop_db: f64,
    pub min_sats: usize,
    pub join_s: f64,
}

impl CorsParams {
    pub const PREREGISTERED_V1: CorsParams = CorsParams {
        drop_db: 6.0,
        min_sats: 4,
        join_s: 120.0,
    };
}

/// The first band-1 GPS C/N0 code with values (`S1C`, `S1W`, `S1X`, ...).
fn cn0_series(o: &RinexObs) -> BTreeMap<(String, i64), f64> {
    let mut out = BTreeMap::new();
    let Some(codes) = o.header.codes_for('G') else {
        return out;
    };
    let Some(k) = codes.iter().position(|c| c.starts_with("S1")) else {
        return out;
    };
    for ep in &o.epochs {
        let t = (ep.time.seconds_from_gps_epoch() * 10.0).round() as i64; // decisecond key
        for sv in &ep.sats {
            if !sv.sat.starts_with('G') {
                continue;
            }
            if let Some(Some(v)) = sv.obs.get(k) {
                if v.value > 0.0 && v.value < 80.0 {
                    out.insert((sv.sat.clone(), t), v.value);
                }
            }
        }
    }
    out
}

/// The C/N0 layer of `today` against `earlier` (see the module documentation).
pub fn cors_layer(
    today: &RinexObs,
    earlier: &RinexObs,
    p: &CorsParams,
) -> Result<Value, AtlasError> {
    let a = cn0_series(today);
    let b = cn0_series(earlier);
    let interval = today.header.interval_s.unwrap_or(30.0).max(0.1);
    // Index the earlier file by satellite for a nearest-time lookup.
    let mut by_sat: BTreeMap<&str, BTreeMap<i64, f64>> = BTreeMap::new();
    for ((s, t), v) in &b {
        by_sat.entry(s.as_str()).or_default().insert(*t, *v);
    }
    let mut epochs: BTreeMap<i64, Vec<f64>> = BTreeMap::new();
    for ((s, t), v) in &a {
        let Some(series) = by_sat.get(s.as_str()) else {
            continue;
        };
        let target = *t - (GPS_REPEAT_S * 10.0).round() as i64;
        let tol = (interval * 5.0).round() as i64; // half an interval, in deciseconds
        let near = series
            .range(target - tol..=target + tol)
            .min_by_key(|(k, _)| (**k - target).abs())
            .map(|(_, v)| *v);
        if let Some(prev) = near {
            epochs.entry(*t).or_default().push(prev - v);
        }
    }
    if epochs.is_empty() {
        return Err(AtlasError::NoCn0);
    }
    let mut rows = Vec::new();
    let mut flagged_t = Vec::new();
    for (t, mut d) in epochs {
        d.sort_by(f64::total_cmp);
        let med = d[d.len() / 2];
        let flag = d.len() >= p.min_sats && med >= p.drop_db;
        if flag {
            flagged_t.push(t as f64 / 10.0);
        }
        rows.push(json!({"t_gps_s": t as f64 / 10.0, "satellites": d.len(), "median_drop_db": (med * 100.0).round() / 100.0, "flagged": flag}));
    }
    let mut intervals: Vec<(f64, f64, usize)> = Vec::new();
    for t in flagged_t {
        match intervals.last_mut() {
            Some(iv) if t - iv.1 <= p.join_s => {
                iv.1 = t;
                iv.2 += 1;
            }
            _ => intervals.push((t, t, 1)),
        }
    }
    Ok(json!({
        "schema": CORS_SCHEMA,
        "label": "MODELLED",
        "note": "GPS C/N0 against the same satellite one ground-track repeat earlier at the same station; a simultaneous drop on many satellites is flagged, with no cause named",
        "method": {"id": METHOD_ID, "repeat_s": GPS_REPEAT_S, "drop_db": p.drop_db, "min_sats": p.min_sats, "join_s": p.join_s},
        "station_xyz": today.header.approx_xyz,
        "epochs_compared": rows.len(),
        "intervals": intervals.iter().map(|(a, b, n)| json!({"start_gps_s": a, "end_gps_s": b, "epochs": n})).collect::<Vec<_>>(),
        "epochs": rows,
    }))
}

/// Set a station's layer beside the ADS-B day product's cell containing `(lat, lon)`.
pub fn ground_vs_airborne(layer: &Value, day_product: &Value, lat: f64, lon: f64) -> Value {
    let meta = &day_product["kshana_interference_map"];
    let deg = meta["grid"]["cell_deg"].as_f64().unwrap_or(0.5);
    let grid = crate::interference_map::grid::Grid::new(deg);
    let cell = grid.map(|g| g.cell_of(lat, lon));
    let status = cell.and_then(|c| {
        day_product["features"].as_array().and_then(|fs| {
            fs.iter()
                .find(|f| {
                    f["properties"]["cell_i"].as_i64() == Some(c.i as i64)
                        && f["properties"]["cell_j"].as_i64() == Some(c.j as i64)
                })
                .and_then(|f| f["properties"]["status"].as_str().map(str::to_string))
        })
    });
    let ground = layer["intervals"].as_array().is_some_and(|a| !a.is_empty());
    let class = match status.as_deref() {
        Some("degraded") => {
            if ground {
                "both"
            } else {
                "airborne_only"
            }
        }
        Some("not_degraded") => {
            if ground {
                "ground_only"
            } else {
                "neither"
            }
        }
        _ => "not_observed",
    };
    json!({
        "date": meta["date"],
        "cell": cell.map(|c| json!([c.i, c.j])),
        "airborne_status": status,
        "ground_flagged": ground,
        "comparison": class,
    })
}

// ─────────────────────────────── CLI ───────────────────────────────

/// `kshana interference-atlas <build|verify|cors> ...`; returns the exit code (1 when `verify`
/// finds a changed atlas).
pub fn run_cli(args: &[String]) -> i32 {
    match run_inner(args) {
        Ok(c) => c,
        Err(e) => {
            eprintln!("{e}");
            2
        }
    }
}

fn atlas_err(e: AtlasError) -> String {
    match e {
        AtlasError::NotAProduct(n) => crate::terr!("e-interference-atlas-not-a-product", path = n),
        AtlasError::Mixed => crate::terr!("e-interference-atlas-mixed"),
        AtlasError::Empty => crate::terr!("e-interference-atlas-empty"),
        AtlasError::NoCn0 => crate::terr!("e-interference-atlas-no-cn0"),
    }
}

fn run_inner(args: &[String]) -> Result<i32, String> {
    let usage = || crate::t!("interference-atlas-usage");
    let Some(sub) = args.first() else {
        return Err(usage());
    };
    if args.iter().any(|a| a == "--help" || a == "-h") {
        println!("{}", usage());
        return Ok(0);
    }
    let mut opts: BTreeMap<&str, String> = BTreeMap::new();
    let mut pos = Vec::new();
    let mut i = 1;
    while i < args.len() {
        let a = args[i].as_str();
        match a {
            "--out" | "--previous" | "--baseline" | "--adsb-day" | "--station" => {
                i += 1;
                let v = args.get(i).cloned().ok_or_else(|| {
                    crate::terr!("e-interference-atlas-missing-value", option = a)
                })?;
                opts.insert(a, v);
            }
            s if s.starts_with('-') => {
                return Err(crate::terr!(
                    "e-interference-atlas-unknown-option",
                    option = s
                ))
            }
            s => pos.push(s.to_string()),
        }
        i += 1;
    }
    let read = |p: &str| {
        std::fs::read_to_string(p)
            .map_err(|e| crate::terr!("e-interference-atlas-cannot-read", path = p, e = e))
    };
    let emit = |doc: &Value| -> Result<(), String> {
        let s = serde_json::to_string_pretty(doc).unwrap_or_default() + "\n";
        match opts.get("--out") {
            Some(p) => std::fs::write(p, s).map_err(|e| {
                crate::terr!(
                    "e-interference-atlas-cannot-write",
                    path = p.as_str(),
                    e = e
                )
            }),
            None => {
                print!("{s}");
                Ok(())
            }
        }
    };
    let parse_json = |p: &str| -> Result<Value, String> {
        serde_json::from_str(&read(p)?)
            .map_err(|_| atlas_err(AtlasError::NotAProduct(p.to_string())))
    };
    match sub.as_str() {
        "build" => {
            if pos.is_empty() {
                return Err(usage());
            }
            let mut inputs = Vec::new();
            for p in &pos {
                inputs.push((p.clone(), read(p)?));
            }
            let prev = match opts.get("--previous") {
                Some(p) => {
                    let v = parse_json(p)?;
                    if !verify(&v) {
                        return Err(crate::terr!(
                            "e-interference-atlas-changed",
                            path = p.as_str()
                        ));
                    }
                    v["version"].as_str().map(str::to_string)
                }
                None => None,
            };
            let doc = build(&inputs, &AtlasParams::PREREGISTERED_V1, prev.as_deref())
                .map_err(atlas_err)?;
            eprintln!(
                "{}",
                crate::t!(
                    "interference-atlas-built",
                    n_cells = doc["cells"].as_array().map_or(0, Vec::len),
                    n_zones = doc["zones"].as_array().map_or(0, Vec::len),
                    version = doc["version"]
                        .as_str()
                        .unwrap_or("")
                        .chars()
                        .take(12)
                        .collect::<String>()
                )
            );
            emit(&doc)?;
            Ok(0)
        }
        "verify" => {
            let [p] = pos.as_slice() else {
                return Err(usage());
            };
            let ok = verify(&parse_json(p)?);
            if ok {
                println!(
                    "{}",
                    crate::t!("interference-atlas-verified", path = p.as_str())
                );
                Ok(0)
            } else {
                eprintln!(
                    "{}",
                    crate::terr!("e-interference-atlas-changed", path = p.as_str())
                );
                Ok(1)
            }
        }
        "cors" => {
            let [p] = pos.as_slice() else {
                return Err(usage());
            };
            let Some(base) = opts.get("--baseline") else {
                return Err(usage());
            };
            let obs = |path: &str| -> Result<RinexObs, String> {
                crate::rinex_obs::parse_obs(&read(path)?)
                    .map_err(|e| crate::terr!("e-interference-atlas-bad-obs", path = path, e = e))
            };
            let (today, earlier) = (obs(p)?, obs(base)?);
            let mut layer =
                cors_layer(&today, &earlier, &CorsParams::PREREGISTERED_V1).map_err(atlas_err)?;
            if let Some(day) = opts.get("--adsb-day") {
                let prod = parse_json(day)?;
                let (lat, lon) = match opts.get("--station") {
                    Some(s) => {
                        let v: Vec<f64> =
                            s.split(',').filter_map(|x| x.trim().parse().ok()).collect();
                        match v.as_slice() {
                            [a, b, ..] if a.abs() <= 90.0 && b.abs() <= 180.0 => (*a, *b),
                            _ => {
                                return Err(crate::terr!(
                                    "e-interference-atlas-bad-station",
                                    value = s.as_str()
                                ))
                            }
                        }
                    }
                    None => {
                        let xyz = today.header.approx_xyz.ok_or_else(|| {
                            crate::terr!("e-interference-atlas-bad-station", value = "-")
                        })?;
                        let g = crate::frames::ecef_to_geodetic(xyz);
                        (g.lat_rad.to_degrees(), g.lon_rad.to_degrees())
                    }
                };
                layer["ground_vs_airborne"] = ground_vs_airborne(&layer, &prod, lat, lon);
            }
            emit(&layer)?;
            Ok(0)
        }
        _ => Err(usage()),
    }
}
