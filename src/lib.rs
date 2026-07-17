// SPDX-License-Identifier: AGPL-3.0-only
// Panic-surface gate: a bare `.unwrap()` in non-test code is a lint. Combined with the
// CI `-D warnings`, this makes any new `.unwrap()` outside `#[cfg(test)]` fail the build.
// Retained non-test panics use `.expect("<provable invariant>")` instead, which carries
// the proof in-source; `expect_used` is intentionally NOT enabled.
#![cfg_attr(not(test), warn(clippy::unwrap_used))]
//! # kshana — a validated, reproducible PNT simulation substrate
//!
//! `kshana` is an open-source engine for positioning, navigation and timing
//! (PNT) analysis: GNSS geometry and integrity, clock holdover and time transfer,
//! inertial and alt-PNT navigation, orbit and mission analysis, lunar/cislunar
//! PNT, and RF resilience. It has no scientific runtime dependencies, and every
//! run is deterministic from its inputs.
//!
//! ## Entry points
//!
//! * [`api::run_toml`] is the single dispatch entry: it parses a scenario TOML,
//!   detects its kind, runs it, and returns a structured result. Every language
//!   binding — the Python package, the MCP server, and the WASM playground — is a
//!   thin wrapper over it, so all surfaces run the identical engine.
//! * [`api::list_scenario_kinds`] is the machine-readable catalogue of the
//!   built-in scenario kinds, each with its description and required/optional
//!   fields — the same catalogue the [`docs/SCENARIOS.md`] reference is generated
//!   from.
//!
//! [`docs/SCENARIOS.md`]: https://github.com/AshfordeOU/kshana/blob/main/docs/SCENARIOS.md
//!
//! ## Honesty model
//!
//! Every capability carries an explicit maturity tier, generated from source in
//! [`verification::verification_matrix`] (the single source of truth) and
//! CI-pinned so the labels cannot drift from the code:
//!
//! * [`Validated`](verification::VerificationStatus::Validated) — checked against
//!   an independent external oracle (a published dataset, reference vectors, or a
//!   closed-form value). A self-consistency check can never be labelled Validated.
//! * [`Modelled`](verification::VerificationStatus::Modelled) — implemented from
//!   published or first-principles physics with tests, but not checked against an
//!   external oracle to a stated tolerance.
//! * [`PartnerOwned`](verification::VerificationStatus::PartnerOwned) — a
//!   capability kshana deliberately does not provide, recorded as a gap rather than
//!   faked.
//!
//! The per-figure-of-merit tier shown next to a result is derived from this same
//! matrix via [`fom_label`]. kshana makes no technology-readiness or heritage
//! claim and is not affiliated with, nor endorsed by, any space agency.
//!
//! ## Reproducibility
//!
//! Runs are deterministic: a scenario, a seed, and a pinned engine version rebuild
//! the same figures byte-for-byte. The governing equations behind the physics are
//! collected, with their literature sources, in the [`docs/EQUATIONS.md`]
//! reference.
//!
//! [`docs/EQUATIONS.md`]: https://github.com/AshfordeOU/kshana/blob/main/docs/EQUATIONS.md

pub mod acquisition;
pub mod allan;
pub mod altpnt;
pub mod antenna;
pub mod api;
pub mod assurance;
pub mod attack_surface;
pub mod attitude_budget;
pub mod attitude_dynamics;
pub mod batch_ls;
pub mod body;
pub mod bplane;
pub mod ccsds_tdm;
pub mod chart;
pub mod cio;
mod cio_s06_data;
pub mod cislunar_observability;
pub mod cislunar_srif;
pub mod clock_specs;
pub mod clock_state;
pub mod conflict_resilience;
pub mod conflict_threat_params;
pub mod cr3bp;
pub mod cross_raim;
pub mod cross_sensor_integrity;
pub mod crossover;
pub mod crpa;
pub mod cw_dynamics;
pub mod deepspace_od;
pub mod detection;
pub mod dro;
pub mod egm2008_data;
pub mod ensemble;
pub mod eo_payload;
pub mod eop;
pub mod ephem;
pub mod ephem_provider;
pub mod ephemeris;
pub mod estimator;
pub mod eval_stats;
mod fes2004_data;
pub mod filter_health;
pub mod fim;
pub mod fom;
pub mod fom_label;
pub mod forces;
pub mod frame_eop;
pub mod frames;
pub mod frugal;
pub mod fusion;
pub mod geolocation;
pub mod glonass;
pub mod gnss_sim;
pub mod gravimeter;
pub mod gravity_sh;
pub mod gse_sim;
pub mod handoff;
pub mod holdover;
pub mod hybrid;
pub mod hybrid_integrity;
pub mod igrf;
mod igrf_data;
pub mod impairment_eval;
pub mod impairment_ml;
pub mod impairment_study;
pub mod inertial;
pub mod integrator;
pub mod integrity_impact;
pub mod interchange;
pub mod intersat_range;
pub mod ionex;
pub mod jamming;
pub mod jd2;
pub mod kalman;
pub mod lambda;
pub mod launch;
pub mod linkbudget;
pub mod lunar;
pub mod lunar_beacon;
pub mod lunar_combination;
pub mod lunar_dpnt;
pub mod lunar_frame;
pub mod lunar_frame_predict;
pub mod lunar_frame_realise;
pub mod lunar_interop;
pub mod lunar_od;
pub mod lunar_perturbed;
pub mod lunar_service;
pub mod lunar_time;
pub mod lunar_time_budget;
pub mod lunar_time_budget_scenario;
pub mod lunar_vlbi;
pub mod maneuver;
pub mod mapmatch;
pub mod mars_atmos;
pub mod mars_frame;
pub mod mars_pnt;
pub mod mcda;
pub mod models;
pub mod monitor_network;
pub mod navsignal;
pub mod nma_budget;
pub mod nutation;
mod nutation_iau2000a_data;
pub mod observability_gramian;
pub mod oem;
pub mod omm;
pub mod optical_availability;
pub mod optical_linkbudget;
pub mod orbit;
pub mod orbit_determination;
pub mod particle_filter;
pub mod passes;
pub mod permalink;
pub mod powerlaw;
pub mod precession;
pub mod precise_od;
pub mod propagator;
pub mod pvt;
#[cfg(feature = "python")]
pub mod python;
pub mod qtrade;
pub mod quantum_devices;
pub mod quantum_faults;
pub mod quantum_nav_od;
pub mod quantum_trade;
pub mod radiometric;
pub mod raim;
pub mod realdata;
pub mod realtime_frame_eop;
pub mod reentry;
pub mod registry;
pub mod report;
pub mod representativeness;
pub mod resilience;
pub mod rinex;
pub mod rinex_obs;
pub mod run;
pub mod sbas;
pub mod scenario;
pub mod sdr;
pub mod security;
pub mod sgp4;
pub mod sp3;
pub mod space_packet;
pub mod space_weather;
pub mod spoof;
pub mod spoof_capture;
pub mod spoof_detect;
pub mod spoof_monitors;
pub mod study;
pub mod suite;
pub mod sweep;
pub mod tides;
pub mod timegeo;
pub mod timescales;
pub mod timetransfer;
pub mod timetransfer_adv;
pub mod timetransfer_chain;
pub mod tle;
pub mod tpl;
pub mod types;
pub mod verification;
pub mod wahba;
pub mod walker;
#[cfg(feature = "wasm")]
pub mod wasm;
mod worldmap;
