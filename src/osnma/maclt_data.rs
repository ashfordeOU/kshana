// SPDX-License-Identifier: AGPL-3.0-only
//! Built-in MAC look-up table entries, source: OSNMA SIS ICD Issue 1.1, Annex C,
//! Table 16 (Technical Data), recorded here in our own compact
//! specification form read by `maclt::Entry::parse`: slots `NNS` / `NNE` (ADKD
//! number, self or cross-authentication) or `FLX`, one `|`-separated list per MACK
//! message of the cycle.

pub const BUILTIN: &[(u8, &str)] = &[
    (27, "00S,00E,00E,00E,12S,00E|00S,00E,00E,04S,12S,00E"),
    (
        28,
        "00S,00E,00E,00E,00S,00E,00E,12S,00E,00E|00S,00E,00E,00S,00E,00E,04S,12S,00E,00E",
    ),
    (31, "00S,00E,00E,12S,00E|00S,00E,00E,12S,04S"),
    (33, "00S,00E,04S,00E,12S,00E|00S,00E,00E,12S,00E,12E"),
    (34, "00S,FLX,04S,FLX,12S,00E|00S,FLX,00E,12S,00E,12E"),
    (35, "00S,FLX,04S,FLX,12S,FLX|00S,FLX,FLX,12S,FLX,FLX"),
    (36, "00S,FLX,04S,FLX,12S|00S,FLX,00E,12S,12E"),
    (37, "00S,00E,04S,00E,12S|00S,00E,00E,12S,12E"),
    (38, "00S,FLX,04S,FLX,12S|00S,FLX,FLX,12S,FLX"),
    (39, "00S,FLX,04S,FLX|00S,FLX,00E,12S"),
    (40, "00S,00E,04S,12S|00S,00E,00E,12E"),
    (41, "00S,FLX,04S,FLX|00S,FLX,FLX,12S"),
];
