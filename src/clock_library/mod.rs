// SPDX-License-Identifier: AGPL-3.0-only
//! The measured clock library ("Clock Atlas"): device cards fitted to named measured clock
//! records and scored on data they never saw.
//!
//! * [`series`]: a uniformly gridded phase record with explicit gaps, and the gap-aware Allan
//!   and Hadamard variances.
//! * [`condition`]: the conditioning detector and its visible log of gaps, phase outliers,
//!   phase steps, bursts and frequency steps.
//! * [`card`]: the device card (white phase, white, flicker and random-walk frequency
//!   modulation plus a linear frequency drift), its held-out score, and its conversion to the
//!   slot-timing noise model, the extended Kalman clock model and the spoofing monitor's noise
//!   levels.
//!
//! Readers for the measured records live in [`crate::realdata::clk`] (RINEX and IGS clock
//! files, BIPM per-laboratory and Circular T series); the pooled ageing bound for UTC(k) is in
//! [`crate::utck_bound`]. The noise identification is [`crate::allan::lag1_noise_id`]; the
//! degrees of freedom and confidence intervals are the existing
//! [`crate::allan::edf_overlapping_adev`] and [`crate::allan::deviation_ci`].
pub mod card;
pub mod condition;
pub mod series;

pub use card::{
    pooled_hadamard_noise, score_curve, score_held_out, DeviceCard, HeldOutScore, ScoredPoint,
};
pub use condition::{condition, Anomaly, AnomalyKind, ConditioningLog};
pub use series::PhaseSeries;
