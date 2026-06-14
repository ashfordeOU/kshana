// SPDX-License-Identifier: Apache-2.0
//! CCSDS Tracking Data Message (TDM) parser and writer — the standard
//! interchange format for raw radiometric tracking measurements.
//!
//! Where the OEM ([`crate::oem`]) carries a *propagated orbit* (a state time
//! series) and the OMM ([`crate::omm`]) carries *mean elements*, the TDM
//! (CCSDS 503.0-B, KVN form) carries the **observations themselves**: the
//! range, Doppler, angle, and frequency records a Deep-Space-Network or ESTRACK
//! tracking pass reports, time-tagged and tagged with the link geometry. It is
//! the on-the-wire form a station delivers to a flight-dynamics orbit-determination
//! system. Kshana already *models* these observables ([`crate::radiometric`]);
//! reading and writing the TDM is what lets it ingest a real agency tracking
//! file and emit one — the standard tracking-data path on which the deep-space
//! orbit determination (D2) then solves.
//!
//! ## Scope and references
//!
//! This is the KVN (Key-Value Notation) reader **and** writer for the structure
//! the published standard and its informative examples define:
//!
//! * a header — `CCSDS_TDM_VERS = 2.0`, optional `COMMENT` lines, `CREATION_DATE`,
//!   `ORIGINATOR`;
//! * one or more *segments*, each a `META_START … META_STOP` metadata block
//!   followed by a `DATA_START … DATA_STOP` data block;
//! * data lines of the form `KEY = epoch value`, the CCSDS TDM observable record
//!   (`RANGE`, `DOPPLER_INSTANTANEOUS`, `DOPPLER_INTEGRATED`, `ANGLE_1`/`ANGLE_2`,
//!   `TRANSMIT_FREQ_1`, `RECEIVE_FREQ`, …), with the epoch in the segment's
//!   `TIME_SYSTEM` and the value in the keyword's standard unit.
//!
//! The parser keeps the metadata keys it round-trips as named fields plus a
//! free-form list of any other recognised optional keys, so a file emitted by
//! [`TdmFile::to_tdm_string`] re-parses to an equal structure. The
//! [`TdmFile::to_radiometric_obs`] bridge maps the unambiguous `RANGE`/`DOPPLER_*`
//! records onto the [`crate::radiometric`] observable types so the solver can run
//! on a TDM directly.
//!
//! * CCSDS 503.0-B-2, *Tracking Data Message* (June 2020) — the KVN structure,
//!   keyword set, and the informative Annex-E examples mirrored here.
//! * CCSDS 502.0-B, *Orbit Data Messages* — the sibling KVN family ([`crate::oem`],
//!   [`crate::omm`]) whose header/segment conventions this follows.

use crate::radiometric::{Band, ObsKind, ObsWay, RadiometricObs};
use crate::timescales::{self, TwoPartJd};

/// One TDM segment's **metadata block** (`META_START … META_STOP`).
///
/// The four required-for-round-trip keys (`TIME_SYSTEM`, `participants`, `MODE`,
/// `PATH`) are named fields; the common optional keys the deep-space link needs
/// are carried explicitly (bands, turn-around ratio, range units); anything else
/// recognised in the block is preserved verbatim in [`other`](Self::other) as
/// `(key, value)` pairs so the writer can reproduce it.
#[derive(Clone, Debug, Default, PartialEq)]
pub struct TdmMeta {
    /// `TIME_SYSTEM` — the time scale the data-line epochs are tagged in
    /// (`UTC`, `TAI`, `GPS`, `TDB`, …).
    pub time_system: String,
    /// `PARTICIPANT_1`, `PARTICIPANT_2`, … in index order: the antennas /
    /// spacecraft in the tracking session (at least one, generally two).
    pub participants: Vec<String>,
    /// `MODE` — `SEQUENTIAL` (a single signal path) or `SINGLE_DIFF`
    /// (differenced), etc.
    pub mode: String,
    /// `PATH` — the signal routing as participant indices, e.g. `1,2,1` for a
    /// two-way (station→spacecraft→station) link.
    pub path: String,
    /// `TRANSMIT_BAND` — the uplink carrier band (`S`/`X`/`KA`/…), if present.
    pub transmit_band: Option<String>,
    /// `RECEIVE_BAND` — the downlink carrier band, if present.
    pub receive_band: Option<String>,
    /// `TURNAROUND_NUMERATOR` of the coherent transponder ratio, if present.
    pub turnaround_numerator: Option<f64>,
    /// `TURNAROUND_DENOMINATOR` of the coherent transponder ratio, if present.
    pub turnaround_denominator: Option<f64>,
    /// `RANGE_UNITS` — the unit `RANGE` values are in (`km`, `s`, or `RU`), if
    /// present (CCSDS default when absent is `RU`).
    pub range_units: Option<String>,
    /// Any other recognised metadata key/value pairs, in source order, preserved
    /// for round-trip (e.g. `START_TIME`, `STOP_TIME`, `INTEGRATION_INTERVAL`,
    /// `ANGLE_TYPE`, `DATA_QUALITY`).
    pub other: Vec<(String, String)>,
}

/// One TDM **observable record**: a keyword-tagged value at an epoch.
///
/// `key` is the CCSDS data-line keyword (`RANGE`, `DOPPLER_INTEGRATED`, …),
/// `epoch` the time tag as the raw KVN string in the segment's `TIME_SYSTEM`
/// (kept verbatim so the round trip is exact), and `value` the numeric value in
/// the keyword's standard unit.
#[derive(Clone, Debug, PartialEq)]
pub struct TdmObs {
    /// The time tag, verbatim from the file (segment `TIME_SYSTEM` scale).
    pub epoch: String,
    /// The CCSDS data-line keyword.
    pub key: String,
    /// The observable value (keyword's standard unit: km for `RANGE` in km mode,
    /// km/s for `DOPPLER_*`, Hz for `*_FREQ`, deg for `ANGLE_*`).
    pub value: f64,
}

/// One TDM segment: a metadata block and its observable records.
#[derive(Clone, Debug, PartialEq)]
pub struct TdmSegment {
    pub meta: TdmMeta,
    pub data: Vec<TdmObs>,
}

/// A CCSDS Tracking Data Message: the header fields and one or more segments.
#[derive(Clone, Debug, PartialEq)]
pub struct TdmFile {
    /// `CCSDS_TDM_VERS` value (`2.0`).
    pub version: String,
    /// `CREATION_DATE` (kept as the raw string for an exact round trip).
    pub creation_date: String,
    /// `ORIGINATOR`.
    pub originator: String,
    /// One or more `META_START`/`DATA_START` segments.
    pub segments: Vec<TdmSegment>,
}

/// The recognised data-section keywords whose lines are `KEY = epoch value`.
/// Used by the parser to tell a data record from a metadata line. (Indexed
/// frequency keys such as `RECEIVE_FREQ_1` are matched by prefix below.)
const DATA_KEYWORDS: &[&str] = &[
    "RANGE",
    "DOPPLER_INSTANTANEOUS",
    "DOPPLER_INTEGRATED",
    "ANGLE_1",
    "ANGLE_2",
    "TRANSMIT_FREQ_1",
    "TRANSMIT_FREQ_2",
    "TRANSMIT_FREQ_3",
    "TRANSMIT_FREQ_4",
    "TRANSMIT_FREQ_5",
    "RECEIVE_FREQ",
    "RECEIVE_FREQ_1",
    "RECEIVE_FREQ_2",
    "RECEIVE_FREQ_3",
    "RECEIVE_FREQ_4",
    "RECEIVE_FREQ_5",
    "PR_N0",
    "CN0",
    "RECEIVE_PHASE_CT_1",
    "TRANSMIT_PHASE_CT_1",
    "CLOCK_BIAS",
    "CLOCK_DRIFT",
    "STEC",
    "TROPO_DRY",
    "TROPO_WET",
    "PRESSURE",
    "TEMPERATURE",
    "HUMIDITY",
];

/// Split a `KEY = VALUE` KVN line at the first `=`, trimming both sides. Returns
/// `None` for a line without an `=`.
fn split_kvn(line: &str) -> Option<(&str, &str)> {
    line.split_once('=').map(|(k, v)| (k.trim(), v.trim()))
}

impl TdmFile {
    /// Parse a CCSDS TDM in KVN form.
    ///
    /// Reads the `CCSDS_TDM_VERS` header (with optional leading/interleaved
    /// `COMMENT` lines), `CREATION_DATE`, and `ORIGINATOR`, then one or more
    /// `META_START … META_STOP` / `DATA_START … DATA_STOP` segment pairs.
    /// Metadata keys are routed to named [`TdmMeta`] fields (`TIME_SYSTEM`,
    /// `PARTICIPANT_n`, `MODE`, `PATH`, the band/turn-around/range-unit keys) with
    /// everything else preserved in [`TdmMeta::other`]; data lines are parsed as
    /// `KEY = epoch value`. `COMMENT` lines and blank lines are tolerated
    /// anywhere. Returns a descriptive `Err` on a missing version header,
    /// malformed structure (e.g. `DATA_START` before `META_STOP`), or an
    /// unparseable data value.
    pub fn parse(text: &str) -> Result<TdmFile, String> {
        let mut version: Option<String> = None;
        let mut creation_date = String::new();
        let mut originator = String::new();
        let mut segments: Vec<TdmSegment> = Vec::new();

        // The parser is a small line-oriented state machine over the KVN blocks.
        #[derive(PartialEq)]
        enum State {
            Header,
            Meta,
            Data,
        }
        let mut state = State::Header;
        let mut cur_meta = TdmMeta::default();
        let mut cur_data: Vec<TdmObs> = Vec::new();

        for raw in text.lines() {
            let line = raw.trim();
            if line.is_empty() {
                continue;
            }
            // COMMENT lines are tolerated in any block and carry no structure.
            if line == "COMMENT" || line.starts_with("COMMENT ") || line.starts_with("COMMENT\t") {
                continue;
            }

            match state {
                State::Header => {
                    if line == "META_START" {
                        if version.is_none() {
                            return Err("TDM: META_START before CCSDS_TDM_VERS header".to_string());
                        }
                        cur_meta = TdmMeta::default();
                        state = State::Meta;
                        continue;
                    }
                    let (k, v) = split_kvn(line)
                        .ok_or_else(|| format!("TDM: malformed header line: {line:?}"))?;
                    match k {
                        "CCSDS_TDM_VERS" => version = Some(v.to_string()),
                        "CREATION_DATE" => creation_date = v.to_string(),
                        "ORIGINATOR" => originator = v.to_string(),
                        // Other header keywords (none mandatory here) are ignored
                        // rather than rejected, so a richer real header still parses.
                        _ => {}
                    }
                }
                State::Meta => {
                    if line == "META_STOP" {
                        // The data block must follow; defer the segment push to
                        // DATA_STOP so a segment always carries both halves.
                        continue;
                    }
                    if line == "DATA_START" {
                        cur_data = Vec::new();
                        state = State::Data;
                        continue;
                    }
                    let (k, v) = split_kvn(line)
                        .ok_or_else(|| format!("TDM: malformed metadata line: {line:?}"))?;
                    apply_meta_key(&mut cur_meta, k, v)?;
                }
                State::Data => {
                    if line == "DATA_STOP" {
                        segments.push(TdmSegment {
                            meta: std::mem::take(&mut cur_meta),
                            data: std::mem::take(&mut cur_data),
                        });
                        state = State::Header;
                        continue;
                    }
                    let (k, v) = split_kvn(line)
                        .ok_or_else(|| format!("TDM: malformed data line: {line:?}"))?;
                    if !is_data_keyword(k) {
                        return Err(format!("TDM: unrecognised data keyword {k:?}"));
                    }
                    // The value field is `epoch value`: an ISO/CCSDS time tag then
                    // the numeric observable, whitespace-separated.
                    let mut it = v.split_whitespace();
                    let epoch = it
                        .next()
                        .ok_or_else(|| format!("TDM: data line {k:?} missing epoch"))?;
                    let val_str = it
                        .next()
                        .ok_or_else(|| format!("TDM: data line {k:?} missing value"))?;
                    let value = val_str
                        .parse::<f64>()
                        .map_err(|_| format!("TDM: data line {k:?} bad value {val_str:?}"))?;
                    cur_data.push(TdmObs {
                        epoch: epoch.to_string(),
                        key: k.to_string(),
                        value,
                    });
                }
            }
        }

        if state != State::Header {
            return Err("TDM: unterminated segment (missing META_STOP/DATA_STOP)".to_string());
        }
        let version = version.ok_or_else(|| "TDM: missing CCSDS_TDM_VERS header".to_string())?;

        Ok(TdmFile {
            version,
            creation_date,
            originator,
            segments,
        })
    }

    /// Serialise to CCSDS TDM KVN text: the `CCSDS_TDM_VERS`/`CREATION_DATE`/
    /// `ORIGINATOR` header, then for each segment a `META_START … META_STOP`
    /// block (named keys first, then any preserved `other` keys in order) and a
    /// `DATA_START … DATA_STOP` block of `KEY = epoch value` records. The output
    /// re-parses to a structure equal (modulo numeric formatting) to the input.
    pub fn to_tdm_string(&self) -> String {
        let mut out = String::new();
        out.push_str(&format!("CCSDS_TDM_VERS = {}\n", self.version));
        out.push_str(&format!("CREATION_DATE = {}\n", self.creation_date));
        out.push_str(&format!("ORIGINATOR = {}\n", self.originator));
        for seg in &self.segments {
            out.push('\n');
            out.push_str("META_START\n");
            out.push_str(&format!("TIME_SYSTEM = {}\n", seg.meta.time_system));
            for (i, p) in seg.meta.participants.iter().enumerate() {
                out.push_str(&format!("PARTICIPANT_{} = {}\n", i + 1, p));
            }
            if !seg.meta.mode.is_empty() {
                out.push_str(&format!("MODE = {}\n", seg.meta.mode));
            }
            if !seg.meta.path.is_empty() {
                out.push_str(&format!("PATH = {}\n", seg.meta.path));
            }
            if let Some(b) = &seg.meta.transmit_band {
                out.push_str(&format!("TRANSMIT_BAND = {b}\n"));
            }
            if let Some(b) = &seg.meta.receive_band {
                out.push_str(&format!("RECEIVE_BAND = {b}\n"));
            }
            if let Some(n) = seg.meta.turnaround_numerator {
                out.push_str(&format!("TURNAROUND_NUMERATOR = {}\n", fmt_num(n)));
            }
            if let Some(d) = seg.meta.turnaround_denominator {
                out.push_str(&format!("TURNAROUND_DENOMINATOR = {}\n", fmt_num(d)));
            }
            if let Some(u) = &seg.meta.range_units {
                out.push_str(&format!("RANGE_UNITS = {u}\n"));
            }
            for (k, v) in &seg.meta.other {
                out.push_str(&format!("{k} = {v}\n"));
            }
            out.push_str("META_STOP\n");
            out.push_str("DATA_START\n");
            for obs in &seg.data {
                out.push_str(&format!(
                    "{} = {} {}\n",
                    obs.key,
                    obs.epoch,
                    fmt_num(obs.value)
                ));
            }
            out.push_str("DATA_STOP\n");
        }
        out
    }

    /// Map the unambiguous `RANGE` / `DOPPLER_*` records onto
    /// [`RadiometricObs`] so the deep-space solver can run on the TDM directly.
    ///
    /// This is the honest subset: only records whose [`ObsKind`] and link
    /// geometry are unambiguous from the standard are mapped.
    ///
    /// * `RANGE` → [`ObsKind::Range`] (value km → metres).
    /// * `DOPPLER_INSTANTANEOUS` / `DOPPLER_INTEGRATED` → [`ObsKind::Doppler`]
    ///   (value km/s → m/s; the Doppler *frequency-shift* convention of
    ///   [`crate::radiometric`] differs, but the CCSDS km/s range-rate is the
    ///   physical observable carried, so it is passed through as the value with
    ///   the kind tagged `Doppler`).
    ///
    /// The link [`ObsWay`] is read from the segment `PATH`: `1,2` → one-way
    /// (down-leg), `1,2,1` (same first/last participant) → two-way, otherwise
    /// (e.g. `1,2,3`) → three-way. The [`Band`] is read from `TRANSMIT_BAND`
    /// (falling back to `RECEIVE_BAND`). Records that cannot be mapped
    /// unambiguously (angles, frequencies, an unknown band, an unparseable epoch)
    /// are **skipped**, never guessed. `sigma` is set to `0.0` — the TDM does not
    /// carry a per-record uncertainty; the caller assigns the measurement weight.
    /// The epoch is parsed from the segment `TIME_SYSTEM` to a TDB [`TwoPartJd`]
    /// (only `UTC`, `TAI`, `GPS`, `TT`, `TDB` are recognised; an unrecognised time
    /// system skips the record).
    pub fn to_radiometric_obs(&self) -> Vec<RadiometricObs> {
        let mut out = Vec::new();
        for seg in &self.segments {
            let way = path_to_way(&seg.meta.path);
            let band = seg
                .meta
                .transmit_band
                .as_deref()
                .or(seg.meta.receive_band.as_deref())
                .and_then(parse_band);
            let (Some(way), Some(band)) = (way, band) else {
                continue;
            };
            for obs in &seg.data {
                let kind = match obs.key.as_str() {
                    "RANGE" => ObsKind::Range,
                    "DOPPLER_INSTANTANEOUS" | "DOPPLER_INTEGRATED" => ObsKind::Doppler,
                    _ => continue,
                };
                let Some(epoch) = parse_epoch_to_tdb(&obs.epoch, &seg.meta.time_system) else {
                    continue;
                };
                // RANGE is reported in km here (the fixture/range-units path); the
                // radiometric model is SI, so km → m. Doppler km/s → m/s.
                let value = obs.value * 1000.0;
                out.push(RadiometricObs {
                    kind,
                    way,
                    band,
                    epoch,
                    value,
                    sigma: 0.0,
                });
            }
        }
        out
    }
}

/// Route one metadata `key = value` pair into the [`TdmMeta`] structure. The
/// named keys land in their fields; `PARTICIPANT_n` is index-ordered; everything
/// else is appended to [`TdmMeta::other`] for round-trip.
fn apply_meta_key(meta: &mut TdmMeta, key: &str, value: &str) -> Result<(), String> {
    match key {
        "TIME_SYSTEM" => meta.time_system = value.to_string(),
        "MODE" => meta.mode = value.to_string(),
        "PATH" => meta.path = value.to_string(),
        "TRANSMIT_BAND" => meta.transmit_band = Some(value.to_string()),
        "RECEIVE_BAND" => meta.receive_band = Some(value.to_string()),
        "TURNAROUND_NUMERATOR" => {
            meta.turnaround_numerator = Some(
                value
                    .parse()
                    .map_err(|_| format!("TDM: bad TURNAROUND_NUMERATOR {value:?}"))?,
            )
        }
        "TURNAROUND_DENOMINATOR" => {
            meta.turnaround_denominator = Some(
                value
                    .parse()
                    .map_err(|_| format!("TDM: bad TURNAROUND_DENOMINATOR {value:?}"))?,
            )
        }
        "RANGE_UNITS" => meta.range_units = Some(value.to_string()),
        _ if key.starts_with("PARTICIPANT_") => {
            // Index-ordered; pad with empties if a higher index appears first so
            // PARTICIPANT_n lands at slot n-1.
            if let Ok(n) = key["PARTICIPANT_".len()..].parse::<usize>() {
                if n >= 1 {
                    if meta.participants.len() < n {
                        meta.participants.resize(n, String::new());
                    }
                    meta.participants[n - 1] = value.to_string();
                }
            }
        }
        _ => meta.other.push((key.to_string(), value.to_string())),
    }
    Ok(())
}

/// Whether `key` is a recognised data-section keyword (a `KEY = epoch value`
/// observable line) rather than a metadata key.
fn is_data_keyword(key: &str) -> bool {
    DATA_KEYWORDS.contains(&key)
}

/// Format a value for KVN output: an integer-valued float prints without a
/// decimal point (so `880.0` → `880`, matching `TURNAROUND_NUMERATOR = 880`),
/// otherwise full `{}` precision (round-trip-safe for the f64 value).
fn fmt_num(x: f64) -> String {
    if x.fract() == 0.0 && x.abs() < 1e15 {
        format!("{}", x as i64)
    } else {
        format!("{x}")
    }
}

/// Map a CCSDS `*_BAND` token to a [`Band`], or `None` if it is not one of the
/// three deep-space bands Kshana models.
fn parse_band(s: &str) -> Option<Band> {
    match s.to_ascii_uppercase().as_str() {
        "S" => Some(Band::S),
        "X" => Some(Band::X),
        "KA" => Some(Band::Ka),
        _ => None,
    }
}

/// Infer the [`ObsWay`] from a `PATH` value. `1,2` (or any length-2 path) is a
/// one-way down-leg; a length-3 path with equal first and last participant
/// (`1,2,1`) is two-way; any other length-3+ path (`1,2,3`) is three-way. Returns
/// `None` for a path that is empty or otherwise not interpretable.
fn path_to_way(path: &str) -> Option<ObsWay> {
    let parts: Vec<&str> = path
        .split(',')
        .map(str::trim)
        .filter(|p| !p.is_empty())
        .collect();
    match parts.len() {
        2 => Some(ObsWay::One),
        n if n >= 3 => {
            if parts.first() == parts.last() {
                Some(ObsWay::Two)
            } else {
                Some(ObsWay::Three)
            }
        }
        _ => None,
    }
}

/// Parse a CCSDS time tag (`yyyy-mm-ddTHH:MM:SS[.fff]`, the calendar form used
/// here) in time system `time_system` to a [`TwoPartJd`] in TDB. The day-of-year
/// CCSDS form (`yyyy-dddTHH:MM:SS`) is **not** handled — those records are skipped
/// by the bridge rather than mis-parsed. Recognised systems: `UTC`, `TAI`, `GPS`,
/// `TT`, `TDB`; anything else returns `None`.
fn parse_epoch_to_tdb(epoch: &str, time_system: &str) -> Option<TwoPartJd> {
    let (date, time) = epoch.split_once('T')?;
    let d: Vec<&str> = date.split('-').collect();
    if d.len() != 3 {
        // A two-field date (yyyy-ddd, day-of-year) is not supported here.
        return None;
    }
    let year: i32 = d[0].parse().ok()?;
    let month: u32 = d[1].parse().ok()?;
    let day: u32 = d[2].parse().ok()?;
    // Trim a trailing 'Z' if present.
    let time = time.strip_suffix('Z').unwrap_or(time);
    let t: Vec<&str> = time.split(':').collect();
    if t.len() != 3 {
        return None;
    }
    let hour: u32 = t[0].parse().ok()?;
    let minute: u32 = t[1].parse().ok()?;
    let second: f64 = t[2].parse().ok()?;

    let jd_in = timescales::julian_date(year, month, day, hour, minute, second);
    // Convert the tagged scale to TDB (the scale the radiometric epoch carries).
    let jd_tdb = match time_system.to_ascii_uppercase().as_str() {
        "UTC" => timescales::tt_to_tdb(timescales::utc_to_tt(jd_in)),
        "TAI" => timescales::tt_to_tdb(timescales::tai_to_tt(jd_in)),
        "GPS" => timescales::tt_to_tdb(timescales::gps_to_tt(jd_in)),
        "TT" => timescales::tt_to_tdb(jd_in),
        "TDB" => jd_in,
        _ => return None,
    };
    Some(TwoPartJd::from_f64(jd_tdb))
}

#[cfg(test)]
mod tests {
    use super::*;

    /// The hand-authored reference fixture (a CCSDS 503.0-B-2 KVN format example,
    /// not real measurements). Vendored so the parser is exercised against a file
    /// on disk, the way a real agency TDM would arrive.
    const REFERENCE_TDM: &str = include_str!("../tests/fixtures/deepspace/reference.tdm");

    #[test]
    fn tdm_parse_reference() {
        let f = TdmFile::parse(REFERENCE_TDM).expect("reference.tdm parses");
        // Header.
        assert_eq!(f.version, "2.0");
        assert_eq!(f.creation_date, "2026-06-14T00:00:00.000");
        assert_eq!(f.originator, "KSHANA");
        // One segment.
        assert_eq!(f.segments.len(), 1);
        let seg = &f.segments[0];
        // Metadata: required named fields routed correctly.
        assert_eq!(seg.meta.time_system, "UTC");
        assert_eq!(seg.meta.participants, vec!["DSS-25", "SPACECRAFT"]);
        assert_eq!(seg.meta.mode, "SEQUENTIAL");
        assert_eq!(seg.meta.path, "1,2,1");
        assert_eq!(seg.meta.transmit_band.as_deref(), Some("X"));
        assert_eq!(seg.meta.receive_band.as_deref(), Some("X"));
        assert_eq!(seg.meta.turnaround_numerator, Some(880.0));
        assert_eq!(seg.meta.turnaround_denominator, Some(749.0));
        assert_eq!(seg.meta.range_units.as_deref(), Some("km"));
        // The non-named optional keys are preserved for round-trip.
        assert!(seg
            .meta
            .other
            .iter()
            .any(|(k, v)| k == "START_TIME" && v == "2026-06-14T01:00:00.000"));
        assert!(seg
            .meta
            .other
            .iter()
            .any(|(k, _)| k == "INTEGRATION_INTERVAL"));
        // Observable count: 3 RANGE + 3 DOPPLER_INTEGRATED = 6 records.
        assert_eq!(seg.data.len(), 6);
        assert_eq!(seg.data.iter().filter(|o| o.key == "RANGE").count(), 3);
        assert_eq!(
            seg.data
                .iter()
                .filter(|o| o.key == "DOPPLER_INTEGRATED")
                .count(),
            3
        );
        // Spot-checked value: the first RANGE record.
        let first_range = seg.data.iter().find(|o| o.key == "RANGE").unwrap();
        assert_eq!(first_range.epoch, "2026-06-14T01:00:00.000");
        assert!(
            (first_range.value - 1.234_567_890_123_45e8).abs() < 1.0,
            "first RANGE value {} km off",
            first_range.value
        );
    }

    #[test]
    fn tdm_roundtrip() {
        // Semantic round trip: parse → emit → parse yields an equal structure,
        // and the emitted text re-parses cleanly.
        let f1 = TdmFile::parse(REFERENCE_TDM).expect("parse 1");
        let text = f1.to_tdm_string();
        let f2 = TdmFile::parse(&text).expect("emitted TDM re-parses");
        assert_eq!(f1, f2, "round-trip changed the parsed structure");

        // The emitted text carries the mandatory structural keywords.
        assert!(text.starts_with("CCSDS_TDM_VERS = 2.0\n"));
        assert_eq!(text.matches("META_START").count(), 1);
        assert_eq!(text.matches("META_STOP").count(), 1);
        assert_eq!(text.matches("DATA_START").count(), 1);
        assert_eq!(text.matches("DATA_STOP").count(), 1);
        // A data line survives in the canonical KEY = epoch value form.
        assert!(text.contains("RANGE = 2026-06-14T01:00:00.000"));
        assert!(text.contains("TURNAROUND_NUMERATOR = 880\n"));
    }

    #[test]
    fn tdm_to_radiometric() {
        let f = TdmFile::parse(REFERENCE_TDM).expect("parse");
        let obs = f.to_radiometric_obs();
        // All 6 RANGE/DOPPLER records map (the fixture has no angle/freq lines).
        assert_eq!(obs.len(), 6);

        let ranges: Vec<&RadiometricObs> =
            obs.iter().filter(|o| o.kind == ObsKind::Range).collect();
        let dopplers: Vec<&RadiometricObs> =
            obs.iter().filter(|o| o.kind == ObsKind::Doppler).collect();
        assert_eq!(ranges.len(), 3);
        assert_eq!(dopplers.len(), 3);

        // Two-way X-band link inferred from PATH = 1,2,1 and TRANSMIT_BAND = X.
        for o in &obs {
            assert_eq!(o.way, ObsWay::Two);
            assert_eq!(o.band, Band::X);
            assert_eq!(o.sigma, 0.0);
        }
        // RANGE km → m (×1000): first record 1.23456789012345e8 km → ~1.2346e11 m.
        assert!(
            (ranges[0].value - 1.234_567_890_123_45e11).abs() < 1e3,
            "range value {} m off",
            ranges[0].value
        );
        // DOPPLER km/s → m/s: first record -1.234567890 km/s → -1234.56789 m/s.
        assert!(
            (dopplers[0].value - (-1_234.567_89)).abs() < 1e-3,
            "doppler value {} m/s off",
            dopplers[0].value
        );
    }

    #[test]
    fn path_to_way_classifies_links() {
        assert_eq!(path_to_way("1,2"), Some(ObsWay::One));
        assert_eq!(path_to_way("1,2,1"), Some(ObsWay::Two));
        assert_eq!(path_to_way("1,2,3"), Some(ObsWay::Three));
        assert_eq!(path_to_way(""), None);
        assert_eq!(path_to_way("1"), None);
    }

    #[test]
    fn parse_band_recognises_deep_space_bands() {
        assert_eq!(parse_band("S"), Some(Band::S));
        assert_eq!(parse_band("X"), Some(Band::X));
        assert_eq!(parse_band("KA"), Some(Band::Ka));
        assert_eq!(parse_band("ka"), Some(Band::Ka));
        assert_eq!(parse_band("L"), None);
    }

    #[test]
    fn multi_segment_parse_and_count() {
        // Two minimal segments in one file: a two-way range pass and a one-way
        // Doppler pass. Confirms the segment state machine resets per block.
        let text = "\
CCSDS_TDM_VERS = 2.0
CREATION_DATE = 2026-06-14T00:00:00.000
ORIGINATOR = KSHANA
META_START
TIME_SYSTEM = UTC
PARTICIPANT_1 = DSS-25
PARTICIPANT_2 = SC
MODE = SEQUENTIAL
PATH = 1,2,1
TRANSMIT_BAND = X
RECEIVE_BAND = X
RANGE_UNITS = km
META_STOP
DATA_START
RANGE = 2026-06-14T01:00:00.000 1.0E+08
DATA_STOP
META_START
TIME_SYSTEM = UTC
PARTICIPANT_1 = SC
PARTICIPANT_2 = DSS-25
MODE = SEQUENTIAL
PATH = 1,2
RECEIVE_BAND = S
META_STOP
DATA_START
DOPPLER_INSTANTANEOUS = 2026-06-14T02:00:00.000 -0.5
DATA_STOP
";
        let f = TdmFile::parse(text).expect("multi-segment parses");
        assert_eq!(f.segments.len(), 2);
        assert_eq!(f.segments[0].data.len(), 1);
        assert_eq!(f.segments[1].data.len(), 1);
        let obs = f.to_radiometric_obs();
        assert_eq!(obs.len(), 2);
        // First is a two-way X-band range, second a one-way S-band Doppler.
        assert_eq!(obs[0].kind, ObsKind::Range);
        assert_eq!(obs[0].way, ObsWay::Two);
        assert_eq!(obs[0].band, Band::X);
        assert_eq!(obs[1].kind, ObsKind::Doppler);
        assert_eq!(obs[1].way, ObsWay::One);
        assert_eq!(obs[1].band, Band::S);
    }

    #[test]
    fn missing_version_header_is_an_error() {
        let text = "CREATION_DATE = 2026-06-14T00:00:00.000\nORIGINATOR = KSHANA\n";
        assert!(TdmFile::parse(text).is_err());
    }

    #[test]
    fn unterminated_segment_is_an_error() {
        let text = "\
CCSDS_TDM_VERS = 2.0
CREATION_DATE = 2026-06-14T00:00:00.000
ORIGINATOR = KSHANA
META_START
TIME_SYSTEM = UTC
PARTICIPANT_1 = DSS-25
PATH = 1,2,1
META_STOP
DATA_START
RANGE = 2026-06-14T01:00:00.000 1.0E+08
";
        assert!(TdmFile::parse(text).is_err());
    }

    #[test]
    fn comments_and_blank_lines_are_tolerated() {
        let text = "\
CCSDS_TDM_VERS = 2.0
COMMENT a header note

CREATION_DATE = 2026-06-14T00:00:00.000
ORIGINATOR = KSHANA

META_START
COMMENT a metadata note
TIME_SYSTEM = UTC
PARTICIPANT_1 = DSS-25
PARTICIPANT_2 = SC
PATH = 1,2,1
TRANSMIT_BAND = X
META_STOP
DATA_START
COMMENT a data note
RANGE = 2026-06-14T01:00:00.000 1.0E+08

DATA_STOP
";
        let f = TdmFile::parse(text).expect("comments tolerated");
        assert_eq!(f.segments.len(), 1);
        assert_eq!(f.segments[0].data.len(), 1);
    }
}
