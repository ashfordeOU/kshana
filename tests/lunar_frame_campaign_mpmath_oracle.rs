// SPDX-License-Identifier: AGPL-3.0-only
//! Extended-precision oracle (policy P2, an independent numerical library) for the datum
//! covariance of the row "Lunar frame datum from an observing campaign" with the Earth stations
//! estimated.
//!
//! ## Pre-registration (written 2026-10-02, before the fixture was generated or the oracle run)
//!
//! ### Why this comparison exists
//!
//! `tests/lunar_vlbi_campaign_spice_oracle.rs` compared the engine with NumPy (double precision)
//! on the stations-estimated scenario of 2024-01-01 against a fixed 1e-9 bar and missed by 6.8e-6
//! (datum sigma). That bar rested on a wrong condition-number premise: the seven-parameter
//! Helmert information matrix there has condition number 2.1e8 and the joint station-and-beacon
//! information matrix has eigenvalues down to 6.4e-13 of the largest, and four NumPy routes to the
//! same Schur complement disagree with one another by about 3e-6. Double precision cannot say
//! which side is inaccurate. This test replaces the double-precision oracle with a 50-digit one,
//! so the oracle's own rounding is some thirty orders of magnitude below the quantity compared,
//! and replaces the fixed bar with a condition-scaled bar derived from an a-priori backward-error
//! formula (the form used for the ill-conditioned "Tier B" cases of
//! `tests/gls_outside_omega_bound_numpy_oracle.rs`). The bar is a formula of the inputs, written
//! below before any number of this comparison exists; it is not derived from the 3e-6 spread.
//!
//! ### Quantities
//!
//! For each scenario, from the engine's `lunar-frame-campaign` report:
//! 1. the seven datum standard deviations `sigma_k = sqrt(C_kk)`, `C = H^-1`, in the engine's
//!    balanced units (translation m, rotation microradian, scale parts per million);
//! 2. the condition number `lambda_max / lambda_min` of the Helmert information matrix `H`;
//! 3. the weakest direction (unit eigenvector of `lambda_min`), compared as an angle.
//!
//! ### Inputs (committed with the fixture, read as exact binary64 values)
//!
//! `tests/fixtures/lunar_frame_campaign_mpmath_oracle/inputs.json`, written by
//! [`engine_inputs_match_the_committed_fixture`] from the engine: per scenario the delay Jacobian
//! `J` (m x n, s/m), the weights `W = 1/sigma_tau^2` (s^-2), the number `s` of station columns
//! (station 0 anchored) and the Helmert design `A` (3N x 7). The oracle never sees an engine
//! output, only these inputs. Scenarios (the default network: three stations, four beacons, 24 h
//! at 30 min, delay sigma 1e-11 s, masks 10 deg):
//! * `stations_estimated_2026_03_18`: station datum `estimated-anchor-first`, campaign starting
//!   2026-03-18 00:00 UTC. **A new campaign date; no comparison of any kind has been run on it.**
//!   This is the binding scenario for the record. Date rule, disclosed: 2026-03-15 was chosen
//!   first, and an engine-only feasibility probe (observation count, Helmert defect and
//!   `station_block_full_rank` per day, nothing else read) found its datum rank-deficient (21
//!   observations, defect 1), so the date is the first day from 2026-03-15 on whose campaign the
//!   engine reports full rank in both the station block and the Helmert matrix: 2026-03-18 (48
//!   observations). No datum sigma, condition number or oracle value was looked at.
//! * `stations_fixed_2026_03_18`: the same date with the stations held fixed (a well-conditioned
//!   control: the bar collapses to near the 1e-12 floor, so it checks the oracle and the formula
//!   end to end where the engine is expected to be accurate).
//! * `stations_estimated_2024_01_01`: the scenario of the earlier miss. Disclosed: its
//!   engine-against-NumPy gap (6.8e-6) has been seen; its extended-precision answer has not. It is
//!   asserted with the same formula, but the record rests on the 2026-03-15 scenario.
//!
//! ### Oracle
//!
//! `tests/fixtures/lunar_frame_campaign_mpmath_oracle/gen_reference.py`, run as a separate
//! program, never linked in: **mpmath 1.3.0** (BSD-3-Clause) at 50 significant decimal digits
//! (`mp.dps = 50`). From the committed inputs it forms `F = J^T W J`, the Schur complement
//! `S = F_bb - F_sb^T F_ss^-1 F_sb` (stations marginalised; `S = F_bb` when `s = 0`) by mpmath's
//! own LU solve (`mpmath.lu_solve`), `H = A^T S A`, `C = H^-1` by `mpmath.inverse`, and the
//! eigen-decomposition of `H` by `mpmath.eigsy` (Jacobi). The engine uses cyclic Jacobi in binary64
//! with a spectral (pseudo-)inverse, including for `F_ss`. The oracle validates itself: the whole
//! computation is repeated at 80 digits and every compared quantity, and every ingredient of the
//! bar, must agree with the 50-digit value to 1e-30 relative, or the reference is not written.
//! NumPy 2.3.5 (BSD-3-Clause) routes (`inv`, Cholesky `solve`, `eigh`, a QR projection) are also
//! run on the same inputs and their errors against the 50-digit answer are recorded as a
//! diagnostic of the earlier dispute; they are not asserted.
//!
//! ### Tolerance (fixed now, before the first comparison)
//!
//! A first-order backward-error bound on the engine's own binary64 arithmetic, with the
//! sensitivity of each compared quantity evaluated exactly by the oracle. `u = 2^-53`; `n` the
//! dimension of `F`; `m` the number of observations; the constant
//! `c = (3n + 1) n + m`, where `(3n + 1) n` is the backward-error constant of a factorisation and
//! solve (Higham, *Accuracy and Stability of Numerical Algorithms*, 2nd ed., Theorem 10.4, the
//! constant of the Tier B form) taken for every decomposition stage, and `m` covers the
//! accumulation of `J^T W J`. The engine is modelled as exact arithmetic on inputs perturbed, at
//! each stage, by at most `c u` times:
//! * `a_F = || |J|^T W |J| ||_2` on `F` (accumulation, and the backward error of the station-block
//!   eigen-decomposition);
//! * `a_S = || |F_bb| + |F_sb|^T Q |F_sb| ||_2` on `S`, with `Q = sum_j |v_j| |v_j|^T / mu_j` over
//!   the eigenpairs `(mu_j, v_j)` of `F_ss` (the rounding of the spectral inverse's assembly and of
//!   the Schur products, componentwise; `a_S = || |F_bb| ||_2` when `s = 0`);
//! * `a_H = || |A|^T |S| |A| ||_2` on `H` (forming `H`, and the backward error of its
//!   eigen-decomposition and spectral inverse).
//!
//! With `Zt = [ -F_ss^-1 F_sb A ; A ]` (n x 7, so that `H` is the Schur complement of
//! `T^T F T`, `T = diag(I_s, A)`, and a first-order change `dF` moves `H` by `Zt^T dF Zt`), the
//! first-order perturbation results `|dC_kk| <= ||x||^2 ||dX||_2` (for `dC = -X^-1 dX X^-1`
//! projected on `e_k`), Weyl's inequality and the Davis-Kahan sine theorem give:
//! * datum sigma `k`, relative:
//!   `tol_k = 1e-12 + (c u / 2) (a_F ||Zt C e_k||^2 + a_S ||A C e_k||^2 + a_H ||C e_k||^2) / C_kk`;
//! * eigenvalue `lambda` with unit eigenvector `v`, relative:
//!   `t(lambda) = c u (a_F ||Zt v||^2 + a_S ||A v||^2 + a_H) / lambda`; condition number, relative:
//!   `1e-12 + t(lambda_min) + t(lambda_max)`;
//! * weakest direction, angle in radians:
//!   `1e-12 + c u (a_F ||Zt||_2^2 + a_S ||A||_2^2 + a_H) / (lambda_2 - lambda_1)`.
//!
//! The factor 1/2 on the sigmas is the square root. There is no factor for the oracle's own error
//! (unlike the Tier B form, which doubled its bound because NumPy carried the same error): at 50
//! digits it is below 1e-40. The test recomputes every bar in Rust from the ingredients the oracle
//! records, so the formula is visible here and cannot drift in the script. Every compared quantity
//! of every scenario must pass. A failure is a finding, stated as such: it would mean the engine's
//! arithmetic is less accurate than a backward-stable pipeline on this problem (for example its
//! 1e-9 pseudo-inverse fallback on the station block), and the bar is not to be moved.
//!
//! ### What this validates
//!
//! The linear algebra of the campaign datum covariance on the committed inputs (P2): that the
//! engine's datum sigmas, condition number and weakest direction for the stations-estimated
//! campaign are as accurate as a backward-stable double-precision computation can make them. It
//! does not validate the Jacobian (the SPICE leg of the earlier test does that), nor any physical
//! accuracy of the illustrative campaign.
//!
//! ## Result (recorded 2026-10-02, first run, not tuned)
//!
//! Pre-registration commit `804662d5` (pushed 2026-10-02 15:45 UTC) precedes the fixture.
//! Disclosed start-up defect of the oracle script, fixed before it wrote any output: its own
//! 50-against-80-digit self-check compared the weakest direction as `sqrt(1 - cos^2)`, which
//! cancels down to the 50-digit noise (it reported 7.3e-26 on the control); it now uses the norm
//! of the difference of the two sign-pinned unit vectors. No engine value had been compared.
//!
//! **Every pre-registered check passes on all three scenarios.** Oracle self-agreement 1.1e-38,
//! 1.4e-46 and 1.0e-39.
//! * `stations_estimated_2026_03_18` (binding; Helmert condition 2.28e8, joint information
//!   condition 3.0e13): datum sigmas within 8.5e-7 to 4.8e-6 against bars 9.6e-2 to 2.2e-1;
//!   condition number within 4.6e-6 against 0.47; weakest direction 5.9e-6 rad apart.
//! * `stations_fixed_2026_03_18` (control): sigmas within 3.8e-15 to 2.0e-14 against bars 1.0e-11
//!   to 2.8e-7; condition 4.1e-14 against 5.6e-7; weakest direction identical (bar 9.4e-11 rad).
//! * `stations_estimated_2024_01_01` (seen scenario; Helmert condition 2.11e8, joint 1.6e12):
//!   sigmas within 1.9e-7 to 9.7e-6 against bars 2.8e-2 to 6.9e-2; condition 1.3e-5 against 0.15;
//!   weakest direction 2.7e-5 rad apart.
//!
//! Plainly: on the stations-estimated scenarios the bar is a worst-case first-order bound and
//! sits four orders of magnitude above the engine's error, and the weakest-direction bar (21 rad
//! and 1.5 rad) exceeds a right angle, so that one check carries no information there. The bars
//! are not small because the formula is generous but because the problem is that sensitive: a
//! deliberate 1e-9 relative scaling of the Schur correction moves the sigmas by up to 28 %.
//!
//! **Settling the earlier dispute (diagnostic, recorded in `reference.json`).** Against the
//! 50-digit answer the largest datum-sigma error is, on 2024-01-01: the engine 9.7e-6; NumPy
//! `inv` 2.9e-6; NumPy `eigh` spectral inverse 6.2e-6; NumPy Cholesky solve 9.4e-9; NumPy QR
//! projection 5.5e-9 (2026-03-18: engine 4.8e-6, `inv` 9.4e-7, `eigh` 2.3e-6, Cholesky 1.4e-8, QR
//! 2.2e-8). The engine is the less accurate side of the 6.8e-6 gap, through its explicit spectral
//! inverse of the station block; it is within the a-priori backward-error bound, but a
//! factorisation route (Cholesky or QR, the square-root information form) is about three orders of
//! magnitude more accurate on the same inputs. [`record_engine_accuracy_against_a_factorisation_route`]
//! pins that observation so a change in either is re-examined.
//!
//! **Measurement fix, disclosed.** The weakest-direction comparator was first `acos` of the
//! cosine, which cannot resolve angles below about 1.5e-8 rad (it read 0 on the control, against
//! a 9.4e-11 bar). It now measures the chord between the sign-aligned unit vectors; the bar is
//! unchanged. Measured: 5.9e-6, 6.6e-16 (control, now a real pass) and 2.7e-5 rad.
//!
//! **Mutations (each applied, run, and reverted).** (1) `fim::sym_eig` stopping its Jacobi sweeps
//! once the off-diagonal mass is below 1e-6 of the diagonal: red (control sigmas off by up to
//! 2.9e-5 against bars down to 1e-11; one 2024 stations-estimated sigma 5.2e-2 against 2.8e-2).
//! (2) The station-block Schur correction scaled by `1 + 1e-9`: red (2026-03-18 sigmas off by up
//! to 0.28 against 0.15; 2024 by 6.8e-2 against 6.6e-2); at `1 + 1e-7` the datum turns
//! rank-deficient and the full-rank assertion fails. (3) The station-block pseudo-inverse threshold
//! raised from 1e-9 to 1e-6: no effect (the station block is better conditioned than that), so not
//! counted as evidence.

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

const FIXTURE_DIR: &str = "tests/fixtures/lunar_frame_campaign_mpmath_oracle";

/// The compared scenarios, in fixture order.
fn scenarios() -> Vec<(&'static str, LunarFrameCampaignScenario)> {
    let at = |y: i32, mo: u32, d: u32, estimated: bool| LunarFrameCampaignScenario {
        epoch_year: Some(y),
        epoch_month: Some(mo),
        epoch_day: Some(d),
        station_datum: estimated.then(|| "estimated-anchor-first".to_string()),
        ..Default::default()
    };
    vec![
        ("stations_estimated_2026_03_18", at(2026, 3, 18, true)),
        ("stations_fixed_2026_03_18", at(2026, 3, 18, false)),
        ("stations_estimated_2024_01_01", at(2024, 1, 1, true)),
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

/// The engine inputs the oracle consumes, built from the engine now.
fn engine_inputs(name: &str, sc: &LunarFrameCampaignScenario) -> J {
    let (json, _) = sc.run_json().expect("scenario runs");
    let v: J = serde_json::from_str(&json).expect("report json");
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
        "epoch_utc": format!(
            "{:04}-{:02}-{:02}T00:00:00",
            sc.epoch_year.unwrap_or(2024),
            sc.epoch_month.unwrap_or(1),
            sc.epoch_day.unwrap_or(1)
        ),
        "station_datum": v["station_datum"]["choice"],
        "n_station_columns": n_sc,
        "observations": sched
            .observations
            .iter()
            .map(|o| [o.beacon, o.epoch, o.station1, o.station2])
            .collect::<Vec<_>>(),
        "weights": vec![1.0 / (sigma * sigma); jac.len()],
        "engine_jacobian": jac,
        "helmert_design": helmert_design(&points),
    })
}

/// The committed inputs are exactly what the engine builds now. With
/// `KSHANA_WRITE_MPMATH_FIXTURE=1` it writes them instead (the fixture generator).
#[test]
fn engine_inputs_match_the_committed_fixture() {
    let built: Vec<J> = scenarios()
        .iter()
        .map(|(name, sc)| engine_inputs(name, sc))
        .collect();
    let doc = serde_json::json!({
        "generator": "tests/lunar_frame_campaign_mpmath_oracle.rs::engine_inputs_match_the_committed_fixture",
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

/// The engine's datum sigmas in the balanced units of the Helmert design.
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

/// The comparison of one scenario: `(label, engine, oracle, error, bar)` rows.
fn compare(
    name: &str,
    sc: &LunarFrameCampaignScenario,
    r: &J,
) -> Vec<(String, f64, f64, f64, f64)> {
    let (json, _) = sc.run_json().expect("scenario runs");
    let v: J = serde_json::from_str(&json).expect("report json");
    let helm = &v["helmert"];
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
    let c = (3.0 * n + 1.0) * n + m;
    let cu = c * UNIT_ROUNDOFF;
    let (a_f, a_s, a_h) = (f(&r["a_F"]), f(&r["a_S"]), f(&r["a_H"]));

    let mut rows = Vec::new();
    // Datum sigmas.
    let es = engine_sigma(&v);
    let os = fv(&r["sigma"]);
    let (wf, ws, wh) = (fv(&r["w_F"]), fv(&r["w_S"]), fv(&r["w_H"]));
    for k in 0..7 {
        let bar = FLOOR + 0.5 * cu * (a_f * wf[k] + a_s * ws[k] + a_h * wh[k]);
        rows.push((
            format!("{name}: sigma[{k}]"),
            es[k],
            os[k],
            rel(es[k], os[k]),
            bar,
        ));
    }
    // Condition number.
    let t = |key: &str| {
        let e = &r[key];
        cu * (a_f * f(&e["zt_v_sq"]) + a_s * f(&e["a_v_sq"]) + a_h) / f(&e["lambda"])
    };
    let bar = FLOOR + t("lambda_min") + t("lambda_max");
    let (ec, oc) = (f(&helm["condition_number"]), f(&r["condition"]));
    rows.push((format!("{name}: condition"), ec, oc, rel(ec, oc), bar));
    // Weakest direction.
    let ew = fv(&helm["weakest_direction"]["direction"]);
    let ow = fv(&r["weakest_direction"]);
    let ang = direction_angle(&ew, &ow);
    let bar = FLOOR
        + cu * (a_f * f(&r["zt_norm_sq"]) + a_s * f(&r["a_norm_sq"]) + a_h)
            / f(&r["eigengap_lambda2_minus_lambda1"]);
    rows.push((
        format!("{name}: weakest direction (rad)"),
        ang,
        0.0,
        ang,
        bar,
    ));
    rows
}

/// The strict pre-registered comparison: every quantity of every scenario within its bar.
#[test]
fn lunar_frame_campaign_datum_matches_mpmath_extended_precision() {
    let reference = fixture("reference.json");
    let refs = reference["scenarios"].as_array().expect("scenarios");
    let scs = scenarios();
    assert_eq!(refs.len(), scs.len());
    let mut failures = Vec::new();
    for ((name, sc), r) in scs.iter().zip(refs) {
        assert_eq!(r["name"].as_str(), Some(*name));
        for (label, engine, oracle, err, bar) in compare(name, sc, r) {
            eprintln!(
                "{label}: engine {engine:.17e} oracle {oracle:.17e} error {err:.3e} bar {bar:.3e}"
            );
            // NaN fails too.
            if err.is_nan() || err > bar {
                failures.push(format!("{label}: error {err:.3e} > bar {bar:.3e}"));
            }
        }
    }
    assert!(failures.is_empty(), "{}", failures.join("\n"));
}

/// The accuracy observation behind the record: on both stations-estimated scenarios the
/// engine's largest datum-sigma error against the 50-digit answer lies in [1e-7, 1e-4], while the
/// recorded NumPy Cholesky route is below 1e-7. It fails if the engine becomes as accurate as a
/// factorisation route (re-examine the record) or drifts.
#[test]
fn record_engine_accuracy_against_a_factorisation_route() {
    let reference = fixture("reference.json");
    let refs = reference["scenarios"].as_array().expect("scenarios");
    for ((name, sc), r) in scenarios().iter().zip(refs) {
        if !name.starts_with("stations_estimated") {
            continue;
        }
        let (json, _) = sc.run_json().expect("scenario runs");
        let v: J = serde_json::from_str(&json).expect("report json");
        let worst = engine_sigma(&v)
            .iter()
            .zip(fv(&r["sigma"]))
            .map(|(a, b)| rel(*a, b))
            .fold(0.0_f64, f64::max);
        assert!(
            (1e-7..=1e-4).contains(&worst),
            "{name}: engine sigma error {worst:.3e} left the recorded band [1e-7, 1e-4]"
        );
        let chol = f(&r["numpy_double_precision_sigma_error_diagnostic"]["cholesky_solve"]);
        assert!(
            chol < 1e-7,
            "{name}: recorded Cholesky route error {chol:.3e}"
        );
    }
}
