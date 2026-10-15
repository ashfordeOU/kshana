// SPDX-License-Identifier: AGPL-3.0-only
//! Launch ascent losses: the `ascent-losses` scenario kind.
//!
//! A multi-stage vehicle flies a planar gravity turn over a non-rotating spherical Earth through
//! the US Standard Atmosphere 1976. It rises vertically, receives a pitch kick (the thrust is
//! tilted downrange from the velocity by `kick_angle` for `kick_duration_s`, starting at
//! `kick_altitude_m`), and then flies with thrust along the velocity. The state is radius `r`,
//! downrange angle `θ`, speed `v`, flight-path angle `γ` and mass `m`:
//!
//! ```text
//!   r' = v sinγ
//!   θ' = v cosγ / r
//!   v' = (T cosα − D)/m − g sinγ
//!   γ' = −T sinα / (m v) − (g/v − v/r) cosγ   (α tilts the thrust toward the horizon)
//!   m' = −T_vac / (Isp_vac g0)
//! ```
//!
//! with thrust `T = T_vac − p_a A_e` (back-pressure on the nozzle exit area),
//! drag `D = ½ ρ v² C_D A` and `g = μ/r²`. Fixed-step RK4 integrates the state and four loss
//! integrals together, and each step ends exactly at a stage burnout:
//!
//! ```text
//!   gravity  ∫ g sinγ dt        drag  ∫ D/m dt
//!   steering ∫ T (1 − cosα)/m dt   back-pressure  ∫ p_a A_e / m dt
//! ```
//!
//! Because `T cosα = T_vac − p_a A_e − T(1 − cosα)` and `∫ T_vac/m dt = Σ Isp g0 ln(m₀/m_f)`, the
//! identity `v_end − v_0 = Δv_ideal − (gravity + drag + steering + back-pressure)` holds exactly.
//! The run reports its residual as an integration check.
//!
//! HONEST SCOPE (MODELLED): planar, non-rotating Earth (no launch-site rotation bonus), constant
//! `C_D` and reference area for the whole stack, no coast phases, no guidance beyond the kick,
//! no throttling. Not a trajectory optimiser.

use crate::orbit::{MU_EARTH, R_EARTH_EQUATORIAL_M};
use crate::portable_math::PortableFloat;
use crate::reentry::{us76_density, us76_pressure, G0};
use serde::Deserialize;

/// One stage.
#[derive(Clone, Debug, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct Stage {
    /// Dry mass dropped at burnout (kg).
    pub dry_mass_kg: f64,
    /// Propellant mass (kg).
    pub propellant_kg: f64,
    /// Vacuum thrust (N).
    pub thrust_vac_n: f64,
    /// Vacuum specific impulse (s).
    pub isp_vac_s: f64,
    /// Nozzle exit area (m²), for the back-pressure loss.
    #[serde(default)]
    pub exit_area_m2: f64,
}

/// What the integration found.
#[derive(Clone, Debug, Default)]
pub struct AscentResult {
    pub end_altitude_m: f64,
    pub end_speed_m_s: f64,
    pub end_gamma_rad: f64,
    pub downrange_m: f64,
    pub ideal_dv_m_s: f64,
    pub gravity_loss_m_s: f64,
    pub drag_loss_m_s: f64,
    pub steering_loss_m_s: f64,
    pub back_pressure_loss_m_s: f64,
    /// `(v_end − v0) − (Δv_ideal − losses)`, m/s; zero up to integration error.
    pub identity_residual_m_s: f64,
    pub max_q_pa: f64,
    pub max_q_altitude_m: f64,
    pub max_accel_g: f64,
    pub burn_time_s: f64,
    /// Altitude and speed at each burnout.
    pub stage_burnouts: Vec<(f64, f64)>,
    /// `true` when the vehicle fell back below the pad before burnout.
    pub crashed: bool,
}

/// The vehicle and its pitch programme.
#[derive(Clone, Debug)]
pub struct Vehicle {
    pub stages: Vec<Stage>,
    pub payload_kg: f64,
    pub drag_coefficient: f64,
    pub reference_area_m2: f64,
    pub kick_altitude_m: f64,
    pub kick_angle_rad: f64,
    pub kick_duration_s: f64,
}

/// Integrate the ascent with step `dt`.
pub fn simulate_ascent(v: &Vehicle, dt: f64) -> AscentResult {
    let re = R_EARTH_EQUATORIAL_M;
    let mut mass: f64 = v.payload_kg
        + v.stages
            .iter()
            .map(|s| s.dry_mass_kg + s.propellant_kg)
            .sum::<f64>();
    // State: r, θ, v, γ, m, Lg, Ld, Ls, Lbp.
    let mut y = [
        re,
        0.0,
        0.0,
        std::f64::consts::FRAC_PI_2,
        mass,
        0.0,
        0.0,
        0.0,
        0.0,
    ];
    let mut res = AscentResult::default();
    let mut t = 0.0;
    let mut kick_start: Option<f64> = None;
    for st in &v.stages {
        y[4] = mass;
        let mdot = st.thrust_vac_n / (st.isp_vac_s * G0);
        let t_burn = st.propellant_kg / mdot;
        res.ideal_dv_m_s += st.isp_vac_s * G0 * (mass / (mass - st.propellant_kg)).pln();
        let n = (t_burn / dt).ceil().max(1.0) as usize;
        let h = t_burn / n as f64;
        for _ in 0..n {
            let alt0 = y[0] - re;
            if kick_start.is_none() && alt0 >= v.kick_altitude_m {
                kick_start = Some(t);
            }
            let tilt = match kick_start {
                Some(t0) if t - t0 < v.kick_duration_s => v.kick_angle_rad,
                _ => 0.0,
            };
            let f = |s: &[f64; 9]| -> [f64; 9] {
                let (r, _th, vel, gam, m) = (s[0], s[1], s[2], s[3], s[4]);
                let alt = r - re;
                let p_a = us76_pressure(alt.max(0.0));
                let thrust = (st.thrust_vac_n - p_a * st.exit_area_m2).max(0.0);
                let rho = us76_density(alt.max(0.0));
                let drag = 0.5 * rho * vel * vel * v.drag_coefficient * v.reference_area_m2;
                let g = MU_EARTH / (r * r);
                let (sg, cg) = gam.psin_cos();
                let (sa, ca) = tilt.psin_cos();
                let v_safe = vel.max(1.0);
                [
                    vel * sg,
                    vel * cg / r,
                    (thrust * ca - drag) / m - g * sg,
                    // The kick tilts the thrust below the velocity, toward the horizon.
                    -thrust * sa / (m * v_safe) - (g / v_safe - vel / r) * cg,
                    -mdot,
                    g * sg,
                    drag / m,
                    thrust * (1.0 - ca) / m,
                    p_a * st.exit_area_m2 / m,
                ]
            };
            // Peaks at the step start.
            let alt = y[0] - re;
            let q = 0.5 * us76_density(alt.max(0.0)) * y[2] * y[2];
            if q > res.max_q_pa {
                res.max_q_pa = q;
                res.max_q_altitude_m = alt;
            }
            y = super::rk4_step(&y, h, &f);
            t += h;
            let thrust = st.thrust_vac_n - us76_pressure((y[0] - re).max(0.0)) * st.exit_area_m2;
            res.max_accel_g = res.max_accel_g.max(thrust / y[4] / G0);
            if y[0] < re - 1.0 {
                res.crashed = true;
            }
        }
        res.stage_burnouts.push((y[0] - re, y[2]));
        mass = y[4] - st.dry_mass_kg;
    }
    res.end_altitude_m = y[0] - re;
    res.end_speed_m_s = y[2];
    res.end_gamma_rad = y[3];
    res.downrange_m = re * y[1];
    res.gravity_loss_m_s = y[5];
    res.drag_loss_m_s = y[6];
    res.steering_loss_m_s = y[7];
    res.back_pressure_loss_m_s = y[8];
    res.burn_time_s = t;
    let losses = y[5] + y[6] + y[7] + y[8];
    res.identity_residual_m_s = y[2] - (res.ideal_dv_m_s - losses);
    res
}

fn d_payload() -> f64 {
    10_000.0
}
fn d_cd() -> f64 {
    0.3
}
fn d_area() -> f64 {
    10.5
}
fn d_kick_alt() -> f64 {
    1_000.0
}
fn d_kick_deg() -> f64 {
    3.0
}
fn d_kick_dur() -> f64 {
    10.0
}
fn d_step() -> f64 {
    0.1
}
fn d_stages() -> Vec<Stage> {
    vec![
        Stage {
            dry_mass_kg: 25_000.0,
            propellant_kg: 400_000.0,
            thrust_vac_n: 7.6e6,
            isp_vac_s: 311.0,
            exit_area_m2: 6.0,
        },
        Stage {
            dry_mass_kg: 4_000.0,
            propellant_kg: 100_000.0,
            thrust_vac_n: 0.98e6,
            isp_vac_s: 348.0,
            exit_area_m2: 0.0,
        },
    ]
}

/// The `ascent-losses` scenario. Every field has an illustrative two-stage default.
#[derive(Clone, Debug, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct AscentScenario {
    /// `ascent-losses` when given.
    #[serde(default)]
    pub kind: Option<String>,
    /// The stages, first to last.
    #[serde(default = "d_stages")]
    pub stages: Vec<Stage>,
    /// Payload mass (kg).
    #[serde(default = "d_payload")]
    pub payload_kg: f64,
    /// Drag coefficient of the stack.
    #[serde(default = "d_cd")]
    pub drag_coefficient: f64,
    /// Reference area (m²).
    #[serde(default = "d_area")]
    pub reference_area_m2: f64,
    /// Altitude at which the pitch kick starts (m).
    #[serde(default = "d_kick_alt")]
    pub kick_altitude_m: f64,
    /// Kick angle between thrust and velocity (deg).
    #[serde(default = "d_kick_deg")]
    pub kick_angle_deg: f64,
    /// Kick duration (s).
    #[serde(default = "d_kick_dur")]
    pub kick_duration_s: f64,
    /// RK4 step (s).
    #[serde(default = "d_step")]
    pub step_s: f64,
}

impl Default for AscentScenario {
    fn default() -> Self {
        toml::from_str("").expect("all fields defaulted")
    }
}

const UNITS: &[crate::field_schema::FieldUnit] = {
    use crate::field_schema::{FieldUnit, ProvenanceClass::*};
    &[
        FieldUnit {
            path: "inputs.payload_kg",
            unit: "kg",
            provenance: Input,
            definition: "payload mass",
        },
        FieldUnit {
            path: "inputs.drag_coefficient",
            unit: "1",
            provenance: ModelledInput,
            definition: "constant drag coefficient of the stack",
        },
        FieldUnit {
            path: "inputs.reference_area_m2",
            unit: "m^2",
            provenance: Input,
            definition: "drag reference area",
        },
        FieldUnit {
            path: "inputs.kick_altitude_m",
            unit: "m",
            provenance: Input,
            definition: "altitude at which the pitch kick starts",
        },
        FieldUnit {
            path: "inputs.kick_angle_deg",
            unit: "deg",
            provenance: Input,
            definition: "angle between thrust and velocity during the kick",
        },
        FieldUnit {
            path: "inputs.kick_duration_s",
            unit: "s",
            provenance: Input,
            definition: "kick duration",
        },
        FieldUnit {
            path: "inputs.step_s",
            unit: "s",
            provenance: Input,
            definition: "RK4 step (shortened so each step ends at a burnout)",
        },
        FieldUnit {
            path: "inputs.stages[].dry_mass_kg",
            unit: "kg",
            provenance: Input,
            definition: "stage dry mass dropped at burnout",
        },
        FieldUnit {
            path: "inputs.stages[].propellant_kg",
            unit: "kg",
            provenance: Input,
            definition: "stage propellant mass",
        },
        FieldUnit {
            path: "inputs.stages[].thrust_vac_n",
            unit: "N",
            provenance: Input,
            definition: "stage vacuum thrust",
        },
        FieldUnit {
            path: "inputs.stages[].isp_vac_s",
            unit: "s",
            provenance: Input,
            definition: "stage vacuum specific impulse",
        },
        FieldUnit {
            path: "inputs.stages[].exit_area_m2",
            unit: "m^2",
            provenance: Input,
            definition: "nozzle exit area for the back-pressure thrust loss",
        },
        FieldUnit {
            path: "liftoff_mass_kg",
            unit: "kg",
            provenance: Computed,
            definition: "total mass at lift-off",
        },
        FieldUnit {
            path: "liftoff_thrust_to_weight",
            unit: "1",
            provenance: Computed,
            definition: "sea-level thrust over lift-off weight",
        },
        FieldUnit {
            path: "ideal_dv_m_s",
            unit: "m/s",
            provenance: ClosedForm,
            definition: "sum of Isp_vac g0 ln(m0/mf) over the stages",
        },
        FieldUnit {
            path: "losses_m_s.gravity",
            unit: "m/s",
            provenance: Computed,
            definition: "integral of g sin(gamma)",
        },
        FieldUnit {
            path: "losses_m_s.drag",
            unit: "m/s",
            provenance: Computed,
            definition: "integral of D/m",
        },
        FieldUnit {
            path: "losses_m_s.steering",
            unit: "m/s",
            provenance: Computed,
            definition: "integral of T (1 - cos alpha)/m",
        },
        FieldUnit {
            path: "losses_m_s.back_pressure",
            unit: "m/s",
            provenance: Computed,
            definition: "integral of p_a A_e / m",
        },
        FieldUnit {
            path: "losses_m_s.total",
            unit: "m/s",
            provenance: Computed,
            definition: "sum of the four losses",
        },
        FieldUnit {
            path: "identity_residual_m_s",
            unit: "m/s",
            provenance: InternalConsistency,
            definition: "(v_end - v0) - (ideal dv - total losses); zero up to integration error",
        },
        FieldUnit {
            path: "end.altitude_m",
            unit: "m",
            provenance: Computed,
            definition: "altitude at final burnout",
        },
        FieldUnit {
            path: "end.speed_m_s",
            unit: "m/s",
            provenance: Computed,
            definition: "speed (non-rotating Earth, so inertial) at final burnout",
        },
        FieldUnit {
            path: "end.flight_path_angle_deg",
            unit: "deg",
            provenance: Computed,
            definition: "flight-path angle at final burnout",
        },
        FieldUnit {
            path: "end.downrange_m",
            unit: "m",
            provenance: Computed,
            definition: "great-circle downrange at final burnout",
        },
        FieldUnit {
            path: "end.circular_speed_m_s",
            unit: "m/s",
            provenance: ClosedForm,
            definition: "circular orbital speed at the burnout altitude, for comparison",
        },
        FieldUnit {
            path: "max_q_pa",
            unit: "Pa",
            provenance: Computed,
            definition: "peak dynamic pressure",
        },
        FieldUnit {
            path: "max_q_altitude_m",
            unit: "m",
            provenance: Computed,
            definition: "altitude of peak dynamic pressure",
        },
        FieldUnit {
            path: "max_accel_g",
            unit: "g0",
            provenance: Computed,
            definition: "peak thrust acceleration in standard gravities",
        },
        FieldUnit {
            path: "burn_time_s",
            unit: "s",
            provenance: Computed,
            definition: "total burn time",
        },
        FieldUnit {
            path: "stage_burnouts[].altitude_m",
            unit: "m",
            provenance: Computed,
            definition: "altitude at the stage's burnout",
        },
        FieldUnit {
            path: "stage_burnouts[].speed_m_s",
            unit: "m/s",
            provenance: Computed,
            definition: "speed at the stage's burnout",
        },
    ]
};

impl AscentScenario {
    fn vehicle(&self) -> Result<Vehicle, String> {
        let pos = |v: f64, n: &str| {
            if v.is_finite() && v > 0.0 {
                Ok(())
            } else {
                Err(format!("{n} must be finite and positive"))
            }
        };
        if self.stages.is_empty() || self.stages.len() > 6 {
            return Err("between one and six stages are required".into());
        }
        for (i, s) in self.stages.iter().enumerate() {
            pos(s.propellant_kg, &format!("stages[{i}].propellant_kg"))?;
            pos(s.thrust_vac_n, &format!("stages[{i}].thrust_vac_n"))?;
            pos(s.isp_vac_s, &format!("stages[{i}].isp_vac_s"))?;
            if !(s.dry_mass_kg.is_finite() && s.dry_mass_kg >= 0.0) {
                return Err(format!(
                    "stages[{i}].dry_mass_kg must be finite and non-negative"
                ));
            }
            if !(s.exit_area_m2.is_finite() && s.exit_area_m2 >= 0.0) {
                return Err(format!(
                    "stages[{i}].exit_area_m2 must be finite and non-negative"
                ));
            }
        }
        if !(self.payload_kg.is_finite() && self.payload_kg >= 0.0) {
            return Err("payload_kg must be finite and non-negative".into());
        }
        pos(self.drag_coefficient, "drag_coefficient")?;
        pos(self.reference_area_m2, "reference_area_m2")?;
        pos(self.step_s, "step_s")?;
        if !(self.kick_altitude_m.is_finite() && self.kick_altitude_m >= 0.0) {
            return Err("kick_altitude_m must be finite and non-negative".into());
        }
        if !(self.kick_angle_deg.is_finite() && (0.0..45.0).contains(&self.kick_angle_deg)) {
            return Err("kick_angle_deg must be in [0, 45)".into());
        }
        if !(self.kick_duration_s.is_finite() && self.kick_duration_s >= 0.0) {
            return Err("kick_duration_s must be finite and non-negative".into());
        }
        Ok(Vehicle {
            stages: self.stages.clone(),
            payload_kg: self.payload_kg,
            drag_coefficient: self.drag_coefficient,
            reference_area_m2: self.reference_area_m2,
            kick_altitude_m: self.kick_altitude_m,
            kick_angle_rad: self.kick_angle_deg.to_radians(),
            kick_duration_s: self.kick_duration_s,
        })
    }

    /// Run the scenario, returning `(json, summary)`.
    pub fn run_json(&self) -> Result<(String, String), String> {
        let v = self.vehicle()?;
        let m0: f64 = v.payload_kg
            + v.stages
                .iter()
                .map(|s| s.dry_mass_kg + s.propellant_kg)
                .sum::<f64>();
        let s0 = &v.stages[0];
        let t0 = s0.thrust_vac_n - us76_pressure(0.0) * s0.exit_area_m2;
        let tw = t0 / (m0 * G0);
        if tw <= 1.0 {
            return Err(format!("lift-off thrust-to-weight {tw:.3} must exceed 1"));
        }
        let r = simulate_ascent(&v, self.step_s);
        let losses =
            r.gravity_loss_m_s + r.drag_loss_m_s + r.steering_loss_m_s + r.back_pressure_loss_m_s;
        let v_circ = (MU_EARTH / (R_EARTH_EQUATORIAL_M + r.end_altitude_m)).sqrt();
        let json = serde_json::json!({
            "kind": "ascent-losses",
            "label": "MODELLED — planar gravity-turn ascent of a multi-stage vehicle over a non-rotating spherical Earth through US76, with gravity, drag, steering and back-pressure losses integrated and the ideal-dv-minus-losses identity checked; constant C_D, no rotation, no coast, no guidance beyond the pitch kick",
            "units": crate::field_schema::units_block(UNITS),
            "inputs": {
                "payload_kg": self.payload_kg,
                "drag_coefficient": self.drag_coefficient,
                "reference_area_m2": self.reference_area_m2,
                "kick_altitude_m": self.kick_altitude_m,
                "kick_angle_deg": self.kick_angle_deg,
                "kick_duration_s": self.kick_duration_s,
                "step_s": self.step_s,
                "stages": self.stages.iter().map(|s| serde_json::json!({
                    "dry_mass_kg": s.dry_mass_kg,
                    "propellant_kg": s.propellant_kg,
                    "thrust_vac_n": s.thrust_vac_n,
                    "isp_vac_s": s.isp_vac_s,
                    "exit_area_m2": s.exit_area_m2,
                })).collect::<Vec<_>>(),
            },
            "liftoff_mass_kg": m0,
            "liftoff_thrust_to_weight": tw,
            "ideal_dv_m_s": r.ideal_dv_m_s,
            "losses_m_s": {
                "gravity": r.gravity_loss_m_s,
                "drag": r.drag_loss_m_s,
                "steering": r.steering_loss_m_s,
                "back_pressure": r.back_pressure_loss_m_s,
                "total": losses,
            },
            "identity_residual_m_s": r.identity_residual_m_s,
            "end": {
                "altitude_m": r.end_altitude_m,
                "speed_m_s": r.end_speed_m_s,
                "flight_path_angle_deg": r.end_gamma_rad.to_degrees(),
                "downrange_m": r.downrange_m,
                "circular_speed_m_s": v_circ,
            },
            "max_q_pa": r.max_q_pa,
            "max_q_altitude_m": r.max_q_altitude_m,
            "max_accel_g": r.max_accel_g,
            "burn_time_s": r.burn_time_s,
            "stage_burnouts": r.stage_burnouts.iter().map(|(h, s)| serde_json::json!({"altitude_m": h, "speed_m_s": s})).collect::<Vec<_>>(),
            "crashed": r.crashed,
        });
        let summary = format!(
            "ascent-losses: ideal dv {:.0} m/s, losses {:.0} m/s (gravity {:.0}, drag {:.0}, steering {:.0}, back-pressure {:.0}); burnout {:.0} km at {:.0} m/s, gamma {:.1} deg; max-Q {:.1} kPa (MODELLED)",
            r.ideal_dv_m_s,
            losses,
            r.gravity_loss_m_s,
            r.drag_loss_m_s,
            r.steering_loss_m_s,
            r.back_pressure_loss_m_s,
            r.end_altitude_m / 1000.0,
            r.end_speed_m_s,
            r.end_gamma_rad.to_degrees(),
            r.max_q_pa / 1000.0
        );
        let text = serde_json::to_string_pretty(&json).map_err(|e| e.to_string())?;
        Ok((text, summary))
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn the_loss_identity_holds_to_integration_error() {
        let s = AscentScenario::default();
        let (j, _) = s.run_json().unwrap();
        let v: serde_json::Value = serde_json::from_str(&j).unwrap();
        let res = v["identity_residual_m_s"].as_f64().unwrap();
        assert!(res.abs() < 1e-6, "identity residual {res} m/s");
        assert_eq!(v["crashed"], false);
        assert!(v["losses_m_s"]["gravity"].as_f64().unwrap() > 0.0);
        assert!(v["losses_m_s"]["drag"].as_f64().unwrap() > 0.0);
        assert!(v["losses_m_s"]["steering"].as_f64().unwrap() > 0.0);
        assert!(v["losses_m_s"]["back_pressure"].as_f64().unwrap() > 0.0);
    }

    #[test]
    fn vertical_vacuum_burn_has_only_gravity_loss_and_stays_vertical() {
        // No kick, no drag area, no exit area: the vehicle climbs straight up and the only loss
        // is gravity. Over a short burn near the surface it is close to g0·t (gravity falls
        // slightly with height).
        let v = Vehicle {
            stages: vec![Stage {
                dry_mass_kg: 100.0,
                propellant_kg: 900.0,
                thrust_vac_n: 30_000.0,
                isp_vac_s: 300.0,
                exit_area_m2: 0.0,
            }],
            payload_kg: 0.0,
            drag_coefficient: 1.0,
            reference_area_m2: 1e-12,
            kick_altitude_m: 1e9,
            kick_angle_rad: 0.0,
            kick_duration_s: 0.0,
        };
        let r = simulate_ascent(&v, 0.05);
        assert!((r.end_gamma_rad - std::f64::consts::FRAC_PI_2).abs() < 1e-12);
        assert_eq!(r.steering_loss_m_s, 0.0);
        assert_eq!(r.back_pressure_loss_m_s, 0.0);
        assert!(r.drag_loss_m_s < 1e-6);
        let g_surface = MU_EARTH / (R_EARTH_EQUATORIAL_M * R_EARTH_EQUATORIAL_M);
        assert!(r.gravity_loss_m_s < g_surface * r.burn_time_s);
        assert!(r.gravity_loss_m_s > 0.95 * g_surface * r.burn_time_s);
        // Tsiolkovsky.
        let want = 300.0 * G0 * (1000.0_f64 / 100.0).pln();
        assert!((r.ideal_dv_m_s - want).abs() < 1e-9);
        assert!((r.end_speed_m_s - (want - r.gravity_loss_m_s)).abs() < 1e-6);
    }

    #[test]
    fn us76_pressure_has_the_standard_values() {
        assert!((us76_pressure(0.0) - 101_325.0).abs() < 1e-6);
        // The standard's 11 km tropopause pressure, 22 632 Pa (geopotential 11 km).
        let h11 = 11_000.0 * 6_356_766.0 / (6_356_766.0 - 11_000.0);
        assert!(
            (us76_pressure(h11) - 22_632.06).abs() < 0.5,
            "{}",
            us76_pressure(h11)
        );
        assert_eq!(us76_pressure(90_000.0), 0.0);
    }

    #[test]
    fn a_larger_kick_lowers_burnout_flight_path_angle() {
        let mut a = AscentScenario::default();
        let (ja, _) = a.run_json().unwrap();
        a.kick_angle_deg = 5.0;
        let (jb, _) = a.run_json().unwrap();
        let g = |j: &str| {
            serde_json::from_str::<serde_json::Value>(j).unwrap()["end"]["flight_path_angle_deg"]
                .as_f64()
                .unwrap()
        };
        assert!(g(&jb) < g(&ja));
    }

    #[test]
    fn bad_inputs_are_refused() {
        let s = AscentScenario {
            stages: vec![],
            ..Default::default()
        };
        assert!(s.run_json().is_err());
        let s = AscentScenario {
            payload_kg: 1e9,
            ..Default::default()
        };
        assert!(s.run_json().is_err(), "thrust-to-weight below 1");
    }
}
