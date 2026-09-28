// SPDX-License-Identifier: AGPL-3.0-only
//! Iridium satellite time and location (STL), marketed as Iridium PNT: bursts in the Iridium
//! L band from the 66-satellite constellation.
//!
//! Sources:
//! * Resilient Navigation and Timing Foundation, "Recent PNT improvements and test results
//!   based on low Earth orbit satellites"
//!   (<https://rntfnd.org/wp-content/uploads/Recent-PNT-Improvements-and-Test-Results-Based-on-Low-Earth-Orbit-Satellites.pdf>):
//!   66 satellites, 1616 to 1626 MHz, QPSK at 25 000 symbol/s, bursts in one 90 ms frame,
//!   Doppler up to ±36 kHz, raw power 300 to 2400 times GPS.
//! * NIST, "Validating timing performance improvement with ionospheric corrections for
//!   Iridium PNT receivers"
//!   (<https://www.nist.gov/publications/validating-timing-performance-improvement-ionospheric-corrections-iridium-pnt-receivers>):
//!   with a miniature atomic clock, offset from UTC(NIST) under 40 ns and time-interval error
//!   under 80 ns over 40 days (a comparison figure for the timing model, not an input).
//! * The constellation geometry, six near-polar planes of 11 at 780 km and 86.4 deg:
//!   <https://en.wikipedia.org/wiki/Iridium_satellite_constellation>.
//!
//! Derived: the received power is 300 to 2400 times the GPS L1 C/A minimum of −158.5 dBW
//! (IS-GPS-200), that is −133.7 to −124.7 dBW. Representative: the carrier at the band centre,
//! the ranging bandwidth of one QPSK burst, and the orbit-and-clock error.

use super::{LeoPreset, PresetShell, PresetSignal, PresetSource, SourceKind};

pub(super) const PRESET: LeoPreset = LeoPreset {
    id: "iridium-stl",
    name: "Iridium STL (Iridium PNT)",
    summary: "66 satellites at 780 km, L-band bursts at 1616-1626 MHz with Doppler up to 36 kHz",
    sources: &[
        PresetSource {
            kind: SourceKind::Public,
            citation: "RNTF, Recent PNT improvements and test results based on LEO satellites: band, symbol rate, Doppler, power",
            url: Some("https://rntfnd.org/wp-content/uploads/Recent-PNT-Improvements-and-Test-Results-Based-on-Low-Earth-Orbit-Satellites.pdf"),
        },
        PresetSource {
            kind: SourceKind::Public,
            citation: "NIST, timing performance of Iridium PNT receivers: under 40 ns from UTC(NIST) with a miniature atomic clock",
            url: Some("https://www.nist.gov/publications/validating-timing-performance-improvement-ionospheric-corrections-iridium-pnt-receivers"),
        },
        PresetSource {
            kind: SourceKind::Public,
            citation: "Iridium constellation geometry: 6 planes of 11 at 780 km, 86.4 deg",
            url: Some("https://en.wikipedia.org/wiki/Iridium_satellite_constellation"),
        },
        PresetSource {
            kind: SourceKind::Derived,
            citation: "received power: 300 to 2400 times the IS-GPS-200 L1 C/A minimum of -158.5 dBW, i.e. -133.7 to -124.7 dBW",
            url: None,
        },
    ],
    representative: &[
        "carrier 1621 MHz, the centre of 1616-1626 MHz",
        "ranging bandwidth 31.5 kHz of one QPSK burst",
        "signal-in-space range error 5 m",
        "Walker phasing",
    ],
    shells: &[PresetShell { pattern: "star", total: 66, planes: 6, phasing: 2, altitude_km: 780.0, inclination_deg: 86.4 }],
    signals: &[PresetSignal {
        name: "STL",
        carrier_hz: 1_621.0e6,
        modulation: "QPSK bursts at 25 000 symbol/s in one 90 ms frame",
        chip_rate_hz: Some(25.0e3),
        bandwidth_hz: 31.5e3,
        rx_power_dbw: Some((-133.7, -124.7)),
        cn0_dbhz: None,
    }],
    doppler_only: false,
    sigma_doppler_hz: None,
    sisre_m: 5.0,
    ephemeris_model: "proprietary (representative)",
    clock_model: "proprietary (representative)",
};
