// SPDX-License-Identifier: AGPL-3.0-only
//! Semi-codeless (L1/L2 P(Y)) dependency scanner for GNSS station fleets (`kshana transition
//! scan`, docs/TRANSITION-SCAN.md).
//!
//! Many dual-frequency geodetic, survey and reference-station receivers form their second GPS
//! frequency by tracking the encrypted P(Y) signal without the code ("codeless" or
//! "semi-codeless" tracking, for example Z-tracking). The United States commitment to keep the
//! signal characteristics that make this possible is conditional. The gps.gov page
//! "Codeless/Semi-Codeless GPS Access Commitments" quotes section 3.2.8 of the 2019 Federal
//! Radionavigation Plan (see [`CONDITION`]): the characteristics are kept "until at least two
//! years after there are 24 operational satellites broadcasting L5 with fully functional
//! navigation messages". That superseded the 2008 Federal Register notice (Vol. 73 No. 185),
//! which named 31 December 2020.
//!
//! This module reads what a station's own files say about its tracking:
//!
//! - **RINEX observation headers** (2.x, 3.x, 4.x, also inside Hatanaka-compressed CRINEX and
//!   gzip files): the GPS observation codes declared, the receiver and antenna;
//! - **IGS-format site logs**: the receiver history, its current receiver and firmware.
//!
//! For each station it states whether the declared GPS codes depend on codeless or
//! semi-codeless tracking (`yes`, `partial`, `no`, `unknown`) and whether the modernised civil
//! signals L2C and L5 are tracked, with the reasons; a fleet summary counts the stations.
//!
//! The code meanings are those of the RINEX 3.05 and 4.01 GPS observation-code tables: band 1
//! and 2 attributes `D` (L1 C/A + (P2 − P1), semi-codeless), `W` (Z-tracking and similar, AS
//! on), `P` (P code, AS off: with anti-spoofing on, a civil receiver forms it codelessly) and
//! `N` (codeless) depend on P(Y) access; band 2 `S`, `L`, `X` are L2C; band 5 `I`, `Q`, `X` are
//! L5. RINEX 2.11 has two-character codes: `P1`/`P2` are P-code observations (semi-codeless in
//! a civil receiver), `C2` is the L2C pseudorange and `C5`/`L5` are L5; an `L2` phase alone
//! does not say how it was tracked.
//!
//! **Evidence: MODELLED** (an inference from what headers and logs declare). A header lists the
//! codes a file may contain, not that every epoch has them, and a site log does not list
//! signals at all; a receiver's processing chain (for example a network RTK or PPP service)
//! can depend on P(Y) codes even when the station also tracks L2C. The scan says what the files
//! show; it does not test a receiver.

use serde::Serialize;
use sha2::{Digest, Sha256};
use std::collections::{BTreeMap, BTreeSet};
use std::io::Read;

/// The evidence label of every report.
pub const LABEL: &str = "MODELLED";

/// The source of the transition condition, quoted as published.
pub const CONDITION: Condition = Condition {
    source: "gps.gov, Codeless/Semi-Codeless GPS Access Commitments, quoting section 3.2.8 of the 2019 Federal Radionavigation Plan",
    url: "https://www.gps.gov/codelesssemi-codeless-gps-access-commitments",
    retrieved: "2026-11-27",
    wording: "The USG commits to maintaining the existing GPS L1 C/A, L1 P(Y), L2C, and L2 P(Y) signal characteristics that enable codeless and semi-codeless GPS access until at least two years after there are 24 operational satellites broadcasting L5 with fully functional navigation messages.",
    superseded: "Federal Register Vol. 73 No. 185 (23 September 2008), Preservation of Continuity for Semi-Codeless GPS Applications: the earlier commitment through 31 December 2020",
};

/// Where the transition condition comes from.
#[derive(Clone, Copy, Debug, Serialize)]
pub struct Condition {
    /// The document.
    pub source: &'static str,
    /// Its address.
    pub url: &'static str,
    /// When it was read for this module.
    pub retrieved: &'static str,
    /// The commitment, word for word.
    pub wording: &'static str,
    /// What it superseded.
    pub superseded: &'static str,
}

/// What one GPS observation code says about P(Y) access.
#[derive(Clone, Copy, Debug, PartialEq, Eq, PartialOrd, Ord, Serialize)]
#[serde(rename_all = "kebab-case")]
pub enum CodeClass {
    /// Formed with codeless or semi-codeless P(Y) tracking.
    SemiCodeless,
    /// The L2C civil signal.
    L2c,
    /// The L5 civil signal.
    L5,
    /// A civil L1 signal (C/A or L1C).
    L1Civil,
    /// An L2 observation whose tracking the code does not say (RINEX 2 `L2`, `D2`, `S2`).
    L2Unstated,
    /// Anything else (not assessed).
    Other,
}

/// Classify a GPS observation code of the given RINEX major version.
pub fn classify(code: &str, major: u32) -> CodeClass {
    let c: Vec<char> = code.chars().collect();
    if major < 3 {
        return match code {
            "P1" | "P2" => CodeClass::SemiCodeless,
            "C2" => CodeClass::L2c,
            "C5" | "L5" | "D5" | "S5" => CodeClass::L5,
            "C1" | "L1" | "D1" | "S1" => CodeClass::L1Civil,
            "L2" | "D2" | "S2" => CodeClass::L2Unstated,
            _ => CodeClass::Other,
        };
    }
    if c.len() != 3 || !"CLDS".contains(c[0]) {
        return CodeClass::Other;
    }
    match (c[1], c[2]) {
        ('1' | '2', 'D' | 'W' | 'P' | 'N') => CodeClass::SemiCodeless,
        ('2', 'S' | 'L' | 'X') => CodeClass::L2c,
        ('5', 'I' | 'Q' | 'X') => CodeClass::L5,
        ('1', 'C' | 'S' | 'L' | 'X') => CodeClass::L1Civil,
        _ => CodeClass::Other,
    }
}

// ---------------------------------------------------------------------------------------------
// RINEX observation headers
// ---------------------------------------------------------------------------------------------

/// What a RINEX observation header declares.
#[derive(Clone, Debug, Default, PartialEq, Serialize)]
pub struct ObsHeaderInfo {
    /// The RINEX version as written.
    pub rinex_version: String,
    /// The major version.
    pub major: u32,
    /// The file's satellite system letter (blank in RINEX 2 means GPS).
    pub file_system: String,
    /// MARKER NAME.
    pub marker: Option<String>,
    /// The receiver type (REC # / TYPE / VERS).
    pub receiver: Option<String>,
    /// The receiver firmware version.
    pub receiver_version: Option<String>,
    /// The antenna type (ANT # / TYPE).
    pub antenna: Option<String>,
    /// TIME OF FIRST OBS as `YYYY-MM-DDTHH:MM:SS`.
    pub first_obs: Option<String>,
    /// The GPS observation codes declared, in header order.
    pub gps_codes: Vec<String>,
    /// Whether the file was Hatanaka-compressed (CRINEX).
    pub crinex: bool,
}

fn label_of(line: &str) -> &str {
    line.get(60..).map(str::trim).unwrap_or("")
}

fn field(line: &str, a: usize, b: usize) -> Option<String> {
    let s = line.get(a..b.min(line.len()))?.trim();
    (!s.is_empty()).then(|| s.to_string())
}

/// Read a RINEX observation header (plain or CRINEX). `Err` when the text is not one.
pub fn parse_obs_header(text: &str) -> Result<ObsHeaderInfo, String> {
    let mut lines = text.lines().peekable();
    let mut info = ObsHeaderInfo::default();
    if lines
        .peek()
        .is_some_and(|l| label_of(l) == "CRINEX VERS   / TYPE")
    {
        info.crinex = true;
        lines.next();
        if lines
            .peek()
            .is_some_and(|l| label_of(l) == "CRINEX PROG / DATE")
        {
            lines.next();
        }
    }
    let first = lines.next().ok_or_else(|| "empty file".to_string())?;
    if label_of(first) != "RINEX VERSION / TYPE" {
        return Err("the first header line is not RINEX VERSION / TYPE".into());
    }
    if first.get(20..21) != Some("O") {
        return Err("not an observation file (file type is not O)".into());
    }
    info.rinex_version = field(first, 0, 9).unwrap_or_default();
    info.major = info
        .rinex_version
        .split('.')
        .next()
        .and_then(|m| m.trim().parse().ok())
        .ok_or_else(|| format!("unreadable RINEX version {:?}", info.rinex_version))?;
    info.file_system = first.get(40..41).unwrap_or(" ").trim().to_string();
    let mut v2_types: Vec<String> = Vec::new();
    let mut v2_expected = 0usize;
    let mut cur_sys: Option<char> = None;
    let mut ended = false;
    for line in lines {
        let label = label_of(line);
        match label {
            "END OF HEADER" => {
                ended = true;
                break;
            }
            "MARKER NAME" => info.marker = field(line, 0, 60),
            "REC # / TYPE / VERS" => {
                info.receiver = field(line, 20, 40);
                info.receiver_version = field(line, 40, 60);
            }
            "ANT # / TYPE" => info.antenna = field(line, 20, 40),
            "TIME OF FIRST OBS" => {
                let n: Vec<f64> = line
                    .get(0..43)
                    .unwrap_or("")
                    .split_whitespace()
                    .filter_map(|x| x.parse().ok())
                    .collect();
                if n.len() == 6 {
                    info.first_obs = Some(format!(
                        "{:04}-{:02}-{:02}T{:02}:{:02}:{:02}",
                        n[0] as i64,
                        n[1] as i64,
                        n[2] as i64,
                        n[3] as i64,
                        n[4] as i64,
                        n[5] as i64
                    ));
                }
            }
            "# / TYPES OF OBSERV" if info.major < 3 => {
                if let Some(n) = field(line, 0, 6).and_then(|n| n.parse::<usize>().ok()) {
                    v2_expected = n;
                }
                let body = line.get(6..60).unwrap_or("");
                for t in body.split_whitespace() {
                    if v2_types.len() < v2_expected {
                        v2_types.push(t.to_string());
                    }
                }
            }
            "SYS / # / OBS TYPES" if info.major >= 3 => {
                let s = line.chars().next().unwrap_or(' ');
                if s != ' ' {
                    cur_sys = Some(s);
                }
                if cur_sys == Some('G') {
                    let body = line.get(6..60).unwrap_or("");
                    info.gps_codes
                        .extend(body.split_whitespace().map(str::to_string));
                }
            }
            _ => {}
        }
    }
    if !ended {
        return Err("no END OF HEADER".into());
    }
    if info.major < 3 && matches!(info.file_system.as_str(), "" | "G" | "M") {
        info.gps_codes = v2_types;
    }
    Ok(info)
}

// ---------------------------------------------------------------------------------------------
// IGS site logs
// ---------------------------------------------------------------------------------------------

/// One receiver entry of a site log (section 3).
#[derive(Clone, Debug, Default, PartialEq, Serialize)]
pub struct LogReceiver {
    /// Receiver Type.
    pub receiver: String,
    /// Satellite System.
    pub satellite_system: Option<String>,
    /// Firmware Version.
    pub firmware: Option<String>,
    /// Date Installed.
    pub installed: Option<String>,
    /// Date Removed (`None` while installed).
    pub removed: Option<String>,
}

/// What an IGS-format site log says.
#[derive(Clone, Debug, Default, PartialEq, Serialize)]
pub struct SiteLog {
    /// The four-character ID (from Four or Nine Character ID).
    pub station: String,
    /// The receivers, in log order.
    pub receivers: Vec<LogReceiver>,
}

impl SiteLog {
    /// The installed receiver: the last entry with no removal date.
    pub fn current(&self) -> Option<&LogReceiver> {
        self.receivers.iter().rev().find(|r| r.removed.is_none())
    }
}

fn log_value(line: &str) -> Option<(String, String)> {
    let (k, v) = line.split_once(':')?;
    let k = k.trim();
    // keys look like "3.1  Receiver Type" or "Satellite System"
    let key = k
        .trim_start_matches(|c: char| c.is_ascii_digit() || c == '.' || c == 'x')
        .trim();
    Some((key.to_string(), v.trim().to_string()))
}

fn placeholder(v: &str) -> bool {
    v.is_empty() || v.starts_with('(') || v.eq_ignore_ascii_case("CCYY-MM-DDThh:mmZ")
}

/// Read an IGS-format site log. `Err` when the text is not one.
pub fn parse_site_log(text: &str) -> Result<SiteLog, String> {
    if !text.contains("Receiver Type") {
        return Err("no Receiver Type entry".into());
    }
    let mut log = SiteLog::default();
    let mut in_receivers = false;
    let mut cur: Option<LogReceiver> = None;
    for raw in text.lines() {
        let line = raw.trim_end();
        let t = line.trim_start();
        if t.starts_with("3.") && t.contains("GNSS Receiver Information") {
            in_receivers = true;
            continue;
        }
        if t.starts_with("4.") && t.contains("GNSS Antenna Information") {
            if let Some(r) = cur.take() {
                log.receivers.push(r);
            }
            in_receivers = false;
            continue;
        }
        let Some((key, value)) = log_value(line) else {
            continue;
        };
        match key.as_str() {
            "Four Character ID" if !placeholder(&value) => {
                log.station = value.chars().take(4).collect::<String>().to_uppercase()
            }
            "Nine Character ID" if log.station.is_empty() && !placeholder(&value) => {
                log.station = value.chars().take(4).collect::<String>().to_uppercase()
            }
            "Receiver Type" => {
                if let Some(r) = cur.take() {
                    log.receivers.push(r);
                }
                // the "3.x" template block has a placeholder receiver type
                if t.starts_with("3.x") || placeholder(&value) {
                    continue;
                }
                in_receivers = true;
                cur = Some(LogReceiver {
                    receiver: value,
                    ..LogReceiver::default()
                });
            }
            _ if in_receivers => {
                if let Some(r) = cur.as_mut() {
                    let v = (!placeholder(&value)).then_some(value);
                    match key.as_str() {
                        "Satellite System" => r.satellite_system = v,
                        "Firmware Version" => r.firmware = v,
                        "Date Installed" => r.installed = v,
                        "Date Removed" => r.removed = v,
                        _ => {}
                    }
                }
            }
            _ => {}
        }
    }
    if let Some(r) = cur.take() {
        log.receivers.push(r);
    }
    if log.station.is_empty() {
        return Err("no Four Character ID or Nine Character ID".into());
    }
    Ok(log)
}

// ---------------------------------------------------------------------------------------------
// Assessment
// ---------------------------------------------------------------------------------------------

/// One observation file as scanned.
#[derive(Clone, Debug, Serialize)]
pub struct FileScan {
    /// The path given.
    pub path: String,
    /// SHA-256 of the file's bytes as read (before any decompression).
    pub sha256: String,
    /// The header.
    pub header: ObsHeaderInfo,
    /// The GPS codes by class.
    pub classes: BTreeMap<CodeClass, Vec<String>>,
}

/// The verdict for one station.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct Verdict {
    /// `yes`, `partial`, `no` or `unknown`.
    pub semi_codeless_dependent: &'static str,
    /// Whether L2C codes are declared.
    pub l2c: bool,
    /// Whether L5 codes are declared.
    pub l5: bool,
    /// `ready`, `switch-needed`, `not-ready`, `single-frequency` or `unknown`.
    pub readiness: &'static str,
    /// Why.
    pub reasons: Vec<String>,
}

/// One station.
#[derive(Clone, Debug, Serialize)]
pub struct Station {
    /// The station's four-character ID (or the marker name, or the file name).
    pub id: String,
    /// The observation files, the one the verdict uses first.
    pub files: Vec<FileScan>,
    /// The site log, if one was given.
    pub site_log: Option<SiteLog>,
    /// The verdict.
    pub verdict: Verdict,
}

/// The fleet counts.
#[derive(Clone, Debug, Default, PartialEq, Serialize)]
pub struct Fleet {
    /// Stations.
    pub stations: usize,
    /// Semi-codeless dependent: yes.
    pub dependent: usize,
    /// Partial.
    pub partial: usize,
    /// Not dependent.
    pub not_dependent: usize,
    /// Unknown.
    pub unknown: usize,
    /// Stations declaring L2C.
    pub l2c: usize,
    /// Stations declaring L5.
    pub l5: usize,
}

/// An input that was not used.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct Skipped {
    /// The path.
    pub path: String,
    /// Why.
    pub reason: String,
}

/// The report.
#[derive(Clone, Debug, Serialize)]
pub struct Report {
    /// Always [`LABEL`].
    pub label: &'static str,
    /// The transition condition and its source.
    pub condition: Condition,
    /// The stations, by ID.
    pub stations: Vec<Station>,
    /// The fleet summary.
    pub fleet: Fleet,
    /// Inputs that were neither an observation file nor a site log.
    pub skipped: Vec<Skipped>,
}

fn classes(h: &ObsHeaderInfo) -> BTreeMap<CodeClass, Vec<String>> {
    let mut m: BTreeMap<CodeClass, Vec<String>> = BTreeMap::new();
    for c in &h.gps_codes {
        let v = m.entry(classify(c, h.major)).or_default();
        if !v.contains(c) {
            v.push(c.clone());
        }
    }
    m
}

/// The verdict from one file's codes.
pub fn verdict(f: Option<&FileScan>, log: Option<&SiteLog>) -> Verdict {
    let mut reasons = Vec::new();
    let Some(f) = f else {
        if let Some(r) = log.and_then(|l| l.current()) {
            reasons.push(format!(
                "site log only: the installed receiver is {}{}; a site log does not list the signals tracked, so an observation header is needed",
                r.receiver,
                r.firmware
                    .as_deref()
                    .map(|v| format!(" (firmware {v})"))
                    .unwrap_or_default()
            ));
        } else {
            reasons.push("no observation header and no installed receiver in the site log".into());
        }
        return Verdict {
            semi_codeless_dependent: "unknown",
            l2c: false,
            l5: false,
            readiness: "unknown",
            reasons,
        };
    };
    let get = |c: CodeClass| f.classes.get(&c).cloned().unwrap_or_default();
    let (sc, l2c, l5, l1, l2u) = (
        get(CodeClass::SemiCodeless),
        get(CodeClass::L2c),
        get(CodeClass::L5),
        get(CodeClass::L1Civil),
        get(CodeClass::L2Unstated),
    );
    let civil2 = !l2c.is_empty() || !l5.is_empty();
    if f.header.gps_codes.is_empty() {
        reasons.push(format!("{}: no GPS observation codes declared", f.path));
        return Verdict {
            semi_codeless_dependent: "unknown",
            l2c: false,
            l5: false,
            readiness: "unknown",
            reasons,
        };
    }
    if !sc.is_empty() {
        reasons.push(format!(
            "{}: P(Y) codes formed by codeless or semi-codeless tracking: {}",
            f.path,
            sc.join(" ")
        ));
    }
    if !l2c.is_empty() {
        reasons.push(format!("{}: L2C codes: {}", f.path, l2c.join(" ")));
    }
    if !l5.is_empty() {
        reasons.push(format!("{}: L5 codes: {}", f.path, l5.join(" ")));
    }
    if f.header.major < 3 && !l2u.is_empty() {
        reasons.push(format!(
            "{}: RINEX {} declares {} without saying how L2 was tracked",
            f.path,
            f.header.rinex_version,
            l2u.join(" ")
        ));
    }
    let (dep, readiness) = if !sc.is_empty() && civil2 {
        reasons.push(
            "the civil signals are tracked: processing that uses the P(Y) codes must switch to them"
                .into(),
        );
        ("partial", "switch-needed")
    } else if !sc.is_empty() {
        reasons.push("no L2C or L5 codes: the second frequency depends on P(Y) access".into());
        ("yes", "not-ready")
    } else if civil2 {
        ("no", "ready")
    } else if !l2u.is_empty() {
        ("unknown", "unknown")
    } else if !l1.is_empty() {
        reasons.push(format!(
            "{}: GPS L1 only, not affected by the transition",
            f.path
        ));
        ("no", "single-frequency")
    } else {
        ("unknown", "unknown")
    };
    Verdict {
        semi_codeless_dependent: dep,
        l2c: !l2c.is_empty(),
        l5: !l5.is_empty(),
        readiness,
        reasons,
    }
}

fn sha256_hex(b: &[u8]) -> String {
    hex::encode(Sha256::digest(b))
}

/// Read a file's text: gzip is decompressed (header part only is needed, so at most 4 MiB of
/// text is read).
fn text_of(bytes: &[u8]) -> Result<String, String> {
    const MAX: u64 = 4 << 20;
    if bytes.starts_with(&[0x1f, 0x8b]) {
        let mut s = Vec::new();
        flate2::read::MultiGzDecoder::new(bytes)
            .take(MAX)
            .read_to_end(&mut s)
            .map_err(|e| e.to_string())?;
        return Ok(String::from_utf8_lossy(&s).into_owned());
    }
    if bytes.starts_with(&[0x1f, 0x9d]) {
        return Err("Unix compress (.Z) is not read: decompress it first".into());
    }
    let n = bytes.len().min(MAX as usize);
    Ok(String::from_utf8_lossy(&bytes[..n]).into_owned())
}

fn station_key(h: &ObsHeaderInfo, path: &str) -> String {
    let from_marker = h
        .marker
        .as_deref()
        .map(|m| m.chars().take(4).collect::<String>().to_uppercase());
    from_marker.filter(|m| m.len() == 4).unwrap_or_else(|| {
        std::path::Path::new(path)
            .file_name()
            .and_then(|s| s.to_str())
            .unwrap_or(path)
            .chars()
            .take(4)
            .collect::<String>()
            .to_uppercase()
    })
}

/// Scan named inputs (path, bytes). Each is an observation file, a site log, or skipped.
pub fn scan(inputs: &[(String, Vec<u8>)]) -> Report {
    let mut files: BTreeMap<String, Vec<FileScan>> = BTreeMap::new();
    let mut logs: BTreeMap<String, SiteLog> = BTreeMap::new();
    let mut skipped = Vec::new();
    for (path, bytes) in inputs {
        let text = match text_of(bytes) {
            Ok(t) => t,
            Err(e) => {
                skipped.push(Skipped {
                    path: path.clone(),
                    reason: e,
                });
                continue;
            }
        };
        match parse_obs_header(&text) {
            Ok(h) => {
                let key = station_key(&h, path);
                let c = classes(&h);
                files.entry(key).or_default().push(FileScan {
                    path: path.clone(),
                    sha256: sha256_hex(bytes),
                    header: h,
                    classes: c,
                });
            }
            Err(obs_err) => match parse_site_log(&text) {
                Ok(l) => {
                    logs.insert(l.station.clone(), l);
                }
                Err(_) => skipped.push(Skipped {
                    path: path.clone(),
                    reason: format!("not a RINEX observation file ({obs_err}) or a site log"),
                }),
            },
        }
    }
    let ids: BTreeSet<String> = files.keys().chain(logs.keys()).cloned().collect();
    let mut stations = Vec::new();
    let mut fleet = Fleet::default();
    for id in ids {
        let mut fs = files.remove(&id).unwrap_or_default();
        // the latest file first (by TIME OF FIRST OBS; a file without one sorts last)
        fs.sort_by(|a, b| {
            b.header
                .first_obs
                .is_some()
                .cmp(&a.header.first_obs.is_some())
                .then(b.header.first_obs.cmp(&a.header.first_obs))
                .then(a.path.cmp(&b.path))
        });
        let log = logs.remove(&id);
        let mut v = verdict(fs.first(), log.as_ref());
        if let (Some(f), Some(r)) = (fs.first(), log.as_ref().and_then(|l| l.current())) {
            if let Some(rec) = &f.header.receiver {
                if !rec.eq_ignore_ascii_case(&r.receiver) {
                    v.reasons.push(format!(
                        "the observation header names receiver {rec}; the site log's installed receiver is {}",
                        r.receiver
                    ));
                }
            }
        }
        if fs.len() > 1 {
            v.reasons.push(format!(
                "{} observation files: the verdict uses the one with the latest first observation",
                fs.len()
            ));
        }
        fleet.stations += 1;
        match v.semi_codeless_dependent {
            "yes" => fleet.dependent += 1,
            "partial" => fleet.partial += 1,
            "no" => fleet.not_dependent += 1,
            _ => fleet.unknown += 1,
        }
        fleet.l2c += usize::from(v.l2c);
        fleet.l5 += usize::from(v.l5);
        stations.push(Station {
            id,
            files: fs,
            site_log: log,
            verdict: v,
        });
    }
    Report {
        label: LABEL,
        condition: CONDITION,
        stations,
        fleet,
        skipped,
    }
}

/// The report as text.
pub fn text(r: &Report) -> String {
    let mut out = String::new();
    out.push_str(&crate::t!("transition-text-header", n = r.stations.len()));
    out.push('\n');
    out.push_str(&crate::t!(
        "transition-text-condition",
        quote = CONDITION.wording,
        url = CONDITION.url
    ));
    out.push_str("\n\n");
    for s in &r.stations {
        out.push_str(&crate::t!(
            "transition-text-station",
            id = s.id.clone(),
            dep = s.verdict.semi_codeless_dependent,
            l2c = if s.verdict.l2c { "yes" } else { "no" },
            l5 = if s.verdict.l5 { "yes" } else { "no" },
            readiness = s.verdict.readiness
        ));
        out.push('\n');
        for reason in &s.verdict.reasons {
            out.push_str(&crate::t!(
                "transition-text-reason",
                reason = reason.clone()
            ));
            out.push('\n');
        }
    }
    out.push('\n');
    out.push_str(&crate::t!(
        "transition-text-fleet",
        yes = r.fleet.dependent,
        partial = r.fleet.partial,
        no = r.fleet.not_dependent,
        unknown = r.fleet.unknown,
        l2c = r.fleet.l2c,
        l5 = r.fleet.l5
    ));
    out.push('\n');
    for s in &r.skipped {
        out.push_str(&crate::t!(
            "transition-text-skipped",
            path = s.path.clone(),
            reason = s.reason.clone()
        ));
        out.push('\n');
    }
    out
}

fn collect(path: &str, out: &mut Vec<(String, Vec<u8>)>) -> Result<(), String> {
    let p = std::path::Path::new(path);
    if p.is_dir() {
        let mut entries: Vec<_> = std::fs::read_dir(p)
            .map_err(|e| crate::terr!("e-transition-read", path = path, e = e.to_string()))?
            .flatten()
            .map(|e| e.path())
            .filter(|e| e.is_file())
            .collect();
        entries.sort();
        for e in entries {
            let s = e.to_string_lossy().into_owned();
            let b = std::fs::read(&e).map_err(|x| {
                crate::terr!("e-transition-read", path = s.clone(), e = x.to_string())
            })?;
            out.push((s, b));
        }
    } else {
        let b = std::fs::read(p)
            .map_err(|e| crate::terr!("e-transition-read", path = path, e = e.to_string()))?;
        out.push((path.to_string(), b));
    }
    Ok(())
}

/// `kshana transition scan <file|dir>... [--json] [--out <base>]`.
pub fn run(args: &[String]) -> Result<(), String> {
    let usage = || crate::t!("transition-usage");
    match args.first().map(String::as_str) {
        Some("scan") => {}
        Some("--help" | "-h" | "help") => {
            println!("{}", usage());
            return Ok(());
        }
        _ => return Err(usage()),
    }
    let mut json = false;
    let mut out_base: Option<String> = None;
    let mut inputs = Vec::new();
    let mut i = 1;
    while i < args.len() {
        match args[i].as_str() {
            "--json" => json = true,
            "--out" => {
                i += 1;
                out_base = Some(args.get(i).cloned().ok_or_else(usage)?);
            }
            "--help" | "-h" => {
                println!("{}", usage());
                return Ok(());
            }
            o if o.starts_with("--") => {
                return Err(crate::terr!("e-transition-option", option = o))
            }
            p => collect(p, &mut inputs)?,
        }
        i += 1;
    }
    if inputs.is_empty() {
        return Err(usage());
    }
    let report = scan(&inputs);
    if report.stations.is_empty() {
        return Err(crate::terr!("e-transition-nothing"));
    }
    let js = serde_json::to_string_pretty(&report).map_err(|e| e.to_string())? + "\n";
    let tx = text(&report);
    if let Some(base) = out_base {
        for (ext, body) in [("json", &js), ("txt", &tx)] {
            let p = format!("{base}.{ext}");
            std::fs::write(&p, body).map_err(|e| {
                crate::terr!("e-transition-read", path = p.clone(), e = e.to_string())
            })?;
        }
    }
    print!("{}", if json { js } else { tx });
    Ok(())
}
