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

//!
//! # Oracle runtime note (committed before any Kshana value was computed)
//!
//! The first MAAST run under Octave produced invalid output: an empty EMT on every case. GNU
//! Octave 8.4's `unique(A, 'rows', 'stable')` does not implement the third output (it warns
//! "third output J is not yet implemented" and returns it empty), and MAAST's
//! `find_unique_subsets.m` uses that output to carry each subset's prior into the
//! protection-level sums, so every fault prior became zero. The driver now puts a
//! compatibility `unique.m` (`xval/araim-maast/octave_compat/`, MATLAB's documented semantics for
//! that one call form, every other call deferred to Octave's own) ahead of Octave's on the path
//! and the oracle was re-run. MAAST's numbers from the invalid run were seen; no Kshana value
//! had been computed, and the quantity, inputs, settings and bars above are unchanged.

/// The ADD's TOL_PL (m): the protection-level tolerance.
pub const TOL_PL_M: f64 = 5e-2;
/// The closed-form tolerance (m) on the Effective Monitor Threshold and sigma_acc.
pub const TOL_CLOSED_FORM_M: f64 = 1e-3;

#[test]
#[ignore = "pre-registered; not yet run"]
fn araim_mhss_matches_stanford_maast_add_v4_2() {
    unimplemented!("pre-registered; the comparison body lands with the fixture");
}

// ── Fixture generator ────────────────────────────────────────────────────────────────────────
//
// `KSHANA_WRITE_FIXTURE=1 cargo test --test integrity_araim_stanford_oracle -- --ignored
// generate_geometry_fixture` rewrites `tests/fixtures/integrity_araim_stanford_oracle/geometry.csv`
// from the committed element sets and precise orbit. The geometry is an input to both tools.

use kshana::frames::{elevation, geodetic_to_ecef, teme_to_ecef, Geodetic};
use kshana::orbit::Propagator;
use kshana::sgp4::GravModel;
use kshana::sp3::parse_sp3;
use kshana::tle::parse_tle;

const FIXTURE_DIR: &str = "tests/fixtures/integrity_araim_stanford_oracle";
const USER_LATS_DEG: [f64; 5] = [-60.0, -30.0, 0.0, 30.0, 60.0];
const USER_LONS_DEG: [f64; 6] = [-150.0, -90.0, -30.0, 30.0, 90.0, 150.0];

/// `(SGP4 propagator, epoch in days since 1950 Jan 0.0)` for every element set in a file, built
/// as `tests/araim_dual_real_data.rs` builds them.
fn element_sets(path: &str) -> Vec<(Propagator, f64)> {
    let text = std::fs::read_to_string(path).unwrap_or_else(|e| panic!("read {path}: {e}"));
    let grav = GravModel::default().constants();
    let lines: Vec<&str> = text.lines().map(str::trim).collect();
    let mut out = Vec::new();
    let mut i = 0;
    while i < lines.len() {
        if lines[i].starts_with("1 ") && i + 1 < lines.len() && lines[i + 1].starts_with("2 ") {
            let tle = parse_tle(lines[i], lines[i + 1]).expect("element set parses");
            out.push((
                Propagator::Sgp4(Box::new(tle.to_sgp4(grav, false))),
                tle.epoch_days_1950,
            ));
            i += 2;
        } else {
            i += 1;
        }
    }
    out
}

/// `(latitude deg, longitude deg, geodetic position)` of every user, latitude-major.
fn users() -> Vec<(f64, f64, Geodetic)> {
    let mut v = Vec::new();
    for &lat in &USER_LATS_DEG {
        for &lon in &USER_LONS_DEG {
            let g = Geodetic {
                lat_rad: lat.to_radians(),
                lon_rad: lon.to_radians(),
                alt_m: 0.0,
            };
            v.push((lat, lon, g));
        }
    }
    v
}

#[test]
#[ignore = "fixture generator; run with KSHANA_WRITE_FIXTURE=1"]
fn generate_geometry_fixture() {
    if std::env::var("KSHANA_WRITE_FIXTURE").is_err() {
        return;
    }
    let mut out = String::from("case,source,lat_deg,lon_deg,t_s,constellation,prn,x_m,y_m,z_m\n");
    let mut case = 0usize;
    // (i) GPS + Galileo element sets aligned to one instant (the latest epoch in the set).
    let gps = element_sets("tests/fixtures/celestrak/gps-ops_2026-06-07.txt");
    let gal = element_sets("tests/fixtures/celestrak/galileo_2026-06-07.txt");
    let t_ref_days = gps
        .iter()
        .chain(gal.iter())
        .map(|&(_, e)| e)
        .fold(f64::MIN, f64::max);
    let jd_ref = 2_433_281.5 + t_ref_days;
    for k in 0..8 {
        let t_s = 3.0 * 3600.0 * k as f64;
        let jd = jd_ref + t_s / 86_400.0;
        let mut sats: Vec<(usize, usize, [f64; 3])> = Vec::new();
        for (c, set) in [(0usize, &gps), (1usize, &gal)] {
            for (j, (p, e)) in set.iter().enumerate() {
                let tsince = (t_ref_days - e) * 86_400.0 + t_s;
                sats.push((c, j + 1, teme_to_ecef(p.position_eci(tsince), jd)));
            }
        }
        for (lat, lon, u) in users() {
            for &(c, prn, r) in &sats {
                if elevation(u, r) > 0.0 {
                    out.push_str(&format!(
                        "{case},TLE,{lat:?},{lon:?},{t_s:?},{c},{prn},{:?},{:?},{:?}\n",
                        r[0],
                        r[1],
                        r[2]
                    ));
                }
            }
            case += 1;
        }
    }
    // (ii) GPS only, every epoch of the IGS precise orbit.
    let sp3 = parse_sp3(include_str!("fixtures/igs/igs_sample.sp3")).expect("SP3 parses");
    for (k, ep) in sp3.epochs.iter().enumerate() {
        for (lat, lon, u) in users() {
            for s in ep.sats.iter().filter(|s| s.sat.starts_with('G')) {
                if elevation(u, s.pos_m) > 0.0 {
                    let prn: usize = s.sat[1..].trim().parse().expect("SP3 PRN");
                    out.push_str(&format!(
                        "{case},SP3,{lat:?},{lon:?},{:?},0,{prn},{:?},{:?},{:?}\n",
                        k as f64,
                        s.pos_m[0],
                        s.pos_m[1],
                        s.pos_m[2]
                    ));
                }
            }
            case += 1;
        }
    }
    std::fs::create_dir_all(FIXTURE_DIR).expect("fixture dir");
    std::fs::write(format!("{FIXTURE_DIR}/geometry.csv"), out).expect("write geometry");
    // The user position the Kshana side uses is `geodetic_to_ecef` of the row's latitude and
    // longitude at height 0; MAAST forms its own from the same geodetic coordinates.
    let _ = geodetic_to_ecef;
}
