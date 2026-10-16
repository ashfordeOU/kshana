// SPDX-License-Identifier: AGPL-3.0-only
//! **The lab fit from IQ campaigns** (`docs/design/LABFIT-FROM-IQ.md` §3 to §6): per fit
//! unit, the C/N0 model ([`super::cn0`]), the tracking threshold (direct and by the closed
//! form), the lock models coupled through the C/N0 model, a seeded cluster bootstrap over
//! recordings with percentile intervals, residual-draw 90 % prediction intervals,
//! leave-one-recording-out hold-outs and the pre-registered `[validation]` bars.
//!
//! **Lock-model coupling (§3.2, §3.3).** Each satellite event's stated J/S profile is turned
//! into a modelled C/N0 profile through the fitted C/N0 model (`Q`, `δ`, the satellite's
//! measured baseline), and the existing labfit lock models ([`super::model`]: tracking-loop
//! and empirical, drop and re-lock thresholds with confirmation dwells) are fitted to the
//! scored loss and re-acquisition times by the same staged bounded least squares (a grid,
//! then Nelder-Mead, [`super::optim`]). The stated J/S profile drives the receiver-log
//! `j-over-s` conditions with an offset that makes them equal to the §3.1 model, so loss and
//! re-lock times are exact closed-form crossings of each piece of the profile. The campaign scorer counts a
//! re-acquisition only from the later of the loss and the event's end, and looks for it until
//! `scoring.reacq_grace_s` after the end; the modelled run ends there too.
//!
//! **Uncertainty (§4).** The recording is the independent unit: the bootstrap resamples
//! recordings with replacement, refits the C/N0 model (in the mode chosen on the full data)
//! and warm-starts the lock models at the full fit. Every interval is a percentile interval
//! over the replicates that fitted, with the replicate count and the failures stated. A
//! prediction's 90 % interval is the 5th to 95th percentile of each replicate's prediction
//! plus a residual drawn from that replicate's own training residuals of the same quantity.
//!
//! Everything here is **MODELLED**: it describes the open receiver (a named loop design and
//! front-end chain) on the recordings it was given.

use crate::portable_math::PortableFloat;
use rand::SeedableRng;
use rand_chacha::ChaCha8Rng;
use serde::Serialize;

use super::campaign::{CampaignData, FitUnit, SatEvent};
use super::cn0::{self, Cn0Fit, Cn0FitCfg, Cn0Point, QMode};
use super::model::{lock_params, simulate_sat, ModelKind};
use super::optim::{grid_search, nelder_mead_bounded, NmOptions};
use super::schema::{
    CampaignFitCfg, Conditions, Interp, LabFitScenario, LevelKind, LevelPoint, ValidationCfg,
};
use crate::field_schema::{units_block, FieldUnit, ProvenanceClass, ProvenanceClass::*};
use crate::iq::campaign::conditions::{Interpolation, PowerProfile, PowerQuantity};

/// The report schema tag.
pub const SCHEMA: &str = "kshana.labfit-iq/1";

/// The statement every campaign-fit report carries.
pub const STATEMENT: &str = "MODELLED: every fitted number describes the open receiver (the named \
loop design and front-end chain) on the recordings it was given, fitted to the campaign's scored \
results. It is not a measurement of any other receiver. Predictions are labelled PREDICTION, with \
the nearest tested recording and the distance outside the tested conditions.";

/// The advisory statement of the campaign-fit report.
pub const ADVISORY: &str = "Advisory: analysis output, not type-approved navigation equipment; \
predictions are model outputs with stated error, not guarantees.";

/// Unit, provenance and definition of every numeric field of the report
/// ([`crate::field_schema`]); carried as the report's `units` block and listed in the committed
/// field-units schema.
pub const FIELD_UNITS: &[FieldUnit] = &[
    fu("settings.seed", "1", Input, "seed of the cluster bootstrap and the residual draws"),
    fu("settings.bootstrap", "count", Input, "bootstrap replicates"),
    fu("settings.min_recordings", "count", Input, "recordings a unit needs to be fitted"),
    fu("settings.q_bounds[]", "1", Input, "bounds of Q_eff when it is fitted"),
    fu("settings.delta_bounds_db[]", "dB", Input, "bounds of the J/S offset delta"),
    fu("fit_units[].data.recordings", "count", Computed, "recordings in the unit"),
    fu("fit_units[].data.satellites", "count", Computed, "recording-satellite pairs in the unit"),
    fu("fit_units[].data.events", "count", Computed, "satellite events in the unit"),
    fu("fit_units[].data.bins_used", "count", Computed, "C/N0 bins fitted"),
    fu("fit_units[].data.bins_censored", "count", Computed, "C/N0 bins censored"),
    fu("fit_units[].data.censored[].sat", "1", Input, "satellite id of a censored bin"),
    fu("fit_units[].data.censored[].js_db", "dB", Input, "stated J/S of a censored bin"),
    fu("fit_units[].data.censored[].locked_fraction", "1", Computed, "fraction of the bin's stated time the satellite was locked"),
    fu("fit_units[].cn0_model.q_eff.value", "1", Input, "the stated Q (stated, not fitted)"),
    fu("fit_units[].cn0_model.q_eff.estimate", "1", Computed, "fitted Q_eff (only if separately identifiable)"),
    fu("fit_units[].cn0_model.q_eff.ci95[]", "1", Computed, "percentile 95 % interval of a fitted Q_eff"),
    fu("fit_units[].cn0_model.q_eff.boot_n", "count", Computed, "replicates that fitted"),
    fu("fit_units[].cn0_model.q_eff.boot_failed", "count", Computed, "replicates that failed to fit"),
    fu("fit_units[].cn0_model.delta_db.estimate", "dB", Computed, "J/S offset delta at the stated Q"),
    fu("fit_units[].cn0_model.delta_db.ci95[]", "dB", Computed, "percentile 95 % interval of delta"),
    fu("fit_units[].cn0_model.delta_db.boot_n", "count", Computed, "replicates that fitted"),
    fu("fit_units[].cn0_model.delta_db.boot_failed", "count", Computed, "replicates that failed to fit"),
    fu("fit_units[].cn0_model.delta_eff_db.estimate", "dB", Computed, "identifiable J/S offset delta - 10 log10 Q_eff"),
    fu("fit_units[].cn0_model.delta_eff_db.ci95[]", "dB", Computed, "percentile 95 % interval of delta_eff"),
    fu("fit_units[].cn0_model.delta_eff_db.boot_n", "count", Computed, "replicates that fitted"),
    fu("fit_units[].cn0_model.delta_eff_db.boot_failed", "count", Computed, "replicates that failed to fit"),
    fu("fit_units[].cn0_model.corr_q_delta", "1", Computed, "correlation of the 10 log10 Q_eff and delta estimates (weighted Jacobian)"),
    fu("fit_units[].cn0_model.residual_rms_db", "dB", Computed, "weighted RMS of measured minus modelled C/N0"),
    fu("fit_units[].cn0_model.span_db", "dB", Computed, "uncensored J/S span"),
    fu("fit_units[].threshold.direct.n", "count", Computed, "events that lost lock"),
    fu("fit_units[].threshold.direct.median_js_db", "dB", Computed, "median stated J/S at loss of lock"),
    fu("fit_units[].threshold.direct.iqr[]", "dB", Computed, "25th and 75th percentiles of the J/S at loss"),
    fu("fit_units[].threshold.via_model[].drop_cn0_dbhz", "dB-Hz", Computed, "the lock model's drop C/N0"),
    fu("fit_units[].threshold.via_model[].median_at_lost_events_db", "dB", ClosedForm, "median closed-form threshold J/S at each lost event's baseline"),
    fu("fit_units[].threshold.via_model[].per_baseline[].baseline_cn0_dbhz", "dB-Hz", Computed, "baseline C/N0 the threshold is stated at"),
    fu("fit_units[].threshold.via_model[].per_baseline[].js_db", "dB", ClosedForm, "closed-form threshold J/S"),
    fu("fit_units[].threshold.via_model[].per_baseline[].ci95[]", "dB", Computed, "percentile 95 % interval of the threshold J/S"),
    fu("fit_units[].lock_model[].params[].estimate", "mixed - see note", Computed, "fitted lock-model parameter: pll_bandwidth_hz in Hz, pullin_ratio 1, drop_cn0_dbhz dB-Hz, hysteresis_db dB, dwells s"),
    fu("fit_units[].lock_model[].params[].ci95[]", "mixed - see note", Computed, "percentile 95 % interval, in the parameter's unit"),
    fu("fit_units[].lock_model[].params[].boot_n", "count", Computed, "replicates that fitted"),
    fu("fit_units[].lock_model[].params[].boot_failed", "count", Computed, "replicates that failed to fit"),
    fu("fit_units[].lock_model[].residual_rms_s", "s", Computed, "RMS of the event-time residuals"),
    fu("fit_units[].lock_model[].n_events", "count", Computed, "events compared"),
    fu("fit_units[].holdout.recordings[].distance", "1", Computed, "scaled distance outside the training conditions (dB, dB-Hz and dB/s each per unit)"),
    fu("fit_units[].holdout.recordings[].bins", "count", Computed, "held-out bins"),
    fu("fit_units[].holdout.recordings[].bins_interpolation", "count", Computed, "held-out interpolation bins"),
    fu("fit_units[].holdout.recordings[].cn0_rms_db", "dB", Computed, "RMS C/N0 error over the held-out bins"),
    fu("fit_units[].holdout.recordings[].bins_in_pi90", "count", Computed, "held-out bins inside their 90 % prediction interval"),
    fu("fit_units[].holdout.recordings[].events[].n", "count", Computed, "held-out events with an observed loss"),
    fu("fit_units[].holdout.recordings[].events[].n_interpolation", "count", Computed, "of which interpolation"),
    fu("fit_units[].holdout.recordings[].events[].rms_s", "s", Computed, "RMS time-to-loss error"),
    fu("fit_units[].holdout.recordings[].events[].in_pi90", "count", Computed, "events inside their 90 % prediction interval"),
    fu("fit_units[].holdout.interpolation.bins", "count", Computed, "interpolation bins held out"),
    fu("fit_units[].holdout.interpolation.cn0_rms_db", "dB", Computed, "hold-out RMS C/N0 error, interpolation bins"),
    fu("fit_units[].holdout.interpolation.bins_pi90_coverage", "1", Computed, "fraction of interpolation bins inside their 90 % prediction interval"),
    fu("fit_units[].holdout.interpolation.events[].n", "count", Computed, "interpolation events held out"),
    fu("fit_units[].holdout.interpolation.events[].rms_s", "s", Computed, "hold-out RMS time-to-loss error, interpolation events"),
    fu("fit_units[].holdout.interpolation.events[].pi90_coverage", "1", Computed, "fraction of interpolation events inside their 90 % prediction interval"),
    fu("fit_units[].holdout.extrapolation.bins", "count", Computed, "extrapolation bins held out"),
    fu("fit_units[].holdout.extrapolation.cn0_rms_db", "dB", Computed, "hold-out RMS C/N0 error, extrapolation bins"),
    fu("fit_units[].holdout.extrapolation.bins_pi90_coverage", "1", Computed, "fraction of extrapolation bins inside their 90 % prediction interval"),
    fu("fit_units[].holdout.extrapolation.events[].n", "count", Computed, "extrapolation events held out"),
    fu("fit_units[].holdout.extrapolation.events[].rms_s", "s", Computed, "hold-out RMS time-to-loss error, extrapolation events"),
    fu("fit_units[].holdout.extrapolation.events[].pi90_coverage", "1", Computed, "fraction of extrapolation events inside their 90 % prediction interval"),
    fu("fit_units[].validation.bars[].value", "mixed - see note", Computed, "the measured value of the bar: cn0_rms_db in dB, pi90_coverage 1, loss_time_rms_s in s"),
    fu("predictions[].unit", "1", Computed, "index of the unit in fit_units"),
    fu("predictions[].condition[]", "mixed - see note", Input, "baseline C/N0 (dB-Hz), peak J/S (dB), ramp rate (dB/s)"),
    fu("predictions[].js_db", "dB", Input, "stated J/S of a C/N0 prediction"),
    fu("predictions[].value", "mixed - see note", Computed, "cn0_dbhz in dB-Hz; time_to_loss_s and reacq_time_s in s"),
    fu("predictions[].pi90[]", "mixed - see note", Computed, "90 % prediction interval, in the quantity's unit"),
    fu("predictions[].p_loss", "1", Computed, "fraction of bootstrap replicates that predict a loss"),
    fu("predictions[].extrapolation_distance", "1", Computed, "scaled distance outside the tested condition box"),
    fu("residuals[].unit", "1", Computed, "index of the unit in fit_units"),
    fu("residuals[].sat", "1", Input, "satellite id"),
    fu("residuals[].js_db", "dB", Input, "stated J/S of a bin"),
    fu("residuals[].measured", "mixed - see note", Input, "bin: measured C/N0 in dB-Hz; loss: time from onset in s; reacq: re-acquisition time in s"),
    fu("residuals[].fitted", "mixed - see note", Computed, "the fitted value, in the measured value's unit"),
    fu("residuals[].residual", "mixed - see note", Computed, "measured minus fitted, in the measured value's unit"),
];

const fn fu(
    path: &'static str,
    unit: &'static str,
    provenance: ProvenanceClass,
    definition: &'static str,
) -> FieldUnit {
    FieldUnit {
        path,
        unit,
        provenance,
        definition,
    }
}

// --- small statistics ------------------------------------------------------------------------

fn percentile(sorted: &[f64], q: f64) -> f64 {
    if sorted.is_empty() {
        return f64::NAN;
    }
    let pos = q * (sorted.len() - 1) as f64;
    let (i, frac) = (pos.floor() as usize, pos - pos.floor());
    if i + 1 >= sorted.len() {
        sorted[sorted.len() - 1]
    } else {
        sorted[i] + frac * (sorted[i + 1] - sorted[i])
    }
}

fn sorted(v: &[f64]) -> Vec<f64> {
    let mut s: Vec<f64> = v.iter().copied().filter(|x| x.is_finite()).collect();
    s.sort_by(f64::total_cmp);
    s
}

fn median(v: &[f64]) -> Option<f64> {
    let s = sorted(v);
    (!s.is_empty()).then(|| percentile(&s, 0.5))
}

fn rms(v: &[f64]) -> Option<f64> {
    (!v.is_empty()).then(|| (v.iter().map(|x| x * x).sum::<f64>() / v.len() as f64).sqrt())
}

// --- report types ----------------------------------------------------------------------------

/// A parameter with its bootstrap interval.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct Estimate {
    /// Best fit on all recordings.
    pub estimate: f64,
    /// Percentile 95 % interval over the replicates, `[2.5 %, 97.5 %]`.
    pub ci95: Option<[f64; 2]>,
    /// Replicates that produced a value.
    pub boot_n: usize,
    /// Replicates that failed to fit.
    pub boot_failed: usize,
}

fn est(value: f64, boot: &[f64], failed: usize) -> Estimate {
    let s = sorted(boot);
    Estimate {
        estimate: value,
        ci95: (!s.is_empty()).then(|| [percentile(&s, 0.025), percentile(&s, 0.975)]),
        boot_n: s.len(),
        boot_failed: failed,
    }
}

/// `Q_eff` as reported: an estimate, or "stated, not fitted".
#[derive(Clone, Debug, PartialEq, Serialize)]
#[serde(untagged)]
pub enum QReport {
    /// Fitted, with its interval.
    Fitted(Estimate),
    /// Held at the stated value.
    Stated {
        /// The stated value.
        value: f64,
        /// Always `stated, not fitted`.
        status: String,
        /// Where it comes from.
        source: String,
    },
}

/// The C/N0 model of one unit.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct Cn0ModelReport {
    /// `Q_eff`.
    pub q_eff: QReport,
    /// `δ` (dB).
    pub delta_db: Estimate,
    /// The identifiable offset `δ_eff = δ − 10·log10 Q_eff` (dB): the J/S offset referred to
    /// `Q = 1` (`docs/design/LABFIT-FROM-IQ.md` §13).
    pub delta_eff_db: Estimate,
    /// Correlation of the `10·log10 Q_eff` and `δ` estimates (weighted Jacobian).
    pub corr_q_delta: Option<f64>,
    /// `fitted` or `fixed-stated`.
    pub q_mode: String,
    /// Why `Q` is held at its stated value, in fixed-stated mode.
    pub q_mode_reason: Option<String>,
    /// Weighted RMS residual (dB).
    pub residual_rms_db: f64,
    /// Uncensored J/S span (dB).
    pub span_db: f64,
}

/// A censored bin.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct CensoredBin {
    /// Recording.
    pub recording: String,
    /// Satellite.
    pub sat: i64,
    /// Event.
    pub event_id: String,
    /// Stated J/S (dB).
    pub js_db: f64,
    /// Locked fraction of the bin.
    pub locked_fraction: f64,
}

/// What a unit holds.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct DataCounts {
    /// Recordings.
    pub recordings: usize,
    /// Satellites (recording × satellite).
    pub satellites: usize,
    /// Satellite events.
    pub events: usize,
    /// Bins fitted.
    pub bins_used: usize,
    /// Bins censored.
    pub bins_censored: usize,
    /// The censored bins.
    pub censored: Vec<CensoredBin>,
}

/// The threshold J/S at one baseline C/N0, by the closed form.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct ThresholdAt {
    /// Baseline C/N0 (dB-Hz).
    pub baseline_cn0_dbhz: f64,
    /// Threshold J/S (dB).
    pub js_db: Option<f64>,
    /// Percentile 95 % interval over the replicates.
    pub ci95: Option<[f64; 2]>,
}

/// The threshold through one lock model.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct ThresholdViaModel {
    /// The lock model.
    pub model: ModelKind,
    /// Its drop C/N0 (dB-Hz).
    pub drop_cn0_dbhz: Option<f64>,
    /// At the unit's lowest, median and highest baseline.
    pub per_baseline: Vec<ThresholdAt>,
    /// Median of the closed form at each lost event's own baseline (dB): comparable with the
    /// direct estimate.
    pub median_at_lost_events_db: Option<f64>,
}

/// The direct threshold estimate.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct ThresholdDirect {
    /// Events that lost lock.
    pub n: usize,
    /// Median `js_at_loss_db` (dB).
    pub median_js_db: Option<f64>,
    /// Interquartile range `[25 %, 75 %]` (dB).
    pub iqr: Option<[f64; 2]>,
}

/// The threshold, two ways.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct ThresholdReport {
    /// From the scored `js_at_loss_db`.
    pub direct: ThresholdDirect,
    /// Through each lock model and the C/N0 model.
    pub via_model: Vec<ThresholdViaModel>,
}

/// A lock-model parameter.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct LockParam {
    /// Name.
    pub name: String,
    /// Estimate and interval.
    #[serde(flatten)]
    pub value: Estimate,
    /// On a bound of the search box.
    pub at_bound: bool,
}

/// One fitted lock model.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct LockModelReport {
    /// The model.
    pub model: ModelKind,
    /// The four parameters.
    pub params: Vec<LockParam>,
    /// RMS of the event-time residuals (s).
    pub residual_rms_s: Option<f64>,
    /// Events compared.
    pub n_events: usize,
}

/// One held-out recording.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct HoldoutRecording {
    /// Recording.
    pub recording: String,
    /// `interpolation` or `extrapolation`.
    pub class: String,
    /// Scaled distance outside the training conditions (0 inside).
    pub distance: f64,
    /// Nearest training recording.
    pub nearest_recording: String,
    /// Held-out bins.
    pub bins: usize,
    /// Of which interpolation.
    pub bins_interpolation: usize,
    /// RMS C/N0 error over the held-out bins (dB).
    pub cn0_rms_db: Option<f64>,
    /// Bins inside their 90 % interval.
    pub bins_in_pi90: usize,
    /// Held-out events with an observed or predicted loss, per lock model:
    /// `(model, events, interpolation events, RMS time-to-loss error, inside PI90)`.
    pub events: Vec<HoldoutEvents>,
}

/// Held-out loss times of one recording under one lock model.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct HoldoutEvents {
    /// The model.
    pub model: ModelKind,
    /// Events compared.
    pub n: usize,
    /// Of which interpolation.
    pub n_interpolation: usize,
    /// RMS time-to-loss error (s).
    pub rms_s: Option<f64>,
    /// Events inside their 90 % interval.
    pub in_pi90: usize,
}

/// Aggregate hold-out figures over one class of held-out items.
#[derive(Clone, Debug, Default, PartialEq, Serialize)]
pub struct HoldoutSummary {
    /// Bins.
    pub bins: usize,
    /// RMS C/N0 error (dB).
    pub cn0_rms_db: Option<f64>,
    /// Fraction of bins inside their 90 % interval.
    pub bins_pi90_coverage: Option<f64>,
    /// Per lock model, the held-out loss times.
    pub events: Vec<HoldoutGroup>,
}

/// Held-out loss times of one class under one lock model.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct HoldoutGroup {
    /// The model.
    pub model: ModelKind,
    /// Events.
    pub n: usize,
    /// RMS time-to-loss error (s).
    pub rms_s: Option<f64>,
    /// Fraction of events inside their 90 % interval.
    pub pi90_coverage: Option<f64>,
}

/// Leave-one-recording-out hold-out.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct HoldoutReport {
    /// Per recording.
    pub recordings: Vec<HoldoutRecording>,
    /// Over interpolation items.
    pub interpolation: HoldoutSummary,
    /// Over extrapolation items (reported, never gated).
    pub extrapolation: HoldoutSummary,
}

/// One evaluated bar.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct BarResult {
    /// Name.
    pub bar: String,
    /// The bar as stated.
    pub limit: String,
    /// The measured value.
    pub value: Option<f64>,
    /// `PASS` or `FAIL` (a value that cannot be computed fails).
    pub verdict: String,
}

/// The `[validation]` evaluation.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct ValidationReport {
    /// SHA-256 of the canonical JSON of the `[validation]` table.
    pub table_sha256: String,
    /// The stated registration date.
    pub registered: String,
    /// Each bar, on interpolation hold-outs only.
    pub bars: Vec<BarResult>,
}

/// One unit's report.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct UnitReport {
    /// Signal.
    pub signal: String,
    /// Loop design.
    pub design: super::campaign::Named,
    /// Front-end chain.
    pub frontend: super::campaign::Named,
    /// Jammer type as stated.
    pub jammer_type: String,
    /// `fitted` or `insufficient data: not fitted`.
    pub status: String,
    /// Counts.
    pub data: DataCounts,
    /// The C/N0 model.
    pub cn0_model: Option<Cn0ModelReport>,
    /// The threshold.
    pub threshold: Option<ThresholdReport>,
    /// The lock models.
    pub lock_model: Vec<LockModelReport>,
    /// `fitted`, or `not fitted: <reason>`.
    pub reacq: String,
    /// Hold-out.
    pub holdout: Option<HoldoutReport>,
    /// The `[validation]` bars.
    pub validation: Option<ValidationReport>,
}

/// One prediction.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct IqPrediction {
    /// Always `PREDICTION`.
    pub label: String,
    /// Unit index in `units`.
    pub unit: usize,
    /// The query's name.
    pub query: String,
    /// The condition: baseline C/N0 (dB-Hz), peak J/S (dB), ramp (dB/s).
    pub condition: [f64; 3],
    /// `cn0_dbhz` (at `js_db`), `time_to_loss_s` or `reacq_time_s`.
    pub quantity: String,
    /// Stated J/S of a `cn0_dbhz` prediction (dB).
    pub js_db: Option<f64>,
    /// The lock model of a time prediction.
    pub model: Option<ModelKind>,
    /// Point prediction from the full fit (`null` when no loss is predicted).
    pub value: Option<f64>,
    /// 90 % prediction interval `[5 %, 95 %]`.
    pub pi90: Option<[f64; 2]>,
    /// Fraction of replicates that predict a loss.
    pub p_loss: Option<f64>,
    /// Nearest tested recording.
    pub nearest_recording: Option<String>,
    /// Scaled distance outside the tested condition box (0 inside).
    pub extrapolation_distance: f64,
    /// Whether the condition lies outside the tested box.
    pub extrapolation: bool,
}

/// Input provenance.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct Inputs {
    /// The campaign `DIGEST`.
    pub campaign_digest: String,
    /// SHA-256 of `campaign.json`.
    pub campaign_json_sha256: String,
    /// Every cell key and the SHA-256 of its file.
    pub cells: Vec<KeyHash>,
    /// Every recording's test-condition hash.
    pub test_conditions: Vec<KeyHash>,
    /// SHA-256 of the labfit scenario (canonical JSON, the campaign path left out).
    pub scenario_sha256: String,
}

/// A key and a hash.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct KeyHash {
    /// Key.
    pub key: String,
    /// SHA-256.
    pub sha256: String,
}

/// The `kshana.labfit-iq/1` report.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct LabFitIqReport {
    /// `kshana.labfit-iq/1`.
    pub schema: String,
    /// Engine version.
    pub engine_version: String,
    /// Scenario name.
    pub name: Option<String>,
    /// Inputs.
    pub inputs: Inputs,
    /// The settings used.
    pub settings: CampaignFitCfg,
    /// The fit units (§6 `units[]`; renamed because the top-level `units` is the
    /// field-units block every result document carries).
    pub fit_units: Vec<UnitReport>,
    /// The predictions.
    pub predictions: Vec<IqPrediction>,
    /// The residuals (one row per bin and per event and model).
    pub residuals: Vec<ResidualRow>,
    /// Always `MODELLED`.
    pub label: String,
    /// The statement.
    pub statement: String,
    /// The advisory.
    pub advisory: String,
    /// Stated limitations.
    pub notes: Vec<String>,
    /// Unit and provenance of every numeric field ([`FIELD_UNITS`]).
    pub units: serde_json::Value,
}

/// One residual row.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct ResidualRow {
    /// Unit index.
    pub unit: usize,
    /// Cell key.
    pub cell: String,
    /// Recording.
    pub recording: String,
    /// Satellite.
    pub sat: i64,
    /// Event.
    pub event_id: String,
    /// `bin` or `loss` or `reacq`.
    pub kind: String,
    /// Lock model of an event row.
    pub model: Option<ModelKind>,
    /// Stated J/S of a bin (dB).
    pub js_db: Option<f64>,
    /// Measured value (dB-Hz or s from onset).
    pub measured: Option<f64>,
    /// Fitted value.
    pub fitted: Option<f64>,
    /// Measured minus fitted.
    pub residual: Option<f64>,
    /// Whether the bin was censored.
    pub censored: bool,
}

// --- data preparation ------------------------------------------------------------------------

/// A satellite event ready for the lock fit.
#[derive(Clone, Debug)]
struct LockEv<'a> {
    rec: usize,
    ev: &'a SatEvent,
    c0: f64,
    end: f64,
    /// Observed loss time (s), absolute.
    loss: Option<f64>,
    /// Observed re-acquisition (s), absolute.
    reacq: Option<f64>,
}

fn lock_events<'a>(unit: &'a FitUnit, grace: f64) -> Vec<LockEv<'a>> {
    let mut v = Vec::new();
    for (ri, r) in unit.recordings.iter().enumerate() {
        for e in &r.events {
            let Some(c0) = e.baseline_cn0_dbhz else {
                continue;
            };
            if !e.locked_at_onset || e.power.is_none() {
                continue;
            }
            let loss = if e.lost {
                e.time_to_loss_s.map(|t| e.onset_s + t)
            } else {
                None
            };
            let reacq = match (loss, e.reacquired, e.reacq_time_s) {
                (Some(l), true, Some(t)) => Some(l.max(e.offset_s) + t),
                _ => None,
            };
            v.push(LockEv {
                rec: ri,
                ev: e,
                c0,
                end: (e.offset_s + grace).min(e.run_end_s.unwrap_or(f64::INFINITY)),
                loss,
                reacq,
            });
        }
    }
    v
}

fn cn0_points(unit: &FitUnit, recs: &[usize]) -> Vec<Cn0Point> {
    let mut v = Vec::new();
    for &ri in recs {
        for e in &unit.recordings[ri].events {
            let Some(c0) = e.baseline_cn0_dbhz else {
                continue;
            };
            if !e.locked_at_onset {
                continue;
            }
            for b in e.bins.iter().filter(|b| !b.censored) {
                if let Some(m) = b.measured_cn0_dbhz {
                    v.push(Cn0Point {
                        c0_dbhz: c0,
                        js_db: b.js_db,
                        cn0_dbhz: m,
                        weight: b.n as f64,
                        chip_rate_hz: unit.chip_rate_hz,
                    });
                }
            }
        }
    }
    v
}

/// The stated J/S profile of `power` over `[onset, offset)` as `j-over-s` conditions for the
/// lock models, and the level offset (dB) that makes them follow the §3.1 C/N0 model exactly.
///
/// The receiver-log conditions model a `j-over-s` level with the type table's `Q` and the C/A
/// chip rate `R_CA`; with `cw` (`Q = 1`), `10^((J/S + o)/10) / R_CA` equals the §3.1 term
/// `10^((J/S + δ)/10) / (Q·R_c)` when `o = δ − 10·log10(Q·R_c / R_CA)`. The profile's own
/// points are kept, so a linear ramp stays exact, and loss and re-lock times follow from the
/// closed-form crossing of each piece.
fn js_conditions(power: &PowerProfile, onset: f64, offset: f64) -> Conditions {
    Conditions {
        onset_s: onset,
        offset_s: Some(offset),
        level_kind: LevelKind::JOverS,
        levels: power
            .points
            .iter()
            .map(|p| LevelPoint {
                t_s: p[0],
                level_db: power.js_db_at(p[0]),
            })
            .collect(),
        interp: match power.interpolation {
            Interpolation::Step => Interp::Step,
            Interpolation::Linear => Interp::Linear,
        },
        jammer_type: Some("cw".into()),
        doppler_rate_hz_per_s: 0.0,
        code_slew_chips_per_s: 0.0,
    }
}

/// The level offset of [`js_conditions`] for a C/N0 fit.
fn js_offset_db(fit: &Cn0Fit, rc: f64) -> f64 {
    fit.delta_db - 10.0 * (fit.q * rc / crate::jamming::CA_CHIP_RATE_HZ).plog10()
}

/// Lock events with their modelled C/N0 profiles under one C/N0 fit.
struct Prepared<'a> {
    ev: LockEv<'a>,
    cond: Conditions,
    off: f64,
}

fn prepare<'a>(evs: &[LockEv<'a>], recs: &[usize], fit: &Cn0Fit, rc: f64) -> Vec<Prepared<'a>> {
    let mut out = Vec::new();
    for &ri in recs {
        for e in evs.iter().filter(|e| e.rec == ri) {
            let p = e.ev.power.as_ref().expect("lock events carry power");
            out.push(Prepared {
                ev: e.clone(),
                cond: js_conditions(p, e.ev.onset_s, e.ev.offset_s),
                off: js_offset_db(fit, rc),
            });
        }
    }
    out
}

// --- lock fit --------------------------------------------------------------------------------

fn sse_parts(kind: ModelKind, th: &[f64; 4], ps: &[Prepared], sc: &LabFitScenario) -> (f64, f64) {
    let (mut l, mut r) = (0.0, 0.0);
    for p in ps {
        let lp = lock_params(kind, th, &sc.loop_fixed, &p.cond);
        let m = simulate_sat(&p.cond, p.ev.c0, p.off, &lp, p.ev.end);
        let end = p.ev.end;
        let sq = |o: Option<f64>, m: Option<f64>| match (o, m) {
            (Some(o), Some(m)) => (m - o).ppowi(2),
            (Some(o), None) => (end - o).ppowi(2),
            (None, Some(m)) => (m - end).ppowi(2),
            (None, None) => 0.0,
        };
        l += sq(p.ev.loss, m.loss_s);
        r += sq(p.ev.reacq, m.reacq_s);
    }
    (l, r)
}

/// Nelder-Mead settings: the full fits run to tight tolerances; a warm-started refit (a
/// bootstrap replicate, starting at the full fit) stops at 1e-4 in each parameter's own unit
/// or after 200 evaluations per stage, far below the spread the replicates measure.
fn nm_opts(sc: &LabFitScenario, warm: bool) -> NmOptions {
    if warm {
        NmOptions {
            max_evals: 200,
            ftol: 1e-8,
            xtol: 1e-4,
            initial_step: 0.1,
            max_restarts: 0,
        }
    } else {
        NmOptions {
            max_evals: sc.fit.max_evals.max(50),
            ftol: 1e-10,
            xtol: 1e-8,
            initial_step: 0.1,
            max_restarts: 3,
        }
    }
}

fn arr4(x: &[f64]) -> [f64; 4] {
    [x[0], x[1], x[2], x[3]]
}

#[allow(clippy::too_many_arguments)]
fn fit_pair<F: Fn(&[f64; 4]) -> f64>(
    f: F,
    base: [f64; 4],
    dims: [usize; 2],
    lo: &[f64; 4],
    hi: &[f64; 4],
    sc: &LabFitScenario,
    warm: bool,
) -> [f64; 4] {
    let put = |x: &[f64]| {
        let mut t = base;
        t[dims[0]] = x[0];
        t[dims[1]] = x[1];
        t
    };
    let g = |x: &[f64]| f(&put(x));
    let lo2 = [lo[dims[0]], lo[dims[1]]];
    let hi2 = [hi[dims[0]], hi[dims[1]]];
    let starts: Vec<Vec<f64>> = if warm {
        vec![vec![base[dims[0]], base[dims[1]]]]
    } else {
        let pts = sc.fit.grid_points.max(2) * 2 + 1;
        grid_search(g, &lo2, &hi2, pts)
            .into_iter()
            .take(3)
            .map(|(x, _)| x)
            .collect()
    };
    let opts = nm_opts(sc, warm);
    let mut best: Option<(Vec<f64>, f64)> = None;
    for s in starts {
        let r = nelder_mead_bounded(g, &s, &lo2, &hi2, &opts);
        if best.as_ref().is_none_or(|b| r.f < b.1) {
            best = Some((r.x, r.f));
        }
    }
    best.map_or(base, |b| put(&b.0))
}

/// Fit one lock model, staged as the receiver-log fit is: the drop pair on loss times, the
/// re-lock pair on everything, then all four jointly.
fn fit_lock(
    kind: ModelKind,
    ps: &[Prepared],
    sc: &LabFitScenario,
    start: Option<[f64; 4]>,
) -> [f64; 4] {
    let (lo, hi) = kind.bounds(&sc.bounds);
    let mid = [
        0.5 * (lo[0] + hi[0]),
        0.5 * (lo[1] + hi[1]),
        0.5 * (lo[2] + hi[2]),
        0.5 * (lo[3] + hi[3]),
    ];
    let warm = start.is_some();
    let base = start.unwrap_or(mid);
    let loss_only = |t: &[f64; 4]| sse_parts(kind, t, ps, sc).0;
    let total = |t: &[f64; 4]| {
        let (l, r) = sse_parts(kind, t, ps, sc);
        l + r
    };
    let a = fit_pair(loss_only, base, [0, 2], &lo, &hi, sc, warm);
    let b = fit_pair(total, a, [1, 3], &lo, &hi, sc, warm);
    let joint = nelder_mead_bounded(
        |x: &[f64]| total(&arr4(x)),
        &b,
        &lo,
        &hi,
        &nm_opts(sc, warm),
    );
    if joint.f < total(&b) {
        arr4(&joint.x)
    } else {
        b
    }
}

/// Modelled time to loss (s from onset) and re-acquisition time (s from the later of the loss
/// and the event's end) of one prepared event.
fn predict_times(
    kind: ModelKind,
    th: &[f64; 4],
    p: &Prepared,
    sc: &LabFitScenario,
) -> (Option<f64>, Option<f64>) {
    let lp = lock_params(kind, th, &sc.loop_fixed, &p.cond);
    let m = simulate_sat(&p.cond, p.ev.c0, p.off, &lp, p.ev.end);
    let ttl = m.loss_s.map(|l| l - p.ev.ev.onset_s);
    let re = match (m.loss_s, m.reacq_s) {
        (Some(l), Some(r)) => Some(r - l.max(p.ev.ev.offset_s)),
        _ => None,
    };
    (ttl, re)
}

// --- one fit (full, replicate or fold) -------------------------------------------------------

#[derive(Clone, Debug)]
struct OneFit {
    cn0: Cn0Fit,
    thetas: Vec<[f64; 4]>,
    /// Training residuals: C/N0 (dB) and, per model, loss-time residuals (s).
    cn0_res: Vec<f64>,
    loss_res: Vec<Vec<f64>>,
    reacq_res: Vec<Vec<f64>>,
}

struct UnitCtx<'a> {
    unit: &'a FitUnit,
    evs: Vec<LockEv<'a>>,
    cfg: Cn0FitCfg,
    sc: &'a LabFitScenario,
    lock: bool,
}

impl UnitCtx<'_> {
    fn fit(&self, recs: &[usize], mode: Option<QMode>, warm: Option<&OneFit>) -> Option<OneFit> {
        let pts = cn0_points(self.unit, recs);
        let mode = mode.unwrap_or_else(|| cn0::choose_mode(&pts, &self.cfg).0);
        let c = cn0::fit_in_mode(&pts, &self.cfg, mode)?;
        if !(c.q.is_finite() && c.delta_db.is_finite()) {
            return None;
        }
        let cn0_res = pts.iter().map(|p| p.residual(c.q, c.delta_db)).collect();
        let mut thetas = Vec::new();
        let mut loss_res = Vec::new();
        let mut reacq_res = Vec::new();
        if self.lock {
            let ps = prepare(&self.evs, recs, &c, self.unit.chip_rate_hz);
            for (k, kind) in ModelKind::ALL.iter().enumerate() {
                let th = fit_lock(*kind, &ps, self.sc, warm.map(|w| w.thetas[k]));
                let (mut lr, mut rr) = (Vec::new(), Vec::new());
                for p in &ps {
                    let (ttl, re) = predict_times(*kind, &th, p, self.sc);
                    if let (Some(o), Some(m)) = (p.ev.loss.map(|l| l - p.ev.ev.onset_s), ttl) {
                        lr.push(o - m);
                    }
                    let obs_re =
                        p.ev.reacq
                            .zip(p.ev.loss)
                            .map(|(r, l)| r - l.max(p.ev.ev.offset_s));
                    if let (Some(o), Some(m)) = (obs_re, re) {
                        rr.push(o - m);
                    }
                }
                thetas.push(th);
                loss_res.push(lr);
                reacq_res.push(rr);
            }
        }
        Some(OneFit {
            cn0: c,
            thetas,
            cn0_res,
            loss_res,
            reacq_res,
        })
    }

    /// The bootstrap: `b` replicates over `train` recordings.
    fn bootstrap(&self, train: &[usize], full: &OneFit, b: usize, seed: u64) -> Boot {
        let mut rng = ChaCha8Rng::seed_from_u64(seed);
        let mut reps = Vec::with_capacity(b);
        let mut failed = 0;
        let m = train.len();
        for _ in 0..b {
            let idx: Vec<usize> = (0..m)
                .map(|_| train[crate::portable_math::uniform_index(&mut rng, m)])
                .collect();
            match self.fit(&idx, Some(full.cn0.mode), Some(full)) {
                Some(f) => reps.push(f),
                None => failed += 1,
            }
        }
        Boot { reps, failed }
    }
}

struct Boot {
    reps: Vec<OneFit>,
    failed: usize,
}

/// A condition of the tested box: baseline C/N0, peak J/S, ramp rate.
fn coords(c0: f64, ev: &SatEvent) -> [f64; 3] {
    [c0, ev.peak_js_db().unwrap_or(f64::NAN), ev.ramp_db_per_s()]
}

/// Distance outside the box of `pts` (0 inside) and the nearest point's label.
fn place(q: [f64; 3], pts: &[([f64; 3], String)]) -> (f64, String) {
    let Some(first) = pts.first() else {
        return (f64::INFINITY, String::new());
    };
    let mut lo = first.0;
    let mut hi = first.0;
    for (p, _) in pts {
        for i in 0..3 {
            lo[i] = lo[i].min(p[i]);
            hi[i] = hi[i].max(p[i]);
        }
    }
    let ext = (0..3)
        .map(|i| (lo[i] - q[i]).max(q[i] - hi[i]).max(0.0).ppowi(2))
        .sum::<f64>()
        .sqrt();
    let mut best = (f64::INFINITY, first.1.clone());
    for (p, l) in pts {
        let d = (0..3).map(|i| (p[i] - q[i]).ppowi(2)).sum::<f64>().sqrt();
        if d < best.0 {
            best = (d, l.clone());
        }
    }
    (ext, best.1)
}

/// A 90 % prediction interval from per-replicate predictions plus residual draws.
fn pi90(rng: &mut ChaCha8Rng, preds: &[(f64, &[f64])]) -> Option<[f64; 2]> {
    let mut draws = Vec::with_capacity(preds.len());
    for (p, res) in preds {
        if res.is_empty() || !p.is_finite() {
            continue;
        }
        draws.push(p + res[crate::portable_math::uniform_index(rng, res.len())]);
    }
    let s = sorted(&draws);
    (s.len() >= 2).then(|| [percentile(&s, 0.05), percentile(&s, 0.95)])
}

/// A tolerance for the "inside the tested box" test.
const BOX_TOL: f64 = 1e-9;

// --- the unit fit ----------------------------------------------------------------------------

struct UnitOut {
    report: UnitReport,
    residuals: Vec<ResidualRow>,
    predictions: Vec<IqPrediction>,
}

fn validation_sha(v: &ValidationCfg) -> String {
    let j = serde_json::to_value(v).unwrap_or_default();
    crate::iq::campaign::hash::canonical_hash(&j).to_string()
}

#[allow(clippy::too_many_lines)]
fn fit_unit(
    ui: usize,
    unit: &FitUnit,
    data: &CampaignData,
    sc: &LabFitScenario,
    cf: &CampaignFitCfg,
) -> UnitOut {
    let m = unit.recordings.len();
    let censored: Vec<CensoredBin> = unit
        .recordings
        .iter()
        .flat_map(|r| {
            r.events.iter().flat_map(move |e| {
                e.bins
                    .iter()
                    .filter(|b| b.censored)
                    .map(move |b| CensoredBin {
                        recording: r.recording.clone(),
                        sat: e.sat,
                        event_id: e.event_id.clone(),
                        js_db: b.js_db,
                        locked_fraction: b.locked_fraction,
                    })
            })
        })
        .collect();
    let all: Vec<usize> = (0..m).collect();
    let pts_all = cn0_points(unit, &all);
    let counts = DataCounts {
        recordings: m,
        satellites: unit
            .recordings
            .iter()
            .map(|r| {
                let mut s: Vec<i64> = r.events.iter().map(|e| e.sat).collect();
                s.sort_unstable();
                s.dedup();
                s.len()
            })
            .sum(),
        events: unit.recordings.iter().map(|r| r.events.len()).sum(),
        bins_used: pts_all.len(),
        bins_censored: censored.len(),
        censored,
    };
    let mut report = UnitReport {
        signal: unit.signal.clone(),
        design: unit.design.clone(),
        frontend: unit.frontend.clone(),
        jammer_type: unit.jammer_type.clone(),
        status: String::new(),
        data: counts,
        cn0_model: None,
        threshold: None,
        lock_model: Vec::new(),
        reacq: String::new(),
        holdout: None,
        validation: None,
    };
    let min_rec = cf.min_recordings.max(5);
    if m < min_rec {
        report.status = format!(
            "insufficient data: not fitted ({m} recordings; at least {min_rec} are needed)"
        );
        report.reacq = "not fitted: insufficient data".into();
        return UnitOut {
            report,
            residuals: Vec::new(),
            predictions: Vec::new(),
        };
    }
    let ctx = UnitCtx {
        unit,
        evs: lock_events(unit, data.reacq_grace_s),
        cfg: Cn0FitCfg {
            q_bounds: cf.q_bounds,
            delta_bounds_db: cf.delta_bounds_db,
            q_stated: unit.q_stated,
        },
        sc,
        lock: cf.lock_models,
    };
    let Some(full) = ctx.fit(&all, None, None) else {
        report.status = "insufficient data: not fitted (no uncensored C/N0 bin)".into();
        report.reacq = "not fitted: insufficient data".into();
        return UnitOut {
            report,
            residuals: Vec::new(),
            predictions: Vec::new(),
        };
    };
    report.status = "fitted".into();
    let seed = cf.seed ^ (ui as u64).wrapping_mul(0x9e37_79b9_7f4a_7c15);
    let boot = ctx.bootstrap(&all, &full, cf.bootstrap, seed);
    // C/N0 model.
    let (mode, _) = cn0::choose_mode(&pts_all, &ctx.cfg);
    let reason = (mode == QMode::FixedStated).then(|| {
        if full.cn0.span_db < cn0::MIN_SPAN_DB {
            format!(
                "uncensored J/S span {:.1} dB is under {} dB",
                full.cn0.span_db,
                cn0::MIN_SPAN_DB
            )
        } else {
            format!(
                "Q_eff and delta are not separately identifiable (|corr| {:.4} >= {}): the \
                 model depends on delta - 10 log10 Q_eff only",
                full.cn0.corr_q_delta.map_or(1.0, f64::abs),
                cn0::MAX_ABS_CORR
            )
        }
    });
    let bq: Vec<f64> = boot.reps.iter().map(|r| r.cn0.q).collect();
    let bd: Vec<f64> = boot.reps.iter().map(|r| r.cn0.delta_db).collect();
    report.cn0_model = Some(Cn0ModelReport {
        q_eff: match mode {
            QMode::Fitted => QReport::Fitted(est(full.cn0.q, &bq, boot.failed)),
            QMode::FixedStated => QReport::Stated {
                value: unit.q_stated,
                status: "stated, not fitted".into(),
                source: unit.q_source.clone(),
            },
        },
        delta_db: est(full.cn0.delta_db, &bd, boot.failed),
        delta_eff_db: est(
            cn0::delta_eff_db(&full.cn0),
            &boot
                .reps
                .iter()
                .map(|r| cn0::delta_eff_db(&r.cn0))
                .collect::<Vec<_>>(),
            boot.failed,
        ),
        corr_q_delta: full.cn0.corr_q_delta,
        q_mode: mode.as_str().into(),
        q_mode_reason: reason,
        residual_rms_db: full.cn0.residual_rms_db,
        span_db: full.cn0.span_db,
    });
    // Residual rows: bins.
    let mut residuals = Vec::new();
    for r in &unit.recordings {
        for e in &r.events {
            for b in &e.bins {
                let fitted = e.baseline_cn0_dbhz.map(|c0| {
                    cn0::model_cn0_dbhz(
                        c0,
                        b.js_db,
                        full.cn0.q,
                        full.cn0.delta_db,
                        unit.chip_rate_hz,
                    )
                });
                residuals.push(ResidualRow {
                    unit: ui,
                    cell: r.cell_key.clone(),
                    recording: r.recording.clone(),
                    sat: e.sat,
                    event_id: e.event_id.clone(),
                    kind: "bin".into(),
                    model: None,
                    js_db: Some(b.js_db),
                    measured: b.measured_cn0_dbhz,
                    fitted,
                    residual: b.measured_cn0_dbhz.zip(fitted).map(|(a, f)| a - f),
                    censored: b.censored,
                });
            }
        }
    }
    // Threshold, direct.
    let lost_js: Vec<f64> = ctx
        .evs
        .iter()
        .filter(|e| e.loss.is_some())
        .filter_map(|e| e.ev.js_at_loss_db)
        .collect();
    let sl = sorted(&lost_js);
    let direct = ThresholdDirect {
        n: sl.len(),
        median_js_db: median(&lost_js),
        iqr: (!sl.is_empty()).then(|| [percentile(&sl, 0.25), percentile(&sl, 0.75)]),
    };
    let baselines = sorted(&ctx.evs.iter().map(|e| e.c0).collect::<Vec<_>>());
    let grid_c0: Vec<f64> = if baselines.is_empty() {
        Vec::new()
    } else {
        let mut g = vec![
            baselines[0],
            percentile(&baselines, 0.5),
            baselines[baselines.len() - 1],
        ];
        g.dedup_by(|a, b| (*a - *b).abs() < 1e-9);
        g
    };
    let lost_c0: Vec<f64> = ctx
        .evs
        .iter()
        .filter(|e| e.loss.is_some() && e.ev.js_at_loss_db.is_some())
        .map(|e| e.c0)
        .collect();
    let static_cond = Conditions {
        onset_s: 0.0,
        offset_s: None,
        level_kind: LevelKind::Cn0Drop,
        levels: Vec::new(),
        interp: Interp::Step,
        jammer_type: None,
        doppler_rate_hz_per_s: 0.0,
        code_slew_chips_per_s: 0.0,
    };
    let rc = unit.chip_rate_hz;
    let mut via_model = Vec::new();
    let mut lock_reports = Vec::new();
    if cf.lock_models {
        for (k, kind) in ModelKind::ALL.iter().enumerate() {
            let drop_of =
                |th: &[f64; 4]| lock_params(*kind, th, &sc.loop_fixed, &static_cond).drop_cn0_dbhz;
            let d_full = drop_of(&full.thetas[k]);
            let per_baseline = grid_c0
                .iter()
                .map(|&c0| {
                    let b: Vec<f64> = boot
                        .reps
                        .iter()
                        .filter_map(|r| {
                            cn0::threshold_js_db(
                                c0,
                                drop_of(&r.thetas[k]),
                                r.cn0.q,
                                r.cn0.delta_db,
                                rc,
                            )
                        })
                        .collect();
                    let s = sorted(&b);
                    ThresholdAt {
                        baseline_cn0_dbhz: c0,
                        js_db: cn0::threshold_js_db(c0, d_full, full.cn0.q, full.cn0.delta_db, rc),
                        ci95: (!s.is_empty())
                            .then(|| [percentile(&s, 0.025), percentile(&s, 0.975)]),
                    }
                })
                .collect();
            let at_lost: Vec<f64> = lost_c0
                .iter()
                .filter_map(|&c0| {
                    cn0::threshold_js_db(c0, d_full, full.cn0.q, full.cn0.delta_db, rc)
                })
                .collect();
            via_model.push(ThresholdViaModel {
                model: *kind,
                drop_cn0_dbhz: d_full.is_finite().then_some(d_full),
                per_baseline,
                median_at_lost_events_db: median(&at_lost),
            });
            let (lo, hi) = kind.bounds(&sc.bounds);
            let names = kind.param_names();
            let params = (0..4)
                .map(|i| {
                    let b: Vec<f64> = boot.reps.iter().map(|r| r.thetas[k][i]).collect();
                    let v = full.thetas[k][i];
                    let tol = 1e-6 * (hi[i] - lo[i]).abs().max(1e-12);
                    LockParam {
                        name: names[i].into(),
                        value: est(v, &b, boot.failed),
                        at_bound: (v - lo[i]).abs() <= tol || (hi[i] - v).abs() <= tol,
                    }
                })
                .collect();
            let all_res: Vec<f64> = full.loss_res[k]
                .iter()
                .chain(&full.reacq_res[k])
                .copied()
                .collect();
            lock_reports.push(LockModelReport {
                model: *kind,
                params,
                residual_rms_s: rms(&all_res),
                n_events: ctx.evs.len(),
            });
            // Event residual rows.
            let ps = prepare(&ctx.evs, &all, &full.cn0, rc);
            for p in &ps {
                let (ttl, re) = predict_times(*kind, &full.thetas[k], p, sc);
                let r = &unit.recordings[p.ev.rec];
                let obs_ttl = p.ev.loss.map(|l| l - p.ev.ev.onset_s);
                let obs_re =
                    p.ev.reacq
                        .zip(p.ev.loss)
                        .map(|(x, l)| x - l.max(p.ev.ev.offset_s));
                for (kindname, o, f) in [("loss", obs_ttl, ttl), ("reacq", obs_re, re)] {
                    if o.is_none() && f.is_none() {
                        continue;
                    }
                    residuals.push(ResidualRow {
                        unit: ui,
                        cell: r.cell_key.clone(),
                        recording: r.recording.clone(),
                        sat: p.ev.ev.sat,
                        event_id: p.ev.ev.event_id.clone(),
                        kind: kindname.into(),
                        model: Some(*kind),
                        js_db: None,
                        measured: o,
                        fitted: f,
                        residual: o.zip(f).map(|(a, b)| a - b),
                        censored: false,
                    });
                }
            }
        }
    }
    let n_reacq = ctx.evs.iter().filter(|e| e.reacq.is_some()).count();
    report.reacq = if !cf.lock_models {
        "not fitted: lock models not requested".into()
    } else if n_reacq < 3 {
        format!("not fitted: {n_reacq} re-acquisitions observed (at least 3 are needed)")
    } else {
        "fitted".into()
    };
    report.threshold = Some(ThresholdReport { direct, via_model });
    report.lock_model = lock_reports;
    // Hold-out.
    let holdout = holdout(&ctx, cf, seed);
    // Validation.
    if let Some(v) = &sc.validation {
        report.validation = Some(evaluate(v, &holdout));
    }
    report.holdout = Some(holdout);
    // Predictions.
    let tested: Vec<([f64; 3], String)> = ctx
        .evs
        .iter()
        .map(|e| (coords(e.c0, e.ev), unit.recordings[e.rec].recording.clone()))
        .collect();
    let mut preds = Vec::new();
    let mut rng = ChaCha8Rng::seed_from_u64(seed ^ 0x7072_6564); // "pred"
    for q in &sc.predict {
        if let Some(jt) = &q.conditions.jammer_type {
            if jt != &unit.jammer_type {
                continue;
            }
        }
        if q.conditions.level_kind != LevelKind::JOverS {
            continue;
        }
        let c0 = q
            .nominal_cn0_dbhz
            .unwrap_or_else(|| percentile(&baselines, 0.5));
        let power = PowerProfile {
            quantity: PowerQuantity::JsDb,
            interpolation: match q.conditions.interp {
                Interp::Step => Interpolation::Step,
                Interp::Linear => Interpolation::Linear,
            },
            points: q
                .conditions
                .sorted_levels()
                .iter()
                .map(|p| [p.t_s, p.level_db])
                .collect(),
            reference_signal_dbm: None,
        };
        if power.points.is_empty() {
            continue;
        }
        let onset = q.conditions.onset_s;
        let offset = q.conditions.offset_s.unwrap_or(q.run_end_s);
        let pseudo = SatEvent {
            sat: 0,
            event_id: q.label.clone(),
            onset_s: onset,
            offset_s: offset,
            baseline_cn0_dbhz: Some(c0),
            bins: Vec::new(),
            locked_at_onset: true,
            lost: false,
            time_to_loss_s: None,
            js_at_loss_db: None,
            reacquired: false,
            reacq_time_s: None,
            run_end_s: Some(q.run_end_s),
            power: Some(power.clone()),
        };
        let cond = coords(c0, &pseudo);
        let (ext, near) = place(cond, &tested);
        let mk = |quantity: &str, js: Option<f64>, model: Option<ModelKind>, value, pi, pl| {
            IqPrediction {
                label: "PREDICTION".into(),
                unit: ui,
                query: q.label.clone(),
                condition: cond,
                quantity: quantity.into(),
                js_db: js,
                model,
                value,
                pi90: pi,
                p_loss: pl,
                nearest_recording: (!near.is_empty()).then(|| near.clone()),
                extrapolation_distance: ext,
                extrapolation: ext > BOX_TOL,
            }
        };
        let mut levels: Vec<f64> = power.points.iter().map(|p| p[1]).collect();
        levels.sort_by(f64::total_cmp);
        levels.dedup();
        for js in levels {
            let v = cn0::model_cn0_dbhz(c0, js, full.cn0.q, full.cn0.delta_db, rc);
            let per: Vec<(f64, &[f64])> = boot
                .reps
                .iter()
                .map(|r| {
                    (
                        cn0::model_cn0_dbhz(c0, js, r.cn0.q, r.cn0.delta_db, rc),
                        r.cn0_res.as_slice(),
                    )
                })
                .collect();
            preds.push(mk(
                "cn0_dbhz",
                Some(js),
                None,
                Some(v),
                pi90(&mut rng, &per),
                None,
            ));
        }
        if cf.lock_models {
            let lev = LockEv {
                rec: usize::MAX,
                ev: &pseudo,
                c0,
                end: q.run_end_s,
                loss: None,
                reacq: None,
            };
            let mkp = |f: &Cn0Fit| Prepared {
                ev: lev.clone(),
                cond: js_conditions(&power, onset, offset),
                off: js_offset_db(f, rc),
            };
            let pf = mkp(&full.cn0);
            let pr: Vec<Prepared> = boot.reps.iter().map(|r| mkp(&r.cn0)).collect();
            for (k, kind) in ModelKind::ALL.iter().enumerate() {
                let (ttl, re) = predict_times(*kind, &full.thetas[k], &pf, sc);
                let rep: Vec<(Option<f64>, Option<f64>)> = boot
                    .reps
                    .iter()
                    .zip(&pr)
                    .map(|(r, p)| predict_times(*kind, &r.thetas[k], p, sc))
                    .collect();
                let p_loss = (!rep.is_empty()).then(|| {
                    rep.iter().filter(|x| x.0.is_some()).count() as f64 / rep.len() as f64
                });
                let per_l: Vec<(f64, &[f64])> = boot
                    .reps
                    .iter()
                    .zip(&rep)
                    .filter_map(|(r, x)| x.0.map(|t| (t, r.loss_res[k].as_slice())))
                    .collect();
                preds.push(mk(
                    "time_to_loss_s",
                    None,
                    Some(*kind),
                    ttl,
                    pi90(&mut rng, &per_l),
                    p_loss,
                ));
                let per_r: Vec<(f64, &[f64])> = boot
                    .reps
                    .iter()
                    .zip(&rep)
                    .filter_map(|(r, x)| x.1.map(|t| (t, r.reacq_res[k].as_slice())))
                    .collect();
                preds.push(mk(
                    "reacq_time_s",
                    None,
                    Some(*kind),
                    re,
                    pi90(&mut rng, &per_r),
                    None,
                ));
            }
        }
    }
    UnitOut {
        report,
        residuals,
        predictions: preds,
    }
}

/// Leave-one-recording-out: refit on the others (C/N0 mode chosen on the training data, lock
/// models from the grid), bootstrap the training set for the prediction intervals, and score
/// the held-out recording's uncensored bins and its events.
fn holdout(ctx: &UnitCtx, cf: &CampaignFitCfg, seed: u64) -> HoldoutReport {
    let unit = ctx.unit;
    let m = unit.recordings.len();
    let rc = unit.chip_rate_hz;
    let nmod = if ctx.lock { ModelKind::ALL.len() } else { 0 };
    let mut recs = Vec::new();
    // (error, inside) per class; class 0 interpolation, 1 extrapolation.
    let mut bins: [Vec<(f64, bool)>; 2] = [Vec::new(), Vec::new()];
    let mut evs: [Vec<Vec<(f64, bool)>>; 2] = [vec![Vec::new(); nmod], vec![Vec::new(); nmod]];
    let mut rng = ChaCha8Rng::seed_from_u64(seed ^ 0x686f_6c64); // "hold"
    for h in 0..m {
        let train: Vec<usize> = (0..m).filter(|&i| i != h).collect();
        let Some(f) = ctx.fit(&train, None, None) else {
            continue;
        };
        let boot = ctx.bootstrap(&train, &f, cf.bootstrap, seed ^ ((h as u64 + 1) << 32));
        // Training box for bins: J/S and baseline ranges of the uncensored training bins.
        let tp = cn0_points(unit, &train);
        let rng_of = |g: &dyn Fn(&Cn0Point) -> f64| {
            tp.iter()
                .map(g)
                .fold((f64::INFINITY, f64::NEG_INFINITY), |(a, b), x| {
                    (a.min(x), b.max(x))
                })
        };
        let (jlo, jhi) = rng_of(&|p| p.js_db);
        let (clo, chi) = rng_of(&|p| p.c0_dbhz);
        let tested: Vec<([f64; 3], String)> = ctx
            .evs
            .iter()
            .filter(|e| e.rec != h)
            .map(|e| (coords(e.c0, e.ev), unit.recordings[e.rec].recording.clone()))
            .collect();
        let held = cn0_points(unit, &[h]);
        let (mut b_err, mut b_in, mut b_int) = (Vec::new(), 0, 0);
        for p in &held {
            let pred = cn0::model_cn0_dbhz(p.c0_dbhz, p.js_db, f.cn0.q, f.cn0.delta_db, rc);
            let per: Vec<(f64, &[f64])> = boot
                .reps
                .iter()
                .map(|r| {
                    (
                        cn0::model_cn0_dbhz(p.c0_dbhz, p.js_db, r.cn0.q, r.cn0.delta_db, rc),
                        r.cn0_res.as_slice(),
                    )
                })
                .collect();
            let inside =
                pi90(&mut rng, &per).is_some_and(|[a, b]| p.cn0_dbhz >= a && p.cn0_dbhz <= b);
            let interp = p.js_db >= jlo - BOX_TOL
                && p.js_db <= jhi + BOX_TOL
                && p.c0_dbhz >= clo - BOX_TOL
                && p.c0_dbhz <= chi + BOX_TOL;
            let e = p.cn0_dbhz - pred;
            b_err.push(e);
            b_in += usize::from(inside);
            b_int += usize::from(interp);
            bins[usize::from(!interp)].push((e, inside));
        }
        // The recording's place: its events' conditions against the training box.
        let mine: Vec<&LockEv> = ctx.evs.iter().filter(|e| e.rec == h).collect();
        let (mut dist, mut near) = (0.0f64, String::new());
        for e in &mine {
            let (d, n) = place(coords(e.c0, e.ev), &tested);
            if d >= dist || near.is_empty() {
                dist = dist.max(d);
                near = n;
            }
        }
        let mut ev_rows = Vec::new();
        if ctx.lock {
            let ps = prepare(&ctx.evs, &[h], &f.cn0, rc);
            let pr: Vec<Vec<Prepared>> = boot
                .reps
                .iter()
                .map(|r| prepare(&ctx.evs, &[h], &r.cn0, rc))
                .collect();
            for (k, kind) in ModelKind::ALL.iter().enumerate() {
                let (mut err, mut inn, mut nint) = (Vec::new(), 0, 0);
                for (j, p) in ps.iter().enumerate() {
                    let Some(obs) = p.ev.loss.map(|l| l - p.ev.ev.onset_s) else {
                        continue;
                    };
                    let (pred, _) = predict_times(*kind, &f.thetas[k], p, ctx.sc);
                    let per: Vec<(f64, &[f64])> = boot
                        .reps
                        .iter()
                        .zip(&pr)
                        .filter_map(|(r, rp)| {
                            predict_times(*kind, &r.thetas[k], &rp[j], ctx.sc)
                                .0
                                .map(|t| (t, r.loss_res[k].as_slice()))
                        })
                        .collect();
                    let inside = pi90(&mut rng, &per).is_some_and(|[a, b]| obs >= a && obs <= b);
                    // A missed loss counts at the end of the modelled run.
                    let e = obs - pred.unwrap_or(p.ev.end - p.ev.ev.onset_s);
                    let (d, _) = place(coords(p.ev.c0, p.ev.ev), &tested);
                    let interp = d <= BOX_TOL;
                    err.push(e);
                    inn += usize::from(inside);
                    nint += usize::from(interp);
                    evs[usize::from(!interp)][k].push((e, inside));
                }
                ev_rows.push(HoldoutEvents {
                    model: *kind,
                    n: err.len(),
                    n_interpolation: nint,
                    rms_s: rms(&err),
                    in_pi90: inn,
                });
            }
        }
        recs.push(HoldoutRecording {
            recording: unit.recordings[h].recording.clone(),
            class: if dist <= BOX_TOL && b_int == held.len() {
                "interpolation"
            } else {
                "extrapolation"
            }
            .into(),
            distance: dist,
            nearest_recording: near,
            bins: held.len(),
            bins_interpolation: b_int,
            cn0_rms_db: rms(&b_err),
            bins_in_pi90: b_in,
            events: ev_rows,
        });
    }
    let summary = |c: usize| {
        let b = &bins[c];
        let errs: Vec<f64> = b.iter().map(|x| x.0).collect();
        HoldoutSummary {
            bins: b.len(),
            cn0_rms_db: rms(&errs),
            bins_pi90_coverage: (!b.is_empty())
                .then(|| b.iter().filter(|x| x.1).count() as f64 / b.len() as f64),
            events: (0..nmod)
                .map(|k| {
                    let e = &evs[c][k];
                    let errs: Vec<f64> = e.iter().map(|x| x.0).collect();
                    HoldoutGroup {
                        model: ModelKind::ALL[k],
                        n: e.len(),
                        rms_s: rms(&errs),
                        pi90_coverage: (!e.is_empty())
                            .then(|| e.iter().filter(|x| x.1).count() as f64 / e.len() as f64),
                    }
                })
                .collect(),
        }
    };
    HoldoutReport {
        recordings: recs,
        interpolation: summary(0),
        extrapolation: summary(1),
    }
}

fn evaluate(v: &ValidationCfg, h: &HoldoutReport) -> ValidationReport {
    let i = &h.interpolation;
    let verdict = |ok: bool| if ok { "PASS" } else { "FAIL" }.to_string();
    let mut bars = vec![
        BarResult {
            bar: "cn0_rms_db".into(),
            limit: format!("<= {}", v.cn0_rms_db_max),
            value: i.cn0_rms_db,
            verdict: verdict(i.cn0_rms_db.is_some_and(|x| x <= v.cn0_rms_db_max)),
        },
        BarResult {
            bar: "pi90_coverage".into(),
            limit: format!("in [{}, {}]", v.pi90_coverage[0], v.pi90_coverage[1]),
            value: i.bins_pi90_coverage,
            verdict: verdict(
                i.bins_pi90_coverage
                    .is_some_and(|x| x >= v.pi90_coverage[0] && x <= v.pi90_coverage[1]),
            ),
        },
    ];
    for g in &i.events {
        let r = g.rms_s;
        bars.push(BarResult {
            bar: format!("loss_time_rms_s[{}]", g.model.as_str()),
            limit: format!("<= {}", v.loss_time_rms_s_max),
            value: r,
            verdict: verdict(r.is_some_and(|x| x <= v.loss_time_rms_s_max)),
        });
    }
    ValidationReport {
        table_sha256: validation_sha(v),
        registered: v.registered.clone(),
        bars,
    }
}

/// SHA-256 of the scenario's canonical JSON with the campaign path left out (so moving the
/// campaign folder does not change it; the campaign's own hashes stand for it).
pub fn scenario_sha256(sc: &LabFitScenario) -> String {
    let mut s = sc.clone();
    if let Some(i) = &mut s.input {
        i.campaign = None;
    }
    let j = serde_json::to_value(&s).unwrap_or_default();
    crate::iq::campaign::hash::canonical_hash(&j).to_string()
}

/// Fit every unit of `data` under the settings of `sc`.
pub fn analyse(data: &CampaignData, sc: &LabFitScenario) -> Result<LabFitIqReport, String> {
    if sc.mode.as_deref() == Some("validation") && sc.validation.is_none() {
        return Err(
            "mode = \"validation\" needs a [validation] table, written before the \
                    campaign results are read"
                .into(),
        );
    }
    if let Some(m) = &sc.mode {
        if m != "validation" {
            return Err(format!("unknown mode `{m}` (only `validation`)"));
        }
    }
    if let Some(v) = &sc.validation {
        let [a, b] = v.pi90_coverage;
        if !(0.0..=1.0).contains(&a) || !(a..=1.0).contains(&b) {
            return Err("validation.pi90_coverage must be [lower, upper] within [0, 1]".into());
        }
    }
    let cf = sc.campaign_fit.unwrap_or_default();
    if !(cf.q_bounds[0] > 0.0 && cf.q_bounds[1] > cf.q_bounds[0]) {
        return Err("campaign_fit.q_bounds must be [lower, upper] with 0 < lower < upper".into());
    }
    if cf.delta_bounds_db[1] <= cf.delta_bounds_db[0] {
        return Err("campaign_fit.delta_bounds_db must be [lower, upper]".into());
    }
    if data.units.is_empty() {
        return Err("the campaign has no event with a stated power profile to fit".into());
    }
    let mut units = Vec::new();
    let mut residuals = Vec::new();
    let mut predictions = Vec::new();
    for (ui, u) in data.units.iter().enumerate() {
        let o = fit_unit(ui, u, data, sc, &cf);
        units.push(o.report);
        residuals.extend(o.residuals);
        predictions.extend(o.predictions);
    }
    let notes = vec![
        "Q_eff is not identifiable from C/N0 data without an independent measurement of the \
         jammer and signal powers: Q_eff and delta enter the C/N0 model only as delta_eff = \
         delta - 10 log10 Q_eff, at any J/S span. Q is stated, never fitted; delta_eff is the \
         fitted parameter, and delta is the J/S offset at the stated Q \
         (docs/design/LABFIT-FROM-IQ.md section 13)."
            .to_string(),
        "An unstated or untabulated jammer type takes the most damaging stated Q, the \
         smallest in the table (cw, Q = 1)."
            .to_string(),
        "C/N0 bins where the satellite was locked for under 90 % of the bin are censored \
         (listed per unit); locked time runs from the onset to the scored first loss."
            .to_string(),
        "Lock-model refits in the bootstrap are warm-started at the full fit and can \
         understate the spread on a multimodal objective."
            .to_string(),
        "Hold-out bars are evaluated on interpolation items only; extrapolation errors are \
         reported, never gated."
            .to_string(),
    ];
    Ok(LabFitIqReport {
        schema: SCHEMA.into(),
        engine_version: env!("CARGO_PKG_VERSION").into(),
        name: sc.name.clone(),
        inputs: Inputs {
            campaign_digest: data.digest.clone(),
            campaign_json_sha256: data.campaign_json_sha256.clone(),
            cells: data
                .cells
                .iter()
                .map(|(k, h)| KeyHash {
                    key: k.clone(),
                    sha256: h.clone(),
                })
                .collect(),
            test_conditions: data
                .test_conditions
                .iter()
                .map(|(k, h)| KeyHash {
                    key: k.clone(),
                    sha256: h.clone(),
                })
                .collect(),
            scenario_sha256: scenario_sha256(sc),
        },
        settings: cf,
        fit_units: units,
        predictions,
        residuals,
        label: "MODELLED".into(),
        statement: STATEMENT.into(),
        advisory: ADVISORY.into(),
        notes,
        units: units_block(FIELD_UNITS),
    })
}

#[cfg(test)]
mod tests {
    use super::*;

    /// The `j-over-s` conditions with [`js_offset_db`] reproduce the §3.1 model exactly, for a
    /// chip rate other than C/A's and a stated `Q` other than 1.
    #[test]
    fn js_conditions_follow_the_cn0_model() {
        let power = PowerProfile {
            quantity: PowerQuantity::JsDb,
            interpolation: Interpolation::Linear,
            points: vec![[3.0, 5.0], [15.0, 45.0]],
            reference_signal_dbm: None,
        };
        let fit = Cn0Fit {
            q: 2.0,
            delta_db: -1.3,
            mode: QMode::FixedStated,
            corr_q_delta: Some(1.0),
            span_db: 30.0,
            residual_rms_db: 0.0,
            n_points: 30,
        };
        let rc = 10.23e6;
        let c = js_conditions(&power, 3.0, 16.0);
        let off = js_offset_db(&fit, rc);
        for t in [3.0, 4.2, 9.9, 14.5, 15.5] {
            let want = cn0::model_cn0_dbhz(46.0, power.js_db_at(t), fit.q, fit.delta_db, rc);
            let got = c.cn0_at(46.0, t, off);
            assert!((want - got).abs() < 1e-9, "t {t}: {want} vs {got}");
        }
        // Outside the event the satellite is at its baseline.
        assert_eq!(c.cn0_at(46.0, 2.0, off), 46.0);
        assert_eq!(c.cn0_at(46.0, 16.0, off), 46.0);
    }
}
