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
//! From a parsed [`RinexEphemeris`] this evaluates the satellite's ECEF position
//! ([`RinexEphemeris::sv_position_ecef`], IS-GPS-200 §20.3.3.4.3.1) and its clock
//! bias including the relativistic correction
//! ([`RinexEphemeris::sv_clock_bias_s`], §20.3.3.3.3.1).
//!
//! A parsed ephemeris is also a first-class propagation source: it converts to a
//! [`crate::orbit::Propagator`] (via [`RinexEphemeris::sv_position_teme`]), so a
//! real broadcast file can drive the same geometry, visibility, and integrity
//! pipeline as the analytic propagators.
//!
//! Scope (this stage): the GPS (`G`) LNAV ephemeris block. Galileo F/I-NAV,
//! BeiDou, and GLONASS records are the next steps (SP3 precise ephemerides are
//! read by [`crate::sp3`]). Records for other systems are skipped, not rejected,
//! so a mixed-constellation file still yields its GPS ephemerides.

/// A calendar epoch in UTC/GPS time, as carried in a RINEX record (the clock
/// reference time `Toc`).
#[derive(Clone, Copy, Debug, PartialEq, serde::Serialize)]
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

/// WGS-84 / GPS gravitational constant `μ` (m³/s²), the value mandated by
/// IS-GPS-200 for broadcast-ephemeris evaluation (subtly different from the
/// WGS-84 `GM`).
const MU_GPS: f64 = 3.986_005e14;
/// WGS-84 Earth rotation rate `Ω̇ₑ` (rad/s), per IS-GPS-200.
const OMEGA_E_DOT: f64 = 7.292_115_146_7e-5;
/// Relativistic clock-correction constant `F = −2√μ/c²` (s/√m), IS-GPS-200.
const F_REL: f64 = -4.442_807_633e-10;

/// Julian Day Number (integer, civil Gregorian) for `year-month-day` at noon.
fn julian_day_number(year: i64, month: i64, day: i64) -> i64 {
    let a = (14 - month) / 12;
    let y = year + 4800 - a;
    let m = month + 12 * a - 3;
    day + (153 * m + 2) / 5 + 365 * y + y / 4 - y / 100 + y / 400 - 32045
}

impl EpochUtc {
    /// GPS time-of-week (s) for this epoch: the seconds since the start (Sunday
    /// 00:00) of the GPS week the epoch falls in. The GPS time scale has no leap
    /// seconds and the RINEX navigation calendar is already in GPS time, so this
    /// is plain calendar arithmetic from the GPS epoch (1980-01-06, a Sunday).
    pub fn gps_time_of_week(&self) -> f64 {
        let days = julian_day_number(self.year as i64, self.month as i64, self.day as i64)
            - julian_day_number(1980, 1, 6);
        let day_of_week = days.rem_euclid(7) as f64;
        day_of_week * 86_400.0 + self.hour as f64 * 3600.0 + self.minute as f64 * 60.0 + self.second
    }
}

impl RinexEphemeris {
    /// Semi-major axis `A = (√A)²` (m).
    pub fn semi_major_axis(&self) -> f64 {
        self.sqrt_a * self.sqrt_a
    }

    /// Time from the ephemeris reference epoch `Toe` (s), folded for week
    /// rollover, and the eccentric anomaly `Ek` at GPS time-of-week `t_tow_s` —
    /// the shared core of the position and clock evaluations.
    fn tk_and_eccentric_anomaly(&self, t_tow_s: f64) -> (f64, f64) {
        let a = self.semi_major_axis();
        let n0 = (MU_GPS / (a * a * a)).sqrt();
        let mut tk = t_tow_s - self.toe;
        if tk > 302_400.0 {
            tk -= 604_800.0;
        } else if tk < -302_400.0 {
            tk += 604_800.0;
        }
        let mk = self.m0 + (n0 + self.delta_n) * tk;
        // Kepler's equation M = E − e·sin E, solved by Newton iteration.
        let mut ek = mk;
        for _ in 0..30 {
            let d = (ek - self.e * ek.sin() - mk) / (1.0 - self.e * ek.cos());
            ek -= d;
            if d.abs() < 1e-13 {
                break;
            }
        }
        (tk, ek)
    }

    /// The SV clock bias (s) at GPS time-of-week `t_tow_s`: the broadcast clock
    /// polynomial `af0 + af1·Δt + af2·Δt²` about the clock reference time `Toc`,
    /// plus the relativistic eccentricity correction `F·e·√A·sin Ek` (IS-GPS-200
    /// §20.3.3.3.3.1). The group-delay term `TGD` (a single-frequency L1
    /// correction) is *not* applied here; it is available as [`Self::tgd`].
    pub fn sv_clock_bias_s(&self, t_tow_s: f64) -> f64 {
        let toc_tow = self.toc.gps_time_of_week();
        let mut dt = t_tow_s - toc_tow;
        if dt > 302_400.0 {
            dt -= 604_800.0;
        } else if dt < -302_400.0 {
            dt += 604_800.0;
        }
        let (_, ek) = self.tk_and_eccentric_anomaly(t_tow_s);
        let dtr = F_REL * self.e * self.sqrt_a * ek.sin();
        self.af0 + self.af1 * dt + self.af2 * dt * dt + dtr
    }

    /// Evaluate the satellite's ECEF position (m) at GPS time-of-week `t_tow_s`
    /// from the broadcast ephemeris, following the IS-GPS-200 user algorithm
    /// (§20.3.3.4.3.1): solve Kepler's equation for the eccentric anomaly, apply
    /// the second-harmonic argument-of-latitude / radius / inclination
    /// corrections, then rotate the in-plane position into the Earth-fixed frame
    /// accounting for Earth rotation since the reference time.
    pub fn sv_position_ecef(&self, t_tow_s: f64) -> [f64; 3] {
        let a = self.semi_major_axis();
        let (tk, ek) = self.tk_and_eccentric_anomaly(t_tow_s);
        let nu = ((1.0 - self.e * self.e).sqrt() * ek.sin()).atan2(ek.cos() - self.e);
        let phi = nu + self.omega;
        let (s2, c2) = ((2.0 * phi).sin(), (2.0 * phi).cos());
        let du = self.cus * s2 + self.cuc * c2;
        let dr = self.crs * s2 + self.crc * c2;
        let di = self.cis * s2 + self.cic * c2;
        let u = phi + du;
        let r = a * (1.0 - self.e * ek.cos()) + dr;
        let i = self.i0 + di + self.idot * tk;
        let (xp, yp) = (r * u.cos(), r * u.sin());
        // Corrected longitude of the ascending node (Earth-fixed).
        let omega_k = self.omega0 + (self.omega_dot - OMEGA_E_DOT) * tk - OMEGA_E_DOT * self.toe;
        let (so, co) = (omega_k.sin(), omega_k.cos());
        let ci = i.cos();
        [xp * co - yp * ci * so, xp * so + yp * ci * co, yp * i.sin()]
    }

    /// The UT1 Julian Date of GPS time-of-week `t_tow_s` in this ephemeris's GPS
    /// week. GPS time runs ahead of UTC by the integer leap-second offset
    /// (`GPS − UTC = (TAI − UTC) − 19 s`), and UT1 ≈ UTC: the sub-second DUT1
    /// term is neglected, consistent with the GMST-only frame rotation in
    /// [`crate::frames`]. This is the time argument the ECEF→TEME rotation needs.
    pub fn jd_ut1(&self, t_tow_s: f64) -> f64 {
        // GPS time epoch is 1980-01-06 00:00:00; whole weeks then the time of week.
        let jd_gps = crate::timescales::julian_date(1980, 1, 6, 0, 0, 0.0)
            + self.gps_week * 7.0
            + t_tow_s / 86_400.0;
        let gps_minus_utc = crate::timescales::tai_minus_utc(jd_gps) - 19.0;
        jd_gps - gps_minus_utc / 86_400.0
    }

    /// The satellite's position (m) in the TEME inertial frame at GPS
    /// time-of-week `t_tow_s`, obtained by rotating the Earth-fixed
    /// [`Self::sv_position_ecef`] back through the Greenwich Mean Sidereal angle
    /// for [`Self::jd_ut1`]. This is the inertial frame the orbit propagators
    /// share, so it is what lets a broadcast ephemeris drive the same geometry,
    /// visibility, and integrity pipeline as an SGP4 or Keplerian satellite.
    pub fn sv_position_teme(&self, t_tow_s: f64) -> [f64; 3] {
        crate::frames::ecef_to_teme(self.sv_position_ecef(t_tow_s), self.jd_ut1(t_tow_s))
    }

    /// Nominal Keplerian orbital period (s) from the broadcast semi-major axis,
    /// `2π·√(A³/μ)` with the IS-GPS-200 gravitational constant.
    pub fn orbital_period_s(&self) -> f64 {
        let a = self.semi_major_axis();
        std::f64::consts::TAU * (a * a * a / MU_GPS).sqrt()
    }
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
    fn sv_position_is_a_gps_orbit() {
        let eph = &parse_nav(SAMPLE).unwrap()[0];
        let p = eph.sv_position_ecef(eph.toe);
        let r = (p[0] * p[0] + p[1] * p[1] + p[2] * p[2]).sqrt();
        let a = eph.semi_major_axis();
        // Geocentric radius stays within the eccentric band a(1±e), plus the
        // bounded harmonic radius correction (|Crc|,|Crs| ≈ 260 m here).
        let band = eph.e * a + 400.0;
        assert!(
            (r - a).abs() < band,
            "radius {r:.0} m outside a±band ({a:.0} ± {band:.0})"
        );
        // A GPS satellite is ~26 560 km from the geocentre.
        assert!((r - 26_560_000.0).abs() < 600_000.0, "r = {r:.0} m");
    }

    #[test]
    fn sv_speed_matches_a_gps_orbit() {
        // Finite-difference the ECEF position; a GPS satellite's Earth-fixed speed
        // is ~3.9 km/s (orbital ~3.87 km/s, lightly modified by Earth rotation).
        let eph = &parse_nav(SAMPLE).unwrap()[0];
        let dt = 1.0;
        let a = eph.sv_position_ecef(eph.toe);
        let b = eph.sv_position_ecef(eph.toe + dt);
        let v =
            (((b[0] - a[0]).powi(2) + (b[1] - a[1]).powi(2) + (b[2] - a[2]).powi(2)).sqrt()) / dt;
        assert!((3.0e3..4.5e3).contains(&v), "ECEF speed {v:.1} m/s");
    }

    #[test]
    fn jd_ut1_applies_the_gps_minus_utc_leap_offset() {
        // The SAMPLE record is GPS week 2244, Toe = 172 800 s — i.e. 2023, when
        // TAI−UTC = 37 s, so GPS−UTC = 37 − 19 = 18 s. jd_ut1 must therefore lag
        // the raw GPS Julian Date by exactly 18 s.
        let eph = &parse_nav(SAMPLE).unwrap()[0];
        let jd_gps = crate::timescales::julian_date(1980, 1, 6, 0, 0, 0.0)
            + eph.gps_week * 7.0
            + eph.toe / 86_400.0;
        // Both Julian Dates are ≈2.46×10⁶, so differencing them loses ~50 µs to
        // f64 cancellation; a sub-millisecond tolerance still pins the integer
        // 18 s offset unambiguously (vs 17 or 19).
        let offset_s = (jd_gps - eph.jd_ut1(eph.toe)) * 86_400.0;
        assert!(
            (offset_s - 18.0).abs() < 1e-3,
            "GPS−UTC offset = {offset_s:.6} s"
        );
    }

    #[test]
    fn sv_position_teme_preserves_the_geocentric_radius() {
        // The ECEF→TEME map is a pure rotation about the z-axis, so it leaves the
        // vector norm unchanged: the TEME radius must equal the ECEF radius.
        let eph = &parse_nav(SAMPLE).unwrap()[0];
        let ecef = eph.sv_position_ecef(eph.toe);
        let teme = eph.sv_position_teme(eph.toe);
        let r_ecef = (ecef[0].powi(2) + ecef[1].powi(2) + ecef[2].powi(2)).sqrt();
        let r_teme = (teme[0].powi(2) + teme[1].powi(2) + teme[2].powi(2)).sqrt();
        assert!(
            (r_ecef - r_teme).abs() < 1e-3,
            "ECEF {r_ecef:.3} vs TEME {r_teme:.3}"
        );
        // The z component is invariant under a z-rotation.
        assert!((ecef[2] - teme[2]).abs() < 1e-6);
    }

    #[test]
    fn orbital_period_is_about_twelve_hours() {
        // A GPS satellite (a ≈ 26 560 km) has a ~11 h 58 m sidereal period.
        let eph = &parse_nav(SAMPLE).unwrap()[0];
        let t = eph.orbital_period_s();
        assert!((4.2e4..4.4e4).contains(&t), "period {t:.0} s");
    }

    #[test]
    fn gps_time_of_week_for_known_dates() {
        // 2023-01-01 was a Sunday → start of the GPS week, ToW 0.
        let sunday = EpochUtc {
            year: 2023,
            month: 1,
            day: 1,
            hour: 0,
            minute: 0,
            second: 0.0,
        };
        assert_eq!(sunday.gps_time_of_week(), 0.0);
        // Tuesday 12:00:00 → 2·86400 + 43200.
        let tue = EpochUtc {
            day: 3,
            hour: 12,
            ..sunday
        };
        assert_eq!(tue.gps_time_of_week(), 2.0 * 86_400.0 + 43_200.0);
        // Saturday 23:59:59 → the last second of the week.
        let sat = EpochUtc {
            day: 7,
            hour: 23,
            minute: 59,
            second: 59.0,
            ..sunday
        };
        assert_eq!(sat.gps_time_of_week(), 6.0 * 86_400.0 + 86_399.0);
    }

    #[test]
    fn sv_clock_bias_is_af0_dominated_with_a_relativistic_term() {
        let eph = &parse_nav(SAMPLE).unwrap()[0];
        // At the clock reference epoch (Δt = 0) the bias is af0 plus the small
        // relativistic eccentricity term (|F·e·√A| ≈ 2.8e-8 s here).
        let toc_tow = eph.toc.gps_time_of_week();
        let bias = eph.sv_clock_bias_s(toc_tow);
        assert!(bias.is_finite());
        assert!(
            (bias - eph.af0).abs() < 1e-7,
            "bias {bias} vs af0 {}",
            eph.af0
        );
        // The relativistic correction is present (non-zero) and bounded.
        let dtr = bias - eph.af0;
        assert!(dtr != 0.0 && dtr.abs() < 3e-8, "relativistic term {dtr}");
    }

    #[test]
    fn week_rollover_correction_is_symmetric() {
        // Evaluating at toe and at toe ± a full week must give the same position
        // (the tk rollover correction folds it back).
        let eph = &parse_nav(SAMPLE).unwrap()[0];
        let p0 = eph.sv_position_ecef(eph.toe);
        let pw = eph.sv_position_ecef(eph.toe + 604_800.0);
        for k in 0..3 {
            assert!(
                (p0[k] - pw[k]).abs() < 1e-3,
                "axis {k}: {} vs {}",
                p0[k],
                pw[k]
            );
        }
    }

    #[test]
    fn empty_after_header_is_empty() {
        let only_header = "\
     3.04           N: GNSS NAV DATA    G: GPS              RINEX VERSION / TYPE
                                                            END OF HEADER";
        assert!(parse_nav(only_header).unwrap().is_empty());
    }
}
