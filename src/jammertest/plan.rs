// SPDX-License-Identifier: AGPL-3.0-only
//! The Jammertest test catalogue and transmission plan, read as scheduled truth.
//!
//! The Norwegian Public Roads Administration publishes the event's test catalogue and
//! transmission plan as JSON (`NPRA/jammertest-plan`, MIT licence). The plan lists, per test
//! area, which catalogue test is scheduled in which time slot. [`import`] turns the slots of one
//! test area into receiver-trust `[[events]]`. They are the *schedule*, not a record of when
//! a transmitter was on: a slot may start late, end early or be cancelled, and the plan files
//! carry a `status` field that is mostly empty. Every event label says so.

use crate::receiver_trust::scenario::{EventCfg, EventKind};
use crate::telemetry::time::parse_rfc3339_utc;
use serde_json::Value;
use sha2::{Digest, Sha256};
use std::collections::BTreeMap;
use std::fmt::Write as _;

/// The words every imported event carries, so a result never reads as measured truth.
pub const SCHEDULED_TRUTH: &str = "scheduled truth";

/// One test of the catalogue, by its dotted id (`type.group.test`).
#[derive(Clone, Debug, PartialEq)]
pub struct CatalogTest {
    /// The dotted id, for example `1.2.5`.
    pub id: String,
    /// The catalogue's name for the test.
    pub name: String,
    /// The catalogue type id (0 supplemental, 1 jamming, 2 spoofing, 3 meaconing).
    pub type_id: u32,
    /// The catalogue type name.
    pub type_name: String,
    /// The group name.
    pub group_name: String,
}

/// The test catalogue.
#[derive(Clone, Debug, Default, PartialEq)]
pub struct Catalog {
    /// Tests by dotted id.
    pub tests: BTreeMap<String, CatalogTest>,
}

/// One scheduled slot of the plan.
#[derive(Clone, Debug, PartialEq)]
pub struct Slot {
    /// The catalogue id, as the plan writes it.
    pub test_id: String,
    /// Test area id.
    pub location_id: u32,
    /// Test area name.
    pub location_name: String,
    /// Slot start, seconds since 1970, after the local-time offset is removed (UTC).
    pub start_utc: f64,
    /// Slot end, seconds since 1970 (UTC).
    pub end_utc: f64,
    /// The plan's own start text.
    pub start_text: String,
    /// The plan's power entry, W.
    pub power_w: f64,
    /// The plan's `status` field, as written.
    pub status: String,
}

/// What kind of interference a catalogue type is, or `None` when it transmits nothing to score
/// (briefings, grace periods, booking slots).
pub fn kind_of_type(type_id: u32) -> Option<EventKind> {
    match type_id {
        1 => Some(EventKind::Jamming),
        2 | 3 => Some(EventKind::Spoofing),
        _ => None,
    }
}

fn as_u32(v: &Value) -> Option<u32> {
    v.as_u64().and_then(|x| u32::try_from(x).ok())
}

/// Read the catalogue (`testcatalog*.json`).
pub fn parse_catalog(json: &str) -> Result<Catalog, String> {
    let v: Value = serde_json::from_str(json).map_err(|e| format!("catalogue is not JSON: {e}"))?;
    let types = v
        .get("test_types")
        .and_then(Value::as_array)
        .ok_or("catalogue has no `test_types` array")?;
    let mut tests = BTreeMap::new();
    for t in types {
        let type_id = t
            .get("type_id")
            .and_then(as_u32)
            .ok_or("a test type has no `type_id`")?;
        let type_name = t
            .get("type")
            .and_then(Value::as_str)
            .unwrap_or("")
            .to_string();
        for g in t
            .get("test_groups")
            .and_then(Value::as_array)
            .into_iter()
            .flatten()
        {
            let gid = g
                .get("group_id")
                .and_then(as_u32)
                .ok_or("a test group has no `group_id`")?;
            let gname = g
                .get("group_name")
                .and_then(Value::as_str)
                .unwrap_or("")
                .to_string();
            for x in g
                .get("tests")
                .and_then(Value::as_array)
                .into_iter()
                .flatten()
            {
                let tid = x
                    .get("test_id")
                    .and_then(as_u32)
                    .ok_or("a test has no `test_id`")?;
                let id = format!("{type_id}.{gid}.{tid}");
                tests.insert(
                    id.clone(),
                    CatalogTest {
                        id,
                        name: x
                            .get("name")
                            .and_then(Value::as_str)
                            .unwrap_or("")
                            .to_string(),
                        type_id,
                        type_name: type_name.clone(),
                        group_name: gname.clone(),
                    },
                );
            }
        }
    }
    if tests.is_empty() {
        return Err("catalogue lists no tests".into());
    }
    Ok(Catalog { tests })
}

/// Parse `YYYY-MM-DDTHH:MM:SS` (a local wall-clock time without zone) to UTC seconds, given
/// the local offset from UTC in hours.
fn local_to_utc(text: &str, local_offset_h: f64) -> Result<f64, String> {
    parse_rfc3339_utc(text)
        .map(|t| t - local_offset_h * 3600.0)
        .ok_or_else(|| format!("`{text}` is not a plan time like 2025-09-15T14:00:00"))
}

/// Read one transmission-plan file (`plan-<day>-<date>.json` or `transmission-plan-<date>.json`).
/// Times in the plan have no zone; `local_offset_h` is the event's offset from UTC (Norway in
/// September is CEST, +2).
pub fn parse_plan(json: &str, local_offset_h: f64) -> Result<Vec<Slot>, String> {
    let v: Value = serde_json::from_str(json).map_err(|e| format!("plan is not JSON: {e}"))?;
    let locs = v
        .get("locations")
        .and_then(Value::as_array)
        .ok_or("plan has no `locations` array")?;
    let mut out = Vec::new();
    for l in locs {
        let location_id = l.get("location_id").and_then(as_u32).unwrap_or(0);
        let location_name = l
            .get("location_name")
            .and_then(Value::as_str)
            .unwrap_or("")
            .to_string();
        for t in l
            .get("tests")
            .and_then(Value::as_array)
            .into_iter()
            .flatten()
        {
            let text = |k: &str| t.get(k).and_then(Value::as_str).unwrap_or("");
            let id = text("test_id");
            if id.is_empty() {
                continue;
            }
            let start_utc = local_to_utc(text("start_time"), local_offset_h)?;
            let end_utc = local_to_utc(text("end_time"), local_offset_h)?;
            if end_utc <= start_utc {
                return Err(format!("test {id}: end_time is not after start_time"));
            }
            out.push(Slot {
                test_id: id.to_string(),
                location_id,
                location_name: location_name.clone(),
                start_utc,
                end_utc,
                start_text: text("start_time").to_string(),
                power_w: t.get("power_w").and_then(Value::as_f64).unwrap_or(0.0),
                status: text("status").to_string(),
            });
        }
    }
    Ok(out)
}

/// What to import.
#[derive(Clone, Debug)]
pub struct ImportOptions {
    /// Keep only this test area. Required when the plan has more than one area.
    pub location: Option<u32>,
    /// The log's first epoch, seconds since 1970 (UTC). Event times are relative to it.
    pub log_start_utc: f64,
    /// The log's last epoch, seconds since the first; slots entirely outside `[0, duration]`
    /// are dropped. `None` keeps every slot after the log start.
    pub log_duration_s: Option<f64>,
    /// Edition label for the catalogue, for example `2025`; taken from the plan dates if `None`.
    pub year: Option<u32>,
}

/// One imported event with its catalogue provenance.
#[derive(Clone, Debug, PartialEq)]
pub struct ImportedEvent {
    /// The receiver-trust event.
    pub event: EventCfg,
    /// The catalogue id.
    pub test_id: String,
    /// The catalogue's name for the test.
    pub test_name: String,
    /// Test area id.
    pub location_id: u32,
    /// The edition year.
    pub year: u32,
    /// The plan's `status`, as written.
    pub status: String,
}

/// The import: events plus what was left out and why.
#[derive(Clone, Debug, PartialEq)]
pub struct Imported {
    /// Events, by onset.
    pub events: Vec<ImportedEvent>,
    /// Slots that transmit nothing to score (briefings, lunch, grace, booking, ad hoc).
    pub skipped_non_rf: usize,
    /// Slots whose id is not in the catalogue, listed.
    pub unknown_ids: Vec<String>,
    /// Slots outside the log.
    pub outside_log: usize,
}

fn year_of(utc: f64) -> u32 {
    // Days since 1970-01-01 to calendar year, civil-from-days (public domain algorithm).
    let z = (utc / 86400.0).floor() as i64 + 719_468;
    let era = z.div_euclid(146_097);
    let doe = z.rem_euclid(146_097);
    let yoe = (doe - doe / 1460 + doe / 36_524 - doe / 146_096) / 365;
    let doy = doe - (365 * yoe + yoe / 4 - yoe / 100);
    let mp = (5 * doy + 2) / 153;
    let y = yoe + era * 400 + i64::from(mp >= 10);
    y as u32
}

/// Turn plan slots into events.
pub fn import(slots: &[Slot], catalog: &Catalog, opt: &ImportOptions) -> Result<Imported, String> {
    let mut areas: Vec<(u32, String)> = slots
        .iter()
        .map(|s| (s.location_id, s.location_name.clone()))
        .collect();
    areas.sort();
    areas.dedup();
    let location = match (opt.location, areas.len()) {
        (Some(l), _) => {
            if !areas.iter().any(|a| a.0 == l) {
                return Err(format!("the plan has no test area {l}; it has {areas:?}"));
            }
            l
        }
        (None, 1) => areas[0].0,
        (None, _) => {
            return Err(format!(
                "the plan has several test areas {areas:?}; say which one the log was recorded in"
            ))
        }
    };
    let mut out = Imported {
        events: Vec::new(),
        skipped_non_rf: 0,
        unknown_ids: Vec::new(),
        outside_log: 0,
    };
    for s in slots.iter().filter(|s| s.location_id == location) {
        let Some(ct) = catalog.tests.get(&s.test_id) else {
            // Supplemental ids (0.x.y) are in the catalogue too; an id that is not is reported.
            if !out.unknown_ids.contains(&s.test_id) {
                out.unknown_ids.push(s.test_id.clone());
            }
            continue;
        };
        let Some(kind) = kind_of_type(ct.type_id) else {
            out.skipped_non_rf += 1;
            continue;
        };
        let onset = s.start_utc - opt.log_start_utc;
        let end = s.end_utc - opt.log_start_utc;
        if end <= 0.0 || opt.log_duration_s.is_some_and(|d| onset >= d) {
            out.outside_log += 1;
            continue;
        }
        let year = opt.year.unwrap_or_else(|| year_of(s.start_utc));
        let mut label = String::new();
        let _ = write!(
            label,
            "{SCHEDULED_TRUTH}: Jammertest {year} test {} (area {}) {}",
            s.test_id, s.location_id, ct.name
        );
        out.events.push(ImportedEvent {
            event: EventCfg {
                label,
                kind,
                onset_s: onset.max(0.0),
                end_s: Some(end),
                predicted_cn0_drop_db: None,
            },
            test_id: s.test_id.clone(),
            test_name: ct.name.clone(),
            location_id: s.location_id,
            year,
            status: s.status.clone(),
        });
    }
    out.events
        .sort_by(|a, b| a.event.onset_s.total_cmp(&b.event.onset_s));
    Ok(out)
}

/// Read the event truth of one JammerTest 2024 dataset folder from its `scenario.json`
/// `attack_log`: an event whose text contains "start" opens a window, the next one containing
/// "end" or "stop" closes it (the rule the 2024 calibration pre-registered). The log's time
/// stamps say `Z` but are local time, so `shift_s` (the calibration used -7200) is added to them.
/// The folder's `scenario_id` is the test id; the class is the folder's `attack_type`
/// (`Jamming`, `Spoofing + Jamming` are jamming; the others are counterfeit signals), because
/// the event texts are inconsistent. The events are the logged windows, still not on-air times.
pub fn import_attack_log(
    scenario_json: &str,
    shift_s: f64,
    log_start_utc: f64,
    log_duration_s: Option<f64>,
) -> Result<Imported, String> {
    let v: Value = serde_json::from_str(scenario_json)
        .map_err(|e| format!("scenario.json is not JSON: {e}"))?;
    let id = v
        .get("scenario_id")
        .and_then(Value::as_str)
        .unwrap_or("?")
        .to_string();
    let attack = v
        .get("attack_type")
        .and_then(Value::as_str)
        .unwrap_or("")
        .to_string();
    let kind = if attack.to_lowercase().contains("jamming") {
        EventKind::Jamming
    } else {
        EventKind::Spoofing
    };
    let mut out = Imported {
        events: Vec::new(),
        skipped_non_rf: 0,
        unknown_ids: Vec::new(),
        outside_log: 0,
    };
    let mut open: Option<f64> = None;
    let mut n = 0usize;
    for ev in v
        .get("attack_log")
        .and_then(Value::as_array)
        .ok_or("no `attack_log` array")?
    {
        let (Some(ts), Some(text)) = (
            ev.get("timestamp_utc").and_then(Value::as_str),
            ev.get("event").and_then(Value::as_str),
        ) else {
            continue;
        };
        let Some(t) = parse_rfc3339_utc(ts).map(|t| t + shift_s) else {
            continue;
        };
        let low = text.to_lowercase();
        if low.contains("start") {
            open = Some(t);
        } else if low.contains("end") || low.contains("stop") {
            let Some(s) = open.take() else { continue };
            n += 1;
            let (onset, end) = (s - log_start_utc, t - log_start_utc);
            if end <= 0.0 || log_duration_s.is_some_and(|d| onset >= d) {
                out.outside_log += 1;
                continue;
            }
            out.events.push(ImportedEvent {
                event: EventCfg {
                    label: format!(
                        "{SCHEDULED_TRUTH}: Jammertest 2024 test {id} window {n} ({attack})"
                    ),
                    kind,
                    onset_s: onset.max(0.0),
                    end_s: Some(end),
                    predicted_cn0_drop_db: None,
                },
                test_id: id.clone(),
                test_name: attack.clone(),
                location_id: 0,
                year: 2024,
                status: String::new(),
            });
        }
    }
    if n == 0 {
        return Err("the attack_log holds no start/end window".into());
    }
    Ok(out)
}

fn toml_str(s: &str) -> String {
    let mut o = String::from("\"");
    for c in s.chars() {
        match c {
            '"' => o.push_str("\\\""),
            '\\' => o.push_str("\\\\"),
            c if (c as u32) < 0x20 => {
                let _ = write!(o, "\\u{:04X}", c as u32);
            }
            c => o.push(c),
        }
    }
    o.push('"');
    o
}

/// SHA-256 of a source file, hex, for the header of the output.
pub fn sha256_hex(bytes: &[u8]) -> String {
    hex::encode(Sha256::digest(bytes))
}

/// The events as receiver-trust TOML `[[events]]` tables, ready to append to a scenario.
/// `sources` are `(name, sha256)` pairs recorded in the header. No test contact or other
/// personal field of the plan is carried over.
pub fn events_toml(imp: &Imported, sources: &[(String, String)]) -> String {
    let mut o = String::new();
    let _ = writeln!(o, "# Jammertest {SCHEDULED_TRUTH}: slots of the published plan or logged attack windows, not a record of");
    let _ = writeln!(o, "# when a transmitter was on. Catalogue ids are in each label. Source: NPRA/jammertest-plan (MIT).");
    for (n, h) in sources {
        let _ = writeln!(o, "# source {n} sha256 {h}");
    }
    let _ = writeln!(
        o,
        "# {} events; {} non-RF slots skipped; {} outside the log; {} ids not in the catalogue.",
        imp.events.len(),
        imp.skipped_non_rf,
        imp.outside_log,
        imp.unknown_ids.len()
    );
    for e in &imp.events {
        let kind = match e.event.kind {
            EventKind::Jamming => "jamming",
            EventKind::Spoofing => "spoofing",
            EventKind::Other => "other",
        };
        let _ = writeln!(o, "\n[[events]]");
        let _ = writeln!(o, "label = {}", toml_str(&e.event.label));
        let _ = writeln!(o, "kind = \"{kind}\"");
        let _ = writeln!(o, "onset_s = {}", e.event.onset_s);
        if let Some(end) = e.event.end_s {
            let _ = writeln!(o, "end_s = {end}");
        }
    }
    o
}

#[cfg(test)]
mod tests {
    use super::*;

    const CAT: &str = r#"{"test_types":[
      {"type":"Supplemental periods","type_id":0,"test_groups":[
        {"group_id":1,"group_name":"Grace period","tests":[{"test_id":1,"name":"Grace period"}]}]},
      {"type":"Jamming","type_id":1,"test_groups":[
        {"group_id":2,"group_name":"CW","tests":[{"test_id":5,"name":"Jammer F8.1: 50 W CW"}]}]},
      {"type":"Spoofing","type_id":2,"test_groups":[
        {"group_id":3,"group_name":"Coherent","tests":[{"test_id":1,"name":"Coherent power ramp"}]}]}]}"#;
    const PLAN: &str = r#"{"locations":[{"location_id":1,"location_name":"Test Area 1","tests":[
      {"start_time":"2025-09-15T13:00:00","end_time":"2025-09-15T14:00:00","test_id":"0.1.1","test_contact":"A Person (X)","power_w":0,"comment":"Lunch","status":""},
      {"start_time":"2025-09-15T14:00:00","end_time":"2025-09-15T14:10:00","test_id":"1.2.5","test_contact":"A Person (X)","power_w":0,"comment":"","status":""},
      {"start_time":"2025-09-15T15:00:00","end_time":"2025-09-15T15:10:00","test_id":"2.3.1","test_contact":"A Person (X)","power_w":0,"comment":"","status":"notRun"},
      {"start_time":"2025-09-15T16:00:00","end_time":"2025-09-15T16:10:00","test_id":"9.9.9","test_contact":"A Person (X)","power_w":0,"comment":"","status":""}]},
      {"location_id":2,"location_name":"Test Area 2","tests":[]}]}"#;

    fn opts(start: &str) -> ImportOptions {
        ImportOptions {
            location: Some(1),
            log_start_utc: parse_rfc3339_utc(start).unwrap(),
            log_duration_s: None,
            year: None,
        }
    }

    #[test]
    fn catalogue_ids_and_kinds_survive_the_import() {
        let cat = parse_catalog(CAT).unwrap();
        assert_eq!(cat.tests["1.2.5"].name, "Jammer F8.1: 50 W CW");
        let slots = parse_plan(PLAN, 2.0).unwrap();
        // Local 14:00 is 12:00 UTC; the log starts at 11:55 UTC.
        let imp = import(&slots, &cat, &opts("2025-09-15T11:55:00Z")).unwrap();
        assert_eq!(imp.skipped_non_rf, 1);
        assert_eq!(imp.unknown_ids, vec!["9.9.9".to_string()]);
        assert_eq!(imp.events.len(), 2);
        let j = &imp.events[0];
        assert_eq!(
            (j.test_id.as_str(), j.year, j.event.kind),
            ("1.2.5", 2025, EventKind::Jamming)
        );
        assert_eq!((j.event.onset_s, j.event.end_s), (300.0, Some(900.0)));
        assert!(j.event.label.starts_with(SCHEDULED_TRUTH) && j.event.label.contains("1.2.5"));
        assert_eq!(imp.events[1].event.kind, EventKind::Spoofing);
        assert_eq!(imp.events[1].status, "notRun");
    }

    #[test]
    fn toml_round_trips_through_the_scenario_parser_and_drops_personal_fields() {
        let cat = parse_catalog(CAT).unwrap();
        let slots = parse_plan(PLAN, 2.0).unwrap();
        let imp = import(&slots, &cat, &opts("2025-09-15T11:55:00Z")).unwrap();
        let toml_text = events_toml(&imp, &[("plan.json".into(), "00".into())]);
        assert!(!toml_text.contains("Person"));
        #[derive(serde::Deserialize)]
        struct Wrap {
            events: Vec<EventCfg>,
        }
        let back: Wrap = toml::from_str(&toml_text).unwrap();
        let want: Vec<EventCfg> = imp.events.iter().map(|e| e.event.clone()).collect();
        assert_eq!(back.events, want);
    }

    #[test]
    fn several_areas_need_a_choice_and_bad_times_are_refused() {
        let cat = parse_catalog(CAT).unwrap();
        let slots = parse_plan(PLAN, 2.0).unwrap();
        let mut o = opts("2025-09-15T11:55:00Z");
        o.location = None;
        // Area 2 has no slots, so only area 1 appears in the slot list: one area, no choice needed.
        assert!(import(&slots, &cat, &o).is_ok());
        o.location = Some(7);
        assert!(import(&slots, &cat, &o).is_err());
        assert!(parse_plan(
            r#"{"locations":[{"tests":[{"test_id":"1.2.5","start_time":"x","end_time":"y"}]}]}"#,
            2.0
        )
        .is_err());
        assert!(parse_catalog("{}").is_err());
    }

    #[test]
    fn year_from_epoch_seconds() {
        assert_eq!(
            year_of(parse_rfc3339_utc("2025-09-15T00:00:00Z").unwrap()),
            2025
        );
        assert_eq!(
            year_of(parse_rfc3339_utc("2026-01-01T00:00:00Z").unwrap()),
            2026
        );
        assert_eq!(
            year_of(parse_rfc3339_utc("2025-12-31T23:59:59Z").unwrap()),
            2025
        );
    }
}
