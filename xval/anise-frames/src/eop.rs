// SPDX-License-Identifier: AGPL-3.0-only
//! IERS Earth-orientation parameters from the official `finals2000A` product.
//!
//! Both sides of the frame cross-check must be driven by the SAME Earth-orientation
//! parameters (UT1−UTC and the polar-motion pole `x_p`, `y_p`); otherwise the
//! comparison measures EOP-source disagreement rather than frame-model disagreement.
//! ANISE's high-precision Earth body-fixed frame (ITRF93) bakes in the IERS EOP that
//! JPL packaged into `earth_latest_high_prec.bpc`; this module reads the same IERS
//! series so `kshana`'s CIO chain can be fed identical values.
//!
//! Parses the fixed-column `finals.all.iau2000.txt` (a.k.a. `finals2000A.all`) format
//! published by the IERS Rapid Service. Only the Bulletin A final columns are read
//! (flagged `I` = IERS final, never the `P` predictions). Column map (1-indexed, per
//! the IERS `readme.finals2000A`), verified against real rows:
//!
//! | field        | columns | 0-indexed slice |
//! |--------------|---------|-----------------|
//! | MJD          | 8–15    | `[7..15]`       |
//! | PM-x (arcsec)| 19–27   | `[18..27]`      |
//! | PM-y (arcsec)| 38–46   | `[37..46]`      |
//! | UT1−UTC (s)  | 59–68   | `[58..68]`      |

/// One day of IERS Earth-orientation parameters.
#[derive(Clone, Copy, Debug, PartialEq)]
pub struct EopRecord {
    /// Modified Julian Date (UTC) of the entry.
    pub mjd: f64,
    /// UT1 − UTC, seconds.
    pub ut1_utc_s: f64,
    /// Polar-motion pole x, arc seconds.
    pub xp_arcsec: f64,
    /// Polar-motion pole y, arc seconds.
    pub yp_arcsec: f64,
}

/// Parse one `finals2000A` data line into an [`EopRecord`], or `None` if the line is
/// too short or the Bulletin A final fields are blank (a prediction-only / future row).
pub fn parse_line(line: &str) -> Option<EopRecord> {
    if line.len() < 68 {
        return None;
    }
    let mjd = line.get(7..15)?.trim().parse::<f64>().ok()?;
    let xp = line.get(18..27)?.trim().parse::<f64>().ok()?;
    let yp = line.get(37..46)?.trim().parse::<f64>().ok()?;
    let ut1 = line.get(58..68)?.trim().parse::<f64>().ok()?;
    Some(EopRecord {
        mjd,
        ut1_utc_s: ut1,
        xp_arcsec: xp,
        yp_arcsec: yp,
    })
}

/// Parse every readable Bulletin A final row from a `finals2000A` file body.
pub fn parse_all(body: &str) -> Vec<EopRecord> {
    body.lines().filter_map(parse_line).collect()
}

/// Look up the EOP record whose MJD is closest to `mjd` (the daily series is sampled
/// at integer MJD; the chosen validation epochs land exactly on entries). Returns
/// `None` if `records` is empty.
pub fn nearest(records: &[EopRecord], mjd: f64) -> Option<EopRecord> {
    records.iter().copied().min_by(|a, b| {
        (a.mjd - mjd)
            .abs()
            .partial_cmp(&(b.mjd - mjd).abs())
            .unwrap_or(std::cmp::Ordering::Equal)
    })
}

#[cfg(test)]
mod tests {
    use super::*;

    // Real rows lifted verbatim from IERS finals2000A.all (Bulletin A final, flag `I`).
    // MJD 58849 = 2020-01-01; 59000 = 2020-05-31 (date fields glued: "20 531").
    const ROW_2020_01_01: &str = "20 1 1 58849.00 I  0.076577 0.000032  0.282336 0.000027  I-0.1771554 0.0000055  0.4379 0.0061  I     0.489    0.403     0.146    0.117  0.076606  0.282327 -0.1771303     0.303     0.055  ";
    const ROW_2020_05_31: &str = "20 531 59000.00 I  0.113103 0.000017  0.442354 0.000020  I-0.2540873 0.0000031  0.4725 0.0018  I     0.203    0.246    -0.206    0.222  0.113116  0.442389 -0.2540943     0.140    -0.144  ";

    #[test]
    fn parses_the_documented_columns_of_a_real_row() {
        let r = parse_line(ROW_2020_01_01).expect("row must parse");
        assert_eq!(r.mjd, 58849.0);
        assert_eq!(r.xp_arcsec, 0.076577);
        assert_eq!(r.yp_arcsec, 0.282336);
        assert_eq!(r.ut1_utc_s, -0.1771554);
    }

    #[test]
    fn parses_a_row_with_glued_date_fields() {
        // "20 531" = year 20, month 5, day 31 with no separating space — the column
        // parser must not depend on whitespace tokenization.
        let r = parse_line(ROW_2020_05_31).expect("row must parse");
        assert_eq!(r.mjd, 59000.0);
        assert_eq!(r.xp_arcsec, 0.113103);
        assert_eq!(r.yp_arcsec, 0.442354);
        assert_eq!(r.ut1_utc_s, -0.2540873);
    }

    #[test]
    fn rejects_a_short_or_blank_line() {
        assert!(parse_line("").is_none());
        assert!(parse_line("too short").is_none());
    }

    #[test]
    fn parse_all_and_nearest_select_the_right_day() {
        let body = format!("{ROW_2020_01_01}\n{ROW_2020_05_31}\n");
        let recs = parse_all(&body);
        assert_eq!(recs.len(), 2);
        // Nearest to 58849.4 is the 2020-01-01 entry.
        assert_eq!(nearest(&recs, 58849.4).unwrap().mjd, 58849.0);
        assert_eq!(nearest(&recs, 58990.0).unwrap().mjd, 59000.0);
        assert!(nearest(&[], 0.0).is_none());
    }
}
