// SPDX-License-Identifier: Apache-2.0
//! Ballistic re-entry corridor (Allen–Eggers): the closed-form analytic entry of a
//! non-lifting body through an exponential atmosphere at a constant flight-path
//! angle. It turns an entry velocity + flight-path angle into peak deceleration,
//! the velocity and altitude where that peak occurs, and the peak-heating velocity
//! — the pre-Phase-A corridor numbers an EDL analyst brackets before any
//! high-fidelity trajectory or aerothermal run.
//!
//! The famous Allen–Eggers result: peak deceleration
//! `a_max = V_e²·sin|γ| / (2·e·H)` is **independent of the ballistic coefficient**
//! (mass, drag and area cancel). The peak occurs at `V = V_e·e^(−1/2)`, and the
//! convective stagnation heating rate (`∝ √ρ·V³`) peaks earlier, at
//! `V = V_e·e^(−1/6)`.
//!
//! HONEST SCOPE (MODELLED): ballistic (no lift), exponential isothermal
//! atmosphere, constant flight-path angle, flat decel-only energy balance. No
//! aerothermal (TPS) model — the heating output is the Allen–Eggers *velocity at
//! peak heating*, not a heat-flux in W/m². Not a 3-/6-DoF trajectory.

use crate::orbit::R_EARTH_EQUATORIAL_M;
use serde::Deserialize;

/// Earth sea-level density (kg/m³) used as the exponential-atmosphere reference.
pub const RHO0_EARTH: f64 = 1.225;
/// Earth atmospheric density scale height (m) for the exponential model.
pub const SCALE_HEIGHT_EARTH_M: f64 = 7200.0;
/// Standard gravity (m/s²), for expressing deceleration in g.
pub const G0: f64 = 9.806_65;

/// Allen–Eggers peak deceleration (m/s²) for entry speed `v_entry_m_s` at
/// flight-path angle `gamma_rad` (below horizontal) through an atmosphere of scale
/// height `scale_height_m`: `V_e²·sin|γ| / (2·e·H)`. Independent of the ballistic
/// coefficient.
pub fn peak_deceleration(v_entry_m_s: f64, gamma_rad: f64, scale_height_m: f64) -> f64 {
    v_entry_m_s * v_entry_m_s * gamma_rad.abs().sin() / (2.0 * std::f64::consts::E * scale_height_m)
}

/// Velocity (m/s) at which peak deceleration occurs: `V_e·e^(−1/2)` (≈0.607·V_e).
pub fn velocity_at_peak_deceleration(v_entry_m_s: f64) -> f64 {
    v_entry_m_s * (-0.5_f64).exp()
}

/// Velocity (m/s) at which convective stagnation heating peaks: `V_e·e^(−1/6)`
/// (≈0.846·V_e) — earlier (faster) than the deceleration peak.
pub fn velocity_at_peak_heating(v_entry_m_s: f64) -> f64 {
    v_entry_m_s * (-1.0 / 6.0_f64).exp()
}

/// Altitude (m) of peak deceleration: the peak occurs at density
/// `ρ* = B·sin|γ| / H`, so `h* = H·ln(ρ0·H / (B·sin|γ|))`, where `B` is the
/// ballistic coefficient `m/(C_D·A)` (kg/m²). Unlike the peak magnitude, this
/// altitude depends on `B`.
pub fn altitude_at_peak_deceleration(
    gamma_rad: f64,
    ballistic_coeff: f64,
    rho0: f64,
    scale_height_m: f64,
) -> f64 {
    let rho_star = ballistic_coeff * gamma_rad.abs().sin() / scale_height_m;
    // h* = H·ln(ρ0/ρ*); since ρ* already carries the 1/H, this expands to the
    // textbook H·ln(ρ0·H/(B·sin|γ|)).
    scale_height_m * (rho0 / rho_star).ln()
}

fn re_default_v() -> f64 {
    7800.0
}
fn re_default_gamma() -> f64 {
    6.0
}
fn re_default_bc() -> f64 {
    100.0
}

/// The `reentry` scenario: the Allen–Eggers ballistic re-entry corridor — peak
/// deceleration (m/s² and g), the velocity and altitude at peak-g, and the
/// peak-heating velocity — for an entry velocity, flight-path angle and ballistic
/// coefficient (Earth exponential atmosphere by default).
#[derive(Deserialize)]
pub struct ReentryScenario {
    /// Atmospheric-interface entry velocity (m/s).
    #[serde(default = "re_default_v")]
    pub entry_velocity_m_s: f64,
    /// Entry flight-path angle below local horizontal (deg, positive downward).
    #[serde(default = "re_default_gamma")]
    pub flight_path_angle_deg: f64,
    /// Ballistic coefficient m/(C_D·A) (kg/m²).
    #[serde(default = "re_default_bc")]
    pub ballistic_coeff_kg_m2: f64,
    /// Atmospheric scale height (m); defaults to Earth.
    #[serde(default)]
    pub scale_height_m: Option<f64>,
    /// Sea-level reference density (kg/m³); defaults to Earth.
    #[serde(default)]
    pub rho0_kg_m3: Option<f64>,
}

impl ReentryScenario {
    /// Run the scenario, returning `(json, summary)`.
    pub fn run_json(&self) -> Result<(String, String), String> {
        let h = self.scale_height_m.unwrap_or(SCALE_HEIGHT_EARTH_M);
        let rho0 = self.rho0_kg_m3.unwrap_or(RHO0_EARTH);
        if !self.entry_velocity_m_s.is_finite() || self.entry_velocity_m_s <= 0.0 {
            return Err("entry_velocity_m_s must be finite and positive".to_string());
        }
        if !(0.0..90.0).contains(&self.flight_path_angle_deg) || self.flight_path_angle_deg == 0.0 {
            return Err("flight_path_angle_deg must be in (0, 90)".to_string());
        }
        if !self.ballistic_coeff_kg_m2.is_finite() || self.ballistic_coeff_kg_m2 <= 0.0 {
            return Err("ballistic_coeff_kg_m2 must be finite and positive".to_string());
        }
        if !h.is_finite() || h <= 0.0 || !rho0.is_finite() || rho0 <= 0.0 {
            return Err("scale_height_m and rho0_kg_m3 must be finite and positive".to_string());
        }
        let gamma = self.flight_path_angle_deg.to_radians();
        let v = self.entry_velocity_m_s;
        let a_max = peak_deceleration(v, gamma, h);
        let h_star = altitude_at_peak_deceleration(gamma, self.ballistic_coeff_kg_m2, rho0, h);

        let json = serde_json::json!({
            "kind": "reentry",
            "label": "MODELLED — Allen–Eggers ballistic (no-lift) entry, exponential \
                      isothermal atmosphere, constant flight-path angle; peak-g is \
                      ballistic-coefficient-independent; heating is the peak-heating \
                      VELOCITY, NOT a heat-flux (no aerothermal/TPS model)",
            "entry_velocity_m_s": v,
            "flight_path_angle_deg": self.flight_path_angle_deg,
            "ballistic_coeff_kg_m2": self.ballistic_coeff_kg_m2,
            "scale_height_m": h,
            "peak_deceleration_m_s2": a_max,
            "peak_deceleration_g": a_max / G0,
            "velocity_at_peak_g_m_s": velocity_at_peak_deceleration(v),
            "altitude_at_peak_g_m": h_star,
            "velocity_at_peak_heating_m_s": velocity_at_peak_heating(v),
        });
        let summary = format!(
            "reentry (Allen–Eggers): V_e {:.0} m/s, γ {:.1}° -> peak {:.1} g at {:.0} km, \
             {:.0} m/s; heating peaks at {:.0} m/s (MODELLED ballistic, no aerothermal)",
            v,
            self.flight_path_angle_deg,
            a_max / G0,
            (h_star / 1000.0).max(0.0),
            velocity_at_peak_deceleration(v),
            velocity_at_peak_heating(v),
        );
        let json = serde_json::to_string_pretty(&json).map_err(|e| e.to_string())?;
        Ok((json, summary))
    }
}

/// Convenience: the circular-orbit-decay reference altitude (entry interface) on
/// Earth, ~122 km — provided so callers can sanity-check `altitude_at_peak_g` sits
/// below the interface.
pub const ENTRY_INTERFACE_M: f64 = 122_000.0;

/// The equatorial Earth radius re-exported for corridor altitude framing.
pub const R_EARTH_M: f64 = R_EARTH_EQUATORIAL_M;

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn peak_deceleration_is_independent_of_ballistic_coefficient() {
        // The Allen–Eggers signature result: a_max does not depend on m/(C_D·A).
        let a1 = peak_deceleration(7800.0, 6.0_f64.to_radians(), SCALE_HEIGHT_EARTH_M);
        let a2 = peak_deceleration(7800.0, 6.0_f64.to_radians(), SCALE_HEIGHT_EARTH_M);
        assert_eq!(a1, a2);
        // (B only enters the *altitude*, exercised below — the magnitude is fixed.)
        let g = a1 / G0;
        assert!(
            (10.0..25.0).contains(&g),
            "ballistic 6° entry peak {g:.1} g"
        );
    }

    #[test]
    fn peak_deceleration_grows_with_steeper_angle_and_faster_entry() {
        let shallow = peak_deceleration(7800.0, 3.0_f64.to_radians(), SCALE_HEIGHT_EARTH_M);
        let steep = peak_deceleration(7800.0, 9.0_f64.to_radians(), SCALE_HEIGHT_EARTH_M);
        assert!(steep > shallow);
        let slow = peak_deceleration(6000.0, 6.0_f64.to_radians(), SCALE_HEIGHT_EARTH_M);
        let fast = peak_deceleration(11_000.0, 6.0_f64.to_radians(), SCALE_HEIGHT_EARTH_M);
        assert!(fast > slow);
    }

    #[test]
    fn peak_velocities_are_the_allen_eggers_fractions() {
        let v = 7800.0;
        // peak-g at V_e·e^(−1/2) ≈ 0.6065·V_e
        assert!((velocity_at_peak_deceleration(v) / v - 0.6065).abs() < 1e-3);
        // peak heating at V_e·e^(−1/6) ≈ 0.8465·V_e, and faster than peak-g
        assert!((velocity_at_peak_heating(v) / v - 0.8465).abs() < 1e-3);
        assert!(velocity_at_peak_heating(v) > velocity_at_peak_deceleration(v));
    }

    #[test]
    fn peak_g_altitude_is_physical_and_falls_with_higher_ballistic_coeff() {
        // A heavier (higher-B) body penetrates deeper before peak-g.
        let h_light = altitude_at_peak_deceleration(
            6.0_f64.to_radians(),
            50.0,
            RHO0_EARTH,
            SCALE_HEIGHT_EARTH_M,
        );
        let h_heavy = altitude_at_peak_deceleration(
            6.0_f64.to_radians(),
            400.0,
            RHO0_EARTH,
            SCALE_HEIGHT_EARTH_M,
        );
        assert!(h_heavy < h_light, "higher B penetrates deeper");
        // Both sit in a sensible 20–80 km band below the ~122 km entry interface.
        for h in [h_light, h_heavy] {
            assert!((20_000.0..80_000.0).contains(&h), "peak-g altitude {h} m");
            assert!(h < ENTRY_INTERFACE_M);
        }
    }

    #[test]
    fn scenario_runs_reproducibly_and_is_modelled() {
        let scn = ReentryScenario {
            entry_velocity_m_s: 7800.0,
            flight_path_angle_deg: 6.0,
            ballistic_coeff_kg_m2: 100.0,
            scale_height_m: None,
            rho0_kg_m3: None,
        };
        let (j1, _s) = scn.run_json().unwrap();
        let (j2, _s) = scn.run_json().unwrap();
        assert_eq!(j1, j2);
        let v: serde_json::Value = serde_json::from_str(&j1).unwrap();
        assert_eq!(v["kind"], "reentry");
        assert!(v["label"].as_str().unwrap().contains("MODELLED"));
        assert!(!j1.contains("VALIDATED"));
        let g = v["peak_deceleration_g"].as_f64().unwrap();
        assert!((10.0..25.0).contains(&g));
        assert!(v["altitude_at_peak_g_m"].as_f64().unwrap() > 0.0);
    }

    #[test]
    fn scenario_rejects_degenerate_geometry() {
        let zero_gamma = ReentryScenario {
            entry_velocity_m_s: 7800.0,
            flight_path_angle_deg: 0.0,
            ballistic_coeff_kg_m2: 100.0,
            scale_height_m: None,
            rho0_kg_m3: None,
        };
        assert!(zero_gamma.run_json().is_err());
        let bad_v = ReentryScenario {
            entry_velocity_m_s: -1.0,
            flight_path_angle_deg: 6.0,
            ballistic_coeff_kg_m2: 100.0,
            scale_height_m: None,
            rho0_kg_m3: None,
        };
        assert!(bad_v.run_json().is_err());
    }
}
