// SPDX-License-Identifier: AGPL-3.0-only
//! Orbit helpers for the Earth-side phases.

use crate::forces::MU_EARTH;

/// Inertial position (m) and velocity (m/s) from Keplerian elements about the Earth: semi-major
/// axis `a_m`, eccentricity `e`, inclination, right ascension of the ascending node, argument of
/// perigee and true anomaly (degrees).
pub fn state_from_elements(
    a_m: f64,
    e: f64,
    i_deg: f64,
    raan_deg: f64,
    argp_deg: f64,
    nu_deg: f64,
) -> [f64; 6] {
    let nu = nu_deg.to_radians();
    let p = a_m * (1.0 - e * e);
    let r = p / (1.0 + e * nu.cos());
    let (rp, vp) = (
        [r * nu.cos(), r * nu.sin()],
        [
            -(MU_EARTH / p).sqrt() * nu.sin(),
            (MU_EARTH / p).sqrt() * (e + nu.cos()),
        ],
    );
    let (i, om, w) = (
        i_deg.to_radians(),
        raan_deg.to_radians(),
        argp_deg.to_radians(),
    );
    let (so, co) = om.sin_cos();
    let (sw, cw) = w.sin_cos();
    let (si, ci) = i.sin_cos();
    // Perifocal to inertial: R3(-raan) R1(-i) R3(-argp).
    let rot = |x: f64, y: f64| -> [f64; 3] {
        [
            (co * cw - so * sw * ci) * x + (-co * sw - so * cw * ci) * y,
            (so * cw + co * sw * ci) * x + (-so * sw + co * cw * ci) * y,
            (sw * si) * x + (cw * si) * y,
        ]
    };
    let pos = rot(rp[0], rp[1]);
    let vel = rot(vp[0], vp[1]);
    [pos[0], pos[1], pos[2], vel[0], vel[1], vel[2]]
}

/// A circular orbit at an altitude above the 6 378.137 km equatorial radius.
pub fn circular_state(alt_m: f64, i_deg: f64, raan_deg: f64, nu_deg: f64) -> [f64; 6] {
    state_from_elements(6_378_137.0 + alt_m, 0.0, i_deg, raan_deg, 0.0, nu_deg)
}

#[cfg(test)]
mod tests {
    use super::*;

    fn dot(a: &[f64], b: &[f64]) -> f64 {
        a.iter().zip(b).map(|(x, y)| x * y).sum()
    }

    #[test]
    fn a_circular_orbit_has_the_right_radius_speed_and_inclination() {
        let s = circular_state(400_000.0, 51.6, 30.0, 70.0);
        let r = dot(&s[..3], &s[..3]).sqrt();
        let v = dot(&s[3..], &s[3..]).sqrt();
        assert!((r - 6_778_137.0).abs() < 1e-6);
        assert!((v - (MU_EARTH / r).sqrt()).abs() < 1e-9);
        assert!(dot(&s[..3], &s[3..]).abs() < 1e-9 * r * v);
        // Inclination from the angular momentum.
        let h = [
            s[1] * s[5] - s[2] * s[4],
            s[2] * s[3] - s[0] * s[5],
            s[0] * s[4] - s[1] * s[3],
        ];
        let hn = dot(&h, &h).sqrt();
        assert!(((h[2] / hn).acos().to_degrees() - 51.6).abs() < 1e-9);
    }

    #[test]
    fn an_eccentric_orbit_obeys_the_vis_viva_equation() {
        let a = 2.0e8;
        let e = 0.96;
        let s = state_from_elements(a, e, 28.5, 10.0, 20.0, 120.0);
        let r = dot(&s[..3], &s[..3]).sqrt();
        let v2 = dot(&s[3..], &s[3..]);
        assert!((v2 - MU_EARTH * (2.0 / r - 1.0 / a)).abs() / v2 < 1e-12);
        let p = a * (1.0 - e * e);
        assert!((r - p / (1.0 + e * 120f64.to_radians().cos())).abs() < 1e-3);
    }
}
