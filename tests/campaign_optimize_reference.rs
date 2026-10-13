//! CAP-32: the campaign optimiser against its pre-registered bars
//! (`docs/design/evidence/cap32-optimize/PREREGISTRATION.md`, P2 to P5; P1, the
//! Rosenbrock core bar, is a unit test in `src/campaign/optimize.rs`).
//!
//! The oracles are a closed form and a brute-force grid, so the row is MODELLED.
//!
//! PIN-SCOPE:    the optimiser's search over the link-budget kind: the 1-D target
//!               solve against the exact −20·log10(range) closed form, the grid
//!               method against an independent brute-force loop (bit-equal best), the
//!               Nelder–Mead best against the grid best, a boundary maximum, and the
//!               document's reproducibility.
//! PIN-EXCLUDES: any global-optimum claim; noisy (multi-seed) objectives; kinds other
//!               than link-budget.

use serde_json::Value;

const BASE: &str = r#"kind = "link-budget"
band = "x"
eirp_dbw = 55.0
g_over_t_db = 53.0
range_km = 2000.0
data_rate_bps = 1.0e6
other_losses_db = 3.0
required_eb_n0_db = 4.5
"#;

fn base_table() -> String {
    BASE.lines().map(|l| format!("{l}\n")).collect::<String>()
}

fn campaign(optimize: &str) -> String {
    let mut s = String::from("kind = \"campaign\"\ntitle = \"optimiser reference\"\n\n");
    s.push_str(optimize);
    s.push_str("\n[optimize.scenario]\n");
    s.push_str(&base_table());
    s
}

fn run(src: &str) -> Value {
    let out = kshana::api::run_toml(src).expect("campaign runs");
    serde_json::from_str(&out.json).unwrap()
}

fn margin(range_km: f64, rate: f64) -> f64 {
    let src = BASE
        .replace("range_km = 2000.0", &format!("range_km = {range_km:?}"))
        .replace(
            "data_rate_bps = 1.0e6",
            &format!("data_rate_bps = {rate:?}"),
        );
    let out = kshana::api::run_toml(&src).unwrap();
    let v: Value = serde_json::from_str(&out.json).unwrap();
    v["margin_db"].as_f64().unwrap()
}

fn log_axis(lo: f64, hi: f64, n: usize) -> Vec<f64> {
    (0..n)
        .map(|i| {
            let f = i as f64 / (n - 1) as f64;
            (lo.ln() + (hi.ln() - lo.ln()) * f).exp()
        })
        .collect()
}

const P3_PARAMS: &str = r#"[[optimize.params]]
name = "range"
key = "range_km"
unit = "km"
lo = 500.0
hi = 50000.0
scale = "log"
STEPS
[[optimize.params]]
name = "rate"
key = "data_rate_bps"
unit = "bit/s"
lo = 1000.0
hi = 1.0e8
scale = "log"
STEPS
"#;

// P2: the 1-D target solve against the closed form.
#[test]
fn p2_target_range_matches_the_closed_form() {
    let r0 = 2000.0;
    let m0 = margin(r0, 1.0e6);
    let r_star = r0 * 10f64.powf((m0 - 3.0) / 20.0);
    let doc = run(&campaign(
        r#"[optimize]
method = "nelder-mead"
max_evals = 300
ftol = 1e-14
xtol = 1e-12

[optimize.objective]
name = "margin"
path = "margin_db"
goal = "target"
target = 3.0

[[optimize.params]]
name = "range"
key = "range_km"
unit = "km"
lo = 100.0
hi = 100000.0
scale = "log"
"#,
    ));
    let o = &doc["optimize"];
    let r = o["best_coords"]["range"].as_f64().unwrap();
    let evals = o["evals"].as_u64().unwrap();
    let rel = (r - r_star).abs() / r_star;
    eprintln!("P2: r = {r} km, r* = {r_star} km, rel = {rel:e}, {evals} evals");
    assert!(evals <= 300, "P2 budget: {evals}");
    assert!(rel <= 1e-6, "P2 NOT MET: rel {rel:e}");
}

// P3: grid method bit-equal to an independent brute force; Nelder–Mead at least as good.
#[test]
fn p3_grid_matches_brute_force_and_nelder_mead_does_at_least_as_well() {
    let ranges = log_axis(500.0, 50000.0, 41);
    let rates = log_axis(1000.0, 1.0e8, 41);
    let mut s_grid = f64::INFINITY;
    let mut at = (0.0, 0.0);
    for &r in &ranges {
        for &b in &rates {
            let s = (margin(r, b) - 3.0).abs();
            if s < s_grid {
                s_grid = s;
                at = (r, b);
            }
        }
    }
    let objective = r#"
[optimize.objective]
name = "margin"
path = "margin_db"
goal = "target"
target = 3.0
"#;
    let grid = run(&campaign(&format!(
        "[optimize]\nmethod = \"grid\"\n{objective}\n{}",
        P3_PARAMS.replace("STEPS", "steps = 41")
    )));
    let g = &grid["optimize"];
    let gs = g["best_score"].as_f64().unwrap();
    eprintln!(
        "P3a: brute force {s_grid:e} at {at:?}; grid method {gs:e} at ({}, {})",
        g["best_coords"]["range"], g["best_coords"]["rate"]
    );
    assert_eq!(gs.to_bits(), s_grid.to_bits(), "P3a NOT MET");
    assert_eq!(
        g["best_coords"]["range"].as_f64().unwrap().to_bits(),
        at.0.to_bits()
    );
    assert_eq!(
        g["best_coords"]["rate"].as_f64().unwrap().to_bits(),
        at.1.to_bits()
    );
    assert_eq!(g["evals"].as_u64(), Some(1681));

    let nm = run(&campaign(&format!(
        "[optimize]\nmethod = \"nelder-mead\"\nmax_evals = 400\n{objective}\n{}",
        P3_PARAMS.replace("STEPS", "")
    )));
    let n = &nm["optimize"];
    let ns = n["best_score"].as_f64().unwrap();
    let evals = n["evals"].as_u64().unwrap();
    eprintln!(
        "P3b: nelder-mead {ns:e} in {evals} evals ({})",
        n["stop_reason"]
    );
    assert!(evals <= 400, "P3b budget: {evals}");
    assert!(ns <= s_grid, "P3b NOT MET: {ns:e} > {s_grid:e}");
}

// P4: a boundary maximum.
#[test]
fn p4_nelder_mead_reaches_the_corner_maximum() {
    let ranges = log_axis(500.0, 50000.0, 41);
    let rates = log_axis(1000.0, 1.0e8, 41);
    let mut m_grid = f64::NEG_INFINITY;
    for &r in &ranges {
        for &b in &rates {
            m_grid = m_grid.max(margin(r, b));
        }
    }
    assert_eq!(m_grid.to_bits(), margin(500.0, 1000.0).to_bits());
    let nm = run(&campaign(&format!(
        r#"[optimize]
method = "nelder-mead"
max_evals = 400

[optimize.objective]
name = "margin"
path = "margin_db"
goal = "maximize"

{}"#,
        P3_PARAMS.replace("STEPS", "")
    )));
    let n = &nm["optimize"];
    let m = n["best_metric"].as_f64().unwrap();
    let evals = n["evals"].as_u64().unwrap();
    eprintln!("P4: grid max {m_grid} dB, nelder-mead {m} dB in {evals} evals");
    assert!(evals <= 400, "P4 budget: {evals}");
    assert!(m >= m_grid - 1e-6, "P4 NOT MET: {m} < {m_grid} - 1e-6");
}

// P5: reproducibility, and the trace/evals/ledger agreement.
#[test]
fn p5_the_document_is_byte_stable_and_counts_agree() {
    let src = campaign(&format!(
        r#"[optimize]
max_evals = 60

[optimize.objective]
name = "margin"
path = "margin_db"
goal = "target"
target = 3.0

{}"#,
        P3_PARAMS.replace("STEPS", "")
    ));
    let a = kshana::api::run_toml(&src).unwrap();
    let b = kshana::api::run_toml(&src).unwrap();
    assert_eq!(a.json, b.json);
    assert_eq!(a.svg, b.svg);
    assert_eq!(a.summary, b.summary);
    let v: Value = serde_json::from_str(&a.json).unwrap();
    let o = &v["optimize"];
    let evals = o["evals"].as_u64().unwrap();
    assert_eq!(o["trace"].as_array().unwrap().len() as u64, evals);
    assert_eq!(v["reproducibility"]["runs_total"].as_u64(), Some(evals));
    // Every numeric leaf of the section has a unit.
    for k in [
        "optimize.best_metric",
        "optimize.best_score",
        "optimize.evals",
    ] {
        assert!(v["units"].get(k).is_some(), "no unit for {k}");
    }
}

#[test]
fn malformed_sections_are_refused_with_a_reason() {
    let bad = [
        ("method = \"simplex\"", "method must be"),
        ("method = \"grid\"", "steps of at least two"),
    ];
    for (line, want) in bad {
        let src = campaign(&format!(
            "[optimize]\n{line}\n[optimize.objective]\nname = \"m\"\npath = \"margin_db\"\n\n{}",
            P3_PARAMS.replace("STEPS", "")
        ));
        let e = kshana::api::run_toml(&src).unwrap_err();
        assert!(e.contains(want), "{e}");
    }
}
