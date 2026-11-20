// SPDX-License-Identifier: AGPL-3.0-only
//! A datasheet's Allan deviation points as a power-law model, and the time deviation (TDEV) the model
//! implies.
//!
//! The model is the envelope fit of [`crate::telecom_timing::fit_noise`] with the flicker-floor rule
//! ([`crate::telecom_timing::FLICKER_FLOOR_RULE`]): `σ_y²(τ) = w/τ + f + r·τ` (white, flicker and
//! random-walk frequency noise), scaled so that it is at or above every stated point. At each stated
//! point the report gives the model and the ratio model/datasheet (at least 1 by construction; how far
//! above 1 says how well three power laws describe the sheet).
//!
//! TDEV follows from the modified Allan variance, `TDEV(τ) = τ/√3 · MDEV(τ)`, and for each power law
//! the modified Allan variance is a fixed fraction of the Allan variance at large averaging factors:
//! 1/2 for white FM, 27/40 for flicker FM (`(27/20)·ln2·h₋₁` over `2·ln2·h₋₁`) and 33/40 for
//! random-walk FM (`(11/20)·π²·h₋₂·τ` over `(2/3)·π²·h₋₂·τ`) (Riley, *Handbook of Frequency Stability
//! Analysis*, NIST SP 1065, 2008, the modified Allan variance section). So
//! `TDEV²(τ) = τ²/3 · (w/(2τ) + (27/40)·f + (33/40)·r·τ)`. A test checks the white-FM case against
//! [`crate::allan::time_deviation`] on a synthetic series.
//!
//! MODELLED: the TDEV is the model's, derived from the sheet's Allan deviation, not a TDEV the sheet
//! states. Where a sheet states TDEV points, give them as `tdev_points` and the report lists the ratio
//! at each.

use super::{field_err, ClockRef, LABEL};
use crate::telecom_timing::NoiseFit;
use serde::{Deserialize, Serialize};

/// Input of `kshana oscillator datasheet`.
#[derive(Clone, Debug, PartialEq, Serialize, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct DatasheetInput {
    /// The clock (its `adev_points` are the datasheet's).
    pub clock: ClockRef,
    /// Datasheet TDEV points `[tau_s, tdev_s]`, when the sheet states any.
    #[serde(default)]
    pub tdev_points: Vec<(f64, f64)>,
    /// Averaging times to tabulate the model at, s (default: decades from 1 s to 1e5 s).
    #[serde(default)]
    pub taus: Vec<f64>,
}

/// One stated point against the model.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct PointCheck {
    /// Averaging time, s.
    pub tau_s: f64,
    /// The datasheet value.
    pub datasheet: f64,
    /// The model value.
    pub model: f64,
    /// model / datasheet.
    pub ratio: f64,
}

/// One tabulated averaging time.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct CurvePoint {
    /// Averaging time, s.
    pub tau_s: f64,
    /// Model Allan deviation.
    pub adev: f64,
    /// Model modified Allan deviation.
    pub mdev: f64,
    /// Model time deviation, s.
    pub tdev_s: f64,
}

/// The fitted levels.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct FitLevels {
    /// White FM, Allan variance at 1 s.
    pub white: f64,
    /// Flicker FM floor, Allan variance.
    pub flicker: f64,
    /// Random-walk FM, Allan variance per second.
    pub random_walk: f64,
    /// Envelope scale applied.
    pub envelope_scale: f64,
}

/// Report of `kshana oscillator datasheet`.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct DatasheetReport {
    /// Evidence label.
    pub label: &'static str,
    /// The clock's id.
    pub clock: String,
    /// The clock's source document.
    pub source: String,
    /// Fitted levels.
    pub fit: FitLevels,
    /// The stated Allan deviation points against the model.
    pub adev_check: Vec<PointCheck>,
    /// The stated TDEV points against the model.
    pub tdev_check: Vec<PointCheck>,
    /// The model curve.
    pub curve: Vec<CurvePoint>,
}

/// Modified Allan deviation of the three-term model.
pub fn model_mdev(n: &NoiseFit, tau: f64) -> f64 {
    (0.5 * n.white / tau + 27.0 / 40.0 * n.flicker + 33.0 / 40.0 * n.random_walk * tau).sqrt()
}

/// Time deviation of the three-term model, s.
pub fn model_tdev(n: &NoiseFit, tau: f64) -> f64 {
    tau / 3f64.sqrt() * model_mdev(n, tau)
}

/// Run the check.
pub fn run(inp: &DatasheetInput) -> Result<DatasheetReport, String> {
    let spec = inp.clock.resolve()?;
    if inp.tdev_points.len() > 1000 || inp.taus.len() > 1000 {
        return Err(field_err("entries", 1000.0));
    }
    for &(t, v) in &inp.tdev_points {
        super::positive("tdev_points.tau_s", t)?;
        super::positive("tdev_points.tdev_s", v)?;
    }
    for &t in &inp.taus {
        super::positive("taus", t)?;
    }
    let n = spec.noise();
    let check = |pts: &[(f64, f64)], f: &dyn Fn(f64) -> f64| -> Vec<PointCheck> {
        pts.iter()
            .map(|&(t, v)| {
                let m = f(t);
                PointCheck {
                    tau_s: t,
                    datasheet: v,
                    model: m,
                    ratio: m / v,
                }
            })
            .collect()
    };
    let taus = if inp.taus.is_empty() {
        vec![1.0, 10.0, 100.0, 1e3, 1e4, 1e5]
    } else {
        inp.taus.clone()
    };
    Ok(DatasheetReport {
        label: LABEL,
        clock: spec.id.clone(),
        source: spec.source.clone(),
        fit: FitLevels {
            white: n.white,
            flicker: n.flicker,
            random_walk: n.random_walk,
            envelope_scale: n.envelope_scale,
        },
        adev_check: check(&spec.adev_points, &|t| n.adev(t)),
        tdev_check: check(&inp.tdev_points, &|t| model_tdev(&n, t)),
        curve: taus
            .iter()
            .map(|&t| CurvePoint {
                tau_s: t,
                adev: n.adev(t),
                mdev: model_mdev(&n, t),
                tdev_s: model_tdev(&n, t),
            })
            .collect(),
    })
}
