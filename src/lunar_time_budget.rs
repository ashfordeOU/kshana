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

use crate::clock_specs::{sigma_y, x_clock_s, LunarClock, ONE_DAY_S};
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

/// Lower end of the crossover bracket used by [`clock_crossover_table`] (s). Far below the
/// fastest clock's crossover (the miniRAFS crosses at a few seconds) so the bisection never
/// reports a clamped endpoint.
pub const CROSSOVER_BRACKET_LO_S: f64 = 1.0e-6;

/// Upper end of the crossover bracket used by [`clock_crossover_table`] (s). Far above the
/// slowest clock's crossover (the optical master crosses near 1e7 s) for the same reason.
pub const CROSSOVER_BRACKET_HI_S: f64 = 1.0e15;

/// One clock class's row of the clock-vs-frame crossover table (P3 Table 2).
///
/// A single [`LunarTimeBudget`] answers the crossover question for **one** clock. The table
/// answers it for every clock class in a single run against **one shared frame term**, so the
/// clock is the only variable across rows — which is the whole claim: where the crossover
/// falls is a property of the clock class, not of the averaging time someone happened to pick.
///
/// **Why two crossover numbers.** [`Self::crossover_tau_s`] is a bisection root-find on the
/// general power-law time-error curve `x(τ) = σ_y(τ)·τ` — it knows nothing about which noise
/// type dominates. [`Self::crossover_tau_s_closed_form`] algebraically inverts the *dominant*
/// noise type ([`crossover_tau_closed_form`]). They are genuinely different computations, so
/// [`Self::closed_form_rel_diff`] makes the row carry its own check: a wrong noise-type
/// classification, a clamped bracket or a broken coefficient set shows up as a non-tiny number
/// instead of passing silently.
#[derive(Clone, Debug, Serialize)]
pub struct ClockCrossover {
    /// Clock class name ([`LunarClock::name`]).
    pub clock: &'static str,
    /// Dominant power-law noise type at the day scale: `"flicker-fm"` or `"white-fm"`.
    pub noise_type: &'static str,
    /// The clock's time error `x(τ) = σ_y(τ)·τ` at one day (s) — the P3 Table 1 spec row, in
    /// seconds, carried alongside the crossover so the table is self-describing.
    pub x_one_day_s: f64,
    /// Crossover τ (s) from the **bisection** on the general power-law curve.
    pub crossover_tau_s: f64,
    /// Crossover τ (s) from the **closed form** for the dominant noise type.
    pub crossover_tau_s_closed_form: f64,
    /// `|bisected − closed form| / |closed form|` — the row's own internal-consistency check
    /// (an absolute difference instead, in the degenerate case of a zero closed form).
    pub closed_form_rel_diff: f64,
}

/// P3's closed-form crossover τ* for `clock` against a constant frame term (s).
///
/// Both branches invert `x_clock(τ*) = frame_term_s` for the clock's *dominant* noise type,
/// reading the level off `σ_y` at τ = 1 s:
///
/// * **flicker-FM floor** — `σ_y` is flat, so `x = σ_y·τ` and `τ* = frame_term_s / σ_y`;
/// * **white FM** — `σ_y ∝ τ^{-1/2}`, so `x = σ_y(1 s)·τ^{1/2}` and
///   `τ* = (frame_term_s / σ_y(1 s))²`.
///
/// This is the algebraic companion to the general bisection, not a re-implementation of it: it
/// is exact only to the extent that one noise type dominates.
pub fn crossover_tau_closed_form(clock: LunarClock, frame_term_s: f64) -> f64 {
    let sigma_1s = sigma_y(&clock.powerlaw(), 1.0);
    let ratio = frame_term_s / sigma_1s;
    if clock.is_white_fm_limited() {
        ratio * ratio
    } else {
        ratio
    }
}

/// The clock-vs-frame crossover table: one [`ClockCrossover`] row per clock in `clocks`,
/// **all against the same frame term** `δr/c` derived from `frame_pos_error_m`.
///
/// Rows come back in the order `clocks` gives them. Deterministic and closed-form — no RNG,
/// no wall-clock.
pub fn clock_crossover_table(frame_pos_error_m: f64, clocks: &[LunarClock]) -> Vec<ClockCrossover> {
    let frame_term_s = frame_pos_error_m / C_M_S;
    clocks
        .iter()
        .map(|&clock| {
            let p = clock.powerlaw();
            let bisected = crossover_tau(
                &p,
                frame_term_s,
                CROSSOVER_BRACKET_LO_S,
                CROSSOVER_BRACKET_HI_S,
            );
            let closed = crossover_tau_closed_form(clock, frame_term_s);
            let denom = closed.abs();
            let closed_form_rel_diff = if denom > 0.0 {
                (bisected - closed).abs() / denom
            } else {
                (bisected - closed).abs()
            };
            ClockCrossover {
                clock: clock.name(),
                noise_type: if clock.is_white_fm_limited() {
                    "white-fm"
                } else {
                    "flicker-fm"
                },
                x_one_day_s: x_clock_s(&p, ONE_DAY_S),
                crossover_tau_s: bisected,
                crossover_tau_s_closed_form: closed,
                closed_form_rel_diff,
            }
        })
        .collect()
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

    /// P3 Table 2 — the published per-clock clock-vs-frame crossover τ*, exactly as the paper
    /// prints it: `(clock, printed τ*, half of the last printed digit)`. The engine value must
    /// round to the printed value at the printed precision; nothing looser.
    const P3_TABLE2: [(&str, f64, f64); 4] = [
        ("optical-master", 9.607e6, 5.0e2),
        ("passive-h-maser", 8.689e4, 5.0e0),
        ("rafs", 1.001e4, 5.0e0),
        ("mini-rafs", 3.78, 5.0e-3),
    ];

    /// The P3 default frame realisation error δr (m) ⇒ frame term δr/c ≈ 1.000692e-9 s.
    const P3_FRAME_POS_ERROR_M: f64 = 0.3;

    #[test]
    fn one_run_emits_every_clock_class_in_order() {
        // G10: the table must answer the crossover question for all four clock classes in a
        // SINGLE call, in LunarClock::all() order, against one shared frame term — so the
        // clock is the only variable across rows.
        let rows = clock_crossover_table(P3_FRAME_POS_ERROR_M, &LunarClock::all());
        assert_eq!(rows.len(), 4, "expected one row per clock class");
        let got: Vec<&str> = rows.iter().map(|r| r.clock).collect();
        let want: Vec<&str> = LunarClock::all().iter().map(|c| c.name()).collect();
        assert_eq!(got, want, "rows must follow LunarClock::all() order");
        // The noise-type label must match the clock's own classification.
        for (row, clock) in rows.iter().zip(LunarClock::all()) {
            let want_noise = if clock.is_white_fm_limited() {
                "white-fm"
            } else {
                "flicker-fm"
            };
            assert_eq!(row.noise_type, want_noise, "{}: noise type", row.clock);
            // x(1 day) is the P3 Table 1 spec row, carried in seconds.
            let rel =
                (row.x_one_day_s * 1e9 - clock.cited_one_day_ns()).abs() / clock.cited_one_day_ns();
            assert!(
                rel < 1e-3,
                "{}: x(1 day) = {} s vs cited {} ns",
                row.clock,
                row.x_one_day_s,
                clock.cited_one_day_ns()
            );
        }
    }

    #[test]
    fn a_requested_subset_is_honoured_in_the_requested_order() {
        // The table follows the caller's list, not all()'s — so a paper table can be reordered
        // without the engine silently re-sorting it.
        let want = [LunarClock::MiniRafs, LunarClock::OpticalMaster];
        let rows = clock_crossover_table(P3_FRAME_POS_ERROR_M, &want);
        assert_eq!(
            rows.iter().map(|r| r.clock).collect::<Vec<_>>(),
            vec!["mini-rafs", "optical-master"]
        );
        assert!(!rows.is_empty());
        // An empty request is an empty table, not a default-filled one.
        assert!(clock_crossover_table(P3_FRAME_POS_ERROR_M, &[]).is_empty());
    }

    #[test]
    fn every_row_agrees_with_its_own_closed_form() {
        // The row's self-check: the general bisection on x(τ)=σ_y(τ)·τ and the algebraic
        // inversion of the DOMINANT noise type are different computations. A wrong noise
        // classification, a clamped bracket or a broken coefficient set would show here.
        let rows = clock_crossover_table(P3_FRAME_POS_ERROR_M, &LunarClock::all());
        for r in &rows {
            assert!(
                r.closed_form_rel_diff < 1e-12,
                "{}: bisected τ* {} vs closed-form τ* {} (rel diff {})",
                r.clock,
                r.crossover_tau_s,
                r.crossover_tau_s_closed_form,
                r.closed_form_rel_diff
            );
            // And the reported rel diff must actually be the two fields' relative difference.
            let recomputed = (r.crossover_tau_s - r.crossover_tau_s_closed_form).abs()
                / r.crossover_tau_s_closed_form.abs();
            assert!(
                (recomputed - r.closed_form_rel_diff).abs() < 1e-18,
                "{}: reported rel diff {} ≠ recomputed {recomputed}",
                r.clock,
                r.closed_form_rel_diff
            );
            // The wide bracket must not have clamped either endpoint.
            assert!(
                r.crossover_tau_s > CROSSOVER_BRACKET_LO_S
                    && r.crossover_tau_s < CROSSOVER_BRACKET_HI_S,
                "{}: τ* {} sits on a bracket endpoint",
                r.clock,
                r.crossover_tau_s
            );
        }
    }

    #[test]
    fn the_four_crossovers_reproduce_p3_table_2() {
        // ACCEPTANCE (G10). Oracle: P3 Table 2's published per-clock crossover τ* against the
        // default frame term δr/c (δr = 0.3 m ⇒ 1.000692e-9 s):
        //   optical-master  9.607e6 s
        //   passive-h-maser 8.689e4 s  (the abstract prints 86894.3 s)
        //   rafs            1.001e4 s
        //   mini-rafs       3.78    s
        let rows = clock_crossover_table(P3_FRAME_POS_ERROR_M, &LunarClock::all());
        assert_eq!(rows.len(), P3_TABLE2.len());
        for (row, (name, printed, half_ulp)) in rows.iter().zip(P3_TABLE2) {
            assert_eq!(row.clock, name, "row order vs P3 Table 2");
            let d = (row.crossover_tau_s - printed).abs();
            assert!(
                d <= half_ulp,
                "P3 Table 2 {name}: engine τ* = {} s, paper prints {printed} s \
                 (|Δ| = {d} s > half-ulp {half_ulp} s)",
                row.crossover_tau_s
            );
        }
        // The abstract prints the PHM crossover to one decimal: 86894.3 s.
        let phm = rows.iter().find(|r| r.clock == "passive-h-maser").unwrap();
        let d = (phm.crossover_tau_s - 86_894.3).abs();
        assert!(
            d <= 0.05,
            "P3 abstract: engine PHM τ* = {} s, abstract prints 86894.3 s (|Δ| = {d} s)",
            phm.crossover_tau_s
        );
    }

    #[test]
    fn the_shared_frame_term_makes_the_clock_the_only_variable() {
        // Every row must have been bisected against the SAME frame term, so the spread across
        // rows is attributable to the clock alone. Recover δr/c from each row's own closed
        // form (flicker: τ*·σ_y; white FM: √τ*·σ_y) and check they all agree.
        let rows = clock_crossover_table(P3_FRAME_POS_ERROR_M, &LunarClock::all());
        let frame = P3_FRAME_POS_ERROR_M / C_M_S;
        for r in &rows {
            let clock = LunarClock::all()
                .into_iter()
                .find(|c| c.name() == r.clock)
                .unwrap();
            let sigma_1s = sigma_y(&clock.powerlaw(), 1.0);
            let recovered = if clock.is_white_fm_limited() {
                r.crossover_tau_s.sqrt() * sigma_1s
            } else {
                r.crossover_tau_s * sigma_1s
            };
            assert!(
                (recovered - frame).abs() / frame < 1e-12,
                "{}: frame term recovered {recovered} ≠ shared {frame}",
                r.clock
            );
        }
    }

    #[test]
    fn crossover_is_linear_in_dr_for_flicker_and_quadratic_for_white_fm() {
        // A discriminating scaling law, not a tautology: doubling the frame position error δr
        // doubles the crossover for a flicker-FM floor clock (x ∝ τ) but QUADRUPLES it for a
        // white-FM clock (x ∝ τ^{1/2}). Swapping either clock's noise classification, or
        // collapsing both to one law, fails this.
        let base = clock_crossover_table(P3_FRAME_POS_ERROR_M, &LunarClock::all());
        let doubled = clock_crossover_table(2.0 * P3_FRAME_POS_ERROR_M, &LunarClock::all());
        let tripled = clock_crossover_table(3.0 * P3_FRAME_POS_ERROR_M, &LunarClock::all());
        for ((b, d), t) in base.iter().zip(&doubled).zip(&tripled) {
            let white = b.noise_type == "white-fm";
            let (want2, want3) = if white { (4.0, 9.0) } else { (2.0, 3.0) };
            let got2 = d.crossover_tau_s / b.crossover_tau_s;
            let got3 = t.crossover_tau_s / b.crossover_tau_s;
            assert!(
                (got2 - want2).abs() / want2 < 1e-9,
                "{} ({}): δr×2 scaled τ* by {got2}, expected {want2} \
                 (τ* {} → {})",
                b.clock,
                b.noise_type,
                b.crossover_tau_s,
                d.crossover_tau_s
            );
            assert!(
                (got3 - want3).abs() / want3 < 1e-9,
                "{} ({}): δr×3 scaled τ* by {got3}, expected {want3} \
                 (τ* {} → {})",
                b.clock,
                b.noise_type,
                b.crossover_tau_s,
                t.crossover_tau_s
            );
        }
        // And the two laws really are different for this clock set — the check discriminates.
        assert!(base.iter().any(|r| r.noise_type == "white-fm"));
        assert!(base.iter().any(|r| r.noise_type == "flicker-fm"));
    }

    #[test]
    fn table_rows_match_the_single_clock_budget_they_summarise() {
        // The table must not be a second, divergent model: each row's crossover must equal the
        // one lunar_time_budget() already reports for that clock at the same frame term.
        let taus = default_tau_grid();
        let rows = clock_crossover_table(P3_FRAME_POS_ERROR_M, &LunarClock::all());
        for (row, clock) in rows.iter().zip(LunarClock::all()) {
            let b = lunar_time_budget(&BudgetParams::for_clock(clock), &taus);
            let rel = (row.crossover_tau_s - b.crossover_tau_s).abs() / b.crossover_tau_s;
            assert!(
                rel < 1e-12,
                "{}: table τ* {} vs single-clock budget τ* {} (rel {rel})",
                row.clock,
                row.crossover_tau_s,
                b.crossover_tau_s
            );
        }
    }

    #[test]
    fn crossover_table_is_deterministic() {
        let a = clock_crossover_table(P3_FRAME_POS_ERROR_M, &LunarClock::all());
        let b = clock_crossover_table(P3_FRAME_POS_ERROR_M, &LunarClock::all());
        let f = |t: &[ClockCrossover]| -> Vec<(f64, f64, f64)> {
            t.iter()
                .map(|r| {
                    (
                        r.crossover_tau_s,
                        r.crossover_tau_s_closed_form,
                        r.x_one_day_s,
                    )
                })
                .collect()
        };
        assert_eq!(f(&a), f(&b));
    }
}
