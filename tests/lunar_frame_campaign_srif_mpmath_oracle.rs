// SPDX-License-Identifier: AGPL-3.0-only
//! Extended-precision oracle (policy P2, an independent numerical library) for the opt-in
//! square-root information solver (`solver = "srif"`) of the lunar frame campaign datum.
//!
//! ## Pre-registration (written 2026-10-02, before the solver was written, the fixture
//! generated or the oracle run)
//!
//! ### Why this comparison exists
//!
//! `tests/lunar_frame_campaign_mpmath_oracle.rs` found the engine's datum sigmas with the
//! stations estimated off the 50-digit answer by up to 9.7e-6, against 9e-9 for a NumPy
//! Cholesky route and 5e-9 for a QR route on the same inputs, and its a-priori bars (formed from
//! the information matrix) four orders of magnitude wide. A solver that never forms the
//! information matrix works with its square root, whose condition number is the square root of
//! the information matrix's; the a-priori bound shrinks by the same factor. This test states that
//! bound now and holds the new solver to it.
//!
//! ### The solver under test (specified now; `src/linalg_sr.rs`, opt-in, default unchanged)
//!
//! 1. Whiten: `Jw = diag(sqrt(w)) J` with the columns ordered `[stations | beacons]`.
//! 2. Square-root information: `R` (n x n, upper triangular) by Householder QR of `Jw`, applied
//!    as a square-root information filter measurement update (each batch of rows is
//!    triangularised together with the current `R`). The trailing beacon block `R_bb` satisfies
//!    `R_bb^T R_bb = S`, the Schur complement of the station block, so the stations are
//!    marginalised without forming or inverting anything.
//! 3. Datum: `B = R_bb A`; `R_H` by Householder QR of `B`, so `R_H^T R_H = H`.
//! 4. Sigmas: `X = R_H^-1` by back substitution; `sigma_k = ||row k of X||`.
//! 5. Spectrum: one-sided Jacobi singular value decomposition of `R_H`; `lambda_i = s_i^2`,
//!    condition `lambda_max / lambda_min`, weakest direction the right singular vector of the
//!    smallest singular value (largest-magnitude component made positive). Rank: `lambda_i >
//!    rel_tol lambda_max`.
//!
//! Inner products use a compensated dot product with an error-free product by the Dekker
//! (Veltkamp) split, so every operation is an IEEE-754 basic operation or square root and the
//! result is a function of the inputs alone, the same bits on every platform; `f64::mul_add`
//! is the reference the split is unit-tested against.
//!
//! ### Inputs
//!
//! `tests/fixtures/lunar_frame_campaign_srif_mpmath_oracle/inputs.json`, written by
//! [`engine_inputs_match_the_committed_fixture`] (Jacobian, weights, station-column count,
//! Helmert design, as in the companion test). Scenarios (the default network; 24 h at 30 min;
//! delay sigma 1e-11 s; masks 10 deg):
//! * `stations_estimated_2026_06_09` (**binding**): a new date by a stated rule, the first day
//!   from 2026-06-01 whose stations-estimated campaign the current engine reports full rank in
//!   both the station block and the Helmert matrix (an engine-only probe read the observation
//!   count, defect and station-block flag of 2026-06-01 to 06-10 and nothing else).
//! * `stations_fixed_2026_06_09` (control).
//! * `stations_estimated_2026_03_18` and `stations_estimated_2024_01_01`: inputs already used by
//!   the companion test with the spectral solver; no srif value has been computed on them.
//!
//! ### Oracle
//!
//! `gen_reference.py` in the fixture folder: **mpmath 1.3.0** (BSD-3-Clause) at 50 digits with
//! the 80-digit self-check (1e-30), reusing the companion oracle's definitions (exact `F`, `S`,
//! `H`, `C`, `Zt`, eigen-decomposition by `mpmath.eigsy`) and adding `R_H` as the Cholesky factor
//! of the exact `H` (`mpmath.cholesky`), `X = R_H^-1`, `trace F` and `trace H`.
//!
//! ### Tolerance (fixed now, before the first comparison)
//!
//! `u = 2^-53`, `c = (3n + 1) n + m n`: `m n` the Householder QR constant (Higham, *Accuracy and
//! Stability of Numerical Algorithms*, 2nd ed., Theorem 19.4: the computed `R` is exact for
//! `A + dA` with `||dA(:, j)|| <= c m n u ||A(:, j)||`) and `(3n + 1) n` the constant of the
//! companion test for the remaining stages. The QR stages are modelled as exact on inputs
//! perturbed by `dJ`, `dB` with `||dJ||_2 <= e_J = c u ||Jw||_F = c u sqrt(trace F)` and
//! `||dB||_2 <= e_B = c u ||B||_F = c u sqrt(trace H)`. For `H = Zt^T F Zt` and `C = H^-1`, a
//! first-order change gives `|dC_kk| <= 2 sqrt(C_kk) ||dJ|| ||Zt C e_k||` (because
//! `||Jw Zt C e_k||^2 = C_kk`), and likewise for `dB`; the triangular inverse has componentwise
//! error at most `c u |X| |R_H| |X|` (Higham, Chapter 8). Hence, relative:
//! * sigma `k`: `1e-12 + (e_J ||Zt C e_k|| + e_B ||C e_k||) / sqrt(C_kk)
//!   + c u ||row k of |X||R_H||X| || / ||row k of X||`;
//! * eigenvalue `lambda` with unit eigenvector `v`:
//!   `t(lambda) = 2 (e_J ||Zt v|| + e_B + c u sqrt(lambda_max)) / sqrt(lambda)` (the last term
//!   the backward error of the singular value decomposition, `c u ||R_H||_2`); condition number:
//!   `1e-12 + t(lambda_min) + t(lambda_max)`;
//! * weakest direction, radians: `1e-12 + 2 sqrt(lambda_max) (e_J ||Zt||_2 + e_B
//!   + c u sqrt(lambda_max)) / (lambda_2 - lambda_1)` (Davis–Kahan).
//!
//! Every quantity of every scenario must pass, the report must say the srif solver produced
//! the datum, and the Helmert matrix must be full rank. A failure is a finding about the new
//! solver; the bar is not to be moved.
//!
//! ### What this validates
//!
//! The opt-in solver's datum sigmas, condition number and weakest direction against the exact
//! answer on committed inputs, within the a-priori bound of a square-root (orthogonal
//! factorisation) pipeline. Not the Jacobian, not any physical accuracy, and nothing about the
//! default spectral solver, which is unchanged.
//!
//! ## Result (recorded 2026-10-02, not tuned)
//!
//! Pre-registration commit `b41908c9` (pushed 2026-10-02 16:19 UTC) precedes the solver, the
//! fixture and the oracle run. Oracle self-agreement 1.4e-43 or better.
//!
//! **Every pre-registered check passes on all four scenarios.**
//! * `stations_estimated_2026_06_09` (binding; Helmert condition 6.6e8): datum sigmas within
//!   9.1e-15 to 3.0e-13 against bars 4.1e-7 to 5.3e-7; condition 1.1e-13 against 1.1e-6;
//!   weakest direction 2.6e-14 rad against 3.5e-2.
//! * `stations_fixed_2026_06_09` (control): sigmas within 1.9e-15 against bars down to 4.8e-12;
//!   condition 2.1e-15 against 1.2e-9; weakest direction 1.7e-16 rad against 5.1e-10.
//! * `stations_estimated_2026_03_18`: sigmas within 3.8e-13 (spectral solver on the same
//!   inputs: 4.8e-6); condition 1.2e-13; weakest direction 1.4e-13 rad.
//! * `stations_estimated_2024_01_01`: sigmas within 2.3e-13 (spectral: 9.7e-6); condition
//!   4.9e-13; weakest direction 2.2e-14 rad.
//!
//! The square-root solver is seven to eight orders of magnitude more accurate than the spectral
//! one on these inputs, and its bars sit five to six orders below the information-form bars of
//! the companion test.
//!
//! **Disclosures.** (1) Weakest-direction measurement: the comparator was first written as
//! `acos` of the cosine, which cannot resolve angles below about 1.5e-8 rad and so read 0 on every
//! scenario; it now measures the chord between the sign-aligned unit vectors. The bar is
//! unchanged, the change only makes the measured angle accurate, and the same fix is made in the
//! companion test. (2) Before this record was written, `src/linalg_sr.rs` was found carrying three
//! unreviewed edits that did not match the pre-registered algorithm (a plain dot product in
//! place of the compensated one, a flipped Householder sign, and sigmas from a spectral inverse
//! instead of the row norms of `R_H^-1`), consistent with mutation experiments that were not
//! reverted. They were removed and the comparison re-run; every figure above is bit-for-bit what
//! the run before the edits were found printed.
//!
//! **Mutations (each applied to the restored solver, run, reverted).** (1) The Jacobi singular
//! value decomposition limited to one sweep: red (8 failures; weakest direction 0.76 rad against
//! 3.5e-2, condition off by 0.92). (2) The whitening `sqrt(w)` scaled by `1 + 1e-6`: red (28
//! failures; every sigma off by 1.0e-6 against bars down to 1.9e-7). (3) A flipped Householder
//! sign: stays green (largest sigma error 3.8e-13, unchanged: on these columns the diagonal does
//! not dominate, so the classical cancellation does not occur). (4) A plain dot product in
//! place of the compensated one: stays green (1.1e-12). Neither (3) nor (4) degrades the result
//! measurably on these inputs, so no bar of this form could see them; recorded as the limit of
//! the check, which detects datum errors above about 2e-7 relative.

use kshana::lunar_frame_campaign::{
    campaign_jacobian_row, helmert_design, LunarFrameCampaignScenario,
};

type J = serde_json::Value;

/// Unit roundoff of binary64, `2^-53`.
const UNIT_ROUNDOFF: f64 = 1.110_223_024_625_156_5e-16;
/// Absolute floor added to every relative bar.
const FLOOR: f64 = 1e-12;
/// Agreement required between the oracle's 50-digit and 80-digit runs.
const ORACLE_SELF_AGREEMENT: f64 = 1e-30;

const FIXTURE_DIR: &str = "tests/fixtures/lunar_frame_campaign_srif_mpmath_oracle";

/// A scenario built through deserialisation, as a TOML input would build it.
fn scenario(y: i32, mo: u32, d: u32, estimated: bool, srif: bool) -> LunarFrameCampaignScenario {
    let mut v = serde_json::json!({
        "epoch_year": y,
        "epoch_month": mo,
        "epoch_day": d,
    });
    if estimated {
        v["station_datum"] = J::from("estimated-anchor-first");
    }
    if srif {
        v["solver"] = J::from("srif");
    }
    serde_json::from_value(v).expect("scenario")
}

/// The compared scenarios, in fixture order, with the srif solver selected.
fn scenarios(srif: bool) -> Vec<(&'static str, LunarFrameCampaignScenario)> {
    vec![
        (
            "stations_estimated_2026_06_09",
            scenario(2026, 6, 9, true, srif),
        ),
        (
            "stations_fixed_2026_06_09",
            scenario(2026, 6, 9, false, srif),
        ),
        (
            "stations_estimated_2026_03_18",
            scenario(2026, 3, 18, true, srif),
        ),
        (
            "stations_estimated_2024_01_01",
            scenario(2024, 1, 1, true, srif),
        ),
    ]
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

/// The committed inputs are exactly what the engine builds now (the solver does not change
/// them). With `KSHANA_WRITE_MPMATH_FIXTURE=1` it writes them instead (the fixture generator).
#[test]
fn engine_inputs_match_the_committed_fixture() {
    let built: Vec<J> = scenarios(false)
        .iter()
        .map(|(name, sc)| engine_inputs(name, sc))
        .collect();
    let doc = serde_json::json!({
        "generator": "tests/lunar_frame_campaign_srif_mpmath_oracle.rs::engine_inputs_match_the_committed_fixture",
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

fn engine_sigma(v: &J) -> Vec<f64> {
    let acc = &v["datum_accuracy"];
    let mut s = fv(&acc["translation_sigma_m"]);
    s.extend(fv(&acc["rotation_sigma_urad"]));
    s.push(f(&acc["scale_sigma_ppb"]) / 1e3);
    s
}

/// The angle (rad) between two directions, from the chord between the sign-aligned unit vectors:
/// `2 asin(|e/|e| - s o/|o|| / 2)`. Unlike `acos` of the cosine, it resolves angles below
/// `sqrt(2u)`, about 1.5e-8 rad.
fn direction_angle(e: &[f64], o: &[f64]) -> f64 {
    let norm = |x: &[f64]| x.iter().map(|a| a * a).sum::<f64>().sqrt();
    let (ne, no) = (norm(e), norm(o));
    let dot: f64 = e.iter().zip(o).map(|(a, b)| a * b).sum();
    let s = if dot < 0.0 { -1.0 } else { 1.0 };
    let chord = e
        .iter()
        .zip(o)
        .map(|(a, b)| (a / ne - s * b / no).powi(2))
        .sum::<f64>()
        .sqrt();
    2.0 * (chord / 2.0).min(1.0).asin()
}

fn rel(a: f64, b: f64) -> f64 {
    (a - b).abs() / b.abs()
}

/// The comparison of one scenario: `(label, error, bar)` rows.
fn compare(name: &str, sc: &LunarFrameCampaignScenario, r: &J) -> Vec<(String, f64, f64)> {
    let v = report(sc);
    let helm = &v["helmert"];
    assert_eq!(
        helm["solver_effective"].as_str(),
        Some("srif"),
        "{name}: the srif solver did not produce the datum"
    );
    assert_eq!(
        helm["defect"].as_u64(),
        Some(0),
        "{name}: full rank expected"
    );
    assert!(
        f(&r["self_agreement_50_vs_80_digits"]) <= ORACLE_SELF_AGREEMENT,
        "{name}: the oracle does not agree with itself at 80 digits"
    );
    let n = r["n"].as_u64().expect("n") as f64;
    let m = r["m"].as_u64().expect("m") as f64;
    let cu = ((3.0 * n + 1.0) * n + m * n) * UNIT_ROUNDOFF;
    let e_j = cu * f(&r["trace_F"]).sqrt();
    let e_b = cu * f(&r["trace_H"]).sqrt();

    let mut rows = Vec::new();
    let es = engine_sigma(&v);
    let os = fv(&r["sigma"]);
    let (zt_ce, ce, tri) = (
        fv(&r["zt_c_e_norm"]),
        fv(&r["c_e_norm"]),
        fv(&r["triangular_inverse_term"]),
    );
    for k in 0..7 {
        let bar = FLOOR + (e_j * zt_ce[k] + e_b * ce[k]) / os[k] + cu * tri[k];
        rows.push((format!("{name}: sigma[{k}]"), rel(es[k], os[k]), bar));
    }
    let lmax = f(&r["lambda_max"]["lambda"]);
    let t = |key: &str| {
        let e = &r[key];
        2.0 * (e_j * f(&e["zt_v_norm"]) + e_b + cu * lmax.sqrt()) / f(&e["lambda"]).sqrt()
    };
    let bar = FLOOR + t("lambda_min") + t("lambda_max");
    rows.push((
        format!("{name}: condition"),
        rel(f(&helm["condition_number"]), f(&r["condition"])),
        bar,
    ));
    let ew = fv(&helm["weakest_direction"]["direction"]);
    let ow = fv(&r["weakest_direction"]);
    let ang = direction_angle(&ew, &ow);
    let bar = FLOOR
        + 2.0 * lmax.sqrt() * (e_j * f(&r["zt_norm"]) + e_b + cu * lmax.sqrt())
            / f(&r["eigengap_lambda2_minus_lambda1"]);
    rows.push((format!("{name}: weakest direction (rad)"), ang, bar));
    rows
}

/// The strict pre-registered comparison.
#[test]
fn srif_datum_matches_mpmath_extended_precision() {
    let reference = fixture("reference.json");
    let refs = reference["scenarios"].as_array().expect("scenarios");
    let scs = scenarios(true);
    assert_eq!(refs.len(), scs.len());
    let mut failures = Vec::new();
    for ((name, sc), r) in scs.iter().zip(refs) {
        assert_eq!(r["name"].as_str(), Some(*name));
        for (label, err, bar) in compare(name, sc, r) {
            eprintln!("{label}: error {err:.3e} bar {bar:.3e}");
            // NaN fails too.
            if err.is_nan() || err > bar {
                failures.push(format!("{label}: error {err:.3e} > bar {bar:.3e}"));
            }
        }
    }
    assert!(failures.is_empty(), "{}", failures.join("\n"));
}
