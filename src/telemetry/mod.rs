// SPDX-License-Identifier: AGPL-3.0-only
//! GNSS trust as a security-telemetry source for operations centres.
//!
//! The per-epoch trust stream (score, band, reasons) is turned into:
//! * Prometheus text exposition on an HTTP `/metrics` endpoint ([`prometheus`]);
//! * syslog lines in CEF or LEEF for SIEM ingestion ([`syslog`]);
//! * OpenTelemetry OTLP/HTTP export, behind the off-by-default `otlp` feature (`otlp`).
//!
//! The sinks read [`sample::TrustSample`] only; [`sample`] is the single adapter between
//! the engine's trust records and everything here. See `docs/TRUST-TELEMETRY.md`.

pub mod cli;
#[cfg(feature = "otlp")]
pub mod otlp;
pub mod prometheus;
pub mod sample;
pub mod syslog;
pub mod time;
