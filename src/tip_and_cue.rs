// SPDX-License-Identifier: AGPL-3.0-only
//! Revisit and tip-and-cue latency of a two-layer survey: an RF survey layer whose detections cue
//! an optical layer (roadmap row M2).
//!
//! Each layer is a Walker star pattern of circular orbits (`T` satellites in `P` planes, phasing
//! `F`), placed and propagated by [`crate::constellation`] (two-body plus the secular J2 drift of
//! node and perigee, on a spherical rotating Earth). A point sees a satellite of the RF layer when
//! the satellite is at or above an elevation mask, and a satellite of the optical layer when the
//! point is within an off-nadir angle of it; on a sphere both are a bound on the central angle
//! between the point and the sub-satellite point, `γ ≤ arccos((R/r)·cos ε) − ε` and
//! `γ ≤ arcsin((r/R)·sin η) − η`, so each step is one dot product per satellite and point.
//!
//! From the access intervals (maximal runs of time steps with at least one satellite in view)
//! three figures follow, with the definitions and edge rules of
//! `xval/m2-revisit-tip-and-cue/README.md`:
//! - **R**, revisit: the mean gap between access intervals per point, area-weighted (`cos φ`);
//! - **F**, full-area refresh: from a start time, the wait until every point has been in view,
//!   averaged over start times on a 1 min grid;
//! - **Q**, RF-to-optical reaction: from the start of each RF access interval, the wait until the
//!   point is in the optical layer's field of regard, averaged per point and area-weighted.
//!
//! MODELLED: geometry and timing only (no link budget, detection, weather or tasking latency).
//! The access intervals are checked against an independent recomputation (bar M2-B0 of
//! `docs/design/evidence/m2-revisit-tip-and-cue/PREREGISTRATION.md`); the figures are a
//! cross-check of published simulation figures, never a validation.

use crate::body::Body;
use crate::constellation::{satellite_positions_fixed, Elements, WalkerPattern, WalkerSpec};
use crate::portable_math::PortableFloat;
use serde::{Deserialize, Serialize};
use std::f64::consts::PI;

const DEG: f64 = PI / 180.0;
/// Semi-major axis of the 550 km circular orbits (m): 550 km over the WGS 84 equatorial radius.
pub const A_M: f64 = 6_928_137.0;
/// Sun-synchronous inclination for 550 km, as the pre-registration states it (deg).
pub const INC_DEG: f64 = 97.59;
/// Julian date (UTC) of the run epoch, 2025-01-01 00:00:00.
pub const EPOCH_JD_UTC: f64 = 2_460_676.5;

/// The Baltic sea points of the M2 area (latitude, longitude in degrees), from
/// `data/tip-and-cue/baltic_sea_points.csv`.
pub fn baltic_points() -> Vec<(f64, f64)> {
    include_str!("../data/tip-and-cue/baltic_sea_points.csv")
        .lines()
        .filter(|l| !l.starts_with('#') && !l.starts_with("lat"))
        .filter_map(|l| {
            let (a, b) = l.split_once(',')?;
            Some((a.trim().parse().ok()?, b.trim().parse().ok()?))
        })
        .collect()
}

/// A Walker star layer.
#[derive(Clone, Copy, Debug, PartialEq, Serialize, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct Layer {
    /// Walker T: satellites.
    pub total: usize,
    /// Walker P: planes, nodes spread over 180°.
    pub planes: usize,
    /// Walker F: phasing factor.
    pub phasing: usize,
    /// Node of the first plane, in units of the plane spacing (0 for the RF layer, 0.5 for an
    /// optical layer interleaved with it).
    #[serde(default)]
    pub node_offset: f64,
}

impl Layer {
    /// The layer's element sets, plane by plane (see [`crate::constellation::WalkerSpec`]).
    pub fn elements(&self) -> Result<Vec<Elements>, String> {
        WalkerSpec {
            pattern: WalkerPattern::Star,
            total: self.total,
            planes: self.planes,
            phasing: self.phasing,
            a_m: A_M,
            e: 0.0,
            i_rad: INC_DEG * DEG,
            raan0_rad: self.node_offset * PI / self.planes.max(1) as f64,
            argp_rad: 0.0,
            m0_rad: 0.0,
        }
        .elements()
    }
}

/// A field of regard.
#[derive(Clone, Copy, Debug, PartialEq, Serialize, Deserialize)]
#[serde(rename_all = "kebab-case")]
pub enum Field {
    /// The satellite at or above this elevation (deg) at the point.
    Elevation(f64),
    /// The point within this off-nadir angle (deg) of the satellite.
    OffNadir(f64),
}

impl Field {
    /// The largest central angle (rad) between the point and the sub-satellite point of a
    /// satellite at radius `r`, on a sphere of radius `re`.
    pub fn max_central_angle(self, r: f64, re: f64) -> f64 {
        match self {
            Field::Elevation(e) => {
                let e = e * DEG;
                (re / r * e.pcos()).pacos() - e
            }
            Field::OffNadir(n) => {
                let n = n * DEG;
                (r / re * n.psin()).min(1.0).pasin() - n
            }
        }
    }
}

/// Run settings.
#[derive(Clone, Copy, Debug, PartialEq, Serialize, Deserialize)]
pub struct Grid {
    /// Time step (s).
    pub step_s: u32,
    /// Span (s), steps `0, step, …, span` included.
    pub span_s: u32,
}

impl Default for Grid {
    fn default() -> Self {
        Self {
            step_s: 10,
            span_s: 7 * 86_400,
        }
    }
}

/// Unit vector of a point on the sphere.
fn unit(lat_deg: f64, lon_deg: f64) -> [f64; 3] {
    let (sp, cp) = (lat_deg * DEG).psin_cos();
    let (sl, cl) = (lon_deg * DEG).psin_cos();
    [cp * cl, cp * sl, sp]
}

fn dot(a: [f64; 3], b: [f64; 3]) -> f64 {
    a[0] * b[0] + a[1] * b[1] + a[2] * b[2]
}

/// The Sun's direction (Earth-fixed unit vector) at `t` seconds after the epoch: the
/// Astronomical Almanac's low-precision formula, rotated by Greenwich mean sidereal time
/// (IAU 1982, UT1 = UTC).
pub fn sun_unit(t_s: f64) -> [f64; 3] {
    let jd = EPOCH_JD_UTC + t_s / 86_400.0;
    let d = jd - 2_451_545.0;
    let l = (280.460 + 0.985_647_4 * d) * DEG;
    let g = (357.528 + 0.985_600_3 * d) * DEG;
    let lam = l + (1.915 * g.psin() + 0.020 * (2.0 * g).psin()) * DEG;
    let eps = (23.439 - 4e-7 * d) * DEG;
    let (sl, cl) = lam.psin_cos();
    let (se, ce) = eps.psin_cos();
    let (x, y, z) = (cl, ce * sl, se * sl);
    let th = crate::jd2::gmst82(crate::jd2::Jd2::new(jd));
    let (st, ct) = th.psin_cos();
    [x * ct + y * st, -x * st + y * ct, z]
}

/// Access intervals of one layer at each point: `[start_s, end_s]` runs of steps at which at least
/// one satellite is in the field of regard (and, with `min_sun_deg`, the Sun is at or above that
/// elevation at the point).
pub fn merged_access(
    els: &[Elements],
    field: Field,
    points: &[(f64, f64)],
    grid: Grid,
    min_sun_deg: Option<f64>,
) -> Vec<Vec<[u32; 2]>> {
    let body = Body::earth();
    let ups: Vec<[f64; 3]> = points.iter().map(|&(a, b)| unit(a, b)).collect();
    let mut out: Vec<Vec<[u32; 2]>> = vec![Vec::new(); points.len()];
    let mut open: Vec<Option<u32>> = vec![None; points.len()];
    let mut last = vec![0u32; points.len()];
    let sin_sun = min_sun_deg.map(|s| (s * DEG).psin());
    let n_steps = grid.span_s / grid.step_s;
    let mut sats: Vec<[f64; 3]> = Vec::with_capacity(els.len());
    let mut cos_max: Vec<f64> = Vec::with_capacity(els.len());
    for k in 0..=n_steps {
        let t = k * grid.step_s;
        sats.clear();
        cos_max.clear();
        for p in satellite_positions_fixed(&body, &[els.to_vec()], true, f64::from(t)) {
            let r = dot(p, p).sqrt();
            sats.push([p[0] / r, p[1] / r, p[2] / r]);
            cos_max.push(field.max_central_angle(r, body.re).pcos());
        }
        let sun = sin_sun.map(|_| sun_unit(f64::from(t)));
        for (i, u) in ups.iter().enumerate() {
            let lit = match (sun, sin_sun) {
                (Some(s), Some(m)) => dot(*u, s) >= m,
                _ => true,
            };
            let inside = lit && sats.iter().zip(&cos_max).any(|(s, c)| dot(*u, *s) >= *c);
            match (inside, open[i]) {
                (true, None) => open[i] = Some(t),
                (false, Some(s)) => {
                    out[i].push([s, last[i]]);
                    open[i] = None;
                }
                _ => {}
            }
            if inside {
                last[i] = t;
            }
        }
    }
    for (i, o) in open.iter().enumerate() {
        if let Some(s) = o {
            out[i].push([*s, last[i]]);
        }
    }
    out
}

/// Per-satellite access intervals at each point (for the independent check of bar M2-B0).
pub fn satellite_access(
    els: &[Elements],
    field: Field,
    points: &[(f64, f64)],
    grid: Grid,
) -> Vec<Vec<Vec<[u32; 2]>>> {
    els.iter()
        .map(|e| merged_access(std::slice::from_ref(e), field, points, grid, None))
        .fold(vec![Vec::new(); points.len()], |mut acc, per_point| {
            for (a, p) in acc.iter_mut().zip(per_point) {
                a.push(p);
            }
            acc
        })
}

/// Nearest-rank percentile (`p` in 0..=100) of a sorted slice.
fn percentile(sorted: &[f64], p: f64) -> Option<f64> {
    if sorted.is_empty() {
        return None;
    }
    let rank = ((p / 100.0) * sorted.len() as f64).ceil().max(1.0) as usize;
    Some(sorted[rank.min(sorted.len()) - 1])
}

fn weighted_mean(vals: &[(f64, f64)]) -> Option<f64> {
    let w: f64 = vals.iter().map(|(w, _)| w).sum();
    (w > 0.0).then(|| vals.iter().map(|(w, v)| w * v).sum::<f64>() / w)
}

/// A figure with its unscored companions (seconds).
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct Figure {
    /// The primary figure (the pre-registered definition).
    pub value_s: Option<f64>,
    /// Median over all samples.
    pub median_s: Option<f64>,
    /// 95th percentile over all samples.
    pub p95_s: Option<f64>,
    /// Largest sample.
    pub max_s: Option<f64>,
    /// Samples used.
    pub samples: usize,
}

fn figure(value: Option<f64>, mut all: Vec<f64>) -> Figure {
    all.sort_by(|a, b| a.total_cmp(b));
    Figure {
        value_s: value,
        median_s: percentile(&all, 50.0),
        p95_s: percentile(&all, 95.0),
        max_s: all.last().copied(),
        samples: all.len(),
    }
}

/// R: the area-weighted mean of each point's mean gap between access intervals, and, unscored,
/// the same with start-to-start gaps. Points with no gap are counted in the second value.
pub fn revisit(points: &[(f64, f64)], acc: &[Vec<[u32; 2]>]) -> (Figure, Option<f64>, usize) {
    let (mut per_point, mut s2s, mut all, mut no_gap) = (Vec::new(), Vec::new(), Vec::new(), 0);
    for (&(lat, _), iv) in points.iter().zip(acc) {
        let gaps: Vec<f64> = iv
            .windows(2)
            .map(|w| f64::from(w[1][0] - w[0][1]))
            .collect();
        if gaps.is_empty() {
            no_gap += 1;
            continue;
        }
        let w = (lat * DEG).pcos();
        per_point.push((w, gaps.iter().sum::<f64>() / gaps.len() as f64));
        let ss: Vec<f64> = iv
            .windows(2)
            .map(|x| f64::from(x[1][0] - x[0][0]))
            .collect();
        s2s.push((w, ss.iter().sum::<f64>() / ss.len() as f64));
        all.extend(gaps);
    }
    (
        figure(weighted_mean(&per_point), all),
        weighted_mean(&s2s),
        no_gap,
    )
}

/// F: for start times every `every_s` seconds before `until_s`, the wait until every point has
/// been in view; the mean over start times.
pub fn full_refresh(acc: &[Vec<[u32; 2]>], every_s: u32, until_s: u32) -> Figure {
    let mut idx = vec![0usize; acc.len()];
    let mut all = Vec::new();
    let mut t = 0u32;
    while t < until_s {
        let mut worst = 0u32;
        let mut ok = true;
        for (iv, j) in acc.iter().zip(idx.iter_mut()) {
            while *j < iv.len() && iv[*j][1] < t {
                *j += 1;
            }
            match iv.get(*j) {
                Some(&[s, _]) if s <= t => {}
                Some(&[s, _]) => worst = worst.max(s - t),
                None => ok = false,
            }
        }
        if ok {
            all.push(f64::from(worst));
        }
        t += every_s;
    }
    let mean = (!all.is_empty()).then(|| all.iter().sum::<f64>() / all.len() as f64);
    figure(mean, all)
}

/// Q: for each RF access interval starting before `until_s`, the wait until the point is in the
/// optical field of regard (zero if it already is); per-point means, area-weighted. Also the
/// number of cues with no optical access before the span ends.
pub fn reaction(
    points: &[(f64, f64)],
    rf: &[Vec<[u32; 2]>],
    opt: &[Vec<[u32; 2]>],
    until_s: u32,
) -> (Figure, usize) {
    let (mut per_point, mut all, mut unanswered) = (Vec::new(), Vec::new(), 0usize);
    for ((&(lat, _), r), o) in points.iter().zip(rf).zip(opt) {
        let mut qs = Vec::new();
        for &[s, _] in r.iter().filter(|iv| iv[0] < until_s) {
            // The first optical interval that has not ended before s.
            let k = o.partition_point(|iv| iv[1] < s);
            match o.get(k) {
                Some(&[os, _]) => qs.push(f64::from(os.saturating_sub(s))),
                None => unanswered += 1,
            }
        }
        if !qs.is_empty() {
            per_point.push(((lat * DEG).pcos(), qs.iter().sum::<f64>() / qs.len() as f64));
            all.extend(qs);
        }
    }
    (figure(weighted_mean(&per_point), all), unanswered)
}

/// One case of a run: an RF layer cueing an optical layer.
#[derive(Clone, Debug, PartialEq, Serialize, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct Case {
    /// Name, e.g. `primary-16`.
    pub name: String,
    /// The RF survey layer.
    pub rf: Layer,
    /// The RF elevation mask (deg).
    pub rf_mask_deg: f64,
    /// The optical layer.
    pub optical: Layer,
    /// The optical layer's largest off-nadir angle (deg).
    pub optical_off_nadir_deg: f64,
    /// When set, an optical look counts only with the Sun at or above this elevation (deg).
    #[serde(default)]
    pub optical_min_sun_deg: Option<f64>,
}

/// The figures of one case.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct CaseResult {
    /// The case as run.
    pub case: Case,
    /// R, revisit of the RF layer.
    pub revisit: Figure,
    /// R measured start to start (unscored).
    pub revisit_start_to_start_s: Option<f64>,
    /// Points with no gap in the span (left out of R).
    pub points_without_gap: usize,
    /// F, full-area refresh of the RF layer.
    pub full_refresh: Figure,
    /// Q, RF-to-optical reaction.
    pub reaction: Figure,
    /// Cues with no optical access before the span ends (left out of Q).
    pub cues_unanswered: usize,
    /// RF access intervals over all points.
    pub rf_intervals: usize,
}

/// Run the cases over `points` on `grid`. F and Q use start times before `grid.span_s − 86 400`
/// (the first six days of a seven-day span).
pub fn run(cases: &[Case], points: &[(f64, f64)], grid: Grid) -> Result<Vec<CaseResult>, String> {
    let until = grid.span_s.saturating_sub(86_400);
    cases
        .iter()
        .map(|c| {
            let rf = merged_access(
                &c.rf.elements()?,
                Field::Elevation(c.rf_mask_deg),
                points,
                grid,
                None,
            );
            let opt = merged_access(
                &c.optical.elements()?,
                Field::OffNadir(c.optical_off_nadir_deg),
                points,
                grid,
                c.optical_min_sun_deg,
            );
            let (revisit, s2s, no_gap) = revisit(points, &rf);
            let (reaction, unanswered) = reaction(points, &rf, &opt, until);
            Ok(CaseResult {
                case: c.clone(),
                revisit,
                revisit_start_to_start_s: s2s,
                points_without_gap: no_gap,
                full_refresh: full_refresh(&rf, 60, until),
                reaction,
                cues_unanswered: unanswered,
                rf_intervals: rf.iter().map(Vec::len).sum(),
            })
        })
        .collect()
}

/// The pre-registered cases of M2: the primary 16- and 32-satellite layers and the variants
/// V1 (32 as 8 × 4), V2 (optical 60° off nadir), V3 (optical in daylight only, Sun ≥ 10°) and
/// V4 (RF mask 0°), V2 to V4 for both sizes.
pub fn m2_cases() -> Vec<Case> {
    let layer = |total, planes, node_offset| Layer {
        total,
        planes,
        phasing: 1,
        node_offset,
    };
    let case = |name: &str, n: usize, p: usize, mask, off, sun| Case {
        name: name.to_string(),
        rf: layer(n, p, 0.0),
        rf_mask_deg: mask,
        optical: layer(n, p, 0.5),
        optical_off_nadir_deg: off,
        optical_min_sun_deg: sun,
    };
    vec![
        case("primary-16", 16, 8, 10.0, 45.0, None),
        case("primary-32", 32, 16, 10.0, 45.0, None),
        case("V1-32-8x4", 32, 8, 10.0, 45.0, None),
        case("V2-16", 16, 8, 10.0, 60.0, None),
        case("V2-32", 32, 16, 10.0, 60.0, None),
        case("V3-16", 16, 8, 10.0, 45.0, Some(10.0)),
        case("V3-32", 32, 16, 10.0, 45.0, Some(10.0)),
        case("V4-16", 16, 8, 0.0, 45.0, None),
        case("V4-32", 32, 16, 0.0, 45.0, None),
    ]
}

// ── Public building blocks for the rows that build on M2 (M4, M5) ────────────────

/// The M2 area's grid rule: cell centres of a 0.25° grid over `[lat_min, lat_max]` ×
/// `[lon_min, lon_max]` (degrees), offset by half a cell from the box edges.
pub const AREA_BOX_DEG: [f64; 4] = [53.5, 66.0, 9.5, 30.5];
/// The grid cell size (degrees).
pub const AREA_CELL_DEG: f64 = 0.25;

/// Every cell centre of the M2 grid, sea or not, row by row from the south-west.
pub fn area_grid() -> Vec<(f64, f64)> {
    let [la0, la1, lo0, lo1] = AREA_BOX_DEG;
    let n_lat = ((la1 - la0) / AREA_CELL_DEG).round() as usize;
    let n_lon = ((lo1 - lo0) / AREA_CELL_DEG).round() as usize;
    (0..n_lat)
        .flat_map(|i| {
            (0..n_lon).map(move |j| {
                (
                    la0 + (i as f64 + 0.5) * AREA_CELL_DEG,
                    lo0 + (j as f64 + 0.5) * AREA_CELL_DEG,
                )
            })
        })
        .collect()
}

/// Whether a cell centre of [`area_grid`] is one of the M2 sea points (outside Natural Earth land
/// and lakes, Kattegat and Skagerrak removed; see `data/tip-and-cue/baltic_sea_points.csv`).
pub fn is_sea_cell(lat_deg: f64, lon_deg: f64) -> bool {
    let key = |a: f64, b: f64| ((a * 1000.0).round() as i64, (b * 1000.0).round() as i64);
    let k = key(lat_deg, lon_deg);
    baltic_points().iter().any(|&(a, b)| key(a, b) == k)
}

/// The M2 primary 16-satellite RF layer (Walker star 16/8/1, first node at 0° E).
pub fn primary_rf_layer() -> Layer {
    Layer {
        total: 16,
        planes: 8,
        phasing: 1,
        node_offset: 0.0,
    }
}

/// The element sets of plane `k` (0-based; plane 1 of the pre-registration is `k = 0`) of a layer.
pub fn plane_elements(layer: &Layer, k: usize) -> Result<Vec<Elements>, String> {
    let per_plane = layer.total / layer.planes.max(1);
    let all = layer.elements()?;
    Ok(all
        .into_iter()
        .skip(k * per_plane)
        .take(per_plane)
        .collect())
}

/// Access intervals `[start_s, end_s]` (seconds after 2025-01-01 00:00 UTC) of the M2 primary
/// 16-satellite RF layer (10° mask) at each of `points`, merged over the layer.
pub fn primary_rf_access(points: &[(f64, f64)], grid: Grid) -> Result<Vec<Vec<[u32; 2]>>, String> {
    Ok(merged_access(
        &primary_rf_layer().elements()?,
        Field::Elevation(10.0),
        points,
        grid,
        None,
    ))
}

/// The same for one plane `k` of the primary RF layer.
pub fn primary_rf_plane_access(
    k: usize,
    points: &[(f64, f64)],
    grid: Grid,
) -> Result<Vec<Vec<[u32; 2]>>, String> {
    Ok(merged_access(
        &plane_elements(&primary_rf_layer(), k)?,
        Field::Elevation(10.0),
        points,
        grid,
        None,
    ))
}

/// The ten M1 points P1 to P10 (latitude, longitude in degrees), from
/// `docs/design/evidence/m1-space-rf-geolocation/PREREGISTRATION.md`.
pub const M1_POINTS: [(f64, f64); 10] = [
    (54.60, 14.00),
    (55.50, 15.80),
    (55.00, 19.00),
    (57.00, 19.50),
    (56.50, 20.20),
    (58.50, 20.50),
    (59.80, 24.50),
    (61.50, 19.80),
    (64.00, 22.00),
    (57.70, 23.30),
];

// ── The `tip-and-cue` scenario kind ─────────────────────────────────────────────

fn default_area() -> String {
    "baltic".into()
}

fn default_cases() -> Vec<Case> {
    m2_cases().into_iter().take(1).collect()
}

/// The `tip-and-cue` scenario: cases of an RF survey layer cueing an optical layer over an area,
/// on a time grid from the epoch 2025-01-01 00:00 UTC.
#[derive(Clone, Debug, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct TipAndCueScenario {
    /// `tip-and-cue`.
    #[serde(default)]
    pub kind: Option<String>,
    /// Free title.
    #[serde(default)]
    pub title: Option<String>,
    /// Unused (the run is deterministic); accepted for uniformity.
    #[serde(default)]
    pub seed: Option<u64>,
    /// The area: `baltic` (the M2 sea points).
    #[serde(default = "default_area")]
    pub area: String,
    /// Time step (s), default 10.
    #[serde(default)]
    pub step_s: Option<u32>,
    /// Span (days), default 2; F and Q use the start times of all but the last day.
    #[serde(default)]
    pub span_days: Option<u32>,
    /// When true, run the pre-registered M2 cases ([`m2_cases`]) instead of `cases`.
    #[serde(default)]
    pub m2: bool,
    /// The cases (default: the M2 primary 16-satellite case).
    #[serde(default = "default_cases")]
    pub cases: Vec<Case>,
}

/// Units of the `tip-and-cue` result.
pub const UNITS: &[crate::field_schema::FieldUnit] = {
    use crate::field_schema::{FieldUnit, ProvenanceClass::*};
    &[
        FieldUnit { path: "inputs.points", unit: "count", provenance: Input, definition: "area points" },
        FieldUnit { path: "inputs.step_s", unit: "s", provenance: Input, definition: "time step" },
        FieldUnit { path: "inputs.span_s", unit: "s", provenance: Input, definition: "span; F and Q use start times before span minus one day" },
        FieldUnit { path: "inputs.semi_major_axis_m", unit: "m", provenance: Input, definition: "circular orbit radius (550 km altitude)" },
        FieldUnit { path: "inputs.inclination_deg", unit: "deg", provenance: Input, definition: "sun-synchronous inclination for 550 km" },
        FieldUnit { path: "cases[].case.rf.total", unit: "count", provenance: Input, definition: "Walker T of the RF layer" },
        FieldUnit { path: "cases[].case.rf.planes", unit: "count", provenance: Input, definition: "Walker P of the RF layer" },
        FieldUnit { path: "cases[].case.rf.phasing", unit: "1", provenance: Input, definition: "Walker F of the RF layer" },
        FieldUnit { path: "cases[].case.rf.node_offset", unit: "1", provenance: Input, definition: "first node, in plane spacings" },
        FieldUnit { path: "cases[].case.optical.total", unit: "count", provenance: Input, definition: "Walker T of the optical layer" },
        FieldUnit { path: "cases[].case.optical.planes", unit: "count", provenance: Input, definition: "Walker P of the optical layer" },
        FieldUnit { path: "cases[].case.optical.phasing", unit: "1", provenance: Input, definition: "Walker F of the optical layer" },
        FieldUnit { path: "cases[].case.optical.node_offset", unit: "1", provenance: Input, definition: "first node, in plane spacings" },
        FieldUnit { path: "cases[].case.rf_mask_deg", unit: "deg", provenance: Input, definition: "RF elevation mask" },
        FieldUnit { path: "cases[].case.optical_off_nadir_deg", unit: "deg", provenance: Input, definition: "optical field of regard, off nadir" },
        FieldUnit { path: "cases[].case.optical_min_sun_deg", unit: "deg", provenance: Input, definition: "Sun elevation needed for an optical look" },
        FieldUnit { path: "cases[].revisit.value_s", unit: "s", provenance: Computed, definition: "R: area-weighted mean of each point's mean gap between RF access intervals" },
        FieldUnit { path: "cases[].revisit.median_s", unit: "s", provenance: Computed, definition: "median gap" },
        FieldUnit { path: "cases[].revisit.p95_s", unit: "s", provenance: Computed, definition: "95th percentile gap" },
        FieldUnit { path: "cases[].revisit.max_s", unit: "s", provenance: Computed, definition: "largest gap" },
        FieldUnit { path: "cases[].revisit.samples", unit: "count", provenance: Computed, definition: "gaps" },
        FieldUnit { path: "cases[].revisit_start_to_start_s", unit: "s", provenance: Computed, definition: "R measured start to start (unscored)" },
        FieldUnit { path: "cases[].points_without_gap", unit: "count", provenance: Computed, definition: "points with no gap, left out of R" },
        FieldUnit { path: "cases[].full_refresh.value_s", unit: "s", provenance: Computed, definition: "F: mean over 1 min start times of the wait until every point has been in view" },
        FieldUnit { path: "cases[].full_refresh.median_s", unit: "s", provenance: Computed, definition: "median of F" },
        FieldUnit { path: "cases[].full_refresh.p95_s", unit: "s", provenance: Computed, definition: "95th percentile of F" },
        FieldUnit { path: "cases[].full_refresh.max_s", unit: "s", provenance: Computed, definition: "largest F" },
        FieldUnit { path: "cases[].full_refresh.samples", unit: "count", provenance: Computed, definition: "start times" },
        FieldUnit { path: "cases[].reaction.value_s", unit: "s", provenance: Computed, definition: "Q: area-weighted mean of each point's mean wait from an RF access start to optical access" },
        FieldUnit { path: "cases[].reaction.median_s", unit: "s", provenance: Computed, definition: "median wait" },
        FieldUnit { path: "cases[].reaction.p95_s", unit: "s", provenance: Computed, definition: "95th percentile wait" },
        FieldUnit { path: "cases[].reaction.max_s", unit: "s", provenance: Computed, definition: "largest wait" },
        FieldUnit { path: "cases[].reaction.samples", unit: "count", provenance: Computed, definition: "cues" },
        FieldUnit { path: "cases[].cues_unanswered", unit: "count", provenance: Computed, definition: "cues with no optical access before the span ends" },
        FieldUnit { path: "cases[].rf_intervals", unit: "count", provenance: Computed, definition: "RF access intervals over all points" },
    ]
};

impl TipAndCueScenario {
    /// Parse a scenario file.
    pub fn parse(src: &str) -> Result<Self, String> {
        toml::from_str(src).map_err(|e| crate::terr!("e-tip-and-cue-parse", e = e.to_string()))
    }

    /// Run: the result document, a summary and a figure.
    pub fn run_json(&self) -> Result<(String, String, String), String> {
        if self.area != "baltic" {
            return Err(crate::terr!("e-tip-and-cue-area", area = self.area.clone()));
        }
        let grid = Grid {
            step_s: self.step_s.unwrap_or(10).max(1),
            span_s: self.span_days.unwrap_or(2).max(2) * 86_400,
        };
        let cases = if self.m2 {
            m2_cases()
        } else {
            self.cases.clone()
        };
        let points = baltic_points();
        let results = run(&cases, &points, grid)?;
        let json = serde_json::json!({
            "kind": "tip-and-cue",
            "label": crate::i18n::in_english(|| crate::t!("tip-and-cue-label")),
            "units": crate::field_schema::units_block(UNITS),
            "inputs": {
                "area": self.area,
                "points": points.len(),
                "epoch_utc": "2025-01-01T00:00:00Z",
                "step_s": grid.step_s,
                "span_s": grid.span_s,
                "semi_major_axis_m": A_M,
                "inclination_deg": INC_DEG,
            },
            "cases": results,
        });
        let min = |f: &Figure| {
            f.value_s
                .map_or("-".to_string(), |v| format!("{:.1}", v / 60.0))
        };
        let mut summary = crate::t!(
            "tip-and-cue-summary-head",
            n = results.len(),
            points = points.len()
        );
        for r in &results {
            summary.push('\n');
            summary.push_str(&crate::t!(
                "tip-and-cue-summary-case",
                name = r.case.name.clone(),
                r = min(&r.revisit),
                f = min(&r.full_refresh),
                q = min(&r.reaction)
            ));
        }
        Ok((
            serde_json::to_string_pretty(&json).map_err(|e| e.to_string())?,
            summary,
            svg(&results),
        ))
    }
}

fn esc(t: &str) -> String {
    t.replace('&', "&amp;")
        .replace('<', "&lt;")
        .replace('>', "&gt;")
}

/// A bar chart of R, F and Q (minutes) per case.
fn svg(results: &[CaseResult]) -> String {
    let (w, row) = (640.0, 54.0);
    let h = 40.0 + row * results.len() as f64;
    let top = results
        .iter()
        .flat_map(|r| [&r.revisit, &r.full_refresh, &r.reaction])
        .filter_map(|f| f.value_s)
        .fold(60.0f64, f64::max)
        / 60.0;
    let mut s = format!(
        "<svg xmlns=\"http://www.w3.org/2000/svg\" width=\"{w}\" height=\"{h}\" viewBox=\"0 0 {w} {h}\" font-family=\"sans-serif\" font-size=\"11\">"
    );
    s.push_str(&format!(
        "<text x=\"8\" y=\"18\" font-size=\"13\">{}</text>",
        esc(&crate::t!("tip-and-cue-figure-title"))
    ));
    for (i, r) in results.iter().enumerate() {
        let y0 = 30.0 + row * i as f64;
        s.push_str(&format!(
            "<text x=\"8\" y=\"{:.1}\">{}</text>",
            y0 + 28.0,
            esc(&r.case.name)
        ));
        for (k, (f, tag, colour)) in [
            (&r.revisit, "R", "#4C78A8"),
            (&r.full_refresh, "F", "#F58518"),
            (&r.reaction, "Q", "#54A24B"),
        ]
        .into_iter()
        .enumerate()
        {
            let v = f.value_s.unwrap_or(0.0) / 60.0;
            let y = y0 + 14.0 * k as f64 + 4.0;
            let len = 420.0 * v / top;
            s.push_str(&format!(
                "<rect x=\"150\" y=\"{y:.1}\" width=\"{len:.1}\" height=\"11\" fill=\"{colour}\"/><text x=\"{:.1}\" y=\"{:.1}\">{tag} {v:.1}</text>",
                156.0 + len,
                y + 9.5
            ));
        }
    }
    s.push_str("</svg>");
    s
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn the_grid_and_mask_api_agree_with_the_point_list() {
        let g = area_grid();
        assert_eq!(g.len(), 50 * 84);
        assert_eq!(g[0], (53.625, 9.625));
        let sea: Vec<_> = g
            .iter()
            .filter(|&&(a, b)| is_sea_cell(a, b))
            .copied()
            .collect();
        assert_eq!(sea, baltic_points());
        // A plane of the 16/8/1 layer holds its two satellites; the planes partition the layer.
        let l = primary_rf_layer();
        let all = l.elements().unwrap();
        let joined: Vec<_> = (0..8)
            .flat_map(|k| plane_elements(&l, k).unwrap())
            .collect();
        assert_eq!(joined, all);
        assert_eq!(plane_elements(&l, 0).unwrap().len(), 2);
    }

    #[test]
    fn the_baltic_points_are_the_committed_list() {
        let p = baltic_points();
        // PIN-SCOPE:    the number of sea points area.py wrote from Natural Earth land 5.1.1 and
        //               lakes 5.0.0 (the committed CSV).
        // PIN-EXCLUDES: anything the planner computes.
        assert_eq!(p.len(), 996);
        assert!(p
            .iter()
            .all(|&(a, b)| (53.5..=66.0).contains(&a) && (9.5..=30.5).contains(&b)));
        assert!(!p.iter().any(|&(a, b)| a > 55.65 && b < 13.0));
    }

    #[test]
    fn central_angle_bounds_match_the_elevation_and_off_nadir_tests() {
        // Points along a meridian under a satellite at 550 km over (0, 0): the bound and the
        // direct test agree everywhere except within 1e-9 rad of the boundary.
        let re = Body::earth().re;
        let r = A_M;
        let s = [r, 0.0, 0.0];
        for field in [
            Field::Elevation(10.0),
            Field::OffNadir(45.0),
            Field::OffNadir(60.0),
        ] {
            let g = field.max_central_angle(r, re);
            for k in 0..4000 {
                let gam = f64::from(k) * 1e-4;
                if (gam - g).abs() < 1e-9 {
                    continue;
                }
                let p = [re * gam.pcos(), 0.0, re * gam.psin()];
                let d = [s[0] - p[0], s[1] - p[1], s[2] - p[2]];
                let nd = dot(d, d).sqrt();
                let direct = match field {
                    Field::Elevation(e) => {
                        dot(d, [p[0] / re, 0.0, p[2] / re]) / nd >= (e * DEG).psin()
                    }
                    Field::OffNadir(n) => {
                        let back = [-d[0], -d[1], -d[2]];
                        dot([-s[0], 0.0, 0.0], back) / (r * nd) >= (n * DEG).pcos()
                            && dot(d, [p[0] / re, 0.0, p[2] / re]) > 0.0
                    }
                };
                assert_eq!(gam <= g, direct, "{field:?} at {gam}");
            }
        }
        // 10° at 550 km: about 15.0° (1 670 km), as the pre-registration says.
        let g = Field::Elevation(10.0).max_central_angle(r, re);
        assert!((g / DEG - 15.0).abs() < 0.2 && (g * re / 1e3 - 1670.0).abs() < 25.0);
    }

    #[test]
    fn metrics_follow_their_definitions_on_hand_made_intervals() {
        let pts = [(60.0, 20.0), (0.0, 20.0)];
        // Point 0 (weight 0.5): gaps 100 and 300; point 1 (weight 1): gap 200.
        let acc = vec![
            vec![[0, 50], [150, 200], [500, 600]],
            vec![[100, 100], [300, 400]],
        ];
        let (r, s2s, none) = revisit(&pts, &acc);
        let want = (0.5 * 200.0 + 1.0 * 200.0) / 1.5;
        assert!((r.value_s.unwrap() - want).abs() < 1e-9);
        assert_eq!((r.samples, r.max_s, none), (3, Some(300.0), 0));
        assert!((s2s.unwrap() - (0.5 * 250.0 + 200.0) / 1.5).abs() < 1e-9);
        // F at t = 0: point 1 waits 100; t = 60: point 0 waits 90 (point 1 40); t = 120: point 1
        // waits 180 (point 0 30).
        let f = full_refresh(&acc, 60, 180);
        assert_eq!(f.samples, 3);
        assert!((f.value_s.unwrap() - (100.0 + 90.0 + 180.0) / 3.0).abs() < 1e-9);
        // Q: RF starts 0, 150 (point 0); optical from 120 to 160 and 700: waits 120 and 0.
        let opt = vec![vec![[120, 160]], vec![]];
        let (q, missing) = reaction(&pts, &acc, &opt, 400);
        assert_eq!((q.samples, missing), (2, 2));
        assert!((q.value_s.unwrap() - 60.0).abs() < 1e-9);
    }

    #[test]
    fn the_sun_is_south_at_local_noon_in_january() {
        // At 12:00 UTC on 2025-01-01 the Sun is near the Greenwich meridian at declination
        // about −23°: its Earth-fixed direction has longitude near 0° (within the equation of
        // time, about 1°) and latitude near −23°.
        let s = sun_unit(12.0 * 3600.0);
        let lon = s[1].patan2(s[0]) / DEG;
        let lat = s[2].pasin() / DEG;
        assert!(lon.abs() < 2.0 && (lat + 23.0).abs() < 0.5, "{lon} {lat}");
    }
}
