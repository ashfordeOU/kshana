// SPDX-License-Identifier: Apache-2.0
//! Central-body parameters — the gravitational and orientation constants that turn the
//! Earth-hard-coded dynamics core into a body-agnostic one.
//!
//! [`Body`] gathers everything a propagator's central-gravity path needs (the gravitational
//! parameter `μ`, the reference radius `Re`, the zonal field, an optional full tesseral
//! [`crate::gravity_sh::SphericalHarmonicField`]) together with the body's rotation and IAU
//! pole — the orientation data a body-fixed gravity field or a deep-space ground track needs.
//!
//! ## The Earth path stays byte-identical
//!
//! [`Body::earth`] carries the **exact same literals** the legacy [`crate::forces`] / [`crate::orbit`]
//! constants do (`μ = MU_EARTH`, `Re = RE_EARTH`, `zonals = EARTH_ZONALS_J2_J6`), so the
//! body-parameterised force routines reduce to the original arithmetic — with the original constant
//! and the original operation order — when handed `Body::earth()`. That is what keeps every Earth
//! scenario and reproducibility golden bit-for-bit unchanged.
//!
//! ## Scope (honest)
//!
//! This is a parameter record, not a dynamics engine: it holds the constants the force model
//! consumes. The Mars/Moon/Sun entries carry the standard published constants (IAU/DE values,
//! cited inline); the non-Earth gravity fields here are the low-degree zonal sets, not full
//! tesseral models (those load through [`crate::gravity_sh::SphericalHarmonicField::from_gfc`] and
//! can be attached via [`Body::gravity`]).

use crate::gravity_sh::SphericalHarmonicField;

/// Degrees → radians, for the IAU pole/prime-meridian constants below (which are published in
/// degrees and degrees-per-day).
const DEG: f64 = std::f64::consts::PI / 180.0;

/// A central body's gravitational and orientation parameters — the constants a propagator's
/// central-gravity path needs to be body-agnostic instead of Earth-hard-coded.
#[derive(Clone, Debug)]
pub struct Body {
    /// Short body name, for provenance and reporting.
    pub name: &'static str,
    /// Gravitational parameter `μ = GM` (m³/s²).
    pub mu: f64,
    /// Reference radius `Re` (m) — the scale length of the zonal/tesseral expansion.
    pub re: f64,
    /// Unnormalised zonal harmonics `[J2, J3, …]` indexed from degree 2, or `&[]` when the body
    /// is treated as a point mass or its full field is supplied via [`gravity`](Self::gravity).
    pub zonals: &'static [f64],
    /// Optional full tesseral spherical-harmonic field (body-fixed). `None` selects the
    /// two-body + [`zonals`](Self::zonals) path; `Some` supplies a complete `C̄_nm, S̄_nm` model.
    pub gravity: Option<SphericalHarmonicField>,
    /// Body-fixed sidereal spin rate `ω` (rad/s) — the rotation a body-fixed gravity field or a
    /// co-rotating atmosphere turns at.
    pub rotation_rate: f64,
    /// IAU pole right ascension at epoch `α₀` (rad).
    pub pole_ra0: f64,
    /// IAU pole declination at epoch `δ₀` (rad).
    pub pole_dec0: f64,
    /// IAU prime-meridian angle at epoch `W₀` (rad).
    pub prime_w0: f64,
    /// IAU prime-meridian rotation rate `Ẇ` (rad/day).
    pub prime_w_dot: f64,
}

impl Body {
    /// **Earth** — the byte-identical anchor. Carries the exact legacy literals
    /// ([`crate::forces::MU_EARTH`], [`crate::forces::RE_EARTH`],
    /// [`crate::forces::EARTH_ZONALS_J2_J6`], [`crate::forces::EARTH_ROTATION_RATE`]) so the
    /// body-parameterised force routines reproduce the original Earth arithmetic exactly. The IAU
    /// pole/prime-meridian are the WGS/IAU 2009 Earth values (α₀ = 0.00°, δ₀ = 90.00°, W₀ =
    /// 190.147°, Ẇ = 360.9856235°/day, the GMST rate).
    pub fn earth() -> Self {
        Self {
            name: "Earth",
            mu: crate::forces::MU_EARTH,
            re: crate::forces::RE_EARTH,
            zonals: &crate::forces::EARTH_ZONALS_J2_J6,
            gravity: None,
            rotation_rate: crate::forces::EARTH_ROTATION_RATE,
            pole_ra0: 0.0 * DEG,
            pole_dec0: 90.0 * DEG,
            prime_w0: 190.147 * DEG,
            prime_w_dot: 360.985_623_5 * DEG,
        }
    }

    /// **Mars** — IAU/DE constants. `μ = 4.282837e13 m³/s²` (Mars-system, MGS/DE), reference
    /// radius `Re = 3 396 200 m` (IAU mean equatorial), the low-degree zonals
    /// `J2 = 1.96045e-3`, `J3 = 3.145e-5`, `J4 = -1.538e-5` (Konopliv et al., MRO110 Mars
    /// gravity), sidereal spin `ω = 7.088218e-5 rad/s`, and the IAU 2009 Mars pole/prime
    /// meridian (α₀ = 317.681°, δ₀ = 52.886°, W₀ = 176.630°, Ẇ = 350.89198226°/day).
    pub fn mars() -> Self {
        Self {
            name: "Mars",
            mu: 4.282_837e13,
            re: 3_396_200.0,
            zonals: &MARS_ZONALS_J2_J4,
            gravity: None,
            rotation_rate: 7.088_218e-5,
            pole_ra0: 317.681 * DEG,
            pole_dec0: 52.886 * DEG,
            prime_w0: 176.630 * DEG,
            prime_w_dot: 350.891_982_26 * DEG,
        }
    }

    /// **Moon** — `μ = MU_MOON` ([`crate::forces::MU_MOON`], the DE value `4.902800066e12`),
    /// reference radius `Re = 1 737 400 m` (IAU mean), the low-degree zonals
    /// `J2 = 2.0321e-4`, `J3 = 8.476e-6` (GRAIL GRGM/LP-derived), sidereal spin
    /// `ω = 2.6617e-6 rad/s`, and the IAU 2009 lunar pole/prime meridian (the mean elements;
    /// the full physical-libration series is the production follow-on).
    pub fn moon() -> Self {
        Self {
            name: "Moon",
            mu: crate::forces::MU_MOON,
            re: 1_737_400.0,
            zonals: &MOON_ZONALS_J2_J3,
            gravity: None,
            rotation_rate: 2.661_699_5e-6,
            pole_ra0: 269.9949 * DEG,
            pole_dec0: 66.5392 * DEG,
            prime_w0: 38.3213 * DEG,
            prime_w_dot: 13.176_358 * DEG,
        }
    }

    /// **Sun** — point mass. `μ = MU_SUN` ([`crate::forces::MU_SUN`], the IAU value
    /// `1.32712440018e20`), reference radius `Re = 6.957e8 m` (the nominal solar radius), no
    /// zonals (`&[]`), sidereal spin `ω = 2.865e-6 rad/s` (Carrington), and the IAU 2009 solar
    /// pole/prime meridian.
    pub fn sun() -> Self {
        Self {
            name: "Sun",
            mu: crate::forces::MU_SUN,
            re: 6.957e8,
            zonals: &[],
            gravity: None,
            rotation_rate: 2.865_329e-6,
            pole_ra0: 286.13 * DEG,
            pole_dec0: 63.87 * DEG,
            prime_w0: 84.176 * DEG,
            prime_w_dot: 14.1844 * DEG,
        }
    }
}

impl Default for Body {
    /// Earth — so types that hold a [`Body`] and derive `Default` (e.g. the propagator's
    /// `ForceModel`) keep their historical Earth default and stay byte-identical.
    fn default() -> Self {
        Self::earth()
    }
}

/// Mars low-degree unnormalised zonals `[J2, J3, J4]` (Konopliv et al., MRO110B2 Mars gravity
/// field). `J2` is the dominant oblateness term; `J3`/`J4` are the leading odd/even corrections.
pub const MARS_ZONALS_J2_J4: [f64; 3] = [1.960_45e-3, 3.145e-5, -1.538e-5];

/// Moon low-degree unnormalised zonals `[J2, J3]` (GRAIL/LP-derived). The lunar field is far
/// less oblate than Earth's; `J2` ≈ 2e-4.
pub const MOON_ZONALS_J2_J3: [f64; 2] = [2.0321e-4, 8.476e-6];

#[cfg(test)]
mod tests {
    use super::*;
    use crate::forces;

    /// The Earth body is the byte-identical anchor: its `μ`, reference radius and zonal field must
    /// be the *exact* legacy constants the force routines have always used, so the
    /// body-parameterised path reduces to the original Earth arithmetic.
    #[test]
    fn body_earth_matches_legacy_constants() {
        let e = Body::earth();
        assert_eq!(
            e.mu,
            forces::MU_EARTH,
            "Earth μ must be the legacy MU_EARTH"
        );
        assert_eq!(
            e.re,
            forces::RE_EARTH,
            "Earth Re must be the legacy RE_EARTH"
        );
        assert_eq!(
            e.zonals,
            forces::EARTH_ZONALS_J2_J6,
            "Earth zonals must be the legacy EARTH_ZONALS_J2_J6"
        );
        assert_eq!(
            e.rotation_rate,
            forces::EARTH_ROTATION_RATE,
            "Earth spin must be the legacy EARTH_ROTATION_RATE"
        );
        assert!(
            e.gravity.is_none(),
            "Earth uses the zonal path, not an SH field"
        );
        assert_eq!(e.name, "Earth");
    }

    /// The non-Earth bodies carry the cited constants and the right gravity-path selection.
    #[test]
    fn other_bodies_carry_their_constants() {
        let mars = Body::mars();
        assert_eq!(mars.mu, 4.282_837e13);
        assert_eq!(mars.re, 3_396_200.0);
        assert_eq!(mars.zonals[0], 1.960_45e-3);

        let moon = Body::moon();
        assert_eq!(moon.mu, forces::MU_MOON);
        assert_eq!(moon.re, 1_737_400.0);

        let sun = Body::sun();
        assert_eq!(sun.mu, forces::MU_SUN);
        assert!(sun.zonals.is_empty(), "the Sun is a point mass here");
    }
}
