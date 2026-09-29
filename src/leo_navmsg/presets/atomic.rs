// SPDX-License-Identifier: AGPL-3.0-only
//! The ATOMIC "zero-clock" polynomial ephemeris. PUBLIC: InsideGNSS, "First steps toward
//! a fully operational LEO-PNT payload": the on-board ephemeris is a 6th-order polynomial
//! valid for about one minute and refreshed every 30 s; the chip-scale atomic clock is
//! steered to GNSS time, so the message carries no clock terms; clock error 24 cm (1 sigma).
//! The orbit is not stated in that source; a representative 500 km sun-synchronous orbit
//! is used, and labelled so.

use super::{MessageDefaults, Preset, SourceKind};

/// ATOMIC zero-clock polynomial model.
pub const ATOMIC: Preset = Preset {
    key: "atomic",
    name: "ATOMIC zero-clock polynomial ephemeris",
    source: SourceKind::Public,
    source_urls: &[
        "https://insidegnss.com/first-steps-toward-a-fully-operational-leo-pnt-payload/",
    ],
    altitude_km: 500.0,
    inclination_deg: 97.4,
    carrier_hz: 1_575_420_000.0,
    carrier_label: "L1 (representative; the carrier is not the subject of this preset)",
    message: Some(MessageDefaults {
        model: "ecef-poly",
        rac_degrees: [0, 0, 0],
        poly_degree: 6,
        fit_interval_s: 60.0,
        update_period_s: 30.0,
        zero_clock: true,
        steered_sigma_m: 0.24,
    }),
    notes: "Model, validity, refresh and the 24 cm clock figure from InsideGNSS; the \
            500 km orbit is representative.",
};
