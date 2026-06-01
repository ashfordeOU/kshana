use crate::scenario::GnssState;
use crate::types::Seconds;

/// Disciplined to truth while GNSS is nominal; open-loop during outage,
/// predicting phase with the calibrated frequency offset. Reports timing
/// error = true_phase - predicted_phase (seconds).
pub struct HoldoverEstimator {
    y_est: f64,
    last_sync_t: Seconds,
    last_sync_phase: Seconds,
    synced: bool,
}

impl HoldoverEstimator {
    pub fn new() -> Self {
        Self { y_est: 0.0, last_sync_t: 0.0, last_sync_phase: 0.0, synced: false }
    }

    pub fn timing_error(
        &mut self,
        t: Seconds,
        true_phase: Seconds,
        true_freq_offset: f64,
        gnss: GnssState,
    ) -> Seconds {
        match gnss {
            GnssState::Nominal => {
                self.y_est = true_freq_offset;
                self.last_sync_t = t;
                self.last_sync_phase = true_phase;
                self.synced = true;
                0.0
            }
            _ => {
                if !self.synced { return 0.0; }
                let predicted = self.last_sync_phase + self.y_est * (t - self.last_sync_t);
                true_phase - predicted
            }
        }
    }
}

impl Default for HoldoverEstimator {
    fn default() -> Self { Self::new() }
}

#[cfg(test)]
mod tests {
    use super::*;
    use crate::scenario::GnssState::*;

    #[test]
    fn synced_then_perfect_prediction_is_zero_error() {
        let mut e = HoldoverEstimator::new();
        assert_eq!(e.timing_error(0.0, 0.0, 1e-9, Nominal), 0.0);
        let true_phase = 1e-9 * 10.0;
        assert!((e.timing_error(10.0, true_phase, 1e-9, Denied)).abs() < 1e-18);
    }

    #[test]
    fn residual_drift_during_outage_is_reported() {
        let mut e = HoldoverEstimator::new();
        e.timing_error(0.0, 0.0, 0.0, Nominal);
        assert!((e.timing_error(5.0, 2e-7, 0.0, Denied) - 2e-7).abs() < 1e-18);
    }

    #[test]
    fn never_synced_returns_zero() {
        let mut e = HoldoverEstimator::new();
        assert_eq!(e.timing_error(3.0, 1.0, 0.0, Denied), 0.0);
    }
}
