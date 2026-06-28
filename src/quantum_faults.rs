// SPDX-License-Identifier: AGPL-3.0-only
//! **Fault / anomaly detection for quantum PNT systems.**
//!
//! One scenario (`kind = "quantum-anomaly-detect"`) for the fault/anomaly-detection
//! application area. It defines a labelled catalog of quantum-PNT faults
//! ([`FaultKind`] — clock frequency jump, drift, lock-loss; sensor bias step,
//! dropout), scores a detection statistic on nominal vs faulted windows, and
//! reports the detector's discrimination as an **ROC AUC** (with a bootstrap CI from
//! the externally-validated `crate::eval_stats`) and a **minimum-detectable fault**
//! at a fixed false-alarm rate. The quantum-vs-classical angle: a more stable
//! quantum-clock reference lowers the monitor noise, so it detects *smaller* faults
//! — emitted as honest [`crate::qtrade`] evidence with a representativeness record.
//!
//! The detection statistic is modelled as Gaussian — nominal `N(0, σ)`, fault
//! `N(μ, σ)` — for which the AUC has the closed form `Φ(μ / (σ√2))`; the empirical
//! bootstrap AUC cross-checks it. MODELLED; models the *class*; illustrative
//! public-source parameters; no TRL/flight/certification claimed.

use crate::detection::{normal_cdf, normal_inv_cdf};
use crate::eval_stats::bootstrap_auc_ci;
use crate::qtrade::{TradeEvidence, TradeFom, TradeFrame};
use crate::representativeness::{Gap, Representativeness};
use crate::verification::VerificationStatus;
use rand::SeedableRng;
use rand_chacha::ChaCha8Rng;
use rand_distr::{Distribution, Normal};

/// A labelled quantum-PNT fault class.
#[derive(Clone, Copy, Debug, PartialEq, Eq, serde::Serialize)]
pub enum FaultKind {
    /// Clock frequency jump (step in fractional frequency).
    ClockFrequencyJump,
    /// Clock frequency drift onset (ramp).
    ClockDrift,
    /// Clock lock loss (large excursion).
    ClockLockLoss,
    /// Quantum-sensor bias step.
    SensorBiasStep,
    /// Sensor dropout / fringe-lock loss.
    SensorDropout,
}

impl FaultKind {
    /// The catalog of fault classes.
    pub fn catalog() -> [FaultKind; 5] {
        [
            FaultKind::ClockFrequencyJump,
            FaultKind::ClockDrift,
            FaultKind::ClockLockLoss,
            FaultKind::SensorBiasStep,
            FaultKind::SensorDropout,
        ]
    }
    /// A short label.
    pub fn label(self) -> &'static str {
        match self {
            FaultKind::ClockFrequencyJump => "clock-frequency-jump",
            FaultKind::ClockDrift => "clock-drift",
            FaultKind::ClockLockLoss => "clock-lock-loss",
            FaultKind::SensorBiasStep => "sensor-bias-step",
            FaultKind::SensorDropout => "sensor-dropout",
        }
    }
}

/// Closed-form ROC AUC for a Gaussian detection statistic: nominal `N(0,σ)`,
/// fault `N(μ,σ)` -> `AUC = Φ(μ / (σ√2))`.
pub fn analytic_auc(mu: f64, sigma: f64) -> f64 {
    if sigma <= 0.0 {
        return if mu > 0.0 { 1.0 } else { 0.5 };
    }
    normal_cdf(mu / (sigma * std::f64::consts::SQRT_2))
}

/// Minimum detectable fault magnitude at detection probability `pd` and
/// false-alarm probability `pfa`, for a one-sided Gaussian monitor of noise `σ`:
/// `μ_min = σ·(Φ⁻¹(1−pfa) + Φ⁻¹(pd))`.
pub fn min_detectable_fault(sigma: f64, pfa: f64, pd: f64) -> f64 {
    sigma * (normal_inv_cdf(1.0 - pfa) + normal_inv_cdf(pd))
}

fn d_fault_mu() -> f64 {
    1.0
}
fn d_quantum_sigma() -> f64 {
    0.3
}
fn d_classical_sigma() -> f64 {
    1.0
}
fn d_pfa() -> f64 {
    1.0e-3
}
fn d_pd() -> f64 {
    0.9
}
fn d_samples() -> usize {
    2000
}
fn d_seed() -> u64 {
    42
}

/// A quantum-PNT anomaly-detection scenario.
#[derive(Clone, Copy, Debug, serde::Deserialize)]
pub struct QuantumAnomalyScenario {
    /// Fault magnitude in the detection-statistic units (mean shift under fault).
    #[serde(default = "d_fault_mu")]
    pub fault_mu: f64,
    /// Quantum-clock-aided monitor noise σ.
    #[serde(default = "d_quantum_sigma")]
    pub quantum_sigma: f64,
    /// Classical monitor noise σ.
    #[serde(default = "d_classical_sigma")]
    pub classical_sigma: f64,
    /// Monitor false-alarm probability for the min-detectable-fault FoM.
    #[serde(default = "d_pfa")]
    pub pfa: f64,
    /// Target detection probability for the min-detectable-fault FoM.
    #[serde(default = "d_pd")]
    pub pd: f64,
    /// Samples per class for the empirical AUC cross-check.
    #[serde(default = "d_samples")]
    pub samples: usize,
    /// RNG seed.
    #[serde(default = "d_seed")]
    pub seed: u64,
}

impl Default for QuantumAnomalyScenario {
    fn default() -> Self {
        QuantumAnomalyScenario {
            fault_mu: d_fault_mu(),
            quantum_sigma: d_quantum_sigma(),
            classical_sigma: d_classical_sigma(),
            pfa: d_pfa(),
            pd: d_pd(),
            samples: d_samples(),
            seed: d_seed(),
        }
    }
}

/// The anomaly-detection report.
#[derive(Clone, Debug, serde::Serialize)]
pub struct QuantumAnomalyReport {
    /// Fault classes in the catalog.
    pub fault_catalog: Vec<String>,
    /// Quantum-monitor ROC AUC (closed form).
    pub quantum_auc: f64,
    /// Classical-monitor ROC AUC (closed form).
    pub classical_auc: f64,
    /// Empirical bootstrap 95% CI on the quantum AUC `(lo, hi)`.
    pub quantum_auc_ci: (f64, f64),
    /// Minimum detectable fault for the quantum monitor (statistic units).
    pub quantum_min_detectable: f64,
    /// Minimum detectable fault for the classical monitor (statistic units).
    pub classical_min_detectable: f64,
    /// Quantum-vs-classical trade evidence.
    pub trade: TradeEvidence,
}

impl QuantumAnomalyScenario {
    /// Run the scenario.
    pub fn run(&self) -> QuantumAnomalyReport {
        let quantum_auc = analytic_auc(self.fault_mu, self.quantum_sigma);
        let classical_auc = analytic_auc(self.fault_mu, self.classical_sigma);

        // Empirical cross-check of the quantum AUC against the validated eval_stats.
        let mut rng = ChaCha8Rng::seed_from_u64(self.seed);
        // `Normal::new` (rand_distr 0.4) rejects only a non-finite std_dev; coerce a
        // (possibly `inf`) configured sigma to a finite, strictly-positive value. The
        // mean (`fault_mu`) is not validated by `Normal::new`, so it passes through.
        let q_sigma = {
            let s = self.quantum_sigma.max(1e-12);
            if s.is_finite() {
                s
            } else {
                1e-12
            }
        };
        let n0 = Normal::new(0.0, q_sigma)
            .expect("q_sigma is finite and strictly positive, which Normal::new always accepts");
        let n1 = Normal::new(self.fault_mu, q_sigma)
            .expect("q_sigma is finite and strictly positive, which Normal::new always accepts");
        let neg: Vec<f64> = (0..self.samples).map(|_| n0.sample(&mut rng)).collect();
        let pos: Vec<f64> = (0..self.samples).map(|_| n1.sample(&mut rng)).collect();
        let quantum_auc_ci = bootstrap_auc_ci(&pos, &neg, 200, self.seed, 0.05);

        let quantum_min_detectable = min_detectable_fault(self.quantum_sigma, self.pfa, self.pd);
        let classical_min_detectable =
            min_detectable_fault(self.classical_sigma, self.pfa, self.pd);

        let rep =
            Representativeness::modelled("quantum vs classical PNT anomaly detection", (3, 4))
                .with_assumption(
                    "Gaussian detection statistic; quantum-clock-aided monitor has lower noise",
                )
                .with_assumption(
                    "labelled synthetic fault catalog; illustrative public-source parameters",
                )
                .with_gap(Gap::new(
                    "real telemetry from quantum-PNT hardware with ground-truth fault labels",
                    "Phase B2 hardware-in-the-loop + flight telemetry",
                ));
        let trade = TradeEvidence::new(TradeFrame::new("quantum-anomaly-detect", self.seed), rep)
            .with_fom(TradeFom {
                name: "detection AUC".into(),
                unit: "AUC".into(),
                quantum: quantum_auc,
                classical: classical_auc,
                higher_is_better: true,
                ci95: Some(quantum_auc_ci),
                status: VerificationStatus::Modelled,
            })
            .with_fom(TradeFom {
                name: "minimum detectable fault".into(),
                unit: "stat".into(),
                quantum: quantum_min_detectable,
                classical: classical_min_detectable,
                higher_is_better: false,
                ci95: None,
                status: VerificationStatus::Modelled,
            });

        QuantumAnomalyReport {
            fault_catalog: FaultKind::catalog()
                .iter()
                .map(|f| f.label().to_string())
                .collect(),
            quantum_auc,
            classical_auc,
            quantum_auc_ci,
            quantum_min_detectable,
            classical_min_detectable,
            trade,
        }
    }
}

/// A minimal AUC bar SVG (quantum vs classical).
pub fn to_svg(r: &QuantumAnomalyReport) -> String {
    let qh = (r.quantum_auc * 180.0).min(180.0);
    let ch = (r.classical_auc * 180.0).min(180.0);
    format!(
        "<svg xmlns='http://www.w3.org/2000/svg' width='320' height='220'>\
         <rect width='320' height='220' fill='white'/>\
         <text x='10' y='20' font-size='12'>quantum-anomaly-detect AUC (MODELLED)</text>\
         <rect x='60' y='{:.1}' width='60' height='{:.1}' fill='#3a6'/>\
         <text x='62' y='210' font-size='10'>quantum</text>\
         <rect x='180' y='{:.1}' width='60' height='{:.1}' fill='#c44'/>\
         <text x='182' y='210' font-size='10'>classical</text></svg>",
        200.0 - qh,
        qh,
        200.0 - ch,
        ch
    )
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn analytic_auc_matches_known_values() {
        // μ = 0 -> AUC = 0.5 (no discrimination). normal_cdf is an erf approximation
        // (~1e-7), so compare at that tolerance, not machine epsilon.
        assert!((analytic_auc(0.0, 1.0) - 0.5).abs() < 1e-6);
        // Large μ/σ -> AUC -> 1.
        assert!(analytic_auc(10.0, 1.0) > 0.999);
        // Monotone in μ/σ.
        assert!(analytic_auc(1.0, 0.3) > analytic_auc(1.0, 1.0));
    }

    #[test]
    fn empirical_auc_brackets_the_analytic() {
        let r = QuantumAnomalyScenario::default().run();
        let (lo, hi) = r.quantum_auc_ci;
        assert!(
            lo <= r.quantum_auc + 1e-3 && r.quantum_auc <= hi + 1e-3,
            "analytic {} not in CI ({lo},{hi})",
            r.quantum_auc
        );
    }

    #[test]
    fn quantum_monitor_detects_smaller_faults_and_has_higher_auc() {
        let r = QuantumAnomalyScenario::default().run();
        assert!(r.quantum_auc > r.classical_auc);
        assert!(r.quantum_min_detectable < r.classical_min_detectable);
    }

    #[test]
    fn advantage_vanishes_for_huge_faults() {
        // Honest: a large enough fault is detected perfectly by both monitors, so the
        // quantum AUC advantage shrinks toward zero (not a universal margin).
        let small = QuantumAnomalyScenario {
            fault_mu: 0.5,
            ..Default::default()
        }
        .run();
        let huge = QuantumAnomalyScenario {
            fault_mu: 20.0,
            ..Default::default()
        }
        .run();
        let small_gap = small.quantum_auc - small.classical_auc;
        let huge_gap = huge.quantum_auc - huge.classical_auc;
        assert!(huge_gap < small_gap);
    }

    #[test]
    fn catalog_has_five_labelled_faults() {
        let r = QuantumAnomalyScenario::default().run();
        assert_eq!(r.fault_catalog.len(), 5);
        assert!(r.fault_catalog.iter().any(|f| f == "clock-frequency-jump"));
    }

    #[test]
    fn trade_is_honest() {
        let r = QuantumAnomalyScenario::default().run();
        assert!(
            r.trade.is_honest(),
            "violations: {:?}",
            r.trade.honesty_violations()
        );
        assert_eq!(r.trade.quantum_wins(), 2);
    }
}
