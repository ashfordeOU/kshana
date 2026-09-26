// SPDX-License-Identifier: AGPL-3.0-only
//! **The holdover prediction on a real crystal oscillator: conservative, and why.**
//!
//! `tests/slot_timing_cs5071a_holdout.rs` validates the fit-then-invert path on a caesium
//! standard. A smallsat flies crystal oscillators, not caesium, so this test runs the same
//! idea on a measured oven-controlled crystal oscillator (OCXO): 19 982 one-second
//! frequency readings of the 10 MHz OCXO in an HP impedance analyser, measured with a
//! Keysight 53230A counter against a hydrogen maser (A. Wallin, 2015, distributed with
//! `allantools`; fetch with `scripts/fetch_ocxo.sh`, pinned by commit and SHA-256).
//!
//! **Protocol.** Integrate the fractional frequency to phase. Fit a noise model and a
//! linear frequency drift on the first third. From a sync point every 97 s in the other
//! two thirds, estimate the frequency over the preceding 100 s and coast; measure where the
//! root-mean-square coast error reaches each of six thresholds from 0.2 to 10 ns. Predict
//! the same breaches from the fitted model, with the fix frequency uncertainty set to the
//! model's own Allan deviation at 100 s (`SlotConditions::fix_frequency_sigma`).
//!
//! **How the protocol was chosen, stated because it was not blind.** A first exploratory
//! run reused the caesium protocol (frequency from the preceding third, no frequency term)
//! and predicted breaches 1.4 to 2.5 times LATER than measured: optimistic. A crystal's
//! frequency wanders, so a frequency estimated hours earlier is stale and the model had no
//! term for it. The frequency term was added for that reason, and this protocol fixed,
//! before this test was written. The pass bar of the caesium test (a factor of 1.5) was
//! not moved.
//!
//! **What it finds.**
//!
//! 1. **Held out, the prediction is conservative but outside the 1.5 bar**: breaches are
//!    predicted at 0.59 to 0.70 of the measured time (first run of this test), never later. This oscillator's noise
//!    floor halved during the record (the Allan deviation of the first third flattens near
//!    7.5e-12, the rest near 3.5e-12), so a model fitted early over-predicts the noise. The
//!    test asserts the safety property (never optimistic) and a sanity floor, not the bar:
//!    **the crystal case is not validated**, and the ledger says so.
//! 2. **In sample, the inversion is right**: fitted on the evaluation segment itself, the
//!    predictions fall within the 1.5 bar (0.98 to 1.17 on the first run). The gap in (1) is the
//!    oscillator changing, not the inversion. This is a diagnostic, not a validation.
//! 3. **Control: without the frequency term the in-sample prediction is optimistic** at
//!    every threshold, so the term is load-bearing for a crystal.
//!
//! Without the record the test prints a skip notice and passes, unless
//! `KSHANA_REQUIRE_REALDATA=1` (the `realdata-clock` workflow), when a missing file fails.

use kshana::slot_timing::{slot_budget, ClockNoise, SlotConditions};

fn record_path() -> std::path::PathBuf {
    if let Ok(p) = std::env::var("KSHANA_OCXO_PATH") {
        return std::path::PathBuf::from(p);
    }
    std::path::Path::new(env!("CARGO_MANIFEST_DIR")).join("realdata-cache/ocxo/ocxo_frequency.txt")
}

/// Fractional frequency of each one-second reading of the 10 MHz output.
fn load_frequency() -> Option<Vec<f64>> {
    let text = std::fs::read_to_string(record_path()).ok()?;
    Some(
        text.lines()
            .map(str::trim)
            .filter(|l| !l.is_empty() && !l.starts_with('#'))
            .map(|l| (l.parse::<f64>().expect("frequency reading") - 1.0e7) / 1.0e7)
            .collect(),
    )
}

const THRESHOLDS_S: [f64; 6] = [0.2e-9, 0.5e-9, 1e-9, 2e-9, 5e-9, 10e-9];
const T_MAX: usize = 4_000;
const T_STEP: usize = 10;
const SYNC_STEP: usize = 97;
/// Window the sync estimates the frequency over (s).
const W_F: usize = 100;
const BAR: f64 = 1.5;

/// Least-squares slope of `y` against its index: the linear frequency drift (1/s).
fn drift_per_s(y: &[f64]) -> f64 {
    let n = y.len() as f64;
    let mt = (n - 1.0) / 2.0;
    let my = y.iter().sum::<f64>() / n;
    let (mut sxy, mut sxx) = (0.0, 0.0);
    for (i, &v) in y.iter().enumerate() {
        let d = i as f64 - mt;
        sxy += d * (v - my);
        sxx += d * d;
    }
    sxy / sxx
}

/// Fit the noise model and drift on `y`, with the phase `x` it integrates to.
fn fit(x: &[f64], y: &[f64]) -> ClockNoise {
    let mut n = ClockNoise::from_phase_record(x, 1.0).expect("fit");
    n.aging_per_day = drift_per_s(y).abs() * 86_400.0;
    n
}

fn predicted(noise: &ClockNoise, thr: f64, with_frequency_term: bool) -> f64 {
    let c = SlotConditions {
        guard_s: thr,
        k_sigma: 1.0,
        // The start of every coast is a measured phase, with the same jitter.
        fix_sigma_s: noise.white_pm_var.sqrt(),
        fix_frequency_sigma: if with_frequency_term {
            noise.allan_deviation(W_F as f64)
        } else {
            0.0
        },
        elapsed_since_sync_s: 0.0,
        fix_latency_s: 0.0,
        residual_frequency_offset: 0.0,
        temperature_excursion_k: 0.0,
    };
    slot_budget(noise, &c).unwrap().breach_after_sync_s
}

/// Root-mean-square coast error on the horizon grid, from syncs in `[from, x.len())`.
fn measured_rms(x: &[f64], from: usize) -> Vec<(f64, f64)> {
    let syncs: Vec<usize> = (from.max(W_F)..x.len() - T_MAX)
        .step_by(SYNC_STEP)
        .collect();
    assert!(syncs.len() >= 80, "too few sync points: {}", syncs.len());
    (1..=T_MAX / T_STEP)
        .map(|i| {
            let t = i * T_STEP;
            let ss: f64 = syncs
                .iter()
                .map(|&s| {
                    let y_hat = (x[s] - x[s - W_F]) / W_F as f64;
                    let e = x[s + t] - x[s] - y_hat * t as f64;
                    e * e
                })
                .sum();
            (t as f64, (ss / syncs.len() as f64).sqrt())
        })
        .collect()
}

fn measured_breach(curve: &[(f64, f64)], thr: f64) -> f64 {
    let mut prev = (0.0, 0.0);
    for &(t, r) in curve {
        if r >= thr {
            let f = (thr - prev.1) / (r - prev.1);
            return prev.0 + f * (t - prev.0);
        }
        prev = (t, r);
    }
    panic!("measured error never reached {thr:e} s within {T_MAX} s");
}

#[test]
fn ocxo_holdover_prediction_is_conservative_held_out_and_right_in_sample() {
    let Some(y) = load_frequency() else {
        assert!(
            std::env::var("KSHANA_REQUIRE_REALDATA").map_or(true, |v| v != "1"),
            "KSHANA_REQUIRE_REALDATA=1 but the OCXO record is missing at {}",
            record_path().display()
        );
        eprintln!(
            "SKIP: OCXO record not found at {} (run scripts/fetch_ocxo.sh)",
            record_path().display()
        );
        return;
    };
    assert_eq!(y.len(), 19_982, "unexpected OCXO record length");
    // Phase (s) at one-second spacing: x[0] = 0, x[k] = sum of the first k readings.
    let mut x = Vec::with_capacity(y.len() + 1);
    x.push(0.0);
    for &v in &y {
        let last = *x.last().unwrap();
        x.push(last + v);
    }
    let split = x.len() / 3;
    let curve = measured_rms(&x, split);

    // 1. Held out: fitted on the first third only.
    let early = fit(&x[..split], &y[..split]);
    eprintln!("held out   threshold_ns  predicted_s  measured_s  ratio");
    for &thr in &THRESHOLDS_S {
        let (p, m) = (predicted(&early, thr, true), measured_breach(&curve, thr));
        let r = p / m;
        eprintln!(
            "           {:>12.1}  {p:>11.0}  {m:>10.0}  {r:.3}",
            thr * 1e9
        );
        assert!(
            r <= 1.0,
            "held out at {thr:e} s the prediction is optimistic ({p:.0} s vs {m:.0} s)"
        );
        assert!(
            r >= 1.0 / 3.0,
            "held out at {thr:e} s the prediction is implausibly pessimistic (ratio {r:.3})"
        );
    }

    // 2. In sample: fitted on the evaluation segment itself.
    let late = fit(&x[split..], &y[split..]);
    eprintln!("in sample  threshold_ns  predicted_s  measured_s  ratio");
    for &thr in &THRESHOLDS_S {
        let (p, m) = (predicted(&late, thr, true), measured_breach(&curve, thr));
        let r = p / m;
        eprintln!(
            "           {:>12.1}  {p:>11.0}  {m:>10.0}  {r:.3}",
            thr * 1e9
        );
        assert!(
            (1.0 / BAR..=BAR).contains(&r),
            "in sample at {thr:e} s: ratio {r:.3} outside the bar {BAR}"
        );

        // 3. Control: the same in-sample model without the frequency term is optimistic.
        let p0 = predicted(&late, thr, false);
        assert!(
            p0 > m,
            "without the frequency term the prediction at {thr:e} s ({p0:.0} s) is not \
             optimistic against {m:.0} s, so the term would not be load-bearing"
        );
    }
}
