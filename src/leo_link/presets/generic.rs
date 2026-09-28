// SPDX-License-Identifier: AGPL-3.0-only
//! A generic multi-band LEO-PNT system. **REPRESENTATIVE.**
//!
//! The default preset: four bands a LEO-PNT designer might consider, each carrier taken from a
//! public allocation or interface document, every power and pattern a stated design choice.
//!
//! * UHF, 450 MHz, 10 MHz wide, BPSK(5): a representative UHF carrier for indoor and
//!   low-energy use (no specific allocation claimed).
//! * L, 1191.795 MHz, BPSK(10): the Galileo E5 centre frequency (116.5 × 10.23 MHz, Galileo OS
//!   SIS ICD), the RNSS band in which receivers already exist.
//! * S, 2492.028 MHz, BPSK(5): the NavIC S-band carrier (IRNSS signal-in-space ICD for the
//!   standard positioning service), an RDSS/RNSS allocation.
//! * C, 5020 MHz, BPSK(10): the centre of the 5010–5030 MHz RNSS allocation.
//!
//! Every band radiates 0 dBW (1 W) EIRP at the peak of a nadir-pointing Gaussian beam of 110°
//! half-power beamwidth: the order of a small-satellite navigation payload, chosen as a round
//! number, not fitted to any measurement. Orbit: sun-synchronous at 550 km, Walker 240/12/1.

use super::{BandPreset, PresetSource, ShellPreset, SourceKind, SystemPreset};
use crate::leo_link::antenna::{Polarisation, SatPattern};

const BEAM: SatPattern = SatPattern::Gaussian {
    hpbw_deg: 110.0,
    floor_db: -20.0,
};

/// The generic multi-band preset.
pub const PRESET: SystemPreset = SystemPreset {
    id: "generic-leo",
    name: "Generic multi-band LEO-PNT (representative)",
    source: PresetSource {
        kind: SourceKind::Representative,
        citation: "Representative design; carriers from the Galileo OS SIS ICD (E5 centre), the \
            IRNSS SPS ICD (S band) and the ITU Radio Regulations RNSS allocation at 5010-5030 MHz",
        urls: &[
            "https://www.gsc-europa.eu/sites/default/files/sites/all/files/Galileo_OS_SIS_ICD_v2.1.pdf",
        ],
    },
    shells: &[ShellPreset {
        altitude_km: 550.0,
        inclination_deg: None,
        total: 240,
        planes: 12,
        phasing: 1,
        star: false,
    }],
    orbit_basis: "representative: sun-synchronous Walker 240/12/1 at 550 km",
    bands: &[
        BandPreset {
            name: "UHF",
            centre_hz: 450.0e6,
            tx_bandwidth_hz: 10.0e6,
            chip_rate_hz: 5.115e6,
            code_length_chips: 5115.0,
            data_rate_bps: 500.0,
            eirp_dbw: 0.0,
            pattern: BEAM,
            polarisation: Polarisation::Rhcp,
            axial_ratio_db: 1.0,
            allocation: "UHF (representative)",
            ranging: true,
            basis: "representative UHF carrier, BPSK(5), 0 dBW EIRP",
        },
        BandPreset {
            name: "L",
            centre_hz: 1_191.795e6,
            tx_bandwidth_hz: 20.46e6,
            chip_rate_hz: 10.23e6,
            code_length_chips: 10230.0,
            data_rate_bps: 500.0,
            eirp_dbw: 0.0,
            pattern: BEAM,
            polarisation: Polarisation::Rhcp,
            axial_ratio_db: 1.0,
            allocation: "RNSS",
            ranging: true,
            basis: "Galileo E5 centre frequency (public); BPSK(10) and 0 dBW EIRP representative",
        },
        BandPreset {
            name: "S",
            centre_hz: 2_492.028e6,
            tx_bandwidth_hz: 10.23e6,
            chip_rate_hz: 5.115e6,
            code_length_chips: 5115.0,
            data_rate_bps: 500.0,
            eirp_dbw: 0.0,
            pattern: BEAM,
            polarisation: Polarisation::Rhcp,
            axial_ratio_db: 1.0,
            allocation: "RDSS/RNSS",
            ranging: true,
            basis: "NavIC S-band carrier (public); BPSK(5) and 0 dBW EIRP representative",
        },
        BandPreset {
            name: "C",
            centre_hz: 5_020.0e6,
            tx_bandwidth_hz: 20.46e6,
            chip_rate_hz: 10.23e6,
            code_length_chips: 10230.0,
            data_rate_bps: 500.0,
            eirp_dbw: 0.0,
            pattern: BEAM,
            polarisation: Polarisation::Rhcp,
            axial_ratio_db: 1.0,
            allocation: "RNSS (5010-5030 MHz)",
            ranging: true,
            basis: "centre of the 5010-5030 MHz RNSS allocation; BPSK(10) and 0 dBW EIRP \
                representative",
        },
    ],
    cold_start_bits: 1000.0,
    notes: "A starting point for trade studies; override any field in the scenario.",
};
