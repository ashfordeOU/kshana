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
//!
//! # Kshana-side implementation note (disclosed)
//!
//! The existing `araim_reference` path follows the Working Group C worked example and has no
//! ADD v4.2 subset determination (`P_THRES`, `FC_THRES`), Effective Monitor Threshold or
//! `C_acc` separation. The ADD v4.2 functions `add_v42_protection_levels` and
//! `add_v42_protection_levels_ecef` were added to `src/araim_reference.rs` after the
//! pre-registration, from the ADD v4.2 equations as MAAST's `mhss_raim_baseline_v5.m` and its
//! helpers implement them. They were completed after MAAST's valid output files existed on disk
//! (MAAST output 22:15 UTC, engine file final 22:17 UTC, 2026-10-01); no Kshana value had been
//! computed on these cases until the strict test was first run, and no constant or tolerance
//! was adjusted afterwards. The test shows that the Rust implementation reproduces the
//! reference implementation of the ADD; it does not check the ADD itself.

/// The ADD's TOL_PL (m): the protection-level tolerance.
pub const TOL_PL_M: f64 = 5e-2;
/// The closed-form tolerance (m) on the Effective Monitor Threshold and sigma_acc.
pub const TOL_CLOSED_FORM_M: f64 = 1e-3;

use kshana::araim_reference::{add_v42_protection_levels_ecef, AddV42Ism, ReferenceConstants};
use kshana::raim::{araim_dual_raim, araim_raim, DualFaultPriors, FaultPriors, IntegrityBudget};
use std::collections::BTreeMap;

/// One geometry case of the fixture: user geodetic latitude/longitude (deg) and its satellites
/// as `(constellation, PRN, Earth-fixed position)`.
struct GeoCase {
    lat_deg: f64,
    lon_deg: f64,
    sats: Vec<(usize, usize, [f64; 3])>,
}

fn load_geometry() -> BTreeMap<usize, GeoCase> {
    let text = std::fs::read_to_string(format!("{FIXTURE_DIR}/geometry.csv")).expect("geometry");
    let mut out: BTreeMap<usize, GeoCase> = BTreeMap::new();
    for line in text.lines().skip(1) {
        let f: Vec<&str> = line.split(',').collect();
        let case: usize = f[0].parse().unwrap();
        let e = out.entry(case).or_insert_with(|| GeoCase {
            lat_deg: f[2].parse().unwrap(),
            lon_deg: f[3].parse().unwrap(),
            sats: Vec::new(),
        });
        e.sats.push((
            f[5].parse().unwrap(),
            f[6].parse().unwrap(),
            [
                f[7].parse().unwrap(),
                f[8].parse().unwrap(),
                f[9].parse().unwrap(),
            ],
        ));
    }
    out
}

/// MAAST's per-case outputs: `(n_gps, n_gal, vpl, hpl, emt, sig_acc, p_not_monitored)`.
fn load_maast_levels() -> BTreeMap<usize, (usize, usize, [f64; 5])> {
    let text = std::fs::read_to_string(format!("{FIXTURE_DIR}/maast_araim_levels.csv"))
        .expect("MAAST levels");
    text.lines()
        .skip(1)
        .map(|l| {
            let f: Vec<&str> = l.split(',').collect();
            let v = |i: usize| f[i].parse::<f64>().unwrap();
            (
                f[0].parse().unwrap(),
                (
                    f[1].parse().unwrap(),
                    f[2].parse().unwrap(),
                    [v(3), v(4), v(5), v(6), v(7)],
                ),
            )
        })
        .collect()
}

/// MAAST's monitored subsets per case: `(excluded "c:prn" names sorted, prior)`.
fn load_maast_subsets() -> BTreeMap<usize, Vec<(Vec<String>, f64)>> {
    let text = std::fs::read_to_string(format!("{FIXTURE_DIR}/maast_araim_subsets.csv"))
        .expect("MAAST subsets");
    let mut out: BTreeMap<usize, Vec<(Vec<String>, f64)>> = BTreeMap::new();
    for l in text.lines().skip(1) {
        let f: Vec<&str> = l.splitn(4, ',').collect();
        let mut names: Vec<String> = if f[3].is_empty() {
            vec![]
        } else {
            f[3].split('|').map(str::to_string).collect()
        };
        names.sort();
        out.entry(f[0].parse().unwrap())
            .or_default()
            .push((names, f[2].parse().unwrap()));
    }
    out
}

fn isms() -> [AddV42Ism; 2] {
    let gps = AddV42Ism {
        sigma_ura_m: 1.0,
        sigma_ure_m: 0.5,
        b_nom_m: 0.75,
        p_sat: 1e-5,
        p_const: 1e-8,
    };
    [
        gps,
        AddV42Ism {
            p_const: 1e-4,
            ..gps
        },
    ]
}

fn user_ecef(c: &GeoCase) -> [f64; 3] {
    geodetic_to_ecef(Geodetic {
        lat_rad: c.lat_deg.to_radians(),
        lon_rad: c.lon_deg.to_radians(),
        alt_m: 0.0,
    })
}

#[test]
fn araim_mhss_matches_stanford_maast_add_v4_2() {
    let geo = load_geometry();
    let maast = load_maast_levels();
    let subsets = load_maast_subsets();
    assert_eq!(
        geo.len(),
        maast.len(),
        "every geometry case has a MAAST row"
    );
    let isms = isms();
    let (mut worst_v, mut worst_h, mut worst_e, mut worst_a) = (0.0_f64, 0.0_f64, 0.0_f64, 0.0_f64);
    let mut compared = 0usize;
    for (case, g) in &geo {
        let (n_gps, n_gal, m) = maast[case];
        let sats: Vec<[f64; 3]> = g.sats.iter().map(|s| s.2).collect();
        let cst: Vec<usize> = g.sats.iter().map(|s| s.0).collect();
        let (r, used) = add_v42_protection_levels_ecef(
            user_ecef(g),
            &sats,
            &cst,
            &isms,
            ReferenceConstants::LPV_200,
            0.01,
            5.0,
        )
        .unwrap_or_else(|e| panic!("case {case}: Kshana refused: {e}"));
        // Precondition 1: the same satellites above the mask.
        let k_gps = used.iter().filter(|&&i| g.sats[i].0 == 0).count();
        assert_eq!(
            (k_gps, used.len() - k_gps),
            (n_gps, n_gal),
            "case {case}: satellites above the mask differ"
        );
        // Precondition 2: the same monitored subsets (and priors).
        let name = |i: usize| format!("{}:{}", g.sats[used[i]].0, g.sats[used[i]].1);
        let mut mine: Vec<(Vec<String>, f64)> = r
            .monitored
            .iter()
            .map(|s| {
                let mut v: Vec<String> = s.excluded.iter().map(|&i| name(i)).collect();
                v.sort();
                (v, s.p_fault)
            })
            .collect();
        let mut theirs = subsets[case].clone();
        mine.sort_by(|a, b| a.0.cmp(&b.0));
        theirs.sort_by(|a, b| a.0.cmp(&b.0));
        assert_eq!(
            mine.iter().map(|x| &x.0).collect::<Vec<_>>(),
            theirs.iter().map(|x| &x.0).collect::<Vec<_>>(),
            "case {case}: monitored subset lists differ"
        );
        for (a, b) in mine.iter().zip(&theirs) {
            if !a.0.is_empty() {
                assert!(
                    (a.1 - b.1).abs() <= 1e-9 * b.1,
                    "case {case}: prior of {:?}: Kshana {:e} MAAST {:e}",
                    a.0,
                    a.1,
                    b.1
                );
            }
        }
        // The bars.
        let dv = (r.vpl_m - m[0]).abs();
        let dh = (r.hpl_m - m[1]).abs();
        let de = (r.emt_m - m[2]).abs();
        let da = (r.sigma_v_acc_m - m[3]).abs();
        worst_v = worst_v.max(dv);
        worst_h = worst_h.max(dh);
        worst_e = worst_e.max(de);
        worst_a = worst_a.max(da);
        assert!(
            dv <= TOL_PL_M && dh <= TOL_PL_M && de <= TOL_CLOSED_FORM_M && da <= TOL_CLOSED_FORM_M,
            "case {case}: VPL {:.4}/{:.4}, HPL {:.4}/{:.4}, EMT {:.5}/{:.5}, sigma_acc {:.6}/{:.6} \
             (Kshana/MAAST)",
            r.vpl_m,
            m[0],
            r.hpl_m,
            m[1],
            r.emt_m,
            m[2],
            r.sigma_v_acc_m,
            m[3]
        );
        compared += 1;
    }
    eprintln!(
        "ARAIM vs MAAST ({compared} cases): worst |dVPL| {worst_v:.2e} m, |dHPL| {worst_h:.2e} m, \
         |dEMT| {worst_e:.2e} m, |dsigma_acc| {worst_a:.2e} m"
    );
}

/// The shipping uniform-sigma `araim_dual_raim` against the same MAAST cases. It takes one sigma
/// (here sigma_URA), one P_const (1e-4) and no accuracy covariance, so it cannot be fed the
/// pre-registered ISM; its gap is measured and pinned here, not scored against the bar.
#[test]
fn uniform_sigma_araim_dual_raim_gap_against_maast() {
    let geo = load_geometry();
    let maast = load_maast_levels();
    let (mut worst_v, mut worst_h) = (0.0_f64, 0.0_f64);
    let mut n = 0usize;
    for (case, g) in &geo {
        let (_, n_gal, m) = maast[case];
        if n_gal == 0 {
            continue;
        }
        let user = user_ecef(g);
        let (mut sats, mut lab) = (Vec::new(), Vec::new());
        for &(c, _, p) in &g.sats {
            let el = elevation(
                Geodetic {
                    lat_rad: g.lat_deg.to_radians(),
                    lon_rad: g.lon_deg.to_radians(),
                    alt_m: 0.0,
                },
                p,
            );
            if el >= 5f64.to_radians() {
                sats.push(p);
                lab.push(c as u8);
            }
        }
        let zero = vec![0.0; sats.len()];
        let priors = DualFaultPriors {
            p_sat: 1e-5,
            p_const: 1e-4,
            b_nom_m: 0.75,
        };
        let budget = IntegrityBudget {
            p_hmi_vert: 9.8e-8,
            p_hmi_horz: 2e-9,
            p_fa: 3.9e-6,
        };
        if let Some(r) = araim_dual_raim(user, &sats, &lab, &zero, 1.0, priors, budget) {
            worst_v = worst_v.max((r.vpl_m - m[0]).abs());
            worst_h = worst_h.max((r.hpl_m - m[1]).abs());
            n += 1;
        }
    }
    eprintln!(
        "araim_dual_raim (uniform sigma) vs MAAST on {n} dual cases: worst |dVPL| {worst_v:.3} m, \
         |dHPL| {worst_h:.3} m"
    );
    assert!(n > 0);
}

// ── Second pre-registration: the uniform-sigma functions on matched inputs ──────────────────
//
// Written and committed before the matched MAAST runs below were made (2026-10-01).
//
// **Why a second comparison.** `uniform_sigma_araim_dual_raim_gap_against_maast` above measures
// the shipping uniform-sigma functions against MAAST runs whose ISM they cannot express
// (sigma_URE 0.5 m, P_const 1e-8 for GPS), so its 12.7 m gap mixes input and algorithm
// differences. This comparison gives MAAST inputs the uniform functions can express, so any
// remaining gap is the algorithm's.
//
// **Oracle.** The same MAAST for ARAIM 2 driver, `run_maast_araim.m`, with a variant argument:
// - `uniform_pc`: sigma_URA = sigma_URE = 1.0 m, b_nom = 0.75 m, P_sat = 1e-5, P_const = 1e-4
//   for GPS and Galileo; every other setting, the budget (LPV-200) and the geometry as above.
//   Output `maast_araim_uniform_pc_levels.csv`.
// - `uniform_nopc`: as `uniform_pc` but P_const = 0 for both. Output
//   `maast_araim_uniform_nopc_levels.csv`.
//
// **Kshana side.** `kshana::raim::araim_dual_raim` on the GPS + Galileo cases against
// `uniform_pc`, and `kshana::raim::araim_raim` on the GPS-only cases (the IGS precise-orbit
// cases) against `uniform_nopc`, both with sigma = 1.0 m, P_sat = 1e-5, b_nom = 0.75 m
// (P_const = 1e-4 for the dual function), budget P_HMI_vert = 9.8e-8, P_HMI_horz = 2e-9 and
// p_fa = P_FA_VERT + P_FA_HOR = 3.99e-6 (the functions take one false-alarm budget), on the
// satellites above the 5 degree mask, with zero residuals.
// A case the Kshana function refuses (`araim_raim` needs six satellites) is counted and
// reported, not scored.
//
// **Bar (the same as above).** |dVPL|, |dHPL| <= TOL_PL = 0.05 m on every case. If every case
// passes, the uniform functions are recorded as ADD-conformant at that bar. If any case fails,
// the uniform functions are recorded as not conformant to the ADD v4.2 allocation (a finding,
// with the worst gaps), and the row's ARAIM protection-level claim rests on the ADD v4.2 path
// (`araim_reference::add_v42_protection_levels`) validated above. Rewiring the shipping
// functions to the ADD path is not part of this comparison: `araim_raim` is the kernel the
// lunar ARAIM row is validated on, with its own reference.

fn uniform_case_gaps(variant: &str, dual: bool) -> (usize, f64, f64) {
    let geo = load_geometry();
    let text = std::fs::read_to_string(format!("{FIXTURE_DIR}/maast_araim_{variant}_levels.csv"))
        .unwrap_or_else(|e| panic!("{variant}: {e}"));
    let (mut n, mut worst_v, mut worst_h) = (0usize, 0.0_f64, 0.0_f64);
    let mut refused = 0usize;
    for l in text.lines().skip(1) {
        let f: Vec<&str> = l.split(',').collect();
        let case: usize = f[0].parse().unwrap();
        let n_gal: usize = f[2].parse().unwrap();
        if dual != (n_gal > 0) {
            continue;
        }
        let (vpl_m, hpl_m): (f64, f64) = (f[3].parse().unwrap(), f[4].parse().unwrap());
        let g = &geo[&case];
        let user = user_ecef(g);
        let here = Geodetic {
            lat_rad: g.lat_deg.to_radians(),
            lon_rad: g.lon_deg.to_radians(),
            alt_m: 0.0,
        };
        let (mut sats, mut lab) = (Vec::new(), Vec::new());
        for &(c, _, p) in &g.sats {
            if elevation(here, p) >= 5f64.to_radians() {
                sats.push(p);
                lab.push(c as u8);
            }
        }
        let zero = vec![0.0; sats.len()];
        let budget = IntegrityBudget {
            p_hmi_vert: 9.8e-8,
            p_hmi_horz: 2e-9,
            p_fa: 3.99e-6,
        };
        let r = if dual {
            let priors = DualFaultPriors {
                p_sat: 1e-5,
                p_const: 1e-4,
                b_nom_m: 0.75,
            };
            araim_dual_raim(user, &sats, &lab, &zero, 1.0, priors, budget)
        } else {
            let priors = FaultPriors {
                p_sat: 1e-5,
                b_nom_m: 0.75,
            };
            araim_raim(user, &sats, &zero, 1.0, priors, budget)
        };
        let Some(r) = r else {
            refused += 1;
            continue;
        };
        worst_v = worst_v.max((r.vpl_m - vpl_m).abs());
        worst_h = worst_h.max((r.hpl_m - hpl_m).abs());
        n += 1;
    }
    eprintln!(
        "{variant} ({} function) vs MAAST on {n} cases ({refused} refused by Kshana): worst |dVPL| {worst_v:.4} m, |dHPL| \
         {worst_h:.4} m",
        if dual {
            "araim_dual_raim"
        } else {
            "araim_raim"
        }
    );
    (n, worst_v, worst_h)
}

#[test]
#[ignore = "pre-registered; not yet run"]
fn uniform_sigma_araim_dual_raim_matches_maast_on_matched_inputs() {
    let (n, dv, dh) = uniform_case_gaps("uniform_pc", true);
    assert!(n > 0);
    assert!(dv <= TOL_PL_M && dh <= TOL_PL_M);
}

#[test]
#[ignore = "pre-registered; not yet run"]
fn uniform_sigma_araim_raim_matches_maast_on_matched_inputs() {
    let (n, dv, dh) = uniform_case_gaps("uniform_nopc", false);
    assert!(n > 0);
    assert!(dv <= TOL_PL_M && dh <= TOL_PL_M);
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
                        r[0], r[1], r[2]
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
                        k as f64, s.pos_m[0], s.pos_m[1], s.pos_m[2]
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
}
