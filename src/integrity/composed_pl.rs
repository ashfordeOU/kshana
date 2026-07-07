//! R4 — the composed P₀-seeded holdover ride-through protection level.
//!
//! The holdover protection level is
//! `HPL(τ) = ½·D·τ²  +  K(IR/2)·√( P₀ + q_wf·τ + q_rw·τ³/3 + q_drift·τ⁵/20 + (φ·τ)² )`,
//! with phase-error variance exponents τ / τ³ / τ⁵ (white-FM / RW-FM / drift —
//! phase, not frequency, exponents), the deterministic aging bias ½Dτ² carried
//! separately from the stochastic sup (no double counting), the running-max
//! multiplier K(IR/2) applied to the stochastic part (exact reflection for the
//! white-FM leg, a conservative overbound for the τ³/τ⁵ legs), a conservative
//! bounded inflation `(φ·τ)²` for the flicker-FM (1/f) leg (which has no finite
//! SDE state; Zucca-Tavella exclude it), and the handover-state phase variance
//! P₀ seeding the coast start. An un-seeded PL (P₀ = 0) drops on source loss —
//! unsafe. Multi-year envelope coverage is Validated against BIPM Circular-T
//! `[UTC−UTC(USNO)]` (see `tests/cti_holdover_coverage_reference.rs`); the
//! composition itself is Modelled (algebra + internal consistency).

use crate::holdover::coast_phase_variance;
use crate::integrity::kir::k_running_max;

/// Holdover noise + seed parameters for one disciplined oscillator.
#[derive(Clone, Copy, Debug)]
pub struct HoldoverEnvelope {
    /// White-FM PSD on phase (s²/s).
    pub q_wf: f64,
    /// Random-walk-FM PSD ((1/s)²/s).
    pub q_rw: f64,
    /// Random-run / drift PSD ((1/s²)²/s).
    pub q_drift: f64,
    /// Deterministic aging / drift D (1/s²) → bias ½Dτ².
    pub d_aging: f64,
    /// Flicker-FM floor (fractional, dimensionless) → bounded (φ·τ)² inflation.
    pub flicker_floor_s: f64,
    /// Handover-state phase-error variance P₀ (s²) seeding the coast start.
    pub p0_phase_var_s2: f64,
}

impl HoldoverEnvelope {
    /// Stochastic phase-error variance at coast time `τ` (s²), including the
    /// P₀ seed and the conservative flicker inflation.
    pub fn stochastic_variance(&self, tau_s: f64) -> f64 {
        self.p0_phase_var_s2
            + coast_phase_variance(self.q_wf, self.q_rw, self.q_drift, tau_s)
            + (self.flicker_floor_s * tau_s).powi(2)
    }

    /// Deterministic aging bias ½Dτ² (s).
    pub fn aging_bias(&self, tau_s: f64) -> f64 {
        0.5 * self.d_aging * tau_s * tau_s
    }
}

/// The holdover protection level at integrity risk `ir` and coast time `tau_s`.
pub fn hpl(env: &HoldoverEnvelope, ir: f64, tau_s: f64) -> f64 {
    env.aging_bias(tau_s) + k_running_max(ir) * env.stochastic_variance(tau_s).sqrt()
}

/// The composed ride-through protection level across the RAIM → holdover seam:
/// `PL(τ) = max( TPL_handover , HPL(τ) )`. Lower-semicontinuous and
/// non-decreasing across handover (`PL(0⁺) ≥ PL(0⁻)`); the `max(·)` prevents the
/// downward jump a naive continuity claim would force (TPL_handover carries
/// fault-mode overbounds absent from a pure coast). Generalizes the single
/// transition of Baweja (arXiv:2606.24210, N=1).
pub fn composed_pl(tpl_handover_s: f64, env: &HoldoverEnvelope, ir: f64, tau_s: f64) -> f64 {
    hpl(env, ir, tau_s).max(tpl_handover_s)
}

/// Machine-checkable statement of the handover property: `PL(0⁺) ≥ PL(0⁻)`,
/// i.e. the composed PL does not drop when the last cross-check source is lost.
pub fn is_lower_semicontinuous_at_handover(
    tpl_handover_s: f64,
    env: &HoldoverEnvelope,
    ir: f64,
) -> bool {
    composed_pl(tpl_handover_s, env, ir, 0.0) >= tpl_handover_s
}

#[cfg(test)]
mod tests {
    use super::*;

    fn env() -> HoldoverEnvelope {
        HoldoverEnvelope {
            q_wf: 1e-24,
            q_rw: 1e-30,
            q_drift: 1e-38,
            d_aging: 1e-18,
            flicker_floor_s: 1e-13,
            p0_phase_var_s2: 4e-20, // (0.2 ns)²
        }
    }

    #[test]
    fn hpl_is_monotone_increasing_in_tau() {
        let e = env();
        let mut prev = hpl(&e, 1e-5, 0.0);
        for &t in &[1.0, 10.0, 100.0, 1000.0, 1e4, 1e5] {
            let h = hpl(&e, 1e-5, t);
            assert!(h >= prev, "HPL must be non-decreasing in τ (t={t})");
            prev = h;
        }
    }

    #[test]
    fn p0_seed_floors_hpl_at_tau_zero() {
        let e = env();
        // At τ=0 stochastic var = P₀_phase; HPL(0) = K(ir/2)·√P₀ > 0.
        let h0 = hpl(&e, 1e-5, 0.0);
        assert!(h0 > 0.0);
        let mut unseeded = e;
        unseeded.p0_phase_var_s2 = 0.0;
        unseeded.d_aging = 0.0;
        assert_eq!(hpl(&unseeded, 1e-5, 0.0), 0.0);
    }

    #[test]
    fn running_max_multiplier_is_used_not_pointwise() {
        // HPL uses K(ir/2); reconstruct with pointwise K(ir) and confirm HPL larger.
        use crate::integrity::kir::{k_ir_two_sided, k_running_max};
        let e = env();
        let t = 1000.0;
        let var = e.p0_phase_var_s2
            + crate::holdover::coast_phase_variance(e.q_wf, e.q_rw, e.q_drift, t)
            + (e.flicker_floor_s * t).powi(2);
        let bias = 0.5 * e.d_aging * t * t;
        let pointwise = bias + k_ir_two_sided(1e-5) * var.sqrt();
        let running = bias + k_running_max(1e-5) * var.sqrt();
        assert!((hpl(&e, 1e-5, t) - running).abs() < 1e-18);
        assert!(hpl(&e, 1e-5, t) > pointwise);
    }

    #[test]
    fn phase_variance_exponents_are_tau_tau3_tau5() {
        // Exponent-lint gate: isolate each leg, check variance growth order.
        // white-FM: var(2τ)/var(τ) ≈ 2; RW-FM: ≈ 8 (τ³); drift: ≈ 32 (τ⁵).
        use crate::holdover::coast_phase_variance;
        let t = 100.0;
        let wf = coast_phase_variance(1e-24, 0.0, 0.0, 2.0 * t)
            / coast_phase_variance(1e-24, 0.0, 0.0, t);
        let rw = coast_phase_variance(0.0, 1e-30, 0.0, 2.0 * t)
            / coast_phase_variance(0.0, 1e-30, 0.0, t);
        let dr = coast_phase_variance(0.0, 0.0, 1e-38, 2.0 * t)
            / coast_phase_variance(0.0, 0.0, 1e-38, t);
        assert!((wf - 2.0).abs() < 1e-6, "white-FM phase variance ∝ τ");
        assert!((rw - 8.0).abs() < 1e-6, "RW-FM phase variance ∝ τ³");
        assert!((dr - 32.0).abs() < 1e-6, "drift phase variance ∝ τ⁵");
    }

    #[test]
    fn aging_bias_carried_separately_from_stochastic_sup() {
        // With zero stochastic noise, HPL == deterministic aging bias exactly.
        let e = HoldoverEnvelope {
            q_wf: 0.0,
            q_rw: 0.0,
            q_drift: 0.0,
            d_aging: 1e-16,
            flicker_floor_s: 0.0,
            p0_phase_var_s2: 0.0,
        };
        let t = 500.0;
        assert!((hpl(&e, 1e-5, t) - 0.5 * 1e-16 * t * t).abs() < 1e-24);
    }

    #[test]
    fn pl_is_lower_semicontinuous_across_handover() {
        // PL(0⁺) ≥ PL(0⁻)=TPL_handover for every envelope / handover TPL.
        let e = env();
        for &tpl in &[1e-9, 5e-9, 20e-9, 100e-9] {
            let pl_plus = composed_pl(tpl, &e, 1e-5, 0.0);
            assert!(pl_plus >= tpl, "PL(0⁺) must be ≥ TPL_handover (tpl={tpl})");
            assert!(is_lower_semicontinuous_at_handover(tpl, &e, 1e-5));
        }
    }

    #[test]
    fn unseeded_raw_hpl_would_drop_but_composed_pl_does_not() {
        // Without the max(), a P₀=0 HPL(0)=0 < TPL_handover → unsafe drop.
        let mut unseeded = env();
        unseeded.p0_phase_var_s2 = 0.0;
        unseeded.d_aging = 0.0;
        let tpl = 30e-9;
        assert!(hpl(&unseeded, 1e-5, 0.0) < tpl); // raw HPL drops
        assert_eq!(composed_pl(tpl, &unseeded, 1e-5, 0.0), tpl); // composed holds
    }

    #[test]
    fn composed_pl_is_non_decreasing_over_coast() {
        let e = env();
        let tpl = 10e-9;
        let mut prev = composed_pl(tpl, &e, 1e-5, 0.0);
        for &t in &[1.0, 100.0, 1e4, 1e5, 1e6] {
            let pl = composed_pl(tpl, &e, 1e-5, t);
            assert!(pl >= prev, "composed PL must be non-decreasing (t={t})");
            prev = pl;
        }
    }
}
