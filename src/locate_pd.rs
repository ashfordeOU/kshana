// SPDX-License-Identifier: AGPL-3.0-only
//! Fixed-station interference locator by power difference (C/N0 and AGC): B3a of 0.41,
//! `docs/design/evidence/b3a-power-difference-locator/PREREGISTRATION.md`, with the readings of
//! `xval/locator-power-difference/README.md` (cited as R1 to R15).
//!
//! Each station's C/N0 drop (and AGC rise, where its dB-per-unit scale is stated) is turned into an
//! interference power at the antenna; a log-distance model with the reference power profiled out,
//! the path-loss exponent and source height marginalised and censored terms for stations that see
//! nothing gives a posterior on a grid around the network. MODELLED: checked on synthetic networks
//! only until a public multi-station campaign with blind transmitter positions is scored.

use rand::{Rng, SeedableRng};
use rand_chacha::ChaCha8Rng;
use serde_json::{json, Value};

use crate::interference_map::emitter::los_reach_km;
use crate::portable_math::PortableFloat;

/// Method identifier written into every output.
pub const METHOD_ID: &str = "kshana-locate/power-difference/v1";
/// The tempering exponent, chosen on the development seeds (R9) before the gate was run.
pub const TEMPER_V1: f64 = 1.0;

/// Every parameter of the method (R1 to R10).
#[derive(Clone, Debug, PartialEq)]
pub struct PowerDifferenceParams {
    /// Nominal received signal power, dBW.
    pub signal_dbw: f64,
    /// Chip rate, Hz.
    pub chip_rate_hz: f64,
    /// Spread-spectrum coefficient of the anti-jam equation.
    pub q: f64,
    /// Median C/N0 drop at or above which a station reports interference, dB.
    pub gate_db: f64,
    /// σ of the C/N0 power estimate, dB.
    pub sigma_cn0_db: f64,
    /// σ of the AGC power estimate, dB.
    pub sigma_agc_db: f64,
    /// Log-normal shadowing σ, dB.
    pub sigma_sh_db: f64,
    /// Extra mean loss without line of sight, dB.
    pub nlos_db: f64,
    /// Path-loss exponents marginalised with equal prior.
    pub n_set: Vec<f64>,
    /// Source heights above ground marginalised with equal prior, m.
    pub h_set_m: Vec<f64>,
    /// Buffer of the search domain around the stations' convex hull, km.
    pub buffer_km: f64,
    /// Requested grid cell side, km (doubled until the grid fits `max_cells`).
    pub cell_km: f64,
    /// Largest number of grid cells.
    pub max_cells: usize,
    /// Fewest reporting stations for an epoch to belong to a session.
    pub min_reporting: usize,
    /// A session ends at a gap longer than this, s.
    pub session_gap_s: f64,
    /// Tempering exponent of the summed log-likelihood.
    pub temper: f64,
    /// Highest-posterior region levels, ascending.
    pub levels: Vec<f64>,
    /// Timeline step, s.
    pub timeline_s: f64,
}

impl PowerDifferenceParams {
    /// The pre-registered version 1 parameters.
    pub fn preregistered_v1() -> Self {
        Self {
            signal_dbw: crate::jamming::DEFAULT_SIGNAL_POWER_DBW,
            chip_rate_hz: 1.023e6,
            q: crate::jamming::Q_BROADBAND,
            gate_db: 3.0,
            sigma_cn0_db: 2.0,
            sigma_agc_db: 3.0,
            sigma_sh_db: 6.0,
            nlos_db: 20.0,
            n_set: vec![2.0, 2.5, 3.0],
            h_set_m: vec![2.0, 30.0],
            buffer_km: 20.0,
            cell_km: 0.25,
            max_cells: 40_000,
            min_reporting: 3,
            session_gap_s: 120.0,
            temper: TEMPER_V1,
            levels: vec![0.5, 0.9, 0.95],
            timeline_s: 60.0,
        }
    }

    /// The parameters as JSON, for the method block of every output.
    pub fn to_json(&self) -> Value {
        json!({
            "method": METHOD_ID,
            "signal_dbw": self.signal_dbw, "chip_rate_hz": self.chip_rate_hz, "q": self.q,
            "gate_db": self.gate_db, "sigma_cn0_db": self.sigma_cn0_db, "sigma_agc_db": self.sigma_agc_db,
            "sigma_sh_db": self.sigma_sh_db, "nlos_db": self.nlos_db, "n_set": self.n_set,
            "h_set_m": self.h_set_m, "buffer_km": self.buffer_km, "cell_km": self.cell_km,
            "max_cells": self.max_cells, "min_reporting": self.min_reporting,
            "session_gap_s": self.session_gap_s, "temper": self.temper, "levels": self.levels,
            "timeline_s": self.timeline_s,
        })
    }
}

/// A fixed reference station, in the local plane (km east and north of the network origin).
#[derive(Clone, Debug, PartialEq)]
pub struct Station {
    /// East, km.
    pub east_km: f64,
    /// North, km.
    pub north_km: f64,
    /// Antenna height above ground, m.
    pub antenna_h_m: f64,
    /// Baseline C/N0 (median over satellites above 15°), dB-Hz.
    pub c_nom_dbhz: f64,
    /// AGC scale, dB per AGC unit, where stated.
    pub kappa_db: Option<f64>,
    /// In-band noise power, dBW.
    pub noise_dbw: f64,
    /// Antenna gain toward the horizon, dBi.
    pub gain_dbi: f64,
}

/// One station's observables at one epoch.
#[derive(Clone, Copy, Debug, Default, PartialEq)]
pub struct Obs {
    /// Median C/N0 drop against the baseline, dB.
    pub drop_db: Option<f64>,
    /// AGC change from the baseline, AGC units (a rise of `drop` dB is `dagc · kappa`).
    pub dagc: Option<f64>,
}

/// One epoch of the network: `obs[i]` belongs to station `i`.
#[derive(Clone, Debug, PartialEq)]
pub struct Epoch {
    /// Time, s.
    pub t_s: f64,
    /// Observables per station.
    pub obs: Vec<Obs>,
}

fn db_to_lin(db: f64) -> f64 {
    10f64.ppowf(db / 10.0)
}

/// Interference power at the antenna from a median C/N0 drop (R2), dBW.
pub fn j_from_drop(p: &PowerDifferenceParams, c_nom_dbhz: f64, drop_db: f64) -> f64 {
    let js = p.q
        * p.chip_rate_hz
        * (1.0 / db_to_lin(c_nom_dbhz - drop_db) - 1.0 / db_to_lin(c_nom_dbhz));
    p.signal_dbw + 10.0 * js.max(1e-300).plog10()
}

/// The power at which a station's gate is met (R3), dBW.
pub fn j_min(p: &PowerDifferenceParams, st: &Station) -> f64 {
    j_from_drop(p, st.c_nom_dbhz, p.gate_db)
}

/// The station's interference-power estimate at an epoch (R2 to R4); `None` when it does not report.
pub fn station_j(p: &PowerDifferenceParams, st: &Station, ob: &Obs) -> Option<f64> {
    let d = ob.drop_db?;
    if d < p.gate_db {
        return None;
    }
    let jc = j_from_drop(p, st.c_nom_dbhz, d);
    let ja = match (st.kappa_db, ob.dagc) {
        (Some(k), Some(a)) if a * k > 0.0 => {
            Some(st.noise_dbw + 10.0 * (db_to_lin(a * k) - 1.0).max(1e-300).plog10())
        }
        _ => None,
    };
    Some(match ja {
        None => jc,
        Some(ja) => {
            let (wc, wa) = (
                1.0 / (p.sigma_cn0_db * p.sigma_cn0_db),
                1.0 / (p.sigma_agc_db * p.sigma_agc_db),
            );
            (jc * wc + ja * wa) / (wc + wa)
        }
    })
}

// ---------------------------------------------------------------- the grid

fn cross(o: (f64, f64), a: (f64, f64), b: (f64, f64)) -> f64 {
    (a.0 - o.0) * (b.1 - o.1) - (a.1 - o.1) * (b.0 - o.0)
}

/// Convex hull (counter-clockwise, Andrew's monotone chain).
pub fn convex_hull(pts: &[(f64, f64)]) -> Vec<(f64, f64)> {
    let mut v: Vec<(f64, f64)> = pts.to_vec();
    v.sort_by(|a, b| a.partial_cmp(b).unwrap_or(std::cmp::Ordering::Equal));
    v.dedup();
    if v.len() < 3 {
        return v;
    }
    let mut lower: Vec<(f64, f64)> = Vec::new();
    for &p in &v {
        while lower.len() >= 2 && cross(lower[lower.len() - 2], lower[lower.len() - 1], p) <= 0.0 {
            lower.pop();
        }
        lower.push(p);
    }
    let mut upper: Vec<(f64, f64)> = Vec::new();
    for &p in v.iter().rev() {
        while upper.len() >= 2 && cross(upper[upper.len() - 2], upper[upper.len() - 1], p) <= 0.0 {
            upper.pop();
        }
        upper.push(p);
    }
    lower.pop();
    upper.pop();
    lower.extend(upper);
    lower
}

fn seg_dist(p: (f64, f64), a: (f64, f64), b: (f64, f64)) -> f64 {
    let (dx, dy) = (b.0 - a.0, b.1 - a.1);
    let l2 = dx * dx + dy * dy;
    let t = if l2 > 0.0 {
        (((p.0 - a.0) * dx + (p.1 - a.1) * dy) / l2).clamp(0.0, 1.0)
    } else {
        0.0
    };
    let (qx, qy) = (a.0 + t * dx - p.0, a.1 + t * dy - p.1);
    (qx * qx + qy * qy).sqrt()
}

/// Distance from `p` to a convex hull (0 inside), km.
pub fn hull_distance(hull: &[(f64, f64)], p: (f64, f64)) -> f64 {
    match hull.len() {
        0 => f64::INFINITY,
        1 => seg_dist(p, hull[0], hull[0]),
        2 => seg_dist(p, hull[0], hull[1]),
        n => {
            let inside = (0..n).all(|k| cross(hull[k], hull[(k + 1) % n], p) >= 0.0);
            if inside {
                0.0
            } else {
                (0..n)
                    .map(|k| seg_dist(p, hull[k], hull[(k + 1) % n]))
                    .fold(f64::INFINITY, f64::min)
            }
        }
    }
}

/// The search grid: cell centres in the domain (R7).
#[derive(Clone, Debug, PartialEq)]
pub struct Grid {
    /// Cell side, km.
    pub cell_km: f64,
    /// Cell centres `(east, north)`, km, row by row from the south-west.
    pub centres: Vec<(f64, f64)>,
}

/// The grid over the points within `buffer_km` of the stations' convex hull.
pub fn grid(p: &PowerDifferenceParams, stations: &[Station]) -> Grid {
    let pts: Vec<(f64, f64)> = stations.iter().map(|s| (s.east_km, s.north_km)).collect();
    let hull = convex_hull(&pts);
    let (mut x0, mut y0, mut x1, mut y1) = (
        f64::INFINITY,
        f64::INFINITY,
        f64::NEG_INFINITY,
        f64::NEG_INFINITY,
    );
    for &(x, y) in &pts {
        x0 = x0.min(x);
        y0 = y0.min(y);
        x1 = x1.max(x);
        y1 = y1.max(y);
    }
    let b = p.buffer_km;
    let (x0, y0, x1, y1) = (x0 - b, y0 - b, x1 + b, y1 + b);
    let mut cell = p.cell_km;
    loop {
        let nx = ((x1 - x0) / cell).ceil() as usize;
        let ny = ((y1 - y0) / cell).ceil() as usize;
        let mut centres = Vec::new();
        for j in 0..ny {
            for i in 0..nx {
                let c = (x0 + (i as f64 + 0.5) * cell, y0 + (j as f64 + 0.5) * cell);
                if hull_distance(&hull, c) <= b {
                    centres.push(c);
                }
            }
        }
        if centres.len() <= p.max_cells {
            return Grid {
                cell_km: cell,
                centres,
            };
        }
        cell *= 2.0;
    }
}

// ---------------------------------------------------------------- the likelihood

const LN_SQRT_2PI: f64 = 0.918_938_533_204_672_8;

fn log_phi_cdf(z: f64) -> f64 {
    let c = crate::planner::phi(z);
    if c > 1e-300 {
        c.pln()
    } else {
        // Mills-ratio asymptote for the far lower tail.
        -0.5 * z * z - LN_SQRT_2PI - (-z).pln()
    }
}

fn log_sum_exp_mean(v: &[f64]) -> f64 {
    let m = v.iter().copied().fold(f64::NEG_INFINITY, f64::max);
    if !m.is_finite() {
        return m;
    }
    let s: f64 = v.iter().map(|x| (x - m).pexp()).sum();
    m + (s / v.len() as f64).pln()
}

/// Per (cell, height, station): log10 of the slant distance in metres, and the line-of-sight loss.
struct Geometry {
    logd: Vec<f64>,
    loss: Vec<f64>,
    n_st: usize,
    n_h: usize,
}

impl Geometry {
    fn new(p: &PowerDifferenceParams, g: &Grid, st: &[Station]) -> Self {
        let (n_st, n_h) = (st.len(), p.h_set_m.len());
        let mut logd = Vec::with_capacity(g.centres.len() * n_h * n_st);
        let mut loss = Vec::with_capacity(logd.capacity());
        for &(x, y) in &g.centres {
            for &h in &p.h_set_m {
                for s in st {
                    let (dx, dy) = ((x - s.east_km) * 1000.0, (y - s.north_km) * 1000.0);
                    let dz = h - s.antenna_h_m;
                    let horiz_km = (dx * dx + dy * dy).sqrt() / 1000.0;
                    let d = (dx * dx + dy * dy + dz * dz).sqrt().max(1.0);
                    logd.push(d.plog10());
                    loss.push(if horiz_km > los_reach_km(s.antenna_h_m, h) {
                        p.nlos_db
                    } else {
                        0.0
                    });
                }
            }
        }
        Self {
            logd,
            loss,
            n_st,
            n_h,
        }
    }
}

/// The log-likelihood of one epoch on every cell (R5, R6), with `n` and `h` marginalised.
fn epoch_loglik(
    p: &PowerDifferenceParams,
    st: &[Station],
    geo: &Geometry,
    j: &[Option<f64>],
    jmin: &[f64],
    out: &mut [f64],
) {
    let s = p.sigma_sh_db;
    let mut terms = Vec::with_capacity(p.n_set.len() * geo.n_h);
    for (c, o) in out.iter_mut().enumerate() {
        terms.clear();
        for hk in 0..geo.n_h {
            let base = (c * geo.n_h + hk) * geo.n_st;
            for &n in &p.n_set {
                let (mut sum, mut cnt) = (0.0, 0usize);
                for i in 0..geo.n_st {
                    if let Some(ji) = j[i] {
                        sum += ji + 10.0 * n * geo.logd[base + i] - st[i].gain_dbi
                            + geo.loss[base + i];
                        cnt += 1;
                    }
                }
                if cnt == 0 {
                    continue;
                }
                let p0 = sum / cnt as f64;
                let mut ll = 0.0;
                for i in 0..geo.n_st {
                    let pred =
                        p0 - 10.0 * n * geo.logd[base + i] + st[i].gain_dbi - geo.loss[base + i];
                    match j[i] {
                        Some(ji) => {
                            let z = (ji - pred) / s;
                            ll += -0.5 * z * z - LN_SQRT_2PI;
                        }
                        None => ll += log_phi_cdf((jmin[i] - pred) / s),
                    }
                }
                terms.push(ll);
            }
        }
        *o = if terms.is_empty() {
            0.0
        } else {
            log_sum_exp_mean(&terms)
        };
    }
}

/// The summed (untempered) log-likelihood of a run of epochs on the grid.
pub fn summed_loglik(
    p: &PowerDifferenceParams,
    st: &[Station],
    g: &Grid,
    epochs: &[Epoch],
) -> Vec<f64> {
    let geo = Geometry::new(p, g, st);
    let jmin: Vec<f64> = st.iter().map(|s| j_min(p, s)).collect();
    let mut total = vec![0.0; g.centres.len()];
    let mut one = vec![0.0; g.centres.len()];
    for e in epochs {
        let j: Vec<Option<f64>> = st
            .iter()
            .zip(&e.obs)
            .map(|(s, o)| station_j(p, s, o))
            .collect();
        if j.iter().filter(|x| x.is_some()).count() < 1 {
            continue;
        }
        epoch_loglik(p, st, &geo, &j, &jmin, &mut one);
        for (t, x) in total.iter_mut().zip(&one) {
            *t += x;
        }
    }
    total
}

/// Sessions (R8): index ranges of epochs with at least `min_reporting` reporting stations.
pub fn sessions(
    p: &PowerDifferenceParams,
    st: &[Station],
    epochs: &[Epoch],
) -> Vec<(usize, usize)> {
    let mut out = Vec::new();
    let mut cur: Option<(usize, usize, f64)> = None;
    for (k, e) in epochs.iter().enumerate() {
        let n = st
            .iter()
            .zip(&e.obs)
            .filter(|(s, o)| station_j(p, s, o).is_some())
            .count();
        if n < p.min_reporting {
            continue;
        }
        cur = match cur {
            Some((a, _, t)) if e.t_s - t <= p.session_gap_s => Some((a, k, e.t_s)),
            Some((a, b, _)) => {
                out.push((a, b + 1));
                Some((k, k, e.t_s))
            }
            None => Some((k, k, e.t_s)),
        };
    }
    if let Some((a, b, _)) = cur {
        out.push((a, b + 1));
    }
    out
}

/// A located session.
#[derive(Clone, Debug, PartialEq)]
pub struct Location {
    /// Normalised posterior mass per cell.
    pub posterior: Vec<f64>,
    /// For each level, the cell indices of the highest-posterior region.
    pub regions: Vec<Vec<usize>>,
    /// Posterior mean `(east, north)`, km.
    pub centroid: (f64, f64),
    /// Covariance `[[ee, en], [en, nn]]`, km².
    pub cov: [[f64; 2]; 2],
    /// 95% ellipse: semi-major, semi-minor (km) and azimuth of the major axis (degrees from north).
    pub ellipse: (f64, f64, f64),
}

/// The posterior and its summaries from a summed log-likelihood (R8, R10).
pub fn locate(p: &PowerDifferenceParams, g: &Grid, summed: &[f64]) -> Location {
    let m = summed.iter().copied().fold(f64::NEG_INFINITY, f64::max);
    let mut w: Vec<f64> = summed.iter().map(|x| (p.temper * (x - m)).pexp()).collect();
    let z: f64 = w.iter().sum();
    for x in &mut w {
        *x /= z;
    }
    let mut order: Vec<usize> = (0..w.len()).collect();
    order.sort_by(|&a, &b| {
        w[b].partial_cmp(&w[a])
            .unwrap_or(std::cmp::Ordering::Equal)
            .then(a.cmp(&b))
    });
    let regions = p
        .levels
        .iter()
        .map(|&lvl| {
            let mut acc = 0.0;
            let mut cells = Vec::new();
            for &c in &order {
                cells.push(c);
                acc += w[c];
                if acc >= lvl {
                    break;
                }
            }
            cells.sort_unstable();
            cells
        })
        .collect();
    let (mut mx, mut my) = (0.0, 0.0);
    for (c, &(x, y)) in g.centres.iter().enumerate() {
        mx += w[c] * x;
        my += w[c] * y;
    }
    let (mut cxx, mut cxy, mut cyy) = (0.0, 0.0, 0.0);
    for (c, &(x, y)) in g.centres.iter().enumerate() {
        let (dx, dy) = (x - mx, y - my);
        cxx += w[c] * dx * dx;
        cxy += w[c] * dx * dy;
        cyy += w[c] * dy * dy;
    }
    let tr = cxx + cyy;
    let det = cxx * cyy - cxy * cxy;
    let disc = (0.25 * tr * tr - det).max(0.0).sqrt();
    let (l1, l2) = (0.5 * tr + disc, (0.5 * tr - disc).max(0.0));
    // Major-axis direction: the eigenvector of l1; azimuth clockwise from north.
    let az = (2.0 * cxy).patan2(cyy - cxx).to_degrees() * 0.5;
    let az = az.rem_euclid(180.0);
    Location {
        posterior: w,
        regions,
        centroid: (mx, my),
        cov: [[cxx, cxy], [cxy, cyy]],
        ellipse: ((5.991 * l1).sqrt(), (5.991 * l2).sqrt(), az),
    }
}

// ---------------------------------------------------------------- the synthetic network (R11, R12)

/// One synthetic session: the network, its epochs and the true source.
#[derive(Clone, Debug, PartialEq)]
pub struct SynthSession {
    /// The seed it was drawn from.
    pub seed: u64,
    /// Stations.
    pub stations: Vec<Station>,
    /// Epochs.
    pub epochs: Vec<Epoch>,
    /// True source `(east, north)`, km.
    pub source: (f64, f64),
    /// True source height, m.
    pub source_h_m: f64,
    /// Redraws needed (a draw without 3 reporting stations at any epoch is redrawn).
    pub redraws: u32,
}

fn normal(r: &mut ChaCha8Rng) -> f64 {
    // Box-Muller on (0, 1].
    let u1: f64 = 1.0 - r.gen::<f64>();
    let u2: f64 = r.gen::<f64>();
    (-2.0 * u1.pln()).sqrt() * (2.0 * std::f64::consts::PI * u2).pcos()
}

fn cholesky(a: &[Vec<f64>]) -> Vec<Vec<f64>> {
    let n = a.len();
    let mut l = vec![vec![0.0; n]; n];
    for i in 0..n {
        for j in 0..=i {
            let s: f64 = (0..j).map(|k| l[i][k] * l[j][k]).sum();
            if i == j {
                l[i][j] = (a[i][i] - s).max(1e-12).sqrt();
            } else {
                l[i][j] = (a[i][j] - s) / l[j][j];
            }
        }
    }
    l
}

/// Noise power of the synthetic front end, dBW (R12).
pub const SYNTH_NOISE_DBW: f64 = -130.0;
/// Baseline C/N0 of the synthetic stations, dB-Hz (R12).
pub const SYNTH_C_NOM_DBHZ: f64 = 45.0;

fn synth_once(p: &PowerDifferenceParams, r: &mut ChaCha8Rng) -> SynthSession {
    let n_st = r.gen_range(6..=12usize);
    let l = r.gen_range(5.0..=30.0f64);
    let mut pos: Vec<(f64, f64)> = Vec::new();
    while pos.len() < n_st {
        let c = (r.gen::<f64>() * l, r.gen::<f64>() * l);
        if pos
            .iter()
            .all(|q| ((q.0 - c.0).powi(2) + (q.1 - c.1).powi(2)).sqrt() >= l / 10.0)
        {
            pos.push(c);
        }
    }
    // Per-station AGC scale: stated 0.1 dB per unit; the true rise differs by a fixed error in [-1, 1] dB.
    let kappa = 0.1;
    let stations: Vec<Station> = pos
        .iter()
        .map(|&(x, y)| Station {
            east_km: x,
            north_km: y,
            antenna_h_m: 10.0,
            c_nom_dbhz: SYNTH_C_NOM_DBHZ,
            kappa_db: Some(kappa),
            noise_dbw: SYNTH_NOISE_DBW,
            gain_dbi: 0.0,
        })
        .collect();
    let agc_err: Vec<f64> = (0..n_st).map(|_| r.gen_range(-1.0..=1.0f64)).collect();
    // Source uniform in the domain (rejection on the hull buffer).
    let hull = convex_hull(&pos);
    let (bx0, by0) = (-p.buffer_km, -p.buffer_km);
    let span = l + 2.0 * p.buffer_km;
    let source = loop {
        let c = (bx0 + r.gen::<f64>() * span, by0 + r.gen::<f64>() * span);
        if hull_distance(&hull, c) <= p.buffer_km {
            break c;
        }
    };
    let source_h_m = if r.gen::<bool>() { 2.0 } else { 30.0 };
    let n_exp = r.gen_range(1.8..=3.5f64);
    let p0 = r.gen_range(-40.0..=-10.0f64);
    // Correlated shadowing, drawn once (1 km correlation length, σ 6 dB).
    let cov: Vec<Vec<f64>> = (0..n_st)
        .map(|i| {
            (0..n_st)
                .map(|j| {
                    let d = ((pos[i].0 - pos[j].0).powi(2) + (pos[i].1 - pos[j].1).powi(2)).sqrt();
                    36.0 * (-d).pexp()
                })
                .collect()
        })
        .collect();
    let lc = cholesky(&cov);
    let zs: Vec<f64> = (0..n_st).map(|_| normal(r)).collect();
    let shadow: Vec<f64> = (0..n_st)
        .map(|i| (0..=i).map(|k| lc[i][k] * zs[k]).sum())
        .collect();
    let j_true: Vec<f64> = stations
        .iter()
        .enumerate()
        .map(|(i, s)| {
            let (dx, dy) = (
                (source.0 - s.east_km) * 1000.0,
                (source.1 - s.north_km) * 1000.0,
            );
            let dz = source_h_m - s.antenna_h_m;
            let horiz_km = (dx * dx + dy * dy).sqrt() / 1000.0;
            let d = (dx * dx + dy * dy + dz * dz).sqrt().max(1.0);
            let los = if horiz_km > los_reach_km(s.antenna_h_m, source_h_m) {
                p.nlos_db
            } else {
                0.0
            };
            p0 - 10.0 * n_exp * d.plog10() + shadow[i] - los
        })
        .collect();
    let epochs: Vec<Epoch> = (0..30)
        .map(|k| Epoch {
            t_s: k as f64,
            obs: (0..n_st)
                .map(|i| {
                    let js_db = j_true[i] - p.signal_dbw;
                    let c_eff = crate::jamming::effective_cn0_dbhz(
                        SYNTH_C_NOM_DBHZ,
                        js_db,
                        p.q,
                        p.chip_rate_hz,
                    );
                    let drop = (SYNTH_C_NOM_DBHZ - c_eff + 0.5 * normal(r))
                        .round()
                        .max(0.0);
                    let rise = 10.0 * (1.0 + db_to_lin(j_true[i] - SYNTH_NOISE_DBW)).plog10()
                        + agc_err[i]
                        + 0.5 * normal(r);
                    Obs {
                        drop_db: Some(drop),
                        dagc: Some(rise / kappa),
                    }
                })
                .collect(),
        })
        .collect();
    SynthSession {
        seed: 0,
        stations,
        epochs,
        source,
        source_h_m,
        redraws: 0,
    }
}

/// The synthetic session of one seed (R11, R12): redrawn while no epoch has 3 reporting stations.
pub fn synth_session(p: &PowerDifferenceParams, seed: u64) -> SynthSession {
    let mut r = ChaCha8Rng::seed_from_u64(seed);
    let mut redraws = 0;
    loop {
        let mut s = synth_once(p, &mut r);
        if !sessions(p, &s.stations, &s.epochs).is_empty() {
            s.seed = seed;
            s.redraws = redraws;
            return s;
        }
        redraws += 1;
    }
}

fn median(mut v: Vec<f64>) -> f64 {
    v.sort_by(|a, b| a.partial_cmp(b).unwrap_or(std::cmp::Ordering::Equal));
    let n = v.len();
    if n == 0 {
        return f64::NAN;
    }
    if n % 2 == 1 {
        v[n / 2]
    } else {
        0.5 * (v[n / 2 - 1] + v[n / 2])
    }
}

/// One scored synthetic session (R13).
#[derive(Clone, Debug, PartialEq)]
pub struct GateRow {
    /// Seed.
    pub seed: u64,
    /// Whether the 95% region holds the truth's cell, for each tempering candidate (or one value).
    pub covered: Vec<bool>,
    /// 95% region area over domain area, per candidate.
    pub area_share: Vec<f64>,
    /// Centroid error, km, per candidate.
    pub centroid_err_km: Vec<f64>,
    /// Median nearest-neighbour station spacing, km.
    pub nn_spacing_km: f64,
    /// Redraws.
    pub redraws: u32,
}

/// Score one synthetic seed for each tempering exponent in `tempers` (the summed log-likelihood
/// does not depend on the exponent, so it is computed once).
pub fn gate_row(p: &PowerDifferenceParams, seed: u64, tempers: &[f64]) -> GateRow {
    let s = synth_session(p, seed);
    let g = grid(p, &s.stations);
    let (a, b) = sessions(p, &s.stations, &s.epochs)[0];
    let summed = summed_loglik(p, &s.stations, &g, &s.epochs[a..b]);
    let truth_cell = g
        .centres
        .iter()
        .enumerate()
        .map(|(k, c)| (k, (c.0 - s.source.0).powi(2) + (c.1 - s.source.1).powi(2)))
        .fold(
            (0usize, f64::INFINITY),
            |acc, x| if x.1 < acc.1 { x } else { acc },
        )
        .0;
    let lvl95 = p
        .levels
        .iter()
        .position(|&l| l == 0.95)
        .unwrap_or(p.levels.len() - 1);
    let (mut covered, mut area_share, mut err) = (Vec::new(), Vec::new(), Vec::new());
    for &t in tempers {
        let mut q = p.clone();
        q.temper = t;
        let loc = locate(&q, &g, &summed);
        let r = &loc.regions[lvl95];
        covered.push(r.binary_search(&truth_cell).is_ok());
        area_share.push(r.len() as f64 / g.centres.len() as f64);
        err.push(
            ((loc.centroid.0 - s.source.0).powi(2) + (loc.centroid.1 - s.source.1).powi(2)).sqrt(),
        );
    }
    let nn: Vec<f64> = s
        .stations
        .iter()
        .enumerate()
        .map(|(i, a)| {
            s.stations
                .iter()
                .enumerate()
                .filter(|(j, _)| *j != i)
                .map(|(_, b)| {
                    ((a.east_km - b.east_km).powi(2) + (a.north_km - b.north_km).powi(2)).sqrt()
                })
                .fold(f64::INFINITY, f64::min)
        })
        .collect();
    GateRow {
        seed,
        covered,
        area_share,
        centroid_err_km: err,
        nn_spacing_km: median(nn),
        redraws: s.redraws,
    }
}

/// The tempering candidates of R9.
pub const TEMPER_CANDIDATES: [f64; 8] =
    [1.0, 0.5, 1.0 / 3.0, 0.2, 0.1, 0.05, 1.0 / 30.0, 1.0 / 60.0];

/// Summary of gate rows for candidate `k`: (S1 coverage, S2 median area share, S3 ratio).
pub fn gate_summary(rows: &[GateRow], k: usize) -> (f64, f64, f64) {
    let n = rows.len() as f64;
    let s1 = rows.iter().filter(|r| r.covered[k]).count() as f64 / n;
    let s2 = median(rows.iter().map(|r| r.area_share[k]).collect());
    let s3 = median(rows.iter().map(|r| r.centroid_err_km[k]).collect())
        / median(rows.iter().map(|r| r.nn_spacing_km).collect());
    (s1, s2, s3)
}

/// The session input of one seed as JSON, for the independent check (R15).
pub fn synth_json(p: &PowerDifferenceParams, seed: u64) -> Value {
    let s = synth_session(p, seed);
    json!({
        "seed": seed,
        "params": p.to_json(),
        "stations": s.stations.iter().map(|st| json!({
            "east_km": st.east_km, "north_km": st.north_km, "antenna_h_m": st.antenna_h_m,
            "c_nom_dbhz": st.c_nom_dbhz, "kappa_db": st.kappa_db, "noise_dbw": st.noise_dbw, "gain_dbi": st.gain_dbi,
        })).collect::<Vec<_>>(),
        "epochs": s.epochs.iter().map(|e| json!({
            "t_s": e.t_s,
            "drop_db": e.obs.iter().map(|o| o.drop_db).collect::<Vec<_>>(),
            "dagc": e.obs.iter().map(|o| o.dagc).collect::<Vec<_>>(),
        })).collect::<Vec<_>>(),
        "source": [s.source.0, s.source.1],
        "source_h_m": s.source_h_m,
    })
}

/// The engine's answer for one seed as JSON (cell count, 95% region cells, centroid), for R15.
pub fn synth_answer_json(p: &PowerDifferenceParams, seed: u64) -> Value {
    let s = synth_session(p, seed);
    let g = grid(p, &s.stations);
    let (a, b) = sessions(p, &s.stations, &s.epochs)[0];
    let summed = summed_loglik(p, &s.stations, &g, &s.epochs[a..b]);
    let loc = locate(p, &g, &summed);
    json!({
        "seed": seed, "cell_km": g.cell_km, "n_cells": g.centres.len(),
        "session": [a, b],
        "regions": loc.regions, "centroid": [loc.centroid.0, loc.centroid.1],
    })
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn drop_inversion_round_trips_through_the_anti_jam_equation() {
        let p = PowerDifferenceParams::preregistered_v1();
        for j in [-120.0, -110.0, -100.0] {
            let c = crate::jamming::effective_cn0_dbhz(45.0, j - p.signal_dbw, p.q, p.chip_rate_hz);
            let back = j_from_drop(&p, 45.0, 45.0 - c);
            assert!((back - j).abs() < 1e-9, "{j} -> {back}");
        }
    }

    #[test]
    fn hull_and_distance() {
        let h = convex_hull(&[(0.0, 0.0), (1.0, 0.0), (1.0, 1.0), (0.0, 1.0), (0.5, 0.5)]);
        assert_eq!(h.len(), 4);
        assert_eq!(hull_distance(&h, (0.5, 0.5)), 0.0);
        assert!((hull_distance(&h, (2.0, 0.5)) - 1.0).abs() < 1e-12);
    }

    #[test]
    fn gate_and_censoring() {
        let p = PowerDifferenceParams::preregistered_v1();
        let st = Station {
            east_km: 0.0,
            north_km: 0.0,
            antenna_h_m: 10.0,
            c_nom_dbhz: 45.0,
            kappa_db: None,
            noise_dbw: -130.0,
            gain_dbi: 0.0,
        };
        assert!(station_j(
            &p,
            &st,
            &Obs {
                drop_db: Some(2.0),
                dagc: None
            }
        )
        .is_none());
        let j = station_j(
            &p,
            &st,
            &Obs {
                drop_db: Some(3.0),
                dagc: None,
            },
        )
        .unwrap_or(f64::NAN);
        assert!((j - j_min(&p, &st)).abs() < 1e-12);
    }

    #[test]
    fn synthetic_sessions_are_reproducible() {
        let p = PowerDifferenceParams::preregistered_v1();
        assert_eq!(synth_session(&p, 7), synth_session(&p, 7));
    }
}
