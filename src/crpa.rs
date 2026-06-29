// SPDX-License-Identifier: AGPL-3.0-only
//! Controlled-reception-pattern antenna (**CRPA**) anti-jam beamforming: deterministic
//! null-steering and minimum-variance distortionless-response (MVDR) weights for an
//! `N`-element GNSS array.
//!
//! Each element sees a plane wave from direction `û` with a position-dependent phase; the
//! per-element responses stack into the **steering vector** `a(û)`, `a_n = exp(j·k·pₙ·û)`
//! with `k = 2π/λ`. A complex weight vector `w` combines the elements, output `y = wᴴ x`,
//! and the array's complex gain toward `û` is `wᴴ a(û)`.
//!
//! Two classic weightings:
//!
//! * **Deterministic null-steering** — choose `w` so the gain is unity toward the
//!   satellite (`wᴴ a_sv = 1`, *distortionless*) and exactly zero toward each jammer
//!   (`wᴴ a_jam = 0`). With `m ≤ N − 1` jammers the constraints `A w = b` are
//!   under/exactly-determined; the minimum-norm solution `w = Aᴴ (A Aᴴ)⁻¹ b` satisfies
//!   them exactly. An `N`-element array thus places up to `N − 1` independent nulls.
//!
//! * **MVDR** — given the interference-plus-noise covariance `R = σ²I + Σ Pₖ aₖ aₖᴴ`,
//!   `w = R⁻¹ a_sv / (a_svᴴ R⁻¹ a_sv)` minimises the output power subject to unit SV gain.
//!   It self-steers deep nulls onto strong interferers without being told their
//!   directions, and the residual output power is `1 / (a_svᴴ R⁻¹ a_sv)`.
//!
//! Scope (honest): narrowband, far-field, identical-isotropic-element array geometry with
//! perfect channel knowledge — no mutual coupling, per-element gain/phase mismatch, finite
//! bandwidth (no tapped-delay-line/space-time adaptive processing), or steering-vector
//! estimation error. It is a MODELLED capability whose reference tests check the
//! constraint algebra (exact unit SV gain and deep jammer nulls), the `N−1`-null capacity,
//! and the MVDR distortionless / null-deepening behaviour — internal-consistency oracles,
//! not an external dataset.
//!
//! References:
//! - H. L. Van Trees, *Optimum Array Processing* (Detection, Estimation, and Modulation
//!   Theory, Part IV), Wiley 2002, §6–7 (MVDR / LCMV beamforming, null-steering).
//! - E. D. Kaplan & C. J. Hegarty (eds.), *Understanding GPS/GNSS*, 3rd ed., §9
//!   (antenna arrays and interference suppression).

use std::f64::consts::PI;
use std::ops::{Add, Div, Mul, Neg, Sub};

/// A minimal complex number (`re + im·j`).
#[derive(Clone, Copy, Debug, PartialEq)]
pub struct C {
    pub re: f64,
    pub im: f64,
}

impl C {
    pub const fn new(re: f64, im: f64) -> Self {
        Self { re, im }
    }
    pub const fn zero() -> Self {
        Self { re: 0.0, im: 0.0 }
    }
    pub const fn one() -> Self {
        Self { re: 1.0, im: 0.0 }
    }
    /// `exp(j·θ)` = `cos θ + j·sin θ`.
    pub fn expi(theta: f64) -> Self {
        Self {
            re: theta.cos(),
            im: theta.sin(),
        }
    }
    pub fn conj(self) -> Self {
        Self {
            re: self.re,
            im: -self.im,
        }
    }
    pub fn norm_sq(self) -> f64 {
        self.re * self.re + self.im * self.im
    }
    pub fn abs(self) -> f64 {
        self.norm_sq().sqrt()
    }
}

impl Add for C {
    type Output = C;
    fn add(self, o: C) -> C {
        C::new(self.re + o.re, self.im + o.im)
    }
}
impl Sub for C {
    type Output = C;
    fn sub(self, o: C) -> C {
        C::new(self.re - o.re, self.im - o.im)
    }
}
impl Neg for C {
    type Output = C;
    fn neg(self) -> C {
        C::new(-self.re, -self.im)
    }
}
impl Mul for C {
    type Output = C;
    fn mul(self, o: C) -> C {
        C::new(
            self.re * o.re - self.im * o.im,
            self.re * o.im + self.im * o.re,
        )
    }
}
impl Div for C {
    type Output = C;
    fn div(self, o: C) -> C {
        let d = o.norm_sq();
        let n = self * o.conj();
        C::new(n.re / d, n.im / d)
    }
}

/// A 3-D position / direction (metres / unit vector).
pub type Vec3 = [f64; 3];

fn dot3(a: Vec3, b: Vec3) -> f64 {
    a[0] * b[0] + a[1] * b[1] + a[2] * b[2]
}

/// Steering vector `a(û)` for element positions `pos` (m), a unit look direction
/// `dir_unit`, and wavelength `lambda` (m): `aₙ = exp(j·(2π/λ)·pₙ·û)`.
pub fn steering(pos: &[Vec3], dir_unit: Vec3, lambda: f64) -> Vec<C> {
    let k = 2.0 * PI / lambda;
    pos.iter()
        .map(|&p| C::expi(k * dot3(p, dir_unit)))
        .collect()
}

/// Complex inner product `xᴴ y` (conjugate-linear in the first argument).
pub fn inner(x: &[C], y: &[C]) -> C {
    let mut s = C::zero();
    for (&xi, &yi) in x.iter().zip(y) {
        s = s + xi.conj() * yi;
    }
    s
}

/// Array complex gain `wᴴ a(û)` toward direction `dir_unit`.
pub fn array_response(weights: &[C], pos: &[Vec3], dir_unit: Vec3, lambda: f64) -> C {
    inner(weights, &steering(pos, dir_unit, lambda))
}

/// Solve the dense complex linear system `A x = b` by Gaussian elimination with partial
/// pivoting. Returns `None` if `A` is (numerically) singular.
#[allow(clippy::needless_range_loop)]
pub fn solve(a: &[Vec<C>], b: &[C]) -> Option<Vec<C>> {
    let n = b.len();
    let mut m: Vec<Vec<C>> = a.to_vec();
    let mut r = b.to_vec();
    for col in 0..n {
        // partial pivot on largest |·|
        let mut p = col;
        for row in (col + 1)..n {
            if m[row][col].abs() > m[p][col].abs() {
                p = row;
            }
        }
        if m[p][col].abs() < 1e-300 {
            return None;
        }
        m.swap(col, p);
        r.swap(col, p);
        let piv = m[col][col];
        for row in (col + 1)..n {
            let f = m[row][col] / piv;
            for c in col..n {
                m[row][c] = m[row][c] - f * m[col][c];
            }
            r[row] = r[row] - f * r[col];
        }
    }
    let mut x = vec![C::zero(); n];
    for i in (0..n).rev() {
        let mut s = r[i];
        for c in (i + 1)..n {
            s = s - m[i][c] * x[c];
        }
        x[i] = s / m[i][i];
    }
    Some(x)
}

/// Deterministic null-steering weights: unity gain toward `sv_dir`, exact nulls toward
/// every `jammer_dirs`. With `m = 1 + jammers ≤ N` constraints the minimum-norm solution
/// `w = Aᴴ (A Aᴴ)⁻¹ b` (rows of `A` are `a(dir)ᴴ`, `b = [1, 0, …]ᴴ`) meets them exactly.
/// Returns `None` if there are more constraints than elements or the geometry is singular.
#[allow(clippy::needless_range_loop)]
pub fn null_steering_weights(
    pos: &[Vec3],
    lambda: f64,
    sv_dir: Vec3,
    jammer_dirs: &[Vec3],
) -> Option<Vec<C>> {
    let n = pos.len();
    let m = 1 + jammer_dirs.len();
    if m > n {
        return None; // an N-element array can only null N−1 jammers
    }
    // Constraint steering vectors and desired responses.
    let mut steer: Vec<Vec<C>> = Vec::with_capacity(m);
    steer.push(steering(pos, sv_dir, lambda));
    for &j in jammer_dirs {
        steer.push(steering(pos, j, lambda));
    }
    let mut g = vec![C::zero(); m];
    g[0] = C::one();

    // Gram matrix G = A Aᴴ (m×m), Gᵢⱼ = aᵢᴴ aⱼ; solve G λ = b with b = conj(g)… but since
    // constraints are wᴴ aᵢ = gᵢ ⇔ aᵢᴴ w = conj(gᵢ), the min-norm w = Σ λₖ aₖ with
    // G λ = conj(g). Then wₙ = Σ λₖ aₖ[n].
    let mut gram = vec![vec![C::zero(); m]; m];
    for i in 0..m {
        for j in 0..m {
            gram[i][j] = inner(&steer[i], &steer[j]);
        }
    }
    let rhs: Vec<C> = g.iter().map(|&gi| gi.conj()).collect();
    let lam = solve(&gram, &rhs)?;
    let mut w = vec![C::zero(); n];
    for (k, ak) in steer.iter().enumerate() {
        for nn in 0..n {
            w[nn] = w[nn] + lam[k] * ak[nn];
        }
    }
    Some(w)
}

/// MVDR weights `w = R⁻¹ a_sv / (a_svᴴ R⁻¹ a_sv)` for an interference-plus-noise
/// covariance `r` (`N×N` Hermitian) and the satellite steering vector `a_sv`.
pub fn mvdr_weights(r: &[Vec<C>], a_sv: &[C]) -> Option<Vec<C>> {
    let y = solve(r, a_sv)?; // y = R⁻¹ a_sv
    let denom = inner(a_sv, &y); // a_svᴴ R⁻¹ a_sv (real, positive)
    if denom.abs() < 1e-300 {
        return None;
    }
    Some(y.iter().map(|&yi| yi / denom).collect())
}

/// Build the interference-plus-noise covariance `R = σ²·I + Σ Pₖ aₖ aₖᴴ` for noise power
/// `sigma2`, jammer powers `powers`, and jammer steering vectors `jammers`.
#[allow(clippy::needless_range_loop)]
pub fn covariance(n: usize, sigma2: f64, powers: &[f64], jammers: &[Vec<C>]) -> Vec<Vec<C>> {
    let mut r = vec![vec![C::zero(); n]; n];
    for i in 0..n {
        r[i][i] = C::new(sigma2, 0.0);
    }
    for (p, a) in powers.iter().zip(jammers) {
        for i in 0..n {
            for j in 0..n {
                // Pₖ · aₖ[i] · conj(aₖ[j])
                r[i][j] = r[i][j] + C::new(*p, 0.0) * a[i] * a[j].conj();
            }
        }
    }
    r
}

#[cfg(test)]
mod tests {
    use super::*;

    fn approx(a: f64, b: f64, tol: f64) -> bool {
        (a - b).abs() <= tol
    }

    // A uniform linear array of N elements at half-wavelength spacing along x.
    fn ula(n: usize, lambda: f64) -> Vec<Vec3> {
        let d = lambda / 2.0;
        (0..n).map(|i| [i as f64 * d, 0.0, 0.0]).collect()
    }
    // Look direction at azimuth `theta` (rad) from boresight (the y-axis), in the xy-plane.
    fn dir(theta: f64) -> Vec3 {
        [theta.sin(), theta.cos(), 0.0]
    }

    #[test]
    fn complex_arithmetic_identities() {
        let a = C::new(1.0, 2.0);
        let b = C::new(-3.0, 0.5);
        assert_eq!(a + b, C::new(-2.0, 2.5));
        assert_eq!(a * C::one(), a);
        // z / z = 1
        let q = a / b;
        let back = q * b;
        assert!(approx(back.re, a.re, 1e-12) && approx(back.im, a.im, 1e-12));
        // |exp(jθ)| = 1
        assert!(approx(C::expi(0.9).abs(), 1.0, 1e-12));
        // zᴴz = |z|²
        assert!(approx((a.conj() * a).re, a.norm_sq(), 1e-12));
    }

    #[test]
    fn null_steering_places_unit_sv_gain_and_deep_nulls() {
        let lambda = 0.19; // ~L1
        let n = 4;
        let pos = ula(n, lambda);
        let sv = dir(0.1);
        let jammers = [dir(0.6), dir(-0.4), dir(1.0)]; // N−1 = 3 jammers
        let w = null_steering_weights(&pos, lambda, sv, &jammers).expect("solvable");
        // unity (distortionless) toward the SV.
        let g_sv = array_response(&w, &pos, sv, lambda);
        assert!(
            approx(g_sv.re, 1.0, 1e-9) && approx(g_sv.im, 0.0, 1e-9),
            "SV gain {g_sv:?}"
        );
        // deep nulls toward every jammer.
        for &j in &jammers {
            let g = array_response(&w, &pos, j, lambda);
            assert!(g.abs() < 1e-9, "jammer not nulled: |g| = {}", g.abs());
        }
    }

    #[test]
    fn cannot_null_more_than_n_minus_one_jammers() {
        let lambda = 0.19;
        let n = 3;
        let pos = ula(n, lambda);
        // 3 jammers + 1 SV = 4 constraints > 3 elements ⇒ rejected.
        let jammers = [dir(0.3), dir(-0.3), dir(0.9)];
        assert!(null_steering_weights(&pos, lambda, dir(0.0), &jammers).is_none());
        // exactly N−1 = 2 jammers is fine.
        let ok = null_steering_weights(&pos, lambda, dir(0.0), &jammers[..2]).expect("ok");
        assert_eq!(ok.len(), n);
    }

    #[test]
    fn fewer_jammers_still_distortionless_min_norm() {
        let lambda = 0.19;
        let n = 6;
        let pos = ula(n, lambda);
        let sv = dir(0.2);
        let jammers = [dir(0.7), dir(-0.5)]; // only 2 nulls on a 6-element array
        let w = null_steering_weights(&pos, lambda, sv, &jammers).expect("ok");
        assert!(approx(array_response(&w, &pos, sv, lambda).re, 1.0, 1e-9));
        for &j in &jammers {
            assert!(array_response(&w, &pos, j, lambda).abs() < 1e-9);
        }
    }

    #[test]
    fn mvdr_is_distortionless_and_deepens_nulls_with_jammer_power() {
        let lambda = 0.19;
        let n = 4;
        let pos = ula(n, lambda);
        let sv = dir(0.1);
        let a_sv = steering(&pos, sv, lambda);
        let jam_dir = dir(0.8);
        let a_j = steering(&pos, jam_dir, lambda);

        let mut prev = f64::INFINITY;
        for &power in &[1.0_f64, 1e2, 1e4, 1e6] {
            let r = covariance(n, 1.0, &[power], std::slice::from_ref(&a_j));
            let w = mvdr_weights(&r, &a_sv).expect("mvdr");
            // distortionless toward the SV.
            let g_sv = inner(&w, &a_sv);
            assert!(
                approx(g_sv.re, 1.0, 1e-7) && approx(g_sv.im, 0.0, 1e-7),
                "g_sv {g_sv:?}"
            );
            // null toward the jammer deepens monotonically with jammer power.
            let g_j = array_response(&w, &pos, jam_dir, lambda).abs();
            assert!(g_j < prev, "null did not deepen: {g_j} !< {prev}");
            prev = g_j;
        }
        assert!(prev < 1e-3, "strong jammer not deeply nulled: {prev}");
    }
}
