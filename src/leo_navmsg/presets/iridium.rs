// SPDX-License-Identifier: AGPL-3.0-only
//! Iridium satellite time and location (STL) / Iridium PNT. PUBLIC: 66 satellites
//! transmitting PNT bursts at 1616–1626 MHz, Doppler up to ±36 kHz (Resilient Navigation
//! and Timing Foundation (RNTF) report); orbit about 781 km at 86.4° (public constellation
//! description). Iridium broadcasts no Galileo-style navigation message; the preset gives
//! the orbit and carrier so the fitter shows what such a message would need.

use super::{Preset, SourceKind};

/// Iridium STL / PNT.
pub const IRIDIUM: Preset = Preset {
    key: "iridium",
    name: "Iridium STL / PNT",
    source: SourceKind::Public,
    source_urls: &[
        "https://rntfnd.org/wp-content/uploads/Recent-PNT-Improvements-and-Test-Results-Based-on-Low-Earth-Orbit-Satellites.pdf",
        "https://en.wikipedia.org/wiki/Iridium_satellite_constellation",
    ],
    altitude_km: 781.0,
    inclination_deg: 86.4,
    carrier_hz: 1_621_000_000.0,
    carrier_label: "centre of the 1616-1626 MHz Iridium band",
    message: None,
    notes: "The PNT burst format is proprietary; only the band, the Doppler envelope and \
            the orbit are used.",
};
