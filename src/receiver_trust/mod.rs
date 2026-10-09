// SPDX-License-Identifier: AGPL-3.0-only
//! GNSS trust observability from a real receiver's own log: the `receiver-trust` kind.
//!
//! A receiver log (u-blox UBX, RINEX 3 observations with optional broadcast navigation,
//! Android GnssLogger CSV, or NMEA 0183) is read into one time-tagged [`Timeline`], the
//! trust monitors run over it epoch by epoch, and the result says when and why the
//! receiver's fix stopped being trustworthy. Optionally the log is compared with events
//! and predictions stated in the scenario before the run (tolerances included), and the
//! agreement or disagreement is reported either way.
//!
//! The readers only parse file formats ([`ingest`]); every statistic comes from the
//! engine's existing code (C/N0 straight from the receiver, the single-point fix of
//! [`crate::pvt`], parity RAIM of [`crate::spoof_monitors::parity_raim_test`], the
//! clock-aided bound of [`crate::security`]). Nothing is fitted to the events being
//! scored: every monitor parameter is an input stated in the scenario.

pub mod ingest;
pub mod monitors;
pub mod platform;
pub mod scenario;

use serde::{Deserialize, Serialize};

/// The receiver-log formats the kind reads.
#[derive(Clone, Copy, Debug, PartialEq, Eq, Serialize, Deserialize)]
#[serde(rename_all = "kebab-case")]
pub enum LogFormat {
    /// u-blox UBX binary: NAV-SAT (per-satellite C/N0), NAV-PVT (fix), MON-RF (AGC,
    /// jamming indicator).
    Ubx,
    /// RINEX 3 observation text (`S` codes for C/N0); with a broadcast navigation file
    /// the engine also forms its own fix, RAIM and the clock-aided monitor.
    Rinex,
    /// Android GnssLogger CSV (`Raw` rows: C/N0, AGC; `Fix` rows: position).
    Android,
    /// NMEA 0183 text (GSV: per-satellite SNR in dB-Hz; GGA/RMC: time and position).
    Nmea,
}

/// One satellite's signal strength at one epoch.
#[derive(Clone, Debug, PartialEq, Serialize, Deserialize)]
pub struct SatCn0 {
    /// Satellite identifier in RINEX style: system letter and two-digit number
    /// (`G05`, `E11`, `C23`, `R07`, `J02`, `S28`).
    pub sat: String,
    /// Signal or band label as the source names it (`L1`, `S1C`, `L2`, ...); `L1` when
    /// the source does not say.
    pub band: String,
    /// Carrier-to-noise density, dB-Hz.
    pub cn0_dbhz: f64,
}

/// A position the receiver itself reported at one epoch.
#[derive(Clone, Copy, Debug, PartialEq, Serialize, Deserialize)]
pub struct ReportedFix {
    /// Geodetic latitude, degrees.
    pub lat_deg: f64,
    /// Geodetic longitude, degrees.
    pub lon_deg: f64,
    /// Height (ellipsoidal where the source gives it, otherwise above mean sea level), m.
    pub height_m: f64,
    /// Satellites the receiver used, where reported.
    pub n_used: Option<u32>,
}

/// Everything the log says about one epoch. Fields a format does not carry stay `None`.
#[derive(Clone, Debug, Default, PartialEq, Serialize, Deserialize)]
pub struct LogEpoch {
    /// Time of the epoch in seconds since the first epoch of the log.
    pub t_s: f64,
    /// The same instant as the log states it (ISO-8601 UTC or GPS time when known;
    /// `None` when the format gives only a relative time).
    pub time_label: Option<String>,
    /// Per-satellite C/N0 at this epoch.
    pub cn0: Vec<SatCn0>,
    /// Automatic gain control reading in the receiver's native units (u-blox `agcCnt`
    /// 0–8191; Android `AgcDb` in dB). Several RF blocks are averaged.
    pub agc: Option<f64>,
    /// u-blox CW jamming indicator `jamInd`, 0–255 (highest across RF blocks).
    pub jam_ind: Option<f64>,
    /// The receiver's own position, where the log carries one.
    pub fix: Option<ReportedFix>,
}

/// A receiver log read into time order.
#[derive(Clone, Debug, Default, PartialEq, Serialize, Deserialize)]
pub struct Timeline {
    /// Epochs in increasing `t_s`.
    pub epochs: Vec<LogEpoch>,
    /// The first epoch's absolute time as the log states it, where known.
    pub start_label: Option<String>,
    /// Observables the source actually carries (`cn0`, `agc`, `jam_ind`, `fix`), so a
    /// report never implies a monitor ran on data that was not there.
    pub observables: Vec<String>,
    /// Records the reader skipped (corrupt frames, unparsable lines), for provenance.
    pub skipped_records: usize,
}
