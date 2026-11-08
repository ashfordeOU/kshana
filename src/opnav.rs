// SPDX-License-Identifier: AGPL-3.0-only
//! Optical-navigation measurement model (C5a,
//! `docs/design/evidence/c5a-optical-navigation-model/PREREGISTRATION.md`; readings in `xval/c5a-opnav/README.md`).
//!
//! A spacecraft state, a target (a body centre from a DE440 kernel, or a catalogue star) and a camera give a
//! predicted pixel and its partial derivatives with respect to the spacecraft position and velocity:
//!
//! - **Bodies:** converged Newtonian light time, then stellar aberration from the spacecraft's barycentric velocity
//!   (the SPICE `CN+S` correction).
//! - **Stars:** a fixed ICRF direction with stellar aberration only.
//! - **Camera:** a pinhole with focal length in pixels, principal point and Brown-Conrady distortion (radial k1, k2,
//!   k3; tangential p1, p2) in the convention OpenCV documents for `projectPoints`, at a given attitude quaternion.
//!
//! Not modelled: image processing, the body's figure or phase, attitude estimation, any real camera's calibration.
//! MODELLED; advisory software, not certified navigation equipment.

use crate::ephem_provider::KernelEphemeris;
use crate::jd2::Jd2;

type Vec3 = [f64; 3];

/// Speed of light (m/s).
pub const C_M_S: f64 = 299_792_458.0;

/// A pinhole camera with Brown-Conrady distortion (OpenCV `projectPoints` convention: x right, y down, z along the
/// boresight).
#[derive(Clone, Copy, Debug, PartialEq)]
pub struct Camera {
    /// Focal length (px), the same on both axes.
    pub f_px: f64,
    /// Principal point (px).
    pub cx: f64,
    /// Principal point (px).
    pub cy: f64,
    /// Radial distortion.
    pub k1: f64,
    /// Radial distortion.
    pub k2: f64,
    /// Radial distortion.
    pub k3: f64,
    /// Tangential distortion.
    pub p1: f64,
    /// Tangential distortion.
    pub p2: f64,
}

/// What is imaged.
#[derive(Clone, Copy, Debug, PartialEq)]
pub enum Target {
    /// A body centre by NAIF id, read from the kernel.
    Body(i32),
    /// A catalogue star: a fixed ICRF unit vector (no proper motion or parallax).
    Star(Vec3),
}

/// A predicted measurement.
#[derive(Clone, Copy, Debug, PartialEq)]
pub struct Measurement {
    /// The apparent unit direction (ICRF).
    pub apparent: Vec3,
    /// The pixel `(u, v)`.
    pub pixel: [f64; 2],
    /// `∂(u, v)/∂(r, v)`: rows u and v; columns the position (px/m) then the velocity (px/(m/s)).
    pub partials: [[f64; 6]; 2],
}

/// The ICRF-to-camera rotation of a SPICE-convention quaternion `(c, s1, s2, s3)` (scalar first; SPICE `q2m`).
pub fn quaternion_to_matrix(q: [f64; 4]) -> [[f64; 3]; 3] {
    let n = (q[0] * q[0] + q[1] * q[1] + q[2] * q[2] + q[3] * q[3]).sqrt();
    let [c, s1, s2, s3] = [q[0] / n, q[1] / n, q[2] / n, q[3] / n];
    [
        [
            1.0 - 2.0 * (s2 * s2 + s3 * s3),
            2.0 * (s1 * s2 - c * s3),
            2.0 * (s1 * s3 + c * s2),
        ],
        [
            2.0 * (s1 * s2 + c * s3),
            1.0 - 2.0 * (s1 * s1 + s3 * s3),
            2.0 * (s2 * s3 - c * s1),
        ],
        [
            2.0 * (s1 * s3 - c * s2),
            2.0 * (s2 * s3 + c * s1),
            1.0 - 2.0 * (s1 * s1 + s2 * s2),
        ],
    ]
}

/// A value with six tangents: forward-mode derivatives through aberration and projection.
#[derive(Clone, Copy, Debug)]
struct D6 {
    v: f64,
    d: [f64; 6],
}

impl D6 {
    fn c(v: f64) -> Self {
        Self { v, d: [0.0; 6] }
    }
    fn add(self, o: Self) -> Self {
        Self {
            v: self.v + o.v,
            d: std::array::from_fn(|i| self.d[i] + o.d[i]),
        }
    }
    fn sub(self, o: Self) -> Self {
        Self {
            v: self.v - o.v,
            d: std::array::from_fn(|i| self.d[i] - o.d[i]),
        }
    }
    fn mul(self, o: Self) -> Self {
        Self {
            v: self.v * o.v,
            d: std::array::from_fn(|i| self.d[i] * o.v + self.v * o.d[i]),
        }
    }
    fn scale(self, k: f64) -> Self {
        Self {
            v: self.v * k,
            d: std::array::from_fn(|i| self.d[i] * k),
        }
    }
    fn div(self, o: Self) -> Self {
        let inv = 1.0 / o.v;
        Self {
            v: self.v * inv,
            d: std::array::from_fn(|i| (self.d[i] - self.v * inv * o.d[i]) * inv),
        }
    }
    fn sqrt(self) -> Self {
        let r = self.v.sqrt();
        Self {
            v: r,
            d: std::array::from_fn(|i| self.d[i] * 0.5 / r),
        }
    }
}

fn dot3(a: &[D6; 3], b: &[D6; 3]) -> D6 {
    a[0].mul(b[0]).add(a[1].mul(b[1])).add(a[2].mul(b[2]))
}

/// The apparent direction of geometric vector `rho` seen with `beta = v / c`, in SPICE's `stelab` form:
/// `û·√(1 − s²) + β − (û·β)·û`, `s = |û × β|`.
fn aberrate(rho: [D6; 3], beta: [D6; 3]) -> [D6; 3] {
    let n = dot3(&rho, &rho).sqrt();
    let u: [D6; 3] = std::array::from_fn(|i| rho[i].div(n));
    let ub = dot3(&u, &beta);
    let bb = dot3(&beta, &beta);
    // |û × β|² = |β|² − (û·β)² for a unit û.
    let s2 = bb.sub(ub.mul(ub));
    let k = D6::c(1.0).sub(s2).sqrt();
    std::array::from_fn(|i| u[i].mul(k).add(beta[i]).sub(ub.mul(u[i])))
}

fn project_d(cam: &Camera, r: &[[f64; 3]; 3], d: [D6; 3]) -> [D6; 2] {
    let p: [D6; 3] = std::array::from_fn(|i| {
        d[0].scale(r[i][0])
            .add(d[1].scale(r[i][1]))
            .add(d[2].scale(r[i][2]))
    });
    let x = p[0].div(p[2]);
    let y = p[1].div(p[2]);
    let (xx, yy, xy) = (x.mul(x), y.mul(y), x.mul(y));
    let r2 = xx.add(yy);
    let r4 = r2.mul(r2);
    let r6 = r4.mul(r2);
    let radial = D6::c(1.0)
        .add(r2.scale(cam.k1))
        .add(r4.scale(cam.k2))
        .add(r6.scale(cam.k3));
    let xd = x
        .mul(radial)
        .add(xy.scale(2.0 * cam.p1))
        .add(r2.add(xx.scale(2.0)).scale(cam.p2));
    let yd = y
        .mul(radial)
        .add(r2.add(yy.scale(2.0)).scale(cam.p1))
        .add(xy.scale(2.0 * cam.p2));
    [
        xd.scale(cam.f_px).add(D6::c(cam.cx)),
        yd.scale(cam.f_px).add(D6::c(cam.cy)),
    ]
}

/// The pixel of a unit direction `d` (ICRF) for a camera at attitude `q` (ICRF to camera, SPICE convention).
pub fn project(cam: &Camera, q: [f64; 4], d: Vec3) -> [f64; 2] {
    let px = project_d(cam, &quaternion_to_matrix(q), d.map(D6::c));
    [px[0].v, px[1].v]
}

/// The converged Newtonian light time (s) and the target's barycentric state at `jd_tdb − lt`, for an observer at
/// barycentric `r_o` (m). Iterates from `lt = 0` until the change is below 1e-12 s, at most 10 times.
///
/// # Errors
/// When the kernel does not cover the epoch or lacks the body.
pub fn light_time(
    kernel: &KernelEphemeris,
    naif: i32,
    jd_tdb: f64,
    r_o: Vec3,
) -> Result<(f64, Vec3, Vec3), String> {
    let mut lt = 0.0;
    for _ in 0..10 {
        let st = kernel.state(naif, 0, Jd2::new(jd_tdb).add_seconds(-lt))?;
        let d = [st[0][0] - r_o[0], st[0][1] - r_o[1], st[0][2] - r_o[2]];
        let new = (d[0] * d[0] + d[1] * d[1] + d[2] * d[2]).sqrt() / C_M_S;
        let done = (new - lt).abs() < 1e-12;
        lt = new;
        if done {
            break;
        }
    }
    let st = kernel.state(naif, 0, Jd2::new(jd_tdb).add_seconds(-lt))?;
    Ok((lt, st[0], st[1]))
}

/// The predicted measurement of `target` from a spacecraft at barycentric `r_o` (m), `v_o` (m/s), ICRF, at
/// `jd_tdb`, for camera `cam` at attitude `q`.
///
/// # Errors
/// When the kernel does not cover the epoch or lacks the body.
pub fn measure(
    kernel: &KernelEphemeris,
    target: Target,
    jd_tdb: f64,
    r_o: Vec3,
    v_o: Vec3,
    cam: &Camera,
    q: [f64; 4],
) -> Result<Measurement, String> {
    // Tangents 0..3: the observer position; 3..6: the observer velocity.
    let rho: [D6; 3] = match target {
        Target::Star(s) => s.map(D6::c),
        Target::Body(naif) => {
            let (_, r_t, v_t) = light_time(kernel, naif, jd_tdb, r_o)?;
            let g = [r_t[0] - r_o[0], r_t[1] - r_o[1], r_t[2] - r_o[2]];
            let gn = (g[0] * g[0] + g[1] * g[1] + g[2] * g[2]).sqrt();
            let u = [g[0] / gn, g[1] / gn, g[2] / gn];
            // ρ = r_t(t − |ρ|/c) − r_o, so ∂ρ/∂r_o = −(I + v_t ûᵀ/c)⁻¹ = −(I − v_t ûᵀ/(c + û·v_t)).
            let den = C_M_S + u[0] * v_t[0] + u[1] * v_t[1] + u[2] * v_t[2];
            std::array::from_fn(|i| {
                let mut x = D6::c(g[i]);
                for (j, uj) in u.iter().enumerate() {
                    let ij = if i == j { 1.0 } else { 0.0 };
                    x.d[j] = -(ij - v_t[i] * uj / den);
                }
                x
            })
        }
    };
    let beta: [D6; 3] = std::array::from_fn(|i| {
        let mut b = D6::c(v_o[i] / C_M_S);
        b.d[3 + i] = 1.0 / C_M_S;
        b
    });
    let app = aberrate(rho, beta);
    let px = project_d(cam, &quaternion_to_matrix(q), app);
    Ok(Measurement {
        apparent: [app[0].v, app[1].v, app[2].v],
        pixel: [px[0].v, px[1].v],
        partials: [px[0].d, px[1].d],
    })
}
