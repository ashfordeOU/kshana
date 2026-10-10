// SPDX-License-Identifier: AGPL-3.0-only
//! Validated anchor (skeleton: pre-registered tolerances only; the comparison is added in a
//! later commit).
//!
//! The NMEA training streams of `kshana::nmea_synth` are decoded by pynmea2, an independent
//! NMEA 0183 parser (`scripts/gen_nmea_training_ref.py`), and the decoded values are
//! compared with the generator's own truth track.
//!
//! ## Pre-registered tolerances
//!
//! Fixed BEFORE the first comparison run and never to be loosened after seeing results. Each
//! is the sum of the two roundings between the truth value and the printed field, or, for
//! heading, a stated multiple of the modelled gyro noise.
//!
//! | quantity | tolerance | derivation |
//! |---|---|---|
//! | latitude, longitude | 1.5e-6 deg | print rounding 0.5e-4 arcmin = 8.34e-7 deg, plus truth rounded to 6 dp (5e-7 deg) = 1.34e-6 |
//! | speed over ground (RMC, VTG knots) | 0.06 kn | printed to 0.1 (0.05), truth rounded to 0.01 (0.005) |
//! | speed over ground (VTG km/h) | 0.07 km/h | printed to 0.1 (0.05), truth 0.005 kn x 1.852 = 0.0093 |
//! | course over ground (RMC, VTG true) | 0.11 deg, circular | printed to 0.1 (0.05), truth rounded to 0.1 (0.05) |
//! | heading (HDT) | 0.5 deg, circular | gyro noise 0.05 deg standard deviation (10 sigma), print 0.05, truth 0.05 |
//! | UTC time of day and date (RMC, GGA, GNS, ZDA) | 0.02 s | printed to 0.01 s (0.005), truth offset rounded to 0.01 s (0.005), epoch rounded to the millisecond |
//!
//! Exact (no tolerance): every sentence parses and its checksum is valid; the talker and
//! sentence type are the expected ones; the count of each sentence type equals the count
//! the generator wrote; fix status and quality, and the satellite count in GGA, equal the
//! truth.

/// Latitude and longitude, degrees.
pub const TOL_LATLON_DEG: f64 = 1.5e-6;
/// Speed over ground, knots.
pub const TOL_SOG_KN: f64 = 0.06;
/// Speed over ground in VTG's km/h field.
pub const TOL_SOG_KMH: f64 = 0.07;
/// Course over ground, degrees (circular difference).
pub const TOL_COG_DEG: f64 = 0.11;
/// Heading, degrees (circular difference).
pub const TOL_HEADING_DEG: f64 = 0.5;
/// UTC time of day and date, seconds.
pub const TOL_TIME_S: f64 = 0.02;
