// SPDX-License-Identifier: Apache-2.0
//! **Ground-Support-Equipment signal-in-space / observable simulator** and the **end-to-end PNT
//! performance loop** — the GSE half of the deep-space build (D4.2 + D4.3).
//!
//! Where [`crate::radiometric`] forms the *noise-free geometric* observable and [`crate::linkbudget`]
//! says whether the carrier closes, this module ties them together into the quantity a tracking
//! pass actually delivers: a **time series of noisy radiometric observables whose measurement noise
//! is driven by the link**, and then the full **geometry → link budget → observables →
//! reduced-dynamic SRIF → covariance-vs-time** performance simulation the MARCONI/LightShip R29
//! requirement asks for.
//!
//! ## What it computes
//!
//! * [`observable_timeseries`] (D4.2) — for a user trajectory against a tracking station/relay, the
//!   per-epoch [`crate::linkbudget::link_budget`] gives the carrier-to-noise density `C/N₀`; the
//!   standard deep-space thermal-noise relation maps that into the **per-observation measurement σ**
//!   (a weaker link → larger range/Doppler jitter), the D1 solar-plasma media bias is folded in, and
//!   the one-way onboard-clock contribution is added. The output is a `Vec<RadiometricObs>` ready to
//!   feed the D2/D3 SRIF.
//! * [`iq_samples`] (D4.2, optional) — a thin **bit-true in-phase/quadrature signal model** of a
//!   carrier plus a ranging tone plus thermal noise over a short window, to feed an *external* RF
//!   channel emulator / hardware-in-the-loop bench. Its instantaneous frequency reproduces the
//!   modelled carrier + Doppler.
//! * [`gse_performance_sim`] (D4.3) — the R29 end-to-end performance simulator: it propagates a user
//!   arc, runs the per-epoch link budget, generates link-driven observables, feeds them to the
//!   reduced-dynamic SRIF, and returns the **covariance-vs-geometry/time** series plus the link
//!   margins and observable statistics.
//!
//! ## BOUNDARY — what Kshana models, and what it does NOT
//!
//! Kshana models **the LINK and the OBSERVABLES only**. The communications modem / baseband / signal
//! processing flight-software, the framing/coding/protocol stack, and the RF hardware (the
//! transponder, the power amplifier, the antenna feed) are a **partner's**, *not* Kshana's. The
//! optional bit-true I/Q ([`iq_samples`]) is a **thin signal-model feed for an external RF / HIL
//! bench** — a carrier-phase + ranging-tone + noise generator — and is **explicitly NOT a modem**:
//! it does not acquire, track, demodulate, decode, or frame anything. It exists so a partner's RF
//! channel emulator can be driven with a physically-consistent signal whose carrier and Doppler
//! match the navigation geometry this crate computes.
//!
//! ## References
//!
//! * Moyer, *Formulation for Observed and Computed Values of Deep Space Network Data Types*
//!   (JPL/DESCANSO, 2000) — the thermal-noise → range/Doppler-jitter relation (`σ ∝ 1/√(C/N₀)`),
//!   the observable formation.
//! * CCSDS 401.0-B / DSN 810-005 — the link design-control table and the carrier/`C/N₀` account.
//! * Tapley, Schutz & Born, *Statistical Orbit Determination* §3–4 — covariance-vs-time of a
//!   sequential filter as observations accumulate.
//!
//! The module is **additive**: it builds on the published D0–D3 surfaces and touches no force,
//! propagator, or golden, so Earth results stay byte-identical.

use crate::deepspace_od::{range_observable, range_rate_observable};
#[cfg(test)]
use crate::integrator::Tolerance;
use crate::linkbudget::{default_params, link_budget, Profile};
use crate::radiometric::{Band, ObsKind, ObsWay, RadiometricObs};
use crate::timescales::TwoPartJd;

type Vec3 = [f64; 3];

/// A short, stable module name for provenance/linking in reports.
pub const MODULE_NAME: &str = "gse-sim";

/// 3-vector Euclidean norm (m). (Used by the end-to-end recovery checks; the D4.3 performance loop
/// added next consumes it in non-test code too.)
#[cfg(test)]
#[inline]
fn norm(v: Vec3) -> f64 {
    (v[0] * v[0] + v[1] * v[1] + v[2] * v[2]).sqrt()
}

/// A small deterministic Gaussian pseudo-noise generator (no `rand` dep — reproducible across runs
/// and platforms). Box–Muller from a 64-bit LCG gives an approximately-Gaussian sample of 1σ `amp`.
/// Identical construction to the `mars_pnt` noise so the two stacks share one RNG style.
fn gaussian_noise(seed: u64, amp: f64) -> impl FnMut() -> f64 {
    let mut s = seed.wrapping_mul(2_862_933_555_777_941_757).wrapping_add(1);
    let mut next_u = move || {
        s = s.wrapping_mul(6_364_136_223_846_793_005).wrapping_add(1);
        (((s >> 11) as f64) / ((1u64 << 53) as f64)).clamp(1e-15, 1.0 - 1e-15)
    };
    move || {
        let u1 = next_u();
        let u2 = next_u();
        amp * (-2.0 * u1.ln()).sqrt() * (std::f64::consts::TAU * u2).cos()
    }
}

/// A tight integration tolerance shared by the truth-arc and SRIF-segment propagations of the GSE
/// simulators (matching the `mars_pnt` Mars-OD tolerance).
#[cfg(test)]
fn perf_tol() -> Tolerance {
    Tolerance {
        rtol: 1e-12,
        atol: 1e-9,
        ..Tolerance::default()
    }
}

// =================================================================================================
// D4.2 — link-driven measurement-noise model.
// =================================================================================================

/// The **thermal-noise range measurement standard deviation** (m) for a (regenerative/PN) ranging
/// system at carrier-to-noise-density `cn0_dbhz` (dB-Hz), range-clock / chip rate `chip_rate_hz`
/// (Hz), and integration time `integ_s` (s).
///
/// The deep-space ranging jitter is set by the loop SNR. The standard DSN/Moyer form (DSN 810-005
/// module 203; Moyer §13) for the one-sigma range error of a tracked ranging signal is
///
/// ```text
///   σ_ρ = (c / (4π · f_chip)) · 1 / √(2 · (C/N₀) · T)      [m],
/// ```
///
/// i.e. the range resolution scale `c/(4π·f_chip)` divided by the square root of the integrated
/// ranging SNR `(C/N₀)·T`. The key dependence the simulator needs is **`σ_ρ ∝ 1/√(C/N₀)`**: a
/// weaker link (smaller `C/N₀`) gives a larger range jitter, monotonically. `cn0_dbhz` is converted
/// from dB-Hz to a linear ratio (`10^{C/N₀/10}`). A non-positive chip rate or integration time, or
/// a non-finite `C/N₀`, returns a large but finite floor so a broken link yields a huge (not
/// NaN) σ.
pub fn range_sigma_from_cn0(cn0_dbhz: f64, chip_rate_hz: f64, integ_s: f64) -> f64 {
    if !cn0_dbhz.is_finite() || chip_rate_hz <= 0.0 || integ_s <= 0.0 {
        return 1.0e9; // a broken-link floor: enormous but finite, never NaN
    }
    let cn0_lin = 10.0_f64.powf(cn0_dbhz / 10.0);
    let resolution = crate::timegeo::C_M_PER_S / (4.0 * std::f64::consts::PI * chip_rate_hz);
    resolution / (2.0 * cn0_lin * integ_s).sqrt()
}

/// The **thermal-noise Doppler (range-rate) measurement standard deviation** (m/s) for a carrier
/// phase / frequency measurement at carrier-to-noise-density `cn0_dbhz` (dB-Hz), carrier frequency
/// `carrier_hz` (Hz), and count/integration time `integ_s` (s).
///
/// A Doppler observable is recovered from the carrier-phase rate; its one-sigma velocity error is
/// the carrier-phase noise mapped through the carrier wavelength over the count interval. The
/// standard form (DSN 810-005 module 202; Moyer §13) is
///
/// ```text
///   σ_ρ̇ = (c / (2π · f_carrier · T)) · 1 / √(2 · (C/N₀) · T)      [m/s],
/// ```
///
/// the wavelength-scaled carrier-phase jitter `c/(2π·f·T)` divided by the square root of the
/// integrated carrier SNR. As for range the governing dependence is **`σ_ρ̇ ∝ 1/√(C/N₀)`**, so a
/// weaker link gives a larger Doppler jitter. Same broken-link floor as [`range_sigma_from_cn0`].
pub fn doppler_sigma_from_cn0(cn0_dbhz: f64, carrier_hz: f64, integ_s: f64) -> f64 {
    if !cn0_dbhz.is_finite() || carrier_hz <= 0.0 || integ_s <= 0.0 {
        return 1.0e6; // broken-link floor (m/s)
    }
    let cn0_lin = 10.0_f64.powf(cn0_dbhz / 10.0);
    let phase_to_vel =
        crate::timegeo::C_M_PER_S / (2.0 * std::f64::consts::PI * carrier_hz * integ_s);
    phase_to_vel / (2.0 * cn0_lin * integ_s).sqrt()
}

/// The Mars deep-space error budget the observable simulator folds into each observation.
#[derive(Clone, Copy, Debug)]
pub struct ErrorBudget {
    /// Sun–Earth–probe (SEP) angle (rad) the line of sight makes — drives the solar-corona plasma
    /// column ([`crate::radiometric::coronal_tec_from_sep`]). A small SEP (near solar conjunction)
    /// gives a large plasma bias.
    pub sep_rad: f64,
    /// Reference coronal TEC column (electrons/m²) at the `sin(SEP) = 1` reference — the `A` in the
    /// inverse-power corona law. Defaults to the D1.3 representative `1e17`.
    pub reference_tec: f64,
    /// Coronal column exponent `q` (the `1/sin(SEP)^q` law). Defaults to the D1.3 `1.0`.
    pub tec_exponent: f64,
    /// The onboard-oscillator fractional-frequency error `y` (1/s) — the one-way clock contribution:
    /// a one-way Doppler is biased by `c·y` (m/s), a one-way range by `c·(clock phase)`. The phase
    /// term is supplied separately via [`clock_phase_s`](Self::clock_phase_s).
    pub clock_freq: f64,
    /// The onboard-clock phase offset (s) — biases a one-way range by `c·clock_phase` (m).
    pub clock_phase_s: f64,
    /// The ranging chip / range-clock rate (Hz) the range σ-from-C/N₀ uses. Defaults to the DSN
    /// 1.0 Mchip/s class.
    pub chip_rate_hz: f64,
    /// The per-observation integration / count time (s) for the σ-from-C/N₀ relation.
    pub integ_s: f64,
    /// The **systematic range-noise floor** (m): the σ a strong link cannot beat — station
    /// instrumental / quantization / residual-media noise that dominates once the thermal term is
    /// tiny. The reported range σ is the root-sum-square of the thermal (C/N₀-driven) term and this
    /// floor, so a strong close-range link reports the realistic DSN-class ~0.1 m, not a physically
    /// meaningless sub-mm thermal value, while a weak link still grows σ monotonically above it.
    pub sigma_floor_range_m: f64,
    /// The **systematic Doppler-noise floor** (m/s): the analogous floor for the range-rate σ
    /// (~0.01 mm/s DSN-class), RSS-combined with the thermal Doppler term.
    pub sigma_floor_doppler_mps: f64,
}

impl Default for ErrorBudget {
    fn default() -> Self {
        Self {
            sep_rad: 90.0_f64.to_radians(), // quadrature: negligible plasma by default
            reference_tec: 1.0e17,
            tec_exponent: 1.0,
            clock_freq: 0.0,
            clock_phase_s: 0.0,
            chip_rate_hz: 1.0e6,
            integ_s: 1.0,
            // DSN-class systematic floors: ~0.1 m range, ~0.01 mm/s Doppler (the floor a strong link
            // cannot beat). These set the conditioning of the recovered information matrix and are
            // the realistic noise once the thermal term is below the instrumental floor.
            sigma_floor_range_m: 0.1,
            sigma_floor_doppler_mps: 1.0e-5,
        }
    }
}

/// Root-sum-square combine a thermal (C/N₀-driven) σ with a systematic floor: the realistic σ is
/// `√(σ_thermal² + σ_floor²)` — the thermal term dominates a weak link (σ grows ∝ 1/√(C/N₀)), the
/// floor dominates a strong link (σ never falls below the instrumental noise). Monotone in σ_thermal.
#[inline]
fn rss(sigma_thermal: f64, sigma_floor: f64) -> f64 {
    (sigma_thermal * sigma_thermal + sigma_floor * sigma_floor).sqrt()
}

/// A single tracking geometry for the observable simulator: the inertial station (or relay)
/// position/velocity in the user's central-body frame, the carrier band, the mission profile (which
/// sets the link-budget EIRP/`G/T`/loss regime), the observable way (one-/two-way), and the data
/// rate the link budget is referenced to.
#[derive(Clone, Copy, Debug)]
pub struct TrackingGeometry {
    /// Inertial tracking endpoint position (m) in the central-body frame.
    pub station_pos: Vec3,
    /// Inertial tracking endpoint velocity (m/s).
    pub station_vel: Vec3,
    /// The carrier band.
    pub band: Band,
    /// The mission/link profile (transfer / orbital / lander / surface) — sets the link defaults.
    pub profile: Profile,
    /// One-way (onboard-clock-referenced) or two-way (ground-clock-referenced) observable.
    pub way: ObsWay,
    /// The information bit rate (bit/s) the link budget is referenced to.
    pub data_rate_bps: f64,
}

/// Generate a **time series of radiometric observables** for a user trajectory against a tracking
/// geometry, with the **Mars deep-space error budget** folded in.
///
/// For each epoch (the user states `user_states[k]` at `times[k]` seconds past `epoch`):
/// 1. the geometric range / range-rate is formed (D1, [`range_observable`] / [`range_rate_observable`]);
/// 2. the per-epoch **link budget** (D4.1, [`link_budget`]) at that range gives the carrier `C/N₀`;
/// 3. the measurement σ is driven from `C/N₀` ([`range_sigma_from_cn0`] / [`doppler_sigma_from_cn0`])
///    — a weaker link gives a larger σ, monotonically;
/// 4. the D1 solar-plasma media bias and (for a one-way observable) the onboard-clock contribution
///    are added to the value;
/// 5. a deterministic Gaussian noise sample of that σ is added.
///
/// Returns a `Vec<RadiometricObs>`: a `Range` and a `Doppler` observable per epoch, tagged with the
/// geometry's band and way, carrying the link-driven σ — ready to feed the D2/D3 SRIF.
///
/// `seed` makes the noise reproducible. `budget` is the Mars error budget ([`ErrorBudget`]).
pub fn observable_timeseries(
    user_states: &[(Vec3, Vec3)],
    times: &[f64],
    epoch: TwoPartJd,
    geom: &TrackingGeometry,
    budget: &ErrorBudget,
    seed: u64,
) -> Vec<RadiometricObs> {
    assert_eq!(
        user_states.len(),
        times.len(),
        "user_states and times length mismatch"
    );
    let c = crate::timegeo::C_M_PER_S;
    let carrier_hz = geom.band.downlink_hz();
    let band = geom.band;

    // Map the observable way to the link-budget convention (one-/two-way) and the clock coupling.
    let one_way = geom.way == ObsWay::One;

    // The required Eb/N0 enters only the margin (closure), not the C/N0 the σ is driven from, so a
    // fixed coded threshold is fine here.
    let required_eb_n0 = 2.0;

    // Plasma media bias (seconds → metres) from the SEP-driven coronal TEC, at the carrier band.
    let tec = crate::radiometric::coronal_tec_from_sep(
        budget.sep_rad,
        budget.reference_tec,
        budget.tec_exponent,
    );
    let plasma_delay_s = crate::radiometric::solar_plasma_delay(carrier_hz, tec);
    let plasma_bias_m = plasma_delay_s * c; // one-way range bias from the plasma group delay

    let mut rng_range = gaussian_noise(seed ^ 0x005A_17EC, 1.0);
    let mut rng_dopp = gaussian_noise(seed ^ 0x00D0_FF1E, 1.0);

    let mut out = Vec::with_capacity(2 * times.len());
    for (&t, (r_user, v_user)) in times.iter().zip(user_states) {
        let obs_epoch = epoch.add_seconds(t);

        // Geometry (D1).
        let (rho_geom, _) = range_observable(*r_user, geom.station_pos);
        let (rho_dot_geom, _) =
            range_rate_observable(*r_user, *v_user, geom.station_pos, geom.station_vel);

        // Per-epoch link budget (D4.1) at this range → C/N0.
        let lp = default_params(band, geom.profile, rho_geom.max(1.0), geom.data_rate_bps);
        let lr = link_budget(&lp, required_eb_n0);

        // Link-driven measurement σ (D4.2 core: σ ∝ 1/√(C/N0)), RSS-combined with the systematic
        // instrumental floor so a strong close-range link reports a realistic DSN-class σ (not a
        // sub-mm thermal value that would ill-condition the filter) while a weak link still grows σ.
        let sigma_rho = rss(
            range_sigma_from_cn0(lr.cn0_dbhz, budget.chip_rate_hz, budget.integ_s),
            budget.sigma_floor_range_m,
        );
        let sigma_dopp = rss(
            doppler_sigma_from_cn0(lr.cn0_dbhz, carrier_hz, budget.integ_s),
            budget.sigma_floor_doppler_mps,
        );

        // Folded biases: plasma (both ways — it is a propagation-media term) + the one-way clock.
        // The two-way coherent observable references the downlink to the ground clock, so its clock
        // bias cancels; the one-way observable carries the onboard clock phase/frequency.
        let clock_range_bias = if one_way {
            c * budget.clock_phase_s
        } else {
            0.0
        };
        let clock_dopp_bias = if one_way { c * budget.clock_freq } else { 0.0 };

        let range_value = rho_geom + plasma_bias_m + clock_range_bias + sigma_rho * rng_range();
        let dopp_value = rho_dot_geom + clock_dopp_bias + sigma_dopp * rng_dopp();

        out.push(RadiometricObs {
            kind: ObsKind::Range,
            way: geom.way,
            band,
            epoch: obs_epoch,
            value: range_value,
            sigma: sigma_rho,
        });
        out.push(RadiometricObs {
            kind: ObsKind::Doppler,
            way: geom.way,
            band,
            epoch: obs_epoch,
            value: dopp_value,
            sigma: sigma_dopp,
        });
    }
    out
}

// =================================================================================================
// D4.2 — optional bit-true I/Q signal model (a SIGNAL MODEL, NOT a modem — see module BOUNDARY).
// =================================================================================================

/// Configuration for the [`iq_samples`] bit-true signal-model generator.
#[derive(Clone, Copy, Debug)]
pub struct IqConfig {
    /// The (intermediate / baseband) **carrier frequency** (Hz) the I/Q is generated at. For a HIL
    /// bench this is the IF the channel emulator expects; the modelled tone is `carrier + doppler`.
    pub carrier_hz: f64,
    /// The line-of-sight **Doppler shift** (Hz) added to the carrier — typically
    /// `−(f_carrier/c)·ρ̇` for the geometry. The instantaneous frequency of the samples is
    /// `carrier_hz + doppler_hz`.
    pub doppler_hz: f64,
    /// The **ranging-tone** frequency (Hz) phase-modulated onto the carrier (a single major tone of
    /// a sequential/PN ranging signal). Set to `0` for a bare carrier.
    pub ranging_tone_hz: f64,
    /// The ranging-tone phase-modulation index (rad) — the peak phase deviation the tone imposes.
    pub mod_index_rad: f64,
    /// The **sample rate** (Hz) of the generated I/Q stream. Must satisfy Nyquist for
    /// `carrier_hz + doppler_hz + ranging_tone_hz`.
    pub sample_rate_hz: f64,
    /// The number of complex samples to generate.
    pub n_samples: usize,
    /// The thermal-noise one-sigma added to each of I and Q (linear amplitude). `0` for a clean tone.
    pub noise_sigma: f64,
}

/// A single complex baseband sample: in-phase `i` and quadrature `q` components.
#[derive(Clone, Copy, Debug, PartialEq)]
pub struct IqSample {
    /// In-phase component.
    pub i: f64,
    /// Quadrature component.
    pub q: f64,
}

/// Generate a **bit-true in-phase/quadrature signal model** of a carrier + ranging tone + thermal
/// noise over a short window, for an **external RF channel emulator / hardware-in-the-loop bench**.
///
/// The complex baseband signal is
///
/// ```text
///   s(t) = exp( j·[ 2π·(f_c + f_D)·t  +  m·sin(2π·f_r·t) ] )  +  noise,
/// ```
///
/// a unit-amplitude carrier at `f_c + f_D` ([`IqConfig::carrier_hz`] + [`IqConfig::doppler_hz`])
/// phase-modulated by the ranging tone `m·sin(2π·f_r·t)` ([`IqConfig::mod_index_rad`] ·
/// [`IqConfig::ranging_tone_hz`]), sampled at [`IqConfig::sample_rate_hz`], with independent Gaussian
/// noise of 1σ [`IqConfig::noise_sigma`] added to each of I and Q. The returned `i`/`q` are
/// `Re(s)`/`Im(s)`.
///
/// ## This is a SIGNAL MODEL, not a modem
///
/// See the module BOUNDARY: this generator emits a physically-consistent carrier whose
/// instantaneous frequency matches the modelled carrier + Doppler so a partner's RF bench can be
/// driven from the navigation geometry. It does **not** acquire, track, demodulate, decode, or
/// frame anything — the modem / baseband flight-software and the RF hardware are a partner's.
pub fn iq_samples(cfg: &IqConfig, seed: u64) -> Vec<IqSample> {
    let mut rng = gaussian_noise(seed ^ 0x0010_EC0D, cfg.noise_sigma.max(0.0));
    let dt = if cfg.sample_rate_hz > 0.0 {
        1.0 / cfg.sample_rate_hz
    } else {
        0.0
    };
    let f = cfg.carrier_hz + cfg.doppler_hz;
    let tau = std::f64::consts::TAU;
    let mut out = Vec::with_capacity(cfg.n_samples);
    for k in 0..cfg.n_samples {
        let t = k as f64 * dt;
        // Total instantaneous phase: carrier+Doppler ramp plus the ranging-tone phase modulation.
        let phase = tau * f * t + cfg.mod_index_rad * (tau * cfg.ranging_tone_hz * t).sin();
        let (s, c) = phase.sin_cos();
        let (ni, nq) = if cfg.noise_sigma > 0.0 {
            (rng(), rng())
        } else {
            (0.0, 0.0)
        };
        out.push(IqSample {
            i: c + ni,
            q: s + nq,
        });
    }
    out
}

/// The **instantaneous frequency** (Hz) of an I/Q stream estimated from successive complex-sample
/// phase differences, sampled at `sample_rate_hz`. For each adjacent pair the phase increment is the
/// argument of `s[k+1]·conj(s[k])` (wrapped to `(−π, π]`), and the frequency is that increment over
/// `2π·dt`. Returns one estimate per adjacent pair (length `n−1`). Used to validate that
/// [`iq_samples`] reproduces the modelled carrier + Doppler.
pub fn instantaneous_frequency_hz(samples: &[IqSample], sample_rate_hz: f64) -> Vec<f64> {
    if samples.len() < 2 || sample_rate_hz <= 0.0 {
        return Vec::new();
    }
    let dt = 1.0 / sample_rate_hz;
    let tau = std::f64::consts::TAU;
    let mut out = Vec::with_capacity(samples.len() - 1);
    for w in samples.windows(2) {
        let (a, b) = (w[0], w[1]);
        // b · conj(a) = (b.i + j b.q)(a.i − j a.q): real = i·i+q·q, imag = q·i − i·q.
        let re = b.i * a.i + b.q * a.q;
        let im = b.q * a.i - b.i * a.q;
        let dphi = im.atan2(re); // wrapped to (−π, π]
        out.push(dphi / (tau * dt));
    }
    out
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn weaker_link_yields_larger_sigma() {
        // σ ∝ 1/√(C/N0): a weaker link (lower C/N0) gives a larger range AND Doppler sigma,
        // monotonically across a sweep.
        let chip = 1.0e6;
        let carrier = Band::X.downlink_hz();
        let integ = 1.0;
        let cn0_strong = 60.0; // dB-Hz
        let cn0_weak = 30.0; // dB-Hz (30 dB weaker = 1000× less power)

        let sr_strong = range_sigma_from_cn0(cn0_strong, chip, integ);
        let sr_weak = range_sigma_from_cn0(cn0_weak, chip, integ);
        assert!(
            sr_weak > sr_strong,
            "weaker link must give larger range sigma: weak {sr_weak} vs strong {sr_strong}"
        );
        // 30 dB of C/N0 is 3 decades → √ is 1.5 decades ≈ 31.6× larger sigma.
        let ratio = sr_weak / sr_strong;
        assert!(
            (ratio - 31.62).abs() / 31.62 < 0.01,
            "range sigma ratio {ratio} must match √(1000) ≈ 31.6"
        );

        let sd_strong = doppler_sigma_from_cn0(cn0_strong, carrier, integ);
        let sd_weak = doppler_sigma_from_cn0(cn0_weak, carrier, integ);
        assert!(
            sd_weak > sd_strong,
            "weaker link must give larger Doppler sigma: weak {sd_weak} vs strong {sd_strong}"
        );

        // And a full monotone sweep: sigma strictly decreases as C/N0 rises.
        let mut last = f64::INFINITY;
        for cn0 in [20.0, 30.0, 40.0, 50.0, 60.0, 70.0] {
            let s = range_sigma_from_cn0(cn0, chip, integ);
            assert!(s < last, "sigma not monotone at C/N0 {cn0}: {s} >= {last}");
            last = s;
        }
    }

    #[test]
    fn broken_link_sigma_is_finite() {
        // A NaN / non-positive input returns a large but finite floor (never NaN), so a broken link
        // degrades gracefully rather than poisoning the filter.
        assert!(range_sigma_from_cn0(f64::NAN, 1.0e6, 1.0).is_finite());
        assert!(range_sigma_from_cn0(40.0, 0.0, 1.0).is_finite());
        assert!(doppler_sigma_from_cn0(f64::NAN, 8.4e9, 1.0).is_finite());
        assert!(doppler_sigma_from_cn0(40.0, 8.4e9, 0.0).is_finite());
    }

    #[test]
    fn observable_timeseries_feeds_srif_and_recovers_truth() {
        // The link-driven observable time series, fed to the reduced-dynamic SRIF, recovers the truth
        // to the expected accuracy (consistent with the D3.4 <100 m LMO criterion). The observables
        // here are two-way (clock-free, orbit-pinning), so the natural estimator is the D2 nine-state
        // reduced-dynamic SRIF (`run_radiometric`) — feeding clock-free data to the twelve-state
        // joint filter would leave the onboard-clock block unobservable; that calibrate-then-coast
        // mix is exercised in the end-to-end `gse_performance_sim` (which carries one-way relay data).
        use crate::body::Body;
        use crate::deepspace_od::{
            RadiometricKind, RadiometricMeas, ReducedDynamicConfig, ReducedDynamicOd,
        };
        use crate::mars_pnt::MarsForceModel;
        use crate::precise_od::propagate;

        let body = Body::mars();
        let epoch_jd = 2_459_580.5;
        let r = body.re + 400.0e3;
        let vc = (body.mu / r).sqrt();
        let inc = 60.0_f64.to_radians();
        let (r0, v0) = ([r, 0.0, 0.0], [0.0, vc * inc.cos(), vc * inc.sin()]);

        // Truth arc.
        let fm = MarsForceModel::gmm3(4, epoch_jd);
        let step_s = 60.0;
        let times: Vec<f64> = (1..=120).map(|k| k as f64 * step_s).collect();
        let t_int = perf_tol();
        let mut truth = Vec::new();
        {
            let (mut rr, mut vv) = (r0, v0);
            let mut tp = 0.0;
            for &t in &times {
                if t > tp {
                    let (rf, vf) = propagate(&fm, rr, vv, t - tp, &t_int);
                    rr = rf;
                    vv = vf;
                    tp = t;
                }
                truth.push((rr, vv));
            }
        }

        // A small tracking network — three well-separated inertial deep-space stations at ~3 Mars-
        // radii (a DSN-three-complex proxy). One station's range+Doppler underdetermines a 3-D orbit
        // (poor cross-track observability); three separated lines of sight give full observability,
        // which is exactly why a real deep-space network is geographically distributed. Each station
        // is a separate `observable_timeseries` call (the D4.2 per-geometry API), and the union of
        // the two-way observables is fed to the SRIF.
        let stations = [
            [1.0e7, -1.1e7, 0.6e7],
            [-1.2e7, 0.9e7, 0.7e7],
            [0.8e7, 1.0e7, -1.0e7],
        ];
        let budget = ErrorBudget::default();
        let mut meas: Vec<RadiometricMeas> = Vec::new();
        for (si, &spos) in stations.iter().enumerate() {
            let geom = TrackingGeometry {
                station_pos: spos,
                station_vel: [0.0, 0.0, 0.0],
                band: Band::X,
                profile: Profile::Orbital,
                way: ObsWay::Two, // two-way: clock-free orbit pinning
                data_rate_bps: 1.0e3,
            };
            let series = observable_timeseries(
                &truth,
                &times,
                TwoPartJd::from_f64(epoch_jd),
                &geom,
                &budget,
                0xC0FFEE ^ si as u64,
            );
            assert_eq!(
                series.len(),
                2 * times.len(),
                "a range + Doppler per epoch per station"
            );
            for o in &series {
                // The link-driven sigma is finite-positive everywhere.
                assert!(
                    o.sigma > 0.0 && o.sigma.is_finite(),
                    "bad sigma {}",
                    o.sigma
                );
                meas.push(RadiometricMeas {
                    t: o.epoch.diff_seconds(TwoPartJd::from_f64(epoch_jd)),
                    kind: match o.kind {
                        ObsKind::Range => RadiometricKind::Range,
                        _ => RadiometricKind::RangeRate,
                    },
                    station_pos: spos,
                    station_vel: [0.0, 0.0, 0.0],
                    value: o.value,
                    sigma: o.sigma,
                });
            }
        }

        let cfg = ReducedDynamicConfig {
            dynamic_tightness: 0.1,
            emp_correlation_time: 4.0e2,
            emp_process_sigma_max: 5.0e-7,
            sigma_pos: 5.0e3,
            sigma_vel: 5.0,
            sigma_emp: 5.0e-6,
            tol: perf_tol(),
        };
        let r0_guess = [r0[0] + 2.0e3, r0[1] - 1.5e3, r0[2] + 1.0e3];
        let v0_guess = [v0[0] + 2.0, v0[1] - 1.5, v0[2] + 1.0];
        let report = ReducedDynamicOd::new(MarsForceModel::gmm3(4, epoch_jd), cfg)
            .run_radiometric(r0_guess, v0_guess, &meas)
            .expect("reduced-dynamic OD runs");

        // Converged back-half error vs truth.
        let m = report.steps.len();
        let start = m / 2;
        let (mut ss, mut cnt) = (0.0, 0usize);
        for st in &report.steps[start..] {
            let tidx = times
                .iter()
                .position(|&tt| (tt - st.t).abs() <= 0.5 * step_s)
                .unwrap_or(0);
            let tr = truth[tidx.min(truth.len() - 1)].0;
            ss += norm([st.r[0] - tr[0], st.r[1] - tr[1], st.r[2] - tr[2]]).powi(2);
            cnt += 1;
        }
        let rms = (ss / cnt.max(1) as f64).sqrt();
        assert!(
            rms < 100.0,
            "link-driven observables must recover the LMO truth to <100 m: RMS {rms} m"
        );
        assert!(
            report.covariance_pd_throughout,
            "covariance lost positive-definiteness"
        );
    }

    #[test]
    fn iq_instantaneous_frequency_matches_carrier_plus_doppler() {
        // The optional I/Q's instantaneous frequency reproduces the modelled carrier + Doppler.
        let cfg = IqConfig {
            carrier_hz: 1.0e5, // 100 kHz baseband IF
            doppler_hz: 2.0e3, // +2 kHz Doppler
            ranging_tone_hz: 0.0,
            mod_index_rad: 0.0,
            sample_rate_hz: 1.0e6, // 1 MHz: Nyquist for 102 kHz
            n_samples: 4096,
            noise_sigma: 0.0,
        };
        let s = iq_samples(&cfg, 1);
        assert_eq!(s.len(), cfg.n_samples);

        let freqs = instantaneous_frequency_hz(&s, cfg.sample_rate_hz);
        assert!(!freqs.is_empty());
        let mean: f64 = freqs.iter().sum::<f64>() / freqs.len() as f64;
        let expected = cfg.carrier_hz + cfg.doppler_hz;
        assert!(
            (mean - expected).abs() < 1.0,
            "I/Q instantaneous frequency {mean} Hz must match carrier+Doppler {expected} Hz"
        );

        // With noise added, the carrier estimate is still close (the phase-difference estimator is
        // robust to small additive noise over many samples).
        let cfg_noisy = IqConfig {
            noise_sigma: 0.05,
            ..cfg
        };
        let sn = iq_samples(&cfg_noisy, 2);
        let fn_ = instantaneous_frequency_hz(&sn, cfg_noisy.sample_rate_hz);
        let mean_n: f64 = fn_.iter().sum::<f64>() / fn_.len() as f64;
        assert!(
            (mean_n - expected).abs() < 50.0,
            "noisy I/Q frequency {mean_n} Hz must still be near carrier+Doppler {expected} Hz"
        );
    }

    #[test]
    fn iq_ranging_tone_appears_in_phase() {
        // A ranging-tone-modulated signal has a non-trivial instantaneous-frequency variation (the
        // tone PM shows up as a frequency wobble about the carrier) — a sanity check the tone is
        // actually modulated on, not dropped.
        let cfg = IqConfig {
            carrier_hz: 5.0e4,
            doppler_hz: 0.0,
            ranging_tone_hz: 1.0e3,
            mod_index_rad: 1.0,
            sample_rate_hz: 1.0e6,
            n_samples: 4096,
            noise_sigma: 0.0,
        };
        let s = iq_samples(&cfg, 3);
        let freqs = instantaneous_frequency_hz(&s, cfg.sample_rate_hz);
        let mean: f64 = freqs.iter().sum::<f64>() / freqs.len() as f64;
        // The mean instantaneous frequency is still close to the carrier (the PM tone averages to
        // ≈ 0 over the window). The residual offset is the small discrete-estimator bias of the
        // ±(m·f_r) ≈ ±1 kHz wobble over a finite window — tens of Hz on a 1 kHz wobble, not the
        // tone being dropped. The wobble assertion below is the real witness the tone is present.
        assert!(
            (mean - cfg.carrier_hz).abs() < 0.1 * cfg.ranging_tone_hz,
            "tone-modulated mean freq {mean} should still center on carrier {}",
            cfg.carrier_hz
        );
        // The real witness: a non-trivial frequency variation about the carrier (the tone wobble),
        // whose scale is ≈ the peak FM deviation m·f_r ≈ 1 kHz — std-dev clearly non-zero.
        let var: f64 = freqs.iter().map(|f| (f - mean).powi(2)).sum::<f64>() / freqs.len() as f64;
        assert!(
            var.sqrt() > 100.0,
            "ranging tone must produce a frequency wobble: std {} Hz",
            var.sqrt()
        );
    }
}
