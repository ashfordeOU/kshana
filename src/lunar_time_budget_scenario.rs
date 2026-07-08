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
use crate::lunar_time_budget::{default_tau_grid, lunar_time_budget, BudgetParams};
use serde::Deserialize;

/// The honesty label carried on the result document.
const LABEL: &str = "MODELLED end-to-end LTC time-error budget. The τ-slopes are \
closed-form and analytically checkable (clock τ^{+1/2}/τ^{+1}, floors τ^0, measurement \
τ^{-1/2}) and the clock rows reproduce the published one-day clock specs; the RF/optical \
link, frame-realisation, relativistic-residual and ephemeris floor MAGNITUDES are \
Modelled budget allocations (documented defaults, caller-overridable), not measurements. \
The contribution is the reproducible clock-vs-frame crossover τ, not a certified per-term \
number. Not certified for operational timekeeping.";

/// The `lunar-time-budget` scenario. Every field is optional: with no fields the budget
/// runs for a passive-H-maser master clock over the default 1 s … 1e7 s τ grid.
#[derive(Clone, Debug, Deserialize)]
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
}

impl Default for LunarTimeBudgetScenario {
    fn default() -> Self {
        LunarTimeBudgetScenario {
            clock: None,
            tau_min_s: None,
            tau_max_s: None,
            points_per_decade: None,
        }
    }
}

impl LunarTimeBudgetScenario {
    /// Resolve the requested clock-class string to a [`LunarClock`].
    fn resolve_clock(&self) -> Result<LunarClock, String> {
        match self.clock.as_deref().unwrap_or("passive-h-maser") {
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
            return Err(format!("tau_max_s must be finite and greater than tau_min_s ({lo}), got {hi}"));
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

    /// Run the scenario, returning `(json, summary)`.
    pub fn run_json(&self) -> Result<(String, String), String> {
        let clock = self.resolve_clock()?;
        let taus = self.build_tau_grid()?;
        let params = BudgetParams::for_clock(clock);
        let budget = lunar_time_budget(&params, &taus);

        // Serialize the budget document and stamp it with the kind + honesty label.
        let mut v = serde_json::to_value(&budget).map_err(|e| e.to_string())?;
        if let Some(obj) = v.as_object_mut() {
            obj.insert(
                "kind".to_string(),
                serde_json::Value::from("lunar-time-budget"),
            );
            obj.insert("label".to_string(), serde_json::Value::from(LABEL));
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
}
