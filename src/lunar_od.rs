// SPDX-License-Identifier: AGPL-3.0-only
//! Moon-centred force model for lunar precise orbit determination — the selenocentric analogue
//! of [`crate::precise_od::PreciseForceModel`].
//!
//! [`LunarForceModel`] implements the same [`crate::precise_od::ForceModel`] interface, so the one
//! precise Gauss–Newton batch estimator ([`crate::precise_od::fit`]) and its variational
//! STM propagators fit an orbit about the **Moon** exactly as they do about the Earth. The
//! acceleration (m/s², Moon-centred ICRF/J2000 — the frame JPL Horizons reports the LRO truth in)
//! is the sum of:
//!
//! 1. **Lunar gravity** — a fully-normalized spherical-harmonic field ([`crate::gravity_sh`],
//!    the GRAIL GRGM660PRIM coefficients) evaluated in the Moon body-fixed **principal-axis**
//!    frame (the GRGM field's frame) given by the [`LunarEnvironment`]: the analytic
//!    [`crate::lunar_frame::icrf_to_moon_pa`] by default, the DE440 PA series opt-in.
//! 2. **Earth third body** — the dominant lunar-orbit perturbation (~3·10⁻⁵ m/s² at ~98 km),
//!    Earth relative to the Moon = −(geocentric Moon position) from [`crate::ephem`].
//! 3. **Sun third body** — small (~10⁻⁷ m/s²), Sun relative to the Moon.
//! 4. **SRP** (optional) — cannonball with `C_R`/`A·m⁻¹`; off by default for LRO (the panel area
//!    is unknown and the ~10⁻⁷ m/s² signal is below the empirical-tier floor for a short arc).
//! 5. **Lunar solid tide** (optional, [`LunarForceModel::lunar_tide`]) — the degree-2 elastic
//!    tide the Earth and the Sun raise on the Moon, with a caller-supplied Love number `k2`
//!    referenced to the field's radius (point-mass perturbers, no frequency dependence, no
//!    phase lag); about 7·10⁻⁷ m/s² at ~100 km altitude below the Earth.
//! 6. **Relativity** (optional, [`LunarForceModel::relativity`]) — the selenocentric
//!    Schwarzschild term of the IERS Conventions (2010) eq. 10.12 with β = γ = 1, about
//!    10⁻¹⁰ m/s² at LRO; Lense–Thirring and de Sitter terms are not modelled.
//! 7. **Macro-model** (optional, [`LunarForceModel::macro_model`], DS-LRO-10) — flat-plate
//!    direct solar radiation with the Moon's shadow plus lunar albedo and thermal IR
//!    ([`LunarMacroModel`]); replaces the cannonball term. Pre-registered against the LRO arc it
//!    did NOT meet its bars (`docs/design/evidence/ds-lro-10-macro-model/RESULTS.md`): it leaves
//!    the reduced-dynamic floor unchanged, so it is opt-in with nothing claimed for it.
//! 8. **Empirical accelerations** (optional) — the same RTN constant + once-per-rev tier the
//!    Earth model uses; frame-agnostic, so it absorbs un-modelled lunar dynamics (the truncated
//!    high-degree field, the ME↔PA offset, the analytic-ephemeris frame slop) in the
//!    reduced-dynamic fit.
//!
//! ## Scope (honest)
//!
//! The Sun/Moon directions come from the built-in mean-equator-of-date analytic ephemeris
//! ([`crate::ephem`], ~0.3° from ICRF at 2022 from un-modelled precession); the Earth third-body
//! direction therefore carries a near-static sub-arcminute bias, absorbed by the empirical
//! constant terms. The SRP terms use the Moon's conical shadow (Earth eclipses are not
//! modelled). These are the documented residuals the reduced-dynamic tier carries; the headline
//! lunar residuals are reported in `tests/agency_lro.rs`.

use crate::ephem::{moon_position, sun_position};
use crate::forces::{
    conical_shadow_body, srp_accel_with_lit_fraction, third_body_accel, MU_EARTH, MU_SUN,
};
use crate::gravity_sh::SphericalHarmonicField;
use crate::lunar_frame::icrf_to_moon_pa;
use crate::precession::{julian_centuries_tt, mat_vec, mod_to_gcrs, transpose};
use crate::precise_od::{empirical_accel, EmpiricalAccel, ForceModel};
use crate::timescales::SECONDS_PER_DAY;

type Vec3 = [f64; 3];
type Mat3 = [[f64; 3]; 3];

/// A pluggable source of the Moon-centred force model's *frame inputs* — the lunar body-fixed
/// orientation and the Earth/Sun directions — abstracted so the fidelity of those two inputs can
/// be swapped without touching the gravity field, the estimator, or the empirical tier.
///
/// The built-in [`AnalyticLunarEnvironment`] uses Kshana's analytic IAU 2015 libration
/// ([`crate::lunar_frame::icrf_to_moon_pa`]) and the Montenbruck–Gill ephemeris ([`crate::ephem`]),
/// which sit about 6″ to 8″ / ~0.3° from the JPL Development Ephemeris values. An
/// *out-of-crate* provider can instead read DE-grade orientation and ephemeris from NAIF kernels
/// (the `xval/anise-lunar-od` cross-validation crate), swapping **only** these inputs through this
/// seam while every other dynamical term and the precise estimator stay identical. That
/// cross-validation found the DE-grade inputs improve the *dynamic* LRO fit but leave the
/// *reduced-dynamic* one unchanged (the empirical tier already absorbs the orientation/ephemeris
/// error), so the analytic stack here already matches DE-grade for the operational lunar orbit. All
/// quantities are Moon-centred ICRF/J2000 — the frame the LRO truth is reported in.
pub trait LunarEnvironment: Clone + std::fmt::Debug {
    /// The ICRF → Moon body-fixed **principal-axis** rotation matrix at `jd_tdb` (Julian Date, TDB).
    fn icrf_to_moon_pa(&self, jd_tdb: f64) -> Mat3;
    /// The geocentric Sun and Moon positions `(sun, moon)` (m, GCRS/ICRF) at `jd_tdb`.
    fn geocentric_sun_moon(&self, jd_tdb: f64) -> (Vec3, Vec3);
}

/// The default, kernel-free frame-input provider: Kshana's own analytic lunar orientation and
/// analytic Sun/Moon ephemeris. This is the lean, fully-reproducible path, and it is the default
/// type parameter of [`LunarForceModel`], so the published crate takes on no kernel dependency.
#[derive(Clone, Copy, Debug, Default)]
pub struct AnalyticLunarEnvironment;

impl LunarEnvironment for AnalyticLunarEnvironment {
    fn icrf_to_moon_pa(&self, jd_tdb: f64) -> Mat3 {
        icrf_to_moon_pa(jd_tdb)
    }

    /// The geocentric Sun and Moon positions (m, **GCRS/ICRF**) at `jd`. The built-in analytic
    /// series are mean-equator-of-date; they are rotated into GCRS with [`mod_to_gcrs`] so the
    /// dominant Earth third-body direction is consistent with the inertial (ICRF) frame the orbit
    /// is integrated and observed in — un-modelled precession would otherwise tilt the largest
    /// lunar-orbit perturbation by ~0.3° at 2022, injecting an out-of-plane bias.
    fn geocentric_sun_moon(&self, jd: f64) -> (Vec3, Vec3) {
        let tjc = julian_centuries_tt(jd);
        (
            mod_to_gcrs(sun_position(tjc), jd),
            mod_to_gcrs(moon_position(tjc), jd),
        )
    }
}

/// The opt-in DE-grade frame-input provider, in the crate: the lunar orientation is the DE440
/// principal-axis frame ([`crate::lunar_frame::try_icrf_to_moon_pa_de440`], the embedded daily
/// DE440 series, 2014 to 2030) and, when a kernel is given, the geocentric Sun and Moon are read
/// from a JPL DE440 SPK through the crate's own reader ([`KernelEphemeris`]). Without a kernel the
/// Sun and Moon stay the analytic series of [`AnalyticLunarEnvironment`]. The in-crate counterpart
/// of the ANISE provider of `xval/anise-lunar-od`: against it (2026-10-13, 241 LRO epochs) the
/// orientation agrees within 3.5e-7 rad and the LRO fits within 1 mm, but the geocentric Sun and
/// Moon differ by up to 30.7 m and 1.1 m (a common ~1 ms time offset on the ANISE side; the crate's
/// reader agrees with SPICE to 2 mm), so this provider is not a validated row
/// (`docs/design/evidence/fut05-de440-lunar-env/RESULTS.md`).
///
/// The [`LunarEnvironment`] methods cannot return an error, so they panic outside the orientation
/// span or the kernel's coverage: call [`De440LunarEnvironment::check_covers`] on the arc first.
///
/// [`KernelEphemeris`]: crate::ephem_provider::KernelEphemeris
#[derive(Clone, Debug)]
pub struct De440LunarEnvironment {
    kernel: Option<std::sync::Arc<crate::ephem_provider::KernelEphemeris>>,
}

impl De440LunarEnvironment {
    /// DE440 orientation and the Sun and Moon from `kernel` (a DE440 SPK holding the Sun, the
    /// Earth-Moon barycentre, the Earth and the Moon over the arc).
    pub fn new(kernel: crate::ephem_provider::KernelEphemeris) -> Self {
        Self {
            kernel: Some(std::sync::Arc::new(kernel)),
        }
    }

    /// DE440 orientation only; the Sun and Moon stay analytic.
    pub fn orientation_only() -> Self {
        Self { kernel: None }
    }

    /// The SPK's SHA-256, when a kernel is used.
    pub fn kernel_sha256(&self) -> Option<&str> {
        self.kernel.as_deref().map(|k| k.kernel_sha256())
    }

    /// The fallible orientation: ICRF → DE440 principal axes at `jd_tdb`.
    ///
    /// # Errors
    /// Outside the embedded orientation span.
    pub fn try_icrf_to_moon_pa(&self, jd_tdb: f64) -> Result<Mat3, String> {
        crate::lunar_frame::try_icrf_to_moon_pa_de440(jd_tdb).map_err(|e| e.to_string())
    }

    /// The fallible geocentric `(sun, moon)` (m, ICRF/J2000) at `jd_tdb`.
    ///
    /// # Errors
    /// When the kernel does not cover the epoch or lacks a body.
    pub fn try_geocentric_sun_moon(&self, jd_tdb: f64) -> Result<(Vec3, Vec3), String> {
        match &self.kernel {
            Some(k) => {
                let t = crate::jd2::Jd2::new(jd_tdb);
                Ok((k.sun_geocentric(t)?, k.moon_geocentric(t)?))
            }
            None => Ok(AnalyticLunarEnvironment.geocentric_sun_moon(jd_tdb)),
        }
    }

    /// Check that both inputs are available at the start and the end of an arc.
    ///
    /// # Errors
    /// The first input that is not, with the epoch.
    pub fn check_covers(&self, jd_tdb_start: f64, jd_tdb_end: f64) -> Result<(), String> {
        for jd in [jd_tdb_start, jd_tdb_end] {
            self.try_icrf_to_moon_pa(jd)?;
            self.try_geocentric_sun_moon(jd)?;
        }
        Ok(())
    }
}

impl LunarEnvironment for De440LunarEnvironment {
    fn icrf_to_moon_pa(&self, jd_tdb: f64) -> Mat3 {
        self.try_icrf_to_moon_pa(jd_tdb)
            .unwrap_or_else(|e| panic!("De440LunarEnvironment orientation: {e}"))
    }

    fn geocentric_sun_moon(&self, jd_tdb: f64) -> (Vec3, Vec3) {
        self.try_geocentric_sun_moon(jd_tdb)
            .unwrap_or_else(|e| panic!("De440LunarEnvironment ephemeris: {e}"))
    }
}

/// A Moon-centred force model: a lunar spherical-harmonic gravity field evaluated in the body-fixed
/// frame, plus the configured third bodies, optional SRP, and the optional empirical tier. Generic
/// over the [`LunarEnvironment`] frame-input provider, defaulting to the analytic one.
#[derive(Clone, Debug)]
pub struct LunarForceModel<E: LunarEnvironment = AnalyticLunarEnvironment> {
    /// The lunar gravity field (GRGM*, fully-normalized), defined in the Moon body-fixed frame.
    pub field: SphericalHarmonicField,
    /// Estimation/propagation epoch (Julian Date, TDB ≈ TT) at integration time `t = 0`.
    pub epoch_jd_tdb: f64,
    /// Include the Earth third body (the dominant lunar-orbit perturbation).
    pub earth: bool,
    /// Include the Sun third body.
    pub sun: bool,
    /// Include solar-radiation pressure (off by default for LRO; see the module scope note).
    pub srp: bool,
    /// SRP radiation-pressure coefficient `C_R` (used only when `srp`; the estimator's `C_R`).
    pub cr: f64,
    /// SRP cross-section-to-mass ratio `A/m` (m²/kg).
    pub area_over_mass: f64,
    /// Optional empirical-acceleration tier (RTN constant + once-per-rev).
    pub empirical: Option<EmpiricalAccel>,
    /// Lunar Love number `k2` of the optional solid tide raised by the Earth and the Sun
    /// (referenced to `field.re`); `None` (the default) leaves the tide out.
    pub tide_k2: Option<f64>,
    /// Include the selenocentric Schwarzschild relativistic term (off by default).
    pub relativity: bool,
    /// Optional spacecraft macro-model for the non-gravitational forces (DS-LRO-10): direct
    /// solar radiation on flat plates (and lunar albedo / thermal IR when the model enables it).
    /// While set it replaces the cannonball `srp` term and `cr` is its radiation factor. `None`
    /// (the default) leaves every output unchanged.
    pub macro_model: Option<LunarMacroModel>,
    /// The frame-input provider (lunar orientation + Sun/Moon ephemeris). Defaults to the
    /// kernel-free analytic [`AnalyticLunarEnvironment`]; an out-of-crate DE-grade provider
    /// plugs in here via [`LunarForceModel::with_env`].
    pub env: E,
}

impl LunarForceModel<AnalyticLunarEnvironment> {
    /// A Moon-centred model over the given lunar gravity `field` at `epoch_jd_tdb`, with the
    /// Earth and Sun third bodies enabled and no SRP or empirical tier — the dynamic baseline,
    /// using the built-in analytic frame inputs.
    pub fn new(field: SphericalHarmonicField, epoch_jd_tdb: f64) -> Self {
        Self::with_env(field, epoch_jd_tdb, AnalyticLunarEnvironment)
    }
}

impl<E: LunarEnvironment> LunarForceModel<E> {
    /// A Moon-centred model with an explicit frame-input provider `env` (e.g. a DE-grade ANISE
    /// environment), Earth and Sun third bodies enabled and no SRP or empirical tier.
    pub fn with_env(field: SphericalHarmonicField, epoch_jd_tdb: f64, env: E) -> Self {
        Self {
            field,
            epoch_jd_tdb,
            earth: true,
            sun: true,
            srp: false,
            cr: 1.0,
            area_over_mass: 0.0,
            empirical: None,
            tide_k2: None,
            relativity: false,
            macro_model: None,
            env,
        }
    }

    /// Enable solar-radiation pressure with coefficient `cr` and area-to-mass `area_over_mass`.
    pub fn solar_radiation(mut self, cr: f64, area_over_mass: f64) -> Self {
        self.srp = true;
        self.cr = cr;
        self.area_over_mass = area_over_mass;
        self
    }

    /// Enable the degree-2 solid tide the Earth and the Sun raise on the Moon, with Love number
    /// `k2` referenced to the field's reference radius (for example 0.02405, the GRAIL value of
    /// Konopliv et al. 2013, JGR Planets 118, referenced to 1738 km). Off by default.
    pub fn lunar_tide(mut self, k2: f64) -> Self {
        self.tide_k2 = Some(k2);
        self
    }

    /// Enable the selenocentric Schwarzschild term. Off by default.
    pub fn relativity(mut self) -> Self {
        self.relativity = true;
        self
    }

    /// Enable the flat-plate macro-model `mm` (DS-LRO-10) with radiation factor `cr` (1
    /// nominal; estimable through the estimator's `C_R`). Replaces the cannonball SRP term.
    pub fn macro_model(mut self, mm: LunarMacroModel, cr: f64) -> Self {
        self.macro_model = Some(mm);
        self.srp = false;
        self.cr = cr;
        self
    }
}

/// The acceleration (m/s²) of a satellite at `r` (central-body centred) from the degree-2 elastic
/// tide a point mass `mu_j` at `rj` raises on a central body of reference radius `re` and Love
/// number `k2`: from `ΔU = k2 μ_j R⁵ (3 cos²ψ − 1) / (2 r_j³ r³)`,
/// `a = k2 μ_j R⁵ / (2 r_j³ r⁴) · [(3 − 15 cos²ψ) r̂ + 6 cos ψ r̂_j]`.
pub fn degree2_tide_accel(r: Vec3, rj: Vec3, mu_j: f64, k2: f64, re: f64) -> Vec3 {
    let n = |x: Vec3| (x[0] * x[0] + x[1] * x[1] + x[2] * x[2]).sqrt();
    let (rn, rjn) = (n(r), n(rj));
    let u = [r[0] / rn, r[1] / rn, r[2] / rn];
    let uj = [rj[0] / rjn, rj[1] / rjn, rj[2] / rjn];
    let c = u[0] * uj[0] + u[1] * uj[1] + u[2] * uj[2];
    let k = k2 * mu_j * re.powi(5) / (2.0 * rjn.powi(3) * rn.powi(4));
    std::array::from_fn(|i| k * ((3.0 - 15.0 * c * c) * u[i] + 6.0 * c * uj[i]))
}

/// The Schwarzschild relativistic acceleration (m/s²) about a central body of gravitational
/// parameter `mu` (IERS Conventions 2010 eq. 10.12, β = γ = 1):
/// `a = μ / (c² r³) [(4 μ / r − v²) r + 4 (r·v) v]`.
pub fn schwarzschild_accel(r: Vec3, v: Vec3, mu: f64) -> Vec3 {
    let c2 = crate::timegeo::C_M_PER_S * crate::timegeo::C_M_PER_S;
    let rn = (r[0] * r[0] + r[1] * r[1] + r[2] * r[2]).sqrt();
    let v2 = v[0] * v[0] + v[1] * v[1] + v[2] * v[2];
    let rv = r[0] * v[0] + r[1] * v[1] + r[2] * v[2];
    let k = mu / (c2 * rn.powi(3));
    std::array::from_fn(|i| k * ((4.0 * mu / rn - v2) * r[i] + 4.0 * rv * v[i]))
}

/// A fully Sun-tracking flat plate (a two-axis-gimballed solar array): its normal is the
/// satellite-to-Sun direction, so it is lit face-on by the Sun.
#[derive(Clone, Debug, PartialEq)]
pub struct SunTrackingPlate {
    /// Area (m²).
    pub area_m2: f64,
    /// Absorption coefficient `α`.
    pub absorption: f64,
    /// Specular reflection coefficient `ρ`.
    pub specular: f64,
    /// Diffuse reflection coefficient `δ` (`α + ρ + δ = 1`).
    pub diffuse: f64,
}

/// Lunar surface radiation for the macro-model's albedo and thermal-IR terms: a Lambertian
/// sphere whose exitance is taken at the sub-satellite point (no surface integration) and seen
/// with the view factor `(R/r)²`. Reflected sunlight `A·S·max(cos ψ, 0)` and thermal emission
/// `ε σ T⁴` with `T = max(T_ss · cos^¼ ψ, T_night)` on the day side and `T_night` at night, `ψ`
/// the solar zenith angle at the sub-satellite point and `S` the solar flux at the Moon.
#[derive(Clone, Debug, PartialEq)]
pub struct LunarSurfaceRadiation {
    /// Bond albedo `A`.
    pub albedo: f64,
    /// Infrared emissivity `ε`.
    pub emissivity: f64,
    /// Subsolar surface temperature `T_ss` (K).
    pub t_subsolar_k: f64,
    /// Night-side surface temperature `T_night` (K).
    pub t_night_k: f64,
}

/// An opt-in spacecraft macro-model for the lunar force model (DS-LRO-10).
///
/// * **Attitude** (a stated approximation, not the flown attitude history): nadir-pointed bus
///   with fixed yaw, body `+Z = −r̂` (toward the Moon's centre), `−Y = ±ĥ` the orbit normal on
///   the Sun's side of the orbit plane, `+X = Y × Z`. This follows LRO's published layout (a
///   single solar array on the `−Y` side, nadir `+Z`, a 180° yaw turn every six months so that
///   the array side faces the Sun; "Orbit determination of the Lunar Reconnaissance Orbiter:
///   Status after seven years", Planetary and Space Science 162, 2018,
///   doi:10.1016/j.pss.2017.10.004, section 2.2); slews and the parked-array mode are not
///   modelled.
/// * **Direct solar radiation** on the body-fixed plates of `bus`
///   ([`crate::srp_boxwing::boxwing_accel_scaled`], Vallado eq. 8-44) and on the Sun-tracking
///   `array`, with the conical shadow of the Moon (radius [`crate::lunar::R_MOON_M`]). Earth
///   eclipses, self-shadowing and spacecraft thermal re-radiation are not modelled.
/// * **Lunar albedo and thermal IR** (only when `surface` is set): the same plate laws with the
///   source along `−r̂` and the [`LunarSurfaceRadiation`] irradiance; the array, whose normal is
///   `ŝ`, takes it on whichever face sees the Moon, with the same optical coefficients.
///
/// The whole acceleration is multiplied by the force model's radiation factor `cr`.
#[derive(Clone, Debug, PartialEq)]
pub struct LunarMacroModel {
    /// Body-fixed plates (in the attitude frame above) and the spacecraft mass.
    pub bus: crate::srp_boxwing::BoxWing,
    /// The Sun-tracking solar array, if any.
    pub array: Option<SunTrackingPlate>,
    /// Lunar albedo and thermal IR; `None` leaves them out.
    pub surface: Option<LunarSurfaceRadiation>,
}

impl LunarMacroModel {
    /// A **labelled generic approximation** of LRO (DS-LRO-10), built only from published facts:
    /// a 10.7 m² two-axis Sun-tracking solar array (NASA PDS LRO instrument-host catalogue) on a
    /// spacecraft of 1060 kg (an upper estimate from "Orbit determination of the Lunar
    /// Reconnaissance Orbiter: Status after seven years", Planetary and Space Science 162, 2018,
    /// doi:10.1016/j.pss.2017.10.004, section 2.2), with lunar albedo 0.11 and equatorial
    /// surface temperatures 390 K / 95 K (NASA NSSDCA Moon fact sheet). Assumed, not sourced: a
    /// black array (α = 1) and emissivity 1. The bus has **no plates**: the published LRO plate
    /// table was not available, and no plate value is invented. Sources and SHA-256 sums:
    /// `docs/design/evidence/ds-lro-10-macro-model/PREREGISTRATION.md`.
    pub fn lro_generic(surface: bool) -> Self {
        Self {
            bus: crate::srp_boxwing::BoxWing {
                panels: vec![],
                mass_kg: 1060.0,
            },
            array: Some(SunTrackingPlate {
                area_m2: 10.7,
                absorption: 1.0,
                specular: 0.0,
                diffuse: 0.0,
            }),
            surface: surface.then_some(LunarSurfaceRadiation {
                albedo: 0.11,
                emissivity: 1.0,
                t_subsolar_k: 390.0,
                t_night_k: 95.0,
            }),
        }
    }

    /// Body-to-inertial attitude matrix (columns are the body axes) for Moon-centred `r`, `v` and
    /// Sun position `s`.
    pub fn attitude(r: Vec3, v: Vec3, s: Vec3) -> Mat3 {
        let n = |x: Vec3| (x[0] * x[0] + x[1] * x[1] + x[2] * x[2]).sqrt();
        let u = |x: Vec3| {
            let k = n(x);
            [x[0] / k, x[1] / k, x[2] / k]
        };
        let cr = |a: Vec3, b: Vec3| {
            [
                a[1] * b[2] - a[2] * b[1],
                a[2] * b[0] - a[0] * b[2],
                a[0] * b[1] - a[1] * b[0],
            ]
        };
        let z = u([-r[0], -r[1], -r[2]]);
        let h = u(cr(r, v));
        let sd = [s[0] - r[0], s[1] - r[1], s[2] - r[2]];
        // −Y on the Sun's side of the orbit plane.
        let sign = if h[0] * sd[0] + h[1] * sd[1] + h[2] * sd[2] >= 0.0 {
            -1.0
        } else {
            1.0
        };
        let y = [sign * h[0], sign * h[1], sign * h[2]];
        let x = cr(y, z);
        [[x[0], y[0], z[0]], [x[1], y[1], z[1]], [x[2], y[2], z[2]]]
    }

    /// The macro-model acceleration (m/s², Moon-centred inertial) at `r`, `v` with the Sun at
    /// Moon-centred `s`, scaled by the radiation factor `cr`.
    pub fn accel(&self, r: Vec3, v: Vec3, s: Vec3, cr: f64) -> Vec3 {
        use crate::ephem::AU_M;
        use crate::forces::SRP_PRESSURE_AU;
        use crate::srp_boxwing::boxwing_accel_scaled;
        let n = |x: Vec3| (x[0] * x[0] + x[1] * x[1] + x[2] * x[2]).sqrt();
        let att = Self::attitude(r, v, s);
        let mut a = [0.0; 3];
        let mut add = |p: Vec3| {
            a = [a[0] + p[0], a[1] + p[1], a[2] + p[2]];
        };
        let nu = conical_shadow_body(r, s, crate::lunar::R_MOON_M);
        let sd = [s[0] - r[0], s[1] - r[1], s[2] - r[2]];
        let d = n(sd);
        let sh = [sd[0] / d, sd[1] / d, sd[2] / d];
        let q = AU_M / d;
        let p_sun = SRP_PRESSURE_AU * q * q; // N/m² at the satellite
        if nu > 0.0 {
            add(boxwing_accel_scaled(r, s, att, &self.bus, cr, nu));
            if let Some(ar) = &self.array {
                add(plate_accel(ar, sh, sh, nu * cr * p_sun / self.bus.mass_kg));
            }
        }
        if let Some(sr) = &self.surface {
            let rn = n(r);
            let rh = [r[0] / rn, r[1] / rn, r[2] / rn];
            // Solar zenith angle at the sub-satellite point (Sun direction from the Moon centre).
            let sn = n(s);
            let cos_psi = (rh[0] * s[0] + rh[1] * s[1] + rh[2] * s[2]) / sn;
            let flux_sun = SRP_PRESSURE_AU * AU_M * AU_M / (sn * sn); // S/c at the Moon (N/m²)
            let view = (crate::lunar::R_MOON_M / rn).powi(2);
            let p_albedo = sr.albedo * flux_sun * cos_psi.max(0.0);
            let t = if cos_psi > 0.0 {
                (sr.t_subsolar_k * cos_psi.powf(0.25)).max(sr.t_night_k)
            } else {
                sr.t_night_k
            };
            let p_ir = sr.emissivity * STEFAN_BOLTZMANN * t.powi(4) / crate::timegeo::C_M_PER_S;
            let p_surf = (p_albedo + p_ir) * view; // N/m² at the satellite, source along −r̂
            if p_surf > 0.0 {
                // A pseudo-Sun one AU from the satellite along −r̂ carries the pressure
                // `SRP_PRESSURE_AU`, so the plate sum is rescaled to `p_surf`.
                let src = [
                    r[0] - AU_M * rh[0],
                    r[1] - AU_M * rh[1],
                    r[2] - AU_M * rh[2],
                ];
                add(boxwing_accel_scaled(
                    r,
                    src,
                    att,
                    &self.bus,
                    cr * p_surf / SRP_PRESSURE_AU,
                    1.0,
                ));
                if let Some(ar) = &self.array {
                    let u = [-rh[0], -rh[1], -rh[2]];
                    let c = u[0] * sh[0] + u[1] * sh[1] + u[2] * sh[2];
                    let nrm = if c >= 0.0 {
                        sh
                    } else {
                        [-sh[0], -sh[1], -sh[2]]
                    };
                    add(plate_accel(ar, u, nrm, cr * p_surf / self.bus.mass_kg));
                }
            }
        }
        a
    }
}

/// Stefan–Boltzmann constant (W m⁻² K⁻⁴), CODATA 2018 (exact in the 2019 SI).
const STEFAN_BOLTZMANN: f64 = 5.670_374_419e-8;

/// Acceleration per unit `k = pressure/mass` (so the result is `k ·` force-per-pressure) of the
/// flat plate `pl` with unit normal `n` lit from unit direction `u` (plate to source):
/// `−k·A·cos θ·[(α + δ) u + 2 (ρ cos θ + δ/3) n]`, zero when `cos θ = n·u ≤ 0`.
fn plate_accel(pl: &SunTrackingPlate, u: Vec3, n: Vec3, k: f64) -> Vec3 {
    let c = u[0] * n[0] + u[1] * n[1] + u[2] * n[2];
    if c <= 0.0 {
        return [0.0; 3];
    }
    let ks = -k * pl.area_m2 * c * (pl.absorption + pl.diffuse);
    let kn = -k * pl.area_m2 * c * 2.0 * (pl.specular * c + pl.diffuse / 3.0);
    std::array::from_fn(|i| ks * u[i] + kn * n[i])
}

impl<E: LunarEnvironment> ForceModel for LunarForceModel<E> {
    fn accel_rv(&self, t: f64, r: Vec3, v: Vec3) -> Vec3 {
        let jd = self.epoch_jd_tdb + t / SECONDS_PER_DAY;

        // Lunar gravity: rotate the inertial position into the Moon body-fixed principal-axis
        // frame (the GRGM field's frame), evaluate, rotate the acceleration back to inertial.
        // The orientation comes from the frame-input provider (analytic by default, DE-grade
        // when an ANISE environment is plugged in).
        let m = self.env.icrf_to_moon_pa(jd);
        let r_bf = mat_vec(&m, r);
        let a_bf = self.field.acceleration(r_bf);
        let mut a = mat_vec(&transpose(&m), a_bf);
        let mut add = |p: Vec3| {
            a = [a[0] + p[0], a[1] + p[1], a[2] + p[2]];
        };

        let need_sun = self.sun || self.srp || self.macro_model.is_some();
        if self.earth || need_sun || self.tide_k2.is_some() {
            let (sun_geo, moon_geo) = self.env.geocentric_sun_moon(jd);
            if let Some(k2) = self.tide_k2 {
                let earth_wrt_moon = [-moon_geo[0], -moon_geo[1], -moon_geo[2]];
                let sun_wrt_moon = [
                    sun_geo[0] - moon_geo[0],
                    sun_geo[1] - moon_geo[1],
                    sun_geo[2] - moon_geo[2],
                ];
                add(degree2_tide_accel(
                    r,
                    earth_wrt_moon,
                    MU_EARTH,
                    k2,
                    self.field.re,
                ));
                add(degree2_tide_accel(
                    r,
                    sun_wrt_moon,
                    MU_SUN,
                    k2,
                    self.field.re,
                ));
            }
            if self.earth {
                // Earth relative to the Moon = −(geocentric Moon).
                let earth_wrt_moon = [-moon_geo[0], -moon_geo[1], -moon_geo[2]];
                add(third_body_accel(r, earth_wrt_moon, MU_EARTH));
            }
            if need_sun {
                // Sun relative to the Moon = (Sun − Moon), both geocentric.
                let sun_wrt_moon = [
                    sun_geo[0] - moon_geo[0],
                    sun_geo[1] - moon_geo[1],
                    sun_geo[2] - moon_geo[2],
                ];
                if self.sun {
                    add(third_body_accel(r, sun_wrt_moon, MU_SUN));
                }
                if self.srp {
                    // The Moon occults the Sun (the conical shadow of a sphere of radius
                    // R_MOON_M about the origin of these Moon-centred vectors).
                    let nu = conical_shadow_body(r, sun_wrt_moon, crate::lunar::R_MOON_M);
                    add(srp_accel_with_lit_fraction(
                        r,
                        sun_wrt_moon,
                        self.cr,
                        self.area_over_mass,
                        nu,
                    ));
                }
                if let Some(mm) = &self.macro_model {
                    add(mm.accel(r, v, sun_wrt_moon, self.cr));
                }
            }
        }

        if self.relativity {
            add(schwarzschild_accel(r, v, self.field.gm));
        }
        if let Some(emp) = self.empirical {
            add(empirical_accel(&emp, r, v));
        }
        a
    }

    fn cr(&self) -> f64 {
        self.cr
    }

    fn set_cr(&mut self, cr: f64) {
        self.cr = cr;
    }

    fn set_empirical(&mut self, empirical: Option<EmpiricalAccel>) {
        self.empirical = empirical;
    }
    // dynamics_matrix uses the trait default (central-difference of accel_rv): the lunar
    // ephemeris/orientation are cheap, so sharing them across the twelve evaluations is not worth
    // the override the Earth model carries.
}

#[cfg(test)]
mod tests {
    use super::*;
    use crate::lunar::{MOON_GM_M3_S2, R_MOON_M};
    use crate::portable_math::PortableFloat;

    fn norm(v: Vec3) -> f64 {
        (v[0] * v[0] + v[1] * v[1] + v[2] * v[2]).sqrt()
    }

    /// A small synthetic lunar field (central + the Moon's real J2 and C22) — no fixture needed
    /// to exercise the force-model structure and the body-fixed frame wiring.
    fn synthetic_moon_field() -> SphericalHarmonicField {
        let mut f = SphericalHarmonicField::zeros(MOON_GM_M3_S2, R_MOON_M, 2);
        f.set(0, 0, 1.0, 0.0);
        f.set(2, 0, -9.088_292_365e-5, 0.0); // C̄20 (lunar oblateness), GRGM660PRIM
        f.set(2, 2, 3.467_094_427e-5, -2.406_424_452e-10); // C̄22/S̄22 (the large sectoral term)
        f
    }

    /// An LRO-like Moon-centred inertial state at ~98 km altitude (off all axes).
    fn lro_state() -> (Vec3, Vec3) {
        let r = [1.50e6, 0.70e6, 0.55e6]; // |r| ≈ 1.744e6 m
                                          // A roughly circular speed ~1.6 km/s perpendicular-ish to r (direction need not be exact).
        let v = [-0.55e3, 0.40e3, 1.50e3];
        (r, v)
    }

    #[test]
    fn degree2_tide_is_the_gradient_of_its_potential_and_lunar_sized() {
        // ΔU = k2 μ_j R⁵ (3 cos²ψ − 1) / (2 r_j³ r³); the acceleration must be its gradient.
        let (k2, re, mu_e): (f64, f64, f64) = (0.02405, 1_738_000.0, MU_EARTH);
        let rj = [-3.2e8, 1.9e8, 5.0e7];
        let pot = |r: Vec3| {
            let n = |x: Vec3| (x[0] * x[0] + x[1] * x[1] + x[2] * x[2]).sqrt();
            let c = (r[0] * rj[0] + r[1] * rj[1] + r[2] * rj[2]) / (n(r) * n(rj));
            k2 * mu_e * re.powi(5) * (3.0 * c * c - 1.0) / (2.0 * n(rj).powi(3) * n(r).powi(3))
        };
        let r = [1.2e6, -0.9e6, 1.0e6];
        let a = degree2_tide_accel(r, rj, mu_e, k2, re);
        let h = 1.0;
        for k in 0..3 {
            let (mut rp, mut rm) = (r, r);
            rp[k] += h;
            rm[k] -= h;
            let g = (pot(rp) - pot(rm)) / (2.0 * h);
            assert!(
                (a[k] - g).abs() <= 1e-6 * g.abs().max(1e-15),
                "{k}: {} vs {g}",
                a[k]
            );
        }
        // About 100 km above the Moon, below the Earth: k2 times the Earth's tidal acceleration at
        // the surface, 2 μ_E R / r_E³ ≈ 2.4e-5 m/s², so about 7e-7 m/s².
        let rl = [-1_838_000.0, 0.0, 0.0];
        let earth = [-3.844e8, 0.0, 0.0];
        let an = degree2_tide_accel(rl, earth, mu_e, k2, re);
        let m = (an[0] * an[0] + an[1] * an[1] + an[2] * an[2]).sqrt();
        assert!((5e-7..1e-6).contains(&m), "tide {m:e} m/s²");
    }

    #[test]
    fn schwarzschild_term_matches_its_circular_orbit_closed_form() {
        // Circular orbit: v² = μ/r, r·v = 0, so a = 3 μ² / (c² r³) outward.
        let mu: f64 = 4.902_800_118e12;
        let r: f64 = 1_838_000.0;
        let v = (mu / r).sqrt();
        let a = schwarzschild_accel([r, 0.0, 0.0], [0.0, v, 0.0], mu);
        let c = crate::timegeo::C_M_PER_S;
        let want = 3.0 * mu * mu / (c * c * r.powi(3));
        assert!((a[0] - want).abs() <= 1e-12 * want && a[1].abs() < 1e-25 && a[2] == 0.0);
        assert!((1e-10..2e-10).contains(&want), "{want:e}");
    }

    #[test]
    fn the_tide_and_relativity_are_off_by_default() {
        let m = LunarForceModel::new(synthetic_moon_field(), 2_459_580.5);
        assert!(m.tide_k2.is_none() && !m.relativity);
    }

    #[test]
    fn lunar_force_is_gravity_dominated() {
        // The total Moon-centred acceleration is dominated by the central lunar attraction
        // μ/|r|² ≈ 1.45 m/s² at ~98 km; everything else is a sub-percent perturbation.
        let fm = LunarForceModel::new(synthetic_moon_field(), 2_459_580.5);
        let (r, v) = lro_state();
        let a = norm(fm.accel_rv(0.0, r, v));
        let central = MOON_GM_M3_S2 / norm(r).ppowi(2);
        assert!(
            (a - central).abs() / central < 0.02,
            "|a| {a} vs central {central} (>2% off — gravity should dominate)"
        );
    }

    #[test]
    fn earth_third_body_is_the_dominant_perturbation() {
        // Toggling the Earth third body changes the acceleration by ~3·10⁻⁵ m/s² — the textbook
        // lunar-orbit tidal magnitude (2·GM⊕·r/d³), and far above the Sun's ~10⁻⁷.
        let (r, v) = lro_state();
        let base = LunarForceModel {
            earth: false,
            sun: false,
            ..LunarForceModel::new(synthetic_moon_field(), 2_459_580.5)
        };
        let with_earth = LunarForceModel {
            earth: true,
            ..base.clone()
        };
        let d = norm([
            with_earth.accel_rv(0.0, r, v)[0] - base.accel_rv(0.0, r, v)[0],
            with_earth.accel_rv(0.0, r, v)[1] - base.accel_rv(0.0, r, v)[1],
            with_earth.accel_rv(0.0, r, v)[2] - base.accel_rv(0.0, r, v)[2],
        ]);
        assert!(
            (5e-6..1e-4).contains(&d),
            "Earth third-body magnitude {d} m/s² off the ~3e-5 band"
        );
    }

    #[test]
    fn body_fixed_field_rotates_with_the_moon() {
        // The C22 bulge is fixed to the Moon, so the gravitational acceleration at a *fixed
        // inertial* point changes as the Moon rotates under it. Evaluating gravity only (no third
        // bodies), the acceleration at epoch and five days later (the Moon turns ~66°) must
        // differ by a real amount — proving the body-fixed rotation is actually applied (a bug
        // that evaluated the field in inertial coordinates would give an identical result).
        let grav_only = LunarForceModel {
            earth: false,
            sun: false,
            ..LunarForceModel::new(synthetic_moon_field(), 2_459_580.5)
        };
        let (r, v) = lro_state();
        let a0 = grav_only.accel_rv(0.0, r, v);
        let a5 = grav_only.accel_rv(5.0 * SECONDS_PER_DAY, r, v);
        let d = norm([a5[0] - a0[0], a5[1] - a0[1], a5[2] - a0[2]]);
        assert!(
            (1e-7..1e-3).contains(&d),
            "body-fixed C22 reorientation over 5 d changed accel by {d} m/s² (expected a real, \
             bounded change — 0 would mean the lunar rotation was not applied)"
        );
    }

    #[test]
    fn empirical_tier_adds_its_rtn_acceleration() {
        // A pure radial empirical constant must raise the acceleration by that amount along r̂.
        let (r, v) = lro_state();
        let base = LunarForceModel {
            earth: false,
            sun: false,
            ..LunarForceModel::new(synthetic_moon_field(), 2_459_580.5)
        };
        let amp = 1.0e-6;
        let withe = LunarForceModel {
            empirical: Some(EmpiricalAccel {
                radial: [amp, 0.0, 0.0],
                ..Default::default()
            }),
            ..base.clone()
        };
        let d = norm([
            withe.accel_rv(0.0, r, v)[0] - base.accel_rv(0.0, r, v)[0],
            withe.accel_rv(0.0, r, v)[1] - base.accel_rv(0.0, r, v)[1],
            withe.accel_rv(0.0, r, v)[2] - base.accel_rv(0.0, r, v)[2],
        ]);
        assert!(
            (d - amp).abs() / amp < 1e-6,
            "empirical radial Δ {d} vs {amp}"
        );
    }

    #[test]
    fn custom_environment_provider_drives_the_force_model() {
        // The provider seam must actually feed accel_rv. A custom LunarEnvironment whose
        // body-fixed orientation differs from the analytic one (here the analytic rotation with
        // an extra fixed 10° about the lunar z-axis) yields a *different* body-fixed gravity
        // acceleration on the sectoral field — proving the swap is wired in, which is exactly the
        // mechanism the out-of-crate DE-grade ANISE environment depends on. If the provider were
        // ignored, both models would share the analytic orientation and the difference would be 0.
        #[derive(Clone, Debug)]
        struct ShiftedEnv;
        impl LunarEnvironment for ShiftedEnv {
            fn icrf_to_moon_pa(&self, jd: f64) -> Mat3 {
                let base = crate::lunar_frame::icrf_to_moon_pa(jd);
                let (c, s) = (10.0_f64.to_radians().pcos(), 10.0_f64.to_radians().psin());
                let rz = [[c, s, 0.0], [-s, c, 0.0], [0.0, 0.0, 1.0]];
                let mut out = [[0.0; 3]; 3];
                for (i, row) in out.iter_mut().enumerate() {
                    for (j, e) in row.iter_mut().enumerate() {
                        *e = (0..3).map(|k| rz[i][k] * base[k][j]).sum();
                    }
                }
                out
            }
            fn geocentric_sun_moon(&self, jd: f64) -> (Vec3, Vec3) {
                AnalyticLunarEnvironment.geocentric_sun_moon(jd)
            }
        }

        let (r, v) = lro_state();
        let analytic = LunarForceModel {
            earth: false,
            sun: false,
            ..LunarForceModel::new(synthetic_moon_field(), 2_459_580.5)
        };
        let shifted = LunarForceModel {
            earth: false,
            sun: false,
            ..LunarForceModel::with_env(synthetic_moon_field(), 2_459_580.5, ShiftedEnv)
        };
        let a0 = analytic.accel_rv(0.0, r, v);
        let a1 = shifted.accel_rv(0.0, r, v);
        let d = norm([a1[0] - a0[0], a1[1] - a0[1], a1[2] - a0[2]]);
        assert!(
            d > 1e-9,
            "custom orientation provider changed the body-fixed gravity accel by {d} m/s² \
             (0 would mean the LunarEnvironment seam is not consumed by accel_rv)"
        );
    }

    fn sun_far() -> Vec3 {
        // A Moon-centred Sun about 1 AU away, off every axis.
        [1.2e11, -8.0e10, -3.0e10]
    }

    fn bare_bus(mass: f64) -> crate::srp_boxwing::BoxWing {
        crate::srp_boxwing::BoxWing {
            panels: vec![],
            mass_kg: mass,
        }
    }

    #[test]
    fn moon_conical_shadow_is_the_earth_one_with_the_moon_radius() {
        let s = sun_far();
        let rn = 1.80e6;
        let sh = norm(s);
        let behind = [-s[0] / sh * rn, -s[1] / sh * rn, -s[2] / sh * rn];
        assert_eq!(conical_shadow_body(behind, s, R_MOON_M), 0.0);
        let sunward = [s[0] / sh * rn, s[1] / sh * rn, s[2] / sh * rn];
        assert_eq!(conical_shadow_body(sunward, s, R_MOON_M), 1.0);
        let r = [7.0e6, 1.0e6, -2.0e6];
        assert_eq!(
            crate::forces::conical_shadow(r, s).to_bits(),
            conical_shadow_body(r, s, crate::forces::RE_EARTH).to_bits()
        );
    }

    #[test]
    fn macro_attitude_is_nadir_fixed_yaw_and_orthonormal() {
        let (r, v) = lro_state();
        let s = sun_far();
        let m = LunarMacroModel::attitude(r, v, s);
        let col = |j: usize| [m[0][j], m[1][j], m[2][j]];
        let (x, y, z) = (col(0), col(1), col(2));
        let dot = |a: Vec3, b: Vec3| a[0] * b[0] + a[1] * b[1] + a[2] * b[2];
        for (a, b) in [(x, y), (y, z), (z, x)] {
            assert!(dot(a, b).abs() < 1e-14);
        }
        for a in [x, y, z] {
            assert!((norm(a) - 1.0).abs() < 1e-14);
        }
        let rn = norm(r);
        assert!((dot(z, r) / rn + 1.0).abs() < 1e-14, "+Z is nadir");
        assert!(dot(y, v).abs() < 1e-9 * norm(v), "+Y is the orbit normal");
        assert!(
            dot(y, [s[0] - r[0], s[1] - r[1], s[2] - r[2]]) <= 0.0,
            "−Y on the Sun side"
        );
    }

    #[test]
    fn sun_tracking_array_alone_is_a_cannonball() {
        // A face-on plate: F = −P A (1 + ρ + 2δ/3) ŝ, i.e. a cannonball with that C_R.
        let (rho, delta) = (0.2, 0.3);
        let mm = LunarMacroModel {
            bus: bare_bus(1000.0),
            array: Some(SunTrackingPlate {
                area_m2: 10.0,
                absorption: 1.0 - rho - delta,
                specular: rho,
                diffuse: delta,
            }),
            surface: None,
        };
        let s = sun_far();
        let sh = norm(s);
        let r = [s[0] / sh * 1.8e6, s[1] / sh * 1.8e6, s[2] / sh * 1.8e6]; // sunlit
        let v = [-1.0e3, 1.0e3, 0.5e3];
        let a = mm.accel(r, v, s, 1.25);
        let want = srp_accel_with_lit_fraction(
            r,
            s,
            1.25 * (1.0 + rho + 2.0 * delta / 3.0),
            10.0 / 1000.0,
            1.0,
        );
        for k in 0..3 {
            assert!(
                (a[k] - want[k]).abs() < 1e-14 * norm(want),
                "{a:?} vs {want:?}"
            );
        }
        // In the Moon's umbra the direct term vanishes.
        let behind = [-r[0], -r[1], -r[2]];
        assert_eq!(mm.accel(behind, v, s, 1.25), [0.0; 3]);
    }

    #[test]
    fn surface_radiation_on_a_nadir_plate_matches_the_closed_form() {
        // A black nadir-facing plate (+Z body) over the subsolar point: the albedo + IR pressure
        // (A S + ε σ T_ss⁴)/c (R/r)² pushes it radially outward.
        use crate::srp_boxwing::Panel;
        let bus = crate::srp_boxwing::BoxWing {
            panels: vec![Panel::fixed(2.0, [0.0, 0.0, 1.0], 1.0, 0.0, 0.0)],
            mass_kg: 500.0,
        };
        let sr = LunarSurfaceRadiation {
            albedo: 0.12,
            emissivity: 0.95,
            t_subsolar_k: 390.0,
            t_night_k: 95.0,
        };
        let mm = LunarMacroModel {
            bus,
            array: None,
            surface: Some(sr.clone()),
        };
        let s = sun_far();
        let sn = norm(s);
        let rn = 1.80e6;
        let r = [s[0] / sn * rn, s[1] / sn * rn, s[2] / sn * rn];
        let v = [s[1], -s[0], 0.0];
        let v = [v[0] / norm(v) * 1.6e3, v[1] / norm(v) * 1.6e3, 0.0];
        let a = mm.accel(r, v, s, 1.0);
        let c = crate::timegeo::C_M_PER_S;
        let flux = crate::forces::SRP_PRESSURE_AU * (crate::ephem::AU_M / sn).powi(2);
        let p = (sr.albedo * flux + sr.emissivity * STEFAN_BOLTZMANN * 390f64.powi(4) / c)
            * (R_MOON_M / rn).powi(2);
        let want = p * 2.0 / 500.0; // the nadir plate faces the Moon, away from the Sun
        let radial = (a[0] * r[0] + a[1] * r[1] + a[2] * r[2]) / rn;
        assert!((radial - want).abs() < 1e-12 * want, "{radial} vs {want}");
        // On the night side only the IR of T_night remains.
        let rn_night = [-r[0], -r[1], -r[2]];
        let a_n = mm.accel(rn_night, v, s, 1.0);
        let want_n =
            sr.emissivity * STEFAN_BOLTZMANN * 95f64.powi(4) / c * (R_MOON_M / rn).powi(2) * 2.0
                / 500.0;
        assert!((norm(a_n) - want_n).abs() < 1e-12 * want_n);
    }

    #[test]
    fn macro_model_is_opt_in_and_replaces_cannonball_srp() {
        let m = LunarForceModel::new(synthetic_moon_field(), 2_459_580.5);
        assert!(m.macro_model.is_none());
        let mm = LunarMacroModel {
            bus: bare_bus(1000.0),
            array: None,
            surface: None,
        };
        let m2 = m.clone().solar_radiation(1.3, 0.01).macro_model(mm, 1.1);
        assert!(!m2.srp && m2.macro_model.is_some() && m2.cr == 1.1);
        // An empty macro-model adds nothing: the result equals the default model's.
        let (r, v) = lro_state();
        assert_eq!(m.accel_rv(0.0, r, v), m2.accel_rv(0.0, r, v));
    }
}
