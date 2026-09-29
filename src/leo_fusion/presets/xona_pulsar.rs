// SPDX-License-Identifier: AGPL-3.0-only
//! Xona Pulsar: a commercial LEO PNT constellation with two signals, X1 in the L1 band and
//! X5 in the L5 band.
//!
//! Source: J. Leclère, T. Marathe and T. G. R. Reid, "Insights into Xona Pulsar LEO PNT:
//! Constellation, Signals, and Receiver Design", ION GNSS+ 2025, arXiv:2509.19551
//! (<https://arxiv.org/abs/2509.19551>): carriers, modulations, chip rates, codes, data
//! rates, minimum and maximum received power, and the constellation of 258 satellites in 18
//! planes at about 1080 km with 53 and 97 deg inclinations.
//!
//! Not stated by the source and therefore representative: how the 258 satellites split
//! between the two inclinations (taken as 12 planes of 14 at 53 deg and 6 planes of 15 at
//! 97 deg), the Walker phasing, the broadcast ephemeris model and the orbit-and-clock error.

use super::{LeoPreset, PresetShell, PresetSignal, PresetSource, SourceKind};

pub(super) const PRESET: LeoPreset = LeoPreset {
    id: "xona-pulsar",
    name: "Xona Pulsar",
    summary: "Commercial LEO PNT, X1 (L1 band) and X5 (L5 band), 258 satellites at about 1080 km",
    sources: &[PresetSource {
        kind: SourceKind::Public,
        citation: "Leclère, Marathe and Reid, ION GNSS+ 2025, arXiv:2509.19551: signal table and constellation",
        url: Some("https://arxiv.org/abs/2509.19551"),
    }],
    representative: &[
        "split of the 258 satellites between 53 and 97 deg (12x14 and 6x15)",
        "Walker phasing",
        "signal-in-space range error 0.3 m",
        "broadcast ephemeris and clock model",
    ],
    shells: &[
        PresetShell { pattern: "delta", total: 168, planes: 12, phasing: 1, altitude_km: 1080.0, inclination_deg: 53.0 },
        PresetShell { pattern: "star", total: 90, planes: 6, phasing: 1, altitude_km: 1080.0, inclination_deg: 97.0 },
    ],
    signals: &[
        PresetSignal {
            name: "X1",
            carrier_hz: 1_593.322_5e6,
            modulation: "EFQPSK, small-set Kasami code of 1 ms",
            chip_rate_hz: Some(1.023e6),
            bandwidth_hz: 2.046e6,
            rx_power_dbw: Some((-148.2, -139.1)),
            cn0_dbhz: None,
        },
        PresetSignal {
            name: "X5",
            carrier_hz: 1_190.516_25e6,
            modulation: "EFQPSK with code shift keying, extended Gold code of 1 ms",
            chip_rate_hz: Some(10.23e6),
            bandwidth_hz: 20.46e6,
            rx_power_dbw: Some((-144.9, -136.2)),
            cn0_dbhz: None,
        },
    ],
    doppler_only: false,
    sigma_doppler_hz: None,
    sisre_m: 0.3,
    ephemeris_model: "not published (representative)",
    clock_model: "not published (representative)",
};
