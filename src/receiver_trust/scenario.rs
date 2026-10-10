// SPDX-License-Identifier: AGPL-3.0-only
//! The `receiver-trust` scenario: input, run, comparison and report.
//!
//! A scenario names one receiver log (by path in native builds, or inline as text or
//! base64 so the WebAssembly build, the Python bindings and the Model Context Protocol
//! (MCP) server can pass the bytes), optionally a RINEX broadcast navigation file for the
//! engine's own fix, the monitor parameters, and, optionally, the events and predictions
//! the log is to be compared with. Every tolerance is part of the scenario, so it is
//! stated before the run and hashed into the result with the log's own SHA-256.

use crate::chart::esc;
use crate::palette::chart::{AMBER, BG, BLUE, CORAL, FONT_SANS, INK, LIME, MUTED, RULE, TITLE};
use serde::{Deserialize, Serialize};
use sha2::{Digest, Sha256};

use super::ingest::read_log;
use super::live::LiveCfg;
use super::maritime::MaritimeConfig;
use super::monitors::{
    run_monitors, AlarmRun, Baseline, EngineFixInput, EpochTrust, Monitor, MonitorConfig,
    TrustState,
};
use super::platform::PlatformCfg;
use super::score::ScoreCfg;
use super::LogFormat;

/// Where a file's bytes come from: exactly one of `path` (native builds only), `text`
/// (a text format pasted inline) or `base64` (any format, standard RFC 4648 alphabet).
#[derive(Clone, Debug, Default, Serialize, Deserialize, PartialEq)]
#[serde(deny_unknown_fields)]
pub struct FileSource {
    /// Path to the file, read relative to the working directory.
    #[serde(default)]
    pub path: Option<String>,
    /// The file's content as text.
    #[serde(default)]
    pub text: Option<String>,
    /// The file's content, base64-encoded.
    #[serde(default)]
    pub base64: Option<String>,
}

/// The receiver log to assess.
#[derive(Clone, Debug, Serialize, Deserialize, PartialEq)]
#[serde(deny_unknown_fields)]
pub struct LogCfg {
    /// Log format: `ubx`, `rinex`, `android` or `nmea`.
    pub format: LogFormat,
    /// The log's bytes.
    #[serde(flatten)]
    pub source: FileSource,
    /// A RINEX 3 broadcast navigation file for the same day. With a `rinex` log it lets
    /// the engine form its own single-point fix, run receiver autonomous integrity
    /// monitoring (RAIM) and the clock-aided monitor.
    #[serde(default)]
    pub nav: Option<FileSource>,
}

/// What kind of interference an event is.
#[derive(Clone, Copy, Debug, PartialEq, Eq, Serialize, Deserialize)]
#[serde(rename_all = "kebab-case")]
pub enum EventKind {
    /// Jamming: power denial of the band.
    Jamming,
    /// Spoofing or meaconing: counterfeit signals.
    Spoofing,
    /// Anything else the log is known to contain.
    Other,
}

/// An event stated before the run: when it happened, and optionally what a model
/// predicted for it.
#[derive(Clone, Debug, Serialize, Deserialize, PartialEq)]
#[serde(deny_unknown_fields)]
pub struct EventCfg {
    /// Name of the event (a test-plan slot, a log entry).
    pub label: String,
    /// Kind of event.
    pub kind: EventKind,
    /// Onset, seconds since the first epoch of the log.
    pub onset_s: f64,
    /// End, seconds since the first epoch of the log. Without it the event is scored
    /// over `[onset_s, onset_s + compare.horizon_s]`.
    #[serde(default)]
    pub end_s: Option<f64>,
    /// A predicted mean carrier-to-noise density (C/N0) drop for the event, dB, for
    /// example from a `jamming` scenario's link budget.
    #[serde(default)]
    pub predicted_cn0_drop_db: Option<f64>,
}

/// The comparison rules, stated before the run.
#[derive(Clone, Debug, Serialize, Deserialize, PartialEq)]
#[serde(deny_unknown_fields, default)]
pub struct CompareCfg {
    /// An alarm no later than this after an onset counts as a detection, s. Default 10 s,
    /// the tolerance of the JammerTest 2024 spoofing comparison this kind grew from.
    pub detect_tol_s: f64,
    /// Scoring window after an onset when an event gives no end, s. Default 300 s.
    pub horizon_s: f64,
    /// A predicted and an observed C/N0 drop agree when they differ by no more than
    /// this, dB. Default 3 dB, the pre-registered tolerance of the JammerTest link-budget
    /// comparison.
    pub cn0_tol_db: f64,
}

impl Default for CompareCfg {
    fn default() -> Self {
        Self {
            detect_tol_s: 10.0,
            horizon_s: 300.0,
            cn0_tol_db: 3.0,
        }
    }
}

/// A `receiver-trust` scenario.
///
/// The platform of a `[platform]` table is held in [`MonitorConfig::platform`] (the
/// scenario struct keeps its original fields, so code that builds one field by field is
/// unaffected); a static scenario serialises, and so hashes, exactly as before.
#[derive(Clone, Debug, Serialize, Deserialize, PartialEq)]
#[serde(from = "RawScenario")]
pub struct ReceiverTrustScenario {
    /// The scenario kind tag (`receiver-trust`); ignored by the runner.
    #[serde(default)]
    pub kind: Option<String>,
    /// Free-text name of the session.
    #[serde(default)]
    pub name: Option<String>,
    /// The receiver log.
    pub log: LogCfg,
    /// Monitor parameters.
    #[serde(default)]
    pub monitors: MonitorConfig,
    /// Events to score the monitors against.
    #[serde(default)]
    pub events: Vec<EventCfg>,
    /// Comparison rules.
    #[serde(default)]
    pub compare: CompareCfg,
}

/// The scenario as written in TOML: the scenario's fields plus the top-level `[platform]`.
#[derive(Deserialize)]
#[serde(deny_unknown_fields)]
struct RawScenario {
    #[serde(default)]
    kind: Option<String>,
    #[serde(default)]
    name: Option<String>,
    log: LogCfg,
    #[serde(default)]
    monitors: MonitorConfig,
    #[serde(default)]
    events: Vec<EventCfg>,
    #[serde(default)]
    compare: CompareCfg,
    #[serde(default)]
    platform: PlatformCfg,
    #[serde(default)]
    maritime: MaritimeConfig,
    #[serde(default)]
    score: ScoreCfg,
    #[serde(default)]
    live: LiveCfg,
}

impl From<RawScenario> for ReceiverTrustScenario {
    fn from(r: RawScenario) -> Self {
        let mut monitors = r.monitors;
        monitors.platform = r.platform;
        monitors.maritime = r.maritime;
        monitors.score = r.score;
        monitors.live = r.live;
        Self {
            kind: r.kind,
            name: r.name,
            log: r.log,
            monitors,
            events: r.events,
            compare: r.compare,
        }
    }
}

/// What was read from the log.
#[derive(Clone, Debug, Serialize, PartialEq)]
pub struct LogSummary {
    /// Format read.
    pub format: LogFormat,
    /// SHA-256 of the log bytes.
    pub sha256: String,
    /// Size of the log, bytes.
    pub bytes: usize,
    /// Epochs read.
    pub epochs: usize,
    /// Time from the first to the last epoch, s.
    pub duration_s: f64,
    /// The first epoch's time as the log states it.
    pub start_label: Option<String>,
    /// Observables the log carries.
    pub observables: Vec<String>,
    /// Records the reader skipped.
    pub skipped_records: usize,
    /// Whether the engine formed its own fix (a RINEX log with broadcast navigation).
    pub engine_fix: bool,
}

/// Time spent in each trust state after calibration.
#[derive(Clone, Debug, Default, Serialize, PartialEq)]
pub struct StateTimes {
    /// Epochs in the nominal state.
    pub nominal_epochs: usize,
    /// Epochs in the degraded state.
    pub degraded_epochs: usize,
    /// Epochs in the untrusted state.
    pub untrusted_epochs: usize,
}

/// How the monitors did on one stated event.
#[derive(Clone, Debug, Serialize, PartialEq)]
pub struct EventScore {
    /// Event name.
    pub label: String,
    /// Event kind.
    pub kind: EventKind,
    /// Onset, s since the first epoch.
    pub onset_s: f64,
    /// End of the scoring window, s.
    pub window_end_s: f64,
    /// Whether the event can be scored: it lies after calibration and inside the log.
    pub evaluable: bool,
    /// Epochs between the end of calibration (or the previous event's window) and the
    /// onset.
    pub pre_onset_epochs: usize,
    /// Alarming epochs in that pre-onset span: false alarms.
    pub pre_onset_alarms: usize,
    /// Time of the first alarm inside the window, s.
    pub first_alarm_s: Option<f64>,
    /// First alarm minus onset, s.
    pub latency_s: Option<f64>,
    /// The monitors that raised that first alarm.
    pub first_monitors: Vec<Monitor>,
    /// `detected` (within `detect_tol_s`), `late`, `missed` or `not-evaluable`.
    pub outcome: String,
    /// Median over the window of the epoch mean C/N0 drop, dB.
    pub observed_cn0_drop_db: Option<f64>,
    /// The stated prediction, dB.
    pub predicted_cn0_drop_db: Option<f64>,
    /// Observed minus predicted, dB.
    pub cn0_drop_error_db: Option<f64>,
    /// `agree`, `disagree`, `no-prediction` or `not-evaluable`.
    pub cn0_verdict: String,
}

/// The result of a `receiver-trust` run.
#[derive(Clone, Debug, Serialize)]
pub struct ReceiverTrustResult {
    /// SHA-256 over the scenario and the bytes of every file it read.
    pub scenario_hash: String,
    /// The honesty label: what this result is and is not.
    pub label: String,
    /// For a vessel: what this software is and is not (advisory, not type-approved navigation
    /// equipment).
    #[serde(skip_serializing_if = "Option::is_none")]
    pub advisory: Option<&'static str>,
    /// Session name, if given.
    pub name: Option<String>,
    /// What was read.
    pub log: LogSummary,
    /// The parameters the monitors ran with (the scenario's, after defaults).
    pub monitor_config: MonitorConfig,
    /// The comparison rules the events were scored with.
    pub compare: CompareCfg,
    /// Monitors that had data to run on.
    pub monitors_run: Vec<Monitor>,
    /// The calibration baseline.
    pub baseline: Baseline,
    /// Time in each trust state after calibration.
    pub states: StateTimes,
    /// First alarm after calibration, s.
    pub first_alarm_s: Option<f64>,
    /// Contiguous alarm runs per monitor.
    pub alarm_runs: Vec<AlarmRun>,
    /// One score per stated event.
    pub events: Vec<EventScore>,
    /// Events detected within tolerance, of those evaluable.
    pub events_detected: usize,
    /// Events that could be scored.
    pub events_evaluable: usize,
    /// Predictions that agreed within tolerance, of those evaluable.
    pub predictions_agreeing: usize,
    /// Predictions that could be scored.
    pub predictions_evaluable: usize,
    /// The score mapping a vessel's epochs were scored with: band edges, ramp and every
    /// monitor's weight. Present for a vessel platform only.
    #[serde(skip_serializing_if = "Option::is_none")]
    pub score_model: Option<ScoreModel>,
    /// One sentence on the session.
    pub verdict: String,
    /// The per-epoch trust timeline.
    pub epochs: Vec<EpochTrust>,
}

/// The pre-registered trust-score mapping a run used, as recorded in its result.
#[derive(Clone, Debug, Serialize, PartialEq)]
pub struct ScoreModel {
    /// Score at or above which an epoch is nominal.
    pub nominal_min: f64,
    /// Score at or above which an epoch is degraded; below it, untrusted.
    pub degraded_min: f64,
    /// Ratio below which a monitor costs nothing.
    pub onset_ratio: f64,
    /// Ratio at which a monitor costs its whole weight.
    pub full_ratio: f64,
    /// How long a monitor's last statistic stands when its input does not arrive, s.
    pub evidence_hold_s: f64,
    /// Every monitor's weight, points.
    pub weights: std::collections::BTreeMap<Monitor, f64>,
}

/// The honesty label every `receiver-trust` result carries.
pub const LABEL: &str =
    "MEASURED log, MODELLED assessment: the observables are the receiver's own; \
the monitors and their thresholds are the engine's and the scenario's, and a stated prediction \
is compared with the log, not fitted to it";

#[cfg(not(target_arch = "wasm32"))]
fn read_path(path: &str) -> Result<Vec<u8>, String> {
    std::fs::read(path).map_err(|e| format!("cannot read {path:?}: {e}"))
}

#[cfg(target_arch = "wasm32")]
fn read_path(path: &str) -> Result<Vec<u8>, String> {
    Err(format!(
        "cannot read {path:?}: the WebAssembly build has no file system; pass the file inline as `text` or `base64`"
    ))
}

/// The bytes a [`FileSource`] names. `what` names the file in error messages.
pub fn load_source(src: &FileSource, what: &str) -> Result<Vec<u8>, String> {
    match (&src.path, &src.text, &src.base64) {
        (Some(p), None, None) => read_path(p),
        (None, Some(t), None) => Ok(t.clone().into_bytes()),
        (None, None, Some(b)) => {
            let compact: String = b.chars().filter(|c| !c.is_whitespace()).collect();
            crate::permalink::base64_decode(&compact)
                .ok_or_else(|| format!("{what}: `base64` is not valid standard base64"))
        }
        (None, None, None) => Err(format!("{what}: give one of `path`, `text` or `base64`")),
        _ => Err(format!(
            "{what}: give only one of `path`, `text` or `base64`"
        )),
    }
}

fn sha256_hex(bytes: &[u8]) -> String {
    format!("{:x}", Sha256::digest(bytes))
}

fn median(mut v: Vec<f64>) -> Option<f64> {
    v.retain(|x| x.is_finite());
    if v.is_empty() {
        return None;
    }
    v.sort_by(|a, b| a.total_cmp(b));
    let n = v.len();
    Some(if n % 2 == 1 {
        v[n / 2]
    } else {
        0.5 * (v[n / 2 - 1] + v[n / 2])
    })
}

/// Validate the parts of a scenario that serde cannot.
fn validate(scn: &ReceiverTrustScenario) -> Result<(), String> {
    scn.monitors.platform.validate()?;
    let c = &scn.compare;
    for (name, v) in [
        ("compare.detect_tol_s", c.detect_tol_s),
        ("compare.horizon_s", c.horizon_s),
        ("compare.cn0_tol_db", c.cn0_tol_db),
    ] {
        if !(v.is_finite() && v > 0.0) {
            return Err(format!("{name} must be a positive number, got {v}"));
        }
    }
    for e in &scn.events {
        if !e.onset_s.is_finite() || e.onset_s < 0.0 {
            return Err(format!(
                "event {:?}: onset_s must be a non-negative number",
                e.label
            ));
        }
        if let Some(end) = e.end_s {
            if !end.is_finite() || end <= e.onset_s {
                return Err(format!("event {:?}: end_s must be after onset_s", e.label));
            }
        }
    }
    Ok(())
}

/// Run a `receiver-trust` scenario.
pub fn run_receiver_trust(scn: &ReceiverTrustScenario) -> Result<ReceiverTrustResult, String> {
    validate(scn)?;
    let log_bytes = load_source(&scn.log.source, "log")?;
    let nav_bytes = match &scn.log.nav {
        Some(src) => Some(load_source(src, "log.nav")?),
        None => None,
    };
    run_receiver_trust_bytes(scn, &log_bytes, nav_bytes.as_deref())
}

/// Run a `receiver-trust` scenario on log bytes the caller already holds: the scenario's own
/// `[log]` source is not read (its `format` still says how to read the bytes). `nav` is the
/// RINEX broadcast navigation file for a `rinex` log.
pub fn run_receiver_trust_bytes(
    scn: &ReceiverTrustScenario,
    log_bytes: &[u8],
    nav_bytes: Option<&[u8]>,
) -> Result<ReceiverTrustResult, String> {
    validate(scn)?;
    let timeline = read_log(scn.log.format, log_bytes)?;

    // The engine's own fix needs pseudoranges, which only the RINEX observation file has.
    if nav_bytes.is_some() && scn.log.format != LogFormat::Rinex {
        return Err(
            "log.nav applies only to a `rinex` log: the engine fix needs its pseudoranges".into(),
        );
    }
    let engine_inputs = match &nav_bytes {
        Some(nav) => {
            let obs = crate::rinex_obs::parse_obs(&String::from_utf8_lossy(log_bytes))?;
            let ephs = crate::rinex::parse_nav(&String::from_utf8_lossy(nav))?;
            Some((obs, ephs))
        }
        None => None,
    };
    let engine = engine_inputs
        .as_ref()
        .map(|(obs, ephs)| EngineFixInput { obs, ephs });
    let trust = run_monitors(&timeline, engine, &scn.monitors)?;

    let mut hasher = Sha256::new();
    hasher.update(serde_json::to_string(scn).unwrap_or_default().as_bytes());
    hasher.update(log_bytes);
    if let Some(nav) = nav_bytes {
        hasher.update(nav);
    }
    let scenario_hash = format!("{:x}", hasher.finalize());

    let cal_end = scn.monitors.calibration_s;
    let last_t = trust.epochs.last().map(|e| e.t_s).unwrap_or(0.0);
    let mut states = StateTimes::default();
    for e in &trust.epochs {
        match e.state {
            TrustState::Nominal => states.nominal_epochs += 1,
            TrustState::Degraded => states.degraded_epochs += 1,
            TrustState::Untrusted => states.untrusted_epochs += 1,
            TrustState::Calibrating => {}
        }
    }

    let mut order: Vec<usize> = (0..scn.events.len()).collect();
    order.sort_by(|&a, &b| scn.events[a].onset_s.total_cmp(&scn.events[b].onset_s));
    let mut scores: Vec<Option<EventScore>> = vec![None; scn.events.len()];
    let mut prev_end = cal_end;
    for &i in &order {
        let ev = &scn.events[i];
        let window_end = ev
            .end_s
            .unwrap_or(ev.onset_s + scn.compare.horizon_s)
            .min(last_t);
        let evaluable = ev.onset_s >= cal_end && ev.onset_s <= last_t;
        let pre_from = prev_end.max(cal_end);
        let pre: Vec<&EpochTrust> = trust
            .epochs
            .iter()
            .filter(|e| e.t_s >= pre_from && e.t_s < ev.onset_s)
            .collect();
        let pre_onset_alarms = pre.iter().filter(|e| !e.alarms.is_empty()).count();
        let in_window: Vec<&EpochTrust> = trust
            .epochs
            .iter()
            .filter(|e| e.t_s >= ev.onset_s && e.t_s <= window_end)
            .collect();
        let first = in_window.iter().find(|e| !e.alarms.is_empty());
        let first_alarm_s = first.map(|e| e.t_s);
        let latency_s = first_alarm_s.map(|t| t - ev.onset_s);
        let outcome = if !evaluable {
            "not-evaluable"
        } else {
            match latency_s {
                Some(l) if l <= scn.compare.detect_tol_s => "detected",
                Some(_) => "late",
                None => "missed",
            }
        };
        let observed = if evaluable {
            median(in_window.iter().filter_map(|e| e.cn0_drop_db).collect())
        } else {
            None
        };
        let error = match (observed, ev.predicted_cn0_drop_db) {
            (Some(o), Some(p)) => Some(o - p),
            _ => None,
        };
        let cn0_verdict = match (ev.predicted_cn0_drop_db, error) {
            (None, _) => "no-prediction",
            (Some(_), Some(e)) if e.abs() <= scn.compare.cn0_tol_db => "agree",
            (Some(_), Some(_)) => "disagree",
            (Some(_), None) => "not-evaluable",
        };
        scores[i] = Some(EventScore {
            label: ev.label.clone(),
            kind: ev.kind,
            onset_s: ev.onset_s,
            window_end_s: window_end,
            evaluable,
            pre_onset_epochs: pre.len(),
            pre_onset_alarms,
            first_alarm_s,
            latency_s,
            first_monitors: first.map(|e| e.alarms.clone()).unwrap_or_default(),
            outcome: outcome.into(),
            observed_cn0_drop_db: observed,
            predicted_cn0_drop_db: ev.predicted_cn0_drop_db,
            cn0_drop_error_db: error,
            cn0_verdict: cn0_verdict.into(),
        });
        prev_end = prev_end.max(window_end);
    }
    let events: Vec<EventScore> = scores.into_iter().flatten().collect();
    let events_evaluable = events.iter().filter(|e| e.evaluable).count();
    let events_detected = events.iter().filter(|e| e.outcome == "detected").count();
    let predictions_evaluable = events
        .iter()
        .filter(|e| e.cn0_verdict == "agree" || e.cn0_verdict == "disagree")
        .count();
    let predictions_agreeing = events.iter().filter(|e| e.cn0_verdict == "agree").count();

    let after_cal = states.nominal_epochs + states.degraded_epochs + states.untrusted_epochs;
    let mut verdict = match trust.first_alarm_s {
        None => format!("trusted throughout: no monitor alarmed in {after_cal} epochs after calibration"),
        Some(t) => format!(
            "first alarm at {t:.1} s; untrusted for {} and degraded for {} of {after_cal} epochs after calibration",
            states.untrusted_epochs, states.degraded_epochs
        ),
    };
    if events_evaluable > 0 {
        verdict.push_str(&format!(
            "; {events_detected} of {events_evaluable} stated events detected within {} s",
            scn.compare.detect_tol_s
        ));
    }
    if predictions_evaluable > 0 {
        verdict.push_str(&format!(
            "; {predictions_agreeing} of {predictions_evaluable} C/N0 predictions within {} dB",
            scn.compare.cn0_tol_db
        ));
    }

    let score_model = scn.monitors.platform.is_vessel().then(|| ScoreModel {
        nominal_min: scn.monitors.score.nominal_min,
        degraded_min: scn.monitors.score.degraded_min,
        onset_ratio: scn.monitors.score.onset_ratio,
        full_ratio: scn.monitors.score.full_ratio,
        evidence_hold_s: scn.monitors.score.evidence_hold_s,
        weights: scn.monitors.score.effective_weights(),
    });
    if score_model.is_some() {
        let scores: Vec<f64> = trust
            .epochs
            .iter()
            .filter_map(|e| e.score.as_ref().map(|s| s.score))
            .collect();
        if let (Some(min), Some(last)) = (
            scores.iter().copied().min_by(f64::total_cmp),
            scores.last().copied(),
        ) {
            verdict.push_str(&format!("; trust score lowest {min:.1}, final {last:.1}"));
        }
    }

    Ok(ReceiverTrustResult {
        scenario_hash,
        label: LABEL.into(),
        advisory: scn.monitors.platform.is_vessel().then_some(super::ADVISORY),
        name: scn.name.clone(),
        log: LogSummary {
            format: scn.log.format,
            sha256: sha256_hex(log_bytes),
            bytes: log_bytes.len(),
            epochs: timeline.epochs.len(),
            duration_s: timeline.epochs.last().map(|e| e.t_s).unwrap_or(0.0),
            start_label: timeline.start_label.clone(),
            observables: {
                // The moving-platform sentences are an observable only where the scenario
                // declares a vessel, so a static run reports exactly what it always did.
                let mut o = timeline.observables.clone();
                if scn.monitors.platform.is_vessel()
                    && timeline.epochs.iter().any(|e| e.marine.is_some())
                {
                    o.push("marine".to_string());
                }
                o
            },
            skipped_records: timeline.skipped_records,
            engine_fix: engine_inputs.is_some(),
        },
        monitor_config: scn.monitors.clone(),
        compare: scn.compare.clone(),
        monitors_run: trust.monitors_run,
        baseline: trust.baseline,
        states,
        first_alarm_s: trust.first_alarm_s,
        alarm_runs: trust.runs,
        events,
        events_detected,
        events_evaluable,
        predictions_agreeing,
        predictions_evaluable,
        score_model,
        verdict,
        epochs: trust.epochs,
    })
}

/// One-line summary for the command line.
pub fn summary(r: &ReceiverTrustResult) -> String {
    format!(
        "scenario {} | receiver-trust | {} log, {} epochs over {:.0} s | monitors {} | {}",
        &r.scenario_hash[..12],
        format_name(r.log.format),
        r.log.epochs,
        r.log.duration_s,
        r.monitors_run.len(),
        r.verdict
    )
}

fn format_name(f: LogFormat) -> &'static str {
    match f {
        LogFormat::Ubx => "ubx",
        LogFormat::Rinex => "rinex",
        LogFormat::Android => "android",
        LogFormat::Nmea => "nmea",
    }
}

fn monitor_name(m: Monitor) -> &'static str {
    match m {
        Monitor::Cn0Drop => "cn0-drop",
        Monitor::Agc => "agc",
        Monitor::JamInd => "jam-ind",
        Monitor::LossOfLock => "loss-of-lock",
        Monitor::PositionJump => "position-jump",
        Monitor::Raim => "raim",
        Monitor::Clock => "clock",
        Monitor::SolveFailure => "solve-failure",
        Monitor::Kinematic => "kinematic",
        Monitor::HeadingCourse => "heading-course",
        Monitor::SpeedLog => "speed-log",
        Monitor::SeaLevel => "sea-level",
        Monitor::Cn0Spread => "cn0-spread",
        Monitor::Cn0Rise => "cn0-rise",
        Monitor::TimeConsistency => "time-consistency",
        Monitor::Osnma => "osnma",
    }
}

fn state_name(s: TrustState) -> &'static str {
    match s {
        TrustState::Calibrating => "calibrating",
        TrustState::Nominal => "nominal",
        TrustState::Degraded => "degraded",
        TrustState::Untrusted => "untrusted",
    }
}

fn opt(v: Option<f64>) -> String {
    v.map(|x| format!("{x}")).unwrap_or_default()
}

/// The per-epoch trust timeline as CSV.
pub fn to_csv(r: &ReceiverTrustResult) -> String {
    let vessel = r.score_model.is_some();
    let mut s = String::new();
    if vessel {
        // A comment line, which CSV readers skip with their comment option (`#`).
        s.push_str(&format!("# {}\n", super::ADVISORY));
    }
    s.push_str(
        "t_s,state,n_sats,cn0_mean_dbhz,cn0_drop_db,agc,agc_z,jam_ind,position_offset_m,raim_stat,raim_thr,clock_innov_ns,clock_bound_ns,alarms",
    );
    if vessel {
        s.push_str(",score,score_reasons");
    }
    s.push('\n');
    for e in &r.epochs {
        let alarms: Vec<&str> = e.alarms.iter().map(|m| monitor_name(*m)).collect();
        s.push_str(&format!(
            "{},{},{},{},{},{},{},{},{},{},{},{},{},{}\n",
            e.t_s,
            state_name(e.state),
            e.n_sats,
            opt(e.cn0_mean_dbhz),
            opt(e.cn0_drop_db),
            opt(e.agc),
            opt(e.agc_z),
            opt(e.jam_ind),
            opt(e.position_offset_m),
            opt(e.raim_stat),
            opt(e.raim_thr),
            opt(e.clock_innov_ns),
            opt(e.clock_bound_ns),
            alarms.join(";")
        ));
        if vessel {
            s.pop(); // the newline, to add the vessel columns
            let (score, reasons) = match &e.score {
                Some(sc) => (
                    format!("{:.1}", sc.score),
                    sc.deductions
                        .iter()
                        .map(|d| format!("{}:{:.1}", monitor_name(d.monitor), d.points))
                        .collect::<Vec<_>>()
                        .join(";"),
                ),
                None => (String::new(), String::new()),
            };
            s.push_str(&format!(",{score},{reasons}\n"));
        }
    }
    s
}

/// The chart of a vessel run: the receiver-reported track coloured by the trust band of
/// each epoch (north up, one scale on both axes), and underneath the trust score over time
/// with the band edges. Self-contained SVG.
fn to_svg_vessel(r: &ReceiverTrustResult) -> String {
    use super::maritime::en_offset_m;
    let (w, h) = (760.0_f64, 540.0_f64);
    let (x0, x1) = (56.0_f64, w - 16.0);
    let colour = |s: TrustState| match s {
        TrustState::Calibrating => RULE,
        TrustState::Nominal => LIME,
        TrustState::Degraded => AMBER,
        TrustState::Untrusted => CORAL,
    };
    let model = r.score_model.as_ref();
    let (nominal_min, degraded_min) =
        model.map_or((90.0, 55.0), |m| (m.nominal_min, m.degraded_min));
    let mut svg = format!(
        "<svg xmlns=\"http://www.w3.org/2000/svg\" width=\"{w}\" height=\"{h}\" viewBox=\"0 0 {w} {h}\">\
         <desc>{}</desc>\
         <rect width=\"{w}\" height=\"{h}\" fill=\"{BG}\"/>\
         <text x=\"12\" y=\"22\" fill=\"{TITLE}\" font-family=\"{FONT_SANS}\" font-size=\"13\">{}</text>",
        esc(super::ADVISORY),
        esc(&r.verdict.chars().take(110).collect::<String>())
    );

    // --- track: reported position, coloured by band -------------------------------------
    let pts: Vec<(f64, f64, TrustState)> = {
        let origin = r
            .epochs
            .iter()
            .find_map(|e| e.marine.as_ref().and_then(|m| m.position));
        match origin {
            Some([lat0, lon0]) => r
                .epochs
                .iter()
                .filter_map(|e| {
                    let [la, lo] = e.marine.as_ref()?.position?;
                    let (east, north) = en_offset_m(lat0, lon0, la, lo);
                    Some((east, north, e.state))
                })
                .collect(),
            None => Vec::new(),
        }
    };
    let (ty0, ty1) = (46.0_f64, 292.0_f64);
    svg.push_str(&format!(
        "<text x=\"12\" y=\"{}\" fill=\"{MUTED}\" font-family=\"{FONT_SANS}\" font-size=\"11\">receiver-reported track, north up</text>",
        ty0 - 6.0
    ));
    if pts.len() >= 2 {
        let (mut e_lo, mut e_hi, mut n_lo, mut n_hi) = (f64::MAX, f64::MIN, f64::MAX, f64::MIN);
        for (e, n, _) in &pts {
            e_lo = e_lo.min(*e);
            e_hi = e_hi.max(*e);
            n_lo = n_lo.min(*n);
            n_hi = n_hi.max(*n);
        }
        // One scale on both axes, at least 500 m across so a short track is not blown up.
        let span_e = (e_hi - e_lo).max(500.0);
        let span_n = (n_hi - n_lo).max(500.0);
        let scale = ((x1 - x0) / span_e).min((ty1 - ty0) / span_n);
        let (cx, cy) = ((x0 + x1) / 2.0, (ty0 + ty1) / 2.0);
        let px = |e: f64| cx + (e - (e_lo + e_hi) / 2.0) * scale;
        let py = |n: f64| cy - (n - (n_lo + n_hi) / 2.0) * scale;
        // One polyline per run of equal band, each sharing its end point with the next run.
        let mut i = 0;
        while i < pts.len() {
            let band = pts[i].2;
            let mut j = i;
            while j + 1 < pts.len() && pts[j + 1].2 == band {
                j += 1;
            }
            let end = (j + 1).min(pts.len() - 1);
            let path: Vec<String> = pts[i..=end]
                .iter()
                .map(|(e, n, _)| format!("{:.1},{:.1}", px(*e), py(*n)))
                .collect();
            svg.push_str(&format!(
                "<polyline fill=\"none\" stroke=\"{}\" stroke-width=\"2\" stroke-linejoin=\"round\" points=\"{}\"/>",
                colour(band),
                path.join(" ")
            ));
            i = j + 1;
        }
        let (first, last) = (pts[0], pts[pts.len() - 1]);
        svg.push_str(&format!(
            "<circle cx=\"{:.1}\" cy=\"{:.1}\" r=\"4\" fill=\"{INK}\"/>\
             <text x=\"{:.1}\" y=\"{:.1}\" fill=\"{TITLE}\" font-family=\"{FONT_SANS}\" font-size=\"10\">start</text>\
             <circle cx=\"{:.1}\" cy=\"{:.1}\" r=\"4\" fill=\"none\" stroke=\"{INK}\" stroke-width=\"1.5\"/>\
             <text x=\"{:.1}\" y=\"{:.1}\" fill=\"{TITLE}\" font-family=\"{FONT_SANS}\" font-size=\"10\">end of log</text>",
            px(first.0), py(first.1), px(first.0) + 7.0, py(first.1) + 3.0,
            px(last.0), py(last.1), px(last.0) - 52.0, py(last.1) - 8.0,
        ));
        // A scale bar of a round length.
        let target = 0.2 * (x1 - x0) / scale;
        let mag = 10f64.powf(target.log10().floor());
        let bar_m = [1.0, 2.0, 5.0, 10.0]
            .iter()
            .map(|m| m * mag)
            .filter(|b| *b <= target)
            .fold(mag, f64::max);
        let label = if bar_m >= 1000.0 {
            format!("{:.0} km", bar_m / 1000.0)
        } else {
            format!("{bar_m:.0} m")
        };
        svg.push_str(&format!(
            "<line x1=\"{x0}\" x2=\"{:.1}\" y1=\"{}\" y2=\"{}\" stroke=\"{INK}\"/>\
             <text x=\"{x0}\" y=\"{}\" fill=\"{MUTED}\" font-family=\"{FONT_SANS}\" font-size=\"10\">{label}</text>",
            x0 + bar_m * scale,
            ty1 + 2.0,
            ty1 + 2.0,
            ty1 + 14.0
        ));
    } else {
        svg.push_str(&format!(
            "<text x=\"{x0}\" y=\"{}\" fill=\"{MUTED}\" font-family=\"{FONT_SANS}\" font-size=\"11\">no positions in the log</text>",
            (ty0 + ty1) / 2.0
        ));
    }

    // --- score over time ---------------------------------------------------------------
    let (sy0, sy1) = (338.0_f64, 462.0_f64);
    let t_max = r.epochs.last().map(|e| e.t_s).unwrap_or(1.0).max(1.0);
    let sx = |t: f64| x0 + (x1 - x0) * t / t_max;
    let sc = |v: f64| sy1 - (sy1 - sy0) * v / 100.0;
    svg.push_str(&format!(
        "<text x=\"12\" y=\"{}\" fill=\"{MUTED}\" font-family=\"{FONT_SANS}\" font-size=\"11\">trust score, 0 to 100</text>",
        sy0 - 8.0
    ));
    for (v, label) in [
        (100.0, "100"),
        (nominal_min, ""),
        (degraded_min, ""),
        (0.0, "0"),
    ] {
        svg.push_str(&format!(
            "<line x1=\"{x0}\" x2=\"{x1}\" y1=\"{y:.1}\" y2=\"{y:.1}\" stroke=\"{RULE}\" stroke-dasharray=\"{}\"/>\
             <text x=\"{}\" y=\"{:.1}\" fill=\"{MUTED}\" font-family=\"{FONT_SANS}\" font-size=\"10\" text-anchor=\"end\">{}</text>",
            if label.is_empty() { "4 3" } else { "0" },
            x0 - 4.0,
            sc(v) + 3.0,
            if label.is_empty() { format!("{v:.0}") } else { label.to_string() },
            y = sc(v)
        ));
    }
    let line: Vec<String> = r
        .epochs
        .iter()
        .filter_map(|e| {
            e.score
                .as_ref()
                .map(|s| format!("{:.1},{:.1}", sx(e.t_s), sc(s.score)))
        })
        .collect();
    if !line.is_empty() {
        svg.push_str(&format!(
            "<polyline fill=\"none\" stroke=\"{BLUE}\" stroke-width=\"1.5\" points=\"{}\"/>",
            line.join(" ")
        ));
    }
    let band_y = sy1 + 12.0;
    for (i, e) in r.epochs.iter().enumerate() {
        let next = r.epochs.get(i + 1).map(|n| n.t_s).unwrap_or(e.t_s + 1.0);
        svg.push_str(&format!(
            "<rect x=\"{:.1}\" y=\"{band_y}\" width=\"{:.2}\" height=\"12\" fill=\"{}\"/>",
            sx(e.t_s),
            (sx(next) - sx(e.t_s)).max(0.5),
            colour(e.state)
        ));
    }
    for ev in &r.events {
        let x = sx(ev.onset_s);
        svg.push_str(&format!(
            "<line x1=\"{x:.1}\" x2=\"{x:.1}\" y1=\"{sy0}\" y2=\"{}\" stroke=\"{INK}\" stroke-dasharray=\"3 3\"/>\
             <text x=\"{:.1}\" y=\"{}\" fill=\"{TITLE}\" font-family=\"{FONT_SANS}\" font-size=\"10\">{}</text>",
            band_y + 12.0,
            x + 3.0,
            sy0 + 10.0,
            esc(&ev.label)
        ));
    }
    svg.push_str(&format!(
        "<text x=\"{x0}\" y=\"{}\" fill=\"{MUTED}\" font-family=\"{FONT_SANS}\" font-size=\"10\">0 s</text>\
         <text x=\"{x1}\" y=\"{}\" fill=\"{MUTED}\" font-family=\"{FONT_SANS}\" font-size=\"10\" text-anchor=\"end\">{t_max:.0} s</text>\
         <text x=\"{x0}\" y=\"{}\" fill=\"{MUTED}\" font-family=\"{FONT_SANS}\" font-size=\"10\">trust: green nominal (score at or above {nominal_min:.0}), amber degraded (at or above {degraded_min:.0}), red untrusted, grey calibrating</text>\
         <text x=\"{x0}\" y=\"{}\" fill=\"{MUTED}\" font-family=\"{FONT_SANS}\" font-size=\"9\">Advisory software, not type-approved navigation equipment; the operator remains responsible.</text></svg>",
        band_y + 26.0,
        band_y + 26.0,
        band_y + 42.0,
        band_y + 56.0
    ));
    svg
}

/// A self-contained chart: mean C/N0 over time, the trust state as a band underneath,
/// and each stated event's onset as a vertical marker. For a vessel platform, the track and
/// the trust score instead.
pub fn to_svg(r: &ReceiverTrustResult) -> String {
    if r.score_model.is_some() {
        return to_svg_vessel(r);
    }
    let (w, h) = (760.0_f64, 300.0_f64);
    let (x0, x1, y0, y1) = (56.0, w - 16.0, 40.0, h - 70.0);
    let t_max = r.epochs.last().map(|e| e.t_s).unwrap_or(1.0).max(1.0);
    let cn0: Vec<(f64, f64)> = r
        .epochs
        .iter()
        .filter_map(|e| e.cn0_mean_dbhz.map(|c| (e.t_s, c)))
        .collect();
    let (lo, hi) = cn0
        .iter()
        .fold((f64::INFINITY, f64::NEG_INFINITY), |(lo, hi), (_, c)| {
            (lo.min(*c), hi.max(*c))
        });
    let (lo, hi) = if lo.is_finite() {
        ((lo - 2.0).floor(), (hi + 2.0).ceil())
    } else {
        (20.0, 50.0)
    };
    let sx = |t: f64| x0 + (x1 - x0) * t / t_max;
    let sy = |c: f64| y1 - (y1 - y0) * (c - lo) / (hi - lo).max(1.0);
    let mut svg = format!(
        "<svg xmlns=\"http://www.w3.org/2000/svg\" width=\"{w}\" height=\"{h}\" viewBox=\"0 0 {w} {h}\">\
         <rect width=\"{w}\" height=\"{h}\" fill=\"{BG}\"/>\
         <text x=\"12\" y=\"22\" fill=\"{TITLE}\" font-family=\"{FONT_SANS}\" font-size=\"13\">{}</text>\
         <text x=\"12\" y=\"{}\" fill=\"{MUTED}\" font-family=\"{FONT_SANS}\" font-size=\"11\" transform=\"rotate(-90 12 {})\">mean C/N0, dB-Hz</text>",
        esc(&r.verdict.chars().take(110).collect::<String>()),
        (y0 + y1) / 2.0 + 40.0,
        (y0 + y1) / 2.0 + 40.0
    );
    for c in [lo, (lo + hi) / 2.0, hi] {
        svg.push_str(&format!(
            "<line x1=\"{x0}\" x2=\"{x1}\" y1=\"{y}\" y2=\"{y}\" stroke=\"{RULE}\"/>\
             <text x=\"{tx}\" y=\"{ty}\" fill=\"{MUTED}\" font-family=\"{FONT_SANS}\" font-size=\"10\" text-anchor=\"end\">{c:.0}</text>",
            y = sy(c),
            tx = x0 - 4.0,
            ty = sy(c) + 3.0
        ));
    }
    if !cn0.is_empty() {
        let pts: Vec<String> = cn0
            .iter()
            .map(|(t, c)| format!("{:.1},{:.1}", sx(*t), sy(*c)))
            .collect();
        svg.push_str(&format!(
            "<polyline fill=\"none\" stroke=\"{BLUE}\" stroke-width=\"1.5\" points=\"{}\"/>",
            pts.join(" ")
        ));
    }
    // Trust-state band.
    let band_y = y1 + 14.0;
    for (i, e) in r.epochs.iter().enumerate() {
        let next = r.epochs.get(i + 1).map(|n| n.t_s).unwrap_or(e.t_s + 1.0);
        let colour = match e.state {
            TrustState::Calibrating => RULE,
            TrustState::Nominal => LIME,
            TrustState::Degraded => AMBER,
            TrustState::Untrusted => CORAL,
        };
        svg.push_str(&format!(
            "<rect x=\"{:.1}\" y=\"{band_y}\" width=\"{:.2}\" height=\"12\" fill=\"{colour}\"/>",
            sx(e.t_s),
            (sx(next) - sx(e.t_s)).max(0.5)
        ));
    }
    for ev in &r.events {
        let x = sx(ev.onset_s);
        svg.push_str(&format!(
            "<line x1=\"{x:.1}\" x2=\"{x:.1}\" y1=\"{y0}\" y2=\"{}\" stroke=\"{INK}\" stroke-dasharray=\"3 3\"/>\
             <text x=\"{:.1}\" y=\"{}\" fill=\"{TITLE}\" font-family=\"{FONT_SANS}\" font-size=\"10\">{}</text>",
            band_y + 12.0,
            x + 3.0,
            y0 + 10.0,
            esc(&ev.label)
        ));
    }
    svg.push_str(&format!(
        "<text x=\"{x0}\" y=\"{}\" fill=\"{MUTED}\" font-family=\"{FONT_SANS}\" font-size=\"10\">0 s</text>\
         <text x=\"{x1}\" y=\"{}\" fill=\"{MUTED}\" font-family=\"{FONT_SANS}\" font-size=\"10\" text-anchor=\"end\">{t_max:.0} s</text>\
         <text x=\"{x0}\" y=\"{}\" fill=\"{MUTED}\" font-family=\"{FONT_SANS}\" font-size=\"10\">trust: green nominal, amber degraded, red untrusted, grey calibrating</text></svg>",
        band_y + 26.0,
        band_y + 26.0,
        band_y + 40.0
    ));
    svg
}

/// Everything one run writes: the result document, the per-epoch CSV, the chart and the
/// one-line summary.
#[derive(Clone, Debug)]
pub struct TrustOutput {
    /// The result, as pretty-printed JSON.
    pub json: String,
    /// The per-epoch trust timeline, CSV.
    pub csv: String,
    /// The chart, SVG.
    pub svg: String,
    /// One-line summary.
    pub summary: String,
}

/// Parse a `receiver-trust` scenario from TOML text and run it. The entry point the
/// command line, the Python bindings, the WebAssembly build and the Model Context
/// Protocol server share. In the WebAssembly build, files must be given inline.
pub fn run_toml(src: &str) -> Result<TrustOutput, String> {
    let scn: ReceiverTrustScenario =
        toml::from_str(src).map_err(|e| format!("invalid receiver-trust scenario: {e}"))?;
    if let Some(k) = scn.kind.as_deref() {
        if k != "receiver-trust" {
            return Err(format!(
                "this is a {k:?} scenario, not a receiver-trust one"
            ));
        }
    }
    run_scenario(&scn)
}

/// Run an already-parsed scenario and render every output.
pub fn run_scenario(scn: &ReceiverTrustScenario) -> Result<TrustOutput, String> {
    let r = run_receiver_trust(scn)?;
    Ok(TrustOutput {
        json: serde_json::to_string_pretty(&r).map_err(|e| e.to_string())?,
        csv: to_csv(&r),
        svg: to_svg(&r),
        summary: summary(&r),
    })
}

/// Resolve every relative `path` in a scenario against `base` (the scenario file's own
/// folder), so a scenario runs the same from any working directory.
pub fn resolve_paths(scn: &mut ReceiverTrustScenario, base: &std::path::Path) {
    let fix = |p: &mut Option<String>| {
        if let Some(s) = p.as_mut() {
            let path = std::path::Path::new(s.as_str());
            if path.is_relative() {
                *s = base.join(path).to_string_lossy().into_owned();
            }
        }
    };
    fix(&mut scn.log.source.path);
    if let Some(nav) = scn.log.nav.as_mut() {
        fix(&mut nav.path);
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    const LOG: &str = "log = { format = \"nmea\", text = \"$GPGGA,000000,,,,,0,00,,,,,,,*00\" }";

    #[test]
    fn platform_table_is_read_into_the_monitor_config() {
        let scn: ReceiverTrustScenario = toml::from_str(&format!(
            "{LOG}\n[platform]\nkind = \"vessel\"\nmax_speed_kn = 18.0\n"
        ))
        .unwrap();
        assert!(scn.monitors.platform.is_vessel());
        assert_eq!(scn.monitors.platform.max_speed_kn, Some(18.0));
    }

    #[test]
    fn static_scenarios_serialise_without_a_platform() {
        let scn: ReceiverTrustScenario = toml::from_str(LOG).unwrap();
        assert!(scn.monitors.platform.is_static());
        let json = serde_json::to_string(&scn).unwrap();
        assert!(!json.contains("platform"), "{json}");
        let explicit: ReceiverTrustScenario =
            toml::from_str(&format!("{LOG}\n[platform]\nkind = \"static\"\n")).unwrap();
        assert_eq!(scn, explicit);
    }

    #[test]
    fn platform_under_monitors_is_rejected_and_bad_limits_error_at_run() {
        assert!(toml::from_str::<ReceiverTrustScenario>(&format!(
            "{LOG}\n[monitors.platform]\nkind = \"vessel\"\n"
        ))
        .is_err());
        let scn: ReceiverTrustScenario = toml::from_str(&format!(
            "{LOG}\n[platform]\nkind = \"vessel\"\nmax_speed_kn = -1.0\n"
        ))
        .unwrap();
        let e = run_receiver_trust(&scn).unwrap_err();
        assert!(e.contains("max_speed_kn"), "{e}");
    }
}
