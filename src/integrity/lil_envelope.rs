//! R4 — law-of-the-iterated-logarithm envelope for the holdover leg.
//!
//! Turns the conditional-holdover impossibility (Baweja, arXiv:2606.24210 —
//! the N=1 seam) into a positive theorem: (a) no finite deterministic
//! worst-case bound exists (the Brownian sup diverges a.s.; the Hartman-Wintner
//! envelope `√(2 D t ln ln t)` grows without bound), and (b) the IR-allocated
//! HPL is consistent with that a.s. envelope — as IR → 0 the white-FM leg
//! `K(IR/2)·√(D t)` eventually dominates it, so a coupled IR(t) → 0 schedule
//! keeps the HPL at or above the a.s. path envelope. The LIL is asymptotic
//! (limsup) only: it certifies neither the finite-t value nor the 1e-7 quantile
//! (both stay Modelled), and it is component-specific (Hartman-Wintner for the
//! white-FM/BM leg; Chung-type for the integrated-BM τ³/τ⁵ legs).

use crate::integrity::kir::k_running_max;

/// Hartman-Wintner a.s. envelope `√(2 D t ln ln t)` for the white-FM/Brownian
/// phase leg (s). Returns 0 for `t ≤ e` (where `ln ln t ≤ 0`).
pub fn lil_envelope(diffusion: f64, t_s: f64) -> f64 {
    if t_s <= std::f64::consts::E {
        return 0.0;
    }
    let llt = t_s.ln().ln();
    if llt <= 0.0 {
        return 0.0;
    }
    (2.0 * diffusion * t_s * llt).sqrt()
}

/// Whether the white-FM HPL leg `K(IR/2)·√(D t)` reaches the a.s. envelope at
/// `(t, ir)` — the consistency check (true once IR is tight enough).
pub fn hpl_dominates_lil(diffusion: f64, t_s: f64, ir: f64) -> bool {
    let hpl_leg = k_running_max(ir) * (diffusion * t_s).sqrt();
    hpl_leg >= lil_envelope(diffusion, t_s)
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn envelope_diverges_no_finite_worst_case() {
        // Impossibility: the a.s. envelope grows without bound.
        let d = 1e-24;
        let mut prev = 0.0;
        for &t in &[100.0, 1e4, 1e6, 1e8, 1e10] {
            let e = lil_envelope(d, t);
            assert!(e > prev, "LIL envelope must diverge (t={t})");
            prev = e;
        }
    }

    #[test]
    fn envelope_is_zero_below_threshold() {
        assert_eq!(lil_envelope(1e-24, 1.0), 0.0);
        assert_eq!(lil_envelope(1e-24, 2.0), 0.0); // ln ln 2 < 0
        assert!(lil_envelope(1e-24, 100.0) > 0.0);
    }

    #[test]
    fn tightening_ir_makes_hpl_dominate_the_as_envelope() {
        // Consistency: at fixed t, shrinking IR lifts the HPL leg above the LIL.
        let d = 1e-24;
        let t = 1e6;
        assert!(!hpl_dominates_lil(d, t, 1e-1)); // loose IR: HPL below a.s. envelope
        assert!(hpl_dominates_lil(d, t, 1e-9)); // tight IR: HPL dominates
    }
}
