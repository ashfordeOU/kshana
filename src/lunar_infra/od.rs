// SPDX-License-Identifier: AGPL-3.0-only
//! Study `od-consistency`: onboard Earth-GNSS orbit determination in lunar orbit against an
//! independent ground radiometric orbit determination, judged by their own covariances.
//!
//! Both estimators are linearised batch least squares about the reference CR3BP orbit (one
//! Gauss-Newton step; the iterated estimator is the same to first order). The two measurement sets
//! carry independent noise, so with matched models the normalised difference
//! `q = d' (P_G + P_R)^-1 d` of the two estimates is chi-square with six degrees of freedom. An
//! unmodelled acceleration in the truth makes the estimators disagree and inflates `q`.

use rand::SeedableRng;
use rand_chacha::ChaCha8Rng;
use serde::{Deserialize, Serialize};
use serde_json::{json, Value};

use super::gnss::{code_sigma_m, GnssSpec};
use super::la::{self, Mat};
use super::orbit::{
    d_inertial_dx0, dot, inertial_from_rot, moon_inertial, norm, propagate_with_accel,
    station_inertial, sub, OrbitSpec, DSN_STATIONS, L_M, R_MOON_M, T_UNIT_S,
};
use crate::cr3bp::EARTH_MOON_MU;
use crate::earth_gnss_lunar::segment_blocked_by_sphere;
use crate::portable_distr::{Distribution, StandardNormal};

/// Ground-tracking section.
#[derive(Clone, Debug, Default, Deserialize, Serialize)]
#[serde(deny_unknown_fields)]
pub struct GroundSpec {
    /// Station names (`DSS-14`, `DSS-63`, `DSS-43`).
    pub stations: Option<Vec<String>>,
    /// Two-way range 1-sigma, m (5).
    pub range_sigma_m: Option<f64>,
    /// Two-way range-rate 1-sigma, mm/s (0.05).
    pub doppler_sigma_mm_s: Option<f64>,
    /// Minimum elevation, degrees (10).
    pub min_elevation_deg: Option<f64>,
    /// Earth rotation phase at the arc start, degrees (0).
    pub earth_rotation_phase_deg: Option<f64>,
}

/// Monte Carlo section.
#[derive(Clone, Debug, Default, Deserialize, Serialize)]
#[serde(deny_unknown_fields)]
pub struct McSpec {
    /// Trials (400).
    pub trials: Option<usize>,
    /// Unmodelled constant acceleration along the rotating-frame +y axis, m/s^2 (0).
    pub model_error_accel_m_s2: Option<f64>,
}

/// The 95 % point of chi-square with six degrees of freedom.
pub const CHI2_6_95: f64 = 12.591_587_243_743_977;

struct Rows {
    h: Mat,
    w: Vec<f64>,
    dy: Vec<f64>,
}

fn unit(v: [f64; 3]) -> [f64; 3] {
    let n = norm(v);
    [v[0] / n, v[1] / n, v[2] / n]
}

/// `P = (H' W H)^-1` and the gain `K = P H' W` (`n x m`).
fn solve(rows: &Rows, n: usize) -> Result<(Mat, Mat), String> {
    let mut info = la::zeros(n, n);
    for (h, &w) in rows.h.iter().zip(&rows.w) {
        for i in 0..n {
            for j in 0..n {
                info[i][j] += w * h[i] * h[j];
            }
        }
    }
    let p = la::inverse(&la::sym(&info))
        .ok_or_else(|| crate::terr!("e-lunar-infra-od-the-measurement-set-does-not"))?;
    let m = rows.h.len();
    let mut k = la::zeros(n, m);
    for (c, (h, &w)) in rows.h.iter().zip(&rows.w).enumerate() {
        for i in 0..n {
            let mut s = 0.0;
            for j in 0..n {
                s += p[i][j] * h[j];
            }
            k[i][c] = s * w;
        }
    }
    Ok((p, k))
}

fn apply(k: &Mat, y: &[f64]) -> Vec<f64> {
    k.iter()
        .map(|row| row.iter().zip(y).map(|(a, b)| a * b).sum())
        .collect()
}

fn pos_sigma_m(p: &Mat) -> f64 {
    ((p[0][0] + p[1][1] + p[2][2]).max(0.0)).sqrt() * L_M
}

fn vel_sigma_m_s(p: &Mat) -> f64 {
    ((p[3][3] + p[4][4] + p[5][5]).max(0.0)).sqrt() * L_M / T_UNIT_S
}

/// Run the study.
#[allow(clippy::too_many_lines)]
pub fn run(
    orbit: &OrbitSpec,
    gnss: &GnssSpec,
    ground: &GroundSpec,
    mc: &McSpec,
    seed: u64,
) -> Result<Value, String> {
    let arc_days = orbit.arc_days.unwrap_or(3.0);
    let ro = orbit.build(arc_days)?;
    let cons = gnss.constellation()?;
    let n = ro.t_s.len();
    let trials = mc.trials.unwrap_or(400);
    if trials == 0 {
        return Err(crate::terr!("e-lunar-infra-od-monte-carlo-trials-must-be"));
    }
    let sig_rho = ground.range_sigma_m.unwrap_or(5.0);
    let sig_rr = ground.doppler_sigma_mm_s.unwrap_or(0.05) * 1e-3;
    let min_el = ground.min_elevation_deg.unwrap_or(10.0).to_radians();
    let phase = ground.earth_rotation_phase_deg.unwrap_or(0.0).to_radians();
    if !(sig_rho > 0.0 && sig_rr > 0.0) {
        return Err(crate::terr!(
            "e-lunar-infra-od-ground-sigmas-must-be-positive"
        ));
    }
    let names = ground
        .stations
        .clone()
        .unwrap_or_else(|| DSN_STATIONS.iter().map(|s| s.name.to_string()).collect());
    let mut stations = Vec::new();
    for nm in &names {
        stations.push(
            *DSN_STATIONS.iter().find(|s| s.name == nm).ok_or_else(|| {
                crate::terr!("e-lunar-infra-od-unknown-station-dss-14-dss", nm = nm)
            })?,
        );
    }
    // The truth: the reference orbit, or the CR3BP orbit under an unmodelled acceleration.
    let a_si = mc.model_error_accel_m_s2.unwrap_or(0.0);
    let a_nd = a_si / (L_M / (T_UNIT_S * T_UNIT_S));
    let truth_x = if a_nd != 0.0 {
        propagate_with_accel(&ro.x[0], n - 1, orbit.sample_s(), [0.0, a_nd, 0.0])
    } else {
        ro.x.clone()
    };

    // Design matrices.
    let mut g = Rows {
        h: vec![],
        w: vec![],
        dy: vec![],
    };
    let mut r = Rows {
        h: vec![],
        w: vec![],
        dy: vec![],
    };
    let (mut epochs_gnss1, mut epochs_gnss4, mut tracked_sum, mut epochs_ground) =
        (0usize, 0usize, 0usize, 0usize);
    for k in 0..n {
        let t = ro.t_s[k];
        let sc = inertial_from_rot(&ro.x[k], t);
        let st = inertial_from_rot(&truth_x[k], t);
        let (dr, dv) = d_inertial_dx0(&ro.phi[k], t);
        // GNSS pseudoranges.
        let moon_c = moon_inertial(t);
        let tr = cons.tracked(sc.r, t, Some((moon_c, R_MOON_M)));
        tracked_sum += tr.len();
        epochs_gnss1 += usize::from(!tr.is_empty());
        epochs_gnss4 += usize::from(tr.len() >= 4);
        for x in &tr {
            let rho = sub(sc.r, x.r_sat);
            let d = norm(rho);
            let u = unit(rho);
            let mut row = vec![0.0; 8];
            for j in 0..6 {
                row[j] = u[0] * dr[0][j] + u[1] * dr[1][j] + u[2] * dr[2][j];
            }
            row[6] = 1.0;
            row[7] = t;
            let s = code_sigma_m(x.cn0_dbhz, cons.dll_bn_hz);
            g.h.push(row);
            g.w.push(1.0 / (s * s + cons.sis_sigma_m * cons.sis_sigma_m));
            g.dy.push(norm(sub(st.r, x.r_sat)) - d);
        }
        // Ground range and range rate from the best-placed station.
        let moon = moon_c;
        let mut best: Option<(f64, usize)> = None;
        for (i, stn) in stations.iter().enumerate() {
            let sk = station_inertial(stn, t, phase);
            let los = sub(sc.r, sk.r);
            let sin_el = dot(los, sk.r) / (norm(los) * norm(sk.r));
            let blocked = segment_blocked_by_sphere(sub(sk.r, moon), sub(sc.r, moon), R_MOON_M);
            if sin_el >= min_el.sin() && !blocked && best.is_none_or(|(e, _)| sin_el > e) {
                best = Some((sin_el, i));
            }
        }
        if let Some((_, i)) = best {
            epochs_ground += 1;
            let sk = station_inertial(&stations[i], t, phase);
            let los = sub(sc.r, sk.r);
            let rho = norm(los);
            let u = unit(los);
            let vrel = sub(sc.v, sk.v);
            let rr = dot(u, vrel);
            let mut row_r = vec![0.0; 6];
            let mut row_d = vec![0.0; 6];
            for j in 0..6 {
                row_r[j] = u[0] * dr[0][j] + u[1] * dr[1][j] + u[2] * dr[2][j];
                let mut s = 0.0;
                for a in 0..3 {
                    let dpdr = (vrel[a] - rr * u[a]) / rho;
                    s += dpdr * dr[a][j] + u[a] * dv[a][j];
                }
                row_d[j] = s;
            }
            let los_t = sub(st.r, sk.r);
            let rho_t = norm(los_t);
            let rr_t = dot(unit(los_t), sub(st.v, sk.v));
            r.h.push(row_r);
            r.w.push(1.0 / (sig_rho * sig_rho));
            r.dy.push(rho_t - rho);
            r.h.push(row_d);
            r.w.push(1.0 / (sig_rr * sig_rr));
            r.dy.push(rr_t - rr);
        }
    }
    if g.h.len() < 8 {
        return Err(
            "too few trackable GNSS measurements to determine the orbit and the receiver clock"
                .into(),
        );
    }
    if r.h.len() < 6 {
        return Err(crate::terr!(
            "e-lunar-infra-od-too-few-ground-measurements-to"
        ));
    }
    let (pg8, kg) = solve(&g, 8)?;
    let (pr, kr) = solve(&r, 6)?;
    let pg = la::block(&pg8, 6);
    let sum = la::sym(&la::add(&pg, &pr));
    let sum_inv = la::inverse(&sum)
        .ok_or_else(|| crate::terr!("e-lunar-infra-od-the-covariance-of-the-difference"))?;

    // Systematic part (zero when the models match) and Monte Carlo noise.
    let bias_g = apply(&kg, &g.dy);
    let bias_r = apply(&kr, &r.dy);
    let mut rng = ChaCha8Rng::seed_from_u64(seed);
    let draw = |rng: &mut ChaCha8Rng| -> f64 { StandardNormal.sample(rng) };
    let (mut q_sum, mut within) = (0.0, 0usize);
    let mut cov_g = la::zeros(6, 6);
    let mut cov_r = la::zeros(6, 6);
    let mut d_pos_sum = 0.0;
    for _ in 0..trials {
        let yg: Vec<f64> = g.w.iter().map(|w| draw(&mut rng) / w.sqrt()).collect();
        let yr: Vec<f64> = r.w.iter().map(|w| draw(&mut rng) / w.sqrt()).collect();
        let eg = apply(&kg, &yg);
        let er = apply(&kr, &yr);
        let xg: Vec<f64> = (0..6).map(|i| eg[i] + bias_g[i]).collect();
        let xr: Vec<f64> = (0..6).map(|i| er[i] + bias_r[i]).collect();
        let d: Vec<f64> = (0..6).map(|i| xg[i] - xr[i]).collect();
        let q = la::quad(&sum_inv, &d);
        q_sum += q;
        within += usize::from(q <= CHI2_6_95);
        d_pos_sum += ((d[0] * d[0] + d[1] * d[1] + d[2] * d[2]).sqrt()) * L_M;
        for i in 0..6 {
            for j in 0..6 {
                cov_g[i][j] += xg[i] * xg[j];
                cov_r[i][j] += xr[i] * xr[j];
            }
        }
    }
    let nt = trials as f64;
    let mean_q = q_sum / nt;
    let frac_within = within as f64 / nt;
    let ratio_g = la::trace(&cov_g) / nt / la::trace(&pg);
    let ratio_r = la::trace(&cov_r) / nt / la::trace(&pr);

    // Radial-transverse-normal position sigmas about the Moon at the arc start, and the 3-D
    // position sigma carried to the arc end through the state-transition matrix.
    let x0 = ro.x[0];
    let p_moon = [x0[0] - (1.0 - EARTH_MOON_MU), x0[1], x0[2]];
    let v_rel = [x0[3] - p_moon[1], x0[4] + p_moon[0], x0[5]];
    let rhat = unit(p_moon);
    let nvec = [
        p_moon[1] * v_rel[2] - p_moon[2] * v_rel[1],
        p_moon[2] * v_rel[0] - p_moon[0] * v_rel[2],
        p_moon[0] * v_rel[1] - p_moon[1] * v_rel[0],
    ];
    let nhat = unit(nvec);
    let that = [
        nhat[1] * rhat[2] - nhat[2] * rhat[1],
        nhat[2] * rhat[0] - nhat[0] * rhat[2],
        nhat[0] * rhat[1] - nhat[1] * rhat[0],
    ];
    let rtn = |p: &Mat| -> [f64; 3] {
        let axes = [rhat, that, nhat];
        let mut out = [0.0; 3];
        for (o, a) in out.iter_mut().zip(axes) {
            let mut s = 0.0;
            for i in 0..3 {
                for j in 0..3 {
                    s += a[i] * p[i][j] * a[j];
                }
            }
            *o = s.max(0.0).sqrt() * L_M;
        }
        out
    };
    let end_sigma = |p: &Mat| -> f64 {
        let phi = &ro.phi[n - 1];
        let mut m = la::zeros(3, 6);
        for i in 0..3 {
            for j in 0..6 {
                m[i][j] = phi[i][j];
            }
        }
        let c = la::matmul(&la::matmul(&m, p), &la::transpose(&m));
        (la::trace(&c).max(0.0)).sqrt() * L_M
    };
    let rtn_g = rtn(&pg);
    let rtn_r = rtn(&pr);
    Ok(json!({
        "orbit": {
            "family": ro.family,
            "arc_days": arc_days,
            "sample_s": orbit.sample_s(),
            "samples": n,
            "period_days": ro.period_s.map(|p| p / 86_400.0),
        },
        "geometry": {
            "gnss_epochs_with_one_or_more_satellites": epochs_gnss1 as f64 / n as f64,
            "gnss_epochs_with_four_or_more_satellites": epochs_gnss4 as f64 / n as f64,
            "gnss_mean_satellites_tracked": tracked_sum as f64 / n as f64,
            "ground_epochs_with_a_station": epochs_ground as f64 / n as f64,
            "gnss_measurements": g.h.len(),
            "ground_measurements": r.h.len(),
        },
        "gnss_estimate": {
            "position_sigma_m": pos_sigma_m(&pg),
            "velocity_sigma_m_s": vel_sigma_m_s(&pg),
            "radial_sigma_m": rtn_g[0],
            "transverse_sigma_m": rtn_g[1],
            "normal_sigma_m": rtn_g[2],
            "position_sigma_arc_end_m": end_sigma(&pg),
        },
        "ground_estimate": {
            "position_sigma_m": pos_sigma_m(&pr),
            "velocity_sigma_m_s": vel_sigma_m_s(&pr),
            "radial_sigma_m": rtn_r[0],
            "transverse_sigma_m": rtn_r[1],
            "normal_sigma_m": rtn_r[2],
            "position_sigma_arc_end_m": end_sigma(&pr),
        },
        "consistency": {
            "trials": trials,
            "model_error_accel_m_s2": a_si,
            "expected_mean_q": 6.0,
            "mean_q": mean_q,
            "chi2_95_point": CHI2_6_95,
            "fraction_within_95": frac_within,
            "fraction_exceeding_95": 1.0 - frac_within,
            "sample_over_formal_trace_gnss": ratio_g,
            "sample_over_formal_trace_ground": ratio_r,
            "formal_difference_position_sigma_m": pos_sigma_m(&sum),
            "mean_difference_position_m": d_pos_sum / nt,
        },
    }))
}

#[cfg(test)]
mod tests {
    use super::*;

    fn cfg(trials: usize, accel: f64) -> Value {
        run(
            &OrbitSpec {
                arc_days: Some(2.0),
                ..OrbitSpec::default()
            },
            &GnssSpec::default(),
            &GroundSpec::default(),
            &McSpec {
                trials: Some(trials),
                model_error_accel_m_s2: Some(accel),
            },
            7,
        )
        .unwrap()
    }

    #[test]
    fn matched_models_give_a_chi_square_six_statistic() {
        let v = cfg(300, 0.0);
        let c = &v["consistency"];
        let mq = c["mean_q"].as_f64().unwrap();
        assert!((4.5..7.5).contains(&mq), "mean q {mq}");
        let f = c["fraction_within_95"].as_f64().unwrap();
        assert!((0.88..0.99).contains(&f), "fraction {f}");
    }

    #[test]
    fn an_unmodelled_acceleration_inflates_the_statistic() {
        let a = cfg(120, 0.0)["consistency"]["mean_q"].as_f64().unwrap();
        let b = cfg(120, 5e-10)["consistency"]["mean_q"].as_f64().unwrap();
        assert!(b > a, "{a} {b}");
    }
}
