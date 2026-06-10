// SPDX-License-Identifier: Apache-2.0
//! Moon-centred force model for lunar precise orbit determination — the selenocentric analogue
//! of [`crate::precise_od::PreciseForceModel`].
//!
//! [`LunarForceModel`] implements the same [`crate::precise_od::ForceModel`] interface, so the one
//! reference-grade Gauss–Newton batch estimator ([`crate::precise_od::fit`]) and its variational
//! STM propagators fit an orbit about the **Moon** exactly as they do about the Earth. The
//! acceleration (m/s², Moon-centred ICRF/J2000 — the frame JPL Horizons reports the LRO truth in)
//! is the sum of:
//!
//! 1. **Lunar gravity** — a fully-normalized spherical-harmonic field ([`crate::gravity_sh`],
//!    the GRAIL GRGM660PRIM coefficients) evaluated in the Moon body-fixed frame: rotate the
//!    inertial position into the lunar **ME** frame with [`crate::lunar_frame::icrf_to_iau_moon`],
//!    evaluate, rotate the acceleration back. (GRGM is strictly principal-axis; the ME↔PA offset
//!    is the documented arc-minute residual of `lunar_frame`.)
//! 2. **Earth third body** — the dominant lunar-orbit perturbation (~3·10⁻⁵ m/s² at ~98 km),
//!    Earth relative to the Moon = −(geocentric Moon position) from [`crate::ephem`].
//! 3. **Sun third body** — small (~10⁻⁷ m/s²), Sun relative to the Moon.
//! 4. **SRP** (optional) — cannonball with `C_R`/`A·m⁻¹`; off by default for LRO (the panel area
//!    is unknown and the ~10⁻⁷ m/s² signal is below the empirical-tier floor for a short arc).
//! 5. **Empirical accelerations** (optional) — the same RTN constant + once-per-rev tier the
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
use crate::lunar_frame::icrf_to_iau_moon;
use crate::precession::{julian_centuries_tt, mat_vec, transpose};
use crate::precise_od::{empirical_accel, EmpiricalAccel, ForceModel};
use crate::timescales::SECONDS_PER_DAY;

type Vec3 = [f64; 3];

/// A Moon-centred force model: a lunar spherical-harmonic gravity field evaluated in the body-fixed
/// frame, plus the configured third bodies, optional SRP, and the optional empirical tier.
#[derive(Clone, Debug)]
pub struct LunarForceModel {
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
}

impl LunarForceModel {
    /// A Moon-centred model over the given lunar gravity `field` at `epoch_jd_tdb`, with the
    /// Earth and Sun third bodies enabled and no SRP or empirical tier — the dynamic baseline.
    pub fn new(field: SphericalHarmonicField, epoch_jd_tdb: f64) -> Self {
        Self {
            field,
            epoch_jd_tdb,
            earth: true,
            sun: true,
            srp: false,
            cr: 1.0,
            area_over_mass: 0.0,
            empirical: None,
        }
    }

    /// Enable solar-radiation pressure with coefficient `cr` and area-to-mass `area_over_mass`.
    pub fn solar_radiation(mut self, cr: f64, area_over_mass: f64) -> Self {
        self.srp = true;
        self.cr = cr;
        self.area_over_mass = area_over_mass;
        self
    }

    /// The geocentric Sun and Moon positions (m, mean-equator-of-date ≈ ICRF) at `jd`.
    fn geocentric(jd: f64) -> (Vec3, Vec3) {
        let tjc = julian_centuries_tt(jd);
        (sun_position(tjc), moon_position(tjc))
    }
}

impl ForceModel for LunarForceModel {
    fn accel_rv(&self, t: f64, r: Vec3, v: Vec3) -> Vec3 {
        let jd = self.epoch_jd_tdb + t / SECONDS_PER_DAY;

        // Lunar gravity: rotate the inertial position into the Moon body-fixed frame, evaluate the
        // field, rotate the acceleration back into the inertial frame.
        let m = icrf_to_iau_moon(jd);
        let r_bf = mat_vec(&m, r);
        let a_bf = self.field.acceleration(r_bf);
        let mut a = mat_vec(&transpose(&m), a_bf);
        let mut add = |p: Vec3| {
            a = [a[0] + p[0], a[1] + p[1], a[2] + p[2]];
        };

        let need_sun = self.sun || self.srp;
        if self.earth || need_sun {
            let (sun_geo, moon_geo) = Self::geocentric(jd);
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
}
