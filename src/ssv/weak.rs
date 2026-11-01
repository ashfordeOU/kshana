// SPDX-License-Identifier: AGPL-3.0-only
//! A weak-signal GNSS receiver model for the Space Service Volume: the lowest C/N0 at which it can acquire a signal and the
//! lowest at which it can keep tracking it, as functions of integration, aiding and the false-alarm and detection targets.
//!
//! The space-service-volume signals arrive at 10 to 25 dB-Hz, 10 to 25 dB below what a terrestrial receiver is built for. A
//! receiver closes that gap three ways, and the model has a parameter for each:
//!
//! * **longer integration**: coherent time `t_coh_s` (a data channel limits it to `data_bit_ms` unless the data bits are
//!   wiped by aiding or the signal has a pilot channel) and `n_noncoherent` non-coherent sums;
//! * **aiding**: a clock or an orbit/INS-aided Doppler narrows the Doppler search to `doppler_uncertainty_hz` (fewer cells,
//!   so a lower per-cell false-alarm probability at the same total) and a time-aided code window shrinks the code search to
//!   `code_window_chips`; the same aiding lets the carrier loop run at a narrow `pll_bn_hz`;
//! * **loop design**: the carrier (PLL) and code (DLL) loop bandwidths and integration times set the tracking thresholds.
//!
//! Acquisition: the detector is the square-law non-coherent detector of [`crate::acquisition`]: for `n_noncoherent`
//! accumulations of the coherent output the statistic is a central chi-square with `2N` degrees of freedom without a signal
//! and a non-central one with it; the threshold fixes the per-cell false-alarm probability `P_fa / cells` and the required
//! C/N0 is the one giving the target `P_d` at that threshold, after a `scalloping_loss_db` for the Doppler bin straddle.
//! Tracking: [`crate::tracking_loop`]'s 3-sigma-plus-stress thresholds for the carrier and code loops.
//!
//! MODELLED: closed-form detector and loop statistics, no implementation loss beyond the stated scalloping, no cycle
//! slips below the threshold, no oscillator phase noise, no data-bit-sync cost, no multipath. The thresholds are the receiver's
//! design inputs' consequences, not a measurement of any receiver.

use crate::acquisition::{pd_square_law, threshold_for_pfa};
use crate::portable_math::PortableFloat;
use crate::tracking_loop::{carrier_tracking_threshold_cn0_dbhz, code_tracking_threshold_cn0_dbhz};

/// The receiver's design inputs.
#[derive(Clone, Copy, Debug, PartialEq, serde::Serialize, serde::Deserialize)]
#[serde(deny_unknown_fields, default)]
pub struct WeakSignalReceiver {
    /// Coherent integration time, s.
    pub t_coh_s: f64,
    /// Non-coherent accumulations.
    pub n_noncoherent: f64,
    /// Total false-alarm probability of the whole search.
    pub pfa_total: f64,
    /// Target detection probability.
    pub pd: f64,
    /// Doppler uncertainty (half-width of the search), Hz: large unaided, small with an orbit- or INS-aided Doppler.
    pub doppler_uncertainty_hz: f64,
    /// Code search window, chips (the full period is 1,023 for the C/A code; a time-aided receiver searches less).
    pub code_window_chips: f64,
    /// Code bins per chip.
    pub bins_per_chip: f64,
    /// The signal has a data-free pilot channel, or the data bits are known (aided): no bit-transition limit on `t_coh_s`.
    pub pilot_or_data_wipe: bool,
    /// Data bit length, ms (20 for the GPS L1 C/A message): the coherent time without a pilot or data wipe is limited to it.
    pub data_bit_ms: f64,
    /// Loss to the Doppler-bin straddle, dB.
    pub scalloping_loss_db: f64,
    /// Carrier-loop noise bandwidth, Hz.
    pub pll_bn_hz: f64,
    /// Carrier-loop integration time, s.
    pub pll_t_s: f64,
    /// Carrier-loop phase allowance for `3 sigma + stress`, degrees.
    pub pll_allowance_deg: f64,
    /// Doppler rate the carrier loop must follow, Hz/s (a HEO perigee pass is some tens).
    pub doppler_rate_hz_per_s: f64,
    /// Code-loop noise bandwidth, Hz.
    pub dll_bn_hz: f64,
    /// Code-loop integration time, s.
    pub dll_t_s: f64,
    /// Early-late spacing, chips.
    pub dll_spacing_chips: f64,
    /// Code-loop allowance for `3 sigma + lag`, chips.
    pub dll_allowance_chips: f64,
    /// Code slew the loop follows, chips/s (carrier-aided: close to zero).
    pub code_slew_chips_per_s: f64,
    /// Parallel correlator bins evaluated at once (sets the dwell and search time reported).
    pub parallel_cells: f64,
}

impl Default for WeakSignalReceiver {
    /// A conventional unaided space receiver: 10 ms coherent, 10 non-coherent sums, a wide Doppler search.
    fn default() -> Self {
        Self {
            t_coh_s: 0.010,
            n_noncoherent: 10.0,
            pfa_total: 1.0e-3,
            pd: 0.9,
            doppler_uncertainty_hz: 10_000.0,
            code_window_chips: 1023.0,
            bins_per_chip: 2.0,
            pilot_or_data_wipe: false,
            data_bit_ms: 20.0,
            scalloping_loss_db: 0.9,
            pll_bn_hz: 10.0,
            pll_t_s: 0.010,
            pll_allowance_deg: 45.0,
            doppler_rate_hz_per_s: 5.0,
            dll_bn_hz: 1.0,
            dll_t_s: 0.010,
            dll_spacing_chips: 0.5,
            dll_allowance_chips: 0.25,
            code_slew_chips_per_s: 0.0,
            parallel_cells: 2046.0,
        }
    }
}

/// The thresholds and the search effort the design implies.
#[derive(Clone, Copy, Debug, PartialEq, serde::Serialize)]
pub struct Thresholds {
    /// Effective coherent time after the data-bit limit, s.
    pub effective_t_coh_s: f64,
    /// Search cells (Doppler bins times code bins).
    pub cells: f64,
    /// Per-cell false-alarm probability.
    pub pfa_per_cell: f64,
    /// Normalised detection threshold of the square-law detector.
    pub detection_threshold: f64,
    /// Lowest C/N0 for acquisition at `pd`, dB-Hz.
    pub acquisition_dbhz: f64,
    /// Lowest C/N0 the carrier loop holds, dB-Hz (`None`: it cannot hold the Doppler rate at any strength).
    pub carrier_tracking_dbhz: Option<f64>,
    /// Lowest C/N0 the code loop holds, dB-Hz.
    pub code_tracking_dbhz: Option<f64>,
    /// The threshold to apply to a signal already being tracked: the higher of the carrier and code thresholds.
    pub tracking_dbhz: Option<f64>,
    /// Time to sweep all cells once at `n_noncoherent` dwells, s, with `parallel_cells` evaluated at a time.
    pub search_time_s: f64,
}

impl WeakSignalReceiver {
    /// Check the design inputs.
    pub fn validate(&self) -> Result<(), String> {
        let pos = |n: &str, v: f64| {
            if v.is_finite() && v > 0.0 {
                Ok(())
            } else {
                Err(crate::terr!(
                    "e-ssv-weak-receiver-must-be-positive-number",
                    n = n,
                    v = v
                ))
            }
        };
        pos("t_coh_s", self.t_coh_s)?;
        pos("n_noncoherent", self.n_noncoherent)?;
        pos("doppler_uncertainty_hz", self.doppler_uncertainty_hz)?;
        pos("code_window_chips", self.code_window_chips)?;
        pos("bins_per_chip", self.bins_per_chip)?;
        pos("pll_bn_hz", self.pll_bn_hz)?;
        pos("pll_t_s", self.pll_t_s)?;
        pos("dll_bn_hz", self.dll_bn_hz)?;
        pos("dll_t_s", self.dll_t_s)?;
        pos("parallel_cells", self.parallel_cells)?;
        if !(self.pfa_total > 0.0 && self.pfa_total < 1.0 && self.pd > 0.0 && self.pd < 1.0) {
            return Err(crate::terr!("e-ssv-weak-receiver-pfa-total-and-receiver"));
        }
        Ok(())
    }

    /// Compute the thresholds.
    pub fn thresholds(&self) -> Result<Thresholds, String> {
        self.validate()?;
        let t_eff = if self.pilot_or_data_wipe {
            self.t_coh_s
        } else {
            self.t_coh_s.min(self.data_bit_ms * 1e-3 / 2.0).max(1e-4)
        };
        // Frequency bins at 2/(3 T) spacing, the usual compromise with the scalloping loss.
        let f_bins = (2.0 * self.doppler_uncertainty_hz / (2.0 / (3.0 * t_eff)))
            .ceil()
            .max(1.0);
        let code_bins = (self.code_window_chips * self.bins_per_chip)
            .ceil()
            .max(1.0);
        let cells = f_bins * code_bins;
        let pfa_cell = (self.pfa_total / cells).max(1e-300);
        let gamma = threshold_for_pfa(pfa_cell, self.n_noncoherent);
        // Required per-cell SNR rho: bisection on pd(gamma, N, rho) = target.
        let (mut lo, mut hi) = (0.0f64, 1.0e4f64);
        for _ in 0..200 {
            let mid = 0.5 * (lo + hi);
            if pd_square_law(gamma, self.n_noncoherent, mid) < self.pd {
                lo = mid;
            } else {
                hi = mid;
            }
        }
        let rho = 0.5 * (lo + hi);
        let acq = 10.0 * (rho / t_eff).plog10() + self.scalloping_loss_db;
        let carrier = carrier_tracking_threshold_cn0_dbhz(
            self.pll_bn_hz,
            self.pll_t_s,
            self.pll_allowance_deg,
            self.doppler_rate_hz_per_s,
        );
        let code = code_tracking_threshold_cn0_dbhz(
            self.dll_bn_hz,
            self.dll_t_s,
            self.dll_spacing_chips,
            self.dll_allowance_chips,
            self.code_slew_chips_per_s,
        );
        let tracking = match (carrier, code) {
            (Some(a), Some(b)) => Some(a.max(b)),
            _ => None,
        };
        let search_time = (cells / self.parallel_cells).ceil() * t_eff * self.n_noncoherent;
        Ok(Thresholds {
            effective_t_coh_s: t_eff,
            cells,
            pfa_per_cell: pfa_cell,
            detection_threshold: gamma,
            acquisition_dbhz: acq,
            carrier_tracking_dbhz: carrier,
            code_tracking_dbhz: code,
            tracking_dbhz: tracking,
            search_time_s: search_time,
        })
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn longer_integration_lowers_the_acquisition_threshold() {
        let a = WeakSignalReceiver::default().thresholds().unwrap();
        let b = WeakSignalReceiver {
            n_noncoherent: 100.0,
            ..WeakSignalReceiver::default()
        }
        .thresholds()
        .unwrap();
        assert!(
            b.acquisition_dbhz < a.acquisition_dbhz - 3.0,
            "{} {}",
            a.acquisition_dbhz,
            b.acquisition_dbhz
        );
        // A pilot channel allows a long coherent time: lower still.
        let c = WeakSignalReceiver {
            t_coh_s: 0.1,
            n_noncoherent: 100.0,
            pilot_or_data_wipe: true,
            ..WeakSignalReceiver::default()
        }
        .thresholds()
        .unwrap();
        assert!(c.acquisition_dbhz < b.acquisition_dbhz - 3.0);
        // Without a pilot or a data wipe the coherent time is held to half a data bit.
        let d = WeakSignalReceiver {
            t_coh_s: 0.1,
            ..WeakSignalReceiver::default()
        }
        .thresholds()
        .unwrap();
        assert!((d.effective_t_coh_s - 0.010).abs() < 1e-12);
    }

    #[test]
    fn aiding_narrows_the_search_and_the_loop() {
        let unaided = WeakSignalReceiver::default().thresholds().unwrap();
        let aided = WeakSignalReceiver {
            doppler_uncertainty_hz: 100.0,
            code_window_chips: 20.0,
            pll_bn_hz: 1.0,
            // The aiding removes the dynamics: only a residual Doppler rate is left for the narrow loop.
            doppler_rate_hz_per_s: 0.05,
            ..WeakSignalReceiver::default()
        }
        .thresholds()
        .unwrap();
        assert!(aided.cells < unaided.cells / 100.0);
        assert!(aided.acquisition_dbhz < unaided.acquisition_dbhz);
        assert!(
            aided.carrier_tracking_dbhz.unwrap() < unaided.carrier_tracking_dbhz.unwrap() - 5.0
        );
        assert!(aided.search_time_s < unaided.search_time_s);
    }

    #[test]
    fn a_conventional_receiver_is_far_above_the_ssv_signal_levels() {
        let t = WeakSignalReceiver::default().thresholds().unwrap();
        assert!(
            t.acquisition_dbhz > 25.0 && t.acquisition_dbhz < 40.0,
            "{}",
            t.acquisition_dbhz
        );
        assert!(t.tracking_dbhz.unwrap() > 20.0);
    }

    #[test]
    fn invalid_inputs_are_refused() {
        assert!(WeakSignalReceiver {
            pd: 1.5,
            ..WeakSignalReceiver::default()
        }
        .thresholds()
        .is_err());
        assert!(WeakSignalReceiver {
            t_coh_s: 0.0,
            ..WeakSignalReceiver::default()
        }
        .thresholds()
        .is_err());
    }
}
