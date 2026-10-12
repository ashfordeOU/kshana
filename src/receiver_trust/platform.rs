// SPDX-License-Identifier: AGPL-3.0-only
//! The platform the receiver is on: a fixed point, or a moving vessel.
//!
//! The calibration-window monitors of [`super::monitors`] assume a static antenna: the
//! position-jump monitor measures distance from the calibration mean, which is wrong on
//! a ship that is under way. A scenario therefore declares the platform in a `[platform]`
//! table before the run, together with the physical limits of the vessel. The moving-
//! platform monitors use those limits as stated thresholds; nothing is fitted to the log.
//!
//! ```toml
//! [platform]
//! kind = "vessel"
//! max_speed_kn = 20.0
//! max_accel_mps2 = 0.5
//! max_turn_rate_dps = 6.0
//! antenna_height_m = 18.0
//! heading_sensor = true
//! ```
//!
//! Without a `[platform]` table the platform is [`PlatformKind::Static`] and every
//! monitor behaves exactly as it did before the table existed.

use serde::{Deserialize, Serialize};

/// Metres per second in one knot (exact: one nautical mile, 1852 m, per hour).
pub const KN_TO_MPS: f64 = 1852.0 / 3600.0;

/// What the receiver is mounted on.
#[derive(Clone, Copy, Debug, Default, PartialEq, Eq, Serialize, Deserialize)]
#[serde(rename_all = "kebab-case")]
pub enum PlatformKind {
    /// A fixed antenna. The default; the static monitors apply unchanged.
    #[default]
    Static,
    /// A surface vessel under way. The position-jump monitor (which assumes a static
    /// receiver) is replaced by the moving-platform monitors.
    Vessel,
}

/// Default for [`PlatformCfg::max_speed_kn`]: 30 kn. Above the service speed of every
/// merchant hull and of most passenger craft, so the limit does not alarm on a real
/// vessel, yet far below the speed a position drag-off can imply. A slower vessel should
/// state its own, lower, limit: the stricter the limit, the earlier a drag is caught.
pub const DEFAULT_MAX_SPEED_KN: f64 = 30.0;
/// Default for [`PlatformCfg::max_accel_mps2`]: 0.5 m/s². A large ship changes speed by
/// well under 0.1 m/s²; a small fast craft can reach a few tenths on a hard throttle
/// change. 0.5 keeps real manoeuvres inside the limit; a counterfeit position that
/// starts to move at once exceeds it.
pub const DEFAULT_MAX_ACCEL_MPS2: f64 = 0.5;
/// Default for [`PlatformCfg::max_turn_rate_dps`]: 6 deg/s. A large ship turns at well
/// under 1 deg/s and a small craft in a hard turn at a few; 6 is above both. A counterfeit
/// track that bends sharply exceeds it.
pub const DEFAULT_MAX_TURN_RATE_DPS: f64 = 6.0;

/// The `[platform]` table of a scenario.
///
/// The vessel limits are optional keys so that a limit left out is visible as the
/// documented default in the result, and so that a vessel key under `kind = "static"` is
/// rejected rather than silently ignored.
#[derive(Clone, Debug, Default, PartialEq, Serialize, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct PlatformCfg {
    /// `static` (default) or `vessel`.
    #[serde(default)]
    pub kind: PlatformKind,
    /// Highest speed the vessel can make, knots. Default [`DEFAULT_MAX_SPEED_KN`].
    #[serde(default)]
    pub max_speed_kn: Option<f64>,
    /// Largest change of speed the vessel can make, m/s². Default
    /// [`DEFAULT_MAX_ACCEL_MPS2`].
    #[serde(default)]
    pub max_accel_mps2: Option<f64>,
    /// Largest turn rate the vessel can make, deg/s. Default [`DEFAULT_MAX_TURN_RATE_DPS`].
    #[serde(default)]
    pub max_turn_rate_dps: Option<f64>,
    /// Height of the GNSS antenna above the waterline, m. No default: it is a property of
    /// the installation and a guess would be a hidden threshold. Without it the sea-level
    /// height monitor does not run (and is not listed in `monitors_run`).
    #[serde(default)]
    pub antenna_height_m: Option<f64>,
    /// Whether the NMEA stream carries a gyro or compass heading (HDT or THS) to compare
    /// with the course over ground. Default false. Declared `true` and absent from the
    /// log is an error, so a missing sensor can never pass as a clean heading check.
    #[serde(default)]
    pub heading_sensor: bool,
}

/// The vessel limits a run actually used, after defaults.
#[derive(Clone, Copy, Debug, PartialEq, Serialize)]
pub struct VesselLimits {
    /// Highest speed, m/s.
    pub max_speed_mps: f64,
    /// Largest speed change rate, m/s².
    pub max_accel_mps2: f64,
    /// Largest turn rate, deg/s.
    pub max_turn_rate_dps: f64,
    /// Antenna height above the waterline, m, when stated.
    pub antenna_height_m: Option<f64>,
    /// Whether a heading sensor was declared.
    pub heading_sensor: bool,
}

impl PlatformCfg {
    /// True for the default static platform; used to leave the table out of serialised
    /// scenarios so a static scenario hashes exactly as it did before the table existed.
    pub fn is_static(&self) -> bool {
        *self == PlatformCfg::default()
    }

    /// Whether the platform moves.
    pub fn is_vessel(&self) -> bool {
        self.kind == PlatformKind::Vessel
    }

    /// The limits with defaults applied; `None` for a static platform.
    pub fn limits(&self) -> Option<VesselLimits> {
        self.is_vessel().then(|| VesselLimits {
            max_speed_mps: self.max_speed_kn.unwrap_or(DEFAULT_MAX_SPEED_KN) * KN_TO_MPS,
            max_accel_mps2: self.max_accel_mps2.unwrap_or(DEFAULT_MAX_ACCEL_MPS2),
            max_turn_rate_dps: self.max_turn_rate_dps.unwrap_or(DEFAULT_MAX_TURN_RATE_DPS),
            antenna_height_m: self.antenna_height_m,
            heading_sensor: self.heading_sensor,
        })
    }

    /// Reject limits no vessel has, and vessel-only keys on a static platform.
    pub fn validate(&self) -> Result<(), String> {
        let bounded = |name: &str, v: Option<f64>, lo: f64, hi: f64| -> Result<(), String> {
            match v {
                Some(x) if !(x.is_finite() && x > lo && x <= hi) => Err(format!(
                    "platform: {name} must be in ({lo}, {hi}] (got {x})"
                )),
                _ => Ok(()),
            }
        };
        if !self.is_vessel() {
            let stray = [
                ("max_speed_kn", self.max_speed_kn.is_some()),
                ("max_accel_mps2", self.max_accel_mps2.is_some()),
                ("max_turn_rate_dps", self.max_turn_rate_dps.is_some()),
                ("antenna_height_m", self.antenna_height_m.is_some()),
                ("heading_sensor", self.heading_sensor),
            ];
            if let Some((name, _)) = stray.iter().find(|(_, set)| *set) {
                return Err(format!(
                    "platform: {name} applies only to kind = \"vessel\" (kind is \"static\")"
                ));
            }
            return Ok(());
        }
        bounded("max_speed_kn", self.max_speed_kn, 0.0, 100.0)?;
        bounded("max_accel_mps2", self.max_accel_mps2, 0.0, 20.0)?;
        bounded("max_turn_rate_dps", self.max_turn_rate_dps, 0.0, 180.0)?;
        bounded("antenna_height_m", self.antenna_height_m, 0.0, 200.0)?;
        Ok(())
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    fn parse(s: &str) -> Result<PlatformCfg, toml::de::Error> {
        toml::from_str(s)
    }

    #[test]
    fn default_is_static_and_has_no_limits() {
        let p = PlatformCfg::default();
        assert!(p.is_static() && !p.is_vessel());
        assert!(p.limits().is_none());
        assert!(p.validate().is_ok());
    }

    #[test]
    fn vessel_defaults_are_the_documented_ones() {
        let p = parse("kind = \"vessel\"").unwrap();
        p.validate().unwrap();
        let l = p.limits().unwrap();
        assert!((l.max_speed_mps - 30.0 * KN_TO_MPS).abs() < 1e-12);
        assert_eq!(l.max_accel_mps2, DEFAULT_MAX_ACCEL_MPS2);
        assert_eq!(l.max_turn_rate_dps, DEFAULT_MAX_TURN_RATE_DPS);
        assert_eq!(l.antenna_height_m, None);
        assert!(!l.heading_sensor);
    }

    #[test]
    fn stated_limits_override_defaults() {
        let p = parse(
            "kind = \"vessel\"\nmax_speed_kn = 20.0\nmax_accel_mps2 = 0.2\n\
             max_turn_rate_dps = 3.0\nantenna_height_m = 18.0\nheading_sensor = true",
        )
        .unwrap();
        p.validate().unwrap();
        let l = p.limits().unwrap();
        assert!((l.max_speed_mps - 20.0 * KN_TO_MPS).abs() < 1e-12);
        assert_eq!(
            (l.max_accel_mps2, l.max_turn_rate_dps, l.antenna_height_m),
            (0.2, 3.0, Some(18.0))
        );
        assert!(l.heading_sensor);
    }

    #[test]
    fn impossible_limits_and_stray_keys_are_rejected() {
        for bad in [
            "kind = \"vessel\"\nmax_speed_kn = 0.0",
            "kind = \"vessel\"\nmax_speed_kn = 250.0",
            "kind = \"vessel\"\nmax_accel_mps2 = -1.0",
            "kind = \"vessel\"\nmax_turn_rate_dps = 400.0",
            "kind = \"vessel\"\nantenna_height_m = 0.0",
            "kind = \"static\"\nmax_speed_kn = 20.0",
            "heading_sensor = true",
        ] {
            assert!(parse(bad).unwrap().validate().is_err(), "{bad}");
        }
        assert!(parse("kind = \"submarine\"").is_err());
        assert!(parse("kind = \"vessel\"\nspeed = 3").is_err());
    }

    #[test]
    fn a_vessel_is_not_static_for_serialisation() {
        assert!(!parse("kind = \"vessel\"").unwrap().is_static());
    }
}
