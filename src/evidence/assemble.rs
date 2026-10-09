// SPDX-License-Identifier: AGPL-3.0-only
//! Assembling a `receiver-trust` evidence pack from a scenario and the log's bytes.
//!
//! [`build_receiver_trust_pack`] is the one function every surface calls (the command line,
//! Python, WebAssembly, the MCP server): bytes in, [`Files`] out, no file system, no clock
//! (the creation time is an argument), no key storage (the signing seed is an argument).

use super::bundle::{
    create_bundle, fingerprint, public_key_hex, sha256_hex, slice_for_window, EvidenceInput, Files,
    Window,
};
use crate::receiver_trust::ingest::read_log;
use crate::receiver_trust::scenario::{self, ReceiverTrustScenario};
use serde::Serialize;
use serde_json::{json, Value};

/// What to build a pack from.
pub struct PackRequest<'a> {
    /// The scenario that assesses the log (its `[log]` source is not read).
    pub scenario: &'a ReceiverTrustScenario,
    /// The log's bytes.
    pub log_bytes: &'a [u8],
    /// The RINEX broadcast navigation file's bytes, where the scenario uses one.
    pub nav_bytes: Option<&'a [u8]>,
    /// The log's file name for the record (a path is reduced to its last component).
    pub log_file_name: &'a str,
    /// Window start: seconds since the first epoch, or ISO-8601 UTC when the log states
    /// its start time.
    pub from: &'a str,
    /// Window end, in the same forms.
    pub to: &'a str,
    /// Title for the summary and manifest.
    pub title: &'a str,
    /// Creation time, RFC 3339 UTC; `None` leaves it out and makes the pack reproducible.
    pub created_utc: Option<&'a str>,
}

/// What was built, besides the files.
#[derive(Clone, Debug, Serialize)]
pub struct PackSummary {
    /// The pack's files.
    #[serde(skip)]
    pub files: Files,
    /// Epochs in the window.
    pub epochs_in_window: usize,
    /// The window in seconds since the first epoch.
    pub window: Window,
    /// The slice of the log bundled, or `None` for the whole log.
    pub slice: Option<(usize, usize)>,
    /// SHA-256 of `manifest.json`: what an RFC 3161 authority should stamp.
    pub manifest_sha256: String,
    /// Fingerprint of the signing key.
    pub signer_fingerprint: String,
}

/// Seconds since 1970 for `YYYY-MM-DDTHH:MM:SS[.f][Z]` (UTC only).
fn parse_rfc3339_utc(s: &str) -> Option<f64> {
    let s = s.trim().strip_suffix('Z').unwrap_or(s.trim());
    let (d, t) = s.split_once('T')?;
    let mut dp = d.split('-');
    let (y, m, day): (i64, i64, i64) = (
        dp.next()?.parse().ok()?,
        dp.next()?.parse().ok()?,
        dp.next()?.parse().ok()?,
    );
    let mut tp = t.split(':');
    let (hh, mm): (f64, f64) = (tp.next()?.parse().ok()?, tp.next()?.parse().ok()?);
    let ss: f64 = tp.next()?.parse().ok()?;
    if dp.next().is_some()
        || tp.next().is_some()
        || !(1..=12).contains(&m)
        || !(1..=31).contains(&day)
    {
        return None;
    }
    // Howard Hinnant's days-from-civil.
    let y = if m <= 2 { y - 1 } else { y };
    let era = y.div_euclid(400);
    let yoe = y.rem_euclid(400);
    let doy = (153 * ((m + 9) % 12) + 2) / 5 + day - 1;
    let doe = yoe * 365 + yoe / 4 - yoe / 100 + doy;
    let days = era * 146_097 + doe - 719_468;
    Some(days as f64 * 86_400.0 + hh * 3600.0 + mm * 60.0 + ss)
}

fn parse_time(arg: &str, start_label: Option<&str>) -> Result<f64, String> {
    if let Ok(x) = arg.parse::<f64>() {
        return if x.is_finite() {
            Ok(x)
        } else {
            Err(format!("`{arg}` is not finite"))
        };
    }
    let t = parse_rfc3339_utc(arg)
        .ok_or_else(|| format!("`{arg}` is neither seconds nor an ISO-8601 UTC time"))?;
    let start = start_label.and_then(parse_rfc3339_utc).ok_or(
        "the log does not state a parseable start time; give seconds since the first epoch",
    )?;
    Ok(t - start)
}

/// Make a source description safe to publish: no directory names, no inline payloads.
fn sanitise_source(v: &mut Value) {
    if let Some(o) = v.as_object_mut() {
        if let Some(p) = o.get("path").and_then(Value::as_str).map(str::to_string) {
            o.insert(
                "path".into(),
                json!(p.rsplit(['/', '\\']).next().unwrap_or_default()),
            );
        }
        for k in ["text", "base64"] {
            if let Some(s) = o.get(k).and_then(Value::as_str).map(str::len) {
                o.insert(k.into(), json!(format!("<inline, {s} bytes>")));
            }
        }
    }
}

/// Assess the log, take the window and build the signed pack.
pub fn build_receiver_trust_pack(
    req: &PackRequest<'_>,
    seed: &[u8; 32],
    timestamp_token: Option<&[u8]>,
) -> Result<PackSummary, String> {
    let scn = req.scenario;
    let result = scenario::run_receiver_trust_bytes(scn, req.log_bytes, req.nav_bytes)?;
    let t0 = parse_time(req.from, result.log.start_label.as_deref())?;
    let t1 = parse_time(req.to, result.log.start_label.as_deref())?;
    let epochs: Vec<Value> = result
        .epochs
        .iter()
        .filter(|e| e.t_s >= t0 && e.t_s <= t1)
        .map(|e| serde_json::to_value(e).map_err(|e| e.to_string()))
        .collect::<Result<_, _>>()?;
    if epochs.is_empty() {
        return Err(format!(
            "no epoch of the log falls between {t0} s and {t1} s (the log spans 0 to {} s)",
            result.log.duration_s
        ));
    }
    let mut scn_v = serde_json::to_value(scn).map_err(|e| e.to_string())?;
    if let Some(log) = scn_v.get_mut("log") {
        sanitise_source(log);
        if let Some(nav) = log.get_mut("nav") {
            sanitise_source(nav);
        }
    }
    let config = json!({
        "scenario": scn_v,
        "scenario_hash": result.scenario_hash,
        "monitors_run": result.monitors_run,
        "baseline": result.baseline,
        "honesty_label": scenario::LABEL,
    });
    // The window's bytes, where every epoch in it reports its source span; otherwise the
    // whole log is bundled and the manifest says so.
    let slice = read_log(scn.log.format, req.log_bytes)
        .ok()
        .and_then(|tl| slice_for_window(tl.epochs.iter().map(|e| (e.t_s, e.source_span)), t0, t1));
    let log_format = serde_json::to_value(result.log.format)
        .map_err(|e| e.to_string())?
        .as_str()
        .unwrap_or("unknown")
        .to_string();
    let window = Window {
        from_s: t0,
        to_s: t1,
    };
    let input = EvidenceInput {
        title: req.title,
        engine_version: env!("CARGO_PKG_VERSION"),
        log_format: &log_format,
        log_file_name: req.log_file_name,
        log_bytes: req.log_bytes,
        start_label: result.log.start_label.as_deref(),
        slice,
        window,
        config,
        epochs,
        created_utc: req.created_utc,
    };
    let files = create_bundle(&input, seed, timestamp_token).map_err(|e| e.to_string())?;
    let manifest_sha256 = files
        .get("manifest.json")
        .map(|b| sha256_hex(b))
        .unwrap_or_default();
    Ok(PackSummary {
        epochs_in_window: input.epochs.len(),
        window,
        slice,
        manifest_sha256,
        signer_fingerprint: fingerprint(&hex::decode(public_key_hex(seed)).unwrap_or_default()),
        files,
    })
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn rfc3339_parsing() {
        assert_eq!(parse_rfc3339_utc("1970-01-01T00:00:00Z"), Some(0.0));
        assert_eq!(
            parse_rfc3339_utc("2000-02-29T00:00:00Z"),
            Some(951_782_400.0)
        );
        assert_eq!(
            parse_rfc3339_utc("2025-12-31T23:59:59.5Z"),
            Some(1_767_225_599.5)
        );
        assert_eq!(
            parse_rfc3339_utc("hh:mm:ss.mmm UTC (date not in log)"),
            None
        );
        assert_eq!(parse_rfc3339_utc("2025-13-01T00:00:00Z"), None);
    }

    #[test]
    fn time_arguments() {
        assert_eq!(parse_time("120", None), Ok(120.0));
        assert_eq!(
            parse_time("2026-01-01T00:02:00Z", Some("2026-01-01T00:00:00Z")),
            Ok(120.0)
        );
        assert!(parse_time("2026-01-01T00:02:00Z", None).is_err());
        assert!(parse_time("soon", None).is_err());
    }
}
