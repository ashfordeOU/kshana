// SPDX-License-Identifier: Apache-2.0
//! Spoofing-detection security figure of merit.
//!
//! A time-spoofing attack feeds the receiver a false GNSS timing signal that
//! slowly drags its clock solution. The classical defence is a *clock-aided
//! integrity monitor*: the receiver predicts time forward from its own clock and
//! cross-checks the GNSS-derived time against that prediction, flagging a fault
//! when the two disagree by more than a few sigma.
//!
//! This is a **single-clock consistency monitor**, NOT a multi-satellite RAIM
//! detector: there are no pseudorange residuals across several satellites, no
//! protection level, and no probability of hazardously misleading information.
//! The innovation-vs-sigma test is mathematically the same shape as the fault
//! detection in Brown, "A baseline GPS RAIM scheme" (and Groves, *Principles of
//! GNSS, Inertial, and Multisensor Integrated Navigation Systems*, integrity
//! chapter), but the score it produces is an analytic *spoof-detectability
//! bound* for a given clock — not an implementation of RAIM. Real multi-SV
//! RAIM/ARAIM with HPL/VPL is a roadmap item; see `docs/INTEGRITY.md`.
//!
//! Over a coherent monitoring window of length `tau`, the comparison uncertainty
//! has two independent contributions:
//!
//! ```text
//!   sigma_mon^2(tau) = r / m  +  q_wf * tau  +  q_rw * tau^3 / 3
//! ```
//!
//! * `r / m` — the GNSS phase-measurement noise (variance `r`) beaten down by
//!   averaging the `m` samples taken within the window.
//! * `q_wf * tau + q_rw * tau^3 / 3` — the clock's own coast uncertainty over the
//!   window, exactly the holdover error growth (white-FM plus random-walk-FM,
//!   NIST SP 1065). A *better* clock makes this term smaller.
//!
//! With enough averaging the measurement term shrinks and the clock stability sets
//! the floor — the regime in which a superior clock detects a smaller, slower
//! spoof. The smallest spoof offset the monitor flags is `k * sigma_mon(tau)` for
//! a detection multiplier `k` (sigmas, chosen for a low false-alarm rate).
//!
//! The security score is this detection floor expressed relative to the
//! operational timing spec: a spoof only matters if it can move the solution by
//! about the spec threshold, so
//!
//! ```text
//!   security = clamp(1 - min_detectable_offset_ns / threshold_ns, 0, 1).
//! ```
//!
//! `1` means a harmful (spec-threshold) spoof sits far above the detection floor
//! and is always caught; `0` means a spoof can reach the operational threshold
//! while staying under the detection floor — undetectable and harmful.
//!
//! All functions are pure and deterministic.

/// Detection multiplier (sigmas) for a low false-alarm-rate spoof monitor (~5σ).
pub const SPOOF_DETECT_K: f64 = 5.0;

/// Coherent spoof-monitoring window (s): the interval over which the GNSS-derived
/// time is cross-checked against the clock's own coasted prediction.
pub const SPOOF_MONITOR_S: f64 = 600.0;

/// 1-sigma floor (s) of the clock-aided spoof monitor over a window `tau` (s),
/// with per-sample phase-measurement variance `r` (s^2) averaged over `samples`
/// observations and the clock's white-FM / random-walk-FM PSDs `q_wf`, `q_rw`:
///
/// `sigma = sqrt(r / samples + q_wf * tau + q_rw * tau^3 / 3)`.
///
/// `samples` is clamped to at least one observation.
pub fn monitor_sigma_s(q_wf: f64, q_rw: f64, r: f64, tau: f64, samples: f64) -> f64 {
    let m = samples.max(1.0);
    let var = r / m + q_wf * tau + q_rw * tau.powi(3) / 3.0;
    var.max(0.0).sqrt()
}

/// Smallest time-spoof offset (ns) the monitor flags over the window: the
/// detection multiplier `k` times the monitor's 1-sigma floor.
pub fn min_detectable_offset_ns(
    q_wf: f64,
    q_rw: f64,
    r: f64,
    tau: f64,
    samples: f64,
    k: f64,
) -> f64 {
    k * monitor_sigma_s(q_wf, q_rw, r, tau, samples) * 1e9
}

/// Spoof-detection security score in `[0, 1]` relative to the timing spec.
///
/// The monitor averages `m = round(tau / dt)` GNSS samples over the window.
/// Returns `1 - min_detectable_offset_ns / threshold_ns`, clamped to `[0, 1]`.
/// Higher is better; a non-positive `threshold_ns` yields `0`.
pub fn spoof_detection_score(
    q_wf: f64,
    q_rw: f64,
    r: f64,
    threshold_ns: f64,
    tau: f64,
    dt: f64,
    k: f64,
) -> f64 {
    if threshold_ns <= 0.0 {
        return 0.0;
    }
    let samples = if dt > 0.0 { (tau / dt).round() } else { 1.0 };
    let floor = min_detectable_offset_ns(q_wf, q_rw, r, tau, samples, k);
    (1.0 - floor / threshold_ns).clamp(0.0, 1.0)
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn monitor_variance_is_hand_derived() {
        // q_wf=1e-24, q_rw=0, r=1e-20, tau=600 s, m=600 samples:
        //   var = 1e-20/600 + 1e-24*600 = 1.6666...e-23 + 6e-22 = 6.1666666667e-22.
        // Check the squared sigma against the exact hand-summed variance.
        let sigma = monitor_sigma_s(1e-24, 0.0, 1e-20, 600.0, 600.0);
        assert!(
            (sigma * sigma - 6.166_666_666_7e-22).abs() < 1e-31,
            "sigma={sigma}"
        );
    }

    #[test]
    fn random_walk_term_adds_to_the_variance() {
        // Adding q_rw=1e-30 over tau=600: q_rw*tau^3/3 = 1e-30*2.16e8/3 = 7.2e-23.
        //   var = 6.1666666667e-22 + 7.2e-23 = 6.8866666667e-22.
        let sigma = monitor_sigma_s(1e-24, 1e-30, 1e-20, 600.0, 600.0);
        assert!(
            (sigma * sigma - 6.886_666_666_7e-22).abs() < 1e-31,
            "sigma={sigma}"
        );
    }

    #[test]
    fn min_detectable_offset_is_k_sigma_in_ns() {
        // sigma = sqrt(6.1666666667e-22) = 2.4832774e-11 s;
        //   k=5 * 2.4832774e-11 s * 1e9 ns/s = 0.12416387 ns.
        let off = min_detectable_offset_ns(1e-24, 0.0, 1e-20, 600.0, 600.0, 5.0);
        assert!((off - 0.124_163_87).abs() < 1e-6, "off={off}");
    }

    #[test]
    fn score_is_hand_derived() {
        // threshold 20 ns, dt 1 s -> m = round(600/1) = 600, floor 0.12416387 ns.
        //   score = 1 - 0.12416387/20 = 0.99379181
        let s = spoof_detection_score(1e-24, 0.0, 1e-20, 20.0, 600.0, 1.0, 5.0);
        assert!((s - 0.993_791_81).abs() < 1e-6, "score={s}");
    }

    #[test]
    fn better_clock_scores_higher() {
        // A quieter clock (smaller q_wf) lowers the detection floor and so scores
        // strictly higher: it catches smaller, slower spoofs.
        let quantum = spoof_detection_score(1e-26, 1e-34, 1e-20, 20.0, 600.0, 1.0, 5.0);
        let classical = spoof_detection_score(1e-24, 1e-32, 1e-20, 20.0, 600.0, 1.0, 5.0);
        assert!(quantum > classical, "q={quantum} c={classical}");
        assert!(quantum <= 1.0 && classical >= 0.0);
    }

    #[test]
    fn floor_above_threshold_clamps_to_zero() {
        // A tiny spec (0.05 ns) below the detection floor (0.124 ns): a spoof can
        // reach the threshold undetected, so security clamps to 0.
        let s = spoof_detection_score(1e-24, 0.0, 1e-20, 0.05, 600.0, 1.0, 5.0);
        assert_eq!(s, 0.0);
    }

    #[test]
    fn nonpositive_threshold_is_zero() {
        assert_eq!(
            spoof_detection_score(1e-24, 0.0, 1e-20, 0.0, 600.0, 1.0, 5.0),
            0.0
        );
    }
}
