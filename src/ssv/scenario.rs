// SPDX-License-Identifier: AGPL-3.0-only
//! The `gnss-ssv` scenario kind: GNSS signal availability and link strength for a user in the Space Service Volume and
//! beyond.
//!
//! Two modes (exactly one table is given):
//!
//! * `[shell]`: users on a sphere at a fixed altitude over an equal-area grid, the booklet's global metric (availability of at
//!   least one and of at least four signals per constellation and for all together, and the maximum outage duration at the
//!   worst user);
//! * `[trajectory]`: one spacecraft on a Keplerian orbit (a preset: `geo`, `heo`, `lunar-transfer`, `leo`, `meo`; or the
//!   elements), with receive antennas, a transmit pattern, optional limb-ray effects and an optional weak-signal receiver.
//!
//! See `docs/SSV.md` and `xval/gnss-ssv/` for the pre-registered comparison with the ICG booklet.

use super::constellations::{Band, Constellation};
use super::formation::{run_formation, FormationConfig, FormationResult};
use super::limb::{Limb, LimbModel};
use super::nav::{run_nav, NavConfig, NavResult};
use super::pattern::{Axis, NamedAntenna, ParametricPattern, TxPattern, UserAntenna};
use super::sweep::{
    run_shell, run_trajectory, BandResult, LinkEffects, NoEffects, ShellConfig, TrajectoryConfig,
    TrajectoryResult, UserOrbit,
};
use super::weak::{Thresholds, WeakSignalReceiver};
use crate::antenna::GainPattern2D;
use crate::field_schema::{FieldUnit, ProvenanceClass};
use serde::{Deserialize, Serialize};
use std::sync::Arc;

/// The honesty label every result carries.
pub const LABEL: &str = "MODELLED: a geometric and link-budget sweep. The booklet pattern is a constant-power main lobe, \
the parametric pattern a representative stand-in, and the limb-ray medium a simple stated model; nothing here is a \
measurement of a signal in space. The availability and outage figures follow the method of the ICG Space Service Volume \
booklet (UN ST/SPACE/75) and are checked against its tables in xval/gnss-ssv/.";

/// Constellations and bands.
#[derive(Clone, Debug, Serialize, Deserialize, PartialEq)]
#[serde(deny_unknown_fields, default)]
pub struct ConstellationsCfg {
    /// Constellations to include (default all six).
    pub include: Vec<Constellation>,
    /// Bands (default both).
    pub bands: Vec<Band>,
}

impl Default for ConstellationsCfg {
    fn default() -> Self {
        Self {
            include: Constellation::ALL.to_vec(),
            bands: vec![Band::L1, Band::L5],
        }
    }
}

/// The transmit pattern choice.
#[derive(Clone, Debug, Default, Serialize, Deserialize, PartialEq)]
#[serde(deny_unknown_fields, default)]
pub struct TransmitCfg {
    /// `booklet`, `parametric` or `table`.
    pub pattern: Option<String>,
    /// Parametric: fall-off beyond the reference angle, dB per degree.
    pub edge_db_per_deg: Option<f64>,
    /// Parametric: sidelobe floor below the main lobe, dB.
    pub sidelobe_db: Option<f64>,
    /// Table: a CSV of a measured pattern (first row `theta_deg` then the azimuths; one row per off-boresight angle).
    pub pattern_csv: Option<String>,
    /// Table: the CSV's own text (inline), for surfaces that cannot read a file.
    pub pattern_text: Option<String>,
}

/// The receiver's C/N0 threshold: a number, or a weak-signal receiver design.
#[derive(Clone, Debug, Default, Serialize, Deserialize, PartialEq)]
#[serde(deny_unknown_fields, default)]
pub struct ReceiverCfg {
    /// A fixed threshold, dB-Hz (the booklet uses 15, 20 and 25).
    pub cn0_min_dbhz: Option<f64>,
    /// Derive the threshold from a weak-signal receiver design.
    pub weak_signal: Option<WeakSignalReceiver>,
    /// Which derived threshold to apply: `acquisition` (default), `tracking` or `both` (the higher).
    pub apply: Option<String>,
}

/// `[shell]`.
#[derive(Clone, Debug, Serialize, Deserialize, PartialEq)]
#[serde(deny_unknown_fields)]
pub struct ShellCfg {
    /// Altitude of the user sphere, km (36,000 for the upper SSV, 8,000 for the lower).
    pub altitude_km: f64,
    /// `hemisphere` (nadir-pointing, upper SSV) or `omni` (lower SSV).
    #[serde(default = "hemi")]
    pub antenna: String,
    /// Geodesic grid levels (4: the booklet's 2,562 users).
    #[serde(default = "four")]
    pub grid_levels: u32,
    /// Duration, minutes (booklet: 14 days = 20,160).
    #[serde(default = "two_weeks")]
    pub duration_min: f64,
    /// Step, minutes.
    #[serde(default = "one")]
    pub step_min: f64,
}

fn hemi() -> String {
    "hemisphere".into()
}
fn four() -> u32 {
    4
}
fn two_weeks() -> f64 {
    20160.0
}
fn one() -> f64 {
    1.0
}

/// `[trajectory]`.
#[derive(Clone, Debug, Serialize, Deserialize, PartialEq)]
#[serde(deny_unknown_fields)]
pub struct TrajectoryCfg {
    /// A preset orbit: `leo`, `meo`, `geo`, `heo` (the booklet's table 5.10) or `lunar-transfer`.
    pub preset: Option<String>,
    /// Or the elements.
    pub orbit: Option<UserOrbit>,
    /// Duration, minutes (or `duration_periods`).
    pub duration_min: Option<f64>,
    /// Duration in orbital periods (an alternative to `duration_min`).
    pub duration_periods: Option<f64>,
    /// Step, minutes.
    #[serde(default = "one")]
    pub step_min: f64,
    /// Receive antennas: `omni`, `hemisphere-nadir`, `hemisphere-zenith`, `booklet-high-gain-nadir`,
    /// `booklet-high-gain-zenith`, `booklet-patch-nadir`, `booklet-patch-zenith`. Default: `omni`.
    #[serde(default)]
    pub antennas: Vec<String>,
    /// Keep a time series every this many minutes (0: none).
    #[serde(default)]
    pub series_every_min: f64,
}

fn sixty() -> f64 {
    60.0
}

/// `[navigation]`: the onboard EKF (`nav`), the chief of a `[formation]`.
#[derive(Clone, Debug, Serialize, Deserialize, PartialEq)]
#[serde(deny_unknown_fields)]
pub struct NavigationCfg {
    /// A preset orbit (as for `[trajectory]`).
    pub preset: Option<String>,
    /// Or the elements.
    pub orbit: Option<UserOrbit>,
    /// Duration, minutes (or `duration_periods`).
    pub duration_min: Option<f64>,
    /// Duration in orbital periods.
    pub duration_periods: Option<f64>,
    /// Measurement interval, seconds.
    #[serde(default = "sixty")]
    pub step_s: f64,
    /// Receive antennas (as for `[trajectory]`).
    #[serde(default)]
    pub antennas: Vec<String>,
    /// Pseudorange sigma at 35 dB-Hz, m (grows as the C/N0 falls).
    #[serde(default = "three")]
    pub sigma_35_dbhz_m: f64,
    /// Truth solar radiation pressure, `C_r A / m`, m^2/kg.
    #[serde(default = "srp_default")]
    pub srp_area_to_mass: f64,
    /// Initial position error, 1 sigma per axis, m.
    #[serde(default = "thousand")]
    pub init_pos_sigma_m: f64,
    /// Initial velocity error, 1 sigma per axis, m/s.
    #[serde(default = "one")]
    pub init_vel_sigma_ms: f64,
    /// Filter acceleration process noise, m^2/s^3.
    #[serde(default = "accel_default")]
    pub accel_psd: f64,
    /// Receiver clock frequency random walk, m/s per sqrt(s).
    #[serde(default = "clock_default")]
    pub clock_drift_walk: f64,
    /// Random seed.
    #[serde(default = "seed_one")]
    pub seed: u64,
    /// Keep a time series every this many minutes (0: none).
    #[serde(default)]
    pub series_every_min: f64,
}

fn three() -> f64 {
    3.0
}
fn srp_default() -> f64 {
    0.02
}
fn thousand() -> f64 {
    1000.0
}
fn accel_default() -> f64 {
    1e-11
}
fn clock_default() -> f64 {
    1e-4
}
fn seed_one() -> u64 {
    1
}
fn rel_default() -> f64 {
    1e-13
}

/// `[formation]`: deputies flying with the `[navigation]` craft as chief.
#[derive(Clone, Debug, Serialize, Deserialize, PartialEq)]
#[serde(deny_unknown_fields)]
pub struct FormationCfg {
    /// True-anomaly offsets of the deputies from the chief, degrees.
    pub offsets_deg: Vec<f64>,
    /// Relative-acceleration process noise of the relative filter, m^2/s^3.
    #[serde(default = "rel_default")]
    pub rel_accel_psd: f64,
}

/// The scenario.
#[derive(Clone, Debug, Serialize, Deserialize, PartialEq)]
#[serde(deny_unknown_fields)]
pub struct GnssSsvScenario {
    /// The kind tag.
    #[serde(default)]
    pub kind: Option<String>,
    /// A name for the run.
    #[serde(default)]
    pub name: Option<String>,
    /// Constellations and bands.
    #[serde(default)]
    pub constellations: ConstellationsCfg,
    /// Transmit pattern.
    #[serde(default)]
    pub transmit: TransmitCfg,
    /// Receiver threshold.
    #[serde(default)]
    pub receiver: ReceiverCfg,
    /// Limb-ray medium (trajectory mode); present means on.
    #[serde(default)]
    pub atmosphere: Option<LimbModel>,
    /// Shell mode.
    #[serde(default)]
    pub shell: Option<ShellCfg>,
    /// Trajectory mode.
    #[serde(default)]
    pub trajectory: Option<TrajectoryCfg>,
    /// Onboard navigation mode.
    #[serde(default)]
    pub navigation: Option<NavigationCfg>,
    /// Formation relative navigation (needs `[navigation]`).
    #[serde(default)]
    pub formation: Option<FormationCfg>,
}

/// A named orbit preset.
pub fn preset_orbit(name: &str) -> Option<UserOrbit> {
    let o = |a_km, e, i_deg, raan_deg, argp_deg| UserOrbit {
        a_km,
        e,
        i_deg,
        raan_deg,
        argp_deg,
        true_anomaly_deg: 0.0,
    };
    Some(match name {
        "leo" => o(6378.0 + 800.0, 0.0, 98.6, 0.0, 0.0),
        "meo" => o(6378.0 + 8000.0, 0.0, 55.0, 0.0, 0.0),
        "geo" => o(42164.0, 0.0, 0.0, 100.379461, 0.0),
        // The booklet's table 5.10.
        "heo" => o(35937.5, 0.8087, 63.4, 0.0, 270.0),
        // A two-body outbound transfer ellipse: perigee 185 km altitude, apogee at 384,400 km from the Earth's centre.
        "lunar-transfer" => {
            let rp = 6378.0 + 185.0;
            let ra = 384_400.0;
            o((rp + ra) / 2.0, (ra - rp) / (ra + rp), 32.5, 30.0, 32.0)
        }
        _ => return None,
    })
}

fn antenna_named(name: &str, band: Band) -> Result<UserAntenna, String> {
    Ok(match name {
        "omni" => UserAntenna::Omni,
        "hemisphere-nadir" => UserAntenna::Hemisphere(Axis::Nadir),
        "hemisphere-zenith" => UserAntenna::Hemisphere(Axis::Zenith),
        "booklet-high-gain-nadir" => {
            UserAntenna::named(&NamedAntenna::BookletHighGain, band, Axis::Nadir)
        }
        "booklet-high-gain-zenith" => {
            UserAntenna::named(&NamedAntenna::BookletHighGain, band, Axis::Zenith)
        }
        "booklet-patch-nadir" => UserAntenna::named(&NamedAntenna::BookletPatch, band, Axis::Nadir),
        "booklet-patch-zenith" => {
            UserAntenna::named(&NamedAntenna::BookletPatch, band, Axis::Zenith)
        }
        other => {
            return Err(crate::terr!(
                "e-ssv-scenario-unknown-antenna",
                other = other
            ))
        }
    })
}

/// Parse a pattern CSV: the first row is `theta_deg` and then the azimuths in degrees; each following row is an off-boresight
/// angle and one gain (dB) per azimuth. A one-column table (`theta_deg,gain_db` rows) is an azimuth-independent pattern.
pub fn parse_pattern_csv(text: &str) -> Result<GainPattern2D, String> {
    let mut lines = text
        .lines()
        .map(str::trim)
        .filter(|l| !l.is_empty() && !l.starts_with('#'));
    let head: Vec<&str> = lines
        .next()
        .ok_or_else(|| crate::terr!("e-ssv-scenario-pattern-csv-is-empty"))?
        .split(',')
        .map(str::trim)
        .collect();
    let num = |s: &str| {
        s.parse::<f64>()
            .map_err(|_| crate::terr!("e-ssv-scenario-is-not-number-in-the", s = s))
    };
    let (azimuths, simple): (Vec<f64>, bool) = if head.len() == 2 && head[1].parse::<f64>().is_err()
    {
        (vec![0.0], true)
    } else {
        (
            head[1..].iter().map(|s| num(s)).collect::<Result<_, _>>()?,
            false,
        )
    };
    let mut thetas = Vec::new();
    let mut rows: Vec<Vec<f64>> = vec![Vec::new(); azimuths.len()];
    for l in lines {
        let f: Vec<&str> = l.split(',').map(str::trim).collect();
        if f.len() != azimuths.len() + 1 {
            return Err(crate::terr!(
                "e-ssv-scenario-pattern-csv-row-has-columns",
                l = l,
                f = f.len(),
                azimuths = azimuths.len() + 1
            ));
        }
        thetas.push(num(f[0])?);
        for (k, c) in f[1..].iter().enumerate() {
            rows[k].push(num(c)?);
        }
    }
    let _ = simple;
    GainPattern2D::new(azimuths, thetas, rows)
}

fn tx_pattern(t: &TransmitCfg) -> Result<TxPattern, String> {
    match t.pattern.as_deref().unwrap_or("booklet") {
        "booklet" => Ok(TxPattern::Booklet),
        "parametric" => {
            let d = ParametricPattern::default();
            Ok(TxPattern::Parametric(ParametricPattern {
                edge_db_per_deg: t.edge_db_per_deg.unwrap_or(d.edge_db_per_deg),
                sidelobe_db: t.sidelobe_db.unwrap_or(d.sidelobe_db),
            }))
        }
        "table" => {
            let text = match (&t.pattern_text, &t.pattern_csv) {
                (Some(x), None) => x.clone(),
                (None, Some(p)) => std::fs::read_to_string(p)
                    .map_err(|e| crate::terr!("e-evidence-cli-cannot-read-3", p = p, e = e))?,
                _ => {
                    return Err(crate::terr!(
                        "e-ssv-scenario-transmit-pattern-table-needs-exactly"
                    ))
                }
            };
            Ok(TxPattern::Table(Arc::new(parse_pattern_csv(&text)?)))
        }
        other => Err(crate::terr!(
            "e-ssv-scenario-transmit-pattern-is-not-booklet",
            other = other
        )),
    }
}

/// The receiver's threshold: the fixed number, or the weak-signal design's.
fn threshold(r: &ReceiverCfg) -> Result<(Option<f64>, Option<Thresholds>), String> {
    if r.cn0_min_dbhz.is_some() && r.weak_signal.is_some() {
        return Err(crate::terr!("e-ssv-scenario-receiver-give-cn0-min-dbhz"));
    }
    if let Some(w) = &r.weak_signal {
        let t = w.thresholds()?;
        let used = match r.apply.as_deref().unwrap_or("acquisition") {
            "acquisition" => t.acquisition_dbhz,
            "tracking" => t
                .tracking_dbhz
                .ok_or_else(|| crate::terr!("e-ssv-scenario-the-carrier-loop-cannot-hold"))?,
            "both" => t
                .tracking_dbhz
                .ok_or_else(|| crate::terr!("e-ssv-scenario-the-carrier-loop-cannot-hold"))?
                .max(t.acquisition_dbhz),
            other => {
                return Err(crate::terr!(
                    "e-ssv-scenario-receiver-apply-is-not-acquisition",
                    other = other
                ))
            }
        };
        return Ok((Some(used), Some(t)));
    }
    if let Some(x) = r.cn0_min_dbhz {
        if !x.is_finite() {
            return Err(crate::terr!("e-ssv-scenario-receiver-cn0-min-dbhz-must"));
        }
    }
    Ok((r.cn0_min_dbhz, None))
}

fn leak(s: String) -> &'static str {
    Box::leak(s.into_boxed_str())
}

/// The units and provenance of every numeric field a `gnss-ssv` document can carry.
fn units_table() -> Vec<FieldUnit> {
    use ProvenanceClass::{Computed, Input, ModelledInput};
    let f =
        |path: &'static str, unit: &'static str, provenance, definition: &'static str| FieldUnit {
            path,
            unit,
            provenance,
            definition,
        };
    let mut v = vec![
        f("cn0_min_dbhz", "dB-Hz", Computed, "the carrier-to-noise-density threshold applied: the stated one, or the weak-signal receiver design's"),
        f("weak_signal_receiver.effective_t_coh_s", "s", Computed, "coherent integration time after the data-bit limit"),
        f("weak_signal_receiver.cells", "count", Computed, "Doppler bins times code bins searched"),
        f("weak_signal_receiver.pfa_per_cell", "1", Computed, "false-alarm probability per search cell"),
        f("weak_signal_receiver.detection_threshold", "1", Computed, "normalised threshold of the square-law detector"),
        f("weak_signal_receiver.acquisition_dbhz", "dB-Hz", Computed, "lowest C/N0 for acquisition at the detection target"),
        f("weak_signal_receiver.carrier_tracking_dbhz", "dB-Hz", Computed, "lowest C/N0 the carrier loop holds"),
        f("weak_signal_receiver.code_tracking_dbhz", "dB-Hz", Computed, "lowest C/N0 the code loop holds"),
        f("weak_signal_receiver.tracking_dbhz", "dB-Hz", Computed, "the higher of the carrier and code thresholds"),
        f("weak_signal_receiver.search_time_s", "s", Computed, "time to sweep every cell once"),
        f("shell.altitude_km", "km", Input, "altitude of the user sphere"),
        f("shell.grid_points", "count", Computed, "users on the geodesic grid"),
        f("shell.duration_min", "min", Input, "simulated duration"),
        f("shell.step_min", "min", Input, "time step"),
        f("orbit.a_km", "km", Input, "user semi-major axis"),
        f("orbit.e", "1", Input, "user eccentricity"),
        f("orbit.i_deg", "deg", Input, "user inclination"),
        f("orbit.raan_deg", "deg", Input, "user right ascension of the ascending node"),
        f("orbit.argp_deg", "deg", Input, "user argument of perigee"),
        f("orbit.true_anomaly_deg", "deg", Input, "user true anomaly at the epoch"),
        f("atmosphere_model.nmf2", "1/m^3", ModelledInput, "Chapman-layer peak electron density"),
        f("atmosphere_model.hmf2_km", "km", ModelledInput, "Chapman-layer peak height"),
        f("atmosphere_model.h_scale_km", "km", ModelledInput, "Chapman-layer scale height"),
        f("atmosphere_model.plasmapause_l", "1", ModelledInput, "plasmapause L shell"),
        f("atmosphere_model.trough_density", "1/m^3", ModelledInput, "electron density outside the plasmapause"),
        f("atmosphere_model.plasmasphere_scale", "1", ModelledInput, "multiplier on the plasmasphere density"),
        f("atmosphere_model.n0", "N-units", ModelledInput, "sea-level refractivity"),
        f("atmosphere_model.n_scale_km", "km", ModelledInput, "refractivity scale height"),
        f("atmosphere_model.gamma0_db_per_km", "dB/km", ModelledInput, "sea-level oxygen absorption at the carrier"),
        f("atmosphere_model.gamma_scale_km", "km", ModelledInput, "absorption scale height"),
        f("result.period_min", "min", Computed, "user orbital period"),
        f("result.perigee_alt_km", "km", Computed, "perigee altitude above the 6378 km Earth"),
        f("result.apogee_alt_km", "km", Computed, "apogee altitude above the 6378 km Earth"),
        f("result.epochs", "count", Computed, "epochs simulated"),
        f("result.phases[].epochs", "count", Computed, "epochs in the part of the run"),
        f("result.phases[].epochs_with_4", "count", Computed, "epochs with at least four measurements used"),
        f("result.phases[].pos_rms_m", "m", Computed, "RMS 3D position error against the simulated truth"),
        f("result.phases[].vel_rms_ms", "m/s", Computed, "RMS 3D velocity error against the simulated truth"),
        f("result.phases[].pos_p95_m", "m", Computed, "95th percentile of the 3D position error"),
        f("result.phases[].pos_nees_mean", "1", Computed, "mean normalised estimation error squared of the position (3 for a consistent filter)"),
        f("result.longest_gap_min", "min", Computed, "longest time with no measurement used"),
        f("result.measurements_used", "count", Computed, "pseudoranges used"),
        f("result.measurements_gated", "count", Computed, "pseudoranges rejected by the 5-sigma innovation gate"),
        f("result.final_pos_err_m", "m", Computed, "3D position error at the end"),
        f("result.srp_estimate_ms2", "m/s^2", Computed, "the filter's final estimate of the radiation-pressure acceleration"),
        f("result.srp_truth_ms2", "m/s^2", Computed, "the simulated truth radiation-pressure acceleration"),
        f("result.series[].t_min", "min", Computed, "time since the epoch"),
        f("result.series[].altitude_km", "km", Computed, "altitude above the 6378 km Earth"),
        f("result.series[].n_meas", "count", Computed, "pseudoranges used at the epoch"),
        f("result.series[].pos_err_m", "m", Computed, "3D position error"),
        f("result.series[].pos_sigma_m", "m", Computed, "root of the trace of the position covariance"),
        f("formation.epochs", "count", Computed, "epochs simulated"),
        f("formation.chief_abs_rms_m", "m", Computed, "RMS absolute position error of the chief"),
        f("formation.deputies[].offset_deg", "deg", Input, "true-anomaly offset of the deputy from the chief"),
        f("formation.deputies[].baseline_km", "km", Computed, "mean chief-to-deputy distance"),
        f("formation.deputies[].epochs_common_4", "count", Computed, "epochs with at least four signals tracked by both craft"),
        f("formation.deputies[].common_signals_mean", "count", Computed, "mean number of signals tracked by both craft"),
        f("formation.deputies[].rel_rms_from_absolute_m", "m", Computed, "RMS relative position error from subtracting independent absolute estimates"),
        f("formation.deputies[].rel_rms_filter_m", "m", Computed, "RMS relative position error of the single-difference relative filter"),
        f("formation.deputies[].rel_vel_rms_filter_ms", "m/s", Computed, "RMS relative velocity error of the relative filter"),
        f("formation.deputies[].rel_rms_from_absolute_above_gnss_m", "m", Computed, "as rel_rms_from_absolute_m, above 20,000 km altitude"),
        f("formation.deputies[].rel_rms_filter_above_gnss_m", "m", Computed, "as rel_rms_filter_m, above 20,000 km altitude"),
        f("formation.deputies[].abs_rms_m", "m", Computed, "RMS absolute position error of the deputy's own filter"),
    ];
    for root in ["bands[].groups[]", "result.bands[].groups[]"] {
        v.push(f(
            leak(crate::t!("ssv-scenario-at-least-pct", root = root)),
            "%",
            Computed,
            "share of (user, epoch) pairs with at least one signal",
        ));
        v.push(f(
            leak(crate::t!("ssv-scenario-at-least-pct-2", root = root)),
            "%",
            Computed,
            "share with at least four signals",
        ));
        v.push(f(
            leak(crate::t!("ssv-scenario-max-outage-min", root = root)),
            "min",
            Computed,
            "longest run without a signal at the worst user",
        ));
        v.push(f(
            leak(crate::t!("ssv-scenario-max-outage-min-2", root = root)),
            "min",
            Computed,
            "longest run below four signals at the worst user",
        ));
    }
    v.push(f(
        "result.bands[].groups[].availability.at_least_1_pct",
        "%",
        Computed,
        "share of epochs with at least one signal",
    ));
    v.push(f(
        "result.bands[].groups[].availability.at_least_4_pct",
        "%",
        Computed,
        "share of epochs with at least four signals",
    ));
    v.push(f(
        "result.bands[].groups[].availability.max_outage_1_min",
        "min",
        Computed,
        "longest stretch without a signal",
    ));
    v.push(f(
        "result.bands[].groups[].availability.max_outage_4_min",
        "min",
        Computed,
        "longest stretch below four signals",
    ));
    v.push(f(
        "result.bands[].groups[].main_lobe_links",
        "count",
        Computed,
        "links received through the main lobe, summed over epochs",
    ));
    v.push(f(
        "result.bands[].groups[].sidelobe_links",
        "count",
        Computed,
        "links received through a sidelobe, summed over epochs",
    ));
    for (block, unit, what) in [
        (
            "result.bands[].groups[].signals_in_view",
            "count",
            "signals in view per epoch",
        ),
        (
            "result.bands[].groups[].best_cn0_dbhz",
            "dB-Hz",
            "C/N0 of the strongest link",
        ),
        (
            "result.bands[].limb.loss_db",
            "dB",
            "neutral-atmosphere loss on usable links",
        ),
        (
            "result.bands[].limb.stec_tecu",
            "TECU",
            "slant total electron content of usable links",
        ),
        (
            "result.bands[].limb.plasmaspheric_tecu",
            "TECU",
            "plasmaspheric part of the slant TEC",
        ),
        (
            "result.bands[].limb.delay_m",
            "m",
            "total excess delay at the band's first frequency",
        ),
        (
            "result.bands[].limb.tangent_alt_km",
            "km",
            "tangent altitude of usable links",
        ),
    ] {
        v.push(f(
            leak(format!("{block}.n")),
            "count",
            Computed,
            "samples in the statistic",
        ));
        for k in ["min", "mean", "max"] {
            v.push(f(
                leak(format!("{block}.{k}")),
                unit,
                Computed,
                leak(format!("{k} of the {what}")),
            ));
        }
    }
    v.push(f(
        "result.bands[].pdop_median",
        "1",
        Computed,
        "median position DOP of the combined signals",
    ));
    v.push(f(
        "result.bands[].pdop_p95",
        "1",
        Computed,
        "95th percentile position DOP",
    ));
    v.push(f(
        "result.bands[].pdop_worst",
        "1",
        Computed,
        "worst position DOP",
    ));
    v.push(f(
        "result.bands[].limb.links",
        "count",
        Computed,
        "usable links counted",
    ));
    v.push(f(
        "result.bands[].limb.grazing_below_100_km",
        "count",
        Computed,
        "usable links grazing below 100 km",
    ));
    v.push(f(
        "result.bands[].limb.lost_to_atmosphere",
        "count",
        Computed,
        "links lost to the atmosphere's loss",
    ));
    v.push(f(
        "result.bands[].series[].t_min",
        "min",
        Computed,
        "minutes since the epoch",
    ));
    v.push(f(
        "result.bands[].series[].altitude_km",
        "km",
        Computed,
        "altitude above the 6378 km Earth",
    ));
    v.push(f(
        "result.bands[].series[].combined",
        "count",
        Computed,
        "combined signals in view",
    ));
    v.push(f(
        "result.bands[].series[].best_cn0_dbhz",
        "dB-Hz",
        Computed,
        "best C/N0",
    ));
    v
}

impl GnssSsvScenario {
    fn validate_navigation(&self, n: &NavigationCfg) -> Result<(), String> {
        if n.preset.is_some() == n.orbit.is_some() {
            return Err(crate::terr!(
                "e-ssv-scenario-navigation-give-exactly-one-of"
            ));
        }
        if let Some(p) = &n.preset {
            if preset_orbit(p).is_none() {
                return Err(crate::terr!(
                    "e-ssv-scenario-navigation-preset-is-not-leo",
                    p = p
                ));
            }
        }
        if n.duration_min.is_some() == n.duration_periods.is_some() {
            return Err(crate::terr!(
                "e-ssv-scenario-navigation-give-exactly-one-of-2"
            ));
        }
        for (name, v) in [
            ("step_s", n.step_s),
            ("sigma_35_dbhz_m", n.sigma_35_dbhz_m),
            ("init_pos_sigma_m", n.init_pos_sigma_m),
            ("init_vel_sigma_ms", n.init_vel_sigma_ms),
        ] {
            if !(v.is_finite() && v > 0.0) {
                return Err(crate::terr!(
                    "e-ssv-scenario-navigation-must-be-positive",
                    name = name
                ));
            }
        }
        for v in [n.accel_psd, n.clock_drift_walk, n.srp_area_to_mass] {
            if !(v.is_finite() && v >= 0.0) {
                return Err(
                    "navigation: noise and radiation-pressure values must not be negative".into(),
                );
            }
        }
        for a in &n.antennas {
            antenna_named(a, Band::L1)?;
        }
        if let Some(f) = &self.formation {
            if f.offsets_deg.is_empty()
                || f.offsets_deg.len() > 8
                || f.offsets_deg.iter().any(|x| !x.is_finite())
            {
                return Err(crate::terr!(
                    "e-ssv-scenario-formation-offsets-deg-needs-to"
                ));
            }
            if !(f.rel_accel_psd.is_finite() && f.rel_accel_psd >= 0.0) {
                return Err(crate::terr!("e-ssv-scenario-formation-rel-accel-psd-must"));
            }
        }
        if self.shell.is_some() {
            return Ok(());
        }
        tx_pattern(&self.transmit)?;
        Ok(())
    }

    /// Check the scenario without running it.
    pub fn validate(&self) -> Result<(), String> {
        let modes = [
            self.shell.is_some(),
            self.trajectory.is_some(),
            self.navigation.is_some(),
        ];
        if modes.iter().filter(|m| **m).count() != 1 {
            return Err(crate::terr!("e-ssv-scenario-give-exactly-one-of-shell"));
        }
        if self.formation.is_some() && self.navigation.is_none() {
            return Err(crate::terr!(
                "e-ssv-scenario-formation-needs-navigation-table-for"
            ));
        }
        if let Some(n) = &self.navigation {
            self.validate_navigation(n)?;
        }
        if self.constellations.include.is_empty() || self.constellations.bands.is_empty() {
            return Err(crate::terr!(
                "e-ssv-scenario-constellations-include-and-constellations-bands"
            ));
        }
        threshold(&self.receiver)?;
        if let Some(s) = &self.shell {
            if !(s.altitude_km.is_finite() && s.altitude_km > 100.0) {
                return Err(crate::terr!("e-ssv-scenario-shell-altitude-km-must-be"));
            }
            if s.grid_levels > 5 {
                return Err(crate::terr!("e-ssv-scenario-shell-grid-levels-above-is"));
            }
            if !matches!(s.antenna.as_str(), "hemisphere" | "omni") {
                return Err(crate::terr!(
                    "e-ssv-scenario-shell-antenna-must-be-hemisphere"
                ));
            }
            if !tx_pattern(&self.transmit)?.is_booklet() {
                return Err(crate::terr!("e-ssv-scenario-the-shell-sweep-supports-the"));
            }
            if self.atmosphere.is_some() {
                return Err(crate::terr!(
                    "e-ssv-scenario-atmosphere-applies-to-trajectory-not"
                ));
            }
        }
        if let Some(t) = &self.trajectory {
            if t.preset.is_some() == t.orbit.is_some() {
                return Err(crate::terr!(
                    "e-ssv-scenario-trajectory-give-exactly-one-of"
                ));
            }
            if let Some(p) = &t.preset {
                if preset_orbit(p).is_none() {
                    return Err(crate::terr!(
                        "e-ssv-scenario-trajectory-preset-is-not-leo",
                        p = p
                    ));
                }
            }
            if t.duration_min.is_some() == t.duration_periods.is_some() {
                return Err(
                    "trajectory: give exactly one of duration_min and duration_periods".into(),
                );
            }
            for a in &t.antennas {
                antenna_named(a, Band::L1)?;
            }
            tx_pattern(&self.transmit)?;
        }
        Ok(())
    }

    /// Run, returning the result as JSON text, a one-line summary and a CSV (trajectory series).
    pub fn run_json(&self) -> Result<(String, String, Option<String>), String> {
        self.validate()?;
        let (cn0, weak) = threshold(&self.receiver)?;
        let mut doc = serde_json::json!({
            "kind": "gnss-ssv",
            "name": self.name,
            "label": LABEL,
            "transmit_pattern": tx_pattern(&self.transmit)?.label(),
            "cn0_min_dbhz": cn0,
        });
        if let Some(t) = &weak {
            doc["weak_signal_receiver"] = serde_json::to_value(t).map_err(|e| e.to_string())?;
        }
        let mut summary = String::new();
        let mut csv = None;
        if let Some(s) = &self.shell {
            let cfg = ShellConfig {
                altitude_km: s.altitude_km,
                hemisphere: s.antenna == "hemisphere",
                grid_levels: s.grid_levels,
                duration_min: s.duration_min,
                step_min: s.step_min,
                cn0_min_dbhz: cn0,
                constellations: self.constellations.include.clone(),
                bands: self.constellations.bands.clone(),
                mrtp_reference_alt_km: 36000.0,
                beam_override_deg: Vec::new(),
            };
            let r = run_shell(&cfg)?;
            summary = shell_summary(&r, s);
            doc["mode"] = "shell".into();
            doc["shell"] = serde_json::json!({
                "altitude_km": s.altitude_km, "antenna": s.antenna, "grid_points": 10 * 4usize.pow(s.grid_levels) + 2,
                "duration_min": s.duration_min, "step_min": s.step_min,
            });
            doc["bands"] = serde_json::to_value(&r).map_err(|e| e.to_string())?;
        } else if let Some(t) = &self.trajectory {
            let orbit = match (&t.preset, &t.orbit) {
                (Some(p), _) => {
                    preset_orbit(p).ok_or_else(|| crate::terr!("e-ssv-scenario-unknown-preset"))?
                }
                (_, Some(o)) => *o,
                _ => unreachable!(),
            };
            let duration_min = match (t.duration_min, t.duration_periods) {
                (Some(d), _) => d,
                (_, Some(p)) => p * orbit.period_min(),
                _ => unreachable!(),
            };
            let mut antennas = Vec::new();
            for &band in &self.constellations.bands {
                let mut v = Vec::new();
                for a in &t.antennas {
                    v.push(antenna_named(a, band)?);
                }
                antennas.push((band, v));
            }
            let every = if t.series_every_min > 0.0 {
                (t.series_every_min / t.step_min).round().max(1.0) as usize
            } else {
                0
            };
            let cfg = TrajectoryConfig {
                orbit,
                duration_min,
                step_min: t.step_min,
                cn0_min_dbhz: cn0,
                constellations: self.constellations.include.clone(),
                bands: self.constellations.bands.clone(),
                antennas,
                tx: tx_pattern(&self.transmit)?,
                mrtp_reference_alt_km: 36000.0,
                beam_override_deg: Vec::new(),
                series_every_epochs: every,
                collect_limb: self.atmosphere.is_some(),
            };
            let r = match &self.atmosphere {
                Some(m) => run_trajectory(&cfg, &Limb(*m))?,
                None => run_trajectory(&cfg, &NoEffects)?,
            };
            summary = trajectory_summary(&r);
            csv = trajectory_csv(&r);
            doc["mode"] = "trajectory".into();
            doc["orbit"] = serde_json::to_value(orbit).map_err(|e| e.to_string())?;
            doc["result"] = serde_json::to_value(&r).map_err(|e| e.to_string())?;
            if let Some(m) = &self.atmosphere {
                doc["atmosphere_model"] = serde_json::to_value(m).map_err(|e| e.to_string())?;
            }
        } else if let Some(n) = &self.navigation {
            let orbit = match (&n.preset, &n.orbit) {
                (Some(p), _) => {
                    preset_orbit(p).ok_or_else(|| crate::terr!("e-ssv-scenario-unknown-preset"))?
                }
                (_, Some(o)) => *o,
                _ => unreachable!(),
            };
            let duration_min = match (n.duration_min, n.duration_periods) {
                (Some(d), _) => d,
                (_, Some(p)) => p * orbit.period_min(),
                _ => unreachable!(),
            };
            let mut antennas = Vec::new();
            for &band in &self.constellations.bands {
                let mut v = Vec::new();
                for a in &n.antennas {
                    v.push(antenna_named(a, band)?);
                }
                antennas.push((band, v));
            }
            let every = if n.series_every_min > 0.0 {
                (n.series_every_min * 60.0 / n.step_s).round().max(1.0) as usize
            } else {
                0
            };
            let nav_cfg = NavConfig {
                orbit,
                duration_min,
                step_s: n.step_s,
                cn0_min_dbhz: cn0.unwrap_or(20.0),
                constellations: self.constellations.include.clone(),
                bands: self.constellations.bands.clone(),
                antennas,
                tx: tx_pattern(&self.transmit)?,
                sigma_35_dbhz_m: n.sigma_35_dbhz_m,
                srp_area_to_mass: n.srp_area_to_mass,
                init_pos_sigma_m: n.init_pos_sigma_m,
                init_vel_sigma_ms: n.init_vel_sigma_ms,
                accel_psd: n.accel_psd,
                clock_drift_walk: n.clock_drift_walk,
                seed: n.seed,
                series_every_epochs: every,
                beam_override_deg: Vec::new(),
            };
            doc["mode"] = if self.formation.is_some() {
                "formation"
            } else {
                "navigation"
            }
            .into();
            doc["orbit"] = serde_json::to_value(orbit).map_err(|e| e.to_string())?;
            if let Some(m) = &self.atmosphere {
                doc["atmosphere_model"] = serde_json::to_value(m).map_err(|e| e.to_string())?;
            }
            let fx: &dyn LinkEffects = match &self.atmosphere {
                Some(m) => &Limb(*m),
                None => &NoEffects,
            };
            let r = run_nav(&nav_cfg, fx)?;
            summary = navigation_summary(&r);
            doc["result"] = serde_json::to_value(&r).map_err(|e| e.to_string())?;
            if let Some(f) = &self.formation {
                let fr = run_formation(
                    &FormationConfig {
                        nav: nav_cfg,
                        offsets_deg: f.offsets_deg.clone(),
                        rel_accel_psd: f.rel_accel_psd,
                    },
                    fx,
                )?;
                summary.push_str(&format!("; {}", formation_summary(&fr)));
                doc["formation"] = serde_json::to_value(&fr).map_err(|e| e.to_string())?;
            }
        }
        // Describe exactly the numeric fields this document carries.
        let present = crate::field_schema::numeric_leaf_paths(&doc);
        let table = units_table();
        let units: Vec<FieldUnit> = table
            .iter()
            .filter(|u| {
                present
                    .iter()
                    .any(|p| crate::field_schema::pattern_matches(u.path, p))
            })
            .cloned()
            .collect();
        doc["units"] = crate::field_schema::units_block(&units);
        let json = serde_json::to_string_pretty(&doc).map_err(|e| e.to_string())?;
        Ok((json, summary, csv))
    }
}

fn shell_summary(r: &[BandResult], s: &ShellCfg) -> String {
    let mut parts = Vec::new();
    for b in r {
        if let Some(g) = b.groups.last() {
            let a = &g.availability;
            parts.push(format!(
                "{} combined 1+ {:.1}% 4+ {:.1}%",
                b.band.name(),
                a.at_least_1_pct,
                a.at_least_4_pct
            ));
        }
    }
    crate::t!(
        "ssv-scenario-gnss-ssv-shell-km",
        altitude_km = crate::i18n::localise_decimal(format!("{:.0}", s.altitude_km)),
        parts = parts.join("; ")
    )
}

fn navigation_summary(r: &NavResult) -> String {
    let p = |i: usize| {
        r.phases
            .get(i)
            .and_then(|x| x.pos_rms_m)
            .map_or("n/a".to_string(), |v| format!("{v:.1} m"))
    };
    crate::t!(
        "ssv-scenario-gnss-ssv-navigation-position-rms",
        p = p(0),
        p2 = p(1),
        p3 = p(2),
        longest_gap_min = crate::i18n::localise_decimal(format!("{:.0}", r.longest_gap_min))
    )
}

fn formation_summary(r: &FormationResult) -> String {
    let parts: Vec<String> = r
        .deputies
        .iter()
        .map(|d| {
            crate::t!(
                "ssv-scenario-deputy-at-deg-km-relative",
                offset_deg = crate::i18n::localise_decimal(format!("{:.2}", d.offset_deg)),
                baseline_km = crate::i18n::localise_decimal(format!("{:.0}", d.baseline_km)),
                rel_rms_filter_m =
                    crate::i18n::localise_decimal(format!("{:.1}", d.rel_rms_filter_m)),
                rel_rms_from_absolute_m =
                    crate::i18n::localise_decimal(format!("{:.1}", d.rel_rms_from_absolute_m))
            )
        })
        .collect();
    format!("formation: {}", parts.join("; "))
}

fn trajectory_summary(r: &TrajectoryResult) -> String {
    let mut parts = Vec::new();
    for b in &r.bands {
        if let Some(g) = b.groups.last() {
            parts.push(crate::t!(
                "ssv-scenario-combined-max-outage-min",
                band = b.band.name(),
                at_least_1_pct =
                    crate::i18n::localise_decimal(format!("{:.1}", g.availability.at_least_1_pct)),
                at_least_4_pct =
                    crate::i18n::localise_decimal(format!("{:.1}", g.availability.at_least_4_pct)),
                max_outage_1_min = crate::i18n::localise_decimal(format!(
                    "{:.0}",
                    g.availability.max_outage_1_min
                ))
            ));
        }
    }
    crate::t!(
        "ssv-scenario-gnss-ssv-trajectory-to-km",
        perigee_alt_km = crate::i18n::localise_decimal(format!("{:.0}", r.perigee_alt_km)),
        apogee_alt_km = crate::i18n::localise_decimal(format!("{:.0}", r.apogee_alt_km)),
        parts = parts.join("; ")
    )
}

fn trajectory_csv(r: &TrajectoryResult) -> Option<String> {
    let first = r.bands.first()?;
    if first.series.is_empty() {
        return None;
    }
    let mut out = String::from("t_min,altitude_km");
    for b in &r.bands {
        out += &crate::t!("ssv-scenario-signals-best-cn0-dbhz", band = b.band.name());
    }
    out.push('\n');
    for (k, p) in first.series.iter().enumerate() {
        out += &format!("{:.3},{:.1}", p.t_min, p.altitude_km);
        for b in &r.bands {
            match b.series.get(k) {
                Some(q) => {
                    out += &format!(
                        ",{},{}",
                        q.combined,
                        q.best_cn0_dbhz.map_or(String::new(), |x| format!("{x:.2}"))
                    )
                }
                None => out += ",,",
            }
        }
        out.push('\n');
    }
    Some(out)
}

#[cfg(test)]
mod tests {
    use super::*;

    fn parse(s: &str) -> GnssSsvScenario {
        toml::from_str(s).unwrap()
    }

    #[test]
    fn a_geo_trajectory_runs_and_reports_the_combined_group() {
        let s = parse(
            "kind = \"gnss-ssv\"\n[constellations]\ninclude = [\"gps\", \"galileo\"]\nbands = [\"l1\"]\n\
             [receiver]\ncn0_min_dbhz = 20.0\n[trajectory]\npreset = \"geo\"\nduration_min = 720.0\nstep_min = 10.0\n\
             antennas = [\"booklet-high-gain-nadir\"]\nseries_every_min = 60.0\n",
        );
        let (json, summary, csv) = s.run_json().unwrap();
        let v: serde_json::Value = serde_json::from_str(&json).unwrap();
        assert_eq!(v["mode"], "trajectory");
        assert!(v["label"].as_str().unwrap().starts_with("MODELLED"));
        let groups = v["result"]["bands"][0]["groups"].as_array().unwrap();
        assert_eq!(groups.last().unwrap()["name"], "combined");
        assert!(summary.contains("gnss-ssv trajectory"));
        assert!(csv.unwrap().starts_with("t_min,altitude_km"));
    }

    #[test]
    fn navigation_and_formation_run_and_report() {
        let sc = parse(
            r#"
            kind = "gnss-ssv"
            [constellations]
            include = ["gps", "galileo"]
            bands = ["l1"]
            [receiver]
            cn0_min_dbhz = 20.0
            [navigation]
            preset = "heo"
            duration_min = 120.0
            antennas = ["booklet-high-gain-nadir", "booklet-patch-zenith"]
            series_every_min = 30.0
            [formation]
            offsets_deg = [0.03]
            "#,
        );
        let (json, summary, _) = sc.run_json().unwrap();
        let v: serde_json::Value = serde_json::from_str(&json).unwrap();
        assert_eq!(v["mode"], "formation");
        assert!(v["result"]["phases"][0]["pos_rms_m"].as_f64().unwrap() > 0.0);
        assert_eq!(v["formation"]["deputies"].as_array().unwrap().len(), 1);
        assert!(summary.contains("formation:"));
        // Every numeric field the document carries is described.
        let mut bare = v.clone();
        bare.as_object_mut().unwrap().remove("units");
        let table = units_table();
        for path in crate::field_schema::numeric_leaf_paths(&bare) {
            assert!(
                table
                    .iter()
                    .any(|u| crate::field_schema::pattern_matches(u.path, &path)),
                "no units entry for {path}"
            );
        }
    }

    #[test]
    fn formation_needs_navigation_and_one_mode_only() {
        let both = r#"
            kind = "gnss-ssv"
            [navigation]
            preset = "heo"
            duration_min = 10.0
            [trajectory]
            preset = "heo"
            duration_min = 10.0
            "#;
        assert!(toml::from_str::<GnssSsvScenario>(both)
            .unwrap()
            .validate()
            .is_err());
        let f = r#"
            kind = "gnss-ssv"
            [trajectory]
            preset = "heo"
            duration_min = 10.0
            [formation]
            offsets_deg = [0.1]
            "#;
        assert!(toml::from_str::<GnssSsvScenario>(f)
            .unwrap()
            .validate()
            .is_err());
    }

    #[test]
    fn exactly_one_mode_and_the_shell_needs_the_booklet_pattern() {
        assert!(parse("kind = \"gnss-ssv\"").validate().is_err());
        assert!(parse(
            "[shell]\naltitude_km = 36000.0\n[trajectory]\npreset = \"geo\"\nduration_min = 1.0"
        )
        .validate()
        .is_err());
        assert!(
            parse("[transmit]\npattern = \"parametric\"\n[shell]\naltitude_km = 36000.0")
                .validate()
                .is_err()
        );
        assert!(parse(
            "[shell]\naltitude_km = 36000.0\ngrid_levels = 1\nduration_min = 60.0\nstep_min = 30.0"
        )
        .validate()
        .is_ok());
        assert!(toml::from_str::<GnssSsvScenario>("bogus = 1").is_err());
    }

    #[test]
    fn a_pattern_csv_parses_in_both_shapes_and_bad_rows_are_refused() {
        let p =
            parse_pattern_csv("theta_deg,0,90,180,270\n0,10,10,10,10\n10,8,9,8,9\n20,4,5,4,5\n")
                .unwrap();
        assert!((p.gain_at(0.0, 10.0).unwrap() - 8.0).abs() < 1e-12);
        let q = parse_pattern_csv("theta_deg,gain_db\n0,10\n10,8\n").unwrap();
        assert!((q.gain_at(123.0, 5.0).unwrap() - 9.0).abs() < 1e-12);
        assert!(parse_pattern_csv("theta_deg,0,90\n0,1\n").is_err());
        assert!(parse_pattern_csv("").is_err());
    }

    #[test]
    fn a_weak_signal_receiver_replaces_the_fixed_threshold() {
        let s = parse(
            "[receiver]\napply = \"acquisition\"\n[receiver.weak_signal]\nt_coh_s = 0.1\nn_noncoherent = 50.0\n\
             pilot_or_data_wipe = true\ndoppler_uncertainty_hz = 200.0\ncode_window_chips = 50.0\n\
             [trajectory]\npreset = \"geo\"\nduration_min = 60.0\nstep_min = 30.0\n",
        );
        let (json, _, _) = s.run_json().unwrap();
        let v: serde_json::Value = serde_json::from_str(&json).unwrap();
        let thr = v["cn0_min_dbhz"].as_f64().unwrap();
        assert!(thr < 20.0, "{thr}");
        assert!(v["weak_signal_receiver"]["cells"].as_f64().unwrap() > 1.0);
        assert!(parse("[receiver]\ncn0_min_dbhz = 20.0\n[receiver.weak_signal]\nt_coh_s = 0.1\n[trajectory]\npreset = \"geo\"\nduration_min = 1.0")
            .validate()
            .is_err());
    }

    #[test]
    fn the_limb_medium_adds_statistics_and_can_cost_signals() {
        let s = parse(
            "[constellations]\ninclude = [\"gps\"]\nbands = [\"l1\"]\n[transmit]\npattern = \"parametric\"\n\
             [receiver]\ncn0_min_dbhz = 12.0\n[atmosphere]\n[trajectory]\npreset = \"geo\"\nduration_min = 240.0\nstep_min = 10.0\n\
             antennas = [\"booklet-high-gain-nadir\"]\n",
        );
        let (json, _, _) = s.run_json().unwrap();
        let v: serde_json::Value = serde_json::from_str(&json).unwrap();
        let limb = &v["result"]["bands"][0]["limb"];
        assert!(limb["links"].as_u64().unwrap() > 0, "{limb}");
        assert!(limb["stec_tecu"]["mean"].as_f64().unwrap() > 0.0);
    }
}
