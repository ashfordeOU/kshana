// SPDX-License-Identifier: AGPL-3.0-only
//! Jammertest as a referee: the published test catalogue and transmission plan read as
//! scheduled truth ([`plan`]), and a receiver log scored against that schedule ([`score`]).
//!
//! The functions here take bytes and return values, with no file system and no clock, so the
//! command line ([`cli`]), Python, WebAssembly and the MCP server share them. The scores are
//! MODELLED: the schedule says when a test was planned, not when a transmitter was on.

pub mod cli;
pub mod dataset;
pub mod plan;
pub mod score;

use crate::evidence::{build_receiver_trust_pack_with, PackRequest, PackSummary};
use crate::receiver_trust::ingest::read_log;
use crate::receiver_trust::scenario::{run_receiver_trust_bytes, ReceiverTrustScenario};
use crate::telemetry::time::parse_rfc3339_utc;
use plan::{import, import_attack_log, parse_catalog, parse_plan, ImportOptions, Imported};
use score::{score_run, ScoreOptions, Scorecard};

/// The source of the scheduled tests.
pub enum Schedule<'a> {
    /// The published NPRA catalogue and transmission plan.
    Plan {
        /// The catalogue JSON.
        catalog_json: &'a str,
        /// The transmission-plan JSON files (one per day).
        plan_jsons: &'a [&'a str],
        /// Test area the log was recorded in.
        location: Option<u32>,
        /// Offset of the plan's wall-clock times from UTC, hours (CEST: 2).
        local_offset_h: f64,
        /// Edition year, when it is not to be read from the plan dates.
        year: Option<u32>,
    },
    /// The `attack_log` of a JammerTest 2024 dataset folder's `scenario.json`.
    AttackLog {
        /// The `scenario.json` text.
        scenario_json: &'a str,
        /// Seconds added to its time stamps (the dataset's `Z` stamps are local time: -7200).
        shift_s: f64,
    },
}

/// What to score a log against.
pub struct ScoreRequest<'a> {
    /// The receiver-trust scenario (monitor and comparison rules). Its `[log]` source is not read
    /// and any `[[events]]` it has are replaced by the imported schedule.
    pub scenario: &'a ReceiverTrustScenario,
    /// The log's bytes.
    pub log_bytes: &'a [u8],
    /// Where the scheduled tests come from.
    pub schedule: Schedule<'a>,
    /// The log's first epoch as UTC seconds since 1970, when the log does not state it.
    pub log_start_utc: Option<f64>,
    /// The scoring rules.
    pub options: ScoreOptions,
}

/// A scored log.
pub struct ScoreOutput {
    /// The score.
    pub scorecard: Scorecard,
    /// The schedule that was imported.
    pub imported: Imported,
    /// The scenario as run, with the schedule as its events.
    pub scenario: ReceiverTrustScenario,
    /// The log's first epoch, UTC seconds since 1970.
    pub log_start_utc: f64,
    /// The log's duration, s.
    pub duration_s: f64,
}

/// Import the schedule for a log and score it.
pub fn score_log(req: &ScoreRequest<'_>) -> Result<ScoreOutput, String> {
    let timeline = read_log(req.scenario.log.format, req.log_bytes)?;
    let log_start_utc = match (req.log_start_utc, timeline.start_label.as_deref()) {
        (Some(t), _) => t,
        (None, Some(l)) => parse_rfc3339_utc(l).ok_or_else(|| {
            format!("the log states its start as `{l}`, which is not UTC ISO-8601: give the start explicitly")
        })?,
        (None, None) => return Err("the log does not state its start time: give it explicitly".into()),
    };
    let duration_s = timeline.epochs.last().map_or(0.0, |e| e.t_s);
    let imported = match &req.schedule {
        Schedule::Plan {
            catalog_json,
            plan_jsons,
            location,
            local_offset_h,
            year,
        } => {
            let catalog = parse_catalog(catalog_json)?;
            let mut slots = Vec::new();
            for p in *plan_jsons {
                slots.extend(parse_plan(p, *local_offset_h)?);
            }
            import(
                &slots,
                &catalog,
                &ImportOptions {
                    location: *location,
                    log_start_utc,
                    log_duration_s: Some(duration_s),
                    year: *year,
                },
            )?
        }
        Schedule::AttackLog {
            scenario_json,
            shift_s,
        } => import_attack_log(scenario_json, *shift_s, log_start_utc, Some(duration_s))?,
    };
    let mut scenario = req.scenario.clone();
    scenario.events = imported.events.iter().map(|e| e.event.clone()).collect();
    let result = run_receiver_trust_bytes(&scenario, req.log_bytes, None)?;
    let scorecard = score_run(&result, &imported.events, &req.options)?;
    Ok(ScoreOutput {
        scorecard,
        imported,
        scenario,
        log_start_utc,
        duration_s,
    })
}

/// Score a log and put the scorecard, the schedule and every threshold in a signed evidence pack
/// (the `receiver-trust evidence` pack, with the scorecard inside `config.json`).
pub fn score_pack(
    req: &ScoreRequest<'_>,
    log_file_name: &str,
    title: &str,
    created_utc: Option<&str>,
    seed: &[u8; 32],
) -> Result<(ScoreOutput, PackSummary), String> {
    let out = score_log(req)?;
    let to = out.duration_s.to_string();
    let card = serde_json::to_value(&out.scorecard).map_err(|e| e.to_string())?;
    let schedule: Vec<serde_json::Value> = out
        .imported
        .events
        .iter()
        .map(|e| {
            serde_json::json!({
                "test_id": e.test_id, "year": e.year, "location_id": e.location_id,
                "label": e.event.label, "onset_s": e.event.onset_s, "end_s": e.event.end_s,
                "plan_status": e.status,
            })
        })
        .collect();
    let pack = build_receiver_trust_pack_with(
        &PackRequest {
            scenario: &out.scenario,
            log_bytes: req.log_bytes,
            nav_bytes: None,
            log_file_name,
            from: "0",
            to: &to,
            title,
            created_utc,
        },
        seed,
        None,
        &[
            ("jammertest_score", card),
            ("jammertest_schedule", serde_json::Value::Array(schedule)),
        ],
    )?;
    Ok((out, pack))
}
