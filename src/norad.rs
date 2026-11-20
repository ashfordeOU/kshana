// SPDX-License-Identifier: AGPL-3.0-only
//! NORAD satellite catalogue numbers beyond 99,999: the Alpha-5 TLE field and the OMM path.
//!
//! A two-line element set holds the catalogue number in five columns (line 1 columns 3-7,
//! line 2 columns 3-7), so it cannot hold a number above 99,999. The five-digit range ran out in
//! November 2026. The stop-gap Space-Track adopted is **Alpha-5**: the first column becomes a
//! letter that stands for the two leading digits, `A` = 10 through `Z` = 33, skipping `I` and
//! `O` (they read as `1` and `0`), so `A0000` = 100,000 and `Z9999` = 339,999. Numbers above
//! 339,999 cannot be written in a TLE at all; Space-Track's advice is to move to the CCSDS
//! Orbit Mean-Elements Message (OMM), whose `NORAD_CAT_ID` is a plain integer (nine digits).
//!
//! * [`decode`] reads a five-column catalogue field (digits or Alpha-5) into the number.
//! * [`encode`] writes a number into the five-column field, Alpha-5 above 99,999, and refuses
//!   a number Alpha-5 cannot hold (so a caller knows to write OMM instead of truncating).
//! * [`catalogue_number_from_omm`] and [`tle_from_omm`] read the same object from an OMM
//!   ([`crate::odm::OmmMessage`], KVN or XML) into the catalogue number and SGP4 elements with
//!   no five-digit limit: the robust path.
//!
//! The TLE checksum is unchanged by Alpha-5: a letter counts as 0, like every non-digit
//! other than `-` ([`crate::tle::tle_checksum`]).

use crate::odm::OmmMessage;
use crate::tle::Tle;

/// Largest catalogue number a plain five-digit TLE field holds.
pub const FIVE_DIGIT_MAX: u32 = 99_999;
/// Largest catalogue number Alpha-5 holds (`Z9999`).
pub const ALPHA5_MAX: u32 = 339_999;
/// Largest catalogue number an OMM `NORAD_CAT_ID` may carry (nine digits, CCSDS 502.0-B-3).
pub const OMM_MAX: u32 = 999_999_999;

/// The Alpha-5 letters in order; the letter at index `k` stands for `10 + k`.
const LETTERS: &[u8; 24] = b"ABCDEFGHJKLMNPQRSTUVWXYZ";

/// The catalogue number in a five-column TLE field: five digits (leading spaces or zeros
/// allowed), or an Alpha-5 letter followed by four digits. Surrounding blanks are ignored.
/// A lower-case letter, `I`, `O`, a sign, or any other character is an error.
pub fn decode(field: &str) -> Result<u32, String> {
    let f = field.trim();
    let b = f.as_bytes();
    let bad = || crate::terr!("e-norad-bad-catalogue-field", field = format!("{field:?}"));
    if b.is_empty() || b.len() > 5 {
        return Err(bad());
    }
    let digits = |s: &[u8]| -> Option<u32> {
        if s.iter().all(u8::is_ascii_digit) {
            Some(s.iter().fold(0u32, |a, &d| a * 10 + u32::from(d - b'0')))
        } else {
            None
        }
    };
    if b[0].is_ascii_digit() {
        return digits(b).ok_or_else(bad);
    }
    // Alpha-5 needs exactly a letter and four digits.
    if b.len() != 5 {
        return Err(bad());
    }
    let k = LETTERS.iter().position(|&l| l == b[0]).ok_or_else(bad)? as u32;
    let rest = digits(&b[1..]).ok_or_else(bad)?;
    Ok((10 + k) * 10_000 + rest)
}

/// The five-column TLE field for catalogue number `n`: zero-padded digits up to 99,999,
/// Alpha-5 from 100,000 to 339,999. Above that the number does not fit a TLE and this returns
/// an error that says to use OMM.
pub fn encode(n: u32) -> Result<String, String> {
    if n <= FIVE_DIGIT_MAX {
        return Ok(format!("{n:05}"));
    }
    if n <= ALPHA5_MAX {
        let lead = n / 10_000;
        let letter = LETTERS[(lead - 10) as usize] as char;
        return Ok(format!("{letter}{:04}", n % 10_000));
    }
    Err(crate::terr!("e-norad-beyond-alpha5", n = n))
}

/// True if `field` is written in Alpha-5 (a letter in its first column).
pub fn is_alpha5(field: &str) -> bool {
    field
        .trim()
        .as_bytes()
        .first()
        .is_some_and(|c| c.is_ascii_alphabetic())
}

/// The `NORAD_CAT_ID` of an OMM, read from its TLE-parameters block (or, failing that, its
/// metadata). It is an unsigned integer of up to nine digits, never limited to five.
pub fn catalogue_number_from_omm(m: &OmmMessage) -> Result<u32, String> {
    let v = m
        .tle
        .as_ref()
        .and_then(|s| s.get("NORAD_CAT_ID"))
        .or_else(|| m.metadata.get("NORAD_CAT_ID"))
        .ok_or_else(|| crate::terr!("e-norad-omm-no-cat-id"))?
        .trim();
    let bad = || crate::terr!("e-norad-omm-bad-cat-id", value = format!("{v:?}"));
    if v.is_empty() || v.len() > 9 || !v.bytes().all(|c| c.is_ascii_digit()) {
        return Err(bad());
    }
    v.parse::<u32>().map_err(|_| bad())
}

/// Days from 1950-01-00.0 (SGP4's epoch origin) to the start of `year`, so that adding a
/// 1-based day of year gives the SGP4 epoch.
fn days_1950_to_year(year: i64) -> i64 {
    let days_to = |y: i64| 365 * y + y.div_euclid(4) - y.div_euclid(100) + y.div_euclid(400);
    days_to(year - 1) - days_to(1949)
}

/// An epoch `YYYY-MM-DDThh:mm:ss[.f]` or `YYYY-DDDThh:mm:ss[.f]` (an optional trailing `Z`),
/// as days since 1950 Jan 0.0 in the epoch's own time scale.
pub fn epoch_days_1950(s: &str) -> Result<f64, String> {
    let bad = || crate::terr!("e-norad-bad-epoch", value = format!("{s:?}"));
    let s2 = s.trim().trim_end_matches('Z');
    if !s2.is_ascii() {
        return Err(bad());
    }
    let (date, time) = s2.split_once('T').unwrap_or((s2, "00:00:00"));
    let parts: Vec<&str> = date.split('-').collect();
    let int = |t: &str, max: i64| -> Result<i64, String> {
        if t.is_empty() || t.len() > 4 || !t.bytes().all(|c| c.is_ascii_digit()) {
            return Err(bad());
        }
        let v: i64 = t.parse().map_err(|_| bad())?;
        if v > max {
            return Err(bad());
        }
        Ok(v)
    };
    let year = int(parts.first().copied().unwrap_or(""), 9999)?;
    if !(1950..=2100).contains(&year) {
        return Err(bad());
    }
    let leap = (year % 4 == 0 && year % 100 != 0) || year % 400 == 0;
    let doy = match parts.len() {
        2 => {
            let d = int(parts[1], 366)?;
            if d < 1 || (d == 366 && !leap) {
                return Err(bad());
            }
            d
        }
        3 => {
            let m = int(parts[1], 12)?;
            let d = int(parts[2], 31)?;
            const CUM: [i64; 12] = [0, 31, 59, 90, 120, 151, 181, 212, 243, 273, 304, 334];
            const LEN: [i64; 12] = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
            if m < 1 {
                return Err(bad());
            }
            let len = LEN[(m - 1) as usize] + i64::from(leap && m == 2);
            if d < 1 || d > len {
                return Err(bad());
            }
            CUM[(m - 1) as usize] + d + i64::from(leap && m > 2)
        }
        _ => return Err(bad()),
    };
    let tp: Vec<&str> = time.split(':').collect();
    if tp.len() != 3 {
        return Err(bad());
    }
    let hh = int(tp[0], 23)?;
    let mm = int(tp[1], 59)?;
    if tp[2].is_empty() || !tp[2].bytes().all(|c| c.is_ascii_digit() || c == b'.') {
        return Err(bad());
    }
    let ss: f64 = tp[2].parse().map_err(|_| bad())?;
    if !(0.0..61.0).contains(&ss) {
        return Err(bad());
    }
    Ok(days_1950_to_year(year) as f64
        + doy as f64
        + (hh as f64 * 3600.0 + mm as f64 * 60.0 + ss) / 86_400.0)
}

/// SGP4 elements from an OMM's mean elements and TLE parameters (`EPOCH`, `MEAN_MOTION`
/// rev/day, `ECCENTRICITY`, `INCLINATION`, `RA_OF_ASC_NODE`, `ARG_OF_PERICENTER`,
/// `MEAN_ANOMALY` in degrees, `BSTAR` 1/earth-radii, 0 when absent), with the catalogue
/// number. The same range checks as a TLE apply. Nothing here limits the catalogue number to
/// five digits.
pub fn tle_from_omm(m: &OmmMessage) -> Result<(u32, Tle), String> {
    let id = catalogue_number_from_omm(m)?;
    let me = &m.mean_elements;
    let need = |k: &str| -> Result<f64, String> {
        let v = me
            .num(k)?
            .ok_or_else(|| crate::terr!("e-norad-omm-missing", key = k))?;
        if v.is_finite() {
            Ok(v)
        } else {
            Err(crate::terr!("e-norad-omm-missing", key = k))
        }
    };
    let epoch = me
        .get("EPOCH")
        .ok_or_else(|| crate::terr!("e-norad-omm-missing", key = "EPOCH"))?;
    let epoch_days_1950 = epoch_days_1950(epoch)?;
    let n = need("MEAN_MOTION")?;
    let e = need("ECCENTRICITY")?;
    let i = need("INCLINATION")?;
    let raan = need("RA_OF_ASC_NODE")?;
    let argp = need("ARG_OF_PERICENTER")?;
    let ma = need("MEAN_ANOMALY")?;
    let bstar = match m
        .tle
        .as_ref()
        .map(|s| s.num("BSTAR"))
        .transpose()?
        .flatten()
    {
        Some(b) if b.is_finite() => b,
        Some(_) => return Err(crate::terr!("e-norad-omm-missing", key = "BSTAR")),
        None => 0.0,
    };
    if !(0.0..=180.0).contains(&i) || !(0.0..1.0).contains(&e) || n <= 0.0 {
        return Err(crate::terr!("e-norad-omm-elements-out-of-range"));
    }
    Ok((
        id,
        Tle {
            epoch_days_1950,
            bstar,
            ecco: e,
            argpo_rad: argp.to_radians(),
            inclo_rad: i.to_radians(),
            mo_rad: ma.to_radians(),
            no_kozai_rad_min: n * std::f64::consts::TAU / 1440.0,
            nodeo_rad: raan.to_radians(),
        },
    ))
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn alpha5_round_trips_over_the_whole_range() {
        for n in (0..=ALPHA5_MAX).step_by(7) {
            let f = encode(n).unwrap();
            assert_eq!(f.len(), 5);
            assert_eq!(decode(&f).unwrap(), n, "{f}");
            assert_eq!(is_alpha5(&f), n > FIVE_DIGIT_MAX);
        }
        assert_eq!(encode(100_000).unwrap(), "A0000");
        assert_eq!(encode(339_999).unwrap(), "Z9999");
        assert_eq!(encode(180_000).unwrap(), "J0000");
        assert_eq!(encode(230_000).unwrap(), "P0000");
        assert!(encode(340_000).is_err());
        for bad in [
            "I0000", "O1234", "a0000", "A000", "A00000", "-1234", "", "A12B4", "1 2 3",
        ] {
            assert!(decode(bad).is_err(), "{bad}");
        }
        assert_eq!(decode("  123").unwrap(), 123);
        assert_eq!(decode("25544").unwrap(), 25544);
    }

    #[test]
    fn epochs_in_both_ccsds_forms() {
        // 1950-01-01T00:00 is day 1.0 of the SGP4 epoch count.
        assert_eq!(epoch_days_1950("1950-01-01T00:00:00").unwrap(), 1.0);
        let a = epoch_days_1950("2026-11-14T12:00:00").unwrap();
        let b = epoch_days_1950("2026-318T12:00:00.000Z").unwrap();
        assert_eq!(a, b);
        assert!(epoch_days_1950("2026-02-29T00:00:00").is_err());
        assert!(epoch_days_1950("2024-366T00:00:00").is_ok());
        assert!(epoch_days_1950("2026-13-01T00:00:00").is_err());
    }

    #[test]
    fn the_tle_epoch_count_agrees_with_the_tle_reader() {
        let l1 = "1 25544U 98067A   24001.50000000  .00000000  00000-0  00000-0 0  9990";
        let l2 = "2 25544  51.6400 247.4627 0006703 130.5360 325.0288 15.72125391563537";
        let t = crate::tle::parse_tle(l1, l2).unwrap();
        assert_eq!(
            t.epoch_days_1950,
            epoch_days_1950("2024-001T12:00:00").unwrap()
        );
    }
}
