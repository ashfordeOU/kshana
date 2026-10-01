// SPDX-License-Identifier: AGPL-3.0-only
//! Reference comparison for the lunar datum null-space classification (origin-X / scale pair)
//! against Sosnica et al. 2025, arXiv:2510.15484.
//!
//! ## Pre-registration (tolerances fixed 2026-09-30 in the validation plan; operational
//! details fixed 2026-10-01T03:28Z in the batch pre-registration, before this ran)
//!
//! * Oracle (Reference): the paper's printed correlation r(T_X, scale) = -0.97 (Sect. 6, beside
//!   Fig. 10) and the Table 7 1-sigma errors of the ILRF-vs-DE430 transformation
//!   (sigma(T_X) = 0.0307 m). Values and provenance:
//!   `tests/fixtures/lunar_datum_sosnica_oracle/` (`reference.txt`, `NOTICE.md`).
//! * Comparison A, the paper's geometry: Kshana's 7-parameter point Jacobian
//!   (`lunar_datum::datum7_point_jacobian_body`) on the paper's Table 6 PA coordinates of the
//!   five legacy reflectors, equal weights (the paper gives per-reflector errors only as "a few
//!   mm"), decomposed by Kshana's `lunar_identifiability::decompose`; the t_x / scale correlation.
//! * Comparison B, the row's own computation: `llr_identifiability(0.003 m, 2024-01-01, 29.5 d,
//!   6 h)` and `lunar_llr_geometry::llr_datum_observability(same)`; the t_x / scale correlation and
//!   the origin CRLB.
//! * Tolerances: every correlation within **0.05** of -0.97; the origin CRLB of B within **20 %**
//!   of 0.0307 m. A has no CRLB (it would need per-reflector sigmas the paper does not print).
//! * PROMOTE only if every comparison holds.
//!
//! ## Result (recorded 2026-10-01, not tuned): DISAGREES, the row stays MODELLED
//!
//! * A, the paper's geometry: correlation -0.781, 0.19 from -0.97 (fails 0.05). With equal
//!   weights the five-point Helmert design is far less degenerate than the paper reports; the
//!   paper's -0.97 rests on its per-reflector formal errors and its estimation, neither of which is
//!   printed, so the published correlation is not reproducible from the printed geometry alone.
//! * B, the row's range-Fisher: correlation -0.9934 (`llr_identifiability`) and -0.9883
//!   (`llr_datum_observability`), within 0.05 of -0.97 (passes).
//! * B, origin CRLB: 1.16e-3 m and 5.85e-4 m against 0.0307 m, 96 % and 98 % low (fails 20 %).
//!   The row holds reflector coordinates and orientation fixed and assumes 3 mm range noise; the
//!   paper's errors come from a combination of three ephemerides.
//!
//! The assertions pin that finding, so a change to the geometry or the estimator that moves any
//! of these numbers fails here and sends the record back for re-examination.

use kshana::lunar_datum::datum7_point_jacobian_body;
use kshana::lunar_identifiability::{decompose, llr_identifiability};
use kshana::lunar_llr_geometry::llr_datum_observability;

const REF: &str = include_str!("fixtures/lunar_datum_sosnica_oracle/reference.txt");

const CORR_TOL: f64 = 0.05;
const CRLB_REL_TOL: f64 = 0.20;

/// The scale and rotation columns are divided by this before decomposition, as
/// `lunar_identifiability` preconditions its own matrices (the t_x/scale correlation is
/// invariant under positive column scaling).
const PRECOND_M: f64 = 1_737_400.0;

fn field(kind: &str, key: &str) -> Vec<String> {
    for line in REF.lines() {
        if line.starts_with('#') || line.trim().is_empty() {
            continue;
        }
        let f: Vec<String> = line.split('|').map(|s| s.trim().to_string()).collect();
        if f[0] == kind && f[1] == key {
            return f[2..].to_vec();
        }
    }
    panic!("{kind} {key} not in reference.txt");
}

fn reflectors() -> Vec<(String, [f64; 3])> {
    REF.lines()
        .filter(|l| l.starts_with("REFL"))
        .map(|l| {
            let f: Vec<&str> = l.split('|').map(str::trim).collect();
            let p = |i: usize| f[i].parse::<f64>().expect("coordinate");
            (f[1].to_string(), [p(2), p(3), p(4)])
        })
        .collect()
}

/// Comparison A: the 7x7 normal matrix of the point-wise Helmert design on the paper's geometry.
fn paper_geometry_corr() -> f64 {
    let refl = reflectors();
    assert_eq!(refl.len(), 5, "five legacy reflectors");
    let mut info = vec![vec![0.0; 7]; 7];
    for (_, p) in &refl {
        let j = datum7_point_jacobian_body(*p);
        for row in &j {
            let mut r = *row;
            for v in r.iter_mut().skip(3) {
                *v /= PRECOND_M;
            }
            for a in 0..7 {
                for b in 0..7 {
                    info[a][b] += r[a] * r[b];
                }
            }
        }
    }
    let d = decompose(&info, 1e-12);
    assert_eq!(d.defect, 0, "15 equations, 7 parameters: full rank");
    d.origin_scale_corr
}

#[test]
fn origin_scale_correlation_and_crlb_disagree_with_the_published_geometry() {
    let r_pub: f64 = field("CORR", "r_tx_scale")[0].parse().unwrap();
    let sigma_tx_pub: f64 = field("SIGMA", "tx_m")[0].parse().unwrap();
    assert_eq!(r_pub, -0.97);
    assert_eq!(sigma_tx_pub, 0.0307);

    // A: the paper's geometry.
    let corr_a = paper_geometry_corr();

    // B: the row's own range-Fisher computation.
    let t0_jc = (2_460_310.5 - 2_451_545.0) / 36_525.0;
    let ident = llr_identifiability(0.003, t0_jc, 29.5, 6.0);
    let obs = llr_datum_observability(0.003, t0_jc, 29.5, 6.0);

    let gap_a = (corr_a - r_pub).abs();
    let gap_b1 = (ident.origin_scale_corr - r_pub).abs();
    let gap_b2 = (obs.corr_tx_scale - r_pub).abs();
    let crlb_rel_b1 = (ident.origin_crlb_m - sigma_tx_pub).abs() / sigma_tx_pub;
    let crlb_rel_b2 = (obs.origin_crlb_m - sigma_tx_pub).abs() / sigma_tx_pub;

    eprintln!(
        "M088 A (paper geometry, 7-param point Helmert): corr = {corr_a:.4} (|d| = {gap_a:.4})"
    );
    eprintln!(
        "M088 B1 llr_identifiability: n_obs = {}, defect = {}, corr = {:.4} (|d| = {gap_b1:.4}), \
         origin CRLB = {:.3e} m (rel gap {crlb_rel_b1:.3})",
        ident.n_obs, ident.defect, ident.origin_scale_corr, ident.origin_crlb_m
    );
    eprintln!(
        "M088 B2 llr_datum_observability: n_obs = {}, defect = {}, corr = {:.4} (|d| = {gap_b2:.4}), \
         origin CRLB = {:.3e} m (rel gap {crlb_rel_b2:.3})",
        obs.n_obs, obs.defect, obs.corr_tx_scale, obs.origin_crlb_m
    );

    let pass = gap_a <= CORR_TOL
        && gap_b1 <= CORR_TOL
        && gap_b2 <= CORR_TOL
        && crlb_rel_b1 <= CRLB_REL_TOL
        && crlb_rel_b2 <= CRLB_REL_TOL;
    eprintln!(
        "M088 verdict: {}",
        if pass { "AGREES" } else { "DISAGREES" }
    );

    // The pre-registered verdict: not every comparison holds.
    assert!(
        !pass,
        "every comparison now holds: re-examine M088 for promotion"
    );
    // The recorded finding, component by component.
    assert!(
        gap_a > CORR_TOL,
        "A now agrees ({corr_a:.4}): record is stale"
    );
    assert!(
        (corr_a - -0.781).abs() < 0.005,
        "A was -0.781, now {corr_a:.4}"
    );
    assert!(
        gap_b1 <= CORR_TOL && gap_b2 <= CORR_TOL,
        "B correlations agreed"
    );
    assert!(
        (ident.origin_scale_corr - -0.9934).abs() < 0.002
            && (obs.corr_tx_scale - -0.9883).abs() < 0.002,
        "B correlations moved from -0.9934 / -0.9883"
    );
    assert!(
        crlb_rel_b1 > CRLB_REL_TOL && crlb_rel_b2 > CRLB_REL_TOL,
        "B CRLB now within 20 %: record is stale"
    );
    assert!(
        ident.origin_crlb_m < 2.0e-3 && obs.origin_crlb_m < 1.0e-3,
        "B CRLBs were 1.16e-3 m and 5.85e-4 m"
    );
}
