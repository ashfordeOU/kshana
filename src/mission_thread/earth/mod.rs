// SPDX-License-Identifier: AGPL-3.0-only
//! The Earth-side phase kinds of the mission thread: launch and ascent, repeated low-Earth-orbit
//! rendezvous and docking, trans-lunar injection and cislunar cruise, and return and entry. Each
//! reuses the engine's own pieces (the closed-form relative motion, the space-service-volume GNSS
//! availability, the pass and contact planners, the entry corridor) and carries its numbers as
//! stated, MODELLED inputs.

pub mod filter;
pub mod launch;
pub mod model;
pub mod orbit;
pub mod rendezvous;
