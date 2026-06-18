// SPDX-License-Identifier: AGPL-3.0-only
//! Independent **DE-grade** cross-validation of `kshana`'s **Sun-central (heliocentric) Mars**
//! propagation — the planetary analogue of `xval/anise-lunar-od`.
//!
//! `kshana`'s core ships only the kernel-free, analytic path: the Sun-central two-body force model
//! ([`kshana::propagator::ForceModel::two_body`] with [`kshana::body::Body::sun`]) and the Mars
//! body constants, validated against ephemeris-free analytic truth in `tests/mars_propagation.rs`
//! (closed orbit, energy conservation, the Mars-J2 nodal rate, and the ≈687-day Mars-year period).
//! What that core *cannot* do without external data is check the propagation against the real JPL
//! ephemeris. This crate does exactly that: it seeds the **same** Sun-central propagator from a
//! DE440 Mars-barycenter state (read via [ANISE](https://github.com/nyx-space/anise)) and reports
//! the honest residual against the DE440 Mars ephemeris over a sequence of arcs.
//!
//! It is deliberately isolated from the `kshana` package (its own `Cargo.lock`, excluded from the
//! workspace) because ANISE + hifitime are MPL-2.0 / edition-2024; see `Cargo.toml`.
//!
//! Modules:
//! - [`kernel`]    — resolve / curl-fetch the DE440 SPK (`de440s.bsp`, carries the Mars barycenter).
//! - [`anise_env`] — the DE-grade DE440 Mars/Sun/Earth ephemeris provider.
//! - [`xval`]      — seed the Sun-central propagator from DE440 and measure the per-arc residual.
//! - [`report`]    — the honest residual report (`report.json` / `report.md`).

pub mod anise_env;
pub mod kernel;
pub mod report;
pub mod xval;

pub use anise_env::AniseMarsEnvironment;
