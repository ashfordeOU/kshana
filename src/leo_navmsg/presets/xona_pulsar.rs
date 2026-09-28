// SPDX-License-Identifier: AGPL-3.0-only
//! Xona Space Systems Pulsar. PUBLIC: Leclère, Marathe and Reid, ION GNSS+ 2025,
//! arXiv 2509.19551 (constellation of 258 satellites in 18 planes at about 1080 km, 53° and
//! 97° inclinations; X1 carrier 1593.3225 MHz; Pulsar-0 demonstrator at about 520 km, 97°).
//! The Pulsar broadcast-ephemeris model is not published, so no message model is set.

use super::{Preset, SourceKind};

/// The operational Pulsar shell (53° planes).
pub const PULSAR: Preset = Preset {
    key: "xona-pulsar",
    name: "Xona Pulsar (operational shell, 53 deg planes)",
    source: SourceKind::Public,
    source_urls: &["https://arxiv.org/abs/2509.19551"],
    altitude_km: 1080.0,
    inclination_deg: 53.0,
    carrier_hz: 1_593_322_500.0,
    carrier_label: "X1 (L1 band), 1593.3225 MHz",
    message: None,
    notes: "Orbit and carrier from arXiv 2509.19551; the broadcast-ephemeris model and \
            update rate are not published, so the scenario's message settings apply.",
};

/// The Pulsar-0 demonstrator.
pub const PULSAR_0: Preset = Preset {
    key: "xona-pulsar-0",
    name: "Xona Pulsar-0 demonstrator",
    source: SourceKind::Public,
    source_urls: &["https://arxiv.org/abs/2509.19551"],
    altitude_km: 520.0,
    inclination_deg: 97.0,
    carrier_hz: 1_593_322_500.0,
    carrier_label: "X1 (L1 band), 1593.3225 MHz",
    message: None,
    notes: "Launched 23 June 2025 into a 97 deg, about 520 km orbit (arXiv 2509.19551).",
};
