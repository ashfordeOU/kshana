// SPDX-License-Identifier: AGPL-3.0-only
//! Library oracle: the DOP853 integrator ([`kshana::integrator`]) against SciPy's
//! `solve_ivp(method="DOP853")`, and the two-body runs against the exact Kepler solution.
//!
//! **Oracle (Library).** SciPy 1.18.1 (BSD-3-Clause), run by
//! `tests/fixtures/dop853_scipy_oracle/gen_reference.py` into `reference.json` (see the NOTICE.md
//! beside it). The exact two-body states come from mpmath 1.3.0 at 40 digits in the same
//! generator. Three problems: a circular 7000 km LEO in SI units over 58000 s, an `e = 0.7`
//! orbit in canonical units over 5 periods, and the Arenstorf restricted three-body orbit over
//! one period.
//!
//! **Bars, fixed before the first comparison** in `xval/dop853-scipy/PREREGISTRATION.md`
//! (committed alone, before this test was first run against the fixture). The constants below
//! restate them; `xval/dop853-scipy/RESULTS.md` records the measured values.
//!
//! PIN-SCOPE:    DOP853 single steps (state, FSAL derivative, error norm, dense output), the
//!               automatic initial step, the step and evaluation counts, the end states and the
//!               dense output of three full runs, against the committed SciPy/mpmath fixture.
//! PIN-EXCLUDES: SciPy's default (non-given) first step inside `solve_ivp` beyond the
//!               initial-step function itself, event location, backward runs, the propagator
//!               force models (only the two-body and Arenstorf right-hand sides here).

use kshana::integrator::{
    dop853_initial_step, dop853_step, integrate_dop853_checked, integrate_dop853_dense, Tolerance,
};
use serde_json::Value;

const EPS: f64 = f64::EPSILON;
/// S1: single-step state, `‖Δ‖∞ ≤ 1e-14·‖y_new‖∞`.
const BAR_STEP_Y: f64 = 1e-14;
/// S2: single-step FSAL derivative, `‖Δ‖∞ ≤ 1e-13·‖f_new‖∞`.
const BAR_STEP_F: f64 = 1e-13;
/// S3: single-step error norm, `|Δ| ≤ 1e-8·err + 64ε·D` (D the rounding scale).
const BAR_ERR_REL: f64 = 1e-8;
const BAR_ERR_ROUND: f64 = 64.0 * EPS;
/// S4: single-step dense output, `‖Δ‖∞ ≤ 1e-13·‖y(θ)‖∞`.
const BAR_STEP_DENSE: f64 = 1e-13;
/// R0: automatic initial step, relative.
const BAR_H0: f64 = 1e-12;
/// R1: accepted steps within max(2, 1 %), nfev within max(24, 1 %).
const BAR_STEPS_ABS: f64 = 2.0;
const BAR_NFEV_ABS: f64 = 24.0;
const BAR_COUNT_REL: f64 = 0.01;
/// R2 / R4: end and dense states vs SciPy, two-body per block (position, velocity) relative.
const BAR_VS_SCIPY_TWO_BODY: f64 = 1e-9;
/// R2 / R4: Arenstorf, absolute (canonical units).
const BAR_VS_SCIPY_ARENSTORF: f64 = 1e-7;
/// R3 / R4: vs exact: kshana error ≤ 2·SciPy error + 1e-12·block norm.
const BAR_EXACT_FACTOR: f64 = 2.0;
const BAR_EXACT_FLOOR: f64 = 1e-12;
/// R3: Arenstorf periodicity, ≤ 2·SciPy's + 1e-10.
const BAR_PERIODIC_FLOOR: f64 = 1e-10;

const MU_EARTH: f64 = 3.986004418e14;
const ARENSTORF_MU: f64 = 0.012277471;

fn fixture() -> Value {
    let path = concat!(
        env!("CARGO_MANIFEST_DIR"),
        "/tests/fixtures/dop853_scipy_oracle/reference.json"
    );
    serde_json::from_str(&std::fs::read_to_string(path).expect("fixture")).expect("json")
}

fn vecf(v: &Value) -> Vec<f64> {
    v.as_array()
        .expect("array")
        .iter()
        .map(|x| x.as_f64().expect("number"))
        .collect()
}

fn two_body_3d(_t: f64, y: &[f64]) -> Vec<f64> {
    let (x, yy, z) = (y[0], y[1], y[2]);
    let r = (x * x + yy * yy + z * z).sqrt();
    let r3 = r * r * r;
    vec![
        y[3],
        y[4],
        y[5],
        -MU_EARTH * x / r3,
        -MU_EARTH * yy / r3,
        -MU_EARTH * z / r3,
    ]
}

fn two_body_planar(_t: f64, y: &[f64]) -> Vec<f64> {
    let (x, yy) = (y[0], y[1]);
    let r = (x * x + yy * yy).sqrt();
    let r3 = r * r * r;
    vec![y[2], y[3], -x / r3, -yy / r3]
}

fn arenstorf(_t: f64, y: &[f64]) -> Vec<f64> {
    let mu = ARENSTORF_MU;
    let mup = 1.0 - mu;
    let mut d1 = (y[0] + mu).powi(2) + y[1].powi(2);
    d1 *= d1.sqrt();
    let mut d2 = (y[0] - mup).powi(2) + y[1].powi(2);
    d2 *= d2.sqrt();
    let a0 = y[0] + 2.0 * y[3] - mup * (y[0] + mu) / d1 - mu * (y[0] - mup) / d2;
    let a1 = y[1] - 2.0 * y[2] - mup * y[1] / d1 - mu * y[1] / d2;
    vec![y[2], y[3], a0, a1]
}

type Rhs = fn(f64, &[f64]) -> Vec<f64>;

fn rhs(name: &str) -> Rhs {
    match name {
        "leo" => two_body_3d,
        "ecc07" => two_body_planar,
        "arenstorf" => arenstorf,
        other => panic!("unknown problem {other}"),
    }
}

fn inf_norm(v: &[f64]) -> f64 {
    v.iter().fold(0.0_f64, |m, x| m.max(x.abs()))
}

fn diff_inf(a: &[f64], b: &[f64]) -> f64 {
    a.iter()
        .zip(b)
        .fold(0.0_f64, |m, (x, y)| m.max((x - y).abs()))
}

/// Position / velocity block split of a two-body state.
fn blocks(v: &[f64]) -> (&[f64], &[f64]) {
    v.split_at(v.len() / 2)
}

fn block_norm(v: &[f64]) -> f64 {
    v.iter().map(|x| x * x).sum::<f64>().sqrt()
}

fn block_diff(a: &[f64], b: &[f64]) -> f64 {
    a.iter()
        .zip(b)
        .map(|(x, y)| (x - y) * (x - y))
        .sum::<f64>()
        .sqrt()
}

/// Two-body relative difference per block (worst of position and velocity).
fn rel_block_diff(a: &[f64], b: &[f64]) -> f64 {
    let (ap, av) = blocks(a);
    let (bp, bv) = blocks(b);
    (block_diff(ap, bp) / block_norm(bp)).max(block_diff(av, bv) / block_norm(bv))
}

#[test]
fn dop853_single_steps_match_scipy() {
    // PIN-SCOPE:    S1–S4 of the pre-registration, all single-step records of the fixture.
    // PIN-EXCLUDES: multi-step runs (covered by the run test below).
    let fx = fixture();
    let mut worst = [0.0_f64; 4];
    let mut count = 0;
    for p in fx["problems"].as_array().unwrap() {
        let f = rhs(p["name"].as_str().unwrap());
        for s in p["steps"].as_array().unwrap() {
            count += 1;
            let t = s["t"].as_f64().unwrap();
            let h = s["h"].as_f64().unwrap();
            let y = vecf(&s["y"]);
            let tol = Tolerance {
                rtol: s["rtol"].as_f64().unwrap(),
                atol: s["atol"].as_f64().unwrap(),
                ..Tolerance::default()
            };
            let f0 = f(t, &y);
            let st = dop853_step(&f, t, &y, &f0, h, &tol);
            let y_s = vecf(&s["y_new"]);
            let f_s = vecf(&s["f_new"]);
            let dy = diff_inf(&st.y_new, &y_s) / inf_norm(&y_s);
            let df = diff_inf(&st.f_new, &f_s) / inf_norm(&f_s);
            assert!(dy <= BAR_STEP_Y, "{}: y_new rel {dy:e}", p["name"]);
            assert!(df <= BAR_STEP_F, "{}: f_new rel {df:e}", p["name"]);
            // Error-norm rounding scale D = |h|·17.4·max_i max_j |k_ji| / s_i, where
            // 17.4 > Σ|E5_j| + Σ|E3_j| = 4.187 + 13.132.
            let n = y.len();
            let mut d = 0.0_f64;
            for i in 0..n {
                let s_i = tol.atol + y[i].abs().max(st.y_new[i].abs()) * tol.rtol;
                let kmax = st.stages.iter().fold(0.0_f64, |m, k| m.max(k[i].abs()));
                d = d.max(h.abs() * 17.4 * kmax / s_i);
            }
            let err_s = s["error_norm"].as_f64().unwrap();
            let derr = (st.error_norm - err_s).abs();
            let bar = BAR_ERR_REL * err_s + BAR_ERR_ROUND * d;
            assert!(
                derr <= bar,
                "{}: error norm {} vs {err_s} (Δ {derr:e}, bar {bar:e})",
                p["name"],
                st.error_norm
            );
            if (err_s - 1.0).abs() > 1e-6 {
                assert_eq!(st.error_norm < 1.0, err_s < 1.0, "accept/reject decision");
            }
            // Dense output of the same step (via a one-step dense run from the same point).
            let run = integrate_dop853_dense(
                &f,
                t,
                &y,
                t + h,
                h,
                &Tolerance {
                    rtol: 1e300,
                    atol: 1e300,
                    ..tol
                },
            )
            .expect("one forced step");
            assert_eq!(run.accepted, 1);
            let mut dd = 0.0_f64;
            for (x, ys) in vecf(&s["dense_x"])
                .iter()
                .zip(s["dense_y"].as_array().unwrap())
            {
                let ys = vecf(ys);
                let yk = run.dense[0].eval(t + x * h);
                dd = dd.max(diff_inf(&yk, &ys) / inf_norm(&ys));
            }
            assert!(dd <= BAR_STEP_DENSE, "{}: dense rel {dd:e}", p["name"]);
            worst[0] = worst[0].max(dy);
            worst[1] = worst[1].max(df);
            worst[2] = worst[2].max(derr / err_s);
            worst[3] = worst[3].max(dd);
        }
    }
    assert_eq!(count, 8);
    println!(
        "single steps ({count}): worst y_new rel {:.3e}, f_new rel {:.3e}, err-norm rel {:.3e}, dense rel {:.3e}",
        worst[0], worst[1], worst[2], worst[3]
    );
}

#[test]
fn dop853_runs_match_scipy_and_the_exact_solution() {
    // PIN-SCOPE:    R0–R4 of the pre-registration for the three committed problems.
    // PIN-EXCLUDES: the single-step records (test above).
    let fx = fixture();
    let rtol = fx["rtol"].as_f64().unwrap();
    let atol = fx["atol"].as_f64().unwrap();
    let tol = Tolerance {
        rtol,
        atol,
        ..Tolerance::default()
    };
    for p in fx["problems"].as_array().unwrap() {
        let name = p["name"].as_str().unwrap();
        let f = rhs(name);
        let y0 = vecf(&p["y0"]);
        let t_end = p["t_end"].as_f64().unwrap();
        let h0_s = p["h0_auto"].as_f64().unwrap();

        // R0: initial step.
        let f0 = f(0.0, &y0);
        let h0 = dop853_initial_step(&f, 0.0, &y0, &f0, t_end, &tol);
        let dh = (h0 - h0_s).abs() / h0_s;
        assert!(dh <= BAR_H0, "{name}: h0 {h0} vs {h0_s} (rel {dh:e})");

        // R1: counts, with SciPy's first step given to both.
        let run = integrate_dop853_checked(&f, 0.0, &y0, t_end, h0_s, &tol).expect("run");
        let dense = integrate_dop853_dense(&f, 0.0, &y0, t_end, h0_s, &tol).expect("dense run");
        let acc_s = p["accepted"].as_f64().unwrap();
        let nfev_s = p["nfev"].as_f64().unwrap();
        let nfev_ds = p["nfev_dense"].as_f64().unwrap();
        let step_band = BAR_STEPS_ABS.max(BAR_COUNT_REL * acc_s);
        let nfev_band = BAR_NFEV_ABS.max(BAR_COUNT_REL * nfev_s);
        let dacc = (run.accepted as f64 - acc_s).abs();
        let dnfev = (run.nfev as f64 - nfev_s).abs();
        let dnfev_d = (dense.nfev as f64 - nfev_ds).abs();
        assert!(
            dacc <= step_band,
            "{name}: accepted {} vs {acc_s}",
            run.accepted
        );
        assert!(dnfev <= nfev_band, "{name}: nfev {} vs {nfev_s}", run.nfev);
        assert!(
            dnfev_d <= BAR_NFEV_ABS.max(BAR_COUNT_REL * nfev_ds),
            "{name}: dense nfev {} vs {nfev_ds}",
            dense.nfev
        );
        assert_eq!(run.y, dense.y, "{name}: dense output changed the run");

        // R2: end state vs SciPy; R3: vs exact / periodicity.
        let y_s = vecf(&p["y_end"]);
        let t_dense = vecf(&p["t_dense"]);
        let y_dense_s: Vec<Vec<f64>> = p["y_dense"].as_array().unwrap().iter().map(vecf).collect();
        let (end_vs_scipy, dense_vs_scipy);
        if name == "arenstorf" {
            end_vs_scipy = diff_inf(&run.y, &y_s);
            assert!(
                end_vs_scipy <= BAR_VS_SCIPY_ARENSTORF,
                "{name}: end vs SciPy {end_vs_scipy:e}"
            );
            let per_k = diff_inf(&run.y, &y0);
            let per_s = diff_inf(&y_s, &y0);
            let bar = BAR_EXACT_FACTOR * per_s + BAR_PERIODIC_FLOOR;
            assert!(
                per_k <= bar,
                "{name}: periodicity {per_k:e} vs SciPy {per_s:e}"
            );
            println!("{name}: periodicity error kshana {per_k:.3e}, SciPy {per_s:.3e}");
            let mut worst = 0.0_f64;
            for (t, ys) in t_dense.iter().zip(&y_dense_s) {
                worst = worst.max(diff_inf(&dense.eval(*t).unwrap(), ys));
            }
            dense_vs_scipy = worst;
            assert!(
                dense_vs_scipy <= BAR_VS_SCIPY_ARENSTORF,
                "{name}: dense vs SciPy {worst:e}"
            );
        } else {
            end_vs_scipy = rel_block_diff(&run.y, &y_s);
            assert!(
                end_vs_scipy <= BAR_VS_SCIPY_TWO_BODY,
                "{name}: end vs SciPy {end_vs_scipy:e}"
            );
            let exact = vecf(&p["exact_end"]);
            check_vs_exact(name, "end", &run.y, &y_s, &exact);
            let exact_dense: Vec<Vec<f64>> = p["exact_dense"]
                .as_array()
                .unwrap()
                .iter()
                .map(vecf)
                .collect();
            let mut worst = 0.0_f64;
            let (mut ek, mut es) = ([0.0_f64; 2], [0.0_f64; 2]);
            for ((t, ys), ex) in t_dense.iter().zip(&y_dense_s).zip(&exact_dense) {
                let yk = dense.eval(*t).unwrap();
                worst = worst.max(rel_block_diff(&yk, ys));
                let (kp, kv) = blocks(&yk);
                let (sp, sv) = blocks(ys);
                let (xp, xv) = blocks(ex);
                ek[0] = ek[0].max(block_diff(kp, xp));
                ek[1] = ek[1].max(block_diff(kv, xv));
                es[0] = es[0].max(block_diff(sp, xp));
                es[1] = es[1].max(block_diff(sv, xv));
            }
            dense_vs_scipy = worst;
            assert!(
                dense_vs_scipy <= BAR_VS_SCIPY_TWO_BODY,
                "{name}: dense vs SciPy {worst:e}"
            );
            let (xp, xv) = blocks(&exact_dense[0]);
            let norms = [block_norm(xp), block_norm(xv)];
            for b in 0..2 {
                let bar = BAR_EXACT_FACTOR * es[b] + BAR_EXACT_FLOOR * norms[b];
                assert!(
                    ek[b] <= bar,
                    "{name}: dense vs exact block {b}: {:e} vs SciPy {:e}",
                    ek[b],
                    es[b]
                );
            }
            println!(
                "{name}: dense vs exact max pos {:.3e} (SciPy {:.3e}), vel {:.3e} (SciPy {:.3e})",
                ek[0], es[0], ek[1], es[1]
            );
        }
        println!(
            "{name}: h0 rel {dh:.2e}; accepted {} vs {acc_s}; nfev {} vs {nfev_s}; dense nfev {} vs {nfev_ds}; end vs SciPy {end_vs_scipy:.3e}; dense vs SciPy {dense_vs_scipy:.3e}",
            run.accepted, run.nfev, dense.nfev
        );
    }
}

fn check_vs_exact(name: &str, what: &str, yk: &[f64], ys: &[f64], ex: &[f64]) {
    let (kp, kv) = blocks(yk);
    let (sp, sv) = blocks(ys);
    let (xp, xv) = blocks(ex);
    let ek = [block_diff(kp, xp), block_diff(kv, xv)];
    let es = [block_diff(sp, xp), block_diff(sv, xv)];
    let norms = [block_norm(xp), block_norm(xv)];
    for b in 0..2 {
        let bar = BAR_EXACT_FACTOR * es[b] + BAR_EXACT_FLOOR * norms[b];
        assert!(
            ek[b] <= bar,
            "{name} {what}: block {b} vs exact {:e} (SciPy {:e})",
            ek[b],
            es[b]
        );
    }
    println!(
        "{name} {what}: vs exact pos {:.3e} (SciPy {:.3e}) [rel {:.2e}], vel {:.3e} (SciPy {:.3e}) [rel {:.2e}]",
        ek[0], es[0], ek[0] / norms[0], ek[1], es[1], ek[1] / norms[1]
    );
}
