// SPDX-License-Identifier: Apache-2.0
//! Earth-observation payload footprint & coverage geometry: the SMAD/Wertz
//! "space triangle" relations that turn an orbit altitude and a sensor field of
//! view into the angular radius of the Earth, the swath width, the nadir ground
//! sample distance, the maximum off-nadir access, and the equatorial ground-track
//! spacing that drives revisit.
//!
//! The space triangle (spacecraft, Earth centre, target): with the Earth angular
//! radius `ρ` (`sin ρ = R_e/(R_e+h)`), a sensor nadir (off-boresight) angle `η`
//! gives the target elevation `ε` via `cos ε = sin η / sin ρ`, the Earth-central
//! angle `λ = 90° − η − ε`, and a ground range `R_e·λ`. At nadir `η=0 → λ=0`; at
//! the horizon `η=ρ → ε=0` and `λ` is the maximum coverage half-angle.
//!
//! HONEST SCOPE (MODELLED): spherical-Earth geometry only. Swath/GSD/access are
//! geometric; there is no radiometry, MTF, atmospheric, pointing-jitter or
//! sun-glint model, and the equatorial ground-track spacing is the simple nodal
//! `R_e·ω⊕·T` (no J2 nodal-regression or eccentricity treatment).

use crate::forces::EARTH_ROTATION_RATE;
use crate::orbit::{MU_EARTH, R_EARTH_EQUATORIAL_M};
use serde::Deserialize;

/// Earth angular radius `ρ` (rad) seen from a spacecraft at geometric
/// `altitude_m`: `asin(R_e/(R_e+h))`.
pub fn earth_angular_radius(altitude_m: f64) -> f64 {
    (R_EARTH_EQUATORIAL_M / (R_EARTH_EQUATORIAL_M + altitude_m)).asin()
}

/// Target elevation angle `ε` (rad) for a sensor nadir angle `eta_rad` at
/// `altitude_m`: `cos ε = sin η / sin ρ`. Errors when `η` exceeds the Earth
/// angular radius (the line of sight misses the Earth).
pub fn elevation_from_nadir_angle(eta_rad: f64, altitude_m: f64) -> Result<f64, String> {
    let rho = earth_angular_radius(altitude_m);
    let c = eta_rad.sin() / rho.sin();
    if !(0.0..=1.0).contains(&c) {
        return Err(format!(
            "nadir angle {:.2}° exceeds the Earth angular radius {:.2}° (misses Earth)",
            eta_rad.to_degrees(),
            rho.to_degrees()
        ));
    }
    Ok(c.acos())
}

/// Earth-central angle `λ` (rad) subtended from sub-satellite point to the target
/// at nadir angle `eta_rad`: `λ = π/2 − η − ε`.
pub fn earth_central_angle(eta_rad: f64, altitude_m: f64) -> Result<f64, String> {
    let eps = elevation_from_nadir_angle(eta_rad, altitude_m)?;
    Ok(std::f64::consts::FRAC_PI_2 - eta_rad - eps)
}

/// Ground range (m, surface arc) from the sub-satellite point to a target at nadir
/// angle `eta_rad`: `R_e·λ`.
pub fn ground_range(eta_rad: f64, altitude_m: f64) -> Result<f64, String> {
    Ok(R_EARTH_EQUATORIAL_M * earth_central_angle(eta_rad, altitude_m)?)
}

/// Swath width (m, surface arc) for a nadir-pointing sensor of half field-of-view
/// `half_fov_rad`: `2·R_e·λ(half_fov)`.
pub fn swath_width(half_fov_rad: f64, altitude_m: f64) -> Result<f64, String> {
    Ok(2.0 * ground_range(half_fov_rad, altitude_m)?)
}

/// Nadir ground sample distance (m) for an instantaneous-field-of-view of
/// `ifov_microrad` per pixel at `altitude_m`: `h · IFOV`.
pub fn nadir_gsd(altitude_m: f64, ifov_microrad: f64) -> f64 {
    altitude_m * ifov_microrad * 1e-6
}

/// Circular-orbit period (s) at `altitude_m`: `2π·sqrt((R_e+h)³/μ)`.
pub fn circular_period(altitude_m: f64) -> f64 {
    let r = R_EARTH_EQUATORIAL_M + altitude_m;
    std::f64::consts::TAU * (r * r * r / MU_EARTH).sqrt()
}

/// Equatorial ground-track spacing (m) between successive ascending nodes: the
/// Earth turns `ω⊕·T` under the orbit each revolution, so the nodes are
/// `R_e·ω⊕·T` apart at the equator.
pub fn ground_track_spacing_equator(period_s: f64) -> f64 {
    R_EARTH_EQUATORIAL_M * EARTH_ROTATION_RATE * period_s
}

fn eo_default_alt() -> f64 {
    700.0
}
fn eo_default_half_fov() -> f64 {
    7.5
}
fn eo_default_ifov() -> f64 {
    14.0
}

/// The `eo-coverage` scenario: Earth angular radius, swath width, nadir GSD,
/// maximum off-nadir access and equatorial ground-track spacing (with a contiguous-
/// coverage flag) for an EO payload on a circular orbit.
#[derive(Deserialize)]
pub struct EoCoverageScenario {
    /// Circular-orbit altitude (km).
    #[serde(default = "eo_default_alt")]
    pub altitude_km: f64,
    /// Sensor half field-of-view (deg), measured as a nadir angle from boresight.
    #[serde(default = "eo_default_half_fov")]
    pub half_fov_deg: f64,
    /// Instantaneous field of view per pixel (microradians) for the nadir GSD.
    #[serde(default = "eo_default_ifov")]
    pub ifov_microrad: f64,
    /// Maximum slewable off-nadir angle (deg) — the field of regard for access.
    #[serde(default)]
    pub max_off_nadir_deg: Option<f64>,
}

impl EoCoverageScenario {
    /// Run the scenario, returning `(json, summary)`.
    pub fn run_json(&self) -> Result<(String, String), String> {
        if !self.altitude_km.is_finite() || self.altitude_km <= 0.0 {
            return Err("altitude_km must be finite and positive".to_string());
        }
        if !(0.0..90.0).contains(&self.half_fov_deg) || self.half_fov_deg <= 0.0 {
            return Err("half_fov_deg must be in (0, 90)".to_string());
        }
        if !self.ifov_microrad.is_finite() || self.ifov_microrad <= 0.0 {
            return Err("ifov_microrad must be finite and positive".to_string());
        }
        let alt_m = self.altitude_km * 1000.0;
        let rho = earth_angular_radius(alt_m);
        let swath = swath_width(self.half_fov_deg.to_radians(), alt_m)
            .map_err(|e| format!("half_fov too large: {e}"))?;
        let gsd = nadir_gsd(alt_m, self.ifov_microrad);
        let period = circular_period(alt_m);
        let spacing = ground_track_spacing_equator(period);

        // Maximum access ground range at the field-of-regard edge (clamped to the
        // horizon if the slew exceeds the Earth angular radius).
        let max_off_nadir = self
            .max_off_nadir_deg
            .map(|d| d.to_radians().min(rho))
            .unwrap_or(rho);
        let max_access_m = ground_range(max_off_nadir, alt_m).unwrap_or(0.0);

        let contiguous = swath >= spacing;

        let json = serde_json::json!({
            "kind": "eo-coverage",
            "label": "MODELLED — spherical-Earth space-triangle geometry; swath/GSD/access \
                      are geometric (no radiometry/MTF/atmosphere/jitter/glint), ground-track \
                      spacing is simple nodal R_e·ω·T (no J2 regression)",
            "altitude_km": self.altitude_km,
            "half_fov_deg": self.half_fov_deg,
            "earth_angular_radius_deg": rho.to_degrees(),
            "swath_width_km": swath / 1000.0,
            "nadir_gsd_m": gsd,
            "max_off_nadir_deg": max_off_nadir.to_degrees(),
            "max_access_ground_range_km": max_access_m / 1000.0,
            "orbital_period_min": period / 60.0,
            "equatorial_ground_track_spacing_km": spacing / 1000.0,
            "contiguous_equatorial_coverage": contiguous,
        });
        let summary = format!(
            "eo-coverage: {:.0} km, ±{:.1}° FOV -> {:.0} km swath, {:.1} m nadir GSD, \
             access to {:.0} km off-nadir; node spacing {:.0} km ({}) (MODELLED)",
            self.altitude_km,
            self.half_fov_deg,
            swath / 1000.0,
            gsd,
            max_access_m / 1000.0,
            spacing / 1000.0,
            if contiguous { "contiguous" } else { "gapped" }
        );
        let json = serde_json::to_string_pretty(&json).map_err(|e| e.to_string())?;
        Ok((json, summary))
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn earth_angular_radius_is_64_degrees_at_700km() {
        let rho = earth_angular_radius(700_000.0).to_degrees();
        assert!((rho - 64.28).abs() < 0.1, "angular radius {rho}°");
        // Shrinks with altitude (GEO sees a small Earth).
        assert!(earth_angular_radius(35_786_000.0).to_degrees() < 9.0);
    }

    #[test]
    fn nadir_look_sees_the_subpoint_at_zenith_with_zero_ground_range() {
        let eps = elevation_from_nadir_angle(0.0, 700_000.0).unwrap();
        assert!(
            (eps - std::f64::consts::FRAC_PI_2).abs() < 1e-9,
            "nadir elevation"
        );
        assert!(
            ground_range(0.0, 700_000.0).unwrap().abs() < 1e-6,
            "nadir ground range"
        );
    }

    #[test]
    fn horizon_look_gives_zero_elevation_and_max_central_angle() {
        let rho = earth_angular_radius(700_000.0);
        let eps = elevation_from_nadir_angle(rho, 700_000.0).unwrap();
        assert!(eps.abs() < 1e-6, "horizon elevation ~0");
        let lambda = earth_central_angle(rho, 700_000.0).unwrap();
        // λ_max = 90° − ρ = 25.7° at 700 km → ~2860 km max ground range.
        assert!((lambda.to_degrees() - (90.0 - rho.to_degrees())).abs() < 1e-6);
        let gr = ground_range(rho, 700_000.0).unwrap();
        assert!(
            (2_700_000.0..3_000_000.0).contains(&gr),
            "max ground range {gr} m"
        );
    }

    #[test]
    fn looking_past_the_horizon_errors() {
        let rho = earth_angular_radius(700_000.0);
        assert!(elevation_from_nadir_angle(rho + 0.05, 700_000.0).is_err());
    }

    #[test]
    fn swath_grows_with_fov_and_gsd_with_altitude() {
        let narrow = swath_width(5.0_f64.to_radians(), 700_000.0).unwrap();
        let wide = swath_width(20.0_f64.to_radians(), 700_000.0).unwrap();
        assert!(wide > narrow);
        // GSD = h·IFOV: 700 km · 14 µrad ≈ 9.8 m.
        assert!((nadir_gsd(700_000.0, 14.0) - 9.8).abs() < 0.01);
        assert!(nadir_gsd(800_000.0, 14.0) > nadir_gsd(700_000.0, 14.0));
    }

    #[test]
    fn ground_track_spacing_is_about_2750km_at_700km() {
        let t = circular_period(700_000.0);
        assert!((t / 60.0 - 98.8).abs() < 1.0, "period {} min", t / 60.0);
        let s = ground_track_spacing_equator(t);
        assert!(
            (2_600_000.0..2_900_000.0).contains(&s),
            "node spacing {s} m"
        );
    }

    #[test]
    fn scenario_runs_reproducibly_and_is_modelled() {
        let scn = EoCoverageScenario {
            altitude_km: 700.0,
            half_fov_deg: 7.5,
            ifov_microrad: 14.0,
            max_off_nadir_deg: Some(45.0),
        };
        let (j1, _s) = scn.run_json().unwrap();
        let (j2, _s) = scn.run_json().unwrap();
        assert_eq!(j1, j2);
        let v: serde_json::Value = serde_json::from_str(&j1).unwrap();
        assert_eq!(v["kind"], "eo-coverage");
        assert!(v["label"].as_str().unwrap().contains("MODELLED"));
        assert!(!j1.contains("VALIDATED"));
        assert!((v["earth_angular_radius_deg"].as_f64().unwrap() - 64.28).abs() < 0.1);
        assert!(v["swath_width_km"].as_f64().unwrap() > 0.0);
        // A narrow 7.5° FOV swath cannot close the ~2750 km node gap at the equator.
        assert_eq!(v["contiguous_equatorial_coverage"], false);
    }

    #[test]
    fn scenario_rejects_bad_inputs() {
        let bad = EoCoverageScenario {
            altitude_km: -1.0,
            half_fov_deg: 7.5,
            ifov_microrad: 14.0,
            max_off_nadir_deg: None,
        };
        assert!(bad.run_json().is_err());
    }
}
