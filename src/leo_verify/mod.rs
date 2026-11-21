// SPDX-License-Identifier: AGPL-3.0-only
//! Verification tools for low-Earth-orbit positioning, navigation and timing (LEO-PNT): what a LEO
//! timing or positioning service would deliver under stated conditions, computed from open models so
//! that a buyer, a test house or an integrator can check a claim before relying on it.
//!
//! The command is `kshana leo-verify <part> <input.json>` (documentation: `docs/LEO-VERIFY.md`):
//!
//! | part | module | what it answers |
//! |---|---|---|
//! | `burst-timing` | [`burst`] | the time error of a receiver disciplined by short LEO bursts (a burst schedule, an oscillator, an outage), with its TDEV and MTIE, and the longest gap a threshold allows |
//! | `holdover-tdev` | [`tdev`] | the TDEV an oscillator's datasheet Allan deviation predicts, term by term, optionally checked against a simulated phase record of the same model |
//! | `cost` | [`cost`] | per GNSS outage length, which timing option holds a time-error threshold, and the cost of ownership of each option (unranked; the non-dominated set is listed) |
//! | `indoor` | [`indoor`] | building entry loss (ITU-R P.2109) for LEO and GNSS signals and the C/N0 margin left indoors |
//! | `rain-fade` | [`rain`] | rain attenuation exceeded against time percentage (ITU-R P.618) and the availability a link margin buys, per band and elevation |
//! | `rtk-ar` | [`rtk_ar`] | cascaded integer ambiguity resolution success rates for any set of carriers (for example L band with C band) |
//! | `jam-claim` | [`jam_claim`] | what a stated received-power advantage means for jamming: the J/S each signal tolerates and the free-space denial radius of a stated jammer |
//! | `doppler-integrity` | [`doppler_integrity`] | protection levels of a Doppler-only LEO fix (weighted slope method) over a Walker constellation at any latitude, with an optional injected fault |
//!
//! # Evidence
//!
//! Everything here is MODELLED: closed forms and simulations of stated inputs, none of them a
//! measurement of a service or a receiver. The ITU-R procedures are the engine's existing
//! implementations ([`crate::leo_link::itu`]); the TDEV predictor is checked against simulated phase
//! records of the same noise model (tests in [`tdev`]). No output says a system or receiver meets a
//! requirement; a row says only whether a modelled figure is above or below a stated threshold.

pub mod burst;
pub mod cost;
pub mod doppler_integrity;
pub mod indoor;
pub mod jam_claim;
pub mod rain;
pub mod rtk_ar;
pub mod tdev;

use serde::Serialize;

/// The evidence label every report of this module carries.
pub const LABEL: &str = "MODELLED";

/// The parts `kshana leo-verify` accepts.
pub const PARTS: &[&str] = &[
    "burst-timing",
    "holdover-tdev",
    "cost",
    "indoor",
    "rain-fade",
    "rtk-ar",
    "jam-claim",
    "doppler-integrity",
];

/// The error for a field whose value is out of range.
pub(crate) fn field_err(field: &str, value: f64) -> String {
    crate::terr!("e-leo-verify-field", field = field, value = value)
}

/// Require a finite value above zero.
pub(crate) fn positive(field: &str, v: f64) -> Result<f64, String> {
    if v.is_finite() && v > 0.0 {
        Ok(v)
    } else {
        Err(field_err(field, v))
    }
}

/// Require a finite value at or above zero.
pub(crate) fn non_negative(field: &str, v: f64) -> Result<f64, String> {
    if v.is_finite() && v >= 0.0 {
        Ok(v)
    } else {
        Err(field_err(field, v))
    }
}

/// Require a finite value in `[lo, hi]`.
pub(crate) fn within(field: &str, v: f64, lo: f64, hi: f64) -> Result<f64, String> {
    if v.is_finite() && v >= lo && v <= hi {
        Ok(v)
    } else {
        Err(field_err(field, v))
    }
}

/// Require a list length in `[1, max]`.
pub(crate) fn list_len(field: &str, n: usize, max: usize) -> Result<(), String> {
    if n == 0 || n > max {
        Err(field_err(field, n as f64))
    } else {
        Ok(())
    }
}

/// Reject a run whose work exceeds `max` steps.
pub(crate) fn work_limit(n: f64, max: f64) -> Result<(), String> {
    if n.is_finite() && n <= max {
        Ok(())
    } else {
        Err(crate::terr!("e-leo-verify-too-large", n = n, max = max))
    }
}

/// A report: the part, the evidence label and the part's result.
#[derive(Debug, Serialize)]
pub struct Report<T: Serialize> {
    /// The part that produced it.
    pub part: &'static str,
    /// Always [`LABEL`].
    pub label: &'static str,
    /// The result.
    pub result: T,
}

fn wrap<T: Serialize>(part: &'static str, result: T) -> Result<String, String> {
    serde_json::to_string_pretty(&Report {
        part,
        label: LABEL,
        result,
    })
    .map_err(|e| e.to_string())
}

/// Run one part on JSON input text and return the report as pretty JSON.
pub fn run_json(part: &str, text: &str) -> Result<String, String> {
    fn parse<T: serde::de::DeserializeOwned>(part: &str, text: &str) -> Result<T, String> {
        serde_json::from_str(text)
            .map_err(|e| crate::terr!("e-leo-verify-input", part = part, e = e.to_string()))
    }
    match part {
        "burst-timing" => wrap("burst-timing", burst::run(&parse(part, text)?)?),
        "holdover-tdev" => wrap("holdover-tdev", tdev::run(&parse(part, text)?)?),
        "cost" => wrap("cost", cost::run(&parse(part, text)?)?),
        "indoor" => wrap("indoor", indoor::run(&parse(part, text)?)?),
        "rain-fade" => wrap("rain-fade", rain::run(&parse(part, text)?)?),
        "rtk-ar" => wrap("rtk-ar", rtk_ar::run(&parse(part, text)?)?),
        "jam-claim" => wrap("jam-claim", jam_claim::run(&parse(part, text)?)?),
        "doppler-integrity" => wrap(
            "doppler-integrity",
            doppler_integrity::run(&parse(part, text)?)?,
        ),
        _ => Err(crate::t!("leo-verify-usage")),
    }
}

/// `kshana leo-verify <part> <input.json>`.
pub fn run(args: &[String]) -> Result<(), String> {
    match args {
        [part, path] if !path.starts_with("--") && PARTS.contains(&part.as_str()) => {
            let text = std::fs::read_to_string(path).map_err(|e| format!("{path}: {e}"))?;
            println!("{}", run_json(part, &text)?);
            Ok(())
        }
        _ => Err(crate::t!("leo-verify-usage")),
    }
}
