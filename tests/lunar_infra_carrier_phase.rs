// SPDX-License-Identifier: AGPL-3.0-only
//! Study 2 of the `lunar-infrastructure` kind (`study = "carrier-phase"`) against bars Q1 to Q4 of
//! `xval/lunar-infra/PREREGISTRATION.md` and its amendments (`PREREGISTRATION-amendment-1.md`).
//! Results and verdicts: `xval/lunar-infra/RESULTS.md`.
//!
//! PIN-SCOPE:    the one scored run of the committed example (seed 20261019, 400 trials, arcs 1, 2, 3 d)
//!               stored as `phase_full_run.json`, the numpy oracle of the float design (Q3), the
//!               brute-force check of LAMBDA (Q4), and a small live run for Q1
//! PIN-EXCLUDES: whether ambiguity fixing would work for any other geometry or gain

use kshana::lambda::{bootstrap_success_rate, resolve};
use rand::{Rng, SeedableRng};
use rand_chacha::ChaCha8Rng;
use serde_json::Value;

fn full_run() -> Value {
    serde_json::from_str(include_str!("fixtures/lunar_infra/phase_full_run.json")).unwrap()
}

#[test]
fn q1_monte_carlo_success_is_not_below_the_bootstrap_lower_bound() {
    let d = full_run();
    for a in d["arcs"].as_array().unwrap() {
        let mc = a["monte_carlo_success_rate"].as_f64().unwrap();
        let se = a["monte_carlo_standard_error"].as_f64().unwrap();
        let bs = a["bootstrapped_success_rate"].as_f64().unwrap();
        assert!(mc >= bs - 3.0 * se, "arc {}: mc {mc} bootstrap {bs} se {se}", a["arc_days"]);
        assert_eq!(a["search_budget_exhausted_trials"], 0);
    }
}

#[test]
fn q2_success_does_not_fall_with_arc_length_beyond_three_standard_errors() {
    let d = full_run();
    let arcs = d["arcs"].as_array().unwrap();
    assert_eq!(arcs.len(), 3);
    for w in arcs.windows(2) {
        let (a, b) = (&w[0], &w[1]);
        let drop = a["monte_carlo_success_rate"].as_f64().unwrap() - b["monte_carlo_success_rate"].as_f64().unwrap();
        let se = a["monte_carlo_standard_error"].as_f64().unwrap().hypot(b["monte_carlo_standard_error"].as_f64().unwrap());
        assert!(drop <= 3.0 * se, "{} d -> {} d: drop {drop}, se {se}", a["arc_days"], b["arc_days"]);
    }
    // What the bars do not say, pinned so the reader sees it: integer fixing is out of reach here
    // (at most a few percent), although the float solution improves with the arc.
    for a in arcs {
        assert!(a["monte_carlo_success_rate"].as_f64().unwrap() < 0.05);
    }
    let f: Vec<f64> = arcs.iter().map(|a| a["orbiter_position_sigma_float_m"].as_f64().unwrap()).collect();
    assert!(f[0] > f[1] && f[1] > f[2]);
}

#[test]
fn q1_holds_on_a_live_short_run() {
    let toml = include_str!("../scenarios/lunar-infrastructure-carrier-phase.toml")
        .replace("arcs_days = [1.0, 2.0, 3.0]", "arcs_days = [0.5]")
        .replace("trials = 400", "trials = 60");
    let out = kshana::api::run_toml(&toml).expect("runs");
    let v: Value = serde_json::from_str(&out.json).unwrap();
    let a = &v["arcs"][0];
    let (mc, se, bs) = (
        a["monte_carlo_success_rate"].as_f64().unwrap(),
        a["monte_carlo_standard_error"].as_f64().unwrap(),
        a["bootstrapped_success_rate"].as_f64().unwrap(),
    );
    assert!(mc >= bs - 3.0 * se);
    assert!(a["station_position_sigma_fixed_m"].as_f64().unwrap() < a["station_position_sigma_float_m"].as_f64().unwrap());
}

fn mat(v: &Value) -> Vec<Vec<f64>> {
    v.as_array().unwrap().iter().map(|r| r.as_array().unwrap().iter().map(|x| x.as_f64().unwrap()).collect()).collect()
}

#[test]
fn q3_the_float_design_equals_an_independent_numpy_solve() {
    let k: Value = serde_json::from_str(include_str!("fixtures/lunar_infra/phase_design.json")).unwrap();
    let o: Value = serde_json::from_str(include_str!("fixtures/lunar_infra/phase_oracle.json")).unwrap();
    assert_eq!(k["passes_used"], o["passes_used"]);
    for key in ["q", "p_float", "p_fixed"] {
        let (a, b) = (mat(&k[key]), mat(&o[key]));
        assert_eq!(a.len(), b.len(), "{key}");
        let mut worst: f64 = 0.0;
        for i in 0..a.len() {
            for j in 0..a.len() {
                worst = worst.max((a[i][j] - b[i][j]).abs() / (1.0 + b[i][j].abs()));
            }
        }
        assert!(worst <= 1e-9, "{key}: worst relative difference {worst:e}");
    }
    let (kb, ob) = (k["bootstrap"].as_f64().unwrap(), o["bootstrap"].as_f64().unwrap());
    // The bootstrapped success rate is the part of Q3 that is NOT MET at 1e-9: the 69-factor product
    // of `kshana::detection::normal_cdf` (the approximation LAMBDA uses, about 1e-7 per factor) differs
    // from the exact erf-based value by a relative 1.7e-6. The miss is pinned, not loosened.
    let rel = (kb - ob).abs() / ob;
    assert!(rel > 1e-9 && rel < 1e-5, "bootstrap {kb} vs {ob}: relative difference {rel:e}");
}

/// Squared Mahalanobis distance of integer vector `z` from `a` under the inverse of `q`
/// (via a solve with `q`'s Cholesky factor).
fn dist(l: &[Vec<f64>], a: &[f64], z: &[i64]) -> f64 {
    let n = a.len();
    let r: Vec<f64> = (0..n).map(|i| z[i] as f64 - a[i]).collect();
    let mut y = vec![0.0; n];
    for i in 0..n {
        let mut s = r[i];
        for j in 0..i {
            s -= l[i][j] * y[j];
        }
        y[i] = s / l[i][i];
    }
    y.iter().map(|v| v * v).sum()
}

#[test]
fn q4_lambda_equals_brute_force_enumeration() {
    let mut rng = ChaCha8Rng::seed_from_u64(20261019);
    let mut checked = 0;
    for _ in 0..200 {
        let n = rng.gen_range(2..=5usize);
        // A well-conditioned correlated covariance: B Bᵀ + diag, in cycles².
        let b: Vec<Vec<f64>> = (0..n).map(|_| (0..n).map(|_| rng.gen_range(-0.25..0.25)).collect()).collect();
        let mut q = vec![vec![0.0; n]; n];
        for i in 0..n {
            for j in 0..n {
                q[i][j] = (0..n).map(|k| b[i][k] * b[j][k]).sum::<f64>();
            }
            q[i][i] += rng.gen_range(0.01..0.09);
        }
        // Cholesky of q.
        let mut l = vec![vec![0.0; n]; n];
        for i in 0..n {
            for j in 0..=i {
                let mut s = q[i][j];
                for k in 0..j {
                    s -= l[i][k] * l[j][k];
                }
                l[i][j] = if i == j { s.sqrt() } else { s / l[j][j] };
            }
        }
        let a: Vec<f64> = (0..n).map(|_| rng.gen_range(-3.0..3.0)).collect();
        // Enumerate the integer box around the rounded float, +-6.
        let c: Vec<i64> = a.iter().map(|x| x.round() as i64).collect();
        let side = 13i64;
        let total = side.pow(n as u32);
        let mut best = (f64::INFINITY, vec![0i64; n]);
        for idx in 0..total {
            let mut m = idx;
            let z: Vec<i64> = (0..n)
                .map(|i| {
                    let v = c[i] - 6 + m % side;
                    m /= side;
                    v
                })
                .collect();
            let dd = dist(&l, &a, &z);
            if dd < best.0 {
                best = (dd, z);
            }
        }
        let fix = resolve(&q, &a).expect("lambda resolves");
        assert_eq!(fix.fixed, best.1, "q {q:?} a {a:?}");
        assert!(bootstrap_success_rate(&q).unwrap() > 0.0);
        checked += 1;
    }
    assert_eq!(checked, 200);
}
