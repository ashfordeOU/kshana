// SPDX-License-Identifier: Apache-2.0
//! Two-line element set (TLE) ingestion.
//!
//! Two ways to turn a NORAD/Celestrak TLE into a propagator, chosen by what the
//! input provides:
//!
//! - [`parse_tle`] reads a **full** two-line set (line 1 + line 2) into [`Tle`],
//!   which builds a full [`Sgp4`] propagator — the SGP4/SDP4 model the elements
//!   are defined against, including drag and the deep-space terms.
//! - [`parse_line2`] reads **only line 2** into the analytic Keplerian [`Orbit`]
//!   (inclination, RAAN, eccentricity, argument of perigee, mean anomaly, mean
//!   motion; `a = (mu / n^2)^(1/3)`). This two-body (optionally secular-J2) model
//!   ignores the line-1 drag/epoch terms — accurate near epoch, drifting from
//!   SGP4 over time; a sound first-order model for a common-epoch snapshot study.
//!
//! [`parse_propagators`] dispatches over a block of text: a line 2 preceded by
//! its line 1 becomes SGP4, a bare line 2 stays Keplerian, and the two may be
//! mixed. [`parse_set`] keeps the legacy all-Keplerian behaviour.

use crate::orbit::{Orbit, MU_EARTH};
use crate::sgp4::{GravConst, Sgp4};

/// Seconds per day, for converting mean motion (rev/day) to rad/s.
const SECONDS_PER_DAY: f64 = 86_400.0;

/// True if `year` is a Gregorian leap year.
fn is_leap(year: i64) -> bool {
    (year % 4 == 0 && year % 100 != 0) || year % 400 == 0
}

/// Days from 1950 Jan 0.0 to the start of `year` (Jan 0.0), i.e. the number of
/// days in the years `[1950, year)`. Combined with the TLE epoch day-of-year this
/// gives the SGP4 epoch in days since 1950 Jan 0.0.
fn days_1950_to_year(year: i64) -> f64 {
    let mut days = 0i64;
    let mut y = 1950;
    while y < year {
        days += if is_leap(y) { 366 } else { 365 };
        y += 1;
    }
    days as f64
}

/// A full two-line element set parsed into SGP4 inputs (SGP4 units: angles in
/// radians, mean motion in rad/min, epoch in days since 1950 Jan 0.0 UTC).
#[derive(Clone, Copy, Debug)]
pub struct Tle {
    pub epoch_days_1950: f64,
    pub bstar: f64,
    pub ecco: f64,
    pub argpo_rad: f64,
    pub inclo_rad: f64,
    pub mo_rad: f64,
    pub no_kozai_rad_min: f64,
    pub nodeo_rad: f64,
}

impl Tle {
    /// Build an SGP4 propagator from these elements with the given gravity model
    /// and operation mode (`afspc = false` selects the modern improved mode).
    pub fn to_sgp4(&self, grav: GravConst, afspc: bool) -> Sgp4 {
        Sgp4::new(
            grav,
            afspc,
            self.epoch_days_1950,
            self.bstar,
            self.ecco,
            self.argpo_rad,
            self.inclo_rad,
            self.mo_rad,
            self.no_kozai_rad_min,
            self.nodeo_rad,
        )
    }
}

/// Reject a TLE line that is not pure ASCII. The fixed-column format is defined
/// over single-byte characters; a multi-byte char would make the byte columns
/// misalign (and a naive `&str` byte slice would panic on a char boundary), so a
/// non-ASCII line is rejected up front rather than parsed.
fn ascii_guard(line: &str, label: &str) -> Result<(), String> {
    if line.is_ascii() {
        Ok(())
    } else {
        Err(format!("non-ASCII characters in TLE {label}: {line:?}"))
    }
}

/// Trimmed fixed-column field `[a, z)`. Returns an `Err` (never panics) if the
/// line is too short for the range — callers have already run [`ascii_guard`], so
/// byte offsets equal character offsets and `get` only guards the length.
fn col<'a>(line: &'a str, a: usize, z: usize, what: &str) -> Result<&'a str, String> {
    line.get(a..z)
        .map(str::trim)
        .ok_or_else(|| format!("TLE truncated reading {what} (columns {}..{})", a + 1, z))
}

/// The TLE line checksum: the sum of the digits in columns 1..68 (each `-` counts
/// as 1, everything else as 0) taken modulo 10. The published line carries this
/// value in column 69.
pub fn tle_checksum(line: &str) -> u32 {
    line.bytes()
        .take(68)
        .map(|b| match b {
            b'0'..=b'9' => (b - b'0') as u32,
            b'-' => 1,
            _ => 0,
        })
        .sum::<u32>()
        % 10
}

/// Verify the modulo-10 checksum in column 69 against the computed value.
/// Used only in strict mode; many synthetic/teaching TLEs carry placeholder
/// checksum digits, so lenient parsing skips this.
pub fn verify_checksum(line: &str, label: &str) -> Result<(), String> {
    let want = line
        .as_bytes()
        .get(68)
        .copied()
        .ok_or_else(|| format!("TLE {label} too short for a column-69 checksum"))?;
    if !want.is_ascii_digit() {
        return Err(format!("TLE {label} has no checksum digit in column 69"));
    }
    let want = (want - b'0') as u32;
    let got = tle_checksum(line);
    if want != got {
        return Err(format!(
            "TLE {label} checksum mismatch: column 69 says {want}, computed {got}"
        ));
    }
    Ok(())
}

/// Parse a full TLE (line 1 + line 2) into [`Tle`] for SGP4 propagation. Fixed
/// columns per the NORAD format; the exponent fields (`nddot`, `bstar`) carry an
/// implied leading decimal point and a trailing power-of-ten.
///
/// Lines must be pure ASCII and at least the standard 63 columns; element values
/// are range-checked (inclination in `[0, 180]`, eccentricity in `[0, 1)`, mean
/// motion positive). Returns a descriptive `Err` — never panics — on malformed
/// input. The column-69 checksum is *not* enforced here (see [`verify_checksum`]
/// and [`parse_propagators_opts`] for strict-mode checking).
pub fn parse_tle(line1: &str, line2: &str) -> Result<Tle, String> {
    ascii_guard(line1, "line 1")?;
    ascii_guard(line2, "line 2")?;
    if !line1.starts_with("1 ") || line1.len() < 63 {
        return Err(format!("not a TLE line 1: {line1:?}"));
    }
    if !line2.starts_with("2 ") || line2.len() < 63 {
        return Err(format!("not a TLE line 2: {line2:?}"));
    }
    let num = |s: &str, what: &str| -> Result<f64, String> {
        s.trim()
            .parse::<f64>()
            .map_err(|_| format!("invalid {what} in TLE: {s:?}"))
    };
    // Epoch: two-digit year (57-99 -> 19xx, 00-56 -> 20xx) and day-of-year.
    let yy: i64 = col(line1, 18, 20, "epoch year")?.parse().map_err(|_| {
        format!(
            "invalid epoch year in TLE: {:?}",
            col(line1, 18, 20, "").ok()
        )
    })?;
    let year = if yy < 57 { 2000 + yy } else { 1900 + yy };
    let epochdays = num(col(line1, 20, 32, "epoch day")?, "epoch day")?;
    // SGP4 epoch in days since 1950 Jan 0.0 (day-of-year is 1-based; Jan 1.0 -> 1.0).
    let epoch_days_1950 = days_1950_to_year(year) + epochdays;

    // bstar: sign at col 54, 5-digit mantissa, 2-char power of ten.
    let bstar = parse_decimal_exp(
        col(line1, 53, 54, "bstar sign")?,
        col(line1, 54, 59, "bstar mantissa")?,
        col(line1, 59, 61, "bstar exponent")?,
        "bstar",
    )?;

    let inclo = num(col(line2, 8, 16, "inclination")?, "inclination")?;
    let nodeo = num(col(line2, 17, 25, "RAAN")?, "RAAN")?;
    let ecco = num(
        &format!("0.{}", col(line2, 26, 33, "eccentricity")?),
        "eccentricity",
    )?;
    let argpo = num(
        col(line2, 34, 42, "argument of perigee")?,
        "argument of perigee",
    )?;
    let mo = num(col(line2, 43, 51, "mean anomaly")?, "mean anomaly")?;
    let no_rev_day = num(col(line2, 52, 63, "mean motion")?, "mean motion")?;

    check_elements(inclo, ecco, no_rev_day)?;

    Ok(Tle {
        epoch_days_1950,
        bstar,
        ecco,
        argpo_rad: argpo.to_radians(),
        inclo_rad: inclo.to_radians(),
        mo_rad: mo.to_radians(),
        // rev/day -> rad/min.
        no_kozai_rad_min: no_rev_day * std::f64::consts::TAU / 1440.0,
        nodeo_rad: nodeo.to_radians(),
    })
}

/// Identity metadata that lives on TLE line 1 but is not part of the bare orbital
/// [`Tle`] elements: the NORAD catalogue number, the COSPAR international
/// designator, and the epoch as an ISO-8601 day-of-year timestamp. These are
/// exactly the fields a CCSDS OMM message needs to identify an object, so they are
/// surfaced here for the OMM export path.
#[derive(Clone, Debug, PartialEq, Eq)]
pub struct TleIdentity {
    /// NORAD catalogue number (line 1, columns 3-7).
    pub norad_cat_id: u32,
    /// COSPAR international designator expanded to `YYYY-NNNP` (e.g. `1998-067A`).
    pub intl_designator: String,
    /// Epoch as a CCSDS day-of-year timestamp `YYYY-DDDThh:mm:ss.ssssss` (UTC).
    pub epoch_iso: String,
}

/// Parse the [`TleIdentity`] from a TLE line 1. Reads the same fixed columns as
/// [`parse_tle`]; returns an `Err` (never panics) on a non-line-1 or a truncated
/// line. The international designator's two-digit launch year follows the TLE
/// epoch convention (57-99 -> 19xx, 00-56 -> 20xx); the epoch is rendered in the
/// CCSDS day-of-year time form OMM uses.
pub fn parse_tle_identity(line1: &str) -> Result<TleIdentity, String> {
    ascii_guard(line1, "line 1")?;
    if !line1.starts_with("1 ") || line1.len() < 63 {
        return Err(format!("not a TLE line 1: {line1:?}"));
    }
    let norad_cat_id: u32 = col(line1, 2, 7, "catalogue number")?.parse().map_err(|_| {
        format!(
            "invalid catalogue number in TLE: {:?}",
            col(line1, 2, 7, "").ok()
        )
    })?;

    // International designator: 2-digit launch year, 3-digit launch number, piece.
    let des_yy: i64 = col(line1, 9, 11, "designator year")?
        .parse()
        .map_err(|_| "invalid designator launch year in TLE".to_string())?;
    let des_year = if des_yy < 57 {
        2000 + des_yy
    } else {
        1900 + des_yy
    };
    let launch_num = col(line1, 11, 14, "designator number")?;
    let piece = col(line1, 14, 17, "designator piece")?;
    let intl_designator = format!("{des_year:04}-{launch_num}{piece}");

    // Epoch: two-digit year + fractional day-of-year, as in parse_tle.
    let yy: i64 = col(line1, 18, 20, "epoch year")?
        .parse()
        .map_err(|_| "invalid epoch year in TLE".to_string())?;
    let year = if yy < 57 { 2000 + yy } else { 1900 + yy };
    let epochdays: f64 = col(line1, 20, 32, "epoch day")?
        .parse()
        .map_err(|_| "invalid epoch day in TLE".to_string())?;
    let doy = epochdays.floor();
    let sec_of_day = (epochdays - doy) * 86_400.0;
    let hh = (sec_of_day / 3600.0).floor();
    let mm = ((sec_of_day - hh * 3600.0) / 60.0).floor();
    let ss = sec_of_day - hh * 3600.0 - mm * 60.0;
    let doy_i = doy as u32;
    let hh_i = hh as u32;
    let mm_i = mm as u32;
    let epoch_iso = format!("{year:04}-{doy_i:03}T{hh_i:02}:{mm_i:02}:{ss:09.6}");

    Ok(TleIdentity {
        norad_cat_id,
        intl_designator,
        epoch_iso,
    })
}

/// Range-check the physical orbital elements shared by both parse paths.
fn check_elements(
    inclination_deg: f64,
    eccentricity: f64,
    mean_motion_rev_day: f64,
) -> Result<(), String> {
    if !(0.0..=180.0).contains(&inclination_deg) {
        return Err(format!(
            "inclination out of range [0, 180] deg: {inclination_deg}"
        ));
    }
    if !(0.0..1.0).contains(&eccentricity) {
        return Err(format!("eccentricity out of range [0, 1): {eccentricity}"));
    }
    if mean_motion_rev_day.is_nan() || mean_motion_rev_day <= 0.0 {
        return Err(format!("non-positive mean motion: {mean_motion_rev_day}"));
    }
    Ok(())
}

/// Parse a TLE "assumed decimal point" exponential field: a sign character, a
/// mantissa (implied leading `.`), and a signed power-of-ten exponent — e.g.
/// sign `" "`, mantissa `"28098"`, exponent `"-4"` is `+0.28098e-4`.
fn parse_decimal_exp(sign: &str, mant: &str, exp: &str, what: &str) -> Result<f64, String> {
    let m: f64 = format!("0.{}", mant.trim())
        .parse()
        .map_err(|_| format!("invalid {what} mantissa in TLE: {mant:?}"))?;
    let v = if sign.trim() == "-" { -m } else { m };
    let e: i32 = exp
        .trim()
        .parse()
        .map_err(|_| format!("invalid {what} exponent in TLE: {exp:?}"))?;
    Ok(v * 10f64.powi(e))
}

/// Parse the orbital elements from a TLE line 2 into an [`Orbit`]. The line must
/// be at least the standard 63 columns. Angles are read by their fixed columns;
/// the eccentricity has an implied leading decimal point.
pub fn parse_line2(line2: &str) -> Result<Orbit, String> {
    ascii_guard(line2, "line 2")?;
    if !line2.starts_with("2 ") || line2.len() < 63 {
        return Err(format!("not a TLE line 2: {line2:?}"));
    }
    let num = |s: &str, what: &str| -> Result<f64, String> {
        s.parse::<f64>()
            .map_err(|_| format!("invalid {what} in TLE: {s:?}"))
    };
    let inclination_deg = num(col(line2, 8, 16, "inclination")?, "inclination")?;
    let raan_deg = num(col(line2, 17, 25, "RAAN")?, "RAAN")?;
    let ecc = num(
        &format!("0.{}", col(line2, 26, 33, "eccentricity")?),
        "eccentricity",
    )?;
    let argp_deg = num(
        col(line2, 34, 42, "argument of perigee")?,
        "argument of perigee",
    )?;
    let mean_anomaly_deg = num(col(line2, 43, 51, "mean anomaly")?, "mean anomaly")?;
    let mean_motion_rev_day = num(col(line2, 52, 63, "mean motion")?, "mean motion")?;

    check_elements(inclination_deg, ecc, mean_motion_rev_day)?;
    // a = (mu / n^2)^(1/3) with n in rad/s.
    let n = mean_motion_rev_day * std::f64::consts::TAU / SECONDS_PER_DAY;
    let a = (MU_EARTH / (n * n)).cbrt();

    Ok(Orbit::keplerian(
        a,
        ecc,
        inclination_deg.to_radians(),
        raan_deg.to_radians(),
        argp_deg.to_radians(),
        mean_anomaly_deg.to_radians(),
    ))
}

/// Parse every TLE in a block of text into orbits. Any line that begins with
/// `2 ` and is long enough is treated as a line 2 (so two-line and three-line
/// "name + L1 + L2" formats both work); line 1 and name lines are ignored, since
/// only the line-2 elements are used. Returns an error if a line-2 fails to parse.
pub fn parse_set(text: &str) -> Result<Vec<Orbit>, String> {
    text.lines()
        .map(str::trim)
        .filter(|l| l.starts_with("2 ") && l.len() >= 63)
        .map(parse_line2)
        .collect()
}

/// Options controlling how a TLE block is parsed.
#[derive(Clone, Copy, Debug, Default)]
pub struct ParseOpts {
    /// When `true`, every TLE line's column-69 modulo-10 checksum must be valid
    /// or parsing fails. Off by default, because synthetic Walker and teaching
    /// element sets routinely carry placeholder checksum digits.
    pub strict_checksum: bool,
}

/// Parse a block of TLEs into satellite propagators with the default (lenient)
/// options. See [`parse_propagators_opts`].
pub fn parse_propagators(text: &str) -> Result<Vec<crate::orbit::Propagator>, String> {
    parse_propagators_opts(text, ParseOpts::default())
}

/// Parse a block of TLEs into satellite propagators. A line 2 immediately
/// preceded by its line 1 becomes a full SGP4/SDP4 propagator (WGS-72, improved
/// mode); a line 2 with no preceding line 1 is parsed as analytic Keplerian mean
/// elements (the legacy two-body path). Name lines and stray text are ignored.
/// The two forms can be mixed within one block. With `opts.strict_checksum` the
/// column-69 checksum of each consumed line is verified first.
pub fn parse_propagators_opts(
    text: &str,
    opts: ParseOpts,
) -> Result<Vec<crate::orbit::Propagator>, String> {
    use crate::orbit::Propagator;
    let grav = crate::sgp4::wgs72();
    let mut out = Vec::new();
    let mut pending_l1: Option<&str> = None;
    for raw in text.lines() {
        let line = raw.trim();
        if line.starts_with("1 ") && line.len() >= 63 {
            pending_l1 = Some(line);
        } else if line.starts_with("2 ") && line.len() >= 63 {
            if opts.strict_checksum {
                verify_checksum(line, "line 2")?;
            }
            match pending_l1.take() {
                Some(l1) => {
                    if opts.strict_checksum {
                        verify_checksum(l1, "line 1")?;
                    }
                    let tle = parse_tle(l1, line)?;
                    out.push(Propagator::Sgp4(Box::new(tle.to_sgp4(grav, false))));
                }
                None => out.push(Propagator::Kepler(parse_line2(line)?)),
            }
        } else {
            // Name line or blank: a pending line 1 without its line 2 is dropped.
            pending_l1 = None;
        }
    }
    Ok(out)
}

#[cfg(test)]
mod tests {
    use super::*;
    use crate::orbit::R_EARTH_M;

    // A well-known ISS element set (line 2). Inclination 51.64 deg, e = 0.0006703,
    // mean motion 15.7212539 rev/day -> a ~ 6.738e6 m (~370 km altitude).
    const ISS_L2: &str = "2 25544  51.6400 247.4627 0006703 130.5360 325.0288 15.72125391563537";

    #[test]
    fn parses_iss_line2_elements() {
        let o = parse_line2(ISS_L2).expect("valid TLE line 2");
        assert!((o.inclination_rad.to_degrees() - 51.64).abs() < 1e-6);
        assert!((o.raan_rad.to_degrees() - 247.4627).abs() < 1e-6);
        assert!((o.eccentricity - 0.0006703).abs() < 1e-9);
        assert!((o.argp_rad.to_degrees() - 130.536).abs() < 1e-6);
        assert!((o.u0_rad.to_degrees() - 325.0288).abs() < 1e-6);
        // Semi-major axis from the mean motion: low-Earth-orbit altitude band.
        let alt_km = (o.radius_m - R_EARTH_M) / 1000.0;
        assert!((300.0..450.0).contains(&alt_km), "altitude {alt_km} km");
    }

    #[test]
    fn semi_major_axis_matches_mean_motion() {
        // Round trip: the period from the derived a must reproduce the TLE mean
        // motion (15.7212539 rev/day -> period 86400/15.7212539 s).
        let o = parse_line2(ISS_L2).unwrap();
        let expected_period = SECONDS_PER_DAY / 15.721_253_91;
        assert!((o.period_s() - expected_period).abs() / expected_period < 1e-9);
    }

    #[test]
    fn parses_three_line_set_and_ignores_other_lines() {
        let text = "ISS (ZARYA)\n\
                    1 25544U 98067A   24001.00000000  .00000000  00000-0  00000-0 0  9990\n\
                    2 25544  51.6400 247.4627 0006703 130.5360 325.0288 15.72125391563537\n\
                    GPS BIIR-2\n\
                    1 28474U 04045A   24001.00000000  .00000000  00000-0  00000-0 0  9990\n\
                    2 28474  55.0000  10.0000 0100000  90.0000 270.0000  2.00561000000000";
        let sats = parse_set(text).expect("valid set");
        assert_eq!(sats.len(), 2);
        assert!((sats[1].eccentricity - 0.01).abs() < 1e-9);
        assert!((sats[1].inclination_rad.to_degrees() - 55.0).abs() < 1e-6);
    }

    #[test]
    fn rejects_non_line2_and_short_lines() {
        assert!(parse_line2("1 25544U 98067A   24001.00000000").is_err());
        assert!(parse_line2("2 25544 51.64").is_err());
        assert!(parse_set("nothing here\n1 ...\n").unwrap().is_empty());
    }

    #[test]
    fn rejects_non_ascii_line_without_panicking() {
        // A non-ASCII byte in the fixed-column region must error (not panic on a
        // char boundary, as the old byte-index slicing did).
        let bad = ISS_L2.replacen("51.6400", "51.64é0", 1);
        assert!(parse_line2(&bad).is_err());
        assert!(parse_tle(VER_L1, &bad).is_err());
        assert!(parse_tle(&bad.replacen("2 ", "1 ", 1), VER_L2).is_err());
    }

    #[test]
    fn rejects_out_of_range_elements() {
        // Inclination 251 deg is non-physical.
        let bad_incl = "2 25544 251.6400 247.4627 0006703 130.5360 325.0288 15.72125391563537";
        assert!(parse_line2(bad_incl).is_err());
        // Zero mean motion is non-positive.
        let zero_n = "2 25544  51.6400 247.4627 0006703 130.5360 325.0288 00.00000000000000";
        assert!(parse_line2(zero_n).is_err());
    }

    #[test]
    fn strict_checksum_rejects_corrupt_lenient_accepts() {
        // Build a line 2 with a correct column-69 checksum, then corrupt it.
        let base = &ISS_L2[..68]; // columns 1..68
        let ck = tle_checksum(base);
        let good = format!("{base}{ck}");
        let bad = format!("{base}{}", (ck + 1) % 10);

        // Lenient parsing ignores the checksum: both succeed.
        assert_eq!(parse_propagators(&good).unwrap().len(), 1);
        assert_eq!(parse_propagators(&bad).unwrap().len(), 1);

        // Strict parsing enforces it: good passes, corrupt errors (no panic).
        let strict = ParseOpts {
            strict_checksum: true,
        };
        assert_eq!(parse_propagators_opts(&good, strict).unwrap().len(), 1);
        assert!(parse_propagators_opts(&bad, strict).is_err());

        assert!(verify_checksum(&good, "l2").is_ok());
        assert!(verify_checksum(&bad, "l2").is_err());
    }

    // The canonical AIAA verification object (TEME example), epoch 2000-06-28.
    const VER_L1: &str = "1 00005U 58002B   00179.78495062  .00000023  00000-0  28098-4 0  4753";
    const VER_L2: &str = "2 00005  34.2682 348.7242 1859667 331.7664  19.3264 10.82419157413667";

    #[test]
    fn parse_tle_fields_and_epoch() {
        let t = parse_tle(VER_L1, VER_L2).expect("valid full TLE");
        // Epoch: 18262 days from 1950 Jan 0.0 to 2000 Jan 0.0, plus day-of-year.
        assert!(
            (t.epoch_days_1950 - (18262.0 + 179.784_950_62)).abs() < 1e-6,
            "epoch {}",
            t.epoch_days_1950
        );
        // bstar = 0.28098e-4 (assumed-decimal exponential field).
        assert!((t.bstar - 0.28098e-4).abs() < 1e-12, "bstar {}", t.bstar);
        assert!((t.ecco - 0.1859667).abs() < 1e-9);
        assert!((t.inclo_rad.to_degrees() - 34.2682).abs() < 1e-6);
        // Mean motion 10.82419157 rev/day -> rad/min.
        let expect_nm = 10.824_191_57 * std::f64::consts::TAU / 1440.0;
        assert!((t.no_kozai_rad_min - expect_nm).abs() < 1e-12);
    }

    #[test]
    fn parse_tle_identity_surfaces_catalog_id_designator_and_epoch() {
        // Vanguard 1: NORAD 5, COSPAR 1958-002B, epoch 2000 day 179.78495062.
        let id = parse_tle_identity(VER_L1).expect("valid line 1");
        assert_eq!(id.norad_cat_id, 5);
        assert_eq!(id.intl_designator, "1958-002B");
        // 0.78495062 day = 67819.733568 s = 18:50:19.733568 UTC, day-of-year 179.
        assert_eq!(id.epoch_iso, "2000-179T18:50:19.733568");

        // ISS line 1: NORAD 25544, COSPAR 1998-067A, epoch 2024 day 001 at 00:00.
        let iss_l1 = "1 25544U 98067A   24001.00000000  .00000000  00000-0  00000-0 0  9990";
        let iss = parse_tle_identity(iss_l1).expect("valid line 1");
        assert_eq!(iss.norad_cat_id, 25544);
        assert_eq!(iss.intl_designator, "1998-067A");
        assert_eq!(iss.epoch_iso, "2024-001T00:00:00.000000");
    }

    #[test]
    fn parse_tle_identity_rejects_a_non_line1() {
        assert!(parse_tle_identity(VER_L2).is_err());
        assert!(parse_tle_identity("1 25544U").is_err());
    }

    #[test]
    fn parse_propagators_chooses_sgp4_for_full_tles_and_kepler_for_line2() {
        use crate::orbit::Propagator;
        // A full two-line set -> SGP4; a bare line 2 -> Keplerian.
        let full = format!("{VER_L1}\n{VER_L2}");
        let one = parse_propagators(&full).unwrap();
        assert_eq!(one.len(), 1);
        assert!(matches!(one[0], Propagator::Sgp4(_)));

        let bare = parse_propagators(VER_L2).unwrap();
        assert_eq!(bare.len(), 1);
        assert!(matches!(bare[0], Propagator::Kepler(_)));

        // Mixed block with a name line: one of each.
        let mixed = format!("NAME\n{VER_L1}\n{VER_L2}\n{VER_L2}");
        let two = parse_propagators(&mixed).unwrap();
        assert_eq!(two.len(), 2);
        assert!(matches!(two[0], Propagator::Sgp4(_)));
        assert!(matches!(two[1], Propagator::Kepler(_)));
    }

    #[test]
    fn sgp4_propagator_position_is_finite_and_moves() {
        let p = &parse_propagators(&format!("{VER_L1}\n{VER_L2}")).unwrap()[0];
        let p0 = p.position_eci(0.0);
        let p1 = p.position_eci(600.0);
        assert!(p0.iter().all(|c| c.is_finite()) && p1.iter().all(|c| c.is_finite()));
        // The satellite has moved over ten minutes.
        let moved = (0..3).map(|k| (p1[k] - p0[k]).powi(2)).sum::<f64>().sqrt();
        assert!(moved > 1.0e5, "moved only {moved} m");
        // Radius is a sane LEO/MEO magnitude (this object is ~7000 km).
        let r0 = p0.iter().map(|c| c * c).sum::<f64>().sqrt();
        assert!((6.5e6..8.0e6).contains(&r0), "radius {r0} m");
    }
}
