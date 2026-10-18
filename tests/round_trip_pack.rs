// SPDX-License-Identifier: AGPL-3.0-only
//! The laboratory round trip (`kshana evidence round-trip`, docs/spec/TEST-CONDITIONS.md):
//! export a scenario, take the exported NMEA as the receiver's log, and link scenario,
//! stated conditions, log and score in one signed pack. Synthetic data only; no signal.

use kshana::evidence::{
    build_round_trip_pack, generate_seed, verify_bundle, PackRequest, VerifyOptions,
};
use kshana::interop::testbench;
use kshana::iq::campaign::conditions::TestConditions;
use kshana::receiver_trust::scenario::ReceiverTrustScenario;
use std::path::PathBuf;

struct Fixture {
    scenario: String,
    conditions: String,
    scn: ReceiverTrustScenario,
    log: Vec<u8>,
}

fn fixture() -> Fixture {
    let root = PathBuf::from(env!("CARGO_MANIFEST_DIR"));
    let scenario = std::fs::read_to_string(root.join("scenarios/gnss-ins.toml")).unwrap();
    let t = testbench::trajectory_of(&scenario, None).unwrap();
    let nmea = testbench::write_nmea(&t);
    let events = testbench::write_events_toml(&t);
    let scn: ReceiverTrustScenario = toml::from_str(&format!(
        "[log]\nformat = \"nmea\"\ntext = \"\"\n\n[monitors]\ncalibration_s = 30.0\n\n{events}"
    ))
    .unwrap();
    Fixture {
        scenario,
        conditions: testbench::write_conditions_json(&t),
        scn,
        log: nmea.into_bytes(),
    }
}

fn request<'a>(f: &'a Fixture) -> PackRequest<'a> {
    PackRequest {
        scenario: &f.scn,
        log_bytes: &f.log,
        nav_bytes: None,
        log_file_name: "receiver.nmea",
        from: "0",
        to: "100",
        title: "round trip",
        created_utc: None,
    }
}

#[test]
fn exported_conditions_parse_and_describe_a_receiver_log() {
    let f = fixture();
    let tc = TestConditions::parse(&f.conditions).unwrap();
    assert_eq!(tc.recording.kind.as_deref(), Some("receiver-log"));
    assert!(tc.expected.is_empty());
    assert!(!tc.events.is_empty());
    // Same bytes, same hash: the export is deterministic.
    assert_eq!(f.conditions, fixture().conditions);
}

#[test]
fn pack_links_scenario_conditions_log_and_score_and_verifies() {
    let f = fixture();
    let seed = generate_seed();
    let pack = build_round_trip_pack(&request(&f), &f.scenario, &f.conditions, &seed).unwrap();
    let report = verify_bundle(&pack.files, &VerifyOptions::default());
    assert!(report.ok, "{:?}", report.failures);
    let cfg: serde_json::Value = serde_json::from_slice(&pack.files["config.json"]).unwrap();
    let rt = &cfg["round_trip"];
    assert_eq!(rt["schema"], "kshana.round-trip/1");
    let sha = |b: &[u8]| {
        use sha2::{Digest, Sha256};
        hex::encode(Sha256::digest(b))
    };
    assert_eq!(rt["scenario_sha256"], sha(f.scenario.as_bytes()));
    assert_eq!(rt["log_sha256"], sha(&f.log));
    let tc = TestConditions::parse(&f.conditions).unwrap();
    assert_eq!(rt["conditions_hash"], tc.hash());
    assert!(rt["score"]["events_evaluable"].is_u64());
    assert!(rt["notice"]
        .as_str()
        .unwrap()
        .contains("not a certification"));
    // The block is covered by the signature: changing it breaks verification.
    let mut files = pack.files.clone();
    let tampered = String::from_utf8(files["config.json"].clone())
        .unwrap()
        .replace("kshana.round-trip/1", "kshana.round-trip/2");
    files.insert("config.json".into(), tampered.into_bytes());
    assert!(!verify_bundle(&files, &VerifyOptions::default()).ok);
}

#[test]
fn conditions_that_disagree_with_the_scoring_events_are_refused() {
    let f = fixture();
    let mut tc: serde_json::Value = serde_json::from_str(&f.conditions).unwrap();
    tc["event"][0]["onset_s"] = serde_json::json!(1.0);
    let seed = generate_seed();
    let e = build_round_trip_pack(&request(&f), &f.scenario, &tc.to_string(), &seed).unwrap_err();
    assert!(e.contains("does not match"), "{e}");
}

#[test]
fn a_stated_log_hash_that_does_not_match_is_refused() {
    let f = fixture();
    let mut tc: serde_json::Value = serde_json::from_str(&f.conditions).unwrap();
    tc["recording"]["sha256"] = serde_json::json!("0".repeat(64));
    let seed = generate_seed();
    let e = build_round_trip_pack(&request(&f), &f.scenario, &tc.to_string(), &seed).unwrap_err();
    assert!(e.contains("SHA-256"), "{e}");
}

#[test]
fn published_schema_names_every_field_the_engine_writes() {
    // A fully populated document: every key the engine serialises must be in the schema, and
    // every enum value the engine accepts must be listed there.
    let doc = r#"{
      "schema": "kshana.test-conditions/1",
      "recording": {"id": "r", "kind": "iq", "path": "p", "sha256": "00", "format": "ci16_le",
        "sample_rate_hz": 1.0, "center_hz": 1.0, "if_hz": 1.0, "header_bytes": 0,
        "start_utc": "2025-01-01T00:00:00Z", "events_from_sigmf": true, "settle_s": 5.0},
      "receiver": {"dut": "", "front_end": "", "notes": ""},
      "expected": [{"signal": "gps-l1ca", "ids": [1], "nominal_cn0_dbhz": 45.0,
        "doppler_hz": [0.0], "code_phase_chips": [0.0], "periods_per_bit": 20, "truth": "t"}],
      "event": [{"id": "e", "kind": "interference", "type": "cw", "onset_s": 1.0, "offset_s": 2.0,
        "affects": [1], "center_offset_hz": 0.0, "bandwidth_hz": 0.0, "q": 1.0,
        "power": {"quantity": "js_db", "interpolation": "linear", "points": [[1.0, 1.0]],
          "reference_signal_dbm": -130.0}}],
      "bars": null
    }"#;
    let root = PathBuf::from(env!("CARGO_MANIFEST_DIR"));
    let schema: serde_json::Value = serde_json::from_str(
        &std::fs::read_to_string(root.join("docs/spec/test-conditions.schema.json")).unwrap(),
    )
    .unwrap();
    let mut v: serde_json::Value = serde_json::from_str(doc).unwrap();
    v.as_object_mut().unwrap().remove("bars");
    // Parse leniently as the engine would (sha256 aside) and compare key sets structurally.
    let keys = |o: &serde_json::Value| -> std::collections::BTreeSet<String> {
        o.as_object().unwrap().keys().cloned().collect()
    };
    let props = |s: &serde_json::Value| keys(&s["properties"]);
    let top = props(&schema);
    assert!(keys(&v).is_subset(&top));
    assert_eq!(
        keys(&v["recording"]),
        props(&schema["properties"]["recording"])
    );
    assert_eq!(
        keys(&v["receiver"]),
        props(&schema["properties"]["receiver"])
    );
    assert_eq!(
        keys(&v["expected"][0]),
        props(&schema["properties"]["expected"]["items"])
    );
    assert_eq!(
        keys(&v["event"][0]),
        props(&schema["properties"]["event"]["items"])
    );
    let ev = &schema["properties"]["event"]["items"]["properties"];
    assert_eq!(keys(&v["event"][0]["power"]), props(&ev["power"]));
    // Enum values the engine accepts.
    let enum_of = |s: &serde_json::Value| -> Vec<String> {
        s["enum"]
            .as_array()
            .unwrap()
            .iter()
            .map(|x| x.as_str().unwrap().to_string())
            .collect()
    };
    for k in enum_of(&ev["kind"]) {
        let t = doc.replace("\"kind\": \"interference\"", &format!("\"kind\": \"{k}\""));
        let t = t.replace(
            "\"sha256\": \"00\"",
            &format!("\"sha256\": \"{}\"", "0".repeat(64)),
        );
        TestConditions::parse(&t).unwrap_or_else(|e| panic!("kind {k}: {e}"));
    }
    for k in enum_of(&ev["type"]) {
        let t = doc.replace("\"type\": \"cw\"", &format!("\"type\": \"{k}\""));
        let t = t.replace(
            "\"sha256\": \"00\"",
            &format!("\"sha256\": \"{}\"", "0".repeat(64)),
        );
        TestConditions::parse(&t).unwrap_or_else(|e| panic!("type {k}: {e}"));
    }
}
