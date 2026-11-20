// SPDX-License-Identifier: AGPL-3.0-only
//! Checks of the CCSDS Orbit Ephemeris Message (OEM, section 5) and Orbit Comprehensive Message
//! (OCM, section 6) of CCSDS 502.0-B-3 (Recommended Standard, Issue 3, April 2023), in KVN.
//!
//! The OEM is read leniently into an [`OemDoc`] that keeps what the engine's own OEM reader
//! ([`crate::oem::parse_oem`]) skips: comments, `USEABLE_*`, `INTERPOLATION*` and the covariance
//! blocks. The OCM is read by [`crate::odm::OcmMessage::parse`] (its syntax and keyword checks);
//! `PERT` and `OD` blocks, which that reader does not support, are set aside and reported as not
//! checked.
//!
//! On top of the syntax the checks cover the time rules (data inside START_TIME..STOP_TIME, time
//! tags increasing and not repeated, one time form per OCM block, a fixed TIME_SYSTEM), useable
//! spans (inside the total span, not overlapping between consecutive blocks), enough data lines for
//! the stated interpolation degree, the covariance layout, and positive definiteness of every
//! covariance (an OCM rule, §6.2.7.10; a warning for the OEM, which states no such rule).
//!
//! An optional [`Profile`] adds limits a receiving system may set (a minimum useable span, a
//! largest gap between data lines). Profile findings are warnings labelled `profile`: they are the
//! caller's limits, not the standard's.

use super::{fmt_num, matrix_from_ordering, pd_check, Report, Severity};
use crate::norad::epoch_days_1950;

/// The standard this module checks against.
pub const STANDARD: &str = "CCSDS 502.0-B-3 (April 2023)";

fn rule(sec: &str) -> String {
    format!("CCSDS 502.0-B-3 {sec}")
}

/// Limits a receiving system may set on an ephemeris, beyond the standard.
#[derive(Clone, Copy, Debug, Default)]
pub struct Profile {
    /// Smallest acceptable useable span of the whole message, days.
    pub min_span_days: Option<f64>,
    /// Largest acceptable step between consecutive data lines, seconds.
    pub max_gap_s: Option<f64>,
}

/// A `KEYWORD = value` with its 1-based line.
#[derive(Clone, Debug, PartialEq)]
pub struct Kv {
    /// Keyword.
    pub key: String,
    /// Value, units removed.
    pub value: String,
    /// Line.
    pub line: usize,
}

/// One OEM covariance matrix.
#[derive(Clone, Debug, Default, PartialEq)]
pub struct OemCov {
    /// Comments before the matrix.
    pub comments: Vec<String>,
    /// `EPOCH`.
    pub epoch: Option<String>,
    /// `COV_REF_FRAME`.
    pub frame: Option<String>,
    /// The lower-triangular values as written.
    pub values: Vec<String>,
    /// Line of the `EPOCH` keyword (or of the first value).
    pub line: usize,
}

/// One OEM segment: metadata, ephemeris lines and covariance matrices.
#[derive(Clone, Debug, Default, PartialEq)]
pub struct OemSeg {
    /// Metadata comments.
    pub meta_comments: Vec<String>,
    /// Metadata keywords.
    pub meta: Vec<Kv>,
    /// Comments at the start of the data.
    pub data_comments: Vec<String>,
    /// Ephemeris lines: line number and tokens (epoch first).
    pub lines: Vec<(usize, Vec<String>)>,
    /// Covariance matrices.
    pub covs: Vec<OemCov>,
}

impl OemSeg {
    /// The value of metadata keyword `key`.
    pub fn get(&self, key: &str) -> Option<&str> {
        self.meta
            .iter()
            .find(|k| k.key == key)
            .map(|k| k.value.as_str())
    }
}

/// An OEM as read, nothing dropped.
#[derive(Clone, Debug, Default, PartialEq)]
pub struct OemDoc {
    /// Header comments.
    pub header_comments: Vec<String>,
    /// Header keywords, `CCSDS_OEM_VERS` first.
    pub header: Vec<Kv>,
    /// Segments.
    pub segments: Vec<OemSeg>,
}

impl OemDoc {
    /// The value of header keyword `key`.
    pub fn get(&self, key: &str) -> Option<&str> {
        self.header
            .iter()
            .find(|k| k.key == key)
            .map(|k| k.value.as_str())
    }
}

const OEM_HEADER: &[&str] = &[
    "CCSDS_OEM_VERS",
    "CLASSIFICATION",
    "CREATION_DATE",
    "ORIGINATOR",
    "MESSAGE_ID",
];
const OEM_META: &[&str] = &[
    "OBJECT_NAME",
    "OBJECT_ID",
    "CENTER_NAME",
    "REF_FRAME",
    "REF_FRAME_EPOCH",
    "TIME_SYSTEM",
    "START_TIME",
    "USEABLE_START_TIME",
    "USEABLE_STOP_TIME",
    "STOP_TIME",
    "INTERPOLATION",
    "INTERPOLATION_DEGREE",
];
const OEM_META_REQ: &[&str] = &[
    "OBJECT_NAME",
    "OBJECT_ID",
    "CENTER_NAME",
    "REF_FRAME",
    "TIME_SYSTEM",
    "START_TIME",
    "STOP_TIME",
];

fn split_kv(l: &str) -> Option<(String, String)> {
    let (k, v) = l.split_once('=')?;
    let k = k.trim();
    if k.is_empty() || k.contains(char::is_whitespace) {
        return None;
    }
    let mut v = v.trim();
    if v.ends_with(']') {
        if let Some(i) = v.rfind('[') {
            v = v[..i].trim_end();
        }
    }
    Some((k.to_string(), v.to_string()))
}

fn comment(l: &str) -> Option<String> {
    let c = l.strip_prefix("COMMENT")?;
    (c.is_empty() || c.starts_with(' ')).then(|| c.trim_start().to_string())
}

/// Read an OEM in KVN leniently. Lines that fit nowhere become error findings in `rep`.
pub fn read_oem(text: &str, rep: &mut Report) -> OemDoc {
    #[derive(PartialEq)]
    enum St {
        Header,
        Meta,
        Data,
        Cov,
    }
    let mut doc = OemDoc::default();
    let mut st = St::Header;
    for (i, raw) in text.lines().enumerate() {
        let n = i + 1;
        let l = raw.trim();
        if l.is_empty() {
            continue;
        }
        let bad = |rep: &mut Report, sec: &str| {
            rep.push(
                Severity::Error,
                "unexpected-line",
                rule(sec),
                Some(n),
                None,
                crate::t!("orbit-data-not-key-value", text = l),
            )
        };
        match st {
            St::Header => {
                if l == "META_START" {
                    doc.segments.push(OemSeg::default());
                    st = St::Meta;
                } else if let Some(c) = comment(l) {
                    doc.header_comments.push(c);
                } else if let Some((key, value)) = split_kv(l) {
                    doc.header.push(Kv {
                        key,
                        value,
                        line: n,
                    });
                } else {
                    bad(rep, "§5.2.2");
                }
            }
            St::Meta => {
                let seg = doc
                    .segments
                    .last_mut()
                    .expect("META_START opened a segment");
                if l == "META_STOP" {
                    st = St::Data;
                } else if let Some(c) = comment(l) {
                    seg.meta_comments.push(c);
                } else if let Some((key, value)) = split_kv(l) {
                    seg.meta.push(Kv {
                        key,
                        value,
                        line: n,
                    });
                } else {
                    bad(rep, "§5.2.3");
                }
            }
            St::Data => {
                let seg = doc
                    .segments
                    .last_mut()
                    .expect("META_START opened a segment");
                if l == "META_START" {
                    doc.segments.push(OemSeg::default());
                    st = St::Meta;
                } else if l == "COVARIANCE_START" {
                    st = St::Cov;
                } else if let Some(c) = comment(l) {
                    if seg.lines.is_empty() {
                        seg.data_comments.push(c);
                    }
                } else {
                    seg.lines
                        .push((n, l.split_whitespace().map(str::to_string).collect()));
                }
            }
            St::Cov => {
                let seg = doc
                    .segments
                    .last_mut()
                    .expect("META_START opened a segment");
                if l == "COVARIANCE_STOP" {
                    st = St::Data;
                } else if let Some(c) = comment(l) {
                    seg.covs.push(OemCov {
                        comments: vec![c],
                        line: n,
                        ..Default::default()
                    });
                } else if let Some((key, value)) = split_kv(l) {
                    let start_new = match seg.covs.last() {
                        None => true,
                        Some(c) => {
                            !c.values.is_empty()
                                || (key == "EPOCH" && c.epoch.is_some())
                                || (key == "COV_REF_FRAME" && c.frame.is_some())
                        }
                    };
                    if start_new {
                        seg.covs.push(OemCov {
                            line: n,
                            ..Default::default()
                        });
                    }
                    let c = seg.covs.last_mut().expect("a matrix was opened above");
                    match key.as_str() {
                        "EPOCH" => c.epoch = Some(value),
                        "COV_REF_FRAME" => c.frame = Some(value),
                        _ => bad(rep, "§5.2.5, Table 5-4"),
                    }
                } else {
                    if seg.covs.last().is_none_or(|c| c.values.len() >= 21) {
                        seg.covs.push(OemCov {
                            line: n,
                            ..Default::default()
                        });
                    }
                    let c = seg.covs.last_mut().expect("a matrix was opened above");
                    c.values.extend(l.split_whitespace().map(str::to_string));
                }
            }
        }
    }
    if st == St::Meta || st == St::Cov {
        rep.push(
            Severity::Error,
            "unterminated",
            rule("§5.2"),
            None,
            None,
            crate::t!("orbit-data-unterminated"),
        );
    }
    doc
}

fn time_ok(rep: &mut Report, kv: &Kv, sec: &str) -> Option<f64> {
    match epoch_days_1950(&kv.value) {
        Ok(d) => Some(d),
        Err(_) => {
            rep.push(
                Severity::Error,
                "time-format",
                rule(sec),
                Some(kv.line),
                Some(&kv.key),
                crate::t!(
                    "orbit-data-bad-time",
                    key = kv.key.as_str(),
                    value = kv.value.as_str()
                ),
            );
            None
        }
    }
}

/// Span and gap findings of the optional profile, from the useable intervals and data epochs.
fn profile_checks(rep: &mut Report, spans: &[(f64, f64)], epochs: &[Vec<f64>], p: Profile) {
    if let Some(min) = p.min_span_days {
        let lo = spans.iter().map(|s| s.0).fold(f64::INFINITY, f64::min);
        let hi = spans.iter().map(|s| s.1).fold(f64::NEG_INFINITY, f64::max);
        let span = if hi >= lo { hi - lo } else { 0.0 };
        if span < min {
            rep.push(
                Severity::Warning,
                "profile-span",
                "profile",
                None,
                None,
                crate::t!(
                    "orbit-data-span-short",
                    days = fmt_num(span),
                    min = fmt_num(min)
                ),
            );
        }
    }
    if let Some(max) = p.max_gap_s {
        let mut worst: f64 = 0.0;
        for e in epochs {
            for w in e.windows(2) {
                worst = worst.max((w[1] - w[0]) * 86_400.0);
            }
        }
        let mut sorted = spans.to_vec();
        sorted.sort_by(|a, b| a.0.total_cmp(&b.0));
        for w in sorted.windows(2) {
            worst = worst.max((w[1].0 - w[0].1) * 86_400.0);
        }
        if worst > max * (1.0 + 1e-9) + 1e-6 {
            rep.push(
                Severity::Warning,
                "profile-gap",
                "profile",
                None,
                None,
                crate::t!("orbit-data-gap", s = fmt_num(worst), max = fmt_num(max)),
            );
        }
    }
}

fn cov_pd(
    rep: &mut Report,
    m: &[Vec<f64>],
    at: &str,
    line: Option<usize>,
    sev: Severity,
    sec: &str,
) {
    let pd = pd_check(m);
    if !pd.positive_definite {
        rep.push(
            sev,
            "covariance-not-pd",
            rule(sec),
            line,
            None,
            crate::t!(
                "orbit-data-not-pd",
                at = at,
                min = fmt_num(pd.min_corr_eigenvalue)
            ),
        );
    }
}

/// Check an OEM (KVN).
pub fn check_oem(text: &str, profile: Profile) -> (OemDoc, Report) {
    let mut rep = Report::new("OEM", STANDARD);
    let doc = read_oem(text, &mut rep);
    match doc.header.first() {
        Some(k) if k.key == "CCSDS_OEM_VERS" => {
            if !matches!(k.value.as_str(), "1.0" | "2.0" | "3.0") {
                rep.push(
                    Severity::Warning,
                    "version",
                    rule("Table 5-2"),
                    Some(k.line),
                    Some("CCSDS_OEM_VERS"),
                    crate::t!("orbit-data-version", value = k.value.as_str(), want = "3.0"),
                );
            }
        }
        _ => rep.push(
            Severity::Error,
            "first-line",
            rule("§7.2, Table 5-2"),
            doc.header.first().map(|k| k.line),
            None,
            crate::t!("orbit-data-first-line", key = "CCSDS_OEM_VERS"),
        ),
    }
    for k in &doc.header {
        if !OEM_HEADER.contains(&k.key.as_str()) {
            rep.push(
                Severity::Error,
                "unknown-keyword",
                rule("§5.2.2.2"),
                Some(k.line),
                Some(&k.key),
                crate::t!(
                    "orbit-data-unknown-keyword",
                    key = k.key.as_str(),
                    section = crate::t!("orbit-data-header")
                ),
            );
        }
    }
    for req in ["CREATION_DATE", "ORIGINATOR"] {
        if doc.get(req).is_none() {
            rep.push(
                Severity::Error,
                "missing-keyword",
                rule("Table 5-2"),
                None,
                Some(req),
                crate::t!(
                    "orbit-data-missing-keyword",
                    key = req,
                    section = crate::t!("orbit-data-header")
                ),
            );
        }
    }
    if let Some(k) = doc.header.iter().find(|k| k.key == "CREATION_DATE") {
        time_ok(&mut rep, k, "§7.5.10");
    }
    if doc.segments.is_empty() {
        rep.push(
            Severity::Error,
            "no-segment",
            rule("§5.2.1.2"),
            None,
            None,
            crate::t!("orbit-data-no-segment"),
        );
    }
    let mut time_system: Option<String> = None;
    let mut spans = Vec::new();
    let mut all_epochs = Vec::new();
    let mut prev_useable: Option<(String, f64, f64, usize)> = None;
    for (si, seg) in doc.segments.iter().enumerate() {
        let segno = si + 1;
        let meta_label = crate::t!("orbit-data-oem-metadata", n = segno);
        for k in &seg.meta {
            if !OEM_META.contains(&k.key.as_str()) {
                rep.push(
                    Severity::Error,
                    "unknown-keyword",
                    rule("§5.2.3.2"),
                    Some(k.line),
                    Some(&k.key),
                    crate::t!(
                        "orbit-data-unknown-keyword",
                        key = k.key.as_str(),
                        section = meta_label.as_str()
                    ),
                );
            }
        }
        for req in OEM_META_REQ {
            if seg.get(req).is_none() {
                rep.push(
                    Severity::Error,
                    "missing-keyword",
                    rule("Table 5-3"),
                    None,
                    Some(req),
                    crate::t!(
                        "orbit-data-missing-keyword",
                        key = *req,
                        section = meta_label.as_str()
                    ),
                );
            }
        }
        if seg.get("INTERPOLATION").is_some() && seg.get("INTERPOLATION_DEGREE").is_none() {
            rep.push(
                Severity::Error,
                "missing-keyword",
                rule("Table 5-3"),
                None,
                Some("INTERPOLATION_DEGREE"),
                crate::t!(
                    "orbit-data-missing-keyword",
                    key = "INTERPOLATION_DEGREE",
                    section = meta_label.as_str()
                ),
            );
        }
        if let Some(ts) = seg.get("TIME_SYSTEM") {
            match &time_system {
                Some(t) if t != ts => rep.push(
                    Severity::Error,
                    "time-system-changed",
                    rule("§5.2.4.5"),
                    seg.meta
                        .iter()
                        .find(|k| k.key == "TIME_SYSTEM")
                        .map(|k| k.line),
                    Some("TIME_SYSTEM"),
                    crate::t!("orbit-data-time-system-changed", a = t.as_str(), b = ts),
                ),
                None => time_system = Some(ts.to_string()),
                _ => {}
            }
        }
        let t = |key: &str, rep: &mut Report| {
            seg.meta
                .iter()
                .find(|k| k.key == key)
                .and_then(|k| time_ok(rep, k, "§7.5.10"))
        };
        let start = t("START_TIME", &mut rep);
        let stop = t("STOP_TIME", &mut rep);
        let ustart = t("USEABLE_START_TIME", &mut rep);
        let ustop = t("USEABLE_STOP_TIME", &mut rep);
        if let (Some(a), Some(b)) = (start, stop) {
            if b < a {
                rep.push(
                    Severity::Error,
                    "time-order",
                    rule("Table 5-3"),
                    None,
                    Some("STOP_TIME"),
                    crate::t!(
                        "orbit-data-time-order",
                        first = "START_TIME",
                        a = seg.get("START_TIME").unwrap_or(""),
                        second = "STOP_TIME",
                        b = seg.get("STOP_TIME").unwrap_or("")
                    ),
                );
            }
            for (key, u) in [("USEABLE_START_TIME", ustart), ("USEABLE_STOP_TIME", ustop)] {
                if let Some(u) = u {
                    if u < a - 1e-9 || u > b + 1e-9 {
                        rep.push(
                            Severity::Error,
                            "outside-span",
                            rule("Table 5-3"),
                            None,
                            Some(key),
                            crate::t!("orbit-data-outside-span", t = seg.get(key).unwrap_or("")),
                        );
                    }
                }
            }
        }
        if let (Some(a), Some(b)) = (ustart, ustop) {
            if b < a {
                rep.push(
                    Severity::Error,
                    "time-order",
                    rule("Table 5-3"),
                    None,
                    Some("USEABLE_STOP_TIME"),
                    crate::t!(
                        "orbit-data-time-order",
                        first = "USEABLE_START_TIME",
                        a = seg.get("USEABLE_START_TIME").unwrap_or(""),
                        second = "USEABLE_STOP_TIME",
                        b = seg.get("USEABLE_STOP_TIME").unwrap_or("")
                    ),
                );
            }
        }
        let (us, ue) = (ustart.or(start), ustop.or(stop));
        let object = seg.get("OBJECT_ID").unwrap_or("").to_string();
        if let (Some(a), Some(b)) = (us, ue) {
            if let Some((po, pa, pb, pn)) = &prev_useable {
                // §5.2.4.4: useable spans of consecutive blocks do not overlap (an endpoint may be shared).
                if *po == object && a < *pb - 1e-9 && b > *pa {
                    rep.push(
                        Severity::Error,
                        "useable-overlap",
                        rule("§5.2.4.4"),
                        None,
                        None,
                        crate::t!("orbit-data-useable-overlap", a = *pn, b = segno),
                    );
                }
            }
            prev_useable = Some((object, a, b, segno));
            spans.push((a, b));
        }
        let mut epochs = Vec::new();
        let mut prev: Option<(f64, &str)> = None;
        for (ln, toks) in &seg.lines {
            if toks.len() != 7 && toks.len() != 10 {
                rep.push(
                    Severity::Error,
                    "data-width",
                    rule("§5.2.4.1-5.2.4.2"),
                    Some(*ln),
                    None,
                    crate::t!(
                        "orbit-data-data-width",
                        n = toks.len().saturating_sub(1),
                        want = "6, 9"
                    ),
                );
                continue;
            }
            if toks[1..].iter().any(|v| v.parse::<f64>().is_err()) {
                rep.push(
                    Severity::Error,
                    "number-format",
                    rule("§7.5"),
                    Some(*ln),
                    None,
                    crate::t!(
                        "orbit-data-bad-number",
                        key = "",
                        value = toks[1..].join(" ")
                    ),
                );
                continue;
            }
            let Ok(e) = epoch_days_1950(&toks[0]) else {
                rep.push(
                    Severity::Error,
                    "time-format",
                    rule("§7.5.10"),
                    Some(*ln),
                    None,
                    crate::t!("orbit-data-bad-time", key = "", value = toks[0].as_str()),
                );
                continue;
            };
            if let (Some(a), Some(b)) = (start, stop) {
                if e < a - 1e-9 || e > b + 1e-9 {
                    rep.push(
                        Severity::Error,
                        "outside-span",
                        rule("Table 5-3"),
                        Some(*ln),
                        None,
                        crate::t!("orbit-data-outside-span", t = toks[0].as_str()),
                    );
                }
            }
            if let Some((p, ptxt)) = prev {
                if e == p {
                    rep.push(
                        Severity::Warning,
                        "duplicate-time",
                        rule("§5.2.4.7"),
                        Some(*ln),
                        None,
                        crate::t!("orbit-data-duplicate-time", t = toks[0].as_str()),
                    );
                } else if e < p {
                    rep.push(
                        Severity::Warning,
                        "time-not-increasing",
                        rule("§5.2.4.7"),
                        Some(*ln),
                        None,
                        crate::t!(
                            "orbit-data-time-not-increasing",
                            t = toks[0].as_str(),
                            prev = ptxt
                        ),
                    );
                }
            }
            prev = Some((e, toks[0].as_str()));
            epochs.push(e);
        }
        if let Some(deg) = seg.get("INTERPOLATION_DEGREE") {
            match deg.parse::<usize>() {
                Ok(d) if seg.lines.len() <= d => rep.push(
                    Severity::Error,
                    "too-few-points",
                    rule("§5.2.4.7"),
                    None,
                    Some("INTERPOLATION_DEGREE"),
                    crate::t!(
                        "orbit-data-too-few-points",
                        n = seg.lines.len(),
                        deg = d,
                        need = d.saturating_add(1)
                    ),
                ),
                Ok(_) => {}
                Err(_) => rep.push(
                    Severity::Error,
                    "integer-format",
                    rule("Table 5-3"),
                    None,
                    Some("INTERPOLATION_DEGREE"),
                    crate::t!(
                        "orbit-data-bad-integer",
                        key = "INTERPOLATION_DEGREE",
                        value = deg
                    ),
                ),
            }
        }
        all_epochs.push(epochs);
        let mut prev_cov: Option<f64> = None;
        for c in &seg.covs {
            let Some(ep) = &c.epoch else {
                rep.push(
                    Severity::Error,
                    "missing-keyword",
                    rule("§5.2.5.3"),
                    Some(c.line),
                    Some("EPOCH"),
                    crate::t!(
                        "orbit-data-missing-keyword",
                        key = "EPOCH",
                        section = crate::t!("orbit-data-covariance")
                    ),
                );
                continue;
            };
            let kv = Kv {
                key: "EPOCH".into(),
                value: ep.clone(),
                line: c.line,
            };
            let e = time_ok(&mut rep, &kv, "§7.5.10");
            if let (Some(e), Some(p)) = (e, prev_cov) {
                if e <= p {
                    rep.push(
                        Severity::Error,
                        "time-not-increasing",
                        rule("§5.2.5.7"),
                        Some(c.line),
                        Some("EPOCH"),
                        crate::t!("orbit-data-time-not-increasing", t = ep.as_str(), prev = ""),
                    );
                }
            }
            prev_cov = e.or(prev_cov);
            let vals: Vec<f64> = c.values.iter().filter_map(|v| v.parse().ok()).collect();
            if c.values.len() != 21 || vals.len() != 21 {
                rep.push(
                    Severity::Error,
                    "covariance-layout",
                    rule("§5.2.5.4"),
                    Some(c.line),
                    None,
                    crate::t!("orbit-data-data-width", n = c.values.len(), want = "21"),
                );
                continue;
            }
            let m = matrix_from_ordering(&vals, "LTM").expect("21 values make a 6x6");
            cov_pd(
                &mut rep,
                &m,
                ep,
                Some(c.line),
                Severity::Warning,
                "§5.2.5 (cf. §6.2.7.10)",
            );
        }
    }
    profile_checks(&mut rep, &spans, &all_epochs, profile);
    (doc, rep)
}

/// Remove `PERT` and `OD` blocks from an OCM in KVN (the engine's reader does not support them),
/// returning the rest and the names of the blocks removed.
fn strip_unsupported(text: &str) -> (String, Vec<String>) {
    let mut out = String::with_capacity(text.len());
    let mut removed = Vec::new();
    let mut skipping: Option<&str> = None;
    for l in text.lines() {
        let t = l.trim();
        match skipping {
            Some(tag) => {
                if t == format!("{tag}_STOP") {
                    skipping = None;
                }
            }
            None => {
                if t == "PERT_START" || t == "OD_START" {
                    let tag = if t == "PERT_START" { "PERT" } else { "OD" };
                    skipping = Some(tag);
                    removed.push(tag.to_string());
                } else {
                    out.push_str(l);
                    out.push('\n');
                }
            }
        }
    }
    (out, removed)
}

/// An OCM time tag as days since 1950: absolute, or seconds from `EPOCH_TZERO`. The flag is true
/// for a relative tag.
fn ocm_time(tag: &str, tzero: Option<f64>) -> Option<(f64, bool)> {
    if let Ok(d) = epoch_days_1950(tag) {
        return Some((d, false));
    }
    let s: f64 = tag.parse().ok()?;
    Some((tzero? + s / 86_400.0, true))
}

/// Check an OCM (KVN or XML).
pub fn check_ocm(text: &str, profile: Profile) -> Report {
    let mut rep = Report::new("OCM", STANDARD);
    let (body, removed) = if text.trim_start().starts_with('<') {
        (text.to_string(), Vec::new())
    } else {
        strip_unsupported(text)
    };
    for b in removed {
        rep.not_checked.push(b);
    }
    let m = match crate::odm::OcmMessage::parse(&body) {
        Ok(m) => m,
        Err(e) => {
            rep.push(
                Severity::Error,
                "parse",
                rule("§6"),
                None,
                None,
                crate::t!("orbit-data-parse-failed", err = e),
            );
            return rep;
        }
    };
    let meta = &m.metadata;
    let tzero = meta
        .get("EPOCH_TZERO")
        .and_then(|v| epoch_days_1950(v).ok());
    if tzero.is_none() {
        rep.push(
            Severity::Error,
            "time-format",
            rule("§7.5.10"),
            None,
            Some("EPOCH_TZERO"),
            crate::t!(
                "orbit-data-bad-time",
                key = "EPOCH_TZERO",
                value = meta.get("EPOCH_TZERO").unwrap_or("")
            ),
        );
    }
    let mstart = meta.get("START_TIME").and_then(|v| ocm_time(v, tzero));
    let mstop = meta.get("STOP_TIME").and_then(|v| ocm_time(v, tzero));
    if let (Some((a, _)), Some((b, _)), Some(span)) = (
        mstart,
        mstop,
        meta.get("TIME_SPAN").and_then(|v| v.parse::<f64>().ok()),
    ) {
        if (span - (b - a)).abs() > 1e-6 + 1e-3 * (b - a).abs() {
            rep.push(
                Severity::Warning,
                "inconsistent",
                rule("Table 6-3"),
                None,
                Some("TIME_SPAN"),
                crate::t!(
                    "orbit-data-inconsistent",
                    key = "TIME_SPAN",
                    given = fmt_num(span),
                    computed = fmt_num(b - a),
                    unit = "d"
                ),
            );
        }
    }
    let mut spans = Vec::new();
    let mut all_epochs = Vec::new();
    let blocks: Vec<(&str, &crate::odm::OcmBlock, &str)> = m
        .traj
        .iter()
        .map(|b| ("TRAJ", b, "§6.2.5.6"))
        .chain(m.cov.iter().map(|b| ("COV", b, "§6.2.7.6")))
        .chain(m.man.iter().map(|b| ("MAN", b, "§6.2.8")))
        .collect();
    for (kind, b, order_sec) in blocks {
        let mut epochs = Vec::new();
        let mut forms = (false, false);
        let mut prev: Option<(f64, &str)> = None;
        for l in &b.lines {
            let Some(tag) = l.first() else { continue };
            let Some((e, relative)) = ocm_time(tag, tzero) else {
                rep.push(
                    Severity::Error,
                    "time-format",
                    rule("§6.2.2.3"),
                    None,
                    None,
                    crate::t!("orbit-data-bad-time", key = kind, value = tag.as_str()),
                );
                continue;
            };
            if relative {
                forms.0 = true
            } else {
                forms.1 = true
            }
            if let Some((p, ptxt)) = prev {
                if e == p {
                    rep.push(
                        Severity::Error,
                        "duplicate-time",
                        rule("§6.2.2.4"),
                        None,
                        Some(kind),
                        crate::t!("orbit-data-duplicate-time", t = tag.as_str()),
                    );
                } else if e < p && kind != "MAN" {
                    rep.push(
                        Severity::Error,
                        "time-not-increasing",
                        rule(order_sec),
                        None,
                        Some(kind),
                        crate::t!(
                            "orbit-data-time-not-increasing",
                            t = tag.as_str(),
                            prev = ptxt
                        ),
                    );
                }
            }
            prev = Some((e, tag.as_str()));
            if let (Some((a, _)), Some((z, _))) = (mstart, mstop) {
                if e < a - 1e-9 || e > z + 1e-9 {
                    rep.push(
                        Severity::Warning,
                        "outside-span",
                        rule("Table 6-3"),
                        None,
                        Some(kind),
                        crate::t!("orbit-data-outside-span", t = tag.as_str()),
                    );
                }
            }
            epochs.push(e);
            if kind == "COV" {
                let order = b.section.get("COV_ORDERING").unwrap_or("");
                let vals: Option<Vec<f64>> = l[1..].iter().map(|v| v.parse().ok()).collect();
                match (order, vals) {
                    ("LTM" | "UTM" | "FULL", Some(v)) => match matrix_from_ordering(&v, order) {
                        Some(mat) => {
                            cov_pd(&mut rep, &mat, tag, None, Severity::Error, "§6.2.7.10")
                        }
                        None => rep.push(
                            Severity::Error,
                            "covariance-layout",
                            rule("§6.2.7.12.1"),
                            None,
                            Some("COV_ORDERING"),
                            crate::t!("orbit-data-data-width", n = v.len(), want = order),
                        ),
                    },
                    _ => {
                        let what = format!("COV {order} {tag}");
                        if !rep.not_checked.contains(&what) && rep.not_checked.len() < 20 {
                            rep.not_checked.push(what);
                        }
                    }
                }
            }
        }
        if forms.0 && forms.1 {
            rep.push(
                Severity::Error,
                "mixed-time",
                rule("§6.2.2.5"),
                None,
                Some(kind),
                crate::t!("orbit-data-mixed-time", block = kind),
            );
        }
        if kind == "TRAJ" {
            if let Some(Ok(d)) = b
                .section
                .get("INTERPOLATION_DEGREE")
                .map(str::parse::<usize>)
            {
                if b.lines.len() <= d {
                    rep.push(
                        Severity::Error,
                        "too-few-points",
                        rule("§6.2.5.9"),
                        None,
                        Some("INTERPOLATION_DEGREE"),
                        crate::t!(
                            "orbit-data-too-few-points",
                            n = b.lines.len(),
                            deg = d,
                            need = d.saturating_add(1)
                        ),
                    );
                }
            }
            let us = b
                .section
                .get("USEABLE_START_TIME")
                .and_then(|v| ocm_time(v, tzero))
                .map(|x| x.0);
            let ue = b
                .section
                .get("USEABLE_STOP_TIME")
                .and_then(|v| ocm_time(v, tzero))
                .map(|x| x.0);
            let first = epochs.first().copied();
            let last = epochs.last().copied();
            for (key, u) in [("USEABLE_START_TIME", us), ("USEABLE_STOP_TIME", ue)] {
                if let (Some(u), Some(f), Some(l)) = (u, first, last) {
                    if u < f - 1e-9 || u > l + 1e-9 {
                        rep.push(
                            Severity::Warning,
                            "outside-span",
                            rule("Table 6-4"),
                            None,
                            Some(key),
                            crate::t!(
                                "orbit-data-outside-span",
                                t = b.section.get(key).unwrap_or("")
                            ),
                        );
                    }
                }
            }
            if let (Some(a), Some(z)) = (us.or(first), ue.or(last)) {
                spans.push((a, z));
            }
            all_epochs.push(epochs);
        }
    }
    profile_checks(&mut rep, &spans, &all_epochs, profile);
    rep
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn unsupported_blocks_are_set_aside() {
        let (t, r) = strip_unsupported("A\nPERT_START\nX = 1\nPERT_STOP\nB\n");
        assert_eq!(t, "A\nB\n");
        assert_eq!(r, vec!["PERT".to_string()]);
    }

    #[test]
    fn relative_and_absolute_tags() {
        let t0 = epoch_days_1950("2020-01-01T00:00:00").unwrap();
        let (a, rel) = ocm_time("86400", Some(t0)).unwrap();
        assert!(rel && (a - t0 - 1.0).abs() < 1e-12);
        let (b, rel) = ocm_time("2020-01-02T00:00:00", Some(t0)).unwrap();
        assert!(!rel && (b - a).abs() < 1e-9);
    }
}
