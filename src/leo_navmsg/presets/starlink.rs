// SPDX-License-Identifier: AGPL-3.0-only
//! Starlink signals of opportunity. PUBLIC: Kozhaya, Saroufim and Kassas, NAVIGATION
//! 72(1), 2025 (Doppler-only positioning on the 240 MHz orthogonal frequency-division
//! multiplexing (OFDM) beacon, carrier-to-noise density ratio (C/N0) about 57 dB-Hz); the
//! main shell is at about 550 km and 53° (public constellation description). Starlink
//! broadcasts no navigation message: users take orbits from two-line element sets. The
//! preset lets the fitter show what a broadcast message for such an orbit would cost.

use super::{Preset, SourceKind};

/// Starlink main shell as a signal of opportunity.
pub const STARLINK: Preset = Preset {
    key: "starlink",
    name: "Starlink signals of opportunity (main shell)",
    source: SourceKind::Public,
    source_urls: &[
        "https://navi.ion.org/content/72/1/navi.685",
        "https://en.wikipedia.org/wiki/Starlink",
    ],
    altitude_km: 550.0,
    inclination_deg: 53.0,
    carrier_hz: 11_700_000_000.0,
    carrier_label: "Ku-band downlink, 10.7-12.7 GHz (mid-band value, representative)",
    message: None,
    notes: "No navigation message exists; Doppler-only use. The Ku-band carrier is the \
            mid-band value, representative only.",
};
