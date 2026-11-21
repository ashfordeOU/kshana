// SPDX-License-Identifier: AGPL-3.0-only
//! Opt-in test path for the public key ID 2 era of the live Galileo OSNMA service (public key
//! ID 2 applicable since 2025-12-10 10:00 UTC; the Merkle root unchanged since 2024-01-15).
//! The official test vectors predate it, so this runs the verifier on a recording you make or
//! obtain yourself after that date. Nothing is stored in or fetched by this repository.
//!
//! * `KSHANA_OSNMA_LIVE_RECORDING`: I/NAV pages in the plain page format, or a u-blox
//!   UBX-RXM-SFRBX stream, recorded after 2025-12-10 10:00 UTC (long enough to hold at least
//!   one complete DSM-KROOT: a few minutes; a DSM-PKR as well if only the Merkle root is given);
//! * and either `KSHANA_OSNMA_MERKLE_ROOT` (64 hex digits: the operational Merkle root as the
//!   European GNSS Service Centre publishes it) or `KSHANA_OSNMA_PUBLIC_KEY`
//!   (`2:p256:<compressed point hex>`), or both.
//!
//! It asserts that a chain signed with key ID 2 verifies, that tags authenticate and that none
//! fails. Without the variables it does nothing and says so. Not run on any recording in this
//! repository's CI (status: unverified until someone runs it on a real recording).

use kshana::osnma::cli::{parse_public_key, verify_report, VerifyParams};

#[test]
fn a_recording_from_the_public_key_id_2_era_verifies() {
    let Ok(rec) = std::env::var("KSHANA_OSNMA_LIVE_RECORDING") else {
        eprintln!("KSHANA_OSNMA_LIVE_RECORDING is not set: public key ID 2 test not run");
        return;
    };
    let root = std::env::var("KSHANA_OSNMA_MERKLE_ROOT").ok().map(|h| {
        let b: [u8; 32] = hex::decode(h.trim())
            .expect("KSHANA_OSNMA_MERKLE_ROOT: hex")
            .try_into()
            .expect("KSHANA_OSNMA_MERKLE_ROOT: 32 bytes");
        b
    });
    let keys: Vec<_> = std::env::var("KSHANA_OSNMA_PUBLIC_KEY")
        .ok()
        .map(|k| parse_public_key(k.trim()).expect("KSHANA_OSNMA_PUBLIC_KEY"))
        .into_iter()
        .collect();
    assert!(
        root.is_some() || !keys.is_empty(),
        "set KSHANA_OSNMA_MERKLE_ROOT or KSHANA_OSNMA_PUBLIC_KEY"
    );
    if let Some(k) = keys.first() {
        assert_eq!(k.pkid, 2, "this test is for public key ID 2");
    }
    let raw = std::fs::read(&rec).unwrap();
    let p = VerifyParams {
        label: &rec,
        format: None,
        start_gst: None,
        merkle_root: root,
        keys,
        reference: None,
        max_err: None,
    };
    let (report, any_failed) = verify_report(raw, &p).unwrap();
    let events = report["events"].as_array().unwrap();
    assert!(
        events
            .iter()
            .any(|e| e["kind"] == "kroot_verified" && e["pkid"] == 2),
        "no chain signed with public key ID 2 verified: {events:?}"
    );
    let tags = report["tags"].as_array().unwrap();
    let ok = tags
        .iter()
        .filter(|t| t["status"]["state"] == "authenticated")
        .count();
    let failed = tags
        .iter()
        .filter(|t| t["status"]["state"] == "failed")
        .count();
    assert!(ok > 0, "no tag authenticated");
    assert_eq!(failed, 0, "{failed} tags failed");
    assert!(!any_failed);
    eprintln!("public key ID 2: {ok} tags authenticated, 0 failed ({rec})");
}
