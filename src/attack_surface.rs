// SPDX-License-Identifier: AGPL-3.0-only
//! Lunar surface-navigation **attack-surface** scenario (P1): the binary-reachable
//! (`run_toml` / CLI / Python / MCP) face that composes the open signal-security analyses
//! into one run. `kind = "lunar-attack-surface"`.
//!
//! It stitches together six Validated open modules — nothing here re-derives their maths;
//! this module only *composes* them so the whole P1 picture is producible from a single
//! scenario document:
//!
//!  * **Link-budget deficit + 12–18 dB sensitivity band** — [`crate::linkbudget`]
//!    ([`received_signal_power_dbw`], [`deficit_sensitivity_band`]): the AFS received power,
//!    its deficit versus a terrestrial GPS reference, and the multi-axis sensitivity band
//!    with the 32×/36× (rounded/unrounded) linear-factor reconciliation.
//!  * **Required jam/spoof transmit power vs standoff** — [`crate::jamming::required_tx_power_dbw`]:
//!    the inverse-J/S transmit power an attacker needs to spoof (J/S = 3 dB) or deny
//!    (J/S = 30 dB) at each standoff.
//!  * **Orbital capture footprint under a real antenna pattern** — [`crate::antenna::capture_footprint`]:
//!    the pattern-weighted, altitude-limited surface cap an orbital transmitter captures
//!    (refuting whole-hemisphere denial).
//!  * **Tracking-loop spoof-capture pull-in** — [`crate::spoof_capture::run_capture`]:
//!    whether a matched-code spoofer at a given power advantage and code offset actually
//!    drags the receiver's DLL/PLL (a computed capture, not the asserted 3 dB threshold).
//!  * **Airless-body horizon reach** — [`crate::lunar::surface_los_max_m`]: the purely
//!    geometric surface-transmitter reach on an atmosphere-free Moon.
//!  * **OSNMA/TESLA authentication budget** — [`crate::nma_budget::budget`]: the 20 bit/s
//!    OSNMA overhead, its first-order (~40 %) fraction of a low-rate AFS nav message, and
//!    the key-disclosure latency / forgery figures.
//!
//! An **empty TOML body** (only `kind = "lunar-attack-surface"`) reproduces the P1 baseline;
//! every input is an overridable, defaulted field. The scenario is deterministic (no random
//! state): the one seeded element, the spoof-capture pull-in, uses a fixed seed and no
//! thermal noise. VALIDATED sub-results carry the oracle of the module they come from;
//! MODELLED sub-results (the representative geometry / power inputs) are flagged as such in
//! the emitted JSON.

use crate::antenna::{
    capture_footprint, capture_footprint_sweep, FootprintParams, FootprintSweepResult,
};
use crate::jamming::required_tx_power_dbw;
use crate::linkbudget::{deficit_sensitivity_band, received_signal_power_dbw};
use crate::lunar::{horizon_los_distance_m, surface_los_max_m, R_MOON_M};
use crate::nma_budget::{budget as nma_budget, NmaConfig};
use crate::spoof_capture::{run_capture, CaptureConfig};
use crate::sweep::SweepAxis;
use serde::{Deserialize, Serialize};

/// Unit and provenance class for every numeric field the `lunar-attack-surface` report
/// emits.
///
/// The `crossings[]` rows are described too, although the shipped grid reaches no limb
/// crossing and the array is therefore empty at the defaults: both swept axes of this
/// pack are lengths in metres, so a crossing coordinate has a settled unit whether or
/// not one is ever emitted.
const UNITS: &[crate::field_schema::FieldUnit] = {
    use crate::field_schema::{FieldUnit, ProvenanceClass::*};
    &[
        FieldUnit {
            path: "afs_received_dbw",
            unit: "dBW",
            provenance: ClosedForm,
            definition: "AFS signal power received by the surface user: satellite EIRP plus \
                         user antenna gain minus the free-space path loss at the slant range \
                         and carrier",
        },
        FieldUnit {
            path: "deficit_db",
            unit: "dB",
            provenance: ClosedForm,
            definition: "how far the AFS received power sits below the terrestrial GPS \
                         reference level: gps_reference_dbw - afs_received_dbw",
        },
        FieldUnit {
            path: "deficit_band_lo_db",
            unit: "dB",
            provenance: Computed,
            definition: "smallest deficit found over the reference-level x EIRP x slant-range \
                         sensitivity sweep",
        },
        FieldUnit {
            path: "deficit_band_hi_db",
            unit: "dB",
            provenance: Computed,
            definition: "largest deficit found over that same sweep",
        },
        FieldUnit {
            path: "deficit_factor_unrounded",
            unit: "1",
            provenance: ClosedForm,
            definition: "the nominal deficit expressed as a linear power ratio at full \
                         precision, 10^(nominal_deficit_db/10) — the ~36x figure",
        },
        FieldUnit {
            path: "deficit_factor_rounded",
            unit: "1",
            provenance: ClosedForm,
            definition: "the same linear power ratio with the deficit first truncated to a \
                         whole dB, 10^(trunc(nominal_deficit_db)/10) — the ~32x figure",
        },
        FieldUnit {
            path: "standoff_curve[].standoff_m",
            unit: "m",
            provenance: Input,
            definition: "attacker-to-victim distance this row sizes the required transmit power \
                         at",
        },
        FieldUnit {
            path: "standoff_curve[].spoof_tx_power_dbw",
            unit: "dBW",
            provenance: ClosedForm,
            definition: "transmit power an attacker needs at this standoff to reach the \
                         spoof-capture jammer-to-signal ratio (default 3 dB) at the victim; the \
                         inverse of the J/S link equation",
        },
        FieldUnit {
            path: "standoff_curve[].jam_tx_power_dbw",
            unit: "dBW",
            provenance: ClosedForm,
            definition: "transmit power needed at this standoff to reach the denial \
                         jammer-to-signal ratio (default 30 dB) at the victim",
        },
        FieldUnit {
            path: "standoff_curve[].spoof_tx_power_w",
            unit: "W",
            provenance: ClosedForm,
            definition: "spoof_tx_power_dbw expressed in watts, 10^(dBW/10)",
        },
        FieldUnit {
            path: "footprint_captured_fraction",
            unit: "1",
            provenance: Computed,
            definition: "fraction of the visible lunar disk, out to the limb and area-weighted \
                         by sin(central angle), on which the orbital transmitter's J/S meets \
                         the capture threshold",
        },
        FieldUnit {
            path: "footprint_boresight_gain_dbi",
            unit: "dBi",
            provenance: ClosedForm,
            definition: "boresight gain of the orbital transmit aperture, 10*log10(efficiency * \
                         (pi * D / lambda)^2)",
        },
        FieldUnit {
            path: "spoof_lock_time_s",
            unit: "s",
            provenance: Computed,
            definition: "time from the start of the pull-in run at which the tracking loop \
                         first settled, and stayed, within tolerance of the signal it ended on; \
                         null when it never settled",
        },
        FieldUnit {
            path: "surface_transmitter_reach_m",
            unit: "m",
            provenance: ClosedForm,
            definition: "line-of-sight reach of the raised surface transmitter to the user \
                         antenna over an airless sphere: sqrt(2Rh + h^2) summed over the two \
                         heights at the lunar radius",
        },
        FieldUnit {
            path: "orbital_horizon_los_m",
            unit: "m",
            provenance: ClosedForm,
            definition: "the orbital transmitter's own straight-line tangent distance to the \
                         lunar horizon, sqrt(2Rh + h^2)",
        },
        FieldUnit {
            path: "nma_overhead_bps",
            unit: "bit/s",
            provenance: Spec,
            definition: "OSNMA authentication overhead, (MACK + HKROOT bits) / subframe = 600 \
                         bit / 30 s, reproducing the published Galileo OSNMA Signal-in-Space \
                         ICD field sizing",
        },
        FieldUnit {
            path: "nma_overhead_fraction",
            unit: "1",
            provenance: Computed,
            definition: "that overhead as a fraction of the nav-data rate it is measured \
                         against; the 50 bit/s AFS denominator is a Modelled representative \
                         rate, so the fraction is dimensionless but its magnitude rests on that \
                         assumption",
        },
        FieldUnit {
            path: "nma_auth_latency_s",
            unit: "s",
            provenance: Spec,
            definition: "TESLA key-disclosure delay before a received message can be \
                         authenticated: subframe duration times the disclosure lag (30 s x 1)",
        },
        FieldUnit {
            path: "footprint_limb_js_db",
            unit: "dB",
            provenance: Computed,
            definition: "jammer-to-signal ratio the orbital transmitter delivers at the limb at \
                         the baseline operating point",
        },
        FieldUnit {
            path: "footprint_limb_margin_db",
            unit: "dB",
            provenance: Computed,
            definition: "footprint_limb_js_db minus the capture threshold; negative means the \
                         limb falls short by that many dB",
        },
        FieldUnit {
            path: "footprint_limb_capture_tx_power_dbw",
            unit: "dBW",
            provenance: ClosedForm,
            definition: "transmit power at which the baseline operating point would capture the \
                         limb: p_tx + (capture threshold - limb J/S), exact because J/S moves \
                         dB for dB with transmit power",
        },
        FieldUnit {
            path: "footprint_sweep.axes[].start",
            unit: "m",
            provenance: Input,
            definition: "first sample of a swept axis; both axes of this sweep are lengths in \
                         metres (transmitter altitude, then transmit-dish diameter)",
        },
        FieldUnit {
            path: "footprint_sweep.axes[].stop",
            unit: "m",
            provenance: Input,
            definition: "last sample of that axis; likewise a length in metres for both axes of \
                         this sweep",
        },
        FieldUnit {
            path: "footprint_sweep.axes[].steps",
            unit: "count",
            provenance: Input,
            definition: "number of samples taken along that axis",
        },
        FieldUnit {
            path: "footprint_sweep.shape[]",
            unit: "count",
            provenance: Computed,
            definition: "samples per axis, in axis order; their product is the number of rows \
                         in points",
        },
        FieldUnit {
            path: "footprint_sweep.altitude_m_values[]",
            unit: "m",
            provenance: Computed,
            definition: "the transmitter-altitude samples above the mean lunar surface the grid \
                         was evaluated at",
        },
        FieldUnit {
            path: "footprint_sweep.diameter_m_values[]",
            unit: "m",
            provenance: Computed,
            definition: "the transmit-dish diameter samples the grid was evaluated at",
        },
        FieldUnit {
            path: "footprint_sweep.hpbw_deg_values[]",
            unit: "deg",
            provenance: ClosedForm,
            definition: "the half-power beamwidth each diameter sample implies at the carrier",
        },
        FieldUnit {
            path: "footprint_sweep.freq_hz",
            unit: "Hz",
            provenance: Input,
            definition: "carrier frequency held fixed across the grid",
        },
        FieldUnit {
            path: "footprint_sweep.p_tx_dbw",
            unit: "dBW",
            provenance: Input,
            definition: "transmit power fed to the antenna, held fixed across the grid",
        },
        FieldUnit {
            path: "footprint_sweep.capture_threshold_db",
            unit: "dB",
            provenance: ModelledInput,
            definition: "the jammer-to-signal ratio at which a spoofer is taken to capture a \
                         surface victim (3 dB), held fixed across the grid; a stated criterion, \
                         not a measurement",
        },
        FieldUnit {
            path: "footprint_sweep.points[].altitude_m",
            unit: "m",
            provenance: Computed,
            definition: "transmitter altitude above the mean lunar surface at this grid row",
        },
        FieldUnit {
            path: "footprint_sweep.points[].diameter_m",
            unit: "m",
            provenance: Computed,
            definition: "transmit-dish diameter at this grid row",
        },
        FieldUnit {
            path: "footprint_sweep.points[].hpbw_rad",
            unit: "rad",
            provenance: ClosedForm,
            definition: "half-power beamwidth this diameter implies at the carrier, \
                         approximately 1.02 * lambda / D",
        },
        FieldUnit {
            path: "footprint_sweep.points[].hpbw_deg",
            unit: "deg",
            provenance: ClosedForm,
            definition: "that same half-power beamwidth in degrees",
        },
        FieldUnit {
            path: "footprint_sweep.points[].boresight_gain_dbi",
            unit: "dBi",
            provenance: ClosedForm,
            definition: "boresight gain of the aperture at this diameter, 10*log10(efficiency * \
                         (pi * D / lambda)^2)",
        },
        FieldUnit {
            path: "footprint_sweep.points[].horizon_central_angle_rad",
            unit: "rad",
            provenance: ClosedForm,
            definition: "central angle at the Moon's centre from the nadir point to the limb at \
                         this altitude, acos(R / (R + h))",
        },
        FieldUnit {
            path: "footprint_sweep.points[].captured_fraction",
            unit: "1",
            provenance: Computed,
            definition: "area-weighted fraction of the visible disk captured at this operating \
                         point",
        },
        FieldUnit {
            path: "footprint_sweep.points[].limb_js_db",
            unit: "dB",
            provenance: Computed,
            definition: "jammer-to-signal ratio delivered at the limb at this operating point",
        },
        FieldUnit {
            path: "footprint_sweep.points[].limb_margin_db",
            unit: "dB",
            provenance: Computed,
            definition: "limb_js_db minus the capture threshold at this operating point; \
                         negative means the limb falls short by that many dB",
        },
        FieldUnit {
            path: "footprint_sweep.points[].limb_capture_tx_power_dbw",
            unit: "dBW",
            provenance: ClosedForm,
            definition: "transmit power at which this operating point would capture the limb: \
                         p_tx + (capture threshold - limb J/S)",
        },
        FieldUnit {
            path: "footprint_sweep.limb_threshold.best_limb_js_db",
            unit: "dB",
            provenance: Computed,
            definition: "highest limb jammer-to-signal ratio found at any sampled point of the \
                         grid",
        },
        FieldUnit {
            path: "footprint_sweep.limb_threshold.best_limb_shortfall_db",
            unit: "dB",
            provenance: Computed,
            definition: "how far that best point sits below the capture threshold; positive \
                         while the limb is never captured on the grid",
        },
        FieldUnit {
            path: "footprint_sweep.limb_threshold.best_altitude_m",
            unit: "m",
            provenance: Computed,
            definition: "transmitter altitude of that best grid point",
        },
        FieldUnit {
            path: "footprint_sweep.limb_threshold.best_diameter_m",
            unit: "m",
            provenance: Computed,
            definition: "transmit-dish diameter of that best grid point",
        },
        FieldUnit {
            path: "footprint_sweep.limb_threshold.best_hpbw_deg",
            unit: "deg",
            provenance: ClosedForm,
            definition: "half-power beamwidth at that best grid point",
        },
        FieldUnit {
            path: "footprint_sweep.limb_threshold.best_limb_capture_tx_power_dbw",
            unit: "dBW",
            provenance: Computed,
            definition: "transmit power at which that best grid point would capture the limb",
        },
        FieldUnit {
            path: "footprint_sweep.limb_threshold.crossings[].value",
            unit: "m",
            provenance: Computed,
            definition: "the located limb-capture boundary coordinate on the swept axis; both \
                         axes of this sweep are lengths in metres, so this is a metre \
                         coordinate either way",
        },
        FieldUnit {
            path: "footprint_sweep.limb_threshold.crossings[].hpbw_deg",
            unit: "deg",
            provenance: ClosedForm,
            definition: "half-power beamwidth at that located crossing",
        },
        FieldUnit {
            path: "footprint_sweep.limb_threshold.crossings[].held_value",
            unit: "m",
            provenance: Computed,
            definition: "value of the axis held fixed while the crossing was bisected; likewise \
                         a length in metres for both axes of this sweep",
        },
        FieldUnit {
            path: "footprint_sweep.limb_threshold.crossings[].limb_js_db",
            unit: "dB",
            provenance: Computed,
            definition: "limb jammer-to-signal ratio at the located crossing, equal to the \
                         capture threshold to bisection precision",
        },
    ]
};

fn d_afs_eirp_dbw() -> f64 {
    26.0
}
fn d_user_gain_dbi() -> f64 {
    3.0
}
fn d_slant_range_m() -> f64 {
    3.0e6
}
fn d_slant_range_max_m() -> f64 {
    // 3000 km × 10^(2.4/20): the +2.4 dB slant-range spread of the deficit band.
    3.0e6 * 1.318_256_738_556_407
}
fn d_carrier_hz() -> f64 {
    2.4e9
}
/// Terrestrial GPS L1 C/A received power, TYPICAL, in dBW.
///
/// This was `-125.0` — which is the figure in **dBm**, not dBW, and is 30 dB too strong.
/// The same 30 dB error sat in the specification minimum below, and the pair was the
/// entire basis of P1's published "15.6 dB lunar power deficit". Correcting the unit
/// inverts the sign of that result: the modelled lunar AFS signal is not weaker than
/// terrestrial GPS, it is stronger. See `gps_reference_agrees_with_the_jamming_module`
/// for the guard that now makes the two engine copies of this quantity agree.
fn d_gps_reference_dbw() -> f64 {
    -155.0
}
/// Terrestrial GPS L1 C/A received power, SPECIFICATION MINIMUM, in dBW.
///
/// ICD-GPS-200: -158.5 dBW at the Earth's surface for a 0 dBic antenna at 5 degrees
/// elevation, worst case. This is the same constant the jamming module has always
/// carried correctly as [`crate::jamming::DEFAULT_SIGNAL_POWER_DBW`]; it was `-128.5`
/// here, which is that value in dBm.
fn d_gps_reference_min_dbw() -> f64 {
    crate::jamming::DEFAULT_SIGNAL_POWER_DBW
}
fn d_afs_isotropic_signal_dbw() -> f64 {
    -143.6
}
fn d_transmitter_altitude_m() -> f64 {
    100_000.0
}
fn d_transmitter_power_dbw() -> f64 {
    // 40 W = 16.0206 dBW.
    10.0 * 40.0_f64.log10()
}
fn d_antenna_diameter_m() -> f64 {
    1.0
}
fn d_footprint_grid() -> usize {
    400
}
fn d_spoof_power_advantage_db() -> f64 {
    6.0
}
fn d_spoof_code_offset_chips() -> f64 {
    0.3
}
fn d_attacker_gain_dbi() -> f64 {
    6.0
}
fn d_spoof_capture_js_db() -> f64 {
    3.0
}
fn d_jam_denial_js_db() -> f64 {
    30.0
}
fn d_standoffs_m() -> Vec<f64> {
    vec![1_000.0, 10_000.0, 100_000.0]
}
fn d_mast_height_m() -> f64 {
    100.0
}
fn d_user_antenna_height_m() -> f64 {
    1.6
}
// --- capture-footprint sweep axes (additive; the baseline point is ON the grid) -------
// Altitude: a linear 20–500 km ladder in 80 km steps. Linear, not log, for a reason worth
// stating: 20 000 + 480 000·(i/6) lands on 100 000.0 m EXACTLY in IEEE-754 at i = 1, so
// the P1 baseline altitude is a *sample* of the grid rather than a value the grid nearly
// hits. A log axis over the same span misses it by ~1e-11 m and the grid would then only
// approximate the operating point it is supposed to contain.
fn d_footprint_altitude_min_m() -> f64 {
    20_000.0
}
fn d_footprint_altitude_max_m() -> f64 {
    500_000.0
}
fn d_footprint_altitude_steps() -> usize {
    7
}
fn d_footprint_altitude_scale() -> String {
    "linear".to_string()
}
// Diameter: a log ladder 0.25–4 m, i.e. beamwidths 29.2°–1.83° at 2.4 GHz, doubling each
// step. exp(½·(ln 0.25 + ln 4)) is exactly 1.0, so the baseline 1 m dish is likewise a
// sample and not an approximation.
fn d_footprint_diameter_min_m() -> f64 {
    0.25
}
fn d_footprint_diameter_max_m() -> f64 {
    4.0
}
fn d_footprint_diameter_steps() -> usize {
    5
}
fn d_footprint_diameter_scale() -> String {
    "log".to_string()
}

/// Composed lunar attack-surface scenario. Every field defaults to the P1 baseline, so an
/// empty TOML body (bar `kind`) reproduces the paper's headline figures.
#[derive(Clone, Debug, Deserialize)]
pub struct LunarAttackSurfaceScenario {
    /// AFS satellite EIRP (dBW).
    #[serde(default = "d_afs_eirp_dbw")]
    pub afs_eirp_dbw: f64,
    /// Surface-user antenna gain (dBi).
    #[serde(default = "d_user_gain_dbi")]
    pub user_gain_dbi: f64,
    /// Nominal AFS slant range (m).
    #[serde(default = "d_slant_range_m")]
    pub slant_range_m: f64,
    /// Upper slant range for the deficit-band sweep (m).
    #[serde(default = "d_slant_range_max_m")]
    pub slant_range_max_m: f64,
    /// Carrier frequency (Hz).
    #[serde(default = "d_carrier_hz")]
    pub carrier_hz: f64,
    /// Terrestrial GPS reference received power, strong end (dBW).
    #[serde(default = "d_gps_reference_dbw")]
    pub gps_reference_dbw: f64,
    /// Terrestrial GPS reference received power, weak end (dBW).
    #[serde(default = "d_gps_reference_min_dbw")]
    pub gps_reference_min_dbw: f64,
    /// AFS isotropic received signal power (dBW), for the inverse-J/S solver.
    #[serde(default = "d_afs_isotropic_signal_dbw")]
    pub afs_isotropic_signal_dbw: f64,
    /// Orbital transmitter altitude (m).
    #[serde(default = "d_transmitter_altitude_m")]
    pub transmitter_altitude_m: f64,
    /// Orbital transmitter power fed to the antenna (dBW).
    #[serde(default = "d_transmitter_power_dbw")]
    pub transmitter_power_dbw: f64,
    /// Orbital transmit-antenna diameter (m).
    #[serde(default = "d_antenna_diameter_m")]
    pub antenna_diameter_m: f64,
    /// Footprint grid points nadir→limb.
    #[serde(default = "d_footprint_grid")]
    pub footprint_grid: usize,
    /// Spoofer power advantage over the authentic signal (dB).
    #[serde(default = "d_spoof_power_advantage_db")]
    pub spoof_power_advantage_db: f64,
    /// Spoofer code offset from the authentic code phase (chips).
    #[serde(default = "d_spoof_code_offset_chips")]
    pub spoof_code_offset_chips: f64,
    /// Attacker transmit-antenna gain (dBi).
    #[serde(default = "d_attacker_gain_dbi")]
    pub attacker_gain_dbi: f64,
    /// J/S at which a spoofer captures a victim (dB).
    #[serde(default = "d_spoof_capture_js_db")]
    pub spoof_capture_js_db: f64,
    /// J/S at which a jammer denies a victim (dB).
    #[serde(default = "d_jam_denial_js_db")]
    pub jam_denial_js_db: f64,
    /// Attacker standoffs to size required transmit power at (m).
    #[serde(default = "d_standoffs_m")]
    pub standoffs_m: Vec<f64>,
    /// Raised surface-transmitter (mast/ridge) height (m).
    #[serde(default = "d_mast_height_m")]
    pub mast_height_m: f64,
    /// Surface user's antenna height (m).
    #[serde(default = "d_user_antenna_height_m")]
    pub user_antenna_height_m: f64,
    /// Capture-footprint sweep: lowest transmitter altitude on the grid (m).
    #[serde(default = "d_footprint_altitude_min_m")]
    pub footprint_altitude_min_m: f64,
    /// Capture-footprint sweep: highest transmitter altitude on the grid (m).
    #[serde(default = "d_footprint_altitude_max_m")]
    pub footprint_altitude_max_m: f64,
    /// Capture-footprint sweep: altitude samples (≥ 2).
    #[serde(default = "d_footprint_altitude_steps")]
    pub footprint_altitude_steps: usize,
    /// Capture-footprint sweep: altitude axis spacing, `linear` or `log`.
    #[serde(default = "d_footprint_altitude_scale")]
    pub footprint_altitude_scale: String,
    /// Capture-footprint sweep: smallest transmit dish on the grid (m) — the *widest* beam.
    #[serde(default = "d_footprint_diameter_min_m")]
    pub footprint_diameter_min_m: f64,
    /// Capture-footprint sweep: largest transmit dish on the grid (m) — the *narrowest* beam.
    #[serde(default = "d_footprint_diameter_max_m")]
    pub footprint_diameter_max_m: f64,
    /// Capture-footprint sweep: diameter (beamwidth) samples (≥ 2).
    #[serde(default = "d_footprint_diameter_steps")]
    pub footprint_diameter_steps: usize,
    /// Capture-footprint sweep: diameter axis spacing, `linear` or `log`.
    #[serde(default = "d_footprint_diameter_scale")]
    pub footprint_diameter_scale: String,
}

impl Default for LunarAttackSurfaceScenario {
    fn default() -> Self {
        toml::from_str("").expect("empty attack-surface scenario deserialises to defaults")
    }
}

/// Required-transmit-power point on the standoff curve.
#[derive(Clone, Copy, Debug, Serialize)]
pub struct StandoffPoint {
    /// Attacker standoff (m).
    pub standoff_m: f64,
    /// Transmit power to spoof (reach J/S = `spoof_capture_js_db`) at this standoff (dBW).
    pub spoof_tx_power_dbw: f64,
    /// Transmit power to deny (reach J/S = `jam_denial_js_db`) at this standoff (dBW).
    pub jam_tx_power_dbw: f64,
    /// Spoof transmit power in watts.
    pub spoof_tx_power_w: f64,
}

/// The composed attack-surface result. All sub-results are Validated at the module they
/// come from; the input geometry/power magnitudes are Modelled.
#[derive(Clone, Debug, Serialize)]
pub struct AttackSurface {
    // Link-budget deficit + sensitivity band (Validated: closed-form dB radiometry).
    /// AFS received power at the surface user (dBW).
    pub afs_received_dbw: f64,
    /// Deficit versus the strong GPS reference (dB).
    pub deficit_db: f64,
    /// Sensitivity band low edge (dB).
    pub deficit_band_lo_db: f64,
    /// Sensitivity band high edge (dB).
    pub deficit_band_hi_db: f64,
    /// Nominal deficit linear factor at full precision — the "36×" figure.
    pub deficit_factor_unrounded: f64,
    /// Nominal deficit linear factor at whole-dB precision — the "32×" figure.
    pub deficit_factor_rounded: f64,
    // Required transmit power vs standoff (Validated: inverse of j_over_s_db).
    /// Per-standoff required transmit power to spoof / to deny.
    pub standoff_curve: Vec<StandoffPoint>,
    // Orbital capture footprint (Modelled geometry; Validated antenna pattern).
    /// Fraction of the visible disk the orbital transmitter captures.
    pub footprint_captured_fraction: f64,
    /// Whether the limb (edge of disk) is captured.
    pub footprint_limb_captured: bool,
    /// Transmit-antenna boresight gain (dBi).
    pub footprint_boresight_gain_dbi: f64,
    // Tracking-loop spoof capture (Validated: pull-in physics vs Kaplan & Hegarty).
    /// Whether the representative spoofer captured the tracking loop.
    pub spoof_captured: bool,
    /// Spoof-capture lock time (s), NaN if it never settled.
    pub spoof_lock_time_s: f64,
    // Horizon reach (Validated: spherical-tangent geometry).
    /// A raised-mast surface transmitter's reach to the surface user (m).
    pub surface_transmitter_reach_m: f64,
    /// The orbital transmitter's own horizon LOS distance (m).
    pub orbital_horizon_los_m: f64,
    // NMA budget (Validated: OSNMA SIS-ICD sizing).
    /// OSNMA authentication overhead (bit/s).
    pub nma_overhead_bps: f64,
    /// OSNMA overhead as a fraction of a low-rate (50 bit/s) AFS nav message.
    pub nma_overhead_fraction: f64,
    /// OSNMA key-disclosure latency (s).
    pub nma_auth_latency_s: f64,
    // --- capture footprint against altitude × beamwidth (additive) --------------------
    // Appended at the end of the struct on purpose: serde emits fields in declaration
    // order, so every pre-existing key keeps its position and its value byte-for-byte.
    /// J/S at the limb at the baseline operating point (dB). The companion to
    /// `footprint_limb_captured`: the boolean says *whether*, this says *by how much*.
    pub footprint_limb_js_db: f64,
    /// Baseline limb J/S minus the capture threshold (dB); negative = short by that much.
    pub footprint_limb_margin_db: f64,
    /// Transmit power (dBW) at which the **baseline** operating point would capture the
    /// limb — limb capture stated as a threshold rather than a boolean at one point.
    pub footprint_limb_capture_tx_power_dbw: f64,
    /// The captured fraction swept over transmitter altitude × beamwidth: a long-form
    /// grid (one row per operating point) plus the limb-capture threshold over that grid.
    pub footprint_sweep: FootprintSweepResult,
}

impl LunarAttackSurfaceScenario {
    /// Compose the six analyses into an [`AttackSurface`] result.
    pub fn analyse(&self) -> Result<AttackSurface, String> {
        if self.standoffs_m.is_empty() {
            return Err("standoffs_m must contain at least one standoff".to_string());
        }

        // 1. Link-budget deficit + sensitivity band.
        let afs_received_dbw = received_signal_power_dbw(
            self.afs_eirp_dbw,
            self.user_gain_dbi,
            self.slant_range_m,
            self.carrier_hz,
        );
        let deficit_db = self.gps_reference_dbw - afs_received_dbw;
        let band = deficit_sensitivity_band(
            self.gps_reference_min_dbw,
            self.gps_reference_dbw,
            self.afs_eirp_dbw,
            self.afs_eirp_dbw,
            self.user_gain_dbi,
            self.slant_range_m,
            self.slant_range_max_m,
            self.carrier_hz,
            8,
        );

        // 2. Required transmit power vs standoff (spoof + jam).
        let standoff_curve: Vec<StandoffPoint> = self
            .standoffs_m
            .iter()
            .map(|&d| {
                let spoof = required_tx_power_dbw(
                    self.spoof_capture_js_db,
                    self.attacker_gain_dbi,
                    self.user_gain_dbi,
                    d,
                    self.carrier_hz,
                    self.afs_isotropic_signal_dbw,
                    self.user_gain_dbi,
                );
                let jam = required_tx_power_dbw(
                    self.jam_denial_js_db,
                    self.attacker_gain_dbi,
                    self.user_gain_dbi,
                    d,
                    self.carrier_hz,
                    self.afs_isotropic_signal_dbw,
                    self.user_gain_dbi,
                );
                StandoffPoint {
                    standoff_m: d,
                    spoof_tx_power_dbw: spoof,
                    jam_tx_power_dbw: jam,
                    spoof_tx_power_w: 10.0_f64.powf(spoof / 10.0),
                }
            })
            .collect();

        // 3. Orbital capture footprint — at the baseline operating point, and then swept
        //    over transmitter altitude × beamwidth so the headline captured fraction is
        //    read against the two inputs that set it rather than quoted at one point.
        let fp_params = FootprintParams::new(
            self.transmitter_altitude_m,
            self.transmitter_power_dbw,
            self.antenna_diameter_m,
            self.carrier_hz,
            self.footprint_grid,
        );
        let fp = capture_footprint(&fp_params);
        let fp_limb = fp
            .points
            .last()
            .copied()
            .ok_or_else(|| "capture_footprint emitted no points".to_string())?;
        let footprint_sweep = capture_footprint_sweep(
            &fp_params,
            &SweepAxis {
                parameter: "transmitter_altitude_m".to_string(),
                start: self.footprint_altitude_min_m,
                stop: self.footprint_altitude_max_m,
                steps: self.footprint_altitude_steps,
                scale: self.footprint_altitude_scale.clone(),
            },
            &SweepAxis {
                parameter: "antenna_diameter_m".to_string(),
                start: self.footprint_diameter_min_m,
                stop: self.footprint_diameter_max_m,
                steps: self.footprint_diameter_steps,
                scale: self.footprint_diameter_scale.clone(),
            },
        );

        // 4. Tracking-loop spoof capture.
        let outcome = run_capture(
            &CaptureConfig::default(),
            self.spoof_power_advantage_db,
            self.spoof_code_offset_chips,
            0.0,
        );

        // 5. Horizon reach.
        let surface_transmitter_reach_m =
            surface_los_max_m(R_MOON_M, self.mast_height_m, self.user_antenna_height_m);
        let orbital_horizon_los_m = horizon_los_distance_m(R_MOON_M, self.transmitter_altitude_m);

        // 6. NMA budget.
        let nma = nma_budget(&NmaConfig::default())?;

        Ok(AttackSurface {
            afs_received_dbw,
            deficit_db,
            deficit_band_lo_db: band.band_lo_db,
            deficit_band_hi_db: band.band_hi_db,
            deficit_factor_unrounded: band.nominal_factor,
            deficit_factor_rounded: band.nominal_factor_whole_db,
            standoff_curve,
            footprint_captured_fraction: fp.captured_fraction,
            footprint_limb_captured: fp.limb_captured,
            footprint_boresight_gain_dbi: fp.boresight_gain_dbi,
            spoof_captured: outcome.captured,
            spoof_lock_time_s: outcome.lock_time_s,
            surface_transmitter_reach_m,
            orbital_horizon_los_m,
            nma_overhead_bps: nma.overhead_bps,
            nma_overhead_fraction: nma.overhead_fraction,
            nma_auth_latency_s: nma.auth_latency_s,
            footprint_limb_js_db: fp_limb.js_db,
            footprint_limb_margin_db: fp_limb.js_db - fp_params.capture_threshold_db,
            footprint_limb_capture_tx_power_dbw: fp_params.p_tx_dbw
                + (fp_params.capture_threshold_db - fp_limb.js_db),
            footprint_sweep,
        })
    }

    /// Run the scenario, returning `(json, summary, svg)` for the engine dispatch.
    pub fn run_output(&self) -> Result<(String, String, String), String> {
        let a = self.analyse()?;
        // The units block is appended as one further key rather than folded in through a
        // `serde_json::Value`: flattening the report keeps serde's declaration order, so
        // every pre-existing key holds its position and its bytes and only `units` is new.
        #[derive(serde::Serialize)]
        struct Documented<'a> {
            #[serde(flatten)]
            report: &'a AttackSurface,
            units: serde_json::Value,
        }
        let json = serde_json::to_string(&Documented {
            report: &a,
            units: crate::field_schema::units_block(UNITS),
        })
        .map_err(|e| e.to_string())?;
        let nearest = a
            .standoff_curve
            .first()
            .map(|p| p.spoof_tx_power_w)
            .unwrap_or(f64::NAN);
        // The reference correction turned the deficit negative, and `{:.0}×` on a linear
        // ratio below one prints "0×" — a true number rendered as nonsense. Say which
        // direction the link sits in, and quote the factor the reader can act on: the
        // ratio as it is when the signal is weaker, its reciprocal when it is stronger.
        let (sense, shown_rounded, shown_unrounded) = if a.deficit_db >= 0.0 {
            (
                "deficit",
                a.deficit_factor_rounded,
                a.deficit_factor_unrounded,
            )
        } else {
            (
                "surplus",
                1.0 / a.deficit_factor_rounded,
                1.0 / a.deficit_factor_unrounded,
            )
        };
        let summary = format!(
            "lunar-attack-surface | AFS {:.1} dBW, {sense} {:.1} dB (band {:.1}–{:.1}, \
             {:.0}×/{:.0}× {sense}) | \
             spoof@{:.0} m {:.3} W | footprint {:.0}% cap, limb {} | spoof-capture {} (lock {:.2} s) | \
             mast reach {:.1} km | OSNMA {:.0} bit/s ({:.0}% of 50 bit/s), {:.0} s latency",
            a.afs_received_dbw,
            a.deficit_db.abs(),
            a.deficit_band_lo_db,
            a.deficit_band_hi_db,
            shown_rounded,
            shown_unrounded,
            self.standoffs_m[0],
            nearest,
            a.footprint_captured_fraction * 100.0,
            a.footprint_limb_captured,
            a.spoof_captured,
            a.spoof_lock_time_s,
            a.surface_transmitter_reach_m / 1000.0,
            a.nma_overhead_bps,
            a.nma_overhead_fraction * 100.0,
            a.nma_auth_latency_s,
        );
        // Appended, never interleaved: every character of the summary above is unchanged,
        // so the pre-existing line remains an exact prefix of this one.
        let summary = summary + &Self::footprint_sweep_clause(&a);
        let svg = self.svg(&a);
        Ok((json, summary, svg))
    }

    /// One-line rendering of the altitude × beamwidth sweep and the limb threshold, for
    /// the CLI summary and the SVG card. Appended to both, so neither existing string is
    /// altered — the point is that the surface a human reads no longer says only
    /// "limb false" at a single operating point.
    fn footprint_sweep_clause(a: &AttackSurface) -> String {
        let s = &a.footprint_sweep;
        let lt = &s.limb_threshold;
        let alt_lo = s.altitude_m_values.first().copied().unwrap_or(f64::NAN);
        let alt_hi = s.altitude_m_values.last().copied().unwrap_or(f64::NAN);
        let bw_lo = s
            .hpbw_deg_values
            .iter()
            .copied()
            .fold(f64::INFINITY, f64::min);
        let bw_hi = s
            .hpbw_deg_values
            .iter()
            .copied()
            .fold(f64::NEG_INFINITY, f64::max);
        let limb = if lt.reached {
            format!(
                "reached ({} crossing(s), best {:.1} dB)",
                lt.crossings.len(),
                lt.best_limb_js_db
            )
        } else {
            format!(
                "NOT reached on this grid (best {:.1} dB, {:.1} dB short; needs {:.1} dBW vs {:.1} dBW)",
                lt.best_limb_js_db,
                lt.best_limb_shortfall_db,
                lt.best_limb_capture_tx_power_dbw,
                s.p_tx_dbw
            )
        };
        format!(
            " | footprint sweep {}x{} (alt {:.0}-{:.0} km x HPBW {bw_lo:.2}-{bw_hi:.2} deg), \
             capture {:.1}-{:.1}% | limb {limb}",
            s.shape.first().copied().unwrap_or(0),
            s.shape.get(1).copied().unwrap_or(0),
            alt_lo / 1000.0,
            alt_hi / 1000.0,
            100.0
                * s.points
                    .iter()
                    .map(|p| p.captured_fraction)
                    .fold(f64::INFINITY, f64::min),
            100.0
                * s.points
                    .iter()
                    .map(|p| p.captured_fraction)
                    .fold(f64::NEG_INFINITY, f64::max),
        )
    }

    fn svg(&self, a: &AttackSurface) -> String {
        let lines = [
            format!("AFS received: {:.1} dBW", a.afs_received_dbw),
            format!(
                "Deficit: {:.1} dB (band {:.1}-{:.1} dB, {:.0}x/{:.0}x)",
                a.deficit_db,
                a.deficit_band_lo_db,
                a.deficit_band_hi_db,
                a.deficit_factor_rounded,
                a.deficit_factor_unrounded
            ),
            format!(
                "Capture footprint: {:.0}% of disk, limb captured: {}",
                a.footprint_captured_fraction * 100.0,
                a.footprint_limb_captured
            ),
            format!(
                "Spoof-capture pull-in: {} (lock {:.2} s)",
                a.spoof_captured, a.spoof_lock_time_s
            ),
            format!(
                "Mast reach: {:.1} km | OSNMA {:.0} bit/s ({:.0}%)",
                a.surface_transmitter_reach_m / 1000.0,
                a.nma_overhead_bps,
                a.nma_overhead_fraction * 100.0
            ),
            // Sixth line, appended: the five above keep their y positions (70..190) and
            // this one lands at y = 220, inside the existing 240-high canvas — so the SVG
            // grows by one <text> element and nothing else moves.
            {
                let lt = &a.footprint_sweep.limb_threshold;
                let (na, nb) = (
                    a.footprint_sweep.shape.first().copied().unwrap_or(0),
                    a.footprint_sweep.shape.get(1).copied().unwrap_or(0),
                );
                if lt.reached {
                    format!(
                        "Limb: captured on {na}x{nb} grid, {} crossing(s)",
                        lt.crossings.len()
                    )
                } else {
                    format!(
                        "Limb: not captured on {na}x{nb} grid; needs {:.1} dBW (flown {:.1})",
                        lt.best_limb_capture_tx_power_dbw, a.footprint_sweep.p_tx_dbw
                    )
                }
            },
        ];
        let mut body = String::new();
        for (i, l) in lines.iter().enumerate() {
            let y = 70 + i * 30;
            body.push_str(&format!(
                "<text x=\"28\" y=\"{y}\" fill=\"#e8e2d0\" font-family=\"monospace\" font-size=\"15\">{}</text>",
                l.replace('&', "&amp;").replace('<', "&lt;")
            ));
        }
        format!(
            "<svg xmlns=\"http://www.w3.org/2000/svg\" width=\"640\" height=\"240\" viewBox=\"0 0 640 240\">\
             <rect width=\"640\" height=\"240\" fill=\"#0b1a2b\"/>\
             <text x=\"28\" y=\"36\" fill=\"#d4af37\" font-family=\"sans-serif\" font-size=\"18\" font-weight=\"bold\">\
             Lunar signal-security attack surface (P1)</text>{body}</svg>"
        )
    }
}

#[cfg(test)]
mod tests {
    /// The engine must not hold two different values for one physical quantity.
    ///
    /// It did. `jamming.rs` has always carried terrestrial GPS L1 C/A received power
    /// correctly as -158.5 dBW (ICD-GPS-200) and derives C/N0 from it. This module
    /// carried the same quantity, with `dbw` in the field name, as -125.0 / -128.5 —
    /// the **dBm** figures, 30 dB too strong — and that pair was the whole basis of
    /// P1's published "15.6 dB lunar power deficit", whose sign the correction inverts.
    ///
    /// Nothing compared them, because no test knew the two constants named the same
    /// thing. This one does.
    #[test]
    fn gps_reference_agrees_with_the_jamming_module() {
        assert_eq!(
            super::d_gps_reference_min_dbw(),
            crate::jamming::DEFAULT_SIGNAL_POWER_DBW,
            "the specification-minimum GPS reference and jamming::DEFAULT_SIGNAL_POWER_DBW \
             are the same physical quantity in the same unit and must be the same number"
        );
        // The typical received power sits above the specification minimum, and by a
        // realistic margin rather than an arbitrary one: the spec is a worst-case
        // antenna at low elevation, and the usual quoted separation is a few dB.
        let (typ, min) = (
            super::d_gps_reference_dbw(),
            super::d_gps_reference_min_dbw(),
        );
        assert!(
            typ > min && typ - min <= 6.0,
            "typical {typ} dBW must exceed the specification minimum {min} dBW by a few dB"
        );
    }

    /// A dBm value in a dBW field is 30 dB out, which no plausibility band on a *ratio*
    /// can catch — but an ABSOLUTE received power at the Earth's surface has a narrow
    /// physical range, and 30 dB leaves it. A GNSS signal arriving at -125 dBW would be
    /// a kilowatt-class emitter overhead; the real figure is near -158.5 dBW.
    ///
    /// This is the general form of the guard above: it fires on any received-power
    /// constant that has quietly been written in the wrong decibel reference.
    #[test]
    fn every_received_power_reference_is_a_plausible_dbw_figure() {
        // -170 dBW is below any usable GNSS signal; -140 dBW is above the strongest
        // received power a terrestrial GNSS user sees. A dBm transcription of either
        // bound lands outside it by construction.
        const FLOOR_DBW: f64 = -170.0;
        const CEILING_DBW: f64 = -140.0;
        for (name, v) in [
            (
                "attack_surface::gps_reference_dbw",
                super::d_gps_reference_dbw(),
            ),
            (
                "attack_surface::gps_reference_min_dbw",
                super::d_gps_reference_min_dbw(),
            ),
            (
                "jamming::DEFAULT_SIGNAL_POWER_DBW",
                crate::jamming::DEFAULT_SIGNAL_POWER_DBW,
            ),
        ] {
            assert!(
                (FLOOR_DBW..=CEILING_DBW).contains(&v),
                "{name} = {v} dBW is outside the plausible received-power band \
                 [{FLOOR_DBW}, {CEILING_DBW}] dBW — is it a dBm figure?"
            );
        }
    }

    use super::*;

    /// Empty TOML reproduces the P1 baseline headline numbers across all six composed
    /// analyses. Oracle: each sub-result matches its own module's Validated figure.
    #[test]
    fn empty_scenario_reproduces_p1_baseline() {
        let scn = LunarAttackSurfaceScenario::default();
        let a = scn.analyse().expect("baseline analyses");

        // Link budget. The received power is unchanged and always was right: a closed-form
        // FSPL of 169.594 dB at 3000 km and 2.4 GHz on a 26 dBW EIRP and 3 dBi user gain.
        assert!(
            (a.afs_received_dbw - (-140.6)).abs() < 0.1,
            "afs {}",
            a.afs_received_dbw
        );

        // REVISION (rule R4). This block asserted a deficit of +15.6 dB with a 12–18 dB
        // band and a 36x linear factor. Those came from a GPS reference of -125 / -128.5
        // "dBW", which are the dBm figures — 30 dB too strong. With the reference in the
        // unit its field name claims, the sign inverts: the modelled lunar AFS signal is
        // STRONGER than terrestrial GPS L1 C/A, not weaker. Nothing else moved; the
        // received power above is identical to the digit.
        assert!(
            (a.deficit_db - (-14.4056)).abs() < 0.001,
            "deficit {} — expected a SURPLUS of 14.41 dB, not a deficit",
            a.deficit_db
        );
        assert!(
            a.deficit_band_lo_db > -17.92 && a.deficit_band_lo_db < -17.89,
            "band lo {}",
            a.deficit_band_lo_db
        );
        assert!(
            a.deficit_band_hi_db > -12.02 && a.deficit_band_hi_db < -11.99,
            "band hi {}",
            a.deficit_band_hi_db
        );
        // The linear factor keeps its definition, 10^(dP/10), and therefore now reads
        // BELOW one: 0.0362613, i.e. the lunar signal is 1/0.0362613 = 27.58x stronger.
        //
        // This number is the proof that the unit was the only thing wrong. The released
        // value was 36.26129542174349 and the corrected one is 0.036261295421743486 —
        // the same mantissa to fifteen digits, exactly 1000x apart. A factor of 1000 is
        // exactly 30 dB, which is exactly the dBm-to-dBW offset. Nothing else in the
        // link budget moved by so much as a bit.
        assert!(
            (a.deficit_factor_unrounded - 0.036_261_295_421_743_486).abs() < 1e-12,
            "factor {}",
            a.deficit_factor_unrounded
        );
        assert!(
            (a.deficit_factor_unrounded * 1000.0 - 36.261_295_421_743_49).abs() < 1e-9,
            "the corrected factor must be the released one over exactly 1000 (30 dB), \
             got {}",
            a.deficit_factor_unrounded
        );
        // And the defect itself is pinned, so restoring either dBm constant fails here
        // as well as in gps_reference_agrees_with_the_jamming_module.
        assert!(
            a.deficit_db < 0.0,
            "a positive deficit means the dBm-for-dBW reference is back"
        );

        // Footprint is a sub-hemispheric cap, limb NOT captured.
        assert!(!a.footprint_limb_captured);
        assert!(a.footprint_captured_fraction > 0.0 && a.footprint_captured_fraction < 0.3);

        // Representative spoofer (+6 dB, 0.3 chip) captures the loop.
        assert!(a.spoof_captured);
        assert!(a.spoof_lock_time_s.is_finite());

        // OSNMA: 20 bit/s overhead = 40 % of a 50 bit/s nav rate.
        assert!((a.nma_overhead_bps - 20.0).abs() < 1e-9);
        assert!((a.nma_overhead_fraction - 0.40).abs() < 1e-9);

        // Standoff curve: spoofing is cheaper than jamming at every standoff, and the
        // required power grows with standoff (free-space path loss).
        assert_eq!(a.standoff_curve.len(), 3);
        for p in &a.standoff_curve {
            assert!(
                p.jam_tx_power_dbw > p.spoof_tx_power_dbw,
                "jam should cost more than spoof"
            );
        }
        assert!(
            a.standoff_curve[2].spoof_tx_power_dbw > a.standoff_curve[0].spoof_tx_power_dbw,
            "farther standoff needs more power"
        );
    }

    /// The run emits non-empty JSON / summary / SVG and is deterministic.
    #[test]
    fn run_output_is_nonempty_and_deterministic() {
        let scn = LunarAttackSurfaceScenario::default();
        let (j1, s1, v1) = scn.run_output().expect("run 1");
        let (j2, s2, v2) = scn.run_output().expect("run 2");
        assert_eq!(j1, j2);
        assert_eq!(s1, s2);
        assert_eq!(v1, v2);
        assert!(j1.contains("deficit_band_lo_db"));
        assert!(s1.contains("lunar-attack-surface"));
        assert!(v1.starts_with("<svg"));
    }

    /// The composed scenario reports the captured fraction against altitude AND beamwidth,
    /// and the swept grid contains the baseline operating point rather than approximating
    /// it: the (100 km, 1 m) row must reproduce the scalar `footprint_captured_fraction`
    /// — the published P1 0.0302 — bit for bit. Limb capture is reported as a threshold:
    /// the transmit power at which the baseline point would capture the limb, plus the
    /// grid-level statement that it is not reached anywhere on the shipped grid.
    #[test]
    fn footprint_sweep_is_reported_against_altitude_and_beamwidth() {
        let scn = LunarAttackSurfaceScenario::default();
        let a = scn.analyse().expect("baseline analyses");
        let s = &a.footprint_sweep;

        // Long form: one row per (altitude, beamwidth) point, 7 × 5.
        assert_eq!(s.shape, vec![7, 5]);
        assert_eq!(s.points.len(), 35);
        assert_eq!(s.axes[0].parameter, "transmitter_altitude_m");
        assert_eq!(s.axes[1].parameter, "antenna_diameter_m");
        assert_eq!(s.axes[0].scale, "linear");
        assert_eq!(s.axes[1].scale, "log");

        // The baseline operating point is a grid node, and reproduces exactly.
        let row = s
            .points
            .iter()
            .find(|p| {
                p.altitude_m == scn.transmitter_altitude_m && p.diameter_m == scn.antenna_diameter_m
            })
            .expect("the baseline operating point is on the grid");
        assert_eq!(
            row.captured_fraction.to_bits(),
            a.footprint_captured_fraction.to_bits()
        );
        assert_eq!(a.footprint_captured_fraction, 0.030_202_685_056_276_844);
        assert!((row.hpbw_deg - 7.300).abs() < 0.01, "HPBW {}", row.hpbw_deg);

        // Limb capture as a threshold, not a boolean at one point.
        assert!(!a.footprint_limb_captured);
        assert_eq!(a.footprint_limb_js_db, row.limb_js_db);
        assert!(
            (a.footprint_limb_margin_db - (a.footprint_limb_js_db - 3.0)).abs() < 1e-12,
            "margin must be measured against the 3 dB capture threshold"
        );
        assert!(a.footprint_limb_margin_db < 0.0);
        assert!(
            (a.footprint_limb_capture_tx_power_dbw - 30.804).abs() < 0.01,
            "baseline limb-capture power {} dBW",
            a.footprint_limb_capture_tx_power_dbw
        );
        // Not reached on this grid — stated as an absence, with the shortfall.
        assert!(!s.limb_threshold.reached);
        assert!(s.limb_threshold.crossings.is_empty());
        assert!(s
            .limb_threshold
            .statement
            .contains("NOT reached anywhere on this grid"));
        assert!(s.limb_threshold.best_limb_shortfall_db > 0.0);

        // The grid genuinely spreads: the widest beam at the lowest altitude captures
        // more than an order of magnitude more of the disk than the narrowest beam at the
        // highest, so the headline 3 % is an operating point, not a property of the Moon.
        let lo = s
            .points
            .iter()
            .map(|p| p.captured_fraction)
            .fold(f64::INFINITY, f64::min);
        let hi = s
            .points
            .iter()
            .map(|p| p.captured_fraction)
            .fold(f64::NEG_INFINITY, f64::max);
        assert!(hi > 10.0 * lo, "captured fraction spread {lo} .. {hi}");
    }

    /// The sweep axes are overridable from TOML like every other input, and overriding
    /// them moves only the sweep — the baseline scalars are untouched.
    #[test]
    fn footprint_sweep_axes_are_overridable_and_do_not_move_the_baseline() {
        let src = "kind = \"lunar-attack-surface\"\n\
                   footprint_altitude_min_m = 50_000.0\n\
                   footprint_altitude_max_m = 250_000.0\n\
                   footprint_altitude_steps = 3\n\
                   footprint_diameter_steps = 4\n";
        let scn: LunarAttackSurfaceScenario =
            toml::from_str(src).expect("sweep axes parse from TOML");
        let a = scn.analyse().expect("analyses");
        assert_eq!(a.footprint_sweep.shape, vec![3, 4]);
        assert_eq!(a.footprint_sweep.points.len(), 12);
        assert_eq!(a.footprint_sweep.altitude_m_values[0], 50_000.0);
        assert_eq!(a.footprint_sweep.altitude_m_values[2], 250_000.0);
        // The headline figure is the baseline operating point and does not follow the grid.
        assert_eq!(a.footprint_captured_fraction, 0.030_202_685_056_276_844);
    }

    /// A stronger spoofer power advantage cannot make an in-range capture fail (monotone
    /// sanity on the composed spoof-capture input).
    #[test]
    fn stronger_spoofer_still_captures() {
        let scn = LunarAttackSurfaceScenario {
            spoof_power_advantage_db: 12.0,
            ..LunarAttackSurfaceScenario::default()
        };
        let a = scn.analyse().expect("analyses");
        assert!(a.spoof_captured);
    }
}
