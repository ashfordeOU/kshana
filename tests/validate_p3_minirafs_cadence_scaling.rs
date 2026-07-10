// SPDX-License-Identifier: AGPL-3.0-only
//! Validates the **underlying white-FM scaling law** the P3 Discussion's
//! "cadence-substitutes-for-mass" argument rests on: the miniRAFS time error obeys
//! `x(τ) = σ_y(τ)·τ ∝ √τ`, so time-transferring more often (a shorter resync interval `τ`)
//! reduces the accumulated error by exactly `√(τ₂/τ₁)`.
//!
//! ## Scope — the headline claim stays Modelled
//! The paper's qualitative claim — that *frequent time transfer relieves the miniRAFS's
//! 151 ns/day so a light SWaP clock can be flown instead of a heavier one* — is an
//! engineering/operations judgement that this test does **not** certify. What is checkable, and
//! what the argument physically rests on, is the **white-FM √τ scaling** of the accumulated time
//! error. This test validates only that scaling law and the single-day anchor, against an
//! independent NumPy-style scalar oracle; the mass-vs-cadence trade itself remains Modelled.
//!
//! ## Oracle — why this is a genuine cross-check
//! The reference is the closed-form white-FM identity, hardcoded and evaluated as a scalar (the
//! same arithmetic `numpy` would do), *not* re-derived from the engine:
//!   * white FM ⇒ `σ_y(τ) = √(h₀ / (2τ))`, so `x(τ) = σ_y·τ = √(h₀·τ / 2)` — hence
//!     `x(τ₂)/x(τ₁) = √(τ₂/τ₁)`, independent of `h₀` (IEEE Std 1139-2008; W. J. Riley,
//!     *Handbook of Frequency Stability Analysis*, NIST SP 1065 (2008), §3).
//!   * The one-day anchor `x(86 400 s) = 151.238 ns` is the published P3 Table-1 miniRAFS row.
//! The engine's [`kshana::clock_specs::x_clock_ns`] must reproduce both the ratio and the anchor.
//! A wrong slope (e.g. a flicker-floor `∝ τ` law) would fail the ratio; a mis-calibrated `h₀`
//! would fail the anchor.

use kshana::clock_specs::{x_clock_ns, LunarClock, ONE_DAY_S};

/// Closed-form white-FM accumulated time error ratio between two resync intervals — the NumPy
/// scalar oracle. Independent of `h₀` and of the engine: `x(τ₂)/x(τ₁) = √(τ₂/τ₁)`.
fn white_fm_ratio(tau2: f64, tau1: f64) -> f64 {
    (tau2 / tau1).sqrt()
}

fn rel_diff(got: f64, want: f64) -> f64 {
    (got - want).abs() / want.abs().max(1e-300)
}

#[test]
fn one_day_resync_anchor_reproduces_the_cited_151_238_ns() {
    // Anchor: the published P3 Table-1 miniRAFS one-day row.
    let x_1day = x_clock_ns(LunarClock::MiniRafs, ONE_DAY_S);
    let rel = rel_diff(x_1day, 151.238);
    assert!(
        rel < 1e-3,
        "miniRAFS x(1 day) = {x_1day} ns vs cited 151.238 ns (rel {rel})"
    );
}

#[test]
fn four_times_a_day_resync_halves_the_accumulated_error() {
    // The Discussion's concrete lever: resyncing 4×/day (τ = 21600 s) instead of once/day
    // (τ = 86400 s) cuts the accumulated time error by √(21600/86400) = √(1/4) = 1/2 exactly.
    let daily = x_clock_ns(LunarClock::MiniRafs, 86_400.0);
    let four_per_day = x_clock_ns(LunarClock::MiniRafs, 21_600.0);
    let ratio = four_per_day / daily;
    assert!(
        rel_diff(ratio, 0.5) < 1e-9,
        "x(21600 s)/x(86400 s) = {ratio}, expected 0.5 (half the error at 4×/day cadence)"
    );
    // Sanity on the absolute reduced value: 151.238 ns / 2 = 75.619 ns.
    assert!(
        rel_diff(four_per_day, 151.238 / 2.0) < 2e-3,
        "4×/day accumulated error {four_per_day} ns ≠ 151.238/2 ns"
    );
}

#[test]
fn accumulated_error_follows_the_sqrt_tau_law_across_many_resync_intervals() {
    // The full scaling law: over a range of resync intervals the engine's x(τ) must track the
    // closed-form √τ law to machine precision, anchored at one day. This is the physical basis
    // of the "more frequent transfer relieves the coarse clock" statement.
    let anchor_tau = ONE_DAY_S;
    let anchor_x = x_clock_ns(LunarClock::MiniRafs, anchor_tau);
    // Resync cadences from every-minute to every-4-days.
    for &tau in &[60.0, 300.0, 900.0, 3600.0, 10_800.0, 21_600.0, 43_200.0, 172_800.0, 345_600.0]
    {
        let engine = x_clock_ns(LunarClock::MiniRafs, tau);
        // Independent oracle: anchor scaled by the closed-form √τ ratio.
        let oracle = anchor_x * white_fm_ratio(tau, anchor_tau);
        let rel = rel_diff(engine, oracle);
        assert!(
            rel < 1e-9,
            "τ={tau}: engine x={engine} ns vs √τ-law oracle {oracle} ns (rel {rel})"
        );
    }
}

#[test]
fn the_law_is_white_fm_not_a_flicker_floor() {
    // Falsifiability: a flicker-floor clock would give x ∝ τ (ratio = τ₂/τ₁ = 1/4 at 4×/day),
    // NOT 1/2. Confirm the miniRAFS ratio is the white-FM √-law value and clearly distinct from
    // the flicker-floor linear value, so the test could catch a wrong noise-type assignment.
    let daily = x_clock_ns(LunarClock::MiniRafs, 86_400.0);
    let four_per_day = x_clock_ns(LunarClock::MiniRafs, 21_600.0);
    let ratio = four_per_day / daily;
    let flicker_linear_ratio = 21_600.0 / 86_400.0; // = 0.25, the ∝τ prediction
    assert!(
        rel_diff(ratio, 0.5) < 1e-9,
        "miniRAFS ratio {ratio} is not the white-FM √-law value 0.5"
    );
    assert!(
        (ratio - flicker_linear_ratio).abs() > 0.2,
        "miniRAFS ratio {ratio} is indistinguishable from the ∝τ flicker prediction \
         {flicker_linear_ratio} — the test could not catch a wrong noise-type assignment"
    );
    assert!(LunarClock::MiniRafs.is_white_fm_limited());
}
