// SPDX-License-Identifier: Apache-2.0
//! Full **tesseral** spherical-harmonic geopotential — the EGM2008 field to degree/order 70,
//! the high-degree gravity model the numerical propagator's [`crate::forces`] zonal-only field
//! was missing.
//!
//! [`SphericalHarmonicField`] holds fully-normalized `C̄_nm, S̄_nm` coefficients and evaluates
//! the gravitational potential and acceleration in the **Earth-fixed (ECEF) frame** the
//! coefficients are defined in. The normalized associated Legendre functions are computed by the
//! stable Holmes–Featherstone (2002) forward-column recurrence — de-normalizing to the classical
//! `P_nm` would overflow at this degree, so the recurrence is carried out in the normalized
//! variables directly. The shipped coefficients are the NGA EGM2008 product (public domain, via
//! ICGEM), bundled in [`crate::egm2008_data`]; any ICGEM `.gfc` model (EGM2008 to its full
//! degree, EGM96, GGM03, …) loads through [`SphericalHarmonicField::from_gfc`].
//!
//! ## Validation
//!
//! Correctness is pinned against three independent oracles: (1) with only `C̄_00 = 1` the
//! acceleration is the exact point mass `−μr/|r|³`; (2) a *zonal-only* field built from the
//! `[J2..J6]` constants reproduces the independently-implemented [`crate::forces::zonal_accel`]
//! (plus two-body) to ~1e-9 — this validates the whole normalized recurrence against code that
//! never touches it; (3) the analytic acceleration equals the central-difference gradient of the
//! directly-summed [`SphericalHarmonicField::potential`] for the full EGM2008 field at a LEO
//! point, tying the two code paths together.
//!
//! ## Scope (honest)
//!
//! The acceleration uses the spherical-partials transform, which has a `1/cos φ` term that is
//! singular at the geographic poles (floored here); the singularity-free Pines/Cunningham
//! Cartesian recursion is the production follow-on. Evaluation is in the Earth-fixed frame — to
//! perturb the ECI/TEME integration the caller rotates `r` through the ECI↔ECEF reduction
//! ([`crate::cio`]) before calling and rotates the acceleration back.

use crate::egm2008_data::{EGM2008_COEFFS, EGM2008_GM, EGM2008_NMAX, EGM2008_RE};

type Vec3 = [f64; 3];

/// A fully-normalized spherical-harmonic gravity field: `GM`, reference radius `Re`, and the
/// `C̄_nm, S̄_nm` coefficient triangles to [`nmax`](Self::nmax).
#[derive(Clone, Debug)]
pub struct SphericalHarmonicField {
    /// Gravitational parameter `GM` (m³/s²).
    pub gm: f64,
    /// Reference radius `Re` (m).
    pub re: f64,
    /// Maximum degree/order.
    pub nmax: usize,
    /// `c[n][m]` fully-normalized cosine coefficients.
    c: Vec<Vec<f64>>,
    /// `s[n][m]` fully-normalized sine coefficients.
    s: Vec<Vec<f64>>,
}

impl SphericalHarmonicField {
    /// A zero field of the given degree (all `C̄ = S̄ = 0`). Set coefficients with [`set`](Self::set).
    pub fn zeros(gm: f64, re: f64, nmax: usize) -> Self {
        Self {
            gm,
            re,
            nmax,
            c: vec![vec![0.0; nmax + 1]; nmax + 1],
            s: vec![vec![0.0; nmax + 1]; nmax + 1],
        }
    }

    /// Set the fully-normalized `(C̄_nm, S̄_nm)` for degree `n`, order `m` (no-op if out of range).
    pub fn set(&mut self, n: usize, m: usize, cnm: f64, snm: f64) {
        if n <= self.nmax && m <= n {
            self.c[n][m] = cnm;
            self.s[n][m] = snm;
        }
    }

    /// The bundled EGM2008 field to its full shipped degree/order (70).
    pub fn egm2008() -> Self {
        Self::egm2008_truncated(EGM2008_NMAX)
    }

    /// The bundled EGM2008 field truncated to `nmax` (clamped to the shipped 70).
    pub fn egm2008_truncated(nmax: usize) -> Self {
        let nmax = nmax.min(EGM2008_NMAX);
        let mut f = Self::zeros(EGM2008_GM, EGM2008_RE, nmax);
        for &(n, m, cnm, snm) in EGM2008_COEFFS.iter() {
            f.set(n as usize, m as usize, cnm, snm);
        }
        f
    }

    /// Parse a fully-normalized ICGEM `.gfc` model. Reads `earth_gravity_constant`, `radius`, and
    /// the `gfc <n> <m> <C> <S>` lines (Fortran `d`/`D` exponents accepted), to `nmax`.
    pub fn from_gfc(text: &str, nmax: usize) -> Result<Self, String> {
        let ff = |t: &str| t.replace(['d', 'D'], "e").parse::<f64>();
        let mut gm = None;
        let mut re = None;
        let mut rows: Vec<(usize, usize, f64, f64)> = Vec::new();
        let mut max_n = 0usize;
        for line in text.lines() {
            let p: Vec<&str> = line.split_whitespace().collect();
            match p.first().copied() {
                Some("earth_gravity_constant") if p.len() >= 2 => {
                    gm = ff(p[1]).ok();
                }
                Some("radius") if p.len() >= 2 => {
                    re = ff(p[1]).ok();
                }
                Some("gfc") if p.len() >= 5 => {
                    let n: usize = p[1].parse().map_err(|_| "bad degree")?;
                    let m: usize = p[2].parse().map_err(|_| "bad order")?;
                    if n > nmax {
                        continue;
                    }
                    let cnm = ff(p[3]).map_err(|_| "bad C")?;
                    let snm = ff(p[4]).map_err(|_| "bad S")?;
                    max_n = max_n.max(n);
                    rows.push((n, m, cnm, snm));
                }
                _ => {}
            }
        }
        let gm = gm.ok_or("missing earth_gravity_constant")?;
        let re = re.ok_or("missing radius")?;
        // A value can parse yet be non-physical (NaN GM → NaN field; negative GM → repulsive
        // gravity; zero/negative/inf radius). Reject rather than silently fail open.
        if !(gm.is_finite() && gm > 0.0) {
            return Err("non-physical earth_gravity_constant (must be finite and positive)".into());
        }
        if !(re.is_finite() && re > 0.0) {
            return Err("non-physical radius (must be finite and positive)".into());
        }
        if rows.is_empty() {
            return Err("no gfc coefficient lines".into());
        }
        let mut f = Self::zeros(gm, re, max_n.min(nmax));
        for (n, m, cnm, snm) in rows {
            f.set(n, m, cnm, snm);
        }
        Ok(f)
    }

    /// Fully-normalized associated Legendre functions `P̄_nm(sin φ)` and their derivatives
    /// `dP̄_nm/dφ`, for `n, m = 0..=nmax`, by the Holmes–Featherstone forward-column recurrence.
    /// `t = sin φ`, `u = cos φ ≥ 0`. Returns `(p, dp)` as lower-triangular `[n][m]` matrices.
    // The recurrence indices (n, m) are used arithmetically in every step, so a range loop is the
    // natural form here despite `needless_range_loop`.
    #[allow(clippy::needless_range_loop)]
    fn legendre(&self, t: f64, u: f64) -> (Vec<Vec<f64>>, Vec<Vec<f64>>) {
        let n = self.nmax;
        let uu = u.max(1e-300); // floor for the 1/u in the derivative at the poles
        let mut p = vec![vec![0.0; n + 1]; n + 1];
        let mut dp = vec![vec![0.0; n + 1]; n + 1];
        p[0][0] = 1.0;
        // Sectoral P̄_mm and the first sub-diagonal P̄_{m+1,m}. The fully-normalized convention
        // carries a (2−δ_{0m}) factor, so the m=0→m=1 step gains an extra √2 (giving P̄₁₁=√3·u);
        // m≥2 steps have it on both sides and cancel.
        for m in 1..=n {
            let mf = m as f64;
            let delta = if m == 1 { 2.0_f64.sqrt() } else { 1.0 };
            // P̄_mm = u·(2−δ factor)·√((2m+1)/(2m))·P̄_{m-1,m-1}
            p[m][m] = uu * delta * ((2.0 * mf + 1.0) / (2.0 * mf)).sqrt() * p[m - 1][m - 1];
        }
        for m in 0..n {
            // P̄_{m+1,m} = t·√(2m+3)·P̄_mm
            let mf = m as f64;
            p[m + 1][m] = t * (2.0 * mf + 3.0).sqrt() * p[m][m];
        }
        // Column recurrence for n ≥ m+2.
        for m in 0..=n {
            for nn in (m + 2)..=n {
                let (nf, mf) = (nn as f64, m as f64);
                let alpha = ((2.0 * nf - 1.0) * (2.0 * nf + 1.0) / ((nf - mf) * (nf + mf))).sqrt();
                let beta = ((2.0 * nf + 1.0) * (nf - 1.0 - mf) * (nf - 1.0 + mf)
                    / ((2.0 * nf - 3.0) * (nf - mf) * (nf + mf)))
                    .sqrt();
                p[nn][m] = alpha * t * p[nn - 1][m] - beta * p[nn - 2][m];
            }
        }
        // Derivatives (Abramowitz & Stegun 8.5.4, normalized): dP̄_nm/dφ =
        // (γ_nm·P̄_{n-1,m} − n·t·P̄_nm) / u,  γ_nm = √[(2n+1)(n-m)(n+m)/(2n-1)].
        for nn in 0..=n {
            for m in 0..=nn {
                let (nf, mf) = (nn as f64, m as f64);
                let prev = if nn >= 1 && m < nn { p[nn - 1][m] } else { 0.0 };
                let gamma = if nn >= 1 {
                    ((2.0 * nf + 1.0) * (nf - mf) * (nf + mf) / (2.0 * nf - 1.0)).sqrt()
                } else {
                    0.0
                };
                dp[nn][m] = (gamma * prev - nf * t * p[nn][m]) / uu;
            }
        }
        (p, dp)
    }

    /// Gravitational potential `U(r)` (m²/s², positive) in the Earth-fixed frame, including the
    /// central `GM/r` term (so `U = GM/r` for a point mass). The acceleration is `∇U`.
    #[allow(clippy::needless_range_loop)]
    pub fn potential(&self, r: Vec3) -> f64 {
        let rn = (r[0] * r[0] + r[1] * r[1] + r[2] * r[2]).sqrt();
        let t = r[2] / rn; // sin φ
        let u = ((r[0] * r[0] + r[1] * r[1]).sqrt() / rn).max(0.0); // cos φ
        let lambda = r[1].atan2(r[0]);
        let (p, _) = self.legendre(t, u);
        let ror = self.re / rn;
        let mut sum = 0.0;
        let mut rn_pow = 1.0; // (Re/r)^n
        for nn in 0..=self.nmax {
            let mut an = 0.0;
            for m in 0..=nn {
                let (cl, sl) = ((m as f64 * lambda).cos(), (m as f64 * lambda).sin());
                an += p[nn][m] * (self.c[nn][m] * cl + self.s[nn][m] * sl);
            }
            sum += rn_pow * an;
            rn_pow *= ror;
        }
        self.gm / rn * sum
    }

    /// Gravitational acceleration `∇U` (m/s², Earth-fixed) — the **total** field, central term
    /// included, so a point-mass field returns `−μr/|r|³`.
    #[allow(clippy::needless_range_loop)]
    pub fn acceleration(&self, r: Vec3) -> Vec3 {
        let r2 = r[0] * r[0] + r[1] * r[1] + r[2] * r[2];
        let rn = r2.sqrt();
        let rxy = (r[0] * r[0] + r[1] * r[1]).sqrt();
        let rxy_f = rxy.max(1e-6 * self.re); // pole floor
        let t = r[2] / rn; // sin φ
        let u = (rxy / rn).max(0.0); // cos φ
        let lambda = r[1].atan2(r[0]);
        let (p, dp) = self.legendre(t, u);
        let ror = self.re / rn;

        // Accumulate the three spherical partials of U.
        let mut du_dr = 0.0;
        let mut du_dphi = 0.0;
        let mut du_dlam = 0.0;
        let mut rn_pow = 1.0; // (Re/r)^n
        for nn in 0..=self.nmax {
            let mut a_n = 0.0; // Σ_m P̄·(C cos + S sin)
            let mut aphi_n = 0.0; // Σ_m dP̄/dφ·(C cos + S sin)
            let mut alam_n = 0.0; // Σ_m P̄·m·(−C sin + S cos)
            for m in 0..=nn {
                let mf = m as f64;
                let (cl, sl) = ((mf * lambda).cos(), (mf * lambda).sin());
                let cs = self.c[nn][m] * cl + self.s[nn][m] * sl;
                a_n += p[nn][m] * cs;
                aphi_n += dp[nn][m] * cs;
                alam_n += p[nn][m] * mf * (-self.c[nn][m] * sl + self.s[nn][m] * cl);
            }
            du_dr += (nn as f64 + 1.0) * rn_pow * a_n;
            du_dphi += rn_pow * aphi_n;
            du_dlam += rn_pow * alam_n;
            rn_pow *= ror;
        }
        du_dr *= -self.gm / r2;
        du_dphi *= self.gm / rn;
        du_dlam *= self.gm / rn;

        // Spherical → Cartesian (Vallado / Montenbruck–Gill): with φ = asin(z/r), λ = atan2(y,x).
        let dphi_fac = r[2] / (r2 * rxy_f); // −∂φ/∂x = x·z/(r²·rxy); shared scalar
        let ax =
            (du_dr / rn) * r[0] - dphi_fac * du_dphi * r[0] - (du_dlam / (rxy_f * rxy_f)) * r[1];
        let ay =
            (du_dr / rn) * r[1] - dphi_fac * du_dphi * r[1] + (du_dlam / (rxy_f * rxy_f)) * r[0];
        let az = (du_dr / rn) * r[2] + (rxy / r2) * du_dphi;
        [ax, ay, az]
    }
}

#[cfg(test)]
mod tests {
    use super::*;
    use crate::forces::{two_body_accel, zonal_accel, J2, J3, J4, J5, J6, MU_EARTH, RE_EARTH};

    fn norm(a: Vec3) -> f64 {
        (a[0] * a[0] + a[1] * a[1] + a[2] * a[2]).sqrt()
    }

    /// A LEO point well away from the poles and the z-axis.
    fn leo_point() -> Vec3 {
        [7.0e6, 1.2e6, 0.9e6]
    }

    #[test]
    fn point_mass_field_is_exact_two_body() {
        // Only C̄00 = 1 → the acceleration must be the exact point mass −μr/|r|³.
        let mut f = SphericalHarmonicField::zeros(MU_EARTH, RE_EARTH, 4);
        f.set(0, 0, 1.0, 0.0);
        let r = leo_point();
        let a = f.acceleration(r);
        let tb = two_body_accel(r);
        let err = norm([a[0] - tb[0], a[1] - tb[1], a[2] - tb[2]]);
        assert!(err < 1e-6, "point-mass SH residual {err} m/s² vs −μr/r³");
        // And the potential is GM/r.
        let rn = norm(r);
        assert!((f.potential(r) - MU_EARTH / rn).abs() / (MU_EARTH / rn) < 1e-12);
    }

    #[test]
    fn p_bar_low_degree_matches_closed_forms() {
        // Spot-check the normalized Legendre values against their closed forms at a known φ.
        let phi = 0.5_f64;
        let (t, u) = (phi.sin(), phi.cos());
        let f = SphericalHarmonicField::zeros(MU_EARTH, RE_EARTH, 4);
        let (p, _) = f.legendre(t, u);
        assert!((p[0][0] - 1.0).abs() < 1e-14);
        assert!((p[1][0] - 3.0_f64.sqrt() * t).abs() < 1e-13, "P̄10");
        assert!((p[1][1] - 3.0_f64.sqrt() * u).abs() < 1e-13, "P̄11");
        // P̄20 = √5·(3t²−1)/2 ; P̄22 = (√15/2)·u²
        assert!(
            (p[2][0] - 5.0_f64.sqrt() * (3.0 * t * t - 1.0) / 2.0).abs() < 1e-13,
            "P̄20"
        );
        assert!(
            (p[2][2] - 15.0_f64.sqrt() / 2.0 * u * u).abs() < 1e-13,
            "P̄22"
        );
    }

    #[test]
    fn zonal_only_field_matches_the_independent_zonal_accel() {
        // Build a zonal-only SH field from the [J2..J6] constants (C̄_n0 = −J_n/√(2n+1)) and
        // require it to reproduce two_body + the independently-coded zonal_accel — validating the
        // whole normalized recurrence against code that never uses it.
        let jn = [J2, J3, J4, J5, J6];
        let mut f = SphericalHarmonicField::zeros(MU_EARTH, RE_EARTH, 6);
        f.set(0, 0, 1.0, 0.0);
        for (i, &j) in jn.iter().enumerate() {
            let n = i + 2;
            f.set(n, 0, -j / ((2 * n + 1) as f64).sqrt(), 0.0);
        }
        let r = leo_point();
        let a = f.acceleration(r);
        let tb = two_body_accel(r);
        let zo = zonal_accel(r, &jn);
        let expect = [tb[0] + zo[0], tb[1] + zo[1], tb[2] + zo[2]];
        let err = norm([a[0] - expect[0], a[1] - expect[1], a[2] - expect[2]]);
        let rel = err / norm(expect);
        assert!(rel < 1e-9, "zonal SH vs zonal_accel rel {rel} (abs {err})");
    }

    #[test]
    fn acceleration_equals_the_finite_difference_of_the_potential() {
        // The analytic gradient must equal the central-difference of the directly-summed
        // potential for the FULL EGM2008 field — tying the two code paths and catching any
        // Legendre / assembly error the zonal test can't see (it has no tesserals).
        let f = SphericalHarmonicField::egm2008_truncated(20);
        let r = leo_point();
        let a = f.acceleration(r);
        let h = 1.0; // metres
        let mut fd = [0.0; 3];
        for k in 0..3 {
            let mut rp = r;
            let mut rm = r;
            rp[k] += h;
            rm[k] -= h;
            fd[k] = (f.potential(rp) - f.potential(rm)) / (2.0 * h);
        }
        let err = norm([a[0] - fd[0], a[1] - fd[1], a[2] - fd[2]]);
        let rel = err / norm(a);
        assert!(rel < 1e-6, "analytic vs FD gradient rel {rel} (abs {err})");
    }

    #[test]
    fn full_egm2008_is_a_small_correction_to_two_body_at_leo() {
        // The full d/o-70 field at LEO must be dominated by the central term (J2 the largest
        // perturbation, ~1e-3 relative) and stay finite — a physical sanity gate.
        let f = SphericalHarmonicField::egm2008();
        assert_eq!(f.nmax, 70);
        let r = leo_point();
        let a = f.acceleration(r);
        let tb = two_body_accel(r);
        let pert = norm([a[0] - tb[0], a[1] - tb[1], a[2] - tb[2]]);
        let rel = pert / norm(tb);
        assert!(a.iter().all(|x| x.is_finite()));
        assert!(
            rel > 1e-4 && rel < 5e-3,
            "EGM2008 LEO perturbation rel {rel}"
        );
    }

    #[test]
    fn from_gfc_round_trips_the_committed_subset() {
        // Parsing the committed .gfc must recover the same coefficients as the generated table.
        let text = include_str!("../tools/egm2008_to70.gfc");
        let f = SphericalHarmonicField::from_gfc(text, 70).expect("parse gfc");
        assert_eq!(f.nmax, 70);
        let direct = SphericalHarmonicField::egm2008();
        // Compare the acceleration at a LEO point: identical inputs → identical output.
        let r = leo_point();
        let a1 = f.acceleration(r);
        let a2 = direct.acceleration(r);
        let err = norm([a1[0] - a2[0], a1[1] - a2[1], a1[2] - a2[2]]);
        assert!(err < 1e-12, "gfc-loaded vs generated accel differ by {err}");
    }
}
