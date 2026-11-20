// SPDX-License-Identifier: AGPL-3.0-only
//! Oscillator selection aid: each candidate's stated figures checked against stated requirements.
//!
//! Every requirement is optional; each candidate gets one check per requirement given, with status
//! `pass`, `fail` or `unknown` (the candidate's datasheet does not state the figure the check needs;
//! nothing is assumed in its place), or `info` for a figure reported without a limit. Candidates are
//! listed in the order given and are not ranked or scored against each other: the output is the
//! requirement table, and the choice stays with the reader. The same checks serve as readiness tests
//! for a clock that exists only as a target specification (enter the target figures as an
//! [`super::OscSpec`]).
//!
//! The checks:
//!
//! * `holdover`: [`super::environment`] with the requirement's temperature profile; passes when the
//!   bound stays under the time-error limit for the duration.
//! * `cold_start_search`: the frequency uncertainty at switch-on, `δ = initial accuracy + ageing per
//!   day × days since calibration + k_T × |ΔT|`, widens the Doppler search to
//!   `2·(f_D + f_L·δ)` Hz; with bins of `2/(3T)` Hz for coherent integration `T` (the usual
//!   acquisition bin of Kaplan and Hegarty, 2006, chapter 5) the search factor is the number of bins
//!   over the number with a perfect oscillator. A modelled proxy for the frequency part of the
//!   time to first fix (TTFF), not a TTFF.
//! * `vibration`: [`super::vibration`] with the candidate's acceleration sensitivity; passes when the
//!   whole-band tracking threshold is at or below the stated C/N0.
//! * `adev`: the candidate's power-law model at each required averaging time, at or below the limit.
//! * `power`: the stated steady-state power at or below the limit.
//!
//! MODELLED throughout.

use super::environment::{self, EnvHoldoverInput, TemperatureProfile};
use super::vibration::{self, PllConfig, SineLine, VibrationInput};
use super::{field_err, positive, ClockRef, OscSpec, LABEL};
use crate::telecom_timing::PRESETS;
use serde::{Deserialize, Serialize};

/// Holdover requirement.
#[derive(Clone, Debug, PartialEq, Serialize, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct HoldoverReq {
    /// How long the holdover must last, s.
    pub duration_s: f64,
    /// Largest time error allowed, s.
    pub max_time_error_s: f64,
    /// Multiplier on the one-sigma stochastic part (default 1).
    #[serde(default)]
    pub k_sigma: Option<f64>,
    /// Ambient temperature during the holdover.
    #[serde(default)]
    pub temperature: Option<TemperatureProfile>,
}

/// Cold-start search requirement.
#[derive(Clone, Debug, PartialEq, Serialize, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct ColdStartReq {
    /// Carrier frequency, Hz.
    pub carrier_hz: f64,
    /// Largest Doppler from satellite and receiver motion, Hz (one side).
    pub doppler_hz: f64,
    /// Coherent integration time of the search, s.
    pub coherent_s: f64,
    /// Days since the oscillator's frequency was last known.
    #[serde(default)]
    pub days_since_calibration: f64,
    /// Temperature change since then, K.
    #[serde(default)]
    pub temperature_delta_k: f64,
    /// Largest search factor allowed (absent: reported as `info`).
    #[serde(default)]
    pub max_search_factor: Option<f64>,
}

/// Vibration requirement.
#[derive(Clone, Debug, PartialEq, Serialize, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct VibrationReq {
    /// Carrier frequency, Hz.
    pub carrier_hz: f64,
    /// Random-vibration profile `[f_hz, g2_per_hz]`.
    #[serde(default)]
    pub random: Vec<(f64, f64)>,
    /// Sinusoidal lines.
    #[serde(default)]
    pub sine: Vec<SineLine>,
    /// The tracking loop.
    #[serde(rename = "loop")]
    pub pll: PllConfig,
    /// The weakest signal that must stay tracked, dB-Hz.
    pub min_cn0_dbhz: f64,
}

/// The requirements; every one is optional.
#[derive(Clone, Debug, Default, PartialEq, Serialize, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct Requirements {
    /// Holdover.
    #[serde(default)]
    pub holdover: Option<HoldoverReq>,
    /// Cold-start search.
    #[serde(default)]
    pub cold_start: Option<ColdStartReq>,
    /// Vibration.
    #[serde(default)]
    pub vibration: Option<VibrationReq>,
    /// Allan deviation limits `[tau_s, sigma_y_max]`.
    #[serde(default)]
    pub adev_max: Vec<(f64, f64)>,
    /// Power limit, W.
    #[serde(default)]
    pub power_max_w: Option<f64>,
}

/// Input of `kshana oscillator select`.
#[derive(Clone, Debug, PartialEq, Serialize, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct SelectInput {
    /// Candidates (default: every preset).
    #[serde(default)]
    pub candidates: Vec<ClockRef>,
    /// Requirements.
    pub requirements: Requirements,
}

/// One check of one candidate.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct Check {
    /// `holdover`, `cold_start_search`, `vibration`, `adev` or `power`.
    pub check: &'static str,
    /// `pass`, `fail`, `unknown` or `info`.
    pub status: &'static str,
    /// The candidate's figure (`null` when unknown).
    pub value: Option<f64>,
    /// The limit (`null` for `info`).
    pub limit: Option<f64>,
    /// Unit of the value and limit.
    pub unit: &'static str,
    /// For `adev`, the averaging time, s.
    #[serde(skip_serializing_if = "Option::is_none")]
    pub tau_s: Option<f64>,
}

/// One candidate's checks.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct CandidateReport {
    /// Candidate id.
    pub id: String,
    /// Source document.
    pub source: String,
    /// The checks, in requirement order.
    pub checks: Vec<Check>,
    /// Number of checks passed.
    pub passed: usize,
    /// Number of checks failed.
    pub failed: usize,
    /// Number of checks with an unknown figure.
    pub unknown: usize,
}

/// Report of `kshana oscillator select`.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct SelectReport {
    /// Evidence label.
    pub label: &'static str,
    /// The candidates, in input order (not ranked).
    pub candidates: Vec<CandidateReport>,
}

fn status(ok: bool) -> &'static str {
    if ok {
        "pass"
    } else {
        "fail"
    }
}

/// The cold-start search factor for a frequency uncertainty `delta`.
pub fn search_factor(req: &ColdStartReq, delta: f64) -> f64 {
    let bin = 2.0 / (3.0 * req.coherent_s);
    let bins = |d: f64| {
        (2.0 * (req.doppler_hz + req.carrier_hz * d) / bin)
            .ceil()
            .max(1.0)
    };
    bins(delta) / bins(0.0)
}

fn check_candidate(spec: &OscSpec, req: &Requirements) -> Result<CandidateReport, String> {
    let mut checks = Vec::new();
    if let Some(h) = &req.holdover {
        let r = environment::run(&EnvHoldoverInput {
            clock: ClockRef::Spec(spec.clone()),
            duration_s: h.duration_s,
            step_s: None,
            threshold_s: h.max_time_error_s,
            k_sigma: h.k_sigma.unwrap_or(1.0),
            initial_freq_offset: 0.0,
            temperature: h.temperature.clone(),
            shocks: vec![],
        })?;
        let unknown = h.temperature.is_some() && spec.temp_coeff_per_k.is_none();
        checks.push(Check {
            check: "holdover",
            status: if unknown {
                "unknown"
            } else {
                status(r.holdover_s.is_none())
            },
            value: Some(r.holdover_s.unwrap_or(h.duration_s)),
            limit: Some(h.duration_s),
            unit: "s",
            tau_s: None,
        });
    }
    if let Some(c) = &req.cold_start {
        let delta = spec
            .initial_accuracy
            .zip(spec.temp_coeff_per_k)
            .map(|(a, k)| {
                a + spec.aging_per_day * c.days_since_calibration + k * c.temperature_delta_k.abs()
            });
        let f = delta.map(|d| search_factor(c, d));
        checks.push(Check {
            check: "cold_start_search",
            status: match (f, c.max_search_factor) {
                (None, _) => "unknown",
                (Some(_), None) => "info",
                (Some(f), Some(m)) => status(f <= m),
            },
            value: f,
            limit: c.max_search_factor,
            unit: "factor",
            tau_s: None,
        });
    }
    if let Some(v) = &req.vibration {
        let thr = match spec.g_sensitivity_per_g {
            None => None,
            Some(g) => {
                let r = vibration::run(&VibrationInput {
                    carrier_hz: v.carrier_hz,
                    g_sensitivity_per_g: g,
                    random: v.random.clone(),
                    sine: v.sine.clone(),
                    pll: v.pll.clone(),
                    adev_at_loop: Some(spec.noise().adev(1.0 / v.pll.bandwidth_hz)),
                    clock: None,
                    cn0_dbhz: vec![],
                })?;
                // Not trackable at any C/N0: an infinite threshold.
                Some(r.thresholds.whole_band_dbhz.unwrap_or(f64::INFINITY))
            }
        };
        checks.push(Check {
            check: "vibration",
            status: thr.map_or("unknown", |t| status(t <= v.min_cn0_dbhz)),
            value: thr.filter(|t| t.is_finite()),
            limit: Some(v.min_cn0_dbhz),
            unit: "dB-Hz",
            tau_s: None,
        });
    }
    let noise = spec.noise();
    for &(tau, max) in &req.adev_max {
        let a = noise.adev(tau);
        checks.push(Check {
            check: "adev",
            status: status(a <= max),
            value: Some(a),
            limit: Some(max),
            unit: "1",
            tau_s: Some(tau),
        });
    }
    if let Some(pmax) = req.power_max_w {
        checks.push(Check {
            check: "power",
            status: spec.power_w.map_or("unknown", |p| status(p <= pmax)),
            value: spec.power_w,
            limit: Some(pmax),
            unit: "W",
            tau_s: None,
        });
    }
    let count = |s: &str| checks.iter().filter(|c| c.status == s).count();
    Ok(CandidateReport {
        id: spec.id.clone(),
        source: spec.source.clone(),
        passed: count("pass"),
        failed: count("fail"),
        unknown: count("unknown"),
        checks,
    })
}

fn validate(req: &Requirements) -> Result<(), String> {
    if let Some(c) = &req.cold_start {
        positive("cold_start.carrier_hz", c.carrier_hz)?;
        positive("cold_start.coherent_s", c.coherent_s)?;
        for (n, v) in [
            ("cold_start.doppler_hz", c.doppler_hz),
            (
                "cold_start.days_since_calibration",
                c.days_since_calibration,
            ),
        ] {
            if !(v.is_finite() && v >= 0.0) {
                return Err(field_err(n, v));
            }
        }
        if !c.temperature_delta_k.is_finite() {
            return Err(field_err(
                "cold_start.temperature_delta_k",
                c.temperature_delta_k,
            ));
        }
    }
    if let Some(v) = &req.vibration {
        if !v.min_cn0_dbhz.is_finite() {
            return Err(field_err("vibration.min_cn0_dbhz", v.min_cn0_dbhz));
        }
    }
    if req.adev_max.len() > 1000 {
        return Err(field_err("adev_max", req.adev_max.len() as f64));
    }
    for &(t, a) in &req.adev_max {
        positive("adev_max.tau_s", t)?;
        positive("adev_max.sigma_y", a)?;
    }
    if let Some(p) = req.power_max_w {
        positive("power_max_w", p)?;
    }
    Ok(())
}

/// Run the selection aid.
pub fn run(inp: &SelectInput) -> Result<SelectReport, String> {
    validate(&inp.requirements)?;
    let refs: Vec<ClockRef> = if inp.candidates.is_empty() {
        PRESETS
            .iter()
            .map(|p| ClockRef::Preset(p.id.to_string()))
            .collect()
    } else {
        inp.candidates.clone()
    };
    if refs.len() > 20 {
        return Err(field_err("candidates", refs.len() as f64));
    }
    let candidates = refs
        .iter()
        .map(|r| check_candidate(&r.resolve()?, &inp.requirements))
        .collect::<Result<Vec<_>, String>>()?;
    Ok(SelectReport {
        label: LABEL,
        candidates,
    })
}
