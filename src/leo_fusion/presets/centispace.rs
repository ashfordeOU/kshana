// SPDX-License-Identifier: AGPL-3.0-only
//! CentiSpace (Beijing Future Navigation Technology): LEO navigation augmentation with BPSK
//! signals near the GNSS L1 and L5 bands.
//!
//! Sources:
//! * "Initial assessment of the LEO-based navigation augmentation system CentiSpace"
//!   (<https://pmc.ncbi.nlm.nih.gov/articles/PMC10301026/>): four experimental satellites
//!   launched September to December 2022, BPSK signals near 157x and 117x MHz at 2.046 Mchip/s,
//!   orbit determination of 0.89 cm radial, 2.35 cm along-track and 1.26 cm cross-track.
//! * GPS Solutions, doi 10.1007/s10291-023-01589-0 (<https://dl.acm.org/doi/10.1007/s10291-023-01589-0>):
//!   adding two CentiSpace satellites cut PPP convergence to 10 cm from 14.2 to 5.7 min (a
//!   comparison figure, not an input).
//!
//! Representative: the carriers (placed on 1575.42 and 1176.45 MHz, "near 157x and 117x MHz"
//! in the source), the received power, the clock part of the range error, and the whole
//! operational constellation (an illustrative 120/12/1 at 975 km and 55 deg: the operator's
//! planned constellation is not asserted here).

use super::{LeoPreset, PresetShell, PresetSignal, PresetSource, SourceKind};

pub(super) const PRESET: LeoPreset = LeoPreset {
    id: "centispace",
    name: "CentiSpace",
    summary: "LEO augmentation, BPSK at 2.046 Mchip/s near L1 and L5, centimetre orbit determination",
    sources: &[
        PresetSource {
            kind: SourceKind::Public,
            citation: "Initial assessment of CentiSpace: satellites, signals, orbit determination accuracy",
            url: Some("https://pmc.ncbi.nlm.nih.gov/articles/PMC10301026/"),
        },
        PresetSource {
            kind: SourceKind::Public,
            citation: "GPS Solutions 10.1007/s10291-023-01589-0: PPP convergence 14.2 to 5.7 min with two satellites",
            url: Some("https://dl.acm.org/doi/10.1007/s10291-023-01589-0"),
        },
    ],
    representative: &[
        "carriers 1575.42 and 1176.45 MHz",
        "received power -150 to -140 dBW",
        "signal-in-space range error 0.05 m (orbit 1 cm from the source plus a clock term)",
        "the operational constellation, 120/12/1 at 975 km, 55 deg",
    ],
    shells: &[PresetShell { pattern: "delta", total: 120, planes: 12, phasing: 1, altitude_km: 975.0, inclination_deg: 55.0 }],
    signals: &[
        PresetSignal {
            name: "L1",
            carrier_hz: 1_575.42e6,
            modulation: "BPSK, 2.046 Mchip/s",
            chip_rate_hz: Some(2.046e6),
            bandwidth_hz: 4.092e6,
            rx_power_dbw: Some((-150.0, -140.0)),
            cn0_dbhz: None,
        },
        PresetSignal {
            name: "L5",
            carrier_hz: 1_176.45e6,
            modulation: "BPSK, 2.046 Mchip/s",
            chip_rate_hz: Some(2.046e6),
            bandwidth_hz: 4.092e6,
            rx_power_dbw: Some((-150.0, -140.0)),
            cn0_dbhz: None,
        },
    ],
    doppler_only: false,
    sigma_doppler_hz: None,
    sisre_m: 0.05,
    ephemeris_model: "not published (representative)",
    clock_model: "not published (representative)",
};
