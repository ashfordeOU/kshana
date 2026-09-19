// SPDX-License-Identifier: AGPL-3.0-only
//! `lunar-time-budget` scenario — a runnable wrapper over the Coordinated Lunar Time
//! (LTC) end-to-end **time-error budget** ([`crate::lunar_time_budget`]).
//!
//! A single-τ error table invites the objection *"you picked the averaging time that
//! flatters your clock."* This scenario answers it: it assembles the seven LTC error
//! terms as time-error curves `x_i(τ)` (seconds) across a whole grid of averaging times,
//! root-sums them into `x_Σ(τ)`, and locates the **crossover** τ at which the growing
//! clock term overtakes the (constant) real-time frame-realisation term. Below the
//! crossover the budget is frame-limited (the reference-frame realisation dominates);
//! above it the clock dominates. Where the crossover falls depends entirely on the clock
//! class — the reproducible headline that a single-τ number hides.
//!
//! ## Validated vs Modelled
//! The τ-slopes are closed-form and analytically checkable (clock `τ^{+1/2}` / `τ^{+1}`,
//! floors `τ^0`, measurement `τ^{-1/2}`), and the clock rows are the
//! [`crate::clock_specs`] curves calibrated to published one-day specs. The *magnitudes*
//! of the RF/optical-link, frame-realisation, relativistic-residual and ephemeris floors
//! are **Modelled** budget allocations (documented defaults, caller-overridable), not
//! measurements — the contribution is the reproducible clock-vs-frame crossover, not a
//! certified per-term number. Nothing here is certified for operational timekeeping.

use crate::clock_specs::{x_clock_ns, LunarClock};
use crate::lunar_time_budget::{
    clock_crossover_table, default_tau_grid, lunar_time_budget, BudgetParams,
};
use serde::Deserialize;

/// The honesty label carried on the result document.
const LABEL: &str = "MODELLED end-to-end LTC time-error budget. The τ-slopes are \
closed-form and analytically checkable (clock τ^{+1/2}/τ^{+1}, floors τ^0, measurement \
τ^{-1/2}) and the clock rows reproduce the published one-day clock specs; the RF/optical \
link, frame-realisation, relativistic-residual and ephemeris floor MAGNITUDES are \
Modelled budget allocations (documented defaults, caller-overridable), not measurements. \
The contribution is the reproducible clock-vs-frame crossover τ, not a certified per-term \
number. Not certified for operational timekeeping.";

/// Map a scenario clock-class string to a [`LunarClock`]. The single name mapping both the
/// single-clock `clock` field and the per-clock `clocks` crossover list go through, so the two
/// inputs can never drift apart on spelling or on what counts as an unknown name.
fn parse_clock_name(name: &str) -> Result<LunarClock, String> {
    match name {
        "optical-master" => Ok(LunarClock::OpticalMaster),
        "passive-h-maser" | "phm" => Ok(LunarClock::Phm),
        "rafs" => Ok(LunarClock::Rafs),
        "mini-rafs" => Ok(LunarClock::MiniRafs),
        other => Err(format!(
            "unknown clock {other:?}; expected one of optical-master, \
             passive-h-maser, rafs, mini-rafs"
        )),
    }
}

/// Units + provenance class for the fields the per-clock crossover table adds to the result
/// document. The rest of the document predates this block and is described in
/// `docs/SCHEMA.md`; this names only what `clock_crossovers` introduces.
fn crossover_units() -> serde_json::Value {
    serde_json::json!({
        "clock_crossovers.sigma_y_one_s": { "unit": "1", "provenance": "spec" },
        "clock_crossovers.x_one_day_s": { "unit": "s", "provenance": "computed" },
        "clock_crossovers.crossover_tau_s": { "unit": "s", "provenance": "computed" },
        "clock_crossovers.crossover_tau_s_closed_form": {
            "unit": "s",
            "provenance": "closed-form"
        },
        "clock_crossovers.closed_form_rel_diff": {
            "unit": "1",
            "provenance": "internal-consistency"
        }
    })
}

/// The `lunar-time-budget` scenario. Every field is optional: with no fields the budget
/// runs for a passive-H-maser master clock over the default 1 s … 1e7 s τ grid, and the
/// per-clock crossover table covers all four clock classes.
#[derive(Clone, Debug, Default, Deserialize)]
pub struct LunarTimeBudgetScenario {
    /// On-board clock class driving the (growing) clock term. One of `optical-master`,
    /// `passive-h-maser`, `rafs`, `mini-rafs` (default `passive-h-maser`).
    pub clock: Option<String>,
    /// Averaging-time grid lower bound (s). Default 1.0.
    pub tau_min_s: Option<f64>,
    /// Averaging-time grid upper bound (s). Default 1e7 (≈ 116 days).
    pub tau_max_s: Option<f64>,
    /// Grid density (points per decade of τ). Default 8.
    pub points_per_decade: Option<u32>,
    /// Clock classes for the per-clock `clock_crossovers` table — the whole of P3 Table 2 in
    /// one run, every row against the same frame term. Names are the same set the `clock`
    /// field accepts. Default: all four classes, best (optical) to coarsest (miniRAFS).
    pub clocks: Option<Vec<String>>,
}

impl LunarTimeBudgetScenario {
    /// Resolve the requested clock-class string to a [`LunarClock`].
    fn resolve_clock(&self) -> Result<LunarClock, String> {
        parse_clock_name(self.clock.as_deref().unwrap_or("passive-h-maser"))
    }

    /// Resolve the clock classes for the per-clock crossover table. Default: all four, in
    /// [`LunarClock::all`] order. An unknown name is an error, exactly as for `clock`.
    fn resolve_crossover_clocks(&self) -> Result<Vec<LunarClock>, String> {
        match &self.clocks {
            None => Ok(LunarClock::all().to_vec()),
            Some(names) if names.is_empty() => {
                Err("clocks must name at least one clock class".to_string())
            }
            Some(names) => names.iter().map(|n| parse_clock_name(n)).collect(),
        }
    }

    /// Build the τ grid. With no grid overrides this is exactly
    /// [`default_tau_grid`]; any override switches to a log-spaced grid from
    /// `tau_min_s` to `tau_max_s` at `points_per_decade`.
    fn build_tau_grid(&self) -> Result<Vec<f64>, String> {
        if self.tau_min_s.is_none() && self.tau_max_s.is_none() && self.points_per_decade.is_none()
        {
            return Ok(default_tau_grid());
        }
        let lo = self.tau_min_s.unwrap_or(1.0);
        let hi = self.tau_max_s.unwrap_or(1.0e7);
        let ppd = self.points_per_decade.unwrap_or(8);
        if !(lo.is_finite() && lo > 0.0) {
            return Err(format!("tau_min_s must be finite and positive, got {lo}"));
        }
        if !(hi.is_finite() && hi > lo) {
            return Err(format!(
                "tau_max_s must be finite and greater than tau_min_s ({lo}), got {hi}"
            ));
        }
        if ppd == 0 {
            return Err("points_per_decade must be ≥ 1".to_string());
        }
        let decades = (hi / lo).log10();
        let n = (decades * ppd as f64).round() as i64 + 1;
        Ok((0..n)
            .map(|k| lo * 10f64.powf(k as f64 / ppd as f64))
            .collect())
    }

    /// G11 — the long-form reproducibility table, emitted at runtime as
    /// `<scenario>.table.csv`.
    ///
    /// The budget's array-valued fields (`tau_s`, the seven per-term `x_s` curves and the
    /// root-sum-square total `x_sigma_s`) reach the report only as JSON arrays. That is
    /// what a released table truncated at 400 characters, publishing 23 of 57 averaging
    /// times under a column that claimed all of them, and what forced the manuscript to
    /// rebuild the per-term curves from closed forms instead of reading them. One row per
    /// (tau, term) pair cannot be truncated into something that still looks whole: a short
    /// file is visibly short.
    ///
    /// Layout is long/tidy rather than one column per term, so adding a term is a new set
    /// of rows rather than a schema change for every consumer. The total carries the
    /// reserved term name `total`.
    ///
    /// Three different precisions, each chosen for what the column is *for*:
    ///
    /// * `i` — the integer grid index. This is the join key. An index cannot be rounded,
    ///   so joining this table to another run, or to a released table, is exact no matter
    ///   what any float formatting does.
    /// * `tau_s` — 13 significant figures. τ is an independent variable, so a reader must
    ///   be able to match it against the grid rather than merely read it; 13 figures
    ///   round-trips for that purpose while stopping short of the last few bits, where
    ///   `powf` is not identical across platform libm implementations.
    /// * `x_s` — 7 significant figures, the same choice `realtime_frame_eop::to_csv`
    ///   makes. Full `f64` precision here would expose last-ULP differences and fork the
    ///   bytes between builds of the same source, which is a defect this programme has
    ///   measured elsewhere. Seven figures is far beyond what any of these terms is known
    ///   to, and the JSON report still carries the unrounded values.
    pub fn to_csv(&self) -> Result<String, String> {
        let clock = self.resolve_clock()?;
        let taus = self.build_tau_grid()?;
        let params = BudgetParams::for_clock(clock);
        let budget = lunar_time_budget(&params, &taus);

        let mut s = String::new();
        s.push_str(
            "# lunar-time-budget reproducibility table (emitted at runtime as \
             <scenario>.table.csv) - one row per (averaging time, budget term). The term \
             named `total` is the root-sum-square x_sigma(tau) of the others. `i` is the \
             grid index and is the exact join key. Units: \
             tau_s seconds, x_s seconds. Provenance: the clock term is Validated against \
             published clock specifications; the link, frame, relativistic and ephemeris \
             floor magnitudes are Modelled budget allocations.\n",
        );
        s.push_str("i,tau_s,term,x_s,grows_with_tau\n");
        for (i, tau) in budget.tau_s.iter().enumerate() {
            for t in &budget.terms {
                let x = t
                    .x_s
                    .get(i)
                    .copied()
                    .ok_or_else(|| format!("term {} is shorter than the tau grid", t.name))?;
                s.push_str(&format!(
                    "{},{:.12e},{},{:.6e},{}\n",
                    i, tau, t.name, x, t.grows_with_tau
                ));
            }
            let total = budget
                .x_sigma_s
                .get(i)
                .copied()
                .ok_or_else(|| "x_sigma_s is shorter than the tau grid".to_string())?;
            s.push_str(&format!("{},{:.12e},total,{:.6e},false\n", i, tau, total));
        }
        Ok(s)
    }

    /// Run the scenario, returning `(json, summary)`.
    pub fn run_json(&self) -> Result<(String, String), String> {
        let clock = self.resolve_clock()?;
        let taus = self.build_tau_grid()?;
        let params = BudgetParams::for_clock(clock);
        let budget = lunar_time_budget(&params, &taus);

        // G10: the whole of P3 Table 2 from ONE run — a crossover row per clock class, every
        // row bisected against the same frame term δr/c this budget uses, so the clock class
        // is the only variable across the rows.
        let crossovers =
            clock_crossover_table(params.frame_pos_error_m, &self.resolve_crossover_clocks()?);

        // Serialize the budget document and stamp it with the kind + honesty label.
        let mut v = serde_json::to_value(&budget).map_err(|e| e.to_string())?;
        if let Some(obj) = v.as_object_mut() {
            obj.insert(
                "kind".to_string(),
                serde_json::Value::from("lunar-time-budget"),
            );
            obj.insert("label".to_string(), serde_json::Value::from(LABEL));
            obj.insert(
                "clock_crossovers".to_string(),
                serde_json::to_value(&crossovers).map_err(|e| e.to_string())?,
            );
            obj.insert("units".to_string(), crossover_units());
        }
        let json = serde_json::to_string_pretty(&v).map_err(|e| e.to_string())?;

        let x_1day_ns = x_clock_ns(clock, 86_400.0);
        let summary = format!(
            "lunar-time-budget | clock {} | 7-term x_Σ(τ) over {} τ-points \
             ({:.0}–{:.0e} s) | crossover τ {:.3e} s (x {:.3e} s) | frame floor \
             {:.3e} s | clock x(1 d) {:.3} ns (MODELLED)",
            budget.clock,
            taus.len(),
            taus.first().copied().unwrap_or(0.0),
            taus.last().copied().unwrap_or(0.0),
            budget.crossover_tau_s,
            budget.crossover_x_s,
            budget.frame_term_s,
            x_1day_ns,
        );
        Ok((json, summary))
    }
}

#[cfg(test)]
mod tests {
    use super::*;
    use crate::clock_specs::sigma_y;
    use serde_json::Value;

    #[test]
    fn default_scenario_runs_and_is_modelled() {
        let (json, summary) = LunarTimeBudgetScenario::default().run_json().unwrap();
        let v: Value = serde_json::from_str(&json).unwrap();
        assert_eq!(v["kind"], "lunar-time-budget");
        assert!(v["label"].as_str().unwrap().contains("MODELLED"));
        assert_eq!(v["terms"].as_array().unwrap().len(), 7);
        assert_eq!(v["clock"], "passive-h-maser");
        assert!(summary.contains("lunar-time-budget"));
        assert!(summary.contains("MODELLED"));
    }

    #[test]
    fn rss_total_dominates_each_term_everywhere() {
        let (json, _s) = LunarTimeBudgetScenario::default().run_json().unwrap();
        let v: Value = serde_json::from_str(&json).unwrap();
        let sigma: Vec<f64> = v["x_sigma_s"]
            .as_array()
            .unwrap()
            .iter()
            .map(|x| x.as_f64().unwrap())
            .collect();
        for term in v["terms"].as_array().unwrap() {
            for (i, xi) in term["x_s"].as_array().unwrap().iter().enumerate() {
                assert!(sigma[i] >= xi.as_f64().unwrap() - 1e-24);
            }
        }
    }

    #[test]
    fn phm_crossover_matches_the_flicker_floor_closed_form() {
        // Oracle: for the flicker-FM PHM, x_clock = floor·τ, so the crossover with the
        // constant frame term δr/c is τ* = (δr/c)/floor — a closed-form equality the
        // scenario JSON must reproduce.
        let (json, _s) = LunarTimeBudgetScenario::default().run_json().unwrap();
        let v: Value = serde_json::from_str(&json).unwrap();
        let tau_star = v["crossover_tau_s"].as_f64().unwrap();
        let frame = v["frame_term_s"].as_f64().unwrap();
        let floor = sigma_y(&LunarClock::Phm.powerlaw(), 1.0);
        let analytic = frame / floor;
        assert!(
            (tau_star - analytic).abs() / analytic < 1e-9,
            "crossover {tau_star} vs closed form {analytic}"
        );
    }

    #[test]
    fn is_deterministic() {
        let scn = LunarTimeBudgetScenario::default();
        assert_eq!(scn.run_json().unwrap(), scn.run_json().unwrap());
    }

    #[test]
    fn custom_grid_and_clock_parse() {
        let scn = LunarTimeBudgetScenario {
            clock: Some("optical-master".to_string()),
            tau_min_s: Some(1.0),
            tau_max_s: Some(1.0e6),
            points_per_decade: Some(4),
            ..Default::default()
        };
        let (json, _s) = scn.run_json().unwrap();
        let v: Value = serde_json::from_str(&json).unwrap();
        assert_eq!(v["clock"], "optical-master");
        // 6 decades × 4/decade + 1 = 25 τ points.
        assert_eq!(v["tau_s"].as_array().unwrap().len(), 25);
    }

    #[test]
    fn unknown_clock_is_rejected() {
        let scn = LunarTimeBudgetScenario {
            clock: Some("grandfather".to_string()),
            ..Default::default()
        };
        assert!(scn.run_json().is_err());
    }

    /// The long-form table publishes EVERY averaging time, for every term.
    ///
    /// This is the regression guard for G11. The released `p3_time_budget.csv` carried
    /// `tau_s` and `x_sigma_s` as JSON arrays that a consumer truncated at 400 characters,
    /// publishing 23 of 57 averaging times under a column that claimed all of them. A row
    /// per (tau, term) cannot fail that way silently: a truncated file is visibly short,
    /// and this test pins the exact shape.
    #[test]
    fn long_form_table_publishes_every_tau_and_term() {
        let scn = LunarTimeBudgetScenario::default();
        let csv = scn.to_csv().expect("csv");
        let body: Vec<&str> = csv
            .lines()
            .filter(|l| !l.starts_with('#') && !l.starts_with("i,"))
            .collect();

        // 57 grid points (7 decades x 8 per decade + 1), 7 budget terms plus the total.
        assert_eq!(
            body.len(),
            57 * 8,
            "one row per (tau, term) plus a total per tau"
        );

        let idx: Vec<usize> = body
            .iter()
            .map(|l| l.split(',').next().unwrap().parse().unwrap())
            .collect();
        assert_eq!(*idx.iter().max().unwrap(), 56, "grid index runs 0..=56");
        for i in 0..=56usize {
            assert_eq!(
                idx.iter().filter(|&&j| j == i).count(),
                8,
                "tau index {i} must carry all 8 rows"
            );
        }
    }

    /// The `total` row is the root-sum-square of the terms beside it, at every tau.
    ///
    /// Without this the total is just another number in the file and a consumer has no way
    /// to tell a correct table from a stale one.
    #[test]
    fn long_form_total_is_the_rss_of_its_own_terms() {
        let scn = LunarTimeBudgetScenario::default();
        let csv = scn.to_csv().expect("csv");
        let mut by_tau: std::collections::BTreeMap<usize, (Vec<f64>, Option<f64>)> =
            std::collections::BTreeMap::new();
        for l in csv
            .lines()
            .filter(|l| !l.starts_with('#') && !l.starts_with("i,"))
        {
            let f: Vec<&str> = l.split(',').collect();
            let i: usize = f[0].parse().unwrap();
            let x: f64 = f[3].parse().unwrap();
            let e = by_tau.entry(i).or_default();
            if f[2] == "total" {
                e.1 = Some(x);
            } else {
                e.0.push(x);
            }
        }
        assert_eq!(by_tau.len(), 57);
        for (i, (terms, total)) in &by_tau {
            assert_eq!(terms.len(), 7, "tau {i} must carry seven terms");
            let rss = terms.iter().map(|v| v * v).sum::<f64>().sqrt();
            let total = total.expect("a total row");
            // Both sides are printed at seven significant figures, so compare at that.
            assert!(
                (rss - total).abs() / total < 1e-6,
                "tau {i}: total {total:e} is not the RSS {rss:e} of its terms"
            );
        }
    }

    /// The table follows the grid it was asked for, not a hard-coded one.
    #[test]
    fn long_form_table_follows_the_requested_grid() {
        let scn = LunarTimeBudgetScenario {
            tau_min_s: Some(1.0),
            tau_max_s: Some(100.0),
            points_per_decade: Some(4),
            ..LunarTimeBudgetScenario::default()
        };
        let csv = scn.to_csv().expect("csv");
        let rows = csv
            .lines()
            .filter(|l| !l.starts_with('#') && !l.starts_with("i,"))
            .count();
        // 2 decades x 4 per decade + 1 = 9 tau points, still 8 rows each.
        assert_eq!(rows, 9 * 8);
    }

    /// Emitting the table must not change what the run already reported.
    ///
    /// R1 for this change: the CSV is a new artifact, not a new view that quietly
    /// reformats the report.
    #[test]
    fn emitting_the_table_does_not_change_the_json() {
        let scn = LunarTimeBudgetScenario::default();
        let (before, _) = scn.run_json().expect("json");
        let _ = scn.to_csv().expect("csv");
        let (after, _) = scn.run_json().expect("json");
        assert_eq!(before, after);
    }

    /// P3 Table 2 as the paper prints it: `(clock, printed τ*, half of the last printed digit)`.
    const P3_TABLE2: [(&str, f64, f64); 4] = [
        ("optical-master", 9.607e6, 5.0e2),
        ("passive-h-maser", 8.689e4, 5.0e0),
        ("rafs", 1.001e4, 5.0e0),
        ("mini-rafs", 3.78, 5.0e-3),
    ];

    fn crossovers_of(v: &Value) -> Vec<&Value> {
        v["clock_crossovers"]
            .as_array()
            .expect("clock_crossovers array")
            .iter()
            .collect()
    }

    #[test]
    fn one_run_emits_a_crossover_for_every_clock_class_in_order() {
        // G10: a single default run must carry the whole per-clock crossover table, in
        // LunarClock::all() order — not one crossover for whichever clock `clock` named.
        let (json, _s) = LunarTimeBudgetScenario::default().run_json().unwrap();
        let v: Value = serde_json::from_str(&json).unwrap();
        let rows = crossovers_of(&v);
        assert_eq!(rows.len(), 4, "expected four clock-crossover rows");
        let got: Vec<&str> = rows.iter().map(|r| r["clock"].as_str().unwrap()).collect();
        assert_eq!(
            got,
            vec!["optical-master", "passive-h-maser", "rafs", "mini-rafs"]
        );
        // Every row must carry the full field set.
        for r in &rows {
            for f in [
                "clock",
                "noise_type",
                "sigma_y_one_s",
                "x_one_day_s",
                "crossover_tau_s",
                "crossover_tau_s_closed_form",
                "closed_form_rel_diff",
            ] {
                assert!(!r[f].is_null(), "row {} missing field {f}", r["clock"]);
            }
        }
    }

    #[test]
    fn one_run_reproduces_p3_table_2() {
        // ACCEPTANCE (G10). The four per-clock crossovers are ENGINE OUTPUTS of one run and
        // must reproduce P3 Table 2 to the precision the paper prints:
        //   optical-master 9.607e6 s | passive-h-maser 8.689e4 s (abstract 86894.3 s)
        //   rafs 1.001e4 s           | mini-rafs 3.78 s
        let (json, _s) = LunarTimeBudgetScenario::default().run_json().unwrap();
        let v: Value = serde_json::from_str(&json).unwrap();
        let rows = crossovers_of(&v);
        for (r, (name, printed, half_ulp)) in rows.iter().zip(P3_TABLE2) {
            assert_eq!(r["clock"].as_str().unwrap(), name);
            let tau = r["crossover_tau_s"].as_f64().unwrap();
            let d = (tau - printed).abs();
            assert!(
                d <= half_ulp,
                "P3 Table 2 {name}: scenario τ* = {tau} s, paper prints {printed} s \
                 (|Δ| = {d} s > half-ulp {half_ulp} s)"
            );
            // Each row's own internal check must be tight.
            let rel = r["closed_form_rel_diff"].as_f64().unwrap();
            assert!(
                rel < 1e-12,
                "{name}: bisected τ* {tau} vs closed form {} (rel diff {rel})",
                r["crossover_tau_s_closed_form"]
            );
        }
        // The abstract's one-decimal PHM figure.
        let phm = rows
            .iter()
            .find(|r| r["clock"] == "passive-h-maser")
            .unwrap();
        let tau = phm["crossover_tau_s"].as_f64().unwrap();
        assert!(
            (tau - 86_894.3).abs() <= 0.05,
            "P3 abstract: scenario PHM τ* = {tau} s vs printed 86894.3 s"
        );
    }

    #[test]
    fn the_row_carries_the_stability_spec_its_own_crossover_was_read_off() {
        // The released P3 crossover table publishes σ_y(1 s) alongside τ*, and until now that
        // column was the one cell of the table the engine did not emit — a reader had to take
        // it from the paper. These are the released values, to the six figures the table
        // prints. They are the clock SPEC, not a computed result: the row carries them so the
        // crossover and the level it was read off travel together.
        const RELEASED_SIGMA_Y_1S: [(&str, f64); 4] = [
            ("optical-master", 1.041667e-16),
            ("passive-h-maser", 1.151620e-14),
            ("rafs", 1.000000e-11),
            ("mini-rafs", 5.145221e-10),
        ];
        let (json, _s) = LunarTimeBudgetScenario::default().run_json().unwrap();
        let v: Value = serde_json::from_str(&json).unwrap();
        for (r, (name, released)) in crossovers_of(&v).iter().zip(RELEASED_SIGMA_Y_1S) {
            assert_eq!(r["clock"].as_str().unwrap(), name);
            let got = r["sigma_y_one_s"].as_f64().unwrap();
            let rel = (got - released).abs() / released;
            assert!(
                rel < 5e-7,
                "{name}: engine σ_y(1 s) = {got}, released table prints {released} \
                 (rel diff {rel})"
            );
        }
    }

    #[test]
    fn the_closed_form_crossover_is_recoverable_from_the_row_alone() {
        // The point of carrying σ_y(1 s) on the row: a consumer holding ONLY this table can
        // re-derive the closed-form crossover without the clock spec sheet. flicker-FM gives
        // τ* = F/σ_y(1 s); white FM gives τ* = (F/σ_y(1 s))². F is the frame term, itself
        // recoverable as x(τ*) at the crossover. This is the row proving it is self-contained.
        let (json, _s) = LunarTimeBudgetScenario::default().run_json().unwrap();
        let v: Value = serde_json::from_str(&json).unwrap();
        let frame_term_s = v["frame_floor_s"]
            .as_f64()
            .or_else(|| v["crossover_x_s"].as_f64())
            .expect("the document states the frame term");
        for r in crossovers_of(&v) {
            let sigma = r["sigma_y_one_s"].as_f64().unwrap();
            let ratio = frame_term_s / sigma;
            let expect = if r["noise_type"] == "white-fm" {
                ratio * ratio
            } else {
                ratio
            };
            let closed = r["crossover_tau_s_closed_form"].as_f64().unwrap();
            let rel = (closed - expect).abs() / closed;
            assert!(
                rel < 1e-12,
                "{}: τ* from the row alone = {expect} s, engine closed form = {closed} s \
                 (rel diff {rel})",
                r["clock"]
            );
        }
    }

    #[test]
    fn the_table_row_for_the_selected_clock_matches_the_single_clock_crossover() {
        // The per-clock table and the document's own single-clock crossover must agree — one
        // model, not two. Checked for each selectable clock.
        for name in ["optical-master", "passive-h-maser", "rafs", "mini-rafs"] {
            let scn = LunarTimeBudgetScenario {
                clock: Some(name.to_string()),
                ..Default::default()
            };
            let (json, _s) = scn.run_json().unwrap();
            let v: Value = serde_json::from_str(&json).unwrap();
            let single = v["crossover_tau_s"].as_f64().unwrap();
            let row = crossovers_of(&v)
                .into_iter()
                .find(|r| r["clock"] == name)
                .unwrap_or_else(|| panic!("no crossover row for {name}"));
            let tabled = row["crossover_tau_s"].as_f64().unwrap();
            assert!(
                (single - tabled).abs() / single < 1e-12,
                "{name}: document crossover {single} vs table row {tabled}"
            );
        }
    }

    #[test]
    fn every_row_shares_one_frame_term() {
        // The clock must be the ONLY variable across rows: recover δr/c from each row's own
        // noise law and check every row lands on the document's frame term.
        let (json, _s) = LunarTimeBudgetScenario::default().run_json().unwrap();
        let v: Value = serde_json::from_str(&json).unwrap();
        let frame = v["frame_term_s"].as_f64().unwrap();
        for r in crossovers_of(&v) {
            let name = r["clock"].as_str().unwrap();
            let clock = LunarClock::all()
                .into_iter()
                .find(|c| c.name() == name)
                .unwrap();
            let sigma_1s = sigma_y(&clock.powerlaw(), 1.0);
            let tau = r["crossover_tau_s"].as_f64().unwrap();
            let recovered = if clock.is_white_fm_limited() {
                tau.sqrt() * sigma_1s
            } else {
                tau * sigma_1s
            };
            assert!(
                (recovered - frame).abs() / frame < 1e-12,
                "{name}: recovered frame term {recovered} ≠ document frame term {frame}"
            );
        }
    }

    #[test]
    fn a_clocks_subset_is_honoured_in_the_requested_order() {
        let scn = LunarTimeBudgetScenario {
            clocks: Some(vec!["mini-rafs".into(), "phm".into()]),
            ..Default::default()
        };
        let (json, _s) = scn.run_json().unwrap();
        let v: Value = serde_json::from_str(&json).unwrap();
        let got: Vec<&str> = crossovers_of(&v)
            .iter()
            .map(|r| r["clock"].as_str().unwrap())
            .collect();
        // `phm` is the documented alias of `passive-h-maser`, same as for the `clock` field.
        assert_eq!(got, vec!["mini-rafs", "passive-h-maser"]);
    }

    #[test]
    fn an_unknown_clocks_entry_is_rejected() {
        let scn = LunarTimeBudgetScenario {
            clocks: Some(vec!["passive-h-maser".into(), "sundial".into()]),
            ..Default::default()
        };
        let err = scn
            .run_json()
            .expect_err("unknown clock name must be an error");
        assert!(
            err.contains("sundial") && err.contains("expected one of"),
            "error must name the bad clock and the accepted set, got: {err}"
        );
        // An empty list is a mistake, not an implicit "all four".
        let empty = LunarTimeBudgetScenario {
            clocks: Some(vec![]),
            ..Default::default()
        };
        assert!(empty.run_json().is_err());
    }

    #[test]
    fn units_block_describes_the_new_fields() {
        let (json, _s) = LunarTimeBudgetScenario::default().run_json().unwrap();
        let v: Value = serde_json::from_str(&json).unwrap();
        let units = v["units"].as_object().expect("units object");
        for (key, unit) in [
            ("clock_crossovers.sigma_y_one_s", "1"),
            ("clock_crossovers.x_one_day_s", "s"),
            ("clock_crossovers.crossover_tau_s", "s"),
            ("clock_crossovers.crossover_tau_s_closed_form", "s"),
            ("clock_crossovers.closed_form_rel_diff", "1"),
        ] {
            let e = units
                .get(key)
                .unwrap_or_else(|| panic!("no units entry {key}"));
            assert_eq!(e["unit"], unit, "{key} unit");
            assert!(e["provenance"].is_string(), "{key} provenance class");
        }
        assert_eq!(units.len(), 5, "units must describe only the new fields");
    }

    #[test]
    fn the_crossover_table_does_not_depend_on_the_tau_grid_or_the_selected_clock() {
        // The table is a property of the clock classes and the frame term, so changing the
        // grid or the headline clock must leave every row bit-identical.
        let a = LunarTimeBudgetScenario::default().run_json().unwrap().0;
        let b = LunarTimeBudgetScenario {
            clock: Some("mini-rafs".into()),
            tau_min_s: Some(0.5),
            tau_max_s: Some(1.0e5),
            points_per_decade: Some(3),
            ..Default::default()
        }
        .run_json()
        .unwrap()
        .0;
        let va: Value = serde_json::from_str(&a).unwrap();
        let vb: Value = serde_json::from_str(&b).unwrap();
        assert_eq!(va["clock_crossovers"], vb["clock_crossovers"]);
    }
}
