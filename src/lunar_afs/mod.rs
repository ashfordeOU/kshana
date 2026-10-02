// SPDX-License-Identifier: AGPL-3.0-only
//! **LunaNet Augmented Forward Signal (AFS) reference generator.**
//!
//! A generator of the AFS that the Lunar Augmented Navigation Service (LANS) broadcasts,
//! pinned to one version of one document: the LunaNet Signal-In-Space Recommended Standard
//! (LSIS) - Augmented Forward Signal, Volume A, **V1.0 of 29 January 2025** ([`LSIS_VERSION`]),
//! written by NASA, ESA and JAXA. Every output names that version.
//!
//! | piece | standard | module |
//! |---|---|---|
//! | carrier 2492.028 MHz | LSIS-020 | [`CARRIER_HZ`] |
//! | AFS-I: binary phase-shift keying BPSK(1) data channel, 2046-chip Gold code, 500 symbol/s | LSIS-130, -140, -221 | [`codes`] |
//! | AFS-Q: BPSK(5) pilot, 10230-chip Weil primary, 4-chip secondary, 1500-chip tertiary | LSIS-222 to -224 | [`codes`] |
//! | frame: sync pattern, Bose–Chaudhuri–Hocquenghem (BCH) (51, 8) subframe 1, 24-bit cyclic redundancy check (CRC-24), rate 1/2 low-density parity-check (LDPC) subframes 2-4, 60 x 98 interleaver | LSIS 2.4 | [`frame`], [`ldpc`] |
//! | baseband in-phase/quadrature (IQ) samples with truth labels, Signal Metadata Format (SigMF) output | LSIS-103, -130 | [`waveform`] |
//!
//! Nothing copied from the standard is part of this repository: LSIS V1.0 and its attachments
//! carry no reuse terms. Codes the standard defines by an algorithm are generated (the AFS-Q
//! primary from the IS-GPS-800 L1C pilot construction and IS-GPS-800J indices, the AFS-I Gold
//! codes from their shift registers); what only the standard's attachments define (the
//! per-PRN AFS-I G2 delays, the tertiary codes, the LDPC submatrices of [Annex1]) is read at
//! run time from a local cache that `xval/lunar-afs/fetch_lsis.sh` fills from the NASA-hosted
//! PDF, every file checked against a pinned SHA-256 ([`lsis`]). Without the cache, code
//! generation for AFS-I, the tertiary code and LDPC coding return an error naming the fix.
//!
//! Ambiguities in the standard are resolved as stated assumptions, each written where it is
//! used and pre-registered with the oracle tests: the IS-GPS-200 shift-register convention,
//! the G2 delay direction, the quadratic-residue definition of the length-1499 Legendre
//! sequence (Appendix E prints no formula), the position of the filler bits, and the
//! interleaver dimensions (Table 17 prints them transposed against the text). V1.0 leaves
//! most message contents to be written; subframes 2, 3 and 4 therefore carry caller-supplied
//! or seeded data bits, and the code assignment is the interim Table 11 one
//! ({LSIS-TBD-2001}, {LSIS-TBC-2020}).
//!
//! Scope: this module models conformance to the standard. It is not a channel, propagation,
//! received-power or link-budget model, and the lunar service volume stays a separate,
//! MODELLED capability (`lunar_service`).

pub mod codes;
pub mod frame;
pub mod ldpc;
pub mod lsis;
pub mod params;
pub mod waveform;

/// The standard every output of this module is pinned to.
pub const LSIS_VERSION: &str = "LSIS V1.0, 29 January 2025 (LunaNet Signal-In-Space Recommended Standard - Augmented Forward Signal, Volume A)";
/// AFS carrier frequency (Hz), LSIS-020.
pub const CARRIER_HZ: f64 = crate::lunar_service::LSIS_AFS_CARRIER_HZ;
/// AFS-I chip rate (chips per second), LSIS-140 Table 7.
pub const I_CHIP_RATE_HZ: f64 = 1.023e6;
/// AFS-Q chip rate (chips per second), LSIS-140 Table 7.
pub const Q_CHIP_RATE_HZ: f64 = 5.115e6;
/// AFS-I symbol rate (symbols per second), LSIS-140 Table 7.
pub const SYMBOL_RATE_HZ: f64 = 500.0;
