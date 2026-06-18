// SPDX-License-Identifier: AGPL-3.0-only
//! Alternative-PNT (GPS-denied) navigation packs.
//!
//! The map-aided navigators that fix position without GNSS by matching a stored
//! georeferenced field against what the platform's sensors measure along its track.
//! [`terrain`] adds terrain-referenced navigation (TERCOM/SITAN) against an SRTM digital
//! elevation model, and the combined gravity+magnetic+terrain navigator that fuses three
//! scalar field channels — composing the gravity-anomaly field in [`crate::gravimeter`],
//! the IGRF-14 magnetic field in [`crate::igrf`], the map-match likelihood in
//! [`crate::mapmatch`], and the [`crate::particle_filter`] estimator engine. [`sequential`]
//! runs that same measurement model recursively (SITAN as a running particle filter) so a
//! *time-varying* INS drift is tracked epoch by epoch, where [`terrain`]'s batch search only
//! recovers a single constant offset.

pub mod sequential;
pub mod terrain;
