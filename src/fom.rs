use serde::Serialize;
use crate::scenario::GnssState;
use crate::types::Seconds;

/// One scored sample: timing error in nanoseconds and the GNSS state at that time.
#[derive(Clone, Debug, Serialize)]
pub struct Sample {
    pub t: Seconds,
    pub error_ns: f64,
    pub gnss: GnssState,
}

/// ESA's six figures of merit (Integrity/Security not modeled in v0.1).
#[derive(Clone, Debug, Serialize)]
pub struct FoMScores {
    pub timing_rms_ns: f64,
    pub timing_p95_ns: f64,
    pub holdover_s: f64,
    pub resilience_slope_ns_per_s: f64,
    pub availability: f64,
    pub integrity: Option<f64>,
    pub security: Option<f64>,
}

/// Score a series against a timing spec threshold (ns).
pub fn score(samples: &[Sample], threshold_ns: f64) -> FoMScores {
    let n = samples.len().max(1) as f64;

    let sumsq: f64 = samples.iter().map(|s| s.error_ns * s.error_ns).sum();
    let timing_rms_ns = (sumsq / n).sqrt();

    let mut abs: Vec<f64> = samples.iter().map(|s| s.error_ns.abs()).collect();
    abs.sort_by(|a, b| a.partial_cmp(b).unwrap());
    let idx = (((abs.len().saturating_sub(1)) as f64) * 0.95).round() as usize;
    let timing_p95_ns = abs.get(idx).copied().unwrap_or(0.0);

    let within = samples.iter().filter(|s| s.error_ns.abs() <= threshold_ns).count();
    let availability = within as f64 / n;

    let outage: Vec<&Sample> =
        samples.iter().filter(|s| s.gnss != GnssState::Nominal).collect();

    let (holdover_s, resilience_slope_ns_per_s) = if outage.is_empty() {
        (0.0, 0.0)
    } else {
        let t0 = outage.first().unwrap().t;
        let holdover = match outage.iter().find(|s| s.error_ns.abs() > threshold_ns) {
            Some(s) => s.t - t0,
            None => outage.last().unwrap().t - t0,
        };
        let m = outage.len() as f64;
        let mean_t = outage.iter().map(|s| s.t).sum::<f64>() / m;
        let mean_y = outage.iter().map(|s| s.error_ns.abs()).sum::<f64>() / m;
        let mut num = 0.0;
        let mut den = 0.0;
        for s in &outage {
            num += (s.t - mean_t) * (s.error_ns.abs() - mean_y);
            den += (s.t - mean_t) * (s.t - mean_t);
        }
        (holdover, if den > 0.0 { num / den } else { 0.0 })
    };

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

    fn s(t: f64, e: f64) -> Sample { Sample { t, error_ns: e, gnss: Denied } }

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
}
