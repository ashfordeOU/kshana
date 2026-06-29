// SPDX-License-Identifier: AGPL-3.0-only
//! Datum-identifiability decomposition for the 7-parameter Helmert lunar frame.
//!
//! Given the 7×7 Fisher information matrix assembled from an LLR tracking schedule,
//! this module decomposes it into a scalar degeneracy metric for the lunocenter-X ↔
//! scale pair via the Schur complement of the {origin-X, scale} block.
//!
//! The scalar `degeneracy_metric = λ_min(S)` (where `S` is the 2×2 Schur complement)
//! approaches zero exactly when the {origin-X, scale} pair becomes unobservable (the
//! classic LLR datum ambiguity) and grows as libration separates the pair.
//!
//! # Honesty note
//! The `degeneracy_metric` and `origin_scale_corr` **magnitudes** from real LLR
//! geometry are **Modelled** (the 4→7 param extension holds reflector coordinates and
//! orientation fixed; preconditioning places the metric in relative, unit-less terms).
//! The **Validated/structural** claim is the near-degeneracy + defect-lift, consistent
//! with Sośnica 2025 (arXiv:2510.15484) r ≈ −0.97. We do **not** claim to reproduce
//! −0.97 numerically.

use crate::fim::{crlb, information_matrix, sym_eig};
use crate::lunar_datum::llr_row_datum7;
use crate::lunar_llr::{reflectors, stations};

/// Mean lunar radius used to precondition the scale and rotation columns [m].
///
/// Dividing columns 3–6 of the Jacobian by this constant brings all 7 partials to
/// O(1), reducing the Fisher matrix condition number from ~1e12 to ~100.
///
/// **Invariance note:** `origin_scale_corr` (a pure correlation coefficient) and
/// `origin_crlb_m` (from column 0, which is **not** rescaled) are invariant under
/// any positive per-column scaling. `degeneracy_metric = λ_min(S)` is expressed in
/// the preconditioned units and is therefore a **relative** figure for comparing
/// designs consistently, not an absolute physical quantity. **Modelled.**
const R_MOON_M: f64 = 1_737_400.0;

/// Kept pair K: indices of origin-X (t_x = 0) and scale (= 3) in the 7-param vector.
const K: [usize; 2] = [0, 3];

/// Marginalized indices M = {t_y, t_z, θ_x, θ_y, θ_z} = {1, 2, 4, 5, 6}.
const M_IDX: [usize; 5] = [1, 2, 4, 5, 6];

/// Result of the 7-parameter datum identifiability analysis.
///
/// Encapsulates the Fisher information matrix, its observability structure, and
/// scalar metrics for the lunocenter-X ↔ scale pair derived from the Schur
/// complement of the {t_x, scale} block.
#[derive(Debug, Clone)]
pub struct DatumIdentifiability {
    /// The 7×7 Fisher information matrix (preconditioned: cols 3–6 divided by `R_MOON_M`).
    pub info: Vec<Vec<f64>>,
    /// Number of (station, reflector, epoch) triples that passed the geometry gate.
    ///
    /// Set to `0` by [`decompose`] (the matrix carries no schedule count).
    /// Populated by [`llr_identifiability`].
    pub n_obs: usize,
    /// Eigenvalues of the 7×7 Fisher matrix in ascending order (preconditioned units).
    pub eigenvalues: Vec<f64>,
    /// Datum-defect: number of unobservable directions in the 7-parameter problem.
    pub defect: usize,
    /// Marginal correlation `C[t_x, scale] / sqrt(C[t_x,t_x]·C[scale,scale])` from the
    /// Schur complement inverse. Near ±1 signals the lunocenter-X ↔ scale near-degeneracy.
    ///
    /// **Modelled** magnitude (depends on preconditioning and 7-param setup).
    pub origin_scale_corr: f64,
    /// Scalar degeneracy metric: `λ_min(S)` of the 2×2 Schur complement (preconditioned
    /// units, **relative** figure). Approaches 0 when the pair is unobservable; grows as
    /// libration separates them.
    ///
    /// **Modelled** magnitude.
    pub degeneracy_metric: f64,
    /// CRLB standard deviation on the lunocenter-X translation [m], from
    /// `sqrt(S⁻¹[0][0])`. Invariant under positive scaling of columns 3–6, so
    /// physically meaningful in metres.
    pub origin_crlb_m: f64,
}

/// Assemble the 7×7 LLR datum Fisher information matrix over a tracking schedule.
///
/// Replicates the exact schedule and geometry gates of
/// `crate::lunar_llr::llr_datum_observability` (Earth-facing + station elevation > 0),
/// but uses the 7-parameter row builder `crate::lunar_datum::llr_row_datum7`.
/// Columns 3–6 (scale, θ_x, θ_y, θ_z) are divided by [`R_MOON_M`] before accumulation
/// — see the invariance note on that constant.
///
/// `t0_jc` is the sweep start epoch in Julian centuries from J2000.0 TT.
/// `days = 0.0` still yields at least one epoch (`n_steps ≥ 1`).
///
/// Returns `(info_7x7, n_obs)`.
#[allow(clippy::needless_range_loop)]
pub fn assemble_llr_info(
    sigma_range_m: f64,
    t0_jc: f64,
    days: f64,
    step_hours: f64,
) -> (Vec<Vec<f64>>, usize) {
    const JD_J2000: f64 = 2_451_545.0;
    let step_jc = step_hours / (24.0 * 36_525.0);
    // Identical formula to llr_datum_observability; yields ≥ 1 step even for days = 0.
    let n_steps = (days * 24.0 / step_hours).ceil() as usize + 1;

    let refls = reflectors();
    let stats = stations();
    let weight = 1.0 / (sigma_range_m * sigma_range_m);

    let mut jac: Vec<Vec<f64>> = Vec::new();
    let mut weights: Vec<f64> = Vec::new();

    for step in 0..n_steps {
        let t_tt_jc = t0_jc + step as f64 * step_jc;
        let jd_tt = JD_J2000 + t_tt_jc * 36_525.0;
        // UT1 ≈ TT (same approximation as llr_datum_observability).
        let jd_ut1 = jd_tt;

        let r_moon = crate::ephem::moon_position(t_tt_jc);

        for refl in &refls {
            let r_refl = crate::lunar_llr::reflector_inertial(refl.pa_body_m, t_tt_jc);

            // Earth-facing gate: reflector must be on the hemisphere facing Earth.
            let rrel = [
                r_refl[0] - r_moon[0],
                r_refl[1] - r_moon[1],
                r_refl[2] - r_moon[2],
            ];
            let earth_facing_dot =
                rrel[0] * (-r_moon[0]) + rrel[1] * (-r_moon[1]) + rrel[2] * (-r_moon[2]);
            if earth_facing_dot <= 0.0 {
                continue;
            }

            // Convert to ECEF for the station elevation gate.
            let r_refl_ecef = crate::cio::gcrs_to_itrs(r_refl, jd_tt, jd_ut1, 0.0, 0.0);

            for st in &stats {
                let g = crate::frames::Geodetic {
                    lat_rad: st.lat_deg.to_radians(),
                    lon_rad: st.lon_deg.to_radians(),
                    alt_m: st.alt_m,
                };
                // Elevation gate: Moon must be above the local horizon.
                let el_rad = crate::frames::elevation(g, r_refl_ecef);
                if el_rad <= 0.0 {
                    continue;
                }

                // Build the 7-parameter partial row and precondition cols 3–6.
                let row7 = llr_row_datum7(st, refl.pa_body_m, t_tt_jc, jd_ut1);
                let mut row = row7.to_vec();
                for c in 3..7 {
                    row[c] /= R_MOON_M;
                }
                jac.push(row);
                weights.push(weight);
            }
        }
    }

    let n_obs = jac.len();
    if n_obs == 0 {
        return (vec![vec![0.0; 7]; 7], 0);
    }

    let info = information_matrix(&jac, &weights);
    (info, n_obs)
}

/// Decompose a 7×7 Fisher information matrix into Schur complement degeneracy metrics.
///
/// Extracts the K = {0, 3} (t_x, scale) block via its Schur complement in the full
/// 7×7 matrix, yielding scalar metrics for the lunocenter-X ↔ scale near-degeneracy.
/// Sets `n_obs = 0`; the matrix carries no schedule count.
///
/// `I_MM⁻¹` is computed via `crate::fim::crlb(...).pseudo_covariance` (Moore–Penrose,
/// handles rank-deficient sub-blocks). `λ_min(S)` is from `crate::fim::sym_eig`.
/// The 2×2 `S⁻¹` is the only by-hand inversion performed.
pub fn decompose(info: &[Vec<f64>], rel_tol: f64) -> DatumIdentifiability {
    // Full 7×7 observability: eigenvalues and defect.
    let cr = crlb(info, rel_tol);
    let eigenvalues = cr.eigenvalues.clone();
    let defect = cr.defect;

    // ── Extract sub-blocks ──────────────────────────────────────────────────
    // I_KK (2×2): rows/cols at K = {0, 3}.
    let i_kk = [
        [info[K[0]][K[0]], info[K[0]][K[1]]],
        [info[K[1]][K[0]], info[K[1]][K[1]]],
    ];

    // I_KM (2×5): rows at K, cols at M_IDX = {1,2,4,5,6}.
    let i_km: [[f64; 5]; 2] =
        std::array::from_fn(|ki| std::array::from_fn(|mi| info[K[ki]][M_IDX[mi]]));

    // I_MM (5×5): rows/cols at M_IDX.
    let i_mm: Vec<Vec<f64>> = M_IDX
        .iter()
        .map(|&r| M_IDX.iter().map(|&c| info[r][c]).collect::<Vec<f64>>())
        .collect();

    // ── Schur complement S = I_KK − I_KM · I_MM⁻¹ · I_MK ──────────────────
    // I_MM⁻¹ via Moore–Penrose pseudo-inverse (finite even if I_MM is rank-deficient).
    let d_inv = crlb(&i_mm, rel_tol).pseudo_covariance; // 5×5

    // B = I_KM · D_inv  (2×5)
    let b: [[f64; 5]; 2] = std::array::from_fn(|ki| {
        std::array::from_fn(|j| {
            i_km[ki]
                .iter()
                .zip(d_inv.iter())
                .map(|(v, dl)| v * dl[j])
                .sum::<f64>()
        })
    });

    // C = B · I_MK = B · I_KM^T  (2×2)  [info symmetric ⟹ I_MK[j][kj] = I_KM[kj][j]]
    let c: [[f64; 2]; 2] = std::array::from_fn(|ki| {
        std::array::from_fn(|kj| {
            b[ki]
                .iter()
                .zip(i_km[kj].iter())
                .map(|(bv, ikv)| bv * ikv)
                .sum::<f64>()
        })
    });

    // S (2×2 Schur complement of K in the full 7×7 matrix).
    let s = [
        [i_kk[0][0] - c[0][0], i_kk[0][1] - c[0][1]],
        [i_kk[1][0] - c[1][0], i_kk[1][1] - c[1][1]],
    ];

    // λ_min(S) via sym_eig (ascending order ⟹ [0] is the minimum).
    let s_mat = vec![vec![s[0][0], s[0][1]], vec![s[1][0], s[1][1]]];
    let degeneracy_metric = sym_eig(&s_mat).values[0];

    // ── Analytic 2×2 inverse of S ────────────────────────────────────────────
    // det(S) = S₀₀·S₁₁ − S₀₁²
    // S⁻¹ = (1/det)·[[S₁₁, −S₀₁], [−S₀₁, S₀₀]]
    let det = s[0][0] * s[1][1] - s[0][1] * s[0][1];

    let (origin_crlb_m, origin_scale_corr) = if det > 0.0 {
        let s_inv_00 = s[1][1] / det; // (S⁻¹)[0][0]
        let s_inv_01 = -s[0][1] / det; // (S⁻¹)[0][1]
        let s_inv_11 = s[0][0] / det; // (S⁻¹)[1][1]
        let crlb_m = s_inv_00.max(0.0).sqrt();
        let corr = if s_inv_00 > 0.0 && s_inv_11 > 0.0 {
            s_inv_01 / (s_inv_00 * s_inv_11).sqrt()
        } else {
            0.0
        };
        (crlb_m, corr)
    } else {
        // Perfectly degenerate S: covariance diverges.
        (f64::INFINITY, 0.0)
    };

    DatumIdentifiability {
        info: info.to_vec(),
        n_obs: 0,
        eigenvalues,
        defect,
        origin_scale_corr,
        degeneracy_metric,
        origin_crlb_m,
    }
}

/// Assemble the LLR datum Fisher matrix and decompose it into identifiability metrics.
///
/// Convenience wrapper: calls [`assemble_llr_info`] then [`decompose`], and overwrites
/// `n_obs` with the observation count from the schedule assembler.
pub fn llr_identifiability(
    sigma_range_m: f64,
    t0_jc: f64,
    days: f64,
    step_hours: f64,
) -> DatumIdentifiability {
    let (info, n_obs) = assemble_llr_info(sigma_range_m, t0_jc, days, step_hours);
    let mut d = decompose(&info, 1e-12);
    d.n_obs = n_obs;
    d
}

#[cfg(test)]
mod tests {
    use super::*;

    /// Closed-form sanity: identity Fisher with a single {t_x, scale} coupling ρ.
    ///
    /// When I_KM = 0 the Schur complement is S = I_KK = [[1, ρ],[ρ, 1]], giving:
    ///   λ_min(S)    = 1 − ρ
    ///   (S⁻¹)[0][0] = 1/(1−ρ²)   ⟹   origin_crlb_m = 1/sqrt(1−ρ²)
    ///   origin_scale_corr          = −ρ   (|corr| = ρ)
    #[test]
    fn degeneracy_metric_equals_schur_min_eigenvalue_and_bounds_origin_crlb() {
        let rho = 0.98_f64;
        let mut info = vec![vec![0.0; 7]; 7];
        for (i, row) in info.iter_mut().enumerate() {
            row[i] = 1.0;
        }
        info[0][3] = rho;
        info[3][0] = rho;
        let d = decompose(&info, 1e-12);
        assert!(
            (d.degeneracy_metric - (1.0 - rho)).abs() < 1e-9,
            "metric {} vs 1-rho {}",
            d.degeneracy_metric,
            1.0 - rho
        );
        let expected_crlb = (1.0 / (1.0 - rho * rho)).sqrt();
        assert!(
            (d.origin_crlb_m - expected_crlb).abs() < 1e-6 * expected_crlb,
            "origin crlb {} vs {}",
            d.origin_crlb_m,
            expected_crlb
        );
        assert!(
            (d.origin_scale_corr.abs() - rho).abs() < 1e-9,
            "|corr| {} vs rho {}",
            d.origin_scale_corr.abs(),
            rho
        );
    }

    /// Non-zero I_KM coupling: proves Schur path == full-inverse path.
    ///
    /// By the block-matrix inversion identity, (I⁻¹)[0][0] = (S⁻¹)[0][0].
    /// We verify this numerically by comparing `origin_crlb_m` (Schur path) against
    /// `sqrt(crlb(info).pseudo_covariance[0][0])` (full-inverse path).
    #[test]
    fn schur_path_equals_full_inverse_path_with_km_coupling() {
        // info[0][1] = info[1][0] = 0.3 introduces a non-zero I_KM coupling
        // (t_x couples to t_y; t_y is in M_IDX, so I_KM[0][0] = 0.3).
        let rho = 0.6_f64;
        let mut info = vec![vec![0.0; 7]; 7];
        for (i, row) in info.iter_mut().enumerate() {
            row[i] = 1.0;
        }
        info[0][3] = rho;
        info[3][0] = rho;
        info[0][1] = 0.3;
        info[1][0] = 0.3;
        let d = decompose(&info, 1e-12);
        // Schur complement identity: Sinv[0][0] == full_inverse[0][0].
        let full_pinv_00 = crate::fim::crlb(&info, 1e-12).pseudo_covariance[0][0];
        assert!(
            (d.origin_crlb_m - full_pinv_00.sqrt()).abs() < 1e-9,
            "Schur path origin_crlb_m={} vs full-inverse sqrt({})={}",
            d.origin_crlb_m,
            full_pinv_00,
            full_pinv_00.sqrt()
        );
    }

    /// Real-geometry structural test.
    ///
    /// Uses the DE440 PA-frame libration (2024-01-01, one synodic month, 6 h cadence)
    /// to confirm the 7-parameter LLR Fisher reproduces the near-degeneracy structure
    /// and defect-lift consistent with Sośnica 2025 (arXiv:2510.15484) r ≈ −0.97.
    ///
    /// The correlation and metric MAGNITUDES are **Modelled** (preconditioning +
    /// 7-param setup); the Validated/structural claims are: |corr| > 0.9 (strong
    /// near-degeneracy), defect = 0 (all 7 params observable with real libration),
    /// and a finite positive metric.
    #[test]
    fn llr_seven_param_shows_origin_scale_near_degeneracy() {
        let t0_jc = (2_460_310.5 - 2_451_545.0) / 36_525.0; // 2024-01-01 TT, in DE440 fixture window
        let d = llr_identifiability(0.003, t0_jc, 29.5, 6.0);
        assert!(d.n_obs > 20, "schedule populated; got {}", d.n_obs);
        assert!(
            d.origin_scale_corr.abs() > 0.9 && d.origin_scale_corr.abs() < 0.9999,
            "near-degeneracy expected (structural reproduction); got {}",
            d.origin_scale_corr
        );
        assert!(
            d.degeneracy_metric > 0.0 && d.degeneracy_metric.is_finite(),
            "metric must be finite positive; got {}",
            d.degeneracy_metric
        );
        assert_eq!(
            d.defect, 0,
            "real DE440 libration lifts the 7-param defect to 0; got {}",
            d.defect
        );
    }
}
