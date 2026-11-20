// SPDX-License-Identifier: AGPL-3.0-only
//! Oscillator models for receiver and timing design: what an oscillator's datasheet figures mean for
//! carrier tracking under vibration, for holdover through temperature transients and shocks, for the
//! cold-start frequency search, for receiver autonomous integrity monitoring (RAIM) when the clock is
//! used as a measurement, and how a datasheet's Allan deviation becomes a time deviation (TDEV).
//!
//! The command is `kshana oscillator <part> <input.json>` (documentation: `docs/OSCILLATOR.md`):
//!
//! | part | module | what it answers |
//! |---|---|---|
//! | `vibration` | [`vibration`] | the carrier phase jitter an acceleration sensitivity (g-sensitivity) adds under random and sinusoidal vibration, and the C/N0 at which a phase-locked loop (PLL) then loses lock |
//! | `holdover` | [`environment`] | the time error after a reference is lost while temperature changes and shocks occur, and the time to a threshold |
//! | `select` | [`select`] | each candidate's figures checked against stated requirements (holdover, cold-start search, vibration, Allan deviation points, power): pass, fail or unknown |
//! | `raim-aid` | [`raim_aid`] | protection levels with and without the clock as an extra measurement, against the time since the clock was last calibrated |
//! | `datasheet` | [`datasheet`] | the power-law model fitted to a datasheet's Allan deviation points, the ratio at every point, and the TDEV it implies |
//! | `refs` | [`refs`] | the cited acceleration-sensitivity figures this module's documentation uses |
//!
//! Clocks are named by the four datasheet presets of [`crate::telecom_timing::PRESETS`] (`ocxo`,
//! `rubidium`, `caesium`, `csac`) or given in full as an [`OscSpec`].
//!
//! # Evidence
//!
//! Everything here is MODELLED, except the vibration sideband level, which reproduces seven of the
//! eight rows of Filler (1988) Tables I and II (tests in [`vibration`]); that comparison is the one
//! check against an independent published reference. The noise model of a preset is the envelope fit of
//! [`crate::telecom_timing::fit_noise`] with [`crate::telecom_timing::FLICKER_FLOOR_RULE`]. None of
//! the outputs is a measurement of a unit.

pub mod datasheet;
pub mod environment;
pub mod raim_aid;
pub mod refs;
pub mod select;
pub mod vibration;

use crate::telecom_timing::{fit_noise, preset_by_id, with_flicker_floor, NoiseFit, PRESETS};
use serde::{Deserialize, Serialize};

/// The evidence label every report of this module carries.
pub const LABEL: &str = "MODELLED";

/// An oscillator described by its datasheet figures. Figures a datasheet does not state are left out
/// (`None`); a check that needs one reports `unknown` rather than assuming a value.
#[derive(Clone, Debug, PartialEq, Serialize, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct OscSpec {
    /// A short name for the clock.
    pub id: String,
    /// The document the figures come from (name, revision, table).
    #[serde(default)]
    pub source: String,
    /// Allan deviation points `[tau_s, sigma_y]`, maxima as a datasheet states them (at least one).
    pub adev_points: Vec<(f64, f64)>,
    /// Linear fractional-frequency ageing per day.
    #[serde(default)]
    pub aging_per_day: f64,
    /// Fractional frequency change per kelvin (a linear reading of the datasheet's bound).
    #[serde(default)]
    pub temp_coeff_per_k: Option<f64>,
    /// Acceleration sensitivity, fractional frequency per g (the magnitude of the gamma vector).
    #[serde(default)]
    pub g_sensitivity_per_g: Option<f64>,
    /// Frequency accuracy at switch-on, fractional (± bound).
    #[serde(default)]
    pub initial_accuracy: Option<f64>,
    /// Steady-state power, watts.
    #[serde(default)]
    pub power_w: Option<f64>,
}

impl OscSpec {
    /// The power-law noise model: the envelope fit of the Allan deviation points with the flicker
    /// floor rule of the telecom-timing presets.
    pub fn noise(&self) -> NoiseFit {
        with_flicker_floor(fit_noise(&self.adev_points), &self.adev_points)
    }

    /// The spec of a telecom-timing preset. The datasheets of the presets state no acceleration
    /// sensitivity, so it is left unknown; the CSAC's power (< 120 mW) and frequency accuracy at
    /// shipment (±5e-11) are from its datasheet (Microchip SA.45s, DS00002985D, Specifications).
    pub fn from_preset(id: &str) -> Option<OscSpec> {
        let p = preset_by_id(id)?;
        let (initial_accuracy, power_w) = if p.id == "csac" {
            (Some(5e-11), Some(0.120))
        } else {
            (None, None)
        };
        Some(OscSpec {
            id: p.id.to_string(),
            source: p.document.to_string(),
            adev_points: p.adev_points.to_vec(),
            aging_per_day: p.aging_per_day,
            temp_coeff_per_k: Some(p.temperature_coeff_per_k()),
            g_sensitivity_per_g: None,
            initial_accuracy,
            power_w,
        })
    }

    /// Check the figures are usable.
    pub fn validate(&self) -> Result<(), String> {
        if self.adev_points.is_empty() || self.adev_points.len() > 1000 {
            return Err(field_err("adev_points", self.adev_points.len() as f64));
        }
        for &(t, s) in &self.adev_points {
            if !(t.is_finite() && t > 0.0) {
                return Err(field_err("adev_points.tau_s", t));
            }
            if !(s.is_finite() && s > 0.0) {
                return Err(field_err("adev_points.sigma_y", s));
            }
        }
        for (name, v) in [
            ("aging_per_day", Some(self.aging_per_day)),
            ("temp_coeff_per_k", self.temp_coeff_per_k),
            ("g_sensitivity_per_g", self.g_sensitivity_per_g),
            ("initial_accuracy", self.initial_accuracy),
            ("power_w", self.power_w),
        ] {
            if let Some(v) = v {
                if !(v.is_finite() && v >= 0.0) {
                    return Err(field_err(name, v));
                }
            }
        }
        Ok(())
    }
}

/// A clock named by preset id or given in full.
#[derive(Clone, Debug, PartialEq, Serialize, Deserialize)]
#[serde(untagged)]
pub enum ClockRef {
    /// One of the preset ids of [`crate::telecom_timing::PRESETS`].
    Preset(String),
    /// A full specification.
    Spec(OscSpec),
}

impl ClockRef {
    /// The specification this names, validated.
    pub fn resolve(&self) -> Result<OscSpec, String> {
        let spec = match self {
            ClockRef::Preset(id) => OscSpec::from_preset(id).ok_or_else(|| {
                let known: Vec<&str> = PRESETS.iter().map(|p| p.id).collect();
                crate::terr!(
                    "e-oscillator-unknown-clock",
                    id = id.as_str(),
                    known = known.join(", ")
                )
            })?,
            ClockRef::Spec(s) => s.clone(),
        };
        spec.validate()?;
        Ok(spec)
    }
}

/// The error for a field whose value is out of range.
pub(crate) fn field_err(field: &str, value: f64) -> String {
    crate::terr!("e-oscillator-field", field = field, value = value)
}

/// Require a finite value above zero.
pub(crate) fn positive(field: &str, v: f64) -> Result<f64, String> {
    if v.is_finite() && v > 0.0 {
        Ok(v)
    } else {
        Err(field_err(field, v))
    }
}

/// Run one part on JSON input text and return the report as pretty JSON.
pub fn run_json(part: &str, text: &str) -> Result<String, String> {
    fn parse<T: serde::de::DeserializeOwned>(part: &str, text: &str) -> Result<T, String> {
        serde_json::from_str(text)
            .map_err(|e| crate::terr!("e-oscillator-input", part = part, e = e.to_string()))
    }
    fn out<T: Serialize>(v: &T) -> Result<String, String> {
        serde_json::to_string_pretty(v).map_err(|e| e.to_string())
    }
    match part {
        "vibration" => out(&vibration::run(&parse(part, text)?)?),
        "holdover" => out(&environment::run(&parse(part, text)?)?),
        "select" => out(&select::run(&parse(part, text)?)?),
        "raim-aid" => out(&raim_aid::run(&parse(part, text)?)?),
        "datasheet" => out(&datasheet::run(&parse(part, text)?)?),
        _ => Err(crate::t!("oscillator-usage")),
    }
}

/// `kshana oscillator <part> <input.json>`, or `kshana oscillator refs`.
pub fn run(args: &[String]) -> Result<(), String> {
    match args {
        [p] if p == "refs" => {
            println!(
                "{}",
                serde_json::to_string_pretty(&refs::report()).map_err(|e| e.to_string())?
            );
            Ok(())
        }
        [part, path] if !path.starts_with("--") => {
            let text = std::fs::read_to_string(path).map_err(|e| format!("{path}: {e}"))?;
            println!("{}", run_json(part, &text)?);
            Ok(())
        }
        _ => Err(crate::t!("oscillator-usage")),
    }
}
