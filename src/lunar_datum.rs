// SPDX-License-Identifier: AGPL-3.0-only
//! 7-parameter Helmert datum for lunar reference-frame identifiability analysis.
//!
//! Extends the 4-parameter `lunar_llr::Datum4` with three small-angle rotations,
//! yielding the full similarity transformation `(1 + scale) · R(θ) · p + t`.
//! Provides the analytic 3×7 point-Jacobian used by multi-technique partial
//! matrices and the Fisher-information identifiability decomposition.

pub use crate::lunar_llr::Vec3;

/// Seven-parameter Helmert similarity datum.
///
/// Parameter index order (fixed; indices 0–3 coincide with `lunar_llr::Datum4`):
/// `[t_x, t_y, t_z, scale, θ_x, θ_y, θ_z]`
///
/// - Index 0 (`t_m[0]`): lunocenter origin-X translation (metres)
/// - Index 1 (`t_m[1]`): origin-Y translation (metres)
/// - Index 2 (`t_m[2]`): origin-Z translation (metres)
/// - Index 3 (`scale`): scale factor (dimensionless; applied as `1 + scale`)
/// - Index 4 (`rot_rad[0]`): small rotation about X (radians)
/// - Index 5 (`rot_rad[1]`): small rotation about Y (radians)
/// - Index 6 (`rot_rad[2]`): small rotation about Z (radians)
#[derive(Debug, Clone, Copy)]
pub struct Datum7 {
    /// Translation vector [x, y, z] in metres.
    pub t_m: Vec3,
    /// Scale factor (dimensionless). Applied as `(1 + scale)`.
    pub scale: f64,
    /// Small-rotation vector [θ_x, θ_y, θ_z] in radians.
    /// Rotation axis = `θ / |θ|`, rotation angle = `|θ|`.
    pub rot_rad: Vec3,
}

/// Apply a 7-parameter Helmert datum to a body-frame point.
///
/// Returns `(1 + scale) · R(θ) · p_body + t`, where `R(θ)` is the exact
/// Rodrigues rotation for the small-angle vector `θ = rot_rad`.
/// Handles `|θ| → 0` safely (returns identity rotation, no division by zero).
/// At the zero datum this returns `p_body` unchanged.
pub fn apply_datum7(d: &Datum7, p_body: Vec3) -> Vec3 {
    let th = d.rot_rad;
    let angle = (th[0] * th[0] + th[1] * th[1] + th[2] * th[2]).sqrt();

    // Rodrigues' formula: R(θ) p = p cos(α) + (k × p) sin(α) + k (k·p) (1 - cos(α))
    // where α = |θ|, k = θ / |θ| (unit axis).
    // For |θ| < threshold use identity rotation to avoid division by zero.
    let rotated = if angle < 1e-15 {
        p_body
    } else {
        let cos_a = angle.cos();
        let sin_a = angle.sin();
        let one_minus_cos = 1.0 - cos_a;
        let inv_a = 1.0 / angle;
        let k = [th[0] * inv_a, th[1] * inv_a, th[2] * inv_a];

        // k × p
        let kxp = [
            k[1] * p_body[2] - k[2] * p_body[1],
            k[2] * p_body[0] - k[0] * p_body[2],
            k[0] * p_body[1] - k[1] * p_body[0],
        ];
        let kdotp = k[0] * p_body[0] + k[1] * p_body[1] + k[2] * p_body[2];

        [
            p_body[0] * cos_a + sin_a * kxp[0] + one_minus_cos * k[0] * kdotp,
            p_body[1] * cos_a + sin_a * kxp[1] + one_minus_cos * k[1] * kdotp,
            p_body[2] * cos_a + sin_a * kxp[2] + one_minus_cos * k[2] * kdotp,
        ]
    };

    let s1 = 1.0 + d.scale;
    [
        s1 * rotated[0] + d.t_m[0],
        s1 * rotated[1] + d.t_m[1],
        s1 * rotated[2] + d.t_m[2],
    ]
}

/// Analytic 3×7 Jacobian of `apply_datum7` evaluated at the zero datum.
///
/// Columns follow the fixed parameter order `[t_x, t_y, t_z, scale, θ_x, θ_y, θ_z]`:
/// - Columns 0–2: `∂/∂t_k = ê_k` (standard basis vector)
/// - Column 3:    `∂/∂scale = p_body`
/// - Columns 4–6: `∂/∂θ_k = ê_k × p_body` (cross product, body frame)
///
/// Cross-product signs (from `ê_k × p`):
/// `ê_x × p = (0, -p_z, p_y)`, `ê_y × p = (p_z, 0, -p_x)`, `ê_z × p = (-p_y, p_x, 0)`.
pub fn datum7_point_jacobian_body(p_body: Vec3) -> [[f64; 7]; 3] {
    let [px, py, pz] = p_body;
    // Columns: 0=t_x  1=t_y  2=t_z  3=scale  4=θ_x  5=θ_y  6=θ_z
    //   ê_x × p = ( 0,  -pz,  py )  → col 4
    //   ê_y × p = ( pz,  0,  -px )  → col 5
    //   ê_z × p = (-py,  px,  0  )  → col 6
    [
        [1.0, 0.0, 0.0, px, 0.0, pz, -py],
        [0.0, 1.0, 0.0, py, -pz, 0.0, px],
        [0.0, 0.0, 1.0, pz, py, -px, 0.0],
    ]
}

/// Build a single row of the 7-parameter datum Jacobian for any measurement technique.
///
/// `grad_inertial` is ∂observable/∂r_point in the geocentric inertial frame (a unit
/// vector for range observables). `p_body` is the body-frame point (e.g. reflector PA
/// coordinates). `t_tt_jc` is the epoch in Julian centuries from J2000.0 TT.
///
/// Algorithm:
/// 1. Compute the 3×7 body-frame point-Jacobian `J = datum7_point_jacobian_body(p_body)`.
/// 2. Rotate each column of J from body frame to inertial via DE440 PA orientation.
/// 3. Contract with `grad_inertial`: `row[c] = grad_inertial · (R · col_c)`.
///
/// Returns the 7 partials in the fixed order `[t_x, t_y, t_z, scale, θ_x, θ_y, θ_z]`.
pub fn partials_datum7(grad_inertial: Vec3, p_body: Vec3, t_tt_jc: f64) -> [f64; 7] {
    let jac = datum7_point_jacobian_body(p_body);
    let mut row = [0.0_f64; 7];
    for (c, r) in row.iter_mut().enumerate() {
        let col_body: Vec3 = [jac[0][c], jac[1][c], jac[2][c]];
        let col_inertial =
            crate::lunar_orientation::de440_moon_pa_body_to_inertial(col_body, t_tt_jc);
        *r = grad_inertial[0] * col_inertial[0]
            + grad_inertial[1] * col_inertial[1]
            + grad_inertial[2] * col_inertial[2];
    }
    row
}

/// LLR range partial derivatives w.r.t. all 7 Helmert datum parameters.
///
/// Computes the line-of-sight unit vector `û = (r_ref − r_sta) / |r_ref − r_sta|`
/// using the same geometry as `crate::lunar_llr::range_partials_analytic` at the zero
/// datum, then delegates to `partials_datum7` to build the full 7-parameter row.
///
/// The first four entries `[∂/∂t_x, ∂/∂t_y, ∂/∂t_z, ∂/∂scale]` match the Phase-0
/// analytic partials to within 1 × 10⁻⁹ relative error, providing the unification that
/// lets later tasks mix LLR + VLBI + orbiter in one 7-parameter basis.
pub fn llr_row_datum7(
    station: &crate::lunar_llr::Station,
    refl_pa_body_m: Vec3,
    t_tt_jc: f64,
    jd_ut1: f64,
) -> [f64; 7] {
    let jd_tt = t_tt_jc * 36_525.0 + 2_451_545.0;
    let g = crate::frames::Geodetic {
        lat_rad: station.lat_deg.to_radians(),
        lon_rad: station.lon_deg.to_radians(),
        alt_m: station.alt_m,
    };
    let r_sta = crate::lunar_vlbi::station_inertial_position(g, jd_tt, jd_ut1);
    // zero datum => p_body = refl (identity); matches apply_datum(zero, refl) in Phase 0.
    let r_ref = crate::lunar_llr::reflector_inertial(refl_pa_body_m, t_tt_jc);
    let dv = [
        r_ref[0] - r_sta[0],
        r_ref[1] - r_sta[1],
        r_ref[2] - r_sta[2],
    ];
    let n = (dv[0] * dv[0] + dv[1] * dv[1] + dv[2] * dv[2]).sqrt();
    let uhat = [dv[0] / n, dv[1] / n, dv[2] / n];
    partials_datum7(uhat, refl_pa_body_m, t_tt_jc)
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn llr_datum7_row_matches_phase0_four_param() {
        use crate::lunar_llr::{range_partials_analytic, reflectors, stations, Datum4};
        // 2024-01-01 TT, inside the DE440 fixture window (real libration).
        let t0_jc = (2_460_310.5 - 2_451_545.0) / 36_525.0;
        let st = stations()[1]; // APOLLO (index 1); Station is Copy
        let refl = reflectors()[2].pa_body_m; // any near-side reflector
        let jd_ut1 = t0_jc * 36_525.0 + 2_451_545.0;
        let zero4 = Datum4 {
            t_m: [0.0; 3],
            scale: 0.0,
        };
        let p4 = range_partials_analytic(&zero4, &st, refl, t0_jc, jd_ut1);
        let row7 = llr_row_datum7(&st, refl, t0_jc, jd_ut1);
        for k in 0..4 {
            assert!(
                (row7[k] - p4[k]).abs() <= 1e-9 * (1.0 + p4[k].abs()),
                "col {k}: datum7 {} vs phase0 {}",
                row7[k],
                p4[k]
            );
        }
        // The rotation columns must be finite and not all identically zero
        // (a near-side reflector has nonzero ê_k × p moment arm).
        let rot_norm = (row7[4] * row7[4] + row7[5] * row7[5] + row7[6] * row7[6]).sqrt();
        assert!(
            rot_norm.is_finite() && rot_norm > 0.0,
            "rotation columns degenerate: {rot_norm}"
        );
    }

    #[test]
    fn zero_datum_is_identity() {
        let p: Vec3 = [1.2e6_f64, -4.0e5, 9.0e5];
        let zero = Datum7 {
            t_m: [0.0; 3],
            scale: 0.0,
            rot_rad: [0.0; 3],
        };
        let result = apply_datum7(&zero, p);
        assert_eq!(result, p, "zero datum must return p unchanged");
    }

    #[test]
    fn pure_scale_stretches_uniformly() {
        let p: Vec3 = [1.2e6_f64, -4.0e5, 9.0e5];
        let s = 0.123_456_789;
        let d = Datum7 {
            t_m: [0.0; 3],
            scale: s,
            rot_rad: [0.0; 3],
        };
        let result = apply_datum7(&d, p);
        let expected = [(1.0 + s) * p[0], (1.0 + s) * p[1], (1.0 + s) * p[2]];
        for i in 0..3 {
            let rel = (result[i] - expected[i]).abs() / expected[i].abs().max(1.0);
            assert!(
                rel <= 1e-9,
                "row {i}: got {} expected {}",
                result[i],
                expected[i]
            );
        }
    }

    #[test]
    fn point_jacobian_matches_finite_difference() {
        // A body point off all axes so every column is exercised.
        let p = [1.2e6_f64, -4.0e5, 9.0e5];
        let jac = datum7_point_jacobian_body(p);
        let zero = Datum7 {
            t_m: [0.0; 3],
            scale: 0.0,
            rot_rad: [0.0; 3],
        };
        // step per parameter: m, m, m, (scale), rad, rad, rad
        let h = [1.0, 1.0, 1.0, 1e-7, 1e-9, 1e-9, 1e-9];
        for j in 0..7 {
            let mut dp = zero;
            let mut dm = zero;
            match j {
                0..=2 => {
                    dp.t_m[j] += h[j];
                    dm.t_m[j] -= h[j];
                }
                3 => {
                    dp.scale += h[3];
                    dm.scale -= h[3];
                }
                _ => {
                    dp.rot_rad[j - 4] += h[j];
                    dm.rot_rad[j - 4] -= h[j];
                }
            }
            let fp = apply_datum7(&dp, p);
            let fm = apply_datum7(&dm, p);
            for row in 0..3 {
                let fd = (fp[row] - fm[row]) / (2.0 * h[j]);
                assert!(
                    (jac[row][j] - fd).abs() <= 1e-3 + 1e-6 * jac[row][j].abs(),
                    "col {j} row {row}: analytic {} vs fd {}",
                    jac[row][j],
                    fd
                );
            }
        }
    }
}
