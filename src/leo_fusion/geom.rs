// SPDX-License-Identifier: AGPL-3.0-only
//! Geometry shared by the LEO fusion pack: satellite states in the Earth-centred Earth-fixed
//! (ECEF) frame, the local east-north-up (ENU) frame of a user, and a small dense
//! linear-algebra kit (no external crate, no threads, WebAssembly-safe).
//!
//! ## Orbits
//!
//! A satellite is a two-body Keplerian orbit whose node and argument of perigee drift at the
//! secular J2 rates (Vallado's expressions, the same as [`crate::constellation`]). The
//! element convention is the one of [`crate::constellation::Elements`]: the node is the
//! Earth-fixed longitude of the ascending node at `t = 0`, so the inertial frame coincides
//! with ECEF at the epoch. Velocity is the exact time derivative of the modelled position,
//! including the node and perigee drift and the Earth's rotation, so a Doppler computed from
//! it is consistent with the positions to machine precision.

use crate::constellation::{ConstellationCfg, Elements};
use std::f64::consts::PI;

/// A 3-vector (m or m/s).
pub type Vec3 = [f64; 3];

/// Degrees to radians.
pub const DEG: f64 = PI / 180.0;
/// Earth's gravitational parameter, WGS 84 (m^3/s^2).
pub const GM_EARTH: f64 = crate::forces::MU_EARTH;
/// Earth's equatorial radius, WGS 84 (m).
pub const RE_EARTH: f64 = crate::forces::RE_EARTH;
/// Earth's rotation rate, WGS 84 (rad/s).
pub const OMEGA_EARTH: f64 = crate::forces::EARTH_ROTATION_RATE;
/// Earth's second zonal harmonic J2 (unnormalised).
pub const J2_EARTH: f64 = 1.082_626_683_553_15e-3;

/// `a − b`.
pub fn sub(a: Vec3, b: Vec3) -> Vec3 {
    [a[0] - b[0], a[1] - b[1], a[2] - b[2]]
}
/// `a + b`.
pub fn add(a: Vec3, b: Vec3) -> Vec3 {
    [a[0] + b[0], a[1] + b[1], a[2] + b[2]]
}
/// `k·a`.
pub fn scale(a: Vec3, k: f64) -> Vec3 {
    [a[0] * k, a[1] * k, a[2] * k]
}
/// Dot product.
pub fn dot(a: Vec3, b: Vec3) -> f64 {
    a[0] * b[0] + a[1] * b[1] + a[2] * b[2]
}
/// Cross product.
pub fn cross(a: Vec3, b: Vec3) -> Vec3 {
    [
        a[1] * b[2] - a[2] * b[1],
        a[2] * b[0] - a[0] * b[2],
        a[0] * b[1] - a[1] * b[0],
    ]
}
/// Euclidean norm.
pub fn norm(a: Vec3) -> f64 {
    dot(a, a).sqrt()
}

/// A satellite orbit about the Earth with secular J2 drift.
#[derive(Clone, Copy, Debug, PartialEq)]
pub struct EarthOrbit {
    /// Semi-major axis (m).
    pub a: f64,
    /// Eccentricity.
    pub e: f64,
    /// Inclination (rad).
    pub inc: f64,
    /// Earth-fixed node longitude at the epoch (rad).
    pub raan0: f64,
    /// Argument of perigee at the epoch (rad).
    pub argp0: f64,
    /// Mean anomaly at the epoch (rad).
    pub m0: f64,
    /// Mean motion (rad/s).
    pub n: f64,
    /// Secular node rate from J2 (rad/s).
    pub raan_dot: f64,
    /// Secular perigee rate from J2 (rad/s).
    pub argp_dot: f64,
}

impl EarthOrbit {
    /// Orbit from classical elements, with (`j2 = true`) or without the secular J2 drift.
    pub fn from_elements(el: &Elements, j2: bool) -> Self {
        let n = (GM_EARTH / el.a_m.powi(3)).sqrt();
        let (mut raan_dot, mut argp_dot) = (0.0, 0.0);
        if j2 {
            let p = el.a_m * (1.0 - el.e * el.e);
            let f = n * J2_EARTH * (RE_EARTH / p).powi(2);
            let ci = el.i_rad.cos();
            raan_dot = -1.5 * f * ci;
            argp_dot = 0.75 * f * (5.0 * ci * ci - 1.0);
        }
        Self {
            a: el.a_m,
            e: el.e,
            inc: el.i_rad,
            raan0: el.raan_rad,
            argp0: el.argp_rad,
            m0: el.m0_rad,
            n,
            raan_dot,
            argp_dot,
        }
    }

    /// A circular orbit at `altitude_m` with the given inclination, node and argument of
    /// latitude at the epoch (all rad), without J2.
    pub fn circular(altitude_m: f64, inc: f64, raan0: f64, u0: f64) -> Self {
        Self::from_elements(
            &Elements {
                a_m: RE_EARTH + altitude_m,
                e: 0.0,
                i_rad: inc,
                raan_rad: raan0,
                argp_rad: 0.0,
                m0_rad: u0,
            },
            false,
        )
    }

    /// Orbital period (s).
    pub fn period_s(&self) -> f64 {
        2.0 * PI / self.n
    }

    /// Earth-fixed position (m) and velocity (m/s) at `t` seconds after the epoch.
    pub fn state(&self, t: f64) -> (Vec3, Vec3) {
        let m = self.m0 + self.n * t;
        let ea = kepler(m, self.e);
        let (se, ce) = ea.sin_cos();
        let e = self.e;
        let b = (1.0 - e * e).sqrt();
        // Perifocal position and velocity.
        let (xp, yp) = (self.a * (ce - e), self.a * b * se);
        let edot = self.n / (1.0 - e * ce);
        let (vxp, vyp) = (-self.a * se * edot, self.a * b * ce * edot);
        let argp = self.argp0 + self.argp_dot * t;
        let raan = self.raan0 + self.raan_dot * t;
        let (sw, cw) = argp.sin_cos();
        let (so, co) = raan.sin_cos();
        let (si, ci) = self.inc.sin_cos();
        // Columns of the perifocal-to-inertial rotation.
        let p = [cw * co - sw * so * ci, cw * so + sw * co * ci, sw * si];
        let q = [-sw * co - cw * so * ci, -sw * so + cw * co * ci, cw * si];
        let r_i = add(scale(p, xp), scale(q, yp));
        let v_kep = add(scale(p, vxp), scale(q, vyp));
        // Drift of the node (about the pole) and of the perigee (about the orbit normal).
        let h = [so * si, -co * si, ci];
        let v_i = add(
            v_kep,
            add(
                scale(cross([0.0, 0.0, 1.0], r_i), self.raan_dot),
                scale(cross(h, r_i), self.argp_dot),
            ),
        );
        // Inertial to Earth-fixed: rotate by −ω t and remove the frame rotation.
        let th = OMEGA_EARTH * t;
        let (st, ct) = th.sin_cos();
        let rot = |v: Vec3| [ct * v[0] + st * v[1], -st * v[0] + ct * v[1], v[2]];
        let v_rel = sub(v_i, scale(cross([0.0, 0.0, 1.0], r_i), OMEGA_EARTH));
        (rot(r_i), rot(v_rel))
    }
}

/// Kepler's equation `M = E − e sin E` solved by Newton iteration.
pub fn kepler(m: f64, e: f64) -> f64 {
    if e == 0.0 {
        return m;
    }
    let mut ea = if e < 0.8 { m } else { PI };
    for _ in 0..30 {
        let f = ea - e * ea.sin() - m;
        let d = f / (1.0 - e * ea.cos());
        ea -= d;
        if d.abs() < 1e-14 {
            break;
        }
    }
    ea
}

/// A user site on the WGS 84 ellipsoid.
#[derive(Clone, Copy, Debug, PartialEq)]
pub struct Site {
    /// Geodetic latitude (deg).
    pub lat_deg: f64,
    /// East longitude (deg).
    pub lon_deg: f64,
    /// Height above the ellipsoid (m).
    pub height_m: f64,
}

impl Site {
    /// ECEF position (m).
    pub fn ecef(&self) -> Vec3 {
        crate::frames::geodetic_to_ecef(crate::frames::Geodetic {
            lat_rad: self.lat_deg * DEG,
            lon_rad: self.lon_deg * DEG,
            alt_m: self.height_m,
        })
    }

    /// Unit east, north and up vectors of the local geodetic frame.
    pub fn enu(&self) -> (Vec3, Vec3, Vec3) {
        enu_at(self.lat_deg * DEG, self.lon_deg * DEG)
    }
}

/// Unit east, north and up vectors at geodetic latitude and longitude (rad).
pub fn enu_at(lat: f64, lon: f64) -> (Vec3, Vec3, Vec3) {
    let (sl, cl) = lat.sin_cos();
    let (so, co) = lon.sin_cos();
    (
        [-so, co, 0.0],
        [-sl * co, -sl * so, cl],
        [cl * co, cl * so, sl],
    )
}

/// Elevation (rad) of `sat` above the local horizon of `user` whose up vector is `up`.
pub fn elevation(user: Vec3, up: Vec3, sat: Vec3) -> f64 {
    let d = sub(sat, user);
    (dot(d, up) / norm(d)).clamp(-1.0, 1.0).asin()
}

/// Build the orbits of a constellation configuration around the Earth.
pub fn build_orbits(cfg: &ConstellationCfg, j2: bool) -> Result<Vec<EarthOrbit>, String> {
    let built = cfg.build(&crate::body::Body::earth())?;
    Ok(built
        .elements
        .iter()
        .map(|e| EarthOrbit::from_elements(e, j2))
        .collect())
}

/// A dense row-major matrix.
pub type Mat = Vec<Vec<f64>>;

/// An `n × n` zero matrix.
pub fn zeros(n: usize) -> Mat {
    vec![vec![0.0; n]; n]
}

/// Inverse of a square matrix by Gauss-Jordan elimination with partial pivoting; `None` when
/// a pivot falls below `1e-12` times the largest diagonal entry (singular or near-singular).
pub fn inverse(a: &Mat) -> Option<Mat> {
    let n = a.len();
    if n == 0 || a.iter().any(|r| r.len() != n) {
        return None;
    }
    let scale_ref = a
        .iter()
        .enumerate()
        .map(|(i, r)| r[i].abs())
        .fold(0.0_f64, f64::max)
        .max(f64::MIN_POSITIVE);
    let mut m: Mat = a.clone();
    let mut inv = zeros(n);
    for (i, row) in inv.iter_mut().enumerate() {
        row[i] = 1.0;
    }
    for col in 0..n {
        let piv = (col..n).max_by(|&x, &y| m[x][col].abs().total_cmp(&m[y][col].abs()))?;
        if m[piv][col].abs() < 1e-12 * scale_ref || !m[piv][col].is_finite() {
            return None;
        }
        m.swap(col, piv);
        inv.swap(col, piv);
        let d = m[col][col];
        for j in 0..n {
            m[col][j] /= d;
            inv[col][j] /= d;
        }
        for r in 0..n {
            if r != col {
                let f = m[r][col];
                if f != 0.0 {
                    for j in 0..n {
                        m[r][j] -= f * m[col][j];
                        inv[r][j] -= f * inv[col][j];
                    }
                }
            }
        }
    }
    Some(inv)
}

/// Weighted normal matrix `Hᵀ W H` and right-hand side `Hᵀ W r` for rows `h` with weights
/// `w` and residuals `r`.
pub fn normal_equations(h: &[Vec<f64>], w: &[f64], r: &[f64]) -> (Mat, Vec<f64>) {
    let n = h.first().map(|x| x.len()).unwrap_or(0);
    let mut a = zeros(n);
    let mut b = vec![0.0; n];
    for ((row, &wi), &ri) in h.iter().zip(w).zip(r) {
        for i in 0..n {
            let hi = row[i] * wi;
            if hi == 0.0 {
                continue;
            }
            b[i] += hi * ri;
            for j in 0..n {
                a[i][j] += hi * row[j];
            }
        }
    }
    (a, b)
}

/// `A x` for a square matrix.
pub fn mat_vec(a: &Mat, x: &[f64]) -> Vec<f64> {
    a.iter()
        .map(|r| r.iter().zip(x).map(|(p, q)| p * q).sum())
        .collect()
}

/// Median of a list (`None` when empty).
pub fn median(mut v: Vec<f64>) -> Option<f64> {
    if v.is_empty() {
        return None;
    }
    v.sort_by(|a, b| a.total_cmp(b));
    let n = v.len();
    Some(if n % 2 == 1 {
        v[n / 2]
    } else {
        0.5 * (v[n / 2 - 1] + v[n / 2])
    })
}

/// Root mean square (`None` when empty).
pub fn rms(v: &[f64]) -> Option<f64> {
    if v.is_empty() {
        return None;
    }
    Some((v.iter().map(|x| x * x).sum::<f64>() / v.len() as f64).sqrt())
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn velocity_is_the_time_derivative_of_the_position() {
        let el = Elements {
            a_m: RE_EARTH + 780e3,
            e: 0.01,
            i_rad: 86.4 * DEG,
            raan_rad: 0.3,
            argp_rad: 0.7,
            m0_rad: 1.1,
        };
        let o = EarthOrbit::from_elements(&el, true);
        for t in [0.0, 100.0, 2345.0] {
            let h = 1e-3;
            let (p1, _) = o.state(t - h);
            let (p2, _) = o.state(t + h);
            let (_, v) = o.state(t);
            let fd = scale(sub(p2, p1), 0.5 / h);
            assert!(norm(sub(fd, v)) < 1e-4, "t {t}: {:?} vs {:?}", fd, v);
        }
    }

    #[test]
    fn a_circular_orbit_keeps_its_radius_and_period() {
        let o = EarthOrbit::circular(550e3, 53.0 * DEG, 0.0, 0.0);
        let want = 2.0 * PI * ((RE_EARTH + 550e3).powi(3) / GM_EARTH).sqrt();
        assert!((o.period_s() - want).abs() < 1e-9 * want);
        for t in [0.0, 1000.0, 5000.0] {
            assert!((norm(o.state(t).0) - (RE_EARTH + 550e3)).abs() < 1e-6);
        }
    }

    #[test]
    #[allow(clippy::needless_range_loop)]
    fn inverse_times_matrix_is_identity() {
        let a = vec![
            vec![4.0, 1.0, 0.5],
            vec![1.0, 3.0, 0.2],
            vec![0.5, 0.2, 2.0],
        ];
        let inv = inverse(&a).unwrap();
        for i in 0..3 {
            for j in 0..3 {
                let s: f64 = (0..3).map(|k| a[i][k] * inv[k][j]).sum();
                assert!((s - if i == j { 1.0 } else { 0.0 }).abs() < 1e-12);
            }
        }
        assert!(inverse(&vec![vec![1.0, 2.0], vec![2.0, 4.0]]).is_none());
    }
}
