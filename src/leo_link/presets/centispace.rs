// SPDX-License-Identifier: AGPL-3.0-only
//! CentiSpace (Beijing Future Navigation Technology) LEO navigation augmentation signals.
//! **PUBLIC** signal structure, **REPRESENTATIVE** orbit and EIRP.
//!
//! Source: <https://pmc.ncbi.nlm.nih.gov/articles/PMC10301026/>: four experimental satellites
//! launched September to December 2022, BPSK augmentation signals near 157x MHz and 117x MHz at
//! 2.046 Mchip/s; orbit determination 0.89 cm radial, 2.35 cm along-track, 1.26 cm cross-track.
//! Adding two satellites cut the time to converge to 10 cm from 14.2 to 5.7 min
//! (<https://dl.acm.org/doi/10.1007/s10291-023-01589-0>).
//!
//! The carriers are placed at the GPS L1 and L5 centres (1575.42 and 1176.45 MHz) as
//! representatives of "near 157x and 117x MHz"; the orbit (1000 km, 55°) and the EIRP (5 dBW)
//! are representative choices.

use super::{BandPreset, PresetSource, ShellPreset, SourceKind, SystemPreset};
use crate::leo_link::antenna::{Polarisation, SatPattern};

const BASIS: &str = "BPSK at 2.046 Mchip/s near 157x/117x MHz (public, PMC10301026); exact \
    carrier, code length, data rate, EIRP and pattern representative";

/// The CentiSpace preset.
pub const PRESET: SystemPreset = SystemPreset {
    id: "centispace",
    name: "CentiSpace LEO augmentation",
    source: PresetSource {
        kind: SourceKind::Public,
        citation: "CentiSpace experimental satellites (PMC10301026) and their PPP convergence \
            (doi 10.1007/s10291-023-01589-0); orbit and EIRP representative",
        urls: &[
            "https://pmc.ncbi.nlm.nih.gov/articles/PMC10301026/",
            "https://dl.acm.org/doi/10.1007/s10291-023-01589-0",
        ],
    },
    shells: &[ShellPreset {
        altitude_km: 1000.0,
        inclination_deg: Some(55.0),
        total: 4,
        planes: 2,
        phasing: 1,
        star: false,
    }],
    orbit_basis: "representative: four satellites at 1000 km, 55 deg in two planes",
    bands: &[
        BandPreset {
            name: "L1",
            centre_hz: 1_575.42e6,
            tx_bandwidth_hz: 4.092e6,
            chip_rate_hz: 2.046e6,
            code_length_chips: 2046.0,
            data_rate_bps: 500.0,
            eirp_dbw: 5.0,
            pattern: SatPattern::Gaussian {
                hpbw_deg: 120.0,
                floor_db: -20.0,
            },
            polarisation: Polarisation::Rhcp,
            axial_ratio_db: 1.0,
            allocation: "RNSS (L1 band)",
            ranging: true,
            basis: BASIS,
        },
        BandPreset {
            name: "L5",
            centre_hz: 1_176.45e6,
            tx_bandwidth_hz: 4.092e6,
            chip_rate_hz: 2.046e6,
            code_length_chips: 2046.0,
            data_rate_bps: 500.0,
            eirp_dbw: 5.0,
            pattern: SatPattern::Gaussian {
                hpbw_deg: 120.0,
                floor_db: -20.0,
            },
            polarisation: Polarisation::Rhcp,
            axial_ratio_db: 1.0,
            allocation: "RNSS (L5 band)",
            ranging: true,
            basis: BASIS,
        },
    ],
    cold_start_bits: 1500.0,
    notes: "Augmentation of GNSS precise point positioning (PPP); the message model is not \
        represented here.",
};
