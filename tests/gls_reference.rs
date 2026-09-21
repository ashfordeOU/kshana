//! InternalConsistency: the hand-rolled Rust GLS whitening + common-mode
//! statistic reproduce numpy's Cholesky-solve reference. NOT an accuracy oracle
//! (see tests/fixtures/gls/NOTICE.md).

use std::path::PathBuf;

use kshana::integrity::gls_commonmode::{common_mode_consistency, mahalanobis_sq};

fn load_matrix(v: &serde_json::Value) -> Vec<Vec<f64>> {
    v.as_array()
        .unwrap()
        .iter()
        .map(|row| {
            row.as_array()
                .unwrap()
                .iter()
                .map(|x| x.as_f64().unwrap())
                .collect()
        })
        .collect()
}

#[test]
fn gls_matches_numpy_reference() {
    let root = PathBuf::from(env!("CARGO_MANIFEST_DIR"));
    let raw = std::fs::read_to_string(root.join("tests/fixtures/gls/reference.json"))
        .expect("read reference.json");
    let v: serde_json::Value = serde_json::from_str(&raw).expect("parse reference.json");

    let omega = load_matrix(&v["omega"]);
    let r: Vec<f64> = v["residual"]
        .as_array()
        .unwrap()
        .iter()
        .map(|x| x.as_f64().unwrap())
        .collect();

    let maha = mahalanobis_sq(&omega, &r).unwrap();
    assert!(
        (maha - v["mahalanobis_sq"].as_f64().unwrap()).abs() < 1e-10,
        "Mahalanobis square vs numpy solve"
    );

    let cm = common_mode_consistency(&omega, &r).unwrap();
    assert_eq!(cm.dof, 1);
    assert!(
        (cm.value - v["common_mode_statistic"].as_f64().unwrap()).abs() < 1e-10,
        "common-mode statistic vs numpy"
    );
}
