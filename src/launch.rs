// SPDX-License-Identifier: Apache-2.0
//! Launch-window & ascent geometry: the two-body relations a mission analyst uses
//! at the trade-study tier to turn a launch-site latitude and a target orbit into
//! launch azimuth(s), the minimum reachable inclination, the Earth-rotation
//! velocity bonus, plane-change (dogleg) Δv, and the number of daily launch
//! opportunities.
//!
//! HONEST SCOPE (MODELLED): spherical-Earth two-body geometry. The launch azimuth
//! is the geometric relation `sin(Az) = cos(i)/cos(lat)`; it does **not** apply the
//! launch-velocity-triangle correction for the rotating-Earth boost (that boost is
//! reported separately as `site_rotation_speed` / the eastward Δv saving, for the
//! analyst to fold in). No ascent trajectory, drag-loss, or steering model — this
//! is pre-Phase-A geometry, not a trajectory optimiser.

use crate::forces::EARTH_ROTATION_RATE;
use crate::orbit::{MU_EARTH, R_EARTH_EQUATORIAL_M};
use serde::Deserialize;

/// Circular orbital speed (m/s) at geometric `altitude_m` above the equatorial
/// radius: `sqrt(mu / r)`.
pub fn circular_velocity(altitude_m: f64) -> f64 {
    (MU_EARTH / (R_EARTH_EQUATORIAL_M + altitude_m)).sqrt()
}

/// The minimum orbital inclination directly reachable from a site at geodetic
/// `lat_rad` without a plane-change dogleg: `|lat|`.
pub fn min_inclination(lat_rad: f64) -> f64 {
    lat_rad.abs()
}

/// Eastward surface speed (m/s) of a launch site at `lat_rad` from Earth's
/// rotation: `omega · R_eq · cos(lat)` — the free velocity a posigrade (easterly)
/// launch starts with (≈465 m/s at the equator).
pub fn site_rotation_speed(lat_rad: f64) -> f64 {
    EARTH_ROTATION_RATE * R_EARTH_EQUATORIAL_M * lat_rad.cos()
}

/// Plane-change Δv (m/s) to rotate a velocity of magnitude `v_orbit` through
/// `delta_i_rad`: the vector relation `2·v·sin(Δi/2)`.
pub fn plane_change_dv(v_orbit: f64, delta_i_rad: f64) -> f64 {
    2.0 * v_orbit * (delta_i_rad.abs() / 2.0).sin()
}

/// Geometric launch azimuth(s) (rad clockwise from north, in `[0, 2π)`) to reach
/// orbital `inclination_rad` from a site at geodetic `lat_rad`, two-body:
/// `sin(Az) = cos(i)/cos(lat)`. Returns `(ascending, descending)` azimuths
/// (the descending pass is `π − ascending`). Errors when `i < |lat|` (the target
/// inclination is unreachable without a dogleg) or `i > π − |lat|`.
pub fn launch_azimuth(lat_rad: f64, inclination_rad: f64) -> Result<(f64, f64), String> {
    let cl = lat_rad.cos();
    if cl.abs() < 1e-12 {
        return Err("launch site at the pole has no defined azimuth".to_string());
    }
    let s = inclination_rad.cos() / cl;
    if !(-1.0..=1.0).contains(&s) {
        return Err(format!(
            "inclination {:.2}° unreachable from latitude {:.2}° without a dogleg \
             (need |lat| ≤ i ≤ 180−|lat|)",
            inclination_rad.to_degrees(),
            lat_rad.to_degrees()
        ));
    }
    let asc = s.asin(); // in [-π/2, π/2]; for prograde i this is the NE/SE azimuth
    let asc = asc.rem_euclid(std::f64::consts::TAU);
    let desc = (std::f64::consts::PI - s.asin()).rem_euclid(std::f64::consts::TAU);
    Ok((asc, desc))
}

/// Number of daily launch opportunities to a given inclination from a site at
/// `lat_rad`: two (an ascending and a descending node pass) in general, one when
/// the target inclination equals the site latitude (the orbit plane is tangent to
/// the site's latitude circle), and none when it is unreachable.
pub fn daily_launch_opportunities(lat_rad: f64, inclination_rad: f64) -> u8 {
    let l = lat_rad.abs();
    let i = inclination_rad;
    if i < l - 1e-9 || i > std::f64::consts::PI - l + 1e-9 {
        0
    } else if (i - l).abs() < 1e-9 || (i - (std::f64::consts::PI - l)).abs() < 1e-9 {
        1
    } else {
        2
    }
}

fn lw_default_lat() -> f64 {
    28.5
}
fn lw_default_inc() -> f64 {
    51.6
}
fn lw_default_alt() -> f64 {
    400.0
}

/// The `launch-window` scenario: launch azimuth(s), minimum inclination, circular
/// velocity, Earth-rotation bonus, dogleg Δv (if the target is below the site
/// latitude) and daily opportunities for a site latitude + target orbit.
#[derive(Deserialize)]
pub struct LaunchWindowScenario {
    /// Launch-site geodetic latitude (deg).
    #[serde(default = "lw_default_lat")]
    pub site_lat_deg: f64,
    /// Target orbital inclination (deg).
    #[serde(default = "lw_default_inc")]
    pub target_inclination_deg: f64,
    /// Target circular-orbit altitude (km).
    #[serde(default = "lw_default_alt")]
    pub altitude_km: f64,
}

impl LaunchWindowScenario {
    /// Run the scenario, returning `(json, summary)`.
    pub fn run_json(&self) -> Result<(String, String), String> {
        if !(-90.0..=90.0).contains(&self.site_lat_deg) {
            return Err("site_lat_deg must be in [-90, 90]".to_string());
        }
        if !(0.0..=180.0).contains(&self.target_inclination_deg) {
            return Err("target_inclination_deg must be in [0, 180]".to_string());
        }
        if !self.altitude_km.is_finite() || self.altitude_km <= 0.0 {
            return Err("altitude_km must be finite and positive".to_string());
        }
        let lat = self.site_lat_deg.to_radians();
        let inc = self.target_inclination_deg.to_radians();
        let alt_m = self.altitude_km * 1000.0;
        let v_orbit = circular_velocity(alt_m);
        let i_min = min_inclination(lat).to_degrees();
        let opportunities = daily_launch_opportunities(lat, inc);

        // Direct azimuths when reachable; otherwise the dogleg Δv from i_min.
        let (azimuths, dogleg_dv) = match launch_azimuth(lat, inc) {
            Ok((asc, desc)) => (
                Some((asc.to_degrees(), desc.to_degrees())),
                if inc < lat {
                    Some(plane_change_dv(v_orbit, lat - inc))
                } else {
                    None
                },
            ),
            Err(_) => (None, Some(plane_change_dv(v_orbit, (lat - inc).abs()))),
        };

        let json = serde_json::json!({
            "kind": "launch-window",
            "label": "MODELLED — two-body spherical-Earth launch geometry; azimuth \
                      is the geometric sin(Az)=cos(i)/cos(lat) relation (no rotating-Earth \
                      velocity-triangle correction, no ascent/drag-loss model)",
            "site_lat_deg": self.site_lat_deg,
            "target_inclination_deg": self.target_inclination_deg,
            "altitude_km": self.altitude_km,
            "min_inclination_deg": i_min,
            "circular_velocity_m_s": v_orbit,
            "site_rotation_speed_m_s": site_rotation_speed(lat),
            "daily_opportunities": opportunities,
            "launch_azimuth_deg": azimuths.map(|(a, d)| serde_json::json!({"ascending": a, "descending": d})),
            "dogleg_plane_change_dv_m_s": dogleg_dv,
        });
        let summary = match azimuths {
            Some((asc, _)) => format!(
                "launch-window: lat {:.1}° -> i {:.1}°: Az {:.1}° asc, v_circ {:.0} m/s, \
                 +{:.0} m/s Earth-rotation bonus, {} opportunities/day (MODELLED)",
                self.site_lat_deg,
                self.target_inclination_deg,
                asc,
                v_orbit,
                site_rotation_speed(lat),
                opportunities
            ),
            None => format!(
                "launch-window: i {:.1}° < lat {:.1}° -> direct launch impossible; \
                 dogleg Δv {:.0} m/s (MODELLED)",
                self.target_inclination_deg,
                self.site_lat_deg,
                dogleg_dv.unwrap_or(0.0)
            ),
        };
        let json = serde_json::to_string_pretty(&json).map_err(|e| e.to_string())?;
        Ok((json, summary))
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn due_east_launch_reaches_inclination_equal_to_latitude() {
        // From any site, a due-east (Az=90°) launch reaches i = latitude.
        for lat_deg in [0.0_f64, 28.5, 51.6] {
            let lat = lat_deg.to_radians();
            let (asc, _desc) = launch_azimuth(lat, lat).unwrap();
            assert!(
                (asc.to_degrees() - 90.0).abs() < 1e-6,
                "lat {lat_deg}: due-east azimuth"
            );
        }
    }

    #[test]
    fn ksc_to_iss_inclination_is_the_textbook_45_degrees() {
        // KSC (28.5°N) to the ISS inclination (51.6°): the classic ~45° azimuth.
        let (asc, desc) = launch_azimuth(28.5_f64.to_radians(), 51.6_f64.to_radians()).unwrap();
        assert!(
            (asc.to_degrees() - 44.98).abs() < 0.1,
            "asc {:.2}",
            asc.to_degrees()
        );
        // The descending opportunity is the south-east mirror (180 − asc).
        assert!((desc.to_degrees() - (180.0 - asc.to_degrees())).abs() < 1e-9);
    }

    #[test]
    fn polar_launch_is_due_north_and_south() {
        let (asc, desc) =
            launch_azimuth(28.5_f64.to_radians(), std::f64::consts::FRAC_PI_2).unwrap();
        assert!(asc.to_degrees().abs() < 1e-6 || (asc.to_degrees() - 360.0).abs() < 1e-6);
        assert!((desc.to_degrees() - 180.0).abs() < 1e-6);
    }

    #[test]
    fn inclination_below_latitude_is_unreachable_directly() {
        // Can't reach i=10° directly from 28.5°N — needs a dogleg.
        assert!(launch_azimuth(28.5_f64.to_radians(), 10.0_f64.to_radians()).is_err());
        assert_eq!(
            daily_launch_opportunities(28.5_f64.to_radians(), 10.0_f64.to_radians()),
            0
        );
    }

    #[test]
    fn earth_rotation_bonus_is_465_m_s_at_the_equator() {
        assert!(
            (site_rotation_speed(0.0) - 465.1).abs() < 1.0,
            "equator bonus"
        );
        // Falls off as cos(lat); ~0 at the pole.
        assert!(site_rotation_speed(std::f64::consts::FRAC_PI_2) < 1e-6);
        assert!(site_rotation_speed(60.0_f64.to_radians()) < site_rotation_speed(0.0));
    }

    #[test]
    fn plane_change_dv_matches_the_vector_triangle() {
        // 10° plane change at ~7.7 km/s ≈ 1.34 km/s.
        let v = 7700.0;
        let dv = plane_change_dv(v, 10.0_f64.to_radians());
        assert!((dv - 1342.0).abs() < 5.0, "plane-change dv {dv}");
        // A full reversal (180°) costs 2v; zero change costs nothing.
        assert!((plane_change_dv(v, std::f64::consts::PI) - 2.0 * v).abs() < 1e-6);
        assert_eq!(plane_change_dv(v, 0.0), 0.0);
    }

    #[test]
    fn circular_velocity_is_about_7_67_km_s_in_leo() {
        let v = circular_velocity(400_000.0);
        assert!((7600.0..7700.0).contains(&v), "LEO circular velocity {v}");
    }

    #[test]
    fn daily_opportunities_are_two_when_strictly_between_the_bounds() {
        let lat = 28.5_f64.to_radians();
        assert_eq!(daily_launch_opportunities(lat, 51.6_f64.to_radians()), 2);
        assert_eq!(daily_launch_opportunities(lat, lat), 1); // tangent case
    }

    #[test]
    fn scenario_runs_reproducibly_and_is_modelled() {
        let scn = LaunchWindowScenario {
            site_lat_deg: 28.5,
            target_inclination_deg: 51.6,
            altitude_km: 400.0,
        };
        let (j1, _s) = scn.run_json().unwrap();
        let (j2, _s) = scn.run_json().unwrap();
        assert_eq!(j1, j2, "scenario must be reproducible");
        let v: serde_json::Value = serde_json::from_str(&j1).unwrap();
        assert_eq!(v["kind"], "launch-window");
        assert!(v["label"].as_str().unwrap().contains("MODELLED"));
        assert!(!j1.contains("VALIDATED"));
        assert!((v["launch_azimuth_deg"]["ascending"].as_f64().unwrap() - 44.98).abs() < 0.1);
        assert_eq!(v["daily_opportunities"], 2);
    }

    #[test]
    fn scenario_reports_a_dogleg_when_inclination_is_below_latitude() {
        let scn = LaunchWindowScenario {
            site_lat_deg: 51.6,
            target_inclination_deg: 28.5,
            altitude_km: 400.0,
        };
        let (j, _s) = scn.run_json().unwrap();
        let v: serde_json::Value = serde_json::from_str(&j).unwrap();
        assert!(
            v["launch_azimuth_deg"].is_null(),
            "no direct azimuth below latitude"
        );
        assert!(v["dogleg_plane_change_dv_m_s"].as_f64().unwrap() > 0.0);
    }
}
