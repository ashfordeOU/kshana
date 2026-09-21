//! InternalConsistency: the Rust R2 algebra reproduces the independent numpy
//! reference on identical inputs. NOT an accuracy oracle (see
//! tests/fixtures/hetero_budget/NOTICE.md).

use std::path::PathBuf;

use kshana::integrity::hetero_budget::{
    bias_cross_covariance, correlated_fused_bias, independent_fused_bias, integrity_bias_overbound,
    SourceBias, UtcRealizer,
};

#[test]
fn algebra_matches_numpy_reference() {
    let root = PathBuf::from(env!("CARGO_MANIFEST_DIR"));
    let raw = std::fs::read_to_string(root.join("tests/fixtures/hetero_budget/reference.json"))
        .expect("read reference.json");
    let v: serde_json::Value = serde_json::from_str(&raw).expect("parse reference.json");

    let tail = v["target_tail_ir"].as_f64().unwrap();
    let rho = v["rho_common"].as_f64().unwrap();
    let weights: Vec<f64> = v["weights"]
        .as_array()
        .unwrap()
        .iter()
        .map(|x| x.as_f64().unwrap())
        .collect();
    let ref_ob: Vec<f64> = v["overbounds"]
        .as_array()
        .unwrap()
        .iter()
        .map(|x| x.as_f64().unwrap())
        .collect();

    let biases: Vec<SourceBias> = v["sources"]
        .as_array()
        .unwrap()
        .iter()
        .map(|s| SourceBias {
            expanded_uncertainty_s: s["u"].as_f64().unwrap(),
            coverage_factor: s["k"].as_f64().unwrap(),
            ageing_inflation_s: s["age"].as_f64().unwrap(),
            realizer: UtcRealizer(s["realizer"].as_u64().unwrap() as u16),
        })
        .collect();

    // (a) Overbound formula cross-check against the independent Phi^-1
    // (stdlib NormalDist). The two Phi^-1 implementations differ, so use a
    // Phi^-1-realistic tolerance — this still catches any real formula error
    // (wrong factor, U vs U/k, missing ageing term, etc.).
    for (b, want) in biases.iter().zip(ref_ob.iter()) {
        let got = integrity_bias_overbound(b, tail);
        assert!(
            (got - want).abs() <= 1e-15 + 1e-6 * want.abs(),
            "overbound {got} vs independent {want} beyond Phi^-1 tolerance"
        );
    }

    // (b) Cross-covariance + fused-bias ALGEBRA, validated on the FIXTURE's
    // overbound values (shared inputs — isolates the pure arithmetic from the
    // Phi^-1 implementation difference; matches to ~1e-15).
    let sigma = bias_cross_covariance(&biases, &ref_ob, rho);
    let corr = correlated_fused_bias(&weights, &sigma);
    let indep = independent_fused_bias(&weights, &sigma);
    assert!(
        (corr - v["correlated_fused_bias"].as_f64().unwrap()).abs() < 1e-12,
        "corr fused"
    );
    assert!(
        (indep - v["independent_fused_bias"].as_f64().unwrap()).abs() < 1e-12,
        "indep fused"
    );
    assert!(
        corr > indep,
        "correlated fused bias must dominate (unsafe-allocation theorem)"
    );
}
