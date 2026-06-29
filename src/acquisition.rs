// SPDX-License-Identifier: AGPL-3.0-only
//! GNSS signal acquisition: square-law (non-coherent) detector statistics and the
//! generalized Marcum Q-function.
//!
//! A receiver acquires a satellite by searching a code-phase × Doppler grid. In each
//! cell it forms the envelope-squared `|I + jQ|²` of the coherent correlator output and
//! sums `M` such accumulations non-coherently. Normalised by the per-sample noise
//! variance, the decision statistic is
//!
//! * **H₀ (noise only):** a central chi-square with `2M` degrees of freedom;
//! * **H₁ (signal present):** a non-central chi-square with `2M` degrees of freedom and
//!   non-centrality `λ = 2 M · ρ`, where `ρ` is the per-cell post-correlation SNR
//!   (linear; `ρ = (C/N₀)·T_coh` for coherent integration time `T_coh`).
//!
//! From these two distributions the operating point follows directly:
//!
//! ```text
//!   P_fa(γ)        = 1 − F_{χ²(2M)}(γ)
//!   γ(P_fa)        = F⁻¹_{χ²(2M)}(1 − P_fa)
//!   P_d(γ, ρ)      = 1 − F_{χ'²(2M, 2Mρ)}(γ) = Q_M( √(2Mρ), √γ )
//! ```
//!
//! where `Q_M(a, b)` is the **generalized Marcum Q-function**, `Q_M(a,b) = P(X > b)` for
//! the envelope `X` of a non-central chi distribution with `2M` degrees of freedom and
//! non-centrality `a²`, i.e. `Q_M(a, b) = 1 − F_{χ'²(2M, a²)}(b²)`. All three reuse the
//! engine's validated chi-square machinery ([`crate::raim::chi2_cdf`],
//! [`crate::raim::noncentral_chi2_cdf`], [`crate::detection::chi2_inv_cdf`]).
//!
//! Scope (honest): this is the standard square-law / non-coherent-integration detector on
//! a per-cell basis — no search-space cell-averaging (CFAR), no squaring/combining-loss
//! tables beyond what the chi-square non-centrality already captures, and no
//! code/Doppler-bin straddling loss. It is a MODELLED capability whose reference tests
//! check closed-form detector identities (the Marcum-Q ↔ non-central-chi-square relation,
//! `P_fa`/threshold inversion, ROC monotonicity, and the non-coherent integration gain),
//! not an external dataset.
//!
//! References:
//! - J. I. Marcum, "A Statistical Theory of Target Detection by Pulsed Radar," RAND
//!   RM-754 (1947); IRE Trans. IT-6 (1960).
//! - E. D. Kaplan & C. J. Hegarty (eds.), *Understanding GPS/GNSS*, 3rd ed., §8
//!   (acquisition, square-law detection, non-coherent integration).
//! - S. Kay, *Fundamentals of Statistical Signal Processing: Detection Theory*, §2 (ROC).

use crate::raim::{chi2_cdf, noncentral_chi2_cdf};

/// Generalized Marcum Q-function `Q_M(a, b)`: the probability that the envelope of a
/// non-central chi distribution with `2M` degrees of freedom and non-centrality `a²`
/// exceeds `b`. Evaluated through the non-central chi-square CDF,
/// `Q_M(a, b) = 1 − F_{χ'²(2M, a²)}(b²)`. `m` is the (positive) order; `a, b ≥ 0`.
pub fn marcum_q(m: f64, a: f64, b: f64) -> f64 {
    1.0 - noncentral_chi2_cdf(b * b, 2.0 * m, a * a)
}

/// False-alarm probability of a square-law detector with `n_nc` non-coherent
/// integrations at normalised threshold `gamma`: `P_fa = 1 − F_{χ²(2·n_nc)}(γ)`.
pub fn pfa_square_law(gamma: f64, n_nc: f64) -> f64 {
    (1.0 - chi2_cdf(gamma, 2.0 * n_nc)).clamp(0.0, 1.0)
}

/// Normalised detection threshold achieving a target `pfa` for `n_nc` non-coherent
/// integrations: `γ = F⁻¹_{χ²(2·n_nc)}(1 − P_fa)`. Inverts [`chi2_cdf`] by bisection so
/// the threshold is the exact inverse of [`pfa_square_law`] (both use the same CDF),
/// making the `P_fa`↔threshold round-trip tight regardless of the CDF's internals.
pub fn threshold_for_pfa(pfa: f64, n_nc: f64) -> f64 {
    let dof = 2.0 * n_nc;
    let target = (1.0 - pfa).clamp(0.0, 1.0); // desired chi²(dof) CDF value
                                              // Bracket: grow the upper bound until the CDF exceeds the target.
    let mut hi = dof.max(1.0);
    let mut guard = 0;
    while chi2_cdf(hi, dof) < target && guard < 200 {
        hi *= 2.0;
        guard += 1;
    }
    let mut lo = 0.0;
    for _ in 0..100 {
        let mid = 0.5 * (lo + hi);
        if chi2_cdf(mid, dof) < target {
            lo = mid;
        } else {
            hi = mid;
        }
    }
    0.5 * (lo + hi)
}

/// Detection probability of a square-law detector at normalised threshold `gamma`,
/// `n_nc` non-coherent integrations, and per-cell post-correlation SNR `snr` (linear):
/// `P_d = 1 − F_{χ'²(2·n_nc, 2·n_nc·snr)}(γ) = Q_{n_nc}( √(2·n_nc·snr), √γ )`.
pub fn pd_square_law(gamma: f64, n_nc: f64, snr: f64) -> f64 {
    let lambda = 2.0 * n_nc * snr.max(0.0);
    (1.0 - noncentral_chi2_cdf(gamma, 2.0 * n_nc, lambda)).clamp(0.0, 1.0)
}

/// Convenience: detection probability at a target false-alarm rate (the threshold is
/// derived internally), for `n_nc` non-coherent integrations and per-cell SNR `snr`.
pub fn pd_at_pfa(pfa: f64, n_nc: f64, snr: f64) -> f64 {
    pd_square_law(threshold_for_pfa(pfa, n_nc), n_nc, snr)
}

#[cfg(test)]
mod tests {
    use super::*;

    fn approx(a: f64, b: f64, tol: f64) -> bool {
        (a - b).abs() <= tol
    }

    #[test]
    fn marcum_q_central_case_is_exponential() {
        // M = 1, a = 0 ⇒ Q_1(0, b) = exp(−b²/2).
        for &b in &[0.5_f64, 1.0, 2.0, 3.0] {
            let got = marcum_q(1.0, 0.0, b);
            let want = (-b * b / 2.0).exp();
            assert!(approx(got, want, 1e-9), "Q_1(0,{b}) = {got} vs {want}");
        }
    }

    #[test]
    fn pd_equals_marcum_q_identity() {
        // P_d(γ, M, ρ) == Q_M(√(2Mρ), √γ).
        let (m, snr, gamma) = (4.0_f64, 0.8_f64, 12.0_f64);
        let pd = pd_square_law(gamma, m, snr);
        let q = marcum_q(m, (2.0 * m * snr).sqrt(), gamma.sqrt());
        assert!(approx(pd, q, 1e-9), "Pd {pd} vs Q_M {q}");
    }

    #[test]
    fn threshold_round_trips_with_pfa() {
        for &pfa in &[1e-1_f64, 1e-3, 1e-5] {
            for &m in &[1.0_f64, 5.0, 20.0] {
                let gamma = threshold_for_pfa(pfa, m);
                let back = pfa_square_law(gamma, m);
                assert!(
                    (back - pfa).abs() / pfa < 1e-3,
                    "Pfa round-trip {back} vs {pfa} (M={m})"
                );
            }
        }
    }

    #[test]
    fn roc_is_monotone_and_well_ordered() {
        let m = 3.0;
        let gamma = threshold_for_pfa(1e-3, m);
        // Pd increases with SNR.
        let pd_lo = pd_square_law(gamma, m, 0.5);
        let pd_hi = pd_square_law(gamma, m, 2.0);
        assert!(
            pd_hi > pd_lo,
            "Pd not increasing in SNR: {pd_lo} -> {pd_hi}"
        );
        // Pd ≥ Pfa for snr > 0, and → Pfa as snr → 0.
        let pfa = pfa_square_law(gamma, m);
        assert!(pd_lo > pfa, "Pd {pd_lo} below Pfa {pfa}");
        assert!(approx(pd_square_law(gamma, m, 0.0), pfa, 1e-9));
        // Pfa decreases with threshold.
        assert!(pfa_square_law(gamma + 5.0, m) < pfa);
    }

    #[test]
    fn non_coherent_integration_gain() {
        // At a fixed false-alarm rate and fixed per-cell SNR, summing more non-coherent
        // looks of the same-SNR signal raises Pd (integration gain).
        let (pfa, snr) = (1e-3_f64, 0.5_f64);
        let pd_1 = pd_at_pfa(pfa, 1.0, snr);
        let pd_10 = pd_at_pfa(pfa, 10.0, snr);
        assert!(
            pd_10 > pd_1,
            "no integration gain: Pd(1)={pd_1} Pd(10)={pd_10}"
        );
    }

    #[test]
    fn marcum_q_monotonicity() {
        let (m, b) = (2.0_f64, 2.5_f64);
        // Increasing the signal a raises Q.
        assert!(marcum_q(m, 3.0, b) > marcum_q(m, 1.0, b));
        // Increasing the threshold b lowers Q.
        assert!(marcum_q(m, 2.0, 3.5) < marcum_q(m, 2.0, 1.5));
        // Bounded in [0, 1].
        let q = marcum_q(m, 2.0, b);
        assert!((0.0..=1.0).contains(&q), "Q out of range: {q}");
    }
}
