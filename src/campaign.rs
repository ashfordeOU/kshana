// SPDX-License-Identifier: AGPL-3.0-only
//! Campaigns: many scenarios composed into one run.
//!
//! A single scenario answers one question about one situation. A mission is a
//! sequence of situations, and a design study is a family of them. The `campaign`
//! kind composes the existing kinds without re-implementing any of them: every
//! member is an ordinary scenario table carrying its own `kind`, dispatched through
//! [`crate::api::run_toml`] exactly as the command-line interface would run it, and
//! the campaign only reads numbers back out of the result documents.
//!
//! Four sections, any combination of which may appear in one campaign:
//!
//! * **`[[phases]]` — a chained mission timeline.** Each phase runs one or more
//!   scenarios (for example a clock in holdover and an inertial navigation system
//!   coasting at the same time) over a window of the shared mission timeline. Each
//!   run's outputs are read into named *channels* (clock time error, carrier-to-noise
//!   density ratio, protection level, position error, alarm flags) by a per-kind
//!   preset or by explicit `[[phases.runs.series]]` paths, placed on the one timeline
//!   at the phase's start time, and resampled onto a common grid by zero-order hold.
//!   State is handed on in three ways, each explicit in the document:
//!   `carry` adds a channel's value at the end of the previous phase to this phase's
//!   channel (the clock phase a spoofer pulled is where the holdover starts from);
//!   `[[phases.handoff]]` writes a number from the previous phase (a channel's end
//!   value, or any path of a previous run's result) into a key of this phase's
//!   scenario before it runs; and `end_at` ends a phase at a time a run computed (a
//!   spoofing phase ends when the monitor detects the spoofer).
//! * **`[sweep]` — a parameter grid.** One to three dotted scenario keys, each over
//!   a linear or logarithmic range, with the recorded metrics read from each node's
//!   result by path. With `runs > 1` every node is itself a Monte Carlo ensemble.
//! * **`[monte_carlo]` — a seeded ensemble.** Realisation `k` runs with the seed key
//!   set to `base_seed + k`, the convention [`crate::ensemble`] uses, so the ensemble
//!   reproduces exactly; each metric reports its mean, spread, nearest-rank
//!   percentiles and a fixed-seed bootstrap 95% confidence interval on the mean
//!   ([`crate::inertial::metric_stat`], the statistic the ensemble sweep uses).
//! * **`[compose]` — several scenarios under shared conditions.** Named shared
//!   values (a jammer's power and position, say) are written into each member at the
//!   keys that member binds them to, every member runs, and a combined summary names
//!   the best and worst member for each metric.
//!
//! ## What is checked, and what is modelled
//!
//! The composition identities are pinned by tests: a one-phase campaign reproduces the
//! stand-alone scenario output bit for bit (the same result digest, and the timeline
//! values equal to the stand-alone series when the grid matches the run's step);
//! a Monte Carlo ensemble with a fixed seed is byte-stable; and on an analytic case — a
//! white-frequency-noise clock coasting after its last synchronisation, whose phase
//! error is Gaussian with zero mean and variance `q_wf * tau` — the sample mean falls
//! inside the reported confidence interval and the sample spread matches the closed
//! form. The chain itself is MODELLED: carrying an error additively across a phase
//! boundary and holding a sample until the next one are modelling choices, and each
//! phase is only as good as the kind that ran it.
//!
//! The core is sequential and touches no filesystem, so it runs unchanged in the
//! WebAssembly build.
//!
//! Campaigns are written in TOML (Tom's Obvious, Minimal Language) and results are
//! JSON (JavaScript Object Notation) documents. Every hash is SHA-256 (Secure Hash
//! Algorithm 2 with a 256-bit digest), written as lowercase hexadecimal.

use crate::field_schema::{lookup, ProvenanceClass};
use crate::palette::chart::{
    AMBER, AXIS, BLUE, CORAL, CYAN, GRID, INK, LIME, MAGENTA, MUTED, PANEL,
};
use serde::{Deserialize, Serialize};
use serde_json::{Map, Value};
use sha2::{Digest, Sha256};
use std::collections::BTreeMap;

/// The honesty label every campaign document carries.
pub const LABEL: &str = "MODELLED composition of existing scenario kinds. Every number \
     is read from a real run of the named kind; the chaining (additive carry of a \
     channel across a phase boundary, zero-order hold onto the timeline grid, a phase \
     ended at a computed time) is a modelling choice, and each phase carries the label \
     of the kind that produced it.";

/// Relative tolerance used when comparing sample times to grid times.
const T_EPS: f64 = 1e-9;

fn default_one() -> f64 {
    1.0
}

fn default_one_usize() -> usize {
    1
}

fn default_seed_key() -> String {
    "seed".to_string()
}

fn default_scale() -> String {
    "lin".to_string()
}

fn default_true() -> bool {
    true
}

/// A campaign scenario: the `kind = "campaign"` document.
#[derive(Clone, Debug, Deserialize, Serialize)]
#[serde(deny_unknown_fields)]
pub struct CampaignScenario {
    /// Always `"campaign"`.
    #[serde(default)]
    pub kind: Option<String>,
    /// A display title for the campaign.
    #[serde(default)]
    pub title: Option<String>,
    /// The campaign seed: the default base seed of the Monte Carlo section and the
    /// seed of every bootstrap resampling. Echoed in the result.
    #[serde(default)]
    pub seed: u64,
    /// The shared mission timeline's grid. Required when `phases` is present.
    #[serde(default)]
    pub timeline: Option<TimelineCfg>,
    /// The chained mission phases, in order.
    #[serde(default)]
    pub phases: Vec<PhaseCfg>,
    /// A parameter grid over one scenario.
    #[serde(default)]
    pub sweep: Option<SweepCfg>,
    /// A seeded Monte Carlo ensemble of one scenario.
    #[serde(default)]
    pub monte_carlo: Option<MonteCarloCfg>,
    /// Several scenarios run under shared conditions.
    #[serde(default)]
    pub compose: Option<ComposeCfg>,
}

/// The mission timeline grid.
#[derive(Clone, Debug, Deserialize, Serialize)]
#[serde(deny_unknown_fields)]
pub struct TimelineCfg {
    /// Grid spacing of the aligned series (s).
    pub step_s: f64,
}

/// One phase of a chained campaign.
#[derive(Clone, Debug, Deserialize, Serialize)]
#[serde(deny_unknown_fields)]
pub struct PhaseCfg {
    /// Phase name, unique within the campaign.
    pub name: String,
    /// Phase length on the mission timeline (s); the upper bound when `end_at` is set.
    pub duration_s: f64,
    /// A result path of run `end_at_run` holding a phase-local time (s) at which the
    /// phase ends early, for example `classical.detect_time_s`. A null value or a
    /// time past `duration_s` leaves the phase at `duration_s`.
    #[serde(default)]
    pub end_at: Option<String>,
    /// Which run `end_at` is read from.
    #[serde(default)]
    pub end_at_run: usize,
    /// Channels whose value at the end of the previous phase is added to this phase's
    /// values of the same channel.
    #[serde(default)]
    pub carry: Vec<String>,
    /// Numbers written from the previous phase into this phase's scenarios before
    /// they run.
    #[serde(default)]
    pub handoff: Vec<HandoffCfg>,
    /// The scenarios running during this phase.
    pub runs: Vec<RunCfg>,
}

/// One scenario running inside a phase.
#[derive(Clone, Debug, Deserialize, Serialize)]
#[serde(deny_unknown_fields)]
pub struct RunCfg {
    /// The scenario, as a table carrying its own `kind` (absent means `clock`).
    pub scenario: toml::Value,
    /// Seconds of the run's own timeline dropped before phase time zero (a warm-up).
    #[serde(default)]
    pub skip_s: f64,
    /// Which clock or sensor of a paired kind the presets read: `classical`
    /// (default) or `quantum`.
    #[serde(default)]
    pub side: Option<String>,
    /// Explicit series; replaces the kind's preset series when given.
    #[serde(default)]
    pub series: Option<Vec<SeriesSpec>>,
    /// Explicit events; replaces the kind's preset events when given.
    #[serde(default)]
    pub events: Option<Vec<EventSpec>>,
    /// Explicit alarm rules over this phase's channels; replaces the kind's preset
    /// rules when given.
    #[serde(default)]
    pub alarms: Option<Vec<AlarmRule>>,
}

/// An alarm raised from a channel of the phase, evaluated after `carry`, so a carried
/// clock error is compared against its guard as the mission sees it.
#[derive(Clone, Debug, Deserialize, Serialize)]
#[serde(deny_unknown_fields)]
pub struct AlarmRule {
    /// The channel compared.
    pub channel: String,
    /// `below`, `above` or `abs_above`.
    pub compare: String,
    /// A number, `channel:<name>` for another channel of the phase at the same time,
    /// or a result path of the run.
    pub threshold: Threshold,
}

/// A threshold: a number, or a result path (prefix `input:` for a scenario key).
#[derive(Clone, Debug, Deserialize, Serialize)]
#[serde(untagged)]
pub enum Threshold {
    /// A literal value.
    Value(f64),
    /// A path resolved against the run's result (or, with `input:`, its scenario).
    Path(String),
}

/// How one channel is read out of a run's result document.
#[derive(Clone, Debug, Deserialize, Serialize)]
#[serde(deny_unknown_fields)]
pub struct SeriesSpec {
    /// The channel name, e.g. `time_error_ns`. `alarm` is combined across runs.
    pub channel: String,
    /// The channel's unit; required for a channel the campaign does not know.
    #[serde(default)]
    pub unit: Option<String>,
    /// Path to the sample times (s), with one `[]` naming the rows, e.g. `epochs[].t`.
    pub t: String,
    /// Path to the values, sharing the rows of `t`, or a scalar broadcast to every row.
    /// Prefix `input:` reads the run's scenario instead of its result.
    pub y: String,
    /// How several values under one row are reduced: `mean`, `min`, `max`, `count`.
    #[serde(default)]
    pub reduce: Option<String>,
    /// Multiplier applied to the values.
    #[serde(default = "default_one")]
    pub scale: f64,
    /// Turn the values into a 0/1 flag: `below`, `above` or `abs_above` the threshold.
    #[serde(default)]
    pub compare: Option<String>,
    /// The threshold `compare` uses.
    #[serde(default)]
    pub threshold: Option<Threshold>,
    /// Skip the series, rather than fail, when a path is absent.
    #[serde(default)]
    pub optional: bool,
}

/// A labelled instant on the mission timeline.
#[derive(Clone, Debug, Deserialize, Serialize)]
#[serde(deny_unknown_fields)]
pub struct EventSpec {
    /// What happened.
    pub label: String,
    /// Result path of the phase-local time (s); a null value means no event.
    #[serde(default)]
    pub at: Option<String>,
    /// Result path of a flag; the event fires at phase start when it is true.
    #[serde(default)]
    pub when: Option<String>,
    /// Whether the event raises the alarm channel until the phase ends.
    #[serde(default)]
    pub alarm: bool,
}

/// A number handed from the previous phase into this phase's scenario.
#[derive(Clone, Debug, Deserialize, Serialize)]
#[serde(deny_unknown_fields)]
pub struct HandoffCfg {
    /// `channel:<name>` for a channel's value at the end of the previous phase, or a
    /// result path of the previous phase's run `from_run`.
    pub from: String,
    /// Which previous-phase run a result path is read from.
    #[serde(default)]
    pub from_run: usize,
    /// The dotted scenario key written in this phase.
    pub to: String,
    /// Which of this phase's runs is written.
    #[serde(default)]
    pub run: usize,
    /// Multiplier applied before writing.
    #[serde(default = "default_one")]
    pub scale: f64,
    /// Offset added after scaling.
    #[serde(default)]
    pub offset: f64,
    /// The unit of the written value; looked up from the source when omitted.
    #[serde(default)]
    pub unit: Option<String>,
}

/// One sweep axis.
#[derive(Clone, Debug, Deserialize, Serialize)]
#[serde(deny_unknown_fields)]
pub struct AxisCfg {
    /// Axis name (letters, digits, `_` and `-`).
    pub name: String,
    /// Dotted scenario key the axis varies.
    pub key: String,
    /// The key's unit.
    pub unit: String,
    /// First value.
    pub start: f64,
    /// Last value.
    pub stop: f64,
    /// Number of values, endpoints included (at least two).
    pub steps: usize,
    /// `lin` or `log`.
    #[serde(default = "default_scale")]
    pub scale: String,
}

/// A recorded metric.
#[derive(Clone, Debug, Deserialize, Serialize)]
#[serde(deny_unknown_fields)]
pub struct MetricCfg {
    /// Metric name (letters, digits, `_` and `-`).
    pub name: String,
    /// Result path; `[i]` and `[-1]` index arrays.
    pub path: String,
    /// The unit; looked up in the result's own units block when omitted.
    #[serde(default)]
    pub unit: Option<String>,
}

/// A parameter grid.
#[derive(Clone, Debug, Deserialize, Serialize)]
#[serde(deny_unknown_fields)]
pub struct SweepCfg {
    /// The base scenario.
    pub scenario: toml::Value,
    /// One to three axes.
    pub axes: Vec<AxisCfg>,
    /// Metrics recorded at every node.
    pub metrics: Vec<MetricCfg>,
    /// Realisations per node; above one each node is a Monte Carlo ensemble.
    #[serde(default = "default_one_usize")]
    pub runs: usize,
    /// Integer scenario key holding the seed.
    #[serde(default = "default_seed_key")]
    pub seed_key: String,
}

/// A seeded Monte Carlo ensemble.
#[derive(Clone, Debug, Deserialize, Serialize)]
#[serde(deny_unknown_fields)]
pub struct MonteCarloCfg {
    /// The scenario.
    pub scenario: toml::Value,
    /// Number of realisations (at least two).
    pub runs: usize,
    /// Integer scenario key holding the seed.
    #[serde(default = "default_seed_key")]
    pub seed_key: String,
    /// Seed of realisation zero; the scenario's own seed when omitted.
    #[serde(default)]
    pub base_seed: Option<u64>,
    /// Metrics recorded per realisation.
    pub metrics: Vec<MetricCfg>,
    /// Whether the per-realisation samples are emitted.
    #[serde(default = "default_true")]
    pub keep_samples: bool,
}

/// A value shared by the composed members.
#[derive(Clone, Debug, Deserialize, Serialize)]
#[serde(deny_unknown_fields)]
pub struct SharedCfg {
    /// Name members bind to.
    pub name: String,
    /// Unit of the value.
    pub unit: String,
    /// The value: a number, or an array of numbers.
    pub value: toml::Value,
}

/// One composed member.
#[derive(Clone, Debug, Deserialize, Serialize)]
#[serde(deny_unknown_fields)]
pub struct MemberCfg {
    /// Member label (letters, digits, `_` and `-`).
    pub label: String,
    /// The member scenario.
    pub scenario: toml::Value,
    /// Shared value name to the dotted key of this member it is written to.
    #[serde(default)]
    pub bind: BTreeMap<String, String>,
    /// Metrics recorded for this member.
    pub metrics: Vec<MetricCfg>,
}

/// Several scenarios run under shared conditions.
#[derive(Clone, Debug, Deserialize, Serialize)]
#[serde(deny_unknown_fields)]
pub struct ComposeCfg {
    /// The shared values.
    #[serde(default)]
    pub shared: Vec<SharedCfg>,
    /// The members.
    pub members: Vec<MemberCfg>,
}

// ---------------------------------------------------------------------------
// Output
// ---------------------------------------------------------------------------

/// The campaign result document.
#[derive(Clone, Debug, Serialize)]
pub struct CampaignResult {
    /// Interchange schema version of this document ([`crate::interchange::SCHEMA_VERSION`]).
    pub schema_version: String,
    /// Version of the engine that produced the document (the crate version).
    pub engine_version: String,
    /// The campaign hash: SHA-256 of the canonical JSON form of the campaign document.
    pub scenario_hash: String,
    /// The campaign seed from the document (dimensionless); echoed for reproducibility.
    pub seed: u64,
    /// Always `"campaign"`.
    pub kind: String,
    /// Display title: the document's `title`, or `"campaign"` when it has none.
    pub title: String,
    /// The honesty label ([`LABEL`]): what is modelled and what is read from real runs.
    pub label: String,
    /// Reproducibility stamp over every member run.
    pub reproducibility: Reproducibility,
    /// The chained mission timeline; present when the campaign has `[[phases]]`.
    #[serde(skip_serializing_if = "Option::is_none")]
    pub timeline: Option<TimelineOut>,
    /// The parameter-grid results; present when the campaign has `[sweep]`.
    #[serde(skip_serializing_if = "Option::is_none")]
    pub sweep: Option<SweepOut>,
    /// The seeded-ensemble results; present when the campaign has `[monte_carlo]`.
    #[serde(skip_serializing_if = "Option::is_none")]
    pub monte_carlo: Option<MonteCarloOut>,
    /// The shared-conditions results; present when the campaign has `[compose]`.
    #[serde(skip_serializing_if = "Option::is_none")]
    pub compose: Option<ComposeOut>,
}

/// The reproducibility stamp.
#[derive(Clone, Debug, Serialize)]
pub struct Reproducibility {
    /// Same value as `scenario_hash`.
    pub campaign_hash: String,
    /// Number of member scenario runs the campaign dispatched.
    pub runs_total: usize,
    /// SHA-256 over the member result digests in dispatch order: two campaigns with
    /// the same digest produced byte-identical member results.
    pub run_digest: String,
}

/// The aligned mission timeline.
#[derive(Clone, Debug, Serialize)]
pub struct TimelineOut {
    /// Grid spacing of the aligned series (s), from `[timeline] step_s`.
    pub step_s: f64,
    /// Mission length (s): the sum of the phase lengths as run.
    pub duration_s: f64,
    /// Mission time of each grid sample (s from mission start, the start of the first phase).
    pub t_s: Vec<f64>,
    /// Every phase as it ran, in order.
    pub phases: Vec<PhaseOut>,
    /// Every event raised on the timeline, sorted by mission time.
    pub events: Vec<EventOut>,
    /// Every value handed from one phase into the next phase's scenario, in order.
    pub handoffs: Vec<HandoffOut>,
    /// Each aligned channel by name, sampled on the `t_s` grid by zero-order hold.
    pub channels: BTreeMap<String, ChannelOut>,
}

/// One phase as it ran.
#[derive(Clone, Debug, Serialize)]
pub struct PhaseOut {
    /// Phase name from the document.
    pub name: String,
    /// Mission time at which the phase starts (s): the previous phase's end.
    pub t0_s: f64,
    /// Mission time at which the phase ends (s): `t0_s` plus `duration_s`, or earlier
    /// when `end_at` fired.
    pub t1_s: f64,
    /// Why the phase ended where it did: `duration_s`, or the `end_at` path and the time it read.
    pub ended_by: String,
    /// Each carried channel and the value (in that channel's unit) added from the end of
    /// the previous phase.
    pub carried: BTreeMap<String, f64>,
    /// The member runs of the phase, in document order.
    pub runs: Vec<RunOut>,
}

/// One member run of a phase.
#[derive(Clone, Debug, Serialize)]
pub struct RunOut {
    /// The scenario kind that ran (`clock` when the table named none).
    pub kind: String,
    /// The member result's own `scenario_hash`, when its kind reports one.
    #[serde(skip_serializing_if = "Option::is_none")]
    pub scenario_hash: Option<String>,
    /// Lowercase hex SHA-256 of the member's result JSON.
    pub result_sha256: String,
    /// Seconds of the run's own timeline dropped before phase time zero (s).
    pub skip_s: f64,
    /// Names of the channels this run provided, in series order.
    pub channels: Vec<String>,
}

/// An event on the mission timeline.
#[derive(Clone, Debug, Serialize)]
pub struct EventOut {
    /// Mission time of the event (s from mission start).
    pub t_s: f64,
    /// Name of the phase whose run raised the event.
    pub phase: String,
    /// What happened, from the event specification.
    pub label: String,
    /// Whether the event raises the alarm channel from its time until the phase ends.
    pub alarm: bool,
}

/// A handed-on value.
#[derive(Clone, Debug, Serialize)]
pub struct HandoffOut {
    /// Name of the phase the value was written into.
    pub phase: String,
    /// The source: `channel:<name>` or a result path of a previous-phase run.
    pub from: String,
    /// The dotted scenario key written.
    pub to: String,
    /// Index of the receiving run within the phase (zero-based).
    pub run: usize,
    /// The number written, after scale and offset, in `unit`.
    pub value: f64,
    /// Unit of `value`: the handoff's declared unit, or the source's unit.
    pub unit: String,
}

/// One aligned channel.
#[derive(Clone, Debug, Serialize)]
pub struct ChannelOut {
    /// Unit of the channel's values (for example ns, dB-Hz, m, or `1` for a flag).
    pub unit: String,
    /// Human-readable description of the channel.
    pub label: String,
    /// Value at each timeline grid time, in `unit`; null where no run of the owning phase
    /// provides it.
    pub values: Vec<Option<f64>>,
}

/// A sweep axis as run.
#[derive(Clone, Debug, Serialize)]
pub struct AxisOut {
    /// Dotted scenario key the axis varies.
    pub key: String,
    /// Unit of the key, as declared on the axis.
    pub unit: String,
    /// Spacing of the values: `lin` or `log`.
    pub scale: String,
    /// The key's values along the axis, endpoints included, in `unit`.
    pub values: Vec<f64>,
}

/// A metric's definition as run.
#[derive(Clone, Debug, Serialize)]
pub struct MetricInfo {
    /// Result path the metric is read from.
    pub path: String,
    /// Unit of the metric: declared, or looked up in the result's units block.
    pub unit: String,
}

/// A node metric: a value, or ensemble statistics.
#[derive(Clone, Debug, Serialize)]
#[serde(untagged)]
pub enum NodeMetric {
    /// The metric of a single run; `None` when the result value is null.
    Value(Option<f64>),
    /// Ensemble statistics of the metric when the node runs several realisations.
    Stat(crate::inertial::MetricStat),
}

/// One sweep node.
#[derive(Clone, Debug, Serialize)]
pub struct NodeOut {
    /// The node's value on each axis, by axis name, in that axis's unit.
    pub coords: BTreeMap<String, f64>,
    /// Each recorded metric at this node, by metric name, in the metric's unit.
    pub metrics: BTreeMap<String, NodeMetric>,
}

/// The sweep section.
#[derive(Clone, Debug, Serialize)]
pub struct SweepOut {
    /// Kind of the swept base scenario (`clock` when it names none).
    pub scenario_kind: String,
    /// Realisations per node (count); above one each node is an ensemble.
    pub runs: usize,
    /// Axis names in document order; the node order runs over them.
    pub axis_order: Vec<String>,
    /// Each axis as run, by axis name.
    pub axes: BTreeMap<String, AxisOut>,
    /// Each recorded metric's definition, by metric name.
    pub metrics: BTreeMap<String, MetricInfo>,
    /// Number of values along each axis, in `axis_order` (count).
    pub shape: Vec<usize>,
    /// Every grid node in flattened `axis_order` order.
    pub nodes: Vec<NodeOut>,
}

/// One Monte Carlo metric.
#[derive(Clone, Debug, Serialize)]
pub struct McMetric {
    /// Result path the metric is read from.
    pub path: String,
    /// Unit of the metric: declared, or looked up in the result's units block.
    pub unit: String,
    /// Number of realisations aggregated (count).
    pub n: usize,
    /// Mean, spread, percentiles and bootstrap 95% confidence interval, in `unit`.
    #[serde(flatten)]
    pub stat: crate::inertial::MetricStat,
    /// The metric from each realisation in seed order, in `unit`; present when
    /// `keep_samples` is set.
    #[serde(skip_serializing_if = "Option::is_none")]
    pub samples: Option<Vec<f64>>,
}

/// The Monte Carlo section.
#[derive(Clone, Debug, Serialize)]
pub struct MonteCarloOut {
    /// Kind of the ensemble scenario (`clock` when it names none).
    pub scenario_kind: String,
    /// Number of realisations (count).
    pub runs: usize,
    /// Integer scenario key the seed is written to.
    pub seed_key: String,
    /// Seed of realisation zero; realisation `k` runs at `base_seed + k`.
    pub base_seed: u64,
    /// Each recorded metric's statistics, by metric name.
    pub metrics: BTreeMap<String, McMetric>,
}

/// A shared value as applied.
#[derive(Clone, Debug, Serialize)]
pub struct SharedOut {
    /// Unit of the shared value.
    pub unit: String,
    /// The shared value as written into members: a number or an array of numbers, in `unit`.
    pub value: Value,
}

/// One composed member as run.
#[derive(Clone, Debug, Serialize)]
pub struct MemberOut {
    /// The scenario kind that ran (`clock` when the table named none).
    pub kind: String,
    /// The member result's own `scenario_hash`, when its kind reports one.
    #[serde(skip_serializing_if = "Option::is_none")]
    pub scenario_hash: Option<String>,
    /// Lowercase hex SHA-256 of the member's result JSON.
    pub result_sha256: String,
    /// Shared value name to the dotted scenario key of this member it was written to.
    pub bound: BTreeMap<String, String>,
    /// Each recorded metric by name, in the unit listed in `metric_units`; `None` when null.
    pub metrics: BTreeMap<String, Option<f64>>,
}

/// A metric across the composed members.
#[derive(Clone, Debug, Serialize)]
pub struct CombinedOut {
    /// Unit of the metric.
    pub unit: String,
    /// Number of members reporting a finite value (count).
    pub members: usize,
    /// Smallest value across the members, in `unit`.
    pub min: f64,
    /// Label of the member with the smallest value.
    pub min_member: String,
    /// Largest value across the members, in `unit`.
    pub max: f64,
    /// Label of the member with the largest value.
    pub max_member: String,
    /// Arithmetic mean across the members reporting a finite value, in `unit`.
    pub mean: f64,
}

/// The compose section.
#[derive(Clone, Debug, Serialize)]
pub struct ComposeOut {
    /// Each shared value as applied, by name.
    pub shared: BTreeMap<String, SharedOut>,
    /// Each member as run, by label.
    pub members: BTreeMap<String, MemberOut>,
    /// Unit of each metric name, the same for every member reporting it.
    pub metric_units: BTreeMap<String, String>,
    /// Each metric across the members: extremes, their members, and the mean.
    pub combined: BTreeMap<String, CombinedOut>,
}

/// A campaign run: the result, and every member result document in dispatch order
/// (so a caller can check a member against its stand-alone run).
#[derive(Clone, Debug)]
pub struct CampaignRun {
    /// The campaign result document.
    pub result: CampaignResult,
    /// `(member label, result JSON)` for every dispatched run, in order.
    pub member_results: Vec<(String, String)>,
}

// ---------------------------------------------------------------------------
// Result paths
// ---------------------------------------------------------------------------

#[derive(Clone, Debug, PartialEq)]
enum Seg {
    Key(String),
    Each(String),
    Index(String, i64),
}

fn parse_path(path: &str) -> Result<Vec<Seg>, String> {
    if path.is_empty() {
        return Err("empty result path".into());
    }
    path.split('.')
        .map(|part| {
            if part.is_empty() {
                return Err(format!("result path `{path}` has an empty segment"));
            }
            if let Some(name) = part.strip_suffix("[]") {
                return Ok(Seg::Each(name.to_string()));
            }
            if let (Some(open), true) = (part.find('['), part.ends_with(']')) {
                let name = &part[..open];
                let idx: i64 = part[open + 1..part.len() - 1]
                    .parse()
                    .map_err(|_| format!("result path `{path}`: bad index in `{part}`"))?;
                return Ok(Seg::Index(name.to_string(), idx));
            }
            Ok(Seg::Key(part.to_string()))
        })
        .collect()
}

fn child<'a>(v: &'a Value, name: &str, path: &str) -> Result<&'a Value, String> {
    if name.is_empty() {
        return Ok(v);
    }
    v.get(name)
        .ok_or_else(|| format!("result path `{path}`: no field `{name}`"))
}

fn index<'a>(v: &'a Value, i: i64, path: &str) -> Result<&'a Value, String> {
    let a = v
        .as_array()
        .ok_or_else(|| format!("result path `{path}`: indexed value is not an array"))?;
    let n = a.len() as i64;
    let j = if i < 0 { n + i } else { i };
    if j < 0 || j >= n {
        return Err(format!(
            "result path `{path}`: index {i} out of range ({n})"
        ));
    }
    Ok(&a[j as usize])
}

fn leaf(v: &Value, path: &str) -> Result<f64, String> {
    match v {
        Value::Number(n) => Ok(n.as_f64().unwrap_or(f64::NAN)),
        Value::Bool(b) => Ok(if *b { 1.0 } else { 0.0 }),
        Value::Null => Ok(f64::NAN),
        _ => Err(format!(
            "result path `{path}`: value is not a number or a flag"
        )),
    }
}

/// Every leaf under `v` along `segs`, flattening any `[]`.
fn collect(v: &Value, segs: &[Seg], path: &str, out: &mut Vec<f64>) -> Result<(), String> {
    let Some((first, rest)) = segs.split_first() else {
        out.push(leaf(v, path)?);
        return Ok(());
    };
    match first {
        Seg::Key(k) => collect(child(v, k, path)?, rest, path, out),
        Seg::Index(k, i) => collect(index(child(v, k, path)?, *i, path)?, rest, path, out),
        Seg::Each(k) => {
            let a = child(v, k, path)?
                .as_array()
                .ok_or_else(|| format!("result path `{path}`: `{k}` is not an array"))?;
            for e in a {
                collect(e, rest, path, out)?;
            }
            Ok(())
        }
    }
}

/// A scalar at `path` (no `[]`); `None` for a null.
fn eval_scalar(root: &Value, path: &str) -> Result<Option<f64>, String> {
    let segs = parse_path(path)?;
    if segs.iter().any(|s| matches!(s, Seg::Each(_))) {
        return Err(format!(
            "result path `{path}` must name one value, not rows"
        ));
    }
    let mut out = Vec::new();
    collect(root, &segs, path, &mut out)?;
    Ok(out.first().copied().filter(|x| !x.is_nan()))
}

/// Values of a path either as one scalar or as rows (split at the first `[]`).
enum Rows {
    Scalar(f64),
    Rows(Vec<Vec<f64>>),
}

fn eval_rows(root: &Value, path: &str) -> Result<Rows, String> {
    let segs = parse_path(path)?;
    let Some(pos) = segs.iter().position(|s| matches!(s, Seg::Each(_))) else {
        let mut out = Vec::new();
        collect(root, &segs, path, &mut out)?;
        return Ok(Rows::Scalar(out.first().copied().unwrap_or(f64::NAN)));
    };
    let mut cur = root;
    for s in &segs[..pos] {
        cur = match s {
            Seg::Key(k) => child(cur, k, path)?,
            Seg::Index(k, i) => index(child(cur, k, path)?, *i, path)?,
            Seg::Each(_) => unreachable!("the first `[]` is at `pos`"),
        };
    }
    let Seg::Each(name) = &segs[pos] else {
        unreachable!("`pos` is the position of a `[]` segment")
    };
    let arr = child(cur, name, path)?
        .as_array()
        .ok_or_else(|| format!("result path `{path}`: `{name}` is not an array"))?;
    let mut rows = Vec::with_capacity(arr.len());
    for e in arr {
        let mut out = Vec::new();
        collect(e, &segs[pos + 1..], path, &mut out)?;
        rows.push(out);
    }
    Ok(Rows::Rows(rows))
}

/// The units-block path of a result path: indices become `[]`.
fn canonical_path(path: &str) -> String {
    path.split('.')
        .map(|p| match (p.find('['), p.ends_with(']')) {
            (Some(open), true) => format!("{}[]", &p[..open]),
            _ => p.to_string(),
        })
        .collect::<Vec<_>>()
        .join(".")
}

/// The unit a result document's own units block gives `path`.
fn unit_in_doc(doc: &Value, path: &str) -> Option<String> {
    let units = doc.get("units")?.as_object()?;
    let (_, entry) = lookup(units, &canonical_path(path))?;
    entry.get("unit")?.as_str().map(str::to_string)
}

fn resolve_unit(declared: &Option<String>, doc: &Value, path: &str) -> Result<String, String> {
    if let Some(u) = declared {
        return Ok(u.clone());
    }
    unit_in_doc(doc, path).ok_or_else(|| {
        format!(
            "metric path `{path}` has no entry in that kind's units block; declare its \
             `unit` in the campaign"
        )
    })
}

fn check_name(what: &str, name: &str) -> Result<(), String> {
    if name.is_empty()
        || !name
            .chars()
            .all(|c| c.is_ascii_alphanumeric() || c == '_' || c == '-')
    {
        return Err(format!(
            "{what} `{name}` must be non-empty letters, digits, `_` or `-`"
        ));
    }
    Ok(())
}

// ---------------------------------------------------------------------------
// Member runs
// ---------------------------------------------------------------------------

fn sha256_hex(s: &str) -> String {
    let mut h = Sha256::new();
    h.update(s.as_bytes());
    hex::encode(h.finalize())
}

fn kind_of(scn: &toml::Value) -> String {
    scn.get("kind")
        .and_then(|k| k.as_str())
        .unwrap_or("clock")
        .to_string()
}

/// One dispatched member run.
struct Member {
    kind: String,
    doc: Value,
    json: String,
    input: Value,
}

impl Member {
    fn scenario_hash(&self) -> Option<String> {
        self.doc
            .get("scenario_hash")
            .and_then(|h| h.as_str())
            .map(str::to_string)
    }
}

/// Collects every dispatched run, in order, for the reproducibility stamp.
struct Ledger {
    runs: Vec<(String, String)>,
}

impl Ledger {
    fn run(&mut self, label: String, scn: &toml::Value) -> Result<Member, String> {
        let kind = kind_of(scn);
        if kind == "campaign" {
            return Err(format!("{label}: a campaign cannot contain a campaign"));
        }
        let src = toml::to_string(scn).map_err(|e| format!("{label}: serialise: {e}"))?;
        let out = crate::api::run_toml(&src).map_err(|e| format!("{label}: {e}"))?;
        let doc: Value = serde_json::from_str(&out.json)
            .map_err(|e| format!("{label}: result did not parse: {e}"))?;
        let input = serde_json::to_value(scn).map_err(|e| format!("{label}: {e}"))?;
        self.runs.push((label, out.json.clone()));
        Ok(Member {
            kind,
            doc,
            json: out.json,
            input,
        })
    }
}

fn seed_of(scn: &toml::Value, key: &str) -> Result<u64, String> {
    let mut cur = scn;
    for part in key.split('.') {
        cur = cur
            .get(part)
            .ok_or_else(|| format!("seed key `{key}`: no field `{part}` in the scenario"))?;
    }
    cur.as_integer()
        .and_then(|i| u64::try_from(i).ok())
        .ok_or_else(|| format!("seed key `{key}` is not a non-negative integer"))
}

fn with_seed(scn: &toml::Value, key: &str, seed: u64) -> Result<toml::Value, String> {
    let s = i64::try_from(seed).map_err(|_| format!("seed {seed} does not fit a TOML integer"))?;
    let mut out = scn.clone();
    crate::sweep::set_dotted_value(&mut out, key, toml::Value::Integer(s))?;
    Ok(out)
}

// ---------------------------------------------------------------------------
// Channels and presets
// ---------------------------------------------------------------------------

/// Unit and description of the channels the campaign knows by name.
pub fn channel_meta(name: &str) -> Option<(&'static str, &'static str)> {
    Some(match name {
        "time_error_ns" => ("ns", "clock time error"),
        "guard_ns" => ("ns", "time-error guard (the run's own threshold)"),
        "cn0_dbhz" => (
            "dB-Hz",
            "mean effective carrier-to-noise density ratio over the visible satellites",
        ),
        "cn0_floor_dbhz" => ("dB-Hz", "tracking-loss floor of the receiver"),
        "tracking" => ("count", "satellites still tracking"),
        "protection_level_m" => ("m", "vertical protection level"),
        "alert_limit_m" => ("m", "vertical alert limit"),
        "position_error_m" => ("m", "position error"),
        "position_threshold_m" => ("m", "position-error threshold (the run's own)"),
        "alarm" => ("1", "alarm flag: 1 while any monitor of the phase alarms"),
        _ => return None,
    })
}

fn spec(channel: &str, t: &str, y: &str) -> SeriesSpec {
    SeriesSpec {
        channel: channel.into(),
        unit: None,
        t: t.into(),
        y: y.into(),
        reduce: None,
        scale: 1.0,
        compare: None,
        threshold: None,
        optional: false,
    }
}

fn alarm_spec(t: &str, y: &str, compare: &str, thr: Threshold) -> SeriesSpec {
    SeriesSpec {
        compare: Some(compare.into()),
        threshold: Some(thr),
        ..spec("alarm", t, y)
    }
}

fn rule(channel: &str, compare: &str, against: &str) -> AlarmRule {
    AlarmRule {
        channel: channel.into(),
        compare: compare.into(),
        threshold: Threshold::Path(format!("channel:{against}")),
    }
}

/// The preset alarm rules of a kind: the ones compared on a channel after `carry`.
fn preset_rules(kind: &str) -> Vec<AlarmRule> {
    match kind {
        "clock" => vec![rule("time_error_ns", "abs_above", "guard_ns")],
        "gnss-ins" => vec![rule(
            "position_error_m",
            "abs_above",
            "position_threshold_m",
        )],
        _ => vec![],
    }
}

/// The preset series and events of a kind, reading clock or sensor `side`.
fn presets(kind: &str, side: &str) -> (Vec<SeriesSpec>, Vec<EventSpec>) {
    let st = format!("{side}.series[].t");
    match kind {
        "clock" => (
            vec![
                spec("time_error_ns", &st, &format!("{side}.series[].error_ns")),
                spec("guard_ns", &st, "threshold_ns"),
            ],
            vec![],
        ),
        "spoof" => (
            vec![
                spec("time_error_ns", &st, &format!("{side}.series[].offset_ns")),
                spec("guard_ns", &st, "threshold_ns"),
            ],
            vec![EventSpec {
                label: "clock-aided spoofing monitor alarms".into(),
                at: Some(format!("{side}.detect_time_s")),
                when: None,
                alarm: true,
            }],
        ),
        "gnss-ins" => (
            vec![
                spec("position_error_m", &st, &format!("{side}.series[].error_m")),
                spec("position_threshold_m", &st, "threshold_m"),
            ],
            vec![],
        ),
        "jamming" => (
            vec![
                SeriesSpec {
                    reduce: Some("mean".into()),
                    ..spec(
                        "cn0_dbhz",
                        "epochs[].t",
                        "epochs[].sats[].cn0_effective_dbhz",
                    )
                },
                SeriesSpec {
                    optional: true,
                    ..spec(
                        "cn0_floor_dbhz",
                        "epochs[].t",
                        "input:tracking_threshold_dbhz",
                    )
                },
                spec("tracking", "epochs[].t", "epochs[].tracking"),
                alarm_spec(
                    "epochs[].t",
                    "epochs[].tracking",
                    "below",
                    Threshold::Value(4.0),
                ),
            ],
            vec![],
        ),
        "integrity" => (
            vec![
                spec("protection_level_m", "epochs[].t_s", "epochs[].vpl_m"),
                spec("alert_limit_m", "epochs[].t_s", "al_v_m"),
                alarm_spec(
                    "epochs[].t_s",
                    "epochs[].available",
                    "below",
                    Threshold::Value(0.5),
                ),
            ],
            vec![],
        ),
        "spoof-detect" => (
            vec![],
            vec![EventSpec {
                label: "RF spoofing detector alarms (fused consistency, power and \
                        signal-quality monitors)"
                    .into(),
                at: None,
                when: Some("decision.fused.alert".into()),
                alarm: true,
            }],
        ),
        _ => (vec![], vec![]),
    }
}

/// Resolve a path against the result, or, with `input:`, against the scenario.
fn target<'a>(m: &'a Member, path: &'a str) -> (&'a Value, &'a str) {
    match path.strip_prefix("input:") {
        Some(p) => (&m.input, p),
        None => (&m.doc, path),
    }
}

/// Read one series out of a member: `(run-local time, value)` pairs. `Ok(None)` when an
/// optional series' path is absent.
fn extract(m: &Member, s: &SeriesSpec) -> Result<Option<Vec<(f64, f64)>>, String> {
    let ctx = |e: String| format!("channel `{}`: {e}", s.channel);
    let t_rows = match eval_rows(&m.doc, &s.t) {
        Ok(Rows::Rows(r)) => r,
        Ok(Rows::Scalar(_)) => {
            return Err(ctx(format!("time path `{}` must name rows with `[]`", s.t)))
        }
        Err(e) if s.optional => {
            let _ = e;
            return Ok(None);
        }
        Err(e) => return Err(ctx(e)),
    };
    let (root, ypath) = target(m, &s.y);
    let y = match eval_rows(root, ypath) {
        Ok(y) => y,
        Err(_) if s.optional => return Ok(None),
        Err(e) => return Err(ctx(e)),
    };
    let thr = match (&s.compare, &s.threshold) {
        (None, _) => None,
        (Some(c), Some(t)) => {
            if !matches!(c.as_str(), "below" | "above" | "abs_above") {
                return Err(ctx(format!(
                    "compare `{c}` is not below, above or abs_above"
                )));
            }
            Some(match t {
                Threshold::Value(v) => *v,
                Threshold::Path(p) => {
                    let (r, pp) = target(m, p);
                    eval_scalar(r, pp)
                        .map_err(ctx)?
                        .ok_or_else(|| ctx(format!("threshold `{p}` is null")))?
                }
            })
        }
        (Some(_), None) => return Err(ctx("compare needs a threshold".into())),
    };
    let reduce = |vals: &[f64]| -> Result<f64, String> {
        if vals.len() == 1 && s.reduce.as_deref() != Some("count") {
            return Ok(vals[0]);
        }
        let finite: Vec<f64> = vals.iter().copied().filter(|v| v.is_finite()).collect();
        match s.reduce.as_deref() {
            Some("count") => Ok(finite.len() as f64),
            _ if finite.is_empty() => Ok(f64::NAN),
            Some("mean") | None => Ok(finite.iter().sum::<f64>() / finite.len() as f64),
            Some("min") => Ok(finite.iter().copied().fold(f64::INFINITY, f64::min)),
            Some("max") => Ok(finite.iter().copied().fold(f64::NEG_INFINITY, f64::max)),
            Some(r) => Err(ctx(format!("reduce `{r}` is not mean, min, max or count"))),
        }
    };
    let mut out = Vec::with_capacity(t_rows.len());
    for (i, tr) in t_rows.iter().enumerate() {
        let t = match tr.as_slice() {
            [t] => *t,
            _ => {
                return Err(ctx(format!(
                    "time path `{}` gives several values per row",
                    s.t
                )))
            }
        };
        let raw = match &y {
            Rows::Scalar(v) => *v,
            Rows::Rows(r) => {
                let row = r.get(i).ok_or_else(|| {
                    ctx(format!(
                        "value path `{}` has fewer rows than `{}`",
                        s.y, s.t
                    ))
                })?;
                reduce(row)?
            }
        };
        let v = raw * s.scale;
        let v = match (s.compare.as_deref(), thr) {
            (_, None) => v,
            (_, Some(_)) if v.is_nan() => f64::NAN,
            (Some("below"), Some(th)) => f64::from(u8::from(v < th)),
            (Some("above"), Some(th)) => f64::from(u8::from(v > th)),
            (_, Some(th)) => f64::from(u8::from(v.abs() > th)),
        };
        out.push((t, v));
    }
    if let Rows::Rows(r) = &y {
        if r.len() != t_rows.len() {
            return Err(ctx(format!(
                "value path `{}` has {} rows, time path `{}` has {}",
                s.y,
                r.len(),
                s.t,
                t_rows.len()
            )));
        }
    }
    Ok(Some(out))
}

// ---------------------------------------------------------------------------
// The chain
// ---------------------------------------------------------------------------

/// The threshold of an alarm rule, resolved.
enum RuleThreshold {
    Value(f64),
    Channel(String),
}

/// One channel's samples within one phase, on mission time.
#[derive(Clone, Debug)]
struct ChanSamples {
    unit: String,
    label: String,
    samples: Vec<(f64, f64)>,
}

struct PhaseState {
    t0: f64,
    t1: f64,
    channels: BTreeMap<String, ChanSamples>,
    /// Alarm-flag series from every run of the phase.
    alarm_series: Vec<Vec<(f64, f64)>>,
    /// Mission times at which an alarming event fired.
    alarm_events: Vec<f64>,
}

impl PhaseState {
    fn has_alarm_source(&self) -> bool {
        !self.alarm_series.is_empty() || !self.alarm_events.is_empty()
    }
}

fn close(a: f64, b: f64) -> bool {
    (a - b).abs() <= T_EPS * a.abs().max(b.abs()).max(1.0)
}

/// The latest sample at or before `t`.
fn hold(samples: &[(f64, f64)], t: f64) -> Option<f64> {
    samples
        .iter()
        .rev()
        .find(|(ts, _)| *ts <= t || close(*ts, t))
        .map(|(_, v)| *v)
}

fn run_chain(
    cfg: &CampaignScenario,
    ledger: &mut Ledger,
) -> Result<(TimelineOut, Vec<PhaseState>), String> {
    let step = cfg
        .timeline
        .as_ref()
        .ok_or("a campaign with phases needs a [timeline] with step_s")?
        .step_s;
    if !(step.is_finite() && step > 0.0) {
        return Err(format!("timeline.step_s must be positive, got {step}"));
    }
    let mut states: Vec<PhaseState> = Vec::with_capacity(cfg.phases.len());
    let mut phases_out = Vec::with_capacity(cfg.phases.len());
    let mut events = Vec::new();
    let mut handoffs = Vec::new();
    let mut prev_members: Vec<Member> = Vec::new();
    let mut prev_end: BTreeMap<String, (f64, String)> = BTreeMap::new();
    let mut names: Vec<&str> = Vec::new();
    let mut t0 = 0.0_f64;
    let n_phases = cfg.phases.len();
    for (pi, ph) in cfg.phases.iter().enumerate() {
        check_name("phase name", &ph.name)?;
        if names.contains(&ph.name.as_str()) {
            return Err(format!("phase `{}` is named twice", ph.name));
        }
        names.push(&ph.name);
        if !(ph.duration_s.is_finite() && ph.duration_s >= 0.0) {
            return Err(format!(
                "phase `{}`: duration_s must be non-negative",
                ph.name
            ));
        }
        if ph.runs.is_empty() {
            return Err(format!("phase `{}` has no runs", ph.name));
        }
        // Handoffs write into this phase's scenarios before they run.
        let mut scenarios: Vec<toml::Value> = ph.runs.iter().map(|r| r.scenario.clone()).collect();
        for h in &ph.handoff {
            if pi == 0 {
                return Err(format!(
                    "phase `{}`: the first phase has nothing to hand on from",
                    ph.name
                ));
            }
            let (value, unit) = if let Some(ch) = h.from.strip_prefix("channel:") {
                let (v, u) = prev_end.get(ch).ok_or_else(|| {
                    format!(
                        "phase `{}`: handoff from channel `{ch}`, which the previous phase \
                         did not end with",
                        ph.name
                    )
                })?;
                (*v, h.unit.clone().unwrap_or_else(|| u.clone()))
            } else {
                let m = prev_members.get(h.from_run).ok_or_else(|| {
                    format!(
                        "phase `{}`: handoff from_run {} does not exist",
                        ph.name, h.from_run
                    )
                })?;
                let v = eval_scalar(&m.doc, &h.from)?
                    .ok_or_else(|| format!("phase `{}`: handoff `{}` is null", ph.name, h.from))?;
                (v, resolve_unit(&h.unit, &m.doc, &h.from)?)
            };
            let v = value * h.scale + h.offset;
            let scn = scenarios.get_mut(h.run).ok_or_else(|| {
                format!("phase `{}`: handoff run {} does not exist", ph.name, h.run)
            })?;
            crate::sweep::set_dotted(scn, &h.to, v)
                .map_err(|e| format!("phase `{}`: {e}", ph.name))?;
            handoffs.push(HandoffOut {
                phase: ph.name.clone(),
                from: h.from.clone(),
                to: h.to.clone(),
                run: h.run,
                value: v,
                unit,
            });
        }
        let mut members = Vec::with_capacity(scenarios.len());
        for (ri, scn) in scenarios.iter().enumerate() {
            members.push(ledger.run(format!("phase {}/run {ri}", ph.name), scn)?);
        }
        // The phase length: its duration, or earlier if a run says so.
        let mut dur = ph.duration_s;
        let mut ended_by = "duration_s".to_string();
        if let Some(p) = &ph.end_at {
            let m = members.get(ph.end_at_run).ok_or_else(|| {
                format!(
                    "phase `{}`: end_at_run {} does not exist",
                    ph.name, ph.end_at_run
                )
            })?;
            match eval_scalar(&m.doc, p)? {
                Some(x) if x.is_finite() => {
                    let local = (x - ph.runs[ph.end_at_run].skip_s).max(0.0);
                    if local < dur {
                        dur = local;
                        ended_by = format!("end_at {p} = {x} s");
                    } else {
                        ended_by = format!("duration_s (end_at {p} = {x} s is later)");
                    }
                }
                _ => ended_by = format!("duration_s (end_at {p} is null)"),
            }
        }
        let t1 = t0 + dur;
        let mut state = PhaseState {
            t0,
            t1,
            channels: BTreeMap::new(),
            alarm_series: Vec::new(),
            alarm_events: Vec::new(),
        };
        let mut runs_out = Vec::with_capacity(members.len());
        let mut rules: Vec<(String, String, RuleThreshold)> = Vec::new();
        for (rc, m) in ph.runs.iter().zip(&members) {
            let side = rc.side.as_deref().unwrap_or("classical");
            if !matches!(side, "classical" | "quantum") {
                return Err(format!(
                    "phase `{}`: side `{side}` is not classical or quantum",
                    ph.name
                ));
            }
            if !(rc.skip_s.is_finite() && rc.skip_s >= 0.0) {
                return Err(format!("phase `{}`: skip_s must be non-negative", ph.name));
            }
            let (pre_s, pre_e) = presets(&m.kind, side);
            let specs = rc.series.clone().unwrap_or(pre_s);
            let evs = rc.events.clone().unwrap_or(pre_e);
            for r in rc.alarms.clone().unwrap_or_else(|| preset_rules(&m.kind)) {
                if !matches!(r.compare.as_str(), "below" | "above" | "abs_above") {
                    return Err(format!(
                        "phase `{}`: alarm compare `{}` is not below, above or abs_above",
                        ph.name, r.compare
                    ));
                }
                let thr = match &r.threshold {
                    Threshold::Value(v) => RuleThreshold::Value(*v),
                    Threshold::Path(p) => match p.strip_prefix("channel:") {
                        Some(c) => RuleThreshold::Channel(c.to_string()),
                        None => RuleThreshold::Value(eval_scalar(&m.doc, p)?.ok_or_else(|| {
                            format!("phase `{}`: alarm threshold `{p}` is null", ph.name)
                        })?),
                    },
                };
                rules.push((r.channel.clone(), r.compare.clone(), thr));
            }
            let in_phase = |tl: f64| tl >= -T_EPS && (tl <= dur || close(tl, dur));
            let mut chans = Vec::new();
            for s in &specs {
                let (unit, label) = match (channel_meta(&s.channel), &s.unit) {
                    (Some((u, _)), Some(du)) if du != u => {
                        return Err(format!(
                            "phase `{}`: channel `{}` is in {u}, not {du}",
                            ph.name, s.channel
                        ))
                    }
                    (Some((u, l)), _) => (u.to_string(), l.to_string()),
                    (None, Some(du)) => (du.clone(), s.channel.clone()),
                    (None, None) => {
                        return Err(format!(
                            "phase `{}`: channel `{}` needs a unit",
                            ph.name, s.channel
                        ))
                    }
                };
                check_name("channel", &s.channel)?;
                let Some(raw) = extract(m, s).map_err(|e| format!("phase `{}`: {e}", ph.name))?
                else {
                    continue;
                };
                let samples: Vec<(f64, f64)> = raw
                    .into_iter()
                    .map(|(t, v)| (t - rc.skip_s, v))
                    .filter(|(tl, _)| in_phase(*tl))
                    .map(|(tl, v)| (t0 + tl, v))
                    .collect();
                chans.push(s.channel.clone());
                if s.channel == "alarm" {
                    state.alarm_series.push(samples);
                    continue;
                }
                if state.channels.contains_key(&s.channel) {
                    return Err(format!(
                        "phase `{}`: two runs both provide channel `{}`",
                        ph.name, s.channel
                    ));
                }
                state.channels.insert(
                    s.channel.clone(),
                    ChanSamples {
                        unit,
                        label,
                        samples,
                    },
                );
            }
            for e in &evs {
                let tl = if let Some(p) = &e.at {
                    match eval_scalar(&m.doc, p)? {
                        Some(x) => x - rc.skip_s,
                        None => continue,
                    }
                } else if let Some(p) = &e.when {
                    match eval_scalar(&m.doc, p)? {
                        Some(x) if x > 0.5 => 0.0,
                        _ => continue,
                    }
                } else {
                    0.0
                };
                if !in_phase(tl) {
                    continue;
                }
                events.push(EventOut {
                    t_s: t0 + tl,
                    phase: ph.name.clone(),
                    label: e.label.clone(),
                    alarm: e.alarm,
                });
                if e.alarm {
                    state.alarm_events.push(t0 + tl);
                }
            }
            runs_out.push(RunOut {
                kind: m.kind.clone(),
                scenario_hash: m.scenario_hash(),
                result_sha256: sha256_hex(&m.json),
                skip_s: rc.skip_s,
                channels: chans,
            });
        }
        // Carry: continue a channel from where the previous phase left it.
        let mut carried = BTreeMap::new();
        for ch in &ph.carry {
            let (offset, _) = prev_end.get(ch).ok_or_else(|| {
                format!(
                    "phase `{}` carries `{ch}`, which the previous phase did not end with",
                    ph.name
                )
            })?;
            let c = state.channels.get_mut(ch).ok_or_else(|| {
                format!(
                    "phase `{}` carries `{ch}` but no run of it provides `{ch}`",
                    ph.name
                )
            })?;
            for s in &mut c.samples {
                s.1 += offset;
            }
            carried.insert(ch.clone(), *offset);
        }
        // Alarm rules compare channels as the mission sees them, after the carry.
        for (ch, compare, thr) in &rules {
            let Some(c) = state.channels.get(ch) else {
                continue;
            };
            let mut flags = Vec::with_capacity(c.samples.len());
            for &(t, v) in &c.samples {
                let th = match thr {
                    RuleThreshold::Value(x) => Some(*x),
                    RuleThreshold::Channel(o) => {
                        state.channels.get(o).and_then(|oc| hold(&oc.samples, t))
                    }
                };
                let f = match th {
                    Some(th) if v.is_finite() && th.is_finite() => {
                        let up = match compare.as_str() {
                            "below" => v < th,
                            "above" => v > th,
                            _ => v.abs() > th,
                        };
                        f64::from(u8::from(up))
                    }
                    _ => f64::NAN,
                };
                flags.push((t, f));
            }
            state.alarm_series.push(flags);
        }
        prev_end = state
            .channels
            .iter()
            .filter_map(|(k, c)| {
                c.samples
                    .last()
                    .filter(|(_, v)| v.is_finite())
                    .map(|(_, v)| (k.clone(), (*v, c.unit.clone())))
            })
            .collect();
        let _ = n_phases;
        phases_out.push(PhaseOut {
            name: ph.name.clone(),
            t0_s: t0,
            t1_s: t1,
            ended_by,
            carried,
            runs: runs_out,
        });
        states.push(state);
        prev_members = members;
        t0 = t1;
    }
    let total = t0;
    let n = ((total / step) + T_EPS).floor() as usize;
    let t_s: Vec<f64> = (0..=n).map(|k| k as f64 * step).collect();
    // Which phase owns each grid time: [t0, t1), the last phase also owning its end.
    let owner: Vec<Option<usize>> = t_s
        .iter()
        .map(|&t| {
            states.iter().enumerate().position(|(i, s)| {
                let last = i + 1 == states.len();
                (t >= s.t0 || close(t, s.t0))
                    && (t < s.t1 && !close(t, s.t1) || last && (t <= s.t1 || close(t, s.t1)))
            })
        })
        .collect();
    let mut channels: BTreeMap<String, ChannelOut> = BTreeMap::new();
    for st in &states {
        for (name, c) in &st.channels {
            match channels.get(name) {
                Some(prev) if prev.unit != c.unit => {
                    return Err(format!(
                        "channel `{name}` is in {} in one phase and {} in another",
                        prev.unit, c.unit
                    ))
                }
                Some(_) => {}
                None => {
                    channels.insert(
                        name.clone(),
                        ChannelOut {
                            unit: c.unit.clone(),
                            label: c.label.clone(),
                            values: vec![None; t_s.len()],
                        },
                    );
                }
            }
        }
    }
    for (name, out) in channels.iter_mut() {
        for (k, &t) in t_s.iter().enumerate() {
            let Some(p) = owner[k] else { continue };
            out.values[k] = states[p]
                .channels
                .get(name)
                .and_then(|c| hold(&c.samples, t))
                .filter(|v| v.is_finite());
        }
    }
    if states.iter().any(PhaseState::has_alarm_source) {
        let (u, l) = channel_meta("alarm").expect("alarm is a known channel");
        let mut values = vec![None; t_s.len()];
        for (k, &t) in t_s.iter().enumerate() {
            let Some(p) = owner[k] else { continue };
            let st = &states[p];
            if !st.has_alarm_source() {
                continue;
            }
            let from_series = st
                .alarm_series
                .iter()
                .filter_map(|s| hold(s, t))
                .any(|v| v > 0.5);
            let from_events = st.alarm_events.iter().any(|&te| te <= t || close(te, t));
            values[k] = Some(f64::from(u8::from(from_series || from_events)));
        }
        channels.insert(
            "alarm".into(),
            ChannelOut {
                unit: u.into(),
                label: l.into(),
                values,
            },
        );
    }
    events.sort_by(|a, b| a.t_s.total_cmp(&b.t_s));
    Ok((
        TimelineOut {
            step_s: step,
            duration_s: total,
            t_s,
            phases: phases_out,
            events,
            handoffs,
            channels,
        },
        states,
    ))
}

// ---------------------------------------------------------------------------
// Sweep, Monte Carlo, compose
// ---------------------------------------------------------------------------

fn metric_values(m: &Member, metrics: &[MetricCfg]) -> Result<Vec<Option<f64>>, String> {
    metrics
        .iter()
        .map(|mc| eval_scalar(&m.doc, &mc.path))
        .collect()
}

fn check_metrics(metrics: &[MetricCfg]) -> Result<(), String> {
    if metrics.is_empty() {
        return Err("at least one metric is needed".into());
    }
    let mut seen = Vec::new();
    for m in metrics {
        check_name("metric name", &m.name)?;
        if seen.contains(&m.name.as_str()) {
            return Err(format!("metric `{}` is named twice", m.name));
        }
        seen.push(&m.name);
    }
    Ok(())
}

fn ensemble(
    ledger: &mut Ledger,
    label: &str,
    scn: &toml::Value,
    seed_key: &str,
    base_seed: u64,
    runs: usize,
    metrics: &[MetricCfg],
) -> Result<(Vec<Vec<f64>>, Member), String> {
    let mut cols = vec![Vec::with_capacity(runs); metrics.len()];
    let mut first: Option<Member> = None;
    for k in 0..runs {
        let seed = base_seed
            .checked_add(k as u64)
            .ok_or("seed overflow in the ensemble")?;
        let sk = with_seed(scn, seed_key, seed)?;
        let m = ledger.run(format!("{label}/seed {seed}"), &sk)?;
        for (c, v) in cols.iter_mut().zip(metric_values(&m, metrics)?) {
            c.push(v.unwrap_or(f64::NAN));
        }
        if first.is_none() {
            first = Some(m);
        }
    }
    Ok((cols, first.ok_or("an ensemble needs at least one run")?))
}

fn run_sweep(cfg: &SweepCfg, seed: u64, ledger: &mut Ledger) -> Result<SweepOut, String> {
    if cfg.axes.is_empty() || cfg.axes.len() > 3 {
        return Err(format!(
            "a sweep takes one to three axes, got {}",
            cfg.axes.len()
        ));
    }
    check_metrics(&cfg.metrics)?;
    let mut seen = Vec::new();
    for a in &cfg.axes {
        check_name("axis name", &a.name)?;
        if seen.contains(&a.name.as_str()) {
            return Err(format!("axis `{}` is named twice", a.name));
        }
        seen.push(&a.name);
        if a.steps < 2 {
            return Err(format!("axis `{}` needs at least two steps", a.name));
        }
        if !matches!(a.scale.as_str(), "lin" | "log") {
            return Err(format!("axis `{}`: scale must be lin or log", a.name));
        }
        if a.scale == "log" && (a.start <= 0.0 || a.stop <= 0.0) {
            return Err(format!("axis `{}`: a log axis needs positive ends", a.name));
        }
    }
    let runs = cfg.runs.max(1);
    // The axis values are the generic sweep's, so a campaign grid and a `sweep-nd`
    // grid over the same range are the same numbers.
    let axis_values: Vec<Vec<f64>> = cfg
        .axes
        .iter()
        .map(|a| {
            crate::sweep::GenericAxis {
                key: a.key.clone(),
                start: a.start,
                stop: a.stop,
                steps: a.steps,
                scale: a.scale.clone(),
            }
            .values()
        })
        .collect();
    let shape: Vec<usize> = axis_values.iter().map(Vec::len).collect();
    let total: usize = shape.iter().product();
    let mut nodes = Vec::with_capacity(total);
    let mut infos: Option<BTreeMap<String, MetricInfo>> = None;
    for flat in 0..total {
        let coords = crate::sweep::coords_of(flat, &axis_values, &shape);
        let mut node = cfg.scenario.clone();
        for (a, &v) in cfg.axes.iter().zip(&coords) {
            crate::sweep::set_dotted(&mut node, &a.key, v)?;
        }
        let label = format!("sweep node {flat}");
        let (metrics, unit_doc) = if runs == 1 {
            let m = ledger.run(label, &node)?;
            let vals = metric_values(&m, &cfg.metrics)?;
            (
                cfg.metrics
                    .iter()
                    .zip(vals)
                    .map(|(mc, v)| (mc.name.clone(), NodeMetric::Value(v)))
                    .collect::<BTreeMap<_, _>>(),
                m,
            )
        } else {
            let base = seed_of(&node, &cfg.seed_key)?;
            let (cols, first) = ensemble(
                ledger,
                &label,
                &node,
                &cfg.seed_key,
                base,
                runs,
                &cfg.metrics,
            )?;
            (
                cfg.metrics
                    .iter()
                    .zip(&cols)
                    .enumerate()
                    .map(|(i, (mc, col))| {
                        let boot = seed ^ (flat as u64).wrapping_mul(0x100_0001) ^ (i as u64);
                        (
                            mc.name.clone(),
                            NodeMetric::Stat(crate::inertial::metric_stat(col, boot)),
                        )
                    })
                    .collect(),
                first,
            )
        };
        if infos.is_none() {
            let mut m = BTreeMap::new();
            for mc in &cfg.metrics {
                m.insert(
                    mc.name.clone(),
                    MetricInfo {
                        path: mc.path.clone(),
                        unit: resolve_unit(&mc.unit, &unit_doc.doc, &mc.path)?,
                    },
                );
            }
            infos = Some(m);
        }
        nodes.push(NodeOut {
            coords: cfg
                .axes
                .iter()
                .zip(&coords)
                .map(|(a, &v)| (a.name.clone(), v))
                .collect(),
            metrics,
        });
    }
    Ok(SweepOut {
        scenario_kind: kind_of(&cfg.scenario),
        runs,
        axis_order: cfg.axes.iter().map(|a| a.name.clone()).collect(),
        axes: cfg
            .axes
            .iter()
            .zip(axis_values)
            .map(|(a, values)| {
                (
                    a.name.clone(),
                    AxisOut {
                        key: a.key.clone(),
                        unit: a.unit.clone(),
                        scale: a.scale.clone(),
                        values,
                    },
                )
            })
            .collect(),
        metrics: infos.unwrap_or_default(),
        shape,
        nodes,
    })
}

fn run_monte_carlo(
    cfg: &MonteCarloCfg,
    campaign_seed: u64,
    ledger: &mut Ledger,
) -> Result<MonteCarloOut, String> {
    if cfg.runs < 2 {
        return Err("monte_carlo.runs must be at least two".into());
    }
    check_metrics(&cfg.metrics)?;
    let base = match cfg.base_seed {
        Some(s) => s,
        None => seed_of(&cfg.scenario, &cfg.seed_key)?,
    };
    let (cols, first) = ensemble(
        ledger,
        "monte carlo",
        &cfg.scenario,
        &cfg.seed_key,
        base,
        cfg.runs,
        &cfg.metrics,
    )?;
    let mut metrics = BTreeMap::new();
    for (i, (mc, col)) in cfg.metrics.iter().zip(cols).enumerate() {
        let boot = campaign_seed ^ base ^ 0xC0FF_EE00 ^ (i as u64);
        metrics.insert(
            mc.name.clone(),
            McMetric {
                path: mc.path.clone(),
                unit: resolve_unit(&mc.unit, &first.doc, &mc.path)?,
                n: col.len(),
                stat: crate::inertial::metric_stat(&col, boot),
                samples: cfg.keep_samples.then_some(col),
            },
        );
    }
    Ok(MonteCarloOut {
        scenario_kind: kind_of(&cfg.scenario),
        runs: cfg.runs,
        seed_key: cfg.seed_key.clone(),
        base_seed: base,
        metrics,
    })
}

fn run_compose(cfg: &ComposeCfg, ledger: &mut Ledger) -> Result<ComposeOut, String> {
    if cfg.members.is_empty() {
        return Err("compose needs at least one member".into());
    }
    let mut shared = BTreeMap::new();
    for s in &cfg.shared {
        check_name("shared value", &s.name)?;
        let numeric = match &s.value {
            toml::Value::Float(_) | toml::Value::Integer(_) => true,
            toml::Value::Array(a) => a
                .iter()
                .all(|x| matches!(x, toml::Value::Float(_) | toml::Value::Integer(_))),
            _ => false,
        };
        if !numeric {
            return Err(format!(
                "shared value `{}` must be a number or numbers",
                s.name
            ));
        }
        let v = serde_json::to_value(&s.value).map_err(|e| e.to_string())?;
        if shared
            .insert(
                s.name.clone(),
                SharedOut {
                    unit: s.unit.clone(),
                    value: v,
                },
            )
            .is_some()
        {
            return Err(format!("shared value `{}` is named twice", s.name));
        }
    }
    let mut members = BTreeMap::new();
    let mut metric_units: BTreeMap<String, String> = BTreeMap::new();
    for mem in &cfg.members {
        check_name("member label", &mem.label)?;
        check_metrics(&mem.metrics)?;
        let mut scn = mem.scenario.clone();
        for (name, key) in &mem.bind {
            let s =
                cfg.shared.iter().find(|s| &s.name == name).ok_or_else(|| {
                    format!("member `{}` binds unknown shared `{name}`", mem.label)
                })?;
            crate::sweep::set_dotted_value(&mut scn, key, s.value.clone())
                .map_err(|e| format!("member `{}`: {e}", mem.label))?;
        }
        let m = ledger.run(format!("member {}", mem.label), &scn)?;
        let vals = metric_values(&m, &mem.metrics)?;
        let mut mm = BTreeMap::new();
        for (mc, v) in mem.metrics.iter().zip(vals) {
            let unit = resolve_unit(&mc.unit, &m.doc, &mc.path)?;
            match metric_units.get(&mc.name) {
                Some(u) if *u != unit => {
                    return Err(format!(
                        "metric `{}` is in {u} for one member and {unit} for `{}`",
                        mc.name, mem.label
                    ))
                }
                Some(_) => {}
                None => {
                    metric_units.insert(mc.name.clone(), unit);
                }
            }
            mm.insert(mc.name.clone(), v);
        }
        let out = MemberOut {
            kind: m.kind.clone(),
            scenario_hash: m.scenario_hash(),
            result_sha256: sha256_hex(&m.json),
            bound: mem.bind.clone(),
            metrics: mm,
        };
        if members.insert(mem.label.clone(), out).is_some() {
            return Err(format!("member `{}` is named twice", mem.label));
        }
    }
    let mut combined = BTreeMap::new();
    for (name, unit) in &metric_units {
        let vals: Vec<(&String, f64)> = members
            .iter()
            .filter_map(|(l, m)| m.metrics.get(name).copied().flatten().map(|v| (l, v)))
            .filter(|(_, v)| v.is_finite())
            .collect();
        let Some(&(first_l, first_v)) = vals.first() else {
            continue;
        };
        let (mut lo, mut hi) = ((first_l, first_v), (first_l, first_v));
        for &(l, v) in &vals[1..] {
            if v < lo.1 {
                lo = (l, v);
            }
            if v > hi.1 {
                hi = (l, v);
            }
        }
        combined.insert(
            name.clone(),
            CombinedOut {
                unit: unit.clone(),
                members: vals.len(),
                min: lo.1,
                min_member: lo.0.clone(),
                max: hi.1,
                max_member: hi.0.clone(),
                mean: vals.iter().map(|(_, v)| v).sum::<f64>() / vals.len() as f64,
            },
        );
    }
    Ok(ComposeOut {
        shared,
        members,
        metric_units,
        combined,
    })
}

// ---------------------------------------------------------------------------
// Entry points
// ---------------------------------------------------------------------------

/// The member scenarios of a campaign, each with a label, as the campaign would dispatch
/// them before any run: every phase run (`<phase>`, or `<phase>-<k>` when the phase has
/// several runs), the sweep's base scenario (`sweep`), the Monte Carlo scenario
/// (`monte-carlo`), and each composed member (its label) with the shared values it binds
/// written in. Phase hand-offs and sweep or seed values are applied at run time and are not
/// in these tables. The interoperability exports use this list.
pub fn member_scenarios(src: &str) -> Result<Vec<(String, toml::Value)>, String> {
    let cfg: CampaignScenario =
        toml::from_str(src).map_err(|e| format!("invalid campaign scenario: {e}"))?;
    let mut out = Vec::new();
    for p in &cfg.phases {
        for (k, r) in p.runs.iter().enumerate() {
            let label = if p.runs.len() == 1 {
                p.name.clone()
            } else {
                format!("{}-{}", p.name, k)
            };
            out.push((label, r.scenario.clone()));
        }
    }
    if let Some(sw) = &cfg.sweep {
        out.push(("sweep".to_string(), sw.scenario.clone()));
    }
    if let Some(mc) = &cfg.monte_carlo {
        out.push(("monte-carlo".to_string(), mc.scenario.clone()));
    }
    if let Some(c) = &cfg.compose {
        for mem in &c.members {
            let mut scn = mem.scenario.clone();
            for (name, key) in &mem.bind {
                let s = c.shared.iter().find(|s| &s.name == name).ok_or_else(|| {
                    format!("member `{}` binds unknown shared `{name}`", mem.label)
                })?;
                crate::sweep::set_dotted_value(&mut scn, key, s.value.clone())
                    .map_err(|e| format!("member `{}`: {e}", mem.label))?;
            }
            out.push((mem.label.clone(), scn));
        }
    }
    Ok(out)
}

/// The campaign hash: SHA-256 of the canonical JSON form of the campaign document
/// (keys sorted), so formatting and key order in the TOML do not change it.
pub fn campaign_hash(src: &str) -> Result<String, String> {
    let v: toml::Value = toml::from_str(src).map_err(|e| format!("invalid campaign: {e}"))?;
    let canon = serde_json::to_string(&v).map_err(|e| e.to_string())?;
    Ok(sha256_hex(&canon))
}

/// Run a campaign given as TOML, returning the result and every member result.
pub fn run_campaign_detailed(src: &str) -> Result<CampaignRun, String> {
    let cfg: CampaignScenario =
        toml::from_str(src).map_err(|e| format!("invalid campaign scenario: {e}"))?;
    // A campaign with no section composes nothing and says so (its summary names it);
    // like every other kind, the bare `kind = "campaign"` document runs.
    let hash = campaign_hash(src)?;
    let mut ledger = Ledger { runs: Vec::new() };
    let timeline = if cfg.phases.is_empty() {
        None
    } else {
        Some(run_chain(&cfg, &mut ledger)?.0)
    };
    let sweep = match &cfg.sweep {
        Some(s) => Some(run_sweep(s, cfg.seed, &mut ledger).map_err(|e| format!("sweep: {e}"))?),
        None => None,
    };
    let monte_carlo = match &cfg.monte_carlo {
        Some(m) => Some(
            run_monte_carlo(m, cfg.seed, &mut ledger).map_err(|e| format!("monte_carlo: {e}"))?,
        ),
        None => None,
    };
    let compose = match &cfg.compose {
        Some(c) => Some(run_compose(c, &mut ledger).map_err(|e| format!("compose: {e}"))?),
        None => None,
    };
    let mut digest = Sha256::new();
    for (_, json) in &ledger.runs {
        digest.update(sha256_hex(json).as_bytes());
    }
    let result = CampaignResult {
        schema_version: crate::interchange::SCHEMA_VERSION.into(),
        engine_version: env!("CARGO_PKG_VERSION").into(),
        scenario_hash: hash.clone(),
        seed: cfg.seed,
        kind: "campaign".into(),
        title: cfg.title.clone().unwrap_or_else(|| "campaign".into()),
        label: LABEL.into(),
        reproducibility: Reproducibility {
            campaign_hash: hash,
            runs_total: ledger.runs.len(),
            run_digest: hex::encode(digest.finalize()),
        },
        timeline,
        sweep,
        monte_carlo,
        compose,
    };
    Ok(CampaignRun {
        result,
        member_results: ledger.runs,
    })
}

/// Run a campaign given as TOML.
pub fn run_campaign(src: &str) -> Result<CampaignResult, String> {
    Ok(run_campaign_detailed(src)?.result)
}

// ---------------------------------------------------------------------------
// Units
// ---------------------------------------------------------------------------

struct UnitsBuilder(Map<String, Value>);

impl UnitsBuilder {
    fn add(&mut self, path: &str, unit: &str, prov: ProvenanceClass, note: &str) {
        let mut e = Map::new();
        e.insert("unit".into(), Value::from(unit));
        e.insert("provenance".into(), Value::from(prov.as_str()));
        e.insert("note".into(), Value::from(note));
        self.0.insert(path.to_string(), Value::Object(e));
    }
}

fn stat_units(b: &mut UnitsBuilder, prefix: &str, unit: &str, what: &str) {
    use ProvenanceClass::Computed;
    let rows: [(&str, &str); 7] = [
        ("mean", "sample mean"),
        ("std", "population standard deviation"),
        ("p05", "5th percentile (nearest rank)"),
        ("p50", "median (nearest rank)"),
        ("p95", "95th percentile (nearest rank)"),
        (
            "ci95_low",
            "lower end of the fixed-seed percentile-bootstrap 95% confidence interval on the mean (2000 resamples)",
        ),
        (
            "ci95_high",
            "upper end of the fixed-seed percentile-bootstrap 95% confidence interval on the mean (2000 resamples)",
        ),
    ];
    for (k, d) in rows {
        b.add(
            &format!("{prefix}.{k}"),
            unit,
            Computed,
            &format!("{d} of {what} across the realisations"),
        );
    }
}

/// The units block of one campaign result. Built from the document itself, because
/// channel, axis, metric and member names are chosen by the campaign.
pub fn units(r: &CampaignResult) -> Value {
    use ProvenanceClass::*;
    let mut b = UnitsBuilder(Map::new());
    b.add(
        "seed",
        "1",
        Input,
        "campaign seed: the default Monte Carlo base seed and the seed of every bootstrap resampling",
    );
    b.add(
        "reproducibility.runs_total",
        "count",
        Computed,
        "member scenario runs the campaign dispatched",
    );
    if let Some(t) = &r.timeline {
        b.add(
            "timeline.step_s",
            "s",
            Input,
            "grid spacing of the aligned mission timeline",
        );
        b.add(
            "timeline.duration_s",
            "s",
            Computed,
            "mission length: the sum of the phase lengths as run",
        );
        b.add(
            "timeline.t_s[]",
            "s",
            Computed,
            "mission time of each grid sample",
        );
        b.add(
            "timeline.phases[].t0_s",
            "s",
            Computed,
            "mission time at which the phase starts (the previous phase's end)",
        );
        b.add(
            "timeline.phases[].t1_s",
            "s",
            Computed,
            "mission time at which the phase ends: t0_s plus duration_s, or earlier when end_at fired",
        );
        b.add(
            "timeline.phases[].runs[].skip_s",
            "s",
            Input,
            "seconds of the run's own timeline dropped before phase time zero",
        );
        b.add(
            "timeline.events[].t_s",
            "s",
            Computed,
            "mission time of the event, read from the run that raised it",
        );
        b.add(
            "timeline.handoffs[].value",
            "see the sibling `unit` field",
            Computed,
            "the number written into the phase's scenario, after scale and offset",
        );
        let mut carried: Vec<&String> = t.phases.iter().flat_map(|p| p.carried.keys()).collect();
        carried.sort();
        carried.dedup();
        for ch in carried {
            let unit = t.channels.get(ch).map_or("1", |c| c.unit.as_str());
            b.add(
                &format!("timeline.phases[].carried.{ch}"),
                unit,
                Computed,
                &format!(
                    "value of {ch} at the end of the previous phase, added to this phase's {ch}"
                ),
            );
        }
        for (name, c) in &t.channels {
            b.add(
                &format!("timeline.channels.{name}.values[]"),
                &c.unit,
                Computed,
                &format!(
                    "{} on the timeline grid: the latest sample of the owning phase's run at or before each grid time (zero-order hold); null where no run of that phase provides it",
                    c.label
                ),
            );
        }
    }
    if let Some(s) = &r.sweep {
        b.add("sweep.runs", "count", Input, "realisations per sweep node");
        b.add(
            "sweep.shape[]",
            "count",
            Computed,
            "values along each axis, in axis_order",
        );
        for (name, a) in &s.axes {
            b.add(
                &format!("sweep.axes.{name}.values[]"),
                &a.unit,
                Computed,
                &format!("values of the scenario key {} along axis {name}", a.key),
            );
            b.add(
                &format!("sweep.nodes[].coords.{name}"),
                &a.unit,
                Computed,
                &format!("value of the scenario key {} at this node", a.key),
            );
        }
        for (name, m) in &s.metrics {
            if s.runs == 1 {
                b.add(
                    &format!("sweep.nodes[].metrics.{name}"),
                    &m.unit,
                    Computed,
                    &format!("{} of the node's result", m.path),
                );
            } else {
                stat_units(
                    &mut b,
                    &format!("sweep.nodes[].metrics.{name}"),
                    &m.unit,
                    &m.path,
                );
            }
        }
    }
    if let Some(mc) = &r.monte_carlo {
        b.add("monte_carlo.runs", "count", Input, "number of realisations");
        b.add(
            "monte_carlo.base_seed",
            "1",
            Input,
            "seed of realisation zero; realisation k runs at base_seed + k",
        );
        for (name, m) in &mc.metrics {
            let p = format!("monte_carlo.metrics.{name}");
            b.add(
                &format!("{p}.n"),
                "count",
                Computed,
                "realisations aggregated",
            );
            stat_units(&mut b, &p, &m.unit, &m.path);
            b.add(
                &format!("{p}.samples[]"),
                &m.unit,
                Computed,
                &format!("{} of each realisation, in seed order", m.path),
            );
        }
    }
    if let Some(c) = &r.compose {
        for (name, s) in &c.shared {
            let path = if s.value.is_array() {
                format!("compose.shared.{name}.value[]")
            } else {
                format!("compose.shared.{name}.value")
            };
            b.add(
                &path,
                &s.unit,
                Input,
                &format!("shared value {name}, written into every member that binds it"),
            );
        }
        for (name, unit) in &c.metric_units {
            b.add(
                &format!("compose.members.*.metrics.{name}"),
                unit,
                Computed,
                &format!("metric {name} read from the member's result"),
            );
        }
        for (name, o) in &c.combined {
            let p = format!("compose.combined.{name}");
            b.add(
                &format!("{p}.members"),
                "count",
                Computed,
                "members reporting a finite value",
            );
            b.add(
                &format!("{p}.min"),
                &o.unit,
                Computed,
                &format!("smallest {name} across the members"),
            );
            b.add(
                &format!("{p}.max"),
                &o.unit,
                Computed,
                &format!("largest {name} across the members"),
            );
            b.add(
                &format!("{p}.mean"),
                &o.unit,
                Computed,
                &format!("mean {name} across the members"),
            );
        }
    }
    Value::Object(b.0)
}

/// The result document, with its units block appended.
pub fn to_json(r: &CampaignResult) -> Result<String, String> {
    #[derive(Serialize)]
    struct Documented<'a> {
        #[serde(flatten)]
        report: &'a CampaignResult,
        units: Value,
    }
    serde_json::to_string_pretty(&Documented {
        report: r,
        units: units(r),
    })
    .map_err(|e| format!("failed to serialise campaign result: {e}"))
}

/// A one-line summary.
pub fn summary(r: &CampaignResult) -> String {
    let mut parts = vec![format!("campaign {} | {}", &r.scenario_hash[..12], r.title)];
    if let Some(t) = &r.timeline {
        let alarm_s = t.channels.get("alarm").map_or(0.0, |c| {
            c.values.iter().filter(|v| **v == Some(1.0)).count() as f64 * t.step_s
        });
        parts.push(format!(
            "chain: {} phases over {:.0} s, {} events, alarm raised on {:.0} s of the grid",
            t.phases.len(),
            t.duration_s,
            t.events.len(),
            alarm_s
        ));
    }
    if let Some(s) = &r.sweep {
        parts.push(format!(
            "sweep of `{}`: {} nodes over [{}]{}",
            s.scenario_kind,
            s.nodes.len(),
            s.axis_order.join(", "),
            if s.runs > 1 {
                format!(", {} seeds each", s.runs)
            } else {
                String::new()
            }
        ));
    }
    if let Some(m) = &r.monte_carlo {
        parts.push(format!(
            "monte carlo of `{}`: {} seeds",
            m.scenario_kind, m.runs
        ));
    }
    if let Some(c) = &r.compose {
        parts.push(format!("compose: {} members", c.members.len()));
    }
    if r.timeline.is_none() && r.sweep.is_none() && r.monte_carlo.is_none() && r.compose.is_none() {
        parts.push(
            "no [[phases]], [sweep], [monte_carlo] or [compose] section: nothing composed".into(),
        );
    }
    parts.push(format!(
        "{} member runs (MODELLED)",
        r.reproducibility.runs_total
    ));
    parts.join(" | ")
}

// ---------------------------------------------------------------------------
// Chart
// ---------------------------------------------------------------------------

fn esc(s: &str) -> String {
    s.replace('&', "&amp;")
        .replace('<', "&lt;")
        .replace('>', "&gt;")
}

fn fmt_num(v: f64) -> String {
    let a = v.abs();
    if a == 0.0 {
        "0".into()
    } else if !(1e-3..1e5).contains(&a) {
        format!("{v:.2e}")
    } else if a >= 100.0 {
        format!("{v:.0}")
    } else if a >= 1.0 {
        format!("{v:.1}")
    } else {
        format!("{v:.3}")
    }
}

/// A panel of the timeline chart: channels drawn solid, references dashed.
struct Panel<'a> {
    title: &'a str,
    solid: Vec<&'a str>,
    dashed: Vec<&'a str>,
    symmetric: bool,
}

const PALETTE: [&str; 5] = [CYAN, LIME, AMBER, BLUE, MAGENTA];

fn polyline(
    values: &[Option<f64>],
    x: impl Fn(usize) -> f64,
    y: impl Fn(f64) -> f64,
    color: &str,
    dashed: bool,
) -> String {
    let mut out = String::new();
    let mut run: Vec<String> = Vec::new();
    let flush =
        |run: &mut Vec<String>, out: &mut String| {
            if run.len() > 1 {
                out.push_str(&format!(
                "<polyline fill=\"none\" stroke=\"{color}\" stroke-width=\"1.6\"{} points=\"{}\"/>",
                if dashed { " stroke-dasharray=\"5 4\"" } else { "" },
                run.join(" ")
            ));
            }
            run.clear();
        };
    for (i, v) in values.iter().enumerate() {
        match v {
            Some(v) if v.is_finite() => run.push(format!("{:.1},{:.1}", x(i), y(*v))),
            _ => flush(&mut run, &mut out),
        }
    }
    flush(&mut run, &mut out);
    out
}

fn timeline_svg(t: &TimelineOut, top: f64, w: f64) -> (String, f64) {
    let (ml, mr) = (80.0_f64, 24.0_f64);
    let pw = w - ml - mr;
    let known = [
        "time_error_ns",
        "guard_ns",
        "cn0_dbhz",
        "cn0_floor_dbhz",
        "tracking",
        "protection_level_m",
        "alert_limit_m",
        "position_error_m",
        "position_threshold_m",
        "alarm",
    ];
    let mut panels: Vec<Panel> = vec![
        Panel {
            title: "clock time error vs guard (ns)",
            solid: vec!["time_error_ns"],
            dashed: vec!["guard_ns"],
            symmetric: true,
        },
        Panel {
            title: "C/N0 vs tracking floor (dB-Hz)",
            solid: vec!["cn0_dbhz"],
            dashed: vec!["cn0_floor_dbhz"],
            symmetric: false,
        },
        Panel {
            title: "protection level vs alert limit (m)",
            solid: vec!["protection_level_m"],
            dashed: vec!["alert_limit_m"],
            symmetric: false,
        },
        Panel {
            title: "position error vs threshold (m)",
            solid: vec!["position_error_m"],
            dashed: vec!["position_threshold_m"],
            symmetric: false,
        },
        Panel {
            title: "satellites tracking",
            solid: vec!["tracking"],
            dashed: vec![],
            symmetric: false,
        },
    ];
    for name in t.channels.keys() {
        if !known.contains(&name.as_str()) {
            panels.push(Panel {
                title: name,
                solid: vec![name],
                dashed: vec![],
                symmetric: false,
            });
        }
    }
    panels.retain(|p| p.solid.iter().any(|c| t.channels.contains_key(*c)));
    let ph = 120.0_f64;
    let gap = 34.0_f64;
    let n = t.t_s.len().max(2);
    let dur = t.duration_s.max(t.step_s);
    let x = |i: usize| ml + (t.t_s.get(i).copied().unwrap_or(0.0) / dur) * pw;
    let xt = |ts: f64| ml + (ts / dur) * pw;
    let _ = n;
    let mut s = String::new();
    let mut y0 = top + 44.0;
    // Phase names across the top, above the first panel's caption.
    for (i, p) in t.phases.iter().enumerate() {
        let xa = xt(p.t0_s);
        let xb = xt(p.t1_s);
        s.push_str(&format!(
            "<text x=\"{:.1}\" y=\"{:.0}\" text-anchor=\"middle\" font-size=\"11\" fill=\"{}\">{}</text>",
            (xa + xb) / 2.0,
            y0 - 26.0,
            PALETTE[i % PALETTE.len()],
            esc(&p.name)
        ));
    }
    let panels_top = y0;
    for p in &panels {
        let (bottom, ptop) = (y0 + ph, y0);
        let vals: Vec<f64> = p
            .solid
            .iter()
            .chain(&p.dashed)
            .filter_map(|c| t.channels.get(*c))
            .flat_map(|c| c.values.iter().flatten().copied())
            .filter(|v| v.is_finite())
            .collect();
        let (mut lo, mut hi) = vals
            .iter()
            .fold((f64::INFINITY, f64::NEG_INFINITY), |(a, b), &v| {
                (a.min(v), b.max(v))
            });
        if p.symmetric {
            let m = lo.abs().max(hi.abs());
            lo = -m;
            hi = m;
        }
        if !lo.is_finite() || !hi.is_finite() {
            lo = 0.0;
            hi = 1.0;
        }
        if (hi - lo).abs() < 1e-12 {
            hi = lo + 1.0;
        }
        let pad = 0.06 * (hi - lo);
        let (lo, hi) = (lo - pad, hi + pad);
        let y = |v: f64| bottom - (v - lo) / (hi - lo) * ph;
        s.push_str(&crate::chart::panel_axes(
            ml,
            ptop,
            pw,
            bottom,
            &esc(p.title),
        ));
        for k in 0..=2 {
            let v = lo + (hi - lo) * f64::from(k) / 2.0;
            s.push_str(&format!(
                "<line x1=\"{ml:.0}\" y1=\"{:.1}\" x2=\"{:.0}\" y2=\"{:.1}\" stroke=\"{GRID}\"/><text x=\"{:.0}\" y=\"{:.1}\" text-anchor=\"end\" font-size=\"10\" fill=\"{MUTED}\">{}</text>",
                y(v),
                ml + pw,
                y(v),
                ml - 6.0,
                y(v) + 3.0,
                fmt_num(v)
            ));
        }
        for (ci, c) in p.solid.iter().enumerate() {
            if let Some(ch) = t.channels.get(*c) {
                s.push_str(&polyline(
                    &ch.values,
                    x,
                    y,
                    PALETTE[ci % PALETTE.len()],
                    false,
                ));
            }
        }
        for c in &p.dashed {
            if let Some(ch) = t.channels.get(*c) {
                s.push_str(&polyline(&ch.values, x, y, CORAL, true));
                if p.symmetric {
                    let neg: Vec<Option<f64>> = ch.values.iter().map(|v| v.map(|v| -v)).collect();
                    s.push_str(&polyline(&neg, x, y, CORAL, true));
                }
            }
        }
        y0 = bottom + gap;
    }
    // The alarm strip.
    if let Some(al) = t.channels.get("alarm") {
        let h = 16.0;
        s.push_str(&format!(
            "<text x=\"{ml:.0}\" y=\"{:.0}\" font-size=\"12\" fill=\"{MUTED}\">alarm flags and events</text>",
            y0 - 8.0
        ));
        for (i, v) in al.values.iter().enumerate() {
            let (xa, xb) = (
                x(i),
                if i + 1 < al.values.len() {
                    x(i + 1)
                } else {
                    x(i) + 1.0
                },
            );
            let color = match v {
                Some(v) if *v > 0.5 => CORAL,
                Some(_) => LIME,
                None => PANEL,
            };
            s.push_str(&format!(
                "<rect x=\"{xa:.1}\" y=\"{y0:.1}\" width=\"{:.2}\" height=\"{h:.0}\" fill=\"{color}\"/>",
                (xb - xa).max(0.5)
            ));
        }
        y0 += h + 10.0;
    }
    for e in &t.events {
        let xe = xt(e.t_s);
        s.push_str(&format!(
            "<line x1=\"{xe:.1}\" y1=\"{panels_top:.0}\" x2=\"{xe:.1}\" y2=\"{:.0}\" stroke=\"{CORAL}\" stroke-width=\"1\" stroke-dasharray=\"2 3\"/><text x=\"{:.1}\" y=\"{:.0}\" font-size=\"10\" fill=\"{CORAL}\">{}</text>",
            y0 - 8.0,
            xe + 3.0,
            y0 + 4.0,
            esc(&e.label)
        ));
        y0 += 13.0;
    }
    // Phase boundaries across every panel.
    for p in t.phases.iter().skip(1) {
        let xb = xt(p.t0_s);
        s.push_str(&format!(
            "<line x1=\"{xb:.1}\" y1=\"{:.0}\" x2=\"{xb:.1}\" y2=\"{:.0}\" stroke=\"{AXIS}\" stroke-dasharray=\"4 3\"/>",
            panels_top - 36.0,
            y0 - 8.0
        ));
    }
    s.push_str(&format!(
        "<text x=\"{ml:.0}\" y=\"{:.0}\" font-size=\"11\">0 s</text><text x=\"{:.0}\" y=\"{:.0}\" text-anchor=\"end\" font-size=\"11\">{} s mission time</text>",
        y0 + 8.0,
        ml + pw,
        y0 + 8.0,
        fmt_num(t.duration_s)
    ));
    (s, y0 + 24.0)
}

/// One drawn sweep line: its label, and the median (or value) with the 5th and 95th
/// percentiles along the last axis.
type SweepLine = (String, Vec<Option<f64>>, Vec<Option<f64>>, Vec<Option<f64>>);

fn sweep_svg(sw: &SweepOut, top: f64, w: f64) -> (String, f64) {
    let (ml, mr, ph) = (80.0_f64, 24.0_f64, 160.0_f64);
    let pw = w - ml - mr;
    let mut s = String::new();
    let caption = format!(
        "sweep of `{}` over {} ({} nodes{}; each line on its own range)",
        sw.scenario_kind,
        sw.axis_order.join(" x "),
        sw.nodes.len(),
        if sw.runs > 1 {
            format!(
                ", median with 5th-95th percentile band over {} seeds",
                sw.runs
            )
        } else {
            String::new()
        }
    );
    let ptop = top + 20.0;
    let bottom = ptop + ph;
    s.push_str(&crate::chart::panel_axes(
        ml,
        ptop,
        pw,
        bottom,
        &esc(&caption),
    ));
    // Lines along the last axis, one per metric (and per leading-axis value).
    let last = sw.shape.len() - 1;
    let lane = sw.shape[last];
    let get = |m: &NodeMetric| -> (Option<f64>, Option<f64>, Option<f64>) {
        match m {
            NodeMetric::Value(v) => (*v, None, None),
            NodeMetric::Stat(st) => (Some(st.p50), Some(st.p05), Some(st.p95)),
        }
    };
    let mut lines: Vec<SweepLine> = Vec::new();
    for (mi, (name, info)) in sw.metrics.iter().enumerate() {
        let _ = mi;
        for chunk in sw.nodes.chunks(lane) {
            let lead: Vec<String> = sw.axis_order[..last]
                .iter()
                .map(|a| format!("{a}={}", fmt_num(chunk[0].coords[a])))
                .collect();
            let label = if lead.is_empty() {
                format!("{name} ({})", info.unit)
            } else {
                format!("{name} ({}) at {}", info.unit, lead.join(", "))
            };
            let (mut mid, mut lo, mut hi) = (Vec::new(), Vec::new(), Vec::new());
            for n in chunk {
                let (a, b, c) = n.metrics.get(name).map_or((None, None, None), get);
                mid.push(a);
                lo.push(b);
                hi.push(c);
            }
            lines.push((label, mid, lo, hi));
        }
    }
    // Each line normalised to its own range, since metrics carry different units.
    let xs = |i: usize| ml + (i as f64 / (lane.max(2) - 1) as f64) * pw;
    for (li, (label, mid, lo, hi)) in lines.iter().enumerate() {
        let all: Vec<f64> = mid
            .iter()
            .chain(lo)
            .chain(hi)
            .flatten()
            .copied()
            .filter(|v| v.is_finite())
            .collect();
        let (a, b) = all
            .iter()
            .fold((f64::INFINITY, f64::NEG_INFINITY), |(a, b), &v| {
                (a.min(v), b.max(v))
            });
        let (a, b) = if a.is_finite() && b > a {
            (a, b)
        } else {
            (a.min(0.0), a.max(0.0) + 1.0)
        };
        let y = |v: f64| bottom - (v - a) / (b - a) * ph;
        let color = PALETTE[li % PALETTE.len()];
        s.push_str(&polyline(lo, xs, y, color, true));
        s.push_str(&polyline(hi, xs, y, color, true));
        s.push_str(&polyline(mid, xs, y, color, false));
        s.push_str(&format!(
            "<text x=\"{:.0}\" y=\"{:.0}\" font-size=\"11\" fill=\"{color}\">{} : {} .. {}</text>",
            ml + 8.0,
            ptop + 14.0 + 14.0 * li as f64,
            esc(label),
            fmt_num(a),
            fmt_num(b)
        ));
    }
    let axis = &sw.axes[&sw.axis_order[last]];
    s.push_str(&format!(
        "<text x=\"{ml:.0}\" y=\"{:.0}\" font-size=\"11\">{}</text><text x=\"{:.0}\" y=\"{:.0}\" text-anchor=\"end\" font-size=\"11\">{} {} ({})</text>",
        bottom + 16.0,
        fmt_num(axis.values[0]),
        ml + pw,
        bottom + 16.0,
        fmt_num(*axis.values.last().unwrap_or(&0.0)),
        esc(&axis.unit),
        esc(&axis.key)
    ));
    (s, bottom + 40.0)
}

fn mc_svg(mc: &MonteCarloOut, top: f64, w: f64) -> (String, f64) {
    let ml = 80.0_f64;
    let pw = w - ml - 24.0;
    let mut s = format!(
        "<text x=\"{ml:.0}\" y=\"{:.0}\" font-size=\"12\" fill=\"{MUTED}\">Monte Carlo of `{}`: {} seeds from {} (5th, 50th, 95th percentile; bar = bootstrap 95% confidence interval on the mean)</text>",
        top + 14.0,
        esc(&mc.scenario_kind),
        mc.runs,
        mc.base_seed
    );
    let mut y = top + 34.0;
    for (i, (name, m)) in mc.metrics.iter().enumerate() {
        let st = &m.stat;
        let lo = st.p05.min(st.ci95_low);
        let hi = st.p95.max(st.ci95_high);
        let span = if hi > lo { hi - lo } else { 1.0 };
        let xv = |v: f64| ml + 220.0 + (v - lo) / span * (pw - 240.0);
        let color = PALETTE[i % PALETTE.len()];
        s.push_str(&format!(
            "<text x=\"{ml:.0}\" y=\"{:.0}\" font-size=\"11\" fill=\"{color}\">{} ({})</text>\
             <line x1=\"{:.1}\" y1=\"{y:.0}\" x2=\"{:.1}\" y2=\"{y:.0}\" stroke=\"{color}\" stroke-width=\"2\"/>\
             <rect x=\"{:.1}\" y=\"{:.0}\" width=\"{:.1}\" height=\"8\" fill=\"{color}\" opacity=\"0.5\"/>\
             <circle cx=\"{:.1}\" cy=\"{y:.0}\" r=\"3\" fill=\"{INK}\"/>\
             <text x=\"{:.1}\" y=\"{:.0}\" font-size=\"10\">{}</text><text x=\"{:.1}\" y=\"{:.0}\" font-size=\"10\" text-anchor=\"end\">{}</text>",
            y + 4.0,
            esc(name),
            esc(&m.unit),
            xv(st.p05),
            xv(st.p95),
            xv(st.ci95_low),
            y - 4.0,
            (xv(st.ci95_high) - xv(st.ci95_low)).max(1.0),
            xv(st.p50),
            xv(st.p05),
            y + 16.0,
            fmt_num(st.p05),
            xv(st.p95),
            y + 16.0,
            fmt_num(st.p95),
        ));
        y += 36.0;
    }
    (s, y + 6.0)
}

fn compose_svg(c: &ComposeOut, top: f64, w: f64) -> (String, f64) {
    let ml = 80.0_f64;
    let mut s = format!(
        "<text x=\"{ml:.0}\" y=\"{:.0}\" font-size=\"12\" fill=\"{MUTED}\">composed members under shared conditions: {}</text>",
        top + 14.0,
        esc(&c
            .shared
            .iter()
            .map(|(k, v)| format!("{k} = {} {}", v.value, v.unit))
            .collect::<Vec<_>>()
            .join("; "))
    );
    let names: Vec<&String> = c.metric_units.keys().collect();
    let col = ((w - ml - 200.0) / names.len().max(1) as f64).max(90.0);
    let mut y = top + 36.0;
    for (i, n) in names.iter().enumerate() {
        s.push_str(&format!(
            "<text x=\"{:.0}\" y=\"{y:.0}\" font-size=\"11\" fill=\"{MUTED}\">{} ({})</text>",
            ml + 200.0 + col * i as f64,
            esc(n),
            esc(&c.metric_units[*n])
        ));
    }
    for (label, m) in &c.members {
        y += 18.0;
        s.push_str(&format!(
            "<text x=\"{ml:.0}\" y=\"{y:.0}\" font-size=\"11\">{} ({})</text>",
            esc(label),
            esc(&m.kind)
        ));
        for (i, n) in names.iter().enumerate() {
            let v = m.metrics.get(*n).copied().flatten();
            s.push_str(&format!(
                "<text x=\"{:.0}\" y=\"{y:.0}\" font-size=\"11\">{}</text>",
                ml + 200.0 + col * i as f64,
                v.map_or("n/a".to_string(), fmt_num)
            ));
        }
    }
    (s, y + 26.0)
}

/// The campaign chart: the synced timeline panels, then the sweep, Monte Carlo and
/// compose sections that are present.
pub fn to_svg(r: &CampaignResult) -> String {
    let w = 1100.0_f64;
    let mut body = String::new();
    let mut y = 56.0_f64;
    if let Some(t) = &r.timeline {
        let (s, ny) = timeline_svg(t, y, w);
        body.push_str(&s);
        y = ny;
    }
    if let Some(sw) = &r.sweep {
        let (s, ny) = sweep_svg(sw, y, w);
        body.push_str(&s);
        y = ny;
    }
    if let Some(mc) = &r.monte_carlo {
        let (s, ny) = mc_svg(mc, y, w);
        body.push_str(&s);
        y = ny;
    }
    if let Some(c) = &r.compose {
        let (s, ny) = compose_svg(c, y, w);
        body.push_str(&s);
        y = ny;
    }
    let h = y + 20.0;
    let mut svg = crate::chart::frame_open(
        w,
        h,
        &esc(&r.title),
        &format!(
            "campaign {} | MODELLED composition; every value read from a real run of the named kind",
            &r.scenario_hash[..12]
        ),
    );
    svg.push_str(&body);
    svg.push_str("</svg>");
    svg
}

/// Run a campaign and render its outputs: `(json, summary, svg)`.
pub fn run_all(src: &str) -> Result<(String, String, String), String> {
    let r = run_campaign(src)?;
    Ok((to_json(&r)?, summary(&r), to_svg(&r)))
}

#[cfg(test)]
mod tests {
    use super::*;
    use serde_json::json;

    #[test]
    fn paths_index_rows_and_the_last_element() {
        let d = json!({"a": {"rows": [{"t": 0.0, "v": [1.0, 3.0]}, {"t": 10.0, "v": [5.0]}]},
                       "flag": true, "n": null});
        assert_eq!(eval_scalar(&d, "a.rows[-1].t").unwrap(), Some(10.0));
        assert_eq!(eval_scalar(&d, "a.rows[0].v[1]").unwrap(), Some(3.0));
        assert_eq!(eval_scalar(&d, "flag").unwrap(), Some(1.0));
        assert_eq!(eval_scalar(&d, "n").unwrap(), None);
        assert!(eval_scalar(&d, "a.rows[].t").is_err());
        assert!(eval_scalar(&d, "a.rows[2].t").is_err());
        match eval_rows(&d, "a.rows[].v[]").unwrap() {
            Rows::Rows(r) => assert_eq!(r, vec![vec![1.0, 3.0], vec![5.0]]),
            Rows::Scalar(_) => panic!("expected rows"),
        }
        assert_eq!(canonical_path("a.rows[-1].v[0]"), "a.rows[].v[]");
    }

    #[test]
    fn hold_takes_the_latest_sample_at_or_before() {
        let s = [(0.0, 1.0), (30.0, 2.0), (60.0, 3.0)];
        assert_eq!(hold(&s, -1.0), None);
        assert_eq!(hold(&s, 0.0), Some(1.0));
        assert_eq!(hold(&s, 59.0), Some(2.0));
        assert_eq!(hold(&s, 60.0), Some(3.0));
    }

    #[test]
    fn names_are_restricted_to_path_safe_characters() {
        assert!(check_name("x", "ship-strait_2").is_ok());
        assert!(check_name("x", "a.b").is_err());
        assert!(check_name("x", "").is_err());
    }
}
