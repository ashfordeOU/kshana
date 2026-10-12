// SPDX-License-Identifier: AGPL-3.0-only
//! Lunar reference station geodesy: one retroreflector and one VLBI beacon added at a station
//! site, against today's five retroreflector arrays (the `station_geodesy` block of
//! `lunar-llr-datum`). MODELLED.
//!
//! * An added site never increases any variance: `H_after - H_before` is positive
//!   semi-definite, and every Helmert sigma's after/before ratio is at most one.
//! * An empty or absent extra list gives bit-identical output, and the baseline example is the
//!   kind's default report.
//! * Every numeric field of the block has a unit.

use kshana::api::run_toml;
use kshana::field_schema::audit_document;
use serde_json::Value;

const BASELINE: &str = "scenarios/lunar-station-geodesy-baseline.toml";
const WITH: &str = "scenarios/lunar-station-geodesy-with-station.toml";

fn read(p: &str) -> String {
    std::fs::read_to_string(p).expect("scenario present")
}

#[test]
fn empty_or_absent_extra_lists_are_bit_identical() {
    let base = run_toml("kind = \"lunar-llr-datum\"\n").unwrap();
    for src in [
        "kind = \"lunar-llr-datum\"\nextra_reflectors = []\nextra_beacons = []\n".to_string(),
        read(BASELINE),
    ] {
        let o = run_toml(&src).unwrap();
        assert_eq!(o.json, base.json, "{src}");
        assert_eq!(o.summary, base.summary);
    }
}

#[test]
fn an_added_site_never_increases_any_variance() {
    let v: Value = serde_json::from_str(&run_toml(&read(WITH)).unwrap().json).unwrap();
    let sg = &v["station_geodesy"];
    assert!(sg["label"].as_str().unwrap().contains("MODELLED"));

    // The Fisher difference is positive semi-definite, up to rounding.
    let lo = sg["fisher_difference_min_eigenvalue"].as_f64().unwrap();
    let hi = sg["fisher_difference_max_eigenvalue"].as_f64().unwrap();
    assert!(hi > 0.0, "the added sites added no information");
    assert!(
        lo >= -1e-9 * hi,
        "H_after - H_before not PSD: min {lo}, max {hi}"
    );

    // Every sigma is at most its before value.
    for p in sg["parameters"].as_array().unwrap() {
        let b = p["sigma_before"].as_f64().unwrap();
        let a = p["sigma_after"].as_f64().unwrap();
        assert!(
            a <= b * (1.0 + 1e-12),
            "{}: after {a} > before {b}",
            p["name"]
        );
        let r = p["ratio_after_over_before"].as_f64().unwrap();
        assert!(r > 0.0 && r <= 1.0 + 1e-12);
    }

    // The before column is the five-array result the report already carries.
    assert_eq!(
        sg["before"]["translation_sigma_norm_m"],
        v["datum_accuracy"]["translation_sigma_norm_m"]
    );

    // Both sites were actually observed, and the polar reflector was not ranged continuously.
    let r = &sg["extra_reflectors"][0];
    assert!(r["observations_added"].as_u64().unwrap() > 0);
    let b = &sg["extra_beacons"][0];
    assert!(b["observations"].as_u64().unwrap() > 0);
}

#[test]
fn the_rest_of_the_report_is_the_five_array_result() {
    let base: Value =
        serde_json::from_str(&run_toml("kind = \"lunar-llr-datum\"\n").unwrap().json).unwrap();
    let mut with: Value = serde_json::from_str(&run_toml(&read(WITH)).unwrap().json).unwrap();
    with.as_object_mut().unwrap().remove("station_geodesy");
    with["units"]
        .as_object_mut()
        .unwrap()
        .retain(|k, _| !k.starts_with("station_geodesy"));
    assert_eq!(base, with);
}

#[test]
fn every_station_geodesy_field_has_a_unit() {
    let v: Value = serde_json::from_str(&run_toml(&read(WITH)).unwrap().json).unwrap();
    let audit = audit_document(&v);
    assert!(audit.malformed.is_empty(), "{:?}", audit.malformed);
    assert!(
        audit.missing.is_empty(),
        "fields without units: {:?}",
        audit.missing
    );
}

#[test]
fn a_beacon_list_inside_the_campaign_block_is_refused() {
    let src = "kind = \"lunar-llr-datum\"\n[[extra_beacons]]\nlat_deg = -89.0\nlon_deg = 0.0\n\
               [beacon_campaign]\nbeacons = [{ lat_deg = 0.0, lon_deg = 0.0 }]\n";
    assert!(run_toml(src).is_err());
}
