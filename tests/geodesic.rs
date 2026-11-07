// SPDX-License-Identifier: AGPL-3.0-only
//! The engine's geodesic distance against GeographicLib (`xval/geodesic/pairs.py`): 3,616 pairs,
//! random and short, antipodal and nearly antipodal, meridians, the equator and the poles, each
//! within 1e-8 m.
//!
//! PIN-SCOPE:    the WGS 84 inverse geodesic distance of src/geodesic.rs
//! PIN-EXCLUDES: azimuths, reduced length and area, which src/geodesic.rs does not compute

#[test]
fn distances_match_geographiclib() {
    let text = std::fs::read_to_string(
        std::path::Path::new(env!("CARGO_MANIFEST_DIR"))
            .join("tests/fixtures/geodesic/pairs_v1.json"),
    )
    .unwrap();
    let v: serde_json::Value = serde_json::from_str(&text).unwrap();
    let mut worst = (0.0f64, Vec::new());
    for p in v["pairs"].as_array().unwrap() {
        let p: Vec<f64> = p
            .as_array()
            .unwrap()
            .iter()
            .map(|x| x.as_f64().unwrap())
            .collect();
        let d = kshana::geodesic::distance_m(p[0], p[1], p[2], p[3]);
        let err = (d - p[4]).abs();
        if err > worst.0 {
            worst = (err, p.clone());
        }
    }
    assert!(worst.0 <= 1e-8, "worst {} m at {:?}", worst.0, worst.1);
}
