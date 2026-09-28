// SPDX-License-Identifier: AGPL-3.0-only
//! Starlink as a signal of opportunity (SoP): Doppler-only positioning from the Ku-band
//! downlink of a broadband constellation that broadcasts no navigation message.
//!
//! Sources:
//! * S. Kozhaya, J. Saroufim and Z. M. Kassas, "Unveiling Starlink for PNT", NAVIGATION
//!   72(1), 2025 (<https://navi.ion.org/content/72/1/navi.685>): downlink carrier 11.325 GHz,
//!   a 240 MHz orthogonal frequency-division multiplexing (OFDM) beacon in a 4/3 ms frame,
//!   C/N0 up to 57.07 dB-Hz, Doppler error about 30 Hz (one sigma) as of 2024, about 2 m
//!   three-dimensional error in 20 s with three satellites; code and carrier phase are not
//!   usable for ranging.
//! * The first shell, 1584 satellites in 72 planes of 22 at 550 km and 53 deg, as authorised
//!   in FCC 21-48 (<https://docs.fcc.gov/public/attachments/FCC-21-48A1.pdf>).
//!
//! Representative: the Walker phasing, the C/N0 at the horizon, and the range-rate error of
//! the ephemeris a receiver builds from public two-line elements.

use super::{LeoPreset, PresetShell, PresetSignal, PresetSource, SourceKind};

pub(super) const PRESET: LeoPreset = LeoPreset {
    id: "starlink-sop",
    name: "Starlink signals of opportunity",
    summary: "Doppler-only positioning from the Ku-band OFDM beacon of a 1584-satellite shell at 550 km",
    sources: &[
        PresetSource {
            kind: SourceKind::Public,
            citation: "Kozhaya, Saroufim and Kassas, NAVIGATION 72(1) 2025: carrier, beacon, C/N0, Doppler error",
            url: Some("https://navi.ion.org/content/72/1/navi.685"),
        },
        PresetSource {
            kind: SourceKind::Public,
            citation: "FCC 21-48: first shell of 1584 satellites, 72 planes of 22, 550 km, 53 deg",
            url: Some("https://docs.fcc.gov/public/attachments/FCC-21-48A1.pdf"),
        },
    ],
    representative: &[
        "Walker phasing",
        "C/N0 of 45 dB-Hz at the horizon",
        "ephemeris range-rate error folded into the 30 Hz Doppler sigma",
    ],
    shells: &[PresetShell { pattern: "delta", total: 1584, planes: 72, phasing: 17, altitude_km: 550.0, inclination_deg: 53.0 }],
    signals: &[PresetSignal {
        name: "Ku-beacon",
        carrier_hz: 11.325e9,
        modulation: "OFDM beacon, 240 MHz, 4/3 ms frame",
        chip_rate_hz: None,
        bandwidth_hz: 240.0e6,
        rx_power_dbw: None,
        cn0_dbhz: Some((45.0, 57.07)),
    }],
    doppler_only: true,
    sigma_doppler_hz: Some(30.0),
    sisre_m: 1000.0,
    ephemeris_model: "none broadcast; public two-line elements with SGP4",
    clock_model: "none broadcast; the satellite oscillator offset is absorbed in the Doppler error",
};
