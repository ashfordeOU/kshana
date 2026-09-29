// SPDX-License-Identifier: AGPL-3.0-only
//! A generic C-band LEO-PNT system. **REPRESENTATIVE.**
//!
//! Stands in for C-band systems whose parameters are not public (TrustPoint is one: its third
//! satellite flew in June 2025 and a receiver tracked it live in December 2025,
//! <https://www.gpsworld.com/trustpoint-novatel-demonstrate-c-band-pnt-in-gnss-denied-conditions/>;
//! a soft service launch is planned for 2027,
//! <https://spacenews.com/trustpoint-sets-2027-target-for-initial-rollout-of-leo-based-navigation-services/>).
//! Nothing below is a TrustPoint figure. The carrier sits at 5020 MHz, the centre of the
//! 5010–5030 MHz radionavigation-satellite (RNSS) allocation of the ITU Radio Regulations; the
//! signal is a BPSK(10) code of 10230 chips; the EIRP (5 dBW), isoflux pattern to 20°, orbit
//! (550 km, 53°, Walker 300/15/1) and data rate are design choices for trade studies.

use super::{BandPreset, PresetSource, ShellPreset, SourceKind, SystemPreset};
use crate::leo_link::antenna::{Polarisation, SatPattern};

/// The generic C-band preset.
pub const PRESET: SystemPreset = SystemPreset {
    id: "generic-c-band",
    name: "Generic C-band LEO-PNT (representative)",
    source: PresetSource {
        kind: SourceKind::Representative,
        citation: "Representative C-band design in the 5010-5030 MHz RNSS allocation; not any \
            operator's parameters",
        urls: &[],
    },
    shells: &[ShellPreset {
        altitude_km: 550.0,
        inclination_deg: Some(53.0),
        total: 300,
        planes: 15,
        phasing: 1,
        star: false,
    }],
    orbit_basis: "representative: Walker 300/15/1 at 550 km, 53 deg",
    bands: &[BandPreset {
        name: "C",
        centre_hz: 5_020.0e6,
        tx_bandwidth_hz: 20.0e6,
        chip_rate_hz: 10.23e6,
        code_length_chips: 10230.0,
        data_rate_bps: 500.0,
        eirp_dbw: 5.0,
        pattern: SatPattern::Isoflux {
            edge_elevation_deg: 20.0,
            rolloff_deg: 5.0,
        },
        polarisation: Polarisation::Rhcp,
        axial_ratio_db: 1.0,
        allocation: "RNSS (5010-5030 MHz)",
        ranging: true,
        basis: "carrier at the centre of the 5010-5030 MHz RNSS allocation; every other number \
            representative",
    }],
    cold_start_bits: 1000.0,
    notes: "C band: first-order ionospheric delay about 1/10 of L1, rain attenuation no longer \
        negligible in heavy rain.",
};
