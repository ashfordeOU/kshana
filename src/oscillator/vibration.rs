// SPDX-License-Identifier: AGPL-3.0-only
//! Acceleration sensitivity (g-sensitivity) to carrier phase jitter and PLL tracking threshold.
//!
//! A crystal, MEMS or atomic reference whose frequency moves with acceleration, `y(t) = Γ·a(t)`
//! (Γ in fractional frequency per g), phase-modulates every carrier the receiver derives from it.
//!
//! * **Sinusoidal vibration** of peak acceleration `A` (g) at `f_v` modulates a carrier `f_0` with
//!   index `β = Γ·A·f_0 / f_v` (rad), and the first sideband stands `L(f_v) = 20·log10|J1(β)/J0(β)|`
//!   dBc from the carrier (Filler, "The acceleration sensitivity of quartz crystal oscillators: a
//!   review", IEEE Trans. UFFC 35(3), 1988, pp. 297–305; small-index form `20·log10(β/2)`). The tests
//!   reproduce Tables I and II of that paper (5 MHz and 1575 MHz, 2e-9/g, 5 g peak) to 0.5 dB on seven
//!   of the eight rows; the eighth (β = 3.15, printed +2.3 dBc) is not reproduced by the Bessel ratio
//!   (−0.75 dBc) and is recorded rather than fitted. This is the module's one VALIDATED piece.
//! * **Random vibration** with one-sided acceleration spectral density `G(f)` (g²/Hz) gives the phase
//!   spectral density `S_φ(f) = (Γ·f_0)²·G(f)/f²` (rad²/Hz, from `φ = 2π f_0 ∫ y dt`), and the phase
//!   variance `σ_v² = ∫ S_φ(f) df`. In degrees this is the vibration-induced oscillator phase noise of
//!   the PLL error budget in Kaplan and Hegarty (eds.), *Understanding GPS: Principles and
//!   Applications*, 2nd ed., Artech House 2006, chapter 5 (carrier tracking-loop measurement errors).
//!   `G(f)` is given as breakpoints and interpolated linearly on log-log axes, as random-vibration test
//!   profiles are written; it is zero outside them.
//! * **Loop filtering.** The textbook budget integrates over the whole vibration band. A loop tracks
//!   phase wander well inside its bandwidth, so the module also reports the variance weighted by the
//!   loop's error response `|1 − H(j2πf)|²` for the standard second- and third-order loops (natural
//!   frequency `ω0 = B_n/0.53` with `a2 = 1.414`, and `ω0 = B_n/0.7845` with `a3 = 1.1`, `b3 = 2.4`;
//!   the loop-filter table of the same chapter).
//! * **Tracking threshold.** The PLL rule of thumb of the same chapter, `3σ_j + θ_e ≤ 45°` with
//!   `σ_j² = σ_t² + σ_v² + θ_A²`: thermal jitter `σ_t = (360/2π)·sqrt(B_n/(C/N0)·(1 + 1/(2T·C/N0)))`,
//!   Allan-deviation jitter `θ_A = k·σ_A(τ)·f_L/B_n` (k = 144 for a second-order loop, 160 for a
//!   third-order loop; τ = 1/B_n here, a modelling choice), and dynamic stress error
//!   `θ_e = 0.2809·(d²R/dt²)/B_n²` or `0.4828·(d³R/dt³)/B_n³` (degrees per second^n of carrier phase).
//!   The threshold is the C/N0 at which the rule is met with equality.
//!
//! MODELLED, apart from the sideband check above. The rule of thumb is a design threshold, not the
//! measured loss-of-lock point of any receiver.

use super::{field_err, positive, ClockRef, LABEL};
use serde::{Deserialize, Serialize};
use std::f64::consts::PI;

/// Speed of light, m/s.
const C_M_S: f64 = 299_792_458.0;

/// The PLL the carrier is tracked with.
#[derive(Clone, Debug, PartialEq, Serialize, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct PllConfig {
    /// Loop order, 2 or 3.
    pub order: u8,
    /// Noise bandwidth `B_n`, Hz.
    pub bandwidth_hz: f64,
    /// Predetection (coherent) integration time `T`, s.
    pub coherent_s: f64,
    /// Line-of-sight dynamics the loop must follow: acceleration (m/s²) for a second-order loop,
    /// jerk (m/s³) for a third-order loop.
    #[serde(default)]
    pub los_dynamics: f64,
}

/// One sinusoidal vibration line.
#[derive(Clone, Debug, PartialEq, Serialize, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct SineLine {
    /// Vibration frequency, Hz.
    pub freq_hz: f64,
    /// Peak acceleration, g.
    pub accel_g_peak: f64,
}

/// Input of `kshana oscillator vibration`.
#[derive(Clone, Debug, PartialEq, Serialize, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct VibrationInput {
    /// Carrier frequency, Hz (for example 1 575 420 000 for GPS L1).
    pub carrier_hz: f64,
    /// Acceleration sensitivity, fractional frequency per g.
    pub g_sensitivity_per_g: f64,
    /// Random-vibration profile, breakpoints `[f_hz, g2_per_hz]` in increasing frequency.
    #[serde(default)]
    pub random: Vec<(f64, f64)>,
    /// Sinusoidal lines.
    #[serde(default)]
    pub sine: Vec<SineLine>,
    /// The tracking loop.
    #[serde(rename = "loop")]
    pub pll: PllConfig,
    /// Allan deviation at `τ = 1/B_n`; when absent it comes from `clock`, and is zero when neither is
    /// given.
    #[serde(default)]
    pub adev_at_loop: Option<f64>,
    /// The reference oscillator, for its Allan deviation.
    #[serde(default)]
    pub clock: Option<ClockRef>,
    /// C/N0 values (dB-Hz) to tabulate the jitter at.
    #[serde(default)]
    pub cn0_dbhz: Vec<f64>,
}

/// A sinusoidal line's effect on the carrier.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct LineReport {
    /// Vibration frequency, Hz.
    pub freq_hz: f64,
    /// Peak acceleration, g.
    pub accel_g_peak: f64,
    /// Modulation index β, rad.
    pub beta_rad: f64,
    /// First sideband relative to the carrier, dBc.
    pub sideband_dbc: f64,
}

/// One row of the jitter table.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct JitterRow {
    /// C/N0, dB-Hz.
    pub cn0_dbhz: f64,
    /// Thermal jitter σ_t, degrees.
    pub thermal_deg: f64,
    /// `3σ_j + θ_e` with the whole-band vibration jitter, degrees.
    pub rule_deg_whole_band: f64,
    /// `3σ_j + θ_e` with the loop-filtered vibration jitter, degrees.
    pub rule_deg_loop_filtered: f64,
    /// `3σ_j + θ_e` with no vibration, degrees.
    pub rule_deg_no_vibration: f64,
}

/// Tracking thresholds, dB-Hz (`None`: the rule is not met at any C/N0 up to 80 dB-Hz).
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct Thresholds {
    /// With no vibration.
    pub no_vibration_dbhz: Option<f64>,
    /// With the whole-band vibration jitter (the textbook budget).
    pub whole_band_dbhz: Option<f64>,
    /// With the loop-filtered vibration jitter.
    pub loop_filtered_dbhz: Option<f64>,
}

/// Report of `kshana oscillator vibration`.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct VibrationReport {
    /// Evidence label of the jitter and threshold figures.
    pub label: &'static str,
    /// Evidence label of the sideband levels.
    pub sideband_label: &'static str,
    /// Vibration phase jitter over the whole band (random and sinusoidal), degrees.
    pub vibration_deg_whole_band: f64,
    /// Vibration phase jitter weighted by the loop's error response, degrees.
    pub vibration_deg_loop_filtered: f64,
    /// Allan-deviation jitter θ_A, degrees.
    pub allan_deg: f64,
    /// Allan deviation used for θ_A.
    pub adev_at_loop: f64,
    /// Dynamic stress error θ_e, degrees.
    pub dynamic_stress_deg: f64,
    /// Sinusoidal lines.
    pub lines: Vec<LineReport>,
    /// Tracking thresholds.
    pub thresholds: Thresholds,
    /// The jitter at the requested C/N0 values.
    pub table: Vec<JitterRow>,
}

/// Bessel function of the first kind, order `n` (0 or 1), by its power series. Accurate to well
/// below 1e-12 for `|x| ≤ 10`; larger indices are outside any oscillator sideband of interest and
/// fall back to the large-argument asymptotic form.
pub fn bessel_j(n: u32, x: f64) -> f64 {
    if x.abs() > 10.0 {
        let w = x - PI / 4.0 - n as f64 * PI / 2.0;
        return (2.0 / (PI * x.abs())).sqrt()
            * w.cos()
            * if x < 0.0 && n == 1 { -1.0 } else { 1.0 };
    }
    let h = x / 2.0;
    let mut term = h.powi(n as i32);
    for k in 1..=n {
        term /= k as f64;
    }
    let mut sum = term;
    for k in 1..60 {
        term *= -h * h / (k as f64 * (k + n) as f64);
        sum += term;
        if term.abs() < 1e-18 * sum.abs().max(1e-300) {
            break;
        }
    }
    sum
}

/// Modulation index `β = Γ·A·f_0 / f_v` (rad) of a sinusoidal vibration.
pub fn modulation_index(gamma_per_g: f64, accel_g_peak: f64, carrier_hz: f64, freq_hz: f64) -> f64 {
    gamma_per_g * accel_g_peak * carrier_hz / freq_hz
}

/// First sideband level, dBc: `20·log10|J1(β)/J0(β)|`.
pub fn sideband_dbc(beta: f64) -> f64 {
    20.0 * (bessel_j(1, beta) / bessel_j(0, beta)).abs().log10()
}

/// The vibration profile's spectral density at `f` (g²/Hz), log-log interpolated, zero outside.
pub fn psd_at(profile: &[(f64, f64)], f: f64) -> f64 {
    for w in profile.windows(2) {
        let ((f1, g1), (f2, g2)) = (w[0], w[1]);
        if f >= f1 && f <= f2 {
            if g1 <= 0.0 || g2 <= 0.0 {
                return 0.0;
            }
            let s = (g2 / g1).ln() / (f2 / f1).ln();
            return g1 * (f / f1).powf(s);
        }
    }
    0.0
}

/// `∫ G(f)/f² df` over the profile, in closed form segment by segment (each segment is a power law).
pub fn psd_over_f2_integral(profile: &[(f64, f64)]) -> f64 {
    let mut total = 0.0;
    for w in profile.windows(2) {
        let ((f1, g1), (f2, g2)) = (w[0], w[1]);
        if g1 <= 0.0 || g2 <= 0.0 || f2 <= f1 {
            continue;
        }
        let s = (g2 / g1).ln() / (f2 / f1).ln();
        let c = g1 * f1.powf(-s);
        let e = s - 1.0;
        total += if e.abs() < 1e-12 {
            c * (f2 / f1).ln()
        } else {
            c * (f2.powf(e) - f1.powf(e)) / e
        };
    }
    total
}

/// `|1 − H(j2πf)|²` of the standard second- or third-order loop of noise bandwidth `bn`.
pub fn loop_error_gain2(order: u8, bn: f64, f: f64) -> f64 {
    let w = 2.0 * PI * f;
    // Polynomials in s = jω, evaluated as (re, im).
    match order {
        2 => {
            let w0 = bn / 0.53;
            let a2 = 1.414;
            let num = w.powi(4);
            let re = w0 * w0 - w * w;
            let im = a2 * w0 * w;
            num / (re * re + im * im)
        }
        _ => {
            let w0 = bn / 0.7845;
            let (a3, b3) = (1.1, 2.4);
            let num = w.powi(6);
            // s³ + b3 ω0 s² + a3 ω0² s + ω0³ with s = jω: s² = −ω², s³ = −jω³.
            let re = w0.powi(3) - b3 * w0 * w * w;
            let im = a3 * w0 * w0 * w - w.powi(3);
            num / (re * re + im * im)
        }
    }
}

/// `∫ G(f)·|1−H|²/f² df`, numerically on a logarithmic grid (400 points per segment).
pub fn psd_over_f2_filtered(profile: &[(f64, f64)], order: u8, bn: f64) -> f64 {
    let mut total = 0.0;
    for w in profile.windows(2) {
        let ((f1, g1), (f2, g2)) = (w[0], w[1]);
        if f2 <= f1 || g1 <= 0.0 || g2 <= 0.0 {
            continue;
        }
        let n = 400;
        let (l1, l2) = (f1.ln(), f2.ln());
        let h = (l2 - l1) / n as f64;
        let slope = (g2 / g1).ln() / (l2 - l1);
        // Integrand in ln f: G/f² · |1−H|² · f, with G the segment's own power law (so the end
        // points never fall outside the segment by rounding).
        let g = |lf: f64| {
            let f = lf.exp();
            g1 * (slope * (lf - l1)).exp() * loop_error_gain2(order, bn, f) / f
        };
        let mut s = 0.5 * (g(l1) + g(l2));
        for i in 1..n {
            s += g(l1 + i as f64 * h);
        }
        total += s * h;
    }
    total
}

/// Thermal-noise phase jitter `σ_t` of a PLL, degrees.
pub fn thermal_jitter_deg(bn: f64, coherent_s: f64, cn0_dbhz: f64) -> f64 {
    let cn0 = 10f64.powf(cn0_dbhz / 10.0);
    (360.0 / (2.0 * PI)) * (bn / cn0 * (1.0 + 1.0 / (2.0 * coherent_s * cn0))).sqrt()
}

/// Allan-deviation jitter `θ_A`, degrees.
pub fn allan_jitter_deg(order: u8, adev: f64, carrier_hz: f64, bn: f64) -> f64 {
    let k = if order == 2 { 144.0 } else { 160.0 };
    k * adev * carrier_hz / bn
}

/// Dynamic stress error `θ_e`, degrees, from line-of-sight acceleration (order 2, m/s²) or jerk
/// (order 3, m/s³).
pub fn dynamic_stress_deg(order: u8, los_dynamics: f64, carrier_hz: f64, bn: f64) -> f64 {
    let deg = los_dynamics.abs() * 360.0 * carrier_hz / C_M_S;
    if order == 2 {
        0.2809 * deg / (bn * bn)
    } else {
        0.4828 * deg / (bn * bn * bn)
    }
}

/// The C/N0 (dB-Hz) at which `3·sqrt(σ_t² + other²) + θ_e = 45°`, or `None` when the rule is not met
/// at 80 dB-Hz. Returns 0 when it is met already at 0 dB-Hz.
pub fn tracking_threshold_dbhz(
    bn: f64,
    coherent_s: f64,
    other_deg: f64,
    stress_deg: f64,
) -> Option<f64> {
    let rule = |c: f64| {
        let t = thermal_jitter_deg(bn, coherent_s, c);
        3.0 * (t * t + other_deg * other_deg).sqrt() + stress_deg
    };
    if rule(80.0) > 45.0 {
        return None;
    }
    if rule(0.0) <= 45.0 {
        return Some(0.0);
    }
    let (mut lo, mut hi) = (0.0, 80.0);
    for _ in 0..100 {
        let mid = 0.5 * (lo + hi);
        if rule(mid) > 45.0 {
            lo = mid;
        } else {
            hi = mid;
        }
    }
    Some(hi)
}

/// Check the input.
fn validate(inp: &VibrationInput) -> Result<(), String> {
    positive("carrier_hz", inp.carrier_hz)?;
    if !(inp.g_sensitivity_per_g.is_finite() && inp.g_sensitivity_per_g >= 0.0) {
        return Err(field_err("g_sensitivity_per_g", inp.g_sensitivity_per_g));
    }
    if !matches!(inp.pll.order, 2 | 3) {
        return Err(field_err("loop.order", inp.pll.order as f64));
    }
    positive("loop.bandwidth_hz", inp.pll.bandwidth_hz)?;
    positive("loop.coherent_s", inp.pll.coherent_s)?;
    if !inp.pll.los_dynamics.is_finite() {
        return Err(field_err("loop.los_dynamics", inp.pll.los_dynamics));
    }
    if inp.random.len() > 200 || inp.sine.len() > 1000 || inp.cn0_dbhz.len() > 1000 {
        return Err(field_err("entries", 1000.0));
    }
    let mut last = 0.0;
    for &(f, g) in &inp.random {
        if !(f.is_finite() && f > last) {
            return Err(field_err("random.f_hz", f));
        }
        if !(g.is_finite() && g >= 0.0) {
            return Err(field_err("random.g2_per_hz", g));
        }
        last = f;
    }
    for l in &inp.sine {
        positive("sine.freq_hz", l.freq_hz)?;
        if !(l.accel_g_peak.is_finite() && l.accel_g_peak >= 0.0) {
            return Err(field_err("sine.accel_g_peak", l.accel_g_peak));
        }
    }
    for &c in &inp.cn0_dbhz {
        if !(c.is_finite() && (0.0..=100.0).contains(&c)) {
            return Err(field_err("cn0_dbhz", c));
        }
    }
    if let Some(a) = inp.adev_at_loop {
        if !(a.is_finite() && a >= 0.0) {
            return Err(field_err("adev_at_loop", a));
        }
    }
    Ok(())
}

/// Run the vibration model.
pub fn run(inp: &VibrationInput) -> Result<VibrationReport, String> {
    validate(inp)?;
    let (f0, gamma, p) = (inp.carrier_hz, inp.g_sensitivity_per_g, &inp.pll);
    let to_deg = 180.0 / PI;
    let k2 = (gamma * f0).powi(2);
    let mut var_whole = k2 * psd_over_f2_integral(&inp.random);
    let mut var_filt = k2 * psd_over_f2_filtered(&inp.random, p.order, p.bandwidth_hz);
    let mut lines = Vec::new();
    for l in &inp.sine {
        let beta = modulation_index(gamma, l.accel_g_peak, f0, l.freq_hz);
        var_whole += beta * beta / 2.0;
        var_filt += beta * beta / 2.0 * loop_error_gain2(p.order, p.bandwidth_hz, l.freq_hz);
        lines.push(LineReport {
            freq_hz: l.freq_hz,
            accel_g_peak: l.accel_g_peak,
            beta_rad: beta,
            sideband_dbc: sideband_dbc(beta),
        });
    }
    let sv_whole = var_whole.sqrt() * to_deg;
    let sv_filt = var_filt.sqrt() * to_deg;
    let adev = match (inp.adev_at_loop, &inp.clock) {
        (Some(a), _) => a,
        (None, Some(c)) => c.resolve()?.noise().adev(1.0 / p.bandwidth_hz),
        (None, None) => 0.0,
    };
    let theta_a = allan_jitter_deg(p.order, adev, f0, p.bandwidth_hz);
    let theta_e = dynamic_stress_deg(p.order, p.los_dynamics, f0, p.bandwidth_hz);
    let rss = |v: f64| (v * v + theta_a * theta_a).sqrt();
    let thresholds = Thresholds {
        no_vibration_dbhz: tracking_threshold_dbhz(p.bandwidth_hz, p.coherent_s, rss(0.0), theta_e),
        whole_band_dbhz: tracking_threshold_dbhz(
            p.bandwidth_hz,
            p.coherent_s,
            rss(sv_whole),
            theta_e,
        ),
        loop_filtered_dbhz: tracking_threshold_dbhz(
            p.bandwidth_hz,
            p.coherent_s,
            rss(sv_filt),
            theta_e,
        ),
    };
    let table = inp
        .cn0_dbhz
        .iter()
        .map(|&c| {
            let t = thermal_jitter_deg(p.bandwidth_hz, p.coherent_s, c);
            let rule = |v: f64| 3.0 * (t * t + v * v + theta_a * theta_a).sqrt() + theta_e;
            JitterRow {
                cn0_dbhz: c,
                thermal_deg: t,
                rule_deg_whole_band: rule(sv_whole),
                rule_deg_loop_filtered: rule(sv_filt),
                rule_deg_no_vibration: rule(0.0),
            }
        })
        .collect();
    Ok(VibrationReport {
        label: LABEL,
        sideband_label: "VALIDATED",
        vibration_deg_whole_band: sv_whole,
        vibration_deg_loop_filtered: sv_filt,
        allan_deg: theta_a,
        adev_at_loop: adev,
        dynamic_stress_deg: theta_e,
        lines,
        thresholds,
        table,
    })
}
