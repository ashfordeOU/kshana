// SPDX-License-Identifier: AGPL-3.0-only
//! Iridium STL (satellite time and location), now Iridium PNT. **PUBLIC.**
//!
//! Source for the signal: "Recent PNT improvements and test results based on low Earth orbit
//! satellites", Resilient Navigation and Timing Foundation,
//! <https://rntfnd.org/wp-content/uploads/Recent-PNT-Improvements-and-Test-Results-Based-on-Low-Earth-Orbit-Satellites.pdf>:
//! 66 satellites transmitting at 1616–1626 MHz, QPSK at 25 000 symbol/s, PNT bursts inside one
//! 90 ms frame, Doppler up to ±36 kHz, 48 spot beams per satellite, raw power 300 to 2400 times
//! GPS. Source for the orbit: 781 km, 86.4°, six planes of eleven in a polar (star) pattern,
//! <https://en.wikipedia.org/wiki/Iridium_satellite_constellation>.
//!
//! The band is centred at 1621 MHz, the middle of the published 1616–1626 MHz allocation (the
//! actual burst channel is not published). The EIRP is derived from the published power ratio:
//! 300 times the GPS L1 C/A minimum of −158.5 dBW is −133.7 dBW, taken as the received power at
//! 10° elevation with a flat pattern, `EIRP = −133.7 + FSPL(ρ(10°), f)`. The zenith power is
//! then −124.2 dBW, next to the published upper end (2400 times, −124.7 dBW). The spot-beam
//! structure is not modelled. The burst is treated as a 25 kchip/s ranging signal with a
//! one-symbol code for the acquisition model; that is a placeholder, not the STL waveform.

use super::{BandPreset, PresetSource, ShellPreset, SourceKind, SystemPreset};
use crate::leo_link::antenna::{Polarisation, SatPattern};

/// STL EIRP (dBW): −133.7 dBW plus the free-space loss over ρ(10°) = 2327.5 km at 1621 MHz.
pub const STL_EIRP_DBW: f64 = 30.281_075;

/// The Iridium preset.
pub const PRESET: SystemPreset = SystemPreset {
    id: "iridium-stl",
    name: "Iridium STL / Iridium PNT",
    source: PresetSource {
        kind: SourceKind::Public,
        citation: "Resilient Navigation and Timing Foundation, Recent PNT Improvements and Test \
            Results Based on Low Earth Orbit Satellites; Iridium constellation orbit",
        urls: &[
            "https://rntfnd.org/wp-content/uploads/Recent-PNT-Improvements-and-Test-Results-Based-on-Low-Earth-Orbit-Satellites.pdf",
            "https://en.wikipedia.org/wiki/Iridium_satellite_constellation",
        ],
    },
    shells: &[ShellPreset {
        altitude_km: 781.0,
        inclination_deg: Some(86.4),
        total: 66,
        planes: 6,
        phasing: 2,
        star: true,
    }],
    orbit_basis: "781 km, 86.4 deg, 6 planes of 11 over 180 deg of node (public); the Walker \
        phasing F = 2 is a representative choice",
    bands: &[BandPreset {
        name: "STL",
        centre_hz: 1_621.0e6,
        tx_bandwidth_hz: 10.0e6,
        chip_rate_hz: 25.0e3,
        code_length_chips: 1.0,
        data_rate_bps: 50_000.0,
        eirp_dbw: STL_EIRP_DBW,
        pattern: SatPattern::Flat,
        polarisation: Polarisation::Rhcp,
        axial_ratio_db: 2.0,
        allocation: "MSS (1616-1626 MHz)",
        ranging: true,
        basis: "1616-1626 MHz, QPSK 25 ksym/s (public); centre frequency, bandwidth used, EIRP \
            (from the published 300x GPS power at 10 deg), flat pattern and polarisation \
            representative",
    }],
    cold_start_bits: 0.0,
    notes: "Doppler up to +/-36 kHz is published; the NIST timing tests report under 40 ns to \
        UTC(NIST) with a miniature atomic clock.",
};

#[cfg(test)]
mod tests {
    use super::super::{fspl_db, slant_range_m};
    use super::*;

    #[test]
    fn the_eirp_reproduces_three_hundred_times_the_gps_minimum_at_ten_degrees() {
        // 300 times -158.5 dBW is -133.73 dBW, rounded to -133.7 dBW in the derivation.
        let p10 = -133.7;
        assert!((p10 - (-158.5 + 10.0 * 300f64.log10())).abs() < 0.05);
        let rho = slant_range_m(781e3, 10.0);
        assert!((STL_EIRP_DBW - fspl_db(rho, 1621e6) - p10).abs() < 1e-5);
        // The zenith power sits within 0.6 dB of 2400 times the GPS minimum.
        let p_top = -158.5 + 10.0 * 2400f64.log10();
        assert!((STL_EIRP_DBW - fspl_db(781e3, 1621e6) - p_top).abs() < 0.6);
    }
}
