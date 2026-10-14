// SPDX-License-Identifier: AGPL-3.0-only
//! The receiver side of the `jamming` kind (CAP-06 (c)): the optional `[acquisition]` section
//! (acquisition-versus-tracking hysteresis) and the optional `[front_end]` section (the AGC
//! reading and the ADC's quantiser loss), pre-registered in
//! `docs/design/evidence/jamming-acq-agc/PREREGISTRATION.md`.
//!
//! **Acquisition.** A visible satellite that is not acquired becomes acquired at an epoch
//! where its effective C/N₀ is at or above `acquisition_threshold_dbhz` and it has been not
//! acquired for at least `reacquisition_delay_s` (a satellite never acquired counts from
//! t = 0). An acquired satellite stays acquired while it is visible and at or above the
//! tracking threshold. The threshold is the whole acquisition model: no search, dwell or
//! false alarm.
//!
//! **Front end.** The AGC holds the ADC input at the loss-minimising level for a Gaussian
//! input ([`crate::iq::frontend::quant::optimum_step_sigma`]). The AGC turns its gain down by
//! `10·log10(1 + J/N)` for a jammer of received power `J` over the noise `kT·B`, and every link
//! loses the quantiser's correlation loss. That loss is exact for noise plus a noise-like
//! (`broadband`) jammer and not valid for CW, narrowband or swept jammers, which the run flags.

use serde::{Deserialize, Serialize};

/// The `[acquisition]` section of a `jamming` scenario.
#[derive(Clone, Debug, Deserialize, Serialize)]
#[serde(deny_unknown_fields)]
pub struct AcquisitionCfg {
    /// Effective C/N₀ a satellite needs to be (re)acquired (dB-Hz); at or above the tracking
    /// threshold.
    pub acquisition_threshold_dbhz: f64,
    /// Time a satellite must have been not acquired before it can be re-acquired (s).
    #[serde(default)]
    pub reacquisition_delay_s: f64,
}

impl AcquisitionCfg {
    /// Check the section against the scenario's tracking threshold.
    pub fn check(&self, tracking_threshold_dbhz: f64) -> Result<(), String> {
        if !(self.acquisition_threshold_dbhz.is_finite()
            && self.acquisition_threshold_dbhz >= tracking_threshold_dbhz)
        {
            return Err(format!(
                "acquisition.acquisition_threshold_dbhz ({}) must be finite and at or above \
                 tracking_threshold_dbhz ({tracking_threshold_dbhz})",
                self.acquisition_threshold_dbhz
            ));
        }
        if !(self.reacquisition_delay_s.is_finite() && self.reacquisition_delay_s >= 0.0) {
            return Err(format!(
                "acquisition.reacquisition_delay_s must be finite and non-negative (got {})",
                self.reacquisition_delay_s
            ));
        }
        Ok(())
    }
}

/// One satellite's acquisition state across epochs.
#[derive(Clone, Copy, Debug)]
pub struct AcqState {
    acquired: bool,
    /// Time of the first epoch of the current not-acquired stretch (s).
    not_acquired_since: f64,
}

impl Default for AcqState {
    /// Not acquired since t = 0.
    fn default() -> Self {
        Self {
            acquired: false,
            not_acquired_since: 0.0,
        }
    }
}

impl AcqState {
    /// Advance to epoch `t` where the satellite is visible with effective C/N₀ `cn0_dbhz`;
    /// returns whether it is acquired at `t`.
    pub fn visible(
        &mut self,
        cfg: &AcquisitionCfg,
        tracking_threshold_dbhz: f64,
        t: f64,
        cn0_dbhz: f64,
    ) -> bool {
        if self.acquired {
            if cn0_dbhz < tracking_threshold_dbhz {
                self.acquired = false;
                self.not_acquired_since = t;
            }
        } else if cn0_dbhz >= cfg.acquisition_threshold_dbhz
            && t - self.not_acquired_since >= cfg.reacquisition_delay_s
        {
            self.acquired = true;
        }
        self.acquired
    }

    /// Advance to epoch `t` where the satellite is not visible.
    pub fn not_visible(&mut self, t: f64) {
        if self.acquired {
            self.acquired = false;
            self.not_acquired_since = t;
        }
    }
}

/// The `[front_end]` section of a `jamming` scenario.
#[derive(Clone, Debug, Deserialize, Serialize)]
#[serde(deny_unknown_fields)]
pub struct FrontEndCfg {
    /// ADC resolution (bits), 1 to 16.
    pub adc_bits: u32,
    /// Front-end noise bandwidth for the AGC's J/N (MHz); default twice the chip rate.
    #[serde(default, skip_serializing_if = "Option::is_none")]
    pub bandwidth_mhz: Option<f64>,
}

impl FrontEndCfg {
    /// Check the section's numbers.
    pub fn check(&self) -> Result<(), String> {
        if !(1..=16).contains(&self.adc_bits) {
            return Err(format!(
                "front_end.adc_bits must be 1 to 16 (got {})",
                self.adc_bits
            ));
        }
        if let Some(b) = self.bandwidth_mhz {
            if !(b.is_finite() && b > 0.0) {
                return Err(format!(
                    "front_end.bandwidth_mhz must be positive (got {b})"
                ));
            }
        }
        Ok(())
    }
}

/// The `front_end` block of a run with a `[front_end]` section.
#[derive(Clone, Debug, Serialize)]
pub struct FrontEnd {
    /// How far the AGC turns its gain down because of the jammer, `10·log10(1 + J/N)` (dB).
    pub agc_gain_reduction_db: f64,
    /// The ADC's minimum correlation loss for a Gaussian input (dB), taken off every link's
    /// effective C/N₀.
    pub quantiser_loss_db: f64,
    /// `"gaussian-input"` with no jammer or a `broadband` one;
    /// `"gaussian-input-not-valid-for-this-jammer"` otherwise.
    pub loss_model: String,
}

/// The front-end block for `cfg`, a jammer of received power `jammer_dbw` (dBW, `None` with no
/// jammer) and type `jammer_type`, thermal noise density `n0_dbw_per_hz` and chip rate
/// `chip_rate_hz`.
pub fn front_end(
    cfg: &FrontEndCfg,
    jammer: Option<(f64, &str)>,
    n0_dbw_per_hz: f64,
    chip_rate_hz: f64,
) -> FrontEnd {
    let b_hz = cfg.bandwidth_mhz.map_or(2.0 * chip_rate_hz, |b| b * 1e6);
    let noise_dbw = n0_dbw_per_hz + 10.0 * b_hz.log10();
    let agc_gain_reduction_db = jammer.map_or(0.0, |(j_dbw, _)| {
        10.0 * (1.0 + 10f64.powf((j_dbw - noise_dbw) / 10.0)).log10()
    });
    let gaussian = jammer.is_none_or(|(_, kind)| kind == "broadband");
    FrontEnd {
        agc_gain_reduction_db,
        quantiser_loss_db: crate::iq::frontend::quant::optimum_step_sigma(cfg.adc_bits).1,
        loss_model: if gaussian {
            "gaussian-input"
        } else {
            "gaussian-input-not-valid-for-this-jammer"
        }
        .into(),
    }
}

/// Units of the `[acquisition]` outputs, emitted only with that section.
pub const ACQUISITION_UNITS: &[crate::field_schema::FieldUnit] = {
    use crate::field_schema::{FieldUnit, ProvenanceClass::*};
    &[
        FieldUnit {
            path: "epochs[].acquired",
            unit: "count",
            provenance: Computed,
            definition: "visible satellites acquired at this epoch under the acquisition \
                         section's hysteresis (acquired at or above the acquisition threshold \
                         after the re-acquisition delay, held while at or above the tracking \
                         threshold)",
        },
        FieldUnit {
            path: "fom.availability_acquired",
            unit: "1",
            provenance: Computed,
            definition: "fraction of epochs with at least four acquired satellites",
        },
    ]
};

/// Units of the `front_end` block, emitted only with a `[front_end]` section.
pub const FRONT_END_UNITS: &[crate::field_schema::FieldUnit] = {
    use crate::field_schema::{FieldUnit, ProvenanceClass::*};
    &[
        FieldUnit {
            path: "front_end.agc_gain_reduction_db",
            unit: "dB",
            provenance: Computed,
            definition: "how far the AGC turns its gain down because of the jammer, \
                         10 log10(1 + J/N) with J the jammer's received power and N the \
                         thermal noise power in the front-end bandwidth; 0 with no jammer",
        },
        FieldUnit {
            path: "front_end.quantiser_loss_db",
            unit: "dB",
            provenance: Computed,
            definition: "minimum correlation loss of the ADC for a Gaussian input, taken off \
                         every link's cn0_effective_dbhz; not valid for a non-Gaussian jammer \
                         (see loss_model)",
        },
    ]
};

#[cfg(test)]
mod tests {
    use super::*;

    fn cfg(acq: f64, delay: f64) -> AcquisitionCfg {
        AcquisitionCfg {
            acquisition_threshold_dbhz: acq,
            reacquisition_delay_s: delay,
        }
    }

    #[test]
    fn a_satellite_is_held_between_the_thresholds_and_reacquired_after_the_delay() {
        let c = cfg(32.0, 60.0);
        let mut s = AcqState::default();
        // Strong at t = 0 but the delay counts from t = 0: not yet.
        assert!(!s.visible(&c, 25.0, 0.0, 40.0));
        assert!(s.visible(&c, 25.0, 60.0, 40.0));
        // Held between the thresholds, lost below the tracking one.
        assert!(s.visible(&c, 25.0, 90.0, 28.0));
        assert!(!s.visible(&c, 25.0, 120.0, 24.0));
        // Strong again, but only 30 s and then 59 s after the loss.
        assert!(!s.visible(&c, 25.0, 150.0, 40.0));
        assert!(!s.visible(&c, 25.0, 179.0, 40.0));
        assert!(s.visible(&c, 25.0, 180.0, 40.0));
        s.not_visible(210.0);
        assert!(!s.visible(&c, 25.0, 240.0, 40.0));
    }

    #[test]
    fn a_broadband_jammer_keeps_the_gaussian_loss_model() {
        let f = FrontEndCfg {
            adc_bits: 2,
            bandwidth_mhz: None,
        };
        let n0 = -204.0;
        let noise = n0 + 10.0 * (2.046e6f64).log10();
        let fe = front_end(&f, Some((noise, "broadband")), n0, 1.023e6);
        assert!((fe.agc_gain_reduction_db - 10.0 * 2f64.log10()).abs() < 1e-12);
        assert_eq!(fe.loss_model, "gaussian-input");
        assert_eq!(
            front_end(&f, Some((noise, "cw")), n0, 1.023e6).loss_model,
            "gaussian-input-not-valid-for-this-jammer"
        );
        assert_eq!(front_end(&f, None, n0, 1.023e6).agc_gain_reduction_db, 0.0);
    }
}
