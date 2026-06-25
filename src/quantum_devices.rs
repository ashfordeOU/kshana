// SPDX-License-Identifier: AGPL-3.0-only
//! **Quantum device error-model library + representativeness.**
//!
//! A single place that exposes the quantum-PNT *devices* the demonstrator trades —
//! optical / trapped-ion / mercury-ion clocks, classical reference clocks, the
//! cold-atom interferometer, and time-transfer links — each as a [`DeviceCard`]
//! carrying its headline spec and a [`Representativeness`] record (what it is
//! parameterised from, what it assumes, and what remains to flight).
//!
//! Most device physics already lives in the engine and is **reused** here, not
//! re-derived: clock stabilities come from [`crate::holdover::QuantumClockClass`]
//! and [`crate::clock_state::ClockClass`]; the cold-atom interferometer from
//! `crate::quantum_trade` / `crate::crossover`; classical optical/RF time-transfer
//! links from `crate::timetransfer_adv`. The one genuinely new model is the
//! **entanglement / single-photon time-transfer link** ([`EntanglementTimeLink`]),
//! whose timing precision is shot-limited: it improves as `1/sqrt(R·τ)` in the
//! detected coincidence rate `R` and integration time `τ`, degrades as dark counts
//! approach the signal rate, and is floored by an irreducible systematic — the
//! behaviour reported in quantum clock-synchronisation experiments. All models are
//! MODELLED (parameterised from published coefficients), labelled, and gap-stated.

use crate::clock_state::ClockClass;
use crate::holdover::QuantumClockClass;
use crate::representativeness::{Gap, Representativeness};

/// A device's headline spec plus its honesty record.
#[derive(Clone, Debug, serde::Serialize)]
pub struct DeviceCard {
    /// Device name.
    pub name: String,
    /// One-line key spec (e.g. "sigma_y(1 s) = 5e-16").
    pub key_spec: String,
    /// Representativeness + gaps-to-flight for this device model.
    pub representativeness: Representativeness,
}

fn clock_gap() -> Gap {
    Gap::new(
        "flight clock hardware in the space thermal/radiation environment",
        "Phase B2 engineering model + environmental test",
    )
}

/// Card for a quantum clock class (reuses `holdover::QuantumClockClass`).
pub fn quantum_clock_card(class: QuantumClockClass) -> DeviceCard {
    let (name, refr) = match class {
        QuantumClockClass::OpticalLattice => {
            ("optical-lattice clock (Sr/Yb)", "Ludlow et al. 2015")
        }
        QuantumClockClass::TrappedIon => ("trapped-ion optical clock (Al+)", "Brewer et al. 2019"),
        QuantumClockClass::MercuryIon => {
            ("space mercury-ion clock (DSAC-class)", "Burt et al. 2021")
        }
    };
    let adev = class.adev_1s();
    DeviceCard {
        name: name.to_string(),
        key_spec: format!("sigma_y(1 s) = {adev:.0e}"),
        representativeness: Representativeness::modelled(name, (3, 4))
            .with_assumption(&format!("sigma_y(1 s) = {adev:.0e} from {refr}"))
            .with_assumption("long-tau red-noise floor synthesised from the class default")
            .with_gap(clock_gap()),
    }
}

/// Card for a classical reference clock class (reuses `clock_state::ClockClass`).
pub fn classical_clock_card(class: ClockClass) -> DeviceCard {
    let (name, refr) = match class {
        ClockClass::Csac => (
            "chip-scale atomic clock (CSAC)",
            "Microsemi SA.45s datasheet",
        ),
        ClockClass::Uso => ("ultra-stable oscillator (USO)", "space USO class default"),
        ClockClass::Dsac => ("deep-space atomic clock (DSAC)", "Burt et al. 2021"),
    };
    let adev = class.adev_1s();
    DeviceCard {
        name: name.to_string(),
        key_spec: format!("sigma_y(1 s) = {adev:.0e}"),
        representativeness: Representativeness::modelled(name, (3, 4))
            .with_assumption(&format!("sigma_y(1 s) = {adev:.0e} from {refr}"))
            .with_gap(clock_gap()),
    }
}

/// An entanglement / single-photon time-transfer link.
///
/// Timing precision is shot-limited by the number of detected coincidences
/// `N = R·τ`: `sigma ≈ jitter / sqrt(N)`, degraded by a dark-count penalty
/// `sqrt(1 + dark/R)` and floored by an irreducible systematic.
#[derive(Clone, Copy, Debug, serde::Serialize)]
pub struct EntanglementTimeLink {
    /// Single-photon detector timing jitter (s).
    pub single_photon_jitter_s: f64,
    /// Entangled-pair source generation rate (Hz).
    pub source_pair_rate_hz: f64,
    /// Detection efficiency at end A (0..1).
    pub eta_a: f64,
    /// Detection efficiency at end B (0..1).
    pub eta_b: f64,
    /// Total channel loss across the link (dB).
    pub link_loss_db: f64,
    /// Detector dark-count rate (Hz).
    pub dark_rate_hz: f64,
    /// Irreducible systematic timing floor (s).
    pub systematic_floor_s: f64,
}

impl Default for EntanglementTimeLink {
    /// Representative LEO downlink-class parameters (illustrative, public-source).
    fn default() -> Self {
        EntanglementTimeLink {
            single_photon_jitter_s: 50e-12, // 50 ps SNSPD-class jitter
            source_pair_rate_hz: 1.0e7,     // 10 Mpair/s source
            eta_a: 0.7,
            eta_b: 0.7,
            link_loss_db: 30.0, // a lossy free-space/fibre channel
            dark_rate_hz: 100.0,
            systematic_floor_s: 1e-12, // 1 ps systematic floor
        }
    }
}

impl EntanglementTimeLink {
    /// Detected two-fold coincidence rate (Hz) after efficiencies and channel loss.
    pub fn detected_coincidence_rate_hz(&self) -> f64 {
        self.source_pair_rate_hz * self.eta_a * self.eta_b * 10f64.powf(-self.link_loss_db / 10.0)
    }

    /// Shot-limited timing precision (s) after integrating for `integration_s`.
    pub fn timing_precision_s(&self, integration_s: f64) -> f64 {
        let rc = self.detected_coincidence_rate_hz().max(1e-12);
        let n = (rc * integration_s.max(0.0)).max(1e-12);
        let shot = self.single_photon_jitter_s / n.sqrt();
        let dark_penalty = (1.0 + self.dark_rate_hz / rc).sqrt();
        ((shot * dark_penalty).powi(2) + self.systematic_floor_s.powi(2)).sqrt()
    }

    /// Card with the timing precision at the given integration time.
    pub fn card(&self, integration_s: f64) -> DeviceCard {
        let prec = self.timing_precision_s(integration_s);
        DeviceCard {
            name: "entanglement time-transfer link".to_string(),
            key_spec: format!(
                "sigma_t({integration_s:.0e} s) = {prec:.2e} s; R_c = {:.2e} Hz",
                self.detected_coincidence_rate_hz()
            ),
            representativeness: Representativeness::modelled(
                "entanglement / single-photon time transfer",
                (2, 4),
            )
            .with_assumption(
                "shot-limited precision ~ jitter/sqrt(R*tau) with dark-count penalty; \
                 pair-rate/efficiency/loss are illustrative public-source values",
            )
            .with_gap(Gap::new(
                "real entangled-photon source + space optical channel + SNSPD detectors",
                "Phase B2 hardware + link demonstration",
            )),
        }
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn clock_cards_are_honest_and_ordered() {
        let opt = quantum_clock_card(QuantumClockClass::OpticalLattice);
        let merc = quantum_clock_card(QuantumClockClass::MercuryIon);
        let csac = classical_clock_card(ClockClass::Csac);
        for c in [&opt, &merc, &csac] {
            assert!(
                c.representativeness.is_valid(),
                "{} invalid: {:?}",
                c.name,
                c.representativeness.check()
            );
        }
        // The optical-lattice class is more stable than the mercury-ion class, which
        // is more stable than a CSAC (sanity of the reused coefficients).
        assert!(
            QuantumClockClass::OpticalLattice.adev_1s() < QuantumClockClass::MercuryIon.adev_1s()
        );
        assert!(QuantumClockClass::MercuryIon.adev_1s() < ClockClass::Csac.adev_1s());
    }

    #[test]
    fn entanglement_precision_improves_as_inverse_sqrt_integration() {
        let link = EntanglementTimeLink {
            dark_rate_hz: 0.0,
            systematic_floor_s: 0.0,
            ..Default::default()
        };
        let s1 = link.timing_precision_s(1.0);
        let s4 = link.timing_precision_s(4.0);
        // 4x integration -> precision halves (shot-limited, no floor, no dark).
        assert!((s1 / s4 - 2.0).abs() < 1e-6, "expected 2x, got {}", s1 / s4);
    }

    #[test]
    fn detected_rate_falls_10x_per_10db() {
        let a = EntanglementTimeLink {
            link_loss_db: 20.0,
            ..Default::default()
        };
        let b = EntanglementTimeLink {
            link_loss_db: 30.0,
            ..Default::default()
        };
        let ratio = a.detected_coincidence_rate_hz() / b.detected_coincidence_rate_hz();
        assert!((ratio - 10.0).abs() < 1e-6, "expected 10x, got {ratio}");
    }

    #[test]
    fn dark_counts_degrade_precision() {
        let clean = EntanglementTimeLink {
            dark_rate_hz: 0.0,
            ..Default::default()
        };
        let noisy = EntanglementTimeLink {
            dark_rate_hz: 1e5,
            ..Default::default()
        };
        assert!(noisy.timing_precision_s(1.0) > clean.timing_precision_s(1.0));
    }

    #[test]
    fn systematic_floor_bounds_below() {
        let link = EntanglementTimeLink {
            systematic_floor_s: 1e-12,
            ..Default::default()
        };
        // Even with enormous integration the precision cannot beat the floor.
        let s = link.timing_precision_s(1e12);
        assert!((1e-12 - 1e-18..1.1e-12).contains(&s), "got {s}");
    }

    #[test]
    fn entanglement_card_is_modelled_and_valid() {
        let card = EntanglementTimeLink::default().card(1.0);
        assert!(card.representativeness.is_valid());
        assert!(card.key_spec.contains("sigma_t"));
        let j = serde_json::to_string(&card).unwrap();
        assert!(j.contains("entanglement"));
    }
}
