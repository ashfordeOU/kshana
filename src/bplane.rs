// SPDX-License-Identifier: AGPL-3.0-only
//! Hyperbolic-flyby **B-plane targeting** and **patched-conic gravity assist**.
//!
//! A flyby is a hyperbolic encounter in the body-centred frame. Its geometry is fixed by
//! the gravitational parameter `μ`, the hyperbolic-excess speed `v∞` (the speed far from
//! the body, where the trajectory is asymptotic), and the periapsis radius `r_p`:
//!
//! ```text
//!   a = −μ / v∞²                 (semi-major axis, negative for a hyperbola)
//!   e = 1 + r_p · v∞² / μ        (eccentricity, > 1)
//!   δ = 2·asin(1/e)              (turn / deflection angle)
//!   |B| = |a|·√(e²−1) = r_p·√((e+1)/(e−1))   (impact parameter = semi-minor axis)
//! ```
//!
//! The **B-plane** is the plane through the body centre perpendicular to the incoming
//! asymptote `Ŝ`. With a reference pole `p̂`, the in-plane axes are `T̂ = Ŝ × p̂` (unit)
//! and `R̂ = Ŝ × T̂`; the aim point is given by the two scalars `B·T̂`, `B·R̂`, and
//! `|B|² = (B·T̂)² + (B·R̂)²`.
//!
//! In a **gravity assist**, the body-relative speed `|v∞|` is conserved while its
//! direction rotates by `δ` in the flyby plane. In the heliocentric frame the spacecraft
//! velocity is `v = v_planet + v∞`, so the assist imparts
//! `Δv = v∞_out − v∞_in` with magnitude `2·v∞·sin(δ/2)` (≤ `2·v∞`, the head-on limit) at
//! **no propellant cost**. The energy is borrowed from the planet's heliocentric motion;
//! the conserved bookkeeping quantity is the **Tisserand parameter** with respect to the
//! planet's (circular) orbit of radius `a_P`,
//!
//! ```text
//!   T_P = a_P/a + 2·√((a/a_P)(1−e²))·cos i,        with   v∞² = v_circ²·(3 − T_P),
//! ```
//!
//! which is invariant across the encounter because `|v∞|` is.
//!
//! Scope (honest): patched-conic two-body flyby on a circular planetary orbit — no
//! finite-sphere-of-influence transition modelling, no third-body perturbations during
//! the encounter, and no ephemeris. It is a MODELLED capability whose reference tests
//! check the closed-form flyby identities, the B-plane decomposition, and Tisserand
//! invariance across a v∞-preserving deflection — internal-consistency oracles, not an
//! external dataset.
//!
//! References:
//! - R. H. Battin, *An Introduction to the Mathematics and Methods of Astrodynamics*,
//!   rev. ed., AIAA 1999, §6 (hyperbolic orbits, the B-plane).
//! - D. A. Vallado, *Fundamentals of Astrodynamics and Applications*, 4th ed., §12
//!   (interplanetary trajectories, gravity assist, the Tisserand criterion).

use crate::frames::Vec3;

fn dot(a: Vec3, b: Vec3) -> f64 {
    a[0] * b[0] + a[1] * b[1] + a[2] * b[2]
}
fn cross(a: Vec3, b: Vec3) -> Vec3 {
    [
        a[1] * b[2] - a[2] * b[1],
        a[2] * b[0] - a[0] * b[2],
        a[0] * b[1] - a[1] * b[0],
    ]
}
fn norm(a: Vec3) -> f64 {
    dot(a, a).sqrt()
}
fn unit(a: Vec3) -> Vec3 {
    let n = norm(a);
    [a[0] / n, a[1] / n, a[2] / n]
}
fn sub(a: Vec3, b: Vec3) -> Vec3 {
    [a[0] - b[0], a[1] - b[1], a[2] - b[2]]
}

/// Hyperbolic semi-major axis `a = −μ/v∞²` (m; negative). `v_inf` is the
/// hyperbolic-excess speed (m/s).
pub fn hyperbolic_sma(mu: f64, v_inf: f64) -> f64 {
    -mu / (v_inf * v_inf)
}

/// Flyby eccentricity `e = 1 + r_p·v∞²/μ` (> 1) for periapsis radius `r_p` (m).
pub fn flyby_eccentricity(mu: f64, v_inf: f64, r_p: f64) -> f64 {
    1.0 + r_p * v_inf * v_inf / mu
}

/// Turn (deflection) angle `δ = 2·asin(1/e)` (rad) for flyby eccentricity `e`.
pub fn turn_angle(e: f64) -> f64 {
    2.0 * (1.0 / e).asin()
}

/// Impact parameter (B-plane aim radius) `|B| = |a|·√(e²−1)` (m).
pub fn impact_parameter(mu: f64, v_inf: f64, r_p: f64) -> f64 {
    let a = hyperbolic_sma(mu, v_inf);
    let e = flyby_eccentricity(mu, v_inf, r_p);
    a.abs() * (e * e - 1.0).sqrt()
}

/// Rotate `v` by angle `delta` about the unit axis `axis` (Rodrigues' rotation). Used to
/// deflect the incoming `v∞` into the outgoing `v∞` across a flyby.
pub fn deflect(v: Vec3, delta: f64, axis: Vec3) -> Vec3 {
    let k = unit(axis);
    let (s, c) = (delta.sin(), delta.cos());
    let kv = dot(k, v);
    // v·cosδ + (k×v)·sinδ + k·(k·v)·(1−cosδ)
    let kxv = cross(k, v);
    [
        v[0] * c + kxv[0] * s + k[0] * kv * (1.0 - c),
        v[1] * c + kxv[1] * s + k[1] * kv * (1.0 - c),
        v[2] * c + kxv[2] * s + k[2] * kv * (1.0 - c),
    ]
}

/// The heliocentric velocity change imparted by a flyby: `Δv = v∞_out − v∞_in` (the
/// planet velocity cancels). Its magnitude is `2·v∞·sin(δ/2)`.
pub fn assist_delta_v(v_inf_in: Vec3, v_inf_out: Vec3) -> Vec3 {
    sub(v_inf_out, v_inf_in)
}

/// Construct the B-plane in-plane axes `(T̂, R̂)` from the incoming-asymptote unit
/// vector `s_hat` and a reference pole `pole`: `T̂ = Ŝ × p̂` (unit), `R̂ = Ŝ × T̂`.
pub fn bplane_frame(s_hat: Vec3, pole: Vec3) -> (Vec3, Vec3) {
    let t = unit(cross(s_hat, pole));
    let r = cross(s_hat, t);
    (t, r)
}

/// Decompose a B-vector onto the B-plane axes: `(B·T̂, B·R̂)`.
pub fn bplane_components(b_vec: Vec3, t_hat: Vec3, r_hat: Vec3) -> (f64, f64) {
    (dot(b_vec, t_hat), dot(b_vec, r_hat))
}

/// Heliocentric osculating elements `(a, e, i)` from a state `(r, v)` and `μ`:
/// `a` (vis-viva, m), `e` (eccentricity-vector magnitude), `i` (rad, from the reference
/// plane). Two-body; valid for a bound (`a > 0`) heliocentric arc.
pub fn elements_aei(r: Vec3, v: Vec3, mu: f64) -> (f64, f64, f64) {
    let rm = norm(r);
    let v2 = dot(v, v);
    let a = 1.0 / (2.0 / rm - v2 / mu);
    let h = cross(r, v);
    let hm = norm(h);
    let i = (h[2] / hm).acos();
    // eccentricity vector e = ((v²−μ/r)·r − (r·v)·v)/μ
    let rv = dot(r, v);
    let e_vec = [
        ((v2 - mu / rm) * r[0] - rv * v[0]) / mu,
        ((v2 - mu / rm) * r[1] - rv * v[1]) / mu,
        ((v2 - mu / rm) * r[2] - rv * v[2]) / mu,
    ];
    (a, norm(e_vec), i)
}

/// Tisserand parameter with respect to a planet on a circular orbit of radius `a_planet`:
/// `T_P = a_P/a + 2·√((a/a_P)(1−e²))·cos i`. Conserved across a patched-conic flyby
/// because it is a function of the (invariant) `v∞` alone.
pub fn tisserand(a_sc: f64, e_sc: f64, i_sc: f64, a_planet: f64) -> f64 {
    a_planet / a_sc + 2.0 * (a_sc / a_planet * (1.0 - e_sc * e_sc)).sqrt() * i_sc.cos()
}

#[cfg(test)]
mod tests {
    use super::*;
    use std::f64::consts::PI;

    fn approx(a: f64, b: f64, tol: f64) -> bool {
        (a - b).abs() <= tol
    }

    // Earth-ish μ (m³/s²) for the flyby-scalar tests.
    const MU: f64 = 3.986_004_418e14;

    #[test]
    fn flyby_scalars_satisfy_the_closed_forms() {
        let v_inf = 3000.0; // m/s
        let r_p = 7.0e6; // m
        let a = hyperbolic_sma(MU, v_inf);
        assert!(a < 0.0, "hyperbolic a must be negative");
        assert!(approx(a, -MU / (v_inf * v_inf), 1e-3));
        let e = flyby_eccentricity(MU, v_inf, r_p);
        assert!(e > 1.0, "flyby must be hyperbolic, e={e}");
        // turn angle identity sin(δ/2) = 1/e.
        let delta = turn_angle(e);
        assert!(approx((delta / 2.0).sin(), 1.0 / e, 1e-12));
        // impact parameter: two closed forms agree.
        let b1 = impact_parameter(MU, v_inf, r_p);
        let b2 = r_p * ((e + 1.0) / (e - 1.0)).sqrt();
        assert!(approx(b1, b2, 1e-3), "|B|: {b1} vs {b2}");
        assert!(b1 > r_p, "gravitational focusing ⇒ |B| > r_p");
    }

    #[test]
    fn turn_angle_decreases_with_periapsis_radius() {
        let v_inf = 2500.0;
        let close = turn_angle(flyby_eccentricity(MU, v_inf, 6.6e6));
        let far = turn_angle(flyby_eccentricity(MU, v_inf, 5.0e7));
        assert!(close > far, "closer flyby must deflect more: {close} vs {far}");
        // limits: r_p → ∞ ⇒ δ → 0; e → 1⁺ ⇒ δ → π.
        assert!(turn_angle(flyby_eccentricity(MU, v_inf, 1.0e12)) < 1e-3);
        assert!(turn_angle(1.0 + 1e-9) > PI - 1e-3);
    }

    #[test]
    fn deflection_preserves_speed_and_rotates_by_delta() {
        let v_in: Vec3 = [3000.0, 500.0, -200.0];
        let axis: Vec3 = [0.2, -0.4, 1.0];
        // axis component along v is irrelevant; use the perpendicular plane normal.
        let normal = unit(cross(v_in, axis));
        let delta = 0.7;
        let v_out = deflect(v_in, delta, normal);
        assert!(approx(norm(v_out), norm(v_in), 1e-6), "speed not preserved");
        let ang = (dot(v_in, v_out) / (norm(v_in) * norm(v_out))).acos();
        assert!(approx(ang, delta, 1e-9), "rotation angle {ang} vs {delta}");
    }

    #[test]
    fn assist_delta_v_magnitude_is_two_vinf_sin_half_delta() {
        let v_inf = 4000.0;
        let v_in: Vec3 = [v_inf, 0.0, 0.0];
        let normal: Vec3 = [0.0, 0.0, 1.0];
        for &delta in &[0.3_f64, 1.0, 2.0, PI] {
            let v_out = deflect(v_in, delta, normal);
            let dv = norm(assist_delta_v(v_in, v_out));
            assert!(
                approx(dv, 2.0 * v_inf * (delta / 2.0).sin(), 1e-6),
                "Δv {dv} vs {}",
                2.0 * v_inf * (delta / 2.0).sin()
            );
            assert!(dv <= 2.0 * v_inf + 1e-6, "Δv exceeds the head-on limit");
        }
    }

    #[test]
    fn bplane_frame_is_orthonormal_and_decomposes_b() {
        let s_hat = unit([1.0, 0.3, -0.5]);
        let pole: Vec3 = [0.0, 0.0, 1.0];
        let (t, r) = bplane_frame(s_hat, pole);
        // orthonormal and both perpendicular to S.
        assert!(approx(norm(t), 1.0, 1e-12) && approx(norm(r), 1.0, 1e-12));
        assert!(approx(dot(t, r), 0.0, 1e-12));
        assert!(approx(dot(t, s_hat), 0.0, 1e-12) && approx(dot(r, s_hat), 0.0, 1e-12));
        // a B-vector in the plane decomposes with |B|² = (B·T)² + (B·R)².
        let b_vec = [
            3.0 * t[0] + 4.0 * r[0],
            3.0 * t[1] + 4.0 * r[1],
            3.0 * t[2] + 4.0 * r[2],
        ];
        let (bt, br) = bplane_components(b_vec, t, r);
        assert!(approx(bt, 3.0, 1e-9) && approx(br, 4.0, 1e-9));
        assert!(approx(norm(b_vec) * norm(b_vec), bt * bt + br * br, 1e-9));
    }

    #[test]
    fn tisserand_is_invariant_across_a_vinf_preserving_deflection() {
        // Normalised system: μ_sun = 1, planet circular orbit a_P = 1 ⇒ v_circ = 1.
        let mu_sun = 1.0_f64;
        let a_p = 1.0_f64;
        let v_circ = (mu_sun / a_p).sqrt();
        let r: Vec3 = [a_p, 0.0, 0.0];
        let v_planet: Vec3 = [0.0, v_circ, 0.0];
        let v_inf_in: Vec3 = [0.10, 0.20, 0.05];
        let v_inf_mag = norm(v_inf_in);

        let v_helio_in = [
            v_planet[0] + v_inf_in[0],
            v_planet[1] + v_inf_in[1],
            v_planet[2] + v_inf_in[2],
        ];
        let (a0, e0, i0) = elements_aei(r, v_helio_in, mu_sun);
        assert!(a0 > 0.0, "spacecraft must be on a bound heliocentric orbit");
        let t0 = tisserand(a0, e0, i0, a_p);

        // Deflect v∞ by an arbitrary angle about an arbitrary axis (speed preserved).
        let axis = unit([0.3, 1.0, -0.2]);
        let v_inf_out = deflect(v_inf_in, 1.1, axis);
        let v_helio_out = [
            v_planet[0] + v_inf_out[0],
            v_planet[1] + v_inf_out[1],
            v_planet[2] + v_inf_out[2],
        ];
        let (a1, e1, i1) = elements_aei(r, v_helio_out, mu_sun);
        let t1 = tisserand(a1, e1, i1, a_p);

        // Invariance: the assist changes a, e, i but not the Tisserand parameter.
        assert!(approx(t0, t1, 1e-9), "Tisserand not conserved: {t0} vs {t1}");
        // And the v∞ link: T_P = 3 − (v∞/v_circ)².
        let t_from_vinf = 3.0 - (v_inf_mag / v_circ).powi(2);
        assert!(approx(t0, t_from_vinf, 1e-9), "T_P {t0} vs 3−(v∞/v_c)² {t_from_vinf}");
        // sanity: the orbit really did change.
        assert!((a0 - a1).abs() + (e0 - e1).abs() + (i0 - i1).abs() > 1e-3);
    }
}
