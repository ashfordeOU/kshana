// SPDX-License-Identifier: AGPL-3.0-only
//! The CCSDS Conjunction Data Message (CDM): CCSDS 508.0-B-1, Recommended Standard, Issue 1,
//! June 2013, with Technical Corrigendum 2 (October 2021).
//!
//! [`parse`] reads a CDM in KVN (section 6.3) or XML (sections 4 and 6.4) leniently: whatever it
//! can read becomes a [`Cdm`], and every place the text breaks a rule of the standard becomes a
//! [`Finding`](super::Finding) in the [`Report`]. [`check`] then applies the keyword tables
//! (header Table 3-1, relative metadata/data Table 3-2, metadata Table 3-3, data Table 3-4):
//! obligatory keywords, the fixed order (6.3.1.9), value notation (6.3.2), time tags (6.3.2.6),
//! normative values, upper-case text (6.2.3.3), units (6.2.4.1, 6.3.3), the 9x9 covariance row rule
//! (5.2.8) and the identifier characters (5.2.9).
//!
//! Beyond the shall-clauses it compares the relative data with the two objects' states (the
//! definitions of MISS_DISTANCE, RELATIVE_SPEED and the Object1-centred RTN components in Table 3-2
//! and annex E), the time order of the screening period, screening-volume entry and exit and the
//! last-observation interval, and the positive definiteness of each 6x6 covariance. Those are
//! reported as warnings: they show an inconsistent message, not a broken rule.
//!
//! Field names that differ from the standard (a provider's own spelling) can be mapped onto the
//! standard keywords with an alias table before checking; [`Cdm::to_kvn`] then writes the message
//! in the standard keyword order with the standard units.

use super::{fmt_num, is_kvn_integer, is_kvn_number, pd_check, seconds_between, Report, Severity};
use std::collections::BTreeMap;

/// The standard this module checks against.
pub const STANDARD: &str = "CCSDS 508.0-B-1 (June 2013, Technical Corrigendum 2 October 2021)";

fn rule(sec: &str) -> String {
    format!("CCSDS 508.0-B-1 {sec}")
}

#[derive(Clone, Copy, Debug, PartialEq)]
enum Kind {
    Text,
    Time,
    Num,
    Int,
    Version,
    Ident,
    Intl,
    Choice(&'static [&'static str]),
}

#[derive(Clone, Copy)]
struct Kw {
    key: &'static str,
    units: Option<&'static str>,
    kind: Kind,
    req: bool,
    range: Option<(f64, f64)>,
}

const fn k(key: &'static str, units: Option<&'static str>, kind: Kind, req: bool) -> Kw {
    Kw {
        key,
        units,
        kind,
        req,
        range: None,
    }
}

const YES_NO: &[&str] = &["YES", "NO"];

/// Table 3-1.
const HEADER: &[Kw] = &[
    k("CCSDS_CDM_VERS", None, Kind::Version, true),
    k("CREATION_DATE", None, Kind::Time, true),
    k("ORIGINATOR", None, Kind::Ident, true),
    k("MESSAGE_FOR", None, Kind::Text, false),
    k("MESSAGE_ID", None, Kind::Ident, true),
];

/// Table 3-2.
const RELATIVE: &[Kw] = &[
    k("TCA", None, Kind::Time, true),
    k("MISS_DISTANCE", Some("m"), Kind::Num, true),
    k("RELATIVE_SPEED", Some("m/s"), Kind::Num, false),
    k("RELATIVE_POSITION_R", Some("m"), Kind::Num, false),
    k("RELATIVE_POSITION_T", Some("m"), Kind::Num, false),
    k("RELATIVE_POSITION_N", Some("m"), Kind::Num, false),
    k("RELATIVE_VELOCITY_R", Some("m/s"), Kind::Num, false),
    k("RELATIVE_VELOCITY_T", Some("m/s"), Kind::Num, false),
    k("RELATIVE_VELOCITY_N", Some("m/s"), Kind::Num, false),
    k("START_SCREEN_PERIOD", None, Kind::Time, false),
    k("STOP_SCREEN_PERIOD", None, Kind::Time, false),
    k(
        "SCREEN_VOLUME_FRAME",
        None,
        Kind::Choice(&["RTN", "TVN"]),
        false,
    ),
    k(
        "SCREEN_VOLUME_SHAPE",
        None,
        Kind::Choice(&["ELLIPSOID", "BOX"]),
        false,
    ),
    k("SCREEN_VOLUME_X", Some("m"), Kind::Num, false),
    k("SCREEN_VOLUME_Y", Some("m"), Kind::Num, false),
    k("SCREEN_VOLUME_Z", Some("m"), Kind::Num, false),
    k("SCREEN_ENTRY_TIME", None, Kind::Time, false),
    k("SCREEN_EXIT_TIME", None, Kind::Time, false),
    Kw {
        key: "COLLISION_PROBABILITY",
        units: None,
        kind: Kind::Num,
        req: false,
        range: Some((0.0, 1.0)),
    },
    k("COLLISION_PROBABILITY_METHOD", None, Kind::Text, false),
];

/// Table 3-3.
const META: &[Kw] = &[
    k("OBJECT", None, Kind::Choice(&["OBJECT1", "OBJECT2"]), true),
    k("OBJECT_DESIGNATOR", None, Kind::Ident, true),
    k("CATALOG_NAME", None, Kind::Ident, true),
    k("OBJECT_NAME", None, Kind::Text, true),
    k("INTERNATIONAL_DESIGNATOR", None, Kind::Intl, true),
    k(
        "OBJECT_TYPE",
        None,
        Kind::Choice(&["PAYLOAD", "ROCKET BODY", "DEBRIS", "UNKNOWN", "OTHER"]),
        false,
    ),
    k("OPERATOR_CONTACT_POSITION", None, Kind::Text, false),
    k("OPERATOR_ORGANIZATION", None, Kind::Text, false),
    k("OPERATOR_PHONE", None, Kind::Text, false),
    k("OPERATOR_EMAIL", None, Kind::Text, false),
    k("EPHEMERIS_NAME", None, Kind::Text, true),
    k(
        "COVARIANCE_METHOD",
        None,
        Kind::Choice(&["CALCULATED", "DEFAULT"]),
        true,
    ),
    k(
        "MANEUVERABLE",
        None,
        Kind::Choice(&["YES", "NO", "N/A"]),
        true,
    ),
    k("ORBIT_CENTER", None, Kind::Text, false),
    k(
        "REF_FRAME",
        None,
        Kind::Choice(&["GCRF", "EME2000", "ITRF"]),
        true,
    ),
    k("GRAVITY_MODEL", None, Kind::Text, false),
    k("ATMOSPHERIC_MODEL", None, Kind::Text, false),
    k("N_BODY_PERTURBATIONS", None, Kind::Text, false),
    k("SOLAR_RAD_PRESSURE", None, Kind::Choice(YES_NO), false),
    k("EARTH_TIDES", None, Kind::Choice(YES_NO), false),
    k("INTRACK_THRUST", None, Kind::Choice(YES_NO), false),
];

/// Table 3-4, without the covariance (see [`COV`]).
const DATA: &[Kw] = &[
    k("TIME_LASTOB_START", None, Kind::Time, false),
    k("TIME_LASTOB_END", None, Kind::Time, false),
    k("RECOMMENDED_OD_SPAN", Some("d"), Kind::Num, false),
    k("ACTUAL_OD_SPAN", Some("d"), Kind::Num, false),
    k("OBS_AVAILABLE", None, Kind::Int, false),
    k("OBS_USED", None, Kind::Int, false),
    k("TRACKS_AVAILABLE", None, Kind::Int, false),
    k("TRACKS_USED", None, Kind::Int, false),
    Kw {
        key: "RESIDUALS_ACCEPTED",
        units: Some("%"),
        kind: Kind::Num,
        req: false,
        range: Some((0.0, 100.0)),
    },
    k("WEIGHTED_RMS", None, Kind::Num, false),
    k("AREA_PC", Some("m**2"), Kind::Num, false),
    k("AREA_DRG", Some("m**2"), Kind::Num, false),
    k("AREA_SRP", Some("m**2"), Kind::Num, false),
    k("MASS", Some("kg"), Kind::Num, false),
    k("CD_AREA_OVER_MASS", Some("m**2/kg"), Kind::Num, false),
    k("CR_AREA_OVER_MASS", Some("m**2/kg"), Kind::Num, false),
    k("THRUST_ACCELERATION", Some("m/s**2"), Kind::Num, false),
    k("SEDR", Some("W/kg"), Kind::Num, false),
    k("X", Some("km"), Kind::Num, true),
    k("Y", Some("km"), Kind::Num, true),
    k("Z", Some("km"), Kind::Num, true),
    k("X_DOT", Some("km/s"), Kind::Num, true),
    k("Y_DOT", Some("km/s"), Kind::Num, true),
    k("Z_DOT", Some("km/s"), Kind::Num, true),
];

/// The 45 lower-triangular covariance keywords of Table 3-4 in row order, with their units.
/// Rows 1 to 6 (21 terms) are obligatory; rows 7 (DRG), 8 (SRP) and 9 (THR) are optional.
pub const COV: &[(&str, &str)] = &[
    ("CR_R", "m**2"),
    ("CT_R", "m**2"),
    ("CT_T", "m**2"),
    ("CN_R", "m**2"),
    ("CN_T", "m**2"),
    ("CN_N", "m**2"),
    ("CRDOT_R", "m**2/s"),
    ("CRDOT_T", "m**2/s"),
    ("CRDOT_N", "m**2/s"),
    ("CRDOT_RDOT", "m**2/s**2"),
    ("CTDOT_R", "m**2/s"),
    ("CTDOT_T", "m**2/s"),
    ("CTDOT_N", "m**2/s"),
    ("CTDOT_RDOT", "m**2/s**2"),
    ("CTDOT_TDOT", "m**2/s**2"),
    ("CNDOT_R", "m**2/s"),
    ("CNDOT_T", "m**2/s"),
    ("CNDOT_N", "m**2/s"),
    ("CNDOT_RDOT", "m**2/s**2"),
    ("CNDOT_TDOT", "m**2/s**2"),
    ("CNDOT_NDOT", "m**2/s**2"),
    ("CDRG_R", "m**3/kg"),
    ("CDRG_T", "m**3/kg"),
    ("CDRG_N", "m**3/kg"),
    ("CDRG_RDOT", "m**3/(kg*s)"),
    ("CDRG_TDOT", "m**3/(kg*s)"),
    ("CDRG_NDOT", "m**3/(kg*s)"),
    ("CDRG_DRG", "m**4/kg**2"),
    ("CSRP_R", "m**3/kg"),
    ("CSRP_T", "m**3/kg"),
    ("CSRP_N", "m**3/kg"),
    ("CSRP_RDOT", "m**3/(kg*s)"),
    ("CSRP_TDOT", "m**3/(kg*s)"),
    ("CSRP_NDOT", "m**3/(kg*s)"),
    ("CSRP_DRG", "m**4/kg**2"),
    ("CSRP_SRP", "m**4/kg**2"),
    ("CTHR_R", "m**2/s**2"),
    ("CTHR_T", "m**2/s**2"),
    ("CTHR_N", "m**2/s**2"),
    ("CTHR_RDOT", "m**2/s**3"),
    ("CTHR_TDOT", "m**2/s**3"),
    ("CTHR_NDOT", "m**2/s**3"),
    ("CTHR_DRG", "m**3/(kg*s**2)"),
    ("CTHR_SRP", "m**3/(kg*s**2)"),
    ("CTHR_THR", "m**2/s**4"),
];

/// Which part of the message a section is.
#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub enum Part {
    /// The header (Table 3-1).
    Header,
    /// The relative metadata/data (Table 3-2).
    Relative,
    /// One object's metadata and data (Tables 3-3 and 3-4).
    Object,
}

impl Part {
    fn label(self) -> String {
        match self {
            Part::Header => crate::t!("orbit-data-header"),
            Part::Relative => crate::t!("orbit-data-cdm-relative"),
            Part::Object => crate::t!("orbit-data-cdm-object"),
        }
    }
}

/// One `KEYWORD = value [units]` of a CDM, or a comment (keyword `COMMENT`).
#[derive(Clone, Debug, PartialEq)]
pub struct Item {
    /// Keyword (after any alias), upper case.
    pub key: String,
    /// Value as written (for a comment, its text).
    pub value: String,
    /// Units as written, without the brackets.
    pub units: Option<String>,
    /// 1-based line in a KVN message.
    pub line: Option<usize>,
}

/// A section of a CDM: items in order.
#[derive(Clone, Debug, Default, PartialEq)]
pub struct Section {
    /// Items and comments in message order.
    pub items: Vec<Item>,
}

impl Section {
    /// The value of `key`.
    pub fn get(&self, key: &str) -> Option<&str> {
        self.items
            .iter()
            .find(|i| i.key == key)
            .map(|i| i.value.as_str())
    }

    /// The value of `key` as a number (`None` if absent or not a number).
    pub fn num(&self, key: &str) -> Option<f64> {
        self.get(key)?.parse().ok()
    }
}

/// A conjunction data message as read.
#[derive(Clone, Debug, Default, PartialEq)]
pub struct Cdm {
    /// Header.
    pub header: Section,
    /// Relative metadata/data.
    pub relative: Section,
    /// Object sections (a valid message has two: OBJECT1 then OBJECT2).
    pub objects: Vec<Section>,
}

fn table(part: Part) -> Vec<&'static Kw> {
    match part {
        Part::Header => HEADER.iter().collect(),
        Part::Relative => RELATIVE.iter().collect(),
        Part::Object => META.iter().chain(DATA.iter()).collect(),
    }
}

/// The table position of `key` in `part` (covariance keywords after the state vector).
fn position(part: Part, key: &str) -> Option<usize> {
    let t = table(part);
    if let Some(i) = t.iter().position(|kw| kw.key == key) {
        return Some(i);
    }
    if part == Part::Object {
        return COV.iter().position(|(c, _)| *c == key).map(|i| t.len() + i);
    }
    None
}

fn kw_of(part: Part, key: &str) -> Option<Kw> {
    if let Some(kw) = table(part).into_iter().find(|kw| kw.key == key) {
        return Some(*kw);
    }
    if part == Part::Object {
        if let Some((c, u)) = COV.iter().find(|(c, _)| *c == key) {
            return Some(k(c, Some(u), Kind::Num, false));
        }
    }
    None
}

/// Read a CDM (KVN or XML) leniently, mapping keywords through `aliases` (non-standard name to
/// standard keyword) first. The report holds the syntax findings; call [`check`] for the rest.
pub fn parse(text: &str, aliases: &BTreeMap<String, String>) -> (Cdm, Report) {
    let mut rep = Report::new("CDM", STANDARD);
    let cdm = if text.trim_start().starts_with('<') {
        parse_xml(text, aliases, &mut rep)
    } else {
        parse_kvn(text, aliases, &mut rep)
    };
    (cdm, rep)
}

/// Read and check a CDM: [`parse`] then [`check`].
pub fn validate(text: &str, aliases: &BTreeMap<String, String>) -> (Cdm, Report) {
    let (cdm, mut rep) = parse(text, aliases);
    check(&cdm, &mut rep);
    (cdm, rep)
}

fn place(cdm: &mut Cdm, state: &mut Part, item: Item) {
    if item.key == "OBJECT" {
        *state = Part::Object;
        cdm.objects.push(Section::default());
    } else if *state == Part::Header
        && item.key != "COMMENT"
        && !HEADER.iter().any(|kw| kw.key == item.key)
    {
        *state = Part::Relative;
    }
    match state {
        Part::Header => cdm.header.items.push(item),
        Part::Relative => cdm.relative.items.push(item),
        Part::Object => cdm
            .objects
            .last_mut()
            .expect("OBJECT opened a section")
            .items
            .push(item),
    }
}

fn parse_kvn(text: &str, aliases: &BTreeMap<String, String>, rep: &mut Report) -> Cdm {
    let mut cdm = Cdm::default();
    let mut state = Part::Header;
    let mut first = true;
    for (i, raw) in text.split('\n').enumerate() {
        let n = i + 1;
        let raw = raw.strip_suffix('\r').unwrap_or(raw);
        if raw.chars().count() > 254 {
            rep.push(
                Severity::Error,
                "line-too-long",
                rule("§6.2.2.1"),
                Some(n),
                None,
                crate::t!(
                    "orbit-data-line-too-long",
                    n = raw.chars().count(),
                    max = 254
                ),
            );
        }
        if raw.chars().any(|c| !(' '..='~').contains(&c)) {
            rep.push(
                Severity::Error,
                "non-printable",
                rule("§6.2.2.2"),
                Some(n),
                None,
                crate::t!("orbit-data-non-printable"),
            );
        }
        let l = raw.trim();
        if l.is_empty() {
            continue;
        }
        if let Some(c) = l.strip_prefix("COMMENT") {
            if c.is_empty() || c.starts_with(' ') {
                let item = Item {
                    key: "COMMENT".into(),
                    value: c.trim_start().to_string(),
                    units: None,
                    line: Some(n),
                };
                place(&mut cdm, &mut state, item);
                continue;
            }
        }
        let Some((key, val)) = l.split_once('=') else {
            rep.push(
                Severity::Error,
                "not-key-value",
                rule("§6.3.1.3"),
                Some(n),
                None,
                crate::t!("orbit-data-not-key-value", text = l),
            );
            continue;
        };
        let key = key.trim();
        if key.contains(char::is_whitespace) {
            rep.push(
                Severity::Error,
                "keyword-blank",
                rule("§6.3.1.5"),
                Some(n),
                Some(key),
                crate::t!("orbit-data-keyword-blank", key = key),
            );
            continue;
        }
        if key.chars().any(|c| c.is_ascii_lowercase()) {
            rep.push(
                Severity::Error,
                "keyword-case",
                rule("§6.3.1.5"),
                Some(n),
                Some(key),
                crate::t!("orbit-data-keyword-case", key = key),
            );
        }
        let up = key.to_ascii_uppercase();
        let key = aliases.get(&up).cloned().unwrap_or(up);
        let mut value = val.trim().to_string();
        let mut units = None;
        if value.ends_with(']') {
            if let Some(b) = value.rfind('[') {
                let u = value[b + 1..value.len() - 1].to_string();
                if b == 0 || !value[..b].ends_with(' ') {
                    rep.push(
                        Severity::Error,
                        "units-format",
                        rule("§6.3.3"),
                        Some(n),
                        Some(&key),
                        crate::t!("orbit-data-units-format", key = key.as_str()),
                    );
                }
                value = value[..b].trim_end().to_string();
                units = Some(u);
            }
        }
        if first && key != "CCSDS_CDM_VERS" {
            rep.push(
                Severity::Error,
                "first-line",
                rule("§6.3.1.2"),
                Some(n),
                Some(&key),
                crate::t!("orbit-data-first-line", key = "CCSDS_CDM_VERS"),
            );
        }
        first = false;
        place(
            &mut cdm,
            &mut state,
            Item {
                key,
                value,
                units,
                line: Some(n),
            },
        );
    }
    cdm
}

fn flatten(e: &crate::ndm_xml::Element, aliases: &BTreeMap<String, String>, out: &mut Vec<Item>) {
    for c in &e.children {
        if c.children.is_empty() {
            let key = if c.name == "COMMENT" {
                c.name.clone()
            } else {
                aliases
                    .get(&c.name)
                    .cloned()
                    .unwrap_or_else(|| c.name.clone())
            };
            out.push(Item {
                key,
                value: c.text.clone(),
                units: c.attr("units").map(str::to_string),
                line: None,
            });
        } else {
            flatten(c, aliases, out);
        }
    }
}

fn parse_xml(text: &str, aliases: &BTreeMap<String, String>, rep: &mut Report) -> Cdm {
    let mut cdm = Cdm::default();
    let doc = match crate::ndm_xml::parse(text) {
        Ok(d) => d,
        Err(e) => {
            rep.push(
                Severity::Error,
                "parse",
                rule("§6.4"),
                None,
                None,
                crate::t!("orbit-data-parse-failed", err = e),
            );
            return cdm;
        }
    };
    if doc.name != "cdm" {
        rep.push(
            Severity::Error,
            "xml-root",
            rule("§4.3.3.1"),
            None,
            None,
            crate::t!(
                "orbit-data-xml-root",
                name = doc.name.as_str(),
                want = "cdm"
            ),
        );
        return cdm;
    }
    if doc.attr("id") != Some("CCSDS_CDM_VERS") {
        rep.push(
            Severity::Error,
            "xml-attr",
            rule("§4.3.3.8"),
            None,
            Some("id"),
            crate::t!("orbit-data-xml-attr", attr = "id", want = "CCSDS_CDM_VERS"),
        );
    }
    let version = doc.attr("version").unwrap_or("").to_string();
    cdm.header.items.push(Item {
        key: "CCSDS_CDM_VERS".into(),
        value: version,
        units: None,
        line: None,
    });
    if let Some(h) = doc.child("header") {
        flatten(h, aliases, &mut cdm.header.items);
    } else {
        rep.push(
            Severity::Error,
            "xml-structure",
            rule("§4.2.1"),
            None,
            None,
            crate::t!("orbit-data-xml-missing", tag = "<header>"),
        );
    }
    let Some(body) = doc.child("body") else {
        rep.push(
            Severity::Error,
            "xml-structure",
            rule("§4.2.1"),
            None,
            None,
            crate::t!("orbit-data-xml-missing", tag = "<body>"),
        );
        return cdm;
    };
    match body.child("relativeMetadataData") {
        Some(r) => flatten(r, aliases, &mut cdm.relative.items),
        None => rep.push(
            Severity::Error,
            "xml-structure",
            rule("§4.3.5.2"),
            None,
            None,
            crate::t!("orbit-data-xml-missing", tag = "<relativeMetadataData>"),
        ),
    }
    for seg in body.children_named("segment") {
        let mut s = Section::default();
        for part in ["metadata", "data"] {
            match seg.child(part) {
                Some(p) => flatten(p, aliases, &mut s.items),
                None => rep.push(
                    Severity::Error,
                    "xml-structure",
                    rule("§4.3.5.4"),
                    None,
                    None,
                    crate::t!("orbit-data-xml-missing", tag = format!("<{part}>")),
                ),
            }
        }
        cdm.objects.push(s);
    }
    cdm
}

fn check_value(kw: &Kw, it: &Item, part: Part, rep: &mut Report) {
    let v = it.value.as_str();
    let key = it.key.as_str();
    if v.is_empty() {
        rep.push(
            Severity::Error,
            "empty-value",
            rule("§6.2.3.1"),
            it.line,
            Some(key),
            crate::t!("orbit-data-empty-value", key = key),
        );
        return;
    }
    let bad = |rep: &mut Report, code: &'static str, sec: &str, msg: String| {
        rep.push(Severity::Error, code, rule(sec), it.line, Some(key), msg)
    };
    let table_sec = match part {
        Part::Header => "Table 3-1",
        Part::Relative => "Table 3-2",
        Part::Object => {
            if META.iter().any(|m| m.key == key) {
                "Table 3-3"
            } else {
                "Table 3-4"
            }
        }
    };
    match kw.kind {
        Kind::Time => {
            if v.ends_with('Z') || crate::norad::epoch_days_1950(v).is_err() || !v.contains('T') {
                bad(
                    rep,
                    "time-format",
                    "§6.3.2.6",
                    crate::t!("orbit-data-bad-time", key = key, value = v),
                );
            }
        }
        Kind::Num => {
            if !is_kvn_number(v) {
                bad(
                    rep,
                    "number-format",
                    "§6.3.2.2-6.3.2.3",
                    crate::t!("orbit-data-bad-number", key = key, value = v),
                );
            } else if let (Some((lo, hi)), Ok(x)) = (kw.range, v.parse::<f64>()) {
                if !(lo..=hi).contains(&x) {
                    bad(
                        rep,
                        "out-of-range",
                        table_sec,
                        crate::t!(
                            "orbit-data-out-of-range",
                            key = key,
                            value = v,
                            range = format!("{} - {}", fmt_num(lo), fmt_num(hi))
                        ),
                    );
                }
            }
        }
        Kind::Int => {
            if !is_kvn_integer(v) {
                bad(
                    rep,
                    "integer-format",
                    "§6.3.2.1",
                    crate::t!("orbit-data-bad-integer", key = key, value = v),
                );
            }
        }
        Kind::Version => {
            let ok = v.split_once('.').is_some_and(|(a, b)| {
                !a.is_empty()
                    && !b.is_empty()
                    && a.bytes().all(|c| c.is_ascii_digit())
                    && b.bytes().all(|c| c.is_ascii_digit())
            });
            if !ok {
                bad(
                    rep,
                    "version-format",
                    "Table 3-1",
                    crate::t!(
                        "orbit-data-bad-value",
                        key = key,
                        value = v,
                        allowed = "x.y"
                    ),
                );
            } else if v != "1.0" {
                rep.push(
                    Severity::Warning,
                    "version",
                    rule("Table 3-1"),
                    it.line,
                    Some(key),
                    crate::t!("orbit-data-version", value = v, want = "1.0"),
                );
            }
        }
        Kind::Ident => {
            if v.chars()
                .any(|c| !(c.is_ascii_alphanumeric() || c == '_' || c == '-' || c == ' '))
            {
                bad(
                    rep,
                    "identifier-chars",
                    "§5.2.9",
                    crate::t!("orbit-data-bad-chars", key = key, value = v),
                );
            } else if v.contains(' ') {
                rep.push(
                    Severity::Warning,
                    "identifier-blank",
                    rule("§5.2.9"),
                    it.line,
                    Some(key),
                    crate::t!("orbit-data-identifier-blank", key = key, value = v),
                );
            }
        }
        Kind::Intl => {
            if v != "UNKNOWN" && !is_intl_designator(v) {
                bad(
                    rep,
                    "designator-format",
                    "Table 3-3",
                    crate::t!(
                        "orbit-data-bad-value",
                        key = key,
                        value = v,
                        allowed = "YYYY-NNNP{PP}, UNKNOWN"
                    ),
                );
            }
        }
        Kind::Choice(opts) => {
            // §6.3.2.5: an underscore in a text value is a blank.
            let norm = v.replace('_', " ");
            if !opts.contains(&norm.as_str()) {
                bad(
                    rep,
                    "normative-value",
                    table_sec,
                    crate::t!(
                        "orbit-data-bad-value",
                        key = key,
                        value = v,
                        allowed = opts.join(", ")
                    ),
                );
            }
        }
        Kind::Text => {}
    }
    if matches!(
        kw.kind,
        Kind::Text | Kind::Ident | Kind::Choice(_) | Kind::Intl
    ) && v.chars().any(|c| c.is_lowercase())
    {
        bad(
            rep,
            "lower-case",
            "§6.2.3.3",
            crate::t!("orbit-data-lower-case", key = key, value = v),
        );
    }
    match (&it.units, kw.units) {
        (Some(u), Some(want)) if u != want => bad(
            rep,
            "units",
            "§6.2.4.1",
            crate::t!(
                "orbit-data-bad-units",
                key = key,
                given = u.as_str(),
                want = want
            ),
        ),
        (None, Some(want)) => bad(
            rep,
            "units-missing",
            "§6.2.4.1",
            crate::t!("orbit-data-missing-units", key = key, want = want),
        ),
        (Some(u), None) => bad(
            rep,
            "units",
            "§6.2.4.1-6.2.4.2",
            crate::t!(
                "orbit-data-bad-units",
                key = key,
                given = u.as_str(),
                want = "-"
            ),
        ),
        _ => {}
    }
}

/// `YYYY-NNNP{PP}`: four digits, a dash, three digits, and one to three capital letters.
fn is_intl_designator(v: &str) -> bool {
    let b = v.as_bytes();
    b.len() >= 9
        && b.len() <= 11
        && b[..4].iter().all(u8::is_ascii_digit)
        && b[4] == b'-'
        && b[5..8].iter().all(u8::is_ascii_digit)
        && b[8..].iter().all(u8::is_ascii_uppercase)
}

fn check_section(part: Part, s: &Section, rep: &mut Report) {
    let mut last: Option<(usize, &str)> = None;
    let mut seen: Vec<&str> = Vec::new();
    for it in s.items.iter().filter(|i| i.key != "COMMENT") {
        let key = it.key.as_str();
        let Some(pos) = position(part, key) else {
            rep.push(
                Severity::Error,
                "unknown-keyword",
                rule("§6.3.1.3"),
                it.line,
                Some(key),
                crate::t!(
                    "orbit-data-unknown-keyword",
                    key = key,
                    section = part.label()
                ),
            );
            continue;
        };
        if seen.contains(&key) {
            rep.push(
                Severity::Error,
                "duplicate-keyword",
                rule("§6.3.1.9"),
                it.line,
                Some(key),
                crate::t!(
                    "orbit-data-duplicate-keyword",
                    key = key,
                    section = part.label()
                ),
            );
            continue;
        }
        seen.push(key);
        if let Some((lp, lk)) = last {
            if pos < lp {
                rep.push(
                    Severity::Error,
                    "keyword-order",
                    rule("§6.3.1.9"),
                    it.line,
                    Some(key),
                    crate::t!("orbit-data-keyword-order", key = key, prev = lk),
                );
            }
        }
        last = Some((pos, key));
        if let Some(kw) = kw_of(part, key) {
            check_value(&kw, it, part, rep);
        }
    }
    let req: Vec<&str> = match part {
        Part::Object => META
            .iter()
            .chain(DATA.iter())
            .filter(|k| k.req)
            .map(|k| k.key)
            .chain(COV.iter().take(21).map(|(c, _)| *c))
            .collect(),
        _ => table(part)
            .into_iter()
            .filter(|k| k.req)
            .map(|k| k.key)
            .collect(),
    };
    let sec = match part {
        Part::Header => "Table 3-1",
        Part::Relative => "Table 3-2",
        Part::Object => "Tables 3-3, 3-4",
    };
    for r in req {
        if !s.items.iter().any(|i| i.key == r) {
            rep.push(
                Severity::Error,
                "missing-keyword",
                rule(sec),
                None,
                Some(r),
                crate::t!(
                    "orbit-data-missing-keyword",
                    key = r,
                    section = part.label()
                ),
            );
        }
    }
}

/// An object's state vector in km and km/s, when all six components are numbers.
pub fn state(s: &Section) -> Option<[f64; 6]> {
    let mut x = [0.0; 6];
    for (i, k) in ["X", "Y", "Z", "X_DOT", "Y_DOT", "Z_DOT"]
        .iter()
        .enumerate()
    {
        x[i] = s.num(k)?;
    }
    Some(x)
}

/// An object's covariance in RTN (m, m/s; 6x6, or up to 9x9 with the optional rows), when every
/// term of each included row is a number.
pub fn covariance(s: &Section) -> Option<Vec<Vec<f64>>> {
    let rows = [6usize, 7, 8, 9]
        .into_iter()
        .take_while(|&n| {
            COV[..n * (n + 1) / 2]
                .iter()
                .all(|(c, _)| s.num(c).is_some())
        })
        .last()?;
    let mut m = vec![vec![0.0; rows]; rows];
    let mut idx = 0;
    for i in 0..rows {
        for j in 0..=i {
            let v = s.num(COV[idx].0)?;
            m[i][j] = v;
            m[j][i] = v;
            idx += 1;
        }
    }
    Some(m)
}

fn cross(a: [f64; 3], b: [f64; 3]) -> [f64; 3] {
    [
        a[1] * b[2] - a[2] * b[1],
        a[2] * b[0] - a[0] * b[2],
        a[0] * b[1] - a[1] * b[0],
    ]
}
fn dot(a: [f64; 3], b: [f64; 3]) -> f64 {
    a[0] * b[0] + a[1] * b[1] + a[2] * b[2]
}
fn unit(a: [f64; 3]) -> [f64; 3] {
    let n = dot(a, a).sqrt();
    [a[0] / n, a[1] / n, a[2] / n]
}

/// The RTN axes of a state (annex E): R along the position, N along the angular momentum,
/// T = N x R.
pub fn rtn_axes(x: &[f64; 6]) -> [[f64; 3]; 3] {
    let r = [x[0], x[1], x[2]];
    let v = [x[3], x[4], x[5]];
    let ru = unit(r);
    let nu = unit(cross(r, v));
    let tu = cross(nu, ru);
    [ru, tu, nu]
}

/// The relative state of Object2 with respect to Object1 at TCA, in metres and metres per second,
/// as the CDM defines it (Table 3-2, annex E): `[|dr|, |dv|, R, T, N, R_dot, T_dot, N_dot]`.
pub fn relative_state(o1: &[f64; 6], o2: &[f64; 6]) -> [f64; 8] {
    let dr = [
        (o2[0] - o1[0]) * 1e3,
        (o2[1] - o1[1]) * 1e3,
        (o2[2] - o1[2]) * 1e3,
    ];
    let dv = [
        (o2[3] - o1[3]) * 1e3,
        (o2[4] - o1[4]) * 1e3,
        (o2[5] - o1[5]) * 1e3,
    ];
    let ax = rtn_axes(o1);
    [
        dot(dr, dr).sqrt(),
        dot(dv, dv).sqrt(),
        dot(dr, ax[0]),
        dot(dr, ax[1]),
        dot(dr, ax[2]),
        dot(dv, ax[0]),
        dot(dv, ax[1]),
        dot(dv, ax[2]),
    ]
}

/// Tolerances of the consistency checks: a value agrees with the one computed from the states when
/// they differ by at most `abs + rel * |computed|`.
#[derive(Clone, Copy, Debug)]
pub struct Tolerance {
    /// Absolute part, metres for distances, metres per second for speeds.
    pub abs: f64,
    /// Relative part.
    pub rel: f64,
}

/// The default consistency tolerance: 1 m (or 1 m/s for speeds) plus 0.5 %. It absorbs the
/// rounding of values given to whole metres; it is a choice of this checker, not of the standard.
pub const DEFAULT_TOLERANCE: Tolerance = Tolerance {
    abs: 1.0,
    rel: 0.005,
};

fn consistency(cdm: &Cdm, rep: &mut Report, tol: Tolerance) {
    let rel = &cdm.relative;
    let src = rule("Table 3-2, annex E");
    if let (Some(a), Some(b)) = (
        cdm.objects.first().and_then(state),
        cdm.objects.get(1).and_then(state),
    ) {
        let c = relative_state(&a, &b);
        let checks = [
            ("MISS_DISTANCE", c[0], "m"),
            ("RELATIVE_SPEED", c[1], "m/s"),
            ("RELATIVE_POSITION_R", c[2], "m"),
            ("RELATIVE_POSITION_T", c[3], "m"),
            ("RELATIVE_POSITION_N", c[4], "m"),
            ("RELATIVE_VELOCITY_R", c[5], "m/s"),
            ("RELATIVE_VELOCITY_T", c[6], "m/s"),
            ("RELATIVE_VELOCITY_N", c[7], "m/s"),
        ];
        for (key, computed, unit) in checks {
            let Some(given) = rel.num(key) else { continue };
            if (given - computed).abs() > tol.abs + tol.rel * computed.abs() {
                let line = rel.items.iter().find(|i| i.key == key).and_then(|i| i.line);
                rep.push(
                    Severity::Warning,
                    "inconsistent",
                    src.clone(),
                    line,
                    Some(key),
                    crate::t!(
                        "orbit-data-inconsistent",
                        key = key,
                        given = fmt_num(given),
                        computed = fmt_num(computed),
                        unit = unit
                    ),
                );
            }
        }
    }
    let order = |rep: &mut Report, s: &Section, a: &str, b: &str, sec: &str| {
        if let (Some(x), Some(y)) = (s.get(a), s.get(b)) {
            if seconds_between(x, y).is_some_and(|d| d < 0.0) {
                rep.push(
                    Severity::Warning,
                    "time-order",
                    rule(sec),
                    None,
                    Some(a),
                    crate::t!("orbit-data-time-order", first = a, a = x, second = b, b = y),
                );
            }
        }
    };
    let mut r2 = rel.clone();
    r2.items.extend(cdm.header.items.iter().cloned());
    order(rep, &r2, "START_SCREEN_PERIOD", "TCA", "Table 3-2");
    order(rep, &r2, "TCA", "STOP_SCREEN_PERIOD", "Table 3-2");
    order(rep, &r2, "SCREEN_ENTRY_TIME", "TCA", "Table 3-2");
    order(rep, &r2, "TCA", "SCREEN_EXIT_TIME", "Table 3-2");
    order(
        rep,
        &r2,
        "START_SCREEN_PERIOD",
        "STOP_SCREEN_PERIOD",
        "Table 3-2",
    );
    for o in &cdm.objects {
        order(rep, o, "TIME_LASTOB_START", "TIME_LASTOB_END", "Table 3-4");
        let mut o2 = o.clone();
        o2.items.extend(cdm.header.items.iter().cloned());
        order(rep, &o2, "TIME_LASTOB_END", "CREATION_DATE", "Table 3-4");
        for (used, avail) in [
            ("OBS_USED", "OBS_AVAILABLE"),
            ("TRACKS_USED", "TRACKS_AVAILABLE"),
        ] {
            if let (Some(u), Some(a)) = (o.num(used), o.num(avail)) {
                if u > a {
                    rep.push(
                        Severity::Warning,
                        "count-order",
                        rule("Table 3-4"),
                        None,
                        Some(used),
                        crate::t!(
                            "orbit-data-count-order",
                            used = used,
                            a = fmt_num(u),
                            avail = avail,
                            b = fmt_num(a)
                        ),
                    );
                }
            }
        }
    }
}

/// Apply the keyword tables and the consistency checks to a parsed CDM, adding to `rep`.
pub fn check(cdm: &Cdm, rep: &mut Report) {
    check_with(cdm, rep, DEFAULT_TOLERANCE)
}

/// As [`check`], with the consistency tolerance given.
pub fn check_with(cdm: &Cdm, rep: &mut Report, tol: Tolerance) {
    check_section(Part::Header, &cdm.header, rep);
    check_section(Part::Relative, &cdm.relative, rep);
    if cdm.objects.len() != 2 {
        rep.push(
            Severity::Error,
            "object-count",
            rule("§2.2, §4.2.2"),
            None,
            Some("OBJECT"),
            crate::t!("orbit-data-cdm-object-count", n = cdm.objects.len()),
        );
    }
    for (i, o) in cdm.objects.iter().enumerate() {
        check_section(Part::Object, o, rep);
        let want = if i == 0 { "OBJECT1" } else { "OBJECT2" };
        if let Some(v) = o.get("OBJECT") {
            if v != want && i < 2 {
                rep.push(
                    Severity::Error,
                    "object-order",
                    rule("§4.3.7.2"),
                    o.items
                        .iter()
                        .find(|x| x.key == "OBJECT")
                        .and_then(|x| x.line),
                    Some("OBJECT"),
                    crate::t!(
                        "orbit-data-bad-value",
                        key = "OBJECT",
                        value = v,
                        allowed = want
                    ),
                );
            }
        }
        // §5.2.8: rows 7 to 9 are all-or-nothing, each needing the rows before it.
        let present = |r: usize| -> (bool, bool) {
            let lo = r * (r - 1) / 2;
            let row = &COV[lo..lo + r];
            let any = row.iter().any(|(c, _)| o.get(c).is_some());
            let all = row.iter().all(|(c, _)| o.get(c).is_some());
            (any, all)
        };
        let mut prev_full = true;
        for r in 7..=9 {
            let (any, all) = present(r);
            if any && (!all || !prev_full) {
                rep.push(
                    Severity::Error,
                    "covariance-rows",
                    rule("§5.2.8"),
                    None,
                    None,
                    crate::t!("orbit-data-cov-row", row = r),
                );
            }
            prev_full = all;
        }
        if let Some(m) = covariance(o) {
            let six: Vec<Vec<f64>> = m.iter().take(6).map(|r| r[..6].to_vec()).collect();
            if six.iter().enumerate().any(|(j, r)| r[j] == 0.0) {
                rep.push(
                    Severity::Warning,
                    "covariance-zero-diagonal",
                    rule("§5.2.8"),
                    None,
                    None,
                    crate::t!("orbit-data-cov-zero-diagonal", at = want),
                );
            } else {
                let pd = pd_check(&six);
                if !pd.positive_definite {
                    rep.push(
                        Severity::Warning,
                        "covariance-not-pd",
                        rule("Table 3-4"),
                        None,
                        None,
                        crate::t!(
                            "orbit-data-not-pd",
                            at = want,
                            min = fmt_num(pd.min_corr_eigenvalue)
                        ),
                    );
                }
            }
        }
    }
    if let (Some(a), Some(b)) = (
        cdm.objects.first().and_then(|o| o.get("REF_FRAME")),
        cdm.objects.get(1).and_then(|o| o.get("REF_FRAME")),
    ) {
        if a != b {
            rep.push(
                Severity::Error,
                "frame-mismatch",
                rule("Table 3-3"),
                None,
                Some("REF_FRAME"),
                crate::t!("orbit-data-frame-mismatch", a = a, b = b),
            );
        }
    }
    consistency(cdm, rep, tol);
}

impl Cdm {
    /// Write the message in KVN with the keywords of each section in the standard's order
    /// (comments stay with the keyword they precede) and the standard units. Keywords the standard
    /// does not define are left out.
    pub fn to_kvn(&self) -> String {
        let mut o = String::new();
        let mut write = |part: Part, s: &Section| {
            let mut groups: Vec<(usize, Vec<&Item>)> = Vec::new();
            let mut pending: Vec<&Item> = Vec::new();
            for it in &s.items {
                if it.key == "COMMENT" {
                    pending.push(it);
                    continue;
                }
                let Some(p) = position(part, &it.key) else {
                    continue;
                };
                pending.push(it);
                groups.push((p, std::mem::take(&mut pending)));
            }
            groups.sort_by_key(|g| g.0);
            for (_, g) in groups {
                for it in g {
                    if it.key == "COMMENT" {
                        o.push_str(&format!("COMMENT {}\n", it.value));
                        continue;
                    }
                    let units = kw_of(part, &it.key).and_then(|kw| kw.units);
                    match units {
                        Some(u) => o.push_str(&format!("{:<28} = {} [{u}]\n", it.key, it.value)),
                        None => o.push_str(&format!("{:<28} = {}\n", it.key, it.value)),
                    }
                }
            }
            for it in pending {
                o.push_str(&format!("COMMENT {}\n", it.value));
            }
        };
        write(Part::Header, &self.header);
        write(Part::Relative, &self.relative);
        for ob in &self.objects {
            write(Part::Object, ob);
        }
        o
    }
}

/// Read an alias table: a JSON object of `"non-standard name": "STANDARD_KEYWORD"`. Names are
/// matched in upper case. A target that is not a CDM keyword is an error.
pub fn parse_aliases(text: &str) -> Result<BTreeMap<String, String>, String> {
    let v: serde_json::Value = serde_json::from_str(text).map_err(|e| e.to_string())?;
    let obj = v
        .as_object()
        .ok_or_else(|| crate::terr!("e-orbit-data-aliases-not-object"))?;
    let mut out = BTreeMap::new();
    for (k, t) in obj {
        let t = t
            .as_str()
            .ok_or_else(|| crate::terr!("e-orbit-data-alias-target", key = k.as_str()))?;
        let known = [Part::Header, Part::Relative, Part::Object]
            .into_iter()
            .any(|p| position(p, t).is_some());
        if !known {
            return Err(crate::terr!("e-orbit-data-alias-target", key = k.as_str()));
        }
        out.insert(k.to_ascii_uppercase(), t.to_string());
    }
    Ok(out)
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn designators() {
        assert!(is_intl_designator("1997-030E"));
        assert!(is_intl_designator("1998-037ABC"));
        assert!(!is_intl_designator("1998-37A"));
        assert!(!is_intl_designator("1998-037abc"));
        assert!(!is_intl_designator("1998-037ABCD"));
    }

    #[test]
    fn rtn_of_a_circular_orbit() {
        let o1 = [7000.0, 0.0, 0.0, 0.0, 7.5, 0.0];
        let o2 = [7000.001, 0.002, 0.003, 0.0, 7.5, 0.0];
        let c = relative_state(&o1, &o2);
        assert!((c[2] - 1.0).abs() < 1e-6 && (c[3] - 2.0).abs() < 1e-6);
        assert!((c[4] - 3.0).abs() < 1e-6);
    }
}
