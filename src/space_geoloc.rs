// SPDX-License-Identifier: AGPL-3.0-only
//! **Space RF geolocation bounds** (roadmap row M1, `docs/design/evidence/m1-space-rf-geolocation/`).
//!
//! The location-error bound of a static surface emitter seen from low Earth orbit, by:
//!
//! * **S1**: one satellite's frequency of arrival over one pass, `f_k = f_0 (1 − Ṙ_k/c)`, with the
//!   emitter's carrier `f_0` a nuisance unknown;
//! * **F2 / F3**: a two- or three-satellite formation in one orbit plane, 50 km apart in track,
//!   with time and frequency differences against the lead satellite;
//! * **MP**: several passes fused, a separate carrier unknown per pass.
//!
//! Every bound carries the known-height constraint (the emitter on the WGS 84 ellipsoid): the
//! constrained Cramér-Rao bound `J⁻¹ − J⁻¹F(FᵀJ⁻¹F)⁻¹FᵀJ⁻¹`, computed in its null-space form
//! `U(UᵀJU)⁻¹Uᵀ` with `U` an orthonormal basis of the constraint's tangent space. The noise per
//! measurement follows the ambiguity-function accuracy relations from a free-space link budget.
//! The orbits are circular and sun-synchronous at 550 km with secular J2, in the frame and phase
//! of `xval/m1-geolocation/README.md`. MODELLED: no clock or orbit error, no multipath, no
//! ionosphere; isotropic emitters (an upper bound for directional radars).
//!
//! [`ccrlb_with_receiver_errors`] is the bound with receiver position and velocity errors as
//! Gaussian nuisance parameters (Cao et al., Chin. J. Aeronaut. 2015, Eqs. 7-10), used for the
//! published case of bar B2.

// Small dense matrices indexed in the notation of the formulas they implement.
#![allow(clippy::needless_range_loop)]

use crate::forces::{EARTH_ROTATION_RATE, J2, MU_EARTH, RE_EARTH};
use crate::frames::{WGS84_A, WGS84_F};
use crate::geolocation::{mat_inverse, Mat, Vec3};
use crate::portable_math::PortableFloat;
use std::f64::consts::PI;

/// Speed of light (m/s).
pub const C_M_PER_S: f64 = 299_792_458.0;
/// System noise temperature of the receiver (K).
pub const T_SYS_K: f64 = 500.0;
/// In-track spacing of neighbouring formation satellites (m).
pub const FORMATION_SPACING_M: f64 = 50_000.0;
/// Elevation mask at the emitter (deg).
pub const ELEVATION_MASK_DEG: f64 = 10.0;
/// Measurement interval (s).
pub const EPOCH_STEP_S: f64 = 10.0;
/// The registered window (s from 2025-01-01 00:00 UTC).
pub const WINDOW_S: f64 = 86_400.0;
/// Orbit altitude (m).
pub const ALTITUDE_M: f64 = 550_000.0;
const BOLTZMANN: f64 = 1.380_649e-23;

/// A circular sun-synchronous orbit with secular J2 drift, in the frame of the M1 readings
/// (inertial frame equal to the Earth-fixed frame at `t = 0`, node at longitude 0).
#[derive(Clone, Copy, Debug, PartialEq)]
pub struct SsoOrbit {
    /// Semi-major axis (m).
    pub a_m: f64,
    /// Inclination (rad), from the first-order J2 sun-synchronous condition.
    pub inc_rad: f64,
    /// Mean motion (rad/s).
    pub n: f64,
    /// Secular node rate (rad/s).
    pub raan_dot: f64,
    /// Secular argument-of-perigee rate (rad/s).
    pub argp_dot: f64,
}

impl SsoOrbit {
    /// The orbit at `altitude_m` above the WGS 84 equatorial radius.
    pub fn new(altitude_m: f64) -> Self {
        let a = RE_EARTH + altitude_m;
        let n = (MU_EARTH / a.ppowi(3)).sqrt();
        let omega_ss = 2.0 * PI / (365.2422 * 86_400.0);
        let f = n * J2 * (RE_EARTH / a).ppowi(2);
        let ci = -omega_ss / (1.5 * f);
        let inc = ci.pacos();
        Self {
            a_m: a,
            inc_rad: inc,
            n,
            raan_dot: -1.5 * f * ci,
            argp_dot: 0.75 * f * (5.0 * ci * ci - 1.0),
        }
    }

    /// Earth-fixed position (m) and velocity (m/s) at `t` (s) of the satellite whose argument
    /// of latitude at `t = 0` is `u0` (rad).
    pub fn state(&self, t: f64, u0: f64) -> (Vec3, Vec3) {
        let ud = self.n + self.argp_dot;
        let u = u0 + ud * t;
        let thd = self.raan_dot - EARTH_ROTATION_RATE;
        let th = thd * t;
        let (si, ci) = self.inc_rad.psin_cos();
        let (su, cu) = u.psin_cos();
        let ro = [self.a_m * cu, self.a_m * su * ci, self.a_m * su * si];
        let dro = [
            -self.a_m * ud * su,
            self.a_m * ud * cu * ci,
            self.a_m * ud * cu * si,
        ];
        let (s, c) = th.psin_cos();
        let pos = [c * ro[0] - s * ro[1], s * ro[0] + c * ro[1], ro[2]];
        let vel = [
            c * dro[0] - s * dro[1] + thd * (-s * ro[0] - c * ro[1]),
            s * dro[0] + c * dro[1] + thd * (c * ro[0] - s * ro[1]),
            dro[2],
        ];
        (pos, vel)
    }
}

/// A surface point: its Earth-fixed position and local east, north and up unit vectors.
#[derive(Clone, Copy, Debug, PartialEq)]
pub struct Site {
    /// Earth-fixed position (m), on the WGS 84 ellipsoid.
    pub p: Vec3,
    /// Local east.
    pub east: Vec3,
    /// Local north.
    pub north: Vec3,
    /// Local geodetic up.
    pub up: Vec3,
    /// Geodetic latitude (rad).
    pub lat_rad: f64,
    /// Longitude (rad).
    pub lon_rad: f64,
}

/// The site at geodetic latitude and longitude (rad), height 0.
pub fn site_rad(lat: f64, lon: f64) -> Site {
    let e2 = WGS84_F * (2.0 - WGS84_F);
    let (sl, cl) = lat.psin_cos();
    let (so, co) = lon.psin_cos();
    let n = WGS84_A / (1.0 - e2 * sl * sl).sqrt();
    Site {
        p: [n * cl * co, n * cl * so, n * (1.0 - e2) * sl],
        east: [-so, co, 0.0],
        north: [-sl * co, -sl * so, cl],
        up: [cl * co, cl * so, sl],
        lat_rad: lat,
        lon_rad: lon,
    }
}

/// The site at geodetic latitude and longitude (deg), height 0.
pub fn site(lat_deg: f64, lon_deg: f64) -> Site {
    site_rad(lat_deg.to_radians(), lon_deg.to_radians())
}

fn sub(a: Vec3, b: Vec3) -> Vec3 {
    [a[0] - b[0], a[1] - b[1], a[2] - b[2]]
}
fn dot(a: Vec3, b: Vec3) -> f64 {
    a[0] * b[0] + a[1] * b[1] + a[2] * b[2]
}
fn norm(a: Vec3) -> f64 {
    dot(a, a).sqrt()
}

/// The constraint gradient of the WGS 84 ellipsoid at `p`.
pub fn ellipsoid_gradient(p: Vec3) -> Vec3 {
    let b = WGS84_A * (1.0 - WGS84_F);
    [
        2.0 * p[0] / (WGS84_A * WGS84_A),
        2.0 * p[1] / (WGS84_A * WGS84_A),
        2.0 * p[2] / (b * b),
    ]
}

/// The geolocation method.
#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub enum Method {
    /// One satellite, frequency of arrival.
    S1,
    /// Two-satellite formation, time and frequency differences.
    F2,
    /// Three-satellite formation, time and frequency differences.
    F3,
}

impl Method {
    /// The arguments of latitude at `t = 0` of the satellites (lead first, each trailing the
    /// previous by the formation spacing).
    pub fn u0s(self, orbit: &SsoOrbit) -> Vec<f64> {
        let k = match self {
            Method::S1 => 1,
            Method::F2 => 2,
            Method::F3 => 3,
        };
        (0..k)
            .map(|i| -(i as f64) * FORMATION_SPACING_M / orbit.a_m)
            .collect()
    }

    /// Short label.
    pub fn as_str(self) -> &'static str {
        match self {
            Method::S1 => "S1",
            Method::F2 => "F2",
            Method::F3 => "F3",
        }
    }
}

/// One emitter class of the M1 table.
#[derive(Clone, Copy, Debug, PartialEq)]
pub struct EmitterClass {
    /// Label.
    pub name: &'static str,
    /// Carrier (Hz).
    pub f0_hz: f64,
    /// EIRP (dBm), isotropic toward the satellite.
    pub eirp_dbm: f64,
    /// Noise bandwidth (Hz).
    pub b_hz: f64,
    /// Integration time per measurement (s).
    pub t_s: f64,
}

/// The registered emitter classes (pre-registration table; EIRPs representative, the radars an
/// isotropic upper bound).
pub fn emitter_classes() -> Vec<EmitterClass> {
    let c = |name, f0_hz, eirp_dbm, b_hz, t_s| EmitterClass {
        name,
        f0_hz,
        eirp_dbm,
        b_hz,
        t_s,
    };
    vec![
        c("ais", 161.975e6, 41.0, 25e3, 26.7e-3),
        c("radar-s", 3.05e9, 70.0, 2e6, 10e-3),
        c("radar-x", 9.41e9, 67.0, 4e6, 10e-3),
        c("jammer10", 1575.42e6, 10.0, 2e6, 1.0),
        c("jammer30", 1575.42e6, 30.0, 2e6, 1.0),
        c("jammer40", 1575.42e6, 40.0, 2e6, 1.0),
        c("satphone", 1.62e9, 33.0, 30e3, 8.3e-3),
    ]
}

/// The class named `name`.
pub fn emitter_class(name: &str) -> Option<EmitterClass> {
    emitter_classes().into_iter().find(|c| c.name == name)
}

/// Linear SNR at slant range `r_m` (free-space link budget, 0 dBi receive, `T_SYS_K`).
pub fn snr(r_m: f64, cls: &EmitterClass) -> f64 {
    let fspl = 20.0 * (4.0 * PI * r_m * cls.f0_hz / C_M_PER_S).plog10();
    let db = (cls.eirp_dbm - 30.0) - fspl - 10.0 * (BOLTZMANN * T_SYS_K * cls.b_hz).plog10();
    10f64.ppowf(db / 10.0)
}

/// `(σ_τ (s), σ_f (Hz))` at effective SNR `gamma` (flat spectrum over `B`, uniform window over
/// `T`).
pub fn sigmas(gamma: f64, cls: &EmitterClass) -> (f64, f64) {
    let beta = 2.0 * PI * cls.b_hz / 12f64.sqrt();
    let tau = 2.0 * PI * cls.t_s / 12f64.sqrt();
    let btg = (cls.b_hz * cls.t_s * gamma).sqrt();
    (1.0 / (beta * btg), 1.0 / (tau * btg))
}

fn elevation(s: Vec3, st: &Site) -> f64 {
    let d = sub(s, st.p);
    (dot(d, st.up) / norm(d)).pasin()
}

/// The passes over `st` in the window: maximal runs of grid epochs with every satellite of
/// `method` at or above the mask; each epoch with the lead satellite's elevation (rad).
pub fn passes(orbit: &SsoOrbit, st: &Site, method: Method) -> Vec<Vec<(f64, f64)>> {
    let u0s = method.u0s(orbit);
    let mask = ELEVATION_MASK_DEG.to_radians();
    let (mut out, mut cur) = (Vec::new(), Vec::new());
    let n = (WINDOW_S / EPOCH_STEP_S) as usize;
    for k in 0..n {
        let t = k as f64 * EPOCH_STEP_S;
        let els: Vec<f64> = u0s
            .iter()
            .map(|&u0| elevation(orbit.state(t, u0).0, st))
            .collect();
        if els.iter().all(|&e| e >= mask) {
            cur.push((t, els[0]));
        } else if !cur.is_empty() {
            out.push(std::mem::take(&mut cur));
        }
    }
    if !cur.is_empty() {
        out.push(cur);
    }
    out
}

/// The pass with the highest maximum lead elevation (the first on a tie).
pub fn best_pass(ps: &[Vec<(f64, f64)>]) -> Option<&Vec<(f64, f64)>> {
    let peak = |p: &Vec<(f64, f64)>| p.iter().map(|x| x.1).fold(f64::NEG_INFINITY, f64::max);
    let mut best: Option<&Vec<(f64, f64)>> = None;
    for p in ps {
        if best.is_none_or(|b| peak(p) > peak(b)) {
            best = Some(p);
        }
    }
    best
}

/// Range, range rate and their gradients with respect to the emitter position.
fn geom(s: Vec3, v: Vec3, p: Vec3) -> (f64, f64, Vec3, Vec3) {
    let d = sub(s, p);
    let r = norm(d);
    let l = [d[0] / r, d[1] / r, d[2] / r];
    let rd = dot(v, d) / r;
    (
        r,
        rd,
        [-l[0], -l[1], -l[2]],
        [
            -(v[0] - rd * l[0]) / r,
            -(v[1] - rd * l[1]) / r,
            -(v[2] - rd * l[2]) / r,
        ],
    )
}

fn add_outer(j: &mut Mat, h: &[f64], w: f64) {
    for (a, &ha) in h.iter().enumerate() {
        for (b, &hb) in h.iter().enumerate() {
            j[a][b] += ha * hb * w;
        }
    }
}

/// The Fisher information of one pass (epochs `ts`) for `method` and `cls`: 4×4 over
/// `(x, y, z, f_0)` for S1, 3×3 over `(x, y, z)` for the formations.
pub fn fisher(orbit: &SsoOrbit, st: &Site, method: Method, cls: &EmitterClass, ts: &[f64]) -> Mat {
    let u0s = method.u0s(orbit);
    let f0 = cls.f0_hz;
    let nunk = if method == Method::S1 { 4 } else { 3 };
    let mut j = vec![vec![0.0; nunk]; nunk];
    for &t in ts {
        let g: Vec<(f64, f64, Vec3, Vec3)> = u0s
            .iter()
            .map(|&u0| {
                let (s, v) = orbit.state(t, u0);
                geom(s, v, st.p)
            })
            .collect();
        let gam: Vec<f64> = g.iter().map(|x| snr(x.0, cls)).collect();
        if method == Method::S1 {
            let (_, rd, _, drd) = g[0];
            let (_, sf) = sigmas(gam[0], cls);
            let k = -f0 / C_M_PER_S;
            let h = [k * drd[0], k * drd[1], k * drd[2], 1.0 - rd / C_M_PER_S];
            add_outer(&mut j, &h, 1.0 / (sf * sf));
        } else {
            let (_, _, dra, drda) = g[0];
            for i in 1..g.len() {
                let (_, _, dri, drdi) = g[i];
                let ge = gam[0] * gam[i] / (1.0 + gam[0] + gam[i]);
                let (stau, sf) = sigmas(ge, cls);
                let h1 = sub(dri, dra);
                let h2 = sub(drdi, drda);
                add_outer(&mut j, &h1, 1.0 / (C_M_PER_S * stau).ppowi(2));
                add_outer(&mut j, &h2, 1.0 / (C_M_PER_S * sf / f0).ppowi(2));
            }
        }
    }
    j
}

/// The constrained bound `U(UᵀJU)⁻¹Uᵀ` for Fisher matrix `j` (unknowns: position first, then
/// any nuisance parameters) under one constraint on the position with gradient `grad`; returns
/// the 3×3 position block, or `None` when the projected information is singular.
pub fn constrained_position_bound(j: &Mat, grad: Vec3) -> Option<[[f64; 3]; 3]> {
    let n = j.len();
    // Orthonormal basis of the tangent space: two vectors orthogonal to grad, then the
    // nuisance axes.
    let g = norm(grad);
    let gn = [grad[0] / g, grad[1] / g, grad[2] / g];
    let pick = if gn[0].abs() < 0.9 {
        [1.0, 0.0, 0.0]
    } else {
        [0.0, 1.0, 0.0]
    };
    let d = dot(pick, gn);
    let mut t1 = [
        pick[0] - d * gn[0],
        pick[1] - d * gn[1],
        pick[2] - d * gn[2],
    ];
    let n1 = norm(t1);
    t1 = [t1[0] / n1, t1[1] / n1, t1[2] / n1];
    let t2 = [
        gn[1] * t1[2] - gn[2] * t1[1],
        gn[2] * t1[0] - gn[0] * t1[2],
        gn[0] * t1[1] - gn[1] * t1[0],
    ];
    let m = n - 1;
    let mut u = vec![vec![0.0; m]; n];
    for k in 0..3 {
        u[k][0] = t1[k];
        u[k][1] = t2[k];
    }
    for k in 3..n {
        u[k][k - 1] = 1.0;
    }
    let mut uju = vec![vec![0.0; m]; m];
    for a in 0..m {
        for b in 0..m {
            let mut s = 0.0;
            for p in 0..n {
                for q in 0..n {
                    s += u[p][a] * j[p][q] * u[q][b];
                }
            }
            uju[a][b] = s;
        }
    }
    let inv = sym_inverse(&uju)?;
    let mut c = [[0.0; 3]; 3];
    for p in 0..3 {
        for q in 0..3 {
            let mut s = 0.0;
            for a in 0..m {
                for b in 0..m {
                    s += u[p][a] * inv[a][b] * u[q][b];
                }
            }
            c[p][q] = s;
        }
    }
    Some(c)
}

/// Inverse of a symmetric positive-definite matrix with diagonal equilibration first, so that
/// unknowns of very different scales (metres and hertz) do not trip the pivot test.
fn sym_inverse(m: &Mat) -> Option<Mat> {
    let n = m.len();
    let s: Vec<f64> = (0..n)
        .map(|i| {
            if m[i][i] > 0.0 {
                1.0 / m[i][i].sqrt()
            } else {
                1.0
            }
        })
        .collect();
    let scaled: Mat = (0..n)
        .map(|i| (0..n).map(|k| m[i][k] * s[i] * s[k]).collect())
        .collect();
    let inv = mat_inverse(&scaled)?;
    Some(
        (0..n)
            .map(|i| (0..n).map(|k| inv[i][k] * s[i] * s[k]).collect())
            .collect(),
    )
}

/// The horizontal error ellipse of a 3×3 position bound at `st`.
#[derive(Clone, Copy, Debug, PartialEq, serde::Serialize)]
pub struct Ellipse {
    /// 1σ semi-major axis (m).
    pub a_m: f64,
    /// 1σ semi-minor axis (m).
    pub b_m: f64,
    /// Distance RMS, `√trace` of the east-north block (m).
    pub drms_m: f64,
    /// Orientation of the major axis from north towards east (rad, in `[0, π)`).
    pub orient_rad: f64,
}

/// The east-north ellipse of position bound `c` at `st`.
pub fn ellipse(c: &[[f64; 3]; 3], st: &Site) -> Ellipse {
    let q = |u: Vec3, v: Vec3| {
        let mut s = 0.0;
        for p in 0..3 {
            for k in 0..3 {
                s += u[p] * c[p][k] * v[k];
            }
        }
        s
    };
    let (ee, nn, en) = (
        q(st.east, st.east),
        q(st.north, st.north),
        q(st.east, st.north),
    );
    let tr = ee + nn;
    let disc = ((ee - nn) * (ee - nn) + 4.0 * en * en).sqrt();
    let (l1, l2) = (0.5 * (tr + disc), (0.5 * (tr - disc)).max(0.0));
    // Major-axis angle from east, then from north towards east.
    let phi = 0.5 * (2.0 * en).patan2(ee - nn);
    let ori = (0.5 * PI - phi).rem_euclid(PI);
    Ellipse {
        a_m: l1.sqrt(),
        b_m: l2.sqrt(),
        drms_m: tr.sqrt(),
        orient_rad: ori,
    }
}

/// The one-pass bound ellipse at `st` for `method` and `cls` (the best pass), with the pass
/// start and epoch count; `None` with no pass in the window.
pub fn one_pass(
    orbit: &SsoOrbit,
    st: &Site,
    method: Method,
    cls: &EmitterClass,
) -> Option<(Ellipse, f64, usize)> {
    let ps = passes(orbit, st, method);
    let best = best_pass(&ps)?;
    let ts: Vec<f64> = best.iter().map(|x| x.0).collect();
    let j = fisher(orbit, st, method, cls, &ts);
    let c = constrained_position_bound(&j, ellipsoid_gradient(st.p))?;
    Some((ellipse(&c, st), ts[0], ts.len()))
}

/// Multi-pass fusion (MP): the joint Fisher information of the first `m` passes, position
/// first and (for S1) one carrier unknown per pass after it; and, beside it, the sum of the
/// passes' position-information matrices with each pass's carrier eliminated (its Schur
/// complement). The two position blocks are equal in exact arithmetic (bar B4).
pub fn fused_fisher(
    orbit: &SsoOrbit,
    st: &Site,
    method: Method,
    cls: &EmitterClass,
    ps: &[Vec<(f64, f64)>],
    m: usize,
) -> (Mat, [[f64; 3]; 3]) {
    let s1 = method == Method::S1;
    let nunk = if s1 { 3 + m } else { 3 };
    let mut joint = vec![vec![0.0; nunk]; nunk];
    let mut summed = [[0.0; 3]; 3];
    for (k, p) in ps.iter().take(m).enumerate() {
        let ts: Vec<f64> = p.iter().map(|x| x.0).collect();
        let j = fisher(orbit, st, method, cls, &ts);
        for a in 0..3 {
            for b in 0..3 {
                joint[a][b] += j[a][b];
            }
        }
        if s1 {
            for a in 0..3 {
                joint[a][3 + k] += j[a][3];
                joint[3 + k][a] += j[3][a];
            }
            joint[3 + k][3 + k] += j[3][3];
            for a in 0..3 {
                for b in 0..3 {
                    summed[a][b] += j[a][b] - j[a][3] * j[3][b] / j[3][3];
                }
            }
        } else {
            for a in 0..3 {
                for b in 0..3 {
                    summed[a][b] += j[a][b];
                }
            }
        }
    }
    (joint, summed)
}

/// The constrained bound of a static emitter at `u` from time and frequency differences
/// against receiver 1, with the receivers' positions `s` and velocities `v` themselves
/// uncertain (Gaussian, covariance `q_beta` over `[s_1..s_M, v_1..v_M]`): Cao et al. 2015,
/// Eqs. (7)-(10), `J = X − Y Z⁻¹ Yᵀ` with `X = HuᵀQm⁻¹Hu`, `Y = HuᵀQm⁻¹Hβ`,
/// `Z = Qβ⁻¹ + HβᵀQm⁻¹Hβ`. Measurements are range differences then range-rate differences
/// (`M − 1` each) with covariance `q_m`; `grad` is the constraint gradient at `u`. Returns the
/// 3×3 position bound.
pub fn ccrlb_with_receiver_errors(
    s: &[Vec3],
    v: &[Vec3],
    u: Vec3,
    q_m: &Mat,
    q_beta: &Mat,
    grad: Vec3,
) -> Option<[[f64; 3]; 3]> {
    let m = s.len();
    let nm = 2 * (m - 1);
    let nb = 6 * m;
    let mut hu = vec![vec![0.0; 3]; nm];
    let mut hb = vec![vec![0.0; nb]; nm];
    let st: Vec<(f64, f64, Vec3, Vec3, Vec3)> = (0..m)
        .map(|i| {
            let d = sub(u, s[i]);
            let r = norm(d);
            let rd = -dot(v[i], d) / r;
            let dr_du = [d[0] / r, d[1] / r, d[2] / r];
            let drd_du = [
                -v[i][0] / r - rd * d[0] / (r * r),
                -v[i][1] / r - rd * d[1] / (r * r),
                -v[i][2] / r - rd * d[2] / (r * r),
            ];
            (r, rd, dr_du, drd_du, d)
        })
        .collect();
    for i in 1..m {
        for k in 0..3 {
            hu[i - 1][k] = st[i].2[k] - st[0].2[k];
            hu[m - 1 + i - 1][k] = st[i].3[k] - st[0].3[k];
        }
        for (idx, sign) in [(i, 1.0), (0, -1.0)] {
            let (r, rd, dr_du, _, d) = st[idx];
            for k in 0..3 {
                // ∂r/∂s = −∂r/∂u; ∂ṙ/∂s = v/r + ṙ d/r²; ∂ṙ/∂v = −d/r.
                hb[i - 1][3 * idx + k] += sign * -dr_du[k];
                hb[m - 1 + i - 1][3 * idx + k] += sign * (v[idx][k] / r + rd * d[k] / (r * r));
                hb[m - 1 + i - 1][3 * m + 3 * idx + k] += sign * (-d[k] / r);
            }
        }
    }
    let qmi = mat_inverse(q_m)?;
    let qbi = mat_inverse(q_beta)?;
    let atb = |a: &Mat, w: &Mat, b: &Mat| -> Mat {
        let (ra, rb) = (a[0].len(), b[0].len());
        let mut out = vec![vec![0.0; rb]; ra];
        for p in 0..ra {
            for q in 0..rb {
                let mut acc = 0.0;
                for x in 0..nm {
                    for y in 0..nm {
                        acc += a[x][p] * w[x][y] * b[y][q];
                    }
                }
                out[p][q] = acc;
            }
        }
        out
    };
    let x = atb(&hu, &qmi, &hu);
    let y = atb(&hu, &qmi, &hb);
    let mut z = atb(&hb, &qmi, &hb);
    for p in 0..nb {
        for q in 0..nb {
            z[p][q] += qbi[p][q];
        }
    }
    let zi = sym_inverse(&z)?;
    let mut j = x;
    for p in 0..3 {
        for q in 0..3 {
            let mut acc = 0.0;
            for a in 0..nb {
                for b in 0..nb {
                    acc += y[p][a] * zi[a][b] * y[q][b];
                }
            }
            j[p][q] -= acc;
        }
    }
    constrained_position_bound(&j, grad)
}

/// F3 time and frequency differences at the epochs `ts` for an emitter at `p`: per epoch, the
/// range differences of B and C against A, then their range-rate differences.
pub fn f3_measurements(orbit: &SsoOrbit, ts: &[f64], p: Vec3) -> Vec<f64> {
    let u0s = Method::F3.u0s(orbit);
    let mut out = Vec::with_capacity(ts.len() * 4);
    for &t in ts {
        let g: Vec<(f64, f64, Vec3, Vec3)> = u0s
            .iter()
            .map(|&u0| {
                let (s, v) = orbit.state(t, u0);
                geom(s, v, p)
            })
            .collect();
        out.push(g[1].0 - g[0].0);
        out.push(g[2].0 - g[0].0);
        out.push(g[1].1 - g[0].1);
        out.push(g[2].1 - g[0].1);
    }
    out
}

/// The 1σ of each F3 measurement of [`f3_measurements`] at the true emitter `p` (m and m/s).
pub fn f3_sigmas(orbit: &SsoOrbit, ts: &[f64], p: Vec3, cls: &EmitterClass) -> Vec<f64> {
    let u0s = Method::F3.u0s(orbit);
    let mut out = Vec::with_capacity(ts.len() * 4);
    for &t in ts {
        let gam: Vec<f64> = u0s
            .iter()
            .map(|&u0| snr(norm(sub(orbit.state(t, u0).0, p)), cls))
            .collect();
        let pair = |i: usize| sigmas(gam[0] * gam[i] / (1.0 + gam[0] + gam[i]), cls);
        let (s1, s2) = (pair(1), pair(2));
        out.push(C_M_PER_S * s1.0);
        out.push(C_M_PER_S * s2.0);
        out.push(C_M_PER_S * s1.1 / cls.f0_hz);
        out.push(C_M_PER_S * s2.1 / cls.f0_hz);
    }
    out
}

/// Weighted Gauss-Newton on geodetic latitude and longitude at height 0 for F3 measurements
/// `z` with 1σ `sig`, from `start`: the fix and whether it converged (a step under 1 mm within
/// 50 iterations).
pub fn solve_f3(
    orbit: &SsoOrbit,
    ts: &[f64],
    z: &[f64],
    sig: &[f64],
    start: (f64, f64),
) -> ((f64, f64), bool) {
    let (mut lat, mut lon) = start;
    let e2 = WGS84_F * (2.0 - WGS84_F);
    for _ in 0..50 {
        let st = site_rad(lat, lon);
        let pred = f3_measurements(orbit, ts, st.p);
        // ∂p/∂lat and ∂p/∂lon at height 0.
        let (sl, cl) = lat.psin_cos();
        let (so, co) = lon.psin_cos();
        let w = (1.0 - e2 * sl * sl).sqrt();
        let n = WGS84_A / w;
        let m_rad = WGS84_A * (1.0 - e2) / (w * w * w);
        let dp_dlat = [-m_rad * sl * co, -m_rad * sl * so, m_rad * cl];
        let dp_dlon = [-n * cl * so, n * cl * co, 0.0];
        // Jacobian of the measurements by central differences of 1 m on the surface.
        let h = 1.0;
        let jac: Vec<[f64; 2]> = {
            let mut cols = [Vec::new(), Vec::new()];
            for (c, dp) in [dp_dlat, dp_dlon].iter().enumerate() {
                let len = norm(*dp);
                let step = [dp[0] / len * h, dp[1] / len * h, dp[2] / len * h];
                let plus = f3_measurements(
                    orbit,
                    ts,
                    [st.p[0] + step[0], st.p[1] + step[1], st.p[2] + step[2]],
                );
                let minus = f3_measurements(
                    orbit,
                    ts,
                    [st.p[0] - step[0], st.p[1] - step[1], st.p[2] - step[2]],
                );
                cols[c] = plus
                    .iter()
                    .zip(&minus)
                    .map(|(a, b)| (a - b) / (2.0 * h) * len)
                    .collect();
            }
            cols[0]
                .iter()
                .zip(&cols[1])
                .map(|(&a, &b)| [a, b])
                .collect()
        };
        let (mut a11, mut a12, mut a22, mut g1, mut g2) = (0.0, 0.0, 0.0, 0.0, 0.0);
        for (k, row) in jac.iter().enumerate() {
            let w = 1.0 / (sig[k] * sig[k]);
            let r = z[k] - pred[k];
            a11 += w * row[0] * row[0];
            a12 += w * row[0] * row[1];
            a22 += w * row[1] * row[1];
            g1 += w * row[0] * r;
            g2 += w * row[1] * r;
        }
        let det = a11 * a22 - a12 * a12;
        if det.abs() < f64::MIN_POSITIVE {
            return ((lat, lon), false);
        }
        let dlat = (a22 * g1 - a12 * g2) / det;
        let dlon = (a11 * g2 - a12 * g1) / det;
        lat += dlat;
        lon += dlon;
        let moved = norm([
            dp_dlat[0] * dlat + dp_dlon[0] * dlon,
            dp_dlat[1] * dlat + dp_dlon[1] * dlon,
            dp_dlat[2] * dlat + dp_dlon[2] * dlon,
        ]);
        if moved < 1e-3 {
            return ((lat, lon), true);
        }
    }
    ((lat, lon), false)
}

/// The east-north distance (m) of `(lat, lon)` (rad, height 0) from the site `truth`.
pub fn horizontal_error_m(truth: &Site, lat: f64, lon: f64) -> f64 {
    let d = sub(site_rad(lat, lon).p, truth.p);
    let (e, n) = (dot(d, truth.east), dot(d, truth.north));
    (e * e + n * n).sqrt()
}

/// The ten registered Baltic sea points (deg).
pub const POINTS: [(f64, f64); 10] = [
    (54.60, 14.00),
    (55.50, 15.80),
    (55.00, 19.00),
    (57.00, 19.50),
    (56.50, 20.20),
    (58.50, 20.50),
    (59.80, 24.50),
    (61.50, 19.80),
    (64.00, 22.00),
    (57.70, 23.30),
];

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn the_orbit_is_sun_synchronous_at_550_km() {
        let o = SsoOrbit::new(ALTITUDE_M);
        let deg = o.inc_rad.to_degrees();
        assert!((deg - 97.59).abs() < 0.005, "{deg}");
        let node_rate_deg_per_day = o.raan_dot.to_degrees() * 86_400.0;
        assert!((node_rate_deg_per_day - 360.0 / 365.2422).abs() < 1e-9);
    }

    #[test]
    fn the_velocity_is_the_derivative_of_the_position() {
        let o = SsoOrbit::new(ALTITUDE_M);
        let (t, h) = (1234.5, 1e-3);
        let (_, v) = o.state(t, 0.3);
        let (p1, _) = o.state(t + h, 0.3);
        let (p0, _) = o.state(t - h, 0.3);
        for k in 0..3 {
            assert!(((p1[k] - p0[k]) / (2.0 * h) - v[k]).abs() < 1e-4);
        }
    }

    #[test]
    fn the_constrained_bound_has_no_component_along_the_gradient() {
        let st = site(57.0, 19.5);
        let j = vec![
            vec![4.0, 1.0, 0.5],
            vec![1.0, 3.0, 0.2],
            vec![0.5, 0.2, 2.0],
        ];
        let g = ellipsoid_gradient(st.p);
        let c = constrained_position_bound(&j, g).unwrap();
        for row in c {
            let s: f64 = (0..3).map(|k| row[k] * g[k]).sum();
            assert!(s.abs() < 1e-12 * norm(g));
        }
    }
}
