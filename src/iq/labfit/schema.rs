// SPDX-License-Identifier: AGPL-3.0-only
//! The lab-fit scenario: the runs, their stated test conditions, and the fit settings.
//!
//! The schema follows the `receiver-trust` scenario style: each run names its receiver log
//! with the same [`LogCfg`] (`format` plus one of `path`, `text` or `base64`), and every
//! time is in seconds since the first epoch of that log. Everything the fit depends on
//! (bounds, seeds, fold count, the loop settings held fixed) is stated in the scenario, so
//! it is fixed before the run and hashed into the report.
//!
//! ```toml
//! kind = "iq-labfit"
//! name = "bench, broadband noise, three ramps"
//!
//! [fit]
//! seed = 7
//! bootstrap = 50
//!
//! [[runs]]
//! label = "ramp-1dBps"
//! log = { format = "rinex", path = "logs/ramp1.obs" }
//! [runs.conditions]
//! onset_s = 60.0
//! offset_s = 180.0
//! level_kind = "cn0-drop"
//! interp = "linear"
//! levels = [{ t_s = 60.0, level_db = 0.0 }, { t_s = 100.0, level_db = 40.0 }]
//! doppler_rate_hz_per_s = 0.0
//!
//! [[predict]]
//! label = "45 dB step at 20 Hz/s"
//! run_end_s = 300.0
//! [predict.conditions]
//! onset_s = 0.0
//! offset_s = 120.0
//! levels = [{ t_s = 0.0, level_db = 45.0 }]
//! doppler_rate_hz_per_s = 20.0
//! ```

use serde::{Deserialize, Serialize};

use crate::jamming::{q_factor, CA_CHIP_RATE_HZ};
use crate::receiver_trust::scenario::LogCfg;

/// What a stated power level measures.
#[derive(Clone, Copy, Debug, Default, PartialEq, Eq, Serialize, Deserialize)]
#[serde(rename_all = "kebab-case")]
pub enum LevelKind {
    /// The level is the C/N0 drop (dB) the test intends to impose on every satellite:
    /// modelled C/N0 = nominal − (level + offset).
    #[default]
    Cn0Drop,
    /// The level is a jammer-to-signal ratio J/S (dB): modelled C/N0 is
    /// [`crate::jamming::effective_cn0_dbhz`] of the nominal C/N0 at `J/S = level + offset`.
    JOverS,
}

/// How the stated level varies between its time points.
#[derive(Clone, Copy, Debug, Default, PartialEq, Eq, Serialize, Deserialize)]
#[serde(rename_all = "kebab-case")]
pub enum Interp {
    /// Each point holds until the next one (a stepped test).
    #[default]
    Step,
    /// Straight lines between points (a ramped test).
    Linear,
}

/// One point of a stated power-level profile.
#[derive(Clone, Copy, Debug, PartialEq, Serialize, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct LevelPoint {
    /// Time of the point, seconds since the first epoch of the log.
    pub t_s: f64,
    /// Stated level at that time, dB (meaning set by [`LevelKind`]).
    pub level_db: f64,
}

/// The stated test conditions of one run: one interference event and the platform
/// dynamics.
#[derive(Clone, Debug, PartialEq, Serialize, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct Conditions {
    /// Event onset, seconds since the first epoch of the log.
    pub onset_s: f64,
    /// Event end, seconds since the first epoch; without it the event lasts to the end
    /// of the log.
    #[serde(default)]
    pub offset_s: Option<f64>,
    /// What the levels measure.
    #[serde(default)]
    pub level_kind: LevelKind,
    /// The stated level profile within the event. Empty when the test states no power
    /// level: the run then contributes observations only, not to the lock fit.
    #[serde(default)]
    pub levels: Vec<LevelPoint>,
    /// Step or linear interpolation between level points.
    #[serde(default)]
    pub interp: Interp,
    /// Jammer type for the spectral-separation factor of a `j-over-s` level
    /// ([`crate::jamming::q_factor`]); `broadband` when absent.
    #[serde(default)]
    pub jammer_type: Option<String>,
    /// Platform carrier Doppler rate during the run (Hz/s); 0 for a static antenna.
    #[serde(default)]
    pub doppler_rate_hz_per_s: f64,
    /// Platform code slew during the run (chips/s); 0 for a static antenna.
    #[serde(default)]
    pub code_slew_chips_per_s: f64,
}

impl Conditions {
    /// End of the event (s), `+∞` when the event runs to the end of the log.
    pub fn event_end_s(&self) -> f64 {
        self.offset_s.unwrap_or(f64::INFINITY)
    }

    /// The level points in time order.
    pub fn sorted_levels(&self) -> Vec<LevelPoint> {
        let mut v = self.levels.clone();
        v.sort_by(|a, b| a.t_s.total_cmp(&b.t_s));
        v
    }

    /// The stated level at time `t_s`, or `None` outside the event or when no level is
    /// stated. Before the first point the first level holds, after the last the last.
    pub fn level_at(&self, t_s: f64) -> Option<f64> {
        if t_s < self.onset_s || t_s >= self.event_end_s() {
            return None;
        }
        level_in(&self.sorted_levels(), self.interp, t_s)
    }

    /// The largest stated level, or `None` when no level is stated.
    pub fn peak_level_db(&self) -> Option<f64> {
        self.levels
            .iter()
            .map(|p| p.level_db)
            .fold(None, |m, v| Some(m.map_or(v, |m: f64| m.max(v))))
    }

    /// The spectral-separation factor used for a `j-over-s` level.
    pub fn q(&self) -> f64 {
        q_factor(self.jammer_type.as_deref().unwrap_or("broadband"), None)
    }

    /// Modelled C/N0 (dB-Hz) of a satellite of nominal C/N0 `nominal_dbhz` at stated
    /// level `level_db` with the calibration `offset_db` added to the level.
    pub fn cn0_at_level(&self, nominal_dbhz: f64, level_db: f64, offset_db: f64) -> f64 {
        match self.level_kind {
            LevelKind::Cn0Drop => nominal_dbhz - (level_db + offset_db),
            LevelKind::JOverS => crate::jamming::effective_cn0_dbhz(
                nominal_dbhz,
                level_db + offset_db,
                self.q(),
                CA_CHIP_RATE_HZ,
            ),
        }
    }

    /// Modelled C/N0 (dB-Hz) at time `t_s` (the nominal value outside the event).
    pub fn cn0_at(&self, nominal_dbhz: f64, t_s: f64, offset_db: f64) -> f64 {
        match self.level_at(t_s) {
            Some(l) => self.cn0_at_level(nominal_dbhz, l, offset_db),
            None => nominal_dbhz,
        }
    }

    /// The stated level above which a satellite of nominal C/N0 `nominal_dbhz` is below
    /// `threshold_dbhz`: modelled C/N0 < threshold ⇔ level > the returned value. The
    /// modelled C/N0 is strictly decreasing in the level for both level kinds, so the set
    /// is a half-line. `−∞` when the satellite is below the threshold at any level (the
    /// threshold is at or above its nominal C/N0 under a `j-over-s` level, or infinite).
    pub fn level_threshold(&self, nominal_dbhz: f64, threshold_dbhz: f64, offset_db: f64) -> f64 {
        if !threshold_dbhz.is_finite() {
            return if threshold_dbhz > 0.0 {
                f64::NEG_INFINITY
            } else {
                f64::INFINITY
            };
        }
        match self.level_kind {
            LevelKind::Cn0Drop => nominal_dbhz - threshold_dbhz - offset_db,
            LevelKind::JOverS => {
                let t_lin = 10f64.powf(threshold_dbhz / 10.0);
                let n_lin = 10f64.powf(nominal_dbhz / 10.0);
                let js_lin = self.q() * CA_CHIP_RATE_HZ * (1.0 / t_lin - 1.0 / n_lin);
                if js_lin <= 0.0 {
                    f64::NEG_INFINITY
                } else {
                    10.0 * js_lin.log10() - offset_db
                }
            }
        }
    }
}

/// Level at `t` from sorted points (no event-window check).
pub(crate) fn level_in(points: &[LevelPoint], interp: Interp, t: f64) -> Option<f64> {
    let first = points.first()?;
    let last = points.last()?;
    if t <= first.t_s {
        return Some(first.level_db);
    }
    if t >= last.t_s {
        return Some(last.level_db);
    }
    let k = points.partition_point(|p| p.t_s <= t);
    let (a, b) = (points[k - 1], points[k]);
    Some(match interp {
        Interp::Step => a.level_db,
        Interp::Linear => {
            let span = b.t_s - a.t_s;
            if span <= 0.0 {
                b.level_db
            } else {
                a.level_db + (b.level_db - a.level_db) * (t - a.t_s) / span
            }
        }
    })
}

/// One lab run: its receiver log and its stated conditions.
#[derive(Clone, Debug, PartialEq, Serialize, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct RunCfg {
    /// Name of the run (a test-plan slot).
    pub label: String,
    /// The receiver log, as in the `receiver-trust` scenario.
    pub log: LogCfg,
    /// The run's stated conditions.
    pub conditions: Conditions,
}

/// How per-satellite observations are read from a timeline.
#[derive(Clone, Debug, Default, PartialEq, Serialize, Deserialize)]
#[serde(deny_unknown_fields, default)]
pub struct ObserveCfg {
    /// Use only C/N0 entries of this band label (`S1C`, `L1`, ...); without it the first
    /// entry a satellite has at an epoch is used.
    pub band: Option<String>,
    /// Nominal C/N0 is the median over this many seconds before onset; without it, over
    /// every epoch before onset.
    pub pre_window_s: Option<f64>,
}

/// The tracking-loop settings held **fixed** in the loop model (stated, not fitted).
#[derive(Clone, Copy, Debug, PartialEq, Serialize, Deserialize)]
#[serde(deny_unknown_fields, default)]
pub struct LoopFixedCfg {
    /// Predetection integration time (s). Default 1 ms.
    pub integration_s: f64,
    /// Early-to-late correlator spacing (chips). Default 0.5.
    pub spacing_chips: f64,
    /// Code-loop noise bandwidth (Hz). Default 1 Hz.
    pub dll_bandwidth_hz: f64,
    /// Carrier `3σ + θ_e` allowance (deg). Default 45° (the 15-degree rule).
    pub carrier_allowance_deg: f64,
    /// Code `3σ + lag` allowance (chips); half the spacing when absent.
    pub code_allowance_chips: Option<f64>,
}

impl Default for LoopFixedCfg {
    fn default() -> Self {
        Self {
            integration_s: 0.001,
            spacing_chips: 0.5,
            dll_bandwidth_hz: 1.0,
            carrier_allowance_deg: crate::tracking_loop::COSTAS_THRESHOLD_DEG,
            code_allowance_chips: None,
        }
    }
}

/// Bounds of every fitted parameter, `[lower, upper]`.
#[derive(Clone, Copy, Debug, PartialEq, Serialize, Deserialize)]
#[serde(deny_unknown_fields, default)]
pub struct BoundsCfg {
    /// Loop model: carrier-loop noise bandwidth (Hz).
    pub pll_bandwidth_hz: [f64; 2],
    /// Loop model: pull-in to tracking bandwidth ratio.
    pub pullin_ratio: [f64; 2],
    /// Empirical model: C/N0 at which lock is dropped (dB-Hz).
    pub drop_cn0_dbhz: [f64; 2],
    /// Empirical model: re-lock minus drop threshold (dB).
    pub hysteresis_db: [f64; 2],
    /// Both models: time below the drop threshold before loss is declared (s).
    pub drop_dwell_s: [f64; 2],
    /// Both models: time above the re-lock threshold before reacquisition (s).
    pub relock_dwell_s: [f64; 2],
    /// Calibration offset added to every stated level (dB).
    pub level_offset_db: [f64; 2],
}

impl Default for BoundsCfg {
    fn default() -> Self {
        Self {
            pll_bandwidth_hz: [1.0, 40.0],
            pullin_ratio: [1.0, 8.0],
            drop_cn0_dbhz: [10.0, 45.0],
            hysteresis_db: [0.0, 15.0],
            drop_dwell_s: [0.0, 20.0],
            relock_dwell_s: [0.0, 60.0],
            level_offset_db: [-30.0, 30.0],
        }
    }
}

/// Fit and uncertainty settings.
#[derive(Clone, Copy, Debug, PartialEq, Serialize, Deserialize)]
#[serde(deny_unknown_fields, default)]
pub struct FitCfg {
    /// Seed of the bootstrap resampling and of the k-fold assignment.
    pub seed: u64,
    /// Bootstrap replicates over runs (0 = none).
    pub bootstrap: usize,
    /// Cross-validation folds; 0, or at least the number of runs, means leave one run out.
    pub folds: usize,
    /// Grid points per parameter for the starting grid of the lock fit.
    pub grid_points: usize,
    /// Objective evaluations allowed per Nelder-Mead pass.
    pub max_evals: usize,
}

impl Default for FitCfg {
    fn default() -> Self {
        Self {
            seed: 1,
            bootstrap: 50,
            folds: 0,
            grid_points: 5,
            max_evals: 2000,
        }
    }
}

/// Scales that make the condition coordinates comparable when measuring how far a
/// condition is from the tested ones: each coordinate is divided by its scale.
#[derive(Clone, Copy, Debug, PartialEq, Serialize, Deserialize)]
#[serde(deny_unknown_fields, default)]
pub struct ScaleCfg {
    /// Scale of the peak stated level (dB). Default 1 dB.
    pub level_db: f64,
    /// Scale of the Doppler rate (Hz/s). Default 1 Hz/s.
    pub doppler_rate_hz_per_s: f64,
    /// Scale of the code slew (chips/s). Default 1 chip/s.
    pub code_slew_chips_per_s: f64,
}

impl Default for ScaleCfg {
    fn default() -> Self {
        Self {
            level_db: 1.0,
            doppler_rate_hz_per_s: 1.0,
            code_slew_chips_per_s: 1.0,
        }
    }
}

/// A condition to predict loss of lock for.
#[derive(Clone, Debug, PartialEq, Serialize, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct PredictCfg {
    /// Name of the query.
    pub label: String,
    /// Nominal C/N0 of the satellite (dB-Hz); the median nominal over the fitted runs
    /// when absent.
    #[serde(default)]
    pub nominal_cn0_dbhz: Option<f64>,
    /// The hypothetical test conditions.
    pub conditions: Conditions,
    /// Length of the hypothetical run (s from its time origin).
    pub run_end_s: f64,
}

/// An `iq-labfit` scenario.
#[derive(Clone, Debug, Default, PartialEq, Serialize, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct LabFitScenario {
    /// The scenario kind tag (`iq-labfit`); ignored by the runner.
    #[serde(default)]
    pub kind: Option<String>,
    /// Free-text name.
    #[serde(default)]
    pub name: Option<String>,
    /// Observation extraction.
    #[serde(default)]
    pub observe: ObserveCfg,
    /// Loop settings held fixed in the tracking-loop model.
    #[serde(default)]
    pub loop_fixed: LoopFixedCfg,
    /// Parameter bounds.
    #[serde(default)]
    pub bounds: BoundsCfg,
    /// Fit settings.
    #[serde(default)]
    pub fit: FitCfg,
    /// Condition-distance scales.
    #[serde(default)]
    pub scales: ScaleCfg,
    /// The lab runs.
    #[serde(default)]
    pub runs: Vec<RunCfg>,
    /// Conditions to predict for.
    #[serde(default)]
    pub predict: Vec<PredictCfg>,
}
