// SPDX-License-Identifier: AGPL-3.0-only
//! Extended-precision oracle (policy P2, an independent numerical library) for the discrete
//! rank decisions of the stations-estimated lunar frame campaign: are the day-to-day changes in
//! the Helmert datum defect a property of the geometry or an artefact of the engine's
//! double-precision arithmetic?
//!
//! ## Pre-registration (written 2026-10-02, before the fixture was generated or the oracle run)
//!
//! ### Why this comparison exists
//!
//! An engine-only probe run while choosing the campaign date of
//! `tests/lunar_frame_campaign_mpmath_oracle.rs` (observation count, Helmert defect and
//! `station_block_full_rank` per day, stations estimated, 2026-03-15 to 2026-04-23) showed the
//! defect changing from day to day, including defect 1 on 2026-03-21 to 2026-03-25 with 68 to 80
//! observations, more than on neighbouring full-rank days. The engine declares a direction
//! unobservable when its eigenvalue is at most `rel_tol = 1e-9` of the largest, and the Helmert
//! matrix there has a condition number of about 2e8, close to that threshold, while the engine's
//! eigenvalues carry errors of about 1e-5 relative (measured in the companion test). Whether
//! the flips are geometric or arithmetic is not known; the probe read no oracle value and no
//! datum sigma.
//!
//! ### Quantities
//!
//! For each of the 40 days 2026-03-15 to 2026-04-23 (campaign start 00:00 UTC; the default
//! network of three stations and four beacons; 24 h at 30 min; delay sigma 1e-11 s; masks 10
//! deg; station datum `estimated-anchor-first`):
//! 1. the station-block decision, the engine's `station_datum.station_block_full_rank`;
//! 2. the Helmert defect, the engine's `helmert.defect`.
//!
//! ### Inputs and oracle
//!
//! Inputs as in the companion test: per day the engine's delay Jacobian `J`, weights `W`, the
//! number of station columns `s` and the Helmert design `A`, written by
//! [`engine_inputs_match_the_committed_fixture`] to
//! `tests/fixtures/lunar_frame_campaign_rank_mpmath_oracle/inputs.json`. The oracle,
//! `gen_reference.py` in that folder, uses **mpmath 1.3.0** (BSD-3-Clause) at 50 digits, with
//! the same 80-digit self-check (1e-30) as the companion test: the eigenvalues `mu_j` of the
//! exact station block `F_ss`; where `F_ss` is decided full rank (below), the exact Schur
//! complement `S`, `H = A^T S A`, its eigenpairs `(lambda_j, v_j)` by `mpmath.eigsy`, and the
//! bar ingredients `a_F`, `a_S`, `a_H`, `||Zt v_j||^2`, `||A v_j||^2`, all defined exactly as in
//! `tests/lunar_frame_campaign_mpmath_oracle.rs`.
//!
//! ### Decision rule (fixed now, before the first comparison)
//!
//! With `u = 2^-53` and `c = (3n + 1) n + m` per day, the engine's eigenvalues are taken to lie
//! within absolute bounds of the exact ones (Weyl's inequality applied to the backward-error
//! model of the companion test): `e_s = c u a_F` for every `mu_j`, and
//! `e_j = c u (a_F ||Zt v_j||^2 + a_S ||A v_j||^2 + a_H)` for `lambda_j`. An exact eigenvalue `x`
//! with bound `e`, against the largest `x_max` with bound `e_max`, is
//! * **decided observable** when `x - e > 1e-9 (x_max + e_max)`;
//! * **decided unobservable** when `x + e < 1e-9 (x_max - e_max)`;
//! * **undecided** otherwise (the engine may legitimately land on either side).
//!
//! The station block is decided when every `mu_j` is decided; the oracle's decision is then "full
//! rank" if none is decided unobservable. The Helmert matrix is compared only on days whose
//! station block the oracle decides full rank (otherwise the engine's Schur complement leans on a
//! pseudo-inverse and is a different quantity), and is decided when every `lambda_j` is decided;
//! the oracle's defect is the number decided unobservable.
//!
//! **Pass criterion:** on every day, each decided oracle decision equals the engine's. Undecided
//! items are counted and reported, never asserted. A mismatch on a decided item is a finding:
//! the engine's arithmetic would have moved a discrete answer by more than its error bound allows.
//!
//! ### What this answers
//!
//! If every decided day matches, the defect changes the probe saw are a property of the exact
//! information matrix of the stated campaign at the stated `rel_tol`, not of the engine's
//! arithmetic: a geometric fact about the illustrative schedule. It does not validate the
//! choice of `rel_tol`, which is a design choice with no external truth.

use kshana::lunar_frame_campaign::{
    campaign_jacobian_row, helmert_design, LunarFrameCampaignScenario,
};

type J = serde_json::Value;

/// Unit roundoff of binary64, `2^-53`.
const UNIT_ROUNDOFF: f64 = 1.110_223_024_625_156_5e-16;
/// The engine's rank threshold, relative to the largest eigenvalue.
const REL_TOL: f64 = 1e-9;
/// Agreement required between the oracle's 50-digit and 80-digit runs.
const ORACLE_SELF_AGREEMENT: f64 = 1e-30;

const FIXTURE_DIR: &str = "tests/fixtures/lunar_frame_campaign_rank_mpmath_oracle";

/// The 40 compared days, 2026-03-15 to 2026-04-23, stations estimated.
fn days() -> Vec<(String, LunarFrameCampaignScenario)> {
    let mut out = Vec::new();
    let (mut month, mut day) = (3u32, 15u32);
    for _ in 0..40 {
        out.push((
            format!("2026-{month:02}-{day:02}"),
            LunarFrameCampaignScenario {
                epoch_year: Some(2026),
                epoch_month: Some(month),
                epoch_day: Some(day),
                station_datum: Some("estimated-anchor-first".to_string()),
                ..Default::default()
            },
        ));
        day += 1;
        let len = if month == 3 { 31 } else { 30 };
        if day > len {
            day = 1;
            month += 1;
        }
    }
    out
}

fn fixture_path(name: &str) -> String {
    format!("{}/{FIXTURE_DIR}/{name}", env!("CARGO_MANIFEST_DIR"))
}

fn fixture(name: &str) -> J {
    let path = fixture_path(name);
    let text = std::fs::read_to_string(&path).unwrap_or_else(|e| panic!("read {path}: {e}"));
    serde_json::from_str(&text).expect("json")
}

fn f(v: &J) -> f64 {
    v.as_f64()
        .unwrap_or_else(|| panic!("expected a number, got {v}"))
}

fn fv(v: &J) -> Vec<f64> {
    v.as_array()
        .unwrap_or_else(|| panic!("expected an array, got {v}"))
        .iter()
        .map(f)
        .collect()
}

fn report(sc: &LunarFrameCampaignScenario) -> J {
    let (json, _) = sc.run_json().expect("scenario runs");
    serde_json::from_str(&json).expect("report json")
}

fn engine_inputs(name: &str, sc: &LunarFrameCampaignScenario) -> J {
    let v = report(sc);
    let sched = sc.schedule().expect("schedule");
    let n_sc = v["station_datum"]["n_station_columns"]
        .as_u64()
        .expect("n_station_columns") as usize;
    let dim = n_sc + 3 * sched.geoms.len();
    let jac: Vec<Vec<f64>> = sched
        .observations
        .iter()
        .map(|&o| campaign_jacobian_row(&sched.geoms[o.beacon][o.epoch], n_sc, o, dim))
        .collect();
    let sigma = f(&v["campaign"]["delay_sigma_s"]);
    let points: Vec<kshana::precession::Vec3> = v["campaign"]["beacons"]
        .as_array()
        .expect("beacons")
        .iter()
        .map(|b| {
            kshana::lunar::selenographic_to_mcmf(kshana::lunar::Selenographic {
                lat_rad: f(&b["lat_deg"]).to_radians(),
                lon_rad: f(&b["lon_deg"]).to_radians(),
                alt_m: f(&b["alt_m"]),
            })
        })
        .collect();
    serde_json::json!({
        "name": name,
        "n_station_columns": n_sc,
        "weights": vec![1.0 / (sigma * sigma); jac.len()],
        "engine_jacobian": jac,
        "helmert_design": helmert_design(&points),
    })
}

/// The committed inputs are exactly what the engine builds now. With
/// `KSHANA_WRITE_MPMATH_FIXTURE=1` it writes them instead (the fixture generator).
#[test]
#[ignore = "pre-registered; not yet run"]
fn engine_inputs_match_the_committed_fixture() {
    let built: Vec<J> = days()
        .iter()
        .map(|(name, sc)| engine_inputs(name, sc))
        .collect();
    let doc = serde_json::json!({
        "generator": "tests/lunar_frame_campaign_rank_mpmath_oracle.rs::engine_inputs_match_the_committed_fixture",
        "scenarios": built,
    });
    if std::env::var("KSHANA_WRITE_MPMATH_FIXTURE").as_deref() == Ok("1") {
        let path = fixture_path("inputs.json");
        std::fs::write(
            &path,
            serde_json::to_string(&doc).expect("serialise") + "\n",
        )
        .unwrap_or_else(|e| panic!("write {path}: {e}"));
        return;
    }
    assert_eq!(
        fixture("inputs.json")["scenarios"],
        doc["scenarios"],
        "the engine no longer builds the committed inputs"
    );
}

/// The decision on one exact eigenvalue: `Some(true)` decided observable, `Some(false)` decided
/// unobservable, `None` undecided.
fn decide(x: f64, e: f64, x_max: f64, e_max: f64) -> Option<bool> {
    if x - e > REL_TOL * (x_max + e_max) {
        Some(true)
    } else if x + e < REL_TOL * (x_max - e_max) {
        Some(false)
    } else {
        None
    }
}

/// Decisions on a set of eigenvalues with bounds: `Some(number unobservable)` when all decided.
fn decided_defect(values: &[f64], bounds: &[f64]) -> Option<usize> {
    let k = values
        .iter()
        .enumerate()
        .fold(0, |b, (i, v)| if *v > values[b] { i } else { b });
    let mut defect = 0;
    for (x, e) in values.iter().zip(bounds) {
        match decide(*x, *e, values[k], bounds[k]) {
            Some(true) => {}
            Some(false) => defect += 1,
            None => return None,
        }
    }
    Some(defect)
}

/// The strict pre-registered comparison: every decided rank decision on every day equals the
/// engine's.
#[test]
#[ignore = "pre-registered; not yet run"]
fn rank_decisions_match_mpmath_extended_precision() {
    let reference = fixture("reference.json");
    let refs = reference["scenarios"].as_array().expect("scenarios");
    let days = days();
    assert_eq!(refs.len(), days.len());
    let mut failures = Vec::new();
    let (mut undecided_station, mut undecided_helmert, mut compared) = (0, 0, 0);
    for ((name, sc), r) in days.iter().zip(refs) {
        assert_eq!(r["name"].as_str(), Some(name.as_str()));
        assert!(
            f(&r["self_agreement_50_vs_80_digits"]) <= ORACLE_SELF_AGREEMENT,
            "{name}: the oracle does not agree with itself at 80 digits"
        );
        let v = report(sc);
        let n = r["n"].as_u64().expect("n") as f64;
        let m = r["m"].as_u64().expect("m") as f64;
        let cu = ((3.0 * n + 1.0) * n + m) * UNIT_ROUNDOFF;
        let a_f = f(&r["a_F"]);

        let mu = fv(&r["station_eigenvalues"]);
        let e_s = vec![cu * a_f; mu.len()];
        let engine_full = v["station_datum"]["station_block_full_rank"]
            .as_bool()
            .expect("station_block_full_rank");
        let engine_defect = v["helmert"]["defect"].as_u64().expect("defect") as usize;
        let station = decided_defect(&mu, &e_s);
        eprintln!(
            "{name}: station block oracle {:?} engine full_rank {engine_full}; Helmert engine defect {engine_defect}",
            station.map(|d| d == 0)
        );
        match station {
            None => {
                undecided_station += 1;
                continue;
            }
            Some(d) if (d == 0) != engine_full => {
                failures.push(format!(
                    "{name}: station block oracle full_rank {} engine {engine_full}",
                    d == 0
                ));
                continue;
            }
            Some(d) if d > 0 => continue,
            Some(_) => {}
        }
        let (a_s, a_h) = (f(&r["a_S"]), f(&r["a_H"]));
        let eig = r["helmert_eigen"].as_array().expect("helmert_eigen");
        let lam: Vec<f64> = eig.iter().map(|e| f(&e["lambda"])).collect();
        let bounds: Vec<f64> = eig
            .iter()
            .map(|e| cu * (a_f * f(&e["zt_v_sq"]) + a_s * f(&e["a_v_sq"]) + a_h))
            .collect();
        match decided_defect(&lam, &bounds) {
            None => undecided_helmert += 1,
            Some(d) => {
                compared += 1;
                eprintln!("{name}: Helmert oracle defect {d}");
                if d != engine_defect {
                    failures.push(format!(
                        "{name}: Helmert defect oracle {d} engine {engine_defect}"
                    ));
                }
            }
        }
    }
    eprintln!(
        "compared {compared} Helmert decisions; undecided: {undecided_station} station blocks, \
         {undecided_helmert} Helmert matrices"
    );
    assert!(failures.is_empty(), "{}", failures.join("\n"));
}
