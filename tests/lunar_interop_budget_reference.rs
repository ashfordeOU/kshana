// SPDX-License-Identifier: AGPL-3.0-only
//! Validated anchor: real inter-ephemeris Helmert decomposition vs independent SciPy lstsq.
//!
//! Reproduces the DE440 / INPOP21a / EPM2021 cross-provider Moon disagreement using
//! [`kshana::lunar_interop_budget::provenance_split`] and asserts the result matches
//! `reference.json` (generated offline by `scripts/gen_interop_ref.py` with calceph +
//! numpy SVD `lstsq`).
//!
//! This is the single Validated row for the P2 cross-provider module.  All scalar
//! magnitude results for all three provider pairs are cross-checked against reference.json
//! to relative error < 1e-3 AND absolute error < 1e-3 m / < 1e-2 nrad.
//!
//! **Consistency of oracle and fixtures.** reference.json and the CSV fixtures are computed
//! by `scripts/gen_interop_ref.py` from byte-identical inputs: the sampled positions are
//! rounded to 6 decimals (1 µm) *before* both being written to CSV and being fed to the
//! SciPy SVD `lstsq` oracle.  The Rust reference test reads the same CSVs, so the only
//! difference between the two is the linear solver (Rust Jacobi-preconditioned Cholesky vs
//! SciPy SVD), which agrees to well within 1e-3 even for the near-cancelling
//! INPOP21a–EPM2021 reducible/irreducible split (theta_moon ≈ theta_frametie).  The
//! *physical* sensitivity of that split — a difference of two comparable rotations — is a
//! scientific point discussed in the manuscript, not a numerical artefact of this test.
//!
//! Fixture files are baked at compile time via `include_str!`; no runtime I/O occurs.

use kshana::lunar_interop_budget::{provenance_split, Vec3};
use std::collections::BTreeMap;

const MOON_GEO_CSV: &str = include_str!("fixtures/inter_ephemeris/moon_geo.csv");
const PLANET_SSB_CSV: &str = include_str!("fixtures/inter_ephemeris/planet_ssb.csv");
const REFERENCE_JSON: &str = include_str!("fixtures/inter_ephemeris/reference.json");

// ── CSV parsers ────────────────────────────────────────────────────────────────

/// Parse `moon_geo.csv` → `BTreeMap<provider, Vec<Vec3>>`.
///
/// Rows are already day-sorted within each provider; we push them in file order.
fn parse_moon_geo(csv: &str) -> BTreeMap<String, Vec<Vec3>> {
    let mut map: BTreeMap<String, Vec<Vec3>> = BTreeMap::new();
    for line in csv.lines().skip(1) {
        let line = line.trim();
        if line.is_empty() {
            continue;
        }
        let mut it = line.split(',');
        let _day = it.next().unwrap();
        let provider = it.next().unwrap().to_string();
        let x: f64 = it.next().unwrap().trim().parse().unwrap();
        let y: f64 = it.next().unwrap().trim().parse().unwrap();
        let z: f64 = it.next().unwrap().trim().parse().unwrap();
        map.entry(provider).or_default().push([x, y, z]);
    }
    map
}

/// Parse `planet_ssb.csv` → `BTreeMap<(provider, body), Vec<Vec3>>`.
///
/// Rows are already day-sorted within each (provider, body) group.
fn parse_planet_ssb(csv: &str) -> BTreeMap<(String, String), Vec<Vec3>> {
    let mut map: BTreeMap<(String, String), Vec<Vec3>> = BTreeMap::new();
    for line in csv.lines().skip(1) {
        let line = line.trim();
        if line.is_empty() {
            continue;
        }
        let mut it = line.split(',');
        let _day = it.next().unwrap();
        let provider = it.next().unwrap().to_string();
        let body = it.next().unwrap().to_string();
        let x: f64 = it.next().unwrap().trim().parse().unwrap();
        let y: f64 = it.next().unwrap().trim().parse().unwrap();
        let z: f64 = it.next().unwrap().trim().parse().unwrap();
        map.entry((provider, body)).or_default().push([x, y, z]);
    }
    map
}

// ── Helpers ────────────────────────────────────────────────────────────────────

fn norm3(v: Vec3) -> f64 {
    (v[0] * v[0] + v[1] * v[1] + v[2] * v[2]).sqrt()
}

// ── Test ───────────────────────────────────────────────────────────────────────

#[test]
fn inter_ephemeris_decomposition_matches_scipy() {
    let moon = parse_moon_geo(MOON_GEO_CSV);
    let planet = parse_planet_ssb(PLANET_SSB_CSV);

    let ref_val: serde_json::Value =
        serde_json::from_str(REFERENCE_JSON).expect("reference.json must be valid JSON");
    let lunar_dist_m: f64 = ref_val["lunar_dist_m"]
        .as_f64()
        .expect("lunar_dist_m must be a float");
    let pairs_obj = ref_val["pairs"]
        .as_object()
        .expect("pairs must be a JSON object");

    // Body order is fixed: mercury, venus, mars, emb (matches the SciPy oracle).
    let bodies = ["mercury", "venus", "mars", "emb"];

    // ── Compute the split for each pair ────────────────────────────────────────

    struct PairResult<'a> {
        key: &'a str,
        // computed
        raw_rms_m: f64,
        rot_residual_m: f64,
        theta_moon_nrad: f64,
        theta_frametie_nrad: f64,
        theta_excess_nrad: f64,
        reducible_m: f64,
        irreducible_m: f64,
        // expected (from reference.json)
        exp_raw_rms_m: f64,
        exp_rot_residual_m: f64,
        exp_theta_moon_nrad: f64,
        exp_theta_frametie_nrad: f64,
        exp_theta_excess_nrad: f64,
        exp_reducible_m: f64,
        exp_irreducible_m: f64,
    }

    let mut results: Vec<PairResult<'_>> = Vec::new();

    for (key, pair_data) in pairs_obj {
        let (a, b) = key
            .split_once('-')
            .unwrap_or_else(|| panic!("malformed pair key: {key}"));

        let moon_from = moon
            .get(a)
            .unwrap_or_else(|| panic!("provider '{a}' not found in moon_geo.csv"));
        let moon_to = moon
            .get(b)
            .unwrap_or_else(|| panic!("provider '{b}' not found in moon_geo.csv"));

        // Build planet_pairs in fixed body order.
        let planet_pairs: Vec<(Vec<Vec3>, Vec<Vec3>)> = bodies
            .iter()
            .map(|&body| {
                let from = planet
                    .get(&(a.to_string(), body.to_string()))
                    .unwrap_or_else(|| panic!("missing ({a}, {body}) in planet_ssb.csv"))
                    .clone();
                let to = planet
                    .get(&(b.to_string(), body.to_string()))
                    .unwrap_or_else(|| panic!("missing ({b}, {body}) in planet_ssb.csv"))
                    .clone();
                (from, to)
            })
            .collect();

        let split = provenance_split(moon_from, moon_to, &planet_pairs, lunar_dist_m);

        results.push(PairResult {
            key: key.as_str(),
            raw_rms_m: split.raw_rms_m,
            rot_residual_m: split.rot_residual_m,
            theta_moon_nrad: norm3(split.theta_moon) * 1e9,
            theta_frametie_nrad: norm3(split.theta_frametie) * 1e9,
            theta_excess_nrad: norm3(split.theta_excess) * 1e9,
            reducible_m: split.reducible_m,
            irreducible_m: split.irreducible_m,
            exp_raw_rms_m: pair_data["raw_rms_m"].as_f64().unwrap(),
            exp_rot_residual_m: pair_data["rot_residual_m"].as_f64().unwrap(),
            exp_theta_moon_nrad: pair_data["theta_moon_nrad"].as_f64().unwrap(),
            exp_theta_frametie_nrad: pair_data["theta_frametie_nrad"].as_f64().unwrap(),
            exp_theta_excess_nrad: pair_data["theta_excess_nrad"].as_f64().unwrap(),
            exp_reducible_m: pair_data["reducible_m"].as_f64().unwrap(),
            exp_irreducible_m: pair_data["irreducible_m"].as_f64().unwrap(),
        });
    }

    // ── Print the reproduced three-pair table (visible with --nocapture) ───────

    println!(
        "\n{:<22}  {:>9}  {:>9}  {:>12}  {:>12}",
        "pair", "raw(m)", "rot_res(m)", "reducible(m)", "irreducible(m)"
    );
    println!("{}", "-".repeat(75));
    for r in &results {
        println!(
            "{:<22}  {:>9.4}  {:>9.4}  {:>12.4}  {:>12.4}",
            r.key, r.raw_rms_m, r.rot_residual_m, r.reducible_m, r.irreducible_m
        );
    }
    println!();

    // ── Tolerance macros ───────────────────────────────────────────────────────
    //
    // Standard tolerance: relative < 1e-3 AND absolute < 1e-3 m / < 1e-2 nrad.
    //
    // Exception for INPOP21a–EPM2021 irreducible_m and theta_excess_nrad: the
    // 6-parameter planet rotation fit has condition number ~5.7×10¹⁰ (Mercury orbital
    // radius ÷ translation column magnitude), giving ~2 nrad irreducible numerical noise
    // in the per-planet theta_z estimate.  reference.json was computed by the SciPy
    // SVD oracle at full kernel precision and the Rust Cholesky runs on 3 d.p. CSV data;
    // the two are different realizations of this ~2 nrad noise, differing by ~2.9 nrad
    // in theta_frametie[z].  For INPOP21a–EPM2021, theta_moon ≈ theta_frametie (near-
    // cancellation), so the ~2.9 nrad theta_frametie[z] discrepancy propagates directly
    // into theta_excess and irreducible_m as ~1.8×10⁻³ relative error — just above 1e-3.
    // The widened tolerance (3×10⁻³ / 2×10⁻³) matches the achievable precision for this
    // ill-conditioned quantity with the current fixture data.  All other quantities and
    // all other pairs satisfy 1×10⁻³.

    // Relative error < `$rel_tol` AND absolute error < `$abs_tol` (metre quantities).
    macro_rules! check_m_tol {
        ($r:expr, $label:expr, $got:expr, $exp:expr, $rel_tol:expr, $abs_tol:expr) => {{
            let rel = ($got - $exp).abs() / $exp.abs().max(1e-15);
            let abs = ($got - $exp).abs();
            if rel >= $rel_tol || abs >= $abs_tol {
                eprintln!(
                    "MISMATCH  pair={:<22} qty={:<22} got={:.8e}  exp={:.8e}  \
                     rel={:.3e} (tol={:.0e})  abs={:.3e} m (tol={:.0e})",
                    $r.key, $label, $got, $exp, rel, $rel_tol, abs, $abs_tol
                );
            }
            assert!(
                rel < $rel_tol,
                "pair={} qty={}: relative error {:.3e} >= {:.0e}  (got={:.8e}  exp={:.8e})",
                $r.key,
                $label,
                rel,
                $rel_tol,
                $got,
                $exp
            );
            assert!(
                abs < $abs_tol,
                "pair={} qty={}: absolute error {:.3e} m >= {:.0e} m  (got={:.8e}  exp={:.8e})",
                $r.key,
                $label,
                abs,
                $abs_tol,
                $got,
                $exp
            );
        }};
    }

    // Standard-tolerance metre check.
    macro_rules! check_m {
        ($r:expr, $label:expr, $got:expr, $exp:expr) => {
            check_m_tol!($r, $label, $got, $exp, 1e-3_f64, 1e-3_f64)
        };
    }

    // Relative error < `$rel_tol` AND absolute error < `$abs_tol` (angle quantities, nrad).
    macro_rules! check_nrad_tol {
        ($r:expr, $label:expr, $got:expr, $exp:expr, $rel_tol:expr, $abs_tol:expr) => {{
            let rel = ($got - $exp).abs() / $exp.abs().max(1e-15);
            let abs = ($got - $exp).abs();
            if rel >= $rel_tol || abs >= $abs_tol {
                eprintln!(
                    "MISMATCH  pair={:<22} qty={:<22} got={:.8e}  exp={:.8e}  \
                     rel={:.3e} (tol={:.0e})  abs={:.3e} nrad (tol={:.0e})",
                    $r.key, $label, $got, $exp, rel, $rel_tol, abs, $abs_tol
                );
            }
            assert!(
                rel < $rel_tol,
                "pair={} qty={}: relative error {:.3e} >= {:.0e}  (got={:.8e}  exp={:.8e})",
                $r.key, $label, rel, $rel_tol, $got, $exp
            );
            assert!(
                abs < $abs_tol,
                "pair={} qty={}: absolute error {:.3e} nrad >= {:.0e} nrad  (got={:.8e}  exp={:.8e})",
                $r.key, $label, abs, $abs_tol, $got, $exp
            );
        }};
    }

    // Standard-tolerance angle check.
    macro_rules! check_nrad {
        ($r:expr, $label:expr, $got:expr, $exp:expr) => {
            check_nrad_tol!($r, $label, $got, $exp, 1e-3_f64, 1e-2_f64)
        };
    }

    // ── Per-pair tolerance checks ──────────────────────────────────────────────

    for r in &results {
        check_m!(r, "raw_rms_m", r.raw_rms_m, r.exp_raw_rms_m);
        check_m!(r, "rot_residual_m", r.rot_residual_m, r.exp_rot_residual_m);
        check_m!(r, "reducible_m", r.reducible_m, r.exp_reducible_m);
        check_nrad!(
            r,
            "theta_moon_nrad",
            r.theta_moon_nrad,
            r.exp_theta_moon_nrad
        );
        check_nrad!(
            r,
            "theta_frametie_nrad",
            r.theta_frametie_nrad,
            r.exp_theta_frametie_nrad
        );

        // irreducible_m and theta_excess_nrad hold at the standard 1e-3 tolerance for
        // every pair, including the near-cancelling INPOP21a-EPM2021 split
        // (theta_moon ≈ theta_frametie).  The fixtures and the reference.json oracle are
        // computed from byte-identical 6-decimal inputs (see scripts/gen_interop_ref.py),
        // so the Rust-vs-SciPy difference here is pure solver precision, which the Jacobi
        // preconditioning brings well within 1e-3.  The *physical* sensitivity of this
        // split (a difference of two comparable rotations) is discussed in the manuscript.
        check_m!(r, "irreducible_m", r.irreducible_m, r.exp_irreducible_m);
        check_nrad!(
            r,
            "theta_excess_nrad",
            r.theta_excess_nrad,
            r.exp_theta_excess_nrad
        );
    }

    // ── Sanity anchor (NOTICE.md headline numbers) ─────────────────────────────
    //
    // These hard-coded ±0.05 m bands pin the PHYSICAL result — not just internal
    // consistency — so that the test catches a numerically-plausible but wrong output.

    let de_inp = results
        .iter()
        .find(|r| r.key == "DE440-INPOP21a")
        .expect("DE440-INPOP21a pair must be present");
    assert!(
        (de_inp.raw_rms_m - 2.40).abs() < 0.05,
        "DE440-INPOP21a raw_rms_m ≈ 2.40 m (±0.05); got {:.4}",
        de_inp.raw_rms_m
    );
    assert!(
        (de_inp.irreducible_m - 1.87).abs() < 0.05,
        "DE440-INPOP21a irreducible_m ≈ 1.87 m (±0.05); got {:.4}",
        de_inp.irreducible_m
    );

    let de_epm = results
        .iter()
        .find(|r| r.key == "DE440-EPM2021")
        .expect("DE440-EPM2021 pair must be present");
    assert!(
        (de_epm.irreducible_m - 2.41).abs() < 0.05,
        "DE440-EPM2021 irreducible_m ≈ 2.41 m (±0.05); got {:.4}",
        de_epm.irreducible_m
    );

    let inp_epm = results
        .iter()
        .find(|r| r.key == "INPOP21a-EPM2021")
        .expect("INPOP21a-EPM2021 pair must be present");
    assert!(
        (inp_epm.reducible_m - 1.02).abs() < 0.05,
        "INPOP21a-EPM2021 reducible_m ≈ 1.02 m (±0.05); got {:.4}",
        inp_epm.reducible_m
    );
}
