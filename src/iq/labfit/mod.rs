// SPDX-License-Identifier: AGPL-3.0-only
//! **Lab fit: the open receiver's lock models fitted to a real receiver's observed loss
//! of lock and reacquisition in lab runs.**
//!
//! Input is a set of lab runs. Each is a receiver log, read into a
//! [`crate::receiver_trust::Timeline`] by the `receiver-trust` readers (UBX, RINEX,
//! Android, NMEA), plus the run's stated test conditions: event onset and offset, a
//! power level (C/N0 drop or J/S, dB) that may step or ramp over time, and the platform
//! dynamics ([`schema`]). From each timeline the per-satellite first loss of lock after
//! onset, the reacquisition after it, and the reported C/N0 under interference are read
//! ([`observe`]).
//!
//! Two models are fitted ([`model`], [`fit`]):
//!
//! * the **tracking-loop** model of [`crate::tracking_loop`], whose drop and re-lock
//!   thresholds follow from loop noise bandwidth, integration time, correlator spacing
//!   and dynamics; the carrier-loop bandwidth, the pull-in bandwidth ratio and the two
//!   confirmation dwells are fitted, the rest is stated;
//! * a per-receiver **empirical** baseline: drop C/N0, hysteresis and the two dwells.
//!
//! A level-calibration offset is fitted first from reported C/N0 against stated level.
//! The fit is bounded least squares on event times (a grid, then Nelder-Mead,
//! [`optim`]); uncertainty is a seeded bootstrap over runs; the hold-out error is
//! leave-one-run-out or k-fold, split into interpolation and extrapolation. Predictions
//! for conditions between and beyond the tested ones are labelled `PREDICTION` with the
//! nearest tested run and the extrapolation distance. The report ([`report`]) is JSON,
//! CSV and markdown, and every row carries the SHA-256 of the log it came from.
//!
//! **Honest labels.** Every fitted number is **MODELLED**: it is the open model fitted to
//! observed behaviour, with the fit error stated, and makes no claim about a commercial
//! receiver's internals. The fit's own correctness is tested on synthetic runs from known
//! parameters ([`synth`]) and Nelder-Mead against the Rosenbrock closed form; no real-
//! receiver fit has been checked against an independent oracle. The bundled JammerTest
//! 2024 fixtures carry pseudoranges but no C/N0, so a run built on them is reported as
//! unusable rather than fitted.

pub mod fit;
pub mod model;
pub mod observe;
pub mod optim;
pub mod report;
pub mod schema;
pub mod synth;

pub use fit::{analyse, LabFitReport, LabRun};
pub use model::ModelKind;
pub use schema::LabFitScenario;

use sha2::{Digest, Sha256};

use crate::receiver_trust::ingest::read_log;
use crate::receiver_trust::scenario::load_source;
use crate::receiver_trust::LogFormat;

/// The report in every output form.
#[derive(Clone, Debug, PartialEq)]
pub struct LabFitOutput {
    /// The structured report.
    pub report: LabFitReport,
    /// [`report::to_json`].
    pub json: String,
    /// [`report::residuals_csv`].
    pub residuals_csv: String,
    /// [`report::predictions_csv`].
    pub predictions_csv: String,
    /// [`report::to_markdown`].
    pub markdown: String,
}

fn format_name(f: LogFormat) -> &'static str {
    match f {
        LogFormat::Ubx => "ubx log",
        LogFormat::Rinex => "rinex log",
        LogFormat::Android => "android log",
        LogFormat::Nmea => "nmea log",
    }
}

/// Read every run's log: bytes from `path`, `text` or `base64`, SHA-256 of the bytes,
/// then the `receiver-trust` reader for its format.
pub fn load_runs(sc: &LabFitScenario) -> Result<Vec<LabRun>, String> {
    sc.runs
        .iter()
        .map(|r| {
            let bytes = load_source(&r.log.source, &format!("run `{}` log", r.label))?;
            let timeline =
                read_log(r.log.format, &bytes).map_err(|e| format!("run `{}`: {e}", r.label))?;
            Ok(LabRun {
                label: r.label.clone(),
                sha256: format!("{:x}", Sha256::digest(&bytes)),
                source: format_name(r.log.format).into(),
                timeline,
                conditions: r.conditions.clone(),
            })
        })
        .collect()
}

/// Make every relative log path in `sc` relative to `base` (the scenario file's folder).
pub fn resolve_paths(sc: &mut LabFitScenario, base: &std::path::Path) {
    for r in &mut sc.runs {
        if let Some(p) = &r.log.source.path {
            let pb = std::path::Path::new(p);
            if pb.is_relative() {
                r.log.source.path = Some(base.join(pb).to_string_lossy().into_owned());
            }
        }
    }
}

/// Run a parsed scenario: load the logs, fit, predict, and render every output form.
pub fn run_scenario(sc: &LabFitScenario) -> Result<LabFitOutput, String> {
    let runs = load_runs(sc)?;
    let report = analyse(&runs, sc)?;
    Ok(LabFitOutput {
        json: report::to_json(&report),
        residuals_csv: report::residuals_csv(&report),
        predictions_csv: report::predictions_csv(&report),
        markdown: report::to_markdown(&report),
        report,
    })
}

/// Parse a TOML scenario and run it. Relative log paths are read relative to the
/// working directory.
pub fn run_toml(src: &str) -> Result<LabFitOutput, String> {
    let sc: LabFitScenario = toml::from_str(src).map_err(|e| format!("iq-labfit scenario: {e}"))?;
    run_scenario(&sc)
}
