// SPDX-License-Identifier: AGPL-3.0-only
//! The test-condition file (`kshana.test-conditions/1`): what a lab states about one
//! recording.
//!
//! The file records the known truth of a test: which satellites the lab expects, and for
//! each event (an interference, spoofing or outage interval) its type label, onset and
//! offset, the satellites it affects and the stated power profile. It is **metadata only**:
//! nothing in Kshana synthesises a signal from it. The stated J/S is used to line up measured
//! results with the lab's conditions and to draw an analytic reference curve labelled
//! MODELLED (see [`super::score`]).
//!
//! The same structure parses from TOML or JSON ([`TestConditions::parse`]); unknown keys are
//! errors, and [`TestConditions::validate`] checks the cross-field rules and names the event
//! and key at fault. Times are seconds from the first sample of the recording.

use super::hash::{canonical_hash, CanonicalHash};
use super::score::Bars;
use crate::iq::io::inventory::RawSidecar;
use serde::{Deserialize, Serialize};
use std::path::{Path, PathBuf};

/// The schema tag every test-condition file carries.
pub const SCHEMA: &str = "kshana.test-conditions/1";

/// The recording a test-condition file describes.
#[derive(Clone, Debug, PartialEq, Serialize, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct RecordingSpec {
    /// Identifier, unique within a campaign; the label in every output.
    pub id: String,
    /// The recording, relative to the test-condition file (anything
    /// [`crate::iq::io::inventory::open_recording`] opens).
    pub path: String,
    /// Expected SHA-256 (hex) of the recording's sample data; a mismatching file is refused.
    #[serde(default, skip_serializing_if = "Option::is_none")]
    pub sha256: Option<String>,
    /// Sample format of a raw recording without its own sidecar (e.g. `ci16_le`).
    #[serde(default, skip_serializing_if = "Option::is_none")]
    pub format: Option<String>,
    /// Sample rate of a raw recording (samples/s).
    #[serde(default, skip_serializing_if = "Option::is_none")]
    pub sample_rate_hz: Option<f64>,
    /// Centre frequency of a raw recording (Hz).
    #[serde(default, skip_serializing_if = "Option::is_none")]
    pub center_hz: Option<f64>,
    /// Intermediate frequency of a raw recording (Hz).
    #[serde(default, skip_serializing_if = "Option::is_none")]
    pub if_hz: Option<f64>,
    /// Header bytes before the first sample of a raw recording.
    #[serde(default, skip_serializing_if = "Option::is_none")]
    pub header_bytes: Option<u64>,
    /// Time of the first sample (ISO 8601), carried into outputs only.
    #[serde(default, skip_serializing_if = "Option::is_none")]
    pub start_utc: Option<String>,
    /// Read the events from the recording's SigMF annotations (see
    /// [`TestConditions::import_sigmf_events`]) when the file is loaded. They join any
    /// `[[event]]` tables given here. The resolved conditions carry the imported events
    /// with this flag cleared, so the condition hash covers what was imported.
    #[serde(default, skip_serializing_if = "std::ops::Not::not")]
    pub events_from_sigmf: bool,
    /// Initial pull-in time excluded from whole-run scores and baselines (s).
    #[serde(default = "default_settle")]
    pub settle_s: f64,
}

fn default_settle() -> f64 {
    5.0
}

impl RecordingSpec {
    /// The raw-recording description stated here, if any (`format` and `sample_rate_hz`
    /// together); `None` lets the recording's own SigMF or sidecar describe it.
    pub fn raw_sidecar(&self) -> Result<Option<RawSidecar>, String> {
        match (&self.format, self.sample_rate_hz) {
            (None, None) => Ok(None),
            (Some(f), Some(fs)) => Ok(Some(RawSidecar {
                format: f.clone(),
                sample_rate_hz: fs,
                center_hz: self.center_hz,
                if_hz: self.if_hz,
                header_bytes: self.header_bytes,
                channels: None,
                channel: None,
                datetime: self.start_utc.clone(),
                description: None,
            })),
            _ => Err(format!(
                "recording '{}': format and sample_rate_hz must be given together",
                self.id
            )),
        }
    }
}

/// Free-text notes on the receiver under test; carried into outputs, never scored or hashed.
#[derive(Clone, Debug, Default, PartialEq, Serialize, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct ReceiverNotes {
    /// The device under test.
    #[serde(default)]
    pub dut: String,
    /// Antenna and front-end notes.
    #[serde(default)]
    pub front_end: String,
    /// Anything else.
    #[serde(default)]
    pub notes: String,
}

/// One group of satellites of one signal the lab expects in the recording.
#[derive(Clone, Debug, PartialEq, Serialize, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct ExpectedSignals {
    /// Signal name as `kshana iq` accepts it (e.g. `gps-l1ca`).
    pub signal: String,
    /// Satellite identifiers (PRNs, or GLONASS frequency channels).
    pub ids: Vec<i64>,
    /// Stated nominal C/N0 (dB-Hz), used as the baseline when no pre-event window is
    /// measurable.
    #[serde(default, skip_serializing_if = "Option::is_none")]
    pub nominal_cn0_dbhz: Option<f64>,
    /// Optional hand-off Doppler per id (Hz); without it the runner acquires.
    #[serde(default, skip_serializing_if = "Vec::is_empty")]
    pub doppler_hz: Vec<f64>,
    /// Optional hand-off code phase per id (chips).
    #[serde(default, skip_serializing_if = "Vec::is_empty")]
    pub code_phase_chips: Vec<f64>,
    /// Code periods per data bit (e.g. 20 for GPS L1 C/A with navigation data); omitted
    /// tracks the signal as data-free.
    #[serde(default, skip_serializing_if = "Option::is_none")]
    pub periods_per_bit: Option<usize>,
    /// A Kshana truth sidecar (synthetic scenes), relative to the test-condition file.
    #[serde(default, skip_serializing_if = "Option::is_none")]
    pub truth: Option<String>,
}

/// What kind of event an interval is.
#[derive(Clone, Copy, Debug, PartialEq, Eq, Serialize, Deserialize)]
#[serde(rename_all = "kebab-case")]
pub enum EventKind {
    /// Interference applied by the lab.
    Interference,
    /// Spoofing applied by the lab.
    Spoofing,
    /// A signal outage (e.g. the simulator's satellites switched off).
    Outage,
    /// Anything else.
    Other,
}

/// The interference or spoofing type, as the lab labels it. A label only.
#[derive(Clone, Copy, Debug, PartialEq, Eq, Serialize, Deserialize)]
#[serde(rename_all = "kebab-case")]
pub enum EventType {
    /// Continuous-wave tone.
    Cw,
    /// Narrowband.
    Narrowband,
    /// Broadband noise.
    Broadband,
    /// Swept.
    Swept,
    /// Pulsed.
    Pulsed,
    /// Chirp.
    Chirp,
    /// Matched spectrum.
    Matched,
    /// Meaconing.
    Meaconing,
    /// Spoofer.
    Spoofer,
    /// Not stated.
    Unknown,
}

impl EventType {
    /// The label used in outputs.
    pub fn name(self) -> &'static str {
        match self {
            EventType::Cw => "cw",
            EventType::Narrowband => "narrowband",
            EventType::Broadband => "broadband",
            EventType::Swept => "swept",
            EventType::Pulsed => "pulsed",
            EventType::Chirp => "chirp",
            EventType::Matched => "matched",
            EventType::Meaconing => "meaconing",
            EventType::Spoofer => "spoofer",
            EventType::Unknown => "unknown",
        }
    }
}

/// The satellites an event affects.
#[derive(Clone, Debug, PartialEq, Serialize, Deserialize)]
#[serde(untagged)]
pub enum Affects {
    /// `"all"`.
    All(String),
    /// A list of ids.
    Ids(Vec<i64>),
}

impl Default for Affects {
    fn default() -> Self {
        Affects::All("all".into())
    }
}

impl Affects {
    /// Whether satellite `id` is affected.
    pub fn includes(&self, id: i64) -> bool {
        match self {
            Affects::All(_) => true,
            Affects::Ids(v) => v.contains(&id),
        }
    }
}

/// What the stated power profile measures.
#[derive(Clone, Copy, Debug, PartialEq, Eq, Serialize, Deserialize)]
#[serde(rename_all = "snake_case")]
pub enum PowerQuantity {
    /// Jammer-to-signal ratio at the antenna (dB).
    JsDb,
    /// Jammer power (dBm); J/S = jammer − `reference_signal_dbm`.
    JammerDbm,
}

/// How a stated profile varies between its points.
#[derive(Clone, Copy, Debug, Default, PartialEq, Eq, Serialize, Deserialize)]
#[serde(rename_all = "kebab-case")]
pub enum Interpolation {
    /// Straight lines between points.
    #[default]
    Linear,
    /// Each point holds until the next.
    Step,
}

/// The stated power profile of an event. Metadata: never used to synthesise anything.
#[derive(Clone, Debug, PartialEq, Serialize, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct PowerProfile {
    /// What `points` measure.
    pub quantity: PowerQuantity,
    /// How the profile varies between points.
    #[serde(default)]
    pub interpolation: Interpolation,
    /// `[t_s, value]` pairs in time order.
    pub points: Vec<[f64; 2]>,
    /// Received signal power (dBm) used to turn `jammer_dbm` into J/S.
    #[serde(default, skip_serializing_if = "Option::is_none")]
    pub reference_signal_dbm: Option<f64>,
}

impl PowerProfile {
    /// The stated value at `t_s`: interpolated between points and held flat beyond them.
    pub fn value_at(&self, t_s: f64) -> f64 {
        let p = &self.points;
        if t_s <= p[0][0] {
            return p[0][1];
        }
        for w in p.windows(2) {
            let ([t0, v0], [t1, v1]) = (w[0], w[1]);
            if t_s < t1 {
                return match self.interpolation {
                    Interpolation::Step => v0,
                    Interpolation::Linear if t1 > t0 => v0 + (v1 - v0) * (t_s - t0) / (t1 - t0),
                    Interpolation::Linear => v1,
                };
            }
        }
        p[p.len() - 1][1]
    }

    /// The stated J/S (dB) at `t_s`.
    pub fn js_db_at(&self, t_s: f64) -> f64 {
        let v = self.value_at(t_s);
        match self.quantity {
            PowerQuantity::JsDb => v,
            PowerQuantity::JammerDbm => v - self.reference_signal_dbm.unwrap_or(f64::NAN),
        }
    }
}

/// One stated event.
#[derive(Clone, Debug, PartialEq, Serialize, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct Event {
    /// Identifier, unique in the file.
    pub id: String,
    /// What the event is.
    pub kind: EventKind,
    /// The lab's type label.
    #[serde(rename = "type")]
    pub event_type: EventType,
    /// Start of the event (s).
    pub onset_s: f64,
    /// End of the event (s).
    pub offset_s: f64,
    /// The satellites it affects.
    #[serde(default)]
    pub affects: Affects,
    /// Stated centre offset from the recording's centre (Hz), carried into outputs.
    #[serde(default, skip_serializing_if = "Option::is_none")]
    pub center_offset_hz: Option<f64>,
    /// Stated bandwidth (Hz), carried into outputs.
    #[serde(default, skip_serializing_if = "Option::is_none")]
    pub bandwidth_hz: Option<f64>,
    /// Spectral-separation factor `Q` override for the MODELLED reference curve.
    #[serde(default, skip_serializing_if = "Option::is_none")]
    pub q: Option<f64>,
    /// The stated power profile; absent for spoofing, outages and unstated power.
    #[serde(default, skip_serializing_if = "Option::is_none")]
    pub power: Option<PowerProfile>,
}

impl Event {
    /// Whether `t_s` falls inside the event.
    pub fn contains(&self, t_s: f64) -> bool {
        t_s >= self.onset_s && t_s < self.offset_s
    }

    /// The stated J/S at `t_s`, when the event states power.
    pub fn js_db_at(&self, t_s: f64) -> Option<f64> {
        self.power.as_ref().map(|p| p.js_db_at(t_s))
    }
}

/// A parsed test-condition file.
#[derive(Clone, Debug, PartialEq, Serialize, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct TestConditions {
    /// Must be [`SCHEMA`].
    pub schema: String,
    /// The recording.
    pub recording: RecordingSpec,
    /// Notes on the receiver under test.
    #[serde(default)]
    pub receiver: ReceiverNotes,
    /// The satellites the lab expects.
    pub expected: Vec<ExpectedSignals>,
    /// The stated events.
    #[serde(default, rename = "event", skip_serializing_if = "Vec::is_empty")]
    pub events: Vec<Event>,
    /// Pass/fail bars for this recording, overriding the campaign's field by field. Not
    /// part of the condition hash: bars are applied when the report is built.
    #[serde(default, skip_serializing_if = "Option::is_none")]
    pub bars: Option<Bars>,
}

impl TestConditions {
    /// Parse TOML or JSON (JSON when the first non-blank character is `{`) and validate.
    pub fn parse(text: &str) -> Result<Self, String> {
        let tc: TestConditions = if text.trim_start().starts_with('{') {
            serde_json::from_str(text).map_err(|e| format!("test conditions (JSON): {e}"))?
        } else {
            toml::from_str(text).map_err(|e| format!("test conditions (TOML): {e}"))?
        };
        tc.validate()?;
        Ok(tc)
    }

    /// Read and parse a test-condition file, importing SigMF events when it asks to.
    pub fn load(path: &Path) -> Result<Self, String> {
        Self::load_checked(path, &|_| Ok(()))
    }

    /// As [`Self::load`], with `check` called on the file and on the SigMF metadata before
    /// each is read.
    pub fn load_checked(
        path: &Path,
        check: &dyn Fn(&Path) -> Result<(), String>,
    ) -> Result<Self, String> {
        check(path)?;
        let text = std::fs::read_to_string(path).map_err(|e| format!("{}: {e}", path.display()))?;
        let mut tc = Self::parse(&text).map_err(|e| format!("{}: {e}", path.display()))?;
        if tc.recording.events_from_sigmf {
            let rec = tc.recording_path(path);
            let name = rec.to_string_lossy().to_string();
            let meta = match name.strip_suffix(".sigmf-data") {
                Some(base) => PathBuf::from(format!("{base}.sigmf-meta")),
                None if name.ends_with(".sigmf-meta") => rec.clone(),
                None => {
                    return Err(format!(
                        "{}: events_from_sigmf needs a SigMF recording (got {})",
                        path.display(),
                        rec.display()
                    ))
                }
            };
            check(&meta)?;
            let json =
                std::fs::read_to_string(&meta).map_err(|e| format!("{}: {e}", meta.display()))?;
            let events =
                Self::import_sigmf_events(&json).map_err(|e| format!("{}: {e}", meta.display()))?;
            tc.events.extend(events);
            tc.recording.events_from_sigmf = false;
            tc.validate()
                .map_err(|e| format!("{}: {e}", path.display()))?;
        }
        Ok(tc)
    }

    /// The events stated in a SigMF metadata document's annotations.
    ///
    /// Every annotation carrying a `kshana:test_event` object becomes one [`Event`]:
    /// * `onset_s` is `core:sample_start / core:sample_rate`;
    /// * `offset_s` adds `core:sample_count`, or runs to the end of the event's power points
    ///   when there is no count;
    /// * the id is the object's `id`, else the annotation's `core:label`, else
    ///   `sigmf-<index>`;
    /// * `core:freq_lower_edge` and `core:freq_upper_edge` give the stated bandwidth and its
    ///   centre offset from the first capture's `core:frequency`.
    ///
    /// The object holds the other [`Event`] fields with their test-condition names (`kind`,
    /// `type`, `affects`, `q`, `power`), and times in it are seconds from the recording's
    /// first sample. Annotations without the object are ignored.
    pub fn import_sigmf_events(meta_json: &str) -> Result<Vec<Event>, String> {
        let meta: serde_json::Value =
            serde_json::from_str(meta_json).map_err(|e| format!("SigMF metadata: {e}"))?;
        let fs = meta["global"]["core:sample_rate"]
            .as_f64()
            .filter(|f| *f > 0.0)
            .ok_or("SigMF metadata: global core:sample_rate is missing")?;
        let center = meta["captures"][0]["core:frequency"].as_f64();
        let mut out = Vec::new();
        let empty = Vec::new();
        let anns = meta["annotations"].as_array().unwrap_or(&empty);
        for (i, a) in anns.iter().enumerate() {
            let Some(obj) = a.get("kshana:test_event").and_then(|o| o.as_object()) else {
                continue;
            };
            let at = format!("annotation {i}");
            let start = a["core:sample_start"]
                .as_u64()
                .ok_or(format!("{at}: core:sample_start is missing"))?
                as f64;
            let mut v = serde_json::Value::Object(obj.clone());
            let m = v.as_object_mut().expect("an object");
            if !m.contains_key("id") {
                let id = a["core:label"]
                    .as_str()
                    .map(String::from)
                    .unwrap_or_else(|| format!("sigmf-{i}"));
                m.insert("id".into(), id.into());
            }
            let onset = start / fs;
            m.insert("onset_s".into(), onset.into());
            let offset = match a["core:sample_count"].as_u64() {
                Some(n) => (start + n as f64) / fs,
                None => m
                    .get("power")
                    .and_then(|p| p["points"].as_array())
                    .and_then(|p| p.last())
                    .and_then(|p| p[0].as_f64())
                    .ok_or(format!(
                        "{at}: no core:sample_count and no power points to end the event"
                    ))?,
            };
            m.insert("offset_s".into(), offset.into());
            if let (Some(lo), Some(hi)) = (
                a["core:freq_lower_edge"].as_f64(),
                a["core:freq_upper_edge"].as_f64(),
            ) {
                m.entry("bandwidth_hz").or_insert((hi - lo).into());
                if let Some(c) = center {
                    m.entry("center_offset_hz")
                        .or_insert(((lo + hi) / 2.0 - c).into());
                }
            }
            let ev: Event =
                serde_json::from_value(v).map_err(|e| format!("{at}: kshana:test_event: {e}"))?;
            out.push(ev);
        }
        Ok(out)
    }

    /// The recording's path, resolved against the directory of the file at `file`.
    pub fn recording_path(&self, file: &Path) -> PathBuf {
        resolve(file, &self.recording.path)
    }

    /// Check the rules a schema alone cannot express.
    pub fn validate(&self) -> Result<(), String> {
        if self.schema != SCHEMA {
            return Err(format!(
                "schema must be \"{SCHEMA}\" (got \"{}\")",
                self.schema
            ));
        }
        let r = &self.recording;
        if r.id.trim().is_empty() {
            return Err("recording.id must not be empty".into());
        }
        if !(r.settle_s.is_finite() && r.settle_s >= 0.0) {
            return Err("recording.settle_s must be finite and >= 0".into());
        }
        if let Some(h) = &r.sha256 {
            if h.len() != 64 || !h.chars().all(|c| c.is_ascii_hexdigit()) {
                return Err("recording.sha256 must be 64 hex digits".into());
            }
        }
        r.raw_sidecar()?;
        if self.expected.is_empty() {
            return Err("at least one [[expected]] group is required".into());
        }
        let mut all_ids = Vec::new();
        for (i, g) in self.expected.iter().enumerate() {
            let at = format!("expected[{i}] ({})", g.signal);
            if g.ids.is_empty() {
                return Err(format!("{at}: ids must not be empty"));
            }
            for (key, n) in [
                ("doppler_hz", g.doppler_hz.len()),
                ("code_phase_chips", g.code_phase_chips.len()),
            ] {
                if n != 0 && n != g.ids.len() {
                    return Err(format!(
                        "{at}: {key} lists {n} value(s); give one per id ({})",
                        g.ids.len()
                    ));
                }
            }
            all_ids.extend(g.ids.iter().copied());
        }
        let mut seen = std::collections::BTreeSet::new();
        for e in &self.events {
            let at = format!("event '{}'", e.id);
            if !seen.insert(e.id.as_str()) {
                return Err(format!("{at}: duplicate id"));
            }
            if !(e.onset_s.is_finite() && e.offset_s.is_finite() && e.offset_s > e.onset_s) {
                return Err(format!("{at}: offset_s must be after onset_s"));
            }
            match &e.affects {
                Affects::All(s) if s != "all" => {
                    return Err(format!("{at}: affects must be \"all\" or a list of ids"))
                }
                Affects::Ids(v) => {
                    if let Some(bad) = v.iter().find(|id| !all_ids.contains(id)) {
                        return Err(format!("{at}: affects id {bad} is not in [[expected]]"));
                    }
                }
                _ => {}
            }
            if let Some(q) = e.q {
                if !(q.is_finite() && q > 0.0) {
                    return Err(format!("{at}: q must be positive"));
                }
            }
            if let Some(p) = &e.power {
                if p.points.is_empty() {
                    return Err(format!("{at}: power.points must not be empty"));
                }
                for w in p.points.windows(2) {
                    if w[1][0] < w[0][0] {
                        return Err(format!("{at}: power.points must be in time order"));
                    }
                }
                if p.points
                    .iter()
                    .any(|[t, v]| !t.is_finite() || !v.is_finite())
                {
                    return Err(format!("{at}: power.points must be finite"));
                }
                if p.quantity == PowerQuantity::JammerDbm && p.reference_signal_dbm.is_none() {
                    return Err(format!(
                        "{at}: power.quantity = \"jammer_dbm\" needs reference_signal_dbm"
                    ));
                }
            }
        }
        // Events must not overlap on any satellite they share.
        for (i, a) in self.events.iter().enumerate() {
            for b in &self.events[i + 1..] {
                let overlap = a.onset_s < b.offset_s && b.onset_s < a.offset_s;
                if overlap
                    && all_ids
                        .iter()
                        .any(|&id| a.affects.includes(id) && b.affects.includes(id))
                {
                    return Err(format!(
                        "events '{}' and '{}' overlap on a shared satellite",
                        a.id, b.id
                    ));
                }
            }
        }
        Ok(())
    }

    /// The condition hash: SHA-256 of the canonical JSON of the resolved file, with the
    /// free-text `[receiver]` notes left out.
    pub fn hash(&self) -> CanonicalHash {
        let mut v = serde_json::to_value(self).unwrap_or_default();
        if let Some(m) = v.as_object_mut() {
            m.remove("receiver");
            m.remove("bars");
        }
        canonical_hash(&v)
    }

    /// The events affecting satellite `id`, in onset order.
    pub fn events_for(&self, id: i64) -> Vec<&Event> {
        let mut v: Vec<&Event> = self
            .events
            .iter()
            .filter(|e| e.affects.includes(id))
            .collect();
        v.sort_by(|a, b| a.onset_s.total_cmp(&b.onset_s));
        v
    }
}

/// `rel` resolved against the directory holding `file` (absolute paths pass through).
pub fn resolve(file: &Path, rel: &str) -> PathBuf {
    let p = Path::new(rel);
    if p.is_absolute() {
        p.to_path_buf()
    } else {
        file.parent().unwrap_or(Path::new(".")).join(p)
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    const TOML: &str = r#"
schema = "kshana.test-conditions/1"
[recording]
id = "run-1"
path = "run1.bin"
format = "ci16_le"
sample_rate_hz = 4e6
[receiver]
dut = "bench receiver"
[[expected]]
signal = "gps-l1ca"
ids = [3, 7]
[[event]]
id = "jam-1"
kind = "interference"
type = "cw"
onset_s = 10.0
offset_s = 20.0
[event.power]
quantity = "js_db"
points = [[10.0, 20.0], [20.0, 40.0]]
"#;

    #[test]
    fn toml_and_json_parse_to_the_same_value_and_hash() {
        let a = TestConditions::parse(TOML).unwrap();
        let json = serde_json::to_string(&a).unwrap();
        let b = TestConditions::parse(&json).unwrap();
        assert_eq!(a, b);
        assert_eq!(a.hash(), b.hash());
        assert_eq!(a.events[0].js_db_at(15.0), Some(30.0));
        assert_eq!(a.events[0].js_db_at(5.0), Some(20.0));
        assert_eq!(a.events[0].js_db_at(25.0), Some(40.0));
    }

    #[test]
    fn receiver_notes_do_not_change_the_hash() {
        let a = TestConditions::parse(TOML).unwrap();
        let b = TestConditions::parse(&TOML.replace("bench receiver", "other")).unwrap();
        assert_eq!(a.hash(), b.hash());
        let c = TestConditions::parse(&TOML.replace("[10.0, 20.0]", "[10.0, 21.0]")).unwrap();
        assert_ne!(a.hash(), c.hash());
    }

    #[test]
    fn errors_name_the_problem() {
        let cases = [
            (
                TOML.replace("offset_s = 20.0", "offset_s = 5.0"),
                "offset_s",
            ),
            (
                TOML.replace("type = \"cw\"", "type = \"laser\""),
                "unknown variant",
            ),
            (
                TOML.replace("ids = [3, 7]", "ids = [3, 7]\nbogus = 1"),
                "unknown field",
            ),
            (
                TOML.replace("[event.power]", "affects = [9]\n[event.power]"),
                "affects id 9",
            ),
            (TOML.replace("sample_rate_hz = 4e6", ""), "together"),
            (TOML.replace("kshana.test-conditions/1", "x/2"), "schema"),
            (
                TOML.replace("quantity = \"js_db\"", "quantity = \"jammer_dbm\""),
                "reference_signal_dbm",
            ),
        ];
        for (text, want) in cases {
            let e = TestConditions::parse(&text).unwrap_err();
            assert!(e.contains(want), "{e} should mention {want}");
        }
    }

    #[test]
    fn overlapping_events_on_a_shared_satellite_are_refused() {
        let t = format!(
            "{TOML}\n[[event]]\nid = \"jam-2\"\nkind = \"interference\"\ntype = \"broadband\"\nonset_s = 15.0\noffset_s = 30.0\naffects = [7]\n"
        );
        assert!(TestConditions::parse(&t).unwrap_err().contains("overlap"));
        let ok = t.replace("onset_s = 15.0", "onset_s = 20.0");
        assert_eq!(TestConditions::parse(&ok).unwrap().events_for(7).len(), 2);
    }

    #[test]
    fn sigmf_annotations_import_as_the_same_events_as_a_written_table() {
        use std::sync::atomic::{AtomicU64, Ordering};
        static SEQ: AtomicU64 = AtomicU64::new(0);
        let uniq = SEQ.fetch_add(1, Ordering::Relaxed);
        let dir =
            std::env::temp_dir().join(format!("kshana-cond-sigmf-{}-{uniq}", std::process::id()));
        std::fs::create_dir_all(&dir).unwrap();
        let meta = serde_json::json!({
            "global": {"core:datatype": "cf32_le", "core:sample_rate": 4.0e6, "core:version": "1.0.0"},
            "captures": [{"core:sample_start": 0, "core:frequency": 1575.42e6}],
            "annotations": [
                {"core:sample_start": 40_000_000u64, "core:sample_count": 40_000_000u64,
                 "core:label": "jam-1",
                 "core:freq_lower_edge": 1574.42e6, "core:freq_upper_edge": 1576.42e6,
                 "kshana:test_event": {"kind": "interference", "type": "cw",
                     "power": {"quantity": "js_db", "points": [[10.0, 20.0], [20.0, 40.0]]}}},
                {"core:sample_start": 0, "core:sample_count": 10, "core:comment": "not an event"}
            ]
        });
        std::fs::write(dir.join("r.sigmf-meta"), meta.to_string()).unwrap();
        std::fs::write(
            dir.join("a.toml"),
            "schema = \"kshana.test-conditions/1\"\n[recording]\nid = \"run-1\"\npath = \"r.sigmf-meta\"\n\
             events_from_sigmf = true\n[[expected]]\nsignal = \"gps-l1ca\"\nids = [3, 7]\n",
        )
        .unwrap();
        let imported = TestConditions::load(&dir.join("a.toml")).unwrap();
        let e = &imported.events[0];
        assert_eq!(imported.events.len(), 1, "the plain annotation is ignored");
        assert_eq!(
            (e.id.as_str(), e.onset_s, e.offset_s),
            ("jam-1", 10.0, 20.0)
        );
        assert_eq!(e.event_type, EventType::Cw);
        assert!((e.bandwidth_hz.unwrap() - 2.0e6).abs() < 1e-3);
        assert!(e.center_offset_hz.unwrap().abs() < 1e-3);
        assert!(
            !imported.recording.events_from_sigmf,
            "cleared once resolved"
        );
        // The same event written as a table resolves to the same conditions and hash.
        let written = TestConditions::parse(&format!(
            "{}[[event]]\nid = \"jam-1\"\nkind = \"interference\"\ntype = \"cw\"\n\
             onset_s = 10.0\noffset_s = 20.0\ncenter_offset_hz = 0.0\nbandwidth_hz = 2000000.0\n\
             [event.power]\nquantity = \"js_db\"\npoints = [[10.0, 20.0], [20.0, 40.0]]\n",
            std::fs::read_to_string(dir.join("a.toml"))
                .unwrap()
                .replace("events_from_sigmf = true\n", "")
        ))
        .unwrap();
        assert_eq!(imported.hash(), written.hash());
        // A bad object names the annotation.
        let bad = meta.to_string().replace("\"cw\"", "\"laser\"");
        let err = TestConditions::import_sigmf_events(&bad).unwrap_err();
        assert!(err.contains("annotation 0"), "{err}");
        std::fs::remove_dir_all(&dir).ok();
    }

    #[test]
    fn step_interpolation_holds_each_point() {
        let p = PowerProfile {
            quantity: PowerQuantity::JammerDbm,
            interpolation: Interpolation::Step,
            points: vec![[0.0, -100.0], [10.0, -90.0]],
            reference_signal_dbm: Some(-130.0),
        };
        assert_eq!(p.js_db_at(9.9), 30.0);
        assert_eq!(p.js_db_at(10.0), 40.0);
    }
}
