//! Timing Integrity Benchmark (TIB): an honesty-immune yardstick that scores
//! any timing monitor's *stated* integrity risk against its *measured*
//! undetected-error exceedance.
//!
//! ## Honesty discipline
//! A benchmark makes **no accuracy claim of its own** — it only measures
//! whether a monitor's declared protection level bounds its error under a menu
//! of faults. Because it asserts nothing about accuracy, it cannot be wrong
//! about accuracy: this is its *honesty-immunity*. In the
//! [`crate::verification`] matrix every benchmark row is `Modelled` with an
//! `InternalConsistency` oracle (the scorer re-checked against an independent
//! numpy re-count); no row is `Validated` and none carries an `ExternalDataset`
//! accuracy oracle.
//!
//! The scoring taxonomy (nominal / unavailable / misleading / hazardously
//! misleading information) is Cited from the Stanford–ESA integrity diagram
//! (Tossaint et al., ION GNSS 2007) and the WAAS MOPS (RTCA DO-229). The
//! undetectable-fault set (symmetric single-path delay, replay-within-freshness)
//! is Cited from Mizrahi (RFC 7384) and Narula & Humphreys (IEEE JSTSP 2018):
//! such faults must be *absorbed* by the protection level, never "detected".

pub mod coverage;
pub mod faults;
pub mod scorecard;
pub mod stanford;
