// SPDX-License-Identifier: AGPL-3.0-only
//! MEO (medium Earth orbit) GNSS signals for the LEO-versus-GNSS comparison. **PUBLIC.**
//!
//! The received-power envelope is what the interface documents specify, at the output of an
//! ideally matched 0 dBi right-hand circular antenna:
//!
//! * Galileo: Galileo OS SIS ICD Issue 2.1 (November 2023), Table 12, for elevations above 5°:
//!   E1 (E1-B+C) −157.25 dBW minimum, −152 dBW maximum; E5a, E5b and E6-B/C −155.25 dBW
//!   minimum, −150 dBW maximum.
//!   <https://www.gsc-europa.eu/sites/default/files/sites/all/files/Galileo_OS_SIS_ICD_v2.1.pdf>
//! * GPS: L1 C/A −158.5 to −153.0 dBW and L5 −154.0 to −150.0 dBW, as tabulated from IS-GPS-200
//!   and IS-GPS-705 in arXiv 2509.19551 Table 2 (minimum for elevations of 5° or more).
//!
//! The orbits come from the published constellation presets of [`crate::constellation`]
//! (Galileo OS SDD reference constellation, GPS SPS PS slot table, BeiDou and GLONASS).

use crate::leo_link::antenna::Polarisation;

/// One MEO GNSS signal.
#[derive(Clone, Copy, Debug)]
pub struct GnssBand {
    /// Constellation preset name in [`crate::constellation`].
    pub constellation: &'static str,
    /// Signal name.
    pub name: &'static str,
    /// Carrier (Hz).
    pub centre_hz: f64,
    /// Specified minimum received power (dBW).
    pub min_power_dbw: f64,
    /// Specified maximum received power (dBW).
    pub max_power_dbw: f64,
    /// Elevation at and above which the minimum applies (deg).
    pub min_power_elevation_deg: f64,
    /// Chip rate (chip/s).
    pub chip_rate_hz: f64,
    /// Primary code length (chips).
    pub code_length_chips: f64,
    /// Data rate (bit/s).
    pub data_rate_bps: f64,
    /// Transmit polarisation.
    pub polarisation: Polarisation,
    /// Source.
    pub source: &'static str,
}

const GAL: &str = "Galileo OS SIS ICD Issue 2.1 (2023), Table 12";
const GPS: &str = "IS-GPS-200 / IS-GPS-705 via arXiv 2509.19551 Table 2";

/// Every MEO GNSS signal the comparison can use.
pub const GNSS_BANDS: &[GnssBand] = &[
    GnssBand {
        constellation: "galileo",
        name: "E1",
        centre_hz: 1_575.42e6,
        min_power_dbw: -157.25,
        max_power_dbw: -152.0,
        min_power_elevation_deg: 5.0,
        chip_rate_hz: 1.023e6,
        code_length_chips: 4092.0,
        data_rate_bps: 125.0,
        polarisation: Polarisation::Rhcp,
        source: GAL,
    },
    GnssBand {
        constellation: "galileo",
        name: "E5a",
        centre_hz: 1_176.45e6,
        min_power_dbw: -155.25,
        max_power_dbw: -150.0,
        min_power_elevation_deg: 5.0,
        chip_rate_hz: 10.23e6,
        code_length_chips: 10230.0,
        data_rate_bps: 25.0,
        polarisation: Polarisation::Rhcp,
        source: GAL,
    },
    GnssBand {
        constellation: "galileo",
        name: "E5b",
        centre_hz: 1_207.14e6,
        min_power_dbw: -155.25,
        max_power_dbw: -150.0,
        min_power_elevation_deg: 5.0,
        chip_rate_hz: 10.23e6,
        code_length_chips: 10230.0,
        data_rate_bps: 125.0,
        polarisation: Polarisation::Rhcp,
        source: GAL,
    },
    GnssBand {
        constellation: "galileo",
        name: "E6",
        centre_hz: 1_278.75e6,
        min_power_dbw: -155.25,
        max_power_dbw: -150.0,
        min_power_elevation_deg: 5.0,
        chip_rate_hz: 5.115e6,
        code_length_chips: 5115.0,
        data_rate_bps: 500.0,
        polarisation: Polarisation::Rhcp,
        source: GAL,
    },
    GnssBand {
        constellation: "gps-baseline",
        name: "L1",
        centre_hz: 1_575.42e6,
        min_power_dbw: -158.5,
        max_power_dbw: -153.0,
        min_power_elevation_deg: 5.0,
        chip_rate_hz: 1.023e6,
        code_length_chips: 1023.0,
        data_rate_bps: 50.0,
        polarisation: Polarisation::Rhcp,
        source: GPS,
    },
    GnssBand {
        constellation: "gps-baseline",
        name: "L5",
        centre_hz: 1_176.45e6,
        min_power_dbw: -154.0,
        max_power_dbw: -150.0,
        min_power_elevation_deg: 5.0,
        chip_rate_hz: 10.23e6,
        code_length_chips: 10230.0,
        data_rate_bps: 50.0,
        polarisation: Polarisation::Rhcp,
        source: GPS,
    },
];

/// A MEO GNSS signal by constellation family (`galileo` or `gps`) and name.
pub fn gnss_band(constellation: &str, name: &str) -> Option<&'static GnssBand> {
    let fam = |c: &str| c.split('-').next().unwrap_or(c).to_ascii_lowercase();
    GNSS_BANDS
        .iter()
        .find(|b| fam(b.constellation) == fam(constellation) && b.name.eq_ignore_ascii_case(name))
}

/// Time a cold start spends demodulating the broadcast ephemeris and clock (s): about 30 s,
/// the length of a Galileo I/NAV sub-frame and of a GPS LNAV frame (30 s at 50 bit/s). A
/// representative figure for the IoT model, not a guaranteed decode time.
pub const GNSS_COLD_START_S: f64 = 30.0;
