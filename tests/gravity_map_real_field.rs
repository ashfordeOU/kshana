// SPDX-License-Identifier: AGPL-3.0-only
//! The `gravity-map` scenario on the real EGM2008 field (WP-10, RM-17) and the map-error
//! Monte Carlo (RM-15).
//!
//! The real-field benchmark outcome was pre-registered in
//! `xval/icgem-egm2008/PREREGISTRATION.md` before its first run, and the outcome is in
//! `RESULTS.md` there: B1 (matched error < 500 m) is NOT MET at 3106 m, and B2 (a tenfold
//! cut on the drift) is MET. The test below asserts the recorded side of each bar, so the
//! miss stays visible and a change that flips either side fails here. The field synthesis
//! itself is checked against ICGEM in `tests/icgem_gravity_anomaly_oracle.rs`. The
//! navigation outcome has no external oracle.

use kshana::field_schema::audit_document;
use serde_json::Value;

fn run(src: &str) -> Value {
    let out = kshana::api::run_toml(src).expect("gravity-map scenario runs");
    serde_json::from_str(&out.json).expect("result JSON parses")
}

const EGM2008: &str = include_str!("../scenarios/gps-denied-gravity-nav-egm2008.toml");

#[test]
fn egm2008_benchmark_records_the_preregistered_outcome() {
    let d = run(EGM2008);
    let drift = d["free_inertial_drift_m"].as_f64().unwrap();
    let matched = d["map_matched_error_m"].as_f64().unwrap();
    // B1 NOT MET (recorded 3105.5 m): degree 70 is too smooth to pin the drift to 500 m.
    assert!(
        matched >= 500.0,
        "B1 was recorded NOT MET at 3106 m; now {matched} m (update RESULTS.md)"
    );
    // B2 MET (recorded 3105.5 m against 7060.7 m).
    assert!(
        matched < drift / 10.0,
        "B2 was recorded MET; now {matched} m against drift/10 = {} m",
        drift / 10.0
    );
    assert_eq!(d["reference_nmax"].as_u64(), Some(70));
    assert!(d["reference_anomaly_std_mgal"].as_f64().unwrap() > 1.0);
}

#[test]
fn optional_blocks_are_fully_described_by_units() {
    let mc = format!(
        "{EGM2008}\n[map_error_mc]\nrealisations = 3\nsigma_mgal = 1.0\n\
         correlation_length_deg = 0.2\nseed = 5\n"
    );
    for (name, src) in [("reference", EGM2008.to_string()), ("reference+mc", mc)] {
        let d = run(&src);
        let audit = audit_document(&d);
        assert!(
            audit.is_complete(),
            "{name}: missing {:?}, malformed {:?}",
            audit.missing,
            audit.malformed.len()
        );
    }
}

#[test]
fn map_error_mc_summary_is_ordered_and_bounded() {
    let src = format!(
        "{EGM2008}\n[map_error_mc]\nrealisations = 4\nsigma_mgal = 1.0\n\
         correlation_length_deg = 0.2\nseed = 5\n"
    );
    let d = run(&src);
    let mc = &d["map_error_mc"];
    let f = |k: &str| mc[k].as_f64().unwrap();
    assert_eq!(mc["realisations"].as_u64(), Some(4));
    assert!(f("matched_error_p50_m") <= f("matched_error_p95_m"));
    assert!(f("matched_error_p95_m") <= f("matched_error_max_m"));
    assert!((0.0..=1.0).contains(&f("fraction_within_target")));
    // Deterministic per seed.
    assert_eq!(run(&src)["map_error_mc"], *mc);
}

#[test]
fn bad_reference_configs_are_refused() {
    let with_coeffs = format!("{EGM2008}\n[[coeffs]]\nn = 2\nm = 0\ncbar = 1e-6\nsbar = 0.0\n");
    let e = kshana::api::run_toml(&with_coeffs).unwrap_err();
    assert!(e.contains("must be empty"), "{e}");
    let bad_model = EGM2008.replace("model = \"egm2008\"", "model = \"egm96\"");
    assert!(kshana::api::run_toml(&bad_model)
        .unwrap_err()
        .contains("unknown reference model"));
    let gfc_no_path = EGM2008.replace("model = \"egm2008\"", "model = \"gfc\"");
    assert!(kshana::api::run_toml(&gfc_no_path)
        .unwrap_err()
        .contains("gfc_path"));
}
