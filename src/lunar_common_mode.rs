// SPDX-License-Identifier: AGPL-3.0-only
//! Common-mode integrity core: the blind-subspace projector and the split of a
//! measurement error into its RAIM-invisible and RAIM-detectable parts.
//!
//! Snapshot RAIM / ARAIM detects a fault only through the *parity*
//! (measurement-inconsistency) subspace. For the linearised model
//! `y = G·x + ε` with geometry rows `gᵢ = [-eᵢₓ, -eᵢy, -eᵢz, 1]` (the negative
//! line-of-sight unit vector plus a clock column), the least-squares state
//! estimate is `x̂ = (GᵀG)⁻¹Gᵀ y = S·y` and the parity residual is
//! `r = y − G·x̂ = P⊥·y`, where `P⊥ = I − G·S` projects onto the orthogonal
//! complement of `range(G)`.
//!
//! Any measurement error `δy` splits uniquely into
//!
//! * a **blind** part in `range(G)`, absorbed as a state error `S·δy` and
//!   therefore invisible to *any* residual test (`P⊥` annihilates it), and
//! * a **detectable** part in the parity space, which shows up as `r`.
//!
//! This module builds that exact projector/split. The blindness is a known,
//! *correct* property of all snapshot RAIM — a common-mode bias absorbed by the
//! clock column is the trivial 1-D case (see
//! [`crate::spoof_monitors::parity_raim_test`], which states plainly that a
//! bias on every pseudorange leaves its statistic unchanged). Here we expose the
//! general split so a caller can quantify *how much* of a given error is blind.
//!
//! Everything in this module is **Modelled / analytic**. The projector split is
//! exact linear algebra with no stochastic content. The common-mode
//! protection-level (CMPL) bound built below *additionally* consumes a **Modelled**
//! common-mode measurement-error covariance and a **Modelled** k-factor supplied by
//! the caller; there is no external-oracle or Validated claim anywhere in this
//! module. The real-data Validated anchor for that covariance is a later task.

use crate::orbit::{enu_basis, invert4, los_unit};

/// Build the RAIM geometry matrix `G` (rows `[-eₓ, -e_y, -e_z, 1]`) for a `user`
/// observing a set of satellite positions `sats`, using
/// [`crate::orbit::los_unit`] for each line-of-sight unit vector `e`.
///
/// Returns `None` when there are fewer than 5 satellites (RAIM needs redundancy,
/// `dof = n − 4 ≥ 1`) or when any line of sight is undefined (a satellite that
/// coincides with the user).
pub fn geometry_from_los(user: [f64; 3], sats: &[[f64; 3]]) -> Option<Vec<[f64; 4]>> {
    if sats.len() < 5 {
        return None;
    }
    let mut g: Vec<[f64; 4]> = Vec::with_capacity(sats.len());
    for &s in sats {
        let e = los_unit(user, s)?;
        g.push([-e[0], -e[1], -e[2], 1.0]);
    }
    Some(g)
}

/// The decomposition of a measurement error `δy` into the part the user silently
/// absorbs (RAIM-invisible) and the part RAIM can detect (the parity residual).
///
/// All fields are analytic consequences of the geometry `G`; there is no
/// stochastic or external-oracle content.
#[derive(Clone, Debug)]
pub struct CommonModeSplit {
    /// `S·δy` — the position+clock state error the user absorbs. This is the
    /// blind part: it is completely invisible to any RAIM residual test.
    pub blind_dx: [f64; 4],
    /// `r = δy − G·blind_dx` — the parity residual, i.e. exactly what RAIM sees.
    pub detectable_residual: Vec<f64>,
    /// `‖G·blind_dx‖` — the magnitude of `δy` that lives in `range(G)`.
    pub blind_norm: f64,
    /// `‖r‖` — the magnitude of `δy` that lives in the parity space.
    pub detectable_norm: f64,
    /// `blind_norm / ‖δy‖` — 1.0 when `δy` is perfectly blind (entirely in
    /// `range(G)`), 0.0 when it is fully detectable (entirely in parity space).
    pub blind_fraction: f64,
}

/// The least-squares **state map** `S = (GᵀG)⁻¹Gᵀ` (the `4 × n` matrix taking a
/// measurement-error vector `δy` to the state estimate error `S·δy`), returned as
/// `n` columns each `[f64; 4]` (column `c` is `s[c]`, so `s[c][i] = S[i][c]`).
///
/// Builds `GᵀG`, inverts it with [`crate::orbit::invert4`], then
/// `s[c][i] = Σ_k (GᵀG)⁻¹[i][k]·G[c][k]`. Returns `None` when there are fewer
/// than 5 rows (`dof = n − 4 ≥ 1` is required) or when `GᵀG` is singular
/// (rank-deficient geometry).
///
/// This is the single source of `S` for the module: [`common_mode_split`],
/// [`blind_position_covariance`], and [`cmpl_horizontal`] all route through it.
pub fn state_map(geometry: &[[f64; 4]]) -> Option<Vec<[f64; 4]>> {
    let n = geometry.len();
    if n < 5 {
        return None;
    }

    // Normal matrix GtG and its inverse A0 = (GtG)^-1.
    let mut gtg = [[0.0_f64; 4]; 4];
    for row in geometry {
        for i in 0..4 {
            for j in 0..4 {
                gtg[i][j] += row[i] * row[j];
            }
        }
    }
    let a0 = invert4(gtg)?;

    // S = A0 * G^T  (4 x n): columns s_c map measurement errors to the state.
    let s: Vec<[f64; 4]> = (0..n)
        .map(|c| {
            let mut col = [0.0_f64; 4];
            for (i, ci) in col.iter_mut().enumerate() {
                *ci = (0..4).map(|k| a0[i][k] * geometry[c][k]).sum();
            }
            col
        })
        .collect();
    Some(s)
}

/// Split a measurement error `delta_y` into its RAIM-invisible (`range(G)`) and
/// RAIM-detectable (parity) parts for the geometry `geometry` (rows
/// `[-eₓ, -e_y, -e_z, 1]`).
///
/// Uses `S = (GᵀG)⁻¹Gᵀ` (unit measurement weighting) built with
/// [`crate::orbit::invert4`], then `blind_dx = S·δy`, `pred = G·blind_dx`, and
/// `detectable_residual = δy − pred`. Norms are Euclidean.
///
/// Returns `None` when `geometry.len() != delta_y.len()`, when there are fewer
/// than 5 rows (no redundancy), when `GᵀG` is singular (rank-deficient
/// geometry), or when `δy` is exactly zero (the blind fraction is then
/// undefined — a zero perturbation has no direction to classify).
pub fn common_mode_split(geometry: &[[f64; 4]], delta_y: &[f64]) -> Option<CommonModeSplit> {
    let n = geometry.len();
    if n != delta_y.len() || n < 5 {
        return None;
    }
    let dy_norm = norm(delta_y);
    // A zero perturbation has no direction, so its blind fraction is undefined.
    if dy_norm == 0.0 {
        return None;
    }

    // S = (GtG)^-1 G^T (4 x n) via the shared state map; None if singular.
    let s = state_map(geometry)?;

    // blind_dx = S * delta_y.
    let mut blind_dx = [0.0_f64; 4];
    for (c, &dy) in delta_y.iter().enumerate() {
        for i in 0..4 {
            blind_dx[i] += s[c][i] * dy;
        }
    }

    // pred = G * blind_dx (the range(G) part of delta_y); residual = delta_y - pred.
    let mut detectable_residual = Vec::with_capacity(n);
    let mut blind_sq = 0.0_f64;
    for (c, &dy) in delta_y.iter().enumerate() {
        let pred: f64 = (0..4).map(|k| geometry[c][k] * blind_dx[k]).sum();
        blind_sq += pred * pred;
        detectable_residual.push(dy - pred);
    }
    let blind_norm = blind_sq.sqrt();
    let detectable_norm = norm(&detectable_residual);
    let blind_fraction = blind_norm / dy_norm;

    Some(CommonModeSplit {
        blind_dx,
        detectable_residual,
        blind_norm,
        detectable_norm,
        blind_fraction,
    })
}

/// The **blind** user *position* covariance induced by a common-mode
/// measurement-error covariance `cm_cov`.
///
/// A common-mode error absorbed as a state error is `δx = S·δy`, so a
/// measurement-error covariance `Σ = cm_cov` maps to the blind state covariance
/// `C = S·Σ·Sᵀ` (`4 × 4`). This returns the position block `C[0..3][0..3]`
/// (`3 × 3`, in the inertial frame the geometry is expressed in). Because this
/// error lives in `range(G)` it carries **zero** parity residual — ARAIM cannot
/// see it — yet its position part is a genuine error the user suffers.
///
/// `cm_cov` is the `n × n` common-mode measurement-error covariance (symmetric
/// PSD, caller-supplied and **Modelled**). Returns `None` on a dimension mismatch
/// (`cm_cov` is not `n × n`) or singular / under-determined geometry.
pub fn blind_position_covariance(
    geometry: &[[f64; 4]],
    cm_cov: &[Vec<f64>],
) -> Option<[[f64; 3]; 3]> {
    let n = geometry.len();
    if cm_cov.len() != n || cm_cov.iter().any(|row| row.len() != n) {
        return None;
    }
    // S as n columns (s[c][i] = S[i][c]); None if <5 rows or singular geometry.
    let s = state_map(geometry)?;

    // M = cm_cov · Sᵀ restricted to the 3 position columns:
    // m[a][i] = Σ_b cm_cov[a][b] · S[i][b] = Σ_b cm_cov[a][b] · s[b][i].
    let mut m = vec![[0.0_f64; 3]; n];
    for a in 0..n {
        for i in 0..3 {
            let mut acc = 0.0_f64;
            for b in 0..n {
                acc += cm_cov[a][b] * s[b][i];
            }
            m[a][i] = acc;
        }
    }

    // C_pos = (S · M) position block:
    // c[i][j] = Σ_a S[i][a] · m[a][j] = Σ_a s[a][i] · m[a][j].
    let mut c = [[0.0_f64; 3]; 3];
    for i in 0..3 {
        for j in 0..3 {
            let mut acc = 0.0_f64;
            for a in 0..n {
                acc += s[a][i] * m[a][j];
            }
            c[i][j] = acc;
        }
    }
    Some(c)
}

/// The **Common-mode Protection Level (CMPL)**: the `k`-σ horizontal position
/// error from the blind (common-mode) class, in metres.
///
/// Takes the blind position covariance from [`blind_position_covariance`],
/// rotates it into the user's local East-North-Up frame using
/// [`crate::orbit::enu_basis`] (`C_enu = Rᵀ·C·R`, with `R`'s columns the E, N, U
/// unit vectors), extracts the horizontal `2 × 2` (E, N) block, and returns
/// `k · √λ_max` where `λ_max` is that block's larger eigenvalue — i.e. `k` times
/// the semi-major axis of the 1-σ horizontal error ellipse, the standard
/// protection-level form. The `2 × 2` eigenvalue is solved in closed form.
///
/// `cm_cov` and `k` are **Modelled** inputs. Returns `None` on invalid inputs:
/// dimension mismatch, singular geometry, a degenerate user position (no ENU
/// basis at the geocentre), or a non-finite / negative horizontal eigenvalue
/// (e.g. a caller-supplied `cm_cov` that is not PSD, or a non-finite `k`).
pub fn cmpl_horizontal(
    geometry: &[[f64; 4]],
    user: [f64; 3],
    cm_cov: &[Vec<f64>],
    k: f64,
) -> Option<f64> {
    if !k.is_finite() {
        return None;
    }
    // Position covariance in the inertial frame the geometry is expressed in.
    let c = blind_position_covariance(geometry, cm_cov)?;
    // Local ENU basis at the user; R = [east | north | up] (columns).
    let (east, north, _up) = enu_basis(user)?;

    // Horizontal 2x2 block of C_enu = Rᵀ C R, i.e. h[a][b] = ê_aᵀ · C · ê_b for
    // ê ∈ {east, north}. Symmetric because C is.
    let basis = [east, north];
    let mut h = [[0.0_f64; 2]; 2];
    for a in 0..2 {
        for b in 0..2 {
            let mut acc = 0.0_f64;
            for i in 0..3 {
                for j in 0..3 {
                    acc += basis[a][i] * c[i][j] * basis[b][j];
                }
            }
            h[a][b] = acc;
        }
    }

    // Larger eigenvalue of the symmetric 2x2 [[h00, h01], [h10, h11]]:
    // λ = tr/2 ± √((tr/2)² − det), take the +.
    let half_tr = 0.5 * (h[0][0] + h[1][1]);
    let det = h[0][0] * h[1][1] - h[0][1] * h[1][0];
    let disc = half_tr * half_tr - det;
    if disc < 0.0 {
        // Non-PSD 2x2 (invalid covariance): the eigenvalues are complex.
        return None;
    }
    let lambda_max = half_tr + disc.sqrt();
    if !lambda_max.is_finite() || lambda_max < 0.0 {
        return None;
    }
    let cmpl = k * lambda_max.sqrt();
    cmpl.is_finite().then_some(cmpl)
}

/// A user's total horizontal integrity envelope, decomposed into the ARAIM
/// protection level and the common-mode protection level. Metres. **Modelled.**
///
/// Scope note (important): the ARAIM/RAIM *residual (fault-detection) test* is
/// provably blind to a `range(G)` error, but the ARAIM *protection level* is a
/// different object — its fault-free (nominal) hypothesis already bounds
/// undetectable error up to the URA/SISA overbound plus the nominal-bias term
/// `b_nom`. So the ARAIM HPL is not "blind" to the common-mode class; it bounds it
/// up to a single provider's declared `σ_URA + b_nom`. The gap the CMPL fills is
/// therefore specific to the *multi-provider* case: a cross-provider frame/ephemeris
/// common-mode that lies OUTSIDE any single provider's per-provider URA/ISM budget.
#[derive(Clone, Copy, Debug, PartialEq)]
pub struct IntegrityEnvelope {
    /// The ARAIM horizontal protection level (a per-provider bound). Its fault-free
    /// term already bounds undetectable error up to `σ_URA + b_nom`; what it is not
    /// sized for is an inter-provider common-mode inconsistency.
    pub hpl_araim: f64,
    /// The Common-mode Protection Level: the k-σ horizontal error from the blind
    /// (`range(G)`) class that a single provider's URA does not overbound — the
    /// cross-provider inter-ephemeris excess. Invisible to the residual test.
    pub cmpl: f64,
    /// `hpl_araim + cmpl` — a conservative (triangle-inequality) bound: in the
    /// horizontal-position domain the detectable and blind contributions can align,
    /// so the linear sum, not an RSS, is the guaranteed envelope. Valid only where
    /// the common-mode magnitude is NOT already absorbed into `σ_URA` (otherwise the
    /// two terms overlap and the sum double-counts).
    pub hpl_total: f64,
}

/// Combine the ARAIM horizontal protection level with the common-mode protection
/// level into a total integrity envelope.
///
/// The ARAIM/RAIM *residual test* is provably blind to a `range(G)` common-mode
/// error; the ARAIM *protection level*, however, already bounds undetectable error
/// through its fault-free hypothesis (the `σ_URA` overbound plus the nominal bias
/// `b_nom`). The uncovered term — and what the CMPL supplies — is the multi-provider
/// case: an inter-provider frame/ephemeris common-mode that a single provider's
/// per-provider URA/ISM was never sized to overbound. The envelope is the
/// conservative triangle-inequality sum `hpl_total = hpl_araim + cmpl` (an RSS would
/// under-bound and overclaim integrity, since the two contributions can align in the
/// position domain); it is valid only where the common-mode is not already inside
/// `σ_URA`, otherwise it double-counts. **Modelled** (the CMPL rests on a Modelled
/// common-mode covariance and a representative HPL).
pub fn integrity_envelope(hpl_araim: f64, cmpl: f64) -> IntegrityEnvelope {
    IntegrityEnvelope {
        hpl_araim,
        cmpl,
        hpl_total: hpl_araim + cmpl,
    }
}

/// Euclidean (L2) norm of a vector.
fn norm(v: &[f64]) -> f64 {
    v.iter().map(|x| x * x).sum::<f64>().sqrt()
}

#[cfg(test)]
mod tests {
    use super::*;

    /// A user with six well-spread satellites, giving a full-rank geometry.
    fn test_geometry() -> Vec<[f64; 4]> {
        let user = [7.0e6, 0.0, 0.0];
        let sats = [
            [user[0] + 2.0e7, user[1], user[2]],
            [user[0], user[1] + 2.0e7, user[2]],
            [user[0], user[1], user[2] + 2.0e7],
            [user[0] - 1.5e7, user[1] + 1.0e7, user[2] + 0.5e7],
            [user[0] + 1.0e7, user[1] - 1.5e7, user[2] + 1.0e7],
            [user[0] - 1.0e7, user[1] - 1.0e7, user[2] - 1.5e7],
        ];
        geometry_from_los(user, &sats).expect("6 spread satellites give a valid geometry")
    }

    /// `y = G·delta` for a state vector `delta` — a pure `range(G)` error.
    fn g_times(g: &[[f64; 4]], delta: [f64; 4]) -> Vec<f64> {
        g.iter()
            .map(|row| (0..4).map(|k| row[k] * delta[k]).sum())
            .collect()
    }

    /// Any parity-space vector: `w = v − G·(S·v) = P⊥·v`, built by round-tripping
    /// an arbitrary `v` through the split (the returned residual is `P⊥·v`).
    fn parity_vector(g: &[[f64; 4]], v: &[f64]) -> Vec<f64> {
        common_mode_split(g, v)
            .expect("split of a nonzero vector exists")
            .detectable_residual
    }

    #[test]
    fn pure_common_mode_error_is_perfectly_blind() {
        let g = test_geometry();
        let delta = [1.0, -2.0, 0.5, 3.0];
        let delta_y = g_times(&g, delta);

        let split = common_mode_split(&g, &delta_y).expect("valid split");
        assert!(
            (split.blind_fraction - 1.0).abs() < 1e-9,
            "blind_fraction = {}",
            split.blind_fraction
        );
        assert!(
            split.detectable_norm < 1e-9,
            "detectable_norm = {}",
            split.detectable_norm
        );
        for (k, (&got, &want)) in split.blind_dx.iter().zip(&delta).enumerate() {
            assert!(
                (got - want).abs() < 1e-9,
                "blind_dx[{k}] = {got} vs delta {want}"
            );
        }
    }

    #[test]
    fn pure_parity_error_is_fully_detectable() {
        let g = test_geometry();
        // An arbitrary seed, then project it into the parity space.
        let v = [0.3, 1.7, -0.4, 2.1, -1.1, 0.9];
        let w = parity_vector(&g, &v);
        let w_norm = norm(&w);
        assert!(w_norm > 1e-6, "parity component must be non-trivial");

        let split = common_mode_split(&g, &w).expect("valid split");
        assert!(
            split.blind_fraction.abs() < 1e-9,
            "blind_fraction = {}",
            split.blind_fraction
        );
        assert!(
            (split.detectable_norm - w_norm).abs() < 1e-9,
            "detectable_norm = {} vs ‖w‖ = {}",
            split.detectable_norm,
            w_norm
        );
    }

    #[test]
    fn split_is_additive() {
        let g = test_geometry();
        let delta = [1.0, -2.0, 0.5, 3.0];
        let g_delta = g_times(&g, delta);
        let v = [0.3, 1.7, -0.4, 2.1, -1.1, 0.9];
        let w = parity_vector(&g, &v);
        let w_norm = norm(&w);

        let a = 2.5;
        let b = -1.3;
        let combined: Vec<f64> = g_delta
            .iter()
            .zip(&w)
            .map(|(&gd, &wi)| a * gd + b * wi)
            .collect();

        let split = common_mode_split(&g, &combined).expect("valid split");
        for (k, (&got, &d)) in split.blind_dx.iter().zip(&delta).enumerate() {
            let want = a * d;
            assert!(
                (got - want).abs() < 1e-9,
                "blind_dx[{k}] = {got} vs a·delta {want}"
            );
        }
        assert!(
            (split.detectable_norm - b.abs() * w_norm).abs() < 1e-9,
            "detectable_norm = {} vs |b|·‖w‖ = {}",
            split.detectable_norm,
            b.abs() * w_norm
        );
    }

    #[test]
    fn too_few_or_singular_returns_none() {
        // Fewer than 5 rows -> None (geometry_from_los and common_mode_split).
        let user = [7.0e6, 0.0, 0.0];
        let few = [[8.0e6, 0.0, 0.0], [7.0e6, 1.0e6, 0.0]];
        assert!(geometry_from_los(user, &few).is_none());

        let g4 = vec![
            [-1.0, 0.0, 0.0, 1.0],
            [0.0, -1.0, 0.0, 1.0],
            [0.0, 0.0, -1.0, 1.0],
            [-0.577, -0.577, -0.577, 1.0],
        ];
        assert!(common_mode_split(&g4, &[1.0, 1.0, 1.0, 1.0]).is_none());

        // Mismatched lengths -> None.
        let g = test_geometry();
        let wrong_len = vec![0.0; g.len() - 1];
        assert!(common_mode_split(&g, &wrong_len).is_none());

        // Zero perturbation -> None (blind fraction undefined).
        let zero = vec![0.0; g.len()];
        assert!(common_mode_split(&g, &zero).is_none());
    }

    /// The user position matching `test_geometry` (needed for the ENU rotation).
    fn test_user() -> [f64; 3] {
        [7.0e6, 0.0, 0.0]
    }

    /// Rank-1 common-mode covariance `σ²·(u·uᵀ)` from a measurement-space vector.
    fn rank1_cov(u: &[f64], sigma: f64) -> Vec<Vec<f64>> {
        let s2 = sigma * sigma;
        u.iter()
            .map(|&ui| u.iter().map(|&uj| s2 * ui * uj).collect())
            .collect()
    }

    #[test]
    fn common_mode_covariance_gives_positive_cmpl() {
        let g = test_geometry();
        let user = test_user();
        // A genuine range(G) / blind direction: u = G·d for a state direction d.
        let d = [1.0, -2.0, 0.5, 3.0];
        let u = g_times(&g, d);
        let sigma = 5.0;
        let cm_cov = rank1_cov(&u, sigma);

        let cmpl = cmpl_horizontal(&g, user, &cm_cov, 5.33).expect("valid CMPL");
        assert!(cmpl.is_finite() && cmpl > 0.0, "cmpl = {cmpl}");

        let cpos = blind_position_covariance(&g, &cm_cov).expect("valid position covariance");
        for (i, row) in cpos.iter().enumerate() {
            assert!(row[i] > 0.0, "cpos[{i}][{i}] = {} not positive", row[i]);
        }
    }

    #[test]
    fn parity_only_covariance_gives_near_zero_cmpl() {
        let g = test_geometry();
        let user = test_user();
        // A parity-space direction w = P⊥·v (orthogonal to range(G)); a covariance
        // built from it is fully detectable, so it is NOT blind and yields ~0 CMPL.
        let v = [0.3, 1.7, -0.4, 2.1, -1.1, 0.9];
        let w = parity_vector(&g, &v);
        let sigma = 5.0;
        let cm_cov = rank1_cov(&w, sigma);

        let cmpl = cmpl_horizontal(&g, user, &cm_cov, 5.33).expect("valid CMPL");
        assert!(
            cmpl.abs() < 1e-6 * sigma,
            "parity-space error must contribute ~no CMPL, got {cmpl}"
        );
    }

    #[test]
    fn envelope_sums_the_two_classes() {
        let env = integrity_envelope(12.0, 5.0);
        assert_eq!(env.hpl_araim, 12.0);
        assert_eq!(env.cmpl, 5.0);
        assert_eq!(env.hpl_total, 17.0);
    }

    #[test]
    fn state_map_matches_split() {
        let g = test_geometry();
        let s = state_map(&g).expect("valid state map");
        let delta_y = [0.3, 1.7, -0.4, 2.1, -1.1, 0.9];

        // blind_dx = S · δy composed directly from the exposed state map.
        let mut dx = [0.0_f64; 4];
        for (c, &dy) in delta_y.iter().enumerate() {
            for i in 0..4 {
                dx[i] += s[c][i] * dy;
            }
        }

        let split = common_mode_split(&g, &delta_y).expect("valid split");
        for (k, (&got, &want)) in dx.iter().zip(&split.blind_dx).enumerate() {
            assert!(
                (got - want).abs() < 1e-12,
                "state_map dx[{k}] = {got} vs split.blind_dx = {want}"
            );
        }
    }
}
