// SPDX-License-Identifier: AGPL-3.0-only
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

use super::attitude::{coning_increment, Quaternion};
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

/// Meridian and transverse radii of curvature `(R_N, R_E)` at `lat_rad` (m).
///
/// Exposed so a closed-loop integrator can map a NED position/error increment to
/// the geodetic rates with exactly the radii the mechanization uses, keeping the
/// flat-Earth tangent-plane projection consistent with the propagation.
pub fn radii_of_curvature(lat_rad: f64) -> (f64, f64) {
    (radius_meridian(lat_rad), radius_transverse(lat_rad))
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
    pub fn omega_ie_n(&self) -> Vec3 {
        let l = self.p_llh.lat_rad;
        [OMEGA_IE * l.cos(), 0.0, -OMEGA_IE * l.sin()]
    }

    /// Transport rate `ω_en^n` — the turn rate of the NED frame as the platform
    /// moves over the ellipsoid.
    pub fn omega_en_n(&self) -> Vec3 {
        let l = self.p_llh.lat_rad;
        let h = self.p_llh.alt_m;
        let rn = radius_meridian(l);
        let re = radius_transverse(l);
        let (vn, ve) = (self.v_ned[0], self.v_ned[1]);
        [ve / (re + h), -vn / (rn + h), -ve * l.tan() / (re + h)]
    }

    /// Advance the state by `dt` seconds given a single IMU sample: the body-frame
    /// angular rate `gyro_b` (ω_ib^b, rad/s) and the body-frame specific force
    /// `accel_f_b` (f_ib^b, m/s²). A thin wrapper over [`NavState::step_increments`]
    /// with `Δθ = gyro·dt`, `Δv = accel·dt`.
    pub fn step(&mut self, gyro_b: Vec3, accel_f_b: Vec3, dt: f64) {
        let dtheta = [gyro_b[0] * dt, gyro_b[1] * dt, gyro_b[2] * dt];
        let dv = [accel_f_b[0] * dt, accel_f_b[1] * dt, accel_f_b[2] * dt];
        self.step_increments(dtheta, dv, dt);
    }

    /// Advance the state by `dt` seconds given integrated IMU **increments**: the
    /// body-frame angular increment `dtheta_b` (∫ω_ib dt, rad) and the body-frame
    /// velocity increment `dv_b` (∫f_ib dt, m/s).
    ///
    /// This is the moderate-rate (velocity/position) stage of a two-speed
    /// strapdown integration. When driven by a vibrating IMU, the caller should
    /// fold the high-rate [`coning_increment`](super::attitude::coning_increment)
    /// into `dtheta_b` and the high-rate [`sculling_increment`] into `dv_b` before
    /// calling. The within-interval rotation/sculling term `½(Δθ × Δv)` is applied
    /// here so the velocity increment is resolved consistently with the attitude
    /// that is rotating across the interval.
    pub fn step_increments(&mut self, dtheta_b: Vec3, dv_b: Vec3, dt: f64) {
        let omega_ie = self.omega_ie_n();
        let omega_en = self.omega_en_n();
        let omega_in = [
            omega_ie[0] + omega_en[0],
            omega_ie[1] + omega_en[1],
            omega_ie[2] + omega_en[2],
        ];
        let q_old = self.q;

        // --- Attitude update: q(+) = exp(-½ζ) ⊗ q ⊗ exp(½α). ---
        let zeta = [omega_in[0] * dt, omega_in[1] * dt, omega_in[2] * dt];
        let neg_zeta = [-zeta[0], -zeta[1], -zeta[2]];
        let q_nav = Quaternion::from_rotation_vector(neg_zeta);
        let q_body = Quaternion::from_rotation_vector(dtheta_b);
        let q_new = q_nav.mul(&q_old).mul(&q_body).normalized();

        // --- Velocity update. Body-frame increment with rotation/sculling
        // compensation ½(Δθ_rel × Δv), resolved through the pre-update attitude,
        // then Coriolis/transport and gravity over the interval. The rotation
        // that matters for resolving the increment into the nav frame is the
        // body's rotation *relative to* the nav frame, Δθ_rel = Δθ_b − C_n^b ζ;
        // for an Earth-fixed platform this is ≈ 0 (body and NED co-rotate), so
        // the correction correctly vanishes, while a genuine vibration triggers
        // the full sculling term. ---
        let zeta_b = q_old.conjugate().rotate(zeta);
        let dtheta_rel = [
            dtheta_b[0] - zeta_b[0],
            dtheta_b[1] - zeta_b[1],
            dtheta_b[2] - zeta_b[2],
        ];
        let dv_rot = sculling_increment(dtheta_rel, dv_b);
        let dv_body = [
            dv_b[0] + dv_rot[0],
            dv_b[1] + dv_rot[1],
            dv_b[2] + dv_rot[2],
        ];
        let dv_n = q_old.rotate(dv_body);

        let g = normal_gravity(self.p_llh.lat_rad, self.p_llh.alt_m);
        let rot = [
            2.0 * omega_ie[0] + omega_en[0],
            2.0 * omega_ie[1] + omega_en[1],
            2.0 * omega_ie[2] + omega_en[2],
        ];
        let cor = cross(rot, self.v_ned);
        let v_old = self.v_ned;
        let v_new = [
            v_old[0] + dv_n[0] - cor[0] * dt,
            v_old[1] + dv_n[1] - cor[1] * dt,
            v_old[2] + dv_n[2] + (g - cor[2]) * dt,
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

/// Within-interval rotation / sculling compensation for a body-frame velocity
/// increment: `½ (Δθ_b × Δv_b)` (Groves eq. 5.82).
///
/// When the platform rotates and accelerates simultaneously within one update
/// interval, naive resolution of the velocity increment under-integrates the
/// true specific-force integral; this cross term restores it (the velocity-side
/// analogue of the [`coning_increment`](super::attitude::coning_increment)
/// attitude correction). It vanishes when rotation and acceleration are
/// collinear.
pub fn sculling_increment(dtheta_b: Vec3, dv_b: Vec3) -> Vec3 {
    let c = cross(dtheta_b, dv_b);
    [0.5 * c[0], 0.5 * c[1], 0.5 * c[2]]
}

/// Fold the high-rate coning and sculling/rotation terms of a coarse update out of
/// its ordered high-rate sub-interval body increments `subs[i] = (Δθ_i, Δv_i)`,
/// returning the coarse `(Δθ, Δv)` to drive [`NavState::step_increments`] at the
/// moderate (coarse) rate. This is the high-rate stage of a two-speed strapdown
/// integration: a fast loop accumulates the increments and these rectifying terms
/// between the slower navigation updates.
///
/// Naive summation of the sub-increments under-integrates the motion when the body
/// vibrates within the interval — the within-interval rotation rectifies into a
/// net attitude (coning) and velocity (sculling, plus the rotation of the velocity
/// increment by the angle accumulated so far). The folded increments are
///
/// ```text
/// Δθ = Σ Δθ_i + Σ ½(Δθ_{i-1} × Δθ_i)                          (coning)
/// Δv = Σ Δv_i + Σ [ (θ_{<i} × Δv_i) + ½(Δθ_i × Δv_i) ]        (rotation + sculling)
/// ```
///
/// where `θ_{<i}` is the angle accumulated within the interval before sub-sample
/// `i`. Driving the coarse step with these recovers the vibration-rectified motion
/// a coarse step over the raw sums misses — see the `two_speed_*` validation test.
pub fn coning_sculling_compensate(subs: &[(Vec3, Vec3)]) -> (Vec3, Vec3) {
    let mut dtheta = [0.0; 3];
    let mut dv = [0.0; 3];
    let mut prev = [0.0; 3];
    let mut theta_acc = [0.0; 3];
    for (dth, dvi) in subs {
        let cone = coning_increment(prev, *dth);
        let rot = cross(theta_acc, *dvi);
        let scul = sculling_increment(*dth, *dvi);
        for k in 0..3 {
            dtheta[k] += dth[k] + cone[k];
            dv[k] += dvi[k] + rot[k] + scul[k];
            theta_acc[k] += dth[k];
        }
        prev = *dth;
    }
    (dtheta, dv)
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

    #[test]
    fn sculling_increment_properties() {
        // Collinear rotation and acceleration → no sculling.
        assert_eq!(
            sculling_increment([0.0, 0.0, 0.02], [0.0, 0.0, 1.5]),
            [0.0, 0.0, 0.0]
        );
        // Quadrature: Δθ about x, Δv along y → ½(x̂ × ŷ) = ½ ẑ scaled.
        let s = sculling_increment([0.01, 0.0, 0.0], [0.0, 2.0, 0.0]);
        assert!((s[2] - 0.5 * 0.01 * 2.0).abs() < 1e-15);
        assert!(s[0].abs() < 1e-18 && s[1].abs() < 1e-18);
    }

    #[test]
    fn step_increments_matches_rate_step_in_the_smooth_limit() {
        // With no vibration the increment form and the rate form must agree:
        // the ½(Δθ × Δv) compensation is O(dt²) and vanishes for smooth inputs.
        let start = Geodetic {
            lat_rad: 0.4,
            lon_rad: -1.1,
            alt_m: 50.0,
        };
        let gyro = [1e-3, -2e-3, 5e-4];
        let g = normal_gravity(0.4, 50.0);
        let accel = [0.2, -0.1, -g];
        let dt = 0.01;
        let mut a = NavState::new(Quaternion::identity(), [3.0, 1.0, 0.0], start);
        let mut b = a;
        for _ in 0..500 {
            a.step(gyro, accel, dt);
            b.step_increments(
                [gyro[0] * dt, gyro[1] * dt, gyro[2] * dt],
                [accel[0] * dt, accel[1] * dt, accel[2] * dt],
                dt,
            );
        }
        // Identical path (step is defined in terms of step_increments).
        assert!((a.v_ned[0] - b.v_ned[0]).abs() < 1e-12);
        assert!((a.p_llh.lat_rad - b.p_llh.lat_rad).abs() < 1e-15);
    }

    #[test]
    fn two_speed_coning_sculling_recovers_vibration_rectified_position() {
        // A coning + sculling vibration environment: the gyro rolls about the body
        // x-axis while the accelerometer drives the body z-axis *in phase with the
        // roll angle* (the configuration that rectifies, since the angle θ_x ∝ sin
        // and the specific force ∝ sin are co-phase on orthogonal axes). Their
        // within-interval cross-coupling integrates to a steady navigation-frame
        // velocity — a real motion a strapdown integrator must reproduce.
        //
        // We integrate three ways over 60 s and compare final position (ECEF):
        //  * truth   — fine rate (1 kHz), accurate.
        //  * naive   — coarse rate (one 10 Hz vibration period per step) over the
        //              raw summed sub-increments. Each coarse Δθ, Δv ≈ 0, so the
        //              coarse step cannot see the rectified motion and drifts.
        //  * folded  — same coarse rate, but the sub-increments are passed through
        //              `coning_sculling_compensate`, restoring the high-rate terms.
        //
        // The fold must cut the position error by a large factor — proving the
        // coning/sculling terms are load-bearing, not cosmetic. (The residual is a
        // genuine one-period-coarse-step error, not the rectification, so this is
        // an order-of-magnitude bound, not a millimetre one.)
        let lat = PI / 4.0;
        let p0 = Geodetic {
            lat_rad: lat,
            lon_rad: 0.0,
            alt_m: 0.0,
        };
        let q0 = Quaternion::identity();
        let (dur, dt_f, dt_c) = (60.0_f64, 0.001_f64, 0.1_f64);
        let w0 = 2.0 * PI * 10.0; // 10 Hz vibration
        let (amp_theta, amp_acc) = (0.03_f64, 0.15_f64);
        let gyro = |t: f64| [amp_theta * w0 * (w0 * t).cos(), 0.0, 0.0];
        let accel = |t: f64| [0.0, 0.0, amp_acc * (w0 * t).sin()];
        let nf = (dt_c / dt_f).round() as usize;
        let ncoarse = (dur / dt_c).round() as usize;

        // Fine-rate truth.
        let mut truth = NavState::new(q0, [0.0; 3], p0);
        for k in 0..(ncoarse * nf) {
            let t = k as f64 * dt_f;
            let g = gyro(t);
            let ac = accel(t);
            truth.step_increments(
                [g[0] * dt_f, g[1] * dt_f, g[2] * dt_f],
                [ac[0] * dt_f, ac[1] * dt_f, ac[2] * dt_f],
                dt_f,
            );
        }

        // Coarse naive and coarse folded.
        let mut naive = NavState::new(q0, [0.0; 3], p0);
        let mut folded = NavState::new(q0, [0.0; 3], p0);
        for ci in 0..ncoarse {
            let mut subs = Vec::with_capacity(nf);
            let mut sum_dth = [0.0; 3];
            let mut sum_dv = [0.0; 3];
            for k in 0..nf {
                let t = (ci * nf + k) as f64 * dt_f;
                let g = gyro(t);
                let ac = accel(t);
                let dth = [g[0] * dt_f, g[1] * dt_f, g[2] * dt_f];
                let dv = [ac[0] * dt_f, ac[1] * dt_f, ac[2] * dt_f];
                for i in 0..3 {
                    sum_dth[i] += dth[i];
                    sum_dv[i] += dv[i];
                }
                subs.push((dth, dv));
            }
            naive.step_increments(sum_dth, sum_dv, dt_c);
            let (dth_c, dv_c) = coning_sculling_compensate(&subs);
            folded.step_increments(dth_c, dv_c, dt_c);
        }

        let naive_err = ecef_distance(naive.p_llh, truth.p_llh);
        let folded_err = ecef_distance(folded.p_llh, truth.p_llh);
        // The naive coarse integrator drifts metres; the fold holds it well under
        // half a metre and at least five times better.
        assert!(naive_err > 2.0, "naive should drift, got {naive_err:.3} m");
        assert!(folded_err < 0.5, "folded error {folded_err:.3} m");
        assert!(
            naive_err > 5.0 * folded_err,
            "fold should cut error >=5x: naive {naive_err:.3} m vs folded {folded_err:.3} m",
        );
    }
}
