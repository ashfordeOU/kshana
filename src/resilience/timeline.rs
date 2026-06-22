// SPDX-License-Identifier: AGPL-3.0-only
//! Resilience-timeline KPIs over a time-stepped error series: detection,
//! reaction, recovery, loss duration, and the bounded-vs-unbounded degradation
//! verdict. The bounded/unbounded call is the pivotal RPCF Level-2 vs Level-3
//! discriminator that no self-assessment can substantiate, so it is computed
//! from the actual error trajectory, not declared.

use serde::Serialize;

/// Resilience-timeline figures for one denial episode. All times are in the
/// series' own units (seconds); `react_s` adds a configured response lag to the
/// detection time.
#[derive(Clone, Copy, Debug, PartialEq, Serialize)]
pub struct ResilienceTimeline {
    pub detect_s: f64,
    pub react_s: f64,
    pub recover_s: f64,
    pub loss_duration_s: f64,
    pub bounded: bool,
}

fn final_window_start_index(n: usize) -> usize {
    // Final quarter, at least two samples.
    n.saturating_sub((n / 4).max(2).min(n))
}

/// Whether degradation stays bounded: true if the series never breaches the
/// threshold, or recovers to in-spec by its end, or plateaus (no growth across
/// the final window); false if it ends out of spec and still rising. Only
/// samples with `t <= horizon` are considered.
pub fn bounded_verdict(series: &[(f64, f64)], threshold: f64, horizon: f64) -> bool {
    let s: Vec<(f64, f64)> = series
        .iter()
        .copied()
        .filter(|&(t, _)| t <= horizon)
        .collect();
    if s.is_empty() {
        return true;
    }
    let maxabs = s.iter().map(|&(_, e)| e.abs()).fold(0.0_f64, f64::max);
    if maxabs <= threshold {
        return true; // never breached
    }
    let last_abs = s.last().unwrap().1.abs();
    if last_abs <= threshold {
        return true; // recovered to in-spec by the end
    }
    let start = final_window_start_index(s.len());
    let start_abs = s[start].1.abs();
    let rising = last_abs > start_abs * (1.0 + 1e-9);
    // Out of spec at the end and still rising => unbounded.
    !rising
}

/// Compute the resilience timeline. The series is `(t, error)` in time order,
/// starting at denial onset. `threshold` is the in-spec bound, `react_lag` the
/// response delay added to detection, `horizon` the analysis end (used as the
/// recovery sentinel when the system never returns to spec).
pub fn timeline(
    series: &[(f64, f64)],
    threshold: f64,
    react_lag: f64,
    horizon: f64,
) -> ResilienceTimeline {
    let first_breach = series
        .iter()
        .find(|&&(_, e)| e.abs() > threshold)
        .map(|&(t, _)| t);

    let Some(detect_s) = first_breach else {
        return ResilienceTimeline {
            detect_s: 0.0,
            react_s: 0.0,
            recover_s: 0.0,
            loss_duration_s: 0.0,
            bounded: true,
        };
    };

    let recover = series
        .iter()
        .find(|&&(t, e)| t > detect_s && e.abs() <= threshold)
        .map(|&(t, _)| t);
    let bounded = bounded_verdict(series, threshold, horizon);
    let (recover_s, loss_duration_s) = match recover {
        Some(r) => (r, r - detect_s),
        None => (horizon, (horizon - detect_s).max(0.0)),
    };

    ResilienceTimeline {
        detect_s,
        react_s: detect_s + react_lag,
        recover_s,
        loss_duration_s,
        bounded,
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn breach_then_recovery_durations() {
        // In spec until t=10, out of spec [10,40), back in spec from t=40.
        let mut series = Vec::new();
        for t in 0..=100 {
            let t = t as f64;
            let err = if (10.0..40.0).contains(&t) { 5.0 } else { 0.5 };
            series.push((t, err));
        }
        let tl = timeline(&series, 1.0, 2.0, 100.0);
        assert_eq!(tl.detect_s, 10.0);
        assert_eq!(tl.react_s, 12.0);
        assert_eq!(tl.recover_s, 40.0);
        assert_eq!(tl.loss_duration_s, 30.0);
        assert!(tl.bounded);
    }

    #[test]
    fn monotone_growth_is_unbounded() {
        let series: Vec<(f64, f64)> = (0..=100).map(|t| (t as f64, t as f64)).collect();
        let tl = timeline(&series, 1.0, 0.0, 100.0);
        assert_eq!(tl.detect_s, 2.0); // first t with t > 1.0
        assert_eq!(tl.recover_s, 100.0); // never recovers -> horizon sentinel
        assert!(!tl.bounded);
    }

    #[test]
    fn never_breaching_is_trivially_bounded() {
        let series: Vec<(f64, f64)> = (0..=50).map(|t| (t as f64, 0.1)).collect();
        let tl = timeline(&series, 1.0, 3.0, 50.0);
        assert_eq!(tl.detect_s, 0.0);
        assert_eq!(tl.loss_duration_s, 0.0);
        assert!(tl.bounded);
    }

    #[test]
    fn plateau_above_threshold_is_bounded() {
        // Breaches and stays high but flat (degraded steady state, not diverging).
        let series: Vec<(f64, f64)> = (0..=100)
            .map(|t| (t as f64, if t < 10 { 0.2 } else { 8.0 }))
            .collect();
        assert!(bounded_verdict(&series, 1.0, 100.0));
    }
}
