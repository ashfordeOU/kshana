// SPDX-License-Identifier: AGPL-3.0-only
//! **GNSS-free quantum spacecraft navigation.**
//!
//! One scenario (`kind = "quantum-gnss-free-nav"`) for the quantum-enhanced-nav
//! application area: during a GNSS outage a spacecraft must dead-reckon on its
//! inertial sensors and clock. This compares a **quantum** inertial budget (a
//! cold-atom interferometer accelerometer, reused from `crate::inertial::quantum_imu`
//! / `crate::quantum_trade`) against a **classical** navigation-grade INS, reporting
//! the position-error growth over the outage, the holdover time to a position
//! threshold, and the quantum-vs-classical trade as honest [`crate::qtrade`] evidence.
//!
//! **Observability, stated honestly.** With no external fix during the outage the
//! accelerometer *bias* is unobservable, so the position error grows without bound
//! (≈ ½·bias·t² plus a velocity-random-walk term). A lower-bias quantum sensor
//! *slows* that growth — it does not close the observability gap; only an external
//! fix does. The trade quantifies how much longer a quantum budget holds a given
//! accuracy. MODELLED; illustrative public-source device parameters; models the
//! class; no TRL/flight/certification claimed.

use crate::inertial::quantum_imu::{CaiAccelerometer, QuantumNavBudget, RB87_D2_WAVELENGTH_M};
use crate::qtrade::{TradeEvidence, TradeFom, TradeFrame};
use crate::quantum_trade::{ClassicalInsBudget, PositionDrift};
use crate::representativeness::{Gap, Representativeness};
use crate::verification::VerificationStatus;

fn d_outage_s() -> f64 {
    300.0
}
fn d_threshold_m() -> f64 {
    100.0
}
fn d_quantum_bias_m_s2() -> f64 {
    1.0e-7 // cold-atom residual bias after GNSS calibration
}
fn d_classical_bias_m_s2() -> f64 {
    5.0e-5 // navigation-grade INS residual bias
}

/// A GNSS-free dead-reckoning navigation scenario.
#[derive(Clone, Copy, Debug, serde::Deserialize)]
pub struct QuantumNavOdScenario {
    /// GNSS-outage (coast) duration to evaluate (s).
    #[serde(default = "d_outage_s")]
    pub outage_s: f64,
    /// Position-error threshold for the holdover figure of merit (m).
    #[serde(default = "d_threshold_m")]
    pub threshold_m: f64,
    /// Quantum (cold-atom) residual accelerometer bias (m/s²).
    #[serde(default = "d_quantum_bias_m_s2")]
    pub quantum_bias_m_s2: f64,
    /// Classical navigation-grade INS residual bias (m/s²).
    #[serde(default = "d_classical_bias_m_s2")]
    pub classical_bias_m_s2: f64,
}

impl Default for QuantumNavOdScenario {
    fn default() -> Self {
        QuantumNavOdScenario {
            outage_s: d_outage_s(),
            threshold_m: d_threshold_m(),
            quantum_bias_m_s2: d_quantum_bias_m_s2(),
            classical_bias_m_s2: d_classical_bias_m_s2(),
        }
    }
}

/// The GNSS-free navigation report.
#[derive(Clone, Debug, serde::Serialize)]
pub struct QuantumNavOdReport {
    /// Outage duration evaluated (s).
    pub outage_s: f64,
    /// Quantum-IMU position error 1σ at the end of the outage (m).
    pub quantum_pos_err_m: f64,
    /// Classical-INS position error 1σ at the end of the outage (m).
    pub classical_pos_err_m: f64,
    /// Classical ÷ quantum position-error ratio at the outage end (×).
    pub improvement_x: f64,
    /// Quantum holdover: coast time to the threshold (s).
    pub quantum_holdover_s: f64,
    /// Classical holdover: coast time to the threshold (s).
    pub classical_holdover_s: f64,
    /// The position-error threshold used for holdover (m).
    pub threshold_m: f64,
    /// The quantum-vs-classical trade evidence.
    pub trade: TradeEvidence,
}

fn quantum_budget(bias: f64) -> QuantumNavBudget {
    QuantumNavBudget {
        cai: CaiAccelerometer {
            wavelength_m: RB87_D2_WAVELENGTH_M,
            pulse_sep_t: 0.05,
            atom_number: 1.0e6,
            contrast: 0.5,
            cycle_time_s: 0.5,
        },
        bias_m_s2: bias,
        scale_factor_ppm: 1.0,
        ref_accel_m_s2: 0.0,
        tau_stability_s: 0.0,
    }
}

fn classical_budget(bias: f64) -> ClassicalInsBudget {
    ClassicalInsBudget {
        bias_m_s2: bias,
        scale_factor_ppm: 50.0,
        ref_accel_m_s2: 9.81,
        vrw_psd: 1.0e-4,
    }
}

impl QuantumNavOdScenario {
    /// Run the scenario.
    pub fn run(&self) -> QuantumNavOdReport {
        let q = quantum_budget(self.quantum_bias_m_s2);
        let c = classical_budget(self.classical_bias_m_s2);

        let quantum_pos_err_m = q.drift_m(self.outage_s);
        let classical_pos_err_m = c.drift_m(self.outage_s);
        let improvement_x = if quantum_pos_err_m > 0.0 {
            classical_pos_err_m / quantum_pos_err_m
        } else {
            f64::INFINITY
        };
        let quantum_holdover_s = q.inertial_holdover_s(self.threshold_m);
        let classical_holdover_s = c.inertial_holdover_s(self.threshold_m);

        let rep =
            Representativeness::modelled("GNSS-free quantum vs classical dead-reckoning", (3, 4))
                .with_assumption("cold-atom accelerometer vs navigation-grade INS error budgets")
                .with_assumption(
                    "no external fix during the outage; bias unobservable (error grows)",
                )
                .with_assumption("illustrative, public-source device parameters")
                .with_gap(Gap::new(
                    "real cold-atom IMU hardware + dynamic platform + flight environment",
                    "Phase B2 hardware-in-the-loop",
                ));
        let trade = TradeEvidence::new(TradeFrame::new("quantum-gnss-free-nav", 0), rep)
            .with_fom(TradeFom {
                name: "outage position error".into(),
                unit: "m".into(),
                quantum: quantum_pos_err_m,
                classical: classical_pos_err_m,
                higher_is_better: false,
                ci95: None,
                status: VerificationStatus::Modelled,
            })
            .with_fom(TradeFom {
                name: "holdover to threshold".into(),
                unit: "s".into(),
                quantum: quantum_holdover_s,
                classical: classical_holdover_s,
                higher_is_better: true,
                ci95: None,
                status: VerificationStatus::Modelled,
            });

        QuantumNavOdReport {
            outage_s: self.outage_s,
            quantum_pos_err_m,
            classical_pos_err_m,
            improvement_x,
            quantum_holdover_s,
            classical_holdover_s,
            threshold_m: self.threshold_m,
            trade,
        }
    }
}

/// A minimal position-error-vs-outage SVG (quantum vs classical, log-ish bars).
pub fn to_svg(r: &QuantumNavOdReport) -> String {
    let max = r.quantum_pos_err_m.max(r.classical_pos_err_m).max(1e-9);
    let qh = (r.quantum_pos_err_m / max * 180.0).min(180.0);
    let ch = (r.classical_pos_err_m / max * 180.0).min(180.0);
    format!(
        "<svg xmlns='http://www.w3.org/2000/svg' width='320' height='220'>\
         <rect width='320' height='220' fill='white'/>\
         <text x='10' y='20' font-size='12'>quantum-gnss-free-nav (MODELLED)</text>\
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
    fn quantum_beats_classical_over_a_long_outage() {
        let r = QuantumNavOdScenario::default().run();
        assert!(r.quantum_pos_err_m < r.classical_pos_err_m);
        assert!(r.improvement_x > 1.0);
        assert!(r.quantum_holdover_s > r.classical_holdover_s);
    }

    #[test]
    fn error_grows_with_outage_duration_observability_gap() {
        // Bias is unobservable without a fix -> error grows with outage for both.
        let short = QuantumNavOdScenario {
            outage_s: 60.0,
            ..Default::default()
        }
        .run();
        let long = QuantumNavOdScenario {
            outage_s: 600.0,
            ..Default::default()
        }
        .run();
        assert!(long.quantum_pos_err_m > short.quantum_pos_err_m);
        assert!(long.classical_pos_err_m > short.classical_pos_err_m);
        // The quantum budget stays ahead at both coast lengths.
        assert!(long.quantum_pos_err_m < long.classical_pos_err_m);
        assert!(short.quantum_pos_err_m < short.classical_pos_err_m);
    }

    #[test]
    fn advantage_is_outage_dependent_not_a_constant() {
        // Honest: the quantum advantage is not a uniform constant win factor — it
        // depends on the coast length (the quantum curve is noise-dominated at short
        // coast, bias-dominated at long coast), so the ratio differs across outages.
        let tiny = QuantumNavOdScenario {
            outage_s: 1.0,
            ..Default::default()
        }
        .run();
        let long = QuantumNavOdScenario {
            outage_s: 1000.0,
            ..Default::default()
        }
        .run();
        let rel = (tiny.improvement_x - long.improvement_x).abs()
            / long.improvement_x.max(tiny.improvement_x);
        assert!(
            rel > 0.01,
            "advantage should vary with outage, not be constant"
        );
    }

    #[test]
    fn trade_is_honest() {
        let r = QuantumNavOdScenario::default().run();
        assert!(
            r.trade.is_honest(),
            "violations: {:?}",
            r.trade.honesty_violations()
        );
        assert_eq!(r.trade.quantum_wins(), 2);
    }
}
