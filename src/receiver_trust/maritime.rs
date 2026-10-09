// SPDX-License-Identifier: AGPL-3.0-only
//! Moving-platform trust monitors: can the bridge trust this fix?
//!
//! These monitors run on what a vessel's receiver and instruments already put on an NMEA
//! 0183 bus (position, speed and course over ground, gyro heading, speed through the water,
//! antenna altitude, per-satellite C/N0, the time), plus the receiver's own security
//! reports where it gives them (u-blox UBX-SEC-SIG, a reported OSNMA status). They look
//! for disagreement between independent sources: a counterfeit position has to be
//! consistent with a ship's physics and with the ship's other sensors, and a spoofer
//! that is not consistent with all of them leaves a trace.
//!
//! **Causal.** [`MarineMonitors::push`] is called once per epoch in time order and uses
//! only that epoch and earlier ones: the calibration baseline is frozen when the
//! calibration window ends, and every window looks backwards. A live stream and a file
//! therefore give the same decision at the same epoch, and truncating a log never changes
//! the decisions before the cut.
//!
//! **Alarm statistics.** Each monitor reduces its evidence to a ratio `statistic /
//! threshold`; the monitor alarms when the ratio reaches 1. The ratios are reported per
//! epoch and are what the trust score of [`super::score`] maps to a deduction, so a score
//! and an alarm can never disagree.
//!
//! **What they cannot do.** They see only the NMEA sentences. A spoofer that reproduces a
//! consistent position, velocity, heading-compatible course, plausible C/N0 spread and a
//! matching clock is invisible to them; the sensors that must disagree for a detection
//! (gyro, log) also have to be on the bus and valid.

use std::collections::{BTreeMap, VecDeque};

use serde::{Deserialize, Serialize};

use super::monitors::Monitor;
use super::platform::{VesselLimits, KN_TO_MPS};
use super::{LogEpoch, OsnmaStatus};

/// Mean Earth radius-independent WGS84 constants for the local east-north offset.
const WGS84_A: f64 = 6_378_137.0;
const WGS84_E2: f64 = 0.006_694_379_990_14;

/// Thresholds of the moving-platform monitors, stated before the run in a `[maritime]`
/// table. Each default is documented with the reason for its value; none is tuned to a
/// log.
#[derive(Clone, Debug, PartialEq, Serialize, Deserialize)]
#[serde(deny_unknown_fields, default)]
pub struct MaritimeConfig {
    /// Baseline of every kinematic comparison: the position change over this many seconds
    /// is compared with the vessel's own motion. Default 30 s: long enough that the
    /// few-metre scatter of a single-frequency fix is small against a ship's motion (a
    /// 0.4 m/s drag is already 12 m), short enough that the monitor reacts within about
    /// half a minute. A 5 s window runs alongside it to catch a jump.
    pub kin_window_s: f64,
    /// Position-change allowance of the kinematic checks, m. Default 12: the
    /// epoch-to-epoch error of a standard single-frequency receiver is mostly common
    /// between epochs (a few metres), and 12 m is above the residual that remains after a
    /// 30 s dead-reckoning comparison on a steady course.
    pub kin_pos_tol_m: f64,
    /// Fraction of the dead-reckoned distance added to the allowance, for speed and course
    /// quantisation. Default 0.02: a 2 % speed error, larger than the 0.1-0.2 kn a
    /// receiver's speed over ground carries.
    pub kin_sog_frac: f64,
    /// Guard band of the vessel-limit checks (implied speed, acceleration, turn rate): the
    /// ratio of such a check is 0 up to this fraction of the stated limit and 1 at the limit
    /// itself. Default 0.8: a vessel under way is routinely at half or more of its stated
    /// limits (a 15 kn ship against a 20 kn limit), which is no evidence of anything; only the
    /// last fifth of the limit counts as approaching it. The alarm (ratio 1) is at the limit
    /// itself either way.
    pub kin_limit_guard: f64,
    /// Below this speed over ground the course over ground and the track bearing carry no
    /// meaning and the turn-rate and heading checks are skipped, kn. Default 3: where a
    /// receiver's course noise stops dominating the actual course.
    pub min_speed_kn: f64,
    /// Heading against course over ground: the largest difference tolerated, deg. Default
    /// 10: the crab angle of a 15 kn vessel in a 2.6 kn cross-set is about 10 deg, a
    /// stronger set than a coastal passage sees.
    pub hdg_cog_tol_deg: f64,
    /// Speed through the water against speed over ground: the largest difference
    /// tolerated, kn. Default 2: a 1.5 kn current (a strong tidal stream) plus 0.5 kn of
    /// speed-log error.
    pub stw_sog_tol_kn: f64,
    /// Antenna altitude above mean sea level against the stated antenna height above the
    /// waterline: the largest difference tolerated, m. Default 15: the vertical error of a
    /// standard single-frequency fix (about 10-12 m at 95 %) plus a tide and a draught
    /// change.
    pub sea_level_tol_m: f64,
    /// Median window of the heading, speed-log and sea-level checks, s. Default 10: wide
    /// enough to ignore a single bad sentence, narrow enough not to delay an alarm by
    /// more than a few epochs.
    pub smooth_s: f64,
    /// C/N0 spread collapse: alarm when the spread of C/N0 across tracked satellites falls
    /// to this fraction of its calibration median. Default 0.5: real signals differ by
    /// elevation and sky view, so their spread is several dB; counterfeit signals from one
    /// transmitter arrive at near-equal power.
    pub cn0_spread_frac: f64,
    /// Fewest satellites for a spread decision. Default 6: below that the standard
    /// deviation is too noisy to compare.
    pub cn0_spread_min_sats: usize,
    /// A calibration spread below this carries no collapse to detect, dB. Default 2.
    pub cn0_spread_min_base_db: f64,
    /// C/N0 rising together: alarm when the mean C/N0 of the satellites common with the
    /// baseline is this much above it, dB, *and* at least [`Self::cn0_rise_frac`] of them
    /// rose by [`Self::cn0_rise_sat_db`]. Default 3: above the few-dB wander of a
    /// moving antenna, and a counterfeit set arrives stronger than the live one.
    pub cn0_rise_db: f64,
    /// Per-satellite rise that counts as having risen, dB. Default 2.
    pub cn0_rise_sat_db: f64,
    /// Fraction of common satellites that must have risen. Default 0.8: the signature is
    /// a rise of all signals together, not one satellite's multipath.
    pub cn0_rise_frac: f64,
    /// Time consistency: a step between the times of consecutive epochs that differs from
    /// the calibration cadence by more than this, s, alarms; time running backwards always
    /// alarms. Default 1.5: one missing epoch at 1 Hz is a real dropout and passes.
    pub time_step_tol_s: f64,
    /// Time consistency against a monotonic host clock (live input): the receiver's time
    /// minus the host clock departing from its calibration median by more than this, s.
    /// Default 1: an order above the jitter of a serial or network stream.
    pub time_offset_tol_s: f64,
}

impl Default for MaritimeConfig {
    fn default() -> Self {
        Self {
            kin_window_s: 30.0,
            kin_pos_tol_m: 12.0,
            kin_sog_frac: 0.02,
            kin_limit_guard: 0.8,
            min_speed_kn: 3.0,
            hdg_cog_tol_deg: 10.0,
            stw_sog_tol_kn: 2.0,
            sea_level_tol_m: 15.0,
            smooth_s: 10.0,
            cn0_spread_frac: 0.5,
            cn0_spread_min_sats: 6,
            cn0_spread_min_base_db: 2.0,
            cn0_rise_db: 3.0,
            cn0_rise_sat_db: 2.0,
            cn0_rise_frac: 0.8,
            time_step_tol_s: 1.5,
            time_offset_tol_s: 1.0,
        }
    }
}

impl MaritimeConfig {
    /// True for the defaults; used to leave the table out of serialised static scenarios.
    pub fn is_default(&self) -> bool {
        *self == MaritimeConfig::default()
    }

    /// Reject thresholds no monitor can use.
    pub fn validate(&self) -> Result<(), String> {
        for (name, v) in [
            ("kin_window_s", self.kin_window_s),
            ("kin_pos_tol_m", self.kin_pos_tol_m),
            ("min_speed_kn", self.min_speed_kn),
            ("hdg_cog_tol_deg", self.hdg_cog_tol_deg),
            ("stw_sog_tol_kn", self.stw_sog_tol_kn),
            ("sea_level_tol_m", self.sea_level_tol_m),
            ("smooth_s", self.smooth_s),
            ("cn0_spread_min_base_db", self.cn0_spread_min_base_db),
            ("cn0_rise_db", self.cn0_rise_db),
            ("cn0_rise_sat_db", self.cn0_rise_sat_db),
            ("time_step_tol_s", self.time_step_tol_s),
            ("time_offset_tol_s", self.time_offset_tol_s),
        ] {
            if !(v.is_finite() && v > 0.0) {
                return Err(format!("maritime: {name} must be finite and > 0 (got {v})"));
            }
        }
        if !(self.kin_limit_guard.is_finite()
            && self.kin_limit_guard > 0.0
            && self.kin_limit_guard < 1.0)
        {
            return Err(format!(
                "maritime: kin_limit_guard must be in (0, 1) (got {})",
                self.kin_limit_guard
            ));
        }
        if !(self.kin_sog_frac.is_finite() && (0.0..=1.0).contains(&self.kin_sog_frac)) {
            return Err(format!(
                "maritime: kin_sog_frac must be in [0, 1] (got {})",
                self.kin_sog_frac
            ));
        }
        for (name, v) in [
            ("cn0_spread_frac", self.cn0_spread_frac),
            ("cn0_rise_frac", self.cn0_rise_frac),
        ] {
            if !(v.is_finite() && v > 0.0 && v < 1.0) {
                return Err(format!("maritime: {name} must be in (0, 1) (got {v})"));
            }
        }
        if self.cn0_spread_min_sats < 3 {
            return Err("maritime: cn0_spread_min_sats must be at least 3".into());
        }
        if self.kin_window_s < 2.0 {
            return Err("maritime: kin_window_s must be at least 2 s".into());
        }
        Ok(())
    }
}

/// The statistics of the moving-platform monitors at one epoch. A `None` is a monitor that
/// did not decide (its input was absent or its history not yet long enough).
#[derive(Clone, Debug, Default, PartialEq, Serialize, Deserialize)]
pub struct MarineStats {
    /// Implied speed over the window, m/s.
    pub kin_speed_mps: Option<f64>,
    /// Position change minus the displacement the reported speed and course predict, m.
    pub kin_resid_m: Option<f64>,
    /// Implied acceleration, m/s².
    pub kin_accel_mps2: Option<f64>,
    /// Implied turn rate, deg/s.
    pub kin_turn_dps: Option<f64>,
    /// Median |heading - course over ground| over the smoothing window, deg.
    pub hdg_cog_deg: Option<f64>,
    /// Median |speed over ground - speed through the water| over the window, kn.
    pub stw_sog_kn: Option<f64>,
    /// Median |antenna altitude - stated antenna height| over the window, m.
    pub sea_level_m: Option<f64>,
    /// Spread (standard deviation) of C/N0 across tracked satellites, dB.
    pub cn0_spread_db: Option<f64>,
    /// Mean C/N0 rise of the satellites common with the baseline, dB.
    pub cn0_rise_db: Option<f64>,
    /// Step between the epoch's time and the previous epoch's, minus the cadence, s.
    pub time_step_dev_s: Option<f64>,
    /// Receiver time minus host clock, departure from its calibration median, s.
    pub time_offset_dev_s: Option<f64>,
}

/// What the moving-platform monitors say about one epoch.
#[derive(Clone, Debug, Default, PartialEq, Serialize, Deserialize)]
pub struct MarineEpoch {
    /// The receiver's reported position `[latitude, longitude]`, degrees, where the epoch
    /// has a fix (for the track of the chart).
    #[serde(default, skip_serializing_if = "Option::is_none")]
    pub position: Option<[f64; 2]>,
    /// The statistics.
    pub stats: MarineStats,
    /// Alarm statistic of every monitor that decided, as `statistic / threshold` (alarm at
    /// 1 or more), in [`Monitor`] order.
    pub ratios: Vec<(Monitor, f64)>,
}

impl MarineEpoch {
    /// Monitors that alarmed.
    pub fn alarms(&self) -> impl Iterator<Item = Monitor> + '_ {
        self.ratios
            .iter()
            .filter(|(_, r)| *r >= 1.0)
            .map(|(m, _)| *m)
    }
}

/// East and north metres from the first point to the second (local tangent plane, WGS84
/// radii at the mid-latitude; good to well under a metre over tens of kilometres).
pub fn en_offset_m(lat0: f64, lon0: f64, lat1: f64, lon1: f64) -> (f64, f64) {
    let phi = ((lat0 + lat1) / 2.0).to_radians();
    let s2 = phi.sin().powi(2);
    let w = (1.0 - WGS84_E2 * s2).sqrt();
    let n_radius = WGS84_A / w;
    let m_radius = WGS84_A * (1.0 - WGS84_E2) / (w * w * w);
    let dlon = (lon1 - lon0 + 540.0).rem_euclid(360.0) - 180.0;
    (
        dlon.to_radians() * n_radius * phi.cos(),
        (lat1 - lat0).to_radians() * m_radius,
    )
}

/// Smallest signed angle from `b` to `a`, degrees in `[-180, 180)`.
fn ang_diff_deg(a: f64, b: f64) -> f64 {
    (a - b + 540.0).rem_euclid(360.0) - 180.0
}

/// The alarm ratio of a limit-type check: 0 up to `guard` times the limit, 1 at the limit,
/// rising linearly beyond. Alarms exactly when `x >= limit`.
fn limit_ratio(x: f64, limit: f64, guard: f64) -> f64 {
    ((x / limit - guard) / (1.0 - guard)).max(0.0)
}

fn median(v: &[f64]) -> Option<f64> {
    if v.is_empty() {
        return None;
    }
    let mut s = v.to_vec();
    s.sort_by(f64::total_cmp);
    let n = s.len();
    Some(if n % 2 == 1 {
        s[n / 2]
    } else {
        0.5 * (s[n / 2 - 1] + s[n / 2])
    })
}

/// A rolling window of `(time, value)` samples.
#[derive(Default)]
struct Window(VecDeque<(f64, f64)>);

impl Window {
    /// Add a sample and drop those older than `span` before it; the median of what is left.
    fn push_median(&mut self, t: f64, v: f64, span: f64) -> f64 {
        self.0.push_back((t, v));
        while self.0.front().is_some_and(|(t0, _)| t - *t0 > span) {
            self.0.pop_front();
        }
        let vals: Vec<f64> = self.0.iter().map(|(_, v)| *v).collect();
        median(&vals).unwrap_or(v)
    }
}

/// One valid fix and the receiver's reported velocity at it.
#[derive(Clone, Copy)]
struct FixPt {
    t: f64,
    lat: f64,
    lon: f64,
    /// East and north velocity from the reported speed and course, m/s.
    vel: Option<(f64, f64)>,
}

/// The C/N0 baseline frozen at the end of the calibration window.
struct CnBaseline {
    per_sat: BTreeMap<(String, String), f64>,
    spread_db: Option<f64>,
}

/// The causal moving-platform monitors. Feed epochs in time order with [`Self::push`].
pub struct MarineMonitors {
    cfg: MaritimeConfig,
    limits: VesselLimits,
    cal_s: f64,
    fixes: VecDeque<FixPt>,
    hdg: Window,
    stw: Window,
    sea: Window,
    off: Window,
    cal_samples: BTreeMap<(String, String), Vec<f64>>,
    cal_spreads: Vec<f64>,
    cal_steps: Vec<f64>,
    cal_offsets: Vec<f64>,
    baseline: Option<CnBaseline>,
    cadence_s: f64,
    offset_base_s: Option<f64>,
}

fn spread(v: &[f64]) -> f64 {
    let n = v.len() as f64;
    let m = v.iter().sum::<f64>() / n;
    (v.iter().map(|x| (x - m).powi(2)).sum::<f64>() / n).sqrt()
}

impl MarineMonitors {
    /// New monitors for a vessel with `limits`; epochs before `calibration_s` seconds only
    /// form the baseline.
    pub fn new(cfg: &MaritimeConfig, limits: VesselLimits, calibration_s: f64) -> Self {
        Self {
            cfg: cfg.clone(),
            limits,
            cal_s: calibration_s,
            fixes: VecDeque::new(),
            hdg: Window::default(),
            stw: Window::default(),
            sea: Window::default(),
            off: Window::default(),
            cal_samples: BTreeMap::new(),
            cal_spreads: Vec::new(),
            cal_steps: Vec::new(),
            cal_offsets: Vec::new(),
            baseline: None,
            cadence_s: 1.0,
            offset_base_s: None,
        }
    }

    /// The speed-and-course velocity of an epoch, east and north m/s, when both are known.
    fn velocity(e: &LogEpoch) -> Option<(f64, f64)> {
        let m = e.marine.as_ref()?;
        let (sog, cog) = (m.sog_kn?, m.cog_deg?);
        let (s, c) = cog.to_radians().sin_cos();
        Some((sog * KN_TO_MPS * s, sog * KN_TO_MPS * c))
    }

    fn freeze_baseline(&mut self) {
        if self.baseline.is_some() {
            return;
        }
        let per_sat = self
            .cal_samples
            .iter()
            .filter_map(|(k, v)| median(v).map(|m| (k.clone(), m)))
            .collect();
        self.baseline = Some(CnBaseline {
            per_sat,
            spread_db: median(&self.cal_spreads),
        });
        let pos_steps: Vec<f64> = self
            .cal_steps
            .iter()
            .copied()
            .filter(|d| *d > 0.0)
            .collect();
        self.cadence_s = median(&pos_steps).unwrap_or(1.0);
        self.offset_base_s = median(&self.cal_offsets);
    }

    /// Process one epoch.
    pub fn push(&mut self, e: &LogEpoch) -> MarineEpoch {
        let post = e.t_s >= self.cal_s;
        if post {
            self.freeze_baseline();
        }
        let mut out = MarineEpoch {
            position: e.fix.map(|f| [f.lat_deg, f.lon_deg]),
            ..MarineEpoch::default()
        };
        let mut ratios: BTreeMap<Monitor, f64> = BTreeMap::new();
        let marine = e.marine.as_ref();
        let valid = marine.is_none_or(|m| m.fix_valid != Some(false));
        let cfg = self.cfg.clone();

        // ---- C/N0 baseline and uniformity -------------------------------------------
        let cn: Vec<f64> = e.cn0.iter().map(|c| c.cn0_dbhz).collect();
        let spread_now = (cn.len() >= cfg.cn0_spread_min_sats).then(|| spread(&cn));
        if !post {
            for c in &e.cn0 {
                self.cal_samples
                    .entry((c.sat.clone(), c.band.clone()))
                    .or_default()
                    .push(c.cn0_dbhz);
            }
            if let Some(sd) = spread_now {
                self.cal_spreads.push(sd);
            }
            if let Some(d) = marine.and_then(|m| m.time_step_s) {
                self.cal_steps.push(d);
            }
            if let Some(a) = marine.and_then(|m| m.arrival_s) {
                self.cal_offsets.push(a - e.t_s);
            }
        } else if let Some(base) = &self.baseline {
            out.stats.cn0_spread_db = spread_now;
            if let (Some(sd), Some(sd0)) = (spread_now, base.spread_db) {
                if sd0 >= cfg.cn0_spread_min_base_db {
                    // 0 at the baseline, 1 when the spread has fallen to the stated fraction.
                    let r = ((sd0 - sd) / (sd0 * (1.0 - cfg.cn0_spread_frac))).max(0.0);
                    ratios.insert(Monitor::Cn0Spread, r);
                }
            }
            let rises: Vec<f64> = e
                .cn0
                .iter()
                .filter_map(|c| {
                    base.per_sat
                        .get(&(c.sat.clone(), c.band.clone()))
                        .map(|b| c.cn0_dbhz - b)
                })
                .collect();
            if rises.len() >= cfg.cn0_spread_min_sats.min(5) {
                let mean = rises.iter().sum::<f64>() / rises.len() as f64;
                let frac = rises.iter().filter(|r| **r >= cfg.cn0_rise_sat_db).count() as f64
                    / rises.len() as f64;
                out.stats.cn0_rise_db = Some(mean);
                let r = (mean / cfg.cn0_rise_db)
                    .min(frac / cfg.cn0_rise_frac)
                    .max(0.0);
                ratios.insert(Monitor::Cn0Rise, r);
            }
        }

        // ---- time consistency ---------------------------------------------------------
        if let Some(m) = marine {
            if post {
                if let Some(d) = m.time_step_s {
                    let dev = d - self.cadence_s;
                    out.stats.time_step_dev_s = Some(dev);
                    let mut r = dev.abs() / cfg.time_step_tol_s;
                    if d < 0.0 {
                        r = r.max(1.0 + d.abs() / cfg.time_step_tol_s);
                    }
                    ratios.insert(Monitor::TimeConsistency, r);
                }
                if let (Some(a), Some(base)) = (m.arrival_s, self.offset_base_s) {
                    let med = self.off.push_median(e.t_s, a - e.t_s, cfg.smooth_s);
                    let dev = med - base;
                    out.stats.time_offset_dev_s = Some(dev);
                    let r = dev.abs() / cfg.time_offset_tol_s;
                    let slot = ratios.entry(Monitor::TimeConsistency).or_insert(0.0);
                    *slot = slot.max(r);
                }
            } else if let Some(a) = m.arrival_s {
                self.off.push_median(e.t_s, a - e.t_s, cfg.smooth_s);
            }
        }

        // ---- kinematics: valid fixes only --------------------------------------------
        if let (Some(f), true) = (e.fix, valid) {
            let now = FixPt {
                t: e.t_s,
                lat: f.lat_deg,
                lon: f.lon_deg,
                vel: Self::velocity(e),
            };
            if post {
                self.kinematics(now, &mut out.stats, &mut ratios);
            }
            self.fixes.push_back(now);
            let keep = 2.0 * cfg.kin_window_s + 10.0;
            while self.fixes.front().is_some_and(|p| now.t - p.t > keep) {
                self.fixes.pop_front();
            }
        }

        if let (Some(m), true) = (marine, valid) {
            let sog = m.sog_kn.filter(|s| *s >= self.cfg.min_speed_kn);
            // ---- heading against course ----------------------------------------------
            if let (true, Some(h), Some(c), Some(_)) =
                (self.limits.heading_sensor, m.heading_deg, m.cog_deg, sog)
            {
                let med = self
                    .hdg
                    .push_median(e.t_s, ang_diff_deg(h, c).abs(), cfg.smooth_s);
                if post {
                    out.stats.hdg_cog_deg = Some(med);
                    ratios.insert(Monitor::HeadingCourse, med / cfg.hdg_cog_tol_deg);
                }
            }
            // ---- speed log against speed over ground ---------------------------------
            if let (Some(s), Some(w)) = (m.sog_kn, m.stw_kn) {
                let med = self.stw.push_median(e.t_s, (s - w).abs(), cfg.smooth_s);
                if post {
                    out.stats.stw_sog_kn = Some(med);
                    ratios.insert(Monitor::SpeedLog, med / cfg.stw_sog_tol_kn);
                }
            }
            // ---- sea level -----------------------------------------------------------
            if let (Some(h0), Some(alt)) = (self.limits.antenna_height_m, m.alt_msl_m) {
                let med = self.sea.push_median(e.t_s, (alt - h0).abs(), cfg.smooth_s);
                if post {
                    out.stats.sea_level_m = Some(med);
                    ratios.insert(Monitor::SeaLevel, med / cfg.sea_level_tol_m);
                }
            }
        }

        // ---- receiver security reports ------------------------------------------------
        if let (true, Some(m)) = (post, marine) {
            if let Some(j) = m.sec_jam_state {
                ratios.insert(Monitor::SecJam, f64::from(j) / 2.0);
            }
            if let Some(s) = m.sec_spoof_state {
                ratios.insert(Monitor::SecSpoof, f64::from(s) / 2.0);
            }
            match m.osnma {
                Some(OsnmaStatus::Failed) => {
                    // A failure is a statement, not a statistic: it costs the whole weight.
                    ratios.insert(Monitor::Osnma, 1.5);
                }
                Some(OsnmaStatus::Authenticated) => {
                    ratios.insert(Monitor::Osnma, 0.0);
                }
                Some(OsnmaStatus::Unavailable) | None => {}
            }
        }

        out.ratios = ratios.into_iter().collect();
        out
    }

    /// The kinematic checks of the fix `now` against the history before it.
    fn kinematics(&self, now: FixPt, stats: &mut MarineStats, ratios: &mut BTreeMap<Monitor, f64>) {
        let c = &self.cfg;
        let vmax = self.limits.max_speed_mps;
        let w = c.kin_window_s;
        // The latest earlier fix at least `age` seconds back.
        let anchor = |from_t: f64, age: f64| -> Option<FixPt> {
            self.fixes
                .iter()
                .rev()
                .find(|p| from_t - p.t >= age)
                .copied()
        };
        let mut r_speed: Option<f64> = None;
        let mut r_resid: Option<f64> = None;
        for age in [5.0_f64.min(w), w] {
            let Some(a) = anchor(now.t, age) else {
                continue;
            };
            let dt = now.t - a.t;
            let (de, dn) = en_offset_m(a.lat, a.lon, now.lat, now.lon);
            let dist = de.hypot(dn);
            let speed = dist / dt;
            if age == w {
                stats.kin_speed_mps = Some(speed);
            }
            let over = limit_ratio(
                ((dist - c.kin_pos_tol_m) / dt).max(0.0),
                vmax,
                c.kin_limit_guard,
            );
            r_speed = Some(r_speed.map_or(over, |x: f64| x.max(over)));

            // Dead reckoning from the reported velocities of the fixes in the interval.
            let seg: Vec<FixPt> = self
                .fixes
                .iter()
                .filter(|p| p.t >= a.t)
                .copied()
                .chain(std::iter::once(now))
                .collect();
            if seg.iter().all(|p| p.vel.is_some()) && seg.len() >= 2 {
                let (mut pe, mut pn, mut path) = (0.0, 0.0, 0.0);
                for pair in seg.windows(2) {
                    let (v0, v1) = (
                        pair[0].vel.unwrap_or_default(),
                        pair[1].vel.unwrap_or_default(),
                    );
                    let h = pair[1].t - pair[0].t;
                    let (ve, vn) = (0.5 * (v0.0 + v1.0), 0.5 * (v0.1 + v1.1));
                    pe += ve * h;
                    pn += vn * h;
                    path += ve.hypot(vn) * h;
                }
                let resid = (de - pe).hypot(dn - pn);
                if age == w {
                    stats.kin_resid_m = Some(resid);
                }
                let allowed = c.kin_pos_tol_m + c.kin_sog_frac * path;
                let r = resid / allowed;
                r_resid = Some(r_resid.map_or(r, |x: f64| x.max(r)));
            }
        }
        // Acceleration and turn rate from the velocities of two consecutive windows.
        if let Some(a1) = anchor(now.t, w) {
            if let Some(a2) = anchor(a1.t, w) {
                let (dt2, dt1) = (now.t - a1.t, a1.t - a2.t);
                let (e2, n2) = en_offset_m(a1.lat, a1.lon, now.lat, now.lon);
                let (e1, n1) = en_offset_m(a2.lat, a2.lon, a1.lat, a1.lon);
                let (v2, v1) = ((e2 / dt2, n2 / dt2), (e1 / dt1, n1 / dt1));
                let unc = c.kin_pos_tol_m / dt2 + c.kin_pos_tol_m / dt1;
                let dv = (v2.0 - v1.0).hypot(v2.1 - v1.1);
                let span = 0.5 * (dt1 + dt2);
                let accel = (dv - unc).max(0.0) / span;
                stats.kin_accel_mps2 = Some(accel);
                let r_acc = limit_ratio(accel, self.limits.max_accel_mps2, c.kin_limit_guard);
                let (s1, s2) = (v1.0.hypot(v1.1), v2.0.hypot(v2.1));
                let min_v = c.min_speed_kn * KN_TO_MPS;
                let mut r_turn = None;
                if s1 >= min_v && s2 >= min_v {
                    let b1 = v1.0.atan2(v1.1).to_degrees();
                    let b2 = v2.0.atan2(v2.1).to_degrees();
                    let unc_deg = ((c.kin_pos_tol_m / dt1) / s1 + (c.kin_pos_tol_m / dt2) / s2)
                        .atan()
                        .to_degrees();
                    let rate = (ang_diff_deg(b2, b1).abs() - unc_deg).max(0.0) / span;
                    stats.kin_turn_dps = Some(rate);
                    r_turn = Some(limit_ratio(
                        rate,
                        self.limits.max_turn_rate_dps,
                        c.kin_limit_guard,
                    ));
                }
                let r = [Some(r_acc), r_turn, r_speed, r_resid]
                    .into_iter()
                    .flatten()
                    .fold(0.0_f64, f64::max);
                ratios.insert(Monitor::Kinematic, r);
                return;
            }
        }
        let r = [r_speed, r_resid]
            .into_iter()
            .flatten()
            .fold(None, |a: Option<f64>, x| Some(a.map_or(x, |y| y.max(x))));
        if let Some(r) = r {
            ratios.insert(Monitor::Kinematic, r);
        }
    }
}
