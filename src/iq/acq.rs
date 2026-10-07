// SPDX-License-Identifier: AGPL-3.0-only
//! **FFT parallel code-phase acquisition for any [`SpreadingCode`].**
//!
//! For every Doppler bin the carrier (intermediate frequency plus the bin's Doppler) is
//! wiped off the samples, each coherent block of `N` code periods is folded onto one
//! period (the sum of its periods, which is the coherent integration because the replica
//! repeats every period), and the circular correlation against one sampled period of the
//! code is formed for every code phase at once with a fast Fourier transform:
//! `IFFT(FFT(fold) · conj(FFT(replica)))`. The squared magnitudes of `M` consecutive
//! blocks are summed (non-coherent integration).
//!
//! The FFT is the crate's existing mixed-radix transform ([`crate::acquisition::fft_forward`]
//! and its plan in `crate::portable_math`), so a search returns the same bits on every
//! platform. The detector statistics are the existing square-law / Marcum-Q ones in
//! [`crate::acquisition`]: each cell is normalised by the measured sample power `σ²` to
//! `2·G/(L·σ²)`, which under noise alone is chi-square with `2M` degrees of freedom and with
//! a signal is non-central chi-square with non-centrality `2M·ρ`, `ρ = (C/N0)·N·T_code`.
//! The threshold is [`crate::acquisition::threshold_for_pfa`] at the per-cell false-alarm
//! probability that gives the requested probability over the whole grid,
//! `1 − (1 − P_fa)^(1/N_cells)`, and [`predicted_pd`] is
//! [`crate::acquisition::pd_square_law`] at that threshold.
//!
//! The code is evaluated through [`SpreadingCode::value_at`] at the sample instants
//! (point sampling, no front-end filter), so BPSK and BOC codes both work. A sample rate
//! must hold a whole number of samples per code period.
//!
//! Scope, stated: no code-Doppler compensation across non-coherent blocks, no data-bit
//! wipe-off (a bit edge inside a coherent block loses correlation), no straddle-loss
//! recovery beyond choosing a fine Doppler step, no cell-averaging CFAR. MODELLED: the
//! detector identities are checked against the analytic Marcum-Q values by seeded Monte
//! Carlo in `tests/iq_receiver.rs`, not against an external dataset.

use super::{Cf64, IqError, IqSource, SampleSpec, SpreadingCode};
use crate::acquisition::{pd_square_law, threshold_for_pfa};
use crate::portable_math::{FftPlan, PortableFloat};

/// The parameters of one acquisition search.
#[derive(Clone, Copy, Debug, PartialEq)]
pub struct AcqConfig {
    /// Coherent integration in whole code periods (`N`).
    pub coherent_periods: usize,
    /// Number of consecutive coherent blocks whose powers are summed (`M`).
    pub noncoherent: usize,
    /// The Doppler grid is `j · doppler_step_hz` for every integer `j` with
    /// `|j · doppler_step_hz| ≤ doppler_max_hz` (symmetric, always containing 0).
    pub doppler_max_hz: f64,
    /// Doppler bin spacing (Hz). A common choice is `2 / (3 · N · T_code)`.
    pub doppler_step_hz: f64,
    /// False-alarm probability for the whole search grid.
    pub pfa: f64,
}

/// Coherent integration time (s) the tracking hand-off searches with by default: about
/// 4 ms. See [`auto_coherent_periods`].
pub const AUTO_COHERENT_S: f64 = 4.0e-3;

/// The default coherent length, in whole code periods, of the acquisition that initialises
/// tracking: `ceil(4 ms / T_code)`, at least one period. That is 4 periods for a 1 ms code
/// (GPS L1 C/A, L5) and 1 for a code of 4 ms or longer (Galileo E1, BeiDou B1C, GPS L2C).
/// With the default Doppler step `2 / (3 · N · T_code)` it gives ~167 Hz bins on every
/// signal.
///
/// Why not one period: a 1 ms search has ~667 Hz Doppler bins, and a hand-off up to
/// ~333 Hz off leaves the FLL outside its pull-in. On a seeded sweep of 180 GPS L1 C/A
/// channels (±5 kHz, 38 to 47 dB-Hz; `docs/design/evidence/iq-track-acq-default/`) one
/// period false-locked 27 channels ~500 Hz off and missed 102; this default false-locked 1
/// (36 Hz off at 38 dB-Hz) and missed 11, for ~40 ms more search per PRN.
pub fn auto_coherent_periods(code_period_s: f64) -> usize {
    if !(code_period_s.is_finite() && code_period_s > 0.0) {
        return 1;
    }
    // The small tolerance keeps 4 ms / 1 ms (4.000…01 in binary) at 4, not 5.
    ((AUTO_COHERENT_S / code_period_s - 1e-9).ceil() as usize).max(1)
}

impl AcqConfig {
    /// The Doppler grid (Hz), ascending.
    pub fn doppler_bins(&self) -> Vec<f64> {
        let n = (self.doppler_max_hz / self.doppler_step_hz + 1e-9).floor() as i64;
        (-n..=n).map(|j| j as f64 * self.doppler_step_hz).collect()
    }
}

/// Samples in one period of `code` at the sample rate of `spec`, or an error when that is
/// not a whole number (within 1e-6 of a sample).
pub fn samples_per_period(spec: &SampleSpec, code: &dyn SpreadingCode) -> Result<usize, String> {
    let spc = spec.fs_hz * code.period_s();
    if !(spc.is_finite() && spc >= 2.0) || (spc - spc.round()).abs() > 1e-6 {
        return Err(format!(
            "{} Hz does not hold a whole number of samples per {} period ({spc} samples)",
            spec.fs_hz,
            code.name()
        ));
    }
    Ok(spc.round() as usize)
}

/// Number of samples one search of `cfg` consumes: `N · M` code periods.
pub fn samples_needed(
    spec: &SampleSpec,
    code: &dyn SpreadingCode,
    cfg: &AcqConfig,
) -> Result<usize, String> {
    Ok(samples_per_period(spec, code)? * cfg.coherent_periods * cfg.noncoherent)
}

/// The outcome of one search.
#[derive(Clone, Debug, PartialEq)]
pub struct AcqResult {
    /// Name of the code searched.
    pub code_name: String,
    /// Doppler of the peak bin (Hz), relative to the intermediate frequency.
    pub doppler_hz: f64,
    /// Index of the peak Doppler bin in [`AcqConfig::doppler_bins`].
    pub doppler_index: usize,
    /// Lag of the peak (samples, `0 .. samples_per_period`): the sample, counted from the
    /// first sample searched, at which a code period starts.
    pub delay_samples: usize,
    /// Code phase of the signal at the first sample searched (chips, `0 .. len`).
    pub code_phase_chips: f64,
    /// Normalised peak `2·G_max/(L·σ²)` (chi-square with `2M` degrees of freedom under noise).
    pub statistic: f64,
    /// Largest normalised cell in the peak's Doppler bin more than one chip (plus one
    /// sample) from the peak.
    pub second_peak: f64,
    /// `statistic / second_peak`: the peak-to-second-peak ratio.
    pub peak_ratio: f64,
    /// Per-cell false-alarm probability the threshold was set for.
    pub pfa_cell: f64,
    /// The normalised threshold `statistic` is compared with.
    pub threshold: f64,
    /// Whether `statistic` exceeded `threshold`.
    pub acquired: bool,
    /// Samples per code period (`L / N`).
    pub samples_per_period: usize,
    /// Number of Doppler bins searched.
    pub n_doppler_bins: usize,
    /// Mean sample power `σ²` used to normalise.
    pub sample_power: f64,
}

/// A search together with its full normalised grid `grid[doppler_index][lag]`.
#[derive(Clone, Debug, PartialEq)]
pub struct AcqGrid {
    /// The search outcome.
    pub result: AcqResult,
    /// Normalised cell values `2·G/(L·σ²)`, one row per Doppler bin.
    pub grid: Vec<Vec<f64>>,
}

/// Search `samples` (at least [`samples_needed`] long; the first that many are used),
/// sampled as `spec`, for `code`.
pub fn acquire(
    samples: &[Cf64],
    spec: &SampleSpec,
    code: &dyn SpreadingCode,
    cfg: &AcqConfig,
) -> Result<AcqGrid, String> {
    if cfg.coherent_periods == 0 || cfg.noncoherent == 0 {
        return Err("coherent_periods and noncoherent must be positive".into());
    }
    if !(cfg.doppler_step_hz > 0.0 && cfg.doppler_max_hz >= 0.0) {
        return Err("the Doppler grid needs a positive step and a non-negative maximum".into());
    }
    if !(cfg.pfa > 0.0 && cfg.pfa < 1.0) {
        return Err("pfa must lie in (0, 1)".into());
    }
    let spc = samples_per_period(spec, code)?;
    let block = spc * cfg.coherent_periods;
    let needed = block * cfg.noncoherent;
    if samples.len() < needed {
        return Err(format!(
            "{} samples supplied, {needed} needed",
            samples.len()
        ));
    }
    let bins = cfg.doppler_bins();
    let fs = spec.fs_hz;
    let chips_per_sample = code.chip_rate_hz() / fs;

    let plan = FftPlan::new(spc);
    let rep: Vec<(f64, f64)> = (0..spc)
        .map(|i| (code.value_at(i as f64 * chips_per_sample), 0.0))
        .collect();
    let code_fft: Vec<(f64, f64)> = plan
        .forward(&rep)
        .into_iter()
        .map(|(r, i)| (r, -i))
        .collect();

    let power: f64 = samples[..needed]
        .iter()
        .map(|x| x.re * x.re + x.im * x.im)
        .sum();
    let sigma2 = power / needed as f64;
    if sigma2.is_nan() || sigma2 <= 0.0 {
        return Err("the samples carry no power".into());
    }

    let mut grid = vec![vec![0.0_f64; spc]; bins.len()];
    for (row, &d) in grid.iter_mut().zip(&bins) {
        let f = spec.if_hz + d;
        for m in 0..cfg.noncoherent {
            let start = m * block;
            let mut fold = vec![(0.0_f64, 0.0_f64); spc];
            for i in 0..block {
                let n = start + i;
                let cyc = (f * n as f64 / fs).fract();
                let (sn, cs) = (-core::f64::consts::TAU * cyc).psin_cos();
                let s = samples[n];
                let r = &mut fold[i % spc];
                r.0 += s.re * cs - s.im * sn;
                r.1 += s.re * sn + s.im * cs;
            }
            let y = plan.forward(&fold);
            let prod: Vec<(f64, f64)> = y
                .iter()
                .zip(&code_fft)
                .map(|(&(a, b), &(c, e))| (a * c - b * e, a * e + b * c))
                .collect();
            for (cell, (re, im)) in row.iter_mut().zip(plan.inverse(&prod)) {
                *cell += re * re + im * im;
            }
        }
    }

    let norm = 2.0 / (block as f64 * sigma2);
    let mut best = (f64::NEG_INFINITY, 0usize, 0usize);
    for (j, row) in grid.iter_mut().enumerate() {
        for (t, cell) in row.iter_mut().enumerate() {
            *cell *= norm;
            if *cell > best.0 {
                best = (*cell, j, t);
            }
        }
    }
    let (peak, jb, tb) = best;
    let guard = (1.0 / chips_per_sample).ceil() as usize + 1;
    let second_peak = grid[jb]
        .iter()
        .enumerate()
        .filter(|&(t, _)| {
            let d = t.abs_diff(tb);
            d.min(spc - d) > guard
        })
        .map(|(_, &v)| v)
        .fold(0.0_f64, f64::max);

    let n_cells = (spc * bins.len()) as f64;
    // Per-cell false-alarm probability 1 − (1 − P_fa)^(1/N), formed without cancellation.
    let pfa_cell = -((-cfg.pfa).ln_1p() / n_cells).exp_m1();
    let threshold = threshold_for_pfa(pfa_cell, cfg.noncoherent as f64);
    let len = code.len_chips() as f64;
    let code_phase_chips = (-(tb as f64) * chips_per_sample).rem_euclid(len);
    Ok(AcqGrid {
        result: AcqResult {
            code_name: code.name(),
            doppler_hz: bins[jb],
            doppler_index: jb,
            delay_samples: tb,
            code_phase_chips,
            statistic: peak,
            second_peak,
            peak_ratio: if second_peak > 0.0 {
                peak / second_peak
            } else {
                f64::INFINITY
            },
            pfa_cell,
            threshold,
            acquired: peak > threshold,
            samples_per_period: spc,
            n_doppler_bins: bins.len(),
            sample_power: sigma2,
        },
        grid,
    })
}

/// Read [`samples_needed`] samples from `src` and search them for `code`. The search is
/// relative to the first sample read.
pub fn acquire_source(
    src: &mut dyn IqSource,
    code: &dyn SpreadingCode,
    cfg: &AcqConfig,
) -> Result<AcqGrid, IqError> {
    let spec = src.spec();
    let needed = samples_needed(&spec, code, cfg).map_err(IqError::Format)?;
    let mut buf = vec![Cf64::default(); needed];
    let mut got = 0;
    while got < needed {
        let n = src.read(&mut buf[got..])?;
        if n == 0 {
            break;
        }
        got += n;
    }
    if got < needed {
        return Err(IqError::Format(format!(
            "stream ended after {got} of {needed} samples"
        )));
    }
    acquire(&buf, &spec, code, cfg).map_err(IqError::Format)
}

/// Analytic detection probability of one correctly aligned cell of a search with `cfg`
/// on a code of period `period_s` at carrier-to-noise density `cn0_dbhz`, at per-cell
/// false-alarm probability `pfa_cell`: [`crate::acquisition::pd_square_law`] with
/// `ρ = (C/N0)·N·T_code` and `M` non-coherent blocks. No straddle or bit-edge loss.
pub fn predicted_pd(cfg: &AcqConfig, period_s: f64, cn0_dbhz: f64, pfa_cell: f64) -> f64 {
    let m = cfg.noncoherent as f64;
    let rho = 10f64.powf(cn0_dbhz / 10.0) * cfg.coherent_periods as f64 * period_s;
    pd_square_law(threshold_for_pfa(pfa_cell, m), m, rho)
}

#[cfg(test)]
mod tests {
    use super::auto_coherent_periods;

    #[test]
    fn the_auto_coherent_length_is_about_four_milliseconds() {
        assert_eq!(auto_coherent_periods(1.0e-3), 4); // GPS L1 C/A, L5
        assert_eq!(auto_coherent_periods(4.0e-3), 1); // Galileo E1
        assert_eq!(auto_coherent_periods(10.0e-3), 1); // BeiDou B1C
        assert_eq!(auto_coherent_periods(20.0e-3), 1); // GPS L2C CM
        assert_eq!(auto_coherent_periods(1.5e-3), 3);
        assert_eq!(auto_coherent_periods(0.0), 1);
    }
}
