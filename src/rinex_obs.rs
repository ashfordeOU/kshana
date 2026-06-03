// SPDX-License-Identifier: Apache-2.0
//! RINEX 3.0x / 4.00 observation-file parser.
//!
//! Where [`crate::rinex`] reads the *navigation* message (the broadcast ephemeris
//! a satellite transmits), this module reads the other half of RINEX: the
//! **observation** file — the receiver's actual measurements. Each epoch records,
//! per tracked satellite, the observables the receiver formed: pseudorange,
//! carrier phase, Doppler, and signal strength, each tagged by a RINEX 3
//! three-character observation code (`C1C`, `L1C`, `D1C`, `S1C`, …) that names the
//! quantity, band, and tracking channel. This is the format RTKLIB, gLAB, and the
//! IGS station network distribute raw GNSS measurements in; ingesting it is what
//! lets a real receiver log feed this engine rather than only synthetic geometry.
//!
//! The parser handles the RINEX 3.0x and 4.00 observation layout (they share the
//! same epoch/observation record structure; RINEX 4 adds new *navigation* header
//! records, which do not affect observation files). It reads the header it needs —
//! the version/type line, the per-system `SYS / # / OBS TYPES` lists (with
//! continuation lines), the approximate receiver position, the sampling interval,
//! and the time of first observation — then each epoch's `>`-prefixed header and
//! its one-line-per-satellite observation records, decoding the fixed-width
//! `F14.3` value fields with their loss-of-lock (LLI) and signal-strength (SSI)
//! flags. A blank observation field is preserved as *absent* (`None`), not `0.0`.
//!
//! Scope (this stage): the parser only — observations are read into typed records
//! keyed by their RINEX code. This is **not** a positioning engine: there is no
//! pseudorange solution, no PPP/RTK, no atmospheric or clock modelling here (the
//! engine's honest GNSS scope; for real-signal processing use RTKLIB/gLAB). What
//! it provides is the standards-format ingest — a real observation file in, typed
//! measurements out.

use crate::rinex::{col, parse_d, EpochUtc};
use serde::Serialize;

/// The header fields of a RINEX observation file that this engine reads.
#[derive(Clone, Debug, Serialize)]
pub struct ObsHeader {
    /// RINEX format version (e.g. `3.04`).
    pub version: f64,
    /// Satellite-system character from the version/type line: `'M'` for a mixed
    /// (multi-constellation) file, or a single system letter.
    pub system: char,
    /// The observation codes defined for each satellite system, as
    /// `(system letter, [codes])` — the order is the order observations appear in
    /// each of that system's records.
    pub obs_types: Vec<(char, Vec<String>)>,
    /// Approximate receiver position (ECEF m), if the header carried it.
    pub approx_xyz: Option<[f64; 3]>,
    /// Nominal sampling interval (s), if declared.
    pub interval_s: Option<f64>,
    /// Time of the first observation, if declared.
    pub time_of_first_obs: Option<EpochUtc>,
}

impl ObsHeader {
    /// The observation codes defined for satellite system `system` (`'G'`, `'E'`,
    /// `'R'`, `'C'`, `'J'`, `'S'`), in record order.
    pub fn codes_for(&self, system: char) -> Option<&[String]> {
        self.obs_types
            .iter()
            .find(|(s, _)| *s == system)
            .map(|(_, v)| v.as_slice())
    }
}

/// One observation: the measured value with its RINEX loss-of-lock indicator
/// (LLI) and signal-strength indicator (SSI) flags when present.
#[derive(Clone, Copy, Debug, PartialEq, Serialize)]
pub struct Observation {
    /// The measured value, in the units of its observation code (pseudorange and
    /// carrier phase in metres/cycles, Doppler in Hz, signal strength in dB-Hz or
    /// the 1–9 RINEX scale).
    pub value: f64,
    /// Loss-of-lock indicator (RINEX LLI), if the field carried a flag digit.
    pub lli: Option<u8>,
    /// Signal-strength indicator (RINEX SSI, 1–9), if present.
    pub ssi: Option<u8>,
}

/// All observations recorded for one satellite at one epoch, aligned positionally
/// to that satellite's system observation codes ([`ObsHeader::codes_for`]). An
/// entry is `None` where the receiver reported no value for that code.
#[derive(Clone, Debug, Serialize)]
pub struct SatObs {
    /// Satellite identifier, e.g. `"G01"` (system letter + two-digit PRN).
    pub sat: String,
    /// Observations in the same order as the system's codes.
    pub obs: Vec<Option<Observation>>,
}

/// One observation epoch: its time, the RINEX epoch flag (0 = OK), and the
/// per-satellite observations.
#[derive(Clone, Debug, Serialize)]
pub struct ObsEpoch {
    pub time: EpochUtc,
    /// RINEX epoch flag (0 = OK; non-zero marks special event records).
    pub flag: u8,
    pub sats: Vec<SatObs>,
}

/// A parsed RINEX observation file: the header and the observation epochs.
#[derive(Clone, Debug, Serialize)]
pub struct RinexObs {
    pub header: ObsHeader,
    pub epochs: Vec<ObsEpoch>,
}

impl RinexObs {
    /// The measured value of observation `code` for satellite `sat` at epoch index
    /// `epoch_idx`, if that satellite was observed at that epoch and the code is
    /// defined and present.
    pub fn observation(&self, epoch_idx: usize, sat: &str, code: &str) -> Option<f64> {
        let codes = self.header.codes_for(sat.chars().next()?)?;
        let k = codes.iter().position(|c| c == code)?;
        let sv = self
            .epochs
            .get(epoch_idx)?
            .sats
            .iter()
            .find(|s| s.sat == sat)?;
        sv.obs.get(k)?.as_ref().map(|o| o.value)
    }

    /// The satellite identifiers observed anywhere in the file (deduplicated, in
    /// first-seen order).
    pub fn satellites(&self) -> Vec<String> {
        let mut seen = Vec::new();
        for e in &self.epochs {
            for s in &e.sats {
                if !seen.contains(&s.sat) {
                    seen.push(s.sat.clone());
                }
            }
        }
        seen
    }
}

/// Parse an integer field, treating blank as an error only when `what` is required.
fn parse_i(s: &str, what: &str) -> Result<i64, String> {
    s.trim()
        .parse::<i64>()
        .map_err(|_| format!("bad {what}: {s:?}"))
}

/// Parse one observation epoch header line (the `>`-prefixed line): the calendar
/// time, the epoch flag, and the satellite count.
fn parse_epoch_header(line: &str) -> Result<(EpochUtc, u8, usize), String> {
    let time = EpochUtc {
        year: parse_i(col(line, 2, 6), "year")? as i32,
        month: parse_i(col(line, 7, 9), "month")? as u32,
        day: parse_i(col(line, 10, 12), "day")? as u32,
        hour: parse_i(col(line, 13, 15), "hour")? as u32,
        minute: parse_i(col(line, 16, 18), "minute")? as u32,
        second: parse_d(col(line, 18, 29))?,
    };
    let flag = parse_i(col(line, 31, 32), "epoch flag").unwrap_or(0) as u8;
    let nsat = parse_i(col(line, 32, 35), "satellite count")? as usize;
    Ok((time, flag, nsat))
}

/// Parse one satellite observation record against its system's `codes`. Each
/// observation occupies a 16-column field: an `F14.3` value followed by the
/// one-character LLI and SSI flags. A blank value field is `None`.
fn parse_sat_record(line: &str, codes: &[String]) -> SatObs {
    let sat = col(line, 0, 3).trim().to_string();
    let mut obs = Vec::with_capacity(codes.len());
    for k in 0..codes.len() {
        let base = 3 + k * 16;
        let field = col(line, base, base + 14);
        if field.trim().is_empty() {
            obs.push(None);
            continue;
        }
        let value = match parse_d(field) {
            Ok(v) => v,
            Err(_) => {
                obs.push(None);
                continue;
            }
        };
        let flag = |c: &str| c.trim().parse::<u8>().ok();
        obs.push(Some(Observation {
            value,
            lli: flag(col(line, base + 14, base + 15)),
            ssi: flag(col(line, base + 15, base + 16)),
        }));
    }
    SatObs { sat, obs }
}

/// Parse a RINEX 3.0x / 4.00 observation file into a [`RinexObs`]. The header is
/// read up to and including `END OF HEADER`, then each `>`-prefixed epoch header
/// is followed by its declared number of one-line-per-satellite records. Header
/// records this engine does not use are skipped, so a richer real file still
/// parses.
pub fn parse_obs(text: &str) -> Result<RinexObs, String> {
    let lines: Vec<&str> = text.lines().collect();

    // --- Header ---
    let mut version = 0.0;
    let mut system = ' ';
    let mut obs_types: Vec<(char, Vec<String>)> = Vec::new();
    let mut counts: Vec<usize> = Vec::new();
    let mut cur: Option<usize> = None;
    let mut approx_xyz = None;
    let mut interval_s = None;
    let mut time_of_first_obs = None;

    let mut i = 0;
    let mut header_ended = false;
    while i < lines.len() {
        let line = lines[i];
        i += 1;
        if line.contains("RINEX VERSION / TYPE") {
            version = parse_d(col(line, 0, 9)).unwrap_or(0.0);
            system = col(line, 40, 41).chars().next().unwrap_or(' ');
        } else if line.contains("SYS / # / OBS TYPES") {
            let sysc = col(line, 0, 1).chars().next().unwrap_or(' ');
            if sysc.is_ascii_alphabetic() {
                let n = parse_i(col(line, 3, 6), "obs type count")? as usize;
                obs_types.push((sysc, Vec::new()));
                counts.push(n);
                cur = Some(obs_types.len() - 1);
            }
            // Read the codes carried on this line into the current system, up to
            // its declared count (the rest arrive on continuation lines, which
            // have a blank system field and reuse `cur`).
            if let Some(c) = cur {
                let want = counts[c];
                for k in 0..13 {
                    if obs_types[c].1.len() >= want {
                        break;
                    }
                    let code = col(line, 7 + k * 4, 10 + k * 4).trim();
                    if !code.is_empty() {
                        obs_types[c].1.push(code.to_string());
                    }
                }
            }
        } else if line.contains("APPROX POSITION XYZ") {
            approx_xyz = Some([
                parse_d(col(line, 0, 14))?,
                parse_d(col(line, 14, 28))?,
                parse_d(col(line, 28, 42))?,
            ]);
        } else if line.contains("INTERVAL") {
            interval_s = parse_d(col(line, 0, 10)).ok();
        } else if line.contains("TIME OF FIRST OBS") {
            time_of_first_obs = Some(EpochUtc {
                year: parse_i(col(line, 0, 6), "year")? as i32,
                month: parse_i(col(line, 6, 12), "month")? as u32,
                day: parse_i(col(line, 12, 18), "day")? as u32,
                hour: parse_i(col(line, 18, 24), "hour")? as u32,
                minute: parse_i(col(line, 24, 30), "minute")? as u32,
                second: parse_d(col(line, 30, 43))?,
            });
        } else if line.contains("END OF HEADER") {
            header_ended = true;
            break;
        }
    }
    if !header_ended {
        return Err("RINEX observation file has no END OF HEADER".into());
    }
    let header = ObsHeader {
        version,
        system,
        obs_types,
        approx_xyz,
        interval_s,
        time_of_first_obs,
    };

    // --- Observation epochs ---
    let mut epochs = Vec::new();
    while i < lines.len() {
        let line = lines[i];
        if !line.starts_with('>') {
            i += 1;
            continue;
        }
        let (time, flag, nsat) = parse_epoch_header(line)?;
        i += 1;
        let mut sats = Vec::with_capacity(nsat);
        for _ in 0..nsat {
            if i >= lines.len() {
                break;
            }
            let rec = lines[i];
            i += 1;
            let sysc = rec.chars().next().unwrap_or(' ');
            let codes = header.codes_for(sysc).unwrap_or(&[]);
            sats.push(parse_sat_record(rec, codes));
        }
        epochs.push(ObsEpoch { time, flag, sats });
    }

    if epochs.is_empty() {
        return Err("RINEX observation file contained no epoch records".into());
    }

    Ok(RinexObs { header, epochs })
}

#[cfg(test)]
mod tests {
    use super::*;

    // RINEX is a fixed-column format, so the test fixtures are built by placing
    // each field at its exact start column rather than by hand-counting spaces
    // (which silently drifts). `place` writes the given `(column, text)` pairs —
    // which must be in increasing, non-overlapping column order — into a blank
    // line; `hdr` additionally pads to column 60 and appends the record label.
    fn place(fields: &[(usize, &str)]) -> String {
        let mut s = String::new();
        for (col, val) in fields {
            if s.len() < *col {
                s.push_str(&" ".repeat(col - s.len()));
            }
            s.push_str(val);
        }
        s
    }
    fn hdr(fields: &[(usize, &str)], label: &str) -> String {
        let mut s = place(fields);
        if s.len() < 60 {
            s.push_str(&" ".repeat(60 - s.len()));
        }
        s.push_str(label);
        s
    }

    // A column-exact RINEX 3.04 observation sample: GPS, four observation codes
    // (pseudorange/carrier/Doppler/signal-strength), two epochs. Each observation
    // is an F14.3 value (LLI/SSI flags in the two columns that follow).
    fn sample() -> String {
        let v = |x: f64| format!("{x:14.3}");
        let lines = vec![
            hdr(
                &[(0, "     3.04"), (20, "O"), (40, "M")],
                "RINEX VERSION / TYPE",
            ),
            hdr(
                &[
                    (0, "G"),
                    (3, "  4"),
                    (7, "C1C"),
                    (11, "L1C"),
                    (15, "D1C"),
                    (19, "S1C"),
                ],
                "SYS / # / OBS TYPES",
            ),
            hdr(
                &[
                    (0, "  3925260.6062"),
                    (14, "   211071.9779"),
                    (28, "  4923657.4796"),
                ],
                "APPROX POSITION XYZ",
            ),
            hdr(&[(0, "    30.000")], "INTERVAL"),
            hdr(
                &[
                    (0, "  2021"),
                    (6, "     1"),
                    (12, "     1"),
                    (18, "     0"),
                    (24, "     0"),
                    (30, "    0.0000000"),
                    (48, "GPS"),
                ],
                "TIME OF FIRST OBS",
            ),
            hdr(&[], "END OF HEADER"),
            // Epoch 0: two satellites.
            place(&[
                (0, ">"),
                (2, "2021"),
                (7, "01"),
                (10, "01"),
                (13, "00"),
                (16, "00"),
                (18, "  0.0000000"),
                (31, "0"),
                (32, "  2"),
            ]),
            place(&[
                (0, "G01"),
                (3, &v(23_629_347.915)),
                (17, "7"),
                (19, &v(124_426_702.303)),
                (33, "0"),
                (34, "8"),
                (35, &v(-1042.231)),
                (49, "7"),
                (51, &v(43.500)),
            ]),
            place(&[
                (0, "G02"),
                (3, &v(20_891_534.648)),
                (17, "8"),
                (19, &v(109_765_432.121)),
                (33, "0"),
                (34, "9"),
                (35, &v(1543.872)),
                (49, "8"),
                (51, &v(48.250)),
            ]),
            // Epoch 1: 30 s later, one satellite.
            place(&[
                (0, ">"),
                (2, "2021"),
                (7, "01"),
                (10, "01"),
                (13, "00"),
                (16, "00"),
                (18, " 30.0000000"),
                (31, "0"),
                (32, "  1"),
            ]),
            place(&[
                (0, "G01"),
                (3, &v(23_625_000.100)),
                (17, "7"),
                (19, &v(124_400_000.000)),
                (33, "0"),
                (34, "7"),
                (35, &v(-1040.000)),
                (49, "7"),
                (51, &v(44.000)),
            ]),
        ];
        lines.join("\n") + "\n"
    }

    #[test]
    fn parses_header_fields() {
        let f = parse_obs(&sample()).expect("parses");
        assert!((f.header.version - 3.04).abs() < 1e-9);
        assert_eq!(f.header.system, 'M');
        assert_eq!(
            f.header.codes_for('G').unwrap(),
            &["C1C", "L1C", "D1C", "S1C"]
        );
        let p = f.header.approx_xyz.expect("approx pos");
        assert!((p[0] - 3925260.6062).abs() < 1e-3);
        assert!((p[2] - 4923657.4796).abs() < 1e-3);
        assert!((f.header.interval_s.unwrap() - 30.0).abs() < 1e-6);
        let t = f.header.time_of_first_obs.expect("tfo");
        assert_eq!(t.year, 2021);
        assert_eq!(t.month, 1);
    }

    #[test]
    fn parses_observations_with_flags() {
        let f = parse_obs(&sample()).unwrap();
        assert_eq!(f.epochs.len(), 2);
        assert_eq!(f.epochs[0].sats.len(), 2);
        // Epoch 0, G01: pseudorange C1C with LLI 7, carrier L1C with LLI 0 / SSI 8.
        let g01 = &f.epochs[0].sats[0];
        assert_eq!(g01.sat, "G01");
        let c1c = g01.obs[0].expect("C1C present");
        assert!((c1c.value - 23_629_347.915).abs() < 1e-3);
        assert_eq!(c1c.lli, Some(7));
        let l1c = g01.obs[1].expect("L1C present");
        assert!((l1c.value - 124_426_702.303).abs() < 1e-3);
        assert_eq!(l1c.lli, Some(0));
        assert_eq!(l1c.ssi, Some(8));
        // Doppler is negative (approaching → closing range rate sign convention).
        assert!((g01.obs[2].unwrap().value - (-1042.231)).abs() < 1e-3);
        // Signal strength S1C has no LLI/SSI flags.
        let s1c = g01.obs[3].expect("S1C present");
        assert!((s1c.value - 43.500).abs() < 1e-3);
        assert_eq!(s1c.lli, None);
        assert_eq!(s1c.ssi, None);
    }

    #[test]
    fn observation_lookup_by_code_and_second_epoch() {
        let f = parse_obs(&sample()).unwrap();
        // Lookup helper resolves system → code index → value.
        assert!((f.observation(0, "G02", "C1C").unwrap() - 20_891_534.648).abs() < 1e-3);
        assert!((f.observation(0, "G02", "S1C").unwrap() - 48.250).abs() < 1e-3);
        // Second epoch, 30 s later, one satellite.
        assert_eq!(f.epochs[1].time.second, 30.0);
        assert_eq!(f.epochs[1].sats.len(), 1);
        assert!((f.observation(1, "G01", "C1C").unwrap() - 23_625_000.100).abs() < 1e-3);
        // Absent satellite / code → None.
        assert!(f.observation(0, "G09", "C1C").is_none());
        assert!(f.observation(0, "G01", "L2W").is_none());
    }

    #[test]
    fn lists_observed_satellites() {
        let f = parse_obs(&sample()).unwrap();
        assert_eq!(f.satellites(), vec!["G01", "G02"]);
    }

    #[test]
    fn handles_continuation_obs_type_lines() {
        // A system with more than 13 observation codes spreads them over a
        // continuation line whose system field is blank. The parser must keep
        // appending to the same system. First line carries 13 codes; the
        // continuation carries the remaining 3.
        let first = [
            "C1C", "L1C", "D1C", "S1C", "C2W", "L2W", "D2W", "S2W", "C5Q", "L5Q", "D5Q", "S5Q",
            "C1W",
        ];
        let mut f1 = vec![(0usize, "G".to_string()), (3, " 16".to_string())];
        for (k, c) in first.iter().enumerate() {
            f1.push((7 + k * 4, c.to_string()));
        }
        let line1: Vec<(usize, &str)> = f1.iter().map(|(c, s)| (*c, s.as_str())).collect();
        let many = [
            hdr(&line1, "SYS / # / OBS TYPES"),
            hdr(
                &[(7, "L1W"), (11, "D1W"), (15, "S1W")],
                "SYS / # / OBS TYPES",
            ),
            hdr(
                &[(0, "     3.04"), (20, "O"), (40, "M")],
                "RINEX VERSION / TYPE",
            ),
            hdr(&[], "END OF HEADER"),
            place(&[
                (0, ">"),
                (2, "2021"),
                (7, "01"),
                (10, "01"),
                (13, "00"),
                (16, "00"),
                (18, "  0.0000000"),
                (31, "0"),
                (32, "  1"),
            ]),
            place(&[(0, "G01"), (3, &format!("{:14.3}", 23_629_347.915))]),
        ]
        .join("\n")
            + "\n";
        let f = parse_obs(&many).expect("parses");
        let codes = f.header.codes_for('G').unwrap();
        assert_eq!(codes.len(), 16);
        assert_eq!(codes[12], "C1W");
        assert_eq!(codes[15], "S1W");
        // Only the first observation is present; the rest are absent (None).
        let g01 = &f.epochs[0].sats[0];
        assert!((g01.obs[0].unwrap().value - 23_629_347.915).abs() < 1e-3);
        assert!(g01.obs[1].is_none());
    }

    #[test]
    fn rejects_input_without_header_or_epochs() {
        assert!(parse_obs("not a rinex file").is_err());
        // Header but no epochs.
        let header_only = [
            hdr(
                &[(0, "     3.04"), (20, "O"), (40, "M")],
                "RINEX VERSION / TYPE",
            ),
            hdr(&[(0, "G"), (3, "  1"), (7, "C1C")], "SYS / # / OBS TYPES"),
            hdr(&[], "END OF HEADER"),
        ]
        .join("\n")
            + "\n";
        assert!(parse_obs(&header_only).is_err());
    }
}
