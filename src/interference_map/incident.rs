// SPDX-License-Identifier: AGPL-3.0-only
//! The interference-incident data format `kshana-interference-incidents/1`, its causation
//! vocabulary `kshana-interference-vocabulary/1`, the validator, the release of the public case
//! library, and the conversion of the observatory's incident reports into the same format
//! (`docs/INTERFERENCE-INCIDENTS.md`).
//!
//! A record says what happened (an effect class graded by a confidence level that needs its
//! evidence), where (a named area and at most a coarse box, never a point), when, in which
//! domains, and which public sources say so. It never names an aircraft, a vessel, a person or an
//! actor, and its origin categories are technical only (unknown, authorised test, equipment fault,
//! natural, system anomaly). Library records are labelled `REPORTED`: taken from their cited
//! sources, not measured by Kshana. Records converted from the observatory are `MODELLED`.
//! Nothing here opens a network connection.

use std::collections::BTreeSet;
use std::path::{Path, PathBuf};

use serde_json::{json, Map, Value};

use super::cli::{check_args, flag_value, positional, read};
use super::MapError;

/// Schema tag of a library document.
pub const LIBRARY_SCHEMA: &str = "kshana-interference-incidents/1";
/// Identifier of the vocabulary the enumerations below form.
pub const VOCABULARY: &str = "kshana-interference-vocabulary/1";
/// Schema tag of the observatory's incident report, the input of [`from_observatory`].
pub const OBSERVATORY_REPORT_SCHEMA: &str = super::observatory::INCIDENT_SCHEMA;
/// The JSON Schema of a library document (draft 2020-12). The validator applies it and the
/// cross-field rules it cannot express; a test keeps its enumerations equal to the ones below.
pub const JSON_SCHEMA: &str =
    include_str!("../../data/interference-incidents/kshana-interference-incidents-1.schema.json");
/// File name of the JSON Schema in a release.
pub const JSON_SCHEMA_FILE: &str = "kshana-interference-incidents-1.schema.json";

/// What a record describes.
pub const RECORD_KINDS: &[&str] = &[
    "event",
    "period",
    "statistic",
    "study",
    "observatory_detection",
];
/// The effect class: what the interference did to the signal or the data, never who caused it.
pub const EFFECT_CLASSES: &[&str] = &[
    "jamming",
    "spoofing",
    "meaconing",
    "ais_manipulation",
    "interference_unspecified",
    "degradation_unattributed",
];
/// Confidence levels, from strongest to weakest; each needs the evidence in [`required_basis`].
pub const CONFIDENCE: &[&str] = &["confirmed", "probable", "suspected", "undetermined"];
/// The kind of evidence a source gives.
pub const EVIDENCE_BASIS: &[&str] = &[
    "rf_measurement",
    "position_report_analysis",
    "authority_statement",
    "operator_statement",
    "crew_report",
    "secondary_report",
];
/// Technical origin categories. There is deliberately no category for a person, an organisation
/// or a purpose: attribution is outside this format.
pub const ORIGIN_CATEGORIES: &[&str] = &[
    "unknown",
    "authorised_test",
    "equipment_fault",
    "natural",
    "system_anomaly",
];
/// Where the interfering transmission came from, when a source says so. Never a position.
pub const PLATFORMS: &[&str] = &["ground", "airborne", "maritime", "space", "unknown"];
/// The users or systems affected.
pub const DOMAINS: &[&str] = &[
    "aviation",
    "maritime",
    "land",
    "timing",
    "drone",
    "space",
    "satellite_terminal",
    "reference_station",
];
/// Effects a source reports.
pub const OBSERVED_EFFECTS: &[&str] = &[
    "position_jump",
    "loss_of_fix",
    "accuracy_degraded",
    "signal_to_noise_drop",
    "implausible_motion",
    "false_alert",
    "station_detections",
    "service_degraded",
    "grounding",
    "diversion",
    "traffic_reduction",
];
/// Time precision.
pub const PRECISION: &[&str] = &["minute", "hour", "day", "month", "year", "unknown"];
/// Source kinds.
pub const SOURCE_KINDS: &[&str] = &[
    "official",
    "primary_report",
    "study",
    "news",
    "secondary",
    "dataset",
];
/// Figure qualifiers.
pub const QUALIFIERS: &[&str] = &["exact", "about", "at_least", "at_most"];
/// Evidence labels: `REPORTED` (from cited public sources) or `MODELLED` (a Kshana method's output).
pub const LABELS: &[&str] = &["REPORTED", "MODELLED"];
/// How a bounding box was drawn.
pub const BBOX_BASIS: &[&str] = &["editor_envelope", "source", "observatory_cells"];
/// The smallest side of a bounding box, degrees: an area, never a point.
pub const MIN_BBOX_DEG: f64 = 0.5;

/// Words that would name or imply an actor, a military, an intent or a conflict. Free text in a
/// record must not contain one (whole-word match, so "stated" does not trip "state"). The list is
/// the one the emitter-region outputs are held to.
pub const BANNED_WORDS: &[&str] = &[
    "attack",
    "attacker",
    "hostile",
    "adversary",
    "adversarial",
    "enemy",
    "military",
    "army",
    "navy",
    "war",
    "warfare",
    "intent",
    "intentional",
    "deliberate",
    "state",
    "regime",
    "government",
    "armed",
    "weapon",
    "sabotage",
    "target",
    "culprit",
    "perpetrator",
    "actor",
];

/// The evidence a confidence level needs: at least one of these bases. `None` means any.
pub fn required_basis(confidence: &str) -> Option<&'static [&'static str]> {
    match confidence {
        "confirmed" => Some(&["rf_measurement"]),
        "probable" => Some(&["rf_measurement", "position_report_analysis"]),
        _ => None,
    }
}

/// One finding of the validator: where, which rule, and what to fix (English: it is written to a
/// machine-readable report).
#[derive(Debug, Clone, PartialEq)]
pub struct Problem {
    /// JSON path of the offending value, for example `records[3].effect.confidence`.
    pub path: String,
    /// The rule's short name.
    pub rule: &'static str,
    /// What is wrong.
    pub message: String,
}

impl Problem {
    fn to_json(&self) -> Value {
        json!({"path": self.path, "rule": self.rule, "message": self.message})
    }
}

struct Check {
    problems: Vec<Problem>,
}

impl Check {
    fn add(&mut self, path: &str, rule: &'static str, message: String) {
        self.problems.push(Problem {
            path: path.to_string(),
            rule,
            message,
        });
    }

    /// A required non-empty string.
    fn text<'a>(&mut self, obj: &'a Map<String, Value>, key: &str, path: &str) -> Option<&'a str> {
        match obj.get(key) {
            Some(Value::String(s)) if !s.trim().is_empty() => Some(s),
            Some(_) => {
                self.add(
                    &format!("{path}.{key}"),
                    "type",
                    "expected a non-empty string".into(),
                );
                None
            }
            None => {
                self.add(
                    &format!("{path}.{key}"),
                    "required",
                    "missing required field".into(),
                );
                None
            }
        }
    }

    fn optional_text<'a>(
        &mut self,
        obj: &'a Map<String, Value>,
        key: &str,
        path: &str,
    ) -> Option<&'a str> {
        if obj.contains_key(key) {
            self.text(obj, key, path)
        } else {
            None
        }
    }

    fn one_of(&mut self, value: Option<&str>, allowed: &[&str], path: &str) -> bool {
        match value {
            Some(v) if allowed.contains(&v) => true,
            Some(v) => {
                self.add(
                    path,
                    "vocabulary",
                    format!("`{v}` is not one of: {}", allowed.join(", ")),
                );
                false
            }
            None => false,
        }
    }

    fn object<'a>(
        &mut self,
        v: Option<&'a Value>,
        path: &str,
        allowed: &[&str],
    ) -> Option<&'a Map<String, Value>> {
        match v {
            Some(Value::Object(m)) => {
                for k in m.keys() {
                    if !allowed.contains(&k.as_str()) {
                        self.add(
                            &format!("{path}.{k}"),
                            "unknown-field",
                            "field not in this format version (identifiers and actors have no field by design)"
                                .into(),
                        );
                    }
                }
                Some(m)
            }
            Some(_) => {
                self.add(path, "type", "expected an object".into());
                None
            }
            None => {
                self.add(path, "required", "missing required field".into());
                None
            }
        }
    }

    /// A required array of vocabulary strings, without repeats.
    fn enum_list(
        &mut self,
        obj: &Map<String, Value>,
        key: &str,
        allowed: &[&str],
        min: usize,
        path: &str,
    ) -> Vec<String> {
        let p = format!("{path}.{key}");
        let Some(v) = obj.get(key) else {
            self.add(&p, "required", "missing required field".into());
            return Vec::new();
        };
        let Some(a) = v.as_array() else {
            self.add(&p, "type", "expected an array".into());
            return Vec::new();
        };
        if a.len() < min {
            self.add(&p, "required", format!("needs at least {min} entry"));
        }
        let mut seen = BTreeSet::new();
        let mut out = Vec::new();
        for (i, e) in a.iter().enumerate() {
            let ep = format!("{p}[{i}]");
            match e.as_str() {
                Some(s) => {
                    if self.one_of(Some(s), allowed, &ep) {
                        if !seen.insert(s) {
                            self.add(&ep, "unique", format!("`{s}` is repeated"));
                        }
                        out.push(s.to_string());
                    }
                }
                None => self.add(&ep, "type", "expected a string".into()),
            }
        }
        out
    }

    fn wording(&mut self, text: &str, path: &str) {
        for w in text
            .split(|c: char| !c.is_ascii_alphabetic())
            .filter(|w| !w.is_empty())
        {
            let lw = w.to_ascii_lowercase();
            if BANNED_WORDS.contains(&lw.as_str()) {
                self.add(
                    path,
                    "neutral-wording",
                    format!("`{w}` names or implies an actor, an intent or a conflict; describe the effect instead"),
                );
            }
        }
    }
}

fn is_digits(s: &str, n: usize) -> bool {
    s.len() == n && s.bytes().all(|b| b.is_ascii_digit())
}

/// The precision a time string carries, if it is one of the format's forms: `YYYY`, `YYYY-MM`,
/// `YYYY-MM-DD` or `YYYY-MM-DDTHH:MMZ`.
pub fn time_form(s: &str) -> Option<&'static str> {
    let ok_month = |m: &str| is_digits(m, 2) && (1..=12).contains(&m.parse::<u32>().unwrap_or(0));
    let ok_day = |d: &str| is_digits(d, 2) && (1..=31).contains(&d.parse::<u32>().unwrap_or(0));
    match s.len() {
        4 if is_digits(s, 4) => Some("year"),
        7 if is_digits(&s[..4], 4) && &s[4..5] == "-" && ok_month(&s[5..7]) => Some("month"),
        10 if time_form(&s[..7]) == Some("month") && &s[7..8] == "-" && ok_day(&s[8..10]) => {
            Some("day")
        }
        17 if time_form(&s[..10]) == Some("day")
            && &s[10..11] == "T"
            && is_digits(&s[11..13], 2)
            && s[11..13].parse::<u32>().unwrap_or(99) < 24
            && &s[13..14] == ":"
            && is_digits(&s[14..16], 2)
            && s[14..16].parse::<u32>().unwrap_or(99) < 60
            && &s[16..17] == "Z" =>
        {
            Some("minute")
        }
        _ => None,
    }
}

fn https_url_ok(u: &str) -> bool {
    let Some(rest) = u.strip_prefix("https://") else {
        return false;
    };
    let host = rest.split('/').next().unwrap_or("");
    !u.chars().any(char::is_whitespace)
        && host.contains('.')
        && !host.starts_with('.')
        && !host.ends_with('.')
}

/// Validate a library document: the schema of `kshana-interference-incidents/1` and the
/// cross-field rules of `docs/INTERFERENCE-INCIDENTS.md`. An empty list means valid.
pub fn validate(doc: &Value) -> Vec<Problem> {
    let mut c = Check {
        problems: Vec::new(),
    };
    let top_keys = [
        "schema",
        "library_version",
        "vocabulary",
        "title",
        "description",
        "label",
        "licence",
        "licence_url",
        "attribution",
        "creators",
        "records",
    ];
    let Some(top) = c.object(Some(doc), "$", &top_keys) else {
        return c.problems;
    };
    if top.get("schema").and_then(Value::as_str) != Some(LIBRARY_SCHEMA) {
        c.add("$.schema", "schema", format!("expected `{LIBRARY_SCHEMA}`"));
    }
    if top.get("vocabulary").and_then(Value::as_str) != Some(VOCABULARY) {
        c.add("$.vocabulary", "schema", format!("expected `{VOCABULARY}`"));
    }
    if let Some(v) = c.text(top, "library_version", "$") {
        let parts: Vec<&str> = v.split('.').collect();
        if parts.len() != 3
            || parts
                .iter()
                .any(|p| p.is_empty() || !p.bytes().all(|b| b.is_ascii_digit()))
        {
            c.add(
                "$.library_version",
                "version",
                "expected three dot-separated numbers, for example 1.0.0".into(),
            );
        }
    }
    c.text(top, "title", "$");
    c.optional_text(top, "description", "$");
    c.optional_text(top, "attribution", "$");
    c.text(top, "licence", "$");
    let doc_label = c.text(top, "label", "$");
    c.one_of(doc_label, LABELS, "$.label");
    if let Some(u) = c.text(top, "licence_url", "$") {
        if !https_url_ok(u) {
            c.add(
                "$.licence_url",
                "url",
                "expected an https:// address".into(),
            );
        }
    }
    if let Some(cr) = top.get("creators") {
        match cr.as_array() {
            Some(a) => {
                for (i, e) in a.iter().enumerate() {
                    let p = format!("$.creators[{i}]");
                    if let Some(m) = c.object(Some(e), &p, &["name", "affiliation"]) {
                        c.text(m, "name", &p);
                        c.optional_text(m, "affiliation", &p);
                    }
                }
            }
            None => c.add("$.creators", "type", "expected an array".into()),
        }
    }
    let Some(records) = top.get("records").and_then(Value::as_array) else {
        c.add(
            "$.records",
            "required",
            "expected an array of records".into(),
        );
        return c.problems;
    };
    let mut ids = BTreeSet::new();
    let mut last_id: Option<String> = None;
    for (i, r) in records.iter().enumerate() {
        let p = format!("$.records[{i}]");
        if let Some(id) = record(&mut c, r, &p, doc_label) {
            if !ids.insert(id.clone()) {
                c.add(
                    &format!("{p}.id"),
                    "unique",
                    format!("id `{id}` is repeated"),
                );
            }
            if last_id.as_ref().is_some_and(|l| *l > id) {
                c.add(
                    &format!("{p}.id"),
                    "order",
                    "records are kept in id order".into(),
                );
            }
            last_id = Some(id);
        }
    }
    c.problems
}

fn id_ok(id: &str) -> bool {
    if let Some(n) = id.strip_prefix("KIC-") {
        return is_digits(n, 4);
    }
    if let Some(rest) = id.strip_prefix("KOBS-") {
        return rest.len() == 14
            && time_form(&rest[..10]) == Some("day")
            && &rest[10..11] == "-"
            && is_digits(&rest[11..], 3);
    }
    false
}

/// Validate one record; returns its id when it has a well-formed one.
fn record(c: &mut Check, r: &Value, p: &str, doc_label: Option<&str>) -> Option<String> {
    let keys = [
        "id",
        "record_kind",
        "title",
        "time",
        "area",
        "domains",
        "effect",
        "observed_effects",
        "evidence_basis",
        "origin",
        "figures",
        "sources",
        "label",
        "notes",
    ];
    let m = c.object(Some(r), p, &keys)?;
    let id = c.text(m, "id", p).map(str::to_string);
    if let Some(i) = &id {
        if !id_ok(i) {
            c.add(
                &format!("{p}.id"),
                "id",
                "expected KIC-NNNN (library) or KOBS-YYYY-MM-DD-NNN (observatory)".into(),
            );
        }
    }
    let kind = c.text(m, "record_kind", p);
    c.one_of(kind, RECORD_KINDS, &format!("{p}.record_kind"));
    if let Some(t) = c.text(m, "title", p) {
        c.wording(t, &format!("{p}.title"));
    }
    if let Some(n) = c.optional_text(m, "notes", p) {
        c.wording(n, &format!("{p}.notes"));
    }
    let label = match m.get("label") {
        Some(_) => c.text(m, "label", p),
        None => doc_label,
    };
    c.one_of(label, LABELS, &format!("{p}.label"));

    // time
    let tp = format!("{p}.time");
    if let Some(t) = c.object(m.get("time"), &tp, &["start", "end", "precision", "basis"]) {
        let prec = c.text(t, "precision", &tp);
        c.one_of(prec, PRECISION, &format!("{tp}.precision"));
        if let Some(b) = c.optional_text(t, "basis", &tp) {
            c.wording(b, &format!("{tp}.basis"));
        }
        let mut forms = Vec::new();
        for key in ["start", "end"] {
            match t.get(key) {
                None => c.add(
                    &format!("{tp}.{key}"),
                    "required",
                    "missing (use null when unknown)".into(),
                ),
                Some(Value::Null) => forms.push(None),
                Some(Value::String(s)) => match time_form(s) {
                    Some(f) => forms.push(Some((s.as_str(), f))),
                    None => {
                        c.add(
                            &format!("{tp}.{key}"),
                            "time",
                            "expected YYYY, YYYY-MM, YYYY-MM-DD or YYYY-MM-DDTHH:MMZ (UTC)".into(),
                        );
                        forms.push(None);
                    }
                },
                Some(_) => {
                    c.add(
                        &format!("{tp}.{key}"),
                        "type",
                        "expected a string or null".into(),
                    );
                    forms.push(None);
                }
            }
        }
        if let (Some(prec), Some(Some((s, f)))) = (prec, forms.first()) {
            // A start written to the minute is valid for minute and hour precision.
            let fits = *f == prec || (*f == "minute" && prec == "hour");
            if !fits {
                c.add(
                    &format!("{tp}.precision"),
                    "time",
                    format!("start `{s}` is written to the {f}, precision says {prec}"),
                );
            }
        }
        if prec == Some("unknown") && forms.first().is_some_and(Option::is_some) {
            c.add(
                &format!("{tp}.precision"),
                "time",
                "precision is unknown but a start is given".into(),
            );
        }
        if prec.is_some_and(|x| x != "unknown") && forms.first().is_some_and(Option::is_none) {
            c.add(
                &format!("{tp}.start"),
                "time",
                "a start is needed unless precision is unknown".into(),
            );
        }
        if let (Some(Some((s, _))), Some(Some((e, _)))) = (forms.first(), forms.get(1)) {
            let n = s.len().min(e.len());
            if s[..n] > e[..n] {
                c.add(&format!("{tp}.end"), "time", "end is before start".into());
            }
        }
    }

    // area
    let ap = format!("{p}.area");
    if let Some(a) = c.object(m.get("area"), &ap, &["description", "bbox", "bbox_basis"]) {
        if let Some(d) = c.text(a, "description", &ap) {
            c.wording(d, &format!("{ap}.description"));
        }
        match a.get("bbox") {
            None => c.add(
                &format!("{ap}.bbox"),
                "required",
                "missing (use null for a named area only)".into(),
            ),
            Some(Value::Null) => {
                if a.contains_key("bbox_basis") {
                    c.add(
                        &format!("{ap}.bbox_basis"),
                        "area",
                        "a basis without a box".into(),
                    );
                }
            }
            Some(b) => {
                let bp = format!("{ap}.bbox");
                if let Some(bb) = c.object(Some(b), &bp, &["south", "west", "north", "east"]) {
                    let g = |k: &str| bb.get(k).and_then(Value::as_f64);
                    match (g("south"), g("west"), g("north"), g("east")) {
                        (Some(s), Some(w), Some(n), Some(e))
                            if (-90.0..=90.0).contains(&s)
                                && (-90.0..=90.0).contains(&n)
                                && (-180.0..=180.0).contains(&w)
                                && (-180.0..=180.0).contains(&e)
                                && s < n
                                && w < e =>
                        {
                            if n - s < MIN_BBOX_DEG || e - w < MIN_BBOX_DEG {
                                c.add(
                                    &bp,
                                    "area",
                                    format!("each side must be at least {MIN_BBOX_DEG} degrees: an area, never a point"),
                                );
                            }
                        }
                        _ => c.add(
                            &bp,
                            "area",
                            "expected numbers with south < north and west < east, in range".into(),
                        ),
                    }
                }
                let basis = c.text(a, "bbox_basis", &ap);
                c.one_of(basis, BBOX_BASIS, &format!("{ap}.bbox_basis"));
            }
        }
    }

    c.enum_list(m, "domains", DOMAINS, 1, p);
    c.enum_list(m, "observed_effects", OBSERVED_EFFECTS, 0, p);
    let basis = c.enum_list(m, "evidence_basis", EVIDENCE_BASIS, 1, p);

    // effect
    let ep = format!("{p}.effect");
    if let Some(e) = c.object(
        m.get("effect"),
        &ep,
        &["class", "confidence", "terms_in_source", "class_note"],
    ) {
        let class = c.text(e, "class", &ep);
        c.one_of(class, EFFECT_CLASSES, &format!("{ep}.class"));
        let conf = c.text(e, "confidence", &ep);
        if c.one_of(conf, CONFIDENCE, &format!("{ep}.confidence")) {
            check_confidence(c, conf.unwrap_or(""), &basis, &format!("{ep}.confidence"));
        }
        let note = c.optional_text(e, "class_note", &ep);
        if let Some(n) = note {
            c.wording(n, &format!("{ep}.class_note"));
        }
        let mut terms = Vec::new();
        match e.get("terms_in_source").and_then(Value::as_array) {
            Some(a) => {
                for (i, t) in a.iter().enumerate() {
                    match t.as_str() {
                        Some(s) if !s.trim().is_empty() => terms.push(s.to_ascii_lowercase()),
                        _ => c.add(
                            &format!("{ep}.terms_in_source[{i}]"),
                            "type",
                            "expected a non-empty string".into(),
                        ),
                    }
                }
            }
            None => c.add(
                &format!("{ep}.terms_in_source"),
                "required",
                "expected an array of the source's own words (may be empty)".into(),
            ),
        }
        // A class that differs from the source's own wording must say why.
        let other = match class {
            Some("jamming") => Some("spoof"),
            Some("spoofing") => Some("jam"),
            _ => None,
        };
        if let Some(o) = other {
            if terms.iter().any(|t| t.contains(o)) && note.is_none() {
                c.add(
                    &format!("{ep}.class_note"),
                    "class-vs-source",
                    format!(
                        "the source's words include `{o}…` but the class is `{}`: explain in class_note, or use interference_unspecified",
                        class.unwrap_or("")
                    ),
                );
            }
        }
        if class == Some("degradation_unattributed") && conf != Some("undetermined") {
            c.add(
                &format!("{ep}.confidence"),
                "confidence",
                "degradation_unattributed asserts no interference class, so its confidence is undetermined".into(),
            );
        }
    }

    // origin
    let op = format!("{p}.origin");
    if let Some(o) = c.object(
        m.get("origin"),
        &op,
        &["category", "platform", "confidence", "note"],
    ) {
        let cat = c.text(o, "category", &op);
        c.one_of(cat, ORIGIN_CATEGORIES, &format!("{op}.category"));
        let plat = c.text(o, "platform", &op);
        c.one_of(plat, PLATFORMS, &format!("{op}.platform"));
        let conf = c.text(o, "confidence", &op);
        c.one_of(conf, CONFIDENCE, &format!("{op}.confidence"));
        if let Some(n) = c.optional_text(o, "note", &op) {
            c.wording(n, &format!("{op}.note"));
        }
        let asserted = cat.is_some_and(|x| x != "unknown") || plat.is_some_and(|x| x != "unknown");
        if asserted && conf == Some("undetermined") {
            c.add(
                &format!("{op}.confidence"),
                "confidence",
                "an origin category or platform other than unknown needs a confidence above undetermined".into(),
            );
        }
        if !asserted && conf.is_some_and(|x| x != "undetermined") {
            c.add(
                &format!("{op}.confidence"),
                "confidence",
                "nothing is asserted about the origin, so its confidence is undetermined".into(),
            );
        }
        if let Some(cf) = conf.filter(|_| asserted) {
            check_confidence(c, cf, &basis, &format!("{op}.confidence"));
        }
    }

    // sources
    let sp = format!("{p}.sources");
    let n_sources = match m.get("sources").and_then(Value::as_array) {
        Some(a) if !a.is_empty() => {
            for (i, s) in a.iter().enumerate() {
                let q = format!("{sp}[{i}]");
                if let Some(o) = c.object(
                    Some(s),
                    &q,
                    &["url", "publisher", "published", "kind", "retrieved"],
                ) {
                    if let Some(u) = c.text(o, "url", &q) {
                        if !https_url_ok(u) {
                            c.add(
                                &format!("{q}.url"),
                                "url",
                                "every source cites an https:// address".into(),
                            );
                        }
                    }
                    c.text(o, "publisher", &q);
                    let kind = c.text(o, "kind", &q);
                    c.one_of(kind, SOURCE_KINDS, &format!("{q}.kind"));
                    if let Some(d) = c.text(o, "published", &q) {
                        if !matches!(time_form(d), Some("year" | "month" | "day")) {
                            c.add(
                                &format!("{q}.published"),
                                "time",
                                "expected YYYY, YYYY-MM or YYYY-MM-DD".into(),
                            );
                        }
                    }
                    if let Some(d) = c.optional_text(o, "retrieved", &q) {
                        if time_form(d) != Some("day") {
                            c.add(
                                &format!("{q}.retrieved"),
                                "time",
                                "expected YYYY-MM-DD".into(),
                            );
                        }
                    }
                }
            }
            a.len()
        }
        _ => {
            c.add(
                &sp,
                "sources",
                "every record cites at least one source".into(),
            );
            0
        }
    };

    // figures
    let fp = format!("{p}.figures");
    match m.get("figures").and_then(Value::as_array) {
        Some(a) => {
            for (i, f) in a.iter().enumerate() {
                let q = format!("{fp}[{i}]");
                if let Some(o) =
                    c.object(Some(f), &q, &["quantity", "value", "qualifier", "source"])
                {
                    if let Some(t) = c.text(o, "quantity", &q) {
                        c.wording(t, &format!("{q}.quantity"));
                    }
                    if !o
                        .get("value")
                        .and_then(Value::as_f64)
                        .is_some_and(|v| v.is_finite() && v >= 0.0)
                    {
                        c.add(
                            &format!("{q}.value"),
                            "figure",
                            "expected a number of at least 0".into(),
                        );
                    }
                    let qual = c.text(o, "qualifier", &q);
                    c.one_of(qual, QUALIFIERS, &format!("{q}.qualifier"));
                    let in_range = o
                        .get("source")
                        .and_then(Value::as_u64)
                        .is_some_and(|s| (s as usize) < n_sources);
                    if !in_range {
                        c.add(
                            &format!("{q}.source"),
                            "figure",
                            "expected the index of one of the record's sources".into(),
                        );
                    }
                }
            }
        }
        None => c.add(&fp, "required", "expected an array (may be empty)".into()),
    }

    if kind == Some("observatory_detection") && label != Some("MODELLED") {
        c.add(
            &format!("{p}.label"),
            "label",
            "an observatory detection is the output of a Kshana method: MODELLED".into(),
        );
    }
    if kind.is_some_and(|k| k != "observatory_detection") && label == Some("MODELLED") {
        c.add(
            &format!("{p}.label"),
            "label",
            "a record from public sources is REPORTED".into(),
        );
    }
    id
}

fn check_confidence(c: &mut Check, conf: &str, basis: &[String], path: &str) {
    if let Some(need) = required_basis(conf) {
        if !basis.iter().any(|b| need.contains(&b.as_str())) {
            c.add(
                path,
                "confidence",
                format!(
                    "`{conf}` needs evidence_basis to include one of: {}",
                    need.join(", ")
                ),
            );
        }
    }
}

/// The document with every object's keys sorted, whatever the map type of `serde_json`.
pub fn canonical(v: &Value) -> Value {
    match v {
        Value::Object(m) => {
            let mut keys: Vec<&String> = m.keys().collect();
            keys.sort();
            let mut out = Map::new();
            for k in keys {
                out.insert(k.clone(), canonical(&m[k]));
            }
            Value::Object(out)
        }
        Value::Array(a) => Value::Array(a.iter().map(canonical).collect()),
        o => o.clone(),
    }
}

/// SHA-256 (lowercase hex) of the compact canonical serialisation: the content identity of a
/// library version, independent of whitespace and key order in the file.
pub fn content_sha256(v: &Value) -> String {
    use sha2::{Digest, Sha256};
    let bytes = serde_json::to_vec(&canonical(v)).unwrap_or_default();
    hex(&Sha256::digest(&bytes))
}

fn hex(b: &[u8]) -> String {
    b.iter().map(|x| format!("{x:02x}")).collect()
}

/// Check the library against a releases register (`[{library_version, content_sha256, ...}]`):
/// a version that was released must keep its content. Returns the problems.
pub fn check_releases(doc: &Value, register: &Value) -> Vec<Problem> {
    let mut c = Check {
        problems: Vec::new(),
    };
    let Some(list) = register.get("releases").and_then(Value::as_array) else {
        c.add(
            "releases",
            "register",
            "expected an object with a releases array".into(),
        );
        return c.problems;
    };
    let version = doc.get("library_version").and_then(Value::as_str);
    let sha = content_sha256(doc);
    let mut seen = BTreeSet::new();
    for (i, r) in list.iter().enumerate() {
        let v = r.get("library_version").and_then(Value::as_str);
        let h = r.get("content_sha256").and_then(Value::as_str);
        if v.is_none() || h.is_none_or(|h| h.len() != 64) {
            c.add(
                &format!("releases[{i}]"),
                "register",
                "expected library_version and a 64-hex content_sha256".into(),
            );
            continue;
        }
        if !seen.insert(v) {
            c.add(
                &format!("releases[{i}]"),
                "register",
                "a version appears twice".into(),
            );
        }
        if v == version && h != Some(sha.as_str()) {
            c.add(
                "$.library_version",
                "immutable-release",
                format!(
                    "version {} was released with content {}; this content is {sha}. Raise library_version and add a release entry",
                    v.unwrap_or(""),
                    h.unwrap_or("")
                ),
            );
        }
    }
    c.problems
}

/// The validation report written by `incidents validate --json`.
pub fn report_json(file: &str, doc: Option<&Value>, problems: &[Problem]) -> Value {
    json!({
        "schema": "kshana-interference-incidents-check/1",
        "file": file,
        "valid": problems.is_empty(),
        "records": doc.and_then(|d| d.get("records")).and_then(Value::as_array).map_or(0, Vec::len),
        "content_sha256": doc.map(content_sha256),
        "problems": problems.iter().map(Problem::to_json).collect::<Vec<_>>(),
    })
}

fn csv_field(s: &str) -> String {
    if s.contains([',', '"', '\n', '\r']) {
        format!("\"{}\"", s.replace('"', "\"\""))
    } else {
        s.to_string()
    }
}

/// The records as one flat CSV table (RFC 4180 quoting), for spreadsheets and statistics.
/// Lists are joined with `;`, source addresses with a space.
pub fn to_csv(doc: &Value) -> String {
    let cols = [
        "id",
        "record_kind",
        "label",
        "title",
        "start",
        "end",
        "precision",
        "area",
        "south",
        "west",
        "north",
        "east",
        "domains",
        "class",
        "confidence",
        "terms_in_source",
        "origin_category",
        "origin_platform",
        "evidence_basis",
        "observed_effects",
        "sources",
    ];
    let mut out = cols.join(",");
    out.push_str("\r\n");
    let s = |v: Option<&Value>| match v {
        Some(Value::String(x)) => x.clone(),
        Some(Value::Number(n)) => n.to_string(),
        _ => String::new(),
    };
    let list = |v: Option<&Value>, sep: &str| {
        v.and_then(Value::as_array)
            .map(|a| {
                a.iter()
                    .filter_map(Value::as_str)
                    .collect::<Vec<_>>()
                    .join(sep)
            })
            .unwrap_or_default()
    };
    let doc_label = doc.get("label");
    for r in doc
        .get("records")
        .and_then(Value::as_array)
        .into_iter()
        .flatten()
    {
        let bb = r.pointer("/area/bbox");
        let urls: Vec<&str> = r
            .get("sources")
            .and_then(Value::as_array)
            .into_iter()
            .flatten()
            .filter_map(|x| x.get("url").and_then(Value::as_str))
            .collect();
        let row = [
            s(r.get("id")),
            s(r.get("record_kind")),
            s(r.get("label").or(doc_label)),
            s(r.get("title")),
            s(r.pointer("/time/start")),
            s(r.pointer("/time/end")),
            s(r.pointer("/time/precision")),
            s(r.pointer("/area/description")),
            s(bb.and_then(|b| b.get("south"))),
            s(bb.and_then(|b| b.get("west"))),
            s(bb.and_then(|b| b.get("north"))),
            s(bb.and_then(|b| b.get("east"))),
            list(r.get("domains"), ";"),
            s(r.pointer("/effect/class")),
            s(r.pointer("/effect/confidence")),
            list(r.pointer("/effect/terms_in_source"), ";"),
            s(r.pointer("/origin/category")),
            s(r.pointer("/origin/platform")),
            list(r.get("evidence_basis"), ";"),
            list(r.get("observed_effects"), ";"),
            urls.join(" "),
        ];
        out.push_str(
            &row.iter()
                .map(|f| csv_field(f))
                .collect::<Vec<_>>()
                .join(","),
        );
        out.push_str("\r\n");
    }
    out
}

/// Zenodo deposit metadata (`.zenodo.json`) for a release of the library.
pub fn zenodo_metadata(doc: &Value) -> Value {
    let g = |k: &str| doc.get(k).and_then(Value::as_str).unwrap_or("");
    let creators = doc
        .get("creators")
        .cloned()
        .filter(|c| c.as_array().is_some_and(|a| !a.is_empty()))
        .unwrap_or_else(|| json!([{"name": "Kshana contributors"}]));
    let licence = match g("licence") {
        "CC-BY-4.0" => "cc-by-4.0",
        "CC0-1.0" => "cc-zero",
        "ODbL-1.0" => "odbl-1.0",
        other => other,
    };
    json!({
        "upload_type": "dataset",
        "title": format!("{} {}", g("title"), g("library_version")),
        "version": g("library_version"),
        "description": g("description"),
        "creators": creators,
        "license": licence,
        "access_right": "open",
        "keywords": ["GNSS", "interference", "jamming", "spoofing", "incident data", "PNT resilience"],
        "related_identifiers": [{
            "identifier": "https://github.com/ashfordeOU/kshana",
            "relation": "isSupplementTo",
            "resource_type": "software",
        }],
        "notes": format!("Format {LIBRARY_SCHEMA}, vocabulary {VOCABULARY}. Every record is labelled and cites its sources; see docs/INTERFERENCE-INCIDENTS.md in the Kshana repository."),
    })
}

fn pretty(v: &Value) -> String {
    let mut s = serde_json::to_string_pretty(&canonical(v)).unwrap_or_default();
    s.push('\n');
    s
}

/// Write a release of a valid library into `<out>/kshana-interference-incidents-<version>/`:
/// the records (JSON and CSV), the JSON Schema, Zenodo metadata and a manifest of SHA-256
/// values. A release directory is never overwritten. Returns the directory.
pub fn release(doc: &Value, out: &Path) -> Result<PathBuf, MapError> {
    let problems = validate(doc);
    if !problems.is_empty() {
        return Err(MapError::Format(crate::terr!(
            "e-interference-incidents-invalid",
            n = problems.len()
        )));
    }
    let version = doc
        .get("library_version")
        .and_then(Value::as_str)
        .unwrap_or("");
    let dir = out.join(format!("kshana-interference-incidents-{version}"));
    if dir.exists() {
        return Err(MapError::Io(crate::terr!(
            "e-interference-map-observatory-already-exists-kshana-does-not",
            path = dir.display()
        )));
    }
    std::fs::create_dir_all(&dir).map_err(|e| {
        MapError::Io(crate::terr!(
            "e-interference-map-cli-cannot-create",
            out = dir.display(),
            e = e
        ))
    })?;
    let files: Vec<(&str, String)> = vec![
        ("incidents.json", pretty(doc)),
        ("incidents.csv", to_csv(doc)),
        (JSON_SCHEMA_FILE, JSON_SCHEMA.to_string()),
        (".zenodo.json", pretty(&zenodo_metadata(doc))),
    ];
    let mut entries = Vec::new();
    for (name, text) in &files {
        use sha2::{Digest, Sha256};
        let path = dir.join(name);
        std::fs::write(&path, text.as_bytes()).map_err(|e| {
            MapError::Io(crate::terr!(
                "e-interference-map-cli-cannot-write",
                dest = path.display(),
                e = e
            ))
        })?;
        entries.push(json!({
            "file": name,
            "bytes": text.len(),
            "sha256": hex(&Sha256::digest(text.as_bytes())),
        }));
    }
    let manifest = json!({
        "schema": "kshana-interference-incidents-release/1",
        "library_version": version,
        "content_sha256": content_sha256(doc),
        "records": doc.get("records").and_then(Value::as_array).map_or(0, Vec::len),
        "format": LIBRARY_SCHEMA,
        "vocabulary": VOCABULARY,
        "files": entries,
        "kshana_version": env!("CARGO_PKG_VERSION"),
    });
    let mpath = dir.join("MANIFEST.json");
    std::fs::write(&mpath, pretty(&manifest)).map_err(|e| {
        MapError::Io(crate::terr!(
            "e-interference-map-cli-cannot-write",
            dest = mpath.display(),
            e = e
        ))
    })?;
    Ok(dir)
}

/// Convert an observatory incident report (`kshana-incident-report/1`) into a library document of
/// `observatory_detection` records, labelled MODELLED, carrying the data licence and attribution of
/// the report. `source_url` is where the product is published (every record cites an address).
/// `name` names the input in an error.
pub fn from_observatory(report: &Value, source_url: &str, name: &str) -> Result<Value, MapError> {
    let bad = || {
        MapError::Format(crate::terr!(
            "e-interference-incidents-not-a-document",
            file = name,
            schema = OBSERVATORY_REPORT_SCHEMA
        ))
    };
    if report.get("schema").and_then(Value::as_str) != Some(OBSERVATORY_REPORT_SCHEMA) {
        return Err(bad());
    }
    let date = report
        .get("date")
        .and_then(Value::as_str)
        .filter(|d| time_form(d) == Some("day"))
        .ok_or_else(bad)?;
    let data = report.get("data").cloned().unwrap_or(Value::Null);
    let ds = |k: &str| {
        data.get(k)
            .and_then(Value::as_str)
            .unwrap_or("")
            .to_string()
    };
    let published = report
        .pointer("/release/not_before_utc")
        .and_then(Value::as_str)
        .and_then(|s| s.get(..10))
        .unwrap_or(date)
        .to_string();
    let cell_deg = report.get("grid_cell_deg").and_then(Value::as_f64);
    let mut records = Vec::new();
    for inc in report
        .get("incidents")
        .and_then(Value::as_array)
        .into_iter()
        .flatten()
    {
        let id = inc.get("id").and_then(Value::as_str).ok_or_else(bad)?;
        let n = inc.get("cell_count").and_then(Value::as_u64).unwrap_or(0);
        let cell_text = cell_deg.map_or_else(String::new, |d| format!(" of {d} degrees"));
        records.push(json!({
            "id": id,
            "record_kind": "observatory_detection",
            "title": format!("Cells where a high share of aircraft reported low navigation accuracy ({n} cells)"),
            "time": {"start": date, "end": null, "precision": "day", "basis": "one UTC day"},
            "area": {
                "description": format!("{n} touching grid cells{cell_text}"),
                "bbox": inc.get("bbox").cloned().unwrap_or(Value::Null),
                "bbox_basis": "observatory_cells",
            },
            "domains": ["aviation"],
            "effect": {"class": "degradation_unattributed", "confidence": "undetermined", "terms_in_source": []},
            "observed_effects": ["accuracy_degraded"],
            "evidence_basis": ["position_report_analysis"],
            "origin": {"category": "unknown", "platform": "unknown", "confidence": "undetermined"},
            "figures": [{"quantity": "grid cells", "value": n, "qualifier": "exact", "source": 0}],
            "sources": [{"url": source_url, "publisher": format!("Kshana observatory product from {}", ds("name")), "published": published, "kind": "dataset"}],
            "label": "MODELLED",
            "notes": "Navigation accuracy that aircraft reported about themselves, aggregated per cell and day. Low accuracy has causes other than interference; no cause is attributed.",
        }));
    }
    let doc = json!({
        "schema": LIBRARY_SCHEMA,
        "library_version": "1.0.0",
        "vocabulary": VOCABULARY,
        "title": format!("Kshana observatory detections, {date}"),
        "description": "Observatory incidents of one UTC day in the interference-incident format. MODELLED: aggregated from open aircraft position reports by a pre-registered method; not a confirmation of interference.",
        "label": "MODELLED",
        "licence": ds("licence"),
        "licence_url": ds("licence_url"),
        "attribution": ds("attribution"),
        "records": records,
    });
    Ok(doc)
}

fn load(path: &str) -> Result<Value, MapError> {
    let text = read(path)?;
    serde_json::from_str(&text).map_err(|_| {
        MapError::Format(crate::terr!(
            "e-interference-incidents-not-a-document",
            file = path,
            schema = LIBRARY_SCHEMA
        ))
    })
}

fn write_new(path: &Path, text: &str) -> Result<(), MapError> {
    if path.exists() {
        return Err(MapError::Io(crate::terr!(
            "e-interference-map-observatory-already-exists-kshana-does-not",
            path = path.display()
        )));
    }
    std::fs::write(path, text).map_err(|e| {
        MapError::Io(crate::terr!(
            "e-interference-map-cli-cannot-write",
            dest = path.display(),
            e = e
        ))
    })
}

/// `kshana interference-map incidents ...`; returns the exit code: 0 done, 1 the library or the
/// converted document has problems (listed on standard output, or on standard error for
/// `from-observatory`), 2 a usage or file error.
pub fn run_cli(args: &[String]) -> i32 {
    match run_incidents(args) {
        Ok(true) => 0,
        Ok(false) => 1,
        Err(e) => {
            eprintln!(
                "{}\n{}",
                crate::t!("main-fail", e = e),
                super::cli::map_usage()
            );
            2
        }
    }
}

/// The subcommands; `Ok(false)` when the document has problems.
pub fn run_incidents(args: &[String]) -> Result<bool, MapError> {
    let Some(sub) = args.first().map(String::as_str) else {
        return Err(MapError::Format(crate::terr!(
            "e-interference-map-cli-subcommand-is-required"
        )));
    };
    let rest = &args[1..];
    match sub {
        "validate" => {
            let valued = ["--releases"];
            check_args(rest, &valued, &["--json"], 1)?;
            let file = positional(rest, &valued).ok_or_else(|| {
                MapError::Format(crate::terr!("e-interference-map-cli-input-file-missing"))
            })?;
            let doc = load(file)?;
            let mut problems = validate(&doc);
            if let Some(reg) = flag_value(rest, "--releases")? {
                problems.extend(check_releases(&doc, &load(reg)?));
            }
            if rest.iter().any(|a| a == "--json") {
                println!(
                    "{}",
                    serde_json::to_string_pretty(&report_json(file, Some(&doc), &problems))
                        .unwrap_or_default()
                );
            } else if problems.is_empty() {
                let n = doc
                    .get("records")
                    .and_then(Value::as_array)
                    .map_or(0, Vec::len);
                println!(
                    "{}",
                    crate::t!("interference-incidents-valid", file = file, n = n)
                );
            } else {
                for p in &problems {
                    println!("{}: [{}] {}", p.path, p.rule, p.message);
                }
            }
            if !problems.is_empty() {
                eprintln!(
                    "{}",
                    crate::terr!("e-interference-incidents-invalid", n = problems.len())
                );
            }
            Ok(problems.is_empty())
        }
        "release" => {
            let valued = ["--out"];
            check_args(rest, &valued, &[], 1)?;
            let file = positional(rest, &valued).ok_or_else(|| {
                MapError::Format(crate::terr!("e-interference-map-cli-input-file-missing"))
            })?;
            let out = flag_value(rest, "--out")?.ok_or_else(|| {
                MapError::Format(crate::terr!("e-interference-map-cli-out-is-required"))
            })?;
            let dir = release(&load(file)?, Path::new(out))?;
            println!("{}", crate::t!("main-wrote", path = dir.display()));
            Ok(true)
        }
        "from-observatory" => {
            let valued = ["--out", "--source-url"];
            check_args(rest, &valued, &[], 1)?;
            let file = positional(rest, &valued).ok_or_else(|| {
                MapError::Format(crate::terr!("e-interference-map-cli-input-file-missing"))
            })?;
            let out = flag_value(rest, "--out")?.ok_or_else(|| {
                MapError::Format(crate::terr!("e-interference-map-cli-out-is-required"))
            })?;
            let url = flag_value(rest, "--source-url")?.ok_or_else(|| {
                MapError::Format(crate::terr!("e-interference-incidents-source-url-required"))
            })?;
            let doc = from_observatory(&load(file)?, url, file)?;
            let problems = validate(&doc);
            if !problems.is_empty() {
                for p in &problems {
                    eprintln!("{}: [{}] {}", p.path, p.rule, p.message);
                }
                eprintln!(
                    "{}",
                    crate::terr!("e-interference-incidents-invalid", n = problems.len())
                );
                return Ok(false);
            }
            write_new(Path::new(out), &pretty(&doc))?;
            println!("{}", crate::t!("main-wrote", path = out));
            Ok(true)
        }
        other => Err(MapError::Format(crate::terr!(
            "e-interference-map-cli-unknown-subcommand",
            other = other
        ))),
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    fn minimal() -> Value {
        json!({
            "schema": LIBRARY_SCHEMA, "library_version": "1.0.0", "vocabulary": VOCABULARY,
            "title": "t", "label": "REPORTED", "licence": "CC0-1.0",
            "licence_url": "https://creativecommons.org/publicdomain/zero/1.0/",
            "records": [{
                "id": "KIC-0001", "record_kind": "event", "title": "Position jumps at sea",
                "time": {"start": "2026-01-02", "end": null, "precision": "day"},
                "area": {"description": "Somewhere at sea", "bbox": {"south": 10.0, "west": 20.0, "north": 11.0, "east": 21.0}, "bbox_basis": "editor_envelope"},
                "domains": ["maritime"],
                "effect": {"class": "spoofing", "confidence": "probable", "terms_in_source": ["spoofing"]},
                "observed_effects": ["position_jump"],
                "evidence_basis": ["position_report_analysis"],
                "origin": {"category": "unknown", "platform": "unknown", "confidence": "undetermined"},
                "figures": [{"quantity": "vessels", "value": 3, "qualifier": "at_least", "source": 0}],
                "sources": [{"url": "https://example.org/a", "publisher": "p", "published": "2026-01-03", "kind": "news"}],
            }],
        })
    }

    fn rules(doc: &Value) -> Vec<&'static str> {
        validate(doc).iter().map(|p| p.rule).collect()
    }

    #[test]
    fn a_minimal_record_is_valid() {
        assert_eq!(validate(&minimal()), vec![]);
    }

    #[test]
    fn confidence_needs_its_evidence() {
        let mut d = minimal();
        d["records"][0]["effect"]["confidence"] = json!("confirmed");
        assert_eq!(rules(&d), ["confidence"]);
        d["records"][0]["evidence_basis"] = json!(["crew_report"]);
        d["records"][0]["effect"]["confidence"] = json!("probable");
        assert_eq!(rules(&d), ["confidence"]);
        d["records"][0]["effect"]["confidence"] = json!("suspected");
        assert!(rules(&d).is_empty());
    }

    #[test]
    fn a_class_against_the_sources_words_needs_a_note() {
        let mut d = minimal();
        d["records"][0]["effect"]["terms_in_source"] = json!(["GPS jamming"]);
        assert_eq!(rules(&d), ["class-vs-source"]);
        d["records"][0]["effect"]["class_note"] = json!("The description is of false signals.");
        assert!(rules(&d).is_empty());
    }

    #[test]
    fn a_point_an_identifier_field_a_missing_source_and_actor_words_are_refused() {
        let mut d = minimal();
        d["records"][0]["area"]["bbox"] =
            json!({"south": 10.0, "west": 20.0, "north": 10.1, "east": 21.0});
        assert_eq!(rules(&d), ["area"]);
        let mut d = minimal();
        d["records"][0]["mmsi"] = json!("123456789");
        assert_eq!(rules(&d), ["unknown-field"]);
        let mut d = minimal();
        d["records"][0]["sources"] = json!([]);
        assert!(rules(&d).contains(&"sources"));
        let mut d = minimal();
        d["records"][0]["sources"][0]["url"] = json!("http://example.org/a");
        assert_eq!(rules(&d), ["url"]);
        let mut d = minimal();
        d["records"][0]["title"] = json!("A hostile transmitter");
        assert_eq!(rules(&d), ["neutral-wording"]);
        d["records"][0]["title"] = json!("As stated by the estimated source");
        assert!(rules(&d).is_empty());
    }

    #[test]
    fn time_forms_and_order_are_checked() {
        assert_eq!(time_form("2026"), Some("year"));
        assert_eq!(time_form("2026-13"), None);
        assert_eq!(time_form("2026-01-30T07:00Z"), Some("minute"));
        assert_eq!(time_form("2026-01-30T24:00Z"), None);
        let mut d = minimal();
        d["records"][0]["time"] =
            json!({"start": "2026-02", "end": "2026-01", "precision": "month"});
        assert_eq!(rules(&d), ["time"]);
        d["records"][0]["time"] = json!({"start": "2026-02", "end": null, "precision": "day"});
        assert_eq!(rules(&d), ["time"]);
        d["records"][0]["time"] =
            json!({"start": "2026-02-01T10:00Z", "end": null, "precision": "hour"});
        assert!(rules(&d).is_empty());
        d["records"][0]["time"] = json!({"start": null, "end": null, "precision": "unknown"});
        assert!(rules(&d).is_empty());
    }

    #[test]
    fn origin_claims_need_a_confidence_and_observatory_records_are_modelled() {
        let mut d = minimal();
        d["records"][0]["origin"]["platform"] = json!("space");
        assert_eq!(rules(&d), ["confidence"]);
        d["records"][0]["origin"]["confidence"] = json!("probable");
        assert!(rules(&d).is_empty());
        d["records"][0]["record_kind"] = json!("observatory_detection");
        assert_eq!(rules(&d), ["label"]);
    }

    #[test]
    fn the_content_hash_ignores_layout_and_a_released_version_is_immutable() {
        let d = minimal();
        let reformatted: Value =
            serde_json::from_str(&serde_json::to_string_pretty(&d).unwrap()).unwrap();
        assert_eq!(content_sha256(&d), content_sha256(&reformatted));
        let reg = json!({"releases": [{"library_version": "1.0.0", "content_sha256": content_sha256(&d)}]});
        assert!(check_releases(&d, &reg).is_empty());
        let mut changed = d.clone();
        changed["records"][0]["title"] = json!("Changed");
        assert_eq!(check_releases(&changed, &reg)[0].rule, "immutable-release");
        changed["library_version"] = json!("1.1.0");
        assert!(check_releases(&changed, &reg).is_empty());
    }

    #[test]
    fn csv_quotes_fields_with_commas() {
        let mut d = minimal();
        d["records"][0]["title"] = json!("Jumps, then \"loss\"");
        let csv = to_csv(&d);
        assert!(csv.contains("\"Jumps, then \"\"loss\"\"\""));
        assert_eq!(csv.lines().count(), 2);
    }
}
