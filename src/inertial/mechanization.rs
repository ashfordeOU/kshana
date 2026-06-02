// SPDX-License-Identifier: Apache-2.0
//! Full three-axis strapdown inertial mechanization in the local-level NED frame.
//!
//! This replaces the legacy 1-DOF scalar error-budget dead-reckoning
//! ([`crate::inertial::AccelModel`]) with a genuine three-axis navigator that
//! integrates a gyro triad and an accelerometer triad on the rotating WGS-84
//! Earth. The state is carried as [`NavState`] — a body→NED attitude quaternion,
//! an NED velocity, and a geodetic position — and advanced by [`NavState::step`].
//!
//! The mechanization is the standard terrestrial-frame NED form (Groves §5.4):
//!
//! 1. **Attitude** — the body→NED quaternion is corrected for the inertial-to-nav
//!    rate `ω_in = ω_ie + ω_en` (Earth rotation + transport rate over the
//!    ellipsoid) while the body increment is applied on the right:
//!    `q(+) = exp(-½ ζ) ⊗ q ⊗ exp(½ α)` with `α = ω_ib·dt`, `ζ = ω_in·dt`.
//! 2. **Specific force** is resolved body→NED through the DCM.
//! 3. **Velocity** integrates `v̇ = f_n − (2 ω_ie + ω_en) × v + g_n`, i.e. specific
//!    force minus the Coriolis/transport acceleration plus plumb-bob gravity.
//! 4. **Position** integrates the geodetic rates with the meridian/transverse
//!    radii of curvature.
//!
//! Gravity is the WGS-84 closed-form normal (plumb-bob) gravity with a free-air
//! altitude correction — never a hard-coded constant.
//!
//! References: P. D. Groves, *Principles of GNSS, Inertial, and Multisensor
//! Integrated Navigation Systems*, 2nd ed., §2.4 (gravity), §5.4 (NED
//! mechanization); NIMA TR8350.2 (WGS-84 gravity formula).

use super::attitude::Quaternion;
use crate::frames::{wgs84_e2, Geodetic, Vec3, WGS84_A, WGS84_F};

/// WGS-84 Earth rotation rate (rad/s).
pub const OMEGA_IE: f64 = 7.292_115e-5;

/// Normal gravity at the equator on the WGS-84 ellipsoid (m/s², Somigliana γ_e).
const GAMMA_E: f64 = 9.780_325_335_9;
/// Somigliana gravity-flattening coefficient `k = (b·γ_p − a·γ_e)/(a·γ_e)`.
const SOMIGLIANA_K: f64 = 0.001_931_852_652_41;
/// WGS-84 gravity ratio `m = ω²·a²·b / GM` (used in the free-air correction).
const GRAVITY_RATIO_M: f64 = 0.003_449_786_506_84;

#[inline]
fn cross(a: Vec3, b: Vec3) -> Vec3 {
    [
        a[1] * b[2] - a[2] * b[1],
        a[2] * b[0] - a[0] * b[2],
        a[0] * b[1] - a[1] * b[0],
    ]
}

/// WGS-84 normal (plumb-bob) gravity magnitude (m/s²) at geodetic latitude
/// `lat_rad` and altitude `alt_m`.
///
/// Surface value is the Somigliana closed form (exact on the ellipsoid); the
/// altitude dependence is the standard NIMA free-air expansion to second order
/// in `h/a`. "Gravity" here is plumb-bob gravity — gravitation plus the
/// centrifugal term — so a static accelerometer reads exactly its negative.
pub fn normal_gravity(lat_rad: f64, alt_m: f64) -> f64 {
    let sin2 = lat_rad.sin().powi(2);
    let e2 = wgs84_e2();
    let g0 = GAMMA_E * (1.0 + SOMIGLIANA_K * sin2) / (1.0 - e2 * sin2).sqrt();
    let h = alt_m;
    let a = WGS84_A;
    // Free-air correction (NIMA TR8350.2 eq. 4-3).
    let term1 = 1.0 - 2.0 / a * (1.0 + WGS84_F + GRAVITY_RATIO_M - 2.0 * WGS84_F * sin2) * h;
    let term2 = 3.0 * h * h / (a * a);
    g0 * (term1 + term2)
}

/// Meridian (north–south) radius of curvature `R_N` at latitude `lat_rad` (m).
fn radius_meridian(lat_rad: f64) -> f64 {
    let e2 = wgs84_e2();
    let s2 = lat_rad.sin().powi(2);
    WGS84_A * (1.0 - e2) / (1.0 - e2 * s2).powf(1.5)
}

/// Transverse / prime-vertical radius of curvature `R_E` at latitude `lat_rad` (m).
fn radius_transverse(lat_rad: f64) -> f64 {
    let e2 = wgs84_e2();
    let s2 = lat_rad.sin().powi(2);
    WGS84_A / (1.0 - e2 * s2).sqrt()
}

/// Strapdown navigation state in the local-level NED frame.
///
/// - `q` carries the body→NED rotation (see [`Quaternion`]).
/// - `v_ned` is the geographic velocity \[north, east, down\] (m/s).
/// - `p_llh` is the geodetic position (lat/lon rad, alt m).
#[derive(Clone, Copy, Debug)]
pub struct NavState {
    pub q: Quaternion,
    pub v_ned: Vec3,
    pub p_llh: Geodetic,
}

impl NavState {
    /// Initialise from an attitude, NED velocity, and geodetic position.
    pub fn new(q: Quaternion, v_ned: Vec3, p_llh: Geodetic) -> Self {
        Self {
            q: q.normalized(),
            v_ned,
            p_llh,
        }
    }

    /// Earth-rotation rate resolved in the current NED frame: `[ω cosL, 0, −ω sinL]`.
    fn omega_ie_n(&self) -> Vec3 {
        let l = self.p_llh.lat_rad;
        [OMEGA_IE * l.cos(), 0.0, -OMEGA_IE * l.sin()]
    }

    /// Transport rate `ω_en^n` — the turn rate of the NED frame as the platform
    /// moves over the ellipsoid.
    fn omega_en_n(&self) -> Vec3 {
        let l = self.p_llh.lat_rad;
        let h = self.p_llh.alt_m;
        let rn = radius_meridian(l);
        let re = radius_transverse(l);
        let (vn, ve) = (self.v_ned[0], self.v_ned[1]);
        [ve / (re + h), -vn / (rn + h), -ve * l.tan() / (re + h)]
    }

    /// Advance the state by `dt` seconds given a single IMU sample: the body-frame
    /// angular rate `gyro_b` (ω_ib^b, rad/s) and the body-frame specific force
    /// `accel_f_b` (f_ib^b, m/s²).
    pub fn step(&mut self, gyro_b: Vec3, accel_f_b: Vec3, dt: f64) {
        let omega_ie = self.omega_ie_n();
        let omega_en = self.omega_en_n();
        let omega_in = [
            omega_ie[0] + omega_en[0],
            omega_ie[1] + omega_en[1],
            omega_ie[2] + omega_en[2],
        ];

        // Resolve specific force through the pre-update attitude.
        let f_n = self.q.rotate(accel_f_b);

        // --- Attitude update: q(+) = exp(-½ζ) ⊗ q ⊗ exp(½α). ---
        let alpha = [gyro_b[0] * dt, gyro_b[1] * dt, gyro_b[2] * dt];
        let zeta = [omega_in[0] * dt, omega_in[1] * dt, omega_in[2] * dt];
        let neg_zeta = [-zeta[0], -zeta[1], -zeta[2]];
        let q_nav = Quaternion::from_rotation_vector(neg_zeta);
        let q_body = Quaternion::from_rotation_vector(alpha);
        let q_new = q_nav.mul(&self.q).mul(&q_body).normalized();

        // --- Velocity update: v̇ = f_n − (2ω_ie + ω_en) × v + g_n. ---
        let g = normal_gravity(self.p_llh.lat_rad, self.p_llh.alt_m);
        let rot = [
            2.0 * omega_ie[0] + omega_en[0],
            2.0 * omega_ie[1] + omega_en[1],
            2.0 * omega_ie[2] + omega_en[2],
        ];
        let cor = cross(rot, self.v_ned);
        let a_ned = [f_n[0] - cor[0], f_n[1] - cor[1], f_n[2] - cor[2] + g];
        let v_old = self.v_ned;
        let v_new = [
            v_old[0] + a_ned[0] * dt,
            v_old[1] + a_ned[1] * dt,
            v_old[2] + a_ned[2] * dt,
        ];

        // --- Position update (trapezoidal velocity over the interval). ---
        let l = self.p_llh.lat_rad;
        let h = self.p_llh.alt_m;
        let rn = radius_meridian(l);
        let re = radius_transverse(l);
        let vn = 0.5 * (v_old[0] + v_new[0]);
        let ve = 0.5 * (v_old[1] + v_new[1]);
        let vd = 0.5 * (v_old[2] + v_new[2]);
        let lat = l + dt * vn / (rn + h);
        let lon = self.p_llh.lon_rad + dt * ve / ((re + h) * l.cos());
        let alt = h - dt * vd;

        self.q = q_new;
        self.v_ned = v_new;
        self.p_llh = Geodetic {
            lat_rad: lat,
            lon_rad: lon,
            alt_m: alt,
        };
    }
}

#[cfg(test)]
mod tests {
    use super::*;
    use crate::frames::geodetic_to_ecef;
    use std::f64::consts::PI;

    fn ecef_distance(a: Geodetic, b: Geodetic) -> f64 {
        let pa = geodetic_to_ecef(a);
        let pb = geodetic_to_ecef(b);
        ((pa[0] - pb[0]).powi(2) + (pa[1] - pb[1]).powi(2) + (pa[2] - pb[2]).powi(2)).sqrt()
    }

    #[test]
    fn normal_gravity_matches_known_surface_values() {
        // WGS-84 normal gravity: equator 9.7803, pole 9.8322, ~9.806 at 45°.
        assert!((normal_gravity(0.0, 0.0) - 9.780_325).abs() < 1e-4);
        assert!((normal_gravity(PI / 2.0, 0.0) - 9.832_185).abs() < 1e-4);
        let g45 = normal_gravity(PI / 4.0, 0.0);
        assert!((g45 - 9.806_2).abs() < 1e-3, "g(45deg)={g45}");
    }

    #[test]
    fn gravity_decreases_with_altitude() {
        let g0 = normal_gravity(PI / 4.0, 0.0);
        let g100 = normal_gravity(PI / 4.0, 100_000.0);
        // ~0.3086 mGal/m free-air ⇒ ~0.3 m/s² lost over 100 km.
        assert!(g100 < g0);
        assert!((g0 - g100 - 0.307).abs() < 0.02, "drop={}", g0 - g100);
    }

    #[test]
    fn static_platform_on_rotating_earth_stays_put() {
        // A platform bolted to the Earth at 45°N, body axes aligned with NED.
        // It senses Earth rate (gyro) and 1 g upward specific force (accel).
        let lat = PI / 4.0;
        let start = Geodetic {
            lat_rad: lat,
            lon_rad: 0.2,
            alt_m: 120.0,
        };
        let mut nav = NavState::new(Quaternion::identity(), [0.0, 0.0, 0.0], start);
        // Body == NED, so the body-frame Earth rate is ω_ie^n directly.
        let gyro = [OMEGA_IE * lat.cos(), 0.0, -OMEGA_IE * lat.sin()];
        // Specific force of a static platform is −gravity: up (negative down).
        let g = normal_gravity(lat, 120.0);
        let accel = [0.0, 0.0, -g];
        let dt = 0.01;
        for _ in 0..6_000 {
            nav.step(gyro, accel, dt);
        }
        // 60 s later it must not have moved more than 1 mm or built up velocity.
        let drift = ecef_distance(start, nav.p_llh);
        let speed = (nav.v_ned[0].powi(2) + nav.v_ned[1].powi(2) + nav.v_ned[2].powi(2)).sqrt();
        assert!(drift < 1e-3, "static drift {drift} m exceeds 1 mm");
        assert!(speed < 1e-5, "static speed {speed} m/s");
    }

    #[test]
    fn level_north_specific_force_accelerates_north() {
        // Level platform at the equator; a 0.5 m/s² net north specific force
        // (above the gravity-balancing component) should give v_N ≈ a·t and a
        // northward displacement ≈ ½·a·t² (kinematics; Earth-rate/Coriolis are
        // second-order over this short, slow run).
        let lat = 0.0;
        let start = Geodetic {
            lat_rad: lat,
            lon_rad: 0.0,
            alt_m: 0.0,
        };
        let mut nav = NavState::new(Quaternion::identity(), [0.0, 0.0, 0.0], start);
        let g = normal_gravity(lat, 0.0);
        let a = 0.5;
        let accel = [a, 0.0, -g]; // north + gravity balance
        let dt = 0.001;
        let n = 10_000; // 10 s
        for _ in 0..n {
            // Feed the gyro that keeps the body aligned with the rotating NED
            // frame (Earth rate + transport rate), so the specific force stays
            // resolved as [a, 0, −g] rather than leaking through a drifting
            // attitude. At the equator: ω_in ≈ [ω_ie, −v_N/a, 0].
            let vn = nav.v_ned[0];
            let gyro = [OMEGA_IE, -vn / WGS84_A, 0.0];
            nav.step(gyro, accel, dt);
        }
        let t = n as f64 * dt;
        assert!(
            (nav.v_ned[0] - a * t).abs() < 1e-2,
            "v_N={} expected {}",
            nav.v_ned[0],
            a * t
        );
        // Northward displacement ≈ R_N · Δlat ≈ ½ a t².
        let rn = radius_meridian(lat);
        let north_disp = (nav.p_llh.lat_rad - lat) * (rn + start.alt_m);
        let expected = 0.5 * a * t * t;
        assert!(
            (north_disp - expected).abs() / expected < 1e-3,
            "north disp {north_disp} expected {expected}"
        );
        // No vertical or eastward leakage.
        assert!(nav.v_ned[2].abs() < 1e-3 && nav.v_ned[1].abs() < 1e-3);
    }

    #[test]
    fn radii_of_curvature_are_ordered_and_bounded() {
        // R_N ≤ R_E everywhere; both equal a only at the equator (R_E) / and
        // R_N < a away from the poles. Both grow toward the poles.
        for &lat_deg in &[0.0, 30.0, 60.0, 89.0] {
            let l = lat_deg * PI / 180.0;
            let rn = radius_meridian(l);
            let re = radius_transverse(l);
            assert!(rn <= re + 1.0, "R_N>{re} at {lat_deg}");
        }
        // Equator: R_E == a.
        assert!((radius_transverse(0.0) - WGS84_A).abs() < 1e-6);
    }
}
