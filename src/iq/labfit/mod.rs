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
//!
//! **From IQ campaigns.** A scenario whose `[input]` names `campaign = "<out-dir>"` fits a
//! `kshana iq campaign` output folder instead (`docs/design/LABFIT-FROM-IQ.md`): the loader
//! ([`campaign`]) groups the scored cells into fit units, the C/N0 model ([`cn0`]) is fitted
//! to measured C/N0 against stated J/S, the lock models are coupled through it, and the
//! seeded cluster bootstrap, hold-outs and `[validation]` bars are computed ([`iqfit`]).
//! Its report is `kshana.labfit-iq/1` ([`iqreport`]). The receiver-log path is unchanged.

pub mod campaign;
pub mod cn0;
pub mod fit;
pub mod iqfit;
pub mod iqreport;
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

/// Make every relative log path in `sc`, and a relative `[input] campaign` folder, relative to
/// `base` (the scenario file's folder).
pub fn resolve_paths(sc: &mut LabFitScenario, base: &std::path::Path) {
    if let Some(c) = sc.input.as_mut().and_then(|i| i.campaign.as_mut()) {
        if std::path::Path::new(c.as_str()).is_relative() {
            *c = base.join(c.as_str()).to_string_lossy().into_owned();
        }
    }
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

/// The campaign-fit report in every output form.
#[derive(Clone, Debug, PartialEq)]
pub struct LabFitIqOutput {
    /// The structured report.
    pub report: iqfit::LabFitIqReport,
    /// [`iqreport::to_json`].
    pub json: String,
    /// [`iqreport::residuals_csv`].
    pub residuals_csv: String,
    /// [`iqreport::predictions_csv`].
    pub predictions_csv: String,
    /// [`iqreport::to_markdown`].
    pub markdown: String,
}

/// The campaign folder a scenario names in `[input] campaign`, if any.
pub fn campaign_dir(sc: &LabFitScenario) -> Option<&str> {
    sc.input.as_ref().and_then(|i| i.campaign.as_deref())
}

/// Run a campaign-fit scenario: load the campaign folder it names (a relative path is taken
/// relative to the working directory; see [`resolve_paths`]), fit, and render every form.
pub fn run_campaign_scenario(sc: &LabFitScenario) -> Result<LabFitIqOutput, String> {
    let dir = campaign_dir(sc).ok_or("the scenario's [input] names no campaign")?;
    if !sc.runs.is_empty() {
        return Err("[input] campaign and [[runs]] are exclusive: give one".into());
    }
    let data = campaign::load(std::path::Path::new(dir))?;
    let report = iqfit::analyse(&data, sc)?;
    Ok(LabFitIqOutput {
        json: iqreport::to_json(&report),
        residuals_csv: iqreport::residuals_csv(&report),
        predictions_csv: iqreport::predictions_csv(&report),
        markdown: iqreport::to_markdown(&report),
        report,
    })
}

/// The output of either path, as the surfaces return it: the JSON report and its CSV and
/// Markdown views.
pub fn run_toml_views(src: &str) -> Result<[String; 4], String> {
    let sc: LabFitScenario = toml::from_str(src).map_err(|e| format!("iq-labfit scenario: {e}"))?;
    if campaign_dir(&sc).is_some() {
        let o = run_campaign_scenario(&sc)?;
        Ok([o.json, o.residuals_csv, o.predictions_csv, o.markdown])
    } else {
        let o = run_scenario(&sc)?;
        Ok([o.json, o.residuals_csv, o.predictions_csv, o.markdown])
    }
}

/// Parse a TOML scenario and run it. Relative log paths are read relative to the
/// working directory.
pub fn run_toml(src: &str) -> Result<LabFitOutput, String> {
    let sc: LabFitScenario = toml::from_str(src).map_err(|e| format!("iq-labfit scenario: {e}"))?;
    run_scenario(&sc)
}
