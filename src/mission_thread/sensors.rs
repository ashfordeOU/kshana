// SPDX-License-Identifier: AGPL-3.0-only
//! Relative-navigation sensor models shared by the Earth-side rendezvous phase and the lunar
//! rendezvous phase.
//!
//! **ILLUSTRATIVE parameters, MODELLED forms.** The defaults are round numbers chosen to make a
//! scenario runnable; they are not the performance of any sensor, and every one can be replaced in
//! a document. The forms are the standard ones: an angles-only camera gives a cross-range error
//! proportional to range, a ranging sensor gives a range error with a floor and a proportional
//! part, and the velocity follows from differencing over the measurement interval.

use serde::{Deserialize, Serialize};

/// A relative-navigation sensor kind.
#[derive(Clone, Copy, Debug, PartialEq, Eq, Serialize, Deserialize)]
pub enum RelNavSensor {
    /// Optical camera: bearing angles, range from apparent size.
    OpticalCamera,
    /// Lidar or other active ranging with bearing.
    Lidar,
    /// Radio ranging between the two vehicles.
    RfRanging,
}

impl RelNavSensor {
    /// The name used in documents and results.
    pub fn name(self) -> &'static str {
        match self {
            RelNavSensor::OpticalCamera => "optical-camera",
            RelNavSensor::Lidar => "lidar",
            RelNavSensor::RfRanging => "rf-ranging",
        }
    }

    /// Parses a sensor name from a document.
    pub fn parse(s: &str) -> Result<Self, String> {
        Ok(match s {
            "optical-camera" => RelNavSensor::OpticalCamera,
            "lidar" => RelNavSensor::Lidar,
            "rf-ranging" => RelNavSensor::RfRanging,
            other => {
                return Err(format!(
                    "unknown relative-navigation sensor `{other}`; expected one of \
                     optical-camera, lidar, rf-ranging"
                ))
            }
        })
    }
}

/// The parameters of a sensor's error model.
#[derive(Clone, Copy, Debug, PartialEq, Serialize, Deserialize)]
pub struct SensorParams {
    /// Bearing noise, 1-sigma, radians (angular sensors).
    pub bearing_sigma_rad: f64,
    /// Range error floor, 1-sigma, metres.
    pub range_floor_m: f64,
    /// Range error proportional to range, 1-sigma, fraction of range.
    pub range_fraction: f64,
    /// The largest range the sensor works at, metres.
    pub max_range_m: f64,
    /// Measurement interval, seconds, for the velocity estimate.
    pub interval_s: f64,
}

impl SensorParams {
    /// ILLUSTRATIVE defaults for a sensor kind.
    pub fn illustrative(sensor: RelNavSensor) -> Self {
        match sensor {
            RelNavSensor::OpticalCamera => SensorParams {
                bearing_sigma_rad: 1.0e-4,
                range_floor_m: 0.05,
                range_fraction: 0.02,
                max_range_m: 50_000.0,
                interval_s: 1.0,
            },
            RelNavSensor::Lidar => SensorParams {
                bearing_sigma_rad: 2.0e-4,
                range_floor_m: 0.01,
                range_fraction: 1.0e-3,
                max_range_m: 3_000.0,
                interval_s: 1.0,
            },
            RelNavSensor::RfRanging => SensorParams {
                bearing_sigma_rad: 5.0e-3,
                range_floor_m: 1.0,
                range_fraction: 1.0e-4,
                max_range_m: 500_000.0,
                interval_s: 1.0,
            },
        }
    }
}

/// The relative-position and relative-velocity 1-sigmas a sensor delivers at a range.
#[derive(Clone, Copy, Debug, PartialEq, Serialize, Deserialize)]
pub struct SensorSigma {
    /// 1-sigma along the line of sight, metres.
    pub range_sigma_m: f64,
    /// 1-sigma across the line of sight (each of the two axes), metres.
    pub cross_sigma_m: f64,
    /// 1-sigma of the relative position, root of the sum of squares over the three axes, metres.
    pub pos_sigma_m: f64,
    /// 1-sigma of the relative velocity, metres per second, per axis, from differencing two
    /// measurements one interval apart.
    pub vel_sigma_mps: f64,
}

/// The sigmas a sensor delivers at a range, or an error when the range is outside its limits.
pub fn sensor_sigma(p: &SensorParams, range_m: f64) -> Result<SensorSigma, String> {
    if !(range_m.is_finite() && range_m > 0.0) {
        return Err(format!(
            "range must be a positive finite number of metres, got {range_m}"
        ));
    }
    if range_m > p.max_range_m {
        return Err(format!(
            "range {range_m} m is beyond the sensor's {} m limit",
            p.max_range_m
        ));
    }
    let range_sigma = (p.range_floor_m.powi(2) + (p.range_fraction * range_m).powi(2)).sqrt();
    let cross = range_m * p.bearing_sigma_rad;
    let pos = (range_sigma.powi(2) + 2.0 * cross.powi(2)).sqrt();
    // Two independent measurements one interval apart: sqrt(2) times the per-axis position
    // sigma over the interval, per axis.
    let per_axis = (pos.powi(2) / 3.0).sqrt();
    let vel = std::f64::consts::SQRT_2 * per_axis / p.interval_s;
    Ok(SensorSigma {
        range_sigma_m: range_sigma,
        cross_sigma_m: cross,
        pos_sigma_m: pos,
        vel_sigma_mps: vel,
    })
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn the_cross_range_error_grows_with_range_and_the_floor_dominates_up_close() {
        let p = SensorParams::illustrative(RelNavSensor::OpticalCamera);
        let near = sensor_sigma(&p, 10.0).unwrap();
        let far = sensor_sigma(&p, 10_000.0).unwrap();
        assert!(far.cross_sigma_m > 100.0 * near.cross_sigma_m * 0.99);
        assert!((near.range_sigma_m - 0.05f64.hypot(0.2)).abs() < 1e-12);
        assert!(far.pos_sigma_m > near.pos_sigma_m);
    }

    #[test]
    fn a_range_beyond_the_sensor_limit_or_not_positive_is_refused() {
        let p = SensorParams::illustrative(RelNavSensor::Lidar);
        assert!(sensor_sigma(&p, 5_000.0).is_err());
        assert!(sensor_sigma(&p, 0.0).is_err());
        assert!(sensor_sigma(&p, f64::NAN).is_err());
    }

    #[test]
    fn the_velocity_sigma_follows_the_position_sigma_over_the_interval() {
        let mut p = SensorParams::illustrative(RelNavSensor::RfRanging);
        let a = sensor_sigma(&p, 1000.0).unwrap();
        p.interval_s = 10.0;
        let b = sensor_sigma(&p, 1000.0).unwrap();
        assert!((a.vel_sigma_mps / b.vel_sigma_mps - 10.0).abs() < 1e-12);
    }

    #[test]
    fn sensor_names_round_trip() {
        for s in [
            RelNavSensor::OpticalCamera,
            RelNavSensor::Lidar,
            RelNavSensor::RfRanging,
        ] {
            assert_eq!(RelNavSensor::parse(s.name()).unwrap(), s);
        }
        assert!(RelNavSensor::parse("sonar").is_err());
    }
}
