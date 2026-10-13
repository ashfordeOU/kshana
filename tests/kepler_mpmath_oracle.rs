// SPDX-License-Identifier: AGPL-3.0-only
//! Library oracle: the robust Kepler solver ([`kshana::kepler::solve_kepler_markley`], Markley
//! 1995 starter + Newton polishing) against 50-digit mpmath roots of `E − e·sin E = M`.
//!
//! **Oracle (Library).** mpmath 1.3.0 (BSD-3-Clause), run by
//! `tests/fixtures/kepler_mpmath_oracle/gen_reference.py` into `reference.json` (NOTICE.md
//! beside it): 405 grid points `e ∈ {0 … 0.999999}` × `M ∈ [−π, π]` (including `M` down to
//! 1e-12 and up to `fl(π)`), plus 9 wound `M` values.
//!
//! **Bars, fixed before the first comparison** in `xval/kepler-mpmath/PREREGISTRATION.md`
//! (committed alone before this test first ran): K1 `|E − E_mp| ≤ 8ε·|E_mp|` on the grid
//! (`E = M` exactly at `e = 0`); K2 `≤ 8ε·|E_mp| + 4ε·|M|/(1 − e)` for wound `M`; K3 at most 2
//! Newton polishing steps; K4 `propagator::solve_kepler_robust` bit-identical. Measured values:
//! `xval/kepler-mpmath/RESULTS.md`.
//!
//! PIN-SCOPE:    the shared Kepler solver's root, iteration count and wrapper, at every committed
//!               (e, M) point, against the committed mpmath roots.
//! PIN-EXCLUDES: the legacy solvers (their errors are printed for context, not asserted),
//!               hyperbolic and parabolic Kepler equations, and the solver's run time.

use kshana::kepler::solve_kepler_markley;
use kshana::propagator::{solve_kepler_checked, solve_kepler_robust};
use serde_json::Value;

const EPS: f64 = f64::EPSILON;
const BAR_K1_ULPS: f64 = 8.0;
const BAR_K2_WIND: f64 = 4.0;
const BAR_K3_ITERS: usize = 2;

fn fixture() -> Value {
    let path = concat!(
        env!("CARGO_MANIFEST_DIR"),
        "/tests/fixtures/kepler_mpmath_oracle/reference.json"
    );
    serde_json::from_str(&std::fs::read_to_string(path).expect("fixture")).expect("json")
}

struct Point {
    e: f64,
    m: f64,
    hi: f64,
    lo: f64,
    cond: f64,
}

fn points(v: &Value) -> Vec<Point> {
    v.as_array()
        .unwrap()
        .iter()
        .map(|r| Point {
            e: r["e"].as_f64().unwrap(),
            m: r["m"].as_f64().unwrap(),
            hi: r["e_hi"].as_f64().unwrap(),
            lo: r["e_lo"].as_f64().unwrap(),
            cond: r["cond"].as_f64().unwrap(),
        })
        .collect()
}

fn err(ea: f64, p: &Point) -> f64 {
    ((ea - p.hi) - p.lo).abs()
}

#[test]
fn markley_solver_matches_mpmath_roots_on_the_grid() {
    let fx = fixture();
    let grid = points(&fx["grid"]);
    assert_eq!(grid.len(), 405);
    let (mut worst_ulps, mut worst_at) = (0.0_f64, (0.0, 0.0));
    let mut worst_res = 0.0_f64;
    let mut iters_hist = [0usize; 3];
    let (mut legacy_checked_worst, mut legacy_checked_fail) = (0.0_f64, 0usize);
    let mut legacy_ephem_worst = 0.0_f64;
    for p in &grid {
        let sol = solve_kepler_markley(p.m, p.e).unwrap_or_else(|e| panic!("{e} at {}", p.m));
        let ea = sol.ecc_anomaly;
        if p.e == 0.0 {
            assert_eq!(ea, p.m, "e = 0 must return M exactly");
        }
        let d = err(ea, p);
        let scale = p.hi.abs();
        let bar = BAR_K1_ULPS * EPS * scale;
        assert!(
            d <= bar,
            "K1 e {} M {:e}: E {ea:e} vs {:e} (err {d:e} = {:.2} ε|E|)",
            p.e,
            p.m,
            p.hi,
            d / (EPS * scale)
        );
        assert!(
            sol.iterations <= BAR_K3_ITERS,
            "K3 e {} M {:e}: {} iterations",
            p.e,
            p.m,
            sol.iterations
        );
        iters_hist[sol.iterations] += 1;
        assert_eq!(
            solve_kepler_robust(p.m, p.e).unwrap().to_bits(),
            ea.to_bits(),
            "K4"
        );
        if d / (EPS * scale) > worst_ulps {
            worst_ulps = d / (EPS * scale);
            worst_at = (p.e, p.m);
        }
        // K5 (reported): first-order true residual, in units of ε|M|.
        worst_res = worst_res.max(d * p.cond / (EPS * p.m.abs()));
        // Legacy solvers, for context only.
        match solve_kepler_checked(p.m, p.e, 30) {
            Ok(x) => legacy_checked_worst = legacy_checked_worst.max(err(x, p) / scale),
            Err(_) => legacy_checked_fail += 1,
        }
        let x = kshana::ephem::solve_kepler(p.m, p.e);
        legacy_ephem_worst = legacy_ephem_worst.max(err(x, p) / scale);
    }
    println!(
        "K1 worst |E − E_mp| = {worst_ulps:.3} ε|E| at (e, M) = {worst_at:?}; K3 polishing steps 0/1/2: {iters_hist:?}; K5 worst residual {worst_res:.3} ε|M|"
    );
    println!(
        "legacy (not asserted): solve_kepler_checked worst rel err {legacy_checked_worst:.3e}, {legacy_checked_fail} Err of 405; ephem::solve_kepler worst rel err {legacy_ephem_worst:.3e}"
    );
}

#[test]
fn markley_solver_keeps_the_winding_of_m() {
    let fx = fixture();
    let wind = points(&fx["winding"]);
    assert_eq!(wind.len(), 9);
    let mut worst = 0.0_f64;
    for p in &wind {
        let sol = solve_kepler_markley(p.m, p.e).unwrap();
        let d = err(sol.ecc_anomaly, p);
        let bar = BAR_K1_ULPS * EPS * p.hi.abs() + BAR_K2_WIND * EPS * p.m.abs() / (1.0 - p.e);
        assert!(d <= bar, "K2 e {} M {}: err {d:e} bar {bar:e}", p.e, p.m);
        assert!(
            sol.iterations <= BAR_K3_ITERS,
            "K3 wound: {}",
            sol.iterations
        );
        assert_eq!(
            solve_kepler_robust(p.m, p.e).unwrap().to_bits(),
            sol.ecc_anomaly.to_bits()
        );
        worst = worst.max(d / bar);
    }
    println!("K2 worst err / bar = {worst:.3}");
}
