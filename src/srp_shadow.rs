// SPDX-License-Identifier: AGPL-3.0-only
//! Opt-in refinements of the solar-radiation-pressure eclipse factor `ν ∈ [0, 1]`.
//!
//! [`crate::forces::conical_shadow`] treats the Earth as a sphere of radius
//! [`RE_EARTH`] and the Sun as a uniformly bright disk. This module adds two refinements
//! that compose, and changes nothing in [`crate::forces`]:
//!
//! 1. **Oblate Earth** ([`oblate_conical_shadow`]): the occulting body is the WGS-84
//!    ellipsoid (`a = 6378137 m`, `f = 1/298.257223563`). The apparent angular radius of
//!    the Earth seen from the satellite is taken from the ellipsoid **limb in the direction
//!    of the Sun**: the point where a line from the satellite, lying in the plane through
//!    the satellite, the Earth centre and the Sun, grazes the ellipsoid on the Sun's side.
//!    This is the construction of Orekit 12's `OccultationEngine.angles` with
//!    `Ellipsoid.pointOnLimb`. The Earth is then treated as a disk of that angular radius
//!    centred on the geocentre direction, and the same dual-disk lens formula as
//!    [`crate::forces::conical_shadow`] gives `ν`. With `f = 0` the result is bit-for-bit
//!    the spherical one (see [`oblate_conical_shadow_with`]).
//! 2. **Solar limb darkening** ([`limb_darkened_shadow`]): `ν` is the fraction of the
//!    Sun's limb-darkened **radiant flux** that is not occulted,
//!    `ν = 1 − ∫_occulted I(μ) dA / ∫_disk I(μ) dA`, with `I(μ)/I(1)` a polynomial law in
//!    `μ = cos θ` (θ the emergence angle on the solar surface). The default law is the
//!    grey-atmosphere **Eddington-approximation** law `I(μ)/I(1) = 2/5 + 3/5 μ`
//!    ([`LimbDarkeningLaw::EDDINGTON`]), see its documentation for the source and the
//!    choice. The occulting body is either sphere or WGS-84 ([`OccultingShape`]).
//!
//! ## Geometry and its approximations (stated)
//!
//! * All positions are geocentric inertial metres, as for `conical_shadow`.
//! * **Body frame.** The ellipsoid's symmetry axis is the body-frame `z` axis. The
//!   optional `r_eci_to_body` rotation maps an ECI vector to body-frame coordinates
//!   (`v_body = R · v_eci`). `None` means the identity: the ellipsoid axis is the ECI `z`
//!   axis. Because the ellipsoid is axially symmetric, Earth rotation about its axis is
//!   irrelevant; `None` is exact up to precession, nutation and polar motion (the angle
//!   between the GCRF `z` axis and the true spin axis, ≲ 0.4° over ±25 years from J2000
//!   from precession, plus the ≲ 10″ nutation). Pass the precession–nutation matrix for
//!   a frame-consistent axis.
//! * **Disk model.** As in `conical_shadow`, both bodies are disks on the sky
//!   (the "flat" small-angle disk model, with angular radii and angular separation). For the
//!   ellipsoid only the limb angle towards the Sun is used, so the Earth disk is a circle
//!   centred on the geocentre direction; its radius is exact where the Sun's limb meets the
//!   Earth's limb along the Sun–Earth great circle, and the error elsewhere is of order
//!   `f · (a☉/b)` of the limb angle (a few 1e-5 of `b` at LEO, smaller further out).
//! * **Limb darkening.** On the solar disk, a point at normalised radius `ρ = r/a☉`
//!   (angular distance from the disk centre over the disk's angular radius) has
//!   `μ = √(1 − ρ²)`: the Sun is treated as seen from infinity (the exact
//!   finite-distance relation differs by `O(a☉²) ≈ 2e-5` relative, the same order as the
//!   flat-disk approximation already present).
//!
//! ## Numerical noise of the lens formula
//!
//! The circle–circle lens formula of `conical_shadow` (reused here so that `f = 0`
//! reproduces it exactly) is ill-conditioned when the Earth disk is much larger than the
//! Sun disk: the overlap is a small difference of `b²·acos(·)` terms of size `≈ a☉·b`. In
//! IEEE double precision the rounding noise of `ν` is up to ≈ 2e-8 at 400 km altitude,
//! ≈ 8e-9 at 700 km, ≈ 1e-10 at MEO and ≈ 2e-11 at GEO (measured against a 50-digit
//! evaluation of the same formula, `xval/srp_shadow/PREREGISTRATION.md`). The
//! limb-darkening quadrature does not use the lens formula and is accurate to < 1e-12.
//!
//! ## Evidence
//!
//! The oblate geometry and its `ν` are compared with Orekit 12.2
//! (`tests/srp_shadow_orekit_oracle.rs`, fixture `tests/fixtures/srp_shadow/`).
//! Limb darkening has no external oracle here and is MODELLED (internal consistency:
//! uniform-law reduction, quadrature convergence, the closed-form disk normalisation,
//! symmetry, monotone penumbra, limits).

use crate::forces::{RE_EARTH, SOLAR_RADIUS};
use std::f64::consts::PI;
use std::sync::OnceLock;

type Vec3 = [f64; 3];
type Mat3 = [[f64; 3]; 3];

/// WGS-84 semi-major (equatorial) axis (m). Equal to [`RE_EARTH`].
pub const WGS84_A: f64 = 6_378_137.0;
/// WGS-84 flattening `f` (dimensionless).
pub const WGS84_F: f64 = 1.0 / 298.257_223_563;

/// Gauss–Legendre points per sub-interval used by [`limb_darkened_shadow`] and
/// [`limb_darkened_shadow_with`] (the convergence study is in the unit tests).
pub const LIMB_DARKENING_NODES: usize = 32;

fn dot(a: Vec3, b: Vec3) -> f64 {
    a[0] * b[0] + a[1] * b[1] + a[2] * b[2]
}

fn norm(r: Vec3) -> f64 {
    (r[0] * r[0] + r[1] * r[1] + r[2] * r[2]).sqrt()
}

fn cross(a: Vec3, b: Vec3) -> Vec3 {
    [
        a[1] * b[2] - a[2] * b[1],
        a[2] * b[0] - a[0] * b[2],
        a[0] * b[1] - a[1] * b[0],
    ]
}

fn mat_vec(m: &Mat3, v: Vec3) -> Vec3 {
    [dot(m[0], v), dot(m[1], v), dot(m[2], v)]
}

fn scale(v: Vec3, k: f64) -> Vec3 {
    [v[0] * k, v[1] * k, v[2] * k]
}

fn sub(a: Vec3, b: Vec3) -> Vec3 {
    [a[0] - b[0], a[1] - b[1], a[2] - b[2]]
}

/// Any unit vector perpendicular to the unit vector `u`.
fn any_perpendicular(u: Vec3) -> Vec3 {
    let e = if u[0].abs() <= u[1].abs() && u[0].abs() <= u[2].abs() {
        [1.0, 0.0, 0.0]
    } else if u[1].abs() <= u[2].abs() {
        [0.0, 1.0, 0.0]
    } else {
        [0.0, 0.0, 1.0]
    };
    let w = cross(u, e);
    scale(w, 1.0 / norm(w))
}

/// Effective occulting radius `ρ` (m) of the ellipsoid `x²/a² + y²/a² + z²/(a(1−f))² = 1`
/// in body coordinates, seen from `p` towards `s`: the distance from the ellipsoid centre
/// to the tangent line drawn from `p` to the ellipsoid's limb, in the plane through the
/// centre, `p` and `s`, on the tangent point closer to `s` (Orekit's choice). Then
/// `sin(limb angle) = ρ/|p|`. Returns `None` when `p` is inside the ellipsoid.
///
/// Construction: the affine map `M = diag(1, 1, 1/(1−f))` sends the ellipsoid to the
/// sphere of radius `a` and planes through the centre to planes through the centre. In
/// mapped space the tangent points from `p'' = M p` are `a(k û ± √(1−k²) ŵ)`, `k = a/|p''|`,
/// with tangent line `{x'' : m̂·x'' = a}`, `m̂` the unit radial at the tangent point. Mapped
/// back, the line is `{x ∈ Π : (M m̂)·x = a}`, so its distance from the centre within the
/// plane `Π` is `a / |P_Π(M m̂)|`. It is written `a·√((m̂·m̂)/(|v|² − (v·n̂)²))` with
/// `v = M m̂`, so that for `f = 0` (`v = m̂` bitwise, `v·n̂` below one ulp) it is exactly `a`.
fn limb_radius_body(p: Vec3, s: Vec3, a: f64, f: f64) -> Option<f64> {
    let m = 1.0 / (1.0 - f);
    let pm = [p[0], p[1], p[2] * m];
    let sm = [s[0], s[1], s[2] * m];
    let pn = norm(pm);
    let k = a / pn;
    if k >= 1.0 {
        return None;
    }
    let u = scale(pm, 1.0 / pn);
    let s_perp = sub(sm, scale(u, dot(sm, u)));
    let sp = norm(s_perp);
    let w = if sp > 1e-12 * norm(sm) {
        scale(s_perp, 1.0 / sp)
    } else {
        any_perpendicular(u)
    };
    // Plane normal in body space (Π = span(p, s) = M⁻¹ span(p'', s'')).
    let n_raw = cross(p, s);
    let nn = norm(n_raw);
    let n_hat = if nn > 1e-12 * norm(p) * norm(s) {
        scale(n_raw, 1.0 / nn)
    } else {
        // Degenerate (p ∥ s): use the plane M⁻¹ span(u, w).
        let q = cross([u[0], u[1], u[2] / m], [w[0], w[1], w[2] / m]);
        scale(q, 1.0 / norm(q))
    };
    let sin_t = ((1.0 - k) * (1.0 + k)).sqrt();
    let cand = |sign: f64| -> Vec3 {
        [
            k * u[0] + sign * sin_t * w[0],
            k * u[1] + sign * sin_t * w[1],
            k * u[2] + sign * sin_t * w[2],
        ]
    };
    let (m_plus, m_minus) = (cand(1.0), cand(-1.0));
    // Tangent points in body space, T = M⁻¹ (a m̂); pick the one closer to s.
    let tp = |mh: Vec3| -> Vec3 { [a * mh[0], a * mh[1], a * mh[2] / m] };
    let d_plus = norm(sub(tp(m_plus), s));
    let d_minus = norm(sub(tp(m_minus), s));
    let mh = if d_plus <= d_minus { m_plus } else { m_minus };
    let v = [mh[0], mh[1], mh[2] * m];
    let vn = dot(v, n_hat);
    let denom = dot(v, v) - vn * vn;
    Some(a * (dot(mh, mh) / denom).sqrt())
}

/// Apparent angular radius (rad) of the occulting ellipsoid's limb in the direction of the
/// Sun, seen from a satellite at geocentric ECI `r` (m) with the Sun at `s` (m), for an
/// ellipsoid of equatorial radius `a` (m) and flattening `f`, its symmetry axis the body `z`
/// axis (`r_eci_to_body`, `None` = identity; see the module notes). This is the angle
/// Orekit 12 calls the limb radius (`OccultationEngine.OccultationAngles.getLimbRadius`).
/// Inside the ellipsoid it returns `π/2` (where `conical_shadow`'s clamped `asin` also gives
/// `π/2`).
pub fn ellipsoid_limb_angle(r: Vec3, s: Vec3, r_eci_to_body: Option<Mat3>, a: f64, f: f64) -> f64 {
    let (rb, sb) = match r_eci_to_body {
        Some(m) => (mat_vec(&m, r), mat_vec(&m, s)),
        None => (r, s),
    };
    let r_n = norm(r);
    match limb_radius_body(rb, sb, a, f) {
        Some(rho) => (rho / r_n).clamp(-1.0, 1.0).asin(),
        None => std::f64::consts::FRAC_PI_2,
    }
}

/// The disk angles `(a☉, b, c)`: Sun apparent radius, Earth apparent radius (sphere of
/// radius `a_eq` when `flattening` is `None`), and Sun–Earth-centre apparent separation,
/// computed with exactly the operations of `conical_shadow`. `None` for the degenerate
/// positions `conical_shadow` maps to full sun.
fn disk_angles(
    r: Vec3,
    s: Vec3,
    rot: Option<Mat3>,
    a_eq: f64,
    flattening: Option<f64>,
) -> Option<(f64, f64, f64)> {
    let d = [s[0] - r[0], s[1] - r[1], s[2] - r[2]]; // satellite → Sun
    let d_sun = norm(d);
    let r_n = norm(r);
    if d_sun == 0.0 || r_n == 0.0 {
        return None;
    }
    let a = (SOLAR_RADIUS / d_sun).clamp(-1.0, 1.0).asin();
    let b = match flattening {
        None => (a_eq / r_n).clamp(-1.0, 1.0).asin(),
        Some(f) => ellipsoid_limb_angle(r, s, rot, a_eq, f),
    };
    let dot = d[0] * (-r[0]) + d[1] * (-r[1]) + d[2] * (-r[2]);
    let c = (dot / (d_sun * r_n)).clamp(-1.0, 1.0).acos();
    Some((a, b, c))
}

/// The dual-disk visible fraction, the arithmetic of `conical_shadow` verbatim.
fn lens_visible(a: f64, b: f64, c: f64) -> f64 {
    if c >= a + b {
        return 1.0;
    }
    if c <= b - a {
        return 0.0;
    }
    if c <= a - b {
        return 1.0 - (b * b) / (a * a);
    }
    let x = ((c * c + a * a - b * b) / (2.0 * c * a)).clamp(-1.0, 1.0);
    let y = ((c * c + b * b - a * a) / (2.0 * c * b)).clamp(-1.0, 1.0);
    let tri = ((-c + a + b) * (c + a - b) * (c - a + b) * (c + a + b)).max(0.0);
    let overlap = a * a * x.acos() + b * b * y.acos() - 0.5 * tri.sqrt();
    (1.0 - overlap / (PI * a * a)).clamp(0.0, 1.0)
}

/// Conical-shadow eclipse factor `ν ∈ [0, 1]` with the Earth as the **WGS-84 ellipsoid**:
/// the dual-disk model of [`crate::forces::conical_shadow`] with the Earth's apparent radius
/// taken from the ellipsoid limb in the direction of the Sun ([`ellipsoid_limb_angle`]).
/// `r`, `s`: geocentric ECI satellite and Sun positions (m). `r_eci_to_body`: rotation from
/// ECI to the ellipsoid's body frame (`None` = identity; exact for the axially symmetric
/// ellipsoid up to precession/nutation, see the module notes).
pub fn oblate_conical_shadow(r: Vec3, s: Vec3, r_eci_to_body: Option<Mat3>) -> f64 {
    oblate_conical_shadow_with(r, s, r_eci_to_body, WGS84_A, WGS84_F)
}

/// [`oblate_conical_shadow`] for an arbitrary oblate ellipsoid of equatorial radius `a` (m)
/// and flattening `f`. With `a = RE_EARTH` and `f = 0` it returns exactly
/// `conical_shadow(r, s)` (same operations; tested bit-for-bit).
pub fn oblate_conical_shadow_with(r: Vec3, s: Vec3, rot: Option<Mat3>, a: f64, f: f64) -> f64 {
    match disk_angles(r, s, rot, a, Some(f)) {
        None => 1.0,
        Some((sa, b, c)) => lens_visible(sa, b, c),
    }
}

/// The occulting-body shape used by [`limb_darkened_shadow`].
#[derive(Debug, Clone, Copy, PartialEq)]
pub enum OccultingShape {
    /// Sphere of radius [`RE_EARTH`], as [`crate::forces::conical_shadow`].
    Sphere,
    /// WGS-84 ellipsoid, as [`oblate_conical_shadow`]; `rot` maps ECI to the body frame
    /// (`None` = identity).
    Wgs84 {
        /// ECI → body-frame rotation, `None` for the identity.
        rot: Option<Mat3>,
    },
}

/// A polynomial solar limb-darkening law `I(μ)/I(1) = Σₖ cₖ μᵏ` (`k = 0..=5`), with
/// `μ = cos θ` the cosine of the emergence angle on the solar surface. A law is normalised
/// to the disk-centre intensity when `Σₖ cₖ = 1`.
#[derive(Debug, Clone, Copy, PartialEq)]
pub struct LimbDarkeningLaw {
    /// Coefficients `c₀ … c₅`.
    pub coeffs: [f64; 6],
}

impl LimbDarkeningLaw {
    /// Uniform disk, `I ≡ I(1)`: the geometric model; [`limb_darkened_shadow_with`] then
    /// reproduces the dual-disk area fraction.
    pub const UNIFORM: Self = Self {
        coeffs: [1.0, 0.0, 0.0, 0.0, 0.0, 0.0],
    };

    /// Grey-atmosphere **Eddington-approximation** law for the wavelength-integrated
    /// (bolometric) intensity, `I(μ)/I(1) = 2/5 + 3/5 μ` (limb-to-centre ratio 0.4).
    ///
    /// Source: the Eddington approximation to the grey plane-parallel atmosphere, with
    /// source function `S(τ) ∝ τ + 2/3`, gives the emergent intensity
    /// `I(μ) ∝ μ + 2/3` (Eddington 1926, *The Internal Constitution of the Stars*;
    /// Chandrasekhar 1950, *Radiative Transfer*, ch. III). It is the textbook
    /// wavelength-integrated limb-darkening law compared with the Sun's measured limb
    /// darkening in Carroll & Ostlie, *An Introduction to Modern Astrophysics* (2nd ed.,
    /// 2007), Fig. 9.17. The coefficients `2/5` and `3/5` are derived, not fitted, so no
    /// tabulated data are reproduced.
    ///
    /// Why this law: the radiation-pressure force follows the **total** (bolometric)
    /// flux, so a wavelength-integrated law is needed. The published measured laws
    /// (Pierce & Slaughter 1977, Solar Phys. 51, 25; Neckel & Labs 1994, Solar Phys. 153,
    /// 91) are per wavelength and would need integrating over the solar spectrum, a model
    /// step of its own. Another law can be supplied through [`limb_darkened_shadow_with`].
    pub const EDDINGTON: Self = Self {
        coeffs: [0.4, 0.6, 0.0, 0.0, 0.0, 0.0],
    };

    /// `I(μ)/I(1)`.
    pub fn intensity(&self, mu: f64) -> f64 {
        let c = &self.coeffs;
        c[0] + mu * (c[1] + mu * (c[2] + mu * (c[3] + mu * (c[4] + mu * c[5]))))
    }

    /// Closed form of `∫₀¹ I(μ) 2μ dμ = Σₖ 2cₖ/(k+2)`: the disk-integrated flux over
    /// `π a☉² I(1)` (for the Eddington law, `0.4 + 0.4 = 0.8`).
    pub fn disk_flux_closed_form(&self) -> f64 {
        self.coeffs
            .iter()
            .enumerate()
            .map(|(k, c)| 2.0 * c / (k as f64 + 2.0))
            .sum()
    }
}

/// Gauss–Legendre nodes and weights on `[0, 1]`, by Newton iteration on `Pₙ`.
pub fn gauss_legendre_unit(n: usize) -> Vec<(f64, f64)> {
    let mut out = Vec::with_capacity(n);
    let nf = n as f64;
    for i in 0..n {
        let mut x = (PI * (i as f64 + 0.75) / (nf + 0.5)).cos();
        let mut dp = 1.0;
        for _ in 0..100 {
            let (mut p0, mut p1) = (1.0, x);
            for k in 2..=n {
                let kf = k as f64;
                let p2 = ((2.0 * kf - 1.0) * x * p1 - (kf - 1.0) * p0) / kf;
                p0 = p1;
                p1 = p2;
            }
            let pn = if n == 0 { 1.0 } else { p1 };
            let pn1 = if n == 0 { 0.0 } else { p0 };
            dp = nf * (x * pn - pn1) / (x * x - 1.0);
            let dx = pn / dp;
            x -= dx;
            if dx.abs() <= 1e-16 {
                break;
            }
        }
        let w = 2.0 / ((1.0 - x * x) * dp * dp);
        out.push((0.5 * (1.0 - x), 0.5 * w));
    }
    out
}

fn default_nodes() -> &'static [(f64, f64)] {
    static CELL: OnceLock<Vec<(f64, f64)>> = OnceLock::new();
    CELL.get_or_init(|| gauss_legendre_unit(LIMB_DARKENING_NODES))
}

/// Arc angle (rad) of the circle of normalised radius `rho` about the Sun-disk centre that
/// lies inside the occulting disk of normalised radius `beta` at normalised distance
/// `gamma`; `delta = gamma − beta`, `sigma = gamma + beta` (passed separately for
/// precision when `beta ≫ 1`).
fn arc_inside(rho: f64, gamma: f64, delta: f64, sigma: f64) -> f64 {
    if rho <= -delta {
        return 2.0 * PI; // circle wholly inside the occulting disk
    }
    if rho <= delta || rho >= sigma {
        return 0.0; // wholly outside
    }
    if gamma == 0.0 {
        return 0.0;
    }
    let arg = ((rho * rho + delta * sigma) / (2.0 * rho * gamma)).clamp(-1.0, 1.0);
    2.0 * arg.acos()
}

/// The occulted flux fraction `∫ I L ρ dρ / ∫ I 2π ρ dρ` for normalised disks, by
/// Gauss–Legendre over `ρ` split at the arc breakpoints, each sub-interval mapped with
/// `ρ = ρ₀ + (ρ₁−ρ₀)(1 − cos πt)/2` (which removes the square-root endpoint behaviour of the
/// arc length and of `μ = √(1−ρ²)` at `ρ = 1`).
fn occulted_fraction(
    law: &LimbDarkeningLaw,
    gamma: f64,
    delta: f64,
    sigma: f64,
    nodes: &[(f64, f64)],
) -> f64 {
    let mut cuts = [0.0, 1.0, 1.0, 1.0];
    let mut nc = 1;
    for bp in [delta.abs(), sigma] {
        if bp > 0.0 && bp < 1.0 {
            cuts[nc] = bp;
            nc += 1;
        }
    }
    cuts[nc] = 1.0;
    cuts[1..nc].sort_by(f64::total_cmp);
    let mut occ = 0.0;
    for seg in 0..nc {
        let (r0, r1) = (cuts[seg], cuts[seg + 1]);
        let h = r1 - r0;
        if h <= 0.0 {
            continue;
        }
        let mut acc = 0.0;
        for &(t, w) in nodes {
            let (st, ct) = (PI * t).sin_cos();
            let rho = r0 + h * 0.5 * (1.0 - ct);
            let jac = h * 0.5 * PI * st;
            let mu = ((1.0 - rho) * (1.0 + rho)).max(0.0).sqrt();
            acc += w * law.intensity(mu) * arc_inside(rho, gamma, delta, sigma) * rho * jac;
        }
        occ += acc;
    }
    occ / (PI * law.disk_flux_closed_form())
}

/// Eclipse factor `ν ∈ [0, 1]` with **solar limb darkening**: the fraction of the Sun's
/// radiant flux reaching the satellite, for the [`LimbDarkeningLaw::EDDINGTON`] law and the
/// occulting `earth` shape. Disk geometry (contact angles) is identical to
/// [`crate::forces::conical_shadow`] (`Sphere`) or [`oblate_conical_shadow`] (`Wgs84`);
/// only the weighting inside the penumbra differs. MODELLED (no external oracle).
pub fn limb_darkened_shadow(r: Vec3, s: Vec3, earth: OccultingShape) -> f64 {
    limb_darkened_shadow_with(r, s, earth, &LimbDarkeningLaw::EDDINGTON)
}

/// [`limb_darkened_shadow`] with an arbitrary polynomial limb-darkening law.
/// With [`LimbDarkeningLaw::UNIFORM`] it reproduces the dual-disk area fraction.
pub fn limb_darkened_shadow_with(
    r: Vec3,
    s: Vec3,
    earth: OccultingShape,
    law: &LimbDarkeningLaw,
) -> f64 {
    limb_darkened_shadow_nodes(r, s, earth, law, default_nodes())
}

/// [`limb_darkened_shadow_with`] with caller-supplied Gauss–Legendre nodes on `[0, 1]`
/// (from [`gauss_legendre_unit`]); for convergence studies.
pub fn limb_darkened_shadow_nodes(
    r: Vec3,
    s: Vec3,
    earth: OccultingShape,
    law: &LimbDarkeningLaw,
    nodes: &[(f64, f64)],
) -> f64 {
    let angles = match earth {
        OccultingShape::Sphere => disk_angles(r, s, None, RE_EARTH, None),
        OccultingShape::Wgs84 { rot } => disk_angles(r, s, rot, WGS84_A, Some(WGS84_F)),
    };
    let Some((a, b, c)) = angles else {
        return 1.0;
    };
    if c >= a + b {
        return 1.0;
    }
    if c <= b - a {
        return 0.0;
    }
    let gamma = c / a;
    let delta = (c - b) / a;
    let sigma = (c + b) / a;
    (1.0 - occulted_fraction(law, gamma, delta, sigma, nodes)).clamp(0.0, 1.0)
}

/// Sun apparent radius, Earth limb angle and separation `(a☉, b, c)` (rad) as used by the
/// shadow functions of this module for the given `earth` shape; exposed for the oracle
/// comparison (Orekit's `OccultationAngles`: occulted apparent radius, limb radius,
/// separation). Degenerate positions return `None`.
pub fn shadow_angles(r: Vec3, s: Vec3, earth: OccultingShape) -> Option<(f64, f64, f64)> {
    match earth {
        OccultingShape::Sphere => disk_angles(r, s, None, RE_EARTH, None),
        OccultingShape::Wgs84 { rot } => disk_angles(r, s, rot, WGS84_A, Some(WGS84_F)),
    }
}

#[cfg(test)]
mod tests {
    use super::*;
    use crate::ephem::AU_M;
    use crate::forces::conical_shadow;

    /// A satellite at radius `rn` placed so that the Sun–Earth apparent separation is `c`
    /// (rad), in the plane spanned by the Sun direction `sh` and `perp` (both unit).
    fn place(rn: f64, sh: Vec3, perp: Vec3, c: f64) -> (Vec3, Vec3) {
        let s = scale(sh, AU_M);
        // Angle between sat→Sun and sat→Earth is ≈ angle between −r̂ and ŝ (Sun at ∞);
        // solve exactly by bisection on the polar angle φ of r̂ from −ŝ.
        let pos = |phi: f64| -> Vec3 {
            let (sp, cp) = phi.sin_cos();
            [
                rn * (-cp * sh[0] + sp * perp[0]),
                rn * (-cp * sh[1] + sp * perp[1]),
                rn * (-cp * sh[2] + sp * perp[2]),
            ]
        };
        let sep = |phi: f64| {
            let r = pos(phi);
            let d = sub(s, r);
            (dot(d, scale(r, -1.0)) / (norm(d) * norm(r))).clamp(-1.0, 1.0).acos()
        };
        let (mut lo, mut hi) = (0.0, PI);
        for _ in 0..200 {
            let mid = 0.5 * (lo + hi);
            if sep(mid) < c {
                lo = mid;
            } else {
                hi = mid;
            }
        }
        (pos(0.5 * (lo + hi)), s)
    }

    fn penumbra_cs(rn: f64, k: usize) -> Vec<f64> {
        let a = (SOLAR_RADIUS / AU_M).asin();
        let b = (RE_EARTH / rn).asin();
        (0..=k).map(|i| (b - a) + 2.0 * a * i as f64 / k as f64).collect()
    }

    const ALTS: [f64; 4] = [400e3, 700e3, 20_200e3, 35_786e3];
    const X: Vec3 = [1.0, 0.0, 0.0];
    const Y: Vec3 = [0.0, 1.0, 0.0];
    const Z: Vec3 = [0.0, 0.0, 1.0];

    #[test]
    fn oblate_with_zero_flattening_is_bit_identical_to_conical_shadow() {
        let rot = {
            let (s, c) = 0.7_f64.sin_cos();
            [[c, 0.0, -s], [0.0, 1.0, 0.0], [s, 0.0, c]]
        };
        let mut n = 0;
        let mut worst: f64 = 0.0;
        for alt in ALTS {
            let rn = RE_EARTH + alt;
            for (sh, perp) in [(X, Z), (X, Y), ([0.6, 0.0, 0.8], [0.8, 0.0, -0.6])] {
                for c in penumbra_cs(rn, 50) {
                    let (r, s) = place(rn, sh, perp, c);
                    let base = conical_shadow(r, s);
                    for rr in [None, Some(rot)] {
                        let v = oblate_conical_shadow_with(r, s, rr, RE_EARTH, 0.0);
                        worst = worst.max((v - base).abs());
                        n += 1;
                    }
                }
            }
        }
        assert!(n > 1000);
        assert!(worst <= 1e-15, "f=0 reduction worst |Δν| = {worst:e}");
    }

    #[test]
    fn oblate_limb_angle_matches_closed_forms_on_the_axes() {
        // Seen from the equatorial plane with the Sun in the equatorial plane, the limb is
        // on the equator: b = asin(a/r). Seen from over the pole with the Sun in a meridian
        // plane, the limb lies in that meridian ellipse; for a point on the z axis at
        // height h the tangent to x²/a² + z²/c² = 1 has distance ρ with
        // ρ² = a² c² / (c² + (a² − c²) … ) — use sin b = a √(1 − c²/z²) / … : the tangent
        // from (0, z) touches at z_t = c²/z, x_t = a √(1 − c²/z²), so
        // tan b = x_t / (z − z_t).
        let a = WGS84_A;
        let cpol = a * (1.0 - WGS84_F);
        for alt in ALTS {
            let rn = a + alt;
            let b_eq = ellipsoid_limb_angle([rn, 0.0, 0.0], [0.0, AU_M, 0.0], None, a, WGS84_F);
            assert!((b_eq - (a / rn).asin()).abs() < 1e-15, "{alt}");
            let z = cpol + alt;
            let zt = cpol * cpol / z;
            let xt = a * ((1.0 - cpol / z) * (1.0 + cpol / z)).sqrt();
            let expect = (xt / (z - zt)).atan();
            let b_pol = ellipsoid_limb_angle([0.0, 0.0, z], [AU_M, 0.0, 0.0], None, a, WGS84_F);
            assert!((b_pol - expect).abs() < 2e-15, "{alt}: {b_pol} vs {expect}");
            // and the polar view sees a larger disk than a sphere of polar radius:
            assert!(b_pol > (cpol / z).asin());
        }
    }

    #[test]
    fn rotation_argument_is_equivalent_to_rotating_the_inputs() {
        // Body frame tilted 30° about x: passing R must equal evaluating with R·r, R·s and
        // the identity (the satellite radius is rotation-invariant).
        let (sn, cs) = (30f64.to_radians()).sin_cos();
        let rot = [[1.0, 0.0, 0.0], [0.0, cs, sn], [0.0, -sn, cs]];
        let rn = RE_EARTH + 400e3;
        for c in penumbra_cs(rn, 20) {
            let (r, s) = place(rn, X, [0.0, 0.6, 0.8], c);
            let v1 = oblate_conical_shadow(r, s, Some(rot));
            let v2 = oblate_conical_shadow(mat_vec(&rot, r), mat_vec(&rot, s), None);
            assert!((v1 - v2).abs() < 1e-7, "{v1} {v2}"); // lens noise floor at LEO
            let b1 = ellipsoid_limb_angle(r, s, Some(rot), WGS84_A, WGS84_F);
            let b2 = ellipsoid_limb_angle(mat_vec(&rot, r), mat_vec(&rot, s), None, WGS84_A, WGS84_F);
            assert!((b1 - b2).abs() < 1e-15);
        }
    }

    #[test]
    fn oblate_limits_full_sun_and_umbra() {
        let s = [AU_M, 0.0, 0.0];
        assert_eq!(oblate_conical_shadow([7.0e6, 0.0, 0.0], s, None), 1.0);
        assert_eq!(oblate_conical_shadow([-7.0e6, 0.0, 0.0], s, None), 0.0);
        assert_eq!(oblate_conical_shadow([-7.0e6, 0.0, 1.0e5], s, None), 0.0);
        // degenerate positions behave as conical_shadow
        assert_eq!(oblate_conical_shadow([0.0; 3], s, None), 1.0);
    }

    #[test]
    fn polar_shadow_is_smaller_than_spherical() {
        // Satellite over the pole region looking at the Sun past the polar limb: the
        // flattened Earth hides less of the Sun, so ν(oblate) ≥ ν(sphere), strictly inside
        // the penumbra.
        let rn = RE_EARTH + 400e3;
        let mut strict = 0;
        for c in penumbra_cs(rn, 40) {
            let (r, s) = place(rn, X, Z, c);
            let (vo, vs) = (oblate_conical_shadow(r, s, None), conical_shadow(r, s));
            assert!(vo + 1e-7 >= vs, "c={c}: {vo} < {vs}");
            if vo > vs + 1e-3 {
                strict += 1;
            }
        }
        assert!(strict > 0);
    }

    #[test]
    fn gauss_legendre_integrates_polynomials_exactly() {
        for n in [4usize, 16, 32, 64] {
            let g = gauss_legendre_unit(n);
            let ws: f64 = g.iter().map(|p| p.1).sum();
            assert!((ws - 1.0).abs() < 1e-14);
            for k in 0..(2 * n) {
                let q: f64 = g.iter().map(|&(x, w)| w * x.powi(k as i32)).sum();
                assert!((q - 1.0 / (k as f64 + 1.0)).abs() < 1e-14, "n={n} k={k}");
            }
        }
    }

    #[test]
    fn disk_normalisation_quadrature_matches_closed_form() {
        // Total occultation: the occulted-flux quadrature must integrate the whole disk.
        for law in [LimbDarkeningLaw::UNIFORM, LimbDarkeningLaw::EDDINGTON] {
            assert!((law.intensity(1.0) - 1.0).abs() < 1e-15);
            // gamma = 0, beta huge: every circle inside → fraction 1 by quadrature.
            let f = occulted_fraction(&law, 0.0, -300.0, 300.0, default_nodes());
            assert!((f - 1.0).abs() < 1e-13, "{f}");
        }
        assert!((LimbDarkeningLaw::EDDINGTON.disk_flux_closed_form() - 0.8).abs() < 1e-15);
        // a fifth-order law: closed form against brute force over μ
        let law = LimbDarkeningLaw {
            coeffs: [0.1, 0.5, 0.3, -0.2, 0.2, 0.1],
        };
        let g = gauss_legendre_unit(32);
        let q: f64 = g.iter().map(|&(m, w)| w * law.intensity(m) * 2.0 * m).sum();
        assert!((q - law.disk_flux_closed_form()).abs() < 1e-15);
    }

    /// A well-conditioned circle–circle overlap fraction (of the Sun disk), for checking
    /// the uniform-law quadrature below the lens formula's rounding noise.
    fn stable_overlap_fraction(a: f64, b: f64, c: f64) -> f64 {
        // segment area r²(θ − sinθcosθ) written with a series for small θ
        fn seg(r: f64, th: f64) -> f64 {
            let x = 2.0 * th;
            let g = if x < 0.05 {
                let x2 = x * x;
                x * x2 / 6.0 * (1.0 - x2 / 20.0 * (1.0 - x2 / 42.0 * (1.0 - x2 / 72.0)))
            } else {
                x - x.sin()
            };
            0.5 * r * r * g
        }
        let x1 = ((c - b) * (c + b) + a * a) / (2.0 * c); // Sun centre → chord
        let h = ((a - x1) * (a + x1)).max(0.0).sqrt();
        let x2 = c - x1; // Earth centre → chord
        let th1 = h.atan2(x1); // half-angle at the Sun centre
        let th2 = h.atan2(x2);
        (seg(a, th1) + seg(b, th2)) / (PI * a * a)
    }

    #[test]
    fn uniform_law_reduces_to_the_geometric_area_fraction() {
        let mut worst_stable: f64 = 0.0;
        for alt in ALTS {
            let rn = RE_EARTH + alt;
            let mut worst_conical: f64 = 0.0;
            for c in penumbra_cs(rn, 200) {
                let (r, s) = place(rn, X, Z, c);
                let u = limb_darkened_shadow_with(r, s, OccultingShape::Sphere, &LimbDarkeningLaw::UNIFORM);
                worst_conical = worst_conical.max((u - conical_shadow(r, s)).abs());
                let (a, b, cc) = shadow_angles(r, s, OccultingShape::Sphere).expect("angles");
                if cc > b - a && cc < a + b {
                    let ex = 1.0 - stable_overlap_fraction(a, b, cc);
                    worst_stable = worst_stable.max((u - ex).abs());
                }
                // Wgs84 composition reduces to the oblate geometric factor
                let uo = limb_darkened_shadow_with(
                    r,
                    s,
                    OccultingShape::Wgs84 { rot: None },
                    &LimbDarkeningLaw::UNIFORM,
                );
                worst_conical = worst_conical.max((uo - oblate_conical_shadow(r, s, None)).abs());
            }
            // conical_shadow carries its own lens rounding noise (≈2e-8 at 400 km)
            let bar = if alt < 1e6 { 5e-8 } else { 1e-9 };
            assert!(worst_conical <= bar, "alt {alt}: {worst_conical:e}");
        }
        assert!(worst_stable <= 1e-11, "vs stable lens: {worst_stable:e}");
    }

    #[test]
    fn quadrature_converges() {
        // Node counts 8 → 128: the 32-node default agrees with 128 nodes to ≤ 1e-12, and
        // the error falls as the count rises.
        let law = LimbDarkeningLaw::EDDINGTON;
        let g128 = gauss_legendre_unit(128);
        for alt in ALTS {
            let rn = RE_EARTH + alt;
            let mut worst = [0.0f64; 4];
            for c in penumbra_cs(rn, 100) {
                let (r, s) = place(rn, X, Z, c);
                let refv = limb_darkened_shadow_nodes(r, s, OccultingShape::Sphere, &law, &g128);
                for (i, n) in [8usize, 16, 32, 64].iter().enumerate() {
                    let g = gauss_legendre_unit(*n);
                    let v = limb_darkened_shadow_nodes(r, s, OccultingShape::Sphere, &law, &g);
                    worst[i] = worst[i].max((v - refv).abs());
                }
            }
            assert!(worst[2] <= 1e-12, "alt {alt}: {worst:?}");
            assert!(worst[0] >= worst[1] && worst[1] >= worst[2], "alt {alt}: {worst:?}");
            let d = limb_darkened_shadow(place(rn, X, Z, penumbra_cs(rn, 4)[2]).0, [AU_M, 0.0, 0.0], OccultingShape::Sphere);
            assert!(d > 0.0 && d < 1.0);
        }
    }

    #[test]
    fn limb_darkening_monotone_symmetric_and_limits() {
        for alt in ALTS {
            let rn = RE_EARTH + alt;
            let cs = penumbra_cs(rn, 200);
            let mut prev = -1.0;
            for (i, &c) in cs.iter().enumerate() {
                let (r, s) = place(rn, X, Z, c);
                let v = limb_darkened_shadow(r, s, OccultingShape::Sphere);
                assert!(v >= prev - 1e-15, "non-monotone at {i}");
                prev = v;
                // mirror symmetry: reflect the satellite through the Sun–Earth line
                let rm = [r[0], -r[1], -r[2]];
                let vm = limb_darkened_shadow(rm, s, OccultingShape::Sphere);
                assert!((v - vm).abs() < 1e-14);
                // ν ≤ 1 everywhere and the darkened Sun's limb carries less flux: entering
                // the penumbra the darkened factor stays above the uniform one until mid-way
                let u = conical_shadow(r, s);
                if (0.02..=0.3).contains(&(1.0 - u)) {
                    assert!(v > u, "early penumbra: ld {v} vs uniform {u}");
                }
                if (0.02..=0.3).contains(&u) {
                    assert!(v < u, "late penumbra: ld {v} vs uniform {u}");
                }
            }
            let first = limb_darkened_shadow(place(rn, X, Z, cs[0]).0, [AU_M, 0.0, 0.0], OccultingShape::Sphere);
            let last = limb_darkened_shadow(place(rn, X, Z, cs[200]).0, [AU_M, 0.0, 0.0], OccultingShape::Sphere);
            assert!(first <= 1e-9 && last >= 1.0 - 1e-9, "{first} {last}");
        }
        let s = [AU_M, 0.0, 0.0];
        for sh in [OccultingShape::Sphere, OccultingShape::Wgs84 { rot: None }] {
            assert_eq!(limb_darkened_shadow([7.0e6, 0.0, 0.0], s, sh), 1.0);
            assert_eq!(limb_darkened_shadow([-7.0e6, 0.0, 0.0], s, sh), 0.0);
        }
    }

    #[test]
    fn annular_case_matches_closed_form() {
        // Far out (Earth disk smaller than the Sun's) and centred: ν = 1 − ∫₀^β I 2ρ dρ / F.
        let law = LimbDarkeningLaw::EDDINGTON;
        let r = [-2.0e9, 0.0, 0.0];
        let s = [AU_M, 0.0, 0.0];
        let (a, b, c) = shadow_angles(r, s, OccultingShape::Sphere).expect("angles");
        assert!(b < a && c < 1e-12);
        let beta = b / a;
        // ∫₀^β (0.4 + 0.6√(1−ρ²)) 2ρ dρ = 0.4β² + 0.4(1 − (1−β²)^{3/2})
        let occ = 0.4 * beta * beta + 0.4 * (1.0 - (1.0 - beta * beta).powf(1.5));
        let expect = 1.0 - occ / 0.8;
        let v = limb_darkened_shadow(r, s, OccultingShape::Sphere);
        assert!((v - expect).abs() < 1e-12, "{v} vs {expect}");
        let u = limb_darkened_shadow_with(r, s, OccultingShape::Sphere, &LimbDarkeningLaw::UNIFORM);
        assert!((u - conical_shadow(r, s)).abs() < 1e-12);
    }
}
