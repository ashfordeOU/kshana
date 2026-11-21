// SPDX-License-Identifier: AGPL-3.0-only
//! Probability of collision (Pc) of a short-term conjunction: the two-dimensional encounter-plane
//! method of Foster and Estes (1992) with a circular combined hard-body radius.
//!
//! Reference: J. L. Foster and H. S. Estes, "A Parametric Analysis of Orbital Debris Collision
//! Probability and Maneuver Rate for Space Vehicles", NASA JSC-25898, August 1992 (the report
//! itself was not read for this module, to confirm; the integral below is the encounter-plane
//! form under which the method is commonly stated, and the checks are closed forms, a Monte Carlo
//! count and, opt-in, the published test cases of NASA's CARA tools). The method is
//! the one the CCSDS Conjunction Data Message names `FOSTER-1992` for `COLLISION_PROBABILITY_METHOD`
//! (CCSDS 508.0-B-1, Table 3-2; the example of section 3.6.3 uses it).
//!
//! Assumptions of the method (short-term encounter): the relative motion is rectilinear over the
//! encounter, the position errors are Gaussian, uncorrelated between the two objects and constant
//! over the encounter, and the velocity uncertainty is neglected. Under them the collision
//! probability is the integral of the combined position density, projected onto the encounter
//! plane (the plane through the primary perpendicular to the relative velocity), over the disc of
//! the combined hard-body radius `R` centred on the projected miss vector:
//!
//! `Pc = 1 / (2π √det C) ∬_{|ρ − m| ≤ R} exp(−½ ρᵀ C⁻¹ ρ) dρ`
//!
//! Here it is evaluated in the principal axes of the 2x2 encounter-plane covariance `C`
//! (standard deviations `σx`, `σy`, miss components `mx`, `my`), where the inner integral has a
//! closed form:
//!
//! `Pc = ∫_{−R}^{R} φ((x − mx)/σx)/σx · ½[erf((my + h)/(√2 σy)) − erf((my − h)/(√2 σy))] dx`,
//! `h = √(R² − x²)`,
//!
//! integrated with `x = R sin t` (which removes the square-root end points) by adaptive Simpson
//! quadrature to a relative tolerance of 1e-10. `erf` is `libm`'s.
//!
//! The function takes the two inertial states and 3x3 position covariances at the time of closest
//! approach, in metres, metres per second and square metres, and sums the covariances. [`from_cdm`]
//! reads them from a CDM: positions and velocities in km and km/s in the message's `REF_FRAME`,
//! covariances in each object's RTN frame (CCSDS 508.0-B-1 Table 3-4, annex E), rotated to the
//! reference frame here.
//!
//! MODELLED: the result is the method's number for the inputs, not a validated collision risk. A
//! slow or long encounter (the relative motion not rectilinear over the time the error ellipsoids
//! overlap, as in the GEO cases of Alfano 2009) is outside the method's assumptions; the number is
//! still computed and the encounter duration is reported so the reader can judge.

use super::cdm::{self, Cdm, Item};

/// The CDM `COLLISION_PROBABILITY_METHOD` value of this method.
pub const METHOD: &str = "FOSTER-1992";

type V3 = [f64; 3];
type M3 = [[f64; 3]; 3];

fn sub(a: V3, b: V3) -> V3 {
    [a[0] - b[0], a[1] - b[1], a[2] - b[2]]
}
fn dot(a: V3, b: V3) -> f64 {
    a[0] * b[0] + a[1] * b[1] + a[2] * b[2]
}
fn cross(a: V3, b: V3) -> V3 {
    [
        a[1] * b[2] - a[2] * b[1],
        a[2] * b[0] - a[0] * b[2],
        a[0] * b[1] - a[1] * b[0],
    ]
}
fn scale(a: V3, s: f64) -> V3 {
    [a[0] * s, a[1] * s, a[2] * s]
}
fn norm(a: V3) -> f64 {
    dot(a, a).sqrt()
}
fn quad(m: &M3, a: V3, b: V3) -> f64 {
    let mb = [dot(m[0], b), dot(m[1], b), dot(m[2], b)];
    dot(a, mb)
}

/// Why a Pc could not be computed.
#[derive(Clone, Debug, PartialEq)]
pub enum PcError {
    /// The hard-body radius is not a positive finite number.
    BadRadius,
    /// The relative velocity is zero: there is no encounter plane.
    NoRelativeVelocity,
    /// The combined encounter-plane covariance is not positive definite (its smaller eigenvalue,
    /// m²).
    NotPositiveDefinite(f64),
    /// An input is not finite.
    NotFinite,
}

impl std::fmt::Display for PcError {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        let s = match self {
            PcError::BadRadius => crate::terr!("e-orbit-data-pc-radius"),
            PcError::NoRelativeVelocity => crate::terr!("e-orbit-data-pc-no-relative-velocity"),
            PcError::NotPositiveDefinite(l) => {
                crate::terr!("e-orbit-data-pc-not-positive-definite", lambda = *l)
            }
            PcError::NotFinite => crate::terr!("e-orbit-data-pc-not-finite"),
        };
        f.write_str(&s)
    }
}

/// The result, with the encounter-plane quantities it was computed from.
#[derive(Clone, Debug, serde::Serialize)]
pub struct Pc {
    /// The probability of collision.
    pub pc: f64,
    /// `FOSTER-1992`.
    pub method: &'static str,
    /// The combined hard-body radius (m).
    pub hbr_m: f64,
    /// Miss distance at the input epoch (m).
    pub miss_distance_m: f64,
    /// Miss distance projected onto the encounter plane (m).
    pub encounter_plane_miss_m: f64,
    /// Relative speed (m/s).
    pub relative_speed_m_s: f64,
    /// Standard deviations along the principal axes of the encounter-plane covariance (m),
    /// larger first.
    pub sigma_m: [f64; 2],
    /// Miss components along those axes (m).
    pub miss_principal_m: [f64; 2],
    /// The encounter-plane covariance (m²) in the axes x (along the projected miss) and y
    /// (completing the right-handed set with the relative velocity).
    pub covariance_2d_m2: [[f64; 2]; 2],
    /// The time the relative motion takes to cross five combined sigmas along the larger
    /// principal axis (s): long values flag an encounter outside the short-term assumption.
    pub encounter_duration_s: f64,
}

/// Pc of a conjunction from the two inertial states and 3x3 position covariances at the time of
/// closest approach (m, m/s, m²) and the combined hard-body radius `hbr_m`.
pub fn foster_2d(
    r1: V3,
    v1: V3,
    c1: &M3,
    r2: V3,
    v2: V3,
    c2: &M3,
    hbr_m: f64,
) -> Result<Pc, PcError> {
    if !(hbr_m.is_finite() && hbr_m > 0.0) {
        return Err(PcError::BadRadius);
    }
    let all = r1
        .iter()
        .chain(&v1)
        .chain(&r2)
        .chain(&v2)
        .chain(c1.iter().flatten())
        .chain(c2.iter().flatten());
    if all.clone().any(|x| !x.is_finite()) {
        return Err(PcError::NotFinite);
    }
    let r = sub(r2, r1);
    let v = sub(v2, v1);
    let speed = norm(v);
    if speed == 0.0 {
        return Err(PcError::NoRelativeVelocity);
    }
    let mut c = [[0.0; 3]; 3];
    for i in 0..3 {
        for j in 0..3 {
            c[i][j] = 0.5 * (c1[i][j] + c1[j][i]) + 0.5 * (c2[i][j] + c2[j][i]);
        }
    }
    // Encounter frame: z along the relative velocity, x along the miss vector's component
    // perpendicular to it (any perpendicular when the miss is along the velocity).
    let z = scale(v, 1.0 / speed);
    let perp = sub(r, scale(z, dot(r, z)));
    let x = if norm(perp) > 1e-12 * norm(r).max(1.0) {
        scale(perp, 1.0 / norm(perp))
    } else {
        let t = if z[0].abs() < 0.9 {
            [1.0, 0.0, 0.0]
        } else {
            [0.0, 1.0, 0.0]
        };
        let p = cross(z, t);
        scale(p, 1.0 / norm(p))
    };
    let y = cross(z, x);
    let cxx = quad(&c, x, x);
    let cxy = quad(&c, x, y);
    let cyy = quad(&c, y, y);
    let miss_plane = dot(r, x);
    // Principal axes of the 2x2 covariance.
    let tr = cxx + cyy;
    let disc = (((cxx - cyy) / 2.0).powi(2) + cxy * cxy).sqrt();
    let (l1, l2) = (tr / 2.0 + disc, tr / 2.0 - disc);
    if l2.is_nan() || l2 <= 0.0 {
        return Err(PcError::NotPositiveDefinite(l2));
    }
    let th = 0.5 * (2.0 * cxy).atan2(cxx - cyy);
    let (s, co) = th.sin_cos();
    // Miss (miss_plane, 0) in the principal axes (u along the l1 eigenvector).
    let mu = miss_plane * co;
    let mv = -miss_plane * s;
    let (sx, sy) = (l1.sqrt(), l2.sqrt());
    let pc = integrate(hbr_m, sx, sy, mu, mv);
    Ok(Pc {
        pc,
        method: METHOD,
        hbr_m,
        miss_distance_m: norm(r),
        encounter_plane_miss_m: miss_plane,
        relative_speed_m_s: speed,
        sigma_m: [sx, sy],
        miss_principal_m: [mu, mv],
        covariance_2d_m2: [[cxx, cxy], [cxy, cyy]],
        encounter_duration_s: 5.0 * sx / speed,
    })
}

/// `∫_{−π/2}^{π/2} g(t) dt` with `x = R sin t`, the closed-form inner integral over y.
fn integrate(r: f64, sx: f64, sy: f64, mx: f64, my: f64) -> f64 {
    let inv_sqrt_2pi = 1.0 / (2.0 * std::f64::consts::PI).sqrt();
    let g = |t: f64| {
        let (st, ct) = t.sin_cos();
        let x = r * st;
        let h = (r * ct).max(0.0);
        let px = inv_sqrt_2pi / sx * (-0.5 * ((x - mx) / sx).powi(2)).exp();
        let s2 = std::f64::consts::SQRT_2 * sy;
        let inner = 0.5 * (libm::erf((my + h) / s2) - libm::erf((my - h) / s2));
        px * inner * r * ct
    };
    let (a, b) = (-std::f64::consts::FRAC_PI_2, std::f64::consts::FRAC_PI_2);
    // Start from 64 panels so a narrow peak is not missed, then refine each adaptively.
    let n = 64;
    let w = (b - a) / n as f64;
    let mut total = 0.0;
    for k in 0..n {
        let (l, u) = (a + k as f64 * w, a + (k + 1) as f64 * w);
        let (fl, fm, fu) = (g(l), g(0.5 * (l + u)), g(u));
        let whole = (u - l) / 6.0 * (fl + 4.0 * fm + fu);
        total += simpson(&g, l, u, fl, fm, fu, whole, 1e-13, 40);
    }
    total.clamp(0.0, 1.0)
}

#[allow(clippy::too_many_arguments)]
fn simpson(
    g: &dyn Fn(f64) -> f64,
    a: f64,
    b: f64,
    fa: f64,
    fm: f64,
    fb: f64,
    whole: f64,
    tol: f64,
    depth: u32,
) -> f64 {
    let m = 0.5 * (a + b);
    let (lm, rm) = (0.5 * (a + m), 0.5 * (m + b));
    let (flm, frm) = (g(lm), g(rm));
    let left = (m - a) / 6.0 * (fa + 4.0 * flm + fm);
    let right = (b - m) / 6.0 * (fm + 4.0 * frm + fb);
    let delta = left + right - whole;
    if depth == 0 || delta.abs() <= 15.0 * tol.max(1e-10 * (left + right).abs()) {
        return left + right + delta / 15.0;
    }
    simpson(g, a, m, fa, flm, fm, left, tol / 2.0, depth - 1)
        + simpson(g, m, b, fm, frm, fb, right, tol / 2.0, depth - 1)
}

/// The position part of an RTN covariance (m², 6x6 or larger) rotated to the reference frame of
/// `state`, with [`super::covariance::from_rtn`].
fn rtn_to_frame(state: &[f64; 6], cov_rtn: &[Vec<f64>]) -> M3 {
    let mut p = [[0.0; 6]; 6];
    for (i, row) in p.iter_mut().enumerate() {
        for (j, v) in row.iter_mut().enumerate() {
            *v = cov_rtn[i][j];
        }
    }
    let f = super::covariance::from_rtn(state, &p);
    [
        [f[0][0], f[0][1], f[0][2]],
        [f[1][0], f[1][1], f[1][2]],
        [f[2][0], f[2][1], f[2][2]],
    ]
}

/// Why a CDM could not give a Pc.
#[derive(Clone, Debug, PartialEq)]
pub enum CdmPcError {
    /// The message does not hold two objects with a state and an RTN covariance each.
    MissingData,
    /// The two objects' `REF_FRAME` differ.
    FrameMismatch(String, String),
    /// The computation failed.
    Pc(PcError),
}

impl std::fmt::Display for CdmPcError {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        match self {
            CdmPcError::MissingData => f.write_str(&crate::terr!("e-orbit-data-pc-missing-data")),
            CdmPcError::FrameMismatch(a, b) => f.write_str(&crate::terr!(
                "e-orbit-data-pc-frame-mismatch",
                a = a.clone(),
                b = b.clone()
            )),
            CdmPcError::Pc(e) => e.fmt(f),
        }
    }
}

/// Pc from a CDM's two objects (states in km and km/s, RTN covariances in m²) and the combined
/// hard-body radius. Returns the result and the reference frame the geometry was taken in.
pub fn from_cdm(m: &Cdm, hbr_m: f64) -> Result<(Pc, String), CdmPcError> {
    if m.objects.len() < 2 {
        return Err(CdmPcError::MissingData);
    }
    let (o1, o2) = (&m.objects[0], &m.objects[1]);
    let frame = |s: &cdm::Section| s.get("REF_FRAME").unwrap_or_default().trim().to_string();
    let (f1, f2) = (frame(o1), frame(o2));
    if f1 != f2 {
        return Err(CdmPcError::FrameMismatch(f1, f2));
    }
    let (Some(x1), Some(x2), Some(c1), Some(c2)) = (
        cdm::state(o1),
        cdm::state(o2),
        cdm::covariance(o1),
        cdm::covariance(o2),
    ) else {
        return Err(CdmPcError::MissingData);
    };
    let km = |x: &[f64; 6], i: usize| x[i] * 1e3;
    let r1 = [km(&x1, 0), km(&x1, 1), km(&x1, 2)];
    let v1 = [km(&x1, 3), km(&x1, 4), km(&x1, 5)];
    let r2 = [km(&x2, 0), km(&x2, 1), km(&x2, 2)];
    let v2 = [km(&x2, 3), km(&x2, 4), km(&x2, 5)];
    let p = foster_2d(
        r1,
        v1,
        &rtn_to_frame(&x1, &c1),
        r2,
        v2,
        &rtn_to_frame(&x2, &c2),
        hbr_m,
    )
    .map_err(CdmPcError::Pc)?;
    Ok((p, f1))
}

/// A copy of the CDM with `COLLISION_PROBABILITY` and `COLLISION_PROBABILITY_METHOD` set to the
/// result (replacing earlier values), preceded by a `COMMENT` that labels the value MODELLED and
/// states the hard-body radius, ready for [`Cdm::to_kvn`].
pub fn with_pc(m: &Cdm, p: &Pc) -> Cdm {
    let mut out = m.clone();
    out.relative
        .items
        .retain(|it| it.key != "COLLISION_PROBABILITY" && it.key != "COLLISION_PROBABILITY_METHOD");
    let item = |key: &str, value: String| Item {
        key: key.to_string(),
        value,
        units: None,
        line: None,
    };
    out.relative.items.push(item(
        "COMMENT",
        format!(
            "COLLISION_PROBABILITY: MODELLED, kshana orbit-data pc, Foster 2D, HBR {} m",
            p.hbr_m
        ),
    ));
    out.relative
        .items
        .push(item("COLLISION_PROBABILITY", format!("{:.6E}", p.pc)));
    out.relative
        .items
        .push(item("COLLISION_PROBABILITY_METHOD", METHOD.to_string()));
    out
}

#[cfg(test)]
mod tests {
    use super::*;

    const I3: M3 = [[1.0, 0.0, 0.0], [0.0, 1.0, 0.0], [0.0, 0.0, 1.0]];

    fn iso(s2: f64) -> M3 {
        let mut m = I3;
        for (i, row) in m.iter_mut().enumerate() {
            row[i] *= s2;
        }
        m
    }

    #[test]
    fn head_on_isotropic_matches_the_closed_form() {
        // Zero miss, isotropic combined sigma s: Pc = 1 − exp(−R²/(2 s²)).
        for (s, r) in [(10.0, 5.0), (100.0, 20.0), (3.0, 10.0)] {
            let p = foster_2d(
                [0.0; 3],
                [7000.0, 0.0, 0.0],
                &iso(s * s / 2.0),
                [0.0; 3],
                [0.0, 7000.0, 0.0],
                &iso(s * s / 2.0),
                r,
            )
            .unwrap();
            let want = 1.0 - (-r * r / (2.0 * s * s)).exp();
            assert!(
                (p.pc - want).abs() < 1e-10 * want.max(1e-300) + 1e-14,
                "{} vs {want}",
                p.pc
            );
        }
    }

    #[test]
    fn small_radius_matches_the_density_times_area() {
        // R much smaller than the sigmas: Pc ≈ π R² · f(miss), plus the curvature term.
        let (sx, sy, m, r) = (200.0_f64, 50.0_f64, 150.0_f64, 0.5_f64);
        let mut c = [[0.0; 3]; 3];
        c[0][0] = sx * sx;
        c[1][1] = sy * sy;
        c[2][2] = 1e6;
        let p = foster_2d(
            [0.0; 3],
            [0.0; 3],
            &c,
            [m, 0.0, 0.0],
            [0.0, 0.0, 10.0],
            &[[0.0; 3]; 3],
            r,
        )
        .unwrap();
        let f = (-0.5 * (m / sx).powi(2)).exp() / (2.0 * std::f64::consts::PI * sx * sy);
        // To second order in R: πR² f (1 + R²/8 · ∇²f / f), with
        // ∇²f / f = m²/σx⁴ − 1/σx² − 1/σy² at the miss point.
        let lap = m * m / sx.powi(4) - 1.0 / (sx * sx) - 1.0 / (sy * sy);
        let want = std::f64::consts::PI * r * r * f * (1.0 + r * r / 8.0 * lap);
        assert!((p.pc - want).abs() / want < 1e-8, "{} vs {want}", p.pc);
    }

    #[test]
    fn errors() {
        let z = [[0.0; 3]; 3];
        assert_eq!(
            foster_2d(
                [0.0; 3],
                [1.0, 0.0, 0.0],
                &iso(1.0),
                [1.0; 3],
                [1.0, 0.0, 0.0],
                &iso(1.0),
                1.0
            )
            .unwrap_err(),
            PcError::NoRelativeVelocity
        );
        assert_eq!(
            foster_2d(
                [0.0; 3],
                [0.0; 3],
                &iso(1.0),
                [1.0; 3],
                [1.0, 0.0, 0.0],
                &iso(1.0),
                0.0
            )
            .unwrap_err(),
            PcError::BadRadius
        );
        assert!(matches!(
            foster_2d([0.0; 3], [0.0; 3], &z, [1.0; 3], [1.0, 0.0, 0.0], &z, 1.0).unwrap_err(),
            PcError::NotPositiveDefinite(_)
        ));
    }
}
