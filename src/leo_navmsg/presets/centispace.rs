// SPDX-License-Identifier: AGPL-3.0-only
//! CentiSpace (Beijing Future Navigation Technology). PUBLIC: binary phase-shift keying
//! (BPSK) augmentation signals near 157x and 117x MHz at 2.046 Mchip/s (Performance
//! Evaluation of CentiSpace Navigation Augmentation Experiment Satellites, Sensors 2023,
//! PMC10301026); experimental satellites at about 700 km and 55° (Satellite Navigation,
//! 2026, doi 10.1186/s43020-026-00212-0). The exact carriers are masked in the source; the
//! preset uses the GPS L1 frequency as a stand-in for "near B1" and says so.

use super::{Preset, SourceKind};

/// CentiSpace experimental satellites.
pub const CENTISPACE: Preset = Preset {
    key: "centispace",
    name: "CentiSpace experimental satellites",
    source: SourceKind::Public,
    source_urls: &[
        "https://pmc.ncbi.nlm.nih.gov/articles/PMC10301026/",
        "https://link.springer.com/article/10.1186/s43020-026-00212-0",
    ],
    altitude_km: 700.0,
    inclination_deg: 55.0,
    carrier_hz: 1_575_420_000.0,
    carrier_label: "near B1 (source masks the value as 157X.XX MHz); GPS L1 used as a stand-in",
    message: None,
    notes: "Orbit about 700 km and 55 deg; BPSK at 2.046 Mchip/s near B1 and B2. The \
            broadcast-ephemeris model is not published.",
};
