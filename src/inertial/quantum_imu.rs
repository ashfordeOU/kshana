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
//! Honest scope: this is the **quantum-projection-noise floor** — the fundamental
//! limit. Real instruments are typically far above it, dominated by **vibration**
//! coupling through the `k_eff·T²` scale factor and by systematics (light shift,
//! Coriolis, wavefront). Those terms are not yet modelled here, so the derived
//! `q_va` is an optimistic lower bound, not a device prediction; see
//! [`docs/QUANTUM.md`](../../docs/QUANTUM.md).

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
}
