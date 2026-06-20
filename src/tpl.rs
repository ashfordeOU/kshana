// SPDX-License-Identifier: AGPL-3.0-only
//! **Timing Protection Level (TPL) under time-synchronization attack.**
//!
//! A *timing* receiver under adversarial GNSS spoofing has no nominal-geometry
//! fault to bound with T-RAIM: the threat is a clock-time pull that the receiver's
//! own time-accuracy flag may not reveal (a spoofer can hold that flag green). The
//! quantity a critical-infrastructure timing user actually needs is a bound on the
//! worst-case *undetected* time error: how far the served time can be dragged
//! before a clock-aided monitor catches the spoof and the oscillator's holdover
//! takes over.
//!
//! This module composes three externally **validated** Kshana primitives into that
//! bound, and exposes the one part that is genuinely new:
//! * the clock-aided monitor's static detectability floor
//!   ([`crate::security::min_detectable_offset_ns`], the largest offset a spoof can
//!   hold below a `k`-sigma alarm),
//! * the oscillator coast uncertainty over the detection latency
//!   ([`crate::holdover::coast_phase_sigma`], van Loan, validated against the
//!   NIST SP-1065 Allan stack via [`crate::clock_state::q_from_allan`]),
//! * and a sequential change detector ([`Cusum`]) whose time-to-alarm at a given
//!   attack severity supplies the latency the coast term is evaluated over.
//!
//! **Honesty load-bearing.** "Certified" is only as strong as the clock's long-tau
//! red-noise floor (`q_rw`, `q_drift`), which for class-default oscillators is a
//! *synthesised* assumption two to four decades below the white-FM ADEV (see
//! [`crate::holdover`]). The bound is therefore reported as a *band* over a swept
//! floor ([`tpl_band`]), not a single scalar, and a defensible figure must use the
//! clock's **measured** `q_rw`/`q_drift`. The TPL is a MODELLED bridge over
//! Validated primitives; it is not itself an external validation.

use crate::holdover::coast_phase_sigma;
use crate::security::min_detectable_offset_ns;
use serde::Serialize;

/// Inputs for a Timing Protection Level. Clock PSDs `(q_wf, q_rw, q_drift)` should
/// be derived from the oscillator's **measured** Allan deviations
/// ([`crate::clock_state::q_from_allan`]); the monitor parameters `r` (per-sample
/// phase-measurement variance, s^2), `tau` (monitor window, s), `samples` (averaged
/// observations) and `k` (alarm multiplier, sigmas) describe the clock-aided spoof
/// monitor; `detection_latency_s` is the measured time-to-alarm at the attack
/// severity of interest.
#[derive(Clone, Copy, Debug, PartialEq, Serialize)]
pub struct TplInputs {
    pub q_wf: f64,
    pub q_rw: f64,
    pub q_drift: f64,
    pub r: f64,
    pub tau: f64,
    pub samples: f64,
    pub k: f64,
    pub detection_latency_s: f64,
}

/// The certified worst-case **undetected time error** (ns): the static monitor
/// detectability floor (the offset a spoof can hold below the `k`-sigma alarm) plus
/// the oscillator's own coast 1-sigma accumulated over the detection latency before
/// the sequential test alarms. Both terms are closed forms over separately
/// validated primitives, so the sum is oracle-checkable.
pub fn timing_protection_level_ns(inp: &TplInputs) -> f64 {
    let floor = min_detectable_offset_ns(inp.q_wf, inp.q_rw, inp.r, inp.tau, inp.samples, inp.k);
    let coast = coast_phase_sigma(inp.q_wf, inp.q_rw, inp.q_drift, inp.detection_latency_s) * 1e9;
    floor + coast
}

/// A TPL reported as a band over a swept long-tau red-noise floor: the random-walk
/// and drift PSDs are scaled by `10^(-/+ decades)` to bracket the synthesised-floor
/// uncertainty. For a stable clock at a long detection latency the band is wide,
/// which is the honest finding: the bound is floor-governed, not a per-unit number.
#[derive(Clone, Copy, Debug, PartialEq, Serialize)]
pub struct TplBand {
    pub low_ns: f64,
    pub nominal_ns: f64,
    pub high_ns: f64,
    pub decades: f64,
}

/// Compute the TPL band by scaling `q_rw` and `q_drift` down and up by `decades`.
pub fn tpl_band(inp: &TplInputs, decades: f64) -> TplBand {
    let scale = 10.0_f64.powf(decades);
    let lo = timing_protection_level_ns(&TplInputs {
        q_rw: inp.q_rw / scale,
        q_drift: inp.q_drift / scale,
        ..*inp
    });
    let hi = timing_protection_level_ns(&TplInputs {
        q_rw: inp.q_rw * scale,
        q_drift: inp.q_drift * scale,
        ..*inp
    });
    TplBand {
        low_ns: lo,
        nominal_ns: timing_protection_level_ns(inp),
        high_ns: hi,
        decades,
    }
}

/// A one-sided CUSUM sequential change detector over standardized monitor
/// residuals `z = (GNSS time - coasted clock prediction) / sigma_monitor`. Under no
/// attack `z ~ N(0, 1)`; a spoof shifts the mean positive. The detector accumulates
/// `S_n = max(0, S_{n-1} + z_n - kref)` and alarms when `S_n > h`. `kref` is the
/// reference value (half the smallest shift to detect, in sigmas); `h` is the
/// decision interval that sets the false-alarm rate.
#[derive(Clone, Copy, Debug)]
pub struct Cusum {
    pub kref: f64,
    pub h: f64,
    s: f64,
    n: usize,
}

impl Cusum {
    pub fn new(kref: f64, h: f64) -> Self {
        Cusum {
            kref,
            h,
            s: 0.0,
            n: 0,
        }
    }

    /// Feed one standardized residual; returns `true` on the sample that alarms.
    pub fn update(&mut self, z: f64) -> bool {
        self.s = (self.s + z - self.kref).max(0.0);
        self.n += 1;
        self.s > self.h
    }

    /// Current accumulator value.
    pub fn statistic(&self) -> f64 {
        self.s
    }

    /// Number of samples consumed.
    pub fn samples(&self) -> usize {
        self.n
    }
}

/// Detection latency (s) of a CUSUM faced with a constant standardized shift `z`
/// per sample at cadence `dt` (s): the time to the alarming sample. For a sustained
/// `z > kref` the accumulator grows by `(z - kref)` each step from zero and the
/// alarm requires `S_n > h` (strict), so it fires at `floor(h / (z - kref)) + 1`
/// samples; if `z <= kref` it never alarms (returns `f64::INFINITY`). This is the
/// closed-form latency the TPL coast term is evaluated over for a worst-case ramp
/// of standardized severity `z`.
pub fn cusum_latency_s(kref: f64, h: f64, z: f64, dt: f64) -> f64 {
    let step = z - kref;
    if step <= 0.0 {
        return f64::INFINITY;
    }
    ((h / step).floor() + 1.0) * dt
}

#[cfg(test)]
mod tests {
    use super::*;
    use crate::clock_state::q_from_allan;

    fn uso_inputs() -> TplInputs {
        // USO-class oscillator: white-FM ADEV 1e-12 at 1 s; measured red-noise floor.
        let (q_wf, q_rw, q_drift) = q_from_allan(1e-12, 1e-14, 1e-16);
        TplInputs {
            q_wf,
            q_rw,
            q_drift,
            r: 1e-20,
            tau: 600.0,
            samples: 600.0,
            k: 5.0,
            detection_latency_s: 60.0,
        }
    }

    #[test]
    fn tpl_equals_hand_derived_sum_of_validated_terms() {
        let inp = uso_inputs();
        let floor =
            min_detectable_offset_ns(inp.q_wf, inp.q_rw, inp.r, inp.tau, inp.samples, inp.k);
        let coast =
            coast_phase_sigma(inp.q_wf, inp.q_rw, inp.q_drift, inp.detection_latency_s) * 1e9;
        assert!((timing_protection_level_ns(&inp) - (floor + coast)).abs() < 1e-12);
        // TPL is at least the static floor (conservative).
        assert!(timing_protection_level_ns(&inp) >= floor);
    }

    #[test]
    fn tpl_grows_with_detection_latency() {
        let mut a = uso_inputs();
        a.detection_latency_s = 10.0;
        let mut b = uso_inputs();
        b.detection_latency_s = 300.0;
        assert!(timing_protection_level_ns(&b) > timing_protection_level_ns(&a));
    }

    #[test]
    fn floor_band_is_material_for_a_stable_clock_at_long_latency() {
        // At long latency the coast term carries the synthesised red-noise floor, so
        // sweeping it a decade must move the bound materially (>20%), proving the
        // certified figure is floor-governed and must be reported as a band.
        let mut inp = uso_inputs();
        inp.detection_latency_s = 1000.0;
        let band = tpl_band(&inp, 1.0);
        assert!(band.high_ns > band.nominal_ns);
        assert!(band.nominal_ns > band.low_ns);
        assert!(
            band.high_ns > 1.2 * band.low_ns,
            "band not material: lo={} hi={}",
            band.low_ns,
            band.high_ns
        );
    }

    #[test]
    fn cusum_alarms_on_a_sustained_shift_at_the_hand_derived_sample() {
        // kref=0.5, h=5, shift z=1.5 -> grows by 1.0/step; S=5.0 at sample 5 does not
        // exceed h (strict >), so the alarm fires at floor(5/1)+1 = 6.
        let mut c = Cusum::new(0.5, 5.0);
        let mut alarm_at = 0;
        for i in 1..=20 {
            if c.update(1.5) {
                alarm_at = i;
                break;
            }
        }
        assert_eq!(alarm_at, 6);
    }

    #[test]
    fn cusum_does_not_alarm_below_reference() {
        let mut c = Cusum::new(0.5, 5.0);
        // z = 0.4 < kref: accumulator stays pinned at zero, never alarms.
        for _ in 0..10_000 {
            assert!(!c.update(0.4));
        }
        assert_eq!(c.statistic(), 0.0);
    }

    #[test]
    fn cusum_latency_closed_form_matches_the_detector() {
        // Closed form for z=1.5, kref=0.5, h=5, dt=1: (floor(5/1)+1)*1 = 6 s.
        assert_eq!(cusum_latency_s(0.5, 5.0, 1.5, 1.0), 6.0);
        // Below reference -> never.
        assert!(cusum_latency_s(0.5, 5.0, 0.4, 1.0).is_infinite());
        // Cross-check the closed form against the running detector for several shifts.
        for &z in &[0.8_f64, 1.0, 2.0, 3.5] {
            let mut c = Cusum::new(0.5, 5.0);
            let mut n = 0;
            for i in 1..=100 {
                if c.update(z) {
                    n = i;
                    break;
                }
            }
            assert_eq!(n as f64, cusum_latency_s(0.5, 5.0, z, 1.0));
        }
    }

    #[test]
    fn real_calibrated_tpl_is_far_below_the_observed_capture() {
        // Calibrated on the public JammerTest 2024 dataset, scenario 2.1.1 (a real
        // over-the-air spoof of a u-blox ZED-F9P): the receiver's white-FM ADEV at
        // 1 s was 2.8e-9, its clean cross-satellite clock consistency ~22 ns, and the
        // attack pulled served time by ~1.01 ms while the receiver reported <= 51 ns.
        // A clock-aided monitor + holdover must bound the worst-case undetected error
        // far below that 1.01 ms capture for any sane detection latency.
        let observed_pull_ns = 1_010_923.0;
        let (q_wf, q_rw, q_drift) = q_from_allan(2.8e-9, 4.4e-10, 1.0e-11);
        let inp = TplInputs {
            q_wf,
            q_rw,
            q_drift,
            r: (22.1e-9_f64).powi(2),
            tau: 1.0,
            samples: 1.0,
            k: 5.0,
            detection_latency_s: 60.0,
        };
        let tpl = timing_protection_level_ns(&inp);
        // Even at a full 60 s coast the certified bound is at least 10x below the
        // silently-served 1.01 ms; at the monitor's actual sub-second reaction it is
        // far tighter still. This is the protection the receiver's flag did not give.
        assert!(
            tpl < observed_pull_ns / 10.0,
            "real-calibrated TPL {tpl} ns not far below observed pull {observed_pull_ns} ns"
        );
        // And the bound is meaningful (positive, above the static consistency floor).
        assert!(tpl > 5.0 * 22.1);
    }
}
