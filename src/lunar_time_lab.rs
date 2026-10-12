// SPDX-License-Identifier: AGPL-3.0-only
//! Station time laboratory: a clock steered to Coordinated Lunar Time (LTC) and then left to
//! free-run, or re-steered every `N` seconds (**MODELLED**).
//!
//! This is the optional `[time_lab]` block of the `lunar-time-budget` scenario
//! ([`crate::lunar_time_budget_scenario`]). It answers one question for a lunar reference
//! station hosting a clock as its local time reference: *how does the station clock's time
//! error against LTC grow after it was last steered, and how long does it stay within 1, 10
//! and 100 ns?*
//!
//! ## The error model
//!
//! The time error `x(t)` at time `t` after the start of the run is the root-sum-square of four
//! terms, each a function of the time since the last steer `tau(t)` (`tau = t` when free-running,
//! `tau = t mod N` when steered every `N` seconds):
//!
//! 1. **clock** — the clock's power-law time error `x_clock(tau) = sigma_y(tau) * tau`, the same
//!    curve [`crate::lunar_time_budget`] uses (a named class from [`crate::clock_specs`]), or the
//!    same quantity from a [`crate::clock_library::card::DeviceCard`] fitted to stated
//!    stability points;
//! 2. **steer-residual** — the constant offset left by each steer to LTC (an ILLUSTRATIVE input:
//!    no public figure for a station steer is used here);
//! 3. **ltc-realisation** — the constant residual of the LTC realisation after the relativistic
//!    rate model is applied (default: the budget's relativistic-residual allocation). The LTC
//!    rate model itself is a separate VALIDATED ledger row and is not re-derived here;
//! 4. **station-height** — when the station height is not modelled exactly, its 1-sigma height
//!    error biases the clock's gravitational rate by the per-metre topographic redshift
//!    ([`crate::lunar_time::topographic_spread_ns_per_day`] over
//!    [`crate::lunar_time::LUNAR_TOPO_ELEVATION_SPAN_M`]), and the offset grows linearly with
//!    `tau`. With the default height sigma of zero the height is taken as modelled exactly and
//!    this term is zero; the report says which applied.
//!
//! No lunar thermal model is included: none is sourced.
//!
//! ## Validated vs Modelled
//! The clock curve is the closed-form IEEE-1139 mapping, and each named class is calibrated to
//! its published one-day row (see [`crate::clock_specs`]). The time-to-threshold is found by
//! bisection on the total and checked against the closed-form inverse for the clock's dominant
//! noise type; that is an internal-consistency check. The steer residual, the realisation term
//! and the height sigma are stated allocations, so every output here is **MODELLED** and says
//! nothing about any real station clock.

use crate::clock_library::card::DeviceCard;
use crate::clock_specs::{sigma_y, x_clock_s, LunarClock};
use crate::lunar_time_budget::BudgetParams;
use serde::Deserialize;

/// Default constant steer residual (ns). ILLUSTRATIVE: no public figure is used.
pub const DEFAULT_STEER_RESIDUAL_NS: f64 = 0.5;

/// Default time-error thresholds (ns) the time-to-threshold table reports.
pub const DEFAULT_THRESHOLDS_NS: [f64; 3] = [1.0, 10.0, 100.0];

/// Default horizons (s) at which the dominant term is reported: one hour, one day, one week,
/// thirty days.
pub const DEFAULT_HORIZONS_S: [f64; 4] = [3_600.0, 86_400.0, 604_800.0, 2_592_000.0];

/// Lower end of the bisection bracket for the time to threshold (s).
const BRACKET_LO_S: f64 = 1.0e-6;

/// The S3 source statement, carried verbatim on every time-lab report. It is a statement about
/// what a public source describes, not a claim this engine makes.
pub const SOURCE_STATEMENT: &str = "Source statement, not a claim: the ICG WG-B Lunar PNT \
material of June 2024 (unoosa.org, LunarPNT_Jun24_01_04.pdf, source S3 of the study) describes \
a lunar time reference laboratory at the station with a nanosecond-level time target. Kshana \
quotes that target for context only; it does not adopt it, and nothing in this block shows that \
any real station clock meets it.";

/// The honesty label of the time-lab block.
pub const LABEL: &str = "MODELLED station time laboratory: a clock steered to LTC then \
free-running or re-steered, with its time error the root-sum-square of the clock power-law term, \
a constant steer residual (ILLUSTRATIVE), a constant LTC realisation residual (a budget \
allocation; the LTC rate itself keeps its own VALIDATED ledger row) and, when the station height \
is not modelled exactly, a linear height-rate term. No thermal model. Not a statement about any \
real system; not affiliated with or endorsed by any agency.";

/// A clock described by measured or published stability points, fitted into a
/// [`DeviceCard`] (white phase, white, flicker and random-walk FM levels; no drift).
#[derive(Clone, Debug, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct DeviceCardInput {
    /// The name the report carries for this clock.
    pub name: String,
    /// Stability points `[tau_s, adev, edf]`; at least three with `edf >= 30`.
    pub points: Vec<[f64; 3]>,
}

/// The `[time_lab]` block of a `lunar-time-budget` scenario.
#[derive(Clone, Debug, Default, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct TimeLabInput {
    /// Named clock class (`optical-master`, `passive-h-maser`, `rafs`, `mini-rafs`). Default
    /// `mini-rafs`. Mutually exclusive with `device_card`.
    pub clock: Option<String>,
    /// A clock given by stability points instead of a named class.
    pub device_card: Option<DeviceCardInput>,
    /// Steer interval (s). Absent: free-run after the initial steer.
    pub steer_interval_s: Option<f64>,
    /// Constant offset left by each steer (ns). Default 0.5, ILLUSTRATIVE.
    pub steer_residual_ns: Option<f64>,
    /// Constant LTC realisation residual (ns). Default: the budget's relativistic-residual
    /// allocation (0.05 ns).
    pub ltc_realisation_ns: Option<f64>,
    /// One-sigma station height error (m). Default 0: the height is modelled exactly and the
    /// topographic rate term is not applied.
    pub station_height_sigma_m: Option<f64>,
    /// Time-error thresholds (ns). Default 1, 10, 100.
    pub thresholds_ns: Option<Vec<f64>>,
    /// Horizons (s) for the dominant-term table. Default 1 h, 1 d, 7 d, 30 d.
    pub horizons_s: Option<Vec<f64>>,
}

/// The clock a time lab runs, resolved.
enum LabClock {
    Named(LunarClock),
    Card(Box<DeviceCard>),
}

impl LabClock {
    fn name(&self) -> String {
        match self {
            LabClock::Named(c) => c.name().to_string(),
            LabClock::Card(c) => c.name.clone(),
        }
    }

    fn x_s(&self, tau: f64) -> f64 {
        if tau <= 0.0 {
            return 0.0;
        }
        match self {
            LabClock::Named(c) => x_clock_s(&c.powerlaw(), tau),
            LabClock::Card(c) => c.adev(tau) * tau,
        }
    }
}

/// Parse a named clock class, with the same spellings `lunar-time-budget` accepts.
pub fn parse_lab_clock(name: &str) -> Result<LunarClock, String> {
    match name {
        "optical-master" => Ok(LunarClock::OpticalMaster),
        "passive-h-maser" | "phm" => Ok(LunarClock::Phm),
        "rafs" => Ok(LunarClock::Rafs),
        "mini-rafs" => Ok(LunarClock::MiniRafs),
        other => Err(format!(
            "time_lab: unknown clock {other:?}; expected one of optical-master, \
             passive-h-maser, rafs, mini-rafs, or give a device_card instead"
        )),
    }
}

/// Per-metre gravitational rate bias of a surface clock (ns/day per m), from the topographic
/// spread over its elevation span.
pub fn height_rate_ns_per_day_per_m() -> f64 {
    crate::lunar_time::topographic_spread_ns_per_day()
        / crate::lunar_time::LUNAR_TOPO_ELEVATION_SPAN_M
}

/// A resolved time lab, ready to evaluate.
pub struct TimeLab {
    clock: LabClock,
    steer_interval_s: Option<f64>,
    steer_residual_s: f64,
    ltc_realisation_s: f64,
    height_sigma_m: f64,
    height_rate_s_per_s: f64,
    thresholds_ns: Vec<f64>,
    horizons_s: Vec<f64>,
}

/// The four term names, in report order.
pub const TERM_NAMES: [&str; 4] = [
    "clock",
    "steer-residual",
    "ltc-realisation",
    "station-height",
];

impl TimeLabInput {
    /// Validate and resolve the block.
    pub fn resolve(&self) -> Result<TimeLab, String> {
        let clock = match (&self.clock, &self.device_card) {
            (Some(_), Some(_)) => {
                return Err("time_lab: give either clock or device_card, not both".to_string())
            }
            (_, Some(card)) => {
                let pts: Vec<(f64, f64, f64)> =
                    card.points.iter().map(|p| (p[0], p[1], p[2])).collect();
                LabClock::Card(Box::new(
                    DeviceCard::fit_curve(&card.name, &pts)
                        .map_err(|e| format!("time_lab: device_card: {e}"))?,
                ))
            }
            (c, None) => LabClock::Named(parse_lab_clock(c.as_deref().unwrap_or("mini-rafs"))?),
        };
        if let Some(n) = self.steer_interval_s {
            if !(n.is_finite() && n > 0.0) {
                return Err(format!(
                    "time_lab: steer_interval_s must be finite and positive, got {n}"
                ));
            }
        }
        let nonneg = |name: &str, v: f64| -> Result<f64, String> {
            if v.is_finite() && v >= 0.0 {
                Ok(v)
            } else {
                Err(format!(
                    "time_lab: {name} must be finite and non-negative, got {v}"
                ))
            }
        };
        let steer_residual_ns = nonneg(
            "steer_residual_ns",
            self.steer_residual_ns.unwrap_or(DEFAULT_STEER_RESIDUAL_NS),
        )?;
        let ltc_ns = nonneg(
            "ltc_realisation_ns",
            self.ltc_realisation_ns
                .unwrap_or(BudgetParams::default().relativistic_residual_s * 1e9),
        )?;
        let h = nonneg(
            "station_height_sigma_m",
            self.station_height_sigma_m.unwrap_or(0.0),
        )?;
        let thresholds_ns = self
            .thresholds_ns
            .clone()
            .unwrap_or_else(|| DEFAULT_THRESHOLDS_NS.to_vec());
        if thresholds_ns.is_empty() || thresholds_ns.iter().any(|t| !(t.is_finite() && *t > 0.0)) {
            return Err(
                "time_lab: thresholds_ns must be a non-empty list of positive numbers".to_string(),
            );
        }
        let horizons_s = self
            .horizons_s
            .clone()
            .unwrap_or_else(|| DEFAULT_HORIZONS_S.to_vec());
        if horizons_s.iter().any(|t| !(t.is_finite() && *t > 0.0)) {
            return Err("time_lab: horizons_s must be positive numbers".to_string());
        }
        Ok(TimeLab {
            clock,
            steer_interval_s: self.steer_interval_s,
            steer_residual_s: steer_residual_ns * 1e-9,
            ltc_realisation_s: ltc_ns * 1e-9,
            height_sigma_m: h,
            height_rate_s_per_s: height_rate_ns_per_day_per_m() * 1e-9 / 86_400.0,
            thresholds_ns,
            horizons_s,
        })
    }
}

impl TimeLab {
    /// The clock's report name.
    pub fn clock_name(&self) -> String {
        self.clock.name()
    }

    /// `"free-run"` or `"steered"`.
    pub fn mode(&self) -> &'static str {
        if self.steer_interval_s.is_some() {
            "steered"
        } else {
            "free-run"
        }
    }

    /// Time since the last steer at run time `t` (s).
    pub fn tau_since_steer(&self, t: f64) -> f64 {
        match self.steer_interval_s {
            None => t,
            Some(n) => t - n * (t / n).floor(),
        }
    }

    /// The four term values (s) at time since the last steer `tau`, in [`TERM_NAMES`] order.
    pub fn terms_at_tau(&self, tau: f64) -> [f64; 4] {
        [
            self.clock.x_s(tau),
            self.steer_residual_s,
            self.ltc_realisation_s,
            self.height_sigma_m * self.height_rate_s_per_s * tau,
        ]
    }

    /// Root-sum-square total time error (s) at time since the last steer `tau`.
    pub fn total_at_tau(&self, tau: f64) -> f64 {
        self.terms_at_tau(tau)
            .iter()
            .map(|x| x * x)
            .sum::<f64>()
            .sqrt()
    }

    /// Root-sum-square total time error (s) at run time `t`.
    pub fn total_at(&self, t: f64) -> f64 {
        self.total_at_tau(self.tau_since_steer(t))
    }

    /// Time after a steer (s) at which the total first reaches `thr_s`, by bisection on the
    /// time since the steer, up to `t_max`. Returns `(time, status)`. Because each term is
    /// non-decreasing in `tau`, the total is too, and a steered run either crosses inside its
    /// first interval or never.
    pub fn time_to_threshold(&self, thr_s: f64, t_max: f64) -> (Option<f64>, &'static str) {
        if self.total_at_tau(0.0) >= thr_s {
            return (Some(0.0), "floor-at-or-above-threshold");
        }
        let hi = match self.steer_interval_s {
            Some(n) if n < t_max => n,
            _ => t_max,
        };
        if self.total_at_tau(hi) < thr_s {
            return match self.steer_interval_s {
                Some(n) if n < t_max => (None, "held-by-steering"),
                _ => (None, "not-reached-within-horizon"),
            };
        }
        let g = |t: f64| self.total_at_tau(t) - thr_s;
        let (mut a, mut b) = (BRACKET_LO_S.min(hi), hi);
        if g(a) >= 0.0 {
            return (Some(a), "reached");
        }
        for _ in 0..200 {
            let mid = (a * b).sqrt();
            if g(mid) > 0.0 {
                b = mid;
            } else {
                a = mid;
            }
        }
        (Some((a * b).sqrt()), "reached")
    }

    /// The closed-form inverse of the total for a named clock's dominant noise type, valid when
    /// the height term is zero: with the constant floor `F^2 = r^2 + L^2`, white FM gives
    /// `tau = (thr^2 - F^2) / sigma_y(1 s)^2` and a flicker-FM floor
    /// `tau = sqrt(thr^2 - F^2) / sigma_y`. `None` for a device card, a non-zero height term, a
    /// threshold at or below the floor, or a crossing beyond the steer interval.
    pub fn time_to_threshold_closed_form(&self, thr_s: f64) -> Option<f64> {
        let LabClock::Named(c) = &self.clock else {
            return None;
        };
        if self.height_sigma_m != 0.0 {
            return None;
        }
        let f2 = self.steer_residual_s.powi(2) + self.ltc_realisation_s.powi(2);
        let rem = thr_s * thr_s - f2;
        if rem <= 0.0 {
            return None;
        }
        let s1 = sigma_y(&c.powerlaw(), 1.0);
        let tau = if c.is_white_fm_limited() {
            rem / (s1 * s1)
        } else {
            rem.sqrt() / s1
        };
        match self.steer_interval_s {
            Some(n) if tau > n => None,
            _ => Some(tau),
        }
    }

    /// Evaluate the block over the run-time grid `ts` (s) and render it as the report's
    /// `time_lab` object.
    pub fn report(&self, ts: &[f64]) -> serde_json::Value {
        let t_max = ts.last().copied().unwrap_or(0.0);
        let mut curves: Vec<Vec<f64>> = (0..4).map(|_| Vec::with_capacity(ts.len())).collect();
        let mut total = Vec::with_capacity(ts.len());
        for &t in ts {
            let tau = self.tau_since_steer(t);
            let v = self.terms_at_tau(tau);
            for (k, x) in v.iter().enumerate() {
                curves[k].push(x * 1e9);
            }
            total.push(self.total_at_tau(tau) * 1e9);
        }
        let terms: Vec<serde_json::Value> = TERM_NAMES
            .iter()
            .zip(curves)
            .map(|(name, x)| serde_json::json!({ "name": name, "x_ns": x }))
            .collect();

        let thresholds: Vec<serde_json::Value> = self
            .thresholds_ns
            .iter()
            .map(|&thr| {
                let (t, status) = self.time_to_threshold(thr * 1e-9, t_max);
                let cf = if status == "reached" {
                    self.time_to_threshold_closed_form(thr * 1e-9)
                } else {
                    None
                };
                let rel = match (t, cf) {
                    (Some(a), Some(b)) if b > 0.0 => Some((a - b).abs() / b),
                    _ => None,
                };
                serde_json::json!({
                    "threshold_ns": thr,
                    "t_s": t,
                    "status": status,
                    "t_closed_form_s": cf,
                    "closed_form_rel_diff": rel,
                })
            })
            .collect();

        let horizons: Vec<serde_json::Value> = self
            .horizons_s
            .iter()
            .map(|&h| {
                let v = self.terms_at_tau(self.tau_since_steer(h));
                let (k, x) =
                    v.iter()
                        .enumerate()
                        .fold((0usize, f64::NEG_INFINITY), |(bk, bx), (k, &x)| {
                            if x > bx {
                                (k, x)
                            } else {
                                (bk, bx)
                            }
                        });
                serde_json::json!({
                    "t_s": h,
                    "x_total_ns": self.total_at(h) * 1e9,
                    "dominant_term": TERM_NAMES[k],
                    "dominant_x_ns": x * 1e9,
                })
            })
            .collect();

        let (source, noise) = match &self.clock {
            LabClock::Named(c) => (
                "named-class",
                if c.is_white_fm_limited() {
                    "white-fm"
                } else {
                    "flicker-fm"
                },
            ),
            LabClock::Card(_) => ("device-card", "fitted-power-law"),
        };
        let height_term = if self.height_sigma_m == 0.0 {
            "station height modelled exactly (station_height_sigma_m = 0): the topographic \
             rate term is not applied"
                .to_string()
        } else {
            format!(
                "station height not modelled exactly: a {} m one-sigma height error biases the \
                 rate by {:.6e} ns/day, applied as a linear term since the last steer",
                self.height_sigma_m,
                self.height_sigma_m * height_rate_ns_per_day_per_m()
            )
        };

        serde_json::json!({
            "label": LABEL,
            "source_statement": SOURCE_STATEMENT,
            "clock": self.clock.name(),
            "clock_source": source,
            "noise_type": noise,
            "mode": self.mode(),
            "steer_interval_s": self.steer_interval_s,
            "steer_residual_ns": self.steer_residual_s * 1e9,
            "ltc_realisation_ns": self.ltc_realisation_s * 1e9,
            "station_height_sigma_m": self.height_sigma_m,
            "height_rate_ns_per_day_per_m": height_rate_ns_per_day_per_m(),
            "height_term": height_term,
            "t_s": ts,
            "terms": terms,
            "x_total_ns": total,
            "time_to_threshold": thresholds,
            "horizons": horizons,
        })
    }
}

/// Units and provenance for every numeric field of the `time_lab` block, merged into the
/// scenario's `units` object only when the block is present.
pub fn units() -> serde_json::Value {
    serde_json::json!({
        "time_lab.steer_interval_s": { "unit": "s", "provenance": "input" },
        "time_lab.steer_residual_ns": {
            "unit": "ns",
            "provenance": "modelled-input",
            "note": "ILLUSTRATIVE constant offset left by each steer; no public figure is used"
        },
        "time_lab.ltc_realisation_ns": {
            "unit": "ns",
            "provenance": "modelled-input",
            "note": "constant LTC realisation residual, a budget allocation; the LTC rate keeps \
                     its own VALIDATED row"
        },
        "time_lab.station_height_sigma_m": { "unit": "m", "provenance": "input" },
        "time_lab.height_rate_ns_per_day_per_m": {
            "unit": "ns/d/m",
            "provenance": "modelled",
            "note": "first-order g*dh/c^2 redshift per metre of height, from the topographic \
                     spread over its elevation span"
        },
        "time_lab.t_s[]": {
            "unit": "s",
            "provenance": "input",
            "note": "run time since the initial steer; the scenario's averaging-time grid"
        },
        "time_lab.terms[].x_ns[]": {
            "unit": "ns",
            "provenance": "computed",
            "note": "the named term's time error at each run time, a function of the time \
                     since the last steer"
        },
        "time_lab.x_total_ns[]": {
            "unit": "ns",
            "provenance": "computed",
            "note": "root-sum-square of the four terms"
        },
        "time_lab.time_to_threshold[].threshold_ns": { "unit": "ns", "provenance": "input" },
        "time_lab.time_to_threshold[].t_s": {
            "unit": "s",
            "provenance": "computed",
            "note": "time after a steer at which the total first reaches the threshold, by \
                     bisection; null when held by steering or not reached within the grid"
        },
        "time_lab.time_to_threshold[].t_closed_form_s": {
            "unit": "s",
            "provenance": "closed-form",
            "note": "the closed-form inverse for the clock's dominant noise type; null for a \
                     device card or a non-zero height term"
        },
        "time_lab.time_to_threshold[].closed_form_rel_diff": {
            "unit": "1",
            "provenance": "internal-consistency"
        },
        "time_lab.horizons[].t_s": { "unit": "s", "provenance": "input" },
        "time_lab.horizons[].x_total_ns": { "unit": "ns", "provenance": "computed" },
        "time_lab.horizons[].dominant_x_ns": {
            "unit": "ns",
            "provenance": "computed",
            "note": "the largest of the four terms at this horizon; `dominant_term` names it"
        }
    })
}

#[cfg(test)]
mod tests {
    use super::*;
    use crate::lunar_time_budget::{default_tau_grid, lunar_time_budget};

    fn lab(clock: &str, steer: Option<f64>) -> TimeLab {
        TimeLabInput {
            clock: Some(clock.to_string()),
            steer_interval_s: steer,
            ..Default::default()
        }
        .resolve()
        .unwrap()
    }

    /// With steering off, the clock term is the budget's own clock term, to the bit.
    #[test]
    fn free_run_clock_term_is_the_budget_clock_term() {
        let ts = default_tau_grid();
        for c in LunarClock::all() {
            let v = lab(c.name(), None).report(&ts);
            let budget = lunar_time_budget(&BudgetParams::for_clock(c), &ts);
            let mine: Vec<f64> = v["terms"][0]["x_ns"]
                .as_array()
                .unwrap()
                .iter()
                .map(|x| x.as_f64().unwrap())
                .collect();
            for (a, b) in mine.iter().zip(&budget.terms[0].x_s) {
                assert_eq!(*a, b * 1e9, "{}", c.name());
            }
        }
    }

    /// The bisected time to threshold agrees with the closed-form inverse of the dominant
    /// noise type, for both noise classes.
    #[test]
    fn bisection_matches_the_closed_form() {
        for c in LunarClock::all() {
            let l = lab(c.name(), None);
            for thr_ns in [1.0, 10.0, 100.0] {
                let (t, status) = l.time_to_threshold(thr_ns * 1e-9, 1e15);
                if status != "reached" {
                    continue;
                }
                let cf = l.time_to_threshold_closed_form(thr_ns * 1e-9).unwrap();
                let t = t.unwrap();
                assert!(
                    (t - cf).abs() / cf < 1e-9,
                    "{} at {thr_ns} ns: bisection {t} vs closed form {cf}",
                    c.name()
                );
            }
        }
    }

    /// A threshold at or below the constant floor is reported as such, not as a crossing.
    #[test]
    fn threshold_below_the_floor_is_flagged() {
        let l = TimeLabInput {
            steer_residual_ns: Some(2.0),
            ..Default::default()
        }
        .resolve()
        .unwrap();
        let (t, status) = l.time_to_threshold(1e-9, 1e7);
        assert_eq!(status, "floor-at-or-above-threshold");
        assert_eq!(t, Some(0.0));
    }

    /// Steering often enough holds a threshold indefinitely, and the sawtooth resets.
    #[test]
    fn steering_holds_and_resets() {
        let l = lab("mini-rafs", Some(60.0));
        let (t, status) = l.time_to_threshold(100e-9, 1e7);
        assert_eq!(status, "held-by-steering");
        assert!(t.is_none());
        assert_eq!(l.total_at(120.0), l.total_at_tau(0.0));
        assert!(l.total_at(119.0) > l.total_at(121.0));
    }

    /// The height term is zero unless a height sigma is stated, and then grows linearly.
    #[test]
    fn height_term_is_opt_in_and_linear() {
        let l0 = lab("optical-master", None);
        assert_eq!(l0.terms_at_tau(86_400.0)[3], 0.0);
        let l = TimeLabInput {
            clock: Some("optical-master".into()),
            station_height_sigma_m: Some(10.0),
            ..Default::default()
        }
        .resolve()
        .unwrap();
        let a = l.terms_at_tau(86_400.0)[3];
        let b = l.terms_at_tau(2.0 * 86_400.0)[3];
        assert!((b / a - 2.0).abs() < 1e-12);
        assert!((a * 1e9 - 10.0 * height_rate_ns_per_day_per_m()).abs() < 1e-12);
        assert!(l.time_to_threshold_closed_form(10e-9).is_none());
    }

    /// A device card fitted to points read off a named class reproduces that class.
    #[test]
    fn device_card_reproduces_a_named_class() {
        let p = LunarClock::MiniRafs.powerlaw();
        let points: Vec<[f64; 3]> = [1.0, 10.0, 100.0, 1000.0]
            .iter()
            .map(|&t| [t, sigma_y(&p, t), 100.0])
            .collect();
        let l = TimeLabInput {
            device_card: Some(DeviceCardInput {
                name: "card".into(),
                points,
            }),
            ..Default::default()
        }
        .resolve()
        .unwrap();
        let x = l.terms_at_tau(86_400.0)[0];
        let want = x_clock_s(&p, 86_400.0);
        assert!((x - want).abs() / want < 1e-3, "{x} vs {want}");
    }

    #[test]
    fn bad_inputs_are_refused() {
        for bad in [
            TimeLabInput {
                clock: Some("sundial".into()),
                ..Default::default()
            },
            TimeLabInput {
                steer_interval_s: Some(0.0),
                ..Default::default()
            },
            TimeLabInput {
                thresholds_ns: Some(vec![]),
                ..Default::default()
            },
            TimeLabInput {
                clock: Some("rafs".into()),
                device_card: Some(DeviceCardInput {
                    name: "x".into(),
                    points: vec![],
                }),
                ..Default::default()
            },
        ] {
            assert!(bad.resolve().is_err());
        }
    }
}
