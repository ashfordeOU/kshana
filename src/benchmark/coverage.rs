//! Integrity-coverage scoring over a scenario's epochs.
//!
//! Aggregates [`crate::benchmark::stanford`] epoch classifications into
//! per-scenario counts and the overbound-coverage verdict
//! `coverage_ok ⟺ empirical HMI-rate ≤ stated integrity risk`. Reported
//! alongside are the misleading-information rate (softer overbound signal) and
//! availability (continuity signal). The benchmark asserts nothing about the
//! *accuracy* of any monitor — it only counts.

use crate::benchmark::stanford::{classify, IntegrityClass};

/// One scored epoch: the true error `|t̂ − UTC|` and the monitor's declared PL.
#[derive(Debug, Clone, Copy)]
pub struct Sample {
    pub true_error: f64,
    pub pl: f64,
}

/// Aggregate integrity outcome over a scenario's epochs.
#[derive(Debug, Clone)]
pub struct ScenarioScore {
    pub n: usize,
    pub n_nominal: usize,
    pub n_unavailable: usize,
    pub n_mi: usize,
    pub n_hmi: usize,
    pub hmi_rate: f64,
    pub mi_rate: f64,
    pub availability: f64,
    /// `empirical HMI-rate ≤ stated_ir`. Vacuously true for empty input.
    pub coverage_ok: bool,
}

/// Score `samples` against an application alert limit `al` and a `stated_ir`.
pub fn score(samples: &[Sample], al: f64, stated_ir: f64) -> ScenarioScore {
    let n = samples.len();
    let mut n_nominal = 0usize;
    let mut n_unavailable = 0usize;
    let mut n_mi = 0usize;
    let mut n_hmi = 0usize;
    for s in samples {
        match classify(s.true_error, s.pl, al) {
            IntegrityClass::Nominal => n_nominal += 1,
            IntegrityClass::Unavailable => n_unavailable += 1,
            IntegrityClass::MisleadingInformation => n_mi += 1,
            IntegrityClass::HazardousMi => n_hmi += 1,
        }
    }
    let (hmi_rate, mi_rate, availability) = if n == 0 {
        (0.0, 0.0, 0.0)
    } else {
        let nf = n as f64;
        (n_hmi as f64 / nf, n_mi as f64 / nf, n_nominal as f64 / nf)
    };
    ScenarioScore {
        n,
        n_nominal,
        n_unavailable,
        n_mi,
        n_hmi,
        hmi_rate,
        mi_rate,
        availability,
        coverage_ok: hmi_rate <= stated_ir,
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    fn samples(pairs: &[(f64, f64)]) -> Vec<Sample> {
        pairs
            .iter()
            .map(|&(true_error, pl)| Sample { true_error, pl })
            .collect()
    }

    #[test]
    fn clean_monitor_covers() {
        // Every error is within a PL that is within AL=10 → all Nominal.
        let s = score(&samples(&[(1.0, 5.0), (2.0, 5.0), (3.0, 5.0)]), 10.0, 1e-3);
        assert_eq!(s.n, 3);
        assert_eq!(s.n_nominal, 3);
        assert_eq!(s.n_hmi, 0);
        assert!(s.coverage_ok);
        assert!((s.availability - 1.0).abs() < 1e-12);
    }

    #[test]
    fn under_bounded_monitor_fails_coverage() {
        // One epoch: e=20 > pl=5 and > al=10 → HMI. hmi_rate 0.5 > stated_ir.
        let s = score(&samples(&[(1.0, 5.0), (20.0, 5.0)]), 10.0, 1e-3);
        assert_eq!(s.n_hmi, 1);
        assert!((s.hmi_rate - 0.5).abs() < 1e-12);
        assert!(!s.coverage_ok);
    }

    #[test]
    fn declaring_unavailable_is_safe() {
        // pl > al everywhere → all Unavailable: no integrity failure, zero availability.
        let s = score(&samples(&[(50.0, 20.0), (60.0, 20.0)]), 10.0, 1e-3);
        assert_eq!(s.n_unavailable, 2);
        assert_eq!(s.n_hmi, 0);
        assert!(s.coverage_ok);
        assert!((s.availability).abs() < 1e-12);
    }

    #[test]
    fn empty_input_is_vacuously_safe() {
        let s = score(&[], 10.0, 1e-3);
        assert_eq!(s.n, 0);
        assert_eq!(s.n_hmi, 0);
        assert!(s.coverage_ok);
        assert!((s.hmi_rate).abs() < 1e-12);
    }
}
