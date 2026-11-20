// SPDX-License-Identifier: AGPL-3.0-only
//! Dead-reckoning coast budget for an airframe and sensor class, and a consumer-quadcopter
//! behaviour model under GNSS loss. MODELLED.
//!
//! **Free inertial**: the position error of [`crate::inertial::coast::CoastModel`] for the IMU
//! grade at the cruise speed (root-sum-square of its contributions, Schuler and Earth-rate
//! coupling included), root-sum-squared with the initial velocity error `v0·t` the receiver left
//! at the moment of loss.
//!
//! **Velocity-aided dead reckoning** (optical flow, airspeed and heading, wheel odometry): with
//! travelled distance `d = v·t`, heading error `ψ`, scale error `s`, an unknown constant velocity
//! error `w` (the wind estimate for airspeed dead reckoning) and a velocity noise of standard
//! deviation `σ_v` and correlation time `τ`,
//!
//! ```text
//! σ(t)² = (ψ·d)² + (s·d)² + (w·t)² + 2·σ_v²·τ·t
//! ```
//!
//! whose threshold crossing has the closed form `t = (−D + √(D² + 4·K²·T²)) / (2·K²)` with
//! `K² = (ψ²+s²)·v² + w²` and `D = 2·σ_v²·τ`; [`plan`] reports both the bisected and the closed
//! form so the agreement is visible. The presets are class bands, not a datasheet of any product.

use serde::{Deserialize, Serialize};
use serde_json::{json, Value};

use crate::inertial::coast::{first_crossing_s, CoastModel, Combination, ImuGrade};
use crate::quantum_trade::PositionDrift;

/// Velocity-aided dead-reckoning error terms.
#[derive(Clone, Debug, PartialEq, Serialize, Deserialize)]
#[serde(default)]
pub struct Aiding {
    /// `none`, `optical-flow`, `airspeed-heading` or `wheel-odometry` (a label only).
    pub kind: String,
    /// Heading error ψ, degrees.
    pub heading_err_deg: f64,
    /// Scale error s, fraction.
    pub scale_err: f64,
    /// Constant velocity error w, m/s.
    pub velocity_bias_m_s: f64,
    /// Velocity noise σ_v, m/s.
    pub velocity_noise_m_s: f64,
    /// Velocity noise correlation time τ, s.
    pub noise_corr_s: f64,
}

impl Default for Aiding {
    fn default() -> Self {
        Aiding {
            kind: "none".into(),
            heading_err_deg: 0.0,
            scale_err: 0.0,
            velocity_bias_m_s: 0.0,
            velocity_noise_m_s: 0.0,
            noise_corr_s: 1.0,
        }
    }
}

/// A coast-budget request.
#[derive(Clone, Debug, PartialEq, Serialize, Deserialize)]
#[serde(default)]
pub struct BudgetSpec {
    /// Airframe class label.
    pub airframe: String,
    /// Cruise ground speed, m/s.
    pub speed_m_s: f64,
    /// IMU grade (`navigation`, `tactical`, `industrial`, `consumer`).
    pub imu_grade: String,
    /// Velocity error at GNSS loss, m/s.
    pub initial_velocity_err_m_s: f64,
    /// Latitude of the error model, degrees.
    pub latitude_deg: f64,
    /// Position-error thresholds, metres.
    pub thresholds_m: Vec<f64>,
    /// Velocity aiding, when the airframe has one.
    pub aiding: Option<Aiding>,
    /// A GNSS-denied leg to check, metres (optional).
    pub denied_leg_m: Option<f64>,
    /// The error the leg may end with, metres (optional).
    pub allowance_m: Option<f64>,
}

impl Default for BudgetSpec {
    fn default() -> Self {
        BudgetSpec {
            airframe: "custom".into(),
            speed_m_s: 10.0,
            imu_grade: "consumer".into(),
            initial_velocity_err_m_s: 0.1,
            latitude_deg: 45.0,
            thresholds_m: vec![10.0, 50.0, 100.0],
            aiding: None,
            denied_leg_m: None,
            allowance_m: None,
        }
    }
}

impl BudgetSpec {
    /// Read a request from JSON (missing keys take the defaults).
    pub fn from_json(text: &str) -> Result<Self, String> {
        serde_json::from_str(text).map_err(|e| e.to_string())
    }

    /// The class presets: `multirotor`, `fixed-wing`, `vtol`, `ground-robot`.
    pub fn preset(name: &str) -> Result<Self, String> {
        let aid = |kind: &str, psi: f64, s: f64, w: f64, sv: f64, tau: f64| Aiding {
            kind: kind.into(),
            heading_err_deg: psi,
            scale_err: s,
            velocity_bias_m_s: w,
            velocity_noise_m_s: sv,
            noise_corr_s: tau,
        };
        let (speed, grade, aiding) = match name {
            "multirotor" => (
                10.0,
                "consumer",
                aid("optical-flow", 3.0, 0.03, 0.0, 0.1, 1.0),
            ),
            "fixed-wing" => (
                22.0,
                "industrial",
                aid("airspeed-heading", 2.0, 0.05, 1.0, 0.5, 10.0),
            ),
            "vtol" => (
                18.0,
                "industrial",
                aid("airspeed-heading", 2.0, 0.05, 1.0, 0.5, 10.0),
            ),
            "ground-robot" => (
                1.5,
                "consumer",
                aid("wheel-odometry", 2.0, 0.02, 0.0, 0.05, 1.0),
            ),
            other => return Err(crate::terr!("e-drone-unknown-airframe", name = other)),
        };
        Ok(BudgetSpec {
            airframe: name.into(),
            speed_m_s: speed,
            imu_grade: grade.into(),
            aiding: Some(aiding),
            ..BudgetSpec::default()
        })
    }
}

/// The aided dead-reckoning error σ(t), metres.
pub fn aided_error_m(a: &Aiding, speed: f64, t: f64) -> f64 {
    let d = speed * t;
    let psi = a.heading_err_deg.to_radians();
    ((psi * d).powi(2)
        + (a.scale_err * d).powi(2)
        + (a.velocity_bias_m_s * t).powi(2)
        + 2.0 * a.velocity_noise_m_s.powi(2) * a.noise_corr_s * t)
        .sqrt()
}

/// The closed-form crossing time of [`aided_error_m`] (module notes), seconds.
pub fn aided_crossing_closed_form_s(a: &Aiding, speed: f64, threshold: f64) -> f64 {
    let psi = a.heading_err_deg.to_radians();
    let k2 = (psi * psi + a.scale_err * a.scale_err) * speed * speed + a.velocity_bias_m_s.powi(2);
    let d = 2.0 * a.velocity_noise_m_s.powi(2) * a.noise_corr_s;
    if k2 <= 0.0 {
        return if d > 0.0 {
            threshold * threshold / d
        } else {
            f64::INFINITY
        };
    }
    (-d + (d * d + 4.0 * k2 * threshold * threshold).sqrt()) / (2.0 * k2)
}

fn finite(x: f64) -> Value {
    if x.is_finite() {
        json!(x)
    } else {
        Value::Null
    }
}

/// The coast budget (module notes).
pub fn plan(spec: &BudgetSpec) -> Result<Value, String> {
    let grade = ImuGrade::parse(&spec.imu_grade)?;
    if !(spec.speed_m_s.is_finite() && spec.speed_m_s >= 0.0) {
        return Err(crate::terr!(
            "e-drone-bad-number",
            flag = "speed_m_s",
            value = spec.speed_m_s
        ));
    }
    let model = CoastModel::new(
        grade.params().si(),
        spec.speed_m_s,
        0.0,
        Combination::Rss,
        0.0,
    )
    .with_site(spec.latitude_deg, 0.0);
    let v0 = spec.initial_velocity_err_m_s;
    let free = |t: f64| (model.drift_m(t).powi(2) + (v0 * t).powi(2)).sqrt();
    let mut rows = Vec::new();
    for &th in &spec.thresholds_m {
        let tf = first_crossing_s(free, th);
        let dominant = if tf.is_finite() {
            model.dominant_at(tf).map(|d| d.0)
        } else {
            None
        };
        let mut row = json!({
            "threshold_m": th,
            "free_inertial_s": finite(tf),
            "free_inertial_distance_m": finite(tf * spec.speed_m_s),
            "free_inertial_dominant": dominant,
        });
        if let Some(a) = &spec.aiding {
            let ta = first_crossing_s(|t| aided_error_m(a, spec.speed_m_s, t), th);
            let tc = aided_crossing_closed_form_s(a, spec.speed_m_s, th);
            row["aided_s"] = finite(ta);
            row["aided_closed_form_s"] = finite(tc);
            row["aided_distance_m"] = finite(ta * spec.speed_m_s);
        }
        rows.push(row);
    }
    let leg = spec
        .denied_leg_m
        .filter(|l| *l > 0.0 && spec.speed_m_s > 0.0)
        .map(|l| {
            let t = l / spec.speed_m_s;
            let e_free = free(t);
            let e_aided = spec
                .aiding
                .as_ref()
                .map(|a| aided_error_m(a, spec.speed_m_s, t));
            let best = e_aided.map_or(e_free, |e| e.min(e_free));
            json!({
                "leg_m": l,
                "leg_s": t,
                "end_error_free_inertial_m": e_free,
                "end_error_aided_m": e_aided,
                "allowance_m": spec.allowance_m,
                "within_allowance": spec.allowance_m.map(|a| best <= a),
            })
        });
    Ok(json!({
        "format": "kshana.drone-dr-budget/1",
        "evidence": super::EVIDENCE,
        "spec": spec,
        "crossings": rows,
        "leg": leg,
    }))
}

/// A consumer-quadcopter GNSS-loss request.
#[derive(Clone, Debug, PartialEq, Serialize, Deserialize)]
#[serde(default)]
pub struct QuadLossSpec {
    /// Height above ground, metres.
    pub height_m: f64,
    /// Highest height at which the downward vision positioning holds position, metres (an
    /// assumption to set from the aircraft's manual).
    pub vision_max_height_m: f64,
    /// Whether the ground has the light and texture vision positioning needs.
    pub vision_conditions_ok: bool,
    /// Wind speed, m/s.
    pub wind_m_s: f64,
    /// Seconds of GNSS loss to model.
    pub loss_s: f64,
    /// The distance from the intended position that matters (geofence or obstacle buffer), m.
    pub buffer_m: f64,
    /// Vision-hold error terms.
    pub vision: Aiding,
}

impl Default for QuadLossSpec {
    fn default() -> Self {
        QuadLossSpec {
            height_m: 40.0,
            vision_max_height_m: 10.0,
            vision_conditions_ok: true,
            wind_m_s: 5.0,
            loss_s: 60.0,
            buffer_m: 50.0,
            vision: Aiding {
                kind: "optical-flow".into(),
                heading_err_deg: 0.0,
                scale_err: 0.0,
                velocity_bias_m_s: 0.05,
                velocity_noise_m_s: 0.1,
                noise_corr_s: 1.0,
            },
        }
    }
}

/// The consumer-quadcopter behaviour model: below the vision height with good conditions the
/// aircraft holds position on vision (drift as velocity-aided dead reckoning at zero ground
/// speed); otherwise it falls back to attitude mode, holds no position and drifts with the wind
/// (`wind·t`); return-to-home that needs GNSS is unavailable in both. Reports the mode, the drift
/// after `loss_s` and the time to leave the buffer.
pub fn quad_loss(s: &QuadLossSpec) -> Value {
    let vision = s.vision_conditions_ok && s.height_m <= s.vision_max_height_m;
    let drift = |t: f64| {
        if vision {
            aided_error_m(&s.vision, 0.0, t)
        } else {
            s.wind_m_s.abs() * t
        }
    };
    let t_out = first_crossing_s(drift, s.buffer_m);
    json!({
        "format": "kshana.drone-quad-loss/1",
        "evidence": super::EVIDENCE,
        "spec": s,
        "mode": if vision { "vision-hold" } else { "attitude" },
        "gnss_return_home_available": false,
        "drift_after_loss_m": drift(s.loss_s),
        "time_to_leave_buffer_s": finite(t_out),
    })
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn aided_crossing_agrees_with_the_closed_form() {
        for name in ["multirotor", "fixed-wing", "vtol", "ground-robot"] {
            let s = BudgetSpec::preset(name).unwrap();
            let a = s.aiding.as_ref().unwrap();
            for th in [5.0, 10.0, 50.0, 100.0] {
                let b = first_crossing_s(|t| aided_error_m(a, s.speed_m_s, t), th);
                let c = aided_crossing_closed_form_s(a, s.speed_m_s, th);
                assert!(
                    (b - c).abs() <= 1e-6 * c.max(1.0),
                    "{name} {th}: {b} vs {c}"
                );
            }
        }
    }

    #[test]
    fn consumer_free_inertial_is_accelerometer_bias_limited() {
        let s = BudgetSpec {
            initial_velocity_err_m_s: 0.0,
            ..BudgetSpec::preset("multirotor").unwrap()
        };
        let r = plan(&s).unwrap();
        let t10 = r["crossings"][0]["free_inertial_s"].as_f64().unwrap();
        // ½·b·t² = 10 m with b = 25 mg.
        let b: f64 = 25e-3 * 9.80665;
        let analytic = (2.0 * 10.0 / b).sqrt();
        assert!(
            t10 <= analytic && t10 >= 0.8 * analytic,
            "{t10} vs {analytic}"
        );
    }

    #[test]
    fn quad_falls_back_to_wind_drift_above_vision_height() {
        let r = quad_loss(&QuadLossSpec::default());
        assert_eq!(r["mode"], "attitude");
        assert!((r["time_to_leave_buffer_s"].as_f64().unwrap() - 10.0).abs() < 1e-6);
        let low = quad_loss(&QuadLossSpec {
            height_m: 3.0,
            ..QuadLossSpec::default()
        });
        assert_eq!(low["mode"], "vision-hold");
        assert!(low["drift_after_loss_m"].as_f64().unwrap() < 5.0);
    }
}
