// SPDX-License-Identifier: AGPL-3.0-only
//! Coordinated Lunar Time (LTC) end-to-end **time-error budget** over a τ grid.
//!
//! A single-τ error table invites the objection *"you picked the averaging time that
//! flatters your clock."* This module answers it by assembling the seven P3 error terms
//! as time-error curves `x_i(τ)` (seconds) across a whole grid of averaging times, root-
//! summing them into `x_Σ(τ) = √(Σ x_i²)`, and locating the **crossover** `τ` at which the
//! growing clock term overtakes the (constant) real-time frame-realisation term. That
//! crossover is the honest headline: *below* it the LTC budget is frame-limited (the
//! reference-frame realisation dominates, not the clock), *above* it the clock dominates.
//! Where the crossover falls depends entirely on the clock class — for an optical master it
//! is out near ~10⁷ s, for a coarse miniRAFS it is a few seconds — which is exactly why a
//! single-τ number is misleading.
//!
//! The seven terms (each a time error `x_i(τ)` in seconds):
//! 1. **clock** — from [`crate::clock_specs`], the only term that grows with τ (white FM
//!    `∝ τ^{1/2}` or flicker-FM floor `∝ τ`);
//! 2. **RF one-way link floor** — a constant timing floor (~1 ns);
//! 3. **optical two-way link floor** — a constant floor (~10 ps, in the 5–20 ps band);
//! 4. **real-time frame term** `δr/c` — the light-time equivalent of the lunar reference-
//!    frame position-realisation error (constant, `τ^0`), the clock's crossover partner;
//! 5. **relativistic modelling residual** — leftover after applying the LTC−TT rate model
//!    (constant, ~50 ps);
//! 6. **ephemeris / station** — lunar orbit and ground-station position knowledge (constant,
//!    ~0.5 ns);
//! 7. **measurement noise** — white measurement noise that *averages down* as `τ^{-1/2}`.
//!
//! **Validated vs Modelled.** The τ-slopes are closed-form and analytically checkable
//! (clock `τ^{+1/2}`/`τ^{+1}`, floors `τ^0`, measurement `τ^{-1/2}`), and the clock rows are
//! the [`crate::clock_specs`] curves calibrated to published one-day specs. The *magnitudes*
//! of the link/frame/ephemeris floors are **Modelled** budget allocations (documented
//! defaults, caller-overridable), not measurements — the contribution here is the
//! reproducible crossover analysis, not a certified per-term number.

use crate::clock_specs::{x_clock_s, LunarClock};
use serde::Serialize;

/// Speed of light (m/s) — for the frame-realisation light-time term `δr/c`.
const C_M_S: f64 = 299_792_458.0;

/// Tunable magnitudes of the six non-clock LTC budget terms (all in seconds, except the
/// frame position error in metres). Every field has a documented default; a caller can
/// override any of them to re-run the budget for a different link/frame assumption.
#[derive(Clone, Copy, Debug, Serialize)]
pub struct BudgetParams {
    /// Which on-board clock drives the (growing) clock term.
    pub clock: LunarClock,
    /// RF one-way ranging/timing link floor (s). Default 1.0 ns.
    pub rf_link_floor_s: f64,
    /// Optical two-way ranging link floor (s). Default 10 ps (5–20 ps band).
    pub optical_link_floor_s: f64,
    /// Lunar reference-frame position-realisation error `δr` (m); the frame time term is
    /// `δr/c`. Default 0.3 m ⇒ ≈ 1.0 ns.
    pub frame_pos_error_m: f64,
    /// Relativistic modelling residual after the LTC−TT rate model (s). Default 50 ps.
    pub relativistic_residual_s: f64,
    /// Ephemeris / ground-station position timing term (s). Default 0.5 ns.
    pub ephemeris_s: f64,
    /// Measurement-noise time error at τ = 1 s (s); the term averages down as `τ^{-1/2}`.
    /// Default 1.0 ns at 1 s.
    pub measurement_1s_s: f64,
}

impl Default for BudgetParams {
    fn default() -> Self {
        BudgetParams {
            clock: LunarClock::Phm,
            rf_link_floor_s: 1.0e-9,
            optical_link_floor_s: 1.0e-11,
            frame_pos_error_m: 0.3,
            relativistic_residual_s: 5.0e-11,
            ephemeris_s: 5.0e-10,
            measurement_1s_s: 1.0e-9,
        }
    }
}

impl BudgetParams {
    /// Default parameters for a specific clock class.
    pub fn for_clock(clock: LunarClock) -> Self {
        BudgetParams {
            clock,
            ..Default::default()
        }
    }

    /// The constant real-time frame-realisation time term `δr/c` (s) — the clock's crossover
    /// partner.
    pub fn frame_term_s(&self) -> f64 {
        self.frame_pos_error_m / C_M_S
    }
}

/// One named term's time-error curve `x_i(τ)` (seconds) over the shared τ grid.
#[derive(Clone, Debug, Serialize)]
pub struct BudgetTermCurve {
    /// Short term name.
    pub name: String,
    /// Whether the term grows with τ (only the clock term does).
    pub grows_with_tau: bool,
    /// `x_i(τ)` at each grid τ (s).
    pub x_s: Vec<f64>,
}

/// The assembled LTC time-error budget over a τ grid.
#[derive(Clone, Debug, Serialize)]
pub struct LunarTimeBudget {
    /// Clock class name.
    pub clock: &'static str,
    /// Averaging-time grid (s).
    pub tau_s: Vec<f64>,
    /// The seven per-term curves.
    pub terms: Vec<BudgetTermCurve>,
    /// Root-sum-square total `x_Σ(τ) = √(Σ x_i²)` at each τ (s).
    pub x_sigma_s: Vec<f64>,
    /// The crossover τ (s) at which the clock term equals the frame term — below it the
    /// budget is frame-limited, above it clock-limited.
    pub crossover_tau_s: f64,
    /// The common time error (s) at the crossover (`x_clock = x_frame`).
    pub crossover_x_s: f64,
    /// The constant frame-realisation term `δr/c` (s).
    pub frame_term_s: f64,
}

/// A default log-spaced averaging-time grid from 1 s to 1e7 s (≈ 116 days), 8 points/decade.
pub fn default_tau_grid() -> Vec<f64> {
    let per_decade = 8i32;
    let decades = 7i32; // 10^0 … 10^7
    let n = decades * per_decade + 1;
    (0..n)
        .map(|k| 10f64.powf(k as f64 / per_decade as f64))
        .collect()
}

/// Find the τ at which the (monotonically increasing) clock time error equals the constant
/// frame term, by bisection on `[lo, hi]`. Both endpoints must bracket the root; if the clock
/// already exceeds the frame term at `lo` the crossover is reported as `lo` (clock dominates
/// throughout), and if it never reaches it by `hi` the crossover is reported as `hi`.
fn crossover_tau(p: &crate::powerlaw::PowerLaw, frame_term_s: f64, lo: f64, hi: f64) -> f64 {
    let g = |t: f64| x_clock_s(p, t) - frame_term_s;
    if g(lo) >= 0.0 {
        return lo;
    }
    if g(hi) <= 0.0 {
        return hi;
    }
    let (mut a, mut b) = (lo, hi);
    // 100 bisections over a 15-decade span drives the bracket well below any f64 tolerance.
    for _ in 0..100 {
        let mid = (a * b).sqrt(); // geometric midpoint — the abscissa is logarithmic in τ.
        if g(mid) > 0.0 {
            b = mid;
        } else {
            a = mid;
        }
    }
    (a * b).sqrt()
}

/// Assemble the seven-term LTC time-error budget for `params` over the τ grid `taus`.
///
/// Returns the per-term `x_i(τ)` curves, the root-sum-square total `x_Σ(τ)`, and the
/// clock-vs-frame crossover τ. Deterministic and closed-form — no RNG, no wall-clock.
pub fn lunar_time_budget(params: &BudgetParams, taus: &[f64]) -> LunarTimeBudget {
    let p = params.clock.powerlaw();
    let frame_term_s = params.frame_term_s();

    // Each term as a τ↦x(τ) closure and whether it grows with τ.
    let clock_curve: Vec<f64> = taus.iter().map(|&t| x_clock_s(&p, t)).collect();
    let const_curve = |v: f64| -> Vec<f64> { taus.iter().map(|_| v).collect() };
    let meas_curve: Vec<f64> = taus
        .iter()
        .map(|&t| params.measurement_1s_s / t.sqrt())
        .collect();

    let terms = vec![
        BudgetTermCurve {
            name: format!("clock:{}", params.clock.name()),
            grows_with_tau: true,
            x_s: clock_curve.clone(),
        },
        BudgetTermCurve {
            name: "rf-link-floor".into(),
            grows_with_tau: false,
            x_s: const_curve(params.rf_link_floor_s),
        },
        BudgetTermCurve {
            name: "optical-link-floor".into(),
            grows_with_tau: false,
            x_s: const_curve(params.optical_link_floor_s),
        },
        BudgetTermCurve {
            name: "frame-realisation".into(),
            grows_with_tau: false,
            x_s: const_curve(frame_term_s),
        },
        BudgetTermCurve {
            name: "relativistic-residual".into(),
            grows_with_tau: false,
            x_s: const_curve(params.relativistic_residual_s),
        },
        BudgetTermCurve {
            name: "ephemeris".into(),
            grows_with_tau: false,
            x_s: const_curve(params.ephemeris_s),
        },
        BudgetTermCurve {
            name: "measurement".into(),
            grows_with_tau: false,
            x_s: meas_curve,
        },
    ];

    // Root-sum-square total across the seven terms at each τ.
    let x_sigma_s: Vec<f64> = (0..taus.len())
        .map(|i| {
            let ss: f64 = terms.iter().map(|term| term.x_s[i] * term.x_s[i]).sum();
            ss.sqrt()
        })
        .collect();

    let tau_x = crossover_tau(&p, frame_term_s, 1e-6, 1e12);
    let crossover_x_s = x_clock_s(&p, tau_x);

    LunarTimeBudget {
        clock: params.clock.name(),
        tau_s: taus.to_vec(),
        terms,
        x_sigma_s,
        crossover_tau_s: tau_x,
        crossover_x_s,
        frame_term_s,
    }
}

#[cfg(test)]
mod tests {
    use super::*;
    use crate::clock_specs::x_clock_s as x_clock;

    #[test]
    fn budget_has_seven_terms_and_rss_dominates_each() {
        // Oracle: x_Σ = √(Σ x_i²) ⇒ x_Σ ≥ every individual term, everywhere.
        let taus = default_tau_grid();
        let b = lunar_time_budget(&BudgetParams::default(), &taus);
        assert_eq!(b.terms.len(), 7);
        for term in &b.terms {
            for (i, &xi) in term.x_s.iter().enumerate() {
                assert!(
                    b.x_sigma_s[i] >= xi - 1e-24,
                    "x_Σ {} < term {} at τ={}",
                    b.x_sigma_s[i],
                    term.name,
                    taus[i]
                );
            }
        }
        // And x_Σ never exceeds the plain sum of terms (triangle inequality on RSS).
        for (i, &xs) in b.x_sigma_s.iter().enumerate() {
            let sum: f64 = b.terms.iter().map(|t| t.x_s[i]).sum();
            assert!(xs <= sum + 1e-24);
        }
    }

    #[test]
    fn crossover_swaps_frame_and_clock_dominance() {
        // Oracle: at the crossover x_clock == x_frame; just below, frame > clock; just above,
        // clock > frame. This is the single-τ-artifact answer.
        for clock in LunarClock::all() {
            let p = clock.powerlaw();
            let params = BudgetParams::for_clock(clock);
            let b = lunar_time_budget(&params, &default_tau_grid());
            let frame = b.frame_term_s;
            let tx = b.crossover_tau_s;
            // Equality at the crossover.
            assert!(
                (b.crossover_x_s - frame).abs() / frame < 1e-6,
                "{}: x_clock({tx}) = {} ≠ frame {frame}",
                clock.name(),
                b.crossover_x_s
            );
            // Dominance swaps across it.
            assert!(
                x_clock(&p, tx * 0.5) < frame,
                "{}: clock not below frame pre-crossover",
                clock.name()
            );
            assert!(
                x_clock(&p, tx * 2.0) > frame,
                "{}: clock not above frame post-crossover",
                clock.name()
            );
        }
    }

    #[test]
    fn white_fm_crossover_matches_the_closed_form() {
        // Oracle: white FM x_clock = √(h_0 τ / 2); setting it equal to the frame term δr/c
        // gives the analytic crossover τ* = 2 (δr/c)² / h_0. Check the bisection recovers it.
        let params = BudgetParams::for_clock(LunarClock::MiniRafs);
        let b = lunar_time_budget(&params, &default_tau_grid());
        let h0 = LunarClock::MiniRafs.powerlaw().h_0;
        let frame = params.frame_term_s();
        let analytic = 2.0 * frame * frame / h0;
        let rel = (b.crossover_tau_s - analytic).abs() / analytic;
        assert!(
            rel < 1e-6,
            "numeric τ* {} vs analytic {analytic} (rel {rel})",
            b.crossover_tau_s
        );
    }

    #[test]
    fn flicker_floor_crossover_matches_the_closed_form() {
        // Oracle: flicker-FM floor x_clock = floor·τ; equal to δr/c ⇒ τ* = (δr/c)/floor.
        let params = BudgetParams::for_clock(LunarClock::OpticalMaster);
        let b = lunar_time_budget(&params, &default_tau_grid());
        let floor = crate::clock_specs::sigma_y(&LunarClock::OpticalMaster.powerlaw(), 1.0);
        let frame = params.frame_term_s();
        let analytic = frame / floor;
        let rel = (b.crossover_tau_s - analytic).abs() / analytic;
        assert!(
            rel < 1e-6,
            "numeric τ* {} vs analytic {analytic} (rel {rel})",
            b.crossover_tau_s
        );
    }

    #[test]
    fn better_clock_pushes_the_crossover_to_longer_tau() {
        // The whole point: a better clock ⇒ frame realisation limits the budget over a wider τ
        // range ⇒ later crossover. Crossover τ must be monotone in clock quality.
        let taus = default_tau_grid();
        let txs: Vec<f64> = LunarClock::all()
            .iter()
            .map(|&c| lunar_time_budget(&BudgetParams::for_clock(c), &taus).crossover_tau_s)
            .collect();
        // all()' ordering is best→worst, so crossover τ must be decreasing.
        for w in txs.windows(2) {
            assert!(
                w[0] > w[1],
                "crossover not monotone in clock quality: {txs:?}"
            );
        }
        // Optical master: frame-limited out past ~10⁶ s; miniRAFS: clock-limited within seconds.
        assert!(txs[0] > 1e6, "optical crossover {} too early", txs[0]);
        assert!(txs[3] < 1e2, "miniRAFS crossover {} too late", txs[3]);
    }

    #[test]
    fn frame_term_is_light_time_of_position_error() {
        // δr/c for the default 0.3 m frame error is ≈ 1.0 ns.
        let p = BudgetParams::default();
        let ns = p.frame_term_s() * 1e9;
        assert!((ns - 1.0007).abs() < 1e-3, "frame term {ns} ns");
    }

    #[test]
    fn measurement_term_averages_down_as_root_tau() {
        // white measurement noise ⇒ x ∝ τ^{-1/2}: 100× τ ⇒ 10× smaller.
        let taus = vec![1.0, 100.0];
        let b = lunar_time_budget(&BudgetParams::default(), &taus);
        let meas = b.terms.iter().find(|t| t.name == "measurement").unwrap();
        assert!((meas.x_s[0] / meas.x_s[1] - 10.0).abs() < 1e-9);
    }

    #[test]
    fn budget_is_deterministic() {
        let taus = default_tau_grid();
        let a = lunar_time_budget(&BudgetParams::default(), &taus);
        let b = lunar_time_budget(&BudgetParams::default(), &taus);
        assert_eq!(a.x_sigma_s, b.x_sigma_s);
        assert_eq!(a.crossover_tau_s, b.crossover_tau_s);
    }
}
