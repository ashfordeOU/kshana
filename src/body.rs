// SPDX-License-Identifier: AGPL-3.0-only
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

    /// **Mars with a low-degree tesseral gravity field** — [`Body::mars`] carrying a
    /// fully-normalized [`SphericalHarmonicField`] (MRO110B2 / GMM-3-class) in its
    /// [`gravity`](Self::gravity) slot, so the propagator's central-gravity path evaluates the
    /// full `C̄_nm, S̄_nm` field (in the Mars body-fixed frame via [`crate::mars_frame`]) instead
    /// of the two-body + zonal path. See [`with_gmm3_gravity`](Self::with_gmm3_gravity) for the
    /// field construction and the coefficient source. `nmax` caps the degree/order (clamped to the
    /// shipped degree 3).
    pub fn mars_gmm3(nmax: usize) -> Self {
        Self::mars().with_gmm3_gravity(nmax)
    }

    /// Attach a fully-normalized **MRO110B2 / GMM-3-class** Mars gravity field to this body,
    /// returning it with [`gravity`](Self::gravity) populated to degree/order `nmax` (clamped to
    /// the shipped degree 3).
    ///
    /// The field is built in-source (no download) from published, fully-normalized coefficients:
    ///
    /// * the **zonals** `C̄20, C̄30, C̄40` are converted from this body's
    ///   [`zonals`](Self::zonals) (`MARS_ZONALS_J2_J4`, Konopliv MRO110) by the standard
    ///   normalization `C̄_{n,0} = −J_n / √(2n+1)` — so the shipped J2/J3/J4 and the SH C̄_{n,0}
    ///   are one and the same constant (a `J2 = −C̄20·√5` round-trip pins it);
    /// * the **tesserals** `C̄22, S̄22` and `C̄32, S̄32` are the fully-normalized MRO110B2
    ///   (Konopliv et al. 2011) values tabulated in Liu, Baoyin & Ma (2012),
    ///   *Periodic orbits around areostationary points in the Martian gravity field* (Astrophys.
    ///   Space Sci., Table 1; arXiv:1203.1775), in the same IAU North-Pole / Airy-0 prime-meridian
    ///   frame [`crate::mars_frame`] realizes. Mars' `C̄22`/`S̄22` are two orders of magnitude
    ///   larger than Earth's — the dominant tesseral signal.
    ///
    /// The field's reference radius is this body's `Re` (`3 396 200 m`, the IAU mean equatorial
    /// radius), whereas the published MRO110B2 product references `3 396 000 m`; the 200 m (≈6e-5
    /// relative) difference rescales the higher-degree `(Re/r)ⁿ` terms by a negligible amount,
    /// far below the field's own accuracy at this degree. Vendoring the full `.gfc` (which carries
    /// its own `radius`) via [`SphericalHarmonicField::from_gfc`] removes even that, for the
    /// production path.
    ///
    /// `C̄00 = 1` is set so the field carries its own central term (`SphericalHarmonicField`
    /// returns the *total* acceleration). `C̄21/S̄21` are omitted: in the principal-axis / IAU
    /// frame the Mars degree-2 order-1 terms are negligible (the pole is the figure axis), and no
    /// trustworthy non-zero value is invented here. Higher degree/order is available by loading a
    /// vendored ICGEM `.gfc` through [`SphericalHarmonicField::from_gfc`] and assigning it to
    /// [`gravity`](Self::gravity) (mirroring the LRO `GRGM660PRIM_to150.gfc` path), which requires
    /// no code change.
    pub fn with_gmm3_gravity(mut self, nmax: usize) -> Self {
        let nmax = nmax.min(MARS_GMM3_NMAX);
        let mut f = SphericalHarmonicField::zeros(self.mu, self.re, nmax);
        f.set(0, 0, 1.0, 0.0);
        // Zonals C̄_{n,0} = −J_n/√(2n+1), from MARS_ZONALS_J2_J4 = [J2, J3, J4].
        for (i, &jn) in self.zonals.iter().enumerate() {
            let n = i + 2;
            f.set(n, 0, -jn / ((2 * n + 1) as f64).sqrt(), 0.0);
        }
        // Tesserals (fully-normalized MRO110B2, Liu/Baoyin/Ma 2012 Table 1).
        f.set(2, 2, MARS_CBAR22, MARS_SBAR22);
        f.set(3, 2, MARS_CBAR32, MARS_SBAR32);
        self.gravity = Some(f);
        self
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

/// Maximum degree/order of the in-source GMM-3 Mars tesseral field
/// ([`Body::with_gmm3_gravity`]). The field reaches degree 4 in the zonals (`C̄20/C̄30/C̄40`) and
/// degree 3 in the tesserals (`C̄22/S̄22`, `C̄32/S̄32`); a field whose zonal degree exceeds its
/// tesseral degree is well-formed (the absent C̄4m simply stay zero). Higher degree/order loads
/// from a vendored `.gfc` via [`crate::gravity_sh::SphericalHarmonicField::from_gfc`].
const MARS_GMM3_NMAX: usize = 4;

/// Fully-normalized Mars sectoral `C̄22` (MRO110B2, Konopliv et al. 2011; tabulated in Liu,
/// Baoyin & Ma 2012, *Periodic orbits around areostationary points in the Martian gravity field*,
/// Table 1). The dominant tesseral term — two orders of magnitude larger than Earth's.
const MARS_CBAR22: f64 = -0.846_359_145_472_2e-4;
/// Fully-normalized Mars sectoral `S̄22` (same source). Note the sign opposite to `C̄22` (unlike
/// Earth).
const MARS_SBAR22: f64 = 0.489_344_896_683_1e-4;
/// Fully-normalized Mars `C̄32` (same source).
const MARS_CBAR32: f64 = -0.159_479_193_754_6e-4;
/// Fully-normalized Mars `S̄32` (same source).
const MARS_SBAR32: f64 = 0.836_142_557_919_300_3e-5;

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
