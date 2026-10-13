// SPDX-License-Identifier: AGPL-3.0-only
//! Real-time-kinematic (RTK) style relative positioning on real RINEX observations: carrier-phase
//! and code double differences between a base and a rover, a float Kalman filter, and integer
//! ambiguity fixing by [`crate::lambda::resolve`].
//!
//! ## Model
//!
//! For satellites `i` and the reference satellite `r` (the highest at the base), the double
//! difference of the carrier phase on frequency `f` (metres) is
//!
//! `∇Δφ_f = ∇Δρ + λ_f (N_f^i − N_f^r) + ε`
//!
//! with `N_f^i` the rover-minus-base single-difference ambiguity (cycles), and the code double
//! difference is `∇Δρ + ε`. Receiver clocks cancel in the double difference, satellite clocks and
//! orbit errors cancel to the baseline-over-range ratio, and over a short baseline the ionosphere
//! and troposphere cancel too; they are not modelled, so the module is for short baselines (of
//! the order of a kilometre or less). Satellite positions come from precise products at the
//! transmit time each receiver's pseudorange implies, with the Earth rotation during the signal
//! travel time.
//!
//! The states are the static baseline (rover minus base antenna reference point, ECEF) and one
//! single-difference ambiguity per satellite and frequency, re-initialised when either receiver
//! flags a loss of lock or shows a geometry-free carrier jump. The double-difference measurements
//! are processed together with their full covariance (the reference satellite's noise is common to
//! every row). Each epoch the double-difference ambiguities `â = D N` and their covariance
//! `D P_NN Dᵀ` go to LAMBDA; when the ratio test passes, the baseline is conditioned on the
//! integers: `b̌ = b̂ − P_bN Dᵀ (D P_NN Dᵀ)⁻¹ (â − ǎ)`. Nothing is held: the float filter is not
//! constrained by past fixes.
//!
//! Not modelled: ionospheric and tropospheric double differences, antenna phase-centre
//! differences (the same antenna type at both ends cancels them), GLONASS and other systems.

use crate::frames::{ecef_to_geodetic, look_angles, Vec3};
use crate::lambda::resolve;
use crate::precise_products::PreciseProducts;
use crate::pvt::sagnac_rotate;
use crate::rinex_obs::RinexObs;
use serde::Serialize;
use std::collections::{BTreeMap, HashMap};

const C: f64 = 299_792_458.0;
const F: [f64; 2] = [1_575_420_000.0, 1_227_600_000.0];

/// Configuration of an RTK run.
#[derive(Clone, Debug)]
pub struct RtkConfig {
    /// Elevation mask at the base (deg).
    pub mask_deg: f64,
    /// Undifferenced phase noise at zenith (m), scaled by `1 + 1/sin ε`.
    pub phase_sigma_m: f64,
    /// Undifferenced code noise at zenith (m), scaled likewise.
    pub code_sigma_m: f64,
    /// LAMBDA ratio-test threshold.
    pub ratio: f64,
    /// Observation codes: L1 code, L1 phase, L2 code, L2 phase.
    pub codes: [&'static str; 4],
}

impl Default for RtkConfig {
    fn default() -> Self {
        Self {
            mask_deg: 15.0,
            phase_sigma_m: 0.003,
            code_sigma_m: 0.3,
            ratio: 3.0,
            codes: ["C1C", "L1C", "C2W", "L2W"],
        }
    }
}

/// One epoch of an RTK run.
#[derive(Clone, Debug, Serialize)]
pub struct RtkEpoch {
    /// Seconds from the GPS epoch.
    pub t_gps_s: f64,
    /// Float baseline (rover minus base, ECEF, m).
    pub float_baseline_m: [f64; 3],
    /// Fixed baseline (ECEF, m) when the ratio test passed.
    pub fixed_baseline_m: Option<[f64; 3]>,
    /// LAMBDA ratio (second-best over best), when LAMBDA ran.
    pub ratio: Option<f64>,
    /// Number of satellites in the double differences (including the reference).
    pub n_sats: usize,
}

/// The outcome of an RTK run.
#[derive(Clone, Debug, Serialize)]
pub struct RtkResult {
    /// Per processed epoch.
    pub epochs: Vec<RtkEpoch>,
    /// Single-difference ambiguity re-initialisations after the first.
    pub n_slips: usize,
}

struct SatMeas {
    p: [f64; 2],
    l_cyc: [f64; 2],
    lli: bool,
}

fn sat_meas(obs: &RinexObs, ei: usize, codes: &[&str; 4]) -> BTreeMap<String, SatMeas> {
    let mut out = BTreeMap::new();
    let Some(set) = obs.header.codes_for('G') else {
        return out;
    };
    let idx: Vec<Option<usize>> = codes
        .iter()
        .map(|c| set.iter().position(|x| x == c))
        .collect();
    for sv in &obs.epochs[ei].sats {
        if !sv.sat.starts_with('G') {
            continue;
        }
        let get = |k: usize| {
            idx[k]
                .and_then(|i| sv.obs.get(i).copied().flatten())
                .filter(|o| o.value != 0.0)
        };
        if let (Some(p1), Some(l1), Some(p2), Some(l2)) = (get(0), get(1), get(2), get(3)) {
            let lli = [l1, l2].iter().any(|o| o.lli.is_some_and(|f| f & 1 == 1));
            out.insert(
                sv.sat.clone(),
                SatMeas {
                    p: [p1.value, p2.value],
                    l_cyc: [l1.value, l2.value],
                    lli,
                },
            );
        }
    }
    out
}

/// The satellite position (ECEF at reception, m) and unit line of sight seen from `rx`, using
/// the transmit time the pseudorange `p` implies.
fn geometry(prod: &PreciseProducts, sat: &str, t_rx: f64, p: f64, rx: Vec3) -> Option<(f64, Vec3)> {
    let mut t_tx = t_rx - p / C;
    t_tx -= prod.clock_s(sat, t_tx)?;
    let rs0 = prod.position_com(sat, t_tx)?;
    let travel = norm(sub(rs0, rx)) / C;
    let rs = sagnac_rotate(rs0, travel);
    let d = sub(rs, rx);
    let r = norm(d);
    Some((r, [-d[0] / r, -d[1] / r, -d[2] / r]))
}

/// Run the RTK filter for the rover `rover` against the base `base` whose antenna reference point
/// is `base_arp` (ECEF, m); `b0` is the a-priori baseline (m), given with a 10 m sigma.
pub fn run_rtk(
    base: &RinexObs,
    rover: &RinexObs,
    prod: &PreciseProducts,
    base_arp: Vec3,
    b0: Vec3,
    cfg: &RtkConfig,
) -> RtkResult {
    let lam = [C / F[0], C / F[1]];
    // State: 0..3 baseline, then one SD ambiguity (cycles) per (satellite, frequency).
    let mut x: Vec<f64> = b0.to_vec();
    let mut p: Vec<Vec<f64>> = vec![vec![0.0; 3]; 3];
    for (i, row) in p.iter_mut().enumerate() {
        row[i] = 100.0;
    }
    let mut amb: HashMap<(String, usize), usize> = HashMap::new();
    let mut last_gf: HashMap<(String, bool), f64> = HashMap::new();
    let mut n_slips = 0;
    let mut out = Vec::new();
    let base_geo = ecef_to_geodetic(base_arp);

    let rover_times: HashMap<i64, usize> = rover
        .epochs
        .iter()
        .enumerate()
        .map(|(i, e)| ((e.time.seconds_from_gps_epoch() * 1000.0).round() as i64, i))
        .collect();

    for (bi, be) in base.epochs.iter().enumerate() {
        let t = be.time.seconds_from_gps_epoch();
        let Some(&ri) = rover_times.get(&((t * 1000.0).round() as i64)) else {
            continue;
        };
        let mb = sat_meas(base, bi, &cfg.codes);
        let mr = sat_meas(rover, ri, &cfg.codes);
        let rover_arp = add(base_arp, [x[0], x[1], x[2]]);

        // Per common satellite: SD measurements and geometry.
        struct Sd {
            sat: String,
            el: f64,
            sd_rho: f64,
            e_r: Vec3,
            sd_p: [f64; 2],
            sd_l_m: [f64; 2],
        }
        let mut sds = Vec::new();
        for (sat, b) in &mb {
            let Some(r) = mr.get(sat) else { continue };
            let Some((rho_b, e_b)) = geometry(prod, sat, t, b.p[0], base_arp) else {
                continue;
            };
            let Some((rho_r, e_r)) = geometry(prod, sat, t, r.p[0], rover_arp) else {
                continue;
            };
            let rs = sub(base_arp, scale(e_b, rho_b));
            let el = look_angles(base_geo, rs).el_rad;
            if el.to_degrees() < cfg.mask_deg {
                continue;
            }
            // Slip detection at each receiver.
            let mut slip = b.lli || r.lli;
            for (is_rover, m) in [(false, b), (true, r)] {
                let gf = m.l_cyc[0] * lam[0] - m.l_cyc[1] * lam[1];
                let key = (sat.clone(), is_rover);
                if let Some(&g) = last_gf.get(&key) {
                    slip |= (gf - g).abs() > 0.05;
                }
                last_gf.insert(key, gf);
            }
            let sd_p = [r.p[0] - b.p[0], r.p[1] - b.p[1]];
            let sd_l_cyc = [r.l_cyc[0] - b.l_cyc[0], r.l_cyc[1] - b.l_cyc[1]];
            for (f, (&lc, &pc)) in sd_l_cyc.iter().zip(&sd_p).enumerate() {
                let n0 = lc - pc / lam[f];
                match amb.get(&(sat.clone(), f)) {
                    Some(_) if !slip => {}
                    Some(&k) => {
                        n_slips += 1;
                        reset(&mut x, &mut p, k, n0, 1e4);
                    }
                    None => {
                        let k = add_state(&mut x, &mut p, n0, 1e4);
                        amb.insert((sat.clone(), f), k);
                    }
                }
            }
            sds.push(Sd {
                sat: sat.clone(),
                el,
                sd_rho: rho_r - rho_b,
                e_r,
                sd_p,
                sd_l_m: [sd_l_cyc[0] * lam[0], sd_l_cyc[1] * lam[1]],
            });
        }
        if sds.len() < 4 {
            continue;
        }
        let ref_i = (0..sds.len())
            .max_by(|&a, &b| sds[a].el.total_cmp(&sds[b].el))
            .unwrap();
        let w = |el: f64| 1.0 + 1.0 / el.sin();
        let n = x.len();
        let others: Vec<usize> = (0..sds.len()).filter(|&i| i != ref_i).collect();
        let m = others.len();

        // Rows: phase L1, phase L2, code L1, code L2, each m rows.
        let rows = 4 * m;
        let mut h = vec![vec![0.0; n]; rows];
        let mut v = vec![0.0; rows];
        let mut r_mat = vec![vec![0.0; rows]; rows];
        let rf = &sds[ref_i];
        for (blk, (is_phase, f)) in [(true, 0), (true, 1), (false, 0), (false, 1)]
            .iter()
            .enumerate()
        {
            let sig = if *is_phase {
                cfg.phase_sigma_m
            } else {
                cfg.code_sigma_m
            };
            // SD variance = 2 sigma² (two receivers).
            let var_ref = 2.0 * (sig * w(rf.el)).powi(2);
            for (j, &i) in others.iter().enumerate() {
                let s = &sds[i];
                let row = blk * m + j;
                let dd_rho = s.sd_rho - rf.sd_rho;
                for k in 0..3 {
                    h[row][k] = s.e_r[k] - rf.e_r[k];
                }
                let meas = if *is_phase {
                    s.sd_l_m[*f] - rf.sd_l_m[*f]
                } else {
                    s.sd_p[*f] - rf.sd_p[*f]
                };
                let mut model = dd_rho;
                if *is_phase {
                    let ki = amb[&(s.sat.clone(), *f)];
                    let kr = amb[&(rf.sat.clone(), *f)];
                    model += lam[*f] * (x[ki] - x[kr]);
                    h[row][ki] = lam[*f];
                    h[row][kr] = -lam[*f];
                }
                v[row] = meas - model;
                for jj in 0..m {
                    r_mat[row][blk * m + jj] = var_ref;
                }
                r_mat[row][row] += 2.0 * (sig * w(s.el)).powi(2);
            }
        }
        // H for the baseline is the derivative of the rover range: d rho_r / d b = -e_r(rx->sat)
        // with e_r the satellite-to-receiver unit vector, i.e. +e_r here.
        kalman_update(&mut x, &mut p, &h, &v, &r_mat);

        // LAMBDA on the double-difference ambiguities.
        let mut d_rows: Vec<Vec<(usize, f64)>> = Vec::new();
        for f in 0..2 {
            let kr = amb[&(rf.sat.clone(), f)];
            for &i in &others {
                let ki = amb[&(sds[i].sat.clone(), f)];
                d_rows.push(vec![(ki, 1.0), (kr, -1.0)]);
            }
        }
        let na = d_rows.len();
        let a_hat: Vec<f64> = d_rows
            .iter()
            .map(|r| r.iter().map(|&(k, c)| c * x[k]).sum())
            .collect();
        let mut qa = vec![vec![0.0; na]; na];
        for i in 0..na {
            for j in 0..na {
                qa[i][j] = d_rows[i]
                    .iter()
                    .map(|&(ki, ci)| {
                        d_rows[j]
                            .iter()
                            .map(|&(kj, cj)| ci * cj * p[ki][kj])
                            .sum::<f64>()
                    })
                    .sum();
            }
        }
        let mut qba = vec![vec![0.0; na]; 3];
        for (b, row) in qba.iter_mut().enumerate() {
            for (j, q) in row.iter_mut().enumerate() {
                *q = d_rows[j].iter().map(|&(k, c)| c * p[b][k]).sum();
            }
        }
        let float_b = [x[0], x[1], x[2]];
        let (mut fixed, mut ratio) = (None, None);
        if let Some(fix) = resolve(&qa, &a_hat) {
            ratio = Some(fix.ratio);
            if fix.ratio >= cfg.ratio {
                if let Some(qinv) = invert(&qa) {
                    let da: Vec<f64> = a_hat
                        .iter()
                        .zip(&fix.fixed)
                        .map(|(a, z)| a - *z as f64)
                        .collect();
                    let tmp: Vec<f64> = (0..na)
                        .map(|i| (0..na).map(|j| qinv[i][j] * da[j]).sum())
                        .collect();
                    let mut b = float_b;
                    for (k, bk) in b.iter_mut().enumerate() {
                        *bk -= (0..na).map(|j| qba[k][j] * tmp[j]).sum::<f64>();
                    }
                    fixed = Some(b);
                }
            }
        }
        out.push(RtkEpoch {
            t_gps_s: t,
            float_baseline_m: float_b,
            fixed_baseline_m: fixed,
            ratio,
            n_sats: sds.len(),
        });
    }
    RtkResult {
        epochs: out,
        n_slips,
    }
}

fn add_state(x: &mut Vec<f64>, p: &mut Vec<Vec<f64>>, value: f64, var: f64) -> usize {
    let n = x.len();
    x.push(value);
    for row in p.iter_mut() {
        row.push(0.0);
    }
    let mut row = vec![0.0; n + 1];
    row[n] = var;
    p.push(row);
    n
}

fn reset(x: &mut [f64], p: &mut [Vec<f64>], k: usize, value: f64, var: f64) {
    x[k] = value;
    for i in 0..x.len() {
        p[i][k] = 0.0;
        p[k][i] = 0.0;
    }
    p[k][k] = var;
}

/// Batch Kalman update `x += K v`, `P = (I − K H) P`, `K = P Hᵀ (H P Hᵀ + R)⁻¹`.
fn kalman_update(x: &mut [f64], p: &mut [Vec<f64>], h: &[Vec<f64>], v: &[f64], r: &[Vec<f64>]) {
    let n = x.len();
    let m = v.len();
    // PHt (n x m)
    let pht: Vec<Vec<f64>> = (0..n)
        .map(|i| {
            (0..m)
                .map(|j| (0..n).map(|k| p[i][k] * h[j][k]).sum())
                .collect()
        })
        .collect();
    let mut s = r.to_vec();
    for (i, row) in s.iter_mut().enumerate() {
        for (j, sij) in row.iter_mut().enumerate() {
            *sij += (0..n).map(|k| h[i][k] * pht[k][j]).sum::<f64>();
        }
    }
    let Some(si) = invert(&s) else { return };
    let k: Vec<Vec<f64>> = (0..n)
        .map(|i| {
            (0..m)
                .map(|j| (0..m).map(|l| pht[i][l] * si[l][j]).sum())
                .collect()
        })
        .collect();
    for i in 0..n {
        x[i] += (0..m).map(|j| k[i][j] * v[j]).sum::<f64>();
    }
    // P = P − K (H P) with H P = PHtᵀ.
    let old = p.to_vec();
    for i in 0..n {
        for j in 0..n {
            p[i][j] = old[i][j] - (0..m).map(|l| k[i][l] * pht[j][l]).sum::<f64>();
        }
    }
    // Symmetrise.
    for i in 0..n {
        for j in 0..i {
            let a = 0.5 * (p[i][j] + p[j][i]);
            p[i][j] = a;
            p[j][i] = a;
        }
    }
}

/// Inverse of a small square matrix by Gauss-Jordan elimination with partial pivoting.
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
        let piv = (c..n).max_by(|&i, &j| m[i][c].abs().total_cmp(&m[j][c].abs()))?;
        if m[piv][c].abs() < 1e-300 {
            return None;
        }
        m.swap(c, piv);
        let d = m[c][c];
        for v in m[c].iter_mut() {
            *v /= d;
        }
        for r in 0..n {
            if r != c {
                let f = m[r][c];
                if f != 0.0 {
                    for k in 0..2 * n {
                        m[r][k] -= f * m[c][k];
                    }
                }
            }
        }
    }
    Some(m.into_iter().map(|r| r[n..].to_vec()).collect())
}

fn sub(a: Vec3, b: Vec3) -> Vec3 {
    [a[0] - b[0], a[1] - b[1], a[2] - b[2]]
}
fn add(a: Vec3, b: Vec3) -> Vec3 {
    [a[0] + b[0], a[1] + b[1], a[2] + b[2]]
}
fn scale(a: Vec3, k: f64) -> Vec3 {
    [a[0] * k, a[1] * k, a[2] * k]
}
fn norm(a: Vec3) -> f64 {
    (a[0] * a[0] + a[1] * a[1] + a[2] * a[2]).sqrt()
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn invert_recovers_the_identity() {
        let a = vec![
            vec![4.0, 1.0, 0.5],
            vec![1.0, 3.0, 0.2],
            vec![0.5, 0.2, 2.0],
        ];
        let ai = invert(&a).unwrap();
        for i in 0..3 {
            for j in 0..3 {
                let s: f64 = (0..3).map(|k| a[i][k] * ai[k][j]).sum();
                assert!((s - if i == j { 1.0 } else { 0.0 }).abs() < 1e-12);
            }
        }
    }

    #[test]
    fn kalman_update_of_a_scalar_matches_the_closed_form() {
        let mut x = vec![0.0];
        let mut p = vec![vec![4.0]];
        kalman_update(&mut x, &mut p, &[vec![1.0]], &[2.0], &[vec![1.0]]);
        assert!((x[0] - 1.6).abs() < 1e-12);
        assert!((p[0][0] - 0.8).abs() < 1e-12);
    }
}
