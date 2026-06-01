// SPDX-License-Identifier: Apache-2.0
//! Circular-orbit propagation and GNSS line-of-sight visibility.
//!
//! A deterministic, dependency-free geometry layer that derives GNSS
//! availability from real orbital geometry instead of hand-authored windows: a
//! user spacecraft and a GNSS constellation are propagated on circular orbits,
//! and a GNSS satellite counts as visible when Earth does not occult the
//! line of sight and it clears the user's elevation mask. The visible-satellite
//! count then maps to a [`GnssState`].
//!
//! Constants: Earth gravitational parameter `mu = 3.986004418e14 m^3/s^2`
//! (WGS-84 / EGM) and a spherical Earth of mean radius `6371.0 km` (IUGG mean) —
//! the spherical-Earth simplification is intentional and documented.

use crate::scenario::{ClockCfg, GnssState, GnssTimeline, GnssWindow, TimeCfg};
use serde::{Deserialize, Serialize};

/// Earth gravitational parameter (m^3/s^2), WGS-84 / EGM-96 GM.
pub const MU_EARTH: f64 = 3.986_004_418e14;
/// Spherical Earth mean radius (m), IUGG mean radius R1.
pub const R_EARTH_M: f64 = 6_371_000.0;

type Vec3 = [f64; 3];

fn dot(a: Vec3, b: Vec3) -> f64 {
    a[0] * b[0] + a[1] * b[1] + a[2] * b[2]
}
fn sub(a: Vec3, b: Vec3) -> Vec3 {
    [a[0] - b[0], a[1] - b[1], a[2] - b[2]]
}
fn norm(a: Vec3) -> f64 {
    dot(a, a).sqrt()
}

/// A circular orbit: radius (m), inclination and right ascension of the
/// ascending node (rad), and argument of latitude at t=0 (rad).
#[derive(Clone, Copy, Debug)]
pub struct CircularOrbit {
    pub radius_m: f64,
    pub inclination_rad: f64,
    pub raan_rad: f64,
    pub u0_rad: f64,
}

impl CircularOrbit {
    pub fn new(radius_m: f64, inclination_rad: f64, raan_rad: f64, u0_rad: f64) -> Self {
        Self {
            radius_m,
            inclination_rad,
            raan_rad,
            u0_rad,
        }
    }

    /// Mean motion (rad/s) = sqrt(mu / r^3).
    pub fn mean_motion(&self) -> f64 {
        (MU_EARTH / self.radius_m.powi(3)).sqrt()
    }

    /// Orbital period (s) = 2 pi / n.
    pub fn period_s(&self) -> f64 {
        std::f64::consts::TAU / self.mean_motion()
    }

    /// Earth-centred inertial position (m) at time `t` (s).
    ///
    /// In-plane position `(r cos u, r sin u, 0)` with `u = u0 + n t`, rotated by
    /// the inclination about the x-axis then by the RAAN about the z-axis.
    pub fn position_eci(&self, t: f64) -> Vec3 {
        let u = self.u0_rad + self.mean_motion() * t;
        let (su, cu) = u.sin_cos();
        let (si, ci) = self.inclination_rad.sin_cos();
        let (so, co) = self.raan_rad.sin_cos();
        let r = self.radius_m;
        // After inclination rotation: (r cu, r su ci, r su si).
        let x = r * cu;
        let y = r * su * ci;
        let z = r * su * si;
        // After RAAN rotation about z:
        [x * co - y * so, x * so + y * co, z]
    }
}

/// True when the Earth sphere (radius `R_EARTH_M`) occults the line of sight
/// between `user` and `sat`: the closest point of the segment to Earth's centre
/// lies inside the sphere.
pub fn earth_occults(user: Vec3, sat: Vec3) -> bool {
    let d = sub(sat, user);
    let dd = dot(d, d);
    if dd == 0.0 {
        return false;
    }
    let lambda = (-dot(user, d) / dd).clamp(0.0, 1.0);
    let closest = [
        user[0] + lambda * d[0],
        user[1] + lambda * d[1],
        user[2] + lambda * d[2],
    ];
    norm(closest) < R_EARTH_M
}

/// Elevation angle (degrees) of `sat` above the user's local horizontal — the
/// plane perpendicular to the user's radial (geocentric "up"). Negative below
/// the horizon. `sin(elevation) = up . line_of_sight`.
pub fn elevation_deg(user: Vec3, sat: Vec3) -> f64 {
    let los = sub(sat, user);
    let los_n = norm(los);
    let u_n = norm(user);
    if los_n == 0.0 || u_n == 0.0 {
        return 0.0;
    }
    let sin_el = dot(user, los) / (u_n * los_n);
    sin_el.clamp(-1.0, 1.0).asin().to_degrees()
}

/// Number of GNSS satellites visible from the user at time `t`: not Earth-occulted
/// and at or above the `mask_deg` elevation mask.
pub fn visible_count(user: &CircularOrbit, gnss: &[CircularOrbit], t: f64, mask_deg: f64) -> usize {
    let up = user.position_eci(t);
    gnss.iter()
        .filter(|g| {
            let sp = g.position_eci(t);
            !earth_occults(up, sp) && elevation_deg(up, sp) >= mask_deg
        })
        .count()
}

/// Map a visible-satellite count to a GNSS state: at least four satellites give a
/// full 3D + time fix (`Nominal`); one to three is `Degraded`; none is `Denied`.
pub fn gnss_state(visible: usize) -> GnssState {
    match visible {
        0 => GnssState::Denied,
        1..=3 => GnssState::Degraded,
        _ => GnssState::Nominal,
    }
}

/// A single orbit, configured by altitude and angles in friendly units.
#[derive(Clone, Debug, Deserialize, Serialize)]
pub struct OrbitCfg {
    pub altitude_km: f64,
    pub inclination_deg: f64,
    #[serde(default)]
    pub raan_deg: f64,
    #[serde(default)]
    pub u0_deg: f64,
}

impl OrbitCfg {
    pub fn to_orbit(&self) -> CircularOrbit {
        CircularOrbit::new(
            R_EARTH_M + self.altitude_km * 1000.0,
            self.inclination_deg.to_radians(),
            self.raan_deg.to_radians(),
            self.u0_deg.to_radians(),
        )
    }
}

/// A Walker-delta GNSS constellation: `planes` equally-spaced orbital planes,
/// `sats_per_plane` satellites equally spaced within each, a common altitude and
/// inclination, and an inter-plane phasing factor `phasing_f` (Walker F).
#[derive(Clone, Debug, Deserialize, Serialize)]
pub struct ConstellationCfg {
    pub altitude_km: f64,
    pub inclination_deg: f64,
    pub planes: usize,
    pub sats_per_plane: usize,
    #[serde(default)]
    pub phasing_f: f64,
}

impl ConstellationCfg {
    /// Generate the constellation's satellites.
    pub fn satellites(&self) -> Vec<CircularOrbit> {
        let r = R_EARTH_M + self.altitude_km * 1000.0;
        let inc = self.inclination_deg.to_radians();
        let total = (self.planes * self.sats_per_plane) as f64;
        let mut sats = Vec::with_capacity(self.planes * self.sats_per_plane);
        for p in 0..self.planes {
            let raan = std::f64::consts::TAU * p as f64 / self.planes as f64;
            for s in 0..self.sats_per_plane {
                let u = std::f64::consts::TAU
                    * (s as f64 / self.sats_per_plane as f64 + self.phasing_f * p as f64 / total);
                sats.push(CircularOrbit::new(r, inc, raan, u));
            }
        }
        sats
    }
}

/// Build a GNSS availability timeline by sampling the visible-satellite count on
/// the time grid: each step becomes one half-open window with its derived state.
pub fn build_timeline(
    user: &CircularOrbit,
    gnss: &[CircularOrbit],
    step_s: f64,
    duration_s: f64,
    mask_deg: f64,
) -> GnssTimeline {
    let n = (duration_s / step_s).round() as usize;
    let mut windows = Vec::with_capacity(n + 1);
    for i in 0..=n {
        let t = i as f64 * step_s;
        let state = gnss_state(visible_count(user, gnss, t, mask_deg));
        windows.push(GnssWindow {
            t0: t,
            t1: t + step_s,
            state,
        });
    }
    GnssTimeline { windows }
}

/// A clock-holdover scenario whose GNSS availability is derived from orbital
/// geometry: a user spacecraft, a GNSS constellation, and an elevation mask,
/// rather than hand-authored windows.
#[derive(Clone, Debug, Deserialize, Serialize)]
pub struct OrbitClockScenario {
    pub seed: u64,
    pub threshold_ns: f64,
    pub mask_deg: f64,
    pub time: TimeCfg,
    pub user: OrbitCfg,
    pub constellation: ConstellationCfg,
    pub clock_quantum: ClockCfg,
    pub clock_classical: ClockCfg,
}

#[cfg(test)]
mod tests {
    use super::*;
    use std::f64::consts::{FRAC_PI_2, PI};

    #[test]
    fn period_matches_mean_motion() {
        let o = CircularOrbit::new(7.0e6, 0.0, 0.0, 0.0);
        assert!((o.mean_motion() * o.period_s() - std::f64::consts::TAU).abs() < 1e-9);
    }

    #[test]
    fn position_returns_after_one_period() {
        let o = CircularOrbit::new(7.0e6, 0.9, 0.5, 0.3);
        let p0 = o.position_eci(0.0);
        let p1 = o.position_eci(o.period_s());
        for k in 0..3 {
            assert!(
                (p0[k] - p1[k]).abs() < 1e-3,
                "axis {k}: {} vs {}",
                p0[k],
                p1[k]
            );
        }
    }

    #[test]
    fn equatorial_orbit_is_planar() {
        let o = CircularOrbit::new(7.0e6, 0.0, 0.0, 0.0);
        for i in 0..8 {
            let t = i as f64 * 300.0;
            assert!(o.position_eci(t)[2].abs() < 1e-6, "z not ~0 at t={t}");
        }
        // Radius is preserved.
        assert!((norm(o.position_eci(1234.0)) - 7.0e6).abs() < 1e-3);
    }

    #[test]
    fn polar_orbit_stays_in_x_z_plane() {
        // i = 90 deg, RAAN = 0: the orbit plane contains the z-axis, so Y stays ~0.
        let o = CircularOrbit::new(7.0e6, FRAC_PI_2, 0.0, 0.0);
        for i in 0..8 {
            let t = i as f64 * 300.0;
            assert!(o.position_eci(t)[1].abs() < 1e-6, "y not ~0 at t={t}");
        }
    }

    #[test]
    fn antipodal_satellite_is_occulted() {
        // User and satellite on opposite sides of Earth: line of sight through the
        // centre is blocked.
        let user = [7.0e6, 0.0, 0.0];
        let sat = [-2.0e7, 0.0, 0.0];
        assert!(earth_occults(user, sat));
    }

    #[test]
    fn radially_outward_satellite_is_visible_and_overhead() {
        // Satellite straight up from the user: not occulted, elevation 90 deg.
        let user = [7.0e6, 0.0, 0.0];
        let sat = [2.0e7, 0.0, 0.0];
        assert!(!earth_occults(user, sat));
        assert!((elevation_deg(user, sat) - 90.0).abs() < 1e-9);
    }

    #[test]
    fn tangential_satellite_is_on_the_horizon() {
        // Satellite displaced purely tangentially sits on the local horizon (0 deg).
        let user = [7.0e6, 0.0, 0.0];
        let sat = [7.0e6, 1.0e6, 0.0];
        assert!((elevation_deg(user, sat) - 0.0).abs() < 1e-9);
    }

    fn clock(id: &str, y0: f64, q_wf: f64, q_rw: f64) -> ClockCfg {
        ClockCfg {
            id: id.into(),
            provenance: "test".into(),
            y0,
            q_wf,
            q_rw,
            drift: 0.0,
            flicker_floor: 0.0,
        }
    }

    fn scenario(planes: usize, sats_per_plane: usize) -> OrbitClockScenario {
        OrbitClockScenario {
            seed: 7,
            threshold_ns: 100.0,
            mask_deg: 5.0,
            time: TimeCfg {
                step_s: 60.0,
                duration_s: 7200.0,
            },
            // User above the GNSS constellation (geostationary altitude).
            user: OrbitCfg {
                altitude_km: 35786.0,
                inclination_deg: 0.0,
                raan_deg: 0.0,
                u0_deg: 0.0,
            },
            // GPS-like Walker constellation (MEO ~20,180 km, 55 deg).
            constellation: ConstellationCfg {
                altitude_km: 20180.0,
                inclination_deg: 55.0,
                planes,
                sats_per_plane,
                phasing_f: 1.0,
            },
            clock_quantum: clock("optical", 1e-13, 1e-26, 1e-34),
            clock_classical: clock("csac", 1e-11, 1e-24, 1e-32),
        }
    }

    #[test]
    fn timeline_has_expected_length_and_walker_count() {
        let scn = scenario(6, 4);
        assert_eq!(scn.constellation.satellites().len(), 24);
        let tl = build_timeline(
            &scn.user.to_orbit(),
            &scn.constellation.satellites(),
            scn.time.step_s,
            scn.time.duration_s,
            scn.mask_deg,
        );
        assert_eq!(tl.windows.len(), 7200 / 60 + 1);
    }

    #[test]
    fn sparse_constellation_forces_outage_and_quantum_wins() {
        // Three satellites can never give a 4-satellite fix, so every sample is a
        // GNSS outage: the run is pure holdover and the quantum clock must lead.
        let scn = scenario(1, 3);
        let r = crate::run::run_orbit_clock(&scn);
        let any_outage = r
            .quantum
            .series
            .iter()
            .any(|s| s.gnss != GnssState::Nominal);
        assert!(
            any_outage,
            "sparse constellation should never reach Nominal"
        );
        assert!(r.quantum.fom.timing_p95_ns <= r.classical.fom.timing_p95_ns);
        assert!(r.quantum.fom.integrity.is_some());
    }

    #[test]
    fn orbit_scenario_is_reproducible() {
        let run = || {
            let r = crate::run::run_orbit_clock(&scenario(6, 4));
            (r.quantum.fom.timing_p95_ns, r.classical.fom.timing_p95_ns)
        };
        assert_eq!(run(), run());
    }

    #[test]
    fn visible_count_and_state_mapping() {
        assert_eq!(gnss_state(0), GnssState::Denied);
        assert_eq!(gnss_state(3), GnssState::Degraded);
        assert_eq!(gnss_state(4), GnssState::Nominal);
        // A user at 7000 km with four MEO satellites spread around it: the two on
        // the user's side are visible, the antipodal ones are Earth-occulted.
        let user = CircularOrbit::new(7.0e6, 0.0, 0.0, 0.0); // at (7e6, 0, 0) at t=0
        let meo = 2.0e7 + R_EARTH_M;
        let gnss = vec![
            CircularOrbit::new(meo, 0.0, 0.0, 0.0), // overhead -> visible
            CircularOrbit::new(meo, 0.0, 0.0, PI),  // antipodal -> occulted
            CircularOrbit::new(meo, 0.0, 0.0, 0.3), // near side -> visible
            CircularOrbit::new(meo, 0.0, 0.0, PI - 0.3), // far side -> occulted
        ];
        assert_eq!(visible_count(&user, &gnss, 0.0, 0.0), 2);
    }
}
