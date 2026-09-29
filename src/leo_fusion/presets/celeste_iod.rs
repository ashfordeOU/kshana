// SPDX-License-Identifier: AGPL-3.0-only
//! ESA Celeste in-orbit demonstration (IOD), satellites IOD-1 and IOD-2: one preset of a
//! parameterised signal design, never "the Celeste signal". The IOD signals are a vehicle for
//! experiments; the later Celeste In-Orbit Pathfinder and an EU LEO PNT system will have their
//! own designs.
//!
//! **This file holds every workshop-derived number in the engine.** Together with
//! `scenarios/celeste-iod-fused-pvt.toml` it can be deleted to publish without them (see the
//! module documentation of `presets`).
//!
//! Public sources:
//! * ESA, Celeste IOD facts and figures
//!   (<https://www.esa.int/Applications/Satellite_navigation/Celeste/Celeste_IOD_-_Facts_and_figures>):
//!   the IOD mission, L-band and S-band on IOD-1 and IOD-2.
//! * ION GNSS+ 2026 abstract 16907 (<https://www.ion.org/gnss/abstracts.cfm?paperID=16907>) and
//!   the Thales Alenia Space press release
//!   (<https://www.thalesaleniaspace.com/en/press-releases/iod-2-satellite-built-thales-alenia-space-esas-celeste-mission-lifted-today-new>):
//!   a 510 km near-polar sun-synchronous orbit; signals synchronised to GNSS time.
//!
//! Workshop (presented at the ESA NAVISP LEO-PNT workshop, 2026): the E5 signal of
//! configuration #1 (classical pilot), the MSS S-band signal for 5G NTN terminals, the pass
//! C/N0 range, and the navigation message content (Galileo-style Keplerian ephemeris with
//! along-track, cross-track and radial corrections, a second-order time-of-transmission
//! polynomial, and the system-time-to-UTC offset).
//!
//! Derived: the sun-synchronous inclination at 510 km, 97.44 deg, from the J2 node rate.
//! Representative: the along-track separation of the two satellites (half an orbit, Walker 2/1/0) and
//! the orbit-and-clock error.

use super::{LeoPreset, PresetShell, PresetSignal, PresetSource, SourceKind};

pub(super) const PRESET: LeoPreset = LeoPreset {
    id: "celeste-iod",
    name: "ESA Celeste IOD-1/IOD-2, configuration #1 (classical pilot)",
    summary: "Two IOD satellites at 510 km sun-synchronous; E5 pilot BPSK(10) and an MSS S-band 5G NTN channel",
    sources: &[
        PresetSource {
            kind: SourceKind::Public,
            citation: "ESA Celeste IOD facts and figures: mission, L- and S-band on IOD-1/IOD-2",
            url: Some("https://www.esa.int/Applications/Satellite_navigation/Celeste/Celeste_IOD_-_Facts_and_figures"),
        },
        PresetSource {
            kind: SourceKind::Public,
            citation: "ION GNSS+ 2026 abstract 16907: 510 km near-polar sun-synchronous orbit, signals synchronised to GNSS time",
            url: Some("https://www.ion.org/gnss/abstracts.cfm?paperID=16907"),
        },
        PresetSource {
            kind: SourceKind::Workshop,
            citation: "Presented at the ESA NAVISP LEO-PNT workshop, 2026: E5 1191.795 MHz, 51.15 MHz, pilot BPSK(10); SM 2170.00 MHz MSS, 0.2 and 5 MHz; pass C/N0 about 41 to 57.5 dB-Hz; message with system-time-to-UTC offset",
            url: None,
        },
        PresetSource {
            kind: SourceKind::Derived,
            citation: "sun-synchronous inclination at 510 km from the J2 node rate: 97.44 deg",
            url: None,
        },
    ],
    representative: &[
        "two satellites half an orbit apart in one plane (Walker 2/1/0)",
        "signal-in-space range error 0.5 m",
    ],
    shells: &[PresetShell { pattern: "delta", total: 2, planes: 1, phasing: 0, altitude_km: 510.0, inclination_deg: 97.44 }],
    signals: &[
        PresetSignal {
            name: "E5",
            carrier_hz: 1_191.795e6,
            modulation: "pilot BPSK(10); data BPSK(1) or BPSK(10)",
            chip_rate_hz: Some(10.23e6),
            bandwidth_hz: 51.15e6,
            rx_power_dbw: None,
            cn0_dbhz: Some((41.0, 57.5)),
        },
        PresetSignal {
            name: "SM-5MHz",
            carrier_hz: 2_170.0e6,
            modulation: "5G NR NTN downlink positioning reference signal, 5 MHz",
            chip_rate_hz: None,
            bandwidth_hz: 5.0e6,
            rx_power_dbw: None,
            cn0_dbhz: Some((41.0, 57.5)),
        },
        PresetSignal {
            name: "SM-200kHz",
            carrier_hz: 2_170.0e6,
            modulation: "narrowband positioning reference signal, 0.2 MHz",
            chip_rate_hz: None,
            bandwidth_hz: 0.2e6,
            rx_power_dbw: None,
            cn0_dbhz: Some((41.0, 57.5)),
        },
    ],
    doppler_only: false,
    sigma_doppler_hz: None,
    sisre_m: 0.5,
    ephemeris_model: "Galileo-style Keplerian set with along-track, cross-track and radial correction polynomials",
    clock_model: "second-order time-of-transmission polynomial relative to GNSS time; system-time-to-UTC offset broadcast",
};
