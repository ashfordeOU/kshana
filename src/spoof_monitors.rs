// SPDX-License-Identifier: Apache-2.0
//! RF-layer spoofing monitors: AGC received-power and signal-quality (SQM).
//!
//! [`crate::spoof`] models a *time*-spoofing attack and the clock-aided integrity
//! monitor that catches it. This module adds two independent receiver-front-end
//! monitors that catch the spoof transmitter itself, regardless of how cleanly it
//! mimics the navigation message:
//!
//! - **AGC power monitor** — a spoofer radiates extra RF power, so the total received
//!   power rises above the nominal thermal-noise-plus-signal floor. The automatic-gain-
//!   control loop reflects that rise; an excess beyond a margin (a few dB) is an alert.
//! - **Signal-quality monitor (SQM)** — a clean tracked signal has a symmetric
//!   autocorrelation peak, so the Early and Late correlator taps are balanced. Multipath,
//!   meaconing, or a replay attack distorts the peak and unbalances Early vs Late; an
//!   Early-minus-Late imbalance beyond a tolerance is an alert.
//!
//! Both are exact closed-form metrics. Scope (honest): the full RAIM-consistency parity
//! spoof detector, the multi-layer fusion of the three monitor outputs, and validation
//! against published (e.g. Spirent / ION GNSS+) spoofing test vectors are follow-ons
//! (see `ROADMAP.md`).

/// Combine per-source received powers (dBm) incoherently: `10·log10(Σ 10^(pᵢ/10))`.
/// Returns `−∞` for an empty set (no received signal).
pub fn combine_power_dbm(powers_dbm: &[f64]) -> f64 {
    if powers_dbm.is_empty() {
        return f64::NEG_INFINITY;
    }
    let linear: f64 = powers_dbm.iter().map(|p| 10.0_f64.powf(p / 10.0)).sum();
    10.0 * linear.log10()
}

/// An AGC received-power anomaly monitor.
#[derive(Clone, Copy, Debug)]
pub struct AgcMonitor {
    /// Expected nominal total received power (dBm): thermal noise plus the legitimate
    /// satellite aggregate the receiver sees with no interference.
    pub expected_dbm: f64,
    /// Excess over the expected power (dB) that raises an alert (RTCA/Spirent practice
    /// uses a few dB; `3.0` is a doubling of power).
    pub alert_margin_db: f64,
}

impl AgcMonitor {
    /// A monitor with the conventional 3 dB margin.
    pub fn new(expected_dbm: f64) -> Self {
        Self {
            expected_dbm,
            alert_margin_db: 3.0,
        }
    }

    /// Power excess over the expected floor (dB); negative when below expectation.
    pub fn excess_db(&self, measured_dbm: f64) -> f64 {
        measured_dbm - self.expected_dbm
    }

    /// Raise an alert when the measured power exceeds the expected floor by more than
    /// the margin — the RF signature of an added spoofing transmitter.
    pub fn alert(&self, measured_dbm: f64) -> bool {
        self.excess_db(measured_dbm) > self.alert_margin_db
    }
}

/// Ideal BPSK code autocorrelation: the triangular `R(τ) = 1 − |τ|` for `|τ| ≤ 1`
/// chip, zero beyond (the normalised peak a clean correlator tracks).
pub fn bpsk_autocorr(tau_chips: f64) -> f64 {
    (1.0 - tau_chips.abs()).max(0.0)
}

/// The balanced Early/Late correlator taps of a cleanly tracked signal at a given
/// correlator spacing (chips): both equal `R(spacing)` by symmetry.
pub fn early_late_ideal(spacing_chips: f64) -> (f64, f64) {
    let r = bpsk_autocorr(spacing_chips);
    (r, r)
}

/// A signal-quality (Early-minus-Late) monitor.
#[derive(Clone, Copy, Debug)]
pub struct SqmMonitor {
    /// Fractional Early/Late imbalance that raises an alert (≈ 0.10 = 10 %).
    pub el_tolerance: f64,
}

impl SqmMonitor {
    /// A monitor with the conventional 10 % imbalance tolerance.
    pub fn new() -> Self {
        Self { el_tolerance: 0.10 }
    }

    /// The Early-minus-Late imbalance metric `(E − L)/(E + L)` — zero for a symmetric
    /// (undistorted) correlation peak. Returns `0` if both taps are zero.
    pub fn el_metric(&self, early: f64, late: f64) -> f64 {
        let sum = early + late;
        if sum.abs() < 1e-300 {
            0.0
        } else {
            (early - late) / sum
        }
    }

    /// Raise an alert when the Early/Late imbalance exceeds the tolerance — the
    /// correlation-distortion signature of multipath, meaconing, or a replay attack.
    pub fn alert(&self, early: f64, late: f64) -> bool {
        self.el_metric(early, late).abs() > self.el_tolerance
    }
}

impl Default for SqmMonitor {
    fn default() -> Self {
        Self::new()
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn power_combines_incoherently() {
        // Two equal powers add 3.01 dB (a doubling); N equal add 10·log10(N).
        let two = combine_power_dbm(&[-130.0, -130.0]);
        assert!((two - (-126.9897)).abs() < 1e-3, "two = {two}");
        let eight = combine_power_dbm(&[-130.0; 8]);
        assert!(
            (eight - (-130.0 + 10.0 * 8.0_f64.log10())).abs() < 1e-9,
            "eight = {eight}"
        );
        // No signal at all is −∞.
        assert_eq!(combine_power_dbm(&[]), f64::NEG_INFINITY);
    }

    #[test]
    fn agc_flags_only_a_real_power_excess() {
        // Nominal floor = 8 SVs at −130 dBm ⇒ −130 + 9.03 ≈ −120.97 dBm.
        let nominal: Vec<f64> = vec![-130.0; 8];
        let floor = combine_power_dbm(&nominal);
        let mon = AgcMonitor::new(floor);
        // Exactly nominal: no excess, no alert.
        assert!((mon.excess_db(floor)).abs() < 1e-9);
        assert!(!mon.alert(floor));
        // +2 dB stays under the 3 dB margin; +4 dB trips it.
        assert!(!mon.alert(floor + 2.0));
        assert!(mon.alert(floor + 4.0));
        // A −115 dBm spoofer added to the aggregate raises power well past the margin.
        let mut spoofed = nominal.clone();
        spoofed.push(-115.0);
        let measured = combine_power_dbm(&spoofed);
        assert!(mon.alert(measured), "excess {} dB", mon.excess_db(measured));
    }

    #[test]
    fn bpsk_autocorr_is_the_triangle() {
        assert!((bpsk_autocorr(0.0) - 1.0).abs() < 1e-12);
        assert!((bpsk_autocorr(0.1) - 0.9).abs() < 1e-12);
        assert!((bpsk_autocorr(-0.5) - 0.5).abs() < 1e-12);
        assert_eq!(bpsk_autocorr(1.0), 0.0);
        assert_eq!(bpsk_autocorr(2.0), 0.0);
    }

    #[test]
    fn sqm_flags_only_real_correlation_asymmetry() {
        let mon = SqmMonitor::new();
        // A clean, symmetric peak: Early = Late ⇒ metric 0, no alert.
        let (e, l) = early_late_ideal(0.1);
        assert!((mon.el_metric(e, l)).abs() < 1e-12);
        assert!(!mon.alert(e, l));
        // 0.1/1.8 ≈ 5.6 % imbalance stays under 10 %.
        assert!(!mon.alert(0.95, 0.85));
        // 0.2/1.8 ≈ 11.1 % imbalance trips the alert.
        assert!(mon.alert(1.0, 0.8));
        // Zero taps do not divide by zero.
        assert_eq!(mon.el_metric(0.0, 0.0), 0.0);
    }
}
