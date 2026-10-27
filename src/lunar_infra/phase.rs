// SPDX-License-Identifier: AGPL-3.0-only
//! Study `carrier-phase`: joint surface-orbiter processing of carrier phase with integer ambiguity
//! resolution.
//!
//! A lunar surface station (fixed in the rotating frame, so the lunar body-fixed frame with no
//! libration) and an orbiter on the reference orbit both track the Earth-GNSS signals. Between-
//! receiver single differences remove the satellite clocks and most of the signal-in-space error;
//! the per-epoch receiver clock difference is profiled out by centring each epoch's rows. Unknowns:
//! the station position (3), the orbiter initial state (6) and one ambiguity per continuous pass
//! of a satellite seen by both receivers; the longest pass is the gauge, so the integers are
//! between-pass double differences. The float ambiguity covariance is the Schur complement of the
//! normal equations; [`crate::lambda::resolve`] gives the integer solution, the bootstrapped rate is
//! a lower bound of the integer-least-squares rate, and a seeded Monte Carlo measures that rate.

use rand::SeedableRng;
use rand_chacha::ChaCha8Rng;
use serde::{Deserialize, Serialize};
use serde_json::{json, Value};

use super::gnss::{code_sigma_m, phase_sigma_m, GnssSpec};
use super::la::{self, Mat};
use super::orbit::{
    d_inertial_dx0, inertial_from_rot, moon_inertial, norm, rot_z, sub, OrbitSpec, L_M, R_MOON_M,
    T_UNIT_S,
};
use crate::cr3bp::EARTH_MOON_MU;
use crate::lambda;
use crate::portable_distr::{Distribution, StandardNormal};

/// Surface section (shared with `frame-coestimation`).
#[derive(Clone, Debug, Default, Deserialize, Serialize)]
#[serde(deny_unknown_fields)]
pub struct SurfaceSpec {
    /// Selenographic latitude of the station, degrees (0).
    pub lat_deg: Option<f64>,
    /// Selenographic longitude, degrees (0).
    pub lon_deg: Option<f64>,
    /// Minimum elevation of a tracked satellite above the local horizon, degrees (5).
    pub min_elevation_deg: Option<f64>,
    /// Station positions `[lat_deg, lon_deg]` (frame co-estimation).
    pub stations: Option<Vec<[f64; 2]>>,
    /// One-way orbiter-to-station range 1-sigma, m (frame co-estimation; 1).
    pub orbiter_range_sigma_m: Option<f64>,
}

/// Monte Carlo section of this study.
#[derive(Clone, Debug, Default, Deserialize, Serialize)]
#[serde(deny_unknown_fields)]
pub struct PhaseMc {
    /// Trials (2000).
    pub trials: Option<usize>,
}

/// One raw observation row: `epoch`, the nine geometry partials, the pass whose ambiguity it
/// carries (phase rows) and its weight.
#[derive(Clone, Debug)]
pub struct Row {
    /// Epoch index.
    pub epoch: usize,
    /// Partials with respect to the orbiter state (6) and the station position (3).
    pub h: [f64; 9],
    /// Pass index of the ambiguity (phase rows), `None` for a code row.
    pub pass: Option<usize>,
    /// Weight `1 / sigma^2`, 1/m^2.
    pub w: f64,
}

/// The assembled measurement design of one arc.
pub struct Design {
    /// Rows.
    pub rows: Vec<Row>,
    /// Number of passes before pruning.
    pub n_pass: usize,
    /// Wavelength, m.
    pub lambda_m: f64,
    /// Epochs with at least two common satellites.
    pub epochs_dd: usize,
    /// Epochs in the arc.
    pub epochs: usize,
    /// Epochs with at least one common satellite.
    pub epochs_common: usize,
}

fn unit(v: [f64; 3]) -> [f64; 3] {
    let n = norm(v);
    [v[0] / n, v[1] / n, v[2] / n]
}

/// The surface site: Earth-centred inertial position at `t_s` and the local zenith.
fn site_at(lat: f64, lon: f64, t_s: f64) -> ([f64; 3], [f64; 3]) {
    let (sl, cl) = (lat.sin(), lat.cos());
    let (so, co) = (lon.sin(), lon.cos());
    // Selenographic longitude 0 faces Earth (the -x direction of the rotating frame); east is -y.
    let off = [-R_MOON_M * cl * co, -R_MOON_M * cl * so, R_MOON_M * sl];
    let th = t_s / T_UNIT_S;
    let pos = rot_z(th, [L_M + off[0], off[1], off[2]]);
    (pos, rot_z(th, unit(off)))
}

/// Build the design of one arc.
pub fn design(
    orbit: &OrbitSpec,
    gnss: &GnssSpec,
    surface: &SurfaceSpec,
    arc_days: f64,
) -> Result<Design, String> {
    let ro = orbit.build(arc_days)?;
    let cons = gnss.constellation()?;
    let lam = cons.wavelength_m();
    let lat = surface.lat_deg.unwrap_or(0.0).to_radians();
    let lon = surface.lon_deg.unwrap_or(0.0).to_radians();
    let min_el = surface.min_elevation_deg.unwrap_or(5.0).to_radians().sin();
    let n = ro.t_s.len();
    let mut rows: Vec<Row> = Vec::new();
    let mut n_pass = 0usize;
    let mut current: Vec<Option<usize>> = vec![None; cons.len()];
    let (mut epochs_dd, mut epochs_common) = (0, 0);
    for k in 0..n {
        let t = ro.t_s[k];
        let sc = inertial_from_rot(&ro.x[k], t);
        let moon = moon_inertial(t);
        let (site, zen) = site_at(lat, lon, t);
        let to = cons.tracked(sc.r, t, Some((moon, R_MOON_M)));
        let ts: Vec<_> = cons
            .tracked(site, t, None)
            .into_iter()
            .filter(|x| {
                let d = sub(x.r_sat, site);
                (d[0] * zen[0] + d[1] * zen[1] + d[2] * zen[2]) / norm(d) >= min_el
            })
            .collect();
        let common: Vec<_> = to
            .iter()
            .filter_map(|a| ts.iter().find(|b| b.sat == a.sat).map(|b| (a, b)))
            .collect();
        epochs_common += usize::from(!common.is_empty());
        epochs_dd += usize::from(common.len() >= 2);
        let present: Vec<usize> = common.iter().map(|(a, _)| a.sat).collect();
        for (j, cur) in current.iter_mut().enumerate() {
            if !present.contains(&j) {
                *cur = None;
            }
        }
        let (dr, _) = d_inertial_dx0(&ro.phi[k], t);
        let base = norm(sub(sc.r, site));
        for (a, b) in &common {
            if current[a.sat].is_none() {
                current[a.sat] = Some(n_pass);
                n_pass += 1;
            }
            let pass = current[a.sat];
            let uo = unit(sub(sc.r, a.r_sat));
            let us = unit(sub(site, b.r_sat));
            let mut h = [0.0; 9];
            for j in 0..6 {
                h[j] = uo[0] * dr[0][j] + uo[1] * dr[1][j] + uo[2] * dr[2][j];
            }
            // Station position error is a body-fixed (rotating-frame) offset; rotate it inertial.
            let th = t / T_UNIT_S;
            for c in 0..3 {
                let mut e = [0.0; 3];
                e[c] = 1.0;
                let ri = rot_z(th, e);
                h[6 + c] = -(us[0] * ri[0] + us[1] * ri[1] + us[2] * ri[2]);
            }
            let sis = cons.sis_sigma_m * base / norm(sub(sc.r, a.r_sat));
            let sc2 = code_sigma_m(a.cn0_dbhz, cons.dll_bn_hz).powi(2)
                + code_sigma_m(b.cn0_dbhz, cons.dll_bn_hz).powi(2)
                + sis * sis;
            let sp2 = phase_sigma_m(a.cn0_dbhz, cons.phase_bn_hz, lam).powi(2)
                + phase_sigma_m(b.cn0_dbhz, cons.phase_bn_hz, lam).powi(2)
                + sis * sis;
            rows.push(Row {
                epoch: k,
                h,
                pass: None,
                w: 1.0 / sc2,
            });
            rows.push(Row {
                epoch: k,
                h,
                pass,
                w: 1.0 / sp2,
            });
        }
    }
    Ok(Design {
        rows,
        n_pass,
        lambda_m: lam,
        epochs_dd,
        epochs: n,
        epochs_common,
    })
}

/// The float solution of a design.
pub struct Float {
    /// Passes kept (connected to the reference through shared epochs), including the reference.
    pub passes_used: usize,
    /// Double-difference ambiguity covariance, cycles^2.
    pub q: Mat,
    /// Float covariance of the nine position parameters, m^2.
    pub p_float: Mat,
    /// Covariance of the nine position parameters given the correct integers, m^2.
    pub p_fixed: Mat,
}

/// Solve the float normal equations with per-epoch centring; the longest pass is the gauge.
pub fn solve_float(d: &Design) -> Result<Float, String> {
    // Pass lengths (phase rows) and the reference.
    let mut len = vec![0usize; d.n_pass];
    for r in &d.rows {
        if let Some(p) = r.pass {
            len[p] += 1;
        }
    }
    let reference = (0..d.n_pass)
        .max_by_key(|&p| len[p])
        .ok_or_else(|| crate::terr!("e-lunar-infra-phase-no-common-satellite-between-the"))?;
    // Connected component of the reference: passes that share an epoch.
    let mut epochs_of: Vec<Vec<usize>> = vec![vec![]; d.epochs];
    for r in &d.rows {
        if let Some(p) = r.pass {
            if !epochs_of[r.epoch].contains(&p) {
                epochs_of[r.epoch].push(p);
            }
        }
    }
    let mut in_comp = vec![false; d.n_pass];
    in_comp[reference] = true;
    loop {
        let mut grew = false;
        for ps in &epochs_of {
            if ps.iter().any(|&p| in_comp[p]) {
                for &p in ps {
                    if !in_comp[p] {
                        in_comp[p] = true;
                        grew = true;
                    }
                }
            }
        }
        if !grew {
            break;
        }
    }
    let mut col = vec![usize::MAX; d.n_pass];
    let mut next = 9;
    for p in 0..d.n_pass {
        if in_comp[p] && p != reference {
            col[p] = next;
            next += 1;
        }
    }
    let dim = next;
    let passes_used = in_comp.iter().filter(|&&b| b).count();
    if dim <= 9 {
        return Err(crate::terr!(
            "e-lunar-infra-phase-fewer-than-two-connected-passes"
        ));
    }
    let mut info = la::zeros(dim, dim);
    let mut i0 = 0;
    while i0 < d.rows.len() {
        let ep = d.rows[i0].epoch;
        let mut i1 = i0;
        while i1 < d.rows.len() && d.rows[i1].epoch == ep {
            i1 += 1;
        }
        let group = &d.rows[i0..i1];
        let dense: Vec<(Vec<f64>, f64)> = group
            .iter()
            .filter(|r| r.pass.is_none_or(|p| in_comp[p]))
            .map(|r| {
                let mut a = vec![0.0; dim];
                a[..9].copy_from_slice(&r.h);
                if let Some(p) = r.pass {
                    if col[p] != usize::MAX {
                        a[col[p]] = d.lambda_m;
                    }
                }
                (a, r.w)
            })
            .collect();
        let sw: f64 = dense.iter().map(|x| x.1).sum();
        if sw > 0.0 {
            let mut mean = vec![0.0; dim];
            for (a, w) in &dense {
                for c in 0..dim {
                    mean[c] += w * a[c] / sw;
                }
            }
            for (a, w) in &dense {
                let ac: Vec<f64> = (0..dim).map(|c| a[c] - mean[c]).collect();
                for p in 0..dim {
                    if ac[p] == 0.0 {
                        continue;
                    }
                    let wp = w * ac[p];
                    for q in 0..dim {
                        info[p][q] += wp * ac[q];
                    }
                }
            }
        }
        i0 = i1;
    }
    let info = la::sym(&info);
    let p = la::inverse(&info)
        .ok_or_else(|| crate::terr!("e-lunar-infra-phase-the-carrier-phase-normal-equations"))?;
    let q: Mat = (9..dim)
        .map(|i| (9..dim).map(|j| p[i][j]).collect())
        .collect();
    let p_float = la::block(&p, 9);
    let p_fixed = la::inverse(&la::block(&info, 9))
        .ok_or_else(|| crate::terr!("e-lunar-infra-phase-the-position-block-is-singular"))?;
    Ok(Float {
        passes_used,
        q,
        p_float,
        p_fixed,
    })
}

fn pos3(p: &Mat, from: usize) -> f64 {
    (p[from][from] + p[from + 1][from + 1] + p[from + 2][from + 2])
        .max(0.0)
        .sqrt()
}

/// Run the study.
pub fn run(
    orbit: &OrbitSpec,
    gnss: &GnssSpec,
    surface: &SurfaceSpec,
    mc: &PhaseMc,
    seed: u64,
) -> Result<Value, String> {
    let arcs = orbit
        .arcs_days
        .clone()
        .unwrap_or_else(|| vec![orbit.arc_days.unwrap_or(1.0)]);
    let trials = mc.trials.unwrap_or(2000);
    if trials == 0 {
        return Err(crate::terr!("e-lunar-infra-od-monte-carlo-trials-must-be"));
    }
    let mut out = Vec::new();
    for (ai, &arc) in arcs.iter().enumerate() {
        let d = design(orbit, gnss, surface, arc)?;
        let f = solve_float(&d)?;
        let n = f.q.len();
        let sig: Vec<f64> = (0..n).map(|i| f.q[i][i].sqrt()).collect();
        let boot_plain = lambda::bootstrap_success_rate(&f.q);
        let zero = vec![0.0; n];
        let res = lambda::resolve(&f.q, &zero);
        let boot_decor = res.as_ref().map(|r| r.success_rate);
        let l = la::cholesky(&f.q)
            .ok_or_else(|| crate::terr!("e-lunar-infra-phase-the-ambiguity-covariance-is-not"))?;
        let mut rng =
            ChaCha8Rng::seed_from_u64(seed ^ (ai as u64 + 1).wrapping_mul(0x9E37_79B9_7F4A_7C15));
        let (mut ok, mut exhausted) = (0usize, 0usize);
        for _ in 0..trials {
            let g: Vec<f64> = (0..n).map(|_| StandardNormal.sample(&mut rng)).collect();
            let z = la::matvec(&l, &g);
            match lambda::resolve(&f.q, &z) {
                Some(fix) => ok += usize::from(fix.fixed.iter().all(|&v| v == 0)),
                None => exhausted += 1,
            }
        }
        let mc_rate = ok as f64 / trials as f64;
        let se = (mc_rate * (1.0 - mc_rate) / trials as f64).sqrt();
        let mut sorted = sig.clone();
        sorted.sort_by(f64::total_cmp);
        out.push(json!({
            "arc_days": arc,
            "epochs": d.epochs,
            "epochs_with_a_common_satellite": d.epochs_common as f64 / d.epochs as f64,
            "epochs_with_two_or_more_common_satellites": d.epochs_dd as f64 / d.epochs as f64,
            "passes": d.n_pass,
            "passes_used": f.passes_used,
            "double_difference_ambiguities": n,
            "median_ambiguity_sigma_cycles": sorted[n / 2],
            "max_ambiguity_sigma_cycles": sorted[n - 1],
            "bootstrapped_success_rate": boot_plain,
            "bootstrapped_success_rate_decorrelated": boot_decor,
            "monte_carlo_success_rate": mc_rate,
            "monte_carlo_standard_error": se,
            "search_budget_exhausted_trials": exhausted,
            "station_position_sigma_float_m": pos3(&f.p_float, 6),
            "station_position_sigma_fixed_m": pos3(&f.p_fixed, 6),
            "orbiter_position_sigma_float_m": pos3(&f.p_float, 0) * L_M,
            "orbiter_position_sigma_fixed_m": pos3(&f.p_fixed, 0) * L_M,
        }));
    }
    let _ = EARTH_MOON_MU;
    Ok(json!({ "wavelength_m": gnss.constellation()?.wavelength_m(), "arcs": out }))
}

/// The raw design of one arc and its float solution as JSON, for the independent numpy oracle
/// (bar Q3): every row (epoch, nine partials, ambiguity column, weight), the gauge convention and
/// the Rust results.
pub fn export_design(
    orbit: &OrbitSpec,
    gnss: &GnssSpec,
    surface: &SurfaceSpec,
    arc_days: f64,
) -> Result<Value, String> {
    let d = design(orbit, gnss, surface, arc_days)?;
    let f = solve_float(&d)?;
    let rows: Vec<Value> = d
        .rows
        .iter()
        .map(|r| json!({"epoch": r.epoch, "h": r.h.to_vec(), "pass": r.pass, "w": r.w}))
        .collect();
    Ok(json!({
        "lambda_m": d.lambda_m,
        "n_pass": d.n_pass,
        "rows": rows,
        "passes_used": f.passes_used,
        "q": f.q,
        "p_float": f.p_float,
        "p_fixed": f.p_fixed,
        "bootstrap": lambda::bootstrap_success_rate(&f.q),
    }))
}
