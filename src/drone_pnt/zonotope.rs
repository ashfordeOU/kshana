// SPDX-License-Identifier: AGPL-3.0-only
//! Set-based (zonotope) protection level for a snapshot least-squares position, as a reference.
//!
//! With line-of-sight unit vectors `u_i` (east, north, up) and a receiver clock, the geometry row
//! is `[−u_i, 1]`, and the least-squares solution maps range errors to state errors through
//! `S = (HᵀWH)⁻¹HᵀW` (`W = I`, or `diag(1/b_i²)` with `weighted`). When every range error is only
//! known to be bounded, `|ε_i| ≤ b_i`, the set of position errors is the zonotope with generators
//! `g_i = S_{1..3,i}·b_i`. Its exact bounds are:
//!
//! * vertical protection level `VPL = Σ|g_i,U|`;
//! * horizontal protection level `HPL = max ‖Σ σ_i g_i,EN‖` over sign vectors σ, the largest
//!   distance of a vertex of the projected 2-D zonotope from the origin. The vertices are found
//!   exactly by walking the 2n directions between the generators' normal angles.
//!
//! No probability is attached: the bound holds whenever the error bounds hold. The interval hull
//! `(Σ|g_E|, Σ|g_N|)` is reported alongside (`HPL ≤ √(E²+N²)`).

use serde::{Deserialize, Serialize};

/// One satellite.
#[derive(Clone, Debug, PartialEq, Serialize, Deserialize)]
pub struct Sat {
    /// Azimuth, degrees from north.
    pub az_deg: f64,
    /// Elevation, degrees.
    pub el_deg: f64,
    /// Range-error bound, metres.
    pub bound_m: f64,
}

/// A protection-level request.
#[derive(Clone, Debug, PartialEq, Serialize, Deserialize)]
pub struct ZonotopeSpec {
    /// The satellites (at least four).
    pub sats: Vec<Sat>,
    /// Weight by `1/b²` instead of equal weights.
    #[serde(default)]
    pub weighted: bool,
}

/// The protection levels.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct ZonotopeResult {
    /// Report format tag.
    pub format: &'static str,
    /// Evidence label.
    pub evidence: &'static str,
    /// Horizontal protection level, metres.
    pub hpl_m: f64,
    /// Vertical protection level, metres.
    pub vpl_m: f64,
    /// Interval hull half-widths east, north, up, metres.
    pub interval_hull_m: [f64; 3],
    /// The vertex direction of the HPL (east, north), metres.
    pub hpl_vertex_m: [f64; 2],
}

fn invert4(m: [[f64; 4]; 4]) -> Option<[[f64; 4]; 4]> {
    let mut a = [[0.0; 8]; 4];
    for i in 0..4 {
        a[i][..4].copy_from_slice(&m[i]);
        a[i][4 + i] = 1.0;
    }
    for c in 0..4 {
        let p = (c..4).max_by(|&x, &y| a[x][c].abs().total_cmp(&a[y][c].abs()))?;
        if a[p][c].abs() < 1e-12 {
            return None;
        }
        a.swap(c, p);
        let d = a[c][c];
        for v in a[c].iter_mut() {
            *v /= d;
        }
        for r in 0..4 {
            if r != c {
                let f = a[r][c];
                let row = a[c];
                for (x, y) in a[r].iter_mut().zip(row) {
                    *x -= f * y;
                }
            }
        }
    }
    let mut out = [[0.0; 4]; 4];
    for i in 0..4 {
        out[i].copy_from_slice(&a[i][4..]);
    }
    Some(out)
}

/// The zonotope generators (east, north, up per satellite), metres.
pub fn generators(spec: &ZonotopeSpec) -> Result<Vec<[f64; 3]>, String> {
    let n = spec.sats.len();
    let ok = n >= 4
        && spec.sats.iter().all(|s| {
            s.az_deg.is_finite() && s.el_deg.is_finite() && s.bound_m.is_finite() && s.bound_m > 0.0
        });
    if !ok || n > 1000 {
        return Err(crate::terr!("e-drone-zonotope-bad-geometry"));
    }
    let h: Vec<[f64; 4]> = spec
        .sats
        .iter()
        .map(|s| {
            let (az, el) = (s.az_deg.to_radians(), s.el_deg.to_radians());
            [-el.cos() * az.sin(), -el.cos() * az.cos(), -el.sin(), 1.0]
        })
        .collect();
    let w: Vec<f64> = spec
        .sats
        .iter()
        .map(|s| {
            if spec.weighted {
                1.0 / (s.bound_m * s.bound_m)
            } else {
                1.0
            }
        })
        .collect();
    let mut hth = [[0.0; 4]; 4];
    for (row, wi) in h.iter().zip(&w) {
        for i in 0..4 {
            for j in 0..4 {
                hth[i][j] += wi * row[i] * row[j];
            }
        }
    }
    let inv = invert4(hth).ok_or_else(|| crate::terr!("e-drone-zonotope-bad-geometry"))?;
    Ok(h.iter()
        .zip(&w)
        .zip(&spec.sats)
        .map(|((row, wi), s)| {
            let mut g = [0.0; 3];
            for (r, gr) in g.iter_mut().enumerate() {
                *gr = (0..4).map(|j| inv[r][j] * row[j]).sum::<f64>() * wi * s.bound_m;
            }
            g
        })
        .collect())
}

/// The protection levels of the module notes.
pub fn protection_levels(spec: &ZonotopeSpec) -> Result<ZonotopeResult, String> {
    let g = generators(spec)?;
    let hull = [0, 1, 2].map(|k| g.iter().map(|x| x[k].abs()).sum::<f64>());
    // The vertex for direction θ is Σ sign(g·u) g; it changes only where some g is normal to u.
    let mut angles: Vec<f64> = g
        .iter()
        .filter(|x| x[0] != 0.0 || x[1] != 0.0)
        .flat_map(|x| {
            let a = x[1].atan2(x[0]);
            [
                a + std::f64::consts::FRAC_PI_2,
                a - std::f64::consts::FRAC_PI_2,
            ]
        })
        .map(|a| a.rem_euclid(std::f64::consts::TAU))
        .collect();
    angles.sort_by(f64::total_cmp);
    let mut best = (0.0, [0.0, 0.0]);
    let m = angles.len();
    for k in 0..m.max(1) {
        let (a, b) = if m == 0 {
            (0.0, 0.0)
        } else if k + 1 < m {
            (angles[k], angles[k + 1])
        } else {
            (angles[k], angles[0] + std::f64::consts::TAU)
        };
        let th = 0.5 * (a + b);
        let (c, s) = (th.cos(), th.sin());
        let mut v = [0.0, 0.0];
        for x in &g {
            let sg = if x[0] * c + x[1] * s >= 0.0 {
                1.0
            } else {
                -1.0
            };
            v[0] += sg * x[0];
            v[1] += sg * x[1];
        }
        let r = v[0].hypot(v[1]);
        if r > best.0 {
            best = (r, v);
        }
    }
    Ok(ZonotopeResult {
        format: "kshana.drone-zonotope-pl/1",
        evidence: super::EVIDENCE,
        hpl_m: best.0,
        vpl_m: hull[2],
        interval_hull_m: hull,
        hpl_vertex_m: best.1,
    })
}

#[cfg(test)]
mod tests {
    use super::*;

    fn spec() -> ZonotopeSpec {
        let sats = [
            (0.0, 15.0, 3.0),
            (72.0, 40.0, 2.0),
            (144.0, 60.0, 1.5),
            (216.0, 25.0, 2.5),
            (288.0, 50.0, 2.0),
            (30.0, 85.0, 1.0),
            (180.0, 10.0, 4.0),
        ]
        .iter()
        .map(|&(az, el, b)| Sat {
            az_deg: az,
            el_deg: el,
            bound_m: b,
        })
        .collect();
        ZonotopeSpec {
            sats,
            weighted: false,
        }
    }

    #[test]
    fn hpl_equals_the_brute_force_vertex_maximum() {
        for weighted in [false, true] {
            let s = ZonotopeSpec { weighted, ..spec() };
            let g = generators(&s).unwrap();
            let mut brute: f64 = 0.0;
            for mask in 0u32..(1 << g.len()) {
                let (mut e, mut n) = (0.0, 0.0);
                for (i, x) in g.iter().enumerate() {
                    let sg = if mask & (1 << i) != 0 { 1.0 } else { -1.0 };
                    e += sg * x[0];
                    n += sg * x[1];
                }
                brute = brute.max(f64::hypot(e, n));
            }
            let r = protection_levels(&s).unwrap();
            assert!((r.hpl_m - brute).abs() < 1e-9, "{} vs {brute}", r.hpl_m);
            assert!(r.hpl_m <= r.interval_hull_m[0].hypot(r.interval_hull_m[1]) + 1e-9);
        }
    }

    #[test]
    fn unit_bounds_reproduce_the_least_squares_map() {
        // With equal bounds b, every generator is b times a column of S; Σ_i S_ri (r = 0..2) is 0
        // because S·1 picks the clock column of H.
        let s = spec();
        let g = generators(&ZonotopeSpec {
            sats: s
                .sats
                .iter()
                .map(|x| Sat {
                    bound_m: 1.0,
                    ..x.clone()
                })
                .collect(),
            weighted: false,
        })
        .unwrap();
        for r in 0..3 {
            assert!(g.iter().map(|x| x[r]).sum::<f64>().abs() < 1e-9);
        }
        assert!(generators(&ZonotopeSpec {
            sats: s.sats[..3].to_vec(),
            weighted: false
        })
        .is_err());
    }
}
