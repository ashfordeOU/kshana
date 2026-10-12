// SPDX-License-Identifier: AGPL-3.0-only
//! Evidence packs across the 0.36 geometry change: a pack written before 0.36 (the committed
//! oracle packs, whose `epochs.json` carries no geometry) still verifies, and a pack written
//! now carries the geometry and the deduction classes and shows both on its summary page.

use std::path::Path;

use kshana::evidence::cli::read_dir;
use kshana::evidence::{build_receiver_trust_pack, verify_bundle, PackRequest, VerifyOptions};
use kshana::receiver_trust::scenario::{resolve_paths, ReceiverTrustScenario};

const ROOT: &str = env!("CARGO_MANIFEST_DIR");

#[test]
fn a_pack_written_before_0_36_still_verifies() {
    for name in ["static", "whole", "stamped"] {
        let dir = Path::new(ROOT)
            .join("tests/fixtures/evidence_pack_oracle/packs")
            .join(name);
        let files = read_dir(&dir).unwrap();
        let epochs = String::from_utf8(files["epochs.json"].clone()).unwrap();
        assert!(!epochs.contains("\"geometry\""), "{name}: a pre-0.36 pack");
        let rep = verify_bundle(&files, &VerifyOptions::default());
        assert!(rep.ok, "{name}: {:?}", rep.failures);
    }
}

#[test]
fn a_0_36_pack_carries_and_shows_the_geometry_and_the_classes() {
    let dir = Path::new(ROOT).join("examples/maritime-trust");
    let mut scn: ReceiverTrustScenario =
        toml::from_str(&std::fs::read_to_string(dir.join("session.toml")).unwrap()).unwrap();
    resolve_paths(&mut scn, &dir);
    let log = std::fs::read(dir.join("tallinn-helsinki.nmea")).unwrap();
    // A window inside the drag-off, so deductions (and their classes) are present.
    let req = PackRequest {
        scenario: &scn,
        log_bytes: &log,
        nav_bytes: None,
        log_file_name: "tallinn-helsinki.nmea",
        from: "2000",
        to: "2060",
        title: "geometry evidence test",
        created_utc: None,
    };
    let pack = build_receiver_trust_pack(&req, &[7u8; 32], None).unwrap();
    let f = &pack.files;
    assert!(verify_bundle(f, &VerifyOptions::default()).ok);
    let epochs = String::from_utf8(f["epochs.json"].clone()).unwrap();
    assert!(epochs.contains("\"geometry\"") && epochs.contains("\"class\""));
    let config = String::from_utf8(f["config.json"].clone()).unwrap();
    assert!(config.contains("\"geometry_model\""));
    let html = String::from_utf8(f["summary.html"].clone()).unwrap();
    assert!(
        html.contains("Satellite geometry, epochs each"),
        "geometry lane"
    );
    assert!(html.contains("Deductions by class"), "class lane");
    assert!(html.contains("Geometry label, epochs each"), "label lane");
    assert!(
        html.contains("Stated HDOP the stated sky does not explain"),
        "the mismatch is never silent"
    );
    assert!(
        html.contains("<th>inconsistency</th>"),
        "the drag-off's class"
    );
}
