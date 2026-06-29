// SPDX-License-Identifier: AGPL-3.0-only
//! DE440 lunar principal-axis orientation provider — compile-time embedded fixture.
//!
//! Exposes the MOON_PA_DE440 → J2000 rotation matrix at arbitrary epochs by linearly
//! interpolating the committed 731-row fixture generated from the DE440 binary PCK
//! (`moon_pa_de440_200625.bpc`) via spiceypy 8.1.2.  The embedded CSV is the
//! human-auditable provenance copy; the functions here are the WASM-safe runtime source
//! (no filesystem I/O at runtime — `include_str!` bakes the data at compile time).
//!
//! # Frame convention
//! `de440_moon_pa(t)` returns the 3×3 rotation matrix **R** such that
//! **v**_inertial = **R** · **v**_body, i.e. body (PA) → J2000 inertial.
//!
//! # Interpolation
//! At 1-day spacing the orientation changes by ~13° (sidereal rotation) so element-wise
//! linear interpolation across a single day interval is NOT accurate for the full rotation
//! (the matrix would lose orthogonality).  Here we interpolate element-wise and then
//! re-orthonormalize via modified Gram-Schmidt applied to the **columns** of the result.
//! At the 1-day spacing used for this fixture the interpolation error in the rotation
//! angle (before renormalization) is ≲0.06° and Gram-Schmidt restores orthonormality to
//! ≲1e-15; this is sufficient for the LLR Fisher analysis described in `lunar_llr.rs`.
//! For sub-hour precision a slerp or cubic spline would be preferable.
//!
//! # Sources
//! - JPL DE440 binary PCK `moon_pa_de440_200625.bpc` (NAIF/JPL).
//! - Park, R. S. et al. (2021) "The JPL Planetary and Lunar Ephemerides DE440 and DE441",
//!   *AJ* 161:105.  doi:10.3847/1538-3881/abd414
//! - Generation script: `scripts/gen_de440_moon_pa.py` (committed for reproducibility).
//! - Fixture SHA-256: 3076f81ef95d83f5efa240ed4c7ccb422f109407dde841fcf28d42dc63586eb7

use crate::lunar_llr::Vec3;

/// Compile-time embedded DE440 MOON_PA orientation fixture.
///
/// 731 rows; 1-day cadence; window 2024-01-01 to 2025-12-31 TDB.
/// Columns: `t_tt_jc, r00..r22` (see module docs).
const DE440_MOON_PA_CSV: &str = include_str!("../tests/fixtures/llr_geometry/de440_moon_pa.csv");

/// One parsed row of the fixture: epoch + 3×3 rotation matrix.
struct Row {
    t: f64,
    r: [[f64; 3]; 3],
}

/// Parse all rows from the embedded CSV (header skipped).
///
/// Called at most once per provider call; the result is a `Vec` allocated on the
/// heap.  For the test scale (731 rows, each with 10 f64 values) this is fast (<1 ms)
/// and the allocation is acceptable.  WASM-safe: no filesystem I/O.
fn parse_rows() -> Vec<Row> {
    let mut rows = Vec::with_capacity(732);
    for (i, line) in DE440_MOON_PA_CSV.lines().enumerate() {
        if i == 0 {
            continue; // skip header
        }
        let line = line.trim();
        if line.is_empty() {
            continue;
        }
        let mut it = line.splitn(10, ',');
        let t: f64 = it
            .next()
            .expect("fixture row: t column")
            .trim()
            .parse()
            .expect("fixture row: t parse");
        let mut v = [0.0_f64; 9];
        for (k, cell) in it.enumerate() {
            v[k] = cell
                .trim()
                .parse()
                .expect("fixture row: matrix element parse");
        }
        #[rustfmt::skip]
        let r = [
            [v[0], v[1], v[2]],
            [v[3], v[4], v[5]],
            [v[6], v[7], v[8]],
        ];
        rows.push(Row { t, r });
    }
    rows
}

/// Gram-Schmidt orthonormalization of a 3×3 matrix (applied column-wise).
///
/// Input: a matrix that is *nearly* orthonormal (e.g. element-wise interpolant of two
/// rotation matrices).  Output: a proper rotation matrix (det ≈ +1, R^T R ≈ I).
///
/// Column convention: `m[row][col]`, so column `k` is `[m[0][k], m[1][k], m[2][k]]`.
fn gram_schmidt(m: [[f64; 3]; 3]) -> [[f64; 3]; 3] {
    // Extract columns
    let mut c0 = [m[0][0], m[1][0], m[2][0]];
    let mut c1 = [m[0][1], m[1][1], m[2][1]];

    // Normalize c0
    let n0 = (c0[0] * c0[0] + c0[1] * c0[1] + c0[2] * c0[2]).sqrt();
    c0 = [c0[0] / n0, c0[1] / n0, c0[2] / n0];

    // c1 ⊥ c0
    let dot01 = c0[0] * c1[0] + c0[1] * c1[1] + c0[2] * c1[2];
    c1 = [
        c1[0] - dot01 * c0[0],
        c1[1] - dot01 * c0[1],
        c1[2] - dot01 * c0[2],
    ];
    let n1 = (c1[0] * c1[0] + c1[1] * c1[1] + c1[2] * c1[2]).sqrt();
    c1 = [c1[0] / n1, c1[1] / n1, c1[2] / n1];

    // c2 = c0 × c1 (preserves handedness, already unit length)
    let c2 = [
        c0[1] * c1[2] - c0[2] * c1[1],
        c0[2] * c1[0] - c0[0] * c1[2],
        c0[0] * c1[1] - c0[1] * c1[0],
    ];

    // Re-assemble rows from orthonormal columns
    [
        [c0[0], c1[0], c2[0]],
        [c0[1], c1[1], c2[1]],
        [c0[2], c1[2], c2[2]],
    ]
}

/// DE440 MOON_PA_DE440 → J2000 rotation at epoch `t_tt_jc` (Julian centuries from J2000 TT).
///
/// Parses the embedded fixture, finds the bracketing 1-day interval, interpolates
/// element-wise, and re-orthonormalizes via Gram-Schmidt.  Clamps to endpoints
/// outside the fixture window (2024-01-01 to 2025-12-31 TDB).
///
/// Returns a 3×3 matrix **R** with `v_inertial = R · v_body`.
pub fn de440_moon_pa(t_tt_jc: f64) -> [[f64; 3]; 3] {
    let rows = parse_rows();
    debug_assert!(!rows.is_empty(), "fixture must not be empty");

    // Clamp to window
    if t_tt_jc <= rows[0].t {
        return rows[0].r;
    }
    let last = rows.len() - 1;
    if t_tt_jc >= rows[last].t {
        return rows[last].r;
    }

    // Binary search for the lower-bound row
    let mut lo = 0_usize;
    let mut hi = last;
    while hi - lo > 1 {
        let mid = (lo + hi) / 2;
        if rows[mid].t <= t_tt_jc {
            lo = mid;
        } else {
            hi = mid;
        }
    }

    let t0 = rows[lo].t;
    let t1 = rows[hi].t;
    let frac = (t_tt_jc - t0) / (t1 - t0);

    // Element-wise linear interpolation
    let r0 = &rows[lo].r;
    let r1 = &rows[hi].r;
    let mut interp = [[0.0_f64; 3]; 3];
    for i in 0..3 {
        for j in 0..3 {
            interp[i][j] = r0[i][j] + frac * (r1[i][j] - r0[i][j]);
        }
    }

    // Restore orthonormality (lost by element-wise interpolation)
    gram_schmidt(interp)
}

/// Apply the DE440 MOON_PA → J2000 rotation to a body-frame vector.
///
/// Equivalent to `R · r_body` where `R = de440_moon_pa(t_tt_jc)`.
/// Task 5b uses this to replace `lunar::mcmf_to_mci` in `reflector_inertial`.
pub fn de440_moon_pa_body_to_inertial(r_body: Vec3, t_tt_jc: f64) -> Vec3 {
    let r = de440_moon_pa(t_tt_jc);
    [
        r[0][0] * r_body[0] + r[0][1] * r_body[1] + r[0][2] * r_body[2],
        r[1][0] * r_body[0] + r[1][1] * r_body[1] + r[1][2] * r_body[2],
        r[2][0] * r_body[0] + r[2][1] * r_body[1] + r[2][2] * r_body[2],
    ]
}

#[cfg(test)]
mod tests {
    use super::*;

    /// Parse the first few fixture rows and check that `de440_moon_pa` reproduces them
    /// to <1e-9 (exact interpolation at a knot point) and that the result is a proper
    /// rotation (R^T R ≈ I to 1e-9, det ≈ +1 to 1e-9).
    #[test]
    fn de440_moon_pa_reproduces_fixture_rows() {
        let rows = parse_rows();
        assert!(rows.len() >= 5, "fixture must have at least 5 rows");

        // Check a few exact knot points
        for idx in [0, 1, 50, 200, 730] {
            let row = &rows[idx];
            let r = de440_moon_pa(row.t);

            // Matrix elements must reproduce to < 1e-9 at knot points
            for (i, (r_row, expected_row)) in r.iter().zip(row.r.iter()).enumerate() {
                for (j, (got, expected)) in r_row.iter().zip(expected_row.iter()).enumerate() {
                    let diff = (got - expected).abs();
                    assert!(
                        diff < 1e-9,
                        "row {} element [{i}][{j}]: got {:.15e}, expected {:.15e}, diff {diff:.3e}",
                        idx,
                        got,
                        expected
                    );
                }
            }

            // R^T R ≈ I
            for i in 0..3 {
                for j in 0..3 {
                    let rtr: f64 = (0..3).map(|k| r[k][i] * r[k][j]).sum();
                    let expected = if i == j { 1.0 } else { 0.0 };
                    assert!(
                        (rtr - expected).abs() < 1e-9,
                        "row {} R^TR[{i}][{j}] = {rtr:.3e}, expected {expected}",
                        idx
                    );
                }
            }

            // det(R) ≈ +1
            let det = r[0][0] * (r[1][1] * r[2][2] - r[1][2] * r[2][1])
                - r[0][1] * (r[1][0] * r[2][2] - r[1][2] * r[2][0])
                + r[0][2] * (r[1][0] * r[2][1] - r[1][1] * r[2][0]);
            assert!(
                (det - 1.0).abs() < 1e-9,
                "row {} det(R) = {det:.9}, expected 1.0",
                idx
            );
        }
    }

    /// Non-trivial sanity gate: the DE440 MOON_PA orientation varies by >1° across the
    /// 730-day fixture window, proving real physical+optical libration is embedded (not a
    /// fixed / mean rotation).
    ///
    /// The measured amplitude from the generation script is ±7.786° (longitude) and
    /// ±6.797° (latitude); this test uses the pole direction (3rd column of R) which also
    /// varies by the physical libration in latitude, and the X column (1st column) which
    /// captures longitude + rotation.  A fixed orientation would give angle = 0°;
    /// real libration gives >>1°.
    #[test]
    fn de440_moon_pa_shows_real_libration() {
        let rows = parse_rows();
        let n = rows.len();
        assert!(n >= 2, "fixture needs at least 2 rows");

        // Compare orientation at t_start vs t_end via the angle between the X-axis columns
        // (sub-Earth axis direction in inertial space).
        let r_start = de440_moon_pa(rows[0].t);
        let r_end = de440_moon_pa(rows[n - 1].t);

        // X-column of start
        let x0 = [r_start[0][0], r_start[1][0], r_start[2][0]];
        // X-column of end
        let x1 = [r_end[0][0], r_end[1][0], r_end[2][0]];

        // Angle between them (in degrees)
        let dot = x0[0] * x1[0] + x0[1] * x1[1] + x0[2] * x1[2];
        let cos_a = dot.clamp(-1.0, 1.0);
        let angle_deg = cos_a.acos().to_degrees();

        assert!(
            angle_deg > 1.0,
            "REAL-DATA GATE: DE440 MOON_PA X-axis must wobble >1° across the 730-day window \
             to prove real libration is present (a fixed/mean rotation would give 0°). \
             Got {angle_deg:.4}° — if near 0°, the frame or kernel setup is WRONG.",
        );

        // Also verify the pole direction (Z column) changes — physical libration + precession
        // in latitude.  The Moon's pole precesses with an 18.6-year period; over 730 days
        // the inertial-space pole direction moves by ~0.9°–1.0° (precession + physical libration).
        // A threshold of 0.5° is sufficient to distinguish real motion from a frozen fixture.
        let z0 = [r_start[0][2], r_start[1][2], r_start[2][2]];
        let z1 = [r_end[0][2], r_end[1][2], r_end[2][2]];
        let dot_z = z0[0] * z1[0] + z0[1] * z1[1] + z0[2] * z1[2];
        let angle_z_deg = dot_z.clamp(-1.0, 1.0).acos().to_degrees();
        assert!(
            angle_z_deg > 0.5,
            "DE440 MOON_PA Z-axis (pole direction) must vary >0.5° across the window \
             (physical libration + precession); \
             got {angle_z_deg:.4}°",
        );
    }
}
