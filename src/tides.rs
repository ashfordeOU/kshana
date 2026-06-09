// SPDX-License-Identifier: Apache-2.0
//! Solid Earth tides on the geopotential (IERS Conventions 2010, Chapter 6).
//!
//! The tide-generating potential of the Moon and Sun deforms the Earth, and that deformation
//! perturbs the external gravity field. IERS models this as time-varying corrections ΔC̄_nm,
//! ΔS̄_nm to the fully-normalized Stokes coefficients of the conventional geopotential. This
//! module implements **Step 1** (the frequency-independent part, [IERS Eq. 6.6]) for the
//! degree-2 and degree-3 tides using the anelastic nominal Love numbers of Table 6.3, together
//! with the **permanent (zero-frequency) tide** on C̄₂₀ ([Eq. 6.14]).
//!
//! The corrections are summed into a [`crate::gravity_sh::SphericalHarmonicField`] before the
//! usual spherical-harmonic synthesis, so the tide is just a time-dependent nudge to the same
//! coefficients the static field already uses. Validated against published IERS reference
//! numbers (the permanent-tide value and the K1 worked example) in `tests/tides_iers.rs` — see
//! `tests/fixtures/tides/IERS-CH6-REFERENCE.md`.
//!
//! Frequency-dependent Step-2 corrections, the ocean tide, and the atmospheric tide are added
//! in companion functions; Step 1 is the dominant solid-tide contribution.

use crate::cio::earth_rotation_angle;
use crate::egm2008_data::{EGM2008_GM, EGM2008_RE};
use crate::ephem::{moon_position, sun_position};
use crate::fes2004_data::FES2004;
use crate::forces::{MU_MOON, MU_SUN};
use crate::nutation::delaunay_args;
use std::collections::BTreeMap;

/// A perturbation to the fully-normalized Stokes coefficients (C̄_nm, S̄_nm) of degree `n`,
/// order `m`. Additive: several tide contributions on the same (n,m) sum.
#[derive(Debug, Clone, Copy, PartialEq)]
pub struct StokesDelta {
    pub n: usize,
    pub m: usize,
    pub dc: f64,
    pub ds: f64,
}

// IERS Table 6.3 — anelastic nominal solid-tide Love numbers (Re, Im). k₂₀ is real (no closed
// expression for the Im contribution to ΔC̄₂₀); degree-3 values are real.
const K20: (f64, f64) = (0.30190, 0.0);
const K21: (f64, f64) = (0.29830, -0.00144);
// 0.30102 is the IERS k₂₂ Love number, not log₁₀(2) (≈0.30103) — silence the look-alike lint.
#[allow(clippy::approx_constant)]
const K22: (f64, f64) = (0.30102, -0.00130);
const K30: f64 = 0.093;
const K31: f64 = 0.093;
const K32: f64 = 0.093;
const K33: f64 = 0.094;

// Permanent-tide constants (IERS Eq. 6.8c, 6.14).
const A0: f64 = 4.4228e-8; // m⁻¹
const H0: f64 = -0.31460; // m, Cartwright–Tayler amplitude of the permanent tide

/// IERS Eq. 6.14 permanent (zero-frequency, time-independent) contribution to C̄₂₀:
/// `ΔC̄₂₀^perm = A₀·H₀·k₂₀`. For a "zero-tide" geopotential (EGM2008) this permanent part is
/// already folded into the static C̄₂₀; restoring it is Step 3 of the IERS three-step procedure.
pub fn permanent_tide_c20() -> f64 {
    A0 * H0 * K20.0
}

/// Fully-normalized associated Legendre function `P̄_nm(u)`, `u = sin φ`, for `n ∈ {2,3}`
/// (4π / geodesy normalization, no Condon–Shortley phase) — `N_nm·P_nm` with
/// `N_nm = √[(n−m)!(2n+1)(2−δ₀ₘ)/(n+m)!]`. Closed forms, an independent code path from the
/// general recurrence in [`crate::gravity_sh`].
pub fn pbar(n: usize, m: usize, u: f64) -> f64 {
    let w = (1.0 - u * u).max(0.0).sqrt(); // cos φ ≥ 0
    match (n, m) {
        (2, 0) => 5.0_f64.sqrt() * (3.0 * u * u - 1.0) / 2.0,
        (2, 1) => 15.0_f64.sqrt() * u * w,
        (2, 2) => 15.0_f64.sqrt() / 2.0 * (1.0 - u * u),
        (3, 0) => 7.0_f64.sqrt() * (5.0 * u * u * u - 3.0 * u) / 2.0,
        (3, 1) => (7.0_f64 / 6.0).sqrt() * 1.5 * (5.0 * u * u - 1.0) * w,
        (3, 2) => (7.0_f64 / 60.0).sqrt() * 15.0 * u * (1.0 - u * u),
        (3, 3) => (7.0_f64 / 360.0).sqrt() * 15.0 * w * w * w,
        _ => 0.0,
    }
}

fn love(n: usize, m: usize) -> (f64, f64) {
    match (n, m) {
        (2, 0) => K20,
        (2, 1) => K21,
        (2, 2) => K22,
        (3, 0) => (K30, 0.0),
        (3, 1) => (K31, 0.0),
        (3, 2) => (K32, 0.0),
        (3, 3) => (K33, 0.0),
        _ => (0.0, 0.0),
    }
}

/// Solid Earth tide, **Step 2** — the contribution of a single tidal constituent `f` to the
/// degree-2 order-`m` coefficients (IERS Eq. 6.8b):
/// `ΔC̄₂ₘ − i·ΔS̄₂ₘ = η_m · (A_m · δk_f · H_f) · e^(i θ_f)`, with `η₁ = −i`, `η₂ = 1`.
///
/// `a_m` is the band amplitude (`A₀` for m=0, `A_m` for m=1,2; Eq. 6.8c/d), `dk_re`/`dk_im`
/// the real/imaginary parts of the constituent's `δk_f`, `h_f` its Cartwright–Tayler amplitude,
/// and `theta_f` its Doodson argument. Returns `(ΔC̄₂ₘ, ΔS̄₂ₘ)`. Validated bit-for-bit against
/// the IERS K1 worked example (`tests/tides_iers.rs`).
pub fn step2_constituent(
    m: usize,
    a_m: f64,
    dk_re: f64,
    dk_im: f64,
    h_f: f64,
    theta_f: f64,
) -> (f64, f64) {
    let amp = a_m * h_f;
    let (tr, ti) = (amp * dk_re, amp * dk_im); // A_m·δk_f·H_f (complex)
    let (s, c) = theta_f.sin_cos();
    // (tr + i·ti)·e^(iθ) = pr + i·pi
    let pr = tr * c - ti * s;
    let pi = tr * s + ti * c;
    match m {
        // η₁ = −i : (−i)(pr+i·pi) = pi − i·pr → ΔC̄ = pi, ΔS̄ = pr
        1 => (pi, pr),
        // η₂ = 1 : (pr+i·pi) → ΔC̄ = pr, ΔS̄ = −pi
        2 => (pr, -pi),
        _ => (0.0, 0.0),
    }
}

/// Solid Earth tide, **Step 1** (frequency-independent), IERS Eq. 6.6:
///
/// `ΔC̄_nm − i·ΔS̄_nm = (k_nm/(2n+1)) · Σ_{j∈{Moon,Sun}} (GM_j/GM_⊕)·(R_e/r_j)^(n+1)·P̄_nm(sin Φ_j)·e^(−i m λ_j)`
///
/// for `n = 2, 3` and all `m`, using the anelastic nominal Love numbers. The Moon/Sun positions
/// come from the built-in low-precision ephemeris (ample for the tide perturbation); the
/// body-fixed longitude uses the Earth-rotation angle as `θ_g` (the UT1−TT difference is
/// negligible at this perturbation level). Geocentric latitude is rotation-invariant.
///
/// Returns the seven degree-2/3 corrections; combine with [`permanent_tide_c20`] and the
/// Step-2 / ocean / atmospheric contributions before applying to a field.
pub fn solid_earth_tide_step1(jd_tt: f64) -> Vec<StokesDelta> {
    let t_jc = (jd_tt - 2_451_545.0) / 36525.0;
    let theta_g = earth_rotation_angle(jd_tt);
    let bodies = [(sun_position(t_jc), MU_SUN), (moon_position(t_jc), MU_MOON)];
    // (sin φ, λ, r, GM) per body.
    let geo: Vec<(f64, f64, f64, f64)> = bodies
        .iter()
        .map(|&(p, mu)| {
            let r = (p[0] * p[0] + p[1] * p[1] + p[2] * p[2]).sqrt();
            let sinphi = p[2] / r;
            let lambda = p[1].atan2(p[0]) - theta_g;
            (sinphi, lambda, r, mu)
        })
        .collect();

    let mut out = Vec::new();
    for (n, mmax) in [(2usize, 2usize), (3, 3)] {
        for m in 0..=mmax {
            let (kr, ki) = love(n, m);
            let mut sum_cos = 0.0;
            let mut sum_sin = 0.0;
            for &(sinphi, lambda, r, mu) in &geo {
                let g =
                    (mu / EGM2008_GM) * (EGM2008_RE / r).powi((n + 1) as i32) * pbar(n, m, sinphi);
                let ml = m as f64 * lambda;
                sum_cos += g * ml.cos();
                sum_sin += g * ml.sin();
            }
            let f = 1.0 / (2.0 * n as f64 + 1.0);
            // (kr + i·ki)·(cos − i·sin): ΔC̄ = f·(kr·Σcos + ki·Σsin), ΔS̄ = f·(kr·Σsin − ki·Σcos).
            let dc = f * (kr * sum_cos + ki * sum_sin);
            let ds = f * (kr * sum_sin - ki * sum_cos);
            out.push(StokesDelta { n, m, dc, ds });
        }
    }
    out
}

/// Doodson fundamental arguments `(τ, s, h, p, N′, ps)` in radians at `jd_tt`, derived from the
/// Delaunay arguments and the Earth-rotation angle: `s` = Moon mean longitude (`F+Ω`), `h` = Sun
/// mean longitude (`s−D`), `p` = lunar perigee (`s−l`), `N′ = −Ω`, `ps` = solar perigee (`h−l′`),
/// and `τ = (θ_g+π) − s` is mean lunar time. These are the arguments the FES2004 Doodson
/// multipliers act on.
pub fn doodson_args(jd_tt: f64) -> [f64; 6] {
    let [l, lp, f, d, om] = delaunay_args(jd_tt);
    let theta_g = earth_rotation_angle(jd_tt);
    let s = f + om;
    let h = s - d;
    let p = s - l;
    let np = -om;
    let ps = h - lp;
    let tau = (theta_g + std::f64::consts::PI) - s;
    [tau, s, h, p, np, ps]
}

/// The Doodson argument `θ_f = Σ_i mult_i · arg_i` (radians) of a tidal constituent.
pub fn doodson_phase(mult: &[i8; 6], args: &[f64; 6]) -> f64 {
    mult.iter().zip(args).map(|(&k, &a)| k as f64 * a).sum()
}

/// Ocean tide variations in the normalized Stokes coefficients, IERS Eq. 6.15, from the FES2004
/// model truncated to the 8 dominant constituents (M2 S2 N2 K2 K1 O1 P1 Q1, degree n ≤ 4):
///
/// `[ΔC̄_nm − i·ΔS̄_nm](t) = Σ_f Σ_± (C̄±_f,nm ∓ i·S̄±_f,nm)·e^(±iθ_f)`
///
/// which, with real prograde/retrograde coefficients, expands to
/// `ΔC̄ = (C⁺+C⁻)cos θ_f + (S⁺+S⁻)sin θ_f` and `ΔS̄ = (C⁻−C⁺)sin θ_f + (S⁺−S⁻)cos θ_f`,
/// summed over constituents. The committed FES2004 coefficients are in units of 1e-11.
pub fn ocean_tide(jd_tt: f64) -> Vec<StokesDelta> {
    let args = doodson_args(jd_tt);
    let mut acc: BTreeMap<(usize, usize), (f64, f64)> = BTreeMap::new();
    for &(mult, n, m, cp, sp, cm, sm) in FES2004 {
        let theta = doodson_phase(&mult, &args);
        let (sin_t, cos_t) = theta.sin_cos();
        let dc = ((cp + cm) * cos_t + (sp + sm) * sin_t) * 1e-11;
        let ds = ((cm - cp) * sin_t + (sp - sm) * cos_t) * 1e-11;
        let e = acc.entry((n as usize, m as usize)).or_insert((0.0, 0.0));
        e.0 += dc;
        e.1 += ds;
    }
    acc.into_iter()
        .map(|((n, m), (dc, ds))| StokesDelta { n, m, dc, ds })
        .collect()
}

#[cfg(test)]
mod tests {
    use super::*;

    /// The K1 ocean-tide constituent (Doodson 165.555 → multipliers [1,1,0,0,0,0]) has argument
    /// `θ = τ + s = (θ_g+π−s) + s = θ_g+π` — the same convention as the solid-tide K1 worked
    /// example. Validates the Doodson-argument machinery against a known phase.
    #[test]
    fn doodson_k1_phase_is_theta_g_plus_pi() {
        let jd = 2_453_736.5;
        let got = doodson_phase(&[1, 1, 0, 0, 0, 0], &doodson_args(jd));
        let want = earth_rotation_angle(jd) + std::f64::consts::PI;
        let two_pi = 2.0 * std::f64::consts::PI;
        let d = (got - want).rem_euclid(two_pi);
        let d = d.min(two_pi - d);
        assert!(
            d < 1e-9,
            "K1 Doodson phase {got} vs θ_g+π {want} (wrapped diff {d})"
        );
    }

    /// Data integrity: the generated FES2004 table carries the M2 (n=2,m=2) coefficients verbatim
    /// from the IERS source file (×1e-11), with the M2 Doodson multipliers [2,0,0,0,0,0].
    #[test]
    fn fes2004_m2_22_matches_source() {
        let &(_, _, _, cp, sp, cm, sm) = FES2004
            .iter()
            .find(|&&(mult, n, m, ..)| mult == [2, 0, 0, 0, 0, 0] && n == 2 && m == 2)
            .expect("M2 (2,2) present");
        assert_eq!((cp, sp, cm, sm), (-39.36214, 46.75729, 9.57270, 5.24459));
    }
}
