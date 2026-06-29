// SPDX-License-Identifier: AGPL-3.0-only
//! Engine-checked anchors for the datum null-space classification theorem
//! (see the `kshana::lunar_identifiability` module doc). These verify the
//! theorem's two robust consequences: rank-additivity (deterministic) and the
//! monotone libration lift (operator-monotone Schur complement). Magnitudes are
//! Modelled; the STRUCTURE reproduces Sośnica et al. 2025 (arXiv:2510.15484).

use kshana::fim::{crlb, information_matrix};
use kshana::lunar_datum::llr_row_datum7;
use kshana::lunar_identifiability::llr_identifiability;
use kshana::lunar_llr::{reflectors, stations};

#[test]
fn single_internal_range_row_has_six_dim_datum_null_space() {
    // Theorem (1): one range observation = one Jacobian row => rank(I)=1 => defect=6.
    let t0_jc = (2_460_310.5 - 2_451_545.0) / 36_525.0;
    let st = stations()[1];
    let refl = reflectors()[2].pa_body_m;
    let jd_ut1 = t0_jc * 36_525.0 + 2_451_545.0;
    let row = llr_row_datum7(&st, refl, t0_jc, jd_ut1);
    let info = information_matrix(&[row.to_vec()], &[1.0]);
    let c = crlb(&info, 1e-9);
    assert_eq!(
        c.rank, 1,
        "one internal-range row must give rank 1; got {}",
        c.rank
    );
    assert_eq!(
        c.defect, 6,
        "=> 6-dimensional datum null space; got {}",
        c.defect
    );
}

#[test]
fn extending_the_librating_arc_lifts_the_origin_scale_degeneracy() {
    // Theorem (3): a longer real-DE440-libration arc is strictly less degenerate.
    let t0_jc = (2_460_310.5 - 2_451_545.0) / 36_525.0;
    let short = llr_identifiability(0.003, t0_jc, 2.0, 6.0); // 2-day arc
    let full = llr_identifiability(0.003, t0_jc, 29.5, 6.0); // full synodic month
    assert!(
        short.n_obs > 0 && full.n_obs > short.n_obs,
        "arcs must populate and full must have more obs: {} vs {}",
        short.n_obs,
        full.n_obs
    );
    assert!(
        full.degeneracy_metric > short.degeneracy_metric,
        "libration arc must raise the degeneracy metric: {} -> {}",
        short.degeneracy_metric,
        full.degeneracy_metric
    );
    assert!(
        full.origin_crlb_m < short.origin_crlb_m,
        "and shrink the origin CRLB: {} -> {}",
        short.origin_crlb_m,
        full.origin_crlb_m
    );
    assert_eq!(full.defect, 0, "full-month real geometry is full-rank");
    assert!(
        full.origin_scale_corr.abs() > 0.9 && full.origin_scale_corr.abs() < 0.9999,
        "pair stays near-degenerate (structural); got {}",
        full.origin_scale_corr
    );
}
