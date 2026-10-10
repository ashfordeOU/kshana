// SPDX-License-Identifier: AGPL-3.0-only
//! Galileo OSNMA receiver-side verifier (SIS ICD Issue 1.1, Receiver Guidelines
//! Issue 1.3; see `docs/OSNMA.md`).
//!
//! This module holds the cryptography-free layer: bit-level access to I/NAV
//! pages, the 40-bit OSNMA field, the HKROOT and MACK sections, and their
//! per-subframe assembly. Nothing here transmits or forges data; it only reads.

pub mod bits;
pub mod cli;
pub mod dsm;
pub mod input;
pub mod mac;
pub mod maclt;
pub mod maclt_data;
pub mod merkle;
pub mod navdata;
pub mod page;
pub mod signature;
pub mod subframe;
pub mod tables;
pub mod tesla;
pub mod ubx;
pub mod verifier;

pub use page::{InavPage, PageError, PAGE_BITS};
pub use subframe::{DsmHeader, MackLayout, NmaHeader, Subframe, SubframeAssembler};

/// Per-satellite outcome in the form the receiver-trust monitor consumes.
#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub enum OsnmaStatus {
    Authenticated,
    Failed,
    Unavailable,
}

/// Statement carried with every output that could reach a navigation decision.
pub const ADVISORY: &str = "Advisory: this is analysis and monitoring output and not type-approved navigation equipment. The authentication status reported here is not a navigation integrity service and must not be the sole basis for any navigation or safety decision.";

impl OsnmaStatus {
    /// Single-letter form used in the `$PKSOS` sentence.
    pub fn letter(self) -> char {
        match self {
            Self::Authenticated => 'A',
            Self::Failed => 'F',
            Self::Unavailable => 'N',
        }
    }
}

/// Seconds in a GST week.
pub const WEEK_S: u32 = 604_800;

/// Galileo System Time in this module is plain seconds, `week * 604800 + time of week`.
/// Messages carry it packed in 32 bits: the week number (12 bits) above the time of
/// week (20 bits). These convert between the two.
pub fn gst_pack(secs: u32) -> u32 {
    (((secs / WEEK_S) & 0xFFF) << 20) | (secs % WEEK_S)
}

/// Seconds from a week number and a time of week.
pub fn gst_secs(wn: u32, tow: u32) -> u32 {
    wn * WEEK_S + tow
}

#[cfg(test)]
mod gst_tests {
    use super::*;

    #[test]
    fn pack_puts_week_above_time_of_week() {
        let s = gst_secs(1248, 345_660);
        assert_eq!(gst_pack(s), (1248 << 20) | 345_660);
        assert_eq!(gst_pack(gst_secs(4097, 5)), (1 << 20) | 5); // week rolls over at 4096
    }
}

/// The `$PKSOS` sentence of the receiver-trust monitor: the overall status then each
/// satellite as `<sat>:<A|F|N>`, with the NMEA checksum.
pub fn pksos_sentence(overall: OsnmaStatus, sats: &[(String, OsnmaStatus)]) -> String {
    let mut body = format!("PKSOS,{}", overall.letter());
    for (s, st) in sats {
        body.push_str(&format!(",{s}:{}", st.letter()));
    }
    let cs = body.bytes().fold(0u8, |a, b| a ^ b);
    format!("${body}*{cs:02X}")
}

#[cfg(test)]
mod pksos_tests {
    use super::*;

    #[test]
    fn sentence_form_and_checksum() {
        let s = pksos_sentence(
            OsnmaStatus::Failed,
            &[
                ("E02".into(), OsnmaStatus::Authenticated),
                ("E05".into(), OsnmaStatus::Failed),
            ],
        );
        assert!(s.starts_with("$PKSOS,F,E02:A,E05:F*"));
        let (body, cs) = s[1..].split_once('*').unwrap();
        assert_eq!(
            u8::from_str_radix(cs, 16).unwrap(),
            body.bytes().fold(0, |a, b| a ^ b)
        );
        assert_eq!(
            pksos_sentence(OsnmaStatus::Unavailable, &[])
                .split('*')
                .next(),
            Some("$PKSOS,N")
        );
    }
}
