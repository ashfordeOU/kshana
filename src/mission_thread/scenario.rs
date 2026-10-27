// SPDX-License-Identifier: AGPL-3.0-only
//! The `mission-thread` document and its runner: parse the phases, run them in order through the
//! registry, hand the state on with the stated rule, convert frames and timescales at each
//! handover, and report the per-phase error budget, the weakest link and a timeline.
//!
//! The runner takes the phase lookup as a parameter so it can be tested with phases of its own;
//! [`run_thread`] uses the registry.

use std::collections::BTreeSet;

use serde::{Deserialize, Serialize};
use serde_json::{json, Value};

use super::budget::{margin, thread_label, weakest_link, BudgetRow, PhaseBudget, WeakestLink};
use super::handover::apply_handover;
use super::phase::{
    Event, EvidenceLabel, Frame, HandoverRule, NavSource, NavState, PhaseOutcome, PhaseSpec,
    Requirement, TimeSource, Timescale, N,
};
use super::{phase_kind, run_phase, PhaseKindInfo, ThreadCtx};

/// The `schema` string of a thread report.
pub const SCHEMA: &str = "kshana-mission-thread/1";

/// The entry state of the first phase, as a document states it.
#[derive(Clone, Debug, Deserialize, Serialize)]
#[serde(deny_unknown_fields)]
pub struct EntryDoc {
    /// The frame of `x`: `gcrf`, `itrf`, `mci`, `mcmf` or `lvlh`.
    pub frame: String,
    /// Position (m) and velocity (m/s).
    pub x: [f64; N],
    /// 1-sigma position on each axis, metres.
    pub sigma_pos_m: f64,
    /// 1-sigma velocity on each axis, metres per second.
    pub sigma_vel_mps: f64,
    /// The timescale the clock is stated in: `tt`, `tdb`, `utc` or `ltc`.
    pub timescale: String,
    /// 1-sigma clock bias, seconds.
    pub sigma_time_s: f64,
    /// 1-sigma clock drift, seconds per second.
    #[serde(default)]
    pub sigma_drift_s_per_s: f64,
}

/// A handover rule as a document states it.
#[derive(Clone, Debug, Deserialize, Serialize)]
#[serde(deny_unknown_fields)]
pub struct HandoverDoc {
    /// `carry`, `inflate` or `reacquire`.
    pub rule: String,
    /// White acceleration noise, (m/s^2)^2 per Hz (`inflate`, `reacquire`).
    #[serde(default)]
    pub q_acc: Option<f64>,
    /// The gap the noise acts over, seconds (`inflate`).
    #[serde(default)]
    pub gap_s: Option<f64>,
    /// Dead reckoning before the new source is acquired, seconds (`reacquire`).
    #[serde(default)]
    pub acquire_s: Option<f64>,
    /// 1-sigma position the acquired source delivers, metres per axis (`reacquire`).
    #[serde(default)]
    pub floor_pos_m: Option<f64>,
    /// 1-sigma velocity the acquired source delivers, m/s per axis (`reacquire`).
    #[serde(default)]
    pub floor_vel_mps: Option<f64>,
    /// 1-sigma time the acquired source delivers, seconds (`reacquire`).
    #[serde(default)]
    pub floor_time_s: Option<f64>,
}

/// A requirement as a document states it.
#[derive(Clone, Debug, Default, Deserialize, Serialize)]
#[serde(deny_unknown_fields)]
pub struct RequirementDoc {
    /// Largest 1-sigma position over the phase, metres.
    #[serde(default)]
    pub max_pos_m: Option<f64>,
    /// Largest 1-sigma velocity over the phase, metres per second.
    #[serde(default)]
    pub max_vel_mps: Option<f64>,
    /// Largest 1-sigma time over the phase, seconds.
    #[serde(default)]
    pub max_time_s: Option<f64>,
}

/// One phase as a document states it.
#[derive(Clone, Debug, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct PhaseDoc {
    /// A name unique within the thread.
    pub id: String,
    /// The registered phase kind.
    pub kind: String,
    /// Phase length, seconds.
    pub duration_s: f64,
    /// Navigation sources.
    pub nav: Vec<String>,
    /// Time source.
    pub time: String,
    /// The frame this phase needs its entry state in.
    #[serde(default)]
    pub frame: Option<String>,
    /// The timescale this phase needs its clock in.
    #[serde(default)]
    pub timescale: Option<String>,
    /// How this phase hands over to the next (default `carry`).
    #[serde(default)]
    pub handover: Option<HandoverDoc>,
    /// What the phase must meet.
    #[serde(default)]
    pub requirement: Option<RequirementDoc>,
    /// The phase kind's own parameters.
    #[serde(default)]
    pub model: toml::Table,
}

/// The `mission-thread` document.
#[derive(Clone, Debug, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct MissionThreadScenario {
    /// Always `"mission-thread"`.
    #[serde(default)]
    pub kind: Option<String>,
    /// A display title.
    #[serde(default)]
    pub title: Option<String>,
    /// The thread seed; each phase's seed is derived from it and the phase id.
    #[serde(default)]
    pub seed: u64,
    /// The thread's epoch, UTC ISO-8601; mission elapsed time counts from it.
    pub epoch_utc: String,
    /// A JPL SPK kernel with the Moon and the Earth, for the Moon's state at frame handovers.
    #[serde(default)]
    pub moon_kernel_path: Option<String>,
    /// The ground-network overlay: stations and, per phase, how its tracking coverage is computed.
    #[serde(default)]
    pub ground_network: Option<crate::mission_thread::earth::ground_network::GroundNetworkDoc>,
    /// The first phase's entry state.
    pub entry: EntryDoc,
    /// The phases, in order.
    #[serde(rename = "phase")]
    pub phases: Vec<PhaseDoc>,
}

fn finite_pos(name: &str, v: f64) -> Result<f64, String> {
    if v.is_finite() && v > 0.0 {
        Ok(v)
    } else {
        Err(format!("{name} must be a positive finite number, got {v}"))
    }
}

fn need(what: &str, rule: &str, v: Option<f64>) -> Result<f64, String> {
    v.ok_or_else(|| format!("handover rule `{rule}` needs `{what}`"))
}

impl HandoverDoc {
    fn to_rule(&self) -> Result<HandoverRule, String> {
        match self.rule.as_str() {
            "carry" => Ok(HandoverRule::Carry),
            "inflate" => Ok(HandoverRule::Inflate {
                q_acc: need("q_acc", "inflate", self.q_acc)?,
                gap_s: need("gap_s", "inflate", self.gap_s)?,
            }),
            "reacquire" => Ok(HandoverRule::Reacquire {
                acquire_s: need("acquire_s", "reacquire", self.acquire_s)?,
                q_acc: need("q_acc", "reacquire", self.q_acc)?,
                floor_pos_m: need("floor_pos_m", "reacquire", self.floor_pos_m)?,
                floor_vel_mps: need("floor_vel_mps", "reacquire", self.floor_vel_mps)?,
                floor_time_s: need("floor_time_s", "reacquire", self.floor_time_s)?,
            }),
            other => Err(format!(
                "unknown handover rule `{other}`; expected carry, inflate or reacquire"
            )),
        }
    }
}

impl PhaseDoc {
    /// The phase as the thread uses it, with every name parsed and every number checked.
    pub fn to_spec(&self) -> Result<PhaseSpec, String> {
        let err = |e: String| format!("phase `{}`: {e}", self.id);
        if self.id.trim().is_empty() {
            return Err("a phase has an empty id".to_string());
        }
        finite_pos("duration_s", self.duration_s).map_err(err)?;
        if self.nav.is_empty() {
            return Err(err("`nav` lists no navigation source".to_string()));
        }
        let nav = self
            .nav
            .iter()
            .map(|s| NavSource::parse(s))
            .collect::<Result<Vec<_>, _>>()
            .map_err(err)?;
        let time = TimeSource::parse(&self.time).map_err(err)?;
        let frame = self
            .frame
            .as_deref()
            .map(Frame::parse)
            .transpose()
            .map_err(err)?;
        let timescale = self
            .timescale
            .as_deref()
            .map(Timescale::parse)
            .transpose()
            .map_err(err)?;
        let handover = match &self.handover {
            None => HandoverRule::Carry,
            Some(h) => h.to_rule().map_err(err)?,
        };
        let requirement = match &self.requirement {
            None => Requirement::default(),
            Some(r) => Requirement {
                max_pos_m: r.max_pos_m,
                max_vel_mps: r.max_vel_mps,
                max_time_s: r.max_time_s,
            },
        };
        for (k, v) in [
            ("max_pos_m", requirement.max_pos_m),
            ("max_vel_mps", requirement.max_vel_mps),
            ("max_time_s", requirement.max_time_s),
        ] {
            if let Some(v) = v {
                finite_pos(k, v).map_err(err)?;
            }
        }
        Ok(PhaseSpec {
            id: self.id.clone(),
            kind: self.kind.clone(),
            duration_s: self.duration_s,
            nav,
            time,
            frame,
            timescale,
            handover,
            requirement,
            model: self.model.clone(),
        })
    }
}

impl EntryDoc {
    fn to_state(&self) -> Result<NavState, String> {
        let frame = Frame::parse(&self.frame).map_err(|e| format!("entry: {e}"))?;
        let ts = Timescale::parse(&self.timescale).map_err(|e| format!("entry: {e}"))?;
        for (k, v) in [
            ("sigma_pos_m", self.sigma_pos_m),
            ("sigma_vel_mps", self.sigma_vel_mps),
            ("sigma_time_s", self.sigma_time_s),
        ] {
            finite_pos(k, v).map_err(|e| format!("entry: {e}"))?;
        }
        if !(self.sigma_drift_s_per_s.is_finite() && self.sigma_drift_s_per_s >= 0.0) {
            return Err("entry: sigma_drift_s_per_s must be a finite number of at least 0".into());
        }
        if self.x.iter().any(|v| !v.is_finite()) {
            return Err("entry: x must hold six finite numbers".into());
        }
        Ok(NavState::diagonal(
            0.0,
            frame,
            self.x,
            self.sigma_pos_m,
            self.sigma_vel_mps,
            ts,
            self.sigma_time_s,
            self.sigma_drift_s_per_s,
        ))
    }
}

/// One phase after it ran.
#[derive(Clone, Debug)]
pub struct PhaseResult {
    /// Position in the thread.
    pub index: usize,
    /// The phase as stated.
    pub spec: PhaseSpec,
    /// Mission elapsed time at phase entry, seconds.
    pub start_s: f64,
    /// Mission elapsed time at phase exit, seconds.
    pub end_s: f64,
    /// What the phase returned; its budget includes the handover and conversion lines.
    pub outcome: PhaseOutcome,
    /// Limit over peak, when the phase states a requirement.
    pub margin: Option<f64>,
}

/// A whole thread after it ran.
#[derive(Clone, Debug)]
pub struct ThreadResult {
    /// The phases, in order.
    pub phases: Vec<PhaseResult>,
    /// The weakest phase label.
    pub label: EvidenceLabel,
    /// The weakest link.
    pub weakest: Option<WeakestLink>,
}

impl MissionThreadScenario {
    /// Parses a thread document.
    pub fn parse(src: &str) -> Result<Self, String> {
        let s: MissionThreadScenario =
            toml::from_str(src).map_err(|e| format!("mission-thread: {e}"))?;
        if let Some(k) = &s.kind {
            if k != "mission-thread" {
                return Err(format!("kind must be \"mission-thread\", got \"{k}\""));
            }
        }
        if s.phases.is_empty() {
            return Err("a mission thread needs at least one [[phase]]".to_string());
        }
        let mut seen = BTreeSet::new();
        for p in &s.phases {
            if !seen.insert(p.id.clone()) {
                return Err(format!("phase id `{}` is used twice; ids are unique", p.id));
            }
        }
        if let Some(net) = &s.ground_network {
            net.validate()?;
            for g in &net.phases {
                if !seen.contains(&g.phase) {
                    return Err(format!(
                        "ground_network: phase `{}` is not a phase of this thread",
                        g.phase
                    ));
                }
            }
        }
        Ok(s)
    }
}

/// Runs a thread, looking each phase kind up with `lookup`.
pub fn run_thread_with(
    scn: &MissionThreadScenario,
    lookup: &dyn Fn(&str) -> Result<PhaseKindInfo, String>,
) -> Result<ThreadResult, String> {
    let mut ctx = ThreadCtx::new(&scn.epoch_utc, scn.seed);
    if let Some(path) = &scn.moon_kernel_path {
        ctx = ctx.with_moon_kernel_file(std::path::Path::new(path))?;
    }
    // The epoch must parse before any phase runs.
    crate::interop::UtcEpoch::parse_iso(&scn.epoch_utc)?;
    let specs = scn
        .phases
        .iter()
        .map(PhaseDoc::to_spec)
        .collect::<Result<Vec<_>, _>>()?;
    let mut state = scn.entry.to_state()?;
    let mut out: Vec<PhaseResult> = Vec::new();
    let mut prev_rule = HandoverRule::Carry;
    for (i, spec) in specs.iter().enumerate() {
        let mut rows: Vec<BudgetRow> = Vec::new();
        // The previous phase's handover rule, then the conversions this phase asks for.
        if i > 0 {
            let (s, r) = apply_handover(&prev_rule, &state)
                .map_err(|e| format!("phase `{}`: {e}", specs[i - 1].id))?;
            state = s;
            rows.extend(r);
        }
        if let Some(f) = spec.frame {
            let (s, r) = ctx
                .convert_frame(&state, f)
                .map_err(|e| format!("phase `{}`: {e}", spec.id))?;
            state = s;
            rows.extend(r);
        }
        if let Some(t) = spec.timescale {
            let (s, r) = ctx
                .convert_timescale(&state, t)
                .map_err(|e| format!("phase `{}`: {e}", spec.id))?;
            state = s;
            rows.extend(r);
        }
        let info = lookup(&spec.kind).map_err(|e| format!("phase `{}`: {e}", spec.id))?;
        let phase = (info.ctor)(&spec.model).map_err(|e| format!("phase `{}`: {e}", spec.id))?;
        let start_s = state.t_s;
        let mut pctx = ctx.phase_ctx_for(i, spec);
        // The ground-network overlay: the tracking duty of a phase that lists ground tracking.
        let mut coverage_note: Option<(Vec<BudgetRow>, String)> = None;
        if let Some(net) = &scn.ground_network {
            if spec.nav.contains(&NavSource::GroundTracking) {
                if let Some(g) = net.for_phase(&spec.id) {
                    let geo_state = if state.frame == Frame::Gcrf || g.geometry == "stated" {
                        state.clone()
                    } else {
                        ctx.convert_frame(&state, Frame::Gcrf)
                            .map_err(|e| format!("phase `{}`: {e}", spec.id))?
                            .0
                    };
                    let cov = crate::mission_thread::earth::ground_network::coverage(
                        net,
                        g,
                        &ctx,
                        &geo_state,
                        spec.duration_s,
                    )
                    .map_err(|e| format!("phase `{}`: {e}", spec.id))?;
                    pctx.ground_duty = Some(cov.duty);
                    coverage_note = Some(cov.rows(net));
                }
            }
        }
        let mut o = run_phase(phase.as_ref(), &state, &ctx, &pctx)
            .map_err(|e| format!("phase `{}`: {e}", spec.id))?;
        let want_end = start_s + spec.duration_s;
        if (o.exit.t_s - want_end).abs() > 1e-6 * want_end.abs().max(1.0) {
            return Err(format!(
                "phase `{}` ended at {} s but started at {start_s} s and lasts {} s",
                spec.id, o.exit.t_s, spec.duration_s
            ));
        }
        if let Some((cov_rows, text)) = coverage_note {
            rows.extend(cov_rows);
            o.events.push(Event {
                t_s: start_s,
                what: text,
            });
        }
        rows.extend(std::mem::take(&mut o.budget.rows));
        o.budget.rows = rows;
        let m = margin(&o.budget, &spec.requirement);
        state = o.exit.clone();
        prev_rule = spec.handover;
        out.push(PhaseResult {
            index: i,
            spec: spec.clone(),
            start_s,
            end_s: o.exit.t_s,
            outcome: o,
            margin: m,
        });
    }
    let budgets: Vec<PhaseBudget> = out.iter().map(|p| p.outcome.budget.clone()).collect();
    let with_req: Vec<(PhaseBudget, Requirement)> = out
        .iter()
        .map(|p| (p.outcome.budget.clone(), p.spec.requirement))
        .collect();
    Ok(ThreadResult {
        label: thread_label(&budgets),
        weakest: weakest_link(&with_req),
        phases: out,
    })
}

/// Runs a thread through the registry.
pub fn run_thread(scn: &MissionThreadScenario) -> Result<ThreadResult, String> {
    run_thread_with(scn, &|k| phase_kind(k).copied())
}

fn label_json(l: &EvidenceLabel) -> Value {
    json!({ "tier": l.tier.name(), "row_id": l.row_id })
}

impl ThreadResult {
    /// The report document (`kshana-mission-thread/1`).
    pub fn to_json(&self, scn: &MissionThreadScenario) -> Value {
        let phases: Vec<Value> = self
            .phases
            .iter()
            .map(|p| {
                let b = &p.outcome.budget;
                json!({
                    "index": p.index,
                    "id": p.spec.id,
                    "kind": p.spec.kind,
                    "start_s": p.start_s,
                    "end_s": p.end_s,
                    "duration_s": p.spec.duration_s,
                    "label": label_json(&p.outcome.label),
                    "nav_sources": b.nav_sources.iter().map(|s| s.name()).collect::<Vec<_>>(),
                    "time_source": b.time_source.name(),
                    "limiting_source": b.limiting_source,
                    "entry_sigma_pos_m": b.entry_sigma_pos_m,
                    "entry_sigma_vel_mps": b.entry_sigma_vel_mps,
                    "entry_sigma_time_s": b.entry_sigma_time_s,
                    "peak_sigma_pos_m": b.peak_sigma_pos_m,
                    "peak_sigma_vel_mps": b.peak_sigma_vel_mps,
                    "peak_sigma_time_s": b.peak_sigma_time_s,
                    "exit_sigma_pos_m": b.exit_sigma_pos_m,
                    "exit_sigma_vel_mps": b.exit_sigma_vel_mps,
                    "exit_sigma_time_s": b.exit_sigma_time_s,
                    "requirement": {
                        "max_pos_m": p.spec.requirement.max_pos_m,
                        "max_vel_mps": p.spec.requirement.max_vel_mps,
                        "max_time_s": p.spec.requirement.max_time_s,
                    },
                    "margin": p.margin,
                    "budget_rows": b.rows.iter().map(|r| json!({
                        "source": r.source,
                        "sigma": r.sigma,
                        "unit": r.unit,
                        "label": label_json(&r.label),
                    })).collect::<Vec<_>>(),
                    "events": p.outcome.events.iter().map(|e| json!({
                        "t_s": e.t_s,
                        "what": e.what,
                    })).collect::<Vec<_>>(),
                })
            })
            .collect();
        let mut timeline = Vec::new();
        for p in &self.phases {
            for s in &p.outcome.series {
                timeline.push(json!({
                    "t_s": s.t_s,
                    "phase_index": p.index,
                    "sigma_pos_m": s.sigma_pos_m,
                    "sigma_vel_mps": s.sigma_vel_mps,
                    "sigma_time_s": s.sigma_time_s,
                }));
            }
        }
        json!({
            "schema": SCHEMA,
            "kind": "mission-thread",
            "title": scn.title,
            "seed": scn.seed,
            "epoch_utc": scn.epoch_utc,
            "label": label_json(&self.label),
            "weakest_link": self.weakest.as_ref().map(|w| json!({
                "phase_id": w.phase_id,
                "limiting_source": w.limiting_source,
                "margin": w.margin,
                "basis": match w.basis {
                    super::budget::WeakestBasis::SmallestMargin => "smallest margin against a stated requirement",
                    super::budget::WeakestBasis::LargestPeakPosition => "largest peak position sigma (no requirement stated)",
                },
            })),
            "phases": phases,
            "timeline": timeline,
            "units": units(),
            "notice": "MODELLED navigation and timing error budget for a stated chain of phases; \
                       public sources only; not affiliated with or endorsed by any agency; \
                       advisory software, nothing is transmitted and no hardware is driven.",
        })
    }

    /// The one-line summary printed by the command line.
    pub fn summary(&self, scn: &MissionThreadScenario) -> String {
        let weak = match &self.weakest {
            Some(w) => format!("weakest link {}", w.phase_id),
            None => "no phases".to_string(),
        };
        format!(
            "mission-thread | {} phases | {} | {} | {}",
            self.phases.len(),
            scn.title.clone().unwrap_or_else(|| "untitled".to_string()),
            weak,
            self.label.tier.name()
        )
    }
}

impl MissionThreadScenario {
    /// Runs the thread and returns the report as pretty JSON and the one-line summary, with the
    /// timeline figure next to them through [`ThreadResult::svg`].
    pub fn run_json(&self) -> Result<(String, String, String), String> {
        let r = run_thread(self)?;
        let json = serde_json::to_string_pretty(&r.to_json(self)).map_err(|e| e.to_string())?;
        let svg = r.svg(self.title.as_deref().unwrap_or("Mission thread"));
        Ok((json, r.summary(self), svg))
    }
}

/// The `units` block of the report: every numeric field with its unit and where it came from.
fn units() -> Value {
    const ROWS: &[(&str, &str, &str, &str)] = &[
        ("seed", "1", "input", "the thread seed; each phase's seed is derived from it and the phase id"),
        ("weakest_link.margin", "1", "computed", "limit over peak position, velocity or time of the weakest phase: above 1 meets the stated requirement"),
        ("phases[].index", "1", "computed", "zero-based position of the phase in the thread"),
        ("phases[].start_s", "s", "computed", "mission elapsed time at phase entry"),
        ("phases[].end_s", "s", "computed", "mission elapsed time at phase exit"),
        ("phases[].duration_s", "s", "input", "phase length as the document states it"),
        ("phases[].entry_sigma_pos_m", "m", "modelled", "1-sigma position at phase entry, after the handover and conversions"),
        ("phases[].entry_sigma_vel_mps", "m/s", "modelled", "1-sigma velocity at phase entry"),
        ("phases[].entry_sigma_time_s", "s", "modelled", "1-sigma clock bias at phase entry"),
        ("phases[].peak_sigma_pos_m", "m", "modelled", "largest 1-sigma position over the phase"),
        ("phases[].peak_sigma_vel_mps", "m/s", "modelled", "largest 1-sigma velocity over the phase"),
        ("phases[].peak_sigma_time_s", "s", "modelled", "largest 1-sigma clock bias over the phase"),
        ("phases[].exit_sigma_pos_m", "m", "modelled", "1-sigma position at phase exit"),
        ("phases[].exit_sigma_vel_mps", "m/s", "modelled", "1-sigma velocity at phase exit"),
        ("phases[].exit_sigma_time_s", "s", "modelled", "1-sigma clock bias at phase exit"),
        ("phases[].requirement.max_pos_m", "m", "input", "the position limit the phase must meet, when stated"),
        ("phases[].requirement.max_vel_mps", "m/s", "input", "the velocity limit the phase must meet, when stated"),
        ("phases[].requirement.max_time_s", "s", "input", "the time limit the phase must meet, when stated"),
        ("phases[].margin", "1", "computed", "smallest ratio of a stated limit to the phase's peak: above 1 meets the requirement"),
        ("phases[].budget_rows[].sigma", "see the sibling `unit` field", "modelled", "1-sigma of one budget line; the row's `unit` field gives its unit (m, m/s, s or deg)"),
        ("phases[].events[].t_s", "s", "computed", "mission elapsed time of the event"),
        ("timeline[].t_s", "s", "computed", "mission elapsed time of the sample"),
        ("timeline[].phase_index", "1", "computed", "index of the phase the sample belongs to"),
        ("timeline[].sigma_pos_m", "m", "modelled", "1-sigma position at the sample"),
        ("timeline[].sigma_vel_mps", "m/s", "modelled", "1-sigma velocity at the sample"),
        ("timeline[].sigma_time_s", "s", "modelled", "1-sigma clock bias at the sample"),
    ];
    let mut m = serde_json::Map::new();
    for (k, unit, prov, note) in ROWS {
        m.insert(
            (*k).to_string(),
            json!({ "unit": unit, "provenance": prov, "note": note }),
        );
    }
    Value::Object(m)
}

use crate::chart::{esc, frame_open, panel_axes};
use crate::palette::chart::{AXIS, FONT_MONO, MUTED, SERIES, TEXT};

/// Log-axis position of `v` between `lo` and `hi` (both positive) as a fraction of the height.
fn log_frac(v: f64, lo: f64, hi: f64) -> f64 {
    let v = v.max(lo);
    ((v.ln() - lo.ln()) / (hi.ln() - lo.ln())).clamp(0.0, 1.0)
}

fn nice_bounds(values: &[f64]) -> (f64, f64) {
    let pos: Vec<f64> = values
        .iter()
        .copied()
        .filter(|v| v.is_finite() && *v > 0.0)
        .collect();
    if pos.is_empty() {
        return (1.0, 10.0);
    }
    let lo = pos.iter().copied().fold(f64::INFINITY, f64::min);
    let hi = pos.iter().copied().fold(0.0, f64::max);
    let lo = 10f64.powf(lo.log10().floor());
    let mut hi = 10f64.powf(hi.log10().ceil());
    if hi <= lo {
        hi = lo * 10.0;
    }
    (lo, hi)
}

fn fmt_dur(s: f64) -> String {
    if s >= 86_400.0 {
        format!("{:.1} d", s / 86_400.0)
    } else if s >= 3_600.0 {
        format!("{:.1} h", s / 3_600.0)
    } else if s >= 60.0 {
        format!("{:.0} min", s / 60.0)
    } else {
        format!("{s:.0} s")
    }
}

impl ThreadResult {
    /// The timeline figure: 1-sigma position and 1-sigma time against mission time, one band per
    /// phase of equal width (the durations are in the labels), log axes, each band labelled with
    /// the phase id, kind, duration and evidence label.
    pub fn svg(&self, title: &str) -> String {
        let n = self.phases.len().max(1);
        let (w, h) = (960.0_f64, 560.0_f64);
        let (ml, mr) = (64.0, 24.0);
        let pw = w - ml - mr;
        let band = pw / n as f64;
        let panels = [
            (96.0, 288.0, "1-sigma position, m"),
            (336.0, 528.0, "1-sigma time, s"),
        ];
        let pos_vals: Vec<f64> = self
            .phases
            .iter()
            .flat_map(|p| p.outcome.series.iter().map(|s| s.sigma_pos_m))
            .collect();
        let time_vals: Vec<f64> = self
            .phases
            .iter()
            .flat_map(|p| p.outcome.series.iter().map(|s| s.sigma_time_s))
            .collect();
        let bounds = [nice_bounds(&pos_vals), nice_bounds(&time_vals)];
        let mut s = frame_open(
            w,
            h,
            title,
            "MODELLED navigation and timing error budget; each phase drawn at equal width",
        );
        for (k, (top, bottom, caption)) in panels.iter().enumerate() {
            s.push_str(&panel_axes(ml, *top, pw, *bottom, caption));
            let (lo, hi) = bounds[k];
            let ph = bottom - top;
            // Decade gridlines and labels.
            let mut d = lo.log10().round() as i32;
            while 10f64.powi(d) <= hi * 1.0001 {
                let y = bottom - log_frac(10f64.powi(d), lo, hi) * ph;
                s.push_str(&format!(
                    "<line x1=\"{ml:.0}\" y1=\"{y:.1}\" x2=\"{:.0}\" y2=\"{y:.1}\" stroke=\"{AXIS}\" stroke-opacity=\"0.35\"/>\
                     <text x=\"{:.0}\" y=\"{:.1}\" text-anchor=\"end\" font-size=\"10\" fill=\"{MUTED}\" font-family=\"{FONT_MONO}\">1e{d}</text>",
                    ml + pw,
                    ml - 6.0,
                    y + 3.0
                ));
                d += 1;
            }
            for (i, p) in self.phases.iter().enumerate() {
                let x0 = ml + i as f64 * band;
                let col = SERIES[i % SERIES.len()];
                s.push_str(&format!(
                    "<rect x=\"{x0:.1}\" y=\"{top:.0}\" width=\"{band:.1}\" height=\"{ph:.0}\" fill=\"{col}\" fill-opacity=\"0.07\"/>"
                ));
                let span = (p.end_s - p.start_s).max(1e-9);
                let mut pts = String::new();
                for smp in &p.outcome.series {
                    let v = if k == 0 {
                        smp.sigma_pos_m
                    } else {
                        smp.sigma_time_s
                    };
                    let x = x0 + ((smp.t_s - p.start_s) / span).clamp(0.0, 1.0) * band;
                    let y = bottom - log_frac(v, lo, hi) * ph;
                    pts.push_str(&format!("{x:.1},{y:.1} "));
                }
                if !pts.is_empty() {
                    s.push_str(&format!(
                        "<polyline fill=\"none\" stroke=\"{col}\" stroke-width=\"1.6\" points=\"{}\"/>",
                        pts.trim_end()
                    ));
                }
                if k == 0 {
                    s.push_str(&format!(
                        "<text x=\"{:.1}\" y=\"{:.0}\" text-anchor=\"middle\" font-size=\"10\" fill=\"{TEXT}\">{}</text>\
                         <text x=\"{:.1}\" y=\"{:.0}\" text-anchor=\"middle\" font-size=\"9\" fill=\"{MUTED}\">{} · {} · {}</text>",
                        x0 + band / 2.0,
                        top - 22.0,
                        esc(&p.spec.id),
                        x0 + band / 2.0,
                        top - 10.0,
                        esc(&p.spec.kind),
                        fmt_dur(p.spec.duration_s),
                        p.outcome.label.tier.name()
                    ));
                }
            }
        }
        s.push_str("</svg>");
        s
    }
}

#[cfg(test)]
mod tests {
    use super::*;
    use crate::mission_thread::budget::PhaseBudget;
    use crate::mission_thread::phase::{Event, Sample};
    use crate::mission_thread::{MissionPhase, PhaseCtx};

    /// A phase of the test's own: it ends `exit_pos_m` of position sigma after a peak of
    /// `peak_pos_m`, and advances the clock by the thread's duration.
    struct Mock {
        peak: f64,
        exit: f64,
        label: &'static str,
        advance: bool,
    }

    impl MissionPhase for Mock {
        fn kind(&self) -> &'static str {
            "mock"
        }
        fn run(
            &self,
            entry: &NavState,
            _ctx: &ThreadCtx,
            phase: &PhaseCtx,
        ) -> Result<PhaseOutcome, String> {
            let mut exit = entry.clone();
            if self.advance {
                exit.t_s += phase.duration_s;
            }
            let per_axis = self.exit / 3f64.sqrt();
            for i in 0..3 {
                exit.p[i][i] = per_axis * per_axis;
            }
            let b = PhaseBudget {
                phase_id: "set by the phase".into(),
                kind: "mock".into(),
                entry_sigma_pos_m: entry.sigma_pos_m(),
                entry_sigma_vel_mps: entry.sigma_vel_mps(),
                entry_sigma_time_s: entry.sigma_time_s(),
                exit_sigma_pos_m: exit.sigma_pos_m(),
                exit_sigma_vel_mps: exit.sigma_vel_mps(),
                exit_sigma_time_s: exit.sigma_time_s(),
                peak_sigma_pos_m: self.peak,
                peak_sigma_vel_mps: entry.sigma_vel_mps(),
                peak_sigma_time_s: entry.sigma_time_s(),
                nav_sources: vec![NavSource::Gnss],
                time_source: TimeSource::Gnss,
                limiting_source: Some("gnss".into()),
                rows: vec![BudgetRow {
                    source: "mock source".into(),
                    sigma: self.peak,
                    unit: "m".into(),
                    label: EvidenceLabel::modelled(),
                }],
                label: if self.label == "validated" {
                    EvidenceLabel::validated("row-x")
                } else {
                    EvidenceLabel::modelled()
                },
            };
            Ok(PhaseOutcome {
                series: vec![
                    Sample {
                        t_s: entry.t_s,
                        sigma_pos_m: entry.sigma_pos_m(),
                        sigma_vel_mps: entry.sigma_vel_mps(),
                        sigma_time_s: entry.sigma_time_s(),
                    },
                    Sample {
                        t_s: exit.t_s,
                        sigma_pos_m: exit.sigma_pos_m(),
                        sigma_vel_mps: exit.sigma_vel_mps(),
                        sigma_time_s: exit.sigma_time_s(),
                    },
                ],
                events: vec![Event {
                    t_s: entry.t_s,
                    what: "start".into(),
                }],
                exit,
                budget: b,
                label: b_label(self.label),
            })
        }
    }

    fn b_label(l: &str) -> EvidenceLabel {
        if l == "validated" {
            EvidenceLabel::validated("row-x")
        } else {
            EvidenceLabel::modelled()
        }
    }

    fn num(t: &toml::Table, k: &str) -> f64 {
        t.get(k)
            .and_then(|v| v.as_float().or_else(|| v.as_integer().map(|i| i as f64)))
            .unwrap_or(1.0)
    }

    fn mock_ctor(t: &toml::Table) -> Result<Box<dyn MissionPhase>, String> {
        Ok(Box::new(Mock {
            peak: num(t, "peak_pos_m"),
            exit: num(t, "exit_pos_m"),
            label: if t.get("label").and_then(|v| v.as_str()) == Some("validated") {
                "validated"
            } else {
                "modelled"
            },
            advance: t.get("stall").and_then(|v| v.as_bool()) != Some(true),
        }))
    }

    fn lookup(k: &str) -> Result<PhaseKindInfo, String> {
        if k == "mock" {
            Ok(PhaseKindInfo {
                kind: "mock",
                segment: "earth",
                ctor: mock_ctor,
                implemented: true,
            })
        } else {
            phase_kind(k).copied()
        }
    }

    const DOC: &str = r#"
kind = "mission-thread"
title = "test thread"
seed = 7
epoch_utc = "2028-03-01T00:00:00Z"

[entry]
frame = "gcrf"
x = [7.0e6, 0.0, 0.0, 0.0, 7.5e3, 0.0]
sigma_pos_m = 10.0
sigma_vel_mps = 0.1
timescale = "tt"
sigma_time_s = 1.0e-7

[[phase]]
id = "first"
kind = "mock"
duration_s = 600.0
nav = ["gnss"]
time = "gnss"
[phase.handover]
rule = "inflate"
q_acc = 1.0e-6
gap_s = 60.0
[phase.requirement]
max_pos_m = 50.0
[phase.model]
peak_pos_m = 12.0
exit_pos_m = 12.0

[[phase]]
id = "second"
kind = "mock"
duration_s = 3600.0
nav = ["gnss"]
time = "gnss"
frame = "mci"
[phase.requirement]
max_pos_m = 400000.0
[phase.model]
peak_pos_m = 300000.0
exit_pos_m = 250000.0
label = "validated"
"#;

    #[test]
    fn a_thread_runs_hands_over_converts_and_names_the_weakest_link() {
        let scn = MissionThreadScenario::parse(DOC).unwrap();
        let r = run_thread_with(&scn, &lookup).unwrap();
        assert_eq!(r.phases.len(), 2);
        // The budget carries the document's id, not the one the phase wrote.
        assert_eq!(r.phases[0].outcome.budget.phase_id, "first");
        assert_eq!(r.phases[1].outcome.budget.phase_id, "second");
        // The inflate handover costs 60 s of mission time and widens the covariance.
        assert!((r.phases[1].start_s - (600.0 + 60.0)).abs() < 1e-9);
        let b1 = &r.phases[1].outcome.budget;
        assert!(b1.entry_sigma_pos_m > r.phases[0].outcome.budget.exit_sigma_pos_m);
        // Its rows: the handover lines, the frame conversion lines, then the phase's own.
        let sources: Vec<&str> = b1.rows.iter().map(|x| x.source.as_str()).collect();
        assert!(sources[0].starts_with("handover: inflate"), "{sources:?}");
        assert!(sources
            .iter()
            .any(|s| s.starts_with("conversion: GCRF -> MCI")));
        assert_eq!(*sources.last().unwrap(), "mock source");
        // The weakest link is the smallest margin: 50/12 for the first, 400000/300000 for the second.
        let w = r.weakest.clone().unwrap();
        assert_eq!(w.phase_id, "second");
        assert!((w.margin.unwrap() - 400_000.0 / 300_000.0).abs() < 1e-9);
        // The thread label is the weakest phase label.
        assert_eq!(r.label.tier.name(), "MODELLED");
        // The report.
        let j = r.to_json(&scn);
        assert_eq!(j["schema"], SCHEMA);
        assert_eq!(j["phases"][1]["id"], "second");
        assert_eq!(j["weakest_link"]["phase_id"], "second");
        assert_eq!(j["timeline"].as_array().unwrap().len(), 4);
        let svg = r.svg("test");
        assert!(svg.starts_with("<svg") && svg.ends_with("</svg>"));
        assert!(svg.contains("first") && svg.contains("second") && svg.contains("MODELLED"));
        assert!(r.summary(&scn).contains("weakest link second"));
    }

    #[test]
    fn a_phase_that_does_not_end_when_it_should_is_an_error() {
        let doc = DOC.replace("peak_pos_m = 12.0", "peak_pos_m = 12.0\nstall = true");
        let scn = MissionThreadScenario::parse(&doc).unwrap();
        let e = run_thread_with(&scn, &lookup).unwrap_err();
        assert!(e.contains("phase `first`") && e.contains("ended at"), "{e}");
    }

    #[test]
    fn bad_documents_fail_with_the_reason() {
        let e = MissionThreadScenario::parse(&DOC.replace("id = \"second\"", "id = \"first\""))
            .unwrap_err();
        assert!(e.contains("used twice"), "{e}");
        let e = MissionThreadScenario::parse("kind = \"mission-thread\"\nepoch_utc = \"2028-03-01T00:00:00Z\"\n[entry]\nframe=\"gcrf\"\nx=[0,0,0,0,0,0]\nsigma_pos_m=1\nsigma_vel_mps=1\ntimescale=\"tt\"\nsigma_time_s=1\n").unwrap_err();
        assert!(e.contains("phase"), "{e}");
        let e = MissionThreadScenario::parse(&DOC.replace("seed = 7", "seed = 7\nsurprise = 1"))
            .unwrap_err();
        assert!(e.contains("surprise"), "{e}");
        let scn =
            MissionThreadScenario::parse(&DOC.replace("rule = \"inflate\"", "rule = \"reset\""))
                .unwrap();
        let e = run_thread_with(&scn, &lookup).unwrap_err();
        assert!(e.contains("unknown handover rule"), "{e}");
        let scn = MissionThreadScenario::parse(&DOC.replace("gap_s = 60.0\n", "")).unwrap();
        let e = run_thread_with(&scn, &lookup).unwrap_err();
        assert!(e.contains("needs `gap_s`"), "{e}");
        let scn =
            MissionThreadScenario::parse(&DOC.replace("nav = [\"gnss\"]", "nav = [\"magic\"]"))
                .unwrap();
        let e = run_thread_with(&scn, &lookup).unwrap_err();
        assert!(e.contains("unknown navigation source"), "{e}");
        let scn = MissionThreadScenario::parse(&DOC.replace("kind = \"mock\"", "kind = \"nope\""))
            .unwrap();
        let e = run_thread_with(&scn, &lookup).unwrap_err();
        assert!(
            e.contains("unknown phase kind") && e.contains("launch-ascent"),
            "{e}"
        );
    }

    #[test]
    fn a_phase_whose_model_the_kind_refuses_stops_the_thread_naming_the_phase() {
        let scn = MissionThreadScenario::parse(&DOC.replace("kind = \"mock\"", "kind = \"entry\""))
            .unwrap();
        let e = run_thread(&scn).unwrap_err();
        assert!(
            e.contains("phase `first`") && e.contains("unknown model key"),
            "{e}"
        );
    }

    #[test]
    fn the_overlay_sets_the_tracking_duty_of_a_phase_that_lists_ground_tracking() {
        let src = r#"
epoch_utc = "2028-01-10T00:00:00Z"
seed = 5
[ground_network]
min_elevation_deg = 10.0
handover_gap_s = 60.0
[[ground_network.stations]]
id = "west"
lat_deg = 35.4
lon_deg = -116.9
[[ground_network.stations]]
id = "east"
lat_deg = -35.4
lon_deg = 148.98
[[ground_network.phases]]
phase = "cruise"
geometry = "moon-direction"
[entry]
frame = "gcrf"
x = [6563137.0, 0.0, 0.0, 0.0, 7790.0, 0.0]
sigma_pos_m = 10.0
sigma_vel_mps = 0.01
timescale = "utc"
sigma_time_s = 1e-7
sigma_drift_s_per_s = 1e-12
[[phase]]
id = "cruise"
kind = "tli-and-cruise"
duration_s = 14400.0
nav = ["ground-tracking"]
time = "onboard-holdover"
[phase.model]
tli_dv_mps = 3130.0
tli_dv_sigma_fraction = 0.001
tli_pointing_sigma_rad = 0.001
step_s = 3600.0
clock_q_f = 1e-22
clock_q_d = 1e-30
ground_range_sigma_m = 10.0
ground_range_rate_sigma_mps = 0.001
ground_interval_s = 3600.0
"#;
        let scn = MissionThreadScenario::parse(src).unwrap();
        let r = run_thread(&scn).unwrap();
        let p = &r.phases[0].outcome;
        assert!(p
            .budget
            .rows
            .iter()
            .any(|b| b.source.starts_with("ground network (2 stations")));
        assert!(p
            .events
            .iter()
            .any(|e| e.what.starts_with("ground network: tracking duty")));
        // An overlay naming a phase the thread does not have is refused.
        let bad = src.replace("phase = \"cruise\"\ngeometry", "phase = \"nope\"\ngeometry");
        assert!(MissionThreadScenario::parse(&bad)
            .err()
            .unwrap()
            .contains("not a phase of this thread"));
    }
}
