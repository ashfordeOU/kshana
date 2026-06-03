// SPDX-License-Identifier: Apache-2.0
//! RINEX 3 navigation-message (broadcast ephemeris) parser.
//!
//! RINEX (Receiver Independent Exchange Format) is the lingua franca of GNSS
//! data: the format every receiver, agency, and processing tool reads and writes.
//! Being able to ingest it is what lets this engine sit alongside RTKLIB, gLAB,
//! and the IGS archives rather than in a synthetic-only silo.
//!
//! This module parses RINEX 3.x GPS navigation records — the broadcast ephemeris
//! a satellite transmits — into a [`RinexEphemeris`] of Keplerian elements and
//! clock corrections, following the field layout in the RINEX 3.04 specification
//! (IGS/RTCM) and the GPS interface specification IS-GPS-200 for the parameter
//! meanings. The numeric fields use the Fortran `D`-exponent floating format
//! (e.g. `-1.234567890123D-09`), handled by [`parse_d`].
//!
//! Scope (this stage): the GPS (`G`) LNAV ephemeris block. Galileo F/I-NAV,
//! BeiDou, and GLONASS records, the SV-position evaluation from the ephemeris
//! (IS-GPS-200 §20.3.3.4.3), and a [`crate::orbit::Propagator`] source built on
//! it are the next steps. Records for other systems are skipped, not rejected, so
//! a mixed-constellation file still yields its GPS ephemerides.

/// A calendar epoch in UTC/GPS time, as carried in a RINEX record (the clock
/// reference time `Toc`).
#[derive(Clone, Copy, Debug, PartialEq)]
pub struct EpochUtc {
    pub year: i32,
    pub month: u32,
    pub day: u32,
    pub hour: u32,
    pub minute: u32,
    pub second: f64,
}

/// A GPS broadcast ephemeris parsed from one RINEX 3 navigation record. Field
/// names follow IS-GPS-200 (angles in radians, distances in metres, times in
/// seconds, `sqrt_a` in √m). The eight source lines map to these as: the SV/epoch
/// line carries the PRN, `Toc`, and the three clock polynomial terms; the seven
/// `BROADCAST ORBIT` lines carry the rest in order.
#[derive(Clone, Copy, Debug)]
pub struct RinexEphemeris {
    /// Satellite system identifier (`'G'` for GPS).
    pub system: char,
    /// PRN number within the system.
    pub prn: u8,
    /// Clock reference epoch `Toc`.
    pub toc: EpochUtc,
    /// SV clock bias `af0` (s).
    pub af0: f64,
    /// SV clock drift `af1` (s/s).
    pub af1: f64,
    /// SV clock drift rate `af2` (s/s²).
    pub af2: f64,

    /// Issue of data, ephemeris.
    pub iode: f64,
    /// Orbit-radius sine-harmonic correction `Crs` (m).
    pub crs: f64,
    /// Mean-motion difference `Δn` (rad/s).
    pub delta_n: f64,
    /// Mean anomaly at reference time `M0` (rad).
    pub m0: f64,

    /// Argument-of-latitude cosine-harmonic correction `Cuc` (rad).
    pub cuc: f64,
    /// Eccentricity `e` (dimensionless).
    pub e: f64,
    /// Argument-of-latitude sine-harmonic correction `Cus` (rad).
    pub cus: f64,
    /// Square root of the semi-major axis `√A` (√m).
    pub sqrt_a: f64,

    /// Ephemeris reference time of week `Toe` (s).
    pub toe: f64,
    /// Inclination cosine-harmonic correction `Cic` (rad).
    pub cic: f64,
    /// Longitude of ascending node at weekly epoch `Ω0` (rad).
    pub omega0: f64,
    /// Inclination sine-harmonic correction `Cis` (rad).
    pub cis: f64,

    /// Inclination at reference time `i0` (rad).
    pub i0: f64,
    /// Orbit-radius cosine-harmonic correction `Crc` (m).
    pub crc: f64,
    /// Argument of perigee `ω` (rad).
    pub omega: f64,
    /// Rate of right ascension `Ω̇` (rad/s).
    pub omega_dot: f64,

    /// Rate of inclination `IDOT` (rad/s).
    pub idot: f64,
    /// GPS week number (continuous, not mod-1024).
    pub gps_week: f64,

    /// SV accuracy (URA, m).
    pub sv_accuracy: f64,
    /// SV health flag (0 = healthy).
    pub sv_health: f64,
    /// Group delay differential `TGD` (s).
    pub tgd: f64,
    /// Issue of data, clock.
    pub iodc: f64,

    /// Message transmission time of week (s).
    pub trans_time: f64,
}

/// Parse a Fortran `D`/`E`-exponent float as written in RINEX (`-1.23D-09`,
/// `4.5678E+04`, or a plain decimal). Blank fields parse to `0.0`.
pub fn parse_d(s: &str) -> Result<f64, String> {
    let t = s.trim();
    if t.is_empty() {
        return Ok(0.0);
    }
    let normalized = t.replace(['D', 'd'], "E");
    normalized
        .parse::<f64>()
        .map_err(|_| format!("not a number: {s:?}"))
}

/// Slice a fixed-width column `[lo, hi)` from `line`, clamped to its length
/// (RINEX lines may be short when trailing fields are blank).
fn col(line: &str, lo: usize, hi: usize) -> &str {
    let n = line.len();
    if lo >= n {
        return "";
    }
    &line[lo..hi.min(n)]
}

/// The four 19-character data fields of a RINEX 3 `BROADCAST ORBIT` line, which
/// start after a 4-space indent.
fn orbit_fields(line: &str) -> Result<[f64; 4], String> {
    Ok([
        parse_d(col(line, 4, 23))?,
        parse_d(col(line, 23, 42))?,
        parse_d(col(line, 42, 61))?,
        parse_d(col(line, 61, 80))?,
    ])
}

/// Parse all GPS ephemerides from a RINEX 3 navigation file. The header (up to
/// and including the `END OF HEADER` line) is skipped; each GPS record is eight
/// lines (one SV/epoch line plus seven orbit lines). Records for other satellite
/// systems are skipped along with their orbit lines.
pub fn parse_nav(text: &str) -> Result<Vec<RinexEphemeris>, String> {
    let lines: Vec<&str> = text.lines().collect();
    // Find the end of the header.
    let mut i = 0;
    while i < lines.len() {
        let done = lines[i].contains("END OF HEADER");
        i += 1;
        if done {
            break;
        }
    }
    let mut out = Vec::new();
    while i < lines.len() {
        let head = lines[i];
        if head.trim().is_empty() {
            i += 1;
            continue;
        }
        let system = head.chars().next().unwrap_or(' ');
        // A record is the epoch line plus seven orbit lines.
        if i + 7 >= lines.len() {
            break;
        }
        if system != 'G' {
            // Skip this record (all eight lines) without parsing.
            i += 8;
            continue;
        }
        let prn: u8 = col(head, 1, 3)
            .trim()
            .parse()
            .map_err(|_| format!("bad PRN in {head:?}"))?;
        let toc = EpochUtc {
            year: col(head, 4, 8).trim().parse().map_err(|_| "bad year")?,
            month: col(head, 9, 11).trim().parse().map_err(|_| "bad month")?,
            day: col(head, 12, 14).trim().parse().map_err(|_| "bad day")?,
            hour: col(head, 15, 17).trim().parse().map_err(|_| "bad hour")?,
            minute: col(head, 18, 20).trim().parse().map_err(|_| "bad minute")?,
            second: parse_d(col(head, 21, 23))?,
        };
        let af0 = parse_d(col(head, 23, 42))?;
        let af1 = parse_d(col(head, 42, 61))?;
        let af2 = parse_d(col(head, 61, 80))?;

        let l1 = orbit_fields(lines[i + 1])?;
        let l2 = orbit_fields(lines[i + 2])?;
        let l3 = orbit_fields(lines[i + 3])?;
        let l4 = orbit_fields(lines[i + 4])?;
        let l5 = orbit_fields(lines[i + 5])?;
        let l6 = orbit_fields(lines[i + 6])?;
        let l7 = orbit_fields(lines[i + 7])?;

        out.push(RinexEphemeris {
            system,
            prn,
            toc,
            af0,
            af1,
            af2,
            iode: l1[0],
            crs: l1[1],
            delta_n: l1[2],
            m0: l1[3],
            cuc: l2[0],
            e: l2[1],
            cus: l2[2],
            sqrt_a: l2[3],
            toe: l3[0],
            cic: l3[1],
            omega0: l3[2],
            cis: l3[3],
            i0: l4[0],
            crc: l4[1],
            omega: l4[2],
            omega_dot: l4[3],
            idot: l5[0],
            gps_week: l5[2],
            sv_accuracy: l6[0],
            sv_health: l6[1],
            tgd: l6[2],
            iodc: l6[3],
            trans_time: l7[0],
        });
        i += 8;
    }
    Ok(out)
}

#[cfg(test)]
mod tests {
    use super::*;

    // A minimal RINEX 3 GPS navigation file: a two-line header and one GPS
    // ephemeris record (one SV/epoch line + seven BROADCAST ORBIT lines). The
    // field values are representative of a healthy GPS satellite.
    const SAMPLE: &str = "\
     3.04           N: GNSS NAV DATA    G: GPS              RINEX VERSION / TYPE
                                                            END OF HEADER
G01 2023 01 01 00 00 00 4.567890123456D-04 1.136868377216D-12 0.000000000000D+00
     6.500000000000D+01-1.234375000000D+01 4.567890123456D-09-1.234567890123D+00
    -6.146728992462D-07 1.234567890123D-02 7.430091500282D-06 5.153679868698D+03
     1.728000000000D+05 1.117587089539D-08-1.234567890123D+00 7.450580596924D-09
     9.876543210987D-01 2.612500000000D+02 5.678901234567D-01-8.123456789012D-09
    -2.345678901234D-10 1.000000000000D+00 2.244000000000D+03 0.000000000000D+00
     2.000000000000D+00 0.000000000000D+00-1.117587089539D-08 6.500000000000D+01
     1.674000000000D+05 4.000000000000D+00 0.000000000000D+00 0.000000000000D+00";

    #[test]
    fn parse_d_handles_fortran_exponent() {
        assert!((parse_d("-1.234567890123D-09").unwrap() - -1.234_567_890_123e-9).abs() < 1e-24);
        assert!((parse_d(" 5.153679868698D+03").unwrap() - 5153.679868698).abs() < 1e-9);
        assert!((parse_d("4.5678E+04").unwrap() - 45678.0).abs() < 1e-9);
        assert_eq!(parse_d("   ").unwrap(), 0.0);
        assert!(parse_d("not-a-number").is_err());
    }

    #[test]
    fn parses_a_gps_ephemeris_record() {
        let ephs = parse_nav(SAMPLE).expect("parses");
        assert_eq!(ephs.len(), 1);
        let e = &ephs[0];
        assert_eq!(e.system, 'G');
        assert_eq!(e.prn, 1);
        // Epoch.
        assert_eq!(e.toc.year, 2023);
        assert_eq!(e.toc.month, 1);
        assert_eq!(e.toc.day, 1);
        // Clock polynomial.
        assert!((e.af0 - 4.567_890_123_456e-4).abs() < 1e-16);
        assert!((e.af1 - 1.136_868_377_216e-12).abs() < 1e-24);
        assert_eq!(e.af2, 0.0);
        // Keplerian elements (the load-bearing ones).
        assert!((e.sqrt_a - 5153.679868698).abs() < 1e-9);
        assert!((e.e - 1.234_567_890_123e-2).abs() < 1e-14);
        assert!((e.m0 - -1.234_567_890_123).abs() < 1e-12);
        assert!((e.toe - 172_800.0).abs() < 1e-6);
        assert!((e.delta_n - 4.567_890_123_456e-9).abs() < 1e-21);
        assert!((e.omega_dot - -8.123_456_789_012e-9).abs() < 1e-21);
        assert_eq!(e.gps_week, 2244.0);
        // GPS semi-major axis ≈ 26 560 km.
        let a = e.sqrt_a * e.sqrt_a;
        assert!((a - 26_560_000.0).abs() < 50_000.0, "a = {a} m");
    }

    #[test]
    fn skips_non_gps_systems() {
        // Prefix a Galileo record (which this stage does not decode) before the
        // GPS one; only the GPS ephemeris should come back.
        let mixed = SAMPLE.replace(
            "G01 2023 01 01 00 00 00",
            "E11 2023 01 01 00 00 00 0.0D+00 0.0D+00 0.0D+00\n     \
0.0D+00 0.0D+00 0.0D+00 0.0D+00\n     0.0D+00 0.0D+00 0.0D+00 0.0D+00\n     \
0.0D+00 0.0D+00 0.0D+00 0.0D+00\n     0.0D+00 0.0D+00 0.0D+00 0.0D+00\n     \
0.0D+00 0.0D+00 0.0D+00 0.0D+00\n     0.0D+00 0.0D+00 0.0D+00 0.0D+00\n     \
0.0D+00 0.0D+00 0.0D+00 0.0D+00\nG01 2023 01 01 00 00 00",
        );
        let ephs = parse_nav(&mixed).expect("parses");
        assert_eq!(ephs.len(), 1);
        assert_eq!(ephs[0].system, 'G');
    }

    #[test]
    fn empty_after_header_is_empty() {
        let only_header = "\
     3.04           N: GNSS NAV DATA    G: GPS              RINEX VERSION / TYPE
                                                            END OF HEADER";
        assert!(parse_nav(only_header).unwrap().is_empty());
    }
}
