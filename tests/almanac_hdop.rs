// SPDX-License-Identifier: AGPL-3.0-only
//! D18, item 1 (docs/design/evidence/d18-bench-leftovers/PREREGISTRATION.md): the almanac-HDOP
//! scorer's acceptance tests.
//!
//! PIN-SCOPE:    HDOP from the U.S. Coast Guard YUMA almanac of 7 November 2026 equals the
//!               independent numpy oracle (xval/almanac-hdop/oracle.py, expected.json) to 1e-9 at
//!               the 20 stated points, with the same number of satellites above the mask; the flag
//!               is exact on the 12 hand-written reports of xval/almanac-hdop/flag_fixture.json; a
//!               mask no satellite clears scores nothing
//! PIN-EXCLUDES: whether flagging real reports means anything (scoring real data is its own
//!               pre-registered question); the NACp table is pinned by the module's unit test

use kshana::interference_map::almanac_hdop::{hdop_at, score, Almanac, Report, ScoreParams};
use serde_json::Value;

fn root() -> std::path::PathBuf {
    std::path::PathBuf::from(env!("CARGO_MANIFEST_DIR"))
}

fn read(rel: &str) -> String {
    std::fs::read_to_string(root().join(rel)).unwrap()
}

fn almanac() -> Almanac {
    Almanac::parse_yuma(&read("tests/fixtures/gps_almanac/yuma_2026_311.alm"), 2444).unwrap()
}

#[test]
fn hdop_equals_the_independent_oracle_at_20_points() {
    let alm = almanac();
    assert_eq!(alm.entries.len(), 32);
    let expected: Value = serde_json::from_str(&read("xval/almanac-hdop/expected.json")).unwrap();
    assert_eq!(expected["week"], alm.week);
    let results = expected["results"].as_array().unwrap();
    assert_eq!(results.len(), 20);
    let mut worst = 0.0f64;
    for (i, r) in results.iter().enumerate() {
        let g = hdop_at(
            &alm,
            r["lat_deg"].as_f64().unwrap(),
            r["lon_deg"].as_f64().unwrap(),
            r["h_m"].as_f64().unwrap(),
            r["gps_s"].as_f64().unwrap(),
            5.0,
        );
        assert_eq!(
            g.satellites as u64,
            r["satellites"].as_u64().unwrap(),
            "point {i}"
        );
        let want = r["hdop"].as_f64().unwrap();
        let got = g.hdop.unwrap();
        assert!((got - want).abs() <= 1e-9, "point {i}: {got} vs {want}");
        worst = worst.max((got - want).abs());
    }
    eprintln!("almanac HDOP: worst |engine - oracle| over 20 points {worst:.3e}");
}

#[test]
fn the_flag_is_exact_on_the_hand_written_reports() {
    let alm = almanac();
    let points: Value = serde_json::from_str(&read("xval/almanac-hdop/points.json")).unwrap();
    let fx: Value = serde_json::from_str(&read("xval/almanac-hdop/flag_fixture.json")).unwrap();
    let p: ScoreParams = serde_json::from_value(fx["params"].clone()).unwrap();
    let rows = fx["reports"].as_array().unwrap();
    assert_eq!(rows.len(), 12);
    let reports: Vec<Report> = rows
        .iter()
        .map(|r| {
            let pt = &points["points"][r["point"].as_u64().unwrap() as usize];
            Report {
                gps_s: pt["gps_s"].as_f64().unwrap(),
                lat_deg: pt["lat_deg"].as_f64().unwrap(),
                lon_deg: pt["lon_deg"].as_f64().unwrap(),
                h_m: pt["h_m"].as_f64().unwrap(),
                nacp: r["nacp"].as_u64().unwrap() as u8,
            }
        })
        .collect();
    let out = score(&alm, &reports, &p).unwrap();
    for (i, (o, r)) in out.iter().zip(rows).enumerate() {
        assert_eq!(
            o.flagged,
            r["flagged"].as_bool(),
            "report {i}: {}",
            r["why"]
        );
        if let (Some(e), Some(pr)) = (o.epu_m, o.predicted_95_m) {
            assert_eq!(o.ratio, Some(e / pr));
            assert_eq!(pr, 2.0 * o.hdop.unwrap() * p.uere_m);
        }
    }
    // A mask no satellite clears: no HDOP, nothing scored.
    let high = ScoreParams {
        mask_deg: 89.9,
        ..p
    };
    assert!(score(&alm, &reports, &high)
        .unwrap()
        .iter()
        .all(|o| o.flagged.is_none() && o.hdop.is_none()));
}
