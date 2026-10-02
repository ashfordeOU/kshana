// SPDX-License-Identifier: AGPL-3.0-only
//! GNSS signal acquisition: square-law (non-coherent) detector statistics and the
//! generalized Marcum Q-function.
//!
//! A receiver acquires a satellite by searching a code-phase × Doppler grid. In each
//! cell it forms the envelope-squared `|I + jQ|²` of the coherent correlator output and
//! sums `M` such accumulations non-coherently. Normalised by the per-sample noise
//! variance, the decision statistic is
//!
//! * **H₀ (noise only):** a central chi-square with `2M` degrees of freedom;
//! * **H₁ (signal present):** a non-central chi-square with `2M` degrees of freedom and
//!   non-centrality `λ = 2 M · ρ`, where `ρ` is the per-cell post-correlation SNR
//!   (linear; `ρ = (C/N₀)·T_coh` for coherent integration time `T_coh`).
//!
//! From these two distributions the operating point follows directly:
//!
//! ```text
//!   P_fa(γ)        = 1 − F_{χ²(2M)}(γ)
//!   γ(P_fa)        = F⁻¹_{χ²(2M)}(1 − P_fa)
//!   P_d(γ, ρ)      = 1 − F_{χ'²(2M, 2Mρ)}(γ) = Q_M( √(2Mρ), √γ )
//! ```
//!
//! where `Q_M(a, b)` is the **generalized Marcum Q-function**, `Q_M(a,b) = P(X > b)` for
//! the envelope `X` of a non-central chi distribution with `2M` degrees of freedom and
//! non-centrality `a²`, i.e. `Q_M(a, b) = 1 − F_{χ'²(2M, a²)}(b²)`. All three reuse the
//! engine's validated chi-square machinery ([`crate::raim::chi2_cdf`],
//! [`crate::raim::noncentral_chi2_cdf`], [`crate::detection::chi2_inv_cdf`]).
//!
//! Scope (honest): this is the standard square-law / non-coherent-integration detector on
//! a per-cell basis — no search-space cell-averaging (CFAR), no squaring/combining-loss
//! tables beyond what the chi-square non-centrality already captures, and no
//! code/Doppler-bin straddling loss. It is a MODELLED capability whose reference tests
//! check closed-form detector identities (the Marcum-Q ↔ non-central-chi-square relation,
//! `P_fa`/threshold inversion, ROC monotonicity, and the non-coherent integration gain),
//! not an external dataset.
//!
//! ## Parallel code-phase search on sampled IQ
//!
//! The second half of the module runs that detector on real samples. [`pcps_acquire`] is
//! the parallel code-phase search (PCPS): for every Doppler bin the carrier is wiped off,
//! the coherent block of `T` code periods is folded onto one period (a sum of the periods,
//! which is the coherent integration because the replica repeats every period), and the
//! circular correlation against the sampled C/A (coarse/acquisition) code replica is formed
//! for all code phases at once by a fast Fourier transform (FFT); the squared magnitudes of
//! `M` consecutive blocks are summed (non-coherent integration). The FFT is
//! [`crate::portable_math`]'s, so a search returns the same bits on every platform.
//!
//! The decision statistic is normalised by the measured sample power `σ²`, so that under
//! noise alone `2·G/(Lσ²)` is chi-square with `2M` degrees of freedom (`L` samples per
//! block, `G` the accumulated cell power), and the threshold is the per-cell false-alarm
//! probability that gives the requested probability for the whole search grid,
//! `1 − (1 − P_fa)^(1/N_cells)`, through [`threshold_for_pfa`]. The sample power includes the
//! signal, which at GNSS (global navigation satellite system) carrier-to-noise densities is
//! 30 dB or more below the noise in the sampled bandwidth.
//!
//! On real front ends the noise is band-limited and the samples are correlated, which raises
//! every cell's noise by a common factor that the sample power does not reveal; for that case
//! the result also carries a cell-averaging statistic, the peak over the grid's own mean cell,
//! with its own decision against the same threshold.
//!
//! What it does not do, stated: no code-Doppler compensation across non-coherent blocks (a
//! 25 kHz carrier Doppler moves the code 16 chips per second), no data-bit wipe-off, no
//! cell-averaging CFAR (constant false-alarm rate) beyond the global power normalisation.
//!
//! [`refine`] then polishes the Doppler and code delay of an acquired signal on a fine grid
//! and [`prompt_series`] forms one prompt correlation per code period, open loop, with the
//! code rate scaled by the carrier Doppler. Two carrier-to-noise density (C/N0) estimators
//! work on that series: [`cn0_m2m4`], the second- and fourth-moment estimator, which needs no
//! carrier phase and no bit synchronisation (Pauluzzi and Beaulieu, IEEE Trans. Commun.
//! 48(10), 2000), and [`cn0_from_grid`], the peak-over-floor estimate read off the
//! acquisition grid itself.
//!
//! References:
//! - J. I. Marcum, "A Statistical Theory of Target Detection by Pulsed Radar," RAND
//!   RM-754 (1947); IRE Trans. IT-6 (1960).
//! - E. D. Kaplan & C. J. Hegarty (eds.), *Understanding GPS/GNSS*, 3rd ed., §8
//!   (acquisition, square-law detection, non-coherent integration).
//! - S. Kay, *Fundamentals of Statistical Signal Processing: Detection Theory*, §2 (ROC).

use crate::portable_math::{FftPlan, PortableFloat};
use crate::raim::{chi2_cdf, noncentral_chi2_cdf};
use crate::sdr::{CaCode, Cf64, CA_CHIP_RATE_HZ, CA_CODE_LEN, L1_HZ};

/// Generalized Marcum Q-function `Q_M(a, b)`: the probability that the envelope of a
/// non-central chi distribution with `2M` degrees of freedom and non-centrality `a²`
/// exceeds `b`. Evaluated through the non-central chi-square CDF,
/// `Q_M(a, b) = 1 − F_{χ'²(2M, a²)}(b²)`. `m` is the (positive) order; `a, b ≥ 0`.
pub fn marcum_q(m: f64, a: f64, b: f64) -> f64 {
    1.0 - noncentral_chi2_cdf(b * b, 2.0 * m, a * a)
}

/// False-alarm probability of a square-law detector with `n_nc` non-coherent
/// integrations at normalised threshold `gamma`: `P_fa = 1 − F_{χ²(2·n_nc)}(γ)`.
pub fn pfa_square_law(gamma: f64, n_nc: f64) -> f64 {
    (1.0 - chi2_cdf(gamma, 2.0 * n_nc)).clamp(0.0, 1.0)
}

/// Normalised detection threshold achieving a target `pfa` for `n_nc` non-coherent
/// integrations: `γ = F⁻¹_{χ²(2·n_nc)}(1 − P_fa)`. Inverts [`chi2_cdf`] by bisection so
/// the threshold is the exact inverse of [`pfa_square_law`] (both use the same CDF),
/// making the `P_fa`↔threshold round-trip tight regardless of the CDF's internals.
pub fn threshold_for_pfa(pfa: f64, n_nc: f64) -> f64 {
    let dof = 2.0 * n_nc;
    let target = (1.0 - pfa).clamp(0.0, 1.0); // desired chi²(dof) CDF value
                                              // Bracket: grow the upper bound until the CDF exceeds the target.
    let mut hi = dof.max(1.0);
    let mut guard = 0;
    while chi2_cdf(hi, dof) < target && guard < 200 {
        hi *= 2.0;
        guard += 1;
    }
    let mut lo = 0.0;
    for _ in 0..100 {
        let mid = 0.5 * (lo + hi);
        if chi2_cdf(mid, dof) < target {
            lo = mid;
        } else {
            hi = mid;
        }
    }
    0.5 * (lo + hi)
}

/// Detection probability of a square-law detector at normalised threshold `gamma`,
/// `n_nc` non-coherent integrations, and per-cell post-correlation SNR `snr` (linear):
/// `P_d = 1 − F_{χ'²(2·n_nc, 2·n_nc·snr)}(γ) = Q_{n_nc}( √(2·n_nc·snr), √γ )`.
pub fn pd_square_law(gamma: f64, n_nc: f64, snr: f64) -> f64 {
    let lambda = 2.0 * n_nc * snr.max(0.0);
    (1.0 - noncentral_chi2_cdf(gamma, 2.0 * n_nc, lambda)).clamp(0.0, 1.0)
}

/// Convenience: detection probability at a target false-alarm rate (the threshold is
/// derived internally), for `n_nc` non-coherent integrations and per-cell SNR `snr`.
pub fn pd_at_pfa(pfa: f64, n_nc: f64, snr: f64) -> f64 {
    pd_square_law(threshold_for_pfa(pfa, n_nc), n_nc, snr)
}

// ── Parallel code-phase search on sampled IQ ────────────────────────────────────────────

/// Forward discrete Fourier transform `X[k] = Σ x[n]·exp(−2πi·nk/N)` of any length, with the
/// same bits on every platform (the plan of [`crate::portable_math`]).
pub fn fft_forward(x: &[Cf64]) -> Vec<Cf64> {
    let plan = FftPlan::new(x.len().max(1));
    if x.is_empty() {
        return Vec::new();
    }
    let v: Vec<(f64, f64)> = x.iter().map(|c| (c.re, c.im)).collect();
    plan.forward(&v)
        .into_iter()
        .map(|(r, i)| Cf64::new(r, i))
        .collect()
}

/// Inverse discrete Fourier transform, scaled by `1/N`; the inverse of [`fft_forward`].
pub fn fft_inverse(x: &[Cf64]) -> Vec<Cf64> {
    if x.is_empty() {
        return Vec::new();
    }
    let plan = FftPlan::new(x.len());
    let v: Vec<(f64, f64)> = x.iter().map(|c| (c.re, c.im)).collect();
    plan.inverse(&v)
        .into_iter()
        .map(|(r, i)| Cf64::new(r, i))
        .collect()
}

/// The `±1` C/A code replica sampled at `fs_hz`: sample `i` carries chip
/// `floor(i·code_rate_hz/fs_hz) mod 1023` (a point sample at the sample instant, the
/// convention of [`crate::sdr`]), mapped chip `0 → +1`, chip `1 → −1`.
pub fn ca_replica(code: &CaCode, fs_hz: f64, code_rate_hz: f64, n_samples: usize) -> Vec<f64> {
    (0..n_samples)
        .map(|i| {
            let chip = (i as f64 * code_rate_hz / fs_hz).floor() as usize % CA_CODE_LEN;
            code.bipolar[chip]
        })
        .collect()
}

/// The parameters of one parallel code-phase search.
#[derive(Clone, Copy, Debug, PartialEq)]
pub struct PcpsConfig {
    /// Complex sample rate (Hz). `fs_hz / 1000` must be a whole number of samples (one C/A
    /// code period), the same requirement the FFT search of a one-millisecond code has in
    /// any receiver.
    pub fs_hz: f64,
    /// Intermediate frequency of the signal in the samples (Hz); zero for baseband IQ.
    pub if_hz: f64,
    /// Coherent integration time in whole code periods (milliseconds).
    pub coherent_ms: usize,
    /// Number of consecutive coherent blocks whose powers are summed.
    pub noncoherent: usize,
    /// The Doppler grid is `−doppler_max_hz + j·doppler_step_hz` for
    /// `j = 0 .. ceil(2·doppler_max_hz / doppler_step_hz)`.
    pub doppler_max_hz: f64,
    /// Doppler bin spacing (Hz).
    pub doppler_step_hz: f64,
    /// False-alarm probability for the whole search grid.
    pub pfa: f64,
}

impl PcpsConfig {
    /// Samples per code period, or an error when the rate is not a whole number of samples
    /// per millisecond.
    pub fn samples_per_code(&self) -> Result<usize, String> {
        let spc = self.fs_hz / 1000.0;
        if !(spc.is_finite() && spc >= 1.0) || (spc - spc.round()).abs() > 1e-9 {
            return Err(format!(
                "sample rate {} Hz is not a whole number of samples per millisecond",
                self.fs_hz
            ));
        }
        Ok(spc.round() as usize)
    }

    /// The Doppler grid (Hz).
    pub fn doppler_bins(&self) -> Vec<f64> {
        let n = (2.0 * self.doppler_max_hz / self.doppler_step_hz).ceil() as usize;
        (0..n)
            .map(|j| -self.doppler_max_hz + j as f64 * self.doppler_step_hz)
            .collect()
    }

    /// Number of samples one search consumes: `coherent_ms · noncoherent` code periods.
    pub fn samples_needed(&self) -> Result<usize, String> {
        Ok(self.samples_per_code()? * self.coherent_ms * self.noncoherent)
    }
}

/// The outcome of one parallel code-phase search.
#[derive(Clone, Debug, PartialEq)]
pub struct PcpsResult {
    /// PRN (pseudorandom noise number) searched.
    pub prn: u8,
    /// Code delay of the peak (samples, `0 .. samples_per_code`): the sample, counted from the
    /// first sample searched, at which a code period starts.
    pub delay_samples: usize,
    /// Doppler of the peak bin (Hz), relative to the intermediate frequency.
    pub doppler_hz: f64,
    /// Index of the peak Doppler bin.
    pub doppler_index: usize,
    /// Normalised peak, `2·G_max/(L·σ²)`: chi-square with `2M` degrees of freedom under noise.
    pub statistic: f64,
    /// The threshold that statistic is compared with.
    pub threshold: f64,
    /// Whether the statistic exceeded the threshold.
    pub acquired: bool,
    /// Mean normalised cell value over the peak's Doppler bin, excluding cells within one chip
    /// of the peak (the noise floor, close to `2M` under noise).
    pub floor: f64,
    /// Samples per code period.
    pub samples_per_code: usize,
    /// Number of Doppler bins.
    pub n_doppler_bins: usize,
    /// Mean sample power `σ²` used to normalise.
    pub sample_power: f64,
    /// The peak normalised by the grid's own mean cell instead of the sample power,
    /// `2M · G_max / mean(G)`: a cell-averaging statistic that stays chi-square-scaled when
    /// the noise is not white (a band-limited front end correlates neighbouring samples and
    /// raises every cell's noise by the same factor, which `statistic` does not see).
    pub cell_average_statistic: f64,
    /// Whether `cell_average_statistic` exceeded `threshold`.
    pub acquired_cell_average: bool,
}

/// Run the parallel code-phase search of `cfg` on `samples` (at least
/// [`PcpsConfig::samples_needed`] long; the first that many are used) for `code`.
pub fn pcps_acquire(
    samples: &[Cf64],
    code: &CaCode,
    cfg: &PcpsConfig,
) -> Result<PcpsResult, String> {
    let grid = pcps_grid(samples, code, cfg)?;
    Ok(grid.result)
}

/// A search together with its full normalised grid `grid[doppler_index][delay]`.
#[derive(Clone, Debug, PartialEq)]
pub struct PcpsGrid {
    /// The search outcome.
    pub result: PcpsResult,
    /// Normalised cell values `2·G/(L·σ²)`, one row per Doppler bin.
    pub grid: Vec<Vec<f64>>,
}

/// As [`pcps_acquire`], keeping the whole grid.
pub fn pcps_grid(samples: &[Cf64], code: &CaCode, cfg: &PcpsConfig) -> Result<PcpsGrid, String> {
    let spc = cfg.samples_per_code()?;
    if cfg.coherent_ms == 0 || cfg.noncoherent == 0 {
        return Err("coherent_ms and noncoherent must be positive".into());
    }
    if !(cfg.doppler_step_hz > 0.0 && cfg.doppler_max_hz >= 0.0) {
        return Err("the Doppler grid needs a positive step and a non-negative maximum".into());
    }
    if !(cfg.pfa > 0.0 && cfg.pfa < 1.0) {
        return Err("pfa must lie in (0, 1)".into());
    }
    let block = spc * cfg.coherent_ms;
    let needed = block * cfg.noncoherent;
    if samples.len() < needed {
        return Err(format!(
            "{} samples supplied, {needed} needed",
            samples.len()
        ));
    }
    let bins = cfg.doppler_bins();
    if bins.is_empty() {
        return Err("empty Doppler grid".into());
    }
    let plan = FftPlan::new(spc);
    let replica = ca_replica(code, cfg.fs_hz, CA_CHIP_RATE_HZ, spc);
    let rep: Vec<(f64, f64)> = replica.iter().map(|&c| (c, 0.0)).collect();
    let code_fft: Vec<(f64, f64)> = plan
        .forward(&rep)
        .into_iter()
        .map(|(r, i)| (r, -i))
        .collect();

    // Each bin frequency is f0 + k·1 kHz with f0 in [0, 1 kHz): a whole-kilohertz carrier is
    // periodic in one code period, so after folding it is a circular shift of the spectrum.
    let mut groups: Vec<(f64, Vec<(usize, i64)>)> = Vec::new();
    for (j, &d) in bins.iter().enumerate() {
        let f = cfg.if_hz + d;
        let k = (f / 1000.0).floor();
        let f0 = f - 1000.0 * k;
        match groups.iter_mut().find(|g| g.0 == f0) {
            Some(g) => g.1.push((j, k as i64)),
            None => groups.push((f0, vec![(j, k as i64)])),
        }
    }

    let mut acc = vec![vec![0.0_f64; spc]; bins.len()];
    let mut power = 0.0;
    for x in &samples[..needed] {
        power += x.re * x.re + x.im * x.im;
    }
    let sigma2 = power / needed as f64;
    if sigma2.is_nan() || sigma2 <= 0.0 {
        return Err("the samples carry no power".into());
    }
    for m in 0..cfg.noncoherent {
        let start = m * block;
        for (f0, members) in &groups {
            // Wipe f0 (absolute sample time) and fold the block onto one code period.
            let mut fold = vec![(0.0_f64, 0.0_f64); spc];
            for i in 0..block {
                let n = start + i;
                let cyc = (f0 * n as f64 / cfg.fs_hz).fract();
                let (sn, cs) = (-core::f64::consts::TAU * cyc).psin_cos();
                let s = samples[n];
                let r = &mut fold[i % spc];
                r.0 += s.re * cs - s.im * sn;
                r.1 += s.re * sn + s.im * cs;
            }
            let y = plan.forward(&fold);
            for &(j, k) in members {
                // A further −k kHz wipe shifts the spectrum: Y_k[m] = Y[(m + k) mod spc].
                let shift = k.rem_euclid(spc as i64) as usize;
                let prod: Vec<(f64, f64)> = (0..spc)
                    .map(|q| {
                        let (a, b) = y[(q + shift) % spc];
                        let (c, d) = code_fft[q];
                        (a * c - b * d, a * d + b * c)
                    })
                    .collect();
                let r = plan.inverse(&prod);
                let row = &mut acc[j];
                for (cell, (re, im)) in row.iter_mut().zip(r) {
                    *cell += re * re + im * im;
                }
            }
        }
    }
    let norm = 2.0 / (block as f64 * sigma2);
    let mut best = (f64::NEG_INFINITY, 0usize, 0usize);
    for (j, row) in acc.iter_mut().enumerate() {
        for (t, cell) in row.iter_mut().enumerate() {
            *cell *= norm;
            if *cell > best.0 {
                best = (*cell, j, t);
            }
        }
    }
    let (peak, jb, tb) = best;
    let n_all = (acc.len() * spc) as f64;
    let mean_cell = acc.iter().flatten().sum::<f64>() / n_all;
    let cell_average_statistic = 2.0 * cfg.noncoherent as f64 * peak / mean_cell;
    let samples_per_chip = cfg.fs_hz / CA_CHIP_RATE_HZ;
    let guard = samples_per_chip.ceil() as usize;
    let mut floor_sum = 0.0;
    let mut floor_n = 0usize;
    for (t, &v) in acc[jb].iter().enumerate() {
        let d = t.abs_diff(tb);
        if d.min(spc - d) > guard {
            floor_sum += v;
            floor_n += 1;
        }
    }
    let n_cells = (spc * bins.len()) as f64;
    // Per-cell false-alarm probability 1 − (1 − P_fa)^(1/N), formed without cancellation.
    let pfa_cell = -((-cfg.pfa).ln_1p() / n_cells).exp_m1();
    let threshold = threshold_for_pfa(pfa_cell, cfg.noncoherent as f64);
    Ok(PcpsGrid {
        result: PcpsResult {
            prn: code.prn,
            delay_samples: tb,
            doppler_hz: bins[jb],
            doppler_index: jb,
            statistic: peak,
            threshold,
            acquired: peak > threshold,
            floor: if floor_n > 0 {
                floor_sum / floor_n as f64
            } else {
                f64::NAN
            },
            samples_per_code: spc,
            n_doppler_bins: bins.len(),
            sample_power: sigma2,
            cell_average_statistic,
            acquired_cell_average: cell_average_statistic > threshold,
        },
        grid: acc,
    })
}

/// Carrier-to-noise density (dB-Hz) read off an acquisition grid: with `M` blocks of
/// coherent time `T`, the normalised peak `S` has mean `2M(1 + ρ)` and the floor mean `2M`,
/// so the per-block signal-to-noise ratio is `ρ = S/floor − 1` and `C/N0 = ρ/T`. Biased high
/// at low C/N0 (the peak is the largest of many cells). `None` when `ρ ≤ 0`.
pub fn cn0_from_grid(r: &PcpsResult, coherent_ms: usize) -> Option<f64> {
    let rho = r.statistic / r.floor - 1.0;
    if rho.is_nan() || rho <= 0.0 {
        return None;
    }
    Some(10.0 * (rho / (coherent_ms as f64 * 1e-3)).plog10())
}

/// One prompt correlation per C/A code period, open loop, starting at the first code epoch
/// after sample `delay_samples` (fractional): the carrier `if_hz + doppler_hz` is wiped and the
/// code rate is `1.023 MHz · (1 + doppler_hz / f_L1)`. Correlation windows are whole code
/// periods, so a navigation-data bit edge never falls inside one. Returns as many periods as
/// fit, up to `max_periods`.
pub fn prompt_series(
    samples: &[Cf64],
    code: &CaCode,
    fs_hz: f64,
    if_hz: f64,
    doppler_hz: f64,
    delay_samples: f64,
    max_periods: usize,
) -> Vec<Cf64> {
    let code_rate = CA_CHIP_RATE_HZ * (1.0 + doppler_hz / L1_HZ);
    let period = CA_CODE_LEN as f64 * fs_hz / code_rate; // samples per code period
    let f = if_hz + doppler_hz;
    let mut out = Vec::new();
    let mut epoch = delay_samples;
    while epoch < 0.0 {
        epoch += period;
    }
    for _ in 0..max_periods {
        let n0 = epoch.ceil() as usize;
        let n1 = (epoch + period).ceil() as usize;
        if n1 > samples.len() {
            break;
        }
        // Carrier phasor exact at the first sample of the window, then rotated: the window is
        // a few thousand samples, so the recurrence drifts by a few units in the last place.
        let cyc0 = (f * n0 as f64 / fs_hz).fract();
        let (mut sn, mut cs) = (-core::f64::consts::TAU * cyc0).psin_cos();
        let (dsn, dcs) = (-core::f64::consts::TAU * (f / fs_hz).fract()).psin_cos();
        let mut acc = Cf64::default();
        for (n, &s) in samples.iter().enumerate().take(n1).skip(n0) {
            let chip_phase = (n as f64 - epoch) * code_rate / fs_hz;
            let idx = (chip_phase.floor() as i64).rem_euclid(CA_CODE_LEN as i64) as usize;
            let c = code.bipolar[idx];
            acc.re += c * (s.re * cs - s.im * sn);
            acc.im += c * (s.re * sn + s.im * cs);
            let ns = sn * dcs + cs * dsn;
            cs = cs * dcs - sn * dsn;
            sn = ns;
        }
        out.push(acc);
        epoch += period;
    }
    out
}

/// Second- and fourth-moment (M2M4) carrier-to-noise density estimate (dB-Hz) from prompt
/// correlations of coherent time `t_coh_s`: `M2 = ⟨|P|²⟩`, `M4 = ⟨|P|⁴⟩`, signal power
/// `√(2·M2² − M4)`, noise power `M2` minus that. It needs neither carrier phase nor bit
/// synchronisation. `None` when the moments give no positive signal power.
pub fn cn0_m2m4(prompts: &[Cf64], t_coh_s: f64) -> Option<f64> {
    if prompts.len() < 2 {
        return None;
    }
    let n = prompts.len() as f64;
    let (mut m2, mut m4) = (0.0, 0.0);
    for p in prompts {
        let e = p.re * p.re + p.im * p.im;
        m2 += e;
        m4 += e * e;
    }
    m2 /= n;
    m4 /= n;
    let d = 2.0 * m2 * m2 - m4;
    if d.is_nan() || d <= 0.0 {
        return None;
    }
    let ps = d.sqrt();
    let pn = m2 - ps;
    if pn.is_nan() || pn <= 0.0 {
        return None;
    }
    Some(10.0 * (ps / (pn * t_coh_s)).plog10())
}

/// Fine Doppler and code delay of an acquired signal: the Doppler is searched over
/// `±doppler_halfwidth_hz` about `coarse.doppler_hz` in 5 Hz steps and the delay over
/// `±1.5` samples about `coarse.delay_samples` in eighth-sample steps, each maximising the
/// non-coherent prompt energy `Σ|P|²` over `periods` code periods, the Doppler first, then the
/// delay, then the Doppler again. Returns `(doppler_hz, delay_samples)`.
pub fn refine(
    samples: &[Cf64],
    code: &CaCode,
    fs_hz: f64,
    if_hz: f64,
    coarse: &PcpsResult,
    doppler_halfwidth_hz: f64,
    periods: usize,
) -> (f64, f64) {
    let energy = |fd: f64, tau: f64| -> f64 {
        prompt_series(samples, code, fs_hz, if_hz, fd, tau, periods)
            .iter()
            .map(|p| p.re * p.re + p.im * p.im)
            .sum()
    };
    let mut fd = coarse.doppler_hz;
    let mut tau = coarse.delay_samples as f64;
    let n_f = (doppler_halfwidth_hz / 5.0).ceil() as i64;
    let search_f = |tau: f64, centre: f64| -> f64 {
        let mut best = (f64::NEG_INFINITY, centre);
        for i in -n_f..=n_f {
            let f = centre + 5.0 * i as f64;
            let e = energy(f, tau);
            if e > best.0 {
                best = (e, f);
            }
        }
        best.1
    };
    fd = search_f(tau, fd);
    let mut best = (f64::NEG_INFINITY, tau);
    for i in -12..=12 {
        let t = tau + i as f64 / 8.0;
        let e = energy(fd, t);
        if e > best.0 {
            best = (e, t);
        }
    }
    tau = best.1;
    fd = search_f(tau, fd);
    (fd, tau)
}

/// Phase-coherent Doppler refinement: the prompt correlations of `periods` code periods at
/// `doppler_hz` and `delay_samples` are squared, which removes the ±1 navigation data bits and
/// doubles the residual carrier frequency, and the squared series is transformed by an FFT
/// zero-padded to 8192 points; the peak, interpolated by a parabola through the log magnitudes
/// of its two neighbours, is twice the residual. Returns the refined Doppler (Hz). The residual
/// must lie within ±250 Hz (the squared series is sampled at 1 kHz); that is half the 500 Hz
/// acquisition bin. Unlike [`refine`], whose one-millisecond energy is nearly flat over ±50 Hz,
/// this resolves the carrier over the whole window.
pub fn refine_doppler_coherent(
    samples: &[Cf64],
    code: &CaCode,
    fs_hz: f64,
    if_hz: f64,
    doppler_hz: f64,
    delay_samples: f64,
    periods: usize,
) -> Option<f64> {
    let p = prompt_series(
        samples,
        code,
        fs_hz,
        if_hz,
        doppler_hz,
        delay_samples,
        periods,
    );
    if p.len() < 8 {
        return None;
    }
    const N: usize = 8192;
    let mut sq = vec![Cf64::default(); N];
    for (k, v) in p.iter().enumerate().take(N) {
        sq[k] = Cf64::new(v.re * v.re - v.im * v.im, 2.0 * v.re * v.im);
    }
    let spec = fft_forward(&sq);
    let mag: Vec<f64> = spec.iter().map(|c| c.re * c.re + c.im * c.im).collect();
    let (kmax, _) = mag
        .iter()
        .enumerate()
        .fold((0usize, f64::NEG_INFINITY), |b, (k, &m)| {
            if m > b.1 {
                (k, m)
            } else {
                b
            }
        });
    let at = |k: isize| {
        mag[k.rem_euclid(N as isize) as usize]
            .max(f64::MIN_POSITIVE)
            .ln()
    };
    let (a, b, c) = (
        at(kmax as isize - 1),
        at(kmax as isize),
        at(kmax as isize + 1),
    );
    let den = a - 2.0 * b + c;
    let frac = if den < 0.0 { 0.5 * (a - c) / den } else { 0.0 };
    // Bin k of N at a 1 kHz rate is k·1000/N Hz; bins above N/2 are negative frequencies.
    let mut bin = kmax as f64 + frac;
    if bin > N as f64 / 2.0 {
        bin -= N as f64;
    }
    let two_delta = bin * 1000.0 / N as f64;
    Some(doppler_hz + two_delta / 2.0)
}

#[cfg(test)]
mod tests {
    use super::*;

    fn approx(a: f64, b: f64, tol: f64) -> bool {
        (a - b).abs() <= tol
    }

    #[test]
    fn marcum_q_central_case_is_exponential() {
        // M = 1, a = 0 ⇒ Q_1(0, b) = exp(−b²/2).
        for &b in &[0.5_f64, 1.0, 2.0, 3.0] {
            let got = marcum_q(1.0, 0.0, b);
            let want = (-b * b / 2.0).exp();
            assert!(approx(got, want, 1e-9), "Q_1(0,{b}) = {got} vs {want}");
        }
    }

    #[test]
    fn pd_equals_marcum_q_identity() {
        // P_d(γ, M, ρ) == Q_M(√(2Mρ), √γ).
        let (m, snr, gamma) = (4.0_f64, 0.8_f64, 12.0_f64);
        let pd = pd_square_law(gamma, m, snr);
        let q = marcum_q(m, (2.0 * m * snr).sqrt(), gamma.sqrt());
        assert!(approx(pd, q, 1e-9), "Pd {pd} vs Q_M {q}");
    }

    #[test]
    fn threshold_round_trips_with_pfa() {
        for &pfa in &[1e-1_f64, 1e-3, 1e-5] {
            for &m in &[1.0_f64, 5.0, 20.0] {
                let gamma = threshold_for_pfa(pfa, m);
                let back = pfa_square_law(gamma, m);
                assert!(
                    (back - pfa).abs() / pfa < 1e-3,
                    "Pfa round-trip {back} vs {pfa} (M={m})"
                );
            }
        }
    }

    #[test]
    fn roc_is_monotone_and_well_ordered() {
        let m = 3.0;
        let gamma = threshold_for_pfa(1e-3, m);
        // Pd increases with SNR.
        let pd_lo = pd_square_law(gamma, m, 0.5);
        let pd_hi = pd_square_law(gamma, m, 2.0);
        assert!(
            pd_hi > pd_lo,
            "Pd not increasing in SNR: {pd_lo} -> {pd_hi}"
        );
        // Pd ≥ Pfa for snr > 0, and → Pfa as snr → 0.
        let pfa = pfa_square_law(gamma, m);
        assert!(pd_lo > pfa, "Pd {pd_lo} below Pfa {pfa}");
        assert!(approx(pd_square_law(gamma, m, 0.0), pfa, 1e-9));
        // Pfa decreases with threshold.
        assert!(pfa_square_law(gamma + 5.0, m) < pfa);
    }

    #[test]
    fn non_coherent_integration_gain() {
        // At a fixed false-alarm rate and fixed per-cell SNR, summing more non-coherent
        // looks of the same-SNR signal raises Pd (integration gain).
        let (pfa, snr) = (1e-3_f64, 0.5_f64);
        let pd_1 = pd_at_pfa(pfa, 1.0, snr);
        let pd_10 = pd_at_pfa(pfa, 10.0, snr);
        assert!(
            pd_10 > pd_1,
            "no integration gain: Pd(1)={pd_1} Pd(10)={pd_10}"
        );
    }

    #[test]
    fn marcum_q_monotonicity() {
        let (m, b) = (2.0_f64, 2.5_f64);
        // Increasing the signal a raises Q.
        assert!(marcum_q(m, 3.0, b) > marcum_q(m, 1.0, b));
        // Increasing the threshold b lowers Q.
        assert!(marcum_q(m, 2.0, 3.5) < marcum_q(m, 2.0, 1.5));
        // Bounded in [0, 1].
        let q = marcum_q(m, 2.0, b);
        assert!((0.0..=1.0).contains(&q), "Q out of range: {q}");
    }

    /// Gaussian noise plus a C/A signal at a known C/N0, delay and Doppler, from a seeded
    /// generator: the truth the search is checked against.
    fn synth(
        prn: u8,
        fs: f64,
        n: usize,
        cn0_dbhz: f64,
        delay: f64,
        doppler: f64,
        seed: u64,
    ) -> Vec<Cf64> {
        use rand::SeedableRng;
        let mut rng = rand_chacha::ChaCha8Rng::seed_from_u64(seed);
        let code = CaCode::new(prn).expect("prn");
        let sigma2 = 1.0; // complex noise power per sample
        let a = (10f64.powf(cn0_dbhz / 10.0) * sigma2 / fs).sqrt();
        let rate = CA_CHIP_RATE_HZ * (1.0 + doppler / L1_HZ);
        (0..n)
            .map(|i| {
                let chip_phase = (i as f64 - delay) * rate / fs;
                let idx = (chip_phase.floor() as i64).rem_euclid(1023) as usize;
                let ph = core::f64::consts::TAU * doppler * i as f64 / fs + 0.3;
                let c = code.bipolar[idx] * a;
                let nr = crate::portable_math::standard_normal(&mut rng) * (sigma2 / 2.0).sqrt();
                let ni = crate::portable_math::standard_normal(&mut rng) * (sigma2 / 2.0).sqrt();
                Cf64::new(c * ph.cos() + nr, c * ph.sin() + ni)
            })
            .collect()
    }

    fn cfg(fs: f64) -> PcpsConfig {
        PcpsConfig {
            fs_hz: fs,
            if_hz: 0.0,
            coherent_ms: 1,
            noncoherent: 10,
            doppler_max_hz: 5000.0,
            doppler_step_hz: 500.0,
            pfa: 1e-3,
        }
    }

    #[test]
    fn fft_round_trips_and_matches_a_direct_sum() {
        let x: Vec<Cf64> = (0..60)
            .map(|i| Cf64::new((i as f64 * 0.7).sin(), (i as f64 * 0.3).cos()))
            .collect();
        let f = fft_forward(&x);
        let k = 7;
        let mut d = Cf64::default();
        for (n, v) in x.iter().enumerate() {
            let a = -core::f64::consts::TAU * (n * k) as f64 / 60.0;
            d = d + *v * Cf64::new(a.cos(), a.sin());
        }
        assert!((f[k].re - d.re).abs() < 1e-12 && (f[k].im - d.im).abs() < 1e-12);
        for (a, b) in fft_inverse(&f).iter().zip(&x) {
            assert!((a.re - b.re).abs() < 1e-13 && (a.im - b.im).abs() < 1e-13);
        }
    }

    #[test]
    fn search_finds_a_planted_signal_on_its_cell() {
        let fs = 4_000_000.0;
        let x = synth(7, fs, 4000 * 10, 45.0, 1234.0, 2000.0, 1);
        let r = pcps_acquire(&x, &CaCode::new(7).unwrap(), &cfg(fs)).unwrap();
        assert!(r.acquired, "{r:?}");
        assert_eq!(r.doppler_hz, 2000.0);
        assert!(r.delay_samples.abs_diff(1234) <= 1, "{r:?}");
        assert_eq!(r.n_doppler_bins, 20);
    }

    #[test]
    fn noise_alone_has_the_chi_square_floor_and_rarely_crosses() {
        let fs = 2_000_000.0;
        let mut crossings = 0;
        for seed in 0..10 {
            let x = synth(3, fs, 2000 * 10, -100.0, 0.0, 0.0, 100 + seed);
            let r = pcps_acquire(&x, &CaCode::new(3).unwrap(), &cfg(fs)).unwrap();
            // Under noise the normalised cell is chi-square with 2M = 20 degrees of freedom.
            assert!((r.floor - 20.0).abs() < 0.6, "floor {}", r.floor);
            crossings += r.acquired as u32;
        }
        assert!(
            crossings <= 1,
            "{crossings} false alarms in 10 searches at Pfa 1e-3"
        );
    }

    #[test]
    fn non_coherent_integration_reaches_a_signal_one_block_cannot() {
        let fs = 2_000_000.0;
        let x = synth(11, fs, 2000 * 60, 33.0, 777.0, -1500.0, 5);
        let code = CaCode::new(11).unwrap();
        let one = pcps_acquire(
            &x,
            &code,
            &PcpsConfig {
                noncoherent: 1,
                ..cfg(fs)
            },
        )
        .unwrap();
        let many = pcps_acquire(
            &x,
            &code,
            &PcpsConfig {
                noncoherent: 60,
                ..cfg(fs)
            },
        )
        .unwrap();
        assert!(!one.acquired, "{one:?}");
        assert!(many.acquired, "{many:?}");
        assert!(many.delay_samples.abs_diff(777) <= 1);
    }

    #[test]
    fn cell_averaging_holds_its_false_alarm_rate_on_coloured_noise() {
        // Noise correlated between neighbouring samples: x[n] = w[n] + 0.6·w[n−1], lag-one
        // correlation ρ = 0.6/1.36 = 0.44. Against a code of 1.955 samples per chip the cell
        // noise rises by 1 + 2ρ(1 − 1/1.955) ≈ 1.43: the sample-power statistic is inflated by
        // that and crosses; the cell-averaging one does not.
        let fs = 2_000_000.0;
        let w = synth(3, fs, 2000 * 20 + 1, -100.0, 0.0, 0.0, 77);
        let x: Vec<Cf64> = (1..w.len()).map(|n| w[n] + w[n - 1] * 0.6).collect();
        let c = PcpsConfig {
            noncoherent: 20,
            ..cfg(fs)
        };
        let r = pcps_acquire(&x, &CaCode::new(3).unwrap(), &c).unwrap();
        assert!(
            r.floor > 1.3 * 40.0 && r.floor < 1.6 * 40.0,
            "floor {}",
            r.floor
        );
        assert!(
            r.acquired,
            "the sample-power statistic should be fooled: {r:?}"
        );
        assert!(!r.acquired_cell_average, "{r:?}");
        // And a real signal on the same coloured noise is still found by it.
        let s = synth(3, fs, 2000 * 20 + 1, 45.0, 321.0, 1500.0, 78);
        let y: Vec<Cf64> = (1..s.len()).map(|n| s[n] + w[n - 1] * 0.6).collect();
        let r = pcps_acquire(&y, &CaCode::new(3).unwrap(), &c).unwrap();
        assert!(
            r.acquired_cell_average && r.delay_samples.abs_diff(320) <= 2,
            "{r:?}"
        );
    }

    #[test]
    fn coherent_folding_equals_the_long_correlation() {
        // Two coherent periods folded must give the cell a direct two-period sum gives.
        let fs = 1_000_000.0;
        let x = synth(5, fs, 1000 * 2, 50.0, 100.0, 0.0, 9);
        let code = CaCode::new(5).unwrap();
        let c = PcpsConfig {
            coherent_ms: 2,
            noncoherent: 1,
            doppler_max_hz: 500.0,
            ..cfg(fs)
        };
        let g = pcps_grid(&x, &code, &c).unwrap();
        let rep = ca_replica(&code, fs, CA_CHIP_RATE_HZ, 1000);
        let j = g.result.doppler_index;
        assert_eq!(c.doppler_bins()[j], 0.0);
        for tau in [0usize, 100, 517] {
            let mut acc = Cf64::default();
            for (n, s) in x.iter().enumerate() {
                acc = acc + *s * rep[(n + 1000 - tau) % 1000];
            }
            let want = 2.0 * (acc.re * acc.re + acc.im * acc.im) / (2000.0 * g.result.sample_power);
            assert!(
                (g.grid[j][tau] - want).abs() < 1e-9 * want.max(1.0),
                "tau {tau}"
            );
        }
    }

    #[test]
    fn coherent_refinement_resolves_the_carrier_through_data_bits() {
        // A signal with ±1 data bits every 20 ms and a residual carrier of 137.3 Hz after a
        // coarse Doppler: the squared-prompt FFT recovers it to within 2 Hz over 300 ms.
        let fs = 2_000_000.0;
        let code = CaCode::new(9).unwrap();
        let true_fd = 2137.3;
        let mut x = synth(9, fs, 2000 * 301, 40.0, 812.6, true_fd, 4);
        for (n, s) in x.iter_mut().enumerate() {
            // Flip the sign every 20 ms after the delay (bits change on code epochs).
            let ms = ((n as f64 - 812.6) / 2000.0).floor() as i64;
            if ms.rem_euclid(40) >= 20 {
                *s = *s * -1.0;
            }
        }
        let f = refine_doppler_coherent(&x, &code, fs, 0.0, 2000.0, 812.6, 300).unwrap();
        assert!((f - true_fd).abs() < 2.0, "refined {f}");
    }

    #[test]
    fn m2m4_recovers_the_planted_cn0() {
        let fs = 2_000_000.0;
        let code = CaCode::new(19).unwrap();
        // Eight independent noise draws per level: the mean is within 0.5 dB of the planted
        // value (the estimator's small upward bias at 400 periods included) and no single
        // draw is off by more than 1.5 dB.
        for &cn0 in &[35.0_f64, 42.0] {
            let mut sum = 0.0;
            for seed in 0..8 {
                let x = synth(19, fs, 2000 * 400, cn0, 300.25, 1234.0, 21 + seed);
                let p = prompt_series(&x, &code, fs, 0.0, 1234.0, 300.25, 400);
                // PIN-SCOPE:    the number of 1 ms prompt correlations a 400 ms synthetic record yields.
                // PIN-EXCLUDES: the C/N0 estimate itself, checked against its bar below.
                assert_eq!(p.len(), 399);
                let est = cn0_m2m4(&p, 1e-3).unwrap();
                assert!((est - cn0).abs() < 1.5, "planted {cn0}, estimated {est}");
                sum += est;
            }
            assert!(
                (sum / 8.0 - cn0).abs() < 0.5,
                "planted {cn0}, mean {}",
                sum / 8.0
            );
        }
    }

    #[test]
    fn refinement_recovers_the_fine_doppler_and_delay() {
        let fs = 2_000_000.0;
        let code = CaCode::new(2).unwrap();
        let x = synth(2, fs, 2000 * 40, 45.0, 1500.4, 2180.0, 33);
        let r = pcps_acquire(
            &x,
            &code,
            &PcpsConfig {
                noncoherent: 20,
                ..cfg(fs)
            },
        )
        .unwrap();
        assert!(r.acquired);
        let (fd, tau) = refine(&x, &code, fs, 0.0, &r, 300.0, 39);
        assert!((fd - 2180.0).abs() <= 25.0, "doppler {fd}");
        assert!((tau - 1500.4).abs() <= 0.5, "delay {tau}");
        let g = cn0_from_grid(&r, 1).unwrap();
        assert!(g > 38.0 && g < 50.0, "grid C/N0 {g}");
    }
}
