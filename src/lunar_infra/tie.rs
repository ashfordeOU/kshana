// SPDX-License-Identifier: AGPL-3.0-only
//! Study `space-tie`: GNSS, VLBI and laser ranging co-located on one spacecraft tie their reference
//! frames to each other; how well, as a function of the local-tie accuracy.
//!
//! Technique `k` observes the position of its reference point in its own frame,
//! `p_k = (1 + s_k) R(θ_k) (x + l_k) + t_k + noise` (first order: `x + l_k + s_k x + θ_k × x + t_k`),
//! with `x` the spacecraft reference point in the lunar axes, `l_k` the local vector to the
//! technique's reference point (known to `local_tie_sigma_m` per axis) and the offsets `(t, s, θ)`
//! of techniques 2 (VLBI) and 3 (laser ranging) relative to technique 1 (GNSS), 14 parameters.
//! Nine local-tie nuisance parameters carry the prior. The spacecraft position `x` at each epoch is
//! eliminated by the Schur complement of its three unknowns, so only differences between the
//! techniques inform the offsets. Scale and rotations are preconditioned by the lunar radius (their
//! sigmas read as metres at the surface). The reported values are Cramér-Rao bounds of this
//! linearised model.

use serde::{Deserialize, Serialize};
use serde_json::{json, Value};

use super::frame::orbiter_positions;
use super::la::{self, Mat};
use super::orbit::{OrbitSpec, R_MOON_M};
use crate::lunar_datum::datum7_point_jacobian_body;

/// Techniques section.
#[derive(Clone, Debug, Default, Deserialize, Serialize)]
#[serde(deny_unknown_fields)]
pub struct TechniqueSpec {
    /// GNSS position 1-sigma per axis per epoch, m (10).
    pub gnss_sigma_m: Option<f64>,
    /// VLBI position 1-sigma, m (1).
    pub vlbi_sigma_m: Option<f64>,
    /// Laser-ranging position 1-sigma, m (0.1).
    pub slr_sigma_m: Option<f64>,
    /// Local-tie 1-sigma per axis, m (0.001).
    pub local_tie_sigma_m: Option<f64>,
    /// Local-tie sigmas of the sweep, m ([0.001, 0.01, 0.1, 1]).
    pub local_tie_sweep_m: Option<Vec<f64>>,
    /// Factor applied to the three technique sigmas (1); a floor test uses 1e-6.
    pub sigma_scale: Option<f64>,
}

/// Number of parameters: 14 offsets and 9 local ties.
pub const NP: usize = 23;
const L0: usize = 14;

/// The technique names, in order; technique 1 is the reference.
pub const TECHNIQUES: [&str; 3] = ["gnss", "vlbi", "slr"];

/// Information matrix of the 23 parameters without the local-tie prior.
pub fn information(positions: &[[f64; 3]], sig: [f64; 3]) -> Mat {
    let w: [f64; 3] = [1.0 / (sig[0] * sig[0]), 1.0 / (sig[1] * sig[1]), 1.0 / (sig[2] * sig[2])];
    let sw: f64 = w.iter().sum();
    let mut info = la::zeros(NP, NP);
    for x in positions {
        let j = datum7_point_jacobian_body(*x);
        // Three-row blocks A_k (3 x NP), row-major [axis][param].
        let mut a = [[[0.0; NP]; 3]; 3];
        for axis in 0..3 {
            a[0][axis][L0 + axis] = 1.0;
            for (k, base) in [(1usize, 0usize), (2, 7)] {
                for c in 0..7 {
                    let scale = if c >= 3 { 1.0 / R_MOON_M } else { 1.0 };
                    a[k][axis][base + c] = j[axis][c] * scale;
                }
                a[k][axis][L0 + 3 * k + axis] = 1.0;
            }
        }
        // S = sum_k w_k A_k (3 x NP).
        let mut s = [[0.0; NP]; 3];
        for k in 0..3 {
            for axis in 0..3 {
                for c in 0..NP {
                    s[axis][c] += w[k] * a[k][axis][c];
                }
            }
        }
        for k in 0..3 {
            for axis in 0..3 {
                for p in 0..NP {
                    let v = w[k] * a[k][axis][p];
                    if v == 0.0 {
                        continue;
                    }
                    for q in 0..NP {
                        info[p][q] += v * a[k][axis][q];
                    }
                }
            }
        }
        for axis in 0..3 {
            for p in 0..NP {
                if s[axis][p] == 0.0 {
                    continue;
                }
                for q in 0..NP {
                    info[p][q] -= s[axis][p] * s[axis][q] / sw;
                }
            }
        }
    }
    la::sym(&info)
}

/// Whitened Jacobian of the 23 parameters after eliminating the spacecraft position at each
/// epoch: the weighted three-row blocks of the techniques, projected onto the complement of the
/// common-position columns (`M = I - H' H'ᵀ / Σw` with `H' = [√w_1 I; √w_2 I; √w_3 I]`).
/// `JᵀJ` equals [`information`]; the rows are what the square-root route triangularises.
pub fn whitened_rows(positions: &[[f64; 3]], sig: [f64; 3]) -> Vec<Vec<f64>> {
    let sw_k: [f64; 3] = [1.0 / sig[0], 1.0 / sig[1], 1.0 / sig[2]];
    let sum_w: f64 = sw_k.iter().map(|s| s * s).sum();
    let mut rows = Vec::with_capacity(9 * positions.len());
    for x in positions {
        let j = datum7_point_jacobian_body(*x);
        // Weighted block rows, 9 x NP.
        let mut a = vec![vec![0.0; NP]; 9];
        for axis in 0..3 {
            a[axis][L0 + axis] = sw_k[0];
            for (k, base) in [(1usize, 0usize), (2, 7)] {
                for c in 0..7 {
                    let scale = if c >= 3 { 1.0 / R_MOON_M } else { 1.0 };
                    a[3 * k + axis][base + c] = sw_k[k] * j[axis][c] * scale;
                }
                a[3 * k + axis][L0 + 3 * k + axis] = sw_k[k];
            }
        }
        for r in 0..9 {
            let mut row = a[r].clone();
            // Subtract H' (H'ᵀ a_col) / Σw: the component along the common-position direction.
            let (kr, axr) = (r / 3, r % 3);
            for c in 0..NP {
                let mut proj = 0.0;
                for k in 0..3 {
                    proj += sw_k[k] * a[3 * k + axr][c];
                }
                row[c] -= sw_k[kr] * proj / sum_w;
            }
            rows.push(row);
        }
    }
    rows
}

/// Covariance of the 23 parameters for a local-tie sigma, by the square-root route (the normal
/// equations of a near-perfect-technique problem lose most of their digits).
pub fn covariance(rows: &[Vec<f64>], tie_sigma_m: f64) -> Result<Mat, String> {
    let mut jac = rows.to_vec();
    for i in 0..9 {
        let mut r = vec![0.0; NP];
        r[L0 + i] = 1.0 / tie_sigma_m;
        jac.push(r);
    }
    let w = vec![1.0; jac.len()];
    let c = crate::fim::crlb_srif(&jac, &w, 1e-30);
    c.covariance.ok_or_else(|| "the space-tie information matrix is singular".to_string())
}

/// Sigmas of the offset `b - a` between two techniques (0-based, `a < b`): 7 values
/// `[t_x, t_y, t_z, scale, θ_x, θ_y, θ_z]` (the reference technique 0 has zero offset).
fn pair_sigmas(cov: &Mat, a: usize, b: usize) -> [f64; 7] {
    let idx = |k: usize, c: usize| -> Option<usize> {
        if k == 0 { None } else { Some((k - 1) * 7 + c) }
    };
    let mut out = [0.0; 7];
    for (c, o) in out.iter_mut().enumerate() {
        let (ia, ib) = (idx(a, c), idx(b, c));
        let var = |i: Option<usize>, j: Option<usize>| match (i, j) {
            (Some(i), Some(j)) => cov[i][j],
            _ => 0.0,
        };
        *o = (var(ib, ib) + var(ia, ia) - 2.0 * var(ia, ib)).max(0.0).sqrt();
    }
    out
}

/// Run the study.
pub fn run(orbit: &OrbitSpec, tech: &TechniqueSpec) -> Result<Value, String> {
    let scale = tech.sigma_scale.unwrap_or(1.0);
    let sig = [
        tech.gnss_sigma_m.unwrap_or(10.0) * scale,
        tech.vlbi_sigma_m.unwrap_or(1.0) * scale,
        tech.slr_sigma_m.unwrap_or(0.1) * scale,
    ];
    if sig.iter().any(|s| !(*s > 0.0)) {
        return Err("technique sigmas must be positive".into());
    }
    let tie = tech.local_tie_sigma_m.unwrap_or(0.001);
    let mut sweep = tech.local_tie_sweep_m.clone().unwrap_or_else(|| vec![0.001, 0.01, 0.1, 1.0]);
    if !sweep.contains(&tie) {
        sweep.push(tie);
        sweep.sort_by(|a, b| a.total_cmp(b));
    }
    if sweep.iter().any(|s| !(*s > 0.0)) {
        return Err("local-tie sigmas must be positive".into());
    }
    let arcs = orbit
        .arcs_days
        .clone()
        .unwrap_or_else(|| vec![orbit.arc_days.unwrap_or(6.56)]);
    let pairs = [(0usize, 1usize), (0, 2), (1, 2)];
    let mut out = Vec::new();
    for arc in arcs {
        let pos = orbiter_positions(orbit, arc)?;
        let wrows = whitened_rows(&pos, sig);
        let mut rows = Vec::new();
        for &ts in &sweep {
            let cov = covariance(&wrows, ts)?;
            let mut p = serde_json::Map::new();
            for &(a, b) in &pairs {
                let s = pair_sigmas(&cov, a, b);
                p.insert(
                    format!("{}_minus_{}", TECHNIQUES[b], TECHNIQUES[a]),
                    json!({
                        "translation_sigma_m": [s[0], s[1], s[2]],
                        "scale_sigma_m_at_surface": s[3],
                        "rotation_sigma_m_at_surface": [s[4], s[5], s[6]],
                    }),
                );
            }
            rows.push(json!({
                "local_tie_sigma_m": ts,
                "floor_translation_sigma_m": std::f64::consts::SQRT_2 * ts,
                "offsets": Value::Object(p),
            }));
        }
        out.push(json!({"arc_days": arc, "epochs": pos.len(), "sweep": rows}));
    }
    Ok(json!({
        "technique_sigma_m": {"gnss": sig[0], "vlbi": sig[1], "slr": sig[2]},
        "local_tie_sigma_m": tie,
        "arcs": out,
    }))
}

/// The geometry and the Rust information matrix of one arc, for the numpy oracle (T3).
pub fn export(orbit: &OrbitSpec, tech: &TechniqueSpec, arc_days: f64) -> Result<Value, String> {
    let sig = [
        tech.gnss_sigma_m.unwrap_or(10.0),
        tech.vlbi_sigma_m.unwrap_or(1.0),
        tech.slr_sigma_m.unwrap_or(0.1),
    ];
    let pos = orbiter_positions(orbit, arc_days)?;
    let info = information(&pos, sig);
    Ok(json!({"positions": pos, "sigma_m": sig, "r_moon_m": R_MOON_M, "information": info}))
}
