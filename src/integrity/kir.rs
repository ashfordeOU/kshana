//! Integrity-risk multipliers for timing protection levels.
//!
//! A pointwise protection level uses a two-sided multiplier `K(IR) = Φ⁻¹(1 −
//! IR/2)`. A *running-max* protection level — the sup of the error process over
//! a coast interval — must inflate this: reflecting the process about a level
//! and applying the sup bound trades the pointwise `K(IR/2)` for the interval
//! `K(IR/2) = Φ⁻¹(1 − IR/4)`. This reflection is **exact only for a white-FM
//! (Brownian) leg**; for the random-walk-FM (τ³) and drift (τ⁵) legs, which are
//! integrated Brownian motion rather than a martingale, it is a **conservative
//! (safe) overbound, not exact**.

use crate::raim::normal_quantile;

/// One-sided integrity multiplier `K = Φ⁻¹(1 − ir)`.
pub fn k_ir_one_sided(ir: f64) -> f64 {
    normal_quantile(1.0 - ir)
}

/// Two-sided (pointwise) integrity multiplier `K(ir) = Φ⁻¹(1 − ir/2)`.
pub fn k_ir_two_sided(ir: f64) -> f64 {
    normal_quantile(1.0 - ir / 2.0)
}

/// Running-max integrity multiplier over a coast interval: `K(ir/2) =
/// Φ⁻¹(1 − ir/4)`. Strictly larger than the pointwise `k_ir_two_sided(ir)`.
/// Exact reflection for the white-FM leg; conservative overbound for the
/// τ³/τ⁵ legs.
pub fn k_running_max(ir: f64) -> f64 {
    k_ir_two_sided(ir / 2.0)
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn running_max_uses_half_ir() {
        let ir = 1e-3;
        assert!((k_running_max(ir) - k_ir_two_sided(ir / 2.0)).abs() < 1e-12);
    }

    #[test]
    fn running_max_strictly_inflates_pointwise() {
        for ir in [1e-2, 1e-3, 1e-5, 1e-7] {
            assert!(
                k_running_max(ir) > k_ir_two_sided(ir),
                "running-max K(ir/2) must exceed pointwise K(ir) at ir={ir}"
            );
        }
    }

    #[test]
    fn multipliers_are_ordered_and_positive() {
        let ir = 1e-4;
        assert!(k_ir_one_sided(ir) > 0.0);
        assert!(k_ir_two_sided(ir) > k_ir_one_sided(ir));
        assert!(k_running_max(ir) > k_ir_two_sided(ir));
    }
}
