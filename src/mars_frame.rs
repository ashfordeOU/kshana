// SPDX-License-Identifier: Apache-2.0
//! IAU 2009 Mars body-fixed orientation — the rotation from Mars-centred inertial (≈J2000/ICRF)
//! to the Mars body-fixed frame.
//!
//! Mars has a constant pole (the IAU 2009/WGCCRE Mars model carries no periodic nutation terms,
//! unlike the Moon's libration series), so the orientation is fully described by the fixed pole
//! right ascension `α₀` and declination `δ₀` plus the linearly-advancing prime meridian
//!
//! ```text
//!   α₀ = 317.681°            (constant)
//!   δ₀ =  52.886°            (constant)
//!   W  = 176.630° + 350.89198226°/day · (jd_tdb − JD_J2000)
//! ```
//!
//! The body-fixed rotation is the standard IAU 3-1-3 sequence
//! `R = R_z(W)·R_x(90°−δ₀)·R_z(90°+α₀)`, so `r_bodyfixed = R · r_inertial` — the same
//! inertial→body-fixed convention [`crate::lunar_frame::icrf_to_iau_moon`] uses for the Moon and
//! [`crate::cio::gcrs_to_itrs_matrix`] uses for the Earth, so the geopotential evaluation path
//! ([`crate::gravity_sh`]) is reused unchanged: rotate the inertial position in, evaluate the
//! Mars-fixed field, rotate the acceleration back.
//!
//! The pole and prime-meridian constants are read from the [`Body`] passed in
//! ([`Body::mars`](crate::body::Body::mars) carries the IAU 2009 Mars values), so this works for
//! any rotating body whose `pole_ra0`/`pole_dec0`/`prime_w0`/`prime_w_dot` are populated.
//!
//! ## Scope (honest)
//!
//! This realizes the *mean* IAU 2009 Mars orientation (the published `BODY499_*` linear model,
//! NAIF generic PCK). Mars carries no IAU periodic-pole terms, so unlike the lunar frame there is
//! no libration/nutation series to approximate; the residual is the difference between the linear
//! IAU model and a numerically-integrated Mars orientation, well below the gravity-field accuracy
//! at this degree. TDB is approximated by TT (sub-2-ms agreement, a sub-µas orientation error).

use crate::body::Body;
use crate::precession::{mat_vec, transpose, Mat3};

type Vec3 = [f64; 3];

/// Julian Date of the J2000.0 epoch — the reference instant the prime-meridian advance `Ẇ` is
/// measured from.
const JD_J2000: f64 = 2_451_545.0;

/// Frame rotation about +z by `theta` (rotates the coordinate axes; the
/// [`crate::lunar_frame`]/`crate::lunar::rot3` convention).
fn rz(theta: f64) -> Mat3 {
    let (s, c) = theta.sin_cos();
    [[c, s, 0.0], [-s, c, 0.0], [0.0, 0.0, 1.0]]
}

/// Frame rotation about +x by `theta`.
fn rx(theta: f64) -> Mat3 {
    let (s, c) = theta.sin_cos();
    [[1.0, 0.0, 0.0], [0.0, c, s], [0.0, -s, c]]
}

/// 3×3 matrix product `a·b`.
fn matmul(a: &Mat3, b: &Mat3) -> Mat3 {
    let mut m = [[0.0; 3]; 3];
    for (i, mrow) in m.iter_mut().enumerate() {
        for (j, e) in mrow.iter_mut().enumerate() {
            *e = a[i][0] * b[0][j] + a[i][1] * b[1][j] + a[i][2] * b[2][j];
        }
    }
    m
}

/// The Mars prime-meridian angle `W` (radians) at `jd_tdb`, from the body's epoch value
/// `prime_w0` and rate `prime_w_dot` (rad/day): `W = W₀ + Ẇ·(jd_tdb − J2000)`. Not reduced to
/// `[0, 2π)` (the rotation builder takes sin/cos).
pub fn mars_prime_meridian(body: &Body, jd_tdb: f64) -> f64 {
    body.prime_w0 + body.prime_w_dot * (jd_tdb - JD_J2000)
}

/// The rotation from Mars-centred inertial (≈J2000/ICRF) to the Mars body-fixed frame at
/// `jd_tdb`, as the IAU 3-1-3 sequence `R_z(W)·R_x(90°−δ₀)·R_z(90°+α₀)` built from the body's
/// fixed pole `(pole_ra0, pole_dec0)` and the prime meridian `W` of [`mars_prime_meridian`].
/// Apply with [`crate::precession::mat_vec`]: `r_bodyfixed = R · r_inertial`; the inverse
/// (body-fixed → inertial) is its transpose. The rows of `R` are the Mars-fixed axes expressed
/// in ICRF, so row 2 is the Mars pole `(cos δ₀ cos α₀, cos δ₀ sin α₀, sin δ₀)`.
pub fn iau_mars_rotation(body: &Body, jd_tdb: f64) -> Mat3 {
    let ra = body.pole_ra0;
    let dec = body.pole_dec0;
    let w = mars_prime_meridian(body, jd_tdb);
    let half_pi = std::f64::consts::FRAC_PI_2;
    // R = Rz(W) · Rx(90°−δ) · Rz(90°+α).
    matmul(&matmul(&rz(w), &rx(half_pi - dec)), &rz(half_pi + ra))
}

/// Rotate an inertial position (≈J2000/ICRF, Mars-centred) into the Mars body-fixed frame at
/// `jd_tdb`: `r_bodyfixed = R · r_inertial`.
pub fn inertial_to_bodyfixed(r_inertial: Vec3, body: &Body, jd_tdb: f64) -> Vec3 {
    mat_vec(&iau_mars_rotation(body, jd_tdb), r_inertial)
}

/// Rotate a Mars body-fixed vector back into the inertial frame at `jd_tdb`:
/// `r_inertial = Rᵀ · r_bodyfixed`. Used to carry a body-fixed gravity acceleration back to the
/// inertial integration frame.
pub fn bodyfixed_to_inertial(r_bodyfixed: Vec3, body: &Body, jd_tdb: f64) -> Vec3 {
    mat_vec(&transpose(&iau_mars_rotation(body, jd_tdb)), r_bodyfixed)
}

#[cfg(test)]
mod tests {
    use super::*;

    fn norm(v: Vec3) -> f64 {
        (v[0] * v[0] + v[1] * v[1] + v[2] * v[2]).sqrt()
    }

    /// A body-fixed orientation must be a proper rotation: Rᵀ·R = I (to 1e-12) and det = +1.
    #[test]
    fn rotation_is_orthonormal_and_proper() {
        let body = Body::mars();
        let jd = 2_459_580.5; // 2022-01-01 00:00
        let m = iau_mars_rotation(&body, jd);
        let mt = transpose(&m);
        let prod = matmul(&mt, &m);
        for (i, row) in prod.iter().enumerate() {
            for (j, &e) in row.iter().enumerate() {
                let want = if i == j { 1.0 } else { 0.0 };
                assert!(
                    (e - want).abs() < 1e-12,
                    "RᵀR[{i}][{j}] = {e} (want {want})"
                );
            }
        }
        let det = m[0][0] * (m[1][1] * m[2][2] - m[1][2] * m[2][1])
            - m[0][1] * (m[1][0] * m[2][2] - m[1][2] * m[2][0])
            + m[0][2] * (m[1][0] * m[2][1] - m[1][1] * m[2][0]);
        assert!(
            (det - 1.0).abs() < 1e-12,
            "det = {det} (want +1, proper rotation)"
        );
    }

    /// Applying the rotation then its transpose returns the original vector (round-trip), and the
    /// helpers `inertial_to_bodyfixed`/`bodyfixed_to_inertial` are exact inverses.
    #[test]
    fn round_trip_recovers_the_original_vector() {
        let body = Body::mars();
        let jd = 2_459_580.5;
        let r = [1.50e6, -0.70e6, 0.95e6];
        let bf = inertial_to_bodyfixed(r, &body, jd);
        let back = bodyfixed_to_inertial(bf, &body, jd);
        for k in 0..3 {
            assert!(
                (back[k] - r[k]).abs() < 1e-6,
                "axis {k}: round-trip {} vs original {}",
                back[k],
                r[k]
            );
        }
        // The rotation preserves length (it is an isometry).
        assert!(
            (norm(bf) - norm(r)).abs() < 1e-6,
            "rotation must preserve length"
        );
    }

    /// The matrix is inertial→body-fixed, so its row 2 is the Mars pole expressed in ICRF:
    /// `(cos δ₀ cos α₀, cos δ₀ sin α₀, sin δ₀)`. This ties the 3-1-3 assembly to `(α₀, δ₀)`, and
    /// the pole is constant in time (Mars has no IAU periodic-pole terms).
    #[test]
    fn pole_row_matches_ra_dec_and_is_constant() {
        let body = Body::mars();
        let (ra, dec) = (body.pole_ra0, body.pole_dec0);
        let want = [dec.cos() * ra.cos(), dec.cos() * ra.sin(), dec.sin()];
        for &jd in &[JD_J2000, 2_459_580.5, JD_J2000 + 1000.0] {
            let m = iau_mars_rotation(&body, jd);
            let pole = [m[2][0], m[2][1], m[2][2]];
            for k in 0..3 {
                assert!(
                    (pole[k] - want[k]).abs() < 1e-12,
                    "jd {jd} pole[{k}] {} vs {}",
                    pole[k],
                    want[k]
                );
            }
        }
        // Physical sanity: the IAU 2009 Mars pole is RA ≈ 317.68°, Dec ≈ 52.89°.
        assert!((ra.to_degrees() - 317.681).abs() < 1e-3);
        assert!((dec.to_degrees() - 52.886).abs() < 1e-3);
    }

    /// `W` advances by exactly `prime_w_dot` per day, so the rotation at `jd` and `jd+1` differ by
    /// the expected Mars spin angle (≈ 350.89198°/day, just over one sidereal Mars day).
    #[test]
    fn prime_meridian_advances_by_w_dot_per_day() {
        let body = Body::mars();
        let jd = 2_459_580.5;
        let dw =
            (mars_prime_meridian(&body, jd + 1.0) - mars_prime_meridian(&body, jd)).to_degrees();
        assert!(
            (dw - 350.891_982_26).abs() < 1e-9,
            "W rate {dw}°/day (want 350.89198226)"
        );

        // And the rotation itself reorients by that angle: a vector fixed in inertial space, seen
        // in the body-fixed frame, rotates about the pole by Ẇ between jd and jd+1. Equivalently,
        // applying R(jd+1)·R(jd)ᵀ to a body-fixed vector is a rotation by Ẇ about +z (the pole).
        let spin = matmul(
            &iau_mars_rotation(&body, jd + 1.0),
            &transpose(&iau_mars_rotation(&body, jd)),
        );
        // The trace of a rotation by angle θ about any axis is 1 + 2cos θ.
        let trace = spin[0][0] + spin[1][1] + spin[2][2];
        let theta = ((trace - 1.0) / 2.0).acos().to_degrees();
        // 350.892° is equivalent to a −9.108° rotation; acos gives the unsigned 9.108°.
        let expected = (360.0 - 350.891_982_26_f64).abs();
        assert!(
            (theta - expected).abs() < 1e-6,
            "spin angle {theta}° between jd and jd+1 (want {expected})"
        );
    }
}
