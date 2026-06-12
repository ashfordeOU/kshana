// SPDX-License-Identifier: Apache-2.0
//! The DE-grade frame-input provider: ANISE/SPICE lunar orientation and Earth/Sun ephemeris.
//!
//! [`AniseLunarEnvironment`] implements `kshana::lunar_od::LunarEnvironment`, the seam the
//! Moon-centred force model reaches through for its two analytic inputs. Here those inputs come
//! from the JPL Development Ephemeris instead:
//!
//! - **Orientation** — the ICRF→Moon body-fixed **principal-axis** rotation is ANISE's
//!   `MOON_PA_DE440` frame, the numerically-integrated DE440 lunar libration (from the
//!   `moon_pa_de440_200625.bpc` kernel), replacing Kshana's analytic IAU 2015 series (which sits
//!   ~tens of arc-seconds away and is the proven limiting factor of the 6.6 m analytic fit).
//! - **Ephemeris** — the geocentric Sun and Moon positions are ANISE `transform`s through the
//!   DE440 SPK (`de440s.bsp`), replacing the ~0.3° Montenbruck–Gill analytic series.
//!
//! Everything else — the GRGM660PRIM gravity-field evaluation, the third-body and empirical
//! dynamics, and the precise Gauss–Newton estimator — is the *same* `kshana` code the
//! Earth datasets use. Only these two inputs change, which is exactly the experiment: the analytic
//! fit's residual was orientation/ephemeris-limited, so we swap those for DE-grade and re-measure.

use std::sync::Arc;

use anise::almanac::Almanac;
use anise::constants::frames::{EARTH_J2000, EME2000, MOON_J2000, MOON_PA_DE440_FRAME, SUN_J2000};
use anise::prelude::Epoch;

use kshana::lunar_od::LunarEnvironment;

type Mat3 = [[f64; 3]; 3];
type Vec3 = [f64; 3];

/// ANISE-backed DE-grade lunar environment. Cheaply cloneable (the loaded kernels sit behind an
/// `Arc`), so it composes with the estimator's clone-the-template pattern at no copy cost.
#[derive(Clone)]
pub struct AniseLunarEnvironment {
    almanac: Arc<Almanac>,
}

impl std::fmt::Debug for AniseLunarEnvironment {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        f.write_str(
            "AniseLunarEnvironment(DE440 ephemeris + DE440 lunar principal-axis orientation)",
        )
    }
}

impl AniseLunarEnvironment {
    /// Load the DE440 SPK and the DE440 lunar PA BPC into one ANISE [`Almanac`], then validate the
    /// two frame operations the force model needs at a probe epoch so any kernel/frame problem
    /// surfaces here with a clear message rather than deep inside the integrator.
    pub fn load(spk_path: &str, bpc_path: &str) -> Result<Self, String> {
        let almanac = Almanac::new(spk_path)
            .map_err(|e| format!("load DE440 SPK {spk_path}: {e}"))?
            .load(bpc_path)
            .map_err(|e| format!("load lunar PA BPC {bpc_path}: {e}"))?;
        let env = Self {
            almanac: Arc::new(almanac),
        };
        // Probe at 2022-001 (inside both kernels' coverage and the LRO arc).
        let probe = 2_459_580.5;
        env.try_icrf_to_moon_pa(probe)
            .map_err(|e| format!("probe rotate at JD {probe}: {e}"))?;
        env.try_geocentric_sun_moon(probe)
            .map_err(|e| format!("probe ephemeris at JD {probe}: {e}"))?;
        Ok(env)
    }

    /// The ICRF (EME2000) → Moon principal-axis (DE440) rotation at `jd_tdb`, fallible.
    pub fn try_icrf_to_moon_pa(&self, jd_tdb: f64) -> Result<Mat3, String> {
        let epoch = Epoch::from_jde_tdb(jd_tdb);
        let dcm = self
            .almanac
            .rotate(EME2000, MOON_PA_DE440_FRAME, epoch)
            .map_err(|e| format!("rotate EME2000->MOON_PA_DE440: {e}"))?;
        let m = dcm.rot_mat;
        let mut out = [[0.0; 3]; 3];
        for (i, row) in out.iter_mut().enumerate() {
            for (j, e) in row.iter_mut().enumerate() {
                *e = m[(i, j)];
            }
        }
        Ok(out)
    }

    /// The geocentric Sun and Moon positions `(sun, moon)` (m, J2000≈ICRF) at `jd_tdb`, fallible.
    pub fn try_geocentric_sun_moon(&self, jd_tdb: f64) -> Result<(Vec3, Vec3), String> {
        let epoch = Epoch::from_jde_tdb(jd_tdb);
        let moon = self
            .almanac
            .transform(MOON_J2000, EARTH_J2000, epoch, None)
            .map_err(|e| format!("transform Moon wrt Earth: {e}"))?;
        let sun = self
            .almanac
            .transform(SUN_J2000, EARTH_J2000, epoch, None)
            .map_err(|e| format!("transform Sun wrt Earth: {e}"))?;
        let to_m = |r: &anise::math::Vector3| [r[0] * 1000.0, r[1] * 1000.0, r[2] * 1000.0];
        Ok((to_m(&sun.radius_km), to_m(&moon.radius_km)))
    }
}

impl LunarEnvironment for AniseLunarEnvironment {
    fn icrf_to_moon_pa(&self, jd_tdb: f64) -> Mat3 {
        // `load` validated the operation at a probe epoch; a failure here is unexpected and fatal.
        self.try_icrf_to_moon_pa(jd_tdb)
            .expect("ANISE lunar PA rotation (validated at load)")
    }

    fn geocentric_sun_moon(&self, jd_tdb: f64) -> (Vec3, Vec3) {
        self.try_geocentric_sun_moon(jd_tdb)
            .expect("ANISE Earth/Sun ephemeris (validated at load)")
    }
}
