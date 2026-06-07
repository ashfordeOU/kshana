// SPDX-License-Identifier: Apache-2.0
//! IAU 2006 precession: Fukushima–Williams angles and the precession rotation matrix.
//!
//! The shipped TEME↔ECEF reduction in [`crate::frames`] is GMST-based (IAU 1982) and
//! adequate for ground-track and look-angle work, but it is not an inertial-frame
//! reduction to the GCRS/J2000 system. This module adds the first piece of that chain:
//! the **IAU 2006 (P03) precession** of Capitaine, Wallace & Chapront (2003), expressed
//! through the four Fukushima–Williams angles `(γ̄, φ̄, ψ̄, ε̄_A)` and the
//! bias-precession rotation matrix built from them (the same construction as SOFA's
//! `iauPfw06` + `iauFw2m`).
//!
//! Scope (honest): this is **precession only**. The IAU 2000A nutation (the 678-term
//! MHB2000 lunisolar+planetary series for `Δψ`, `Δε`), the full TEME→GCRS chain, and a
//! SOFA/ANISE numerical cross-check to the µas/<10 m level are follow-ons (see
//! `ROADMAP.md`). The angle polynomials here are transcribed from the IAU 2006
//! definition and validated against closed-form anchors (the J2000 mean obliquity, the
//! published constant terms, and the ~1.40°/century general precession), not yet against
//! SOFA at arbitrary epochs.

use crate::timescales::JD_J2000;

/// Arc seconds to radians.
const ARCSEC_TO_RAD: f64 = std::f64::consts::PI / (180.0 * 3600.0);

/// Days in a Julian century.
const DAYS_PER_CENTURY: f64 = 36_525.0;

/// A 3×3 rotation matrix (row-major).
pub type Mat3 = [[f64; 3]; 3];
/// A 3-vector.
pub type Vec3 = [f64; 3];

/// The four IAU 2006 Fukushima–Williams precession angles (radians) at a TT epoch.
#[derive(Clone, Copy, Debug)]
pub struct FwAngles {
    /// `γ̄` — F-W angle.
    pub gamma_bar: f64,
    /// `φ̄` — F-W angle.
    pub phi_bar: f64,
    /// `ψ̄` — F-W angle (the precession in longitude).
    pub psi_bar: f64,
    /// `ε̄_A` — mean obliquity of the ecliptic of date.
    pub eps_a: f64,
}

/// Julian centuries of TT elapsed since J2000.0.
pub fn julian_centuries_tt(jd_tt: f64) -> f64 {
    (jd_tt - JD_J2000) / DAYS_PER_CENTURY
}

/// Horner evaluation of `c[0] + c[1]·t + c[2]·t² + …`.
fn poly(t: f64, c: &[f64]) -> f64 {
    c.iter().rev().fold(0.0, |acc, &ci| acc * t + ci)
}

/// IAU 2006 Fukushima–Williams precession angles at TT epoch `jd_tt`
/// (Capitaine, Wallace & Chapront 2003; SOFA `iauPfw06`). The polynomials are in
/// `t` = Julian centuries of TT since J2000.0, with coefficients in arc seconds.
pub fn fw_angles(jd_tt: f64) -> FwAngles {
    let t = julian_centuries_tt(jd_tt);
    let gamb = poly(
        t,
        &[
            -0.052928,
            10.556378,
            0.4932044,
            -0.00031238,
            -0.000002788,
            0.000000026,
        ],
    );
    let phib = poly(
        t,
        &[
            84381.412819,
            -46.811016,
            0.0511268,
            0.00053289,
            -0.00000044,
            -0.0000000176,
        ],
    );
    let psib = poly(
        t,
        &[
            -0.041775,
            5038.481484,
            1.5584175,
            -0.00018522,
            -0.000026452,
            -0.0000000148,
        ],
    );
    let epsa = poly(
        t,
        &[
            84381.406,
            -46.836769,
            -0.0001831,
            0.0020034,
            -0.000000576,
            -0.0000000434,
        ],
    );
    FwAngles {
        gamma_bar: gamb * ARCSEC_TO_RAD,
        phi_bar: phib * ARCSEC_TO_RAD,
        psi_bar: psib * ARCSEC_TO_RAD,
        eps_a: epsa * ARCSEC_TO_RAD,
    }
}

/// Rotation about the x-axis by `phi` (rad), SOFA `iauRx` convention.
pub(crate) fn rx(phi: f64) -> Mat3 {
    let (s, c) = phi.sin_cos();
    [[1.0, 0.0, 0.0], [0.0, c, s], [0.0, -s, c]]
}

/// Rotation about the y-axis by `theta` (rad), SOFA `iauRy` convention.
pub(crate) fn ry(theta: f64) -> Mat3 {
    let (s, c) = theta.sin_cos();
    [[c, 0.0, -s], [0.0, 1.0, 0.0], [s, 0.0, c]]
}

/// Rotation about the z-axis by `psi` (rad), SOFA `iauRz` convention.
pub(crate) fn rz(psi: f64) -> Mat3 {
    let (s, c) = psi.sin_cos();
    [[c, s, 0.0], [-s, c, 0.0], [0.0, 0.0, 1.0]]
}

/// Matrix product `a·b`.
pub(crate) fn matmul(a: &Mat3, b: &Mat3) -> Mat3 {
    let mut r = [[0.0; 3]; 3];
    for (i, ri) in r.iter_mut().enumerate() {
        for (j, rij) in ri.iter_mut().enumerate() {
            *rij = a[i][0] * b[0][j] + a[i][1] * b[1][j] + a[i][2] * b[2][j];
        }
    }
    r
}

/// Apply a rotation matrix to a vector: `m·v`.
pub fn mat_vec(m: &Mat3, v: Vec3) -> Vec3 {
    [
        m[0][0] * v[0] + m[0][1] * v[1] + m[0][2] * v[2],
        m[1][0] * v[0] + m[1][1] * v[1] + m[1][2] * v[2],
        m[2][0] * v[0] + m[2][1] * v[1] + m[2][2] * v[2],
    ]
}

/// Transpose (= inverse, for a rotation) of a 3×3 matrix.
pub fn transpose(m: &Mat3) -> Mat3 {
    [
        [m[0][0], m[1][0], m[2][0]],
        [m[0][1], m[1][1], m[2][1]],
        [m[0][2], m[1][2], m[2][2]],
    ]
}

/// Bias-precession rotation matrix from Fukushima–Williams angles (SOFA `iauFw2m`):
/// `R = Rx(−ε̄)·Rz(−ψ̄)·Rx(φ̄)·Rz(γ̄)`. With the IAU 2006 precession angles this is the
/// GCRS → mean-equator-and-equinox-of-date (MOD) rotation; nutation is not included.
pub fn fw_matrix(a: FwAngles) -> Mat3 {
    let mut m = rz(a.gamma_bar);
    m = matmul(&rx(a.phi_bar), &m);
    m = matmul(&rz(-a.psi_bar), &m);
    matmul(&rx(-a.eps_a), &m)
}

/// IAU 2006 bias-precession matrix at TT epoch `jd_tt`: rotates a GCRS vector into the
/// mean equator and equinox of date.
pub fn precession_matrix(jd_tt: f64) -> Mat3 {
    fw_matrix(fw_angles(jd_tt))
}

/// Rotate a GCRS position into the mean equator and equinox of date (MOD).
pub fn gcrs_to_mod(v: Vec3, jd_tt: f64) -> Vec3 {
    mat_vec(&precession_matrix(jd_tt), v)
}

/// Rotate a mean-of-date (MOD) position back into the GCRS frame.
pub fn mod_to_gcrs(v: Vec3, jd_tt: f64) -> Vec3 {
    mat_vec(&transpose(&precession_matrix(jd_tt)), v)
}

#[cfg(test)]
mod tests {
    use super::*;

    const ARCSEC: f64 = ARCSEC_TO_RAD;

    #[test]
    fn mean_obliquity_at_j2000_is_iau2006_value() {
        // ε̄_A(J2000) = 84381.406″ = 23.4392794° — the IAU 2006 obliquity.
        let a = fw_angles(JD_J2000);
        let deg = a.eps_a / ARCSEC / 3600.0;
        assert!((deg - 23.43927944).abs() < 1e-7, "ε̄(J2000) = {deg}°");
    }

    #[test]
    fn fw_constant_terms_match_definition_at_j2000() {
        // At t = 0 each angle equals its published constant term (arc seconds).
        let a = fw_angles(JD_J2000);
        assert!((a.gamma_bar / ARCSEC - (-0.052_928)).abs() < 1e-9);
        assert!((a.phi_bar / ARCSEC - 84_381.412_819).abs() < 1e-6);
        assert!((a.psi_bar / ARCSEC - (-0.041_775)).abs() < 1e-9);
    }

    #[test]
    fn psi_bar_accumulates_general_precession() {
        // ψ̄ over one Julian century: −0.041775 + 5038.481484 + 1.5584175 − 0.00018522
        //   − 0.000026452 − 0.0000000148 = 5039.997915″ (general precession in longitude).
        let a = fw_angles(JD_J2000 + DAYS_PER_CENTURY);
        let psi_arcsec = a.psi_bar / ARCSEC;
        assert!(
            (psi_arcsec - 5_039.997_915).abs() < 1e-4,
            "ψ̄(1cy) = {psi_arcsec}″"
        );
    }

    #[test]
    fn precession_matrix_is_orthonormal() {
        // A proper rotation: R·Rᵀ = I and det(R) = +1, at an arbitrary epoch.
        let m = precession_matrix(JD_J2000 + 2.5 * DAYS_PER_CENTURY);
        let mt = transpose(&m);
        let p = matmul(&m, &mt);
        for (i, row) in p.iter().enumerate() {
            for (j, &pij) in row.iter().enumerate() {
                let expect = if i == j { 1.0 } else { 0.0 };
                assert!((pij - expect).abs() < 1e-12, "R·Rᵀ[{i}][{j}] = {pij}");
            }
        }
        let det = m[0][0] * (m[1][1] * m[2][2] - m[1][2] * m[2][1])
            - m[0][1] * (m[1][0] * m[2][2] - m[1][2] * m[2][0])
            + m[0][2] * (m[1][0] * m[2][1] - m[1][1] * m[2][0]);
        assert!((det - 1.0).abs() < 1e-12, "det = {det}");
    }

    #[test]
    fn matrix_at_j2000_is_near_identity_frame_bias_only() {
        // At J2000 the bias-precession matrix is just the GCRS↔J2000 frame bias —
        // off-identity only at the ~mas (sub-µrad) level, never the 23° obliquity.
        let m = precession_matrix(JD_J2000);
        for (i, row) in m.iter().enumerate() {
            for (j, &mij) in row.iter().enumerate() {
                let expect = if i == j { 1.0 } else { 0.0 };
                assert!((mij - expect).abs() < 1e-6, "R(J2000)[{i}][{j}] = {mij}");
            }
        }
    }

    #[test]
    fn one_century_rotation_angle_is_general_precession() {
        // The net rotation angle of the bias-precession matrix over one century is the
        // general precession, ≈ 50.3″/yr × 100 ≈ 1.40°. (cos θ = (tr R − 1)/2.) This
        // catches both an identity bug (θ≈0) and an un-cancelled obliquity (θ≈23°).
        let m = precession_matrix(JD_J2000 + DAYS_PER_CENTURY);
        let trace = m[0][0] + m[1][1] + m[2][2];
        let theta_deg = (((trace - 1.0) / 2.0).clamp(-1.0, 1.0)).acos().to_degrees();
        assert!(
            (1.2..1.6).contains(&theta_deg),
            "1-century precession θ = {theta_deg}°"
        );
    }

    #[test]
    fn gcrs_mod_round_trips() {
        // mod_to_gcrs ∘ gcrs_to_mod is the identity (within rounding).
        let v = [7000.0e3, -1200.0e3, 4200.0e3];
        let jd = JD_J2000 + 0.37 * DAYS_PER_CENTURY;
        let back = mod_to_gcrs(gcrs_to_mod(v, jd), jd);
        for k in 0..3 {
            assert!(
                (back[k] - v[k]).abs() < 1e-6,
                "round-trip[{k}] = {}",
                back[k]
            );
        }
        // A GCRS vector actually moves under precession (it is not a no-op).
        let moved = gcrs_to_mod(v, jd);
        let shift =
            ((moved[0] - v[0]).powi(2) + (moved[1] - v[1]).powi(2) + (moved[2] - v[2]).powi(2))
                .sqrt();
        assert!(shift > 1.0, "precession should move the vector: {shift} m");
    }
}
