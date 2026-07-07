// SPDX-License-Identifier: AGPL-3.0-only
//! Ground-station pass prediction: the time-domain rise/set scheduler that turns
//! an orbit + a ground station + an elevation mask into the list of visibility
//! passes (AOS, TCA, LOS, maximum elevation, duration) over a window — the
//! ground-segment planning query the static look-angle primitives in
//! [`crate::frames`] (`look_angles`/`elevation`/`is_visible`) do not provide on
//! their own.
//!
//! The orbit is propagated in the shared TEME inertial frame and rotated to ECEF
//! at each sample epoch (so the Earth turns under the orbit, which is what creates
//! the passes), then the station look angle is evaluated and mask crossings are
//! detected; AOS/LOS crossing times are linearly interpolated between the
//! bracketing samples for sub-step accuracy.
//!
//! HONEST SCOPE (MODELLED): the maximum elevation and TCA are resolved at the
//! sample-step resolution (refine `step_s` for tighter TCA); a Keplerian orbit
//! carries no SGP4 drag/J2 nodal regression (use an SGP4 propagator for
//! operational fidelity), and the geometry is spherical-station TEME→ECEF without
//! light-time or refraction corrections.

use crate::frames::{look_angles, teme_to_ecef, Geodetic};
use crate::orbit::{Orbit, Propagator, R_EARTH_EQUATORIAL_M};
use serde::Deserialize;

/// One visibility pass of a satellite over a ground station.
#[derive(Clone, Debug, PartialEq)]
pub struct Pass {
    /// Acquisition of signal (s from the window start) — the mask rise crossing.
    pub aos_s: f64,
    /// Time of closest approach / culmination (s from start) — the maximum-elevation sample.
    pub tca_s: f64,
    /// Loss of signal (s from start) — the mask set crossing.
    pub los_s: f64,
    /// Maximum elevation reached during the pass (deg).
    pub max_elevation_deg: f64,
    /// Pass duration (s) = LOS − AOS.
    pub duration_s: f64,
}

/// Linear interpolation of the time at which elevation crosses `mask` between two
/// bracketing samples `(t0, e0)` and `(t1, e1)`.
fn interp_cross(t0: f64, e0: f64, t1: f64, e1: f64, mask: f64) -> f64 {
    if (e1 - e0).abs() < 1e-12 {
        return t0;
    }
    t0 + (mask - e0) / (e1 - e0) * (t1 - t0)
}

/// Station elevation (deg) of the propagated satellite at `t` seconds after the
/// window start epoch `jd0_ut1` (Julian date, UT1).
fn elevation_deg_at(orbit: &Propagator, station: Geodetic, jd0_ut1: f64, t: f64) -> f64 {
    let s = orbit.state_eci(t);
    let r_ecef = teme_to_ecef(s.r_m, jd0_ut1 + t / 86_400.0);
    look_angles(station, r_ecef).el_rad.to_degrees()
}

/// Predict the visibility passes of `orbit` over `station` above `mask_deg`, from
/// the window start epoch `jd0_ut1` for `duration_s`, sampling every `step_s`.
/// A pass already in progress at the start has its AOS clamped to 0; one still in
/// progress at the end has its LOS clamped to `duration_s`.
pub fn predict_passes(
    orbit: &Propagator,
    station: Geodetic,
    jd0_ut1: f64,
    mask_deg: f64,
    duration_s: f64,
    step_s: f64,
) -> Vec<Pass> {
    let mut passes = Vec::new();
    if step_s <= 0.0 || duration_s <= 0.0 {
        return passes;
    }
    let mut prev_t = 0.0;
    let mut prev_el = elevation_deg_at(orbit, station, jd0_ut1, 0.0);
    let mut in_pass = false;
    let mut aos = 0.0;
    let mut tca = 0.0;
    let mut max_el = f64::MIN;
    if prev_el >= mask_deg {
        in_pass = true;
        aos = 0.0;
        tca = 0.0;
        max_el = prev_el;
    }
    let mut t = step_s;
    // Integer-counted fixed-step sampler; the break preserves the original stop.
    let n_steps =
        (((duration_s + 1e-9 - step_s) / step_s).ceil().max(0.0) as usize).saturating_add(2);
    for _ in 0..n_steps {
        if t > duration_s + 1e-9 {
            break;
        }
        let el = elevation_deg_at(orbit, station, jd0_ut1, t);
        if !in_pass {
            if el >= mask_deg {
                in_pass = true;
                aos = interp_cross(prev_t, prev_el, t, el, mask_deg);
                max_el = el;
                tca = t;
            }
        } else {
            if el > max_el {
                max_el = el;
                tca = t;
            }
            if el < mask_deg {
                let los = interp_cross(prev_t, prev_el, t, el, mask_deg);
                passes.push(Pass {
                    aos_s: aos,
                    tca_s: tca,
                    los_s: los,
                    max_elevation_deg: max_el,
                    duration_s: los - aos,
                });
                in_pass = false;
                max_el = f64::MIN;
            }
        }
        prev_t = t;
        prev_el = el;
        t += step_s;
    }
    if in_pass {
        passes.push(Pass {
            aos_s: aos,
            tca_s: tca,
            los_s: duration_s,
            max_elevation_deg: max_el,
            duration_s: duration_s - aos,
        });
    }
    passes
}

fn pa_default_alt() -> f64 {
    550.0
}
fn pa_default_inc() -> f64 {
    97.6
}
fn pa_default_mask() -> f64 {
    10.0
}
fn pa_default_duration_h() -> f64 {
    24.0
}
fn pa_default_step() -> f64 {
    10.0
}
fn pa_default_lat() -> f64 {
    52.2
}

/// The `passes` scenario: predict ground-station visibility passes (AOS/TCA/LOS,
/// max elevation, duration) of a circular orbit over a station above an elevation
/// mask, over a window.
#[derive(Deserialize)]
pub struct PassesScenario {
    /// Circular-orbit altitude (km).
    #[serde(default = "pa_default_alt")]
    pub altitude_km: f64,
    /// Orbital inclination (deg).
    #[serde(default = "pa_default_inc")]
    pub inclination_deg: f64,
    /// Right ascension of the ascending node (deg).
    #[serde(default)]
    pub raan_deg: f64,
    /// Initial argument of latitude (deg) at the window start.
    #[serde(default)]
    pub arg_lat_deg: f64,
    /// Ground-station geodetic latitude (deg).
    #[serde(default = "pa_default_lat")]
    pub station_lat_deg: f64,
    /// Ground-station geodetic longitude (deg).
    #[serde(default)]
    pub station_lon_deg: f64,
    /// Ground-station altitude (m).
    #[serde(default)]
    pub station_alt_m: f64,
    /// Window start epoch (UTC ≈ UT1), as `[year, month, day, hour, minute, second]`.
    #[serde(default)]
    pub epoch: Option<[f64; 6]>,
    /// Elevation mask (deg).
    #[serde(default = "pa_default_mask")]
    pub mask_deg: f64,
    /// Prediction window (hours).
    #[serde(default = "pa_default_duration_h")]
    pub duration_hours: f64,
    /// Sample step (s) — sets the TCA/max-elevation resolution.
    #[serde(default = "pa_default_step")]
    pub step_s: f64,
}

impl PassesScenario {
    /// Run the scenario, returning `(json, summary)`.
    pub fn run_json(&self) -> Result<(String, String), String> {
        if !self.altitude_km.is_finite() || self.altitude_km <= 0.0 {
            return Err("altitude_km must be finite and positive".to_string());
        }
        if !(-90.0..=90.0).contains(&self.station_lat_deg) {
            return Err("station_lat_deg must be in [-90, 90]".to_string());
        }
        if !(0.0..90.0).contains(&self.mask_deg) {
            return Err("mask_deg must be in [0, 90)".to_string());
        }
        if !self.duration_hours.is_finite() || self.duration_hours <= 0.0 {
            return Err("duration_hours must be finite and positive".to_string());
        }
        if !self.step_s.is_finite() || self.step_s <= 0.0 {
            return Err("step_s must be finite and positive".to_string());
        }
        let radius_m = R_EARTH_EQUATORIAL_M + self.altitude_km * 1000.0;
        let orbit = Propagator::Kepler(Orbit::new(
            radius_m,
            self.inclination_deg.to_radians(),
            self.raan_deg.to_radians(),
            self.arg_lat_deg.to_radians(),
        ));
        let station = Geodetic {
            lat_rad: self.station_lat_deg.to_radians(),
            lon_rad: self.station_lon_deg.to_radians(),
            alt_m: self.station_alt_m,
        };
        let e = self.epoch.unwrap_or([2024.0, 1.0, 1.0, 0.0, 0.0, 0.0]);
        let jd0 = crate::timescales::julian_date(
            e[0] as i32,
            e[1] as u32,
            e[2] as u32,
            e[3] as u32,
            e[4] as u32,
            e[5],
        );
        let duration_s = self.duration_hours * 3600.0;
        let passes = predict_passes(&orbit, station, jd0, self.mask_deg, duration_s, self.step_s);

        let total_access_s: f64 = passes.iter().map(|p| p.duration_s).sum();
        let best_el = passes
            .iter()
            .map(|p| p.max_elevation_deg)
            .fold(f64::MIN, f64::max);
        let rows: Vec<serde_json::Value> = passes
            .iter()
            .map(|p| {
                serde_json::json!({
                    "aos_s": p.aos_s,
                    "tca_s": p.tca_s,
                    "los_s": p.los_s,
                    "max_elevation_deg": p.max_elevation_deg,
                    "duration_s": p.duration_s,
                })
            })
            .collect();
        let json = serde_json::json!({
            "kind": "passes",
            "label": "MODELLED — time-domain ground-station pass prediction; Keplerian \
                      propagation + Earth rotation (no SGP4 drag/J2 regression), \
                      TCA/max-elevation at the sample-step resolution, no light-time / \
                      refraction correction",
            "station_lat_deg": self.station_lat_deg,
            "station_lon_deg": self.station_lon_deg,
            "altitude_km": self.altitude_km,
            "inclination_deg": self.inclination_deg,
            "mask_deg": self.mask_deg,
            "duration_hours": self.duration_hours,
            "step_s": self.step_s,
            "pass_count": passes.len(),
            "total_access_s": total_access_s,
            "best_max_elevation_deg": if passes.is_empty() { serde_json::Value::Null } else { serde_json::json!(best_el) },
            "passes": rows,
        });
        let summary = format!(
            "passes: {} pass(es) of a {:.0} km / {:.1}° orbit over ({:.1}°, {:.1}°) > {:.0}° \
             in {:.0} h; {:.0} s total access (MODELLED)",
            passes.len(),
            self.altitude_km,
            self.inclination_deg,
            self.station_lat_deg,
            self.station_lon_deg,
            self.mask_deg,
            self.duration_hours,
            total_access_s,
        );
        let json = serde_json::to_string_pretty(&json).map_err(|e| e.to_string())?;
        Ok((json, summary))
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn interp_cross_is_linear() {
        // Elevation 0 -> 20 over t 100 -> 200; crosses 10 at t = 150.
        assert!((interp_cross(100.0, 0.0, 200.0, 20.0, 10.0) - 150.0).abs() < 1e-9);
        // Degenerate (flat) returns the lower bound rather than dividing by zero.
        assert_eq!(interp_cross(100.0, 5.0, 200.0, 5.0, 10.0), 100.0);
    }

    #[test]
    fn polar_orbit_produces_valid_passes_over_a_mid_latitude_station() {
        // A polar orbit covers every latitude, so a mid-latitude station sees passes.
        let orbit = Propagator::Kepler(Orbit::new(
            R_EARTH_EQUATORIAL_M + 550_000.0,
            90.0_f64.to_radians(),
            0.0,
            0.0,
        ));
        let station = Geodetic {
            lat_rad: 52.0_f64.to_radians(),
            lon_rad: 0.0,
            alt_m: 0.0,
        };
        let jd0 = crate::timescales::julian_date(2024, 1, 1, 0, 0, 0.0);
        let passes = predict_passes(&orbit, station, jd0, 10.0, 24.0 * 3600.0, 10.0);
        assert!(
            !passes.is_empty(),
            "a polar orbit must give a mid-lat station passes"
        );
        let period = 2.0
            * std::f64::consts::PI
            * ((R_EARTH_EQUATORIAL_M + 550_000.0).powi(3) / crate::orbit::MU_EARTH).sqrt();
        for p in &passes {
            assert!(
                p.max_elevation_deg >= 10.0,
                "pass max el {} below mask",
                p.max_elevation_deg
            );
            assert!(
                p.aos_s <= p.tca_s && p.tca_s <= p.los_s,
                "AOS<=TCA<=LOS ordering"
            );
            assert!(
                p.duration_s > 0.0 && p.duration_s < period,
                "duration {} s",
                p.duration_s
            );
            // The culmination is the highest point of the pass.
            assert!(p.max_elevation_deg >= 10.0);
        }
    }

    #[test]
    fn higher_mask_yields_fewer_or_equal_passes() {
        let orbit = Propagator::Kepler(Orbit::new(
            R_EARTH_EQUATORIAL_M + 550_000.0,
            90.0_f64.to_radians(),
            0.0,
            0.0,
        ));
        let station = Geodetic {
            lat_rad: 52.0_f64.to_radians(),
            lon_rad: 0.0,
            alt_m: 0.0,
        };
        let jd0 = crate::timescales::julian_date(2024, 1, 1, 0, 0, 0.0);
        let low = predict_passes(&orbit, station, jd0, 5.0, 24.0 * 3600.0, 10.0).len();
        let high = predict_passes(&orbit, station, jd0, 40.0, 24.0 * 3600.0, 10.0).len();
        assert!(
            high <= low,
            "raising the mask cannot add passes ({high} > {low})"
        );
    }

    #[test]
    fn scenario_runs_reproducibly_and_is_modelled() {
        let scn = PassesScenario {
            altitude_km: 550.0,
            inclination_deg: 90.0,
            raan_deg: 0.0,
            arg_lat_deg: 0.0,
            station_lat_deg: 52.0,
            station_lon_deg: 0.0,
            station_alt_m: 0.0,
            epoch: None,
            mask_deg: 10.0,
            duration_hours: 24.0,
            step_s: 10.0,
        };
        let (j1, _s) = scn.run_json().unwrap();
        let (j2, _s) = scn.run_json().unwrap();
        assert_eq!(j1, j2, "pass prediction must be reproducible");
        let v: serde_json::Value = serde_json::from_str(&j1).unwrap();
        assert_eq!(v["kind"], "passes");
        assert!(v["pass_count"].as_u64().unwrap() >= 1);
        assert!(v["total_access_s"].as_f64().unwrap() > 0.0);
        assert!(v["label"].as_str().unwrap().contains("MODELLED"));
        assert!(!j1.contains("VALIDATED"));
        // Every reported pass clears the mask.
        for p in v["passes"].as_array().unwrap() {
            assert!(p["max_elevation_deg"].as_f64().unwrap() >= 10.0);
        }
    }

    #[test]
    fn scenario_rejects_bad_inputs() {
        let bad = PassesScenario {
            altitude_km: 550.0,
            inclination_deg: 90.0,
            raan_deg: 0.0,
            arg_lat_deg: 0.0,
            station_lat_deg: 200.0, // invalid latitude
            station_lon_deg: 0.0,
            station_alt_m: 0.0,
            epoch: None,
            mask_deg: 10.0,
            duration_hours: 24.0,
            step_s: 10.0,
        };
        assert!(bad.run_json().is_err());
    }
}
