// SPDX-License-Identifier: AGPL-3.0-only
//! B3a v2 synthetic gate (`docs/design/evidence/b3a-power-difference-locator/PREREGISTRATION-v2.md`,
//! readings V1 to V15 in `xval/locator-power-difference/README.md`). The gate was run once on seeds
//! 4001-5000 and recorded in `gate-v2.json.gz`: S1, S2 and S3 NOT MET (`RESULTS-v2.md`).
//!
//! This test is also S4 as read in V12: it re-runs recorded gate seeds and requires the recorded rows
//! bit for bit. CI runs it on Linux, macOS and Windows (job `b3a-v2-determinism`), in debug; the rows
//! were recorded by a release build. The CLI, Python and WebAssembly half of S4 is not assessable in
//! 0.41: the locator has no such surface.

use std::io::Read;

use flate2::read::GzDecoder;
use kshana::locate_pd::{gate_row, PowerDifferenceParams, METHOD_ID_V2};
use serde_json::Value;

fn recorded(name: &str) -> Value {
    let mut s = String::new();
    GzDecoder::new(
        std::fs::File::open(format!("xval/locator-power-difference/{name}")).expect("gate file"),
    )
    .read_to_string(&mut s)
    .expect("gzip");
    serde_json::from_str(&s).expect("json")
}

#[test]
fn recorded_v2_gate_rows_reproduce_bit_for_bit() {
    let rec = recorded("gate-v2.json.gz");
    let p = PowerDifferenceParams::preregistered_v2();
    let rows = rec["rows"].as_array().expect("rows");
    // The first ten gate seeds, and the first two sessions that were not located (V7).
    let not_located: Vec<&Value> = rows
        .iter()
        .filter(|r| r["located"] == Value::Bool(false))
        .take(2)
        .collect();
    assert_eq!(not_located.len(), 2);
    for want in rows.iter().take(10).chain(not_located) {
        let seed = want["seed"].as_u64().expect("seed");
        let got = gate_row(&p, seed, &[p.temper]);
        assert_eq!(Value::from(got.located), want["located"], "seed {seed}");
        assert_eq!(
            Value::from(got.covered[0]),
            want["covered"][0],
            "seed {seed}"
        );
        assert_eq!(
            got.centroid_err_km[0].to_bits(),
            want["centroid_err_km"][0].as_f64().expect("err").to_bits(),
            "seed {seed}: centroid error"
        );
        assert_eq!(
            got.area_share[0].to_bits(),
            want["area_share"][0].as_f64().expect("area").to_bits(),
            "seed {seed}: area share"
        );
        assert_eq!(
            got.nn_spacing_km.to_bits(),
            want["nn_spacing_km"].as_f64().expect("nn").to_bits(),
            "seed {seed}: spacing"
        );
    }
}

#[test]
fn recorded_v2_gate_not_met() {
    let rec = recorded("gate-v2.json.gz");
    assert_eq!(rec["method"]["method"], METHOD_ID_V2);
    assert_eq!(rec["seeds"], serde_json::json!([4001, 5000]));
    assert_eq!(rec["rows"].as_array().map(Vec::len), Some(1000));
    let s1 = rec["S1_coverage"].as_f64().expect("s1");
    let s2 = rec["S2_median_area_share"].as_f64().expect("s2");
    let s3 = rec["S3_centroid_ratio"].as_f64().expect("s3");
    // NOT MET, pinned: coverage 0.89 (bar >= 0.90), median 95% region 26.1% of the domain
    // (bar <= 25%), median centroid error 1.45 x the station spacing (bar <= 0.5 x).
    assert!(s1 == 0.89 && s1 < 0.90, "S1 {s1}");
    assert!(
        (s2 - 0.261_169_723_723_801_2).abs() < 1e-15 && s2 > 0.25,
        "S2 {s2}"
    );
    assert!(
        (s3 - 1.449_800_233_089_489_7).abs() < 1e-15 && s3 > 0.5,
        "S3 {s3}"
    );
    assert_eq!(rec["not_located"].as_u64(), Some(34));
    assert_eq!(rec["redraws"].as_u64(), Some(379));
}

#[test]
fn development_run_seen_before_the_gate() {
    // V13: implementation checks only; recorded before any gate seed was drawn.
    let dev = recorded("dev-v2.json.gz");
    assert_eq!(dev["seeds"], serde_json::json!([3001, 3200]));
    assert_eq!(dev["S1_coverage"].as_f64(), Some(0.905));
    assert!(
        (dev["S2_median_area_share"].as_f64().expect("s2") - 0.287_559_844_342_479_7).abs() < 1e-15
    );
    assert!(
        (dev["S3_centroid_ratio"].as_f64().expect("s3") - 1.499_724_635_887_068_4).abs() < 1e-15
    );
}
