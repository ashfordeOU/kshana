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
use super::limb::{Limb, LimbModel};
use super::pattern::{Axis, NamedAntenna, ParametricPattern, TxPattern, UserAntenna};
use super::sweep::{
    run_shell, run_trajectory, BandResult, NoEffects, ShellConfig, TrajectoryConfig,
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
        other => return Err(format!("unknown antenna `{other}`")),
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
        .ok_or("pattern CSV is empty")?
        .split(',')
        .map(str::trim)
        .collect();
    let num = |s: &str| {
        s.parse::<f64>()
            .map_err(|_| format!("`{s}` is not a number in the pattern CSV"))
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
            return Err(format!(
                "pattern CSV row `{l}` has {} columns, expected {}",
                f.len(),
                azimuths.len() + 1
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
                (None, Some(p)) => std::fs::read_to_string(p).map_err(|e| format!("cannot read {p}: {e}"))?,
                _ => return Err("transmit.pattern = \"table\" needs exactly one of pattern_csv and pattern_text".into()),
            };
            Ok(TxPattern::Table(Arc::new(parse_pattern_csv(&text)?)))
        }
        other => Err(format!(
            "transmit.pattern `{other}` is not booklet, parametric or table"
        )),
    }
}

/// The receiver's threshold: the fixed number, or the weak-signal design's.
fn threshold(r: &ReceiverCfg) -> Result<(Option<f64>, Option<Thresholds>), String> {
    if r.cn0_min_dbhz.is_some() && r.weak_signal.is_some() {
        return Err("receiver: give cn0_min_dbhz or weak_signal, not both".into());
    }
    if let Some(w) = &r.weak_signal {
        let t = w.thresholds()?;
        let used = match r.apply.as_deref().unwrap_or("acquisition") {
            "acquisition" => t.acquisition_dbhz,
            "tracking" => t
                .tracking_dbhz
                .ok_or("the carrier loop cannot hold the stated Doppler rate at any C/N0")?,
            "both" => t
                .tracking_dbhz
                .ok_or("the carrier loop cannot hold the stated Doppler rate at any C/N0")?
                .max(t.acquisition_dbhz),
            other => {
                return Err(format!(
                    "receiver.apply `{other}` is not acquisition, tracking or both"
                ))
            }
        };
        return Ok((Some(used), Some(t)));
    }
    if let Some(x) = r.cn0_min_dbhz {
        if !x.is_finite() {
            return Err("receiver.cn0_min_dbhz must be finite".into());
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
    ];
    for root in ["bands[].groups[]", "result.bands[].groups[]"] {
        v.push(f(
            leak(format!("{root}.at_least_1_pct")),
            "%",
            Computed,
            "share of (user, epoch) pairs with at least one signal",
        ));
        v.push(f(
            leak(format!("{root}.at_least_4_pct")),
            "%",
            Computed,
            "share with at least four signals",
        ));
        v.push(f(
            leak(format!("{root}.max_outage_1_min")),
            "min",
            Computed,
            "longest run without a signal at the worst user",
        ));
        v.push(f(
            leak(format!("{root}.max_outage_4_min")),
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
    /// Check the scenario without running it.
    pub fn validate(&self) -> Result<(), String> {
        match (&self.shell, &self.trajectory) {
            (Some(_), None) | (None, Some(_)) => {}
            _ => return Err("give exactly one of [shell] and [trajectory]".into()),
        }
        if self.constellations.include.is_empty() || self.constellations.bands.is_empty() {
            return Err("constellations.include and constellations.bands must not be empty".into());
        }
        threshold(&self.receiver)?;
        if let Some(s) = &self.shell {
            if !(s.altitude_km.is_finite() && s.altitude_km > 100.0) {
                return Err("shell.altitude_km must be above 100".into());
            }
            if s.grid_levels > 5 {
                return Err("shell.grid_levels above 5 is not supported".into());
            }
            if !matches!(s.antenna.as_str(), "hemisphere" | "omni") {
                return Err("shell.antenna must be hemisphere or omni".into());
            }
            if !tx_pattern(&self.transmit)?.is_booklet() {
                return Err("the shell sweep supports the booklet transmit pattern only (a shaped pattern needs the trajectory sweep)".into());
            }
            if self.atmosphere.is_some() {
                return Err("[atmosphere] applies to a [trajectory], not a [shell]".into());
            }
        }
        if let Some(t) = &self.trajectory {
            if t.preset.is_some() == t.orbit.is_some() {
                return Err("trajectory: give exactly one of preset and orbit".into());
            }
            if let Some(p) = &t.preset {
                if preset_orbit(p).is_none() {
                    return Err(format!(
                        "trajectory.preset `{p}` is not leo, meo, geo, heo or lunar-transfer"
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
                (Some(p), _) => preset_orbit(p).ok_or("unknown preset")?,
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
    format!(
        "gnss-ssv shell {:.0} km: {}",
        s.altitude_km,
        parts.join("; ")
    )
}

fn trajectory_summary(r: &TrajectoryResult) -> String {
    let mut parts = Vec::new();
    for b in &r.bands {
        if let Some(g) = b.groups.last() {
            parts.push(format!(
                "{} combined 1+ {:.1}% 4+ {:.1}% (max outage {:.0} min)",
                b.band.name(),
                g.availability.at_least_1_pct,
                g.availability.at_least_4_pct,
                g.availability.max_outage_1_min
            ));
        }
    }
    format!(
        "gnss-ssv trajectory {:.0} to {:.0} km altitude: {}",
        r.perigee_alt_km,
        r.apogee_alt_km,
        parts.join("; ")
    )
}

fn trajectory_csv(r: &TrajectoryResult) -> Option<String> {
    let first = r.bands.first()?;
    if first.series.is_empty() {
        return None;
    }
    let mut out = String::from("t_min,altitude_km");
    for b in &r.bands {
        out += &format!(",{0}_signals,{0}_best_cn0_dbhz", b.band.name());
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
