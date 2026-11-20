// SPDX-License-Identifier: AGPL-3.0-only
//! Holdover through temperature transients and shocks.
//!
//! The reference is lost at `t = 0` with the clock's phase and frequency known. From then on the
//! time error is the sum of
//!
//! * **an initial frequency offset** `y0`: `y0·t`;
//! * **ageing** at `D` per day: `D·t²/(2·86 400)`;
//! * **temperature**: `∫ k_T·(T_eff(t) − T_eff(0)) dt`, with `k_T` the fractional frequency per kelvin
//!   (for a preset, the datasheet's bound over half its operating span, a linear worst-case reading,
//!   [`crate::telecom_timing::OscillatorPreset::temperature_coeff_per_k`]) and `T_eff` the ambient
//!   profile passed through a first-order thermal lag of time constant `lag_s` (zero: none), a stand-in
//!   for the package's or oven's thermal mass;
//! * **shocks**: each a frequency step `freq_step` and a phase step `phase_step_s` at `t_s`, and an
//!   optional outage of `outage_s` during which the output runs at an extra `outage_freq_offset` (for
//!   example a re-lock after the shock);
//!
//! and a stochastic part whose one-sigma size is taken as `t·σ_y(t)` from the clock's power-law fit
//! (the `x = σ_y(τ)·τ` reading of [`crate::clock_specs::x_clock_s`]). The bound is
//! `|deterministic| + k·t·σ_y(t)` and the holdover is the first time the bound reaches the threshold.
//!
//! The integral is a trapezoid rule on the step grid; with a constant-rate ramp and no lag it equals
//! `k_T·r·t²/2` (a unit test). MODELLED: the profile, the lag and the shock figures are inputs, and
//! the result is what they imply for the stated figures, not a measurement.

use super::{field_err, positive, ClockRef, LABEL};
use serde::{Deserialize, Serialize};

/// Seconds per day.
const DAY_S: f64 = 86_400.0;
/// Largest number of steps a run may take.
pub const MAX_STEPS: usize = 2_000_000;
/// Largest `steps × (temperature points + shocks + 1)` a run may take, so a large input cannot make
/// a run slow.
pub const MAX_WORK: f64 = 2.0e7;
/// Largest number of points kept in the reported series.
pub const SERIES_POINTS: usize = 200;

/// An ambient temperature profile.
#[derive(Clone, Debug, PartialEq, Serialize, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct TemperatureProfile {
    /// Breakpoints `[t_s, temperature_c]`, increasing in time, linear between them and held
    /// constant after the last one.
    pub points: Vec<(f64, f64)>,
    /// First-order thermal lag time constant, s (0: the clock follows the ambient at once).
    #[serde(default)]
    pub lag_s: f64,
}

impl TemperatureProfile {
    /// The ambient temperature at `t`.
    pub fn at(&self, t: f64) -> f64 {
        let p = &self.points;
        if t <= p[0].0 {
            return p[0].1;
        }
        for w in p.windows(2) {
            if t <= w[1].0 {
                let f = (t - w[0].0) / (w[1].0 - w[0].0);
                return w[0].1 + f * (w[1].1 - w[0].1);
            }
        }
        p[p.len() - 1].1
    }
}

/// A shock event.
#[derive(Clone, Debug, PartialEq, Serialize, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct Shock {
    /// Time of the shock after the loss, s.
    pub t_s: f64,
    /// Lasting fractional-frequency step.
    #[serde(default)]
    pub freq_step: f64,
    /// Phase (time) step, s.
    #[serde(default)]
    pub phase_step_s: f64,
    /// Outage after the shock, s.
    #[serde(default)]
    pub outage_s: f64,
    /// Extra fractional-frequency offset during the outage.
    #[serde(default)]
    pub outage_freq_offset: f64,
}

/// Input of `kshana oscillator holdover`.
#[derive(Clone, Debug, PartialEq, Serialize, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct EnvHoldoverInput {
    /// The clock.
    pub clock: ClockRef,
    /// Length of the run, s.
    pub duration_s: f64,
    /// Step, s (default: duration / 20 000, at least 1 s).
    #[serde(default)]
    pub step_s: Option<f64>,
    /// Time-error threshold, s.
    pub threshold_s: f64,
    /// Multiplier on the one-sigma stochastic part (default 1).
    #[serde(default = "one")]
    pub k_sigma: f64,
    /// Fractional-frequency offset at the loss.
    #[serde(default)]
    pub initial_freq_offset: f64,
    /// Temperature profile.
    #[serde(default)]
    pub temperature: Option<TemperatureProfile>,
    /// Shocks.
    #[serde(default)]
    pub shocks: Vec<Shock>,
}

fn one() -> f64 {
    1.0
}

/// One reported point.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct HoldoverPoint {
    /// Time after the loss, s.
    pub t_s: f64,
    /// Effective clock temperature, °C (`null` without a profile).
    pub temperature_c: Option<f64>,
    /// Ageing part, s.
    pub aging_s: f64,
    /// Temperature part, s.
    pub temperature_s: f64,
    /// Shock part, s.
    pub shock_s: f64,
    /// Deterministic total (with the initial offset), s.
    pub deterministic_s: f64,
    /// One-sigma stochastic part `t·σ_y(t)`, s.
    pub sigma_s: f64,
    /// `|deterministic| + k·sigma`, s.
    pub bound_s: f64,
}

/// Report of `kshana oscillator holdover`.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct EnvHoldoverReport {
    /// Evidence label.
    pub label: &'static str,
    /// The clock's id.
    pub clock: String,
    /// The clock's source document.
    pub source: String,
    /// The temperature coefficient used, per kelvin (`null`: none stated, temperature not modelled).
    pub temp_coeff_per_k: Option<f64>,
    /// Time error threshold, s.
    pub threshold_s: f64,
    /// First time the bound reaches the threshold, s (`null`: not within the run).
    pub holdover_s: Option<f64>,
    /// First time the deterministic part alone reaches the threshold, s.
    pub holdover_deterministic_s: Option<f64>,
    /// Largest bound in the run, s.
    pub max_bound_s: f64,
    /// Largest |temperature part|, s.
    pub max_temperature_s: f64,
    /// Largest |shock part|, s.
    pub max_shock_s: f64,
    /// The series, at most [`SERIES_POINTS`] points.
    pub series: Vec<HoldoverPoint>,
}

fn validate(inp: &EnvHoldoverInput) -> Result<(), String> {
    positive("duration_s", inp.duration_s)?;
    positive("threshold_s", inp.threshold_s)?;
    if !(inp.k_sigma.is_finite() && inp.k_sigma >= 0.0) {
        return Err(field_err("k_sigma", inp.k_sigma));
    }
    if !inp.initial_freq_offset.is_finite() {
        return Err(field_err("initial_freq_offset", inp.initial_freq_offset));
    }
    if let Some(s) = inp.step_s {
        positive("step_s", s)?;
    }
    if let Some(tp) = &inp.temperature {
        if tp.points.is_empty() || tp.points.len() > 1000 {
            return Err(field_err("temperature.points", tp.points.len() as f64));
        }
        let mut last = f64::NEG_INFINITY;
        for &(t, c) in &tp.points {
            if !(t.is_finite() && t > last) {
                return Err(field_err("temperature.points.t_s", t));
            }
            if !(c.is_finite() && (-273.15..=1000.0).contains(&c)) {
                return Err(field_err("temperature.points.temperature_c", c));
            }
            last = t;
        }
        if !(tp.lag_s.is_finite() && tp.lag_s >= 0.0) {
            return Err(field_err("temperature.lag_s", tp.lag_s));
        }
    }
    if inp.shocks.len() > 1000 {
        return Err(field_err("shocks", inp.shocks.len() as f64));
    }
    for s in &inp.shocks {
        for (name, v) in [
            ("shocks.t_s", s.t_s),
            ("shocks.freq_step", s.freq_step),
            ("shocks.phase_step_s", s.phase_step_s),
            ("shocks.outage_freq_offset", s.outage_freq_offset),
        ] {
            if !v.is_finite() {
                return Err(field_err(name, v));
            }
        }
        if !(s.outage_s.is_finite() && s.outage_s >= 0.0) {
            return Err(field_err("shocks.outage_s", s.outage_s));
        }
    }
    Ok(())
}

/// Run the holdover.
pub fn run(inp: &EnvHoldoverInput) -> Result<EnvHoldoverReport, String> {
    validate(inp)?;
    let spec = inp.clock.resolve()?;
    let noise = spec.noise();
    let dt = inp.step_s.unwrap_or((inp.duration_s / 20_000.0).max(1.0));
    let steps = (inp.duration_s / dt).ceil();
    let per_step = 1 + inp.shocks.len() + inp.temperature.as_ref().map_or(0, |p| p.points.len());
    if steps > MAX_STEPS as f64 || steps * per_step as f64 > MAX_WORK {
        return Err(field_err("step_s", dt));
    }
    let steps = steps as usize;
    let kt = spec.temp_coeff_per_k;
    let profile = inp.temperature.as_ref();
    let t_amb0 = profile.map(|p| p.at(0.0));
    let mut t_eff = t_amb0.unwrap_or(0.0);
    let t_eff0 = t_eff;
    let aging_per_s = spec.aging_per_day / DAY_S;

    let freq_temp = |te: f64| kt.zip(profile).map_or(0.0, |(k, _)| k * (te - t_eff0));
    let shock_freq = |t: f64| -> f64 {
        inp.shocks
            .iter()
            .filter(|s| t >= s.t_s)
            .map(|s| {
                let out = if t < s.t_s + s.outage_s {
                    s.outage_freq_offset
                } else {
                    0.0
                };
                s.freq_step + out
            })
            .sum()
    };
    let shock_phase = |t: f64| -> f64 {
        inp.shocks
            .iter()
            .filter(|s| t >= s.t_s)
            .map(|s| s.phase_step_s)
            .sum()
    };

    let every = (steps / SERIES_POINTS).max(1);
    let mut series = Vec::new();
    let (mut temp_s, mut shock_int_s) = (0.0_f64, 0.0_f64);
    let (mut y_temp_prev, mut y_shock_prev) = (0.0, shock_freq(0.0));
    let mut holdover = None;
    let mut holdover_det = None;
    let (mut max_bound, mut max_temp, mut max_shock) = (0.0_f64, 0.0_f64, 0.0_f64);
    for i in 0..=steps {
        let t = (i as f64 * dt).min(inp.duration_s);
        if i > 0 {
            let h = t - (i - 1) as f64 * dt;
            if let Some(p) = profile {
                let amb = p.at(t);
                t_eff = if p.lag_s > 0.0 {
                    t_eff + (amb - t_eff) * (1.0 - (-h / p.lag_s).exp())
                } else {
                    amb
                };
            }
            let y_temp = freq_temp(t_eff);
            temp_s += 0.5 * (y_temp + y_temp_prev) * h;
            y_temp_prev = y_temp;
            let y_shock = shock_freq(t);
            shock_int_s += 0.5 * (y_shock + y_shock_prev) * h;
            y_shock_prev = y_shock;
        }
        let aging = 0.5 * aging_per_s * t * t;
        let shock = shock_int_s + shock_phase(t);
        let det = inp.initial_freq_offset * t + aging + temp_s + shock;
        let sigma = if t > 0.0 { t * noise.adev(t) } else { 0.0 };
        let bound = det.abs() + inp.k_sigma * sigma;
        if holdover.is_none() && bound >= inp.threshold_s {
            holdover = Some(t);
        }
        if holdover_det.is_none() && det.abs() >= inp.threshold_s {
            holdover_det = Some(t);
        }
        max_bound = max_bound.max(bound);
        max_temp = max_temp.max(temp_s.abs());
        max_shock = max_shock.max(shock.abs());
        if i % every == 0 || i == steps {
            series.push(HoldoverPoint {
                t_s: t,
                temperature_c: profile.map(|_| t_eff),
                aging_s: aging,
                temperature_s: temp_s,
                shock_s: shock,
                deterministic_s: det,
                sigma_s: sigma,
                bound_s: bound,
            });
        }
    }
    Ok(EnvHoldoverReport {
        label: LABEL,
        clock: spec.id.clone(),
        source: spec.source.clone(),
        temp_coeff_per_k: kt,
        threshold_s: inp.threshold_s,
        holdover_s: holdover,
        holdover_deterministic_s: holdover_det,
        max_bound_s: max_bound,
        max_temperature_s: max_temp,
        max_shock_s: max_shock,
        series,
    })
}
