// SPDX-License-Identifier: AGPL-3.0-only
//! Multipath and receiver-hardware error terms for a lunar surface receiver (LRS-02), used by
//! the `lunar-station-coverage` kind at the user and at the reference station when its
//! optional `[receiver]` section is given.
//!
//! Three terms, each a range error added to the satellite's measurement:
//!
//! * **Multipath**, elevation-dependent: `sigma_mp(el) = a + b exp(-el / el0)`. The functional
//!   form is the airborne multipath model of RTCA DO-229 (Appendix J), whose values
//!   `a = 0.13 m`, `b = 0.53 m`, `el0 = 10 deg` are this section's defaults. No public source
//!   gives a lunar regolith or lander value, so on the Moon every value is ILLUSTRATIVE. At the
//!   user it is white from epoch to epoch; at the station it can be correlated over time as a
//!   first-order Gauss-Markov process of correlation time `station_multipath_tau_s`
//!   (`rho = exp(-dt / tau)` between epochs `dt` apart), the station being static.
//! * **Code tracking noise** of a delay-locked loop with an early-minus-late discriminator, in
//!   the standard thermal-noise form (Kaplan and Hegarty, *Understanding GPS/GNSS*, 3rd ed.,
//!   eq. for the coherent early-minus-late DLL):
//!   `sigma = L_c sqrt( B_L d / (2 C/N0) (1 + 2 / ((2 - d) T C/N0)) )`, with `C/N0` in Hz,
//!   `L_c` the chip length, `B_L` the loop bandwidth, `d` the correlator spacing in chips and
//!   `T` the coherent integration time. White, at the user and at the station.
//! * **Inter-channel biases**: one constant per satellite channel, drawn once per trial
//!   (Gaussian, `inter_channel_bias_sigma_m`), separately at the user and at the station; they
//!   do not cancel in the difference.
//!
//! MODELLED. Antenna phase-centre and group-delay variation are not modelled.

use serde::{Deserialize, Serialize};

fn d_mp_a() -> f64 {
    0.13
}
fn d_mp_b() -> f64 {
    0.53
}
fn d_mp_el0() -> f64 {
    10.0
}
fn d_bl() -> f64 {
    0.5
}
fn d_spacing() -> f64 {
    1.0
}
fn d_t() -> f64 {
    0.02
}
fn d_chip() -> f64 {
    // One chip of a 1.023 Mchip/s code: c / 1.023e6.
    299_792_458.0 / 1.023e6
}

/// The `[receiver]` section.
#[derive(Clone, Debug, Deserialize, Serialize, PartialEq)]
#[serde(deny_unknown_fields)]
pub struct ReceiverCfg {
    /// Multipath floor `a` (m).
    #[serde(default = "d_mp_a")]
    pub multipath_a_m: f64,
    /// Multipath low-elevation amplitude `b` (m).
    #[serde(default = "d_mp_b")]
    pub multipath_b_m: f64,
    /// Multipath elevation scale `el0` (deg).
    #[serde(default = "d_mp_el0")]
    pub multipath_el0_deg: f64,
    /// Correlation time of the station's multipath (s); absent, white from epoch to epoch.
    #[serde(default, skip_serializing_if = "Option::is_none")]
    pub station_multipath_tau_s: Option<f64>,
    /// Carrier-to-noise density (dB-Hz) for the code tracking noise; absent, no tracking term.
    #[serde(default, skip_serializing_if = "Option::is_none")]
    pub cn0_dbhz: Option<f64>,
    /// DLL loop bandwidth (Hz).
    #[serde(default = "d_bl")]
    pub dll_bandwidth_hz: f64,
    /// Early-minus-late correlator spacing (chips).
    #[serde(default = "d_spacing")]
    pub correlator_spacing_chips: f64,
    /// Coherent integration time (s).
    #[serde(default = "d_t")]
    pub coherent_integration_s: f64,
    /// Code chip length (m); default one chip of a 1.023 Mchip/s code.
    #[serde(default = "d_chip")]
    pub chip_length_m: f64,
    /// 1-sigma of the per-channel inter-channel bias (m).
    #[serde(default)]
    pub inter_channel_bias_sigma_m: f64,
}

impl ReceiverCfg {
    /// Check the section.
    pub fn validate(&self) -> Result<(), String> {
        let bad = |w: &str| Err(format!("receiver: {w}"));
        for (n, v) in [
            ("multipath_a_m", self.multipath_a_m),
            ("multipath_b_m", self.multipath_b_m),
            (
                "inter_channel_bias_sigma_m",
                self.inter_channel_bias_sigma_m,
            ),
        ] {
            if !(v.is_finite() && v >= 0.0) {
                return bad(&format!("{n} must be finite and not negative"));
            }
        }
        for (n, v) in [
            ("multipath_el0_deg", self.multipath_el0_deg),
            ("dll_bandwidth_hz", self.dll_bandwidth_hz),
            ("coherent_integration_s", self.coherent_integration_s),
            ("chip_length_m", self.chip_length_m),
        ] {
            if !(v.is_finite() && v > 0.0) {
                return bad(&format!("{n} must be finite and positive"));
            }
        }
        if !(self.correlator_spacing_chips > 0.0 && self.correlator_spacing_chips < 2.0) {
            return bad("correlator_spacing_chips must be in (0, 2)");
        }
        if let Some(t) = self.station_multipath_tau_s {
            if !(t.is_finite() && t > 0.0) {
                return bad("station_multipath_tau_s must be finite and positive");
            }
        }
        if let Some(c) = self.cn0_dbhz {
            if !c.is_finite() {
                return bad("cn0_dbhz must be finite");
            }
        }
        Ok(())
    }

    /// Multipath 1-sigma (m) at elevation `el_deg`: `a + b exp(-el / el0)`.
    pub fn multipath_sigma_m(&self, el_deg: f64) -> f64 {
        self.multipath_a_m + self.multipath_b_m * (-el_deg / self.multipath_el0_deg).exp()
    }

    /// Code tracking 1-sigma (m) of the early-minus-late DLL; 0 without `cn0_dbhz`.
    pub fn dll_sigma_m(&self) -> f64 {
        match self.cn0_dbhz {
            None => 0.0,
            Some(db) => dll_code_noise_m(
                db,
                self.dll_bandwidth_hz,
                self.correlator_spacing_chips,
                self.coherent_integration_s,
                self.chip_length_m,
            ),
        }
    }

    /// The station multipath's epoch-to-epoch correlation for epochs `dt_s` apart:
    /// `exp(-dt / tau)`, or 0 (white) without `station_multipath_tau_s`.
    pub fn station_rho(&self, dt_s: f64) -> f64 {
        match self.station_multipath_tau_s {
            Some(t) => (-dt_s / t).exp(),
            None => 0.0,
        }
    }
}

/// Thermal code tracking noise (m) of a coherent early-minus-late DLL:
/// `L_c sqrt( B_L d / (2 C/N0) (1 + 2 / ((2 - d) T C/N0)) )`, `C/N0 = 10^(cn0_dbhz / 10)` Hz.
pub fn dll_code_noise_m(
    cn0_dbhz: f64,
    bandwidth_hz: f64,
    spacing_chips: f64,
    integration_s: f64,
    chip_m: f64,
) -> f64 {
    let c = 10f64.powf(cn0_dbhz / 10.0);
    let d = spacing_chips;
    chip_m * (bandwidth_hz * d / (2.0 * c) * (1.0 + 2.0 / ((2.0 - d) * integration_s * c))).sqrt()
}

#[cfg(test)]
mod tests {
    use super::*;

    fn cfg() -> ReceiverCfg {
        toml::from_str("").unwrap()
    }

    #[test]
    fn multipath_is_the_do229_form() {
        let c = cfg();
        assert!((c.multipath_sigma_m(0.0) - 0.66).abs() < 1e-12);
        assert!((c.multipath_sigma_m(10.0) - (0.13 + 0.53 / std::f64::consts::E)).abs() < 1e-12);
        assert!(c.multipath_sigma_m(90.0) < 0.1301);
    }

    /// Hand-worked: C/N0 = 45 dB-Hz (31622.78 Hz), B_L = 0.5 Hz, d = 1, T = 20 ms, one chip of
    /// 293.0522 m: sqrt(0.5 / 63245.55 (1 + 2 / 632.4555)) = 2.816149e-3 chips, 0.825279 m.
    #[test]
    fn dll_noise_matches_a_hand_computation() {
        let s = dll_code_noise_m(45.0, 0.5, 1.0, 0.02, 299_792_458.0 / 1.023e6);
        assert!((s - 0.825_279).abs() < 1e-5, "{s}");
        // Halving the bandwidth divides it by sqrt(2).
        let h = dll_code_noise_m(45.0, 0.25, 1.0, 0.02, 299_792_458.0 / 1.023e6);
        assert!((s / h - 2f64.sqrt()).abs() < 1e-12);
        assert_eq!(cfg().dll_sigma_m(), 0.0);
    }

    #[test]
    fn bad_sections_are_refused() {
        for bad in [
            "multipath_a_m = -1.0",
            "correlator_spacing_chips = 2.0",
            "station_multipath_tau_s = 0.0",
            "multipath_el0_deg = 0.0",
        ] {
            let c: ReceiverCfg = toml::from_str(bad).unwrap();
            assert!(c.validate().is_err(), "{bad}");
        }
        assert!(toml::from_str::<ReceiverCfg>("nope = 1").is_err());
        assert!(cfg().validate().is_ok());
    }
}
