// SPDX-License-Identifier: Apache-2.0
//! SP3-c/d precise-ephemeris reader.
//!
//! SP3 (Standard Product 3) is the format the IGS and the analysis centres
//! distribute precise GNSS orbits and clocks in: a tabulated time series of
//! Earth-fixed (ECEF) satellite positions and clock offsets, sampled every
//! 15 minutes (or finer). Where a RINEX navigation file carries the *broadcast*
//! ephemeris a receiver decodes, an SP3 file carries the *post-processed* truth
//! that PPP engines (Ginan, RTKLIB, gLAB) treat as reference. Reading it is what
//! lets this engine consume the IGS archive rather than only its own synthetic
//! orbits.
//!
//! This module parses the SP3-c and SP3-d position records into an [`Sp3File`]:
//! the header (version, epoch grid, satellite list) and, for each epoch, every
//! satellite's ECEF position (converted km → m) and clock offset (µs), plus the
//! velocity record when the file is a `V` (position+velocity) product.
//!
//! Scope (this stage): parsing into a structured table. Polynomial interpolation
//! between epochs and exposing SP3 as a [`crate::orbit::Propagator`] source — and
//! SP3 *export* of Kshana states — are the next steps. The bad-value sentinels
//! (positions of exactly 0, clock 999999.999999) are preserved as parsed, not
//! silently rewritten, so a caller can decide how to treat them.

use crate::rinex::EpochUtc;
use serde::Serialize;

/// The SP3 "bad or absent clock" sentinel: a clock value of `999999.999999` µs
/// means the clock is unavailable for that satellite/epoch (SP3 specification).
pub const BAD_CLOCK_US: f64 = 999_999.999_999;

/// One satellite's state at one epoch: ECEF position (m), clock offset (µs), and
/// — for a `V` product — ECEF velocity (m/s). Velocity is `None` for a
/// position-only (`P`) file.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct Sp3SatState {
    /// Satellite identifier, e.g. `"G01"` (system letter + two-digit PRN).
    pub sat: String,
    /// ECEF position (m). SP3 stores kilometres; this is converted to metres.
    pub pos_m: [f64; 3],
    /// Satellite clock offset (µs). Equals [`BAD_CLOCK_US`] when unavailable.
    pub clock_us: f64,
    /// ECEF velocity (m/s) when the file carries `V` records; SP3 stores dm/s,
    /// converted here to m/s.
    #[serde(skip_serializing_if = "Option::is_none")]
    pub vel_m_s: Option<[f64; 3]>,
}

impl Sp3SatState {
    /// True when the clock field is the SP3 "unavailable" sentinel.
    pub fn clock_is_bad(&self) -> bool {
        (self.clock_us - BAD_CLOCK_US).abs() < 1e-6
    }
}

/// All satellite states at one epoch.
#[derive(Clone, Debug, Serialize)]
pub struct Sp3Epoch {
    /// Epoch time (the SP3 calendar time, GPS time scale).
    pub time: EpochUtc,
    /// Per-satellite states recorded at this epoch.
    pub sats: Vec<Sp3SatState>,
}

/// The SP3 file header.
#[derive(Clone, Debug, Serialize)]
pub struct Sp3Header {
    /// Format version letter (`'c'` or `'d'`).
    pub version: char,
    /// `true` for a `V` (position+velocity) product, `false` for `P` (position).
    pub has_velocity: bool,
    /// First epoch (start of the time series).
    pub start: EpochUtc,
    /// Number of epochs declared in the header.
    pub num_epochs: usize,
    /// Satellite identifiers listed in the `+` header records.
    pub sat_ids: Vec<String>,
}

/// A parsed SP3 precise-ephemeris file.
#[derive(Clone, Debug, Serialize)]
pub struct Sp3File {
    pub header: Sp3Header,
    pub epochs: Vec<Sp3Epoch>,
}

impl Sp3File {
    /// The satellite identifiers actually present in the parsed epoch records
    /// (deduplicated, in first-seen order). May differ from the header list if a
    /// file is truncated.
    pub fn observed_satellites(&self) -> Vec<String> {
        let mut seen = Vec::new();
        for epoch in &self.epochs {
            for s in &epoch.sats {
                if !seen.contains(&s.sat) {
                    seen.push(s.sat.clone());
                }
            }
        }
        seen
    }

    /// The ECEF position (m) of satellite `sat` at epoch index `idx`, if present.
    pub fn position_of(&self, sat: &str, idx: usize) -> Option<[f64; 3]> {
        self.epochs
            .get(idx)?
            .sats
            .iter()
            .find(|s| s.sat == sat)
            .map(|s| s.pos_m)
    }
}

/// Parse a calendar epoch from the six whitespace-separated fields
/// `year month day hour minute second`.
fn parse_epoch(tokens: &[&str]) -> Result<EpochUtc, String> {
    if tokens.len() < 6 {
        return Err(format!("epoch needs 6 time fields, got {}", tokens.len()));
    }
    let p_i = |s: &str, what: &str| s.parse::<i64>().map_err(|_| format!("bad {what}: {s:?}"));
    Ok(EpochUtc {
        year: p_i(tokens[0], "year")? as i32,
        month: p_i(tokens[1], "month")? as u32,
        day: p_i(tokens[2], "day")? as u32,
        hour: p_i(tokens[3], "hour")? as u32,
        minute: p_i(tokens[4], "minute")? as u32,
        second: tokens[5]
            .parse::<f64>()
            .map_err(|_| format!("bad second: {:?}", tokens[5]))?,
    })
}

/// Parse the `sat X Y Z clock` fields of a `P`/`V` record body (everything after
/// the leading `P`/`V` and the three-character satellite id). Returns the three
/// coordinates and the clock value as written (units converted by the caller).
fn parse_record_values(body: &str) -> Result<[f64; 4], String> {
    let nums: Vec<f64> = body
        .split_whitespace()
        .take(4)
        .map(|t| t.parse::<f64>().map_err(|_| format!("bad number: {t:?}")))
        .collect::<Result<_, _>>()?;
    if nums.len() < 4 {
        return Err(format!("record needs 4 values, got {}", nums.len()));
    }
    Ok([nums[0], nums[1], nums[2], nums[3]])
}

/// Parse an SP3-c or SP3-d file into an [`Sp3File`]. The header line, the `+`
/// satellite-list records, the `*` epoch headers, and the `P`/`V` position
/// (and velocity) records are read; other header lines are skipped. Parsing
/// stops at the `EOF` trailer or end of input.
pub fn parse_sp3(text: &str) -> Result<Sp3File, String> {
    let mut lines = text.lines();

    // --- Line 1: version, P/V mode, start epoch, number of epochs. ---
    let first = lines.next().ok_or("empty SP3 input")?;
    if !first.starts_with('#') {
        return Err(format!("first line is not an SP3 header: {first:?}"));
    }
    let version = first
        .chars()
        .nth(1)
        .filter(|c| *c == 'c' || *c == 'd')
        .ok_or_else(|| format!("unsupported SP3 version in {first:?}"))?;
    let has_velocity = first.chars().nth(2) == Some('V');
    // After the `#cP` prefix the rest is whitespace-separated: the 6 epoch
    // fields then the epoch count.
    let rest: Vec<&str> = first.get(3..).unwrap_or("").split_whitespace().collect();
    let start = parse_epoch(&rest)?;
    let num_epochs: usize = rest
        .get(6)
        .ok_or("missing epoch count on header line 1")?
        .parse()
        .map_err(|_| "bad epoch count")?;

    // --- `+` records: satellite identifiers (three characters each from col 9). ---
    let mut sat_ids = Vec::new();
    let mut epochs: Vec<Sp3Epoch> = Vec::new();
    let mut current: Option<Sp3Epoch> = None;

    for line in lines {
        if line.starts_with("++") || line.starts_with("%") || line.starts_with("/*") {
            continue;
        }
        if let Some(rest) = line.strip_prefix('+') {
            // Satellite ids are packed three characters each, starting at column 9
            // of the full line → offset 8 after stripping the leading '+'.
            let ids = rest.get(8..).unwrap_or("");
            let bytes = ids.as_bytes();
            let mut i = 0;
            while i + 3 <= bytes.len() {
                let chunk = &ids[i..i + 3];
                let c0 = chunk.as_bytes()[0];
                // A real id is a system letter followed by two digits; "  0"/"000"
                // padding entries are skipped.
                if c0.is_ascii_uppercase() && chunk[1..].bytes().all(|b| b.is_ascii_digit()) {
                    sat_ids.push(chunk.to_string());
                }
                i += 3;
            }
            continue;
        }
        if line.starts_with("EOF") {
            break;
        }
        if let Some(rest) = line.strip_prefix('*') {
            // New epoch header: flush the one in progress.
            if let Some(e) = current.take() {
                epochs.push(e);
            }
            let tokens: Vec<&str> = rest.split_whitespace().collect();
            current = Some(Sp3Epoch {
                time: parse_epoch(&tokens)?,
                sats: Vec::new(),
            });
            continue;
        }
        let is_pos = line.starts_with('P');
        let is_vel = line.starts_with('V');
        if is_pos || is_vel {
            let sat = line
                .get(1..4)
                .map(|s| s.trim().to_string())
                .filter(|s| !s.is_empty())
                .ok_or_else(|| format!("record has no satellite id: {line:?}"))?;
            let vals = parse_record_values(line.get(4..).unwrap_or(""))?;
            let epoch = current
                .as_mut()
                .ok_or("position record before any epoch header")?;
            if is_pos {
                epoch.sats.push(Sp3SatState {
                    sat,
                    pos_m: [vals[0] * 1000.0, vals[1] * 1000.0, vals[2] * 1000.0],
                    clock_us: vals[3],
                    vel_m_s: None,
                });
            } else if let Some(state) = epoch.sats.iter_mut().rev().find(|s| s.sat == sat) {
                // SP3 dm/s → m/s.
                state.vel_m_s = Some([vals[0] * 0.1, vals[1] * 0.1, vals[2] * 0.1]);
            }
        }
    }
    if let Some(e) = current.take() {
        epochs.push(e);
    }

    if epochs.is_empty() {
        return Err("SP3 file contained no epoch records".into());
    }

    Ok(Sp3File {
        header: Sp3Header {
            version,
            has_velocity,
            start,
            num_epochs,
            sat_ids,
        },
        epochs,
    })
}

#[cfg(test)]
mod tests {
    use super::*;

    // A minimal but format-valid SP3-c position file: two epochs, two GPS
    // satellites, 15-minute spacing. Positions are in km, clocks in µs.
    const SAMPLE: &str = "\
#cP2023  1  1  0  0  0.00000000       2 ORBIT IGS14 HLM  IGS
## 2244 172800.00000000   900.00000000 59945 0.0000000000000
+    2   G01G02  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0
++         2  2  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0
%c G  cc GPS ccc cccc cccc cccc cccc ccccc ccccc ccccc ccccc
%f  1.2500000  1.025000000  0.00000000000  0.000000000000000
%i    0    0    0    0      0      0      0      0         0
/* SYNTHETIC SP3 FIXTURE FOR TESTING
*  2023  1  1  0  0  0.00000000
PG01  15000.000000  -5000.000000  20000.000000    123.456789
PG02 -10000.000000  18000.000000  -8000.000000 999999.999999
*  2023  1  1  0 15  0.00000000
PG01  15100.000000  -5100.000000  20100.000000    124.000000
PG02 -10100.000000  18100.000000  -8100.000000    -46.000000
EOF";

    #[test]
    fn parses_header_fields() {
        let f = parse_sp3(SAMPLE).expect("parses");
        assert_eq!(f.header.version, 'c');
        assert!(!f.header.has_velocity);
        assert_eq!(f.header.num_epochs, 2);
        assert_eq!(f.header.start.year, 2023);
        assert_eq!(f.header.start.month, 1);
        assert_eq!(f.header.start.day, 1);
        assert_eq!(f.header.sat_ids, vec!["G01", "G02"]);
    }

    #[test]
    fn parses_epochs_and_positions_km_to_m() {
        let f = parse_sp3(SAMPLE).expect("parses");
        assert_eq!(f.epochs.len(), 2);
        // First epoch, G01 position: km → m.
        let p = f.position_of("G01", 0).expect("G01 at epoch 0");
        assert_eq!(p, [15_000_000.0, -5_000_000.0, 20_000_000.0]);
        // Clock carried through in µs.
        let g01 = &f.epochs[0].sats[0];
        assert_eq!(g01.sat, "G01");
        assert!((g01.clock_us - 123.456789).abs() < 1e-6);
        // Second epoch time advances 15 minutes.
        assert_eq!(f.epochs[1].time.minute, 15);
        assert_eq!(
            f.position_of("G02", 1).unwrap(),
            [-10_100_000.0, 18_100_000.0, -8_100_000.0]
        );
    }

    #[test]
    fn flags_the_bad_clock_sentinel() {
        let f = parse_sp3(SAMPLE).unwrap();
        // G02 at epoch 0 has the 999999.999999 sentinel.
        let g02 = &f.epochs[0].sats[1];
        assert!(g02.clock_is_bad());
        // G01 has a real clock.
        assert!(!f.epochs[0].sats[0].clock_is_bad());
    }

    #[test]
    fn observed_satellites_lists_each_once() {
        let f = parse_sp3(SAMPLE).unwrap();
        assert_eq!(f.observed_satellites(), vec!["G01", "G02"]);
    }

    #[test]
    fn parses_a_velocity_product() {
        // A `V`-mode file pairs each P record with a V record (dm/s).
        let vfile = "\
#dV2023  1  1  0  0  0.00000000       1 ORBIT IGS20 HLM  IGS
+    1   G01  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0
*  2023  1  1  0  0  0.00000000
PG01  15000.000000  -5000.000000  20000.000000    123.456789
VG01  -8000.000000   3000.000000  39000.000000      0.000000
EOF";
        let f = parse_sp3(vfile).expect("parses V file");
        assert_eq!(f.header.version, 'd');
        assert!(f.header.has_velocity);
        let v = f.epochs[0].sats[0].vel_m_s.expect("velocity present");
        // dm/s → m/s: -8000 dm/s = -800 m/s.
        assert_eq!(v, [-800.0, 300.0, 3900.0]);
    }

    #[test]
    fn rejects_non_sp3_and_empty_input() {
        assert!(parse_sp3("").is_err());
        assert!(parse_sp3("not an sp3 file").is_err());
        // Header but no epoch records.
        assert!(parse_sp3("#cP2023  1  1  0  0  0.00000000       0 ORBIT").is_err());
    }
}
