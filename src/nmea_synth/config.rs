// SPDX-License-Identifier: AGPL-3.0-only
//! The training-scenario TOML: vessel, environment, receiver, output and scripted events.
//!
//! Every struct refuses unknown keys, so a mistyped parameter is an error the trainer sees
//! instead of an event that silently does nothing.

use serde::{Deserialize, Serialize};

/// Metres per nautical mile over seconds per hour: one knot in m/s.
pub const KN_MPS: f64 = 1852.0 / 3600.0;

/// A whole training scenario.
#[derive(Clone, Debug, Deserialize, Serialize)]
#[serde(deny_unknown_fields)]
pub struct TrainingScenario {
    /// Name, time base, duration and seed.
    pub scenario: ScenarioMeta,
    /// The vessel and how it manoeuvres.
    pub vessel: VesselCfg,
    /// Waypoints the vessel steers through, in order (`[[waypoint]]`).
    #[serde(default, rename = "waypoint")]
    pub waypoints: Vec<Waypoint>,
    /// Current and magnetic variation.
    #[serde(default)]
    pub environment: EnvCfg,
    /// The receiver whose output is imitated.
    #[serde(default)]
    pub receiver: ReceiverCfg,
    /// Which sentences are written, and the instructor-log cadence.
    #[serde(default)]
    pub output: OutputCfg,
    /// Scripted events (`[[event]]`).
    #[serde(default, rename = "event")]
    pub events: Vec<EventCfg>,
}

/// `[scenario]`.
#[derive(Clone, Debug, Deserialize, Serialize)]
#[serde(deny_unknown_fields)]
pub struct ScenarioMeta {
    /// Short name; used for default output file names.
    pub name: String,
    /// One-sentence description.
    #[serde(default)]
    pub description: String,
    /// Short note for the trainer: what the scenario shows and what to look for.
    #[serde(default)]
    pub trainer_note: String,
    /// Seed for every random draw; the same seed gives the same bytes.
    #[serde(default = "one")]
    pub seed: u64,
    /// UTC start of the stream, `YYYY-MM-DDTHH:MM:SSZ`.
    pub start_utc: String,
    /// Length of the run, seconds.
    pub duration_s: f64,
    /// Epochs per second: 1, 2, 5 or 10.
    #[serde(default = "one_f")]
    pub rate_hz: f64,
}

fn one() -> u64 {
    1
}
fn one_f() -> f64 {
    1.0
}

/// `[vessel]`.
#[derive(Clone, Debug, Deserialize, Serialize)]
#[serde(deny_unknown_fields)]
pub struct VesselCfg {
    /// Start latitude, degrees north.
    pub lat_deg: f64,
    /// Start longitude, degrees east.
    pub lon_deg: f64,
    /// Start heading, degrees true; default is the bearing to the first waypoint.
    pub heading_deg: Option<f64>,
    /// Speed through the water at the start, knots.
    pub speed_kn: f64,
    /// Rate-of-turn limit, degrees per minute.
    #[serde(default = "d_rot")]
    pub max_rot_deg_per_min: f64,
    /// How fast the rate of turn may build up, degrees per second squared.
    #[serde(default = "d_rot_acc")]
    pub max_rot_accel_deg_per_s2: f64,
    /// Speed change limit, knots per minute.
    #[serde(default = "d_acc")]
    pub max_accel_kn_per_min: f64,
    /// Slow to a stop at the last waypoint instead of holding course and speed.
    #[serde(default)]
    pub stop_at_end: bool,
}

fn d_rot() -> f64 {
    30.0
}
fn d_rot_acc() -> f64 {
    0.05
}
fn d_acc() -> f64 {
    6.0
}

/// One `[[waypoint]]`.
#[derive(Clone, Debug, Deserialize, Serialize)]
#[serde(deny_unknown_fields)]
pub struct Waypoint {
    /// Latitude, degrees north.
    pub lat_deg: f64,
    /// Longitude, degrees east.
    pub lon_deg: f64,
    /// Speed through the water on the leg towards this waypoint, knots; the previous
    /// leg's speed when absent.
    pub speed_kn: Option<f64>,
}

/// `[environment]`.
#[derive(Clone, Debug, Default, Deserialize, Serialize)]
#[serde(deny_unknown_fields)]
pub struct EnvCfg {
    /// Current speed, knots.
    #[serde(default)]
    pub current_speed_kn: f64,
    /// Direction the current flows towards, degrees true.
    #[serde(default)]
    pub current_set_deg: f64,
    /// Magnetic variation, degrees, east positive; magnetic fields stay empty when absent.
    pub magnetic_variation_deg: Option<f64>,
    /// Geoid separation reported in GGA and GNS, metres.
    #[serde(default)]
    pub geoid_separation_m: f64,
}

/// `[receiver]`.
#[derive(Clone, Debug, Deserialize, Serialize)]
#[serde(deny_unknown_fields)]
pub struct ReceiverCfg {
    /// Constellations tracked: `gps`, `glonass`, `galileo`, `beidou`.
    #[serde(default = "d_systems")]
    pub systems: Vec<String>,
    /// Elevation mask, degrees.
    #[serde(default = "d_mask")]
    pub elevation_mask_deg: f64,
    /// Clear-sky C/N0 of a satellite at zenith, dB-Hz.
    #[serde(default = "d_zenith")]
    pub nominal_cn0_zenith_dbhz: f64,
    /// Below this C/N0 a satellite is not tracked (its GSV SNR field is empty), dB-Hz.
    #[serde(default = "d_track")]
    pub track_threshold_dbhz: f64,
    /// Below this C/N0 a tracked satellite is not used in the fix, dB-Hz.
    #[serde(default = "d_use")]
    pub use_threshold_dbhz: f64,
    /// Most satellites used in the fix, across all constellations (NMEA GGA counts to 12).
    #[serde(default = "d_max_used")]
    pub max_used: usize,
    /// Seconds of usable signal needed before a lost fix is declared again.
    #[serde(default = "d_reacq")]
    pub reacquire_s: f64,
    /// One-sigma horizontal position noise at HDOP 1, metres.
    #[serde(default = "d_noise")]
    pub position_noise_m: f64,
    /// Correlation time of the position noise, seconds.
    #[serde(default = "d_corr")]
    pub noise_corr_s: f64,
    /// Antenna height above mean sea level, metres.
    #[serde(default = "d_ant")]
    pub antenna_height_m: f64,
}

impl Default for ReceiverCfg {
    fn default() -> Self {
        Self {
            systems: d_systems(),
            elevation_mask_deg: d_mask(),
            nominal_cn0_zenith_dbhz: d_zenith(),
            track_threshold_dbhz: d_track(),
            use_threshold_dbhz: d_use(),
            max_used: d_max_used(),
            reacquire_s: d_reacq(),
            position_noise_m: d_noise(),
            noise_corr_s: d_corr(),
            antenna_height_m: d_ant(),
        }
    }
}

fn d_systems() -> Vec<String> {
    ["gps", "glonass", "galileo", "beidou"]
        .iter()
        .map(|s| s.to_string())
        .collect()
}
fn d_mask() -> f64 {
    5.0
}
fn d_zenith() -> f64 {
    47.0
}
fn d_track() -> f64 {
    20.0
}
fn d_use() -> f64 {
    28.0
}
fn d_max_used() -> usize {
    12
}
fn d_reacq() -> f64 {
    8.0
}
fn d_noise() -> f64 {
    1.5
}
fn d_corr() -> f64 {
    30.0
}
fn d_ant() -> f64 {
    15.0
}

/// `[output]`.
#[derive(Clone, Debug, Deserialize, Serialize)]
#[serde(deny_unknown_fields)]
pub struct OutputCfg {
    /// Sentence types written each epoch; all nine by default.
    #[serde(default = "d_sentences")]
    pub sentences: Vec<String>,
    /// Write a proprietary marker sentence at the start and every ten seconds saying the
    /// stream is synthetic training data.
    #[serde(default = "yes")]
    pub marker: bool,
    /// Spacing of the true-versus-reported track rows in the instructor log, seconds.
    #[serde(default = "d_log")]
    pub log_interval_s: f64,
}

impl Default for OutputCfg {
    fn default() -> Self {
        Self {
            sentences: d_sentences(),
            marker: true,
            log_interval_s: d_log(),
        }
    }
}

fn yes() -> bool {
    true
}
fn d_log() -> f64 {
    10.0
}
/// All sentence types this generator writes.
pub const ALL_SENTENCES: [&str; 9] = [
    "GGA", "RMC", "VTG", "GSV", "GSA", "GNS", "ZDA", "HDT", "VBW",
];
fn d_sentences() -> Vec<String> {
    ALL_SENTENCES.iter().map(|s| s.to_string()).collect()
}

/// What an event does.
#[derive(Clone, Copy, Debug, PartialEq, Eq, Deserialize, Serialize)]
#[serde(rename_all = "kebab-case")]
pub enum EventKind {
    /// C/N0 falls, satellites are lost, the fix is lost when too few remain.
    Jamming,
    /// The receiver keeps a valid fix that walks away from the true position.
    DragOff,
    /// Time fields move away from true UTC; position stays true.
    TimeSpoof,
    /// Position and (optionally) time lag the truth by a delay, as in meaconing.
    ReplayDelay,
}

impl EventKind {
    /// Kebab-case name as written in the TOML.
    pub fn name(self) -> &'static str {
        match self {
            EventKind::Jamming => "jamming",
            EventKind::DragOff => "drag-off",
            EventKind::TimeSpoof => "time-spoof",
            EventKind::ReplayDelay => "replay-delay",
        }
    }
    /// True for the kinds in which the receiver follows counterfeit signals.
    pub fn counterfeit(self) -> bool {
        !matches!(self, EventKind::Jamming)
    }
}

/// One `[[event]]`. Which parameters apply depends on `kind`; one that does not apply is
/// an error.
#[derive(Clone, Debug, Deserialize, Serialize)]
#[serde(deny_unknown_fields)]
pub struct EventCfg {
    /// Event kind.
    pub kind: EventKind,
    /// Free-text label shown in the instructor log.
    #[serde(skip_serializing_if = "Option::is_none")]
    pub label: Option<String>,
    /// Onset, seconds from the start of the run.
    pub start_s: f64,
    /// Time from onset to the start of the release, seconds (includes the onset ramp).
    pub duration_s: f64,
    /// Onset ramp, seconds; 0 is a step.
    #[serde(default)]
    pub ramp_s: f64,
    /// Release ramp after `duration_s`, seconds; 0 is a step.
    #[serde(default)]
    pub recovery_s: f64,
    /// jamming: largest C/N0 reduction, dB.
    #[serde(skip_serializing_if = "Option::is_none")]
    pub cn0_drop_db: Option<f64>,
    /// jamming: per-satellite spread of the reduction, dB (default 6).
    #[serde(skip_serializing_if = "Option::is_none")]
    pub spread_db: Option<f64>,
    /// drag-off: final offset of the reported position, metres.
    #[serde(skip_serializing_if = "Option::is_none")]
    pub final_offset_m: Option<f64>,
    /// drag-off: largest acceleration of the false track allowed, m/s squared. The drag is
    /// smoothed (smoothstep) over `ramp_s` and `recovery_s`, whose peak acceleration is
    /// `6 * final_offset_m / ramp_s^2`; a scenario that would exceed this is refused.
    #[serde(skip_serializing_if = "Option::is_none")]
    pub max_accel_mps2: Option<f64>,
    /// drag-off: direction of the offset, degrees true.
    #[serde(skip_serializing_if = "Option::is_none")]
    pub bearing_deg: Option<f64>,
    /// drag-off: direction of the offset relative to the vessel's course, degrees
    /// clockwise (90 is to starboard).
    #[serde(skip_serializing_if = "Option::is_none")]
    pub relative_bearing_deg: Option<f64>,
    /// time-spoof: final time offset, seconds (positive is ahead of true UTC).
    #[serde(skip_serializing_if = "Option::is_none")]
    pub offset_s: Option<f64>,
    /// replay-delay: final delay, seconds.
    #[serde(skip_serializing_if = "Option::is_none")]
    pub delay_s: Option<f64>,
    /// replay-delay: time fields lag by the same delay (default true).
    #[serde(skip_serializing_if = "Option::is_none")]
    pub affect_time: Option<bool>,
    /// drag-off, time-spoof, replay-delay: while the event is active every tracked
    /// satellite shows this C/N0 (a uniform, raised level is a classic spoofing sign).
    /// Absent, the genuine C/N0 pattern is kept: a subtle event.
    #[serde(skip_serializing_if = "Option::is_none")]
    pub counterfeit_cn0_dbhz: Option<f64>,
}

/// The timing envelope shared by every event.
#[derive(Clone, Copy, Debug)]
pub struct Window {
    /// Onset, s.
    pub start_s: f64,
    /// Onset to release, s.
    pub duration_s: f64,
    /// Onset ramp, s.
    pub ramp_s: f64,
    /// Release ramp, s.
    pub recovery_s: f64,
}

/// Where an event is in its envelope.
#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub enum Phase {
    /// Before onset or after recovery.
    Idle,
    /// Strength rising.
    Ramping,
    /// Strength 1.
    Full,
    /// Strength falling.
    Recovering,
}

impl Window {
    /// Strength in `[0, 1]` at time `t`: 0 before onset, linear up over `ramp_s`, 1 until
    /// `start + duration`, linear down over `recovery_s`, 0 after.
    pub fn strength(&self, t: f64) -> f64 {
        let end = self.start_s + self.duration_s;
        if t < self.start_s {
            0.0
        } else if self.ramp_s > 0.0 && t < self.start_s + self.ramp_s {
            (t - self.start_s) / self.ramp_s
        } else if t < end {
            1.0
        } else if self.recovery_s > 0.0 && t < end + self.recovery_s {
            1.0 - (t - end) / self.recovery_s
        } else {
            0.0
        }
    }

    /// Rate of change of the strength, 1/s: zero on a step, which has no finite slope.
    pub fn strength_rate(&self, t: f64) -> f64 {
        let end = self.start_s + self.duration_s;
        if self.ramp_s > 0.0 && t >= self.start_s && t < self.start_s + self.ramp_s {
            1.0 / self.ramp_s
        } else if self.recovery_s > 0.0 && t >= end && t < end + self.recovery_s {
            -1.0 / self.recovery_s
        } else {
            0.0
        }
    }

    /// Phase at `t`: idle while the strength is zero, so the onset is the first epoch at
    /// which the event has an effect.
    pub fn phase(&self, t: f64) -> Phase {
        let end = self.start_s + self.duration_s;
        if self.strength(t) <= 0.0 {
            Phase::Idle
        } else if t < self.start_s + self.ramp_s {
            Phase::Ramping
        } else if t < end {
            Phase::Full
        } else {
            Phase::Recovering
        }
    }

    /// Strength shaped by smoothstep on the ramps (`3x^2 - 2x^3`), so a quantity that
    /// follows it starts and stops with zero velocity.
    pub fn strength_smooth(&self, t: f64) -> f64 {
        let x = self.strength(t);
        x * x * (3.0 - 2.0 * x)
    }

    /// Time derivative of [`Window::strength_smooth`], 1/s.
    pub fn strength_smooth_rate(&self, t: f64) -> f64 {
        let x = self.strength(t);
        6.0 * x * (1.0 - x) * self.strength_rate(t)
    }
}

impl EventCfg {
    /// The timing envelope.
    pub fn window(&self) -> Window {
        Window {
            start_s: self.start_s,
            duration_s: self.duration_s,
            ramp_s: self.ramp_s,
            recovery_s: self.recovery_s,
        }
    }
}

fn fin(name: &str, v: f64) -> Result<(), String> {
    if v.is_finite() {
        Ok(())
    } else {
        Err(format!("{name} must be a finite number"))
    }
}

impl TrainingScenario {
    /// Parse and validate a scenario from TOML text.
    pub fn parse(text: &str) -> Result<Self, String> {
        let s: TrainingScenario = toml::from_str(text).map_err(|e| format!("scenario: {e}"))?;
        s.validate()?;
        Ok(s)
    }

    /// Check every range and every event's parameter set.
    pub fn validate(&self) -> Result<(), String> {
        let m = &self.scenario;
        let name_ok = !m.name.is_empty()
            && m.name.len() <= 64
            && !m.name.starts_with('.')
            && m.name
                .bytes()
                .all(|b| b.is_ascii_alphanumeric() || b == b'.' || b == b'_' || b == b'-');
        if !name_ok {
            return Err(
                "scenario.name must be 1 to 64 characters from A-Z a-z 0-9 . _ - and must not \
                 start with a dot (it names the output files)"
                    .into(),
            );
        }
        super::clock::parse_utc(&m.start_utc)
            .map_err(|e| format!("scenario.start_utc {:?}: {e}", m.start_utc))?;
        fin("scenario.duration_s", m.duration_s)?;
        if !(1.0..=86_400.0).contains(&m.duration_s) {
            return Err("scenario.duration_s must lie in 1 to 86400 s".into());
        }
        if ![1.0, 2.0, 5.0, 10.0].contains(&m.rate_hz) {
            return Err("scenario.rate_hz must be 1, 2, 5 or 10".into());
        }
        let v = &self.vessel;
        for (n, x) in [
            ("vessel.lat_deg", v.lat_deg),
            ("vessel.lon_deg", v.lon_deg),
            ("vessel.speed_kn", v.speed_kn),
        ] {
            fin(n, x)?;
        }
        if !(-89.0..=89.0).contains(&v.lat_deg) || !(-180.0..=180.0).contains(&v.lon_deg) {
            return Err("vessel position must lie within 89 degrees of the equator".into());
        }
        if !(0.0..=60.0).contains(&v.speed_kn) {
            return Err("vessel.speed_kn must lie in 0 to 60".into());
        }
        let pos = |x: f64| x.is_finite() && x > 0.0;
        let limits_ok = pos(v.max_rot_deg_per_min)
            && v.max_rot_deg_per_min <= 600.0
            && pos(v.max_rot_accel_deg_per_s2)
            && pos(v.max_accel_kn_per_min);
        if !limits_ok {
            return Err("vessel rate-of-turn and acceleration limits must be positive".into());
        }
        if self.waypoints.is_empty() && v.heading_deg.is_none() {
            return Err("give at least one [[waypoint]] or vessel.heading_deg".into());
        }
        for (i, w) in self.waypoints.iter().enumerate() {
            fin("waypoint latitude", w.lat_deg)?;
            fin("waypoint longitude", w.lon_deg)?;
            if !(-89.0..=89.0).contains(&w.lat_deg) || !(-180.0..=180.0).contains(&w.lon_deg) {
                return Err(format!("waypoint {} is out of range", i + 1));
            }
            if let Some(s) = w.speed_kn {
                if !(0.0..=60.0).contains(&s) {
                    return Err(format!("waypoint {} speed_kn must lie in 0 to 60", i + 1));
                }
            }
        }
        let r = &self.receiver;
        if r.systems.is_empty() {
            return Err("receiver.systems must name at least one constellation".into());
        }
        for s in &r.systems {
            super::sky::System::parse(s)?;
        }
        let nonneg = |x: f64| x.is_finite() && x >= 0.0;
        let receiver_ok = (0.0..=45.0).contains(&r.elevation_mask_deg)
            && r.track_threshold_dbhz <= r.use_threshold_dbhz
            && (4..=12).contains(&r.max_used)
            && nonneg(r.position_noise_m)
            && pos(r.noise_corr_s)
            && nonneg(r.reacquire_s);
        if !receiver_ok {
            return Err(
                "receiver parameters out of range (mask 0-45 deg, track <= use \
                        threshold, 4-12 used satellites, noise >= 0, corr > 0, reacquire >= 0)"
                    .into(),
            );
        }
        for s in &self.output.sentences {
            if !super::config::ALL_SENTENCES.contains(&s.as_str()) {
                return Err(format!(
                    "output.sentences: {s:?} is not one of {}",
                    ALL_SENTENCES.join(", ")
                ));
            }
        }
        if !(self.output.log_interval_s.is_finite() && self.output.log_interval_s >= 1.0) {
            return Err("output.log_interval_s must be at least 1".into());
        }
        for (i, e) in self.events.iter().enumerate() {
            e.validate(m.duration_s)
                .map_err(|why| format!("event {} ({}): {why}", i + 1, e.kind.name()))?;
        }
        Ok(())
    }
}

impl EventCfg {
    fn validate(&self, run_s: f64) -> Result<(), String> {
        for (n, x) in [
            ("start_s", self.start_s),
            ("duration_s", self.duration_s),
            ("ramp_s", self.ramp_s),
            ("recovery_s", self.recovery_s),
        ] {
            fin(n, x)?;
        }
        if self.start_s < 0.0 || self.start_s >= run_s {
            return Err("start_s must lie inside the run".into());
        }
        if self.duration_s <= 0.0 || self.ramp_s < 0.0 || self.recovery_s < 0.0 {
            return Err("duration_s must be positive; ramp_s and recovery_s not negative".into());
        }
        if self.ramp_s > self.duration_s {
            return Err("ramp_s must not exceed duration_s".into());
        }
        // Parameters that belong to other kinds.
        let used: &[(&str, bool)] = &[
            (
                "cn0_drop_db",
                self.cn0_drop_db.is_some() && self.kind != EventKind::Jamming,
            ),
            (
                "spread_db",
                self.spread_db.is_some() && self.kind != EventKind::Jamming,
            ),
            (
                "final_offset_m",
                self.final_offset_m.is_some() && self.kind != EventKind::DragOff,
            ),
            (
                "max_accel_mps2",
                self.max_accel_mps2.is_some() && self.kind != EventKind::DragOff,
            ),
            (
                "bearing_deg",
                self.bearing_deg.is_some() && self.kind != EventKind::DragOff,
            ),
            (
                "relative_bearing_deg",
                self.relative_bearing_deg.is_some() && self.kind != EventKind::DragOff,
            ),
            (
                "offset_s",
                self.offset_s.is_some() && self.kind != EventKind::TimeSpoof,
            ),
            (
                "delay_s",
                self.delay_s.is_some() && self.kind != EventKind::ReplayDelay,
            ),
            (
                "affect_time",
                self.affect_time.is_some() && self.kind != EventKind::ReplayDelay,
            ),
            (
                "counterfeit_cn0_dbhz",
                self.counterfeit_cn0_dbhz.is_some() && !self.kind.counterfeit(),
            ),
        ];
        if let Some((n, _)) = used.iter().find(|(_, bad)| *bad) {
            return Err(format!("{n} does not apply to this kind"));
        }
        if let Some(c) = self.counterfeit_cn0_dbhz {
            if !(20.0..=60.0).contains(&c) {
                return Err("counterfeit_cn0_dbhz must lie in 20 to 60".into());
            }
        }
        // A time ramp must not make reported time stand still or run backwards.
        let monotone = |total: f64, shape: f64| -> Result<(), String> {
            for r in [self.ramp_s, self.recovery_s] {
                if r > 0.0 && shape * total.abs() / r >= 1.0 {
                    return Err(
                        "the time change per second reaches 1, so reported time would \
                                stop or run backwards; lengthen ramp_s/recovery_s or use a \
                                step (0)"
                            .into(),
                    );
                }
            }
            Ok(())
        };
        match self.kind {
            EventKind::Jamming => {
                let d = self.cn0_drop_db.ok_or("cn0_drop_db is required")?;
                fin("cn0_drop_db", d)?;
                if !(0.0..=80.0).contains(&d) {
                    return Err("cn0_drop_db must lie in 0 to 80".into());
                }
                if let Some(s) = self.spread_db {
                    if !(0.0..=30.0).contains(&s) {
                        return Err("spread_db must lie in 0 to 30".into());
                    }
                }
            }
            EventKind::DragOff => {
                let d = self.final_offset_m.ok_or("final_offset_m is required")?;
                fin("final_offset_m", d)?;
                if !(0.0..=500_000.0).contains(&d) {
                    return Err("final_offset_m must lie in 0 to 500000".into());
                }
                let peak = |ramp: f64| {
                    if ramp > 0.0 {
                        6.0 * d / (ramp * ramp)
                    } else {
                        0.0
                    }
                };
                if let Some(a) = self.max_accel_mps2 {
                    fin("max_accel_mps2", a)?;
                    let need = peak(self.ramp_s).max(peak(self.recovery_s));
                    if a <= 0.0 || need > a {
                        return Err(format!(
                            "the drag would accelerate the false track at up to {need:.3} m/s^2, \
                             above max_accel_mps2 = {a}; lengthen ramp_s/recovery_s"
                        ));
                    }
                }
                match (self.bearing_deg, self.relative_bearing_deg) {
                    (Some(b), None) | (None, Some(b)) => fin("bearing", b)?,
                    _ => return Err("give exactly one of bearing_deg, relative_bearing_deg".into()),
                }
            }
            EventKind::TimeSpoof => {
                let o = self.offset_s.ok_or("offset_s is required")?;
                fin("offset_s", o)?;
                if o == 0.0 || o.abs() > 86_400.0 {
                    return Err("offset_s must be non-zero and within a day".into());
                }
                monotone(o, 1.0)?;
            }
            EventKind::ReplayDelay => {
                let d = self.delay_s.ok_or("delay_s is required")?;
                fin("delay_s", d)?;
                if !(d > 0.0 && d <= 3600.0) {
                    return Err("delay_s must lie in 0 to 3600".into());
                }
                if self.affect_time.unwrap_or(true) {
                    // The delay ramps follow smoothstep, whose steepest slope is 1.5 times
                    // the straight-line one.
                    monotone(d, 1.5)?;
                }
            }
        }
        Ok(())
    }
}
