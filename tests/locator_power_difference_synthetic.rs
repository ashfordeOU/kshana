// SPDX-License-Identifier: AGPL-3.0-only
//! B3a synthetic gate (`docs/design/evidence/b3a-power-difference-locator/`, readings in
//! `xval/locator-power-difference/README.md`). The gate was run once on seeds 1001-2000 and recorded in
//! `gate.json.gz`: S1 met, S2 and S3 NOT MET. This test re-runs the first ten gate seeds and requires
//! the recorded rows, and asserts the recorded misses.

use std::io::Read;

use flate2::read::GzDecoder;
use kshana::locate_pd::{gate_row, PowerDifferenceParams, TEMPER_V1};
use serde_json::Value;

fn recorded() -> Value {
    let mut s = String::new();
    GzDecoder::new(
        std::fs::File::open("xval/locator-power-difference/gate.json.gz").expect("gate file"),
    )
    .read_to_string(&mut s)
    .expect("gzip");
    serde_json::from_str(&s).expect("json")
}

#[test]
fn first_gate_seeds_reproduce_the_recorded_rows() {
    let rec = recorded();
    let p = PowerDifferenceParams::preregistered_v1();
    for want in rec["rows"].as_array().expect("rows").iter().take(10) {
        let seed = want["seed"].as_u64().expect("seed");
        let got = gate_row(&p, seed, &[TEMPER_V1]);
        assert_eq!(
            Value::from(got.covered[0]),
            want["covered"][0],
            "seed {seed}"
        );
        let d = (got.centroid_err_km[0] - want["centroid_err_km"][0].as_f64().expect("err")).abs();
        assert!(d == 0.0, "seed {seed}: centroid error differs by {d}");
        assert_eq!(
            Value::from(got.area_share[0]),
            want["area_share"][0],
            "seed {seed}"
        );
    }
}

#[test]
fn recorded_gate_s1_met_s2_s3_not_met() {
    let rec = recorded();
    assert_eq!(rec["temper"].as_f64(), Some(1.0 / 60.0));
    let s1 = rec["S1_coverage"].as_f64().expect("s1");
    let s2 = rec["S2_median_area_share"].as_f64().expect("s2");
    let s3 = rec["S3_centroid_ratio"].as_f64().expect("s3");
    assert!(s1 >= 0.90, "S1 met: {s1}");
    // NOT MET, pinned: median 95% region 52.5% of the domain (bar <= 25%) and median centroid
    // error 2.55 x the station spacing (bar <= 0.5 x).
    assert!((s2 - 0.5250060804426365).abs() < 1e-15 && s2 > 0.25);
    assert!((s3 - 2.5502744706265723).abs() < 1e-15 && s3 > 0.5);
}
