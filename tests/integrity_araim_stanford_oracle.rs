// SPDX-License-Identifier: AGPL-3.0-only
//! Advanced Receiver Autonomous Integrity Monitoring (ARAIM) protection levels against Stanford
//! "MAAST for ARAIM 2", the reference implementation of the ARAIM Airborne Algorithm Description
//! Document (ADD) version 4.2.
//!
//! # Pre-registration (written and committed before the fixture is generated or the oracle run)
//!
//! **Quantity.** For every geometry case: the Vertical Protection Level (VPL), the Horizontal
//! Protection Level (HPL), the Effective Monitor Threshold (EMT) and the all-in-view vertical
//! accuracy standard deviation (sigma_acc) of the multiple-hypothesis solution-separation (MHSS)
//! fault-detection algorithm, plus the list of monitored fault subsets.
//!
//! **Oracle.** Stanford GPS Laboratory "MAAST for ARAIM 2"
//! (<https://github.com/stanford-gps-lab/maast_for_araim_2>, commit ab70e2a3, BSD-3-Clause
//! licence text in its README; copyright the Board of Trustees of the Leland Stanford Junior
//! University), function `mhss_raim_baseline_v5.m` ("implements the vpl, hpl, sigma accuracy,
//! and emt computation described in the ARAIM ADD v4.2"), with the companion MAAST repository
//! (<https://github.com/stanford-gps-lab/maast>, commit 7d32b049) on the path for its geometry
//! helpers. It is run as a separate tool under GNU Octave 8.4 with the statistics package by the
//! headless driver `xval/araim-maast/run_maast_araim.m`; no MAAST code is copied into the crate.
//!
//! **Inputs (identical for both tools).**
//! - Geometry: the committed real geometry the existing integrity tests use.
//!   (i) GPS + Galileo from the Celestrak element sets `tests/fixtures/celestrak/gps-ops_2026-06-07.txt`
//!   and `galileo_2026-06-07.txt`, propagated by SGP4 to one common instant per epoch exactly as
//!   `tests/araim_dual_real_data.rs` aligns them (t = 0 is the latest element-set epoch), at
//!   t = 0, 3, 6, ..., 21 h; (ii) GPS only from the International GNSS Service (IGS) precise orbit
//!   `tests/fixtures/igs/igs_sample.sp3`, every epoch in the file. Users: latitudes -60, -30, 0,
//!   30, 60 degrees by longitudes -150, -90, -30, 30, 90, 150 degrees, height 0 m. Satellite and
//!   user Earth-fixed positions are written to the fixture; each tool forms its own East-North-Up
//!   line-of-sight rows (MAAST: `find_los_xyzb`, `find_los_enub` on the geodetic local-level
//!   frame from `xyz2llh`/`findxyz2enu`) and applies a 5 degree elevation mask.
//! - Integrity Support Message (ISM): sigma_URA = 1.0 m (so C_int,i = 1.0 m^2), sigma_URE = 0.5 m
//!   (C_acc,i = 0.25 m^2), integrity nominal bias b_nom = 0.75 m, accuracy/continuity nominal bias
//!   0 m, P_sat = 1e-5 for every satellite, P_const = 1e-8 for GPS and 1e-4 for Galileo. No
//!   tropospheric or airborne terms are added (both tools receive the same per-satellite
//!   variances; the error-model terms are outside this comparison).
//! - Budget: the LPV-200 column, P_HMI_VERT = 9.8e-8, P_HMI_HOR = 2e-9, P_FA_VERT = 3.9e-6,
//!   P_FA_HOR = 9e-8, P_THRES = 8e-8, P_EMT = 1e-5.
//! - MAAST settings: fault detection only (`fde_flag` 0, `rho_j` 1), no position optimisation
//!   (`opt` 0), exact rather than fast mode (`fast` 0), ADD v4.2 HPL (`hpl_variant` 0),
//!   `max_pmd_flag` 0, `N_es_int` = `N_es_cont` = 1, exposure time 0 (so the exposure prior equals
//!   the instantaneous prior), `fc_thres` 0.01 and `p_exc_thres` 1 (MAAST defaults), `pl_tol`
//!   1e-4 m (MAAST's bisection stops after at most 10 halvings; its residual bracket is reported
//!   and is part of the TOL_PL budget below).
//!
//! **Precondition (checked per case, before any tolerance).** The satellites above the mask are
//! the same in both tools, and MAAST's monitored subset list equals the set Kshana models (the
//! all-in-view solution, every monitored single-satellite exclusion, every monitored
//! constellation exclusion). A case where Kshana refuses because simultaneous multi-event subsets
//! would be needed must be exactly a case where MAAST monitors such a subset; those cases are
//! counted and reported, never scored as agreement.
//!
//! **Tolerance and its source.** |VPL_Kshana - VPL_MAAST| <= 0.05 m and |HPL_Kshana - HPL_MAAST|
//! <= 0.05 m: the ADD's own TOL_PL ("tolerance for the computation of the Protection Level",
//! 5e-2 m), the same bar `tests/araim_reference_vectors.rs` uses for the Working Group C worked
//! example. |EMT_Kshana - EMT_MAAST| <= 1e-3 m and |sigma_acc,Kshana - sigma_acc,MAAST| <= 1e-3 m:
//! both are closed-form (no iterative solve), so they are held to 1 mm. Every case must pass;
//! the worst case of each quantity is reported.
//!
//! **Kshana side.** The ADD-conformant path `kshana::araim_reference` (already validated against
//! the Working Group C worked example), driven from the same Earth-fixed geometry and ISM. The
//! shipping uniform-sigma functions `kshana::raim::araim_dual_raim` and `araim_raim` take a
//! single sigma and a single P_const and have no accuracy covariance, so they cannot be fed this
//! ISM; their gap against the same MAAST cases (with sigma = sigma_URA and P_const = 1e-4) is
//! measured and reported by a separate gated test, not scored against the bar.

/// The ADD's TOL_PL (m): the protection-level tolerance.
pub const TOL_PL_M: f64 = 5e-2;
/// The closed-form tolerance (m) on the Effective Monitor Threshold and sigma_acc.
pub const TOL_CLOSED_FORM_M: f64 = 1e-3;

#[test]
#[ignore = "pre-registered; not yet run"]
fn araim_mhss_matches_stanford_maast_add_v4_2() {
    unimplemented!("pre-registered; the comparison body lands with the fixture");
}
