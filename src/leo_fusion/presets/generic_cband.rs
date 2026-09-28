// SPDX-License-Identifier: AGPL-3.0-only
//! A generic C-band LEO PNT system, for systems whose parameters are not public (for example
//! TrustPoint, which is building a C-band constellation:
//! <https://spacenews.com/trustpoint-sets-2027-target-for-initial-rollout-of-leo-based-navigation-services/>).
//!
//! **Representative.** Only the band is public: the radionavigation-satellite service (RNSS)
//! allocation at 5010 to 5030 MHz in the ITU Radio Regulations, Article 5
//! (<https://www.itu.int/pub/R-REG-RR>). The carrier sits at its centre; the chip rate, power,
//! constellation and error budget are illustrative and describe no operator's design.

use super::{LeoPreset, PresetShell, PresetSignal, PresetSource, SourceKind};

pub(super) const PRESET: LeoPreset = LeoPreset {
    id: "generic-c-band",
    name: "Generic C-band LEO PNT (representative)",
    summary: "Representative C-band LEO PNT in the 5010-5030 MHz RNSS allocation",
    sources: &[
        PresetSource {
            kind: SourceKind::Public,
            citation: "ITU Radio Regulations Article 5: RNSS allocation 5010-5030 MHz",
            url: Some("https://www.itu.int/pub/R-REG-RR"),
        },
        PresetSource {
            kind: SourceKind::Public,
            citation: "SpaceNews: TrustPoint C-band LEO PNT, service from 2027 (parameters not public)",
            url: Some("https://spacenews.com/trustpoint-sets-2027-target-for-initial-rollout-of-leo-based-navigation-services/"),
        },
    ],
    representative: &[
        "carrier 5020 MHz at the centre of the allocation",
        "BPSK at 10.23 Mchip/s",
        "received power -150 to -140 dBW",
        "constellation 300/15/1 at 600 km, 60 deg",
        "signal-in-space range error 0.5 m",
    ],
    shells: &[PresetShell { pattern: "delta", total: 300, planes: 15, phasing: 1, altitude_km: 600.0, inclination_deg: 60.0 }],
    signals: &[PresetSignal {
        name: "C",
        carrier_hz: 5_020.0e6,
        modulation: "BPSK (representative)",
        chip_rate_hz: Some(10.23e6),
        bandwidth_hz: 20.0e6,
        rx_power_dbw: Some((-150.0, -140.0)),
        cn0_dbhz: None,
    }],
    doppler_only: false,
    sigma_doppler_hz: None,
    sisre_m: 0.5,
    ephemeris_model: "representative",
    clock_model: "representative",
};
