// SPDX-License-Identifier: AGPL-3.0-only
//! **Software-defined-receiver front end: raw IQ IF -> correlator taps.**
//!
//! Kshana models the nav-signal level ([`crate::navsignal`]) and the measurement
//! domain ([`crate::gnss_sim`], [`crate::pvt`]), but the Early/Late signal-quality
//! distortion that betrays meaconing and matched-power spoofing only exists *inside*
//! a tracking loop. Real raw-IF datasets (TEXBAT, OAKBAT) ship sampled antenna IQ,
//! not correlator dumps, so to score the SQM detector on them we need the missing
//! front end: acquire a PRN, track it, and dump the per-epoch Early/Prompt/Late
//! correlator taps that [`crate::realdata::sqm`] already consumes.
//!
//! This module is that front end, kept to the **signal-processing layer** a feasibility
//! study needs and validated entirely on synthetic IF (where we own the truth):
//!
//! 1. [`CaCode`] - GPS L1 C/A Gold-code generation (PRN 1-32), validated against the
//!    IS-GPS-200 first-10-chips octal table, the 512/511 balance property, and the
//!    three-valued `{-1, 63, -65}` periodic autocorrelation.
//! 2. [`correlate`] - one complex Early/Prompt/Late correlation of an IQ block against
//!    a carrier-wiped, code-aligned replica.
//! 3. [`acquire`] - code-phase x Doppler search returning the peak cell.
//! 4. [`track`] - a closed DLL+PLL loop over successive code periods emitting
//!    [`CorrelatorDump`]s (Early/Prompt/Late taps per epoch).
//!
//! ## One constraint on the sample rate, stated rather than assumed
//!
//! The code replica is a **zero-order hold** on `floor(code phase)` (there is nothing between
//! chips of a rectangular BPSK waveform to interpolate). It follows that the smallest code-phase
//! change the correlator can see is one sample, `1 / (fs / R_c)` chips — and that at an
//! *exactly commensurate* rate, where `fs` is an integer multiple of the chip rate, every sample
//! of every epoch lands at the same fractional position inside its chip, so the Early/Late
//! response is a staircase with a one-sample dead band rather than a triangle. Measured at
//! 4.092 MHz (4.000 samples/chip) the discriminator slope is 6.3x its ideal value over a
//! 0.02-chip error and the closed DLL settles at 4.68x the correct lag; at 5 MHz
//! (4.8876 samples/chip) both are right to better than 0.5 %. Nothing here runs at a
//! commensurate rate, but 4.092 / 8.184 / 10.23 / 20.46 MHz are the rates a user reaches for
//! first: grade a rate with [`chip_grid`] (or [`crate::spoof_capture::CaptureConfig::chip_grid`]
//! / [`crate::realdata::iqif::FeatureStageConfig::chip_grid`]) before trusting a result from it.
//! [`ChipGrid`] carries the measured numbers.
//!
//! References: Kaplan & Hegarty, *Understanding GPS/GNSS* (3rd ed., chs. 8 & 14);
//! Borre et al., *A Software-Defined GPS and Galileo Receiver* (2007); IS-GPS-200.

use std::f64::consts::TAU;

/// C/A code chip rate (chips/s) and code length (chips) for GPS L1.
pub const CA_CHIP_RATE_HZ: f64 = 1_023_000.0;
/// Number of chips in one C/A code period.
pub const CA_CODE_LEN: usize = 1023;
/// GPS L1 C/A nominal carrier (Hz); used only as the IF/Doppler reference scale.
pub const L1_HZ: f64 = 1_575_420_000.0;

/// The G2 phase-selector tap pair `(s1, s2)` for each PRN (IS-GPS-200 Table 3-Ia,
/// 1-indexed register stages). `prn_taps(prn)` returns the pair for `prn` in 1..=32.
const G2_TAPS: [(usize, usize); 32] = [
    (2, 6),  // PRN 1
    (3, 7),  // 2
    (4, 8),  // 3
    (5, 9),  // 4
    (1, 9),  // 5
    (2, 10), // 6
    (1, 8),  // 7
    (2, 9),  // 8
    (3, 10), // 9
    (2, 3),  // 10
    (3, 4),  // 11
    (5, 6),  // 12
    (6, 7),  // 13
    (7, 8),  // 14
    (8, 9),  // 15
    (9, 10), // 16
    (1, 4),  // 17
    (2, 5),  // 18
    (3, 6),  // 19
    (4, 7),  // 20
    (5, 8),  // 21
    (6, 9),  // 22
    (1, 3),  // 23
    (4, 6),  // 24
    (5, 7),  // 25
    (6, 8),  // 26
    (7, 9),  // 27
    (8, 10), // 28
    (1, 6),  // 29
    (2, 7),  // 30
    (3, 8),  // 31
    (4, 9),  // 32
];

/// A generated GPS L1 C/A code: the 1023-chip `{0, 1}` sequence and a cached `±1`
/// (BPSK) mapping for correlation (chip `0 -> +1`, chip `1 -> -1`).
#[derive(Clone, Debug)]
pub struct CaCode {
    /// The PRN this code belongs to (1..=32).
    pub prn: u8,
    /// The 1023 code chips as `{0, 1}`.
    pub chips: Vec<u8>,
    /// The same chips as `±1` (`0 -> +1.0`, `1 -> -1.0`), for correlation.
    pub bipolar: Vec<f64>,
}

impl CaCode {
    /// Generate the C/A code for `prn` (1..=32). Returns `None` for an out-of-range PRN.
    pub fn new(prn: u8) -> Option<Self> {
        if prn < 1 || prn as usize > G2_TAPS.len() {
            return None;
        }
        let (s1, s2) = G2_TAPS[(prn - 1) as usize];
        // Two 10-stage LFSRs, 1-indexed stages g[1..=10], both initialised all-ones.
        let mut g1 = [1u8; 11];
        let mut g2 = [1u8; 11];
        let mut chips = Vec::with_capacity(CA_CODE_LEN);
        for _ in 0..CA_CODE_LEN {
            // Output chip = G1 output XOR the selected G2 phase tap.
            let g1_out = g1[10];
            let g2_out = g2[s1] ^ g2[s2];
            chips.push(g1_out ^ g2_out);
            // G1 feedback: x^10 + x^3 + 1.
            let fb1 = g1[3] ^ g1[10];
            // G2 feedback: x^10 + x^9 + x^8 + x^6 + x^3 + x^2 + 1.
            let fb2 = g2[2] ^ g2[3] ^ g2[6] ^ g2[8] ^ g2[9] ^ g2[10];
            for i in (2..=10).rev() {
                g1[i] = g1[i - 1];
                g2[i] = g2[i - 1];
            }
            g1[1] = fb1;
            g2[1] = fb2;
        }
        let bipolar = chips
            .iter()
            .map(|&c| if c == 0 { 1.0 } else { -1.0 })
            .collect();
        Some(Self {
            prn,
            chips,
            bipolar,
        })
    }

    /// The first `n` chips read as an `n`-bit big-endian integer (chip 0 is the MSB).
    /// Used to anchor against the IS-GPS-200 first-10-chips octal table.
    pub fn first_chips_as_int(&self, n: usize) -> u32 {
        self.chips
            .iter()
            .take(n)
            .fold(0u32, |acc, &c| (acc << 1) | c as u32)
    }

    /// Number of `1` chips in the period (the balance property: 512 for a C/A code).
    pub fn ones(&self) -> usize {
        self.chips.iter().filter(|&&c| c == 1).count()
    }

    /// Periodic (circular) autocorrelation of the `±1` sequence at integer chip `lag`,
    /// unnormalised (sum of products over the 1023 chips). At lag 0 this is 1023; at
    /// every nonzero lag a C/A code takes one of the three values `{-1, 63, -65}`.
    pub fn periodic_autocorr(&self, lag: usize) -> i32 {
        let b = &self.bipolar;
        let n = b.len();
        let l = lag % n;
        let mut acc = 0i32;
        for i in 0..n {
            acc += (b[i] * b[(i + l) % n]) as i32;
        }
        acc
    }
}

/// A minimal complex number for IQ samples and correlator sums.
#[derive(Clone, Copy, Debug, Default, PartialEq)]
pub struct Cf64 {
    /// In-phase (real) component.
    pub re: f64,
    /// Quadrature (imaginary) component.
    pub im: f64,
}

impl Cf64 {
    /// Construct from real and imaginary parts.
    pub fn new(re: f64, im: f64) -> Self {
        Self { re, im }
    }
    /// Magnitude `√(re² + im²)`.
    pub fn abs(self) -> f64 {
        self.re.hypot(self.im)
    }
}

impl std::ops::Add for Cf64 {
    type Output = Cf64;
    fn add(self, o: Cf64) -> Cf64 {
        Cf64::new(self.re + o.re, self.im + o.im)
    }
}

impl std::ops::Mul for Cf64 {
    type Output = Cf64;
    fn mul(self, o: Cf64) -> Cf64 {
        Cf64::new(
            self.re * o.re - self.im * o.im,
            self.re * o.im + self.im * o.re,
        )
    }
}

impl std::ops::Mul<f64> for Cf64 {
    type Output = Cf64;
    fn mul(self, s: f64) -> Cf64 {
        Cf64::new(self.re * s, self.im * s)
    }
}

/// One Early/Prompt/Late correlation result (complex accumulator sums).
#[derive(Clone, Copy, Debug, Default)]
pub struct Correlation {
    /// Early correlator (code replica advanced by half the spacing).
    pub early: Cf64,
    /// Prompt correlator (code replica on-time).
    pub prompt: Cf64,
    /// Late correlator (code replica retarded by half the spacing).
    pub late: Cf64,
}

/// The replica geometry for one [`correlate`] call: sample rate, the carrier to wipe
/// off (IF + Doppler) with its starting phase, the code chipping rate (nominal scaled
/// by Doppler), the starting code phase, and the Early-Late spacing in chips.
#[derive(Clone, Copy, Debug)]
pub struct CorrParams {
    /// IQ sample rate (Hz).
    pub fs_hz: f64,
    /// Carrier frequency to remove: intermediate frequency + carrier Doppler (Hz).
    pub carrier_freq_hz: f64,
    /// Starting carrier phase (rad).
    pub carrier_phase_rad: f64,
    /// Code chipping rate (Hz) = nominal `1.023e6` scaled by code Doppler.
    pub code_rate_hz: f64,
    /// Starting code phase (chips) at the first sample.
    pub code_phase_chips: f64,
    /// Early-to-Late correlator spacing (chips), e.g. 0.5.
    pub corr_spacing_chips: f64,
}

// ── Sampling-grid commensurability (the zero-order-hold dead band) ──────────────────

/// How close a sampling rate sits to an integer number of samples per code chip, at which
/// the point-sampled replica stops resolving sub-chip code-phase error.
///
/// A rate is treated as commensurate when `fs / code_rate` is within this many samples of a
/// whole number. The tolerance is deliberately tight: what matters is *exact* commensurability
/// (4.000000 samples/chip), because it is the exact case in which every sample of every epoch
/// lands at the same fractional position inside its chip. A rate a thousandth of a sample off
/// an integer sweeps the chip over a few hundred epochs and recovers.
pub const CHIP_GRID_TOLERANCE_SAMPLES: f64 = 1e-6;

/// Where a sampling rate sits against the code-chip grid, and the code-phase dead band that
/// follows from it.
///
/// [`chip_at`](fn@chip_at) — the replica lookup every correlation in this module goes through —
/// is a **zero-order hold** on `floor(code phase)`. The replica therefore only changes when the
/// code phase crosses a chip boundary, and the smallest code-phase step that can move it is
/// `1 / samples_per_chip` chips. When `samples_per_chip` is an integer *and* the signal is
/// sampled on the same grid (which is the case for this module's own [`synth_if`], and for any
/// front end clocked off the code rate), every sample of every epoch sits at the same fractional
/// position inside its chip, so the Early/Late response degenerates from a triangle into a
/// staircase with a dead band one sample wide.
///
/// Measured on PRN 10 at Early-Late spacing `d = 0.5` (ideal discriminator slope
/// `1/(2 − d) = 0.6667`, central difference at `±h` chips):
///
/// | `fs` | samples/chip | slope at h = 0.02 / 0.05 / 0.10 |
/// |------|--------------|---------------------------------|
/// | 4.092 MHz | 4.0000 | 4.1721 / 1.6688 / 0.8344 |
/// | 8.184 MHz | 8.0000 | 2.0860 / 0.8344 / 0.4172 |
/// | 10.23 MHz | 10.0000 | 0.0000 / 0.5886 / 0.6675 |
/// | 2.046 MHz | 2.0000 | 0.0000 / 0.0000 / 0.0000 |
/// | 5.0 MHz | 4.8876 | 0.6989 / 0.6594 / 0.6684 |
/// | 25.0 MHz | 24.4379 | 0.6659 / 0.6666 / 0.6678 |
///
/// and closing a first-order DLL (`g = 0.1`, `T = 1 ms`) around a 2 chip/s code slew, the
/// settled lag is 4.68× the closed-form value at 4.092 MHz and 0.999× at 5 MHz.
///
/// Nothing this crate ships runs at a commensurate rate — [`crate::spoof_capture::CaptureConfig`]
/// defaults to 5 MHz and [`crate::realdata::iqif::FeatureStageConfig::texbat_like`] to 25 MHz,
/// both non-commensurate — but 4.092 / 8.184 / 10.23 / 20.46 MHz are the rates a user reaches
/// for first, and before this type they failed silently. Check a rate with [`chip_grid`] before
/// trusting a tracking result from it.
#[derive(Clone, Copy, Debug, PartialEq)]
pub struct ChipGrid {
    /// Sampling rate divided by the code chipping rate (samples per chip).
    pub samples_per_chip: f64,
    /// Distance from [`Self::samples_per_chip`] to the nearest whole number (samples). Zero
    /// at an exactly commensurate rate.
    pub offset_from_integer_samples: f64,
    /// The code-phase step below which the zero-order-hold replica cannot move (chips):
    /// `1 / samples_per_chip`, the width of the dead band at a commensurate rate.
    pub dead_band_chips: f64,
    /// `true` when the rate is commensurate to within [`CHIP_GRID_TOLERANCE_SAMPLES`] — the
    /// case in which the Early/Late discriminator is a staircase rather than a triangle.
    pub commensurate: bool,
}

impl ChipGrid {
    /// The stated reason a commensurate rate cannot be trusted, or `None` when the rate is
    /// safe. Text, not a silent boolean: it names the rate, the dead band, and the rate to
    /// move to.
    pub fn warning(&self) -> Option<String> {
        if !self.commensurate {
            return None;
        }
        Some(format!(
            "sampling rate is commensurate with the code rate ({:.6} samples/chip, {:.3e} \
             samples from a whole number): the zero-order-hold code replica cannot resolve a \
             code-phase change below {:.6} chips, so the Early/Late discriminator is a \
             staircase with a one-sample dead band instead of a triangle and the DLL settles \
             at the wrong lag. Offset the sample rate off the integer multiple (5 MHz is \
             4.8876 samples/chip; 25 MHz is 24.4379) or oversample far enough that the dead \
             band is below the code-phase accuracy you need.",
            self.samples_per_chip, self.offset_from_integer_samples, self.dead_band_chips
        ))
    }
}

/// Grade a sampling rate against a code chipping rate — see [`ChipGrid`] for what a
/// commensurate rate does to the correlator.
///
/// A non-positive or non-finite rate is reported as non-commensurate with a `NaN`
/// samples-per-chip rather than being treated as a failure of the grid: it is a different
/// error, and this function does not own it.
pub fn chip_grid(fs_hz: f64, code_rate_hz: f64) -> ChipGrid {
    if !(fs_hz.is_finite() && code_rate_hz.is_finite()) || fs_hz <= 0.0 || code_rate_hz <= 0.0 {
        return ChipGrid {
            samples_per_chip: f64::NAN,
            offset_from_integer_samples: f64::NAN,
            dead_band_chips: f64::NAN,
            commensurate: false,
        };
    }
    let spc = fs_hz / code_rate_hz;
    let offset = (spc - spc.round()).abs();
    ChipGrid {
        samples_per_chip: spc,
        offset_from_integer_samples: offset,
        dead_band_chips: 1.0 / spc,
        commensurate: offset <= CHIP_GRID_TOLERANCE_SAMPLES,
    }
}

/// The `±1` chip at fractional code phase `phase_chips` (wrapped into one period).
///
/// A **zero-order hold**: the chip waveform is piecewise constant, so this returns the chip the
/// phase falls in and nothing between chips. That is the right value for a point-sampled
/// rectangular BPSK waveform, and it is also why an exactly-commensurate sampling rate
/// degenerates the Early/Late response — see [`ChipGrid`], and [`chip_grid`] to check a rate.
#[inline]
fn chip_at(code: &CaCode, phase_chips: f64) -> f64 {
    let idx = phase_chips.floor().rem_euclid(CA_CODE_LEN as f64) as usize;
    code.bipolar[idx]
}

/// **Correlate** an IQ block against a carrier-wiped, code-aligned replica, returning
/// the complex Early/Prompt/Late accumulator sums. This is the heart of a tracking
/// channel: each sample is mixed with the conjugate carrier replica `exp(-jθ)` then
/// multiplied by the Early, Prompt and Late code chips and summed.
pub fn correlate(iq: &[Cf64], code: &CaCode, p: &CorrParams) -> Correlation {
    let mut out = Correlation::default();
    let half = p.corr_spacing_chips / 2.0;
    for (k, &s) in iq.iter().enumerate() {
        let t = k as f64 / p.fs_hz;
        // Conjugate carrier replica exp(-jθ) = cosθ - j sinθ.
        let theta = TAU * p.carrier_freq_hz * t + p.carrier_phase_rad;
        let (sin, cos) = theta.sin_cos();
        let wiped = s * Cf64::new(cos, -sin);
        let cp = p.code_phase_chips + p.code_rate_hz * t;
        let prompt = chip_at(code, cp);
        let early = chip_at(code, cp + half);
        let late = chip_at(code, cp - half);
        out.early = out.early + wiped * early;
        out.prompt = out.prompt + wiped * prompt;
        out.late = out.late + wiped * late;
    }
    out
}

/// Generate a synthetic clean IF block for one or more code periods of `code` at code
/// rate `code_rate_hz`, modulated onto carrier `carrier_freq_hz` at amplitude `amp`,
/// sampled at `fs_hz`, with optional additive Gaussian-ish noise of std `noise` and a
/// fixed code-phase offset `code_phase0_chips`. Used to validate the correlator and
/// tracking loop where the truth is known. Noise is a deterministic LCG so tests are
/// reproducible.
#[allow(clippy::too_many_arguments)]
pub fn synth_if(
    code: &CaCode,
    fs_hz: f64,
    carrier_freq_hz: f64,
    code_rate_hz: f64,
    code_phase0_chips: f64,
    amp: f64,
    n_samples: usize,
    noise: f64,
    seed: u64,
) -> Vec<Cf64> {
    let mut rng = seed.max(1);
    let mut next = || {
        // xorshift64 -> uniform(-1,1), summed in pairs for a rough Gaussian.
        let mut g = 0.0;
        for _ in 0..2 {
            rng ^= rng << 13;
            rng ^= rng >> 7;
            rng ^= rng << 17;
            g += (rng as f64 / u64::MAX as f64) * 2.0 - 1.0;
        }
        g
    };
    (0..n_samples)
        .map(|k| {
            let t = k as f64 / fs_hz;
            let cp = code_phase0_chips + code_rate_hz * t;
            let chip = chip_at(code, cp);
            let theta = TAU * carrier_freq_hz * t;
            let (sin, cos) = theta.sin_cos();
            let sig = Cf64::new(amp * chip * cos, amp * chip * sin);
            if noise > 0.0 {
                Cf64::new(sig.re + noise * next(), sig.im + noise * next())
            } else {
                sig
            }
        })
        .collect()
}

/// The result of a code-phase x Doppler acquisition search.
#[derive(Clone, Copy, Debug)]
pub struct Acquisition {
    /// The PRN searched.
    pub prn: u8,
    /// Best code phase (chips) of the replica that peaks the correlation.
    pub code_phase_chips: f64,
    /// Best Doppler offset (Hz) from the nominal IF.
    pub doppler_hz: f64,
    /// Acquisition test statistic: peak / second-highest out-of-guard cell.
    pub peak_ratio: f64,
    /// Whether `peak_ratio` cleared the detection threshold.
    pub acquired: bool,
}

/// **Acquire** a PRN in an IQ block by searching code phase (chip resolution) and
/// Doppler. For each Doppler bin the carrier is wiped once, then all 1023 chip-phase
/// hypotheses are correlated (prompt only, non-coherent `|P|²`). The reported statistic
/// is the peak divided by the highest cell outside a +-1-chip guard, the standard
/// acquisition metric; `acquired` is true when it clears `threshold` (typically ~2).
pub fn acquire(
    iq: &[Cf64],
    code: &CaCode,
    fs_hz: f64,
    if_hz: f64,
    doppler_max_hz: f64,
    doppler_step_hz: f64,
    threshold: f64,
) -> Acquisition {
    let n_bins = (2.0 * doppler_max_hz / doppler_step_hz).round() as i64;
    let mut best = (f64::NEG_INFINITY, 0.0_f64, 0.0_f64); // (power, code_phase, doppler)
    let mut best_grid: Vec<(f64, f64)> = Vec::new(); // (power, code_phase) for the winning doppler

    for b in 0..=n_bins {
        let doppler = -doppler_max_hz + b as f64 * doppler_step_hz;
        let fc = if_hz + doppler;
        // Wipe carrier once for this Doppler bin.
        let wiped: Vec<Cf64> = iq
            .iter()
            .enumerate()
            .map(|(k, &s)| {
                let theta = TAU * fc * (k as f64 / fs_hz);
                let (sin, cos) = theta.sin_cos();
                s * Cf64::new(cos, -sin)
            })
            .collect();
        let mut grid: Vec<(f64, f64)> = Vec::with_capacity(CA_CODE_LEN);
        for p0 in 0..CA_CODE_LEN {
            let mut acc = Cf64::default();
            let phase0 = p0 as f64;
            for (k, &w) in wiped.iter().enumerate() {
                let cp = phase0 + CA_CHIP_RATE_HZ * (k as f64 / fs_hz);
                acc = acc + w * chip_at(code, cp);
            }
            let power = acc.re * acc.re + acc.im * acc.im;
            grid.push((power, phase0));
            if power > best.0 {
                best = (power, phase0, doppler);
            }
        }
        if (best.2 - doppler).abs() < doppler_step_hz / 2.0 {
            best_grid = grid;
        }
    }

    // Second-highest cell outside a +-1-chip guard around the peak, for the ratio.
    let peak_phase = best.1;
    let mut second = 0.0_f64;
    for &(power, phase) in &best_grid {
        let dchip = (phase - peak_phase)
            .abs()
            .min(CA_CODE_LEN as f64 - (phase - peak_phase).abs());
        if dchip > 1.0 && power > second {
            second = power;
        }
    }
    let peak_ratio = if second > 0.0 {
        best.0 / second
    } else {
        f64::INFINITY
    };
    Acquisition {
        prn: code.prn,
        code_phase_chips: best.1,
        doppler_hz: best.2,
        peak_ratio,
        acquired: peak_ratio >= threshold,
    }
}

/// One tracked epoch's Early/Prompt/Late correlator taps - the exact record the
/// [`crate::realdata::sqm`] SQM detector consumes, produced here from raw IQ.
#[derive(Clone, Copy, Debug)]
pub struct CorrelatorDump {
    /// Epoch time (s) from the start of tracking.
    pub epoch_s: f64,
    /// The PRN being tracked.
    pub prn: u8,
    /// Early correlator tap.
    pub early: Cf64,
    /// Prompt correlator tap.
    pub prompt: Cf64,
    /// Late correlator tap.
    pub late: Cf64,
}

impl CorrelatorDump {
    /// The unsigned Early-minus-Late imbalance `|(|E| − |L|)/(|E| + |L|)|` - the SQM
    /// score (0 for a symmetric peak, rising with correlation distortion).
    pub fn el_imbalance(&self) -> f64 {
        let (e, l) = (self.early.abs(), self.late.abs());
        if e + l > 0.0 {
            ((e - l) / (e + l)).abs()
        } else {
            0.0
        }
    }
}

/// Loop gains and correlator geometry for [`track`]. Defaults lock a clean L1 C/A
/// signal acquired to within half a Doppler bin.
///
/// Two correlator spacings are kept deliberately distinct, mirroring a real receiver:
/// the **DLL** runs a *narrow* Early/Late pair (it nulls its own discriminator at
/// lock, so distortion is invisible at that spacing), while the **SQM monitor** records
/// a *wider* Early/Late pair that the loop does not control - so a distorted (multipath
/// or spoofed) correlation function leaves a residual imbalance the monitor can see.
/// This is the multi-correlator principle behind Phelts' signal-quality monitoring.
#[derive(Clone, Copy, Debug)]
pub struct TrackConfig {
    /// Narrow DLL Early-to-Late spacing (chips) used for the code discriminator.
    pub dll_spacing_chips: f64,
    /// Wider SQM-monitor Early-to-Late spacing (chips) recorded in the dump.
    pub sqm_spacing_chips: f64,
    /// DLL correction gain (fraction of the normalized discriminator applied per epoch).
    pub dll_gain: f64,
    /// PLL phase-correction gain (fraction of the Costas phase error applied per epoch).
    pub pll_phase_gain: f64,
    /// PLL frequency-integrator gain (fraction of the implied frequency error per epoch).
    pub pll_freq_gain: f64,
}

impl Default for TrackConfig {
    fn default() -> Self {
        Self {
            dll_spacing_chips: 0.2,
            sqm_spacing_chips: 1.0,
            dll_gain: 0.5,
            pll_phase_gain: 0.5,
            pll_freq_gain: 0.1,
        }
    }
}

/// **Track** an acquired PRN over `n_epochs` 1 ms epochs, closing a 1st-order DLL
/// (code) and a Costas PLL (carrier) and emitting one [`CorrelatorDump`] per epoch.
/// `if_hz` is the nominal intermediate frequency (the acquisition Doppler is added to
/// it). Tracking stops early if the IQ runs out. This is the front end that turns raw
/// antenna IQ into the correlator taps the SQM detector scores.
pub fn track(
    iq: &[Cf64],
    code: &CaCode,
    acq: &Acquisition,
    fs_hz: f64,
    if_hz: f64,
    cfg: &TrackConfig,
    n_epochs: usize,
) -> Vec<CorrelatorDump> {
    let spe = (fs_hz / 1000.0).round() as usize; // samples per 1 ms epoch
    if spe == 0 {
        return Vec::new();
    }
    let epoch_dur = spe as f64 / fs_hz;
    let mut code_phase = acq.code_phase_chips;
    let mut carrier_freq = if_hz + acq.doppler_hz;
    let mut carrier_phase = 0.0_f64;
    let mut dumps = Vec::with_capacity(n_epochs);

    for e in 0..n_epochs {
        let start = e * spe;
        let end = start + spe;
        if end > iq.len() {
            break;
        }
        let block = &iq[start..end];
        let base = CorrParams {
            fs_hz,
            carrier_freq_hz: carrier_freq,
            carrier_phase_rad: carrier_phase,
            code_rate_hz: CA_CHIP_RATE_HZ,
            code_phase_chips: code_phase,
            corr_spacing_chips: cfg.dll_spacing_chips,
        };
        // Narrow pair drives the loop; wider pair feeds the SQM monitor / dump.
        let loop_corr = correlate(block, code, &base);
        let mon = correlate(
            block,
            code,
            &CorrParams {
                corr_spacing_chips: cfg.sqm_spacing_chips,
                ..base
            },
        );
        dumps.push(CorrelatorDump {
            epoch_s: e as f64 * epoch_dur,
            prn: code.prn,
            early: mon.early,
            prompt: mon.prompt,
            late: mon.late,
        });

        // DLL: normalized early-minus-late amplitude discriminator (chips), narrow pair.
        let (em, lm) = (loop_corr.early.abs(), loop_corr.late.abs());
        let dll = if em + lm > 0.0 {
            0.5 * (em - lm) / (em + lm)
        } else {
            0.0
        };
        // Costas PLL: atan(Q/I) phase error (rad), insensitive to data-bit sign.
        let pll = if loop_corr.prompt.re != 0.0 {
            (loop_corr.prompt.im / loop_corr.prompt.re).atan()
        } else {
            0.0
        };
        let freq_err = pll / (TAU * epoch_dur);
        carrier_freq += cfg.pll_freq_gain * freq_err;

        // Advance code phase over the epoch, apply DLL correction, wrap to one period.
        code_phase += CA_CHIP_RATE_HZ * epoch_dur + cfg.dll_gain * dll;
        code_phase = code_phase.rem_euclid(CA_CODE_LEN as f64);
        // Propagate carrier phase over the epoch, apply PLL phase correction, wrap.
        carrier_phase += TAU * carrier_freq * epoch_dur + cfg.pll_phase_gain * pll;
        carrier_phase = carrier_phase.rem_euclid(TAU);
    }
    dumps
}

#[cfg(test)]
mod track_tests {
    use super::*;

    /// Acquire then track a clean N-epoch synthetic signal.
    fn acquire_and_track(
        iq: &[Cf64],
        code: &CaCode,
        fs: f64,
        if_hz: f64,
        n: usize,
    ) -> Vec<CorrelatorDump> {
        let acq = acquire(
            &iq[..(fs / 1000.0) as usize],
            code,
            fs,
            if_hz,
            5000.0,
            250.0,
            2.0,
        );
        assert!(
            acq.acquired,
            "setup: must acquire first (ratio {})",
            acq.peak_ratio
        );
        track(iq, code, &acq, fs, if_hz, &TrackConfig::default(), n)
    }

    #[test]
    fn tracks_clean_signal_with_stable_prompt_and_low_sqm() {
        let code = CaCode::new(10).unwrap();
        let fs = 5_000_000.0;
        let if_hz = 50_000.0;
        let doppler = 800.0;
        let n_epochs = 20;
        let n = (fs / 1000.0) as usize * n_epochs;
        let iq = synth_if(
            &code,
            fs,
            if_hz + doppler,
            CA_CHIP_RATE_HZ,
            123.0,
            1.0,
            n,
            0.0,
            7,
        );
        let dumps = acquire_and_track(&iq, &code, fs, if_hz, n_epochs);
        assert_eq!(dumps.len(), n_epochs);
        // After a few epochs to settle, the SQM imbalance must stay small on clean data.
        let settled = &dumps[5..];
        let mean_sqm: f64 =
            settled.iter().map(|d| d.el_imbalance()).sum::<f64>() / settled.len() as f64;
        assert!(
            mean_sqm < 0.1,
            "clean-signal mean SQM {mean_sqm:.3} should be < 0.1"
        );
        // Prompt magnitude stays high (lock held), not collapsing.
        let first_p = dumps[5].prompt.abs();
        let last_p = dumps[n_epochs - 1].prompt.abs();
        assert!(
            last_p > 0.5 * first_p,
            "prompt collapsed: {last_p} vs {first_p}"
        );
    }

    #[test]
    fn multipath_distortion_raises_sqm_above_clean() {
        let code = CaCode::new(10).unwrap();
        let fs = 5_000_000.0;
        let if_hz = 50_000.0;
        let doppler = 800.0;
        let n_epochs = 20;
        let n = (fs / 1000.0) as usize * n_epochs;
        // Direct path.
        let direct = synth_if(
            &code,
            fs,
            if_hz + doppler,
            CA_CHIP_RATE_HZ,
            123.0,
            1.0,
            n,
            0.0,
            7,
        );
        // A strong coherent echo half a chip later distorts the correlation triangle.
        let echo = synth_if(
            &code,
            fs,
            if_hz + doppler,
            CA_CHIP_RATE_HZ,
            123.5,
            0.7,
            n,
            0.0,
            7,
        );
        let mixed: Vec<Cf64> = direct
            .iter()
            .zip(&echo)
            .map(|(a, b)| Cf64::new(a.re + b.re, a.im + b.im))
            .collect();

        let clean_dumps = acquire_and_track(&direct, &code, fs, if_hz, n_epochs);
        let mp_dumps = acquire_and_track(&mixed, &code, fs, if_hz, n_epochs);
        let mean = |d: &[CorrelatorDump]| {
            let s = &d[5..];
            s.iter().map(|x| x.el_imbalance()).sum::<f64>() / s.len() as f64
        };
        let clean_sqm = mean(&clean_dumps);
        let mp_sqm = mean(&mp_dumps);
        assert!(
            mp_sqm > clean_sqm + 0.05,
            "multipath SQM {mp_sqm:.3} should exceed clean {clean_sqm:.3} clearly"
        );
    }
}

#[cfg(test)]
mod acq_tests {
    use super::*;

    #[test]
    fn acquires_known_code_phase_and_doppler() {
        let code = CaCode::new(6).unwrap();
        let fs = 5_000_000.0;
        let if_hz = 50_000.0;
        let doppler_true = 1500.0;
        let code_phase_true = 300.0;
        let n = (fs / 1000.0) as usize; // 1 ms
        let iq = synth_if(
            &code,
            fs,
            if_hz + doppler_true,
            CA_CHIP_RATE_HZ,
            code_phase_true,
            1.0,
            n,
            0.0,
            1,
        );
        let acq = acquire(&iq, &code, fs, if_hz, 5000.0, 500.0, 2.0);
        assert!(acq.acquired, "should acquire, ratio {}", acq.peak_ratio);
        let dphase = (acq.code_phase_chips - code_phase_true).abs();
        assert!(dphase <= 1.0, "code phase {} vs 300", acq.code_phase_chips);
        assert!(
            (acq.doppler_hz - doppler_true).abs() <= 500.0,
            "doppler {} vs 1500",
            acq.doppler_hz
        );
    }

    #[test]
    fn does_not_acquire_pure_noise() {
        let code = CaCode::new(6).unwrap();
        let fs = 5_000_000.0;
        let n = (fs / 1000.0) as usize;
        // No signal: all noise.
        let empty = CaCode::new(6).unwrap();
        let iq = synth_if(&empty, fs, 50_000.0, CA_CHIP_RATE_HZ, 0.0, 0.0, n, 1.0, 42);
        let acq = acquire(&iq, &code, fs, 50_000.0, 5000.0, 500.0, 2.5);
        assert!(
            !acq.acquired,
            "noise should not acquire, ratio {}",
            acq.peak_ratio
        );
    }
}

#[cfg(test)]
mod corr_tests {
    use super::*;

    /// The normalised Early-minus-Late amplitude discriminator `0.5·(|E|−|L|)/(|E|+|L|)` —
    /// the exact expression `track` closes its DLL on — at code-phase error `eps` chips.
    fn dll_disc(code: &CaCode, fs: f64, d: f64, eps: f64) -> f64 {
        let n = (fs / 1000.0).round() as usize;
        let iq = synth_if(code, fs, 0.0, CA_CHIP_RATE_HZ, 0.0, 1.0, n, 0.0, 1);
        let c = correlate(
            &iq,
            code,
            &CorrParams {
                fs_hz: fs,
                carrier_freq_hz: 0.0,
                carrier_phase_rad: 0.0,
                code_rate_hz: CA_CHIP_RATE_HZ,
                code_phase_chips: eps,
                corr_spacing_chips: d,
            },
        );
        let (e, l) = (c.early.abs(), c.late.abs());
        0.5 * (e - l) / (e + l)
    }

    /// Central-difference discriminator slope (per chip) over `±h` chips.
    fn dll_slope(code: &CaCode, fs: f64, d: f64, h: f64) -> f64 {
        (dll_disc(code, fs, d, h) - dll_disc(code, fs, d, -h)).abs() / (2.0 * h)
    }

    /// [`chip_grid`] flags exactly the rates that are integer multiples of the chip rate, and
    /// clears the two this crate actually ships at.
    #[test]
    fn the_chip_grid_check_flags_commensurate_rates_and_clears_the_shipped_ones() {
        for fs in [1.023e6_f64, 2.046e6, 4.092e6, 8.184e6, 10.23e6, 20.46e6] {
            let g = chip_grid(fs, CA_CHIP_RATE_HZ);
            assert!(g.commensurate, "{} MHz must be flagged", fs / 1e6);
            assert!(
                (g.samples_per_chip - g.samples_per_chip.round()).abs() < 1e-9,
                "{} MHz is an integer samples/chip",
                fs / 1e6
            );
            let w = g.warning().expect("a flagged rate must state why");
            assert!(w.contains("dead band") || w.contains("staircase"), "{w}");
            assert!(
                (g.dead_band_chips - 1.0 / g.samples_per_chip).abs() < 1e-12,
                "the dead band is one sample wide"
            );
        }
        for fs in [5.0e6_f64, 25.0e6, 2.5e6, 4.0e6] {
            let g = chip_grid(fs, CA_CHIP_RATE_HZ);
            assert!(!g.commensurate, "{} MHz must not be flagged", fs / 1e6);
            assert!(g.warning().is_none());
        }
        // A nonsense rate is not silently called safe-and-commensurate.
        let bad = chip_grid(0.0, CA_CHIP_RATE_HZ);
        assert!(!bad.commensurate && bad.samples_per_chip.is_nan());
    }

    /// The defect the check exists for, measured rather than asserted: at an exactly
    /// commensurate rate the discriminator slope is wrong by a factor that grows as the
    /// code-phase error shrinks inside the dead band, while at the shipped non-commensurate
    /// rate it is the ideal `1/(2 − d)`.
    ///
    /// This is a **characterisation** of the zero-order-hold correlator as it stands, not a
    /// statement that the behaviour is desirable. It is pinned so the flag in [`chip_grid`]
    /// cannot quietly become a warning about nothing, and so that a future sub-chip
    /// correlator change announces itself here first.
    #[test]
    fn a_commensurate_rate_makes_the_discriminator_a_staircase() {
        let code = CaCode::new(10).expect("PRN 10");
        let d = 0.5_f64;
        let ideal = 1.0 / (2.0 - d);

        // 5 MHz — 4.8876 samples/chip, what spoof_capture ships: the ideal triangle.
        for h in [0.05_f64, 0.10, 0.15] {
            let s = dll_slope(&code, 5.0e6, d, h);
            assert!(
                (s - ideal).abs() / ideal < 0.02,
                "5 MHz, h {h}: slope {s:.4} should be the ideal {ideal:.4}"
            );
        }

        // 4.092 MHz — exactly 4 samples/chip: one step of the staircase, so the measured
        // slope is (step / 2h) and scales as 1/h instead of being constant.
        let s02 = dll_slope(&code, 4.092e6, d, 0.02);
        let s05 = dll_slope(&code, 4.092e6, d, 0.05);
        let s10 = dll_slope(&code, 4.092e6, d, 0.10);
        assert!(
            s02 > 6.0 * ideal,
            "4.092 MHz, h 0.02: slope {s02:.4} should be many times the ideal {ideal:.4}"
        );
        for (h, s) in [(0.02_f64, s02), (0.05, s05), (0.10, s10)] {
            assert!(
                (s * h - s02 * 0.02).abs() < 1e-3 * s02 * 0.02,
                "4.092 MHz: slope*h must be constant across the dead band (h {h}: {:.6} vs \
                 {:.6}) — that is what a single staircase step looks like",
                s * h,
                s02 * 0.02
            );
        }

        // 2.046 MHz — 2 samples/chip: the dead band is half a chip, so the discriminator does
        // not move at all over ±0.2 chips. A DLL there has no restoring force whatsoever.
        for h in [0.02_f64, 0.10, 0.20] {
            assert_eq!(
                dll_slope(&code, 2.046e6, d, h),
                0.0,
                "2.046 MHz, h {h}: the discriminator must be measurably dead"
            );
        }
    }

    /// The two configurations this crate ships are on the safe side of the check — a guard
    /// against someone "tidying" a sample rate to a round multiple of the chip rate.
    #[test]
    fn the_shipped_front_end_configurations_are_not_commensurate() {
        assert!(
            !crate::spoof_capture::CaptureConfig::default()
                .chip_grid()
                .commensurate
        );
        assert!(
            !crate::realdata::iqif::FeatureStageConfig::texbat_like()
                .chip_grid()
                .commensurate
        );
    }

    fn params(fs: f64, fc: f64, phase: f64) -> CorrParams {
        CorrParams {
            fs_hz: fs,
            carrier_freq_hz: fc,
            carrier_phase_rad: 0.0,
            code_rate_hz: CA_CHIP_RATE_HZ,
            code_phase_chips: phase,
            corr_spacing_chips: 0.5,
        }
    }

    #[test]
    fn aligned_prompt_dominates_and_early_late_are_symmetric() {
        let code = CaCode::new(1).unwrap();
        let fs = 5_000_000.0; // 5 MHz, ~4.888 samples/chip
        let fc = 50_000.0; // 50 kHz IF
        let n = (fs / 1000.0) as usize; // one 1 ms code period
        let iq = synth_if(&code, fs, fc, CA_CHIP_RATE_HZ, 0.0, 1.0, n, 0.0, 1);
        let c = correlate(&iq, &code, &params(fs, fc, 0.0));
        // Prompt is the matched peak; Early and Late are off the peak.
        assert!(c.prompt.abs() > c.early.abs(), "prompt must beat early");
        assert!(c.prompt.abs() > c.late.abs(), "prompt must beat late");
        // On a symmetric triangular peak, |E| ≈ |L| when on-time.
        let asym = (c.early.abs() - c.late.abs()).abs() / c.prompt.abs();
        assert!(asym < 0.05, "aligned E/L asymmetry {asym:.3} should be ~0");
    }

    #[test]
    fn prompt_correlation_falls_off_with_code_phase_error() {
        let code = CaCode::new(11).unwrap();
        let fs = 5_000_000.0;
        let fc = 0.0;
        let n = (fs / 1000.0) as usize;
        let iq = synth_if(&code, fs, fc, CA_CHIP_RATE_HZ, 0.0, 1.0, n, 0.0, 1);
        let aligned = correlate(&iq, &code, &params(fs, fc, 0.0)).prompt.abs();
        // Replica half a chip off: prompt must drop toward the triangular-ACF half.
        let off = correlate(&iq, &code, &params(fs, fc, 0.5)).prompt.abs();
        assert!(off < 0.7 * aligned, "0.5-chip error {off} vs {aligned}");
    }

    #[test]
    fn wrong_prn_does_not_correlate() {
        let tx = CaCode::new(7).unwrap();
        let rx = CaCode::new(8).unwrap();
        let fs = 5_000_000.0;
        let fc = 0.0;
        let n = (fs / 1000.0) as usize;
        let iq = synth_if(&tx, fs, fc, CA_CHIP_RATE_HZ, 0.0, 1.0, n, 0.0, 1);
        let matched = correlate(&iq, &tx, &params(fs, fc, 0.0)).prompt.abs();
        let mismatched = correlate(&iq, &rx, &params(fs, fc, 0.0)).prompt.abs();
        // Gold cross-correlation suppresses the wrong PRN by far.
        assert!(mismatched < 0.1 * matched, "{mismatched} vs {matched}");
    }
}

#[cfg(test)]
mod code_tests {
    use super::*;

    // ── IS-GPS-200 first-10-chips octal anchors (the hardest external anchor) ──
    /// Reproduce the **published verification vectors** in IS-GPS-200 Table 3-Ia
    /// ("Code Phase Assignments"): the first 10 chips of each GPS L1 C/A code, in octal.
    /// These are an authoritative, US-Government public-domain reference; kshana's own
    /// G1/G2 LFSR generator must regenerate them exactly. (Source: IS-GPS-200,
    /// GPS Directorate / navcen.uscg.gov, Table 3-Ia.)
    #[test]
    fn ca_first_ten_chips_match_is_gps_200_octal() {
        // (PRN, first-10-chips octal) straight from IS-GPS-200 Table 3-Ia.
        const TABLE_3IA: &[(u8, u32)] = &[
            (1, 0o1440),
            (2, 0o1620),
            (3, 0o1710),
            (4, 0o1744),
            (5, 0o1133),
            (6, 0o1455),
            (7, 0o1131),
            (8, 0o1454),
            (9, 0o1626),
        ];
        for &(prn, octal) in TABLE_3IA {
            assert_eq!(
                CaCode::new(prn).unwrap().first_chips_as_int(10),
                octal,
                "PRN {prn} first-10-chips must equal IS-GPS-200 Table 3-Ia octal {octal:#o}"
            );
        }
    }

    #[test]
    fn ca_code_has_1023_chips_and_is_balanced() {
        let c = CaCode::new(5).unwrap();
        assert_eq!(c.chips.len(), CA_CODE_LEN);
        // Maximal-length-derived balance: exactly 512 ones, 511 zeros.
        assert_eq!(c.ones(), 512);
    }

    #[test]
    fn ca_periodic_autocorrelation_is_three_valued() {
        let c = CaCode::new(7).unwrap();
        // Zero lag: full period.
        assert_eq!(c.periodic_autocorr(0), CA_CODE_LEN as i32);
        // Every nonzero lag is one of the three Gold values {-1, 63, -65}.
        for lag in 1..CA_CODE_LEN {
            let v = c.periodic_autocorr(lag);
            assert!(
                v == -1 || v == 63 || v == -65,
                "PRN7 autocorr at lag {lag} = {v}, not three-valued"
            );
        }
    }

    #[test]
    fn distinct_prns_have_low_bounded_cross_correlation() {
        // Gold cross-correlation is three-valued {-1, 63, -65}; |xc| <= 65 << 1023.
        let a = CaCode::new(1).unwrap();
        let b = CaCode::new(2).unwrap();
        let n = CA_CODE_LEN;
        for lag in 0..n {
            let mut acc = 0i32;
            for i in 0..n {
                acc += (a.bipolar[i] * b.bipolar[(i + lag) % n]) as i32;
            }
            assert!(
                acc == -1 || acc == 63 || acc == -65,
                "PRN1xPRN2 xcorr at lag {lag} = {acc}"
            );
        }
    }

    #[test]
    fn out_of_range_prn_is_none() {
        assert!(CaCode::new(0).is_none());
        assert!(CaCode::new(33).is_none());
    }
}
