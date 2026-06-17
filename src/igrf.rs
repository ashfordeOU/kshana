// SPDX-License-Identifier: Apache-2.0
//! IGRF-14 geomagnetic main-field model — an alternative-PNT signal source.
//!
//! The International Geomagnetic Reference Field (IGRF) is the IAGA standard
//! spherical-harmonic model of Earth's main magnetic field. This module evaluates
//! the IGRF-14 model (degree/order 13, 2025.0 epoch + 2025–2030 secular variation;
//! coefficients in [`crate::igrf_data`], machine-generated from the official IAGA
//! `igrf14coeffs.txt` by `tools/gen_igrf.py`) at any geodetic location and date,
//! returning the field vector (north/east/down) and the derived elements
//! (declination, inclination, horizontal/total intensity).
//!
//! It is the magnetic counterpart to the gravity-map matcher in
//! [`crate::mapmatch`]: a stable, position-dependent field a GPS-denied platform
//! can match against to constrain its location (magnetic-anomaly navigation).
//!
//! Validation (self-contained, no external data): the Schmidt-normalised
//! synthesis is checked against the exact closed-form **tilted dipole** (degree-1
//! truncation), the analytic field is checked against a **finite-difference of the
//! scalar potential** for the full degree-13 model (so the Legendre derivatives
//! and the `1/sinθ` term are exercised end-to-end), the dipole axis reproduces the
//! known **geomagnetic pole** (~80.7°N) and dipole strength, and the global field
//! lies in the physical 22–67 µT band with the correct hemisphere sign.

use crate::igrf_data::{IGRF_EPOCH, IGRF_G, IGRF_GDOT, IGRF_H, IGRF_HDOT, IGRF_NMAX};

/// IGRF geomagnetic reference radius (km).
const EARTH_RADIUS_KM: f64 = 6371.2;
/// WGS-84 semi-axes squared (km²), for the geodetic→geocentric reduction.
const WGS84_A2: f64 = 6378.137 * 6378.137;
const WGS84_B2: f64 = 6356.752314245 * 6356.752314245;
const DEG: f64 = std::f64::consts::PI / 180.0;

/// The geomagnetic field at a point: the local north/east/down components (nT) and
/// the derived elements. `declination` is the angle of `horizontal` east of true
/// north; `inclination` is the dip angle below horizontal (both degrees).
#[derive(Clone, Copy, Debug, PartialEq)]
pub struct MagneticField {
    /// North component X (nT).
    pub north_nt: f64,
    /// East component Y (nT).
    pub east_nt: f64,
    /// Down component Z (nT).
    pub down_nt: f64,
    /// Horizontal intensity H = √(X²+Y²) (nT).
    pub horizontal_nt: f64,
    /// Total intensity F = √(X²+Y²+Z²) (nT).
    pub total_nt: f64,
    /// Declination D = atan2(Y, X) (degrees).
    pub declination_deg: f64,
    /// Inclination (dip) I = atan2(Z, H) (degrees).
    pub inclination_deg: f64,
}

type Mat = [[f64; 14]; 14];

/// Schmidt semi-normalised associated Legendre functions `P[n][m](cosθ)` and their
/// colatitude derivatives `dP[n][m] = dP/dθ`, via the Gauss-normalised recursion
/// plus the Schmidt conversion factor (the formulation used by the IAGA IGRF
/// synthesis). `theta` is the geocentric colatitude (radians).
fn legendre_schmidt(theta: f64) -> (Mat, Mat) {
    let (s, c) = theta.sin_cos();
    let n_max = IGRF_NMAX;
    let mut p = [[0.0_f64; 14]; 14];
    let mut dp = [[0.0_f64; 14]; 14];
    p[0][0] = 1.0;
    // Gauss-normalised recursion.
    for n in 1..=n_max {
        for m in 0..=n {
            if n == m {
                p[n][n] = s * p[n - 1][n - 1];
                dp[n][n] = s * dp[n - 1][n - 1] + c * p[n - 1][n - 1];
            } else if n == 1 {
                p[n][m] = c * p[n - 1][m];
                dp[n][m] = c * dp[n - 1][m] - s * p[n - 1][m];
            } else {
                let knm =
                    (((n - 1) * (n - 1) - m * m) as f64) / (((2 * n - 1) * (2 * n - 3)) as f64);
                p[n][m] = c * p[n - 1][m] - knm * p[n - 2][m];
                dp[n][m] = c * dp[n - 1][m] - s * p[n - 1][m] - knm * dp[n - 2][m];
            }
        }
    }
    // Schmidt quasi-normalisation factor S[n][m], built recursively, then applied.
    let mut sch = [[0.0_f64; 14]; 14];
    sch[0][0] = 1.0;
    for n in 1..=n_max {
        sch[n][0] = sch[n - 1][0] * ((2 * n - 1) as f64) / (n as f64);
        for m in 1..=n {
            let factor = ((n - m + 1) as f64) * (if m == 1 { 2.0 } else { 1.0 }) / ((n + m) as f64);
            sch[n][m] = sch[n][m - 1] * factor.sqrt();
        }
    }
    for n in 0..=n_max {
        for m in 0..=n {
            p[n][m] *= sch[n][m];
            dp[n][m] *= sch[n][m];
        }
    }
    (p, dp)
}

/// Main-field coefficients linearly extrapolated to `year` from the shipped epoch
/// using the secular variation: `g(year) = G + Ġ·(year − epoch)`.
fn coeffs_at(year: f64) -> (Mat, Mat) {
    let dt = year - IGRF_EPOCH;
    let mut g = [[0.0_f64; 14]; 14];
    let mut h = [[0.0_f64; 14]; 14];
    for n in 0..14 {
        for m in 0..14 {
            g[n][m] = IGRF_G[n][m] + IGRF_GDOT[n][m] * dt;
            h[n][m] = IGRF_H[n][m] + IGRF_HDOT[n][m] * dt;
        }
    }
    (g, h)
}

/// The geocentric field components `(B_r, B_θ, B_φ)` in nT at geocentric radius
/// `r_km`, colatitude `theta` (rad) and east longitude `phi` (rad), from the
/// supplied Schmidt coefficients. `B_r` is radially outward.
fn field_geocentric(r_km: f64, theta: f64, phi: f64, g: &Mat, h: &Mat) -> (f64, f64, f64) {
    let (p, dp) = legendre_schmidt(theta);
    let ar = EARTH_RADIUS_KM / r_km;
    let sin_theta = theta.sin();
    let (mut br, mut bt, mut bp) = (0.0, 0.0, 0.0);
    for n in 1..=IGRF_NMAX {
        let arn = ar.powi(n as i32 + 2);
        for m in 0..=n {
            let (sm, cm) = ((m as f64) * phi).sin_cos();
            let gh = g[n][m] * cm + h[n][m] * sm;
            let dgh = -g[n][m] * sm + h[n][m] * cm;
            br += arn * ((n + 1) as f64) * gh * p[n][m];
            bt += arn * gh * dp[n][m];
            bp += arn * (m as f64) * dgh * p[n][m];
        }
    }
    (br, -bt, -bp / sin_theta)
}

/// The scalar geomagnetic potential `V` (nT·km) at `(r_km, theta, phi)` from the
/// supplied coefficients. Used to validate the analytic field against `−∇V`.
#[cfg(test)]
fn scalar_potential(r_km: f64, theta: f64, phi: f64, g: &Mat, h: &Mat) -> f64 {
    let (p, _) = legendre_schmidt(theta);
    let ar = EARTH_RADIUS_KM / r_km;
    let mut v = 0.0;
    for n in 1..=IGRF_NMAX {
        let arn = ar.powi(n as i32 + 1);
        for m in 0..=n {
            let (sm, cm) = ((m as f64) * phi).sin_cos();
            v += arn * (g[n][m] * cm + h[n][m] * sm) * p[n][m];
        }
    }
    EARTH_RADIUS_KM * v
}

/// Evaluate the IGRF-14 field at a geodetic location and date. `lat_deg`/`lon_deg`
/// are geodetic latitude/east-longitude, `alt_km` the height above the WGS-84
/// ellipsoid, `year` a decimal year (the shipped model is centred on 2025.0 and
/// linearly valid through 2030 via secular variation).
pub fn magnetic_field(lat_deg: f64, lon_deg: f64, alt_km: f64, year: f64) -> MagneticField {
    let (g, h) = coeffs_at(year);
    let lat = lat_deg * DEG;
    let phi = lon_deg * DEG;
    let (slat, clat) = lat.sin_cos();

    // Geodetic → geocentric (radius r_km, and the cd/sd rotation between the
    // geodetic and geocentric verticals), following the IAGA `shval3` reduction.
    let one = WGS84_A2 * clat * clat;
    let two = WGS84_B2 * slat * slat;
    let three = one + two;
    let rho = three.sqrt();
    let r_km = (alt_km * (alt_km + 2.0 * rho) + (WGS84_A2 * one + WGS84_B2 * two) / three).sqrt();
    let cd = (alt_km + rho) / r_km;
    let sd = (WGS84_A2 - WGS84_B2) / rho * slat * clat / r_km;
    let slat_gc = slat * cd - clat * sd; // sin(geocentric latitude)
    let clat_gc = clat * cd + slat * sd; // cos(geocentric latitude)
    let theta = clat_gc.atan2(slat_gc); // geocentric colatitude

    let (br, bt, bp) = field_geocentric(r_km, theta, phi, &g, &h);
    // Geocentric north/east/down.
    let x_gc = -bt;
    let y = bp;
    let z_gc = -br;
    // Rotate the meridional components back to the geodetic vertical.
    let x = x_gc * cd + z_gc * sd;
    let z = z_gc * cd - x_gc * sd;

    let horizontal_nt = (x * x + y * y).sqrt();
    let total_nt = (horizontal_nt * horizontal_nt + z * z).sqrt();
    MagneticField {
        north_nt: x,
        east_nt: y,
        down_nt: z,
        horizontal_nt,
        total_nt,
        declination_deg: y.atan2(x) / DEG,
        inclination_deg: z.atan2(horizontal_nt) / DEG,
    }
}

/// The geomagnetic (centred-dipole) north pole for `year`: geodetic-ish latitude
/// and east longitude (degrees) of the axis where the dipole exits the northern
/// hemisphere, from the degree-1 coefficients.
pub fn geomagnetic_north_pole(year: f64) -> (f64, f64) {
    let (g, h) = coeffs_at(year);
    let (g10, g11, h11) = (g[1][0], g[1][1], h[1][1]);
    // Dipole axis colatitude from the north geographic axis.
    let colat = (g11 * g11 + h11 * h11).sqrt().atan2(-g10) / DEG;
    // atan2(h11, g11) is the azimuth of the dipole moment's horizontal projection
    // (the southern geomagnetic pole); the northern pole is the antipode in lon.
    let mut lon = h11.atan2(g11) / DEG - 180.0;
    if lon < -180.0 {
        lon += 360.0;
    }
    (90.0 - colat, lon)
}

/// The centred-dipole field strength `B₀ = √(g₁₀² + g₁₁² + h₁₁²)` (nT) for `year`.
pub fn dipole_strength_nt(year: f64) -> f64 {
    let (g, h) = coeffs_at(year);
    (g[1][0] * g[1][0] + g[1][1] * g[1][1] + h[1][1] * h[1][1]).sqrt()
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn coefficients_match_the_iaga_reference() {
        // Exact spot-checks of the 2025.0 main field + secular variation.
        assert_eq!(IGRF_G[1][0], -29350.0);
        assert_eq!(IGRF_G[1][1], -1410.3);
        assert_eq!(IGRF_H[1][1], 4545.5);
        assert_eq!(IGRF_G[2][0], -2556.2);
        assert_eq!(IGRF_GDOT[1][0], 12.6);
    }

    /// EXTERNAL-ORACLE check: the full degree-13 IGRF-14 synthesis reproduces the
    /// official British Geological Survey IGRF-14 web-service field values at epoch
    /// 2025.0 — geodetic latitude, altitude above the WGS-84 ellipsoid; Z positive
    /// down, D positive east, I positive down. Service (model_revision "14"):
    /// https://geomag.bgs.ac.uk/web_service/GMModels/igrf/14/ . BGS reports nT as
    /// integers and angles to 1e-3°, and IGRF itself is meaningful to ~1 nT, so the
    /// tolerance is a few nT / ~0.02°.
    #[test]
    fn synthesis_matches_the_official_bgs_igrf14_values_at_2025() {
        // (lat°, lon°, alt_km, X, Y, Z, F, D°, I°)
        let pts = [
            (
                0.0_f64, 0.0_f64, 0.0_f64, 27457.0, -1926.0, -15997.0, 31835.0, -4.014, -30.166,
            ),
            (
                45.0, 10.0, 0.0, 22843.0, 1451.0, 41825.0, 47678.0, 3.634, 61.310,
            ),
            (
                51.5, 0.0, 400.0, 16632.0, 69.0, 37519.0, 41040.0, 0.239, 66.093,
            ),
            (
                -33.86, 151.21, 0.0, 24040.0, 5450.0, -51381.0, 56988.0, 12.773, -64.371,
            ),
        ];
        // Agreement is sub-nT (limited only by BGS's integer-nT reporting); a 2 nT /
        // 0.02° tolerance is therefore tight, not loose.
        for (lat, lon, alt, x, y, z, f, d, i) in pts {
            let m = magnetic_field(lat, lon, alt, 2025.0);
            assert!(
                (m.north_nt - x).abs() < 2.0,
                "X at ({lat},{lon},{alt}): {} vs {x}",
                m.north_nt
            );
            assert!(
                (m.east_nt - y).abs() < 2.0,
                "Y at ({lat},{lon},{alt}): {} vs {y}",
                m.east_nt
            );
            assert!(
                (m.down_nt - z).abs() < 2.0,
                "Z at ({lat},{lon},{alt}): {} vs {z}",
                m.down_nt
            );
            assert!(
                (m.total_nt - f).abs() < 2.0,
                "F at ({lat},{lon},{alt}): {} vs {f}",
                m.total_nt
            );
            assert!(
                (m.declination_deg - d).abs() < 0.02,
                "D at ({lat},{lon},{alt}): {} vs {d}",
                m.declination_deg
            );
            assert!(
                (m.inclination_deg - i).abs() < 0.02,
                "I at ({lat},{lon},{alt}): {} vs {i}",
                m.inclination_deg
            );
        }
    }

    #[test]
    fn synthesis_matches_the_closed_form_tilted_dipole() {
        // With only the degree-1 terms, the field is an exact tilted geocentric
        // dipole. Validate the Schmidt synthesis + B-vector transform against it.
        let mut g = [[0.0_f64; 14]; 14];
        let mut h = [[0.0_f64; 14]; 14];
        g[1][0] = IGRF_G[1][0];
        g[1][1] = IGRF_G[1][1];
        h[1][1] = IGRF_H[1][1];
        let r = 6800.0;
        use std::f64::consts::FRAC_PI_2;
        for &(theta, phi) in &[(0.6, 0.3), (1.2, 2.0), (2.5, -1.1), (FRAC_PI_2, 0.0)] {
            let (br, bt, bp) = field_geocentric(r, theta, phi, &g, &h);
            let ar3 = (EARTH_RADIUS_KM / r).powi(3);
            let (st, ct) = theta.sin_cos();
            let (sp, cp) = phi.sin_cos();
            let tang = g[1][1] * cp + h[1][1] * sp;
            // Exact tilted-dipole field (the analytic −∇V of the degree-1 potential).
            let br_cf = 2.0 * ar3 * (g[1][0] * ct + tang * st);
            let bt_cf = ar3 * (g[1][0] * st - tang * ct);
            let bp_cf = ar3 * (g[1][1] * sp - h[1][1] * cp);
            assert!(
                (br - br_cf).abs() < 1e-6,
                "B_r dipole @({theta},{phi}): {br} vs {br_cf}"
            );
            assert!(
                (bt - bt_cf).abs() < 1e-6,
                "B_θ dipole @({theta},{phi}): {bt} vs {bt_cf}"
            );
            assert!(
                (bp - bp_cf).abs() < 1e-6,
                "B_φ dipole @({theta},{phi}): {bp} vs {bp_cf}"
            );
        }
    }

    #[test]
    fn analytic_field_matches_potential_gradient() {
        // Full degree-13 model: the analytic (B_r,B_θ,B_φ) must equal −∇V of the
        // scalar potential, validating the Legendre derivatives and the 1/sinθ term
        // end-to-end. Finite-difference V about a generic point.
        let (g, h) = coeffs_at(2026.3);
        let (r, theta, phi) = (6650.0, 0.9, 1.7);
        let (br, bt, bp) = field_geocentric(r, theta, phi, &g, &h);
        let dr = 1e-2;
        let da = 1e-7;
        let v = |rr, tt, pp| scalar_potential(rr, tt, pp, &g, &h);
        let dvdr = (v(r + dr, theta, phi) - v(r - dr, theta, phi)) / (2.0 * dr);
        let dvdt = (v(r, theta + da, phi) - v(r, theta - da, phi)) / (2.0 * da);
        let dvdp = (v(r, theta, phi + da) - v(r, theta, phi - da)) / (2.0 * da);
        let br_fd = -dvdr;
        let bt_fd = -dvdt / r;
        let bp_fd = -dvdp / (r * theta.sin());
        assert!((br - br_fd).abs() < 1e-4, "B_r: {br} vs FD {br_fd}");
        assert!((bt - bt_fd).abs() < 1e-4, "B_θ: {bt} vs FD {bt_fd}");
        assert!((bp - bp_fd).abs() < 1e-4, "B_φ: {bp} vs FD {bp_fd}");
    }

    #[test]
    fn geomagnetic_pole_and_dipole_strength_are_physical() {
        // The 2025.0 centred-dipole north pole sits near 80.7°N, ~-72.7°E, and the
        // dipole field strength is ~29.7 µT — the well-known IGRF values.
        let (lat, lon) = geomagnetic_north_pole(2025.0);
        assert!((lat - 80.7).abs() < 0.5, "pole lat = {lat}°N");
        assert!((lon - (-72.7)).abs() < 1.0, "pole lon = {lon}°E");
        let b0 = dipole_strength_nt(2025.0);
        assert!((b0 - 29733.0).abs() < 5.0, "B0 = {b0} nT");
    }

    #[test]
    fn field_is_physical_across_the_globe() {
        // Total intensity everywhere in the physical 22–67 µT band; the vertical
        // component points down in the northern hemisphere and up in the southern.
        for lat in (-80..=80).step_by(20) {
            for lon in (-180..180).step_by(45) {
                let f = magnetic_field(lat as f64, lon as f64, 0.0, 2025.0);
                assert!(
                    (22_000.0..67_000.0).contains(&f.total_nt),
                    "F at ({lat},{lon}) = {} nT",
                    f.total_nt
                );
            }
        }
        // Mid-northern latitude: field dips downward (positive Z, positive I).
        let north = magnetic_field(50.0, 10.0, 0.0, 2025.0);
        assert!(north.down_nt > 0.0 && north.inclination_deg > 0.0);
        // Mid-southern latitude: field points upward (negative Z, negative I).
        let south = magnetic_field(-50.0, 10.0, 0.0, 2025.0);
        assert!(south.down_nt < 0.0 && south.inclination_deg < 0.0);
    }
}
