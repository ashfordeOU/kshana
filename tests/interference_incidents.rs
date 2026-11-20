// SPDX-License-Identifier: AGPL-3.0-only
//! The interference-incident format and the public case library (`docs/INTERFERENCE-INCIDENTS.md`):
//! the committed library is valid and every record cites an https address; a released version keeps
//! its content (`data/interference-incidents/RELEASES.json`); the JSON Schema and the Rust
//! vocabulary agree; a release is written once with a manifest that matches its files; and an
//! observatory incident report converts into valid MODELLED records.

use kshana::interference_map::incident::{self, content_sha256, validate};
use serde_json::Value;
use std::path::{Path, PathBuf};
use std::process::{Command, Output};

const LIBRARY: &str = "data/interference-incidents/library.json";
const RELEASES: &str = "data/interference-incidents/RELEASES.json";

fn root() -> PathBuf {
    PathBuf::from(env!("CARGO_MANIFEST_DIR"))
}

fn load(rel: &str) -> Value {
    serde_json::from_str(&std::fs::read_to_string(root().join(rel)).unwrap()).unwrap()
}

fn kshana(args: &[&str]) -> Output {
    Command::new(env!("CARGO_BIN_EXE_kshana"))
        .current_dir(env!("CARGO_MANIFEST_DIR"))
        .env("KSHANA_LANG", "en")
        .args(args)
        .output()
        .unwrap()
}

struct Scratch(PathBuf);
impl Scratch {
    fn new(name: &str) -> Self {
        static SEQ: std::sync::atomic::AtomicU64 = std::sync::atomic::AtomicU64::new(0);
        let seq = SEQ.fetch_add(1, std::sync::atomic::Ordering::Relaxed);
        let p = std::env::temp_dir().join(format!(
            "kshana-incidents-{name}-{}-{seq}",
            std::process::id()
        ));
        let _ = std::fs::remove_dir_all(&p);
        std::fs::create_dir_all(&p).unwrap();
        Self(p)
    }
    fn path(&self) -> &Path {
        &self.0
    }
}
impl Drop for Scratch {
    fn drop(&mut self) {
        let _ = std::fs::remove_dir_all(&self.0);
    }
}

#[test]
fn the_committed_library_is_valid_and_every_record_cites_an_https_source() {
    let lib = load(LIBRARY);
    let problems = validate(&lib);
    assert!(problems.is_empty(), "{problems:#?}");
    let recs = lib["records"].as_array().unwrap();
    assert!(
        recs.len() >= 15,
        "the first library has at least 15 records"
    );
    for r in recs {
        assert_eq!(r["id"].as_str().unwrap().len(), 8);
        let srcs = r["sources"].as_array().unwrap();
        assert!(!srcs.is_empty());
        for s in srcs {
            assert!(s["url"].as_str().unwrap().starts_with("https://"));
        }
    }
    assert_eq!(lib["label"], "REPORTED");
}

#[test]
fn a_released_library_version_never_changes() {
    let lib = load(LIBRARY);
    let reg = load(RELEASES);
    let problems = incident::check_releases(&lib, &reg);
    assert!(problems.is_empty(), "{problems:#?}");
    // The current version must be registered, so an edit cannot ship without a new entry.
    let v = lib["library_version"].as_str().unwrap();
    let entry = reg["releases"]
        .as_array()
        .unwrap()
        .iter()
        .find(|r| r["library_version"] == v)
        .expect("the current library_version is in RELEASES.json");
    assert_eq!(entry["content_sha256"], content_sha256(&lib));
    assert_eq!(entry["records"], lib["records"].as_array().unwrap().len());
}

fn schema_enum(schema: &Value, pointer: &str) -> Vec<String> {
    schema
        .pointer(pointer)
        .and_then(Value::as_array)
        .unwrap_or_else(|| panic!("{pointer}"))
        .iter()
        .map(|v| v.as_str().unwrap().to_string())
        .collect()
}

#[test]
fn the_json_schema_and_the_vocabulary_agree() {
    let s: Value = serde_json::from_str(incident::JSON_SCHEMA).unwrap();
    let rec = "/$defs/record/properties";
    let pairs: [(&str, &[&str]); 12] = [
        ("/record_kind/enum", incident::RECORD_KINDS),
        ("/effect/properties/class/enum", incident::EFFECT_CLASSES),
        ("/effect/properties/confidence/enum", incident::CONFIDENCE),
        ("/origin/properties/confidence/enum", incident::CONFIDENCE),
        ("/evidence_basis/items/enum", incident::EVIDENCE_BASIS),
        (
            "/origin/properties/category/enum",
            incident::ORIGIN_CATEGORIES,
        ),
        ("/origin/properties/platform/enum", incident::PLATFORMS),
        ("/domains/items/enum", incident::DOMAINS),
        ("/observed_effects/items/enum", incident::OBSERVED_EFFECTS),
        ("/time/properties/precision/enum", incident::PRECISION),
        (
            "/sources/items/properties/kind/enum",
            incident::SOURCE_KINDS,
        ),
        (
            "/figures/items/properties/qualifier/enum",
            incident::QUALIFIERS,
        ),
    ];
    for (p, want) in pairs {
        assert_eq!(schema_enum(&s, &format!("{rec}{p}")), want, "{p}");
    }
    assert_eq!(schema_enum(&s, "/properties/label/enum"), incident::LABELS);
    assert_eq!(
        schema_enum(&s, &format!("{rec}/label/enum")),
        incident::LABELS
    );
    assert_eq!(
        schema_enum(&s, &format!("{rec}/area/properties/bbox_basis/enum")),
        incident::BBOX_BASIS
    );
    assert_eq!(s["properties"]["schema"]["const"], incident::LIBRARY_SCHEMA);
    assert_eq!(s["properties"]["vocabulary"]["const"], incident::VOCABULARY);
    // The fields the schema allows are the fields the validator allows: an unknown field fails both.
    let rec_keys: Vec<&String> = s
        .pointer(rec)
        .unwrap()
        .as_object()
        .unwrap()
        .keys()
        .collect();
    let lib = load(LIBRARY);
    for r in lib["records"].as_array().unwrap() {
        for k in r.as_object().unwrap().keys() {
            assert!(rec_keys.contains(&k), "{k} is not in the schema");
        }
    }
}

#[test]
fn the_validate_command_reports_valid_and_invalid_libraries_with_exit_codes() {
    let o = kshana(&[
        "interference-map",
        "incidents",
        "validate",
        LIBRARY,
        "--releases",
        RELEASES,
    ]);
    assert!(o.status.success(), "{}", String::from_utf8_lossy(&o.stderr));
    assert!(String::from_utf8_lossy(&o.stdout).contains("records, valid"));
    let s = Scratch::new("bad");
    let mut lib = load(LIBRARY);
    lib["records"][0]["effect"]["confidence"] = "confirmed".into();
    lib["records"][0]["sources"][0]["url"] = "http://example.org/x".into();
    let bad = s.path().join("bad.json");
    std::fs::write(&bad, serde_json::to_string(&lib).unwrap()).unwrap();
    let o = kshana(&[
        "interference-map",
        "incidents",
        "validate",
        bad.to_str().unwrap(),
        "--releases",
        RELEASES,
        "--json",
    ]);
    assert_eq!(o.status.code(), Some(1));
    let rep: Value = serde_json::from_slice(&o.stdout).unwrap();
    assert_eq!(rep["valid"], false);
    let rules: Vec<&str> = rep["problems"]
        .as_array()
        .unwrap()
        .iter()
        .map(|p| p["rule"].as_str().unwrap())
        .collect();
    assert!(rules.contains(&"confidence"), "{rules:?}");
    assert!(rules.contains(&"url"), "{rules:?}");
    assert!(rules.contains(&"immutable-release"), "{rules:?}");
    let o = kshana(&["interference-map", "incidents", "nonsense"]);
    assert_eq!(o.status.code(), Some(2));
}

#[test]
fn a_release_is_written_once_with_a_manifest_that_matches_its_files() {
    let s = Scratch::new("release");
    let o = kshana(&[
        "interference-map",
        "incidents",
        "release",
        LIBRARY,
        "--out",
        s.path().to_str().unwrap(),
    ]);
    assert!(o.status.success(), "{}", String::from_utf8_lossy(&o.stderr));
    let lib = load(LIBRARY);
    let dir = s.path().join(format!(
        "kshana-interference-incidents-{}",
        lib["library_version"].as_str().unwrap()
    ));
    let man: Value =
        serde_json::from_str(&std::fs::read_to_string(dir.join("MANIFEST.json")).unwrap()).unwrap();
    assert_eq!(man["content_sha256"], content_sha256(&lib));
    let files = man["files"].as_array().unwrap();
    assert_eq!(files.len(), 4);
    for f in files {
        use sha2::{Digest, Sha256};
        let bytes = std::fs::read(dir.join(f["file"].as_str().unwrap())).unwrap();
        let hex: String = Sha256::digest(&bytes)
            .iter()
            .map(|b| format!("{b:02x}"))
            .collect();
        assert_eq!(f["sha256"], hex.as_str());
        assert_eq!(f["bytes"], bytes.len());
    }
    // The released records are the library, and the CSV has one row per record.
    let released: Value =
        serde_json::from_str(&std::fs::read_to_string(dir.join("incidents.json")).unwrap())
            .unwrap();
    assert_eq!(content_sha256(&released), content_sha256(&lib));
    let csv = std::fs::read_to_string(dir.join("incidents.csv")).unwrap();
    assert_eq!(
        csv.lines().count(),
        lib["records"].as_array().unwrap().len() + 1
    );
    let zen: Value =
        serde_json::from_str(&std::fs::read_to_string(dir.join(".zenodo.json")).unwrap()).unwrap();
    assert_eq!(zen["upload_type"], "dataset");
    assert_eq!(zen["license"], "cc-by-4.0");
    assert_eq!(zen["version"], lib["library_version"]);
    // A release directory is never overwritten.
    let again = kshana(&[
        "interference-map",
        "incidents",
        "release",
        LIBRARY,
        "--out",
        s.path().to_str().unwrap(),
    ]);
    assert_eq!(again.status.code(), Some(2));
    assert!(String::from_utf8_lossy(&again.stderr).contains("already exists"));
}

#[test]
fn an_observatory_report_converts_into_valid_modelled_records() {
    let s = Scratch::new("obs");
    let o = kshana(&[
        "interference-map",
        "daily",
        "examples/interference-map/input/adsb.csv",
        "--day",
        "2026-03-01",
        "--out",
        s.path().to_str().unwrap(),
        "--dataset",
        "custom",
        "--licence",
        "ODbL-1.0",
        "--licence-url",
        "https://opendatacommons.org/licenses/odbl/1-0/",
        "--attribution",
        "synthetic sample",
    ]);
    assert!(o.status.success(), "{}", String::from_utf8_lossy(&o.stderr));
    let report = s
        .path()
        .join("observatory-adsb-custom-2026-03-01.incidents.json");
    let out = s.path().join("detections.json");
    let run = |url: Option<&str>| {
        let mut a = vec![
            "interference-map",
            "incidents",
            "from-observatory",
            report.to_str().unwrap(),
            "--out",
            out.to_str().unwrap(),
        ];
        if let Some(u) = url {
            a.extend(["--source-url", u]);
        }
        kshana(&a)
    };
    assert_eq!(
        run(None).status.code(),
        Some(2),
        "a source address is required"
    );
    let o = run(Some("https://example.org/observatory/2026-03-01"));
    assert!(o.status.success(), "{}", String::from_utf8_lossy(&o.stderr));
    let doc: Value = serde_json::from_str(&std::fs::read_to_string(&out).unwrap()).unwrap();
    assert!(validate(&doc).is_empty());
    assert_eq!(doc["label"], "MODELLED");
    assert_eq!(doc["licence"], "ODbL-1.0");
    let recs = doc["records"].as_array().unwrap();
    let rep: Value = serde_json::from_str(&std::fs::read_to_string(&report).unwrap()).unwrap();
    assert_eq!(recs.len(), rep["incidents"].as_array().unwrap().len());
    assert!(!recs.is_empty(), "the sample day has a degraded cell");
    for r in recs {
        assert_eq!(r["record_kind"], "observatory_detection");
        assert_eq!(r["effect"]["class"], "degradation_unattributed");
        assert_eq!(r["effect"]["confidence"], "undetermined");
        assert_eq!(r["origin"]["category"], "unknown");
    }
    // B1006: every published cell states its confidence, and the product states its latency.
    let map: Value = serde_json::from_str(
        &std::fs::read_to_string(s.path().join("observatory-adsb-custom-2026-03-01.geojson"))
            .unwrap(),
    )
    .unwrap();
    for f in map["features"].as_array().unwrap() {
        let c = &f["properties"]["confidence"];
        assert!(["high", "medium", "low"].contains(&c["level"].as_str().unwrap()));
        assert!(c["nacp_report_share"].is_number());
    }
    let rel = &map["kshana_observatory"]["release"];
    assert!(rel["min_latency_hours"].as_f64().unwrap() >= 24.0);
    assert_eq!(rel, &rep["release"]);
    assert!(map["kshana_observatory"]["day"]["data_window"]["last_report_utc"].is_string());
    // The output is never overwritten.
    assert_eq!(
        run(Some("https://example.org/observatory/2026-03-01"))
            .status
            .code(),
        Some(2)
    );
}
