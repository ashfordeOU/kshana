// SPDX-License-Identifier: Apache-2.0
//! Orbital force model: two-body gravity and the J2 oblateness perturbation.
//!
//! This is the acceleration model a numerical propagator integrates (pair it with
//! [`crate::integrator`]): `f(t, [r; v]) = [v; a(r)]` where `a = two_body + J2`. It also
//! exposes the **analytic J2 secular rates** — the long-period drift of the right
//! ascension of the ascending node (RAAN), the argument of perigee, and the mean anomaly
//! — which are the closed-form check the propagator's nodal regression must reproduce,
//! and the basis of sun-synchronous and frozen-orbit design.
//!
//! Scope (honest): two-body + J2 only. Higher zonal/tesseral harmonics (J3–J6, EGM
//! tesserals), atmospheric drag, solar-radiation pressure, and third-body (Sun/Moon)
//! accelerations are follow-ons (see `ROADMAP.md`).

/// Earth gravitational parameter `μ = GM` (m³/s²), WGS-84 / EGM-96 value.
pub const MU_EARTH: f64 = 3.986_004_418e14;
/// Earth equatorial radius (m), WGS-84.
pub const RE_EARTH: f64 = 6_378_137.0;
/// Second zonal harmonic coefficient `J2` (dimensionless, EGM-96).
pub const J2: f64 = 1.082_626_68e-3;

type Vec3 = [f64; 3];

fn norm(r: Vec3) -> f64 {
    (r[0] * r[0] + r[1] * r[1] + r[2] * r[2]).sqrt()
}

/// Two-body (point-mass) gravitational acceleration `−μ·r/|r|³` (m/s²).
pub fn two_body_accel(r: Vec3) -> Vec3 {
    let rn = norm(r);
    let k = -MU_EARTH / (rn * rn * rn);
    [k * r[0], k * r[1], k * r[2]]
}

/// J2 oblateness perturbing acceleration (m/s²), the ECI closed form
/// `a = −1.5·J2·μ·Re²/r⁵ · [x(1−5z²/r²), y(1−5z²/r²), z(3−5z²/r²)]`.
pub fn j2_accel(r: Vec3) -> Vec3 {
    let rn = norm(r);
    let r2 = rn * rn;
    let zr2 = 5.0 * r[2] * r[2] / r2;
    let c = -1.5 * J2 * MU_EARTH * RE_EARTH * RE_EARTH / rn.powi(5);
    [
        c * r[0] * (1.0 - zr2),
        c * r[1] * (1.0 - zr2),
        c * r[2] * (3.0 - zr2),
    ]
}

/// Total modelled acceleration: two-body plus J2.
pub fn gravity_accel(r: Vec3) -> Vec3 {
    let a = two_body_accel(r);
    let b = j2_accel(r);
    [a[0] + b[0], a[1] + b[1], a[2] + b[2]]
}

/// Mean motion `n = √(μ/a³)` (rad/s) for semi-major axis `a` (m).
pub fn mean_motion(a: f64) -> f64 {
    (MU_EARTH / (a * a * a)).sqrt()
}

/// The three first-order J2 secular rates (rad/s) of a Keplerian orbit with
/// semi-major axis `a` (m), eccentricity `e`, inclination `i` (rad): the drift of
/// `(RAAN Ω̇, argument of perigee ω̇, mean anomaly Ṁ)` (Vallado, *Fundamentals of
/// Astrodynamics and Applications*).
#[derive(Clone, Copy, Debug)]
pub struct SecularRates {
    /// `Ω̇` — nodal regression (rad/s).
    pub raan: f64,
    /// `ω̇` — apsidal rotation (rad/s).
    pub arg_perigee: f64,
    /// `Ṁ` — secular mean-anomaly rate beyond the Keplerian `n` (rad/s).
    pub mean_anomaly: f64,
}

/// Compute the J2 secular rates for the given orbit.
pub fn j2_secular_rates(a: f64, e: f64, i_rad: f64) -> SecularRates {
    let n = mean_motion(a);
    let p = a * (1.0 - e * e);
    let factor = n * J2 * (RE_EARTH / p).powi(2);
    let (si, ci) = i_rad.sin_cos();
    let sin2 = si * si;
    SecularRates {
        raan: -1.5 * factor * ci,
        arg_perigee: 1.5 * factor * (2.0 - 2.5 * sin2),
        mean_anomaly: 1.5 * factor * (1.0 - e * e).sqrt() * (1.0 - 1.5 * sin2),
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn two_body_acceleration_is_mu_over_r_squared() {
        // At 7000 km along +x, |a| = μ/r² directed toward Earth (−x).
        let r = [7.0e6, 0.0, 0.0];
        let a = two_body_accel(r);
        let expect = MU_EARTH / (7.0e6 * 7.0e6); // ≈ 8.135 m/s²
        assert!((a[0] + expect).abs() / expect < 1e-12, "ax = {}", a[0]);
        assert!(a[1].abs() < 1e-12 && a[2].abs() < 1e-12);
        assert!((expect - 8.1347).abs() < 1e-3, "|a| = {expect}");
    }

    #[test]
    fn j2_acceleration_matches_closed_form_at_equator() {
        // Equatorial point (z=0): a_J2 = −1.5·J2·μ·Re²/r⁵·[x,0,0]. Hand value ≈ 0.01097 m/s².
        let r = [7.0e6, 0.0, 0.0];
        let a = j2_accel(r);
        assert!((a[0] + 0.010_967).abs() < 1e-5, "a_J2x = {}", a[0]);
        assert!(a[1].abs() < 1e-15 && a[2].abs() < 1e-15);
        // J2 is a small perturbation: ~10⁻³ of the two-body term (the (Re/r)²·J2 ratio).
        let ratio = a[0].abs() / two_body_accel(r)[0].abs();
        assert!(ratio < 2e-3 && ratio > 1e-3, "J2/two-body = {ratio}");
    }

    #[test]
    fn critical_inclination_freezes_the_perigee() {
        // ω̇ = 0 at the critical inclination i = arcsin(√(4/5)) ≈ 63.4349° (2 − 2.5·sin²i = 0).
        let a = 7.0e6;
        let crit = (0.8_f64).sqrt().asin();
        let rates = j2_secular_rates(a, 0.001, crit);
        assert!(
            rates.arg_perigee.abs() < 1e-12,
            "ω̇ = {} at critical i",
            rates.arg_perigee
        );
        // Below the critical inclination the perigee advances (ω̇ > 0); above, it regresses.
        assert!(j2_secular_rates(a, 0.001, 0.5).arg_perigee > 0.0);
        assert!(j2_secular_rates(a, 0.001, 1.2).arg_perigee < 0.0);
    }

    #[test]
    fn iss_nodal_regression_is_about_minus_five_degrees_per_day() {
        // ISS-like: a ≈ 6790 km, e ≈ 0, i = 51.6°. RAAN regresses westward ~ −5°/day.
        let rates = j2_secular_rates(6.790e6, 0.0007, 51.6_f64.to_radians());
        let deg_per_day = rates.raan.to_degrees() * 86_400.0;
        assert!(
            (deg_per_day - (-5.0)).abs() < 0.6,
            "Ω̇ = {deg_per_day} °/day"
        );
    }

    #[test]
    fn sun_synchronous_inclination_drifts_eastward() {
        // A retrograde (i > 90°) orbit gives cos i < 0, so Ω̇ > 0 — the eastward nodal
        // drift that a sun-synchronous orbit tunes to +0.9856°/day (≈ 1.991e-7 rad/s).
        let rates = j2_secular_rates(7.078e6, 0.0, 98.0_f64.to_radians());
        assert!(rates.raan > 0.0, "Ω̇ should be eastward: {}", rates.raan);
    }
}
