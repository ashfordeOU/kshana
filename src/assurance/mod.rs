// SPDX-License-Identifier: AGPL-3.0-only
//! Assurance primitives: provenance, uncertainty, and external-oracle attestation.
//!
//! These types are deliberately `no_std`-friendly in spirit: they use
//! [`std::collections::BTreeMap`] and [`std::borrow::Cow`] (never `HashMap`),
//! accept timestamps as caller-supplied fields (never call [`std::time::SystemTime::now`]
//! internally), and compile for `wasm32-unknown-unknown`.

pub mod provenance;
