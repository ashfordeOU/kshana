// SPDX-License-Identifier: AGPL-3.0-only
//! M5 (0.41): GNSS interference sources seen from orbit, and a space + ground hybrid.
//! `docs/design/evidence/m5-jammers-from-orbit-hybrid/PREREGISTRATION.md`, readings
//! `xval/m5-jammers-from-orbit/README.md` (cited R1 to R12). MODELLED: synthetic scenario only;
//! neutral wording: interference source, location, uncertainty.

use rand::{Rng, SeedableRng};
use rand_chacha::ChaCha8Rng;
use serde_json::{json, Value};

use crate::interference_map::emitter::{los_reach_km, Proj};
use crate::locate_pd::{grid, locate, summed_loglik_from_power, PowerDifferenceParams, Station};
use crate::portable_math::PortableFloat;
use crate::tip_and_cue::{baltic_points, M1_POINTS};

const MU: f64 = 3.986_004_418e14;
/// Sphere radius, m (M2 reading 3).
pub const R_M: f64 = 6_378_137.0;
const J2: f64 = 1.082_626_68e-3;
const WE: f64 = 7.292_115_146_7e-5;
const A_M: f64 = 6_928_137.0;
const INC_DEG: f64 = 97.59;
/// L1 carrier, Hz.
pub const F_HZ: f64 = 1_575.42e6;
const C: f64 = 299_792_458.0;
const K_B: f64 = 1.380_649e-23;
const T_SYS: f64 = 500.0;
/// Noise bandwidth, Hz.
pub const B_HZ: f64 = 2e6;
const T_INT: f64 = 1.0;
const PFA: f64 = 1e-6;
const DEG: f64 = std::f64::consts::PI / 180.0;
/// EIRP classes (name, dBm).
pub const CLASSES: [(&str, f64); 3] = [("E10", 10.0), ("E30", 30.0), ("E40", 40.0)];
/// The 14 ground sites (lat, lon) of section 2.
pub const SITES: [(f64, f64); 14] = [
    (54.32, 10.14),
    (54.18, 12.09),
    (55.10, 14.70),
    (54.52, 18.55),
    (55.70, 21.13),
    (56.95, 24.10),
    (59.44, 24.75),
    (60.17, 24.94),
    (57.64, 18.29),
    (56.16, 15.59),
    (60.10, 19.94),
    (63.10, 21.60),
    (65.00, 25.40),
    (62.39, 17.31),
];
const SITE_H_M: f64 = 30.0;
const GROUND_MIN_DBW: f64 = -140.0; // -110 dBm
const SIGMA_SH: f64 = 6.0;
/// v2 (R14): reports per site and draw, one per second, sharing one shadowing value.
pub const V2_REPORTS: usize = 30;
/// v2 (R14): per-report measurement noise, dB.
const SIGMA_MEAS_V2: f64 = 1.0;
/// v2 (R16): the placement and draw seeds of the scored run.
pub const V2_SEEDS: (u64, u64) = (4600, 4601);
/// v2 (R17): the seed of the unscored implementation checks.
pub const V2_CHECK_SEED: u64 = 4699;

type V3 = [f64; 3];

fn sub(a: V3, b: V3) -> V3 {
    [a[0] - b[0], a[1] - b[1], a[2] - b[2]]
}
fn dot(a: V3, b: V3) -> f64 {
    a[0] * b[0] + a[1] * b[1] + a[2] * b[2]
}
fn norm(a: V3) -> f64 {
    dot(a, a).sqrt()
}

/// Earth-fixed position and velocity of a satellite of plane 1 with initial argument of latitude
/// `u0` (R1; M2 readings 1, 2, with the analytic velocity).
pub fn sat_state(u0: f64, t: f64) -> (V3, V3) {
    let n = (MU / (A_M * A_M * A_M)).sqrt();
    let inc = INC_DEG * DEG;
    let (si, ci) = inc.psin_cos();
    let fac = n * J2 * (R_M / A_M) * (R_M / A_M);
    let raan_dot = -1.5 * fac * ci;
    let argp_dot = 0.75 * fac * (5.0 * ci * ci - 1.0);
    let ud = n + argp_dot;
    let u = u0 + ud * t;
    let nu_d = raan_dot - WE;
    let nu = nu_d * t;
    let (su, cu) = u.psin_cos();
    let (sn, cn) = nu.psin_cos();
    let (x, y, z) = (A_M * cu, A_M * su * ci, A_M * su * si);
    let (xd, yd, zd) = (-A_M * su * ud, A_M * cu * ci * ud, A_M * cu * si * ud);
    let p = [x * cn - y * sn, x * sn + y * cn, z];
    let v = [
        xd * cn - yd * sn - nu_d * (x * sn + y * cn),
        xd * sn + yd * cn + nu_d * (x * cn - y * sn),
        zd,
    ];
    (p, v)
}

/// Slant range (m) from a source to the receiver with initial argument of latitude `u0` at `t`.
pub fn range_m(lat: f64, lon: f64, h: f64, u0: f64, t: f64) -> f64 {
    norm(sub(point(lat, lon, h).0, sat_state(u0, t).0))
}

/// Initial arguments of latitude of the three receivers (lead, 50 km and 100 km behind).
pub fn formation_u0() -> [f64; 3] {
    [0.0, -50e3 / A_M, -100e3 / A_M]
}

fn point(lat: f64, lon: f64, h: f64) -> (V3, V3) {
    let (sp, cp) = (lat * DEG).psin_cos();
    let (sl, cl) = (lon * DEG).psin_cos();
    let u = [cp * cl, cp * sl, sp];
    ([(R_M + h) * u[0], (R_M + h) * u[1], (R_M + h) * u[2]], u)
}

fn sin_elev(s: V3, p: V3, u: V3) -> f64 {
    let d = sub(s, p);
    dot(d, u) / norm(d)
}

/// The pass of R1 at a point: its steps (s) at which all three receivers are at >= 10 deg, and the
/// step of highest elevation of the middle receiver.
pub fn pass(lat: f64, lon: f64, h: f64) -> Option<(Vec<f64>, f64)> {
    let (p, u) = point(lat, lon, h);
    let u0 = formation_u0();
    let (s10, s20) = ((10.0 * DEG).psin(), (20.0 * DEG).psin());
    let steps: Vec<f64> = (0..=8640).map(|k| f64::from(k) * 10.0).collect();
    let mid: Vec<f64> = steps
        .iter()
        .map(|&t| sin_elev(sat_state(u0[1], t).0, p, u))
        .collect();
    let mut i = 0;
    while i < mid.len() {
        if mid[i] >= s10 {
            let mut j = i;
            while j < mid.len() && mid[j] >= s10 {
                j += 1;
            }
            let seg = &mid[i..j];
            let (kmax, vmax) = seg
                .iter()
                .enumerate()
                .fold(
                    (0, f64::NEG_INFINITY),
                    |a, (k, &v)| if v > a.1 { (k, v) } else { a },
                );
            if vmax >= s20 {
                let ep: Vec<f64> = (i..j)
                    .map(|k| steps[k])
                    .filter(|&t| u0.iter().all(|&q| sin_elev(sat_state(q, t).0, p, u) >= s10))
                    .collect();
                return Some((ep, steps[i + kmax]));
            }
            i = j;
        } else {
            i += 1;
        }
    }
    None
}

fn q_func(x: f64) -> f64 {
    0.5 * libm::erfc(x / std::f64::consts::SQRT_2)
}

/// Wilson-Hilferty tail `P(chi2_k > x)` (R3).
pub fn wh_tail(x: f64, k: f64) -> f64 {
    let m = 1.0 - 2.0 / (9.0 * k);
    let s = (2.0 / (9.0 * k)).sqrt();
    q_func(((x / k).ppowf(1.0 / 3.0) - m) / s)
}

/// The detector threshold for the false-alarm probability (R3), by bisection.
pub fn threshold() -> f64 {
    let k = 2.0 * B_HZ * T_INT;
    let (mut lo, mut hi) = (0.5 * k, 2.0 * k);
    for _ in 0..200 {
        let mid = 0.5 * (lo + hi);
        if wh_tail(mid, k) > PFA {
            lo = mid;
        } else {
            hi = mid;
        }
    }
    0.5 * (lo + hi)
}

/// Received power (dBW), SNR (linear) and detection probability of one receiver (R2, R3).
pub fn link(eirp_dbm: f64, range_m: f64, x0: f64) -> (f64, f64, f64) {
    let fspl = 20.0 * (4.0 * std::f64::consts::PI * range_m * F_HZ / C).plog10();
    let pr = eirp_dbm - 30.0 - fspl;
    let noise = K_B * T_SYS * B_HZ;
    let g = 10f64.ppowf(pr / 10.0) / noise;
    let k = 2.0 * B_HZ * T_INT;
    (pr, g, wh_tail(x0 / (1.0 + g), k))
}

fn fspl_db(range_m: f64) -> f64 {
    20.0 * (4.0 * std::f64::consts::PI * range_m * F_HZ / C).plog10()
}

/// One space measurement epoch: time and the three receivers' SNRs.
#[derive(Clone, Debug)]
struct SpaceEpoch {
    t: f64,
    tdoa: [f64; 2],
    fdoa: [f64; 2],
    s_tau: [f64; 2],
    s_f: [f64; 2],
}

fn predict(p: V3, t: f64) -> ([f64; 2], [f64; 2]) {
    let u0 = formation_u0();
    let st: Vec<(V3, V3)> = u0.iter().map(|&q| sat_state(q, t)).collect();
    let r: Vec<f64> = st.iter().map(|(s, _)| norm(sub(p, *s))).collect();
    let rd: Vec<f64> = st
        .iter()
        .map(|(s, v)| dot(sub(*s, p), *v) / norm(sub(*s, p)))
        .collect();
    (
        [(r[1] - r[0]) / C, (r[2] - r[0]) / C],
        [-(F_HZ / C) * (rd[1] - rd[0]), -(F_HZ / C) * (rd[2] - rd[0])],
    )
}

fn sigmas(g: [f64; 3]) -> ([f64; 2], [f64; 2]) {
    let beta = 2.0 * std::f64::consts::PI * B_HZ / 12f64.sqrt();
    let tau = T_INT / 12f64.sqrt();
    let mut st = [0.0; 2];
    let mut sf = [0.0; 2];
    for (k, j) in [1usize, 2].into_iter().enumerate() {
        let ge = g[0] * g[j] / (1.0 + g[0] + g[j]);
        let root = (B_HZ * T_INT * ge).sqrt();
        st[k] = 1.0 / (beta * root);
        sf[k] = 1.0 / (tau * root);
    }
    (st, sf)
}

fn normal(r: &mut ChaCha8Rng) -> f64 {
    let u1: f64 = 1.0 - r.gen::<f64>();
    let u2: f64 = r.gen::<f64>();
    (-2.0 * u1.pln()).sqrt() * (2.0 * std::f64::consts::PI * u2).pcos()
}

/// Great-circle distance on the sphere, m.
pub fn gc_m(a: (f64, f64), b: (f64, f64)) -> f64 {
    let (pa, pb) = (point(a.0, a.1, 0.0).1, point(b.0, b.1, 0.0).1);
    let c = dot(pa, pb).clamp(-1.0, 1.0);
    let s = norm([
        pa[1] * pb[2] - pa[2] * pb[1],
        pa[2] * pb[0] - pa[0] * pb[2],
        pa[0] * pb[1] - pa[1] * pb[0],
    ]);
    R_M * s.patan2(c)
}

/// The area centroid: mean of M2's sea points (R5).
pub fn area_centroid() -> (f64, f64) {
    let p = baltic_points();
    let n = p.len() as f64;
    (
        p.iter().map(|x| x.0).sum::<f64>() / n,
        p.iter().map(|x| x.1).sum::<f64>() / n,
    )
}

fn solve(a: &[Vec<f64>], b: &[f64]) -> Option<Vec<f64>> {
    let m = crate::geolocation::mat_inverse(a)?;
    Some(
        m.iter()
            .map(|row| row.iter().zip(b).map(|(x, y)| x * y).sum())
            .collect(),
    )
}

/// Generic Gauss-Newton on `theta` with residual function `f` (already divided by sigma).
fn gauss_newton(
    mut th: Vec<f64>,
    f: &dyn Fn(&[f64]) -> Vec<f64>,
    steps: &[f64],
    moved_m: &dyn Fn(&[f64], &[f64]) -> f64,
) -> Option<Vec<f64>> {
    for _ in 0..50 {
        let r0 = f(&th);
        let n = th.len();
        let mut jac = vec![vec![0.0; n]; r0.len()];
        for k in 0..n {
            let mut tp = th.clone();
            let mut tm = th.clone();
            tp[k] += steps[k];
            tm[k] -= steps[k];
            let (rp, rm) = (f(&tp), f(&tm));
            for i in 0..r0.len() {
                jac[i][k] = (rp[i] - rm[i]) / (2.0 * steps[k]);
            }
        }
        let mut jtj = vec![vec![0.0; n]; n];
        let mut jtr = vec![0.0; n];
        for i in 0..r0.len() {
            for a in 0..n {
                jtr[a] += jac[i][a] * r0[i];
                for b in 0..n {
                    jtj[a][b] += jac[i][a] * jac[i][b];
                }
            }
        }
        let d = solve(&jtj, &jtr)?;
        let new: Vec<f64> = th.iter().zip(&d).map(|(x, y)| x - y).collect();
        if !new.iter().all(|x| x.is_finite()) {
            return None;
        }
        let mv = moved_m(&th, &new);
        th = new;
        if mv < 1.0 {
            return Some(th);
        }
    }
    None
}

fn in_box(lat: f64, lon: f64) -> bool {
    let [a, b, c, d] = crate::tip_and_cue::AREA_BOX_DEG;
    lat >= a && lat <= b && lon >= c && lon <= d
}

fn space_resid(ep: &[SpaceEpoch], h: f64) -> impl Fn(&[f64]) -> Vec<f64> + '_ {
    move |th: &[f64]| {
        let (p, _) = point(th[0], th[1], h);
        let mut r = Vec::with_capacity(ep.len() * 4);
        for e in ep {
            let (td, fd) = predict(p, e.t);
            for k in 0..2 {
                r.push((td[k] - e.tdoa[k]) / e.s_tau[k]);
                r.push((fd[k] - e.fdoa[k]) / e.s_f[k]);
            }
        }
        r
    }
}

/// v2 (R13): the coarse search over M2's sea points by time differences alone, then reading 5's (or
/// 7's) Gauss-Newton from the best 3; the converged in-box result with the lowest weighted sum of
/// squared residuals over all of `f` is kept.
fn started_gn(
    ep: &[SpaceEpoch],
    h: f64,
    f: &dyn Fn(&[f64]) -> Vec<f64>,
    extra: &dyn Fn((f64, f64)) -> Vec<f64>,
    steps: &[f64],
) -> Option<Vec<f64>> {
    let pts = baltic_points();
    let mut scored: Vec<(f64, usize)> = pts
        .iter()
        .enumerate()
        .map(|(i, &(a, b))| {
            let (p, _) = point(a, b, h);
            let s: f64 = ep
                .iter()
                .map(|e| {
                    let (td, _) = predict(p, e.t);
                    (0..2)
                        .map(|k| ((td[k] - e.tdoa[k]) / e.s_tau[k]).powi(2))
                        .sum::<f64>()
                })
                .sum();
            (s, i)
        })
        .collect();
    scored.sort_by(|x, y| x.0.total_cmp(&y.0).then(x.1.cmp(&y.1)));
    let mut best: Option<(f64, Vec<f64>)> = None;
    for &(_, i) in scored.iter().take(3) {
        let mut th = vec![pts[i].0, pts[i].1];
        th.extend(extra(pts[i]));
        if let Some(t) = gauss_newton(th, f, steps, &moved).filter(|t| in_box(t[0], t[1])) {
            let ssr: f64 = f(&t).iter().map(|x| x * x).sum();
            if best.as_ref().is_none_or(|b| ssr < b.0) {
                best = Some((ssr, t));
            }
        }
    }
    best.map(|b| b.1)
}

fn moved(a: &[f64], b: &[f64]) -> f64 {
    gc_m((a[0], a[1]), (b[0], b[1]))
}

/// One draw's outcome for the three layers: estimate `(lat, lon)` or `None` (declined).
#[derive(Clone, Debug)]
pub struct DrawResult {
    /// Space estimate.
    pub space: Option<(f64, f64)>,
    /// Ground estimate.
    pub ground: Option<(f64, f64)>,
    /// Hybrid estimate.
    pub hybrid: Option<(f64, f64)>,
    /// Detected epochs.
    pub detected: usize,
    /// Reporting ground sites.
    pub reporting: usize,
}

struct GroundCtx {
    proj: Proj,
    stations: Vec<Station>,
}

fn ground_ctx() -> GroundCtx {
    let (la, lo) = (
        SITES.iter().map(|s| s.0).sum::<f64>() / 14.0,
        SITES.iter().map(|s| s.1).sum::<f64>() / 14.0,
    );
    let proj = Proj::new(la, lo);
    let stations = SITES
        .iter()
        .map(|&(a, b)| {
            let (x, y) = proj.forward(a, b);
            Station {
                east_km: x,
                north_km: y,
                antenna_h_m: SITE_H_M,
                c_nom_dbhz: 45.0,
                kappa_db: None,
                noise_dbw: -130.0,
                gain_dbi: 0.0,
            }
        })
        .collect();
    GroundCtx { proj, stations }
}

/// Run one draw (R5 to R7) for a source at `(lat, lon, h)` and EIRP `eirp_dbm`.
#[allow(clippy::too_many_arguments)]
fn run_draw(
    r: &mut ChaCha8Rng,
    src: (f64, f64, f64),
    eirp_dbm: f64,
    pass_ep: &[f64],
    x0: f64,
    gctx: &GroundCtx,
    start: (f64, f64),
    v2: bool,
) -> DrawResult {
    let (p, _) = point(src.0, src.1, src.2);
    let u0 = formation_u0();
    // Detection (R3) and space measurements (R4).
    let mut eps: Vec<SpaceEpoch> = Vec::new();
    for &t in pass_ep {
        let g: Vec<f64> = u0
            .iter()
            .map(|&q| link(eirp_dbm, norm(sub(p, sat_state(q, t).0)), x0))
            .map(|(_, g, pd)| (g, pd))
            .map(|(g, pd)| if r.gen::<f64>() < pd { g } else { -1.0 })
            .collect();
        if g.iter().any(|&x| x < 0.0) {
            continue;
        }
        let (st, sf) = sigmas([g[0], g[1], g[2]]);
        let (td, fd) = predict(p, t);
        let mut e = SpaceEpoch {
            t,
            tdoa: td,
            fdoa: fd,
            s_tau: st,
            s_f: sf,
        };
        for k in 0..2 {
            e.tdoa[k] += st[k] * normal(r);
            e.fdoa[k] += sf[k] * normal(r);
        }
        eps.push(e);
    }
    // Ground reports (R6; v2: R14 and R16, 30 reports per site sharing one shadowing value).
    let reach = los_reach_km(SITE_H_M, src.2);
    let mut reports: Vec<Option<f64>> = Vec::with_capacity(14);
    let mut epochs_j: Vec<Vec<Option<f64>>> = Vec::new();
    if v2 {
        let x: Vec<f64> = (0..14).map(|_| SIGMA_SH * normal(r)).collect();
        let mean: Vec<(f64, bool)> = SITES
            .iter()
            .zip(&x)
            .map(|(&(a, b), xi)| {
                let (sp, _) = point(a, b, SITE_H_M);
                let in_reach = gc_m((a, b), (src.0, src.1)) / 1000.0 <= reach;
                (eirp_dbm - 30.0 - fspl_db(norm(sub(p, sp))) + xi, in_reach)
            })
            .collect();
        let mut sum = [0.0f64; 14];
        let mut cnt = [0usize; 14];
        for _ in 0..V2_REPORTS {
            let row: Vec<Option<f64>> = mean
                .iter()
                .enumerate()
                .map(|(i, &(m, ok))| {
                    let v = m + SIGMA_MEAS_V2 * normal(r);
                    let rep = (ok && v >= GROUND_MIN_DBW).then_some(v);
                    if let Some(v) = rep {
                        sum[i] += v;
                        cnt[i] += 1;
                    }
                    rep
                })
                .collect();
            epochs_j.push(row);
        }
        for i in 0..14 {
            reports.push((cnt[i] > 0).then(|| sum[i] / cnt[i] as f64));
        }
    } else {
        for &(a, b) in &SITES {
            let x = SIGMA_SH * normal(r);
            let (sp, _) = point(a, b, SITE_H_M);
            let d = norm(sub(p, sp));
            let pr = eirp_dbm - 30.0 - fspl_db(d) + x;
            let horiz_km = gc_m((a, b), (src.0, src.1)) / 1000.0;
            reports.push((horiz_km <= reach && pr >= GROUND_MIN_DBW).then_some(pr));
        }
    }
    let reporting = reports.iter().filter(|x| x.is_some()).count();
    // v2: per-site report counts for the hybrid's sigma (R15).
    let n_rep: Vec<usize> = (0..14)
        .map(|i| epochs_j.iter().filter(|e| e[i].is_some()).count())
        .collect();
    // Space estimate (R5).
    let space = if eps.len() >= 2 {
        let f = space_resid(&eps, src.2);
        if v2 {
            started_gn(&eps, src.2, &f, &|_: (f64, f64)| Vec::new(), &[1e-5, 1e-5])
                .map(|t| (t[0], t[1]))
        } else {
            gauss_newton(vec![start.0, start.1], &f, &[1e-5, 1e-5], &moved)
                .filter(|t| in_box(t[0], t[1]))
                .map(|t| (t[0], t[1]))
        }
    } else {
        None
    };
    // Ground estimate (R6): B3a with power input, known height.
    // v2 (R14): the session's epochs with at least 3 reporting sites (B3a's session rule).
    let session: Vec<Vec<Option<f64>>> = epochs_j
        .iter()
        .filter(|e| e.iter().filter(|x| x.is_some()).count() >= 3)
        .cloned()
        .collect();
    let ground_ok = if v2 {
        !session.is_empty()
    } else {
        reporting >= 3
    };
    let ground = if ground_ok {
        let mut prm = PowerDifferenceParams::preregistered_v1();
        prm.h_set_m = vec![src.2];
        let g = grid(&prm, &gctx.stations);
        let jmin = vec![GROUND_MIN_DBW; 14];
        let input = if v2 { session } else { vec![reports.clone()] };
        let summed = summed_loglik_from_power(&prm, &gctx.stations, &g, &input, &jmin);
        let loc = locate(&prm, &g, &summed);
        Some(gctx.proj.inverse(loc.centroid.0, loc.centroid.1))
    } else {
        None
    };
    // Hybrid (R7).
    let n_res = eps.len() * 4 + reporting;
    let hybrid = if n_res >= 6 {
        // (site, value, sigma): v1 one report at 6 dB; v2 the mean of n reports at sqrt(6^2 + 1/n) (R15).
        let rep: Vec<(V3, f64, f64)> = SITES
            .iter()
            .zip(&reports)
            .zip(&n_rep)
            .filter_map(|((&(a, b), r), &n)| {
                let s = if v2 {
                    (SIGMA_SH * SIGMA_SH + SIGMA_MEAS_V2 * SIGMA_MEAS_V2 / n as f64).sqrt()
                } else {
                    SIGMA_SH
                };
                r.map(|v| (point(a, b, SITE_H_M).0, v, s))
            })
            .collect();
        let (cp, _) = point(start.0, start.1, src.2);
        let e0 = if rep.is_empty() {
            0.0
        } else {
            rep.iter()
                .map(|(sp, v, _)| v + fspl_db(norm(sub(cp, *sp))))
                .sum::<f64>()
                / rep.len() as f64
        };
        let sp_f = space_resid(&eps, src.2);
        let f = |th: &[f64]| {
            let mut out = sp_f(th);
            let (pp, _) = point(th[0], th[1], src.2);
            for (sp, v, s) in &rep {
                out.push((v - (th[2] - fspl_db(norm(sub(pp, *sp))))) / s);
            }
            out
        };
        // EIRP start at a given start point (R7).
        let e_at = |c: (f64, f64)| -> Vec<f64> {
            let (cp, _) = point(c.0, c.1, src.2);
            vec![if rep.is_empty() {
                0.0
            } else {
                rep.iter()
                    .map(|(sp, v, _)| v + fspl_db(norm(sub(cp, *sp))))
                    .sum::<f64>()
                    / rep.len() as f64
            }]
        };
        if v2 && eps.len() >= 2 {
            // v2 (R13): the started Gauss-Newton.
            if rep.is_empty() {
                started_gn(
                    &eps,
                    src.2,
                    &sp_f,
                    &|_: (f64, f64)| Vec::new(),
                    &[1e-5, 1e-5],
                )
                .map(|t| (t[0], t[1]))
            } else {
                started_gn(&eps, src.2, &f, &e_at, &[1e-5, 1e-5, 1e-3]).map(|t| (t[0], t[1]))
            }
        } else if rep.is_empty() {
            // No reporting site: EIRP has no information; solve position from space alone (amended R7).
            gauss_newton(vec![start.0, start.1], &sp_f, &[1e-5, 1e-5], &moved)
                .filter(|t| in_box(t[0], t[1]))
                .map(|t| (t[0], t[1]))
        } else {
            gauss_newton(vec![start.0, start.1, e0], &f, &[1e-5, 1e-5, 1e-3], &moved)
                .filter(|t| in_box(t[0], t[1]))
                .map(|t| (t[0], t[1]))
        }
    } else {
        None
    };
    DrawResult {
        space,
        ground,
        hybrid,
        detected: eps.len(),
        reporting,
    }
}

/// The 200 placements of R9: (lat, lon, height).
pub fn placements() -> Vec<(f64, f64, f64)> {
    placements_seeded(4500)
}

/// Reading 9's placements from `seed` (v2, R16: 4600).
pub fn placements_seeded(seed: u64) -> Vec<(f64, f64, f64)> {
    let pts = baltic_points();
    let mut r = ChaCha8Rng::seed_from_u64(seed);
    (0..200)
        .map(|i| {
            let c = pts[r.gen_range(0..pts.len())];
            let h = 0.125;
            (
                c.0 + r.gen_range(-h..h),
                c.1 + r.gen_range(-h..h),
                if i < 100 { 10.0 } else { 3000.0 },
            )
        })
        .collect()
}

/// The B4 rows: per M1 point, the pass-peak link of the three receivers for every class.
pub fn b4_rows() -> Value {
    let x0 = threshold();
    let mut out = Vec::new();
    for &(lat, lon) in &M1_POINTS {
        let Some((_, tpk)) = pass(lat, lon, 10.0) else {
            out.push(json!({"lat": lat, "lon": lon, "pass": null}));
            continue;
        };
        let (p, _) = point(lat, lon, 10.0);
        let rec: Vec<Value> = formation_u0()
            .iter()
            .map(|&q| {
                let rng = norm(sub(p, sat_state(q, tpk).0));
                let mut m = serde_json::Map::new();
                m.insert("range_m".into(), json!(rng));
                for (name, e) in CLASSES {
                    let (pr, g, pd) = link(e, rng, x0);
                    m.insert(name.into(), json!({"pr_dbw": pr, "snr": g, "pd": pd}));
                }
                Value::Object(m)
            })
            .collect();
        out.push(json!({"lat": lat, "lon": lon, "peak_t_s": tpk, "receivers": rec}));
    }
    json!({"threshold_over_k": x0 / (2.0 * B_HZ * T_INT), "points": out})
}

/// A draw with its errors (space, ground, hybrid), m; infinite when the layer declined.
type Scored = (DrawResult, f64, f64, f64);

/// B5 (amended R8): the horizontal bounds (2x2, m^2) of space, ground and hybrid at the truth of a
/// placement and class, from geometry alone; `None` where a layer's horizontal block is singular.
pub fn bounds(src: (f64, f64, f64), eirp_dbm: f64) -> [Option<[[f64; 2]; 2]>; 3] {
    bounds_sigma(src, eirp_dbm, SIGMA_SH)
}

/// v2 (R15): the bounds with the ground sigma of the mean of 30 reports, sqrt(6^2 + 1^2/30).
pub fn bounds_v2(src: (f64, f64, f64), eirp_dbm: f64) -> [Option<[[f64; 2]; 2]>; 3] {
    let s = (SIGMA_SH * SIGMA_SH + SIGMA_MEAS_V2 * SIGMA_MEAS_V2 / V2_REPORTS as f64).sqrt();
    bounds_sigma(src, eirp_dbm, s)
}

fn bounds_sigma(src: (f64, f64, f64), eirp_dbm: f64, sigma_g: f64) -> [Option<[[f64; 2]; 2]>; 3] {
    let x0 = threshold();
    let (p, up) = point(src.0, src.1, src.2);
    // Local east and north unit vectors at the source.
    let east = {
        let (sl, cl) = (src.1 * DEG).psin_cos();
        [-sl, cl, 0.0]
    };
    let north = [
        -up[2] * up[0] / (1.0 - up[2] * up[2]).sqrt(),
        -up[2] * up[1] / (1.0 - up[2] * up[2]).sqrt(),
        (1.0 - up[2] * up[2]).sqrt(),
    ];
    let shift = |de: f64, dn: f64| -> V3 {
        [
            p[0] + de * east[0] + dn * north[0],
            p[1] + de * east[1] + dn * north[1],
            p[2] + de * east[2] + dn * north[2],
        ]
    };
    let mut fs = [[0.0f64; 3]; 3];
    let mut fg = [[0.0f64; 3]; 3];
    let u0 = formation_u0();
    if let Some((ep, _)) = pass(src.0, src.1, src.2) {
        for t in ep {
            let g: Vec<(f64, f64)> = u0
                .iter()
                .map(|&q| link(eirp_dbm, norm(sub(p, sat_state(q, t).0)), x0))
                .map(|(_, g, pd)| (g, pd))
                .collect();
            if g.iter().any(|x| x.1 < 0.5) {
                continue;
            }
            let (st, sf) = sigmas([g[0].0, g[1].0, g[2].0]);
            let h = 1.0;
            let (te, fe) = (predict(shift(h, 0.0), t), predict(shift(-h, 0.0), t));
            let (tn, fnn) = (predict(shift(0.0, h), t), predict(shift(0.0, -h), t));
            for k in 0..2 {
                for (row, s) in [
                    (
                        [
                            (te.0[k] - fe.0[k]) / (2.0 * h),
                            (tn.0[k] - fnn.0[k]) / (2.0 * h),
                            0.0,
                        ],
                        st[k],
                    ),
                    (
                        [
                            (te.1[k] - fe.1[k]) / (2.0 * h),
                            (tn.1[k] - fnn.1[k]) / (2.0 * h),
                            0.0,
                        ],
                        sf[k],
                    ),
                ] {
                    for a in 0..3 {
                        for b in 0..3 {
                            fs[a][b] += row[a] * row[b] / (s * s);
                        }
                    }
                }
            }
        }
    }
    let reach = los_reach_km(SITE_H_M, src.2);
    for &(a, b) in &SITES {
        let (sp, _) = point(a, b, SITE_H_M);
        let pr = eirp_dbm - 30.0 - fspl_db(norm(sub(p, sp)));
        if gc_m((a, b), (src.0, src.1)) / 1000.0 > reach || pr < GROUND_MIN_DBW {
            continue;
        }
        let h = 1.0;
        let m = |q: V3| -fspl_db(norm(sub(q, sp)));
        let row = [
            (m(shift(h, 0.0)) - m(shift(-h, 0.0))) / (2.0 * h),
            (m(shift(0.0, h)) - m(shift(0.0, -h))) / (2.0 * h),
            1.0,
        ];
        for a2 in 0..3 {
            for b2 in 0..3 {
                fg[a2][b2] += row[a2] * row[b2] / (sigma_g * sigma_g);
            }
        }
    }
    let horiz = |f: &[[f64; 3]; 3]| -> Option<[[f64; 2]; 2]> {
        let (mut a, mut b, mut c) = (f[0][0], f[0][1], f[1][1]);
        if f[2][2] > 0.0 {
            a -= f[0][2] * f[0][2] / f[2][2];
            b -= f[0][2] * f[1][2] / f[2][2];
            c -= f[1][2] * f[1][2] / f[2][2];
        }
        let det = a * c - b * b;
        (det > 1e-300 * (a * c).abs().max(1e-300) && a > 0.0)
            .then(|| [[c / det, -b / det], [-b / det, a / det]])
    };
    let mut fh = fs;
    for a in 0..3 {
        for b in 0..3 {
            fh[a][b] += fg[a][b];
        }
    }
    [horiz(&fs), horiz(&fg), horiz(&fh)]
}

/// Whether `c_layer - c_hybrid` has no eigenvalue below -1e-9 of its largest eigenvalue (B5).
pub fn no_larger(c_layer: [[f64; 2]; 2], c_h: [[f64; 2]; 2]) -> bool {
    let d = [
        [c_layer[0][0] - c_h[0][0], c_layer[0][1] - c_h[0][1]],
        [c_layer[1][0] - c_h[1][0], c_layer[1][1] - c_h[1][1]],
    ];
    let tr = d[0][0] + d[1][1];
    let det = d[0][0] * d[1][1] - d[0][1] * d[1][0];
    let disc = (0.25 * tr * tr - det).max(0.0).sqrt();
    let (l1, l2) = (0.5 * tr + disc, 0.5 * tr - disc);
    let big = l1
        .abs()
        .max(l2.abs())
        .max(c_layer[0][0].abs().max(c_layer[1][1].abs()));
    l2 >= -1e-9 * big
}

fn pct(mut v: Vec<f64>, p: f64) -> Option<f64> {
    if v.is_empty() {
        return None;
    }
    v.sort_by(|a, b| a.partial_cmp(b).unwrap_or(std::cmp::Ordering::Equal));
    let rank = ((p / 100.0) * v.len() as f64).ceil().max(1.0) as usize;
    Some(v[rank.min(v.len()) - 1])
}

fn median(mut v: Vec<f64>) -> Option<f64> {
    if v.is_empty() {
        return None;
    }
    v.sort_by(|a, b| a.partial_cmp(b).unwrap_or(std::cmp::Ordering::Equal));
    let n = v.len();
    Some(if n % 2 == 1 {
        v[n / 2]
    } else {
        0.5 * (v[n / 2 - 1] + v[n / 2])
    })
}

/// Run the whole scenario once (R9, R10); `n_placements` below 200 for tests.
pub fn run(n_placements: usize) -> Value {
    run_with(n_placements, (4500, 4501), false)
}

/// v2 (R13 to R16): the scenario with seeds `seeds` (placements, draws); `V2_SEEDS` for the scored run,
/// `(V2_CHECK_SEED, V2_CHECK_SEED)` for the unscored checks.
pub fn run_v2(n_placements: usize, seeds: (u64, u64)) -> Value {
    run_with(n_placements, seeds, true)
}

fn run_with(n_placements: usize, seeds: (u64, u64), v2: bool) -> Value {
    let x0 = threshold();
    let gctx = ground_ctx();
    let start = area_centroid();
    let pl: Vec<_> = placements_seeded(seeds.0)
        .into_iter()
        .take(n_placements)
        .collect();
    let passes: Vec<_> = pl.iter().map(|&(a, b, h)| pass(a, b, h)).collect();
    let mut r = ChaCha8Rng::seed_from_u64(seeds.1);
    let mut by_class = serde_json::Map::new();
    let mut rows: Vec<Vec<Vec<Scored>>> = Vec::new();
    for (i, &(a, b, h)) in pl.iter().enumerate() {
        let ep = passes[i].as_ref().map(|x| x.0.clone()).unwrap_or_default();
        let mut per_class = Vec::new();
        for (_, e) in CLASSES {
            let mut draws = Vec::new();
            for _ in 0..20 {
                let d = run_draw(&mut r, (a, b, h), e, &ep, x0, &gctx, start, v2);
                let err = |x: Option<(f64, f64)>| x.map_or(f64::INFINITY, |p| gc_m(p, (a, b)));
                let (es, eg, eh) = (err(d.space), err(d.ground), err(d.hybrid));
                draws.push((d, es, eg, eh));
            }
            per_class.push(draws);
        }
        rows.push(per_class);
    }
    for (ci, (name, _)) in CLASSES.iter().enumerate() {
        let all: Vec<&Scored> = rows.iter().flat_map(|p| p[ci].iter()).collect();
        let n = all.len() as f64;
        let succ =
            |f: &dyn Fn(&Scored) -> f64| all.iter().filter(|x| f(x) <= 5000.0).count() as f64 / n;
        let common: Vec<_> = all
            .iter()
            .filter(|x| x.0.space.is_some() && x.0.ground.is_some())
            .collect();
        let col =
            |f: &dyn Fn(&Scored) -> f64| -> Vec<f64> { common.iter().map(|x| f(x)).collect() };
        let (cs, cg, ch) = (col(&|x| x.1), col(&|x| x.2), col(&|x| x.3));
        let detectable: Vec<usize> = (0..2)
            .map(|half| {
                rows.iter()
                    .enumerate()
                    .filter(|(i, _)| (*i < 100) == (half == 0))
                    .filter(|(_, p)| p[ci][0].0.detected >= 6)
                    .count()
            })
            .collect();
        by_class.insert(
            (*name).into(),
            json!({
                "draws": all.len(),
                "success": {"space": succ(&|x| x.1), "ground": succ(&|x| x.2), "hybrid": succ(&|x| x.3)},
                "estimates": {
                    "space": all.iter().filter(|x| x.0.space.is_some()).count(),
                    "ground": all.iter().filter(|x| x.0.ground.is_some()).count(),
                    "hybrid": all.iter().filter(|x| x.0.hybrid.is_some()).count(),
                },
                "common_set": common.len(),
                "median_m": {"space": median(cs.clone()), "ground": median(cg.clone()), "hybrid": median(ch.clone())},
                "p95_m": {"space": pct(cs, 95.0), "ground": pct(cg, 95.0), "hybrid": pct(ch, 95.0)},
                "placements_with_6_detected_epochs_draw0": {"surface": detectable[0], "elevated": detectable[1]},
            }),
        );
    }
    let mut out = json!({
        "schema": "kshana.m5-result/1",
        "placements": pl.len(),
        "passes_found": passes.iter().filter(|p| p.is_some()).count(),
        "classes": by_class,
    });
    // v1's output bytes are pinned (B6); v2 adds its version and seeds.
    if v2 {
        out["version"] = json!(2);
        out["seeds"] = json!([seeds.0, seeds.1]);
    }
    out
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn wh_threshold_meets_the_false_alarm_probability() {
        let k = 2.0 * B_HZ * T_INT;
        let x0 = threshold();
        assert!((wh_tail(x0, k) - PFA).abs() < 1e-12);
    }

    #[test]
    fn velocity_is_the_derivative_of_position() {
        let (p0, v) = sat_state(0.3, 1000.0);
        let (p1, _) = sat_state(0.3, 1000.5);
        let (pm, _) = sat_state(0.3, 999.5);
        for k in 0..3 {
            assert!(((p1[k] - pm[k]) - v[k]).abs() < 1e-3, "{k}");
        }
        assert!(norm(p0) > 6.9e6);
    }
}
