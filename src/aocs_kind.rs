// SPDX-License-Identifier: AGPL-3.0-only
//! The `aocs` scenario kind: an inertial-pointing slew with reaction wheels under MRP feedback
//! ([`crate::aocs`]). The loop can be closed on the true state, or on an MEKF estimate from a
//! gyro and a star tracker ([`crate::aocs_mekf`]).
//!
//! The run reports:
//! - the settling time to a pointing threshold, the final pointing error, and the peak wheel
//!   torque and speed;
//! - the fraction of steps with a wheel at its torque limit;
//! - the drift in total angular momentum (zero torque from outside, so this checks the
//!   integration);
//! - with the estimator, its attitude error and its mean normalised estimation error squared.
//!
//! The control law and wheel dynamics are VALIDATED against Basilisk on the true-state loop
//! (`tests/aocs_basilisk_oracle.rs`). The estimator, and the loop closed on it, are MODELLED.

// Dense 3x3 and 6x6 matrix arithmetic reads clearest with index loops.
#![allow(clippy::needless_range_loop)]

use crate::aocs::{
    mrp_from_quaternion, quaternion_from_mrp, rk4_step, AocsConfig, AocsState, Wheel,
};
use crate::aocs_mekf::{attitude_error, GyroSim, Mekf, MekfNoise};
use crate::frames::Vec3;
use crate::portable_math::PortableFloat;
use serde::Deserialize;

/// Kind tag.
pub const KIND: &str = "aocs";

/// One wheel as the scenario states it.
#[derive(Clone, Debug, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct WheelSpec {
    /// Spin axis in body axes (normalised by the run).
    pub axis: [f64; 3],
    /// Spin inertia (kg m²).
    pub js_kg_m2: f64,
    /// Motor torque limit (N m).
    pub u_max_nm: f64,
    /// Initial wheel speed relative to the body (rpm).
    #[serde(default)]
    pub speed0_rpm: f64,
}

/// The optional estimator in the loop.
#[derive(Clone, Debug, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct EstimatorSpec {
    /// Gyro angle random walk (rad/√s).
    pub gyro_arw_rad_sqrt_s: f64,
    /// Gyro rate random walk (rad/s^1.5).
    pub gyro_rrw_rad_s_1p5: f64,
    /// True initial gyro bias (rad/s).
    #[serde(default)]
    pub gyro_bias0_rad_s: [f64; 3],
    /// Star-tracker error per axis (arcsec).
    pub star_tracker_sigma_arcsec: f64,
    /// Star-tracker update interval (s).
    pub star_tracker_every_s: f64,
    /// Initial attitude knowledge error per axis, 1-sigma (deg).
    pub initial_attitude_sigma_deg: f64,
    /// Initial bias knowledge, 1-sigma (rad/s).
    pub initial_bias_sigma_rad_s: f64,
    /// Random seed.
    pub seed: u64,
}

fn d_dur() -> f64 {
    600.0
}
fn d_dt() -> f64 {
    0.1
}
fn d_sample() -> f64 {
    1.0
}
fn d_thresh() -> f64 {
    0.1
}

/// An `aocs` scenario.
#[derive(Clone, Debug, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct AocsScenario {
    /// Always `aocs` when given.
    #[serde(default)]
    pub kind: Option<String>,
    /// Run length (s).
    #[serde(default = "d_dur")]
    pub duration_s: f64,
    /// Control and integration step (s).
    #[serde(default = "d_dt")]
    pub dt_s: f64,
    /// Output sample interval (s), a whole multiple of `dt_s`.
    #[serde(default = "d_sample")]
    pub sample_s: f64,
    /// Hub inertia **without** the wheels' spin inertia (kg m², body axes, symmetric); the run
    /// adds each wheel's `J_s ĝ ĝᵀ`.
    pub hub_inertia_kg_m2: [[f64; 3]; 3],
    /// Proportional MRP gain K (N m).
    pub k_nm: f64,
    /// Rate gain P (N m s).
    pub p_nms: f64,
    /// The wheels (at least three, spanning the body axes).
    pub wheels: Vec<WheelSpec>,
    /// Initial MRP set σ_BN (the target is σ = 0, inertial pointing).
    pub sigma0: [f64; 3],
    /// Initial body rate (rad/s).
    #[serde(default)]
    pub omega0_rad_s: [f64; 3],
    /// Pointing threshold for the settling time (deg).
    #[serde(default = "d_thresh")]
    pub pointing_threshold_deg: f64,
    /// Close the loop on an MEKF estimate instead of the true state.
    #[serde(default)]
    pub estimator: Option<EstimatorSpec>,
}

const RPM: f64 = std::f64::consts::PI / 30.0;

/// Units of every emitted field.
pub const UNITS: &[crate::field_schema::FieldUnit] = {
    use crate::field_schema::{FieldUnit, ProvenanceClass::*};
    &[
        FieldUnit { path: "duration_s", unit: "s", provenance: Input, definition: "run length" },
        FieldUnit { path: "dt_s", unit: "s", provenance: Input, definition: "control and integration step" },
        FieldUnit { path: "sample_s", unit: "s", provenance: Input, definition: "output sample interval" },
        FieldUnit { path: "k_nm", unit: "N m", provenance: Input, definition: "proportional MRP gain" },
        FieldUnit { path: "p_nms", unit: "N m s", provenance: Input, definition: "rate gain" },
        FieldUnit { path: "pointing_threshold_deg", unit: "deg", provenance: Input, definition: "pointing error the settling time is measured against" },
        FieldUnit { path: "inertia_kg_m2", unit: "kg m^2", provenance: Computed, definition: "hub inertia plus each wheel's spin inertia along its axis, as the dynamics use it" },
        FieldUnit { path: "wheels[].axis", unit: "1", provenance: Computed, definition: "unit spin axis in body axes" },
        FieldUnit { path: "wheels[].js_kg_m2", unit: "kg m^2", provenance: Input, definition: "spin inertia" },
        FieldUnit { path: "wheels[].u_max_nm", unit: "N m", provenance: Input, definition: "motor torque limit" },
        FieldUnit { path: "wheels[].speed0_rpm", unit: "rpm", provenance: Input, definition: "initial speed relative to the body" },
        FieldUnit { path: "wheels[].peak_speed_rpm", unit: "rpm", provenance: Computed, definition: "largest absolute wheel speed over the run" },
        FieldUnit { path: "wheels[].peak_torque_nm", unit: "N m", provenance: Computed, definition: "largest absolute applied motor torque over the run" },
        FieldUnit { path: "wheels[].saturated_fraction", unit: "1", provenance: Computed, definition: "fraction of steps with this wheel at its torque limit" },
        FieldUnit { path: "settle_time_s", unit: "s", provenance: Computed, definition: "first sample after which the true pointing error stays below the threshold (null if it never does)" },
        FieldUnit { path: "final_pointing_error_deg", unit: "deg", provenance: Computed, definition: "true pointing error (rotation angle from the target) at the end" },
        FieldUnit { path: "max_pointing_error_deg", unit: "deg", provenance: Computed, definition: "largest true pointing error over the run" },
        FieldUnit { path: "momentum_drift_nms", unit: "N m s", provenance: InternalConsistency, definition: "largest change of the total inertial angular momentum from its start; zero external torque, so this measures the integration" },
        FieldUnit { path: "estimator.final_attitude_error_arcsec", unit: "arcsec", provenance: Computed, definition: "MEKF attitude error at the end" },
        FieldUnit { path: "estimator.rms_attitude_error_arcsec", unit: "arcsec", provenance: Computed, definition: "RMS MEKF attitude error over the second half of the run" },
        FieldUnit { path: "estimator.mean_nees", unit: "1", provenance: InternalConsistency, definition: "mean six-degree-of-freedom normalised estimation error squared over the second half; 6 for a consistent filter" },
        FieldUnit { path: "estimator.star_tracker_updates", unit: "count", provenance: Computed, definition: "star-tracker updates applied" },
        FieldUnit { path: "series.t_s", unit: "s", provenance: Computed, definition: "sample times" },
        FieldUnit { path: "series.pointing_error_deg", unit: "deg", provenance: Computed, definition: "true pointing error at each sample" },
        FieldUnit { path: "series.sigma", unit: "1", provenance: Computed, definition: "true MRP set sigma_BN at each sample (|sigma| <= 1)" },
        FieldUnit { path: "series.omega_rad_s", unit: "rad/s", provenance: Computed, definition: "true body rate at each sample" },
        FieldUnit { path: "series.wheel_speed_rpm", unit: "rpm", provenance: Computed, definition: "wheel speeds at each sample" },
        FieldUnit { path: "series.wheel_torque_nm", unit: "N m", provenance: Computed, definition: "motor torques applied over the step starting at each sample" },
    ]
};

fn pointing_deg(sigma: Vec3) -> f64 {
    let s = (sigma[0] * sigma[0] + sigma[1] * sigma[1] + sigma[2] * sigma[2]).sqrt();
    (4.0 * s.patan()).to_degrees()
}

impl AocsScenario {
    fn config(&self) -> Result<AocsConfig, String> {
        let mut inertia = self.hub_inertia_kg_m2;
        let mut wheels = Vec::with_capacity(self.wheels.len());
        for (i, w) in self.wheels.iter().enumerate() {
            let n = (w.axis[0].ppowi(2) + w.axis[1].ppowi(2) + w.axis[2].ppowi(2)).sqrt();
            if !(n.is_finite() && n > 0.0) {
                return Err(format!("wheels[{i}].axis must be a non-zero finite vector"));
            }
            let g = [w.axis[0] / n, w.axis[1] / n, w.axis[2] / n];
            for r in 0..3 {
                for c in 0..3 {
                    inertia[r][c] += w.js_kg_m2 * g[r] * g[c];
                }
            }
            wheels.push(Wheel {
                gs: g,
                js: w.js_kg_m2,
                u_max: w.u_max_nm,
            });
        }
        let cfg = AocsConfig {
            inertia,
            wheels,
            k: self.k_nm,
            p: self.p_nms,
        };
        cfg.validate()?;
        Ok(cfg)
    }

    fn validate(&self) -> Result<(usize, usize), String> {
        let pos = |v: f64, n: &str| {
            if v.is_finite() && v > 0.0 {
                Ok(())
            } else {
                Err(format!("{n} must be finite and positive"))
            }
        };
        pos(self.duration_s, "duration_s")?;
        pos(self.dt_s, "dt_s")?;
        pos(self.sample_s, "sample_s")?;
        pos(self.pointing_threshold_deg, "pointing_threshold_deg")?;
        let steps = (self.duration_s / self.dt_s).round();
        if steps > 2.0e6 {
            return Err("duration_s / dt_s must be at most 2e6 steps".into());
        }
        let every = (self.sample_s / self.dt_s).round();
        if every < 1.0 || ((every * self.dt_s) - self.sample_s).abs() > 1e-9 * self.sample_s {
            return Err("sample_s must be a whole multiple of dt_s".into());
        }
        if self
            .sigma0
            .iter()
            .chain(&self.omega0_rad_s)
            .any(|v| !v.is_finite())
        {
            return Err("sigma0 and omega0_rad_s must be finite".into());
        }
        for (i, w) in self.wheels.iter().enumerate() {
            if !w.speed0_rpm.is_finite() {
                return Err(format!("wheels[{i}].speed0_rpm must be finite"));
            }
        }
        if let Some(e) = &self.estimator {
            pos(e.gyro_arw_rad_sqrt_s, "estimator.gyro_arw_rad_sqrt_s")?;
            pos(e.gyro_rrw_rad_s_1p5, "estimator.gyro_rrw_rad_s_1p5")?;
            pos(
                e.star_tracker_sigma_arcsec,
                "estimator.star_tracker_sigma_arcsec",
            )?;
            pos(e.star_tracker_every_s, "estimator.star_tracker_every_s")?;
            pos(
                e.initial_attitude_sigma_deg,
                "estimator.initial_attitude_sigma_deg",
            )?;
            pos(
                e.initial_bias_sigma_rad_s,
                "estimator.initial_bias_sigma_rad_s",
            )?;
            if e.gyro_bias0_rad_s.iter().any(|v| !v.is_finite()) {
                return Err("estimator.gyro_bias0_rad_s must be finite".into());
            }
            if e.star_tracker_every_s < self.dt_s {
                return Err("estimator.star_tracker_every_s must be at least dt_s".into());
            }
        }
        Ok((steps as usize, every as usize))
    }

    /// Run the scenario, returning `(json, summary)`.
    pub fn run_json(&self) -> Result<(String, String), String> {
        let (steps, every) = self.validate()?;
        let cfg = self.config()?;
        let dt = self.dt_s;
        let mut s = AocsState {
            q: quaternion_from_mrp(self.sigma0),
            omega: self.omega0_rad_s,
            wheel_speed: self.wheels.iter().map(|w| w.speed0_rpm * RPM).collect(),
        };
        let h0 = cfg.angular_momentum_inertial(&s);
        let n_w = cfg.wheels.len();

        // Estimator, when the loop is closed on it.
        let mut est = self.estimator.as_ref().map(|e| {
            let noise = MekfNoise {
                sigma_v: e.gyro_arw_rad_sqrt_s,
                sigma_u: e.gyro_rrw_rad_s_1p5,
                sigma_st: (e.star_tracker_sigma_arcsec / 3600.0).to_radians(),
            };
            let mut gyro = GyroSim::new(e.gyro_bias0_rad_s, noise, e.seed);
            // Initial knowledge: one star-tracker-like draw at the stated initial sigma.
            let init_noise = MekfNoise {
                sigma_st: e.initial_attitude_sigma_deg.to_radians(),
                ..noise
            };
            let mut init = GyroSim::new([0.0; 3], init_noise, e.seed ^ 0x5eed);
            let q0 = init.star_tracker(&s.q);
            let mekf = Mekf::new(
                q0,
                [0.0; 3],
                e.initial_attitude_sigma_deg.to_radians(),
                e.initial_bias_sigma_rad_s,
                noise,
            );
            let st_every = (e.star_tracker_every_s / dt).round().max(1.0) as usize;
            let wm0 = gyro.sample(s.omega, dt);
            (mekf, gyro, st_every, wm0)
        });

        let mut series_t = Vec::new();
        let mut series_err = Vec::new();
        let mut series_sigma = Vec::new();
        let mut series_omega = Vec::new();
        let mut series_speed = Vec::new();
        let mut series_torque = Vec::new();
        let mut peak_speed = vec![0.0_f64; n_w];
        let mut peak_torque = vec![0.0_f64; n_w];
        let mut sat_steps = vec![0usize; n_w];
        let mut drift = 0.0_f64;
        let mut max_err = 0.0_f64;
        let mut est_err_sq = 0.0;
        let mut est_n = 0usize;
        let mut nees_sum = 0.0;
        let mut st_updates = 0usize;

        for k in 0..=steps {
            // The controller's view of the state.
            let view = match &est {
                None => s.clone(),
                Some((m, _, _, wm)) => AocsState {
                    q: m.q,
                    omega: m.rate(*wm),
                    wheel_speed: s.wheel_speed.clone(),
                },
            };
            let u = if k < steps {
                cfg.motor_torques(&view)
            } else {
                vec![0.0; n_w]
            };
            let sigma = mrp_from_quaternion(&s.q);
            let err = pointing_deg(sigma);
            max_err = max_err.max(err);
            for i in 0..n_w {
                peak_speed[i] = peak_speed[i].max(s.wheel_speed[i].abs());
                if k < steps {
                    peak_torque[i] = peak_torque[i].max(u[i].abs());
                    if (u[i].abs() - cfg.wheels[i].u_max).abs() <= 1e-12 * cfg.wheels[i].u_max {
                        sat_steps[i] += 1;
                    }
                }
            }
            let h = cfg.angular_momentum_inertial(&s);
            drift = drift.max(
                ((h[0] - h0[0]).ppowi(2) + (h[1] - h0[1]).ppowi(2) + (h[2] - h0[2]).ppowi(2))
                    .sqrt(),
            );
            if k % every == 0 {
                series_t.push(k as f64 * dt);
                series_err.push(err);
                series_sigma.push(sigma);
                series_omega.push(s.omega);
                series_speed.push(s.wheel_speed.iter().map(|w| w / RPM).collect::<Vec<_>>());
                series_torque.push(u.clone());
            }
            if let Some((m, gyro, _, _)) = &est {
                if k >= steps / 2 {
                    let e = attitude_error(&m.q, &s.q);
                    est_err_sq += e[0] * e[0] + e[1] * e[1] + e[2] * e[2];
                    est_n += 1;
                    nees_sum += m.nees(&s.q, gyro.bias).unwrap_or(f64::NAN);
                }
            }
            if k == steps {
                break;
            }
            let next = rk4_step(&cfg, &s, &u, [0.0; 3], dt);
            if let Some((m, gyro, st_every, wm)) = &mut est {
                // The gyro reports the mean rate over the step; the trapezoid of the endpoint
                // rates stands in for it.
                let mean = [
                    0.5 * (s.omega[0] + next.omega[0]),
                    0.5 * (s.omega[1] + next.omega[1]),
                    0.5 * (s.omega[2] + next.omega[2]),
                ];
                *wm = gyro.sample(mean, dt);
                m.propagate(*wm, dt);
                if (k + 1) % *st_every == 0 {
                    let st = gyro.star_tracker(&next.q);
                    m.update(&st);
                    st_updates += 1;
                }
            }
            s = next;
        }

        let thr = self.pointing_threshold_deg;
        let settle = (0..series_err.len())
            .rev()
            .take_while(|&i| series_err[i] < thr)
            .last()
            .map(|i| series_t[i]);
        let final_err = *series_err.last().unwrap_or(&f64::NAN);
        let wheels_json: Vec<serde_json::Value> = cfg
            .wheels
            .iter()
            .zip(&self.wheels)
            .enumerate()
            .map(|(i, (w, spec))| {
                serde_json::json!({
                    "axis": w.gs,
                    "js_kg_m2": w.js,
                    "u_max_nm": w.u_max,
                    "speed0_rpm": spec.speed0_rpm,
                    "peak_speed_rpm": peak_speed[i] / RPM,
                    "peak_torque_nm": peak_torque[i],
                    "saturated_fraction": sat_steps[i] as f64 / steps.max(1) as f64,
                })
            })
            .collect();
        let estimator = match (&est, &self.estimator) {
            (Some((m, _, _, _)), Some(_)) => {
                let e = attitude_error(&m.q, &s.q);
                let arcsec = |rad: f64| rad.to_degrees() * 3600.0;
                serde_json::json!({
                    "final_attitude_error_arcsec": arcsec((e[0] * e[0] + e[1] * e[1] + e[2] * e[2]).sqrt()),
                    "rms_attitude_error_arcsec": arcsec((est_err_sq / est_n.max(1) as f64).sqrt()),
                    "mean_nees": nees_sum / est_n.max(1) as f64,
                    "star_tracker_updates": st_updates,
                })
            }
            _ => serde_json::Value::Null,
        };
        let json = serde_json::json!({
            "kind": KIND,
            "label": if self.estimator.is_some() {
                "MODELLED — reaction-wheel attitude control under MRP feedback, closed on an MEKF \
                 estimate from a simulated gyro and star tracker; the control law and wheel \
                 dynamics on the true state are VALIDATED against Basilisk 2.9.1, the estimator and \
                 this loop are not"
            } else {
                "VALIDATED control law and wheel dynamics (against Basilisk 2.9.1 on the true-state \
                 loop); this run's inputs are the scenario's own — reaction-wheel attitude control \
                 under MRP feedback, inertial pointing, no sensor noise, no friction"
            },
            "units": crate::field_schema::units_block(UNITS),
            "duration_s": self.duration_s,
            "dt_s": dt,
            "sample_s": self.sample_s,
            "k_nm": self.k_nm,
            "p_nms": self.p_nms,
            "pointing_threshold_deg": thr,
            "inertia_kg_m2": cfg.inertia,
            "wheels": wheels_json,
            "settle_time_s": settle,
            "final_pointing_error_deg": final_err,
            "max_pointing_error_deg": max_err,
            "momentum_drift_nms": drift,
            "estimator": estimator,
            "series": {
                "t_s": series_t,
                "pointing_error_deg": series_err,
                "sigma": series_sigma,
                "omega_rad_s": series_omega,
                "wheel_speed_rpm": series_speed,
                "wheel_torque_nm": series_torque,
            },
        });
        let summary = format!(
            "aocs: {} wheels, {:.0} s slew from {:.2} deg -> {} | final {:.2e} deg | peak wheel {:.0} rpm | {}",
            n_w,
            self.duration_s,
            series_err.first().copied().unwrap_or(f64::NAN),
            settle.map_or("never settles below the threshold".to_string(), |t| format!("settles below {thr} deg at {t:.1} s")),
            final_err,
            peak_speed.iter().cloned().fold(0.0, f64::max) / RPM,
            if self.estimator.is_some() { "MEKF in the loop (MODELLED)" } else { "true-state loop" },
        );
        let text = serde_json::to_string_pretty(&json).map_err(|e| e.to_string())?;
        Ok((text, summary))
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    const SRC: &str = r#"
kind = "aocs"
duration_s = 300.0
hub_inertia_kg_m2 = [[900.0, 0.0, 0.0], [0.0, 800.0, 0.0], [0.0, 0.0, 600.0]]
k_nm = 3.5
p_nms = 30.0
sigma0 = [0.1, 0.2, -0.3]
omega0_rad_s = [0.001, -0.01, 0.03]
[[wheels]]
axis = [1.0, 0.0, 0.0]
js_kg_m2 = 0.08
u_max_nm = 0.2
speed0_rpm = 100.0
[[wheels]]
axis = [0.0, 1.0, 0.0]
js_kg_m2 = 0.08
u_max_nm = 0.2
speed0_rpm = 200.0
[[wheels]]
axis = [0.0, 0.0, 1.0]
js_kg_m2 = 0.08
u_max_nm = 0.2
speed0_rpm = 300.0
"#;

    #[test]
    fn true_state_run_is_reproducible_and_conserves_momentum() {
        let scn: AocsScenario = toml::from_str(SRC).unwrap();
        let (a, _) = scn.run_json().unwrap();
        let (b, _) = scn.run_json().unwrap();
        assert_eq!(a, b);
        let v: serde_json::Value = serde_json::from_str(&a).unwrap();
        assert!(v["momentum_drift_nms"].as_f64().unwrap() < 1e-9);
        // PIN-SCOPE:    the number of output samples, 300 s at sample_s = 1 s plus the start
        // PIN-EXCLUDES: every sampled value
        assert_eq!(v["series"]["t_s"].as_array().unwrap().len(), 301);
    }

    #[test]
    fn estimator_loop_runs_and_reports_consistency() {
        let src = format!(
            "{SRC}\n[estimator]\ngyro_arw_rad_sqrt_s = 1e-5\ngyro_rrw_rad_s_1p5 = 1e-8\n\
             gyro_bias0_rad_s = [3e-6, -2e-6, 1e-6]\nstar_tracker_sigma_arcsec = 5.0\n\
             star_tracker_every_s = 1.0\ninitial_attitude_sigma_deg = 0.01\n\
             initial_bias_sigma_rad_s = 1e-5\nseed = 3\n"
        );
        let scn: AocsScenario = toml::from_str(&src).unwrap();
        let (j, s) = scn.run_json().unwrap();
        let v: serde_json::Value = serde_json::from_str(&j).unwrap();
        assert!(s.contains("MEKF"));
        assert!(v["estimator"]["star_tracker_updates"].as_u64().unwrap() >= 299);
        assert!(
            v["estimator"]["rms_attitude_error_arcsec"]
                .as_f64()
                .unwrap()
                < 10.0
        );
    }

    #[test]
    fn bad_inputs_are_refused() {
        let scn: AocsScenario = toml::from_str(&SRC.replace("k_nm = 3.5", "k_nm = -3.5")).unwrap();
        assert!(scn.run_json().is_err());
        let scn: AocsScenario = toml::from_str(
            &SRC.replace("duration_s = 300.0", "duration_s = 300.0\nsample_s = 0.15"),
        )
        .unwrap();
        assert!(scn.run_json().is_err());
    }
}
