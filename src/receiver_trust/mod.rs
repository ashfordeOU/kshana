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
pub mod live;
pub mod maritime;
pub mod monitors;
pub mod platform;
pub mod scenario;
pub mod score;
pub mod synth;

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
    /// Navigation sentences and security reports of a moving platform (NMEA VTG, HDT, VHW
    /// and the like, UBX-SEC-SIG); `None` when the log carries none of them.
    #[serde(default, skip_serializing_if = "Option::is_none")]
    pub marine: Option<MarineObs>,
}

/// An OSNMA (Galileo navigation message authentication) status as a receiver reports it.
/// Only a reported status is ingested; nothing here verifies a signature.
#[derive(Clone, Copy, Debug, PartialEq, Eq, Serialize, Deserialize)]
#[serde(rename_all = "kebab-case")]
pub enum OsnmaStatus {
    /// The receiver reports the navigation data authenticated.
    Authenticated,
    /// The receiver reports an authentication failure.
    Failed,
    /// The receiver reports no OSNMA result (not enabled, not yet available).
    Unavailable,
}

/// What a moving platform's other sensors and the receiver's security reports say at one
/// epoch. Every field is optional: a source carries what it carries.
#[derive(Clone, Debug, Default, PartialEq, Serialize, Deserialize)]
pub struct MarineObs {
    /// Whether the receiver itself calls the fix valid: GGA quality above 0 and RMC status
    /// `A`. `false` when either says otherwise.
    pub fix_valid: Option<bool>,
    /// Speed over ground, knots (RMC, else VTG).
    pub sog_kn: Option<f64>,
    /// Course over ground, degrees true (RMC, else VTG).
    pub cog_deg: Option<f64>,
    /// Heading from a gyro or compass, degrees true (HDT, THS, else VHW).
    pub heading_deg: Option<f64>,
    /// Speed through the water, knots (VHW, VBW).
    pub stw_kn: Option<f64>,
    /// GGA altitude of the antenna above mean sea level, m.
    pub alt_msl_m: Option<f64>,
    /// GGA geoid separation, m.
    pub geoid_sep_m: Option<f64>,
    /// GGA horizontal dilution of precision.
    pub hdop: Option<f64>,
    /// Time of day of the sentence that opened this epoch minus that of the previous timed
    /// sentence, in arrival order, s (midnight-aware). Negative when the receiver's time
    /// ran backwards. `None` for the first epoch and for a repeat of the same time.
    pub time_step_s: Option<f64>,
    /// Arrival time of the epoch's first timed sentence on the host's monotonic clock, s
    /// (live input only).
    pub arrival_s: Option<f64>,
    /// u-blox UBX-SEC-SIG jamming state: 0 unknown or off, 1 ok, 2 warning, 3 critical.
    pub sec_jam_state: Option<u8>,
    /// u-blox UBX-SEC-SIG spoofing state: 0 unknown or off, 1 none indicated, 2 indicated,
    /// 3 multiple indications.
    pub sec_spoof_state: Option<u8>,
    /// OSNMA status as the receiver reports it.
    pub osnma: Option<OsnmaStatus>,
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
