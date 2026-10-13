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
//! 7. **Empirical accelerations** (optional) — the same RTN constant + once-per-rev tier the
//!    Earth model uses; frame-agnostic, so it absorbs un-modelled lunar dynamics (the truncated
//!    high-degree field, the ME↔PA offset, the analytic-ephemeris frame slop) in the
//!    reduced-dynamic fit.
//!
//! ## Scope (honest)
//!
//! The Sun/Moon directions come from the built-in mean-equator-of-date analytic ephemeris
//! ([`crate::ephem`], ~0.3° from ICRF at 2022 from un-modelled precession); the Earth third-body
//! direction therefore carries a near-static sub-arcminute bias, absorbed by the empirical
//! constant terms. The SRP shadow reuses the Earth-radius conical model — negligible at the Moon
//! and unused with SRP off. These are the documented residuals the reduced-dynamic tier carries;
//! the headline lunar residuals are reported in `tests/agency_lro.rs`.

use crate::ephem::{moon_position, sun_position};
use crate::forces::{srp_accel, third_body_accel, MU_EARTH, MU_SUN};
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

        let need_sun = self.sun || self.srp;
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
                    add(srp_accel(r, sun_wrt_moon, self.cr, self.area_over_mass));
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
        let central = MOON_GM_M3_S2 / norm(r).powi(2);
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
                let (c, s) = (10.0_f64.to_radians().cos(), 10.0_f64.to_radians().sin());
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
}
