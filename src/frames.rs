// SPDX-License-Identifier: Apache-2.0
//! Reference-frame reduction and a geodetic ground-station observer.
//!
//! Bridges the inertial, of-date TEME positions the SGP4/SDP4 propagator emits to
//! the Earth-fixed frame, the WGS-84 ellipsoid, and topocentric look angles:
//!
//! - [`teme_to_ecef`] / [`ecef_to_teme`] — rotate by the Greenwich Mean Sidereal
//!   Time (the same IAU-1982 [`crate::sgp4::gstime`] the propagator uses, so the
//!   reduction is consistent with the orbit model). This is the TEME→PEF rotation;
//!   PEF is treated as ECEF (polar motion is neglected — see the scope note).
//! - [`geodetic_to_ecef`] / [`ecef_to_geodetic`] — WGS-84 ellipsoid, the inverse
//!   via a Bowring-seeded fixed-point iteration (machine-precision at every
//!   latitude and altitude, including MEO/GEO).
//! - [`look_angles`] — azimuth, elevation, and range of a satellite (ECEF) seen
//!   from a geodetic ground station, via the local East-North-Up frame.
//!
//! - [`teme_to_itrf`] — the GMST-based TEME→PEF rotation followed by IERS
//!   **polar motion** (PEF→ITRF, [`polar_motion_matrix`], SOFA `iauPom00`) given
//!   caller-supplied pole coordinates `x_p`/`y_p` (a tens-of-metres effect at
//!   orbital radius).
//!
//! Scope (honest): [`teme_to_ecef`] alone is GMST-only (polar motion neglected) —
//! adequate for visibility, pass geometry, and look-angle work (sub-km on the
//! ground track); [`teme_to_itrf`] adds polar motion for an ITRF-precise position.
//! `x_p`/`y_p` are observed IERS quantities the caller supplies (Bulletin A/B), not
//! predicted here; a fully CIO-based (X, Y, s) chain and an ANISE/SPICE numerical
//! cross-check remain follow-ons.

use crate::precession::{mat_vec, matmul, rx, ry, rz, transpose, Mat3};
use crate::sgp4::gstime;
use crate::timescales::JD_J2000;
use std::f64::consts::{PI, TAU};

/// A 3-vector in metres, `[x, y, z]`, matching the propagator's convention.
pub type Vec3 = [f64; 3];

/// Arc seconds to radians, for the polar-motion pole coordinates.
const ARCSEC_TO_RAD: f64 = PI / (180.0 * 3600.0);

// WGS-84 defining constants.
/// WGS-84 semi-major axis (equatorial radius), metres.
pub const WGS84_A: f64 = 6_378_137.0;
/// WGS-84 flattening.
pub const WGS84_F: f64 = 1.0 / 298.257_223_563;

/// WGS-84 first eccentricity squared, `e^2 = f (2 - f)`.
pub fn wgs84_e2() -> f64 {
    WGS84_F * (2.0 - WGS84_F)
}

/// WGS-84 semi-minor axis (polar radius), `b = a (1 - f)`, metres.
pub fn wgs84_b() -> f64 {
    WGS84_A * (1.0 - WGS84_F)
}

/// Rotate an inertial-of-date TEME position into the Earth-fixed frame by the
/// Greenwich Mean Sidereal Time for the given UT1 Julian date. R3(theta).
pub fn teme_to_ecef(r_teme: Vec3, jd_ut1: f64) -> Vec3 {
    let theta = gstime(jd_ut1);
    let (s, c) = theta.sin_cos();
    [
        c * r_teme[0] + s * r_teme[1],
        -s * r_teme[0] + c * r_teme[1],
        r_teme[2],
    ]
}

/// Inverse of [`teme_to_ecef`]: rotate an Earth-fixed position back to TEME.
pub fn ecef_to_teme(r_ecef: Vec3, jd_ut1: f64) -> Vec3 {
    let theta = gstime(jd_ut1);
    let (s, c) = theta.sin_cos();
    [
        c * r_ecef[0] - s * r_ecef[1],
        s * r_ecef[0] + c * r_ecef[1],
        r_ecef[2],
    ]
}

/// A geodetic position on the WGS-84 ellipsoid: geodetic latitude and longitude
/// (radians) and height above the ellipsoid (metres).
#[derive(Clone, Copy, Debug, PartialEq)]
pub struct Geodetic {
    pub lat_rad: f64,
    pub lon_rad: f64,
    pub alt_m: f64,
}

/// WGS-84 geodetic → ECEF (exact).
pub fn geodetic_to_ecef(g: Geodetic) -> Vec3 {
    let e2 = wgs84_e2();
    let (sin_lat, cos_lat) = g.lat_rad.sin_cos();
    let (sin_lon, cos_lon) = g.lon_rad.sin_cos();
    // Prime-vertical radius of curvature.
    let n = WGS84_A / (1.0 - e2 * sin_lat * sin_lat).sqrt();
    [
        (n + g.alt_m) * cos_lat * cos_lon,
        (n + g.alt_m) * cos_lat * sin_lon,
        (n * (1.0 - e2) + g.alt_m) * sin_lat,
    ]
}

/// WGS-84 ECEF → geodetic. Bowring's formula seeds a short fixed-point iteration
/// on latitude; the loop converges to machine precision at every latitude and
/// altitude (the single-pass closed form drifts at high — e.g. MEO — altitude).
/// Height is taken by projection onto the local vertical, which is
/// well-conditioned even at the poles.
pub fn ecef_to_geodetic(r: Vec3) -> Geodetic {
    let (x, y, z) = (r[0], r[1], r[2]);
    let a = WGS84_A;
    let b = wgs84_b();
    let e2 = wgs84_e2();
    let ep2 = (a * a - b * b) / (b * b); // second eccentricity squared
    let p = (x * x + y * y).sqrt();
    let lon = y.atan2(x);

    if p < 1e-9 {
        // On the spin axis: latitude is ±90°, longitude undefined (take 0).
        let lat = if z >= 0.0 { PI / 2.0 } else { -PI / 2.0 };
        return Geodetic {
            lat_rad: lat,
            lon_rad: 0.0,
            alt_m: z.abs() - b,
        };
    }

    // Bowring initial latitude.
    let theta = (z * a).atan2(p * b);
    let (sin_t, cos_t) = theta.sin_cos();
    let mut lat = (z + ep2 * b * sin_t * sin_t * sin_t).atan2(p - e2 * a * cos_t * cos_t * cos_t);

    // Refine: lat = atan2(z, p (1 - e^2 N/(N+h))). Converges in a few steps.
    let mut n = a;
    for _ in 0..5 {
        let sin_lat = lat.sin();
        n = a / (1.0 - e2 * sin_lat * sin_lat).sqrt();
        let cos_lat = lat.cos();
        let h = p * cos_lat + z * sin_lat - n * (1.0 - e2 * sin_lat * sin_lat);
        lat = z.atan2(p * (1.0 - e2 * n / (n + h)));
    }

    let (sin_lat, cos_lat) = lat.sin_cos();
    // Height by projection onto the local vertical (well-conditioned everywhere).
    let alt = p * cos_lat + z * sin_lat - n * (1.0 - e2 * sin_lat * sin_lat);
    Geodetic {
        lat_rad: lat,
        lon_rad: lon,
        alt_m: alt,
    }
}

/// Topocentric look angles of a target as seen from a ground station.
#[derive(Clone, Copy, Debug, PartialEq)]
pub struct AzElRange {
    /// Azimuth, radians clockwise from true north, in [0, 2*pi).
    pub az_rad: f64,
    /// Elevation above the local horizon, radians in [-pi/2, pi/2].
    pub el_rad: f64,
    /// Slant range to the target, metres.
    pub range_m: f64,
}

/// Azimuth, elevation, and range of a target at ECEF position `target_ecef` as
/// seen from a geodetic ground `station`, computed in the station's local
/// East-North-Up frame. A negative elevation means the target is below the
/// station's horizon (not visible).
pub fn look_angles(station: Geodetic, target_ecef: Vec3) -> AzElRange {
    let s = geodetic_to_ecef(station);
    let d = [
        target_ecef[0] - s[0],
        target_ecef[1] - s[1],
        target_ecef[2] - s[2],
    ];
    let (sin_lat, cos_lat) = station.lat_rad.sin_cos();
    let (sin_lon, cos_lon) = station.lon_rad.sin_cos();
    // ECEF -> ENU at the station.
    let east = -sin_lon * d[0] + cos_lon * d[1];
    let north = -sin_lat * cos_lon * d[0] - sin_lat * sin_lon * d[1] + cos_lat * d[2];
    let up = cos_lat * cos_lon * d[0] + cos_lat * sin_lon * d[1] + sin_lat * d[2];
    let range = (east * east + north * north + up * up).sqrt();
    let mut az = east.atan2(north);
    if az < 0.0 {
        az += TAU;
    }
    let el = if range > 0.0 {
        (up / range).asin()
    } else {
        0.0
    };
    AzElRange {
        az_rad: az,
        el_rad: el,
        range_m: range,
    }
}

/// Geodetic elevation (radians) of `target_ecef` above the local horizon at a
/// geodetic `station` — measured against the **ellipsoid normal** (the local
/// vertical a real observer uses), not the geocentric radial. The two differ by
/// up to the geodetic-vs-geocentric latitude deflection (~0.19 deg near 45 deg
/// latitude), which is enough to flip near-horizon satellites in or out of an
/// elevation mask. Convenience wrapper over [`look_angles`].
pub fn elevation(station: Geodetic, target_ecef: Vec3) -> f64 {
    look_angles(station, target_ecef).el_rad
}

/// True when `target_ecef` is at or above the elevation mask `mask_deg` as seen
/// from the geodetic `station` (geodetically correct — uses the ellipsoid normal).
pub fn is_visible(station: Geodetic, target_ecef: Vec3, mask_deg: f64) -> bool {
    elevation(station, target_ecef) >= mask_deg.to_radians()
}

/// Count how many of `targets_ecef` are visible (at or above `mask_deg`) from the
/// geodetic `station`. The constellation-visibility figure for a ground station,
/// computed on the WGS-84 ellipsoid rather than a sphere.
pub fn visible_count(station: Geodetic, targets_ecef: &[Vec3], mask_deg: f64) -> usize {
    targets_ecef
        .iter()
        .filter(|&&t| is_visible(station, t, mask_deg))
        .count()
}

/// IERS polar-motion matrix (SOFA `iauPom00`): `W = Rx(−y_p)·Ry(−x_p)·Rz(s′)`.
/// `x_p`, `y_p` are the polar-motion pole coordinates (radians, an observed quantity
/// from IERS Bulletin A/B — supply via [`arcsec`]); `s′` is the TIO locator,
/// `s′ ≈ −47 µas·t` with `t` in TT centuries since J2000. `W` rotates the
/// pseudo-Earth-fixed / TIRS frame into the true ITRF. At `x_p = y_p = 0` it is the
/// identity to the sub-µas `s′` term.
pub fn polar_motion_matrix(xp_rad: f64, yp_rad: f64, jd_tt: f64) -> Mat3 {
    let t = (jd_tt - JD_J2000) / 36_525.0;
    let sp = -47.0e-6 * ARCSEC_TO_RAD * t; // TIO locator s′
    matmul(&rx(-yp_rad), &matmul(&ry(-xp_rad), &rz(sp)))
}

/// Convenience: arc seconds → radians, for polar-motion pole coordinates.
pub fn arcsec(v: f64) -> f64 {
    v * ARCSEC_TO_RAD
}

/// Apply polar motion: pseudo-Earth-fixed (PEF/TIRS) → ITRF.
pub fn pef_to_itrf(r_pef: Vec3, xp_rad: f64, yp_rad: f64, jd_tt: f64) -> Vec3 {
    mat_vec(&polar_motion_matrix(xp_rad, yp_rad, jd_tt), r_pef)
}

/// Inverse of [`pef_to_itrf`]: ITRF → PEF/TIRS.
pub fn itrf_to_pef(r_itrf: Vec3, xp_rad: f64, yp_rad: f64, jd_tt: f64) -> Vec3 {
    mat_vec(
        &transpose(&polar_motion_matrix(xp_rad, yp_rad, jd_tt)),
        r_itrf,
    )
}

/// Full TEME → ITRF reduction: the GMST-based [`teme_to_ecef`] rotation (TEME→PEF)
/// followed by IERS polar motion (PEF→ITRF). `jd_ut1` drives sidereal time; the
/// pole coordinates `xp_rad`/`yp_rad` and `jd_tt` drive polar motion. This upgrades
/// the polar-motion-neglecting [`teme_to_ecef`] to an ITRF-precise Earth-fixed
/// position (polar motion is a tens-of-metres effect at orbital radius).
pub fn teme_to_itrf(r_teme: Vec3, jd_ut1: f64, xp_rad: f64, yp_rad: f64, jd_tt: f64) -> Vec3 {
    pef_to_itrf(teme_to_ecef(r_teme, jd_ut1), xp_rad, yp_rad, jd_tt)
}

#[cfg(test)]
mod tests {
    use super::*;

    fn norm(v: Vec3) -> f64 {
        (v[0] * v[0] + v[1] * v[1] + v[2] * v[2]).sqrt()
    }

    #[test]
    fn polar_motion_is_near_identity_at_zero_and_a_small_proper_rotation() {
        let r = [4000.0e3, 5000.0e3, 3000.0e3];
        let jd_tt = 2_458_849.5; // 2020-01-01
                                 // x_p = y_p = 0 → only the sub-µas TIO-locator term remains, so PEF == ITRF to
                                 // well under a metre at orbital radius.
        let same = pef_to_itrf(r, 0.0, 0.0, jd_tt);
        for k in 0..3 {
            assert!((same[k] - r[k]).abs() < 1.0, "near-identity component {k}");
        }
        // A realistic pole (x_p = 0.2″, y_p = 0.3″) — the matrix is a proper rotation.
        let (xp, yp) = (arcsec(0.2), arcsec(0.3));
        let w = polar_motion_matrix(xp, yp, jd_tt);
        let wt = transpose(&w);
        let p = matmul(&w, &wt);
        for (i, row) in p.iter().enumerate() {
            for (j, &pij) in row.iter().enumerate() {
                let e = if i == j { 1.0 } else { 0.0 };
                assert!((pij - e).abs() < 1e-12, "W·Wᵀ[{i}][{j}]");
            }
        }
        // It displaces the position at the tens-of-metres level (≈ angle × radius:
        // 0.36″ × 7071 km ≈ 12 m), and round-trips.
        let itrf = pef_to_itrf(r, xp, yp, jd_tt);
        let d = norm([itrf[0] - r[0], itrf[1] - r[1], itrf[2] - r[2]]);
        assert!((1.0..50.0).contains(&d), "polar-motion shift = {d} m");
        let back = itrf_to_pef(itrf, xp, yp, jd_tt);
        for k in 0..3 {
            assert!((back[k] - r[k]).abs() < 1e-6, "round-trip component {k}");
        }
    }

    #[test]
    fn teme_to_itrf_extends_teme_to_ecef_by_polar_motion() {
        let r = [4000.0e3, 5000.0e3, 3000.0e3];
        // TT leads UT1 by ~69 s (≈ 0.0008 d) at this epoch.
        let (jd_ut1, jd_tt) = (2_458_849.5, 2_458_849.5 + 0.000_8);
        // With no polar motion, TEME→ITRF is exactly the GMST-based TEME→ECEF.
        let ecef = teme_to_ecef(r, jd_ut1);
        let itrf0 = teme_to_itrf(r, jd_ut1, 0.0, 0.0, jd_tt);
        for k in 0..3 {
            assert!((itrf0[k] - ecef[k]).abs() < 1.0, "no-pole component {k}");
        }
        // With a realistic pole the ITRF position separates from PEF by ~tens of m.
        let itrf = teme_to_itrf(r, jd_ut1, arcsec(0.2), arcsec(0.3), jd_tt);
        let d = norm([itrf[0] - ecef[0], itrf[1] - ecef[1], itrf[2] - ecef[2]]);
        assert!((1.0..50.0).contains(&d), "polar-motion separation = {d} m");
        // The rotation preserves magnitude (it is orthonormal).
        assert!((norm(itrf) - norm(r)).abs() < 1e-6);
    }

    #[test]
    fn geodetic_to_ecef_cardinal_points() {
        // Equator / prime meridian at sea level sits on +x at the equatorial radius.
        let eq = geodetic_to_ecef(Geodetic {
            lat_rad: 0.0,
            lon_rad: 0.0,
            alt_m: 0.0,
        });
        assert!((eq[0] - WGS84_A).abs() < 1e-6 && eq[1].abs() < 1e-6 && eq[2].abs() < 1e-6);
        // North pole sits on +z at the polar radius b.
        let np = geodetic_to_ecef(Geodetic {
            lat_rad: PI / 2.0,
            lon_rad: 0.0,
            alt_m: 0.0,
        });
        assert!(np[0].abs() < 1e-6 && np[1].abs() < 1e-6 && (np[2] - wgs84_b()).abs() < 1e-6);
        // 90° E on the equator sits on +y.
        let e90 = geodetic_to_ecef(Geodetic {
            lat_rad: 0.0,
            lon_rad: PI / 2.0,
            alt_m: 0.0,
        });
        assert!(e90[0].abs() < 1e-6 && (e90[1] - WGS84_A).abs() < 1e-6);
    }

    #[test]
    fn geodetic_round_trips_through_ecef() {
        let cases: &[(f64, f64, f64)] = &[
            (0.0, 0.0, 0.0),
            (59.437, 24.7536, 35.0),    // Tallinn
            (-33.8688, 151.2093, 58.0), // Sydney
            (89.0, -179.0, 400_000.0),  // high latitude, high altitude (LEO-ish)
            (-89.5, 12.0, 0.0),
        ];
        for &(lat_deg, lon_deg, alt) in cases {
            let g = Geodetic {
                lat_rad: lat_deg.to_radians(),
                lon_rad: lon_deg.to_radians(),
                alt_m: alt,
            };
            let back = ecef_to_geodetic(geodetic_to_ecef(g));
            assert!((back.lat_rad - g.lat_rad).abs() < 1e-10, "lat {lat_deg}");
            assert!((back.lon_rad - g.lon_rad).abs() < 1e-10, "lon {lon_deg}");
            assert!(
                (back.alt_m - g.alt_m).abs() < 1e-4,
                "alt {alt}: {} vs {}",
                back.alt_m,
                g.alt_m
            );
        }
    }

    #[test]
    fn pole_ecef_to_geodetic_is_well_defined() {
        let g = ecef_to_geodetic([0.0, 0.0, wgs84_b() + 100.0]);
        assert!((g.lat_rad - PI / 2.0).abs() < 1e-9);
        assert!((g.alt_m - 100.0).abs() < 1e-6);
    }

    #[test]
    fn teme_ecef_rotation_preserves_norm_and_round_trips() {
        let r = [4000.0e3, 5000.0e3, 3000.0e3];
        let jd = 2_458_849.5; // 2020-01-01
        let ecef = teme_to_ecef(r, jd);
        assert!(
            (norm(ecef) - norm(r)).abs() < 1e-6,
            "rotation must preserve magnitude"
        );
        let back = ecef_to_teme(ecef, jd);
        for i in 0..3 {
            assert!((back[i] - r[i]).abs() < 1e-6, "round-trip component {i}");
        }
        // The z component (spin axis) is unchanged by the R3 rotation.
        assert!((ecef[2] - r[2]).abs() < 1e-9);
    }

    #[test]
    fn look_angles_cardinal_geometry_at_equator() {
        // Station at the equator / prime meridian: ECEF up = +x, east = +y, north = +z.
        let station = Geodetic {
            lat_rad: 0.0,
            lon_rad: 0.0,
            alt_m: 0.0,
        };
        let s = geodetic_to_ecef(station);

        // Straight up: target along +x, 1000 km higher.
        let up = look_angles(station, [s[0] + 1_000_000.0, s[1], s[2]]);
        assert!(
            (up.el_rad - PI / 2.0).abs() < 1e-9,
            "overhead -> 90° elevation"
        );
        assert!((up.range_m - 1_000_000.0).abs() < 1e-3);

        // Due north (along +z), on the horizon.
        let north = look_angles(station, [s[0], s[1], s[2] + 500_000.0]);
        assert!(
            north.az_rad.abs() < 1e-9,
            "az {} should be ~0 (north)",
            north.az_rad
        );
        assert!(north.el_rad.abs() < 1e-9, "on the horizon");

        // Due east (along +y).
        let east = look_angles(station, [s[0], s[1] + 500_000.0, s[2]]);
        assert!(
            (east.az_rad - PI / 2.0).abs() < 1e-9,
            "az {} should be ~90° (east)",
            east.az_rad
        );
    }

    /// Geocentric elevation: angle of the line of sight above the plane
    /// perpendicular to the *geocentric radial* at the station — the spherical-Earth
    /// approximation, for comparison against the geodetic (ellipsoid-normal) value.
    fn geocentric_elevation(station_ecef: Vec3, target_ecef: Vec3) -> f64 {
        let r = norm(station_ecef);
        let radial = [
            station_ecef[0] / r,
            station_ecef[1] / r,
            station_ecef[2] / r,
        ];
        let d = [
            target_ecef[0] - station_ecef[0],
            target_ecef[1] - station_ecef[1],
            target_ecef[2] - station_ecef[2],
        ];
        let dn = norm(d);
        let sin_el = (radial[0] * d[0] + radial[1] * d[1] + radial[2] * d[2]) / dn;
        sin_el.asin()
    }

    #[test]
    fn geodetic_elevation_differs_from_geocentric_off_equator() {
        // At 45 deg latitude the ellipsoid normal and the geocentric radial differ by
        // ~0.19 deg, so the two elevation definitions disagree by that much. A
        // satellite placed along the local vertical (ellipsoid normal) is at geodetic
        // zenith (90 deg) but NOT at geocentric zenith. This is exactly the error a
        // spherical-Earth visibility check makes.
        let station = Geodetic {
            lat_rad: 45.0_f64.to_radians(),
            lon_rad: 10.0_f64.to_radians(),
            alt_m: 0.0,
        };
        let s = geodetic_to_ecef(station);
        // Unit ellipsoid normal at the station.
        let (sla, cla) = station.lat_rad.sin_cos();
        let (slo, clo) = station.lon_rad.sin_cos();
        let normal = [cla * clo, cla * slo, sla];
        // A satellite 20,000 km straight "up" along the geodetic vertical.
        let sat = [
            s[0] + 2.0e7 * normal[0],
            s[1] + 2.0e7 * normal[1],
            s[2] + 2.0e7 * normal[2],
        ];

        let geod = elevation(station, sat).to_degrees();
        let geoc = geocentric_elevation(s, sat).to_degrees();
        assert!(
            (geod - 90.0).abs() < 1e-6,
            "geodetic zenith should be 90 deg, got {geod}"
        );
        let diff = (geod - geoc).abs();
        assert!(
            diff > 0.1 && diff < 0.25,
            "geodetic-vs-geocentric deflection ~0.19 deg, got {diff}"
        );

        // At the equator the two definitions coincide (normal == radial).
        let eq = Geodetic {
            lat_rad: 0.0,
            lon_rad: 0.0,
            alt_m: 0.0,
        };
        let es = geodetic_to_ecef(eq);
        let esat = [es[0] + 2.0e7, es[1], es[2]];
        assert!(
            (elevation(eq, esat).to_degrees() - geocentric_elevation(es, esat).to_degrees()).abs()
                < 1e-6
        );
    }

    #[test]
    fn ground_station_sees_a_subset_of_the_walker_constellation() {
        // End-to-end: generate a Walker GNSS constellation, propagate it, rotate each
        // satellite TEME -> ECEF, and count how many are visible above a 5 deg mask
        // from a geodetic ground station. A ground site sees some-but-not-all of a
        // global constellation (the far side is below the horizon).
        use crate::orbit::ConstellationCfg;
        let cfg = ConstellationCfg {
            altitude_km: 20_200.0,
            inclination_deg: 55.0,
            planes: 6,
            sats_per_plane: 4,
            phasing_f: 1.0,
            tle: None,
            rinex: None,
            strict_checksum: false,
        };
        let sats = cfg.satellites().unwrap();
        assert_eq!(sats.len(), 24);
        let jd = 2_458_849.5; // 2020-01-01
        let sats_ecef: Vec<Vec3> = sats
            .iter()
            .map(|p| teme_to_ecef(p.position_eci(0.0), jd))
            .collect();

        let station = Geodetic {
            lat_rad: 0.42,
            lon_rad: 0.0,
            alt_m: 50.0,
        };
        let vis = visible_count(station, &sats_ecef, 5.0);
        assert!(
            vis > 0 && vis < sats.len(),
            "ground station should see some-but-not-all: {vis}/24"
        );
        // The visible set must agree with the per-satellite elevation test.
        let manual = sats_ecef
            .iter()
            .filter(|&&s| elevation(station, s).to_degrees() >= 5.0)
            .count();
        assert_eq!(vis, manual);
        // A horizon mask of 90 deg admits at most one satellite (the near-zenith one);
        // usually none for a sparse 24-sat constellation at an arbitrary instant.
        assert!(visible_count(station, &sats_ecef, 90.0) <= 1);
    }

    #[test]
    fn gnss_radius_maps_to_meo_altitude() {
        // A GPS satellite orbits at ~26,560 km radius; the full TEME->ECEF->geodetic
        // chain must put an equatorial-plane point at geodetic altitude r - a
        // (~20,180 km). The R3 rotation keeps the point in the equatorial plane, so
        // the result is independent of the sidereal angle.
        let r_meo = 26_560_000.0;
        let g = ecef_to_geodetic(teme_to_ecef([r_meo, 0.0, 0.0], 2_458_849.5));
        assert!(g.lat_rad.abs() < 1e-9, "equatorial point -> latitude 0");
        assert!(
            (g.alt_m - (r_meo - WGS84_A)).abs() < 1.0,
            "MEO altitude {} km",
            g.alt_m / 1000.0
        );
    }

    #[test]
    fn satellite_overhead_via_geodetic_is_near_zenith() {
        // A satellite at the same lat/lon but higher altitude is at the zenith.
        let station = Geodetic {
            lat_rad: 0.5,
            lon_rad: 1.0,
            alt_m: 0.0,
        };
        let sat = geodetic_to_ecef(Geodetic {
            alt_m: 800_000.0,
            ..station
        });
        let la = look_angles(station, sat);
        assert!(
            (la.el_rad - PI / 2.0).abs() < 1e-6,
            "zenith elevation, got {}",
            la.el_rad
        );
        assert!((la.range_m - 800_000.0).abs() < 1e-3);
    }
}
