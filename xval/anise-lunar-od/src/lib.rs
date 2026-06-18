// SPDX-License-Identifier: AGPL-3.0-only
//! Independent **DE-grade** cross-validation of `kshana`'s selenocentric precise orbit
//! determination.
//!
//! `kshana`'s Moon-centred fit reaches 6.6 m against the real JPL Horizons LRO orbit, a residual
//! proven (in `tests/agency_lro.rs` and the W4b record) to be limited by the *analytic* lunar
//! orientation and ephemeris rather than the estimator. This crate swaps **only** those two inputs
//! for DE-grade ones — the DE440 lunar principal-axis orientation and the DE440 planetary ephemeris,
//! read via [ANISE](https://github.com/nyx-space/anise) — through `kshana`'s `LunarEnvironment`
//! provider seam, and re-runs the *same* precise estimator to measure the true residual.
//!
//! It is deliberately isolated from the `kshana` package (its own `Cargo.lock`, excluded from the
//! workspace) because ANISE + hifitime are MPL-2.0 / edition-2024; see `Cargo.toml`.
//!
//! Modules:
//! - [`kernel`]    — resolve / curl-fetch the DE440 SPK and the lunar PA BPC.
//! - [`anise_env`] — the DE-grade [`LunarEnvironment`](kshana::lunar_od::LunarEnvironment) provider.
//! - [`truth`]     — the vendored Horizons LRO truth (shared with the analytic fit).
//! - [`fit`]       — the dynamic + reduced-dynamic DE-grade fit through `kshana::precise_od::fit`.
//! - [`report`]    — the honest residual report (`report.json` / `report.md`).

pub mod anise_env;
pub mod fit;
pub mod kernel;
pub mod report;
pub mod truth;

pub use anise_env::AniseLunarEnvironment;
