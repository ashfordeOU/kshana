//! InternalConsistency check: the Rust TIB scorer reproduces the independent
//! numpy region counts on identical inputs. NOT an accuracy oracle — the
//! benchmark is honesty-immune (see tests/fixtures/tib/NOTICE.md).

use std::path::PathBuf;

use kshana::benchmark::coverage::{score, Sample};

#[test]
fn scorer_matches_numpy_reference_counts() {
    let root = PathBuf::from(env!("CARGO_MANIFEST_DIR"));
    let raw = std::fs::read_to_string(root.join("tests/fixtures/tib/reference.json"))
        .expect("read reference.json");
    let v: serde_json::Value = serde_json::from_str(&raw).expect("parse reference.json");

    let al = v["al"].as_f64().unwrap();
    let stated_ir = v["stated_ir"].as_f64().unwrap();
    let true_errors: Vec<f64> = v["true_errors"]
        .as_array()
        .unwrap()
        .iter()
        .map(|x| x.as_f64().unwrap())
        .collect();
    let pls: Vec<f64> = v["pls"]
        .as_array()
        .unwrap()
        .iter()
        .map(|x| x.as_f64().unwrap())
        .collect();
    assert_eq!(true_errors.len(), pls.len());

    let samples: Vec<Sample> = true_errors
        .iter()
        .zip(pls.iter())
        .map(|(&true_error, &pl)| Sample { true_error, pl })
        .collect();
    let s = score(&samples, al, stated_ir);

    assert_eq!(s.n as u64, v["n"].as_u64().unwrap());
    assert_eq!(s.n_nominal as u64, v["n_nominal"].as_u64().unwrap());
    assert_eq!(s.n_unavailable as u64, v["n_unavailable"].as_u64().unwrap());
    assert_eq!(s.n_mi as u64, v["n_mi"].as_u64().unwrap());
    assert_eq!(s.n_hmi as u64, v["n_hmi"].as_u64().unwrap());
    assert!((s.hmi_rate - v["hmi_rate"].as_f64().unwrap()).abs() < 1e-12);
    assert!((s.mi_rate - v["mi_rate"].as_f64().unwrap()).abs() < 1e-12);
    assert!((s.availability - v["availability"].as_f64().unwrap()).abs() < 1e-12);
    assert_eq!(s.coverage_ok, v["coverage_ok"].as_bool().unwrap());
}
