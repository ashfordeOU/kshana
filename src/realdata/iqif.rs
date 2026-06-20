// SPDX-License-Identifier: AGPL-3.0-only
//! Raw-IF (IQ) ingest: load sampled antenna IQ and run the SDR feature stage.
//!
//! TEXBAT and OAKBAT ship sampled antenna IQ, not correlator dumps, so this adapter
//! loads the raw samples and drives the [`crate::sdr`] front end (acquire -> track) to
//! produce the per-epoch Early/Prompt/Late correlator taps the SQM detector scores. As
//! with every adapter in this module, no physics is re-implemented here: it only
//! decodes the sample format and hands the IQ to the validated SDR pipeline.
//!
//! ## Sample formats
//!
//! Raw GNSS IF recordings are interleaved I,Q streams. The two common quantisations are
//! 8-bit and 16-bit signed integers (little-endian). TEXBAT/OAKBAT are 16-bit signed
//! I/Q at 25 Msps; many SDR captures (HackRF, bladeRF) are 8-bit. Pick the matching
//! [`IqFormat`]; the absolute scale is irrelevant to correlation.

use super::{Observation, Orient};
use crate::sdr::{self, CaCode, Cf64, CorrelatorDump, TrackConfig};

/// Interleaved I/Q sample quantisation of a raw IF file.
#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub enum IqFormat {
    /// 8-bit signed interleaved I,Q (e.g. HackRF, many SDR captures).
    Int8,
    /// 16-bit signed little-endian interleaved I,Q (TEXBAT, OAKBAT).
    Int16Le,
}

impl IqFormat {
    /// Bytes per complex sample (I + Q).
    pub fn bytes_per_sample(self) -> usize {
        match self {
            IqFormat::Int8 => 2,
            IqFormat::Int16Le => 4,
        }
    }
}

/// Decode a raw interleaved-IQ byte buffer into complex samples. A trailing partial
/// sample (fewer bytes than one I/Q pair) is ignored.
pub fn load_iq(bytes: &[u8], fmt: IqFormat) -> Vec<Cf64> {
    let step = fmt.bytes_per_sample();
    let n = bytes.len() / step;
    let mut out = Vec::with_capacity(n);
    match fmt {
        IqFormat::Int8 => {
            for c in bytes.chunks_exact(2) {
                out.push(Cf64::new(c[0] as i8 as f64, c[1] as i8 as f64));
            }
        }
        IqFormat::Int16Le => {
            for c in bytes.chunks_exact(4) {
                let i = i16::from_le_bytes([c[0], c[1]]) as f64;
                let q = i16::from_le_bytes([c[2], c[3]]) as f64;
                out.push(Cf64::new(i, q));
            }
        }
    }
    out
}

/// Configuration for the IF feature stage: front-end sample rate, intermediate
/// frequency, the acquisition Doppler search, and the tracking parameters.
#[derive(Clone, Copy, Debug)]
pub struct FeatureStageConfig {
    /// IQ sample rate (Hz).
    pub fs_hz: f64,
    /// Intermediate frequency (Hz); 0 for complex baseband.
    pub if_hz: f64,
    /// One-sided Doppler search range (Hz).
    pub doppler_max_hz: f64,
    /// Doppler search bin width (Hz).
    pub doppler_step_hz: f64,
    /// Acquisition peak-ratio detection threshold.
    pub acq_threshold: f64,
    /// Number of 1 ms epochs to track.
    pub n_epochs: usize,
    /// DLL/PLL loop and correlator geometry.
    pub track: TrackConfig,
}

impl FeatureStageConfig {
    /// A sensible default for a 25 Msps baseband capture (TEXBAT-like), tracking 1 s.
    pub fn texbat_like() -> Self {
        Self {
            fs_hz: 25_000_000.0,
            if_hz: 0.0,
            doppler_max_hz: 6000.0,
            doppler_step_hz: 250.0,
            acq_threshold: 2.5,
            n_epochs: 1000,
            track: TrackConfig::default(),
        }
    }
}

/// Acquire and track a single `prn` in `iq`, returning its per-epoch correlator dumps,
/// or `None` if the PRN does not acquire (no usable signal). Acquisition uses the first
/// 1 ms of samples.
pub fn dumps_for_prn(
    iq: &[Cf64],
    prn: u8,
    cfg: &FeatureStageConfig,
) -> Option<Vec<CorrelatorDump>> {
    let code = CaCode::new(prn)?;
    let spe = (cfg.fs_hz / 1000.0).round() as usize;
    if iq.len() < spe {
        return None;
    }
    let acq = sdr::acquire(
        &iq[..spe],
        &code,
        cfg.fs_hz,
        cfg.if_hz,
        cfg.doppler_max_hz,
        cfg.doppler_step_hz,
        cfg.acq_threshold,
    );
    if !acq.acquired {
        return None;
    }
    Some(sdr::track(
        iq,
        &code,
        &acq,
        cfg.fs_hz,
        cfg.if_hz,
        &cfg.track,
        cfg.n_epochs,
    ))
}

/// Map tracked correlator dumps to SQM [`Observation`]s (detector `sqm`, score =
/// Early-minus-Late imbalance, already rising with impairment so [`Orient::Raw`]).
pub fn sqm_observations(dumps: &[CorrelatorDump]) -> Vec<Observation> {
    dumps
        .iter()
        .map(|d| Observation::new("sqm", d.el_imbalance(), Orient::Raw))
        .collect()
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn int16_round_trips_through_the_loader() {
        // I,Q = (1000, -2000), (-3, 4): LE int16 interleaved.
        let mut bytes = Vec::new();
        bytes.extend_from_slice(&1000i16.to_le_bytes());
        bytes.extend_from_slice(&(-2000i16).to_le_bytes());
        bytes.extend_from_slice(&(-3i16).to_le_bytes());
        bytes.extend_from_slice(&4i16.to_le_bytes());
        let iq = load_iq(&bytes, IqFormat::Int16Le);
        assert_eq!(iq.len(), 2);
        assert_eq!(iq[0], Cf64::new(1000.0, -2000.0));
        assert_eq!(iq[1], Cf64::new(-3.0, 4.0));
    }

    #[test]
    fn int8_decodes_signed_and_ignores_trailing_partial_sample() {
        // bytes: (5,-6) then a stray single byte that must be dropped.
        let bytes = [5u8, 0xFA, 7u8];
        let iq = load_iq(&bytes, IqFormat::Int8);
        assert_eq!(iq.len(), 1);
        assert_eq!(iq[0], Cf64::new(5.0, -6.0)); // 0xFA = -6 as i8
    }

    #[test]
    fn end_to_end_synthetic_if_acquires_tracks_and_scores_low_sqm() {
        // Encode a clean synthetic L1 C/A signal as int16 IF bytes, then run the whole
        // adapter: load -> acquire -> track -> SQM. Clean signal must score low SQM.
        let prn = 21;
        let code = CaCode::new(prn).unwrap();
        let fs = 5_000_000.0;
        let if_hz = 50_000.0;
        let n_epochs = 30;
        let n = (fs / 1000.0) as usize * n_epochs;
        let sig = sdr::synth_if(
            &code,
            fs,
            if_hz + 900.0,
            sdr::CA_CHIP_RATE_HZ,
            256.0,
            1.0,
            n,
            0.05,
            3,
        );
        // Quantise to int16 LE interleaved.
        let mut bytes = Vec::with_capacity(n * 4);
        for s in &sig {
            let i = (s.re * 4000.0).round().clamp(-32768.0, 32767.0) as i16;
            let q = (s.im * 4000.0).round().clamp(-32768.0, 32767.0) as i16;
            bytes.extend_from_slice(&i.to_le_bytes());
            bytes.extend_from_slice(&q.to_le_bytes());
        }
        let iq = load_iq(&bytes, IqFormat::Int16Le);
        assert_eq!(iq.len(), n);

        let cfg = FeatureStageConfig {
            fs_hz: fs,
            if_hz,
            doppler_max_hz: 5000.0,
            doppler_step_hz: 250.0,
            acq_threshold: 2.0,
            n_epochs,
            track: TrackConfig::default(),
        };
        let dumps = dumps_for_prn(&iq, prn, &cfg).expect("clean signal must acquire");
        assert_eq!(dumps.len(), n_epochs);
        let obs = sqm_observations(&dumps);
        let settled = &obs[5..];
        let mean: f64 = settled.iter().map(|o| o.score).sum::<f64>() / settled.len() as f64;
        assert!(
            mean < 0.15,
            "clean end-to-end SQM mean {mean:.3} should be low"
        );
        assert!(obs.iter().all(|o| o.detector == "sqm"));
    }

    #[test]
    fn absent_prn_does_not_acquire() {
        let prn_tx = 21;
        let prn_absent = 5;
        let code = CaCode::new(prn_tx).unwrap();
        let fs = 5_000_000.0;
        let if_hz = 50_000.0;
        let n = (fs / 1000.0) as usize * 5;
        let sig = sdr::synth_if(
            &code,
            fs,
            if_hz + 900.0,
            sdr::CA_CHIP_RATE_HZ,
            256.0,
            1.0,
            n,
            0.05,
            3,
        );
        let mut bytes = Vec::with_capacity(n * 4);
        for s in &sig {
            let i = (s.re * 4000.0).round().clamp(-32768.0, 32767.0) as i16;
            let q = (s.im * 4000.0).round().clamp(-32768.0, 32767.0) as i16;
            bytes.extend_from_slice(&i.to_le_bytes());
            bytes.extend_from_slice(&q.to_le_bytes());
        }
        let iq = load_iq(&bytes, IqFormat::Int16Le);
        let cfg = FeatureStageConfig {
            fs_hz: fs,
            if_hz,
            doppler_max_hz: 5000.0,
            doppler_step_hz: 250.0,
            acq_threshold: 3.0,
            n_epochs: 5,
            track: TrackConfig::default(),
        };
        // PRN 5 is not present in a PRN-21 capture -> must not acquire.
        assert!(dumps_for_prn(&iq, prn_absent, &cfg).is_none());
    }
}
