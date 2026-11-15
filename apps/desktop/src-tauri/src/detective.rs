// SPDX-License-Identifier: AGPL-3.0-only
//! The format detective (0.42 U9): what a dropped file is, before it is loaded. The
//! identification and every number come from the engine's own readers (`kshana::rinex_obs`,
//! `kshana::rinex`, `kshana::sp3`, `kshana::clock_log`, `kshana::receiver_trust::ingest`,
//! `kshana::sigmf`), so the detective says only what the engine would read; nothing here
//! parses a format of its own. A file the engine does not read gets a plain message naming
//! what it does read.
//!
//! A file is read up to [`HEAD_BYTES`]; a longer file is described from that head and the
//! answer says so (`whole: false`), so a span or a gap count is then a lower bound. An IQ
//! recording is never read: its size and its SigMF metadata say what it holds.

use serde_json::{json, Value};
use std::path::Path;

/// How much of a file the detective reads (8 MiB).
pub const HEAD_BYTES: u64 = 8 * 1024 * 1024;
/// At most this many files of a folder are described.
pub const MAX_FOLDER_FILES: usize = 200;
/// At most this many gaps are listed (all are counted).
const MAX_GAPS_LISTED: usize = 20;

/// Bytes per complex sample of a raw IQ recording named by its extension.
fn iq_ext(ext: &str) -> Option<(&'static str, u64)> {
    match ext {
        "cf32" | "fc32" => Some(("cf32", 8)),
        "ci16" | "cs16" | "sc16" => Some(("ci16", 4)),
        "ci8" | "cs8" | "sc8" => Some(("ci8", 2)),
        "cu8" => Some(("cu8", 2)),
        _ => None,
    }
}

/// The constellation a RINEX satellite letter names.
fn constellation(letter: char) -> Option<&'static str> {
    Some(match letter {
        'G' => "GPS",
        'R' => "GLONASS",
        'E' => "Galileo",
        'C' => "BeiDou",
        'J' => "QZSS",
        'I' => "NavIC",
        'S' => "SBAS",
        _ => return None,
    })
}

fn constellations<'a>(ids: impl Iterator<Item = &'a str>) -> (Vec<&'static str>, usize) {
    let mut sats = std::collections::BTreeSet::new();
    let mut cons = Vec::new();
    for id in ids {
        sats.insert(id.to_string());
        if let Some(c) = id.chars().next().and_then(constellation) {
            if !cons.contains(&c) {
                cons.push(c);
            }
        }
    }
    (cons, sats.len())
}

/// The sampling interval (median spacing) of sorted epoch times and the gaps: spans
/// between consecutive epochs longer than 1.5 times the interval. Times in seconds.
pub fn gaps_of(times: &[f64]) -> (Option<f64>, Vec<(f64, f64)>) {
    let mut d: Vec<f64> = times
        .windows(2)
        .map(|w| w[1] - w[0])
        .filter(|x| *x > 0.0)
        .collect();
    if d.is_empty() {
        return (None, Vec::new());
    }
    d.sort_by(|a, b| a.total_cmp(b));
    let step = d[d.len() / 2];
    let gaps = times
        .windows(2)
        .filter(|w| w[1] - w[0] > step * 1.5)
        .map(|w| (w[0], w[1]))
        .collect();
    (Some(step), gaps)
}

fn iso(e: &kshana::rinex::EpochUtc) -> String {
    let whole = e.second.floor();
    let ms = ((e.second - whole) * 1000.0).round() as u32;
    let base = format!(
        "{:04}-{:02}-{:02}T{:02}:{:02}:{:02}",
        e.year, e.month, e.day, e.hour, e.minute, whole as u32
    );
    if ms > 0 {
        format!("{base}.{ms:03}")
    } else {
        base
    }
}

/// The answer for a file of epochs: span, interval, gaps, constellations.
#[allow(clippy::too_many_arguments)]
fn described(
    format: &str,
    label: String,
    family: &str,
    times: &[f64],
    start: Option<String>,
    end: Option<String>,
    sat_ids: Vec<String>,
    opens_as: Value,
    extra: Value,
) -> Value {
    let (step, gaps) = gaps_of(times);
    let (cons, nsat) = constellations(sat_ids.iter().map(String::as_str));
    let span = match (times.first(), times.last()) {
        (Some(a), Some(b)) => b - a,
        _ => 0.0,
    };
    let t0 = times.first().copied().unwrap_or(0.0);
    json!({
        "ok": true,
        "format": format,
        "label": label,
        "family": family,
        "epochs": times.len(),
        "span": { "start": start, "end": end, "seconds": span },
        "interval_s": step,
        "constellations": cons,
        "satellites": nsat,
        "gaps": gaps.iter().take(MAX_GAPS_LISTED).map(|(a, b)| json!({"from_s": a - t0, "to_s": b - t0, "seconds": b - a})).collect::<Vec<_>>(),
        "n_gaps": gaps.len(),
        "opens_as": opens_as,
        "extra": extra,
    })
}

fn rinex_type(text: &str) -> Option<(f64, char)> {
    let first = text.lines().next()?;
    if !first.contains("RINEX VERSION / TYPE") {
        return None;
    }
    let version: f64 = first.get(0..9)?.trim().parse().ok()?;
    let kind = first.get(20..21)?.chars().next()?;
    Some((version, kind))
}

fn log_name(f: kshana::receiver_trust::LogFormat) -> String {
    serde_json::to_value(f)
        .ok()
        .and_then(|v| v.as_str().map(str::to_string))
        .unwrap_or_default()
}

const LOG_LABELS: &[(&str, &str)] = &[
    ("ubx", "u-blox UBX receiver log"),
    ("rinex", "RINEX observation"),
    ("android", "Android GnssLogger log"),
    ("sbf", "Septentrio SBF receiver log"),
    ("nmea", "NMEA 0183 receiver log"),
    ("rtklib-pos", "RTKLIB .pos solution"),
    ("novatel", "NovAtel OEM7 receiver log"),
    ("rtcm3", "RTCM 3 MSM observations"),
    ("gnss-sdr", "GNSS-SDR monitor messages"),
    ("sbp", "Swift SBP receiver log"),
    ("greis", "Javad GREIS receiver log"),
    ("unicore", "Unicore N4 receiver log"),
];

fn log_label(name: &str) -> String {
    LOG_LABELS
        .iter()
        .find(|(n, _)| *n == name)
        .map(|(_, l)| (*l).to_string())
        .unwrap_or_else(|| name.to_string())
}

/// The receiver-log formats to try for these bytes, most likely first: by the first bytes
/// (the frame sync words the engine's readers look for), then by the text.
fn log_candidates(b: &[u8]) -> Vec<kshana::receiver_trust::LogFormat> {
    use kshana::receiver_trust::LogFormat as F;
    let mut out = Vec::new();
    let starts = |p: &[u8]| b.len() >= p.len() && &b[..p.len()] == p;
    if starts(&[0xb5, 0x62]) {
        out.push(F::Ubx);
    }
    if starts(b"$@") {
        out.push(F::Sbf);
    }
    if starts(&[0xaa, 0x44, 0x12]) || starts(b"#") {
        out.push(F::Novatel);
    }
    if b.first() == Some(&0xd3) {
        out.push(F::Rtcm3);
    }
    if b.first() == Some(&0x55) {
        out.push(F::Sbp);
    }
    let text = std::str::from_utf8(&b[..b.len().min(64 * 1024)]).is_ok()
        || b.iter().take(4096).all(|c| c.is_ascii());
    if text {
        let head = String::from_utf8_lossy(&b[..b.len().min(16 * 1024)]);
        let lines: Vec<&str> = head
            .lines()
            .filter(|l| !l.trim().is_empty())
            .take(50)
            .collect();
        if lines
            .iter()
            .filter(|l| l.starts_with('$') || l.starts_with('!'))
            .count()
            * 2
            >= lines.len().max(1)
        {
            out.push(F::Nmea);
        }
        if lines.iter().any(|l| l.starts_with('%')) {
            out.push(F::RtklibPos);
        }
        if head.contains("Raw,") || head.contains("# Version") {
            out.push(F::Android);
        }
        if lines
            .first()
            .is_some_and(|l| l.trim_start().starts_with('{'))
        {
            out.push(F::GnssSdr);
        }
    } else {
        for f in [
            F::Ubx,
            F::Sbf,
            F::Rtcm3,
            F::Novatel,
            F::Sbp,
            F::Greis,
            F::Unicore,
        ] {
            if !out.contains(&f) {
                out.push(f);
            }
        }
    }
    out
}

/// A receiver log the engine reads (`Some(Ok)`), bytes that carry a receiver format's sync
/// word but hold nothing the receiver-trust reader takes (`Some(Err)` with the engine's own
/// words), or neither (`None`).
fn try_receiver_log(b: &[u8]) -> Option<Result<Value, String>> {
    let mut first_err: Option<(String, String)> = None;
    let framed =
        b.starts_with(&[0xb5, 0x62]) || b.starts_with(b"$@") || b.starts_with(&[0xaa, 0x44, 0x12]);
    for f in log_candidates(b) {
        let tl = match kshana::receiver_trust::ingest::read_log(f, b) {
            Ok(tl) => tl,
            Err(e) => {
                first_err.get_or_insert((log_name(f), e));
                continue;
            }
        };
        let name = log_name(f);
        let times: Vec<f64> = tl.epochs.iter().map(|e| e.t_s).collect();
        let ids: Vec<String> = tl
            .epochs
            .iter()
            .flat_map(|e| e.cn0.iter().map(|s| s.sat.clone()))
            .collect();
        let start = tl
            .epochs
            .first()
            .and_then(|e| e.time_label.clone())
            .or(tl.start_label.clone());
        let end = tl.epochs.last().and_then(|e| e.time_label.clone());
        let fixes = tl.epochs.iter().filter(|e| e.fix.is_some()).count();
        return Some(Ok(described(
            &name,
            log_label(&name),
            "receiver-log",
            &times,
            start,
            end,
            ids,
            json!({"kind": "receiver-trust", "format": name}),
            json!({"observables": tl.observables, "fixes": fixes, "skipped_records": tl.skipped_records}),
        )));
    }
    match first_err {
        Some((name, e)) if framed => Some(Err(format!(
            "{}: the receiver-trust reader found no epochs in it ({e})",
            log_label(&name)
        ))),
        _ => None,
    }
}

/// The track formats of the engine's connectors (`kshana::interconnect::FORMATS`) whose
/// signature the start of `b` carries, most specific first: the readers worth trying on it.
pub fn track_candidates(b: &[u8]) -> Vec<&'static str> {
    let head = String::from_utf8_lossy(&b[..b.len().min(8192)]);
    let mut cands: Vec<&'static str> = Vec::new();
    if head.contains("!AIVDM") || head.contains("!AIVDO") {
        cands.push("ais");
    }
    if b.starts_with(b"ULog") {
        cands.push("ulog");
    }
    if head
        .lines()
        .take(20)
        .any(|l| l.starts_with('*') && l.ends_with(';'))
        || head.starts_with('@')
    {
        cands.push("avr");
    }
    if b.first() == Some(&0x1a) {
        cands.push("beast");
    }
    if matches!(b.first(), Some(0xfe) | Some(0xfd)) {
        cands.push("mavlink");
    }
    if head.trim_start().starts_with('{') && head.contains("\"states\"") {
        cands.push("opensky-json");
    }
    if head.starts_with("time,icao24") {
        cands.push("opensky-csv");
    }
    cands
}

/// Ship, aircraft and drone track files the engine's connectors read (`kshana::interconnect`).
fn try_tracks(b: &[u8]) -> Option<Value> {
    use kshana::interconnect::{decode, Options};
    let cands = track_candidates(b);
    for f in cands {
        let Ok(d) = decode(f, b, &Options::default()) else {
            continue;
        };
        if d.fixes.is_empty() || d.bad_checksum + d.malformed > d.read / 2 {
            continue;
        }
        let mut times: Vec<f64> = d.fixes.iter().filter_map(|x| x.t_unix_s).collect();
        times.sort_by(|a, b| a.total_cmp(b));
        let ids: std::collections::BTreeSet<&str> = d.fixes.iter().map(|x| x.id.as_str()).collect();
        let (step, gaps) = gaps_of(&times);
        return Some(json!({
            "ok": true,
            "format": f,
            "label": format!("track file ({f})"),
            "family": "tracks",
            "epochs": d.fixes.len(),
            "span": { "start": Value::Null, "end": Value::Null, "seconds": match (times.first(), times.last()) { (Some(a), Some(z)) => z - a, _ => 0.0 } },
            "interval_s": step,
            "constellations": [],
            "satellites": 0,
            "gaps": [],
            "n_gaps": gaps.len(),
            "opens_as": Value::Null,
            "extra": {"objects": ids.len(), "messages": d.read, "bad_checksum": d.bad_checksum, "malformed": d.malformed},
        }));
    }
    None
}

fn try_clock_log(text: &str) -> Option<Value> {
    use kshana::clock_log::{parse, ClockLogFormat, ClockLogInput, GapPolicy, FORMAT_NAMES};
    for name in FORMAT_NAMES {
        let Ok(fmt) = ClockLogFormat::from_name(name) else {
            continue;
        };
        let mut inp = ClockLogInput {
            format: name.to_string(),
            gaps: Some("longest".into()),
            ..Default::default()
        };
        let mut clocks = Vec::new();
        let p = match parse(fmt, text, &inp, GapPolicy::Longest) {
            Ok(p) => p,
            // A RINEX clock file of several clocks needs one named: the first in the file.
            Err(_) if fmt == ClockLogFormat::RinexClk => {
                clocks = rinex_clock_names(text);
                let Some(first) = clocks.first() else {
                    continue;
                };
                inp.clock = Some(first.clone());
                match parse(fmt, text, &inp, GapPolicy::Longest) {
                    Ok(p) => p,
                    Err(_) => continue,
                }
            }
            Err(_) => continue,
        };
        if p.n_parsed < 2 {
            continue;
        }
        return Some(json!({
            "ok": true,
            "format": name,
            "label": format!("clock log ({name})"),
            "family": "clock-log",
            "epochs": p.n_parsed,
            "span": { "start": Value::Null, "end": Value::Null, "seconds": p.n_grid.saturating_sub(1) as f64 * p.tau0_s },
            "interval_s": p.tau0_s,
            "constellations": [],
            "satellites": 0,
            "gaps": [],
            "n_gaps": p.n_gaps,
            "opens_as": {"kind": "clock-log", "format": name},
            "extra": {"clock": p.clock, "clocks_in_file": clocks.len(), "n_missing": p.n_missing, "tau0_source": p.tau0_source, "data": p.data, "time_system": p.time_system},
        }));
    }
    None
}

/// The clock names of a RINEX clock file's `AS` and `AR` records, in first-seen order (the
/// engine reads one named clock; the detective names the first and counts them).
fn rinex_clock_names(text: &str) -> Vec<String> {
    let mut out: Vec<String> = Vec::new();
    let body = text.split("END OF HEADER").nth(1).unwrap_or("");
    for l in body.lines().take(200_000) {
        if (l.starts_with("AS ") || l.starts_with("AR ")) && l.len() > 8 {
            let n = l[3..8].trim().to_string();
            if !n.is_empty() && !out.contains(&n) {
                out.push(n);
            }
        }
    }
    out
}

fn epochs_secs(
    ts: impl Iterator<Item = kshana::rinex::EpochUtc>,
) -> (Vec<f64>, Option<String>, Option<String>) {
    let all: Vec<kshana::rinex::EpochUtc> = ts.collect();
    let mut secs: Vec<f64> = all.iter().map(|e| e.seconds_from_gps_epoch()).collect();
    secs.sort_by(|a, b| a.total_cmp(b));
    secs.dedup();
    let first = all.iter().min_by(|a, b| {
        a.seconds_from_gps_epoch()
            .total_cmp(&b.seconds_from_gps_epoch())
    });
    let last = all.iter().max_by(|a, b| {
        a.seconds_from_gps_epoch()
            .total_cmp(&b.seconds_from_gps_epoch())
    });
    (secs, first.map(iso), last.map(iso))
}

fn try_rinex(text: &str) -> Option<Result<Value, String>> {
    let (version, kind) = rinex_type(text)?;
    Some(match kind {
        'O' => kshana::rinex_obs::parse_obs(text).map(|o| {
            let (t, a, b) = epochs_secs(o.epochs.iter().map(|e| e.time));
            let ids = o.epochs.iter().flat_map(|e| e.sats.iter().map(|s| s.sat.clone())).collect();
            described(
                "rinex-obs",
                format!("RINEX {version:.2} observation"),
                "gnss-obs",
                &t,
                a,
                b,
                ids,
                json!({"kind": "receiver-trust", "format": "rinex"}),
                json!({"version": version, "obs_types": o.header.obs_types.iter().map(|(s, c)| json!({"system": s.to_string(), "codes": c})).collect::<Vec<_>>()}),
            )
        }),
        'C' => match try_clock_log(text) {
            Some(v) => Ok(v),
            None => Err("a RINEX clock file the engine could not read".into()),
        },
        'N' | 'G' | 'H' | 'L' => kshana::rinex::parse_nav(text).map(|n| {
            let (t, a, b) = epochs_secs(n.iter().map(|e| e.toc));
            let ids = n.iter().map(|e| format!("{}{:02}", e.system, e.prn)).collect();
            let unhealthy = n.iter().filter(|e| e.sv_health != 0.0).count();
            described(
                "rinex-nav",
                format!("RINEX {version:.2} navigation"),
                "navigation",
                &t,
                a,
                b,
                ids,
                Value::Null,
                json!({"version": version, "records": n.len(), "records_unhealthy": unhealthy}),
            )
        }),
        other => Err(format!("RINEX type {other:?} is not one the engine reads here")),
    })
}

fn try_sp3(text: &str) -> Option<Result<Value, String>> {
    let b = text.as_bytes();
    if !(b.len() > 2 && b[0] == b'#' && (b[1] == b'c' || b[1] == b'd')) {
        return None;
    }
    Some(kshana::sp3::parse_sp3(text).map(|f| {
        let (t, a, c) = epochs_secs(f.epochs.iter().map(|e| e.time));
        let ids = f.observed_satellites();
        described(
            "sp3",
            format!("SP3-{} precise orbit{}", f.header.version, if f.header.has_velocity { " and velocity" } else { "" }),
            "orbit",
            &t,
            a,
            c,
            ids,
            Value::Null,
            json!({"declared_epochs": f.header.num_epochs, "declared_satellites": f.header.sat_ids.len()}),
        )
    }))
}

fn iq_answer(fmt: &str, bps: u64, bytes: u64, rate: Option<f64>, extra: Value) -> Value {
    let samples = bytes / bps;
    json!({
        "ok": true,
        "format": fmt,
        "label": format!("IQ recording ({fmt}, {bps} bytes per sample)"),
        "family": "iq",
        "epochs": Value::Null,
        "span": { "start": extra.get("datetime").cloned().unwrap_or(Value::Null), "end": Value::Null, "seconds": rate.filter(|r| *r > 0.0).map(|r| samples as f64 / r) },
        "interval_s": rate.filter(|r| *r > 0.0).map(|r| 1.0 / r),
        "constellations": [],
        "satellites": 0,
        "gaps": [],
        "n_gaps": 0,
        "opens_as": {"kind": "iq", "format": fmt},
        "extra": json!({"samples": samples, "sample_rate_hz": rate}).as_object().cloned().map(|mut o| { if let Value::Object(e) = extra { o.extend(e); } Value::Object(o) }).unwrap_or(Value::Null),
    })
}

fn sigmf_answer(meta_json: &str, data_bytes: Option<u64>) -> Result<Value, String> {
    let m = kshana::sigmf::parse_meta(meta_json)?;
    let bps = match m.global.datatype.as_str() {
        "cf32_le" => 8,
        "ci16_le" => 4,
        _ => 2,
    };
    let cap = m.captures.first();
    Ok(iq_answer(
        &m.global.datatype,
        bps,
        data_bytes.unwrap_or(0),
        m.global.sample_rate,
        json!({"sigmf": true, "centre_hz": cap.and_then(|c| c.frequency), "datetime": cap.and_then(|c| c.datetime.clone()), "description": m.global.description, "data_file_found": data_bytes.is_some()}),
    ))
}

/// What the engine's readers make of `bytes` (the head of a file of `total` bytes named
/// `name`). `sibling` gives the size of a file next to this one (for a SigMF pair).
pub fn inspect_bytes(
    name: &str,
    bytes: &[u8],
    total: u64,
    sibling: &dyn Fn(&str) -> Option<u64>,
) -> Value {
    let lower = name.to_ascii_lowercase();
    let ext = lower.rsplit('.').next().unwrap_or("").to_string();
    let whole = (bytes.len() as u64) >= total;
    let mut v = (|| {
        if lower.ends_with(".sigmf-meta") {
            let data = sibling(&format!(
                "{}.sigmf-data",
                &name[..name.len() - ".sigmf-meta".len()]
            ));
            return sigmf_answer(&String::from_utf8_lossy(bytes), data)
                .unwrap_or_else(|e| unknown(name, &e));
        }
        if lower.ends_with(".sigmf-data") {
            let meta = format!("{}.sigmf-meta", &name[..name.len() - ".sigmf-data".len()]);
            return json!({"ok": false, "format": "sigmf-data", "family": "iq", "reason": format!("a SigMF data file: drop its metadata file {meta} (the two go together)")});
        }
        if let Some((fmt, bps)) = iq_ext(&ext) {
            return iq_answer(fmt, bps, total, None, json!({"sigmf": false}));
        }
        let text = String::from_utf8_lossy(bytes);
        if let Some(r) = try_rinex(&text) {
            return r.unwrap_or_else(|e| unknown(name, &e));
        }
        if let Some(r) = try_sp3(&text) {
            return r.unwrap_or_else(|e| unknown(name, &e));
        }
        if let Some(v) = try_tracks(bytes) {
            return v;
        }
        match try_receiver_log(bytes) {
            Some(Ok(v)) => return v,
            Some(Err(e)) => return unknown(name, &e),
            None => {}
        }
        if std::str::from_utf8(bytes).is_ok() {
            if let Some(v) = try_clock_log(&text) {
                return v;
            }
        }
        unknown(name, "")
    })();
    if let Value::Object(o) = &mut v {
        o.insert("name".into(), json!(name));
        o.insert("bytes".into(), json!(total));
        o.insert(
            "whole".into(),
            json!(whole || o.get("family") == Some(&json!("iq"))),
        );
        o.insert("read_bytes".into(), json!(bytes.len()));
    }
    v
}

/// The message for a file the engine does not read.
fn unknown(name: &str, why: &str) -> Value {
    json!({
        "ok": false,
        "format": Value::Null,
        "family": Value::Null,
        "name": name,
        "reason": if why.is_empty() { "the engine does not read this file".to_string() } else { why.to_string() },
        "reads": ["RINEX observation, navigation and clock", "SP3", "u-blox UBX", "NMEA 0183", "Septentrio SBF", "NovAtel OEM7", "RTCM 3 MSM", "RTKLIB .pos", "Android GnssLogger", "GNSS-SDR monitor", "Swift SBP", "Javad GREIS", "Unicore N4", "clock logs (TimeLab, TICC, linuxptp, chrony, ntpd, White Rabbit, CGGTTS, PPS)", "IQ (SigMF; raw cf32, ci16, ci8, cu8)", "AIS, ADS-B (Beast, AVR, OpenSky), MAVLink and PX4 ULog tracks"],
    })
}

/// Describe a file or a folder on disk.
pub fn inspect(path: &str) -> Result<Value, String> {
    let p = Path::new(path);
    let m = std::fs::metadata(p).map_err(|e| format!("{path}: {e}"))?;
    if m.is_dir() {
        return Ok(inspect_folder(p));
    }
    Ok(inspect_file(p, m.len()))
}

fn inspect_file(p: &Path, size: u64) -> Value {
    use std::io::Read;
    let name = p
        .file_name()
        .map(|n| n.to_string_lossy().to_string())
        .unwrap_or_default();
    let ext = name.rsplit('.').next().unwrap_or("").to_ascii_lowercase();
    // An IQ recording is described by its size: nothing of it is read.
    let want = if iq_ext(&ext).is_some() || ext == "sigmf-data" {
        0
    } else {
        size.min(HEAD_BYTES)
    };
    let mut buf = vec![0u8; want as usize];
    if want > 0 {
        if let Err(e) = std::fs::File::open(p).and_then(|mut f| f.read_exact(&mut buf)) {
            return unknown(&name, &format!("could not be read: {e}"));
        }
    }
    let dir = p.parent().map(Path::to_path_buf);
    let sibling = |n: &str| {
        dir.as_ref()
            .and_then(|d| std::fs::metadata(d.join(n)).ok())
            .map(|m| m.len())
    };
    let mut v = inspect_bytes(&name, &buf, size, &sibling);
    if let Value::Object(o) = &mut v {
        o.insert("path".into(), json!(p.to_string_lossy()));
    }
    v
}

fn inspect_folder(p: &Path) -> Value {
    let mut files = Vec::new();
    let mut stack = vec![(p.to_path_buf(), 0usize)];
    let mut more = false;
    while let Some((d, depth)) = stack.pop() {
        let Ok(rd) = std::fs::read_dir(&d) else {
            continue;
        };
        let mut entries: Vec<_> = rd.filter_map(Result::ok).collect();
        entries.sort_by_key(|e| e.file_name());
        for e in entries {
            let path = e.path();
            let hidden = e.file_name().to_string_lossy().starts_with('.');
            if hidden {
                continue;
            }
            if path.is_dir() {
                if depth < 2 {
                    stack.push((path, depth + 1));
                }
            } else if files.len() < MAX_FOLDER_FILES {
                files.push(path);
            } else {
                more = true;
            }
        }
    }
    let entries: Vec<Value> = files
        .iter()
        .map(|f| inspect_file(f, std::fs::metadata(f).map(|m| m.len()).unwrap_or(0)))
        .collect();
    let read = entries.iter().filter(|e| e["ok"] == json!(true)).count();
    json!({
        "ok": read > 0,
        "family": "folder",
        "format": "folder",
        "name": p.file_name().map(|n| n.to_string_lossy().to_string()),
        "path": p.to_string_lossy(),
        "entries": entries,
        "readable": read,
        "more": more,
        "reason": if read == 0 { "no file in this folder is one the engine reads" } else { "" },
    })
}

#[cfg(test)]
mod tests {
    use super::*;

    fn fixture(rel: &str) -> String {
        format!("{}/../../../{rel}", env!("CARGO_MANIFEST_DIR"))
    }

    #[test]
    fn gaps_are_spans_longer_than_one_and_a_half_intervals() {
        let (step, gaps) = gaps_of(&[0.0, 1.0, 2.0, 3.0, 7.0, 8.0, 9.0]);
        assert_eq!(step, Some(1.0));
        assert_eq!(gaps, vec![(3.0, 7.0)]);
        assert_eq!(gaps_of(&[5.0]), (None, vec![]));
    }

    #[test]
    fn rinex_observation_is_read_by_the_engine() {
        let v = inspect(&fixture(
            "tests/fixtures/igs/ABMF00GLP_R_20181330000_01D_30S_MO.rnx",
        ))
        .unwrap();
        assert_eq!(v["ok"], json!(true), "{v}");
        assert_eq!(v["format"], json!("rinex-obs"));
        assert!(v["epochs"].as_u64().unwrap() > 0);
        assert!(
            v["constellations"]
                .as_array()
                .unwrap()
                .iter()
                .any(|c| c == "GPS"),
            "{v}"
        );
        assert_eq!(v["opens_as"]["kind"], json!("receiver-trust"));
        assert!(
            v["span"]["start"]
                .as_str()
                .unwrap()
                .starts_with("2018-05-13"),
            "{v}"
        );
    }

    #[test]
    fn navigation_sp3_and_clock_files_are_named() {
        let nav = inspect(&fixture(
            "tests/fixtures/igs/BRDM00DLR_R_20130010000_01D_MN.rnx",
        ))
        .unwrap();
        assert_eq!(nav["format"], json!("rinex-nav"), "{nav}");
        assert!(nav["satellites"].as_u64().unwrap() > 0);
        let sp3 = inspect(&fixture("tests/fixtures/igs/igs_sample.sp3")).unwrap();
        assert_eq!(sp3["format"], json!("sp3"), "{sp3}");
        assert!(sp3["epochs"].as_u64().unwrap() > 0);
        let clk = inspect(&fixture("tests/fixtures/clock_log/rinex_clk_304.clk")).unwrap();
        assert_eq!(clk["family"], json!("clock-log"), "{clk}");
    }

    #[test]
    fn receiver_logs_are_named_by_the_engine_readers() {
        let nmea = inspect(&fixture(
            "examples/receiver-trust/illustrative-jamming.nmea",
        ))
        .unwrap();
        assert_eq!(nmea["format"], json!("nmea"), "{nmea}");
        assert!(nmea["span"]["seconds"].as_f64().unwrap() > 0.0);
        let ubx = inspect(&fixture("examples/osnma/stream-good.ubx")).unwrap();
        assert_eq!(ubx["name"], json!("stream-good.ubx"));
        // A UBX stream of navigation bits only: named, with the engine's reason.
        assert_eq!(ubx["ok"], json!(false), "{ubx}");
        assert!(ubx["reason"].as_str().unwrap().contains("UBX"), "{ubx}");
        let ais = inspect(&fixture("examples/tracks/ais.nmea")).unwrap();
        assert_eq!(ais["format"], json!("ais"), "{ais}");
        assert!(ais["extra"]["objects"].as_u64().unwrap() > 0);
    }

    #[test]
    fn unknown_files_get_a_clear_message_and_iq_is_described_by_its_size() {
        let none = |_: &str| None;
        let v = inspect_bytes("notes.txt", b"hello there\nnothing to see\n", 27, &none);
        assert_eq!(v["ok"], json!(false));
        assert!(v["reason"].as_str().unwrap().contains("does not read"));
        assert!(v["reads"].as_array().unwrap().len() > 5);
        let iq = inspect_bytes("cap.cf32", b"", 8 * 1000, &none);
        assert_eq!(iq["family"], json!("iq"));
        assert_eq!(iq["extra"]["samples"], json!(1000));
        let meta = r#"{"global":{"core:datatype":"ci16_le","core:sample_rate":1000.0,"core:version":"1.0.0"},"captures":[{"core:sample_start":0}],"annotations":[]}"#;
        let sig = inspect_bytes(
            "rec.sigmf-meta",
            meta.as_bytes(),
            meta.len() as u64,
            &|n: &str| (n == "rec.sigmf-data").then_some(4000),
        );
        assert_eq!(sig["format"], json!("ci16_le"), "{sig}");
        assert_eq!(sig["span"]["seconds"], json!(1.0));
    }

    #[test]
    fn a_folder_lists_what_each_file_is() {
        let v = inspect(&fixture("tests/fixtures/igs")).unwrap();
        assert_eq!(v["family"], json!("folder"));
        let fmts: Vec<&str> = v["entries"]
            .as_array()
            .unwrap()
            .iter()
            .filter_map(|e| e["format"].as_str())
            .collect();
        assert!(
            fmts.contains(&"rinex-obs") && fmts.contains(&"sp3"),
            "{fmts:?}"
        );
        // The NOTICE file is not one the engine reads, and says so.
        assert!(v["entries"]
            .as_array()
            .unwrap()
            .iter()
            .any(|e| e["ok"] == json!(false)));
    }
}
