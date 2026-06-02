// SPDX-License-Identifier: Apache-2.0
//! Two-line element set (TLE) ingestion.
//!
//! Parses the orbital elements from the second line of a NORAD/Celestrak TLE into
//! the [`Orbit`] type, so a scenario can use a real constellation's published
//! geometry instead of a synthetic Walker pattern. Only line 2 is read — the
//! mean Keplerian elements (inclination, RAAN, eccentricity, argument of perigee,
//! mean anomaly, mean motion); the semi-major axis follows from the mean motion,
//! `a = (mu / n^2)^(1/3)`.
//!
//! **Scope and honesty.** This extracts the TLE's *mean elements* and propagates
//! them two-body (optionally with the engine's secular J2 drift) — it is **not**
//! an SGP4 propagator. It is accurate near the element epoch and drifts from SGP4
//! over time, and it ignores the line-1 drag/epoch terms. For a snapshot
//! availability/geometry study with elements from a common epoch this is a sound
//! first-order model; cite SGP4 if precise multi-day ephemerides are required.

use crate::orbit::{Orbit, MU_EARTH};

/// Seconds per day, for converting mean motion (rev/day) to rad/s.
const SECONDS_PER_DAY: f64 = 86_400.0;

/// Parse the orbital elements from a TLE line 2 into an [`Orbit`]. The line must
/// be at least the standard 63 columns. Angles are read by their fixed columns;
/// the eccentricity has an implied leading decimal point.
pub fn parse_line2(line2: &str) -> Result<Orbit, String> {
    let b = line2.as_bytes();
    if !line2.starts_with("2 ") || b.len() < 63 {
        return Err(format!("not a TLE line 2: {line2:?}"));
    }
    // Fixed-column fields (1-indexed in the spec; sliced 0-indexed here).
    let field = |a: usize, z: usize| line2[a..z].trim();
    let num = |s: &str, what: &str| -> Result<f64, String> {
        s.parse::<f64>()
            .map_err(|_| format!("invalid {what} in TLE: {s:?}"))
    };
    let inclination_deg = num(field(8, 16), "inclination")?;
    let raan_deg = num(field(17, 25), "RAAN")?;
    let ecc = num(&format!("0.{}", field(26, 33)), "eccentricity")?;
    let argp_deg = num(field(34, 42), "argument of perigee")?;
    let mean_anomaly_deg = num(field(43, 51), "mean anomaly")?;
    let mean_motion_rev_day = num(field(52, 63), "mean motion")?;

    if mean_motion_rev_day <= 0.0 {
        return Err(format!("non-positive mean motion: {mean_motion_rev_day}"));
    }
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
}
