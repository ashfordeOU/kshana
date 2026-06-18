// SPDX-License-Identifier: AGPL-3.0-only
use crate::scenario::GnssState;
use crate::types::Seconds;

/// Disciplined to truth while GNSS is nominal; open-loop during outage,
/// predicting phase with calibrated frequency AND aging (quadratic):
///   predicted = sync_phase + f_s*dt + 0.5*drift*dt^2
/// Deterministic offset+aging are removed, so the reported residual is the
/// stochastic (white-FM + random-walk-FM) holdover error — the fundamental limit.
pub struct HoldoverEstimator {
    f_s: f64,
    drift_est: f64,
    last_sync_t: Seconds,
    last_sync_phase: Seconds,
    synced: bool,
}

impl HoldoverEstimator {
    pub fn new() -> Self {
        Self {
            f_s: 0.0,
            drift_est: 0.0,
            last_sync_t: 0.0,
            last_sync_phase: 0.0,
            synced: false,
        }
    }

    pub fn timing_error(
        &mut self,
        t: Seconds,
        true_phase: Seconds,
        det_freq: f64,
        drift: f64,
        gnss: GnssState,
    ) -> Seconds {
        match gnss {
            GnssState::Nominal => {
                // While GNSS is available we calibrate the deterministic frequency
                // and drift and anchor to the observed phase, then coast on those
                // during the outage; the reported holdover error is the *stochastic*
                // clock wander (white/random-walk/flicker FM) that the deterministic
                // predictor cannot remove. NOTE: this assumes the deterministic
                // calibration is exact at hand-off. A real receiver estimates the
                // frequency from a finite, noisy observation window, so a small
                // residual frequency error would grow linearly through the coast;
                // modelling that finite-window calibration error is a roadmap
                // refinement (it would make holdover additionally sensitive to the
                // pre-outage GNSS measurement noise, not only to clock stability).
                self.f_s = det_freq;
                self.drift_est = drift;
                self.last_sync_t = t;
                self.last_sync_phase = true_phase;
                self.synced = true;
                0.0
            }
            _ => {
                if !self.synced {
                    return 0.0;
                }
                let dt = t - self.last_sync_t;
                let predicted =
                    self.last_sync_phase + self.f_s * dt + 0.5 * self.drift_est * dt * dt;
                true_phase - predicted
            }
        }
    }
}

impl Default for HoldoverEstimator {
    fn default() -> Self {
        Self::new()
    }
}

#[cfg(test)]
mod tests {
    use super::*;
    use crate::scenario::GnssState::*;

    #[test]
    fn synced_then_perfect_prediction_is_zero_error() {
        let mut e = HoldoverEstimator::new();
        assert_eq!(e.timing_error(0.0, 0.0, 1e-9, 0.0, Nominal), 0.0);
        let true_phase = 1e-9 * 10.0;
        assert!((e.timing_error(10.0, true_phase, 1e-9, 0.0, Denied)).abs() < 1e-18);
    }

    #[test]
    fn quadratic_aging_is_removed() {
        // sync t=0: phase 0, f_s=1e-9, drift=2e-13.
        // true deterministic phase at t=10: 1e-9*10 + 2e-13*10*10/2.
        let mut e = HoldoverEstimator::new();
        e.timing_error(0.0, 0.0, 1e-9, 2e-13, Nominal);
        let true_phase = 1e-9 * 10.0 + 2e-13 * 10.0 * 10.0 / 2.0;
        let err = e.timing_error(10.0, true_phase, 1.002e-9, 2e-13, Denied);
        assert!(err.abs() < 1e-22, "err={err}");
    }

    #[test]
    fn residual_drift_during_outage_is_reported() {
        let mut e = HoldoverEstimator::new();
        e.timing_error(0.0, 0.0, 0.0, 0.0, Nominal);
        assert!((e.timing_error(5.0, 2e-7, 0.0, 0.0, Denied) - 2e-7).abs() < 1e-18);
    }

    #[test]
    fn never_synced_returns_zero() {
        let mut e = HoldoverEstimator::new();
        assert_eq!(e.timing_error(3.0, 1.0, 0.0, 0.0, Denied), 0.0);
    }
}
