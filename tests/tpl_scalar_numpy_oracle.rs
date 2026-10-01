// SPDX-License-Identifier: AGPL-3.0-only
//! P2 oracle: the scalar MHSS timing protection level (`H = 1_N`) against numpy and scipy.
//!
//! **Oracle (P2, an independent numerical library).** numpy 2.3.5 and scipy 1.18.1
//! (BSD-3-Clause) recompute, in `tests/fixtures/tpl_scalar_numpy_oracle/gen_reference.py`,
//! every quantity [`kshana::integrity::tpl_scalar::scalar_tpl`] builds its protection level
//! from, by their own algorithms: each estimator is a weighted least-squares solve by
//! `numpy.linalg.lstsq` on the whitened system (not the module's inverse-variance closed
//! form); each separation standard deviation is the general `sqrt(Delta Sigma Delta^T)` with
//! `Delta = S_sub - S_ff` (not the module's nested-estimator identity); the multiplier comes
//! from `scipy.stats.norm.isf`, the risk from `scipy.stats.norm.sf`, and the protection level
//! from `scipy.optimize.brentq`. The multipliers, priors and bias overbounds are inputs; the
//! validated claim is the linear algebra and the protection level built from it.
//!
//! **Inputs.** 300 committed cases from seed 20260930: N in 1..8, sigma log-uniform in
//! [0.5 ns, 100 ns], bias uniform in [0, 20 ns], prior fault probability log-uniform in
//! [1e-6, 1e-3], integrity budget log-uniform in [1e-7, 1e-4], false-alert budget
//! log-uniform in [1e-6, 1e-2].
//!
//! **Tolerance, fixed before the first comparison:** protection-level relative error
//! at most 1e-9 on every case; the driving exclusion subset identical on every case
//! (none for N = 1).

use kshana::integrity::tpl_scalar::{scalar_tpl, TimeSource};

const REFERENCE_JSON: &str = include_str!("fixtures/tpl_scalar_numpy_oracle/reference.json");

/// Protection-level relative tolerance, fixed before the first comparison.
const PL_REL_TOL: f64 = 1e-9;

fn f64s(v: &serde_json::Value) -> Vec<f64> {
    v.as_array()
        .expect("array")
        .iter()
        .map(|x| x.as_f64().expect("number"))
        .collect()
}

#[test]
fn scalar_mhss_pl_matches_numpy() {
    let reference: serde_json::Value =
        serde_json::from_str(REFERENCE_JSON).expect("parse reference.json");
    let cases = reference["cases"].as_array().expect("cases");
    assert_eq!(cases.len(), 300, "the committed fixture carries 300 cases");

    let mut worst_rel = 0.0_f64;
    let mut failures = Vec::new();
    for (idx, case) in cases.iter().enumerate() {
        let sigma = f64s(&case["sigma_s"]);
        let bias = f64s(&case["bias_s"]);
        let p_fault = f64s(&case["p_fault"]);
        let sources: Vec<TimeSource> = sigma
            .iter()
            .zip(&bias)
            .zip(&p_fault)
            .map(|((&sigma_s, &bias_s), &p_fault)| TimeSource {
                sigma_s,
                bias_s,
                p_fault,
            })
            .collect();
        let ir_budget = case["ir_budget"].as_f64().expect("ir_budget");
        let p_fa = case["p_fa"].as_f64().expect("p_fa");
        let got = scalar_tpl(&sources, ir_budget, p_fa).expect("non-empty source set");

        let want_pl = case["pl_s"].as_f64().expect("pl_s");
        let rel = (got.pl_s - want_pl).abs() / want_pl.abs();
        worst_rel = worst_rel.max(rel);
        if rel > PL_REL_TOL {
            failures.push(format!(
                "case {idx} (N={}): PL {:.17e} vs numpy {:.17e}, relative {:.3e}",
                sources.len(),
                got.pl_s,
                want_pl,
                rel
            ));
        }

        let want_driving = case["driving_subset"].as_u64().map(|j| j as usize);
        if sources.len() >= 2 {
            if got.driving_subset != want_driving {
                failures.push(format!(
                    "case {idx} (N={}): driving subset {:?} vs numpy {:?}",
                    sources.len(),
                    got.driving_subset,
                    want_driving
                ));
            }
        } else {
            assert!(want_driving.is_none(), "numpy names no subset for N = 1");
        }
    }
    eprintln!(
        "scalar MHSS PL vs numpy/scipy: {} cases, worst relative PL error {worst_rel:.3e} (tolerance {PL_REL_TOL:e})",
        cases.len()
    );
    assert!(
        failures.is_empty(),
        "{} disagreement(s):\n{}",
        failures.len(),
        failures.join("\n")
    );
}
