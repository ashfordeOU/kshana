// SPDX-License-Identifier: AGPL-3.0-only
//! **External-oracle validation** for the position-domain figures of merit
//! (CEP / SEP / 2DRMS) produced by [`kshana::fom::positioning_performance`].
//!
//! ## Oracle (genuinely independent, non-circular)
//! The reference medians in `fixtures/positioning_fom/reference.json` come only
//! from SciPy / NumPy — kshana output appears nowhere in their derivation:
//!
//! * **Isotropic** cases carry the exact closed-form quantiles
//!   `scipy.stats.rayleigh.ppf(0.5, σ)` (horizontal CEP) and
//!   `scipy.stats.maxwell.ppf(0.5, σ)` (3-D SEP) — SciPy's Cephes special-function
//!   codebase, matched here to ≤2e-3 m.
//! * **Anisotropic** cases (including a correlated horizontal covariance and a
//!   fully general 3×3) carry an independent **NumPy Monte-Carlo** median of
//!   6 000 000 `multivariate_normal(cov)` draws — a completely different algorithm
//!   from kshana's exact CDF-quadrature + bisection, matched to ≤0.8 % relative.
//!
//! kshana computes CEP/SEP as the *exact* median radial error (the true quantile
//! of the elliptical/ellipsoidal Gaussian), not the `0.589·(σ₁+σ₂)` linear rule,
//! so it tracks the independent Monte-Carlo median even for eccentric ellipses
//! where the linear rule is ~2 % off. Regenerable offline via
//! `fixtures/positioning_fom/generate_positioning_fom_reference.py`.

use kshana::fom::positioning_performance;

const REFERENCE: &str = include_str!("fixtures/positioning_fom/reference.json");

fn cov_from(v: &serde_json::Value) -> [[f64; 3]; 3] {
    let rows = v.as_array().expect("cov array");
    let mut c = [[0.0; 3]; 3];
    for (i, row) in rows.iter().enumerate() {
        for (j, x) in row.as_array().expect("cov row").iter().enumerate() {
            c[i][j] = x.as_f64().expect("cov entry");
        }
    }
    c
}

#[test]
fn positioning_fom_matches_scipy_and_numpy_oracles() {
    let doc: serde_json::Value = serde_json::from_str(REFERENCE).expect("parse reference.json");
    let cases = doc["cases"].as_array().expect("cases array");
    assert!(cases.len() >= 5, "expected the full case set");

    for case in cases {
        let name = case["name"].as_str().unwrap_or("?");
        let cov = cov_from(&case["cov"]);
        let hpl = case["hpl_m"].as_f64().unwrap();
        let fom = positioning_performance(cov, hpl);

        // HPL is passed straight through from the integrity monitor.
        assert_eq!(fom.hpl_m, hpl, "{name}: HPL passthrough");

        // 2DRMS = 2√(σ_E²+σ_N²): closed form, tight.
        let drms2 = case["drms2_m"].as_f64().unwrap();
        assert!(
            (fom.drms2_m - drms2).abs() < 1e-9,
            "{name}: 2DRMS {} vs {drms2}",
            fom.drms2_m
        );

        // Independent NumPy Monte-Carlo median (all cases): ≤0.8 % relative.
        let cep_mc = case["cep_mc_m"].as_f64().unwrap();
        let sep_mc = case["sep_mc_m"].as_f64().unwrap();
        assert!(
            (fom.cep_m - cep_mc).abs() / cep_mc < 8e-3,
            "{name}: CEP {} vs NumPy MC median {cep_mc}",
            fom.cep_m
        );
        assert!(
            (fom.sep_m - sep_mc).abs() / sep_mc < 8e-3,
            "{name}: SEP {} vs NumPy MC median {sep_mc}",
            fom.sep_m
        );

        // Exact SciPy closed-form quantiles where available (isotropic): ≤2e-3 m.
        if let Some(cep_closed) = case["cep_closed_m"].as_f64() {
            let sep_closed = case["sep_closed_m"].as_f64().unwrap();
            assert!(
                (fom.cep_m - cep_closed).abs() < 2e-3,
                "{name}: CEP {} vs scipy rayleigh.ppf {cep_closed}",
                fom.cep_m
            );
            assert!(
                (fom.sep_m - sep_closed).abs() < 2e-3,
                "{name}: SEP {} vs scipy maxwell.ppf {sep_closed}",
                fom.sep_m
            );
        }
    }
}

/// Negative control: the exact CEP must be strictly tighter than the loose
/// `0.589·(σ₁+σ₂)` linear approximation for an eccentric (3:1) ellipse — a test
/// that would fail if `positioning_performance` silently used the linear rule.
#[test]
fn exact_cep_beats_the_linear_approximation_on_eccentric_ellipses() {
    let cov = [[9.0, 0.0, 0.0], [0.0, 1.0, 0.0], [0.0, 0.0, 4.0]];
    let fom = positioning_performance(cov, 0.0);
    let linear = 0.589 * (3.0 + 1.0); // 0.589·(σ₁+σ₂)
    assert!(
        fom.cep_m < linear - 0.02,
        "exact CEP {} should be well below the linear rule {linear}",
        fom.cep_m
    );
}
