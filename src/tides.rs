// SPDX-License-Identifier: AGPL-3.0-only
//! Solid Earth, ocean, and atmospheric tides on the geopotential (IERS Conventions 2010, Ch.6).
//!
//! The tide-generating potential of the Moon and Sun deforms the solid Earth and its oceans and
//! atmosphere, and that deformation perturbs the external gravity field. IERS models this as
//! time-varying corrections ΔC̄_nm, ΔS̄_nm to the fully-normalized Stokes coefficients. This module
//! provides:
//! - the **solid Earth tide**: Step 1 (frequency-independent, [Eq. 6.6], degree 2–3, anelastic
//!   Love numbers), the Step-2 constituent mechanism ([Eq. 6.8b]), and the **permanent tide** on
//!   C̄₂₀ ([Eq. 6.14]);
//! - the **ocean tide** ([Eq. 6.15]) from the FES2004 model, 8 dominant constituents;
//! - the **atmospheric S2 tide** from the Ray (2001) air-tide harmonics;
//! - [`tidal_acceleration`], which combines them (permanent tide removed) into the ECI perturbing
//!   acceleration the propagator's [`crate::propagator::ForceModel`] adds.
//!
//! Validated in `tests/tides_iers.rs` against published IERS reference numbers — the permanent
//! tide, the K1 worked example (bit-for-bit), and the FES2004 / Ray source coefficients — see
//! `tests/fixtures/tides/IERS-CH6-REFERENCE.md`.

use crate::cio::earth_rotation_angle;
use crate::egm2008_data::{EGM2008_GM, EGM2008_RE};
use crate::ephem::{moon_position, sun_position};
use crate::fes2004_data::FES2004;
use crate::forces::{MU_MOON, MU_SUN};
use crate::gravity_sh::SphericalHarmonicField;
use crate::nutation::delaunay_args;
use std::collections::BTreeMap;

type Vec3 = [f64; 3];

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

/// One Ray (2001) S2 air-tide row: (n, m, D⁺, ψ⁺, D⁻, ψ⁻); amplitudes in microbars, phases in
/// degrees, prograde (⁺) / retrograde (⁻).
type S2AirRow = (u8, u8, f64, f64, f64, f64);

// Ray (2001) S2 atmospheric pressure-tide spherical harmonics, n ≤ 4. Source: R. D. Ray, J.
// Atmos. Solar-Terr. Phys. 63, 1085 (2001); NASA GSFC ggfc/tides/harm_s2air_ray01.html. Mirrored
// in tools/s2air_ray2001.dat. m=0 has no retrograde wave.
static S2_AIR: &[S2AirRow] = &[
    (2, 0, 51.79, 324.08, 0.0, 0.0),
    (2, 1, 4.08, 200.38, 20.79, 49.41),
    (2, 2, 365.07, 292.85, 6.21, 292.80),
    (3, 0, 36.41, 341.75, 0.0, 0.0),
    (3, 1, 2.32, 230.91, 6.35, 245.30),
    (3, 2, 7.80, 22.93, 3.54, 296.31),
    (3, 3, 3.75, 18.18, 1.01, 288.25),
    (4, 0, 16.60, 91.68, 0.0, 0.0),
    (4, 1, 2.80, 327.47, 3.10, 239.41),
    (4, 2, 16.43, 118.97, 2.33, 127.63),
    (4, 3, 0.40, 26.49, 0.51, 338.93),
    (4, 4, 0.15, 91.20, 0.07, 227.75),
];

/// S2 (principal solar semidiurnal) Doodson number 273.555 → fundamental-argument multipliers.
const S2_DOODSON: [i8; 6] = [2, 2, -2, 0, 0, 0];

/// Load Love numbers `k′_n` (IERS Conventions 2010, Eq. 6.21 surrounding text), for the
/// surface-load deformation of degrees 2–4.
fn load_love(n: usize) -> f64 {
    match n {
        2 => -0.3075,
        3 => -0.195,
        4 => -0.132,
        _ => 0.0,
    }
}

/// Full normalisation factor `N_nm = √((2 − δ_m0)(2n + 1)(n − m)!/(n + m)!)` relating an
/// unnormalised Legendre coefficient to its fully-normalised counterpart (`C̄ = C / N`).
fn full_norm(n: usize, m: usize) -> f64 {
    let fact = |k: usize| (1..=k).fold(1.0_f64, |a, i| a * i as f64);
    let dm = if m == 0 { 1.0 } else { 2.0 };
    (dm * (2 * n + 1) as f64 * fact(n - m) / fact(n + m)).sqrt()
}

/// One Ray (2001) S2 wave in the IERS form used by [`atmospheric_tide`]: degree `n`, order `m`,
/// `prograde` (else retrograde), the fully-normalised pressure amplitude (µbar) and the sine-lead
/// phase `ε` (degrees, IERS Eq. 6.20).
#[derive(Clone, Copy, Debug, PartialEq)]
pub struct S2AirWave {
    /// Degree.
    pub n: usize,
    /// Order.
    pub m: usize,
    /// `true` for the prograde wave, `false` for the retrograde one.
    pub prograde: bool,
    /// Fully-normalised pressure amplitude (µbar): Ray's unnormalised `D` divided by `N_nm`.
    pub amplitude_ubar: f64,
    /// Sine-lead phase `ε = 90° − ψ` (degrees), from Ray's cosine phase lag `ψ`.
    pub epsilon_deg: f64,
}

/// Ray (2001)'s S2 air-tide waves converted to the IERS convention: amplitudes divided by the full
/// normalisation `N_nm` (Ray expands in unnormalised `P_nm`) and phases `ε = 90° − ψ` (Ray gives
/// the Greenwich lag of a cosine; IERS Eq. 6.20 takes the lead of a sine). This reproduces model A2
/// of Biancale & Bode (2006), GFZ STR06/01, Table 5, which is Ray's model in fully-normalised,
/// sine-lead form. Waves with zero amplitude (no retrograde wave at `m = 0`) are omitted.
pub fn s2_air_waves() -> Vec<S2AirWave> {
    let mut out = Vec::new();
    for &(n8, m8, dp, psp, dm, psm) in S2_AIR {
        let (n, m) = (n8 as usize, m8 as usize);
        let nf = full_norm(n, m);
        for (prograde, d, psi) in [(true, dp, psp), (false, dm, psm)] {
            if d != 0.0 {
                out.push(S2AirWave {
                    n,
                    m,
                    prograde,
                    amplitude_ubar: d / nf,
                    epsilon_deg: (90.0 - psi).rem_euclid(360.0),
                });
            }
        }
    }
    out
}

/// Atmospheric **S2 thermal tide** on the geopotential: the Ray (2001) S2 air-tide pressure
/// harmonics converted to normalized Stokes coefficients via the standard surface-load formula
/// (IERS Eq. 6.21 with the atmospheric surface density `σ = Δp/g`):
/// `ΔC̄_nm = (4πG/g²)·((1+k′_n)/(2n+1))·Δp̄_nm`, with the amplitude/phase → cos/sin conversion of
/// Eq. 6.20 and the prograde/retrograde combination of Eq. 6.15. The S2 constituent carries
/// Doodson number 273.555. Ray's amplitudes are coefficients of the unnormalised `P_nm` and his
/// phases are cosine lags, so each wave enters as [`s2_air_waves`] gives it (amplitude `/N_nm`,
/// `ε = 90° − ψ`); that form is checked wave by wave against the published fully-normalised model
/// A2 of GFZ STR06/01 Table 5 (`tests/s2_air_tide_gfz_table5.rs`). Before 0.36 the raw `D` and `ψ`
/// were used directly (see `xval/s2-air-tide-fix/`).
pub fn atmospheric_tide(jd_tt: f64) -> Vec<StokesDelta> {
    const G: f64 = 6.674e-11; // m³ kg⁻¹ s⁻²
    const GE: f64 = 9.806_65; // m s⁻²
    const UBAR_TO_PA: f64 = 0.1; // 1 microbar = 0.1 Pa
    let args = doodson_args(jd_tt);
    let (sin_t, cos_t) = doodson_phase(&S2_DOODSON, &args).sin_cos();
    let mut out = Vec::new();
    for &(n8, m8, dp, psp, dm, psm) in S2_AIR {
        let (n, m) = (n8 as usize, m8 as usize);
        let nf = full_norm(n, m);
        // Eq. 6.20 with the normalised amplitude D/N and the sine lead ε = 90° − ψ:
        // C̄ = (D/N)·sin ε = (D/N)·cos ψ,  S̄ = (D/N)·cos ε = (D/N)·sin ψ  (microbars).
        let (cp, sp) = (
            dp / nf * psp.to_radians().cos(),
            dp / nf * psp.to_radians().sin(),
        );
        let (cm, sm) = (
            dm / nf * psm.to_radians().cos(),
            dm / nf * psm.to_radians().sin(),
        );
        // pressure → geopotential surface-load factor (Eq. 6.21 with σ = Δp/g), microbar → Pa
        let fac = (4.0 * std::f64::consts::PI * G / (GE * GE))
            * ((1.0 + load_love(n)) / (2.0 * n as f64 + 1.0))
            * UBAR_TO_PA;
        let dc = fac * ((cp + cm) * cos_t + (sp + sm) * sin_t);
        let ds = fac * ((cm - cp) * sin_t + (sp - sm) * cos_t);
        out.push(StokesDelta { n, m, dc, ds });
    }
    out
}

/// One S1 air-tide row of the Biancale & Bode model N1: (n, m, C [cm of equivalent water
/// height], ε [deg]); fully normalised, prograde, `h = C·sin(θ_S1 + mλ + ε)·P̄_nm(sin φ)`.
type S1AirRow = (u8, u8, f64, f64);

// Atmospheric S1 pressure-tide model N1, annual mean (the 6-hourly ECMWF surface-pressure fit of
// May 1985 to October 2002). Source: R. Biancale and A. Bode, "Mean annual and seasonal
// atmospheric tide models based on 3-hourly and 6-hourly ECMWF surface pressure data",
// Scientific Technical Report STR06/01, GeoForschungsZentrum Potsdam (2006), Table 1, column
// "Model N1" (all 24 rows, values in parentheses included as printed). Convention (ibid. Eqs. 3-4
// and the text after Eq. 6): fully normalised harmonics, amplitudes as equivalent ocean-water
// height (ρ_w = 1025 kg/m³), phases are leads of a sine, measured from the Doodson argument
// with no phase-bias convention. The paper's sources are ECMWF analyses; the Ray & Ponte (2003)
// ECMWF S1 grid is the same data family, but its spherical-harmonic expansion is not printed in
// that paper, so this published expansion is used.
static S1_AIR_N1: &[S1AirRow] = &[
    (0, 0, 0.011, 295.1),
    (1, 0, 0.014, 301.7),
    (2, 0, 0.029, 228.6),
    (3, 0, 0.019, 266.8),
    (1, 1, 0.220, 73.2),
    (2, 1, 0.019, 37.6),
    (3, 1, 0.125, 264.8),
    (4, 1, 0.016, 155.8),
    (2, 2, 0.066, 37.7),
    (3, 2, 0.025, 358.1),
    (4, 2, 0.031, 241.7),
    (5, 2, 0.003, 147.4),
    (3, 3, 0.020, 235.6),
    (4, 3, 0.032, 298.3),
    (5, 3, 0.019, 258.3),
    (6, 3, 0.011, 186.3),
    (4, 4, 0.029, 336.3),
    (5, 4, 0.014, 100.1),
    (6, 4, 0.010, 34.8),
    (7, 4, 0.011, 344.7),
    (5, 5, 0.037, 327.4),
    (6, 5, 0.034, 93.0),
    (7, 5, 0.012, 83.9),
    (8, 5, 0.007, 266.1),
];

/// S1 (radiational solar diurnal) Doodson number 164.556 → fundamental-argument multipliers
/// (IERS Conventions 2010, Table 6.5b).
const S1_DOODSON: [i8; 6] = [1, 1, -1, 0, 0, 1];

/// Highest degree the S1 air tide is evaluated to: the load Love numbers `k′_n` the IERS
/// Conventions 2010 print stop at degree 6 (§6.3.1, after Eq. 6.21), so the four N1 rows of degree
/// 7 and 8 (amplitudes 0.007 to 0.012 cm) are left out rather than given an uncited `k′_n`.
pub const S1_AIR_MAX_DEGREE: usize = 6;

/// Load Love numbers `k′_n`, n = 2..6, IERS Conventions 2010 §6.3.1 (after Eq. 6.21).
fn load_love_iers(n: usize) -> f64 {
    match n {
        2 => -0.3075,
        3 => -0.195,
        4 => -0.132,
        5 => -0.1032,
        6 => -0.0892,
        _ => 0.0,
    }
}

/// Atmospheric **S1 (diurnal) air tide** on the geopotential, as normalized Stokes corrections:
/// the Biancale & Bode (2006) model N1 surface-pressure harmonics (equivalent water height,
/// fully normalised) through the IERS Eq. 6.21 surface-load factor
/// `ΔC̄_nm = (4πGρ_w/g)·((1+k′_n)/(2n+1))·h·sin(θ_S1+ε)`, `ΔS̄_nm = (…)·h·cos(θ_S1+ε)`
/// (the prograde case of Eqs. 6.15 and 6.20 with the source's sine-lead phases, phase bias 0).
/// Degrees 2 to [`S1_AIR_MAX_DEGREE`]: degree 0 (a total-mass term, unphysical for a closed
/// atmosphere) and degree 1 (a geocentre term, absent in the centre-of-mass frame the
/// propagator integrates in) are left out.
///
/// **Opt-in.** It is *not* part of [`tidal_acceleration`] (whose output is unchanged); add
/// [`s1_air_tide_acceleration`], or set the propagator's `ForceModel::air_tide_s1`. It is
/// MODELLED: no third-party geopotential-coefficient oracle exists for the air tide, so it is
/// checked against the source table, its own load-factor closed form, and physical magnitude.
pub fn atmospheric_tide_s1(jd_tt: f64) -> Vec<StokesDelta> {
    const G: f64 = 6.674e-11; // m³ kg⁻¹ s⁻²
    const GE: f64 = 9.806_65; // m s⁻²
    const RHO_W: f64 = 1025.0; // kg m⁻³, the source's and IERS Eq. 6.21's sea-water density
    const CM_TO_M: f64 = 0.01;
    let theta = doodson_phase(&S1_DOODSON, &doodson_args(jd_tt));
    S1_AIR_N1
        .iter()
        .filter(|&&(n, ..)| (2..=S1_AIR_MAX_DEGREE).contains(&(n as usize)))
        .map(|&(n8, m8, c_cm, eps_deg)| {
            let n = n8 as usize;
            let fac = (4.0 * std::f64::consts::PI * G * RHO_W / GE)
                * ((1.0 + load_love_iers(n)) / (2.0 * n as f64 + 1.0))
                * c_cm
                * CM_TO_M;
            let (sa, ca) = (theta + eps_deg.to_radians()).sin_cos();
            StokesDelta {
                n,
                m: m8 as usize,
                dc: fac * sa,
                ds: fac * ca,
            }
        })
        .collect()
}

/// Perturbing acceleration (m/s², ECI) of the opt-in S1 air tide ([`atmospheric_tide_s1`]) at
/// `r_eci` and epoch `jd_tt`, evaluated in the Earth-fixed frame with the same Earth-rotation
/// convention as [`tidal_acceleration`] and rotated back. Add it to `tidal_acceleration` to
/// include S1.
pub fn s1_air_tide_acceleration(r_eci: Vec3, jd_tt: f64) -> Vec3 {
    let theta_g = earth_rotation_angle(jd_tt);
    let r_ecef = rot_eci_to_ecef(theta_g, r_eci);
    let mut field = SphericalHarmonicField::zeros(EGM2008_GM, EGM2008_RE, S1_AIR_MAX_DEGREE);
    for d in atmospheric_tide_s1(jd_tt) {
        field.set(d.n, d.m, d.dc, d.ds);
    }
    rot_ecef_to_eci(theta_g, field.acceleration(r_ecef))
}

/// Rotate an ECI vector into the Earth-fixed frame by the Greenwich sidereal angle `θ_g`
/// (z-axis rotation). The inverse is [`rot_ecef_to_eci`].
fn rot_eci_to_ecef(theta_g: f64, v: Vec3) -> Vec3 {
    let (s, c) = theta_g.sin_cos();
    [c * v[0] + s * v[1], -s * v[0] + c * v[1], v[2]]
}

/// Rotate an Earth-fixed vector back to ECI (transpose of [`rot_eci_to_ecef`]).
fn rot_ecef_to_eci(theta_g: f64, v: Vec3) -> Vec3 {
    let (s, c) = theta_g.sin_cos();
    [c * v[0] - s * v[1], s * v[0] + c * v[1], v[2]]
}

/// Total tidal perturbing acceleration (m/s², ECI) at position `r_eci` and epoch `jd_tt`: the
/// solid Earth tide (Step 1, with the **permanent part removed** so it does not double-count the
/// zero-tide EGM2008 static C̄₂₀) plus the FES2004 ocean tide and the Ray (2001) S2 atmospheric
/// tide. The combined ΔC̄/ΔS̄ corrections are
/// assembled into a degree-≤4 correction field with no central term (C̄₀₀ = 0), evaluated in the
/// Earth-fixed frame, and rotated back to ECI. This is the perturbation to add on top of a
/// zero-tide static gravity field.
pub fn tidal_acceleration(r_eci: Vec3, jd_tt: f64) -> Vec3 {
    let theta_g = earth_rotation_angle(jd_tt);
    let r_ecef = rot_eci_to_ecef(theta_g, r_eci);

    let mut acc: BTreeMap<(usize, usize), (f64, f64)> = BTreeMap::new();
    for d in solid_earth_tide_step1(jd_tt) {
        let e = acc.entry((d.n, d.m)).or_insert((0.0, 0.0));
        e.0 += d.dc;
        e.1 += d.ds;
    }
    // Step 3: the permanent tide is already in the zero-tide static field — remove it.
    if let Some(e) = acc.get_mut(&(2, 0)) {
        e.0 -= permanent_tide_c20();
    }
    for d in ocean_tide(jd_tt) {
        let e = acc.entry((d.n, d.m)).or_insert((0.0, 0.0));
        e.0 += d.dc;
        e.1 += d.ds;
    }
    for d in atmospheric_tide(jd_tt) {
        let e = acc.entry((d.n, d.m)).or_insert((0.0, 0.0));
        e.0 += d.dc;
        e.1 += d.ds;
    }

    let mut field = SphericalHarmonicField::zeros(EGM2008_GM, EGM2008_RE, 4);
    for ((n, m), (dc, ds)) in acc {
        if n >= 2 {
            field.set(n, m, dc, ds);
        }
    }
    let a_ecef = field.acceleration(r_ecef);
    rot_ecef_to_eci(theta_g, a_ecef)
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

    /// The total tidal perturbing acceleration at LEO is finite, sits in the physical band
    /// (~1e-9..1e-6 m/s²), and is a tiny fraction of two-body gravity.
    #[test]
    fn tidal_acceleration_is_physical_at_leo() {
        let r = [7.0e6, 1.0e6, 2.0e6];
        let a = tidal_acceleration(r, 2_453_736.5);
        let mag = (a[0] * a[0] + a[1] * a[1] + a[2] * a[2]).sqrt();
        assert!(mag.is_finite(), "tidal acceleration must be finite");
        assert!(
            (1e-9..1e-6).contains(&mag),
            "tidal accel {mag:e} m/s² outside the physical 1e-9..1e-6 band"
        );
        let rn = (r[0] * r[0] + r[1] * r[1] + r[2] * r[2]).sqrt();
        let two_body = crate::forces::MU_EARTH / (rn * rn);
        assert!(
            mag < 1e-5 * two_body,
            "tide should be << two-body ({mag:e} vs {two_body:e})"
        );
    }

    /// Data integrity: the S1 table is the 24-row model N1 column of Biancale & Bode (2006)
    /// Table 1, with its dominant (1,1) row and the largest kept row (3,1) verbatim.
    #[test]
    fn s1_air_tide_table_matches_biancale_bode_n1() {
        assert_eq!(S1_AIR_N1.len(), 24);
        let row = |n: u8, m: u8| {
            S1_AIR_N1
                .iter()
                .find(|r| r.0 == n && r.1 == m)
                .map(|r| (r.2, r.3))
        };
        assert_eq!(row(1, 1), Some((0.220, 73.2)));
        assert_eq!(row(3, 1), Some((0.125, 264.8)));
        assert_eq!(row(8, 5), Some((0.007, 266.1)));
    }

    /// The S1 argument advances by one cycle per mean solar day (15°/h, IERS Table 6.5b), and
    /// each Stokes pair has the constant modulus of its Eq. 6.21 load factor.
    #[test]
    fn s1_air_tide_is_diurnal_with_its_load_factor_amplitude() {
        let jd = 2_455_197.5;
        let a = atmospheric_tide_s1(jd);
        let b = atmospheric_tide_s1(jd + 0.25);
        let c = atmospheric_tide_s1(jd + 1.0);
        // only degrees 2..=6 kept: 24 rows minus (0,0), (1,0), (1,1) and the 3 of degree ≥ 7
        // ((7,4), (7,5), (8,5))
        assert_eq!(a.len(), 24 - 3 - 3);
        assert!(a.iter().all(|d| (2..=S1_AIR_MAX_DEGREE).contains(&d.n)));
        for ((x, y), z) in a.iter().zip(&b).zip(&c) {
            let amp = |d: &StokesDelta| d.dc.hypot(d.ds);
            assert!((amp(x) - amp(y)).abs() < 1e-24 && (amp(x) - amp(z)).abs() < 1e-24);
            // one solar day later the phase is back (to the slow drift of p_s and h)
            assert!((x.dc - z.dc).abs() < 1e-3 * amp(x), "{x:?} vs {z:?}");
            // a quarter day later it has turned by 90°: with dc = A·sin(θ+ε), ds = A·cos(θ+ε),
            // the new dc is the old ds and the new ds is minus the old dc
            assert!((y.dc - x.ds).abs() < 1e-2 * amp(x), "{x:?} vs {y:?}");
            assert!((y.ds + x.dc).abs() < 1e-2 * amp(x), "{x:?} vs {y:?}");
            let row = S1_AIR_N1
                .iter()
                .find(|r| r.0 as usize == x.n && r.1 as usize == x.m)
                .expect("row");
            let want = 4.0 * std::f64::consts::PI * 6.674e-11 * 1025.0 / 9.806_65
                * (1.0 + load_love_iers(x.n))
                / (2.0 * x.n as f64 + 1.0)
                * row.2
                * 0.01;
            assert!((amp(x) - want).abs() < 1e-15 * want.max(1e-30) + 1e-25);
        }
    }

    /// The surface pressure the S1 table describes has the physical size of the diurnal
    /// barometric tide (a few tenths of a hectopascal; 1 cm of water ≈ 1.005 hPa), and its
    /// acceleration at LEO is a sub-1e-8 m/s² perturbation far below the S2-led tide total.
    #[test]
    fn s1_air_tide_has_physical_magnitude() {
        // Equatorial amplitude of the (1,1) wave alone: 0.220 cm · P̄11(0) = 0.220·√3 cm.
        let p11 = 0.220 * 3f64.sqrt() * 1025.0 * 9.80 * 0.01 / 100.0; // hPa
        assert!(
            (0.1..2.0).contains(&p11),
            "S1 (1,1) equatorial amplitude {p11} hPa"
        );
        let r = [7.0e6, 1.0e6, 2.0e6];
        let mut worst = 0.0f64;
        for k in 0..24 {
            let a = s1_air_tide_acceleration(r, 2_455_197.5 + k as f64 / 24.0);
            worst = worst.max((a[0] * a[0] + a[1] * a[1] + a[2] * a[2]).sqrt());
        }
        assert!(
            (1e-12..1e-8).contains(&worst),
            "S1 air-tide acceleration {worst:e} m/s² outside 1e-12..1e-8"
        );
    }

    /// Data integrity: the Ray (2001) S2 air-tide table carries the dominant (2,2) prograde term
    /// (365.07 µbar @ 292.85°) and its retrograde companion (6.21 @ 292.80°) verbatim.
    #[test]
    fn s2_air_tide_22_matches_ray2001() {
        let &(_, _, dp, psp, dm, psm) = S2_AIR
            .iter()
            .find(|&&(n, m, ..)| n == 2 && m == 2)
            .expect("S2 air (2,2) present");
        assert_eq!((dp, psp, dm, psm), (365.07, 292.85, 6.21, 292.80));
    }
}
