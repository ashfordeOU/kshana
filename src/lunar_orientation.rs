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
/// Raw parsing implementation — called exactly once (via [`fixture_rows`]).
/// WASM-safe: `include_str!` bakes the data at compile time; no filesystem I/O.
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

/// Process-wide cache for the parsed fixture rows.
///
/// `OnceLock` is part of `std` (stabilised Rust 1.70) and is `Send + Sync`, making
/// this safe to use on all targets including WASM (single-threaded or multi-threaded).
/// The CSV is parsed exactly once per process; subsequent calls return the cached slice.
static FIXTURE_ROWS: std::sync::OnceLock<Vec<Row>> = std::sync::OnceLock::new();

/// Return a reference to the (lazily-parsed, then cached) fixture rows.
fn fixture_rows() -> &'static Vec<Row> {
    FIXTURE_ROWS.get_or_init(parse_rows)
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
    let rows = fixture_rows();
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
        let rows = fixture_rows();
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

    /// Decisive optical-libration gate: the sub-Earth point (Earth direction expressed in the
    /// MOON_PA body frame) must wobble by the REAL optical-libration amplitude across the
    /// 730-day fixture window.
    ///
    /// # Why this is decisive
    /// A mean/tidally-locked rotation model keeps the sub-Earth point essentially FIXED in the
    /// body frame (the Moon's x-axis always points at Earth by construction), giving sub-Earth
    /// longitude and latitude ranges ≈ 0°.  Real DE440, on the other hand, encodes genuine
    /// physical + optical libration (amplitude ≈ ±7.9° longitude, ±6.7° latitude from JPL);
    /// the resulting ranges across 730 days are ≈ 13–16° (longitude) and ≈ 11–14° (latitude).
    /// Thresholds of 10° and 8° are comfortably inside the real-data band yet far above 0°,
    /// so any mean-rotation fixture fails while real DE440 passes.
    ///
    /// # Frame geometry
    /// `R = de440_moon_pa(t)` maps body → inertial (v_inertial = R · v_body).  So to express
    /// the Earth direction (inertial) in the body frame we apply Rᵀ (= R⁻¹ for orthonormal R):
    ///   body = Rᵀ · earth_inertial,  i.e.  body[i] = Σ_j R[j][i] * earth_inertial[j].
    /// The geocentric Moon vector from `crate::ephem::moon_position` gives the Moon as seen
    /// from Earth; negating it gives the Earth as seen from the Moon (low-precision, but the
    /// libration wobble comes entirely from the orientation, not the ephemeris).
    #[test]
    fn de440_moon_pa_shows_real_libration() {
        let rows = fixture_rows();
        let n = rows.len();
        assert!(n >= 2, "fixture needs at least 2 rows");

        // Sample every 5th row to cover the full 730-day window (146 samples) without
        // iterating all 731 rows.
        let step = 5_usize;

        let mut lon_min = f64::MAX;
        let mut lon_max = f64::MIN;
        let mut lat_min = f64::MAX;
        let mut lat_max = f64::MIN;

        for row in rows.iter().step_by(step) {
            let t = row.t;

            // Earth-direction in inertial frame: opposite the geocentric Moon vector.
            let moon_inertial = crate::ephem::moon_position(t);
            let mag = (moon_inertial[0] * moon_inertial[0]
                + moon_inertial[1] * moon_inertial[1]
                + moon_inertial[2] * moon_inertial[2])
                .sqrt();
            // Unit vector pointing from Moon to Earth (inertial).
            let earth_inertial = [
                -moon_inertial[0] / mag,
                -moon_inertial[1] / mag,
                -moon_inertial[2] / mag,
            ];

            // Rotate into the PA body frame: body = Rᵀ · earth_inertial.
            // R = de440_moon_pa(t) is body→inertial; Rᵀ is inertial→body.
            let r = de440_moon_pa(t);
            let body = [
                r[0][0] * earth_inertial[0]
                    + r[1][0] * earth_inertial[1]
                    + r[2][0] * earth_inertial[2],
                r[0][1] * earth_inertial[0]
                    + r[1][1] * earth_inertial[1]
                    + r[2][1] * earth_inertial[2],
                r[0][2] * earth_inertial[0]
                    + r[1][2] * earth_inertial[1]
                    + r[2][2] * earth_inertial[2],
            ];

            // Sub-Earth spherical coordinates in the body frame (degrees).
            let lon = body[1].atan2(body[0]).to_degrees();
            let lat = body[2].clamp(-1.0, 1.0).asin().to_degrees();

            if lon < lon_min {
                lon_min = lon;
            }
            if lon > lon_max {
                lon_max = lon;
            }
            if lat < lat_min {
                lat_min = lat;
            }
            if lat > lat_max {
                lat_max = lat;
            }
        }

        let lon_range = lon_max - lon_min;
        let lat_range = lat_max - lat_min;

        // Print so the test output records the measured amplitudes for CI audit.
        println!(
            "Sub-Earth libration (PA frame, {} samples, step {}):  \
             lon range = {lon_range:.2}°  (min {lon_min:.2}°, max {lon_max:.2}°) \
             |  lat range = {lat_range:.2}°  (min {lat_min:.2}°, max {lat_max:.2}°)",
            n.div_ceil(step),
            step,
        );

        assert!(
            lon_range > 10.0,
            "REAL-DATA GATE (longitude): sub-Earth longitude range must exceed 10° to confirm \
             real optical libration is encoded in the DE440 fixture.  \
             Got {lon_range:.2}° — a mean/tidally-locked rotation gives ≈ 0°.",
        );
        assert!(
            lon_range < 18.0,
            "REAL-DATA GATE (longitude upper): sub-Earth longitude range must be below 18° to \
             reject a fabricated over-driven fixture.  Real DE440 optical libration measures \
             ≈ 15.6°.  Got {lon_range:.2}°.",
        );
        assert!(
            lat_range > 8.0,
            "REAL-DATA GATE (latitude): sub-Earth latitude range must exceed 8° to confirm \
             real optical libration is encoded in the DE440 fixture.  \
             Got {lat_range:.2}° — a mean/tidally-locked rotation gives ≈ 0°.",
        );
        assert!(
            lat_range < 16.0,
            "REAL-DATA GATE (latitude upper): sub-Earth latitude range must be below 16° to \
             reject a fabricated over-driven fixture.  Real DE440 optical libration measures \
             ≈ 13.6°.  Got {lat_range:.2}°.",
        );
    }
}
