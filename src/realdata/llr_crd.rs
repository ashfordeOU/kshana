// SPDX-License-Identifier: AGPL-3.0-only
//! Reader for **ILRS Consolidated Laser Ranging Data (CRD)** normal-point files — real,
//! measured lunar laser ranging (LLR) observations.
//!
//! A lunar normal point is a genuinely measured quantity: a laser pulse leaves a ground
//! station, a handful of the ~10¹⁷ photons in it come back off one of the five corner-cube
//! arrays left on the Moon between 1969 and 1973, and the round-trip time of flight of the
//! surviving returns over a short bin is compressed into one point. The archive of those
//! points is public and open at the two ILRS data centres. This module parses the file
//! format; it computes no physics.
//!
//! ## What one record carries
//!
//! The CRD format — R. L. Ricklefs (UT Austin / CSR) and C. J. Moore (EOS Space Systems),
//! *Consolidated Laser Ranging Data Format (CRD)* v1.01, 27 October 2009, for the ILRS Data
//! Formats and Procedures Working Group,
//! <https://ilrs.gsfc.nasa.gov/docs/2009/crd_v1.01.pdf> — is record-oriented, one session
//! per `h1 … H8` block. Only four record types matter here:
//!
//! | record | carries |
//! |--------|---------|
//! | `h1`   | format version |
//! | `h2`   | station: four-character CRD name, ILRS numeric id, and the **time scale** the epochs are in |
//! | `h3`   | target: the archive's target name (`apollo15`, `luna17`, …) |
//! | `h4`   | session start and end date/time (UTC) |
//! | `11`   | the normal point itself |
//!
//! Record `11`'s leading fields are identical in CRD v1 and v2 and are the only ones read:
//! seconds of day, **two-way** time of flight (s), system configuration id, epoch event,
//! normal-point window length (s), number of raw ranges in the bin, and the bin RMS (ps) —
//! the spec's own wording for the last two being "number of raw ranges (after editing)
//! compressed into the normal point" and "bin RMS from the mean of raw accepted time of
//! flight values minus the trend function (ps)".
//!
//! The spec's epoch-event code `2` is "ground transmit time (at SRP) (2 way)", which is what
//! every record in the committed fixture carries and the only convention
//! [`crate::lunar_llr`] solves a light time for.
//!
//! ## Precision comes out of the file, not out of an assumption
//!
//! The bin RMS is the scatter of the raw ranges that went into the point, in picoseconds of
//! two-way time of flight, and the raw-range count is how many there were. The standard
//! error of the normal point is therefore `bin_rms / sqrt(n_raw)`
//! ([`LlrNormalPoint::sigma_two_way_s`]) — a **measured** per-observation sigma, not a stated
//! one. That is the whole reason this reader exists.
//!
//! ## What the file does *not* correct for
//!
//! The archived time of flight has the station's own calibration (system delay) removed. It
//! is **not** corrected for tropospheric refraction, for the station eccentricity between the
//! ITRF reference point and the telescope's intersection of axes, or for any relativistic
//! term. A consumer that wants an observed-minus-computed residual must model those itself,
//! and [`crate::lunar_llr`] names the ones it does not.

use std::path::Path;

/// One lunar laser ranging normal point, exactly as the file states it.
#[derive(Clone, Debug, PartialEq)]
pub struct LlrNormalPoint {
    /// Four-character CRD station name from the `h2` record (`GRSM`, `MATM`, `APOL`).
    pub station_name: String,
    /// ILRS numeric station id from the `h2` record (`7845`, `7941`, `7045`).
    pub station_id: u32,
    /// CRD epoch time-scale code from the `h2` record: `3` = UTC(USNO), `4` = UTC(GPS),
    /// `7` = UTC(BIH). The spec reserves `1-2, 5-6, 8-9` for obsolete scales and `10` and
    /// above for station time scales, and states that analysts discard anything but 3, 4
    /// and 7 — so this reader does too, rather than silently read another scale as UTC.
    pub time_scale: u32,
    /// Archive target name from the `h3` record (`apollo11`, `apollo14`, `apollo15`,
    /// `luna17`, `luna21`).
    pub target: String,
    /// Julian date (UTC) of the epoch the `11` record timestamps.
    pub jd_utc: f64,
    /// **Two-way** time of flight (s), calibration-corrected, as archived.
    pub two_way_tof_s: f64,
    /// CRD epoch-event code. `2` is the ground transmit time at the station reference
    /// point, which is what every record in the committed fixture carries.
    pub epoch_event: u32,
    /// Normal-point bin length (s).
    pub window_s: f64,
    /// Number of raw ranges compressed into this point.
    pub raw_ranges: u32,
    /// RMS of the raw ranges about the bin trend, in **picoseconds of two-way time of
    /// flight**.
    pub bin_rms_ps: f64,
}

impl LlrNormalPoint {
    /// Standard error of the normal point in two-way seconds: `bin_rms / sqrt(n_raw)`.
    ///
    /// Returns `None` when the file gives no usable precision (a zero bin RMS or an empty
    /// bin), so a caller weights by a measured sigma or drops the point — never by a
    /// substituted one.
    pub fn sigma_two_way_s(&self) -> Option<f64> {
        if self.bin_rms_ps > 0.0 && self.raw_ranges > 0 {
            Some(self.bin_rms_ps * 1.0e-12 / (self.raw_ranges as f64).sqrt())
        } else {
            None
        }
    }

    /// The same standard error expressed as a **one-way range** sigma (m):
    /// `c · sigma_two_way / 2`.
    pub fn sigma_range_m(&self) -> Option<f64> {
        self.sigma_two_way_s()
            .map(|s| s * crate::timegeo::C_M_PER_S / 2.0)
    }

    /// One-way geometric range implied by the archived time of flight (m),
    /// `c · tof / 2` — the measurement itself, with no model applied.
    pub fn one_way_range_m(&self) -> f64 {
        self.two_way_tof_s * crate::timegeo::C_M_PER_S / 2.0
    }
}

/// Julian date (UTC) at 00:00 of a civil date, via [`crate::timescales::julian_date`].
fn jd_at_midnight(year: i32, month: u32, day: u32) -> f64 {
    crate::timescales::julian_date(year, month, day, 0, 0, 0.0)
}

/// Parse the text of one CRD normal-point file.
///
/// `label` is used only in error messages (pass the file name). Sessions whose `h1` states a
/// format version other than 1 or 2 are rejected; so is an `h2` time scale outside the three
/// the specification says analysts accept, because reading a station clock scale as UTC
/// would be a silent error at the seconds level. A record that cannot be parsed is an error, never a skipped line: a partially read
/// measurement file is the failure mode this reader exists to prevent.
pub fn parse_crd(label: &str, text: &str) -> Result<Vec<LlrNormalPoint>, String> {
    let mut out = Vec::new();
    let mut station_name = String::new();
    let mut station_id: u32 = 0;
    let mut time_scale: u32 = 0;
    let mut target = String::new();
    let mut start_jd = f64::NAN;
    let mut start_sod = f64::NAN;

    for (lineno, raw) in text.lines().enumerate() {
        let line = raw.trim_end();
        let f: Vec<&str> = line.split_whitespace().collect();
        if f.is_empty() {
            continue;
        }
        let at = |what: &str| format!("{label}:{}: {what}", lineno + 1);
        match f[0] {
            "h1" | "H1" => {
                // h1 CRD <version> <production date…>
                if f.len() < 3 {
                    return Err(at("short h1 record"));
                }
                let v: u32 = f[2]
                    .parse()
                    .map_err(|_| at(&format!("unreadable CRD version {:?}", f[2])))?;
                if v != 1 && v != 2 {
                    return Err(at(&format!(
                        "CRD format version {v} is not supported (only 1 and 2 share the \
                         record-11 field order this reader relies on)"
                    )));
                }
            }
            "h2" | "H2" => {
                if f.len() < 6 {
                    return Err(at("short h2 (station) record"));
                }
                station_name = f[1].to_string();
                station_id = f[2]
                    .parse()
                    .map_err(|_| at(&format!("unreadable station id {:?}", f[2])))?;
                time_scale = f[5]
                    .parse()
                    .map_err(|_| at(&format!("unreadable time scale {:?}", f[5])))?;
                if !matches!(time_scale, 3 | 4 | 7) {
                    return Err(at(&format!(
                        "CRD epoch time scale {time_scale} is not one of the three the \
                         format specification says analysts accept (3 = UTC(USNO), \
                         4 = UTC(GPS), 7 = UTC(BIH)); refusing to read it as UTC"
                    )));
                }
            }
            "h3" | "H3" => {
                if f.len() < 2 {
                    return Err(at("short h3 (target) record"));
                }
                target = f[1].to_string();
            }
            "h4" | "H4" => {
                // h4 <data type> <sy sm sd sh smin ssec> <ey em ed eh emin esec> …
                if f.len() < 14 {
                    return Err(at("short h4 (session) record"));
                }
                let num = |i: usize| -> Result<f64, String> {
                    f[i].parse::<f64>()
                        .map_err(|_| at(&format!("unreadable h4 field {i}: {:?}", f[i])))
                };
                let (y, mo, d) = (num(2)? as i32, num(3)? as u32, num(4)? as u32);
                let (h, mi, s) = (num(5)?, num(6)?, num(7)?);
                start_jd = jd_at_midnight(y, mo, d);
                start_sod = h * 3600.0 + mi * 60.0 + s;
            }
            "11" => {
                if f.len() < 7 {
                    return Err(at("short normal-point (11) record"));
                }
                if station_id == 0 || target.is_empty() || !start_jd.is_finite() {
                    return Err(at(
                        "a normal-point record appeared before its h2/h3/h4 session header",
                    ));
                }
                let num = |i: usize| -> Result<f64, String> {
                    f[i].parse::<f64>()
                        .map_err(|_| at(&format!("unreadable field {i}: {:?}", f[i])))
                };
                let mut sod = num(1)?;
                let tof = num(2)?;
                let epoch_event: u32 = f[4]
                    .parse()
                    .map_err(|_| at(&format!("unreadable epoch event {:?}", f[4])))?;
                let window = num(5)?;
                let raw_ranges: u32 = num(6)? as u32;
                let bin_rms = num(7).unwrap_or(0.0);
                if !(tof.is_finite() && tof > 0.0) {
                    return Err(at(&format!("non-physical time of flight {tof}")));
                }
                // A session that crosses midnight keeps counting seconds of day from the new
                // day while `h4` still names the old one. More than twelve hours *before* the
                // session start is the unambiguous signature.
                if sod + 43_200.0 < start_sod {
                    sod += 86_400.0;
                }
                out.push(LlrNormalPoint {
                    station_name: station_name.clone(),
                    station_id,
                    time_scale,
                    target: target.clone(),
                    jd_utc: start_jd + sod / 86_400.0,
                    two_way_tof_s: tof,
                    epoch_event,
                    window_s: window,
                    raw_ranges,
                    bin_rms_ps: bin_rms,
                });
            }
            _ => {}
        }
    }
    Ok(out)
}

/// Read and parse every `*.npt` file in `dir`, in sorted file-name order.
///
/// The sort makes the accumulation order deterministic, which matters because a Fisher
/// information matrix summed in a different order is a different float.
pub fn read_crd_dir(dir: &Path) -> Result<Vec<LlrNormalPoint>, String> {
    let mut paths: Vec<_> = std::fs::read_dir(dir)
        .map_err(|e| format!("cannot read normal-point directory {}: {e}", dir.display()))?
        .filter_map(|e| e.ok().map(|e| e.path()))
        .filter(|p| p.extension().and_then(|s| s.to_str()) == Some("npt"))
        .collect();
    paths.sort();
    if paths.is_empty() {
        return Err(format!(
            "no *.npt normal-point files in {} — this scenario reads real archived \
             measurements and will not run without them",
            dir.display()
        ));
    }
    let mut all = Vec::new();
    for p in &paths {
        let text =
            std::fs::read_to_string(p).map_err(|e| format!("cannot read {}: {e}", p.display()))?;
        let name = p
            .file_name()
            .and_then(|s| s.to_str())
            .unwrap_or("<file>")
            .to_string();
        all.extend(parse_crd(&name, &text)?);
    }
    Ok(all)
}

#[cfg(test)]
mod tests {
    use super::*;

    const SESSION: &str = "\
h1 CRD  1 2015  4 29 22
h2 GRSM       7845 78  1  4
h3 apollo15        103  103          0 2
h4  1 2015  4 29 21 57 46 2015  4 29 22  9  8  0 0 0 0 1 0 2 0
c0 0    1064.2   me09 las6 det2 tim2
40 78719.19           0 me09       33       33   3.716   107173      0.0       84   0.000   0.000    0.0 3 3 0
20 79114.              873.84 279.34   84 0
11 79512.253056967700     2.660923125349 me09 2  682.7    36     232.2    .400   -.600       0.0   4.9 0
50 me09  293.8  -1.000  -1.000   -1.0 1
H8
";

    #[test]
    fn one_session_parses_to_one_normal_point_with_its_measured_fields() {
        let np = parse_crd("t", SESSION).expect("parses");
        assert_eq!(np.len(), 1);
        let p = &np[0];
        assert_eq!(p.station_name, "GRSM");
        assert_eq!(p.station_id, 7845);
        assert_eq!(p.time_scale, 4);
        assert_eq!(p.target, "apollo15");
        assert_eq!(p.epoch_event, 2);
        assert_eq!(p.raw_ranges, 36);
        assert!((p.bin_rms_ps - 232.2).abs() < 1e-9);
        assert!((p.two_way_tof_s - 2.660_923_125_349).abs() < 1e-15);
        // 2015-04-29 at 79512.253056967700 s of day.
        let want = crate::timescales::julian_date(2015, 4, 29, 0, 0, 0.0)
            + 79_512.253_056_967_7 / 86_400.0;
        assert!(
            (p.jd_utc - want).abs() < 1e-12,
            "jd {} vs {}",
            p.jd_utc,
            want
        );
    }

    #[test]
    fn the_measured_sigma_is_the_bin_rms_over_root_n_and_nothing_else() {
        let p = &parse_crd("t", SESSION).unwrap()[0];
        let want = 232.2e-12 / 36.0_f64.sqrt();
        assert!((p.sigma_two_way_s().unwrap() - want).abs() < 1e-24);
        // 38.7 ps two-way ⇒ 5.8 mm one-way.
        let mm = p.sigma_range_m().unwrap() * 1e3;
        assert!((5.0..7.0).contains(&mm), "one-way sigma {mm} mm");
    }

    #[test]
    fn the_archived_time_of_flight_is_a_lunar_distance() {
        let p = &parse_crd("t", SESSION).unwrap()[0];
        let km = p.one_way_range_m() / 1e3;
        assert!(
            (356_000.0..407_000.0).contains(&km),
            "one-way range {km} km is outside the perigee/apogee envelope"
        );
    }

    #[test]
    fn a_point_with_an_empty_bin_has_no_measured_sigma_rather_than_a_substituted_one() {
        let s = SESSION.replace(
            "11 79512.253056967700     2.660923125349 me09 2  682.7    36     232.2",
            "11 79512.253056967700     2.660923125349 me09 2  682.7     0       0.0",
        );
        let p = &parse_crd("t", &s).unwrap()[0];
        assert!(p.sigma_two_way_s().is_none());
        assert!(p.sigma_range_m().is_none());
    }

    #[test]
    fn a_session_crossing_midnight_rolls_the_day_over() {
        let s = SESSION
            .replace(
                "h4  1 2015  4 29 21 57 46 2015  4 29 22  9  8",
                "h4  1 2015  4 29 23 50  0 2015  4 30  0 10  0",
            )
            .replace("11 79512.253056967700", "11   600.000000000000");
        let p = &parse_crd("t", &s).unwrap()[0];
        let want = crate::timescales::julian_date(2015, 4, 30, 0, 0, 0.0) + 600.0 / 86_400.0;
        assert!((p.jd_utc - want).abs() < 1e-12);
    }

    #[test]
    fn a_non_utc_time_scale_is_refused_not_read_as_utc() {
        let s = SESSION.replace("h2 GRSM       7845 78  1  4", "h2 GRSM       7845 78  1  1");
        let e = parse_crd("t", &s).expect_err("must refuse");
        assert!(e.contains("time scale"), "{e}");
    }

    #[test]
    fn an_unsupported_format_version_is_refused() {
        let s = SESSION.replace("h1 CRD  1 2015", "h1 CRD  3 2015");
        let e = parse_crd("t", &s).expect_err("must refuse");
        assert!(e.contains("version 3"), "{e}");
    }
}
