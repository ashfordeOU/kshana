// SPDX-License-Identifier: AGPL-3.0-only
// Third-party data: the Galileo box-wing tables below (areas, optical properties, masses) are
// from the GSC Galileo satellite metadata, (c) EU 2011-2026, reproduced with acknowledgement
// under the GSC copyright notice (gsc-europa.eu/terms-of-use#copyright), accessed 2026-10-13.
// They are not covered by the AGPL; see NOTICE.
//! **Non-cannonball solar radiation pressure: a box-wing flat-plate model and the ECOM2
//! empirical model, with estimation partials.** Opt-in: the box-wing is wired into
//! [`crate::propagator::ForceModel::srp_boxwing`] and
//! [`crate::precise_od::PreciseForceModel::srp_boxwing`] (both `None` by default, so the
//! cannonball [`crate::forces::srp_accel`] path is unchanged unless a model is set); ECOM2 is
//! not wired into either force model.
//!
//! # Conventions (stated once, used everywhere in this module)
//!
//! * All vectors are geocentric inertial (the same frame as `r`, `v`, `s`), SI units.
//!   `s` is the geocentric Sun position, `r`/`v` the satellite position/velocity.
//! * `ŝ = (s − r)/|s − r|` is the unit vector **from the satellite to the Sun**; `d = |s − r|`.
//! * Solar pressure at the satellite: `P = P☉·(AU/d)²` with `P☉ =`
//!   [`SRP_PRESSURE_AU`](crate::forces::SRP_PRESSURE_AU) `= 1361/c` N/m² and
//!   `AU =` [`AU_M`](crate::ephem::AU_M), the same flux model as the cannonball.
//! * The eclipse factor `ν ∈ [0, 1]` is supplied by the caller (for example
//!   [`crate::forces::conical_shadow`]); every acceleration here is linear in `ν`.
//!
//! # Box-wing flat plates
//!
//! For one flat plate of area `A`, unit normal `n̂`, absorption `α`, specular reflectivity
//! `ρ` and diffuse reflectivity `δ` (`α + ρ + δ = 1`), illuminated at `cos θ = n̂·ŝ > 0`,
//!
//! ```text
//! F = −P·A·cos θ·[ (α + δ)·ŝ + 2·(ρ·cos θ + δ/3)·n̂ ]
//! ```
//!
//! (Vallado, *Fundamentals of Astrodynamics and Applications*, eq. 8-44; Milani et al. 1987).
//! Both terms point **away from the Sun** (against `ŝ` and against the sunward normal).
//! No thermal re-emission is modelled (neither the Galileo metadata nor Orekit 12.2's
//! `BoxAndSolarArraySpacecraft` include it). The acceleration is `ν·k·ΣF/m` with an overall
//! scale factor `k` (1 nominal), the estimable "radiation factor".
//!
//! * [`PanelKind::Fixed`] panels are **single-sided**: lit only when `n̂·ŝ > 0`.
//! * [`PanelKind::SunPointing`] panels (solar wings) rotate about `axis_body`; the normal is
//!   the component of `ŝ` perpendicular to the axis, normalised, so the panel is always lit
//!   from its front (`cos θ = |ŝ⊥|`). This is the same rule as Orekit 12.2's `PointingPanel`.
//!
//! # Attitude: nominal GNSS yaw steering
//!
//! [`gnss_yaw_steering`] returns the body-to-inertial matrix of the **IGS / ANTEX
//! (GPS Block II/IIA) convention**: `+Z = −r̂` (toward the Earth centre),
//! `+Y = unit(Z × ŝ)` (the solar-array axis, perpendicular to the Sun),
//! `+X = Y × Z` (so `+X` lies in the Sun's hemisphere). This is the convention of
//! Montenbruck et al. (2015), J Geod 89:283, and of the GSC Galileo metadata, section 3.2
//! ("Yaw Steering Law (ANTEX Reference Frame Convention)": "the +X axis points toward the
//! Sun"). The Galileo *mechanical* frame has `+X` toward deep space instead: it is the IGS
//! frame rotated 180° about `Z` (`X_mech = −X_igs`, `Y_mech = −Y_igs`). The Galileo panels in
//! [`BoxWing::galileo_foc`] / [`BoxWing::galileo_iov`] are transcribed in the mechanical frame
//! and mapped to the IGS frame by that rotation. The GSC "modified" yaw law near Sun/orbit
//! colinearity (low β) is **not** modelled.
//!
//! # ECOM2 (Arnold et al. 2015, J Geod 89:775)
//!
//! `a = ν·[ D(Δu)·e_D + Y(Δu)·e_Y + B(Δu)·e_B ]` with
//! `D = D0 + D2c cos 2Δu + D2s sin 2Δu + D4c cos 4Δu + D4s sin 4Δu`, `Y = Y0`,
//! `B = B0 + B1c cos Δu + B1s sin Δu` (the paper's D2/B1 parameterisation, m/s²).
//! `e_D = ŝ`, `e_Y = unit(e_D × r)`, `e_B = e_D × e_Y`. In nominal yaw steering `e_Y` is the
//! body `+Y` (solar-array) axis: `unit(Z × ŝ) = unit(−r̂ × ŝ) = unit(ŝ × r)`.
//! `Δu = u − u_s` is the satellite's argument of latitude measured from the Sun's projection
//! into the orbital plane: with `h = r × v`, `y_o = unit(h × s)`, `x_o = unit(y_o × h)`,
//! `Δu = atan2(r·y_o, r·x_o)` (this is the same construction as Orekit 12.2 `ECOM2`).
//! As in the paper's formula and in Orekit, there is **no** `(AU/d)²` factor: the parameters
//! are accelerations at the epoch's distance.
//!
//! # Evidence
//!
//! The flat-plate sum, its radiation-factor and per-panel partials, [`gnss_yaw_steering`] and
//! the ECOM2 acceleration and partials agree with Orekit 12.2 (`BoxAndSolarArraySpacecraft`,
//! `SolarRadiationPressure`, `GenericGNSS`, `ECOM2`) to about 1e-15 relative (per-panel partials
//! 4e-13 against Orekit central differences), under the pre-registration in
//! `xval/srp-boxwing-orekit/` (`tests/srp_boxwing_orekit_oracle.rs`): VALIDATED as model
//! evaluations. The Galileo box-wing tables are published data (GSC, © EU 2011-2026),
//! transcribed, not oracle-checked beyond transcription; whether a box-wing is adequate for real
//! Galileo orbits is not shown, so the SRP prediction stays MODELLED. The synthetic
//! ECOM2-on-box-wing fit is MODELLED (internal consistency only).

use crate::ephem::AU_M;
use crate::forces::SRP_PRESSURE_AU;

type Vec3 = [f64; 3];
/// A 3×3 matrix stored row-major: `m[i][j]` is row `i`, column `j`.
pub type Mat3 = [[f64; 3]; 3];

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
fn scale3(k: f64, a: Vec3) -> Vec3 {
    [k * a[0], k * a[1], k * a[2]]
}
fn add3(a: Vec3, b: Vec3) -> Vec3 {
    [a[0] + b[0], a[1] + b[1], a[2] + b[2]]
}
fn sub3(a: Vec3, b: Vec3) -> Vec3 {
    [a[0] - b[0], a[1] - b[1], a[2] - b[2]]
}
fn unit(a: Vec3) -> Vec3 {
    let n = norm(a);
    if n > 0.0 {
        scale3(1.0 / n, a)
    } else {
        [0.0, 0.0, 0.0]
    }
}
/// `m·x`.
fn mat_vec(m: &Mat3, x: Vec3) -> Vec3 {
    [dot(m[0], x), dot(m[1], x), dot(m[2], x)]
}
/// `mᵀ·x`.
fn mat_t_vec(m: &Mat3, x: Vec3) -> Vec3 {
    [
        m[0][0] * x[0] + m[1][0] * x[1] + m[2][0] * x[2],
        m[0][1] * x[0] + m[1][1] * x[1] + m[2][1] * x[2],
        m[0][2] * x[0] + m[1][2] * x[1] + m[2][2] * x[2],
    ]
}

// ---------------------------------------------------------------------------------------
// Box-wing
// ---------------------------------------------------------------------------------------

/// How a panel's normal is obtained.
#[derive(Clone, Copy, Debug, PartialEq)]
pub enum PanelKind {
    /// Body-fixed, single-sided: the normal is `Panel::normal_body` (normalised).
    Fixed,
    /// Rotates about `axis_body` to face the Sun as closely as possible (a solar wing). The
    /// normal is `unit(ŝ_b − (ŝ_b·â)â)`; `Panel::normal_body` is ignored.
    SunPointing {
        /// Rotation axis in the body frame (normalised internally).
        axis_body: [f64; 3],
    },
}

/// One flat plate.
#[derive(Clone, Debug, PartialEq)]
pub struct Panel {
    /// Area (m²).
    pub area_m2: f64,
    /// Outward normal in the body frame (normalised internally; unused for sun-pointing).
    pub normal_body: [f64; 3],
    /// Absorption coefficient `α`.
    pub absorption: f64,
    /// Specular reflection coefficient `ρ`.
    pub specular: f64,
    /// Diffuse reflection coefficient `δ` (`α + ρ + δ = 1`).
    pub diffuse: f64,
    /// Fixed or sun-pointing.
    pub kind: PanelKind,
}

impl Panel {
    /// A body-fixed single-sided plate.
    pub fn fixed(
        area_m2: f64,
        normal_body: Vec3,
        absorption: f64,
        specular: f64,
        diffuse: f64,
    ) -> Self {
        Panel {
            area_m2,
            normal_body,
            absorption,
            specular,
            diffuse,
            kind: PanelKind::Fixed,
        }
    }
    /// A sun-pointing plate rotating about `axis_body`.
    pub fn sun_pointing(
        area_m2: f64,
        axis_body: Vec3,
        absorption: f64,
        specular: f64,
        diffuse: f64,
    ) -> Self {
        Panel {
            area_m2,
            normal_body: [0.0, 0.0, 0.0],
            absorption,
            specular,
            diffuse,
            kind: PanelKind::SunPointing { axis_body },
        }
    }

    /// The sunward normal and `cos θ` for a body-frame Sun direction `sun_b` (unit), or
    /// `None` when the panel is not lit (fixed panel with `n̂·ŝ ≤ 0`, or a sun-pointing panel
    /// whose axis is parallel to the Sun direction).
    pub fn lit_normal(&self, sun_b: Vec3) -> Option<(Vec3, f64)> {
        match self.kind {
            PanelKind::Fixed => {
                let n = unit(self.normal_body);
                let c = dot(n, sun_b);
                if c > 0.0 {
                    Some((n, c))
                } else {
                    None
                }
            }
            PanelKind::SunPointing { axis_body } => {
                let a = unit(axis_body);
                let d = dot(sun_b, a);
                let f = 1.0 - d * d;
                if f < f64::EPSILON {
                    return None;
                }
                let k = 1.0 / f.sqrt();
                let n = [
                    k * (sun_b[0] - d * a[0]),
                    k * (sun_b[1] - d * a[1]),
                    k * (sun_b[2] - d * a[2]),
                ];
                let c = dot(n, sun_b);
                if c > 0.0 {
                    Some((n, c))
                } else {
                    None
                }
            }
        }
    }
}

/// A box-wing spacecraft: a set of flat plates and a mass.
#[derive(Clone, Debug, PartialEq)]
pub struct BoxWing {
    /// The plates (body faces and wing faces).
    pub panels: Vec<Panel>,
    /// Spacecraft mass (kg).
    pub mass_kg: f64,
}

/// Mass of GSAT0101 (IOV), GSC Galileo satellite metadata section 4.1 ("as of April 2024").
pub const GALILEO_IOV_MASS_KG: f64 = 696.802;
/// Mass of GSAT0209 (FOC), GSC Galileo satellite metadata section 4.2 ("as of May 2026").
pub const GALILEO_FOC_MASS_KG: f64 = 707.879;

// Optical properties (α, ρ, δ), GSC Galileo satellite metadata, section 6
// (https://www.gsc-europa.eu/support-to-developers/galileo-satellite-metadata, © EU 2011-2026,
// reproduced with acknowledgement under the site's copyright notice).
const FOC_A: (f64, f64, f64) = (0.93, 0.00, 0.07);
const FOC_B: (f64, f64, f64) = (0.57, 0.22, 0.21);
const FOC_C: (f64, f64, f64) = (0.08, 0.73, 0.19);
const FOC_D: (f64, f64, f64) = (0.90, 0.10, 0.00);
const FOC_E: (f64, f64, f64) = (0.92, 0.08, 0.00);
const IOV_MLI: (f64, f64, f64) = (0.94, 0.00, 0.06);
const IOV_OSR_BOL: (f64, f64, f64) = (0.10, 0.72, 0.18);
const IOV_OSR_EOL: (f64, f64, f64) = (0.25, 0.60, 0.15);
const IOV_GE_KAPTON: (f64, f64, f64) = (0.57, 0.22, 0.21);
const IOV_CELLS: (f64, f64, f64) = (0.92, 0.08, 0.00);
const IOV_KAPTON_HN: (f64, f64, f64) = (0.90, 0.10, 0.00);

/// A fixed panel given in the Galileo **mechanical** frame, mapped to the IGS frame
/// (180° about Z: x → −x, y → −y).
fn mech_fixed(area: f64, normal_mech: Vec3, m: (f64, f64, f64)) -> Panel {
    Panel::fixed(
        area,
        [-normal_mech[0], -normal_mech[1], normal_mech[2]],
        m.0,
        m.1,
        m.2,
    )
}
fn wing(area: f64, m: (f64, f64, f64)) -> Panel {
    Panel::sun_pointing(area, [0.0, 1.0, 0.0], m.0, m.1, m.2)
}

const PX: Vec3 = [1.0, 0.0, 0.0];
const MX: Vec3 = [-1.0, 0.0, 0.0];
const PY: Vec3 = [0.0, 1.0, 0.0];
const MY: Vec3 = [0.0, -1.0, 0.0];
const PZ: Vec3 = [0.0, 0.0, 1.0];
const MZ: Vec3 = [0.0, 0.0, -1.0];

impl BoxWing {
    /// Galileo FOC box-wing, GSC Galileo satellite metadata section 6.2 (surfaces, areas and
    /// α/ρ/δ by material A–E), panels in the IGS body frame (see the module doc), two
    /// sun-pointing wings about body `Y` each of 3.880 m² (E, solar cells) + 1.530 m² (D),
    /// mass [`GALILEO_FOC_MASS_KG`].
    pub fn galileo_foc() -> Self {
        let panels = vec![
            mech_fixed(0.440, PX, FOC_A),
            mech_fixed(0.880, PX, FOC_C),
            mech_fixed(1.320, MX, FOC_A),
            mech_fixed(1.129, PY, FOC_A),
            mech_fixed(1.654, PY, FOC_C),
            mech_fixed(1.244, MY, FOC_A),
            mech_fixed(1.539, MY, FOC_C),
            mech_fixed(1.053, PZ, FOC_A),
            mech_fixed(1.969, PZ, FOC_B),
            mech_fixed(2.077, MZ, FOC_A),
            mech_fixed(0.959, MZ, FOC_C),
            wing(3.880, FOC_E),
            wing(1.530, FOC_D),
            wing(3.880, FOC_E),
            wing(1.530, FOC_D),
        ];
        BoxWing {
            panels,
            mass_kg: GALILEO_FOC_MASS_KG,
        }
    }

    /// Galileo IOV box-wing, beginning of life, GSC Galileo satellite metadata section 6.1.
    pub fn galileo_iov() -> Self {
        Self::galileo_iov_with(IOV_OSR_BOL)
    }

    /// Galileo IOV box-wing with the end-of-life optical surface radiator coefficients
    /// (the only BOL/EOL difference in GSC section 6.1).
    pub fn galileo_iov_eol() -> Self {
        Self::galileo_iov_with(IOV_OSR_EOL)
    }

    fn galileo_iov_with(osr: (f64, f64, f64)) -> Self {
        let panels = vec![
            mech_fixed(1.32, MX, IOV_MLI),
            mech_fixed(0.54, PX, IOV_MLI),
            mech_fixed(0.78, PX, osr),
            mech_fixed(1.00, PY, IOV_MLI),
            mech_fixed(2.00, PY, osr),
            mech_fixed(1.03, MY, IOV_MLI),
            mech_fixed(1.97, MY, osr),
            mech_fixed(1.72, PZ, IOV_MLI),
            mech_fixed(1.28, PZ, IOV_GE_KAPTON),
            mech_fixed(3.00, MZ, IOV_MLI),
            wing(3.88, IOV_CELLS),
            wing(1.53, IOV_KAPTON_HN),
            wing(3.88, IOV_CELLS),
            wing(1.53, IOV_KAPTON_HN),
        ];
        BoxWing {
            panels,
            mass_kg: GALILEO_IOV_MASS_KG,
        }
    }

    /// The same model with another mass.
    pub fn with_mass(mut self, mass_kg: f64) -> Self {
        self.mass_kg = mass_kg;
        self
    }

    /// Validate: positive mass, non-negative areas, coefficients in `[0, 1]` summing to 1
    /// within `1e-9`, non-zero normals/axes.
    pub fn check(&self) -> Result<(), String> {
        if !(self.mass_kg > 0.0 && self.mass_kg.is_finite()) {
            return Err(format!("mass_kg must be positive, got {}", self.mass_kg));
        }
        for (i, p) in self.panels.iter().enumerate() {
            if !(p.area_m2 >= 0.0 && p.area_m2.is_finite()) {
                return Err(format!("panel {i}: area must be >= 0"));
            }
            for (name, c) in [
                ("absorption", p.absorption),
                ("specular", p.specular),
                ("diffuse", p.diffuse),
            ] {
                if !(0.0..=1.0).contains(&c) {
                    return Err(format!("panel {i}: {name} = {c} outside [0, 1]"));
                }
            }
            let sum = p.absorption + p.specular + p.diffuse;
            if (sum - 1.0).abs() > 1e-9 {
                return Err(format!(
                    "panel {i}: absorption + specular + diffuse = {sum} != 1"
                ));
            }
            let dir = match p.kind {
                PanelKind::Fixed => p.normal_body,
                PanelKind::SunPointing { axis_body } => axis_body,
            };
            if norm(dir) == 0.0 {
                return Err(format!("panel {i}: zero normal/axis"));
            }
        }
        Ok(())
    }
}

/// Nominal GNSS yaw-steering attitude, body-to-inertial, IGS/ANTEX convention:
/// columns are the body axes in the inertial frame,
/// `Z = −r̂`, `Y = unit(Z × ŝ)`, `X = Y × Z` (`ŝ` satellite→Sun).
/// When the Sun is (numerically) colinear with `r`, `Y` falls back to `unit(Z × v)`
/// (yaw undefined there; real spacecraft use a modified law, not modelled).
/// Sources: Montenbruck et al. (2015), J Geod 89:283; GSC Galileo satellite metadata §3.2.
pub fn gnss_yaw_steering(r: Vec3, v: Vec3, s: Vec3) -> Mat3 {
    let z = scale3(-1.0, unit(r));
    let sh = unit(sub3(s, r));
    let mut y = cross(z, sh);
    if norm(y) < 1e-12 {
        y = cross(z, v);
    }
    let y = unit(y);
    let x = cross(y, z);
    [[x[0], y[0], z[0]], [x[1], y[1], z[1]], [x[2], y[2], z[2]]]
}

/// Solar pressure `P = P☉(AU/d)²` (N/m²) and the unit satellite→Sun vector.
fn pressure_and_sun_dir(r: Vec3, s: Vec3) -> (f64, Vec3) {
    let d = sub3(s, r);
    let dn = norm(d);
    debug_assert!(dn > 0.0, "satellite at the Sun's position");
    let q = AU_M / dn;
    (SRP_PRESSURE_AU * q * q, scale3(1.0 / dn, d))
}

/// Box-wing SRP acceleration (m/s²), scale factor 1. See [`boxwing_accel_scaled`].
pub fn boxwing_accel(r: Vec3, s: Vec3, attitude_body_to_eci: Mat3, bw: &BoxWing, nu: f64) -> Vec3 {
    boxwing_accel_scaled(r, s, attitude_body_to_eci, bw, 1.0, nu)
}

/// Box-wing SRP acceleration (m/s²): `ν·k·Σ_i F_i / m` with the flat-plate force of the
/// module doc for each lit panel, `k = scale`. `attitude_body_to_eci` maps body vectors to
/// inertial (`v_eci = A·v_body`).
pub fn boxwing_accel_scaled(
    r: Vec3,
    s: Vec3,
    attitude_body_to_eci: Mat3,
    bw: &BoxWing,
    scale: f64,
    nu: f64,
) -> Vec3 {
    if nu == 0.0 || scale == 0.0 {
        return [0.0, 0.0, 0.0];
    }
    let (p, sh) = pressure_and_sun_dir(r, s);
    let sun_b = mat_t_vec(&attitude_body_to_eci, sh);
    let mut f = [0.0; 3];
    for panel in &bw.panels {
        if let Some((n, c)) = panel.lit_normal(sun_b) {
            let pac = p * panel.area_m2 * c;
            let ks = -pac * (panel.absorption + panel.diffuse);
            let kn = -pac * 2.0 * (panel.specular * c + panel.diffuse / 3.0);
            f = add3(f, add3(scale3(ks, sun_b), scale3(kn, n)));
        }
    }
    let f_eci = mat_vec(&attitude_body_to_eci, f);
    scale3(nu * scale / bw.mass_kg, f_eci)
}

/// Box-wing SRP in nominal yaw steering, the form the force models use:
/// [`boxwing_accel_scaled`] with the attitude [`gnss_yaw_steering`]`(r, v, s)`, scale factor
/// `scale` and eclipse factor `nu`.
pub fn boxwing_srp_accel(r: Vec3, v: Vec3, s: Vec3, bw: &BoxWing, scale: f64, nu: f64) -> Vec3 {
    if nu == 0.0 || scale == 0.0 {
        return [0.0, 0.0, 0.0];
    }
    boxwing_accel_scaled(r, s, gnss_yaw_steering(r, v, s), bw, scale, nu)
}

/// Analytic partials of [`boxwing_accel_scaled`].
#[derive(Clone, Debug, PartialEq)]
pub struct BoxWingPartials {
    /// `∂a/∂k` (the acceleration at `k = 1`).
    pub d_scale: Vec3,
    /// `∂a/∂ρ_i` per panel, with `α_i = 1 − ρ_i − δ_i` eliminated. (Orekit 12.2 exposes only the
    /// global radiation factor, so only [`d_scale`](Self::d_scale) has a direct Orekit counterpart.)
    pub d_specular: Vec<Vec3>,
    /// `∂a/∂δ_i` per panel, with `α_i = 1 − ρ_i − δ_i` eliminated.
    pub d_diffuse: Vec<Vec3>,
}

/// Partials of the box-wing acceleration w.r.t. the scale factor and each panel's specular
/// and diffuse coefficients (absorption eliminated through `α + ρ + δ = 1`):
/// `∂F/∂ρ = −P A c (−ŝ + 2c n̂)`, `∂F/∂δ = −P A c (2/3) n̂`, scaled by `ν k / m`.
/// Unlit panels have zero partials.
pub fn boxwing_partials(
    r: Vec3,
    s: Vec3,
    attitude_body_to_eci: Mat3,
    bw: &BoxWing,
    scale: f64,
    nu: f64,
) -> BoxWingPartials {
    let (p, sh) = pressure_and_sun_dir(r, s);
    let sun_b = mat_t_vec(&attitude_body_to_eci, sh);
    let g = nu * scale / bw.mass_kg;
    let mut d_spec = Vec::with_capacity(bw.panels.len());
    let mut d_diff = Vec::with_capacity(bw.panels.len());
    for panel in &bw.panels {
        match panel.lit_normal(sun_b) {
            Some((n, c)) => {
                let pac = p * panel.area_m2 * c;
                let dr = add3(scale3(pac, sun_b), scale3(-2.0 * pac * c, n));
                let dd = scale3(-pac * 2.0 / 3.0, n);
                d_spec.push(scale3(g, mat_vec(&attitude_body_to_eci, dr)));
                d_diff.push(scale3(g, mat_vec(&attitude_body_to_eci, dd)));
            }
            None => {
                d_spec.push([0.0; 3]);
                d_diff.push([0.0; 3]);
            }
        }
    }
    BoxWingPartials {
        d_scale: boxwing_accel_scaled(r, s, attitude_body_to_eci, bw, 1.0, nu),
        d_specular: d_spec,
        d_diffuse: d_diff,
    }
}

// ---------------------------------------------------------------------------------------
// ECOM2
// ---------------------------------------------------------------------------------------

/// ECOM2 parameters (m/s²), Arnold et al. (2015) D2/B1 parameterisation. The partials of
/// [`ecom2_partials`] use this field order: `d0, y0, b0, d2c, d2s, d4c, d4s, b1c, b1s`.
#[derive(Clone, Copy, Debug, Default, PartialEq)]
pub struct Ecom2 {
    /// Constant along `e_D`.
    pub d0: f64,
    /// Constant along `e_Y`.
    pub y0: f64,
    /// Constant along `e_B`.
    pub b0: f64,
    /// `cos 2Δu` along `e_D`.
    pub d2c: f64,
    /// `sin 2Δu` along `e_D`.
    pub d2s: f64,
    /// `cos 4Δu` along `e_D`.
    pub d4c: f64,
    /// `sin 4Δu` along `e_D`.
    pub d4s: f64,
    /// `cos Δu` along `e_B`.
    pub b1c: f64,
    /// `sin Δu` along `e_B`.
    pub b1s: f64,
}

impl Ecom2 {
    /// Parameter names in partials order.
    pub const NAMES: [&'static str; 9] =
        ["D0", "Y0", "B0", "D2c", "D2s", "D4c", "D4s", "B1c", "B1s"];
    /// As an array in partials order.
    pub fn to_array(&self) -> [f64; 9] {
        [
            self.d0, self.y0, self.b0, self.d2c, self.d2s, self.d4c, self.d4s, self.b1c, self.b1s,
        ]
    }
    /// From an array in partials order.
    pub fn from_array(a: [f64; 9]) -> Self {
        Ecom2 {
            d0: a[0],
            y0: a[1],
            b0: a[2],
            d2c: a[3],
            d2s: a[4],
            d4c: a[5],
            d4s: a[6],
            b1c: a[7],
            b1s: a[8],
        }
    }
}

/// The DYB frame and the Sun-relative argument of latitude.
#[derive(Clone, Copy, Debug, PartialEq)]
pub struct DybFrame {
    /// Unit satellite→Sun.
    pub e_d: Vec3,
    /// `unit(e_D × r)` (the solar-array axis in nominal yaw steering).
    pub e_y: Vec3,
    /// `e_D × e_Y`.
    pub e_b: Vec3,
    /// `Δu = u − u_s` (rad), in `(−π, π]`.
    pub delta_u: f64,
}

/// DYB frame and `Δu` (module doc). Degenerate cases: Sun colinear with `r` →
/// `e_Y = unit(v × r)`, the same fallback as [`gnss_yaw_steering`]'s body `+Y`
/// (`unit(Z × v)` with `Z = −r̂`), so `e_Y` stays the solar-array axis there too; Sun along the
/// orbit normal (no projection of the Sun into the orbital plane) → `Δu = 0`.
pub fn dyb_frame(r: Vec3, v: Vec3, s: Vec3) -> DybFrame {
    let e_d = unit(sub3(s, r));
    let mut ey = cross(e_d, r);
    if norm(ey) < 1e-12 * norm(r) {
        ey = cross(v, r);
    }
    let e_y = unit(ey);
    let e_b = cross(e_d, e_y);
    let h = cross(r, v);
    let yo = cross(h, s);
    let delta_u = if norm(yo) < 1e-12 * norm(h) * norm(s) {
        0.0
    } else {
        let yo = unit(yo);
        let xo = unit(cross(yo, h));
        dot(r, yo).atan2(dot(r, xo))
    };
    DybFrame {
        e_d,
        e_y,
        e_b,
        delta_u,
    }
}

/// ECOM2 partials `∂a/∂p_k` (exact: the model is linear), order of [`Ecom2::NAMES`].
pub fn ecom2_partials(r: Vec3, v: Vec3, s: Vec3, nu: f64) -> [[f64; 3]; 9] {
    let f = dyb_frame(r, v, s);
    let u = f.delta_u;
    let (s1, c1) = u.sin_cos();
    let (s2, c2) = (2.0 * u).sin_cos();
    let (s4, c4) = (4.0 * u).sin_cos();
    let d = scale3(nu, f.e_d);
    let y = scale3(nu, f.e_y);
    let b = scale3(nu, f.e_b);
    [
        d,
        y,
        b,
        scale3(c2, d),
        scale3(s2, d),
        scale3(c4, d),
        scale3(s4, d),
        scale3(c1, b),
        scale3(s1, b),
    ]
}

/// ECOM2 acceleration (m/s²): `Σ_k p_k ∂a/∂p_k`.
pub fn ecom2_accel(r: Vec3, v: Vec3, s: Vec3, p: &Ecom2, nu: f64) -> Vec3 {
    let parts = ecom2_partials(r, v, s, nu);
    let q = p.to_array();
    let mut a = [0.0; 3];
    for k in 0..9 {
        a = add3(a, scale3(q[k], parts[k]));
    }
    a
}

/// A priori box-wing (scale `k`) plus an ECOM2 residual, both with the same eclipse factor:
/// `a = boxwing_accel_scaled(…, k, ν) + ecom2_accel(…, ν)` — the composition of
/// Montenbruck et al. (2015) (a priori box model plus empirical ECOM-type terms).
#[allow(clippy::too_many_arguments)]
pub fn boxwing_plus_ecom2_accel(
    r: Vec3,
    v: Vec3,
    s: Vec3,
    attitude_body_to_eci: Mat3,
    bw: &BoxWing,
    scale: f64,
    ecom: &Ecom2,
    nu: f64,
) -> Vec3 {
    add3(
        boxwing_accel_scaled(r, s, attitude_body_to_eci, bw, scale, nu),
        ecom2_accel(r, v, s, ecom, nu),
    )
}

/// One sample for [`ecom2_fit`]: state, Sun, eclipse factor, and the acceleration to fit.
#[derive(Clone, Copy, Debug, PartialEq)]
pub struct Ecom2Sample {
    /// Satellite position (m).
    pub r: Vec3,
    /// Satellite velocity (m/s).
    pub v: Vec3,
    /// Sun position (m).
    pub s: Vec3,
    /// Eclipse factor.
    pub nu: f64,
    /// Acceleration to be explained (m/s²).
    pub accel: Vec3,
}

/// Linear least-squares fit of ECOM2 parameters to sampled accelerations, using
/// [`ecom2_partials`] as the design matrix. Returns the parameters and the post-fit RMS
/// (m/s², per component). Errors when the normal matrix is singular (e.g. too few samples
/// or all in eclipse).
pub fn ecom2_fit(samples: &[Ecom2Sample]) -> Result<(Ecom2, f64), String> {
    let mut n = [[0.0f64; 9]; 9];
    let mut b = [0.0f64; 9];
    for smp in samples {
        let h = ecom2_partials(smp.r, smp.v, smp.s, smp.nu);
        for i in 0..9 {
            b[i] += dot(h[i], smp.accel);
            for j in 0..9 {
                n[i][j] += dot(h[i], h[j]);
            }
        }
    }
    let x = solve_spd9(n, b)?;
    let p = Ecom2::from_array(x);
    let mut ss = 0.0;
    let mut cnt = 0usize;
    for smp in samples {
        let res = sub3(smp.accel, ecom2_accel(smp.r, smp.v, smp.s, &p, smp.nu));
        ss += dot(res, res);
        cnt += 3;
    }
    let rms = if cnt > 0 {
        (ss / cnt as f64).sqrt()
    } else {
        0.0
    };
    Ok((p, rms))
}

/// Cholesky solve of a 9×9 symmetric positive-definite system.
#[allow(clippy::needless_range_loop)] // the textbook index form of the factorisation
fn solve_spd9(a: [[f64; 9]; 9], b: [f64; 9]) -> Result<[f64; 9], String> {
    let mut l = [[0.0f64; 9]; 9];
    let tr: f64 = (0..9).map(|i| a[i][i]).sum();
    for i in 0..9 {
        for j in 0..=i {
            let mut sum = a[i][j];
            for k in 0..j {
                sum -= l[i][k] * l[j][k];
            }
            if i == j {
                if sum <= 1e-14 * tr {
                    return Err("ECOM2 normal matrix is singular or ill-conditioned".to_string());
                }
                l[i][i] = sum.sqrt();
            } else {
                l[i][j] = sum / l[j][j];
            }
        }
    }
    let mut y = [0.0f64; 9];
    for i in 0..9 {
        let mut sum = b[i];
        for k in 0..i {
            sum -= l[i][k] * y[k];
        }
        y[i] = sum / l[i][i];
    }
    let mut x = [0.0f64; 9];
    for i in (0..9).rev() {
        let mut sum = y[i];
        for k in i + 1..9 {
            sum -= l[k][i] * x[k];
        }
        x[i] = sum / l[i][i];
    }
    Ok(x)
}

#[cfg(test)]
mod tests {
    use super::*;
    use crate::forces::srp_accel;

    fn approx_rel(a: Vec3, b: Vec3, tol: f64) -> bool {
        norm(sub3(a, b)) <= tol * norm(b).max(1e-300)
    }

    fn sample_state() -> (Vec3, Vec3, Vec3) {
        // Galileo-like MEO (a ≈ 29 600 km, i = 56°), Sun at ~1 AU off-plane.
        let r = [2.0e7, 1.5e7, 1.4e7];
        let v = [-1.9e3, 0.6e3, 2.1e3];
        let s = [1.2e11, -8.0e10, -3.5e10];
        (r, v, s)
    }

    #[test]
    fn single_sun_pointing_absorber_is_cannonball_cr1() {
        let (r, v, s) = sample_state();
        let area = 7.3;
        let bw = BoxWing {
            panels: vec![Panel::sun_pointing(area, [0.0, 1.0, 0.0], 1.0, 0.0, 0.0)],
            mass_kg: 700.0,
        };
        let att = gnss_yaw_steering(r, v, s);
        let a = boxwing_accel(r, s, att, &bw, 1.0);
        // srp_accel applies its own conical shadow; this state is lit (ν = 1).
        assert_eq!(crate::forces::conical_shadow(r, s), 1.0);
        let c = srp_accel(r, s, 1.0, area / 700.0);
        assert!(approx_rel(a, c, 1e-14), "{a:?} vs {c:?}");
    }

    #[test]
    fn absorbing_cube_projected_area() {
        let (r, _v, s) = sample_state();
        let a_face = 2.0;
        let faces = [PX, MX, PY, MY, PZ, MZ];
        let bw = BoxWing {
            panels: faces
                .iter()
                .map(|&n| Panel::fixed(a_face, n, 1.0, 0.0, 0.0))
                .collect(),
            mass_kg: 500.0,
        };
        let att = [[1.0, 0.0, 0.0], [0.0, 1.0, 0.0], [0.0, 0.0, 1.0]];
        let a = boxwing_accel(r, s, att, &bw, 1.0);
        let (p, sh) = pressure_and_sun_dir(r, s);
        let proj = a_face * (sh[0].abs() + sh[1].abs() + sh[2].abs());
        let want = scale3(-p * proj / 500.0, sh);
        assert!(approx_rel(a, want, 1e-14));
    }

    #[test]
    fn facing_plate_specular_and_diffuse_limits() {
        let (r, _v, s) = sample_state();
        let (p, sh) = pressure_and_sun_dir(r, s);
        let att = [[1.0, 0.0, 0.0], [0.0, 1.0, 0.0], [0.0, 0.0, 1.0]];
        let spec = BoxWing {
            panels: vec![Panel::fixed(1.0, sh, 0.0, 1.0, 0.0)],
            mass_kg: 1.0,
        };
        let diff = BoxWing {
            panels: vec![Panel::fixed(1.0, sh, 0.0, 0.0, 1.0)],
            mass_kg: 1.0,
        };
        assert!(approx_rel(
            boxwing_accel(r, s, att, &spec, 1.0),
            scale3(-2.0 * p, sh),
            1e-14
        ));
        assert!(approx_rel(
            boxwing_accel(r, s, att, &diff, 1.0),
            scale3(-p * 5.0 / 3.0, sh),
            1e-14
        ));
        // Back-lit fixed plate: no force.
        let back = BoxWing {
            panels: vec![Panel::fixed(1.0, scale3(-1.0, sh), 0.0, 1.0, 0.0)],
            mass_kg: 1.0,
        };
        assert_eq!(boxwing_accel(r, s, att, &back, 1.0), [0.0; 3]);
    }

    #[test]
    fn force_points_away_from_sun_and_scales_with_nu() {
        let (r, v, s) = sample_state();
        let bw = BoxWing::galileo_foc();
        bw.check().unwrap();
        BoxWing::galileo_iov().check().unwrap();
        BoxWing::galileo_iov_eol().check().unwrap();
        let att = gnss_yaw_steering(r, v, s);
        let a = boxwing_accel(r, s, att, &bw, 1.0);
        let (_, sh) = pressure_and_sun_dir(r, s);
        assert!(dot(a, sh) < 0.0);
        let mag = norm(a);
        // Galileo FOC ~ 1e-7 m/s² order.
        assert!(mag > 5e-8 && mag < 2e-7, "{mag}");
        let half = boxwing_accel(r, s, att, &bw, 0.37);
        assert!(approx_rel(half, scale3(0.37, a), 1e-15));
        assert_eq!(boxwing_accel(r, s, att, &bw, 0.0), [0.0; 3]);
    }

    #[test]
    fn yaw_steering_is_orthonormal_and_conventional() {
        let (r, v, s) = sample_state();
        let m = gnss_yaw_steering(r, v, s);
        let x = [m[0][0], m[1][0], m[2][0]];
        let y = [m[0][1], m[1][1], m[2][1]];
        let z = [m[0][2], m[1][2], m[2][2]];
        for (a, b) in [(x, y), (y, z), (z, x)] {
            assert!(dot(a, b).abs() < 1e-15);
        }
        for a in [x, y, z] {
            assert!((norm(a) - 1.0).abs() < 1e-15);
        }
        assert!(norm(sub3(cross(x, y), z)) < 1e-15);
        assert!(approx_rel(z, scale3(-1.0, unit(r)), 1e-15));
        let sh = unit(sub3(s, r));
        assert!(dot(y, sh).abs() < 1e-15);
        assert!(dot(x, sh) > 0.0);
        // e_Y of DYB equals body +Y in nominal yaw steering.
        let f = dyb_frame(r, v, s);
        assert!(approx_rel(f.e_y, y, 1e-14));
    }

    #[test]
    fn dyb_orthonormal_right_handed() {
        let (r, v, s) = sample_state();
        let f = dyb_frame(r, v, s);
        assert!((norm(f.e_d) - 1.0).abs() < 1e-15);
        assert!((norm(f.e_y) - 1.0).abs() < 1e-15);
        assert!((norm(f.e_b) - 1.0).abs() < 1e-15);
        assert!(dot(f.e_d, f.e_y).abs() < 1e-15);
        assert!(dot(f.e_d, f.e_b).abs() < 1e-15);
        assert!(dot(f.e_y, f.e_b).abs() < 1e-15);
        assert!(norm(sub3(cross(f.e_y, f.e_b), f.e_d)) < 1e-15);
    }

    #[test]
    fn delta_u_is_zero_at_orbit_noon_and_grows_with_motion() {
        // Equatorial circular orbit, Sun on +x: Δu = angle from +x in direction of motion.
        let s = [AU_M, 0.0, 0.0];
        for deg in [0.0f64, 30.0, 90.0, 170.0, -45.0] {
            let t = deg.to_radians();
            let r = [2.9e7 * t.cos(), 2.9e7 * t.sin(), 0.0];
            let v = [-3.7e3 * t.sin(), 3.7e3 * t.cos(), 0.0];
            let f = dyb_frame(r, v, s);
            assert!((f.delta_u - t).abs() < 1e-12, "{deg}: {}", f.delta_u);
        }
    }

    #[test]
    fn ecom2_d0_only_is_along_sun_line() {
        let (r, v, s) = sample_state();
        let p = Ecom2 {
            d0: -1.0e-7,
            ..Default::default()
        };
        let a = ecom2_accel(r, v, s, &p, 1.0);
        let sh = unit(sub3(s, r));
        assert!(approx_rel(a, scale3(-1.0e-7, sh), 1e-15));
        // Cannonball direction (away from the Sun).
        let c = srp_accel(r, s, 1.0, 0.01);
        assert!(dot(unit(a), unit(c)) > 1.0 - 1e-15);
    }

    #[test]
    fn ecom2_linearity_and_finite_difference_partials() {
        let (r, v, s) = sample_state();
        let p = Ecom2::from_array([
            -1.0e-7, 1e-10, 3e-10, 2e-9, -1e-9, 5e-10, 4e-10, -2e-9, 1e-9,
        ]);
        let nu = 0.8;
        let parts = ecom2_partials(r, v, s, nu);
        let a0 = ecom2_accel(r, v, s, &p, nu);
        // Linearity: a(p + q) = a(p) + a(q); a(c p) = c a(p).
        let q = Ecom2::from_array([1e-9; 9]);
        let mut pq = p.to_array();
        for (x, y) in pq.iter_mut().zip(q.to_array()) {
            *x += y;
        }
        let lhs = ecom2_accel(r, v, s, &Ecom2::from_array(pq), nu);
        let rhs = add3(a0, ecom2_accel(r, v, s, &q, nu));
        assert!(norm(sub3(lhs, rhs)) < 1e-22);
        for k in 0..9 {
            let h = 1e-9;
            let mut pp = p.to_array();
            pp[k] += h;
            let mut pm = p.to_array();
            pm[k] -= h;
            let fd = scale3(
                0.5 / h,
                sub3(
                    ecom2_accel(r, v, s, &Ecom2::from_array(pp), nu),
                    ecom2_accel(r, v, s, &Ecom2::from_array(pm), nu),
                ),
            );
            assert!(
                norm(sub3(fd, parts[k])) < 1e-6,
                "{k}: {fd:?} vs {:?}",
                parts[k]
            );
        }
    }

    #[test]
    fn boxwing_partials_match_finite_differences() {
        let (r, v, s) = sample_state();
        let bw = BoxWing::galileo_foc();
        let att = gnss_yaw_steering(r, v, s);
        let k = 1.07;
        let nu = 0.9;
        let pd = boxwing_partials(r, s, att, &bw, k, nu);
        let a1 = boxwing_accel_scaled(r, s, att, &bw, 1.0, nu);
        assert_eq!(pd.d_scale, a1);
        let ak = boxwing_accel_scaled(r, s, att, &bw, k, nu);
        assert!(approx_rel(ak, scale3(k, a1), 1e-15));
        let h = 1e-6;
        let mut lit = 0;
        for i in 0..bw.panels.len() {
            for which in 0..2 {
                let mut up = bw.clone();
                let mut dn = bw.clone();
                if which == 0 {
                    up.panels[i].specular += h;
                    up.panels[i].absorption -= h;
                    dn.panels[i].specular -= h;
                    dn.panels[i].absorption += h;
                } else {
                    up.panels[i].diffuse += h;
                    up.panels[i].absorption -= h;
                    dn.panels[i].diffuse -= h;
                    dn.panels[i].absorption += h;
                }
                let fd = scale3(
                    0.5 / h,
                    sub3(
                        boxwing_accel_scaled(r, s, att, &up, k, nu),
                        boxwing_accel_scaled(r, s, att, &dn, k, nu),
                    ),
                );
                let an = if which == 0 {
                    pd.d_specular[i]
                } else {
                    pd.d_diffuse[i]
                };
                let scale = norm(an).max(1e-12);
                assert!(
                    norm(sub3(fd, an)) <= 1e-8 * scale.max(norm(a1)),
                    "panel {i} kind {which}"
                );
                if norm(an) > 0.0 {
                    lit += 1;
                }
            }
        }
        assert!(lit >= 4, "some panels must be lit");
    }

    #[test]
    fn ecom2_fit_recovers_known_parameters() {
        let s = [AU_M * 0.8, AU_M * 0.5, AU_M * 0.2];
        let truth = Ecom2::from_array([
            -1.0e-7, 1e-10, 3e-10, 2e-9, -1e-9, 5e-10, 4e-10, -2e-9, 1e-9,
        ]);
        let mut samples = Vec::new();
        let (a, inc) = (2.96e7f64, 56f64.to_radians());
        let n = (crate::forces::MU_EARTH / a.powi(3)).sqrt();
        for k in 0..200 {
            let th = n * (k as f64) * 300.0;
            let r = [
                a * th.cos(),
                a * th.sin() * inc.cos(),
                a * th.sin() * inc.sin(),
            ];
            let v = [
                -a * n * th.sin(),
                a * n * th.cos() * inc.cos(),
                a * n * th.cos() * inc.sin(),
            ];
            samples.push(Ecom2Sample {
                r,
                v,
                s,
                nu: 1.0,
                accel: ecom2_accel(r, v, s, &truth, 1.0),
            });
        }
        let (p, rms) = ecom2_fit(&samples).unwrap();
        for (x, y) in p.to_array().iter().zip(truth.to_array()) {
            assert!((x - y).abs() < 1e-18, "{x} vs {y}");
        }
        assert!(rms < 1e-20);
    }

    // With the Sun colinear with r both frames fall back, and to the same axis: the DYB
    // e_Y stays the yaw-steered body +Y (the solar-array axis).
    #[test]
    fn colinear_fallbacks_agree_on_the_array_axis() {
        let r = [7.0e6, 0.0, 0.0];
        let v = [0.0, 7.5e3, 1.0e3];
        let s = [1.5e11, 0.0, 0.0];
        let att = gnss_yaw_steering(r, v, s);
        let y_body = [att[0][1], att[1][1], att[2][1]];
        let f = dyb_frame(r, v, s);
        for k in 0..3 {
            assert!(
                (f.e_y[k] - y_body[k]).abs() < 1e-12,
                "{:?} vs {:?}",
                f.e_y,
                y_body
            );
        }
    }
}
