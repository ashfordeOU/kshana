// SPDX-License-Identifier: AGPL-3.0-only
//! **Optical ↔ RF measurement handoff** — the receiver state-and-covariance transfer when
//! the active PNT measurement type switches between a **tight** optical modality (small
//! measurement noise `R`) and a **loose** RF modality (large `R`).
//!
//! The engineering hazard a handoff must avoid is a *jump* in the delivered navigation state
//! at the instant the sensor changes. This module makes that impossible by construction: the
//! handoff carries the estimator's **mean unchanged** (bit-for-bit) and only re-scales the
//! covariance. The three composed pieces are the ones the rest of the fusion stack already
//! uses:
//!
//! * **Joseph-form measurement update** — the numerically-stable covariance update
//!   `P⁺ = (1−K)²P + K²R` (the scalar, per-axis form of the matrix Joseph update in
//!   [`crate::kalman`] and [`crate::fusion::coupled`]). A tighter `R` (optical) deflates the
//!   covariance more than a looser `R` (RF).
//! * **Closed-loop error-state reset** — at the handoff the estimated error state is folded
//!   into the nominal and reset to zero, exactly as the closed-loop INS/GNSS filter in
//!   [`crate::fusion::closed_loop`] resets after each correction. Because the correction is
//!   already in the mean, the reset moves nothing: the delivered state is continuous.
//! * **NEES consistency gate** — the normalised estimation-error-squared
//!   `ε = (x̂ − x)ᵀ P⁻¹ (x̂ − x)` is χ²-distributed with as many degrees of freedom as
//!   states, so a *consistent* filter keeps `ε` inside the two-sided χ² gate
//!   `[χ²_{0.025}(dof), χ²_{0.975}(dof)]` ([`crate::raim::chi2_quantile`]). A handoff that
//!   inflated or deflated the covariance inconsistently would push `ε` out of that gate.
//!
//! ## Validated vs Modelled
//!
//! - **Validated (closed-form invariant).** The **mean-continuity** (no-jump) guarantee is
//!   exact: [`HandoffState::handoff`] copies the mean bit-for-bit, so the delivered state is
//!   provably unchanged across the switch. The NEES gate bounds are the exact χ² quantiles.
//! - **Modelled.** The specific optical / RF measurement-noise magnitudes and the
//!   modality-transition covariance-inflation factor are representative inputs.

use crate::raim::chi2_quantile;
use serde::Serialize;

/// Lower / upper tail probabilities of the two-sided NEES consistency gate (95% central).
const NEES_GATE_LO_P: f64 = 0.025;
const NEES_GATE_HI_P: f64 = 0.975;

/// A receiver estimate with a **diagonal** covariance: the mean `x` and the per-axis
/// variances `p_diag`. Per-axis scalar updates keep the covariance diagonal, which is all
/// the handoff / mean-continuity argument needs (and keeps the NEES an exact sum of
/// per-axis normalised squares).
#[derive(Clone, Debug, PartialEq)]
pub struct HandoffState {
    /// State mean (e.g. `[east, north, up, clock]`).
    pub x: Vec<f64>,
    /// Per-axis variance (the covariance diagonal), same length as `x`.
    pub p_diag: Vec<f64>,
}

impl HandoffState {
    /// A new state from a mean and its per-axis variances.
    pub fn new(x: Vec<f64>, p_diag: Vec<f64>) -> Self {
        HandoffState { x, p_diag }
    }

    /// Scalar **Joseph-form** measurement update of axis `i` by a direct observation `z`
    /// with noise variance `r`: innovation `ν = z − x_i`, gain `K = P_ii/(P_ii + r)`,
    /// `x_i ← x_i + Kν`, and `P_ii ← (1−K)²·P_ii + K²·r`. The Joseph form keeps the posterior
    /// variance positive for any `K`. A tighter `r` produces a smaller posterior variance.
    pub fn joseph_update_axis(&mut self, i: usize, z: f64, r: f64) {
        if i >= self.x.len() {
            return;
        }
        let p = self.p_diag[i];
        let s = p + r;
        if s <= 0.0 {
            return;
        }
        let k = p / s;
        self.x[i] += k * (z - self.x[i]);
        self.p_diag[i] = (1.0 - k).powi(2) * p + k * k * r;
    }

    /// Apply a batch of per-axis Joseph updates `(axis, z, r)` in order.
    pub fn apply_updates(&mut self, updates: &[(usize, f64, f64)]) {
        for &(i, z, r) in updates {
            self.joseph_update_axis(i, z, r);
        }
    }

    /// **Hand the state off** to the other modality, inflating the covariance by
    /// `1 + inflation_factor` to account for the modality-transition uncertainty. The
    /// **mean is copied bit-for-bit** — this is the no-jump guarantee: the delivered state
    /// is provably unchanged across the switch, only its uncertainty grows. `inflation_factor
    /// = 0` reproduces the state exactly (mean AND covariance).
    pub fn handoff(&self, inflation_factor: f64) -> HandoffState {
        let scale = 1.0 + inflation_factor.max(0.0);
        HandoffState {
            x: self.x.clone(), // bit-for-bit mean continuity
            p_diag: self.p_diag.iter().map(|&p| p * scale).collect(),
        }
    }

    /// The **normalised estimation error squared (NEES)** against a `truth` state:
    /// `ε = Σ_i (x_i − truth_i)² / P_ii`, distributed χ²_dof when the filter is consistent.
    /// Missing/zero variances are skipped.
    pub fn nees(&self, truth: &[f64]) -> f64 {
        self.x
            .iter()
            .zip(self.p_diag.iter())
            .zip(truth.iter())
            .filter(|((_, &p), _)| p > 0.0)
            .map(|((&xi, &p), &ti)| {
                let e = xi - ti;
                e * e / p
            })
            .sum()
    }

    /// The covariance trace (total variance) — the scalar the covariance
    /// deflation/inflation is read off.
    pub fn total_variance(&self) -> f64 {
        self.p_diag.iter().sum()
    }
}

/// The two-sided **NEES consistency gate** `[χ²_{0.025}(dof), χ²_{0.975}(dof)]` — the 95%
/// central χ² interval a consistent filter's NEES should fall in. Exact χ² quantiles from
/// [`crate::raim::chi2_quantile`].
pub fn nees_gate(dof: usize) -> (f64, f64) {
    let d = dof.max(1) as f64;
    (
        chi2_quantile(NEES_GATE_LO_P, d),
        chi2_quantile(NEES_GATE_HI_P, d),
    )
}

/// Whether a NEES value sits inside the two-sided χ² consistency gate for `dof` states.
pub fn nees_in_gate(nees: f64, dof: usize) -> bool {
    let (lo, hi) = nees_gate(dof);
    (lo..=hi).contains(&nees)
}

/// The outcome of an optical→RF handoff demonstration: the pre/post-switch means (proving
/// bit-continuity), the covariance deflation/inflation, and the NEES consistency check.
#[derive(Clone, Debug, Serialize)]
pub struct HandoffOutcome {
    /// State mean immediately before the handoff (after the optical update).
    pub mean_before: Vec<f64>,
    /// State mean immediately after the handoff (before any RF update).
    pub mean_after: Vec<f64>,
    /// `true` when the mean is bit-for-bit unchanged across the switch (the no-jump proof).
    pub mean_continuous: bool,
    /// The largest per-axis mean change across the switch (0.0 when continuous).
    pub max_mean_jump: f64,
    /// Total variance after the tight optical update (deflated).
    pub variance_after_optical: f64,
    /// Total variance after the handoff covariance inflation.
    pub variance_after_handoff: f64,
    /// Total variance after the loose RF update.
    pub variance_after_rf: f64,
    /// NEES of the final (post-RF) estimate against truth.
    pub final_nees: f64,
    /// The NEES consistency gate `[χ²_{0.025}, χ²_{0.975}]` for `dof` states.
    pub nees_gate: (f64, f64),
    /// `true` when the final NEES lies in the consistency gate.
    pub nees_in_gate: bool,
    /// Degrees of freedom (number of states).
    pub dof: usize,
}

/// Run a full **optical → RF handoff** sequence and check both invariants.
///
/// Starting from `initial` and a `truth`, the tight optical measurements (`optical_updates`,
/// each `(axis, z, r)` with small `r`) are applied, the state is handed off with covariance
/// inflation `inflation_factor`, and then the loose RF measurements (`rf_updates`, large `r`)
/// are applied. The report proves the mean is continuous across the switch and reports
/// whether the NEES stays inside its χ² gate.
pub fn optical_rf_handoff(
    initial: HandoffState,
    truth: &[f64],
    optical_updates: &[(usize, f64, f64)],
    rf_updates: &[(usize, f64, f64)],
    inflation_factor: f64,
) -> HandoffOutcome {
    let dof = initial.x.len();
    let mut state = initial;
    state.apply_updates(optical_updates);
    let variance_after_optical = state.total_variance();
    let mean_before = state.x.clone();

    // Closed-loop-style handoff: mean carried bit-for-bit, covariance inflated.
    let mut handed = state.handoff(inflation_factor);
    let mean_after = handed.x.clone();
    let max_mean_jump = mean_before
        .iter()
        .zip(mean_after.iter())
        .map(|(a, b)| (a - b).abs())
        .fold(0.0_f64, f64::max);
    let mean_continuous = mean_before == mean_after;
    let variance_after_handoff = handed.total_variance();

    handed.apply_updates(rf_updates);
    let variance_after_rf = handed.total_variance();

    let final_nees = handed.nees(truth);
    let gate = nees_gate(dof);
    HandoffOutcome {
        mean_before,
        mean_after,
        mean_continuous,
        max_mean_jump,
        variance_after_optical,
        variance_after_handoff,
        variance_after_rf,
        final_nees,
        nees_gate: gate,
        nees_in_gate: (gate.0..=gate.1).contains(&final_nees),
        dof,
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    /// The handoff carries the mean bit-for-bit (the PROVEN no-jump guarantee) while
    /// inflating the covariance; a zero inflation reproduces the state exactly. Oracle: the
    /// closed-form mean-continuity invariant (exact float equality).
    #[test]
    fn handoff_is_bit_continuous_in_the_mean() {
        let s = HandoffState::new(vec![1.25, -3.5, 7.0, 1e-9], vec![4.0, 4.0, 9.0, 1e-18]);
        let h = s.handoff(0.5);
        // Mean bit-for-bit identical (no jump).
        assert_eq!(s.x, h.x, "handoff must not move the mean");
        // Covariance inflated by exactly (1 + 0.5) on every axis.
        for (a, b) in s.p_diag.iter().zip(h.p_diag.iter()) {
            assert!((b - 1.5 * a).abs() < 1e-18 * a.max(1.0), "{b} vs 1.5·{a}");
        }
        // Zero inflation reproduces the state exactly (mean AND covariance).
        let same = s.handoff(0.0);
        assert_eq!(s.x, same.x);
        assert_eq!(s.p_diag, same.p_diag);
    }

    /// The scalar Joseph update matches the hand-computed posterior, and a tight `R`
    /// deflates the variance more than a loose `R`. Oracle: the closed-form Joseph update.
    #[test]
    fn joseph_update_deflates_and_matches_hand_value() {
        // P = 4, r = 1 → K = 4/5 = 0.8; P⁺ = (0.2)²·4 + (0.8)²·1 = 0.16 + 0.64 = 0.8.
        let mut s = HandoffState::new(vec![0.0], vec![4.0]);
        s.joseph_update_axis(0, 10.0, 1.0);
        assert!(
            (s.p_diag[0] - 0.8).abs() < 1e-12,
            "P⁺ {} vs 0.8",
            s.p_diag[0]
        );
        // x⁺ = 0 + 0.8·(10 − 0) = 8.
        assert!((s.x[0] - 8.0).abs() < 1e-12, "x⁺ {} vs 8", s.x[0]);

        // Tight R deflates more than loose R from the same prior.
        let mut tight = HandoffState::new(vec![0.0], vec![4.0]);
        let mut loose = HandoffState::new(vec![0.0], vec![4.0]);
        tight.joseph_update_axis(0, 0.0, 0.01);
        loose.joseph_update_axis(0, 0.0, 100.0);
        assert!(
            tight.p_diag[0] < loose.p_diag[0],
            "tight R should deflate more: {} vs {}",
            tight.p_diag[0],
            loose.p_diag[0]
        );
        assert!(tight.p_diag[0] > 0.0, "Joseph posterior stays positive");
    }

    /// The NEES gate bounds are the exact χ² quantiles, and a 1σ-per-axis error gives
    /// NEES = dof, which lies inside the gate. Oracle: `raim::chi2_quantile`.
    #[test]
    fn nees_gate_matches_chi2_quantiles_and_admits_one_sigma() {
        for dof in [1usize, 2, 4, 6] {
            let (lo, hi) = nees_gate(dof);
            assert!((lo - chi2_quantile(0.025, dof as f64)).abs() < 1e-12);
            assert!((hi - chi2_quantile(0.975, dof as f64)).abs() < 1e-12);
            assert!(
                lo < dof as f64 && (dof as f64) < hi,
                "dof {dof} inside gate"
            );

            // A state whose error is exactly 1σ on every axis has NEES = dof (in gate).
            let x: Vec<f64> = (0..dof).map(|i| (i as f64) + 1.0).collect();
            let p: Vec<f64> = (0..dof).map(|i| ((i as f64) + 2.0).powi(2)).collect();
            let truth: Vec<f64> = x
                .iter()
                .zip(p.iter())
                .map(|(&xi, &pi)| xi - pi.sqrt())
                .collect();
            let s = HandoffState::new(x, p);
            let nees = s.nees(&truth);
            assert!((nees - dof as f64).abs() < 1e-9, "NEES {nees} vs dof {dof}");
            assert!(nees_in_gate(nees, dof), "1σ NEES must be in gate");
        }
    }

    /// The full optical→RF handoff proves mean-continuity end-to-end, deflates on the tight
    /// optical update, inflates at the handoff, and keeps a statistically-consistent estimate
    /// in the NEES gate. Deterministic.
    #[test]
    fn full_handoff_is_continuous_consistent_and_deterministic() {
        // Truth at origin; start 1σ off on every axis (a consistent initial error).
        let truth = vec![0.0_f64, 0.0, 0.0, 0.0];
        let p0: Vec<f64> = vec![9.0, 9.0, 16.0, 1e-16];
        let x0: Vec<f64> = p0.iter().map(|&p| p.sqrt()).collect(); // 1σ initial error
        let init = HandoffState::new(x0, p0.clone());
        // Optical (tight) then RF (loose) measurements, each carrying a 1σ measurement
        // offset from truth (a consistent draw) so the posterior sits ~1σ from truth and the
        // NEES concentrates near the degrees of freedom.
        let opt_r: Vec<f64> = p0.iter().map(|&p| p * 1e-4).collect();
        let rf_r: Vec<f64> = p0.iter().map(|&p| p * 4.0).collect();
        let optical: Vec<(usize, f64, f64)> = (0..4)
            .map(|i| (i, truth[i] + opt_r[i].sqrt(), opt_r[i]))
            .collect();
        let rf: Vec<(usize, f64, f64)> = (0..4)
            .map(|i| (i, truth[i] + rf_r[i].sqrt(), rf_r[i]))
            .collect();

        let a = optical_rf_handoff(init.clone(), &truth, &optical, &rf, 0.2);
        let b = optical_rf_handoff(init, &truth, &optical, &rf, 0.2);
        // Deterministic.
        assert_eq!(a.mean_before, b.mean_before);
        assert_eq!(a.final_nees, b.final_nees);
        // No-jump: the mean is bit-continuous across the switch.
        assert!(
            a.mean_continuous,
            "mean must be continuous across the handoff"
        );
        assert_eq!(a.max_mean_jump, 0.0);
        // Covariance: deflated by the tight optical, then inflated at the handoff.
        assert!(
            a.variance_after_handoff > a.variance_after_optical,
            "handoff inflates"
        );
        assert!(
            a.variance_after_optical < init_variance(&p0),
            "optical deflates"
        );
        // The estimate stays inside its NEES consistency gate.
        assert!(
            a.nees_in_gate,
            "final NEES {} not in gate {:?}",
            a.final_nees, a.nees_gate
        );
    }

    fn init_variance(p0: &[f64]) -> f64 {
        p0.iter().sum()
    }
}
