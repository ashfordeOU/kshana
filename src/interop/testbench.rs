// SPDX-License-Identifier: AGPL-3.0-only
//! **Test-bench export: a scenario's vehicle motion and events, for a laboratory GNSS
//! simulator.**
//!
//! A receiver maker who owns a laboratory simulator can replay a Kshana scenario's
//! trajectory through it and then score the receiver's own log with `kshana
//! receiver-trust` (see `docs/TEST-BENCH.md`). This module writes the *motion* and the
//! *events*; it never writes a signal. Nothing here synthesises, models or transmits a
//! radio-frequency, baseband or waveform quantity: an event is a labelled time interval
//! (what the scenario says happens, and when), not a recipe for producing it. The
//! simulator, and the operator's authorisation to use it, supply everything else.
//!
//! ## What is written
//!
//! | File suffix | Content | Reader |
//! |---|---|---|
//! | `.motion.csv` | time, Earth-fixed position, velocity, geodetic position and attitude per sample | [`read_motion_csv`] |
//! | `.motion.json` | the epoch, frames, units, columns and tolerances of that CSV | |
//! | `.waypoints.txt` | `RESOLUTION: <ms>` then `longitude,latitude,altitude` rows (no attitude) | [`read_waypoints`] |
//! | `.nmea` | `GGA` and `RMC` sentences per sample (position, speed, course; no attitude) | [`read_nmea`] |
//! | `.events.csv` | the scenario's events: label, kind, onset, end | [`read_events_csv`] |
//! | `.events.toml` | the same events as `[[events]]` blocks for a `receiver-trust` scenario | |
//!
//! ## Frames and conventions (the stated contract, repeated in the `.motion.json`)
//!
//! * Position: WGS 84, Earth-fixed (`x_m`, `y_m`, `z_m`, the ECEF axes: `x` through the
//!   equator at the prime meridian, `z` through the pole) and, equivalently, geodetic
//!   `lat_deg`, `lon_deg`, `h_m` (height above the WGS 84 ellipsoid).
//! * Velocity: the same Earth-fixed axes, m/s, relative to the Earth (not inertial).
//! * Attitude: `heading_deg` (clockwise from true north, 0 to 360), `pitch_deg` (nose up
//!   positive) and `roll_deg` (right wing down positive), the aerospace yaw-pitch-roll
//!   (3-2-1) sequence from the local north-east-down frame to the body frame, body axes
//!   x forward, y right, z down. A stationary source writes heading, pitch and roll zero, and
//!   the metadata says so.
//! * Heading is the body's yaw, **not** the direction of travel. For `gnss-ins` the driving
//!   profile yaws the body in square waves while the velocity state follows, so heading and
//!   the course over ground (the direction of the velocity vector, which is what the NMEA
//!   `RMC` course carries) can differ by tens of degrees (up to about 77 degrees in the
//!   bundled `automotive-urban-canyon` scenario). A simulator that takes a heading from the
//!   motion file and one that takes the course from the NMEA file therefore see different
//!   angles. The CSV carries the velocity, so the course is `atan2(v_east, v_north)` of its
//!   Earth-fixed velocity rotated to north-east-down.
//! * Height: for `gnss-ins`, `h_m` follows the kind's own tangent-plane stepping of its
//!   truth, which does not hold the ellipsoidal height constant (about 7 m over the 180 s of
//!   the bundled `automotive-urban-canyon` scenario). It is the scenario's motion, written as
//!   it is, not a flat-road assumption.
//! * Time: `time_s` after the epoch, where the epoch is a UTC instant the caller states
//!   (default [`DEFAULT_EPOCH`]); the scenario itself carries no calendar date for its
//!   vehicle motion. Leap seconds are not modelled, as everywhere in [`super`].
//! * NMEA: the `GGA` fix-quality (1), satellites-used (12) and HDOP (1.0) fields are
//!   **placeholders** that make the sentence well formed; they carry no information about the
//!   scenario and are not a geometry or a receiver state. Heights are ellipsoidal. The `GGA` altitude field carries the ellipsoidal
//!   height and the geoid-separation field is written as 0.0, so a reader that adds the
//!   two recovers the ellipsoidal height; a simulator that treats the altitude as height
//!   above mean sea level is offset from the true value by the local geoid undulation,
//!   which the file does not know.
//!
//! ## Round-trip tolerances (tested in `tests/interop_testbench.rs`)
//!
//! Writing rounds each number to a fixed number of decimals, so a file read back differs
//! from the trajectory that was written by no more than: CSV position 0.1 mm (Earth-fixed
//! and height) and 1e-9 degree (latitude, longitude); velocity 0.1 mm/s; angles 1e-6
//! degree. NMEA position 5 mm horizontally and 1 mm in height, speed 0.001 knot, course
//! 0.001 degree. Those are [`CSV_POSITION_TOL_M`] and the neighbouring constants.
//!
//! ## Determinism
//!
//! No clock, file or network is read, and no output carries a generation time: the same
//! scenario and epoch give the same bytes on every platform.

use super::{round_dp, ExportError, ExportFile, UtcEpoch};
use crate::frames::{ecef_to_geodetic, geodetic_to_ecef, Geodetic, Vec3};
use crate::scenario::GnssState;

/// The UTC instant of `t = 0` when the caller names none: a fixed, documented date, so
/// the output does not depend on when it was written.
pub const DEFAULT_EPOCH: (i32, u32, u32, u32, u32, f64) = (2024, 1, 1, 0, 0, 0.0);

/// Round-trip tolerance of the CSV Earth-fixed position and height, metres.
pub const CSV_POSITION_TOL_M: f64 = 1.0e-4;
/// Round-trip tolerance of the CSV latitude and longitude, degrees.
pub const CSV_ANGLE_DEG_TOL: f64 = 1.0e-9;
/// Round-trip tolerance of the CSV velocity, m/s.
pub const CSV_VELOCITY_TOL_M_S: f64 = 1.0e-4;
/// Round-trip tolerance of the CSV attitude angles, degrees.
pub const CSV_ATTITUDE_DEG_TOL: f64 = 1.0e-6;
/// Round-trip tolerance of the NMEA horizontal position, metres.
pub const NMEA_HORIZONTAL_TOL_M: f64 = 5.0e-3;
/// Round-trip tolerance of the NMEA height, metres.
pub const NMEA_HEIGHT_TOL_M: f64 = 1.0e-3;
/// Round-trip tolerance of the NMEA speed, knots.
pub const NMEA_SPEED_TOL_KN: f64 = 1.0e-3;
/// Round-trip tolerance of the NMEA course, degrees.
pub const NMEA_COURSE_TOL_DEG: f64 = 1.0e-3;

/// One metre per second in knots (1 international knot is exactly 1852 m per hour).
const KNOTS_PER_M_S: f64 = 3600.0 / 1852.0;
/// Below this speed (m/s) the course over ground is undefined and is not written.
const COURSE_MIN_SPEED_M_S: f64 = 0.05;

/// One sampled instant of the vehicle's motion.
#[derive(Clone, Copy, Debug, PartialEq)]
pub struct MotionSample {
    /// Seconds after the trajectory's epoch.
    pub t_s: f64,
    /// WGS 84 geodetic latitude, degrees.
    pub lat_deg: f64,
    /// WGS 84 longitude, degrees.
    pub lon_deg: f64,
    /// Height above the WGS 84 ellipsoid, metres.
    pub h_m: f64,
    /// Earth-fixed position, metres.
    pub ecef_m: Vec3,
    /// Earth-fixed velocity relative to the Earth, m/s.
    pub v_ecef_m_s: Vec3,
    /// Heading, degrees clockwise from true north, in [0, 360).
    pub heading_deg: f64,
    /// Pitch, degrees, nose up positive.
    pub pitch_deg: f64,
    /// Roll, degrees, right wing down positive.
    pub roll_deg: f64,
}

/// What an event is. The values match the kinds `receiver-trust` scores.
#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub enum EventKind {
    /// A jammer is present (power denial of the band).
    Jamming,
    /// A spoofer is present.
    Spoofing,
    /// Any other stated interval, such as a navigation-state outage.
    Other,
}

impl EventKind {
    /// The kebab-case name the files and `receiver-trust` use.
    pub fn as_str(self) -> &'static str {
        match self {
            EventKind::Jamming => "jamming",
            EventKind::Spoofing => "spoofing",
            EventKind::Other => "other",
        }
    }

    fn parse(s: &str) -> Option<EventKind> {
        match s {
            "jamming" => Some(EventKind::Jamming),
            "spoofing" => Some(EventKind::Spoofing),
            "other" => Some(EventKind::Other),
            _ => None,
        }
    }
}

/// A labelled interval of the scenario: what it says happens, and when. Not a signal.
#[derive(Clone, Debug, PartialEq)]
pub struct MotionEvent {
    /// Short label, unique within the trajectory.
    pub label: String,
    /// Kind.
    pub kind: EventKind,
    /// Onset, seconds after the epoch.
    pub onset_s: f64,
    /// End, seconds after the epoch.
    pub end_s: f64,
    /// One line on where the event comes from in the scenario.
    pub description: String,
}

/// A vehicle's motion and the scenario's events on one time grid.
#[derive(Clone, Debug, PartialEq)]
pub struct Trajectory {
    /// The scenario's `kind`.
    pub kind: String,
    /// First 12 hex characters of the SHA-256 of the scenario source.
    pub scenario_hash: String,
    /// The UTC instant of `t = 0`.
    pub epoch: UtcEpoch,
    /// Where the motion comes from and what it does not carry, in words.
    pub note: String,
    /// Samples in increasing time.
    pub samples: Vec<MotionSample>,
    /// Events, in onset order.
    pub events: Vec<MotionEvent>,
}

/// An epoch from the default.
pub fn default_epoch() -> UtcEpoch {
    let (y, mo, d, h, mi, s) = DEFAULT_EPOCH;
    UtcEpoch::from_calendar(y, mo, d, h, mi, s)
}

/// Rotate a north-east-down vector into the Earth-fixed axes at a geodetic position.
fn ned_to_ecef(lat_rad: f64, lon_rad: f64, v: Vec3) -> Vec3 {
    let (sl, cl) = lat_rad.sin_cos();
    let (so, co) = lon_rad.sin_cos();
    let n = [-sl * co, -sl * so, cl];
    let e = [-so, co, 0.0];
    let d = [-cl * co, -cl * so, -sl];
    [
        n[0] * v[0] + e[0] * v[1] + d[0] * v[2],
        n[1] * v[0] + e[1] * v[1] + d[1] * v[2],
        n[2] * v[0] + e[2] * v[1] + d[2] * v[2],
    ]
}

/// Heading, pitch and roll (degrees) from a body-to-NED rotation matrix, yaw-pitch-roll
/// (3-2-1). Heading is in [0, 360).
fn euler_deg(c: &[[f64; 3]; 3]) -> (f64, f64, f64) {
    let yaw = c[1][0].atan2(c[0][0]).to_degrees();
    let pitch = (-c[2][0]).clamp(-1.0, 1.0).asin().to_degrees();
    let roll = c[2][1].atan2(c[2][2]).to_degrees();
    (yaw.rem_euclid(360.0), pitch, roll)
}

/// Build a sample from a geodetic position, an NED velocity and an attitude.
fn sample_of(
    t_s: f64,
    g: Geodetic,
    v_ned: Vec3,
    heading_deg: f64,
    pitch_deg: f64,
    roll_deg: f64,
) -> MotionSample {
    MotionSample {
        t_s,
        lat_deg: g.lat_rad.to_degrees(),
        lon_deg: g.lon_rad.to_degrees(),
        h_m: g.alt_m,
        ecef_m: geodetic_to_ecef(g),
        v_ecef_m_s: ned_to_ecef(g.lat_rad, g.lon_rad, v_ned),
        heading_deg,
        pitch_deg,
        roll_deg,
    }
}

/// Maximal runs of `Denied` or `Degraded` navigation state on a sampled timeline, as
/// events. A run ends at the first sample that is `Nominal` again (or at the last sample).
fn outage_events(states: &[(f64, GnssState)]) -> Vec<MotionEvent> {
    let mut out: Vec<MotionEvent> = Vec::new();
    let mut open: Option<(f64, GnssState)> = None;
    for (i, &(t, s)) in states.iter().enumerate() {
        match (open, s) {
            (None, GnssState::Nominal) => {}
            (None, s) => open = Some((t, s)),
            (Some((t0, s0)), s1) if s1 != s0 => {
                push_outage(&mut out, t0, t, s0);
                open = if s1 == GnssState::Nominal {
                    None
                } else {
                    Some((t, s1))
                };
            }
            (Some(_), _) => {}
        }
        if i + 1 == states.len() {
            if let Some((t0, s0)) = open.take() {
                push_outage(&mut out, t0, t, s0);
            }
        }
    }
    out
}

fn push_outage(out: &mut Vec<MotionEvent>, t0: f64, t1: f64, s: GnssState) {
    let (word, what) = match s {
        GnssState::Denied => (
            "gnss-denied",
            "the scenario's navigation-state timeline gives no GNSS here (an explicit denied \
             window, or no window covering the time)",
        ),
        _ => (
            "gnss-degraded",
            "the scenario's navigation-state timeline marks GNSS degraded here",
        ),
    };
    let n = out.iter().filter(|e| e.label.starts_with(word)).count() + 1;
    out.push(MotionEvent {
        label: format!("{word}-{n}"),
        kind: EventKind::Other,
        onset_s: t0,
        end_s: t1,
        description: what.into(),
    });
}

/// Build the trajectory of a scenario (TOML source) from the epoch given (or
/// [`default_epoch`]).
///
/// Applies to `gnss-ins` (the driving profile's true motion, with attitude, and the
/// navigation-state outages as events), and to `jamming` and `gnss-sim` (a stationary
/// receiver for the scenario's duration; a `jamming` scenario's jammer is one event over
/// the whole run). Any other kind is [`ExportError::NotApplicable`], with the reason.
pub fn trajectory_of(src: &str, epoch: Option<UtcEpoch>) -> Result<Trajectory, ExportError> {
    use crate::api::ScenarioKind;
    let kind = ScenarioKind::classify(src).map_err(|e| ExportError::Failed(e.to_string()))?;
    let epoch = epoch.unwrap_or_else(default_epoch);
    let bad = |e: toml::de::Error| {
        ExportError::Failed(format!("invalid {} scenario: {e}", kind.as_str()))
    };
    let hash = super::scene::short_hash(src);
    match kind {
        ScenarioKind::GnssIns => {
            let scn: crate::fusion::pack::GnssInsScenario = toml::from_str(src).map_err(bad)?;
            scn.time.validate().map_err(ExportError::Failed)?;
            let truth = crate::fusion::pack::truth_trajectory(&scn);
            let samples: Vec<MotionSample> = truth
                .iter()
                .map(|(t, s)| {
                    let (h, p, r) = euler_deg(&s.q.to_dcm());
                    sample_of(*t, s.p_llh, s.v_ned, h, p, r)
                })
                .collect();
            let states: Vec<(f64, GnssState)> = truth
                .iter()
                .map(|(t, _)| (*t, scn.gnss.state_at(*t)))
                .collect();
            Ok(Trajectory {
                kind: kind.as_str().into(),
                scenario_hash: hash,
                epoch,
                note: "the gnss-ins kind's true driving profile (forward acceleration and yaw \
                       square waves) flown from the scenario's tangent-plane origin, stepped as \
                       the kind steps its truth; attitude is the profile's, events are the \
                       navigation-state outages"
                    .into(),
                samples,
                events: outage_events(&states),
            })
        }
        ScenarioKind::Jamming | ScenarioKind::GnssSim => {
            let (time, lat, lon, alt, jammer) = if kind == ScenarioKind::Jamming {
                let s: crate::jamming::JammingScenario = toml::from_str(src).map_err(bad)?;
                let j = s.jammer.as_ref().map(|j| {
                    format!(
                        "{} jammer, {} dBW transmit power, {} dBi antenna gain (a parameter of \
                         the scenario's link budget, not a signal)",
                        j.jammer_type, j.power_dbw, j.gain_dbi
                    )
                });
                (
                    s.time,
                    s.receiver.lat_deg,
                    s.receiver.lon_deg,
                    s.receiver.alt_m,
                    j,
                )
            } else {
                let s: crate::gnss_sim::GnssSimScenario = toml::from_str(src).map_err(bad)?;
                (
                    s.time,
                    s.receiver.lat_deg,
                    s.receiver.lon_deg,
                    s.receiver.alt_m,
                    None,
                )
            };
            time.validate().map_err(ExportError::Failed)?;
            let n = (time.duration_s / time.step_s).round() as usize;
            let g = Geodetic {
                lat_rad: lat.to_radians(),
                lon_rad: lon.to_radians(),
                alt_m: alt,
            };
            let samples: Vec<MotionSample> = (0..=n)
                .map(|i| sample_of(i as f64 * time.step_s, g, [0.0; 3], 0.0, 0.0, 0.0))
                .collect();
            let events = jammer
                .map(|d| {
                    vec![MotionEvent {
                        label: "jammer".into(),
                        kind: EventKind::Jamming,
                        onset_s: 0.0,
                        end_s: n as f64 * time.step_s,
                        description: d,
                    }]
                })
                .unwrap_or_default();
            Ok(Trajectory {
                kind: kind.as_str().into(),
                scenario_hash: hash,
                epoch,
                note: "a stationary receiver at the scenario's receiver position for its whole \
                       duration, heading, pitch and roll zero"
                    .into(),
                samples,
                events,
            })
        }
        other => Err(ExportError::NotApplicable(format!(
            "`{}` has no vehicle trajectory to export; the test-bench export covers the \
             gnss-ins, jamming and gnss-sim kinds",
            other.as_str()
        ))),
    }
}

// ---------------------------------------------------------------------------------------
// User-motion CSV
// ---------------------------------------------------------------------------------------

/// The column names of the motion CSV, in order.
pub const MOTION_COLUMNS: [&str; 15] = [
    "time_s",
    "x_m",
    "y_m",
    "z_m",
    "vx_m_s",
    "vy_m_s",
    "vz_m_s",
    "lat_deg",
    "lon_deg",
    "h_m",
    "heading_deg",
    "pitch_deg",
    "roll_deg",
    "utc",
    "kshana_row",
];

/// Write the motion CSV: one header row, then one row per sample, comma separated, `\n`
/// line ends, no comments, numbers in fixed decimals (see the module notes for the rounding).
pub fn write_motion_csv(t: &Trajectory) -> String {
    let mut s = MOTION_COLUMNS.join(",");
    s.push('\n');
    for (i, m) in t.samples.iter().enumerate() {
        let f = |v: f64, dp: usize| format!("{:.dp$}", round_dp(v, dp as i32));
        s.push_str(&format!(
            "{},{},{},{},{},{},{},{},{},{},{},{},{},{},{}\n",
            f(m.t_s, 6),
            f(m.ecef_m[0], 4),
            f(m.ecef_m[1], 4),
            f(m.ecef_m[2], 4),
            f(m.v_ecef_m_s[0], 4),
            f(m.v_ecef_m_s[1], 4),
            f(m.v_ecef_m_s[2], 4),
            f(m.lat_deg, 9),
            f(m.lon_deg, 9),
            f(m.h_m, 4),
            f(m.heading_deg, 6),
            f(m.pitch_deg, 6),
            f(m.roll_deg, 6),
            t.epoch.iso(m.t_s),
            i
        ));
    }
    s
}

/// Read a motion CSV written by [`write_motion_csv`]. The header must match
/// [`MOTION_COLUMNS`]; the `utc` and `kshana_row` columns are checked for shape only.
pub fn read_motion_csv(text: &str) -> Result<Vec<MotionSample>, String> {
    let mut lines = text.lines();
    let head = lines.next().ok_or("empty motion CSV")?;
    if head.trim() != MOTION_COLUMNS.join(",") {
        return Err(format!(
            "motion CSV header is not the expected columns: {head:?}"
        ));
    }
    let mut out = Vec::new();
    for (n, line) in lines.enumerate() {
        if line.trim().is_empty() {
            continue;
        }
        let f: Vec<&str> = line.split(',').collect();
        if f.len() != MOTION_COLUMNS.len() {
            return Err(format!(
                "row {}: {} fields, expected {}",
                n + 1,
                f.len(),
                MOTION_COLUMNS.len()
            ));
        }
        let num = |i: usize| -> Result<f64, String> {
            f[i].trim()
                .parse::<f64>()
                .ok()
                .filter(|v| v.is_finite())
                .ok_or_else(|| {
                    format!(
                        "row {}: column {} is not a number",
                        n + 1,
                        MOTION_COLUMNS[i]
                    )
                })
        };
        out.push(MotionSample {
            t_s: num(0)?,
            ecef_m: [num(1)?, num(2)?, num(3)?],
            v_ecef_m_s: [num(4)?, num(5)?, num(6)?],
            lat_deg: num(7)?,
            lon_deg: num(8)?,
            h_m: num(9)?,
            heading_deg: num(10)?,
            pitch_deg: num(11)?,
            roll_deg: num(12)?,
        });
    }
    Ok(out)
}

/// Write the JSON sidecar that states the CSV's frames, units and tolerances.
pub fn write_motion_meta(t: &Trajectory) -> String {
    let doc = serde_json::json!({
        "format": "kshana-motion-csv",
        "format_version": 1,
        "scenario_kind": t.kind,
        "scenario_hash": t.scenario_hash,
        "epoch_utc": t.epoch.iso(0.0),
        "epoch_note": "time_s is seconds after epoch_utc; leap seconds are not modelled",
        "samples": t.samples.len(),
        "source": t.note,
        "columns": MOTION_COLUMNS,
        "units": {
            "time_s": "s", "x_m": "m", "y_m": "m", "z_m": "m",
            "vx_m_s": "m/s", "vy_m_s": "m/s", "vz_m_s": "m/s",
            "lat_deg": "deg", "lon_deg": "deg", "h_m": "m",
            "heading_deg": "deg", "pitch_deg": "deg", "roll_deg": "deg",
            "utc": "ISO 8601 UTC", "kshana_row": "row index from 0"
        },
        "frames": {
            "position": "WGS 84 Earth-fixed (ECEF); lat/lon/h are the same position geodetically, h above the ellipsoid",
            "velocity": "Earth-fixed axes, relative to the Earth, not inertial",
            "attitude": "heading clockwise from true north in [0,360), pitch nose up positive, roll right wing down positive; yaw-pitch-roll (3-2-1) from local north-east-down to body axes x forward, y right, z down"
        },
        "heading_note": "heading_deg is the body yaw, not the direction of travel; for gnss-ins the two can differ by tens of degrees. The course over ground (what the NMEA RMC course carries) is the direction of the velocity vector: atan2(v_east, v_north) of the Earth-fixed velocity rotated to north-east-down",
        "height_note": "h_m is the scenario's own motion; for gnss-ins it follows the kind's tangent-plane stepping and is not held constant",
        "round_trip_tolerance": {
            "position_m": CSV_POSITION_TOL_M,
            "lat_lon_deg": CSV_ANGLE_DEG_TOL,
            "velocity_m_s": CSV_VELOCITY_TOL_M_S,
            "attitude_deg": CSV_ATTITUDE_DEG_TOL
        },
        "carries_signals": false,
    });
    let mut s = serde_json::to_string_pretty(&doc).unwrap_or_default();
    s.push('\n');
    s
}

// ---------------------------------------------------------------------------------------
// NMEA 0183 motion
// ---------------------------------------------------------------------------------------

/// The NMEA 0183 checksum of a sentence body (the text between `$` and `*`).
pub fn nmea_checksum(body: &str) -> u8 {
    body.bytes().fold(0u8, |a, b| a ^ b)
}

fn nmea_sentence(body: &str) -> String {
    format!("${body}*{:02X}\r\n", nmea_checksum(body))
}

/// `ddmm.mmmmmm` or `dddmm.mmmmmm` and the hemisphere letter.
fn nmea_angle(deg: f64, width: usize, pos: char, neg: char) -> (String, char) {
    let hemi = if deg < 0.0 { neg } else { pos };
    let a = deg.abs();
    let mut d = a.floor();
    let mut m = round_dp((a - d) * 60.0, 6);
    if m >= 60.0 {
        m = 0.0;
        d += 1.0;
    }
    (format!("{:0w$}{:09.6}", d as u32, m, w = width), hemi)
}

/// Write the NMEA motion: a `GPGGA` and a `GPRMC` sentence per sample, CRLF line ends,
/// checksummed. Position, speed over ground and course over ground only; NMEA has no
/// attitude. The course is omitted below 0.05 m/s.
pub fn write_nmea(t: &Trajectory) -> String {
    let mut s = String::new();
    for m in &t.samples {
        let (tm, date) = t.epoch.nmea(m.t_s);
        let (lat, ns) = nmea_angle(m.lat_deg, 2, 'N', 'S');
        let (lon, ew) = nmea_angle(m.lon_deg, 3, 'E', 'W');
        s.push_str(&nmea_sentence(&format!(
            "GPGGA,{tm},{lat},{ns},{lon},{ew},1,12,1.0,{:.3},M,0.000,M,,",
            round_dp(m.h_m, 3)
        )));
        // Ground velocity from the NED components: re-derive from the Earth-fixed vector.
        let (sl, cl) = m.lat_deg.to_radians().sin_cos();
        let (so, co) = m.lon_deg.to_radians().sin_cos();
        let v = m.v_ecef_m_s;
        let vn = -sl * co * v[0] - sl * so * v[1] + cl * v[2];
        let ve = -so * v[0] + co * v[1];
        let speed = vn.hypot(ve);
        let course = if speed >= COURSE_MIN_SPEED_M_S {
            format!(
                "{:.3}",
                round_dp(ve.atan2(vn).to_degrees().rem_euclid(360.0), 3)
            )
        } else {
            String::new()
        };
        s.push_str(&nmea_sentence(&format!(
            "GPRMC,{tm},A,{lat},{ns},{lon},{ew},{:.3},{course},{date},,,A",
            round_dp(speed * KNOTS_PER_M_S, 3)
        )));
    }
    s
}

/// One position read back from an NMEA motion file.
#[derive(Clone, Copy, Debug, PartialEq)]
pub struct NmeaFix {
    /// Seconds after the epoch the reader was given.
    pub t_s: f64,
    /// Latitude, degrees.
    pub lat_deg: f64,
    /// Longitude, degrees.
    pub lon_deg: f64,
    /// Altitude plus geoid separation, metres (the ellipsoidal height the writer put there).
    pub h_m: f64,
    /// Speed over ground, knots (from the `RMC` sentence at the same time).
    pub speed_kn: f64,
    /// Course over ground, degrees, when the `RMC` sentence gave one.
    pub course_deg: Option<f64>,
}

fn parse_angle(field: &str, hemi: &str, deg_digits: usize) -> Option<f64> {
    if field.len() < deg_digits + 2 {
        return None;
    }
    let d: f64 = field.get(..deg_digits)?.parse().ok()?;
    let m: f64 = field.get(deg_digits..)?.parse().ok()?;
    let v = d + m / 60.0;
    match hemi {
        "N" | "E" => Some(v),
        "S" | "W" => Some(-v),
        _ => None,
    }
}

/// Read an NMEA motion file written by [`write_nmea`], relative to `epoch`. Every sentence
/// must carry a correct checksum; a `GGA` is paired with the `RMC` of the same time.
pub fn read_nmea(text: &str, epoch: &UtcEpoch) -> Result<Vec<NmeaFix>, String> {
    let mut out: Vec<NmeaFix> = Vec::new();
    let mut pending: Option<(String, f64, f64, f64)> = None; // time field, lat, lon, h
    for (n, line) in text.lines().enumerate() {
        let line = line.trim();
        if line.is_empty() {
            continue;
        }
        let body = line
            .strip_prefix('$')
            .ok_or_else(|| format!("line {}: no `$`", n + 1))?;
        let (body, sum) = body
            .split_once('*')
            .ok_or_else(|| format!("line {}: no checksum", n + 1))?;
        let want = u8::from_str_radix(sum.trim(), 16)
            .map_err(|_| format!("line {}: bad checksum field", n + 1))?;
        if nmea_checksum(body) != want {
            return Err(format!("line {}: checksum mismatch", n + 1));
        }
        let f: Vec<&str> = body.split(',').collect();
        match f[0] {
            "GPGGA" => {
                if f.len() < 12 {
                    return Err(format!("line {}: short GGA", n + 1));
                }
                let lat =
                    parse_angle(f[2], f[3], 2).ok_or(format!("line {}: bad latitude", n + 1))?;
                let lon =
                    parse_angle(f[4], f[5], 3).ok_or(format!("line {}: bad longitude", n + 1))?;
                let alt: f64 = f[9]
                    .parse()
                    .map_err(|_| format!("line {}: bad altitude", n + 1))?;
                let sep: f64 = f[11]
                    .parse()
                    .map_err(|_| format!("line {}: bad separation", n + 1))?;
                pending = Some((f[1].to_string(), lat, lon, alt + sep));
            }
            "GPRMC" => {
                if f.len() < 10 {
                    return Err(format!("line {}: short RMC", n + 1));
                }
                let (tf, lat, lon, h) = pending
                    .take()
                    .ok_or_else(|| format!("line {}: RMC with no preceding GGA", n + 1))?;
                if tf != f[1] {
                    return Err(format!("line {}: GGA and RMC times differ", n + 1));
                }
                let speed: f64 = f[7]
                    .parse()
                    .map_err(|_| format!("line {}: bad speed", n + 1))?;
                let course = if f[8].is_empty() {
                    None
                } else {
                    Some(
                        f[8].parse::<f64>()
                            .map_err(|_| format!("line {}: bad course", n + 1))?,
                    )
                };
                let num = |s: &str| -> Option<u32> { s.parse().ok() };
                let (hh, mi, ss) = (
                    num(tf.get(0..2).unwrap_or("")),
                    num(tf.get(2..4).unwrap_or("")),
                    tf.get(4..).and_then(|x| x.parse::<f64>().ok()),
                );
                let d = f[9];
                let (dd, mo, yy) = (
                    num(d.get(0..2).unwrap_or("")),
                    num(d.get(2..4).unwrap_or("")),
                    num(d.get(4..6).unwrap_or("")),
                );
                let (Some(hh), Some(mi), Some(ss), Some(dd), Some(mo), Some(yy)) =
                    (hh, mi, ss, dd, mo, yy)
                else {
                    return Err(format!("line {}: bad time or date", n + 1));
                };
                // Two-digit years: 2000 to 2099, the range the writer produces.
                let t_s = epoch.offset_to_calendar(2000 + yy as i32, mo, dd, hh, mi, ss);
                out.push(NmeaFix {
                    t_s,
                    lat_deg: lat,
                    lon_deg: lon,
                    h_m: h,
                    speed_kn: speed,
                    course_deg: course,
                });
            }
            _ => {}
        }
    }
    if pending.is_some() {
        return Err("a GGA with no following RMC".into());
    }
    Ok(out)
}

// ---------------------------------------------------------------------------------------
// Waypoint text
// ---------------------------------------------------------------------------------------

/// Round-trip tolerance of the waypoint text longitude and latitude, degrees.
pub const WAYPOINT_ANGLE_DEG_TOL: f64 = 1.0e-9;
/// Round-trip tolerance of the waypoint text altitude, metres.
pub const WAYPOINT_HEIGHT_TOL_M: f64 = 1.0e-3;

/// Write the waypoint text some laboratory simulators read as a movement file: a first
/// line `RESOLUTION: <ms>` giving the time between waypoints, then one `longitude,
/// latitude, altitude` row per waypoint (decimal degrees, WGS 84; metres), with no
/// timestamps. The samples must be equally spaced at a whole number of milliseconds;
/// otherwise this is an error rather than a silently re-timed file.
pub fn write_waypoints(t: &Trajectory) -> Result<String, String> {
    if t.samples.len() < 2 {
        return Err("a waypoint file needs at least two samples".into());
    }
    let step = t.samples[1].t_s - t.samples[0].t_s;
    let ms = step * 1000.0;
    if ms.is_nan() || ms < 1.0 || (ms - ms.round()).abs() > 1e-6 {
        return Err(format!(
            "the sample step {step} s is not a whole number of milliseconds"
        ));
    }
    // Every interval, not only the first: one resolution describes the whole file.
    for (i, w) in t.samples.windows(2).enumerate() {
        let dt = w[1].t_s - w[0].t_s;
        if (dt - step).abs() > 1e-6 {
            return Err(format!(
                "the samples are not equally spaced: interval {} is {dt} s, the first is {step} s",
                i + 1
            ));
        }
    }
    let mut s = format!("RESOLUTION: {}\n", ms.round() as u64);
    for m in &t.samples {
        s.push_str(&format!(
            "{:.9},{:.9},{:.3}\n",
            round_dp(m.lon_deg, 9),
            round_dp(m.lat_deg, 9),
            round_dp(m.h_m, 3)
        ));
    }
    Ok(s)
}

/// A waypoint row: longitude (deg), latitude (deg), altitude (m).
pub type Waypoint = (f64, f64, f64);

/// Read waypoint text written by [`write_waypoints`]: the resolution in milliseconds and
/// the `(longitude, latitude, altitude)` rows.
pub fn read_waypoints(text: &str) -> Result<(u64, Vec<Waypoint>), String> {
    let mut lines = text.lines();
    let head = lines.next().ok_or("empty waypoint file")?;
    let ms: u64 = head
        .trim()
        .strip_prefix("RESOLUTION:")
        .ok_or("first line is not `RESOLUTION: <ms>`")?
        .trim()
        .parse()
        .map_err(|_| "bad resolution")?;
    let mut rows = Vec::new();
    for (n, line) in lines.enumerate() {
        if line.trim().is_empty() {
            continue;
        }
        let f: Vec<f64> = line
            .split(',')
            .map(|x| x.trim().parse::<f64>())
            .collect::<Result<_, _>>()
            .map_err(|_| format!("waypoint {}: not three numbers", n + 1))?;
        if f.len() != 3 {
            return Err(format!(
                "waypoint {}: {} fields, expected 3",
                n + 1,
                f.len()
            ));
        }
        rows.push((f[0], f[1], f[2]));
    }
    Ok((ms, rows))
}

// ---------------------------------------------------------------------------------------
// Events
// ---------------------------------------------------------------------------------------

/// Write the events CSV: `label,kind,onset_s,end_s,description`. The description has no
/// commas or quotes (the writer replaces them), so a plain split reads it back.
pub fn write_events_csv(t: &Trajectory) -> String {
    let mut s = String::from("label,kind,onset_s,end_s,description\n");
    for e in &t.events {
        let d: String = e
            .description
            .chars()
            .map(|c| {
                if c == ',' || c == '"' || c == '\n' {
                    ';'
                } else {
                    c
                }
            })
            .collect();
        s.push_str(&format!(
            "{},{},{:.3},{:.3},{}\n",
            e.label,
            e.kind.as_str(),
            round_dp(e.onset_s, 3),
            round_dp(e.end_s, 3),
            d
        ));
    }
    s
}

/// Read an events CSV written by [`write_events_csv`].
pub fn read_events_csv(text: &str) -> Result<Vec<MotionEvent>, String> {
    let mut lines = text.lines();
    if lines.next().map(str::trim) != Some("label,kind,onset_s,end_s,description") {
        return Err("events CSV header is not label,kind,onset_s,end_s,description".into());
    }
    let mut out = Vec::new();
    for (n, line) in lines.enumerate() {
        if line.trim().is_empty() {
            continue;
        }
        let f: Vec<&str> = line.splitn(5, ',').collect();
        if f.len() != 5 {
            return Err(format!("event row {}: expected 5 fields", n + 1));
        }
        out.push(MotionEvent {
            label: f[0].to_string(),
            kind: EventKind::parse(f[1])
                .ok_or_else(|| format!("event row {}: unknown kind {:?}", n + 1, f[1]))?,
            onset_s: f[2]
                .parse()
                .map_err(|_| format!("event row {}: bad onset", n + 1))?,
            end_s: f[3]
                .parse()
                .map_err(|_| format!("event row {}: bad end", n + 1))?,
            description: f[4].to_string(),
        });
    }
    Ok(out)
}

/// The events as `[[events]]` blocks for a `receiver-trust` scenario. Onsets are seconds
/// after the epoch; `receiver-trust` counts from the first epoch of the receiver's log, so
/// the two agree when the log starts at the motion's first sample, and the operator adds
/// the difference when it does not (see `docs/TEST-BENCH.md`).
pub fn write_events_toml(t: &Trajectory) -> String {
    let mut s = String::from(
        "# Events for a `receiver-trust` scenario. Onsets are seconds after the motion file's\n\
         # first sample; add the offset to the receiver log's first epoch if they differ.\n",
    );
    for e in &t.events {
        s.push_str(&format!(
            "\n[[events]]\nlabel = {:?}\nkind = {:?}\nonset_s = {:.3}\nend_s = {:.3}\n",
            e.label,
            e.kind.as_str(),
            round_dp(e.onset_s, 3),
            round_dp(e.end_s, 3)
        ));
    }
    s
}

// ---------------------------------------------------------------------------------------
// Export
// ---------------------------------------------------------------------------------------

/// Every file of a test-bench export, in a fixed order, from a scenario's TOML source.
pub fn export(src: &str, epoch: Option<UtcEpoch>) -> Result<Vec<ExportFile>, ExportError> {
    export_with_notes(src, epoch).map(|(files, _)| files)
}

/// [`export`], and the reasons any file was left out (today only the waypoint text, which
/// needs a millisecond-regular grid), so a caller can say so rather than drop it silently.
pub fn export_with_notes(
    src: &str,
    epoch: Option<UtcEpoch>,
) -> Result<(Vec<ExportFile>, Vec<String>), ExportError> {
    let t = trajectory_of(src, epoch)?;
    Ok(files_and_notes_of(&t))
}

/// The files of an already-built trajectory.
pub fn files_of(t: &Trajectory) -> Vec<ExportFile> {
    files_and_notes_of(t).0
}

/// The files of an already-built trajectory, and the reasons any was left out.
pub fn files_and_notes_of(t: &Trajectory) -> (Vec<ExportFile>, Vec<String>) {
    let mk = |suffix: &str, body: String| ExportFile {
        suffix: suffix.into(),
        bytes: body.into_bytes(),
    };
    let mut notes = Vec::new();
    let mut files = vec![
        mk(".motion.csv", write_motion_csv(t)),
        mk(".motion.json", write_motion_meta(t)),
        mk(".nmea", write_nmea(t)),
    ];
    // The waypoint text needs a millisecond-regular grid; a scenario whose step is not
    // one has no such file, and the reason is returned.
    match write_waypoints(t) {
        Ok(w) => files.push(mk(".waypoints.txt", w)),
        Err(e) => notes.push(format!("no .waypoints.txt written: {e}")),
    }
    files.push(mk(".events.csv", write_events_csv(t)));
    files.push(mk(".events.toml", write_events_toml(t)));
    (files, notes)
}

/// Geodetic position of a sample recomputed from its Earth-fixed position, for checks.
pub fn geodetic_of_ecef(m: &MotionSample) -> Geodetic {
    ecef_to_geodetic(m.ecef_m)
}

#[cfg(test)]
mod tests {
    use super::*;
    use crate::inertial::attitude::Quaternion;

    fn q_of(yaw: f64, pitch: f64, roll: f64) -> Quaternion {
        // 3-2-1: C = Rz(yaw) Ry(pitch) Rx(roll), so q = qz * qy * qx.
        let qz = Quaternion::from_axis_angle([0.0, 0.0, 1.0], yaw.to_radians());
        let qy = Quaternion::from_axis_angle([0.0, 1.0, 0.0], pitch.to_radians());
        let qx = Quaternion::from_axis_angle([1.0, 0.0, 0.0], roll.to_radians());
        qz.mul(&qy).mul(&qx)
    }

    #[test]
    fn euler_deg_follows_the_stated_sign_convention_for_known_quaternions() {
        // Axes: NED, body x forward, y right, z down.
        // Heading 90 degrees is east: the body x axis points along NED y.
        let q = q_of(90.0, 0.0, 0.0);
        let x = q.rotate([1.0, 0.0, 0.0]);
        assert!(x[0].abs() < 1e-12 && (x[1] - 1.0).abs() < 1e-12, "{x:?}");
        let (h, p, r) = euler_deg(&q.to_dcm());
        assert!(
            (h - 90.0).abs() < 1e-9 && p.abs() < 1e-9 && r.abs() < 1e-9,
            "{h} {p} {r}"
        );
        // Nose up: positive pitch raises the body x axis, which is negative NED down.
        let q = q_of(0.0, 20.0, 0.0);
        assert!(q.rotate([1.0, 0.0, 0.0])[2] < 0.0);
        let (_, p, _) = euler_deg(&q.to_dcm());
        assert!((p - 20.0).abs() < 1e-9, "{p}");
        // Right wing down: positive roll moves the body y axis toward NED down.
        let q = q_of(0.0, 0.0, 30.0);
        assert!(q.rotate([0.0, 1.0, 0.0])[2] > 0.0);
        let (_, _, r) = euler_deg(&q.to_dcm());
        assert!((r - 30.0).abs() < 1e-9, "{r}");
        // A general attitude is recovered, with the heading wrapped to [0, 360).
        let (h, p, r) = euler_deg(&q_of(250.0, 20.0, -35.0).to_dcm());
        assert!(
            (h - 250.0).abs() < 1e-9 && (p - 20.0).abs() < 1e-9 && (r + 35.0).abs() < 1e-9,
            "{h} {p} {r}"
        );
        let (h, _, _) = euler_deg(&q_of(-10.0, 0.0, 0.0).to_dcm());
        assert!((h - 350.0).abs() < 1e-9, "{h}");
    }
}
