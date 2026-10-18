// SPDX-License-Identifier: AGPL-3.0-only
//! The `lab-attestation` record of an evidence pack: recorded in the signed manifest as given,
//! absent from a pack made without one (which stays byte-for-byte what it was), reported by
//! verification as the operator's statement, and refused when incomplete. It is never verified.

use kshana::evidence::{
    create_bundle, create_bundle_attested, verify_bundle, EvidenceInput, LabAttestation, Manifest,
    VerifyOptions, Window,
};
use serde_json::json;

const SEED: [u8; 32] = [9u8; 32];

fn input(log: &[u8]) -> EvidenceInput<'_> {
    EvidenceInput {
        title: "Lab session",
        engine_version: "0.0.0-test",
        log_format: "nmea",
        log_file_name: "session.nmea",
        log_bytes: log,
        start_label: None,
        slice: None,
        window: Window {
            from_s: 0.0,
            to_s: 2.0,
        },
        config: json!({"k": 1}),
        epochs: (0..=2).map(|t| json!({"t_s": t as f64})).collect(),
        created_utc: Some("2026-11-02T10:00:00Z"),
    }
}

fn attestation() -> LabAttestation {
    LabAttestation::from_toml(
        r#"
operator = "lab technician"
organisation = "a laboratory"
date = "2026-11-02"
setup = "shielded"
enclosure = "RF box, asset 17"
emitter = "laboratory-owned simulator"
statement = "No emission outside the enclosure."
"#,
    )
    .unwrap()
}

#[test]
fn a_pack_without_an_attestation_is_unchanged() {
    let log = b"$GPGGA,000000*00\r\n".to_vec();
    let plain = create_bundle(&input(&log), &SEED, None).unwrap();
    let via_none = create_bundle_attested(&input(&log), &SEED, None, None).unwrap();
    assert_eq!(plain, via_none);
    let m: serde_json::Value = serde_json::from_slice(&plain["manifest.json"]).unwrap();
    assert!(m.get("lab_attestation").is_none());
    assert!(verify_bundle(&plain, &VerifyOptions::default())
        .lab_attestation
        .is_none());
}

#[test]
fn the_attestation_is_recorded_signed_and_reported_as_the_operators_statement() {
    let log = b"$GPGGA,000000*00\r\n".to_vec();
    let a = attestation();
    let files = create_bundle_attested(&input(&log), &SEED, None, Some(&a)).unwrap();
    let m: Manifest = serde_json::from_slice(&files["manifest.json"]).unwrap();
    assert_eq!(m.lab_attestation.as_ref(), Some(&a));
    let r = verify_bundle(&files, &VerifyOptions::default());
    assert!(r.ok, "{:?}", r.failures);
    assert_eq!(r.lab_attestation.as_ref(), Some(&a));
    assert!(
        r.notes
            .iter()
            .any(|n| n.contains("lab attestation") && n.contains("not verified by Kshana")),
        "{:?}",
        r.notes
    );
    // The attestation sits inside the signed manifest: editing it breaks the signature.
    let mut tampered = files.clone();
    let text = String::from_utf8(tampered["manifest.json"].clone())
        .unwrap()
        .replace("shielded", "conducted");
    tampered.insert("manifest.json".into(), text.into_bytes());
    assert!(!verify_bundle(&tampered, &VerifyOptions::default()).ok);
}

#[test]
fn an_incomplete_or_over_the_air_attestation_is_refused() {
    let log = b"$GPGGA,000000*00\r\n".to_vec();
    let mut a = attestation();
    a.setup = "over-the-air".into();
    let e = create_bundle_attested(&input(&log), &SEED, None, Some(&a)).unwrap_err();
    assert!(e.to_string().contains("over-the-air"), "{e}");
    let mut a = attestation();
    a.enclosure = None;
    assert!(create_bundle_attested(&input(&log), &SEED, None, Some(&a)).is_err());
}
