// SPDX-License-Identifier: Apache-2.0
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
use anise::constants::frames::{EARTH_J2000, MARS_BARYCENTER_J2000, SUN_J2000};
use anise::prelude::Epoch;

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
}
