// SPDX-License-Identifier: AGPL-3.0-only
//! The truth record a GNSS/INS run is scored against and its sensors are synthesised
//! from: one [`TruthEpoch`] per step of the scenario's time grid.
//!
//! Each epoch carries the true navigation state at `t` and the true (error-free) IMU
//! output that carried the state from the previous epoch to this one. The first epoch
//! (`t = 0`) carries zero IMU output: nothing has been integrated yet. A sensor model
//! corrupts `gyro` and `accel` and feeds them to a navigator; a measurement generator
//! reads `nav`; a scorer compares a navigator's state with `nav`.

use crate::frames::Vec3;
use crate::inertial::mechanization::NavState;

/// One step of a truth trajectory.
#[derive(Clone, Copy, Debug)]
pub struct TruthEpoch {
    /// Seconds from the start of the run.
    pub t: f64,
    /// True navigation state at `t` (attitude, NED velocity, geodetic position).
    pub nav: NavState,
    /// True body angular rate (rad/s) over the step that ended at `t`; zero at `t = 0`.
    pub gyro: Vec3,
    /// True body specific force (m/s²) over the step that ended at `t`; zero at `t = 0`.
    pub accel: Vec3,
}
