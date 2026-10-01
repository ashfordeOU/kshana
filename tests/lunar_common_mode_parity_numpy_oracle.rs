// SPDX-License-Identifier: AGPL-3.0-only
//! Discriminating numpy oracle for the common-mode split (`kshana::lunar_common_mode`,
//! verification row "Common-mode integrity blindness").
//!
//! Why a new comparison: the earlier test (`tests/lunar_common_mode_integrity_reference.rs`)
//! fed only `δy = E·Δs`, which lies exactly in `range(G)`. On such an input every left inverse
//! of `G` gives the same answer, so that test could not tell least squares from a wrong
//! (oblique) projector; a 2026-10-01 verifier showed the oblique mutant left it green. This
//! comparison feeds inputs with a real parity part, so the answer depends on the projector.
//!
//! Pre-registration (validation 0.30, round 2, batch "tools"; written 2026-10-01 before the
//! fixture below was generated and before numpy was run on it).
//!
//! Quantity: `common_mode_split(G, δy)` — the absorbed state error `blind_dx = S·δy`
//! (`S = (GᵀG)⁻¹Gᵀ`), the parity residual `r = δy − G·blind_dx`, `blind_norm = ‖G·blind_dx‖`,
//! `detectable_norm = ‖r‖` and `blind_fraction = blind_norm / ‖δy‖`, with `G` built by
//! `geometry_from_los` from the committed user and satellite positions.
//!
//! Inputs (`tests/fixtures/lunar_common_mode_parity_numpy_oracle/inputs.json`, written by
//! `make_fixture.py`): the 8-satellite lunar geometry of the earlier fixture, and a 6-satellite
//! subset of it (satellites 1 to 6, 2 degrees of freedom); for each of the 366 epochs of each of
//! the two real inter-ephemeris pairs (DE440 − INPOP21a, DE440 − EPM2021, from
//! `tests/fixtures/inter_ephemeris/moon_geo.csv`), `δyᵢ = eᵢ·Δs + wᵢ`, where `wᵢ` is an
//! independent per-satellite error drawn once from numpy `default_rng(20261001)`, normal with
//! standard deviation 1 m. 1464 cases in all. Every `δy` is stored with 17 significant digits
//! and read verbatim by both sides.
//!
//! Oracle: numpy 2.x `linalg.lstsq` (LAPACK `gelsd`, singular value decomposition; BSD-3-Clause),
//! which solves the least-squares problem by a different algorithm from the engine's normal
//! equations and Gauss-Jordan `invert4`; `blind_dx` is the `lstsq` solution and the other four
//! quantities follow from it in numpy.
//!
//! Tolerance (fixed now): on every case, with `s = ‖δy‖`,
//! - `‖blind_dx − blind_dx_np‖ ≤ 1e-12·s`, `‖r − r_np‖ ≤ 1e-12·s`;
//! - `|blind_norm − blind_norm_np| ≤ 1e-12·s`, `|detectable_norm − detectable_norm_np| ≤ 1e-12·s`;
//! - `|blind_fraction − blind_fraction_np| ≤ 1e-12`.
//!
//! Precondition (checked on the oracle side, so the test is discriminating): every case has a
//! parity part, `detectable_norm_np / s ≥ 0.05`.
//!
//! Discrimination check, pre-registered: replacing the engine's state map with the oblique left
//! inverse `S' = S + K·(I − G·S)`, `K[i][c] = 0.05·sin(1 + i + 2c)` (a 4 × n matrix that is not
//! least squares, but still satisfies `S'·G = I`, which kept the earlier test green), must turn
//! this test red.

use kshana::lunar_common_mode::{common_mode_split, geometry_from_los};
use std::path::PathBuf;

const TOL_REL_INPUT: f64 = 1e-12;
const MIN_PARITY_FRACTION: f64 = 0.05;
const N_CASES: usize = 1464;

fn fixture(name: &str) -> serde_json::Value {
    let p = PathBuf::from(env!("CARGO_MANIFEST_DIR"))
        .join("tests/fixtures/lunar_common_mode_parity_numpy_oracle")
        .join(name);
    let s = std::fs::read_to_string(&p).unwrap_or_else(|e| panic!("{}: {e}", p.display()));
    serde_json::from_str(&s).expect("valid JSON")
}

fn f64s(v: &serde_json::Value) -> Vec<f64> {
    v.as_array()
        .expect("array")
        .iter()
        .map(|x| x.as_f64().expect("number"))
        .collect()
}

fn dist(a: &[f64], b: &[f64]) -> f64 {
    assert_eq!(a.len(), b.len());
    a.iter()
        .zip(b)
        .map(|(x, y)| (x - y) * (x - y))
        .sum::<f64>()
        .sqrt()
}

#[test]
#[ignore = "pre-registered; not yet run"]
fn common_mode_split_matches_numpy_lstsq_on_parity_bearing_inputs() {
    let inputs = fixture("inputs.json");
    let oracle = fixture("numpy_reference.json");
    let user = f64s(&inputs["user"]);
    let user = [user[0], user[1], user[2]];
    let geometries: Vec<Vec<[f64; 4]>> = inputs["geometries"]
        .as_array()
        .expect("geometries")
        .iter()
        .map(|sat_idx| {
            let sats: Vec<[f64; 3]> = sat_idx
                .as_array()
                .unwrap()
                .iter()
                .map(|i| {
                    let s = f64s(&inputs["sats"][i.as_u64().unwrap() as usize]);
                    [s[0], s[1], s[2]]
                })
                .collect();
            geometry_from_los(user, &sats).expect("full-rank geometry")
        })
        .collect();
    let cases = inputs["cases"].as_array().expect("cases");
    let refs = oracle["cases"].as_array().expect("oracle cases");
    assert_eq!(cases.len(), N_CASES);
    assert_eq!(refs.len(), N_CASES);

    let (mut w_dx, mut w_r, mut w_bn, mut w_dn, mut w_bf, mut min_par) =
        (0.0f64, 0.0f64, 0.0f64, 0.0f64, 0.0f64, f64::INFINITY);
    for (k, (c, o)) in cases.iter().zip(refs).enumerate() {
        let g = &geometries[c["geometry"].as_u64().unwrap() as usize];
        let dy = f64s(&c["delta_y"]);
        let s = dy.iter().map(|x| x * x).sum::<f64>().sqrt();
        let np_dx = f64s(&o["blind_dx"]);
        let np_r = f64s(&o["residual"]);
        let np_bn = o["blind_norm"].as_f64().unwrap();
        let np_dn = o["detectable_norm"].as_f64().unwrap();
        let np_bf = o["blind_fraction"].as_f64().unwrap();
        assert!(
            np_dn / s >= MIN_PARITY_FRACTION,
            "case {k}: precondition, parity fraction {}",
            np_dn / s
        );
        min_par = min_par.min(np_dn / s);
        let split = common_mode_split(g, &dy).expect("split");
        let e_dx = dist(&split.blind_dx, &np_dx) / s;
        let e_r = dist(&split.detectable_residual, &np_r) / s;
        let e_bn = (split.blind_norm - np_bn).abs() / s;
        let e_dn = (split.detectable_norm - np_dn).abs() / s;
        let e_bf = (split.blind_fraction - np_bf).abs();
        w_dx = w_dx.max(e_dx);
        w_r = w_r.max(e_r);
        w_bn = w_bn.max(e_bn);
        w_dn = w_dn.max(e_dn);
        w_bf = w_bf.max(e_bf);
        assert!(
            e_dx <= TOL_REL_INPUT,
            "case {k}: blind_dx off by {e_dx:.3e}·‖δy‖"
        );
        assert!(
            e_r <= TOL_REL_INPUT,
            "case {k}: residual off by {e_r:.3e}·‖δy‖"
        );
        assert!(
            e_bn <= TOL_REL_INPUT,
            "case {k}: blind_norm off by {e_bn:.3e}·‖δy‖"
        );
        assert!(
            e_dn <= TOL_REL_INPUT,
            "case {k}: detectable_norm off by {e_dn:.3e}·‖δy‖"
        );
        assert!(
            e_bf <= TOL_REL_INPUT,
            "case {k}: blind_fraction off by {e_bf:.3e}"
        );
    }
    println!(
        "worst (relative to ‖δy‖): blind_dx {w_dx:.3e}, residual {w_r:.3e}, blind_norm {w_bn:.3e}, \
         detectable_norm {w_dn:.3e}; blind_fraction {w_bf:.3e}; smallest parity fraction {min_par:.3}"
    );
}
