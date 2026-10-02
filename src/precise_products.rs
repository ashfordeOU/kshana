// SPDX-License-Identifier: AGPL-3.0-only
//! Precise satellite products for code positioning: Receiver Independent Exchange (RINEX) clock
//! files, the satellite antenna phase-centre offsets of an antenna exchange (ANTEX) file, and the
//! Center for Orbit Determination in Europe (CODE) differential code bias (DCB) files, combined
//! with a Standard Product 3 (SP3) precise orbit into satellite positions and clocks.
//!
//! The conventions are those of the International GNSS Service (IGS) products:
//! - SP3 positions are of the satellite centre of mass in the Earth-fixed frame, GPS time;
//! - RINEX clock `AS` records give the satellite clock offset (s) of the ionosphere-free
//!   combination the analysis centre used (GPS L1/L2 P code; Galileo E1/E5a), without the
//!   periodic relativistic term, which the user adds as `−2 r·v / c²`;
//! - the clock refers to the antenna phase centre of that combination, so the user adds the
//!   ionosphere-free combination of the ANTEX satellite offsets, given in the satellite body
//!   frame (z towards the Earth's centre, y along the solar-panel axis, x completing the
//!   right-handed set towards the Sun-facing side);
//! - the GPS clock datum is the P(Y) code on L1, so a C/A-code (`C1C`) pseudorange takes the
//!   P1−C1 code bias: `P1 = C1 + (P1 − C1)`.
//!
//! Sources: RINEX clock format version 3.04 (IGS, 2017); ANTEX format version 1.4 (IGS, 2010);
//! the CODE monthly P1−C1 DCB file format; Kouba, "A Guide to Using International GNSS Service
//! (IGS) Products" (2009), sections 4 and 5 (relativistic clock term, satellite antenna offsets).

use crate::frames::{teme_to_ecef, Vec3};
use crate::sp3::{Sp3File, Sp3Interpolator};
use std::collections::HashMap;

/// Speed of light (m/s).
const C: f64 = 299_792_458.0;

/// Seconds from the GPS epoch (1980-01-06 00:00:00) of a calendar instant on the GPS scale.
fn gps_seconds(year: i32, month: u32, day: u32, hour: u32, minute: u32, second: f64) -> f64 {
    crate::rinex::EpochUtc {
        year,
        month,
        day,
        hour,
        minute,
        second,
    }
    .seconds_from_gps_epoch()
}

/// Satellite clock offsets from the `AS` records of a RINEX clock file.
#[derive(Clone, Debug, Default)]
pub struct ClockRinex {
    /// Per satellite (e.g. `"G01"`): the records as (seconds from the GPS epoch, offset in s),
    /// in increasing time.
    pub sats: HashMap<String, Vec<(f64, f64)>>,
}

/// Parse the satellite (`AS`) records of a RINEX clock file (versions 2 and 3; the 3.04 nine-
/// character name field is accepted too). Other records and the header are skipped.
pub fn parse_clock_rinex(text: &str) -> Result<ClockRinex, String> {
    let mut out = ClockRinex::default();
    let mut in_header = true;
    for line in text.lines() {
        if in_header {
            if line.len() >= 60 && line[60..].starts_with("END OF HEADER") {
                in_header = false;
            }
            continue;
        }
        if !line.starts_with("AS") {
            continue;
        }
        let t: Vec<&str> = line.split_whitespace().collect();
        if t.len() < 10 {
            return Err(format!("short AS record: {line:?}"));
        }
        let num = |s: &str| -> Result<f64, String> {
            s.replace(['D', 'd'], "E")
                .parse::<f64>()
                .map_err(|_| format!("bad number {s:?} in {line:?}"))
        };
        let int = |s: &str| -> Result<u32, String> {
            s.parse::<u32>()
                .map_err(|_| format!("bad field {s:?} in {line:?}"))
        };
        let sat = t[1].to_string();
        let ts = gps_seconds(
            int(t[2])? as i32,
            int(t[3])?,
            int(t[4])?,
            int(t[5])?,
            int(t[6])?,
            num(t[7])?,
        );
        let bias = num(t[9])?;
        out.sats.entry(sat).or_default().push((ts, bias));
    }
    for v in out.sats.values_mut() {
        v.sort_by(|a, b| a.0.total_cmp(&b.0));
        v.dedup_by(|a, b| a.0 == b.0);
    }
    Ok(out)
}

impl ClockRinex {
    /// The satellite clock offset (s) at `t` (seconds from the GPS epoch) by linear
    /// interpolation between the two records that bracket `t`. `None` when the satellite has no
    /// record on both sides of `t` within `max_gap_s` of each.
    pub fn bias_s(&self, sat: &str, t: f64, max_gap_s: f64) -> Option<f64> {
        let v = self.sats.get(sat)?;
        let i = v.partition_point(|&(ti, _)| ti < t);
        if i < v.len() && v[i].0 == t {
            return Some(v[i].1);
        }
        if i == 0 || i == v.len() {
            return None;
        }
        let (t0, c0) = v[i - 1];
        let (t1, c1) = v[i];
        if t - t0 > max_gap_s || t1 - t > max_gap_s {
            return None;
        }
        Some(c0 + (c1 - c0) * (t - t0) / (t1 - t0))
    }
}

/// The satellite antenna phase-centre offsets (m, body frame x, y, z) of an ANTEX file, per
/// satellite and frequency code (e.g. `"G01"`, `"E05"`), with their validity interval.
#[derive(Clone, Debug, Default)]
pub struct SatelliteAntennas {
    entries: Vec<SatAntenna>,
}

#[derive(Clone, Debug)]
struct SatAntenna {
    prn: String,
    valid_from: f64,
    valid_until: f64,
    offsets: Vec<(String, [f64; 3])>,
}

/// Parse the satellite antennas (`TYPE / SERIAL NO` records whose serial field is a satellite
/// code such as `G05`) of an ANTEX 1.4 file. Receiver antennas are skipped.
pub fn parse_antex_satellites(text: &str) -> Result<SatelliteAntennas, String> {
    let mut out = SatelliteAntennas::default();
    let mut cur: Option<SatAntenna> = None;
    let mut freq: Option<String> = None;
    let epoch = |s: &str| -> Result<f64, String> {
        let t: Vec<&str> = s.split_whitespace().collect();
        if t.len() < 6 {
            return Err(format!("bad ANTEX epoch {s:?}"));
        }
        let p = |x: &str| {
            x.parse::<f64>()
                .map_err(|_| format!("bad ANTEX epoch {s:?}"))
        };
        Ok(gps_seconds(
            p(t[0])? as i32,
            p(t[1])? as u32,
            p(t[2])? as u32,
            p(t[3])? as u32,
            p(t[4])? as u32,
            p(t[5])?,
        ))
    };
    for line in text.lines() {
        if line.len() < 61 {
            continue;
        }
        let (body, label) = line.split_at(60);
        let label = label.trim_end();
        match label {
            "START OF ANTENNA" => {
                cur = None;
                freq = None;
            }
            "TYPE / SERIAL NO" => {
                let serial = body.get(20..40).unwrap_or("").trim();
                let is_sat = serial.len() == 3
                    && serial.as_bytes()[0].is_ascii_uppercase()
                    && serial[1..].chars().all(|c| c.is_ascii_digit());
                cur = is_sat.then(|| SatAntenna {
                    prn: serial.to_string(),
                    valid_from: f64::NEG_INFINITY,
                    valid_until: f64::INFINITY,
                    offsets: Vec::new(),
                });
            }
            "VALID FROM" => {
                if let Some(a) = cur.as_mut() {
                    a.valid_from = epoch(body)?;
                }
            }
            "VALID UNTIL" => {
                if let Some(a) = cur.as_mut() {
                    a.valid_until = epoch(body)?;
                }
            }
            "START OF FREQUENCY" => freq = Some(body.trim().to_string()),
            "END OF FREQUENCY" => freq = None,
            "NORTH / EAST / UP" => {
                if let (Some(a), Some(f)) = (cur.as_mut(), freq.as_ref()) {
                    let v: Vec<f64> = body
                        .split_whitespace()
                        .take(3)
                        .map(|x| x.parse::<f64>().map_err(|_| format!("bad offset {body:?}")))
                        .collect::<Result<_, _>>()?;
                    if v.len() == 3 {
                        a.offsets
                            .push((f.clone(), [v[0] * 1e-3, v[1] * 1e-3, v[2] * 1e-3]));
                    }
                }
            }
            "END OF ANTENNA" => {
                if let Some(a) = cur.take() {
                    out.entries.push(a);
                }
            }
            _ => {}
        }
    }
    Ok(out)
}

impl SatelliteAntennas {
    /// The body-frame offset (m) of satellite `sat` on frequency code `freq` (e.g. `"G01"`) valid
    /// at `t` (seconds from the GPS epoch); `None` when no entry covers `t` or the frequency is
    /// absent.
    pub fn offset(&self, sat: &str, freq: &str, t: f64) -> Option<[f64; 3]> {
        self.entries
            .iter()
            .find(|a| a.prn == sat && a.valid_from <= t && t <= a.valid_until)?
            .offsets
            .iter()
            .find(|(f, _)| f == freq)
            .map(|(_, o)| *o)
    }

    /// Number of satellite antenna entries parsed.
    pub fn len(&self) -> usize {
        self.entries.len()
    }

    /// True when no satellite antenna was parsed.
    pub fn is_empty(&self) -> bool {
        self.entries.is_empty()
    }
}

/// Parse a CODE differential code bias file (for example the monthly `P1C1yymm.DCB`): the
/// satellite lines `Gnn` / `Rnn` / `Enn` and their value in nanoseconds. Station lines are
/// skipped.
pub fn parse_code_dcb(text: &str) -> HashMap<String, f64> {
    let mut out = HashMap::new();
    for line in text.lines() {
        let b = line.as_bytes();
        if b.len() < 30
            || !b[0].is_ascii_uppercase()
            || !b[1].is_ascii_digit()
            || !b[2].is_ascii_digit()
            || b[3] != b' '
        {
            continue;
        }
        if let Some(v) = line
            .get(26..)
            .and_then(|s| s.split_whitespace().next())
            .and_then(|s| s.parse::<f64>().ok())
        {
            out.insert(line[0..3].to_string(), v);
        }
    }
    out
}

/// A precise orbit, its clocks, the satellite antenna offsets and the P1−C1 code biases, ready
/// to give satellite antenna-phase-centre positions and clocks at a transmit time.
pub struct PreciseProducts {
    sp3_start_gps_s: f64,
    interps: HashMap<String, Sp3Interpolator>,
    /// Satellite clocks.
    pub clock: ClockRinex,
    /// Satellite antenna offsets.
    pub antennas: SatelliteAntennas,
    /// P1−C1 code bias (ns) per satellite.
    pub p1_c1_ns: HashMap<String, f64>,
    /// Largest gap (s) between a query and the clock record on either side.
    pub max_clock_gap_s: f64,
}

/// The ionosphere-free satellite state from [`PreciseProducts::state`].
#[derive(Clone, Copy, Debug)]
pub struct PreciseState {
    /// Antenna phase centre of the ionosphere-free combination (ECEF, m).
    pub pos_apc: Vec3,
    /// Centre of mass (ECEF, m).
    pub pos_com: Vec3,
    /// Earth-fixed velocity (m/s), by a 1 ms forward difference of the orbit interpolation.
    pub vel: Vec3,
    /// Satellite clock offset (s) including the periodic relativistic term `−2 r·v / c²`.
    pub clock_s: f64,
}

impl PreciseProducts {
    /// Bundle the products. `max_clock_gap_s` bounds the clock interpolation interval.
    pub fn new(
        sp3: &Sp3File,
        clock: ClockRinex,
        antennas: SatelliteAntennas,
        p1_c1_ns: HashMap<String, f64>,
        max_clock_gap_s: f64,
    ) -> Self {
        let s = sp3.header.start;
        let sp3_start_gps_s = gps_seconds(s.year, s.month, s.day, s.hour, s.minute, s.second);
        let interps = sp3
            .observed_satellites()
            .into_iter()
            .filter_map(|sat| sp3.interpolator(&sat).map(|i| (sat, i)))
            .collect();
        Self {
            sp3_start_gps_s,
            interps,
            clock,
            antennas,
            p1_c1_ns,
            max_clock_gap_s,
        }
    }

    /// The centre-of-mass position (ECEF, m) of `sat` at `t` (seconds from the GPS epoch).
    pub fn position_com(&self, sat: &str, t: f64) -> Option<Vec3> {
        self.interps
            .get(sat)
            .map(|i| i.position_ecef(t - self.sp3_start_gps_s))
    }

    /// The satellite clock offset (s) at `t` without the relativistic term.
    pub fn clock_s(&self, sat: &str, t: f64) -> Option<f64> {
        self.clock.bias_s(sat, t, self.max_clock_gap_s)
    }

    /// Satellite state at transmit time `t` for the ionosphere-free combination of the
    /// frequencies with ANTEX codes `freq1`/`freq2` and carrier frequencies `f1`/`f2` (Hz).
    /// A missing ANTEX offset counts as zero.
    pub fn state(
        &self,
        sat: &str,
        t: f64,
        (freq1, f1): (&str, f64),
        (freq2, f2): (&str, f64),
    ) -> Option<PreciseState> {
        let dt = 1e-3;
        let r0 = self.position_com(sat, t)?;
        let r1 = self.position_com(sat, t + dt)?;
        let vel = [
            (r1[0] - r0[0]) / dt,
            (r1[1] - r0[1]) / dt,
            (r1[2] - r0[2]) / dt,
        ];
        let clk = self.clock_s(sat, t)?;
        let d1 = self.antennas.offset(sat, freq1, t).unwrap_or([0.0; 3]);
        let d2 = self.antennas.offset(sat, freq2, t).unwrap_or([0.0; 3]);
        let (g1, g2) = (f1 * f1, f2 * f2);
        let (c1, c2) = (g1 / (g1 - g2), -g2 / (g1 - g2));
        let off = [
            c1 * d1[0] + c2 * d2[0],
            c1 * d1[1] + c2 * d2[1],
            c1 * d1[2] + c2 * d2[2],
        ];
        let (ex, ey, ez) = body_axes(r0, sun_ecef(t));
        let pos_apc = [
            r0[0] + off[0] * ex[0] + off[1] * ey[0] + off[2] * ez[0],
            r0[1] + off[0] * ex[1] + off[1] * ey[1] + off[2] * ez[1],
            r0[2] + off[0] * ex[2] + off[1] * ey[2] + off[2] * ez[2],
        ];
        let rv = pos_apc[0] * vel[0] + pos_apc[1] * vel[1] + pos_apc[2] * vel[2];
        Some(PreciseState {
            pos_apc,
            pos_com: r0,
            vel,
            clock_s: clk - 2.0 * rv / (C * C),
        })
    }
}

fn unit(v: Vec3) -> Vec3 {
    let n = (v[0] * v[0] + v[1] * v[1] + v[2] * v[2]).sqrt();
    [v[0] / n, v[1] / n, v[2] / n]
}

fn cross(a: Vec3, b: Vec3) -> Vec3 {
    [
        a[1] * b[2] - a[2] * b[1],
        a[2] * b[0] - a[0] * b[2],
        a[0] * b[1] - a[1] * b[0],
    ]
}

/// The nominal-yaw satellite body axes (ECEF unit vectors): `z` towards the Earth's centre,
/// `y = z × (Sun − satellite)` normalised, `x = y × z`.
fn body_axes(r_sat: Vec3, r_sun: Vec3) -> (Vec3, Vec3, Vec3) {
    let ez = unit([-r_sat[0], -r_sat[1], -r_sat[2]]);
    let es = unit([
        r_sun[0] - r_sat[0],
        r_sun[1] - r_sat[1],
        r_sun[2] - r_sat[2],
    ]);
    let ey = unit(cross(ez, es));
    let ex = cross(ey, ez);
    (ex, ey, ez)
}

/// Low-precision Sun position (ECEF, m) at `t` seconds from the GPS epoch: the series of
/// [`crate::ephem::sun_position`] (mean equator of date) rotated by the Greenwich mean sidereal
/// time. Its error (about 0.01 degrees) is far below what the satellite attitude needs.
fn sun_ecef(t: f64) -> Vec3 {
    // GPS epoch 1980-01-06 00:00 is JD 2444244.5; UT1 differs from GPS time by at most tens of
    // seconds, which turns the Sun direction by under 0.01 degrees.
    let jd = 2_444_244.5 + t / 86_400.0;
    let t_jc = (jd + (19.0 + 32.184) / 86_400.0 - 2_451_545.0) / 36_525.0;
    teme_to_ecef(crate::ephem::sun_position(t_jc), jd)
}

#[cfg(test)]
mod tests {
    use super::*;

    const CLK: &str =
        "     3.00           C                                       RINEX VERSION / TYPE
                                                            END OF HEADER
AR ABMF 2018 05 13 00 00  0.000000  1    1.000000000000E-08
AS G01  2018 05 13 00 00  0.000000  1   -1.000000000000E-04
AS G01  2018 05 13 00 00 30.000000  2   -1.000300000000E-04  1.0E-11
AS E11  2018 05 13 00 00  0.000000  1    2.000000000000D-04
";

    #[test]
    fn clock_records_parse_and_interpolate_linearly() {
        let c = parse_clock_rinex(CLK).unwrap();
        assert_eq!(c.sats.len(), 2, "AR (receiver) records are skipped");
        let t0 = gps_seconds(2018, 5, 13, 0, 0, 0.0);
        assert_eq!(c.bias_s("G01", t0, 60.0), Some(-1.0e-4));
        let mid = c.bias_s("G01", t0 + 10.0, 60.0).unwrap();
        assert!((mid - (-1.0001e-4)).abs() < 1e-18, "{mid}");
        assert_eq!(c.bias_s("G01", t0 + 31.0, 60.0), None, "no extrapolation");
        assert_eq!(c.bias_s("G01", t0 + 10.0, 5.0), None, "gap bound");
        assert_eq!(c.bias_s("E11", t0, 60.0), Some(2.0e-4), "D exponent");
    }

    const ATX: &str =
        "     1.4            M                                       ANTEX VERSION / SYST
                                                            END OF HEADER
                                                            START OF ANTENNA
BLOCK IIF           G01                 G063      2011-036A TYPE / SERIAL NO
  2011     7    16     0     0    0.0000000                 VALID FROM
   G01                                                      START OF FREQUENCY
    394.00      0.00   1600.00                              NORTH / EAST / UP
   G01                                                      END OF FREQUENCY
   G02                                                      START OF FREQUENCY
    394.00      0.00   1500.00                              NORTH / EAST / UP
   G02                                                      END OF FREQUENCY
                                                            END OF ANTENNA
                                                            START OF ANTENNA
TRM57971.00     NONE                                        TYPE / SERIAL NO
   G01                                                      START OF FREQUENCY
      1.00      2.00     66.00                              NORTH / EAST / UP
   G01                                                      END OF FREQUENCY
                                                            END OF ANTENNA
";

    #[test]
    fn antex_satellite_offsets_parse_with_validity_and_skip_receivers() {
        let a = parse_antex_satellites(ATX).unwrap();
        assert_eq!(a.len(), 1);
        let t = gps_seconds(2018, 5, 13, 0, 0, 0.0);
        assert_eq!(a.offset("G01", "G01", t), Some([0.394, 0.0, 1.6]));
        assert_eq!(a.offset("G01", "G02", t), Some([0.394, 0.0, 1.5]));
        assert_eq!(
            a.offset("G01", "G01", gps_seconds(2010, 1, 1, 0, 0, 0.0)),
            None
        );
    }

    #[test]
    fn code_dcb_satellite_lines_parse() {
        let text = "DIFFERENTIAL (P1-C1) CODE BIASES FOR SATELLITES AND RECEIVERS:
PRN / STATION NAME        VALUE (NS)  RMS (NS)
***   ****************    *****.***   *****.***
G01                          -0.811     0.010
R02                           0.100     0.020
ABMF 97103M001                1.000     0.100
";
        let d = parse_code_dcb(text);
        assert_eq!(d.len(), 2);
        assert_eq!(d["G01"], -0.811);
    }

    #[test]
    fn body_axes_are_right_handed_with_z_to_the_earth() {
        let (ex, ey, ez) = body_axes([2.6e7, 0.0, 0.0], [1.5e11, 1.0e10, 0.0]);
        assert!((ez[0] + 1.0).abs() < 1e-15);
        let c = cross(ex, ey);
        for k in 0..3 {
            assert!((c[k] - ez[k]).abs() < 1e-12);
        }
        // x points towards the Sun side.
        assert!(ex[1] > 0.0);
    }
}
