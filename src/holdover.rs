// SPDX-License-Identifier: Apache-2.0
//! **GNSS-denied clock holdover.**
//!
//! The defining value of a high-stability (and especially a *quantum*) clock in a
//! PNT system is **holdover**: when the GNSS signal is jammed, spoofed or simply
//! unavailable, how long can the onboard clock free-run before its timing error
//! exceeds the budget? Kshana already models clock noise comprehensively — Allan
//! deviation and noise-type classification ([`crate::allan`]), the three-state
//! van Loan Kalman clock ([`crate::clock_state`]), and stochastic synthesis
//! ([`crate::models::ClockModel`]). What it lacked was the one operational answer a
//! resilience trade asks directly: *given this clock, what is my coast time to an
//! N-nanosecond error?*
//!
//! This module exposes that answer in closed form. For the standard power-law
//! clock model the **phase-error variance after coasting `t` seconds** from a
//! perfectly known state is the van Loan process-noise term
//!
//! ```text
//!   σ_x²(t) = q_wf·t  +  q_rw·t³/3  +  q_drift·t⁵/20         (s²)
//! ```
//!
//! with `q_wf` the white-FM PSD, `q_rw` the random-walk-FM PSD and `q_drift` the
//! random-run/drift PSD (the same PSDs [`crate::clock_state::q_from_allan`]
//! produces from Allan deviations). This is *identical* to the phase variance
//! `ClockState3::new(q_wf, q_rw, q_drift).predict(t)` accumulates from zero
//! covariance — the cross-check is a unit test here. Because each term is
//! non-negative and increasing, the variance is monotone in `t`, so inverting it
//! for the **holdover duration to a phase-error threshold** is a well-posed
//! root-find ([`holdover_seconds`]).
//!
//! On top of the stochastic growth a clock also drifts deterministically: a known
//! residual frequency offset `y₀` and aging `D` give a time-interval error
//! `x(t) = y₀·t + ½·D·t²` ([`deterministic_tie`]) — the part a good estimator
//! removes while GNSS is present and which therefore enters holdover only through
//! its *estimation* residual.
//!
//! **A caveat that must travel with every class-based holdover figure.** For a
//! very stable clock the white-FM term is so small that the holdover to a tight
//! timing threshold is dominated *not* by the cited `σ_y(1 s)` but by the assumed
//! long-tau red-noise floor (`q_rw`, `q_drift`). The [`ClockClass`] and
//! [`QuantumClockClass`] convenience methods *synthesise* that floor from the
//! white-FM ADEV (two and four decades below it) — a representative modelling
//! assumption, **not** a measured value, and the holdover is sensitive to it
//! (sweeping the floor a decade can move a class holdover several-fold). For a
//! defensible result, call [`holdover_seconds`] with the clock's **measured**
//! `q_rw`/`q_drift` rather than relying on the class default; the class figures are
//! an order-of-magnitude bracket whose long-tau answer is floor-governed and is
//! reported as such, not a per-unit specification.
//!
//! Scope is the **timing-error budget** a feasibility trade needs; it is not a
//! clock-hardware design tool. The quantum-clock classes ([`QuantumClockClass`])
//! carry representative order-of-magnitude stabilities from the open literature,
//! exactly as [`crate::clock_state::ClockClass`] does for the classical
//! oscillators — not any one flight unit.
//!
//! References: Riley, *Handbook of Frequency Stability Analysis* (NIST SP 1065);
//! Zucca & Tavella, *The Clock Model and Its Relationship with the Allan and
//! Related Variances* (IEEE UFFC, 2005); Ludlow et al., *Optical atomic clocks*
//! (Rev. Mod. Phys. 87, 2015); Burt et al., *Demonstration of a trapped-ion atomic
//! clock in space* (Nature 595, 2021).

use crate::clock_state::{q_from_allan, ClockClass};
use crate::types::Seconds;

/// Speed of light (m/s) — for mapping a timing error to a one-way range error.
pub const C_LIGHT_M_PER_S: f64 = 299_792_458.0;

/// **Stochastic phase-error variance** `σ_x²(t)` (s²) after free-running for `t`
/// seconds from a perfectly known clock state, for the power-law PSDs
/// `(q_wf, q_rw, q_drift)`: `q_wf·t + q_rw·t³/3 + q_drift·t⁵/20` (van Loan; see
/// module docs). Negative `t` is clamped to zero.
pub fn coast_phase_variance(q_wf: f64, q_rw: f64, q_drift: f64, t: Seconds) -> f64 {
    let t = t.max(0.0);
    let t2 = t * t;
    let t3 = t2 * t;
    let t5 = t3 * t2;
    q_wf * t + q_rw * t3 / 3.0 + q_drift * t5 / 20.0
}

/// **Stochastic phase-error 1-σ** (s) after coasting `t` seconds — the square root
/// of [`coast_phase_variance`].
pub fn coast_phase_sigma(q_wf: f64, q_rw: f64, q_drift: f64, t: Seconds) -> Seconds {
    coast_phase_variance(q_wf, q_rw, q_drift, t).sqrt()
}

/// **Holdover duration** (s): the coast time at which the stochastic phase-error
/// 1-σ first reaches `threshold_s` seconds, for PSDs `(q_wf, q_rw, q_drift)`.
/// Inverts the monotone [`coast_phase_variance`] for `σ_x(t) = threshold_s`.
///
/// Returns `f64::INFINITY` if the clock has no process noise (all PSDs zero) and
/// `0.0` for a non-positive threshold. The white-FM-only case has the exact
/// closed form `t = threshold² / q_wf`.
pub fn holdover_seconds(q_wf: f64, q_rw: f64, q_drift: f64, threshold_s: Seconds) -> Seconds {
    // PSDs must be finite and non-negative; the monotonicity the inversion relies on
    // is otherwise violated and the bisection would return a plausible-looking but
    // meaningless value. Fail loudly with NaN rather than silently.
    if !q_wf.is_finite() || !q_rw.is_finite() || !q_drift.is_finite() || !threshold_s.is_finite() {
        return f64::NAN;
    }
    if q_wf < 0.0 || q_rw < 0.0 || q_drift < 0.0 {
        return f64::NAN;
    }
    if threshold_s <= 0.0 {
        return 0.0;
    }
    let target = threshold_s * threshold_s; // compare on variance
    let var = |t: f64| coast_phase_variance(q_wf, q_rw, q_drift, t);
    if var(1.0) == 0.0 && q_wf == 0.0 && q_rw == 0.0 && q_drift == 0.0 {
        return f64::INFINITY;
    }
    // Bracket: expand hi until the variance exceeds the target.
    let mut hi = 1.0_f64;
    let mut guard = 0;
    while var(hi) < target {
        hi *= 2.0;
        guard += 1;
        if guard > 200 {
            return f64::INFINITY; // unreachable threshold within any sane horizon
        }
    }
    // Bisection (variance is monotone increasing in t).
    let mut lo = 0.0_f64;
    for _ in 0..100 {
        let mid = 0.5 * (lo + hi);
        if var(mid) < target {
            lo = mid;
        } else {
            hi = mid;
        }
    }
    0.5 * (lo + hi)
}

/// **Deterministic time-interval error** (s) after `t` seconds for a residual
/// fractional-frequency offset `freq_offset` (dimensionless `y₀`) and aging/drift
/// `drift` (1/s): `x(t) = y₀·t + ½·D·t²`. This is the part GNSS removes while it is
/// present; only its post-estimation residual contributes to holdover.
pub fn deterministic_tie(freq_offset: f64, drift: f64, t: Seconds) -> Seconds {
    let t = t.max(0.0);
    freq_offset * t + 0.5 * drift * t * t
}

/// Map a timing error (s) to the one-way range error (m) it causes: `c · Δt`.
pub fn phase_to_range_m(phase_s: Seconds) -> f64 {
    C_LIGHT_M_PER_S * phase_s
}

/// Holdover (s) for a classical reference [`ClockClass`] to a phase-error
/// threshold, using the class's representative power-law PSDs.
pub fn holdover_for_class(class: ClockClass, threshold_s: Seconds) -> Seconds {
    let (q_wf, q_rw, q_drift) = class.psds();
    holdover_seconds(q_wf, q_rw, q_drift, threshold_s)
}

/// Reference **quantum-clock** classes, by their τ = 1 s Allan deviation — the
/// optical and trapped-ion clocks a quantum-PNT demonstrator weighs against the
/// classical oscillators in [`ClockClass`].
///
/// Figures are representative order-of-magnitude values from the open literature
/// (Ludlow et al., *Rev. Mod. Phys.* 2015; Burt et al., *Nature* 2021); they
/// bracket the holdover an optical clock buys, not any one flight unit. The
/// long-tau red-noise floors are *synthesised* two and four decades below the
/// white-FM `σ_y(1 s)` (as for [`ClockClass`]). **Important:** for a clock this
/// stable the holdover to a tight threshold is governed by that assumed floor, not
/// by the cited ADEV — see the module-level caveat. Use the explicit
/// [`holdover_seconds`] with measured floors for a defensible number.
#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub enum QuantumClockClass {
    /// **Optical lattice clock** (neutral Sr/Yb) — many-atom optical reference:
    /// `σ_y(1 s) ≈ 5e-16` (Ludlow et al. 2015). The most stable short-term class.
    OpticalLattice,
    /// **Trapped-ion optical clock** (e.g. Al⁺ quantum-logic) — single-ion
    /// reference with exceptional accuracy: `σ_y(1 s) ≈ 1e-15`.
    TrappedIon,
    /// **Space-qualified mercury-ion clock** (DSAC-heritage, microwave) —
    /// `σ_y(1 s) ≈ 1e-13` reaching ≈1e-15 at long tau (Burt et al. 2021). The
    /// flight-demonstrated quantum reference today.
    MercuryIon,
}

impl QuantumClockClass {
    /// The class's representative white-FM Allan deviation at τ = 1 s.
    pub fn adev_1s(self) -> f64 {
        match self {
            QuantumClockClass::OpticalLattice => 5.0e-16,
            QuantumClockClass::TrappedIon => 1.0e-15,
            QuantumClockClass::MercuryIon => 1.0e-13,
        }
    }

    /// Representative `(q_wf, q_rw, q_drift)` PSDs for this class, via
    /// [`q_from_allan`] with conservative long-tau floors (see type docs).
    pub fn psds(self) -> (f64, f64, f64) {
        let a = self.adev_1s();
        q_from_allan(a, a * 1.0e-2, a * 1.0e-4)
    }

    /// Holdover (s) for this clock to a phase-error threshold `threshold_s`.
    pub fn holdover_seconds(self, threshold_s: Seconds) -> Seconds {
        let (q_wf, q_rw, q_drift) = self.psds();
        holdover_seconds(q_wf, q_rw, q_drift, threshold_s)
    }
}

#[cfg(test)]
mod tests {
    use super::*;
    use crate::clock_state::ClockState3;

    // ── Cross-module check: the single-shot closed form equals the FULL
    // multi-step Kalman covariance recursion. Stepping `predict` 500 times
    // actually exercises the F·P·Fᵀ propagation and the developing phase/freq/
    // drift cross-terms — the t³/3 and t⁵/20 phase-variance growth only emerges
    // from integrating the lower-state covariance through F over many steps — so
    // this is a genuinely independent computation path, not a re-statement of the
    // same polynomial (a wrong coefficient in either copy would diverge here).
    #[test]
    fn coast_variance_matches_multistep_kalman_recursion() {
        let (q_wf, q_rw, q_drift) = (1e-20, 1e-24, 1e-30);
        for &t in &[100.0, 3600.0] {
            let mut cs = ClockState3::new(q_wf, q_rw, q_drift);
            let steps = 500;
            let dt = t / steps as f64;
            for _ in 0..steps {
                cs.predict(dt);
            }
            let theirs = cs.p[0][0]; // full F·P·Fᵀ + Q accumulation over 500 steps
            let ours = coast_phase_variance(q_wf, q_rw, q_drift, t);
            let rel = (ours - theirs).abs() / theirs.max(1e-300);
            assert!(
                rel < 1e-9,
                "t={t}: closed {ours:.6e} vs 500-step recursion {theirs:.6e}"
            );
        }
    }

    // ── White-FM-only holdover has the exact closed form t = (thr/σ)² ─────────
    #[test]
    fn white_fm_holdover_is_exact_closed_form() {
        let q_wf = 9e-21; // (3e-11)² → σ_y(1 s) ≈ 3e-11
        let threshold = 1e-9; // 1 ns
        let t = holdover_seconds(q_wf, 0.0, 0.0, threshold);
        let exact = threshold * threshold / q_wf; // q_wf·t = threshold²
        let rel = (t - exact).abs() / exact;
        assert!(rel < 1e-9, "holdover {t:.6e} vs exact {exact:.6e}");
    }

    // ── Round-trip: σ(holdover) == threshold ──────────────────────────────────
    #[test]
    fn holdover_round_trips_to_threshold() {
        let (q_wf, q_rw, q_drift) = (1e-22, 1e-26, 1e-32);
        let threshold = 1e-8;
        let t = holdover_seconds(q_wf, q_rw, q_drift, threshold);
        let sigma = coast_phase_sigma(q_wf, q_rw, q_drift, t);
        let rel = (sigma - threshold).abs() / threshold;
        assert!(
            rel < 1e-6,
            "σ(holdover)={sigma:.6e} vs threshold {threshold:.6e}"
        );
    }

    // ── Monotonicity: variance strictly increases with coast time ─────────────
    #[test]
    fn variance_is_monotone_in_time() {
        let (q_wf, q_rw, q_drift) = (1e-20, 1e-24, 1e-30);
        let mut prev = 0.0;
        for k in 0..20 {
            let t = (k as f64) * 100.0 + 1.0;
            let v = coast_phase_variance(q_wf, q_rw, q_drift, t);
            assert!(v > prev, "variance not increasing at t={t}");
            prev = v;
        }
    }

    // ── Ordering follows the SHARED floor recipe, by construction ──────────────
    // Every class uses the identical recipe q_from_allan(a, a·1e-2, a·1e-4), so
    // holdover is a fixed monotone-decreasing function of the single parameter a.
    // This is therefore a *consistency* check (a smaller cited ADEV, under the same
    // assumed floor, yields a longer holdover) — NOT an independent physical
    // discovery, since the floor (which dominates, see below) scales with a too.
    #[test]
    fn holdover_ordering_follows_the_shared_floor_recipe() {
        let threshold = 1e-8; // 10 ns
        let csac = holdover_for_class(ClockClass::Csac, threshold);
        let uso = holdover_for_class(ClockClass::Uso, threshold);
        let dsac = holdover_for_class(ClockClass::Dsac, threshold);
        let optical = QuantumClockClass::OpticalLattice.holdover_seconds(threshold);
        assert!(uso > csac, "USO {uso:.2} should beat CSAC {csac:.2}");
        assert!(dsac > uso, "DSAC {dsac:.2} should beat USO {uso:.2}");
        assert!(
            optical > dsac,
            "optical {optical:.2} should beat DSAC {dsac:.2}"
        );
    }

    // ── Honest self-check: for a very stable clock the class holdover to a tight
    // threshold is GOVERNED BY the assumed long-tau floor, not the cited ADEV.
    // This test exists to make that dependency explicit, not to sell a headline
    // "optical coasts N hours" number (which would be a floor artefact).
    #[test]
    fn class_holdover_to_tight_threshold_is_floor_dominated() {
        let threshold = 1e-9; // 1 ns
        let a = QuantumClockClass::OpticalLattice.adev_1s();
        // White-FM alone (no floor) gives an absurd, mission-irrelevant holdover —
        // proof that the cited ADEV does NOT set the class number:
        let (q_wf, _, _) = QuantumClockClass::OpticalLattice.psds();
        let white_only = holdover_seconds(q_wf, 0.0, 0.0, threshold);
        assert!(
            white_only > 1.0e9,
            "white-FM-only holdover {white_only:.2e} s is mission-irrelevant"
        );
        // With the assumed floor it is far shorter — the floor sets it:
        let with_floor = QuantumClockClass::OpticalLattice.holdover_seconds(threshold);
        assert!(
            with_floor < white_only / 1.0e3,
            "the assumed floor must dominate the class holdover"
        );
        // …and the answer moves materially with the assumed floor decade:
        let (q_wf2, q_rw2, q_drift2) = q_from_allan(a, a * 1.0e-3, a * 1.0e-3);
        let steeper = holdover_seconds(q_wf2, q_rw2, q_drift2, threshold);
        assert!(
            (steeper - with_floor).abs() / with_floor > 0.2,
            "holdover should be sensitive to the assumed floor ({steeper:.2e} vs {with_floor:.2e})"
        );
    }

    // ── Bad inputs fail loudly (NaN), not silently with a plausible number ─────
    #[test]
    fn nan_or_negative_psd_returns_nan() {
        assert!(holdover_seconds(f64::NAN, 0.0, 0.0, 1e-9).is_nan());
        assert!(holdover_seconds(-1e-20, 0.0, 0.0, 1e-9).is_nan());
        assert!(holdover_seconds(1e-20, -1e-30, 0.0, 1e-9).is_nan());
    }

    // ── Deterministic TIE: pure drift gives ½ D t² ────────────────────────────
    #[test]
    fn deterministic_tie_quadratic_in_drift() {
        let drift = 1e-12; // 1/s
        let t = 1000.0;
        let tie = deterministic_tie(0.0, drift, t);
        let expected = 0.5 * drift * t * t;
        assert!((tie - expected).abs() < 1e-18, "tie {tie:.6e}");
        // and the linear frequency term:
        let tie2 = deterministic_tie(1e-13, 0.0, t);
        assert!((tie2 - 1e-13 * t).abs() < 1e-22);
    }

    // ── Range mapping: 1 ns → ~0.2998 m ───────────────────────────────────────
    #[test]
    fn one_ns_is_about_thirty_cm() {
        let r = phase_to_range_m(1e-9);
        assert!((r - 0.299_792_458).abs() < 1e-9, "1 ns → {r} m");
    }

    // ── Edge cases ────────────────────────────────────────────────────────────
    #[test]
    fn zero_threshold_and_noiseless_clock() {
        assert_eq!(holdover_seconds(1e-20, 0.0, 0.0, 0.0), 0.0);
        assert_eq!(holdover_seconds(0.0, 0.0, 0.0, 1e-9), f64::INFINITY);
    }
}
