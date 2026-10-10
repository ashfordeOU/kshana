// SPDX-License-Identifier: AGPL-3.0-only
//! String-in, string-out entry points for the 0.35 capabilities, shared by the Python
//! bindings, the WebAssembly build and the Model Context Protocol (MCP) server.
//!
//! The feature modules own their methods and expose in-memory functions
//! ([`crate::receiver_trust::assess`], [`crate::interference_map::api`],
//! [`crate::nmea_synth::generate_from_toml`], [`crate::evidence`]); this layer adds what a
//! surface needs on top and nothing else: a size cap on every text input, the refusal of a
//! `path` source where the caller must not read the host's files, JSON shaping, and the
//! assembly of an evidence pack from a receiver-trust run (which the command line does from
//! files). It adds no method of its own: every threshold, the privacy rule and the output
//! schemas are the feature modules', called unchanged.
//!
//! Every input is capped by [`MAX_INPUT_BYTES`] unless the caller passes a tighter cap, so a
//! surface that accepts uploads cannot be made to allocate without bound.

use crate::evidence::{
    build_receiver_trust_pack, generate_seed, public_key_hex, verify_bundle, Files, PackRequest,
    VerifyOptions,
};
use crate::interference_map::api::{self, DatasetSpec, DEFAULT_CELL_DEG};
use crate::receiver_trust::assess::{self, ExcerptAssessment};
use crate::receiver_trust::live::parse_live_scenario;
use crate::receiver_trust::scenario::{self, ReceiverTrustScenario, TrustOutput};
use serde_json::{json, Value};

/// Largest single text input any function here accepts (64 MiB).
pub const MAX_INPUT_BYTES: usize = 64 * 1024 * 1024;

/// Which source an interference map is built from.
#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub enum MapSource {
    /// Aircraft reports (`adsb-lol` preset or `custom`).
    Adsb,
    /// Ship reports (`noaa-marinecadastre`, `kystverket` or `custom`).
    Ais,
}

impl MapSource {
    /// Parse `"adsb"` or `"ais"`.
    pub fn parse(s: &str) -> Result<Self, String> {
        match s {
            "adsb" => Ok(Self::Adsb),
            "ais" => Ok(Self::Ais),
            o => Err(format!("unknown source `{o}`: use `adsb` or `ais`")),
        }
    }
}

/// The licence fields a `custom` dataset must state.
#[derive(Clone, Debug, Default)]
pub struct CustomDataset {
    /// Licence name.
    pub licence: String,
    /// Licence URL.
    pub licence_url: String,
    /// Attribution text.
    pub attribution: String,
}

/// One published day of an interference map.
#[derive(Clone, Debug)]
pub struct MapDay {
    /// Suggested file name (one file per source per UTC day).
    pub file_name: String,
    /// UTC date, `YYYY-MM-DD`.
    pub date: String,
    /// Cells published (at least five distinct aircraft or vessels each).
    pub cells_published: usize,
    /// Cells flagged degraded or anomalous.
    pub cells_flagged: usize,
    /// The `kshana-interference-map/v1` GeoJSON document, pretty-printed.
    pub geojson: String,
}

fn cap(what: &str, text: &str, max: usize) -> Result<(), String> {
    cap_len(what, text.len(), max)
}

fn cap_len(what: &str, len: usize, max: usize) -> Result<(), String> {
    let limit = max.min(MAX_INPUT_BYTES);
    if len > limit {
        return Err(format!(
            "{what} is {len} bytes, over the {limit}-byte limit"
        ));
    }
    Ok(())
}

/// Scenario fields that make the engine read a file or a folder by name, wherever they
/// appear in a scenario (a campaign nests scenarios). A surface that takes scenario text from
/// an untrusted party refuses a scenario that sets any of them: give the content inline, or
/// run the scenario where the files are (the command line, or Python in your own process).
/// `tests/scenario_file_sources_guard.rs` fails when a scenario type gains a field that
/// looks like a file source and is neither listed here nor explained there.
pub const FILE_SOURCE_KEYS: &[&str] = &[
    "csv_path",
    "data_dir",
    "data_path",
    "earth_orientation_kernel_path",
    "ephemeris_path",
    "meta_path",
    "moon_orientation_kernel_path",
    "normal_points_dir",
    "planetary_kernel_path",
    "reflectors_path",
    "stations_path",
];

/// Fields that are file names only for one scenario kind (elsewhere they carry the file's
/// body inline).
pub const FILE_SOURCE_KEYS_BY_KIND: &[(&str, &[&str])] = &[(
    "realtime-frame-eop",
    &["eop_finals2000a", "eop_finals2000a_later"],
)];

/// Tables whose `path` key names a receiver log or its navigation file.
const FILE_SOURCE_TABLES: &[&str] = &["log", "nav"];

/// Refuse a scenario that names a file or folder to read, and one over `max_bytes`.
///
/// For the surfaces that run scenario text from an untrusted party (the MCP server): they
/// accept inline content only. A text that is not valid TOML passes, because the engine
/// refuses it with its own message.
pub fn reject_file_sources(toml_text: &str, max_bytes: usize) -> Result<(), String> {
    cap("scenario", toml_text, max_bytes)?;
    let Ok(v) = toml_text.parse::<toml::Table>() else {
        return Ok(());
    };
    fn walk(t: &toml::Table, kind: &str, table_name: &str) -> Result<(), String> {
        let kind = t.get("kind").and_then(toml::Value::as_str).unwrap_or(kind);
        for (k, v) in t {
            let by_kind = FILE_SOURCE_KEYS_BY_KIND
                .iter()
                .any(|(kd, keys)| *kd == kind && keys.contains(&k.as_str()));
            let in_table = k == "path" && FILE_SOURCE_TABLES.contains(&table_name);
            if FILE_SOURCE_KEYS.contains(&k.as_str()) || by_kind || in_table {
                return Err(format!(
                    "the field `{k}` names a file: this surface accepts inline content only"
                ));
            }
            match v {
                toml::Value::Table(inner) => walk(inner, kind, k)?,
                toml::Value::Array(items) => {
                    for item in items {
                        if let toml::Value::Table(inner) = item {
                            walk(inner, kind, k)?;
                        }
                    }
                }
                _ => {}
            }
        }
        Ok(())
    }
    walk(&v, "", "")
}

/// Assess a receiver log from a `receiver-trust` scenario whose log and navigation bytes are
/// **inline** (`text` or `base64`). A scenario that names a `path` is refused, so a caller
/// that takes the TOML from an untrusted party (a network service, an AI agent) cannot read
/// the host's files. `max_bytes` caps the TOML, and therefore the inline log.
pub fn assess_receiver_log_inline(toml: &str, max_bytes: usize) -> Result<TrustOutput, String> {
    reject_file_sources(toml, max_bytes)?;
    let scn: ReceiverTrustScenario =
        toml::from_str(toml).map_err(|e| format!("invalid receiver-trust scenario: {e}"))?;
    if scn.log.source.path.is_some() || scn.log.nav.as_ref().is_some_and(|n| n.path.is_some()) {
        return Err(
            "`path` sources are not accepted here: give the log inline as `text` or `base64`"
                .into(),
        );
    }
    scenario::run_scenario(&scn)
}

/// Assess a vessel's NMEA 0183 log: the session TOML (`[platform] kind = "vessel"`; no `[log]`
/// needed) and the log's bytes, scored as a batch run. Returns the result document as JSON,
/// the same as `kshana receiver-trust <session.toml>` writes to `result.json`.
pub fn assess_vessel_log_json(
    session_toml: &str,
    log: &[u8],
    max_bytes: usize,
) -> Result<String, String> {
    cap("session", session_toml, max_bytes)?;
    cap_len("log", log.len(), max_bytes)?;
    let r = assess::assess_vessel_log(session_toml, log)?;
    serde_json::to_string_pretty(&r).map_err(|e| e.to_string())
}

/// Score a bounded excerpt of a vessel's NMEA 0183 stream the way live mode scores it:
/// per-epoch trust state and 0-100 score with reasons (live JSON-lines schema 1.1), the last
/// `$PKSHT` sentence and a summary. The excerpt must hold the calibration window. Bounded to
/// 2 MiB and 20,000 epochs by the engine, and to `max_bytes` here. The gate, sockets and
/// the long-running process are command-line only.
pub fn assess_vessel_excerpt(
    session_toml: &str,
    excerpt: &[u8],
    max_bytes: usize,
) -> Result<ExcerptAssessment, String> {
    cap("session", session_toml, max_bytes)?;
    cap_len("excerpt", excerpt.len(), max_bytes)?;
    assess::assess_stream_excerpt(session_toml, excerpt)
}

fn dataset_spec<'a>(
    key: &'a str,
    custom: Option<&'a CustomDataset>,
) -> Result<DatasetSpec<'a>, String> {
    if key == "custom" {
        let c = custom.ok_or("dataset `custom` needs licence, licence_url and attribution")?;
        if c.licence.is_empty() || c.licence_url.is_empty() || c.attribution.is_empty() {
            return Err("dataset `custom` needs licence, licence_url and attribution".into());
        }
        Ok(DatasetSpec::Custom {
            licence: &c.licence,
            licence_url: &c.licence_url,
            attribution: &c.attribution,
        })
    } else {
        Ok(DatasetSpec::Preset(key))
    }
}

/// Build an interference map from CSV text (the formats of `docs/INTERFERENCE-MAP.md`).
/// `land_geojson` (AIS only) is an optional land-polygon file for the inland detector.
/// Identifiers are hashed in memory and never returned; cells below the publication
/// minimum are withheld. A degraded cell does not name interference as the cause.
pub fn interference_map(
    source: MapSource,
    csv: &str,
    dataset: &str,
    cell_deg: Option<f64>,
    custom: Option<&CustomDataset>,
    land_geojson: Option<&str>,
    max_bytes: usize,
) -> Result<Vec<MapDay>, String> {
    cap("input", csv, max_bytes)?;
    if let Some(l) = land_geojson {
        cap("land file", l, max_bytes)?;
    }
    let spec = dataset_spec(dataset, custom)?;
    let cell = cell_deg.unwrap_or(DEFAULT_CELL_DEG);
    let days = match source {
        MapSource::Adsb => api::adsb_maps_from_csv(csv, &spec, cell),
        MapSource::Ais => api::ais_maps_from_csv(csv, &spec, cell, land_geojson),
    }
    .map_err(|e| e.to_string())?;
    days.into_iter()
        .map(|d| {
            let features = d.geojson["features"]
                .as_array()
                .map_or(&[][..], Vec::as_slice);
            let flagged = features
                .iter()
                .filter(|f| f["properties"]["degraded"] == Value::Bool(true))
                .count();
            Ok(MapDay {
                file_name: d.file_name,
                date: d.date,
                cells_published: features.len(),
                cells_flagged: flagged,
                geojson: serde_json::to_string_pretty(&d.geojson).map_err(|e| e.to_string())?,
            })
        })
        .collect()
}

/// Share of a route through degraded cells, for each map in `maps` (GeoJSON text from
/// [`interference_map`] or `kshana interference-map`) inside the optional `from`/`to`
/// dates (`YYYY-MM-DD`). Returns the `kshana-route-exposure/v1` report as JSON. Cells not
/// observed are not evidence of a clear route, and the report is not a forecast.
pub fn route_exposure(
    route_text: &str,
    maps: &[&str],
    from: Option<&str>,
    to: Option<&str>,
    max_bytes: usize,
) -> Result<String, String> {
    cap("route", route_text, max_bytes)?;
    if maps.is_empty() {
        return Err("at least one map is required".into());
    }
    for (i, m) in maps.iter().enumerate() {
        cap(&format!("map {}", i + 1), m, max_bytes)?;
    }
    let v = api::route_exposure(route_text, maps, from, to).map_err(|e| e.to_string())?;
    serde_json::to_string_pretty(&v).map_err(|e| e.to_string())
}

/// Result of a training-scenario run: text only, nothing is transmitted.
#[derive(Clone, Debug)]
pub struct NmeaTraining {
    /// The synthetic bridge NMEA 0183 stream, CRLF line ends, with the training marker.
    pub nmea: String,
    /// Instructor log as JSON (`kshana-nmea-training/1`): what was injected when, true track.
    pub log_json: String,
    /// Instructor log as text.
    pub log_text: String,
}

/// Generate synthetic training NMEA from a `nmea-scenario` TOML. Text only: for crew
/// training and tests, never for a vessel's live navigation systems.
pub fn nmea_training(
    toml: &str,
    seed: Option<u64>,
    max_bytes: usize,
) -> Result<NmeaTraining, String> {
    cap("scenario", toml, max_bytes)?;
    let g = crate::nmea_synth::generate_from_toml(toml, seed)?;
    Ok(NmeaTraining {
        nmea: g.nmea_text(),
        log_json: g.log.to_json(),
        log_text: g.log.to_text(),
    })
}

/// A signed evidence pack built in memory, and the key that signed it.
#[derive(Clone, Debug)]
pub struct EvidencePack {
    /// The pack's files by name (`log-slice.bin`, `config.json`, `epochs.json`,
    /// `summary.html`, `manifest.json`, `manifest.sig`).
    pub files: Files,
    /// The signer's public key, 64 lower-case hex digits.
    pub public_key: String,
    /// The Ed25519 signing-key seed that was used. A caller that generated it must keep or
    /// discard it deliberately; a service must never return or log it.
    pub seed: [u8; 32],
    /// Epochs of the log inside the window.
    pub epochs_in_window: usize,
    /// The log byte range bundled, or `None` when the whole log is (the log gives no range).
    pub slice: Option<(usize, usize)>,
}

/// Parse a 64-hex-digit Ed25519 key or seed.
pub fn hex32(what: &str, s: &str) -> Result<[u8; 32], String> {
    let s = s.trim();
    if s.len() != 64 || !s.bytes().all(|b| matches!(b, b'0'..=b'9' | b'a'..=b'f')) {
        return Err(format!("{what} must be 64 lower-case hex digits"));
    }
    let v = hex::decode(s).map_err(|e| format!("{what}: {e}"))?;
    <[u8; 32]>::try_from(v.as_slice()).map_err(|_| format!("{what} must be 32 bytes"))
}

/// The current UTC time as RFC 3339, for a pack's creation time.
pub fn now_rfc3339_utc() -> String {
    let secs = std::time::SystemTime::now()
        .duration_since(std::time::UNIX_EPOCH)
        .map_or(0, |d| d.as_secs()) as i64;
    let (y, m, d) = crate::interference_map::time::civil_from_days(secs.div_euclid(86_400));
    let r = secs.rem_euclid(86_400);
    format!(
        "{y:04}-{m:02}-{d:02}T{:02}:{:02}:{:02}Z",
        r / 3600,
        r % 3600 / 60,
        r % 60
    )
}

/// Build a signed evidence pack for a window of a vessel's NMEA log, in memory.
///
/// `session_toml` is a receiver-trust session (`[platform]`, `[monitors]`, `[score]`; no
/// `[log]` needed) and `log` the receiver log's bytes. The window is `from_s`..`to_s` in
/// seconds since the log's first epoch. `seed` is the signer's key seed; `None` generates
/// one from the operating system's randomness (returned in [`EvidencePack::seed`]).
/// `created_utc` is the creation time, RFC 3339 UTC, or `None` to leave it out (which makes
/// the pack reproducible). A pack is a technical record of what the engine computed from a
/// log; it is not a legal opinion, a finding of fact or a certification.
#[allow(clippy::too_many_arguments)]
pub fn evidence_create(
    session_toml: &str,
    log: &[u8],
    from_s: f64,
    to_s: f64,
    title: Option<&str>,
    created_utc: Option<&str>,
    seed: Option<[u8; 32]>,
    max_bytes: usize,
) -> Result<EvidencePack, String> {
    cap("session", session_toml, max_bytes)?;
    cap_len("log", log.len(), max_bytes)?;
    let scn = parse_live_scenario(session_toml)?;
    let seed = seed.unwrap_or_else(generate_seed);
    let (from, to) = (from_s.to_string(), to_s.to_string());
    let summary = build_receiver_trust_pack(
        &PackRequest {
            scenario: &scn,
            log_bytes: log,
            nav_bytes: None,
            log_file_name: "inline",
            from: &from,
            to: &to,
            title: title.unwrap_or("GNSS trust evidence pack"),
            created_utc,
        },
        &seed,
        None,
    )?;
    Ok(EvidencePack {
        public_key: public_key_hex(&seed),
        seed,
        epochs_in_window: summary.epochs_in_window,
        slice: summary.slice,
        files: summary.files,
    })
}

/// Verify an evidence pack held in memory: every hash, the chain, the signature, and with
/// `public_key` (hex, obtained from the signer by another route) that the signer is the one
/// you expect, with `full_log` that the log you hold is the one recorded, and with
/// `require_timestamp` that the pack carries a timestamp token.
///
/// Returns the report as JSON with two added fields that say plainly what a pass means:
/// `verdict` is `"verified"` (everything checks and the signer is the pinned key),
/// `"intact-signer-not-pinned"` (everything checks, but with no trusted public key the
/// signature proves only that the pack is intact against the key it names itself, which
/// anyone can generate) or `"failed"`; `message` is the sentence to show a person.
pub fn evidence_verify(
    files: &Files,
    public_key: Option<&str>,
    full_log: Option<&[u8]>,
    require_timestamp: bool,
) -> Result<Value, String> {
    let expected = public_key.map(|k| hex32("public key", k)).transpose()?;
    let r = verify_bundle(
        files,
        &VerifyOptions {
            expected_public_key: expected,
            full_log,
            require_timestamp,
        },
    );
    let fp = r.signer_fingerprint.clone().unwrap_or_default();
    let (verdict, message) = if !r.ok {
        (
            "failed",
            "NOT VERIFIED: at least one check failed; see `failures`.".to_string(),
        )
    } else if r.signer_pinned {
        (
            "verified",
            format!("VERIFIED against the public key you supplied (signer fingerprint {fp})."),
        )
    } else {
        (
            "intact-signer-not-pinned",
            format!(
                "INTACT, BUT THE SIGNER IS NOT PINNED: the hashes and signature are consistent with key {fp}, which the pack names itself. Supply the signer's public key, obtained from the signer by another route, to establish who signed it."
            ),
        )
    };
    let mut v = serde_json::to_value(&r).map_err(|e| e.to_string())?;
    v["verdict"] = verdict.into();
    v["message"] = message.into();
    Ok(v)
}

/// A pack's files as JSON, for surfaces that carry text: each file is `{"utf8": text}`, or
/// `{"base64": bytes}` when it is not valid UTF-8.
pub fn files_to_json(files: &Files) -> Value {
    Value::Object(
        files
            .iter()
            .map(|(k, v)| {
                let body = match std::str::from_utf8(v) {
                    Ok(t) => json!({"utf8": t}),
                    Err(_) => json!({"base64": crate::permalink::base64_encode(v)}),
                };
                (k.clone(), body)
            })
            .collect(),
    )
}

/// The inverse of [`files_to_json`]; a bare string is taken as UTF-8 text. At most 64 files.
pub fn files_from_json(v: &Value) -> Result<Files, String> {
    let o = v
        .as_object()
        .ok_or("files must be a JSON object of name to content")?;
    if o.len() > 64 {
        return Err("a pack has at most 64 files".into());
    }
    o.iter()
        .map(|(k, c)| {
            if k.contains(['/', '\\']) || k.is_empty() {
                return Err(format!("file name `{k}` must be a plain name"));
            }
            let bytes = if let Some(t) = c.as_str().or_else(|| c["utf8"].as_str()) {
                t.as_bytes().to_vec()
            } else if let Some(b) = c["base64"].as_str() {
                crate::permalink::base64_decode(b)
                    .ok_or_else(|| format!("{k}: `base64` is not valid standard base64"))?
            } else {
                return Err(format!(
                    "{k}: give a string, {{\"utf8\": ...}} or {{\"base64\": ...}}"
                ));
            };
            Ok((k.clone(), bytes))
        })
        .collect()
}

#[cfg(test)]
mod tests {
    use super::*;
    use crate::evidence::public_key_hex;

    const ADSB: &str = include_str!("../examples/interference-map/input/adsb.csv");
    const AIS: &str = include_str!("../examples/interference-map/input/ais.csv");
    const LAND: &str = include_str!("../examples/interference-map/input/land.geojson");
    const NMEA: &str = include_str!("../examples/maritime-trust/tallinn-helsinki.nmea");
    const SESSION: &str = include_str!("../examples/maritime-trust/session.toml");
    const TRAINING: &str = include_str!("../scenarios/training/open-sea-jamming.toml");

    fn custom() -> CustomDataset {
        CustomDataset {
            licence: "CC0-1.0".into(),
            licence_url: "https://creativecommons.org/publicdomain/zero/1.0/".into(),
            attribution:
                "Synthetic data generated for Kshana documentation. Not real observations.".into(),
        }
    }

    #[test]
    fn adsb_and_ais_maps_match_the_cli_samples() {
        for (src, csv, land, sample) in [
            (
                MapSource::Adsb,
                ADSB,
                None,
                include_str!("../examples/interference-map/output/adsb-custom-2026-03-01.geojson"),
            ),
            (
                MapSource::Ais,
                AIS,
                Some(LAND),
                include_str!("../examples/interference-map/output/ais-custom-2026-03-01.geojson"),
            ),
        ] {
            let days = interference_map(
                src,
                csv,
                "custom",
                None,
                Some(&custom()),
                land,
                MAX_INPUT_BYTES,
            )
            .unwrap();
            assert_eq!(days.len(), 1);
            let (mut a, mut b): (serde_json::Value, serde_json::Value) = (
                serde_json::from_str(&days[0].geojson).unwrap(),
                serde_json::from_str(sample).unwrap(),
            );
            for v in [&mut a, &mut b] {
                v["kshana_interference_map"]["kshana_version"] = "X".into();
            }
            assert_eq!(a, b);
            assert_eq!(
                a["kshana_interference_map"]["schema"],
                "kshana-interference-map/v1"
            );
            assert!(days[0].cells_published > 0);
        }
    }

    #[test]
    fn route_exposure_runs_on_an_in_memory_map() {
        let day = interference_map(
            MapSource::Adsb,
            ADSB,
            "custom",
            None,
            Some(&custom()),
            None,
            MAX_INPUT_BYTES,
        )
        .unwrap();
        let route = r#"{"type":"LineString","coordinates":[[-10.0,35.0],[10.0,55.0]]}"#;
        let rep = route_exposure(route, &[&day[0].geojson], None, None, MAX_INPUT_BYTES).unwrap();
        let v: serde_json::Value = serde_json::from_str(&rep).unwrap();
        assert!(v.is_object());
        assert!(route_exposure(route, &[], None, None, MAX_INPUT_BYTES).is_err());
        assert!(route_exposure(
            route,
            &[&day[0].geojson],
            Some("2030-01-01"),
            None,
            MAX_INPUT_BYTES
        )
        .unwrap_err()
        .contains("no map"));
    }

    #[test]
    fn inputs_are_capped_and_datasets_are_checked() {
        assert!(interference_map(
            MapSource::Adsb,
            ADSB,
            "custom",
            None,
            None,
            None,
            MAX_INPUT_BYTES
        )
        .is_err());
        assert!(interference_map(
            MapSource::Adsb,
            ADSB,
            "custom",
            None,
            Some(&custom()),
            None,
            100
        )
        .unwrap_err()
        .contains("limit"));
        assert!(interference_map(
            MapSource::Ais,
            AIS,
            "adsb-lol",
            None,
            None,
            None,
            MAX_INPUT_BYTES
        )
        .unwrap_err()
        .contains("data"));
        assert!(MapSource::parse("radar").is_err());
    }

    #[test]
    fn inline_receiver_assessment_refuses_paths_and_runs_inline_logs() {
        let e = assess_receiver_log_inline(SESSION, MAX_INPUT_BYTES).unwrap_err();
        assert!(e.contains("path"), "{e}");
        let mut v: toml::Value = toml::from_str(SESSION).unwrap();
        let log = v["log"].as_table_mut().unwrap();
        log.remove("path");
        log.insert("text".into(), toml::Value::String(NMEA.to_string()));
        let inline = toml::to_string(&v).unwrap();
        let out = assess_receiver_log_inline(&inline, MAX_INPUT_BYTES).unwrap();
        assert!(!out.summary.is_empty());
        assert!(out.json.contains("score"));
        assert!(assess_receiver_log_inline(&inline, 1000)
            .unwrap_err()
            .contains("limit"));
    }

    /// Seconds 1400 to 1800 of the synthetic 3000-second ferry log (the drag-off starts at
    /// 1500 s) and a session with a 60 s calibration window: the same engine, in a fraction
    /// of the debug-build runtime.
    fn excerpt() -> (String, &'static str) {
        let at = |t: usize| NMEA[..NMEA.len() * t / 3000].rfind('\n').unwrap() + 1;
        let session = SESSION
            .replace("path = \"tallinn-helsinki.nmea\"", "")
            .replace("calibration_s = 300.0", "calibration_s = 60.0");
        (session, &NMEA[at(1400)..at(1800)])
    }

    #[test]
    fn vessel_excerpt_scores_the_synthetic_drag_off_and_is_bounded() {
        let (session, nmea) = excerpt();
        let r = assess_vessel_excerpt(&session, nmea.as_bytes(), MAX_INPUT_BYTES).unwrap();
        assert!(r.summary.epochs > 300 && r.summary.calibrating > 0 && r.summary.nominal > 0);
        assert!(
            r.summary.untrusted > 0,
            "the drag-off must be flagged: {:?}",
            r.summary
        );
        assert!(r.summary.lowest_score.unwrap() < 55.0);
        assert!(assess_vessel_excerpt(&session, nmea.as_bytes(), 1000).is_err());
        let static_session = "[platform]\nkind = \"static\"";
        assert!(assess_vessel_excerpt(static_session, nmea.as_bytes(), MAX_INPUT_BYTES).is_err());
    }

    #[test]
    fn vessel_log_batch_matches_the_excerpt_json_shape() {
        let (session, nmea) = excerpt();
        let j = assess_vessel_log_json(&session, nmea.as_bytes(), MAX_INPUT_BYTES).unwrap();
        let v: Value = serde_json::from_str(&j).unwrap();
        assert!(v["epochs"].as_array().unwrap().len() > 300);
        assert!(assess_vessel_log_json(&session, nmea.as_bytes(), 1000).is_err());
    }

    #[test]
    fn evidence_pack_round_trips_and_detects_tampering() {
        let (session, nmea) = excerpt();
        let seed = [7u8; 32];
        let p = evidence_create(
            &session,
            nmea.as_bytes(),
            100.0,
            300.0,
            Some("test pack"),
            None,
            Some(seed),
            MAX_INPUT_BYTES,
        )
        .unwrap();
        assert!(p.epochs_in_window > 100 && p.slice.is_some());
        for f in [
            "manifest.json",
            "manifest.sig",
            "epochs.json",
            "summary.html",
            "log-slice.bin",
        ] {
            assert!(p.files.contains_key(f), "{f}");
        }
        // Reproducible: no creation time, same seed, same bytes.
        let again = evidence_create(
            &session,
            nmea.as_bytes(),
            100.0,
            300.0,
            Some("test pack"),
            None,
            Some(seed),
            MAX_INPUT_BYTES,
        )
        .unwrap();
        assert_eq!(p.files, again.files);

        let ok =
            evidence_verify(&p.files, Some(&p.public_key), Some(nmea.as_bytes()), false).unwrap();
        assert_eq!(ok["ok"], true, "{}", ok["failures"]);
        assert_eq!(ok["verdict"], "verified");
        assert_eq!(ok["signer_pinned"], true);
        // Through JSON and back (how the browser and MCP surfaces carry it).
        let back = files_from_json(&files_to_json(&p.files)).unwrap();
        assert_eq!(back, p.files);
        // One changed byte fails; a different trusted key fails; the wrong log fails.
        let verdict = |files: &Files, key: Option<&str>, log: Option<&[u8]>| {
            evidence_verify(files, key, log, false).unwrap()["verdict"].clone()
        };
        let mut bad = p.files.clone();
        bad.get_mut("epochs.json").unwrap()[10] ^= 1;
        assert_eq!(verdict(&bad, Some(&p.public_key), None), "failed");
        let other = public_key_hex(&[9u8; 32]);
        assert_eq!(verdict(&p.files, Some(&other), None), "failed");
        assert_eq!(verdict(&p.files, None, Some(b"not the log")), "failed");
        // Without a trusted key an intact pack is reported as intact with the signer NOT
        // pinned, never as plainly verified.
        let unpinned = evidence_verify(&p.files, None, None, false).unwrap();
        assert_eq!(unpinned["verdict"], "intact-signer-not-pinned");
        assert_eq!(unpinned["signer_pinned"], false);
        assert!(unpinned["message"].as_str().unwrap().contains("NOT PINNED"));
        // A timestamp can be demanded; this pack has none.
        assert_eq!(
            evidence_verify(&p.files, Some(&p.public_key), None, true).unwrap()["verdict"],
            "failed"
        );
        assert!(evidence_verify(&p.files, Some("zz"), None, false).is_err());
        // An empty window is refused; the seed is not part of the files.
        assert!(evidence_create(
            &session,
            nmea.as_bytes(),
            9000.0,
            9100.0,
            None,
            None,
            None,
            MAX_INPUT_BYTES
        )
        .is_err());
        let hex_seed = hex::encode(seed);
        assert!(p
            .files
            .values()
            .all(|b| !String::from_utf8_lossy(b).contains(&hex_seed)));
    }

    #[test]
    fn scenarios_naming_files_are_refused_and_bundled_ones_pass() {
        let refused = |t: &str| reject_file_sources(t, MAX_INPUT_BYTES).unwrap_err();
        assert!(refused("kind = \"telecom-timing\"\ncsv_path = \"x.csv\"").contains("csv_path"));
        assert!(
            refused("kind = \"spectrum\"\n[recording]\nmeta_path = \"a.sigmf-meta\"")
                .contains("meta_path")
        );
        assert!(
            refused("kind = \"realtime-frame-eop\"\neop_finals2000a = \"/etc/x\"")
                .contains("eop_finals2000a")
        );
        assert!(
            refused("kind = \"receiver-trust\"\n[log]\nformat = \"nmea\"\npath = \"x\"")
                .contains("path")
        );
        assert!(refused("[log.nav]\npath = \"x\"").contains("path"));
        // Nested in a campaign member.
        assert!(refused(
            "kind = \"campaign\"\n[[phases]]\n[phases.scenario]\nplanetary_kernel_path = \"k.bsp\""
        )
        .contains("planetary_kernel_path"));
        // Inline bodies and result paths are fine.
        reject_file_sources(
            "kind = \"ephemeris\"\neop_finals2000a = \"inline body\"",
            MAX_INPUT_BYTES,
        )
        .unwrap();
        reject_file_sources(
            "kind = \"campaign\"\n[[metrics]]\nname = \"a\"\npath = \"quantum.fom.x\"",
            MAX_INPUT_BYTES,
        )
        .unwrap();
        // Not TOML: left to the engine's own message. Over the cap: refused.
        reject_file_sources("not toml {{", MAX_INPUT_BYTES).unwrap();
        assert!(reject_file_sources("x = 1", 2)
            .unwrap_err()
            .contains("limit"));
    }

    #[test]
    fn files_json_refuses_paths_and_junk() {
        assert!(files_from_json(&json!({"../x": "a"})).is_err());
        assert!(files_from_json(&json!({"a": 5})).is_err());
        assert!(files_from_json(&json!({"a": {"base64": "!!"}})).is_err());
        assert!(files_from_json(&json!([1])).is_err());
        assert_eq!(files_from_json(&json!({"a": "hi"})).unwrap()["a"], b"hi");
    }

    #[test]
    fn training_nmea_is_deterministic_per_seed() {
        let a = nmea_training(TRAINING, None, MAX_INPUT_BYTES).unwrap();
        assert_eq!(
            a.nmea,
            nmea_training(TRAINING, None, MAX_INPUT_BYTES).unwrap().nmea
        );
        assert_ne!(
            a.nmea,
            nmea_training(TRAINING, Some(7), MAX_INPUT_BYTES)
                .unwrap()
                .nmea
        );
        assert!(a.nmea.contains("\r\n") && a.log_json.contains("kshana-nmea-training/1"));
        assert!(!a.log_text.is_empty());
        assert!(nmea_training("[scenario]", None, MAX_INPUT_BYTES).is_err());
    }
}
