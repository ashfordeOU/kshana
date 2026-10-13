// SPDX-License-Identifier: AGPL-3.0-only
//! Cold-atom-interferometer (CAI) error terms beyond the projection-noise and vibration
//! floors of [`crate::inertial::quantum_imu`]: the **Raman laser-phase noise** (with the
//! retro-reflection propagation delay that does not cancel), the **wavefront-curvature
//! bias** averaged over the atom cloud's temperature, size and the detection area, and
//! **fringe-ambiguity resolution** (classical-aided and two-interrogation-time).
//!
//! All three are MODELLED. Every closed form below is checked in the unit tests against an
//! independent numerical route (a frequency-domain quadrature, or a Monte Carlo over atoms
//! or shots) and against its limiting cases; the one published number reproduced is the
//! white-phase-noise requirement of Cheinet et al. (see [`raman_phase_variance_white`]).
//!
//! ## Laser-phase noise (Cheinet et al. 2008; Le Gouët et al. 2007)
//!
//! A Raman phase fluctuation `φ(t)` enters the interferometer phase through the sensitivity
//! function `g(t)`: `δΦ = ∫ g(t)·dφ/dt dt` (Cheinet et al. 2008, Eq. 5). For square pulses
//! `τ_R − 2τ_R − τ_R` with Rabi frequency `Ω_R = π/(2τ_R)` the Fourier transform of `g` is
//! (Cheinet et al. 2008, Eq. 8)
//!
//! `G(ω) = 4iΩ_R/(ω² − Ω_R²) · sin(ω(T+2τ_R)/2) · [cos(ω(T+2τ_R)/2) + (Ω_R/ω)·sin(ωT/2)]`,
//!
//! the weighting function is `H(ω) = ω·G(ω)`, and for shot-to-shot uncorrelated noise the
//! per-shot phase variance is (Cheinet et al. 2008, Eq. 7, written per hertz)
//!
//! `σ_Φ² = ∫₀^∞ |H(2πf)|² S_φ(f) df`.
//!
//! For white Raman phase noise `S_φ(f) = S_φ⁰` this is `σ_Φ² = (π/2)²·S_φ⁰/τ_R`
//! (Cheinet et al. 2008, Eq. 18 at an averaging time of one cycle). It is exact: by
//! Parseval, `∫₀^∞|H(2πf)|²df = ½∫|ġ(t)|²dt = π²/(4τ_R)`.
//!
//! In the usual retro-reflected geometry the two counter-propagating beams reach the atoms
//! with a delay `t_d = 2L/c` (`L` the atom–mirror distance), so even a perfectly
//! phase-locked Raman pair imprints `φ(t) = φ₁(t) − φ₁(t − t_d)`: the laser's own frequency
//! noise does **not** cancel (Le Gouët et al. 2007, Sec. 3.1). With the laser frequency
//! noise PSD `S_ν(f)` in Hz²/Hz, the phase PSD of `φ₁` is `S_ν/f²` and the delay filter is
//! `|1 − e^{−i2πf t_d}|² = 4·sin²(πf·t_d)` (Le Gouët et al. 2007, Eqs. 6 and 9):
//!
//! `σ_Φ² = ∫₀^∞ |H(2πf)|²·4·sin²(πf·t_d)·S_ν(f)/f² df ≈ (2π·t_d)² ∫₀^∞ |H(2πf)|² S_ν(f) df`,
//!
//! the second form for `f·t_d ≪ 1` (Le Gouët et al. 2007, Eq. 10). For white frequency
//! noise it is `(2π·t_d)²·S_ν⁰·π²/(4τ_R)`: Le Gouët et al. 2007, Eq. 11 (that paper writes
//! the frequency PSD in angular units, which absorbs the `(2π)²`).
//!
//! ## Wavefront curvature (Louchet-Chauvet et al. 2011; Schkolnik et al. 2015)
//!
//! An atom at transverse position `r(t)` picks up the local wavefront phase at each pulse,
//! `ΔΦ = δφ(r(t₁)) − 2·δφ(r(t₂)) + δφ(r(t₃))` (Schkolnik et al. 2015, Eq. 3). A curvature
//! radius `R` on one Raman beam is the beam phase `δφ(r) = k·r²/(2R)` with `k = k_eff/2`.
//! For ballistic flight `r(t) = r₀ + v·t` the quadratic term gives
//! `ΔΦ = k_eff·|v_⊥|²·T²/(2R)` for every atom, independent of `r₀` and of the launch time:
//! piston and tilt cancel in the three-pulse combination, defocus does not. Averaged over a
//! thermal cloud (`σ_v² = k_B·T_atom/m` per transverse axis, `⟨|v_⊥|²⟩ = 2σ_v²`) the bias is
//!
//! `δg = σ_v²/R`  (phase `k_eff·σ_v²·T²/R`),
//!
//! the expansion bias that grows linearly with the cloud temperature, which is why
//! Louchet-Chauvet et al. 2011 extrapolate the wavefront bias to zero temperature. When
//! only atoms inside a detection radius `r_det` at time `t_det` (from release) are counted,
//! the counted atoms are biased toward slow ones, and the initial cloud size `σ_r` sets how
//! strongly: see [`curvature_bias_with_detection`] (Schkolnik et al. 2015, Sec. 3, model a
//! Gaussian cloud and a flat-top detection area of radius `r`; the closed form here is the
//! pure-defocus case of that model).
//!
//! ## Fringe-ambiguity resolution (Lautier et al. 2014; Bonnin et al. 2018)
//!
//! A single fringe reading fixes the phase modulo `2π`. A **classical accelerometer** with
//! noise `σ_c` predicts the phase `k_eff·T²·a_c`, whose integer number of fringes is taken
//! and the CAI's wrapped phase supplies the fraction (the hybrid scheme of Lautier et al.
//! 2014, APL 105, 144102). The index is wrong when the prediction error exceeds half a
//! fringe; with Gaussian classical and phase noise the closed form is
//!
//! `P(wrong integer) = erfc(π/(√2·s))`,  `s² = (k_eff·T²·σ_c)² + σ_Φ²`.
//!
//! With **two interrogation times** `T₁ < T₂` (a multi-T scheme, e.g. Bonnin et al. 2018,
//! PRA 97, 043615) the short interferometer — unambiguous over `±π/(k_eff·T₁²)` — predicts
//! the long one's phase as `(T₂/T₁)²·φ₁`, and the same formula holds with
//! `s² = ((T₂/T₁)²·σ_Φ₁)² + σ_Φ₂²`.

use std::f64::consts::PI;

/// Speed of light in vacuum (m/s), exact (SI).
pub const SPEED_OF_LIGHT_M_S: f64 = 299_792_458.0;

/// Boltzmann constant (J/K), exact (SI 2019).
pub const BOLTZMANN_J_PER_K: f64 = 1.380_649e-23;

/// Mass of a ⁸⁷Rb atom (kg): 86.909 180 531 u × 1.660 539 066 60e-27 kg/u (CODATA 2018).
pub const RB87_MASS_KG: f64 = 1.443_160_648e-25;

/// Default Raman π/2-pulse duration `τ_R` (s) when a laser-noise input is given without
/// one: 10 µs, the "standard pulse duration" Le Gouët et al. 2007 (Sec. 5.2) use.
pub const DEFAULT_PI2_PULSE_S: f64 = 10.0e-6;

// ---------------------------------------------------------------------------------------
// RM-26: laser-phase noise
// ---------------------------------------------------------------------------------------

/// Rabi angular frequency `Ω_R = π/(2τ_R)` (rad/s) of a π/2 pulse lasting `tau_r_s`.
pub fn rabi_frequency_for_pi2_pulse(tau_r_s: f64) -> f64 {
    PI / (2.0 * tau_r_s)
}

/// Raman-phase weighting function `|H(ω)| = |ω·G(ω)|` (dimensionless) of a
/// `τ_R − 2τ_R − τ_R` three-pulse interferometer with pulse separation `pulse_sep_t` (s),
/// from Cheinet et al. 2008, Eq. 8. A non-positive `tau_r_s` gives the infinitely short
/// pulse limit `|H(ω)| = 4·sin²(ωT/2)` (Cheinet et al. 2008, Eq. 9 times `ω`), which is
/// `ω²` times the acceleration transfer function
/// [`crate::inertial::quantum_imu::accel_transfer_function`].
pub fn raman_phase_transfer_function(omega_rad_s: f64, pulse_sep_t: f64, tau_r_s: f64) -> f64 {
    let w = omega_rad_s.abs();
    if tau_r_s <= 0.0 {
        let s = (w * pulse_sep_t / 2.0).sin();
        return 4.0 * s * s;
    }
    let om = rabi_frequency_for_pi2_pulse(tau_r_s);
    // ω = Ω_R is a removable singularity (the bracket vanishes there): step off it.
    let w = if (w - om).abs() < 1e-7 * om {
        om * (1.0 + 1e-6)
    } else {
        w
    };
    let a = w * (pulse_sep_t + 2.0 * tau_r_s) / 2.0;
    // ω·G(ω) with the 1/ω of the bracket multiplied through, so ω → 0 is regular.
    let h =
        4.0 * om * a.sin() * (w * a.cos() + om * (w * pulse_sep_t / 2.0).sin()) / (w * w - om * om);
    h.abs()
}

/// Per-shot interferometer phase variance (rad²) for **white** Raman phase noise
/// `s_phi0_rad2_per_hz` (rad²/Hz): `σ_Φ² = (π/2)²·S_φ⁰/τ_R` (Cheinet et al. 2008, Eq. 18
/// with the averaging time equal to the cycle time). Exact for square pulses: the integral
/// of `|H(2πf)|²` over `f ≥ 0` is `π²/(4τ_R)`. Returns 0 for a non-positive `tau_r_s`
/// (the short-pulse integral diverges; use [`short_pulse_white_band_variance`]).
pub fn raman_phase_variance_white(s_phi0_rad2_per_hz: f64, tau_r_s: f64) -> f64 {
    if tau_r_s <= 0.0 {
        return 0.0;
    }
    (PI / 2.0).powi(2) * s_phi0_rad2_per_hz / tau_r_s
}

/// Numeric per-shot phase variance (rad²) `∫₀^{f_hi} |H(2πf)|² S_φ(f) df` for an arbitrary
/// one-sided Raman phase PSD `psd(f)` (rad²/Hz), by the trapezoid rule on `n_steps` equal
/// panels (Cheinet et al. 2008, Eq. 7). The power above `f_hi` is not included; for white
/// noise it is `≈ S_φ⁰·Ω_R²/(2π²·f_hi)` (the cycle average of `|H|²` is `2Ω_R²/ω²` far
/// above the Rabi frequency).
pub fn raman_phase_variance_numeric(
    pulse_sep_t: f64,
    tau_r_s: f64,
    psd: &dyn Fn(f64) -> f64,
    f_hi: f64,
    n_steps: usize,
) -> f64 {
    let n = n_steps.max(1);
    let df = f_hi / n as f64;
    let mut sum = 0.0;
    for i in 0..=n {
        let f = df * i as f64;
        let h = raman_phase_transfer_function(2.0 * PI * f, pulse_sep_t, tau_r_s);
        let w = if i == 0 || i == n { 0.5 } else { 1.0 };
        sum += w * h * h * psd(f);
    }
    sum * df
}

/// Exact per-shot phase variance (rad²) of **infinitely short** pulses for white Raman
/// phase noise `s_phi0` (rad²/Hz) band-limited to `[0, f_c]` (Hz):
/// `∫₀^{f_c} 16·sin⁴(πfT)·S_φ⁰ df = S_φ⁰·[6f_c − 4·sin(2πf_cT)/(πT) + sin(4πf_cT)/(2πT)]`.
/// The leading `6·S_φ⁰·f_c` shows why the finite pulse duration is what keeps the white
/// phase-noise variance finite.
pub fn short_pulse_white_band_variance(s_phi0_rad2_per_hz: f64, pulse_sep_t: f64, f_c: f64) -> f64 {
    let t = pulse_sep_t;
    let x = 2.0 * PI * f_c * t;
    s_phi0_rad2_per_hz * (6.0 * f_c - 4.0 * x.sin() / (PI * t) + (2.0 * x).sin() / (2.0 * PI * t))
}

/// Retro-reflection delay `t_d = 2L/c` (s) for an atom–mirror distance `retro_distance_m`
/// (Le Gouët et al. 2007, Sec. 3.1).
pub fn retro_delay_s(retro_distance_m: f64) -> f64 {
    2.0 * retro_distance_m / SPEED_OF_LIGHT_M_S
}

/// Delay filter `|1 − e^{−i2πf·t_d}|² = 4·sin²(πf·t_d)` (dimensionless): the fraction of the
/// laser phase noise at `f` (Hz) that survives as Raman phase noise when the two beams
/// reach the atoms `t_d` (s) apart. It vanishes at `f = 0` — the common-mode part cancels —
/// and does not vanish above it.
pub fn delay_filter(f_hz: f64, delay_s: f64) -> f64 {
    let s = (PI * f_hz * delay_s).sin();
    4.0 * s * s
}

/// Per-shot phase variance (rad²) from **white laser frequency noise** `s_nu0_hz2_per_hz`
/// (Hz²/Hz) through the retro-reflection delay `delay_s` (s), in the `f·t_d ≪ 1` limit:
/// `σ_Φ² = (2π·t_d)²·S_ν⁰·π²/(4τ_R)` (Le Gouët et al. 2007, Eq. 11, with `S_ν` per hertz).
/// For a white-frequency-noise laser of Lorentzian full width `Δν`, `S_ν⁰ = Δν/π`.
pub fn delay_frequency_noise_variance_white(
    s_nu0_hz2_per_hz: f64,
    delay_s: f64,
    tau_r_s: f64,
) -> f64 {
    if tau_r_s <= 0.0 {
        return 0.0;
    }
    (2.0 * PI * delay_s).powi(2) * s_nu0_hz2_per_hz * PI * PI / (4.0 * tau_r_s)
}

/// Numeric per-shot phase variance (rad²) from a laser frequency-noise PSD `s_nu(f)`
/// (Hz²/Hz) through the delay `delay_s`, with the exact delay filter:
/// `∫₀^{f_hi} |H(2πf)|²·4·sin²(πf·t_d)·S_ν(f)/f² df` (Le Gouët et al. 2007, Eq. 9), trapezoid
/// rule on `n_steps` panels. The `f = 0` sample uses the limit `4sin²(πf t_d)/f² → (2π t_d)²`.
pub fn delay_frequency_noise_variance_numeric(
    pulse_sep_t: f64,
    tau_r_s: f64,
    delay_s: f64,
    s_nu: &dyn Fn(f64) -> f64,
    f_hi: f64,
    n_steps: usize,
) -> f64 {
    let n = n_steps.max(1);
    let df = f_hi / n as f64;
    let mut sum = 0.0;
    for i in 0..=n {
        let f = df * i as f64;
        let h = raman_phase_transfer_function(2.0 * PI * f, pulse_sep_t, tau_r_s);
        let filt = if f == 0.0 {
            (2.0 * PI * delay_s).powi(2)
        } else {
            delay_filter(f, delay_s) / (f * f)
        };
        let w = if i == 0 || i == n { 0.5 } else { 1.0 };
        sum += w * h * h * filt * s_nu(f);
    }
    sum * df
}

// ---------------------------------------------------------------------------------------
// RM-27: wavefront curvature
// ---------------------------------------------------------------------------------------

/// Per-axis velocity variance `σ_v² = k_B·T_atom/m` ((m/s)²) of a thermal cloud at
/// temperature `temperature_k` (K) of atoms of mass `mass_kg` (kg).
pub fn thermal_velocity_variance(temperature_k: f64, mass_kg: f64) -> f64 {
    BOLTZMANN_J_PER_K * temperature_k.max(0.0) / mass_kg
}

/// Interferometer phase (rad) picked up by one atom from an arbitrary single-beam wavefront
/// phase map `beam_phase(x, y)` (rad): `ΔΦ = δφ(r(t₁)) − 2δφ(r(t₁+T)) + δφ(r(t₁+2T))` for the
/// ballistic transverse path `r(t) = r₀ + v·t` (Schkolnik et al. 2015, Eq. 3).
/// `t_first_pulse_s` is the time from release to the first pulse.
pub fn wavefront_phase_shift(
    beam_phase: &dyn Fn(f64, f64) -> f64,
    r0: [f64; 2],
    v: [f64; 2],
    t_first_pulse_s: f64,
    pulse_sep_t: f64,
) -> f64 {
    let at = |t: f64| beam_phase(r0[0] + v[0] * t, r0[1] + v[1] * t);
    let t1 = t_first_pulse_s;
    at(t1) - 2.0 * at(t1 + pulse_sep_t) + at(t1 + 2.0 * pulse_sep_t)
}

/// The single-beam phase map of a wavefront curvature radius `radius_m` (m) at Raman
/// wavevector `k_eff` (rad/m): `δφ(r) = (k_eff/2)·r²/(2R)`.
pub fn defocus_beam_phase(k_eff: f64, radius_m: f64) -> impl Fn(f64, f64) -> f64 {
    move |x: f64, y: f64| 0.5 * k_eff * (x * x + y * y) / (2.0 * radius_m)
}

/// Wavefront-curvature acceleration bias (m/s²) of a cloud with per-axis velocity variance
/// `sigma_v2` ((m/s)²) and curvature radius `radius_m` (m), every atom counted:
/// `δg = σ_v²/R` (Louchet-Chauvet et al. 2011). The phase is `k_eff·σ_v²·T²/R`. The sign
/// follows `R`.
pub fn curvature_bias_accel(sigma_v2: f64, radius_m: f64) -> f64 {
    if radius_m == 0.0 || !radius_m.is_finite() {
        return 0.0;
    }
    sigma_v2 / radius_m
}

/// Mean `⟨|v_⊥|²⟩` ((m/s)²) of the atoms **counted** by a flat-top detection disc of radius
/// `detection_radius_m` at `detection_time_s` after release, for an isotropic Gaussian
/// cloud with initial per-axis position spread `cloud_radius_m` and per-axis velocity
/// variance `sigma_v2`. With `σ_d² = σ_r² + σ_v²·t_det²`, `ρ² = σ_v²·t_det²/σ_d²` and
/// `u = r_det²/(2σ_d²)`:
///
/// `⟨|v_⊥|²⟩_det = 2σ_v²·[1 − ρ²·(1 − h(u))]`,  `h(u) = 1 − u·e^{−u}/(1 − e^{−u})`.
///
/// Derivation: `v` given the detected position `r_d` is Gaussian with mean `(σ_v² t/σ_d²)·r_d`
/// and per-axis variance `σ_v²(1 − ρ²)`, and the 2-D Gaussian truncated to `|r_d| < r_det`
/// has `⟨|r_d|²⟩ = 2σ_d²·h(u)`. Limits: `r_det → ∞` gives `2σ_v²` (all atoms); a point
/// cloud (`σ_r → 0`, `ρ → 1`) with `r_det → 0` gives 0 (only atoms with `v ≈ 0` land in
/// the disc); a large initial cloud (`ρ → 0`) removes the velocity selection.
pub fn detected_transverse_v2(
    sigma_v2: f64,
    cloud_radius_m: f64,
    detection_radius_m: f64,
    detection_time_s: f64,
) -> f64 {
    let full = 2.0 * sigma_v2;
    if !detection_radius_m.is_finite() || detection_radius_m <= 0.0 {
        return full;
    }
    let sv_t2 = sigma_v2 * detection_time_s * detection_time_s;
    let sd2 = cloud_radius_m * cloud_radius_m + sv_t2;
    if sd2 <= 0.0 {
        return full;
    }
    let rho2 = sv_t2 / sd2;
    let u = detection_radius_m * detection_radius_m / (2.0 * sd2);
    // h(u) = 1 − u·e^{−u}/(1 − e^{−u}) = 1 − u/(e^{u} − 1); written with expm1 for small u.
    let h = if u > 700.0 { 1.0 } else { 1.0 - u / u.exp_m1() };
    full * (1.0 - rho2 * (1.0 - h))
}

/// Wavefront-curvature acceleration bias (m/s²) including the detection selection and the
/// initial cloud size: `δg = ⟨|v_⊥|²⟩_det/(2R)` with [`detected_transverse_v2`]. Equals
/// [`curvature_bias_accel`] when the detection disc is unbounded.
pub fn curvature_bias_with_detection(
    sigma_v2: f64,
    cloud_radius_m: f64,
    detection_radius_m: f64,
    detection_time_s: f64,
    radius_m: f64,
) -> f64 {
    if radius_m == 0.0 || !radius_m.is_finite() {
        return 0.0;
    }
    detected_transverse_v2(
        sigma_v2,
        cloud_radius_m,
        detection_radius_m,
        detection_time_s,
    ) / (2.0 * radius_m)
}

/// Equivalent curvature radius (m) of a Zernike defocus term `Z₂⁰` (Noll normalisation,
/// `c·√3·(2ρ² − 1)`) with coefficient `c_m` (m of optical path) over a pupil of radius
/// `pupil_radius_m`: the `r²` part `2√3·c·r²/a²` equals `r²/(2R)`, so `R = a²/(4√3·c)`.
/// Piston (`−√3·c`) does not enter the three-pulse phase.
pub fn zernike_defocus_to_radius(c_m: f64, pupil_radius_m: f64) -> f64 {
    if c_m == 0.0 {
        return f64::INFINITY;
    }
    pupil_radius_m * pupil_radius_m / (4.0 * 3f64.sqrt() * c_m)
}

/// Atom-cloud and detection parameters for the wavefront Monte Carlo.
#[derive(Clone, Copy, Debug)]
pub struct CloudGeometry {
    /// Per-axis transverse velocity variance `σ_v²` ((m/s)²).
    pub sigma_v2: f64,
    /// Initial per-axis transverse position spread `σ_r` (m).
    pub cloud_radius_m: f64,
    /// Time from release to the first Raman pulse (s).
    pub t_first_pulse_s: f64,
    /// Pulse separation `T` (s).
    pub pulse_sep_t: f64,
    /// Time from release to detection (s).
    pub detection_time_s: f64,
    /// Flat-top detection radius (m); `f64::INFINITY` counts every atom.
    pub detection_radius_m: f64,
}

/// Monte Carlo wavefront bias (m/s²): draws `n_atoms` atoms from the Gaussian cloud, keeps
/// those inside the detection disc, averages [`wavefront_phase_shift`] over them and divides
/// by `k_eff·T²` (the averaging of Schkolnik et al. 2015, Sec. 3). Works for any phase map,
/// so higher Zernike orders can be evaluated where no closed form exists. Returns
/// `(bias, detected_fraction)`.
pub fn wavefront_bias_monte_carlo(
    beam_phase: &dyn Fn(f64, f64) -> f64,
    k_eff: f64,
    cloud: &CloudGeometry,
    n_atoms: usize,
    seed: u64,
) -> (f64, f64) {
    use rand::SeedableRng;
    use rand_distr::{Distribution, Normal};
    let mut rng = rand_chacha::ChaCha8Rng::seed_from_u64(seed);
    let pos = Normal::new(0.0, cloud.cloud_radius_m.max(0.0)).expect("finite cloud radius");
    let vel = Normal::new(0.0, cloud.sigma_v2.max(0.0).sqrt()).expect("finite sigma_v");
    let r_det2 = cloud.detection_radius_m * cloud.detection_radius_m;
    let mut sum = 0.0;
    let mut kept = 0usize;
    for _ in 0..n_atoms {
        let r0 = [pos.sample(&mut rng), pos.sample(&mut rng)];
        let v = [vel.sample(&mut rng), vel.sample(&mut rng)];
        let xd = r0[0] + v[0] * cloud.detection_time_s;
        let yd = r0[1] + v[1] * cloud.detection_time_s;
        if xd * xd + yd * yd > r_det2 {
            continue;
        }
        kept += 1;
        sum += wavefront_phase_shift(beam_phase, r0, v, cloud.t_first_pulse_s, cloud.pulse_sep_t);
    }
    if kept == 0 {
        return (0.0, 0.0);
    }
    let scale = k_eff * cloud.pulse_sep_t * cloud.pulse_sep_t;
    (
        sum / kept as f64 / scale,
        kept as f64 / n_atoms.max(1) as f64,
    )
}

// ---------------------------------------------------------------------------------------
// RM-28: fringe-ambiguity resolution
// ---------------------------------------------------------------------------------------

/// Probability that a fringe index predicted with Gaussian error of standard deviation
/// `s_rad` (rad) is wrong: the error leaves `(−π, π)`, `P = erfc(π/(√2·s))`.
pub fn wrong_index_probability(s_rad: f64) -> f64 {
    if s_rad <= 0.0 {
        return 0.0;
    }
    libm::erfc(PI / (std::f64::consts::SQRT_2 * s_rad))
}

/// Classical-aided fringe-ambiguity failure probability: a classical accelerometer with
/// noise `sigma_classical_m_s2` predicts the phase `k_eff·T²·a_c`, the CAI reads the
/// wrapped phase with noise `sigma_phi_rad`, and the integer is wrong with probability
/// `erfc(π/(√2·s))`, `s² = (k_eff·T²·σ_c)² + σ_Φ²` (the hybrid scheme of Lautier et al.
/// 2014). With `σ_Φ = 0` this is `1 − erf(π/(k_eff·T²·σ_c·√2))`.
pub fn ambiguity_failure_probability(
    k_eff: f64,
    pulse_sep_t: f64,
    sigma_classical_m_s2: f64,
    sigma_phi_rad: f64,
) -> f64 {
    let pred = k_eff * pulse_sep_t * pulse_sep_t * sigma_classical_m_s2;
    wrong_index_probability(pred.hypot(sigma_phi_rad))
}

/// Resolve one wrapped fringe reading `phi_wrapped` (rad) with a classical specific-force
/// reading `a_classical_m_s2`: the fringe index `n = round((k_eff·T²·a_c − φ_w)/2π)` and the
/// unwrapped specific force `(φ_w + 2πn)/(k_eff·T²)` (m/s²).
pub fn resolve_with_classical(
    k_eff: f64,
    pulse_sep_t: f64,
    a_classical_m_s2: f64,
    phi_wrapped: f64,
) -> (i64, f64) {
    let scale = k_eff * pulse_sep_t * pulse_sep_t;
    let n = ((scale * a_classical_m_s2 - phi_wrapped) / (2.0 * PI)).round();
    (n as i64, (phi_wrapped + 2.0 * PI * n) / scale)
}

/// Largest classical-accelerometer noise (m/s²) that keeps the classical-aided failure
/// probability at or below `p_target`, by bisection on [`wrong_index_probability`].
/// Returns 0 when the CAI phase noise alone already exceeds the target.
pub fn max_classical_sigma_for_failure(
    k_eff: f64,
    pulse_sep_t: f64,
    sigma_phi_rad: f64,
    p_target: f64,
) -> f64 {
    if p_target <= 0.0 {
        return 0.0;
    }
    let (mut lo, mut hi) = (0.0_f64, 100.0_f64);
    for _ in 0..200 {
        let mid = 0.5 * (lo + hi);
        if wrong_index_probability(mid) > p_target {
            hi = mid;
        } else {
            lo = mid;
        }
    }
    let s = lo;
    if s <= sigma_phi_rad {
        return 0.0;
    }
    (s * s - sigma_phi_rad * sigma_phi_rad).sqrt() / (k_eff * pulse_sep_t * pulse_sep_t)
}

/// Two-interrogation-time failure probability: the short interferometer (`t_short`, phase
/// noise `sigma_phi_short`) predicts the long one's phase as `(T₂/T₁)²·φ₁`, so
/// `s² = ((T₂/T₁)²·σ_Φ₁)² + σ_Φ₂²` and `P = erfc(π/(√2·s))`. The short reading must itself
/// lie inside its unambiguous range `±π/(k_eff·T₁²)`.
pub fn multi_t_failure_probability(
    t_short: f64,
    t_long: f64,
    sigma_phi_short: f64,
    sigma_phi_long: f64,
) -> f64 {
    let ratio = (t_long / t_short).powi(2);
    wrong_index_probability((ratio * sigma_phi_short).hypot(sigma_phi_long))
}

/// Resolve the long-T wrapped phase with the short-T wrapped phase: index
/// `n = round(((T₂/T₁)²·φ₁ − φ₂)/2π)`, specific force `(φ₂ + 2πn)/(k_eff·T₂²)` (m/s²).
pub fn resolve_multi_t(
    k_eff: f64,
    t_short: f64,
    t_long: f64,
    phi_short_wrapped: f64,
    phi_long_wrapped: f64,
) -> (i64, f64) {
    let ratio = (t_long / t_short).powi(2);
    let n = ((ratio * phi_short_wrapped - phi_long_wrapped) / (2.0 * PI)).round();
    (
        n as i64,
        (phi_long_wrapped + 2.0 * PI * n) / (k_eff * t_long * t_long),
    )
}

#[cfg(test)]
mod tests {
    use super::*;
    use crate::inertial::quantum_imu::{
        accel_transfer_function, effective_wavevector, mach_zehnder_phase, max_unambiguous_accel,
        wrap_phase, RB87_D2_WAVELENGTH_M,
    };
    use rand::{Rng, SeedableRng};
    use rand_chacha::ChaCha8Rng;
    use rand_distr::{Distribution, Normal};

    // ── RM-26 ───────────────────────────────────────────────────────────────────────

    #[test]
    fn raman_transfer_short_pulse_limit_matches_the_acceleration_transfer_function() {
        // Phase response = ω² × acceleration response for short pulses (H_φ = ω²·H_a).
        let t = 0.01;
        for f in [3.0, 17.0, 55.5, 120.0] {
            let w = 2.0 * PI * f;
            let hp = raman_phase_transfer_function(w, t, 0.0);
            let ha = accel_transfer_function(w, t);
            assert!((hp - w * w * ha).abs() < 1e-9 * hp.max(1e-12), "f={f}");
            // A 1 µs pulse departs from the short-pulse limit at first order in ω·τ_R: the
            // argument of sin²(ωT/2) moves by about ω·τ_R, a relative change near
            // 2·ω·τ_R·|cot(ωT/2)| (3.3e-4 at 3 Hz, close to a zero; 1.7e-3 at 120 Hz).
            let tau_r = 1e-6;
            let finite = raman_phase_transfer_function(w, t, tau_r);
            let cot = 1.0 / (w * t / 2.0).tan();
            assert!(
                (finite - hp).abs() < 4.0 * w * tau_r * (1.0 + cot.abs()) * hp + 1e-9,
                "f={f}: {finite} vs {hp}"
            );
        }
        // Zeros at f_k = k/(T+2τ_R) (Cheinet et al. 2008, Sec. III).
        let tau = 20e-6;
        let fk = 3.0 / (t + 2.0 * tau);
        assert!(raman_phase_transfer_function(2.0 * PI * fk, t, tau) < 1e-9);
        // Regular at ω = Ω_R (removable singularity) and at ω = 0.
        let om = rabi_frequency_for_pi2_pulse(tau);
        assert!(raman_phase_transfer_function(om, t, tau).is_finite());
        assert_eq!(raman_phase_transfer_function(0.0, t, tau), 0.0);
    }

    #[test]
    fn white_raman_phase_closed_form_matches_quadrature() {
        // ∫|H(2πf)|²df = π²/(4τ_R): quadrature to 2 MHz plus the analytic 2Ω²/ω² tail.
        let (t, tau, s0) = (1e-3, 20e-6, 1e-11);
        let f_hi = 2.0e6;
        let numeric = raman_phase_variance_numeric(t, tau, &|_| s0, f_hi, 2_000_000);
        let om = rabi_frequency_for_pi2_pulse(tau);
        let tail = s0 * om * om / (2.0 * PI * PI * f_hi);
        let closed = raman_phase_variance_white(s0, tau);
        let rel = ((numeric + tail) - closed).abs() / closed;
        assert!(
            rel < 2e-3,
            "quadrature {numeric:.4e}+{tail:.2e} vs closed {closed:.4e}"
        );
        // T does not enter the white-noise result (Cheinet et al. 2008, Eq. 18).
        let numeric2 = raman_phase_variance_numeric(2e-3, tau, &|_| s0, f_hi, 2_000_000);
        assert!(((numeric2 + tail) - closed).abs() / closed < 2e-3);
    }

    #[test]
    fn short_pulse_band_limited_closed_form_matches_quadrature() {
        let (t, s0, fc) = (1e-3, 1e-12, 10_000.0);
        let numeric = raman_phase_variance_numeric(t, 0.0, &|_| s0, fc, 200_000);
        let closed = short_pulse_white_band_variance(s0, t, fc);
        assert!(
            (numeric - closed).abs() / closed < 1e-6,
            "{numeric} vs {closed}"
        );
        // Leading term 6·S₀·f_c: divergent in f_c, hence the need for the pulse duration.
        assert!((closed / (6.0 * s0 * fc) - 1.0).abs() < 1e-2);
    }

    #[test]
    fn cheinet_2008_white_phase_noise_requirement_is_reproduced() {
        // Cheinet et al. 2008 (IEEE TIM 57, 1141; arXiv:physics/0510197 Sec. IV, p. 11):
        // with τ_R = 20 µs the white Raman phase noise must be below −111 dB·rad²/Hz for
        // 1 mrad per shot. The paper derives the level with its Eq. 17 (flicker plus
        // white); the white part alone through Eq. 18 at one cycle gives 0.99 mrad.
        let s0 = 10f64.powf(-111.0 / 10.0);
        let sigma = raman_phase_variance_white(s0, 20e-6).sqrt();
        assert!((sigma - 1e-3).abs() / 1e-3 < 0.02, "σ_Φ = {sigma:.4e} rad");
    }

    #[test]
    fn delay_term_closed_form_matches_exact_filter_quadrature() {
        // Le Gouët et al. 2007, Eq. 9 (exact 4sin²(πf t_d) filter) vs Eq. 11 (f·t_d ≪ 1).
        let (t, tau) = (1e-3, 20e-6);
        let td = retro_delay_s(0.465); // 2L = 93 cm, t_d ≈ 3.1 ns (their set-up)
        assert!((td - 3.102e-9).abs() < 1e-11);
        let h0 = 1.0e3; // Hz²/Hz
        let f_hi = 2.0e6;
        let numeric = delay_frequency_noise_variance_numeric(t, tau, td, &|_| h0, f_hi, 2_000_000);
        let om = rabi_frequency_for_pi2_pulse(tau);
        let tail = (2.0 * PI * td).powi(2) * h0 * om * om / (2.0 * PI * PI * f_hi);
        let closed = delay_frequency_noise_variance_white(h0, td, tau);
        let rel = ((numeric + tail) - closed).abs() / closed;
        assert!(rel < 3e-3, "{numeric:.4e} vs {closed:.4e}");
        // No delay, no term (the co-propagating / zero-path-difference limit).
        assert_eq!(delay_frequency_noise_variance_white(h0, 0.0, tau), 0.0);
        assert_eq!(delay_filter(0.0, td), 0.0);
        // The term scales as L² (σ_Φ ∝ L, Le Gouët et al. 2007, Sec. 4.1).
        let c2 = delay_frequency_noise_variance_white(h0, retro_delay_s(0.93), tau);
        assert!((c2 / closed - 4.0).abs() < 1e-9);
    }

    // ── RM-27 ───────────────────────────────────────────────────────────────────────

    fn cloud(temp_k: f64, r_cloud: f64, r_det: f64) -> CloudGeometry {
        CloudGeometry {
            sigma_v2: thermal_velocity_variance(temp_k, RB87_MASS_KG),
            cloud_radius_m: r_cloud,
            t_first_pulse_s: 0.13,
            pulse_sep_t: 0.26,
            detection_time_s: 0.13 + 2.0 * 0.26 + 0.128,
            detection_radius_m: r_det,
        }
    }

    #[test]
    fn defocus_phase_is_position_independent_and_tilt_cancels() {
        let k = effective_wavevector(RB87_D2_WAVELENGTH_M);
        let r = 1000.0;
        let phase = defocus_beam_phase(k, r);
        let v = [0.012, -0.007];
        let expect = k * (v[0] * v[0] + v[1] * v[1]) * 0.26 * 0.26 / (2.0 * r);
        for r0 in [[0.0, 0.0], [0.003, -0.002], [-0.01, 0.004]] {
            let dphi = wavefront_phase_shift(&phase, r0, v, 0.13, 0.26);
            assert!(
                (dphi - expect).abs() < 1e-9 * expect.abs(),
                "{dphi} vs {expect}"
            );
        }
        // A tilt (linear phase) cancels exactly in φ₁ − 2φ₂ + φ₃.
        let tilt = |x: f64, y: f64| 3.0e4 * x - 1.0e4 * y;
        assert!(wavefront_phase_shift(&tilt, [0.002, 0.001], v, 0.13, 0.26).abs() < 1e-9);
    }

    #[test]
    fn curvature_bias_monte_carlo_matches_closed_form() {
        let k = effective_wavevector(RB87_D2_WAVELENGTH_M);
        let r = 500.0;
        let phase = defocus_beam_phase(k, r);
        // All atoms counted: δg = σ_v²/R.
        let c_all = cloud(3e-6, 3e-3, f64::INFINITY);
        let (mc, frac) = wavefront_bias_monte_carlo(&phase, k, &c_all, 200_000, 7);
        let closed = curvature_bias_accel(c_all.sigma_v2, r);
        assert_eq!(frac, 1.0);
        assert!(
            (mc - closed).abs() / closed < 0.01,
            "MC {mc:.4e} vs σ_v²/R {closed:.4e}"
        );
        // A 5 mm detection disc selects slow atoms; the closed form tracks the MC.
        let c_det = cloud(3e-6, 3e-3, 5e-3);
        let (mc_d, frac_d) = wavefront_bias_monte_carlo(&phase, k, &c_det, 400_000, 11);
        let closed_d =
            curvature_bias_with_detection(c_det.sigma_v2, 3e-3, 5e-3, c_det.detection_time_s, r);
        assert!(frac_d > 0.01 && frac_d < 0.9, "detected fraction {frac_d}");
        assert!(
            closed_d < closed,
            "detection selection must reduce the bias"
        );
        assert!(
            (mc_d - closed_d).abs() / closed_d < 0.02,
            "MC {mc_d:.4e} vs {closed_d:.4e}"
        );
    }

    #[test]
    fn curvature_bias_limiting_cases() {
        let sv2 = thermal_velocity_variance(2e-6, RB87_MASS_KG);
        // σ_v² = k_B T/m: 2 µK Rb-87 → (13.8 mm/s)².
        assert!((sv2.sqrt() - 0.013_83).abs() < 5e-5, "σ_v = {}", sv2.sqrt());
        // Linear in temperature, inverse in R, zero for a plane wave.
        let b = curvature_bias_accel(sv2, 1000.0);
        assert!((curvature_bias_accel(2.0 * sv2, 1000.0) / b - 2.0).abs() < 1e-12);
        assert!((curvature_bias_accel(sv2, 2000.0) / b - 0.5).abs() < 1e-12);
        assert_eq!(curvature_bias_accel(sv2, f64::INFINITY), 0.0);
        assert_eq!(curvature_bias_accel(0.0, 1000.0), 0.0);
        // Unbounded detection = no selection.
        let t_det = 0.79;
        assert_eq!(
            curvature_bias_with_detection(sv2, 3e-3, f64::INFINITY, t_det, 1000.0),
            b
        );
        // A huge initial cloud removes the velocity selection (ρ → 0): the bias departs
        // from σ_v²/R by at most ρ² = σ_v²t²/(σ_r² + σ_v²t²), here 1.2e-6.
        let big = curvature_bias_with_detection(sv2, 10.0, 5e-3, t_det, 1000.0);
        let rho2 = sv2 * t_det * t_det / (100.0 + sv2 * t_det * t_det);
        assert!(
            (big / b - 1.0).abs() <= rho2,
            "{} vs ρ² {rho2}",
            big / b - 1.0
        );
        // A point cloud seen through a vanishing disc counts only v ≈ 0 atoms.
        let tiny = curvature_bias_with_detection(sv2, 0.0, 1e-9, t_det, 1000.0);
        assert!(tiny.abs() < 1e-9 * b);
        // A larger initial cloud weakens the selection, so the bias rises toward σ_v²/R.
        let small_c = curvature_bias_with_detection(sv2, 1e-3, 5e-3, t_det, 1000.0);
        let large_c = curvature_bias_with_detection(sv2, 4e-3, 5e-3, t_det, 1000.0);
        assert!(small_c < large_c && large_c < b);
        // Zernike defocus of λ/10 rms coefficient over a 10 mm pupil radius.
        let rz = zernike_defocus_to_radius(78e-9, 0.01);
        assert!((rz - 0.01 * 0.01 / (4.0 * 3f64.sqrt() * 78e-9)).abs() < 1e-9 * rz);
        assert!(zernike_defocus_to_radius(0.0, 0.01).is_infinite());
    }

    // ── RM-28 ───────────────────────────────────────────────────────────────────────

    #[test]
    fn classical_aided_resolution_monte_carlo_matches_closed_form() {
        let k = effective_wavevector(RB87_D2_WAVELENGTH_M);
        let t = 0.01;
        let a_max = max_unambiguous_accel(k, t);
        let sigma_phi = 0.05;
        // Choose σ_c so P(wrong) is ≈ 10 %: s = π/(√2·erfc⁻¹(0.1)) ≈ 1.91 rad.
        let sigma_c = 1.9 / (k * t * t);
        let p = ambiguity_failure_probability(k, t, sigma_c, sigma_phi);
        assert!(p > 0.05 && p < 0.2, "p = {p}");
        let mut rng = ChaCha8Rng::seed_from_u64(42);
        let nc = Normal::new(0.0, sigma_c).unwrap();
        let np = Normal::new(0.0, sigma_phi).unwrap();
        let n = 200_000;
        let mut wrong = 0usize;
        for _ in 0..n {
            let a = rng.gen_range(-50.0 * a_max..50.0 * a_max);
            let phi_w = wrap_phase(mach_zehnder_phase(k, a, t) + np.sample(&mut rng));
            let (_, a_hat) = resolve_with_classical(k, t, a + nc.sample(&mut rng), phi_w);
            if (a_hat - a).abs() > a_max {
                wrong += 1;
            }
        }
        let mc = wrong as f64 / n as f64;
        let sd = (p * (1.0 - p) / n as f64).sqrt();
        assert!(
            (mc - p).abs() < 4.0 * sd,
            "MC {mc:.4} vs closed {p:.4} (±{sd:.4})"
        );
    }

    #[test]
    fn multi_t_resolution_monte_carlo_matches_closed_form() {
        let k = effective_wavevector(RB87_D2_WAVELENGTH_M);
        let (t1, t2) = (0.002, 0.01); // ratio² = 25
        let (s1, s2) = (0.07, 0.02);
        let p = multi_t_failure_probability(t1, t2, s1, s2);
        assert!(p > 0.01 && p < 0.3, "p = {p}");
        let a_max1 = max_unambiguous_accel(k, t1);
        let a_max2 = max_unambiguous_accel(k, t2);
        let mut rng = ChaCha8Rng::seed_from_u64(9);
        let n1 = Normal::new(0.0, s1).unwrap();
        let n2 = Normal::new(0.0, s2).unwrap();
        let n = 200_000;
        let mut wrong = 0usize;
        for _ in 0..n {
            // Signal inside the short interferometer's range (with margin for its noise).
            let a = rng.gen_range(-0.8 * a_max1..0.8 * a_max1);
            let p1 = wrap_phase(mach_zehnder_phase(k, a, t1) + n1.sample(&mut rng));
            let p2 = wrap_phase(mach_zehnder_phase(k, a, t2) + n2.sample(&mut rng));
            let (_, a_hat) = resolve_multi_t(k, t1, t2, p1, p2);
            if (a_hat - a).abs() > a_max2 {
                wrong += 1;
            }
        }
        let mc = wrong as f64 / n as f64;
        let sd = (p * (1.0 - p) / n as f64).sqrt();
        assert!(
            (mc - p).abs() < 4.0 * sd + 1e-3,
            "MC {mc:.4} vs closed {p:.4}"
        );
        // Range extension: the long-T range is 25× smaller, the short-T one sets the range.
        assert!((a_max1 / a_max2 - 25.0).abs() < 1e-9);
    }

    #[test]
    fn ambiguity_limits_and_inverse() {
        let k = effective_wavevector(RB87_D2_WAVELENGTH_M);
        let t = 0.05;
        // Perfect aiding never fails; the σ_Φ = 0 form is 1 − erf(π/(k T² σ_c √2)).
        assert_eq!(ambiguity_failure_probability(k, t, 0.0, 0.0), 0.0);
        let sc = 2e-5;
        let direct = 1.0 - libm::erf(PI / (k * t * t * sc * std::f64::consts::SQRT_2));
        assert!((ambiguity_failure_probability(k, t, sc, 0.0) - direct).abs() < 1e-12);
        // Monotone in σ_c and → 1 for a useless classical sensor.
        assert!(
            ambiguity_failure_probability(k, t, 2e-5, 0.01)
                > ambiguity_failure_probability(k, t, 1e-5, 0.01)
        );
        assert!(ambiguity_failure_probability(k, t, 1.0, 0.0) > 0.99);
        // Inverse: the largest σ_c at P = 1e-6 gives back P = 1e-6.
        let s_max = max_classical_sigma_for_failure(k, t, 0.01, 1e-6);
        let back = ambiguity_failure_probability(k, t, s_max, 0.01);
        assert!((back - 1e-6).abs() < 1e-9, "{back:.3e}");
        // One fringe is 2a_max = 7.8e-5 m/s² at T = 50 ms; P = 1e-6 needs σ_c ≈ a_max/4.9.
        assert!(s_max < max_unambiguous_accel(k, t) / 4.0);
        // A noisier CAI than the target allows → no classical sensor is good enough.
        assert_eq!(max_classical_sigma_for_failure(k, t, 1.0, 1e-6), 0.0);
        // Identical T is no help: ratio 1, s = √(σ₁² + σ₂²).
        let same = multi_t_failure_probability(0.01, 0.01, 0.3, 0.4);
        assert!((same - wrong_index_probability(0.5)).abs() < 1e-15);
    }
}
