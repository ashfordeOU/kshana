//! The fault menu: parametric generators that inject a true-error time series
//! plus each fault's detectability.
//!
//! **Cited** impossibility: symmetric single-path delay is provably
//! undetectable by any protocol (Mizrahi, RFC 7384), as is a replay inside the
//! freshness window; the induced offset of a half-RTT *asymmetry* is the
//! detectable region (Narula & Humphreys, IEEE JSTSP 2018). Undetectable faults
//! carry [`Detectability::Undetectable`] and must be *absorbed* by the
//! protection level (see [`crate::benchmark::scorecard`]) — never "detected".
//! Generators are **Modelled** (representative), not measured.

/// Whether a fault class can, in principle, be detected by any monitor.
#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub enum Detectability {
    Detectable,
    /// Provably undetectable (Mizrahi RFC 7384) — must be absorbed, not detected.
    Undetectable,
}

/// The catalog of fault classes the benchmark exercises.
#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub enum FaultClass {
    DomainDivergence,
    ClockSlam,
    HoldoverCoast,
    StaticDelay,
    IncrementalDelay,
    SymmetricDelay,
    AsymmetricDelay,
    ReplayWithinFreshness,
    PathSelective,
    KofNQuorum,
}

/// A fault class plus its detectability and worst-case injected offset.
#[derive(Debug, Clone)]
pub struct FaultSpec {
    pub class: FaultClass,
    pub detectability: Detectability,
    pub max_offset: f64,
}

/// A named scenario: its spec and the injected true-error series (one per epoch).
#[derive(Debug, Clone)]
pub struct FaultScenario {
    pub name: String,
    pub spec: FaultSpec,
    pub true_errors: Vec<f64>,
}

fn max_abs(v: &[f64]) -> f64 {
    v.iter().cloned().fold(0.0_f64, |a, b| a.max(b.abs()))
}

fn constant(
    name: &str,
    class: FaultClass,
    det: Detectability,
    n: usize,
    offset: f64,
) -> FaultScenario {
    let true_errors = vec![offset; n];
    FaultScenario {
        name: name.to_string(),
        spec: FaultSpec {
            class,
            detectability: det,
            max_offset: offset.abs(),
        },
        true_errors,
    }
}

/// Constant path delay (detectable).
pub fn static_delay(n: usize, offset: f64) -> FaultScenario {
    constant(
        "static_delay",
        FaultClass::StaticDelay,
        Detectability::Detectable,
        n,
        offset,
    )
}

/// Ramping delay `rate·k` (detectable).
pub fn incremental_delay(n: usize, rate: f64) -> FaultScenario {
    let true_errors: Vec<f64> = (0..n).map(|k| rate * k as f64).collect();
    let max_offset = max_abs(&true_errors);
    FaultScenario {
        name: "incremental_delay".to_string(),
        spec: FaultSpec {
            class: FaultClass::IncrementalDelay,
            detectability: Detectability::Detectable,
            max_offset,
        },
        true_errors,
    }
}

/// Slow estimand drift outside the monitor's training regime (detectable).
pub fn domain_divergence(n: usize, drift_rate: f64) -> FaultScenario {
    let true_errors: Vec<f64> = (0..n).map(|k| drift_rate * k as f64).collect();
    let max_offset = max_abs(&true_errors);
    FaultScenario {
        name: "domain_divergence".to_string(),
        spec: FaultSpec {
            class: FaultClass::DomainDivergence,
            detectability: Detectability::Detectable,
            max_offset,
        },
        true_errors,
    }
}

/// A step of `step` starting at epoch `at` (detectable).
pub fn clock_slam(n: usize, step: f64, at: usize) -> FaultScenario {
    let true_errors: Vec<f64> = (0..n).map(|k| if k >= at { step } else { 0.0 }).collect();
    let max_offset = max_abs(&true_errors);
    FaultScenario {
        name: "clock_slam".to_string(),
        spec: FaultSpec {
            class: FaultClass::ClockSlam,
            detectability: Detectability::Detectable,
            max_offset,
        },
        true_errors,
    }
}

/// Free-running holdover growth `½·d_aging·t² + rw_rate·t` (detectable).
pub fn holdover_coast(n: usize, d_aging: f64, rw_rate: f64) -> FaultScenario {
    let true_errors: Vec<f64> = (0..n)
        .map(|k| {
            let t = k as f64;
            0.5 * d_aging * t * t + rw_rate * t
        })
        .collect();
    let max_offset = max_abs(&true_errors);
    FaultScenario {
        name: "holdover_coast".to_string(),
        spec: FaultSpec {
            class: FaultClass::HoldoverCoast,
            detectability: Detectability::Detectable,
            max_offset,
        },
        true_errors,
    }
}

/// Symmetric single-path delay: **undetectable** (Mizrahi RFC 7384).
pub fn symmetric_delay(n: usize, offset: f64) -> FaultScenario {
    constant(
        "symmetric_delay",
        FaultClass::SymmetricDelay,
        Detectability::Undetectable,
        n,
        offset,
    )
}

/// Half-RTT path asymmetry: induced offset is half the asymmetry (detectable).
pub fn asymmetric_delay(n: usize, path_asymmetry: f64) -> FaultScenario {
    constant(
        "asymmetric_delay",
        FaultClass::AsymmetricDelay,
        Detectability::Detectable,
        n,
        0.5 * path_asymmetry,
    )
}

/// A replay inside the freshness window: **undetectable** by crypto/freshness.
pub fn replay_within_freshness(n: usize, offset: f64) -> FaultScenario {
    constant(
        "replay_within_freshness",
        FaultClass::ReplayWithinFreshness,
        Detectability::Undetectable,
        n,
        offset,
    )
}

/// Delay on a subset of paths → effective offset scaled by `fraction_affected`
/// (detectable while an unaffected quorum remains).
pub fn path_selective(n: usize, offset: f64, fraction_affected: f64) -> FaultScenario {
    constant(
        "path_selective",
        FaultClass::PathSelective,
        Detectability::Detectable,
        n,
        offset * fraction_affected,
    )
}

/// `k` of `total` sources compromised together → fused offset scaled by `k/total`
/// (detectable while a non-compromised majority remains).
pub fn k_of_n_quorum(n: usize, offset: f64, k: usize, total: usize) -> FaultScenario {
    let frac = if total == 0 {
        0.0
    } else {
        k as f64 / total as f64
    };
    constant(
        "k_of_n_quorum",
        FaultClass::KofNQuorum,
        Detectability::Detectable,
        n,
        offset * frac,
    )
}

/// A representative default menu spanning every fault class.
pub fn full_menu() -> Vec<FaultScenario> {
    let n = 64;
    vec![
        domain_divergence(n, 0.05),
        clock_slam(n, 8.0, 32),
        holdover_coast(n, 0.01, 0.1),
        static_delay(n, 5.0),
        incremental_delay(n, 0.2),
        symmetric_delay(n, 6.0),
        asymmetric_delay(n, 10.0),
        replay_within_freshness(n, 4.0),
        path_selective(n, 12.0, 0.5),
        k_of_n_quorum(n, 9.0, 1, 3),
    ]
}

#[cfg(test)]
mod tests {
    use super::*;

    fn max_abs(v: &[f64]) -> f64 {
        v.iter().cloned().fold(0.0_f64, |a, b| a.max(b.abs()))
    }

    #[test]
    fn offset_profiles() {
        let st = static_delay(5, 3.0);
        assert_eq!(st.true_errors, vec![3.0; 5]);
        assert!((st.spec.max_offset - 3.0).abs() < 1e-12);

        let inc = incremental_delay(4, 2.0);
        assert_eq!(inc.true_errors, vec![0.0, 2.0, 4.0, 6.0]);
        assert!((inc.spec.max_offset - 6.0).abs() < 1e-12);

        let slam = clock_slam(4, 7.0, 2);
        assert_eq!(slam.true_errors, vec![0.0, 0.0, 7.0, 7.0]);

        let coast = holdover_coast(3, 2.0, 1.0);
        // 0.5*D*t^2 + rw*t: t=0→0, t=1→2, t=2→6
        assert_eq!(coast.true_errors, vec![0.0, 2.0, 6.0]);
        assert!(coast.true_errors.windows(2).all(|w| w[1] >= w[0])); // monotone
    }

    #[test]
    fn undetectable_faults_are_flagged() {
        assert_eq!(
            symmetric_delay(3, 4.0).spec.detectability,
            Detectability::Undetectable
        );
        assert_eq!(
            replay_within_freshness(3, 4.0).spec.detectability,
            Detectability::Undetectable
        );
        // The half-RTT-asymmetry branch is the detectable region.
        let asym = asymmetric_delay(3, 8.0);
        assert_eq!(asym.spec.detectability, Detectability::Detectable);
        assert!((asym.spec.max_offset - 4.0).abs() < 1e-12); // 0.5 * asymmetry
    }

    #[test]
    fn max_offset_matches_series() {
        for sc in full_menu() {
            assert!(
                (sc.spec.max_offset - max_abs(&sc.true_errors)).abs() < 1e-9,
                "max_offset mismatch for {}",
                sc.name
            );
        }
        // Exactly two undetectable classes in the menu.
        let n_undet = full_menu()
            .iter()
            .filter(|s| s.spec.detectability == Detectability::Undetectable)
            .count();
        assert_eq!(n_undet, 2);
    }
}
