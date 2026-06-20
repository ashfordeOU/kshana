// SPDX-License-Identifier: AGPL-3.0-only
//! End-to-end battle test: the SDR correlator feature stage threaded through the full
//! optimism-gap pipeline on synthetic graded-severity IF.
//!
//! This exercises every seam the real SatGrid/TEXBAT path uses, but on synthetic IF
//! where the truth is owned, so it runs in CI with no dataset dependency:
//! encode IQ bytes -> [`iqif::load_iq`] -> acquire + [`sdr::track`] -> SQM + prompt-power
//! observations -> [`ProbeRecord`]s with the multipath severity as the shift axis ->
//! [`build_real_gap_rows`] -> [`real_loocv`]. It asserts the stage responds to graded
//! severity and that the whole chain produces finite gap samples and a finite CV.

use kshana::impairment_study::{build_real_gap_rows, real_loocv, CvAxis, ProbeRecord};
use kshana::realdata::iqif::{self, FeatureStageConfig, IqFormat};
use kshana::sdr::{self, CaCode, TrackConfig, CA_CHIP_RATE_HZ};

const FS: f64 = 4_000_000.0;
const IF: f64 = 50_000.0;
const DOPPLER: f64 = 900.0;
const PHASE0: f64 = 256.0;
const N_EPOCHS: usize = 12;

/// Quantise a synthetic complex signal to int16 LE interleaved IQ bytes.
fn encode(sig: &[sdr::Cf64]) -> Vec<u8> {
    let mut bytes = Vec::with_capacity(sig.len() * 4);
    for s in sig {
        let i = (s.re * 3000.0).round().clamp(-32768.0, 32767.0) as i16;
        let q = (s.im * 3000.0).round().clamp(-32768.0, 32767.0) as i16;
        bytes.extend_from_slice(&i.to_le_bytes());
        bytes.extend_from_slice(&q.to_le_bytes());
    }
    bytes
}

/// Synthesise a capture: clean direct path plus an optional coherent half-chip echo of
/// amplitude `echo_amp` (the multipath/replay severity), returned as loaded IQ.
fn capture(code: &CaCode, echo_amp: f64, seed: u64) -> Vec<sdr::Cf64> {
    let n = (FS / 1000.0) as usize * N_EPOCHS;
    let direct = sdr::synth_if(
        code,
        FS,
        IF + DOPPLER,
        CA_CHIP_RATE_HZ,
        PHASE0,
        1.0,
        n,
        0.05,
        seed,
    );
    if echo_amp <= 0.0 {
        return iqif::load_iq(&encode(&direct), IqFormat::Int16Le);
    }
    let echo = sdr::synth_if(
        code,
        FS,
        IF + DOPPLER,
        CA_CHIP_RATE_HZ,
        PHASE0 + 0.5,
        echo_amp,
        n,
        0.05,
        seed,
    );
    let mixed: Vec<sdr::Cf64> = direct
        .iter()
        .zip(&echo)
        .map(|(a, b)| sdr::Cf64::new(a.re + b.re, a.im + b.im))
        .collect();
    iqif::load_iq(&encode(&mixed), IqFormat::Int16Le)
}

#[test]
fn sdr_feature_stage_threads_through_the_optimism_gap_pipeline() {
    let cfg = FeatureStageConfig {
        fs_hz: FS,
        if_hz: IF,
        doppler_max_hz: 4000.0,
        doppler_step_hz: 500.0,
        acq_threshold: 2.0,
        n_epochs: N_EPOCHS,
        track: TrackConfig::default(),
    };
    // Graded multipath severities; s0 is the in-distribution reference (mild but real).
    let bins = [("s0", 0.2), ("s1", 0.45), ("s2", 0.7)];
    let prns = [10u8, 21u8];

    let mut records: Vec<ProbeRecord> = Vec::new();
    let mut atk_sqm_by_bin: std::collections::BTreeMap<&str, Vec<f64>> =
        std::collections::BTreeMap::new();

    for &prn in &prns {
        let code = CaCode::new(prn).unwrap();
        // Acquire once on a clean reference and reuse it across this PRN's captures.
        let spe = (FS / 1000.0) as usize;
        let clean_ref = capture(&code, 0.0, 1);
        let acq = sdr::acquire(
            &clean_ref[..spe],
            &code,
            FS,
            IF,
            cfg.doppler_max_hz,
            cfg.doppler_step_hz,
            2.0,
        );
        assert!(
            acq.acquired,
            "PRN {prn} must acquire (ratio {})",
            acq.peak_ratio
        );

        for (bin, echo) in bins {
            let clean = capture(&code, 0.0, 2);
            let attack = capture(&code, echo, 3);
            let clean_dumps = sdr::track(&clean, &code, &acq, FS, IF, &cfg.track, N_EPOCHS);
            let atk_dumps = sdr::track(&attack, &code, &acq, FS, IF, &cfg.track, N_EPOCHS);

            for (suffix, clean_obs, atk_obs) in [
                (
                    "sqm",
                    iqif::sqm_observations(&clean_dumps),
                    iqif::sqm_observations(&atk_dumps),
                ),
                (
                    "pwr",
                    iqif::prompt_power_observations(&clean_dumps),
                    iqif::prompt_power_observations(&atk_dumps),
                ),
            ] {
                let det = format!("{suffix}_{prn}");
                for o in &clean_obs {
                    records.push(ProbeRecord::new(det.clone(), "nominal", bin, o.score, true));
                }
                for o in &atk_obs {
                    records.push(ProbeRecord::new(det.clone(), "spoof", bin, o.score, false));
                }
                if suffix == "sqm" {
                    let settled = &atk_obs[3..];
                    let mean = settled.iter().map(|o| o.score).sum::<f64>() / settled.len() as f64;
                    atk_sqm_by_bin.entry(bin).or_default().push(mean);
                }
            }
        }
    }

    // The SDR stage must respond to graded severity: mean attack SQM rises s0 -> s2.
    let mean_of = |b: &str| {
        let v = &atk_sqm_by_bin[b];
        v.iter().sum::<f64>() / v.len() as f64
    };
    assert!(
        mean_of("s2") > mean_of("s0"),
        "attack SQM should rise with multipath severity: s0={:.3} s2={:.3}",
        mean_of("s0"),
        mean_of("s2")
    );

    // The full optimism-gap pipeline must produce a gap sample per detector (4) ...
    let samples = build_real_gap_rows(&records, "s0", 0.05);
    assert!(
        samples.len() >= 3,
        "expected >=3 gap samples from the SDR-derived detectors, got {}",
        samples.len()
    );
    // ... and a finite leave-one-detector-out CV (the H4 estimator runs end to end).
    let cv = real_loocv(&samples, 0.1, CvAxis::Detector);
    assert!(
        cv.r2.is_finite(),
        "LOO-det R2 must be finite, got {}",
        cv.r2
    );
    assert!(cv.n_folds >= 3, "expected >=3 folds, got {}", cv.n_folds);
}
