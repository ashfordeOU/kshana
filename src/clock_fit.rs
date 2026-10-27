// SPDX-License-Identifier: AGPL-3.0-only
//! `[clock_fit]` on the clock kind: the simulated holdover driven by the user's own measured series.
//!
//! A `clock` scenario with a `[clock_log]` table already reports the log's stability (the `measured`
//! block) and leaves the simulated holdover alone. Adding
//!
//! ```toml
//! [clock_fit]
//! replaces = "classical"   # or "quantum"
//! ```
//!
//! fits a device card ([`DeviceCard::fit_phase`], the procedure of `src/clock_library/card.rs`, unchanged)
//! to the log's normalised phase and gives the named simulated clock the fitted noise:
//!
//! | clock parameter | from the card |
//! |---|---|
//! | `q_wf` | `h_0 / 2` (white FM) |
//! | `q_rw` | `2 pi^2 h_-2` (random-walk FM) |
//! | `flicker_floor` | `sqrt(2 ln 2 h_-1)` (the Allan-deviation floor of flicker FM) |
//! | `drift` | the card's linear frequency drift (1/s), signed |
//! | `y0` | **kept** from the scenario: a log carries the offset of its reference, not of the clock after discipline |
//!
//! White phase noise is fitted and reported but the two-state holdover model has no term for it, so it is
//! not simulated. A fit with no frequency noise at all is an error. The result gains a `fitted` block with
//! the card's coefficients and fit points, the values used, what was left out and the log's identity.
//! A scenario without `[clock_fit]` is unchanged, byte for byte.
//!
//! MODELLED. This is a what-if for that clock's noise as the log shows it, not a calibration of the clock
//! and not a prediction of its future behaviour. Pre-registration: `tests/fixtures/clock_fit/`.
use crate::clock_library::card::{CardPoint, DeviceCard};
use crate::clock_library::series::PhaseSeries;
use crate::clock_log::NormalisedPhase;
use crate::scenario::{ClockCfg, Scenario};
use serde::{Deserialize, Serialize};
use std::f64::consts::{LN_2, PI};

/// The scenario's `[clock_fit]` table.
#[derive(Clone, Debug, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct ClockFitInput {
    /// `quantum` or `classical`: the simulated clock whose noise the measured series replaces.
    pub replaces: String,
}

/// Evidence label of the `fitted` block.
pub const FITTED_LABEL: &str = "MODELLED — the named simulated clock's noise replaced by the noise \
    fitted from a measured phase log with the device-card procedure (src/clock_library/card.rs). A what-if \
    for that clock's noise as the log shows it: not a calibration of the clock or the counter, and not a \
    prediction of the clock's future behaviour. White phase noise is fitted but not simulated.";

/// The `fitted` block: what was fitted, what the simulation used, what it left out, and the log's identity.
#[derive(Clone, Debug, Serialize)]
pub struct FittedClockReport {
    /// Evidence label of the block.
    pub label: &'static str,
    /// `quantum` or `classical`.
    pub replaces: String,
    /// The id the replaced clock carries in the run.
    pub clock_id: String,
    /// Format of the log read.
    pub log_format: String,
    /// Sample interval of the normalised log (s).
    pub tau0_s: f64,
    /// Samples in the normalised log.
    pub n_used: usize,
    /// SHA-256 of the normalised phase samples (little-endian IEEE-754).
    pub phase_sha256: String,
    /// SHA-256 of the scenario's `[clock_log]` table as parsed.
    pub input_sha256: String,
    /// Fitted white phase-noise variance `s_PM^2` (s^2); fitted, not simulated.
    pub white_pm_var_s2: f64,
    /// IEEE Std 1139 `h_0` (white FM), fitted.
    pub h_0: f64,
    /// IEEE Std 1139 `h_-1` (flicker FM), fitted.
    pub h_m1: f64,
    /// IEEE Std 1139 `h_-2` (random-walk FM), fitted.
    pub h_m2: f64,
    /// Linear fractional-frequency drift of the fit (1/s), signed.
    pub drift_per_s: f64,
    /// The `q_wf` the simulation used (`h_0 / 2`).
    pub q_wf: f64,
    /// The `q_rw` the simulation used (`2 pi^2 h_-2`).
    pub q_rw: f64,
    /// The `flicker_floor` the simulation used (`sqrt(2 ln 2 h_-1)`).
    pub flicker_floor: f64,
    /// The `drift` the simulation used (the fit's, 1/s).
    pub drift: f64,
    /// The initial frequency offset the replaced clock kept from the scenario.
    pub y0_kept: f64,
    /// What was fitted and not simulated.
    pub not_simulated: Vec<&'static str>,
    /// The averaging points the card was fitted on.
    pub fit_points: Vec<CardPoint>,
}

/// Fit the log and give the scenario's named clock its noise. Returns the fit report.
pub fn apply(
    scn: &mut Scenario,
    log: &NormalisedPhase,
    input_sha256: String,
    inp: &ClockFitInput,
) -> Result<FittedClockReport, String> {
    let target: &mut ClockCfg = match inp.replaces.as_str() {
        "quantum" => &mut scn.clock_quantum,
        "classical" => &mut scn.clock_classical,
        other => {
            return Err(format!(
                "[clock_fit] replaces must be \"quantum\" or \"classical\" (got {other:?})"
            ))
        }
    };
    let phase_sha256 = log.phase_sha256();
    let id = format!("measured:{}", &phase_sha256[..12]);
    let series = PhaseSeries {
        t0: log.t0_s,
        tau0: log.tau0_s,
        x: log.phase_s.clone(),
    };
    let card = DeviceCard::fit_phase(&id, &series).map_err(|e| format!("[clock_fit]: {e}"))?;
    let q_wf = 0.5 * card.h_0;
    let q_rw = 2.0 * PI * PI * card.h_m2;
    let flicker_floor = (2.0 * LN_2 * card.h_m1).max(0.0).sqrt();
    if !(q_wf > 0.0 || q_rw > 0.0 || flicker_floor > 0.0) {
        return Err(
            "[clock_fit]: the fit has no frequency noise (white FM, flicker FM and random-walk FM are all \
             zero), so there is nothing to predict a holdover from; the log may be white phase noise only \
             or too short"
                .into(),
        );
    }
    let y0_kept = target.y0;
    target.id = id.clone();
    target.provenance = format!(
        "noise fitted from a measured phase log (SHA-256 of its phase {phase_sha256}) with the device-card \
         procedure of src/clock_library/card.rs: q_wf = h_0/2, q_rw = 2 pi^2 h_-2, flicker floor \
         sqrt(2 ln2 h_-1), drift as fitted; y0 kept from the scenario; white phase noise not simulated; MODELLED"
    );
    target.q_wf = q_wf;
    target.q_rw = q_rw;
    target.flicker_floor = flicker_floor;
    target.drift = card.drift_per_s;
    Ok(FittedClockReport {
        label: FITTED_LABEL,
        replaces: inp.replaces.clone(),
        clock_id: id,
        log_format: log.format.name().to_string(),
        tau0_s: log.tau0_s,
        n_used: log.n_used,
        phase_sha256,
        input_sha256,
        white_pm_var_s2: card.white_pm_var,
        h_0: card.h_0,
        h_m1: card.h_m1,
        h_m2: card.h_m2,
        drift_per_s: card.drift_per_s,
        q_wf,
        q_rw,
        flicker_floor,
        drift: card.drift_per_s,
        y0_kept,
        not_simulated: vec!["white phase noise"],
        fit_points: card.fit_points,
    })
}

/// Units and provenance of every numeric field of the `fitted` block, relative to the document root.
pub const FITTED_UNITS: &[crate::field_schema::FieldUnit] = {
    use crate::field_schema::{FieldUnit, ProvenanceClass::*};
    &[
        FieldUnit { path: "fitted.tau0_s", unit: "s", provenance: Computed, definition: "sample interval of the normalised measured log" },
        FieldUnit { path: "fitted.n_used", unit: "1", provenance: Computed, definition: "samples in the normalised measured log" },
        FieldUnit { path: "fitted.white_pm_var_s2", unit: "s^2", provenance: Computed, definition: "fitted white phase-noise variance; fitted, not simulated (the clock model has no white-PM term)" },
        FieldUnit { path: "fitted.h_0", unit: "s", provenance: Computed, definition: "fitted IEEE Std 1139 h_0, the white-FM level of the one-sided PSD of fractional frequency (1/Hz)" },
        FieldUnit { path: "fitted.h_m1", unit: "1", provenance: Computed, definition: "fitted IEEE Std 1139 h_-1, the flicker-FM level (dimensionless)" },
        FieldUnit { path: "fitted.h_m2", unit: "1/s", provenance: Computed, definition: "fitted IEEE Std 1139 h_-2, the random-walk-FM level (Hz)" },
        FieldUnit { path: "fitted.drift_per_s", unit: "1/s", provenance: Computed, definition: "linear fractional-frequency drift of the fit, signed" },
        FieldUnit { path: "fitted.q_wf", unit: "s", provenance: Computed, definition: "q_wf the simulated clock used: h_0 / 2, the white-FM phase-variance rate" },
        FieldUnit { path: "fitted.q_rw", unit: "1/s", provenance: Computed, definition: "q_rw the simulated clock used: 2 pi^2 h_-2, the random-walk-FM frequency-variance rate" },
        FieldUnit { path: "fitted.flicker_floor", unit: "1", provenance: Computed, definition: "flicker_floor the simulated clock used: the Allan-deviation floor sqrt(2 ln 2 h_-1) of flicker FM" },
        FieldUnit { path: "fitted.drift", unit: "1/s", provenance: Computed, definition: "drift the simulated clock used: the fit's linear fractional-frequency drift" },
        FieldUnit { path: "fitted.y0_kept", unit: "1", provenance: Input, definition: "initial fractional-frequency offset the replaced clock kept from the scenario" },
        FieldUnit { path: "fitted.fit_points[].tau_s", unit: "s", provenance: Computed, definition: "averaging time of a point the card was fitted on" },
        FieldUnit { path: "fitted.fit_points[].adev", unit: "1", provenance: Computed, definition: "measured overlapping Allan deviation at that averaging time" },
        FieldUnit { path: "fitted.fit_points[].edf", unit: "1", provenance: Computed, definition: "equivalent degrees of freedom of that point" },
        FieldUnit { path: "fitted.fit_points[].alpha", unit: "1", provenance: Computed, definition: "the lag-1 identified noise exponent at that point" },
    ]
};

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn an_unknown_target_is_refused_by_name() {
        let inp = ClockFitInput {
            replaces: "both".into(),
        };
        let toml = std::fs::read_to_string(concat!(
            env!("CARGO_MANIFEST_DIR"),
            "/scenarios/clock-holdover.toml"
        ))
        .unwrap();
        let mut scn: Scenario = toml::from_str(&toml).unwrap();
        let log = crate::clock_log::read_input(&crate::clock_log::ClockLogInput {
            format: "timelab".into(),
            text: Some("# tau0 = 1\n0\n1e-9\n2e-9\n".into()),
            ..Default::default()
        })
        .unwrap();
        let e = apply(&mut scn, &log, String::new(), &inp).unwrap_err();
        assert!(e.contains("\"both\"") && e.contains("quantum"), "{e}");
    }
}
