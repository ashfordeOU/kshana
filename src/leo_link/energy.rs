// SPDX-License-Identifier: AGPL-3.0-only
//! Low-energy positioning for IoT (Internet of Things) receivers: time to first fix, energy
//! per fix and battery life against duty cycle, for a given receiver power budget.
//!
//! ## The model (MODELLED; every assumption is an input)
//!
//! **Acquisition.** The receiver searches a code-phase × Doppler grid. The coherent
//! integration `T` is the smaller of the receiver's maximum coherent time and the time over
//! which the worst-case Doppler rate `ḟ` smears the signal by half a Doppler bin,
//! `√(1/(2|ḟ|))`. The coherent signal-to-noise ratio is `C/N0·T`; if it is below the detection
//! threshold `SNR_req`, `N` non-coherent sums are added, with the square-law rule that the
//! detection statistic grows as `√N`, so `N = ⌈(SNR_req/(C/N0·T))²⌉`. The dwell per cell is
//! `N·T`, the Doppler bin is `1/(2T)` wide, so the Doppler search spans
//! `⌈4·Δf·T⌉` bins for an uncertainty `±Δf`. A parallel code search (an FFT correlator) tests
//! every code phase of one Doppler bin per dwell; a serial search tests `correlators` cells per
//! dwell out of `2·code_length` half-chip phases.
//!
//! **Time to first fix.** Acquisition, plus (on a cold start) the time to demodulate the
//! navigation message the fix needs, `bits/data_rate`, plus a fixed fix-computation time.
//!
//! **Energy.** Energy per fix is active power × time to first fix; the average power at a fix
//! interval `τ` is `P_sleep + E_fix/τ` (the receiver is never active for longer than `τ`), and
//! battery life is capacity over average power.
//!
//! Nothing here is measured: the powers, thresholds and search architecture are the stated
//! inputs of a design study, and the time-to-first-fix model ignores bit-edge ambiguity,
//! re-acquisition after a failed dwell and the probability of missed detection.

use serde::Serialize;

/// Receiver power budget and search architecture.
#[derive(Clone, Copy, Debug)]
pub struct IotReceiver {
    /// Power while acquiring and tracking (mW).
    pub active_power_mw: f64,
    /// Power while asleep (µW).
    pub sleep_power_uw: f64,
    /// Battery capacity (mWh).
    pub battery_mwh: f64,
    /// Post-integration detection threshold (dB).
    pub detection_snr_db: f64,
    /// Longest coherent integration the receiver supports (s).
    pub max_coherent_s: f64,
    /// FFT-style parallel search over every code phase of one Doppler bin per dwell.
    pub parallel_code_search: bool,
    /// Correlators for a serial search.
    pub correlators: usize,
    /// Fix computation time after the measurements are in (s).
    pub fix_compute_s: f64,
}

/// What the receiver searches for.
#[derive(Clone, Copy, Debug)]
pub struct IotSignal {
    /// Carrier-to-noise density (dB-Hz).
    pub cn0_dbhz: f64,
    /// Primary code length (chips).
    pub code_length_chips: f64,
    /// Doppler uncertainty `±Δf` (Hz).
    pub doppler_uncertainty_hz: f64,
    /// Worst-case Doppler rate magnitude (Hz/s).
    pub doppler_rate_hz_s: f64,
    /// Navigation data rate (bit/s); zero when the signal carries no navigation data.
    pub data_rate_bps: f64,
    /// Navigation-message bits a cold start must demodulate.
    pub cold_start_bits: f64,
}

/// Acquisition and fix timing for one signal and one start mode.
#[derive(Clone, Debug, Serialize)]
pub struct FixBudget {
    /// Coherent integration (s).
    pub coherent_s: f64,
    /// Non-coherent sums.
    pub noncoherent_sums: u64,
    /// Doppler bins searched.
    pub doppler_bins: u64,
    /// Acquisition time (s).
    pub acquisition_s: f64,
    /// Message demodulation time (s); zero on a hot start.
    pub message_s: f64,
    /// Time to first fix (s).
    pub ttff_s: f64,
    /// Energy per fix (mJ).
    pub energy_per_fix_mj: f64,
}

/// One point of the duty-cycle curve.
#[derive(Clone, Debug, Serialize)]
pub struct DutyPoint {
    /// Fix interval (s).
    pub fix_interval_s: f64,
    /// Fraction of time active.
    pub duty_cycle: f64,
    /// Average power (mW).
    pub average_power_mw: f64,
    /// Battery life (days).
    pub battery_life_days: f64,
}

/// Acquisition, time to first fix and energy for `sig` on `rx`; `cold` adds the message time.
pub fn fix_budget(sig: &IotSignal, rx: &IotReceiver, cold: bool) -> FixBudget {
    let rate = sig.doppler_rate_hz_s.abs().max(1e-9);
    let t = rx.max_coherent_s.min((0.5 / rate).sqrt()).max(1e-4);
    let snr_coh = 10f64.powf(sig.cn0_dbhz / 10.0) * t;
    let snr_req = 10f64.powf(rx.detection_snr_db / 10.0);
    let n_nc = if snr_coh >= snr_req {
        1
    } else {
        ((snr_req / snr_coh).powi(2)).ceil().min(1e9) as u64
    };
    let dwell = n_nc as f64 * t;
    let bins = (4.0 * sig.doppler_uncertainty_hz * t).ceil().max(1.0) as u64;
    let code_cells = 2.0 * sig.code_length_chips.max(1.0);
    let acq = if rx.parallel_code_search {
        bins as f64 * dwell
    } else {
        bins as f64 * (code_cells / rx.correlators.max(1) as f64).ceil() * dwell
    };
    let msg = if cold && sig.data_rate_bps > 0.0 {
        sig.cold_start_bits / sig.data_rate_bps
    } else {
        0.0
    };
    let ttff = acq + msg + rx.fix_compute_s;
    FixBudget {
        coherent_s: t,
        noncoherent_sums: n_nc,
        doppler_bins: bins,
        acquisition_s: acq,
        message_s: msg,
        ttff_s: ttff,
        energy_per_fix_mj: rx.active_power_mw * ttff,
    }
}

/// Average power and battery life at each fix interval.
pub fn duty_curve(fix: &FixBudget, rx: &IotReceiver, intervals_s: &[f64]) -> Vec<DutyPoint> {
    intervals_s
        .iter()
        .map(|&tau| {
            let tau = tau.max(1e-3);
            let duty = (fix.ttff_s / tau).min(1.0);
            let p = rx.sleep_power_uw * 1e-3 * (1.0 - duty) + rx.active_power_mw * duty;
            DutyPoint {
                fix_interval_s: tau,
                duty_cycle: duty,
                average_power_mw: p,
                battery_life_days: rx.battery_mwh / p / 24.0,
            }
        })
        .collect()
}

#[cfg(test)]
mod tests {
    use super::*;

    fn rx() -> IotReceiver {
        IotReceiver {
            active_power_mw: 20.0,
            sleep_power_uw: 5.0,
            battery_mwh: 2000.0,
            detection_snr_db: 16.0,
            max_coherent_s: 0.02,
            parallel_code_search: true,
            correlators: 64,
            fix_compute_s: 0.1,
        }
    }

    #[test]
    fn stronger_signals_and_smaller_doppler_windows_fix_faster() {
        let base = IotSignal {
            cn0_dbhz: 30.0,
            code_length_chips: 1023.0,
            doppler_uncertainty_hz: 40_000.0,
            doppler_rate_hz_s: 500.0,
            data_rate_bps: 500.0,
            cold_start_bits: 1000.0,
        };
        let a = fix_budget(&base, &rx(), false);
        let b = fix_budget(
            &IotSignal {
                cn0_dbhz: 55.0,
                ..base
            },
            &rx(),
            false,
        );
        let c = fix_budget(
            &IotSignal {
                doppler_uncertainty_hz: 500.0,
                ..base
            },
            &rx(),
            false,
        );
        assert!(b.ttff_s < a.ttff_s && c.ttff_s < a.ttff_s);
        let cold = fix_budget(&base, &rx(), true);
        assert!((cold.ttff_s - a.ttff_s - 2.0).abs() < 1e-9);
        assert!((a.energy_per_fix_mj - 20.0 * a.ttff_s).abs() < 1e-9);
    }

    #[test]
    fn the_doppler_rate_caps_the_coherent_time() {
        let s = IotSignal {
            cn0_dbhz: 45.0,
            code_length_chips: 1023.0,
            doppler_uncertainty_hz: 1000.0,
            doppler_rate_hz_s: 2000.0,
            data_rate_bps: 0.0,
            cold_start_bits: 0.0,
        };
        let f = fix_budget(&s, &rx(), true);
        assert!((f.coherent_s - (0.5f64 / 2000.0).sqrt()).abs() < 1e-12);
        assert_eq!(f.message_s, 0.0);
    }

    #[test]
    fn battery_life_grows_with_the_fix_interval_toward_the_sleep_floor() {
        let f = FixBudget {
            coherent_s: 0.02,
            noncoherent_sums: 1,
            doppler_bins: 10,
            acquisition_s: 1.0,
            message_s: 0.0,
            ttff_s: 1.0,
            energy_per_fix_mj: 20.0,
        };
        let c = duty_curve(&f, &rx(), &[0.5, 10.0, 3600.0]);
        assert_eq!(c[0].duty_cycle, 1.0);
        assert!(c[1].battery_life_days < c[2].battery_life_days);
        let floor = 2000.0 / 5e-3 / 24.0;
        assert!(c[2].battery_life_days < floor);
    }
}
