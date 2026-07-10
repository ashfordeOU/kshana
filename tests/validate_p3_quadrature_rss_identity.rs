// SPDX-License-Identifier: AGPL-3.0-only
//! Numeric-parity validation of P3 **Eq 1**, the quadrature budget assembly
//! `x_Σ(τ) = √(Σ_i x_i²(τ))`, against an independent re-implementation of the root-sum-square.
//!
//! ## Oracle — why this is Validated, not self-referential
//! Kshana's [`kshana::lunar_time_budget::lunar_time_budget`] forms `x_Σ` by *summing the
//! squares of the seven emitted term curves and taking one square root*
//! (`ss = Σ xᵢ²; √ss`). This test recomputes the same quantity a **different way**:
//! **iterated Euclidean accumulation via `f64::hypot`** — `acc = hypot(acc, xᵢ)` folded over
//! the terms — which is the numerically-stable RSS algorithm used by `numpy.linalg.norm`
//! (it never forms the sum of squares explicitly, using `√(a²+b²)` pairwise instead). Because
//! the two implementations share no code path (different associativity, different intermediate
//! representation, a library intrinsic vs an explicit loop), agreement to a tight relative
//! tolerance genuinely confirms Eq 1 is the exact RSS of the *seven* emitted terms — and would
//! **fail** on a wrong term count, a missing square, a double-counted term, or a stray factor.
//!
//! A second check reconstructs `x_Σ` from a **hand-listed** enumeration of the seven physical
//! terms (clock, RF-link, optical-link, frame, relativistic, ephemeris, measurement) taken
//! from the public [`kshana::clock_specs`] / [`kshana::lunar_time_budget::BudgetParams`] API —
//! not from the engine's term vector — so a term silently added to or dropped from the engine's
//! internal list is caught against the paper's stated seven-term budget.
//!
//! Reference: the Euclidean (2-)norm identity `‖v‖₂ = √(Σ vᵢ²)`, computed here by the
//! stable pairwise `hypot` fold (cf. `numpy.linalg.norm`, LAPACK `dnrm2`).

use kshana::clock_specs::{x_clock_s, LunarClock};
use kshana::lunar_time_budget::{default_tau_grid, lunar_time_budget, BudgetParams};

/// Independent RSS via the stable pairwise-`hypot` fold (the `numpy.linalg.norm` /
/// LAPACK `dnrm2` algorithm) — never forms Σx² explicitly, so it is a genuinely different
/// computation from the engine's sum-of-squares-then-sqrt.
fn rss_hypot(xs: &[f64]) -> f64 {
    xs.iter().fold(0.0f64, |acc, &x| acc.hypot(x))
}

fn rel_diff(got: f64, want: f64) -> f64 {
    (got - want).abs() / want.abs().max(1e-300)
}

#[test]
fn x_sigma_is_the_exact_rss_of_the_seven_emitted_terms() {
    // For every clock class and every τ on the grid, the engine's x_Σ must equal the pairwise-
    // hypot RSS of its own seven emitted term values to 1e-12 relative.
    for clock in LunarClock::all() {
        let taus = default_tau_grid();
        let b = lunar_time_budget(&BudgetParams::for_clock(clock), &taus);
        assert_eq!(b.terms.len(), 7, "{}: expected 7 terms", clock.name());

        for i in 0..taus.len() {
            let per_term: Vec<f64> = b.terms.iter().map(|t| t.x_s[i]).collect();
            let independent = rss_hypot(&per_term);
            let engine = b.x_sigma_s[i];
            let rel = rel_diff(engine, independent);
            assert!(
                rel < 1e-12,
                "{}: τ={}: engine x_Σ={engine} vs hypot-RSS={independent} (rel {rel})",
                clock.name(),
                taus[i]
            );
        }
    }
}

#[test]
fn x_sigma_matches_a_hand_listed_seven_term_reconstruction() {
    // Reconstruct x_Σ from the seven physical terms enumerated from the *public API* (not the
    // engine's internal term vector). If the engine silently drops or double-counts a term, its
    // x_Σ diverges from this independent seven-term list.
    let params = BudgetParams::default(); // PHM clock, documented default floors
    let taus = default_tau_grid();
    let b = lunar_time_budget(&params, &taus);
    let p = params.clock.powerlaw();
    let frame = params.frame_term_s();

    for (i, &tau) in taus.iter().enumerate() {
        // The seven terms, assembled from the public BudgetParams / clock_specs surface:
        let terms = [
            x_clock_s(&p, tau),                     // 1. clock (grows with τ)
            params.rf_link_floor_s,                 // 2. RF one-way link floor
            params.optical_link_floor_s,            // 3. optical two-way link floor
            frame,                                  // 4. real-time frame realisation δr/c
            params.relativistic_residual_s,         // 5. relativistic modelling residual
            params.ephemeris_s,                     // 6. ephemeris / station
            params.measurement_1s_s / tau.sqrt(),   // 7. measurement noise (averages ∝ τ^-1/2)
        ];
        let independent = rss_hypot(&terms);
        let rel = rel_diff(b.x_sigma_s[i], independent);
        assert!(
            rel < 1e-12,
            "τ={tau}: engine x_Σ={} vs 7-term hand list {independent} (rel {rel})",
            b.x_sigma_s[i]
        );
    }
}

#[test]
fn x_sigma_dominates_every_term_and_never_exceeds_their_scalar_sum() {
    // RSS sanity as an extra guard against a sign or missing-square bug:
    //   max_i xᵢ ≤ x_Σ ≤ Σ_i xᵢ   (the 2-norm is between the ∞-norm and the 1-norm).
    for clock in LunarClock::all() {
        let taus = default_tau_grid();
        let b = lunar_time_budget(&BudgetParams::for_clock(clock), &taus);
        for i in 0..taus.len() {
            let per_term: Vec<f64> = b.terms.iter().map(|t| t.x_s[i]).collect();
            let max = per_term.iter().cloned().fold(0.0f64, f64::max);
            let sum: f64 = per_term.iter().sum();
            let xs = b.x_sigma_s[i];
            assert!(
                xs >= max * (1.0 - 1e-12),
                "{}: x_Σ {xs} < max term {max}",
                clock.name()
            );
            assert!(
                xs <= sum * (1.0 + 1e-12),
                "{}: x_Σ {xs} > Σ term {sum}",
                clock.name()
            );
        }
    }
}

#[test]
fn a_deliberately_wrong_term_count_breaks_the_identity() {
    // Falsifiability demonstration (in-test only): dropping one term from the RSS input changes
    // the result — proving the parity check is sensitive to a term-count error and not vacuous.
    let params = BudgetParams::default();
    let taus = default_tau_grid();
    let b = lunar_time_budget(&params, &taus);
    // At τ = 1 s the RF-link, frame, measurement terms are all ~1 ns and dominate, so dropping
    // one of THEM (index 1 = rf-link-floor, ~1 ns) must move the RSS materially. (Dropping the
    // PHM clock term here would NOT — it is ~1e-14 s at τ=1 s — which is itself a correct
    // property of the RSS, not a blind spot: we deliberately drop a term that is significant.)
    let i = 0usize;
    let per_term: Vec<f64> = b.terms.iter().map(|t| t.x_s[i]).collect();
    let full = rss_hypot(&per_term);
    let mut minus_rf = per_term.clone();
    minus_rf.remove(1); // drop the ~1 ns RF-link floor term
    let dropped = rss_hypot(&minus_rf);
    assert!(
        rel_diff(dropped, full) > 1e-3,
        "dropping the ~1 ns RF-link term did not change the RSS — the parity check would be blind"
    );
    // And the engine matches the FULL seven-term RSS, not the six-term one.
    assert!(rel_diff(b.x_sigma_s[i], full) < 1e-12);
    assert!(rel_diff(b.x_sigma_s[i], dropped) > 1e-3);
}
