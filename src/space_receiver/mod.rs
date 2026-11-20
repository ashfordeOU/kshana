// SPDX-License-Identifier: AGPL-3.0-only
//! A GNSS receiver flying in space: how its clock behaves, how its timestamps fail, how hard the
//! signal dynamics are, and how it fares on a fixed set of upper-Space-Service-Volume cases.
//!
//! * [`clock`]: the onboard clock along a Keplerian orbit: the relativistic secular rate against TT
//!   and the periodic eccentricity term, the free-running time error of an oscillator class over a
//!   GNSS outage (power-law noise, ageing, an orbit-periodic temperature swing);
//! * [`timestamps`]: a detector of timestamp faults in a receiver's time tags against an onboard
//!   reference count (reversals, duplicates, gaps, millisecond, leap-second, time-scale-offset and
//!   week-rollover steps, isolated outliers, frequency steps, clock-bias jumps);
//! * [`dynamics`]: line-of-sight Doppler, Doppler rate and its derivative for every GNSS signal in
//!   view along a GEO, GTO, HEO or transfer orbit, against the receiver's stated tracking limits;
//! * [`bench`]: the upper-SSV benchmark, a versioned set of trajectory cases run through the
//!   `gnss-ssv` sweep ([`crate::ssv`]) and the two modules above;
//! * [`mms`]: the MMS Phase 2B case set beside the flight results NASA published;
//! * [`od_vs_tle`]: an onboard orbit-determination ephemeris (CCSDS OEM) against an element set;
//! * [`cli`]: `kshana space-receiver <clock|timestamps|dynamics|bench|mms|od-vs-tle>`.
//!
//! MODELLED throughout: two-body orbits, the ICG booklet's constellation tables and link budget,
//! and representative oscillator classes. The relativistic constant is checked against the value
//! IS-GPS-200 publishes. See `docs/SPACE-RECEIVER.md`.

pub mod bench;
pub mod cli;
pub mod clock;
pub mod dynamics;
pub mod mms;
pub mod od_vs_tle;
pub mod timestamps;
