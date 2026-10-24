// SPDX-License-Identifier: AGPL-3.0-only
//! The evidence label in signed evidence packs (0.40): additive and forward-only.
//!
//! * a pack built now carries the label inside `config.json`, so the manifest's file hash, the hash chain and the
//!   signature cover it, and `kshana evidence verify` reports the tier;
//! * changing the label breaks verification (it is inside the signed chain);
//! * a pack made before 0.40 (the committed clean-room oracle packs, built by the engine before the label existed)
//!   verifies unchanged and is reported as having no label;
//! * the label's rows exist in the verification matrix.

use kshana::evidence::{
    build_receiver_trust_pack, verify_bundle, Files, PackRequest, VerifyOptions,
};
use kshana::receiver_trust::scenario::ReceiverTrustScenario;
use std::path::Path;

fn new_pack() -> Files {
    let dir = Path::new(env!("CARGO_MANIFEST_DIR")).join("examples/receiver-trust");
    let scn: ReceiverTrustScenario =
        toml::from_str(&std::fs::read_to_string(dir.join("session.toml")).unwrap()).unwrap();
    let log = std::fs::read(dir.join("illustrative-jamming.nmea")).unwrap();
    build_receiver_trust_pack(
        &PackRequest {
            scenario: &scn,
            log_bytes: &log,
            nav_bytes: None,
            imu_bytes: None,
            log_file_name: "illustrative-jamming.nmea",
            from: "100",
            to: "130",
            title: "Label test",
            created_utc: None,
        },
        &[3u8; 32],
        None,
    )
    .unwrap()
    .files
}

#[test]
fn a_new_pack_carries_a_label_inside_the_signed_config_and_verify_reports_it() {
    let files = new_pack();
    let cfg: serde_json::Value = serde_json::from_slice(&files["config.json"]).unwrap();
    assert_eq!(cfg["config_version"], "1.1");
    let tier = cfg["evidence"]["tier"].as_str().unwrap();
    assert!(matches!(tier, "VALIDATED" | "MODELLED" | "PARTNER"));
    assert!(cfg["evidence"]["rows"].as_array().unwrap().len() >= 4);
    let r = verify_bundle(&files, &VerifyOptions::default());
    assert!(r.ok, "{:?}", r.failures);
    let ev = r.evidence.as_ref().expect("verify reports the label");
    assert_eq!(ev.tier, tier);
    assert!(r.notes.iter().any(|n| n.starts_with("evidence label: ")));
    // Every row id is in the matrix.
    let ids: Vec<String> = kshana::verification::verification_matrix()
        .iter()
        .map(|m| m.id.to_string())
        .collect();
    for id in &ev.rows {
        assert!(ids.contains(id), "{id} is not a matrix row");
    }
}

#[test]
fn altering_the_label_breaks_the_signed_chain() {
    let mut files = new_pack();
    let cfg = String::from_utf8(files["config.json"].clone()).unwrap();
    assert!(cfg.contains("\"MODELLED\""));
    files.insert(
        "config.json".to_string(),
        cfg.replacen("\"MODELLED\"", "\"VALIDATED\"", 1)
            .into_bytes(),
    );
    let r = verify_bundle(&files, &VerifyOptions::default());
    assert!(!r.ok, "a changed label must fail verification");
}

#[test]
fn packs_made_before_0_40_still_verify_unchanged_and_say_they_have_no_label() {
    let root =
        Path::new(env!("CARGO_MANIFEST_DIR")).join("tests/fixtures/evidence_pack_oracle/packs");
    let mut checked = 0;
    for entry in std::fs::read_dir(root).unwrap().flatten() {
        let mut files = Files::new();
        for f in std::fs::read_dir(entry.path()).unwrap().flatten() {
            files.insert(
                f.file_name().to_string_lossy().to_string(),
                std::fs::read(f.path()).unwrap(),
            );
        }
        let r = verify_bundle(&files, &VerifyOptions::default());
        assert!(r.ok, "{:?}: {:?}", entry.path(), r.failures);
        assert!(r.evidence.is_none());
        assert!(r
            .notes
            .iter()
            .any(|n| n == "no evidence label (pre-0.40 pack)"));
        checked += 1;
    }
    assert!(checked >= 3, "only {checked} pre-0.40 packs were checked");
}
