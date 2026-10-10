// SPDX-License-Identifier: AGPL-3.0-only
//! **Compliance report: which public-framework rows a set of Kshana runs supports evidence
//! for, and which it does not.**
//!
//! [`mapping`] is the static table (framework row → paraphrased ask → Kshana capability →
//! gap). [`assess`] fills it from the runs actually given: a row is `evidenced` when every
//! capability it names has at least one run in the set, `partly-evidenced` when some do,
//! `not-evidenced` when none do, and `out-of-scope` when no Kshana output speaks to the row
//! at all. Nothing is inferred from a run beyond its kind and what its result document
//! carries, and the report states that.
//!
//! ## What the statuses mean
//!
//! A status says a run in the set **supports evidence for** a row's capabilities. It is not a
//! finding that the framework is met or that any person or body has rated or approved a
//! product. Every report carries that sentence, and the standing gap of
//! every row stays in the output even when its status is `evidenced`.
//!
//! ## Which kind a result is
//!
//! A result JSON does not name its scenario kind, so [`load_runs`] takes it from the
//! scenario file next to it (`foo.result.json` beside `foo.toml`, the layout `kshana`
//! writes), recognises a `receiver-trust` result by its content, and otherwise accepts a
//! top-level `kind` string. A result whose kind cannot be found is listed as unrecognised
//! and counts for nothing.

pub mod mapping;

use mapping::{Capability, Framework, CAPABILITIES};
use serde::Serialize;
use serde_json::{json, Value};

/// One run in the set: a label (usually the file name), its scenario kind, its result.
#[derive(Clone, Debug)]
pub struct Run {
    /// Label shown in the report.
    pub label: String,
    /// Scenario kind (`receiver-trust` for a receiver-trust result).
    pub kind: String,
    /// The result document.
    pub json: Value,
}

/// How well a row's capabilities are evidenced by the set.
#[derive(Clone, Copy, Debug, PartialEq, Eq, Serialize)]
#[serde(rename_all = "kebab-case")]
pub enum Status {
    /// Every capability the row names has a run in the set.
    Evidenced,
    /// Some do.
    PartlyEvidenced,
    /// None do.
    NotEvidenced,
    /// No Kshana output speaks to the row.
    OutOfScope,
}

impl Status {
    /// The kebab-case name used in JSON and Markdown.
    pub fn as_str(self) -> &'static str {
        match self {
            Status::Evidenced => "evidenced",
            Status::PartlyEvidenced => "partly-evidenced",
            Status::NotEvidenced => "not-evidenced",
            Status::OutOfScope => "out-of-scope",
        }
    }
}

/// The statement every report carries.
pub const STATEMENT: &str =
    "A row marked evidenced means a run in this set supports evidence for the capabilities the \
     row names. It is not a finding that a framework is met, and it does not mean any product \
     has been rated or approved by anyone. The gap column states what the runs do not show.";

/// What one capability has from the set.
#[derive(Clone, Debug, Serialize)]
pub struct CapabilityEvidence {
    /// Capability id.
    pub id: String,
    /// Name.
    pub name: String,
    /// What its output is.
    pub output: String,
    /// Labels of the runs that carry it.
    pub runs: Vec<String>,
}

/// One filled row.
#[derive(Clone, Debug, Serialize)]
pub struct RowReport {
    /// Row id.
    pub id: String,
    /// Framework id.
    pub framework: String,
    /// Clause or section reference.
    pub reference: String,
    /// What it asks, paraphrased.
    pub asks: String,
    /// Status.
    pub status: Status,
    /// Capability ids the row names that the set evidences.
    pub evidenced_capabilities: Vec<String>,
    /// Capability ids the row names that the set does not evidence.
    pub missing_capabilities: Vec<String>,
    /// The standing gap.
    pub gap: String,
}

/// Facts read from a receiver-trust result, reported as the run states them.
#[derive(Clone, Debug, Serialize, PartialEq)]
pub struct ReceiverTrustFacts {
    /// Run label.
    pub run: String,
    /// Log format.
    pub log_format: String,
    /// Epochs in the log.
    pub epochs: u64,
    /// Events that could be scored.
    pub events_evaluable: u64,
    /// Of those, detected within the stated tolerance.
    pub events_detected: u64,
    /// Predictions that could be scored.
    pub predictions_evaluable: u64,
    /// Of those, agreeing within the stated tolerance.
    pub predictions_agreeing: u64,
}

/// A run that was read.
#[derive(Clone, Debug, Serialize)]
pub struct RunRef {
    /// Label.
    pub label: String,
    /// Kind.
    pub kind: String,
    /// The result's `scenario_hash`, when it carries one.
    pub scenario_hash: Option<String>,
}

/// The filled mapping.
#[derive(Clone, Debug, Serialize)]
pub struct Report {
    /// The wording rule, repeated in every report.
    pub statement: String,
    /// Engine version that wrote the report.
    pub engine_version: String,
    /// Runs read.
    pub runs: Vec<RunRef>,
    /// Inputs that could not be used, with the reason.
    pub unrecognised: Vec<String>,
    /// Evidence per capability.
    pub capabilities: Vec<CapabilityEvidence>,
    /// Receiver-trust facts, one per receiver-trust run.
    pub receiver_trust: Vec<ReceiverTrustFacts>,
    /// Every row, filled.
    pub rows: Vec<RowReport>,
}

fn is_receiver_trust(v: &Value) -> bool {
    v.get("log").map(Value::is_object).unwrap_or(false)
        && v.get("monitors_run").is_some()
        && v.get("events_evaluable").is_some()
}

/// The result's `scenario_hash`, when it is a hex string (what the engine writes). Anything
/// else is not a hash and is not reported as one.
fn hash_of(v: &Value) -> Option<String> {
    v.get("scenario_hash")
        .and_then(Value::as_str)
        .filter(|h| (8..=128).contains(&h.len()) && h.chars().all(|c| c.is_ascii_hexdigit()))
        .map(str::to_string)
}

/// A value that says something: not null, and not an empty string, array or object.
fn present(v: &Value) -> bool {
    match v {
        Value::Null => false,
        Value::String(s) => !s.is_empty(),
        Value::Array(a) => !a.is_empty(),
        Value::Object(o) => !o.is_empty(),
        _ => true,
    }
}

/// Whether a run carries a capability. A run counts only when its kind is one of the
/// capability's kinds **and** its result carries that kind's required fields
/// ([`mapping::required_fields`]): a kind label alone is not evidence. `run-provenance` counts
/// any run whose result carries a hex `scenario_hash`; `receiver-log-trust` additionally needs
/// a log with at least one epoch.
fn run_carries(c: &Capability, r: &Run) -> bool {
    let Some(obj) = r.json.as_object() else {
        return false;
    };
    if obj.is_empty() {
        return false;
    }
    if c.id == "run-provenance" {
        return hash_of(&r.json).is_some();
    }
    if !c.kinds.contains(&r.kind.as_str()) {
        return false;
    }
    let fields_ok = mapping::required_fields(&r.kind)
        .map(|fs| {
            fs.iter()
                .all(|p| r.json.pointer(p).map(present).unwrap_or(false))
        })
        .unwrap_or(false);
    if c.id == "receiver-log-trust" {
        return fields_ok
            && r.json
                .pointer("/log/epochs")
                .and_then(Value::as_u64)
                .unwrap_or(0)
                > 0;
    }
    fields_ok
}

/// Why a receiver-trust result's counts cannot be reported as facts, if they cannot: a count
/// that is not a non-negative integer, or a detected or agreeing count above its evaluable one.
fn malformed_counts(r: &Run) -> Option<String> {
    if r.kind != "receiver-trust" {
        return None;
    }
    let get = |p: &str| -> Result<u64, String> {
        match r.json.get(p) {
            Some(v) => v
                .as_u64()
                .ok_or_else(|| format!("`{p}` is not a non-negative integer")),
            None => Err(format!("`{p}` is missing")),
        }
    };
    let counts = (|| {
        Ok::<_, String>((
            get("events_evaluable")?,
            get("events_detected")?,
            get("predictions_evaluable")?,
            get("predictions_agreeing")?,
        ))
    })();
    match counts {
        Err(e) => Some(e),
        Ok((ee, ed, _, _)) if ed > ee => Some(format!(
            "events_detected {ed} exceeds events_evaluable {ee}"
        )),
        Ok((_, _, pe, pa)) if pa > pe => Some(format!(
            "predictions_agreeing {pa} exceeds predictions_evaluable {pe}"
        )),
        Ok(_) => None,
    }
}

fn facts_of(r: &Run) -> Option<ReceiverTrustFacts> {
    if r.kind != "receiver-trust" || !is_receiver_trust(&r.json) || malformed_counts(r).is_some() {
        return None;
    }
    let n = |p: &str| r.json.get(p).and_then(Value::as_u64).unwrap_or(0);
    Some(ReceiverTrustFacts {
        run: r.label.clone(),
        log_format: r
            .json
            .pointer("/log/format")
            .and_then(Value::as_str)
            .unwrap_or("?")
            .to_string(),
        epochs: r
            .json
            .pointer("/log/epochs")
            .and_then(Value::as_u64)
            .unwrap_or(0),
        events_evaluable: n("events_evaluable"),
        events_detected: n("events_detected"),
        predictions_evaluable: n("predictions_evaluable"),
        predictions_agreeing: n("predictions_agreeing"),
    })
}

/// Fill the mapping from a set of runs. `unrecognised` is carried into the report as given.
pub fn assess(runs: &[Run], mut unrecognised: Vec<String>) -> Report {
    // A run whose counts are malformed counts for nothing, and the report says why.
    let (runs, malformed): (Vec<&Run>, Vec<&Run>) =
        runs.iter().partition(|r| malformed_counts(r).is_none());
    for r in malformed {
        unrecognised.push(format!(
            "{}: receiver-trust counts malformed ({}); excluded",
            r.label,
            malformed_counts(r).unwrap_or_default()
        ));
    }
    let capabilities: Vec<CapabilityEvidence> = CAPABILITIES
        .iter()
        .map(|c| CapabilityEvidence {
            id: c.id.into(),
            name: c.name.into(),
            output: c.output.into(),
            runs: runs
                .iter()
                .filter(|r| run_carries(c, r))
                .map(|r| r.label.clone())
                .collect(),
        })
        .collect();
    let has = |id: &str| {
        capabilities
            .iter()
            .any(|c| c.id == id && !c.runs.is_empty())
    };
    let rows = mapping::rows()
        .iter()
        .map(|r| {
            let (ok, missing): (Vec<&&str>, Vec<&&str>) =
                r.capabilities.iter().partition(|c| has(c));
            let status = if r.capabilities.is_empty() {
                Status::OutOfScope
            } else if missing.is_empty() {
                Status::Evidenced
            } else if ok.is_empty() {
                Status::NotEvidenced
            } else {
                Status::PartlyEvidenced
            };
            RowReport {
                id: r.id.into(),
                framework: r.framework.id().into(),
                reference: r.reference.into(),
                asks: r.asks.into(),
                status,
                evidenced_capabilities: ok.iter().map(|c| c.to_string()).collect(),
                missing_capabilities: missing.iter().map(|c| c.to_string()).collect(),
                gap: r.gap.into(),
            }
        })
        .collect();
    Report {
        statement: STATEMENT.into(),
        engine_version: env!("CARGO_PKG_VERSION").into(),
        runs: runs
            .iter()
            .map(|r| RunRef {
                label: r.label.clone(),
                kind: r.kind.clone(),
                scenario_hash: hash_of(&r.json),
            })
            .collect(),
        unrecognised,
        capabilities,
        receiver_trust: runs.iter().copied().filter_map(facts_of).collect(),
        rows,
    }
}

/// One result file as text, with the scenario file that produced it when there is one.
/// Nothing here touches the file system, so Python, WASM and MCP callers can pass texts.
#[derive(Debug, Clone)]
pub struct RunInput<'a> {
    /// Name shown in the report (usually the file name).
    pub label: &'a str,
    /// The result JSON text.
    pub result_json: &'a str,
    /// The sibling scenario TOML text, used to find the scenario kind.
    pub scenario_toml: Option<&'a str>,
}

/// Read one result from text. The error is the reason it cannot be used. See the module
/// notes for how the kind is found.
pub fn run_from_text(input: &RunInput<'_>) -> Result<Run, String> {
    let label = input.label;
    let json: Value =
        serde_json::from_str(input.result_json).map_err(|e| format!("{label}: not JSON: {e}"))?;
    let kind = kind_of(label, input.scenario_toml, &json)?;
    Ok(Run {
        label: label.to_string(),
        kind,
        json,
    })
}

/// Whether `kind` names a built-in scenario kind or `receiver-trust`.
fn known_kind(kind: &str) -> bool {
    kind == "receiver-trust"
        || crate::api::list_scenario_kinds()
            .iter()
            .any(|m| m.name == kind)
}

/// Fill the mapping from result texts: unusable inputs are listed in the report as not used.
pub fn assess_texts(inputs: &[RunInput<'_>]) -> Report {
    let mut runs = Vec::new();
    let mut bad = Vec::new();
    for i in inputs {
        match run_from_text(i) {
            Ok(r) => runs.push(r),
            Err(e) => bad.push(e),
        }
    }
    assess(&runs, bad)
}

/// Read result files into runs (a thin file-system wrapper over [`run_from_text`]).
/// Returns the runs and a reason for each file that could not be used.
pub fn load_runs(paths: &[std::path::PathBuf]) -> (Vec<Run>, Vec<String>) {
    let mut runs = Vec::new();
    let mut bad = Vec::new();
    for p in paths {
        let label = p
            .file_name()
            .map(|n| n.to_string_lossy().into_owned())
            .unwrap_or_else(|| p.display().to_string());
        let text = match std::fs::read_to_string(p) {
            Ok(t) => t,
            Err(e) => {
                bad.push(format!("{label}: cannot read: {e}"));
                continue;
            }
        };
        // foo.result.json -> foo.toml
        let sibling = label.strip_suffix(".result.json").and_then(|stem| {
            std::fs::read_to_string(p.with_file_name(format!("{stem}.toml"))).ok()
        });
        match run_from_text(&RunInput {
            label: &label,
            result_json: &text,
            scenario_toml: sibling.as_deref(),
        }) {
            Ok(r) => runs.push(r),
            Err(e) => bad.push(e),
        }
    }
    (runs, bad)
}

/// Find a result's scenario kind: a receiver-trust result by its content, else the sibling
/// scenario's `kind`, else the result's own top-level `kind`. The kind must be one the engine
/// knows. When the sibling scenario and the result's own `kind` both exist and differ, the
/// input is refused rather than guessing which is right. (The result's `scenario_hash` and a
/// hash of the scenario file are not compared: the engine computes the first over its parsed
/// scenario and a file hash is over the text, so they are different quantities.)
fn kind_of(label: &str, scenario_toml: Option<&str>, json: &Value) -> Result<String, String> {
    if is_receiver_trust(json) {
        return Ok("receiver-trust".into());
    }
    let own = json.get("kind").and_then(Value::as_str);
    let sibling = scenario_toml.and_then(|src| {
        // `classify` maps an absent or unrecognised kind to `clock`; only trust it when the
        // file says a kind or says nothing at all.
        let k = crate::api::ScenarioKind::classify(src).ok()?.as_str();
        let says = toml::from_str::<toml::Value>(src)
            .ok()
            .and_then(|v| v.get("kind").and_then(|k| k.as_str().map(str::to_string)));
        match says {
            Some(named) if named != k => None,
            _ => Some(k.to_string()),
        }
    });
    let kind = match (sibling, own) {
        (Some(s), Some(o)) if s != o => {
            return Err(format!(
                "{label}: the sibling scenario says kind `{s}` but the result says `{o}`; not used"
            ))
        }
        (Some(s), _) => s,
        (None, Some(o)) => o.to_string(),
        (None, None) => {
            return Err(format!(
                "{label}: scenario kind not found (no sibling scenario file, not a \
                 receiver-trust result, no top-level `kind`)"
            ))
        }
    };
    if known_kind(&kind) {
        Ok(kind)
    } else {
        Err(format!(
            "{label}: `{kind}` is not a scenario kind the engine knows; not used"
        ))
    }
}

/// A Markdown table cell: pipes and line breaks would break the table.
fn cell(s: &str) -> String {
    s.replace('|', "\\|").replace(['\r', '\n'], " ")
}

impl Report {
    /// The report as pretty JSON.
    pub fn to_json(&self) -> String {
        let mut s = serde_json::to_string_pretty(&json!(self)).unwrap_or_default();
        s.push('\n');
        s
    }

    /// The report as Markdown.
    pub fn to_markdown(&self) -> String {
        let mut s = String::from("# Compliance report\n\n");
        s.push_str(&format!("> {}\n\n", self.statement));
        s.push_str(&format!("Written by kshana {}.\n\n", self.engine_version));
        s.push_str("## Runs read\n\n");
        if self.runs.is_empty() {
            s.push_str("None. Every row below is therefore not evidenced.\n\n");
        } else {
            s.push_str("| Run | Kind | Scenario hash |\n|---|---|---|\n");
            for r in &self.runs {
                s.push_str(&format!(
                    "| {} | {} | {} |\n",
                    cell(&r.label),
                    r.kind,
                    r.scenario_hash
                        .as_deref()
                        .map_or("none".to_string(), |h| h.chars().take(12).collect())
                ));
            }
            s.push('\n');
        }
        if !self.unrecognised.is_empty() {
            s.push_str("## Inputs not used\n\n");
            for u in &self.unrecognised {
                s.push_str(&format!("- {}\n", cell(u)));
            }
            s.push('\n');
        }
        s.push_str("## Capabilities in this set\n\n| Capability | Runs |\n|---|---|\n");
        for c in &self.capabilities {
            let runs = if c.runs.is_empty() {
                "none".to_string()
            } else {
                c.runs
                    .iter()
                    .map(|r| cell(r))
                    .collect::<Vec<_>>()
                    .join(", ")
            };
            s.push_str(&format!("| {} | {} |\n", c.name, runs));
        }
        s.push('\n');
        if !self.receiver_trust.is_empty() {
            s.push_str("## Receiver logs, as the runs state them\n\n");
            s.push_str(
                "| Run | Log format | Epochs | Events detected / evaluable | Predictions agreeing / evaluable |\n|---|---|---|---|---|\n",
            );
            for f in &self.receiver_trust {
                s.push_str(&format!(
                    "| {} | {} | {} | {} / {} | {} / {} |\n",
                    cell(&f.run),
                    cell(&f.log_format),
                    f.epochs,
                    f.events_detected,
                    f.events_evaluable,
                    f.predictions_agreeing,
                    f.predictions_evaluable
                ));
            }
            s.push_str(
                "\nThese counts are the runs' own, scored against events and tolerances stated \
                 before the run. They describe those logs, not the receiver in general.\n\n",
            );
        }
        for fw in Framework::ALL {
            s.push_str(&format!("## {}\n\n", fw.title()));
            s.push_str(
                "| Reference | Status | Evidenced by | Not in this set | Gap |\n|---|---|---|---|---|\n",
            );
            for r in self.rows.iter().filter(|r| r.framework == fw.id()) {
                let names = |ids: &[String]| {
                    if ids.is_empty() {
                        "none".to_string()
                    } else {
                        ids.join(", ")
                    }
                };
                s.push_str(&format!(
                    "| {} | {} | {} | {} | {} |\n",
                    r.reference,
                    r.status.as_str(),
                    names(&r.evidenced_capabilities),
                    names(&r.missing_capabilities),
                    r.gap
                ));
            }
            s.push('\n');
        }
        s
    }
}
