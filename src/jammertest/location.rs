// SPDX-License-Identifier: AGPL-3.0-only
//! Location metrics for the referee (0.41 row B2): where a monitoring network said an emitter was,
//! scored against where it was.
//!
//! The definitions are fixed in `docs/design/evidence/b2-referee-metrics/PREREGISTRATION.md`, with
//! the readings recorded before this code in `xval/referee-location/README.md`. For each report: the
//! event it belongs to (by identifier, or by time window and nearest truth), whether it is scored
//! (a point estimate, inside the event's on-air window, truth defined), the horizontal geodesic error
//! and the vertical error, and for each region (an ellipse with its covariance, a polygon, or a set of
//! grid cells) whether it contains the truth and its size. Per event and pooled: median and 90th
//! percentile error, coverage rate per level with its binomial check, median region size, time to
//! first location, time to locate within each radius, and false locations per hour of clean time.
//!
//! This scores arithmetic and definitions. It says nothing about any locator's accuracy. Nothing
//! here changes the existing referee (`score.rs`): a run without location input is untouched.

use crate::portable_math::PortableFloat;
use serde::{Deserialize, Serialize};
use std::collections::BTreeMap;

const A: f64 = 6_378_137.0;
const F: f64 = 1.0 / 298.257_223_563;

/// A position: WGS 84 latitude and longitude (degrees), height above the ellipsoid (m).
#[derive(Clone, Copy, Debug, Deserialize, Serialize, PartialEq)]
#[serde(deny_unknown_fields)]
pub struct Pos {
    /// Latitude, degrees.
    pub lat: f64,
    /// Longitude, degrees.
    pub lon: f64,
    /// Height above the ellipsoid, m (absent: not stated).
    #[serde(default)]
    pub h: Option<f64>,
}

/// One point of a moving source's track.
#[derive(Clone, Copy, Debug, Deserialize, Serialize, PartialEq)]
#[serde(deny_unknown_fields)]
pub struct TrackPoint {
    /// Unix time, s.
    pub t: f64,
    /// Latitude, degrees.
    pub lat: f64,
    /// Longitude, degrees.
    pub lon: f64,
    /// Height, m.
    #[serde(default)]
    pub h: Option<f64>,
}

/// One interference event.
#[derive(Clone, Debug, Deserialize, Serialize)]
#[serde(deny_unknown_fields)]
pub struct Event {
    /// Identifier.
    pub id: String,
    /// Onset, Unix s.
    pub t_on: f64,
    /// End, Unix s.
    pub t_off: f64,
    /// A fixed position, or
    #[serde(default)]
    pub position: Option<Pos>,
    /// a time-tagged track.
    #[serde(default)]
    pub track: Option<Vec<TrackPoint>>,
}

/// The observation span.
#[derive(Clone, Copy, Debug, Deserialize, Serialize)]
#[serde(deny_unknown_fields)]
pub struct Span {
    /// Start, Unix s.
    pub start: f64,
    /// End, Unix s.
    pub end: f64,
}

/// The truth file (`kshana.referee-location-truth/1`).
#[derive(Clone, Debug, Deserialize, Serialize)]
#[serde(deny_unknown_fields)]
pub struct Truth {
    /// Schema id.
    pub schema: String,
    /// Attribution guard, s.
    pub guard_s: f64,
    /// Time-to-locate hold, s.
    pub hold_s: f64,
    /// Time-to-locate radii, m.
    pub radii_m: Vec<f64>,
    /// Region levels scored.
    pub levels: Vec<f64>,
    /// The observation span (for clean time).
    pub observation: Span,
    /// The events.
    pub events: Vec<Event>,
}

/// An ellipse region: centre and 1-sigma covariance in the local east-north plane (m²).
#[derive(Clone, Debug, Deserialize, Serialize)]
#[serde(deny_unknown_fields)]
pub struct Ellipse {
    /// Centre latitude, degrees.
    pub lat: f64,
    /// Centre longitude, degrees.
    pub lon: f64,
    /// Centre height, m.
    #[serde(default)]
    pub h: Option<f64>,
    /// `[[σee, σen], [σne, σnn]]`, m².
    pub cov_en: [[f64; 2]; 2],
}

/// A set of latitude-longitude grid cells.
#[derive(Clone, Debug, Deserialize, Serialize)]
#[serde(deny_unknown_fields)]
pub struct GridCells {
    /// Cell size, degrees.
    pub cell_deg: f64,
    /// Cells `[i, j]`: latitudes `[i·c, (i+1)·c)`, longitudes `[j·c, (j+1)·c)`.
    pub cells: Vec<[i64; 2]>,
}

/// A region at a stated level: one of an ellipse, a polygon or a grid set.
#[derive(Clone, Debug, Deserialize, Serialize)]
#[serde(deny_unknown_fields)]
pub struct Region {
    /// The level the region is stated at (0.95 for a 95 % region).
    pub level: f64,
    /// An ellipse.
    #[serde(default)]
    pub ellipse: Option<Ellipse>,
    /// A simple polygon, `[lat, lon]` vertices.
    #[serde(default)]
    pub polygon: Option<Vec<[f64; 2]>>,
    /// Grid cells.
    #[serde(default)]
    pub grid: Option<GridCells>,
}

/// One report of a monitoring network.
#[derive(Clone, Debug, Deserialize, Serialize)]
#[serde(deny_unknown_fields)]
pub struct Report {
    /// Unix time, s.
    pub t: f64,
    /// The event it names, if it names one.
    #[serde(default)]
    pub event: Option<String>,
    /// The point estimate, if any.
    #[serde(default)]
    pub point: Option<Pos>,
    /// Its regions.
    #[serde(default)]
    pub regions: Vec<Region>,
}

/// The reports file (`kshana.referee-location-reports/1`).
#[derive(Clone, Debug, Deserialize, Serialize)]
#[serde(deny_unknown_fields)]
pub struct Reports {
    /// Schema id.
    pub schema: String,
    /// The reports, in time order.
    pub reports: Vec<Report>,
}

/// A region's score.
#[derive(Clone, Debug, Serialize, PartialEq)]
pub struct RegionScore {
    /// Its level.
    pub level: f64,
    /// `ellipse`, `polygon` or `grid`.
    pub kind: &'static str,
    /// Whether it contains the truth.
    pub contains: bool,
    /// Its area, m².
    pub area_m2: f64,
}

/// A report's score.
#[derive(Clone, Debug, Serialize, PartialEq)]
pub struct ReportScore {
    /// Index in the reports file.
    pub index: usize,
    /// The event it is attributed to (`null`: a false location).
    pub event: Option<String>,
    /// Whether it is scored.
    pub scored: bool,
    /// Horizontal geodesic error, m (scored reports).
    #[serde(skip_serializing_if = "Option::is_none")]
    pub e_m: Option<f64>,
    /// Vertical error, m (scored reports; `null` without both heights).
    #[serde(skip_serializing_if = "Option::is_none")]
    pub v_m: Option<Option<f64>>,
    /// Region scores (scored reports).
    #[serde(skip_serializing_if = "Option::is_none")]
    pub regions: Option<Vec<RegionScore>>,
}

/// Coverage at one level.
#[derive(Clone, Debug, Serialize, PartialEq)]
pub struct Coverage {
    /// Regions at this level on scored reports.
    pub n: usize,
    /// Of which contain the truth.
    pub h: usize,
    /// `h / n`.
    pub rate: Option<f64>,
    /// The largest `k` with `P(Bin(n, p) ≥ k) ≥ 0.95`.
    pub k_min: usize,
    /// `h ≥ k_min`.
    pub binomial_ok: Option<bool>,
}

/// Aggregates of an event or of the pooled set.
#[derive(Clone, Debug, Serialize, PartialEq)]
pub struct Aggregate {
    /// Event id (absent when pooled).
    #[serde(skip_serializing_if = "Option::is_none")]
    pub id: Option<String>,
    /// Reports attributed.
    pub n_reports: usize,
    /// Of which scored.
    pub n_scored: usize,
    /// Median error, m.
    pub median_e_m: Option<f64>,
    /// 90th percentile error, m.
    pub p90_e_m: Option<f64>,
    /// Coverage per level.
    pub coverage: BTreeMap<String, Coverage>,
    /// Median region area per level, m².
    pub median_area_m2: BTreeMap<String, Option<f64>>,
    /// Time to first location, s (events).
    #[serde(skip_serializing_if = "Option::is_none")]
    pub ttfl_s: Option<Option<f64>>,
    /// Time to locate per radius, s (events).
    #[serde(skip_serializing_if = "Option::is_none")]
    pub ttl_s: Option<BTreeMap<String, Option<f64>>>,
    /// Whether the event was located at all (events).
    #[serde(skip_serializing_if = "Option::is_none")]
    pub located: Option<bool>,
    /// Events never located (pooled).
    #[serde(skip_serializing_if = "Option::is_none")]
    pub n_not_located: Option<usize>,
    /// Median time to first location over the located events, s (pooled).
    #[serde(skip_serializing_if = "Option::is_none")]
    pub ttfl_median_s: Option<Option<f64>>,
    /// Median time to locate per radius, s (pooled).
    #[serde(skip_serializing_if = "Option::is_none")]
    pub ttl_median_s: Option<BTreeMap<String, Option<f64>>>,
}

/// False locations.
#[derive(Clone, Debug, Serialize, PartialEq)]
pub struct FalseLocations {
    /// Reports attributed to no event.
    pub count: usize,
    /// Clean time, s.
    pub clean_s: f64,
    /// Per hour of clean time.
    pub per_hour: Option<f64>,
}

/// The whole score (`kshana.referee-location/1`).
#[derive(Clone, Debug, Serialize, PartialEq)]
pub struct LocationScore {
    /// Schema id.
    pub schema: &'static str,
    /// Per report.
    pub reports: Vec<ReportScore>,
    /// Per event.
    pub events: Vec<Aggregate>,
    /// Pooled over every event.
    pub pooled: Aggregate,
    /// False locations.
    pub false_locations: FalseLocations,
}

// ------------------------------------------------------------------ frames

fn e2() -> f64 {
    F * (2.0 - F)
}

fn to_ecef(lat: f64, lon: f64, h: f64) -> [f64; 3] {
    let (la, lo) = (lat.to_radians(), lon.to_radians());
    let (sla, cla) = (la.psin(), la.pcos());
    let n = A / (1.0 - e2() * sla * sla).sqrt();
    [
        (n + h) * cla * lo.pcos(),
        (n + h) * cla * lo.psin(),
        (n * (1.0 - e2()) + h) * sla,
    ]
}

fn from_ecef(x: [f64; 3]) -> (f64, f64, f64) {
    let p = x[0].phypot(x[1]);
    let lon = x[1].patan2(x[0]).to_degrees();
    let mut lat = x[2].patan2(p * (1.0 - e2()));
    for _ in 0..50 {
        let n = A / (1.0 - e2() * lat.psin() * lat.psin()).sqrt();
        let h = p / lat.pcos() - n;
        let new = x[2].patan2(p * (1.0 - e2() * n / (n + h)));
        if (new - lat).abs() < 1e-15 {
            lat = new;
            break;
        }
        lat = new;
    }
    let n = A / (1.0 - e2() * lat.psin() * lat.psin()).sqrt();
    let h = p / lat.pcos() - n;
    (lat.to_degrees(), lon, h)
}

/// East, north and up of `p` in the local frame at `o`.
fn enu(o: (f64, f64, f64), p: (f64, f64, f64)) -> [f64; 3] {
    let (la, lo) = (o.0.to_radians(), o.1.to_radians());
    let a = to_ecef(p.0, p.1, p.2);
    let b = to_ecef(o.0, o.1, o.2);
    let d = [a[0] - b[0], a[1] - b[1], a[2] - b[2]];
    let (sla, cla, slo, clo) = (la.psin(), la.pcos(), lo.psin(), lo.pcos());
    [
        -slo * d[0] + clo * d[1],
        -sla * clo * d[0] - sla * slo * d[1] + cla * d[2],
        cla * clo * d[0] + cla * slo * d[1] + sla * d[2],
    ]
}

// ------------------------------------------------------------------ truth

fn truth_at(ev: &Event, t: f64) -> Option<(f64, f64, f64)> {
    if let Some(p) = ev.position {
        return Some((p.lat, p.lon, p.h.unwrap_or(0.0)));
    }
    let tr = ev.track.as_ref()?;
    let (first, last) = (tr.first()?, tr.last()?);
    if t < first.t || t > last.t {
        return None;
    }
    for w in tr.windows(2) {
        let (a, b) = (w[0], w[1]);
        if a.t <= t && t <= b.t {
            let s = if b.t == a.t {
                0.0
            } else {
                (t - a.t) / (b.t - a.t)
            };
            let xa = to_ecef(a.lat, a.lon, a.h.unwrap_or(0.0));
            let xb = to_ecef(b.lat, b.lon, b.h.unwrap_or(0.0));
            return Some(from_ecef([
                xa[0] + s * (xb[0] - xa[0]),
                xa[1] + s * (xb[1] - xa[1]),
                xa[2] + s * (xb[2] - xa[2]),
            ]));
        }
    }
    None
}

fn truth_has_h(ev: &Event) -> bool {
    match (&ev.position, &ev.track) {
        (Some(p), _) => p.h.is_some(),
        (None, Some(tr)) => tr.iter().all(|p| p.h.is_some()),
        _ => false,
    }
}

fn truth_for_choice(ev: &Event, t: f64) -> (f64, f64, f64) {
    if let Some(p) = truth_at(ev, t) {
        return p;
    }
    let tr = ev.track.as_deref().unwrap_or(&[]);
    let q = tr
        .iter()
        .min_by(|a, b| (a.t - t).abs().total_cmp(&(b.t - t).abs()))
        .copied()
        .unwrap_or(TrackPoint {
            t,
            lat: 0.0,
            lon: 0.0,
            h: None,
        });
    (q.lat, q.lon, q.h.unwrap_or(0.0))
}

// ------------------------------------------------------------------ regions

fn chi2(p: f64) -> f64 {
    -2.0 * (1.0 - p).pln()
}

fn check_cov(e: &Ellipse) -> Result<(), String> {
    let [[a, b], [c, d]] = e.cov_en;
    let sym = (b - c).abs() <= 1e-9 * b.abs().max(c.abs()).max(1.0);
    if !(sym
        && a > 0.0
        && d > 0.0
        && a * d - b * c > 0.0
        && [a, b, c, d].iter().all(|x| x.is_finite()))
    {
        return Err(crate::terr!("e-referee-location-covariance"));
    }
    Ok(())
}

fn ellipse_eval(e: &Ellipse, truth: (f64, f64, f64), level: f64) -> (bool, f64) {
    let centre = (e.lat, e.lon, e.h.unwrap_or(0.0));
    let d = enu(centre, truth);
    let [[a, b], [c, dd]] = e.cov_en;
    let det = a * dd - b * c;
    // d' S^-1 d with S^-1 = [[dd, -b], [-c, a]] / det.
    let q = (d[0] * (dd * d[0] - b * d[1]) + d[1] * (-c * d[0] + a * d[1])) / det;
    let area = std::f64::consts::PI * det.sqrt() * chi2(level);
    (q <= chi2(level), area)
}

fn polygon_plane(v: &[[f64; 2]]) -> ((f64, f64, f64), Vec<[f64; 2]>) {
    let lon0 = v[0][1];
    let lons: Vec<f64> = v
        .iter()
        .map(|p| {
            let mut lo = p[1];
            while lo - lon0 > 180.0 {
                lo -= 360.0;
            }
            while lo - lon0 < -180.0 {
                lo += 360.0;
            }
            lo
        })
        .collect();
    let n = v.len() as f64;
    let origin = (
        v.iter().map(|p| p[0]).sum::<f64>() / n,
        lons.iter().sum::<f64>() / n,
        0.0,
    );
    let pts = v
        .iter()
        .map(|p| {
            let e = enu(origin, (p[0], p[1], 0.0));
            [e[0], e[1]]
        })
        .collect();
    (origin, pts)
}

fn polygon_eval(v: &[[f64; 2]], truth: (f64, f64, f64)) -> (bool, f64) {
    if v.len() < 3 {
        return (false, 0.0);
    }
    let (origin, pts) = polygon_plane(v);
    let t = enu(origin, truth);
    let (x, y) = (t[0], t[1]);
    let n = pts.len();
    let mut on_edge = false;
    for i in 0..n {
        let (a, b) = (pts[i], pts[(i + 1) % n]);
        let ab = [b[0] - a[0], b[1] - a[1]];
        let len2 = ab[0] * ab[0] + ab[1] * ab[1];
        let s = if len2 > 0.0 {
            (((x - a[0]) * ab[0] + (y - a[1]) * ab[1]) / len2).clamp(0.0, 1.0)
        } else {
            0.0
        };
        if (x - (a[0] + s * ab[0])).phypot(y - (a[1] + s * ab[1])) <= 1e-6 {
            on_edge = true;
            break;
        }
    }
    let mut inside = false;
    for i in 0..n {
        let (a, b) = (pts[i], pts[(i + 1) % n]);
        if (a[1] > y) != (b[1] > y) {
            let xc = a[0] + (y - a[1]) * (b[0] - a[0]) / (b[1] - a[1]);
            if x < xc {
                inside = !inside;
            }
        }
    }
    let mut s = 0.0;
    for i in 0..n {
        let (a, b) = (pts[i], pts[(i + 1) % n]);
        s += a[0] * b[1] - b[0] * a[1];
    }
    (on_edge || inside, s.abs() / 2.0)
}

fn q_auth(phi: f64) -> f64 {
    let e = e2().sqrt();
    let s = phi.psin();
    s / (1.0 - e2() * s * s) + ((1.0 + e * s) / (1.0 - e * s)).pln() / (2.0 * e)
}

fn grid_eval(g: &GridCells, truth: (f64, f64, f64)) -> (bool, f64) {
    let c = g.cell_deg;
    let lon = (truth.1 + 180.0).rem_euclid(360.0) - 180.0;
    let cell = [(truth.0 / c).floor() as i64, (lon / c).floor() as i64];
    let area = g
        .cells
        .iter()
        .map(|&[i, _]| {
            let (p1, p2) = (
                (i as f64 * c).to_radians(),
                ((i + 1) as f64 * c).to_radians(),
            );
            A * A * (1.0 - e2()) * c.to_radians() * (q_auth(p2) - q_auth(p1)) / 2.0
        })
        .sum();
    (g.cells.contains(&cell), area)
}

fn region_eval(r: &Region, truth: (f64, f64, f64)) -> Result<RegionScore, String> {
    let (kind, (contains, area)) = match (&r.ellipse, &r.polygon, &r.grid) {
        (Some(e), None, None) => ("ellipse", ellipse_eval(e, truth, r.level)),
        (None, Some(p), None) => ("polygon", polygon_eval(p, truth)),
        (None, None, Some(g)) => ("grid", grid_eval(g, truth)),
        _ => return Err(crate::terr!("e-referee-location-region")),
    };
    Ok(RegionScore {
        level: r.level,
        kind,
        contains,
        area_m2: area,
    })
}

// ------------------------------------------------------------------ statistics

/// numpy `percentile` with the `linear` method.
fn percentile(xs: &[f64], q: f64) -> Option<f64> {
    if xs.is_empty() {
        return None;
    }
    let mut v = xs.to_vec();
    v.sort_by(f64::total_cmp);
    let pos = (v.len() - 1) as f64 * q / 100.0;
    let lo = pos.floor() as usize;
    let hi = (lo + 1).min(v.len() - 1);
    let frac = pos - lo as f64;
    Some(v[lo] + (v[hi] - v[lo]) * frac)
}

/// The largest `k` with `P(Bin(n, p) ≥ k) ≥ 0.95`.
fn binom_k(n: usize, p: f64) -> usize {
    if n == 0 {
        return 0;
    }
    let lg = |x: f64| libm::lgamma(x);
    let logs: Vec<f64> = (0..=n)
        .map(|i| {
            let i_f = i as f64;
            lg(n as f64 + 1.0) - lg(i_f + 1.0) - lg((n - i) as f64 + 1.0)
                + i_f * p.pln()
                + (n - i) as f64 * (1.0 - p).pln()
        })
        .collect();
    let m = logs.iter().copied().fold(f64::NEG_INFINITY, f64::max);
    let w: Vec<f64> = logs.iter().map(|x| (x - m).pexp()).collect();
    let tot: f64 = w.iter().sum();
    let mut tail = 0.0;
    for k in (0..=n).rev() {
        tail += w[k] / tot;
        if tail >= 0.95 {
            return k;
        }
    }
    0
}

fn level_key(l: f64) -> String {
    format!("{l}")
}

fn radius_key(r: f64) -> String {
    format!("{}", r as i64)
}

// ------------------------------------------------------------------ scoring

/// Score `reports` against `truth`. A malformed region or covariance is an error, not a miss.
pub fn score(truth: &Truth, reports: &[Report]) -> Result<LocationScore, String> {
    for r in reports {
        for g in &r.regions {
            if let Some(e) = &g.ellipse {
                check_cov(e)?;
            }
        }
    }
    let guard = truth.guard_s;
    let mut out = Vec::with_capacity(reports.len());
    let mut per_event: Vec<Vec<(f64, usize)>> = vec![Vec::new(); truth.events.len()];
    let mut false_count = 0usize;
    for (k, r) in reports.iter().enumerate() {
        let t = r.t;
        let ev_idx = match &r.event {
            Some(id) => Some(
                truth
                    .events
                    .iter()
                    .position(|e| &e.id == id)
                    .ok_or_else(|| crate::terr!("e-referee-location-event", id = id.clone()))?,
            ),
            None => {
                let cands: Vec<usize> = (0..truth.events.len())
                    .filter(|&i| {
                        let e = &truth.events[i];
                        e.t_on - guard <= t && t <= e.t_off + guard
                    })
                    .collect();
                match (cands.is_empty(), r.point) {
                    (true, _) => None,
                    (false, Some(p)) => cands.into_iter().min_by(|&a, &b| {
                        let da = truth_for_choice(&truth.events[a], t);
                        let db = truth_for_choice(&truth.events[b], t);
                        let ka = crate::geodesic::distance_m(p.lat, p.lon, da.0, da.1);
                        let kb = crate::geodesic::distance_m(p.lat, p.lon, db.0, db.1);
                        ka.total_cmp(&kb)
                            .then_with(|| truth.events[a].id.cmp(&truth.events[b].id))
                    }),
                    (false, None) => cands.into_iter().min_by(|&a, &b| {
                        truth.events[a]
                            .t_on
                            .total_cmp(&truth.events[b].t_on)
                            .then_with(|| truth.events[a].id.cmp(&truth.events[b].id))
                    }),
                }
            }
        };
        let Some(ei) = ev_idx else {
            false_count += 1;
            out.push(ReportScore {
                index: k,
                event: None,
                scored: false,
                e_m: None,
                v_m: None,
                regions: None,
            });
            continue;
        };
        let ev = &truth.events[ei];
        let mut rec = ReportScore {
            index: k,
            event: Some(ev.id.clone()),
            scored: false,
            e_m: None,
            v_m: None,
            regions: None,
        };
        if let (Some(p), true, Some(tr)) = (r.point, ev.t_on <= t && t <= ev.t_off, truth_at(ev, t))
        {
            rec.scored = true;
            rec.e_m = Some(crate::geodesic::distance_m(p.lat, p.lon, tr.0, tr.1));
            rec.v_m = Some(match (p.h, truth_has_h(ev)) {
                (Some(h), true) => Some(h - tr.2),
                _ => None,
            });
            rec.regions = Some(
                r.regions
                    .iter()
                    .map(|g| region_eval(g, tr))
                    .collect::<Result<_, _>>()?,
            );
        }
        out.push(rec);
        per_event[ei].push((t, k));
    }

    let aggregate = |items: &[(f64, usize)], ev: Option<&Event>| -> Aggregate {
        let scored: Vec<&ReportScore> = items
            .iter()
            .map(|&(_, k)| &out[k])
            .filter(|r| r.scored)
            .collect();
        let es: Vec<f64> = scored.iter().filter_map(|r| r.e_m).collect();
        let mut coverage = BTreeMap::new();
        let mut med_area = BTreeMap::new();
        for &lv in &truth.levels {
            let regs: Vec<&RegionScore> = scored
                .iter()
                .flat_map(|r| r.regions.iter().flatten())
                .filter(|g| g.level == lv)
                .collect();
            let n = regs.len();
            let h = regs.iter().filter(|g| g.contains).count();
            let k_min = binom_k(n, lv);
            coverage.insert(
                level_key(lv),
                Coverage {
                    n,
                    h,
                    rate: (n > 0).then(|| h as f64 / n as f64),
                    k_min,
                    binomial_ok: (n > 0).then_some(h >= k_min),
                },
            );
            let areas: Vec<f64> = regs.iter().map(|g| g.area_m2).collect();
            med_area.insert(level_key(lv), percentile(&areas, 50.0));
        }
        let mut agg = Aggregate {
            id: ev.map(|e| e.id.clone()),
            n_reports: items.len(),
            n_scored: scored.len(),
            median_e_m: percentile(&es, 50.0),
            p90_e_m: percentile(&es, 90.0),
            coverage,
            median_area_m2: med_area,
            ttfl_s: None,
            ttl_s: None,
            located: None,
            n_not_located: None,
            ttfl_median_s: None,
            ttl_median_s: None,
        };
        if let Some(ev) = ev {
            let mut by_time: Vec<(f64, usize)> = items.to_vec();
            by_time.sort_by(|a, b| a.0.total_cmp(&b.0));
            let ttfl = by_time
                .iter()
                .find(|&&(t, k)| reports[k].point.is_some() && ev.t_on <= t && t <= ev.t_off)
                .map(|&(t, _)| t - ev.t_on);
            let seq: Vec<(f64, &ReportScore)> = by_time
                .iter()
                .filter(|&&(_, k)| out[k].scored)
                .map(|&(t, k)| (t, &out[k]))
                .collect();
            let mut ttl = BTreeMap::new();
            for &rad in &truth.radii_m {
                let ok: Vec<bool> = seq
                    .iter()
                    .map(|(_, r)| {
                        let c95: Vec<&RegionScore> = r
                            .regions
                            .iter()
                            .flatten()
                            .filter(|g| g.level == 0.95)
                            .collect();
                        r.e_m.is_some_and(|e| e <= rad)
                            && !c95.is_empty()
                            && c95.iter().all(|g| g.contains)
                    })
                    .collect();
                let mut found = None;
                for i in 0..seq.len() {
                    if !ok[i] {
                        continue;
                    }
                    let mut m = i;
                    while m + 1 < seq.len() && ok[m + 1] {
                        m += 1;
                    }
                    if seq[m].0 - seq[i].0 >= truth.hold_s {
                        found = Some(seq[i].0 - ev.t_on);
                        break;
                    }
                }
                ttl.insert(radius_key(rad), found);
            }
            agg.ttfl_s = Some(ttfl);
            agg.ttl_s = Some(ttl);
            agg.located = Some(ttfl.is_some());
        }
        agg
    };

    let events: Vec<Aggregate> = truth
        .events
        .iter()
        .enumerate()
        .map(|(i, e)| aggregate(&per_event[i], Some(e)))
        .collect();
    let all: Vec<(f64, usize)> = per_event.iter().flatten().copied().collect();
    let mut pooled = aggregate(&all, None);
    pooled.n_not_located = Some(events.iter().filter(|a| a.located == Some(false)).count());
    let ttfls: Vec<f64> = events.iter().filter_map(|a| a.ttfl_s.flatten()).collect();
    pooled.ttfl_median_s = Some(percentile(&ttfls, 50.0));
    pooled.ttl_median_s = Some(
        truth
            .radii_m
            .iter()
            .map(|&r| {
                let v: Vec<f64> = events
                    .iter()
                    .filter_map(|a| a.ttl_s.as_ref().and_then(|m| m[&radius_key(r)]))
                    .collect();
                (radius_key(r), percentile(&v, 50.0))
            })
            .collect(),
    );

    // Clean time: the span minus the union of the guarded event windows.
    let span = truth.observation;
    let mut spans: Vec<(f64, f64)> = truth
        .events
        .iter()
        .map(|e| {
            (
                span.start.max(e.t_on - guard),
                span.end.min(e.t_off + guard),
            )
        })
        .collect();
    spans.sort_by(|a, b| a.0.total_cmp(&b.0).then(a.1.total_cmp(&b.1)));
    let mut busy = 0.0;
    let mut cur: Option<(f64, f64)> = None;
    for (a, b) in spans {
        if b <= a {
            continue;
        }
        match cur {
            Some((c0, c1)) if a <= c1 => cur = Some((c0, c1.max(b))),
            Some((c0, c1)) => {
                busy += c1 - c0;
                cur = Some((a, b));
            }
            None => cur = Some((a, b)),
        }
    }
    if let Some((c0, c1)) = cur {
        busy += c1 - c0;
    }
    let clean = span.end - span.start - busy;
    Ok(LocationScore {
        schema: "kshana.referee-location/1",
        reports: out,
        events,
        pooled,
        false_locations: FalseLocations {
            count: false_count,
            clean_s: clean,
            per_hour: (clean > 0.0).then(|| false_count as f64 / (clean / 3600.0)),
        },
    })
}

/// Score JSON text: the truth file and the reports file, as given to the command line, Python and
/// WebAssembly. Returns the score as JSON text (pretty-printed), the same bytes on every surface.
pub fn score_json(truth_json: &str, reports_json: &str) -> Result<String, String> {
    let truth: Truth = serde_json::from_str(truth_json)
        .map_err(|e| crate::terr!("e-referee-location-truth", e = e.to_string()))?;
    let reports: Reports = serde_json::from_str(reports_json)
        .map_err(|e| crate::terr!("e-referee-location-reports", e = e.to_string()))?;
    let s = score(&truth, &reports.reports)?;
    serde_json::to_string_pretty(&s).map_err(|e| e.to_string())
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn percentiles_and_the_binomial_minimum() {
        assert_eq!(percentile(&[3.0, 1.0, 2.0, 4.0], 50.0), Some(2.5));
        assert_eq!(percentile(&[1.0, 2.0, 3.0, 4.0, 5.0], 90.0), Some(4.6));
        assert_eq!(percentile(&[], 50.0), None);
        // n = 20, p = 0.95: P(Bin >= 18) = 0.9245 < 0.95 <= P(Bin >= 17) = 0.9841.
        assert_eq!(binom_k(20, 0.95), 17);
    }

    #[test]
    fn the_ellipse_anchor_area() {
        let e = Ellipse {
            lat: 0.0,
            lon: 0.0,
            h: None,
            cov_en: [[100.0f64.powi(2), 0.0], [0.0, 50.0f64.powi(2)]],
        };
        let (_, a) = ellipse_eval(&e, (0.0, 0.0, 0.0), 0.95);
        assert!((a - 94_113.705).abs() < 5e-4, "{a}");
    }
}
