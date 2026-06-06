// SPDX-License-Identifier: Apache-2.0
//! Orbital force model: two-body gravity, the zonal-harmonic field, and third-body gravity.
//!
//! This is the acceleration model a numerical propagator integrates (pair it with
//! [`crate::integrator`]): `f(t, [r; v]) = [v; a(r)]`. It provides two-body gravity, the full
//! Earth **zonal field through degree 6** ([`zonal_accel`] / [`zonal_potential`], the J2–J6
//! harmonics as the exact gradient of their disturbing potential), and **third-body**
//! point-mass perturbations ([`third_body_accel`], paired with the built-in low-precision
//! ephemerides of [`crate::ephem`]). It also exposes the **analytic J2 secular rates** — the
//! long-period drift of the right ascension of the ascending node (RAAN), the argument of
//! perigee, and the mean anomaly — the closed-form check the propagator's nodal regression
//! must reproduce, and the basis of sun-synchronous and frozen-orbit design.
//!
//! Scope (honest): the gravity field is **zonal only** (no tesseral/sectoral EGM terms), and
//! the third-body path currently supplies the Sun (the Moon's longer series, atmospheric
//! drag, and solar-radiation pressure are follow-ons; see `ROADMAP.md`).

/// Earth gravitational parameter `μ = GM` (m³/s²), WGS-84 / EGM-96 value.
pub const MU_EARTH: f64 = 3.986_004_418e14;
/// Earth equatorial radius (m), WGS-84.
pub const RE_EARTH: f64 = 6_378_137.0;
/// Second zonal harmonic coefficient `J2` (dimensionless, EGM-96).
pub const J2: f64 = 1.082_626_68e-3;
/// Third zonal harmonic `J3` (dimensionless), the standard published EGM-96 unnormalised
/// value. `J3` is the odd ("pear-shape") term that breaks north–south symmetry.
pub const J3: f64 = -2.5327e-6;
/// Fourth zonal harmonic `J4` (dimensionless, EGM-96 unnormalised).
pub const J4: f64 = -1.6196e-6;
/// Fifth zonal harmonic `J5` (dimensionless, EGM-96 unnormalised).
pub const J5: f64 = -2.2730e-7;
/// Sixth zonal harmonic `J6` (dimensionless, EGM-96 unnormalised).
pub const J6: f64 = 5.4068e-7;

/// The Earth zonal field through degree 6 as the `[J2, J3, J4, J5, J6]` slice the
/// [`zonal_accel`] / [`zonal_potential`] routines expect (index 0 = degree 2). Values are
/// the standard published EGM-96 unnormalised zonals (Vallado, *Fundamentals of
/// Astrodynamics and Applications*; Montenbruck & Gill, *Satellite Orbits*).
pub const EARTH_ZONALS_J2_J6: [f64; 5] = [J2, J3, J4, J5, J6];

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

/// Legendre polynomials `P_n(s)` and their derivatives `P_n'(s)` for `n = 0..=deg`, by the
/// standard upward recurrences `n·P_n = (2n−1)·s·P_{n−1} − (n−1)·P_{n−2}` and
/// `P_n' = s·P_{n−1}' + n·P_{n−1}`. Returns `(P, P')`.
fn legendre(s: f64, deg: usize) -> (Vec<f64>, Vec<f64>) {
    let mut p = vec![0.0; deg + 1];
    let mut dp = vec![0.0; deg + 1];
    p[0] = 1.0;
    if deg >= 1 {
        p[1] = s;
        dp[1] = 1.0;
    }
    for n in 2..=deg {
        let nf = n as f64;
        p[n] = ((2.0 * nf - 1.0) * s * p[n - 1] - (nf - 1.0) * p[n - 2]) / nf;
        dp[n] = s * dp[n - 1] + nf * p[n - 1];
    }
    (p, dp)
}

/// Zonal disturbing potential `R(r) = −(μ/r)·Σ_{n≥2} J_n·(Re/r)ⁿ·P_n(z/r)` (m²/s²) — the
/// perturbation to the central `μ/r` whose gradient is [`zonal_accel`]. `jn` is the zonal
/// coefficient slice indexed from degree 2 (`jn[0] = J2`, `jn[1] = J3`, …).
pub fn zonal_potential(r: Vec3, jn: &[f64]) -> f64 {
    let rn = norm(r);
    let s = r[2] / rn;
    let (p, _) = legendre(s, jn.len() + 1);
    let mut sum = 0.0;
    for (i, &j) in jn.iter().enumerate() {
        let n = i + 2;
        sum += j * (RE_EARTH / rn).powi(n as i32) * p[n];
    }
    -MU_EARTH / rn * sum
}

/// Perturbing acceleration `a = ∇R` (m/s², ECI) from the zonal harmonics in `jn` (indexed
/// from degree 2, so `jn = [J2, J3, …]`). Excludes the central two-body term — add
/// [`two_body_accel`] for the total. This is the exact analytic gradient of
/// [`zonal_potential`]; with `jn = [J2]` it reduces to [`j2_accel`] to machine precision.
pub fn zonal_accel(r: Vec3, jn: &[f64]) -> Vec3 {
    let rn = norm(r);
    let s = r[2] / rn;
    let (p, dp) = legendre(s, jn.len() + 1);
    // ∂s/∂x_k for s = z/r: (−z·x/r³, −z·y/r³, (r²−z²)/r³).
    let dsdx = [
        -r[2] * r[0] / rn.powi(3),
        -r[2] * r[1] / rn.powi(3),
        (rn * rn - r[2] * r[2]) / rn.powi(3),
    ];
    let mut a = [0.0; 3];
    for (i, &j) in jn.iter().enumerate() {
        let n = i + 2;
        let ni = n as i32;
        let coef = -MU_EARTH * j * RE_EARTH.powi(ni);
        // ∂/∂x_k[ r^{−(n+1)}·P_n(s) ] = −(n+1)·r^{−(n+3)}·x_k·P_n + r^{−(n+1)}·P_n'·∂s/∂x_k.
        let t1 = -(n as f64 + 1.0) * rn.powi(-(ni + 3));
        let t2 = rn.powi(-(ni + 1)) * dp[n];
        for k in 0..3 {
            a[k] += coef * (t1 * r[k] * p[n] + t2 * dsdx[k]);
        }
    }
    a
}

/// Sun gravitational parameter `GM☉` (m³/s²), IAU/DE value.
pub const MU_SUN: f64 = 1.327_124_400_18e20;
/// Moon gravitational parameter `GM☾` (m³/s²), DE value.
pub const MU_MOON: f64 = 4.902_800_066e12;

/// Third-body perturbing acceleration (m/s², ECI) on a satellite at geocentric position `r`
/// from a point-mass third body at geocentric position `s` (both m), with the body's
/// gravitational parameter `mu3`. This is the standard Earth-centred perturbation
/// `a = GM₃·( (s−r)/|s−r|³ − s/|s|³ )` — the **direct** attraction toward the body minus the
/// **indirect** term (the Earth's own acceleration toward the body, which the rotating
/// geocentric frame must subtract). It is the exact gradient of [`third_body_potential`].
pub fn third_body_accel(r: Vec3, s: Vec3, mu3: f64) -> Vec3 {
    let d = [s[0] - r[0], s[1] - r[1], s[2] - r[2]];
    let dn = norm(d);
    let sn = norm(s);
    let kd = mu3 / (dn * dn * dn);
    let ks = mu3 / (sn * sn * sn);
    [
        kd * d[0] - ks * s[0],
        kd * d[1] - ks * s[1],
        kd * d[2] - ks * s[2],
    ]
}

/// Third-body disturbing potential `R(r) = GM₃·( 1/|s−r| − (r·s)/|s|³ )` (m²/s²) whose
/// gradient `∇_r R` is [`third_body_accel`]. The `−(r·s)/|s|³` term is the indirect part.
pub fn third_body_potential(r: Vec3, s: Vec3, mu3: f64) -> f64 {
    let d = [s[0] - r[0], s[1] - r[1], s[2] - r[2]];
    let dn = norm(d);
    let sn = norm(s);
    let rs = r[0] * s[0] + r[1] * s[1] + r[2] * s[2];
    mu3 * (1.0 / dn - rs / (sn * sn * sn))
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
    fn zonal_field_with_only_j2_reduces_to_the_validated_j2_accel() {
        // The general zonal routine restricted to [J2] must reproduce the dedicated,
        // 666-vector-validated `j2_accel` to machine precision — at several asymmetric
        // points (non-zero z, off-axis), not just the equator.
        for r in [
            [7.0e6, 0.0, 0.0],
            [3.0e6, 4.0e6, 5.0e6],
            [-6.5e6, 1.2e6, -2.4e6],
        ] {
            let a = zonal_accel(r, &[J2]);
            let b = j2_accel(r);
            for k in 0..3 {
                let scale = b[k].abs().max(1e-6);
                assert!(
                    (a[k] - b[k]).abs() / scale < 1e-12,
                    "comp {k}: {a:?} vs {b:?}"
                );
            }
        }
    }

    #[test]
    fn zonal_accel_is_the_exact_gradient_of_the_zonal_potential() {
        // The strongest self-contained check: the closed-form acceleration must equal the
        // numerical gradient of the SAME potential it claims to be ∇R of — through the full
        // J2..J6 field, so it validates the odd J3 and even J4/J5/J6 terms, not only J2.
        let jn = EARTH_ZONALS_J2_J6;
        let h = 50.0; // central-difference step (m); balances truncation vs round-off at r~7e6.
        for r in [
            [6.9e6, 1.5e6, 2.0e6],
            [-4.0e6, 5.0e6, 3.2e6],
            [2.0e6, -3.0e6, 6.0e6],
        ] {
            let a = zonal_accel(r, &jn);
            for k in 0..3 {
                let mut rp = r;
                let mut rm = r;
                rp[k] += h;
                rm[k] -= h;
                let fd = (zonal_potential(rp, &jn) - zonal_potential(rm, &jn)) / (2.0 * h);
                let scale = a[k].abs().max(1e-9);
                assert!(
                    (a[k] - fd).abs() / scale < 1e-6,
                    "∇R mismatch comp {k}: analytic {} vs FD {fd}",
                    a[k]
                );
            }
        }
    }

    #[test]
    fn odd_and_even_zonals_have_their_characteristic_north_south_symmetry() {
        // A hand-derivable physical signature distinguishing the terms: the even zonal J2
        // has an even-in-z potential, so a_x stays the same and a_z flips under z→−z; the
        // odd zonal J3 has an odd-in-z potential, so a_x flips and a_z stays the same. This
        // is exactly the north–south asymmetry the pear-shape J3 term introduces.
        let north = [5.0e6, 0.0, 3.0e6];
        let south = [5.0e6, 0.0, -3.0e6];

        let a2n = zonal_accel(north, &[J2]);
        let a2s = zonal_accel(south, &[J2]);
        assert!(
            (a2n[0] - a2s[0]).abs() / a2n[0].abs() < 1e-12,
            "J2 a_x should be even in z"
        );
        assert!(
            (a2n[2] + a2s[2]).abs() / a2n[2].abs() < 1e-12,
            "J2 a_z should be odd in z"
        );

        let a3n = zonal_accel(north, &[0.0, J3]);
        let a3s = zonal_accel(south, &[0.0, J3]);
        assert!(
            (a3n[0] + a3s[0]).abs() / a3n[0].abs() < 1e-12,
            "J3 a_x should be odd in z"
        );
        assert!(
            (a3n[2] - a3s[2]).abs() / a3n[2].abs() < 1e-12,
            "J3 a_z should be even in z"
        );
    }

    #[test]
    fn third_body_accel_is_the_exact_gradient_of_its_potential() {
        // Same conservative-field gold standard as the zonals: the third-body acceleration
        // must equal the numerical gradient of its own disturbing potential, with the body
        // position s held fixed. Use a Sun-like body at ~1 AU and a satellite at LEO/MEO.
        let s = [1.3e11, 0.6e11, 0.26e11]; // ~1.46 AU... ~1 AU off-axis third body
        for r in [[6.9e6, 1.5e6, 2.0e6], [-2.0e7, 3.0e7, 1.0e7]] {
            let a = third_body_accel(r, s, MU_SUN);
            // The net perturbation (~5e-7) is the tiny difference of two ~6e-3 gradient terms,
            // so a *large* FD step is required: round-off in differencing two ~1e9 potential
            // values scales as 1/h, while truncation is negligible (the body is ~1 AU away, so
            // R is near-linear over even a 200 km step). h≈2e5 m puts round-off well below 5e-7.
            let h = 2.0e5;
            for k in 0..3 {
                let mut rp = r;
                let mut rm = r;
                rp[k] += h;
                rm[k] -= h;
                let fd = (third_body_potential(rp, s, MU_SUN)
                    - third_body_potential(rm, s, MU_SUN))
                    / (2.0 * h);
                let scale = a[k].abs().max(1e-12);
                assert!(
                    (a[k] - fd).abs() / scale < 1e-5,
                    "third-body ∇R comp {k}: analytic {} vs FD {fd}",
                    a[k]
                );
            }
        }
    }

    #[test]
    fn third_body_perturbation_vanishes_at_the_geocentre_and_has_the_textbook_magnitude() {
        // At r = 0 the direct and indirect terms cancel exactly (the satellite and the Earth
        // feel the same third-body field), so the *perturbing* acceleration is zero.
        let s = [1.471e11, 0.0, 0.0];
        let a0 = third_body_accel([0.0, 0.0, 0.0], s, MU_SUN);
        assert!(
            norm(a0) < 1e-18,
            "perturbation at geocentre should vanish: {a0:?}"
        );

        // On a LEO satellite the Sun's tidal perturbation is the textbook ~5e-7 m/s²
        // (≈ 2·GM☉·r/|s|³ along the Sun line): a real, small, third-body term.
        let r = [7.0e6, 0.0, 0.0];
        let a = norm(third_body_accel(r, s, MU_SUN));
        assert!(
            (1e-7..2e-6).contains(&a),
            "Sun perturbation on LEO {a} m/s² out of textbook band"
        );
    }

    #[test]
    fn higher_zonals_are_a_small_nonzero_correction_to_j2() {
        // J3..J6 must actually contribute (regression against a silently-J2-only field) yet
        // remain a small correction: the coefficient ratio J3/J2 ≈ 2.3e-3, further damped by
        // (Re/r)<1, so the full-field correction is ~1e-3 of the J2 perturbation here.
        let r = [4.5e6, 2.0e6, 4.8e6];
        let a_j2 = zonal_accel(r, &[J2]);
        let a_full = zonal_accel(r, &EARTH_ZONALS_J2_J6);
        let dmag = ((a_full[0] - a_j2[0]).powi(2)
            + (a_full[1] - a_j2[1]).powi(2)
            + (a_full[2] - a_j2[2]).powi(2))
        .sqrt();
        let j2mag = (a_j2[0] * a_j2[0] + a_j2[1] * a_j2[1] + a_j2[2] * a_j2[2]).sqrt();
        let ratio = dmag / j2mag;
        assert!(ratio > 1e-4, "J3..J6 must contribute, ratio = {ratio}");
        assert!(
            ratio < 5e-2,
            "J3..J6 must stay a small correction, ratio = {ratio}"
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
