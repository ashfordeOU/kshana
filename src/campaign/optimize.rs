// SPDX-License-Identifier: AGPL-3.0-only
//! `[optimize]`: a bounded search over one to three scenario keys for the best value
//! of one metric (CAP-32).
//!
//! Two methods share the campaign's member-run ledger, so every evaluation is a real
//! run of the named kind and lands in the reproducibility digest:
//!
//! * `grid`: every node of a `steps`-per-axis grid, with the generic sweep's axis
//!   values, so a `grid` optimisation and a `[sweep]` over the same range run the same
//!   numbers.
//! * `nelder-mead`: a deterministic Nelder–Mead simplex in coordinates normalised to
//!   [0, 1] per axis (natural-log spacing on a log axis, the sweep's own mapping),
//!   with trial points projected onto the box and the standard coefficients 1, 2, ½, ½.
//!
//! A run whose metric is absent or non-finite scores +∞ and is kept in the trace. The
//! optimum is local to the box and the start; it is MODELLED, never a global claim.
//! The protocol and its bars are pre-registered in
//! `docs/design/evidence/cap32-optimize/PREREGISTRATION.md`.

use super::*;

fn default_method() -> String {
    "nelder-mead".to_string()
}

fn default_max_evals() -> usize {
    200
}

fn default_step() -> f64 {
    0.1
}

fn default_ftol() -> f64 {
    1e-10
}

fn default_xtol() -> f64 {
    1e-8
}

fn default_goal() -> String {
    "minimize".to_string()
}

/// One searched scenario key.
#[derive(Clone, Debug, Deserialize, Serialize)]
#[serde(deny_unknown_fields)]
pub struct ParamCfg {
    /// Parameter name (letters, digits, `_` and `-`).
    pub name: String,
    /// Dotted scenario key the parameter writes.
    pub key: String,
    /// The key's unit.
    pub unit: String,
    /// Lower bound.
    pub lo: f64,
    /// Upper bound.
    pub hi: f64,
    /// `lin` or `log`.
    #[serde(default = "default_scale")]
    pub scale: String,
    /// Nelder–Mead start value; the box midpoint (in the axis scale) when omitted.
    #[serde(default)]
    pub start: Option<f64>,
    /// Grid values along this parameter, endpoints included (`grid` only; at least two).
    #[serde(default)]
    pub steps: Option<usize>,
}

/// The quantity optimised.
#[derive(Clone, Debug, Deserialize, Serialize)]
#[serde(deny_unknown_fields)]
pub struct ObjectiveCfg {
    /// Objective name (letters, digits, `_` and `-`).
    pub name: String,
    /// Result path of the metric; `[i]` and `[-1]` index arrays.
    pub path: String,
    /// The metric's unit; looked up in the result's own units block when omitted.
    #[serde(default)]
    pub unit: Option<String>,
    /// `minimize`, `maximize`, or `target` (minimise `|metric - target|`).
    #[serde(default = "default_goal")]
    pub goal: String,
    /// The target value, in the metric's unit (`target` only).
    #[serde(default)]
    pub target: Option<f64>,
}

/// The `[optimize]` section.
#[derive(Clone, Debug, Deserialize, Serialize)]
#[serde(deny_unknown_fields)]
pub struct OptimizeCfg {
    /// The base scenario.
    pub scenario: toml::Value,
    /// `grid` or `nelder-mead`.
    #[serde(default = "default_method")]
    pub method: String,
    /// One to three searched keys.
    pub params: Vec<ParamCfg>,
    /// The quantity optimised.
    pub objective: ObjectiveCfg,
    /// Nelder–Mead evaluation budget (at least the simplex's `n + 1` vertices).
    #[serde(default = "default_max_evals")]
    pub max_evals: usize,
    /// Nelder–Mead initial simplex step, in normalised coordinates (0, 1].
    #[serde(default = "default_step")]
    pub step: f64,
    /// Nelder–Mead stop: the simplex's score spread at or below this.
    #[serde(default = "default_ftol")]
    pub ftol: f64,
    /// Nelder–Mead stop: the simplex's normalised size at or below this (with `ftol`).
    #[serde(default = "default_xtol")]
    pub xtol: f64,
    /// Realisations per evaluation; above one the metric is the mean over the same
    /// seeds at every evaluation (common random numbers).
    #[serde(default = "default_one_usize")]
    pub runs: usize,
    /// Integer scenario key holding the seed.
    #[serde(default = "default_seed_key")]
    pub seed_key: String,
}

/// A searched parameter as run.
#[derive(Clone, Debug, Serialize)]
pub struct ParamOut {
    /// Dotted scenario key.
    pub key: String,
    /// Unit of the key.
    pub unit: String,
    /// Lower bound, in `unit`.
    pub lo: f64,
    /// Upper bound, in `unit`.
    pub hi: f64,
    /// `lin` or `log`.
    pub scale: String,
}

/// The objective as run.
#[derive(Clone, Debug, Serialize)]
pub struct ObjectiveOut {
    /// Result path of the metric.
    pub path: String,
    /// Unit of the metric.
    pub unit: String,
    /// `minimize`, `maximize` or `target`.
    pub goal: String,
    /// The target value, in `unit` (`target` only).
    #[serde(skip_serializing_if = "Option::is_none")]
    pub target: Option<f64>,
}

/// One evaluation.
#[derive(Clone, Debug, Serialize)]
pub struct EvalOut {
    /// The parameter values, by name, in each parameter's unit.
    pub coords: BTreeMap<String, f64>,
    /// The metric (the seed mean when `runs > 1`); `None` when absent or non-finite.
    pub metric: Option<f64>,
}

/// The `optimize` section of the result.
#[derive(Clone, Debug, Serialize)]
pub struct OptimizeOut {
    /// Kind of the optimised scenario.
    pub scenario_kind: String,
    /// `grid` or `nelder-mead`.
    pub method: String,
    /// Realisations per evaluation (count).
    pub runs: usize,
    /// Parameter names in document order.
    pub param_order: Vec<String>,
    /// The searched parameters, by name.
    pub params: BTreeMap<String, ParamOut>,
    /// The objective's name.
    pub objective_name: String,
    /// The objective.
    pub objective: ObjectiveOut,
    /// Number of evaluations (count).
    pub evals: usize,
    /// `tolerance`, `max_evals` or `grid_exhausted`.
    pub stop_reason: String,
    /// The best evaluation's parameter values, by name.
    pub best_coords: BTreeMap<String, f64>,
    /// The metric at the best evaluation, in the objective's unit.
    pub best_metric: Option<f64>,
    /// The best score: the metric (`minimize`), its negation (`maximize`) or
    /// `|metric - target|` (`target`), in the objective's unit; `None` when no
    /// evaluation produced a finite metric.
    pub best_score: Option<f64>,
    /// Every evaluation in the order it ran.
    pub trace: Vec<EvalOut>,
}

/// What the optimisers search: `n` normalised coordinates, each in [0, 1].
pub(crate) struct Search {
    pub max_evals: usize,
    pub step: f64,
    pub ftol: f64,
    pub xtol: f64,
}

/// The optimiser's stop condition.
#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub(crate) enum Stop {
    Tolerance,
    MaxEvals,
}

/// Deterministic bounded Nelder–Mead on [0, 1]^n. `f` is called once per evaluation,
/// in order; the result is the best point, its score and the stop condition. Points
/// outside the box are projected onto it before evaluation.
pub(crate) fn nelder_mead<F>(
    start: &[f64],
    s: &Search,
    mut f: F,
) -> Result<(Vec<f64>, f64, Stop), String>
where
    F: FnMut(&[f64]) -> Result<f64, String>,
{
    let n = start.len();
    let clamp = |x: Vec<f64>| -> Vec<f64> { x.into_iter().map(|v| v.clamp(0.0, 1.0)).collect() };
    let mut evals = 0usize;
    let mut eval = |x: &[f64], evals: &mut usize| -> Result<f64, String> {
        *evals += 1;
        let v = f(x)?;
        Ok(if v.is_finite() { v } else { f64::INFINITY })
    };
    // The initial simplex: the start, and one vertex per axis stepped inward from it
    // (away from the nearer bound, so no vertex collapses onto the start).
    let x0 = clamp(start.to_vec());
    let mut simplex: Vec<(Vec<f64>, f64)> = Vec::with_capacity(n + 1);
    let f0 = eval(&x0, &mut evals)?;
    simplex.push((x0.clone(), f0));
    for i in 0..n {
        let mut xi = x0.clone();
        xi[i] = if xi[i] + s.step <= 1.0 {
            xi[i] + s.step
        } else {
            xi[i] - s.step
        };
        let fi = eval(&xi, &mut evals)?;
        simplex.push((xi, fi));
    }
    let order = |sx: &mut Vec<(Vec<f64>, f64)>| {
        // Stable, total order: NaN cannot occur (scores are finite or +inf).
        sx.sort_by(|a, b| a.1.total_cmp(&b.1));
    };
    loop {
        order(&mut simplex);
        let best = simplex[0].1;
        let worst = simplex[n].1;
        let size = simplex[1..]
            .iter()
            .flat_map(|(x, _)| x.iter().zip(&simplex[0].0).map(|(a, b)| (a - b).abs()))
            .fold(0.0_f64, f64::max);
        let spread = if worst.is_finite() {
            worst - best
        } else {
            f64::INFINITY
        };
        if spread <= s.ftol && size <= s.xtol {
            return Ok((simplex[0].0.clone(), best, Stop::Tolerance));
        }
        if evals >= s.max_evals {
            return Ok((simplex[0].0.clone(), best, Stop::MaxEvals));
        }
        let mut centroid = vec![0.0; n];
        for (x, _) in &simplex[..n] {
            for (c, v) in centroid.iter_mut().zip(x) {
                *c += v / n as f64;
            }
        }
        let along = |t: f64| -> Vec<f64> {
            clamp(
                centroid
                    .iter()
                    .zip(&simplex[n].0)
                    .map(|(c, w)| c + t * (w - c))
                    .collect(),
            )
        };
        let xr = along(-1.0);
        let fr = eval(&xr, &mut evals)?;
        if fr < simplex[0].1 {
            let xe = along(-2.0);
            let fe = eval(&xe, &mut evals)?;
            simplex[n] = if fe < fr { (xe, fe) } else { (xr, fr) };
            continue;
        }
        if fr < simplex[n - 1].1 {
            simplex[n] = (xr, fr);
            continue;
        }
        // Contraction: outside when the reflection beat the worst, inside otherwise.
        let (xc, fc) = if fr < simplex[n].1 {
            let xc = along(-0.5);
            let fc = eval(&xc, &mut evals)?;
            (xc, fc)
        } else {
            let xc = along(0.5);
            let fc = eval(&xc, &mut evals)?;
            (xc, fc)
        };
        if fc < simplex[n].1.min(fr) {
            simplex[n] = (xc, fc);
            continue;
        }
        // Shrink towards the best vertex.
        let x_best = simplex[0].0.clone();
        for v in simplex.iter_mut().skip(1) {
            let xs: Vec<f64> = x_best
                .iter()
                .zip(&v.0)
                .map(|(b, x)| b + 0.5 * (x - b))
                .collect();
            let fs = eval(&xs, &mut evals)?;
            *v = (xs, fs);
        }
    }
}

/// The parameter value at normalised coordinate `u`: the sweep's own mapping, so a
/// grid node's `u = i / (steps - 1)` gives exactly the sweep's value.
fn denorm(p: &ParamCfg, u: f64) -> f64 {
    if p.scale == "log" {
        (p.lo.ln() + (p.hi.ln() - p.lo.ln()) * u).exp()
    } else {
        p.lo + (p.hi - p.lo) * u
    }
}

fn norm(p: &ParamCfg, v: f64) -> f64 {
    if p.scale == "log" {
        (v.ln() - p.lo.ln()) / (p.hi.ln() - p.lo.ln())
    } else {
        (v - p.lo) / (p.hi - p.lo)
    }
}

fn check(cfg: &OptimizeCfg) -> Result<(), String> {
    if cfg.params.is_empty() || cfg.params.len() > 3 {
        return Err(format!(
            "an optimisation takes one to three params, got {}",
            cfg.params.len()
        ));
    }
    check_name("objective name", &cfg.objective.name)?;
    let mut seen = Vec::new();
    for p in &cfg.params {
        check_name("param name", &p.name)?;
        if seen.contains(&p.name.as_str()) {
            return Err(format!("param `{}` is named twice", p.name));
        }
        seen.push(&p.name);
        if !(p.lo.is_finite() && p.hi.is_finite() && p.lo < p.hi) {
            return Err(format!("param `{}`: needs finite lo < hi", p.name));
        }
        if !matches!(p.scale.as_str(), "lin" | "log") {
            return Err(format!("param `{}`: scale must be lin or log", p.name));
        }
        if p.scale == "log" && p.lo <= 0.0 {
            return Err(format!(
                "param `{}`: a log param needs positive bounds",
                p.name
            ));
        }
        if let Some(s) = p.start {
            if !(s >= p.lo && s <= p.hi) {
                return Err(format!("param `{}`: start must lie in [lo, hi]", p.name));
            }
        }
        if cfg.method == "grid" && p.steps.is_none_or(|s| s < 2) {
            return Err(format!(
                "param `{}`: a grid needs steps of at least two",
                p.name
            ));
        }
    }
    match cfg.objective.goal.as_str() {
        "minimize" | "maximize" => {
            if cfg.objective.target.is_some() {
                return Err("objective.target is only read with goal = \"target\"".into());
            }
        }
        "target" => {
            if !cfg.objective.target.is_some_and(f64::is_finite) {
                return Err("goal = \"target\" needs a finite objective.target".into());
            }
        }
        other => {
            return Err(format!(
                "objective.goal must be minimize, maximize or target, got `{other}`"
            ))
        }
    }
    match cfg.method.as_str() {
        "grid" => {
            let total: usize = cfg.params.iter().map(|p| p.steps.unwrap_or(0)).product();
            if total > 100_000 {
                return Err(format!("a grid of {total} nodes is above the 100000 limit"));
            }
        }
        "nelder-mead" => {
            if cfg.params.iter().any(|p| p.steps.is_some()) {
                return Err("params.steps is only read with method = \"grid\"".into());
            }
            if cfg.max_evals < cfg.params.len() + 1 {
                return Err("max_evals must cover the initial simplex (params + 1)".into());
            }
            if !(cfg.step > 0.0 && cfg.step <= 1.0) {
                return Err("step must lie in (0, 1]".into());
            }
            if !(cfg.ftol >= 0.0 && cfg.xtol >= 0.0) {
                return Err("ftol and xtol must be non-negative".into());
            }
        }
        other => return Err(format!("method must be grid or nelder-mead, got `{other}`")),
    }
    Ok(())
}

fn score(obj: &ObjectiveCfg, metric: Option<f64>) -> f64 {
    let Some(m) = metric.filter(|m| m.is_finite()) else {
        return f64::INFINITY;
    };
    match obj.goal.as_str() {
        "maximize" => -m,
        "target" => (m - obj.target.unwrap_or(0.0)).abs(),
        _ => m,
    }
}

/// Run the `[optimize]` section.
pub(super) fn run_optimize(cfg: &OptimizeCfg, ledger: &mut Ledger) -> Result<OptimizeOut, String> {
    check(cfg)?;
    let runs = cfg.runs.max(1);
    let metric_cfg = [MetricCfg {
        name: cfg.objective.name.clone(),
        path: cfg.objective.path.clone(),
        unit: cfg.objective.unit.clone(),
    }];
    let mut trace: Vec<EvalOut> = Vec::new();
    let mut unit: Option<String> = None;
    let mut evaluate = |u: &[f64], ledger: &mut Ledger| -> Result<f64, String> {
        let coords: Vec<f64> = cfg
            .params
            .iter()
            .zip(u)
            .map(|(p, &x)| denorm(p, x))
            .collect();
        let mut node = cfg.scenario.clone();
        for (p, &v) in cfg.params.iter().zip(&coords) {
            crate::sweep::set_dotted(&mut node, &p.key, v)?;
        }
        let label = format!("optimize eval {}", trace.len());
        let (metric, doc) = if runs == 1 {
            let m = ledger.run(label, &node)?;
            (metric_values(&m, &metric_cfg)?[0], m)
        } else {
            let base = seed_of(&node, &cfg.seed_key)?;
            let (cols, first) = ensemble(
                ledger,
                &label,
                &node,
                &cfg.seed_key,
                base,
                runs,
                &metric_cfg,
            )?;
            let col = &cols[0];
            (Some(col.iter().sum::<f64>() / col.len() as f64), first)
        };
        let metric = metric.filter(|m| m.is_finite());
        if unit.is_none() {
            unit = Some(resolve_unit(
                &cfg.objective.unit,
                &doc.doc,
                &cfg.objective.path,
            )?);
        }
        trace.push(EvalOut {
            coords: cfg
                .params
                .iter()
                .zip(&coords)
                .map(|(p, &v)| (p.name.clone(), v))
                .collect(),
            metric,
        });
        Ok(score(&cfg.objective, metric))
    };
    let stop_reason = if cfg.method == "grid" {
        let shape: Vec<usize> = cfg.params.iter().map(|p| p.steps.unwrap_or(2)).collect();
        let fractions: Vec<Vec<f64>> = shape
            .iter()
            .map(|&n| (0..n).map(|i| i as f64 / (n - 1) as f64).collect())
            .collect();
        let total: usize = shape.iter().product();
        for flat in 0..total {
            let u = crate::sweep::coords_of(flat, &fractions, &shape);
            evaluate(&u, ledger)?;
        }
        "grid_exhausted"
    } else {
        let start: Vec<f64> = cfg
            .params
            .iter()
            .map(|p| p.start.map_or(0.5, |s| norm(p, s)))
            .collect();
        let search = Search {
            max_evals: cfg.max_evals,
            step: cfg.step,
            ftol: cfg.ftol,
            xtol: cfg.xtol,
        };
        let (_, _, stop) = nelder_mead(&start, &search, |u| evaluate(u, ledger))?;
        match stop {
            Stop::Tolerance => "tolerance",
            Stop::MaxEvals => "max_evals",
        }
    };
    // The best evaluation is the first with the lowest score, read from the trace, so
    // the grid's and the simplex's best are chosen by one rule.
    let mut best: Option<(usize, f64)> = None;
    for (i, e) in trace.iter().enumerate() {
        let s = score(&cfg.objective, e.metric);
        if s.is_finite() && best.is_none_or(|(_, b)| s < b) {
            best = Some((i, s));
        }
    }
    let (best_coords, best_metric, best_score) = match best {
        Some((i, s)) => (trace[i].coords.clone(), trace[i].metric, Some(s)),
        None => (BTreeMap::new(), None, None),
    };
    Ok(OptimizeOut {
        scenario_kind: kind_of(&cfg.scenario),
        method: cfg.method.clone(),
        runs,
        param_order: cfg.params.iter().map(|p| p.name.clone()).collect(),
        params: cfg
            .params
            .iter()
            .map(|p| {
                (
                    p.name.clone(),
                    ParamOut {
                        key: p.key.clone(),
                        unit: p.unit.clone(),
                        lo: p.lo,
                        hi: p.hi,
                        scale: p.scale.clone(),
                    },
                )
            })
            .collect(),
        objective_name: cfg.objective.name.clone(),
        objective: ObjectiveOut {
            path: cfg.objective.path.clone(),
            unit: unit.unwrap_or_default(),
            goal: cfg.objective.goal.clone(),
            target: cfg.objective.target,
        },
        evals: trace.len(),
        stop_reason: stop_reason.into(),
        best_coords,
        best_metric,
        best_score,
        trace,
    })
}

/// The `optimize.*` entries of the campaign units block.
pub(super) fn add_units(b: &mut UnitsBuilder, o: &OptimizeOut) {
    use ProvenanceClass::*;
    b.add(
        "optimize.runs",
        "count",
        Input,
        "realisations per evaluation",
    );
    b.add(
        "optimize.evals",
        "count",
        Computed,
        "evaluations the optimiser ran",
    );
    for (name, p) in &o.params {
        b.add(
            &format!("optimize.params.{name}.lo"),
            &p.unit,
            Input,
            &format!("lower bound of the scenario key {}", p.key),
        );
        b.add(
            &format!("optimize.params.{name}.hi"),
            &p.unit,
            Input,
            &format!("upper bound of the scenario key {}", p.key),
        );
        b.add(
            &format!("optimize.best_coords.{name}"),
            &p.unit,
            Computed,
            &format!("value of the scenario key {} at the best evaluation", p.key),
        );
        b.add(
            &format!("optimize.trace[].coords.{name}"),
            &p.unit,
            Computed,
            &format!("value of the scenario key {} at this evaluation", p.key),
        );
    }
    let u = &o.objective.unit;
    let what = &o.objective.path;
    if o.objective.target.is_some() {
        b.add(
            "optimize.objective.target",
            u,
            Input,
            &format!("target value of {what}"),
        );
    }
    b.add(
        "optimize.best_metric",
        u,
        Computed,
        &format!("{what} at the best evaluation"),
    );
    b.add(
        "optimize.best_score",
        u,
        Computed,
        "the minimised score: the metric, its negation, or its distance from the target",
    );
    b.add(
        "optimize.trace[].metric",
        u,
        Computed,
        &format!("{what} of this evaluation (the seed mean when runs > 1)"),
    );
}

/// The `optimize` part of the one-line summary.
pub(super) fn summary_part(o: &OptimizeOut) -> String {
    let at = o
        .param_order
        .iter()
        .map(|n| {
            format!(
                "{n}={}",
                o.best_coords
                    .get(n)
                    .map_or("n/a".to_string(), |v| fmt_num(*v))
            )
        })
        .collect::<Vec<_>>()
        .join(", ");
    format!(
        "optimize `{}` ({} {}) of `{}` by {}: {} evals ({}), best {} at [{at}]",
        o.objective_name,
        o.objective.goal,
        o.objective.target.map_or(String::new(), fmt_num),
        o.scenario_kind,
        o.method,
        o.evals,
        o.stop_reason,
        o.best_metric.map_or("n/a".to_string(), fmt_num),
    )
    .replace(" () ", " ")
}

#[cfg(test)]
mod tests {
    use super::*;

    // P1 of the pre-registration: Rosenbrock on [-2, 2]^2 from (-1.2, 1).
    #[test]
    fn nelder_mead_meets_the_preregistered_rosenbrock_bar() {
        let to_x = |u: &[f64]| (-2.0 + 4.0 * u[0], -2.0 + 4.0 * u[1]);
        let start = [(-1.2 + 2.0) / 4.0, (1.0 + 2.0) / 4.0];
        let s = Search {
            max_evals: 2000,
            step: 0.1,
            ftol: 1e-14,
            xtol: 1e-10,
        };
        let mut n = 0;
        let (u, f, _) = nelder_mead(&start, &s, |u| {
            n += 1;
            let (x, y) = to_x(u);
            Ok((1.0 - x).powi(2) + 100.0 * (y - x * x).powi(2))
        })
        .unwrap();
        let (x, y) = to_x(&u);
        eprintln!("rosenbrock: f* = {f:e} at ({x}, {y}) after {n} evaluations");
        assert!(n <= 2000 + 2, "budget overrun: {n}");
        assert!(f <= 1e-8, "f* = {f:e}");
        assert!((x - 1.0).abs() <= 1e-3 && (y - 1.0).abs() <= 1e-3);
    }

    #[test]
    fn a_non_finite_score_is_never_the_best() {
        let s = Search {
            max_evals: 200,
            step: 0.1,
            ftol: 1e-12,
            xtol: 1e-10,
        };
        let (u, f, _) = nelder_mead(&[0.5], &s, |u| {
            Ok(if u[0] > 0.7 {
                f64::NAN
            } else {
                (u[0] - 0.3).powi(2)
            })
        })
        .unwrap();
        assert!(f.is_finite() && (u[0] - 0.3).abs() < 1e-4);
    }

    #[test]
    fn the_grid_mapping_is_the_sweeps() {
        let p = ParamCfg {
            name: "r".into(),
            key: "range_km".into(),
            unit: "km".into(),
            lo: 500.0,
            hi: 50000.0,
            scale: "log".into(),
            start: None,
            steps: Some(41),
        };
        let sweep = crate::sweep::GenericAxis {
            key: "range_km".into(),
            start: 500.0,
            stop: 50000.0,
            steps: 41,
            scale: "log".into(),
            unit: None,
        }
        .values();
        for (i, v) in sweep.iter().enumerate() {
            assert_eq!(denorm(&p, i as f64 / 40.0).to_bits(), v.to_bits());
        }
    }
}
