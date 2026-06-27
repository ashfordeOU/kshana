// SPDX-License-Identifier: AGPL-3.0-only
//! Externally validate kshana's quantum-PNT fault/anomaly-detection kernels
//! (`src/quantum_faults.rs`) against **independent third-party authorities**:
//! SciPy 1.17.0 (Virtanen et al., Nature Methods 2020 -- the reference for the
//! Gaussian CDF Phi and its inverse, via Cephes ndtr/ndtri) and scikit-learn
//! 1.8.0 (Pedregosa et al., JMLR 2011 -- the de-facto reference for ROC AUC).
//!
//! Three uniquely-defined detection-theory quantities are checked on identical
//! inputs (an independent authority computing a uniquely-defined quantity is a
//! genuine cross-check, the same kind DOP gets vs gnss_lib_py and the eval
//! metrics get vs scikit-learn):
//!
//!   (1) `quantum_faults::analytic_auc(mu,sigma)` = Phi(mu/(sigma*sqrt2)), the
//!       binormal ROC AUC for nominal N(0,sigma) vs fault N(mu,sigma),
//!       vs `scipy.stats.norm.cdf`.  d' = mu/sigma over [0,6].
//!   (2) `quantum_faults::min_detectable_fault(sigma,pfa,pd)` =
//!       sigma*(Phi^-1(1-pfa)+Phi^-1(pd)) vs `sigma*scipy.stats.norm.ppf(...)`.
//!       pfa 1e-1..1e-6, pd in {0.5,0.9,0.99,0.999}, sigma in {0.3,1.0,2.5}.
//!   (3) The empirical ROC AUC point that the `quantum_faults` bootstrap
//!       resamples (`impairment_eval::auc`, Mann-Whitney with ties 1/2),
//!       on fixed scipy-seeded score arrays, vs `sklearn.metrics.roc_auc_score`.
//!
//! HONEST SCOPE / TOLERANCES (measured, not loosened):
//!   * analytic_auc runs through kshana's in-crate Abramowitz & Stegun erf
//!     (Phi, documented max abs err ~1.5e-7); the measured worst |kshana-scipy|
//!     over d'[0,6] is ~7.0e-8, so this asserts 2e-7 ABS. <1e-9 is NOT
//!     achievable for this kernel and we do not pretend it is.
//!   * min_detectable_fault runs through kshana's Acklam probit (Phi^-1, rel err
//!     ~1.15e-9); the measured worst |kshana-scipy| on the fault value is
//!     ~1.3e-8 (deep tail pfa=1e-6, sigma=2.5), so this asserts 5e-8 ABS with a
//!     5e-9 RELATIVE component.
//!   * The AUC POINT vs sklearn is the *same arithmetic* on identical arrays, so
//!     it matches to <1e-12; asserted at 1e-9.
//!   * This validates the detection-theory MATHS only. It does NOT validate the
//!     device-performance parameters (clock/sensor sigma, fault-catalog
//!     magnitudes) -- those quantify a partner's hardware and stay MODELLED --
//!     nor the seeded ChaCha bootstrap-CI machinery (only the AUC point it
//!     resamples).
//!
//! Reference data, provenance and the committed generator live in
//! `tests/fixtures/quantum_faults/`.

use kshana::impairment_eval::auc;
use kshana::quantum_faults::{analytic_auc, min_detectable_fault};

const REF: &str = include_str!("fixtures/quantum_faults/qfaults_reference.txt");

/// Worst tolerance for the binormal AUC (kshana A&S erf vs scipy.cdf). The
/// measured worst case over d'[0,6] is ~7e-8; this bound is the documented A&S
/// accuracy floor, not a forced pass.
const AUC_ABS_TOL: f64 = 2.0e-7;
/// min-detectable-fault: absolute floor (small faults) + relative term (large
/// faults / deep tails). Measured worst |kshana-scipy| ~1.3e-8.
const MDF_ABS_TOL: f64 = 5.0e-8;
const MDF_REL_TOL: f64 = 5.0e-9;
/// AUC point vs sklearn: same arithmetic on identical data -> machine precision.
const AUCPT_ABS_TOL: f64 = 1.0e-9;

#[test]
fn analytic_auc_matches_scipy_norm_cdf() {
    let mut n = 0usize;
    let mut worst = 0.0_f64;
    for line in REF.lines() {
        if !line.starts_with("AUC ") {
            continue;
        }
        // AUC mu sigma dprime auc_scipy
        let f: Vec<&str> = line.split_whitespace().collect();
        assert_eq!(f.len(), 5, "AUC row: AUC mu sigma dprime auc_scipy: {line}");
        let mu: f64 = f[1].parse().unwrap();
        let sigma: f64 = f[2].parse().unwrap();
        let dprime: f64 = f[3].parse().unwrap();
        let want: f64 = f[4].parse().unwrap();
        assert!(
            (0.0..=6.0).contains(&dprime),
            "AUC validation scoped to d' in [0,6], got {dprime}"
        );

        let got = analytic_auc(mu, sigma);
        let d = (got - want).abs();
        worst = worst.max(d);
        assert!(
            d <= AUC_ABS_TOL,
            "AUC d'={dprime} (mu={mu}, sigma={sigma}): kshana {got:.12} vs scipy {want:.12} (|d|={d:.3e})"
        );
        n += 1;
    }
    assert!(n >= 12, "expected >= 12 AUC cases, got {n}");
    eprintln!("analytic_auc vs scipy.norm.cdf: {n} cases, worst |d| = {worst:.3e}");
    // The A&S erf is real (not machine precision); the worst case must live in
    // the documented band, not accidentally pass at 1e-15.
    assert!(worst <= AUC_ABS_TOL, "worst AUC abs error {worst:.3e}");
    assert!(
        worst > 1.0e-12,
        "AUC error {worst:.3e} suspiciously tight -- kernel may not be exercised"
    );
}

#[test]
fn min_detectable_fault_matches_scipy_norm_ppf() {
    let mut n = 0usize;
    let mut worst = 0.0_f64;
    let mut deepest = 0usize;
    for line in REF.lines() {
        if !line.starts_with("MDF ") {
            continue;
        }
        // MDF sigma pfa pd zsum_scipy mdf_scipy
        let f: Vec<&str> = line.split_whitespace().collect();
        assert_eq!(f.len(), 6, "MDF row: MDF sigma pfa pd zsum mdf: {line}");
        let sigma: f64 = f[1].parse().unwrap();
        let pfa: f64 = f[2].parse().unwrap();
        let pd: f64 = f[3].parse().unwrap();
        let want: f64 = f[5].parse().unwrap();
        assert!(
            (1.0e-6..=1.0e-1).contains(&pfa),
            "MDF validation scoped to pfa in [1e-6,1e-1], got {pfa}"
        );
        if pfa <= 1.0e-6 {
            deepest += 1;
        }

        let got = min_detectable_fault(sigma, pfa, pd);
        let d = (got - want).abs();
        worst = worst.max(d);
        let tol = MDF_ABS_TOL + MDF_REL_TOL * want.abs();
        assert!(
            d <= tol,
            "MDF sigma={sigma} pfa={pfa} pd={pd}: kshana {got:.12} vs scipy {want:.12} (|d|={d:.3e}, tol={tol:.3e})"
        );
        n += 1;
    }
    assert!(n >= 12, "expected >= 12 MDF cases, got {n}");
    assert!(deepest >= 1, "fixture must reach the deepest tail pfa=1e-6");
    eprintln!("min_detectable_fault vs scipy.norm.ppf: {n} cases, worst |d| = {worst:.3e}");
    assert!(
        worst > 1.0e-12,
        "MDF error {worst:.3e} suspiciously tight -- probit may not be exercised in the tail"
    );
}

#[test]
fn empirical_auc_point_matches_sklearn_roc_auc_score() {
    // Map AUCPT name -> sklearn AUC, and L/S name -> labels/scores.
    let mut want_auc: Vec<(String, f64)> = Vec::new();
    let mut labels: Vec<(String, Vec<bool>)> = Vec::new();
    let mut scores: Vec<(String, Vec<f64>)> = Vec::new();
    for line in REF.lines() {
        if let Some(rest) = line.strip_prefix("AUCPT ") {
            let (name, a) = rest.split_once(' ').expect("AUCPT name auc");
            want_auc.push((name.to_string(), a.trim().parse().unwrap()));
        } else if let Some(rest) = line.strip_prefix("L ") {
            let (name, body) = rest.split_once('|').expect("L name | labels");
            let v = body
                .trim()
                .split(',')
                .map(|s| s.trim() == "1")
                .collect::<Vec<_>>();
            labels.push((name.trim().to_string(), v));
        } else if let Some(rest) = line.strip_prefix("S ") {
            let (name, body) = rest.split_once('|').expect("S name | scores");
            let v = body
                .trim()
                .split(',')
                .map(|s| s.trim().parse::<f64>().unwrap())
                .collect::<Vec<_>>();
            scores.push((name.trim().to_string(), v));
        }
    }
    assert!(want_auc.len() >= 5, "expected >= 5 AUC-point cases, got {}", want_auc.len());

    let mut worst = 0.0_f64;
    for (name, sklearn_auc) in &want_auc {
        let labs = &labels.iter().find(|(n, _)| n == name).expect("labels").1;
        let scs = &scores.iter().find(|(n, _)| n == name).expect("scores").1;
        assert_eq!(labs.len(), scs.len(), "{name}: L/S length mismatch");

        // Split into pos/neg exactly as the quantum_faults bootstrap does, then
        // call the same Mann-Whitney estimator it resamples.
        let pos: Vec<f64> = labs
            .iter()
            .zip(scs.iter())
            .filter_map(|(&l, &s)| if l { Some(s) } else { None })
            .collect();
        let neg: Vec<f64> = labs
            .iter()
            .zip(scs.iter())
            .filter_map(|(&l, &s)| if l { None } else { Some(s) })
            .collect();
        let got = auc(&pos, &neg);
        let d = (got - sklearn_auc).abs();
        worst = worst.max(d);
        assert!(
            d <= AUCPT_ABS_TOL,
            "{name}: kshana auc {got:.15} vs sklearn {sklearn_auc:.15} (|d|={d:.3e})"
        );
    }
    eprintln!("empirical AUC point vs sklearn.roc_auc_score: {} cases, worst |d| = {worst:.3e}", want_auc.len());

    // The fixture must exercise both tails of discrimination so the oracle isn't
    // all mid-range: a perfect detector and a worse-than-chance one.
    assert!(
        want_auc.iter().any(|(_, a)| (*a - 1.0).abs() < AUCPT_ABS_TOL),
        "need an AUC=1 case"
    );
    assert!(
        want_auc.iter().any(|(_, a)| *a < 0.5),
        "need a sub-chance AUC case"
    );
}
