// SPDX-License-Identifier: AGPL-3.0-only
//! **PNT-resilience scoring & the decision-instability of single-number ratings.**
//!
//! A thin, deterministic scoring + assurance layer over Kshana's existing
//! simulations. Every authoritative framework (DHS/CISA Resilient PNT Conformance
//! Framework v2.0, RethinkPNT/Firesmith Resist-Detect-Respond-Recover, Yang
//! Yuanxi's resilient-PNT criteria) defines *what* resilience means but ships only
//! self-attestation: a checklist, not a measurement. This module supplies the
//! missing measurement layer — per-dimension sub-scores, each traceable to a
//! scenario + seed + engine version + oracle, and each tagged with its honest
//! [`crate::verification::VerificationStatus`] so the modelled-majority is on the
//! face of every result.
//!
//! **Honesty scope (load-bearing).** This is a *controlled, parameter-grounded
//! simulation*, not a field measurement, and it is a *simulation-derived
//! self-assessment aligned to RPCF v2.0* — never a certification, accreditation,
//! or a claim of "compliant"/"endorsed"/"achieved Level X". Scores are
//! timing-domain + detection figures of merit (see [`crate::fom`]); they are not
//! position-domain accuracy. The headline scientific result this module exists to
//! support is a *caution*: collapsing these many dimensions into one number, or one
//! RPCF Level, yields a rating whose architecture ranking is unstable under
//! defensible weighting and threat-mix choices (see [`study`]).
//!
//! "OLVIDMR" (Obfuscate/Limit/Verify/Isolate/Diversify/Mitigate/Recover) is a
//! Kshana mnemonic for the seven DHS RPCF technique categories; DHS names the
//! categories, not the acronym.

pub mod arch;
pub mod diversity;
pub mod panel;
pub mod report;
pub mod score;
pub mod stats;
pub mod study;
pub mod timeline;
