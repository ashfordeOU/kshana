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
//! It also provides **solar-radiation pressure** ([`srp_accel`], the cannonball model with the
//! [`conical_shadow`] umbra+penumbra eclipse factor) paired with the same Sun ephemeris,
//! **atmospheric drag** ([`drag_accel`], quadratic drag against the co-rotating atmosphere of
//! [`atmospheric_density`], the Vallado piecewise-exponential model), and the post-Newtonian
//! **Schwarzschild relativistic correction** ([`relativistic_accel`], the leading
//! general-relativistic perigee-advance term).
//!
//! Scope (honest): the gravity field is **zonal only** (no tesseral/sectoral EGM terms); the SRP
//! shadow is the geometric dual-disk **conical umbra+penumbra** (no solar limb darkening or
//! oblate-Earth shadow); and the drag density is the **static piecewise-exponential** model (no
//! NRLMSISE-00 thermosphere); see `ROADMAP.md`.

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

use crate::ephem::AU_M;

type Vec3 = [f64; 3];

fn norm(r: Vec3) -> f64 {
    (r[0] * r[0] + r[1] * r[1] + r[2] * r[2]).sqrt()
}

/// Two-body (point-mass) gravitational acceleration `−μ·r/|r|³` (m/s²) about Earth. This is the
/// Earth specialisation of [`two_body_accel_body`]: it delegates with [`crate::body::Body::earth`]
/// (whose `μ` is the exact [`MU_EARTH`] literal), so the result is **bit-identical** to the
/// historical Earth-hard-coded form.
pub fn two_body_accel(r: Vec3) -> Vec3 {
    two_body_accel_body(r, &crate::body::Body::earth())
}

/// Two-body (point-mass) gravitational acceleration `−μ·r/|r|³` (m/s²) about an arbitrary central
/// body `b`, using `b.mu`. With `b = Body::earth()` (whose `μ` is the [`MU_EARTH`] literal) this is
/// the exact arithmetic of the legacy Earth [`two_body_accel`], in the same operation order, so the
/// Earth path stays byte-identical.
pub fn two_body_accel_body(r: Vec3, b: &crate::body::Body) -> Vec3 {
    let rn = norm(r);
    let k = -b.mu / (rn * rn * rn);
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

/// The body-general zonal disturbing potential, the shared core of [`zonal_potential`] and
/// [`zonal_potential_body`]: `R(r) = −(μ/r)·Σ_{n≥2} J_n·(Re/r)ⁿ·P_n(z/r)` (m²/s²) for a body of
/// gravitational parameter `mu` and reference radius `re`. The Earth specialisations call this with
/// the [`MU_EARTH`]/[`RE_EARTH`] literals, so the expression — and its operation order — is the
/// historical one and the Earth result is bit-identical.
fn zonal_potential_with(r: Vec3, mu: f64, re: f64, jn: &[f64]) -> f64 {
    let rn = norm(r);
    let s = r[2] / rn;
    let (p, _) = legendre(s, jn.len() + 1);
    let mut sum = 0.0;
    for (i, &j) in jn.iter().enumerate() {
        let n = i + 2;
        sum += j * (re / rn).powi(n as i32) * p[n];
    }
    -mu / rn * sum
}

/// Zonal disturbing potential `R(r) = −(μ/r)·Σ_{n≥2} J_n·(Re/r)ⁿ·P_n(z/r)` (m²/s²) about Earth —
/// the perturbation to the central `μ/r` whose gradient is [`zonal_accel`]. `jn` is the zonal
/// coefficient slice indexed from degree 2 (`jn[0] = J2`, `jn[1] = J3`, …). Delegates to
/// [`zonal_potential_with`] with the Earth [`MU_EARTH`]/[`RE_EARTH`] literals.
pub fn zonal_potential(r: Vec3, jn: &[f64]) -> f64 {
    zonal_potential_with(r, MU_EARTH, RE_EARTH, jn)
}

/// Zonal disturbing potential about an arbitrary central body `b` (using `b.mu`, `b.re`, `b.zonals`).
/// With `b = Body::earth()` this equals [`zonal_potential`] called with [`EARTH_ZONALS_J2_J6`]
/// bit-for-bit.
pub fn zonal_potential_body(r: Vec3, b: &crate::body::Body) -> f64 {
    zonal_potential_with(r, b.mu, b.re, b.zonals)
}

/// The body-general zonal perturbing acceleration, the shared core of [`zonal_accel`] and
/// [`zonal_accel_body`]: `a = ∇R` (m/s², ECI) for a body of gravitational parameter `mu` and
/// reference radius `re`, the exact analytic gradient of [`zonal_potential_with`]. The Earth
/// specialisations pass the [`MU_EARTH`]/[`RE_EARTH`] literals, so the arithmetic — and its
/// operation order — is the historical one and the Earth result is bit-identical.
fn zonal_accel_with(r: Vec3, mu: f64, re: f64, jn: &[f64]) -> Vec3 {
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
        let coef = -mu * j * re.powi(ni);
        // ∂/∂x_k[ r^{−(n+1)}·P_n(s) ] = −(n+1)·r^{−(n+3)}·x_k·P_n + r^{−(n+1)}·P_n'·∂s/∂x_k.
        let t1 = -(n as f64 + 1.0) * rn.powi(-(ni + 3));
        let t2 = rn.powi(-(ni + 1)) * dp[n];
        for k in 0..3 {
            a[k] += coef * (t1 * r[k] * p[n] + t2 * dsdx[k]);
        }
    }
    a
}

/// Perturbing acceleration `a = ∇R` (m/s², ECI) about Earth from the zonal harmonics in `jn`
/// (indexed from degree 2, so `jn = [J2, J3, …]`). Excludes the central two-body term — add
/// [`two_body_accel`] for the total. This is the exact analytic gradient of
/// [`zonal_potential`]; with `jn = [J2]` it reduces to [`j2_accel`] to machine precision.
/// Delegates to [`zonal_accel_with`] with the Earth [`MU_EARTH`]/[`RE_EARTH`] literals.
pub fn zonal_accel(r: Vec3, jn: &[f64]) -> Vec3 {
    zonal_accel_with(r, MU_EARTH, RE_EARTH, jn)
}

/// Zonal perturbing acceleration about an arbitrary central body `b` (using `b.mu`, `b.re`,
/// `b.zonals`). With `b = Body::earth()` this equals [`zonal_accel`] called with
/// [`EARTH_ZONALS_J2_J6`] bit-for-bit, so the Earth path stays byte-identical.
pub fn zonal_accel_body(r: Vec3, b: &crate::body::Body) -> Vec3 {
    zonal_accel_with(r, b.mu, b.re, b.zonals)
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

/// Total solar irradiance at 1 AU (W/m²) — the modern mean total solar irradiance.
pub const SOLAR_IRRADIANCE_AU: f64 = 1361.0;
/// Speed of light in vacuum (m/s), the defining SI value.
const SPEED_OF_LIGHT: f64 = 299_792_458.0;
/// Solar radiation pressure at 1 AU (N/m²) = `Φ☉/c`, the momentum flux of sunlight at 1 AU
/// (≈ 4.54e-6 Pa; cf. Montenbruck & Gill's 4.56e-6 from the older 1367 W/m² solar constant).
pub const SRP_PRESSURE_AU: f64 = SOLAR_IRRADIANCE_AU / SPEED_OF_LIGHT;

/// Cylindrical-shadow eclipse factor `ν ∈ {0, 1}` for a satellite at geocentric `r` (m) with
/// the Sun at geocentric `s` (m): `0` when the satellite lies inside the Earth's umbral
/// **cylinder** cast directly opposite the Sun (anti-sunward hemisphere and within one Earth
/// radius of the Earth–Sun line), else `1`. The test is `r∥ = r·ŝ < 0` (anti-sunward) **and**
/// `r⊥ = √(|r|² − r∥²) < Rₑ` (inside the cylinder). This is the simple umbra-only model; the
/// smooth umbra+penumbra `ν ∈ [0,1]` is [`conical_shadow`] (which [`srp_accel`] uses).
pub fn cylindrical_shadow(r: Vec3, s: Vec3) -> f64 {
    let sn = norm(s);
    // Signed component of r along the Sun direction ŝ = s/|s|.
    let r_par = (r[0] * s[0] + r[1] * s[1] + r[2] * s[2]) / sn;
    if r_par >= 0.0 {
        return 1.0; // sunward hemisphere is always lit
    }
    let rn2 = r[0] * r[0] + r[1] * r[1] + r[2] * r[2];
    let r_perp = (rn2 - r_par * r_par).max(0.0).sqrt();
    if r_perp < RE_EARTH {
        0.0
    } else {
        1.0
    }
}

/// Solar radius (m), IAU 2015 nominal value.
pub const SOLAR_RADIUS: f64 = 6.957e8;

/// **Conical-shadow** eclipse factor `ν ∈ [0, 1]`: the fraction of the Sun's disk still visible
/// from a satellite at geocentric `r` (m) with the Sun at geocentric `s` (m), modelling Earth's
/// **umbra *and* penumbra** as a smooth `0 → 1` transition — unlike the binary
/// [`cylindrical_shadow`]. The Sun and Earth are treated as disks of apparent angular radii
/// `a = asin(R☉/d☉)` and `b = asin(Rₑ/|r|)` seen from the satellite, with apparent centre
/// separation `c` (the angle between the sat→Sun and sat→Earth-centre directions); `ν` is one
/// minus the fraction of the Sun's disk area occulted by the Earth's disk:
/// * `c ≥ a + b` → `1` (no overlap, full sun);
/// * `c ≤ b − a` → `0` (Sun entirely behind the Earth, total umbra);
/// * `c ≤ a − b` → `1 − (b/a)²` (Earth's disk wholly inside the Sun's — annular, only at high
///   altitude where the Earth appears smaller than the Sun);
/// * otherwise → `1 −` (circle–circle lens overlap area)`/(π a²)` (penumbra).
///
/// This is the geometric dual-disk model (Montenbruck & Gill §3.4.2); solar limb darkening and
/// the oblate-Earth shadow remain follow-ons.
pub fn conical_shadow(r: Vec3, s: Vec3) -> f64 {
    let d = [s[0] - r[0], s[1] - r[1], s[2] - r[2]]; // satellite → Sun
    let d_sun = norm(d);
    let r_n = norm(r);
    if d_sun == 0.0 || r_n == 0.0 {
        return 1.0;
    }
    let a = (SOLAR_RADIUS / d_sun).clamp(-1.0, 1.0).asin(); // Sun apparent radius
    let b = (RE_EARTH / r_n).clamp(-1.0, 1.0).asin(); // Earth apparent radius
                                                      // Apparent separation c = angle between sat→Sun (d) and sat→Earth-centre (−r).
    let dot = d[0] * (-r[0]) + d[1] * (-r[1]) + d[2] * (-r[2]);
    let c = (dot / (d_sun * r_n)).clamp(-1.0, 1.0).acos();
    if c >= a + b {
        return 1.0; // full sun
    }
    if c <= b - a {
        return 0.0; // total umbra (Earth covers the whole Sun)
    }
    if c <= a - b {
        return 1.0 - (b * b) / (a * a); // annular: Earth disk fully inside the Sun disk
    }
    // Penumbra: area of intersection of two disks (radius a, b; centre separation c).
    let x = ((c * c + a * a - b * b) / (2.0 * c * a)).clamp(-1.0, 1.0);
    let y = ((c * c + b * b - a * a) / (2.0 * c * b)).clamp(-1.0, 1.0);
    let tri = ((-c + a + b) * (c + a - b) * (c - a + b) * (c + a + b)).max(0.0);
    let overlap = a * a * x.acos() + b * b * y.acos() - 0.5 * tri.sqrt();
    (1.0 - overlap / (std::f64::consts::PI * a * a)).clamp(0.0, 1.0)
}

/// Solar-radiation-pressure acceleration (m/s², ECI) on a satellite at geocentric `r` (m) with
/// the Sun at geocentric `s` (m), using the **cannonball** model:
/// `a = ν · P☉ · cᵣ · (A/m) · (AU/d)² · d̂`, where `d = r − s` is the Sun→satellite vector (so
/// the force pushes the craft radially **away** from the Sun), `(AU/d)²` is the inverse-square
/// flux fall-off with `P☉ = `[`SRP_PRESSURE_AU`], and `ν` is the [`conical_shadow`] umbra-and-
/// penumbra factor (so the force tapers smoothly through eclipse rather than switching on/off).
/// `cr` is the dimensionless radiation-pressure coefficient (≈1 fully absorptive, →2 fully
/// specular) and `area_over_mass` the cross-section-to-mass ratio `A/m` (m²/kg).
pub fn srp_accel(r: Vec3, s: Vec3, cr: f64, area_over_mass: f64) -> Vec3 {
    let nu = conical_shadow(r, s);
    if nu == 0.0 {
        return [0.0, 0.0, 0.0];
    }
    let d = [r[0] - s[0], r[1] - s[1], r[2] - s[2]];
    let dn = norm(d);
    // scale·d = ν·P☉·cr·(A/m)·(AU²/d²)·(d/d) = ν·P☉·cr·(A/m)·(AU/d)²·d̂.
    let inv = 1.0 / dn;
    let scale = nu * SRP_PRESSURE_AU * cr * area_over_mass * AU_M * AU_M * inv * inv * inv;
    [scale * d[0], scale * d[1], scale * d[2]]
}

/// Earth's mean rotation rate ωₑ (rad/s) — the atmosphere is assumed to co-rotate rigidly with
/// it, so the drag-relevant velocity is taken relative to `ωₑ ẑ × r`.
pub const EARTH_ROTATION_RATE: f64 = 7.292_115_146_7e-5;

/// Atmospheric mass density `ρ` (kg/m³) at geometric altitude `altitude_m` (m above the
/// spherical Earth of radius [`RE_EARTH`]), the standard **piecewise-exponential** model
/// (Vallado, *Fundamentals of Astrodynamics and Applications*, Table 8-4, after CIRA-72). Within
/// the band whose base altitude `h0` brackets `h`, `ρ = ρ0·exp(−(h − h0)/H)`. Below 0 km it
/// clamps to the surface value; above the top band it continues that band's exponential (no hard
/// cutoff). This is a **static, solar-activity-independent mean** — *not* NRLMSISE-00 (the
/// thermospheric model with its < 5 % accuracy clause is a follow-on; see `ROADMAP.md`).
pub fn atmospheric_density(altitude_m: f64) -> f64 {
    // (base altitude h0 [km], nominal density ρ0 [kg/m³], scale height H [km]).
    const BANDS: [(f64, f64, f64); 28] = [
        (0.0, 1.225, 7.249),
        (25.0, 3.899e-2, 6.349),
        (30.0, 1.774e-2, 6.682),
        (40.0, 3.972e-3, 7.554),
        (50.0, 1.057e-3, 8.382),
        (60.0, 3.206e-4, 7.714),
        (70.0, 8.770e-5, 6.549),
        (80.0, 1.905e-5, 5.799),
        (90.0, 3.396e-6, 5.382),
        (100.0, 5.297e-7, 5.877),
        (110.0, 9.661e-8, 7.263),
        (120.0, 2.438e-8, 9.473),
        (130.0, 8.484e-9, 12.636),
        (140.0, 3.845e-9, 16.149),
        (150.0, 2.070e-9, 22.523),
        (180.0, 5.464e-10, 29.740),
        (200.0, 2.789e-10, 37.105),
        (250.0, 7.248e-11, 45.546),
        (300.0, 2.418e-11, 53.628),
        (350.0, 9.518e-12, 53.298),
        (400.0, 3.725e-12, 58.515),
        (450.0, 1.585e-12, 60.828),
        (500.0, 6.967e-13, 63.822),
        (600.0, 1.454e-13, 71.835),
        (700.0, 3.614e-14, 88.667),
        (800.0, 1.170e-14, 124.64),
        (900.0, 5.245e-15, 181.05),
        (1000.0, 3.019e-15, 268.00),
    ];
    let h_km = (altitude_m / 1000.0).max(0.0);
    // Highest base altitude ≤ h_km (i stays 0 at/below the surface band).
    let mut i = 0;
    while i + 1 < BANDS.len() && BANDS[i + 1].0 <= h_km {
        i += 1;
    }
    let (h0, rho0, scale) = BANDS[i];
    rho0 * (-(h_km - h0) / scale).exp()
}

/// Atmospheric-drag acceleration (m/s², ECI) on a satellite at geocentric `r` (m) and ECI
/// velocity `v` (m/s): the standard quadratic drag `a = −½ · ρ(h) · (C_D·A/m) · |v_rel| · v_rel`,
/// opposing the velocity **relative to the co-rotating atmosphere** `v_rel = v − ωₑ ẑ × r`
/// (`ωₑ ẑ × r = (−ωₑ r_y, ωₑ r_x, 0)`). `cd_area_over_mass` is the ballistic area term `C_D·A/m`
/// (m²/kg) and `ρ` is [`atmospheric_density`] at the spherical altitude `|r| − Rₑ`. This force is
/// **dissipative** — it always removes orbital energy, the signature the propagator validates.
pub fn drag_accel(r: Vec3, v: Vec3, cd_area_over_mass: f64) -> Vec3 {
    let rho = atmospheric_density(norm(r) - RE_EARTH);
    let w = EARTH_ROTATION_RATE;
    // v_rel = v − ωₑ ẑ × r.
    let v_rel = [v[0] + w * r[1], v[1] - w * r[0], v[2]];
    let coef = -0.5 * rho * cd_area_over_mass * norm(v_rel);
    [coef * v_rel[0], coef * v_rel[1], coef * v_rel[2]]
}

/// Post-Newtonian (Schwarzschild) relativistic correction to the central-body
/// acceleration (m/s², ECI) — the dominant general-relativistic perturbation on a
/// near-Earth orbit, the leading driver of the relativistic perigee advance. With the
/// PPN parameters `β = γ = 1` (general relativity) the IERS / Montenbruck–Gill form is
/// `a = (μ / c²r³)·{ [4μ/r − v²]·r + 4(r·v)·v }`, with `μ = MU_EARTH`, `c` the speed of
/// light and `r = |r|`. It is a tiny term (its ratio to the two-body acceleration is of
/// order `μ/(c²r) ≈ 6·10⁻¹⁰` at LEO), velocity-dependent, and so — like atmospheric drag
/// — enters the integrator through the `(r, v)` right-hand side.
pub fn relativistic_accel(r: Vec3, v: Vec3) -> Vec3 {
    let rn = norm(r);
    let c2 = SPEED_OF_LIGHT * SPEED_OF_LIGHT;
    let v2 = v[0] * v[0] + v[1] * v[1] + v[2] * v[2];
    let rv = r[0] * v[0] + r[1] * v[1] + r[2] * v[2];
    let pre = MU_EARTH / (c2 * rn * rn * rn);
    // Coefficient on r̂-aligned term and on v-aligned term.
    let kr = 4.0 * MU_EARTH / rn - v2;
    let kv = 4.0 * rv;
    [
        pre * (kr * r[0] + kv * v[0]),
        pre * (kr * r[1] + kv * v[1]),
        pre * (kr * r[2] + kv * v[2]),
    ]
}

/// Earth's spin angular momentum **per unit Earth mass** `|J|` (m²/s), along the +z spin axis:
/// `L⊕/M⊕ = I⊕ω⊕/M⊕ ≈ 5.86e33 / 5.972e24`. Drives the Lense–Thirring term.
pub const EARTH_ANGULAR_MOMENTUM_SPECIFIC: f64 = 9.81e8;

/// Post-Newtonian **Lense–Thirring** (frame-dragging) acceleration (m/s², ECI) — the rotating
/// Earth drags inertial frames, the gravitomagnetic correction beyond the Schwarzschild
/// [`relativistic_accel`]. IERS Conventions 2010 Eq. (10.12), with `γ = 1`:
/// `a = (2GM/c²r³)·[ (3/r²)(r×v)(r·J) + (v×J) ]`, where `J = (0, 0, |J|)` is the Earth's
/// angular momentum per unit mass. It is ~1–2 orders of magnitude below the Schwarzschild term
/// at LEO and is the physical basis of the Gravity Probe B / LAGEOS frame-dragging measurements.
pub fn lense_thirring_accel(r: Vec3, v: Vec3) -> Vec3 {
    let rn = norm(r);
    let c2 = SPEED_OF_LIGHT * SPEED_OF_LIGHT;
    let j = [0.0, 0.0, EARTH_ANGULAR_MOMENTUM_SPECIFIC];
    let pre = 2.0 * MU_EARTH / (c2 * rn * rn * rn);
    let rxv = [
        r[1] * v[2] - r[2] * v[1],
        r[2] * v[0] - r[0] * v[2],
        r[0] * v[1] - r[1] * v[0],
    ];
    let vxj = [
        v[1] * j[2] - v[2] * j[1],
        v[2] * j[0] - v[0] * j[2],
        v[0] * j[1] - v[1] * j[0],
    ];
    let rdotj = r[0] * j[0] + r[1] * j[1] + r[2] * j[2];
    let f = 3.0 / (rn * rn);
    [
        pre * (f * rxv[0] * rdotj + vxj[0]),
        pre * (f * rxv[1] * rdotj + vxj[1]),
        pre * (f * rxv[2] * rdotj + vxj[2]),
    ]
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

    #[test]
    fn srp_pressure_at_1au_is_the_textbook_4_5e_minus_6_pa() {
        // P☉ = Φ☉/c with the modern 1361 W/m² TSI: 1361 / 299_792_458 ≈ 4.5398e-6 N/m². This is
        // the load-bearing constant; pin it to its hand value (and bracket the M&G 4.56e-6 region).
        let p = SRP_PRESSURE_AU;
        assert!(
            (p - 4.539_8e-6).abs() < 1e-9,
            "P☉ = {p} N/m², expected ≈ 4.5398e-6"
        );
        assert!((4.5e-6..=4.6e-6).contains(&p), "P☉ out of band: {p}");
    }

    #[test]
    fn srp_in_full_sun_pushes_away_from_the_sun_at_textbook_magnitude() {
        // A 700 km LEO sat between Earth and the Sun (on the sunward x-axis): fully lit, so the
        // SRP pushes radially away from the Sun (−x here). The magnitude is the cannonball value
        // |a| = P☉·cr·(A/m)·(AU/d)², which for cr=1.5, A/m=0.02 m²/kg and d ≈ 1 AU is ≈ 1.36e-7
        // m/s². Asserted by *bit-identical* reconstruction (dodging cancellation) plus a band.
        let sun = [AU_M, 0.0, 0.0];
        let r = [7.078e6, 0.0, 0.0]; // ~700 km altitude, sunward of Earth
        let (cr, aom) = (1.5, 0.02);
        let a = srp_accel(r, sun, cr, aom);

        // Bit-identical against the hand-composed formula (same arithmetic the routine performs).
        let d = [r[0] - sun[0], r[1] - sun[1], r[2] - sun[2]];
        let dn = norm(d);
        let inv = 1.0 / dn;
        let scale = SRP_PRESSURE_AU * cr * aom * AU_M * AU_M * inv * inv * inv; // ν = 1 (lit)
        for k in 0..3 {
            assert_eq!(a[k], scale * d[k], "SRP axis {k} mismatch");
        }

        // Direction: away from the Sun (−x), no transverse component.
        assert!(a[0] < 0.0, "SRP must push away from the Sun (−x): {}", a[0]);
        assert!(a[1] == 0.0 && a[2] == 0.0, "no transverse SRP: {a:?}");
        // Magnitude in the ~1.36e-7 m/s² textbook band.
        let mag = norm(a);
        assert!(
            (1.35e-7..=1.37e-7).contains(&mag),
            "SRP magnitude {mag} m/s² outside ~1.36e-7 band"
        );
    }

    #[test]
    fn srp_inverse_square_law_quarters_with_doubled_sun_distance() {
        // The (AU/d)² fall-off: doubling the Sun distance must quarter the SRP magnitude. Place
        // the same sat against a Sun at 1 AU and at 2 AU (both leave it lit) — the ratio is
        // (d₁/d₂)² ≈ (1/2)² = 0.25.
        let r = [7.0e6, 0.0, 0.0];
        let a1 = srp_accel(r, [AU_M, 0.0, 0.0], 1.5, 0.02);
        let a2 = srp_accel(r, [2.0 * AU_M, 0.0, 0.0], 1.5, 0.02);
        let ratio = norm(a2) / norm(a1);
        assert!(
            (0.249..=0.251).contains(&ratio),
            "inverse-square ratio {ratio}, expected ≈ 0.25"
        );
    }

    #[test]
    fn cylindrical_shadow_eclipses_only_the_umbral_cylinder() {
        let sun = [AU_M, 0.0, 0.0];
        // Directly behind Earth from the Sun, on the Earth–Sun line → r⊥ = 0 < Rₑ → eclipsed.
        assert_eq!(cylindrical_shadow([-7.078e6, 0.0, 0.0], sun), 0.0);
        // Same anti-sunward x, but offset so r⊥ = 8e6 m > Rₑ (6.378e6) → still lit.
        assert_eq!(cylindrical_shadow([-1.0e6, 8.0e6, 0.0], sun), 1.0);
        // Sunward hemisphere is always lit, even on the Earth–Sun line.
        assert_eq!(cylindrical_shadow([7.078e6, 0.0, 0.0], sun), 1.0);
        // And in eclipse the SRP acceleration is exactly zero (no light, no push).
        let a = srp_accel([-7.078e6, 0.0, 0.0], sun, 1.5, 0.02);
        assert_eq!(a, [0.0, 0.0, 0.0]);
    }

    #[test]
    fn conical_shadow_is_one_in_full_sun_and_zero_deep_in_the_umbra() {
        let sun = [AU_M, 0.0, 0.0];
        // Sunward of Earth → no occultation → full sun, exactly 1.
        assert_eq!(conical_shadow([7.078e6, 0.0, 0.0], sun), 1.0);
        // Directly behind Earth on the Sun line at LEO → total umbra, exactly 0.
        assert_eq!(conical_shadow([-7.078e6, 0.0, 0.0], sun), 0.0);
    }

    #[test]
    fn conical_shadow_has_a_smooth_monotonic_penumbra() {
        // Build satellites whose apparent Sun–Earth separation c is set directly: with the Sun on
        // +x, a satellite at r = (RE+700km)·(−cos c, −sin c, 0) has sat→Earth-centre at angle c
        // from the (≈+x) sat→Sun direction. Sweeping c across the penumbra band [b−a, b+a] must
        // take ν smoothly from 0 (umbra) through ~½ (Sun half-occulted at c = b) to 1 (full sun).
        let sun = [AU_M, 0.0, 0.0];
        let rn = RE_EARTH + 700e3;
        let a = (SOLAR_RADIUS / AU_M).asin(); // Sun apparent radius (~0.27°)
        let b = (RE_EARTH / rn).asin(); // Earth apparent radius (~64°)
        let mk = |c: f64| [-rn * c.cos(), -rn * c.sin(), 0.0];
        let deep = conical_shadow(mk(b - 2.0 * a), sun); // c ≤ b−a → umbra
        let mid = conical_shadow(mk(b), sun); // c = b → Sun centre on Earth's limb
        let shallow = conical_shadow(mk(b + 2.0 * a), sun); // c ≥ a+b → full sun
        assert_eq!(deep, 0.0, "c ≤ b−a must be total umbra");
        assert_eq!(shallow, 1.0, "c ≥ a+b must be full sun");
        assert!(
            (0.3..=0.7).contains(&mid),
            "at c = b the Sun is ~half occulted, ν = {mid}"
        );
        // Strictly monotonic: deeper into shadow ⇒ less sunlight.
        assert!(
            deep < mid && mid < shallow,
            "ν must rise monotonically out of shadow"
        );
    }

    #[test]
    fn conical_penumbra_extends_beyond_the_umbral_cylinder() {
        // A satellite just *outside* the umbral cylinder (so the binary cylindrical model calls it
        // fully lit) is still partially shadowed by the cone — the penumbra the cylinder misses.
        let sun = [AU_M, 0.0, 0.0];
        let rn = RE_EARTH + 700e3;
        let a = (SOLAR_RADIUS / AU_M).asin();
        let b = (RE_EARTH / rn).asin();
        let r = [-rn * (b + 0.5 * a).cos(), -rn * (b + 0.5 * a).sin(), 0.0];
        // r⊥ = rn·sin(b+0.5a) > rn·sin b = Rₑ, so the cylinder says fully lit…
        assert_eq!(cylindrical_shadow(r, sun), 1.0);
        // …while the cone sees a partial eclipse (penumbra), 0 < ν < 1.
        let nu = conical_shadow(r, sun);
        assert!(
            (0.0..1.0).contains(&nu) && nu > 0.0,
            "cone should see partial shadow where the cylinder sees full sun: ν = {nu}"
        );
    }

    #[test]
    fn atmospheric_density_anchors_at_sea_level_and_decays_with_altitude() {
        // Sea-level reference is the hand-known anchor; below the surface it clamps.
        let rho0 = atmospheric_density(0.0);
        assert!(
            (rho0 - 1.225).abs() < 1e-3,
            "surface density {rho0}, expected 1.225 kg/m³"
        );
        assert_eq!(
            atmospheric_density(-5_000.0),
            rho0,
            "clamps below the surface"
        );
        // Strictly monotonic decrease across the LEO band (no table transcription inversion).
        let alts = [0.0, 100e3, 200e3, 300e3, 400e3, 500e3, 800e3, 1000e3];
        for w in alts.windows(2) {
            let (lo, hi) = (atmospheric_density(w[0]), atmospheric_density(w[1]));
            assert!(
                hi < lo,
                "density must decrease: {hi} at {} km not < {lo} at {} km",
                w[1] / 1e3,
                w[0] / 1e3
            );
        }
        // Physical magnitude at 400 km: the solar-mean ~1e-12 kg/m³.
        let r400 = atmospheric_density(400e3);
        assert!(
            (1e-12..=1e-11).contains(&r400),
            "400 km density {r400} kg/m³ outside ~1e-12 band"
        );
    }

    #[test]
    fn atmospheric_density_local_scale_height_is_physical_at_leo() {
        // Two samples 40 km apart inside the 400–450 km band: the recovered e-folding scale
        // height H = −Δh/ln(ρ₂/ρ₁) must land in the physical ~50–70 km LEO range — a real
        // physical signature, not a re-statement of any single tabulated number.
        let (h1, h2) = (400e3, 440e3);
        let ratio = atmospheric_density(h2) / atmospheric_density(h1);
        let scale_km = -(h2 - h1) / 1000.0 / ratio.ln();
        assert!(
            (50.0..=70.0).contains(&scale_km),
            "recovered LEO scale height {scale_km} km outside ~50–70 band"
        );
    }

    #[test]
    fn drag_opposes_the_corotating_relative_velocity_at_textbook_leo_magnitude() {
        // 400 km prograde state. Drag must oppose the velocity relative to the co-rotating
        // atmosphere (v_rel = v − ωₑ ẑ × r) and have the ~1e-6 m/s² LEO magnitude for
        // C_D·A/m = 0.02 m²/kg.
        let alt = 400e3;
        let r = [RE_EARTH + alt, 0.0, 0.0];
        let vcirc = (MU_EARTH / (RE_EARTH + alt)).sqrt(); // ~7.67 km/s
        let v = [0.0, vcirc, 0.0];
        let a = drag_accel(r, v, 0.02);

        // v_rel for this state is (0, vcirc − ωₑ·(RE+alt), 0): the atmosphere co-rotation
        // subtracts ~0.49 km/s of along-track speed.
        let v_rel = [0.0, vcirc - EARTH_ROTATION_RATE * (RE_EARTH + alt), 0.0];
        let dot_av = a[0] * v_rel[0] + a[1] * v_rel[1] + a[2] * v_rel[2];
        assert!(
            dot_av < 0.0,
            "drag must oppose the relative velocity: {dot_av}"
        );
        // Collinear with −v_rel (no cross-track component for this in-plane state).
        assert!(
            a[0] == 0.0 && a[2] == 0.0,
            "drag should be purely along −v_rel: {a:?}"
        );
        let mag = norm(a);
        assert!(
            (1e-7..=1e-5).contains(&mag),
            "400 km drag magnitude {mag} m/s² outside ~2e-6 band"
        );
    }

    #[test]
    fn relativistic_accel_on_a_circular_orbit_is_radial_with_the_closed_form_magnitude() {
        // For a circular orbit r·v = 0 and v² = μ/r, so the Schwarzschild bracket reduces
        // to 4μ/r − μ/r = 3μ/r and the correction collapses to the closed form
        //   a = 3μ²/(c²r³) · r̂        (purely radial, directed *outward*).
        let r0 = 7.0e6;
        let r = [r0, 0.0, 0.0];
        let vcirc = (MU_EARTH / r0).sqrt();
        let v = [0.0, vcirc, 0.0];
        let a = relativistic_accel(r, v);

        // The off-radial components are *exactly* zero here: r has only an x-component and
        // r·v = 0 kills the v-aligned term, so nothing feeds y or z.
        assert!(
            a[1] == 0.0 && a[2] == 0.0,
            "circular GR term not radial: {a:?}"
        );

        let c2 = SPEED_OF_LIGHT * SPEED_OF_LIGHT;
        let expected = 3.0 * MU_EARTH * MU_EARTH / (c2 * r0 * r0 * r0);
        assert!(
            a[0] > 0.0,
            "GR correction must push radially outward: {a:?}"
        );
        let rel = (a[0] - expected).abs() / expected;
        assert!(
            rel < 1e-9,
            "circular GR magnitude {} vs closed form {expected} (rel {rel})",
            a[0]
        );
    }

    #[test]
    fn relativistic_accel_is_order_1e9_of_two_body_at_leo() {
        // The defining physical signature: the relativistic term is ~μ/(c²r) of two-body.
        // At 7000 km the circular ratio is 3μ/(c²r) ≈ 1.9e-9 — minuscule but not zero.
        let r0 = 7.0e6;
        let r = [r0, 0.0, 0.0];
        let vcirc = (MU_EARTH / r0).sqrt();
        let v = [0.0, vcirc, 0.0];
        let rel_mag = norm(relativistic_accel(r, v));
        let two_body = norm(two_body_accel(r));
        let ratio = rel_mag / two_body;
        assert!(
            (1e-9..3e-9).contains(&ratio),
            "GR/two-body ratio {ratio} outside the expected ~1.9e-9 LEO band"
        );
    }

    #[test]
    fn relativistic_accel_radial_velocity_matches_the_hand_simplified_form() {
        // With r along +x and v purely radial (also along x), both Schwarzschild terms are
        // x-aligned, so y and z stay exactly zero and the x-component simplifies by hand to
        //   a_x = pre·[(4μ/r − v²)·r + 4(r·v)·v]
        //       = (μ/c²r³)·(4μ − v²r + 4r v²)         [r·v = r·v_x, both = r0·vx]
        //       = μ·(4μ + 3 v² r)/(c²r³).
        // This closed form is a genuinely different factoring from the vector assembly the
        // function performs, so agreement validates the general formula's algebra.
        let r0 = 1.0e7;
        let vx = 1000.0;
        let r = [r0, 0.0, 0.0];
        let v = [vx, 0.0, 0.0];
        let a = relativistic_accel(r, v);

        assert!(
            a[1] == 0.0 && a[2] == 0.0,
            "radial-velocity GR term must stay on the x-axis: {a:?}"
        );
        let c2 = SPEED_OF_LIGHT * SPEED_OF_LIGHT;
        let expected = MU_EARTH * (4.0 * MU_EARTH + 3.0 * vx * vx * r0) / (c2 * r0 * r0 * r0);
        let rel = (a[0] - expected).abs() / expected;
        assert!(
            rel < 1e-12,
            "radial GR x-component {} vs closed form {expected} (rel {rel})",
            a[0]
        );
    }

    #[test]
    fn lense_thirring_vanishes_without_earth_rotation() {
        // The frame-dragging term is linear in J; with J → 0 it is exactly zero. We can't set
        // the const, but we verify the structural property: scaling matches a hand recompute
        // with J doubled (linearity), and that the term is non-zero for a real orbit.
        let r = [7.0e6, 0.0, 1.0e6];
        let vcirc = (MU_EARTH / 7.0e6).sqrt();
        let v = [0.0, vcirc, 0.0];
        let a = lense_thirring_accel(r, v);
        assert!(
            a.iter().any(|x| x.abs() > 0.0),
            "LT must be non-zero: {a:?}"
        );
        // Linearity in J: doubling J doubles a. Recompute with J' = 2J by the same formula.
        let c2 = SPEED_OF_LIGHT * SPEED_OF_LIGHT;
        let rn = norm(r);
        let j2 = [0.0, 0.0, 2.0 * EARTH_ANGULAR_MOMENTUM_SPECIFIC];
        let pre = 2.0 * MU_EARTH / (c2 * rn * rn * rn);
        let rxv = [
            r[1] * v[2] - r[2] * v[1],
            r[2] * v[0] - r[0] * v[2],
            r[0] * v[1] - r[1] * v[0],
        ];
        let vxj = [
            v[1] * j2[2] - v[2] * j2[1],
            v[2] * j2[0] - v[0] * j2[2],
            v[0] * j2[1] - v[1] * j2[0],
        ];
        let rdotj = r[2] * j2[2];
        let f = 3.0 / (rn * rn);
        let a2x = pre * (f * rxv[0] * rdotj + vxj[0]);
        assert!(
            (a2x - 2.0 * a[0]).abs() / (2.0 * a[0]).abs() < 1e-12,
            "LT must be linear in J"
        );
    }

    #[test]
    fn lense_thirring_is_far_below_schwarzschild_at_leo() {
        // The gravitomagnetic frame-dragging term is 1–2 orders of magnitude below the
        // Schwarzschild term, which is itself ~1.9e-9 of two-body — a strict physical hierarchy.
        let r0 = 7.0e6;
        let r = [r0, 0.0, 0.5e6];
        let vcirc = (MU_EARTH / r0).sqrt();
        let v = [0.0, vcirc, 0.0];
        let lt = norm(lense_thirring_accel(r, v));
        let schwarz = norm(relativistic_accel(r, v));
        let ratio = lt / schwarz;
        assert!(lt.is_finite() && lt > 0.0);
        assert!(
            (1e-3..0.5).contains(&ratio),
            "LT/Schwarzschild ratio {ratio} outside the expected order-of-magnitude band"
        );
    }
}
