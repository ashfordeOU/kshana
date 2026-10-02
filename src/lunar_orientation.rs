// SPDX-License-Identifier: AGPL-3.0-only
//! DE440 lunar principal-axis orientation provider — compile-time embedded fixture.
//!
//! Exposes the MOON_PA_DE440 → J2000 rotation matrix at arbitrary epochs inside
//! 2014-01-01 .. 2030-12-31 TDB by interpolating the committed 6 209-row daily fixture generated
//! from the DE440 binary PCK (`moon_pa_de440_200625.bpc`) via spiceypy (8.1.2 for the first
//! 2024-2025 release, 8.2.0 for the 2014-2030 extension; the 2024-2025 nodes agree to 4.3e-13).
//! Outside that span [`try_de440_moon_pa`] returns an [`OrientationSpanError`] and the
//! infallible forms panic: the series never clamps to an end row (it used to, silently).  The embedded CSV is the
//! human-auditable provenance copy; the functions here are the WASM-safe runtime source
//! (no filesystem I/O at runtime — `include_str!` bakes the data at compile time).
//!
//! # Frame convention
//! `de440_moon_pa(t)` returns the 3×3 rotation matrix **R** such that
//! **v**_inertial = **R** · **v**_body, i.e. body (PA) → J2000 inertial.
//!
//! # Interpolation
//! At 1-day spacing the orientation changes by ~13° (sidereal rotation). Between two nodes
//! the relative rotation `R0ᵀ·R1` is applied at a uniform rate (geodesic interpolation,
//! `R0 · Exp(f · Log(R0ᵀ R1))`), followed by a column Gram-Schmidt pass that removes only
//! rounding-level departures from orthonormality. Against the NAIF SPICE Toolkit evaluating
//! the binary PCK directly at 2 000 off-node epochs
//! (`tests/lunar_pa_orientation_spice_oracle.rs`) the rotation-angle error is at most
//! 1.7e-6 rad (about 3 m at the lunar surface), RMS 7.8e-7 rad.
//!
//! The earlier scheme (element-wise linear interpolation, then Gram-Schmidt) recovered the
//! right axis but not the right angle: its error vanished at the interval midpoint and
//! reached about 2e-4 rad (about 340 m at the surface) near the quarter points.
//!
//! # Sources
//! - JPL DE440 binary PCK `moon_pa_de440_200625.bpc` (NAIF/JPL).
//! - Park, R. S. et al. (2021) "The JPL Planetary and Lunar Ephemerides DE440 and DE441",
//!   *AJ* 161:105.  doi:10.3847/1538-3881/abd414
//! - Generation script: `scripts/gen_de440_moon_pa.py` (committed for reproducibility).
//! - Fixture SHA-256: c289f9742220f5a49a9e7f57aec3f61a6836f31c7b4f586b54b3a8fda480736b

use crate::lunar_llr_geometry::Vec3;

/// Compile-time embedded DE440 MOON_PA orientation fixture.
///
/// 6 209 rows; 1-day cadence; window 2014-01-01 to 2030-12-31 TDB.
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
    let mut rows = Vec::with_capacity(6210);
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
/// Input: a matrix that is *nearly* orthonormal (e.g. a product of two
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

/// An epoch outside the span of the embedded orientation series.
#[derive(Clone, Copy, Debug, PartialEq)]
pub struct OrientationSpanError {
    /// The requested epoch (Julian centuries from J2000 TT).
    pub t_tt_jc: f64,
    /// First node of the series (Julian centuries from J2000 TT).
    pub first_jc: f64,
    /// Last node of the series (Julian centuries from J2000 TT).
    pub last_jc: f64,
}

impl std::fmt::Display for OrientationSpanError {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        write!(
            f,
            "epoch {:.6} Julian centuries from J2000 is outside the DE440 lunar orientation series \
             ({:.6} .. {:.6}, 2014-01-01 .. 2030-12-31 TDB)",
            self.t_tt_jc, self.first_jc, self.last_jc
        )
    }
}

impl std::error::Error for OrientationSpanError {}

/// The span `(first, last)` of the embedded orientation series, Julian centuries from J2000.
pub fn de440_moon_pa_span() -> (f64, f64) {
    let rows = fixture_rows();
    (rows[0].t, rows[rows.len() - 1].t)
}

/// DE440 MOON_PA_DE440 → J2000 rotation at epoch `t_tt_jc` (Julian centuries from J2000 TT).
///
/// Panics outside the series span (2014-01-01 .. 2030-12-31 TDB); use [`try_de440_moon_pa`]
/// to handle that case. Returns a 3×3 matrix **R** with `v_inertial = R · v_body`.
pub fn de440_moon_pa(t_tt_jc: f64) -> [[f64; 3]; 3] {
    try_de440_moon_pa(t_tt_jc).unwrap_or_else(|e| panic!("{e}"))
}

/// DE440 MOON_PA_DE440 → J2000 rotation at epoch `t_tt_jc` (Julian centuries from J2000 TT),
/// or an error outside the series span.
///
/// Finds the bracketing 1-day interval of the embedded fixture, applies the relative rotation
/// at a uniform rate, and re-orthonormalizes via Gram-Schmidt. Never clamps.
pub fn try_de440_moon_pa(t_tt_jc: f64) -> Result<[[f64; 3]; 3], OrientationSpanError> {
    let rows = fixture_rows();
    debug_assert!(!rows.is_empty(), "fixture must not be empty");
    let last = rows.len() - 1;
    if !(t_tt_jc >= rows[0].t && t_tt_jc <= rows[last].t) {
        return Err(OrientationSpanError {
            t_tt_jc,
            first_jc: rows[0].t,
            last_jc: rows[last].t,
        });
    }
    if t_tt_jc == rows[last].t {
        return Ok(rows[last].r);
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

    // Geodesic interpolation: R(f) = R0 · Exp(f · Log(R0ᵀ R1)), i.e. the relative
    // one-day rotation is applied at a uniform rate. Element-wise linear interpolation
    // followed by re-orthonormalisation (the previous scheme) recovers the right axis
    // but not the right angle: for the ~13.2 deg daily rotation its angle error vanishes
    // at the interval midpoint and reaches ~2e-4 rad (~340 m at the lunar surface) near
    // the quarter points, as the SPICE oracle in
    // tests/lunar_pa_orientation_spice_oracle.rs measured.
    let r0 = &rows[lo].r;
    let r1 = &rows[hi].r;
    let rel = mat_tmul(r0, r1);
    let step = rot_exp(rot_log(&rel), frac);
    let interp = mat_mul(r0, &step);

    // Remove the last rounding-level departure from orthonormality.
    Ok(gram_schmidt(interp))
}

/// `aᵀ · b` for 3×3 matrices.
fn mat_tmul(a: &[[f64; 3]; 3], b: &[[f64; 3]; 3]) -> [[f64; 3]; 3] {
    let mut m = [[0.0_f64; 3]; 3];
    for (i, row) in m.iter_mut().enumerate() {
        for (j, v) in row.iter_mut().enumerate() {
            *v = a[0][i] * b[0][j] + a[1][i] * b[1][j] + a[2][i] * b[2][j];
        }
    }
    m
}

/// `a · b` for 3×3 matrices.
fn mat_mul(a: &[[f64; 3]; 3], b: &[[f64; 3]; 3]) -> [[f64; 3]; 3] {
    let mut m = [[0.0_f64; 3]; 3];
    for (i, row) in m.iter_mut().enumerate() {
        for (j, v) in row.iter_mut().enumerate() {
            *v = a[i][0] * b[0][j] + a[i][1] * b[1][j] + a[i][2] * b[2][j];
        }
    }
    m
}

/// Rotation vector (axis times angle, rad) of a proper rotation matrix whose angle is
/// well below π (the daily step here is about 0.23 rad).
fn rot_log(r: &[[f64; 3]; 3]) -> [f64; 3] {
    let w = [r[2][1] - r[1][2], r[0][2] - r[2][0], r[1][0] - r[0][1]];
    let s = 0.5 * (w[0] * w[0] + w[1] * w[1] + w[2] * w[2]).sqrt();
    let c = 0.5 * (r[0][0] + r[1][1] + r[2][2] - 1.0);
    let theta = s.atan2(c);
    // theta / (2 sin theta), with its small-angle limit.
    let k = if s < 1e-12 { 0.5 } else { 0.5 * theta / s };
    [k * w[0], k * w[1], k * w[2]]
}

/// Rotation matrix of the rotation vector `v` scaled by `f` (Rodrigues' formula).
fn rot_exp(v: [f64; 3], f: f64) -> [[f64; 3]; 3] {
    let v = [f * v[0], f * v[1], f * v[2]];
    let theta = (v[0] * v[0] + v[1] * v[1] + v[2] * v[2]).sqrt();
    if theta < 1e-15 {
        return [[1.0, 0.0, 0.0], [0.0, 1.0, 0.0], [0.0, 0.0, 1.0]];
    }
    let (x, y, z) = (v[0] / theta, v[1] / theta, v[2] / theta);
    let (s, c) = theta.sin_cos();
    let t = 1.0 - c;
    [
        [c + x * x * t, x * y * t - z * s, x * z * t + y * s],
        [y * x * t + z * s, c + y * y * t, y * z * t - x * s],
        [z * x * t - y * s, z * y * t + x * s, c + z * z * t],
    ]
}

/// Apply the DE440 MOON_PA → J2000 rotation to a body-frame vector.
///
/// Equivalent to `R · r_body` where `R = de440_moon_pa(t_tt_jc)`; panics outside the series
/// span (see [`try_de440_moon_pa_body_to_inertial`]).
pub fn de440_moon_pa_body_to_inertial(r_body: Vec3, t_tt_jc: f64) -> Vec3 {
    try_de440_moon_pa_body_to_inertial(r_body, t_tt_jc).unwrap_or_else(|e| panic!("{e}"))
}

/// [`de440_moon_pa_body_to_inertial`], or an error outside the series span.
pub fn try_de440_moon_pa_body_to_inertial(
    r_body: Vec3,
    t_tt_jc: f64,
) -> Result<Vec3, OrientationSpanError> {
    let r = try_de440_moon_pa(t_tt_jc)?;
    Ok([
        r[0][0] * r_body[0] + r[0][1] * r_body[1] + r[0][2] * r_body[2],
        r[1][0] * r_body[0] + r[1][1] * r_body[1] + r[1][2] * r_body[2],
        r[2][0] * r_body[0] + r[2][1] * r_body[1] + r[2][2] * r_body[2],
    ])
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn the_series_errors_outside_its_span_instead_of_clamping() {
        let (first, last) = de440_moon_pa_span();
        // 2014-01-01 and 2030-12-31 TDB, in Julian centuries from J2000.
        assert!(
            (first - (2_456_658.5 - 2_451_545.0) / 36_525.0).abs() < 1e-9,
            "{first}"
        );
        assert!(
            (last - (2_462_866.5 - 2_451_545.0) / 36_525.0).abs() < 1e-9,
            "{last}"
        );
        let day = 1.0 / 36_525.0;
        assert!(try_de440_moon_pa(first - day).is_err());
        assert!(try_de440_moon_pa(last + day).is_err());
        assert!(try_de440_moon_pa(f64::NAN).is_err());
        assert!(try_de440_moon_pa(first).is_ok() && try_de440_moon_pa(last).is_ok());
        // 2015-05-01 (the committed 2015 normal points) is now inside the span.
        assert!(try_de440_moon_pa((2_457_143.5 - 2_451_545.0) / 36_525.0).is_ok());
        let e = try_de440_moon_pa_body_to_inertial([1.0, 0.0, 0.0], last + day).unwrap_err();
        assert!(e.to_string().contains("outside"));
    }

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
