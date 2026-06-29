// SPDX-License-Identifier: AGPL-3.0-only
//! Passive emitter geolocation by **TDOA** (time-difference-of-arrival) and **FDOA**
//! (frequency-difference-of-arrival) across a network of receivers — the core of
//! locating a jammer/spoofer, or reverse-PNT off an opportunistic emitter, when GNSS
//! itself is the thing under attack.
//!
//! Geometry (ECEF/local Cartesian, metres):
//! - An emitter at `p` is observed by `N ≥ 4` receivers at `rᵢ`. Receiver 0 is the
//!   reference. The **TDOA** of receiver `i` is `τᵢ = (Rᵢ − R₀)/c`, where
//!   `Rᵢ = ‖p − rᵢ‖` and `c` is the speed of light. Each TDOA constrains `p` to one
//!   sheet of a hyperboloid; the intersection of `N − 1` hyperboloids fixes `p`.
//! - With **moving** receivers (velocity `ṙᵢ`) and a moving emitter (velocity `v`), the
//!   range-rate is `Ṙᵢ = ûᵢ · (v − ṙᵢ)` with `ûᵢ` the unit line-of-sight from `rᵢ` to
//!   `p`. The **FDOA** (here the range-rate difference, m/s) is `Ṙᵢ − Ṙ₀`; combining
//!   TDOA + FDOA recovers position *and* velocity.
//!
//! Estimators: a Gauss–Newton least-squares solve (reusing [`crate::batch_ls`]) over
//! the nonlinear range(-rate)-difference model, plus the **Cramér–Rao lower bound**
//! (CRLB) on the position covariance from the measurement geometry. This is a MODELLED
//! capability — its reference tests are self-consistency checks (forward→inverse round
//! trips, `J·CRLB = I`, geometry-driven GDOP behaviour), not an external dataset.

/// A 3-vector `[x, y, z]` (m, or m/s for velocities).
pub type Vec3 = [f64; 3];

/// Speed of light in vacuum (m/s).
pub const C: f64 = 299_792_458.0;

fn sub(a: Vec3, b: Vec3) -> Vec3 {
    [a[0] - b[0], a[1] - b[1], a[2] - b[2]]
}
fn norm(a: Vec3) -> f64 {
    (a[0] * a[0] + a[1] * a[1] + a[2] * a[2]).sqrt()
}
fn dot(a: Vec3, b: Vec3) -> f64 {
    a[0] * b[0] + a[1] * b[1] + a[2] * b[2]
}

/// Unit line-of-sight from receiver `r` toward emitter `p` (`(p − r)/‖p − r‖`).
fn los(p: Vec3, r: Vec3) -> Vec3 {
    let d = sub(p, r);
    let n = norm(d);
    [d[0] / n, d[1] / n, d[2] / n]
}

/// Predicted TDOA (s) of each non-reference receiver relative to `receivers[0]`, for an
/// emitter at `p`. Returns `receivers.len() − 1` values.
pub fn tdoa_predict(p: Vec3, receivers: &[Vec3]) -> Vec<f64> {
    let r0 = norm(sub(p, receivers[0]));
    receivers[1..]
        .iter()
        .map(|&ri| (norm(sub(p, ri)) - r0) / C)
        .collect()
}

/// Predicted FDOA (here the range-rate difference, m/s) of each non-reference receiver
/// relative to `receivers[0]`, for an emitter at `p` with velocity `v` observed by
/// receivers with velocities `recv_vel`.
pub fn fdoa_predict(p: Vec3, v: Vec3, receivers: &[Vec3], recv_vel: &[Vec3]) -> Vec<f64> {
    let rr = |i: usize| dot(los(p, receivers[i]), sub(v, recv_vel[i]));
    let rr0 = rr(0);
    (1..receivers.len()).map(|i| rr(i) - rr0).collect()
}

/// Recover the emitter position from TDOA measurements by Gauss–Newton least squares.
///
/// `tdoa` are the `N − 1` time differences (s) relative to `receivers[0]`, `sigma_s`
/// the 1σ TDOA noise (s, for weighting), and `x0` an initial guess. Returns `None` on a
/// rank-deficient geometry or non-convergence.
pub fn solve_tdoa(receivers: &[Vec3], tdoa: &[f64], sigma_s: f64, x0: Vec3) -> Option<Vec3> {
    if receivers.len() < 4 || tdoa.len() != receivers.len() - 1 {
        return None;
    }
    let recv = receivers.to_vec();
    let model = move |x: &[f64]| tdoa_predict([x[0], x[1], x[2]], &recv);
    let w = vec![1.0 / (sigma_s * sigma_s); tdoa.len()];
    let res = crate::batch_ls::gauss_newton(model, tdoa, &w, &x0, 100, 1e-9)?;
    Some([res.x[0], res.x[1], res.x[2]])
}

/// Recover emitter **position and velocity** from combined TDOA + FDOA measurements.
///
/// State is `[x, y, z, vx, vy, vz]`. Needs at least 6 measurements total (so
/// `2(N − 1) ≥ 6`, i.e. `N ≥ 4`). Returns `None` on bad geometry / non-convergence.
#[allow(clippy::too_many_arguments)]
pub fn solve_tdoa_fdoa(
    receivers: &[Vec3],
    recv_vel: &[Vec3],
    tdoa: &[f64],
    fdoa: &[f64],
    sigma_s: f64,
    sigma_rr: f64,
    x0: [f64; 6],
) -> Option<[f64; 6]> {
    let k = receivers.len();
    if k < 4 || recv_vel.len() != k || tdoa.len() != k - 1 || fdoa.len() != k - 1 {
        return None;
    }
    let recv = receivers.to_vec();
    let rvel = recv_vel.to_vec();
    let model = move |x: &[f64]| {
        let p = [x[0], x[1], x[2]];
        let v = [x[3], x[4], x[5]];
        let mut out = tdoa_predict(p, &recv);
        out.extend(fdoa_predict(p, v, &recv, &rvel));
        out
    };
    let mut z = tdoa.to_vec();
    z.extend_from_slice(fdoa);
    let mut w = vec![1.0 / (sigma_s * sigma_s); tdoa.len()];
    w.extend(vec![1.0 / (sigma_rr * sigma_rr); fdoa.len()]);
    // Staged initialisation: position and velocity differ by orders of magnitude and
    // velocity is only observable once the line-of-sight unit vectors (hence position)
    // are roughly right, so bootstrap the position from TDOA alone before the joint
    // refine. Fall back to the caller's guess if the TDOA bootstrap is rank-deficient.
    let p0 = solve_tdoa(receivers, tdoa, sigma_s, [x0[0], x0[1], x0[2]])
        .unwrap_or([x0[0], x0[1], x0[2]]);
    let seed = [p0[0], p0[1], p0[2], x0[3], x0[4], x0[5]];
    let res = crate::batch_ls::gauss_newton(model, &z, &w, &seed, 200, 1e-9)?;
    let x = res.x;
    Some([x[0], x[1], x[2], x[3], x[4], x[5]])
}

/// Inverse of a 3×3 matrix, or `None` if (near-)singular.
fn inverse3(m: &[[f64; 3]; 3]) -> Option<[[f64; 3]; 3]> {
    let det = m[0][0] * (m[1][1] * m[2][2] - m[1][2] * m[2][1])
        - m[0][1] * (m[1][0] * m[2][2] - m[1][2] * m[2][0])
        + m[0][2] * (m[1][0] * m[2][1] - m[1][1] * m[2][0]);
    if det.abs() < 1e-18 {
        return None;
    }
    let inv_det = 1.0 / det;
    let c = |a: usize, b: usize, d: usize, e: usize| m[a][b] * m[d][e];
    let mut out = [[0.0f64; 3]; 3];
    out[0][0] = (c(1, 1, 2, 2) - c(1, 2, 2, 1)) * inv_det;
    out[0][1] = (c(0, 2, 2, 1) - c(0, 1, 2, 2)) * inv_det;
    out[0][2] = (c(0, 1, 1, 2) - c(0, 2, 1, 1)) * inv_det;
    out[1][0] = (c(1, 2, 2, 0) - c(1, 0, 2, 2)) * inv_det;
    out[1][1] = (c(0, 0, 2, 2) - c(0, 2, 2, 0)) * inv_det;
    out[1][2] = (c(0, 2, 1, 0) - c(0, 0, 1, 2)) * inv_det;
    out[2][0] = (c(1, 0, 2, 1) - c(1, 1, 2, 0)) * inv_det;
    out[2][1] = (c(0, 1, 2, 0) - c(0, 0, 2, 1)) * inv_det;
    out[2][2] = (c(0, 0, 1, 1) - c(0, 1, 1, 0)) * inv_det;
    Some(out)
}

/// The Fisher information matrix (3×3) of the TDOA geometry at `emitter`, for 1σ TDOA
/// noise `sigma_s` (s). Uses range-difference sensitivities `gᵢ = ûᵢ − û₀`.
pub fn tdoa_fisher(receivers: &[Vec3], emitter: Vec3, sigma_s: f64) -> [[f64; 3]; 3] {
    let sigma_rho = C * sigma_s; // range-difference noise (m)
    let inv_var = 1.0 / (sigma_rho * sigma_rho);
    let u0 = los(emitter, receivers[0]);
    let mut j = [[0.0f64; 3]; 3];
    for &ri in &receivers[1..] {
        let ui = los(emitter, ri);
        let g = [ui[0] - u0[0], ui[1] - u0[1], ui[2] - u0[2]];
        for a in 0..3 {
            for b in 0..3 {
                j[a][b] += g[a] * g[b] * inv_var;
            }
        }
    }
    j
}

/// The Cramér–Rao lower bound on the **position** covariance (3×3, m²) for the TDOA
/// geometry — the inverse of [`tdoa_fisher`]. `None` for a rank-deficient geometry
/// (e.g. fewer than four receivers, or all receivers collinear with the emitter).
pub fn tdoa_crlb(receivers: &[Vec3], emitter: Vec3, sigma_s: f64) -> Option<[[f64; 3]; 3]> {
    inverse3(&tdoa_fisher(receivers, emitter, sigma_s))
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn tdoa_forward_then_inverse_recovers_a_known_emitter() {
        let receivers = [
            [0.0, 0.0, 0.0],
            [10_000.0, 0.0, 0.0],
            [0.0, 10_000.0, 0.0],
            [0.0, 0.0, 10_000.0],
            [10_000.0, 10_000.0, 0.0],
        ];
        let emitter = [3_200.0, 4_100.0, 1_500.0];
        let tdoa = tdoa_predict(emitter, &receivers);
        let got = solve_tdoa(&receivers, &tdoa, 1e-9, [0.0, 0.0, 0.0]).expect("solves");
        let err = norm(sub(got, emitter));
        assert!(err < 1e-6, "recovered {got:?} vs {emitter:?} (err {err} m)");
    }

    #[test]
    fn crlb_is_the_inverse_of_the_fisher_information() {
        let receivers = [
            [0.0, 0.0, 0.0],
            [12_000.0, 0.0, 500.0],
            [0.0, 9_000.0, -300.0],
            [-8_000.0, 4_000.0, 200.0],
            [5_000.0, -7_000.0, 100.0],
        ];
        let emitter = [2_000.0, 1_500.0, 800.0];
        let j = tdoa_fisher(&receivers, emitter, 5e-9);
        let cov = tdoa_crlb(&receivers, emitter, 5e-9).expect("non-singular geometry");
        // J · CRLB = I (a 3×3 matrix product — the index loops are the clearest form)
        #[allow(clippy::needless_range_loop)]
        for a in 0..3 {
            for b in 0..3 {
                let mut v = 0.0;
                for k in 0..3 {
                    v += j[a][k] * cov[k][b];
                }
                let expected = if a == b { 1.0 } else { 0.0 };
                assert!((v - expected).abs() < 1e-6, "J·CRLB[{a}][{b}]={v}");
            }
        }
        // covariance must be symmetric
        assert!((cov[0][1] - cov[1][0]).abs() < 1e-9);
        assert!((cov[0][2] - cov[2][0]).abs() < 1e-9);
        assert!((cov[1][2] - cov[2][1]).abs() < 1e-9);
    }

    #[test]
    fn adding_a_receiver_does_not_worsen_the_position_bound() {
        // More independent geometry ⇒ the CRLB position variance (trace) cannot grow.
        let base = [
            [0.0, 0.0, 0.0],
            [12_000.0, 0.0, 500.0],
            [0.0, 9_000.0, -300.0],
            [-8_000.0, 4_000.0, 200.0],
        ];
        let emitter = [2_000.0, 1_500.0, 800.0];
        let trace = |c: [[f64; 3]; 3]| c[0][0] + c[1][1] + c[2][2];
        let t4 = trace(tdoa_crlb(&base, emitter, 5e-9).expect("4 rx"));
        let mut more = base.to_vec();
        more.push([5_000.0, -7_000.0, 100.0]);
        let t5 = trace(tdoa_crlb(&more, emitter, 5e-9).expect("5 rx"));
        assert!(
            t5 <= t4 + 1e-6,
            "adding a receiver worsened the bound: {t5} > {t4}"
        );
    }

    #[test]
    fn tdoa_fdoa_recovers_a_moving_emitter_position_and_velocity() {
        let receivers = [
            [0.0, 0.0, 0.0],
            [10_000.0, 0.0, 0.0],
            [0.0, 10_000.0, 0.0],
            [0.0, 0.0, 10_000.0],
            [10_000.0, 10_000.0, 5_000.0],
        ];
        let recv_vel = [
            [200.0, 0.0, 0.0],
            [0.0, 220.0, 0.0],
            [-180.0, 0.0, 0.0],
            [0.0, -210.0, 0.0],
            [150.0, 150.0, 0.0],
        ];
        let emitter = [3_200.0, 4_100.0, 1_500.0];
        let vel = [12.0, -7.0, 3.0];
        let tdoa = tdoa_predict(emitter, &receivers);
        let fdoa = fdoa_predict(emitter, vel, &receivers, &recv_vel);
        let x0 = [0.0, 0.0, 0.0, 0.0, 0.0, 0.0];
        let got =
            solve_tdoa_fdoa(&receivers, &recv_vel, &tdoa, &fdoa, 1e-9, 1e-3, x0).expect("solves");
        let perr = norm(sub([got[0], got[1], got[2]], emitter));
        let verr = norm(sub([got[3], got[4], got[5]], vel));
        assert!(
            perr < 1e-4,
            "position {:?} vs {emitter:?} (err {perr} m)",
            &got[0..3]
        );
        assert!(
            verr < 1e-4,
            "velocity {:?} vs {vel:?} (err {verr} m/s)",
            &got[3..6]
        );
    }

    #[test]
    fn too_few_receivers_is_rejected() {
        let receivers = [[0.0, 0.0, 0.0], [10_000.0, 0.0, 0.0], [0.0, 10_000.0, 0.0]];
        let tdoa = tdoa_predict([1.0, 2.0, 3.0], &receivers);
        assert!(solve_tdoa(&receivers, &tdoa, 1e-9, [0.0, 0.0, 0.0]).is_none());
    }
}
