// SPDX-License-Identifier: AGPL-3.0-only
//! Galileo OSNMA receiver-side verifier (SIS ICD Issue 1.1, Receiver Guidelines
//! Issue 1.3; see `docs/OSNMA.md`).
//!
//! This module holds the cryptography-free layer: bit-level access to I/NAV
//! pages, the 40-bit OSNMA field, the HKROOT and MACK sections, and their
//! per-subframe assembly. Nothing here transmits or forges data; it only reads.

pub mod bits;
pub mod page;
pub mod subframe;

pub use page::{InavPage, PageError, PAGE_BITS};
pub use subframe::{DsmHeader, MackLayout, NmaHeader, Subframe, SubframeAssembler};

/// Per-satellite outcome in the form the receiver-trust monitor consumes.
#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub enum OsnmaStatus {
    Authenticated,
    Failed,
    Unavailable,
}

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
