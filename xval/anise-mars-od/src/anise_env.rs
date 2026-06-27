// SPDX-License-Identifier: AGPL-3.0-only
//! The DE-grade ephemeris provider: ANISE/SPICE DE440 Mars-barycenter and Sun/Earth positions.
//!
//! [`AniseMarsEnvironment`] loads the JPL DE440 SPK (`de440s.bsp`) into one ANISE [`Almanac`] and
//! exposes the **heliocentric Mars-barycenter** state — and the Sun/Earth positions — the Mars
//! cross-check needs:
//!
//! - **Mars (barycenter) relative to the Sun** — `transform(MARS_BARYCENTER_J2000, SUN_J2000, …)`.
//!   This is the truth that Kshana's Sun-central two-body Mars propagation is measured against. The
//!   returned state carries both position and velocity, so it directly seeds the propagator at the
//!   arc epoch.
//! - **Earth relative to the Sun**, **Mars relative to Earth** — for the geocentric Mars range a
//!   deep-space tracking/OD scenario (D2/D3) consumes; provided here so the same DE-grade
//!   environment can back those checks too.
//!
//! Because `MARS_BARYCENTER_J2000` and `SUN_J2000` share the J2000 orientation, the `transform`
//! reduces to a pure translation through the DE440 SPK — the DE440 ephemeris itself, with no frame
//! rotation of its own. Units are converted km/(km·s⁻¹) → m/(m·s⁻¹) at the boundary, the SI the
//! `kshana` propagator works in.
//!
//! This mirrors `xval/anise-lunar-od`'s `AniseLunarEnvironment`, which loads the same DE440 SPK for
//! the Earth/Sun lunar third bodies; here the target is the Mars system and the centre is the Sun.

use std::sync::Arc;

use anise::almanac::Almanac;
use anise::constants::frames::{
    EARTH_J2000, MARS_BARYCENTER_J2000, MOON_J2000, SSB_J2000, SUN_J2000,
};
use anise::constants::SPEED_OF_LIGHT_KM_S;
use anise::prelude::{Aberration, Epoch, Frame};

type Vec3 = [f64; 3];

/// A position and velocity (m, m/s) in an inertial (J2000≈ICRF) frame at a given epoch.
#[derive(Clone, Copy, Debug)]
pub struct StateVec {
    /// Inertial position (m).
    pub r: Vec3,
    /// Inertial velocity (m/s).
    pub v: Vec3,
}

/// ANISE-backed DE-grade Mars environment. Cheaply cloneable (the loaded kernel sits behind an
/// `Arc`), so it composes with repeated per-epoch queries at no copy cost.
#[derive(Clone)]
pub struct AniseMarsEnvironment {
    almanac: Arc<Almanac>,
}

impl std::fmt::Debug for AniseMarsEnvironment {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        f.write_str("AniseMarsEnvironment(DE440 ephemeris: Mars barycenter + Sun + Earth)")
    }
}

impl AniseMarsEnvironment {
    /// Load the DE440 SPK into one ANISE [`Almanac`], then validate the heliocentric Mars query at a
    /// probe epoch so any kernel/frame problem surfaces here with a clear message rather than deep in
    /// the cross-check loop.
    pub fn load(spk_path: &str) -> Result<Self, String> {
        let almanac =
            Almanac::new(spk_path).map_err(|e| format!("load DE440 SPK {spk_path}: {e}"))?;
        let env = Self {
            almanac: Arc::new(almanac),
        };
        // Probe at 2022-001 (inside the de440s 1849–2150 coverage).
        let probe = 2_459_580.5;
        env.try_mars_wrt_sun(probe)
            .map_err(|e| format!("probe Mars-wrt-Sun at JD {probe}: {e}"))?;
        Ok(env)
    }

    fn state(
        &self,
        target: anise::prelude::Frame,
        center: anise::prelude::Frame,
        jd_tdb: f64,
    ) -> Result<StateVec, String> {
        let epoch = Epoch::from_jde_tdb(jd_tdb);
        let s = self
            .almanac
            .transform(target, center, epoch, None)
            .map_err(|e| format!("transform target wrt center: {e}"))?;
        let to_m = |r: &anise::math::Vector3| [r[0] * 1000.0, r[1] * 1000.0, r[2] * 1000.0];
        Ok(StateVec {
            r: to_m(&s.radius_km),
            v: to_m(&s.velocity_km_s),
        })
    }

    /// The DE440 **heliocentric Mars-barycenter** state (m, m/s, J2000≈ICRF) at `jd_tdb`, fallible.
    /// This is the truth the Sun-central Kshana propagation is compared against.
    pub fn try_mars_wrt_sun(&self, jd_tdb: f64) -> Result<StateVec, String> {
        self.state(MARS_BARYCENTER_J2000, SUN_J2000, jd_tdb)
    }

    /// The DE440 **heliocentric Earth** state (m, m/s) at `jd_tdb`, fallible — for the geocentric
    /// Mars range a deep-space scenario consumes.
    pub fn try_earth_wrt_sun(&self, jd_tdb: f64) -> Result<StateVec, String> {
        self.state(EARTH_J2000, SUN_J2000, jd_tdb)
    }

    /// The DE440 **geocentric Mars-barycenter** position vector (m, J2000≈ICRF) at `jd_tdb`,
    /// fallible — the Earth–Mars line a tracking scenario observes.
    pub fn try_mars_wrt_earth(&self, jd_tdb: f64) -> Result<Vec3, String> {
        Ok(self.state(MARS_BARYCENTER_J2000, EARTH_J2000, jd_tdb)?.r)
    }

    // ------------------------------------------------------------------------
    // D0.7 — Light-time cross-validation plumbing.
    //
    // ANISE's converged-Newtonian aberration light time (`Aberration::CN`, a rewrite of NAIF
    // SPICE's `spkapo`) differences the observer and target **relative to the Solar-System
    // barycenter (SSB)**: it freezes the observer at the reception epoch as `obs_ssb(t)`, then
    // iterates `tgt_ssb(t − τ) − obs_ssb(t)`, `τ = |rel|/c`. To isolate kshana's retarded
    // fixed-point solver from any ephemeris difference, we hand kshana the *identical* geometry:
    // the same DE440 SSB-relative positions ANISE differences. These helpers expose exactly those.
    // ------------------------------------------------------------------------

    /// Map a body name (`"Earth"`, `"Mars"`, `"Sun"`, `"Moon"`) to its J2000 frame in the DE440
    /// kernel. `"Mars"` resolves to the **Mars-system barycenter** (NAIF 4), the body de440s carries
    /// (the Mars-body-centre 499 offset is the tiny Phobos/Deimos pull, far below the residual being
    /// measured) — consistent with the heliocentric Mars cross-check in `xval`.
    fn frame_of(name: &str) -> Result<Frame, String> {
        match name {
            "Earth" => Ok(EARTH_J2000),
            "Mars" => Ok(MARS_BARYCENTER_J2000),
            "Sun" => Ok(SUN_J2000),
            "Moon" => Ok(MOON_J2000),
            other => Err(format!("unsupported light-time body {other}")),
        }
    }

    /// The body's DE440 **SSB-relative** position vector (m, J2000≈ICRF) at `jd_tdb` — geometric, no
    /// aberration. This is the exact `obs_ssb` / `tgt_ssb` ANISE's CN branch differences, so feeding
    /// it to kshana's [`crate::lighttime::SsbDe440Provider`] makes the two solvers iterate on
    /// byte-for-byte the same geometry.
    pub fn ssb_position(&self, name: &str, jd_tdb: f64) -> Result<Vec3, String> {
        Ok(self.state(Self::frame_of(name)?, SSB_J2000, jd_tdb)?.r)
    }

    /// The body's DE440 **SSB-relative** state (position m, velocity m/s) at `jd_tdb` — geometric.
    /// The position is the Taylor coefficient r₀ and the velocity ṙ the fixture stores so the
    /// main-crate test can reconstruct the curved retarded geometry without ANISE.
    pub fn ssb_state(&self, name: &str, jd_tdb: f64) -> Result<StateVec, String> {
        self.state(Self::frame_of(name)?, SSB_J2000, jd_tdb)
    }

    /// The body's DE440 **SSB-relative** acceleration (m/s²) at `jd_tdb`, by a symmetric central
    /// difference of the SSB velocity over `dt_s` seconds — the Taylor coefficient r̈ the fixture
    /// stores so the main-crate test's quadratic motion model reproduces the curved geometry to
    /// sub-mm over the ~10³ s light time.
    pub fn ssb_acceleration(&self, name: &str, jd_tdb: f64, dt_s: f64) -> Result<Vec3, String> {
        let frame = Self::frame_of(name)?;
        let dt_days = dt_s / 86_400.0;
        let plus = self.state(frame, SSB_J2000, jd_tdb + dt_days)?.v;
        let minus = self.state(frame, SSB_J2000, jd_tdb - dt_days)?.v;
        Ok([
            (plus[0] - minus[0]) / (2.0 * dt_s),
            (plus[1] - minus[1]) / (2.0 * dt_s),
            (plus[2] - minus[2]) / (2.0 * dt_s),
        ])
    }

    /// ANISE's **converged-Newtonian aberration light time** (s) for `target` seen from `observer`
    /// at reception epoch `jd_tdb`, over the loaded DE440 kernel. This is the independent oracle: the
    /// magnitude of the `Aberration::CN`-corrected relative position over the speed of light, i.e.
    /// SPICE's `spkapo` 3-step converged Newtonian iteration. Stellar aberration is deliberately off
    /// (`CN`, not `CN+S`) so it models the geometric retarded light time only — the quantity kshana's
    /// solver computes. ANISE's `SPEED_OF_LIGHT_KM_S` (299 792.458 km/s) equals kshana's `C_M_PER_S`
    /// exactly, so the comparison carries no constant mismatch.
    pub fn anise_light_time_cn(
        &self,
        target: &str,
        observer: &str,
        jd_tdb: f64,
    ) -> Result<f64, String> {
        let tgt = Self::frame_of(target)?;
        let obs = Self::frame_of(observer)?;
        let epoch = Epoch::from_jde_tdb(jd_tdb);
        let st = self
            .almanac
            .transform(tgt, obs, epoch, Aberration::CN)
            .map_err(|e| format!("ANISE CN transform {target} wrt {observer} @ JD {jd_tdb}: {e}"))?;
        // radius_km is the CN-corrected (apparent) relative position; its norm over c is the
        // converged one-way light time ANISE iterated to.
        Ok(st.radius_km.norm() / SPEED_OF_LIGHT_KM_S)
    }
}
