// SPDX-License-Identifier: AGPL-3.0-only
//! Study `frame-coestimation`: stations on the lunar surface and orbiters co-estimate the seven-
//! parameter datum of the lunar frame together with Earth-station laser ranging.
//!
//! Everything is expressed in the lunar body axes of the synchronous model (no libration): the
//! first axis points to the Earth, the third to the lunar north pole, selenographic longitude 0
//! faces the Earth and east is the negative rotating-frame y axis. Three techniques add
//! information about the datum `[t_x, t_y, t_z, scale, θ_x, θ_y, θ_z]` of `lunar_datum`:
//!
//! 1. Earth-station laser ranging to the five reflectors of `lunar_llr_geometry`;
//! 2. orbiter ranging to surface stations whenever the orbiter is above the station's horizon.
//!
//! The partial of a range `ρ = |p' − x|` (point `p'` on the Moon, observer `x`) is `û · J(p)` with
//! `û = (p − x) / |p − x|` and `J` the point Jacobian of the datum
//! ([`crate::lunar_datum::datum7_point_jacobian_body`]); the information matrices are assembled by
//! [`crate::lunar_identifiability::assemble_multi_info`] (columns 3 to 6 preconditioned by the
//! lunar radius, so the sigmas of scale and rotations read as metres at the surface).
//!
//! Stated simplifications: the orbit is treated as known in the lunar axes (the orbiter range
//! sigma carries its error), the Earth stations rotate about the lunar-axis-3 direction, and the
//! Earth direction is fixed in the lunar axes.

use rand::{Rng, SeedableRng};
use rand_chacha::ChaCha8Rng;
use serde::{Deserialize, Serialize};
use serde_json::{json, Value};

use super::orbit::{OrbitSpec, L_M, R_MOON_M};
use super::phase::SurfaceSpec;
use crate::cr3bp::EARTH_MOON_MU;
use crate::fim::crlb;
use crate::lunar_datum::datum7_point_jacobian_body;
use crate::lunar_identifiability::{assemble_multi_info, decompose};
use crate::lunar_llr_geometry::{reflectors, stations};
use crate::portable_math::PortableFloat;

/// Laser-ranging section (shared with `geodesy-sensitivity`).
#[derive(Clone, Debug, Default, Deserialize, Serialize)]
#[serde(deny_unknown_fields)]
pub struct LlrSpec {
    /// Range 1-sigma per observation, m (0.05).
    pub sigma_m: Option<f64>,
    /// Epochs over one synodic month (200).
    pub epochs: Option<usize>,
}

/// Mean Earth radius, m (spherical Earth for the station offsets).
pub const R_EARTH_M: f64 = 6_371_000.0;
/// Rotation rate of the Earth relative to the Earth-Moon direction, rad/s.
pub const OMEGA_REL: f64 = 7.292_115_9e-5 - 2.661_699_5e-6;
/// Synodic month, s.
pub const SYNODIC_S: f64 = 29.530_588_9 * 86_400.0;
const MIN_STATION_ELEVATION_DEG: f64 = 20.0;
const MIN_ORBITER_ELEVATION_DEG: f64 = 5.0;
const REL_TOL: f64 = 1e-10;

fn dot(a: [f64; 3], b: [f64; 3]) -> f64 {
    a[0] * b[0] + a[1] * b[1] + a[2] * b[2]
}
fn sub(a: [f64; 3], b: [f64; 3]) -> [f64; 3] {
    [a[0] - b[0], a[1] - b[1], a[2] - b[2]]
}
fn norm(a: [f64; 3]) -> f64 {
    dot(a, a).sqrt()
}

/// The seven datum partials of a range from `obs` to the lunar point `p` (both in lunar axes).
pub fn range_row(obs: [f64; 3], p: [f64; 3]) -> [f64; 7] {
    let d = sub(p, obs);
    let n = norm(d);
    let u = [d[0] / n, d[1] / n, d[2] / n];
    let j = datum7_point_jacobian_body(p);
    let mut row = [0.0; 7];
    for (c, r) in row.iter_mut().enumerate() {
        *r = u[0] * j[0][c] + u[1] * j[1][c] + u[2] * j[2][c];
    }
    row
}

/// Body-axes position of a surface point at selenographic `lat`, `lon` (degrees).
pub fn surface_point(lat_deg: f64, lon_deg: f64) -> [f64; 3] {
    let (la, lo) = (lat_deg.to_radians(), lon_deg.to_radians());
    [
        R_MOON_M * la.pcos() * lo.pcos(),
        R_MOON_M * la.pcos() * lo.psin(),
        R_MOON_M * la.psin(),
    ]
}

/// Earth-station laser-ranging rows (and their count) over one synodic month.
pub fn llr_rows(epochs: usize) -> Vec<[f64; 7]> {
    let refl = reflectors();
    let sta = stations();
    let sin_min = MIN_STATION_ELEVATION_DEG.to_radians().psin();
    let mut rows = Vec::new();
    for k in 0..epochs {
        let t = SYNODIC_S * (k as f64) / (epochs as f64);
        for s in &sta {
            let (phi, lam) = (s.lat_deg.to_radians(), s.lon_deg.to_radians());
            let alpha = lam + OMEGA_REL * t;
            // Earth-fixed x points to the Moon at alpha = 0, i.e. toward -x of the lunar axes.
            let off = [
                -R_EARTH_M * phi.pcos() * alpha.pcos(),
                R_EARTH_M * phi.pcos() * alpha.psin(),
                R_EARTH_M * phi.psin(),
            ];
            let x = [L_M + off[0], off[1], off[2]];
            let zen = [off[0] / R_EARTH_M, off[1] / R_EARTH_M, off[2] / R_EARTH_M];
            for r in &refl {
                let p = r.pa_body_m;
                let d = sub(p, x);
                let n = norm(d);
                let up_el = dot(zen, d) / n;
                // The reflector must see the station above its own horizon.
                let r_el = dot(
                    [p[0] / norm(p), p[1] / norm(p), p[2] / norm(p)],
                    [-d[0] / n, -d[1] / n, -d[2] / n],
                );
                if up_el >= sin_min && r_el > 0.0 {
                    rows.push(range_row(x, p));
                }
            }
        }
    }
    rows
}

/// Orbiter positions in the lunar axes along the reference orbit.
pub fn orbiter_positions(orbit: &OrbitSpec, arc_days: f64) -> Result<Vec<[f64; 3]>, String> {
    let ro = orbit.build(arc_days)?;
    Ok(ro
        .x
        .iter()
        .map(|s| {
            [
                -L_M * (s[0] - (1.0 - EARTH_MOON_MU)),
                -L_M * s[1],
                L_M * s[2],
            ]
        })
        .collect())
}

/// Orbiter-to-surface-station rows for the given station positions.
pub fn orbiter_rows(orbiter: &[[f64; 3]], stations: &[[f64; 2]]) -> Vec<[f64; 7]> {
    let sin_min = MIN_ORBITER_ELEVATION_DEG.to_radians().psin();
    let mut rows = Vec::new();
    for q in orbiter {
        for st in stations {
            let p = surface_point(st[0], st[1]);
            let d = sub(*q, p);
            let n = norm(d);
            let up = [p[0] / R_MOON_M, p[1] / R_MOON_M, p[2] / R_MOON_M];
            if dot(up, d) / n >= sin_min {
                rows.push(range_row(*q, p));
            }
        }
    }
    rows
}

/// What the information of a set of rows says.
pub struct Summary {
    /// Preconditioned 7x7 information matrix.
    pub info: Vec<Vec<f64>>,
    /// Smallest eigenvalue.
    pub lambda_min: f64,
    /// Trace of the pseudo-inverse.
    pub crlb_trace: f64,
}

/// Information of the LLR rows and, optionally, the orbiter rows.
pub fn summarise(llr: &[[f64; 7]], llr_sigma: f64, orb: &[[f64; 7]], orb_sigma: f64) -> Summary {
    let mut blocks = vec![(llr.to_vec(), llr_sigma)];
    if !orb.is_empty() {
        blocks.push((orb.to_vec(), orb_sigma));
    }
    let info = assemble_multi_info(&blocks);
    let c = crlb(&info, REL_TOL);
    let trace: f64 = (0..7).map(|i| c.pseudo_covariance[i][i]).sum();
    Summary {
        info,
        lambda_min: c.eigenvalues.first().copied().unwrap_or(0.0),
        crlb_trace: trace,
    }
}

fn side(llr: &[[f64; 7]], sigma: f64, orb: &[[f64; 7]], orb_sigma: f64) -> Value {
    let s = summarise(llr, sigma, orb, orb_sigma);
    let c = crlb(&s.info, REL_TOL);
    let dec = decompose(&s.info, REL_TOL);
    json!({
        "observations": llr.len() + orb.len(),
        "information": s.info,
        "eigenvalues": c.eigenvalues,
        "rank": c.rank,
        "defect": c.defect,
        "lambda_min": s.lambda_min,
        "crlb_trace": s.crlb_trace,
        "crlb_sigma": c.crlb_std,
        "origin_scale_correlation": dec.origin_scale_corr,
        "degeneracy_metric": dec.degeneracy_metric,
        "origin_crlb_m": dec.origin_crlb_m,
    })
}

/// Run the study.
pub fn run(
    orbit: &OrbitSpec,
    llr: &LlrSpec,
    surface: &SurfaceSpec,
    random_sets: usize,
    seed: u64,
) -> Result<Value, String> {
    let sigma = llr.sigma_m.unwrap_or(0.05);
    let epochs = llr.epochs.unwrap_or(200);
    let osigma = surface.orbiter_range_sigma_m.unwrap_or(1.0);
    if !(sigma > 0.0 && osigma > 0.0) || epochs == 0 {
        return Err(
            "llr.sigma_m, surface.orbiter_range_sigma_m and llr.epochs must be positive".into(),
        );
    }
    let sta = surface
        .stations
        .clone()
        .unwrap_or_else(|| vec![[-89.0, 0.0], [-45.0, 90.0], [0.0, 0.0], [30.0, -60.0]]);
    let arc = orbit.arc_days.unwrap_or(6.56);
    let pos = orbiter_positions(orbit, arc)?;
    let l_rows = llr_rows(epochs);
    let o_rows = orbiter_rows(&pos, &sta);
    let without = summarise(&l_rows, sigma, &[], osigma);
    let with = summarise(&l_rows, sigma, &o_rows, osigma);

    let mut rng = ChaCha8Rng::seed_from_u64(seed);
    let (mut trace_ok, mut lam_ok) = (0usize, 0usize);
    let mut ratios = Vec::new();
    for _ in 0..random_sets {
        let set: Vec<[f64; 2]> = (0..sta.len())
            .map(|_| {
                let s: f64 = rng.gen_range(-1.0..1.0);
                [s.pasin().to_degrees(), rng.gen_range(-180.0..180.0)]
            })
            .collect();
        let rows = orbiter_rows(&pos, &set);
        let a = summarise(&l_rows, sigma, &[], osigma);
        let b = summarise(&l_rows, sigma, &rows, osigma);
        trace_ok += usize::from(b.crlb_trace <= a.crlb_trace * (1.0 + 1e-12));
        lam_ok += usize::from(b.lambda_min >= a.lambda_min * (1.0 - 1e-12));
        ratios.push(b.lambda_min / a.lambda_min.max(f64::MIN_POSITIVE));
    }
    Ok(json!({
        "stations": sta,
        "orbiter_arc_days": arc,
        "llr_rows": l_rows.len(),
        "orbiter_rows": o_rows.len(),
        "parameters": ["t_x_m", "t_y_m", "t_z_m", "scale_m_at_surface", "theta_x_m_at_surface", "theta_y_m_at_surface", "theta_z_m_at_surface"],
        "without_orbiter_links": side(&l_rows, sigma, &[], osigma),
        "with_orbiter_links": side(&l_rows, sigma, &o_rows, osigma),
        "lambda_min_ratio": with.lambda_min / without.lambda_min.max(f64::MIN_POSITIVE),
        "crlb_trace_ratio": with.crlb_trace / without.crlb_trace.max(f64::MIN_POSITIVE),
        "random_station_sets": {
            "sets": random_sets,
            "trace_not_larger": trace_ok,
            "lambda_min_not_smaller": lam_ok,
            "median_lambda_min_ratio": median(&mut ratios),
        },
    }))
}

fn median(v: &mut [f64]) -> f64 {
    if v.is_empty() {
        return f64::NAN;
    }
    v.sort_by(|a, b| a.total_cmp(b));
    v[v.len() / 2]
}

/// Raw geometries and the Rust partials, for the independent numpy finite-difference oracle (F2):
/// `n` seeded random observer/point pairs.
pub fn export_partials(n: usize, seed: u64) -> Value {
    let mut rng = ChaCha8Rng::seed_from_u64(seed);
    let mut out = Vec::new();
    for _ in 0..n {
        let s: f64 = rng.gen_range(-1.0..1.0);
        let p = surface_point(s.pasin().to_degrees(), rng.gen_range(-180.0..180.0));
        // Observer 200 km to 400 000 km from the point, away from the surface.
        let dir = [
            rng.gen_range(-1.0..1.0),
            rng.gen_range(-1.0..1.0),
            rng.gen_range(-1.0..1.0),
        ];
        let mut u = [dir[0] / norm(dir), dir[1] / norm(dir), dir[2] / norm(dir)];
        if dot(u, p) < 0.0 {
            u = [-u[0], -u[1], -u[2]];
        }
        let r: f64 = 10f64.ppowf(rng.gen_range(5.3..8.6));
        let x = [p[0] + r * u[0], p[1] + r * u[1], p[2] + r * u[2]];
        out.push(json!({"observer": x, "point": p, "row": range_row(x, p).to_vec()}));
    }
    json!({ "cases": out })
}
