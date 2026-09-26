// SPDX-License-Identifier: AGPL-3.0-only
//! **Held-out validation of the holdover inversion on a real free-running clock.**
//!
//! `tests/cs5071a_reference.rs` validates the Allan-family *estimators* on 556 990
//! phase samples of a 5071A caesium primary standard measured against a hydrogen maser
//! (1 PPS into a 53230A time-interval counter, τ₀ = 1 s, February 2014; collected by
//! A. Wallin, distributed with `allantools`). With the maser as the reference, the same
//! record is also a holdover experiment: the caesium clock free-runs for 6.4 days and
//! its time error is measured every second.
//!
//! This test uses it to check the *inversion* built on the estimators, which nothing
//! else checks. It is a held-out prediction, not a fit to the answer:
//!
//! 1. **Fit** a noise model to the first third of the record only
//!    ([`kshana::slot_timing::ClockNoise::from_phase_record`]: the overlapping Allan
//!    deviation, fitted by weighted least squares in the white-PM and IEEE Std 1139
//!    frequency-modulation basis).
//! 2. **Predict**, from that model alone, the coast time at which the one-sigma time
//!    error reaches each of six thresholds from 0.5 ns to 2.5 ns
//!    ([`kshana::slot_timing::slot_budget`], k = 1).
//! 3. **Measure** the same thing on the other two thirds: from a sync point every 997 s,
//!    coast with the frequency estimated from the preceding third of a record (the
//!    endpoint difference, the optimal estimator for white FM), record the time error
//!    at each horizon, and take its root mean square across sync points. The measured
//!    breach is where that root mean square first reaches the threshold.
//!
//! **Pass bar, fixed before the Rust test first ran:** every predicted breach within a
//! factor of 1.5 of the measured one. A control shows the bar has teeth: the naive
//! prediction from the one-second Allan deviation alone, treated as white FM, misses by
//! orders of magnitude and fails it.
//!
//! The raw phase file is git-ignored third-party data; fetch it with
//! `scripts/fetch_cs5071a.sh` or point `KSHANA_CS5071A_PATH` at it. Without it the test
//! prints a skip notice and passes, unless `KSHANA_REQUIRE_REALDATA=1` (set by the
//! `realdata-clock` workflow, which fetches it first), when a missing file fails.

use kshana::slot_timing::{slot_budget, ClockNoise, NoiseSource, SlotConditions};

fn phase_path() -> std::path::PathBuf {
    if let Ok(p) = std::env::var("KSHANA_CS5071A_PATH") {
        return std::path::PathBuf::from(p);
    }
    std::path::Path::new(env!("CARGO_MANIFEST_DIR")).join("realdata-cache/cs5071a/5071A_phase.txt")
}

fn load_phase() -> Option<Vec<f64>> {
    let text = std::fs::read_to_string(phase_path()).ok()?;
    Some(
        text.lines()
            .map(str::trim)
            .filter(|l| !l.is_empty() && !l.starts_with('#'))
            .map(|l| l.parse::<f64>().expect("phase sample"))
            .collect(),
    )
}

/// Thresholds (s) the breach is predicted and measured for.
const THRESHOLDS_S: [f64; 6] = [0.5e-9, 0.75e-9, 1.0e-9, 1.5e-9, 2.0e-9, 2.5e-9];
/// Longest coast measured (s).
const T_MAX: usize = 80_000;
/// Horizon grid step (s).
const T_STEP: usize = 50;
/// Spacing of sync points (s); prime, so it aligns with no periodicity in the record.
const SYNC_STEP: usize = 997;
/// Largest allowed ratio between predicted and measured breach, either way.
const BAR: f64 = 1.5;

fn conditions(guard_s: f64, fix_sigma_s: f64) -> SlotConditions {
    SlotConditions {
        guard_s,
        k_sigma: 1.0,
        fix_sigma_s,
        // The protocol estimates frequency over the preceding third of a record, which for
        // a white-FM caesium standard is the optimal estimator and leaves a negligible
        // frequency error; the crystal-oscillator test needs this term, this one does not.
        fix_frequency_sigma: 0.0,
        elapsed_since_sync_s: 0.0,
        fix_latency_s: 0.0,
        residual_frequency_offset: 0.0,
        temperature_excursion_k: 0.0,
    }
}

/// Root-mean-square coast error at each horizon on the grid, over sync points in the
/// held-out segment `[split, n)`.
fn measured_rms(x: &[f64], split: usize) -> Vec<(f64, f64)> {
    let w = split; // frequency-estimation window: the preceding third
    let syncs: Vec<usize> = (split..x.len() - T_MAX).step_by(SYNC_STEP).collect();
    assert!(syncs.len() >= 200, "too few sync points: {}", syncs.len());
    (1..=T_MAX / T_STEP)
        .map(|i| {
            let t = i * T_STEP;
            let ss: f64 = syncs
                .iter()
                .map(|&s| {
                    let y_hat = (x[s] - x[s - w]) / w as f64;
                    let e = x[s + t] - x[s] - y_hat * t as f64;
                    e * e
                })
                .sum();
            (t as f64, (ss / syncs.len() as f64).sqrt())
        })
        .collect()
}

/// First horizon at which the measured curve reaches `thr`, linearly interpolated.
fn measured_breach(curve: &[(f64, f64)], thr: f64) -> Option<f64> {
    let mut prev = (0.0, 0.0);
    for &(t, r) in curve {
        if r >= thr {
            let f = (thr - prev.1) / (r - prev.1);
            return Some(prev.0 + f * (t - prev.0));
        }
        prev = (t, r);
    }
    None
}

#[test]
fn holdover_inversion_predicts_the_held_out_caesium_record() {
    let Some(x) = load_phase() else {
        assert!(
            std::env::var("KSHANA_REQUIRE_REALDATA").map_or(true, |v| v != "1"),
            "KSHANA_REQUIRE_REALDATA=1 but the Cs5071A phase file is missing at {}",
            phase_path().display()
        );
        eprintln!(
            "SKIP: Cs5071A phase file not found at {} (run scripts/fetch_cs5071a.sh)",
            phase_path().display()
        );
        return;
    };
    assert_eq!(x.len(), 556_990, "unexpected Cs5071A record length");
    let split = x.len() / 3;

    let noise = ClockNoise::from_phase_record(&x[..split], 1.0).expect("fit");
    assert!(matches!(noise.source, NoiseSource::Record { .. }));
    // The start of every coast is itself a measured phase, with the same jitter.
    let fix_sigma = noise.white_pm_var.sqrt();
    eprintln!(
        "fit on first third: sigma_PM {:.3e} s, q_wf {:.3e} s, flicker {:.3e}, q_rw {:.3e} /s",
        fix_sigma, noise.q_wf, noise.flicker, noise.q_rw
    );

    let curve = measured_rms(&x, split);
    eprintln!("threshold_ns  predicted_s  measured_s  ratio");
    for &thr in &THRESHOLDS_S {
        let predicted = slot_budget(&noise, &conditions(thr, fix_sigma))
            .unwrap()
            .breach_after_sync_s;
        let measured = measured_breach(&curve, thr)
            .unwrap_or_else(|| panic!("measured error never reached {thr:e} s in {T_MAX} s"));
        let ratio = predicted / measured;
        eprintln!(
            "{:>11.2}  {predicted:>11.0}  {measured:>10.0}  {ratio:.3}",
            thr * 1e9
        );
        assert!(
            (1.0 / BAR..=BAR).contains(&ratio),
            "threshold {thr:e} s: predicted breach {predicted:.0} s vs measured {measured:.0} s \
             (ratio {ratio:.3}, bar {BAR})"
        );
    }

    // Control: the naive prediction, the one-second Allan deviation read as white FM,
    // fails the same bar. Without this the bar could be too loose to fail anything.
    let a1 = kshana::allan::overlapping_adev(&x[..split], 1.0, 1);
    let naive = ClockNoise::from_ieee1139(0.0, 0.0, 2.0 * a1 * a1);
    let thr = 1.0e-9;
    let naive_breach = slot_budget(&naive, &conditions(thr, 0.0))
        .unwrap()
        .breach_after_sync_s;
    let measured = measured_breach(&curve, thr).unwrap();
    let naive_ratio = naive_breach / measured;
    eprintln!("control: naive white-FM-from-sigma_y(1 s) ratio at 1 ns = {naive_ratio:.3e}");
    assert!(
        !(1.0 / BAR..=BAR).contains(&naive_ratio),
        "the control passed the bar, so the bar cannot tell a good model from a bad one"
    );
}
