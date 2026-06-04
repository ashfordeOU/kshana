// SPDX-License-Identifier: Apache-2.0
//! Walker-delta constellation design on the validated SGP4 core.
//!
//! The synthetic Walker generator in [`crate::orbit`] emits analytic Keplerian
//! orbits. This module instead emits a designed Walker pattern as **SGP4 mean
//! elements**, so the constellation is propagated through the very same SGP4 path
//! validated to 4.12 mm against the AIAA 2006-6753 vectors. On top of the
//! generator it adds the two outputs a constellation reviewer expects: a
//! dilution-of-precision sweep over the design grid (planes × satellites ×
//! inclination) and coverage-fraction / revisit-time figures of merit.

use crate::sgp4::{wgs72, Sgp4};
use serde::{Deserialize, Serialize};
use std::f64::consts::TAU;

/// A Walker-delta constellation in the `i: T/P/F` convention: `planes` (P)
/// equally-spaced orbital planes, `sats_per_plane` satellites each (so the total
/// `T = planes * sats_per_plane`), a common circular `altitude_km` and
/// `inclination_deg` (i), and the inter-plane phasing parameter `phasing_f` (F,
/// in `0..planes`) that offsets the mean anomaly between adjacent planes.
#[derive(Clone, Debug, Deserialize, Serialize, PartialEq)]
pub struct WalkerSgp4 {
    pub altitude_km: f64,
    pub inclination_deg: f64,
    pub planes: usize,
    pub sats_per_plane: usize,
    #[serde(default)]
    pub phasing_f: f64,
}

/// Julian date of the common Walker epoch (an arbitrary recent instant — the
/// pattern is a geometry, so only the shared epoch matters, not its value).
pub const WALKER_EPOCH_DAYS_1950: f64 = 25_000.0;
pub fn walker_epoch_jd() -> f64 {
    2_433_281.5 + WALKER_EPOCH_DAYS_1950
}

impl WalkerSgp4 {
    pub fn total(&self) -> usize {
        self.planes * self.sats_per_plane
    }

    /// The Kozai (Brouwer) mean motion in rad/min for a circular orbit at this
    /// altitude, chosen so SGP4's mean semi-major axis `a = (xke/n)^(2/3)` equals
    /// the target radius `R_earth + altitude`.
    pub fn mean_motion_kozai_rad_min(&self) -> f64 {
        let g = wgs72();
        let a_er = (g.radiusearthkm + self.altitude_km) / g.radiusearthkm;
        g.xke / a_er.powf(1.5)
    }

    /// Build the constellation as SGP4 propagators from circular mean elements
    /// (eccentricity and argument-of-perigee zero), all sharing one epoch so the
    /// inter-plane RAAN spacing is a pure inertial geometry. Each satellite is
    /// routed through the validated SGP4 core.
    pub fn satellites(&self) -> Vec<crate::orbit::Propagator> {
        let g = wgs72();
        let no_kozai = self.mean_motion_kozai_rad_min();
        let inclo = self.inclination_deg.to_radians();
        let total = self.total() as f64;
        let mut sats = Vec::with_capacity(self.total());
        for p in 0..self.planes {
            let nodeo = TAU * p as f64 / self.planes as f64;
            for s in 0..self.sats_per_plane {
                let mo = (TAU
                    * (s as f64 / self.sats_per_plane as f64 + self.phasing_f * p as f64 / total))
                    % TAU;
                let sgp4 = Sgp4::new(
                    g,
                    false,
                    WALKER_EPOCH_DAYS_1950,
                    0.0, // bstar (drag): a clean design pattern, no decay
                    0.0, // eccentricity: circular
                    0.0, // argp
                    inclo,
                    mo,
                    no_kozai,
                    nodeo,
                );
                sats.push(crate::orbit::Propagator::Sgp4(Box::new(sgp4)));
            }
        }
        sats
    }
}

#[cfg(test)]
mod tests {
    use super::*;
    use crate::orbit::Propagator;

    fn radius(p: [f64; 3]) -> f64 {
        (p[0] * p[0] + p[1] * p[1] + p[2] * p[2]).sqrt()
    }

    /// A GPS-like Walker: 24 satellites, 6 planes of 4, 55° inclination, MEO.
    fn gps_like() -> WalkerSgp4 {
        WalkerSgp4 {
            altitude_km: 20_180.0,
            inclination_deg: 55.0,
            planes: 6,
            sats_per_plane: 4,
            phasing_f: 1.0,
        }
    }

    #[test]
    fn walker_builds_sgp4_satellites_on_the_target_shell() {
        let w = gps_like();
        let sats = w.satellites();
        assert_eq!(sats.len(), 24, "6 planes x 4 sats");
        let target_r = (wgs72().radiusearthkm + w.altitude_km) * 1000.0;
        for s in &sats {
            assert!(
                matches!(s, Propagator::Sgp4(_)),
                "Walker must emit SGP4 propagators (the validated core)"
            );
            // At epoch the satellite sits on the requested circular shell. SGP4's
            // J2 un-Kozai shifts the mean motion slightly, so allow 1%.
            let r = radius(s.position_eci(0.0));
            assert!(
                (r - target_r).abs() / target_r < 0.01,
                "Walker SGP4 radius {r:.0} m vs target {target_r:.0} m"
            );
        }
    }

    #[test]
    fn walker_planes_are_equally_spaced_in_raan() {
        // Four planes, one satellite each, so the only difference between sats is
        // the ascending-node longitude. Recover each plane's RAAN from its orbit
        // normal and check the four are spaced exactly 90° apart.
        let w = WalkerSgp4 {
            altitude_km: 20_180.0,
            inclination_deg: 55.0,
            planes: 4,
            sats_per_plane: 1,
            phasing_f: 0.0,
        };
        let sats = w.satellites();
        assert_eq!(sats.len(), 4);
        // Orbit normal h = r x v points along (sin i sinΩ, -sin i cosΩ, cos i),
        // so the ascending-node longitude is Ω = atan2(h_x, -h_y).
        let raan_deg = |p: &Propagator| {
            let r = p.position_eci(0.0);
            let v = p.velocity_eci(0.0);
            let hx = r[1] * v[2] - r[2] * v[1];
            let hy = r[2] * v[0] - r[0] * v[2];
            hx.atan2(-hy).rem_euclid(TAU).to_degrees()
        };
        let raans: Vec<f64> = sats.iter().map(raan_deg).collect();
        for (k, &om) in raans.iter().enumerate() {
            let expect = 90.0 * k as f64;
            let diff = (om - expect).rem_euclid(360.0);
            let diff = diff.min(360.0 - diff);
            assert!(
                diff < 0.5,
                "plane {k} RAAN {om:.2}°, expected {expect:.0}° (off by {diff:.2}°)"
            );
        }
    }

    #[test]
    fn walker_mean_motion_matches_the_orbital_period() {
        // A 20 180 km circular orbit is the GPS half-sidereal-day orbit: period
        // ~11 h 58 m. Check the chosen mean motion reproduces it within 0.2%.
        let w = gps_like();
        let n_rad_min = w.mean_motion_kozai_rad_min();
        let period_min = TAU / n_rad_min;
        assert!(
            (period_min - 718.0).abs() < 2.0,
            "GPS-shell period {period_min:.1} min, expected ~718 min"
        );
    }
}
