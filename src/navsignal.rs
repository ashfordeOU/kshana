// SPDX-License-Identifier: Apache-2.0
//! **Nav-signal modulation, correlation and code-tracking performance.**
//!
//! Kshana already models the *link budget* ([`crate::linkbudget`]) and the
//! *measurement domain* ([`crate::gnss_sim`]). This module adds the missing
//! middle: the **signal level** — the spreading modulation's power spectral
//! density, the spectral separation against an interferer, the RMS (Gabor)
//! bandwidth that sets the ranging-information content, and the resulting
//! **code-tracking performance** (DLL thermal-noise jitter and the multipath
//! error envelope).
//!
//! Scope is deliberately the **signal-performance** layer that a navigation
//! feasibility trade needs — *not* RF payload / antenna hardware design, which
//! remains a payload partner's job. What this enables: choosing a nav-signal
//! modulation (BPSK-R vs BOC), sizing its anti-jam and multipath behaviour, and
//! deriving the spectral-separation coefficient `Q` that the anti-jam equation in
//! [`crate::jamming`] previously took as a representative constant.
//!
//! References: Betz, *Binary Offset Carrier Modulations for Radionavigation*
//! (NAVIGATION, 2001); Kaplan & Hegarty, *Understanding GPS/GNSS* (3rd ed., §8);
//! Julien, *Design of Galileo L1F Receiver Tracking Loops* (2005).

use std::f64::consts::PI;

/// The chip-rate base unit `f₀ = 1.023 MHz` (the GPS/Galileo reference rate).
pub const F0_HZ: f64 = 1_023_000.0;

/// `sin(x)/x`, with the removable singularity at the origin handled.
fn sinc(x: f64) -> f64 {
    if x.abs() < 1e-12 {
        1.0
    } else {
        x.sin() / x
    }
}

/// A GNSS spreading modulation.
#[derive(Clone, Copy, Debug, PartialEq)]
pub enum Modulation {
    /// **BPSK-R(n)** — rectangular spreading code at `n · 1.023` Mcps
    /// (GPS C/A is `BpskR { n: 1.0 }`, P(Y) is `n = 10`).
    BpskR { n: f64 },
    /// **Sine-phased BOC(m, n)** — a square-wave subcarrier at `m · 1.023` MHz on
    /// a code at `n · 1.023` Mcps (Galileo E1 OS is `BocSin { m: 1.0, n: 1.0 }`).
    BocSin { m: f64, n: f64 },
}

impl Modulation {
    /// Spreading-code chip rate `R_c` (chips/s).
    pub fn chip_rate_hz(&self) -> f64 {
        match *self {
            Modulation::BpskR { n } => n * F0_HZ,
            Modulation::BocSin { n, .. } => n * F0_HZ,
        }
    }

    /// **Unit-area baseband power spectral density** `G(f)` (1/Hz) at frequency
    /// offset `f_hz` from the carrier. Normalised so `∫ G df = 1` over all `f`
    /// (Betz 2001). For BPSK-R this is `T_c · sinc²(πf T_c)`; for sine-BOC it is
    /// the split-spectrum form with its null at the carrier and peaks at `±f_s`.
    pub fn psd(&self, f_hz: f64) -> f64 {
        match *self {
            Modulation::BpskR { n } => {
                let tc = 1.0 / (n * F0_HZ);
                tc * sinc(PI * f_hz * tc).powi(2)
            }
            Modulation::BocSin { m, n } => {
                let fc = n * F0_HZ; // code rate
                let fs = m * F0_HZ; // subcarrier rate
                if f_hz.abs() < 1e-9 {
                    return 0.0; // sine-BOC has a spectral null at the carrier
                }
                let arg_sub = PI * f_hz / (2.0 * fs);
                let cos_sub = arg_sub.cos();
                if cos_sub.abs() < 1e-9 {
                    // f = odd multiple of f_s: the closed form is 0·∞; the true PSD
                    // is finite but this exact point has zero measure under the
                    // integration grid. Return a finite neighbour value.
                    let eps = 1e-6 * fs;
                    return self.psd(f_hz + eps);
                }
                let n_half = 2.0 * fs / fc; // number of subcarrier half-periods/chip
                let n_even = (n_half.round() as i64) % 2 == 0;
                let num_code = if n_even {
                    (PI * f_hz / fc).sin()
                } else {
                    (PI * f_hz / fc).cos()
                };
                let factor = num_code * arg_sub.sin() / (PI * f_hz * cos_sub);
                fc * factor.powi(2)
            }
        }
    }
}

/// Numerically integrate `g` over `[-half, half]` with `n` Simpson panels
/// (`n` is forced even).
fn integrate(half: f64, n: usize, g: impl Fn(f64) -> f64) -> f64 {
    let n = if n % 2 == 0 { n.max(2) } else { n + 1 };
    let h = 2.0 * half / n as f64;
    let mut s = g(-half) + g(half);
    for i in 1..n {
        let f = -half + i as f64 * h;
        s += if i % 2 == 1 { 4.0 } else { 2.0 } * g(f);
    }
    s * h / 3.0
}

/// **RMS (Gabor) bandwidth** `β = √(∫ f² G(f) df / ∫ G(f) df)` (Hz) over a
/// double-sided front-end bandwidth `band_hz`. The Gabor bandwidth sets the
/// Cramér–Rao ranging-accuracy floor — a larger `β` (BOC pushes power to the band
/// edges) means more ranging information per dB of `C/N₀`.
pub fn rms_bandwidth_hz(m: &Modulation, band_hz: f64) -> f64 {
    let half = band_hz / 2.0;
    let n = 20_000;
    let num = integrate(half, n, |f| f * f * m.psd(f));
    let den = integrate(half, n, |f| m.psd(f));
    (num / den.max(1e-300)).sqrt()
}

/// **Spectral separation coefficient** `κ = ∫ G_s(f) · G_i(f) df` (1/Hz) over a
/// double-sided receiver bandwidth `band_hz` (Betz/Kaplan). It quantifies how
/// much a unit-power interferer with spectrum `intf` overlaps the signal `sig`:
/// the smaller `κ`, the better the spectral separation (the whole point of BOC).
pub fn spectral_separation_coeff(sig: &Modulation, intf: &Modulation, band_hz: f64) -> f64 {
    let half = band_hz / 2.0;
    integrate(half, 40_000, |f| sig.psd(f) * intf.psd(f))
}

/// Spectral separation coefficient against **matched wideband (white) noise**
/// flat over the receiver band: `κ = ∫ G_s(f) · (1/band) df` (1/Hz) — the
/// worst-case broadband jammer reference.
pub fn ssc_vs_white(sig: &Modulation, band_hz: f64) -> f64 {
    let half = band_hz / 2.0;
    integrate(half, 40_000, |f| sig.psd(f)) / band_hz
}

/// The **equivalent spectral-separation coefficient `Q`** used by the anti-jam
/// equation in [`crate::jamming::effective_cn0_dbhz`]
/// (`(C/N₀)_eff = [1/(C/N₀) + (J/S)/(Q·R_c)]⁻¹`). The rigorous interference term
/// is `(J/S)·κ`, so `Q = 1/(R_c · κ)`. This turns the previously *representative*
/// `Q` into one derived from the actual signal and jammer power spectra.
pub fn q_from_ssc(ssc_per_hz: f64, chip_rate_hz: f64) -> f64 {
    1.0 / (chip_rate_hz * ssc_per_hz.max(1e-30))
}

/// **Coherent early–late DLL code-tracking jitter** (chips, 1-σ) for a BPSK-like
/// signal — Kaplan & Hegarty §8 (the early-minus-late envelope discriminator):
/// `σ = √( (B_L·d / 2c) · [1 + 2/((2−d)·T·c)] )`, with `c` the linear `C/N₀`,
/// `B_L` the loop noise bandwidth (Hz), `d` the early-late correlator spacing
/// (chips), and `T` the predetection integration time (s). Multiply by
/// `c_light / R_c` to get metres.
pub fn dll_code_jitter_chips(
    cn0_dbhz: f64,
    loop_bw_hz: f64,
    corr_spacing_chips: f64,
    integ_time_s: f64,
) -> f64 {
    let c = 10f64.powf(cn0_dbhz / 10.0);
    let d = corr_spacing_chips.clamp(1e-3, 1.999);
    let lead = loop_bw_hz * d / (2.0 * c);
    let squaring = 1.0 + 2.0 / ((2.0 - d) * integ_time_s * c);
    (lead * squaring).sqrt()
}

/// Triangular BPSK autocorrelation `R(x) = max(0, 1 − |x|)` (x in chips).
fn bpsk_acf(x: f64) -> f64 {
    (1.0 - x.abs()).max(0.0)
}

/// **Multipath code-tracking error envelope** (chips) for a coherent early–late
/// DLL tracking a BPSK signal corrupted by a single specular reflection of
/// amplitude ratio `smr_db` (signal-to-multipath ratio, dB ≥ 0) at excess delay
/// `delay_chips`, with early-late spacing `spacing_chips`. Returns
/// `(max_error, min_error)` — the in-phase (`θ = 0`) and anti-phase (`θ = π`)
/// extremes — found by locating the discriminator zero-crossing of the composite
/// (direct + reflected) correlation. Narrowing the correlator spacing shrinks the
/// envelope — the defining property of a narrow correlator.
pub fn multipath_error_envelope_chips(
    spacing_chips: f64,
    smr_db: f64,
    delay_chips: f64,
) -> (f64, f64) {
    let a = 10f64.powf(-smr_db.abs() / 20.0); // reflected/direct amplitude ratio
    let d = spacing_chips.max(1e-3);
    // Composite coherent EML discriminator at tracking error ε (chips):
    // D(ε) = [E² − L²] of (direct + cosθ · a · reflected), triangular ACF.
    let discrim = |eps: f64, cos_theta: f64| -> f64 {
        let e = bpsk_acf(eps - d / 2.0) + cos_theta * a * bpsk_acf(eps - d / 2.0 - delay_chips);
        let l = bpsk_acf(eps + d / 2.0) + cos_theta * a * bpsk_acf(eps + d / 2.0 - delay_chips);
        e * e - l * l
    };
    // The lock point is the discriminator zero nearest ε = 0, searched only
    // within the linear pull-in window |ε| < 1 − d/2 (outside it the triangular
    // ACFs vanish and the discriminator is identically zero).
    let solve = |cos_theta: f64| -> f64 {
        let w = ((1.0 - d / 2.0).max(0.05)) * 0.98;
        let steps = 2000;
        let mut prev_x = -w;
        let mut prev_f = discrim(prev_x, cos_theta);
        let mut best = 0.0;
        let mut best_dist = f64::INFINITY;
        for i in 1..=steps {
            let x = -w + 2.0 * w * i as f64 / steps as f64;
            let f = discrim(x, cos_theta);
            if prev_f * f < 0.0 {
                let (mut a_lo, mut a_hi) = (prev_x, x);
                for _ in 0..60 {
                    let mid = 0.5 * (a_lo + a_hi);
                    if discrim(a_lo, cos_theta) * discrim(mid, cos_theta) <= 0.0 {
                        a_hi = mid;
                    } else {
                        a_lo = mid;
                    }
                }
                let root = 0.5 * (a_lo + a_hi);
                if root.abs() < best_dist {
                    best_dist = root.abs();
                    best = root;
                }
            }
            prev_x = x;
            prev_f = f;
        }
        best
    };
    (solve(1.0), solve(-1.0))
}

#[cfg(test)]
mod tests {
    use super::*;

    // ── PSD normalisation: ∫ G df = 1 over a wide band (Betz unit-power) ──────
    #[test]
    fn bpsk_psd_is_unit_area() {
        let m = Modulation::BpskR { n: 1.0 };
        let area = integrate(20.0 * m.chip_rate_hz(), 40_000, |f| m.psd(f));
        assert!((area - 1.0).abs() < 0.02, "BPSK ∫G df = {area}, want ≈1");
    }

    #[test]
    fn boc11_psd_is_unit_area() {
        let m = Modulation::BocSin { m: 1.0, n: 1.0 };
        let area = integrate(24.0 * m.chip_rate_hz(), 60_000, |f| m.psd(f));
        assert!(
            (area - 1.0).abs() < 0.03,
            "BOC(1,1) ∫G df = {area}, want ≈1"
        );
    }

    // ── BPSK peaks at the carrier; sine-BOC has a null there and splits ───────
    #[test]
    fn bpsk_peaks_at_carrier_boc_splits() {
        let bpsk = Modulation::BpskR { n: 1.0 };
        let boc = Modulation::BocSin { m: 1.0, n: 1.0 };
        assert!(bpsk.psd(0.0) > bpsk.psd(F0_HZ), "BPSK should peak at f=0");
        assert!(
            boc.psd(0.0) < boc.psd(F0_HZ),
            "BOC should null at f=0, peak near ±f_s"
        );
    }

    // ── Closed-form anchor: BPSK self-SSC = ∫G² df = 2/(3 R_c) ────────────────
    #[test]
    fn bpsk_self_ssc_matches_closed_form() {
        let m = Modulation::BpskR { n: 1.0 };
        let rc = m.chip_rate_hz();
        let kappa = spectral_separation_coeff(&m, &m, 24.0 * rc);
        let closed = 2.0 / (3.0 * rc);
        let rel = (kappa - closed).abs() / closed;
        assert!(
            rel < 0.03,
            "BPSK self-SSC {kappa:.3e} vs 2/(3Rc) {closed:.3e}, rel {rel:.3}"
        );
    }

    // ── Spectral separation: BPSK↔BOC overlap < BPSK self-overlap ─────────────
    #[test]
    fn boc_separates_from_bpsk() {
        let bpsk = Modulation::BpskR { n: 1.0 };
        let boc = Modulation::BocSin { m: 1.0, n: 1.0 };
        let band = 24.0 * F0_HZ;
        let self_ssc = spectral_separation_coeff(&bpsk, &bpsk, band);
        let cross = spectral_separation_coeff(&bpsk, &boc, band);
        assert!(
            cross < self_ssc,
            "BOC↔BPSK SSC {cross:.3e} should be < BPSK self {self_ssc:.3e}"
        );
    }

    // ── BOC carries more ranging information: larger Gabor bandwidth ──────────
    #[test]
    fn boc_has_larger_gabor_bandwidth() {
        let bpsk = Modulation::BpskR { n: 1.0 };
        let boc = Modulation::BocSin { m: 1.0, n: 1.0 };
        let band = 24.0 * F0_HZ;
        assert!(rms_bandwidth_hz(&boc, band) > rms_bandwidth_hz(&bpsk, band));
    }

    // ── DLL jitter: sane C/A value (~sub-metre at 45 dB-Hz, narrow correlator)─
    #[test]
    fn dll_jitter_ca_is_submetre_at_45dbhz() {
        let sigma_chips = dll_code_jitter_chips(45.0, 1.0, 0.5, 0.02);
        let metres = sigma_chips * 299_792_458.0 / F0_HZ;
        assert!(
            metres > 0.1 && metres < 2.0,
            "C/A DLL jitter {metres:.2} m, want 0.1–2 m"
        );
    }

    #[test]
    fn dll_jitter_decreases_with_cn0() {
        let lo = dll_code_jitter_chips(35.0, 1.0, 0.5, 0.02);
        let hi = dll_code_jitter_chips(50.0, 1.0, 0.5, 0.02);
        assert!(hi < lo, "higher C/N0 must track tighter ({hi} !< {lo})");
    }

    // ── q_from_ssc links navsignal to the jamming anti-jam equation ───────────
    #[test]
    fn q_from_white_noise_ssc_is_order_unity() {
        // Matched wideband noise over ±1 chip rate ≈ the canonical Q≈1 reference.
        let bpsk = Modulation::BpskR { n: 1.0 };
        let rc = bpsk.chip_rate_hz();
        let kappa = ssc_vs_white(&bpsk, 2.0 * rc);
        let q = q_from_ssc(kappa, rc);
        assert!(
            q > 0.3 && q < 3.0,
            "PSD-derived Q {q:.3} should be order unity"
        );
    }

    // ── Multipath envelope: narrow correlator suppresses multipath ────────────
    #[test]
    fn narrow_correlator_suppresses_multipath() {
        let (max_wide, min_wide) = multipath_error_envelope_chips(1.0, 6.0, 0.3);
        let (max_narrow, min_narrow) = multipath_error_envelope_chips(0.1, 6.0, 0.3);
        let wide = max_wide.abs().max(min_wide.abs());
        let narrow = max_narrow.abs().max(min_narrow.abs());
        assert!(
            narrow < wide,
            "narrow correlator {narrow:.4} should beat wide {wide:.4}"
        );
    }

    #[test]
    fn multipath_vanishes_without_reflection() {
        // SMR very large ⇒ negligible reflected amplitude ⇒ ~zero error.
        let (mx, mn) = multipath_error_envelope_chips(0.5, 60.0, 0.3);
        assert!(
            mx.abs() < 1e-3 && mn.abs() < 1e-3,
            "no-multipath error should vanish"
        );
    }

    #[test]
    fn multipath_envelope_straddles_zero() {
        // In-phase and anti-phase reflections bias the code in opposite directions.
        let (mx, mn) = multipath_error_envelope_chips(1.0, 6.0, 0.4);
        assert!(
            mx.abs() > 1e-3,
            "expected a non-trivial multipath bias, got {mx}"
        );
        assert!(
            mx * mn < 0.0,
            "in/anti-phase should straddle zero ({mx},{mn})"
        );
    }
}
