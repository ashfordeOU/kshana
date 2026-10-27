// SPDX-License-Identifier: AGPL-3.0-only
//! Assembling a `receiver-trust` evidence pack from a scenario and the log's bytes.
//!
//! [`build_receiver_trust_pack`] is the one function every surface calls (the command line,
//! Python, WebAssembly, the MCP server): bytes in, [`Files`] out, no file system, no clock
//! (the creation time is an argument), no key storage (the signing seed is an argument).

use super::bundle::{
    create_bundle_attested, fingerprint, public_key_hex, sha256_hex, slice_for_window,
    EvidenceInput, Files, Window,
};
use crate::receiver_trust::ingest::read_log;
use crate::receiver_trust::scenario::{self, ReceiverTrustScenario};
use crate::telemetry::time::parse_rfc3339_utc;
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
    /// The IMU file's bytes, where the scenario has a `[log.imu]`. Its SHA-256 is part of
    /// the scenario hash the pack records.
    pub imu_bytes: Option<&'a [u8]>,
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

fn parse_time(arg: &str, start_label: Option<&str>) -> Result<f64, String> {
    if let Ok(x) = arg.parse::<f64>() {
        return if x.is_finite() {
            Ok(x)
        } else {
            Err(crate::terr!("e-evidence-assemble-is-not-finite", arg = arg))
        };
    }
    let t = parse_rfc3339_utc(arg)
        .ok_or_else(|| crate::terr!("e-evidence-assemble-is-neither-seconds-nor-an", arg = arg))?;
    let start = start_label
        .and_then(parse_rfc3339_utc)
        .ok_or_else(|| crate::terr!("e-evidence-assemble-the-log-does-not-state"))?;
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
    build_receiver_trust_pack_full(req, seed, timestamp_token, None, &[])
}

/// [`build_receiver_trust_pack`] with the operator's lab attestation recorded in the signed
/// manifest (see [`super::lab::LabAttestation`]).
pub fn build_receiver_trust_pack_attested(
    req: &PackRequest<'_>,
    seed: &[u8; 32],
    timestamp_token: Option<&[u8]>,
    lab_attestation: Option<&super::lab::LabAttestation>,
) -> Result<PackSummary, String> {
    build_receiver_trust_pack_full(req, seed, timestamp_token, lab_attestation, &[])
}

/// As [`build_receiver_trust_pack`], with extra top-level entries in `config.json` (so inside the
/// signed hash chain), for example the scorecard of `kshana jammertest score`. An entry named
/// like one the pack already writes is refused.
pub fn build_receiver_trust_pack_with(
    req: &PackRequest<'_>,
    seed: &[u8; 32],
    timestamp_token: Option<&[u8]>,
    extra_config: &[(&str, Value)],
) -> Result<PackSummary, String> {
    build_receiver_trust_pack_full(req, seed, timestamp_token, None, extra_config)
}

/// As [`build_receiver_trust_pack`], with `extra` added to `config.json` under the key
/// `round_trip` (so the manifest's file hashes and signature cover it).
pub(crate) fn build_pack_with_extra(
    req: &PackRequest<'_>,
    seed: &[u8; 32],
    timestamp_token: Option<&[u8]>,
    extra: Option<Value>,
) -> Result<PackSummary, String> {
    match extra {
        Some(x) => {
            build_receiver_trust_pack_full(req, seed, timestamp_token, None, &[("round_trip", x)])
        }
        None => build_receiver_trust_pack_full(req, seed, timestamp_token, None, &[]),
    }
}

/// The pack builder with both a lab attestation and extra `config.json` entries; the other
/// `build_receiver_trust_pack*` functions call it.
pub fn build_receiver_trust_pack_full(
    req: &PackRequest<'_>,
    seed: &[u8; 32],
    timestamp_token: Option<&[u8]>,
    lab_attestation: Option<&super::lab::LabAttestation>,
    extra_config: &[(&str, Value)],
) -> Result<PackSummary, String> {
    let scn = req.scenario;
    // The epochs, notes and advisory the run produces go into the signed files: they are English in
    // every language. An error is shown in the user's language, by running again to make it.
    let run =
        || scenario::run_receiver_trust_bytes_imu(scn, req.log_bytes, req.nav_bytes, req.imu_bytes);
    let result = match crate::i18n::with_lang(crate::i18n::Lang::english(), run) {
        Ok(r) => r,
        Err(english) => return Err(run().err().unwrap_or(english)),
    };
    let t0 = parse_time(req.from, result.log.start_label.as_deref())?;
    let t1 = parse_time(req.to, result.log.start_label.as_deref())?;
    let epochs: Vec<Value> = result
        .epochs
        .iter()
        .filter(|e| e.t_s >= t0 && e.t_s <= t1)
        .map(|e| serde_json::to_value(e).map_err(|e| e.to_string()))
        .collect::<Result<_, _>>()?;
    if epochs.is_empty() {
        return Err(crate::terr!(
            "e-evidence-assemble-no-epoch-of-the-log",
            t0 = t0,
            t1 = t1,
            duration_s = result.log.duration_s
        ));
    }
    let mut scn_v = serde_json::to_value(scn).map_err(|e| e.to_string())?;
    if let Some(log) = scn_v.get_mut("log") {
        sanitise_source(log);
        if let Some(nav) = log.get_mut("nav") {
            sanitise_source(nav);
        }
        if let Some(imu) = log.get_mut("imu") {
            sanitise_source(imu);
        }
    }
    let mut config = json!({
        "scenario": scn_v,
        "scenario_hash": result.scenario_hash,
        "monitors_run": result.monitors_run,
        "baseline": result.baseline,
        "honesty_label": scenario::LABEL,
        // A vessel's outputs all carry the advisory statement; so does its evidence pack.
        "advisory": result.advisory,
        // The geometry thresholds and their provenance (0.36); each epoch carries its
        // geometry and the attribution of its degradation.
        "geometry_model": result.geometry_model,
    });
    // The evidence label (0.40), inside `config.json` so the manifest's file hash, the hash chain and the signature cover
    // it. A pack made before 0.40 has neither the `evidence` entry nor `config_version`; it verifies unchanged.
    {
        let mut ids: Vec<&str> = crate::evidence_label::TOOL_ROWS
            .iter()
            .find(|(t, _)| *t == "evidence-pack")
            .map(|(_, ids)| ids.to_vec())
            .unwrap_or_default();
        for (k, _) in extra_config {
            match *k {
                // The jammertest scorecard: the scoring rows.
                "jammertest_score" => ids.extend(["VM-47968885", "VM-35257d18"]),
                // The laboratory round trip.
                "round_trip" => ids.push("VM-1a79c093"),
                _ => {}
            }
        }
        let label = crate::evidence_label::EvidenceLabel::for_ids(&ids)
            .ok_or_else(|| crate::terr!("e-evidence-assemble-the-evidence-pack-rows-are"))?;
        let o = config
            .as_object_mut()
            .ok_or_else(|| crate::terr!("e-evidence-assemble-config-is-not-an-object"))?;
        o.insert(
            "evidence".to_string(),
            serde_json::to_value(&label).map_err(|e| e.to_string())?,
        );
        o.insert("config_version".to_string(), json!("1.1"));
    }
    for (k, v) in extra_config {
        let o = config
            .as_object_mut()
            .ok_or_else(|| crate::terr!("e-evidence-assemble-config-is-not-an-object"))?;
        if o.insert((*k).to_string(), v.clone()).is_some() {
            return Err(crate::terr!(
                "e-evidence-assemble-config-json-already-has-an",
                k = k
            ));
        }
    }
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
    let files = create_bundle_attested(&input, seed, timestamp_token, lab_attestation)
        .map_err(|e| e.to_string())?;
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
