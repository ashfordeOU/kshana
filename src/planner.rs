// SPDX-License-Identifier: AGPL-3.0-only
//! The monitoring-network planner (0.41 row B1a). For an interference source of a stated power placed
//! in turn at every cell of a site grid, it gives each station's detection probability, the network's,
//! the probability that enough stations detect to locate it, and the TDOA location accuracy the
//! detecting stations bound (DRMS and the 95 % ellipse). It also chooses `m` stations from a set of
//! candidates.
//!
//! The definitions are fixed in `docs/design/evidence/b1a-planner/PREREGISTRATION.md`, with the readings
//! of part 1 in `xval/planner/README.md`. The maps are MODELLED: predictions from a geometry and a link
//! budget (free space), not measurements.

use crate::frames::{geodetic_to_ecef, Geodetic, Vec3};
use crate::geolocation::{tdoa_crlb_cov, tdoa_crlb_on_sphere};
use crate::portable_math::PortableFloat;
use serde::{Deserialize, Serialize};

/// Speed of light, m/s.
const C: f64 = 299_792_458.0;
/// Boltzmann's constant, J/K.
const K_B: f64 = 1.380_649e-23;
/// Reference noise temperature, K.
const T0: f64 = 290.0;
/// Largest number of subsets searched exhaustively.
pub const EXHAUSTIVE_MAX: u64 = 10_000;

/// The site grid.
#[derive(Clone, Debug, Serialize, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct Site {
    /// Southern edge, degrees.
    pub lat_min: f64,
    /// Northern edge, degrees.
    pub lat_max: f64,
    /// Western edge, degrees.
    pub lon_min: f64,
    /// Eastern edge, degrees.
    pub lon_max: f64,
    /// Grid rows (latitudes), at least 2.
    pub n_lat: usize,
    /// Grid columns (longitudes), at least 2.
    pub n_lon: usize,
}

/// The interference source placed at each cell.
#[derive(Clone, Debug, Serialize, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct Source {
    /// Effective isotropic radiated power, dBW.
    pub eirp_dbw: f64,
    /// Height above the WGS 84 ellipsoid, m.
    pub height_m: f64,
    /// Frequency, Hz.
    pub freq_hz: f64,
}

/// The stations' receiver and detector.
#[derive(Clone, Debug, Serialize, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct Receiver {
    /// Noise figure, dB.
    pub noise_figure_db: f64,
    /// Detector bandwidth, Hz.
    pub bandwidth_hz: f64,
    /// Integration time, s.
    pub integration_s: f64,
    /// False-alarm probability per decision.
    pub p_fa: f64,
}

/// A station or candidate position.
#[derive(Clone, Debug, PartialEq, Serialize, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct StationSite {
    /// Latitude, degrees.
    pub lat_deg: f64,
    /// Longitude, degrees.
    pub lon_deg: f64,
    /// Height above the WGS 84 ellipsoid, m.
    pub height_m: f64,
    /// Antenna gain toward the source, dBi.
    pub gain_dbi: f64,
}

/// Which bound locates the source.
#[derive(Clone, Copy, Debug, PartialEq, Eq, Serialize, Deserialize)]
#[serde(rename_all = "lowercase")]
pub enum Mode {
    /// The source is known to lie on the geocentric sphere through it (on the ground): `k = 3`.
    Surface,
    /// Unconstrained position: `k = 4`.
    #[serde(rename = "3d")]
    ThreeD,
}

impl Mode {
    /// Stations needed to locate.
    pub fn k(self) -> usize {
        match self {
            Mode::Surface => 3,
            Mode::ThreeD => 4,
        }
    }
}

/// A planner input (`kshana.planner/1`).
#[derive(Clone, Debug, Serialize, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct PlanSpec {
    /// `kshana.planner/1`.
    pub schema: String,
    /// The site grid.
    pub site: Site,
    /// The source.
    pub source: Source,
    /// The receiver and detector.
    pub receiver: Receiver,
    /// TDOA standard deviation, s (each range difference has `c·σ_τ`).
    pub sigma_tau_s: f64,
    /// Locating bound.
    pub mode: Mode,
    /// A station contributes to the accuracy map when its detection probability is at least this.
    pub gate_pd: f64,
    /// Accuracy requirement of the placement objective, m.
    pub d_req_m: f64,
    /// Stations of the map.
    #[serde(default)]
    pub stations: Vec<StationSite>,
    /// Candidates for placement.
    #[serde(default)]
    pub candidates: Vec<StationSite>,
    /// Stations to place.
    #[serde(default)]
    pub m: Option<usize>,
    /// Search beyond the exhaustive limit: `greedy+exchange2+restarts` (default, B1a v3 readings 20 to 22),
    /// `greedy+exchange` (v2) or `greedy` (v1).
    #[serde(default, skip_serializing_if = "Option::is_none")]
    pub search: Option<String>,
}

/// One cell of the map.
#[derive(Clone, Debug, PartialEq, Serialize, Deserialize)]
pub struct Cell {
    /// Latitude, degrees.
    pub lat_deg: f64,
    /// Longitude, degrees.
    pub lon_deg: f64,
    /// Each station's detection probability.
    pub p_d: Vec<f64>,
    /// Probability that at least one station detects.
    pub p_any: f64,
    /// Probability that at least `k` stations detect.
    pub p_k: f64,
    /// Horizontal DRMS, m (`None`: not locatable).
    pub drms_m: Option<f64>,
    /// 95 % ellipse semi-axes, m, larger first.
    pub ellipse_m: Option<[f64; 2]>,
    /// `true` when the horizontal block's condition number exceeds [`ILL_CONDITIONED`]: the figures
    /// there are not meaningful beyond the rounding of the inversion. Absent otherwise (B1a v2
    /// reading 13, as amended).
    #[serde(default, skip_serializing_if = "Option::is_none")]
    pub ill_conditioned: Option<bool>,
}

/// Condition-number limit of the horizontal block (B1a v2 reading 13).
pub const ILL_CONDITIONED: f64 = 1e8;

/// A map.
#[derive(Clone, Debug, PartialEq, Serialize, Deserialize)]
pub struct Map {
    /// Cells, row-major (latitude first).
    pub cells: Vec<Cell>,
}

/// A placement.
#[derive(Clone, Debug, PartialEq, Serialize, Deserialize)]
pub struct Placement {
    /// Candidate indices chosen, ascending.
    pub subset: Vec<usize>,
    /// Share of cells with `P_k ≥ 0.9` and `DRMS ≤ d_req`.
    pub objective: f64,
    /// Median DRMS over all cells (`None` when infinite: most cells not locatable).
    pub median_drms_m: Option<f64>,
    /// `exhaustive`, `greedy`, `greedy+exchange` or `greedy+exchange2+restarts`.
    #[serde(default, skip_serializing_if = "Option::is_none")]
    pub method: Option<String>,
}

// ------------------------------------------------------------ full-precision normal functions

/// Φ(x) to full double precision.
pub fn phi(x: f64) -> f64 {
    0.5 * libm::erfc(-x / std::f64::consts::SQRT_2)
}

/// Φ⁻¹(p) to full double precision: Acklam's approximation refined by two Halley steps on [`phi`].
pub fn phi_inv(p: f64) -> f64 {
    let mut x = crate::detection::normal_inv_cdf(p);
    if !x.is_finite() {
        return x;
    }
    for _ in 0..2 {
        let e = phi(x) - p;
        let u = e * (2.0 * std::f64::consts::PI).sqrt() * (0.5 * x * x).pexp();
        x -= u / (1.0 + 0.5 * x * u);
    }
    x
}

// ------------------------------------------------------------ the map

fn ecef(s: &StationSite) -> Vec3 {
    geodetic_to_ecef(Geodetic {
        lat_rad: s.lat_deg.to_radians(),
        lon_rad: s.lon_deg.to_radians(),
        alt_m: s.height_m,
    })
}

fn grid(site: &Site) -> Vec<(f64, f64)> {
    let mut out = Vec::with_capacity(site.n_lat * site.n_lon);
    for j in 0..site.n_lat {
        let lat = site.lat_min + j as f64 * (site.lat_max - site.lat_min) / (site.n_lat - 1) as f64;
        for i in 0..site.n_lon {
            out.push((
                lat,
                site.lon_min + i as f64 * (site.lon_max - site.lon_min) / (site.n_lon - 1) as f64,
            ));
        }
    }
    out
}

/// The probability that at least `k` of independent events with probabilities `ps` occur (exact
/// Poisson-binomial recursion).
pub fn at_least(ps: &[f64], k: usize) -> f64 {
    let mut dist = vec![1.0];
    for &p in ps {
        let mut next = vec![0.0; dist.len() + 1];
        for (j, &q) in dist.iter().enumerate() {
            next[j] += q * (1.0 - p);
            next[j + 1] += q * p;
        }
        dist = next;
    }
    dist.iter().skip(k).sum()
}

/// Detection constants of a receiver: `(σ, γ, noise power W)`.
fn detector(rx: &Receiver) -> (f64, f64, f64) {
    let sigma = 1.0 / (rx.bandwidth_hz * rx.integration_s).sqrt();
    let gamma = sigma * phi_inv(1.0 - rx.p_fa / 2.0);
    let noise_w = K_B * T0 * 10f64.ppowf(rx.noise_figure_db / 10.0) * rx.bandwidth_hz;
    (sigma, gamma, noise_w)
}

/// One station's mean statistic (its INR) for the source at `x`.
fn inr(spec: &PlanSpec, noise_w: f64, x: Vec3, st: &StationSite, r: Vec3) -> f64 {
    let d = dist(x, r);
    let lambda = C / spec.source.freq_hz;
    let p_dbw = spec.source.eirp_dbw - 20.0 * (4.0 * std::f64::consts::PI * d / lambda).plog10()
        + st.gain_dbi;
    10f64.ppowf(p_dbw / 10.0) / noise_w
}

fn dist(a: Vec3, b: Vec3) -> f64 {
    ((a[0] - b[0]) * (a[0] - b[0]) + (a[1] - b[1]) * (a[1] - b[1]) + (a[2] - b[2]) * (a[2] - b[2]))
        .sqrt()
}

/// A station's detection probability for mean `mu` (the two-sided energy detector of
/// `detection::analytic_pd`, in full precision).
fn p_detect(mu: f64, sigma: f64, gamma: f64) -> f64 {
    1.0 - (phi((gamma - mu) / sigma) - phi((-gamma - mu) / sigma))
}

/// The horizontal covariance (east, north) of the locating bound at `x` from the stations `used`.
/// `lat`, `lon` (radians) are the cell's geodetic position, which sets east and north.
pub fn horizontal_cov(
    mode: Mode,
    used: &[Vec3],
    x: Vec3,
    (lat, lon): (f64, f64),
    sigma_tau_s: f64,
) -> Option<[[f64; 2]; 2]> {
    let q = (C * sigma_tau_s) * (C * sigma_tau_s);
    let n = used.len().checked_sub(1)?;
    let q_rd: Vec<Vec<f64>> = (0..n)
        .map(|i| (0..n).map(|j| if i == j { q } else { 0.0 }).collect())
        .collect();
    let cov = match mode {
        Mode::Surface => tdoa_crlb_on_sphere(used, x, &q_rd)?,
        Mode::ThreeD => tdoa_crlb_cov(used, x, &q_rd)?,
    };
    let (sl, cl) = lat.psin_cos();
    let (so, co) = lon.psin_cos();
    let e = [[-so, co, 0.0], [-sl * co, -sl * so, cl]];
    let mut ch = [[0.0; 2]; 2];
    for a in 0..2 {
        for b in 0..2 {
            let mut s = 0.0;
            for i in 0..3 {
                for j in 0..3 {
                    s += e[a][i] * cov[i][j] * e[b][j];
                }
            }
            ch[a][b] = s;
        }
    }
    Some(ch)
}

/// The map for `stations`.
pub fn map_for(spec: &PlanSpec, stations: &[StationSite]) -> Map {
    let (sigma, gamma, noise_w) = detector(&spec.receiver);
    let pos: Vec<Vec3> = stations.iter().map(ecef).collect();
    let k = spec.mode.k();
    let chi2 = -2.0 * 0.05f64.pln();
    let cells = grid(&spec.site)
        .into_iter()
        .map(|(lat, lon)| {
            let x = geodetic_to_ecef(Geodetic {
                lat_rad: lat.to_radians(),
                lon_rad: lon.to_radians(),
                alt_m: spec.source.height_m,
            });
            let p_d: Vec<f64> = stations
                .iter()
                .zip(&pos)
                .map(|(s, &r)| p_detect(inr(spec, noise_w, x, s, r), sigma, gamma))
                .collect();
            let p_any = 1.0 - p_d.iter().map(|p| 1.0 - p).product::<f64>();
            let p_k = at_least(&p_d, k);
            let used: Vec<Vec3> = p_d
                .iter()
                .zip(&pos)
                .filter(|(p, _)| **p >= spec.gate_pd)
                .map(|(_, &r)| r)
                .collect();
            let ch = if used.len() >= k {
                horizontal_cov(
                    spec.mode,
                    &used,
                    x,
                    (lat.to_radians(), lon.to_radians()),
                    spec.sigma_tau_s,
                )
            } else {
                None
            };
            let mut ill = None;
            let (drms_m, ellipse_m) = match ch {
                Some(c) => {
                    let tr = c[0][0] + c[1][1];
                    let det = c[0][0] * c[1][1] - c[0][1] * c[1][0];
                    let disc = (0.25 * (c[0][0] - c[1][1]) * (c[0][0] - c[1][1])
                        + c[0][1] * c[1][0])
                        .max(0.0)
                        .sqrt();
                    let (l1, l2) = (0.5 * tr + disc, (det / (0.5 * tr + disc)).max(0.0));
                    if !(l2 > 0.0 && l1 / l2 <= ILL_CONDITIONED) {
                        ill = Some(true);
                    }
                    (
                        Some(tr.sqrt()),
                        Some([(chi2 * l1).sqrt(), (chi2 * l2).sqrt()]),
                    )
                }
                None => (None, None),
            };
            Cell {
                lat_deg: lat,
                lon_deg: lon,
                p_d,
                p_any,
                p_k,
                drms_m,
                ellipse_m,
                ill_conditioned: ill,
            }
        })
        .collect();
    Map { cells }
}

/// The map for the spec's stations.
pub fn map(spec: &PlanSpec) -> Result<Map, String> {
    check(spec)?;
    Ok(map_for(spec, &spec.stations))
}

fn check(spec: &PlanSpec) -> Result<(), String> {
    let s = &spec.site;
    let ok = spec.schema == "kshana.planner/1"
        && s.n_lat >= 2
        && s.n_lon >= 2
        && s.n_lat * s.n_lon <= 1_000_000
        && s.lat_max > s.lat_min
        && s.lon_max > s.lon_min
        && spec.source.freq_hz > 0.0
        && spec.receiver.bandwidth_hz > 0.0
        && spec.receiver.integration_s > 0.0
        && spec.receiver.p_fa > 0.0
        && spec.receiver.p_fa < 1.0
        && spec.sigma_tau_s > 0.0
        && matches!(
            spec.search.as_deref(),
            None | Some("greedy") | Some("greedy+exchange") | Some("greedy+exchange2+restarts")
        );
    if ok {
        Ok(())
    } else {
        Err(crate::terr!("e-planner-spec"))
    }
}

// ------------------------------------------------------------ placement

/// `(cells meeting the objective, median DRMS)` for `stations`.
fn score(spec: &PlanSpec, stations: &[StationSite]) -> (usize, f64) {
    let m = map_for(spec, stations);
    let good = m
        .cells
        .iter()
        .filter(|c| c.p_k >= 0.9 && c.drms_m.is_some_and(|d| d <= spec.d_req_m))
        .count();
    let mut dr: Vec<f64> = m
        .cells
        .iter()
        .map(|c| c.drms_m.unwrap_or(f64::INFINITY))
        .collect();
    dr.sort_by(f64::total_cmp);
    (good, dr[(dr.len() - 1) / 2])
}

/// Whether `(a_good, a_med, a_sub)` is better than `b` under the objective and its tie-break.
fn better(a: (usize, f64, &[usize]), b: (usize, f64, &[usize])) -> bool {
    a.0 > b.0 || (a.0 == b.0 && (a.1 < b.1 || (a.1 == b.1 && a.2 < b.2)))
}

fn n_choose(n: usize, m: usize) -> u64 {
    if m > n {
        return 0;
    }
    let mut r: u64 = 1;
    for i in 0..m as u64 {
        r = r.saturating_mul(n as u64 - i) / (i + 1);
    }
    r
}

/// Number of starts of the v3 search (B1a v3 reading 21).
const RESTARTS: usize = 8;
/// Seed of the v3 search's drawn starts (B1a v3 reading 21).
const RESTART_SEED: u64 = 0xB1B1;

fn pick_of(spec: &PlanSpec, sub: &[usize]) -> Vec<StationSite> {
    sub.iter().map(|&i| spec.candidates[i].clone()).collect()
}

/// Greedy growth (reading 9): each step takes the candidate best under the objective's order.
fn greedy_subset(spec: &PlanSpec, n: usize, m: usize) -> Result<(Vec<usize>, usize, f64), String> {
    let mut chosen: Vec<usize> = Vec::new();
    let mut last = (0usize, f64::INFINITY);
    for _ in 0..m {
        let mut step: Option<(Vec<usize>, usize, f64)> = None;
        for c in (0..n).filter(|c| !chosen.contains(c)) {
            let mut sub = chosen.clone();
            sub.push(c);
            sub.sort_unstable();
            let (g, med) = score(spec, &pick_of(spec, &sub));
            if step
                .as_ref()
                .is_none_or(|(s, bg, bm)| better((g, med, &sub), (*bg, *bm, s)))
            {
                step = Some((sub, g, med));
            }
        }
        let (s, g, md) = step.ok_or_else(|| crate::terr!("e-planner-placement"))?;
        chosen = s;
        last = (g, md);
    }
    Ok((chosen, last.0, last.1))
}

/// Single-exchange local search (B1a v2 reading 15): the best strictly improving swap, until none.
fn single_exchange(
    spec: &PlanSpec,
    n: usize,
    mut chosen: Vec<usize>,
    mut last: (usize, f64),
) -> (Vec<usize>, usize, f64) {
    loop {
        let mut step: Option<(Vec<usize>, usize, f64)> = None;
        for pos in 0..chosen.len() {
            for c in (0..n).filter(|c| !chosen.contains(c)) {
                let mut sub = chosen.clone();
                sub[pos] = c;
                sub.sort_unstable();
                let (g, med) = score(spec, &pick_of(spec, &sub));
                let cur = step
                    .as_ref()
                    .map_or((last.0, last.1, chosen.as_slice()), |(s, bg, bm)| {
                        (*bg, *bm, s.as_slice())
                    });
                if better((g, med, &sub), cur) {
                    step = Some((sub, g, med));
                }
            }
        }
        match step {
            Some((s, g, md)) => {
                chosen = s;
                last = (g, md);
            }
            None => return (chosen, last.0, last.1),
        }
    }
}

/// One double-exchange step (B1a v3 reading 20): the best strictly improving swap of two chosen for two
/// unchosen candidates, if any.
fn double_step(
    spec: &PlanSpec,
    n: usize,
    chosen: &[usize],
    last: (usize, f64),
) -> Option<(Vec<usize>, usize, f64)> {
    let out: Vec<usize> = (0..n).filter(|c| !chosen.contains(c)).collect();
    let mut step: Option<(Vec<usize>, usize, f64)> = None;
    for p in 0..chosen.len() {
        for q in p + 1..chosen.len() {
            for (ia, &a) in out.iter().enumerate() {
                for &b in &out[ia + 1..] {
                    let mut sub = chosen.to_vec();
                    sub[p] = a;
                    sub[q] = b;
                    sub.sort_unstable();
                    let (g, med) = score(spec, &pick_of(spec, &sub));
                    let cur = step
                        .as_ref()
                        .map_or((last.0, last.1, chosen), |(s, bg, bm)| {
                            (*bg, *bm, s.as_slice())
                        });
                    if better((g, med, &sub), cur) {
                        step = Some((sub, g, med));
                    }
                }
            }
        }
    }
    step
}

/// Single exchange to a local optimum, then a double step; repeat while the double step improves
/// (B1a v3 reading 20).
fn local_search(
    spec: &PlanSpec,
    n: usize,
    start: Vec<usize>,
    sc: (usize, f64),
) -> (Vec<usize>, usize, f64) {
    let (mut s, mut g, mut md) = single_exchange(spec, n, start, sc);
    while let Some((s2, g2, md2)) = double_step(spec, n, &s, (g, md)) {
        (s, g, md) = single_exchange(spec, n, s2, (g2, md2));
    }
    (s, g, md)
}

/// Choose `m` of the candidates: exhaustive when there are at most [`EXHAUSTIVE_MAX`] subsets,
/// otherwise the v3 search (B1a v3 readings 20 to 22; `search: "greedy+exchange"` gives v2's single
/// exchange and `search: "greedy"` v1's greedy alone).
pub fn place(spec: &PlanSpec) -> Result<Placement, String> {
    check(spec)?;
    let n = spec.candidates.len();
    let m = spec
        .m
        .filter(|&m| m >= 1 && m <= n)
        .ok_or_else(|| crate::terr!("e-planner-placement"))?;
    let cells = (spec.site.n_lat * spec.site.n_lon) as f64;
    let pick = |sub: &[usize]| -> Vec<StationSite> {
        sub.iter().map(|&i| spec.candidates[i].clone()).collect()
    };
    let (best, good, med, method) = if n_choose(n, m) <= EXHAUSTIVE_MAX {
        let mut idx: Vec<usize> = (0..m).collect();
        let mut best: Option<(Vec<usize>, usize, f64)> = None;
        loop {
            let (g, med) = score(spec, &pick(&idx));
            if best
                .as_ref()
                .is_none_or(|(s, bg, bm)| better((g, med, &idx), (*bg, *bm, s)))
            {
                best = Some((idx.clone(), g, med));
            }
            // Next combination in lexicographic order.
            let mut i = m;
            while i > 0 && idx[i - 1] == n - m + i - 1 {
                i -= 1;
            }
            if i == 0 {
                break;
            }
            idx[i - 1] += 1;
            for j in i..m {
                idx[j] = idx[j - 1] + 1;
            }
        }
        let (s, g, md) = best.ok_or_else(|| crate::terr!("e-planner-placement"))?;
        (s, g, md, "exhaustive")
    } else {
        let (greedy, g0, m0) = greedy_subset(spec, n, m)?;
        match spec.search.as_deref() {
            Some("greedy") => (greedy, g0, m0, "greedy"),
            Some("greedy+exchange") => {
                let (s, g, md) = single_exchange(spec, n, greedy, (g0, m0));
                (s, g, md, "greedy+exchange")
            }
            _ => {
                // B1a v3 readings 20 and 21: eight starts (greedy, then 7 drawn with seed 0xB1B1), each
                // improved by single and double exchange; the best final subset is kept.
                use rand::{Rng, SeedableRng};
                let mut rng = rand_chacha::ChaCha20Rng::seed_from_u64(RESTART_SEED);
                let mut starts = vec![greedy];
                for _ in 1..RESTARTS {
                    let mut pool: Vec<usize> = (0..n).collect();
                    let mut sub: Vec<usize> = (0..m)
                        .map(|_| pool.remove(rng.gen_range(0..pool.len())))
                        .collect();
                    sub.sort_unstable();
                    starts.push(sub);
                }
                let mut best: Option<(Vec<usize>, usize, f64)> = None;
                for st in starts {
                    let sc = score(spec, &pick(&st));
                    let (s, g, md) = local_search(spec, n, st, sc);
                    if best
                        .as_ref()
                        .is_none_or(|(bs, bg, bm)| better((g, md, &s), (*bg, *bm, bs)))
                    {
                        best = Some((s, g, md));
                    }
                }
                let (s, g, md) = best.ok_or_else(|| crate::terr!("e-planner-placement"))?;
                (s, g, md, "greedy+exchange2+restarts")
            }
        }
    };
    Ok(Placement {
        subset: best,
        objective: good as f64 / cells,
        median_drms_m: med.is_finite().then_some(med),
        method: Some(method.into()),
    })
}

/// The objective of a given subset of the candidates (for comparing placements).
pub fn objective_of(spec: &PlanSpec, subset: &[usize]) -> (f64, f64) {
    let st: Vec<StationSite> = subset.iter().map(|&i| spec.candidates[i].clone()).collect();
    let (g, med) = score(spec, &st);
    (g as f64 / (spec.site.n_lat * spec.site.n_lon) as f64, med)
}

// ------------------------------------------------------------ the surface solver (bar P2)

/// Locate a source known to lie on the geocentric sphere `‖x‖ = radius` from range differences
/// `rd[i] = R_{i+1} − R_0` (m) with equal independent weights: Gauss–Newton on two tangent-plane
/// coordinates, started at `x0` and kept on the sphere. `None` on a singular step or no convergence.
pub fn solve_tdoa_on_sphere(receivers: &[Vec3], rd: &[f64], radius: f64, x0: Vec3) -> Option<Vec3> {
    if receivers.len() < 3 || rd.len() != receivers.len() - 1 {
        return None;
    }
    let mut x = x0;
    for _ in 0..50 {
        let r = (x[0] * x[0] + x[1] * x[1] + x[2] * x[2]).sqrt();
        let n = [x[0] / r, x[1] / r, x[2] / r];
        let a = if n[0].abs() < 0.9 {
            [1.0, 0.0, 0.0]
        } else {
            [0.0, 1.0, 0.0]
        };
        let e1 = unit(cross(n, a));
        let e2 = cross(n, e1);
        let d0 = dist(x, receivers[0]);
        let u0 = [
            (x[0] - receivers[0][0]) / d0,
            (x[1] - receivers[0][1]) / d0,
            (x[2] - receivers[0][2]) / d0,
        ];
        let (mut a11, mut a12, mut a22, mut b1, mut b2) = (0.0, 0.0, 0.0, 0.0, 0.0);
        for (i, rcv) in receivers.iter().enumerate().skip(1) {
            let di = dist(x, *rcv);
            let ui = [
                (x[0] - rcv[0]) / di,
                (x[1] - rcv[1]) / di,
                (x[2] - rcv[2]) / di,
            ];
            let g = [ui[0] - u0[0], ui[1] - u0[1], ui[2] - u0[2]];
            let (h1, h2) = (dot(g, e1), dot(g, e2));
            let res = rd[i - 1] - (di - d0);
            a11 += h1 * h1;
            a12 += h1 * h2;
            a22 += h2 * h2;
            b1 += h1 * res;
            b2 += h2 * res;
        }
        let det = a11 * a22 - a12 * a12;
        if det.abs() < 1e-300 || !det.is_finite() {
            return None;
        }
        let s1 = (a22 * b1 - a12 * b2) / det;
        let s2 = (a11 * b2 - a12 * b1) / det;
        let y = [
            x[0] + s1 * e1[0] + s2 * e2[0],
            x[1] + s1 * e1[1] + s2 * e2[1],
            x[2] + s1 * e1[2] + s2 * e2[2],
        ];
        let ry = (y[0] * y[0] + y[1] * y[1] + y[2] * y[2]).sqrt();
        x = [y[0] * radius / ry, y[1] * radius / ry, y[2] * radius / ry];
        if s1.phypot(s2) < 1e-6 {
            return Some(x);
        }
    }
    None
}

fn dot(a: Vec3, b: Vec3) -> f64 {
    a[0] * b[0] + a[1] * b[1] + a[2] * b[2]
}

fn cross(a: Vec3, b: Vec3) -> Vec3 {
    [
        a[1] * b[2] - a[2] * b[1],
        a[2] * b[0] - a[0] * b[2],
        a[0] * b[1] - a[1] * b[0],
    ]
}

fn unit(a: Vec3) -> Vec3 {
    let n = dot(a, a).sqrt();
    [a[0] / n, a[1] / n, a[2] / n]
}

// ------------------------------------------------------------ text surfaces

/// `kshana planner map|place <spec.json>` as JSON text: the bytes the command line, Python and
/// WebAssembly give.
pub fn run_json(kind: &str, spec_json: &str) -> Result<String, String> {
    let spec: PlanSpec =
        serde_json::from_str(spec_json).map_err(|e| crate::terr!("e-planner-parse", e = e))?;
    let v = match kind {
        "map" => serde_json::to_string(&map(&spec)?),
        "place" => serde_json::to_string(&place(&spec)?),
        _ => return Err(crate::t!("planner-usage")),
    };
    v.map_err(|e| e.to_string())
}

/// `kshana planner map|place <spec.json>`.
#[cfg(not(target_arch = "wasm32"))]
pub fn run(args: &[String]) -> Result<(), String> {
    let (kind, path) = match args {
        [k, p] if !p.starts_with("--") => (k.as_str(), p),
        _ => return Err(crate::t!("planner-usage")),
    };
    let text = std::fs::read_to_string(path).map_err(|e| format!("{path}: {e}"))?;
    println!("{}", run_json(kind, &text)?);
    Ok(())
}
