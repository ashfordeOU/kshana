// SPDX-License-Identifier: AGPL-3.0-only
//! 3-DOF attitude & pointing error budget: a scalar, pre-hardware AOCS/GNC
//! complement to high-fidelity tools (Basilisk, 42) — the environmental
//! gravity-gradient disturbance torque and a root-sum-square pointing-error budget
//! over the contributing error sources, producing a single pointing figure of
//! merit a systems engineer brackets before committing to a control design.
//!
//! Gravity-gradient torque on a rigid body in a central field is
//! `T = (3/2)·(μ/R³)·|I_max − I_min|·sin(2θ)`, maximised at `θ = 45°` between the
//! minimum-inertia axis and the local vertical: `T_max = (3/2)·(μ/R³)·ΔI`. The
//! pointing budget combines independent 1σ error sources in quadrature
//! (`σ_total = √Σσ_i²`).
//!
//! HONEST SCOPE (MODELLED): a scalar error budget, not a control-loop or 6-DoF
//! simulation. The gravity-gradient torque is the steady environmental
//! disturbance; mapping it to a pointing error requires a control stiffness the
//! caller owns, so it is reported as a torque, and the pointing budget is the
//! quadrature sum of the 1σ contributors the caller supplies (sensor noise,
//! reaction-wheel jitter, thermal distortion, alignment, …). No actuator dynamics,
//! flexible modes, slew or momentum-management modelling.

use crate::orbit::{MU_EARTH, R_EARTH_EQUATORIAL_M};
use serde::Deserialize;

/// Gravity-gradient coefficient `μ/R³` (s⁻²) at geometric `altitude_m`.
pub fn mu_over_r3(altitude_m: f64) -> f64 {
    let r = R_EARTH_EQUATORIAL_M + altitude_m;
    MU_EARTH / (r * r * r)
}

/// Maximum gravity-gradient disturbance torque (N·m) at `altitude_m` for a body
/// with principal-inertia spread `delta_inertia_kg_m2 = |I_max − I_min|`:
/// `(3/2)·(μ/R³)·ΔI` (the value at the worst-case 45° attitude).
pub fn gravity_gradient_torque_max(altitude_m: f64, delta_inertia_kg_m2: f64) -> f64 {
    1.5 * mu_over_r3(altitude_m) * delta_inertia_kg_m2.abs()
}

/// Root-sum-square of independent 1σ error contributors (same units in → out).
pub fn rss(values: &[f64]) -> f64 {
    values.iter().map(|v| v * v).sum::<f64>().sqrt()
}

/// One named 1σ pointing-error contributor.
#[derive(Clone, Debug, Deserialize)]
pub struct PointingContributor {
    pub name: String,
    pub sigma_arcsec: f64,
}

fn ab_default_alt() -> f64 {
    600.0
}
fn ab_default_imax() -> f64 {
    100.0
}
fn ab_default_imin() -> f64 {
    60.0
}
fn ab_default_contributors() -> Vec<PointingContributor> {
    vec![
        PointingContributor {
            name: "star_tracker_noise".into(),
            sigma_arcsec: 5.0,
        },
        PointingContributor {
            name: "reaction_wheel_jitter".into(),
            sigma_arcsec: 8.0,
        },
        PointingContributor {
            name: "thermal_distortion".into(),
            sigma_arcsec: 4.0,
        },
        PointingContributor {
            name: "alignment".into(),
            sigma_arcsec: 3.0,
        },
    ]
}

/// The `attitude-budget` scenario: the gravity-gradient disturbance torque and the
/// RSS pointing-error budget (with per-contributor breakdown and the dominant
/// term) for an orbit altitude, body inertia spread and a set of 1σ contributors.
#[derive(Deserialize)]
pub struct AttitudeBudgetScenario {
    /// Circular-orbit altitude (km).
    #[serde(default = "ab_default_alt")]
    pub altitude_km: f64,
    /// Maximum principal moment of inertia (kg·m²).
    #[serde(default = "ab_default_imax")]
    pub i_max_kg_m2: f64,
    /// Minimum principal moment of inertia (kg·m²).
    #[serde(default = "ab_default_imin")]
    pub i_min_kg_m2: f64,
    /// 1σ pointing-error contributors (arcsec).
    #[serde(default = "ab_default_contributors")]
    pub contributors: Vec<PointingContributor>,
}

impl AttitudeBudgetScenario {
    /// Run the scenario, returning `(json, summary)`.
    pub fn run_json(&self) -> Result<(String, String), String> {
        if !self.altitude_km.is_finite() || self.altitude_km <= 0.0 {
            return Err("altitude_km must be finite and positive".to_string());
        }
        if !self.i_max_kg_m2.is_finite()
            || !self.i_min_kg_m2.is_finite()
            || self.i_max_kg_m2 <= 0.0
            || self.i_min_kg_m2 <= 0.0
        {
            return Err("inertias must be finite and positive".to_string());
        }
        if self.i_max_kg_m2 < self.i_min_kg_m2 {
            return Err("i_max_kg_m2 must be >= i_min_kg_m2".to_string());
        }
        if self.contributors.is_empty() {
            return Err("at least one pointing contributor is required".to_string());
        }
        for c in &self.contributors {
            if !c.sigma_arcsec.is_finite() || c.sigma_arcsec < 0.0 {
                return Err(format!(
                    "contributor '{}' sigma must be finite and >= 0",
                    c.name
                ));
            }
        }
        let alt_m = self.altitude_km * 1000.0;
        let delta_i = self.i_max_kg_m2 - self.i_min_kg_m2;
        let t_gg = gravity_gradient_torque_max(alt_m, delta_i);
        let sigmas: Vec<f64> = self.contributors.iter().map(|c| c.sigma_arcsec).collect();
        let total = rss(&sigmas);
        let dominant = self
            .contributors
            .iter()
            .max_by(|a, b| a.sigma_arcsec.total_cmp(&b.sigma_arcsec))
            .map(|c| c.name.clone())
            .unwrap_or_default();

        let json = serde_json::json!({
            "kind": "attitude-budget",
            "label": "MODELLED — scalar 3-DOF AOCS error budget: gravity-gradient \
                      worst-case disturbance torque + RSS pointing budget; NOT a \
                      control-loop / 6-DoF / flexible-mode simulation (a pre-hardware \
                      complement to Basilisk/42, not a replacement)",
            "altitude_km": self.altitude_km,
            "delta_inertia_kg_m2": delta_i,
            "gravity_gradient_torque_max_nm": t_gg,
            "total_pointing_error_arcsec": total,
            "dominant_contributor": dominant,
            "contributors": self.contributors.iter().map(|c| serde_json::json!({
                "name": c.name,
                "sigma_arcsec": c.sigma_arcsec,
                "variance_fraction": if total > 0.0 { (c.sigma_arcsec * c.sigma_arcsec) / (total * total) } else { 0.0 },
            })).collect::<Vec<_>>(),
        });
        let summary = format!(
            "attitude-budget: {:.0} km, ΔI {:.0} kg·m² -> GG torque {:.2e} N·m; \
             pointing {:.1}\" RSS (dominant: {}) (MODELLED scalar budget)",
            self.altitude_km, delta_i, t_gg, total, dominant
        );
        let json = serde_json::to_string_pretty(&json).map_err(|e| e.to_string())?;
        Ok((json, summary))
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn gravity_gradient_torque_has_the_right_magnitude() {
        // 700 km, ΔI = 10 kg·m²: μ/R³ ≈ 1.12e-6 s⁻² -> T ≈ 1.5·1.12e-6·10 ≈ 1.69e-5 N·m.
        let t = gravity_gradient_torque_max(700_000.0, 10.0);
        assert!((1.5e-5..1.9e-5).contains(&t), "GG torque {t} N·m");
    }

    #[test]
    fn gravity_gradient_vanishes_for_a_symmetric_body_and_grows_lower_down() {
        assert_eq!(gravity_gradient_torque_max(600_000.0, 0.0), 0.0);
        // Stronger gradient closer to Earth.
        assert!(
            gravity_gradient_torque_max(400_000.0, 10.0)
                > gravity_gradient_torque_max(800_000.0, 10.0)
        );
        // Linear in ΔI.
        let a = gravity_gradient_torque_max(600_000.0, 5.0);
        let b = gravity_gradient_torque_max(600_000.0, 10.0);
        assert!((b - 2.0 * a).abs() < 1e-18);
    }

    #[test]
    fn rss_is_the_quadrature_sum() {
        assert!((rss(&[3.0, 4.0]) - 5.0).abs() < 1e-12);
        assert_eq!(rss(&[]), 0.0);
        // Adding a source can only grow (or hold) the budget, never shrink it.
        assert!(rss(&[5.0, 8.0, 4.0]) >= 8.0);
    }

    #[test]
    fn scenario_runs_reproducibly_and_is_modelled() {
        let scn = AttitudeBudgetScenario {
            altitude_km: 600.0,
            i_max_kg_m2: 100.0,
            i_min_kg_m2: 60.0,
            contributors: ab_default_contributors(),
        };
        let (j1, _s) = scn.run_json().unwrap();
        let (j2, _s) = scn.run_json().unwrap();
        assert_eq!(j1, j2);
        let v: serde_json::Value = serde_json::from_str(&j1).unwrap();
        assert_eq!(v["kind"], "attitude-budget");
        assert!(v["label"].as_str().unwrap().contains("MODELLED"));
        assert!(!j1.contains("VALIDATED"));
        // RSS of [5,8,4,3] = sqrt(25+64+16+9) = sqrt(114) ≈ 10.68".
        assert!(
            (v["total_pointing_error_arcsec"].as_f64().unwrap() - 114.0_f64.sqrt()).abs() < 1e-6
        );
        // Reaction-wheel jitter (8") dominates this budget.
        assert_eq!(v["dominant_contributor"], "reaction_wheel_jitter");
        // Variance fractions sum to 1.
        let frac: f64 = v["contributors"]
            .as_array()
            .unwrap()
            .iter()
            .map(|c| c["variance_fraction"].as_f64().unwrap())
            .sum();
        assert!((frac - 1.0).abs() < 1e-9);
    }

    #[test]
    fn scenario_rejects_bad_inputs() {
        let bad_inertia = AttitudeBudgetScenario {
            altitude_km: 600.0,
            i_max_kg_m2: 50.0,
            i_min_kg_m2: 60.0, // i_max < i_min
            contributors: ab_default_contributors(),
        };
        assert!(bad_inertia.run_json().is_err());
        let no_contrib = AttitudeBudgetScenario {
            altitude_km: 600.0,
            i_max_kg_m2: 100.0,
            i_min_kg_m2: 60.0,
            contributors: vec![],
        };
        assert!(no_contrib.run_json().is_err());
    }
}
