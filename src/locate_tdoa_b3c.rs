// SPDX-License-Identifier: AGPL-3.0-only
//! The TDOA locator's successor (0.42 row V1, B3c), on B3b's synthetic world.
//!
//! Fixed in `docs/design/evidence/b3c-tdoa-locator-successor/PREREGISTRATION.md` and readings U1 to U13 of
//! `xval/tdoa-locator-b3c/README.md`, written before this code. Against B3b ([`crate::locate_tdoa`]) it changes three
//! things and nothing else:
//!
//! * the correlation peak is refined on the band-limited interpolant of the correlation (golden-section search to
//!   10⁻⁴ sample) instead of a parabola, and σ gains a 2.5 ns refinement term;
//! * a screen on the reference's autocorrelation calls a signal with no usable bandwidth "not located" and finds a
//!   periodic waveform's period, whose delays are then wrapped to ± half a period;
//! * Gauss–Newton steps are capped at 1 km and halved until the cost falls, and a solution more than 10 km outside the
//!   stations' hull is "not located".
//!
//! [`locate`] runs it on a [`crate::locate_tdoa::Session`]; [`gate_summary`] scores the two populations of the gate.
//! MODELLED: synthetic data only.

use crate::acquisition::{fft_forward, fft_inverse};
use crate::locate_tdoa::{
    cmul, conj, dist2, dist3, dist_to_hull, domain, ecef, invert, median, norm2, quad, Session,
    Waveform, BUFFER_M, CHI2_2_95, C_M_S, FS_HZ, H_JAMMER_M, H_STATION_M, N_SAMPLES, SIGMA_CLOCK_S,
    XCORR_LEN,
};
use crate::portable_math::PortableFloat;
use crate::sdr::Cf64;
use serde::Serialize;
use std::f64::consts::PI;

/// The refinement term of σ (U6), s.
pub const SIGMA_REFINE_S: f64 = 2.5e-9;
/// Gate seeds (U2).
pub const GATE_SEEDS: (u64, u64) = (9001, 10000);
/// Development seeds (U2).
pub const DEV_SEEDS: (u64, u64) = (8001, 8200);

/// What the bandwidth and period screen found (U4).
#[derive(Clone, Copy, Debug, PartialEq, Eq, Serialize)]
#[serde(rename_all = "lowercase")]
pub enum SignalClass {
    /// No usable bandwidth: not located.
    Narrowband,
    /// A repeating waveform: delays are known modulo its period.
    Periodic,
    /// Neither.
    Aperiodic,
}

/// What B3c gives for one session, and how it scores against the truth (U9, U10).
#[derive(Clone, Debug, Serialize)]
pub struct B3cResult {
    /// Seed.
    pub seed: u64,
    /// The drawn waveform (used only to choose the scored population).
    pub waveform: Waveform,
    /// Stations.
    pub n_stations: usize,
    /// The reference station.
    pub reference: usize,
    /// The screen's class.
    pub class: SignalClass,
    /// The refined period, samples (periodic only).
    pub period_samples: Option<f64>,
    /// The largest-sample lag of each other station.
    pub k_star: Vec<i64>,
    /// Their delays after the reference, s.
    pub tau_s: Vec<f64>,
    /// Their σ, s.
    pub sigma_s: Vec<f64>,
    /// The solution, local east and north, m (the domain's centroid when narrowband).
    pub estimate: [f64; 2],
    /// The final weighted cost (none when narrowband).
    pub cost: Option<f64>,
    /// Whether the session is located.
    pub located: bool,
    /// The 95 % region's area, m² (0 when narrowband).
    pub region_area_m2: f64,
    /// The domain's area, m².
    pub domain_area_m2: f64,
    /// min(1, region / domain); 1 when not located.
    pub area_share: f64,
    /// Located and the truth inside the 95 % region.
    pub covered: bool,
    /// The centroid error, m (to the domain's centroid when not located).
    pub error_m: f64,
    /// The median nearest-neighbour station spacing, m.
    pub nn_median_m: f64,
}

/// U5: `|Σ_q G_q exp(j2π q' t / M)|²`, `q'` the signed index.
fn interp(g: &[Cf64], t: f64) -> f64 {
    let m = g.len();
    let (mut re, mut im) = (0.0, 0.0);
    for (k, v) in g.iter().enumerate() {
        let q = if k <= m / 2 {
            k as f64
        } else {
            k as f64 - m as f64
        };
        let (s, c) = (2.0 * PI * q * t / m as f64).psin_cos();
        re += v.re * c - v.im * s;
        im += v.re * s + v.im * c;
    }
    re * re + im * im
}

/// U5: golden-section search for the interpolant's maximum on `[k − 1, k + 1]`, to 10⁻⁴ sample.
fn golden(g: &[Cf64], k: f64) -> f64 {
    let phi = (5.0f64.sqrt() - 1.0) / 2.0;
    let (mut a, mut b) = (k - 1.0, k + 1.0);
    let mut c = b - phi * (b - a);
    let mut d = a + phi * (b - a);
    let (mut fc, mut fd) = (interp(g, c), interp(g, d));
    while b - a > 1e-4 {
        if fc > fd {
            b = d;
            d = c;
            fd = fc;
            c = b - phi * (b - a);
            fc = interp(g, c);
        } else {
            a = c;
            c = d;
            fc = fd;
            d = a + phi * (b - a);
            fd = interp(g, d);
        }
    }
    0.5 * (a + b)
}

fn pad(x: &[Cf64]) -> Vec<Cf64> {
    let mut v = x.to_vec();
    v.resize(XCORR_LEN, Cf64::new(0.0, 0.0));
    v
}

/// B3c on one session (U3 to U9), scored against its truth (U10).
pub fn locate(s: &Session) -> B3cResult {
    let ns = s.stations.len();
    let n = N_SAMPLES as f64;
    let s_hat: Vec<f64> = s
        .snapshots
        .iter()
        .map(|x| (x.iter().map(|v| norm2(*v)).sum::<f64>() / n - 1.0).max(1e-6))
        .collect();
    let mut reference = 0;
    for i in 1..ns {
        if s_hat[i] > s_hat[reference] {
            reference = i;
        }
    }
    let pos: Vec<[f64; 3]> = s
        .stations
        .iter()
        .map(|p| ecef(p[0], p[1], H_STATION_M))
        .collect();
    let dom = domain(&s.stations);
    let kg = dom.grid.len() as f64;
    let cen = [
        dom.grid.iter().map(|g| g[0]).sum::<f64>() / kg,
        dom.grid.iter().map(|g| g[1]).sum::<f64>() / kg,
    ];
    let nn_median_m = median(
        s.stations
            .iter()
            .enumerate()
            .map(|(i, a)| {
                s.stations
                    .iter()
                    .enumerate()
                    .filter(|(j, _)| *j != i)
                    .map(|(_, b)| dist2(a, b))
                    .fold(f64::INFINITY, f64::min)
            })
            .collect(),
    );
    let mut out = B3cResult {
        seed: s.seed,
        waveform: s.waveform,
        n_stations: ns,
        reference,
        class: SignalClass::Narrowband,
        period_samples: None,
        k_star: Vec::new(),
        tau_s: Vec::new(),
        sigma_s: Vec::new(),
        estimate: cen,
        cost: None,
        located: false,
        region_area_m2: 0.0,
        domain_area_m2: dom.area_m2,
        area_share: 1.0,
        covered: false,
        error_m: dist2(&s.truth, &cen),
        nn_median_m,
    };

    // U4: bandwidth and period screen.
    let xref = fft_forward(&pad(&s.snapshots[reference]));
    let gref: Vec<Cf64> = xref.iter().map(|v| Cf64::new(norm2(*v), 0.0)).collect();
    let rho: Vec<f64> = fft_inverse(&gref)
        .into_iter()
        .take(202)
        .map(|v| norm2(v).sqrt() / (n * s_hat[reference]))
        .collect();
    let Some(k0) = (1..=16).find(|&k| rho[k] < 0.5) else {
        return out;
    };
    let p_int =
        (k0 + 1..=200).find(|&k| rho[k] >= 0.5 && rho[k] >= rho[k - 1] && rho[k] >= rho[k + 1]);
    let period = p_int.map(|k| golden(&gref, k as f64));
    out.class = if period.is_some() {
        SignalClass::Periodic
    } else {
        SignalClass::Aperiodic
    };
    out.period_samples = period;

    // T11 (unchanged): the reference's mean-square bandwidth.
    let xr = fft_forward(&s.snapshots[reference]);
    let (mut sp, mut spf) = (0.0, 0.0);
    let pf: Vec<(f64, f64)> = xr
        .iter()
        .enumerate()
        .map(|(k, v)| {
            let f = if k <= N_SAMPLES / 2 {
                k as f64
            } else {
                k as f64 - n
            } * FS_HZ
                / n;
            let p = (norm2(*v) / n - 1.0).max(0.0);
            sp += p;
            spf += p * f;
            (p, f)
        })
        .collect();
    let beta2_hz2 = if sp > 0.0 {
        let fbar = spf / sp;
        (pf.iter()
            .map(|(p, f)| p * (f - fbar) * (f - fbar))
            .sum::<f64>()
            / sp)
            .max(1e6)
    } else {
        1e6
    };

    // U5, U6: delays and σ.
    let others: Vec<usize> = (0..ns).filter(|&i| i != reference).collect();
    for &i in &others {
        let xi = fft_forward(&pad(&s.snapshots[i]));
        let g: Vec<Cf64> = xi
            .iter()
            .zip(&xref)
            .map(|(a, b)| cmul(*a, conj(*b)))
            .collect();
        let r: Vec<f64> = fft_inverse(&g)
            .into_iter()
            .map(|v| norm2(v).sqrt())
            .collect();
        let at = |k: i64| r[k.rem_euclid(XCORR_LEN as i64) as usize];
        let d = dist3(&pos[i], &pos[reference]);
        let kw = ((d / C_M_S + 6.0 * std::f64::consts::SQRT_2 * SIGMA_CLOCK_S) * FS_HZ).ceil()
            as i64
            + 2;
        let (mut best, mut bk) = (-1.0, -kw);
        for k in -kw..=kw {
            if at(k) > best {
                best = at(k);
                bk = k;
            }
        }
        let t = if bk > -kw && bk < kw {
            golden(&g, bk as f64)
        } else {
            bk as f64
        };
        out.k_star.push(bk);
        out.tau_s.push(t / FS_HZ);
        let snr = s_hat[i] * s_hat[reference] / (1.0 + s_hat[i] + s_hat[reference]);
        let crb = 1.0 / (8.0 * PI * PI * beta2_hz2 * n * snr);
        out.sigma_s.push(
            (crb + 2.0 * SIGMA_CLOCK_S * SIGMA_CLOCK_S + SIGMA_REFINE_S * SIGMA_REFINE_S).sqrt(),
        );
    }
    let m = others.len();
    let cov: Vec<Vec<f64>> = (0..m)
        .map(|a| {
            (0..m)
                .map(|b| {
                    if a == b {
                        out.sigma_s[a] * out.sigma_s[a]
                    } else {
                        SIGMA_CLOCK_S * SIGMA_CLOCK_S
                    }
                })
                .collect()
        })
        .collect();
    let ci = invert(&cov).expect("a positive definite covariance");
    let per_s = period.map(|p| p / FS_HZ);
    let model = |p: &[f64; 2]| -> Vec<f64> {
        let q = ecef(p[0], p[1], H_JAMMER_M);
        let dr = dist3(&q, &pos[reference]);
        others
            .iter()
            .map(|&i| (dist3(&q, &pos[i]) - dr) / C_M_S)
            .collect()
    };
    // U7: residuals, wrapped to ± half a period for a periodic waveform.
    let resid = |p: &[f64; 2]| -> Vec<f64> {
        out.tau_s
            .iter()
            .zip(model(p))
            .map(|(a, b)| {
                let x = a - b;
                match per_s {
                    Some(ps) => x - ps * (x / ps + 0.5).floor(),
                    None => x,
                }
            })
            .collect()
    };
    let cost = |p: &[f64; 2]| quad(&resid(p), &ci);

    // U8: grid start, then bounded Gauss–Newton.
    let mut p = dom.grid[0];
    let mut best = f64::INFINITY;
    for g in &dom.grid {
        let v = cost(g);
        if v < best {
            best = v;
            p = *g;
        }
    }
    let jac = |p: &[f64; 2]| -> Vec<[f64; 2]> {
        let (pe, me) = (model(&[p[0] + 0.5, p[1]]), model(&[p[0] - 0.5, p[1]]));
        let (pn, mn) = (model(&[p[0], p[1] + 0.5]), model(&[p[0], p[1] - 0.5]));
        (0..m)
            .map(|k| [(pe[k] - me[k]) / 1.0, (pn[k] - mn[k]) / 1.0])
            .collect()
    };
    let normal = |jm: &[[f64; 2]]| -> [[f64; 2]; 2] {
        let mut a = [[0.0; 2]; 2];
        for (x, ax) in a.iter_mut().enumerate() {
            for (y, axy) in ax.iter_mut().enumerate() {
                for i in 0..m {
                    for j in 0..m {
                        *axy += jm[i][x] * ci[i][j] * jm[j][y];
                    }
                }
            }
        }
        a
    };
    let inv2 = |a: [[f64; 2]; 2]| -> [[f64; 2]; 2] {
        let det = a[0][0] * a[1][1] - a[0][1] * a[1][0];
        [
            [a[1][1] / det, -a[0][1] / det],
            [-a[1][0] / det, a[0][0] / det],
        ]
    };
    let mut cp = cost(&p);
    for _ in 0..50 {
        let jm = jac(&p);
        let r = resid(&p);
        let mut g = [0.0; 2];
        for (x, gx) in g.iter_mut().enumerate() {
            for i in 0..m {
                for j in 0..m {
                    *gx += jm[i][x] * ci[i][j] * r[j];
                }
            }
        }
        let ni = inv2(normal(&jm));
        let mut st = [
            ni[0][0] * g[0] + ni[0][1] * g[1],
            ni[1][0] * g[0] + ni[1][1] * g[1],
        ];
        let len = (st[0] * st[0] + st[1] * st[1]).sqrt();
        if len > 1000.0 {
            st = [st[0] * (1000.0 / len), st[1] * (1000.0 / len)];
        }
        let mut accepted = None;
        for _ in 0..11 {
            let cand = [p[0] + st[0], p[1] + st[1]];
            let cc = cost(&cand);
            if cc < cp {
                accepted = Some((cand, cc));
                break;
            }
            st = [st[0] / 2.0, st[1] / 2.0];
        }
        let Some((cand, cc)) = accepted else {
            break;
        };
        p = cand;
        cp = cc;
        if (st[0] * st[0] + st[1] * st[1]).sqrt() < 1e-3 {
            break;
        }
    }

    // U9: region and consistency.
    let pc = inv2(normal(&jac(&p)));
    let final_cost = cost(&p);
    let in_domain = dist_to_hull(&dom.hull, &p) <= BUFFER_M;
    let located = in_domain && final_cost <= crate::raim::chi2_quantile(0.999, (ns - 3) as f64);
    let det = pc[0][0] * pc[1][1] - pc[0][1] * pc[1][0];
    let region_area_m2 = PI * CHI2_2_95 * det.sqrt();
    let dv = [s.truth[0] - p[0], s.truth[1] - p[1]];
    let pi = inv2(pc);
    let maha = dv[0] * (pi[0][0] * dv[0] + pi[0][1] * dv[1])
        + dv[1] * (pi[1][0] * dv[0] + pi[1][1] * dv[1]);
    out.estimate = p;
    out.cost = Some(final_cost);
    out.located = located;
    out.region_area_m2 = region_area_m2;
    out.covered = located && maha <= CHI2_2_95;
    if located {
        out.area_share = (region_area_m2 / dom.area_m2).min(1.0);
        out.error_m = (dv[0] * dv[0] + dv[1] * dv[1]).sqrt();
    }
    out
}

/// T1 to T3 over a set of results: (coverage, median area share, centroid ratio, not located).
pub fn metrics(rows: &[B3cResult]) -> (f64, f64, f64, usize) {
    let n = rows.len() as f64;
    let t1 = rows.iter().filter(|r| r.covered).count() as f64 / n;
    let t2 = median(rows.iter().map(|r| r.area_share).collect());
    let t3 = median(rows.iter().map(|r| r.error_m).collect())
        / median(rows.iter().map(|r| r.nn_median_m).collect());
    (t1, t2, t3, rows.iter().filter(|r| !r.located).count())
}

fn scored(rows: &[B3cResult]) -> serde_json::Value {
    let (t1, t2, t3, nl) = metrics(rows);
    let verdict = |met: bool| if met { "MET" } else { "NOT MET" };
    let met = t1 >= 0.90 && t2 <= 0.25 && t3 <= 0.5;
    let per: Vec<serde_json::Value> = [Waveform::Cw, Waveform::Chirp, Waveform::Noise]
        .iter()
        .map(|w| {
            let sub: Vec<B3cResult> = rows.iter().filter(|r| r.waveform == *w).cloned().collect();
            let (a, b, c, d) = metrics(&sub);
            serde_json::json!({"waveform": w, "sessions": sub.len(), "t1_coverage": a,
                "t2_median_area_share": b, "t3_centroid_ratio": c, "not_located": d})
        })
        .collect();
    serde_json::json!({
        "sessions": rows.len(),
        "t1_coverage": t1, "t1_bar": 0.90, "t1": verdict(t1 >= 0.90),
        "t2_median_area_share": t2, "t2_bar": 0.25, "t2": verdict(t2 <= 0.25),
        "t3_centroid_ratio": t3, "t3_bar": 0.5, "t3": verdict(t3 <= 0.5),
        "verdict": verdict(met),
        "not_located": nl,
        "per_waveform": per,
    })
}

/// The gate's summary (U10): G-all (every session) and G-wb (chirp and noise sessions), with the same bars.
pub fn gate_summary(rows: &[B3cResult]) -> serde_json::Value {
    let wb: Vec<B3cResult> = rows
        .iter()
        .filter(|r| r.waveform != Waveform::Cw)
        .cloned()
        .collect();
    let class = |c: SignalClass| rows.iter().filter(|r| r.class == c).count();
    serde_json::json!({
        "g_all": scored(rows),
        "g_wb": scored(&wb),
        "classes": {"narrowband": class(SignalClass::Narrowband),
            "periodic": class(SignalClass::Periodic), "aperiodic": class(SignalClass::Aperiodic)},
    })
}
