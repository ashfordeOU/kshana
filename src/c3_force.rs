// SPDX-License-Identifier: AGPL-3.0-only
//! The C3 force models for the CAPSTONE NRHO re-run
//! (`docs/design/evidence/c3-capstone-nrho-force-model/PREREGISTRATION.md`).
//!
//! - **M1** is the A2 model ([`LunarForceModel`] with DE440 lunar orientation and the relativistic
//!   term) with the Sun and the Earth read from a DE440 kernel ([`De440LunarEnvironment::new`]),
//!   plus Venus and the Jupiter system barycentre as point masses from the same kernel.
//! - **M2** is M1 plus cannonball solar radiation pressure with one parameter `k = Cr·A/m`
//!   (m²/kg) and conical shadows from the Earth and from the Moon.
//!
//! With no kernel and no radiation pressure, [`C3Model`] is the A2 model and gives its
//! accelerations bit for bit (pinned by `tests/c3_force.rs`). MODELLED; advisory software.

use crate::forces::{conical_shadow_body, srp_accel_with_lit_fraction, third_body_accel, RE_EARTH};
use crate::gravity_sh::SphericalHarmonicField;
use crate::lunar_od::{De440LunarEnvironment, LunarEnvironment, LunarForceModel};
use crate::precise_od::{EmpiricalAccel, ForceModel};
use crate::timescales::SECONDS_PER_DAY;

type Vec3 = [f64; 3];

/// GM of Venus (m³/s²), DE440 (324 858.592 km³/s²).
pub const MU_VENUS: f64 = 3.248_585_92e14;
/// GM of the Jupiter system barycentre (m³/s²), DE440 (126 712 764.1 km³/s²).
pub const MU_JUPITER_SYSTEM: f64 = 1.267_127_641e17;

/// NAIF code of Venus.
pub const NAIF_VENUS: i32 = 299;
/// NAIF code of the Jupiter system barycentre.
pub const NAIF_JUPITER_BARYCENTRE: i32 = 5;

/// Moon-centred positions (m, ICRF) of the two added point masses: `[venus, jupiter_barycentre]`.
pub trait AddedBodies: std::fmt::Debug + Send + Sync {
    /// The positions at the TDB Julian date `jd_tdb`.
    fn moon_centred(&self, jd_tdb: f64) -> [Vec3; 2];
}

/// [`AddedBodies`] read from a DE440 kernel (`de440s.bsp` holds both bodies and the Moon).
#[derive(Debug)]
pub struct KernelAddedBodies(pub std::sync::Arc<crate::ephem_provider::KernelEphemeris>);

impl KernelAddedBodies {
    /// The fallible read, for checking coverage before a propagation.
    ///
    /// # Errors
    /// When the kernel does not cover `jd_tdb` or lacks a body.
    pub fn try_moon_centred(&self, jd_tdb: f64) -> Result<[Vec3; 2], String> {
        let t = crate::jd2::Jd2::new(jd_tdb);
        let moon = crate::ephem_provider::naif_code::MOON;
        Ok([
            self.0.position(NAIF_VENUS, moon, t)?,
            self.0.position(NAIF_JUPITER_BARYCENTRE, moon, t)?,
        ])
    }
}

impl AddedBodies for KernelAddedBodies {
    fn moon_centred(&self, jd_tdb: f64) -> [Vec3; 2] {
        self.try_moon_centred(jd_tdb)
            .unwrap_or_else(|e| panic!("C3 added bodies: {e}"))
    }
}

/// The C3 model: the A2 base, optional added point masses (M1), optional radiation pressure (M2).
#[derive(Clone, Debug)]
pub struct C3Model {
    /// The A2 model with its frame inputs (orientation only for A2; DE440 Sun and Earth for M1).
    pub base: LunarForceModel<De440LunarEnvironment>,
    /// Venus and the Jupiter system barycentre (M1); `None` for A2.
    pub added: Option<std::sync::Arc<dyn AddedBodies>>,
    /// `k = Cr·A/m` (m²/kg) of the cannonball radiation pressure (M2); `None` for A2 and M1.
    pub srp_k: Option<f64>,
}

impl C3Model {
    /// The A2 model exactly: DE440 lunar orientation, analytic Sun and Earth, the relativistic
    /// term, nothing added.
    pub fn a2(field: SphericalHarmonicField, epoch_jd_tdb: f64) -> Self {
        Self {
            base: LunarForceModel::with_env(
                field,
                epoch_jd_tdb,
                De440LunarEnvironment::orientation_only(),
            )
            .relativity(),
            added: None,
            srp_k: None,
        }
    }

    /// M1: the A2 model with the Sun and Earth from `kernel`, and Venus and the Jupiter system
    /// barycentre from the same kernel.
    pub fn m1(
        field: SphericalHarmonicField,
        epoch_jd_tdb: f64,
        kernel: std::sync::Arc<crate::ephem_provider::KernelEphemeris>,
    ) -> Self {
        let env = De440LunarEnvironment::new_shared(kernel.clone());
        Self {
            base: LunarForceModel::with_env(field, epoch_jd_tdb, env).relativity(),
            added: Some(std::sync::Arc::new(KernelAddedBodies(kernel))),
            srp_k: None,
        }
    }

    /// This model with cannonball radiation pressure of parameter `k` (m²/kg): M2 from M1.
    pub fn with_srp(mut self, k: f64) -> Self {
        self.srp_k = Some(k);
        self
    }
}

/// The cannonball radiation-pressure acceleration of M2 on a satellite at Moon-centred `r`, with
/// the Sun at Moon-centred `sun` and the Earth at Moon-centred `earth`: the lit fraction is the
/// product of the Moon's and the Earth's conical shadows (the two never overlap on this orbit).
pub fn m2_srp_accel(r: Vec3, sun: Vec3, earth: Vec3, k: f64) -> Vec3 {
    let nu_moon = conical_shadow_body(r, sun, crate::lunar::R_MOON_M);
    let re = [r[0] - earth[0], r[1] - earth[1], r[2] - earth[2]];
    let se = [sun[0] - earth[0], sun[1] - earth[1], sun[2] - earth[2]];
    let nu_earth = conical_shadow_body(re, se, RE_EARTH);
    srp_accel_with_lit_fraction(r, sun, 1.0, k, nu_moon * nu_earth)
}

impl ForceModel for C3Model {
    fn accel_rv(&self, t: f64, r: Vec3, v: Vec3) -> Vec3 {
        let mut a = self.base.accel_rv(t, r, v);
        if self.added.is_none() && self.srp_k.is_none() {
            return a;
        }
        let jd = self.base.epoch_jd_tdb + t / SECONDS_PER_DAY;
        let mut add = |p: Vec3| a = [a[0] + p[0], a[1] + p[1], a[2] + p[2]];
        if let Some(b) = &self.added {
            let [venus, jupiter] = b.moon_centred(jd);
            add(third_body_accel(r, venus, MU_VENUS));
            add(third_body_accel(r, jupiter, MU_JUPITER_SYSTEM));
        }
        if let Some(k) = self.srp_k {
            let (sun_geo, moon_geo) = self.base.env.geocentric_sun_moon(jd);
            let sun = [
                sun_geo[0] - moon_geo[0],
                sun_geo[1] - moon_geo[1],
                sun_geo[2] - moon_geo[2],
            ];
            let earth = [-moon_geo[0], -moon_geo[1], -moon_geo[2]];
            add(m2_srp_accel(r, sun, earth, k));
        }
        a
    }

    fn cr(&self) -> f64 {
        self.base.cr
    }

    fn set_cr(&mut self, cr: f64) {
        self.base.cr = cr;
    }

    fn set_empirical(&mut self, empirical: Option<EmpiricalAccel>) {
        self.base.empirical = empirical;
    }
}
