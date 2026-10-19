// SPDX-License-Identifier: AGPL-3.0-only
//! GNSS beyond the constellation: signal availability, link strength and navigation for spacecraft above, around and far
//! past the GNSS orbits (the Space Service Volume and the cislunar regime).
//!
//! The `gnss-ssv` scenario kind ([`scenario`]) sweeps a user over a shell or along a trajectory for the six constellations of
//! the ICG Space Service Volume booklet and reports availability of one and of four signals, outage durations, received
//! C/N0, dilution of precision, and main-lobe against sidelobe links. See `docs/SSV.md`.

mod annex_c;
pub mod check;
pub mod constellations;
pub mod formation;
pub mod geom;
pub mod limb;
pub mod nav;
pub mod pattern;
pub mod scenario;
pub mod sweep;
pub mod weak;
