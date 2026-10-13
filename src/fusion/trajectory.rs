// SPDX-License-Identifier: AGPL-3.0-only
//! Trajectory library for the `gnss-ins` pack: parametrised motion profiles and imported
//! truth.
//!
//! The pack generates its truth by integrating a *true* IMU output through the strapdown
//! mechanization, so a trajectory is defined by the IMU it produces. A profile here issues,
//! at each step and from the current truth state, a command in Euler rates `(φ̇, θ̇, ψ̇)` and
//! an along-track acceleration `a`. The IMU follows from rigid-body kinematics with the
//! velocity along the body x axis:
//!
//! - body rate relative to the navigation frame (Groves 2013, eq. 2.58, inverted):
//!   `ω_nb = [φ̇ − ψ̇ sin θ, θ̇ cos φ + ψ̇ sin φ cos θ, −θ̇ sin φ + ψ̇ cos φ cos θ]`,
//!   and the gyro reads `ω_ib = C_bn ω_in + ω_nb` (Earth rate and transport rate added);
//! - specific force `f = [a, V ω_nb,z, −V ω_nb,y] − C_bn g_n`: the centripetal
//!   acceleration of a body moving at speed `V` along its x axis while turning, less gravity.
//!   A level turn at bank `φ` with `ψ̇ = g tan φ / V` then has `f = [a, 0, −g / cos φ]`, the
//!   coordinated-turn load factor, and a level vehicle reduces to the pack's historical
//!   `[a, 0, −g]`.
//!
//! The commands close on the truth attitude and speed (proportional laws with rate limits),
//! so every profile is deterministic and smooth. Profiles (all start at rest, level, heading
//! north at the scenario origin, like the historical drive):
//!
//! - `straight`: accelerate to a cruise speed and hold it;
//! - `figure8`: accelerate, then full circles alternating left and right;
//! - `stop_go`: urban driving, accelerate, cruise with a turn, brake to a stop, wait, repeat;
//! - `aircraft`: take-off run, climb, level-off, a coordinated banked turn, level flight;
//! - `uas`: a small-drone survey, back-and-forth legs with 180-degree turns and altitude steps;
//! - `csv`: imported truth (`t, lat_deg, lon_deg, alt_m, vn, ve, vd, roll_deg, pitch_deg,
//!   yaw_deg`), turned into the IMU that makes the strapdown integration land on each imported
//!   attitude and velocity (solved by Newton iteration through [`NavState::step`]); the
//!   position then follows from the integrated velocity.
//!
//! Without a `[trajectory]` table the pack keeps its historical drive, bit for bit
//! (`tests/gnss_ins_legacy_trajectory_pin.rs`).
//!
//! MODELLED: the profiles are synthetic; the observability of each is checked by the
//! filter's own covariance (`tests/gnss_ins_trajectory_library.rs`).

use crate::frames::{Geodetic, Vec3};
use crate::inertial::attitude::Quaternion;
use crate::inertial::mechanization::{normal_gravity, NavState};
use serde::{Deserialize, Serialize};

/// A trajectory selection for the `gnss-ins` pack (`[trajectory]`, `profile = "..."`).
#[derive(Clone, Debug, Deserialize, Serialize, PartialEq)]
#[serde(tag = "profile", rename_all = "snake_case", deny_unknown_fields)]
pub enum TrajectoryCfg {
    /// Accelerate to `speed_mps` at `accel_mps2` and hold it, heading north.
    Straight {
        #[serde(default = "d_speed_car")]
        speed_mps: f64,
        #[serde(default = "d_accel")]
        accel_mps2: f64,
    },
    /// Accelerate to `speed_mps`, then full circles at `turn_rate_dps`, alternating left/right.
    Figure8 {
        #[serde(default = "d_speed_car")]
        speed_mps: f64,
        #[serde(default = "d_accel")]
        accel_mps2: f64,
        #[serde(default = "d_turn_car")]
        turn_rate_dps: f64,
    },
    /// Urban stop-and-go: accelerate, cruise `cruise_s` with a `turn_deg` turn in the middle,
    /// brake to rest, wait `stop_s`, repeat.
    StopGo {
        #[serde(default = "d_speed_urban")]
        speed_mps: f64,
        #[serde(default = "d_accel_urban")]
        accel_mps2: f64,
        #[serde(default = "d_cruise")]
        cruise_s: f64,
        #[serde(default = "d_stop")]
        stop_s: f64,
        #[serde(default = "d_turn_deg")]
        turn_deg: f64,
    },
    /// Take-off run to `speed_mps`, climb at `climb_deg` for `climb_s`, level off, a
    /// coordinated turn at `bank_deg` for `turn_s`, then level flight.
    Aircraft {
        #[serde(default = "d_speed_air")]
        speed_mps: f64,
        #[serde(default = "d_accel_air")]
        accel_mps2: f64,
        #[serde(default = "d_climb_deg")]
        climb_deg: f64,
        #[serde(default = "d_climb_s")]
        climb_s: f64,
        #[serde(default = "d_bank_deg")]
        bank_deg: f64,
        #[serde(default = "d_turn_s")]
        turn_s: f64,
    },
    /// Survey drone: legs of `leg_s` at `speed_mps`, 180-degree turns at `turn_rate_dps`,
    /// climbing or descending `alt_step_m` on alternate legs.
    Uas {
        #[serde(default = "d_speed_uas")]
        speed_mps: f64,
        #[serde(default = "d_leg_s")]
        leg_s: f64,
        #[serde(default = "d_turn_uas")]
        turn_rate_dps: f64,
        #[serde(default = "d_alt_step")]
        alt_step_m: f64,
    },
    /// Imported truth, inline CSV with a header row:
    /// `t,lat_deg,lon_deg,alt_m,vn,ve,vd,roll_deg,pitch_deg,yaw_deg`.
    Csv { csv: String },
}

fn d_speed_car() -> f64 {
    15.0
}
fn d_accel() -> f64 {
    1.0
}
fn d_turn_car() -> f64 {
    6.0
}
fn d_speed_urban() -> f64 {
    12.0
}
fn d_accel_urban() -> f64 {
    1.5
}
fn d_cruise() -> f64 {
    30.0
}
fn d_stop() -> f64 {
    10.0
}
fn d_turn_deg() -> f64 {
    90.0
}
fn d_speed_air() -> f64 {
    70.0
}
fn d_accel_air() -> f64 {
    2.5
}
fn d_climb_deg() -> f64 {
    6.0
}
fn d_climb_s() -> f64 {
    60.0
}
fn d_bank_deg() -> f64 {
    25.0
}
fn d_turn_s() -> f64 {
    60.0
}
fn d_speed_uas() -> f64 {
    8.0
}
fn d_leg_s() -> f64 {
    40.0
}
fn d_turn_uas() -> f64 {
    30.0
}
fn d_alt_step() -> f64 {
    10.0
}

/// One imported truth sample.
#[derive(Clone, Copy, Debug)]
pub struct CsvState {
    pub t: f64,
    pub state: NavState,
}

/// Parse the inline CSV of a `csv` trajectory.
pub fn parse_truth_csv(text: &str) -> Result<Vec<CsvState>, String> {
    let mut out: Vec<CsvState> = Vec::new();
    for (k, line) in text.lines().enumerate() {
        let line = line.trim();
        if line.is_empty() || line.starts_with('#') {
            continue;
        }
        if line.starts_with('t') {
            continue; // header
        }
        let v: Result<Vec<f64>, _> = line.split(',').map(|s| s.trim().parse::<f64>()).collect();
        let v = v.map_err(|_| format!("trajectory csv line {}: not numbers: {line:?}", k + 1))?;
        if v.len() != 10 {
            return Err(format!(
                "trajectory csv line {}: expected 10 columns, got {}",
                k + 1,
                v.len()
            ));
        }
        if let Some(last) = out.last() {
            if v[0] <= last.t {
                return Err(format!(
                    "trajectory csv line {}: time does not increase",
                    k + 1
                ));
            }
        }
        let q = euler_to_quat(v[7].to_radians(), v[8].to_radians(), v[9].to_radians());
        let p = Geodetic {
            lat_rad: v[1].to_radians(),
            lon_rad: v[2].to_radians(),
            alt_m: v[3],
        };
        out.push(CsvState {
            t: v[0],
            state: NavState::new(q, [v[4], v[5], v[6]], p),
        });
    }
    if out.len() < 2 {
        return Err("trajectory csv needs at least two rows".into());
    }
    Ok(out)
}

/// Body-to-navigation quaternion from roll, pitch, yaw (rad; the 3-2-1 aerospace sequence).
pub fn euler_to_quat(roll: f64, pitch: f64, yaw: f64) -> Quaternion {
    let (sr, cr) = (0.5 * roll).sin_cos();
    let (sp, cp) = (0.5 * pitch).sin_cos();
    let (sy, cy) = (0.5 * yaw).sin_cos();
    Quaternion {
        w: cr * cp * cy + sr * sp * sy,
        x: sr * cp * cy - cr * sp * sy,
        y: cr * sp * cy + sr * cp * sy,
        z: cr * cp * sy - sr * sp * cy,
    }
}

/// Roll, pitch, yaw (rad) of a body-to-navigation quaternion.
pub fn quat_to_euler(q: &Quaternion) -> (f64, f64, f64) {
    let c = q.to_dcm();
    let roll = c[2][1].atan2(c[2][2]);
    let pitch = (-c[2][0]).clamp(-1.0, 1.0).asin();
    let yaw = c[1][0].atan2(c[0][0]);
    (roll, pitch, yaw)
}

/// A trajectory ready to drive the pack: the initial truth state and the IMU at each step.
#[derive(Clone, Debug)]
pub struct Trajectory {
    cfg: TrajectoryCfg,
    /// For `csv`: the solved IMU per step of the pack grid, and the initial state.
    csv_imu: Vec<(Vec3, Vec3)>,
    initial: NavState,
}

impl Trajectory {
    /// Prepare a trajectory on the pack grid (`dt`, `n` steps) from `origin`.
    pub fn new(cfg: &TrajectoryCfg, origin: Geodetic, dt: f64, n: usize) -> Result<Self, String> {
        match cfg {
            TrajectoryCfg::Csv { csv } => {
                let rows = parse_truth_csv(csv)?;
                let initial = rows[0].state;
                let csv_imu = solve_csv_imu(&rows, dt, n)?;
                Ok(Self {
                    cfg: cfg.clone(),
                    csv_imu,
                    initial,
                })
            }
            _ => Ok(Self {
                cfg: cfg.clone(),
                csv_imu: Vec::new(),
                initial: NavState::new(Quaternion::identity(), [0.0; 3], origin),
            }),
        }
    }

    /// The initial truth state.
    pub fn initial(&self) -> NavState {
        self.initial
    }

    /// The true IMU (gyro rad/s, specific force m/s²) for the step that ends at step index
    /// `i` (time `t`), given the truth state at its start.
    pub fn imu(&self, truth: &NavState, t: f64, i: usize) -> (Vec3, Vec3) {
        if let TrajectoryCfg::Csv { .. } = self.cfg {
            return self.csv_imu[i - 1];
        }
        let (a, euler_rates) = command(&self.cfg, truth, t);
        kinematic_imu(truth, a, euler_rates)
    }
}

/// The IMU of a body moving along its x axis with along-track acceleration `a` and Euler
/// rates `(φ̇, θ̇, ψ̇)`, at the truth state `s`.
pub fn kinematic_imu(s: &NavState, a: f64, (dphi, dtheta, dpsi): (f64, f64, f64)) -> (Vec3, Vec3) {
    let (phi, theta, _) = quat_to_euler(&s.q);
    let (sf, cf) = phi.sin_cos();
    let (st, ct) = theta.sin_cos();
    let w_nb = [
        dphi - dpsi * st,
        dtheta * cf + dpsi * sf * ct,
        -dtheta * sf + dpsi * cf * ct,
    ];
    let ie = s.omega_ie_n();
    let en = s.omega_en_n();
    let w_in_b =
        s.q.conjugate()
            .rotate([ie[0] + en[0], ie[1] + en[1], ie[2] + en[2]]);
    let gyro = [
        w_in_b[0] + w_nb[0],
        w_in_b[1] + w_nb[1],
        w_in_b[2] + w_nb[2],
    ];
    let v_b = s.q.conjugate().rotate(s.v_ned);
    let speed = v_b[0];
    let g = normal_gravity(s.p_llh.lat_rad, s.p_llh.alt_m);
    let g_b = s.q.conjugate().rotate([0.0, 0.0, g]);
    let f = [
        a - g_b[0],
        speed * w_nb[2] - g_b[1],
        -speed * w_nb[1] - g_b[2],
    ];
    (gyro, f)
}

/// Speed along the body x axis (m/s).
fn speed(s: &NavState) -> f64 {
    s.q.conjugate().rotate(s.v_ned)[0]
}

/// Proportional speed hold towards `target` with the acceleration limited to `amax`.
fn speed_cmd(s: &NavState, target: f64, amax: f64) -> f64 {
    (0.5 * (target - speed(s))).clamp(-amax, amax)
}

/// Proportional angle hold towards `target` (rad) with the rate limited to `rmax` (rad/s).
fn angle_cmd(current: f64, target: f64, rmax: f64) -> f64 {
    let mut e = target - current;
    while e > std::f64::consts::PI {
        e -= std::f64::consts::TAU;
    }
    while e < -std::f64::consts::PI {
        e += std::f64::consts::TAU;
    }
    (0.5 * e).clamp(-rmax, rmax)
}

/// The command `(a, (φ̇, θ̇, ψ̇))` of a parametric profile at `t` from the truth state.
fn command(cfg: &TrajectoryCfg, s: &NavState, t: f64) -> (f64, (f64, f64, f64)) {
    let (phi, theta, _) = quat_to_euler(&s.q);
    let deg = std::f64::consts::PI / 180.0;
    let level = |phi: f64, theta: f64| {
        (
            angle_cmd(phi, 0.0, 5.0 * deg),
            angle_cmd(theta, 0.0, 2.0 * deg),
        )
    };
    match *cfg {
        TrajectoryCfg::Straight {
            speed_mps,
            accel_mps2,
        } => (speed_cmd(s, speed_mps, accel_mps2), (0.0, 0.0, 0.0)),
        TrajectoryCfg::Figure8 {
            speed_mps,
            accel_mps2,
            turn_rate_dps,
        } => {
            let t_acc = speed_mps / accel_mps2 + 10.0;
            let circle = 360.0 / turn_rate_dps.abs().max(1e-6);
            let r = if t < t_acc {
                0.0
            } else if (((t - t_acc) / circle) as i64) % 2 == 0 {
                turn_rate_dps * deg
            } else {
                -turn_rate_dps * deg
            };
            (speed_cmd(s, speed_mps, accel_mps2), (0.0, 0.0, r))
        }
        TrajectoryCfg::StopGo {
            speed_mps,
            accel_mps2,
            cruise_s,
            stop_s,
            turn_deg,
        } => {
            let ramp = speed_mps / accel_mps2 + 5.0;
            let cycle = 2.0 * ramp + cruise_s + stop_s;
            let tc = t.rem_euclid(cycle);
            let target = if tc < ramp + cruise_s { speed_mps } else { 0.0 };
            let turn_rate = 15.0 * deg;
            let turn_len = turn_deg.abs() * deg / turn_rate;
            let t0 = ramp + 0.5 * (cruise_s - turn_len);
            let r = if tc >= t0 && tc < t0 + turn_len && speed(s) > 1.0 {
                turn_rate * turn_deg.signum()
            } else {
                0.0
            };
            (speed_cmd(s, target, accel_mps2), (0.0, 0.0, r))
        }
        TrajectoryCfg::Aircraft {
            speed_mps,
            accel_mps2,
            climb_deg,
            climb_s,
            bank_deg,
            turn_s,
        } => {
            let t_roll = speed_mps / accel_mps2 + 10.0;
            let t_level = t_roll + climb_s;
            let t_turn = t_level + 30.0;
            let t_out = t_turn + turn_s;
            let a = speed_cmd(s, speed_mps, accel_mps2);
            let theta_t = if t >= t_roll && t < t_level {
                climb_deg * deg
            } else {
                0.0
            };
            let phi_t = if t >= t_turn && t < t_out {
                bank_deg * deg
            } else {
                0.0
            };
            let dphi = angle_cmd(phi, phi_t, 5.0 * deg);
            let dtheta = angle_cmd(theta, theta_t, 2.0 * deg);
            let v = speed(s).max(1.0);
            let g = normal_gravity(s.p_llh.lat_rad, s.p_llh.alt_m);
            let dpsi = g * phi.tan() / v;
            (a, (dphi, dtheta, dpsi))
        }
        TrajectoryCfg::Uas {
            speed_mps,
            leg_s,
            turn_rate_dps,
            alt_step_m,
        } => {
            let turn_len = 180.0 / turn_rate_dps.abs().max(1e-6);
            let t_acc = speed_mps / 2.0 + 5.0;
            let cycle = leg_s + turn_len;
            let tc = (t - t_acc).max(0.0);
            let k = (tc / cycle) as i64;
            let in_turn = t > t_acc && tc - k as f64 * cycle >= leg_s;
            let dir = if k % 2 == 0 { 1.0 } else { -1.0 };
            let r = if in_turn {
                dir * turn_rate_dps * deg
            } else {
                0.0
            };
            // Climb or descend `alt_step_m` over the first half of alternate legs.
            let half = 0.5 * leg_s;
            let in_climb = t > t_acc && !in_turn && tc - k as f64 * cycle < half;
            let theta_t = if in_climb {
                let sign = if k % 2 == 0 { 1.0 } else { -1.0 };
                sign * (alt_step_m / (half * speed_mps)).atan()
            } else {
                0.0
            };
            let (dphi, _) = level(phi, theta);
            (
                speed_cmd(s, speed_mps, 2.0),
                (dphi, angle_cmd(theta, theta_t, 5.0 * deg), r),
            )
        }
        TrajectoryCfg::Csv { .. } => unreachable!("csv has its own IMU table"),
    }
}

/// Linear interpolation of the imported truth at `t` (attitude by normalised quaternion
/// interpolation, sign-aligned).
fn interp(rows: &[CsvState], t: f64) -> NavState {
    let i = rows.partition_point(|r| r.t <= t).clamp(1, rows.len() - 1);
    let (a, b) = (&rows[i - 1], &rows[i]);
    let w = ((t - a.t) / (b.t - a.t)).clamp(0.0, 1.0);
    let lerp = |x: f64, y: f64| x + w * (y - x);
    let (qa, mut qb) = (a.state.q, b.state.q);
    if qa.w * qb.w + qa.x * qb.x + qa.y * qb.y + qa.z * qb.z < 0.0 {
        qb = Quaternion {
            w: -qb.w,
            x: -qb.x,
            y: -qb.y,
            z: -qb.z,
        };
    }
    let q = Quaternion {
        w: lerp(qa.w, qb.w),
        x: lerp(qa.x, qb.x),
        y: lerp(qa.y, qb.y),
        z: lerp(qa.z, qb.z),
    };
    NavState::new(
        q,
        [
            lerp(a.state.v_ned[0], b.state.v_ned[0]),
            lerp(a.state.v_ned[1], b.state.v_ned[1]),
            lerp(a.state.v_ned[2], b.state.v_ned[2]),
        ],
        Geodetic {
            lat_rad: lerp(a.state.p_llh.lat_rad, b.state.p_llh.lat_rad),
            lon_rad: lerp(a.state.p_llh.lon_rad, b.state.p_llh.lon_rad),
            alt_m: lerp(a.state.p_llh.alt_m, b.state.p_llh.alt_m),
        },
    )
}

/// Solve, step by step, the IMU that carries the integrated state onto the imported attitude
/// and velocity at every grid time (Newton iteration through [`NavState::step`]).
fn solve_csv_imu(rows: &[CsvState], dt: f64, n: usize) -> Result<Vec<(Vec3, Vec3)>, String> {
    let t0 = rows[0].t;
    if t0 + n as f64 * dt > rows[rows.len() - 1].t + 1e-9 {
        return Err(format!(
            "trajectory csv covers {:.1} s but the scenario runs {:.1} s",
            rows[rows.len() - 1].t - t0,
            n as f64 * dt
        ));
    }
    let mut s = rows[0].state;
    let mut out = Vec::with_capacity(n);
    for i in 1..=n {
        let target = interp(rows, t0 + i as f64 * dt);
        // First guess: finite differences.
        let dq = s.q.conjugate().mul(&target.q);
        let mut gyro = scale(rotvec(&dq), 1.0 / dt);
        let ie = s.omega_ie_n();
        let en = s.omega_en_n();
        let w_in_b =
            s.q.conjugate()
                .rotate([ie[0] + en[0], ie[1] + en[1], ie[2] + en[2]]);
        gyro = add(gyro, w_in_b);
        let g = normal_gravity(s.p_llh.lat_rad, s.p_llh.alt_m);
        let a_n = scale(sub(target.v_ned, s.v_ned), 1.0 / dt);
        let mut f = s.q.conjugate().rotate(sub(a_n, [0.0, 0.0, g]));
        for _ in 0..6 {
            let mut trial = s;
            trial.step(gyro, f, dt);
            let q_err = trial.q.conjugate().mul(&target.q);
            let dv = sub(target.v_ned, trial.v_ned);
            gyro = add(gyro, scale(rotvec(&q_err), 1.0 / dt));
            f = add(f, scale(trial.q.conjugate().rotate(dv), 1.0 / dt));
        }
        s.step(gyro, f, dt);
        out.push((gyro, f));
    }
    Ok(out)
}

/// The rotation vector (rad) of a unit quaternion.
fn rotvec(q: &Quaternion) -> Vec3 {
    let q = if q.w < 0.0 {
        Quaternion {
            w: -q.w,
            x: -q.x,
            y: -q.y,
            z: -q.z,
        }
    } else {
        *q
    };
    let s = (q.x * q.x + q.y * q.y + q.z * q.z).sqrt();
    if s < 1e-15 {
        return [2.0 * q.x, 2.0 * q.y, 2.0 * q.z];
    }
    let ang = 2.0 * s.atan2(q.w);
    [q.x / s * ang, q.y / s * ang, q.z / s * ang]
}

fn add(a: Vec3, b: Vec3) -> Vec3 {
    [a[0] + b[0], a[1] + b[1], a[2] + b[2]]
}
fn sub(a: Vec3, b: Vec3) -> Vec3 {
    [a[0] - b[0], a[1] - b[1], a[2] - b[2]]
}
fn scale(a: Vec3, k: f64) -> Vec3 {
    [a[0] * k, a[1] * k, a[2] * k]
}

#[cfg(test)]
mod tests {
    use super::*;

    fn origin() -> Geodetic {
        Geodetic {
            lat_rad: 45f64.to_radians(),
            lon_rad: 0.0,
            alt_m: 50.0,
        }
    }

    fn fly(cfg: &TrajectoryCfg, dt: f64, n: usize) -> Vec<NavState> {
        let tr = Trajectory::new(cfg, origin(), dt, n).unwrap();
        let mut s = tr.initial();
        let mut out = vec![s];
        for i in 1..=n {
            let (g, f) = tr.imu(&s, i as f64 * dt, i);
            s.step(g, f, dt);
            out.push(s);
        }
        out
    }

    #[test]
    fn euler_round_trip() {
        for &(r, p, y) in &[(0.1, -0.2, 2.5), (-0.4, 0.3, -1.0), (0.0, 0.0, 0.0)] {
            let (a, b, c) = quat_to_euler(&euler_to_quat(r, p, y));
            assert!((a - r).abs() < 1e-12 && (b - p).abs() < 1e-12 && (c - y).abs() < 1e-12);
        }
    }

    #[test]
    fn a_level_vehicle_gets_the_historical_specific_force() {
        let s = NavState::new(Quaternion::identity(), [5.0, 0.0, 0.0], origin());
        let (_, f) = kinematic_imu(&s, 1.5, (0.0, 0.0, 0.0));
        let g = normal_gravity(s.p_llh.lat_rad, s.p_llh.alt_m);
        assert!((f[0] - 1.5).abs() < 1e-12 && f[1].abs() < 1e-12 && (f[2] + g).abs() < 1e-12);
    }

    #[test]
    fn a_coordinated_turn_has_no_side_force() {
        let bank: f64 = 0.4;
        let s = NavState::new(euler_to_quat(bank, 0.0, 0.0), [70.0, 0.0, 0.0], origin());
        let g = normal_gravity(s.p_llh.lat_rad, s.p_llh.alt_m);
        let (_, f) = kinematic_imu(&s, 0.0, (0.0, 0.0, g * bank.tan() / 70.0));
        assert!(f[1].abs() < 1e-9, "{f:?}");
        assert!((f[2] + g / bank.cos()).abs() < 1e-9, "{f:?}");
    }

    #[test]
    fn straight_reaches_cruise_speed_and_holds_heading() {
        let cfg = TrajectoryCfg::Straight {
            speed_mps: 15.0,
            accel_mps2: 1.0,
        };
        let path = fly(&cfg, 0.1, 600);
        let last = path.last().unwrap();
        assert!((last.v_ned[0] - 15.0).abs() < 0.05, "{:?}", last.v_ned);
        assert!(last.v_ned[1].abs() < 0.01);
    }

    #[test]
    fn figure8_turns_both_ways_and_aircraft_climbs_and_banks() {
        let f8 = fly(
            &TrajectoryCfg::Figure8 {
                speed_mps: 15.0,
                accel_mps2: 1.0,
                turn_rate_dps: 6.0,
            },
            0.1,
            1800,
        );
        let yaws: Vec<f64> = f8.iter().map(|s| quat_to_euler(&s.q).2).collect();
        assert!(yaws.iter().any(|&y| y > 1.0) && yaws.iter().any(|&y| y < -1.0));
        let ac = fly(
            &TrajectoryCfg::Aircraft {
                speed_mps: 70.0,
                accel_mps2: 2.5,
                climb_deg: 6.0,
                climb_s: 60.0,
                bank_deg: 25.0,
                turn_s: 60.0,
            },
            0.1,
            2500,
        );
        let max_alt = ac.iter().map(|s| s.p_llh.alt_m).fold(f64::MIN, f64::max);
        let max_bank = ac
            .iter()
            .map(|s| quat_to_euler(&s.q).0)
            .fold(f64::MIN, f64::max);
        assert!(max_alt > 50.0 + 300.0, "{max_alt}");
        assert!(
            (max_bank.to_degrees() - 25.0).abs() < 1.0,
            "{}",
            max_bank.to_degrees()
        );
    }

    #[test]
    fn csv_import_reproduces_a_flown_profile() {
        // Fly a profile, write it as CSV every 1 s, re-import on a 0.1 s grid: the integrated
        // attitude and velocity must land on the rows.
        let cfg = TrajectoryCfg::StopGo {
            speed_mps: 12.0,
            accel_mps2: 1.5,
            cruise_s: 30.0,
            stop_s: 10.0,
            turn_deg: 90.0,
        };
        let path = fly(&cfg, 0.1, 1200);
        let mut csv = String::from("t,lat_deg,lon_deg,alt_m,vn,ve,vd,roll_deg,pitch_deg,yaw_deg\n");
        for (k, s) in path.iter().enumerate().step_by(10) {
            let (r, p, y) = quat_to_euler(&s.q);
            csv.push_str(&format!(
                "{},{:.12},{:.12},{:.6},{:.9},{:.9},{:.9},{:.9},{:.9},{:.9}\n",
                k as f64 * 0.1,
                s.p_llh.lat_rad.to_degrees(),
                s.p_llh.lon_rad.to_degrees(),
                s.p_llh.alt_m,
                s.v_ned[0],
                s.v_ned[1],
                s.v_ned[2],
                r.to_degrees(),
                p.to_degrees(),
                y.to_degrees()
            ));
        }
        let rows = parse_truth_csv(&csv).unwrap();
        let back = fly(&TrajectoryCfg::Csv { csv }, 0.1, 1200);
        let mut worst_v = 0.0f64;
        let mut worst_p = 0.0f64;
        for (k, s) in back.iter().enumerate().step_by(10) {
            let r = &rows[k / 10].state;
            for j in 0..3 {
                worst_v = worst_v.max((s.v_ned[j] - r.v_ned[j]).abs());
            }
            let (rn, _) = crate::inertial::mechanization::radii_of_curvature(r.p_llh.lat_rad);
            worst_p = worst_p.max((s.p_llh.lat_rad - r.p_llh.lat_rad).abs() * rn);
        }
        assert!(worst_v < 1e-3, "velocity {worst_v}");
        assert!(worst_p < 1.0, "position {worst_p}");
    }

    #[test]
    fn csv_errors_are_reported() {
        assert!(parse_truth_csv("t,a\n1,2\n").is_err());
        assert!(parse_truth_csv("0,45,0,0,0,0,0,0,0,0\n0,45,0,0,0,0,0,0,0,0\n").is_err());
    }
}
