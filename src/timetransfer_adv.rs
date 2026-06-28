// SPDX-License-Identifier: AGPL-3.0-only
//! Advanced time-and-frequency transfer.
//!
//! [`crate::timetransfer`] models the *stochastic* error of a generic two-way link and
//! [`crate::timegeo`] gives the two geometric closed forms (Sagnac, common-view). This
//! module builds the operational transfer methods on top of them:
//!
//! 1. **TWSTFT** — Two-Way Satellite Time and Frequency Transfer with the BIPM Sagnac
//!    closed form `Δt = 2·A·ω_E/c²` (`A` the equatorial-projected area of the
//!    ground-A → satellite → ground-B loop), a transponder delay, and reciprocal-path
//!    cancellation, emitting a `T_A − T_B` series and its TDEV.
//! 2. **GNSS common-view** — two synthetic ground stations single-differencing the same
//!    satellite; the satellite clock cancels and the inter-station offset is recovered.
//! 3. **PPP time transfer** — the ionosphere-free pseudorange combination and a
//!    receiver-clock solve against an SP3-grade (here synthetic) orbit + clock truth.
//! 4. **Optical (FSO) link** — free-space optical turbulence: Rytov variance, Fried
//!    parameter, and unit-mean log-normal amplitude (scintillation) fading.
//! 5. **IEEE 1139 power-law fit** — a five-coefficient `h_α` least-squares fit of the
//!    Allan-variance curve (all five canonical noise processes simultaneously), plus the
//!    dominant process per τ-decade.
//! 6. **Clock-ensemble timescale** — an inverse-variance-weighted paper timescale whose
//!    Allan deviation is strictly below that of the best contributing clock.
//!
//! Everything here is self-contained: the validation targets are closed forms (Sagnac,
//! iono-free cancellation, the `h_α` basis) and synthetic truth, not imported reference
//! products. A real BIPM Circular-T / IGS SP3 ingest is a follow-on (see `ROADMAP.md`).

use crate::allan::{overlapping_adev, time_deviation, PowerLawNoise};
use crate::timegeo::{sagnac_correction, C_M_PER_S, OMEGA_EARTH};
use crate::types::Seconds;
use rand::{RngCore, SeedableRng};
use rand_chacha::ChaCha8Rng;
use rand_distr::{Distribution, Normal};
use std::f64::consts::PI;

type Vec3 = [f64; 3];

// ───────────────────────────────────────────────────────────────────────────
// 1. TWSTFT — Two-Way Satellite Time and Frequency Transfer
// ───────────────────────────────────────────────────────────────────────────

/// Equatorial-projected signed area (m²) of the triangle `(a, b, c)`.
fn equatorial_triangle_area(a: Vec3, b: Vec3, c: Vec3) -> f64 {
    0.5 * ((b[0] - a[0]) * (c[1] - a[1]) - (c[0] - a[0]) * (b[1] - a[1]))
}

/// TWSTFT Sagnac correction (s) for the closed loop ground-A → satellite → ground-B → A:
/// the sum of the three one-way Sagnac terms. This equals the BIPM closed form
/// `Δt = 2·A·ω_E/c²` exactly, where `A` is the equatorial-projected area of the triangle
/// (`r_a`, `r_s`, `r_b`) — see [`twstft_sagnac_bipm`].
pub fn twstft_sagnac(r_a: Vec3, r_s: Vec3, r_b: Vec3) -> f64 {
    sagnac_correction(r_a, r_s) + sagnac_correction(r_s, r_b) + sagnac_correction(r_b, r_a)
}

/// The BIPM closed form `Δt = 2·A·ω_E/c²` for the same loop, computed independently from
/// the triangle area. Provided so callers (and tests) can cross-check [`twstft_sagnac`].
pub fn twstft_sagnac_bipm(r_a: Vec3, r_s: Vec3, r_b: Vec3) -> f64 {
    let area = equatorial_triangle_area(r_a, r_s, r_b);
    2.0 * area * OMEGA_EARTH / (C_M_PER_S * C_M_PER_S)
}

/// One TWSTFT comparison campaign.
#[derive(Clone, Debug)]
pub struct TwstftScenario {
    /// ECEF position of ground station A (m).
    pub r_a: Vec3,
    /// ECEF position of the relay satellite (m).
    pub r_s: Vec3,
    /// ECEF position of ground station B (m).
    pub r_b: Vec3,
    /// True clock offset `T_A − T_B` (s).
    pub true_offset_s: f64,
    /// One-way transponder + hardware delay (s); reciprocal, cancels in the two-way sum.
    pub transponder_delay_s: f64,
    /// White measurement jitter, 1-σ per exchange (s).
    pub sigma_j: f64,
    /// Exchange interval (s).
    pub step_s: Seconds,
    /// Number of exchanges.
    pub n_steps: usize,
    /// Deterministic seed.
    pub seed: u64,
}

/// Result of a TWSTFT campaign.
#[derive(Clone, Debug)]
pub struct TwstftResult {
    /// Applied geometric Sagnac correction (s).
    pub sagnac_s: f64,
    /// The independent BIPM `2Aω/c²` value (s) for cross-checking.
    pub bipm_sagnac_s: f64,
    /// Mean recovered offset `T_A − T_B` (s) after Sagnac removal.
    pub offset_est_s: f64,
    /// `(τ, TDEV)` curve of the Sagnac-corrected offset residual.
    pub tdev: Vec<(f64, f64)>,
}

/// Run a TWSTFT campaign. The two-way estimate of `T_A − T_B` retains the geometric
/// Sagnac term (the reciprocal path and transponder delays cancel); the campaign removes
/// the closed-form Sagnac and reports the recovered offset and its TDEV.
pub fn run_twstft(scn: &TwstftScenario) -> TwstftResult {
    let sagnac = twstft_sagnac(scn.r_a, scn.r_s, scn.r_b);
    let bipm = twstft_sagnac_bipm(scn.r_a, scn.r_s, scn.r_b);
    // `Normal::new` (rand_distr 0.4) rejects only a non-finite std_dev; a config-supplied
    // `inf`/`nan` `sigma_j` would otherwise panic here, so coerce it to a finite value.
    let sigma_j = if scn.sigma_j.is_finite() {
        scn.sigma_j
    } else {
        f64::MIN_POSITIVE
    };
    let nrm = Normal::new(0.0, sigma_j)
        .expect("sigma_j is finite, which Normal::new always accepts");
    let mut rng = ChaCha8Rng::seed_from_u64(scn.seed);

    // Each exchange: the raw two-way estimate carries the offset minus the loop Sagnac,
    // plus white jitter (the reciprocal transponder/path delays have cancelled). Removing
    // the closed-form Sagnac recovers the offset.
    let mut corrected = Vec::with_capacity(scn.n_steps);
    for _ in 0..scn.n_steps {
        let raw = scn.true_offset_s - sagnac + nrm.sample(&mut rng);
        corrected.push(raw + sagnac);
    }
    let mean = corrected.iter().sum::<f64>() / corrected.len() as f64;

    // TDEV of the recovered-offset series (treated as phase-time samples).
    let mut tdev = Vec::new();
    let mut m = 1usize;
    while corrected.len() >= 3 * m {
        let td = time_deviation(&corrected, scn.step_s, m);
        if td.is_finite() {
            tdev.push(((m as f64) * scn.step_s, td));
        }
        m *= 2;
    }

    TwstftResult {
        sagnac_s: sagnac,
        bipm_sagnac_s: bipm,
        offset_est_s: mean,
        tdev,
    }
}

// ───────────────────────────────────────────────────────────────────────────
// 2. GNSS common-view, two synthetic ground stations
// ───────────────────────────────────────────────────────────────────────────

/// One common-view epoch: each station's pseudorange to the shared satellite and the
/// station's computed geometric range to that satellite (m).
#[derive(Clone, Copy, Debug)]
pub struct CvEpoch {
    /// Pseudorange measured at station A (m).
    pub pr_a: f64,
    /// Geometric range A→satellite (m).
    pub range_a: f64,
    /// Pseudorange measured at station B (m).
    pub pr_b: f64,
    /// Geometric range B→satellite (m).
    pub range_b: f64,
}

/// Common-view inter-station offset series `(clock_A − clock_B)` (s) across epochs. The
/// satellite clock — common to both stations each epoch — cancels exactly.
pub fn gnss_common_view_series(epochs: &[CvEpoch]) -> Vec<f64> {
    epochs
        .iter()
        .map(|e| crate::timegeo::common_view_offset(e.pr_a, e.range_a, e.pr_b, e.range_b))
        .collect()
}

/// TDEV `(τ, TDEV)` curve of a common-view offset series sampled every `step_s`.
pub fn offset_tdev(series: &[f64], step_s: Seconds) -> Vec<(f64, f64)> {
    let mut out = Vec::new();
    let mut m = 1usize;
    while series.len() >= 3 * m {
        let td = time_deviation(series, step_s, m);
        if td.is_finite() {
            out.push(((m as f64) * step_s, td));
        }
        m *= 2;
    }
    out
}

// ───────────────────────────────────────────────────────────────────────────
// 3. PPP — ionosphere-free time transfer
// ───────────────────────────────────────────────────────────────────────────

/// GPS L1 carrier frequency (Hz).
pub const F_L1: f64 = 1_575.42e6;
/// GPS L2 carrier frequency (Hz).
pub const F_L2: f64 = 1_227.60e6;
/// GPS L5 carrier frequency (Hz), IS-GPS-705.
pub const F_L5: f64 = 1_176.45e6;

/// Ionosphere-free pseudorange combination (m):
/// `P_IF = (f1²·P1 − f2²·P2) / (f1² − f2²)`. The first-order ionospheric delay (∝ 1/f²)
/// cancels exactly, leaving geometry + clock + (troposphere) + noise.
pub fn iono_free_combination(p1: f64, p2: f64) -> f64 {
    let f1 = F_L1 * F_L1;
    let f2 = F_L2 * F_L2;
    (f1 * p1 - f2 * p2) / (f1 - f2)
}

/// PPP receiver-clock solve (s): from the iono-free pseudorange, the precise geometric
/// range, and the precise satellite clock (from SP3-grade orbits/clocks), recover the
/// receiver clock offset `dt_rx = (P_IF − range)/c + dt_sat`.
pub fn ppp_receiver_clock(p_if: f64, geom_range: f64, sat_clock_s: f64) -> f64 {
    (p_if - geom_range) / C_M_PER_S + sat_clock_s
}

/// First-order ionospheric group delay (m) on a carrier of frequency `f` (Hz) for a slant
/// TEC of `tec` TECU: `40.3 · 10¹⁶ · TEC / f²`.
pub fn iono_delay_m(tec_tecu: f64, f_hz: f64) -> f64 {
    40.3 * 1.0e16 * tec_tecu / (f_hz * f_hz)
}

// ───────────────────────────────────────────────────────────────────────────
// 4. Optical free-space link — turbulence
// ───────────────────────────────────────────────────────────────────────────

/// Plane-wave Rytov variance `σ_R² = 1.23 · Cn² · k^(7/6) · L^(11/6)` (dimensionless),
/// with `k = 2π/λ`. The weak-turbulence scintillation index ≈ `σ_R²`.
pub fn rytov_variance(cn2: f64, wavelength_m: f64, path_len_m: f64) -> f64 {
    let k = 2.0 * PI / wavelength_m;
    1.23 * cn2 * k.powf(7.0 / 6.0) * path_len_m.powf(11.0 / 6.0)
}

/// Plane-wave Fried parameter `r₀ = (0.423 · k² · Cn² · L)^(−3/5)` (m), the coherence
/// length of the turbulent wavefront.
pub fn fried_parameter(cn2: f64, wavelength_m: f64, path_len_m: f64) -> f64 {
    let k = 2.0 * PI / wavelength_m;
    (0.423 * k * k * cn2 * path_len_m).powf(-3.0 / 5.0)
}

/// A unit-mean log-normal amplitude (scintillation) fading factor for weak turbulence:
/// `I/⟨I⟩ = exp(2χ)` with the log-amplitude `χ ~ N(−σ_χ², σ_χ²)` and `σ_χ² = σ_R²/4`. The
/// mean offset `−σ_χ²` makes `E[I/⟨I⟩] = 1`; the variance is `exp(σ_R²) − 1 ≈ σ_R²`.
pub fn lognormal_fading(sigma_r2: f64, rng: &mut dyn RngCore) -> f64 {
    let sig_chi2 = sigma_r2 / 4.0;
    // `Normal::new` (rand_distr 0.4) rejects only a non-finite std_dev; a negative or
    // `inf` `sigma_r2` would make `sig_chi2.sqrt()` NaN or `inf`, so floor it to a finite,
    // non-negative std_dev. The mean (`-sig_chi2`) is not validated by `Normal::new`.
    let std_dev = {
        let s = sig_chi2.sqrt();
        if s.is_finite() {
            s
        } else {
            0.0
        }
    };
    let nrm = Normal::new(-sig_chi2, std_dev)
        .expect("std_dev is finite and non-negative, which Normal::new always accepts");
    (2.0 * nrm.sample(rng)).exp()
}

// ───────────────────────────────────────────────────────────────────────────
// 5. IEEE 1139 power-law fit (five coefficients)
// ───────────────────────────────────────────────────────────────────────────

/// The five fitted power-law PSD coefficients `S_y(f) = Σ h_α f^α` and the dominant
/// process per τ-decade.
#[derive(Clone, Debug)]
pub struct PowerLawFit {
    /// White PM coefficient `h₂` (α = +2).
    pub h2: f64,
    /// Flicker PM coefficient `h₁` (α = +1).
    pub h1: f64,
    /// White FM coefficient `h₀` (α = 0).
    pub h0: f64,
    /// Flicker FM coefficient `h₋₁` (α = −1).
    pub hm1: f64,
    /// Random-walk FM coefficient `h₋₂` (α = −2).
    pub hm2: f64,
    /// Dominant noise process at the centre of each τ-decade spanned by the data.
    pub dominant_per_decade: Vec<(f64, PowerLawNoise)>,
}

/// The Allan-variance contribution of each canonical noise type per unit `h_α`, evaluated
/// at averaging time `tau` with phase-noise high cutoff `f_h` (Hz). Order:
/// `[h₂, h₁, h₀, h₋₁, h₋₂]`. (NIST SP1065 / IEEE 1139 conversions.)
fn avar_basis(tau: f64, f_h: f64) -> [f64; 5] {
    let fourpi2 = 4.0 * PI * PI;
    [
        3.0 * f_h / (fourpi2 * tau * tau), // WPM
        (1.038 + 3.0 * (2.0 * PI * f_h * tau).ln()) / (fourpi2 * tau * tau), // FPM
        1.0 / (2.0 * tau),                 // WFM
        2.0 * (2.0_f64).ln(),              // FFM
        2.0 * PI * PI * tau / 3.0,         // RWFM
    ]
}

/// Solve the linear system `A·x = b` (square, `n×n`) by Gaussian elimination with partial
/// pivoting. Returns `None` if singular.
fn solve_lin(mut a: Vec<Vec<f64>>, mut b: Vec<f64>) -> Option<Vec<f64>> {
    let n = b.len();
    for col in 0..n {
        let mut piv = col;
        for r in (col + 1)..n {
            if a[r][col].abs() > a[piv][col].abs() {
                piv = r;
            }
        }
        if a[piv][col].abs() < 1e-300 {
            return None;
        }
        a.swap(col, piv);
        b.swap(col, piv);
        let pivot_row = a[col].clone();
        let b_col = b[col];
        let akk = pivot_row[col];
        for r in (col + 1)..n {
            let f = a[r][col] / akk;
            for (slot, &pv) in a[r][col..n].iter_mut().zip(pivot_row[col..n].iter()) {
                *slot -= f * pv;
            }
            b[r] -= f * b_col;
        }
    }
    let mut x = vec![0.0; n];
    for i in (0..n).rev() {
        let mut s = b[i];
        for c in (i + 1)..n {
            s -= a[i][c] * x[c];
        }
        x[i] = s / a[i][i];
    }
    Some(x)
}

/// Fit all five power-law coefficients `h_α` simultaneously to an Allan-deviation curve
/// `(τ, ADEV)` by least squares on the Allan *variance* (`σ_y²`), using `f_h` for the
/// phase-noise basis terms. Returns the coefficients (negatives clamped to zero on report)
/// and the dominant process per τ-decade. Needs at least five points.
pub fn fit_power_law_psd(curve: &[(f64, f64)], f_h: f64) -> Option<PowerLawFit> {
    if curve.len() < 5 {
        return None;
    }
    // Normal equations AᵀA x = Aᵀy with rows = avar_basis(τ_i), y = σ_y²(τ_i).
    let mut ata = vec![vec![0.0; 5]; 5];
    let mut aty = vec![0.0; 5];
    for &(tau, adev) in curve {
        let row = avar_basis(tau, f_h);
        let y = adev * adev;
        for i in 0..5 {
            aty[i] += row[i] * y;
            for j in 0..5 {
                ata[i][j] += row[i] * row[j];
            }
        }
    }
    let h = solve_lin(ata, aty)?;

    // Dominant process per τ-decade: the α whose basis·coefficient term is largest at the
    // decade centre.
    let types = [
        PowerLawNoise::WhitePm,
        PowerLawNoise::FlickerPm,
        PowerLawNoise::WhiteFm,
        PowerLawNoise::FlickerFm,
        PowerLawNoise::RandomWalkFm,
    ];
    let tau_min = curve.iter().map(|p| p.0).fold(f64::INFINITY, f64::min);
    let tau_max = curve.iter().map(|p| p.0).fold(0.0_f64, f64::max);
    let dec_lo = tau_min.log10().floor() as i32;
    let dec_hi = tau_max.log10().floor() as i32;
    let mut dominant = Vec::new();
    for d in dec_lo..=dec_hi {
        let tau_c = 10f64.powi(d) * (10f64).sqrt(); // geometric centre of the decade
        let basis = avar_basis(tau_c, f_h);
        let mut best = 0usize;
        let mut best_val = f64::NEG_INFINITY;
        for i in 0..5 {
            let contrib = (h[i].max(0.0)) * basis[i];
            if contrib > best_val {
                best_val = contrib;
                best = i;
            }
        }
        dominant.push((tau_c, types[best]));
    }

    Some(PowerLawFit {
        h2: h[0],
        h1: h[1],
        h0: h[2],
        hm1: h[3],
        hm2: h[4],
        dominant_per_decade: dominant,
    })
}

// ───────────────────────────────────────────────────────────────────────────
// 6. Clock-ensemble timescale (paper time)
// ───────────────────────────────────────────────────────────────────────────

/// Inverse-variance-weighted ensemble (paper) timescale phase series from `n` clock phase
/// series and per-clock weights `w_j ∝ 1/σ_j²`. With independent clocks this is the
/// minimum-variance combination, so its Allan deviation falls below the best single clock.
pub fn ensemble_timescale(clocks: &[Vec<f64>], weights: &[f64]) -> Vec<f64> {
    assert_eq!(clocks.len(), weights.len());
    assert!(!clocks.is_empty());
    let len = clocks[0].len();
    let wsum: f64 = weights.iter().sum();
    (0..len)
        .map(|k| {
            clocks
                .iter()
                .zip(weights)
                .map(|(c, &w)| w * c[k])
                .sum::<f64>()
                / wsum
        })
        .collect()
}

/// Overlapping ADEV at the base averaging time `τ₀` of a phase series (convenience for
/// comparing the ensemble against individual clocks).
pub fn adev_tau0(phase: &[f64], tau0: Seconds) -> f64 {
    overlapping_adev(phase, tau0, 1)
}

#[cfg(test)]
mod tests {
    use super::*;

    const RE: f64 = 6_378_137.0;
    const GEO: f64 = 4.2164e7;

    // ── 1. TWSTFT ──────────────────────────────────────────────────────────

    #[test]
    fn twstft_sagnac_equals_the_bipm_2a_omega_over_c2_form() {
        // Three equatorial points; the loop sum must equal 2·A·ω/c² exactly.
        let a = [RE, 0.0, 0.0];
        let s = [GEO * 0.5, GEO * 0.866_025_403_8, 0.0]; // 60° longitude
        let b = [RE * 0.5, RE * 0.866_025_403_8, 0.0]; // station 60° east
        let loop_sum = twstft_sagnac(a, s, b);
        let bipm = twstft_sagnac_bipm(a, s, b);
        assert!(
            (loop_sum - bipm).abs() < 1e-18,
            "loop {loop_sum} vs BIPM {bipm}"
        );
    }

    #[test]
    fn twstft_sagnac_within_5pct_for_a_continental_baseline() {
        // A realistic Europe-style baseline via a GEO relay: loop and BIPM agree far
        // tighter than the 5% the milestone asks for.
        let a = [RE * 0.7, RE * 0.7, 0.0];
        let s = [GEO * 0.2, GEO * 0.97, 0.0];
        let b = [RE * 0.4, RE * 0.9, 0.0];
        let loop_sum = twstft_sagnac(a, s, b);
        let bipm = twstft_sagnac_bipm(a, s, b);
        assert!(bipm.abs() > 1e-9, "Sagnac should be tens of ns: {bipm}");
        assert!((loop_sum - bipm).abs() / bipm.abs() < 0.05);
    }

    #[test]
    fn twstft_sagnac_is_zero_for_a_degenerate_radial_loop() {
        // All three points along +x: no enclosed equatorial area ⇒ no Sagnac.
        let z = twstft_sagnac([RE, 0.0, 0.0], [2.0 * RE, 0.0, 0.0], [3.0 * RE, 0.0, 0.0]);
        assert!(z.abs() < 1e-20, "z = {z}");
    }

    #[test]
    fn twstft_campaign_recovers_the_offset_after_sagnac_removal() {
        let scn = TwstftScenario {
            r_a: [RE, 0.0, 0.0],
            r_s: [GEO * 0.5, GEO * 0.866, 0.0],
            r_b: [RE * 0.5, RE * 0.866, 0.0],
            true_offset_s: 2.5e-8, // 25 ns
            transponder_delay_s: 1.2e-7,
            sigma_j: 2e-10, // 0.2 ns per exchange
            step_s: 60.0,
            n_steps: 1440, // 1 day at 1-min cadence
            seed: 7,
        };
        let r = run_twstft(&scn);
        // Mean of 1440 white-jitter samples → σ/√N ≈ 0.2 ns / 38 ≈ 5 ps; allow 5×.
        assert!(
            (r.offset_est_s - scn.true_offset_s).abs() < 5.0 * scn.sigma_j / (1440.0_f64).sqrt(),
            "recovered {} vs true {}",
            r.offset_est_s,
            scn.true_offset_s
        );
        assert!((r.sagnac_s - r.bipm_sagnac_s).abs() < 1e-18);
    }

    #[test]
    fn twstft_campaign_emits_a_finite_tdev_curve() {
        let scn = TwstftScenario {
            r_a: [RE, 0.0, 0.0],
            r_s: [GEO * 0.5, GEO * 0.866, 0.0],
            r_b: [RE * 0.5, RE * 0.866, 0.0],
            true_offset_s: 0.0,
            transponder_delay_s: 0.0,
            sigma_j: 1e-10,
            step_s: 60.0,
            n_steps: 1440,
            seed: 3,
        };
        let r = run_twstft(&scn);
        assert!(r.tdev.len() >= 3, "expected a multi-point TDEV curve");
        assert!(r
            .tdev
            .iter()
            .all(|&(t, d)| t.is_finite() && d.is_finite() && d > 0.0));
        // White (uncorrelated) offset noise ⇒ TDEV decreases with τ.
        assert!(r.tdev.first().unwrap().1 > r.tdev.last().unwrap().1);
    }

    // ── 2. GNSS common-view ──────────────────────────────────────────────────

    fn cv_epoch(dt_a: f64, dt_b: f64, sv: f64, ra: f64, rb: f64) -> CvEpoch {
        // Pseudorange = geometric range + c·(rx_clock − sv_clock).
        CvEpoch {
            pr_a: ra + C_M_PER_S * (dt_a - sv),
            range_a: ra,
            pr_b: rb + C_M_PER_S * (dt_b - sv),
            range_b: rb,
        }
    }

    #[test]
    fn common_view_recovers_offset_and_cancels_sat_clock() {
        let (dt_a, dt_b) = (1.0e-7, -3.0e-8);
        for &sv in &[0.0, 1e-6, -5e-7] {
            let e = cv_epoch(dt_a, dt_b, sv, 2.10e7, 2.13e7);
            let est = gnss_common_view_series(&[e])[0];
            assert!((est - (dt_a - dt_b)).abs() < 1e-15, "sv {sv}: {est}");
        }
    }

    #[test]
    fn common_view_series_is_constant_for_a_constant_offset() {
        let (dt_a, dt_b) = (5e-8, 5e-9);
        let epochs: Vec<CvEpoch> = (0..50)
            .map(|k| {
                cv_epoch(
                    dt_a,
                    dt_b,
                    1e-6 * (k as f64).sin(),
                    2.0e7 + 1e3 * k as f64,
                    2.05e7,
                )
            })
            .collect();
        let s = gnss_common_view_series(&epochs);
        assert!(s.iter().all(|v| (v - (dt_a - dt_b)).abs() < 1e-15));
    }

    #[test]
    fn common_view_emits_a_tdev_curve() {
        let epochs: Vec<CvEpoch> = (0..100)
            .map(|k| cv_epoch(1e-7, 0.0, 1e-6 * (k as f64), 2.0e7, 2.0e7))
            .collect();
        let s = gnss_common_view_series(&epochs);
        let td = offset_tdev(&s, 30.0);
        assert!(td.len() >= 3 && td.iter().all(|&(t, d)| t.is_finite() && d.is_finite()));
    }

    #[test]
    fn common_view_handles_differing_ranges() {
        // Different geometry at the two stations must not bias the offset.
        let e = cv_epoch(2e-8, -2e-8, 7e-7, 2.0e7, 2.4e7);
        let est = gnss_common_view_series(&[e])[0];
        assert!((est - 4e-8).abs() < 1e-15);
    }

    #[test]
    fn common_view_white_noise_averages_down() {
        // N independent noisy single-differences average toward the true offset.
        let nrm = Normal::new(0.0, 1.0).unwrap(); // 1 m pseudorange noise
        let mut rng = ChaCha8Rng::seed_from_u64(11);
        let n = 4000;
        let mut series = Vec::new();
        for _ in 0..n {
            let na = nrm.sample(&mut rng);
            let nb = nrm.sample(&mut rng);
            let e = CvEpoch {
                pr_a: 2.0e7 + C_M_PER_S * 1e-7 + na,
                range_a: 2.0e7,
                pr_b: 2.0e7 + nb,
                range_b: 2.0e7,
            };
            series.push(gnss_common_view_series(&[e])[0]);
        }
        let mean = series.iter().sum::<f64>() / n as f64;
        // True offset 100 ns; mean error ≈ √2·1m/c/√N ≈ 7e-11 s; allow 5×.
        assert!((mean - 1e-7).abs() < 5.0 * 2f64.sqrt() / C_M_PER_S / (n as f64).sqrt());
    }

    // ── 3. PPP ───────────────────────────────────────────────────────────────

    #[test]
    fn iono_free_cancels_first_order_ionosphere_exactly() {
        let (rho, dt_rx, dt_sat, tec) = (2.15e7, 3e-7, 1e-9, 25.0);
        let common = rho + C_M_PER_S * (dt_rx - dt_sat);
        let p1 = common + iono_delay_m(tec, F_L1);
        let p2 = common + iono_delay_m(tec, F_L2);
        let p_if = iono_free_combination(p1, p2);
        assert!((p_if - common).abs() < 1e-5, "p_if {p_if} vs {common}");
    }

    #[test]
    fn ppp_recovers_receiver_clock_exactly_when_noiseless() {
        let (rho, dt_rx, dt_sat, tec) = (2.0e7, -4.2e-7, 5e-10, 40.0);
        let common = rho + C_M_PER_S * (dt_rx - dt_sat);
        let p1 = common + iono_delay_m(tec, F_L1);
        let p2 = common + iono_delay_m(tec, F_L2);
        let p_if = iono_free_combination(p1, p2);
        let est = ppp_receiver_clock(p_if, rho, dt_sat);
        assert!((est - dt_rx).abs() < 1e-13, "est {est} vs {dt_rx}");
    }

    #[test]
    fn iono_free_combination_coefficients_sum_to_unity_on_geometry() {
        // The combination preserves any frequency-independent term (geometry, clock): the
        // two coefficients (f1²/(f1²−f2²)) and (−f2²/(f1²−f2²)) sum to 1.
        let f1 = F_L1 * F_L1;
        let f2 = F_L2 * F_L2;
        let c1 = f1 / (f1 - f2);
        let c2 = -f2 / (f1 - f2);
        assert!((c1 + c2 - 1.0).abs() < 1e-12);
        assert!(c1 > 2.5 && c1 < 2.6); // ≈ 2.546 for L1/L2
    }

    #[test]
    fn iono_delay_is_larger_on_l2_than_l1() {
        // The 1/f² scaling makes the L2 delay (f2 < f1) the larger one.
        let d1 = iono_delay_m(30.0, F_L1);
        let d2 = iono_delay_m(30.0, F_L2);
        assert!(d2 > d1 && d1 > 0.0);
        // Ratio = (f1/f2)² ≈ 1.647.
        assert!(((d2 / d1) - (F_L1 / F_L2).powi(2)).abs() < 1e-9);
    }

    #[test]
    fn ppp_noisy_clock_series_emits_tdev_and_stays_unbiased() {
        let nrm = Normal::new(0.0, 0.3).unwrap(); // 0.3 m iono-free noise
        let mut rng = ChaCha8Rng::seed_from_u64(21);
        let (rho, dt_rx, dt_sat, tec) = (2.1e7, 6e-8, 0.0, 15.0);
        let mut series = Vec::new();
        for _ in 0..600 {
            let common = rho + C_M_PER_S * (dt_rx - dt_sat);
            let p1 = common + iono_delay_m(tec, F_L1) + nrm.sample(&mut rng);
            let p2 = common + iono_delay_m(tec, F_L2) + nrm.sample(&mut rng);
            let p_if = iono_free_combination(p1, p2);
            series.push(ppp_receiver_clock(p_if, rho, dt_sat));
        }
        let mean = series.iter().sum::<f64>() / series.len() as f64;
        assert!((mean - dt_rx).abs() < 1e-9, "mean {mean} vs {dt_rx}");
        let td = offset_tdev(&series, 30.0);
        assert!(td.len() >= 3 && td.iter().all(|&(_, d)| d.is_finite()));
    }

    // ── 4. Optical FSO ───────────────────────────────────────────────────────

    #[test]
    fn rytov_variance_matches_hand_calculation() {
        // λ=1.064 µm, Cn²=1e-16 m^-2/3, L=10 km ⇒ σ_R² ≈ 0.210 (weak turbulence).
        let s = rytov_variance(1e-16, 1.064e-6, 1.0e4);
        assert!((s - 0.210).abs() < 0.006, "σ_R² = {s}");
    }

    #[test]
    fn fried_parameter_matches_hand_calculation() {
        // Same conditions ⇒ r₀ ≈ 0.199 m.
        let r0 = fried_parameter(1e-16, 1.064e-6, 1.0e4);
        assert!((r0 - 0.199).abs() < 0.006, "r₀ = {r0}");
    }

    #[test]
    fn lognormal_fading_has_unit_mean() {
        let sigma_r2 = 0.2;
        let mut rng = ChaCha8Rng::seed_from_u64(99);
        let n = 200_000;
        let mean: f64 = (0..n)
            .map(|_| lognormal_fading(sigma_r2, &mut rng))
            .sum::<f64>()
            / n as f64;
        assert!((mean - 1.0).abs() < 0.02, "mean = {mean}");
    }

    #[test]
    fn lognormal_fading_variance_tracks_rytov() {
        let sigma_r2 = 0.2;
        let mut rng = ChaCha8Rng::seed_from_u64(100);
        let n = 200_000;
        let xs: Vec<f64> = (0..n)
            .map(|_| lognormal_fading(sigma_r2, &mut rng))
            .collect();
        let mean = xs.iter().sum::<f64>() / n as f64;
        let var = xs.iter().map(|x| (x - mean).powi(2)).sum::<f64>() / n as f64;
        // Var = exp(σ_R²) − 1 ≈ 0.221 for σ_R²=0.2.
        let expected = (sigma_r2).exp() - 1.0;
        assert!(
            (var - expected).abs() / expected < 0.08,
            "var {var} vs {expected}"
        );
    }

    #[test]
    fn stronger_turbulence_increases_rytov_and_shrinks_fried() {
        let weak = rytov_variance(1e-17, 1.55e-6, 1.0e4);
        let strong = rytov_variance(1e-15, 1.55e-6, 1.0e4);
        assert!(strong > weak);
        let r0_weak = fried_parameter(1e-17, 1.55e-6, 1.0e4);
        let r0_strong = fried_parameter(1e-15, 1.55e-6, 1.0e4);
        assert!(r0_strong < r0_weak);
    }

    // ── 5. IEEE 1139 power-law fit ───────────────────────────────────────────

    /// Octave-spaced τ grid and an analytic ADEV curve from given coefficients.
    fn synthetic_curve(h2: f64, h1: f64, h0: f64, hm1: f64, hm2: f64, f_h: f64) -> Vec<(f64, f64)> {
        (0..10)
            .map(|i| {
                let tau = (1u64 << i) as f64; // 1, 2, 4, … 512 s
                let b = avar_basis(tau, f_h);
                let avar = h2 * b[0] + h1 * b[1] + h0 * b[2] + hm1 * b[3] + hm2 * b[4];
                (tau, avar.sqrt())
            })
            .collect()
    }

    #[test]
    fn fit_recovers_pure_white_fm() {
        let h0 = 1e-22;
        let curve = synthetic_curve(0.0, 0.0, h0, 0.0, 0.0, 0.5);
        let f = fit_power_law_psd(&curve, 0.5).unwrap();
        assert!((f.h0 - h0).abs() / h0 < 1e-6, "h0 {} vs {h0}", f.h0);
        assert!(f.hm2.abs() < 1e-28 && f.hm1.abs() < 1e-26);
    }

    #[test]
    fn fit_recovers_pure_random_walk_fm() {
        let hm2 = 3e-30;
        let curve = synthetic_curve(0.0, 0.0, 0.0, 0.0, hm2, 0.5);
        let f = fit_power_law_psd(&curve, 0.5).unwrap();
        assert!((f.hm2 - hm2).abs() / hm2 < 1e-6, "hm2 {} vs {hm2}", f.hm2);
    }

    #[test]
    fn fit_recovers_pure_flicker_fm() {
        let hm1 = 2e-24;
        let curve = synthetic_curve(0.0, 0.0, 0.0, hm1, 0.0, 0.5);
        let f = fit_power_law_psd(&curve, 0.5).unwrap();
        assert!((f.hm1 - hm1).abs() / hm1 < 1e-6, "hm1 {} vs {hm1}", f.hm1);
    }

    #[test]
    fn fit_recovers_a_three_process_mix() {
        let (h0, hm1, hm2) = (1e-22, 5e-25, 2e-30);
        let curve = synthetic_curve(0.0, 0.0, h0, hm1, hm2, 0.5);
        let f = fit_power_law_psd(&curve, 0.5).unwrap();
        assert!((f.h0 - h0).abs() / h0 < 1e-5);
        assert!((f.hm1 - hm1).abs() / hm1 < 1e-5);
        assert!((f.hm2 - hm2).abs() / hm2 < 1e-5);
    }

    #[test]
    fn fit_recovers_white_pm_with_cutoff() {
        let h2 = 4e-26;
        let f_h = 10.0;
        let curve = synthetic_curve(h2, 0.0, 0.0, 0.0, 0.0, f_h);
        let f = fit_power_law_psd(&curve, f_h).unwrap();
        assert!((f.h2 - h2).abs() / h2 < 1e-4, "h2 {} vs {h2}", f.h2);
    }

    #[test]
    fn fit_reports_dominant_process_per_decade() {
        // White FM dominates short τ, random-walk FM dominates long τ. The crossover
        // τ² = 3·h₀/(4π²·h₋₂) ≈ (27.6 s)² sits well inside the 1–512 s grid.
        let curve = synthetic_curve(0.0, 0.0, 1e-22, 0.0, 1e-26, 0.5);
        let f = fit_power_law_psd(&curve, 0.5).unwrap();
        assert!(!f.dominant_per_decade.is_empty());
        let first = f.dominant_per_decade.first().unwrap().1;
        let last = f.dominant_per_decade.last().unwrap().1;
        assert_eq!(first, PowerLawNoise::WhiteFm);
        assert_eq!(last, PowerLawNoise::RandomWalkFm);
    }

    // ── 6. Clock ensemble ────────────────────────────────────────────────────

    /// A synthetic white-FM clock phase series: phase is the running integral of white
    /// fractional frequency `y_k ~ N(0, σ_y)` over steps of `tau0`.
    fn white_fm_clock(sigma_y: f64, tau0: f64, n: usize, seed: u64) -> Vec<f64> {
        let nrm = Normal::new(0.0, sigma_y).unwrap();
        let mut rng = ChaCha8Rng::seed_from_u64(seed);
        let mut phase = 0.0;
        let mut out = Vec::with_capacity(n);
        for _ in 0..n {
            out.push(phase);
            phase += nrm.sample(&mut rng) * tau0;
        }
        out
    }

    #[test]
    fn ensemble_of_three_equal_clocks_beats_each_single() {
        let tau0 = 1.0;
        let n = 2048;
        let c1 = white_fm_clock(1e-11, tau0, n, 1);
        let c2 = white_fm_clock(1e-11, tau0, n, 2);
        let c3 = white_fm_clock(1e-11, tau0, n, 3);
        let ens = ensemble_timescale(&[c1.clone(), c2.clone(), c3.clone()], &[1.0, 1.0, 1.0]);
        let a1 = adev_tau0(&c1, tau0);
        let a2 = adev_tau0(&c2, tau0);
        let a3 = adev_tau0(&c3, tau0);
        let ae = adev_tau0(&ens, tau0);
        let min_single = a1.min(a2).min(a3);
        assert!(
            ae < min_single,
            "ensemble {ae} not below best single {min_single}"
        );
        // Three independent equal clocks ⇒ variance/3 ⇒ ADEV ≈ mean/√3.
        let mean_single = (a1 + a2 + a3) / 3.0;
        assert!(
            ae < 0.75 * mean_single && ae > 0.40 * mean_single,
            "ae {ae} mean {mean_single}"
        );
    }

    #[test]
    fn inverse_variance_weighting_beats_the_best_clock() {
        let tau0 = 1.0;
        let n = 2048;
        // Three clocks of differing quality; weight ∝ 1/σ².
        let (s1, s2, s3) = (1e-11, 2e-11, 4e-11);
        let c1 = white_fm_clock(s1, tau0, n, 10);
        let c2 = white_fm_clock(s2, tau0, n, 20);
        let c3 = white_fm_clock(s3, tau0, n, 30);
        let w = [1.0 / (s1 * s1), 1.0 / (s2 * s2), 1.0 / (s3 * s3)];
        let ens = ensemble_timescale(&[c1.clone(), c2.clone(), c3.clone()], &w);
        let ae = adev_tau0(&ens, tau0);
        let best = adev_tau0(&c1, tau0); // c1 is the best clock
        assert!(ae < best, "ensemble {ae} not below best clock {best}");
    }

    #[test]
    fn ensemble_is_reproducible() {
        let c1 = white_fm_clock(1e-11, 1.0, 512, 7);
        let c2 = white_fm_clock(1e-11, 1.0, 512, 8);
        let a = ensemble_timescale(&[c1.clone(), c2.clone()], &[1.0, 1.0]);
        let b = ensemble_timescale(&[c1, c2], &[1.0, 1.0]);
        assert_eq!(a, b);
    }

    #[test]
    fn ensemble_weights_are_a_convex_combination() {
        // Equal-phase clocks ⇒ ensemble equals that common phase regardless of weights.
        let c = vec![1.0, 2.0, 3.0, 4.0];
        let ens = ensemble_timescale(&[c.clone(), c.clone(), c.clone()], &[0.2, 0.5, 1.3]);
        assert_eq!(ens, c);
    }

    #[test]
    fn single_clock_ensemble_is_the_identity() {
        let c = white_fm_clock(1e-11, 1.0, 256, 5);
        let ens = ensemble_timescale(std::slice::from_ref(&c), &[3.7]);
        // w·c/w is c up to one multiply/divide ULP — identical to well under a femtosecond.
        assert!(ens
            .iter()
            .zip(&c)
            .all(|(e, x)| (e - x).abs() <= 1e-24 + 1e-12 * x.abs()));
    }
}
