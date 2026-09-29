// SPDX-License-Identifier: AGPL-3.0-only
//! The ATOMIC "zero-clock" ephemeris model: an ephemeris-and-clock model, not a constellation.
//!
//! Source: InsideGNSS, "First steps toward a fully operational LEO-PNT payload"
//! (<https://insidegnss.com/first-steps-toward-a-fully-operational-leo-pnt-payload/>): the
//! on-board ephemeris is a sixth-order polynomial valid for about one minute and refreshed
//! every 30 s; the chip-scale atomic clock (a Microsemi SA.45s) is steered to GNSS time, so
//! the message carries no clock terms; orbit error under 10 cm (one sigma) per axis, clock
//! error 24 cm (one sigma) with peaks up to 1 m, so timing dominates the range error.
//!
//! Derived: the signal-in-space range error from a 10 cm radial orbit error and a 24 cm clock
//! error, sqrt(0.10² + 0.24²) = 0.26 m. Combine with any constellation preset or shell list
//! through a system's `ephemeris_preset` field.

use super::{LeoPreset, PresetSource, SourceKind};

pub(super) const PRESET: LeoPreset = LeoPreset {
    id: "atomic-zero-clock",
    name: "ATOMIC zero-clock polynomial ephemeris",
    summary: "Sixth-order polynomial ephemeris, 30 s refresh, clock steered to GNSS time (no clock terms)",
    sources: &[
        PresetSource {
            kind: SourceKind::Public,
            citation: "InsideGNSS, First steps toward a fully operational LEO-PNT payload: polynomial ephemeris, zero-clock, error figures",
            url: Some("https://insidegnss.com/first-steps-toward-a-fully-operational-leo-pnt-payload/"),
        },
        PresetSource {
            kind: SourceKind::Derived,
            citation: "SISRE sqrt(0.10^2 + 0.24^2) = 0.26 m from the stated radial orbit and clock errors",
            url: None,
        },
    ],
    representative: &[],
    shells: &[],
    signals: &[],
    doppler_only: false,
    sigma_doppler_hz: None,
    sisre_m: 0.26,
    ephemeris_model: "sixth-order polynomial per axis, about 60 s validity, refreshed every 30 s",
    clock_model: "zero-clock: satellite clock steered to GNSS time, no broadcast clock terms",
};
