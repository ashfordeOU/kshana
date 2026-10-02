// SPDX-License-Identifier: AGPL-3.0-only
//! Independent-library comparison (policy P2) for the row "Lunar joint multi-technique OD +
//! clock" (`lunar_combination::estimate`, the batch fusion of Earth-baseline VLBI, lunar-local
//! ranges and inter-satellite ranges that recovers the station and constellation positions and
//! every clock).
//!
//! Pre-registration (validation 0.30, round 2, batch "sweepA"; written 2026-10-02 before the
//! fixture was generated and before the oracle was run).
//!
//! Why a new comparison: the round-1 plan generated observations with Orekit 12.2 `Range` and
//! `InterSatellitesRange` models and asked for 1e-6 m agreement. Those models solve the signal
//! flight time (light time), whereas the row's measurement model is the instantaneous snapshot
//! geometry of a simulated network; Orekit would measure a different quantity, so that bar could
//! not be met by a correct implementation of the row. The round-1 blocker was also that no public
//! entry point took the solve's inputs. This comparison checks the row's own computation, the
//! weighted batch least-squares fusion, on the actual network, by the policy written for exactly
//! this case (P2, docs/VALIDATION.md): an independent numerical library performs the
//! least-squares steps on inputs committed with the fixture. What it validates is the fusion's
//! linear algebra on the committed Jacobians and observations (each Gauss-Newton step, the
//! converged weighted-least-squares solution, the formal covariance and the recovered-minus-true
//! errors and NEES that follow from them); it does not validate the physical models that produce
//! the Jacobian (the VLBI delay and lunar frames have their own rows).
//!
//! Engine seams (added with this pre-registration): `lunar_combination::problem(cfg)` (the
//! observations, weights, a-priori and injected truth `estimate` uses), `lunar_combination::model
//! (cfg)` (its forward model), `lunar_combination::formal_covariance(cfg)`, and
//! `batch_ls::fd_jacobian` made public (the Jacobian `gauss_newton` linearises with); `estimate`
//! now calls `problem` and `model`, so the seams are its own path.
//!
//! Configurations (fixed now): A default (3 satellites, 6 Earth stations, VLBI on, seed 42);
//! B as A with seed 7; C 6 satellites; D 8 satellites and 4 Earth stations; E an elliptical
//! lunar frozen orbit (`orbit_ecc` 0.6, 6 satellites, 2 planes); F as A without VLBI (the
//! ill-conditioned contrast case).
//!
//! Per configuration the test writes (on request) to
//! `tests/fixtures/lunar_joint_od_numpy_oracle/inputs.json`: `z`, `w`, `x0`, `x_true`; the
//! Jacobian `H0` and residual `r0 = z - h(x0)` at the a-priori; the engine's converged state
//! `x_hat` (`gauss_newton`, 100 iterations, tolerance 1e-6, as `estimate` runs it) with `H_hat`
//! and `r_hat` there. It first checks that the engine still produces exactly these inputs
//! (1e-12 relative). `make_fixture.py` there (numpy 2.4.6, BSD-3-Clause) computes with its own
//! algorithms: the first step `numpy.linalg.lstsq(sqrt(W) H0, sqrt(W) r0)` (LAPACK `gelsd`, a
//! singular-value decomposition; the engine inverts the normal equations), the step at `x_hat`,
//! the covariance `numpy.linalg.inv(H_hatᵀ W H_hat)` and its per-parameter sigmas, the station
//! 3-D error `|x_hat - x_true|` over the station axes in metres, the NEES (reported only), and `κ`, the 2-norm condition number of
//! `sqrt(W) H0` (and of `sqrt(W) H_hat`).
//!
//! Tolerances (fixed now): with `tol = max(1e-8, 100 κ ε)`, ε = 2.2e-16, for each configuration
//! (1) the engine's first step (`gauss_newton` with one iteration, minus `x0`) equals numpy's
//! within `tol` relative in the 2-norm; (2) numpy's step at `x_hat` is below 1e-6 stored units in
//! the 2-norm (the engine's own convergence tolerance, about 1 m): `x_hat` is the weighted
//! least-squares solution of the committed problem; (3) every engine formal sigma
//! (`formal_covariance` diagonal) within `tol` relative of numpy's; (4) the station 3-D error
//! reported by `estimate` within `tol` relative of numpy's from `x_hat` and `x_true`. For configuration F, where the solve is expected to be
//! ill-conditioned: (1) only, and only when `κ < 1e12`; otherwise F is reported, not graded.
//! PROMOTE only if every graded comparison holds.
//!
//! Discrimination, pre-registered: dropping the weights in the normal matrix of
//! `batch_ls::gauss_newton` (`w = 1`) must turn the test red.
//!
//! Result (2026-10-02). First run (commit 5094bc31): A to E agree (first step within 3.7e-11,
//! numpy step at the solution at most 3.6e-8 stored units, sigmas within 2.0e-11, station
//! errors equal); F fails: first-step relative difference 6.1e-7 against `tol` 1e-8 (κ of the
//! whitened Jacobian 1.43e5). The engine solved each step by inverting the normal matrix, whose
//! condition number is κ², so its forward error is about κ²ε = 4.5e-6 where a QR or SVD solve
//! reaches κε. Engine fix (written after that result was seen): `batch_ls::gauss_newton_qr`
//! solves each step by Householder QR of the whitened Jacobian (the engine's existing
//! `leo_navmsg::fit::lstsq`), and `lunar_combination::estimate` and `formal_covariance` use it;
//! this test now calls `gauss_newton_qr` (the solver `estimate` runs) and the inputs were
//! re-exported (the converged states moved by the fix), the oracle procedure and tolerances
//! unchanged. Re-run: PASS. First steps within 1.1e-14 to 2.4e-11 (F included), numpy steps at
//! the solutions 1.7e-11 to 3.6e-8 stored units, worst sigma 1.3e-11, station errors equal
//! (A 3.541350 m, B 1.669598 m, C 4.155462 m, D 2.010563 m, E 0.125650 m).
//! Mutations: the pre-registered one (weights dropped in `gauss_newton`'s normal matrix) no
//! longer reaches `estimate` and stays green; the same mutation on the path `estimate` now uses
//! (unit weights in `gauss_newton_qr`) turns the test red (the converged states move and the
//! input check fails).

use kshana::batch_ls::{fd_jacobian, gauss_newton_qr as gauss_newton};
use kshana::lunar_combination::{estimate, formal_covariance, model, problem, LunarNetworkConfig};
use serde_json::{json, Value};
use std::path::PathBuf;

fn dir() -> PathBuf {
    PathBuf::from(env!("CARGO_MANIFEST_DIR")).join("tests/fixtures/lunar_joint_od_numpy_oracle")
}

fn configs() -> Vec<(&'static str, LunarNetworkConfig)> {
    let a = LunarNetworkConfig::default();
    let b = LunarNetworkConfig { seed: 7, ..a };
    let c = LunarNetworkConfig { n_sat: 6, ..a };
    let d = LunarNetworkConfig {
        n_sat: 8,
        n_earth: 4,
        ..a
    };
    let e = LunarNetworkConfig {
        orbit_ecc: 0.6,
        n_sat: 6,
        orbit_planes: 2,
        ..a
    };
    let f = LunarNetworkConfig {
        with_vlbi: false,
        ..a
    };
    vec![("A", a), ("B", b), ("C", c), ("D", d), ("E", e), ("F", f)]
}

struct Case {
    z: Vec<f64>,
    w: Vec<f64>,
    x0: Vec<f64>,
    x_true: Vec<f64>,
    h0: Vec<Vec<f64>>,
    r0: Vec<f64>,
    x_hat: Option<Vec<f64>>,
    h_hat: Option<Vec<Vec<f64>>>,
    r_hat: Option<Vec<f64>>,
}

fn build(cfg: &LunarNetworkConfig) -> Case {
    let p = problem(cfg);
    let h = model(cfg);
    let m = p.z.len();
    let h0 = fd_jacobian(&h, &p.x0, m);
    let f0 = h(&p.x0);
    let r0: Vec<f64> = p.z.iter().zip(&f0).map(|(a, b)| a - b).collect();
    let sol = gauss_newton(&h, &p.z, &p.weights, &p.x0, 100, 1e-6).filter(|r| r.converged);
    let (x_hat, h_hat, r_hat) = match sol {
        Some(r) => {
            let fh = h(&r.x);
            let rh: Vec<f64> = p.z.iter().zip(&fh).map(|(a, b)| a - b).collect();
            (Some(r.x.clone()), Some(fd_jacobian(&h, &r.x, m)), Some(rh))
        }
        None => (None, None, None),
    };
    Case {
        z: p.z,
        w: p.weights,
        x0: p.x0,
        x_true: p.x_true,
        h0,
        r0,
        x_hat,
        h_hat,
        r_hat,
    }
}

fn to_json(c: &Case) -> Value {
    json!({
        "z": c.z, "w": c.w, "x0": c.x0, "x_true": c.x_true, "H0": c.h0, "r0": c.r0,
        "x_hat": c.x_hat, "H_hat": c.h_hat, "r_hat": c.r_hat,
    })
}

/// Writes the inputs when `KSHANA_WRITE_LUNAR_OD_FIXTURE=1`; otherwise does nothing.
#[test]
fn write_inputs_on_request() {
    if std::env::var("KSHANA_WRITE_LUNAR_OD_FIXTURE").as_deref() != Ok("1") {
        return;
    }
    let mut doc = serde_json::Map::new();
    for (name, cfg) in configs() {
        doc.insert(name.to_string(), to_json(&build(&cfg)));
    }
    std::fs::create_dir_all(dir()).expect("dir");
    std::fs::write(
        dir().join("inputs.json"),
        serde_json::to_string(&Value::Object(doc)).expect("json"),
    )
    .expect("write");
}

fn same(a: &Value, b: &Value, path: &str) {
    match (a, b) {
        (Value::Array(x), Value::Array(y)) => {
            assert_eq!(x.len(), y.len(), "{path}: length changed");
            for (i, (p, q)) in x.iter().zip(y).enumerate() {
                same(p, q, &format!("{path}[{i}]"));
            }
        }
        (Value::Number(p), Value::Number(q)) => {
            let (p, q) = (p.as_f64().expect("f64"), q.as_f64().expect("f64"));
            assert!(
                (p - q).abs() <= 1e-12 * p.abs().max(q.abs()).max(1e-300),
                "{path}: {p} vs {q}"
            );
        }
        _ => assert_eq!(a, b, "{path}"),
    }
}

fn norm(v: &[f64]) -> f64 {
    v.iter().map(|x| x * x).sum::<f64>().sqrt()
}

fn vecf(v: &Value) -> Vec<f64> {
    v.as_array()
        .expect("array")
        .iter()
        .map(|x| x.as_f64().expect("f64"))
        .collect()
}

#[test]
fn joint_solve_linear_algebra_matches_numpy() {
    let (Ok(inputs), Ok(oracle)) = (
        std::fs::read_to_string(dir().join("inputs.json")),
        std::fs::read_to_string(dir().join("numpy_oracle.json")),
    ) else {
        eprintln!("SKIP: inputs.json or numpy_oracle.json absent (see the header)");
        return;
    };
    let inputs: Value = serde_json::from_str(&inputs).expect("inputs");
    let oracle: Value = serde_json::from_str(&oracle).expect("oracle");
    let mut ok = true;
    for (name, cfg) in configs() {
        let case = build(&cfg);
        same(&inputs[name], &to_json(&case), name);
        let o = &oracle[name];
        let kappa = o["kappa0"].as_f64().expect("kappa0");
        let tol = (100.0 * kappa * f64::EPSILON).max(1e-8);
        // (1) First Gauss-Newton step.
        let h = model(&cfg);
        let p = problem(&cfg);
        let x1 = gauss_newton(&h, &p.z, &p.weights, &p.x0, 1, 0.0).map(|r| r.x);
        let step_np = vecf(&o["step0"]);
        let graded_f = name != "F" || kappa < 1e12;
        match x1 {
            Some(x1) => {
                let d: Vec<f64> = x1
                    .iter()
                    .zip(&p.x0)
                    .zip(&step_np)
                    .map(|((a, b), s)| (a - b) - s)
                    .collect();
                let rel = norm(&d) / norm(&step_np);
                eprintln!(
                    "{name}: kappa {kappa:.3e}, tol {tol:.1e}; first step rel diff {rel:.2e}"
                );
                if graded_f {
                    ok &= rel <= tol;
                }
            }
            None => {
                eprintln!("{name}: the engine's first step failed (singular normal matrix)");
                if graded_f {
                    ok = false;
                }
            }
        }
        if name == "F" {
            continue;
        }
        // (2) Stationarity of the engine's solution.
        let s_hat = o["step_hat_norm"].as_f64().expect("step_hat_norm");
        eprintln!("{name}: numpy step at x_hat {s_hat:.3e} stored units");
        ok &= s_hat < 1e-6;
        // (3) Formal sigmas.
        let cov = formal_covariance(&cfg).expect("covariance");
        let sig_np = vecf(&o["sigma"]);
        let worst = sig_np
            .iter()
            .enumerate()
            .map(|(i, s)| (cov[i][i].sqrt() - s).abs() / s)
            .fold(0.0, f64::max);
        eprintln!("{name}: worst formal sigma rel diff {worst:.2e}");
        ok &= worst <= tol;
        // (4) Station error.
        let sol = estimate(&cfg);
        let st_np = o["station_err_m"].as_f64().expect("station_err_m");
        let rel_st = (sol.station_pos_err_m - st_np).abs() / st_np;
        eprintln!(
            "{name}: station error {:.6} m vs numpy {st_np:.6} m (rel {rel_st:.2e}); numpy NEES {:.3}",
            sol.station_pos_err_m,
            o["nees"].as_f64().unwrap_or(f64::NAN)
        );
        ok &= rel_st <= tol;
    }
    assert!(
        ok,
        "a joint-solve comparison exceeds its pre-registered tolerance"
    );
}
