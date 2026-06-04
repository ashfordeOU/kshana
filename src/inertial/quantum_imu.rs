// SPDX-License-Identifier: Apache-2.0
//! First-principles cold-atom-interferometer (CAI) accelerometer physics.
//!
//! Elsewhere in Kshana the quantum inertial sensors are driven by *published*
//! Allan/noise coefficients (datasheet lookups). This module instead derives the
//! fundamental performance of a three-pulse (π/2–π–π/2 Mach–Zehnder, Kasevich–Chu)
//! cold-atom accelerometer **from first principles**, so the velocity-random-walk
//! coefficient the classical accelerometer model consumes (`q_va`, the white
//! acceleration PSD) is *computed* from the interferometer geometry rather than
//! supplied.
//!
//! The physics (Kasevich & Chu 1991; Peters et al. 2001; Freier et al. 2016):
//!
//! * **Effective wavevector** of the two-photon Raman transition, `k_eff = 4π/λ`.
//! * **Interferometer phase** for a uniform specific force `a` along `k_eff` with
//!   pulse separation `T`: `Φ = k_eff · a · T²`. The `T²` scaling is why long
//!   interrogation times (hard on the ground, natural in microgravity) are the
//!   single biggest sensitivity lever.
//! * **Quantum projection (shot) noise** on the fringe readout, per shot:
//!   `σ_Φ = 1/(C·√N)` for fringe contrast `C` and atom number `N` — the standard
//!   quantum limit of a two-port population measurement.
//! * **Per-shot acceleration sensitivity** `σ_a = σ_Φ / (k_eff·T²)`, and, sampling
//!   every cycle time `T_c`, the shot-noise-limited acceleration ASD
//!   `n_a = σ_a·√T_c` (m/s²/√Hz), whose square is the `q_va` PSD.
//! * **Contrast decay** `C(t) = C₀·exp(−t/τ_c)` from decoherence over the
//!   interrogation.
//!
//! * **Vibration coupling.** The same `k_eff·T²` scale factor that makes the sensor
//!   sensitive to the signal also couples platform **vibration** into the fringe.
//!   For the ideal three-pulse geometry the acceleration→phase response is
//!   `|H(ω)| = (4/ω²)·sin²(ωT/2)` (DC limit `T²`; Cheinet et al. 2008), so a flat
//!   acceleration PSD `S_a` along the Raman axis gives a phase variance
//!   `σ_Φ² = k_eff²·S_a·∫₀^∞|H|²dω/(2π) = k_eff²·S_a·T³/3`. This is the *dominant*
//!   real-device term, and it is now modelled here.
//!
//! Honest scope: this module covers the **quantum-projection-noise floor** (the
//! fundamental limit) and the **vibration-limited** regime above it. Other
//! systematics — light shift, Coriolis/rotation, wavefront aberration — are still
//! datasheet-supplied, not derived; see [`docs/QUANTUM.md`](../../docs/QUANTUM.md).

use std::f64::consts::PI;

/// Rb-87 D2 line wavelength (m) — the workhorse species for cold-atom inertial
/// sensors (e.g. CARIOQA-PMP).
pub const RB87_D2_WAVELENGTH_M: f64 = 780.241_209e-9;

/// Effective two-photon Raman wavevector `k_eff = 4π/λ` (rad/m): the counter-
/// propagating Raman pair imprints momentum `2·ħk_L`, so `k_eff = 2·(2π/λ)`.
pub fn effective_wavevector(wavelength_m: f64) -> f64 {
    4.0 * PI / wavelength_m
}

/// Three-pulse Mach–Zehnder interferometer phase (rad) for a uniform specific force
/// `accel` (m/s²) projected on `k_eff`, with pulse separation `pulse_sep_t` (s):
/// `Φ = k_eff · a · T²`.
pub fn mach_zehnder_phase(k_eff: f64, accel: f64, pulse_sep_t: f64) -> f64 {
    k_eff * accel * pulse_sep_t * pulse_sep_t
}

/// Quantum projection-noise phase per shot: `σ_Φ = 1/(C·√N)` for fringe contrast
/// `contrast` ∈ (0, 1] and `atom_number` atoms.
pub fn projection_noise_rad(contrast: f64, atom_number: f64) -> f64 {
    let c = contrast.clamp(1e-9, 1.0);
    let n = atom_number.max(1.0);
    1.0 / (c * n.sqrt())
}

/// Per-shot acceleration sensitivity (m/s²) from a readout-phase uncertainty:
/// `σ_a = σ_Φ / (k_eff · T²)`.
pub fn accel_sensitivity_per_shot(sigma_phi: f64, k_eff: f64, pulse_sep_t: f64) -> f64 {
    let scale = k_eff * pulse_sep_t * pulse_sep_t;
    if scale == 0.0 {
        return f64::INFINITY;
    }
    sigma_phi / scale
}

/// Acceleration→phase transfer-function magnitude `|H(ω)|` (units s²) of an ideal
/// three-pulse interferometer with pulse separation `pulse_sep_t` (s):
/// `|H(ω)| = (4/ω²)·sin²(ωT/2)`, with the DC limit `H(0) = T²` (Cheinet et al.
/// 2008). The fringe phase from an acceleration component `a(ω)` along `k_eff` is
/// `Φ(ω) = k_eff·a(ω)·H(ω)`, so this reduces to `Φ = k_eff·a·T²` at DC.
pub fn accel_transfer_function(omega_rad_s: f64, pulse_sep_t: f64) -> f64 {
    let w = omega_rad_s.abs();
    // Small-angle DC limit: (4/ω²)·sin²(ωT/2) → T² as ωT → 0 (avoids 0/0).
    if w * pulse_sep_t < 1e-4 {
        return pulse_sep_t * pulse_sep_t;
    }
    let s = (w * pulse_sep_t / 2.0).sin();
    4.0 * s * s / (w * w)
}

/// Vibration-limited phase variance (rad²) for a flat (white) acceleration PSD
/// `accel_psd` ((m/s²)²/Hz) coupling along the Raman-beam axis. Closed form for the
/// ideal three-pulse interferometer, obtained by integrating the transfer function
/// over all frequencies (`∫₀^∞ |H(ω)|² dω = (2π/3)·T³`):
/// `σ_Φ² = k_eff²·S_a·T³/3`. Variance grows as `T³`, so the long interrogation that
/// buys signal sensitivity also amplifies vibration — the central CAI design tension.
pub fn vibration_phase_variance_white(k_eff: f64, pulse_sep_t: f64, accel_psd: f64) -> f64 {
    k_eff * k_eff * accel_psd * pulse_sep_t.powi(3) / 3.0
}

/// Band-limited numeric counterpart of [`vibration_phase_variance_white`]: integrates
/// `k_eff²·|H(2πf)|²·S_a` over `[f_lo, f_hi]` (Hz) with `n_steps` trapezoid panels for
/// a white `accel_psd`. As the band → `[0, ∞)` it converges to the closed form; with a
/// real band it gives the variance a finite-bandwidth platform actually delivers.
pub fn vibration_phase_variance_band(
    k_eff: f64,
    pulse_sep_t: f64,
    accel_psd: f64,
    f_lo: f64,
    f_hi: f64,
    n_steps: usize,
) -> f64 {
    let n = n_steps.max(1);
    let df = (f_hi - f_lo) / n as f64;
    let two_pi = 2.0 * PI;
    let mut sum = 0.0;
    for i in 0..=n {
        let f = f_lo + df * i as f64;
        let h = accel_transfer_function(two_pi * f, pulse_sep_t);
        // Trapezoid weights: half at the two endpoints.
        let w = if i == 0 || i == n { 0.5 } else { 1.0 };
        sum += w * h * h;
    }
    k_eff * k_eff * accel_psd * sum * df
}

/// First-order vibration coupling is rank-1: only the acceleration component along the
/// Raman-beam unit vector enters the phase. Returns that projection (m/s²) for a beam
/// direction `beam_unit` and acceleration `accel` (both in the same frame). `beam_unit`
/// is normalised defensively.
pub fn beam_axis_projection(beam_unit: [f64; 3], accel: [f64; 3]) -> f64 {
    let norm = (beam_unit[0].powi(2) + beam_unit[1].powi(2) + beam_unit[2].powi(2)).sqrt();
    if norm == 0.0 {
        return 0.0;
    }
    (beam_unit[0] * accel[0] + beam_unit[1] * accel[1] + beam_unit[2] * accel[2]) / norm
}

/// A cold-atom Mach–Zehnder accelerometer specified by its physics, with the
/// derived performance the rest of the engine consumes.
#[derive(Clone, Copy, Debug)]
pub struct CaiAccelerometer {
    /// Raman wavelength (m).
    pub wavelength_m: f64,
    /// Pulse separation `T` (s) — half the total interrogation `2T`.
    pub pulse_sep_t: f64,
    /// Detected atom number `N` per shot.
    pub atom_number: f64,
    /// Initial fringe contrast `C₀` ∈ (0, 1].
    pub contrast: f64,
    /// Measurement cycle time `T_c` (s): prepare + interrogate + detect.
    pub cycle_time_s: f64,
}

impl CaiAccelerometer {
    /// Effective wavevector `k_eff = 4π/λ`.
    pub fn k_eff(&self) -> f64 {
        effective_wavevector(self.wavelength_m)
    }

    /// Phase-to-acceleration scale factor `k_eff·T²` (rad per m/s²).
    pub fn scale_factor(&self) -> f64 {
        self.k_eff() * self.pulse_sep_t * self.pulse_sep_t
    }

    /// Quantum projection-noise phase per shot `σ_Φ = 1/(C·√N)`.
    pub fn projection_noise_phase(&self) -> f64 {
        projection_noise_rad(self.contrast, self.atom_number)
    }

    /// Per-shot acceleration sensitivity `σ_a` (m/s²).
    pub fn accel_sensitivity_per_shot(&self) -> f64 {
        accel_sensitivity_per_shot(
            self.projection_noise_phase(),
            self.k_eff(),
            self.pulse_sep_t,
        )
    }

    /// Shot-noise-limited acceleration ASD `n_a = σ_a·√T_c` (m/s²/√Hz).
    pub fn accel_asd(&self) -> f64 {
        self.accel_sensitivity_per_shot() * self.cycle_time_s.max(0.0).sqrt()
    }

    /// White acceleration PSD `q_va = n_a²` ((m/s²)²/Hz) — exactly the
    /// velocity-random-walk coefficient [`crate::inertial::AccelModel`] consumes,
    /// now derived from the interferometer physics rather than a datasheet.
    pub fn q_va(&self) -> f64 {
        let n = self.accel_asd();
        n * n
    }

    /// Fringe contrast after a decoherence time constant `tau_contrast_s`:
    /// `C(t) = C₀·exp(−t/τ_c)`.
    pub fn contrast_at(&self, t_s: f64, tau_contrast_s: f64) -> f64 {
        if tau_contrast_s <= 0.0 {
            return self.contrast;
        }
        self.contrast * (-t_s / tau_contrast_s).exp()
    }

    /// Vibration-limited readout-phase noise `σ_Φ` (rad) for a white platform
    /// acceleration PSD `accel_psd` ((m/s²)²/Hz) along the sensitive axis:
    /// `σ_Φ = k_eff·√(S_a·T³/3)`.
    pub fn vibration_phase_noise(&self, accel_psd: f64) -> f64 {
        vibration_phase_variance_white(self.k_eff(), self.pulse_sep_t, accel_psd).sqrt()
    }

    /// Vibration-limited single-shot acceleration uncertainty (m/s²):
    /// `σ_a = σ_Φ/(k_eff·T²) = √(S_a/(3T))`. Note the `k_eff` cancels — the
    /// vibration floor depends only on the platform PSD and the interrogation time,
    /// not on the optical wavelength.
    pub fn vibration_limited_accel(&self, accel_psd: f64) -> f64 {
        let scale = self.scale_factor();
        if scale == 0.0 {
            return f64::INFINITY;
        }
        self.vibration_phase_noise(accel_psd) / scale
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn effective_wavevector_for_rubidium() {
        // k_eff = 4π/λ; for Rb-87 (780.241 nm), k_eff ≈ 1.6106e7 rad/m.
        let k = effective_wavevector(RB87_D2_WAVELENGTH_M);
        assert!((k - 1.610_6e7).abs() / 1.610_6e7 < 1e-3, "k_eff = {k}");
    }

    #[test]
    fn mach_zehnder_phase_is_k_a_t_squared() {
        // k_eff = 1.6106e7, a = 9.81 m/s², T = 10 ms → Φ = 1.6106e7·9.81·1e-4 ≈ 1.580e4.
        let phi = mach_zehnder_phase(1.610_6e7, 9.81, 0.01);
        assert!((phi - 1.580e4).abs() / 1.580e4 < 1e-3, "Φ = {phi}");
        // Quadratic in T: doubling the pulse separation quadruples the phase.
        let phi2 = mach_zehnder_phase(1.610_6e7, 9.81, 0.02);
        assert!(
            (phi2 / phi - 4.0).abs() < 1e-9,
            "T² scaling broken: {}",
            phi2 / phi
        );
    }

    #[test]
    fn projection_noise_is_inverse_contrast_root_n() {
        // C = 0.5, N = 1e6 → σ_Φ = 1/(0.5·1000) = 2e-3 rad.
        let s = projection_noise_rad(0.5, 1e6);
        assert!((s - 2e-3).abs() < 1e-12, "σ_Φ = {s}");
        // 100× more atoms → 10× quieter (1/√N).
        let s2 = projection_noise_rad(0.5, 1e8);
        assert!(
            (s / s2 - 10.0).abs() < 1e-9,
            "1/√N scaling broken: {}",
            s / s2
        );
    }

    #[test]
    fn per_shot_sensitivity_and_q_va_match_hand_computation() {
        let cai = CaiAccelerometer {
            wavelength_m: RB87_D2_WAVELENGTH_M,
            pulse_sep_t: 0.01,
            atom_number: 1e6,
            contrast: 0.5,
            cycle_time_s: 0.5,
        };
        // σ_a = σ_Φ/(k_eff·T²) = 2e-3 / (1.6106e7·1e-4) = 2e-3/1610.6 ≈ 1.2418e-6 m/s².
        let sigma_a = cai.accel_sensitivity_per_shot();
        assert!(
            (sigma_a - 1.2418e-6).abs() / 1.2418e-6 < 2e-3,
            "σ_a = {sigma_a}"
        );
        // n_a = σ_a·√T_c = 1.2418e-6·√0.5 ≈ 8.78e-7 (m/s²)/√Hz; q_va = n_a².
        let n_a = cai.accel_asd();
        assert!((n_a - 8.78e-7).abs() / 8.78e-7 < 3e-3, "n_a = {n_a}");
        assert!((cai.q_va() - n_a * n_a).abs() < 1e-30);
        // The shot-noise floor (~0.09 µg/√Hz here) is far below real, vibration-
        // limited CAI devices (~1–50 µg/√Hz): this is a fundamental lower bound.
        assert!(n_a < 1e-6, "shot-noise floor should be sub-µg/√Hz: {n_a}");
    }

    #[test]
    fn longer_interrogation_and_more_atoms_improve_sensitivity() {
        let base = CaiAccelerometer {
            wavelength_m: RB87_D2_WAVELENGTH_M,
            pulse_sep_t: 0.01,
            atom_number: 1e6,
            contrast: 0.5,
            cycle_time_s: 0.5,
        };
        // σ_a ∝ 1/T²: a 10× longer interrogation is 100× more sensitive.
        let mut long_t = base;
        long_t.pulse_sep_t = 0.1;
        assert!(
            (base.accel_sensitivity_per_shot() / long_t.accel_sensitivity_per_shot() - 100.0).abs()
                < 1e-6
        );
        // σ_a ∝ 1/√N: 100× atoms → 10× more sensitive.
        let mut more_n = base;
        more_n.atom_number = 1e8;
        assert!(
            (base.accel_sensitivity_per_shot() / more_n.accel_sensitivity_per_shot() - 10.0).abs()
                < 1e-6
        );
    }

    #[test]
    fn contrast_decays_exponentially() {
        let cai = CaiAccelerometer {
            wavelength_m: RB87_D2_WAVELENGTH_M,
            pulse_sep_t: 0.01,
            atom_number: 1e6,
            contrast: 0.8,
            cycle_time_s: 0.5,
        };
        // At t = 0 contrast is C₀; at t = τ it is C₀/e.
        assert!((cai.contrast_at(0.0, 1.0) - 0.8).abs() < 1e-12);
        assert!((cai.contrast_at(1.0, 1.0) - 0.8 / std::f64::consts::E).abs() < 1e-12);
        // τ ≤ 0 disables decay (constant contrast).
        assert!((cai.contrast_at(5.0, 0.0) - 0.8).abs() < 1e-12);
    }

    #[test]
    fn transfer_function_reduces_to_t_squared_at_dc() {
        // |H(ω)| → T² as ωT → 0 (recovers Φ = k_eff·a·T²).
        let h0 = accel_transfer_function(1e-3, 0.01);
        assert!((h0 - 1e-4).abs() < 1e-15, "H(0) should be T² = 1e-4: {h0}");
        // At ω = π/T the half-angle is π/2, sin² = 1, so |H| = 4/ω².
        // ω = π/0.01 = 314.159 rad/s → 4/ω² = 4/98696.0 ≈ 4.0528e-5 s².
        let w = PI / 0.01;
        let h = accel_transfer_function(w, 0.01);
        assert!((h - 4.0528e-5).abs() / 4.0528e-5 < 1e-3, "|H(π/T)| = {h}");
    }

    #[test]
    fn white_vibration_variance_matches_closed_form() {
        // σ_Φ² = k_eff²·S_a·T³/3 for S_a = 1e-10 (m/s²)²/Hz, T = 10 ms.
        // k_eff² = (1.6105738e7)² = 2.59395e14 → σ_Φ² = 2.59395e14·1e-10·1e-6/3 ≈ 8.6465e-3.
        let k = effective_wavevector(RB87_D2_WAVELENGTH_M);
        let var = vibration_phase_variance_white(k, 0.01, 1e-10);
        assert!((var - 8.6465e-3).abs() / 8.6465e-3 < 1e-3, "σ_Φ² = {var}");
        // σ_Φ = √variance ≈ 0.092987 rad via the convenience method.
        let cai = CaiAccelerometer {
            wavelength_m: RB87_D2_WAVELENGTH_M,
            pulse_sep_t: 0.01,
            atom_number: 1e6,
            contrast: 0.5,
            cycle_time_s: 0.5,
        };
        let sigma = cai.vibration_phase_noise(1e-10);
        assert!((sigma - 0.092987).abs() / 0.092987 < 1e-3, "σ_Φ = {sigma}");
        // Variance ∝ T³: doubling the interrogation time grows it 8×.
        let var2 = vibration_phase_variance_white(k, 0.02, 1e-10);
        assert!(
            (var2 / var - 8.0).abs() < 1e-9,
            "T³ scaling broken: {}",
            var2 / var
        );
    }

    #[test]
    fn band_integral_converges_to_closed_form() {
        // Numerically integrating k_eff²·|H(2πf)|²·S_a over a wide band must recover the
        // analytic ∫₀^∞|H|²dω = (2π/3)T³ result (independent cross-check of |H(ω)|).
        let k = effective_wavevector(RB87_D2_WAVELENGTH_M);
        let closed = vibration_phase_variance_white(k, 0.01, 1e-10);
        // |H|² rolls off as 1/ω⁴; 0–5 kHz captures effectively all the power.
        let numeric = vibration_phase_variance_band(k, 0.01, 1e-10, 0.0, 5000.0, 20_000);
        assert!(
            (numeric - closed).abs() / closed < 0.02,
            "numeric {numeric} vs closed {closed}"
        );
    }

    #[test]
    fn vibration_floor_is_wavelength_independent_and_dominates_shot_noise() {
        // σ_a,vib = σ_Φ/(k_eff·T²) = √(S_a/(3T)): the k_eff cancels.
        // S_a = 1e-10, T = 0.01 → √(1e-10/0.03) = √(3.3333e-9) ≈ 5.7735e-5 m/s².
        let rb = CaiAccelerometer {
            wavelength_m: RB87_D2_WAVELENGTH_M,
            pulse_sep_t: 0.01,
            atom_number: 1e6,
            contrast: 0.5,
            cycle_time_s: 0.5,
        };
        let a_vib = rb.vibration_limited_accel(1e-10);
        assert!(
            (a_vib - 5.7735e-5).abs() / 5.7735e-5 < 1e-3,
            "σ_a,vib = {a_vib}"
        );
        // A different optical wavelength gives the identical vibration floor.
        let cs = CaiAccelerometer {
            wavelength_m: 852.0e-9,
            ..rb
        };
        assert!(
            (rb.vibration_limited_accel(1e-10) - cs.vibration_limited_accel(1e-10)).abs() / a_vib
                < 1e-12,
            "vibration floor must be wavelength-independent"
        );
        // It dwarfs the shot-noise floor (~1.24e-6): on a real platform vibration,
        // not projection noise, sets the per-shot sensitivity.
        assert!(
            a_vib > 10.0 * rb.accel_sensitivity_per_shot(),
            "vibration ({a_vib}) should dominate shot noise ({})",
            rb.accel_sensitivity_per_shot()
        );
    }

    #[test]
    fn beam_axis_projection_takes_the_along_axis_component() {
        // Only the acceleration along the Raman beam couples to first order.
        assert!((beam_axis_projection([1.0, 0.0, 0.0], [9.81, 1.0, 2.0]) - 9.81).abs() < 1e-12);
        // A non-unit beam vector is normalised: along +z of [0,0,2] picks a_z = 3.
        assert!((beam_axis_projection([0.0, 0.0, 2.0], [1.0, 2.0, 3.0]) - 3.0).abs() < 1e-12);
        // Acceleration orthogonal to the beam contributes nothing.
        assert!(beam_axis_projection([1.0, 0.0, 0.0], [0.0, 5.0, 0.0]).abs() < 1e-12);
    }
}
