// SPDX-License-Identifier: AGPL-3.0-only
//! **Trusted quantum timing — end-to-end time-transfer chain, secure dissemination
//! and a quantum-vs-classical trade.**
//!
//! One scenario (`kind = "quantum-time-transfer"`) that composes the timing chain a
//! quantum-PNT demonstrator needs and reports it as honest, reproducible evidence:
//!
//! 1. **End-to-end chain.** clock → link → dissemination → user. The user-time 1σ is
//!    the quadrature sum of the link timing precision and the reference clock's coast
//!    error over the dissemination interval. The *quantum* chain pairs an
//!    optical-lattice clock with an entanglement/single-photon link
//!    ([`crate::quantum_devices::EntanglementTimeLink`]); the *classical* chain pairs
//!    a chip-scale atomic clock with a two-way RF link.
//! 2. **Secure dissemination + integrity.** A timing protection level
//!    ([`crate::tpl`], reused) bounds the undetected time error, and a delay/replay
//!    attack detector ([`crate::detection`], reused) gives a security figure of merit
//!    `1 − P_md` at a stated false-alarm rate.
//! 3. **Timing anomaly detection.** A clock-fault detection probability + a CUSUM
//!    change-detection latency ([`crate::tpl::cusum_latency_s`], reused).
//! 4. **Trade.** The quantum-vs-classical comparison is emitted as a
//!    [`crate::qtrade::TradeEvidence`] carrying a [`crate::representativeness`] record.
//!
//! Everything is **MODELLED**: clock/link parameters are illustrative, public-source,
//! and the chain composes published-coefficient device models with closed-form
//! budgets. It models the *class* of system; no TRL/flight/certification is claimed.

use crate::detection::{analytic_pd, detection_boundary};
use crate::holdover::{coast_phase_sigma, QuantumClockClass};
use crate::qtrade::{TradeEvidence, TradeFom, TradeFrame};
use crate::quantum_devices::EntanglementTimeLink;
use crate::representativeness::{Gap, Representativeness};
use crate::tpl::{cusum_latency_s, timing_protection_level_ns, TplInputs};
use crate::verification::VerificationStatus;

fn d_integration_s() -> f64 {
    1.0
}
fn d_dissemination_interval_s() -> f64 {
    100.0
}
fn d_link_loss_db() -> f64 {
    30.0
}
fn d_classical_link_sigma_s() -> f64 {
    1.0e-9 // ~1 ns two-way RF time transfer
}
fn d_monitor_pfa() -> f64 {
    1.0e-3
}
fn d_attack_delay_s() -> f64 {
    5.0e-9 // a 5 ns delay/replay attack
}
fn d_clock_fault_sigma() -> f64 {
    4.0 // a clock anomaly at 4σ of the monitor noise
}

/// Coast (holdover) phase 1σ over an interval for a clock given its PSDs (s).
fn clock_coast_sigma_s(psds: (f64, f64, f64), interval_s: f64) -> f64 {
    coast_phase_sigma(psds.0, psds.1, psds.2, interval_s)
}

/// A runnable trusted-quantum-timing scenario.
#[derive(Clone, Copy, Debug, serde::Deserialize)]
pub struct QuantumTimeTransferScenario {
    /// Link integration time per measurement (s).
    #[serde(default = "d_integration_s")]
    pub integration_s: f64,
    /// Time-dissemination interval the clock must coast across (s).
    #[serde(default = "d_dissemination_interval_s")]
    pub dissemination_interval_s: f64,
    /// Quantum (entanglement) link total channel loss (dB).
    #[serde(default = "d_link_loss_db")]
    pub link_loss_db: f64,
    /// Classical two-way link timing 1σ (s).
    #[serde(default = "d_classical_link_sigma_s")]
    pub classical_link_sigma_s: f64,
    /// Integrity monitor false-alarm probability.
    #[serde(default = "d_monitor_pfa")]
    pub monitor_pfa: f64,
    /// Delay/replay attack offset to detect (s).
    #[serde(default = "d_attack_delay_s")]
    pub attack_delay_s: f64,
    /// Clock-anomaly magnitude, in units of the monitor noise σ.
    #[serde(default = "d_clock_fault_sigma")]
    pub clock_fault_sigma: f64,
}

impl Default for QuantumTimeTransferScenario {
    fn default() -> Self {
        QuantumTimeTransferScenario {
            integration_s: d_integration_s(),
            dissemination_interval_s: d_dissemination_interval_s(),
            link_loss_db: d_link_loss_db(),
            classical_link_sigma_s: d_classical_link_sigma_s(),
            monitor_pfa: d_monitor_pfa(),
            attack_delay_s: d_attack_delay_s(),
            clock_fault_sigma: d_clock_fault_sigma(),
        }
    }
}

/// The trusted-quantum-timing report.
#[derive(Clone, Debug, serde::Serialize)]
pub struct QuantumTimeTransferReport {
    /// Quantum chain end-to-end user-time 1σ (s).
    pub quantum_chain_sigma_s: f64,
    /// Classical chain end-to-end user-time 1σ (s).
    pub classical_chain_sigma_s: f64,
    /// Quantum-link detected coincidence rate (Hz).
    pub quantum_link_rate_hz: f64,
    /// Timing protection level for the disseminated time (ns).
    pub protection_level_ns: f64,
    /// Security FoM 1 − P_md against the delay/replay attack.
    pub security_pd: f64,
    /// Assumed monitor false-alarm probability.
    pub monitor_pfa: f64,
    /// Detection probability for the injected clock anomaly.
    pub anomaly_pd: f64,
    /// CUSUM change-detection latency for the anomaly (s).
    pub anomaly_cusum_latency_s: f64,
    /// The quantum-vs-classical trade evidence.
    pub trade: TradeEvidence,
}

impl QuantumTimeTransferScenario {
    /// Run the scenario.
    pub fn run(&self) -> QuantumTimeTransferReport {
        // --- 1. End-to-end chain budgets (quantum vs classical) -----------------
        // Quantum: optical-lattice clock + entanglement link.
        let q_clock = QuantumClockClass::OpticalLattice;
        let q_link = EntanglementTimeLink {
            link_loss_db: self.link_loss_db,
            ..Default::default()
        };
        let q_link_sigma = q_link.timing_precision_s(self.integration_s);
        let q_clock_coast = clock_coast_sigma_s(q_clock.psds(), self.dissemination_interval_s);
        let quantum_chain_sigma_s = (q_link_sigma.powi(2) + q_clock_coast.powi(2)).sqrt();

        // Classical: CSAC + two-way RF link.
        let c_psds = crate::clock_state::ClockClass::Csac.psds();
        let c_clock_coast = clock_coast_sigma_s(c_psds, self.dissemination_interval_s);
        let classical_chain_sigma_s =
            (self.classical_link_sigma_s.powi(2) + c_clock_coast.powi(2)).sqrt();

        // --- 2. Secure dissemination: protection level + attack detection -------
        // Protection level (reuse the certified TPL bound) over the quantum clock.
        let (q_wf, q_rw, q_drift) = q_clock.psds();
        let tpl = TplInputs {
            q_wf,
            q_rw,
            q_drift,
            r: quantum_chain_sigma_s.max(1e-15),
            tau: self.integration_s.max(1e-3),
            samples: (self.dissemination_interval_s / self.integration_s.max(1e-3)).max(1.0),
            k: 5.0,
            detection_latency_s: self.integration_s.max(1e-3),
        };
        let protection_level_ns = timing_protection_level_ns(&tpl);

        // Delay/replay attack detector: alarm if the offset exceeds a k-sigma gate set
        // for the monitor false-alarm rate. Security FoM = 1 - P_md = P_d.
        let sigma_mon = quantum_chain_sigma_s.max(1e-15);
        let gamma = detection_boundary(sigma_mon, self.monitor_pfa);
        let security_pd = analytic_pd(self.attack_delay_s, sigma_mon, gamma);

        // --- 3. Timing anomaly detection ----------------------------------------
        // A clock anomaly at clock_fault_sigma * monitor noise.
        let fault_mu = self.clock_fault_sigma * sigma_mon;
        let anomaly_pd = analytic_pd(fault_mu, sigma_mon, gamma);
        // CUSUM change-detection latency for the standardized fault magnitude.
        let anomaly_cusum_latency_s = cusum_latency_s(
            0.5,
            5.0,
            self.clock_fault_sigma,
            self.integration_s.max(1e-3),
        );

        // --- 4. Quantum-vs-classical trade evidence -----------------------------
        let rep =
            Representativeness::modelled("quantum vs classical end-to-end time transfer", (3, 4))
                .with_assumption(
                    "optical-lattice clock + entanglement link vs CSAC + RF two-way link",
                )
                .with_assumption(
                    "illustrative, public-source device/link parameters; seeded synthetic",
                )
                .with_gap(Gap::new(
                    "real clock + optical link hardware and a space channel demonstration",
                    "Phase B2 hardware-in-the-loop",
                ));
        let trade = TradeEvidence::new(TradeFrame::new("quantum-time-transfer", 0), rep)
            .with_fom(TradeFom {
                name: "end-to-end time-transfer precision".into(),
                unit: "s".into(),
                quantum: quantum_chain_sigma_s,
                classical: classical_chain_sigma_s,
                higher_is_better: false,
                ci95: None,
                status: VerificationStatus::Modelled,
            })
            .with_fom(TradeFom {
                name: "reference clock 1 s stability".into(),
                unit: "sigma_y(1 s)".into(),
                quantum: q_clock.adev_1s(),
                classical: crate::clock_state::ClockClass::Csac.adev_1s(),
                higher_is_better: false,
                ci95: None,
                status: VerificationStatus::Modelled,
            });

        QuantumTimeTransferReport {
            quantum_chain_sigma_s,
            classical_chain_sigma_s,
            quantum_link_rate_hz: q_link.detected_coincidence_rate_hz(),
            protection_level_ns,
            security_pd,
            monitor_pfa: self.monitor_pfa,
            anomaly_pd,
            anomaly_cusum_latency_s,
            trade,
        }
    }
}

/// A minimal accumulated-budget SVG.
pub fn to_svg(r: &QuantumTimeTransferReport) -> String {
    let q = r.quantum_chain_sigma_s;
    let c = r.classical_chain_sigma_s;
    let max = q.max(c).max(1e-18);
    let qh = (q / max * 180.0).min(180.0);
    let ch = (c / max * 180.0).min(180.0);
    format!(
        "<svg xmlns='http://www.w3.org/2000/svg' width='320' height='220'>\
         <rect width='320' height='220' fill='white'/>\
         <text x='10' y='20' font-size='12'>quantum-time-transfer (MODELLED)</text>\
         <rect x='60' y='{}' width='60' height='{:.1}' fill='#3a6'/>\
         <text x='62' y='210' font-size='10'>quantum</text>\
         <rect x='180' y='{}' width='60' height='{:.1}' fill='#c44'/>\
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
    fn quantum_precision_improves_with_integration() {
        let short = QuantumTimeTransferScenario {
            integration_s: 1.0,
            ..Default::default()
        };
        let long = QuantumTimeTransferScenario {
            integration_s: 100.0,
            ..Default::default()
        };
        // Longer integration -> tighter quantum link -> tighter (or equal) chain.
        assert!(long.run().quantum_chain_sigma_s <= short.run().quantum_chain_sigma_s);
    }

    #[test]
    fn quantum_can_win_and_can_lose() {
        // Favourable link: quantum wins the precision FoM.
        let good = QuantumTimeTransferScenario {
            link_loss_db: 10.0,
            ..Default::default()
        }
        .run();
        assert!(good.quantum_chain_sigma_s < good.classical_chain_sigma_s);
        // A very lossy quantum link: classical wins (honest — not a universal win).
        let bad = QuantumTimeTransferScenario {
            link_loss_db: 80.0,
            ..Default::default()
        }
        .run();
        assert!(bad.quantum_chain_sigma_s > bad.classical_chain_sigma_s);
    }

    #[test]
    fn protection_level_is_finite_positive() {
        let r = QuantumTimeTransferScenario::default().run();
        assert!(r.protection_level_ns.is_finite() && r.protection_level_ns > 0.0);
    }

    #[test]
    fn security_fom_in_range_and_grows_with_attack_delay() {
        let small = QuantumTimeTransferScenario {
            attack_delay_s: 1e-9,
            ..Default::default()
        }
        .run();
        let large = QuantumTimeTransferScenario {
            attack_delay_s: 20e-9,
            ..Default::default()
        }
        .run();
        for v in [small.security_pd, large.security_pd] {
            assert!((0.0..=1.0).contains(&v), "Pd out of range: {v}");
        }
        assert!(
            large.security_pd >= small.security_pd,
            "larger attack must be at least as detectable"
        );
    }

    #[test]
    fn anomaly_detection_is_consistent() {
        let r = QuantumTimeTransferScenario::default().run();
        assert!((0.0..=1.0).contains(&r.anomaly_pd));
        assert!(r.anomaly_cusum_latency_s.is_finite() && r.anomaly_cusum_latency_s > 0.0);
        // A bigger fault is detected at least as well.
        let big = QuantumTimeTransferScenario {
            clock_fault_sigma: 8.0,
            ..Default::default()
        }
        .run();
        assert!(big.anomaly_pd >= r.anomaly_pd);
    }

    #[test]
    fn trade_is_honest() {
        let r = QuantumTimeTransferScenario::default().run();
        assert!(
            r.trade.is_honest(),
            "violations: {:?}",
            r.trade.honesty_violations()
        );
        assert!(r.trade.representativeness.is_valid());
    }
}
