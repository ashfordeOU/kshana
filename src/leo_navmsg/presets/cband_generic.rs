// SPDX-License-Identifier: AGPL-3.0-only
//! A generic C-band LEO-PNT system. REPRESENTATIVE: C-band systems such as TrustPoint do
//! not publish their signal or orbit parameters. The carrier is the centre of the
//! 5010–5030 MHz radionavigation-satellite service (RNSS) allocation in the International
//! Telecommunication Union (ITU) Radio Regulations; the orbit is a representative 600 km
//! sun-synchronous one. None of these numbers describes a real system.

use super::{Preset, SourceKind};

/// Generic C-band LEO-PNT.
pub const CBAND: Preset = Preset {
    key: "cband-generic",
    name: "Generic C-band LEO-PNT (representative)",
    source: SourceKind::Representative,
    source_urls: &[],
    altitude_km: 600.0,
    inclination_deg: 97.8,
    carrier_hz: 5_020_000_000.0,
    carrier_label: "centre of the 5010-5030 MHz RNSS allocation",
    message: None,
    notes: "Representative only: C-band LEO-PNT operators (for example TrustPoint) have \
            not published signal or orbit parameters. 600 km sun-synchronous orbit and the \
            RNSS C-band centre frequency are placeholders chosen for the trade.",
};
