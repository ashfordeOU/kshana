// SPDX-License-Identifier: AGPL-3.0-only
//! Starlink downlink as a signal of opportunity: Doppler-only. **PUBLIC** signal figures,
//! **REPRESENTATIVE** orbit and EIRP.
//!
//! Source: Kozhaya, Saroufim and Kassas, NAVIGATION 72(1), 2025,
//! <https://navi.ion.org/content/72/1/navi.685>:
//! a 4/3 ms frame carrying a 240 MHz OFDM (orthogonal frequency-division multiplexing) beacon,
//! C/N0 near 57 dB-Hz, Doppler error sigma near 30 Hz, 2 m three-dimensional error in 20 s with
//! three satellites; code phase and carrier phase are not usable for ranging.
//!
//! Representative choices, not published by that source: the Ku-band channel centre
//! 11.325 GHz inside the 10.7–12.7 GHz downlink, one shell at 550 km and 53° (72 planes of 22),
//! and an EIRP set so that a zenith pass delivers about 57 dB-Hz into a 0 dBi antenna with a
//! 270 K system temperature and 1 dB implementation loss: 57 + 168.3 (free-space loss) − 204.3
//! (noise density) + 1 = 22 dBW. The link carries no ranging code: reports mark it Doppler-only.

use super::{BandPreset, PresetSource, ShellPreset, SourceKind, SystemPreset};
use crate::leo_link::antenna::{Polarisation, SatPattern};

/// The Starlink preset.
pub const PRESET: SystemPreset = SystemPreset {
    id: "starlink-soop",
    name: "Starlink downlink (signal of opportunity)",
    source: PresetSource {
        kind: SourceKind::Public,
        citation: "Kozhaya, Saroufim and Kassas, NAVIGATION 72(1), 2025 (navi.685); orbit and \
            EIRP representative",
        urls: &["https://navi.ion.org/content/72/1/navi.685"],
    },
    shells: &[ShellPreset {
        altitude_km: 550.0,
        inclination_deg: Some(53.0),
        total: 1584,
        planes: 72,
        phasing: 1,
        star: false,
    }],
    orbit_basis: "representative: one 550 km, 53 deg shell of 72 planes x 22",
    bands: &[BandPreset {
        name: "Ku-beacon",
        centre_hz: 11.325e9,
        tx_bandwidth_hz: 240.0e6,
        chip_rate_hz: 240.0e6,
        code_length_chips: 1.0,
        data_rate_bps: 0.0,
        eirp_dbw: 22.0,
        pattern: SatPattern::Flat,
        polarisation: Polarisation::Rhcp,
        axial_ratio_db: 1.0,
        allocation: "FSS downlink (10.7-12.7 GHz)",
        ranging: false,
        basis: "240 MHz beacon and the ~57 dB-Hz C/N0 are published (navi.685); the channel \
            centre and the EIRP that reproduces that C/N0 at the zenith are representative",
    }],
    cold_start_bits: 0.0,
    notes: "Doppler positioning only; no navigation message, no ranging code.",
};
