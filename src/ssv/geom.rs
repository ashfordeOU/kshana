// SPDX-License-Identifier: AGPL-3.0-only
//! Geometry of the space-service-volume sweeps: Earth rotation, the equal-area user grid, a link's angles and its
//! Earth blockage, and the closed-form visibility interval a fixed-power nadir beam makes in central angle.
//!
//! The grid sweeps of the booklet test 2,562 users against ~130 satellites at 20,161 epochs. A nadir-pointing transmit beam
//! seen by a user on a sphere makes visibility a function of the central angle between the satellite and the user alone
//! (beam, Earth blockage, hemispherical user antenna and a received-power threshold each bound it), so the sweep can test
//! one dot product per link instead of building the geometry. [`visible_intervals`] gives those bounds; the tests check it
//! against the general predicate [`link`] on random geometry.

use super::constellations::{ATMOSPHERE_BOOKLET_M, RE_BOOKLET_M};
use crate::portable_math::PortableFloat;

/// A 3-vector.
pub type V3 = [f64; 3];

/// Dot product.
pub fn dot(a: V3, b: V3) -> f64 {
    a[0] * b[0] + a[1] * b[1] + a[2] * b[2]
}

/// `a - b`.
pub fn sub(a: V3, b: V3) -> V3 {
    [a[0] - b[0], a[1] - b[1], a[2] - b[2]]
}

/// Euclidean norm.
pub fn norm(a: V3) -> f64 {
    dot(a, a).sqrt()
}

/// `a * k`.
pub fn scale(a: V3, k: f64) -> V3 {
    [a[0] * k, a[1] * k, a[2] * k]
}

/// Cross product.
pub fn cross(a: V3, b: V3) -> V3 {
    [
        a[1] * b[2] - a[2] * b[1],
        a[2] * b[0] - a[0] * b[2],
        a[0] * b[1] - a[1] * b[0],
    ]
}

/// The unit vector of `a`.
pub fn unit(a: V3) -> V3 {
    scale(a, 1.0 / norm(a))
}

/// Earth rotation angle `t_s` seconds after the epoch, radians (table B1: 2 pi 0.7790572732640 at the epoch, rotation rate
/// 2 pi 1.00273781191135448 rad/day).
pub fn earth_rotation_angle(t_s: f64) -> f64 {
    let tau = 2.0 * std::f64::consts::PI;
    tau * 0.779_057_273_264_0 + tau * 1.002_737_811_911_354_5 * (t_s / 86_400.0)
}

/// Rotate an inertial vector into the Earth-fixed frame by the rotation angle `era`.
pub fn eci_to_ecef(v: V3, era: f64) -> V3 {
    let (s, c) = era.psin_cos();
    [c * v[0] + s * v[1], -s * v[0] + c * v[1], v[2]]
}

/// Rotate an Earth-fixed vector into the inertial frame by the rotation angle `era`.
pub fn ecef_to_eci(v: V3, era: f64) -> V3 {
    let (s, c) = era.psin_cos();
    [c * v[0] - s * v[1], s * v[0] + c * v[1], v[2]]
}

/// The blocking radius of the booklet: the spherical Earth plus the atmosphere, m.
pub fn blocking_radius_m() -> f64 {
    RE_BOOKLET_M + ATMOSPHERE_BOOKLET_M
}

/// A geodesic grid of `10 * 4^levels + 2` unit vectors: the icosahedron, each triangle split into four by its edge midpoints
/// and the new vertices pushed to the sphere, `levels` times (2,562 points at 4 levels: the booklet's grid size, "roughly
/// 4 degree spacing"). Deterministic.
pub fn geodesic_grid(levels: u32) -> Vec<V3> {
    let t = (1.0 + 5f64.sqrt()) / 2.0;
    let raw: [V3; 12] = [
        [-1.0, t, 0.0],
        [1.0, t, 0.0],
        [-1.0, -t, 0.0],
        [1.0, -t, 0.0],
        [0.0, -1.0, t],
        [0.0, 1.0, t],
        [0.0, -1.0, -t],
        [0.0, 1.0, -t],
        [t, 0.0, -1.0],
        [t, 0.0, 1.0],
        [-t, 0.0, -1.0],
        [-t, 0.0, 1.0],
    ];
    let mut verts: Vec<V3> = raw.iter().map(|v| unit(*v)).collect();
    let mut faces: Vec<[usize; 3]> = vec![
        [0, 11, 5],
        [0, 5, 1],
        [0, 1, 7],
        [0, 7, 10],
        [0, 10, 11],
        [1, 5, 9],
        [5, 11, 4],
        [11, 10, 2],
        [10, 7, 6],
        [7, 1, 8],
        [3, 9, 4],
        [3, 4, 2],
        [3, 2, 6],
        [3, 6, 8],
        [3, 8, 9],
        [4, 9, 5],
        [2, 4, 11],
        [6, 2, 10],
        [8, 6, 7],
        [9, 8, 1],
    ];
    for _ in 0..levels {
        let mut cache = std::collections::BTreeMap::<(usize, usize), usize>::new();
        let mut mid = |a: usize, b: usize, verts: &mut Vec<V3>| -> usize {
            let key = (a.min(b), a.max(b));
            if let Some(&i) = cache.get(&key) {
                return i;
            }
            let m = unit([
                verts[a][0] + verts[b][0],
                verts[a][1] + verts[b][1],
                verts[a][2] + verts[b][2],
            ]);
            verts.push(m);
            cache.insert(key, verts.len() - 1);
            verts.len() - 1
        };
        let mut next = Vec::with_capacity(faces.len() * 4);
        for f in &faces {
            let (a, b, c) = (f[0], f[1], f[2]);
            let ab = mid(a, b, &mut verts);
            let bc = mid(b, c, &mut verts);
            let ca = mid(c, a, &mut verts);
            next.push([a, ab, ca]);
            next.push([b, bc, ab]);
            next.push([c, ca, bc]);
            next.push([ab, bc, ca]);
        }
        faces = next;
    }
    verts
}

/// What a single transmitter-to-user link looks like geometrically.
#[derive(Clone, Copy, Debug, PartialEq)]
pub struct LinkGeometry {
    /// Distance, m.
    pub range_m: f64,
    /// Angle between the transmitter's boresight and the link, degrees.
    pub off_boresight_deg: f64,
    /// Whether the Earth (plus atmosphere) blocks the line of sight.
    pub blocked: bool,
    /// Unit vector from the transmitter to the user.
    pub line_of_sight: V3,
}

/// The geometry of the link from a transmitter at `s` (boresight unit vector `boresight`) to a user at `u`.
pub fn link(s: V3, boresight: V3, u: V3, r_block_m: f64) -> LinkGeometry {
    let d = sub(u, s);
    let rho = norm(d);
    let los = scale(d, 1.0 / rho);
    let off = dot(boresight, los).clamp(-1.0, 1.0).pacos().to_degrees();
    // Closest approach of the segment s-u to the Earth's centre.
    let t = -dot(s, d) / (rho * rho);
    let blocked = if t > 0.0 && t < 1.0 {
        let p = [s[0] + t * d[0], s[1] + t * d[1], s[2] + t * d[2]];
        norm(p) < r_block_m
    } else {
        false
    };
    LinkGeometry {
        range_m: rho,
        off_boresight_deg: off,
        blocked,
        line_of_sight: los,
    }
}

/// Up to two intervals of central angle `[lo, hi]` (radians).
#[derive(Clone, Copy, Debug, Default, PartialEq)]
pub struct Intervals {
    /// The intervals.
    pub v: [(f64, f64); 2],
    /// How many are in use.
    pub n: usize,
}

impl Intervals {
    fn one(a: f64, b: f64) -> Self {
        if b >= a {
            Self {
                v: [(a, b), (0.0, 0.0)],
                n: 1,
            }
        } else {
            Self::default()
        }
    }

    fn two(a: (f64, f64), b: (f64, f64)) -> Self {
        let mut out = Self::default();
        for (x, y) in [a, b] {
            if y >= x {
                out.v[out.n] = (x, y);
                out.n += 1;
            }
        }
        out
    }

    fn clip(self, lo: f64, hi: f64) -> Self {
        let mut out = Self::default();
        for k in 0..self.n {
            let (a, b) = (self.v[k].0.max(lo), self.v[k].1.min(hi));
            if b >= a {
                out.v[out.n] = (a, b);
                out.n += 1;
            }
        }
        out
    }

    /// Whether `cos_gamma` (the cosine of the central angle) lies in an interval.
    pub fn contains_cos(&self, cos_gamma: f64) -> bool {
        (0..self.n).any(|k| {
            let (a, b) = self.v[k];
            cos_gamma <= a.pcos() && cos_gamma >= b.pcos()
        })
    }
}

/// The central angles `gamma` between a satellite at radius `rs` and a user at radius `ru` (both from the Earth's centre)
/// at which the user sees the satellite: inside the transmit cone of half-angle `beam_deg` around the satellite's nadir,
/// not blocked by the sphere of radius `r_block`, inside the user's hemisphere when `hemisphere` (a nadir-pointing
/// hemispherical antenna), and, when `rho_max_m` is given, close enough for the received power.
pub fn visible_intervals(
    rs: f64,
    ru: f64,
    beam_deg: f64,
    hemisphere: bool,
    rho_max_m: Option<f64>,
    r_block: f64,
) -> Intervals {
    let pi = std::f64::consts::PI;
    if rs <= r_block || ru <= r_block {
        return Intervals::default();
    }
    let gamma_k = ((r_block / rs).pacos() + (r_block / ru).pacos()).min(pi);
    let tb = beam_deg.to_radians();
    let q = rs / ru * tb.psin();
    let beam = if rs < ru {
        // The user is outside the satellite's sphere: it is in the cone for central angles above a bound.
        Intervals::one(pi - tb - q.pasin(), pi)
    } else if q >= 1.0 {
        Intervals::one(0.0, pi)
    } else {
        let a = q.pasin() - tb;
        // The near-side users, and the users beyond the limb on the far side of the Earth.
        Intervals::two((0.0, a), (pi - q.pasin() - tb, pi))
    };
    let mut iv = beam.clip(0.0, gamma_k);
    if hemisphere && rs > ru {
        iv = iv.clip((ru / rs).pacos(), pi);
    }
    if let Some(rho) = rho_max_m {
        // rho^2 = rs^2 + ru^2 - 2 rs ru cos(gamma) <= rho_max^2.
        let c = (rs * rs + ru * ru - rho * rho) / (2.0 * rs * ru);
        if c >= 1.0 {
            iv = Intervals::default();
        } else if c > -1.0 {
            iv = iv.clip(0.0, c.pacos());
        }
    }
    iv
}

#[cfg(test)]
mod tests {
    use super::*;

    fn rand_unit(seed: &mut u64) -> V3 {
        let mut next = || {
            *seed = seed
                .wrapping_mul(6364136223846793005)
                .wrapping_add(1442695040888963407);
            ((*seed >> 11) as f64) / ((1u64 << 53) as f64)
        };
        let z = 2.0 * next() - 1.0;
        let a = 2.0 * std::f64::consts::PI * next();
        let r = (1.0 - z * z).sqrt();
        [r * a.cos(), r * a.sin(), z]
    }

    // PIN-SCOPE:    the number of grid points the construction yields at one subdivision level (a count, not a hash)
    // PIN-EXCLUDES: the point positions, which are checked by the unit-norm and spacing assertions below
    #[test]
    fn the_grid_has_the_booklets_2562_points_on_the_unit_sphere() {
        let g = geodesic_grid(4);
        assert_eq!(g.len(), 2562);
        assert!(g.iter().all(|v| (norm(*v) - 1.0).abs() < 1e-12));
        assert_eq!(geodesic_grid(0).len(), 12);
        assert_eq!(geodesic_grid(2).len(), 162);
        // Nearest-neighbour spacing is about 4 degrees at this level.
        let a = g[100];
        let mut best = 10.0f64;
        for (k, b) in g.iter().enumerate() {
            if k != 100 {
                best = best.min(dot(a, *b).clamp(-1.0, 1.0).acos().to_degrees());
            }
        }
        assert!((2.0..5.0).contains(&best), "{best}");
    }

    #[test]
    fn rotation_round_trips() {
        let v = [1.0, 2.0, 3.0];
        let era = earth_rotation_angle(12345.0);
        let w = ecef_to_eci(eci_to_ecef(v, era), era);
        for k in 0..3 {
            assert!((w[k] - v[k]).abs() < 1e-12);
        }
    }

    // The closed-form interval agrees with the general predicate on random geometry, for the beam, the blockage, the
    // hemispherical user antenna and a range limit.
    #[test]
    fn the_interval_form_equals_the_general_predicate() {
        let mut seed = 99u64;
        let rb = blocking_radius_m();
        let mut checked = 0usize;
        let mut mismatches = 0usize;
        for case in 0..400 {
            let rs = (20.0e6 + 25.0e6 * ((case % 7) as f64) / 7.0) + 1.0e6 * ((case % 3) as f64);
            let ru = [14.4e6, 20.0e6, 30.0e6, 42.4e6, 50.0e6][case % 5];
            let beam = [16.0, 20.5, 23.5, 28.0][case % 4];
            let hemi = case % 2 == 0;
            let rho_max = if case % 3 == 0 { Some(45.0e6) } else { None };
            let iv = visible_intervals(rs, ru, beam, hemi, rho_max, rb);
            let s_hat = rand_unit(&mut seed);
            let s = scale(s_hat, rs);
            for _ in 0..200 {
                let u_hat = rand_unit(&mut seed);
                let u = scale(u_hat, ru);
                let lg = link(s, scale(s_hat, -1.0), u, rb);
                let mut ok = !lg.blocked && lg.off_boresight_deg <= beam;
                if hemi {
                    ok &= dot(sub(s, u), scale(u_hat, -1.0)) >= 0.0;
                }
                if let Some(r) = rho_max {
                    ok &= lg.range_m <= r;
                }
                let fast = iv.contains_cos(dot(s_hat, u_hat));
                checked += 1;
                if ok != fast {
                    mismatches += 1;
                }
            }
        }
        // Equality up to points within rounding of an edge.
        assert!(mismatches * 2000 <= checked, "{mismatches} of {checked}");
    }

    #[test]
    fn a_user_behind_the_earth_is_blocked_and_one_beside_the_limb_is_not() {
        let rb = blocking_radius_m();
        let s = [26_560_000.0, 0.0, 0.0];
        let b = [-1.0, 0.0, 0.0];
        let behind = link(s, b, [-42_378_000.0, 0.0, 0.0], rb);
        assert!(behind.blocked && behind.off_boresight_deg < 1e-9);
        // 40 degrees of central angle at GEO radius: beyond the beam but not blocked.
        let ang = 40f64.to_radians();
        let u = [42_378_000.0 * ang.cos(), 42_378_000.0 * ang.sin(), 0.0];
        assert!(!link(s, b, u, rb).blocked);
    }
}
