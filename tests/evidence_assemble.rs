//! `build_receiver_trust_pack`: the pure entry point every surface calls.

use kshana::evidence::{
    build_receiver_trust_pack, verify_bundle, Manifest, PackRequest, VerifyOptions,
};
use kshana::receiver_trust::scenario::ReceiverTrustScenario;
use std::path::Path;

fn example() -> (ReceiverTrustScenario, Vec<u8>) {
    let dir = Path::new(env!("CARGO_MANIFEST_DIR")).join("examples/receiver-trust");
    let scn: ReceiverTrustScenario =
        toml::from_str(&std::fs::read_to_string(dir.join("session.toml")).unwrap()).unwrap();
    (
        scn,
        std::fs::read(dir.join("illustrative-jamming.nmea")).unwrap(),
    )
}

fn req<'a>(
    scn: &'a ReceiverTrustScenario,
    log: &'a [u8],
    from: &'a str,
    to: &'a str,
) -> PackRequest<'a> {
    PackRequest {
        scenario: scn,
        log_bytes: log,
        nav_bytes: None,
        log_file_name: "/anywhere/illustrative-jamming.nmea",
        from,
        to,
        title: "Pure-function pack",
        created_utc: None,
    }
}

#[test]
fn builds_a_verifiable_reproducible_pack_from_bytes_alone() {
    let (scn, log) = example();
    let a = build_receiver_trust_pack(&req(&scn, &log, "100", "130"), &[3u8; 32], None).unwrap();
    let b = build_receiver_trust_pack(&req(&scn, &log, "100", "130"), &[3u8; 32], None).unwrap();
    assert_eq!(a.files, b.files, "no clock, no randomness");
    assert_eq!(a.epochs_in_window, 31);
    assert!(a.slice.is_some(), "NMEA reports source spans");
    let r = verify_bundle(
        &a.files,
        &VerifyOptions {
            expected_public_key: None,
            full_log: Some(&log),
            ..Default::default()
        },
    );
    assert!(r.ok, "{:?}", r.failures);
    let m: Manifest = serde_json::from_slice(&a.files["manifest.json"]).unwrap();
    assert_eq!(m.log.file_name, "illustrative-jamming.nmea");
    assert_eq!(m.log.slice.sha256.len(), 64);
    assert_eq!(a.manifest_sha256.len(), 64);
}

#[test]
fn window_outside_the_log_is_an_error_not_an_empty_pack() {
    let (scn, log) = example();
    let e =
        build_receiver_trust_pack(&req(&scn, &log, "9000", "9100"), &[3u8; 32], None).unwrap_err();
    assert!(e.contains("no epoch"), "{e}");
    assert!(
        build_receiver_trust_pack(&req(&scn, &log, "soon", "later"), &[3u8; 32], None).is_err()
    );
}
