// SPDX-License-Identifier: AGPL-3.0-only
//! Scene geometry: the receiver's trajectory and clock, each satellite's position (from a
//! broadcast ephemeris or a stated range profile), and the pseudorange, its rate and the
//! look angles they give.
//!
//! Time arguments: `t` is **receiver time**, seconds from scene start as the receiver's own
//! clock counts them (sample `k` is taken at `t = k / fs`); `T` is **true time**, seconds
//! from the true instant the receiver clock read zero. The receiver clock offset is
//! `b(T) = bias + drift * T`, so `t = T + b(T)`.

use crate::frames::{ecef_to_geodetic, look_angles};
use crate::iq::C_M_PER_S;
use crate::pvt::sagnac_rotate;
use crate::rinex::RinexEphemeris;

/// An Earth-centred, Earth-fixed position or velocity (m or m/s).
pub type Vec3 = [f64; 3];

/// The receiver's path through the scene, in ECEF metres against true scene time.
#[derive(Clone, Debug, PartialEq)]
pub enum Trajectory {
    /// A fixed position.
    Static(Vec3),
    /// Straight-line motion from `pos0` at `T = 0` with constant velocity `vel` (m/s).
    ConstantVelocity {
        /// Position at true time 0 (m).
        pos0: Vec3,
        /// Velocity (m/s).
        vel: Vec3,
    },
    /// `(T, position)` waypoints in increasing time, linearly interpolated; the position is
    /// held at the first waypoint before it and at the last after it.
    Waypoints(Vec<(f64, Vec3)>),
}

impl Trajectory {
    /// Position (m) at true time `t_true_s`.
    pub fn position(&self, t_true_s: f64) -> Vec3 {
        match self {
            Trajectory::Static(p) => *p,
            Trajectory::ConstantVelocity { pos0, vel } => [
                pos0[0] + vel[0] * t_true_s,
                pos0[1] + vel[1] * t_true_s,
                pos0[2] + vel[2] * t_true_s,
            ],
            Trajectory::Waypoints(w) => {
                let (i, s) = waypoint_segment(w, t_true_s);
                match i {
                    None => w.first().map(|p| p.1).unwrap_or([0.0; 3]),
                    Some(i) if i + 1 >= w.len() => w[w.len() - 1].1,
                    Some(i) => {
                        let (a, b) = (w[i].1, w[i + 1].1);
                        [
                            a[0] + (b[0] - a[0]) * s,
                            a[1] + (b[1] - a[1]) * s,
                            a[2] + (b[2] - a[2]) * s,
                        ]
                    }
                }
            }
        }
    }

    /// Velocity (m/s) at true time `t_true_s` (piecewise constant for waypoints, zero
    /// outside them).
    pub fn velocity(&self, t_true_s: f64) -> Vec3 {
        match self {
            Trajectory::Static(_) => [0.0; 3],
            Trajectory::ConstantVelocity { vel, .. } => *vel,
            Trajectory::Waypoints(w) => match waypoint_segment(w, t_true_s).0 {
                Some(i) if i + 1 < w.len() => {
                    let dt = w[i + 1].0 - w[i].0;
                    let (a, b) = (w[i].1, w[i + 1].1);
                    [(b[0] - a[0]) / dt, (b[1] - a[1]) / dt, (b[2] - a[2]) / dt]
                }
                _ => [0.0; 3],
            },
        }
    }

    /// `Err` with a description when the trajectory is malformed (no waypoints, or
    /// waypoint times not strictly increasing, or a non-finite value).
    pub fn validate(&self) -> Result<(), String> {
        let finite = |v: &Vec3| v.iter().all(|x| x.is_finite());
        match self {
            Trajectory::Static(p) if !finite(p) => Err("static position not finite".into()),
            Trajectory::ConstantVelocity { pos0, vel } if !finite(pos0) || !finite(vel) => {
                Err("constant-velocity trajectory not finite".into())
            }
            Trajectory::Waypoints(w) => {
                if w.is_empty() {
                    return Err("waypoint trajectory has no waypoints".into());
                }
                if w.iter().any(|(t, p)| !t.is_finite() || !finite(p)) {
                    return Err("waypoint not finite".into());
                }
                if w.windows(2).any(|p| p[1].0 <= p[0].0) {
                    return Err("waypoint times must increase strictly".into());
                }
                Ok(())
            }
            _ => Ok(()),
        }
    }
}

/// The segment index `i` (between waypoints `i` and `i + 1`) and the fraction along it;
/// `None` before the first waypoint, `Some(last)` at or after the last.
fn waypoint_segment(w: &[(f64, Vec3)], t: f64) -> (Option<usize>, f64) {
    if w.is_empty() || t < w[0].0 {
        return (None, 0.0);
    }
    let last = w.len() - 1;
    if t >= w[last].0 {
        return (Some(last), 0.0);
    }
    // Index of the last waypoint at or before t.
    let i = w.partition_point(|p| p.0 <= t) - 1;
    let s = (t - w[i].0) / (w[i + 1].0 - w[i].0);
    (Some(i), s)
}

/// The receiver clock: offset `b(T) = bias_s + drift_s_per_s * T` from true time.
#[derive(Clone, Copy, Debug, Default, PartialEq)]
pub struct ReceiverClock {
    /// Clock offset at true time 0 (s); positive means the receiver clock reads ahead.
    pub bias_s: f64,
    /// Clock drift (s/s); a drift `d` shifts every carrier by `-d * f_carrier` Hz.
    pub drift_s_per_s: f64,
}

impl ReceiverClock {
    /// Offset `b(T)` (s) at true time `t_true_s`.
    pub fn offset_at(&self, t_true_s: f64) -> f64 {
        self.bias_s + self.drift_s_per_s * t_true_s
    }
    /// True time `T` at receiver time `t_rx_s` (solves `t = T + b(T)` exactly).
    pub fn true_time(&self, t_rx_s: f64) -> f64 {
        (t_rx_s - self.bias_s) / (1.0 + self.drift_s_per_s)
    }
}

/// A satellite given directly by its geometric range against true scene time, a quadratic
/// `range_m + range_rate_mps * T + 0.5 * range_accel_mps2 * T²`, with fixed look angles.
/// For tests and for scenes that do not need orbits; the receiver trajectory does not
/// enter. No satellite clock offset.
#[derive(Clone, Copy, Debug, PartialEq)]
pub struct RangeProfile {
    /// Geometric range at true time 0 (m).
    pub range_m: f64,
    /// Range rate (m/s); positive when receding.
    pub range_rate_mps: f64,
    /// Range acceleration (m/s²).
    pub range_accel_mps2: f64,
    /// Elevation used for visibility and the elevation-based C/N0 (degrees).
    pub elevation_deg: f64,
    /// Azimuth reported in the truth and to the channel hook (degrees).
    pub azimuth_deg: f64,
}

impl RangeProfile {
    /// Geometric range (m) at true time `t_true_s`.
    pub fn range_at(&self, t_true_s: f64) -> f64 {
        self.range_m
            + self.range_rate_mps * t_true_s
            + 0.5 * self.range_accel_mps2 * t_true_s * t_true_s
    }
    /// Range rate (m/s) at true time `t_true_s`.
    pub fn range_rate_at(&self, t_true_s: f64) -> f64 {
        self.range_rate_mps + self.range_accel_mps2 * t_true_s
    }
}

/// Where a satellite's geometry comes from.
#[derive(Clone, Debug)]
pub enum SatGeometry {
    /// A Keplerian broadcast ephemeris (GPS, Galileo, QZSS or BeiDou MEO/IGSO) as parsed by
    /// [`crate::rinex::parse_nav`], evaluated with the IS-GPS-200 user algorithm
    /// ([`RinexEphemeris::sv_position_ecef`]) at the light-time-solved transmit time and
    /// rotated for Earth rotation during flight ([`crate::pvt::sagnac_rotate`]). The
    /// satellite clock (broadcast polynomial and relativistic term, less the group delay
    /// the clock refers to) enters the pseudorange.
    Broadcast(Box<RinexEphemeris>),
    /// A stated range profile.
    Profile(RangeProfile),
}

/// The geometry of one satellite at one instant of receiver time.
#[derive(Clone, Copy, Debug, Default, PartialEq)]
pub struct GeomPoint {
    /// Pseudorange `rho + c * (b_rx - dt_sv)` (m).
    pub pseudorange_m: f64,
    /// Elevation (degrees).
    pub elevation_deg: f64,
    /// Azimuth (degrees clockwise from north).
    pub azimuth_deg: f64,
}

/// Step (s of receiver time) of the central difference that gives a broadcast satellite's
/// pseudorange rate. Truncation error is `h² P''' / 6`, about 1e-9 m/s for GPS orbits;
/// rounding error is about `ulp(P) / h`, 4e-6 m/s (2e-5 Hz at L1).
const RATE_STEP_S: f64 = 1e-3;

impl SatGeometry {
    /// Pseudorange and look angles at receiver time `t_rx_s`, for a scene whose receiver
    /// clock read `start_tow_s` (GPS time of week) at `t = 0`.
    pub fn point(
        &self,
        t_rx_s: f64,
        start_tow_s: f64,
        traj: &Trajectory,
        clock: &ReceiverClock,
    ) -> GeomPoint {
        let tt = clock.true_time(t_rx_s);
        let b = clock.offset_at(tt);
        match self {
            SatGeometry::Profile(p) => GeomPoint {
                pseudorange_m: p.range_at(tt) + C_M_PER_S * b,
                elevation_deg: p.elevation_deg,
                azimuth_deg: p.azimuth_deg,
            },
            SatGeometry::Broadcast(eph) => {
                let rx = traj.position(tt);
                let t_gps = start_tow_s + tt;
                // Light-time iteration: each pass shrinks the error by about v/c (1e-5).
                let mut tau = 0.075;
                let mut sat = [0.0; 3];
                for _ in 0..5 {
                    sat = sagnac_rotate(eph.sv_position_ecef(t_gps - tau), tau);
                    tau = dist(sat, rx) / C_M_PER_S;
                }
                let t_tx = t_gps - tau;
                let dt_sv = eph.sv_clock_bias_s(t_tx) - eph.clock_reference_group_delay_s();
                let look = look_angles(ecef_to_geodetic(rx), sat);
                GeomPoint {
                    pseudorange_m: tau * C_M_PER_S + C_M_PER_S * (b - dt_sv),
                    elevation_deg: look.el_rad.to_degrees(),
                    azimuth_deg: look.az_rad.to_degrees(),
                }
            }
        }
    }

    /// Pseudorange rate `dP/dt` (m/s) with respect to receiver time at `t_rx_s`: exact for
    /// a profile, a central difference for a broadcast ephemeris.
    pub fn pseudorange_rate(
        &self,
        t_rx_s: f64,
        start_tow_s: f64,
        traj: &Trajectory,
        clock: &ReceiverClock,
    ) -> f64 {
        match self {
            SatGeometry::Profile(p) => {
                let tt = clock.true_time(t_rx_s);
                // P(t) = rho(T(t)) + c b(T(t)), dT/dt = 1 / (1 + drift).
                (p.range_rate_at(tt) + C_M_PER_S * clock.drift_s_per_s)
                    / (1.0 + clock.drift_s_per_s)
            }
            SatGeometry::Broadcast(_) => {
                let h = RATE_STEP_S;
                let a = self.point(t_rx_s + h, start_tow_s, traj, clock);
                let b = self.point(t_rx_s - h, start_tow_s, traj, clock);
                (a.pseudorange_m - b.pseudorange_m) / (2.0 * h)
            }
        }
    }
}

fn dist(a: Vec3, b: Vec3) -> f64 {
    let (dx, dy, dz) = (a[0] - b[0], a[1] - b[1], a[2] - b[2]);
    (dx * dx + dy * dy + dz * dz).sqrt()
}

/// The elevation-based C/N0 default, used for a satellite that states none:
/// `horizon_dbhz + (zenith_dbhz - horizon_dbhz) * sin(elevation)`, elevation clamped to
/// `[0, 90]` degrees.
///
/// MODELLED: a smooth stand-in for the combined effect of the receive antenna pattern and
/// path length on a GPS L1 C/A signal, chosen so typical open-sky values result (about
/// 45 dB-Hz high, 35 to 38 dB-Hz low). Not fitted to any antenna or receiver.
#[derive(Clone, Copy, Debug, PartialEq)]
pub struct ElevationCn0 {
    /// C/N0 at the zenith (dB-Hz).
    pub zenith_dbhz: f64,
    /// C/N0 at zero elevation (dB-Hz).
    pub horizon_dbhz: f64,
}

impl Default for ElevationCn0 {
    fn default() -> Self {
        Self {
            zenith_dbhz: 47.0,
            horizon_dbhz: 35.0,
        }
    }
}

impl ElevationCn0 {
    /// C/N0 (dB-Hz) at `elevation_deg`.
    pub fn cn0_dbhz(&self, elevation_deg: f64) -> f64 {
        let s = elevation_deg.clamp(0.0, 90.0).to_radians().sin();
        self.horizon_dbhz + (self.zenith_dbhz - self.horizon_dbhz) * s
    }
}
