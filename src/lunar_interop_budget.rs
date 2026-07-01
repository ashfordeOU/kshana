// SPDX-License-Identifier: AGPL-3.0-only
//! Cross-provider lunar interoperability budget — P2 science layer.
//!
//! # Purpose
//! This module provides least-squares fit and decomposition machinery for comparing
//! independent lunar ephemerides (e.g. DE440, INPOP21a, EPM2021): a 7-parameter Helmert
//! fit and a rotation-only (6-parameter) fit on matched geocentric position vectors.
//!
//! # Parameter convention
//! Parameter index order is fixed as `[t_x, t_y, t_z, scale, θ_x, θ_y, θ_z]`, matching
//! [`crate::lunar_datum::Datum7`].  The per-point regressor is the linearised Jacobian at
//! the zero datum: columns 0–2 = `I₃`, column 3 = `p` (scale sensitivity), columns 4–6
//! = `−[p]×` (rotation sensitivity), as returned by
//! [`crate::lunar_datum::datum7_point_jacobian_body`].
//!
//! # Honesty scope
//! The STRUCTURE of the fit (normal equations, Cholesky solve, decomposition) is the
//! scientific contribution; real magnitudes fitted to inter-ephemeris data carry
//! `VerificationStatus::Validated` (see `tests/lunar_interop_budget_reference.rs`).
//! Derived quantities without an independent external oracle are `Modelled` with a
//! representativeness note, per the honesty firewall in
//! `verification::tests::validated_rows_require_an_external_oracle`.
//!
//! This module is the P2 science layer (fit, decomposition, tolerance, budget) and is
//! deliberately distinct from the format-layer [`crate::lunar_interop`] (CCSDS OEM / KIF).

use crate::lunar_datum::datum7_point_jacobian_body;
pub use crate::lunar_datum::{Datum7, Vec3};

/// Result of a 7-parameter Helmert least-squares fit.
///
/// The fit linearises the Helmert transformation at the zero datum using the normal
/// equations `N δ = b` where `N = Σ Jᵀ J` and `b = Σ Jᵀ d`.
#[derive(Debug, Clone, Copy)]
pub struct HelmertFit {
    /// Best-fit 7-parameter Helmert datum `[t_x, t_y, t_z, scale, θ_x, θ_y, θ_z]`.
    pub datum: Datum7,
    /// RMS of the raw per-sample differences `|to[i] − from[i]|`, metres.
    /// `√(Σ|d_i|² / N)`, averaged over `N` 3-vector samples.
    pub raw_rms_m: f64,
    /// RMS of the post-fit residuals `|d_i − J_i δ|`, metres.
    /// `√(Σ|d_i − J_i δ|² / N)`, averaged over `N` 3-vector samples.
    pub residual_rms_m: f64,
}

/// Solve a small `N×N` symmetric positive-definite linear system `A x = b` by Cholesky
/// decomposition `A = L Lᵀ` (lower-triangular `L`), then forward/backward substitution.
///
/// Intended exclusively for the 7×7 (Helmert) and 6×6 (rotation-only) normal systems.
/// The caller must ensure `A` is positive definite (i.e. the Jacobian has full column rank).
///
/// # Algorithm
/// 1. **Cholesky**: `L[i][j] = (A[i][j] − Σ_{k<j} L[i][k] L[j][k]) / L[j][j]` for `i > j`;
///    `L[i][i] = √(A[i][i] − Σ_{k<i} L[i][k]²)`.
/// 2. **Forward substitution**: `y[i] = (b[i] − Σ_{k<i} L[i][k] y[k]) / L[i][i]`.
/// 3. **Backward substitution**: `x[i] = (y[i] − Σ_{k>i} L[k][i] x[k]) / L[i][i]`.
fn solve_spd<const N: usize>(a: &[[f64; N]; N], b: &[f64; N]) -> [f64; N] {
    // Cholesky factorisation: A = L Lᵀ
    let mut l = [[0.0_f64; N]; N];
    for i in 0..N {
        for j in 0..=i {
            let s: f64 = (0..j).map(|k| l[i][k] * l[j][k]).sum();
            l[i][j] = if i == j {
                (a[i][i] - s).sqrt()
            } else {
                (a[i][j] - s) / l[j][j]
            };
        }
    }
    // Forward substitution: L y = b
    let mut y = [0.0_f64; N];
    for i in 0..N {
        let s: f64 = (0..i).map(|k| l[i][k] * y[k]).sum();
        y[i] = (b[i] - s) / l[i][i];
    }
    // Backward substitution: Lᵀ x = y
    let mut x = [0.0_f64; N];
    for i in (0..N).rev() {
        let s: f64 = ((i + 1)..N).map(|k| l[k][i] * x[k]).sum();
        x[i] = (y[i] - s) / l[i][i];
    }
    x
}

/// Fit a 7-parameter Helmert transformation from `from` to `to` by least squares.
///
/// **Algorithm:** for each matched pair `(from[i], to[i])`:
/// 1. Build the 3×7 Jacobian block `J_i = datum7_point_jacobian_body(from[i])`.
/// 2. Form the residual target `d_i = to[i] − from[i]`.
/// 3. Accumulate the normal system: `N += J_iᵀ J_i` (7×7), `b += J_iᵀ d_i` (7-vector).
///
/// Solve `N δ = b` by Cholesky.  Return:
/// - `datum = Datum7 { t_m:[δ0,δ1,δ2], scale:δ3, rot_rad:[δ4,δ5,δ6] }`.
/// - `raw_rms_m = √(Σ|d_i|² / N)`.
/// - `residual_rms_m = √(Σ|d_i − J_i δ|² / N)`.
///
/// # Panics
/// Panics if `from` is empty or `from.len() != to.len()`.
pub fn helmert_fit(from: &[Vec3], to: &[Vec3]) -> HelmertFit {
    assert!(!from.is_empty(), "helmert_fit: empty input");
    assert_eq!(from.len(), to.len(), "helmert_fit: from.len() != to.len()");
    let n = from.len() as f64;

    let mut normal = [[0.0_f64; 7]; 7];
    let mut rhs = [0.0_f64; 7];
    let mut raw_sq = 0.0_f64;

    for (p, q) in from.iter().zip(to.iter()) {
        let j = datum7_point_jacobian_body(*p);
        let d = [q[0] - p[0], q[1] - p[1], q[2] - p[2]];
        raw_sq += d[0] * d[0] + d[1] * d[1] + d[2] * d[2];
        // Accumulate N += Jᵀ J and b += Jᵀ d.
        // Index loops are genuinely cross-product (c1 vs c2) and cannot be replaced by
        // direct iteration — each cell normal[c1][c2] sums over all 3 rows.
        for c1 in 0..7 {
            for c2 in 0..7 {
                normal[c1][c2] += j[0][c1] * j[0][c2] + j[1][c1] * j[1][c2] + j[2][c1] * j[2][c2];
            }
            rhs[c1] += j[0][c1] * d[0] + j[1][c1] * d[1] + j[2][c1] * d[2];
        }
    }

    let delta = solve_spd(&normal, &rhs);
    let datum = Datum7 {
        t_m: [delta[0], delta[1], delta[2]],
        scale: delta[3],
        rot_rad: [delta[4], delta[5], delta[6]],
    };

    // Second pass: residual rms √(Σ|d_i − J_i δ|² / N)
    let resid_sq: f64 = from
        .iter()
        .zip(to.iter())
        .map(|(p, q)| {
            let j = datum7_point_jacobian_body(*p);
            let d = [q[0] - p[0], q[1] - p[1], q[2] - p[2]];
            // fitted[row] = Σ_c J[row][c] * delta[c]
            let fitted: [f64; 3] = std::array::from_fn(|row| {
                j[row].iter().zip(delta.iter()).map(|(a, b)| a * b).sum()
            });
            let r = [d[0] - fitted[0], d[1] - fitted[1], d[2] - fitted[2]];
            r[0] * r[0] + r[1] * r[1] + r[2] * r[2]
        })
        .sum();

    HelmertFit {
        datum,
        raw_rms_m: (raw_sq / n).sqrt(),
        residual_rms_m: (resid_sq / n).sqrt(),
    }
}

/// Fit a 6-parameter (translation + rotation, no scale) transformation from `from` to
/// `to` by least squares.
///
/// **Algorithm:** identical to [`helmert_fit`] but the scale column (index 3) is dropped.
/// Uses columns `[0, 1, 2, 4, 5, 6]` of `datum7_point_jacobian_body` — a 3×6 regressor —
/// yielding the 6-parameter solution `[t_x, t_y, t_z, θ_x, θ_y, θ_z]`.
///
/// Returns `(theta_rad, residual_rms_m)` where:
/// - `theta_rad = [θ_x, θ_y, θ_z]` = entries 3–5 of the 6-vector solution.
/// - `residual_rms_m = √(Σ|d_i − J6_i δ|² / N)`, per-3-vector average.
///
/// # Panics
/// Panics if `from` is empty or `from.len() != to.len()`.
pub fn rotation_fit(from: &[Vec3], to: &[Vec3]) -> (Vec3, f64) {
    assert!(!from.is_empty(), "rotation_fit: empty input");
    assert_eq!(from.len(), to.len(), "rotation_fit: from.len() != to.len()");
    let n = from.len() as f64;

    // Retain columns [0,1,2,4,5,6] of the 7-param Jacobian; drop column 3 (scale).
    // New index 0→col 0 (t_x), 1→col 1 (t_y), 2→col 2 (t_z),
    //           3→col 4 (θ_x), 4→col 5 (θ_y), 5→col 6 (θ_z).
    const COLS: [usize; 6] = [0, 1, 2, 4, 5, 6];

    let mut normal = [[0.0_f64; 6]; 6];
    let mut rhs = [0.0_f64; 6];

    for (p, q) in from.iter().zip(to.iter()) {
        let j7 = datum7_point_jacobian_body(*p);
        let d = [q[0] - p[0], q[1] - p[1], q[2] - p[2]];
        for (c1, &col1) in COLS.iter().enumerate() {
            for (c2, &col2) in COLS.iter().enumerate() {
                normal[c1][c2] += j7[0][col1] * j7[0][col2]
                    + j7[1][col1] * j7[1][col2]
                    + j7[2][col1] * j7[2][col2];
            }
            rhs[c1] += j7[0][col1] * d[0] + j7[1][col1] * d[1] + j7[2][col1] * d[2];
        }
    }

    let delta = solve_spd(&normal, &rhs);

    // Residual rms √(Σ|d_i − J6_i δ|² / N)
    let resid_sq: f64 = from
        .iter()
        .zip(to.iter())
        .map(|(p, q)| {
            let j7 = datum7_point_jacobian_body(*p);
            let d = [q[0] - p[0], q[1] - p[1], q[2] - p[2]];
            let fitted: [f64; 3] = std::array::from_fn(|row| {
                COLS.iter()
                    .enumerate()
                    .map(|(ci, &c)| j7[row][c] * delta[ci])
                    .sum()
            });
            let r = [d[0] - fitted[0], d[1] - fitted[1], d[2] - fitted[2]];
            r[0] * r[0] + r[1] * r[1] + r[2] * r[2]
        })
        .sum();

    // theta = entries [3,4,5] of delta = [θ_x, θ_y, θ_z]
    let theta = [delta[3], delta[4], delta[5]];
    (theta, (resid_sq / n).sqrt())
}

/// Decomposition of a cross-provider Moon-position disagreement into a reducible
/// common frame-tie component and an irreducible Moon-specific excess rotation.
///
/// # Modelling note (honesty firewall — must accompany all magnitude fields)
///
/// Attributing the planet-common rotation to a *frame-tie* (reducible) and the
/// Moon-excess to *lunar-orbit-orientation dynamics* (irreducible) is a stated
/// modelling interpretation. The convention-free, robust claim is the
/// Moon-**excess** rotation (`theta_excess`): no whole-frame convention removes
/// it. All magnitude fields carry `VerificationStatus::Modelled` with a
/// representativeness note. The only Validated claim is this split applied to
/// real inter-ephemeris data in `tests/lunar_interop_budget_reference.rs`.
#[derive(Debug, Clone, Copy)]
pub struct ProvenanceSplit {
    /// Raw RMS of `|moon_to[i] − moon_from[i]|`, metres.
    pub raw_rms_m: f64,
    /// RMS residual after the rotation-only fit of the Moon pair, metres.
    pub rot_residual_m: f64,
    /// Best-fit rotation of the Moon pair `[θ_x, θ_y, θ_z]`, radians.
    pub theta_moon: Vec3,
    /// Component-wise median of planet-pair rotations — the estimated common frame-tie, radians.
    pub theta_frametie: Vec3,
    /// `theta_moon − theta_frametie`: Moon-excess not attributable to a frame convention, radians.
    pub theta_excess: Vec3,
    /// `|theta_frametie| · lever_arm_m` — magnitude removable by adopting a common frame, metres.
    pub reducible_m: f64,
    /// `|theta_excess| · lever_arm_m` — magnitude irreducible by any whole-frame choice, metres.
    pub irreducible_m: f64,
}

/// Decompose a cross-provider lunar disagreement into a reducible common frame-tie
/// and an irreducible Moon-specific excess rotation.
///
/// **Algorithm:**
/// 1. `(theta_moon, rot_residual_m) = rotation_fit(moon_from, moon_to)`;
///    `raw_rms_m = √(Σ|moon_to[i] − moon_from[i]|² / N)`.
/// 2. For each `(from, to)` in `planet_pairs`, `theta_k = rotation_fit(from, to).0`.
/// 3. `theta_frametie` = component-wise **median** of `{theta_k}` (even count →
///    mean of the two central values per component, sorted independently).
/// 4. `theta_excess = theta_moon − theta_frametie`.
/// 5. `reducible_m = |theta_frametie| · lever_arm_m`;
///    `irreducible_m = |theta_excess| · lever_arm_m` (Euclidean norms).
///
/// **Interpretation caveat:** attributing the planet-common rotation to a frame-tie
/// (reducible) and the Moon-excess to dynamics (irreducible) is a stated modelling
/// interpretation. The convention-free claim is `theta_excess` — no whole-frame
/// choice removes it.
///
/// # Panics
///
/// Panics if `moon_from` or `moon_to` is empty or mismatched, or if `planet_pairs`
/// is empty, or any planet pair is empty or mismatched.
pub fn provenance_split(
    moon_from: &[Vec3],
    moon_to: &[Vec3],
    planet_pairs: &[(Vec<Vec3>, Vec<Vec3>)],
    lever_arm_m: f64,
) -> ProvenanceSplit {
    assert!(!moon_from.is_empty(), "provenance_split: empty moon_from");
    assert!(
        !planet_pairs.is_empty(),
        "provenance_split: empty planet_pairs"
    );

    // Step 1: Moon pair — rotation fit + raw rms.
    let (theta_moon, rot_residual_m) = rotation_fit(moon_from, moon_to);
    let n_moon = moon_from.len() as f64;
    let raw_sq: f64 = moon_from
        .iter()
        .zip(moon_to.iter())
        .map(|(p, q)| {
            let d = [q[0] - p[0], q[1] - p[1], q[2] - p[2]];
            d[0] * d[0] + d[1] * d[1] + d[2] * d[2]
        })
        .sum();
    let raw_rms_m = (raw_sq / n_moon).sqrt();

    // Step 2: Fit each planet pair → one theta per planet.
    let planet_thetas: Vec<Vec3> = planet_pairs
        .iter()
        .map(|(from, to)| rotation_fit(from, to).0)
        .collect();

    // Step 3: Component-wise median of planet thetas.
    let theta_frametie = component_median(&planet_thetas);

    // Step 4: Moon-excess rotation not attributable to any whole-frame convention.
    let theta_excess = [
        theta_moon[0] - theta_frametie[0],
        theta_moon[1] - theta_frametie[1],
        theta_moon[2] - theta_frametie[2],
    ];

    // Step 5: Reducible and irreducible metre-equivalent magnitudes.
    let reducible_m = norm3(theta_frametie) * lever_arm_m;
    let irreducible_m = norm3(theta_excess) * lever_arm_m;

    ProvenanceSplit {
        raw_rms_m,
        rot_residual_m,
        theta_moon,
        theta_frametie,
        theta_excess,
        reducible_m,
        irreducible_m,
    }
}

/// Component-wise median of a slice of [`Vec3`] values.
///
/// Each of the three components is sorted independently. For an even number of
/// values the mean of the two central values is returned per component.
fn component_median(thetas: &[Vec3]) -> Vec3 {
    let n = thetas.len();
    assert!(n > 0, "component_median: empty slice");
    let mut result = [0.0_f64; 3];
    for (ci, res) in result.iter_mut().enumerate() {
        let mut vals: Vec<f64> = thetas.iter().map(|t| t[ci]).collect();
        vals.sort_by(f64::total_cmp);
        *res = if n % 2 == 1 {
            vals[n / 2]
        } else {
            (vals[n / 2 - 1] + vals[n / 2]) / 2.0
        };
    }
    result
}

/// Euclidean norm of a [`Vec3`].
fn norm3(v: Vec3) -> f64 {
    (v[0] * v[0] + v[1] * v[1] + v[2] * v[2]).sqrt()
}

#[cfg(test)]
mod tests {
    use super::*;

    // A deterministic Earth–Moon-like point cloud swept over an orbit (rotating radius vector).
    fn cloud(n: usize) -> Vec<Vec3> {
        (0..n)
            .map(|k| {
                let a = (k as f64) * 0.11; // rotates the vector around the orbit
                let r = 3.84e8;
                [r * a.cos(), r * a.sin(), 0.20 * r * (0.5 * a).sin()]
            })
            .collect()
    }
    fn apply(d: &Datum7, p: &[Vec3]) -> Vec<Vec3> {
        p.iter()
            .map(|q| crate::lunar_datum::apply_datum7(d, *q))
            .collect()
    }

    #[test]
    fn helmert_fit_recovers_a_known_datum() {
        let from = cloud(120);
        let truth = Datum7 {
            t_m: [1.5, -0.7, 0.3],
            scale: 2.0e-9,
            rot_rad: [3.0e-9, -5.0e-9, 4.0e-9],
        };
        let to = apply(&truth, &from);
        let fit = helmert_fit(&from, &to);
        assert!((fit.datum.t_m[0] - 1.5).abs() < 1e-6);
        assert!((fit.datum.scale - 2.0e-9).abs() < 1e-12);
        assert!((fit.datum.rot_rad[1] - (-5.0e-9)).abs() < 1e-12);
        assert!(fit.residual_rms_m < 1e-6, "known transform must fit to ~0");
    }

    #[test]
    fn rotation_fit_isolates_orientation_and_residual_bounds_full_helmert() {
        let from = cloud(120);
        // pure rotation truth: rotation_fit residual ~0; full-helmert residual <= rotation residual.
        let truth = Datum7 {
            t_m: [0.0; 3],
            scale: 0.0,
            rot_rad: [0.0, 4.0e-9, -6.0e-9],
        };
        let to = apply(&truth, &from);
        let (theta, rot_res) = rotation_fit(&from, &to);
        assert!((theta[1] - 4.0e-9).abs() < 1e-12 && (theta[2] - (-6.0e-9)).abs() < 1e-12);
        let full = helmert_fit(&from, &to).residual_rms_m;
        assert!(
            full <= rot_res + 1e-9,
            "adding scale cannot worsen the residual"
        );
        assert!(rot_res < 1e-6);
    }

    /// Scaled point cloud at radius `r` — same orbital sweep as `cloud` but at a
    /// different heliocentric distance, used to build distinct planet-like samples.
    fn cloud_scaled(n: usize, r: f64) -> Vec<Vec3> {
        (0..n)
            .map(|k| {
                let a = (k as f64) * 0.11;
                [r * a.cos(), r * a.sin(), 0.20 * r * (0.5 * a).sin()]
            })
            .collect()
    }

    #[test]
    fn provenance_split_recovers_frametie_and_excess() {
        // Synthetic truth: Moon sees frametie + known_excess; each planet sees only frametie.
        let frametie: Vec3 = [1.5e-9, -2.3e-9, 0.8e-9];
        let known_excess: Vec3 = [0.4e-9, -0.7e-9, 1.1e-9];
        let moon_rot: Vec3 = [
            frametie[0] + known_excess[0],
            frametie[1] + known_excess[1],
            frametie[2] + known_excess[2],
        ];
        let lever = 3.84e8_f64;

        let moon_from = cloud(120);
        let moon_truth = Datum7 {
            t_m: [0.0; 3],
            scale: 0.0,
            rot_rad: moon_rot,
        };
        let moon_to = apply(&moon_truth, &moon_from);

        // Four planet-like clouds at Mercury/Venus/Earth/Mars-scale radii — distinct so
        // the component-wise median is well-determined for both odd and even counts.
        let planet_truth = Datum7 {
            t_m: [0.0; 3],
            scale: 0.0,
            rot_rad: frametie,
        };
        let planet_pairs: Vec<(Vec<Vec3>, Vec<Vec3>)> = [5.7e10_f64, 1.08e11, 1.50e11, 2.28e11]
            .iter()
            .map(|&r| {
                let from = cloud_scaled(120, r);
                let to = apply(&planet_truth, &from);
                (from, to)
            })
            .collect();

        let split = provenance_split(&moon_from, &moon_to, &planet_pairs, lever);

        // theta_frametie and theta_excess must match truth to < 1e-12 rad (abs).
        for i in 0..3 {
            assert!(
                (split.theta_frametie[i] - frametie[i]).abs() < 1e-12,
                "theta_frametie[{i}]: got {:.6e}, expected {:.6e}",
                split.theta_frametie[i],
                frametie[i]
            );
            assert!(
                (split.theta_excess[i] - known_excess[i]).abs() < 1e-12,
                "theta_excess[{i}]: got {:.6e}, expected {:.6e}",
                split.theta_excess[i],
                known_excess[i]
            );
        }

        // irreducible_m ≈ |known_excess| * lever_arm to 1e-6 relative.
        let excess_norm =
            (known_excess[0].powi(2) + known_excess[1].powi(2) + known_excess[2].powi(2)).sqrt();
        let expected_irr = excess_norm * lever;
        assert!(
            (split.irreducible_m - expected_irr).abs() / expected_irr < 1e-6,
            "irreducible_m: got {:.6e}, expected {:.6e}",
            split.irreducible_m,
            expected_irr
        );
    }

    #[test]
    fn provenance_split_zero_excess_gives_near_zero_irreducible() {
        // When Moon rotation == frametie (no excess), irreducible_m must be negligible.
        let frametie: Vec3 = [1.5e-9, -2.3e-9, 0.8e-9];
        let lever = 3.84e8_f64;

        let moon_from = cloud(120);
        let moon_truth = Datum7 {
            t_m: [0.0; 3],
            scale: 0.0,
            rot_rad: frametie,
        };
        let moon_to = apply(&moon_truth, &moon_from);

        let planet_truth = Datum7 {
            t_m: [0.0; 3],
            scale: 0.0,
            rot_rad: frametie,
        };
        let planet_pairs: Vec<(Vec<Vec3>, Vec<Vec3>)> = [5.7e10_f64, 1.08e11, 2.28e11]
            .iter()
            .map(|&r| {
                let from = cloud_scaled(120, r);
                let to = apply(&planet_truth, &from);
                (from, to)
            })
            .collect();

        let split = provenance_split(&moon_from, &moon_to, &planet_pairs, lever);
        // |theta_excess| < ~1e-11 rad  →  irreducible_m < 1e-3 m at 3.84e8 lever.
        assert!(
            split.irreducible_m < 1e-3,
            "zero excess must give irreducible_m < 1e-3 m, got {:.3e}",
            split.irreducible_m
        );
    }
}
