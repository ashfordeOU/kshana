// SPDX-License-Identifier: AGPL-3.0-only
//! Satellite geometry from the engine's own nominal constellations.
//!
//! GPS comes from the SPS Performance Standard slot table, Galileo and BeiDou from their
//! published Walker patterns, GLONASS from its interface control document, all through
//! [`crate::constellation`], and positions are propagated by
//! [`crate::constellation::satellite_positions_fixed`] (two-body plus secular J2, Earth
//! rotation) from the GPS slot-table epoch, continuously, with no wrapping. The geometry
//! is the *nominal* constellation, not an ephemeris of the stream's date: each
//! constellation keeps its published slot layout and moves as a whole under J2, so the
//! visible counts, elevations and azimuths are plausible for the place and the time, but
//! a satellite's identity and exact position are not those of the real sky on that date.
//! PRNs are assigned in slot order.
//!
//! Satellite positions and look angles come from engine functions that use the host's
//! mathematics library, so the elevation and azimuth rounded into GSV can differ in a rare
//! borderline digit between platforms; on one platform the output is byte-identical.

use crate::body::Body;
use crate::constellation::{
    beidou_slots, galileo_walker, glonass_slots, gps_slots, satellite_positions_fixed, Elements,
};

/// Unix time of the GPS slot-table epoch, 2016-12-31 23:59:43 UTC, seconds.
pub const EPOCH_UNIX_S: f64 = 1_483_228_783.0;

/// A satellite navigation system.
#[derive(Clone, Copy, Debug, PartialEq, Eq, PartialOrd, Ord)]
pub enum System {
    /// GPS.
    Gps,
    /// GLONASS.
    Glonass,
    /// Galileo.
    Galileo,
    /// BeiDou (MEO satellites).
    Beidou,
}

impl System {
    /// Parse a TOML constellation name.
    pub fn parse(s: &str) -> Result<Self, String> {
        match s.trim().to_ascii_lowercase().as_str() {
            "gps" => Ok(System::Gps),
            "glonass" => Ok(System::Glonass),
            "galileo" => Ok(System::Galileo),
            "beidou" | "bds" => Ok(System::Beidou),
            other => Err(format!(
                "receiver.systems: unknown constellation {other:?} (gps, glonass, galileo, beidou)"
            )),
        }
    }
    /// NMEA talker for this system's GSV sentences.
    pub fn talker(self) -> &'static str {
        match self {
            System::Gps => "GP",
            System::Glonass => "GL",
            System::Galileo => "GA",
            System::Beidou => "GB",
        }
    }
    /// NMEA 4.10 signal ID of the primary civil signal (GSV last field).
    pub fn signal_id(self) -> u8 {
        match self {
            System::Gps | System::Glonass | System::Beidou => 1,
            System::Galileo => 7,
        }
    }
    /// NMEA 4.10 GSA system ID.
    pub fn gsa_id(self) -> u8 {
        match self {
            System::Gps => 1,
            System::Glonass => 2,
            System::Galileo => 3,
            System::Beidou => 4,
        }
    }
    /// Position of this system's character in the GNS mode string.
    pub fn gns_index(self) -> usize {
        self.gsa_id() as usize - 1
    }
}

/// One satellite of the model.
#[derive(Clone, Copy, Debug)]
pub struct SatDef {
    /// System.
    pub sys: System,
    /// The number NMEA carries for it (PRN or slot).
    pub num: u32,
    /// Index of the satellite in the model, stable for hashing.
    pub idx: usize,
}

/// The constellations a receiver tracks.
pub struct SkyModel {
    /// Satellites in propagation order.
    pub sats: Vec<SatDef>,
    groups: Vec<Vec<Elements>>,
    earth: Body,
}

impl SkyModel {
    /// Build the model for the named systems.
    pub fn new(systems: &[System]) -> Result<Self, String> {
        let earth = Body::earth();
        let mut sorted: Vec<System> = systems.to_vec();
        sorted.sort();
        sorted.dedup();
        let mut groups = Vec::new();
        let mut sats = Vec::new();
        for &sys in &sorted {
            let els: Vec<Elements> = match sys {
                System::Gps => gps_slots(&[])?.into_iter().map(|(_, e)| e).collect(),
                System::Glonass => glonass_slots(earth.re)
                    .into_iter()
                    .map(|(_, e)| e)
                    .collect(),
                System::Galileo => galileo_walker().elements()?,
                System::Beidou => beidou_slots(false)?.into_iter().map(|(_, e)| e).collect(),
            };
            for i in 0..els.len() {
                let num = match sys {
                    System::Glonass => 65 + i as u32,
                    System::Beidou => 19 + i as u32,
                    _ => 1 + i as u32,
                };
                sats.push(SatDef {
                    sys,
                    num,
                    idx: sats.len(),
                });
            }
            groups.push(els);
        }
        Ok(Self {
            sats,
            groups,
            earth,
        })
    }

    /// Earth-fixed satellite positions at the given Unix time (seconds), in `sats` order.
    pub fn positions(&self, unix_s: f64) -> Vec<[f64; 3]> {
        satellite_positions_fixed(&self.earth, &self.groups, true, unix_s - EPOCH_UNIX_S)
    }
}

#[cfg(test)]
mod tests {
    use super::*;
    use crate::frames::{look_angles, Geodetic};

    #[test]
    fn a_northern_sea_sees_a_plausible_sky() {
        let m = SkyModel::new(&[
            System::Gps,
            System::Glonass,
            System::Galileo,
            System::Beidou,
        ])
        .unwrap();
        assert_eq!(m.sats.len(), 96);
        let here = Geodetic {
            lat_rad: 55.0_f64.to_radians(),
            lon_rad: 3.0_f64.to_radians(),
            alt_m: 15.0,
        };
        for h in 0..24 {
            let pos = m.positions(1_780_000_000.0 + h as f64 * 3600.0);
            let vis = pos
                .iter()
                .filter(|p| look_angles(here, **p).el_rad > 5.0_f64.to_radians())
                .count();
            assert!(
                (18..=45).contains(&vis),
                "hour {h}: {vis} satellites above 5 deg"
            );
        }
    }

    /// The sky is continuous in time: across the instants where the old sidereal-day wrap
    /// sat, and across ordinary instants, the second difference of every satellite's
    /// position over a one-second span is a few metres (the orbital acceleration), where a
    /// jump of any size would show as kilometres.
    #[test]
    fn positions_are_continuous_through_former_wrap_instants() {
        let m = SkyModel::new(&[
            System::Gps,
            System::Glonass,
            System::Galileo,
            System::Beidou,
        ])
        .unwrap();
        let day = std::f64::consts::TAU / crate::forces::EARTH_ROTATION_RATE;
        let mut instants: Vec<f64> = (1..=3)
            .map(|k| EPOCH_UNIX_S + 3.0e8 + k as f64 * day)
            .collect();
        instants.extend((0..5).map(|k| 1_780_000_000.0 + k as f64 * 5000.0));
        // The wrap instants of the old model: whole sidereal days after the epoch.
        let n0 = ((1_780_000_000.0 - EPOCH_UNIX_S) / day).floor();
        instants.extend((0..3).map(|k| EPOCH_UNIX_S + (n0 + k as f64) * day));
        for t in instants {
            let (a, b, c) = (m.positions(t - 0.5), m.positions(t), m.positions(t + 0.5));
            for i in 0..a.len() {
                let d2: f64 = (0..3)
                    .map(|j| (a[i][j] + c[i][j] - 2.0 * b[i][j]).powi(2))
                    .sum::<f64>()
                    .sqrt();
                assert!(d2 < 100.0, "sat {i} at {t}: second difference {d2} m");
            }
        }
    }
}
