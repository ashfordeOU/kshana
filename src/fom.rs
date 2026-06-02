// SPDX-License-Identifier: Apache-2.0
use crate::scenario::GnssState;
use crate::types::Seconds;
use serde::Serialize;

/// Worst-case (shortest) holdover across all contiguous outage segments.
///
/// `series` is the full ordered run as `(t, is_outage, breached)` tuples. The
/// timeline is split into maximal runs of outage samples (a nominal sample, or
/// the end of the run, closes a segment, since GNSS re-acquisition re-aligns the
/// estimator). Per segment, holdover is the time from the segment start to its
/// first spec breach, or the segment's own span if it never breaches. The
/// reported value is the minimum across segments — the shortest coast the system
/// is guaranteed, which is the conservative figure of merit. Returns 0 when there
/// are no outage samples. A single contiguous outage reduces to the previous
/// "first breach since outage start" behaviour.
pub(crate) fn worst_case_holdover(series: &[(Seconds, bool, bool)]) -> Seconds {
    let mut worst: Option<Seconds> = None;
    let mut seg_start: Option<Seconds> = None;
    let mut seg_breach: Option<Seconds> = None;
    let mut seg_last = 0.0;
    let close =
        |start: Seconds, breach: Option<Seconds>, last: Seconds, worst: &mut Option<Seconds>| {
            let h = breach.map_or(last - start, |b| b - start);
            *worst = Some(worst.map_or(h, |w: Seconds| w.min(h)));
        };
    for &(t, outage, breached) in series {
        if outage {
            if seg_start.is_none() {
                seg_start = Some(t);
                seg_breach = None;
            }
            seg_last = t;
            if breached && seg_breach.is_none() {
                seg_breach = Some(t);
            }
        } else if let Some(start) = seg_start.take() {
            close(start, seg_breach, seg_last, &mut worst);
            seg_breach = None;
        }
    }
    if let Some(start) = seg_start {
        close(start, seg_breach, seg_last, &mut worst);
    }
    worst.unwrap_or(0.0)
}

/// One scored sample: timing error in nanoseconds and the GNSS state at that time.
#[derive(Clone, Debug, Serialize)]
pub struct Sample {
    pub t: Seconds,
    pub error_ns: f64,
    pub gnss: GnssState,
}

/// The operational PNT figures of merit for a clock/orbit run. Integrity is
/// populated by the run layer from the Kalman protection bound (the fraction of
/// outage samples whose error stays inside the k-sigma bound); Security is the
/// analytic clock-stability spoof-detectability bound (see [`crate::security`]).
/// Field units are annotated below; see `docs/SCHEMA.md` for the full schema.
#[derive(Clone, Debug, Serialize)]
pub struct FoMScores {
    /// Timing (clock-phase) error RMS over the outage. Unit: nanoseconds. A timing
    /// metric, not a position-domain metric.
    pub timing_rms_ns: f64,
    /// 95th-percentile timing error over the outage. Unit: nanoseconds.
    pub timing_p95_ns: f64,
    /// Worst-case (shortest) in-spec coast across outage segments. Unit: seconds.
    /// Grid-bounded — a lower bound at the time-step resolution.
    pub holdover_s: f64,
    /// Least-squares growth rate of |error| during the outage. Unit: ns per second.
    pub resilience_slope_ns_per_s: f64,
    /// Fraction of the whole run with an in-spec solution. Unit: fraction in [0, 1].
    pub availability: f64,
    /// Filter self-consistency: fraction of outage samples whose error stays inside
    /// the Kalman k-sigma bound. Unit: fraction in [0, 1]. NOT an aviation
    /// HPL/VPL/RAIM integrity figure (see `docs/INTEGRITY.md`).
    pub integrity: Option<f64>,
    /// Analytic spoof-detectability bound from clock stability. Unit: fraction in
    /// [0, 1]. Meaningful only with a configured attack; NOT a multi-satellite RAIM
    /// detector (see `docs/INTEGRITY.md`).
    pub security: Option<f64>,
}

/// Score a series against a timing spec threshold (ns).
///
/// Timing RMS/p95 and resilience are measured over the holdover (outage) period
/// — the metric of interest — while `availability` is over the whole run.
/// `holdover_s` is bounded by the time-grid resolution; treat it as a lower bound.
pub fn score(samples: &[Sample], threshold_ns: f64) -> FoMScores {
    let n = samples.len().max(1) as f64;

    // Availability over the whole run: fraction of time with an in-spec solution.
    let within = samples
        .iter()
        .filter(|s| s.error_ns.abs() <= threshold_ns)
        .count();
    let availability = within as f64 / n;

    // The holdover (outage) subset drives the timing/resilience metrics.
    let outage: Vec<&Sample> = samples
        .iter()
        .filter(|s| s.gnss != GnssState::Nominal)
        .collect();

    if outage.is_empty() {
        return FoMScores {
            timing_rms_ns: 0.0,
            timing_p95_ns: 0.0,
            holdover_s: 0.0,
            resilience_slope_ns_per_s: 0.0,
            availability,
            integrity: None,
            security: None,
        };
    }

    let m = outage.len() as f64;

    let sumsq: f64 = outage.iter().map(|s| s.error_ns * s.error_ns).sum();
    let timing_rms_ns = (sumsq / m).sqrt();

    let mut abs: Vec<f64> = outage.iter().map(|s| s.error_ns.abs()).collect();
    abs.sort_by(|a, b| a.total_cmp(b));
    let idx = (((abs.len().saturating_sub(1)) as f64) * 0.95).round() as usize;
    let timing_p95_ns = abs.get(idx).copied().unwrap_or(0.0);

    // Holdover: worst-case (shortest) coast across outage segments, grid-bounded.
    let segs: Vec<(Seconds, bool, bool)> = samples
        .iter()
        .map(|s| {
            (
                s.t,
                s.gnss != GnssState::Nominal,
                s.error_ns.abs() > threshold_ns,
            )
        })
        .collect();
    let holdover_s = worst_case_holdover(&segs);

    // Resilience: least-squares slope of |error| vs time over the outage.
    let mean_t = outage.iter().map(|s| s.t).sum::<f64>() / m;
    let mean_y = outage.iter().map(|s| s.error_ns.abs()).sum::<f64>() / m;
    let mut num = 0.0;
    let mut den = 0.0;
    for s in &outage {
        num += (s.t - mean_t) * (s.error_ns.abs() - mean_y);
        den += (s.t - mean_t) * (s.t - mean_t);
    }
    let resilience_slope_ns_per_s = if den > 0.0 { num / den } else { 0.0 };

    FoMScores {
        timing_rms_ns,
        timing_p95_ns,
        holdover_s,
        resilience_slope_ns_per_s,
        availability,
        integrity: None,
        security: None,
    }
}

#[cfg(test)]
mod tests {
    use super::*;
    use crate::scenario::GnssState::Denied;

    fn s(t: f64, e: f64) -> Sample {
        Sample {
            t,
            error_ns: e,
            gnss: Denied,
        }
    }

    #[test]
    fn hand_derived_scores() {
        let samples = vec![s(0.0, 0.0), s(1.0, 100.0), s(2.0, 200.0)];
        let f = score(&samples, 150.0);
        assert!((f.timing_rms_ns - 129.0994).abs() < 1e-3);
        assert_eq!(f.timing_p95_ns, 200.0);
        assert!((f.availability - 2.0 / 3.0).abs() < 1e-9);
        assert_eq!(f.holdover_s, 2.0);
        assert!((f.resilience_slope_ns_per_s - 100.0).abs() < 1e-9);
        assert!(f.integrity.is_none() && f.security.is_none());
    }

    #[test]
    fn multi_window_holdover_is_worst_segment() {
        // Two outage segments split by a nominal re-acquisition at t=3.
        //   segment A (t=0..2): breaches at t=2 (200>150) -> holdover 2.
        //   segment B (t=4..5): breaches at t=5 (200>150) -> holdover 1.
        // Worst-case (shortest guaranteed coast) = min(2, 1) = 1.
        let nominal = |t: f64, e: f64| Sample {
            t,
            error_ns: e,
            gnss: GnssState::Nominal,
        };
        let samples = vec![
            s(0.0, 0.0),
            s(1.0, 0.0),
            s(2.0, 200.0),
            nominal(3.0, 0.0),
            s(4.0, 0.0),
            s(5.0, 200.0),
        ];
        let f = score(&samples, 150.0);
        assert_eq!(f.holdover_s, 1.0);
    }

    #[test]
    fn unbreached_segment_reports_its_span() {
        // A segment that never breaches contributes its full span; a later segment
        // that breaches early is shorter, so the worst-case is the early breach.
        let nominal = |t: f64| Sample {
            t,
            error_ns: 0.0,
            gnss: GnssState::Nominal,
        };
        let samples = vec![
            s(0.0, 0.0), // segment A: never breaches over t=0..3 -> span 3
            s(1.0, 10.0),
            s(2.0, 20.0),
            s(3.0, 30.0),
            nominal(4.0),
            s(5.0, 0.0), // segment B: breaches at t=6 -> holdover 1
            s(6.0, 500.0),
        ];
        let f = score(&samples, 150.0);
        assert_eq!(f.holdover_s, 1.0);
    }

    #[test]
    fn worst_case_holdover_no_outage_is_zero() {
        assert_eq!(
            worst_case_holdover(&[(0.0, false, false), (1.0, false, false)]),
            0.0
        );
    }
}
