// SPDX-License-Identifier: AGPL-3.0-only
//! A fixed-station jammer locator by time difference of arrival (0.41 row B3b), and its synthetic gate.
//!
//! The method and the synthetic world are fixed in `docs/design/evidence/b3b-tdoa-locator/PREREGISTRATION.md`
//! and the readings T1 to T16 of `xval/tdoa-locator/README.md`, written before this code:
//!
//! * each station takes a 10 ms snapshot at 4 Msps, time-tagged by its own clock (1σ 20 ns);
//! * the station with the largest measured jammer-to-noise ratio is the reference; every other station's delay
//!   after it is the peak of their cross-correlation, refined by a parabola;
//! * each pair's σ is the Knapp–Carter bound for the measured SNRs and the reference's mean-square bandwidth,
//!   plus the two clocks, and the pairs share the reference clock's covariance;
//! * the jammer is located on a spherical Earth at a known height by a grid search over the stations' hull
//!   buffered by 10 km, then Gauss–Newton; its 95 % region is the covariance ellipse, and a χ² test of the
//!   residuals at 0.999 decides "not located".
//!
//! [`session`] draws one synthetic session, [`locate`] runs the locator on it, and [`gate_summary`] scores a set
//! of sessions against the bars. The locator is MODELLED: it has seen synthetic data only.

use crate::acquisition::{fft_forward, fft_inverse};
use crate::portable_math::PortableFloat;
use crate::sdr::Cf64;
use rand::{Rng, SeedableRng};
use rand_chacha::ChaCha20Rng;
use serde::Serialize;
use std::f64::consts::PI;

/// Speed of light, m/s.
pub const C_M_S: f64 = 299_792_458.0;
/// Sample rate, Hz.
pub const FS_HZ: f64 = 4.0e6;
/// Snapshot length, samples (10 ms).
pub const N_SAMPLES: usize = 40_000;
/// Carrier, Hz.
pub const FC_HZ: f64 = 1_575.42e6;
/// Station clock bias, 1σ, s.
pub const SIGMA_CLOCK_S: f64 = 20e-9;
/// Shadowing, 1σ, dB.
pub const SHADOW_DB: f64 = 6.0;
/// Earth radius of the spherical model, m.
pub const EARTH_R_M: f64 = 6_371_000.0;
/// Station antenna height, m.
pub const H_STATION_M: f64 = 10.0;
/// Jammer height, m.
pub const H_JAMMER_M: f64 = 2.0;
/// Centre of the local frame, degrees.
pub const LAT0_DEG: f64 = 59.0;
/// Centre of the local frame, degrees.
pub const LON0_DEG: f64 = 11.0;
/// Domain buffer around the stations' hull, m.
pub const BUFFER_M: f64 = 10_000.0;
/// Grid spacing of the start search, m.
pub const GRID_M: f64 = 250.0;
/// χ² with 2 degrees of freedom at 0.95.
pub const CHI2_2_95: f64 = 5.991_464_547_107_979;
/// Gate seeds (T14).
pub const GATE_SEEDS: (u64, u64) = (6001, 7000);
/// Development seeds (T14).
pub const DEV_SEEDS: (u64, u64) = (5001, 5200);

const NOISE_LEN: usize = 65_536;
const NOISE_OFFSET: usize = 12_768;
const XCORR_LEN: usize = 2 * N_SAMPLES;
const K_BOLTZMANN: f64 = 1.380_649e-23;
const T0_K: f64 = 290.0;
const LN10: f64 = std::f64::consts::LN_10;

/// The jammer's waveform (T6).
#[derive(Clone, Copy, Debug, PartialEq, Eq, Serialize)]
#[serde(rename_all = "lowercase")]
pub enum Waveform {
    /// A continuous wave.
    Cw,
    /// A sawtooth linear chirp.
    Chirp,
    /// Wideband noise.
    Noise,
}

/// One synthetic session (T3 to T7).
#[derive(Clone, Debug)]
pub struct Session {
    /// Seed.
    pub seed: u64,
    /// Waveform.
    pub waveform: Waveform,
    /// Stations' local east and north, m.
    pub stations: Vec<[f64; 2]>,
    /// The jammer's local east and north, m.
    pub truth: [f64; 2],
    /// Layout size `L`, m.
    pub layout_m: f64,
    /// EIRP, dBW.
    pub eirp_dbw: f64,
    /// One snapshot per station.
    pub snapshots: Vec<Vec<Cf64>>,
}

// ------------------------------------------------------------------ geometry (T2, T4)

fn sqrt(x: f64) -> f64 {
    x.sqrt()
}

/// ECEF position on the spherical Earth of local `(e, n)` at height `h` (T2).
pub fn ecef(e: f64, n: f64, h: f64) -> [f64; 3] {
    let lat0 = LAT0_DEG.to_radians();
    let lat = lat0 + n / EARTH_R_M;
    let lon = LON0_DEG.to_radians() + e / (EARTH_R_M * lat0.pcos());
    let (sl, cl) = lat.psin_cos();
    let (so, co) = lon.psin_cos();
    let r = EARTH_R_M + h;
    [r * cl * co, r * cl * so, r * sl]
}

fn dist3(a: &[f64; 3], b: &[f64; 3]) -> f64 {
    let d = [a[0] - b[0], a[1] - b[1], a[2] - b[2]];
    sqrt(d[0] * d[0] + d[1] * d[1] + d[2] * d[2])
}

fn dist2(a: &[f64; 2], b: &[f64; 2]) -> f64 {
    let (x, y) = (a[0] - b[0], a[1] - b[1]);
    sqrt(x * x + y * y)
}

/// The convex hull, counter-clockwise (Andrew's monotone chain).
pub fn hull(points: &[[f64; 2]]) -> Vec<[f64; 2]> {
    let mut pts = points.to_vec();
    pts.sort_by(|a, b| a[0].total_cmp(&b[0]).then(a[1].total_cmp(&b[1])));
    pts.dedup();
    if pts.len() < 3 {
        return pts;
    }
    let cross = |o: &[f64; 2], a: &[f64; 2], b: &[f64; 2]| {
        (a[0] - o[0]) * (b[1] - o[1]) - (a[1] - o[1]) * (b[0] - o[0])
    };
    let mut lo: Vec<[f64; 2]> = Vec::new();
    for p in &pts {
        while lo.len() >= 2 && cross(&lo[lo.len() - 2], &lo[lo.len() - 1], p) <= 0.0 {
            lo.pop();
        }
        lo.push(*p);
    }
    let mut up: Vec<[f64; 2]> = Vec::new();
    for p in pts.iter().rev() {
        while up.len() >= 2 && cross(&up[up.len() - 2], &up[up.len() - 1], p) <= 0.0 {
            up.pop();
        }
        up.push(*p);
    }
    lo.pop();
    up.pop();
    lo.extend(up);
    lo
}

/// Distance from `p` to a counter-clockwise convex polygon (0 inside).
pub fn dist_to_hull(h: &[[f64; 2]], p: &[f64; 2]) -> f64 {
    let n = h.len();
    let inside = (0..n).all(|i| {
        let (a, b) = (h[i], h[(i + 1) % n]);
        (b[0] - a[0]) * (p[1] - a[1]) - (b[1] - a[1]) * (p[0] - a[0]) >= 0.0
    });
    if inside {
        return 0.0;
    }
    let mut best = f64::INFINITY;
    for i in 0..n {
        let (a, b) = (h[i], h[(i + 1) % n]);
        let (dx, dy) = (b[0] - a[0], b[1] - a[1]);
        let t = (((p[0] - a[0]) * dx + (p[1] - a[1]) * dy) / (dx * dx + dy * dy)).clamp(0.0, 1.0);
        best = best.min(dist2(p, &[a[0] + t * dx, a[1] + t * dy]));
    }
    best
}

/// The domain (T4): its exact area, its grid points in grid order, and its box.
pub struct Domain {
    /// The hull.
    pub hull: Vec<[f64; 2]>,
    /// Area, m².
    pub area_m2: f64,
    /// Grid points inside the domain, `j` (north) then `i` (east).
    pub grid: Vec<[f64; 2]>,
    /// `[e_min, e_max, n_min, n_max]`.
    pub bbox: [f64; 4],
}

/// The domain of a station layout (T4).
pub fn domain(stations: &[[f64; 2]]) -> Domain {
    let h = hull(stations);
    let (mut area, mut per) = (0.0, 0.0);
    for i in 0..h.len() {
        let (a, b) = (h[i], h[(i + 1) % h.len()]);
        area += a[0] * b[1] - b[0] * a[1];
        per += dist2(&a, &b);
    }
    let area_m2 = 0.5 * area + per * BUFFER_M + PI * BUFFER_M * BUFFER_M;
    let fold = |f: fn(f64, f64) -> f64, k: usize, init: f64| h.iter().fold(init, |m, p| f(m, p[k]));
    let bbox = [
        fold(f64::min, 0, f64::INFINITY) - BUFFER_M,
        fold(f64::max, 0, f64::NEG_INFINITY) + BUFFER_M,
        fold(f64::min, 1, f64::INFINITY) - BUFFER_M,
        fold(f64::max, 1, f64::NEG_INFINITY) + BUFFER_M,
    ];
    let mut grid = Vec::new();
    let mut j = 0u32;
    while bbox[2] + GRID_M * f64::from(j) <= bbox[3] {
        let mut i = 0u32;
        while bbox[0] + GRID_M * f64::from(i) <= bbox[1] {
            let p = [
                bbox[0] + GRID_M * f64::from(i),
                bbox[2] + GRID_M * f64::from(j),
            ];
            if dist_to_hull(&h, &p) <= BUFFER_M {
                grid.push(p);
            }
            i += 1;
        }
        j += 1;
    }
    Domain {
        hull: h,
        area_m2,
        grid,
        bbox,
    }
}

// ------------------------------------------------------------------ the synthetic session (T3 to T7)

fn gauss(rng: &mut ChaCha20Rng) -> f64 {
    let u1 = 1.0 - rng.gen::<f64>();
    let u2 = rng.gen::<f64>();
    sqrt(-2.0 * u1.pln()) * (2.0 * PI * u2).pcos()
}

fn cis(phase: f64) -> Cf64 {
    let (s, c) = phase.psin_cos();
    Cf64::new(c, s)
}

fn cmul(a: Cf64, b: Cf64) -> Cf64 {
    Cf64::new(a.re * b.re - a.im * b.im, a.re * b.im + a.im * b.re)
}

fn conj(a: Cf64) -> Cf64 {
    Cf64::new(a.re, -a.im)
}

fn norm2(a: Cf64) -> f64 {
    a.re * a.re + a.im * a.im
}

/// Draws session `seed`; `first_seed` fixes the waveform order (T5).
pub fn session(seed: u64, first_seed: u64) -> Session {
    let mut rng = ChaCha20Rng::seed_from_u64(seed);
    let ns = rng.gen_range(6..=12usize);
    let layout_m: f64 = rng.gen_range(5_000.0..30_000.0);
    let min_sep = 0.25 * layout_m / sqrt(ns as f64);
    let mut stations: Vec<[f64; 2]> = Vec::with_capacity(ns);
    while stations.len() < ns {
        let p = [
            rng.gen_range(-layout_m / 2.0..layout_m / 2.0),
            rng.gen_range(-layout_m / 2.0..layout_m / 2.0),
        ];
        if stations.iter().all(|q| dist2(&p, q) >= min_sep) {
            stations.push(p);
        }
    }
    let dom = domain(&stations);
    let truth = loop {
        let p = [
            rng.gen_range(dom.bbox[0]..dom.bbox[1]),
            rng.gen_range(dom.bbox[2]..dom.bbox[3]),
        ];
        if dist_to_hull(&dom.hull, &p) <= BUFFER_M {
            break p;
        }
    };
    let eirp_dbw: f64 = rng.gen_range(-10.0..10.0);
    let waveform = match (seed.wrapping_sub(first_seed)) % 3 {
        0 => Waveform::Cw,
        1 => Waveform::Chirp,
        _ => Waveform::Noise,
    };
    // Waveform parameters (T6).
    let f0: f64 = rng.gen_range(-1.5e6..1.5e6);
    let phi0: f64 = rng.gen_range(0.0..2.0 * PI);
    let period: f64 = rng.gen_range(8e-6..30e-6);
    let t_off: f64 = rng.gen_range(0.0..period);
    let noise_spec = if waveform == Waveform::Noise {
        let s = std::f64::consts::FRAC_1_SQRT_2;
        let w: Vec<Cf64> = (0..NOISE_LEN)
            .map(|_| Cf64::new(s * gauss(&mut rng), s * gauss(&mut rng)))
            .collect();
        fft_forward(&w)
    } else {
        Vec::new()
    };
    let lambda = C_M_S / FC_HZ;
    let jam = ecef(truth[0], truth[1], H_JAMMER_M);
    let jam_ground = ecef(truth[0], truth[1], 0.0);
    let eirp_w = (eirp_dbw / 10.0 * LN10).pexp();
    let noise_w = K_BOLTZMANN * T0_K * FS_HZ;
    let mut snapshots = Vec::with_capacity(ns);
    for st in &stations {
        let b = SIGMA_CLOCK_S * gauss(&mut rng);
        let s_db = SHADOW_DB * gauss(&mut rng);
        let pos = ecef(st[0], st[1], H_STATION_M);
        let d = dist3(&jam, &pos);
        let tau = d / C_M_S + b;
        // Two-ray gain (T7).
        let g0 = ecef(st[0], st[1], 0.0);
        let cross = [
            jam_ground[1] * g0[2] - jam_ground[2] * g0[1],
            jam_ground[2] * g0[0] - jam_ground[0] * g0[2],
            jam_ground[0] * g0[1] - jam_ground[1] * g0[0],
        ];
        let dot = jam_ground[0] * g0[0] + jam_ground[1] * g0[1] + jam_ground[2] * g0[2];
        let rho = EARTH_R_M
            * sqrt(cross[0] * cross[0] + cross[1] * cross[1] + cross[2] * cross[2]).patan2(dot);
        let d1 = sqrt(rho * rho + (H_STATION_M - H_JAMMER_M) * (H_STATION_M - H_JAMMER_M));
        let d2 = sqrt(rho * rho + (H_STATION_M + H_JAMMER_M) * (H_STATION_M + H_JAMMER_M));
        let ray = |dd: f64| {
            let c = cis(-2.0 * PI * (dd / lambda).fract());
            Cf64::new(c.re / dd, c.im / dd)
        };
        let (r1, r2) = (ray(d1), ray(d2));
        let amp = sqrt(eirp_w) * lambda / (4.0 * PI) * (s_db / 20.0 * LN10).pexp() / sqrt(noise_w);
        let g = Cf64::new((r1.re - r2.re) * amp, (r1.im - r2.im) * amp);
        let clean: Vec<Cf64> = match waveform {
            Waveform::Cw => (0..N_SAMPLES)
                .map(|m| cis(2.0 * PI * f0 * (m as f64 / FS_HZ - tau) + phi0))
                .collect(),
            Waveform::Chirp => {
                let fd = 1.8e6;
                (0..N_SAMPLES)
                    .map(|m| {
                        let u = (m as f64 / FS_HZ - tau + t_off).rem_euclid(period);
                        cis(2.0 * PI * (-fd * u + fd * u * u / period))
                    })
                    .collect()
            }
            Waveform::Noise => {
                let shifted: Vec<Cf64> = noise_spec
                    .iter()
                    .enumerate()
                    .map(|(k, w)| {
                        let f = if k <= NOISE_LEN / 2 {
                            k as f64
                        } else {
                            k as f64 - NOISE_LEN as f64
                        } * FS_HZ
                            / NOISE_LEN as f64;
                        cmul(*w, cis(-2.0 * PI * f * tau))
                    })
                    .collect();
                fft_inverse(&shifted)[NOISE_OFFSET..NOISE_OFFSET + N_SAMPLES].to_vec()
            }
        };
        let s = std::f64::consts::FRAC_1_SQRT_2;
        let x: Vec<Cf64> = clean
            .into_iter()
            .map(|w| {
                let v = cmul(g, w);
                Cf64::new(v.re + s * gauss(&mut rng), v.im + s * gauss(&mut rng))
            })
            .collect();
        snapshots.push(x);
    }
    Session {
        seed,
        waveform,
        stations,
        truth,
        layout_m,
        eirp_dbw,
        snapshots,
    }
}

// ------------------------------------------------------------------ the locator (T8 to T13)

/// What the locator gives for one session, and how it scores against the truth (T15).
#[derive(Clone, Debug, Serialize)]
pub struct SessionResult {
    /// Seed.
    pub seed: u64,
    /// Waveform.
    pub waveform: Waveform,
    /// Stations.
    pub n_stations: usize,
    /// Layout size, m.
    pub layout_m: f64,
    /// EIRP, dBW.
    pub eirp_dbw: f64,
    /// The reference station.
    pub reference: usize,
    /// The correlation peak lag of each other station.
    pub k_star: Vec<i64>,
    /// Their delays after the reference, s.
    pub tau_s: Vec<f64>,
    /// Their σ, s.
    pub sigma_s: Vec<f64>,
    /// The reference's mean-square bandwidth, Hz².
    pub beta2_hz2: f64,
    /// The solution, local east and north, m.
    pub estimate: [f64; 2],
    /// The final weighted cost.
    pub cost: f64,
    /// Whether the χ² test passed.
    pub located: bool,
    /// The 95 % region's area, m².
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

fn median(mut v: Vec<f64>) -> f64 {
    v.sort_by(f64::total_cmp);
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

/// The inverse of a small symmetric positive matrix by Gauss–Jordan with partial pivoting.
fn invert(a: &[Vec<f64>]) -> Option<Vec<Vec<f64>>> {
    let n = a.len();
    let mut m: Vec<Vec<f64>> = a
        .iter()
        .enumerate()
        .map(|(i, r)| {
            let mut row = r.clone();
            row.extend((0..n).map(|j| if i == j { 1.0 } else { 0.0 }));
            row
        })
        .collect();
    for c in 0..n {
        let p = (c..n).max_by(|&x, &y| m[x][c].abs().total_cmp(&m[y][c].abs()))?;
        if m[p][c] == 0.0 || !m[p][c].is_finite() {
            return None;
        }
        m.swap(c, p);
        let piv = m[c][c];
        for v in m[c].iter_mut() {
            *v /= piv;
        }
        let pivot_row = m[c].clone();
        for (r, row) in m.iter_mut().enumerate() {
            if r != c {
                let f = row[c];
                for (v, q) in row.iter_mut().zip(&pivot_row) {
                    *v -= f * q;
                }
            }
        }
    }
    Some(m.into_iter().map(|r| r[n..].to_vec()).collect())
}

fn quad(r: &[f64], ci: &[Vec<f64>]) -> f64 {
    let mut s = 0.0;
    for (i, ri) in r.iter().enumerate() {
        for (j, rj) in r.iter().enumerate() {
            s += ri * ci[i][j] * rj;
        }
    }
    s
}

/// The locator on one session (T8 to T13), scored against its truth (T15).
pub fn locate(s: &Session) -> SessionResult {
    let ns = s.stations.len();
    let s_hat: Vec<f64> = s
        .snapshots
        .iter()
        .map(|x| (x.iter().map(|v| norm2(*v)).sum::<f64>() / N_SAMPLES as f64 - 1.0).max(1e-6))
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
    // T11: the reference's mean-square bandwidth about its centroid.
    let xr = fft_forward(&s.snapshots[reference]);
    let (mut sp, mut spf) = (0.0, 0.0);
    let pf: Vec<(f64, f64)> = xr
        .iter()
        .enumerate()
        .map(|(k, v)| {
            let f = if k <= N_SAMPLES / 2 {
                k as f64
            } else {
                k as f64 - N_SAMPLES as f64
            } * FS_HZ
                / N_SAMPLES as f64;
            let p = (norm2(*v) / N_SAMPLES as f64 - 1.0).max(0.0);
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
    // T10: delays by cross-correlation.
    let pad = |x: &[Cf64]| {
        let mut v = x.to_vec();
        v.resize(XCORR_LEN, Cf64::new(0.0, 0.0));
        v
    };
    let xref = fft_forward(&pad(&s.snapshots[reference]));
    let others: Vec<usize> = (0..ns).filter(|&i| i != reference).collect();
    let (mut k_star, mut tau_s, mut sigma_s) = (Vec::new(), Vec::new(), Vec::new());
    for &i in &others {
        let xi = fft_forward(&pad(&s.snapshots[i]));
        let prod: Vec<Cf64> = xi
            .iter()
            .zip(&xref)
            .map(|(a, b)| cmul(*a, conj(*b)))
            .collect();
        let r: Vec<f64> = fft_inverse(&prod)
            .into_iter()
            .map(|v| sqrt(norm2(v)))
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
        let delta = if bk > -kw && bk < kw {
            let (a, b, c) = (at(bk - 1), at(bk), at(bk + 1));
            let den = a - 2.0 * b + c;
            if den != 0.0 {
                0.5 * (a - c) / den
            } else {
                0.0
            }
        } else {
            0.0
        };
        k_star.push(bk);
        tau_s.push((bk as f64 + delta) / FS_HZ);
        let snr = s_hat[i] * s_hat[reference] / (1.0 + s_hat[i] + s_hat[reference]);
        let crb = 1.0 / (8.0 * PI * PI * beta2_hz2 * N_SAMPLES as f64 * snr);
        sigma_s.push(sqrt(crb + 2.0 * SIGMA_CLOCK_S * SIGMA_CLOCK_S));
    }
    let m = others.len();
    let cov: Vec<Vec<f64>> = (0..m)
        .map(|a| {
            (0..m)
                .map(|b| {
                    if a == b {
                        sigma_s[a] * sigma_s[a]
                    } else {
                        SIGMA_CLOCK_S * SIGMA_CLOCK_S
                    }
                })
                .collect()
        })
        .collect();
    let ci = invert(&cov).expect("a positive definite covariance");
    let model = |p: &[f64; 2]| -> Vec<f64> {
        let q = ecef(p[0], p[1], H_JAMMER_M);
        let dr = dist3(&q, &pos[reference]);
        others
            .iter()
            .map(|&i| (dist3(&q, &pos[i]) - dr) / C_M_S)
            .collect()
    };
    let cost = |p: &[f64; 2]| -> f64 {
        let r: Vec<f64> = tau_s.iter().zip(model(p)).map(|(a, b)| a - b).collect();
        quad(&r, &ci)
    };
    // T12: grid start, then Gauss–Newton.
    let dom = domain(&s.stations);
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
    for _ in 0..20 {
        let jm = jac(&p);
        let r: Vec<f64> = tau_s.iter().zip(model(&p)).map(|(a, b)| a - b).collect();
        let nmat = normal(&jm);
        let mut g = [0.0; 2];
        for (x, gx) in g.iter_mut().enumerate() {
            for i in 0..m {
                for j in 0..m {
                    *gx += jm[i][x] * ci[i][j] * r[j];
                }
            }
        }
        let ni = inv2(nmat);
        let step = [
            ni[0][0] * g[0] + ni[0][1] * g[1],
            ni[1][0] * g[0] + ni[1][1] * g[1],
        ];
        p = [p[0] + step[0], p[1] + step[1]];
        if sqrt(step[0] * step[0] + step[1] * step[1]) < 1e-3 {
            break;
        }
    }
    let pc = inv2(normal(&jac(&p)));
    let final_cost = cost(&p);
    let located = final_cost <= crate::raim::chi2_quantile(0.999, (ns - 3) as f64);
    let det = pc[0][0] * pc[1][1] - pc[0][1] * pc[1][0];
    let region_area_m2 = PI * CHI2_2_95 * sqrt(det);
    let dv = [s.truth[0] - p[0], s.truth[1] - p[1]];
    let pi = inv2(pc);
    let maha = dv[0] * (pi[0][0] * dv[0] + pi[0][1] * dv[1])
        + dv[1] * (pi[1][0] * dv[0] + pi[1][1] * dv[1]);
    let covered = located && maha <= CHI2_2_95;
    let error_m = if located {
        sqrt(dv[0] * dv[0] + dv[1] * dv[1])
    } else {
        let k = dom.grid.len() as f64;
        let cen = [
            dom.grid.iter().map(|g| g[0]).sum::<f64>() / k,
            dom.grid.iter().map(|g| g[1]).sum::<f64>() / k,
        ];
        dist2(&s.truth, &cen)
    };
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
    SessionResult {
        seed: s.seed,
        waveform: s.waveform,
        n_stations: ns,
        layout_m: s.layout_m,
        eirp_dbw: s.eirp_dbw,
        reference,
        k_star,
        tau_s,
        sigma_s,
        beta2_hz2,
        estimate: p,
        cost: final_cost,
        located,
        region_area_m2,
        domain_area_m2: dom.area_m2,
        area_share: if located {
            (region_area_m2 / dom.area_m2).min(1.0)
        } else {
            1.0
        },
        covered,
        error_m,
        nn_median_m,
    }
}

// ------------------------------------------------------------------ the gate (T15)

/// T1 to T3 over a set of sessions: (coverage, median area share, centroid ratio, not located).
pub fn metrics(rows: &[SessionResult]) -> (f64, f64, f64, usize) {
    let n = rows.len() as f64;
    let t1 = rows.iter().filter(|r| r.covered).count() as f64 / n;
    let t2 = median(rows.iter().map(|r| r.area_share).collect());
    let t3 = median(rows.iter().map(|r| r.error_m).collect())
        / median(rows.iter().map(|r| r.nn_median_m).collect());
    (t1, t2, t3, rows.iter().filter(|r| !r.located).count())
}

/// The gate's summary (T15): the bars, overall and per waveform.
pub fn gate_summary(rows: &[SessionResult]) -> serde_json::Value {
    let (t1, t2, t3, nl) = metrics(rows);
    let per: Vec<serde_json::Value> = [Waveform::Cw, Waveform::Chirp, Waveform::Noise]
        .iter()
        .map(|w| {
            let sub: Vec<SessionResult> =
                rows.iter().filter(|r| r.waveform == *w).cloned().collect();
            let (a, b, c, d) = metrics(&sub);
            serde_json::json!({"waveform": w, "sessions": sub.len(), "t1_coverage": a,
                "t2_median_area_share": b, "t3_centroid_ratio": c, "not_located": d})
        })
        .collect();
    let verdict = |met: bool| if met { "MET" } else { "NOT MET" };
    serde_json::json!({
        "sessions": rows.len(),
        "t1_coverage": t1, "t1_bar": 0.90, "t1": verdict(t1 >= 0.90),
        "t2_median_area_share": t2, "t2_bar": 0.25, "t2": verdict(t2 <= 0.25),
        "t3_centroid_ratio": t3, "t3_bar": 0.5, "t3": verdict(t3 <= 0.5),
        "not_located": nl,
        "per_waveform": per,
    })
}

/// One session's input for `xval/tdoa-locator/oracle.py` (T16): the JSON document and the snapshot bytes
/// (station after station, little-endian float64 pairs), to be written as `<seed>.json` and `<seed>.iq`.
pub fn oracle_input(s: &Session) -> (String, Vec<u8>) {
    let doc = serde_json::json!({
        "seed": s.seed, "waveform": s.waveform, "fs": FS_HZ, "n": N_SAMPLES, "sigma_c_s": SIGMA_CLOCK_S,
        "earth_radius_m": EARTH_R_M, "lat0_deg": LAT0_DEG, "lon0_deg": LON0_DEG,
        "h_station_m": H_STATION_M, "h_jammer_m": H_JAMMER_M,
        "stations": s.stations, "truth": s.truth, "iq": format!("{}.iq", s.seed),
    });
    let mut bytes = Vec::with_capacity(s.snapshots.len() * N_SAMPLES * 16);
    for x in &s.snapshots {
        for v in x {
            bytes.extend_from_slice(&v.re.to_le_bytes());
            bytes.extend_from_slice(&v.im.to_le_bytes());
        }
    }
    (doc.to_string(), bytes)
}
