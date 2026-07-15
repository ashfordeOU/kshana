// SPDX-License-Identifier: AGPL-3.0-only
//! Externally validate kshana's real-time frame-prediction covariance propagation
//! ([`kshana::lunar_frame_predict`], paper P3, gap G1) against an **independent third-party
//! authority**: NumPy general matrix multiply (BSD-3-Clause).
//!
//! kshana::lunar_frame_predict::propagate_covariance evaluates the covariance prediction
//! `P' = Φ P Φᵀ` (for the constant-velocity transition `Φ = [[1, Δt], [0, 1]]`) NOT as a
//! matrix product but through the hand-expanded closed-form scalar expressions
//! `P'₀₀ = σ_r² + 2Δt·ρσ_rσ_v + Δt²σ_v²`, `P'₀₁ = ρσ_rσ_v + Δt·σ_v²`, `P'₁₁ = σ_v²`. This
//! test recomputes `P'` on the SAME fixed inputs with a COMPLETELY DIFFERENT machine — the
//! full 2×2 matrices `Φ` and `P` assembled and multiplied entry-by-entry via NumPy's general
//! `@` operator. The two codepaths are algebraically equal but numerically independent, so
//! agreement pins kshana's scalar propagation to an external general-linear-algebra authority,
//! not to kshana's own expansion.
//!
//! It also validates the one-way light-time map `t_ns = r / c · 1e9` end-to-end through
//! [`kshana::lunar_frame_predict::predict_frame_error`] against NumPy's independent evaluation
//! of the same map with the CODATA-defined `c` over all five cases (a broader check than the two
//! hand-computed points in the unit tests).
//!
//! The covariance MAGNITUDES stay Modelled/representative (a lunar navigation-relay along-track
//! OD); it is the propagation MECHANISM and the range→time mapping that this oracle Validates.
//!
//! Reference vectors, provenance and the generator live in
//! `tests/fixtures/lunar_frame_predict_covprop/generate.py`
//! (`python3 generate.py > covprop_reference.txt`; NumPy only, no network — the Rust test reads
//! the committed `.txt`, so CI needs no Python).

use kshana::lunar_frame_predict::{predict_frame_error, propagate_covariance, OdCovariance};

const REF: &str = include_str!("fixtures/lunar_frame_predict_covprop/covprop_reference.txt");

/// NumPy's `@` and kshana's scalar expansion are the same IEEE-754 double operations up to
/// evaluation order; agreement to a few ULP is expected. A tight relative bound of 1e-12 with a
/// small absolute floor (for the tiny velocity variance ~1e-16 m²/s²) stays inside that without
/// hiding real drift.
const TOL_REL: f64 = 1e-12;
const TOL_ABS: f64 = 1e-15;

struct Case {
    label: String,
    sigma_r: f64,
    sigma_v: f64,
    rho: f64,
    dt: f64,
    p_rr: f64,
    p_rv: f64,
    p_vv: f64,
    pos_sigma: f64,
    pos_time_ns: f64,
    postproc_sigma: f64,
    postproc_time_ns: f64,
}

fn close(actual: f64, expected: f64) -> bool {
    let diff = (actual - expected).abs();
    diff <= TOL_ABS + TOL_REL * expected.abs()
}

fn parse_cases() -> Vec<Case> {
    let mut cases = Vec::new();
    for line in REF.lines() {
        let line = line.trim();
        if !line.starts_with("CASE ") {
            continue;
        }
        let t: Vec<&str> = line.split_whitespace().collect();
        // CASE label sr sv rho dt p_rr p_rv p_vv pos_sigma pos_time_ns postproc_sigma postproc_time_ns
        assert_eq!(t.len(), 13, "unexpected CASE arity in fixture: {line}");
        let f = |i: usize| t[i].parse::<f64>().unwrap();
        cases.push(Case {
            label: t[1].to_string(),
            sigma_r: f(2),
            sigma_v: f(3),
            rho: f(4),
            dt: f(5),
            p_rr: f(6),
            p_rv: f(7),
            p_vv: f(8),
            pos_sigma: f(9),
            pos_time_ns: f(10),
            postproc_sigma: f(11),
            postproc_time_ns: f(12),
        });
    }
    assert!(
        cases.len() >= 5,
        "expected >=5 oracle cases, got {}",
        cases.len()
    );
    cases
}

/// The crate's scalar `P' = Φ P Φᵀ` matches NumPy's general 2×2 matrix triple product on every
/// committed case, including the correlated (positive and negative ρ) and zero-latency cases.
#[test]
fn propagate_covariance_matches_numpy_matmul_oracle() {
    for c in parse_cases() {
        let cov = OdCovariance::new(c.sigma_r, c.sigma_v, c.rho);
        let pc = propagate_covariance(&cov, c.dt);
        assert!(
            close(pc.p_rr, c.p_rr),
            "{}: P'00 crate {} vs numpy {}",
            c.label,
            pc.p_rr,
            c.p_rr
        );
        assert!(
            close(pc.p_rv, c.p_rv),
            "{}: P'01 crate {} vs numpy {}",
            c.label,
            pc.p_rv,
            c.p_rv
        );
        assert!(
            close(pc.p_vv, c.p_vv),
            "{}: P'11 crate {} vs numpy {}",
            c.label,
            pc.p_vv,
            c.p_vv
        );
        assert!(
            close(pc.pos_sigma_m(), c.pos_sigma),
            "{}: predicted 1σ crate {} vs numpy {}",
            c.label,
            pc.pos_sigma_m(),
            c.pos_sigma
        );
    }
}

/// End-to-end through `predict_frame_error`: predicted/post-processed position 1σ and their
/// light-time-mapped ns match NumPy's independent evaluation on every case.
#[test]
fn predict_frame_error_matches_numpy_endtoend() {
    for c in parse_cases() {
        let cov = OdCovariance::new(c.sigma_r, c.sigma_v, c.rho);
        let r = predict_frame_error(cov, c.dt);
        assert!(
            close(r.predicted_pos_sigma_m, c.pos_sigma),
            "{}: predicted 1σ {} vs numpy {}",
            c.label,
            r.predicted_pos_sigma_m,
            c.pos_sigma
        );
        assert!(
            close(r.postproc_pos_sigma_m, c.postproc_sigma),
            "{}: postproc 1σ {} vs numpy {}",
            c.label,
            r.postproc_pos_sigma_m,
            c.postproc_sigma
        );
        assert!(
            close(r.predicted_time_ns, c.pos_time_ns),
            "{}: predicted ns {} vs numpy {}",
            c.label,
            r.predicted_time_ns,
            c.pos_time_ns
        );
        assert!(
            close(r.postproc_time_ns, c.postproc_time_ns),
            "{}: postproc ns {} vs numpy {}",
            c.label,
            r.postproc_time_ns,
            c.postproc_time_ns
        );
    }
}

/// The `representative` case in the fixture is exactly the module's Modelled covariance
/// (0.27 m, 4 mm/s, ρ=0) propagated through 3600 s, so the NumPy oracle independently confirms
/// the ~14.402 m real-time figure the module reports — closing the "self-referential closed
/// form" gap (the unit test recomputed the same scalar RSS the code uses).
#[test]
fn representative_case_independently_confirms_14_4m() {
    let rep = parse_cases()
        .into_iter()
        .find(|c| c.label == "representative")
        .expect("fixture must contain the representative case");
    // NumPy general-matmul value, not kshana's expansion.
    assert!(
        (rep.pos_sigma - 14.402_531_027_565_95).abs() < 1e-9,
        "oracle representative 1σ drifted: {}",
        rep.pos_sigma
    );
    let r = kshana::lunar_frame_predict::representative_report();
    assert!(
        close(r.predicted_pos_sigma_m, rep.pos_sigma),
        "crate representative {} vs numpy {}",
        r.predicted_pos_sigma_m,
        rep.pos_sigma
    );
}
