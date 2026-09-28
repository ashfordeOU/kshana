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
    /// **MBOC(6, 1, p)** — the multiplexed BOC power spectral density
    /// `(1 − p)·G_BOC(1,1)(f) + p·G_BOC(6,1)(f)` on a 1.023 Mcps code. With
    /// `p = 1/11` this is the spectrum agreed for Galileo E1 OS and GPS L1C (Hein et
    /// al., *MBOC: The New Optimized Spreading Modulation Recommended for Galileo L1 OS
    /// and GPS L1C*, Inside GNSS, May/June 2006). The Galileo E1 OS composite binary
    /// offset carrier (CBOC) data and pilot components add to exactly this density
    /// (Galileo Open Service Signal-in-Space Interface Control Document), so it is the
    /// spectrum a receiver sees for E1 as a whole.
    Mboc {
        /// Fraction of the power in the BOC(6,1) component (1/11 for E1 OS and L1C).
        p: f64,
    },
}

impl Modulation {
    /// Spreading-code chip rate `R_c` (chips/s).
    pub fn chip_rate_hz(&self) -> f64 {
        match *self {
            Modulation::BpskR { n } => n * F0_HZ,
            Modulation::BocSin { n, .. } => n * F0_HZ,
            Modulation::Mboc { .. } => F0_HZ,
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
            Modulation::Mboc { p } => {
                let p = p.clamp(0.0, 1.0);
                (1.0 - p) * Modulation::BocSin { m: 1.0, n: 1.0 }.psd(f_hz)
                    + p * Modulation::BocSin { m: 6.0, n: 1.0 }.psd(f_hz)
            }
        }
    }

    /// A short, stable label: `BPSK(1)`, `BOC(1,1)`, `MBOC(6,1,1/11)`.
    pub fn label(&self) -> String {
        let num = |v: f64| {
            if (v - v.round()).abs() < 1e-9 {
                format!("{}", v.round() as i64)
            } else if ((3.0 * v) - (3.0 * v).round()).abs() < 1e-9 {
                // Thirds (BPSK(1/3), 341 kchip/s) print as the fraction they were written as.
                format!("{}/3", (3.0 * v).round() as i64)
            } else {
                format!("{v}")
            }
        };
        match *self {
            Modulation::BpskR { n } => format!("BPSK({})", num(n)),
            Modulation::BocSin { m, n } => format!("BOC({},{})", num(m), num(n)),
            Modulation::Mboc { p } if (p - 1.0 / 11.0).abs() < 1e-12 => {
                "MBOC(6,1,1/11)".to_string()
            }
            Modulation::Mboc { p } => format!("MBOC(6,1,{p})"),
        }
    }
}

/// Parse a number that may be written as a fraction: `10`, `0.5`, `1/3`.
fn parse_ratio(s: &str) -> Result<f64, String> {
    let s = s.trim();
    let v = match s.split_once('/') {
        Some((a, b)) => {
            let a: f64 = a.trim().parse().map_err(|_| format!("bad number {s:?}"))?;
            let b: f64 = b.trim().parse().map_err(|_| format!("bad number {s:?}"))?;
            a / b
        }
        None => s.parse().map_err(|_| format!("bad number {s:?}"))?,
    };
    if v.is_finite() && v > 0.0 {
        Ok(v)
    } else {
        Err(format!("{s:?} must be a positive number"))
    }
}

/// **Parse a modulation label** as written in a scenario: `BPSK(n)` (n may be a
/// fraction, `BPSK(1/3)` is 341 kchip/s), `BOC(m,n)` (sine-phased), or
/// `MBOC(6,1,p)`. Case-insensitive; `BPSK-R(n)` is accepted for `BPSK(n)`. The inverse
/// of [`Modulation::label`] for every label it prints.
pub fn parse_modulation(label: &str) -> Result<Modulation, String> {
    let t = label.trim().to_ascii_uppercase().replace(' ', "");
    let (head, rest) = t
        .split_once('(')
        .ok_or_else(|| format!("modulation {label:?}: expected NAME(args), e.g. BPSK(10)"))?;
    let args = rest
        .strip_suffix(')')
        .ok_or_else(|| format!("modulation {label:?}: missing closing parenthesis"))?;
    let parts: Vec<&str> = args.split(',').collect();
    match (head, parts.len()) {
        ("BPSK" | "BPSK-R", 1) => Ok(Modulation::BpskR {
            n: parse_ratio(parts[0])?,
        }),
        ("BOC" | "BOCSIN", 2) => Ok(Modulation::BocSin {
            m: parse_ratio(parts[0])?,
            n: parse_ratio(parts[1])?,
        }),
        ("MBOC", 3) if parse_ratio(parts[0])? == 6.0 && parse_ratio(parts[1])? == 1.0 => {
            Ok(Modulation::Mboc {
                p: parse_ratio(parts[2])?,
            })
        }
        _ => Err(format!(
            "modulation {label:?} is not one of BPSK(n), BOC(m,n) or MBOC(6,1,p)"
        )),
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

/// Spectral separation coefficient with the interferer's spectrum **centred
/// `offset_hz` away from the signal's carrier**:
/// `κ = ∫_{−band/2}^{band/2} G_s(f) · G_i(f − offset) df` (1/Hz), the interferer's
/// density normalised to unit power over all frequencies (Betz 2001, Eq. 1). With
/// `offset_hz = 0` this is [`spectral_separation_coeff`]. The integration grid is
/// refined so each chip-rate lobe of either spectrum gets at least ~40 Simpson panels.
pub fn spectral_separation_coeff_offset(
    sig: &Modulation,
    intf: &Modulation,
    offset_hz: f64,
    band_hz: f64,
) -> f64 {
    let half = band_hz / 2.0;
    let lobe = sig.chip_rate_hz().min(intf.chip_rate_hz());
    let n = ((band_hz / lobe) * 80.0).ceil().clamp(2_000.0, 400_000.0) as usize;
    integrate(half, n, |f| sig.psd(f) * intf.psd(f - offset_hz))
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

// ───────────────── band-limited closed forms and generic code tracking ─────────────────
//
// The functions below serve any signal design, not only the GNSS ones above: a low Earth
// orbit (LEO) positioning, navigation and timing (PNT) signal, a UHF or C-band ranging
// signal, or a filtered composite. They take either a [`Modulation`] or any unit-area
// power spectral density (PSD) closure, so a caller can hand them a spectrum this module
// does not name.

/// The **sine integral** `Si(x) = ∫₀ˣ sin(t)/t dt`. Power series for `|x| ≤ 20`, the
/// auxiliary-function asymptotic expansion `Si(x) = π/2 − f(x)·cos x − g(x)·sin x` beyond
/// (Abramowitz & Stegun 5.2.8 and 5.2.34–35). Absolute error below 1e-8 everywhere.
pub fn sine_integral(x: f64) -> f64 {
    if x < 0.0 {
        return -sine_integral(-x);
    }
    if x <= 20.0 {
        // Σ (−1)^k x^(2k+1) / ((2k+1)·(2k+1)!)
        let mut term = x; // x^(2k+1)/(2k+1)!
        let mut sum = x;
        let mut k = 0usize;
        loop {
            k += 1;
            let a = (2 * k) as f64;
            let b = (2 * k + 1) as f64;
            term *= -x * x / (a * b);
            let add = term / b;
            sum += add;
            if add.abs() < 1e-17 * sum.abs().max(1.0) || k > 200 {
                break;
            }
        }
        return sum;
    }
    // f(x) ~ (1/x) Σ (−1)^k (2k)!/x^(2k),  g(x) ~ (1/x²) Σ (−1)^k (2k+1)!/x^(2k);
    // truncated at the smallest term.
    let inv2 = 1.0 / (x * x);
    let (mut f, mut g) = (0.0, 0.0);
    let (mut tf, mut tg) = (1.0_f64, 1.0_f64);
    let mut prev_f = f64::INFINITY;
    for k in 0..60usize {
        if tf.abs() > prev_f {
            break;
        }
        prev_f = tf.abs();
        f += tf;
        g += tg;
        let kk = k as f64;
        tf *= -(2.0 * kk + 1.0) * (2.0 * kk + 2.0) * inv2;
        tg *= -(2.0 * kk + 2.0) * (2.0 * kk + 3.0) * inv2;
    }
    let f = f / x;
    let g = g * inv2;
    PI / 2.0 - f * x.cos() - g * x.sin()
}

/// **Fraction of a BPSK-R signal's power inside a double-sided bandwidth `band_hz`**
/// centred on its carrier, in closed form: with `a = π·B·T_c`,
/// `η = (2/π)·[Si(a) − sin²(a/2)/(a/2)]`, the integral of `T_c·sinc²(π f T_c)` over
/// `|f| ≤ B/2`. At `B = 2R_c` (the main lobe) this is the textbook 90.3 %.
pub fn bpsk_power_in_band_closed_form(chip_rate_hz: f64, band_hz: f64) -> f64 {
    if !(chip_rate_hz > 0.0 && band_hz > 0.0) {
        return 0.0;
    }
    let a = PI * band_hz / chip_rate_hz;
    let h = a / 2.0;
    (2.0 / PI) * (sine_integral(a) - h.sin().powi(2) / h)
}

/// **Band-limited RMS (Gabor) bandwidth of a BPSK-R signal**, closed form (Hz):
/// `β² = [B/2 − sin(πBT_c)/(2πT_c)] / (π² T_c η)` with `η` from
/// [`bpsk_power_in_band_closed_form`]. For `B → ∞` it grows as `√(B R_c / (2π²))`, the
/// statement that a rectangular chip's ranging information is set by the front end, not
/// by the chip (Betz & Kolodziejski 2009, Part I).
pub fn bpsk_gabor_bandwidth_closed_form_hz(chip_rate_hz: f64, band_hz: f64) -> f64 {
    let tc = 1.0 / chip_rate_hz;
    let eta = bpsk_power_in_band_closed_form(chip_rate_hz, band_hz);
    let num = band_hz / 2.0 - (PI * band_hz * tc).sin() / (2.0 * PI * tc);
    (num / (PI * PI * tc * eta.max(1e-300))).sqrt()
}

/// **Offset BPSK-on-BPSK spectral separation coefficient, closed form** (1/Hz), over an
/// infinite band: two BPSK-R spectra of the same chip period `T_c` whose carriers are
/// `Δ` apart overlap by `κ(Δ) = ∫ G(f) G(f − Δ) df`, the Fourier transform of the squared
/// triangular autocorrelation at `Δ` (Parseval), which integrates to
/// `κ(Δ) = 4/((2πΔ)² T_c) · [1 − sin(2πΔT_c)/(2πΔT_c)]`, and `2T_c/3` at `Δ = 0`.
pub fn bpsk_offset_ssc_closed_form(chip_rate_hz: f64, offset_hz: f64) -> f64 {
    let tc = 1.0 / chip_rate_hz;
    let x = 2.0 * PI * offset_hz * tc;
    if x.abs() < 1e-4 {
        return 2.0 * tc / 3.0 * (1.0 - x * x / 20.0);
    }
    4.0 / (x * x / tc) * (1.0 - x.sin() / x)
}

/// Composite Simpson integral of `g` over `[a, b]` with at least `n` panels (forced even).
pub fn simpson(a: f64, b: f64, n: usize, g: impl Fn(f64) -> f64) -> f64 {
    if b <= a {
        return 0.0;
    }
    let n = if n % 2 == 0 { n.max(2) } else { n + 1 };
    let h = (b - a) / n as f64;
    let mut s = g(a) + g(b);
    for i in 1..n {
        s += if i % 2 == 1 { 4.0 } else { 2.0 } * g(a + i as f64 * h);
    }
    s * h / 3.0
}

/// Simpson panel count that gives every lobe of width `lobe_hz` at least ~40 panels over
/// a span `span_hz`, bounded to `[2 000, 400 000]`.
pub fn panels_for(span_hz: f64, lobe_hz: f64) -> usize {
    ((span_hz / lobe_hz.max(1.0)) * 40.0)
        .ceil()
        .clamp(2_000.0, 400_000.0) as usize
}

/// Early-minus-late processing for [`dll_jitter_bandlimited_s`].
#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub enum EarlyLate {
    /// Coherent early-minus-late (the carrier is tracked, the discriminator is linear).
    Coherent,
    /// Non-coherent early-minus-late power, with its squaring loss.
    NonCoherent,
}

/// **Code-tracking thermal-noise jitter of an early-late delay lock loop (DLL) for any
/// band-limited spectrum** (seconds, 1-σ), after Betz & Kolodziejski, "Generalized Theory
/// of Code Tracking with an Early-Late Discriminator, Part I," IEEE Trans. Aerospace and
/// Electronic Systems 45(4), 2009:
///
/// `σ² = B_L(1 − ½B_L T) ∫ G sin²(πfΔ) df / [(2π)² (C/N₀) (∫ f G sin(πfΔ) df)²]`
///
/// times, for non-coherent processing, the squaring loss
/// `1 + ∫ G cos²(πfΔ) df / [T (C/N₀) (∫ G cos(πfΔ) df)²]`. All integrals run over the
/// double-sided front-end band `|f| ≤ band_hz/2`; `psd` is the tracked component's
/// spectrum normalised to unit area over all frequencies; `c_n0_dbhz` is the carrier
/// power of that component over `N₀`; `spacing_s` is the early-late spacing `Δ` in
/// seconds; `lobe_hz` sets the integration resolution (the narrowest feature of `psd`).
///
/// For an infinite-band BPSK-R the coherent form reduces to the textbook
/// `σ² = B_L d T_c² / (2 C/N₀)` (d the spacing in chips; Kaplan & Hegarty, 3rd ed., §8),
/// and as `Δ → 0` to the Gabor-bandwidth bound [`dll_jitter_small_spacing_limit_s`].
#[allow(clippy::too_many_arguments)]
pub fn dll_jitter_bandlimited_s(
    psd: impl Fn(f64) -> f64,
    band_hz: f64,
    lobe_hz: f64,
    c_n0_dbhz: f64,
    loop_bw_hz: f64,
    integ_time_s: f64,
    spacing_s: f64,
    mode: EarlyLate,
) -> f64 {
    let cn0 = 10f64.powf(c_n0_dbhz / 10.0);
    let half = band_hz / 2.0;
    let n = panels_for(band_hz, lobe_hz.min(1.0 / spacing_s.max(1e-15)));
    let num = simpson(-half, half, n, |f| {
        psd(f) * (PI * f * spacing_s).sin().powi(2)
    });
    let slope = simpson(-half, half, n, |f| f * psd(f) * (PI * f * spacing_s).sin());
    let bl = loop_bw_hz * (1.0 - 0.5 * loop_bw_hz * integ_time_s).max(0.0);
    let mut var = bl * num / ((2.0 * PI).powi(2) * cn0 * slope * slope).max(1e-300);
    if mode == EarlyLate::NonCoherent {
        let c2 = simpson(-half, half, n, |f| {
            psd(f) * (PI * f * spacing_s).cos().powi(2)
        });
        let c1 = simpson(-half, half, n, |f| psd(f) * (PI * f * spacing_s).cos());
        var *= 1.0 + c2 / (integ_time_s * cn0 * c1 * c1).max(1e-300);
    }
    var.sqrt()
}

/// The vanishing-spacing limit of [`dll_jitter_bandlimited_s`] (coherent), seconds:
/// `σ² = B_L(1 − ½B_L T) / [(2π)² (C/N₀) ∫ f² G df]` over the band, the bound set by the
/// Gabor bandwidth (Betz & Kolodziejski 2009, Part I). No early-late spacing does better.
pub fn dll_jitter_small_spacing_limit_s(
    psd: impl Fn(f64) -> f64,
    band_hz: f64,
    lobe_hz: f64,
    c_n0_dbhz: f64,
    loop_bw_hz: f64,
    integ_time_s: f64,
) -> f64 {
    let cn0 = 10f64.powf(c_n0_dbhz / 10.0);
    let half = band_hz / 2.0;
    let f2 = simpson(-half, half, panels_for(band_hz, lobe_hz), |f| {
        f * f * psd(f)
    });
    let bl = loop_bw_hz * (1.0 - 0.5 * loop_bw_hz * integ_time_s).max(0.0);
    (bl / ((2.0 * PI).powi(2) * cn0 * f2).max(1e-300)).sqrt()
}

/// **Galileo E5 AltBOC(15,10) unit-area PSD** (1/Hz) at offset `f_hz` from 1191.795 MHz:
/// the constant-envelope AltBOC spectrum of the Galileo Open Service Signal-in-Space
/// Interface Control Document (OS SIS ICD), with `f_c = 10.23 MHz` and `f_s = 15.345 MHz`,
/// `S(f) = 4f_c/(π²f²) · cos²(πf/f_c)/cos²(πf/(2f_s)) ·
/// [cos²(πf/(2f_s)) − cos(πf/(2f_s)) − 2cos(πf/(2f_s))cos(πf/(4f_s)) + 2]`.
/// That expression integrates to 8 over all frequencies (checked numerically in the
/// tests, with the 1/f² tail added analytically), so it is divided by 8 here to give the
/// unit-area density every other spectrum in this module uses.
pub fn altboc_15_10_psd(f_hz: f64) -> f64 {
    let fc = 10.0 * F0_HZ;
    let fs = 15.0 * F0_HZ;
    let eval = |f: f64| -> f64 {
        let u = PI * f / (2.0 * fs);
        let cu = u.cos();
        let bracket = cu * cu - cu - 2.0 * cu * (u / 2.0).cos() + 2.0;
        0.5 * fc / (PI * PI * f * f) * (PI * f / fc).cos().powi(2) / (cu * cu) * bracket
    };
    if f_hz.abs() < 1.0 {
        // The removable singularity at the carrier: (0.75 f_c / f_s²) / 8.
        return 0.75 * fc / (fs * fs) / 8.0;
    }
    let u = PI * f_hz / (2.0 * fs);
    if u.cos().abs() < 1e-6 {
        // cos(πf/(2f_s)) = 0 is a removable 0/0 point: average its two neighbours.
        let e = 1e-3 * fs;
        return 0.5 * (eval(f_hz - e) + eval(f_hz + e));
    }
    eval(f_hz)
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

#[cfg(test)]
mod band_limited_tests {
    use super::*;

    // ── Sine integral against tabulated values (Abramowitz & Stegun Table 5.1) ─────
    #[test]
    fn sine_integral_matches_tables_and_its_limit() {
        assert!((sine_integral(1.0) - 0.946_083_070_367_183).abs() < 1e-12);
        assert!((sine_integral(PI) - 1.851_937_051_982_466).abs() < 1e-12);
        assert!((sine_integral(2.0 * PI) - 1.418_151_576_132_628).abs() < 1e-12);
        assert!((sine_integral(-1.0) + 0.946_083_070_367_183).abs() < 1e-12);
        // Across the series/asymptotic switch at 20, against a direct quadrature.
        for x in [19.9, 20.1, 35.0, 150.0] {
            let q = simpson(
                0.0,
                x,
                200_000,
                |t| if t == 0.0 { 1.0 } else { t.sin() / t },
            );
            assert!((sine_integral(x) - q).abs() < 1e-8, "Si({x})");
        }
        assert!((sine_integral(1e6) - PI / 2.0).abs() < 1e-5);
    }

    // ── ORACLE: 90.3 % of BPSK power in the main lobe; closed form = numeric ──────
    // Kaplan & Hegarty, Understanding GPS/GNSS, 3rd ed.: about 90 % of a BPSK-R
    // signal's power lies in the main lobe (±R_c); the closed form gives 0.9028.
    #[test]
    fn bpsk_power_in_band_closed_form_matches_textbook_and_numeric() {
        for n in [1.0 / 3.0, 1.0, 5.0, 10.0] {
            let rc = n * F0_HZ;
            let eta = bpsk_power_in_band_closed_form(rc, 2.0 * rc);
            assert!((eta - 0.902_8).abs() < 1e-4, "BPSK({n}) main lobe {eta}");
        }
        let m = Modulation::BpskR { n: 10.0 };
        for b in [10.0e6, 15.0e6, 20.0e6, 51.15e6] {
            let num = simpson(-b / 2.0, b / 2.0, 20_000, |f| m.psd(f));
            let cf = bpsk_power_in_band_closed_form(m.chip_rate_hz(), b);
            assert!((num - cf).abs() < 1e-7, "B {b}: {num} vs {cf}");
        }
    }

    // ── ORACLE: band-limited Gabor bandwidth closed form = numeric; √(B·R_c/2π²) ──
    #[test]
    fn bpsk_gabor_closed_form_matches_numeric_and_asymptote() {
        for (n, b) in [
            (10.0, 20.0e6),
            (5.0, 10.0e6),
            (1.0, 24.0e6),
            (1.0 / 3.0, 15.0e6),
        ] {
            let m = Modulation::BpskR { n };
            let num = rms_bandwidth_hz(&m, b);
            let cf = bpsk_gabor_bandwidth_closed_form_hz(m.chip_rate_hz(), b);
            assert!(
                (num / cf - 1.0).abs() < 1e-4,
                "BPSK({n}) in {b}: {num} vs {cf}"
            );
        }
        let rc = F0_HZ;
        let b = 2000.0 * rc;
        let asym = (b * rc / (2.0 * PI * PI)).sqrt();
        let cf = bpsk_gabor_bandwidth_closed_form_hz(rc, b);
        assert!((cf / asym - 1.0).abs() < 2e-3, "{cf} vs {asym}");
    }

    // ── ORACLE: band-limited early-late jitter reduces to Kaplan & Hegarty ─────────
    // Coherent early-late, BPSK(1), unlimited band: σ² = B_L(1 − B_L T/2)·d/(2 C/N₀)
    // chips². Operating point C/N₀ = 45 dB-Hz, B_L = 1 Hz, d = 1 chip, T = 20 ms:
    // σ = 0.0039564 chips = 1.1594 m (0.003976 chips, 1.165 m without the (1 − B_L T/2)
    // factor Kaplan & Hegarty omit).
    #[test]
    fn bandlimited_dll_reduces_to_the_textbook_forms() {
        let m = Modulation::BpskR { n: 1.0 };
        let rc = F0_HZ;
        let psd = |f: f64| m.psd(f);
        let s = dll_jitter_bandlimited_s(
            psd,
            400.0 * rc,
            rc,
            45.0,
            1.0,
            0.02,
            1.0 / rc,
            EarlyLate::Coherent,
        );
        let chips = s * rc;
        assert!(
            (chips - 0.003_956_4).abs() < 0.01 * 0.003_956_4,
            "coherent {chips}"
        );
        assert!((chips * C_LIGHT_M_PER_S / rc - 1.1594).abs() < 0.012);
        // Non-coherent: the existing Kaplan & Hegarty implementation, times √(1 − B_L T/2).
        let s_nc = dll_jitter_bandlimited_s(
            psd,
            400.0 * rc,
            rc,
            45.0,
            1.0,
            0.02,
            0.5 / rc,
            EarlyLate::NonCoherent,
        );
        let kh = dll_code_jitter_chips(45.0, 1.0, 0.5, 0.02) * 0.99f64.sqrt();
        assert!((s_nc * rc / kh - 1.0).abs() < 0.01, "{} vs {kh}", s_nc * rc);
        // Vanishing spacing in a 2R_c band approaches the Gabor bound, which equals
        // B_L'/((2π)² C/N₀ η β²) with the closed-form η and β.
        let b = 2.0 * rc;
        let tiny =
            dll_jitter_bandlimited_s(psd, b, rc, 45.0, 1.0, 0.02, 0.005 / rc, EarlyLate::Coherent);
        let lim = dll_jitter_small_spacing_limit_s(psd, b, rc, 45.0, 1.0, 0.02);
        assert!((tiny / lim - 1.0).abs() < 1e-3, "{tiny} vs {lim}");
        let eta = bpsk_power_in_band_closed_form(rc, b);
        let beta = bpsk_gabor_bandwidth_closed_form_hz(rc, b);
        let cf = (0.99 / ((2.0 * PI).powi(2) * 10f64.powf(4.5) * eta * beta * beta)).sqrt();
        assert!((lim / cf - 1.0).abs() < 1e-5, "{lim} vs {cf}");
        // Band-limiting floors the jitter: at 0.1 chip spacing the 2R_c front end is worse
        // than an unlimited one.
        let wide = dll_jitter_bandlimited_s(
            psd,
            400.0 * rc,
            rc,
            45.0,
            1.0,
            0.02,
            0.1 / rc,
            EarlyLate::Coherent,
        );
        let narrow =
            dll_jitter_bandlimited_s(psd, b, rc, 45.0, 1.0, 0.02, 0.1 / rc, EarlyLate::Coherent);
        assert!(narrow > wide);
    }

    // ── ORACLE: offset BPSK SSC against its Parseval closed form ──────────────────
    #[test]
    fn offset_bpsk_ssc_matches_parseval_closed_form() {
        let m = Modulation::BpskR { n: 10.0 };
        let rc = m.chip_rate_hz();
        for off in [0.0, 0.5 * rc, 1.5 * rc, 15.345e6, 3.2 * rc] {
            let num = spectral_separation_coeff_offset(&m, &m, off, 200.0 * rc);
            let cf = bpsk_offset_ssc_closed_form(rc, off);
            assert!(
                (10.0 * (num / cf).log10()).abs() < 0.01,
                "offset {off}: {num:e} vs {cf:e}"
            );
        }
        // Zero offset: 2/(3 R_c) = −71.86 dB/Hz for BPSK(10).
        let z = 10.0 * bpsk_offset_ssc_closed_form(rc, 0.0).log10();
        assert!((z - (-71.86)).abs() < 0.01, "{z}");
    }

    // ── AltBOC(15,10): unit area (tail added analytically), lobes near ±15.345 MHz ──
    #[test]
    fn altboc_psd_is_unit_area_with_lobes_at_e5a_and_e5b() {
        let half = 400e6;
        let body = simpson(-half, half, 400_000, altboc_15_10_psd);
        // Beyond |f| = half the envelope averages 4f_c/(π²f²)·(mean bracket/cos² term)/8;
        // estimate the tail from the local mean of f²·G over a few periods.
        let mean_f2g = simpson(half - 61.38e6, half, 20_000, |f| {
            f * f * altboc_15_10_psd(f)
        }) / 61.38e6;
        let tail = 2.0 * mean_f2g / half;
        let area = body + tail;
        assert!((area - 1.0).abs() < 5e-3, "AltBOC area {area}");
        let pk = (0..30_000)
            .map(|k| k as f64 * 1e3)
            .max_by(|a, b| {
                altboc_15_10_psd(*a)
                    .partial_cmp(&altboc_15_10_psd(*b))
                    .unwrap()
            })
            .unwrap();
        assert!((pk - 15.345e6).abs() < 0.3e6, "AltBOC peak at {pk}");
        assert!(altboc_15_10_psd(0.0) < 0.2 * altboc_15_10_psd(pk));
    }

    // ── Parsing: every label the engine prints parses back ─────────────────────────
    #[test]
    fn modulation_labels_round_trip() {
        for m in [
            Modulation::BpskR { n: 1.0 / 3.0 },
            Modulation::BpskR { n: 10.0 },
            Modulation::BocSin { m: 1.0, n: 1.0 },
            Modulation::Mboc { p: 1.0 / 11.0 },
        ] {
            let back = parse_modulation(&m.label()).unwrap();
            assert!(
                (back.chip_rate_hz() - m.chip_rate_hz()).abs() < 1e-6,
                "{}",
                m.label()
            );
        }
        assert_eq!(Modulation::BpskR { n: 1.0 / 3.0 }.label(), "BPSK(1/3)");
        assert!(parse_modulation("QPSK(1)").is_err());
        assert!(parse_modulation("BPSK(-1)").is_err());
    }
}
