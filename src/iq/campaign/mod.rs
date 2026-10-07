// SPDX-License-Identifier: AGPL-3.0-only
//! **Lab replay: test conditions, the campaign runner and the scoring engine.**
//!
//! * [`conditions`]: the test-condition file (`kshana.test-conditions/1`). It holds what a
//!   lab states about one recording: the expected satellites and, for each event, its type
//!   label, its timing and its stated power profile. It is metadata only.
//! * [`score`]: the online scorer. It turns one tracked satellite's loop updates into
//!   availability, time to loss of lock, re-acquisition time, C/N0 degradation against the
//!   stated J/S (with an analytic reference labelled MODELLED), false-lock rate and PLL/DLL
//!   jitter.
//! * [`spec`]: the campaign file (`kshana.campaign/1`): recordings × front-end chains ×
//!   loop designs, with run and scoring settings.
//! * [`runner`]: plans the cells, skips those already done (content-hash keys), runs the
//!   rest in parallel and writes one result per cell.
//! * [`report`]: scorecards (CSV/JSON), the self-contained HTML report and the digest.
//! * [`truth`]: truth Doppler from a synthetic scene's sidecar, for the false-lock check.
//! * [`hash`]: the canonical-JSON and file hashes that stamp every result.
//!
//! The design is in `docs/design/LAB-CAMPAIGN.md`. Nothing in this module synthesises,
//! transmits or models an interference waveform. It reads recordings and scores them.

pub mod conditions;
pub mod hash;
pub mod report;
pub mod runner;
pub mod score;
pub mod spec;
pub mod truth;

pub use conditions::TestConditions;
pub use runner::{run, CellResult, Plan, RunOptions, RunSummary};
pub use spec::{CampaignSpec, LoadedCampaign, PathCheck};
