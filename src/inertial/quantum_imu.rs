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
//! * **Coriolis / rotation** phase `Φ_cor = 2·k_eff·v_⊥·Ω·T²` (equivalent bias the
//!   classical `2·Ω×v`) and the **AC-Stark light-shift** phase
//!   `Φ_LS = (δ_LS,1 − δ_LS,3)/Ω_eff` (which cancels by π/2–π–π/2 symmetry for a
//!   constant shift) — the two leading deterministic systematics — are modelled here.
//!
//! Honest scope: this module covers the **quantum-projection-noise floor** (the
//! fundamental limit), the **vibration-limited** regime above it, and the Coriolis
//! and light-shift systematics. Wavefront aberration and Mach–Zehnder fringe
//! ambiguity are still out of scope; see [`docs/QUANTUM.md`](../../docs/QUANTUM.md).

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

/// Coriolis / Sagnac interferometer phase (rad) induced by platform rotation:
/// `Φ_cor = 2·k_eff·v_perp·Ω·T²`, where `v_perp` (m/s) is the atom transverse
/// velocity perpendicular to both `k_eff` and the rotation axis `omega_rot`
/// (rad/s), and `pulse_sep_t` is the pulse separation `T` (s). The dominant
/// rotation systematic for any moving-vehicle CAI (Lan et al. 2012; Dickerson et
/// al. 2013). Its equivalent acceleration bias is [`coriolis_accel_bias`].
pub fn coriolis_phase(k_eff: f64, v_perp: f64, omega_rot: f64, pulse_sep_t: f64) -> f64 {
    2.0 * k_eff * v_perp * omega_rot * pulse_sep_t * pulse_sep_t
}

/// Equivalent acceleration bias (m/s²) of the Coriolis phase, `Φ_cor/(k_eff·T²) =
/// 2·v_perp·Ω` — exactly the classical Coriolis acceleration `2·Ω×v`. This is the
/// bias the dead-reckoning solution sees if rotation is not compensated.
pub fn coriolis_accel_bias(v_perp: f64, omega_rot: f64) -> f64 {
    2.0 * v_perp * omega_rot
}

/// Differential AC-Stark (one-photon light-shift) interferometer phase (rad). A
/// light shift `δ_LS` imprints a phase `δ_LS/Ω_eff` at each π/2 pulse; in the
/// π/2–π–π/2 sequence only the difference between the first and last pulse survives:
/// `Φ_LS = (δ_LS_first − δ_LS_third)/Ω_eff`. A *constant* shift therefore cancels by
/// symmetry — the reason AC-Stark control targets pulse-to-pulse stability rather
/// than the absolute shift (Peters et al. 2001; Gauguet et al. 2008). All
/// frequencies in rad/s.
pub fn ac_stark_phase(delta_ls_first: f64, delta_ls_third: f64, rabi_eff: f64) -> f64 {
    if rabi_eff == 0.0 {
        return 0.0;
    }
    (delta_ls_first - delta_ls_third) / rabi_eff
}

/// One point of a cycle-time drift sweep.
#[derive(Clone, Copy, Debug)]
pub struct DriftSweepPoint {
    /// Measurement cycle time `T_c` (s).
    pub cycle_time_s: f64,
    /// White acceleration PSD `q_va` ((m/s²)²/Hz) at this cycle time.
    pub q_va: f64,
    /// 1-σ position drift (m) after `nav_duration_s` of unaided dead reckoning.
    pub pos_drift_m: f64,
}

/// Sweep the measurement cycle time and report the quantum-CAI dead-reckoning
/// position drift over a fixed navigation window. For each `T_c` the white
/// acceleration PSD `q_va` is recomputed (it scales with `T_c` — fewer fixes per
/// second is noisier) and the unaided position drift from double-integrating that
/// white acceleration noise is `σ_pos = √(q_va·t³/3)`. This is the data behind a
/// "quantum CAI vs classical/CSAC-timed inertial nav" comparison: the CAI drift
/// grows with cycle time, and a classical sensor's larger `q_va` sits above it.
pub fn cai_drift_sweep(
    base: CaiAccelerometer,
    cycle_times_s: &[f64],
    nav_duration_s: f64,
) -> Vec<DriftSweepPoint> {
    cycle_times_s
        .iter()
        .map(|&tc| {
            let cai = CaiAccelerometer {
                cycle_time_s: tc,
                ..base
            };
            let q = cai.q_va();
            let drift = (q * nav_duration_s.powi(3) / 3.0).sqrt();
            DriftSweepPoint {
                cycle_time_s: tc,
                q_va: q,
                pos_drift_m: drift,
            }
        })
        .collect()
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
    fn coriolis_phase_is_two_k_v_omega_t_squared_and_maps_to_2vomega() {
        // Φ_cor = 2·k_eff·v_perp·Ω·T². For k_eff = 1.6106e7, v = 3 m/s, Ω = 1e-3 rad/s,
        // T = 0.05 s: 2·1.6106e7·3·1e-3·0.0025 = 241.59 rad.
        let k = effective_wavevector(RB87_D2_WAVELENGTH_M);
        let phi = coriolis_phase(k, 3.0, 1e-3, 0.05);
        assert!((phi - 241.59).abs() / 241.59 < 1e-3, "Φ_cor = {phi}");
        // Quadratic in T, linear in v and Ω.
        assert!((coriolis_phase(k, 3.0, 1e-3, 0.10) / phi - 4.0).abs() < 1e-9);
        assert!((coriolis_phase(k, 6.0, 1e-3, 0.05) / phi - 2.0).abs() < 1e-9);
        // The equivalent acceleration bias is the classical Coriolis term 2·Ω×v = 2vΩ,
        // recovered as Φ_cor/(k_eff·T²).
        let a_bias = coriolis_accel_bias(3.0, 1e-3);
        assert!(
            (a_bias - 2.0 * 3.0 * 1e-3).abs() < 1e-15,
            "a_cor = {a_bias}"
        );
        assert!((phi / (k * 0.05 * 0.05) - a_bias).abs() / a_bias < 1e-9);
        // At Earth rotation rate (7.292e-5 rad/s) with v = 0.1 m/s the bias is ~1.46e-5
        // m/s² (~1.5 µg) — a real, must-correct systematic for a moving vehicle.
        let earth = coriolis_accel_bias(0.1, 7.292e-5);
        assert!(
            (earth - 1.4584e-5).abs() / 1.4584e-5 < 1e-3,
            "Earth-rate bias = {earth}"
        );
    }

    #[test]
    fn ac_stark_phase_cancels_when_symmetric() {
        // A constant differential light shift at the two π/2 pulses cancels in the
        // π/2–π–π/2 sequence: Φ_LS = (δ₁ − δ₃)/Ω_eff = 0 when δ₁ = δ₃.
        let rabi = 2.0 * PI * 10_000.0; // 10 kHz effective Rabi frequency
        assert!(ac_stark_phase(2.0 * PI * 150.0, 2.0 * PI * 150.0, rabi).abs() < 1e-15);
        // An asymmetric shift survives: (δ₁ − δ₃)/Ω_eff. δ₁ = 2π·200, δ₃ = 2π·150 →
        // (2π·50)/(2π·10000) = 5e-3 rad.
        let phi = ac_stark_phase(2.0 * PI * 200.0, 2.0 * PI * 150.0, rabi);
        assert!((phi - 5e-3).abs() < 1e-9, "Φ_LS = {phi}");
        // Zero Rabi frequency is guarded (no divide-by-zero).
        assert_eq!(ac_stark_phase(1.0, 0.0, 0.0), 0.0);
    }

    #[test]
    fn cai_drift_grows_with_cycle_time_and_duration() {
        let base = CaiAccelerometer {
            wavelength_m: RB87_D2_WAVELENGTH_M,
            pulse_sep_t: 0.01,
            atom_number: 1e6,
            contrast: 0.5,
            cycle_time_s: 0.5,
        };
        let sweep = cai_drift_sweep(base, &[0.1, 1.0, 10.0], 600.0);
        assert_eq!(sweep.len(), 3);
        // Longer cycle time → fewer measurements/s → larger q_va → more position drift.
        assert!(sweep[0].pos_drift_m < sweep[1].pos_drift_m);
        assert!(sweep[1].pos_drift_m < sweep[2].pos_drift_m);
        // Position drift from a white acceleration PSD grows as t^{3/2}: 4× the nav
        // window is 8× the drift.
        let short = cai_drift_sweep(base, &[1.0], 600.0)[0].pos_drift_m;
        let long = cai_drift_sweep(base, &[1.0], 2400.0)[0].pos_drift_m;
        assert!(
            (long / short - 8.0).abs() < 1e-6,
            "t^1.5 scaling: {}",
            long / short
        );
        // Every point reports a positive drift and the q_va it came from.
        assert!(sweep.iter().all(|p| p.pos_drift_m > 0.0 && p.q_va > 0.0));
    }

    #[test]
    fn freier_2016_mobile_gravimeter_quantum_floor_is_below_achieved() {
        // Freier et al. 2016, "Mobile quantum gravity sensor with unprecedented
        // stability" (arXiv:1512.05660): short-term noise 96 nm/s²/√Hz, accuracy
        // 39 nm/s², long-term stability 0.5 nm/s². Representative GAIN parameters
        // (2T ≈ 0.52 s → T ≈ 0.26 s, N ≈ 1e6, C ≈ 0.6, cycle ≈ 1 s).
        let gain = CaiAccelerometer {
            wavelength_m: RB87_D2_WAVELENGTH_M,
            pulse_sep_t: 0.26,
            atom_number: 1e6,
            contrast: 0.6,
            cycle_time_s: 1.0,
        };
        let achieved = 96e-9; // m/s²/√Hz (Freier 2016 short-term noise)
        let sql = gain.accel_asd(); // modelled quantum-projection-noise floor
                                    // The fundamental limit must lie below the achieved noise of the real device…
        assert!(
            sql < achieved,
            "SQL floor {sql} must be below achieved {achieved}"
        );
        // …but within ~2 orders: the real device is vibration/technical-limited, not at
        // the SQL, yet it is the same physical sensor (achieved/SQL ≈ 60×).
        assert!(
            achieved < 200.0 * sql,
            "achieved {achieved} implausibly far above the SQL floor {sql}"
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
