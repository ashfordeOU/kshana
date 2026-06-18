// SPDX-License-Identifier: AGPL-3.0-only
//! Independent numerical cross-validation of `kshana`'s IAU 2006/2000A reference-frame
//! reduction against ANISE (the pure-Rust NAIF/SPICE reimplementation).
//!
//! `kshana`'s celestial-to-terrestrial chain (`kshana::cio`, GCRS->CIRS->ITRS) is
//! already anchored bit-for-bit to the published SOFA/ERFA `eraXys06a` / `eraC2ixys` /
//! `eraEra00` test vectors. This crate adds a *third-party* numerical check: it drives
//! both `kshana` and ANISE's high-precision Earth body-fixed frame (ITRF93, from
//! JPL's `earth_latest_high_prec.bpc`) with the SAME IERS Earth-orientation parameters
//! and compares the resulting inertial->Earth-fixed rotations.
//!
//! The crate is deliberately isolated from the `kshana` package (its own `Cargo.lock`,
//! excluded from the workspace) because ANISE + hifitime are MPL-2.0 / edition-2024;
//! see `Cargo.toml` for the full rationale.
//!
//! Modules:
//! - [`compare`]   — frame-realization-agnostic rotation-matrix metrics.
//! - [`eop`]       — IERS `finals2000A` Earth-orientation-parameter reader.
//! - [`timeconv`]  — UTC -> (TT, UT1) Julian dates via `kshana::timescales`.
//! - [`kshana_chain`] — the `kshana` side of the comparison.
//! - [`anise_bridge`] — the ANISE side (kernel loading + ITRF93 rotation).
//! - [`xval`]      — the epoch grid, the comparison driver, and the report model.

pub mod compare;
pub mod eop;
pub mod kshana_chain;
pub mod timeconv;

pub mod anise_bridge;
pub mod kernel;
pub mod xval;

pub use compare::Mat3;
pub use timeconv::Epoch;
