// SPDX-License-Identifier: AGPL-3.0-only
//! The comparison pre-registered in xval/greenhall-edf/PREREGISTRATION.md: kshana's
//! `allan::edf_greenhall` against allantools 2024.6 `ci.edf_greenhall` over the fixed grid,
//! from `tests/fixtures/greenhall_edf/reference.json` (written by
//! `scripts/gen_greenhall_edf_ref.py`).
//!
//! Bar 1: wherever allantools returns a finite edf, kshana's is finite and within a relative
//! 1e-9. Bar 2: where allantools raises NotImplementedError, kshana returns NaN. Bar 3: every
//! case label occurs. Bar 4: the ADEV, MDEV and HDEV wrappers equal the core bit for bit.
//! Recorded beside the bars: allantools fails (an AssertionError in its Table 2 lookup) at
//! the alpha = -4, d = 3, unmodified, large-J points, which therefore have no oracle value.
use kshana::allan::{edf_greenhall, edf_greenhall_adev, edf_greenhall_hdev, edf_greenhall_mdev};
use serde_json::Value;

fn points() -> Vec<Value> {
    let path = concat!(
        env!("CARGO_MANIFEST_DIR"),
        "/tests/fixtures/greenhall_edf/reference.json"
    );
    let v: Value = serde_json::from_str(&std::fs::read_to_string(path).unwrap()).unwrap();
    v["points"].as_array().unwrap().clone()
}

fn args(p: &Value) -> (i32, i32, usize, usize, bool, bool) {
    (
        p["alpha"].as_i64().unwrap() as i32,
        p["d"].as_i64().unwrap() as i32,
        p["m"].as_u64().unwrap() as usize,
        p["n"].as_u64().unwrap() as usize,
        p["overlapping"].as_bool().unwrap(),
        p["modified"].as_bool().unwrap(),
    )
}

#[test]
fn bars_1_to_3_against_allantools() {
    let pts = points();
    let (mut compared, mut worst, mut not_impl, mut oracle_errors) = (0, 0.0_f64, 0, 0);
    let mut labels = std::collections::BTreeSet::new();
    for p in &pts {
        let (alpha, d, m, n, ov, md) = args(p);
        let got = edf_greenhall(alpha, d, m, n, ov, md);
        let case = p["case"].as_str().unwrap_or("");
        labels.insert(case.to_string());
        match p["edf"].as_f64() {
            Some(want) if want.is_finite() => {
                assert!(got.is_finite(), "{p}: kshana {got}");
                let rel = ((got - want) / want).abs();
                worst = worst.max(rel);
                assert!(
                    rel <= 1e-9,
                    "{p}: kshana {got} vs allantools {want} ({rel:e})"
                );
                compared += 1;
            }
            _ if case == "not_implemented" => {
                assert!(
                    got.is_nan(),
                    "{p}: kshana {got} where allantools has no formula"
                );
                not_impl += 1;
            }
            _ => {
                assert!(case.starts_with("oracle_error"), "{p}");
                assert_eq!((alpha, d, md), (-4, 3, false), "{p}");
                oracle_errors += 1;
            }
        }
    }
    eprintln!(
        "{compared} compared (worst relative {worst:.3e}), {not_impl} not implemented, \
         {oracle_errors} without an oracle value"
    );
    for want in [
        "1.1",
        "1.2",
        "1.3",
        "2.1a",
        "2.1b",
        "2.2",
        "2.3",
        "3.1",
        "3.2",
        "3.3",
        "4.2",
        "not_implemented",
    ] {
        assert!(
            labels.contains(want),
            "case {want} does not occur in the grid"
        );
    }
    assert_eq!((compared, not_impl, oracle_errors), (4876, 46, 32));
}

#[test]
fn bar_4_wrappers_equal_the_core() {
    for p in points() {
        let (alpha, _, m, n, ov, _) = args(&p);
        let same = |a: f64, b: f64| a.to_bits() == b.to_bits();
        assert!(same(
            edf_greenhall_adev(alpha, m, n, ov),
            edf_greenhall(alpha, 2, m, n, ov, false)
        ));
        assert!(same(
            edf_greenhall_mdev(alpha, m, n, ov),
            edf_greenhall(alpha, 2, m, n, ov, true)
        ));
        assert!(same(
            edf_greenhall_hdev(alpha, m, n, ov),
            edf_greenhall(alpha, 3, m, n, ov, false)
        ));
    }
}
