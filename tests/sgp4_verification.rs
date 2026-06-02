// SPDX-License-Identifier: Apache-2.0
//! Validate the SGP4/SDP4 propagator against the official AIAA 2006-6753
//! verification vectors (Vallado et al., "Revisiting Spacetrack Report #3").
//!
//! `tests/fixtures/sgp4/SGP4-VER.TLE` holds the input element sets — each a TLE
//! whose line 2 carries three extra numbers (start, stop, step in minutes) — and
//! `tcppver.out` holds the reference TEME position/velocity (km, km/s) at each
//! step. We propagate every case at every reference time and require the position
//! to match the reference to a tight tolerance. A handful of cases deliberately
//! drive the propagator into an error state (decayed, eccentricity out of range);
//! for those we simply skip the steps where our propagator returns an error code,
//! exactly as the reference stops reporting there.

use kshana::sgp4::wgs72;
use kshana::tle::parse_tle;

/// One reference time and the expected TEME position (km) and velocity (km/s).
struct Row {
    tsince: f64,
    pos: [f64; 3],
    vel: [f64; 3],
}

/// Parse `tcppver.out` into per-satellite blocks of rows, in file order.
fn parse_expected(text: &str) -> Vec<Vec<Row>> {
    let mut blocks: Vec<Vec<Row>> = Vec::new();
    for line in text.lines() {
        let toks: Vec<&str> = line.split_whitespace().collect();
        if toks.len() == 2 && toks[1] == "xx" {
            blocks.push(Vec::new());
            continue;
        }
        if toks.len() >= 7 {
            if let (Ok(tsince), Ok(x), Ok(y), Ok(z), Ok(vx), Ok(vy), Ok(vz)) = (
                toks[0].parse::<f64>(),
                toks[1].parse::<f64>(),
                toks[2].parse::<f64>(),
                toks[3].parse::<f64>(),
                toks[4].parse::<f64>(),
                toks[5].parse::<f64>(),
                toks[6].parse::<f64>(),
            ) {
                if let Some(b) = blocks.last_mut() {
                    b.push(Row {
                        tsince,
                        pos: [x, y, z],
                        vel: [vx, vy, vz],
                    });
                }
            }
        }
    }
    blocks
}

/// Parse `SGP4-VER.TLE` into `(line1, line2)` pairs, in file order, skipping the
/// `#` comment lines.
fn parse_cases(text: &str) -> Vec<(String, String)> {
    let mut cases = Vec::new();
    let mut line1: Option<String> = None;
    for line in text.lines() {
        if line.starts_with('#') {
            continue;
        }
        if line.starts_with("1 ") {
            line1 = Some(line.to_string());
        } else if line.starts_with("2 ") {
            if let Some(l1) = line1.take() {
                cases.push((l1, line.to_string()));
            }
        }
    }
    cases
}

#[test]
fn matches_official_verification_vectors() {
    let tle_text = include_str!("fixtures/sgp4/SGP4-VER.TLE");
    let out_text = include_str!("fixtures/sgp4/tcppver.out");
    let cases = parse_cases(tle_text);
    let blocks = parse_expected(out_text);
    assert_eq!(
        cases.len(),
        blocks.len(),
        "case/block count mismatch: {} TLE cases vs {} output blocks",
        cases.len(),
        blocks.len()
    );

    let grav = wgs72();
    // Position tolerance (km). A faithful double-precision port reproduces the
    // reference to well under a metre; allow a little headroom for last-digit
    // rounding in the published table.
    const TOL_KM: f64 = 2.0e-5;
    // Velocity tolerance (km/s). The reference table prints velocity to 9 decimal
    // places; a faithful port reproduces it to well under 1e-6 km/s (1 mm/s).
    const TOL_V_KMS: f64 = 1.0e-6;
    // The number of reference rows we successfully compare is a fixed property of
    // the bundled fixtures (the deliberate error cases stop early, exactly as the
    // reference does). Pinning it stops a silent regression that quietly compares
    // fewer rows from passing unnoticed.
    const EXPECTED_COMPARED: usize = 666;

    let mut worst_overall = 0.0_f64;
    let mut worst_case = String::new();
    let mut worst_vel = 0.0_f64;
    let mut worst_vel_case = String::new();
    let mut compared = 0usize;
    let mut failures: Vec<String> = Vec::new();

    for ((l1, l2), rows) in cases.iter().zip(blocks.iter()) {
        let satnum = l1[2..7].trim();
        let tle = parse_tle(l1, l2).unwrap_or_else(|e| panic!("parse {satnum}: {e}"));
        // Modern improved mode (what current TLEs assume); the reference table is
        // generated in the same mode.
        let prop = tle.to_sgp4(grav, false);

        let mut worst_case_err = 0.0_f64;
        for r in rows {
            match prop.propagate(r.tsince) {
                Ok((p, v)) => {
                    let d = ((p[0] - r.pos[0]).powi(2)
                        + (p[1] - r.pos[1]).powi(2)
                        + (p[2] - r.pos[2]).powi(2))
                    .sqrt();
                    let dv = ((v[0] - r.vel[0]).powi(2)
                        + (v[1] - r.vel[1]).powi(2)
                        + (v[2] - r.vel[2]).powi(2))
                    .sqrt();
                    worst_case_err = worst_case_err.max(d);
                    if dv > worst_vel {
                        worst_vel = dv;
                        worst_vel_case = satnum.to_string();
                    }
                    compared += 1;
                    if d > TOL_KM {
                        failures.push(format!(
                            "sat {satnum} t={:.1} min: pos error {:.3e} km",
                            r.tsince, d
                        ));
                    }
                    if dv > TOL_V_KMS {
                        failures.push(format!(
                            "sat {satnum} t={:.1} min: vel error {:.3e} km/s",
                            r.tsince, dv
                        ));
                    }
                }
                Err(_code) => {
                    // Deliberate error case: reference stops here too. Skip.
                }
            }
        }
        if worst_case_err > worst_overall {
            worst_overall = worst_case_err;
            worst_case = satnum.to_string();
        }
    }

    eprintln!(
        "SGP4 verification: compared {compared} rows; worst position error {:.3e} km (sat {worst_case}); \
         worst velocity error {:.3e} km/s (sat {worst_vel_case})",
        worst_overall, worst_vel
    );
    assert_eq!(
        compared, EXPECTED_COMPARED,
        "compared {compared} rows, expected exactly {EXPECTED_COMPARED} — fixture or skip behaviour changed"
    );
    assert!(
        failures.is_empty(),
        "{} rows exceeded tolerance ({:.1e} km / {:.1e} km/s); first few:\n{}",
        failures.len(),
        TOL_KM,
        TOL_V_KMS,
        failures
            .iter()
            .take(12)
            .cloned()
            .collect::<Vec<_>>()
            .join("\n")
    );
}
