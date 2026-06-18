// SPDX-License-Identifier: AGPL-3.0-only
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

/// Speed of light (m/s) — for ranging-code ambiguity.
pub const C_LIGHT_M_PER_S: f64 = 299_792_458.0;

/// A **spreading-code family** for a ranging signal — the PRN sequence the
/// receiver correlates against, distinct from the [`Modulation`] envelope. The
/// design trade here is the *code* one: a longer code suppresses autocorrelation
/// sidelobes and extends the unambiguous range, while a Gold family trades a small
/// sidelobe penalty for a large set of codes with *bounded mutual cross-correlation*
/// — the property that lets many satellites share a band (CDMA). This is the
/// signal **design-trade** layer, not antenna/payload hardware.
#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub enum CodeFamily {
    /// **Maximal-length sequence** (m-sequence) from an `n`-stage LFSR. Period
    /// `2ⁿ−1`, two-valued periodic autocorrelation `{L, −1}` — the lowest possible
    /// sidelobe, but m-sequences do *not* form a low-cross-correlation set, which is
    /// why multi-satellite systems use Gold codes instead.
    MaximalLength { n: u32 },
    /// **Gold code** from a preferred pair of `n`-stage m-sequences. Period `2ⁿ−1`,
    /// three-valued auto/cross-correlation `{−1, −t(n), t(n)−2}/L` with
    /// `t(n) = 1 + 2^⌊(n+2)/2⌋`. Preferred pairs (hence Gold sets) exist for
    /// `n mod 4 ≠ 0`. GPS C/A is the `n = 10` Gold family.
    Gold { n: u32 },
}

/// `t(n) = 1 + 2^⌊(n+2)/2⌋` — the parameter bounding the three-valued
/// correlation of m-sequence preferred pairs / Gold codes (Gold 1967; Sarwate &
/// Pursley 1980).
fn t_param(n: u32) -> u64 {
    1 + (1u64 << ((n + 2) / 2))
}

/// Euler's totient of `m`, by trial division (used for the count of degree-`n`
/// m-sequences; `m = 2ⁿ−1` is small for any practical `n`).
fn euler_phi(mut m: u64) -> u64 {
    let mut result = m;
    let mut p = 2u64;
    while p * p <= m {
        if m % p == 0 {
            while m % p == 0 {
                m /= p;
            }
            result -= result / p;
        }
        p += 1;
    }
    if m > 1 {
        result -= result / m;
    }
    result
}

impl CodeFamily {
    /// Practical register-length range for the closure-form guarantees: an
    /// m-sequence needs `n ≥ 2`, and the totient (for `family_size`) is computed by
    /// trial division so `n` is capped at 31 (2³¹−1 ≈ 2.1e9 factors instantly;
    /// real GNSS codes are `n = 10…13`). Methods returning a correlation/size
    /// *guarantee* yield `None` outside this range.
    fn n_in_range(n: u32) -> bool {
        (2..=31).contains(&n)
    }

    /// LFSR register length `n`.
    pub fn register_length(&self) -> u32 {
        match *self {
            CodeFamily::MaximalLength { n } | CodeFamily::Gold { n } => n,
        }
    }

    /// Code period `L = 2ⁿ − 1` chips. Returns `0` for the unphysical `n = 0` or for
    /// `n ≥ 63` (where `2ⁿ−1` would overflow `u64`).
    pub fn code_length(&self) -> u64 {
        let n = self.register_length();
        if n == 0 || n >= 63 {
            return 0;
        }
        (1u64 << n) - 1
    }

    /// **Maximum normalised periodic-autocorrelation sidelobe** (magnitude). For an
    /// m-sequence this is exactly `1/L` (the two-valued `{L, −1}` property); for a
    /// Gold code it is the three-valued bound `t(n)/L`. Returns `None` when `n` is
    /// out of [`n_in_range`] or — for Gold — when no preferred pair exists
    /// (`n mod 4 = 0`), since the bound is undefined there.
    pub fn max_autocorr_sidelobe(&self) -> Option<f64> {
        let n = self.register_length();
        if !Self::n_in_range(n) {
            return None;
        }
        let l = self.code_length() as f64;
        match *self {
            CodeFamily::MaximalLength { .. } => Some(1.0 / l),
            CodeFamily::Gold { n } if n % 4 != 0 => Some(t_param(n) as f64 / l),
            CodeFamily::Gold { .. } => None,
        }
    }

    /// **Maximum normalised cross-correlation** (magnitude) between distinct codes
    /// in the family. For a valid Gold set this is the `t(n)/L` bound — for `n = 10`
    /// (GPS C/A) this is `65/1023 ≈ −23.9 dB`. `None` for a lone m-sequence (a
    /// single code is not a multi-access family), and `None` for a Gold register
    /// length with no preferred pair (`n mod 4 = 0`) or out of [`n_in_range`] — the
    /// bound simply does not hold there, so no number is reported.
    pub fn max_crosscorr(&self) -> Option<f64> {
        match *self {
            CodeFamily::MaximalLength { .. } => None,
            CodeFamily::Gold { n } if Self::n_in_range(n) && n % 4 != 0 => {
                Some(t_param(n) as f64 / self.code_length() as f64)
            }
            CodeFamily::Gold { .. } => None,
        }
    }

    /// **Peak-to-sidelobe ratio** (dB) of the periodic autocorrelation:
    /// `20·log₁₀(1 / max_autocorr_sidelobe)`. A higher value (longer code) means a
    /// cleaner correlation peak and better resistance to false lock. `None` when
    /// the sidelobe bound is undefined (see [`max_autocorr_sidelobe`]).
    pub fn peak_to_sidelobe_db(&self) -> Option<f64> {
        self.max_autocorr_sidelobe()
            .map(|s| 20.0 * (1.0 / s).log10())
    }

    /// Whether a Gold (preferred-pair) set exists for this register length: `true`
    /// for any in-range m-sequence, and for Gold codes when `n mod 4 ≠ 0`.
    pub fn gold_codes_exist(&self) -> bool {
        match *self {
            CodeFamily::MaximalLength { n } => Self::n_in_range(n),
            CodeFamily::Gold { n } => Self::n_in_range(n) && n % 4 != 0,
        }
    }

    /// Number of distinct codes in the family. A valid Gold set has `2ⁿ + 1 = L + 2`
    /// codes (the two generators plus their `L` modulo-2 sums) — e.g. `n = 10`
    /// gives 1025 codes, ample for a GNSS constellation. For an m-sequence this is
    /// the count of distinct maximal-length sequences of degree `n`, `φ(2ⁿ−1) / n`.
    /// `None` when `n` is out of [`n_in_range`] (this also avoids the `n = 0`
    /// divide-by-zero) or — for Gold — when no preferred pair exists.
    pub fn family_size(&self) -> Option<u64> {
        let n = self.register_length();
        if !Self::n_in_range(n) {
            return None;
        }
        match *self {
            CodeFamily::MaximalLength { n } => Some(euler_phi(self.code_length()) / n as u64),
            CodeFamily::Gold { n } if n % 4 != 0 => Some(self.code_length() + 2),
            CodeFamily::Gold { .. } => None,
        }
    }
}

/// **Unambiguous range** (m) of a PN ranging code: `D_U = c·L / (2·R_c)`, the
/// half-light-distance of one full code period at chip rate `R_c` (Hz). Matches
/// [`crate::radiometric::pn_range_ambiguity`]; a longer code buys more range.
/// Returns `NaN` for a non-positive or non-finite `chip_rate_hz` (an invalid
/// configuration) rather than a silent `±∞`.
pub fn range_ambiguity_m(chip_rate_hz: f64, code_length_chips: u64) -> f64 {
    if !chip_rate_hz.is_finite() || chip_rate_hz <= 0.0 {
        return f64::NAN;
    }
    C_LIGHT_M_PER_S * code_length_chips as f64 / (2.0 * chip_rate_hz)
}

/// **Shortest code length** (chips) whose unambiguous range covers
/// `required_range_m` at chip rate `chip_rate_hz` (Hz): the inverse of
/// [`range_ambiguity_m`], `L ≥ 2·R_c·D / c`. The design answer to "how long must
/// the ranging code be to resolve range to this distance without ambiguity?"
/// Returns `0` (the invalid-input sentinel) for a non-positive/non-finite chip
/// rate or a negative/non-finite range.
pub fn code_length_for_ambiguity(chip_rate_hz: f64, required_range_m: f64) -> u64 {
    if !chip_rate_hz.is_finite()
        || chip_rate_hz <= 0.0
        || !required_range_m.is_finite()
        || required_range_m < 0.0
    {
        return 0;
    }
    let l = 2.0 * chip_rate_hz * required_range_m / C_LIGHT_M_PER_S;
    l.ceil().max(1.0) as u64
}

#[cfg(test)]
mod code_tests {
    use super::*;

    // ── m-sequence period: n = 10 → 1023 chips (the GPS C/A length) ───────────
    #[test]
    fn msequence_period_is_two_pow_n_minus_one() {
        assert_eq!(CodeFamily::MaximalLength { n: 10 }.code_length(), 1023);
        assert_eq!(CodeFamily::Gold { n: 10 }.code_length(), 1023);
        assert_eq!(CodeFamily::MaximalLength { n: 13 }.code_length(), 8191);
    }

    // ── m-sequence autocorrelation sidelobe is exactly 1/L ────────────────────
    #[test]
    fn msequence_sidelobe_is_inverse_length() {
        let f = CodeFamily::MaximalLength { n: 10 };
        assert!((f.max_autocorr_sidelobe().unwrap() - 1.0 / 1023.0).abs() < 1e-15);
        // peak-to-sidelobe = 20 log10(1023) ≈ 60.2 dB (the real validation anchor)
        assert!((f.peak_to_sidelobe_db().unwrap() - 60.197).abs() < 0.01);
    }

    // ── Closed-form/real-world anchor: GPS C/A Gold cross-corr ≈ −23.9 dB ──────
    #[test]
    fn gps_ca_gold_crosscorr_matches_textbook() {
        let f = CodeFamily::Gold { n: 10 };
        // t(10) = 1 + 2^6 = 65; max |cross| = 65/1023.
        let xc = f.max_crosscorr().unwrap();
        assert!((xc - 65.0 / 1023.0).abs() < 1e-15, "xc {xc}");
        let db = 20.0 * xc.log10();
        assert!(
            (db - (-23.94)).abs() < 0.1,
            "GPS C/A Gold cross-corr {db:.2} dB, want ≈ −23.9 dB"
        );
    }

    // ── Gold family size: n = 10 → 1025 codes (L + 2) ─────────────────────────
    #[test]
    fn gold_family_size_is_length_plus_two() {
        assert_eq!(CodeFamily::Gold { n: 10 }.family_size(), Some(1025));
    }

    // ── m-sequence count of degree 10: φ(1023)/10 = 60 ────────────────────────
    #[test]
    fn msequence_count_degree_10() {
        // 1023 = 3·11·31 ⇒ φ = 600 ⇒ 600/10 = 60 maximal-length sequences.
        assert_eq!(CodeFamily::MaximalLength { n: 10 }.family_size(), Some(60));
        assert_eq!(euler_phi(1023), 600);
    }

    // ── Gold codes exist iff n mod 4 ≠ 0 ──────────────────────────────────────
    #[test]
    fn gold_existence_condition() {
        assert!(CodeFamily::Gold { n: 10 }.gold_codes_exist()); // 10 mod 4 = 2
        assert!(CodeFamily::Gold { n: 11 }.gold_codes_exist()); // odd
        assert!(!CodeFamily::Gold { n: 8 }.gold_codes_exist()); // 8 mod 4 = 0
        assert!(!CodeFamily::Gold { n: 12 }.gold_codes_exist());
    }

    // ── No correlation/size guarantee is reported where no Gold set exists ─────
    // (the key honesty fix: the t(n)/L bound is undefined for n mod 4 = 0).
    #[test]
    fn invalid_gold_reports_no_guarantee() {
        for n in [8u32, 12, 16] {
            let g = CodeFamily::Gold { n };
            assert!(!g.gold_codes_exist(), "n={n} should have no Gold set");
            assert_eq!(g.max_crosscorr(), None, "n={n} cross-corr must be None");
            assert_eq!(
                g.max_autocorr_sidelobe(),
                None,
                "n={n} sidelobe must be None"
            );
            assert_eq!(g.family_size(), None, "n={n} family size must be None");
            assert_eq!(g.peak_to_sidelobe_db(), None);
        }
    }

    // ── Degenerate inputs return None / NaN / 0, never panic ──────────────────
    #[test]
    fn degenerate_inputs_do_not_panic() {
        // n = 0 used to divide-by-zero in family_size; now it is out of range.
        assert_eq!(CodeFamily::MaximalLength { n: 0 }.family_size(), None);
        assert_eq!(CodeFamily::MaximalLength { n: 1 }.max_crosscorr(), None);
        assert_eq!(CodeFamily::MaximalLength { n: 40 }.family_size(), None); // > 31 cap
                                                                             // Ambiguity guards.
        assert!(range_ambiguity_m(0.0, 1023).is_nan());
        assert!(range_ambiguity_m(-1.0, 1023).is_nan());
        assert_eq!(code_length_for_ambiguity(1.023e6, f64::NAN), 0);
        assert_eq!(code_length_for_ambiguity(0.0, 1.0e5), 0);
        assert_eq!(code_length_for_ambiguity(1.023e6, -5.0), 0);
    }

    // ── Longer code → cleaner peak; Gold sidelobe worse than same-length m-seq ─
    #[test]
    fn longer_code_has_cleaner_peak() {
        let short = CodeFamily::MaximalLength { n: 7 }
            .peak_to_sidelobe_db()
            .unwrap();
        let long = CodeFamily::MaximalLength { n: 13 }
            .peak_to_sidelobe_db()
            .unwrap();
        assert!(
            long > short,
            "longer code {long:.1} should beat {short:.1} dB"
        );
        let gold = CodeFamily::Gold { n: 10 }.max_autocorr_sidelobe().unwrap();
        let mseq = CodeFamily::MaximalLength { n: 10 }
            .max_autocorr_sidelobe()
            .unwrap();
        assert!(gold > mseq, "Gold sidelobe {gold:.4} > m-seq {mseq:.4}");
    }

    // ── Range ambiguity: forward anchor + an INDEPENDENT inverse anchor ───────
    #[test]
    fn ambiguity_forward_and_independent_inverse_anchors() {
        let rc = 1.023e6; // C/A chip rate
                          // GPS C/A 1023-chip code: D_U = c·1023/(2·1.023e6) ≈ 149.896 km.
        let du = range_ambiguity_m(rc, 1023);
        assert!((du - 149_896.229).abs() < 1.0, "C/A ambiguity {du:.1} m");
        // Inverse leg anchored on an INDEPENDENT hand-computed pair (not the forward
        // call): at R_c = 5.115 MHz (5·f0), covering exactly 300 km needs
        // L ≥ 2·5.115e6·3.0e5 / c = 3.069e12 / 2.99792458e8 = 10237.08 → ceil 10238.
        let l = code_length_for_ambiguity(5.115e6, 3.0e5);
        assert_eq!(l, 10_238, "hand-computed inverse anchor");
        // And the original round-trip still holds.
        assert_eq!(code_length_for_ambiguity(rc, du), 1023);
        assert!(
            code_length_for_ambiguity(rc, 4.0e8) > 1023,
            "deep-space needs longer code"
        );
    }
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
