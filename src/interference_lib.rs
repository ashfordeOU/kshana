// SPDX-License-Identifier: AGPL-3.0-only
//! **Interference model library: a parametric synthetic-interference generator, a
//! transparent reference fit and classifier, a classifier-generalisation benchmark and a
//! cross-stage (pre- and post-correlation) detection reference.** MODELLED.
//!
//! The library has six classes of complex-baseband interference added to unit-power thermal
//! noise ([`Class`]): none, continuous wave (optionally drifting), narrowband and wideband
//! band-limited noise (the boundary is an occupied bandwidth of 1 MHz), a linear-frequency
//! chirp (sawtooth or triangle sweep), and DME-like Gaussian pulse pairs (12 µs pair spacing).
//! [`synthesise`] draws a recording of a [`Model`] at a stated sample rate; the interference
//! power is stated as the jammer-to-noise ratio over the whole sampled band (`jnr_db`), as the
//! average power of the record (for pulses too).
//!
//! [`fit`] is the reference estimator: from a recording alone it estimates the noise floor
//! (iterated median of the bins not occupied), the power rise, the occupied band, a
//! short-time spectral peak track (a chirp's peak moves by a steady step; band noise's
//! jumps), and a block-power envelope (pulses are short and strong). It classifies the
//! recording with fixed, stated thresholds ([`classify`]), estimates the class's parameters,
//! re-synthesises the fitted model and states the **fit residual**: the RMS difference in dB
//! between the recording's Welch spectrum and the fitted model's. A small residual is what
//! "the synthetic spectrum matches the capture" means here.
//!
//! [`benchmark`] builds a labelled corpus in two parts: in-distribution (ID) parameter ranges
//! and out-of-distribution (OOD) ones (lower JNR, triangle sweeps, drifting tones, jittered
//! pulse spacing, see [`ranges`]). It scores the reference classifier, or any other
//! classifier's predictions (a CSV of `id,class`), per class on each part; the difference is
//! the generalisation gap. For every case it also reports the **cross-stage** pair: the
//! pre-correlation power rise and the post-correlation C/N0 loss that the estimated
//! interference spectrum causes to GPS L1 C/A at the band centre, through the spectral
//! separation coefficient (Betz, *Effect of partial-band interference on receiver estimation
//! of C/N0*, ION NTM 2001): `N0,eff = N0 + ∫ S_J(f)·G_s(f) df` with `G_s` the unit-area
//! BPSK(1) spectrum.
//!
//! **Honest scope.** Every number here comes from the synthetic library: the classifier's
//! accuracy on the corpus is not its accuracy on real captures, and no real capture is
//! bundled (TEXBAT and JammerTest recordings are not redistributed). `fit` is the tool to
//! state the residual on a real capture; until such a comparison is published the library is
//! MODELLED. Nothing here transmits: the generator writes files for receiver and detector
//! testing.

use crate::portable_math::PortableFloat;
use crate::sdr::Cf64;
use crate::spectrum::{fft_in_place, welch_psd};
use rand::{Rng, SeedableRng};
use rand_chacha::ChaCha8Rng;
use serde::{Deserialize, Serialize};
use std::collections::BTreeMap;
use std::f64::consts::PI;

/// Schema of the fit document.
pub const FIT_SCHEMA: &str = "kshana.interference-fit/1";
/// Schema of the benchmark document.
pub const BENCH_SCHEMA: &str = "kshana.interference-bench/1";
/// The occupied bandwidth (Hz) that separates narrowband from wideband noise.
pub const NARROW_WIDE_HZ: f64 = 1.0e6;
/// DME-like pulse-pair spacing (s).
const PAIR_SPACING_S: f64 = 12e-6;
/// GPS C/A chipping rate (Hz).
const CA_RATE: f64 = 1.023e6;

/// An interference class of the library.
#[derive(Clone, Copy, Debug, PartialEq, Eq, PartialOrd, Ord, Serialize, Deserialize)]
#[serde(rename_all = "snake_case")]
pub enum Class {
    /// No interference: thermal noise only.
    None,
    /// Continuous-wave tone at `centre_hz`, optionally drifting at `drift_hz_per_s`.
    Cw,
    /// Band-limited noise with an occupied bandwidth below [`NARROW_WIDE_HZ`].
    Narrowband,
    /// Band-limited noise with an occupied bandwidth of [`NARROW_WIDE_HZ`] or more.
    Wideband,
    /// Linear-frequency chirp sweeping `bandwidth_hz` around `centre_hz` every `period_s`.
    Chirp,
    /// DME-like Gaussian pulse pairs (12 µs spacing) repeating every `period_s`.
    Pulsed,
}

impl Class {
    /// Every class, in declaration order.
    pub const ALL: [Class; 6] = [
        Class::None,
        Class::Cw,
        Class::Narrowband,
        Class::Wideband,
        Class::Chirp,
        Class::Pulsed,
    ];
    /// The snake_case name of the class, as used in serialised documents and CSVs.
    pub fn as_str(self) -> &'static str {
        match self {
            Class::None => "none",
            Class::Cw => "cw",
            Class::Narrowband => "narrowband",
            Class::Wideband => "wideband",
            Class::Chirp => "chirp",
            Class::Pulsed => "pulsed",
        }
    }
    /// The class whose name ([`Class::as_str`]) equals `s` after trimming, if any.
    pub fn parse(s: &str) -> Option<Class> {
        Class::ALL.into_iter().find(|c| c.as_str() == s.trim())
    }
}

/// Chirp sweep shape.
#[derive(Clone, Copy, Debug, PartialEq, Eq, Serialize, Deserialize, Default)]
#[serde(rename_all = "snake_case")]
pub enum Sweep {
    /// Frequency rises linearly across the band, then jumps back to the start each period.
    #[default]
    Sawtooth,
    /// Frequency rises across the band over half a period and falls back over the other half.
    Triangle,
}

/// One interference model.
#[derive(Clone, Debug, PartialEq, Serialize, Deserialize)]
pub struct Model {
    /// Interference class to synthesise.
    pub class: Class,
    /// Centre frequency offset from the recording centre (Hz).
    #[serde(default)]
    pub centre_hz: f64,
    /// Occupied (noise) or swept (chirp) bandwidth (Hz).
    #[serde(default)]
    pub bandwidth_hz: f64,
    /// Chirp sweep period or pulse-pair repetition period (s).
    #[serde(default)]
    pub period_s: f64,
    /// Gaussian pulse full width at half amplitude (s).
    #[serde(default)]
    pub pulse_width_s: f64,
    /// Jammer-to-noise ratio over the sampled band (dB); ignored for `none`.
    #[serde(default)]
    pub jnr_db: f64,
    /// Chirp sweep shape.
    #[serde(default)]
    pub sweep: Sweep,
    /// Tone frequency drift (Hz/s).
    #[serde(default)]
    pub drift_hz_per_s: f64,
    /// Random jitter of the pulse-pair spacing, as a fraction of the spacing.
    #[serde(default)]
    pub pair_jitter: f64,
}

impl Model {
    /// A model of class `none` with every parameter zero (noise only).
    pub fn none() -> Model {
        Model {
            class: Class::None,
            centre_hz: 0.0,
            bandwidth_hz: 0.0,
            period_s: 0.0,
            pulse_width_s: 0.0,
            jnr_db: 0.0,
            sweep: Sweep::Sawtooth,
            drift_hz_per_s: 0.0,
            pair_jitter: 0.0,
        }
    }
}

fn complex_noise(rng: &mut ChaCha8Rng, n: usize, var: f64) -> Vec<Cf64> {
    let s = (var / 2.0).sqrt();
    (0..n)
        .map(|_| {
            Cf64::new(
                s * crate::portable_math::standard_normal(rng),
                s * crate::portable_math::standard_normal(rng),
            )
        })
        .collect()
}

fn power(x: &[Cf64]) -> f64 {
    x.iter().map(|c| c.re * c.re + c.im * c.im).sum::<f64>() / x.len().max(1) as f64
}

/// Band-limited complex noise of bandwidth `bw` about `f0` (an ideal brick-wall filter in the
/// transform domain), scaled to power `p`. `n` must be a power of two.
fn band_noise(rng: &mut ChaCha8Rng, n: usize, fs: f64, f0: f64, bw: f64, p: f64) -> Vec<Cf64> {
    let mut x = complex_noise(rng, n, 1.0);
    fft_in_place(&mut x, false);
    for (k, v) in x.iter_mut().enumerate() {
        let f = if k < n / 2 {
            k as f64
        } else {
            k as f64 - n as f64
        } * fs
            / n as f64;
        // Distance to f0 on the circle of aliases.
        let mut d = (f - f0).rem_euclid(fs);
        if d > fs / 2.0 {
            d -= fs;
        }
        if d.abs() > bw / 2.0 {
            *v = Cf64::default();
        }
    }
    fft_in_place(&mut x, true);
    let pw = power(&x);
    let g = if pw > 0.0 { (p / pw).sqrt() } else { 0.0 };
    x.into_iter().map(|c| c * g).collect()
}

/// Draw `n` samples (a power of two, at least 1024) at `fs` of `m` added to unit-power complex
/// thermal noise.
pub fn synthesise(m: &Model, fs: f64, n: usize, seed: u64) -> Vec<Cf64> {
    let mut rng = ChaCha8Rng::seed_from_u64(seed);
    let mut x = complex_noise(&mut rng, n, 1.0);
    if m.class == Class::None {
        return x;
    }
    let j = 10f64.ppowf(m.jnr_db / 10.0);
    let phi0: f64 = rng.gen_range(0.0..2.0 * PI);
    let dt = 1.0 / fs;
    let jam: Vec<Cf64> = match m.class {
        Class::None => unreachable!(),
        Class::Cw => {
            let a = j.sqrt();
            (0..n)
                .map(|k| {
                    let t = k as f64 * dt;
                    let ph = 2.0 * PI * (m.centre_hz * t + 0.5 * m.drift_hz_per_s * t * t) + phi0;
                    Cf64::new(a * ph.pcos(), a * ph.psin())
                })
                .collect()
        }
        Class::Narrowband | Class::Wideband => band_noise(
            &mut rng,
            n,
            fs,
            m.centre_hz,
            m.bandwidth_hz.max(fs / n as f64),
            j,
        ),
        Class::Chirp => {
            let a = j.sqrt();
            let period = m.period_s.max(4.0 * dt);
            let t0: f64 = rng.gen_range(0.0..period);
            let mut ph = phi0;
            (0..n)
                .map(|k| {
                    let tau = ((k as f64 * dt + t0) / period).fract();
                    let frac = match m.sweep {
                        Sweep::Sawtooth => tau,
                        Sweep::Triangle => {
                            if tau < 0.5 {
                                2.0 * tau
                            } else {
                                2.0 - 2.0 * tau
                            }
                        }
                    };
                    let f = m.centre_hz - m.bandwidth_hz / 2.0 + m.bandwidth_hz * frac;
                    let c = Cf64::new(a * ph.pcos(), a * ph.psin());
                    ph = (ph + 2.0 * PI * f * dt).rem_euclid(2.0 * PI);
                    c
                })
                .collect()
        }
        Class::Pulsed => {
            // Gaussian pulses: amplitude exp(−4 ln2 (t/w)²) has full width w at half amplitude.
            let w = m.pulse_width_s.max(2.0 * dt);
            let period = m.period_s.max(4.0 * PAIR_SPACING_S);
            let mut env = vec![0.0f64; n];
            let mut t_pair: f64 = rng.gen_range(0.0..period);
            let t_end = n as f64 * dt;
            let k4 = 4.0 * 2f64.pln();
            while t_pair < t_end + 3.0 * w {
                let spacing = PAIR_SPACING_S * (1.0 + m.pair_jitter * rng.gen_range(-1.0..1.0));
                for tc in [t_pair, t_pair + spacing] {
                    let lo = ((tc - 3.0 * w) / dt).floor().max(0.0) as usize;
                    let hi = (((tc + 3.0 * w) / dt).ceil() as usize).min(n);
                    for (k, e) in env.iter_mut().enumerate().take(hi).skip(lo) {
                        let u = (k as f64 * dt - tc) / w;
                        *e += (-k4 * u * u).pexp();
                    }
                }
                t_pair += period;
            }
            let mean_sq = env.iter().map(|e| e * e).sum::<f64>() / n as f64;
            let a = if mean_sq > 0.0 {
                (j / mean_sq).sqrt()
            } else {
                0.0
            };
            env.iter()
                .enumerate()
                .map(|(k, e)| {
                    let ph = 2.0 * PI * m.centre_hz * k as f64 * dt + phi0;
                    Cf64::new(a * e * ph.pcos(), a * e * ph.psin())
                })
                .collect()
        }
    };
    for (xi, ji) in x.iter_mut().zip(jam) {
        *xi = *xi + ji;
    }
    x
}

// ─────────────────────────────── features and fit ───────────────────────────────

/// The reference estimator's features of a recording.
#[derive(Clone, Debug, Serialize, PartialEq)]
pub struct Features {
    /// Total power over the estimated noise floor (dB).
    pub power_rise_db: f64,
    /// Largest Welch bin over the floor (dB).
    pub max_excess_db: f64,
    /// Bins at least 3 dB over the floor, as a bandwidth (Hz).
    pub occupied_bw_hz: f64,
    /// Excess power over the median excess level of the occupied bins, as a bandwidth (Hz).
    pub equivalent_bw_hz: f64,
    /// Power-weighted centre of the excess (Hz).
    pub centroid_hz: f64,
    /// Fraction of short-time steps whose peak move is within one bin of the median move.
    pub track_consistency: f64,
    /// Mean of the steady short-time peak moves (Hz per second).
    pub sweep_rate_hz_per_s: f64,
    /// Fraction of 16-sample blocks above ten times the median block power.
    pub duty: f64,
    /// Fraction of the excess power in the three Welch bins around the largest.
    pub concentration: f64,
    /// Peak block power over the mean (dB).
    pub papr_db: f64,
    /// Estimated sweep or pulse repetition period (s), zero when none is seen.
    pub period_s: f64,
    /// Estimated pulse full width at half amplitude (s).
    pub pulse_width_s: f64,
}

const LONG_NFFT: usize = 512;
const SHORT_NFFT: usize = 64;

fn floor_of(psd: &[f64]) -> f64 {
    let mut s: Vec<f64> = psd.to_vec();
    s.sort_by(f64::total_cmp);
    let mut floor = s[s.len() / 5];
    for _ in 0..4 {
        let mut free: Vec<f64> = psd.iter().copied().filter(|p| *p < 2.0 * floor).collect();
        if free.is_empty() {
            break;
        }
        free.sort_by(f64::total_cmp);
        floor = free[free.len() / 2];
    }
    floor.max(1e-300)
}

/// Compute the features of `x` sampled at `fs`. `x` must hold at least `LONG_NFFT` samples.
pub fn features(x: &[Cf64], fs: f64) -> Result<(Features, Vec<f64>, Vec<f64>), String> {
    let w = welch_psd(x, fs, LONG_NFFT, 0.5)?;
    let floor = floor_of(&w.psd);
    let bin = fs / LONG_NFFT as f64;
    let total = power(x);
    let power_rise_db = 10.0 * (total / (floor * fs)).max(1e-12).plog10();
    let max_excess_db = 10.0 * (w.psd.iter().cloned().fold(0.0, f64::max) / floor).plog10();
    let occ: Vec<usize> = (0..w.psd.len())
        .filter(|&k| w.psd[k] > 2.0 * floor)
        .collect();
    let occupied_bw_hz = occ.len() as f64 * bin;
    // Power-equivalent bandwidth: the excess power over the median excess level of the
    // occupied bins (exact for a flat band, insensitive to the window's edge leakage).
    let equivalent_bw_hz = {
        let mut ex: Vec<f64> = occ.iter().map(|&k| w.psd[k] - floor).collect();
        ex.sort_by(f64::total_cmp);
        let total: f64 = ex.iter().sum();
        match ex.get(ex.len() / 2) {
            Some(m) if *m > 0.0 => total / m * bin,
            _ => 0.0,
        }
    };
    let (mut num, mut den) = (0.0, 0.0);
    for &k in &occ {
        let e = w.psd[k] - floor;
        num += e * w.freq_hz[k];
        den += e;
    }
    let centroid_hz = if den > 0.0 { num / den } else { 0.0 };
    let kmax = (0..w.psd.len())
        .max_by(|a, b| w.psd[*a].total_cmp(&w.psd[*b]))
        .unwrap_or(0);
    let nb = w.psd.len();
    let top3: f64 = [nb + kmax - 1, kmax, kmax + 1]
        .iter()
        .map(|k| (w.psd[k % nb] - floor).max(0.0))
        .sum();
    let all_excess: f64 = w.psd.iter().map(|p| (p - floor).max(0.0)).sum();
    let concentration = if all_excess > 0.0 {
        top3 / all_excess
    } else {
        0.0
    };

    // Short-time peak track on non-overlapping segments.
    let nseg = x.len() / SHORT_NFFT;
    let mut peaks = Vec::with_capacity(nseg);
    let mut buf = vec![Cf64::default(); SHORT_NFFT];
    for s in 0..nseg {
        buf.copy_from_slice(&x[s * SHORT_NFFT..(s + 1) * SHORT_NFFT]);
        fft_in_place(&mut buf, false);
        let (mut best, mut bk) = (-1.0, 0usize);
        for (k, c) in buf.iter().enumerate() {
            let p = c.re * c.re + c.im * c.im;
            if p > best {
                best = p;
                bk = k;
            }
        }
        peaks.push(bk as i64);
    }
    let m = SHORT_NFFT as i64;
    let moves: Vec<i64> = peaks
        .windows(2)
        .map(|p| {
            let mut d = (p[1] - p[0]).rem_euclid(m);
            if d > m / 2 {
                d -= m;
            }
            d.abs()
        })
        .collect();
    let mut sorted = moves.clone();
    sorted.sort_unstable();
    let med = sorted.get(sorted.len() / 2).copied().unwrap_or(0);
    let track_consistency = if moves.is_empty() {
        0.0
    } else {
        moves.iter().filter(|d| (**d - med).abs() <= 1).count() as f64 / moves.len() as f64
    };
    let seg_t = SHORT_NFFT as f64 / fs;
    // The mean of the steady moves (within one bin of the median) resolves the step between
    // whole bins.
    let steady: Vec<i64> = moves
        .iter()
        .copied()
        .filter(|d| (*d - med).abs() <= 1)
        .collect();
    let mean_move = if steady.is_empty() {
        0.0
    } else {
        steady.iter().sum::<i64>() as f64 / steady.len() as f64
    };
    let sweep_rate_hz_per_s = mean_move * (fs / SHORT_NFFT as f64) / seg_t;

    // Block-power envelope.
    let blk = 16usize;
    let bp: Vec<f64> = x.chunks_exact(blk).map(power).collect();
    let mut bs = bp.clone();
    bs.sort_by(f64::total_cmp);
    let med_bp = bs.get(bs.len() / 2).copied().unwrap_or(0.0).max(1e-300);
    let mean_bp = bp.iter().sum::<f64>() / bp.len().max(1) as f64;
    let above: Vec<bool> = bp.iter().map(|p| *p > 10.0 * med_bp).collect();
    let duty = above.iter().filter(|a| **a).count() as f64 / above.len().max(1) as f64;
    let papr_db = 10.0
        * (bs.last().copied().unwrap_or(0.0) / mean_bp.max(1e-300))
            .max(1e-12)
            .plog10();
    // Pulse runs: widths and the spacing of run starts.
    let mut runs: Vec<(usize, usize)> = Vec::new();
    let mut k = 0;
    while k < above.len() {
        if above[k] {
            let s = k;
            while k < above.len() && above[k] {
                k += 1;
            }
            runs.push((s, k - s));
        } else {
            k += 1;
        }
    }
    let blk_t = blk as f64 / fs;
    let pulse_width_s = if runs.is_empty() {
        0.0
    } else {
        let mut wds: Vec<f64> = runs.iter().map(|r| r.1 as f64 * blk_t).collect();
        wds.sort_by(f64::total_cmp);
        wds[wds.len() / 2]
    };
    // Pair repetition period: starts separated by more than 3 pair spacings.
    let starts: Vec<f64> = runs.iter().map(|r| r.0 as f64 * blk_t).collect();
    let mut group_starts = Vec::new();
    for s in &starts {
        if group_starts
            .last()
            .is_none_or(|l: &f64| s - l > 3.0 * PAIR_SPACING_S)
        {
            group_starts.push(*s);
        }
    }
    let pulse_period = if group_starts.len() >= 2 {
        let mut d: Vec<f64> = group_starts.windows(2).map(|w| w[1] - w[0]).collect();
        d.sort_by(f64::total_cmp);
        d[d.len() / 2]
    } else {
        0.0
    };
    let chirp_period = if sweep_rate_hz_per_s > 0.0 {
        equivalent_bw_hz / sweep_rate_hz_per_s
    } else {
        0.0
    };
    let f = Features {
        power_rise_db,
        max_excess_db,
        occupied_bw_hz,
        equivalent_bw_hz,
        centroid_hz,
        track_consistency,
        sweep_rate_hz_per_s,
        duty,
        concentration,
        papr_db,
        period_s: 0.0,
        pulse_width_s,
    };
    let period_s = match classify(&f, fs) {
        Class::Pulsed => pulse_period,
        Class::Chirp => chirp_period,
        _ => 0.0,
    };
    Ok((Features { period_s, ..f }, w.freq_hz, w.psd))
}

/// The reference classifier's fixed thresholds (version `interference-lib/v1`):
/// `none` below 0.4 dB of power rise and 4 dB of largest excess; `pulsed` when some, but
/// under 30 %, of the blocks are ten times the median block power and the peak block is
/// 12 dB over the mean; `cw` when the three bins around the largest hold 85 % of the excess;
/// `chirp` when the short-time peak moves steadily (consistency over 0.6) across an occupied
/// band of at least 1.5 MHz; otherwise band noise, `narrowband` below 1 MHz of occupied band.
pub fn classify(f: &Features, _fs: f64) -> Class {
    if f.power_rise_db < 0.4 && f.max_excess_db < 4.0 {
        Class::None
    } else if f.duty > 0.0 && f.duty < 0.3 && f.papr_db > 12.0 {
        Class::Pulsed
    } else if f.concentration >= 0.85 {
        Class::Cw
    } else if f.track_consistency > 0.6 && f.occupied_bw_hz >= 1.5 * NARROW_WIDE_HZ {
        Class::Chirp
    } else if f.occupied_bw_hz < NARROW_WIDE_HZ {
        Class::Narrowband
    } else {
        Class::Wideband
    }
}

/// A fit of one recording.
#[derive(Clone, Debug, Serialize)]
pub struct Fit {
    /// The fitted interference model: classified class and estimated parameters.
    pub model: Model,
    /// The estimator's features of the recording that the classification used.
    pub features: Features,
    /// RMS of the dB difference between the recording's Welch spectrum and the fitted model's.
    pub residual_db: f64,
    /// Post-correlation C/N0 loss for GPS L1 C/A at the band centre (dB).
    pub ca_cn0_loss_db: f64,
}

/// Post-correlation C/N0 loss (dB) for a BPSK(1) signal at the band centre from the excess of
/// a Welch spectrum over its floor: `10·log10(1 + ∫(S−N0)·G_s df / N0)`, `G_s` the unit-area
/// `sinc²` spectrum of the 1.023 Mchip/s code.
pub fn ca_cn0_loss_db(freq_hz: &[f64], psd: &[f64], floor: f64, fs: f64) -> f64 {
    let bin = fs / psd.len().max(1) as f64;
    let mut acc = 0.0;
    for (f, p) in freq_hz.iter().zip(psd) {
        let u = PI * f / CA_RATE;
        let sinc2 = if u.abs() < 1e-12 {
            1.0
        } else {
            (u.psin() / u).ppowi(2)
        };
        let g = sinc2 / CA_RATE;
        acc += (p - floor).max(0.0) * g * bin;
    }
    10.0 * (1.0 + acc / floor).plog10()
}

fn welch_db(x: &[Cf64], fs: f64) -> Result<Vec<f64>, String> {
    Ok(welch_psd(x, fs, LONG_NFFT, 0.5)?
        .psd
        .iter()
        .map(|p| 10.0 * p.max(1e-300).plog10())
        .collect())
}

/// Fit the reference model to the recording `x` at `fs` (see the module documentation).
/// `seed` is used to re-synthesise the fitted model for the residual.
pub fn fit(x: &[Cf64], fs: f64, seed: u64) -> Result<Fit, String> {
    let n = x.len().next_power_of_two() / if x.len().is_power_of_two() { 1 } else { 2 };
    let x = &x[..n];
    let (f, freq, psd) = features(x, fs)?;
    let floor = floor_of(&psd);
    let class = classify(&f, fs);
    // Scale the record to unit noise power so the fitted JNR and the re-synthesis share it.
    let noise_power = floor * fs;
    let jnr_db = 10.0 * ((power(x) - noise_power) / noise_power).max(1e-6).plog10();
    let mut model = Model::none();
    model.class = class;
    if class != Class::None {
        model.jnr_db = jnr_db;
        model.centre_hz = f.centroid_hz;
        match class {
            Class::Cw => {
                // Refine the tone frequency to the peak bin.
                let k = (0..psd.len())
                    .max_by(|a, b| psd[*a].total_cmp(&psd[*b]))
                    .unwrap_or(0);
                model.centre_hz = freq[k];
            }
            Class::Narrowband | Class::Wideband => model.bandwidth_hz = f.equivalent_bw_hz,
            Class::Chirp => {
                model.bandwidth_hz = f.equivalent_bw_hz;
                model.period_s = f.period_s;
            }
            Class::Pulsed => {
                model.period_s = f.period_s;
                let k = (0..psd.len())
                    .max_by(|a, b| psd[*a].total_cmp(&psd[*b]))
                    .unwrap_or(0);
                model.centre_hz = freq[k];
                // The width from the spectrum: a Gaussian pulse of amplitude FWHM w has a
                // Gaussian power spectrum of standard deviation 1/(2·sqrt(2)·π·σ), with
                // w = 2·sqrt(2 ln 2)·σ. The second moment of the excess about the tone gives it;
                // the block-envelope run length is the fallback.
                let (mut m0, mut m2) = (0.0, 0.0);
                for (fq, p) in freq.iter().zip(&psd) {
                    let mut d = fq - model.centre_hz;
                    if d > fs / 2.0 {
                        d -= fs;
                    } else if d < -fs / 2.0 {
                        d += fs;
                    }
                    // Only bins clearly over the floor: noise in the far tails would dominate
                    // the second moment.
                    let e = if *p > 2.0 * floor { p - floor } else { 0.0 };
                    m0 += e;
                    m2 += e * d * d;
                }
                let sigma_f = if m0 > 0.0 { (m2 / m0).sqrt() } else { 0.0 };
                model.pulse_width_s = if sigma_f > 0.0 {
                    2.0 * (2.0 * 2f64.pln()).sqrt() / (2.0 * 2f64.sqrt() * PI * sigma_f)
                } else {
                    f.pulse_width_s.max(1e-7)
                };
            }
            Class::None => {}
        }
    }
    let scale = 1.0 / noise_power.sqrt();
    let xs: Vec<Cf64> = x.iter().map(|c| *c * scale).collect();
    let synth = synthesise(&model, fs, n, seed);
    let (a, b) = (welch_db(&xs, fs)?, welch_db(&synth, fs)?);
    let residual_db = (a
        .iter()
        .zip(&b)
        .map(|(p, q)| (p - q) * (p - q))
        .sum::<f64>()
        / a.len() as f64)
        .sqrt();
    let ca = ca_cn0_loss_db(&freq, &psd, floor, fs);
    Ok(Fit {
        model,
        features: f,
        residual_db,
        ca_cn0_loss_db: ca,
    })
}

// ─────────────────────────────── benchmark ───────────────────────────────

/// One labelled benchmark case.
#[derive(Clone, Debug, Serialize)]
pub struct Case {
    /// Case id: `id` or `ood`, the class name and a three-digit index (e.g. `ood-chirp-007`).
    pub id: String,
    /// Whether the case is drawn from the out-of-distribution ranges.
    pub ood: bool,
    /// The ground-truth model the case is synthesised from.
    pub model: Model,
    /// Seed for synthesising the case's recording.
    pub seed: u64,
}

/// The parameter ranges of the corpus: (in-distribution, out-of-distribution) draws for a
/// class. ID: JNR 5–20 dB; tones within ±3 MHz; narrowband 0.1–0.8 MHz; wideband 1.5–4 MHz;
/// sawtooth chirps of 2–4 MHz over 20–100 µs; pulse pairs of 2.5–4.5 µs every 200–500 µs.
/// OOD: JNR 0–5 dB, tones drifting up to ±200 kHz/ms, triangle sweeps, pair spacing jittered
/// by up to 30 %.
pub fn ranges() -> serde_json::Value {
    serde_json::json!({
        "sample_rate_hz": 10.0e6,
        "samples": 16384,
        "id": {"jnr_db": [5.0, 20.0], "cw_centre_hz": [-3.0e6, 3.0e6], "narrowband_bw_hz": [1.0e5, 8.0e5],
               "wideband_bw_hz": [1.5e6, 4.0e6], "chirp_bw_hz": [2.0e6, 4.0e6], "chirp_period_s": [2.0e-5, 1.0e-4],
               "chirp_sweep": "sawtooth", "pulse_width_s": [2.5e-6, 4.5e-6], "pulse_period_s": [2.0e-4, 5.0e-4]},
        "ood": {"jnr_db": [0.0, 5.0], "cw_drift_hz_per_s": [-2.0e8, 2.0e8], "chirp_sweep": "triangle",
                "pair_jitter": [0.0, 0.3]},
    })
}

/// Draw a case of `class`.
pub fn draw(class: Class, ood: bool, rng: &mut ChaCha8Rng) -> Model {
    let mut m = Model::none();
    m.class = class;
    if class == Class::None {
        return m;
    }
    m.jnr_db = if ood {
        rng.gen_range(0.0..5.0)
    } else {
        rng.gen_range(5.0..20.0)
    };
    match class {
        Class::Cw => {
            m.centre_hz = rng.gen_range(-3.0e6..3.0e6);
            if ood {
                m.drift_hz_per_s = rng.gen_range(-2.0e8..2.0e8);
            }
        }
        Class::Narrowband => {
            m.centre_hz = rng.gen_range(-3.0e6..3.0e6);
            m.bandwidth_hz = rng.gen_range(1.0e5..8.0e5);
        }
        Class::Wideband => {
            m.centre_hz = rng.gen_range(-2.0e6..2.0e6);
            m.bandwidth_hz = rng.gen_range(1.5e6..4.0e6);
        }
        Class::Chirp => {
            m.centre_hz = rng.gen_range(-2.0e6..2.0e6);
            m.bandwidth_hz = rng.gen_range(2.0e6..4.0e6);
            m.period_s = rng.gen_range(2.0e-5..1.0e-4);
            m.sweep = if ood {
                Sweep::Triangle
            } else {
                Sweep::Sawtooth
            };
        }
        Class::Pulsed => {
            m.centre_hz = rng.gen_range(-3.0e6..3.0e6);
            m.pulse_width_s = rng.gen_range(2.5e-6..4.5e-6);
            m.period_s = rng.gen_range(2.0e-4..5.0e-4);
            if ood {
                m.pair_jitter = rng.gen_range(0.0..0.3);
            }
        }
        Class::None => {}
    }
    m
}

/// The benchmark corpus: `per_class` ID and `per_class` OOD cases of every class.
pub fn corpus(per_class: usize, seed: u64) -> Vec<Case> {
    let mut rng = ChaCha8Rng::seed_from_u64(seed);
    let mut out = Vec::new();
    for ood in [false, true] {
        for class in Class::ALL {
            for i in 0..per_class {
                let model = draw(class, ood, &mut rng);
                out.push(Case {
                    id: format!(
                        "{}-{}-{i:03}",
                        if ood { "ood" } else { "id" },
                        class.as_str()
                    ),
                    ood,
                    model,
                    seed: rng.gen(),
                });
            }
        }
    }
    out
}

/// One scored case.
#[derive(Clone, Debug, Serialize)]
pub struct CaseScore {
    /// Id of the corpus case scored.
    pub id: String,
    /// Whether the case belongs to the out-of-distribution part.
    pub ood: bool,
    /// The class the case was synthesised from.
    pub truth: Class,
    /// The classifier's predicted class; `None` when no prediction was given for the case.
    pub predicted: Option<Class>,
    /// Pre-correlation power rise: total power over the estimated noise floor (dB).
    pub power_rise_db: f64,
    /// Post-correlation C/N0 loss for GPS L1 C/A at the band centre from the fitted spectrum (dB).
    pub ca_cn0_loss_db: f64,
}

/// Score predictions against a corpus: per part (`id`, `ood`), the accuracy, the per-class
/// recall and the confusion counts (`truth -> predicted -> n`, `missing` for no prediction).
pub fn score(cases: &[CaseScore]) -> serde_json::Value {
    let mut parts = serde_json::Map::new();
    for (name, ood) in [("id", false), ("ood", true)] {
        let sel: Vec<&CaseScore> = cases.iter().filter(|c| c.ood == ood).collect();
        let mut conf: BTreeMap<&str, BTreeMap<&str, usize>> = BTreeMap::new();
        let mut recall = serde_json::Map::new();
        for c in &sel {
            *conf
                .entry(c.truth.as_str())
                .or_default()
                .entry(c.predicted.map(Class::as_str).unwrap_or("missing"))
                .or_default() += 1;
        }
        for class in Class::ALL {
            let n = sel.iter().filter(|c| c.truth == class).count();
            let ok = sel
                .iter()
                .filter(|c| c.truth == class && c.predicted == Some(class))
                .count();
            if n > 0 {
                recall.insert(
                    class.as_str().into(),
                    serde_json::json!(ok as f64 / n as f64),
                );
            }
        }
        let ok = sel.iter().filter(|c| c.predicted == Some(c.truth)).count();
        parts.insert(
            name.into(),
            serde_json::json!({
                "cases": sel.len(),
                "accuracy": if sel.is_empty() { serde_json::Value::Null } else { serde_json::json!(ok as f64 / sel.len() as f64) },
                "recall": recall,
                "confusion": conf,
            }),
        );
    }
    let acc = |k: &str| parts.get(k).and_then(|p| p["accuracy"].as_f64());
    let gap = match (acc("id"), acc("ood")) {
        (Some(a), Some(b)) => serde_json::json!(a - b),
        _ => serde_json::Value::Null,
    };
    serde_json::json!({"parts": parts, "generalisation_gap": gap})
}

/// Run the benchmark: synthesise every case, fit the reference model, and score the
/// reference classifier and (when given) external predictions keyed by case id.
pub fn benchmark(
    per_class: usize,
    seed: u64,
    external: Option<&BTreeMap<String, Class>>,
) -> Result<serde_json::Value, String> {
    let fs = 10.0e6;
    let n = 16384;
    let cases = corpus(per_class, seed);
    let mut reference = Vec::new();
    let mut ext = Vec::new();
    let mut cross = Vec::new();
    for c in &cases {
        let x = synthesise(&c.model, fs, n, c.seed);
        let f = fit(&x, fs, c.seed ^ 0x5eed)?;
        let row = CaseScore {
            id: c.id.clone(),
            ood: c.ood,
            truth: c.model.class,
            predicted: Some(f.model.class),
            power_rise_db: f.features.power_rise_db,
            ca_cn0_loss_db: f.ca_cn0_loss_db,
        };
        cross.push(serde_json::json!({
            "id": c.id, "class": c.model.class, "jnr_db": c.model.jnr_db,
            "pre_correlation_power_rise_db": f.features.power_rise_db,
            "post_correlation_ca_cn0_loss_db": f.ca_cn0_loss_db,
            "fit_residual_db": f.residual_db,
        }));
        if let Some(e) = external {
            ext.push(CaseScore {
                predicted: e.get(&c.id).copied(),
                ..row.clone()
            });
        }
        reference.push(row);
    }
    Ok(serde_json::json!({
        "schema": BENCH_SCHEMA,
        "label": "MODELLED",
        "note": "synthetic library corpus; accuracy here is not accuracy on real captures",
        "classifier": "interference-lib/v1 reference (fixed thresholds)",
        "seed": seed,
        "per_class": per_class,
        "ranges": ranges(),
        "reference": score(&reference),
        "external": if external.is_some() { score(&ext) } else { serde_json::Value::Null },
        "cross_stage": cross,
    }))
}

/// Read external predictions: a CSV with a header naming `id` and `class` columns.
pub fn read_predictions(text: &str) -> Result<BTreeMap<String, Class>, String> {
    let mut lines = text.lines().filter(|l| !l.trim().is_empty());
    let head: Vec<&str> = lines
        .next()
        .unwrap_or("")
        .split(',')
        .map(str::trim)
        .collect();
    let (Some(ii), Some(ci)) = (
        head.iter().position(|h| *h == "id"),
        head.iter().position(|h| *h == "class"),
    ) else {
        return Err(crate::terr!(
            "e-interference-lib-bad-predictions",
            row = head.join(",")
        ));
    };
    let mut out = BTreeMap::new();
    for l in lines {
        let cells: Vec<&str> = l.split(',').map(str::trim).collect();
        let (Some(id), Some(cl)) = (cells.get(ii), cells.get(ci)) else {
            return Err(crate::terr!("e-interference-lib-bad-predictions", row = l));
        };
        let Some(class) = Class::parse(cl) else {
            return Err(crate::terr!("e-interference-lib-bad-predictions", row = l));
        };
        out.insert(id.to_string(), class);
    }
    Ok(out)
}

// ─────────────────────────────── SigMF I/O and CLI ───────────────────────────────

fn sigmf_paths(base: &str) -> (String, String) {
    let b = base
        .trim_end_matches(".sigmf-meta")
        .trim_end_matches(".sigmf-data")
        .trim_end_matches('.');
    (format!("{b}.sigmf-meta"), format!("{b}.sigmf-data"))
}

/// Write `x` as a `cf32_le` SigMF recording at `base` with the model in its description.
pub fn write_sigmf(base: &str, x: &[Cf64], fs: f64, m: &Model) -> Result<(), String> {
    let desc = format!(
        "MODELLED synthetic interference (kshana interference-lib): {}",
        serde_json::to_string(m).unwrap_or_default()
    );
    let rec = crate::sigmf::Recording {
        meta: crate::sigmf::Meta::new(crate::sigmf::DataType::Cf32Le, fs, 0.0, &desc),
        samples: x.to_vec(),
    };
    let (json, bytes, _) = crate::sigmf::write(&rec, 1.0)?;
    let (mp, dp) = sigmf_paths(base);
    std::fs::write(&mp, json)
        .map_err(|e| crate::terr!("e-interference-lib-cannot-write", path = mp, e = e))?;
    std::fs::write(&dp, bytes)
        .map_err(|e| crate::terr!("e-interference-lib-cannot-write", path = dp, e = e))
}

/// Read a SigMF recording at `base` (either file of the pair): samples and sample rate.
pub fn read_sigmf(base: &str) -> Result<(Vec<Cf64>, f64), String> {
    let (mp, dp) = sigmf_paths(base);
    let meta = std::fs::read_to_string(&mp)
        .map_err(|e| crate::terr!("e-interference-lib-cannot-read", path = mp, e = e))?;
    let data = std::fs::read(&dp)
        .map_err(|e| crate::terr!("e-interference-lib-cannot-read", path = dp, e = e))?;
    let rec = crate::sigmf::read(&meta, &data, 1.0)?;
    let fs = rec.sample_rate_hz()?;
    Ok((rec.samples, fs))
}

/// `kshana interference-lib <models|generate|fit|bench> ...`. Returns the exit code.
pub fn run_cli(args: &[String]) -> i32 {
    match run_inner(args) {
        Ok(()) => 0,
        Err(e) => {
            eprintln!("{e}");
            2
        }
    }
}

fn num(args: &[String], i: &mut usize) -> Result<f64, String> {
    *i += 1;
    let opt = args[*i - 1].as_str();
    let v = args
        .get(*i)
        .ok_or_else(|| crate::terr!("e-interference-lib-missing-value", option = opt))?;
    v.parse::<f64>()
        .ok()
        .filter(|x| x.is_finite())
        .ok_or_else(|| {
            crate::terr!(
                "e-interference-lib-bad-number",
                option = opt,
                value = v.as_str()
            )
        })
}

fn text(args: &[String], i: &mut usize) -> Result<String, String> {
    *i += 1;
    args.get(*i).cloned().ok_or_else(|| {
        crate::terr!(
            "e-interference-lib-missing-value",
            option = args[*i - 1].as_str()
        )
    })
}

fn emit(doc: &serde_json::Value, out: Option<&str>) -> Result<(), String> {
    let s = serde_json::to_string_pretty(doc).unwrap_or_default();
    match out {
        Some(p) => std::fs::write(p, s + "\n")
            .map_err(|e| crate::terr!("e-interference-lib-cannot-write", path = p, e = e)),
        None => {
            println!("{s}");
            Ok(())
        }
    }
}

fn run_inner(args: &[String]) -> Result<(), String> {
    let usage = || crate::t!("interference-lib-usage");
    let Some(sub) = args.first() else {
        return Err(usage());
    };
    if args.iter().any(|a| a == "--help" || a == "-h") {
        println!("{}", usage());
        return Ok(());
    }
    let mut m = Model::none();
    let (mut fs, mut n, mut seed, mut per_class) = (10.0e6, 65536usize, 1u64, 20usize);
    let (mut out, mut predictions, mut positional) = (None, None, Vec::new());
    let mut i = 1;
    while i < args.len() {
        match args[i].as_str() {
            "--class" => {
                let v = text(args, &mut i)?;
                m.class = Class::parse(&v)
                    .ok_or_else(|| crate::terr!("e-interference-lib-unknown-class", value = v))?;
            }
            "--centre-hz" => m.centre_hz = num(args, &mut i)?,
            "--bandwidth-hz" => m.bandwidth_hz = num(args, &mut i)?,
            "--period-s" => m.period_s = num(args, &mut i)?,
            "--pulse-width-s" => m.pulse_width_s = num(args, &mut i)?,
            "--jnr-db" => m.jnr_db = num(args, &mut i)?,
            "--drift-hz-per-s" => m.drift_hz_per_s = num(args, &mut i)?,
            "--triangle" => m.sweep = Sweep::Triangle,
            "--fs" => fs = num(args, &mut i)?,
            "--samples" => n = num(args, &mut i)? as usize,
            "--seed" => seed = num(args, &mut i)? as u64,
            "--per-class" => per_class = num(args, &mut i)? as usize,
            "--out" => out = Some(text(args, &mut i)?),
            "--predictions" => predictions = Some(text(args, &mut i)?),
            s if s.starts_with('-') => {
                return Err(crate::terr!(
                    "e-interference-lib-unknown-option",
                    option = s
                ))
            }
            s => positional.push(s.to_string()),
        }
        i += 1;
    }
    match sub.as_str() {
        "models" => emit(
            &serde_json::json!({"classes": Class::ALL, "ranges": ranges(), "narrow_wide_hz": NARROW_WIDE_HZ}),
            out.as_deref(),
        ),
        "generate" => {
            let Some(base) = out else {
                return Err(usage());
            };
            if fs.is_nan() || fs <= 0.0 || !n.is_power_of_two() || !(1024..=1 << 24).contains(&n) {
                return Err(crate::terr!("e-interference-lib-bad-size"));
            }
            let x = synthesise(&m, fs, n, seed);
            write_sigmf(&base, &x, fs, &m)?;
            eprintln!(
                "{}",
                crate::t!(
                    "interference-lib-written",
                    path = sigmf_paths(&base).1,
                    n = n
                )
            );
            Ok(())
        }
        "fit" => {
            let [input] = positional.as_slice() else {
                return Err(usage());
            };
            let (x, fs) = read_sigmf(input)?;
            if x.len() < 4 * LONG_NFFT {
                return Err(crate::terr!("e-interference-lib-bad-size"));
            }
            let f = fit(&x, fs, seed)?;
            emit(
                &serde_json::json!({
                    "schema": FIT_SCHEMA,
                    "label": "MODELLED",
                    "classifier": "interference-lib/v1 reference (fixed thresholds)",
                    "input": input,
                    "sample_rate_hz": fs,
                    "samples": x.len(),
                    "fit": f,
                }),
                out.as_deref(),
            )
        }
        "bench" => {
            let ext = match predictions {
                Some(p) => Some(read_predictions(&std::fs::read_to_string(&p).map_err(
                    |e| crate::terr!("e-interference-lib-cannot-read", path = p, e = e),
                )?)?),
                None => None,
            };
            if per_class == 0 || per_class > 1000 {
                return Err(crate::terr!("e-interference-lib-bad-size"));
            }
            let doc = benchmark(per_class, seed, ext.as_ref())?;
            emit(&doc, out.as_deref())
        }
        "cases" => {
            // The corpus as a CSV (id, ood, class and parameters), for an external classifier
            // that draws its own recordings with `generate`.
            let mut s = String::from("id,ood,class,centre_hz,bandwidth_hz,period_s,pulse_width_s,jnr_db,sweep,drift_hz_per_s,pair_jitter,seed\n");
            for c in corpus(per_class, seed) {
                let m = &c.model;
                s.push_str(&format!(
                    "{},{},{},{},{},{},{},{},{},{},{},{}\n",
                    c.id,
                    c.ood,
                    m.class.as_str(),
                    m.centre_hz,
                    m.bandwidth_hz,
                    m.period_s,
                    m.pulse_width_s,
                    m.jnr_db,
                    if m.sweep == Sweep::Triangle {
                        "triangle"
                    } else {
                        "sawtooth"
                    },
                    m.drift_hz_per_s,
                    m.pair_jitter,
                    c.seed
                ));
            }
            match out {
                Some(p) => std::fs::write(&p, s)
                    .map_err(|e| crate::terr!("e-interference-lib-cannot-write", path = p, e = e)),
                None => {
                    print!("{s}");
                    Ok(())
                }
            }
        }
        _ => Err(usage()),
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn noise_only_has_unit_power_and_no_rise() {
        let x = synthesise(&Model::none(), 10e6, 16384, 3);
        assert!((power(&x) - 1.0).abs() < 0.05);
        let (f, _, _) = features(&x, 10e6).unwrap();
        assert!(f.power_rise_db.abs() < 0.4, "{f:?}");
        assert_eq!(classify(&f, 10e6), Class::None);
    }

    #[test]
    fn jnr_sets_the_interference_power() {
        for class in [Class::Cw, Class::Narrowband, Class::Chirp, Class::Pulsed] {
            let mut rng = ChaCha8Rng::seed_from_u64(9);
            let mut m = draw(class, false, &mut rng);
            m.jnr_db = 10.0;
            let x = synthesise(&m, 10e6, 65536, 4);
            let p = power(&x);
            assert!((p - 11.0).abs() < 0.6, "{class:?}: {p}");
        }
    }

    #[test]
    fn ca_loss_of_a_centred_tone_matches_the_closed_form() {
        // A tone at the band centre: SSC = 1/Rc, so the loss is 10·log10(1 + J/(N0·Rc)).
        let mut m = Model::none();
        m.class = Class::Cw;
        m.jnr_db = 10.0;
        let fs = 10e6;
        let x = synthesise(&m, fs, 65536, 5);
        let w = welch_psd(&x, fs, LONG_NFFT, 0.5).unwrap();
        let floor = floor_of(&w.psd);
        let got = ca_cn0_loss_db(&w.freq_hz, &w.psd, floor, fs);
        let j = 10.0; // J/N with N = N0·fs = 1.
        let expect = 10.0 * (1.0 + j * fs / CA_RATE).log10();
        assert!((got - expect).abs() < 0.5, "{got} vs {expect}");
    }
}
