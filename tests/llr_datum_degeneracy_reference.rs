// SPDX-License-Identifier: AGPL-3.0-only
//! LLR-only datum-degeneracy reference test — externally-anchored against Sośnica et al. 2025.
//!
//! # Oracle
//! Sośnica, K. et al. (2025), "Definition and Realization of the International Lunar Reference
//! Frame", arXiv:2510.15484 — reports a lunocenter-X ↔ frame-scale correlation r ≈ −0.97 from a
//! full multi-ephemeris variance-component combination (VCE) over 55 years of real LLR data, with
//! a CoM-X origin floor of ~12 cm.
//!
//! # What is VALIDATED (structural claim)
//! The LLR near-side geometry, combined with real JPL DE440 PA-frame libration (Park et al. 2021,
//! AJ 161:105), REPRODUCES THE DEGENERACY STRUCTURE — a strong, finite CoM-X↔scale correlation in
//! Sośnica 2025's r ≈ −0.97 regime. Specifically: |corr(t_x, scale)| > 0.9 and < 0.9999, and the
//! datum defect ≤ 1. This is a geometric property of nearly-radial Earth–Moon lines of sight to the
//! five near-side retroreflectors, recovered from an LLR-only Fisher design matrix. The orientation
//! is drawn from the embedded DE440 PA-frame fixture, which covers 2024–2025 with real libration
//! data (±7.8°/±6.8°), not a simplified spherical model.
//!
//! # What is NOT VALIDATED (Modelled)
//! - The exact correlation magnitude (≈ −0.988 here vs. −0.97 in Sośnica). The difference reflects
//!   the simplified 4-parameter problem (lunar orientation and reflector coordinates held fixed) vs.
//!   Sośnica's full multi-parameter VCE estimation.
//! - The `origin_crlb_m` value (≈ 0.585 mm here vs. ~12 cm in Sośnica). Do NOT interpret the CRLB
//!   magnitude as reproducing Sośnica's floor — the 4-parameter simplification omits the dominant
//!   error sources (libration uncertainty, reflector position errors, atmospheric delays) that drive
//!   the 12 cm floor in the real solution.
//!
//! # Honesty firewall
//! The upper bound on |corr| < 0.9999 is a WIRING CHECK: corr == 1.000 exactly signals that DE440
//! orientation is NOT applied (trivial rank-1 no-libration artefact). The lower bound > 0.9
//! confirms the strong CoM-X↔scale degeneracy is present in the LLR geometry. Both bounds together
//! validate the structural reproduction without overclaiming the magnitude.

use kshana::lunar_llr::llr_datum_observability;

/// Validates that the LLR-only Fisher analysis with real DE440 libration reproduces the
/// CoM-X↔scale degeneracy structure reported by Sośnica et al. 2025 (arXiv:2510.15484).
///
/// Epoch: 2024-01-01 TT (JD 2460310.5), which lies within the embedded DE440 PA-frame
/// fixture window (2024-01-01 to 2025-12-31), ensuring real libration data are used.
#[test]
fn llr_geometry_reproduces_sosnica_2025_degeneracy_structure() {
    // 2024-01-01 TT ≈ JD 2460310.5 → t0_jc ≈ 0.23999 JC from J2000.
    // This epoch lies within the embedded DE440 PA-frame fixture window
    // (2024-01-01 to 2025-12-31), ensuring real libration data are used.
    let t0_jc: f64 = (2_460_310.5 - 2_451_545.0) / 36_525.0;

    // APOLLO-class mm normal points; ~1 synodic month at 6 h cadence.
    let obs = llr_datum_observability(0.003, t0_jc, 29.5, 6.0);

    // Gate 1: Populated observation schedule.
    assert!(
        obs.n_obs > 20,
        "need a populated schedule (all geometry gates failed); got {} obs",
        obs.n_obs
    );

    // Gate 2: Strong CoM-X↔scale correlation — structural reproduction of Sośnica 2025.
    //
    // Lower bound (> 0.9): confirms the strong CoM-X↔scale degeneracy is present.  This is the
    // same regime as Sośnica's r ≈ −0.97 (VALIDATED: structure).
    //
    // Upper bound (< 0.9999): if |corr| == 1.000 the DE440 orientation fixture is not wired in
    // (the trivial rank-1 artefact from perfectly collinear sightlines with no libration).
    // This bound is a wiring-correctness gate, NOT a magnitude claim (NOT VALIDATED: magnitude).
    assert!(
        obs.corr_tx_scale.abs() > 0.9,
        "LLR-only geometry must show strong CoM-X<->scale degeneracy (|r|>0.9, \
         structural reproduction of Sosnica-2025 r≈-0.97); got {:.6}",
        obs.corr_tx_scale
    );
    assert!(
        obs.corr_tx_scale.abs() < 0.9999,
        "corr == 1.000 indicates DE440 libration is not applied (trivial rank-1 artefact, \
         no-libration model); got {:.6}",
        obs.corr_tx_scale
    );

    // Gate 3: Datum defect ≤ 1.
    //
    // Real DE440 libration (±7.8°/±6.8°) breaks the exact collinearity that causes the
    // no-libration defect = 3.  With libration the lateral translations (t_y, t_z) become
    // observable, leaving at most one weakly-determined direction (CoM-X↔scale).
    // defect = 0 (full-rank with high correlation) is the same physics Sośnica reports.
    // (VALIDATED: structure; NOT VALIDATED: exact defect dimension under a full solution)
    assert!(
        obs.defect <= 1,
        "real DE440 libration must reduce datum defect to ≤1 (was 3 in the no-libration model); \
         got defect = {}",
        obs.defect
    );

    // Gate 4: Origin CRLB finite and positive.
    //
    // The ~0.585 mm value here is NOT the 12 cm floor from Sośnica — it reflects the
    // 4-parameter simplification (orientation + reflector coords held fixed).
    // This gate only verifies the matrix is not singular/pathological.
    // (NOT VALIDATED: magnitude; VALIDATED: finite, non-zero, physically sensible sign)
    assert!(
        obs.origin_crlb_m.is_finite() && obs.origin_crlb_m > 0.0,
        "origin CRLB must be finite and positive (degenerate matrix artefact otherwise); \
         got origin_crlb_m = {}",
        obs.origin_crlb_m
    );
}
