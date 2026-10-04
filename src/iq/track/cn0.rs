// SPDX-License-Identifier: AGPL-3.0-only
//! Carrier-to-noise density estimators, the phase lock indicator and histogram bit
//! synchronisation, all on prompt correlator outputs.
//!
//! * **NWPR** (narrowband-wideband power ratio; Van Dierendonck, in Parkinson & Spilker,
//!   *GPS: Theory and Applications* Vol. I ch. 8; Kaplan & Hegarty §5.11): over windows of
//!   `K` prompts `P_i`, each of integration `T`, `WBP = Σ|P_i|²`, `NBP = |ΣP_i|²`,
//!   `μ = mean(NBP/WBP)` over `M` windows, and `C/N0 = (μ − 1)/((K − μ)·T)`. A window must
//!   not straddle a data-bit edge.
//! * **Beaulieu** (Pauluzzi & Beaulieu, IEEE Trans. Commun. 48(10), 2000; the form in
//!   Falletti et al., *Low complexity carrier-to-noise ratio estimators for GNSS digital
//!   receivers*, IEEE TAES 47(1), 2011): on the in-phase parts of consecutive prompts,
//!   `SNR⁻¹ = mean[(|I_k| − |I_{k−1}|)² / (½(I_k² + I_{k−1}²))]` and `C/N0 = SNR/T`. It needs
//!   phase lock (the signal in `I`), not bit synchronisation, and is biased high by about
//!   `+0.5` in linear SNR, so it is meant for bit-length (high-SNR) prompts.
//! * **Phase lock indicator** `cos 2φ ≈ NBD/NBP` with `NBD = (ΣI)² − (ΣQ)²` (Van
//!   Dierendonck): 1 in lock, independent of the data sign.
//! * **Bit synchronisation by histogram** (Kaplan & Hegarty §5.12): every sign change of
//!   the prompt's in-phase part between consecutive code periods votes for its period
//!   index modulo the bit length; the bit edge is declared when the leading bin has at
//!   least `min_votes` votes and at least `ratio` times the runner-up.

use super::super::Cf64;

/// The NWPR power ratio `NBP/WBP` of one window of prompts (`1` for pure noise on
/// average, `K` for a noiseless window). `None` for an empty or zero-power window.
pub fn nwpr_power_ratio(window: &[Cf64]) -> Option<f64> {
    let wbp: f64 = window.iter().map(|p| p.re * p.re + p.im * p.im).sum();
    if window.is_empty() || wbp <= 0.0 {
        return None;
    }
    let s = window.iter().fold(Cf64::default(), |a, &p| a + p);
    Some((s.re * s.re + s.im * s.im) / wbp)
}

/// C/N0 (dB-Hz) from the mean NWPR power ratio `mu` of windows of `k` prompts, each of
/// integration `t_s`. `None` when `mu` is outside `(1, k)`.
pub fn nwpr_cn0_from_ratio(mu: f64, k: usize, t_s: f64) -> Option<f64> {
    let k = k as f64;
    if !(mu > 1.0 && mu < k && t_s > 0.0) {
        return None;
    }
    Some(10.0 * ((mu - 1.0) / ((k - mu) * t_s)).log10())
}

/// NWPR C/N0 (dB-Hz) from `prompts` (each of integration `t_s`) split into consecutive
/// windows of `k` (a trailing partial window is ignored). The first prompt must start a
/// data bit when the signal carries data and `k` must divide the bit length.
pub fn nwpr_cn0_dbhz(prompts: &[Cf64], k: usize, t_s: f64) -> Option<f64> {
    if k < 2 {
        return None;
    }
    let ratios: Vec<f64> = prompts
        .chunks_exact(k)
        .filter_map(nwpr_power_ratio)
        .collect();
    if ratios.is_empty() {
        return None;
    }
    let mu = ratios.iter().sum::<f64>() / ratios.len() as f64;
    nwpr_cn0_from_ratio(mu, k, t_s)
}

/// One Beaulieu term `(|I_k| − |I_{k−1}|)² / (½(I_k² + I_{k−1}²))` for consecutive prompts.
pub fn beaulieu_term(prev: Cf64, cur: Cf64) -> Option<f64> {
    let den = 0.5 * (prev.re * prev.re + cur.re * cur.re);
    if den <= 0.0 {
        return None;
    }
    let d = cur.re.abs() - prev.re.abs();
    Some(d * d / den)
}

/// C/N0 (dB-Hz) from the mean Beaulieu term `mean_term` of prompts of integration `t_s`.
pub fn beaulieu_cn0_from_term(mean_term: f64, t_s: f64) -> Option<f64> {
    if !(mean_term > 0.0 && t_s > 0.0) {
        return None;
    }
    Some(10.0 * (1.0 / (mean_term * t_s)).log10())
}

/// Beaulieu C/N0 (dB-Hz) from consecutive phase-locked `prompts` of integration `t_s`.
pub fn beaulieu_cn0_dbhz(prompts: &[Cf64], t_s: f64) -> Option<f64> {
    let terms: Vec<f64> = prompts
        .windows(2)
        .filter_map(|w| beaulieu_term(w[0], w[1]))
        .collect();
    if terms.is_empty() {
        return None;
    }
    beaulieu_cn0_from_term(terms.iter().sum::<f64>() / terms.len() as f64, t_s)
}

/// Phase lock indicator `NBD/NBP = ((ΣI)² − (ΣQ)²)/((ΣI)² + (ΣQ)²)` of a window of
/// prompts (`cos 2φ` of the window's mean phase error); 0 for an empty window.
pub fn phase_lock_indicator(window: &[Cf64]) -> f64 {
    let s = window.iter().fold(Cf64::default(), |a, &p| a + p);
    let nbp = s.re * s.re + s.im * s.im;
    if nbp == 0.0 {
        0.0
    } else {
        (s.re * s.re - s.im * s.im) / nbp
    }
}

/// Settings of [`BitSync`].
#[derive(Clone, Copy, Debug, PartialEq)]
pub struct BitSyncConfig {
    /// Votes the leading bin needs before an edge is declared.
    pub min_votes: u32,
    /// How many times the runner-up's votes the leading bin needs.
    pub ratio: f64,
}

impl Default for BitSyncConfig {
    fn default() -> Self {
        Self {
            min_votes: 12,
            ratio: 3.0,
        }
    }
}

/// Histogram bit synchroniser over code-period prompts.
#[derive(Clone, Debug, PartialEq)]
pub struct BitSync {
    cfg: BitSyncConfig,
    hist: Vec<u32>,
    prev_sign: Option<bool>,
    edge: Option<usize>,
}

impl BitSync {
    /// A synchroniser for bits of `periods_per_bit` code periods (at least 2).
    pub fn new(periods_per_bit: usize, cfg: BitSyncConfig) -> Self {
        Self {
            cfg,
            hist: vec![0; periods_per_bit.max(2)],
            prev_sign: None,
            edge: None,
        }
    }

    /// Feed the prompt of code period `period_index` (consecutive indices). Returns the
    /// edge phase once found: a bit starts at every period whose index is congruent to it
    /// modulo the bit length.
    pub fn push(&mut self, period_index: u64, prompt: Cf64) -> Option<usize> {
        if self.edge.is_some() {
            return self.edge;
        }
        let s = prompt.re >= 0.0;
        if let Some(prev) = self.prev_sign {
            if prev != s {
                let n = self.hist.len() as u64;
                self.hist[(period_index % n) as usize] += 1;
            }
        }
        self.prev_sign = Some(s);
        let (mut best, mut bi, mut second) = (0u32, 0usize, 0u32);
        for (i, &v) in self.hist.iter().enumerate() {
            if v > best {
                second = best;
                best = v;
                bi = i;
            } else if v > second {
                second = v;
            }
        }
        if best >= self.cfg.min_votes && best as f64 >= self.cfg.ratio * second as f64 {
            self.edge = Some(bi);
        }
        self.edge
    }

    /// The edge phase, once found.
    pub fn edge(&self) -> Option<usize> {
        self.edge
    }

    /// The vote histogram, one bin per period position in the bit.
    pub fn histogram(&self) -> &[u32] {
        &self.hist
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn noiseless_windows_hit_the_limits() {
        let w = vec![Cf64::new(2.0, 0.0); 20];
        assert!((nwpr_power_ratio(&w).unwrap() - 20.0).abs() < 1e-12);
        assert!(nwpr_cn0_from_ratio(20.0, 20, 1e-3).is_none());
        assert!((phase_lock_indicator(&w) - 1.0).abs() < 1e-12);
        let q = vec![Cf64::new(0.0, 2.0); 20];
        assert!((phase_lock_indicator(&q) + 1.0).abs() < 1e-12);
    }

    #[test]
    fn bit_sync_finds_a_clean_edge() {
        let mut bs = BitSync::new(20, BitSyncConfig::default());
        let mut edge = None;
        for k in 0..2000u64 {
            let bit = if ((k + 20 - 7) / 20) % 3 == 1 {
                -1.0
            } else {
                1.0
            };
            edge = bs.push(k, Cf64::new(bit, 0.0));
        }
        assert_eq!(edge, Some(7));
    }
}
