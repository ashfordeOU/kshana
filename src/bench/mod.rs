// SPDX-License-Identifier: AGPL-3.0-only
//! kshana-bench v1: fixed tasks, splits and metrics for GNSS interference detection and timing
//! holdover (`bench/SPEC.md`).
//!
//! A submission is a file. [`score`] turns a truth file and a predictions file into a result file
//! (`kshana-bench-result/1`); [`seal`] and [`reveal_check`] commit to a holdout seed without
//! revealing it; [`site::leaderboard_html`] renders result files as one static page. The metric
//! code is the open core's own: AUC, confusion and threshold selection come from
//! [`crate::impairment_eval`], and the task (a) truth rules from
//! [`crate::receiver_trust::calibration`].
//!
//! Every score here is MODELLED: no external oracle agrees with it, and a score describes a log or
//! a corpus, never a product. Nothing in this module reads the network or writes outside the paths
//! it is given.

pub mod cli;
pub mod site;
pub mod tasks;

use std::collections::BTreeMap;

use serde_json::{json, Map, Value};
use sha2::{Digest, Sha256};

use crate::impairment_eval::{auc, confusion_at, threshold_for_pfa};

/// The specification version results are scored under (`bench/SPEC.md`).
pub const SPEC_VERSION: &str = "kshana-bench/2.0.0";
/// Schema name of a result file.
pub const RESULT_SCHEMA: &str = "kshana-bench-result/1";
/// Schema name of a predictions file.
pub const PREDICTIONS_SCHEMA: &str = "kshana-bench-predictions/1";
/// Schema name of a truth file.
pub const TRUTH_SCHEMA: &str = "kshana-bench-truth/1";
/// Schema name of a cases file.
pub const CASES_SCHEMA: &str = "kshana-bench-cases/1";
/// Schema name of a split manifest.
pub const MANIFEST_SCHEMA: &str = "kshana-bench-manifest/1";
/// The false-alarm cap of the secondary detection metric (an upper bound, see the spec).
pub const PFA_CAP: f64 = 0.01;
/// Optimism gap above which a detector is flagged optimistic on task (d).
pub const OPTIMISM_TOL: f64 = 0.05;
/// The advisory statement every result file carries.
pub const NOTICE: &str = "Advisory: modelled or measured against stated references, not an approval, certification or statement of conformance. A score describes a log or corpus, never a product.";

/// Errors of the bench commands; the message says what to fix.
#[derive(Debug)]
pub struct BenchError(pub String);

impl std::fmt::Display for BenchError {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        f.write_str(&self.0)
    }
}

impl std::error::Error for BenchError {}

pub(crate) fn err<T>(m: impl Into<String>) -> Result<T, BenchError> {
    Err(BenchError(m.into()))
}

/// The three splits of a task.
#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub enum Split {
    /// Development: for tuning.
    Dev,
    /// Test: reported publicly.
    Test,
    /// Holdout: one evaluation per round (sealed for the synthetic tasks).
    Holdout,
}

impl Split {
    /// Parse `dev`, `test` or `holdout`.
    pub fn parse(s: &str) -> Result<Self, BenchError> {
        match s {
            "dev" => Ok(Split::Dev),
            "test" => Ok(Split::Test),
            "holdout" => Ok(Split::Holdout),
            other => err(format!("unknown split `{other}` (dev, test or holdout)")),
        }
    }

    /// The name as written in files.
    pub fn name(self) -> &'static str {
        match self {
            Split::Dev => "dev",
            Split::Test => "test",
            Split::Holdout => "holdout",
        }
    }
}

/// Lowercase hex SHA-256 of `bytes`.
pub fn sha256_hex(bytes: &[u8]) -> String {
    hex::encode(Sha256::digest(bytes))
}

/// The 1.0.0 split of a real-data folder (superseded, kept so `RESULTS-v1.md` stays reproducible):
/// the first 8 bytes of the SHA-256 of the folder path, big-endian, modulo 10; 0 to 5 dev, 6 and 7
/// test, 8 and 9 holdout. On JammerTest 2024 it left the holdout without a jamming epoch.
pub fn folder_split_v1(path: &str) -> Split {
    let d = Sha256::digest(path.as_bytes());
    let mut b = [0u8; 8];
    b.copy_from_slice(&d[..8]);
    match u64::from_be_bytes(b) % 10 {
        0..=5 => Split::Dev,
        6 | 7 => Split::Test,
        _ => Split::Holdout,
    }
}

/// The 2.0.0 split of the evaluable folders of a real-data task (`xval/bench/PREREGISTRATION-v2.md`):
/// two strata (`true` = a jamming folder, `false` = any other), each ordered by the lowercase hex
/// SHA-256 of the folder path; within a stratum of `n` folders the first `max(1, round(n/4))` are
/// holdout, the next `max(1, round(n/4))` test and the rest dev (rounding half up). Folder-level and
/// deterministic, so every split of the JammerTest 2024 set holds jamming and clean epochs.
pub fn assign_splits(folders: &[(String, bool)]) -> BTreeMap<String, Split> {
    let mut out = BTreeMap::new();
    for stratum in [true, false] {
        let mut v: Vec<(String, &str)> = folders
            .iter()
            .filter(|(_, j)| *j == stratum)
            .map(|(p, _)| (sha256_hex(p.as_bytes()), p.as_str()))
            .collect();
        v.sort();
        let n = v.len();
        let h = ((n + 2) / 4).max(1);
        let t = ((n + 2) / 4).max(1);
        for (i, (_, p)) in v.iter().enumerate() {
            let s = if i < h {
                Split::Holdout
            } else if i < h + t {
                Split::Test
            } else {
                Split::Dev
            };
            out.insert((*p).to_string(), s);
        }
    }
    out
}

/// The commitment to a holdout seed: `SHA-256("kshana-bench/holdout/1" || task || secret)`.
/// A pure function of its inputs; publish it, keep the secret.
pub fn seal(task: &str, secret: &[u8]) -> String {
    let mut h = Sha256::new();
    h.update(b"kshana-bench/holdout/1");
    h.update(task.as_bytes());
    h.update(secret);
    hex::encode(h.finalize())
}

/// Commitments whose seed has been shown to more than its owner. They are test material only and
/// are refused as a release holdout by `reveal-check` and by the leaderboard.
pub const EXPOSED_COMMITMENTS: [&str; 1] =
    ["3aa9099fa4249aacf67a83659324391731ac25525146b5cf143ae6b4d70de7cc"];

/// Whether a commitment is on the exposed list (provisional, not a release holdout).
pub fn is_exposed(commitment: &str) -> bool {
    EXPOSED_COMMITMENTS.contains(&commitment.trim().to_ascii_lowercase().as_str())
}

/// A fresh secret: 32 random bytes as 64 hex characters. The caller writes it to a file the
/// owner keeps; it is never printed or sent.
pub fn new_secret() -> String {
    hex::encode(rand::random::<[u8; 32]>())
}

/// Whether `secret` is the seed behind `commitment` for `task`.
pub fn reveal_check(task: &str, secret: &[u8], commitment: &str) -> bool {
    !is_exposed(commitment) && seal(task, secret) == commitment.trim().to_ascii_lowercase()
}

/// The numeric seed a synthetic holdout is generated from: the first 8 bytes (big-endian) of
/// `SHA-256("kshana-bench/holdout/1/seed" || task || secret)`.
pub fn holdout_seed(task: &str, secret: &[u8]) -> u64 {
    let mut h = Sha256::new();
    h.update(b"kshana-bench/holdout/1/seed");
    h.update(task.as_bytes());
    h.update(secret);
    let d = h.finalize();
    let mut b = [0u8; 8];
    b.copy_from_slice(&d[..8]);
    u64::from_be_bytes(b)
}

/// One labelled case of a detection task.
#[derive(Clone, Debug)]
pub struct Labeled {
    /// Case id.
    pub id: String,
    /// True for an impaired case.
    pub positive: bool,
}

fn finite(v: f64) -> Value {
    if v.is_finite() {
        json!(v)
    } else {
        Value::Null
    }
}

/// Detection metrics of task (a) and (b): AUC, the detection probability at the empirical threshold
/// that keeps the false-alarm probability within [`PFA_CAP`] (an upper bound), and, when the
/// submission declares `threshold`, `P_fa` and `P_d` at it (alarm when `score >= threshold`).
pub fn detection_metrics(
    truth: &[Labeled],
    scores: &BTreeMap<String, f64>,
    declared_threshold: Option<f64>,
) -> Result<Value, BenchError> {
    let labeled = pair(truth, scores)?;
    let pos: Vec<f64> = labeled.iter().filter(|x| x.0).map(|x| x.1).collect();
    let neg: Vec<f64> = labeled.iter().filter(|x| !x.0).map(|x| x.1).collect();
    if pos.is_empty() || neg.is_empty() {
        return err("the truth needs at least one positive and one negative case");
    }
    let thr = threshold_for_pfa(&neg, PFA_CAP);
    let at_cap = confusion_at(&labeled, thr);
    let mut m = Map::new();
    m.insert("n_positive".into(), json!(pos.len()));
    m.insert("n_negative".into(), json!(neg.len()));
    m.insert("auc".into(), finite(auc(&pos, &neg)));
    m.insert("pfa_cap".into(), json!(PFA_CAP));
    m.insert("pd_at_pfa_cap".into(), finite(at_cap.pd()));
    m.insert("pfa_achieved_at_cap".into(), finite(at_cap.pfa()));
    m.insert(
        "pd_at_pfa_cap_note".into(),
        json!("empirical threshold chosen on the scored split itself: an upper bound, not a deployable operating point"),
    );
    if let Some(t) = declared_threshold {
        let c = confusion_at(&labeled, t);
        m.insert("declared_threshold".into(), json!(t));
        m.insert("pfa_at_declared".into(), finite(c.pfa()));
        m.insert("pd_at_declared".into(), finite(c.pd()));
    }
    Ok(Value::Object(m))
}

/// Pair truth with scores: every truth id needs a finite score and no score may lack a truth id.
pub fn pair(
    truth: &[Labeled],
    scores: &BTreeMap<String, f64>,
) -> Result<Vec<(bool, f64)>, BenchError> {
    let mut out = Vec::with_capacity(truth.len());
    let mut missing = 0usize;
    let mut first_missing = String::new();
    for t in truth {
        match scores.get(&t.id) {
            Some(s) if s.is_finite() => out.push((t.positive, *s)),
            Some(_) => return err(format!("score for `{}` is not finite", t.id)),
            None => {
                if missing == 0 {
                    first_missing = t.id.clone();
                }
                missing += 1;
            }
        }
    }
    if missing > 0 {
        return err(format!(
            "{missing} case(s) have no score, the first is `{first_missing}`"
        ));
    }
    if scores.len() != truth.len() {
        let known: std::collections::BTreeSet<&str> = truth.iter().map(|t| t.id.as_str()).collect();
        let extra = scores.keys().find(|k| !known.contains(k.as_str()));
        return err(format!(
            "predictions name a case that is not in the truth: `{}`",
            extra.map(String::as_str).unwrap_or("?")
        ));
    }
    Ok(out)
}

/// The system that produced a submission.
#[derive(Clone, Debug, PartialEq)]
pub struct System {
    /// A name the submitter chose.
    pub name: String,
    /// A version string.
    pub version: String,
    /// An optional link.
    pub url: Option<String>,
}

impl System {
    pub(crate) fn from_value(v: &Value) -> Result<Self, BenchError> {
        let name = v
            .get("name")
            .and_then(Value::as_str)
            .filter(|s| !s.trim().is_empty())
            .ok_or_else(|| BenchError("`system.name` is required".into()))?;
        Ok(Self {
            name: name.to_string(),
            version: v
                .get("version")
                .and_then(Value::as_str)
                .unwrap_or("unversioned")
                .to_string(),
            url: v.get("url").and_then(Value::as_str).map(String::from),
        })
    }

    fn to_json(&self) -> Value {
        let mut m = Map::new();
        m.insert("name".into(), json!(self.name));
        m.insert("version".into(), json!(self.version));
        if let Some(u) = &self.url {
            m.insert("url".into(), json!(u));
        }
        Value::Object(m)
    }
}

/// Assemble a result file.
#[allow(clippy::too_many_arguments)]
pub(crate) fn result_json(
    task: &str,
    split: &str,
    system: &System,
    provenance: &str,
    provenance_note: Option<&str>,
    truth_sha256: &str,
    predictions_sha256: &str,
    metrics: Value,
    label: &str,
) -> Value {
    let mut m = Map::new();
    m.insert("schema".into(), json!(RESULT_SCHEMA));
    m.insert("spec_version".into(), json!(SPEC_VERSION));
    m.insert("task".into(), json!(task));
    m.insert("split".into(), json!(split));
    m.insert("system".into(), system.to_json());
    m.insert("provenance".into(), json!(provenance));
    if let Some(n) = provenance_note {
        m.insert("provenance_note".into(), json!(n));
    }
    m.insert("truth_sha256".into(), json!(truth_sha256));
    m.insert("predictions_sha256".into(), json!(predictions_sha256));
    m.insert("metrics".into(), metrics);
    m.insert("label".into(), json!(label));
    m.insert("notice".into(), json!(NOTICE));
    Value::Object(m)
}

/// Check a result file against the rules of `bench/schema/result.schema.json`. Returns the list of
/// problems, empty when the file is valid.
pub fn validate_result(v: &Value) -> Vec<String> {
    let mut p = Vec::new();
    let s = |k: &str| v.get(k).and_then(Value::as_str);
    if s("schema") != Some(RESULT_SCHEMA) {
        p.push(format!("`schema` must be `{RESULT_SCHEMA}`"));
    }
    if !s("spec_version").is_some_and(|x| x.starts_with("kshana-bench/")) {
        p.push("`spec_version` must start with `kshana-bench/`".into());
    }
    if !matches!(s("task"), Some("a" | "b" | "c" | "d")) {
        p.push("`task` must be a, b, c or d".into());
    }
    if !matches!(s("split"), Some("dev" | "test" | "holdout")) {
        p.push("`split` must be dev, test or holdout".into());
    }
    if !v
        .pointer("/system/name")
        .and_then(Value::as_str)
        .is_some_and(|x| !x.trim().is_empty())
    {
        p.push("`system.name` is required".into());
    }
    match s("provenance") {
        Some("scored") => {}
        Some("carried") => {
            if s("provenance_note").is_none() {
                p.push("a `carried` result needs a `provenance_note` naming its source".into());
            }
        }
        _ => p.push("`provenance` must be `scored` or `carried`".into()),
    }
    for k in ["truth_sha256", "predictions_sha256"] {
        let ok = s(k).is_some_and(|x| x.len() == 64 && x.bytes().all(|b| b.is_ascii_hexdigit()));
        // A carried result has no file to hash.
        if !ok && s("provenance") != Some("carried") {
            p.push(format!("`{k}` must be a 64-digit hex SHA-256"));
        }
    }
    if !v.get("metrics").is_some_and(Value::is_object) {
        p.push("`metrics` must be an object".into());
    }
    if s("label").is_none_or(|x| x.trim().is_empty()) {
        p.push("`label` (MODELLED or measured, and what the truth is) is required".into());
    }
    if s("notice").is_none_or(|x| !x.contains("Advisory")) {
        p.push("`notice` must carry the advisory statement".into());
    }
    p
}

/// Score a predictions file against a truth file, both as JSON text, and return the result file
/// as pretty JSON. `declared_threshold` applies to tasks (a) and (b).
pub fn score(
    truth_json: &str,
    predictions_json: &str,
    declared_threshold: Option<f64>,
) -> Result<String, BenchError> {
    let truth: Value = serde_json::from_str(truth_json)
        .map_err(|e| BenchError(format!("truth is not JSON: {e}")))?;
    let preds: Value = serde_json::from_str(predictions_json)
        .map_err(|e| BenchError(format!("predictions are not JSON: {e}")))?;
    if truth.get("schema").and_then(Value::as_str) != Some(TRUTH_SCHEMA) {
        return err(format!("truth `schema` must be `{TRUTH_SCHEMA}`"));
    }
    if preds.get("schema").and_then(Value::as_str) != Some(PREDICTIONS_SCHEMA) {
        return err(format!(
            "predictions `schema` must be `{PREDICTIONS_SCHEMA}`"
        ));
    }
    let task = truth.get("task").and_then(Value::as_str).unwrap_or("");
    let split = truth.get("split").and_then(Value::as_str).unwrap_or("");
    if preds.get("task").and_then(Value::as_str) != Some(task) {
        return err("predictions and truth name different tasks");
    }
    if preds.get("split").and_then(Value::as_str) != Some(split) {
        return err("predictions and truth name different splits");
    }
    if truth.get("spec_version").and_then(Value::as_str) != Some(SPEC_VERSION) {
        return err(format!(
            "truth was made under another spec version than {SPEC_VERSION}; results of different major versions are never mixed"
        ));
    }
    Split::parse(split)?;
    let system = System::from_value(preds.get("system").unwrap_or(&Value::Null))?;
    let (metrics, label) = match task {
        "a" | "b" => tasks::score_detection_task(&truth, &preds, declared_threshold)?,
        "c" => tasks::score_c(&truth, &preds)?,
        "d" => tasks::score_d(&truth, &preds)?,
        other => return err(format!("unknown task `{other}`")),
    };
    let mut r = result_json(
        task,
        split,
        &system,
        "scored",
        None,
        &sha256_hex(truth_json.as_bytes()),
        &sha256_hex(predictions_json.as_bytes()),
        metrics,
        &label,
    );
    if let Some(c) = truth.get("holdout_commitment").and_then(Value::as_str) {
        r["holdout_commitment"] = json!(c);
    }
    serde_json::to_string_pretty(&r).map_err(|e| BenchError(e.to_string()))
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn the_v1_folder_split_is_a_pure_function_and_covers_all_three_splits() {
        assert_eq!(folder_split_v1("a/b"), folder_split_v1("a/b"));
        let mut seen = std::collections::BTreeSet::new();
        for i in 0..200 {
            seen.insert(folder_split_v1(&format!("f{i}")).name());
        }
        assert_eq!(seen.len(), 3);
    }

    #[test]
    fn the_stratified_split_gives_every_split_both_strata_and_does_not_depend_on_input_order() {
        let folders: Vec<(String, bool)> = (0..14)
            .map(|i| (format!("folder-{i}"), i % 2 == 0))
            .collect();
        let a = assign_splits(&folders);
        let mut rev = folders.clone();
        rev.reverse();
        assert_eq!(a, assign_splits(&rev));
        for s in [Split::Dev, Split::Test, Split::Holdout] {
            for stratum in [true, false] {
                let n = folders
                    .iter()
                    .filter(|(p, j)| *j == stratum && a[p] == s)
                    .count();
                let want = match s {
                    Split::Dev => 3,
                    _ => 2,
                };
                assert_eq!(n, want, "{s:?} {stratum}");
            }
        }
        // Tiny strata still fill holdout and test first.
        let two = assign_splits(&[("x".into(), true), ("y".into(), true)]);
        assert_eq!(two.values().filter(|s| **s == Split::Holdout).count(), 1);
        assert_eq!(two.values().filter(|s| **s == Split::Test).count(), 1);
    }

    #[test]
    fn seal_is_pure_and_reveal_rejects_a_changed_byte() {
        let c = seal("d", b"secret-seed");
        assert_eq!(c, seal("d", b"secret-seed"));
        assert!(reveal_check("d", b"secret-seed", &c));
        assert!(!reveal_check("d", b"secret-seeD", &c));
        assert!(!reveal_check("c", b"secret-seed", &c));
        assert_ne!(holdout_seed("d", b"a"), holdout_seed("d", b"b"));
    }

    #[test]
    fn an_exposed_commitment_is_refused_and_a_fresh_secret_is_not() {
        let exposed = EXPOSED_COMMITMENTS[0];
        assert!(is_exposed(exposed) && is_exposed(&exposed.to_ascii_uppercase()));
        // Even the right seed is refused when its commitment is on the list.
        let s = new_secret();
        assert_eq!(s.len(), 64);
        assert_ne!(s, new_secret());
        let c = seal("d", s.as_bytes());
        assert!(reveal_check("d", s.as_bytes(), &c));
        assert!(!is_exposed(&c));
    }

    #[test]
    fn pairing_is_strict() {
        let truth = vec![
            Labeled {
                id: "x".into(),
                positive: true,
            },
            Labeled {
                id: "y".into(),
                positive: false,
            },
        ];
        let mut s = BTreeMap::new();
        s.insert("x".to_string(), 1.0);
        assert!(pair(&truth, &s).unwrap_err().0.contains("no score"));
        s.insert("y".to_string(), f64::NAN);
        assert!(pair(&truth, &s).unwrap_err().0.contains("finite"));
        s.insert("y".to_string(), 0.0);
        s.insert("z".to_string(), 0.0);
        assert!(pair(&truth, &s).unwrap_err().0.contains("not in the truth"));
        s.remove("z");
        assert_eq!(pair(&truth, &s).unwrap().len(), 2);
    }

    #[test]
    fn result_validation_names_each_problem() {
        let bad = json!({"schema": "x"});
        let p = validate_result(&bad);
        assert!(p.len() >= 6);
        let ok = result_json(
            "d",
            "test",
            &System {
                name: "n".into(),
                version: "1".into(),
                url: None,
            },
            "scored",
            None,
            &"a".repeat(64),
            &"b".repeat(64),
            json!({}),
            "MODELLED",
        );
        assert!(
            validate_result(&ok).is_empty(),
            "{:?}",
            validate_result(&ok)
        );
        let mut carried = ok.clone();
        carried["provenance"] = json!("carried");
        assert!(validate_result(&carried)[0].contains("provenance_note"));
    }
}
